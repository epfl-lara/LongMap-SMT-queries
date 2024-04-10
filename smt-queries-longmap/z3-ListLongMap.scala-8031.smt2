; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99028 () Bool)

(assert start!99028)

(declare-fun b_free!24633 () Bool)

(declare-fun b_next!24633 () Bool)

(assert (=> start!99028 (= b_free!24633 (not b_next!24633))))

(declare-fun tp!86609 () Bool)

(declare-fun b_and!40115 () Bool)

(assert (=> start!99028 (= tp!86609 b_and!40115)))

(declare-fun b!1164050 () Bool)

(declare-fun res!771898 () Bool)

(declare-fun e!661876 () Bool)

(assert (=> b!1164050 (=> (not res!771898) (not e!661876))))

(declare-datatypes ((array!75165 0))(
  ( (array!75166 (arr!36233 (Array (_ BitVec 32) (_ BitVec 64))) (size!36769 (_ BitVec 32))) )
))
(declare-fun lt!524534 () array!75165)

(declare-datatypes ((List!25404 0))(
  ( (Nil!25401) (Cons!25400 (h!26609 (_ BitVec 64)) (t!37029 List!25404)) )
))
(declare-fun arrayNoDuplicates!0 (array!75165 (_ BitVec 32) List!25404) Bool)

(assert (=> b!1164050 (= res!771898 (arrayNoDuplicates!0 lt!524534 #b00000000000000000000000000000000 Nil!25401))))

(declare-fun b!1164051 () Bool)

(declare-fun res!771896 () Bool)

(declare-fun e!661879 () Bool)

(assert (=> b!1164051 (=> (not res!771896) (not e!661879))))

(declare-fun _keys!1208 () array!75165)

(assert (=> b!1164051 (= res!771896 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25401))))

(declare-fun b!1164052 () Bool)

(declare-fun res!771897 () Bool)

(assert (=> b!1164052 (=> (not res!771897) (not e!661879))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75165 (_ BitVec 32)) Bool)

(assert (=> b!1164052 (= res!771897 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1164053 () Bool)

(declare-fun e!661877 () Bool)

(assert (=> b!1164053 (= e!661877 true)))

(declare-datatypes ((V!44011 0))(
  ( (V!44012 (val!14638 Int)) )
))
(declare-datatypes ((tuple2!18672 0))(
  ( (tuple2!18673 (_1!9347 (_ BitVec 64)) (_2!9347 V!44011)) )
))
(declare-datatypes ((List!25405 0))(
  ( (Nil!25402) (Cons!25401 (h!26610 tuple2!18672) (t!37030 List!25405)) )
))
(declare-datatypes ((ListLongMap!16641 0))(
  ( (ListLongMap!16642 (toList!8336 List!25405)) )
))
(declare-fun lt!524533 () ListLongMap!16641)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13872 0))(
  ( (ValueCellFull!13872 (v!17275 V!44011)) (EmptyCell!13872) )
))
(declare-datatypes ((array!75167 0))(
  ( (array!75168 (arr!36234 (Array (_ BitVec 32) ValueCell!13872)) (size!36770 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75167)

(declare-fun zeroValue!944 () V!44011)

(declare-fun minValue!944 () V!44011)

(declare-fun getCurrentListMapNoExtraKeys!4800 (array!75165 array!75167 (_ BitVec 32) (_ BitVec 32) V!44011 V!44011 (_ BitVec 32) Int) ListLongMap!16641)

(declare-fun dynLambda!2790 (Int (_ BitVec 64)) V!44011)

(assert (=> b!1164053 (= lt!524533 (getCurrentListMapNoExtraKeys!4800 lt!524534 (array!75168 (store (arr!36234 _values!996) i!673 (ValueCellFull!13872 (dynLambda!2790 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36770 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!524532 () ListLongMap!16641)

(assert (=> b!1164053 (= lt!524532 (getCurrentListMapNoExtraKeys!4800 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1164054 () Bool)

(declare-fun res!771891 () Bool)

(assert (=> b!1164054 (=> (not res!771891) (not e!661879))))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1164054 (= res!771891 (= (select (arr!36233 _keys!1208) i!673) k0!934))))

(declare-fun b!1164055 () Bool)

(declare-fun res!771889 () Bool)

(assert (=> b!1164055 (=> (not res!771889) (not e!661879))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1164055 (= res!771889 (validKeyInArray!0 k0!934))))

(declare-fun b!1164056 () Bool)

(declare-fun e!661880 () Bool)

(declare-fun tp_is_empty!29163 () Bool)

(assert (=> b!1164056 (= e!661880 tp_is_empty!29163)))

(declare-fun b!1164057 () Bool)

(assert (=> b!1164057 (= e!661876 (not e!661877))))

(declare-fun res!771899 () Bool)

(assert (=> b!1164057 (=> res!771899 e!661877)))

(assert (=> b!1164057 (= res!771899 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!75165 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1164057 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!38422 0))(
  ( (Unit!38423) )
))
(declare-fun lt!524535 () Unit!38422)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75165 (_ BitVec 64) (_ BitVec 32)) Unit!38422)

(assert (=> b!1164057 (= lt!524535 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun res!771895 () Bool)

(assert (=> start!99028 (=> (not res!771895) (not e!661879))))

(assert (=> start!99028 (= res!771895 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36769 _keys!1208))))))

(assert (=> start!99028 e!661879))

(assert (=> start!99028 tp_is_empty!29163))

(declare-fun array_inv!27724 (array!75165) Bool)

(assert (=> start!99028 (array_inv!27724 _keys!1208)))

(assert (=> start!99028 true))

(assert (=> start!99028 tp!86609))

(declare-fun e!661878 () Bool)

(declare-fun array_inv!27725 (array!75167) Bool)

(assert (=> start!99028 (and (array_inv!27725 _values!996) e!661878)))

(declare-fun b!1164058 () Bool)

(declare-fun res!771892 () Bool)

(assert (=> b!1164058 (=> (not res!771892) (not e!661879))))

(assert (=> b!1164058 (= res!771892 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36769 _keys!1208))))))

(declare-fun b!1164059 () Bool)

(declare-fun res!771890 () Bool)

(assert (=> b!1164059 (=> (not res!771890) (not e!661879))))

(assert (=> b!1164059 (= res!771890 (and (= (size!36770 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36769 _keys!1208) (size!36770 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1164060 () Bool)

(declare-fun e!661881 () Bool)

(assert (=> b!1164060 (= e!661881 tp_is_empty!29163)))

(declare-fun b!1164061 () Bool)

(declare-fun res!771893 () Bool)

(assert (=> b!1164061 (=> (not res!771893) (not e!661879))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1164061 (= res!771893 (validMask!0 mask!1564))))

(declare-fun mapIsEmpty!45569 () Bool)

(declare-fun mapRes!45569 () Bool)

(assert (=> mapIsEmpty!45569 mapRes!45569))

(declare-fun b!1164062 () Bool)

(assert (=> b!1164062 (= e!661878 (and e!661881 mapRes!45569))))

(declare-fun condMapEmpty!45569 () Bool)

(declare-fun mapDefault!45569 () ValueCell!13872)

(assert (=> b!1164062 (= condMapEmpty!45569 (= (arr!36234 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13872)) mapDefault!45569)))))

(declare-fun mapNonEmpty!45569 () Bool)

(declare-fun tp!86610 () Bool)

(assert (=> mapNonEmpty!45569 (= mapRes!45569 (and tp!86610 e!661880))))

(declare-fun mapKey!45569 () (_ BitVec 32))

(declare-fun mapRest!45569 () (Array (_ BitVec 32) ValueCell!13872))

(declare-fun mapValue!45569 () ValueCell!13872)

(assert (=> mapNonEmpty!45569 (= (arr!36234 _values!996) (store mapRest!45569 mapKey!45569 mapValue!45569))))

(declare-fun b!1164063 () Bool)

(assert (=> b!1164063 (= e!661879 e!661876)))

(declare-fun res!771894 () Bool)

(assert (=> b!1164063 (=> (not res!771894) (not e!661876))))

(assert (=> b!1164063 (= res!771894 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!524534 mask!1564))))

(assert (=> b!1164063 (= lt!524534 (array!75166 (store (arr!36233 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36769 _keys!1208)))))

(assert (= (and start!99028 res!771895) b!1164061))

(assert (= (and b!1164061 res!771893) b!1164059))

(assert (= (and b!1164059 res!771890) b!1164052))

(assert (= (and b!1164052 res!771897) b!1164051))

(assert (= (and b!1164051 res!771896) b!1164058))

(assert (= (and b!1164058 res!771892) b!1164055))

(assert (= (and b!1164055 res!771889) b!1164054))

(assert (= (and b!1164054 res!771891) b!1164063))

(assert (= (and b!1164063 res!771894) b!1164050))

(assert (= (and b!1164050 res!771898) b!1164057))

(assert (= (and b!1164057 (not res!771899)) b!1164053))

(assert (= (and b!1164062 condMapEmpty!45569) mapIsEmpty!45569))

(assert (= (and b!1164062 (not condMapEmpty!45569)) mapNonEmpty!45569))

(get-info :version)

(assert (= (and mapNonEmpty!45569 ((_ is ValueCellFull!13872) mapValue!45569)) b!1164056))

(assert (= (and b!1164062 ((_ is ValueCellFull!13872) mapDefault!45569)) b!1164060))

(assert (= start!99028 b!1164062))

(declare-fun b_lambda!19739 () Bool)

(assert (=> (not b_lambda!19739) (not b!1164053)))

(declare-fun t!37028 () Bool)

(declare-fun tb!9445 () Bool)

(assert (=> (and start!99028 (= defaultEntry!1004 defaultEntry!1004) t!37028) tb!9445))

(declare-fun result!19455 () Bool)

(assert (=> tb!9445 (= result!19455 tp_is_empty!29163)))

(assert (=> b!1164053 t!37028))

(declare-fun b_and!40117 () Bool)

(assert (= b_and!40115 (and (=> t!37028 result!19455) b_and!40117)))

(declare-fun m!1072563 () Bool)

(assert (=> b!1164052 m!1072563))

(declare-fun m!1072565 () Bool)

(assert (=> b!1164050 m!1072565))

(declare-fun m!1072567 () Bool)

(assert (=> b!1164055 m!1072567))

(declare-fun m!1072569 () Bool)

(assert (=> b!1164061 m!1072569))

(declare-fun m!1072571 () Bool)

(assert (=> b!1164057 m!1072571))

(declare-fun m!1072573 () Bool)

(assert (=> b!1164057 m!1072573))

(declare-fun m!1072575 () Bool)

(assert (=> b!1164054 m!1072575))

(declare-fun m!1072577 () Bool)

(assert (=> b!1164063 m!1072577))

(declare-fun m!1072579 () Bool)

(assert (=> b!1164063 m!1072579))

(declare-fun m!1072581 () Bool)

(assert (=> start!99028 m!1072581))

(declare-fun m!1072583 () Bool)

(assert (=> start!99028 m!1072583))

(declare-fun m!1072585 () Bool)

(assert (=> mapNonEmpty!45569 m!1072585))

(declare-fun m!1072587 () Bool)

(assert (=> b!1164053 m!1072587))

(declare-fun m!1072589 () Bool)

(assert (=> b!1164053 m!1072589))

(declare-fun m!1072591 () Bool)

(assert (=> b!1164053 m!1072591))

(declare-fun m!1072593 () Bool)

(assert (=> b!1164053 m!1072593))

(declare-fun m!1072595 () Bool)

(assert (=> b!1164051 m!1072595))

(check-sat b_and!40117 (not mapNonEmpty!45569) (not start!99028) tp_is_empty!29163 (not b!1164051) (not b!1164052) (not b!1164063) (not b_lambda!19739) (not b_next!24633) (not b!1164055) (not b!1164061) (not b!1164050) (not b!1164053) (not b!1164057))
(check-sat b_and!40117 (not b_next!24633))
