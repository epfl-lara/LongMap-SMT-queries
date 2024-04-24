; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100702 () Bool)

(assert start!100702)

(declare-fun b_free!25789 () Bool)

(declare-fun b_next!25789 () Bool)

(assert (=> start!100702 (= b_free!25789 (not b_next!25789))))

(declare-fun tp!90356 () Bool)

(declare-fun b_and!42467 () Bool)

(assert (=> start!100702 (= tp!90356 b_and!42467)))

(declare-fun b!1201049 () Bool)

(declare-fun res!799104 () Bool)

(declare-fun e!682229 () Bool)

(assert (=> b!1201049 (=> (not res!799104) (not e!682229))))

(declare-datatypes ((array!77799 0))(
  ( (array!77800 (arr!37538 (Array (_ BitVec 32) (_ BitVec 64))) (size!38075 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77799)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1201049 (= res!799104 (= (select (arr!37538 _keys!1208) i!673) k0!934))))

(declare-fun res!799105 () Bool)

(assert (=> start!100702 (=> (not res!799105) (not e!682229))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!100702 (= res!799105 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38075 _keys!1208))))))

(assert (=> start!100702 e!682229))

(declare-fun tp_is_empty!30493 () Bool)

(assert (=> start!100702 tp_is_empty!30493))

(declare-fun array_inv!28674 (array!77799) Bool)

(assert (=> start!100702 (array_inv!28674 _keys!1208)))

(assert (=> start!100702 true))

(assert (=> start!100702 tp!90356))

(declare-datatypes ((V!45785 0))(
  ( (V!45786 (val!15303 Int)) )
))
(declare-datatypes ((ValueCell!14537 0))(
  ( (ValueCellFull!14537 (v!17937 V!45785)) (EmptyCell!14537) )
))
(declare-datatypes ((array!77801 0))(
  ( (array!77802 (arr!37539 (Array (_ BitVec 32) ValueCell!14537)) (size!38076 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77801)

(declare-fun e!682232 () Bool)

(declare-fun array_inv!28675 (array!77801) Bool)

(assert (=> start!100702 (and (array_inv!28675 _values!996) e!682232)))

(declare-fun b!1201050 () Bool)

(declare-fun e!682233 () Bool)

(declare-fun mapRes!47582 () Bool)

(assert (=> b!1201050 (= e!682232 (and e!682233 mapRes!47582))))

(declare-fun condMapEmpty!47582 () Bool)

(declare-fun mapDefault!47582 () ValueCell!14537)

(assert (=> b!1201050 (= condMapEmpty!47582 (= (arr!37539 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14537)) mapDefault!47582)))))

(declare-fun b!1201051 () Bool)

(declare-fun res!799107 () Bool)

(assert (=> b!1201051 (=> (not res!799107) (not e!682229))))

(declare-datatypes ((List!26423 0))(
  ( (Nil!26420) (Cons!26419 (h!27637 (_ BitVec 64)) (t!39184 List!26423)) )
))
(declare-fun arrayNoDuplicates!0 (array!77799 (_ BitVec 32) List!26423) Bool)

(assert (=> b!1201051 (= res!799107 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26420))))

(declare-fun b!1201052 () Bool)

(declare-fun res!799111 () Bool)

(declare-fun e!682231 () Bool)

(assert (=> b!1201052 (=> (not res!799111) (not e!682231))))

(declare-fun lt!544340 () array!77799)

(assert (=> b!1201052 (= res!799111 (arrayNoDuplicates!0 lt!544340 #b00000000000000000000000000000000 Nil!26420))))

(declare-fun b!1201053 () Bool)

(declare-fun res!799106 () Bool)

(assert (=> b!1201053 (=> (not res!799106) (not e!682229))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(assert (=> b!1201053 (= res!799106 (and (= (size!38076 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38075 _keys!1208) (size!38076 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1201054 () Bool)

(assert (=> b!1201054 (= e!682233 tp_is_empty!30493)))

(declare-fun b!1201055 () Bool)

(declare-fun res!799113 () Bool)

(assert (=> b!1201055 (=> (not res!799113) (not e!682229))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1201055 (= res!799113 (validMask!0 mask!1564))))

(declare-fun mapIsEmpty!47582 () Bool)

(assert (=> mapIsEmpty!47582 mapRes!47582))

(declare-fun b!1201056 () Bool)

(declare-fun e!682235 () Bool)

(assert (=> b!1201056 (= e!682235 tp_is_empty!30493)))

(declare-fun mapNonEmpty!47582 () Bool)

(declare-fun tp!90357 () Bool)

(assert (=> mapNonEmpty!47582 (= mapRes!47582 (and tp!90357 e!682235))))

(declare-fun mapValue!47582 () ValueCell!14537)

(declare-fun mapRest!47582 () (Array (_ BitVec 32) ValueCell!14537))

(declare-fun mapKey!47582 () (_ BitVec 32))

(assert (=> mapNonEmpty!47582 (= (arr!37539 _values!996) (store mapRest!47582 mapKey!47582 mapValue!47582))))

(declare-fun b!1201057 () Bool)

(declare-fun e!682234 () Bool)

(assert (=> b!1201057 (= e!682231 (not e!682234))))

(declare-fun res!799114 () Bool)

(assert (=> b!1201057 (=> res!799114 e!682234)))

(assert (=> b!1201057 (= res!799114 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!77799 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1201057 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39745 0))(
  ( (Unit!39746) )
))
(declare-fun lt!544343 () Unit!39745)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77799 (_ BitVec 64) (_ BitVec 32)) Unit!39745)

(assert (=> b!1201057 (= lt!544343 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1201058 () Bool)

(declare-fun res!799110 () Bool)

(assert (=> b!1201058 (=> (not res!799110) (not e!682229))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1201058 (= res!799110 (validKeyInArray!0 k0!934))))

(declare-fun b!1201059 () Bool)

(assert (=> b!1201059 (= e!682229 e!682231)))

(declare-fun res!799109 () Bool)

(assert (=> b!1201059 (=> (not res!799109) (not e!682231))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77799 (_ BitVec 32)) Bool)

(assert (=> b!1201059 (= res!799109 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!544340 mask!1564))))

(assert (=> b!1201059 (= lt!544340 (array!77800 (store (arr!37538 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38075 _keys!1208)))))

(declare-fun b!1201060 () Bool)

(declare-fun res!799112 () Bool)

(assert (=> b!1201060 (=> (not res!799112) (not e!682229))))

(assert (=> b!1201060 (= res!799112 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1201061 () Bool)

(assert (=> b!1201061 (= e!682234 true)))

(declare-fun zeroValue!944 () V!45785)

(declare-fun minValue!944 () V!45785)

(declare-datatypes ((tuple2!19604 0))(
  ( (tuple2!19605 (_1!9813 (_ BitVec 64)) (_2!9813 V!45785)) )
))
(declare-datatypes ((List!26424 0))(
  ( (Nil!26421) (Cons!26420 (h!27638 tuple2!19604) (t!39185 List!26424)) )
))
(declare-datatypes ((ListLongMap!17581 0))(
  ( (ListLongMap!17582 (toList!8806 List!26424)) )
))
(declare-fun lt!544341 () ListLongMap!17581)

(declare-fun defaultEntry!1004 () Int)

(declare-fun getCurrentListMapNoExtraKeys!5273 (array!77799 array!77801 (_ BitVec 32) (_ BitVec 32) V!45785 V!45785 (_ BitVec 32) Int) ListLongMap!17581)

(declare-fun dynLambda!3217 (Int (_ BitVec 64)) V!45785)

(assert (=> b!1201061 (= lt!544341 (getCurrentListMapNoExtraKeys!5273 lt!544340 (array!77802 (store (arr!37539 _values!996) i!673 (ValueCellFull!14537 (dynLambda!3217 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38076 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!544342 () ListLongMap!17581)

(assert (=> b!1201061 (= lt!544342 (getCurrentListMapNoExtraKeys!5273 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1201062 () Bool)

(declare-fun res!799108 () Bool)

(assert (=> b!1201062 (=> (not res!799108) (not e!682229))))

(assert (=> b!1201062 (= res!799108 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38075 _keys!1208))))))

(assert (= (and start!100702 res!799105) b!1201055))

(assert (= (and b!1201055 res!799113) b!1201053))

(assert (= (and b!1201053 res!799106) b!1201060))

(assert (= (and b!1201060 res!799112) b!1201051))

(assert (= (and b!1201051 res!799107) b!1201062))

(assert (= (and b!1201062 res!799108) b!1201058))

(assert (= (and b!1201058 res!799110) b!1201049))

(assert (= (and b!1201049 res!799104) b!1201059))

(assert (= (and b!1201059 res!799109) b!1201052))

(assert (= (and b!1201052 res!799111) b!1201057))

(assert (= (and b!1201057 (not res!799114)) b!1201061))

(assert (= (and b!1201050 condMapEmpty!47582) mapIsEmpty!47582))

(assert (= (and b!1201050 (not condMapEmpty!47582)) mapNonEmpty!47582))

(get-info :version)

(assert (= (and mapNonEmpty!47582 ((_ is ValueCellFull!14537) mapValue!47582)) b!1201056))

(assert (= (and b!1201050 ((_ is ValueCellFull!14537) mapDefault!47582)) b!1201054))

(assert (= start!100702 b!1201050))

(declare-fun b_lambda!20979 () Bool)

(assert (=> (not b_lambda!20979) (not b!1201061)))

(declare-fun t!39183 () Bool)

(declare-fun tb!10581 () Bool)

(assert (=> (and start!100702 (= defaultEntry!1004 defaultEntry!1004) t!39183) tb!10581))

(declare-fun result!21747 () Bool)

(assert (=> tb!10581 (= result!21747 tp_is_empty!30493)))

(assert (=> b!1201061 t!39183))

(declare-fun b_and!42469 () Bool)

(assert (= b_and!42467 (and (=> t!39183 result!21747) b_and!42469)))

(declare-fun m!1107797 () Bool)

(assert (=> b!1201061 m!1107797))

(declare-fun m!1107799 () Bool)

(assert (=> b!1201061 m!1107799))

(declare-fun m!1107801 () Bool)

(assert (=> b!1201061 m!1107801))

(declare-fun m!1107803 () Bool)

(assert (=> b!1201061 m!1107803))

(declare-fun m!1107805 () Bool)

(assert (=> b!1201057 m!1107805))

(declare-fun m!1107807 () Bool)

(assert (=> b!1201057 m!1107807))

(declare-fun m!1107809 () Bool)

(assert (=> b!1201058 m!1107809))

(declare-fun m!1107811 () Bool)

(assert (=> start!100702 m!1107811))

(declare-fun m!1107813 () Bool)

(assert (=> start!100702 m!1107813))

(declare-fun m!1107815 () Bool)

(assert (=> b!1201055 m!1107815))

(declare-fun m!1107817 () Bool)

(assert (=> b!1201059 m!1107817))

(declare-fun m!1107819 () Bool)

(assert (=> b!1201059 m!1107819))

(declare-fun m!1107821 () Bool)

(assert (=> b!1201051 m!1107821))

(declare-fun m!1107823 () Bool)

(assert (=> b!1201052 m!1107823))

(declare-fun m!1107825 () Bool)

(assert (=> b!1201049 m!1107825))

(declare-fun m!1107827 () Bool)

(assert (=> mapNonEmpty!47582 m!1107827))

(declare-fun m!1107829 () Bool)

(assert (=> b!1201060 m!1107829))

(check-sat (not start!100702) (not b_lambda!20979) b_and!42469 (not b!1201052) (not b!1201051) (not mapNonEmpty!47582) (not b!1201061) (not b!1201060) (not b!1201057) (not b!1201059) (not b!1201055) (not b!1201058) (not b_next!25789) tp_is_empty!30493)
(check-sat b_and!42469 (not b_next!25789))
