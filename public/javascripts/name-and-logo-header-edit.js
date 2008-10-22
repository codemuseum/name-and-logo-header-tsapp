var NameAndLogoHeaderEdit = {
  init: function() {
    var headerEls = $$('div.app-name-and-logo-header');
    headerEls.each(function(headerEl) {
      TS.Assets.Selector.register(headerEl);
    });
  }
}
NameAndLogoHeaderEdit.init();