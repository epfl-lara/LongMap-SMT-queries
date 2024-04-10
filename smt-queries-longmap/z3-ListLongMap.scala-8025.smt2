; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98992 () Bool)

(assert start!98992)

(declare-fun b_free!24597 () Bool)

(declare-fun b_next!24597 () Bool)

(assert (=> start!98992 (= b_free!24597 (not b_next!24597))))

(declare-fun tp!86501 () Bool)

(declare-fun b_and!40043 () Bool)

(assert (=> start!98992 (= tp!86501 b_and!40043)))

(declare-fun b!1162474 () Bool)

(declare-fun res!771104 () Bool)

(declare-fun e!661014 () Bool)

(assert (=> b!1162474 (=> (not res!771104) (not e!661014))))

(declare-datatypes ((array!75093 0))(
  ( (array!75094 (arr!36197 (Array (_ BitVec 32) (_ BitVec 64))) (size!36733 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75093)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75093 (_ BitVec 32)) Bool)

(assert (=> b!1162474 (= res!771104 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1162475 () Bool)

(declare-fun e!661016 () Bool)

(assert (=> b!1162475 (= e!661016 true)))

(declare-fun e!661018 () Bool)

(assert (=> b!1162475 e!661018))

(declare-fun res!771107 () Bool)

(assert (=> b!1162475 (=> (not res!771107) (not e!661018))))

(declare-datatypes ((V!43963 0))(
  ( (V!43964 (val!14620 Int)) )
))
(declare-datatypes ((tuple2!18636 0))(
  ( (tuple2!18637 (_1!9329 (_ BitVec 64)) (_2!9329 V!43963)) )
))
(declare-datatypes ((List!25370 0))(
  ( (Nil!25367) (Cons!25366 (h!26575 tuple2!18636) (t!36959 List!25370)) )
))
(declare-datatypes ((ListLongMap!16605 0))(
  ( (ListLongMap!16606 (toList!8318 List!25370)) )
))
(declare-fun lt!523451 () ListLongMap!16605)

(declare-fun lt!523439 () ListLongMap!16605)

(assert (=> b!1162475 (= res!771107 (= lt!523451 lt!523439))))

(declare-fun lt!523455 () ListLongMap!16605)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun -!1424 (ListLongMap!16605 (_ BitVec 64)) ListLongMap!16605)

(assert (=> b!1162475 (= lt!523451 (-!1424 lt!523455 k0!934))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun lt!523437 () V!43963)

(declare-fun +!3722 (ListLongMap!16605 tuple2!18636) ListLongMap!16605)

(assert (=> b!1162475 (= (-!1424 (+!3722 lt!523439 (tuple2!18637 (select (arr!36197 _keys!1208) from!1455) lt!523437)) (select (arr!36197 _keys!1208) from!1455)) lt!523439)))

(declare-datatypes ((Unit!38354 0))(
  ( (Unit!38355) )
))
(declare-fun lt!523446 () Unit!38354)

(declare-fun addThenRemoveForNewKeyIsSame!258 (ListLongMap!16605 (_ BitVec 64) V!43963) Unit!38354)

(assert (=> b!1162475 (= lt!523446 (addThenRemoveForNewKeyIsSame!258 lt!523439 (select (arr!36197 _keys!1208) from!1455) lt!523437))))

(declare-fun lt!523434 () V!43963)

(declare-datatypes ((ValueCell!13854 0))(
  ( (ValueCellFull!13854 (v!17257 V!43963)) (EmptyCell!13854) )
))
(declare-datatypes ((array!75095 0))(
  ( (array!75096 (arr!36198 (Array (_ BitVec 32) ValueCell!13854)) (size!36734 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75095)

(declare-fun get!18470 (ValueCell!13854 V!43963) V!43963)

(assert (=> b!1162475 (= lt!523437 (get!18470 (select (arr!36198 _values!996) from!1455) lt!523434))))

(declare-fun lt!523450 () Unit!38354)

(declare-fun e!661012 () Unit!38354)

(assert (=> b!1162475 (= lt!523450 e!661012)))

(declare-fun c!116236 () Bool)

(declare-fun contains!6823 (ListLongMap!16605 (_ BitVec 64)) Bool)

(assert (=> b!1162475 (= c!116236 (contains!6823 lt!523439 k0!934))))

(declare-fun zeroValue!944 () V!43963)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!43963)

(declare-fun getCurrentListMapNoExtraKeys!4782 (array!75093 array!75095 (_ BitVec 32) (_ BitVec 32) V!43963 V!43963 (_ BitVec 32) Int) ListLongMap!16605)

(assert (=> b!1162475 (= lt!523439 (getCurrentListMapNoExtraKeys!4782 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun res!771110 () Bool)

(assert (=> start!98992 (=> (not res!771110) (not e!661014))))

(assert (=> start!98992 (= res!771110 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36733 _keys!1208))))))

(assert (=> start!98992 e!661014))

(declare-fun tp_is_empty!29127 () Bool)

(assert (=> start!98992 tp_is_empty!29127))

(declare-fun array_inv!27698 (array!75093) Bool)

(assert (=> start!98992 (array_inv!27698 _keys!1208)))

(assert (=> start!98992 true))

(assert (=> start!98992 tp!86501))

(declare-fun e!661022 () Bool)

(declare-fun array_inv!27699 (array!75095) Bool)

(assert (=> start!98992 (and (array_inv!27699 _values!996) e!661022)))

(declare-fun b!1162476 () Bool)

(declare-fun e!661011 () Bool)

(declare-fun e!661020 () Bool)

(assert (=> b!1162476 (= e!661011 (not e!661020))))

(declare-fun res!771113 () Bool)

(assert (=> b!1162476 (=> res!771113 e!661020)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1162476 (= res!771113 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!75093 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1162476 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!523444 () Unit!38354)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75093 (_ BitVec 64) (_ BitVec 32)) Unit!38354)

(assert (=> b!1162476 (= lt!523444 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1162477 () Bool)

(declare-fun e!661019 () Unit!38354)

(declare-fun Unit!38356 () Unit!38354)

(assert (=> b!1162477 (= e!661019 Unit!38356)))

(declare-fun b!1162478 () Bool)

(declare-fun res!771105 () Bool)

(assert (=> b!1162478 (=> (not res!771105) (not e!661014))))

(assert (=> b!1162478 (= res!771105 (= (select (arr!36197 _keys!1208) i!673) k0!934))))

(declare-fun c!116234 () Bool)

(declare-fun c!116232 () Bool)

(declare-fun call!56706 () ListLongMap!16605)

(declare-fun bm!56703 () Bool)

(assert (=> bm!56703 (= call!56706 (+!3722 lt!523439 (ite (or c!116232 c!116234) (tuple2!18637 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18637 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun e!661017 () Bool)

(declare-fun b!1162479 () Bool)

(assert (=> b!1162479 (= e!661017 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1162480 () Bool)

(declare-fun res!771100 () Bool)

(assert (=> b!1162480 (=> (not res!771100) (not e!661014))))

(declare-datatypes ((List!25371 0))(
  ( (Nil!25368) (Cons!25367 (h!26576 (_ BitVec 64)) (t!36960 List!25371)) )
))
(declare-fun arrayNoDuplicates!0 (array!75093 (_ BitVec 32) List!25371) Bool)

(assert (=> b!1162480 (= res!771100 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25368))))

(declare-fun c!116235 () Bool)

(declare-fun call!56707 () ListLongMap!16605)

(declare-fun bm!56704 () Bool)

(declare-fun lt!523447 () array!75095)

(declare-fun lt!523436 () array!75093)

(assert (=> bm!56704 (= call!56707 (getCurrentListMapNoExtraKeys!4782 (ite c!116235 _keys!1208 lt!523436) (ite c!116235 _values!996 lt!523447) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1162481 () Bool)

(declare-fun e!661009 () Bool)

(assert (=> b!1162481 (= e!661009 tp_is_empty!29127)))

(declare-fun b!1162482 () Bool)

(declare-fun res!771112 () Bool)

(assert (=> b!1162482 (=> (not res!771112) (not e!661014))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1162482 (= res!771112 (validMask!0 mask!1564))))

(declare-fun b!1162483 () Bool)

(assert (=> b!1162483 (= e!661014 e!661011)))

(declare-fun res!771103 () Bool)

(assert (=> b!1162483 (=> (not res!771103) (not e!661011))))

(assert (=> b!1162483 (= res!771103 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!523436 mask!1564))))

(assert (=> b!1162483 (= lt!523436 (array!75094 (store (arr!36197 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36733 _keys!1208)))))

(declare-fun bm!56705 () Bool)

(declare-fun call!56712 () ListLongMap!16605)

(assert (=> bm!56705 (= call!56712 call!56706)))

(declare-fun b!1162484 () Bool)

(declare-fun call!56709 () Bool)

(assert (=> b!1162484 call!56709))

(declare-fun lt!523453 () Unit!38354)

(declare-fun call!56710 () Unit!38354)

(assert (=> b!1162484 (= lt!523453 call!56710)))

(assert (=> b!1162484 (= e!661019 lt!523453)))

(declare-fun b!1162485 () Bool)

(declare-fun mapRes!45515 () Bool)

(assert (=> b!1162485 (= e!661022 (and e!661009 mapRes!45515))))

(declare-fun condMapEmpty!45515 () Bool)

(declare-fun mapDefault!45515 () ValueCell!13854)

(assert (=> b!1162485 (= condMapEmpty!45515 (= (arr!36198 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13854)) mapDefault!45515)))))

(declare-fun b!1162486 () Bool)

(declare-fun Unit!38357 () Unit!38354)

(assert (=> b!1162486 (= e!661012 Unit!38357)))

(declare-fun b!1162487 () Bool)

(declare-fun e!661008 () Bool)

(assert (=> b!1162487 (= e!661008 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1162488 () Bool)

(declare-fun res!771099 () Bool)

(assert (=> b!1162488 (=> (not res!771099) (not e!661014))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1162488 (= res!771099 (validKeyInArray!0 k0!934))))

(declare-fun b!1162489 () Bool)

(declare-fun lt!523438 () Bool)

(assert (=> b!1162489 (= e!661008 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!523438) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1162490 () Bool)

(declare-fun e!661013 () Bool)

(declare-fun call!56711 () ListLongMap!16605)

(assert (=> b!1162490 (= e!661013 (= call!56707 call!56711))))

(declare-fun b!1162491 () Bool)

(assert (=> b!1162491 (= c!116234 (and (not lt!523438) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!661007 () Unit!38354)

(declare-fun e!661021 () Unit!38354)

(assert (=> b!1162491 (= e!661007 e!661021)))

(declare-fun b!1162492 () Bool)

(assert (=> b!1162492 (= e!661018 (= lt!523451 (getCurrentListMapNoExtraKeys!4782 lt!523436 lt!523447 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun call!56713 () Bool)

(declare-fun lt!523449 () ListLongMap!16605)

(declare-fun bm!56706 () Bool)

(assert (=> bm!56706 (= call!56713 (contains!6823 (ite c!116232 lt!523449 call!56712) k0!934))))

(declare-fun b!1162493 () Bool)

(declare-fun lt!523445 () Unit!38354)

(assert (=> b!1162493 (= e!661021 lt!523445)))

(assert (=> b!1162493 (= lt!523445 call!56710)))

(assert (=> b!1162493 call!56709))

(declare-fun bm!56707 () Bool)

(assert (=> bm!56707 (= call!56709 call!56713)))

(declare-fun bm!56708 () Bool)

(declare-fun call!56708 () Unit!38354)

(declare-fun addStillContains!963 (ListLongMap!16605 (_ BitVec 64) V!43963 (_ BitVec 64)) Unit!38354)

(assert (=> bm!56708 (= call!56708 (addStillContains!963 lt!523439 (ite (or c!116232 c!116234) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!116232 c!116234) zeroValue!944 minValue!944) k0!934))))

(declare-fun b!1162494 () Bool)

(declare-fun Unit!38358 () Unit!38354)

(assert (=> b!1162494 (= e!661012 Unit!38358)))

(assert (=> b!1162494 (= lt!523438 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1162494 (= c!116232 (and (not lt!523438) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!523441 () Unit!38354)

(assert (=> b!1162494 (= lt!523441 e!661007)))

(declare-fun lt!523454 () Unit!38354)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!548 (array!75093 array!75095 (_ BitVec 32) (_ BitVec 32) V!43963 V!43963 (_ BitVec 64) (_ BitVec 32) Int) Unit!38354)

(assert (=> b!1162494 (= lt!523454 (lemmaListMapContainsThenArrayContainsFrom!548 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!116231 () Bool)

(assert (=> b!1162494 (= c!116231 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!771111 () Bool)

(assert (=> b!1162494 (= res!771111 e!661008)))

(assert (=> b!1162494 (=> (not res!771111) (not e!661017))))

(assert (=> b!1162494 e!661017))

(declare-fun lt!523440 () Unit!38354)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!75093 (_ BitVec 32) (_ BitVec 32)) Unit!38354)

(assert (=> b!1162494 (= lt!523440 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1162494 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25368)))

(declare-fun lt!523448 () Unit!38354)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!75093 (_ BitVec 64) (_ BitVec 32) List!25371) Unit!38354)

(assert (=> b!1162494 (= lt!523448 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25368))))

(assert (=> b!1162494 false))

(declare-fun b!1162495 () Bool)

(declare-fun e!661015 () Bool)

(assert (=> b!1162495 (= e!661015 e!661016)))

(declare-fun res!771102 () Bool)

(assert (=> b!1162495 (=> res!771102 e!661016)))

(assert (=> b!1162495 (= res!771102 (not (= (select (arr!36197 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1162495 e!661013))

(assert (=> b!1162495 (= c!116235 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!523452 () Unit!38354)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!653 (array!75093 array!75095 (_ BitVec 32) (_ BitVec 32) V!43963 V!43963 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38354)

(assert (=> b!1162495 (= lt!523452 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!653 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1162496 () Bool)

(assert (=> b!1162496 (= e!661013 (= call!56711 (-!1424 call!56707 k0!934)))))

(declare-fun b!1162497 () Bool)

(declare-fun e!661023 () Bool)

(assert (=> b!1162497 (= e!661023 tp_is_empty!29127)))

(declare-fun bm!56709 () Bool)

(assert (=> bm!56709 (= call!56711 (getCurrentListMapNoExtraKeys!4782 (ite c!116235 lt!523436 _keys!1208) (ite c!116235 lt!523447 _values!996) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1162498 () Bool)

(declare-fun res!771101 () Bool)

(assert (=> b!1162498 (=> (not res!771101) (not e!661014))))

(assert (=> b!1162498 (= res!771101 (and (= (size!36734 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36733 _keys!1208) (size!36734 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1162499 () Bool)

(declare-fun res!771106 () Bool)

(assert (=> b!1162499 (=> (not res!771106) (not e!661014))))

(assert (=> b!1162499 (= res!771106 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36733 _keys!1208))))))

(declare-fun b!1162500 () Bool)

(assert (=> b!1162500 (contains!6823 (+!3722 lt!523449 (tuple2!18637 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun lt!523435 () Unit!38354)

(assert (=> b!1162500 (= lt!523435 (addStillContains!963 lt!523449 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(assert (=> b!1162500 call!56713))

(assert (=> b!1162500 (= lt!523449 call!56706)))

(declare-fun lt!523443 () Unit!38354)

(assert (=> b!1162500 (= lt!523443 call!56708)))

(assert (=> b!1162500 (= e!661007 lt!523435)))

(declare-fun mapIsEmpty!45515 () Bool)

(assert (=> mapIsEmpty!45515 mapRes!45515))

(declare-fun bm!56710 () Bool)

(assert (=> bm!56710 (= call!56710 call!56708)))

(declare-fun b!1162501 () Bool)

(declare-fun res!771109 () Bool)

(assert (=> b!1162501 (=> (not res!771109) (not e!661011))))

(assert (=> b!1162501 (= res!771109 (arrayNoDuplicates!0 lt!523436 #b00000000000000000000000000000000 Nil!25368))))

(declare-fun b!1162502 () Bool)

(assert (=> b!1162502 (= e!661021 e!661019)))

(declare-fun c!116233 () Bool)

(assert (=> b!1162502 (= c!116233 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!523438))))

(declare-fun b!1162503 () Bool)

(assert (=> b!1162503 (= e!661020 e!661015)))

(declare-fun res!771108 () Bool)

(assert (=> b!1162503 (=> res!771108 e!661015)))

(assert (=> b!1162503 (= res!771108 (not (= from!1455 i!673)))))

(declare-fun lt!523442 () ListLongMap!16605)

(assert (=> b!1162503 (= lt!523442 (getCurrentListMapNoExtraKeys!4782 lt!523436 lt!523447 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1162503 (= lt!523447 (array!75096 (store (arr!36198 _values!996) i!673 (ValueCellFull!13854 lt!523434)) (size!36734 _values!996)))))

(declare-fun dynLambda!2778 (Int (_ BitVec 64)) V!43963)

(assert (=> b!1162503 (= lt!523434 (dynLambda!2778 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1162503 (= lt!523455 (getCurrentListMapNoExtraKeys!4782 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun mapNonEmpty!45515 () Bool)

(declare-fun tp!86502 () Bool)

(assert (=> mapNonEmpty!45515 (= mapRes!45515 (and tp!86502 e!661023))))

(declare-fun mapRest!45515 () (Array (_ BitVec 32) ValueCell!13854))

(declare-fun mapKey!45515 () (_ BitVec 32))

(declare-fun mapValue!45515 () ValueCell!13854)

(assert (=> mapNonEmpty!45515 (= (arr!36198 _values!996) (store mapRest!45515 mapKey!45515 mapValue!45515))))

(assert (= (and start!98992 res!771110) b!1162482))

(assert (= (and b!1162482 res!771112) b!1162498))

(assert (= (and b!1162498 res!771101) b!1162474))

(assert (= (and b!1162474 res!771104) b!1162480))

(assert (= (and b!1162480 res!771100) b!1162499))

(assert (= (and b!1162499 res!771106) b!1162488))

(assert (= (and b!1162488 res!771099) b!1162478))

(assert (= (and b!1162478 res!771105) b!1162483))

(assert (= (and b!1162483 res!771103) b!1162501))

(assert (= (and b!1162501 res!771109) b!1162476))

(assert (= (and b!1162476 (not res!771113)) b!1162503))

(assert (= (and b!1162503 (not res!771108)) b!1162495))

(assert (= (and b!1162495 c!116235) b!1162496))

(assert (= (and b!1162495 (not c!116235)) b!1162490))

(assert (= (or b!1162496 b!1162490) bm!56704))

(assert (= (or b!1162496 b!1162490) bm!56709))

(assert (= (and b!1162495 (not res!771102)) b!1162475))

(assert (= (and b!1162475 c!116236) b!1162494))

(assert (= (and b!1162475 (not c!116236)) b!1162486))

(assert (= (and b!1162494 c!116232) b!1162500))

(assert (= (and b!1162494 (not c!116232)) b!1162491))

(assert (= (and b!1162491 c!116234) b!1162493))

(assert (= (and b!1162491 (not c!116234)) b!1162502))

(assert (= (and b!1162502 c!116233) b!1162484))

(assert (= (and b!1162502 (not c!116233)) b!1162477))

(assert (= (or b!1162493 b!1162484) bm!56710))

(assert (= (or b!1162493 b!1162484) bm!56705))

(assert (= (or b!1162493 b!1162484) bm!56707))

(assert (= (or b!1162500 bm!56707) bm!56706))

(assert (= (or b!1162500 bm!56710) bm!56708))

(assert (= (or b!1162500 bm!56705) bm!56703))

(assert (= (and b!1162494 c!116231) b!1162487))

(assert (= (and b!1162494 (not c!116231)) b!1162489))

(assert (= (and b!1162494 res!771111) b!1162479))

(assert (= (and b!1162475 res!771107) b!1162492))

(assert (= (and b!1162485 condMapEmpty!45515) mapIsEmpty!45515))

(assert (= (and b!1162485 (not condMapEmpty!45515)) mapNonEmpty!45515))

(get-info :version)

(assert (= (and mapNonEmpty!45515 ((_ is ValueCellFull!13854) mapValue!45515)) b!1162497))

(assert (= (and b!1162485 ((_ is ValueCellFull!13854) mapDefault!45515)) b!1162481))

(assert (= start!98992 b!1162485))

(declare-fun b_lambda!19703 () Bool)

(assert (=> (not b_lambda!19703) (not b!1162503)))

(declare-fun t!36958 () Bool)

(declare-fun tb!9409 () Bool)

(assert (=> (and start!98992 (= defaultEntry!1004 defaultEntry!1004) t!36958) tb!9409))

(declare-fun result!19383 () Bool)

(assert (=> tb!9409 (= result!19383 tp_is_empty!29127)))

(assert (=> b!1162503 t!36958))

(declare-fun b_and!40045 () Bool)

(assert (= b_and!40043 (and (=> t!36958 result!19383) b_and!40045)))

(declare-fun m!1071165 () Bool)

(assert (=> b!1162476 m!1071165))

(declare-fun m!1071167 () Bool)

(assert (=> b!1162476 m!1071167))

(declare-fun m!1071169 () Bool)

(assert (=> b!1162495 m!1071169))

(declare-fun m!1071171 () Bool)

(assert (=> b!1162495 m!1071171))

(declare-fun m!1071173 () Bool)

(assert (=> b!1162501 m!1071173))

(declare-fun m!1071175 () Bool)

(assert (=> b!1162496 m!1071175))

(declare-fun m!1071177 () Bool)

(assert (=> b!1162494 m!1071177))

(declare-fun m!1071179 () Bool)

(assert (=> b!1162494 m!1071179))

(declare-fun m!1071181 () Bool)

(assert (=> b!1162494 m!1071181))

(declare-fun m!1071183 () Bool)

(assert (=> b!1162494 m!1071183))

(declare-fun m!1071185 () Bool)

(assert (=> bm!56703 m!1071185))

(declare-fun m!1071187 () Bool)

(assert (=> b!1162474 m!1071187))

(declare-fun m!1071189 () Bool)

(assert (=> b!1162479 m!1071189))

(declare-fun m!1071191 () Bool)

(assert (=> b!1162503 m!1071191))

(declare-fun m!1071193 () Bool)

(assert (=> b!1162503 m!1071193))

(declare-fun m!1071195 () Bool)

(assert (=> b!1162503 m!1071195))

(declare-fun m!1071197 () Bool)

(assert (=> b!1162503 m!1071197))

(declare-fun m!1071199 () Bool)

(assert (=> mapNonEmpty!45515 m!1071199))

(declare-fun m!1071201 () Bool)

(assert (=> b!1162480 m!1071201))

(assert (=> b!1162487 m!1071189))

(declare-fun m!1071203 () Bool)

(assert (=> b!1162478 m!1071203))

(declare-fun m!1071205 () Bool)

(assert (=> bm!56704 m!1071205))

(declare-fun m!1071207 () Bool)

(assert (=> b!1162492 m!1071207))

(declare-fun m!1071209 () Bool)

(assert (=> bm!56709 m!1071209))

(declare-fun m!1071211 () Bool)

(assert (=> start!98992 m!1071211))

(declare-fun m!1071213 () Bool)

(assert (=> start!98992 m!1071213))

(declare-fun m!1071215 () Bool)

(assert (=> bm!56706 m!1071215))

(declare-fun m!1071217 () Bool)

(assert (=> b!1162482 m!1071217))

(declare-fun m!1071219 () Bool)

(assert (=> b!1162483 m!1071219))

(declare-fun m!1071221 () Bool)

(assert (=> b!1162483 m!1071221))

(declare-fun m!1071223 () Bool)

(assert (=> b!1162488 m!1071223))

(declare-fun m!1071225 () Bool)

(assert (=> b!1162500 m!1071225))

(assert (=> b!1162500 m!1071225))

(declare-fun m!1071227 () Bool)

(assert (=> b!1162500 m!1071227))

(declare-fun m!1071229 () Bool)

(assert (=> b!1162500 m!1071229))

(declare-fun m!1071231 () Bool)

(assert (=> bm!56708 m!1071231))

(declare-fun m!1071233 () Bool)

(assert (=> b!1162475 m!1071233))

(declare-fun m!1071235 () Bool)

(assert (=> b!1162475 m!1071235))

(declare-fun m!1071237 () Bool)

(assert (=> b!1162475 m!1071237))

(assert (=> b!1162475 m!1071169))

(declare-fun m!1071239 () Bool)

(assert (=> b!1162475 m!1071239))

(declare-fun m!1071241 () Bool)

(assert (=> b!1162475 m!1071241))

(assert (=> b!1162475 m!1071169))

(assert (=> b!1162475 m!1071169))

(declare-fun m!1071243 () Bool)

(assert (=> b!1162475 m!1071243))

(assert (=> b!1162475 m!1071235))

(declare-fun m!1071245 () Bool)

(assert (=> b!1162475 m!1071245))

(assert (=> b!1162475 m!1071237))

(declare-fun m!1071247 () Bool)

(assert (=> b!1162475 m!1071247))

(check-sat (not start!98992) (not b!1162474) (not b!1162492) (not b_next!24597) (not b!1162494) (not b!1162480) tp_is_empty!29127 (not mapNonEmpty!45515) (not b!1162496) (not b!1162475) (not bm!56704) (not bm!56703) (not b!1162476) (not b!1162483) (not b!1162495) (not b!1162479) (not b!1162488) (not b!1162501) b_and!40045 (not b!1162500) (not b_lambda!19703) (not bm!56709) (not b!1162482) (not bm!56706) (not bm!56708) (not b!1162503) (not b!1162487))
(check-sat b_and!40045 (not b_next!24597))
