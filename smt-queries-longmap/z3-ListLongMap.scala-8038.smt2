; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99304 () Bool)

(assert start!99304)

(declare-fun b_free!24673 () Bool)

(declare-fun b_next!24673 () Bool)

(assert (=> start!99304 (= b_free!24673 (not b_next!24673))))

(declare-fun tp!86730 () Bool)

(declare-fun b_and!40197 () Bool)

(assert (=> start!99304 (= tp!86730 b_and!40197)))

(declare-fun b!1166219 () Bool)

(declare-fun res!773061 () Bool)

(declare-fun e!663127 () Bool)

(assert (=> b!1166219 (=> (not res!773061) (not e!663127))))

(declare-datatypes ((array!75291 0))(
  ( (array!75292 (arr!36290 (Array (_ BitVec 32) (_ BitVec 64))) (size!36827 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75291)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1166219 (= res!773061 (= (select (arr!36290 _keys!1208) i!673) k0!934))))

(declare-fun mapNonEmpty!45629 () Bool)

(declare-fun mapRes!45629 () Bool)

(declare-fun tp!86729 () Bool)

(declare-fun e!663129 () Bool)

(assert (=> mapNonEmpty!45629 (= mapRes!45629 (and tp!86729 e!663129))))

(declare-datatypes ((V!44065 0))(
  ( (V!44066 (val!14658 Int)) )
))
(declare-datatypes ((ValueCell!13892 0))(
  ( (ValueCellFull!13892 (v!17291 V!44065)) (EmptyCell!13892) )
))
(declare-fun mapValue!45629 () ValueCell!13892)

(declare-fun mapKey!45629 () (_ BitVec 32))

(declare-fun mapRest!45629 () (Array (_ BitVec 32) ValueCell!13892))

(declare-datatypes ((array!75293 0))(
  ( (array!75294 (arr!36291 (Array (_ BitVec 32) ValueCell!13892)) (size!36828 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75293)

(assert (=> mapNonEmpty!45629 (= (arr!36291 _values!996) (store mapRest!45629 mapKey!45629 mapValue!45629))))

(declare-fun b!1166220 () Bool)

(declare-fun res!773063 () Bool)

(assert (=> b!1166220 (=> (not res!773063) (not e!663127))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75291 (_ BitVec 32)) Bool)

(assert (=> b!1166220 (= res!773063 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1166221 () Bool)

(declare-fun res!773062 () Bool)

(assert (=> b!1166221 (=> (not res!773062) (not e!663127))))

(declare-datatypes ((List!25463 0))(
  ( (Nil!25460) (Cons!25459 (h!26677 (_ BitVec 64)) (t!37120 List!25463)) )
))
(declare-fun arrayNoDuplicates!0 (array!75291 (_ BitVec 32) List!25463) Bool)

(assert (=> b!1166221 (= res!773062 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25460))))

(declare-fun b!1166222 () Bool)

(declare-fun res!773059 () Bool)

(assert (=> b!1166222 (=> (not res!773059) (not e!663127))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1166222 (= res!773059 (validMask!0 mask!1564))))

(declare-fun b!1166223 () Bool)

(declare-fun e!663128 () Bool)

(declare-fun e!663132 () Bool)

(assert (=> b!1166223 (= e!663128 (and e!663132 mapRes!45629))))

(declare-fun condMapEmpty!45629 () Bool)

(declare-fun mapDefault!45629 () ValueCell!13892)

(assert (=> b!1166223 (= condMapEmpty!45629 (= (arr!36291 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13892)) mapDefault!45629)))))

(declare-fun b!1166224 () Bool)

(declare-fun res!773057 () Bool)

(assert (=> b!1166224 (=> (not res!773057) (not e!663127))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1166224 (= res!773057 (and (= (size!36828 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36827 _keys!1208) (size!36828 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1166225 () Bool)

(declare-fun tp_is_empty!29203 () Bool)

(assert (=> b!1166225 (= e!663129 tp_is_empty!29203)))

(declare-fun res!773058 () Bool)

(assert (=> start!99304 (=> (not res!773058) (not e!663127))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!99304 (= res!773058 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36827 _keys!1208))))))

(assert (=> start!99304 e!663127))

(assert (=> start!99304 tp_is_empty!29203))

(declare-fun array_inv!27828 (array!75291) Bool)

(assert (=> start!99304 (array_inv!27828 _keys!1208)))

(assert (=> start!99304 true))

(assert (=> start!99304 tp!86730))

(declare-fun array_inv!27829 (array!75293) Bool)

(assert (=> start!99304 (and (array_inv!27829 _values!996) e!663128)))

(declare-fun b!1166226 () Bool)

(declare-fun res!773067 () Bool)

(assert (=> b!1166226 (=> (not res!773067) (not e!663127))))

(assert (=> b!1166226 (= res!773067 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36827 _keys!1208))))))

(declare-fun b!1166227 () Bool)

(declare-fun e!663130 () Bool)

(declare-fun e!663131 () Bool)

(assert (=> b!1166227 (= e!663130 (not e!663131))))

(declare-fun res!773060 () Bool)

(assert (=> b!1166227 (=> res!773060 e!663131)))

(assert (=> b!1166227 (= res!773060 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!75291 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1166227 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!38435 0))(
  ( (Unit!38436) )
))
(declare-fun lt!525257 () Unit!38435)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75291 (_ BitVec 64) (_ BitVec 32)) Unit!38435)

(assert (=> b!1166227 (= lt!525257 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1166228 () Bool)

(assert (=> b!1166228 (= e!663131 true)))

(declare-fun zeroValue!944 () V!44065)

(declare-fun lt!525258 () array!75291)

(declare-fun minValue!944 () V!44065)

(declare-datatypes ((tuple2!18724 0))(
  ( (tuple2!18725 (_1!9373 (_ BitVec 64)) (_2!9373 V!44065)) )
))
(declare-datatypes ((List!25464 0))(
  ( (Nil!25461) (Cons!25460 (h!26678 tuple2!18724) (t!37121 List!25464)) )
))
(declare-datatypes ((ListLongMap!16701 0))(
  ( (ListLongMap!16702 (toList!8366 List!25464)) )
))
(declare-fun lt!525256 () ListLongMap!16701)

(declare-fun defaultEntry!1004 () Int)

(declare-fun getCurrentListMapNoExtraKeys!4857 (array!75291 array!75293 (_ BitVec 32) (_ BitVec 32) V!44065 V!44065 (_ BitVec 32) Int) ListLongMap!16701)

(declare-fun dynLambda!2846 (Int (_ BitVec 64)) V!44065)

(assert (=> b!1166228 (= lt!525256 (getCurrentListMapNoExtraKeys!4857 lt!525258 (array!75294 (store (arr!36291 _values!996) i!673 (ValueCellFull!13892 (dynLambda!2846 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36828 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!525259 () ListLongMap!16701)

(assert (=> b!1166228 (= lt!525259 (getCurrentListMapNoExtraKeys!4857 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1166229 () Bool)

(assert (=> b!1166229 (= e!663132 tp_is_empty!29203)))

(declare-fun b!1166230 () Bool)

(assert (=> b!1166230 (= e!663127 e!663130)))

(declare-fun res!773066 () Bool)

(assert (=> b!1166230 (=> (not res!773066) (not e!663130))))

(assert (=> b!1166230 (= res!773066 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!525258 mask!1564))))

(assert (=> b!1166230 (= lt!525258 (array!75292 (store (arr!36290 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36827 _keys!1208)))))

(declare-fun b!1166231 () Bool)

(declare-fun res!773065 () Bool)

(assert (=> b!1166231 (=> (not res!773065) (not e!663130))))

(assert (=> b!1166231 (= res!773065 (arrayNoDuplicates!0 lt!525258 #b00000000000000000000000000000000 Nil!25460))))

(declare-fun b!1166232 () Bool)

(declare-fun res!773064 () Bool)

(assert (=> b!1166232 (=> (not res!773064) (not e!663127))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1166232 (= res!773064 (validKeyInArray!0 k0!934))))

(declare-fun mapIsEmpty!45629 () Bool)

(assert (=> mapIsEmpty!45629 mapRes!45629))

(assert (= (and start!99304 res!773058) b!1166222))

(assert (= (and b!1166222 res!773059) b!1166224))

(assert (= (and b!1166224 res!773057) b!1166220))

(assert (= (and b!1166220 res!773063) b!1166221))

(assert (= (and b!1166221 res!773062) b!1166226))

(assert (= (and b!1166226 res!773067) b!1166232))

(assert (= (and b!1166232 res!773064) b!1166219))

(assert (= (and b!1166219 res!773061) b!1166230))

(assert (= (and b!1166230 res!773066) b!1166231))

(assert (= (and b!1166231 res!773065) b!1166227))

(assert (= (and b!1166227 (not res!773060)) b!1166228))

(assert (= (and b!1166223 condMapEmpty!45629) mapIsEmpty!45629))

(assert (= (and b!1166223 (not condMapEmpty!45629)) mapNonEmpty!45629))

(get-info :version)

(assert (= (and mapNonEmpty!45629 ((_ is ValueCellFull!13892) mapValue!45629)) b!1166225))

(assert (= (and b!1166223 ((_ is ValueCellFull!13892) mapDefault!45629)) b!1166229))

(assert (= start!99304 b!1166223))

(declare-fun b_lambda!19773 () Bool)

(assert (=> (not b_lambda!19773) (not b!1166228)))

(declare-fun t!37119 () Bool)

(declare-fun tb!9477 () Bool)

(assert (=> (and start!99304 (= defaultEntry!1004 defaultEntry!1004) t!37119) tb!9477))

(declare-fun result!19527 () Bool)

(assert (=> tb!9477 (= result!19527 tp_is_empty!29203)))

(assert (=> b!1166228 t!37119))

(declare-fun b_and!40199 () Bool)

(assert (= b_and!40197 (and (=> t!37119 result!19527) b_and!40199)))

(declare-fun m!1074815 () Bool)

(assert (=> b!1166232 m!1074815))

(declare-fun m!1074817 () Bool)

(assert (=> start!99304 m!1074817))

(declare-fun m!1074819 () Bool)

(assert (=> start!99304 m!1074819))

(declare-fun m!1074821 () Bool)

(assert (=> b!1166230 m!1074821))

(declare-fun m!1074823 () Bool)

(assert (=> b!1166230 m!1074823))

(declare-fun m!1074825 () Bool)

(assert (=> b!1166220 m!1074825))

(declare-fun m!1074827 () Bool)

(assert (=> b!1166227 m!1074827))

(declare-fun m!1074829 () Bool)

(assert (=> b!1166227 m!1074829))

(declare-fun m!1074831 () Bool)

(assert (=> b!1166231 m!1074831))

(declare-fun m!1074833 () Bool)

(assert (=> mapNonEmpty!45629 m!1074833))

(declare-fun m!1074835 () Bool)

(assert (=> b!1166222 m!1074835))

(declare-fun m!1074837 () Bool)

(assert (=> b!1166219 m!1074837))

(declare-fun m!1074839 () Bool)

(assert (=> b!1166221 m!1074839))

(declare-fun m!1074841 () Bool)

(assert (=> b!1166228 m!1074841))

(declare-fun m!1074843 () Bool)

(assert (=> b!1166228 m!1074843))

(declare-fun m!1074845 () Bool)

(assert (=> b!1166228 m!1074845))

(declare-fun m!1074847 () Bool)

(assert (=> b!1166228 m!1074847))

(check-sat (not b!1166222) (not b!1166227) (not b!1166230) (not mapNonEmpty!45629) (not b!1166231) (not b_next!24673) (not b!1166220) (not start!99304) tp_is_empty!29203 (not b!1166232) (not b!1166221) (not b!1166228) b_and!40199 (not b_lambda!19773))
(check-sat b_and!40199 (not b_next!24673))
