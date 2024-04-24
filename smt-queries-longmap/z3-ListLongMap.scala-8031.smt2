; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99262 () Bool)

(assert start!99262)

(declare-fun b_free!24631 () Bool)

(declare-fun b_next!24631 () Bool)

(assert (=> start!99262 (= b_free!24631 (not b_next!24631))))

(declare-fun tp!86604 () Bool)

(declare-fun b_and!40113 () Bool)

(assert (=> start!99262 (= tp!86604 b_and!40113)))

(declare-fun b!1165295 () Bool)

(declare-fun e!662692 () Bool)

(declare-fun e!662687 () Bool)

(assert (=> b!1165295 (= e!662692 (not e!662687))))

(declare-fun res!772371 () Bool)

(assert (=> b!1165295 (=> res!772371 e!662687)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1165295 (= res!772371 (bvsgt from!1455 i!673))))

(declare-datatypes ((array!75209 0))(
  ( (array!75210 (arr!36249 (Array (_ BitVec 32) (_ BitVec 64))) (size!36786 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75209)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!75209 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1165295 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!38405 0))(
  ( (Unit!38406) )
))
(declare-fun lt!525006 () Unit!38405)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75209 (_ BitVec 64) (_ BitVec 32)) Unit!38405)

(assert (=> b!1165295 (= lt!525006 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1165296 () Bool)

(declare-fun res!772373 () Bool)

(declare-fun e!662691 () Bool)

(assert (=> b!1165296 (=> (not res!772373) (not e!662691))))

(assert (=> b!1165296 (= res!772373 (= (select (arr!36249 _keys!1208) i!673) k0!934))))

(declare-fun b!1165297 () Bool)

(assert (=> b!1165297 (= e!662691 e!662692)))

(declare-fun res!772368 () Bool)

(assert (=> b!1165297 (=> (not res!772368) (not e!662692))))

(declare-fun lt!525004 () array!75209)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75209 (_ BitVec 32)) Bool)

(assert (=> b!1165297 (= res!772368 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!525004 mask!1564))))

(assert (=> b!1165297 (= lt!525004 (array!75210 (store (arr!36249 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36786 _keys!1208)))))

(declare-fun b!1165298 () Bool)

(assert (=> b!1165298 (= e!662687 true)))

(declare-datatypes ((V!44009 0))(
  ( (V!44010 (val!14637 Int)) )
))
(declare-fun zeroValue!944 () V!44009)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((tuple2!18696 0))(
  ( (tuple2!18697 (_1!9359 (_ BitVec 64)) (_2!9359 V!44009)) )
))
(declare-datatypes ((List!25430 0))(
  ( (Nil!25427) (Cons!25426 (h!26644 tuple2!18696) (t!37045 List!25430)) )
))
(declare-datatypes ((ListLongMap!16673 0))(
  ( (ListLongMap!16674 (toList!8352 List!25430)) )
))
(declare-fun lt!525007 () ListLongMap!16673)

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!13871 0))(
  ( (ValueCellFull!13871 (v!17270 V!44009)) (EmptyCell!13871) )
))
(declare-datatypes ((array!75211 0))(
  ( (array!75212 (arr!36250 (Array (_ BitVec 32) ValueCell!13871)) (size!36787 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75211)

(declare-fun minValue!944 () V!44009)

(declare-fun getCurrentListMapNoExtraKeys!4843 (array!75209 array!75211 (_ BitVec 32) (_ BitVec 32) V!44009 V!44009 (_ BitVec 32) Int) ListLongMap!16673)

(declare-fun dynLambda!2832 (Int (_ BitVec 64)) V!44009)

(assert (=> b!1165298 (= lt!525007 (getCurrentListMapNoExtraKeys!4843 lt!525004 (array!75212 (store (arr!36250 _values!996) i!673 (ValueCellFull!13871 (dynLambda!2832 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36787 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!525005 () ListLongMap!16673)

(assert (=> b!1165298 (= lt!525005 (getCurrentListMapNoExtraKeys!4843 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1165299 () Bool)

(declare-fun res!772365 () Bool)

(assert (=> b!1165299 (=> (not res!772365) (not e!662691))))

(assert (=> b!1165299 (= res!772365 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36786 _keys!1208))))))

(declare-fun b!1165300 () Bool)

(declare-fun res!772370 () Bool)

(assert (=> b!1165300 (=> (not res!772370) (not e!662691))))

(assert (=> b!1165300 (= res!772370 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1165301 () Bool)

(declare-fun e!662689 () Bool)

(declare-fun tp_is_empty!29161 () Bool)

(assert (=> b!1165301 (= e!662689 tp_is_empty!29161)))

(declare-fun b!1165302 () Bool)

(declare-fun res!772367 () Bool)

(assert (=> b!1165302 (=> (not res!772367) (not e!662691))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1165302 (= res!772367 (validMask!0 mask!1564))))

(declare-fun b!1165303 () Bool)

(declare-fun res!772364 () Bool)

(assert (=> b!1165303 (=> (not res!772364) (not e!662691))))

(declare-datatypes ((List!25431 0))(
  ( (Nil!25428) (Cons!25427 (h!26645 (_ BitVec 64)) (t!37046 List!25431)) )
))
(declare-fun arrayNoDuplicates!0 (array!75209 (_ BitVec 32) List!25431) Bool)

(assert (=> b!1165303 (= res!772364 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25428))))

(declare-fun b!1165304 () Bool)

(declare-fun e!662688 () Bool)

(assert (=> b!1165304 (= e!662688 tp_is_empty!29161)))

(declare-fun b!1165305 () Bool)

(declare-fun e!662686 () Bool)

(declare-fun mapRes!45566 () Bool)

(assert (=> b!1165305 (= e!662686 (and e!662688 mapRes!45566))))

(declare-fun condMapEmpty!45566 () Bool)

(declare-fun mapDefault!45566 () ValueCell!13871)

(assert (=> b!1165305 (= condMapEmpty!45566 (= (arr!36250 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13871)) mapDefault!45566)))))

(declare-fun b!1165306 () Bool)

(declare-fun res!772366 () Bool)

(assert (=> b!1165306 (=> (not res!772366) (not e!662691))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1165306 (= res!772366 (validKeyInArray!0 k0!934))))

(declare-fun b!1165307 () Bool)

(declare-fun res!772372 () Bool)

(assert (=> b!1165307 (=> (not res!772372) (not e!662692))))

(assert (=> b!1165307 (= res!772372 (arrayNoDuplicates!0 lt!525004 #b00000000000000000000000000000000 Nil!25428))))

(declare-fun mapNonEmpty!45566 () Bool)

(declare-fun tp!86603 () Bool)

(assert (=> mapNonEmpty!45566 (= mapRes!45566 (and tp!86603 e!662689))))

(declare-fun mapKey!45566 () (_ BitVec 32))

(declare-fun mapRest!45566 () (Array (_ BitVec 32) ValueCell!13871))

(declare-fun mapValue!45566 () ValueCell!13871)

(assert (=> mapNonEmpty!45566 (= (arr!36250 _values!996) (store mapRest!45566 mapKey!45566 mapValue!45566))))

(declare-fun res!772374 () Bool)

(assert (=> start!99262 (=> (not res!772374) (not e!662691))))

(assert (=> start!99262 (= res!772374 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36786 _keys!1208))))))

(assert (=> start!99262 e!662691))

(assert (=> start!99262 tp_is_empty!29161))

(declare-fun array_inv!27800 (array!75209) Bool)

(assert (=> start!99262 (array_inv!27800 _keys!1208)))

(assert (=> start!99262 true))

(assert (=> start!99262 tp!86604))

(declare-fun array_inv!27801 (array!75211) Bool)

(assert (=> start!99262 (and (array_inv!27801 _values!996) e!662686)))

(declare-fun b!1165308 () Bool)

(declare-fun res!772369 () Bool)

(assert (=> b!1165308 (=> (not res!772369) (not e!662691))))

(assert (=> b!1165308 (= res!772369 (and (= (size!36787 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36786 _keys!1208) (size!36787 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!45566 () Bool)

(assert (=> mapIsEmpty!45566 mapRes!45566))

(assert (= (and start!99262 res!772374) b!1165302))

(assert (= (and b!1165302 res!772367) b!1165308))

(assert (= (and b!1165308 res!772369) b!1165300))

(assert (= (and b!1165300 res!772370) b!1165303))

(assert (= (and b!1165303 res!772364) b!1165299))

(assert (= (and b!1165299 res!772365) b!1165306))

(assert (= (and b!1165306 res!772366) b!1165296))

(assert (= (and b!1165296 res!772373) b!1165297))

(assert (= (and b!1165297 res!772368) b!1165307))

(assert (= (and b!1165307 res!772372) b!1165295))

(assert (= (and b!1165295 (not res!772371)) b!1165298))

(assert (= (and b!1165305 condMapEmpty!45566) mapIsEmpty!45566))

(assert (= (and b!1165305 (not condMapEmpty!45566)) mapNonEmpty!45566))

(get-info :version)

(assert (= (and mapNonEmpty!45566 ((_ is ValueCellFull!13871) mapValue!45566)) b!1165301))

(assert (= (and b!1165305 ((_ is ValueCellFull!13871) mapDefault!45566)) b!1165304))

(assert (= start!99262 b!1165305))

(declare-fun b_lambda!19731 () Bool)

(assert (=> (not b_lambda!19731) (not b!1165298)))

(declare-fun t!37044 () Bool)

(declare-fun tb!9435 () Bool)

(assert (=> (and start!99262 (= defaultEntry!1004 defaultEntry!1004) t!37044) tb!9435))

(declare-fun result!19443 () Bool)

(assert (=> tb!9435 (= result!19443 tp_is_empty!29161)))

(assert (=> b!1165298 t!37044))

(declare-fun b_and!40115 () Bool)

(assert (= b_and!40113 (and (=> t!37044 result!19443) b_and!40115)))

(declare-fun m!1074101 () Bool)

(assert (=> start!99262 m!1074101))

(declare-fun m!1074103 () Bool)

(assert (=> start!99262 m!1074103))

(declare-fun m!1074105 () Bool)

(assert (=> b!1165297 m!1074105))

(declare-fun m!1074107 () Bool)

(assert (=> b!1165297 m!1074107))

(declare-fun m!1074109 () Bool)

(assert (=> b!1165307 m!1074109))

(declare-fun m!1074111 () Bool)

(assert (=> b!1165303 m!1074111))

(declare-fun m!1074113 () Bool)

(assert (=> b!1165298 m!1074113))

(declare-fun m!1074115 () Bool)

(assert (=> b!1165298 m!1074115))

(declare-fun m!1074117 () Bool)

(assert (=> b!1165298 m!1074117))

(declare-fun m!1074119 () Bool)

(assert (=> b!1165298 m!1074119))

(declare-fun m!1074121 () Bool)

(assert (=> mapNonEmpty!45566 m!1074121))

(declare-fun m!1074123 () Bool)

(assert (=> b!1165300 m!1074123))

(declare-fun m!1074125 () Bool)

(assert (=> b!1165296 m!1074125))

(declare-fun m!1074127 () Bool)

(assert (=> b!1165306 m!1074127))

(declare-fun m!1074129 () Bool)

(assert (=> b!1165295 m!1074129))

(declare-fun m!1074131 () Bool)

(assert (=> b!1165295 m!1074131))

(declare-fun m!1074133 () Bool)

(assert (=> b!1165302 m!1074133))

(check-sat (not b!1165303) (not b_lambda!19731) b_and!40115 (not b_next!24631) (not mapNonEmpty!45566) (not b!1165297) (not start!99262) (not b!1165300) tp_is_empty!29161 (not b!1165307) (not b!1165298) (not b!1165295) (not b!1165302) (not b!1165306))
(check-sat b_and!40115 (not b_next!24631))
