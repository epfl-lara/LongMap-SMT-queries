; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98122 () Bool)

(assert start!98122)

(declare-fun b_free!23587 () Bool)

(declare-fun b_next!23587 () Bool)

(assert (=> start!98122 (= b_free!23587 (not b_next!23587))))

(declare-fun tp!83465 () Bool)

(declare-fun b_and!37967 () Bool)

(assert (=> start!98122 (= tp!83465 b_and!37967)))

(declare-fun e!639094 () Bool)

(declare-fun k0!934 () (_ BitVec 64))

(declare-datatypes ((V!42617 0))(
  ( (V!42618 (val!14115 Int)) )
))
(declare-datatypes ((tuple2!17724 0))(
  ( (tuple2!17725 (_1!8873 (_ BitVec 64)) (_2!8873 V!42617)) )
))
(declare-datatypes ((List!24520 0))(
  ( (Nil!24517) (Cons!24516 (h!25734 tuple2!17724) (t!35091 List!24520)) )
))
(declare-datatypes ((ListLongMap!15701 0))(
  ( (ListLongMap!15702 (toList!7866 List!24520)) )
))
(declare-fun call!47110 () ListLongMap!15701)

(declare-fun b!1122225 () Bool)

(declare-fun call!47111 () ListLongMap!15701)

(declare-fun -!1067 (ListLongMap!15701 (_ BitVec 64)) ListLongMap!15701)

(assert (=> b!1122225 (= e!639094 (= call!47110 (-!1067 call!47111 k0!934)))))

(declare-fun b!1122226 () Bool)

(declare-fun e!639097 () Bool)

(declare-fun e!639102 () Bool)

(assert (=> b!1122226 (= e!639097 (not e!639102))))

(declare-fun res!749347 () Bool)

(assert (=> b!1122226 (=> res!749347 e!639102)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1122226 (= res!749347 (bvsgt from!1455 i!673))))

(declare-datatypes ((array!73163 0))(
  ( (array!73164 (arr!35228 (Array (_ BitVec 32) (_ BitVec 64))) (size!35765 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73163)

(declare-fun arrayContainsKey!0 (array!73163 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1122226 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36765 0))(
  ( (Unit!36766) )
))
(declare-fun lt!498690 () Unit!36765)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73163 (_ BitVec 64) (_ BitVec 32)) Unit!36765)

(assert (=> b!1122226 (= lt!498690 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1122227 () Bool)

(declare-fun e!639095 () Bool)

(declare-fun tp_is_empty!28117 () Bool)

(assert (=> b!1122227 (= e!639095 tp_is_empty!28117)))

(declare-fun b!1122228 () Bool)

(declare-fun res!749349 () Bool)

(declare-fun e!639101 () Bool)

(assert (=> b!1122228 (=> (not res!749349) (not e!639101))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73163 (_ BitVec 32)) Bool)

(assert (=> b!1122228 (= res!749349 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1122229 () Bool)

(assert (=> b!1122229 (= e!639101 e!639097)))

(declare-fun res!749342 () Bool)

(assert (=> b!1122229 (=> (not res!749342) (not e!639097))))

(declare-fun lt!498693 () array!73163)

(assert (=> b!1122229 (= res!749342 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!498693 mask!1564))))

(assert (=> b!1122229 (= lt!498693 (array!73164 (store (arr!35228 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35765 _keys!1208)))))

(declare-fun b!1122230 () Bool)

(declare-fun res!749351 () Bool)

(assert (=> b!1122230 (=> (not res!749351) (not e!639101))))

(assert (=> b!1122230 (= res!749351 (= (select (arr!35228 _keys!1208) i!673) k0!934))))

(declare-fun b!1122231 () Bool)

(declare-fun e!639099 () Bool)

(declare-fun mapRes!43993 () Bool)

(assert (=> b!1122231 (= e!639099 (and e!639095 mapRes!43993))))

(declare-fun condMapEmpty!43993 () Bool)

(declare-datatypes ((ValueCell!13349 0))(
  ( (ValueCellFull!13349 (v!16744 V!42617)) (EmptyCell!13349) )
))
(declare-datatypes ((array!73165 0))(
  ( (array!73166 (arr!35229 (Array (_ BitVec 32) ValueCell!13349)) (size!35766 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73165)

(declare-fun mapDefault!43993 () ValueCell!13349)

(assert (=> b!1122231 (= condMapEmpty!43993 (= (arr!35229 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13349)) mapDefault!43993)))))

(declare-fun mapIsEmpty!43993 () Bool)

(assert (=> mapIsEmpty!43993 mapRes!43993))

(declare-fun b!1122232 () Bool)

(declare-fun res!749346 () Bool)

(assert (=> b!1122232 (=> (not res!749346) (not e!639097))))

(declare-datatypes ((List!24521 0))(
  ( (Nil!24518) (Cons!24517 (h!25735 (_ BitVec 64)) (t!35092 List!24521)) )
))
(declare-fun arrayNoDuplicates!0 (array!73163 (_ BitVec 32) List!24521) Bool)

(assert (=> b!1122232 (= res!749346 (arrayNoDuplicates!0 lt!498693 #b00000000000000000000000000000000 Nil!24518))))

(declare-fun b!1122233 () Bool)

(declare-fun e!639098 () Bool)

(assert (=> b!1122233 (= e!639098 true)))

(assert (=> b!1122233 e!639094))

(declare-fun c!109781 () Bool)

(assert (=> b!1122233 (= c!109781 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun zeroValue!944 () V!42617)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!498691 () Unit!36765)

(declare-fun minValue!944 () V!42617)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!331 (array!73163 array!73165 (_ BitVec 32) (_ BitVec 32) V!42617 V!42617 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36765)

(assert (=> b!1122233 (= lt!498691 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!331 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!47107 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!4396 (array!73163 array!73165 (_ BitVec 32) (_ BitVec 32) V!42617 V!42617 (_ BitVec 32) Int) ListLongMap!15701)

(assert (=> bm!47107 (= call!47111 (getCurrentListMapNoExtraKeys!4396 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun res!749350 () Bool)

(assert (=> start!98122 (=> (not res!749350) (not e!639101))))

(assert (=> start!98122 (= res!749350 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35765 _keys!1208))))))

(assert (=> start!98122 e!639101))

(assert (=> start!98122 tp_is_empty!28117))

(declare-fun array_inv!27122 (array!73163) Bool)

(assert (=> start!98122 (array_inv!27122 _keys!1208)))

(assert (=> start!98122 true))

(assert (=> start!98122 tp!83465))

(declare-fun array_inv!27123 (array!73165) Bool)

(assert (=> start!98122 (and (array_inv!27123 _values!996) e!639099)))

(declare-fun b!1122234 () Bool)

(declare-fun res!749343 () Bool)

(assert (=> b!1122234 (=> (not res!749343) (not e!639101))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1122234 (= res!749343 (validMask!0 mask!1564))))

(declare-fun b!1122235 () Bool)

(declare-fun res!749352 () Bool)

(assert (=> b!1122235 (=> (not res!749352) (not e!639101))))

(assert (=> b!1122235 (= res!749352 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35765 _keys!1208))))))

(declare-fun bm!47108 () Bool)

(declare-fun lt!498694 () array!73165)

(assert (=> bm!47108 (= call!47110 (getCurrentListMapNoExtraKeys!4396 lt!498693 lt!498694 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1122236 () Bool)

(declare-fun res!749348 () Bool)

(assert (=> b!1122236 (=> (not res!749348) (not e!639101))))

(assert (=> b!1122236 (= res!749348 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24518))))

(declare-fun b!1122237 () Bool)

(declare-fun e!639096 () Bool)

(assert (=> b!1122237 (= e!639096 tp_is_empty!28117)))

(declare-fun b!1122238 () Bool)

(assert (=> b!1122238 (= e!639102 e!639098)))

(declare-fun res!749353 () Bool)

(assert (=> b!1122238 (=> res!749353 e!639098)))

(assert (=> b!1122238 (= res!749353 (not (= from!1455 i!673)))))

(declare-fun lt!498692 () ListLongMap!15701)

(assert (=> b!1122238 (= lt!498692 (getCurrentListMapNoExtraKeys!4396 lt!498693 lt!498694 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2483 (Int (_ BitVec 64)) V!42617)

(assert (=> b!1122238 (= lt!498694 (array!73166 (store (arr!35229 _values!996) i!673 (ValueCellFull!13349 (dynLambda!2483 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35766 _values!996)))))

(declare-fun lt!498689 () ListLongMap!15701)

(assert (=> b!1122238 (= lt!498689 (getCurrentListMapNoExtraKeys!4396 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1122239 () Bool)

(declare-fun res!749345 () Bool)

(assert (=> b!1122239 (=> (not res!749345) (not e!639101))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1122239 (= res!749345 (validKeyInArray!0 k0!934))))

(declare-fun mapNonEmpty!43993 () Bool)

(declare-fun tp!83464 () Bool)

(assert (=> mapNonEmpty!43993 (= mapRes!43993 (and tp!83464 e!639096))))

(declare-fun mapRest!43993 () (Array (_ BitVec 32) ValueCell!13349))

(declare-fun mapKey!43993 () (_ BitVec 32))

(declare-fun mapValue!43993 () ValueCell!13349)

(assert (=> mapNonEmpty!43993 (= (arr!35229 _values!996) (store mapRest!43993 mapKey!43993 mapValue!43993))))

(declare-fun b!1122240 () Bool)

(assert (=> b!1122240 (= e!639094 (= call!47110 call!47111))))

(declare-fun b!1122241 () Bool)

(declare-fun res!749344 () Bool)

(assert (=> b!1122241 (=> (not res!749344) (not e!639101))))

(assert (=> b!1122241 (= res!749344 (and (= (size!35766 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35765 _keys!1208) (size!35766 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(assert (= (and start!98122 res!749350) b!1122234))

(assert (= (and b!1122234 res!749343) b!1122241))

(assert (= (and b!1122241 res!749344) b!1122228))

(assert (= (and b!1122228 res!749349) b!1122236))

(assert (= (and b!1122236 res!749348) b!1122235))

(assert (= (and b!1122235 res!749352) b!1122239))

(assert (= (and b!1122239 res!749345) b!1122230))

(assert (= (and b!1122230 res!749351) b!1122229))

(assert (= (and b!1122229 res!749342) b!1122232))

(assert (= (and b!1122232 res!749346) b!1122226))

(assert (= (and b!1122226 (not res!749347)) b!1122238))

(assert (= (and b!1122238 (not res!749353)) b!1122233))

(assert (= (and b!1122233 c!109781) b!1122225))

(assert (= (and b!1122233 (not c!109781)) b!1122240))

(assert (= (or b!1122225 b!1122240) bm!47108))

(assert (= (or b!1122225 b!1122240) bm!47107))

(assert (= (and b!1122231 condMapEmpty!43993) mapIsEmpty!43993))

(assert (= (and b!1122231 (not condMapEmpty!43993)) mapNonEmpty!43993))

(get-info :version)

(assert (= (and mapNonEmpty!43993 ((_ is ValueCellFull!13349) mapValue!43993)) b!1122237))

(assert (= (and b!1122231 ((_ is ValueCellFull!13349) mapDefault!43993)) b!1122227))

(assert (= start!98122 b!1122231))

(declare-fun b_lambda!18567 () Bool)

(assert (=> (not b_lambda!18567) (not b!1122238)))

(declare-fun t!35090 () Bool)

(declare-fun tb!8391 () Bool)

(assert (=> (and start!98122 (= defaultEntry!1004 defaultEntry!1004) t!35090) tb!8391))

(declare-fun result!17351 () Bool)

(assert (=> tb!8391 (= result!17351 tp_is_empty!28117)))

(assert (=> b!1122238 t!35090))

(declare-fun b_and!37969 () Bool)

(assert (= b_and!37967 (and (=> t!35090 result!17351) b_and!37969)))

(declare-fun m!1037523 () Bool)

(assert (=> b!1122228 m!1037523))

(declare-fun m!1037525 () Bool)

(assert (=> b!1122233 m!1037525))

(declare-fun m!1037527 () Bool)

(assert (=> b!1122230 m!1037527))

(declare-fun m!1037529 () Bool)

(assert (=> b!1122229 m!1037529))

(declare-fun m!1037531 () Bool)

(assert (=> b!1122229 m!1037531))

(declare-fun m!1037533 () Bool)

(assert (=> b!1122226 m!1037533))

(declare-fun m!1037535 () Bool)

(assert (=> b!1122226 m!1037535))

(declare-fun m!1037537 () Bool)

(assert (=> mapNonEmpty!43993 m!1037537))

(declare-fun m!1037539 () Bool)

(assert (=> b!1122239 m!1037539))

(declare-fun m!1037541 () Bool)

(assert (=> bm!47107 m!1037541))

(declare-fun m!1037543 () Bool)

(assert (=> b!1122225 m!1037543))

(declare-fun m!1037545 () Bool)

(assert (=> b!1122234 m!1037545))

(declare-fun m!1037547 () Bool)

(assert (=> b!1122238 m!1037547))

(declare-fun m!1037549 () Bool)

(assert (=> b!1122238 m!1037549))

(declare-fun m!1037551 () Bool)

(assert (=> b!1122238 m!1037551))

(declare-fun m!1037553 () Bool)

(assert (=> b!1122238 m!1037553))

(declare-fun m!1037555 () Bool)

(assert (=> bm!47108 m!1037555))

(declare-fun m!1037557 () Bool)

(assert (=> start!98122 m!1037557))

(declare-fun m!1037559 () Bool)

(assert (=> start!98122 m!1037559))

(declare-fun m!1037561 () Bool)

(assert (=> b!1122232 m!1037561))

(declare-fun m!1037563 () Bool)

(assert (=> b!1122236 m!1037563))

(check-sat (not b!1122233) (not b_lambda!18567) (not b!1122236) (not b_next!23587) (not b!1122225) (not mapNonEmpty!43993) tp_is_empty!28117 (not start!98122) (not b!1122229) (not b!1122228) (not bm!47108) b_and!37969 (not b!1122238) (not b!1122239) (not b!1122226) (not bm!47107) (not b!1122232) (not b!1122234))
(check-sat b_and!37969 (not b_next!23587))
