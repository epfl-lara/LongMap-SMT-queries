; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97696 () Bool)

(assert start!97696)

(declare-fun b_free!23431 () Bool)

(declare-fun b_next!23431 () Bool)

(assert (=> start!97696 (= b_free!23431 (not b_next!23431))))

(declare-fun tp!82592 () Bool)

(declare-fun b_and!37709 () Bool)

(assert (=> start!97696 (= tp!82592 b_and!37709)))

(declare-fun mapIsEmpty!43354 () Bool)

(declare-fun mapRes!43354 () Bool)

(assert (=> mapIsEmpty!43354 mapRes!43354))

(declare-fun b!1113508 () Bool)

(declare-fun res!742701 () Bool)

(declare-fun e!634985 () Bool)

(assert (=> b!1113508 (=> (not res!742701) (not e!634985))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!42049 0))(
  ( (V!42050 (val!13902 Int)) )
))
(declare-datatypes ((ValueCell!13136 0))(
  ( (ValueCellFull!13136 (v!16531 V!42049)) (EmptyCell!13136) )
))
(declare-datatypes ((array!72333 0))(
  ( (array!72334 (arr!34813 (Array (_ BitVec 32) ValueCell!13136)) (size!35350 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72333)

(declare-datatypes ((array!72335 0))(
  ( (array!72336 (arr!34814 (Array (_ BitVec 32) (_ BitVec 64))) (size!35351 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72335)

(assert (=> b!1113508 (= res!742701 (and (= (size!35350 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35351 _keys!1208) (size!35350 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1113509 () Bool)

(declare-fun res!742708 () Bool)

(assert (=> b!1113509 (=> (not res!742708) (not e!634985))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72335 (_ BitVec 32)) Bool)

(assert (=> b!1113509 (= res!742708 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1113510 () Bool)

(declare-fun res!742702 () Bool)

(assert (=> b!1113510 (=> (not res!742702) (not e!634985))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1113510 (= res!742702 (validMask!0 mask!1564))))

(declare-fun b!1113512 () Bool)

(declare-fun e!634982 () Bool)

(declare-fun tp_is_empty!27691 () Bool)

(assert (=> b!1113512 (= e!634982 tp_is_empty!27691)))

(declare-fun zeroValue!944 () V!42049)

(declare-datatypes ((tuple2!17620 0))(
  ( (tuple2!17621 (_1!8821 (_ BitVec 64)) (_2!8821 V!42049)) )
))
(declare-datatypes ((List!24301 0))(
  ( (Nil!24298) (Cons!24297 (h!25515 tuple2!17620) (t!34770 List!24301)) )
))
(declare-datatypes ((ListLongMap!15597 0))(
  ( (ListLongMap!15598 (toList!7814 List!24301)) )
))
(declare-fun call!47056 () ListLongMap!15597)

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun bm!47053 () Bool)

(declare-fun minValue!944 () V!42049)

(declare-fun getCurrentListMapNoExtraKeys!4345 (array!72335 array!72333 (_ BitVec 32) (_ BitVec 32) V!42049 V!42049 (_ BitVec 32) Int) ListLongMap!15597)

(assert (=> bm!47053 (= call!47056 (getCurrentListMapNoExtraKeys!4345 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapNonEmpty!43354 () Bool)

(declare-fun tp!82591 () Bool)

(declare-fun e!634984 () Bool)

(assert (=> mapNonEmpty!43354 (= mapRes!43354 (and tp!82591 e!634984))))

(declare-fun mapKey!43354 () (_ BitVec 32))

(declare-fun mapValue!43354 () ValueCell!13136)

(declare-fun mapRest!43354 () (Array (_ BitVec 32) ValueCell!13136))

(assert (=> mapNonEmpty!43354 (= (arr!34813 _values!996) (store mapRest!43354 mapKey!43354 mapValue!43354))))

(declare-fun b!1113513 () Bool)

(declare-fun e!634981 () Bool)

(assert (=> b!1113513 (= e!634985 e!634981)))

(declare-fun res!742706 () Bool)

(assert (=> b!1113513 (=> (not res!742706) (not e!634981))))

(declare-fun lt!496992 () array!72335)

(assert (=> b!1113513 (= res!742706 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!496992 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1113513 (= lt!496992 (array!72336 (store (arr!34814 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35351 _keys!1208)))))

(declare-fun b!1113514 () Bool)

(declare-fun res!742700 () Bool)

(assert (=> b!1113514 (=> (not res!742700) (not e!634985))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1113514 (= res!742700 (validKeyInArray!0 k0!934))))

(declare-fun b!1113515 () Bool)

(declare-fun res!742707 () Bool)

(assert (=> b!1113515 (=> (not res!742707) (not e!634985))))

(assert (=> b!1113515 (= res!742707 (= (select (arr!34814 _keys!1208) i!673) k0!934))))

(declare-fun b!1113516 () Bool)

(assert (=> b!1113516 (= e!634984 tp_is_empty!27691)))

(declare-fun b!1113517 () Bool)

(declare-fun call!47057 () ListLongMap!15597)

(declare-fun e!634979 () Bool)

(declare-fun -!1061 (ListLongMap!15597 (_ BitVec 64)) ListLongMap!15597)

(assert (=> b!1113517 (= e!634979 (= call!47057 (-!1061 call!47056 k0!934)))))

(declare-fun b!1113518 () Bool)

(declare-fun e!634986 () Bool)

(assert (=> b!1113518 (= e!634981 (not e!634986))))

(declare-fun res!742703 () Bool)

(assert (=> b!1113518 (=> res!742703 e!634986)))

(assert (=> b!1113518 (= res!742703 (or (bvsle from!1455 i!673) (bvsgt (bvadd #b00000000000000000000000000000001 from!1455) (size!35351 _keys!1208)) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!72335 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1113518 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36475 0))(
  ( (Unit!36476) )
))
(declare-fun lt!496993 () Unit!36475)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72335 (_ BitVec 64) (_ BitVec 32)) Unit!36475)

(assert (=> b!1113518 (= lt!496993 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1113519 () Bool)

(assert (=> b!1113519 (= e!634986 true)))

(assert (=> b!1113519 e!634979))

(declare-fun c!109754 () Bool)

(assert (=> b!1113519 (= c!109754 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!496991 () Unit!36475)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!325 (array!72335 array!72333 (_ BitVec 32) (_ BitVec 32) V!42049 V!42049 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36475)

(assert (=> b!1113519 (= lt!496991 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!325 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1113520 () Bool)

(declare-fun res!742698 () Bool)

(assert (=> b!1113520 (=> (not res!742698) (not e!634985))))

(assert (=> b!1113520 (= res!742698 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35351 _keys!1208))))))

(declare-fun b!1113511 () Bool)

(assert (=> b!1113511 (= e!634979 (= call!47057 call!47056))))

(declare-fun res!742704 () Bool)

(assert (=> start!97696 (=> (not res!742704) (not e!634985))))

(assert (=> start!97696 (= res!742704 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35351 _keys!1208))))))

(assert (=> start!97696 e!634985))

(assert (=> start!97696 tp_is_empty!27691))

(declare-fun array_inv!26826 (array!72335) Bool)

(assert (=> start!97696 (array_inv!26826 _keys!1208)))

(assert (=> start!97696 true))

(assert (=> start!97696 tp!82592))

(declare-fun e!634980 () Bool)

(declare-fun array_inv!26827 (array!72333) Bool)

(assert (=> start!97696 (and (array_inv!26827 _values!996) e!634980)))

(declare-fun bm!47054 () Bool)

(declare-fun dynLambda!2453 (Int (_ BitVec 64)) V!42049)

(assert (=> bm!47054 (= call!47057 (getCurrentListMapNoExtraKeys!4345 lt!496992 (array!72334 (store (arr!34813 _values!996) i!673 (ValueCellFull!13136 (dynLambda!2453 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35350 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1113521 () Bool)

(declare-fun res!742705 () Bool)

(assert (=> b!1113521 (=> (not res!742705) (not e!634981))))

(declare-datatypes ((List!24302 0))(
  ( (Nil!24299) (Cons!24298 (h!25516 (_ BitVec 64)) (t!34771 List!24302)) )
))
(declare-fun arrayNoDuplicates!0 (array!72335 (_ BitVec 32) List!24302) Bool)

(assert (=> b!1113521 (= res!742705 (arrayNoDuplicates!0 lt!496992 #b00000000000000000000000000000000 Nil!24299))))

(declare-fun b!1113522 () Bool)

(declare-fun res!742699 () Bool)

(assert (=> b!1113522 (=> (not res!742699) (not e!634985))))

(assert (=> b!1113522 (= res!742699 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24299))))

(declare-fun b!1113523 () Bool)

(assert (=> b!1113523 (= e!634980 (and e!634982 mapRes!43354))))

(declare-fun condMapEmpty!43354 () Bool)

(declare-fun mapDefault!43354 () ValueCell!13136)

(assert (=> b!1113523 (= condMapEmpty!43354 (= (arr!34813 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13136)) mapDefault!43354)))))

(assert (= (and start!97696 res!742704) b!1113510))

(assert (= (and b!1113510 res!742702) b!1113508))

(assert (= (and b!1113508 res!742701) b!1113509))

(assert (= (and b!1113509 res!742708) b!1113522))

(assert (= (and b!1113522 res!742699) b!1113520))

(assert (= (and b!1113520 res!742698) b!1113514))

(assert (= (and b!1113514 res!742700) b!1113515))

(assert (= (and b!1113515 res!742707) b!1113513))

(assert (= (and b!1113513 res!742706) b!1113521))

(assert (= (and b!1113521 res!742705) b!1113518))

(assert (= (and b!1113518 (not res!742703)) b!1113519))

(assert (= (and b!1113519 c!109754) b!1113517))

(assert (= (and b!1113519 (not c!109754)) b!1113511))

(assert (= (or b!1113517 b!1113511) bm!47053))

(assert (= (or b!1113517 b!1113511) bm!47054))

(assert (= (and b!1113523 condMapEmpty!43354) mapIsEmpty!43354))

(assert (= (and b!1113523 (not condMapEmpty!43354)) mapNonEmpty!43354))

(get-info :version)

(assert (= (and mapNonEmpty!43354 ((_ is ValueCellFull!13136) mapValue!43354)) b!1113516))

(assert (= (and b!1113523 ((_ is ValueCellFull!13136) mapDefault!43354)) b!1113512))

(assert (= start!97696 b!1113523))

(declare-fun b_lambda!18465 () Bool)

(assert (=> (not b_lambda!18465) (not bm!47054)))

(declare-fun t!34769 () Bool)

(declare-fun tb!8289 () Bool)

(assert (=> (and start!97696 (= defaultEntry!1004 defaultEntry!1004) t!34769) tb!8289))

(declare-fun result!17147 () Bool)

(assert (=> tb!8289 (= result!17147 tp_is_empty!27691)))

(assert (=> bm!47054 t!34769))

(declare-fun b_and!37711 () Bool)

(assert (= b_and!37709 (and (=> t!34769 result!17147) b_and!37711)))

(declare-fun m!1031463 () Bool)

(assert (=> b!1113519 m!1031463))

(declare-fun m!1031465 () Bool)

(assert (=> start!97696 m!1031465))

(declare-fun m!1031467 () Bool)

(assert (=> start!97696 m!1031467))

(declare-fun m!1031469 () Bool)

(assert (=> mapNonEmpty!43354 m!1031469))

(declare-fun m!1031471 () Bool)

(assert (=> bm!47053 m!1031471))

(declare-fun m!1031473 () Bool)

(assert (=> b!1113513 m!1031473))

(declare-fun m!1031475 () Bool)

(assert (=> b!1113513 m!1031475))

(declare-fun m!1031477 () Bool)

(assert (=> b!1113518 m!1031477))

(declare-fun m!1031479 () Bool)

(assert (=> b!1113518 m!1031479))

(declare-fun m!1031481 () Bool)

(assert (=> b!1113510 m!1031481))

(declare-fun m!1031483 () Bool)

(assert (=> b!1113521 m!1031483))

(declare-fun m!1031485 () Bool)

(assert (=> b!1113509 m!1031485))

(declare-fun m!1031487 () Bool)

(assert (=> b!1113522 m!1031487))

(declare-fun m!1031489 () Bool)

(assert (=> b!1113515 m!1031489))

(declare-fun m!1031491 () Bool)

(assert (=> b!1113517 m!1031491))

(declare-fun m!1031493 () Bool)

(assert (=> bm!47054 m!1031493))

(declare-fun m!1031495 () Bool)

(assert (=> bm!47054 m!1031495))

(declare-fun m!1031497 () Bool)

(assert (=> bm!47054 m!1031497))

(declare-fun m!1031499 () Bool)

(assert (=> b!1113514 m!1031499))

(check-sat tp_is_empty!27691 (not start!97696) (not b!1113517) (not bm!47053) (not b_lambda!18465) (not b!1113522) (not b!1113509) (not b!1113518) (not b!1113514) b_and!37711 (not b!1113513) (not b!1113510) (not b_next!23431) (not b!1113519) (not mapNonEmpty!43354) (not bm!47054) (not b!1113521))
(check-sat b_and!37711 (not b_next!23431))
