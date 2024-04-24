; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97540 () Bool)

(assert start!97540)

(declare-fun b_free!23275 () Bool)

(declare-fun b_next!23275 () Bool)

(assert (=> start!97540 (= b_free!23275 (not b_next!23275))))

(declare-fun tp!82124 () Bool)

(declare-fun b_and!37393 () Bool)

(assert (=> start!97540 (= tp!82124 b_and!37393)))

(declare-fun b!1109584 () Bool)

(declare-fun e!633095 () Bool)

(assert (=> b!1109584 (= e!633095 true)))

(declare-fun e!633101 () Bool)

(assert (=> b!1109584 e!633101))

(declare-fun c!109508 () Bool)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1109584 (= c!109508 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-datatypes ((V!41841 0))(
  ( (V!41842 (val!13824 Int)) )
))
(declare-fun zeroValue!944 () V!41841)

(declare-datatypes ((array!72021 0))(
  ( (array!72022 (arr!34657 (Array (_ BitVec 32) (_ BitVec 64))) (size!35194 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72021)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun k0!934 () (_ BitVec 64))

(declare-datatypes ((Unit!36349 0))(
  ( (Unit!36350) )
))
(declare-fun lt!496289 () Unit!36349)

(declare-datatypes ((ValueCell!13058 0))(
  ( (ValueCellFull!13058 (v!16453 V!41841)) (EmptyCell!13058) )
))
(declare-datatypes ((array!72023 0))(
  ( (array!72024 (arr!34658 (Array (_ BitVec 32) ValueCell!13058)) (size!35195 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72023)

(declare-fun minValue!944 () V!41841)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!271 (array!72021 array!72023 (_ BitVec 32) (_ BitVec 32) V!41841 V!41841 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36349)

(assert (=> b!1109584 (= lt!496289 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!271 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1109585 () Bool)

(declare-fun res!740132 () Bool)

(declare-fun e!633099 () Bool)

(assert (=> b!1109585 (=> (not res!740132) (not e!633099))))

(declare-fun lt!496290 () array!72021)

(declare-datatypes ((List!24164 0))(
  ( (Nil!24161) (Cons!24160 (h!25378 (_ BitVec 64)) (t!34477 List!24164)) )
))
(declare-fun arrayNoDuplicates!0 (array!72021 (_ BitVec 32) List!24164) Bool)

(assert (=> b!1109585 (= res!740132 (arrayNoDuplicates!0 lt!496290 #b00000000000000000000000000000000 Nil!24161))))

(declare-fun b!1109586 () Bool)

(declare-fun res!740126 () Bool)

(declare-fun e!633096 () Bool)

(assert (=> b!1109586 (=> (not res!740126) (not e!633096))))

(assert (=> b!1109586 (= res!740126 (and (= (size!35195 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35194 _keys!1208) (size!35195 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!43120 () Bool)

(declare-fun mapRes!43120 () Bool)

(assert (=> mapIsEmpty!43120 mapRes!43120))

(declare-fun b!1109587 () Bool)

(declare-fun e!633100 () Bool)

(declare-fun tp_is_empty!27535 () Bool)

(assert (=> b!1109587 (= e!633100 tp_is_empty!27535)))

(declare-fun b!1109588 () Bool)

(declare-fun res!740124 () Bool)

(assert (=> b!1109588 (=> (not res!740124) (not e!633096))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1109588 (= res!740124 (validKeyInArray!0 k0!934))))

(declare-fun res!740128 () Bool)

(assert (=> start!97540 (=> (not res!740128) (not e!633096))))

(assert (=> start!97540 (= res!740128 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35194 _keys!1208))))))

(assert (=> start!97540 e!633096))

(assert (=> start!97540 tp_is_empty!27535))

(declare-fun array_inv!26702 (array!72021) Bool)

(assert (=> start!97540 (array_inv!26702 _keys!1208)))

(assert (=> start!97540 true))

(assert (=> start!97540 tp!82124))

(declare-fun e!633102 () Bool)

(declare-fun array_inv!26703 (array!72023) Bool)

(assert (=> start!97540 (and (array_inv!26703 _values!996) e!633102)))

(declare-fun mapNonEmpty!43120 () Bool)

(declare-fun tp!82123 () Bool)

(assert (=> mapNonEmpty!43120 (= mapRes!43120 (and tp!82123 e!633100))))

(declare-fun mapRest!43120 () (Array (_ BitVec 32) ValueCell!13058))

(declare-fun mapValue!43120 () ValueCell!13058)

(declare-fun mapKey!43120 () (_ BitVec 32))

(assert (=> mapNonEmpty!43120 (= (arr!34658 _values!996) (store mapRest!43120 mapKey!43120 mapValue!43120))))

(declare-fun bm!46585 () Bool)

(declare-datatypes ((tuple2!17478 0))(
  ( (tuple2!17479 (_1!8750 (_ BitVec 64)) (_2!8750 V!41841)) )
))
(declare-datatypes ((List!24165 0))(
  ( (Nil!24162) (Cons!24161 (h!25379 tuple2!17478) (t!34478 List!24165)) )
))
(declare-datatypes ((ListLongMap!15455 0))(
  ( (ListLongMap!15456 (toList!7743 List!24165)) )
))
(declare-fun call!46588 () ListLongMap!15455)

(declare-fun getCurrentListMapNoExtraKeys!4278 (array!72021 array!72023 (_ BitVec 32) (_ BitVec 32) V!41841 V!41841 (_ BitVec 32) Int) ListLongMap!15455)

(assert (=> bm!46585 (= call!46588 (getCurrentListMapNoExtraKeys!4278 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun call!46589 () ListLongMap!15455)

(declare-fun b!1109589 () Bool)

(declare-fun -!1001 (ListLongMap!15455 (_ BitVec 64)) ListLongMap!15455)

(assert (=> b!1109589 (= e!633101 (= call!46589 (-!1001 call!46588 k0!934)))))

(declare-fun b!1109590 () Bool)

(declare-fun res!740125 () Bool)

(assert (=> b!1109590 (=> (not res!740125) (not e!633096))))

(assert (=> b!1109590 (= res!740125 (= (select (arr!34657 _keys!1208) i!673) k0!934))))

(declare-fun b!1109591 () Bool)

(assert (=> b!1109591 (= e!633101 (= call!46589 call!46588))))

(declare-fun b!1109592 () Bool)

(declare-fun e!633097 () Bool)

(assert (=> b!1109592 (= e!633102 (and e!633097 mapRes!43120))))

(declare-fun condMapEmpty!43120 () Bool)

(declare-fun mapDefault!43120 () ValueCell!13058)

(assert (=> b!1109592 (= condMapEmpty!43120 (= (arr!34658 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13058)) mapDefault!43120)))))

(declare-fun b!1109593 () Bool)

(declare-fun res!740134 () Bool)

(assert (=> b!1109593 (=> (not res!740134) (not e!633096))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72021 (_ BitVec 32)) Bool)

(assert (=> b!1109593 (= res!740134 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1109594 () Bool)

(assert (=> b!1109594 (= e!633096 e!633099)))

(declare-fun res!740129 () Bool)

(assert (=> b!1109594 (=> (not res!740129) (not e!633099))))

(assert (=> b!1109594 (= res!740129 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!496290 mask!1564))))

(assert (=> b!1109594 (= lt!496290 (array!72022 (store (arr!34657 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35194 _keys!1208)))))

(declare-fun b!1109595 () Bool)

(declare-fun res!740131 () Bool)

(assert (=> b!1109595 (=> (not res!740131) (not e!633096))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1109595 (= res!740131 (validMask!0 mask!1564))))

(declare-fun b!1109596 () Bool)

(declare-fun res!740133 () Bool)

(assert (=> b!1109596 (=> (not res!740133) (not e!633096))))

(assert (=> b!1109596 (= res!740133 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24161))))

(declare-fun bm!46586 () Bool)

(declare-fun dynLambda!2394 (Int (_ BitVec 64)) V!41841)

(assert (=> bm!46586 (= call!46589 (getCurrentListMapNoExtraKeys!4278 lt!496290 (array!72024 (store (arr!34658 _values!996) i!673 (ValueCellFull!13058 (dynLambda!2394 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35195 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1109597 () Bool)

(assert (=> b!1109597 (= e!633097 tp_is_empty!27535)))

(declare-fun b!1109598 () Bool)

(assert (=> b!1109598 (= e!633099 (not e!633095))))

(declare-fun res!740130 () Bool)

(assert (=> b!1109598 (=> res!740130 e!633095)))

(assert (=> b!1109598 (= res!740130 (or (bvsle from!1455 i!673) (bvsgt (bvadd #b00000000000000000000000000000001 from!1455) (size!35194 _keys!1208)) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!72021 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1109598 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!496291 () Unit!36349)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72021 (_ BitVec 64) (_ BitVec 32)) Unit!36349)

(assert (=> b!1109598 (= lt!496291 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1109599 () Bool)

(declare-fun res!740127 () Bool)

(assert (=> b!1109599 (=> (not res!740127) (not e!633096))))

(assert (=> b!1109599 (= res!740127 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35194 _keys!1208))))))

(assert (= (and start!97540 res!740128) b!1109595))

(assert (= (and b!1109595 res!740131) b!1109586))

(assert (= (and b!1109586 res!740126) b!1109593))

(assert (= (and b!1109593 res!740134) b!1109596))

(assert (= (and b!1109596 res!740133) b!1109599))

(assert (= (and b!1109599 res!740127) b!1109588))

(assert (= (and b!1109588 res!740124) b!1109590))

(assert (= (and b!1109590 res!740125) b!1109594))

(assert (= (and b!1109594 res!740129) b!1109585))

(assert (= (and b!1109585 res!740132) b!1109598))

(assert (= (and b!1109598 (not res!740130)) b!1109584))

(assert (= (and b!1109584 c!109508) b!1109589))

(assert (= (and b!1109584 (not c!109508)) b!1109591))

(assert (= (or b!1109589 b!1109591) bm!46586))

(assert (= (or b!1109589 b!1109591) bm!46585))

(assert (= (and b!1109592 condMapEmpty!43120) mapIsEmpty!43120))

(assert (= (and b!1109592 (not condMapEmpty!43120)) mapNonEmpty!43120))

(get-info :version)

(assert (= (and mapNonEmpty!43120 ((_ is ValueCellFull!13058) mapValue!43120)) b!1109587))

(assert (= (and b!1109592 ((_ is ValueCellFull!13058) mapDefault!43120)) b!1109597))

(assert (= start!97540 b!1109592))

(declare-fun b_lambda!18305 () Bool)

(assert (=> (not b_lambda!18305) (not bm!46586)))

(declare-fun t!34476 () Bool)

(declare-fun tb!8133 () Bool)

(assert (=> (and start!97540 (= defaultEntry!1004 defaultEntry!1004) t!34476) tb!8133))

(declare-fun result!16835 () Bool)

(assert (=> tb!8133 (= result!16835 tp_is_empty!27535)))

(assert (=> bm!46586 t!34476))

(declare-fun b_and!37395 () Bool)

(assert (= b_and!37393 (and (=> t!34476 result!16835) b_and!37395)))

(declare-fun m!1028499 () Bool)

(assert (=> bm!46585 m!1028499))

(declare-fun m!1028501 () Bool)

(assert (=> b!1109593 m!1028501))

(declare-fun m!1028503 () Bool)

(assert (=> b!1109594 m!1028503))

(declare-fun m!1028505 () Bool)

(assert (=> b!1109594 m!1028505))

(declare-fun m!1028507 () Bool)

(assert (=> b!1109585 m!1028507))

(declare-fun m!1028509 () Bool)

(assert (=> b!1109589 m!1028509))

(declare-fun m!1028511 () Bool)

(assert (=> b!1109598 m!1028511))

(declare-fun m!1028513 () Bool)

(assert (=> b!1109598 m!1028513))

(declare-fun m!1028515 () Bool)

(assert (=> b!1109595 m!1028515))

(declare-fun m!1028517 () Bool)

(assert (=> bm!46586 m!1028517))

(declare-fun m!1028519 () Bool)

(assert (=> bm!46586 m!1028519))

(declare-fun m!1028521 () Bool)

(assert (=> bm!46586 m!1028521))

(declare-fun m!1028523 () Bool)

(assert (=> b!1109584 m!1028523))

(declare-fun m!1028525 () Bool)

(assert (=> mapNonEmpty!43120 m!1028525))

(declare-fun m!1028527 () Bool)

(assert (=> b!1109596 m!1028527))

(declare-fun m!1028529 () Bool)

(assert (=> start!97540 m!1028529))

(declare-fun m!1028531 () Bool)

(assert (=> start!97540 m!1028531))

(declare-fun m!1028533 () Bool)

(assert (=> b!1109590 m!1028533))

(declare-fun m!1028535 () Bool)

(assert (=> b!1109588 m!1028535))

(check-sat (not start!97540) (not bm!46586) b_and!37395 (not b!1109594) tp_is_empty!27535 (not b!1109596) (not b!1109598) (not b!1109589) (not b!1109593) (not bm!46585) (not b!1109584) (not b!1109588) (not b_lambda!18305) (not mapNonEmpty!43120) (not b!1109595) (not b_next!23275) (not b!1109585))
(check-sat b_and!37395 (not b_next!23275))
