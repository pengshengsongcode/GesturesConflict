> 同一视图添加单双击手势时，操作双击的话，会走单击和双击两次回调

```
同一视图添加手势
        let tap1 = UITapGestureRecognizer.init(target: self, action: #selector(singleTap(_:)))
        self.tap1 = tap1
        tap1.numberOfTapsRequired = 1
        tap1.delegate = self
        testView.addGestureRecognizer(tap1)
        
        let tap2 = UITapGestureRecognizer.init(target: self, action: #selector(doubleTap(_:)))
        self.tap2 = tap2
        tap2.numberOfTapsRequired = 2
        tap2.delegate = self
        testView.addGestureRecognizer(tap2)

```

# 第一种 - 苹果官方
```
        tap1.require(toFail: tap2)
```
# 第二种 - 手动延时处理
```
    @objc func singleTap(_ g: UITapGestureRecognizer) {
        self.perform(#selector(realSingleTap), with: self, afterDelay: 0.25)
    }
    @objc func realSingleTap(_ g: UITapGestureRecognizer) {
        print("单击手势")
    }

    @objc func doubleTap(_ g: UITapGestureRecognizer) {
        NSObject.cancelPreviousPerformRequests(withTarget: self)
        print("双击手势")
    }
```


> 更建议使用第二种方式，因为可以开发者手动设置延时，苹果官方的延时时长过长了
