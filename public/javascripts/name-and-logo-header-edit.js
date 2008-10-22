var NameAndLogoHeaderEdit = {
  init: function() {
    var headerEls = $$('div.app-name-and-logo-header');
    headerEls.each(function(headerEl) {
      aLink = headerEl.getElementsBySelector('.format-link a')[0];
      aLink.observe('click', function(ev) {
        var layoutInput = headerEl.getElementsBySelector('input.layout')[0];
        var layoutDiv = headerEl.getElementsBySelector('div.layout-spec')[0];
        if (layoutInput.value == 'hidden') {
          layoutInput.value = 'left';
          layoutDiv.removeClassName('layout-hidden');
          layoutDiv.addClassName('layout-left');
          aLink.update('Hide Title Text');
        }
        else {
          layoutInput.value = 'hidden';
          layoutDiv.removeClassName('layout-left');
          layoutDiv.addClassName('layout-hidden');
          aLink.update('Show Title Text');
        }
      });
      
      TS.Assets.Selector.register(headerEl);
    });
  }
}
NameAndLogoHeaderEdit.init();