; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99082 () Bool)

(assert start!99082)

(declare-fun b_free!24687 () Bool)

(declare-fun b_next!24687 () Bool)

(assert (=> start!99082 (= b_free!24687 (not b_next!24687))))

(declare-fun tp!86772 () Bool)

(declare-fun b_and!40223 () Bool)

(assert (=> start!99082 (= tp!86772 b_and!40223)))

(declare-fun mapNonEmpty!45650 () Bool)

(declare-fun mapRes!45650 () Bool)

(declare-fun tp!86771 () Bool)

(declare-fun e!662442 () Bool)

(assert (=> mapNonEmpty!45650 (= mapRes!45650 (and tp!86771 e!662442))))

(declare-datatypes ((V!44083 0))(
  ( (V!44084 (val!14665 Int)) )
))
(declare-datatypes ((ValueCell!13899 0))(
  ( (ValueCellFull!13899 (v!17302 V!44083)) (EmptyCell!13899) )
))
(declare-fun mapValue!45650 () ValueCell!13899)

(declare-fun mapRest!45650 () (Array (_ BitVec 32) ValueCell!13899))

(declare-fun mapKey!45650 () (_ BitVec 32))

(declare-datatypes ((array!75265 0))(
  ( (array!75266 (arr!36283 (Array (_ BitVec 32) ValueCell!13899)) (size!36819 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75265)

(assert (=> mapNonEmpty!45650 (= (arr!36283 _values!996) (store mapRest!45650 mapKey!45650 mapValue!45650))))

(declare-fun b!1165238 () Bool)

(declare-fun res!772785 () Bool)

(declare-fun e!662446 () Bool)

(assert (=> b!1165238 (=> (not res!772785) (not e!662446))))

(declare-datatypes ((array!75267 0))(
  ( (array!75268 (arr!36284 (Array (_ BitVec 32) (_ BitVec 64))) (size!36820 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75267)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(assert (=> b!1165238 (= res!772785 (and (= (size!36819 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36820 _keys!1208) (size!36819 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1165239 () Bool)

(declare-fun e!662448 () Bool)

(declare-fun e!662447 () Bool)

(assert (=> b!1165239 (= e!662448 (not e!662447))))

(declare-fun res!772782 () Bool)

(assert (=> b!1165239 (=> res!772782 e!662447)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1165239 (= res!772782 (bvsgt from!1455 i!673))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!75267 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1165239 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!38452 0))(
  ( (Unit!38453) )
))
(declare-fun lt!524859 () Unit!38452)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75267 (_ BitVec 64) (_ BitVec 32)) Unit!38452)

(assert (=> b!1165239 (= lt!524859 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1165240 () Bool)

(declare-fun res!772787 () Bool)

(assert (=> b!1165240 (=> (not res!772787) (not e!662448))))

(declare-fun lt!524856 () array!75267)

(declare-datatypes ((List!25437 0))(
  ( (Nil!25434) (Cons!25433 (h!26642 (_ BitVec 64)) (t!37116 List!25437)) )
))
(declare-fun arrayNoDuplicates!0 (array!75267 (_ BitVec 32) List!25437) Bool)

(assert (=> b!1165240 (= res!772787 (arrayNoDuplicates!0 lt!524856 #b00000000000000000000000000000000 Nil!25434))))

(declare-fun b!1165241 () Bool)

(declare-fun tp_is_empty!29217 () Bool)

(assert (=> b!1165241 (= e!662442 tp_is_empty!29217)))

(declare-fun mapIsEmpty!45650 () Bool)

(assert (=> mapIsEmpty!45650 mapRes!45650))

(declare-fun res!772788 () Bool)

(assert (=> start!99082 (=> (not res!772788) (not e!662446))))

(assert (=> start!99082 (= res!772788 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36820 _keys!1208))))))

(assert (=> start!99082 e!662446))

(assert (=> start!99082 tp_is_empty!29217))

(declare-fun array_inv!27754 (array!75267) Bool)

(assert (=> start!99082 (array_inv!27754 _keys!1208)))

(assert (=> start!99082 true))

(assert (=> start!99082 tp!86772))

(declare-fun e!662444 () Bool)

(declare-fun array_inv!27755 (array!75265) Bool)

(assert (=> start!99082 (and (array_inv!27755 _values!996) e!662444)))

(declare-fun b!1165242 () Bool)

(declare-fun e!662445 () Bool)

(assert (=> b!1165242 (= e!662445 tp_is_empty!29217)))

(declare-fun b!1165243 () Bool)

(declare-fun res!772784 () Bool)

(assert (=> b!1165243 (=> (not res!772784) (not e!662446))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1165243 (= res!772784 (validMask!0 mask!1564))))

(declare-fun b!1165244 () Bool)

(declare-fun res!772790 () Bool)

(assert (=> b!1165244 (=> (not res!772790) (not e!662446))))

(assert (=> b!1165244 (= res!772790 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25434))))

(declare-fun b!1165245 () Bool)

(declare-fun res!772789 () Bool)

(assert (=> b!1165245 (=> (not res!772789) (not e!662446))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1165245 (= res!772789 (validKeyInArray!0 k0!934))))

(declare-fun b!1165246 () Bool)

(declare-fun res!772781 () Bool)

(assert (=> b!1165246 (=> (not res!772781) (not e!662446))))

(assert (=> b!1165246 (= res!772781 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36820 _keys!1208))))))

(declare-fun b!1165247 () Bool)

(assert (=> b!1165247 (= e!662446 e!662448)))

(declare-fun res!772783 () Bool)

(assert (=> b!1165247 (=> (not res!772783) (not e!662448))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75267 (_ BitVec 32)) Bool)

(assert (=> b!1165247 (= res!772783 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!524856 mask!1564))))

(assert (=> b!1165247 (= lt!524856 (array!75268 (store (arr!36284 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36820 _keys!1208)))))

(declare-fun b!1165248 () Bool)

(assert (=> b!1165248 (= e!662447 true)))

(declare-fun defaultEntry!1004 () Int)

(declare-fun zeroValue!944 () V!44083)

(declare-datatypes ((tuple2!18702 0))(
  ( (tuple2!18703 (_1!9362 (_ BitVec 64)) (_2!9362 V!44083)) )
))
(declare-datatypes ((List!25438 0))(
  ( (Nil!25435) (Cons!25434 (h!26643 tuple2!18702) (t!37117 List!25438)) )
))
(declare-datatypes ((ListLongMap!16671 0))(
  ( (ListLongMap!16672 (toList!8351 List!25438)) )
))
(declare-fun lt!524858 () ListLongMap!16671)

(declare-fun minValue!944 () V!44083)

(declare-fun getCurrentListMapNoExtraKeys!4815 (array!75267 array!75265 (_ BitVec 32) (_ BitVec 32) V!44083 V!44083 (_ BitVec 32) Int) ListLongMap!16671)

(declare-fun dynLambda!2805 (Int (_ BitVec 64)) V!44083)

(assert (=> b!1165248 (= lt!524858 (getCurrentListMapNoExtraKeys!4815 lt!524856 (array!75266 (store (arr!36283 _values!996) i!673 (ValueCellFull!13899 (dynLambda!2805 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36819 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!524857 () ListLongMap!16671)

(assert (=> b!1165248 (= lt!524857 (getCurrentListMapNoExtraKeys!4815 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1165249 () Bool)

(declare-fun res!772786 () Bool)

(assert (=> b!1165249 (=> (not res!772786) (not e!662446))))

(assert (=> b!1165249 (= res!772786 (= (select (arr!36284 _keys!1208) i!673) k0!934))))

(declare-fun b!1165250 () Bool)

(assert (=> b!1165250 (= e!662444 (and e!662445 mapRes!45650))))

(declare-fun condMapEmpty!45650 () Bool)

(declare-fun mapDefault!45650 () ValueCell!13899)

(assert (=> b!1165250 (= condMapEmpty!45650 (= (arr!36283 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13899)) mapDefault!45650)))))

(declare-fun b!1165251 () Bool)

(declare-fun res!772780 () Bool)

(assert (=> b!1165251 (=> (not res!772780) (not e!662446))))

(assert (=> b!1165251 (= res!772780 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(assert (= (and start!99082 res!772788) b!1165243))

(assert (= (and b!1165243 res!772784) b!1165238))

(assert (= (and b!1165238 res!772785) b!1165251))

(assert (= (and b!1165251 res!772780) b!1165244))

(assert (= (and b!1165244 res!772790) b!1165246))

(assert (= (and b!1165246 res!772781) b!1165245))

(assert (= (and b!1165245 res!772789) b!1165249))

(assert (= (and b!1165249 res!772786) b!1165247))

(assert (= (and b!1165247 res!772783) b!1165240))

(assert (= (and b!1165240 res!772787) b!1165239))

(assert (= (and b!1165239 (not res!772782)) b!1165248))

(assert (= (and b!1165250 condMapEmpty!45650) mapIsEmpty!45650))

(assert (= (and b!1165250 (not condMapEmpty!45650)) mapNonEmpty!45650))

(get-info :version)

(assert (= (and mapNonEmpty!45650 ((_ is ValueCellFull!13899) mapValue!45650)) b!1165241))

(assert (= (and b!1165250 ((_ is ValueCellFull!13899) mapDefault!45650)) b!1165242))

(assert (= start!99082 b!1165250))

(declare-fun b_lambda!19793 () Bool)

(assert (=> (not b_lambda!19793) (not b!1165248)))

(declare-fun t!37115 () Bool)

(declare-fun tb!9499 () Bool)

(assert (=> (and start!99082 (= defaultEntry!1004 defaultEntry!1004) t!37115) tb!9499))

(declare-fun result!19563 () Bool)

(assert (=> tb!9499 (= result!19563 tp_is_empty!29217)))

(assert (=> b!1165248 t!37115))

(declare-fun b_and!40225 () Bool)

(assert (= b_and!40223 (and (=> t!37115 result!19563) b_and!40225)))

(declare-fun m!1073481 () Bool)

(assert (=> b!1165240 m!1073481))

(declare-fun m!1073483 () Bool)

(assert (=> b!1165247 m!1073483))

(declare-fun m!1073485 () Bool)

(assert (=> b!1165247 m!1073485))

(declare-fun m!1073487 () Bool)

(assert (=> mapNonEmpty!45650 m!1073487))

(declare-fun m!1073489 () Bool)

(assert (=> b!1165248 m!1073489))

(declare-fun m!1073491 () Bool)

(assert (=> b!1165248 m!1073491))

(declare-fun m!1073493 () Bool)

(assert (=> b!1165248 m!1073493))

(declare-fun m!1073495 () Bool)

(assert (=> b!1165248 m!1073495))

(declare-fun m!1073497 () Bool)

(assert (=> b!1165245 m!1073497))

(declare-fun m!1073499 () Bool)

(assert (=> b!1165243 m!1073499))

(declare-fun m!1073501 () Bool)

(assert (=> b!1165251 m!1073501))

(declare-fun m!1073503 () Bool)

(assert (=> b!1165239 m!1073503))

(declare-fun m!1073505 () Bool)

(assert (=> b!1165239 m!1073505))

(declare-fun m!1073507 () Bool)

(assert (=> b!1165244 m!1073507))

(declare-fun m!1073509 () Bool)

(assert (=> start!99082 m!1073509))

(declare-fun m!1073511 () Bool)

(assert (=> start!99082 m!1073511))

(declare-fun m!1073513 () Bool)

(assert (=> b!1165249 m!1073513))

(check-sat (not b!1165247) (not mapNonEmpty!45650) (not b!1165240) b_and!40225 (not b!1165239) (not start!99082) tp_is_empty!29217 (not b!1165248) (not b_lambda!19793) (not b!1165245) (not b!1165243) (not b_next!24687) (not b!1165244) (not b!1165251))
(check-sat b_and!40225 (not b_next!24687))
