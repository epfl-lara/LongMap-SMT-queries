; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101766 () Bool)

(assert start!101766)

(declare-fun b_free!26461 () Bool)

(declare-fun b_next!26461 () Bool)

(assert (=> start!101766 (= b_free!26461 (not b_next!26461))))

(declare-fun tp!92429 () Bool)

(declare-fun b_and!44165 () Bool)

(assert (=> start!101766 (= tp!92429 b_and!44165)))

(declare-fun b!1225592 () Bool)

(declare-fun res!814494 () Bool)

(declare-fun e!696077 () Bool)

(assert (=> b!1225592 (=> (not res!814494) (not e!696077))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1225592 (= res!814494 (validMask!0 mask!1564))))

(declare-fun b!1225593 () Bool)

(declare-fun res!814496 () Bool)

(assert (=> b!1225593 (=> (not res!814496) (not e!696077))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!79030 0))(
  ( (array!79031 (arr!38142 (Array (_ BitVec 32) (_ BitVec 64))) (size!38680 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!79030)

(assert (=> b!1225593 (= res!814496 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38680 _keys!1208))))))

(declare-fun b!1225594 () Bool)

(declare-fun e!696075 () Bool)

(declare-fun tp_is_empty!31165 () Bool)

(assert (=> b!1225594 (= e!696075 tp_is_empty!31165)))

(declare-fun b!1225595 () Bool)

(declare-fun e!696079 () Bool)

(declare-fun mapRes!48646 () Bool)

(assert (=> b!1225595 (= e!696079 (and e!696075 mapRes!48646))))

(declare-fun condMapEmpty!48646 () Bool)

(declare-datatypes ((V!46681 0))(
  ( (V!46682 (val!15639 Int)) )
))
(declare-datatypes ((ValueCell!14873 0))(
  ( (ValueCellFull!14873 (v!18300 V!46681)) (EmptyCell!14873) )
))
(declare-datatypes ((array!79032 0))(
  ( (array!79033 (arr!38143 (Array (_ BitVec 32) ValueCell!14873)) (size!38681 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!79032)

(declare-fun mapDefault!48646 () ValueCell!14873)

(assert (=> b!1225595 (= condMapEmpty!48646 (= (arr!38143 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14873)) mapDefault!48646)))))

(declare-fun b!1225596 () Bool)

(declare-fun res!814498 () Bool)

(assert (=> b!1225596 (=> (not res!814498) (not e!696077))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!79030 (_ BitVec 32)) Bool)

(assert (=> b!1225596 (= res!814498 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapNonEmpty!48646 () Bool)

(declare-fun tp!92428 () Bool)

(declare-fun e!696081 () Bool)

(assert (=> mapNonEmpty!48646 (= mapRes!48646 (and tp!92428 e!696081))))

(declare-fun mapRest!48646 () (Array (_ BitVec 32) ValueCell!14873))

(declare-fun mapValue!48646 () ValueCell!14873)

(declare-fun mapKey!48646 () (_ BitVec 32))

(assert (=> mapNonEmpty!48646 (= (arr!38143 _values!996) (store mapRest!48646 mapKey!48646 mapValue!48646))))

(declare-fun b!1225597 () Bool)

(declare-fun res!814501 () Bool)

(assert (=> b!1225597 (=> (not res!814501) (not e!696077))))

(declare-datatypes ((List!27024 0))(
  ( (Nil!27021) (Cons!27020 (h!28229 (_ BitVec 64)) (t!40456 List!27024)) )
))
(declare-fun arrayNoDuplicates!0 (array!79030 (_ BitVec 32) List!27024) Bool)

(assert (=> b!1225597 (= res!814501 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!27021))))

(declare-fun b!1225598 () Bool)

(declare-fun res!814495 () Bool)

(declare-fun e!696076 () Bool)

(assert (=> b!1225598 (=> (not res!814495) (not e!696076))))

(declare-fun lt!558366 () array!79030)

(assert (=> b!1225598 (= res!814495 (arrayNoDuplicates!0 lt!558366 #b00000000000000000000000000000000 Nil!27021))))

(declare-fun b!1225599 () Bool)

(declare-fun res!814499 () Bool)

(assert (=> b!1225599 (=> (not res!814499) (not e!696077))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1225599 (= res!814499 (validKeyInArray!0 k0!934))))

(declare-fun b!1225600 () Bool)

(declare-fun e!696082 () Bool)

(assert (=> b!1225600 (= e!696082 (bvslt i!673 (size!38681 _values!996)))))

(declare-fun b!1225601 () Bool)

(declare-fun e!696078 () Bool)

(declare-fun e!696074 () Bool)

(assert (=> b!1225601 (= e!696078 e!696074)))

(declare-fun res!814500 () Bool)

(assert (=> b!1225601 (=> res!814500 e!696074)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1225601 (= res!814500 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!46681)

(declare-datatypes ((tuple2!20244 0))(
  ( (tuple2!20245 (_1!10133 (_ BitVec 64)) (_2!10133 V!46681)) )
))
(declare-datatypes ((List!27025 0))(
  ( (Nil!27022) (Cons!27021 (h!28230 tuple2!20244) (t!40457 List!27025)) )
))
(declare-datatypes ((ListLongMap!18213 0))(
  ( (ListLongMap!18214 (toList!9122 List!27025)) )
))
(declare-fun lt!558367 () ListLongMap!18213)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!558364 () array!79032)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!46681)

(declare-fun getCurrentListMapNoExtraKeys!5551 (array!79030 array!79032 (_ BitVec 32) (_ BitVec 32) V!46681 V!46681 (_ BitVec 32) Int) ListLongMap!18213)

(assert (=> b!1225601 (= lt!558367 (getCurrentListMapNoExtraKeys!5551 lt!558366 lt!558364 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3396 (Int (_ BitVec 64)) V!46681)

(assert (=> b!1225601 (= lt!558364 (array!79033 (store (arr!38143 _values!996) i!673 (ValueCellFull!14873 (dynLambda!3396 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38681 _values!996)))))

(declare-fun lt!558365 () ListLongMap!18213)

(assert (=> b!1225601 (= lt!558365 (getCurrentListMapNoExtraKeys!5551 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1225591 () Bool)

(declare-fun res!814503 () Bool)

(assert (=> b!1225591 (=> (not res!814503) (not e!696077))))

(assert (=> b!1225591 (= res!814503 (and (= (size!38681 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38680 _keys!1208) (size!38681 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun res!814502 () Bool)

(assert (=> start!101766 (=> (not res!814502) (not e!696077))))

(assert (=> start!101766 (= res!814502 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38680 _keys!1208))))))

(assert (=> start!101766 e!696077))

(assert (=> start!101766 tp_is_empty!31165))

(declare-fun array_inv!29134 (array!79030) Bool)

(assert (=> start!101766 (array_inv!29134 _keys!1208)))

(assert (=> start!101766 true))

(assert (=> start!101766 tp!92429))

(declare-fun array_inv!29135 (array!79032) Bool)

(assert (=> start!101766 (and (array_inv!29135 _values!996) e!696079)))

(declare-fun b!1225602 () Bool)

(assert (=> b!1225602 (= e!696077 e!696076)))

(declare-fun res!814491 () Bool)

(assert (=> b!1225602 (=> (not res!814491) (not e!696076))))

(assert (=> b!1225602 (= res!814491 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!558366 mask!1564))))

(assert (=> b!1225602 (= lt!558366 (array!79031 (store (arr!38142 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38680 _keys!1208)))))

(declare-fun b!1225603 () Bool)

(assert (=> b!1225603 (= e!696081 tp_is_empty!31165)))

(declare-fun mapIsEmpty!48646 () Bool)

(assert (=> mapIsEmpty!48646 mapRes!48646))

(declare-fun b!1225604 () Bool)

(declare-fun res!814497 () Bool)

(assert (=> b!1225604 (=> (not res!814497) (not e!696077))))

(assert (=> b!1225604 (= res!814497 (= (select (arr!38142 _keys!1208) i!673) k0!934))))

(declare-fun b!1225605 () Bool)

(assert (=> b!1225605 (= e!696074 e!696082)))

(declare-fun res!814492 () Bool)

(assert (=> b!1225605 (=> res!814492 e!696082)))

(assert (=> b!1225605 (= res!814492 (validKeyInArray!0 (select (arr!38142 _keys!1208) from!1455)))))

(declare-fun -!1938 (ListLongMap!18213 (_ BitVec 64)) ListLongMap!18213)

(assert (=> b!1225605 (= (getCurrentListMapNoExtraKeys!5551 lt!558366 lt!558364 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1938 (getCurrentListMapNoExtraKeys!5551 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-datatypes ((Unit!40475 0))(
  ( (Unit!40476) )
))
(declare-fun lt!558362 () Unit!40475)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1169 (array!79030 array!79032 (_ BitVec 32) (_ BitVec 32) V!46681 V!46681 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40475)

(assert (=> b!1225605 (= lt!558362 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1169 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1225606 () Bool)

(assert (=> b!1225606 (= e!696076 (not e!696078))))

(declare-fun res!814493 () Bool)

(assert (=> b!1225606 (=> res!814493 e!696078)))

(assert (=> b!1225606 (= res!814493 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!79030 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1225606 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!558363 () Unit!40475)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!79030 (_ BitVec 64) (_ BitVec 32)) Unit!40475)

(assert (=> b!1225606 (= lt!558363 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(assert (= (and start!101766 res!814502) b!1225592))

(assert (= (and b!1225592 res!814494) b!1225591))

(assert (= (and b!1225591 res!814503) b!1225596))

(assert (= (and b!1225596 res!814498) b!1225597))

(assert (= (and b!1225597 res!814501) b!1225593))

(assert (= (and b!1225593 res!814496) b!1225599))

(assert (= (and b!1225599 res!814499) b!1225604))

(assert (= (and b!1225604 res!814497) b!1225602))

(assert (= (and b!1225602 res!814491) b!1225598))

(assert (= (and b!1225598 res!814495) b!1225606))

(assert (= (and b!1225606 (not res!814493)) b!1225601))

(assert (= (and b!1225601 (not res!814500)) b!1225605))

(assert (= (and b!1225605 (not res!814492)) b!1225600))

(assert (= (and b!1225595 condMapEmpty!48646) mapIsEmpty!48646))

(assert (= (and b!1225595 (not condMapEmpty!48646)) mapNonEmpty!48646))

(get-info :version)

(assert (= (and mapNonEmpty!48646 ((_ is ValueCellFull!14873) mapValue!48646)) b!1225603))

(assert (= (and b!1225595 ((_ is ValueCellFull!14873) mapDefault!48646)) b!1225594))

(assert (= start!101766 b!1225595))

(declare-fun b_lambda!22431 () Bool)

(assert (=> (not b_lambda!22431) (not b!1225601)))

(declare-fun t!40455 () Bool)

(declare-fun tb!11253 () Bool)

(assert (=> (and start!101766 (= defaultEntry!1004 defaultEntry!1004) t!40455) tb!11253))

(declare-fun result!23127 () Bool)

(assert (=> tb!11253 (= result!23127 tp_is_empty!31165)))

(assert (=> b!1225601 t!40455))

(declare-fun b_and!44167 () Bool)

(assert (= b_and!44165 (and (=> t!40455 result!23127) b_and!44167)))

(declare-fun m!1130255 () Bool)

(assert (=> b!1225601 m!1130255))

(declare-fun m!1130257 () Bool)

(assert (=> b!1225601 m!1130257))

(declare-fun m!1130259 () Bool)

(assert (=> b!1225601 m!1130259))

(declare-fun m!1130261 () Bool)

(assert (=> b!1225601 m!1130261))

(declare-fun m!1130263 () Bool)

(assert (=> b!1225596 m!1130263))

(declare-fun m!1130265 () Bool)

(assert (=> b!1225602 m!1130265))

(declare-fun m!1130267 () Bool)

(assert (=> b!1225602 m!1130267))

(declare-fun m!1130269 () Bool)

(assert (=> b!1225592 m!1130269))

(declare-fun m!1130271 () Bool)

(assert (=> b!1225598 m!1130271))

(declare-fun m!1130273 () Bool)

(assert (=> mapNonEmpty!48646 m!1130273))

(declare-fun m!1130275 () Bool)

(assert (=> b!1225604 m!1130275))

(declare-fun m!1130277 () Bool)

(assert (=> b!1225605 m!1130277))

(declare-fun m!1130279 () Bool)

(assert (=> b!1225605 m!1130279))

(declare-fun m!1130281 () Bool)

(assert (=> b!1225605 m!1130281))

(declare-fun m!1130283 () Bool)

(assert (=> b!1225605 m!1130283))

(assert (=> b!1225605 m!1130281))

(assert (=> b!1225605 m!1130277))

(declare-fun m!1130285 () Bool)

(assert (=> b!1225605 m!1130285))

(declare-fun m!1130287 () Bool)

(assert (=> b!1225605 m!1130287))

(declare-fun m!1130289 () Bool)

(assert (=> b!1225597 m!1130289))

(declare-fun m!1130291 () Bool)

(assert (=> b!1225599 m!1130291))

(declare-fun m!1130293 () Bool)

(assert (=> b!1225606 m!1130293))

(declare-fun m!1130295 () Bool)

(assert (=> b!1225606 m!1130295))

(declare-fun m!1130297 () Bool)

(assert (=> start!101766 m!1130297))

(declare-fun m!1130299 () Bool)

(assert (=> start!101766 m!1130299))

(check-sat tp_is_empty!31165 (not b!1225596) (not b!1225598) (not b_lambda!22431) (not b!1225597) (not b!1225599) (not b!1225606) (not mapNonEmpty!48646) (not start!101766) (not b_next!26461) (not b!1225601) (not b!1225605) (not b!1225592) b_and!44167 (not b!1225602))
(check-sat b_and!44167 (not b_next!26461))
