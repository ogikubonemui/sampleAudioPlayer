// sampleAudioPlayer

import UIKit

// メディアを操作する機能をインポート
import AVFoundation

class ViewController: UIViewController,AVAudioPlayerDelegate {
    
    // 再生機器を用意
    var audioPlayer:AVAudioPlayer!
    
    // 再生リストを用意
    var musicList = ["music1","mucis2","music3"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func tapPlay(_ sender: Any) {
        // 再生する曲を決める
        let truckNum = Int.random(in: 0...2)
        // assetsから曲を取得
        let truck = NSDataAsset(name: musicList[truckNum])
        
        // do-cacth
        // doブロック内の処理でエラーが発生した場合
        // catchブロックに処理が移り、復旧できる
        // tryで実行不確実なものを記述する
        // 例えばCDプレイヤーにDVDをセットしてしまうとか
        do {
            // プレイヤーに曲のデータを渡す
            audioPlayer = try AVAudioPlayer (data: truck!.data, fileTypeHint: "mp3")
            // この画面でプレイヤーを利用する申請
            audioPlayer.delegate = self
            // プレイヤーの再生
            audioPlayer.play()
        } catch {
            print("Error: audio player cannot run")
        }
    }
    
    @IBAction func tapStop(_ sender: Any) {
        // プレイヤーの中身が空かチェック
        if let ap = audioPlayer {
            // プレイヤーが再生中かチェック
            if ap.isPlaying {
                // プレイヤーを停止する
                ap.stop()
            }
        }
        
    }
    
}

