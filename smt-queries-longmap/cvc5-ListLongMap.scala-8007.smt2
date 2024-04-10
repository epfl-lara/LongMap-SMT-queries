; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98882 () Bool)

(assert start!98882)

(declare-fun b_free!24487 () Bool)

(declare-fun b_next!24487 () Bool)

(assert (=> start!98882 (= b_free!24487 (not b_next!24487))))

(declare-fun tp!86171 () Bool)

(declare-fun b_and!39823 () Bool)

(assert (=> start!98882 (= tp!86171 b_and!39823)))

(declare-datatypes ((V!43817 0))(
  ( (V!43818 (val!14565 Int)) )
))
(declare-datatypes ((tuple2!18532 0))(
  ( (tuple2!18533 (_1!9277 (_ BitVec 64)) (_2!9277 V!43817)) )
))
(declare-datatypes ((List!25273 0))(
  ( (Nil!25270) (Cons!25269 (h!26478 tuple2!18532) (t!36752 List!25273)) )
))
(declare-datatypes ((ListLongMap!16501 0))(
  ( (ListLongMap!16502 (toList!8266 List!25273)) )
))
(declare-fun lt!519820 () ListLongMap!16501)

(declare-fun call!55388 () Bool)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun bm!55383 () Bool)

(declare-fun call!55389 () ListLongMap!16501)

(declare-fun c!115243 () Bool)

(declare-fun contains!6777 (ListLongMap!16501 (_ BitVec 64)) Bool)

(assert (=> bm!55383 (= call!55388 (contains!6777 (ite c!115243 lt!519820 call!55389) k!934))))

(declare-fun res!768631 () Bool)

(declare-fun e!658215 () Bool)

(assert (=> start!98882 (=> (not res!768631) (not e!658215))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!74877 0))(
  ( (array!74878 (arr!36089 (Array (_ BitVec 32) (_ BitVec 64))) (size!36625 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74877)

(assert (=> start!98882 (= res!768631 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36625 _keys!1208))))))

(assert (=> start!98882 e!658215))

(declare-fun tp_is_empty!29017 () Bool)

(assert (=> start!98882 tp_is_empty!29017))

(declare-fun array_inv!27620 (array!74877) Bool)

(assert (=> start!98882 (array_inv!27620 _keys!1208)))

(assert (=> start!98882 true))

(assert (=> start!98882 tp!86171))

(declare-datatypes ((ValueCell!13799 0))(
  ( (ValueCellFull!13799 (v!17202 V!43817)) (EmptyCell!13799) )
))
(declare-datatypes ((array!74879 0))(
  ( (array!74880 (arr!36090 (Array (_ BitVec 32) ValueCell!13799)) (size!36626 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74879)

(declare-fun e!658218 () Bool)

(declare-fun array_inv!27621 (array!74879) Bool)

(assert (=> start!98882 (and (array_inv!27621 _values!996) e!658218)))

(declare-fun b!1157414 () Bool)

(declare-fun call!55386 () Bool)

(assert (=> b!1157414 call!55386))

(declare-datatypes ((Unit!38129 0))(
  ( (Unit!38130) )
))
(declare-fun lt!519824 () Unit!38129)

(declare-fun call!55391 () Unit!38129)

(assert (=> b!1157414 (= lt!519824 call!55391)))

(declare-fun e!658209 () Unit!38129)

(assert (=> b!1157414 (= e!658209 lt!519824)))

(declare-fun b!1157415 () Bool)

(declare-fun e!658214 () Unit!38129)

(declare-fun lt!519811 () Unit!38129)

(assert (=> b!1157415 (= e!658214 lt!519811)))

(assert (=> b!1157415 (= lt!519811 call!55391)))

(assert (=> b!1157415 call!55386))

(declare-fun b!1157416 () Bool)

(declare-fun res!768638 () Bool)

(assert (=> b!1157416 (=> (not res!768638) (not e!658215))))

(declare-datatypes ((List!25274 0))(
  ( (Nil!25271) (Cons!25270 (h!26479 (_ BitVec 64)) (t!36753 List!25274)) )
))
(declare-fun arrayNoDuplicates!0 (array!74877 (_ BitVec 32) List!25274) Bool)

(assert (=> b!1157416 (= res!768638 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25271))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun b!1157417 () Bool)

(declare-fun e!658204 () Bool)

(declare-fun lt!519822 () Bool)

(assert (=> b!1157417 (= e!658204 (ite (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!519822) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1157418 () Bool)

(declare-fun res!768624 () Bool)

(assert (=> b!1157418 (=> (not res!768624) (not e!658215))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1157418 (= res!768624 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36625 _keys!1208))))))

(declare-fun b!1157419 () Bool)

(declare-fun e!658217 () Bool)

(assert (=> b!1157419 (= e!658217 true)))

(declare-fun e!658203 () Bool)

(assert (=> b!1157419 e!658203))

(declare-fun res!768635 () Bool)

(assert (=> b!1157419 (=> (not res!768635) (not e!658203))))

(declare-fun lt!519825 () ListLongMap!16501)

(declare-fun lt!519814 () ListLongMap!16501)

(assert (=> b!1157419 (= res!768635 (= lt!519825 lt!519814))))

(declare-fun lt!519806 () ListLongMap!16501)

(declare-fun -!1380 (ListLongMap!16501 (_ BitVec 64)) ListLongMap!16501)

(assert (=> b!1157419 (= lt!519825 (-!1380 lt!519806 k!934))))

(declare-fun lt!519821 () V!43817)

(declare-fun +!3677 (ListLongMap!16501 tuple2!18532) ListLongMap!16501)

(assert (=> b!1157419 (= (-!1380 (+!3677 lt!519814 (tuple2!18533 (select (arr!36089 _keys!1208) from!1455) lt!519821)) (select (arr!36089 _keys!1208) from!1455)) lt!519814)))

(declare-fun lt!519809 () Unit!38129)

(declare-fun addThenRemoveForNewKeyIsSame!219 (ListLongMap!16501 (_ BitVec 64) V!43817) Unit!38129)

(assert (=> b!1157419 (= lt!519809 (addThenRemoveForNewKeyIsSame!219 lt!519814 (select (arr!36089 _keys!1208) from!1455) lt!519821))))

(declare-fun lt!519812 () V!43817)

(declare-fun get!18395 (ValueCell!13799 V!43817) V!43817)

(assert (=> b!1157419 (= lt!519821 (get!18395 (select (arr!36090 _values!996) from!1455) lt!519812))))

(declare-fun lt!519819 () Unit!38129)

(declare-fun e!658208 () Unit!38129)

(assert (=> b!1157419 (= lt!519819 e!658208)))

(declare-fun c!115242 () Bool)

(assert (=> b!1157419 (= c!115242 (contains!6777 lt!519814 k!934))))

(declare-fun zeroValue!944 () V!43817)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!43817)

(declare-fun getCurrentListMapNoExtraKeys!4733 (array!74877 array!74879 (_ BitVec 32) (_ BitVec 32) V!43817 V!43817 (_ BitVec 32) Int) ListLongMap!16501)

(assert (=> b!1157419 (= lt!519814 (getCurrentListMapNoExtraKeys!4733 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1157420 () Bool)

(declare-fun e!658216 () Bool)

(assert (=> b!1157420 (= e!658216 e!658217)))

(declare-fun res!768626 () Bool)

(assert (=> b!1157420 (=> res!768626 e!658217)))

(assert (=> b!1157420 (= res!768626 (not (= (select (arr!36089 _keys!1208) from!1455) k!934)))))

(declare-fun e!658212 () Bool)

(assert (=> b!1157420 e!658212))

(declare-fun c!115246 () Bool)

(assert (=> b!1157420 (= c!115246 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!519805 () Unit!38129)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!613 (array!74877 array!74879 (_ BitVec 32) (_ BitVec 32) V!43817 V!43817 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38129)

(assert (=> b!1157420 (= lt!519805 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!613 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1157421 () Bool)

(declare-fun e!658207 () Bool)

(declare-fun e!658213 () Bool)

(assert (=> b!1157421 (= e!658207 (not e!658213))))

(declare-fun res!768630 () Bool)

(assert (=> b!1157421 (=> res!768630 e!658213)))

(assert (=> b!1157421 (= res!768630 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!74877 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1157421 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!519816 () Unit!38129)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74877 (_ BitVec 64) (_ BitVec 32)) Unit!38129)

(assert (=> b!1157421 (= lt!519816 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun c!115245 () Bool)

(declare-fun bm!55384 () Bool)

(declare-fun call!55390 () Unit!38129)

(declare-fun addStillContains!919 (ListLongMap!16501 (_ BitVec 64) V!43817 (_ BitVec 64)) Unit!38129)

(assert (=> bm!55384 (= call!55390 (addStillContains!919 lt!519814 (ite (or c!115243 c!115245) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!115243 c!115245) zeroValue!944 minValue!944) k!934))))

(declare-fun b!1157422 () Bool)

(declare-fun res!768634 () Bool)

(assert (=> b!1157422 (=> (not res!768634) (not e!658215))))

(assert (=> b!1157422 (= res!768634 (and (= (size!36626 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36625 _keys!1208) (size!36626 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1157423 () Bool)

(declare-fun call!55393 () ListLongMap!16501)

(assert (=> b!1157423 (contains!6777 call!55393 k!934)))

(declare-fun lt!519818 () Unit!38129)

(assert (=> b!1157423 (= lt!519818 (addStillContains!919 lt!519820 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k!934))))

(assert (=> b!1157423 call!55388))

(assert (=> b!1157423 (= lt!519820 (+!3677 lt!519814 (tuple2!18533 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!519815 () Unit!38129)

(assert (=> b!1157423 (= lt!519815 call!55390)))

(declare-fun e!658211 () Unit!38129)

(assert (=> b!1157423 (= e!658211 lt!519818)))

(declare-fun bm!55385 () Bool)

(assert (=> bm!55385 (= call!55389 call!55393)))

(declare-fun b!1157424 () Bool)

(declare-fun Unit!38131 () Unit!38129)

(assert (=> b!1157424 (= e!658208 Unit!38131)))

(assert (=> b!1157424 (= lt!519822 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1157424 (= c!115243 (and (not lt!519822) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!519823 () Unit!38129)

(assert (=> b!1157424 (= lt!519823 e!658211)))

(declare-fun lt!519813 () Unit!38129)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!506 (array!74877 array!74879 (_ BitVec 32) (_ BitVec 32) V!43817 V!43817 (_ BitVec 64) (_ BitVec 32) Int) Unit!38129)

(assert (=> b!1157424 (= lt!519813 (lemmaListMapContainsThenArrayContainsFrom!506 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!115241 () Bool)

(assert (=> b!1157424 (= c!115241 (and (not (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!768628 () Bool)

(assert (=> b!1157424 (= res!768628 e!658204)))

(declare-fun e!658205 () Bool)

(assert (=> b!1157424 (=> (not res!768628) (not e!658205))))

(assert (=> b!1157424 e!658205))

(declare-fun lt!519807 () Unit!38129)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74877 (_ BitVec 32) (_ BitVec 32)) Unit!38129)

(assert (=> b!1157424 (= lt!519807 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1157424 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25271)))

(declare-fun lt!519808 () Unit!38129)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74877 (_ BitVec 64) (_ BitVec 32) List!25274) Unit!38129)

(assert (=> b!1157424 (= lt!519808 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k!934 from!1455 Nil!25271))))

(assert (=> b!1157424 false))

(declare-fun b!1157425 () Bool)

(declare-fun res!768625 () Bool)

(assert (=> b!1157425 (=> (not res!768625) (not e!658207))))

(declare-fun lt!519810 () array!74877)

(assert (=> b!1157425 (= res!768625 (arrayNoDuplicates!0 lt!519810 #b00000000000000000000000000000000 Nil!25271))))

(declare-fun bm!55386 () Bool)

(declare-fun lt!519817 () array!74879)

(declare-fun call!55392 () ListLongMap!16501)

(assert (=> bm!55386 (= call!55392 (getCurrentListMapNoExtraKeys!4733 lt!519810 lt!519817 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!55387 () Bool)

(assert (=> bm!55387 (= call!55391 call!55390)))

(declare-fun b!1157426 () Bool)

(declare-fun Unit!38132 () Unit!38129)

(assert (=> b!1157426 (= e!658209 Unit!38132)))

(declare-fun b!1157427 () Bool)

(assert (=> b!1157427 (= e!658213 e!658216)))

(declare-fun res!768637 () Bool)

(assert (=> b!1157427 (=> res!768637 e!658216)))

(assert (=> b!1157427 (= res!768637 (not (= from!1455 i!673)))))

(declare-fun lt!519804 () ListLongMap!16501)

(assert (=> b!1157427 (= lt!519804 (getCurrentListMapNoExtraKeys!4733 lt!519810 lt!519817 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1157427 (= lt!519817 (array!74880 (store (arr!36090 _values!996) i!673 (ValueCellFull!13799 lt!519812)) (size!36626 _values!996)))))

(declare-fun dynLambda!2740 (Int (_ BitVec 64)) V!43817)

(assert (=> b!1157427 (= lt!519812 (dynLambda!2740 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1157427 (= lt!519806 (getCurrentListMapNoExtraKeys!4733 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1157428 () Bool)

(declare-fun res!768636 () Bool)

(assert (=> b!1157428 (=> (not res!768636) (not e!658215))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74877 (_ BitVec 32)) Bool)

(assert (=> b!1157428 (= res!768636 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1157429 () Bool)

(assert (=> b!1157429 (= e!658215 e!658207)))

(declare-fun res!768633 () Bool)

(assert (=> b!1157429 (=> (not res!768633) (not e!658207))))

(assert (=> b!1157429 (= res!768633 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!519810 mask!1564))))

(assert (=> b!1157429 (= lt!519810 (array!74878 (store (arr!36089 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36625 _keys!1208)))))

(declare-fun bm!55388 () Bool)

(assert (=> bm!55388 (= call!55386 call!55388)))

(declare-fun b!1157430 () Bool)

(assert (=> b!1157430 (= e!658205 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1157431 () Bool)

(declare-fun res!768627 () Bool)

(assert (=> b!1157431 (=> (not res!768627) (not e!658215))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1157431 (= res!768627 (validKeyInArray!0 k!934))))

(declare-fun b!1157432 () Bool)

(declare-fun Unit!38133 () Unit!38129)

(assert (=> b!1157432 (= e!658208 Unit!38133)))

(declare-fun b!1157433 () Bool)

(declare-fun call!55387 () ListLongMap!16501)

(assert (=> b!1157433 (= e!658212 (= call!55392 call!55387))))

(declare-fun b!1157434 () Bool)

(declare-fun res!768629 () Bool)

(assert (=> b!1157434 (=> (not res!768629) (not e!658215))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1157434 (= res!768629 (validMask!0 mask!1564))))

(declare-fun b!1157435 () Bool)

(assert (=> b!1157435 (= e!658214 e!658209)))

(declare-fun c!115244 () Bool)

(assert (=> b!1157435 (= c!115244 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!519822))))

(declare-fun b!1157436 () Bool)

(declare-fun e!658206 () Bool)

(assert (=> b!1157436 (= e!658206 tp_is_empty!29017)))

(declare-fun b!1157437 () Bool)

(declare-fun res!768632 () Bool)

(assert (=> b!1157437 (=> (not res!768632) (not e!658215))))

(assert (=> b!1157437 (= res!768632 (= (select (arr!36089 _keys!1208) i!673) k!934))))

(declare-fun mapNonEmpty!45350 () Bool)

(declare-fun mapRes!45350 () Bool)

(declare-fun tp!86172 () Bool)

(assert (=> mapNonEmpty!45350 (= mapRes!45350 (and tp!86172 e!658206))))

(declare-fun mapValue!45350 () ValueCell!13799)

(declare-fun mapKey!45350 () (_ BitVec 32))

(declare-fun mapRest!45350 () (Array (_ BitVec 32) ValueCell!13799))

(assert (=> mapNonEmpty!45350 (= (arr!36090 _values!996) (store mapRest!45350 mapKey!45350 mapValue!45350))))

(declare-fun b!1157438 () Bool)

(assert (=> b!1157438 (= e!658203 (= lt!519825 (getCurrentListMapNoExtraKeys!4733 lt!519810 lt!519817 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun mapIsEmpty!45350 () Bool)

(assert (=> mapIsEmpty!45350 mapRes!45350))

(declare-fun b!1157439 () Bool)

(assert (=> b!1157439 (= e!658212 (= call!55392 (-!1380 call!55387 k!934)))))

(declare-fun b!1157440 () Bool)

(assert (=> b!1157440 (= e!658204 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1157441 () Bool)

(assert (=> b!1157441 (= c!115245 (and (not lt!519822) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1157441 (= e!658211 e!658214)))

(declare-fun bm!55389 () Bool)

(assert (=> bm!55389 (= call!55393 (+!3677 (ite c!115243 lt!519820 lt!519814) (ite c!115243 (tuple2!18533 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!115245 (tuple2!18533 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18533 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1157442 () Bool)

(declare-fun e!658210 () Bool)

(assert (=> b!1157442 (= e!658218 (and e!658210 mapRes!45350))))

(declare-fun condMapEmpty!45350 () Bool)

(declare-fun mapDefault!45350 () ValueCell!13799)

