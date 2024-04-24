; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77808 () Bool)

(assert start!77808)

(declare-fun b_free!16225 () Bool)

(declare-fun b_next!16225 () Bool)

(assert (=> start!77808 (= b_free!16225 (not b_next!16225))))

(declare-fun tp!56937 () Bool)

(declare-fun b_and!26613 () Bool)

(assert (=> start!77808 (= tp!56937 b_and!26613)))

(declare-fun b!906026 () Bool)

(declare-fun res!611112 () Bool)

(declare-fun e!507778 () Bool)

(assert (=> b!906026 (=> (not res!611112) (not e!507778))))

(declare-datatypes ((V!29823 0))(
  ( (V!29824 (val!9372 Int)) )
))
(declare-datatypes ((ValueCell!8840 0))(
  ( (ValueCellFull!8840 (v!11874 V!29823)) (EmptyCell!8840) )
))
(declare-datatypes ((array!53373 0))(
  ( (array!53374 (arr!25641 (Array (_ BitVec 32) ValueCell!8840)) (size!26101 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53373)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-datatypes ((array!53375 0))(
  ( (array!53376 (arr!25642 (Array (_ BitVec 32) (_ BitVec 64))) (size!26102 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53375)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(assert (=> b!906026 (= res!611112 (and (= (size!26101 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26102 _keys!1386) (size!26101 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!906027 () Bool)

(declare-fun res!611109 () Bool)

(assert (=> b!906027 (=> (not res!611109) (not e!507778))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53375 (_ BitVec 32)) Bool)

(assert (=> b!906027 (= res!611109 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!906028 () Bool)

(declare-fun e!507780 () Bool)

(declare-fun e!507777 () Bool)

(declare-fun mapRes!29677 () Bool)

(assert (=> b!906028 (= e!507780 (and e!507777 mapRes!29677))))

(declare-fun condMapEmpty!29677 () Bool)

(declare-fun mapDefault!29677 () ValueCell!8840)

(assert (=> b!906028 (= condMapEmpty!29677 (= (arr!25641 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8840)) mapDefault!29677)))))

(declare-fun b!906029 () Bool)

(declare-fun e!507782 () Bool)

(assert (=> b!906029 (= e!507778 e!507782)))

(declare-fun res!611105 () Bool)

(assert (=> b!906029 (=> (not res!611105) (not e!507782))))

(declare-datatypes ((tuple2!12120 0))(
  ( (tuple2!12121 (_1!6071 (_ BitVec 64)) (_2!6071 V!29823)) )
))
(declare-datatypes ((List!17963 0))(
  ( (Nil!17960) (Cons!17959 (h!19111 tuple2!12120) (t!25352 List!17963)) )
))
(declare-datatypes ((ListLongMap!10819 0))(
  ( (ListLongMap!10820 (toList!5425 List!17963)) )
))
(declare-fun lt!408800 () ListLongMap!10819)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun contains!4480 (ListLongMap!10819 (_ BitVec 64)) Bool)

(assert (=> b!906029 (= res!611105 (contains!4480 lt!408800 k0!1033))))

(declare-fun zeroValue!1094 () V!29823)

(declare-fun minValue!1094 () V!29823)

(declare-fun defaultEntry!1160 () Int)

(declare-fun getCurrentListMap!2691 (array!53375 array!53373 (_ BitVec 32) (_ BitVec 32) V!29823 V!29823 (_ BitVec 32) Int) ListLongMap!10819)

(assert (=> b!906029 (= lt!408800 (getCurrentListMap!2691 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun b!906030 () Bool)

(declare-fun res!611104 () Bool)

(assert (=> b!906030 (=> (not res!611104) (not e!507782))))

(declare-fun i!717 () (_ BitVec 32))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!906030 (= res!611104 (inRange!0 i!717 mask!1756))))

(declare-fun b!906031 () Bool)

(declare-fun res!611111 () Bool)

(assert (=> b!906031 (=> (not res!611111) (not e!507778))))

(declare-datatypes ((List!17964 0))(
  ( (Nil!17961) (Cons!17960 (h!19112 (_ BitVec 64)) (t!25353 List!17964)) )
))
(declare-fun arrayNoDuplicates!0 (array!53375 (_ BitVec 32) List!17964) Bool)

(assert (=> b!906031 (= res!611111 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!17961))))

(declare-fun b!906032 () Bool)

(declare-fun e!507776 () Bool)

(assert (=> b!906032 (= e!507782 (not e!507776))))

(declare-fun res!611107 () Bool)

(assert (=> b!906032 (=> res!611107 e!507776)))

(assert (=> b!906032 (= res!611107 (or (bvslt i!717 #b00000000000000000000000000000000) (bvsge i!717 (size!26102 _keys!1386))))))

(declare-fun lt!408799 () V!29823)

(declare-fun get!13481 (ValueCell!8840 V!29823) V!29823)

(declare-fun dynLambda!1341 (Int (_ BitVec 64)) V!29823)

(assert (=> b!906032 (= lt!408799 (get!13481 (select (arr!25641 _values!1152) i!717) (dynLambda!1341 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!53375 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!906032 (arrayContainsKey!0 _keys!1386 k0!1033 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!30706 0))(
  ( (Unit!30707) )
))
(declare-fun lt!408802 () Unit!30706)

(declare-fun lemmaKeyInListMapIsInArray!200 (array!53375 array!53373 (_ BitVec 32) (_ BitVec 32) V!29823 V!29823 (_ BitVec 64) Int) Unit!30706)

(assert (=> b!906032 (= lt!408802 (lemmaKeyInListMapIsInArray!200 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 defaultEntry!1160))))

(declare-fun b!906033 () Bool)

(declare-fun e!507783 () Bool)

(assert (=> b!906033 (= e!507783 true)))

(declare-fun apply!449 (ListLongMap!10819 (_ BitVec 64)) V!29823)

(assert (=> b!906033 (= (apply!449 lt!408800 k0!1033) lt!408799)))

(declare-fun lt!408801 () Unit!30706)

(declare-fun lemmaListMapApplyFromThenApplyFromZero!5 (array!53375 array!53373 (_ BitVec 32) (_ BitVec 32) V!29823 V!29823 (_ BitVec 64) V!29823 (_ BitVec 32) Int) Unit!30706)

(assert (=> b!906033 (= lt!408801 (lemmaListMapApplyFromThenApplyFromZero!5 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 lt!408799 i!717 defaultEntry!1160))))

(declare-fun res!611113 () Bool)

(assert (=> start!77808 (=> (not res!611113) (not e!507778))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77808 (= res!611113 (validMask!0 mask!1756))))

(assert (=> start!77808 e!507778))

(declare-fun array_inv!20148 (array!53373) Bool)

(assert (=> start!77808 (and (array_inv!20148 _values!1152) e!507780)))

(assert (=> start!77808 tp!56937))

(assert (=> start!77808 true))

(declare-fun tp_is_empty!18643 () Bool)

(assert (=> start!77808 tp_is_empty!18643))

(declare-fun array_inv!20149 (array!53375) Bool)

(assert (=> start!77808 (array_inv!20149 _keys!1386)))

(declare-fun mapIsEmpty!29677 () Bool)

(assert (=> mapIsEmpty!29677 mapRes!29677))

(declare-fun b!906034 () Bool)

(assert (=> b!906034 (= e!507776 e!507783)))

(declare-fun res!611108 () Bool)

(assert (=> b!906034 (=> res!611108 e!507783)))

(declare-fun lt!408798 () ListLongMap!10819)

(assert (=> b!906034 (= res!611108 (not (contains!4480 lt!408798 k0!1033)))))

(assert (=> b!906034 (= lt!408798 (getCurrentListMap!2691 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))

(declare-fun b!906035 () Bool)

(declare-fun res!611110 () Bool)

(assert (=> b!906035 (=> (not res!611110) (not e!507782))))

(assert (=> b!906035 (= res!611110 (and (= (select (arr!25642 _keys!1386) i!717) k0!1033) (not (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!906036 () Bool)

(declare-fun e!507779 () Bool)

(assert (=> b!906036 (= e!507779 tp_is_empty!18643)))

(declare-fun b!906037 () Bool)

(declare-fun res!611106 () Bool)

(assert (=> b!906037 (=> res!611106 e!507783)))

(assert (=> b!906037 (= res!611106 (not (= (apply!449 lt!408798 k0!1033) lt!408799)))))

(declare-fun b!906038 () Bool)

(assert (=> b!906038 (= e!507777 tp_is_empty!18643)))

(declare-fun mapNonEmpty!29677 () Bool)

(declare-fun tp!56938 () Bool)

(assert (=> mapNonEmpty!29677 (= mapRes!29677 (and tp!56938 e!507779))))

(declare-fun mapRest!29677 () (Array (_ BitVec 32) ValueCell!8840))

(declare-fun mapValue!29677 () ValueCell!8840)

(declare-fun mapKey!29677 () (_ BitVec 32))

(assert (=> mapNonEmpty!29677 (= (arr!25641 _values!1152) (store mapRest!29677 mapKey!29677 mapValue!29677))))

(assert (= (and start!77808 res!611113) b!906026))

(assert (= (and b!906026 res!611112) b!906027))

(assert (= (and b!906027 res!611109) b!906031))

(assert (= (and b!906031 res!611111) b!906029))

(assert (= (and b!906029 res!611105) b!906030))

(assert (= (and b!906030 res!611104) b!906035))

(assert (= (and b!906035 res!611110) b!906032))

(assert (= (and b!906032 (not res!611107)) b!906034))

(assert (= (and b!906034 (not res!611108)) b!906037))

(assert (= (and b!906037 (not res!611106)) b!906033))

(assert (= (and b!906028 condMapEmpty!29677) mapIsEmpty!29677))

(assert (= (and b!906028 (not condMapEmpty!29677)) mapNonEmpty!29677))

(get-info :version)

(assert (= (and mapNonEmpty!29677 ((_ is ValueCellFull!8840) mapValue!29677)) b!906036))

(assert (= (and b!906028 ((_ is ValueCellFull!8840) mapDefault!29677)) b!906038))

(assert (= start!77808 b!906028))

(declare-fun b_lambda!13113 () Bool)

(assert (=> (not b_lambda!13113) (not b!906032)))

(declare-fun t!25351 () Bool)

(declare-fun tb!5239 () Bool)

(assert (=> (and start!77808 (= defaultEntry!1160 defaultEntry!1160) t!25351) tb!5239))

(declare-fun result!10281 () Bool)

(assert (=> tb!5239 (= result!10281 tp_is_empty!18643)))

(assert (=> b!906032 t!25351))

(declare-fun b_and!26615 () Bool)

(assert (= b_and!26613 (and (=> t!25351 result!10281) b_and!26615)))

(declare-fun m!841829 () Bool)

(assert (=> b!906030 m!841829))

(declare-fun m!841831 () Bool)

(assert (=> start!77808 m!841831))

(declare-fun m!841833 () Bool)

(assert (=> start!77808 m!841833))

(declare-fun m!841835 () Bool)

(assert (=> start!77808 m!841835))

(declare-fun m!841837 () Bool)

(assert (=> b!906034 m!841837))

(declare-fun m!841839 () Bool)

(assert (=> b!906034 m!841839))

(declare-fun m!841841 () Bool)

(assert (=> mapNonEmpty!29677 m!841841))

(declare-fun m!841843 () Bool)

(assert (=> b!906031 m!841843))

(declare-fun m!841845 () Bool)

(assert (=> b!906037 m!841845))

(declare-fun m!841847 () Bool)

(assert (=> b!906033 m!841847))

(declare-fun m!841849 () Bool)

(assert (=> b!906033 m!841849))

(declare-fun m!841851 () Bool)

(assert (=> b!906027 m!841851))

(declare-fun m!841853 () Bool)

(assert (=> b!906032 m!841853))

(declare-fun m!841855 () Bool)

(assert (=> b!906032 m!841855))

(declare-fun m!841857 () Bool)

(assert (=> b!906032 m!841857))

(declare-fun m!841859 () Bool)

(assert (=> b!906032 m!841859))

(assert (=> b!906032 m!841853))

(assert (=> b!906032 m!841857))

(declare-fun m!841861 () Bool)

(assert (=> b!906032 m!841861))

(declare-fun m!841863 () Bool)

(assert (=> b!906035 m!841863))

(declare-fun m!841865 () Bool)

(assert (=> b!906029 m!841865))

(declare-fun m!841867 () Bool)

(assert (=> b!906029 m!841867))

(check-sat (not b!906037) (not b!906033) (not b!906027) (not b!906032) tp_is_empty!18643 (not start!77808) (not b_lambda!13113) b_and!26615 (not b!906034) (not mapNonEmpty!29677) (not b!906029) (not b_next!16225) (not b!906030) (not b!906031))
(check-sat b_and!26615 (not b_next!16225))
