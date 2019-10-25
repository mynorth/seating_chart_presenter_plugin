class GeotixSeatingChart {
  constructor(element) {
    console.log('\tSeatingChart');
    let data = JSON.parse(element.dataset.seatingOptions);
    let options = {
      divId: element.id,
      publicKey: data.public_key,
      event: data.event_id,
      pricing: data.pricing.to_json,
      availableCategories: data.available_categories,
      priceLevelsTooltipMessage: data.price_level_tooltip
    };
    new seatsio.SeatingChart(options).render();
  }
}

class GeotixSeatingDesigner {
  constructor(element) {
    console.log('\tSeatingDesigner');
    let data = JSON.parse(element.dataset.designerOptions);
    let options = {
      divId: element.id,
      designerKey: data.designer_key,
      chartKey: data.chart_key,
      language: data.language,
      openLatestDrawing: data.open_latest_drawing,
      features: {
        disabled: data.disabled,
        readOnly: data.readonly
      }
    };
    if (data.chart_key_input_id) {
      options.onChartCreated = function (chartKey) {
        document.querySelector('#'+data.chart_key_input_id).value = chartKey;
      }
    }
    if (data.show_on_update || data.hide_on_update) {
      options.onChartUpdated = function (chartKey) {
        if(data.show_on_update) {
          document.querySelector('#'+data.show_on_update).classList.remove('v-hidden');
        }
        if (data.hide_on_update) {
          document.querySelector('#'+data.hide_on_update).classList.add('v-hidden');
        }
      }
    }
    new seatsio.SeatingChartDesigner(options).render();
  }
}

class GeotixEventManager {
  constructor(element) {
    console.log('\tEventManager');
    let data = JSON.parse(element.dataset.managerOptions);
    new seatsio.EventManager({
      divId: element.id,
      secretKey: data.secret_key,
      event: data.event_id,
      mode: data.mode
    }).render();
  }
}