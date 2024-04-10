; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!101078 () Bool)

(assert start!101078)

(declare-fun b_free!26039 () Bool)

(declare-fun b_next!26039 () Bool)

(assert (=> start!101078 (= b_free!26039 (not b_next!26039))))

(declare-fun tp!91135 () Bool)

(declare-fun b_and!43177 () Bool)

(assert (=> start!101078 (= tp!91135 b_and!43177)))

(declare-fun b!1211653 () Bool)

(declare-fun e!688129 () Bool)

(declare-fun tp_is_empty!30743 () Bool)

(assert (=> b!1211653 (= e!688129 tp_is_empty!30743)))

(declare-fun b!1211654 () Bool)

(declare-datatypes ((Unit!40177 0))(
  ( (Unit!40178) )
))
(declare-fun e!688125 () Unit!40177)

(declare-fun lt!550403 () Unit!40177)

(assert (=> b!1211654 (= e!688125 lt!550403)))

(declare-fun call!59936 () Unit!40177)

(assert (=> b!1211654 (= lt!550403 call!59936)))

(declare-fun call!59937 () Bool)

(assert (=> b!1211654 call!59937))

(declare-datatypes ((V!46117 0))(
  ( (V!46118 (val!15428 Int)) )
))
(declare-fun zeroValue!944 () V!46117)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((tuple2!19820 0))(
  ( (tuple2!19821 (_1!9921 (_ BitVec 64)) (_2!9921 V!46117)) )
))
(declare-datatypes ((List!26621 0))(
  ( (Nil!26618) (Cons!26617 (h!27826 tuple2!19820) (t!39640 List!26621)) )
))
(declare-datatypes ((ListLongMap!17789 0))(
  ( (ListLongMap!17790 (toList!8910 List!26621)) )
))
(declare-fun call!59930 () ListLongMap!17789)

(declare-datatypes ((ValueCell!14662 0))(
  ( (ValueCellFull!14662 (v!18080 V!46117)) (EmptyCell!14662) )
))
(declare-datatypes ((array!78273 0))(
  ( (array!78274 (arr!37772 (Array (_ BitVec 32) ValueCell!14662)) (size!38308 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78273)

(declare-fun minValue!944 () V!46117)

(declare-datatypes ((array!78275 0))(
  ( (array!78276 (arr!37773 (Array (_ BitVec 32) (_ BitVec 64))) (size!38309 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78275)

(declare-fun bm!59927 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!5342 (array!78275 array!78273 (_ BitVec 32) (_ BitVec 32) V!46117 V!46117 (_ BitVec 32) Int) ListLongMap!17789)

(assert (=> bm!59927 (= call!59930 (getCurrentListMapNoExtraKeys!5342 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1211655 () Bool)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun e!688128 () Bool)

(declare-fun arrayContainsKey!0 (array!78275 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1211655 (= e!688128 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1211656 () Bool)

(declare-fun e!688124 () Bool)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1211656 (= e!688124 (bvslt i!673 (size!38308 _values!996)))))

(declare-fun e!688115 () Bool)

(assert (=> b!1211656 e!688115))

(declare-fun res!804893 () Bool)

(assert (=> b!1211656 (=> (not res!804893) (not e!688115))))

(declare-fun lt!550409 () V!46117)

(declare-fun lt!550392 () ListLongMap!17789)

(declare-fun -!1858 (ListLongMap!17789 (_ BitVec 64)) ListLongMap!17789)

(declare-fun +!4028 (ListLongMap!17789 tuple2!19820) ListLongMap!17789)

(assert (=> b!1211656 (= res!804893 (= (-!1858 (+!4028 lt!550392 (tuple2!19821 (select (arr!37773 _keys!1208) from!1455) lt!550409)) (select (arr!37773 _keys!1208) from!1455)) lt!550392))))

(declare-fun lt!550397 () Unit!40177)

(declare-fun addThenRemoveForNewKeyIsSame!275 (ListLongMap!17789 (_ BitVec 64) V!46117) Unit!40177)

(assert (=> b!1211656 (= lt!550397 (addThenRemoveForNewKeyIsSame!275 lt!550392 (select (arr!37773 _keys!1208) from!1455) lt!550409))))

(declare-fun lt!550401 () V!46117)

(declare-fun get!19248 (ValueCell!14662 V!46117) V!46117)

(assert (=> b!1211656 (= lt!550409 (get!19248 (select (arr!37772 _values!996) from!1455) lt!550401))))

(declare-fun lt!550390 () Unit!40177)

(declare-fun e!688126 () Unit!40177)

(assert (=> b!1211656 (= lt!550390 e!688126)))

(declare-fun c!119514 () Bool)

(declare-fun contains!6982 (ListLongMap!17789 (_ BitVec 64)) Bool)

(assert (=> b!1211656 (= c!119514 (contains!6982 lt!550392 k!934))))

(assert (=> b!1211656 (= lt!550392 (getCurrentListMapNoExtraKeys!5342 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!550406 () array!78275)

(declare-fun bm!59928 () Bool)

(declare-fun lt!550398 () array!78273)

(declare-fun call!59934 () ListLongMap!17789)

(assert (=> bm!59928 (= call!59934 (getCurrentListMapNoExtraKeys!5342 lt!550406 lt!550398 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1211657 () Bool)

(declare-fun res!804888 () Bool)

(declare-fun e!688121 () Bool)

(assert (=> b!1211657 (=> (not res!804888) (not e!688121))))

(declare-datatypes ((List!26622 0))(
  ( (Nil!26619) (Cons!26618 (h!27827 (_ BitVec 64)) (t!39641 List!26622)) )
))
(declare-fun arrayNoDuplicates!0 (array!78275 (_ BitVec 32) List!26622) Bool)

(assert (=> b!1211657 (= res!804888 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26619))))

(declare-fun b!1211658 () Bool)

(declare-fun e!688130 () Bool)

(assert (=> b!1211658 (= e!688130 tp_is_empty!30743)))

(declare-fun bm!59929 () Bool)

(declare-fun call!59933 () Bool)

(assert (=> bm!59929 (= call!59937 call!59933)))

(declare-fun b!1211659 () Bool)

(declare-fun e!688118 () Bool)

(declare-fun e!688120 () Bool)

(assert (=> b!1211659 (= e!688118 (not e!688120))))

(declare-fun res!804894 () Bool)

(assert (=> b!1211659 (=> res!804894 e!688120)))

(assert (=> b!1211659 (= res!804894 (bvsgt from!1455 i!673))))

(assert (=> b!1211659 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!550402 () Unit!40177)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78275 (_ BitVec 64) (_ BitVec 32)) Unit!40177)

(assert (=> b!1211659 (= lt!550402 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1211660 () Bool)

(declare-fun c!119512 () Bool)

(declare-fun lt!550399 () Bool)

(assert (=> b!1211660 (= c!119512 (and (not lt!550399) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!688117 () Unit!40177)

(assert (=> b!1211660 (= e!688117 e!688125)))

(declare-fun bm!59930 () Bool)

(declare-fun c!119513 () Bool)

(declare-fun lt!550407 () ListLongMap!17789)

(declare-fun call!59935 () ListLongMap!17789)

(assert (=> bm!59930 (= call!59935 (+!4028 (ite c!119513 lt!550407 lt!550392) (ite c!119513 (tuple2!19821 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!119512 (tuple2!19821 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19821 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1211661 () Bool)

(declare-fun e!688119 () Bool)

(assert (=> b!1211661 (= e!688119 e!688124)))

(declare-fun res!804891 () Bool)

(assert (=> b!1211661 (=> res!804891 e!688124)))

(assert (=> b!1211661 (= res!804891 (not (= (select (arr!37773 _keys!1208) from!1455) k!934)))))

(declare-fun e!688123 () Bool)

(assert (=> b!1211661 e!688123))

(declare-fun c!119511 () Bool)

(assert (=> b!1211661 (= c!119511 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!550395 () Unit!40177)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1068 (array!78275 array!78273 (_ BitVec 32) (_ BitVec 32) V!46117 V!46117 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40177)

(assert (=> b!1211661 (= lt!550395 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1068 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1211662 () Bool)

(declare-fun res!804885 () Bool)

(assert (=> b!1211662 (=> (not res!804885) (not e!688121))))

(assert (=> b!1211662 (= res!804885 (= (select (arr!37773 _keys!1208) i!673) k!934))))

(declare-fun bm!59931 () Bool)

(declare-fun call!59931 () Unit!40177)

(declare-fun addStillContains!1055 (ListLongMap!17789 (_ BitVec 64) V!46117 (_ BitVec 64)) Unit!40177)

(assert (=> bm!59931 (= call!59931 (addStillContains!1055 lt!550392 (ite (or c!119513 c!119512) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!119513 c!119512) zeroValue!944 minValue!944) k!934))))

(declare-fun b!1211663 () Bool)

(declare-fun e!688131 () Unit!40177)

(declare-fun Unit!40179 () Unit!40177)

(assert (=> b!1211663 (= e!688131 Unit!40179)))

(declare-fun b!1211664 () Bool)

(declare-fun e!688116 () Bool)

(assert (=> b!1211664 (= e!688116 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1211665 () Bool)

(declare-fun lt!550404 () ListLongMap!17789)

(assert (=> b!1211665 (= e!688115 (= (-!1858 lt!550404 k!934) lt!550392))))

(declare-fun b!1211666 () Bool)

(assert (=> b!1211666 (= e!688120 e!688119)))

(declare-fun res!804889 () Bool)

(assert (=> b!1211666 (=> res!804889 e!688119)))

(assert (=> b!1211666 (= res!804889 (not (= from!1455 i!673)))))

(declare-fun lt!550396 () ListLongMap!17789)

(assert (=> b!1211666 (= lt!550396 (getCurrentListMapNoExtraKeys!5342 lt!550406 lt!550398 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1211666 (= lt!550398 (array!78274 (store (arr!37772 _values!996) i!673 (ValueCellFull!14662 lt!550401)) (size!38308 _values!996)))))

(declare-fun dynLambda!3236 (Int (_ BitVec 64)) V!46117)

(assert (=> b!1211666 (= lt!550401 (dynLambda!3236 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1211666 (= lt!550404 (getCurrentListMapNoExtraKeys!5342 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1211667 () Bool)

(declare-fun res!804890 () Bool)

(assert (=> b!1211667 (=> (not res!804890) (not e!688121))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1211667 (= res!804890 (validKeyInArray!0 k!934))))

(declare-fun b!1211668 () Bool)

(declare-fun res!804892 () Bool)

(assert (=> b!1211668 (=> (not res!804892) (not e!688121))))

(assert (=> b!1211668 (= res!804892 (and (= (size!38308 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38309 _keys!1208) (size!38308 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1211669 () Bool)

(assert (=> b!1211669 (= e!688116 (ite (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!550399) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1211670 () Bool)

(declare-fun Unit!40180 () Unit!40177)

(assert (=> b!1211670 (= e!688126 Unit!40180)))

(declare-fun mapIsEmpty!47986 () Bool)

(declare-fun mapRes!47986 () Bool)

(assert (=> mapIsEmpty!47986 mapRes!47986))

(declare-fun b!1211671 () Bool)

(declare-fun res!804887 () Bool)

(assert (=> b!1211671 (=> (not res!804887) (not e!688121))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1211671 (= res!804887 (validMask!0 mask!1564))))

(declare-fun b!1211672 () Bool)

(assert (=> b!1211672 (= e!688121 e!688118)))

(declare-fun res!804895 () Bool)

(assert (=> b!1211672 (=> (not res!804895) (not e!688118))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78275 (_ BitVec 32)) Bool)

(assert (=> b!1211672 (= res!804895 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!550406 mask!1564))))

(assert (=> b!1211672 (= lt!550406 (array!78276 (store (arr!37773 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38309 _keys!1208)))))

(declare-fun mapNonEmpty!47986 () Bool)

(declare-fun tp!91136 () Bool)

(assert (=> mapNonEmpty!47986 (= mapRes!47986 (and tp!91136 e!688129))))

(declare-fun mapValue!47986 () ValueCell!14662)

(declare-fun mapKey!47986 () (_ BitVec 32))

(declare-fun mapRest!47986 () (Array (_ BitVec 32) ValueCell!14662))

(assert (=> mapNonEmpty!47986 (= (arr!37772 _values!996) (store mapRest!47986 mapKey!47986 mapValue!47986))))

(declare-fun res!804881 () Bool)

(assert (=> start!101078 (=> (not res!804881) (not e!688121))))

(assert (=> start!101078 (= res!804881 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38309 _keys!1208))))))

(assert (=> start!101078 e!688121))

(assert (=> start!101078 tp_is_empty!30743))

(declare-fun array_inv!28772 (array!78275) Bool)

(assert (=> start!101078 (array_inv!28772 _keys!1208)))

(assert (=> start!101078 true))

(assert (=> start!101078 tp!91135))

(declare-fun e!688122 () Bool)

(declare-fun array_inv!28773 (array!78273) Bool)

(assert (=> start!101078 (and (array_inv!28773 _values!996) e!688122)))

(declare-fun b!1211673 () Bool)

(assert (=> b!1211673 call!59937))

(declare-fun lt!550408 () Unit!40177)

(assert (=> b!1211673 (= lt!550408 call!59936)))

(assert (=> b!1211673 (= e!688131 lt!550408)))

(declare-fun b!1211674 () Bool)

(assert (=> b!1211674 (contains!6982 call!59935 k!934)))

(declare-fun lt!550394 () Unit!40177)

(assert (=> b!1211674 (= lt!550394 (addStillContains!1055 lt!550407 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k!934))))

(assert (=> b!1211674 call!59933))

(assert (=> b!1211674 (= lt!550407 (+!4028 lt!550392 (tuple2!19821 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!550389 () Unit!40177)

(assert (=> b!1211674 (= lt!550389 call!59931)))

(assert (=> b!1211674 (= e!688117 lt!550394)))

(declare-fun b!1211675 () Bool)

(declare-fun res!804882 () Bool)

(assert (=> b!1211675 (=> (not res!804882) (not e!688118))))

(assert (=> b!1211675 (= res!804882 (arrayNoDuplicates!0 lt!550406 #b00000000000000000000000000000000 Nil!26619))))

(declare-fun bm!59932 () Bool)

(declare-fun call!59932 () ListLongMap!17789)

(assert (=> bm!59932 (= call!59932 call!59935)))

(declare-fun b!1211676 () Bool)

(declare-fun Unit!40181 () Unit!40177)

(assert (=> b!1211676 (= e!688126 Unit!40181)))

(assert (=> b!1211676 (= lt!550399 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1211676 (= c!119513 (and (not lt!550399) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!550405 () Unit!40177)

(assert (=> b!1211676 (= lt!550405 e!688117)))

(declare-fun lt!550400 () Unit!40177)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!606 (array!78275 array!78273 (_ BitVec 32) (_ BitVec 32) V!46117 V!46117 (_ BitVec 64) (_ BitVec 32) Int) Unit!40177)

(assert (=> b!1211676 (= lt!550400 (lemmaListMapContainsThenArrayContainsFrom!606 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!119515 () Bool)

(assert (=> b!1211676 (= c!119515 (and (not (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!804883 () Bool)

(assert (=> b!1211676 (= res!804883 e!688116)))

(assert (=> b!1211676 (=> (not res!804883) (not e!688128))))

(assert (=> b!1211676 e!688128))

(declare-fun lt!550393 () Unit!40177)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!78275 (_ BitVec 32) (_ BitVec 32)) Unit!40177)

(assert (=> b!1211676 (= lt!550393 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1211676 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26619)))

(declare-fun lt!550391 () Unit!40177)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!78275 (_ BitVec 64) (_ BitVec 32) List!26622) Unit!40177)

(assert (=> b!1211676 (= lt!550391 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k!934 from!1455 Nil!26619))))

(assert (=> b!1211676 false))

(declare-fun b!1211677 () Bool)

(assert (=> b!1211677 (= e!688123 (= call!59934 (-!1858 call!59930 k!934)))))

(declare-fun b!1211678 () Bool)

(assert (=> b!1211678 (= e!688123 (= call!59934 call!59930))))

(declare-fun bm!59933 () Bool)

(assert (=> bm!59933 (= call!59933 (contains!6982 (ite c!119513 lt!550407 call!59932) k!934))))

(declare-fun b!1211679 () Bool)

(assert (=> b!1211679 (= e!688122 (and e!688130 mapRes!47986))))

(declare-fun condMapEmpty!47986 () Bool)

(declare-fun mapDefault!47986 () ValueCell!14662)

