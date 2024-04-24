; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99220 () Bool)

(assert start!99220)

(declare-fun b_free!24589 () Bool)

(declare-fun b_next!24589 () Bool)

(assert (=> start!99220 (= b_free!24589 (not b_next!24589))))

(declare-fun tp!86478 () Bool)

(declare-fun b_and!40029 () Bool)

(assert (=> start!99220 (= tp!86478 b_and!40029)))

(declare-fun b!1163395 () Bool)

(declare-fun e!661636 () Bool)

(assert (=> b!1163395 (= e!661636 true)))

(declare-fun e!661649 () Bool)

(assert (=> b!1163395 e!661649))

(declare-fun res!771431 () Bool)

(assert (=> b!1163395 (=> (not res!771431) (not e!661649))))

(declare-datatypes ((V!43953 0))(
  ( (V!43954 (val!14616 Int)) )
))
(declare-datatypes ((tuple2!18656 0))(
  ( (tuple2!18657 (_1!9339 (_ BitVec 64)) (_2!9339 V!43953)) )
))
(declare-datatypes ((List!25391 0))(
  ( (Nil!25388) (Cons!25387 (h!26605 tuple2!18656) (t!36964 List!25391)) )
))
(declare-datatypes ((ListLongMap!16633 0))(
  ( (ListLongMap!16634 (toList!8332 List!25391)) )
))
(declare-fun lt!523655 () ListLongMap!16633)

(declare-fun lt!523672 () ListLongMap!16633)

(assert (=> b!1163395 (= res!771431 (= lt!523655 lt!523672))))

(declare-fun lt!523660 () ListLongMap!16633)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun -!1427 (ListLongMap!16633 (_ BitVec 64)) ListLongMap!16633)

(assert (=> b!1163395 (= lt!523655 (-!1427 lt!523660 k0!934))))

(declare-datatypes ((array!75127 0))(
  ( (array!75128 (arr!36208 (Array (_ BitVec 32) (_ BitVec 64))) (size!36745 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75127)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun lt!523658 () V!43953)

(declare-fun +!3748 (ListLongMap!16633 tuple2!18656) ListLongMap!16633)

(assert (=> b!1163395 (= (-!1427 (+!3748 lt!523672 (tuple2!18657 (select (arr!36208 _keys!1208) from!1455) lt!523658)) (select (arr!36208 _keys!1208) from!1455)) lt!523672)))

(declare-datatypes ((Unit!38318 0))(
  ( (Unit!38319) )
))
(declare-fun lt!523668 () Unit!38318)

(declare-fun addThenRemoveForNewKeyIsSame!255 (ListLongMap!16633 (_ BitVec 64) V!43953) Unit!38318)

(assert (=> b!1163395 (= lt!523668 (addThenRemoveForNewKeyIsSame!255 lt!523672 (select (arr!36208 _keys!1208) from!1455) lt!523658))))

(declare-fun lt!523666 () V!43953)

(declare-datatypes ((ValueCell!13850 0))(
  ( (ValueCellFull!13850 (v!17249 V!43953)) (EmptyCell!13850) )
))
(declare-datatypes ((array!75129 0))(
  ( (array!75130 (arr!36209 (Array (_ BitVec 32) ValueCell!13850)) (size!36746 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75129)

(declare-fun get!18496 (ValueCell!13850 V!43953) V!43953)

(assert (=> b!1163395 (= lt!523658 (get!18496 (select (arr!36209 _values!996) from!1455) lt!523666))))

(declare-fun lt!523657 () Unit!38318)

(declare-fun e!661650 () Unit!38318)

(assert (=> b!1163395 (= lt!523657 e!661650)))

(declare-fun c!116557 () Bool)

(declare-fun contains!6849 (ListLongMap!16633 (_ BitVec 64)) Bool)

(assert (=> b!1163395 (= c!116557 (contains!6849 lt!523672 k0!934))))

(declare-fun zeroValue!944 () V!43953)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!43953)

(declare-fun getCurrentListMapNoExtraKeys!4824 (array!75127 array!75129 (_ BitVec 32) (_ BitVec 32) V!43953 V!43953 (_ BitVec 32) Int) ListLongMap!16633)

(assert (=> b!1163395 (= lt!523672 (getCurrentListMapNoExtraKeys!4824 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1163396 () Bool)

(declare-fun e!661647 () Bool)

(declare-fun tp_is_empty!29119 () Bool)

(assert (=> b!1163396 (= e!661647 tp_is_empty!29119)))

(declare-fun b!1163397 () Bool)

(declare-fun call!56677 () Bool)

(assert (=> b!1163397 call!56677))

(declare-fun lt!523661 () Unit!38318)

(declare-fun call!56676 () Unit!38318)

(assert (=> b!1163397 (= lt!523661 call!56676)))

(declare-fun e!661651 () Unit!38318)

(assert (=> b!1163397 (= e!661651 lt!523661)))

(declare-fun b!1163398 () Bool)

(declare-fun Unit!38320 () Unit!38318)

(assert (=> b!1163398 (= e!661650 Unit!38320)))

(declare-fun e!661648 () Bool)

(declare-fun b!1163399 () Bool)

(declare-fun arrayContainsKey!0 (array!75127 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1163399 (= e!661648 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1163401 () Bool)

(declare-fun res!771440 () Bool)

(declare-fun e!661638 () Bool)

(assert (=> b!1163401 (=> (not res!771440) (not e!661638))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1163401 (= res!771440 (= (select (arr!36208 _keys!1208) i!673) k0!934))))

(declare-fun b!1163402 () Bool)

(declare-fun lt!523663 () array!75129)

(declare-fun lt!523675 () array!75127)

(assert (=> b!1163402 (= e!661649 (= lt!523655 (getCurrentListMapNoExtraKeys!4824 lt!523675 lt!523663 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun c!116560 () Bool)

(declare-fun lt!523665 () ListLongMap!16633)

(declare-fun call!56679 () ListLongMap!16633)

(declare-fun bm!56672 () Bool)

(declare-fun c!116558 () Bool)

(assert (=> bm!56672 (= call!56679 (+!3748 (ite c!116560 lt!523665 lt!523672) (ite c!116560 (tuple2!18657 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!116558 (tuple2!18657 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18657 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun bm!56673 () Bool)

(declare-fun call!56682 () Bool)

(assert (=> bm!56673 (= call!56677 call!56682)))

(declare-fun b!1163403 () Bool)

(declare-fun Unit!38321 () Unit!38318)

(assert (=> b!1163403 (= e!661651 Unit!38321)))

(declare-fun call!56675 () ListLongMap!16633)

(declare-fun c!116559 () Bool)

(declare-fun bm!56674 () Bool)

(assert (=> bm!56674 (= call!56675 (getCurrentListMapNoExtraKeys!4824 (ite c!116559 lt!523675 _keys!1208) (ite c!116559 lt!523663 _values!996) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun call!56678 () ListLongMap!16633)

(declare-fun bm!56675 () Bool)

(assert (=> bm!56675 (= call!56678 (getCurrentListMapNoExtraKeys!4824 (ite c!116559 _keys!1208 lt!523675) (ite c!116559 _values!996 lt!523663) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1163404 () Bool)

(declare-fun e!661644 () Bool)

(assert (=> b!1163404 (= e!661644 e!661636)))

(declare-fun res!771429 () Bool)

(assert (=> b!1163404 (=> res!771429 e!661636)))

(assert (=> b!1163404 (= res!771429 (not (= (select (arr!36208 _keys!1208) from!1455) k0!934)))))

(declare-fun e!661645 () Bool)

(assert (=> b!1163404 e!661645))

(assert (=> b!1163404 (= c!116559 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!523670 () Unit!38318)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!654 (array!75127 array!75129 (_ BitVec 32) (_ BitVec 32) V!43953 V!43953 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38318)

(assert (=> b!1163404 (= lt!523670 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!654 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1163405 () Bool)

(declare-fun e!661643 () Unit!38318)

(declare-fun lt!523669 () Unit!38318)

(assert (=> b!1163405 (= e!661643 lt!523669)))

(assert (=> b!1163405 (= lt!523669 call!56676)))

(assert (=> b!1163405 call!56677))

(declare-fun mapIsEmpty!45503 () Bool)

(declare-fun mapRes!45503 () Bool)

(assert (=> mapIsEmpty!45503 mapRes!45503))

(declare-fun b!1163406 () Bool)

(declare-fun e!661640 () Bool)

(assert (=> b!1163406 (= e!661640 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1163407 () Bool)

(declare-fun res!771432 () Bool)

(assert (=> b!1163407 (=> (not res!771432) (not e!661638))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75127 (_ BitVec 32)) Bool)

(assert (=> b!1163407 (= res!771432 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun res!771433 () Bool)

(assert (=> start!99220 (=> (not res!771433) (not e!661638))))

(assert (=> start!99220 (= res!771433 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36745 _keys!1208))))))

(assert (=> start!99220 e!661638))

(assert (=> start!99220 tp_is_empty!29119))

(declare-fun array_inv!27768 (array!75127) Bool)

(assert (=> start!99220 (array_inv!27768 _keys!1208)))

(assert (=> start!99220 true))

(assert (=> start!99220 tp!86478))

(declare-fun e!661641 () Bool)

(declare-fun array_inv!27769 (array!75129) Bool)

(assert (=> start!99220 (and (array_inv!27769 _values!996) e!661641)))

(declare-fun b!1163400 () Bool)

(declare-fun e!661646 () Bool)

(assert (=> b!1163400 (= e!661638 e!661646)))

(declare-fun res!771436 () Bool)

(assert (=> b!1163400 (=> (not res!771436) (not e!661646))))

(assert (=> b!1163400 (= res!771436 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!523675 mask!1564))))

(assert (=> b!1163400 (= lt!523675 (array!75128 (store (arr!36208 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36745 _keys!1208)))))

(declare-fun mapNonEmpty!45503 () Bool)

(declare-fun tp!86477 () Bool)

(assert (=> mapNonEmpty!45503 (= mapRes!45503 (and tp!86477 e!661647))))

(declare-fun mapRest!45503 () (Array (_ BitVec 32) ValueCell!13850))

(declare-fun mapKey!45503 () (_ BitVec 32))

(declare-fun mapValue!45503 () ValueCell!13850)

(assert (=> mapNonEmpty!45503 (= (arr!36209 _values!996) (store mapRest!45503 mapKey!45503 mapValue!45503))))

(declare-fun b!1163408 () Bool)

(declare-fun lt!523664 () Bool)

(assert (=> b!1163408 (= c!116558 (and (not lt!523664) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!661635 () Unit!38318)

(assert (=> b!1163408 (= e!661635 e!661643)))

(declare-fun b!1163409 () Bool)

(assert (=> b!1163409 (contains!6849 call!56679 k0!934)))

(declare-fun lt!523667 () Unit!38318)

(declare-fun call!56681 () Unit!38318)

(assert (=> b!1163409 (= lt!523667 call!56681)))

(assert (=> b!1163409 call!56682))

(assert (=> b!1163409 (= lt!523665 (+!3748 lt!523672 (tuple2!18657 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!523673 () Unit!38318)

(declare-fun addStillContains!966 (ListLongMap!16633 (_ BitVec 64) V!43953 (_ BitVec 64)) Unit!38318)

(assert (=> b!1163409 (= lt!523673 (addStillContains!966 lt!523672 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(assert (=> b!1163409 (= e!661635 lt!523667)))

(declare-fun b!1163410 () Bool)

(declare-fun res!771439 () Bool)

(assert (=> b!1163410 (=> (not res!771439) (not e!661646))))

(declare-datatypes ((List!25392 0))(
  ( (Nil!25389) (Cons!25388 (h!26606 (_ BitVec 64)) (t!36965 List!25392)) )
))
(declare-fun arrayNoDuplicates!0 (array!75127 (_ BitVec 32) List!25392) Bool)

(assert (=> b!1163410 (= res!771439 (arrayNoDuplicates!0 lt!523675 #b00000000000000000000000000000000 Nil!25389))))

(declare-fun bm!56676 () Bool)

(declare-fun call!56680 () ListLongMap!16633)

(assert (=> bm!56676 (= call!56682 (contains!6849 (ite c!116560 lt!523665 call!56680) k0!934))))

(declare-fun b!1163411 () Bool)

(declare-fun res!771441 () Bool)

(assert (=> b!1163411 (=> (not res!771441) (not e!661638))))

(assert (=> b!1163411 (= res!771441 (and (= (size!36746 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36745 _keys!1208) (size!36746 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun bm!56677 () Bool)

(assert (=> bm!56677 (= call!56681 (addStillContains!966 (ite c!116560 lt!523665 lt!523672) (ite c!116560 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!116558 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!116560 minValue!944 (ite c!116558 zeroValue!944 minValue!944)) k0!934))))

(declare-fun b!1163412 () Bool)

(declare-fun e!661637 () Bool)

(assert (=> b!1163412 (= e!661646 (not e!661637))))

(declare-fun res!771428 () Bool)

(assert (=> b!1163412 (=> res!771428 e!661637)))

(assert (=> b!1163412 (= res!771428 (bvsgt from!1455 i!673))))

(assert (=> b!1163412 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!523662 () Unit!38318)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75127 (_ BitVec 64) (_ BitVec 32)) Unit!38318)

(assert (=> b!1163412 (= lt!523662 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1163413 () Bool)

(declare-fun res!771434 () Bool)

(assert (=> b!1163413 (=> (not res!771434) (not e!661638))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1163413 (= res!771434 (validKeyInArray!0 k0!934))))

(declare-fun b!1163414 () Bool)

(declare-fun e!661639 () Bool)

(assert (=> b!1163414 (= e!661641 (and e!661639 mapRes!45503))))

(declare-fun condMapEmpty!45503 () Bool)

(declare-fun mapDefault!45503 () ValueCell!13850)

(assert (=> b!1163414 (= condMapEmpty!45503 (= (arr!36209 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13850)) mapDefault!45503)))))

(declare-fun b!1163415 () Bool)

(assert (=> b!1163415 (= e!661643 e!661651)))

(declare-fun c!116562 () Bool)

(assert (=> b!1163415 (= c!116562 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!523664))))

(declare-fun b!1163416 () Bool)

(assert (=> b!1163416 (= e!661645 (= call!56675 (-!1427 call!56678 k0!934)))))

(declare-fun bm!56678 () Bool)

(assert (=> bm!56678 (= call!56680 call!56679)))

(declare-fun b!1163417 () Bool)

(assert (=> b!1163417 (= e!661639 tp_is_empty!29119)))

(declare-fun b!1163418 () Bool)

(assert (=> b!1163418 (= e!661640 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!523664) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1163419 () Bool)

(declare-fun res!771435 () Bool)

(assert (=> b!1163419 (=> (not res!771435) (not e!661638))))

(assert (=> b!1163419 (= res!771435 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25389))))

(declare-fun bm!56679 () Bool)

(assert (=> bm!56679 (= call!56676 call!56681)))

(declare-fun b!1163420 () Bool)

(assert (=> b!1163420 (= e!661637 e!661644)))

(declare-fun res!771438 () Bool)

(assert (=> b!1163420 (=> res!771438 e!661644)))

(assert (=> b!1163420 (= res!771438 (not (= from!1455 i!673)))))

(declare-fun lt!523671 () ListLongMap!16633)

(assert (=> b!1163420 (= lt!523671 (getCurrentListMapNoExtraKeys!4824 lt!523675 lt!523663 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1163420 (= lt!523663 (array!75130 (store (arr!36209 _values!996) i!673 (ValueCellFull!13850 lt!523666)) (size!36746 _values!996)))))

(declare-fun dynLambda!2817 (Int (_ BitVec 64)) V!43953)

(assert (=> b!1163420 (= lt!523666 (dynLambda!2817 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1163420 (= lt!523660 (getCurrentListMapNoExtraKeys!4824 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1163421 () Bool)

(declare-fun res!771430 () Bool)

(assert (=> b!1163421 (=> (not res!771430) (not e!661638))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1163421 (= res!771430 (validMask!0 mask!1564))))

(declare-fun b!1163422 () Bool)

(declare-fun res!771437 () Bool)

(assert (=> b!1163422 (=> (not res!771437) (not e!661638))))

(assert (=> b!1163422 (= res!771437 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36745 _keys!1208))))))

(declare-fun b!1163423 () Bool)

(declare-fun Unit!38322 () Unit!38318)

(assert (=> b!1163423 (= e!661650 Unit!38322)))

(assert (=> b!1163423 (= lt!523664 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1163423 (= c!116560 (and (not lt!523664) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!523656 () Unit!38318)

(assert (=> b!1163423 (= lt!523656 e!661635)))

(declare-fun lt!523674 () Unit!38318)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!550 (array!75127 array!75129 (_ BitVec 32) (_ BitVec 32) V!43953 V!43953 (_ BitVec 64) (_ BitVec 32) Int) Unit!38318)

(assert (=> b!1163423 (= lt!523674 (lemmaListMapContainsThenArrayContainsFrom!550 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!116561 () Bool)

(assert (=> b!1163423 (= c!116561 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!771427 () Bool)

(assert (=> b!1163423 (= res!771427 e!661640)))

(assert (=> b!1163423 (=> (not res!771427) (not e!661648))))

(assert (=> b!1163423 e!661648))

(declare-fun lt!523659 () Unit!38318)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!75127 (_ BitVec 32) (_ BitVec 32)) Unit!38318)

(assert (=> b!1163423 (= lt!523659 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1163423 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25389)))

(declare-fun lt!523654 () Unit!38318)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!75127 (_ BitVec 64) (_ BitVec 32) List!25392) Unit!38318)

(assert (=> b!1163423 (= lt!523654 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25389))))

(assert (=> b!1163423 false))

(declare-fun b!1163424 () Bool)

(assert (=> b!1163424 (= e!661645 (= call!56678 call!56675))))

(assert (= (and start!99220 res!771433) b!1163421))

(assert (= (and b!1163421 res!771430) b!1163411))

(assert (= (and b!1163411 res!771441) b!1163407))

(assert (= (and b!1163407 res!771432) b!1163419))

(assert (= (and b!1163419 res!771435) b!1163422))

(assert (= (and b!1163422 res!771437) b!1163413))

(assert (= (and b!1163413 res!771434) b!1163401))

(assert (= (and b!1163401 res!771440) b!1163400))

(assert (= (and b!1163400 res!771436) b!1163410))

(assert (= (and b!1163410 res!771439) b!1163412))

(assert (= (and b!1163412 (not res!771428)) b!1163420))

(assert (= (and b!1163420 (not res!771438)) b!1163404))

(assert (= (and b!1163404 c!116559) b!1163416))

(assert (= (and b!1163404 (not c!116559)) b!1163424))

(assert (= (or b!1163416 b!1163424) bm!56675))

(assert (= (or b!1163416 b!1163424) bm!56674))

(assert (= (and b!1163404 (not res!771429)) b!1163395))

(assert (= (and b!1163395 c!116557) b!1163423))

(assert (= (and b!1163395 (not c!116557)) b!1163398))

(assert (= (and b!1163423 c!116560) b!1163409))

(assert (= (and b!1163423 (not c!116560)) b!1163408))

(assert (= (and b!1163408 c!116558) b!1163405))

(assert (= (and b!1163408 (not c!116558)) b!1163415))

(assert (= (and b!1163415 c!116562) b!1163397))

(assert (= (and b!1163415 (not c!116562)) b!1163403))

(assert (= (or b!1163405 b!1163397) bm!56679))

(assert (= (or b!1163405 b!1163397) bm!56678))

(assert (= (or b!1163405 b!1163397) bm!56673))

(assert (= (or b!1163409 bm!56673) bm!56676))

(assert (= (or b!1163409 bm!56679) bm!56677))

(assert (= (or b!1163409 bm!56678) bm!56672))

(assert (= (and b!1163423 c!116561) b!1163406))

(assert (= (and b!1163423 (not c!116561)) b!1163418))

(assert (= (and b!1163423 res!771427) b!1163399))

(assert (= (and b!1163395 res!771431) b!1163402))

(assert (= (and b!1163414 condMapEmpty!45503) mapIsEmpty!45503))

(assert (= (and b!1163414 (not condMapEmpty!45503)) mapNonEmpty!45503))

(get-info :version)

(assert (= (and mapNonEmpty!45503 ((_ is ValueCellFull!13850) mapValue!45503)) b!1163396))

(assert (= (and b!1163414 ((_ is ValueCellFull!13850) mapDefault!45503)) b!1163417))

(assert (= start!99220 b!1163414))

(declare-fun b_lambda!19689 () Bool)

(assert (=> (not b_lambda!19689) (not b!1163420)))

(declare-fun t!36963 () Bool)

(declare-fun tb!9393 () Bool)

(assert (=> (and start!99220 (= defaultEntry!1004 defaultEntry!1004) t!36963) tb!9393))

(declare-fun result!19359 () Bool)

(assert (=> tb!9393 (= result!19359 tp_is_empty!29119)))

(assert (=> b!1163420 t!36963))

(declare-fun b_and!40031 () Bool)

(assert (= b_and!40029 (and (=> t!36963 result!19359) b_and!40031)))

(declare-fun m!1072413 () Bool)

(assert (=> b!1163410 m!1072413))

(declare-fun m!1072415 () Bool)

(assert (=> b!1163401 m!1072415))

(declare-fun m!1072417 () Bool)

(assert (=> b!1163423 m!1072417))

(declare-fun m!1072419 () Bool)

(assert (=> b!1163423 m!1072419))

(declare-fun m!1072421 () Bool)

(assert (=> b!1163423 m!1072421))

(declare-fun m!1072423 () Bool)

(assert (=> b!1163423 m!1072423))

(declare-fun m!1072425 () Bool)

(assert (=> b!1163404 m!1072425))

(declare-fun m!1072427 () Bool)

(assert (=> b!1163404 m!1072427))

(declare-fun m!1072429 () Bool)

(assert (=> mapNonEmpty!45503 m!1072429))

(declare-fun m!1072431 () Bool)

(assert (=> b!1163406 m!1072431))

(declare-fun m!1072433 () Bool)

(assert (=> b!1163402 m!1072433))

(declare-fun m!1072435 () Bool)

(assert (=> start!99220 m!1072435))

(declare-fun m!1072437 () Bool)

(assert (=> start!99220 m!1072437))

(declare-fun m!1072439 () Bool)

(assert (=> bm!56676 m!1072439))

(declare-fun m!1072441 () Bool)

(assert (=> bm!56677 m!1072441))

(declare-fun m!1072443 () Bool)

(assert (=> b!1163419 m!1072443))

(assert (=> b!1163399 m!1072431))

(declare-fun m!1072445 () Bool)

(assert (=> b!1163413 m!1072445))

(declare-fun m!1072447 () Bool)

(assert (=> b!1163416 m!1072447))

(declare-fun m!1072449 () Bool)

(assert (=> bm!56675 m!1072449))

(declare-fun m!1072451 () Bool)

(assert (=> b!1163395 m!1072451))

(declare-fun m!1072453 () Bool)

(assert (=> b!1163395 m!1072453))

(declare-fun m!1072455 () Bool)

(assert (=> b!1163395 m!1072455))

(assert (=> b!1163395 m!1072425))

(declare-fun m!1072457 () Bool)

(assert (=> b!1163395 m!1072457))

(declare-fun m!1072459 () Bool)

(assert (=> b!1163395 m!1072459))

(assert (=> b!1163395 m!1072425))

(declare-fun m!1072461 () Bool)

(assert (=> b!1163395 m!1072461))

(declare-fun m!1072463 () Bool)

(assert (=> b!1163395 m!1072463))

(assert (=> b!1163395 m!1072453))

(declare-fun m!1072465 () Bool)

(assert (=> b!1163395 m!1072465))

(assert (=> b!1163395 m!1072459))

(assert (=> b!1163395 m!1072425))

(declare-fun m!1072467 () Bool)

(assert (=> b!1163412 m!1072467))

(declare-fun m!1072469 () Bool)

(assert (=> b!1163412 m!1072469))

(declare-fun m!1072471 () Bool)

(assert (=> b!1163400 m!1072471))

(declare-fun m!1072473 () Bool)

(assert (=> b!1163400 m!1072473))

(declare-fun m!1072475 () Bool)

(assert (=> bm!56672 m!1072475))

(declare-fun m!1072477 () Bool)

(assert (=> b!1163420 m!1072477))

(declare-fun m!1072479 () Bool)

(assert (=> b!1163420 m!1072479))

(declare-fun m!1072481 () Bool)

(assert (=> b!1163420 m!1072481))

(declare-fun m!1072483 () Bool)

(assert (=> b!1163420 m!1072483))

(declare-fun m!1072485 () Bool)

(assert (=> b!1163421 m!1072485))

(declare-fun m!1072487 () Bool)

(assert (=> bm!56674 m!1072487))

(declare-fun m!1072489 () Bool)

(assert (=> b!1163407 m!1072489))

(declare-fun m!1072491 () Bool)

(assert (=> b!1163409 m!1072491))

(declare-fun m!1072493 () Bool)

(assert (=> b!1163409 m!1072493))

(declare-fun m!1072495 () Bool)

(assert (=> b!1163409 m!1072495))

(check-sat (not b!1163404) (not b_next!24589) (not b!1163412) (not bm!56675) (not b!1163400) tp_is_empty!29119 (not bm!56676) (not b!1163399) (not b!1163423) (not b_lambda!19689) (not b!1163409) (not bm!56672) (not b!1163413) (not b!1163420) (not b!1163407) (not b!1163421) (not b!1163410) (not b!1163416) (not b!1163406) b_and!40031 (not mapNonEmpty!45503) (not bm!56677) (not b!1163402) (not bm!56674) (not b!1163419) (not b!1163395) (not start!99220))
(check-sat b_and!40031 (not b_next!24589))
