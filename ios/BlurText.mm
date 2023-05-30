#import "BlurText.h"

#import <react/renderer/components/BlurTextSpecs/ComponentDescriptors.h>
#import <react/renderer/components/BlurTextSpecs/EventEmitters.h>
#import <react/renderer/components/BlurTextSpecs/Props.h>
#import <react/renderer/components/BlurTextSpecs/RCTComponentViewHelpers.h>

#import "RCTFabricComponentsPlugins.h"

using namespace facebook::react;

@interface BlurText () <RCTBlurTextViewProtocol>
@end

@implementation BlurText {
  UIView *_view;
  UILabel *_label;
}

+ (ComponentDescriptorProvider)componentDescriptorProvider
{
  return concreteComponentDescriptorProvider<BlurTextComponentDescriptor>();
}

- (instancetype)initWithFrame:(CGRect)frame
{
  if (self = [super initWithFrame:frame]) {
    static const auto defaultProps = std::make_shared<const BlurTextProps>();
    _props = defaultProps;

    _view = [[UIView alloc] init];
    _view.backgroundColor = [UIColor redColor];

    _label = [[UILabel alloc] init];
    _label.text = @"Initial value";
    [_view addSubview:_label];

    _label.translatesAutoresizingMaskIntoConstraints = false;
    [NSLayoutConstraint activateConstraints:@[
      [_label.leadingAnchor constraintEqualToAnchor:_view.leadingAnchor],
      [_label.topAnchor constraintEqualToAnchor:_view.topAnchor],
      [_label.trailingAnchor constraintEqualToAnchor:_view.trailingAnchor],
      [_label.bottomAnchor constraintEqualToAnchor:_view.bottomAnchor],
    ]];

    _label.textAlignment = NSTextAlignmentCenter;

    self.contentView = _view;
  }

  return self;
}

- (void)updateProps:(Props::Shared const &)props oldProps:(Props::Shared const &)oldProps
{
  const auto &oldViewProps = *std::static_pointer_cast<BlurTextProps const>(_props);
  const auto &newViewProps = *std::static_pointer_cast<BlurTextProps const>(props);

  if (oldViewProps.text != newViewProps.text) {
    _label.text = [[NSString alloc] initWithCString:newViewProps.text.c_str() encoding:NSASCIIStringEncoding];
  }

  [super updateProps:props oldProps:oldProps];
}

@end

Class<RCTComponentViewProtocol> BlurTextCls(void)
{
  return BlurText.class;
}
