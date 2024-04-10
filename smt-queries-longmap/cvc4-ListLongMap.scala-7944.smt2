; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98508 () Bool)

(assert start!98508)

(declare-fun b_free!24113 () Bool)

(declare-fun b_next!24113 () Bool)

(assert (=> start!98508 (= b_free!24113 (not b_next!24113))))

(declare-fun tp!85049 () Bool)

(declare-fun b_and!39075 () Bool)

(assert (=> start!98508 (= tp!85049 b_and!39075)))

(declare-datatypes ((array!74145 0))(
  ( (array!74146 (arr!35723 (Array (_ BitVec 32) (_ BitVec 64))) (size!36259 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74145)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun e!648799 () Bool)

(declare-fun b!1140337 () Bool)

(declare-fun arrayContainsKey!0 (array!74145 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1140337 (= e!648799 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1140338 () Bool)

(declare-fun res!760349 () Bool)

(declare-fun e!648795 () Bool)

(assert (=> b!1140338 (=> (not res!760349) (not e!648795))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74145 (_ BitVec 32)) Bool)

(assert (=> b!1140338 (= res!760349 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1140339 () Bool)

(declare-fun e!648806 () Bool)

(declare-fun tp_is_empty!28643 () Bool)

(assert (=> b!1140339 (= e!648806 tp_is_empty!28643)))

(declare-fun bm!50895 () Bool)

(declare-fun call!50898 () Bool)

(declare-fun call!50903 () Bool)

(assert (=> bm!50895 (= call!50898 call!50903)))

(declare-fun b!1140340 () Bool)

(declare-datatypes ((Unit!37390 0))(
  ( (Unit!37391) )
))
(declare-fun e!648805 () Unit!37390)

(declare-fun e!648801 () Unit!37390)

(assert (=> b!1140340 (= e!648805 e!648801)))

(declare-fun c!111880 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!507767 () Bool)

(assert (=> b!1140340 (= c!111880 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!507767))))

(declare-fun b!1140341 () Bool)

(declare-fun res!760342 () Bool)

(assert (=> b!1140341 (=> (not res!760342) (not e!648795))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1140341 (= res!760342 (validKeyInArray!0 k!934))))

(declare-fun b!1140342 () Bool)

(declare-fun res!760341 () Bool)

(assert (=> b!1140342 (=> (not res!760341) (not e!648795))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1140342 (= res!760341 (validMask!0 mask!1564))))

(declare-fun bm!50896 () Bool)

(declare-datatypes ((V!43317 0))(
  ( (V!43318 (val!14378 Int)) )
))
(declare-datatypes ((tuple2!18182 0))(
  ( (tuple2!18183 (_1!9102 (_ BitVec 64)) (_2!9102 V!43317)) )
))
(declare-datatypes ((List!24937 0))(
  ( (Nil!24934) (Cons!24933 (h!26142 tuple2!18182) (t!36042 List!24937)) )
))
(declare-datatypes ((ListLongMap!16151 0))(
  ( (ListLongMap!16152 (toList!8091 List!24937)) )
))
(declare-fun call!50902 () ListLongMap!16151)

(declare-fun call!50900 () ListLongMap!16151)

(assert (=> bm!50896 (= call!50902 call!50900)))

(declare-fun b!1140343 () Bool)

(declare-fun e!648794 () Bool)

(assert (=> b!1140343 (= e!648794 tp_is_empty!28643)))

(declare-fun c!111876 () Bool)

(declare-fun bm!50897 () Bool)

(declare-fun lt!507768 () ListLongMap!16151)

(declare-fun contains!6626 (ListLongMap!16151 (_ BitVec 64)) Bool)

(assert (=> bm!50897 (= call!50903 (contains!6626 (ite c!111876 lt!507768 call!50902) k!934))))

(declare-fun b!1140344 () Bool)

(declare-fun e!648807 () Bool)

(assert (=> b!1140344 (= e!648807 true)))

(declare-fun lt!507754 () ListLongMap!16151)

(declare-fun lt!507757 () V!43317)

(declare-fun -!1241 (ListLongMap!16151 (_ BitVec 64)) ListLongMap!16151)

(declare-fun +!3523 (ListLongMap!16151 tuple2!18182) ListLongMap!16151)

(assert (=> b!1140344 (= (-!1241 (+!3523 lt!507754 (tuple2!18183 (select (arr!35723 _keys!1208) from!1455) lt!507757)) (select (arr!35723 _keys!1208) from!1455)) lt!507754)))

(declare-fun lt!507763 () Unit!37390)

(declare-fun addThenRemoveForNewKeyIsSame!95 (ListLongMap!16151 (_ BitVec 64) V!43317) Unit!37390)

(assert (=> b!1140344 (= lt!507763 (addThenRemoveForNewKeyIsSame!95 lt!507754 (select (arr!35723 _keys!1208) from!1455) lt!507757))))

(declare-fun lt!507755 () V!43317)

(declare-datatypes ((ValueCell!13612 0))(
  ( (ValueCellFull!13612 (v!17015 V!43317)) (EmptyCell!13612) )
))
(declare-datatypes ((array!74147 0))(
  ( (array!74148 (arr!35724 (Array (_ BitVec 32) ValueCell!13612)) (size!36260 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74147)

(declare-fun get!18145 (ValueCell!13612 V!43317) V!43317)

(assert (=> b!1140344 (= lt!507757 (get!18145 (select (arr!35724 _values!996) from!1455) lt!507755))))

(declare-fun lt!507761 () Unit!37390)

(declare-fun e!648802 () Unit!37390)

(assert (=> b!1140344 (= lt!507761 e!648802)))

(declare-fun c!111877 () Bool)

(assert (=> b!1140344 (= c!111877 (contains!6626 lt!507754 k!934))))

(declare-fun zeroValue!944 () V!43317)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!43317)

(declare-fun getCurrentListMapNoExtraKeys!4573 (array!74145 array!74147 (_ BitVec 32) (_ BitVec 32) V!43317 V!43317 (_ BitVec 32) Int) ListLongMap!16151)

(assert (=> b!1140344 (= lt!507754 (getCurrentListMapNoExtraKeys!4573 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1140345 () Bool)

(declare-fun e!648803 () Bool)

(assert (=> b!1140345 (= e!648803 e!648807)))

(declare-fun res!760343 () Bool)

(assert (=> b!1140345 (=> res!760343 e!648807)))

(assert (=> b!1140345 (= res!760343 (not (= (select (arr!35723 _keys!1208) from!1455) k!934)))))

(declare-fun e!648800 () Bool)

(assert (=> b!1140345 e!648800))

(declare-fun c!111879 () Bool)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1140345 (= c!111879 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!507771 () Unit!37390)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!487 (array!74145 array!74147 (_ BitVec 32) (_ BitVec 32) V!43317 V!43317 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37390)

(assert (=> b!1140345 (= lt!507771 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!487 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1140346 () Bool)

(declare-fun res!760337 () Bool)

(assert (=> b!1140346 (=> (not res!760337) (not e!648795))))

(declare-datatypes ((List!24938 0))(
  ( (Nil!24935) (Cons!24934 (h!26143 (_ BitVec 64)) (t!36043 List!24938)) )
))
(declare-fun arrayNoDuplicates!0 (array!74145 (_ BitVec 32) List!24938) Bool)

(assert (=> b!1140346 (= res!760337 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24935))))

(declare-fun bm!50898 () Bool)

(declare-fun c!111878 () Bool)

(assert (=> bm!50898 (= call!50900 (+!3523 lt!507754 (ite (or c!111876 c!111878) (tuple2!18183 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18183 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun bm!50899 () Bool)

(declare-fun call!50905 () Unit!37390)

(declare-fun addStillContains!780 (ListLongMap!16151 (_ BitVec 64) V!43317 (_ BitVec 64)) Unit!37390)

(assert (=> bm!50899 (= call!50905 (addStillContains!780 lt!507754 (ite (or c!111876 c!111878) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!111876 c!111878) zeroValue!944 minValue!944) k!934))))

(declare-fun b!1140347 () Bool)

(assert (=> b!1140347 (contains!6626 (+!3523 lt!507768 (tuple2!18183 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k!934)))

(declare-fun lt!507760 () Unit!37390)

(assert (=> b!1140347 (= lt!507760 (addStillContains!780 lt!507768 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k!934))))

(assert (=> b!1140347 call!50903))

(assert (=> b!1140347 (= lt!507768 call!50900)))

(declare-fun lt!507758 () Unit!37390)

(assert (=> b!1140347 (= lt!507758 call!50905)))

(declare-fun e!648797 () Unit!37390)

(assert (=> b!1140347 (= e!648797 lt!507760)))

(declare-fun b!1140348 () Bool)

(declare-fun res!760345 () Bool)

(assert (=> b!1140348 (=> (not res!760345) (not e!648795))))

(assert (=> b!1140348 (= res!760345 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36259 _keys!1208))))))

(declare-fun mapNonEmpty!44789 () Bool)

(declare-fun mapRes!44789 () Bool)

(declare-fun tp!85050 () Bool)

(assert (=> mapNonEmpty!44789 (= mapRes!44789 (and tp!85050 e!648794))))

(declare-fun mapKey!44789 () (_ BitVec 32))

(declare-fun mapRest!44789 () (Array (_ BitVec 32) ValueCell!13612))

(declare-fun mapValue!44789 () ValueCell!13612)

(assert (=> mapNonEmpty!44789 (= (arr!35724 _values!996) (store mapRest!44789 mapKey!44789 mapValue!44789))))

(declare-fun b!1140349 () Bool)

(declare-fun Unit!37392 () Unit!37390)

(assert (=> b!1140349 (= e!648802 Unit!37392)))

(declare-fun b!1140350 () Bool)

(declare-fun lt!507752 () Unit!37390)

(assert (=> b!1140350 (= e!648805 lt!507752)))

(declare-fun call!50899 () Unit!37390)

(assert (=> b!1140350 (= lt!507752 call!50899)))

(assert (=> b!1140350 call!50898))

(declare-fun b!1140351 () Bool)

(declare-fun call!50904 () ListLongMap!16151)

(declare-fun call!50901 () ListLongMap!16151)

(assert (=> b!1140351 (= e!648800 (= call!50904 call!50901))))

(declare-fun b!1140352 () Bool)

(declare-fun res!760344 () Bool)

(declare-fun e!648796 () Bool)

(assert (=> b!1140352 (=> (not res!760344) (not e!648796))))

(declare-fun lt!507751 () array!74145)

(assert (=> b!1140352 (= res!760344 (arrayNoDuplicates!0 lt!507751 #b00000000000000000000000000000000 Nil!24935))))

(declare-fun b!1140353 () Bool)

(declare-fun e!648804 () Bool)

(assert (=> b!1140353 (= e!648796 (not e!648804))))

(declare-fun res!760347 () Bool)

(assert (=> b!1140353 (=> res!760347 e!648804)))

(assert (=> b!1140353 (= res!760347 (bvsgt from!1455 i!673))))

(assert (=> b!1140353 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!507769 () Unit!37390)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74145 (_ BitVec 64) (_ BitVec 32)) Unit!37390)

(assert (=> b!1140353 (= lt!507769 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun mapIsEmpty!44789 () Bool)

(assert (=> mapIsEmpty!44789 mapRes!44789))

(declare-fun bm!50900 () Bool)

(declare-fun lt!507753 () array!74147)

(assert (=> bm!50900 (= call!50904 (getCurrentListMapNoExtraKeys!4573 lt!507751 lt!507753 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun e!648792 () Bool)

(declare-fun b!1140354 () Bool)

(assert (=> b!1140354 (= e!648792 (ite (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!507767) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1140355 () Bool)

(declare-fun Unit!37393 () Unit!37390)

(assert (=> b!1140355 (= e!648802 Unit!37393)))

(assert (=> b!1140355 (= lt!507767 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1140355 (= c!111876 (and (not lt!507767) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!507759 () Unit!37390)

(assert (=> b!1140355 (= lt!507759 e!648797)))

(declare-fun lt!507762 () Unit!37390)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!380 (array!74145 array!74147 (_ BitVec 32) (_ BitVec 32) V!43317 V!43317 (_ BitVec 64) (_ BitVec 32) Int) Unit!37390)

(assert (=> b!1140355 (= lt!507762 (lemmaListMapContainsThenArrayContainsFrom!380 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!111875 () Bool)

(assert (=> b!1140355 (= c!111875 (and (not (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!760336 () Bool)

(assert (=> b!1140355 (= res!760336 e!648792)))

(assert (=> b!1140355 (=> (not res!760336) (not e!648799))))

(assert (=> b!1140355 e!648799))

(declare-fun lt!507765 () Unit!37390)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74145 (_ BitVec 32) (_ BitVec 32)) Unit!37390)

(assert (=> b!1140355 (= lt!507765 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1140355 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!24935)))

(declare-fun lt!507764 () Unit!37390)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74145 (_ BitVec 64) (_ BitVec 32) List!24938) Unit!37390)

(assert (=> b!1140355 (= lt!507764 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k!934 from!1455 Nil!24935))))

(assert (=> b!1140355 false))

(declare-fun b!1140356 () Bool)

(assert (=> b!1140356 (= e!648795 e!648796)))

(declare-fun res!760338 () Bool)

(assert (=> b!1140356 (=> (not res!760338) (not e!648796))))

(assert (=> b!1140356 (= res!760338 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!507751 mask!1564))))

(assert (=> b!1140356 (= lt!507751 (array!74146 (store (arr!35723 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36259 _keys!1208)))))

(declare-fun b!1140357 () Bool)

(assert (=> b!1140357 (= e!648800 (= call!50904 (-!1241 call!50901 k!934)))))

(declare-fun b!1140358 () Bool)

(declare-fun Unit!37394 () Unit!37390)

(assert (=> b!1140358 (= e!648801 Unit!37394)))

(declare-fun b!1140359 () Bool)

(assert (=> b!1140359 (= e!648804 e!648803)))

(declare-fun res!760339 () Bool)

(assert (=> b!1140359 (=> res!760339 e!648803)))

(assert (=> b!1140359 (= res!760339 (not (= from!1455 i!673)))))

(declare-fun lt!507756 () ListLongMap!16151)

(assert (=> b!1140359 (= lt!507756 (getCurrentListMapNoExtraKeys!4573 lt!507751 lt!507753 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1140359 (= lt!507753 (array!74148 (store (arr!35724 _values!996) i!673 (ValueCellFull!13612 lt!507755)) (size!36260 _values!996)))))

(declare-fun dynLambda!2621 (Int (_ BitVec 64)) V!43317)

(assert (=> b!1140359 (= lt!507755 (dynLambda!2621 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!507766 () ListLongMap!16151)

(assert (=> b!1140359 (= lt!507766 (getCurrentListMapNoExtraKeys!4573 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun bm!50901 () Bool)

(assert (=> bm!50901 (= call!50901 (getCurrentListMapNoExtraKeys!4573 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1140360 () Bool)

(assert (=> b!1140360 (= c!111878 (and (not lt!507767) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1140360 (= e!648797 e!648805)))

(declare-fun b!1140361 () Bool)

(assert (=> b!1140361 (= e!648792 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1140362 () Bool)

(declare-fun e!648798 () Bool)

(assert (=> b!1140362 (= e!648798 (and e!648806 mapRes!44789))))

(declare-fun condMapEmpty!44789 () Bool)

(declare-fun mapDefault!44789 () ValueCell!13612)

