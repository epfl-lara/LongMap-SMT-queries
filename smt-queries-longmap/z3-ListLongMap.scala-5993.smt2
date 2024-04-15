; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77792 () Bool)

(assert start!77792)

(declare-fun b_free!16369 () Bool)

(declare-fun b_next!16369 () Bool)

(assert (=> start!77792 (= b_free!16369 (not b_next!16369))))

(declare-fun tp!57372 () Bool)

(declare-fun b_and!26869 () Bool)

(assert (=> start!77792 (= tp!57372 b_and!26869)))

(declare-fun b!907988 () Bool)

(declare-fun e!508883 () Bool)

(declare-fun e!508882 () Bool)

(assert (=> b!907988 (= e!508883 e!508882)))

(declare-fun res!612881 () Bool)

(assert (=> b!907988 (=> res!612881 e!508882)))

(declare-datatypes ((V!30015 0))(
  ( (V!30016 (val!9444 Int)) )
))
(declare-datatypes ((tuple2!12332 0))(
  ( (tuple2!12333 (_1!6177 (_ BitVec 64)) (_2!6177 V!30015)) )
))
(declare-datatypes ((List!18117 0))(
  ( (Nil!18114) (Cons!18113 (h!19259 tuple2!12332) (t!25649 List!18117)) )
))
(declare-datatypes ((ListLongMap!11019 0))(
  ( (ListLongMap!11020 (toList!5525 List!18117)) )
))
(declare-fun lt!409404 () ListLongMap!11019)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun contains!4526 (ListLongMap!11019 (_ BitVec 64)) Bool)

(assert (=> b!907988 (= res!612881 (not (contains!4526 lt!409404 k0!1033)))))

(declare-datatypes ((ValueCell!8912 0))(
  ( (ValueCellFull!8912 (v!11950 V!30015)) (EmptyCell!8912) )
))
(declare-datatypes ((array!53587 0))(
  ( (array!53588 (arr!25752 (Array (_ BitVec 32) ValueCell!8912)) (size!26213 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53587)

(declare-fun defaultEntry!1160 () Int)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun i!717 () (_ BitVec 32))

(declare-fun zeroValue!1094 () V!30015)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!30015)

(declare-datatypes ((array!53589 0))(
  ( (array!53590 (arr!25753 (Array (_ BitVec 32) (_ BitVec 64))) (size!26214 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53589)

(declare-fun getCurrentListMap!2729 (array!53589 array!53587 (_ BitVec 32) (_ BitVec 32) V!30015 V!30015 (_ BitVec 32) Int) ListLongMap!11019)

(assert (=> b!907988 (= lt!409404 (getCurrentListMap!2729 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))

(declare-fun b!907989 () Bool)

(declare-fun e!508880 () Bool)

(declare-fun e!508881 () Bool)

(assert (=> b!907989 (= e!508880 e!508881)))

(declare-fun res!612876 () Bool)

(assert (=> b!907989 (=> (not res!612876) (not e!508881))))

(declare-fun lt!409402 () ListLongMap!11019)

(assert (=> b!907989 (= res!612876 (contains!4526 lt!409402 k0!1033))))

(assert (=> b!907989 (= lt!409402 (getCurrentListMap!2729 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun b!907990 () Bool)

(declare-fun e!508876 () Bool)

(declare-fun e!508878 () Bool)

(declare-fun mapRes!29896 () Bool)

(assert (=> b!907990 (= e!508876 (and e!508878 mapRes!29896))))

(declare-fun condMapEmpty!29896 () Bool)

(declare-fun mapDefault!29896 () ValueCell!8912)

(assert (=> b!907990 (= condMapEmpty!29896 (= (arr!25752 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8912)) mapDefault!29896)))))

(declare-fun b!907991 () Bool)

(declare-fun res!612879 () Bool)

(assert (=> b!907991 (=> (not res!612879) (not e!508880))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53589 (_ BitVec 32)) Bool)

(assert (=> b!907991 (= res!612879 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!907992 () Bool)

(declare-fun tp_is_empty!18787 () Bool)

(assert (=> b!907992 (= e!508878 tp_is_empty!18787)))

(declare-fun res!612883 () Bool)

(assert (=> start!77792 (=> (not res!612883) (not e!508880))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77792 (= res!612883 (validMask!0 mask!1756))))

(assert (=> start!77792 e!508880))

(declare-fun array_inv!20204 (array!53587) Bool)

(assert (=> start!77792 (and (array_inv!20204 _values!1152) e!508876)))

(assert (=> start!77792 tp!57372))

(assert (=> start!77792 true))

(assert (=> start!77792 tp_is_empty!18787))

(declare-fun array_inv!20205 (array!53589) Bool)

(assert (=> start!77792 (array_inv!20205 _keys!1386)))

(declare-fun b!907993 () Bool)

(declare-fun e!508879 () Bool)

(assert (=> b!907993 (= e!508879 tp_is_empty!18787)))

(declare-fun b!907994 () Bool)

(declare-fun res!612880 () Bool)

(assert (=> b!907994 (=> (not res!612880) (not e!508881))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!907994 (= res!612880 (inRange!0 i!717 mask!1756))))

(declare-fun mapIsEmpty!29896 () Bool)

(assert (=> mapIsEmpty!29896 mapRes!29896))

(declare-fun b!907995 () Bool)

(assert (=> b!907995 (= e!508881 (not e!508883))))

(declare-fun res!612874 () Bool)

(assert (=> b!907995 (=> res!612874 e!508883)))

(assert (=> b!907995 (= res!612874 (or (bvslt i!717 #b00000000000000000000000000000000) (bvsge i!717 (size!26214 _keys!1386))))))

(declare-fun lt!409400 () V!30015)

(declare-fun get!13558 (ValueCell!8912 V!30015) V!30015)

(declare-fun dynLambda!1366 (Int (_ BitVec 64)) V!30015)

(assert (=> b!907995 (= lt!409400 (get!13558 (select (arr!25752 _values!1152) i!717) (dynLambda!1366 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!53589 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!907995 (arrayContainsKey!0 _keys!1386 k0!1033 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!30752 0))(
  ( (Unit!30753) )
))
(declare-fun lt!409401 () Unit!30752)

(declare-fun lemmaKeyInListMapIsInArray!242 (array!53589 array!53587 (_ BitVec 32) (_ BitVec 32) V!30015 V!30015 (_ BitVec 64) Int) Unit!30752)

(assert (=> b!907995 (= lt!409401 (lemmaKeyInListMapIsInArray!242 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 defaultEntry!1160))))

(declare-fun b!907996 () Bool)

(declare-fun res!612875 () Bool)

(assert (=> b!907996 (=> res!612875 e!508882)))

(declare-fun apply!499 (ListLongMap!11019 (_ BitVec 64)) V!30015)

(assert (=> b!907996 (= res!612875 (not (= (apply!499 lt!409404 k0!1033) lt!409400)))))

(declare-fun b!907997 () Bool)

(declare-fun res!612877 () Bool)

(assert (=> b!907997 (=> (not res!612877) (not e!508880))))

(assert (=> b!907997 (= res!612877 (and (= (size!26213 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26214 _keys!1386) (size!26213 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!907998 () Bool)

(declare-fun res!612882 () Bool)

(assert (=> b!907998 (=> (not res!612882) (not e!508880))))

(declare-datatypes ((List!18118 0))(
  ( (Nil!18115) (Cons!18114 (h!19260 (_ BitVec 64)) (t!25650 List!18118)) )
))
(declare-fun arrayNoDuplicates!0 (array!53589 (_ BitVec 32) List!18118) Bool)

(assert (=> b!907998 (= res!612882 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18115))))

(declare-fun b!907999 () Bool)

(declare-fun res!612878 () Bool)

(assert (=> b!907999 (=> (not res!612878) (not e!508881))))

(assert (=> b!907999 (= res!612878 (and (= (select (arr!25753 _keys!1386) i!717) k0!1033) (not (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!29896 () Bool)

(declare-fun tp!57373 () Bool)

(assert (=> mapNonEmpty!29896 (= mapRes!29896 (and tp!57373 e!508879))))

(declare-fun mapKey!29896 () (_ BitVec 32))

(declare-fun mapRest!29896 () (Array (_ BitVec 32) ValueCell!8912))

(declare-fun mapValue!29896 () ValueCell!8912)

(assert (=> mapNonEmpty!29896 (= (arr!25752 _values!1152) (store mapRest!29896 mapKey!29896 mapValue!29896))))

(declare-fun b!908000 () Bool)

(assert (=> b!908000 (= e!508882 true)))

(assert (=> b!908000 (= (apply!499 lt!409402 k0!1033) lt!409400)))

(declare-fun lt!409403 () Unit!30752)

(declare-fun lemmaListMapApplyFromThenApplyFromZero!57 (array!53589 array!53587 (_ BitVec 32) (_ BitVec 32) V!30015 V!30015 (_ BitVec 64) V!30015 (_ BitVec 32) Int) Unit!30752)

(assert (=> b!908000 (= lt!409403 (lemmaListMapApplyFromThenApplyFromZero!57 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 lt!409400 i!717 defaultEntry!1160))))

(assert (= (and start!77792 res!612883) b!907997))

(assert (= (and b!907997 res!612877) b!907991))

(assert (= (and b!907991 res!612879) b!907998))

(assert (= (and b!907998 res!612882) b!907989))

(assert (= (and b!907989 res!612876) b!907994))

(assert (= (and b!907994 res!612880) b!907999))

(assert (= (and b!907999 res!612878) b!907995))

(assert (= (and b!907995 (not res!612874)) b!907988))

(assert (= (and b!907988 (not res!612881)) b!907996))

(assert (= (and b!907996 (not res!612875)) b!908000))

(assert (= (and b!907990 condMapEmpty!29896) mapIsEmpty!29896))

(assert (= (and b!907990 (not condMapEmpty!29896)) mapNonEmpty!29896))

(get-info :version)

(assert (= (and mapNonEmpty!29896 ((_ is ValueCellFull!8912) mapValue!29896)) b!907993))

(assert (= (and b!907990 ((_ is ValueCellFull!8912) mapDefault!29896)) b!907992))

(assert (= start!77792 b!907990))

(declare-fun b_lambda!13235 () Bool)

(assert (=> (not b_lambda!13235) (not b!907995)))

(declare-fun t!25648 () Bool)

(declare-fun tb!5383 () Bool)

(assert (=> (and start!77792 (= defaultEntry!1160 defaultEntry!1160) t!25648) tb!5383))

(declare-fun result!10571 () Bool)

(assert (=> tb!5383 (= result!10571 tp_is_empty!18787)))

(assert (=> b!907995 t!25648))

(declare-fun b_and!26871 () Bool)

(assert (= b_and!26869 (and (=> t!25648 result!10571) b_and!26871)))

(declare-fun m!842811 () Bool)

(assert (=> b!907996 m!842811))

(declare-fun m!842813 () Bool)

(assert (=> start!77792 m!842813))

(declare-fun m!842815 () Bool)

(assert (=> start!77792 m!842815))

(declare-fun m!842817 () Bool)

(assert (=> start!77792 m!842817))

(declare-fun m!842819 () Bool)

(assert (=> b!907998 m!842819))

(declare-fun m!842821 () Bool)

(assert (=> b!908000 m!842821))

(declare-fun m!842823 () Bool)

(assert (=> b!908000 m!842823))

(declare-fun m!842825 () Bool)

(assert (=> b!907988 m!842825))

(declare-fun m!842827 () Bool)

(assert (=> b!907988 m!842827))

(declare-fun m!842829 () Bool)

(assert (=> b!907991 m!842829))

(declare-fun m!842831 () Bool)

(assert (=> b!907989 m!842831))

(declare-fun m!842833 () Bool)

(assert (=> b!907989 m!842833))

(declare-fun m!842835 () Bool)

(assert (=> b!907999 m!842835))

(declare-fun m!842837 () Bool)

(assert (=> b!907994 m!842837))

(declare-fun m!842839 () Bool)

(assert (=> b!907995 m!842839))

(declare-fun m!842841 () Bool)

(assert (=> b!907995 m!842841))

(declare-fun m!842843 () Bool)

(assert (=> b!907995 m!842843))

(declare-fun m!842845 () Bool)

(assert (=> b!907995 m!842845))

(assert (=> b!907995 m!842839))

(assert (=> b!907995 m!842843))

(declare-fun m!842847 () Bool)

(assert (=> b!907995 m!842847))

(declare-fun m!842849 () Bool)

(assert (=> mapNonEmpty!29896 m!842849))

(check-sat (not b!907994) (not mapNonEmpty!29896) (not b_lambda!13235) (not b!907995) (not b!907988) (not b!907996) (not b!907998) (not b!908000) (not b_next!16369) (not start!77792) tp_is_empty!18787 (not b!907989) b_and!26871 (not b!907991))
(check-sat b_and!26871 (not b_next!16369))
