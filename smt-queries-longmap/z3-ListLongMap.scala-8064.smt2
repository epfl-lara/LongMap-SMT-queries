; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99226 () Bool)

(assert start!99226)

(declare-fun b_free!24831 () Bool)

(declare-fun b_next!24831 () Bool)

(assert (=> start!99226 (= b_free!24831 (not b_next!24831))))

(declare-fun tp!87204 () Bool)

(declare-fun b_and!40511 () Bool)

(assert (=> start!99226 (= tp!87204 b_and!40511)))

(declare-fun b!1168605 () Bool)

(declare-fun res!775365 () Bool)

(declare-fun e!664156 () Bool)

(assert (=> b!1168605 (=> (not res!775365) (not e!664156))))

(declare-datatypes ((array!75543 0))(
  ( (array!75544 (arr!36422 (Array (_ BitVec 32) (_ BitVec 64))) (size!36958 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75543)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1168605 (= res!775365 (= (select (arr!36422 _keys!1208) i!673) k0!934))))

(declare-fun res!775366 () Bool)

(assert (=> start!99226 (=> (not res!775366) (not e!664156))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!99226 (= res!775366 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36958 _keys!1208))))))

(assert (=> start!99226 e!664156))

(declare-fun tp_is_empty!29361 () Bool)

(assert (=> start!99226 tp_is_empty!29361))

(declare-fun array_inv!27840 (array!75543) Bool)

(assert (=> start!99226 (array_inv!27840 _keys!1208)))

(assert (=> start!99226 true))

(assert (=> start!99226 tp!87204))

(declare-datatypes ((V!44275 0))(
  ( (V!44276 (val!14737 Int)) )
))
(declare-datatypes ((ValueCell!13971 0))(
  ( (ValueCellFull!13971 (v!17374 V!44275)) (EmptyCell!13971) )
))
(declare-datatypes ((array!75545 0))(
  ( (array!75546 (arr!36423 (Array (_ BitVec 32) ValueCell!13971)) (size!36959 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75545)

(declare-fun e!664153 () Bool)

(declare-fun array_inv!27841 (array!75545) Bool)

(assert (=> start!99226 (and (array_inv!27841 _values!996) e!664153)))

(declare-fun b!1168606 () Bool)

(declare-fun e!664161 () Bool)

(declare-fun e!664158 () Bool)

(assert (=> b!1168606 (= e!664161 (not e!664158))))

(declare-fun res!775363 () Bool)

(assert (=> b!1168606 (=> res!775363 e!664158)))

(assert (=> b!1168606 (= res!775363 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!75543 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1168606 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!38562 0))(
  ( (Unit!38563) )
))
(declare-fun lt!526130 () Unit!38562)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75543 (_ BitVec 64) (_ BitVec 32)) Unit!38562)

(assert (=> b!1168606 (= lt!526130 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1168607 () Bool)

(declare-fun e!664160 () Bool)

(assert (=> b!1168607 (= e!664160 tp_is_empty!29361)))

(declare-fun mapNonEmpty!45866 () Bool)

(declare-fun mapRes!45866 () Bool)

(declare-fun tp!87203 () Bool)

(assert (=> mapNonEmpty!45866 (= mapRes!45866 (and tp!87203 e!664160))))

(declare-fun mapValue!45866 () ValueCell!13971)

(declare-fun mapKey!45866 () (_ BitVec 32))

(declare-fun mapRest!45866 () (Array (_ BitVec 32) ValueCell!13971))

(assert (=> mapNonEmpty!45866 (= (arr!36423 _values!996) (store mapRest!45866 mapKey!45866 mapValue!45866))))

(declare-fun b!1168608 () Bool)

(declare-fun e!664157 () Bool)

(assert (=> b!1168608 (= e!664157 tp_is_empty!29361)))

(declare-fun b!1168609 () Bool)

(declare-fun res!775355 () Bool)

(assert (=> b!1168609 (=> (not res!775355) (not e!664156))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1168609 (= res!775355 (validMask!0 mask!1564))))

(declare-fun b!1168610 () Bool)

(declare-fun res!775364 () Bool)

(assert (=> b!1168610 (=> (not res!775364) (not e!664156))))

(declare-datatypes ((List!25550 0))(
  ( (Nil!25547) (Cons!25546 (h!26755 (_ BitVec 64)) (t!37373 List!25550)) )
))
(declare-fun arrayNoDuplicates!0 (array!75543 (_ BitVec 32) List!25550) Bool)

(assert (=> b!1168610 (= res!775364 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25547))))

(declare-fun b!1168611 () Bool)

(declare-fun res!775362 () Bool)

(assert (=> b!1168611 (=> (not res!775362) (not e!664161))))

(declare-fun lt!526134 () array!75543)

(assert (=> b!1168611 (= res!775362 (arrayNoDuplicates!0 lt!526134 #b00000000000000000000000000000000 Nil!25547))))

(declare-fun b!1168612 () Bool)

(assert (=> b!1168612 (= e!664153 (and e!664157 mapRes!45866))))

(declare-fun condMapEmpty!45866 () Bool)

(declare-fun mapDefault!45866 () ValueCell!13971)

(assert (=> b!1168612 (= condMapEmpty!45866 (= (arr!36423 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13971)) mapDefault!45866)))))

(declare-fun b!1168613 () Bool)

(assert (=> b!1168613 (= e!664156 e!664161)))

(declare-fun res!775359 () Bool)

(assert (=> b!1168613 (=> (not res!775359) (not e!664161))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75543 (_ BitVec 32)) Bool)

(assert (=> b!1168613 (= res!775359 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!526134 mask!1564))))

(assert (=> b!1168613 (= lt!526134 (array!75544 (store (arr!36422 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36958 _keys!1208)))))

(declare-fun b!1168614 () Bool)

(declare-fun res!775356 () Bool)

(assert (=> b!1168614 (=> (not res!775356) (not e!664156))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1168614 (= res!775356 (validKeyInArray!0 k0!934))))

(declare-fun b!1168615 () Bool)

(declare-fun res!775358 () Bool)

(assert (=> b!1168615 (=> (not res!775358) (not e!664156))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1168615 (= res!775358 (and (= (size!36959 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36958 _keys!1208) (size!36959 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1168616 () Bool)

(declare-fun e!664155 () Bool)

(assert (=> b!1168616 (= e!664155 true)))

(declare-fun lt!526132 () V!44275)

(declare-datatypes ((tuple2!18810 0))(
  ( (tuple2!18811 (_1!9416 (_ BitVec 64)) (_2!9416 V!44275)) )
))
(declare-datatypes ((List!25551 0))(
  ( (Nil!25548) (Cons!25547 (h!26756 tuple2!18810) (t!37374 List!25551)) )
))
(declare-datatypes ((ListLongMap!16779 0))(
  ( (ListLongMap!16780 (toList!8405 List!25551)) )
))
(declare-fun lt!526136 () ListLongMap!16779)

(declare-fun lt!526129 () ListLongMap!16779)

(declare-fun +!3740 (ListLongMap!16779 tuple2!18810) ListLongMap!16779)

(declare-fun get!18562 (ValueCell!13971 V!44275) V!44275)

(assert (=> b!1168616 (= lt!526129 (+!3740 lt!526136 (tuple2!18811 (select (arr!36422 _keys!1208) from!1455) (get!18562 (select (arr!36423 _values!996) from!1455) lt!526132))))))

(declare-fun b!1168617 () Bool)

(declare-fun e!664154 () Bool)

(assert (=> b!1168617 (= e!664158 e!664154)))

(declare-fun res!775361 () Bool)

(assert (=> b!1168617 (=> res!775361 e!664154)))

(assert (=> b!1168617 (= res!775361 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!44275)

(declare-fun lt!526133 () array!75545)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!44275)

(declare-fun getCurrentListMapNoExtraKeys!4869 (array!75543 array!75545 (_ BitVec 32) (_ BitVec 32) V!44275 V!44275 (_ BitVec 32) Int) ListLongMap!16779)

(assert (=> b!1168617 (= lt!526129 (getCurrentListMapNoExtraKeys!4869 lt!526134 lt!526133 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1168617 (= lt!526133 (array!75546 (store (arr!36423 _values!996) i!673 (ValueCellFull!13971 lt!526132)) (size!36959 _values!996)))))

(declare-fun dynLambda!2849 (Int (_ BitVec 64)) V!44275)

(assert (=> b!1168617 (= lt!526132 (dynLambda!2849 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!526131 () ListLongMap!16779)

(assert (=> b!1168617 (= lt!526131 (getCurrentListMapNoExtraKeys!4869 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1168618 () Bool)

(declare-fun res!775357 () Bool)

(assert (=> b!1168618 (=> (not res!775357) (not e!664156))))

(assert (=> b!1168618 (= res!775357 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36958 _keys!1208))))))

(declare-fun b!1168619 () Bool)

(assert (=> b!1168619 (= e!664154 e!664155)))

(declare-fun res!775367 () Bool)

(assert (=> b!1168619 (=> res!775367 e!664155)))

(assert (=> b!1168619 (= res!775367 (not (validKeyInArray!0 (select (arr!36422 _keys!1208) from!1455))))))

(declare-fun lt!526135 () ListLongMap!16779)

(assert (=> b!1168619 (= lt!526135 lt!526136)))

(declare-fun lt!526128 () ListLongMap!16779)

(declare-fun -!1477 (ListLongMap!16779 (_ BitVec 64)) ListLongMap!16779)

(assert (=> b!1168619 (= lt!526136 (-!1477 lt!526128 k0!934))))

(assert (=> b!1168619 (= lt!526135 (getCurrentListMapNoExtraKeys!4869 lt!526134 lt!526133 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1168619 (= lt!526128 (getCurrentListMapNoExtraKeys!4869 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!526137 () Unit!38562)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!704 (array!75543 array!75545 (_ BitVec 32) (_ BitVec 32) V!44275 V!44275 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38562)

(assert (=> b!1168619 (= lt!526137 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!704 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapIsEmpty!45866 () Bool)

(assert (=> mapIsEmpty!45866 mapRes!45866))

(declare-fun b!1168620 () Bool)

(declare-fun res!775360 () Bool)

(assert (=> b!1168620 (=> (not res!775360) (not e!664156))))

(assert (=> b!1168620 (= res!775360 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(assert (= (and start!99226 res!775366) b!1168609))

(assert (= (and b!1168609 res!775355) b!1168615))

(assert (= (and b!1168615 res!775358) b!1168620))

(assert (= (and b!1168620 res!775360) b!1168610))

(assert (= (and b!1168610 res!775364) b!1168618))

(assert (= (and b!1168618 res!775357) b!1168614))

(assert (= (and b!1168614 res!775356) b!1168605))

(assert (= (and b!1168605 res!775365) b!1168613))

(assert (= (and b!1168613 res!775359) b!1168611))

(assert (= (and b!1168611 res!775362) b!1168606))

(assert (= (and b!1168606 (not res!775363)) b!1168617))

(assert (= (and b!1168617 (not res!775361)) b!1168619))

(assert (= (and b!1168619 (not res!775367)) b!1168616))

(assert (= (and b!1168612 condMapEmpty!45866) mapIsEmpty!45866))

(assert (= (and b!1168612 (not condMapEmpty!45866)) mapNonEmpty!45866))

(get-info :version)

(assert (= (and mapNonEmpty!45866 ((_ is ValueCellFull!13971) mapValue!45866)) b!1168607))

(assert (= (and b!1168612 ((_ is ValueCellFull!13971) mapDefault!45866)) b!1168608))

(assert (= start!99226 b!1168612))

(declare-fun b_lambda!19937 () Bool)

(assert (=> (not b_lambda!19937) (not b!1168617)))

(declare-fun t!37372 () Bool)

(declare-fun tb!9643 () Bool)

(assert (=> (and start!99226 (= defaultEntry!1004 defaultEntry!1004) t!37372) tb!9643))

(declare-fun result!19851 () Bool)

(assert (=> tb!9643 (= result!19851 tp_is_empty!29361)))

(assert (=> b!1168617 t!37372))

(declare-fun b_and!40513 () Bool)

(assert (= b_and!40511 (and (=> t!37372 result!19851) b_and!40513)))

(declare-fun m!1076445 () Bool)

(assert (=> start!99226 m!1076445))

(declare-fun m!1076447 () Bool)

(assert (=> start!99226 m!1076447))

(declare-fun m!1076449 () Bool)

(assert (=> b!1168605 m!1076449))

(declare-fun m!1076451 () Bool)

(assert (=> b!1168616 m!1076451))

(declare-fun m!1076453 () Bool)

(assert (=> b!1168616 m!1076453))

(assert (=> b!1168616 m!1076453))

(declare-fun m!1076455 () Bool)

(assert (=> b!1168616 m!1076455))

(declare-fun m!1076457 () Bool)

(assert (=> b!1168616 m!1076457))

(declare-fun m!1076459 () Bool)

(assert (=> b!1168614 m!1076459))

(declare-fun m!1076461 () Bool)

(assert (=> b!1168609 m!1076461))

(declare-fun m!1076463 () Bool)

(assert (=> b!1168613 m!1076463))

(declare-fun m!1076465 () Bool)

(assert (=> b!1168613 m!1076465))

(declare-fun m!1076467 () Bool)

(assert (=> mapNonEmpty!45866 m!1076467))

(declare-fun m!1076469 () Bool)

(assert (=> b!1168606 m!1076469))

(declare-fun m!1076471 () Bool)

(assert (=> b!1168606 m!1076471))

(declare-fun m!1076473 () Bool)

(assert (=> b!1168617 m!1076473))

(declare-fun m!1076475 () Bool)

(assert (=> b!1168617 m!1076475))

(declare-fun m!1076477 () Bool)

(assert (=> b!1168617 m!1076477))

(declare-fun m!1076479 () Bool)

(assert (=> b!1168617 m!1076479))

(declare-fun m!1076481 () Bool)

(assert (=> b!1168611 m!1076481))

(declare-fun m!1076483 () Bool)

(assert (=> b!1168619 m!1076483))

(declare-fun m!1076485 () Bool)

(assert (=> b!1168619 m!1076485))

(assert (=> b!1168619 m!1076451))

(declare-fun m!1076487 () Bool)

(assert (=> b!1168619 m!1076487))

(declare-fun m!1076489 () Bool)

(assert (=> b!1168619 m!1076489))

(declare-fun m!1076491 () Bool)

(assert (=> b!1168619 m!1076491))

(assert (=> b!1168619 m!1076451))

(declare-fun m!1076493 () Bool)

(assert (=> b!1168610 m!1076493))

(declare-fun m!1076495 () Bool)

(assert (=> b!1168620 m!1076495))

(check-sat (not b!1168609) (not b!1168606) (not b!1168610) (not b!1168613) (not b!1168617) (not b!1168614) tp_is_empty!29361 (not b!1168616) (not start!99226) (not b_lambda!19937) (not b!1168611) (not b!1168620) (not b!1168619) (not mapNonEmpty!45866) b_and!40513 (not b_next!24831))
(check-sat b_and!40513 (not b_next!24831))
