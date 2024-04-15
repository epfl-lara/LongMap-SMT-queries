; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99038 () Bool)

(assert start!99038)

(declare-fun b_free!24649 () Bool)

(declare-fun b_next!24649 () Bool)

(assert (=> start!99038 (= b_free!24649 (not b_next!24649))))

(declare-fun tp!86657 () Bool)

(declare-fun b_and!40125 () Bool)

(assert (=> start!99038 (= tp!86657 b_and!40125)))

(declare-fun b!1164278 () Bool)

(declare-fun e!661969 () Bool)

(declare-fun e!661968 () Bool)

(declare-fun mapRes!45593 () Bool)

(assert (=> b!1164278 (= e!661969 (and e!661968 mapRes!45593))))

(declare-fun condMapEmpty!45593 () Bool)

(declare-datatypes ((V!44033 0))(
  ( (V!44034 (val!14646 Int)) )
))
(declare-datatypes ((ValueCell!13880 0))(
  ( (ValueCellFull!13880 (v!17282 V!44033)) (EmptyCell!13880) )
))
(declare-datatypes ((array!75114 0))(
  ( (array!75115 (arr!36208 (Array (_ BitVec 32) ValueCell!13880)) (size!36746 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75114)

(declare-fun mapDefault!45593 () ValueCell!13880)

(assert (=> b!1164278 (= condMapEmpty!45593 (= (arr!36208 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13880)) mapDefault!45593)))))

(declare-fun b!1164279 () Bool)

(declare-fun res!772097 () Bool)

(declare-fun e!661966 () Bool)

(assert (=> b!1164279 (=> (not res!772097) (not e!661966))))

(declare-datatypes ((array!75116 0))(
  ( (array!75117 (arr!36209 (Array (_ BitVec 32) (_ BitVec 64))) (size!36747 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75116)

(declare-datatypes ((List!25478 0))(
  ( (Nil!25475) (Cons!25474 (h!26683 (_ BitVec 64)) (t!37110 List!25478)) )
))
(declare-fun arrayNoDuplicates!0 (array!75116 (_ BitVec 32) List!25478) Bool)

(assert (=> b!1164279 (= res!772097 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25475))))

(declare-fun b!1164280 () Bool)

(declare-fun res!772088 () Bool)

(assert (=> b!1164280 (=> (not res!772088) (not e!661966))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(assert (=> b!1164280 (= res!772088 (and (= (size!36746 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36747 _keys!1208) (size!36746 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1164281 () Bool)

(declare-fun res!772093 () Bool)

(assert (=> b!1164281 (=> (not res!772093) (not e!661966))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1164281 (= res!772093 (= (select (arr!36209 _keys!1208) i!673) k0!934))))

(declare-fun b!1164282 () Bool)

(declare-fun e!661967 () Bool)

(declare-fun tp_is_empty!29179 () Bool)

(assert (=> b!1164282 (= e!661967 tp_is_empty!29179)))

(declare-fun b!1164283 () Bool)

(declare-fun e!661971 () Bool)

(assert (=> b!1164283 (= e!661971 true)))

(declare-fun zeroValue!944 () V!44033)

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun lt!524436 () array!75116)

(declare-datatypes ((tuple2!18760 0))(
  ( (tuple2!18761 (_1!9391 (_ BitVec 64)) (_2!9391 V!44033)) )
))
(declare-datatypes ((List!25479 0))(
  ( (Nil!25476) (Cons!25475 (h!26684 tuple2!18760) (t!37111 List!25479)) )
))
(declare-datatypes ((ListLongMap!16729 0))(
  ( (ListLongMap!16730 (toList!8380 List!25479)) )
))
(declare-fun lt!524439 () ListLongMap!16729)

(declare-fun minValue!944 () V!44033)

(declare-fun getCurrentListMapNoExtraKeys!4856 (array!75116 array!75114 (_ BitVec 32) (_ BitVec 32) V!44033 V!44033 (_ BitVec 32) Int) ListLongMap!16729)

(declare-fun dynLambda!2789 (Int (_ BitVec 64)) V!44033)

(assert (=> b!1164283 (= lt!524439 (getCurrentListMapNoExtraKeys!4856 lt!524436 (array!75115 (store (arr!36208 _values!996) i!673 (ValueCellFull!13880 (dynLambda!2789 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36746 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!524438 () ListLongMap!16729)

(assert (=> b!1164283 (= lt!524438 (getCurrentListMapNoExtraKeys!4856 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1164284 () Bool)

(assert (=> b!1164284 (= e!661968 tp_is_empty!29179)))

(declare-fun b!1164285 () Bool)

(declare-fun res!772091 () Bool)

(assert (=> b!1164285 (=> (not res!772091) (not e!661966))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1164285 (= res!772091 (validMask!0 mask!1564))))

(declare-fun b!1164286 () Bool)

(declare-fun res!772090 () Bool)

(assert (=> b!1164286 (=> (not res!772090) (not e!661966))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1164286 (= res!772090 (validKeyInArray!0 k0!934))))

(declare-fun res!772095 () Bool)

(assert (=> start!99038 (=> (not res!772095) (not e!661966))))

(assert (=> start!99038 (= res!772095 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36747 _keys!1208))))))

(assert (=> start!99038 e!661966))

(assert (=> start!99038 tp_is_empty!29179))

(declare-fun array_inv!27804 (array!75116) Bool)

(assert (=> start!99038 (array_inv!27804 _keys!1208)))

(assert (=> start!99038 true))

(assert (=> start!99038 tp!86657))

(declare-fun array_inv!27805 (array!75114) Bool)

(assert (=> start!99038 (and (array_inv!27805 _values!996) e!661969)))

(declare-fun mapNonEmpty!45593 () Bool)

(declare-fun tp!86658 () Bool)

(assert (=> mapNonEmpty!45593 (= mapRes!45593 (and tp!86658 e!661967))))

(declare-fun mapValue!45593 () ValueCell!13880)

(declare-fun mapRest!45593 () (Array (_ BitVec 32) ValueCell!13880))

(declare-fun mapKey!45593 () (_ BitVec 32))

(assert (=> mapNonEmpty!45593 (= (arr!36208 _values!996) (store mapRest!45593 mapKey!45593 mapValue!45593))))

(declare-fun b!1164287 () Bool)

(declare-fun res!772092 () Bool)

(assert (=> b!1164287 (=> (not res!772092) (not e!661966))))

(assert (=> b!1164287 (= res!772092 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36747 _keys!1208))))))

(declare-fun b!1164288 () Bool)

(declare-fun res!772096 () Bool)

(declare-fun e!661965 () Bool)

(assert (=> b!1164288 (=> (not res!772096) (not e!661965))))

(assert (=> b!1164288 (= res!772096 (arrayNoDuplicates!0 lt!524436 #b00000000000000000000000000000000 Nil!25475))))

(declare-fun b!1164289 () Bool)

(assert (=> b!1164289 (= e!661965 (not e!661971))))

(declare-fun res!772089 () Bool)

(assert (=> b!1164289 (=> res!772089 e!661971)))

(assert (=> b!1164289 (= res!772089 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!75116 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1164289 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!38261 0))(
  ( (Unit!38262) )
))
(declare-fun lt!524437 () Unit!38261)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75116 (_ BitVec 64) (_ BitVec 32)) Unit!38261)

(assert (=> b!1164289 (= lt!524437 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun mapIsEmpty!45593 () Bool)

(assert (=> mapIsEmpty!45593 mapRes!45593))

(declare-fun b!1164290 () Bool)

(declare-fun res!772087 () Bool)

(assert (=> b!1164290 (=> (not res!772087) (not e!661966))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75116 (_ BitVec 32)) Bool)

(assert (=> b!1164290 (= res!772087 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1164291 () Bool)

(assert (=> b!1164291 (= e!661966 e!661965)))

(declare-fun res!772094 () Bool)

(assert (=> b!1164291 (=> (not res!772094) (not e!661965))))

(assert (=> b!1164291 (= res!772094 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!524436 mask!1564))))

(assert (=> b!1164291 (= lt!524436 (array!75117 (store (arr!36209 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36747 _keys!1208)))))

(assert (= (and start!99038 res!772095) b!1164285))

(assert (= (and b!1164285 res!772091) b!1164280))

(assert (= (and b!1164280 res!772088) b!1164290))

(assert (= (and b!1164290 res!772087) b!1164279))

(assert (= (and b!1164279 res!772097) b!1164287))

(assert (= (and b!1164287 res!772092) b!1164286))

(assert (= (and b!1164286 res!772090) b!1164281))

(assert (= (and b!1164281 res!772093) b!1164291))

(assert (= (and b!1164291 res!772094) b!1164288))

(assert (= (and b!1164288 res!772096) b!1164289))

(assert (= (and b!1164289 (not res!772089)) b!1164283))

(assert (= (and b!1164278 condMapEmpty!45593) mapIsEmpty!45593))

(assert (= (and b!1164278 (not condMapEmpty!45593)) mapNonEmpty!45593))

(get-info :version)

(assert (= (and mapNonEmpty!45593 ((_ is ValueCellFull!13880) mapValue!45593)) b!1164282))

(assert (= (and b!1164278 ((_ is ValueCellFull!13880) mapDefault!45593)) b!1164284))

(assert (= start!99038 b!1164278))

(declare-fun b_lambda!19737 () Bool)

(assert (=> (not b_lambda!19737) (not b!1164283)))

(declare-fun t!37109 () Bool)

(declare-fun tb!9453 () Bool)

(assert (=> (and start!99038 (= defaultEntry!1004 defaultEntry!1004) t!37109) tb!9453))

(declare-fun result!19479 () Bool)

(assert (=> tb!9453 (= result!19479 tp_is_empty!29179)))

(assert (=> b!1164283 t!37109))

(declare-fun b_and!40127 () Bool)

(assert (= b_and!40125 (and (=> t!37109 result!19479) b_and!40127)))

(declare-fun m!1072225 () Bool)

(assert (=> start!99038 m!1072225))

(declare-fun m!1072227 () Bool)

(assert (=> start!99038 m!1072227))

(declare-fun m!1072229 () Bool)

(assert (=> b!1164288 m!1072229))

(declare-fun m!1072231 () Bool)

(assert (=> b!1164285 m!1072231))

(declare-fun m!1072233 () Bool)

(assert (=> mapNonEmpty!45593 m!1072233))

(declare-fun m!1072235 () Bool)

(assert (=> b!1164283 m!1072235))

(declare-fun m!1072237 () Bool)

(assert (=> b!1164283 m!1072237))

(declare-fun m!1072239 () Bool)

(assert (=> b!1164283 m!1072239))

(declare-fun m!1072241 () Bool)

(assert (=> b!1164283 m!1072241))

(declare-fun m!1072243 () Bool)

(assert (=> b!1164289 m!1072243))

(declare-fun m!1072245 () Bool)

(assert (=> b!1164289 m!1072245))

(declare-fun m!1072247 () Bool)

(assert (=> b!1164291 m!1072247))

(declare-fun m!1072249 () Bool)

(assert (=> b!1164291 m!1072249))

(declare-fun m!1072251 () Bool)

(assert (=> b!1164279 m!1072251))

(declare-fun m!1072253 () Bool)

(assert (=> b!1164286 m!1072253))

(declare-fun m!1072255 () Bool)

(assert (=> b!1164290 m!1072255))

(declare-fun m!1072257 () Bool)

(assert (=> b!1164281 m!1072257))

(check-sat tp_is_empty!29179 b_and!40127 (not b!1164279) (not b_lambda!19737) (not b!1164283) (not b!1164285) (not b!1164290) (not b_next!24649) (not b!1164289) (not b!1164288) (not mapNonEmpty!45593) (not b!1164286) (not b!1164291) (not start!99038))
(check-sat b_and!40127 (not b_next!24649))
