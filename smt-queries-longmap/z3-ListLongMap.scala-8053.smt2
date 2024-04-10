; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99160 () Bool)

(assert start!99160)

(declare-fun b_free!24765 () Bool)

(declare-fun b_next!24765 () Bool)

(assert (=> start!99160 (= b_free!24765 (not b_next!24765))))

(declare-fun tp!87006 () Bool)

(declare-fun b_and!40379 () Bool)

(assert (=> start!99160 (= tp!87006 b_and!40379)))

(declare-fun b!1167031 () Bool)

(declare-fun res!774152 () Bool)

(declare-fun e!663338 () Bool)

(assert (=> b!1167031 (=> (not res!774152) (not e!663338))))

(declare-datatypes ((array!75419 0))(
  ( (array!75420 (arr!36360 (Array (_ BitVec 32) (_ BitVec 64))) (size!36896 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75419)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75419 (_ BitVec 32)) Bool)

(assert (=> b!1167031 (= res!774152 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1167032 () Bool)

(declare-fun e!663339 () Bool)

(declare-fun tp_is_empty!29295 () Bool)

(assert (=> b!1167032 (= e!663339 tp_is_empty!29295)))

(declare-fun b!1167033 () Bool)

(declare-fun res!774144 () Bool)

(assert (=> b!1167033 (=> (not res!774144) (not e!663338))))

(declare-datatypes ((List!25496 0))(
  ( (Nil!25493) (Cons!25492 (h!26701 (_ BitVec 64)) (t!37253 List!25496)) )
))
(declare-fun arrayNoDuplicates!0 (array!75419 (_ BitVec 32) List!25496) Bool)

(assert (=> b!1167033 (= res!774144 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25493))))

(declare-fun b!1167034 () Bool)

(declare-fun res!774146 () Bool)

(assert (=> b!1167034 (=> (not res!774146) (not e!663338))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1167034 (= res!774146 (validMask!0 mask!1564))))

(declare-fun b!1167035 () Bool)

(declare-fun res!774145 () Bool)

(assert (=> b!1167035 (=> (not res!774145) (not e!663338))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1167035 (= res!774145 (validKeyInArray!0 k0!934))))

(declare-fun b!1167036 () Bool)

(declare-fun e!663342 () Bool)

(declare-fun e!663343 () Bool)

(assert (=> b!1167036 (= e!663342 e!663343)))

(declare-fun res!774153 () Bool)

(assert (=> b!1167036 (=> res!774153 e!663343)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1167036 (= res!774153 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-datatypes ((V!44187 0))(
  ( (V!44188 (val!14704 Int)) )
))
(declare-fun zeroValue!944 () V!44187)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!525478 () array!75419)

(declare-datatypes ((ValueCell!13938 0))(
  ( (ValueCellFull!13938 (v!17341 V!44187)) (EmptyCell!13938) )
))
(declare-datatypes ((array!75421 0))(
  ( (array!75422 (arr!36361 (Array (_ BitVec 32) ValueCell!13938)) (size!36897 (_ BitVec 32))) )
))
(declare-fun lt!525482 () array!75421)

(declare-datatypes ((tuple2!18756 0))(
  ( (tuple2!18757 (_1!9389 (_ BitVec 64)) (_2!9389 V!44187)) )
))
(declare-datatypes ((List!25497 0))(
  ( (Nil!25494) (Cons!25493 (h!26702 tuple2!18756) (t!37254 List!25497)) )
))
(declare-datatypes ((ListLongMap!16725 0))(
  ( (ListLongMap!16726 (toList!8378 List!25497)) )
))
(declare-fun lt!525479 () ListLongMap!16725)

(declare-fun minValue!944 () V!44187)

(declare-fun getCurrentListMapNoExtraKeys!4842 (array!75419 array!75421 (_ BitVec 32) (_ BitVec 32) V!44187 V!44187 (_ BitVec 32) Int) ListLongMap!16725)

(assert (=> b!1167036 (= lt!525479 (getCurrentListMapNoExtraKeys!4842 lt!525478 lt!525482 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun _values!996 () array!75421)

(declare-fun dynLambda!2827 (Int (_ BitVec 64)) V!44187)

(assert (=> b!1167036 (= lt!525482 (array!75422 (store (arr!36361 _values!996) i!673 (ValueCellFull!13938 (dynLambda!2827 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36897 _values!996)))))

(declare-fun lt!525483 () ListLongMap!16725)

(assert (=> b!1167036 (= lt!525483 (getCurrentListMapNoExtraKeys!4842 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun mapNonEmpty!45767 () Bool)

(declare-fun mapRes!45767 () Bool)

(declare-fun tp!87005 () Bool)

(declare-fun e!663341 () Bool)

(assert (=> mapNonEmpty!45767 (= mapRes!45767 (and tp!87005 e!663341))))

(declare-fun mapRest!45767 () (Array (_ BitVec 32) ValueCell!13938))

(declare-fun mapValue!45767 () ValueCell!13938)

(declare-fun mapKey!45767 () (_ BitVec 32))

(assert (=> mapNonEmpty!45767 (= (arr!36361 _values!996) (store mapRest!45767 mapKey!45767 mapValue!45767))))

(declare-fun b!1167037 () Bool)

(assert (=> b!1167037 (= e!663343 true)))

(declare-fun -!1454 (ListLongMap!16725 (_ BitVec 64)) ListLongMap!16725)

(assert (=> b!1167037 (= (getCurrentListMapNoExtraKeys!4842 lt!525478 lt!525482 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1454 (getCurrentListMapNoExtraKeys!4842 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-datatypes ((Unit!38510 0))(
  ( (Unit!38511) )
))
(declare-fun lt!525480 () Unit!38510)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!681 (array!75419 array!75421 (_ BitVec 32) (_ BitVec 32) V!44187 V!44187 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38510)

(assert (=> b!1167037 (= lt!525480 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!681 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapIsEmpty!45767 () Bool)

(assert (=> mapIsEmpty!45767 mapRes!45767))

(declare-fun b!1167038 () Bool)

(declare-fun e!663344 () Bool)

(assert (=> b!1167038 (= e!663344 (not e!663342))))

(declare-fun res!774148 () Bool)

(assert (=> b!1167038 (=> res!774148 e!663342)))

(assert (=> b!1167038 (= res!774148 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!75419 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1167038 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!525481 () Unit!38510)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75419 (_ BitVec 64) (_ BitVec 32)) Unit!38510)

(assert (=> b!1167038 (= lt!525481 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1167039 () Bool)

(assert (=> b!1167039 (= e!663338 e!663344)))

(declare-fun res!774155 () Bool)

(assert (=> b!1167039 (=> (not res!774155) (not e!663344))))

(assert (=> b!1167039 (= res!774155 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!525478 mask!1564))))

(assert (=> b!1167039 (= lt!525478 (array!75420 (store (arr!36360 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36896 _keys!1208)))))

(declare-fun b!1167040 () Bool)

(declare-fun e!663340 () Bool)

(assert (=> b!1167040 (= e!663340 (and e!663339 mapRes!45767))))

(declare-fun condMapEmpty!45767 () Bool)

(declare-fun mapDefault!45767 () ValueCell!13938)

(assert (=> b!1167040 (= condMapEmpty!45767 (= (arr!36361 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13938)) mapDefault!45767)))))

(declare-fun res!774150 () Bool)

(assert (=> start!99160 (=> (not res!774150) (not e!663338))))

(assert (=> start!99160 (= res!774150 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36896 _keys!1208))))))

(assert (=> start!99160 e!663338))

(assert (=> start!99160 tp_is_empty!29295))

(declare-fun array_inv!27800 (array!75419) Bool)

(assert (=> start!99160 (array_inv!27800 _keys!1208)))

(assert (=> start!99160 true))

(assert (=> start!99160 tp!87006))

(declare-fun array_inv!27801 (array!75421) Bool)

(assert (=> start!99160 (and (array_inv!27801 _values!996) e!663340)))

(declare-fun b!1167041 () Bool)

(declare-fun res!774147 () Bool)

(assert (=> b!1167041 (=> (not res!774147) (not e!663344))))

(assert (=> b!1167041 (= res!774147 (arrayNoDuplicates!0 lt!525478 #b00000000000000000000000000000000 Nil!25493))))

(declare-fun b!1167042 () Bool)

(declare-fun res!774154 () Bool)

(assert (=> b!1167042 (=> (not res!774154) (not e!663338))))

(assert (=> b!1167042 (= res!774154 (= (select (arr!36360 _keys!1208) i!673) k0!934))))

(declare-fun b!1167043 () Bool)

(declare-fun res!774151 () Bool)

(assert (=> b!1167043 (=> (not res!774151) (not e!663338))))

(assert (=> b!1167043 (= res!774151 (and (= (size!36897 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36896 _keys!1208) (size!36897 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1167044 () Bool)

(assert (=> b!1167044 (= e!663341 tp_is_empty!29295)))

(declare-fun b!1167045 () Bool)

(declare-fun res!774149 () Bool)

(assert (=> b!1167045 (=> (not res!774149) (not e!663338))))

(assert (=> b!1167045 (= res!774149 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36896 _keys!1208))))))

(assert (= (and start!99160 res!774150) b!1167034))

(assert (= (and b!1167034 res!774146) b!1167043))

(assert (= (and b!1167043 res!774151) b!1167031))

(assert (= (and b!1167031 res!774152) b!1167033))

(assert (= (and b!1167033 res!774144) b!1167045))

(assert (= (and b!1167045 res!774149) b!1167035))

(assert (= (and b!1167035 res!774145) b!1167042))

(assert (= (and b!1167042 res!774154) b!1167039))

(assert (= (and b!1167039 res!774155) b!1167041))

(assert (= (and b!1167041 res!774147) b!1167038))

(assert (= (and b!1167038 (not res!774148)) b!1167036))

(assert (= (and b!1167036 (not res!774153)) b!1167037))

(assert (= (and b!1167040 condMapEmpty!45767) mapIsEmpty!45767))

(assert (= (and b!1167040 (not condMapEmpty!45767)) mapNonEmpty!45767))

(get-info :version)

(assert (= (and mapNonEmpty!45767 ((_ is ValueCellFull!13938) mapValue!45767)) b!1167044))

(assert (= (and b!1167040 ((_ is ValueCellFull!13938) mapDefault!45767)) b!1167032))

(assert (= start!99160 b!1167040))

(declare-fun b_lambda!19871 () Bool)

(assert (=> (not b_lambda!19871) (not b!1167036)))

(declare-fun t!37252 () Bool)

(declare-fun tb!9577 () Bool)

(assert (=> (and start!99160 (= defaultEntry!1004 defaultEntry!1004) t!37252) tb!9577))

(declare-fun result!19719 () Bool)

(assert (=> tb!9577 (= result!19719 tp_is_empty!29295)))

(assert (=> b!1167036 t!37252))

(declare-fun b_and!40381 () Bool)

(assert (= b_and!40379 (and (=> t!37252 result!19719) b_and!40381)))

(declare-fun m!1075007 () Bool)

(assert (=> b!1167039 m!1075007))

(declare-fun m!1075009 () Bool)

(assert (=> b!1167039 m!1075009))

(declare-fun m!1075011 () Bool)

(assert (=> b!1167041 m!1075011))

(declare-fun m!1075013 () Bool)

(assert (=> mapNonEmpty!45767 m!1075013))

(declare-fun m!1075015 () Bool)

(assert (=> b!1167042 m!1075015))

(declare-fun m!1075017 () Bool)

(assert (=> b!1167033 m!1075017))

(declare-fun m!1075019 () Bool)

(assert (=> b!1167034 m!1075019))

(declare-fun m!1075021 () Bool)

(assert (=> b!1167036 m!1075021))

(declare-fun m!1075023 () Bool)

(assert (=> b!1167036 m!1075023))

(declare-fun m!1075025 () Bool)

(assert (=> b!1167036 m!1075025))

(declare-fun m!1075027 () Bool)

(assert (=> b!1167036 m!1075027))

(declare-fun m!1075029 () Bool)

(assert (=> b!1167035 m!1075029))

(declare-fun m!1075031 () Bool)

(assert (=> b!1167037 m!1075031))

(declare-fun m!1075033 () Bool)

(assert (=> b!1167037 m!1075033))

(assert (=> b!1167037 m!1075033))

(declare-fun m!1075035 () Bool)

(assert (=> b!1167037 m!1075035))

(declare-fun m!1075037 () Bool)

(assert (=> b!1167037 m!1075037))

(declare-fun m!1075039 () Bool)

(assert (=> b!1167038 m!1075039))

(declare-fun m!1075041 () Bool)

(assert (=> b!1167038 m!1075041))

(declare-fun m!1075043 () Bool)

(assert (=> b!1167031 m!1075043))

(declare-fun m!1075045 () Bool)

(assert (=> start!99160 m!1075045))

(declare-fun m!1075047 () Bool)

(assert (=> start!99160 m!1075047))

(check-sat (not mapNonEmpty!45767) (not b!1167035) b_and!40381 (not b!1167034) (not b_lambda!19871) (not b!1167039) (not b!1167031) (not b!1167038) tp_is_empty!29295 (not b!1167036) (not b!1167033) (not b!1167041) (not start!99160) (not b!1167037) (not b_next!24765))
(check-sat b_and!40381 (not b_next!24765))
