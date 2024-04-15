; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97940 () Bool)

(assert start!97940)

(declare-fun b_free!23647 () Bool)

(declare-fun b_next!23647 () Bool)

(assert (=> start!97940 (= b_free!23647 (not b_next!23647))))

(declare-fun tp!83644 () Bool)

(declare-fun b_and!38055 () Bool)

(assert (=> start!97940 (= tp!83644 b_and!38055)))

(declare-fun b!1122388 () Bool)

(declare-fun e!639004 () Bool)

(declare-fun e!639003 () Bool)

(assert (=> b!1122388 (= e!639004 e!639003)))

(declare-fun res!749869 () Bool)

(assert (=> b!1122388 (=> res!749869 e!639003)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1122388 (= res!749869 (not (= from!1455 i!673)))))

(declare-datatypes ((V!42697 0))(
  ( (V!42698 (val!14145 Int)) )
))
(declare-fun zeroValue!944 () V!42697)

(declare-datatypes ((tuple2!17830 0))(
  ( (tuple2!17831 (_1!8926 (_ BitVec 64)) (_2!8926 V!42697)) )
))
(declare-datatypes ((List!24599 0))(
  ( (Nil!24596) (Cons!24595 (h!25804 tuple2!17830) (t!35229 List!24599)) )
))
(declare-datatypes ((ListLongMap!15799 0))(
  ( (ListLongMap!15800 (toList!7915 List!24599)) )
))
(declare-fun lt!498549 () ListLongMap!15799)

(declare-datatypes ((ValueCell!13379 0))(
  ( (ValueCellFull!13379 (v!16777 V!42697)) (EmptyCell!13379) )
))
(declare-datatypes ((array!73146 0))(
  ( (array!73147 (arr!35226 (Array (_ BitVec 32) ValueCell!13379)) (size!35764 (_ BitVec 32))) )
))
(declare-fun lt!498546 () array!73146)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((array!73148 0))(
  ( (array!73149 (arr!35227 (Array (_ BitVec 32) (_ BitVec 64))) (size!35765 (_ BitVec 32))) )
))
(declare-fun lt!498544 () array!73148)

(declare-fun minValue!944 () V!42697)

(declare-fun getCurrentListMapNoExtraKeys!4422 (array!73148 array!73146 (_ BitVec 32) (_ BitVec 32) V!42697 V!42697 (_ BitVec 32) Int) ListLongMap!15799)

(assert (=> b!1122388 (= lt!498549 (getCurrentListMapNoExtraKeys!4422 lt!498544 lt!498546 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun _values!996 () array!73146)

(declare-fun dynLambda!2459 (Int (_ BitVec 64)) V!42697)

(assert (=> b!1122388 (= lt!498546 (array!73147 (store (arr!35226 _values!996) i!673 (ValueCellFull!13379 (dynLambda!2459 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35764 _values!996)))))

(declare-fun _keys!1208 () array!73148)

(declare-fun lt!498545 () ListLongMap!15799)

(assert (=> b!1122388 (= lt!498545 (getCurrentListMapNoExtraKeys!4422 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1122389 () Bool)

(declare-fun e!639006 () Bool)

(declare-fun call!47201 () ListLongMap!15799)

(declare-fun call!47200 () ListLongMap!15799)

(assert (=> b!1122389 (= e!639006 (= call!47201 call!47200))))

(declare-fun res!749860 () Bool)

(declare-fun e!638997 () Bool)

(assert (=> start!97940 (=> (not res!749860) (not e!638997))))

(assert (=> start!97940 (= res!749860 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35765 _keys!1208))))))

(assert (=> start!97940 e!638997))

(declare-fun tp_is_empty!28177 () Bool)

(assert (=> start!97940 tp_is_empty!28177))

(declare-fun array_inv!27120 (array!73148) Bool)

(assert (=> start!97940 (array_inv!27120 _keys!1208)))

(assert (=> start!97940 true))

(assert (=> start!97940 tp!83644))

(declare-fun e!639005 () Bool)

(declare-fun array_inv!27121 (array!73146) Bool)

(assert (=> start!97940 (and (array_inv!27121 _values!996) e!639005)))

(declare-fun mapNonEmpty!44083 () Bool)

(declare-fun mapRes!44083 () Bool)

(declare-fun tp!83645 () Bool)

(declare-fun e!638998 () Bool)

(assert (=> mapNonEmpty!44083 (= mapRes!44083 (and tp!83645 e!638998))))

(declare-fun mapRest!44083 () (Array (_ BitVec 32) ValueCell!13379))

(declare-fun mapValue!44083 () ValueCell!13379)

(declare-fun mapKey!44083 () (_ BitVec 32))

(assert (=> mapNonEmpty!44083 (= (arr!35226 _values!996) (store mapRest!44083 mapKey!44083 mapValue!44083))))

(declare-fun b!1122390 () Bool)

(declare-fun e!639000 () Bool)

(assert (=> b!1122390 (= e!638997 e!639000)))

(declare-fun res!749871 () Bool)

(assert (=> b!1122390 (=> (not res!749871) (not e!639000))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73148 (_ BitVec 32)) Bool)

(assert (=> b!1122390 (= res!749871 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!498544 mask!1564))))

(assert (=> b!1122390 (= lt!498544 (array!73149 (store (arr!35227 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35765 _keys!1208)))))

(declare-fun b!1122391 () Bool)

(declare-fun e!639001 () Bool)

(assert (=> b!1122391 (= e!639001 true)))

(declare-fun lt!498543 () Bool)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun contains!6393 (ListLongMap!15799 (_ BitVec 64)) Bool)

(assert (=> b!1122391 (= lt!498543 (contains!6393 (getCurrentListMapNoExtraKeys!4422 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun b!1122392 () Bool)

(declare-fun res!749867 () Bool)

(assert (=> b!1122392 (=> (not res!749867) (not e!638997))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1122392 (= res!749867 (validMask!0 mask!1564))))

(declare-fun b!1122393 () Bool)

(declare-fun res!749861 () Bool)

(assert (=> b!1122393 (=> (not res!749861) (not e!638997))))

(assert (=> b!1122393 (= res!749861 (= (select (arr!35227 _keys!1208) i!673) k0!934))))

(declare-fun b!1122394 () Bool)

(declare-fun -!1064 (ListLongMap!15799 (_ BitVec 64)) ListLongMap!15799)

(assert (=> b!1122394 (= e!639006 (= call!47201 (-!1064 call!47200 k0!934)))))

(declare-fun bm!47197 () Bool)

(assert (=> bm!47197 (= call!47201 (getCurrentListMapNoExtraKeys!4422 lt!498544 lt!498546 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1122395 () Bool)

(declare-fun res!749862 () Bool)

(assert (=> b!1122395 (=> (not res!749862) (not e!638997))))

(assert (=> b!1122395 (= res!749862 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1122396 () Bool)

(declare-fun e!638999 () Bool)

(assert (=> b!1122396 (= e!638999 tp_is_empty!28177)))

(declare-fun b!1122397 () Bool)

(assert (=> b!1122397 (= e!639003 e!639001)))

(declare-fun res!749866 () Bool)

(assert (=> b!1122397 (=> res!749866 e!639001)))

(assert (=> b!1122397 (= res!749866 (not (= (select (arr!35227 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1122397 e!639006))

(declare-fun c!109434 () Bool)

(assert (=> b!1122397 (= c!109434 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-datatypes ((Unit!36653 0))(
  ( (Unit!36654) )
))
(declare-fun lt!498547 () Unit!36653)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!340 (array!73148 array!73146 (_ BitVec 32) (_ BitVec 32) V!42697 V!42697 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36653)

(assert (=> b!1122397 (= lt!498547 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!340 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!47198 () Bool)

(assert (=> bm!47198 (= call!47200 (getCurrentListMapNoExtraKeys!4422 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1122398 () Bool)

(declare-fun res!749864 () Bool)

(assert (=> b!1122398 (=> (not res!749864) (not e!638997))))

(declare-datatypes ((List!24600 0))(
  ( (Nil!24597) (Cons!24596 (h!25805 (_ BitVec 64)) (t!35230 List!24600)) )
))
(declare-fun arrayNoDuplicates!0 (array!73148 (_ BitVec 32) List!24600) Bool)

(assert (=> b!1122398 (= res!749864 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24597))))

(declare-fun b!1122399 () Bool)

(declare-fun res!749872 () Bool)

(assert (=> b!1122399 (=> (not res!749872) (not e!639000))))

(assert (=> b!1122399 (= res!749872 (arrayNoDuplicates!0 lt!498544 #b00000000000000000000000000000000 Nil!24597))))

(declare-fun b!1122400 () Bool)

(assert (=> b!1122400 (= e!639000 (not e!639004))))

(declare-fun res!749868 () Bool)

(assert (=> b!1122400 (=> res!749868 e!639004)))

(assert (=> b!1122400 (= res!749868 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73148 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1122400 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!498548 () Unit!36653)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73148 (_ BitVec 64) (_ BitVec 32)) Unit!36653)

(assert (=> b!1122400 (= lt!498548 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1122401 () Bool)

(declare-fun res!749865 () Bool)

(assert (=> b!1122401 (=> (not res!749865) (not e!638997))))

(assert (=> b!1122401 (= res!749865 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35765 _keys!1208))))))

(declare-fun b!1122402 () Bool)

(assert (=> b!1122402 (= e!638998 tp_is_empty!28177)))

(declare-fun b!1122403 () Bool)

(declare-fun res!749863 () Bool)

(assert (=> b!1122403 (=> (not res!749863) (not e!638997))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1122403 (= res!749863 (validKeyInArray!0 k0!934))))

(declare-fun mapIsEmpty!44083 () Bool)

(assert (=> mapIsEmpty!44083 mapRes!44083))

(declare-fun b!1122404 () Bool)

(declare-fun res!749870 () Bool)

(assert (=> b!1122404 (=> (not res!749870) (not e!638997))))

(assert (=> b!1122404 (= res!749870 (and (= (size!35764 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35765 _keys!1208) (size!35764 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1122405 () Bool)

(assert (=> b!1122405 (= e!639005 (and e!638999 mapRes!44083))))

(declare-fun condMapEmpty!44083 () Bool)

(declare-fun mapDefault!44083 () ValueCell!13379)

(assert (=> b!1122405 (= condMapEmpty!44083 (= (arr!35226 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13379)) mapDefault!44083)))))

(assert (= (and start!97940 res!749860) b!1122392))

(assert (= (and b!1122392 res!749867) b!1122404))

(assert (= (and b!1122404 res!749870) b!1122395))

(assert (= (and b!1122395 res!749862) b!1122398))

(assert (= (and b!1122398 res!749864) b!1122401))

(assert (= (and b!1122401 res!749865) b!1122403))

(assert (= (and b!1122403 res!749863) b!1122393))

(assert (= (and b!1122393 res!749861) b!1122390))

(assert (= (and b!1122390 res!749871) b!1122399))

(assert (= (and b!1122399 res!749872) b!1122400))

(assert (= (and b!1122400 (not res!749868)) b!1122388))

(assert (= (and b!1122388 (not res!749869)) b!1122397))

(assert (= (and b!1122397 c!109434) b!1122394))

(assert (= (and b!1122397 (not c!109434)) b!1122389))

(assert (= (or b!1122394 b!1122389) bm!47197))

(assert (= (or b!1122394 b!1122389) bm!47198))

(assert (= (and b!1122397 (not res!749866)) b!1122391))

(assert (= (and b!1122405 condMapEmpty!44083) mapIsEmpty!44083))

(assert (= (and b!1122405 (not condMapEmpty!44083)) mapNonEmpty!44083))

(get-info :version)

(assert (= (and mapNonEmpty!44083 ((_ is ValueCellFull!13379) mapValue!44083)) b!1122402))

(assert (= (and b!1122405 ((_ is ValueCellFull!13379) mapDefault!44083)) b!1122396))

(assert (= start!97940 b!1122405))

(declare-fun b_lambda!18599 () Bool)

(assert (=> (not b_lambda!18599) (not b!1122388)))

(declare-fun t!35228 () Bool)

(declare-fun tb!8451 () Bool)

(assert (=> (and start!97940 (= defaultEntry!1004 defaultEntry!1004) t!35228) tb!8451))

(declare-fun result!17471 () Bool)

(assert (=> tb!8451 (= result!17471 tp_is_empty!28177)))

(assert (=> b!1122388 t!35228))

(declare-fun b_and!38057 () Bool)

(assert (= b_and!38055 (and (=> t!35228 result!17471) b_and!38057)))

(declare-fun m!1036527 () Bool)

(assert (=> b!1122397 m!1036527))

(declare-fun m!1036529 () Bool)

(assert (=> b!1122397 m!1036529))

(declare-fun m!1036531 () Bool)

(assert (=> b!1122399 m!1036531))

(declare-fun m!1036533 () Bool)

(assert (=> b!1122395 m!1036533))

(declare-fun m!1036535 () Bool)

(assert (=> b!1122400 m!1036535))

(declare-fun m!1036537 () Bool)

(assert (=> b!1122400 m!1036537))

(declare-fun m!1036539 () Bool)

(assert (=> bm!47197 m!1036539))

(declare-fun m!1036541 () Bool)

(assert (=> b!1122393 m!1036541))

(declare-fun m!1036543 () Bool)

(assert (=> b!1122403 m!1036543))

(declare-fun m!1036545 () Bool)

(assert (=> b!1122390 m!1036545))

(declare-fun m!1036547 () Bool)

(assert (=> b!1122390 m!1036547))

(declare-fun m!1036549 () Bool)

(assert (=> bm!47198 m!1036549))

(declare-fun m!1036551 () Bool)

(assert (=> b!1122388 m!1036551))

(declare-fun m!1036553 () Bool)

(assert (=> b!1122388 m!1036553))

(declare-fun m!1036555 () Bool)

(assert (=> b!1122388 m!1036555))

(declare-fun m!1036557 () Bool)

(assert (=> b!1122388 m!1036557))

(declare-fun m!1036559 () Bool)

(assert (=> b!1122392 m!1036559))

(declare-fun m!1036561 () Bool)

(assert (=> b!1122394 m!1036561))

(declare-fun m!1036563 () Bool)

(assert (=> b!1122398 m!1036563))

(declare-fun m!1036565 () Bool)

(assert (=> start!97940 m!1036565))

(declare-fun m!1036567 () Bool)

(assert (=> start!97940 m!1036567))

(declare-fun m!1036569 () Bool)

(assert (=> mapNonEmpty!44083 m!1036569))

(assert (=> b!1122391 m!1036549))

(assert (=> b!1122391 m!1036549))

(declare-fun m!1036571 () Bool)

(assert (=> b!1122391 m!1036571))

(check-sat (not b!1122388) (not b!1122398) (not bm!47198) (not b!1122400) (not b!1122391) (not b_lambda!18599) (not b!1122392) (not b!1122403) (not bm!47197) tp_is_empty!28177 (not start!97940) (not b!1122394) (not b_next!23647) (not mapNonEmpty!44083) (not b!1122390) (not b!1122395) b_and!38057 (not b!1122399) (not b!1122397))
(check-sat b_and!38057 (not b_next!23647))
