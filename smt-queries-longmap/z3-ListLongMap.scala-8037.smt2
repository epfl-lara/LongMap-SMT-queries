; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99298 () Bool)

(assert start!99298)

(declare-fun b_free!24667 () Bool)

(declare-fun b_next!24667 () Bool)

(assert (=> start!99298 (= b_free!24667 (not b_next!24667))))

(declare-fun tp!86712 () Bool)

(declare-fun b_and!40185 () Bool)

(assert (=> start!99298 (= tp!86712 b_and!40185)))

(declare-fun b!1166087 () Bool)

(declare-fun res!772963 () Bool)

(declare-fun e!663064 () Bool)

(assert (=> b!1166087 (=> (not res!772963) (not e!663064))))

(declare-datatypes ((array!75279 0))(
  ( (array!75280 (arr!36284 (Array (_ BitVec 32) (_ BitVec 64))) (size!36821 (_ BitVec 32))) )
))
(declare-fun lt!525223 () array!75279)

(declare-datatypes ((List!25460 0))(
  ( (Nil!25457) (Cons!25456 (h!26674 (_ BitVec 64)) (t!37111 List!25460)) )
))
(declare-fun arrayNoDuplicates!0 (array!75279 (_ BitVec 32) List!25460) Bool)

(assert (=> b!1166087 (= res!772963 (arrayNoDuplicates!0 lt!525223 #b00000000000000000000000000000000 Nil!25457))))

(declare-fun b!1166089 () Bool)

(declare-fun res!772966 () Bool)

(declare-fun e!663069 () Bool)

(assert (=> b!1166089 (=> (not res!772966) (not e!663069))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun _keys!1208 () array!75279)

(assert (=> b!1166089 (= res!772966 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36821 _keys!1208))))))

(declare-fun b!1166090 () Bool)

(declare-fun res!772961 () Bool)

(assert (=> b!1166090 (=> (not res!772961) (not e!663069))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!44057 0))(
  ( (V!44058 (val!14655 Int)) )
))
(declare-datatypes ((ValueCell!13889 0))(
  ( (ValueCellFull!13889 (v!17288 V!44057)) (EmptyCell!13889) )
))
(declare-datatypes ((array!75281 0))(
  ( (array!75282 (arr!36285 (Array (_ BitVec 32) ValueCell!13889)) (size!36822 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75281)

(assert (=> b!1166090 (= res!772961 (and (= (size!36822 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36821 _keys!1208) (size!36822 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!45620 () Bool)

(declare-fun mapRes!45620 () Bool)

(declare-fun tp!86711 () Bool)

(declare-fun e!663070 () Bool)

(assert (=> mapNonEmpty!45620 (= mapRes!45620 (and tp!86711 e!663070))))

(declare-fun mapValue!45620 () ValueCell!13889)

(declare-fun mapKey!45620 () (_ BitVec 32))

(declare-fun mapRest!45620 () (Array (_ BitVec 32) ValueCell!13889))

(assert (=> mapNonEmpty!45620 (= (arr!36285 _values!996) (store mapRest!45620 mapKey!45620 mapValue!45620))))

(declare-fun b!1166091 () Bool)

(declare-fun res!772967 () Bool)

(assert (=> b!1166091 (=> (not res!772967) (not e!663069))))

(assert (=> b!1166091 (= res!772967 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25457))))

(declare-fun b!1166092 () Bool)

(declare-fun res!772965 () Bool)

(assert (=> b!1166092 (=> (not res!772965) (not e!663069))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1166092 (= res!772965 (validMask!0 mask!1564))))

(declare-fun b!1166093 () Bool)

(declare-fun res!772959 () Bool)

(assert (=> b!1166093 (=> (not res!772959) (not e!663069))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1166093 (= res!772959 (validKeyInArray!0 k0!934))))

(declare-fun b!1166094 () Bool)

(declare-fun tp_is_empty!29197 () Bool)

(assert (=> b!1166094 (= e!663070 tp_is_empty!29197)))

(declare-fun b!1166095 () Bool)

(declare-fun e!663065 () Bool)

(assert (=> b!1166095 (= e!663064 (not e!663065))))

(declare-fun res!772962 () Bool)

(assert (=> b!1166095 (=> res!772962 e!663065)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1166095 (= res!772962 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!75279 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1166095 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!38431 0))(
  ( (Unit!38432) )
))
(declare-fun lt!525221 () Unit!38431)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75279 (_ BitVec 64) (_ BitVec 32)) Unit!38431)

(assert (=> b!1166095 (= lt!525221 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1166096 () Bool)

(declare-fun res!772960 () Bool)

(assert (=> b!1166096 (=> (not res!772960) (not e!663069))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75279 (_ BitVec 32)) Bool)

(assert (=> b!1166096 (= res!772960 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1166088 () Bool)

(assert (=> b!1166088 (= e!663065 true)))

(declare-fun zeroValue!944 () V!44057)

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!18722 0))(
  ( (tuple2!18723 (_1!9372 (_ BitVec 64)) (_2!9372 V!44057)) )
))
(declare-datatypes ((List!25461 0))(
  ( (Nil!25458) (Cons!25457 (h!26675 tuple2!18722) (t!37112 List!25461)) )
))
(declare-datatypes ((ListLongMap!16699 0))(
  ( (ListLongMap!16700 (toList!8365 List!25461)) )
))
(declare-fun lt!525220 () ListLongMap!16699)

(declare-fun minValue!944 () V!44057)

(declare-fun getCurrentListMapNoExtraKeys!4856 (array!75279 array!75281 (_ BitVec 32) (_ BitVec 32) V!44057 V!44057 (_ BitVec 32) Int) ListLongMap!16699)

(declare-fun dynLambda!2845 (Int (_ BitVec 64)) V!44057)

(assert (=> b!1166088 (= lt!525220 (getCurrentListMapNoExtraKeys!4856 lt!525223 (array!75282 (store (arr!36285 _values!996) i!673 (ValueCellFull!13889 (dynLambda!2845 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36822 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!525222 () ListLongMap!16699)

(assert (=> b!1166088 (= lt!525222 (getCurrentListMapNoExtraKeys!4856 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun res!772958 () Bool)

(assert (=> start!99298 (=> (not res!772958) (not e!663069))))

(assert (=> start!99298 (= res!772958 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36821 _keys!1208))))))

(assert (=> start!99298 e!663069))

(assert (=> start!99298 tp_is_empty!29197))

(declare-fun array_inv!27826 (array!75279) Bool)

(assert (=> start!99298 (array_inv!27826 _keys!1208)))

(assert (=> start!99298 true))

(assert (=> start!99298 tp!86712))

(declare-fun e!663067 () Bool)

(declare-fun array_inv!27827 (array!75281) Bool)

(assert (=> start!99298 (and (array_inv!27827 _values!996) e!663067)))

(declare-fun b!1166097 () Bool)

(declare-fun res!772964 () Bool)

(assert (=> b!1166097 (=> (not res!772964) (not e!663069))))

(assert (=> b!1166097 (= res!772964 (= (select (arr!36284 _keys!1208) i!673) k0!934))))

(declare-fun mapIsEmpty!45620 () Bool)

(assert (=> mapIsEmpty!45620 mapRes!45620))

(declare-fun b!1166098 () Bool)

(declare-fun e!663066 () Bool)

(assert (=> b!1166098 (= e!663067 (and e!663066 mapRes!45620))))

(declare-fun condMapEmpty!45620 () Bool)

(declare-fun mapDefault!45620 () ValueCell!13889)

(assert (=> b!1166098 (= condMapEmpty!45620 (= (arr!36285 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13889)) mapDefault!45620)))))

(declare-fun b!1166099 () Bool)

(assert (=> b!1166099 (= e!663069 e!663064)))

(declare-fun res!772968 () Bool)

(assert (=> b!1166099 (=> (not res!772968) (not e!663064))))

(assert (=> b!1166099 (= res!772968 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!525223 mask!1564))))

(assert (=> b!1166099 (= lt!525223 (array!75280 (store (arr!36284 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36821 _keys!1208)))))

(declare-fun b!1166100 () Bool)

(assert (=> b!1166100 (= e!663066 tp_is_empty!29197)))

(assert (= (and start!99298 res!772958) b!1166092))

(assert (= (and b!1166092 res!772965) b!1166090))

(assert (= (and b!1166090 res!772961) b!1166096))

(assert (= (and b!1166096 res!772960) b!1166091))

(assert (= (and b!1166091 res!772967) b!1166089))

(assert (= (and b!1166089 res!772966) b!1166093))

(assert (= (and b!1166093 res!772959) b!1166097))

(assert (= (and b!1166097 res!772964) b!1166099))

(assert (= (and b!1166099 res!772968) b!1166087))

(assert (= (and b!1166087 res!772963) b!1166095))

(assert (= (and b!1166095 (not res!772962)) b!1166088))

(assert (= (and b!1166098 condMapEmpty!45620) mapIsEmpty!45620))

(assert (= (and b!1166098 (not condMapEmpty!45620)) mapNonEmpty!45620))

(get-info :version)

(assert (= (and mapNonEmpty!45620 ((_ is ValueCellFull!13889) mapValue!45620)) b!1166094))

(assert (= (and b!1166098 ((_ is ValueCellFull!13889) mapDefault!45620)) b!1166100))

(assert (= start!99298 b!1166098))

(declare-fun b_lambda!19767 () Bool)

(assert (=> (not b_lambda!19767) (not b!1166088)))

(declare-fun t!37110 () Bool)

(declare-fun tb!9471 () Bool)

(assert (=> (and start!99298 (= defaultEntry!1004 defaultEntry!1004) t!37110) tb!9471))

(declare-fun result!19515 () Bool)

(assert (=> tb!9471 (= result!19515 tp_is_empty!29197)))

(assert (=> b!1166088 t!37110))

(declare-fun b_and!40187 () Bool)

(assert (= b_and!40185 (and (=> t!37110 result!19515) b_and!40187)))

(declare-fun m!1074713 () Bool)

(assert (=> b!1166087 m!1074713))

(declare-fun m!1074715 () Bool)

(assert (=> b!1166095 m!1074715))

(declare-fun m!1074717 () Bool)

(assert (=> b!1166095 m!1074717))

(declare-fun m!1074719 () Bool)

(assert (=> b!1166099 m!1074719))

(declare-fun m!1074721 () Bool)

(assert (=> b!1166099 m!1074721))

(declare-fun m!1074723 () Bool)

(assert (=> b!1166096 m!1074723))

(declare-fun m!1074725 () Bool)

(assert (=> b!1166097 m!1074725))

(declare-fun m!1074727 () Bool)

(assert (=> b!1166093 m!1074727))

(declare-fun m!1074729 () Bool)

(assert (=> start!99298 m!1074729))

(declare-fun m!1074731 () Bool)

(assert (=> start!99298 m!1074731))

(declare-fun m!1074733 () Bool)

(assert (=> b!1166088 m!1074733))

(declare-fun m!1074735 () Bool)

(assert (=> b!1166088 m!1074735))

(declare-fun m!1074737 () Bool)

(assert (=> b!1166088 m!1074737))

(declare-fun m!1074739 () Bool)

(assert (=> b!1166088 m!1074739))

(declare-fun m!1074741 () Bool)

(assert (=> b!1166091 m!1074741))

(declare-fun m!1074743 () Bool)

(assert (=> mapNonEmpty!45620 m!1074743))

(declare-fun m!1074745 () Bool)

(assert (=> b!1166092 m!1074745))

(check-sat (not b!1166096) (not b!1166087) (not b!1166099) tp_is_empty!29197 (not b_lambda!19767) (not b!1166088) (not mapNonEmpty!45620) (not b!1166095) (not start!99298) (not b!1166091) (not b!1166092) b_and!40187 (not b_next!24667) (not b!1166093))
(check-sat b_and!40187 (not b_next!24667))
