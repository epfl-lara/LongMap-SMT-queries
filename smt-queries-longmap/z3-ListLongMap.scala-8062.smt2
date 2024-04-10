; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99214 () Bool)

(assert start!99214)

(declare-fun b_free!24819 () Bool)

(declare-fun b_next!24819 () Bool)

(assert (=> start!99214 (= b_free!24819 (not b_next!24819))))

(declare-fun tp!87168 () Bool)

(declare-fun b_and!40487 () Bool)

(assert (=> start!99214 (= tp!87168 b_and!40487)))

(declare-fun b!1168305 () Bool)

(declare-fun res!775130 () Bool)

(declare-fun e!663999 () Bool)

(assert (=> b!1168305 (=> (not res!775130) (not e!663999))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!75519 0))(
  ( (array!75520 (arr!36410 (Array (_ BitVec 32) (_ BitVec 64))) (size!36946 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75519)

(assert (=> b!1168305 (= res!775130 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36946 _keys!1208))))))

(declare-fun b!1168306 () Bool)

(declare-fun e!663992 () Bool)

(assert (=> b!1168306 (= e!663999 e!663992)))

(declare-fun res!775121 () Bool)

(assert (=> b!1168306 (=> (not res!775121) (not e!663992))))

(declare-fun lt!525965 () array!75519)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75519 (_ BitVec 32)) Bool)

(assert (=> b!1168306 (= res!775121 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!525965 mask!1564))))

(assert (=> b!1168306 (= lt!525965 (array!75520 (store (arr!36410 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36946 _keys!1208)))))

(declare-fun mapIsEmpty!45848 () Bool)

(declare-fun mapRes!45848 () Bool)

(assert (=> mapIsEmpty!45848 mapRes!45848))

(declare-fun b!1168307 () Bool)

(declare-fun e!663993 () Bool)

(declare-fun e!663997 () Bool)

(assert (=> b!1168307 (= e!663993 (and e!663997 mapRes!45848))))

(declare-fun condMapEmpty!45848 () Bool)

(declare-datatypes ((V!44259 0))(
  ( (V!44260 (val!14731 Int)) )
))
(declare-datatypes ((ValueCell!13965 0))(
  ( (ValueCellFull!13965 (v!17368 V!44259)) (EmptyCell!13965) )
))
(declare-datatypes ((array!75521 0))(
  ( (array!75522 (arr!36411 (Array (_ BitVec 32) ValueCell!13965)) (size!36947 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75521)

(declare-fun mapDefault!45848 () ValueCell!13965)

(assert (=> b!1168307 (= condMapEmpty!45848 (= (arr!36411 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13965)) mapDefault!45848)))))

(declare-fun b!1168308 () Bool)

(declare-fun res!775125 () Bool)

(assert (=> b!1168308 (=> (not res!775125) (not e!663999))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1168308 (= res!775125 (validKeyInArray!0 k0!934))))

(declare-fun b!1168309 () Bool)

(declare-fun res!775123 () Bool)

(assert (=> b!1168309 (=> (not res!775123) (not e!663999))))

(assert (=> b!1168309 (= res!775123 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1168310 () Bool)

(declare-fun e!663995 () Bool)

(assert (=> b!1168310 (= e!663992 (not e!663995))))

(declare-fun res!775128 () Bool)

(assert (=> b!1168310 (=> res!775128 e!663995)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1168310 (= res!775128 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!75519 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1168310 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!38550 0))(
  ( (Unit!38551) )
))
(declare-fun lt!525964 () Unit!38550)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75519 (_ BitVec 64) (_ BitVec 32)) Unit!38550)

(assert (=> b!1168310 (= lt!525964 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1168311 () Bool)

(declare-fun res!775133 () Bool)

(assert (=> b!1168311 (=> (not res!775133) (not e!663999))))

(assert (=> b!1168311 (= res!775133 (= (select (arr!36410 _keys!1208) i!673) k0!934))))

(declare-fun mapNonEmpty!45848 () Bool)

(declare-fun tp!87167 () Bool)

(declare-fun e!663991 () Bool)

(assert (=> mapNonEmpty!45848 (= mapRes!45848 (and tp!87167 e!663991))))

(declare-fun mapValue!45848 () ValueCell!13965)

(declare-fun mapKey!45848 () (_ BitVec 32))

(declare-fun mapRest!45848 () (Array (_ BitVec 32) ValueCell!13965))

(assert (=> mapNonEmpty!45848 (= (arr!36411 _values!996) (store mapRest!45848 mapKey!45848 mapValue!45848))))

(declare-fun b!1168312 () Bool)

(declare-fun res!775132 () Bool)

(assert (=> b!1168312 (=> (not res!775132) (not e!663999))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1168312 (= res!775132 (validMask!0 mask!1564))))

(declare-fun b!1168313 () Bool)

(declare-fun e!663994 () Bool)

(assert (=> b!1168313 (= e!663995 e!663994)))

(declare-fun res!775122 () Bool)

(assert (=> b!1168313 (=> res!775122 e!663994)))

(assert (=> b!1168313 (= res!775122 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!44259)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((tuple2!18798 0))(
  ( (tuple2!18799 (_1!9410 (_ BitVec 64)) (_2!9410 V!44259)) )
))
(declare-datatypes ((List!25538 0))(
  ( (Nil!25535) (Cons!25534 (h!26743 tuple2!18798) (t!37349 List!25538)) )
))
(declare-datatypes ((ListLongMap!16767 0))(
  ( (ListLongMap!16768 (toList!8399 List!25538)) )
))
(declare-fun lt!525969 () ListLongMap!16767)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!525967 () array!75521)

(declare-fun minValue!944 () V!44259)

(declare-fun getCurrentListMapNoExtraKeys!4863 (array!75519 array!75521 (_ BitVec 32) (_ BitVec 32) V!44259 V!44259 (_ BitVec 32) Int) ListLongMap!16767)

(assert (=> b!1168313 (= lt!525969 (getCurrentListMapNoExtraKeys!4863 lt!525965 lt!525967 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2844 (Int (_ BitVec 64)) V!44259)

(assert (=> b!1168313 (= lt!525967 (array!75522 (store (arr!36411 _values!996) i!673 (ValueCellFull!13965 (dynLambda!2844 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36947 _values!996)))))

(declare-fun lt!525968 () ListLongMap!16767)

(assert (=> b!1168313 (= lt!525968 (getCurrentListMapNoExtraKeys!4863 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1168314 () Bool)

(declare-fun e!663996 () Bool)

(assert (=> b!1168314 (= e!663996 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!1455) (size!36946 _keys!1208))))))

(declare-fun b!1168316 () Bool)

(declare-fun res!775129 () Bool)

(assert (=> b!1168316 (=> (not res!775129) (not e!663999))))

(assert (=> b!1168316 (= res!775129 (and (= (size!36947 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36946 _keys!1208) (size!36947 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1168317 () Bool)

(assert (=> b!1168317 (= e!663994 e!663996)))

(declare-fun res!775126 () Bool)

(assert (=> b!1168317 (=> res!775126 e!663996)))

(assert (=> b!1168317 (= res!775126 (not (validKeyInArray!0 (select (arr!36410 _keys!1208) from!1455))))))

(declare-fun -!1472 (ListLongMap!16767 (_ BitVec 64)) ListLongMap!16767)

(assert (=> b!1168317 (= (getCurrentListMapNoExtraKeys!4863 lt!525965 lt!525967 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1472 (getCurrentListMapNoExtraKeys!4863 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun lt!525966 () Unit!38550)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!699 (array!75519 array!75521 (_ BitVec 32) (_ BitVec 32) V!44259 V!44259 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38550)

(assert (=> b!1168317 (= lt!525966 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!699 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1168318 () Bool)

(declare-fun res!775131 () Bool)

(assert (=> b!1168318 (=> (not res!775131) (not e!663999))))

(declare-datatypes ((List!25539 0))(
  ( (Nil!25536) (Cons!25535 (h!26744 (_ BitVec 64)) (t!37350 List!25539)) )
))
(declare-fun arrayNoDuplicates!0 (array!75519 (_ BitVec 32) List!25539) Bool)

(assert (=> b!1168318 (= res!775131 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25536))))

(declare-fun b!1168319 () Bool)

(declare-fun res!775124 () Bool)

(assert (=> b!1168319 (=> (not res!775124) (not e!663992))))

(assert (=> b!1168319 (= res!775124 (arrayNoDuplicates!0 lt!525965 #b00000000000000000000000000000000 Nil!25536))))

(declare-fun b!1168320 () Bool)

(declare-fun tp_is_empty!29349 () Bool)

(assert (=> b!1168320 (= e!663997 tp_is_empty!29349)))

(declare-fun res!775127 () Bool)

(assert (=> start!99214 (=> (not res!775127) (not e!663999))))

(assert (=> start!99214 (= res!775127 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36946 _keys!1208))))))

(assert (=> start!99214 e!663999))

(assert (=> start!99214 tp_is_empty!29349))

(declare-fun array_inv!27832 (array!75519) Bool)

(assert (=> start!99214 (array_inv!27832 _keys!1208)))

(assert (=> start!99214 true))

(assert (=> start!99214 tp!87168))

(declare-fun array_inv!27833 (array!75521) Bool)

(assert (=> start!99214 (and (array_inv!27833 _values!996) e!663993)))

(declare-fun b!1168315 () Bool)

(assert (=> b!1168315 (= e!663991 tp_is_empty!29349)))

(assert (= (and start!99214 res!775127) b!1168312))

(assert (= (and b!1168312 res!775132) b!1168316))

(assert (= (and b!1168316 res!775129) b!1168309))

(assert (= (and b!1168309 res!775123) b!1168318))

(assert (= (and b!1168318 res!775131) b!1168305))

(assert (= (and b!1168305 res!775130) b!1168308))

(assert (= (and b!1168308 res!775125) b!1168311))

(assert (= (and b!1168311 res!775133) b!1168306))

(assert (= (and b!1168306 res!775121) b!1168319))

(assert (= (and b!1168319 res!775124) b!1168310))

(assert (= (and b!1168310 (not res!775128)) b!1168313))

(assert (= (and b!1168313 (not res!775122)) b!1168317))

(assert (= (and b!1168317 (not res!775126)) b!1168314))

(assert (= (and b!1168307 condMapEmpty!45848) mapIsEmpty!45848))

(assert (= (and b!1168307 (not condMapEmpty!45848)) mapNonEmpty!45848))

(get-info :version)

(assert (= (and mapNonEmpty!45848 ((_ is ValueCellFull!13965) mapValue!45848)) b!1168315))

(assert (= (and b!1168307 ((_ is ValueCellFull!13965) mapDefault!45848)) b!1168320))

(assert (= start!99214 b!1168307))

(declare-fun b_lambda!19925 () Bool)

(assert (=> (not b_lambda!19925) (not b!1168313)))

(declare-fun t!37348 () Bool)

(declare-fun tb!9631 () Bool)

(assert (=> (and start!99214 (= defaultEntry!1004 defaultEntry!1004) t!37348) tb!9631))

(declare-fun result!19827 () Bool)

(assert (=> tb!9631 (= result!19827 tp_is_empty!29349)))

(assert (=> b!1168313 t!37348))

(declare-fun b_and!40489 () Bool)

(assert (= b_and!40487 (and (=> t!37348 result!19827) b_and!40489)))

(declare-fun m!1076145 () Bool)

(assert (=> b!1168306 m!1076145))

(declare-fun m!1076147 () Bool)

(assert (=> b!1168306 m!1076147))

(declare-fun m!1076149 () Bool)

(assert (=> b!1168311 m!1076149))

(declare-fun m!1076151 () Bool)

(assert (=> b!1168313 m!1076151))

(declare-fun m!1076153 () Bool)

(assert (=> b!1168313 m!1076153))

(declare-fun m!1076155 () Bool)

(assert (=> b!1168313 m!1076155))

(declare-fun m!1076157 () Bool)

(assert (=> b!1168313 m!1076157))

(declare-fun m!1076159 () Bool)

(assert (=> b!1168310 m!1076159))

(declare-fun m!1076161 () Bool)

(assert (=> b!1168310 m!1076161))

(declare-fun m!1076163 () Bool)

(assert (=> b!1168319 m!1076163))

(declare-fun m!1076165 () Bool)

(assert (=> b!1168318 m!1076165))

(declare-fun m!1076167 () Bool)

(assert (=> b!1168308 m!1076167))

(declare-fun m!1076169 () Bool)

(assert (=> mapNonEmpty!45848 m!1076169))

(declare-fun m!1076171 () Bool)

(assert (=> b!1168312 m!1076171))

(declare-fun m!1076173 () Bool)

(assert (=> start!99214 m!1076173))

(declare-fun m!1076175 () Bool)

(assert (=> start!99214 m!1076175))

(declare-fun m!1076177 () Bool)

(assert (=> b!1168317 m!1076177))

(declare-fun m!1076179 () Bool)

(assert (=> b!1168317 m!1076179))

(declare-fun m!1076181 () Bool)

(assert (=> b!1168317 m!1076181))

(assert (=> b!1168317 m!1076177))

(declare-fun m!1076183 () Bool)

(assert (=> b!1168317 m!1076183))

(declare-fun m!1076185 () Bool)

(assert (=> b!1168317 m!1076185))

(declare-fun m!1076187 () Bool)

(assert (=> b!1168317 m!1076187))

(assert (=> b!1168317 m!1076185))

(declare-fun m!1076189 () Bool)

(assert (=> b!1168309 m!1076189))

(check-sat (not b!1168306) tp_is_empty!29349 (not start!99214) (not b_lambda!19925) (not b_next!24819) (not b!1168310) (not b!1168313) (not b!1168309) (not b!1168319) (not b!1168318) (not mapNonEmpty!45848) b_and!40489 (not b!1168308) (not b!1168312) (not b!1168317))
(check-sat b_and!40489 (not b_next!24819))
