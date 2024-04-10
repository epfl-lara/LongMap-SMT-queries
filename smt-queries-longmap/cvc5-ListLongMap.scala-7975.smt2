; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98690 () Bool)

(assert start!98690)

(declare-fun b_free!24295 () Bool)

(declare-fun b_next!24295 () Bool)

(assert (=> start!98690 (= b_free!24295 (not b_next!24295))))

(declare-fun tp!85595 () Bool)

(declare-fun b_and!39439 () Bool)

(assert (=> start!98690 (= tp!85595 b_and!39439)))

(declare-fun b!1148582 () Bool)

(declare-datatypes ((V!43561 0))(
  ( (V!43562 (val!14469 Int)) )
))
(declare-datatypes ((tuple2!18350 0))(
  ( (tuple2!18351 (_1!9186 (_ BitVec 64)) (_2!9186 V!43561)) )
))
(declare-datatypes ((List!25101 0))(
  ( (Nil!25098) (Cons!25097 (h!26306 tuple2!18350) (t!36388 List!25101)) )
))
(declare-datatypes ((ListLongMap!16319 0))(
  ( (ListLongMap!16320 (toList!8175 List!25101)) )
))
(declare-fun call!53084 () ListLongMap!16319)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun contains!6698 (ListLongMap!16319 (_ BitVec 64)) Bool)

(assert (=> b!1148582 (contains!6698 call!53084 k!934)))

(declare-datatypes ((Unit!37745 0))(
  ( (Unit!37746) )
))
(declare-fun lt!513487 () Unit!37745)

(declare-fun call!53086 () Unit!37745)

(assert (=> b!1148582 (= lt!513487 call!53086)))

(declare-fun call!53087 () Bool)

(assert (=> b!1148582 call!53087))

(declare-fun lt!513499 () ListLongMap!16319)

(declare-fun lt!513494 () ListLongMap!16319)

(declare-fun zeroValue!944 () V!43561)

(declare-fun +!3597 (ListLongMap!16319 tuple2!18350) ListLongMap!16319)

(assert (=> b!1148582 (= lt!513499 (+!3597 lt!513494 (tuple2!18351 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!513493 () Unit!37745)

(declare-fun addStillContains!847 (ListLongMap!16319 (_ BitVec 64) V!43561 (_ BitVec 64)) Unit!37745)

(assert (=> b!1148582 (= lt!513493 (addStillContains!847 lt!513494 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k!934))))

(declare-fun e!653310 () Unit!37745)

(assert (=> b!1148582 (= e!653310 lt!513487)))

(declare-fun b!1148583 () Bool)

(declare-fun e!653317 () Unit!37745)

(declare-fun Unit!37747 () Unit!37745)

(assert (=> b!1148583 (= e!653317 Unit!37747)))

(declare-fun b!1148584 () Bool)

(declare-fun res!764313 () Bool)

(declare-fun e!653309 () Bool)

(assert (=> b!1148584 (=> (not res!764313) (not e!653309))))

(declare-datatypes ((array!74497 0))(
  ( (array!74498 (arr!35899 (Array (_ BitVec 32) (_ BitVec 64))) (size!36435 (_ BitVec 32))) )
))
(declare-fun lt!513485 () array!74497)

(declare-datatypes ((List!25102 0))(
  ( (Nil!25099) (Cons!25098 (h!26307 (_ BitVec 64)) (t!36389 List!25102)) )
))
(declare-fun arrayNoDuplicates!0 (array!74497 (_ BitVec 32) List!25102) Bool)

(assert (=> b!1148584 (= res!764313 (arrayNoDuplicates!0 lt!513485 #b00000000000000000000000000000000 Nil!25099))))

(declare-fun _keys!1208 () array!74497)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13703 0))(
  ( (ValueCellFull!13703 (v!17106 V!43561)) (EmptyCell!13703) )
))
(declare-datatypes ((array!74499 0))(
  ( (array!74500 (arr!35900 (Array (_ BitVec 32) ValueCell!13703)) (size!36436 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74499)

(declare-fun minValue!944 () V!43561)

(declare-fun call!53082 () ListLongMap!16319)

(declare-fun bm!53079 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!4648 (array!74497 array!74499 (_ BitVec 32) (_ BitVec 32) V!43561 V!43561 (_ BitVec 32) Int) ListLongMap!16319)

(assert (=> bm!53079 (= call!53082 (getCurrentListMapNoExtraKeys!4648 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!513495 () ListLongMap!16319)

(declare-fun b!1148585 () Bool)

(declare-fun e!653318 () Bool)

(declare-fun -!1310 (ListLongMap!16319 (_ BitVec 64)) ListLongMap!16319)

(assert (=> b!1148585 (= e!653318 (= (-!1310 lt!513495 k!934) lt!513494))))

(declare-fun lt!513489 () array!74499)

(declare-fun call!53089 () ListLongMap!16319)

(declare-fun bm!53080 () Bool)

(assert (=> bm!53080 (= call!53089 (getCurrentListMapNoExtraKeys!4648 lt!513485 lt!513489 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1148586 () Bool)

(declare-fun e!653312 () Bool)

(declare-fun tp_is_empty!28825 () Bool)

(assert (=> b!1148586 (= e!653312 tp_is_empty!28825)))

(declare-fun b!1148587 () Bool)

(declare-fun res!764316 () Bool)

(declare-fun e!653322 () Bool)

(assert (=> b!1148587 (=> (not res!764316) (not e!653322))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1148587 (= res!764316 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36435 _keys!1208))))))

(declare-fun bm!53081 () Bool)

(declare-fun call!53088 () Bool)

(assert (=> bm!53081 (= call!53088 call!53087)))

(declare-fun b!1148588 () Bool)

(declare-fun res!764304 () Bool)

(assert (=> b!1148588 (=> (not res!764304) (not e!653322))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74497 (_ BitVec 32)) Bool)

(assert (=> b!1148588 (= res!764304 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1148589 () Bool)

(declare-fun res!764314 () Bool)

(assert (=> b!1148589 (=> (not res!764314) (not e!653322))))

(assert (=> b!1148589 (= res!764314 (= (select (arr!35899 _keys!1208) i!673) k!934))))

(declare-fun b!1148590 () Bool)

(declare-fun e!653315 () Bool)

(declare-fun arrayContainsKey!0 (array!74497 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1148590 (= e!653315 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1148591 () Bool)

(declare-fun e!653307 () Bool)

(assert (=> b!1148591 (= e!653307 tp_is_empty!28825)))

(declare-fun b!1148592 () Bool)

(declare-fun res!764307 () Bool)

(assert (=> b!1148592 (=> (not res!764307) (not e!653322))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1148592 (= res!764307 (validKeyInArray!0 k!934))))

(declare-fun b!1148593 () Bool)

(declare-fun e!653314 () Unit!37745)

(declare-fun lt!513502 () Unit!37745)

(assert (=> b!1148593 (= e!653314 lt!513502)))

(declare-fun call!53083 () Unit!37745)

(assert (=> b!1148593 (= lt!513502 call!53083)))

(assert (=> b!1148593 call!53088))

(declare-fun b!1148594 () Bool)

(declare-fun res!764306 () Bool)

(assert (=> b!1148594 (=> (not res!764306) (not e!653322))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1148594 (= res!764306 (validMask!0 mask!1564))))

(declare-fun b!1148595 () Bool)

(declare-fun e!653316 () Bool)

(declare-fun e!653320 () Bool)

(assert (=> b!1148595 (= e!653316 e!653320)))

(declare-fun res!764305 () Bool)

(assert (=> b!1148595 (=> res!764305 e!653320)))

(assert (=> b!1148595 (= res!764305 (not (= from!1455 i!673)))))

(declare-fun lt!513491 () ListLongMap!16319)

(assert (=> b!1148595 (= lt!513491 (getCurrentListMapNoExtraKeys!4648 lt!513485 lt!513489 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!513484 () V!43561)

(assert (=> b!1148595 (= lt!513489 (array!74500 (store (arr!35900 _values!996) i!673 (ValueCellFull!13703 lt!513484)) (size!36436 _values!996)))))

(declare-fun dynLambda!2676 (Int (_ BitVec 64)) V!43561)

(assert (=> b!1148595 (= lt!513484 (dynLambda!2676 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1148595 (= lt!513495 (getCurrentListMapNoExtraKeys!4648 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1148596 () Bool)

(declare-fun res!764309 () Bool)

(assert (=> b!1148596 (=> (not res!764309) (not e!653322))))

(assert (=> b!1148596 (= res!764309 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25099))))

(declare-fun lt!513486 () Bool)

(declare-fun e!653313 () Bool)

(declare-fun b!1148597 () Bool)

(assert (=> b!1148597 (= e!653313 (ite (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!513486) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1148598 () Bool)

(assert (=> b!1148598 (= e!653314 e!653317)))

(declare-fun c!113515 () Bool)

(assert (=> b!1148598 (= c!113515 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!513486))))

(declare-fun b!1148599 () Bool)

(declare-fun e!653311 () Unit!37745)

(declare-fun Unit!37748 () Unit!37745)

(assert (=> b!1148599 (= e!653311 Unit!37748)))

(declare-fun b!1148600 () Bool)

(assert (=> b!1148600 (= e!653313 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1148601 () Bool)

(assert (=> b!1148601 (= e!653309 (not e!653316))))

(declare-fun res!764317 () Bool)

(assert (=> b!1148601 (=> res!764317 e!653316)))

(assert (=> b!1148601 (= res!764317 (bvsgt from!1455 i!673))))

(assert (=> b!1148601 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!513501 () Unit!37745)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74497 (_ BitVec 64) (_ BitVec 32)) Unit!37745)

(assert (=> b!1148601 (= lt!513501 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1148602 () Bool)

(assert (=> b!1148602 (= e!653322 e!653309)))

(declare-fun res!764318 () Bool)

(assert (=> b!1148602 (=> (not res!764318) (not e!653309))))

(assert (=> b!1148602 (= res!764318 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!513485 mask!1564))))

(assert (=> b!1148602 (= lt!513485 (array!74498 (store (arr!35899 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36435 _keys!1208)))))

(declare-fun bm!53082 () Bool)

(declare-fun c!113517 () Bool)

(declare-fun c!113514 () Bool)

(assert (=> bm!53082 (= call!53084 (+!3597 (ite c!113517 lt!513499 lt!513494) (ite c!113517 (tuple2!18351 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!113514 (tuple2!18351 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18351 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun e!653306 () Bool)

(declare-fun b!1148603 () Bool)

(assert (=> b!1148603 (= e!653306 (= call!53089 (-!1310 call!53082 k!934)))))

(declare-fun b!1148604 () Bool)

(assert (=> b!1148604 call!53088))

(declare-fun lt!513492 () Unit!37745)

(assert (=> b!1148604 (= lt!513492 call!53083)))

(assert (=> b!1148604 (= e!653317 lt!513492)))

(declare-fun b!1148605 () Bool)

(declare-fun Unit!37749 () Unit!37745)

(assert (=> b!1148605 (= e!653311 Unit!37749)))

(assert (=> b!1148605 (= lt!513486 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1148605 (= c!113517 (and (not lt!513486) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!513504 () Unit!37745)

(assert (=> b!1148605 (= lt!513504 e!653310)))

(declare-fun lt!513490 () Unit!37745)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!443 (array!74497 array!74499 (_ BitVec 32) (_ BitVec 32) V!43561 V!43561 (_ BitVec 64) (_ BitVec 32) Int) Unit!37745)

(assert (=> b!1148605 (= lt!513490 (lemmaListMapContainsThenArrayContainsFrom!443 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!113516 () Bool)

(assert (=> b!1148605 (= c!113516 (and (not (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!764315 () Bool)

(assert (=> b!1148605 (= res!764315 e!653313)))

(assert (=> b!1148605 (=> (not res!764315) (not e!653315))))

(assert (=> b!1148605 e!653315))

(declare-fun lt!513498 () Unit!37745)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74497 (_ BitVec 32) (_ BitVec 32)) Unit!37745)

(assert (=> b!1148605 (= lt!513498 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1148605 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25099)))

(declare-fun lt!513488 () Unit!37745)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74497 (_ BitVec 64) (_ BitVec 32) List!25102) Unit!37745)

(assert (=> b!1148605 (= lt!513488 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k!934 from!1455 Nil!25099))))

(assert (=> b!1148605 false))

(declare-fun bm!53083 () Bool)

(assert (=> bm!53083 (= call!53086 (addStillContains!847 (ite c!113517 lt!513499 lt!513494) (ite c!113517 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!113514 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!113517 minValue!944 (ite c!113514 zeroValue!944 minValue!944)) k!934))))

(declare-fun b!1148606 () Bool)

(declare-fun e!653308 () Bool)

(assert (=> b!1148606 (= e!653320 e!653308)))

(declare-fun res!764310 () Bool)

(assert (=> b!1148606 (=> res!764310 e!653308)))

(assert (=> b!1148606 (= res!764310 (not (= (select (arr!35899 _keys!1208) from!1455) k!934)))))

(assert (=> b!1148606 e!653306))

(declare-fun c!113518 () Bool)

(assert (=> b!1148606 (= c!113518 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!513503 () Unit!37745)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!548 (array!74497 array!74499 (_ BitVec 32) (_ BitVec 32) V!43561 V!43561 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37745)

(assert (=> b!1148606 (= lt!513503 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!548 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!53084 () Bool)

(declare-fun call!53085 () ListLongMap!16319)

(assert (=> bm!53084 (= call!53085 call!53084)))

(declare-fun bm!53085 () Bool)

(assert (=> bm!53085 (= call!53083 call!53086)))

(declare-fun b!1148607 () Bool)

(assert (=> b!1148607 (= e!653308 true)))

(assert (=> b!1148607 e!653318))

(declare-fun res!764308 () Bool)

(assert (=> b!1148607 (=> (not res!764308) (not e!653318))))

(declare-fun lt!513500 () V!43561)

(assert (=> b!1148607 (= res!764308 (= (-!1310 (+!3597 lt!513494 (tuple2!18351 (select (arr!35899 _keys!1208) from!1455) lt!513500)) (select (arr!35899 _keys!1208) from!1455)) lt!513494))))

(declare-fun lt!513496 () Unit!37745)

(declare-fun addThenRemoveForNewKeyIsSame!155 (ListLongMap!16319 (_ BitVec 64) V!43561) Unit!37745)

(assert (=> b!1148607 (= lt!513496 (addThenRemoveForNewKeyIsSame!155 lt!513494 (select (arr!35899 _keys!1208) from!1455) lt!513500))))

(declare-fun get!18267 (ValueCell!13703 V!43561) V!43561)

(assert (=> b!1148607 (= lt!513500 (get!18267 (select (arr!35900 _values!996) from!1455) lt!513484))))

(declare-fun lt!513497 () Unit!37745)

(assert (=> b!1148607 (= lt!513497 e!653311)))

(declare-fun c!113513 () Bool)

(assert (=> b!1148607 (= c!113513 (contains!6698 lt!513494 k!934))))

(assert (=> b!1148607 (= lt!513494 (getCurrentListMapNoExtraKeys!4648 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1148608 () Bool)

(assert (=> b!1148608 (= e!653306 (= call!53089 call!53082))))

(declare-fun b!1148609 () Bool)

(assert (=> b!1148609 (= c!113514 (and (not lt!513486) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1148609 (= e!653310 e!653314)))

(declare-fun bm!53086 () Bool)

(assert (=> bm!53086 (= call!53087 (contains!6698 (ite c!113517 lt!513499 call!53085) k!934))))

(declare-fun b!1148610 () Bool)

(declare-fun res!764312 () Bool)

(assert (=> b!1148610 (=> (not res!764312) (not e!653322))))

(assert (=> b!1148610 (= res!764312 (and (= (size!36436 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36435 _keys!1208) (size!36436 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!45062 () Bool)

(declare-fun mapRes!45062 () Bool)

(assert (=> mapIsEmpty!45062 mapRes!45062))

(declare-fun mapNonEmpty!45062 () Bool)

(declare-fun tp!85596 () Bool)

(assert (=> mapNonEmpty!45062 (= mapRes!45062 (and tp!85596 e!653307))))

(declare-fun mapKey!45062 () (_ BitVec 32))

(declare-fun mapValue!45062 () ValueCell!13703)

(declare-fun mapRest!45062 () (Array (_ BitVec 32) ValueCell!13703))

(assert (=> mapNonEmpty!45062 (= (arr!35900 _values!996) (store mapRest!45062 mapKey!45062 mapValue!45062))))

(declare-fun b!1148611 () Bool)

(declare-fun e!653319 () Bool)

(assert (=> b!1148611 (= e!653319 (and e!653312 mapRes!45062))))

(declare-fun condMapEmpty!45062 () Bool)

(declare-fun mapDefault!45062 () ValueCell!13703)

