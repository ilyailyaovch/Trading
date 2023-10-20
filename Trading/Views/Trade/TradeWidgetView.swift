import SwiftUI
import WebKit

struct TradeWidgetView: UIViewRepresentable {

    @Binding var selectedCurrency: String
    typealias UIViewType = WKWebView

    func makeUIView(context: Context) -> WKWebView {
        let config = WKWebViewConfiguration()
        let webView = WKWebView(frame: .zero, configuration: config)
        return webView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        let htmlString = """
        <div class="tradingview-widget-container"style="height:105%;width:106%;margin:-8">
        <div id="tradingview_13cbc" style="height:106%;width:105%"></div>
        <div class="tradingview-widget-copyright">
        <a href="https://www.tradingview.com/" rel="noopener nofollow" target="_blank">
        </a></div>
        <script type="text/javascript" src="https://s3.tradingview.com/tv.js"></script>
        <script type="text/javascript">
        new TradingView.widget(
        {
        "autosize": true,
        "symbol": "FX:\(selectedCurrency)",
        "interval": "30",
        "timezone": "Etc/UTC",
        "theme": "dark",
        "style": "1",
        "locale": "en",
        "enable_publishing": false,
        "backgroundColor": "rgba(28, 31, 45, 1)",
        "hide_top_toolbar": true,
        "hide_legend": true,
        "save_image": false,
        "hide_volume": true,
        "container_id": "tradingview_13cbc"
        });
        </script>
        </div>
        """
        uiView.loadHTMLString(htmlString, baseURL: nil)
    }
}

#Preview {
//    TradeWidgetView(selectedCurrency: "EURUSD")
    TradeWidgetView(selectedCurrency: .constant("EURUSD"))
}
