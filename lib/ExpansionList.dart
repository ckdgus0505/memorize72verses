import 'package:flutter/material.dart';

class ExpansionList extends StatefulWidget {

  @override
  _ExpansionListState createState() => _ExpansionListState();
}

class _ExpansionListState extends State<ExpansionList> {

  List<Item> _data = generateItems(10);

  Widget _buildListPanel() {
    return ExpansionPanelList(
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          _data[index].isExpanded = !isExpanded;
        });
      },
      children: _data.map<ExpansionPanel>((Item item) {
        return ExpansionPanel(
            headerBuilder: (BuildContext context, bool isExpanded) {
              return ListTile(
                title: Text(item.headerValue),
                subtitle: Text('상'),
              );
            },
            body: ListTile(
              title: Text(item.expandedValue),
              subtitle: Text('To delete this panel, tap the trash can icon'),
            ),

            isExpanded: item.isExpanded
        );
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('암송'),
      ),
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) =>
            CategoryItem(AtoF[index]),
        itemCount: AtoF.length,
      ),
    );
  }
}


class Item {
  String expandedValue;
  String headerValue;
  bool isExpanded;

  Item({this.expandedValue, this.headerValue, this.isExpanded = false});
}

List<Item> generateItems(int numberOfItems) {
  return List.generate(numberOfItems, (index) {
    return Item(
      headerValue: 'Panel $index',
      expandedValue: 'This is item number $index'
    );
  });
}


class Category {
  Category(this.title, this.subtitle, [this.children = const <Content>[]]);
  final String title;
  final String subtitle;
  final List<Content> children;
}

class Content {
  Content(this.number, this.address, this.content);
  final String number;
  final String address;
  final String content;
}

final List<Category> AtoF = <Category>[
  Category('A', '새로운 삶', <Content>[
    Content('1. 중심되신 그리스도', '고린도후서 5:17', '그런즉 누구든지 그리스도 안에 있으면 새로운 피조물이라 이전 것은 지나갔으니 보라 새 것이 되었도다'),
    Content('2. 중심되신 그리스도', '갈라디아서 2:20', '내가 그리스도와 함께 십자가에 못 박혔나니 그런즉 이제는 내가 사는 것이 아니요 오직 내 안에 그리스도께서 사시는 것이라 이제 내가 육체 가운데 사는 것은 나를 사랑하사 나를 위하여 자기 자신을 버리신 하나님의 아들을 믿는 믿음 안에서 사는 것이라'),
    Content('3. 그리스도께 순종', '로마서 12:1', '그러므로 형제들아 내가 하나님의 모든 자비하심으로 너희를 권하노니 너희 몸을 하나님이 기뻐하시는 거룩한 산 제물로 드리라 이는 너희가 드릴 영적 예배니라'),
    Content('4. 그리스도께 순종', '요한복음 14:21', '나의 계명을 지키는 자라야 나를 사랑하는 자니 나를 사랑하는 자는 내 아버지께 사랑을 받을 것이요 나도 그를 사랑하여 그에게 나를 나타내리라'),
    Content('5. 말씀', '디모데후서 3:16', '모든 성경은 하나님의 감동으로 된 것으로 교훈과 책망과 바르게 함과 의로 교육하기에 유익하니'),
    Content('6. 말씀', '여호수아 1:8', '이 율법책을 네 입에서 떠나지 말게 하며 주야로 그것을 묵상하여 그 안에 기록된 대로 다 지켜 행하라 그리하면 네 길이 평탄하게 될 것이며 네가 형통하리라'),
    Content('7. 기도', '요한복음 15:7', '너희가 내 안에 거하고 내 말이 너희 안에 거하면 무엇이든지 원하는 대로 구하라 그리하면 이루리라'),
    Content('8. 기도', '빌립보서 4:6,7', '아무것도 염려하지 말고 다만 모든 일에 기도와 간구로 너희 구할 것을 감사함으로 하나님께 아뢰라 그리하면 모든 지각에 뛰어난 하나님의 평강이 그리스도 예수 안에서 너희 마음과 생각을 지키시리라'),
    Content('9. 교제', '마태복음 18:20', '두세 사람이 내 이름으로 모인 곳에는 나도 그들 중에 있느니라'),
    Content('10. 교제', '히브리서 10:24,25', '서로 돌아보아 사랑과 선행을 격려하며 모이기를 폐하는 어떤 사람들의 습관과 같이 하지 말고 오직 권하여 그날이 가까움을 볼수록 더욱 그리하자'),
    Content('11. 증거', '마태복음 4:19', '말씀하시되 나를 따라 오라 내가 너희를 사람을 낚는 어부가 되게 하리라 하시니'),
    Content('12. 증거', '로마서 1:16', '내가 복음을 부끄러워하지 아니하노니 이 복음은 모든 믿는 자에게 구원을 주시는 하나님의 능력이 됨이라 먼저는 유대인에게요 그리고 헬라인에게로다'),
  ],),
  Category('B', '그리스도를 전파함', <Content>[
    Content('1. 모든 사람이 죄를 범함', '로마서 3:23', '모든 사람이 죄를 범하였으매 하나님의 영광에 이르지 못하더니'),
    Content('2. 모든 사람이 죄를 범함', '이사야 53:6', '우리는 다 양 같아서 그릇 행하여 각기 제 길로 갔거늘 여호와께서는 우리 모두의 죄악을 그에게 담당시키셨도다'),
    Content('3. 죄의 형벌', '로마서 6:23', '죄의 삯은 사망이요 하나님의 은사는 그리스도 예수 우리 주 안에 있는 영생이니라'),
    Content('4. 죄의 형벌', '히브리서 9:27', '한 번 죽는 것은 사람에게 정해진 것이요 그 후에는 심판이 있으리니'),
    Content('5. 그리스도가 형벌을 받음', '로마서 5:8', '우리가 아직 죄인 되었을 때에 그리스도께서 우리를 위하여 죽으심으로 하나님께서 우리에 대한 자기의 사랑을 확증하셨느니라'),
    Content('6. 그리스도가 형벌을 받음', '베드로전서 3:18', '그리스도께서도 단번에 죄를 위하여 죽으사 의인으로서 불의한 자를 대신하셨으니 이는 우리를 하나님 앞으로 인도하려 하심이라 육체로는 죽임을 당하시고 영으로는 살리심을 받으셨으니'),
    Content('7. 선행으로 구원받지 못함', '에베소서 2:8,9', '너희는 그 은혜에 의하여 믿음으로 말미암아 구원을 받았으니 이것은 너희에게서 난 것이 아니요 하나님의 선물이라 행위에서 난 것이 아니니 이는 누구든지 자랑하지 못하게 함이라'),
    Content('8. 선행으로 구원받지 못함', '디도서 3:5', '우리를 구원하시되 우리가 행한바 의로운 행위로 말미암지 아니하고 오직 그의 긍휼하심을 따라 중생의 씻음과 성령의 새롭게 하심으로 하셨나니'),
    Content('9. 그리스도를 모셔야 함', '요한복음 1:12', '영접하는 자 곧 그 이름을 믿는 자들에게는 하나님의 자녀가 되는 권세를 주셨으니'),
    Content('10. 그리스도를 모셔야 함', '요한계시록 3:20', '볼지어다 내가 문밖에 서서 두드리노니 누구든지 내 음성을 듣고 문을 열면 내가 그에게로 들어가 그와 더불어 먹고 그는 나와 더불어 먹으리라'),
    Content('11. 구원의 확신', '요한일서 5:13', '내가 하나님의 아들의 이름을 믿는 너희에게 이것을 쓰는 것은 너희로 하여금 너희에게 영생이 있음을 알게 하려 함이라'),
    Content('12. 구원의 확신', '요한복음 5:24', '내가 진실로 진실로 너희에게 이르노니 내 말을 듣고 또 나 보내신 이를 믿는 자는 영생을 얻었고 심판에 이르지 아니하나니 사망에서 생명으로 옮겼느니라'),
  ],),
  Category('C', '하나님을 의뢰함', <Content>[
    Content('1. 성령', '고린도전서 3:16', '너희는 너희가 하나님의 성전인 것과 하나님의 성령이 너희 안에 계시는 것을 알지 못하느냐'),
    Content('2. 성령', '고린도전서 2:12', '우리가 세상의 영을 받지 아니하고 오직 하나님으로부터 온 영을 받았으니 이는 우리로 하여금 하나님께서 우리에게 은혜로 주신 것들을 알게하려 하심이라'),
    Content('3. 능력', '이사야 41:10', '두려워하지 말라 내가 너와 함께 함이라 놀라지 말라 나는 네 하나님이 됨이라 내가 너를 굳세게 하리라 참으로 너를 도와 주리라 참으로 나의 의로운 오른손으로 너를 붙들리라'),
    Content('4. 능력', '빌립보서 4:13', '내게 능력 주시는 자 안에서 내가 모든 것을 할 수 있느니라'),
    Content('5. 성실', '예레미야애가 3:22,23', '여호와의 인자와 긍휼이 무궁하시므로 우리가 진멸되지 아니함이니이다 이것들이 아침마다 새로우니 주의 성실하심이 크시도소이다'),
    Content('6. 성실', '민수기 23:19', '하나님은 사람이 아니시니 거짓말을 하지 않으시고 인생이 아니시니 후회가 없으시도다 어찌 그 말씀하신 바를 행하지 않으시며 하신 말씀을 실행하지 않으시랴'),
    Content('7. 평안', '이사야 26:3', '주께서 심지가 견고한 자를 평강하고 평강하도록 지키시리니 이는 그가 주를 신뢰함이니이다'),
    Content('8. 평안', '베드로전서 5:7', '너희 염려를 다 주께 맡기라 이는 그가 너희를 돌보심이라'),
    Content('9. 공급', '로마서 8:32', '자기 아들을 아끼지 아니하시고 우리 모든 사람을 위하여 내주신 이가 어찌 그 아들과 함께 모든 것을 우리에게 주시지 아니하겠느냐'),
    Content('10. 공급', '빌립보서 4:19', '나의 하나님이 그리스도 예수 안에서 영광 가운데 그 풍성한 대로 너희 모든 쓸 것을 채우시리라'),
    Content('11. 유혹에서 도우심', '히브리서 2:18', '그가 시험을 받아 고난을 당하셨은즉 시험받는 자들을 능히 도우실 수 있느니라'),
    Content('12. 유혹에서 도우심', '시편 119:9,11', '청년이 무엇으로 그의 행실을 깨끗하게 하리이까 주의 말씀만 지킬 따름이니이다 내가 주께 범죄하지 아니하려 하여 주의 말씀을 내 마음에 두었나이다'),
  ],),
  Category('D', '그리스도 제자의 자격', <Content>[
    Content('1. 그리스도를 첫자리에 모심', '마태복음 6:33', '그런즉 너희는 먼저 그의 나라와 그의 의를 구하라 그리하면 이 모든 것을 너희에게 더하시리라'),
    Content('2. 그리스도를 첫자리에 모심', '누가복음 9:23', '또 무리에게 이르시되 아무든지 나를 따라 오려거든 자기를 부인하고 날마다 제 십자가를 지고 나를 따를 것이니라'),
    Content('3. 죄에서 떠남', '요한일서 2:15,16', '이 세상이나 세상에 있는 것들을 사랑하지 말라 누구든지 세상을 사랑하면 아버지의 사랑이 그 안에 있지 아니하니 이는 세상에 있는 모든 것이 육신의 정욕과 안목의 정욕과 이생의 자랑이니 다 아버지께로부터 온 것이 아니요 세상으로부터 온 것이라'),
    Content('4. 죄에서 떠남', '로마서 12:2', '너희는 이 세대를 본받지 말고 오직 마음을 새롭게 함으로 변화를 받아 하나님의 선하시고 기뻐하시고 온전하신 뜻이 무엇인지 분별하도록 하라'),
    Content('5. 견고함', '고린도전서 15:58', '그러므로 내 사랑하는 형제들아 견실하며 흔들리지 말고 항상 주의 일에 더욱 힘쓰는 자들이 되라 이는 너희 수고가 주 안에서 헛되지 않은 줄 앎이라'),
    Content('6. 견고함', '히브리서 12:3', '너희가 피곤하여 낙심하지 않기 위하여 죄인들이 이같이 자기에게 거역한 일을 참으신 이를 생각하라'),
    Content('7. 다른 사람을 섬김', '마가복음 10:45', '인자가 온 것은 섬김을 받으려 함이 아니라 도리어 섬기려 하고 자기 목숨을 많은 사람의 대속물로 주려 함이니라'),
    Content('8. 다른 사람을 섬김', '고린도후서 4:5', '우리는 우리를 전파하는 것이 아니라 오직 그리스도 예수의 주 되신 것과 또 예수를 위하여 우리가 너희의 종 된 것을 전파함이라'),
    Content('9. 후히 드릴 것', '잠언 3:9,10', '네 재물과 네 소산물의 처음 익은 열매로 여호와를 공경하라 그리하면 네 창고가 가득히 차고 네 포도즙 틀에 새 포도즙이 넘치리라'),
    Content('10. 후히 드릴 것', '고린도후서 9:6,7', '이것이 곧 적게 심는 자는 적게 거두고 많이 심는 자는 많이 거둔다 하는 말이로다 각각 그 마음에 정한 대로 할 것이요 인색함으로나 억지로 하지 말지니 하나님은 즐겨 내는 자를 사랑하시느니라'),
    Content('11. 세계 비전', '사도행전 1:8', '오직 성령이 너희에게 임하시면 너희가 권능을 받고 예루살렘과 온 유대와 사마리아와 땅끝까지 이르러 내 증인이 되리라 하시니라'),
    Content('12. 세계 비전', '마태복음 28:19,20', '그러므로 너희는 가서 모든 민족을 제자로 삼아 아버지와 아들과 성령의 이름으로 세례를 베풀고 내가 너희에게 분부한 모든 것을 가르쳐 지키게 하라 볼지어다 내가 세상 끝날까지 너희와 항상 함께 있으리라 하시니라'),
  ],),
  Category('E', '그리스도를 닮아감', <Content>[
    Content('1. 사랑', '요한복음 13:34,35', '새 계명을 너희에게 주노니 서로 사랑하라 내가 너희를 사랑한 것같이 너희도 서로 사랑하라 너희가 서로 사랑하면 이로써 모든 사람이 너희가 내 제자인 줄 알리라'),
    Content('2. 사랑', '요한일서 3:18', '자녀들아 우리가 말과 혀로만 사랑하지 말고 행함과 진실함으로 하자'),
    Content('3. 겸손', '빌립보서 2:3,4', '아무 일에든지 다툼이나 허영으로 하지 말고 오직 겸손한 마음으로 각각 자기보다 남을 낫게 여기고 각각 자기 일을 돌볼 뿐더러 또한 각각 다른 사람들의 일을 돌보아 나의 기쁨을 충만하게 하라'),
    Content('4. 겸손', '베드로전서 5:5,6', '젊은 자들아 이와 같이 장로들에게 순종하고 다 서로 겸손으로 허리를 동이라 하나님은 교만한 자를 대적하시되 겸손한 자들에게는 은혜를 주시느니라 그러므로 하나님의 능하신 손아래에서 겸손하라 때가 되면 너희를 높이시리라'),
    Content('5. 순결', '에베소서 5:3', '음행과 온갖 더러운 것과 탐욕은 너희 중에서 그 이름조차도 부르지 말라 이는 성도에게 마땅한 바니라'),
    Content('6. 순결', '베드로전서 2:11', '사랑하는 자들아 거류민과 나그네 같은 너희를 권하노니 영혼을 거슬러 싸우는 육체의 정욕을 제어하라'),
    Content('7. 정직', '레위기 19:11', '너희는 도둑질하지 말며 속이지 말며 서로 거짓말하지 말며'),
    Content('8. 정직', '사도행전 24:16', '이것으로 말미암아 나도 하나님과 사람에 대하여 항상 양심에 거리낌이 없기를 힘쓰나이다'),
    Content('9. 믿음', '히브리서 11:6', '믿음이 없이는 하나님을 기쁘시게 하지 못하나니 하나님께 나아가는 자는 반드시 그가 계신 것과 또한 그가 자기를 찾는 자들에게 상 주시는 이심을 믿어야 할지니라'),
    Content('10. 믿음', '로마서 4:20,21', '믿음이 없어 하나님의 약속을 의심하지 않고 믿음으로 견고하여져서 하나님께 영광을 돌리며 약속하신 그것을 또한 능히 이루실 줄을 확신하였으니'),
    Content('11. 선행', '갈라디아서 6:9,10', '우리가 선을 행하되 낙심하지 말지니 포기하지 아니하면 때가 이르매 거두리라 그러므로 우리는 기회 있는 대로 모든 이에게 착한 일을 하되 더욱 믿음의 가정들에게 할지니라'),
    Content('12. 선행', '마태복음 5:16', '이같이 너희 빛이 사람 앞에 비치게 하여 그들로 너희 착한 행실을 보고 하늘에 계신 너희 아버지께 영광을 돌리게 하라'),
  ],),
  Category('F', '온전한 인격', <Content>[
    Content('1. 사고의 온전함', '로마서 8:5,6', '육신을 따르는 자는 육신의 일을, 영을 따르는 자는 영의 일을 생각하나니  육신의 생각은 사망이요 영의 생각은 생명과 평안이니라'),
    Content('2. 사고의 온전함', '고린도후서 10:5', '하나님 아는 것을 대적하여 높아진 것을 다 무너뜨리고 모든 생각을 사로잡아 그리스도에게 복종하게 하니'),
    Content('3. 감정의 온전함', '요한복음 15:11', '내가 이것을 너희에게 이름은 내 기쁨이 너희 안에 있어 너희 기쁨을 충만하게 하려 함이라'),
    Content('4. 감정의 온전함', '골로새서 3:16', '그리스도의 말씀이 너희 속에 풍성히 거하여 모든 지혜로 피차 가르치며 권면하고 시와 찬송과 신령한 노래를 부르며 감사하는 마음으로 하나님을 찬양하고'),
    Content('5. 의지의 온전함', '로마서 14:7,8', '우리 중에 누구든지 자기를 위하여 사는 자가 없고 자기를 위하여 죽는 자도 없도다. 우리가 살아도 주를 위하여 살고 죽어도 주를 위하여 죽나니 그러므로 사나 죽으나 우리가 주의 것이로다'),
    Content('6. 의지의 온전함', '골로새서 2:6,7', '그러므로 너희가 그리스도 예수를 주로 받았으니 그 안에서 행하되 그 안에 뿌리를 박으며 세움을 받아 교훈을 받은 대로 믿음에 굳게 서서 감사함을 넘치게 하라'),
    Content('7. 관계의 온전함', '마태복음 7:12', '그러므로 무엇이든지 남에게 대접을 받고자 하는 대로 너희도 남을 대접하라 이것이 율법이요 선지자니라'),
    Content('8. 관계의 온전함', '마태복음 22:37~39', '예수께서 이르시되 네 마음을 다하고 목숨을 다하고 뜻을 다하여 주 너의 하나님을 사랑하라 하셨으니 이것이 크고 첫째 되는 계명이요 둘째도 그와 같으니 네 이웃을 네 자신 같이 사랑하라 하셨으니'),
    Content('9. 행실의 온전함', '고린도후서 5:10', '이는 우리가 다 반드시 그리스도의 심판대 앞에 나타나게 되어 각각 선악간에 그 몸으로 행한 것을 따라 받으려 함이라'),
    Content('10. 행실의 온전함', '빌립보서 2:13,14', '너희 안에서 행하시는 이는 하나님이시니 자기의 기쁘신 뜻을 위하여 너희에게 소원을 두고 행하게 하시나니 모든 일을 원망과 시비가 없이 하라'),
    Content('11. 온전함을 사모함', '베드로전서 5:10', '모든 은혜의 하나님 곧 그리스도 안에서 너희를 부르사 자기의 영원한 영광에 들어가게 하신 이가 잠깐 고난을 당한 너희를 친히 온전하게 하시며 굳건하게 하시며 강하게 하시며 터를 견고하게 하시리라'),
    Content('12. 온전함을 사모함', '골로새서 1:28,29', '우리가 그를 전파하여 각 사람을 권하고 모든 지혜로 각 사람을 가르침은 각 사람을 그리스도 안에서 완전한 자로 세우려 함이니 이를 위하여 나도 내 속에서 능력으로 역사하시는 이의 역사를 따라 힘을 다하여 수고하노라'),
  ],),
];

class CategoryItem extends StatelessWidget {
  const CategoryItem(this.category);

  final Category category;

  Widget _buildTiles(Category root) {
    return ExpansionTile(
      key: PageStorageKey<Category>(root),
      title: Text(root.title),
      subtitle: Text(root.subtitle),
      children: root.children.map(_buildContentTiles).toList(),
    );
  }

  Widget _buildContentTiles(Content leaf) {
    return ListTile(
      key: PageStorageKey<Content>(leaf),
      title: new Center(child: new Text(leaf.number,
        style: new TextStyle(fontWeight: FontWeight.w500, fontSize: 25.0),)),
      subtitle: Text('\n  '+leaf.address + '\n\n' + leaf.content, style: TextStyle(fontSize: 18.0)),
      contentPadding: EdgeInsets.all(8),
      isThreeLine: true,
    );

    // return ListView(
    //   key: PageStorageKey<Content>(leaf),
    //   padding: const EdgeInsets.all(8),
    //   children: <Widget>[
    //     Container(
    //       height: 50,
    //       color: Colors.amber[600],
    //       child: const Center(child: Text('Entry A')),
    //     ),
    //     Container(
    //       height: 50,
    //       color: Colors.amber[500],
    //       child: const Center(child: Text('Entry B')),
    //     ),
    //     Container(
    //       height: 50,
    //       color: Colors.amber[100],
    //       child: const Center(child: Text('Entry C')),
    //     ),
    //   ],
    // );


  }
  @override
  Widget build(BuildContext context) {
    return _buildTiles(category);
  }
}