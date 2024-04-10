; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98308 () Bool)

(assert start!98308)

(declare-fun b_free!23943 () Bool)

(declare-fun b_next!23943 () Bool)

(assert (=> start!98308 (= b_free!23943 (not b_next!23943))))

(declare-fun tp!84537 () Bool)

(declare-fun b_and!38717 () Bool)

(assert (=> start!98308 (= tp!84537 b_and!38717)))

(declare-fun b!1132500 () Bool)

(declare-fun e!644536 () Bool)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!73805 0))(
  ( (array!73806 (arr!35554 (Array (_ BitVec 32) (_ BitVec 64))) (size!36090 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73805)

(assert (=> b!1132500 (= e!644536 (or (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!36090 _keys!1208)) (bvslt (size!36090 _keys!1208) #b01111111111111111111111111111111)))))

(declare-fun e!644529 () Bool)

(assert (=> b!1132500 e!644529))

(declare-fun c!110432 () Bool)

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1132500 (= c!110432 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-datatypes ((V!43091 0))(
  ( (V!43092 (val!14293 Int)) )
))
(declare-fun zeroValue!944 () V!43091)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!13527 0))(
  ( (ValueCellFull!13527 (v!16929 V!43091)) (EmptyCell!13527) )
))
(declare-datatypes ((array!73807 0))(
  ( (array!73808 (arr!35555 (Array (_ BitVec 32) ValueCell!13527)) (size!36091 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73807)

(declare-fun minValue!944 () V!43091)

(declare-datatypes ((Unit!37110 0))(
  ( (Unit!37111) )
))
(declare-fun lt!503176 () Unit!37110)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!325 (array!73805 array!73807 (_ BitVec 32) (_ BitVec 32) V!43091 V!43091 (_ BitVec 64) (_ BitVec 32) Int) Unit!37110)

(assert (=> b!1132500 (= lt!503176 (lemmaListMapContainsThenArrayContainsFrom!325 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!503183 () Unit!37110)

(declare-fun e!644539 () Unit!37110)

(assert (=> b!1132500 (= lt!503183 e!644539)))

(declare-fun c!110433 () Bool)

(declare-fun lt!503169 () Bool)

(assert (=> b!1132500 (= c!110433 (and (not lt!503169) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1132500 (= lt!503169 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1132501 () Bool)

(declare-fun lt!503180 () Unit!37110)

(assert (=> b!1132501 (= e!644539 lt!503180)))

(declare-fun lt!503175 () Unit!37110)

(declare-fun call!48841 () Unit!37110)

(assert (=> b!1132501 (= lt!503175 call!48841)))

(declare-datatypes ((tuple2!18020 0))(
  ( (tuple2!18021 (_1!9021 (_ BitVec 64)) (_2!9021 V!43091)) )
))
(declare-datatypes ((List!24783 0))(
  ( (Nil!24780) (Cons!24779 (h!25988 tuple2!18020) (t!35718 List!24783)) )
))
(declare-datatypes ((ListLongMap!15989 0))(
  ( (ListLongMap!15990 (toList!8010 List!24783)) )
))
(declare-fun lt!503182 () ListLongMap!15989)

(declare-fun call!48843 () ListLongMap!15989)

(assert (=> b!1132501 (= lt!503182 call!48843)))

(declare-fun call!48840 () Bool)

(assert (=> b!1132501 call!48840))

(declare-fun addStillContains!716 (ListLongMap!15989 (_ BitVec 64) V!43091 (_ BitVec 64)) Unit!37110)

(assert (=> b!1132501 (= lt!503180 (addStillContains!716 lt!503182 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(declare-fun contains!6534 (ListLongMap!15989 (_ BitVec 64)) Bool)

(declare-fun +!3453 (ListLongMap!15989 tuple2!18020) ListLongMap!15989)

(assert (=> b!1132501 (contains!6534 (+!3453 lt!503182 (tuple2!18021 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun mapIsEmpty!44531 () Bool)

(declare-fun mapRes!44531 () Bool)

(assert (=> mapIsEmpty!44531 mapRes!44531))

(declare-fun bm!48835 () Bool)

(declare-fun call!48845 () Unit!37110)

(assert (=> bm!48835 (= call!48845 call!48841)))

(declare-fun b!1132502 () Bool)

(declare-fun res!756334 () Bool)

(declare-fun e!644528 () Bool)

(assert (=> b!1132502 (=> (not res!756334) (not e!644528))))

(declare-datatypes ((List!24784 0))(
  ( (Nil!24781) (Cons!24780 (h!25989 (_ BitVec 64)) (t!35719 List!24784)) )
))
(declare-fun arrayNoDuplicates!0 (array!73805 (_ BitVec 32) List!24784) Bool)

(assert (=> b!1132502 (= res!756334 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24781))))

(declare-fun b!1132503 () Bool)

(declare-fun call!48838 () Bool)

(assert (=> b!1132503 call!48838))

(declare-fun lt!503178 () Unit!37110)

(assert (=> b!1132503 (= lt!503178 call!48845)))

(declare-fun e!644542 () Unit!37110)

(assert (=> b!1132503 (= e!644542 lt!503178)))

(declare-fun b!1132504 () Bool)

(declare-fun e!644531 () Unit!37110)

(declare-fun Unit!37112 () Unit!37110)

(assert (=> b!1132504 (= e!644531 Unit!37112)))

(declare-fun b!1132505 () Bool)

(declare-fun c!110434 () Bool)

(assert (=> b!1132505 (= c!110434 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!503169))))

(assert (=> b!1132505 (= e!644542 e!644531)))

(declare-fun b!1132506 () Bool)

(declare-fun e!644540 () Bool)

(declare-fun tp_is_empty!28473 () Bool)

(assert (=> b!1132506 (= e!644540 tp_is_empty!28473)))

(declare-fun bm!48836 () Bool)

(declare-fun lt!503172 () ListLongMap!15989)

(declare-fun c!110435 () Bool)

(assert (=> bm!48836 (= call!48841 (addStillContains!716 lt!503172 (ite (or c!110433 c!110435) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!110433 c!110435) zeroValue!944 minValue!944) k0!934))))

(declare-fun b!1132507 () Bool)

(declare-fun res!756335 () Bool)

(assert (=> b!1132507 (=> (not res!756335) (not e!644528))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1132507 (= res!756335 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36090 _keys!1208))))))

(declare-fun b!1132508 () Bool)

(declare-fun e!644532 () Bool)

(declare-fun e!644537 () Bool)

(assert (=> b!1132508 (= e!644532 (not e!644537))))

(declare-fun res!756339 () Bool)

(assert (=> b!1132508 (=> res!756339 e!644537)))

(assert (=> b!1132508 (= res!756339 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73805 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1132508 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!503181 () Unit!37110)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73805 (_ BitVec 64) (_ BitVec 32)) Unit!37110)

(assert (=> b!1132508 (= lt!503181 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1132509 () Bool)

(declare-fun res!756333 () Bool)

(assert (=> b!1132509 (=> (not res!756333) (not e!644528))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73805 (_ BitVec 32)) Bool)

(assert (=> b!1132509 (= res!756333 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1132510 () Bool)

(declare-fun e!644538 () Bool)

(assert (=> b!1132510 (= e!644538 e!644536)))

(declare-fun res!756337 () Bool)

(assert (=> b!1132510 (=> res!756337 e!644536)))

(assert (=> b!1132510 (= res!756337 (not (contains!6534 lt!503172 k0!934)))))

(declare-fun getCurrentListMapNoExtraKeys!4497 (array!73805 array!73807 (_ BitVec 32) (_ BitVec 32) V!43091 V!43091 (_ BitVec 32) Int) ListLongMap!15989)

(assert (=> b!1132510 (= lt!503172 (getCurrentListMapNoExtraKeys!4497 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1132511 () Bool)

(declare-fun e!644530 () Bool)

(assert (=> b!1132511 (= e!644537 e!644530)))

(declare-fun res!756331 () Bool)

(assert (=> b!1132511 (=> res!756331 e!644530)))

(assert (=> b!1132511 (= res!756331 (not (= from!1455 i!673)))))

(declare-fun lt!503171 () array!73805)

(declare-fun lt!503174 () array!73807)

(declare-fun lt!503170 () ListLongMap!15989)

(assert (=> b!1132511 (= lt!503170 (getCurrentListMapNoExtraKeys!4497 lt!503171 lt!503174 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2567 (Int (_ BitVec 64)) V!43091)

(assert (=> b!1132511 (= lt!503174 (array!73808 (store (arr!35555 _values!996) i!673 (ValueCellFull!13527 (dynLambda!2567 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36091 _values!996)))))

(declare-fun lt!503179 () ListLongMap!15989)

(assert (=> b!1132511 (= lt!503179 (getCurrentListMapNoExtraKeys!4497 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1132512 () Bool)

(declare-fun e!644534 () Bool)

(assert (=> b!1132512 (= e!644534 (and e!644540 mapRes!44531))))

(declare-fun condMapEmpty!44531 () Bool)

(declare-fun mapDefault!44531 () ValueCell!13527)

(assert (=> b!1132512 (= condMapEmpty!44531 (= (arr!35555 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13527)) mapDefault!44531)))))

(declare-fun call!48842 () ListLongMap!15989)

(declare-fun e!644533 () Bool)

(declare-fun b!1132513 () Bool)

(declare-fun call!48844 () ListLongMap!15989)

(declare-fun -!1181 (ListLongMap!15989 (_ BitVec 64)) ListLongMap!15989)

(assert (=> b!1132513 (= e!644533 (= call!48842 (-!1181 call!48844 k0!934)))))

(declare-fun bm!48837 () Bool)

(declare-fun call!48839 () ListLongMap!15989)

(assert (=> bm!48837 (= call!48840 (contains!6534 (ite c!110433 lt!503182 call!48839) k0!934))))

(declare-fun b!1132514 () Bool)

(assert (=> b!1132514 (= e!644529 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1132515 () Bool)

(assert (=> b!1132515 (= e!644529 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!503169) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1132516 () Bool)

(assert (=> b!1132516 (= e!644533 (= call!48842 call!48844))))

(declare-fun bm!48838 () Bool)

(assert (=> bm!48838 (= call!48844 (getCurrentListMapNoExtraKeys!4497 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1132517 () Bool)

(declare-fun res!756338 () Bool)

(assert (=> b!1132517 (=> (not res!756338) (not e!644528))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1132517 (= res!756338 (validMask!0 mask!1564))))

(declare-fun b!1132518 () Bool)

(declare-fun res!756336 () Bool)

(assert (=> b!1132518 (=> (not res!756336) (not e!644532))))

(assert (=> b!1132518 (= res!756336 (arrayNoDuplicates!0 lt!503171 #b00000000000000000000000000000000 Nil!24781))))

(declare-fun res!756329 () Bool)

(assert (=> start!98308 (=> (not res!756329) (not e!644528))))

(assert (=> start!98308 (= res!756329 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36090 _keys!1208))))))

(assert (=> start!98308 e!644528))

(assert (=> start!98308 tp_is_empty!28473))

(declare-fun array_inv!27272 (array!73805) Bool)

(assert (=> start!98308 (array_inv!27272 _keys!1208)))

(assert (=> start!98308 true))

(assert (=> start!98308 tp!84537))

(declare-fun array_inv!27273 (array!73807) Bool)

(assert (=> start!98308 (and (array_inv!27273 _values!996) e!644534)))

(declare-fun b!1132519 () Bool)

(declare-fun lt!503173 () Unit!37110)

(assert (=> b!1132519 (= e!644531 lt!503173)))

(assert (=> b!1132519 (= lt!503173 call!48845)))

(assert (=> b!1132519 call!48838))

(declare-fun b!1132520 () Bool)

(declare-fun res!756330 () Bool)

(assert (=> b!1132520 (=> (not res!756330) (not e!644528))))

(assert (=> b!1132520 (= res!756330 (= (select (arr!35554 _keys!1208) i!673) k0!934))))

(declare-fun b!1132521 () Bool)

(declare-fun res!756340 () Bool)

(assert (=> b!1132521 (=> (not res!756340) (not e!644528))))

(assert (=> b!1132521 (= res!756340 (and (= (size!36091 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36090 _keys!1208) (size!36091 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1132522 () Bool)

(assert (=> b!1132522 (= e!644530 e!644538)))

(declare-fun res!756342 () Bool)

(assert (=> b!1132522 (=> res!756342 e!644538)))

(assert (=> b!1132522 (= res!756342 (not (= (select (arr!35554 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1132522 e!644533))

(declare-fun c!110436 () Bool)

(assert (=> b!1132522 (= c!110436 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!503177 () Unit!37110)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!435 (array!73805 array!73807 (_ BitVec 32) (_ BitVec 32) V!43091 V!43091 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37110)

(assert (=> b!1132522 (= lt!503177 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!435 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!48839 () Bool)

(assert (=> bm!48839 (= call!48842 (getCurrentListMapNoExtraKeys!4497 lt!503171 lt!503174 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1132523 () Bool)

(assert (=> b!1132523 (= e!644528 e!644532)))

(declare-fun res!756341 () Bool)

(assert (=> b!1132523 (=> (not res!756341) (not e!644532))))

(assert (=> b!1132523 (= res!756341 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!503171 mask!1564))))

(assert (=> b!1132523 (= lt!503171 (array!73806 (store (arr!35554 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36090 _keys!1208)))))

(declare-fun b!1132524 () Bool)

(declare-fun res!756332 () Bool)

(assert (=> b!1132524 (=> (not res!756332) (not e!644528))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1132524 (= res!756332 (validKeyInArray!0 k0!934))))

(declare-fun mapNonEmpty!44531 () Bool)

(declare-fun tp!84536 () Bool)

(declare-fun e!644535 () Bool)

(assert (=> mapNonEmpty!44531 (= mapRes!44531 (and tp!84536 e!644535))))

(declare-fun mapValue!44531 () ValueCell!13527)

(declare-fun mapKey!44531 () (_ BitVec 32))

(declare-fun mapRest!44531 () (Array (_ BitVec 32) ValueCell!13527))

(assert (=> mapNonEmpty!44531 (= (arr!35555 _values!996) (store mapRest!44531 mapKey!44531 mapValue!44531))))

(declare-fun b!1132525 () Bool)

(assert (=> b!1132525 (= e!644539 e!644542)))

(assert (=> b!1132525 (= c!110435 (and (not lt!503169) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!48840 () Bool)

(assert (=> bm!48840 (= call!48843 (+!3453 lt!503172 (ite (or c!110433 c!110435) (tuple2!18021 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18021 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1132526 () Bool)

(assert (=> b!1132526 (= e!644535 tp_is_empty!28473)))

(declare-fun bm!48841 () Bool)

(assert (=> bm!48841 (= call!48838 call!48840)))

(declare-fun bm!48842 () Bool)

(assert (=> bm!48842 (= call!48839 call!48843)))

(assert (= (and start!98308 res!756329) b!1132517))

(assert (= (and b!1132517 res!756338) b!1132521))

(assert (= (and b!1132521 res!756340) b!1132509))

(assert (= (and b!1132509 res!756333) b!1132502))

(assert (= (and b!1132502 res!756334) b!1132507))

(assert (= (and b!1132507 res!756335) b!1132524))

(assert (= (and b!1132524 res!756332) b!1132520))

(assert (= (and b!1132520 res!756330) b!1132523))

(assert (= (and b!1132523 res!756341) b!1132518))

(assert (= (and b!1132518 res!756336) b!1132508))

(assert (= (and b!1132508 (not res!756339)) b!1132511))

(assert (= (and b!1132511 (not res!756331)) b!1132522))

(assert (= (and b!1132522 c!110436) b!1132513))

(assert (= (and b!1132522 (not c!110436)) b!1132516))

(assert (= (or b!1132513 b!1132516) bm!48839))

(assert (= (or b!1132513 b!1132516) bm!48838))

(assert (= (and b!1132522 (not res!756342)) b!1132510))

(assert (= (and b!1132510 (not res!756337)) b!1132500))

(assert (= (and b!1132500 c!110433) b!1132501))

(assert (= (and b!1132500 (not c!110433)) b!1132525))

(assert (= (and b!1132525 c!110435) b!1132503))

(assert (= (and b!1132525 (not c!110435)) b!1132505))

(assert (= (and b!1132505 c!110434) b!1132519))

(assert (= (and b!1132505 (not c!110434)) b!1132504))

(assert (= (or b!1132503 b!1132519) bm!48835))

(assert (= (or b!1132503 b!1132519) bm!48842))

(assert (= (or b!1132503 b!1132519) bm!48841))

(assert (= (or b!1132501 bm!48841) bm!48837))

(assert (= (or b!1132501 bm!48835) bm!48836))

(assert (= (or b!1132501 bm!48842) bm!48840))

(assert (= (and b!1132500 c!110432) b!1132514))

(assert (= (and b!1132500 (not c!110432)) b!1132515))

(assert (= (and b!1132512 condMapEmpty!44531) mapIsEmpty!44531))

(assert (= (and b!1132512 (not condMapEmpty!44531)) mapNonEmpty!44531))

(get-info :version)

(assert (= (and mapNonEmpty!44531 ((_ is ValueCellFull!13527) mapValue!44531)) b!1132526))

(assert (= (and b!1132512 ((_ is ValueCellFull!13527) mapDefault!44531)) b!1132506))

(assert (= start!98308 b!1132512))

(declare-fun b_lambda!19011 () Bool)

(assert (=> (not b_lambda!19011) (not b!1132511)))

(declare-fun t!35717 () Bool)

(declare-fun tb!8755 () Bool)

(assert (=> (and start!98308 (= defaultEntry!1004 defaultEntry!1004) t!35717) tb!8755))

(declare-fun result!18073 () Bool)

(assert (=> tb!8755 (= result!18073 tp_is_empty!28473)))

(assert (=> b!1132511 t!35717))

(declare-fun b_and!38719 () Bool)

(assert (= b_and!38717 (and (=> t!35717 result!18073) b_and!38719)))

(declare-fun m!1045735 () Bool)

(assert (=> bm!48838 m!1045735))

(declare-fun m!1045737 () Bool)

(assert (=> b!1132502 m!1045737))

(declare-fun m!1045739 () Bool)

(assert (=> b!1132509 m!1045739))

(declare-fun m!1045741 () Bool)

(assert (=> b!1132523 m!1045741))

(declare-fun m!1045743 () Bool)

(assert (=> b!1132523 m!1045743))

(declare-fun m!1045745 () Bool)

(assert (=> b!1132517 m!1045745))

(declare-fun m!1045747 () Bool)

(assert (=> b!1132511 m!1045747))

(declare-fun m!1045749 () Bool)

(assert (=> b!1132511 m!1045749))

(declare-fun m!1045751 () Bool)

(assert (=> b!1132511 m!1045751))

(declare-fun m!1045753 () Bool)

(assert (=> b!1132511 m!1045753))

(declare-fun m!1045755 () Bool)

(assert (=> b!1132508 m!1045755))

(declare-fun m!1045757 () Bool)

(assert (=> b!1132508 m!1045757))

(declare-fun m!1045759 () Bool)

(assert (=> b!1132522 m!1045759))

(declare-fun m!1045761 () Bool)

(assert (=> b!1132522 m!1045761))

(declare-fun m!1045763 () Bool)

(assert (=> b!1132501 m!1045763))

(declare-fun m!1045765 () Bool)

(assert (=> b!1132501 m!1045765))

(assert (=> b!1132501 m!1045765))

(declare-fun m!1045767 () Bool)

(assert (=> b!1132501 m!1045767))

(declare-fun m!1045769 () Bool)

(assert (=> bm!48836 m!1045769))

(declare-fun m!1045771 () Bool)

(assert (=> b!1132500 m!1045771))

(declare-fun m!1045773 () Bool)

(assert (=> b!1132513 m!1045773))

(declare-fun m!1045775 () Bool)

(assert (=> b!1132514 m!1045775))

(declare-fun m!1045777 () Bool)

(assert (=> b!1132518 m!1045777))

(declare-fun m!1045779 () Bool)

(assert (=> mapNonEmpty!44531 m!1045779))

(declare-fun m!1045781 () Bool)

(assert (=> start!98308 m!1045781))

(declare-fun m!1045783 () Bool)

(assert (=> start!98308 m!1045783))

(declare-fun m!1045785 () Bool)

(assert (=> bm!48837 m!1045785))

(declare-fun m!1045787 () Bool)

(assert (=> b!1132524 m!1045787))

(declare-fun m!1045789 () Bool)

(assert (=> b!1132520 m!1045789))

(declare-fun m!1045791 () Bool)

(assert (=> bm!48839 m!1045791))

(declare-fun m!1045793 () Bool)

(assert (=> bm!48840 m!1045793))

(declare-fun m!1045795 () Bool)

(assert (=> b!1132510 m!1045795))

(assert (=> b!1132510 m!1045735))

(check-sat (not b!1132517) (not b!1132513) (not b_lambda!19011) b_and!38719 (not bm!48839) (not b!1132518) (not b!1132511) (not bm!48836) (not b!1132510) (not bm!48838) tp_is_empty!28473 (not b!1132514) (not b!1132500) (not b!1132508) (not start!98308) (not b!1132523) (not b!1132522) (not bm!48837) (not b!1132502) (not mapNonEmpty!44531) (not bm!48840) (not b!1132524) (not b_next!23943) (not b!1132509) (not b!1132501))
(check-sat b_and!38719 (not b_next!23943))
(get-model)

(declare-fun b_lambda!19015 () Bool)

(assert (= b_lambda!19011 (or (and start!98308 b_free!23943) b_lambda!19015)))

(check-sat (not b!1132517) (not b!1132513) b_and!38719 (not bm!48839) (not b!1132518) (not b!1132511) (not bm!48836) (not b!1132510) (not b_lambda!19015) (not bm!48838) tp_is_empty!28473 (not b!1132514) (not b!1132500) (not b!1132508) (not start!98308) (not b!1132523) (not b!1132522) (not bm!48837) (not b!1132502) (not mapNonEmpty!44531) (not bm!48840) (not b!1132524) (not b_next!23943) (not b!1132509) (not b!1132501))
(check-sat b_and!38719 (not b_next!23943))
(get-model)

(declare-fun b!1132620 () Bool)

(declare-fun e!644594 () Bool)

(declare-fun e!644595 () Bool)

(assert (=> b!1132620 (= e!644594 e!644595)))

(declare-fun c!110454 () Bool)

(assert (=> b!1132620 (= c!110454 (validKeyInArray!0 (select (arr!35554 lt!503171) #b00000000000000000000000000000000)))))

(declare-fun bm!48869 () Bool)

(declare-fun call!48872 () Bool)

(assert (=> bm!48869 (= call!48872 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!503171 mask!1564))))

(declare-fun b!1132621 () Bool)

(assert (=> b!1132621 (= e!644595 call!48872)))

(declare-fun b!1132622 () Bool)

(declare-fun e!644596 () Bool)

(assert (=> b!1132622 (= e!644596 call!48872)))

(declare-fun b!1132623 () Bool)

(assert (=> b!1132623 (= e!644595 e!644596)))

(declare-fun lt!503236 () (_ BitVec 64))

(assert (=> b!1132623 (= lt!503236 (select (arr!35554 lt!503171) #b00000000000000000000000000000000))))

(declare-fun lt!503237 () Unit!37110)

(assert (=> b!1132623 (= lt!503237 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!503171 lt!503236 #b00000000000000000000000000000000))))

(assert (=> b!1132623 (arrayContainsKey!0 lt!503171 lt!503236 #b00000000000000000000000000000000)))

(declare-fun lt!503235 () Unit!37110)

(assert (=> b!1132623 (= lt!503235 lt!503237)))

(declare-fun res!756390 () Bool)

(declare-datatypes ((SeekEntryResult!9926 0))(
  ( (MissingZero!9926 (index!42075 (_ BitVec 32))) (Found!9926 (index!42076 (_ BitVec 32))) (Intermediate!9926 (undefined!10738 Bool) (index!42077 (_ BitVec 32)) (x!101521 (_ BitVec 32))) (Undefined!9926) (MissingVacant!9926 (index!42078 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!73805 (_ BitVec 32)) SeekEntryResult!9926)

(assert (=> b!1132623 (= res!756390 (= (seekEntryOrOpen!0 (select (arr!35554 lt!503171) #b00000000000000000000000000000000) lt!503171 mask!1564) (Found!9926 #b00000000000000000000000000000000)))))

(assert (=> b!1132623 (=> (not res!756390) (not e!644596))))

(declare-fun d!131575 () Bool)

(declare-fun res!756389 () Bool)

(assert (=> d!131575 (=> res!756389 e!644594)))

(assert (=> d!131575 (= res!756389 (bvsge #b00000000000000000000000000000000 (size!36090 lt!503171)))))

(assert (=> d!131575 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!503171 mask!1564) e!644594)))

(assert (= (and d!131575 (not res!756389)) b!1132620))

(assert (= (and b!1132620 c!110454) b!1132623))

(assert (= (and b!1132620 (not c!110454)) b!1132621))

(assert (= (and b!1132623 res!756390) b!1132622))

(assert (= (or b!1132622 b!1132621) bm!48869))

(declare-fun m!1045859 () Bool)

(assert (=> b!1132620 m!1045859))

(assert (=> b!1132620 m!1045859))

(declare-fun m!1045861 () Bool)

(assert (=> b!1132620 m!1045861))

(declare-fun m!1045863 () Bool)

(assert (=> bm!48869 m!1045863))

(assert (=> b!1132623 m!1045859))

(declare-fun m!1045865 () Bool)

(assert (=> b!1132623 m!1045865))

(declare-fun m!1045867 () Bool)

(assert (=> b!1132623 m!1045867))

(assert (=> b!1132623 m!1045859))

(declare-fun m!1045869 () Bool)

(assert (=> b!1132623 m!1045869))

(assert (=> b!1132523 d!131575))

(declare-fun d!131577 () Bool)

(declare-fun res!756395 () Bool)

(declare-fun e!644601 () Bool)

(assert (=> d!131577 (=> res!756395 e!644601)))

(assert (=> d!131577 (= res!756395 (= (select (arr!35554 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) k0!934))))

(assert (=> d!131577 (= (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)) e!644601)))

(declare-fun b!1132628 () Bool)

(declare-fun e!644602 () Bool)

(assert (=> b!1132628 (= e!644601 e!644602)))

(declare-fun res!756396 () Bool)

(assert (=> b!1132628 (=> (not res!756396) (not e!644602))))

(assert (=> b!1132628 (= res!756396 (bvslt (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) (size!36090 _keys!1208)))))

(declare-fun b!1132629 () Bool)

(assert (=> b!1132629 (= e!644602 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001)))))

(assert (= (and d!131577 (not res!756395)) b!1132628))

(assert (= (and b!1132628 res!756396) b!1132629))

(declare-fun m!1045871 () Bool)

(assert (=> d!131577 m!1045871))

(declare-fun m!1045873 () Bool)

(assert (=> b!1132629 m!1045873))

(assert (=> b!1132514 d!131577))

(declare-fun d!131579 () Bool)

(assert (=> d!131579 (contains!6534 (+!3453 lt!503172 (tuple2!18021 (ite (or c!110433 c!110435) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!110433 c!110435) zeroValue!944 minValue!944))) k0!934)))

(declare-fun lt!503240 () Unit!37110)

(declare-fun choose!1780 (ListLongMap!15989 (_ BitVec 64) V!43091 (_ BitVec 64)) Unit!37110)

(assert (=> d!131579 (= lt!503240 (choose!1780 lt!503172 (ite (or c!110433 c!110435) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!110433 c!110435) zeroValue!944 minValue!944) k0!934))))

(assert (=> d!131579 (contains!6534 lt!503172 k0!934)))

(assert (=> d!131579 (= (addStillContains!716 lt!503172 (ite (or c!110433 c!110435) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!110433 c!110435) zeroValue!944 minValue!944) k0!934) lt!503240)))

(declare-fun bs!32983 () Bool)

(assert (= bs!32983 d!131579))

(declare-fun m!1045875 () Bool)

(assert (=> bs!32983 m!1045875))

(assert (=> bs!32983 m!1045875))

(declare-fun m!1045877 () Bool)

(assert (=> bs!32983 m!1045877))

(declare-fun m!1045879 () Bool)

(assert (=> bs!32983 m!1045879))

(assert (=> bs!32983 m!1045795))

(assert (=> bm!48836 d!131579))

(declare-fun d!131581 () Bool)

(assert (=> d!131581 (= (validKeyInArray!0 k0!934) (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1132524 d!131581))

(declare-fun d!131583 () Bool)

(assert (=> d!131583 (= (array_inv!27272 _keys!1208) (bvsge (size!36090 _keys!1208) #b00000000000000000000000000000000))))

(assert (=> start!98308 d!131583))

(declare-fun d!131585 () Bool)

(assert (=> d!131585 (= (array_inv!27273 _values!996) (bvsge (size!36091 _values!996) #b00000000000000000000000000000000))))

(assert (=> start!98308 d!131585))

(declare-fun d!131587 () Bool)

(declare-fun lt!503243 () ListLongMap!15989)

(assert (=> d!131587 (not (contains!6534 lt!503243 k0!934))))

(declare-fun removeStrictlySorted!90 (List!24783 (_ BitVec 64)) List!24783)

(assert (=> d!131587 (= lt!503243 (ListLongMap!15990 (removeStrictlySorted!90 (toList!8010 call!48844) k0!934)))))

(assert (=> d!131587 (= (-!1181 call!48844 k0!934) lt!503243)))

(declare-fun bs!32984 () Bool)

(assert (= bs!32984 d!131587))

(declare-fun m!1045881 () Bool)

(assert (=> bs!32984 m!1045881))

(declare-fun m!1045883 () Bool)

(assert (=> bs!32984 m!1045883))

(assert (=> b!1132513 d!131587))

(declare-fun d!131589 () Bool)

(declare-fun e!644607 () Bool)

(assert (=> d!131589 e!644607))

(declare-fun res!756399 () Bool)

(assert (=> d!131589 (=> res!756399 e!644607)))

(declare-fun lt!503255 () Bool)

(assert (=> d!131589 (= res!756399 (not lt!503255))))

(declare-fun lt!503252 () Bool)

(assert (=> d!131589 (= lt!503255 lt!503252)))

(declare-fun lt!503254 () Unit!37110)

(declare-fun e!644608 () Unit!37110)

(assert (=> d!131589 (= lt!503254 e!644608)))

(declare-fun c!110457 () Bool)

(assert (=> d!131589 (= c!110457 lt!503252)))

(declare-fun containsKey!586 (List!24783 (_ BitVec 64)) Bool)

(assert (=> d!131589 (= lt!503252 (containsKey!586 (toList!8010 (ite c!110433 lt!503182 call!48839)) k0!934))))

(assert (=> d!131589 (= (contains!6534 (ite c!110433 lt!503182 call!48839) k0!934) lt!503255)))

(declare-fun b!1132637 () Bool)

(declare-fun lt!503253 () Unit!37110)

(assert (=> b!1132637 (= e!644608 lt!503253)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!416 (List!24783 (_ BitVec 64)) Unit!37110)

(assert (=> b!1132637 (= lt!503253 (lemmaContainsKeyImpliesGetValueByKeyDefined!416 (toList!8010 (ite c!110433 lt!503182 call!48839)) k0!934))))

(declare-datatypes ((Option!680 0))(
  ( (Some!679 (v!16931 V!43091)) (None!678) )
))
(declare-fun isDefined!455 (Option!680) Bool)

(declare-fun getValueByKey!629 (List!24783 (_ BitVec 64)) Option!680)

(assert (=> b!1132637 (isDefined!455 (getValueByKey!629 (toList!8010 (ite c!110433 lt!503182 call!48839)) k0!934))))

(declare-fun b!1132638 () Bool)

(declare-fun Unit!37116 () Unit!37110)

(assert (=> b!1132638 (= e!644608 Unit!37116)))

(declare-fun b!1132639 () Bool)

(assert (=> b!1132639 (= e!644607 (isDefined!455 (getValueByKey!629 (toList!8010 (ite c!110433 lt!503182 call!48839)) k0!934)))))

(assert (= (and d!131589 c!110457) b!1132637))

(assert (= (and d!131589 (not c!110457)) b!1132638))

(assert (= (and d!131589 (not res!756399)) b!1132639))

(declare-fun m!1045885 () Bool)

(assert (=> d!131589 m!1045885))

(declare-fun m!1045887 () Bool)

(assert (=> b!1132637 m!1045887))

(declare-fun m!1045889 () Bool)

(assert (=> b!1132637 m!1045889))

(assert (=> b!1132637 m!1045889))

(declare-fun m!1045891 () Bool)

(assert (=> b!1132637 m!1045891))

(assert (=> b!1132639 m!1045889))

(assert (=> b!1132639 m!1045889))

(assert (=> b!1132639 m!1045891))

(assert (=> bm!48837 d!131589))

(declare-fun b!1132664 () Bool)

(declare-fun e!644626 () Bool)

(assert (=> b!1132664 (= e!644626 (validKeyInArray!0 (select (arr!35554 lt!503171) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1132664 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))

(declare-fun b!1132665 () Bool)

(declare-fun lt!503271 () Unit!37110)

(declare-fun lt!503270 () Unit!37110)

(assert (=> b!1132665 (= lt!503271 lt!503270)))

(declare-fun lt!503276 () ListLongMap!15989)

(declare-fun lt!503274 () (_ BitVec 64))

(declare-fun lt!503273 () V!43091)

(declare-fun lt!503275 () (_ BitVec 64))

(assert (=> b!1132665 (not (contains!6534 (+!3453 lt!503276 (tuple2!18021 lt!503275 lt!503273)) lt!503274))))

(declare-fun addStillNotContains!284 (ListLongMap!15989 (_ BitVec 64) V!43091 (_ BitVec 64)) Unit!37110)

(assert (=> b!1132665 (= lt!503270 (addStillNotContains!284 lt!503276 lt!503275 lt!503273 lt!503274))))

(assert (=> b!1132665 (= lt!503274 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun get!18079 (ValueCell!13527 V!43091) V!43091)

(assert (=> b!1132665 (= lt!503273 (get!18079 (select (arr!35555 lt!503174) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!2567 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1132665 (= lt!503275 (select (arr!35554 lt!503171) (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun call!48875 () ListLongMap!15989)

(assert (=> b!1132665 (= lt!503276 call!48875)))

(declare-fun e!644625 () ListLongMap!15989)

(assert (=> b!1132665 (= e!644625 (+!3453 call!48875 (tuple2!18021 (select (arr!35554 lt!503171) (bvadd #b00000000000000000000000000000001 from!1455)) (get!18079 (select (arr!35555 lt!503174) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!2567 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1132666 () Bool)

(declare-fun e!644629 () Bool)

(declare-fun e!644624 () Bool)

(assert (=> b!1132666 (= e!644629 e!644624)))

(declare-fun c!110467 () Bool)

(assert (=> b!1132666 (= c!110467 e!644626)))

(declare-fun res!756411 () Bool)

(assert (=> b!1132666 (=> (not res!756411) (not e!644626))))

(assert (=> b!1132666 (= res!756411 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!36090 lt!503171)))))

(declare-fun bm!48872 () Bool)

(assert (=> bm!48872 (= call!48875 (getCurrentListMapNoExtraKeys!4497 lt!503171 lt!503174 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1132668 () Bool)

(declare-fun e!644628 () ListLongMap!15989)

(assert (=> b!1132668 (= e!644628 e!644625)))

(declare-fun c!110469 () Bool)

(assert (=> b!1132668 (= c!110469 (validKeyInArray!0 (select (arr!35554 lt!503171) (bvadd #b00000000000000000000000000000001 from!1455))))))

(declare-fun b!1132669 () Bool)

(declare-fun e!644627 () Bool)

(declare-fun lt!503272 () ListLongMap!15989)

(declare-fun isEmpty!976 (ListLongMap!15989) Bool)

(assert (=> b!1132669 (= e!644627 (isEmpty!976 lt!503272))))

(declare-fun b!1132670 () Bool)

(assert (=> b!1132670 (= e!644627 (= lt!503272 (getCurrentListMapNoExtraKeys!4497 lt!503171 lt!503174 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1132671 () Bool)

(assert (=> b!1132671 (= e!644625 call!48875)))

(declare-fun b!1132672 () Bool)

(assert (=> b!1132672 (= e!644628 (ListLongMap!15990 Nil!24780))))

(declare-fun b!1132673 () Bool)

(declare-fun res!756409 () Bool)

(assert (=> b!1132673 (=> (not res!756409) (not e!644629))))

(assert (=> b!1132673 (= res!756409 (not (contains!6534 lt!503272 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1132667 () Bool)

(assert (=> b!1132667 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!36090 lt!503171)))))

(assert (=> b!1132667 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!36091 lt!503174)))))

(declare-fun e!644623 () Bool)

(declare-fun apply!956 (ListLongMap!15989 (_ BitVec 64)) V!43091)

(assert (=> b!1132667 (= e!644623 (= (apply!956 lt!503272 (select (arr!35554 lt!503171) (bvadd #b00000000000000000000000000000001 from!1455))) (get!18079 (select (arr!35555 lt!503174) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!2567 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!131591 () Bool)

(assert (=> d!131591 e!644629))

(declare-fun res!756410 () Bool)

(assert (=> d!131591 (=> (not res!756410) (not e!644629))))

(assert (=> d!131591 (= res!756410 (not (contains!6534 lt!503272 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!131591 (= lt!503272 e!644628)))

(declare-fun c!110468 () Bool)

(assert (=> d!131591 (= c!110468 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!36090 lt!503171)))))

(assert (=> d!131591 (validMask!0 mask!1564)))

(assert (=> d!131591 (= (getCurrentListMapNoExtraKeys!4497 lt!503171 lt!503174 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!503272)))

(declare-fun b!1132674 () Bool)

(assert (=> b!1132674 (= e!644624 e!644623)))

(assert (=> b!1132674 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!36090 lt!503171)))))

(declare-fun res!756408 () Bool)

(assert (=> b!1132674 (= res!756408 (contains!6534 lt!503272 (select (arr!35554 lt!503171) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1132674 (=> (not res!756408) (not e!644623))))

(declare-fun b!1132675 () Bool)

(assert (=> b!1132675 (= e!644624 e!644627)))

(declare-fun c!110466 () Bool)

(assert (=> b!1132675 (= c!110466 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!36090 lt!503171)))))

(assert (= (and d!131591 c!110468) b!1132672))

(assert (= (and d!131591 (not c!110468)) b!1132668))

(assert (= (and b!1132668 c!110469) b!1132665))

(assert (= (and b!1132668 (not c!110469)) b!1132671))

(assert (= (or b!1132665 b!1132671) bm!48872))

(assert (= (and d!131591 res!756410) b!1132673))

(assert (= (and b!1132673 res!756409) b!1132666))

(assert (= (and b!1132666 res!756411) b!1132664))

(assert (= (and b!1132666 c!110467) b!1132674))

(assert (= (and b!1132666 (not c!110467)) b!1132675))

(assert (= (and b!1132674 res!756408) b!1132667))

(assert (= (and b!1132675 c!110466) b!1132670))

(assert (= (and b!1132675 (not c!110466)) b!1132669))

(declare-fun b_lambda!19017 () Bool)

(assert (=> (not b_lambda!19017) (not b!1132665)))

(assert (=> b!1132665 t!35717))

(declare-fun b_and!38725 () Bool)

(assert (= b_and!38719 (and (=> t!35717 result!18073) b_and!38725)))

(declare-fun b_lambda!19019 () Bool)

(assert (=> (not b_lambda!19019) (not b!1132667)))

(assert (=> b!1132667 t!35717))

(declare-fun b_and!38727 () Bool)

(assert (= b_and!38725 (and (=> t!35717 result!18073) b_and!38727)))

(declare-fun m!1045893 () Bool)

(assert (=> b!1132673 m!1045893))

(declare-fun m!1045895 () Bool)

(assert (=> d!131591 m!1045895))

(assert (=> d!131591 m!1045745))

(declare-fun m!1045897 () Bool)

(assert (=> b!1132669 m!1045897))

(declare-fun m!1045899 () Bool)

(assert (=> b!1132664 m!1045899))

(assert (=> b!1132664 m!1045899))

(declare-fun m!1045901 () Bool)

(assert (=> b!1132664 m!1045901))

(assert (=> b!1132665 m!1045749))

(declare-fun m!1045903 () Bool)

(assert (=> b!1132665 m!1045903))

(declare-fun m!1045905 () Bool)

(assert (=> b!1132665 m!1045905))

(declare-fun m!1045907 () Bool)

(assert (=> b!1132665 m!1045907))

(declare-fun m!1045909 () Bool)

(assert (=> b!1132665 m!1045909))

(assert (=> b!1132665 m!1045907))

(declare-fun m!1045911 () Bool)

(assert (=> b!1132665 m!1045911))

(assert (=> b!1132665 m!1045899))

(assert (=> b!1132665 m!1045903))

(assert (=> b!1132665 m!1045749))

(declare-fun m!1045913 () Bool)

(assert (=> b!1132665 m!1045913))

(assert (=> b!1132668 m!1045899))

(assert (=> b!1132668 m!1045899))

(assert (=> b!1132668 m!1045901))

(assert (=> b!1132667 m!1045749))

(assert (=> b!1132667 m!1045903))

(assert (=> b!1132667 m!1045899))

(declare-fun m!1045915 () Bool)

(assert (=> b!1132667 m!1045915))

(assert (=> b!1132667 m!1045899))

(assert (=> b!1132667 m!1045903))

(assert (=> b!1132667 m!1045749))

(assert (=> b!1132667 m!1045913))

(assert (=> b!1132674 m!1045899))

(assert (=> b!1132674 m!1045899))

(declare-fun m!1045917 () Bool)

(assert (=> b!1132674 m!1045917))

(declare-fun m!1045919 () Bool)

(assert (=> bm!48872 m!1045919))

(assert (=> b!1132670 m!1045919))

(assert (=> bm!48839 d!131591))

(declare-fun d!131593 () Bool)

(declare-fun e!644634 () Bool)

(assert (=> d!131593 e!644634))

(declare-fun res!756414 () Bool)

(assert (=> d!131593 (=> (not res!756414) (not e!644634))))

(assert (=> d!131593 (= res!756414 (and (or (not (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673)) (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36090 _keys!1208)))) (or (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673) (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36090 _keys!1208))))))))

(declare-fun lt!503279 () Unit!37110)

(declare-fun choose!1781 (array!73805 array!73807 (_ BitVec 32) (_ BitVec 32) V!43091 V!43091 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37110)

(assert (=> d!131593 (= lt!503279 (choose!1781 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> d!131593 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!1455) (size!36090 _keys!1208)))))

(assert (=> d!131593 (= (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!435 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!503279)))

(declare-fun b!1132682 () Bool)

(declare-fun e!644635 () Bool)

(assert (=> b!1132682 (= e!644634 e!644635)))

(declare-fun c!110472 () Bool)

(assert (=> b!1132682 (= c!110472 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun bm!48877 () Bool)

(declare-fun call!48881 () ListLongMap!15989)

(assert (=> bm!48877 (= call!48881 (getCurrentListMapNoExtraKeys!4497 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1132683 () Bool)

(declare-fun call!48880 () ListLongMap!15989)

(assert (=> b!1132683 (= e!644635 (= call!48880 call!48881))))

(assert (=> b!1132683 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36091 _values!996)))))

(declare-fun b!1132684 () Bool)

(assert (=> b!1132684 (= e!644635 (= call!48880 (-!1181 call!48881 k0!934)))))

(assert (=> b!1132684 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36091 _values!996)))))

(declare-fun bm!48878 () Bool)

(assert (=> bm!48878 (= call!48880 (getCurrentListMapNoExtraKeys!4497 (array!73806 (store (arr!35554 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36090 _keys!1208)) (array!73808 (store (arr!35555 _values!996) i!673 (ValueCellFull!13527 (dynLambda!2567 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36091 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (= (and d!131593 res!756414) b!1132682))

(assert (= (and b!1132682 c!110472) b!1132684))

(assert (= (and b!1132682 (not c!110472)) b!1132683))

(assert (= (or b!1132684 b!1132683) bm!48877))

(assert (= (or b!1132684 b!1132683) bm!48878))

(declare-fun b_lambda!19021 () Bool)

(assert (=> (not b_lambda!19021) (not bm!48878)))

(assert (=> bm!48878 t!35717))

(declare-fun b_and!38729 () Bool)

(assert (= b_and!38727 (and (=> t!35717 result!18073) b_and!38729)))

(declare-fun m!1045921 () Bool)

(assert (=> d!131593 m!1045921))

(assert (=> bm!48877 m!1045735))

(declare-fun m!1045923 () Bool)

(assert (=> b!1132684 m!1045923))

(assert (=> bm!48878 m!1045743))

(assert (=> bm!48878 m!1045749))

(assert (=> bm!48878 m!1045751))

(declare-fun m!1045925 () Bool)

(assert (=> bm!48878 m!1045925))

(assert (=> b!1132522 d!131593))

(declare-fun d!131595 () Bool)

(declare-fun e!644636 () Bool)

(assert (=> d!131595 e!644636))

(declare-fun res!756415 () Bool)

(assert (=> d!131595 (=> res!756415 e!644636)))

(declare-fun lt!503283 () Bool)

(assert (=> d!131595 (= res!756415 (not lt!503283))))

(declare-fun lt!503280 () Bool)

(assert (=> d!131595 (= lt!503283 lt!503280)))

(declare-fun lt!503282 () Unit!37110)

(declare-fun e!644637 () Unit!37110)

(assert (=> d!131595 (= lt!503282 e!644637)))

(declare-fun c!110473 () Bool)

(assert (=> d!131595 (= c!110473 lt!503280)))

(assert (=> d!131595 (= lt!503280 (containsKey!586 (toList!8010 lt!503172) k0!934))))

(assert (=> d!131595 (= (contains!6534 lt!503172 k0!934) lt!503283)))

(declare-fun b!1132685 () Bool)

(declare-fun lt!503281 () Unit!37110)

(assert (=> b!1132685 (= e!644637 lt!503281)))

(assert (=> b!1132685 (= lt!503281 (lemmaContainsKeyImpliesGetValueByKeyDefined!416 (toList!8010 lt!503172) k0!934))))

(assert (=> b!1132685 (isDefined!455 (getValueByKey!629 (toList!8010 lt!503172) k0!934))))

(declare-fun b!1132686 () Bool)

(declare-fun Unit!37117 () Unit!37110)

(assert (=> b!1132686 (= e!644637 Unit!37117)))

(declare-fun b!1132687 () Bool)

(assert (=> b!1132687 (= e!644636 (isDefined!455 (getValueByKey!629 (toList!8010 lt!503172) k0!934)))))

(assert (= (and d!131595 c!110473) b!1132685))

(assert (= (and d!131595 (not c!110473)) b!1132686))

(assert (= (and d!131595 (not res!756415)) b!1132687))

(declare-fun m!1045927 () Bool)

(assert (=> d!131595 m!1045927))

(declare-fun m!1045929 () Bool)

(assert (=> b!1132685 m!1045929))

(declare-fun m!1045931 () Bool)

(assert (=> b!1132685 m!1045931))

(assert (=> b!1132685 m!1045931))

(declare-fun m!1045933 () Bool)

(assert (=> b!1132685 m!1045933))

(assert (=> b!1132687 m!1045931))

(assert (=> b!1132687 m!1045931))

(assert (=> b!1132687 m!1045933))

(assert (=> b!1132510 d!131595))

(declare-fun b!1132688 () Bool)

(declare-fun e!644641 () Bool)

(assert (=> b!1132688 (= e!644641 (validKeyInArray!0 (select (arr!35554 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1132688 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))

(declare-fun b!1132689 () Bool)

(declare-fun lt!503285 () Unit!37110)

(declare-fun lt!503284 () Unit!37110)

(assert (=> b!1132689 (= lt!503285 lt!503284)))

(declare-fun lt!503290 () ListLongMap!15989)

(declare-fun lt!503287 () V!43091)

(declare-fun lt!503288 () (_ BitVec 64))

(declare-fun lt!503289 () (_ BitVec 64))

(assert (=> b!1132689 (not (contains!6534 (+!3453 lt!503290 (tuple2!18021 lt!503289 lt!503287)) lt!503288))))

(assert (=> b!1132689 (= lt!503284 (addStillNotContains!284 lt!503290 lt!503289 lt!503287 lt!503288))))

(assert (=> b!1132689 (= lt!503288 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1132689 (= lt!503287 (get!18079 (select (arr!35555 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!2567 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1132689 (= lt!503289 (select (arr!35554 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun call!48882 () ListLongMap!15989)

(assert (=> b!1132689 (= lt!503290 call!48882)))

(declare-fun e!644640 () ListLongMap!15989)

(assert (=> b!1132689 (= e!644640 (+!3453 call!48882 (tuple2!18021 (select (arr!35554 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) (get!18079 (select (arr!35555 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!2567 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1132690 () Bool)

(declare-fun e!644644 () Bool)

(declare-fun e!644639 () Bool)

(assert (=> b!1132690 (= e!644644 e!644639)))

(declare-fun c!110475 () Bool)

(assert (=> b!1132690 (= c!110475 e!644641)))

(declare-fun res!756419 () Bool)

(assert (=> b!1132690 (=> (not res!756419) (not e!644641))))

(assert (=> b!1132690 (= res!756419 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!36090 _keys!1208)))))

(declare-fun bm!48879 () Bool)

(assert (=> bm!48879 (= call!48882 (getCurrentListMapNoExtraKeys!4497 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1132692 () Bool)

(declare-fun e!644643 () ListLongMap!15989)

(assert (=> b!1132692 (= e!644643 e!644640)))

(declare-fun c!110477 () Bool)

(assert (=> b!1132692 (= c!110477 (validKeyInArray!0 (select (arr!35554 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(declare-fun b!1132693 () Bool)

(declare-fun e!644642 () Bool)

(declare-fun lt!503286 () ListLongMap!15989)

(assert (=> b!1132693 (= e!644642 (isEmpty!976 lt!503286))))

(declare-fun b!1132694 () Bool)

(assert (=> b!1132694 (= e!644642 (= lt!503286 (getCurrentListMapNoExtraKeys!4497 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1132695 () Bool)

(assert (=> b!1132695 (= e!644640 call!48882)))

(declare-fun b!1132696 () Bool)

(assert (=> b!1132696 (= e!644643 (ListLongMap!15990 Nil!24780))))

(declare-fun b!1132697 () Bool)

(declare-fun res!756417 () Bool)

(assert (=> b!1132697 (=> (not res!756417) (not e!644644))))

(assert (=> b!1132697 (= res!756417 (not (contains!6534 lt!503286 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1132691 () Bool)

(assert (=> b!1132691 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!36090 _keys!1208)))))

(assert (=> b!1132691 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!36091 _values!996)))))

(declare-fun e!644638 () Bool)

(assert (=> b!1132691 (= e!644638 (= (apply!956 lt!503286 (select (arr!35554 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))) (get!18079 (select (arr!35555 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!2567 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!131597 () Bool)

(assert (=> d!131597 e!644644))

(declare-fun res!756418 () Bool)

(assert (=> d!131597 (=> (not res!756418) (not e!644644))))

(assert (=> d!131597 (= res!756418 (not (contains!6534 lt!503286 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!131597 (= lt!503286 e!644643)))

(declare-fun c!110476 () Bool)

(assert (=> d!131597 (= c!110476 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!36090 _keys!1208)))))

(assert (=> d!131597 (validMask!0 mask!1564)))

(assert (=> d!131597 (= (getCurrentListMapNoExtraKeys!4497 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!503286)))

(declare-fun b!1132698 () Bool)

(assert (=> b!1132698 (= e!644639 e!644638)))

(assert (=> b!1132698 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!36090 _keys!1208)))))

(declare-fun res!756416 () Bool)

(assert (=> b!1132698 (= res!756416 (contains!6534 lt!503286 (select (arr!35554 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1132698 (=> (not res!756416) (not e!644638))))

(declare-fun b!1132699 () Bool)

(assert (=> b!1132699 (= e!644639 e!644642)))

(declare-fun c!110474 () Bool)

(assert (=> b!1132699 (= c!110474 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!36090 _keys!1208)))))

(assert (= (and d!131597 c!110476) b!1132696))

(assert (= (and d!131597 (not c!110476)) b!1132692))

(assert (= (and b!1132692 c!110477) b!1132689))

(assert (= (and b!1132692 (not c!110477)) b!1132695))

(assert (= (or b!1132689 b!1132695) bm!48879))

(assert (= (and d!131597 res!756418) b!1132697))

(assert (= (and b!1132697 res!756417) b!1132690))

(assert (= (and b!1132690 res!756419) b!1132688))

(assert (= (and b!1132690 c!110475) b!1132698))

(assert (= (and b!1132690 (not c!110475)) b!1132699))

(assert (= (and b!1132698 res!756416) b!1132691))

(assert (= (and b!1132699 c!110474) b!1132694))

(assert (= (and b!1132699 (not c!110474)) b!1132693))

(declare-fun b_lambda!19023 () Bool)

(assert (=> (not b_lambda!19023) (not b!1132689)))

(assert (=> b!1132689 t!35717))

(declare-fun b_and!38731 () Bool)

(assert (= b_and!38729 (and (=> t!35717 result!18073) b_and!38731)))

(declare-fun b_lambda!19025 () Bool)

(assert (=> (not b_lambda!19025) (not b!1132691)))

(assert (=> b!1132691 t!35717))

(declare-fun b_and!38733 () Bool)

(assert (= b_and!38731 (and (=> t!35717 result!18073) b_and!38733)))

(declare-fun m!1045935 () Bool)

(assert (=> b!1132697 m!1045935))

(declare-fun m!1045937 () Bool)

(assert (=> d!131597 m!1045937))

(assert (=> d!131597 m!1045745))

(declare-fun m!1045939 () Bool)

(assert (=> b!1132693 m!1045939))

(assert (=> b!1132688 m!1045871))

(assert (=> b!1132688 m!1045871))

(declare-fun m!1045941 () Bool)

(assert (=> b!1132688 m!1045941))

(assert (=> b!1132689 m!1045749))

(declare-fun m!1045943 () Bool)

(assert (=> b!1132689 m!1045943))

(declare-fun m!1045945 () Bool)

(assert (=> b!1132689 m!1045945))

(declare-fun m!1045947 () Bool)

(assert (=> b!1132689 m!1045947))

(declare-fun m!1045949 () Bool)

(assert (=> b!1132689 m!1045949))

(assert (=> b!1132689 m!1045947))

(declare-fun m!1045951 () Bool)

(assert (=> b!1132689 m!1045951))

(assert (=> b!1132689 m!1045871))

(assert (=> b!1132689 m!1045943))

(assert (=> b!1132689 m!1045749))

(declare-fun m!1045953 () Bool)

(assert (=> b!1132689 m!1045953))

(assert (=> b!1132692 m!1045871))

(assert (=> b!1132692 m!1045871))

(assert (=> b!1132692 m!1045941))

(assert (=> b!1132691 m!1045749))

(assert (=> b!1132691 m!1045943))

(assert (=> b!1132691 m!1045871))

(declare-fun m!1045955 () Bool)

(assert (=> b!1132691 m!1045955))

(assert (=> b!1132691 m!1045871))

(assert (=> b!1132691 m!1045943))

(assert (=> b!1132691 m!1045749))

(assert (=> b!1132691 m!1045953))

(assert (=> b!1132698 m!1045871))

(assert (=> b!1132698 m!1045871))

(declare-fun m!1045957 () Bool)

(assert (=> b!1132698 m!1045957))

(declare-fun m!1045959 () Bool)

(assert (=> bm!48879 m!1045959))

(assert (=> b!1132694 m!1045959))

(assert (=> b!1132510 d!131597))

(declare-fun b!1132710 () Bool)

(declare-fun e!644655 () Bool)

(declare-fun e!644653 () Bool)

(assert (=> b!1132710 (= e!644655 e!644653)))

(declare-fun res!756428 () Bool)

(assert (=> b!1132710 (=> (not res!756428) (not e!644653))))

(declare-fun e!644656 () Bool)

(assert (=> b!1132710 (= res!756428 (not e!644656))))

(declare-fun res!756426 () Bool)

(assert (=> b!1132710 (=> (not res!756426) (not e!644656))))

(assert (=> b!1132710 (= res!756426 (validKeyInArray!0 (select (arr!35554 lt!503171) #b00000000000000000000000000000000)))))

(declare-fun b!1132711 () Bool)

(declare-fun e!644654 () Bool)

(assert (=> b!1132711 (= e!644653 e!644654)))

(declare-fun c!110480 () Bool)

(assert (=> b!1132711 (= c!110480 (validKeyInArray!0 (select (arr!35554 lt!503171) #b00000000000000000000000000000000)))))

(declare-fun b!1132712 () Bool)

(declare-fun call!48885 () Bool)

(assert (=> b!1132712 (= e!644654 call!48885)))

(declare-fun bm!48882 () Bool)

(assert (=> bm!48882 (= call!48885 (arrayNoDuplicates!0 lt!503171 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!110480 (Cons!24780 (select (arr!35554 lt!503171) #b00000000000000000000000000000000) Nil!24781) Nil!24781)))))

(declare-fun b!1132713 () Bool)

(assert (=> b!1132713 (= e!644654 call!48885)))

(declare-fun b!1132714 () Bool)

(declare-fun contains!6536 (List!24784 (_ BitVec 64)) Bool)

(assert (=> b!1132714 (= e!644656 (contains!6536 Nil!24781 (select (arr!35554 lt!503171) #b00000000000000000000000000000000)))))

(declare-fun d!131599 () Bool)

(declare-fun res!756427 () Bool)

(assert (=> d!131599 (=> res!756427 e!644655)))

(assert (=> d!131599 (= res!756427 (bvsge #b00000000000000000000000000000000 (size!36090 lt!503171)))))

(assert (=> d!131599 (= (arrayNoDuplicates!0 lt!503171 #b00000000000000000000000000000000 Nil!24781) e!644655)))

(assert (= (and d!131599 (not res!756427)) b!1132710))

(assert (= (and b!1132710 res!756426) b!1132714))

(assert (= (and b!1132710 res!756428) b!1132711))

(assert (= (and b!1132711 c!110480) b!1132712))

(assert (= (and b!1132711 (not c!110480)) b!1132713))

(assert (= (or b!1132712 b!1132713) bm!48882))

(assert (=> b!1132710 m!1045859))

(assert (=> b!1132710 m!1045859))

(assert (=> b!1132710 m!1045861))

(assert (=> b!1132711 m!1045859))

(assert (=> b!1132711 m!1045859))

(assert (=> b!1132711 m!1045861))

(assert (=> bm!48882 m!1045859))

(declare-fun m!1045961 () Bool)

(assert (=> bm!48882 m!1045961))

(assert (=> b!1132714 m!1045859))

(assert (=> b!1132714 m!1045859))

(declare-fun m!1045963 () Bool)

(assert (=> b!1132714 m!1045963))

(assert (=> b!1132518 d!131599))

(declare-fun b!1132715 () Bool)

(declare-fun e!644659 () Bool)

(declare-fun e!644657 () Bool)

(assert (=> b!1132715 (= e!644659 e!644657)))

(declare-fun res!756431 () Bool)

(assert (=> b!1132715 (=> (not res!756431) (not e!644657))))

(declare-fun e!644660 () Bool)

(assert (=> b!1132715 (= res!756431 (not e!644660))))

(declare-fun res!756429 () Bool)

(assert (=> b!1132715 (=> (not res!756429) (not e!644660))))

(assert (=> b!1132715 (= res!756429 (validKeyInArray!0 (select (arr!35554 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun b!1132716 () Bool)

(declare-fun e!644658 () Bool)

(assert (=> b!1132716 (= e!644657 e!644658)))

(declare-fun c!110481 () Bool)

(assert (=> b!1132716 (= c!110481 (validKeyInArray!0 (select (arr!35554 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun b!1132717 () Bool)

(declare-fun call!48886 () Bool)

(assert (=> b!1132717 (= e!644658 call!48886)))

(declare-fun bm!48883 () Bool)

(assert (=> bm!48883 (= call!48886 (arrayNoDuplicates!0 _keys!1208 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!110481 (Cons!24780 (select (arr!35554 _keys!1208) #b00000000000000000000000000000000) Nil!24781) Nil!24781)))))

(declare-fun b!1132718 () Bool)

(assert (=> b!1132718 (= e!644658 call!48886)))

(declare-fun b!1132719 () Bool)

(assert (=> b!1132719 (= e!644660 (contains!6536 Nil!24781 (select (arr!35554 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun d!131601 () Bool)

(declare-fun res!756430 () Bool)

(assert (=> d!131601 (=> res!756430 e!644659)))

(assert (=> d!131601 (= res!756430 (bvsge #b00000000000000000000000000000000 (size!36090 _keys!1208)))))

(assert (=> d!131601 (= (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24781) e!644659)))

(assert (= (and d!131601 (not res!756430)) b!1132715))

(assert (= (and b!1132715 res!756429) b!1132719))

(assert (= (and b!1132715 res!756431) b!1132716))

(assert (= (and b!1132716 c!110481) b!1132717))

(assert (= (and b!1132716 (not c!110481)) b!1132718))

(assert (= (or b!1132717 b!1132718) bm!48883))

(declare-fun m!1045965 () Bool)

(assert (=> b!1132715 m!1045965))

(assert (=> b!1132715 m!1045965))

(declare-fun m!1045967 () Bool)

(assert (=> b!1132715 m!1045967))

(assert (=> b!1132716 m!1045965))

(assert (=> b!1132716 m!1045965))

(assert (=> b!1132716 m!1045967))

(assert (=> bm!48883 m!1045965))

(declare-fun m!1045969 () Bool)

(assert (=> bm!48883 m!1045969))

(assert (=> b!1132719 m!1045965))

(assert (=> b!1132719 m!1045965))

(declare-fun m!1045971 () Bool)

(assert (=> b!1132719 m!1045971))

(assert (=> b!1132502 d!131601))

(declare-fun b!1132720 () Bool)

(declare-fun e!644664 () Bool)

(assert (=> b!1132720 (= e!644664 (validKeyInArray!0 (select (arr!35554 lt!503171) from!1455)))))

(assert (=> b!1132720 (bvsge from!1455 #b00000000000000000000000000000000)))

(declare-fun b!1132721 () Bool)

(declare-fun lt!503292 () Unit!37110)

(declare-fun lt!503291 () Unit!37110)

(assert (=> b!1132721 (= lt!503292 lt!503291)))

(declare-fun lt!503297 () ListLongMap!15989)

(declare-fun lt!503294 () V!43091)

(declare-fun lt!503295 () (_ BitVec 64))

(declare-fun lt!503296 () (_ BitVec 64))

(assert (=> b!1132721 (not (contains!6534 (+!3453 lt!503297 (tuple2!18021 lt!503296 lt!503294)) lt!503295))))

(assert (=> b!1132721 (= lt!503291 (addStillNotContains!284 lt!503297 lt!503296 lt!503294 lt!503295))))

(assert (=> b!1132721 (= lt!503295 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1132721 (= lt!503294 (get!18079 (select (arr!35555 lt!503174) from!1455) (dynLambda!2567 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1132721 (= lt!503296 (select (arr!35554 lt!503171) from!1455))))

(declare-fun call!48887 () ListLongMap!15989)

(assert (=> b!1132721 (= lt!503297 call!48887)))

(declare-fun e!644663 () ListLongMap!15989)

(assert (=> b!1132721 (= e!644663 (+!3453 call!48887 (tuple2!18021 (select (arr!35554 lt!503171) from!1455) (get!18079 (select (arr!35555 lt!503174) from!1455) (dynLambda!2567 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1132722 () Bool)

(declare-fun e!644667 () Bool)

(declare-fun e!644662 () Bool)

(assert (=> b!1132722 (= e!644667 e!644662)))

(declare-fun c!110483 () Bool)

(assert (=> b!1132722 (= c!110483 e!644664)))

(declare-fun res!756435 () Bool)

(assert (=> b!1132722 (=> (not res!756435) (not e!644664))))

(assert (=> b!1132722 (= res!756435 (bvslt from!1455 (size!36090 lt!503171)))))

(declare-fun bm!48884 () Bool)

(assert (=> bm!48884 (= call!48887 (getCurrentListMapNoExtraKeys!4497 lt!503171 lt!503174 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1132724 () Bool)

(declare-fun e!644666 () ListLongMap!15989)

(assert (=> b!1132724 (= e!644666 e!644663)))

(declare-fun c!110485 () Bool)

(assert (=> b!1132724 (= c!110485 (validKeyInArray!0 (select (arr!35554 lt!503171) from!1455)))))

(declare-fun b!1132725 () Bool)

(declare-fun e!644665 () Bool)

(declare-fun lt!503293 () ListLongMap!15989)

(assert (=> b!1132725 (= e!644665 (isEmpty!976 lt!503293))))

(declare-fun b!1132726 () Bool)

(assert (=> b!1132726 (= e!644665 (= lt!503293 (getCurrentListMapNoExtraKeys!4497 lt!503171 lt!503174 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1132727 () Bool)

(assert (=> b!1132727 (= e!644663 call!48887)))

(declare-fun b!1132728 () Bool)

(assert (=> b!1132728 (= e!644666 (ListLongMap!15990 Nil!24780))))

(declare-fun b!1132729 () Bool)

(declare-fun res!756433 () Bool)

(assert (=> b!1132729 (=> (not res!756433) (not e!644667))))

(assert (=> b!1132729 (= res!756433 (not (contains!6534 lt!503293 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1132723 () Bool)

(assert (=> b!1132723 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!36090 lt!503171)))))

(assert (=> b!1132723 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!36091 lt!503174)))))

(declare-fun e!644661 () Bool)

(assert (=> b!1132723 (= e!644661 (= (apply!956 lt!503293 (select (arr!35554 lt!503171) from!1455)) (get!18079 (select (arr!35555 lt!503174) from!1455) (dynLambda!2567 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!131603 () Bool)

(assert (=> d!131603 e!644667))

(declare-fun res!756434 () Bool)

(assert (=> d!131603 (=> (not res!756434) (not e!644667))))

(assert (=> d!131603 (= res!756434 (not (contains!6534 lt!503293 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!131603 (= lt!503293 e!644666)))

(declare-fun c!110484 () Bool)

(assert (=> d!131603 (= c!110484 (bvsge from!1455 (size!36090 lt!503171)))))

(assert (=> d!131603 (validMask!0 mask!1564)))

(assert (=> d!131603 (= (getCurrentListMapNoExtraKeys!4497 lt!503171 lt!503174 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004) lt!503293)))

(declare-fun b!1132730 () Bool)

(assert (=> b!1132730 (= e!644662 e!644661)))

(assert (=> b!1132730 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!36090 lt!503171)))))

(declare-fun res!756432 () Bool)

(assert (=> b!1132730 (= res!756432 (contains!6534 lt!503293 (select (arr!35554 lt!503171) from!1455)))))

(assert (=> b!1132730 (=> (not res!756432) (not e!644661))))

(declare-fun b!1132731 () Bool)

(assert (=> b!1132731 (= e!644662 e!644665)))

(declare-fun c!110482 () Bool)

(assert (=> b!1132731 (= c!110482 (bvslt from!1455 (size!36090 lt!503171)))))

(assert (= (and d!131603 c!110484) b!1132728))

(assert (= (and d!131603 (not c!110484)) b!1132724))

(assert (= (and b!1132724 c!110485) b!1132721))

(assert (= (and b!1132724 (not c!110485)) b!1132727))

(assert (= (or b!1132721 b!1132727) bm!48884))

(assert (= (and d!131603 res!756434) b!1132729))

(assert (= (and b!1132729 res!756433) b!1132722))

(assert (= (and b!1132722 res!756435) b!1132720))

(assert (= (and b!1132722 c!110483) b!1132730))

(assert (= (and b!1132722 (not c!110483)) b!1132731))

(assert (= (and b!1132730 res!756432) b!1132723))

(assert (= (and b!1132731 c!110482) b!1132726))

(assert (= (and b!1132731 (not c!110482)) b!1132725))

(declare-fun b_lambda!19027 () Bool)

(assert (=> (not b_lambda!19027) (not b!1132721)))

(assert (=> b!1132721 t!35717))

(declare-fun b_and!38735 () Bool)

(assert (= b_and!38733 (and (=> t!35717 result!18073) b_and!38735)))

(declare-fun b_lambda!19029 () Bool)

(assert (=> (not b_lambda!19029) (not b!1132723)))

(assert (=> b!1132723 t!35717))

(declare-fun b_and!38737 () Bool)

(assert (= b_and!38735 (and (=> t!35717 result!18073) b_and!38737)))

(declare-fun m!1045973 () Bool)

(assert (=> b!1132729 m!1045973))

(declare-fun m!1045975 () Bool)

(assert (=> d!131603 m!1045975))

(assert (=> d!131603 m!1045745))

(declare-fun m!1045977 () Bool)

(assert (=> b!1132725 m!1045977))

(declare-fun m!1045979 () Bool)

(assert (=> b!1132720 m!1045979))

(assert (=> b!1132720 m!1045979))

(declare-fun m!1045981 () Bool)

(assert (=> b!1132720 m!1045981))

(assert (=> b!1132721 m!1045749))

(declare-fun m!1045983 () Bool)

(assert (=> b!1132721 m!1045983))

(declare-fun m!1045985 () Bool)

(assert (=> b!1132721 m!1045985))

(declare-fun m!1045987 () Bool)

(assert (=> b!1132721 m!1045987))

(declare-fun m!1045989 () Bool)

(assert (=> b!1132721 m!1045989))

(assert (=> b!1132721 m!1045987))

(declare-fun m!1045991 () Bool)

(assert (=> b!1132721 m!1045991))

(assert (=> b!1132721 m!1045979))

(assert (=> b!1132721 m!1045983))

(assert (=> b!1132721 m!1045749))

(declare-fun m!1045993 () Bool)

(assert (=> b!1132721 m!1045993))

(assert (=> b!1132724 m!1045979))

(assert (=> b!1132724 m!1045979))

(assert (=> b!1132724 m!1045981))

(assert (=> b!1132723 m!1045749))

(assert (=> b!1132723 m!1045983))

(assert (=> b!1132723 m!1045979))

(declare-fun m!1045995 () Bool)

(assert (=> b!1132723 m!1045995))

(assert (=> b!1132723 m!1045979))

(assert (=> b!1132723 m!1045983))

(assert (=> b!1132723 m!1045749))

(assert (=> b!1132723 m!1045993))

(assert (=> b!1132730 m!1045979))

(assert (=> b!1132730 m!1045979))

(declare-fun m!1045997 () Bool)

(assert (=> b!1132730 m!1045997))

(declare-fun m!1045999 () Bool)

(assert (=> bm!48884 m!1045999))

(assert (=> b!1132726 m!1045999))

(assert (=> b!1132511 d!131603))

(declare-fun b!1132732 () Bool)

(declare-fun e!644671 () Bool)

(assert (=> b!1132732 (= e!644671 (validKeyInArray!0 (select (arr!35554 _keys!1208) from!1455)))))

(assert (=> b!1132732 (bvsge from!1455 #b00000000000000000000000000000000)))

(declare-fun b!1132733 () Bool)

(declare-fun lt!503299 () Unit!37110)

(declare-fun lt!503298 () Unit!37110)

(assert (=> b!1132733 (= lt!503299 lt!503298)))

(declare-fun lt!503303 () (_ BitVec 64))

(declare-fun lt!503302 () (_ BitVec 64))

(declare-fun lt!503301 () V!43091)

(declare-fun lt!503304 () ListLongMap!15989)

(assert (=> b!1132733 (not (contains!6534 (+!3453 lt!503304 (tuple2!18021 lt!503303 lt!503301)) lt!503302))))

(assert (=> b!1132733 (= lt!503298 (addStillNotContains!284 lt!503304 lt!503303 lt!503301 lt!503302))))

(assert (=> b!1132733 (= lt!503302 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1132733 (= lt!503301 (get!18079 (select (arr!35555 _values!996) from!1455) (dynLambda!2567 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1132733 (= lt!503303 (select (arr!35554 _keys!1208) from!1455))))

(declare-fun call!48888 () ListLongMap!15989)

(assert (=> b!1132733 (= lt!503304 call!48888)))

(declare-fun e!644670 () ListLongMap!15989)

(assert (=> b!1132733 (= e!644670 (+!3453 call!48888 (tuple2!18021 (select (arr!35554 _keys!1208) from!1455) (get!18079 (select (arr!35555 _values!996) from!1455) (dynLambda!2567 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1132734 () Bool)

(declare-fun e!644674 () Bool)

(declare-fun e!644669 () Bool)

(assert (=> b!1132734 (= e!644674 e!644669)))

(declare-fun c!110487 () Bool)

(assert (=> b!1132734 (= c!110487 e!644671)))

(declare-fun res!756439 () Bool)

(assert (=> b!1132734 (=> (not res!756439) (not e!644671))))

(assert (=> b!1132734 (= res!756439 (bvslt from!1455 (size!36090 _keys!1208)))))

(declare-fun bm!48885 () Bool)

(assert (=> bm!48885 (= call!48888 (getCurrentListMapNoExtraKeys!4497 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1132736 () Bool)

(declare-fun e!644673 () ListLongMap!15989)

(assert (=> b!1132736 (= e!644673 e!644670)))

(declare-fun c!110489 () Bool)

(assert (=> b!1132736 (= c!110489 (validKeyInArray!0 (select (arr!35554 _keys!1208) from!1455)))))

(declare-fun b!1132737 () Bool)

(declare-fun e!644672 () Bool)

(declare-fun lt!503300 () ListLongMap!15989)

(assert (=> b!1132737 (= e!644672 (isEmpty!976 lt!503300))))

(declare-fun b!1132738 () Bool)

(assert (=> b!1132738 (= e!644672 (= lt!503300 (getCurrentListMapNoExtraKeys!4497 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1132739 () Bool)

(assert (=> b!1132739 (= e!644670 call!48888)))

(declare-fun b!1132740 () Bool)

(assert (=> b!1132740 (= e!644673 (ListLongMap!15990 Nil!24780))))

(declare-fun b!1132741 () Bool)

(declare-fun res!756437 () Bool)

(assert (=> b!1132741 (=> (not res!756437) (not e!644674))))

(assert (=> b!1132741 (= res!756437 (not (contains!6534 lt!503300 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1132735 () Bool)

(assert (=> b!1132735 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!36090 _keys!1208)))))

(assert (=> b!1132735 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!36091 _values!996)))))

(declare-fun e!644668 () Bool)

(assert (=> b!1132735 (= e!644668 (= (apply!956 lt!503300 (select (arr!35554 _keys!1208) from!1455)) (get!18079 (select (arr!35555 _values!996) from!1455) (dynLambda!2567 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!131605 () Bool)

(assert (=> d!131605 e!644674))

(declare-fun res!756438 () Bool)

(assert (=> d!131605 (=> (not res!756438) (not e!644674))))

(assert (=> d!131605 (= res!756438 (not (contains!6534 lt!503300 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!131605 (= lt!503300 e!644673)))

(declare-fun c!110488 () Bool)

(assert (=> d!131605 (= c!110488 (bvsge from!1455 (size!36090 _keys!1208)))))

(assert (=> d!131605 (validMask!0 mask!1564)))

(assert (=> d!131605 (= (getCurrentListMapNoExtraKeys!4497 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004) lt!503300)))

(declare-fun b!1132742 () Bool)

(assert (=> b!1132742 (= e!644669 e!644668)))

(assert (=> b!1132742 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!36090 _keys!1208)))))

(declare-fun res!756436 () Bool)

(assert (=> b!1132742 (= res!756436 (contains!6534 lt!503300 (select (arr!35554 _keys!1208) from!1455)))))

(assert (=> b!1132742 (=> (not res!756436) (not e!644668))))

(declare-fun b!1132743 () Bool)

(assert (=> b!1132743 (= e!644669 e!644672)))

(declare-fun c!110486 () Bool)

(assert (=> b!1132743 (= c!110486 (bvslt from!1455 (size!36090 _keys!1208)))))

(assert (= (and d!131605 c!110488) b!1132740))

(assert (= (and d!131605 (not c!110488)) b!1132736))

(assert (= (and b!1132736 c!110489) b!1132733))

(assert (= (and b!1132736 (not c!110489)) b!1132739))

(assert (= (or b!1132733 b!1132739) bm!48885))

(assert (= (and d!131605 res!756438) b!1132741))

(assert (= (and b!1132741 res!756437) b!1132734))

(assert (= (and b!1132734 res!756439) b!1132732))

(assert (= (and b!1132734 c!110487) b!1132742))

(assert (= (and b!1132734 (not c!110487)) b!1132743))

(assert (= (and b!1132742 res!756436) b!1132735))

(assert (= (and b!1132743 c!110486) b!1132738))

(assert (= (and b!1132743 (not c!110486)) b!1132737))

(declare-fun b_lambda!19031 () Bool)

(assert (=> (not b_lambda!19031) (not b!1132733)))

(assert (=> b!1132733 t!35717))

(declare-fun b_and!38739 () Bool)

(assert (= b_and!38737 (and (=> t!35717 result!18073) b_and!38739)))

(declare-fun b_lambda!19033 () Bool)

(assert (=> (not b_lambda!19033) (not b!1132735)))

(assert (=> b!1132735 t!35717))

(declare-fun b_and!38741 () Bool)

(assert (= b_and!38739 (and (=> t!35717 result!18073) b_and!38741)))

(declare-fun m!1046001 () Bool)

(assert (=> b!1132741 m!1046001))

(declare-fun m!1046003 () Bool)

(assert (=> d!131605 m!1046003))

(assert (=> d!131605 m!1045745))

(declare-fun m!1046005 () Bool)

(assert (=> b!1132737 m!1046005))

(assert (=> b!1132732 m!1045759))

(assert (=> b!1132732 m!1045759))

(declare-fun m!1046007 () Bool)

(assert (=> b!1132732 m!1046007))

(assert (=> b!1132733 m!1045749))

(declare-fun m!1046009 () Bool)

(assert (=> b!1132733 m!1046009))

(declare-fun m!1046011 () Bool)

(assert (=> b!1132733 m!1046011))

(declare-fun m!1046013 () Bool)

(assert (=> b!1132733 m!1046013))

(declare-fun m!1046015 () Bool)

(assert (=> b!1132733 m!1046015))

(assert (=> b!1132733 m!1046013))

(declare-fun m!1046017 () Bool)

(assert (=> b!1132733 m!1046017))

(assert (=> b!1132733 m!1045759))

(assert (=> b!1132733 m!1046009))

(assert (=> b!1132733 m!1045749))

(declare-fun m!1046019 () Bool)

(assert (=> b!1132733 m!1046019))

(assert (=> b!1132736 m!1045759))

(assert (=> b!1132736 m!1045759))

(assert (=> b!1132736 m!1046007))

(assert (=> b!1132735 m!1045749))

(assert (=> b!1132735 m!1046009))

(assert (=> b!1132735 m!1045759))

(declare-fun m!1046021 () Bool)

(assert (=> b!1132735 m!1046021))

(assert (=> b!1132735 m!1045759))

(assert (=> b!1132735 m!1046009))

(assert (=> b!1132735 m!1045749))

(assert (=> b!1132735 m!1046019))

(assert (=> b!1132742 m!1045759))

(assert (=> b!1132742 m!1045759))

(declare-fun m!1046023 () Bool)

(assert (=> b!1132742 m!1046023))

(declare-fun m!1046025 () Bool)

(assert (=> bm!48885 m!1046025))

(assert (=> b!1132738 m!1046025))

(assert (=> b!1132511 d!131605))

(assert (=> bm!48838 d!131597))

(declare-fun d!131607 () Bool)

(declare-fun e!644677 () Bool)

(assert (=> d!131607 e!644677))

(declare-fun c!110492 () Bool)

(assert (=> d!131607 (= c!110492 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!503307 () Unit!37110)

(declare-fun choose!1782 (array!73805 array!73807 (_ BitVec 32) (_ BitVec 32) V!43091 V!43091 (_ BitVec 64) (_ BitVec 32) Int) Unit!37110)

(assert (=> d!131607 (= lt!503307 (choose!1782 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> d!131607 (validMask!0 mask!1564)))

(assert (=> d!131607 (= (lemmaListMapContainsThenArrayContainsFrom!325 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!503307)))

(declare-fun b!1132748 () Bool)

(assert (=> b!1132748 (= e!644677 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1132749 () Bool)

(assert (=> b!1132749 (= e!644677 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!131607 c!110492) b!1132748))

(assert (= (and d!131607 (not c!110492)) b!1132749))

(declare-fun m!1046027 () Bool)

(assert (=> d!131607 m!1046027))

(assert (=> d!131607 m!1045745))

(assert (=> b!1132748 m!1045775))

(assert (=> b!1132500 d!131607))

(declare-fun d!131609 () Bool)

(assert (=> d!131609 (contains!6534 (+!3453 lt!503182 (tuple2!18021 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun lt!503308 () Unit!37110)

(assert (=> d!131609 (= lt!503308 (choose!1780 lt!503182 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(assert (=> d!131609 (contains!6534 lt!503182 k0!934)))

(assert (=> d!131609 (= (addStillContains!716 lt!503182 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934) lt!503308)))

(declare-fun bs!32985 () Bool)

(assert (= bs!32985 d!131609))

(assert (=> bs!32985 m!1045765))

(assert (=> bs!32985 m!1045765))

(assert (=> bs!32985 m!1045767))

(declare-fun m!1046029 () Bool)

(assert (=> bs!32985 m!1046029))

(declare-fun m!1046031 () Bool)

(assert (=> bs!32985 m!1046031))

(assert (=> b!1132501 d!131609))

(declare-fun d!131611 () Bool)

(declare-fun e!644678 () Bool)

(assert (=> d!131611 e!644678))

(declare-fun res!756440 () Bool)

(assert (=> d!131611 (=> res!756440 e!644678)))

(declare-fun lt!503312 () Bool)

(assert (=> d!131611 (= res!756440 (not lt!503312))))

(declare-fun lt!503309 () Bool)

(assert (=> d!131611 (= lt!503312 lt!503309)))

(declare-fun lt!503311 () Unit!37110)

(declare-fun e!644679 () Unit!37110)

(assert (=> d!131611 (= lt!503311 e!644679)))

(declare-fun c!110493 () Bool)

(assert (=> d!131611 (= c!110493 lt!503309)))

(assert (=> d!131611 (= lt!503309 (containsKey!586 (toList!8010 (+!3453 lt!503182 (tuple2!18021 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) k0!934))))

(assert (=> d!131611 (= (contains!6534 (+!3453 lt!503182 (tuple2!18021 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934) lt!503312)))

(declare-fun b!1132750 () Bool)

(declare-fun lt!503310 () Unit!37110)

(assert (=> b!1132750 (= e!644679 lt!503310)))

(assert (=> b!1132750 (= lt!503310 (lemmaContainsKeyImpliesGetValueByKeyDefined!416 (toList!8010 (+!3453 lt!503182 (tuple2!18021 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) k0!934))))

(assert (=> b!1132750 (isDefined!455 (getValueByKey!629 (toList!8010 (+!3453 lt!503182 (tuple2!18021 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) k0!934))))

(declare-fun b!1132751 () Bool)

(declare-fun Unit!37118 () Unit!37110)

(assert (=> b!1132751 (= e!644679 Unit!37118)))

(declare-fun b!1132752 () Bool)

(assert (=> b!1132752 (= e!644678 (isDefined!455 (getValueByKey!629 (toList!8010 (+!3453 lt!503182 (tuple2!18021 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) k0!934)))))

(assert (= (and d!131611 c!110493) b!1132750))

(assert (= (and d!131611 (not c!110493)) b!1132751))

(assert (= (and d!131611 (not res!756440)) b!1132752))

(declare-fun m!1046033 () Bool)

(assert (=> d!131611 m!1046033))

(declare-fun m!1046035 () Bool)

(assert (=> b!1132750 m!1046035))

(declare-fun m!1046037 () Bool)

(assert (=> b!1132750 m!1046037))

(assert (=> b!1132750 m!1046037))

(declare-fun m!1046039 () Bool)

(assert (=> b!1132750 m!1046039))

(assert (=> b!1132752 m!1046037))

(assert (=> b!1132752 m!1046037))

(assert (=> b!1132752 m!1046039))

(assert (=> b!1132501 d!131611))

(declare-fun d!131613 () Bool)

(declare-fun e!644682 () Bool)

(assert (=> d!131613 e!644682))

(declare-fun res!756446 () Bool)

(assert (=> d!131613 (=> (not res!756446) (not e!644682))))

(declare-fun lt!503324 () ListLongMap!15989)

(assert (=> d!131613 (= res!756446 (contains!6534 lt!503324 (_1!9021 (tuple2!18021 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun lt!503322 () List!24783)

(assert (=> d!131613 (= lt!503324 (ListLongMap!15990 lt!503322))))

(declare-fun lt!503323 () Unit!37110)

(declare-fun lt!503321 () Unit!37110)

(assert (=> d!131613 (= lt!503323 lt!503321)))

(assert (=> d!131613 (= (getValueByKey!629 lt!503322 (_1!9021 (tuple2!18021 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) (Some!679 (_2!9021 (tuple2!18021 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun lemmaContainsTupThenGetReturnValue!306 (List!24783 (_ BitVec 64) V!43091) Unit!37110)

(assert (=> d!131613 (= lt!503321 (lemmaContainsTupThenGetReturnValue!306 lt!503322 (_1!9021 (tuple2!18021 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) (_2!9021 (tuple2!18021 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun insertStrictlySorted!399 (List!24783 (_ BitVec 64) V!43091) List!24783)

(assert (=> d!131613 (= lt!503322 (insertStrictlySorted!399 (toList!8010 lt!503182) (_1!9021 (tuple2!18021 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) (_2!9021 (tuple2!18021 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(assert (=> d!131613 (= (+!3453 lt!503182 (tuple2!18021 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) lt!503324)))

(declare-fun b!1132757 () Bool)

(declare-fun res!756445 () Bool)

(assert (=> b!1132757 (=> (not res!756445) (not e!644682))))

(assert (=> b!1132757 (= res!756445 (= (getValueByKey!629 (toList!8010 lt!503324) (_1!9021 (tuple2!18021 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) (Some!679 (_2!9021 (tuple2!18021 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1132758 () Bool)

(declare-fun contains!6537 (List!24783 tuple2!18020) Bool)

(assert (=> b!1132758 (= e!644682 (contains!6537 (toList!8010 lt!503324) (tuple2!18021 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))

(assert (= (and d!131613 res!756446) b!1132757))

(assert (= (and b!1132757 res!756445) b!1132758))

(declare-fun m!1046041 () Bool)

(assert (=> d!131613 m!1046041))

(declare-fun m!1046043 () Bool)

(assert (=> d!131613 m!1046043))

(declare-fun m!1046045 () Bool)

(assert (=> d!131613 m!1046045))

(declare-fun m!1046047 () Bool)

(assert (=> d!131613 m!1046047))

(declare-fun m!1046049 () Bool)

(assert (=> b!1132757 m!1046049))

(declare-fun m!1046051 () Bool)

(assert (=> b!1132758 m!1046051))

(assert (=> b!1132501 d!131613))

(declare-fun d!131615 () Bool)

(declare-fun e!644683 () Bool)

(assert (=> d!131615 e!644683))

(declare-fun res!756448 () Bool)

(assert (=> d!131615 (=> (not res!756448) (not e!644683))))

(declare-fun lt!503328 () ListLongMap!15989)

(assert (=> d!131615 (= res!756448 (contains!6534 lt!503328 (_1!9021 (ite (or c!110433 c!110435) (tuple2!18021 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18021 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun lt!503326 () List!24783)

(assert (=> d!131615 (= lt!503328 (ListLongMap!15990 lt!503326))))

(declare-fun lt!503327 () Unit!37110)

(declare-fun lt!503325 () Unit!37110)

(assert (=> d!131615 (= lt!503327 lt!503325)))

(assert (=> d!131615 (= (getValueByKey!629 lt!503326 (_1!9021 (ite (or c!110433 c!110435) (tuple2!18021 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18021 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))) (Some!679 (_2!9021 (ite (or c!110433 c!110435) (tuple2!18021 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18021 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(assert (=> d!131615 (= lt!503325 (lemmaContainsTupThenGetReturnValue!306 lt!503326 (_1!9021 (ite (or c!110433 c!110435) (tuple2!18021 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18021 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) (_2!9021 (ite (or c!110433 c!110435) (tuple2!18021 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18021 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(assert (=> d!131615 (= lt!503326 (insertStrictlySorted!399 (toList!8010 lt!503172) (_1!9021 (ite (or c!110433 c!110435) (tuple2!18021 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18021 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) (_2!9021 (ite (or c!110433 c!110435) (tuple2!18021 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18021 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(assert (=> d!131615 (= (+!3453 lt!503172 (ite (or c!110433 c!110435) (tuple2!18021 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18021 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) lt!503328)))

(declare-fun b!1132759 () Bool)

(declare-fun res!756447 () Bool)

(assert (=> b!1132759 (=> (not res!756447) (not e!644683))))

(assert (=> b!1132759 (= res!756447 (= (getValueByKey!629 (toList!8010 lt!503328) (_1!9021 (ite (or c!110433 c!110435) (tuple2!18021 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18021 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))) (Some!679 (_2!9021 (ite (or c!110433 c!110435) (tuple2!18021 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18021 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))))

(declare-fun b!1132760 () Bool)

(assert (=> b!1132760 (= e!644683 (contains!6537 (toList!8010 lt!503328) (ite (or c!110433 c!110435) (tuple2!18021 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18021 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(assert (= (and d!131615 res!756448) b!1132759))

(assert (= (and b!1132759 res!756447) b!1132760))

(declare-fun m!1046053 () Bool)

(assert (=> d!131615 m!1046053))

(declare-fun m!1046055 () Bool)

(assert (=> d!131615 m!1046055))

(declare-fun m!1046057 () Bool)

(assert (=> d!131615 m!1046057))

(declare-fun m!1046059 () Bool)

(assert (=> d!131615 m!1046059))

(declare-fun m!1046061 () Bool)

(assert (=> b!1132759 m!1046061))

(declare-fun m!1046063 () Bool)

(assert (=> b!1132760 m!1046063))

(assert (=> bm!48840 d!131615))

(declare-fun b!1132761 () Bool)

(declare-fun e!644684 () Bool)

(declare-fun e!644685 () Bool)

(assert (=> b!1132761 (= e!644684 e!644685)))

(declare-fun c!110494 () Bool)

(assert (=> b!1132761 (= c!110494 (validKeyInArray!0 (select (arr!35554 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun bm!48886 () Bool)

(declare-fun call!48889 () Bool)

(assert (=> bm!48886 (= call!48889 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1208 mask!1564))))

(declare-fun b!1132762 () Bool)

(assert (=> b!1132762 (= e!644685 call!48889)))

(declare-fun b!1132763 () Bool)

(declare-fun e!644686 () Bool)

(assert (=> b!1132763 (= e!644686 call!48889)))

(declare-fun b!1132764 () Bool)

(assert (=> b!1132764 (= e!644685 e!644686)))

(declare-fun lt!503330 () (_ BitVec 64))

(assert (=> b!1132764 (= lt!503330 (select (arr!35554 _keys!1208) #b00000000000000000000000000000000))))

(declare-fun lt!503331 () Unit!37110)

(assert (=> b!1132764 (= lt!503331 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 lt!503330 #b00000000000000000000000000000000))))

(assert (=> b!1132764 (arrayContainsKey!0 _keys!1208 lt!503330 #b00000000000000000000000000000000)))

(declare-fun lt!503329 () Unit!37110)

(assert (=> b!1132764 (= lt!503329 lt!503331)))

(declare-fun res!756450 () Bool)

(assert (=> b!1132764 (= res!756450 (= (seekEntryOrOpen!0 (select (arr!35554 _keys!1208) #b00000000000000000000000000000000) _keys!1208 mask!1564) (Found!9926 #b00000000000000000000000000000000)))))

(assert (=> b!1132764 (=> (not res!756450) (not e!644686))))

(declare-fun d!131617 () Bool)

(declare-fun res!756449 () Bool)

(assert (=> d!131617 (=> res!756449 e!644684)))

(assert (=> d!131617 (= res!756449 (bvsge #b00000000000000000000000000000000 (size!36090 _keys!1208)))))

(assert (=> d!131617 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564) e!644684)))

(assert (= (and d!131617 (not res!756449)) b!1132761))

(assert (= (and b!1132761 c!110494) b!1132764))

(assert (= (and b!1132761 (not c!110494)) b!1132762))

(assert (= (and b!1132764 res!756450) b!1132763))

(assert (= (or b!1132763 b!1132762) bm!48886))

(assert (=> b!1132761 m!1045965))

(assert (=> b!1132761 m!1045965))

(assert (=> b!1132761 m!1045967))

(declare-fun m!1046065 () Bool)

(assert (=> bm!48886 m!1046065))

(assert (=> b!1132764 m!1045965))

(declare-fun m!1046067 () Bool)

(assert (=> b!1132764 m!1046067))

(declare-fun m!1046069 () Bool)

(assert (=> b!1132764 m!1046069))

(assert (=> b!1132764 m!1045965))

(declare-fun m!1046071 () Bool)

(assert (=> b!1132764 m!1046071))

(assert (=> b!1132509 d!131617))

(declare-fun d!131619 () Bool)

(declare-fun res!756451 () Bool)

(declare-fun e!644687 () Bool)

(assert (=> d!131619 (=> res!756451 e!644687)))

(assert (=> d!131619 (= res!756451 (= (select (arr!35554 _keys!1208) #b00000000000000000000000000000000) k0!934))))

(assert (=> d!131619 (= (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000) e!644687)))

(declare-fun b!1132765 () Bool)

(declare-fun e!644688 () Bool)

(assert (=> b!1132765 (= e!644687 e!644688)))

(declare-fun res!756452 () Bool)

(assert (=> b!1132765 (=> (not res!756452) (not e!644688))))

(assert (=> b!1132765 (= res!756452 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!36090 _keys!1208)))))

(declare-fun b!1132766 () Bool)

(assert (=> b!1132766 (= e!644688 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!131619 (not res!756451)) b!1132765))

(assert (= (and b!1132765 res!756452) b!1132766))

(assert (=> d!131619 m!1045965))

(declare-fun m!1046073 () Bool)

(assert (=> b!1132766 m!1046073))

(assert (=> b!1132508 d!131619))

(declare-fun d!131621 () Bool)

(assert (=> d!131621 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!503334 () Unit!37110)

(declare-fun choose!13 (array!73805 (_ BitVec 64) (_ BitVec 32)) Unit!37110)

(assert (=> d!131621 (= lt!503334 (choose!13 _keys!1208 k0!934 i!673))))

(assert (=> d!131621 (bvsge i!673 #b00000000000000000000000000000000)))

(assert (=> d!131621 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673) lt!503334)))

(declare-fun bs!32986 () Bool)

(assert (= bs!32986 d!131621))

(assert (=> bs!32986 m!1045755))

(declare-fun m!1046075 () Bool)

(assert (=> bs!32986 m!1046075))

(assert (=> b!1132508 d!131621))

(declare-fun d!131623 () Bool)

(assert (=> d!131623 (= (validMask!0 mask!1564) (and (or (= mask!1564 #b00000000000000000000000000000111) (= mask!1564 #b00000000000000000000000000001111) (= mask!1564 #b00000000000000000000000000011111) (= mask!1564 #b00000000000000000000000000111111) (= mask!1564 #b00000000000000000000000001111111) (= mask!1564 #b00000000000000000000000011111111) (= mask!1564 #b00000000000000000000000111111111) (= mask!1564 #b00000000000000000000001111111111) (= mask!1564 #b00000000000000000000011111111111) (= mask!1564 #b00000000000000000000111111111111) (= mask!1564 #b00000000000000000001111111111111) (= mask!1564 #b00000000000000000011111111111111) (= mask!1564 #b00000000000000000111111111111111) (= mask!1564 #b00000000000000001111111111111111) (= mask!1564 #b00000000000000011111111111111111) (= mask!1564 #b00000000000000111111111111111111) (= mask!1564 #b00000000000001111111111111111111) (= mask!1564 #b00000000000011111111111111111111) (= mask!1564 #b00000000000111111111111111111111) (= mask!1564 #b00000000001111111111111111111111) (= mask!1564 #b00000000011111111111111111111111) (= mask!1564 #b00000000111111111111111111111111) (= mask!1564 #b00000001111111111111111111111111) (= mask!1564 #b00000011111111111111111111111111) (= mask!1564 #b00000111111111111111111111111111) (= mask!1564 #b00001111111111111111111111111111) (= mask!1564 #b00011111111111111111111111111111) (= mask!1564 #b00111111111111111111111111111111)) (bvsle mask!1564 #b00111111111111111111111111111111)))))

(assert (=> b!1132517 d!131623))

(declare-fun condMapEmpty!44537 () Bool)

(declare-fun mapDefault!44537 () ValueCell!13527)

(assert (=> mapNonEmpty!44531 (= condMapEmpty!44537 (= mapRest!44531 ((as const (Array (_ BitVec 32) ValueCell!13527)) mapDefault!44537)))))

(declare-fun e!644693 () Bool)

(declare-fun mapRes!44537 () Bool)

(assert (=> mapNonEmpty!44531 (= tp!84536 (and e!644693 mapRes!44537))))

(declare-fun b!1132774 () Bool)

(assert (=> b!1132774 (= e!644693 tp_is_empty!28473)))

(declare-fun mapIsEmpty!44537 () Bool)

(assert (=> mapIsEmpty!44537 mapRes!44537))

(declare-fun mapNonEmpty!44537 () Bool)

(declare-fun tp!84546 () Bool)

(declare-fun e!644694 () Bool)

(assert (=> mapNonEmpty!44537 (= mapRes!44537 (and tp!84546 e!644694))))

(declare-fun mapValue!44537 () ValueCell!13527)

(declare-fun mapRest!44537 () (Array (_ BitVec 32) ValueCell!13527))

(declare-fun mapKey!44537 () (_ BitVec 32))

(assert (=> mapNonEmpty!44537 (= mapRest!44531 (store mapRest!44537 mapKey!44537 mapValue!44537))))

(declare-fun b!1132773 () Bool)

(assert (=> b!1132773 (= e!644694 tp_is_empty!28473)))

(assert (= (and mapNonEmpty!44531 condMapEmpty!44537) mapIsEmpty!44537))

(assert (= (and mapNonEmpty!44531 (not condMapEmpty!44537)) mapNonEmpty!44537))

(assert (= (and mapNonEmpty!44537 ((_ is ValueCellFull!13527) mapValue!44537)) b!1132773))

(assert (= (and mapNonEmpty!44531 ((_ is ValueCellFull!13527) mapDefault!44537)) b!1132774))

(declare-fun m!1046077 () Bool)

(assert (=> mapNonEmpty!44537 m!1046077))

(declare-fun b_lambda!19035 () Bool)

(assert (= b_lambda!19025 (or (and start!98308 b_free!23943) b_lambda!19035)))

(declare-fun b_lambda!19037 () Bool)

(assert (= b_lambda!19033 (or (and start!98308 b_free!23943) b_lambda!19037)))

(declare-fun b_lambda!19039 () Bool)

(assert (= b_lambda!19017 (or (and start!98308 b_free!23943) b_lambda!19039)))

(declare-fun b_lambda!19041 () Bool)

(assert (= b_lambda!19027 (or (and start!98308 b_free!23943) b_lambda!19041)))

(declare-fun b_lambda!19043 () Bool)

(assert (= b_lambda!19019 (or (and start!98308 b_free!23943) b_lambda!19043)))

(declare-fun b_lambda!19045 () Bool)

(assert (= b_lambda!19031 (or (and start!98308 b_free!23943) b_lambda!19045)))

(declare-fun b_lambda!19047 () Bool)

(assert (= b_lambda!19029 (or (and start!98308 b_free!23943) b_lambda!19047)))

(declare-fun b_lambda!19049 () Bool)

(assert (= b_lambda!19023 (or (and start!98308 b_free!23943) b_lambda!19049)))

(declare-fun b_lambda!19051 () Bool)

(assert (= b_lambda!19021 (or (and start!98308 b_free!23943) b_lambda!19051)))

(check-sat (not d!131587) (not d!131621) (not b!1132760) (not b!1132698) (not d!131589) (not b!1132766) (not d!131593) (not b!1132748) (not b!1132735) (not b_lambda!19039) (not b!1132761) (not b!1132639) (not b!1132693) (not b!1132733) (not b!1132764) (not b!1132720) (not b!1132726) (not bm!48886) (not b!1132719) (not b!1132668) (not d!131597) tp_is_empty!28473 (not b!1132684) (not b_lambda!19041) (not b!1132759) (not b!1132723) (not bm!48869) (not b!1132716) (not d!131607) (not bm!48879) (not b!1132736) (not b!1132697) (not d!131605) (not d!131613) (not b!1132737) (not bm!48885) (not b!1132725) (not bm!48882) (not b!1132685) (not b!1132637) (not b!1132729) (not b!1132673) (not d!131615) (not d!131591) (not b!1132665) (not b!1132692) (not b!1132721) (not b!1132689) (not b!1132757) (not b!1132750) (not b!1132758) (not b!1132711) (not bm!48877) (not b!1132730) (not b!1132752) (not bm!48883) (not b!1132664) (not b!1132694) (not b!1132688) b_and!38741 (not b_lambda!19051) (not b!1132629) (not b!1132715) (not d!131579) (not b_lambda!19045) (not b_lambda!19035) (not b!1132691) (not d!131603) (not b!1132674) (not b!1132710) (not b!1132670) (not b!1132669) (not b!1132620) (not bm!48884) (not b_lambda!19043) (not b_next!23943) (not b!1132623) (not b!1132687) (not d!131609) (not b!1132724) (not b!1132741) (not b!1132738) (not b!1132667) (not mapNonEmpty!44537) (not b!1132714) (not bm!48872) (not b_lambda!19015) (not b_lambda!19037) (not d!131611) (not d!131595) (not b!1132742) (not b_lambda!19049) (not b!1132732) (not bm!48878) (not b_lambda!19047))
(check-sat b_and!38741 (not b_next!23943))
