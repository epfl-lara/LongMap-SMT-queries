; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78870 () Bool)

(assert start!78870)

(declare-fun b_free!16915 () Bool)

(declare-fun b_next!16915 () Bool)

(assert (=> start!78870 (= b_free!16915 (not b_next!16915))))

(declare-fun tp!59187 () Bool)

(declare-fun b_and!27577 () Bool)

(assert (=> start!78870 (= tp!59187 b_and!27577)))

(declare-fun b!918740 () Bool)

(declare-fun res!619137 () Bool)

(declare-fun e!515851 () Bool)

(assert (=> b!918740 (=> (not res!619137) (not e!515851))))

(declare-datatypes ((array!54877 0))(
  ( (array!54878 (arr!26379 (Array (_ BitVec 32) (_ BitVec 64))) (size!26839 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54877)

(declare-datatypes ((List!18466 0))(
  ( (Nil!18463) (Cons!18462 (h!19614 (_ BitVec 64)) (t!26103 List!18466)) )
))
(declare-fun arrayNoDuplicates!0 (array!54877 (_ BitVec 32) List!18466) Bool)

(assert (=> b!918740 (= res!619137 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18463))))

(declare-fun mapIsEmpty!30891 () Bool)

(declare-fun mapRes!30891 () Bool)

(assert (=> mapIsEmpty!30891 mapRes!30891))

(declare-fun b!918741 () Bool)

(declare-fun res!619135 () Bool)

(assert (=> b!918741 (=> (not res!619135) (not e!515851))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!918741 (= res!619135 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26839 _keys!1487))))))

(declare-fun b!918742 () Bool)

(declare-fun res!619139 () Bool)

(declare-fun e!515854 () Bool)

(assert (=> b!918742 (=> (not res!619139) (not e!515854))))

(declare-datatypes ((V!30863 0))(
  ( (V!30864 (val!9762 Int)) )
))
(declare-datatypes ((tuple2!12644 0))(
  ( (tuple2!12645 (_1!6333 (_ BitVec 64)) (_2!6333 V!30863)) )
))
(declare-datatypes ((List!18467 0))(
  ( (Nil!18464) (Cons!18463 (h!19615 tuple2!12644) (t!26104 List!18467)) )
))
(declare-datatypes ((ListLongMap!11343 0))(
  ( (ListLongMap!11344 (toList!5687 List!18467)) )
))
(declare-fun lt!412462 () ListLongMap!11343)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun v!791 () V!30863)

(declare-fun apply!566 (ListLongMap!11343 (_ BitVec 64)) V!30863)

(assert (=> b!918742 (= res!619139 (= (apply!566 lt!412462 k0!1099) v!791))))

(declare-fun b!918743 () Bool)

(declare-fun e!515849 () Bool)

(declare-fun tp_is_empty!19423 () Bool)

(assert (=> b!918743 (= e!515849 tp_is_empty!19423)))

(declare-fun b!918744 () Bool)

(declare-fun res!619136 () Bool)

(assert (=> b!918744 (=> (not res!619136) (not e!515854))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!918744 (= res!619136 (validKeyInArray!0 k0!1099))))

(declare-fun b!918745 () Bool)

(declare-fun e!515848 () Bool)

(assert (=> b!918745 (= e!515848 (not true))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun lt!412463 () (_ BitVec 64))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9230 0))(
  ( (ValueCellFull!9230 (v!12277 V!30863)) (EmptyCell!9230) )
))
(declare-datatypes ((array!54879 0))(
  ( (array!54880 (arr!26380 (Array (_ BitVec 32) ValueCell!9230)) (size!26840 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54879)

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!30863)

(declare-fun minValue!1173 () V!30863)

(declare-fun getCurrentListMap!2942 (array!54877 array!54879 (_ BitVec 32) (_ BitVec 32) V!30863 V!30863 (_ BitVec 32) Int) ListLongMap!11343)

(declare-fun +!2631 (ListLongMap!11343 tuple2!12644) ListLongMap!11343)

(declare-fun get!13838 (ValueCell!9230 V!30863) V!30863)

(declare-fun dynLambda!1428 (Int (_ BitVec 64)) V!30863)

(assert (=> b!918745 (= (getCurrentListMap!2942 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2631 (getCurrentListMap!2942 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) (tuple2!12645 lt!412463 (get!13838 (select (arr!26380 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1428 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-datatypes ((Unit!30974 0))(
  ( (Unit!30975) )
))
(declare-fun lt!412461 () Unit!30974)

(declare-fun lemmaListMapRecursiveValidKeyArray!11 (array!54877 array!54879 (_ BitVec 32) (_ BitVec 32) V!30863 V!30863 (_ BitVec 32) Int) Unit!30974)

(assert (=> b!918745 (= lt!412461 (lemmaListMapRecursiveValidKeyArray!11 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!918746 () Bool)

(assert (=> b!918746 (= e!515854 e!515848)))

(declare-fun res!619138 () Bool)

(assert (=> b!918746 (=> (not res!619138) (not e!515848))))

(assert (=> b!918746 (= res!619138 (validKeyInArray!0 lt!412463))))

(assert (=> b!918746 (= lt!412463 (select (arr!26379 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun b!918747 () Bool)

(declare-fun res!619143 () Bool)

(assert (=> b!918747 (=> (not res!619143) (not e!515851))))

(assert (=> b!918747 (= res!619143 (and (= (size!26840 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26839 _keys!1487) (size!26840 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!30891 () Bool)

(declare-fun tp!59186 () Bool)

(assert (=> mapNonEmpty!30891 (= mapRes!30891 (and tp!59186 e!515849))))

(declare-fun mapKey!30891 () (_ BitVec 32))

(declare-fun mapRest!30891 () (Array (_ BitVec 32) ValueCell!9230))

(declare-fun mapValue!30891 () ValueCell!9230)

(assert (=> mapNonEmpty!30891 (= (arr!26380 _values!1231) (store mapRest!30891 mapKey!30891 mapValue!30891))))

(declare-fun b!918749 () Bool)

(declare-fun e!515852 () Bool)

(assert (=> b!918749 (= e!515852 tp_is_empty!19423)))

(declare-fun b!918750 () Bool)

(declare-fun e!515850 () Bool)

(assert (=> b!918750 (= e!515850 (and e!515852 mapRes!30891))))

(declare-fun condMapEmpty!30891 () Bool)

(declare-fun mapDefault!30891 () ValueCell!9230)

(assert (=> b!918750 (= condMapEmpty!30891 (= (arr!26380 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9230)) mapDefault!30891)))))

(declare-fun res!619140 () Bool)

(assert (=> start!78870 (=> (not res!619140) (not e!515851))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78870 (= res!619140 (validMask!0 mask!1881))))

(assert (=> start!78870 e!515851))

(assert (=> start!78870 true))

(assert (=> start!78870 tp_is_empty!19423))

(declare-fun array_inv!20666 (array!54879) Bool)

(assert (=> start!78870 (and (array_inv!20666 _values!1231) e!515850)))

(assert (=> start!78870 tp!59187))

(declare-fun array_inv!20667 (array!54877) Bool)

(assert (=> start!78870 (array_inv!20667 _keys!1487)))

(declare-fun b!918748 () Bool)

(assert (=> b!918748 (= e!515851 e!515854)))

(declare-fun res!619134 () Bool)

(assert (=> b!918748 (=> (not res!619134) (not e!515854))))

(declare-fun contains!4744 (ListLongMap!11343 (_ BitVec 64)) Bool)

(assert (=> b!918748 (= res!619134 (contains!4744 lt!412462 k0!1099))))

(assert (=> b!918748 (= lt!412462 (getCurrentListMap!2942 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!918751 () Bool)

(declare-fun res!619141 () Bool)

(assert (=> b!918751 (=> (not res!619141) (not e!515854))))

(assert (=> b!918751 (= res!619141 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!918752 () Bool)

(declare-fun res!619142 () Bool)

(assert (=> b!918752 (=> (not res!619142) (not e!515851))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54877 (_ BitVec 32)) Bool)

(assert (=> b!918752 (= res!619142 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(assert (= (and start!78870 res!619140) b!918747))

(assert (= (and b!918747 res!619143) b!918752))

(assert (= (and b!918752 res!619142) b!918740))

(assert (= (and b!918740 res!619137) b!918741))

(assert (= (and b!918741 res!619135) b!918748))

(assert (= (and b!918748 res!619134) b!918742))

(assert (= (and b!918742 res!619139) b!918751))

(assert (= (and b!918751 res!619141) b!918744))

(assert (= (and b!918744 res!619136) b!918746))

(assert (= (and b!918746 res!619138) b!918745))

(assert (= (and b!918750 condMapEmpty!30891) mapIsEmpty!30891))

(assert (= (and b!918750 (not condMapEmpty!30891)) mapNonEmpty!30891))

(get-info :version)

(assert (= (and mapNonEmpty!30891 ((_ is ValueCellFull!9230) mapValue!30891)) b!918743))

(assert (= (and b!918750 ((_ is ValueCellFull!9230) mapDefault!30891)) b!918749))

(assert (= start!78870 b!918750))

(declare-fun b_lambda!13431 () Bool)

(assert (=> (not b_lambda!13431) (not b!918745)))

(declare-fun t!26102 () Bool)

(declare-fun tb!5487 () Bool)

(assert (=> (and start!78870 (= defaultEntry!1235 defaultEntry!1235) t!26102) tb!5487))

(declare-fun result!10805 () Bool)

(assert (=> tb!5487 (= result!10805 tp_is_empty!19423)))

(assert (=> b!918745 t!26102))

(declare-fun b_and!27579 () Bool)

(assert (= b_and!27577 (and (=> t!26102 result!10805) b_and!27579)))

(declare-fun m!852847 () Bool)

(assert (=> b!918742 m!852847))

(declare-fun m!852849 () Bool)

(assert (=> b!918748 m!852849))

(declare-fun m!852851 () Bool)

(assert (=> b!918748 m!852851))

(declare-fun m!852853 () Bool)

(assert (=> mapNonEmpty!30891 m!852853))

(declare-fun m!852855 () Bool)

(assert (=> b!918745 m!852855))

(declare-fun m!852857 () Bool)

(assert (=> b!918745 m!852857))

(declare-fun m!852859 () Bool)

(assert (=> b!918745 m!852859))

(declare-fun m!852861 () Bool)

(assert (=> b!918745 m!852861))

(assert (=> b!918745 m!852859))

(assert (=> b!918745 m!852861))

(declare-fun m!852863 () Bool)

(assert (=> b!918745 m!852863))

(declare-fun m!852865 () Bool)

(assert (=> b!918745 m!852865))

(assert (=> b!918745 m!852855))

(declare-fun m!852867 () Bool)

(assert (=> b!918745 m!852867))

(declare-fun m!852869 () Bool)

(assert (=> b!918744 m!852869))

(declare-fun m!852871 () Bool)

(assert (=> b!918752 m!852871))

(declare-fun m!852873 () Bool)

(assert (=> b!918746 m!852873))

(declare-fun m!852875 () Bool)

(assert (=> b!918746 m!852875))

(declare-fun m!852877 () Bool)

(assert (=> start!78870 m!852877))

(declare-fun m!852879 () Bool)

(assert (=> start!78870 m!852879))

(declare-fun m!852881 () Bool)

(assert (=> start!78870 m!852881))

(declare-fun m!852883 () Bool)

(assert (=> b!918740 m!852883))

(check-sat (not b!918752) tp_is_empty!19423 (not b!918746) (not b!918748) (not b_next!16915) (not b!918745) (not b!918740) (not b!918742) b_and!27579 (not b!918744) (not b_lambda!13431) (not mapNonEmpty!30891) (not start!78870))
(check-sat b_and!27579 (not b_next!16915))
