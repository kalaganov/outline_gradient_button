
![wow](https://user-images.githubusercontent.com/15782257/71815946-bbf0e180-3089-11ea-9d00-10e05c308bea.png)

## Example

Take a look at the provided [example](https://github.com/kalaganov/outline_gradient_button/blob/master/example/main.dart) for how to use the OutlineGradientButton.

## How to use
![demo_button1](https://user-images.githubusercontent.com/15782257/71816114-41749180-308a-11ea-8673-dbd55cfdc940.png)
```dart
OutlineGradientButton(
  child: Text('WOW'),
  gradient: LinearGradient(
    colors: [Colors.purple, Colors.pink],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  ),
  strokeWidth: 4,
),
```
--------
![demo_button2](https://user-images.githubusercontent.com/15782257/71816200-88628700-308a-11ea-8890-039ce04e5adf.png)
```dart
OutlineGradientButton(
  child: Text('TEXT'),
  gradient: LinearGradient(colors: [Colors.pink, Colors.purple]),
  strokeWidth: 4,
  radius: Radius.circular(8),
),
```
--------
![demo_button3](https://user-images.githubusercontent.com/15782257/71816269-bba51600-308a-11ea-876b-2577172b5a91.png)
```dart
OutlineGradientButton(
  child: Text('OMG'),
  gradient: LinearGradient(
    stops: [0, 0.5, 0.5, 1],
    colors: [Colors.green, Colors.green, Colors.red, Colors.red],
  ),
  strokeWidth: 4,
  corners: Corners(topLeft: Radius.elliptical(16, 14), bottomRight: Radius.circular(6)),
),
```
--------
![demo_button4](https://user-images.githubusercontent.com/15782257/71816322-ec854b00-308a-11ea-8444-f3cab9d58054.png)
```dart
OutlineGradientButton(
  child: SizedBox(
    width: 52,
    height: 52,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(Icons.opacity, color: Colors.grey, size: 24),
        Text('TEXT', style: TextStyle(fontSize: 9)),
      ],
    ),
  ),
  gradient: LinearGradient(
    colors: [Colors.blue, Colors.black],
    begin: Alignment(-1, -1),
    end: Alignment(2, 2),
  ),
  strokeWidth: 4,
  padding: EdgeInsets.zero,
  radius: Radius.circular(26),
),
```
--------
![demo_button5](https://user-images.githubusercontent.com/15782257/71816465-59004a00-308b-11ea-82d6-74845de61835.png)
```dart
OutlineGradientButton(
  child: Text('Linear gradient', style: TextStyle(color: Colors.black, fontSize: 10)),
  gradient: LinearGradient(
    colors: List.generate(360, (h) => HSLColor.fromAHSL(1, h.toDouble(), 1, 0.5).toColor()),
  ),
  strokeWidth: 2,
  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
  radius: Radius.circular(8),
),
```
--------
![demo_button6](https://user-images.githubusercontent.com/15782257/71816560-af6d8880-308b-11ea-801b-d25d82526ae2.png)
```dart
OutlineGradientButton(
  child: Text('Sweep gradient', style: TextStyle(color: Colors.black, fontSize: 10)),
  gradient: SweepGradient(
    colors: List.generate(360, (h) => HSLColor.fromAHSL(1, h.toDouble(), 1, 0.5).toColor()),
  ),
  strokeWidth: 2,
  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
  radius: Radius.circular(8),
),
```
--------
![demo_button7](https://user-images.githubusercontent.com/15782257/71816617-e0e65400-308b-11ea-987c-d9ea80a21bda.png)
```dart
OutlineGradientButton(
  child: Text('With background color and elevation', style: TextStyle(color: Colors.white, fontSize: 12)),
  gradient: LinearGradient(colors: [Colors.greenAccent, Colors.yellow]),
  strokeWidth: 2,
  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
  corners: Corners(topRight: Radius.circular(16), bottomRight: Radius.circular(16)),
  backgroundColor: Colors.lightBlue,
  elevation: 4,
  inkWell: true,
  onTap: () => showSnack('onTap'),
  onDoubleTap: () => showSnack('onDoubleTap'),
  onLongPress: () => showSnack('onLongPress'),
),
```
