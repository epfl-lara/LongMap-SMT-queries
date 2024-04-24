; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99328 () Bool)

(assert start!99328)

(declare-fun b_free!24697 () Bool)

(declare-fun b_next!24697 () Bool)

(assert (=> start!99328 (= b_free!24697 (not b_next!24697))))

(declare-fun tp!86801 () Bool)

(declare-fun b_and!40245 () Bool)

(assert (=> start!99328 (= tp!86801 b_and!40245)))

(declare-fun b!1166747 () Bool)

(declare-fun res!773453 () Bool)

(declare-fun e!663382 () Bool)

(assert (=> b!1166747 (=> (not res!773453) (not e!663382))))

(declare-datatypes ((array!75335 0))(
  ( (array!75336 (arr!36312 (Array (_ BitVec 32) (_ BitVec 64))) (size!36849 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75335)

(declare-datatypes ((List!25479 0))(
  ( (Nil!25476) (Cons!25475 (h!26693 (_ BitVec 64)) (t!37160 List!25479)) )
))
(declare-fun arrayNoDuplicates!0 (array!75335 (_ BitVec 32) List!25479) Bool)

(assert (=> b!1166747 (= res!773453 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25476))))

(declare-fun b!1166748 () Bool)

(declare-fun res!773457 () Bool)

(assert (=> b!1166748 (=> (not res!773457) (not e!663382))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1166748 (= res!773457 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36849 _keys!1208))))))

(declare-fun b!1166749 () Bool)

(declare-fun e!663384 () Bool)

(declare-fun e!663383 () Bool)

(declare-fun mapRes!45665 () Bool)

(assert (=> b!1166749 (= e!663384 (and e!663383 mapRes!45665))))

(declare-fun condMapEmpty!45665 () Bool)

(declare-datatypes ((V!44097 0))(
  ( (V!44098 (val!14670 Int)) )
))
(declare-datatypes ((ValueCell!13904 0))(
  ( (ValueCellFull!13904 (v!17303 V!44097)) (EmptyCell!13904) )
))
(declare-datatypes ((array!75337 0))(
  ( (array!75338 (arr!36313 (Array (_ BitVec 32) ValueCell!13904)) (size!36850 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75337)

(declare-fun mapDefault!45665 () ValueCell!13904)

(assert (=> b!1166749 (= condMapEmpty!45665 (= (arr!36313 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13904)) mapDefault!45665)))))

(declare-fun b!1166750 () Bool)

(declare-fun e!663379 () Bool)

(assert (=> b!1166750 (= e!663382 e!663379)))

(declare-fun res!773454 () Bool)

(assert (=> b!1166750 (=> (not res!773454) (not e!663379))))

(declare-fun lt!525402 () array!75335)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75335 (_ BitVec 32)) Bool)

(assert (=> b!1166750 (= res!773454 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!525402 mask!1564))))

(assert (=> b!1166750 (= lt!525402 (array!75336 (store (arr!36312 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36849 _keys!1208)))))

(declare-fun b!1166751 () Bool)

(declare-fun e!663380 () Bool)

(declare-fun tp_is_empty!29227 () Bool)

(assert (=> b!1166751 (= e!663380 tp_is_empty!29227)))

(declare-fun b!1166752 () Bool)

(declare-fun res!773456 () Bool)

(assert (=> b!1166752 (=> (not res!773456) (not e!663382))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1166752 (= res!773456 (and (= (size!36850 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36849 _keys!1208) (size!36850 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!45665 () Bool)

(assert (=> mapIsEmpty!45665 mapRes!45665))

(declare-fun b!1166753 () Bool)

(assert (=> b!1166753 (= e!663383 tp_is_empty!29227)))

(declare-fun b!1166754 () Bool)

(declare-fun res!773458 () Bool)

(assert (=> b!1166754 (=> (not res!773458) (not e!663382))))

(assert (=> b!1166754 (= res!773458 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1166755 () Bool)

(declare-fun res!773462 () Bool)

(assert (=> b!1166755 (=> (not res!773462) (not e!663382))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1166755 (= res!773462 (validKeyInArray!0 k0!934))))

(declare-fun b!1166756 () Bool)

(declare-fun res!773460 () Bool)

(assert (=> b!1166756 (=> (not res!773460) (not e!663382))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1166756 (= res!773460 (validMask!0 mask!1564))))

(declare-fun mapNonEmpty!45665 () Bool)

(declare-fun tp!86802 () Bool)

(assert (=> mapNonEmpty!45665 (= mapRes!45665 (and tp!86802 e!663380))))

(declare-fun mapRest!45665 () (Array (_ BitVec 32) ValueCell!13904))

(declare-fun mapKey!45665 () (_ BitVec 32))

(declare-fun mapValue!45665 () ValueCell!13904)

(assert (=> mapNonEmpty!45665 (= (arr!36313 _values!996) (store mapRest!45665 mapKey!45665 mapValue!45665))))

(declare-fun b!1166757 () Bool)

(declare-fun e!663385 () Bool)

(assert (=> b!1166757 (= e!663379 (not e!663385))))

(declare-fun res!773463 () Bool)

(assert (=> b!1166757 (=> res!773463 e!663385)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1166757 (= res!773463 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!75335 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1166757 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!38451 0))(
  ( (Unit!38452) )
))
(declare-fun lt!525403 () Unit!38451)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75335 (_ BitVec 64) (_ BitVec 32)) Unit!38451)

(assert (=> b!1166757 (= lt!525403 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1166758 () Bool)

(assert (=> b!1166758 (= e!663385 true)))

(declare-fun zeroValue!944 () V!44097)

(declare-datatypes ((tuple2!18740 0))(
  ( (tuple2!18741 (_1!9381 (_ BitVec 64)) (_2!9381 V!44097)) )
))
(declare-datatypes ((List!25480 0))(
  ( (Nil!25477) (Cons!25476 (h!26694 tuple2!18740) (t!37161 List!25480)) )
))
(declare-datatypes ((ListLongMap!16717 0))(
  ( (ListLongMap!16718 (toList!8374 List!25480)) )
))
(declare-fun lt!525401 () ListLongMap!16717)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!44097)

(declare-fun getCurrentListMapNoExtraKeys!4865 (array!75335 array!75337 (_ BitVec 32) (_ BitVec 32) V!44097 V!44097 (_ BitVec 32) Int) ListLongMap!16717)

(declare-fun dynLambda!2854 (Int (_ BitVec 64)) V!44097)

(assert (=> b!1166758 (= lt!525401 (getCurrentListMapNoExtraKeys!4865 lt!525402 (array!75338 (store (arr!36313 _values!996) i!673 (ValueCellFull!13904 (dynLambda!2854 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36850 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!525400 () ListLongMap!16717)

(assert (=> b!1166758 (= lt!525400 (getCurrentListMapNoExtraKeys!4865 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1166759 () Bool)

(declare-fun res!773455 () Bool)

(assert (=> b!1166759 (=> (not res!773455) (not e!663379))))

(assert (=> b!1166759 (= res!773455 (arrayNoDuplicates!0 lt!525402 #b00000000000000000000000000000000 Nil!25476))))

(declare-fun res!773459 () Bool)

(assert (=> start!99328 (=> (not res!773459) (not e!663382))))

(assert (=> start!99328 (= res!773459 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36849 _keys!1208))))))

(assert (=> start!99328 e!663382))

(assert (=> start!99328 tp_is_empty!29227))

(declare-fun array_inv!27842 (array!75335) Bool)

(assert (=> start!99328 (array_inv!27842 _keys!1208)))

(assert (=> start!99328 true))

(assert (=> start!99328 tp!86801))

(declare-fun array_inv!27843 (array!75337) Bool)

(assert (=> start!99328 (and (array_inv!27843 _values!996) e!663384)))

(declare-fun b!1166760 () Bool)

(declare-fun res!773461 () Bool)

(assert (=> b!1166760 (=> (not res!773461) (not e!663382))))

(assert (=> b!1166760 (= res!773461 (= (select (arr!36312 _keys!1208) i!673) k0!934))))

(assert (= (and start!99328 res!773459) b!1166756))

(assert (= (and b!1166756 res!773460) b!1166752))

(assert (= (and b!1166752 res!773456) b!1166754))

(assert (= (and b!1166754 res!773458) b!1166747))

(assert (= (and b!1166747 res!773453) b!1166748))

(assert (= (and b!1166748 res!773457) b!1166755))

(assert (= (and b!1166755 res!773462) b!1166760))

(assert (= (and b!1166760 res!773461) b!1166750))

(assert (= (and b!1166750 res!773454) b!1166759))

(assert (= (and b!1166759 res!773455) b!1166757))

(assert (= (and b!1166757 (not res!773463)) b!1166758))

(assert (= (and b!1166749 condMapEmpty!45665) mapIsEmpty!45665))

(assert (= (and b!1166749 (not condMapEmpty!45665)) mapNonEmpty!45665))

(get-info :version)

(assert (= (and mapNonEmpty!45665 ((_ is ValueCellFull!13904) mapValue!45665)) b!1166751))

(assert (= (and b!1166749 ((_ is ValueCellFull!13904) mapDefault!45665)) b!1166753))

(assert (= start!99328 b!1166749))

(declare-fun b_lambda!19797 () Bool)

(assert (=> (not b_lambda!19797) (not b!1166758)))

(declare-fun t!37159 () Bool)

(declare-fun tb!9501 () Bool)

(assert (=> (and start!99328 (= defaultEntry!1004 defaultEntry!1004) t!37159) tb!9501))

(declare-fun result!19575 () Bool)

(assert (=> tb!9501 (= result!19575 tp_is_empty!29227)))

(assert (=> b!1166758 t!37159))

(declare-fun b_and!40247 () Bool)

(assert (= b_and!40245 (and (=> t!37159 result!19575) b_and!40247)))

(declare-fun m!1075223 () Bool)

(assert (=> b!1166759 m!1075223))

(declare-fun m!1075225 () Bool)

(assert (=> b!1166754 m!1075225))

(declare-fun m!1075227 () Bool)

(assert (=> b!1166747 m!1075227))

(declare-fun m!1075229 () Bool)

(assert (=> b!1166756 m!1075229))

(declare-fun m!1075231 () Bool)

(assert (=> b!1166758 m!1075231))

(declare-fun m!1075233 () Bool)

(assert (=> b!1166758 m!1075233))

(declare-fun m!1075235 () Bool)

(assert (=> b!1166758 m!1075235))

(declare-fun m!1075237 () Bool)

(assert (=> b!1166758 m!1075237))

(declare-fun m!1075239 () Bool)

(assert (=> b!1166760 m!1075239))

(declare-fun m!1075241 () Bool)

(assert (=> start!99328 m!1075241))

(declare-fun m!1075243 () Bool)

(assert (=> start!99328 m!1075243))

(declare-fun m!1075245 () Bool)

(assert (=> b!1166755 m!1075245))

(declare-fun m!1075247 () Bool)

(assert (=> mapNonEmpty!45665 m!1075247))

(declare-fun m!1075249 () Bool)

(assert (=> b!1166757 m!1075249))

(declare-fun m!1075251 () Bool)

(assert (=> b!1166757 m!1075251))

(declare-fun m!1075253 () Bool)

(assert (=> b!1166750 m!1075253))

(declare-fun m!1075255 () Bool)

(assert (=> b!1166750 m!1075255))

(check-sat (not b!1166756) (not b!1166757) (not b_lambda!19797) (not b_next!24697) (not b!1166759) (not b!1166747) (not start!99328) b_and!40247 (not b!1166758) (not mapNonEmpty!45665) (not b!1166754) (not b!1166750) (not b!1166755) tp_is_empty!29227)
(check-sat b_and!40247 (not b_next!24697))
