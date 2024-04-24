; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77978 () Bool)

(assert start!77978)

(declare-fun b_free!16369 () Bool)

(declare-fun b_next!16369 () Bool)

(assert (=> start!77978 (= b_free!16369 (not b_next!16369))))

(declare-fun tp!57373 () Bool)

(declare-fun b_and!26905 () Bool)

(assert (=> start!77978 (= tp!57373 b_and!26905)))

(declare-fun res!613334 () Bool)

(declare-fun e!509610 () Bool)

(assert (=> start!77978 (=> (not res!613334) (not e!509610))))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77978 (= res!613334 (validMask!0 mask!1756))))

(assert (=> start!77978 e!509610))

(declare-datatypes ((V!30015 0))(
  ( (V!30016 (val!9444 Int)) )
))
(declare-datatypes ((ValueCell!8912 0))(
  ( (ValueCellFull!8912 (v!11948 V!30015)) (EmptyCell!8912) )
))
(declare-datatypes ((array!53651 0))(
  ( (array!53652 (arr!25779 (Array (_ BitVec 32) ValueCell!8912)) (size!26239 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53651)

(declare-fun e!509609 () Bool)

(declare-fun array_inv!20242 (array!53651) Bool)

(assert (=> start!77978 (and (array_inv!20242 _values!1152) e!509609)))

(assert (=> start!77978 tp!57373))

(assert (=> start!77978 true))

(declare-fun tp_is_empty!18787 () Bool)

(assert (=> start!77978 tp_is_empty!18787))

(declare-datatypes ((array!53653 0))(
  ( (array!53654 (arr!25780 (Array (_ BitVec 32) (_ BitVec 64))) (size!26240 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53653)

(declare-fun array_inv!20243 (array!53653) Bool)

(assert (=> start!77978 (array_inv!20243 _keys!1386)))

(declare-fun b!909130 () Bool)

(declare-fun res!613328 () Bool)

(assert (=> b!909130 (=> (not res!613328) (not e!509610))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53653 (_ BitVec 32)) Bool)

(assert (=> b!909130 (= res!613328 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!909131 () Bool)

(declare-fun e!509607 () Bool)

(declare-fun mapRes!29896 () Bool)

(assert (=> b!909131 (= e!509609 (and e!509607 mapRes!29896))))

(declare-fun condMapEmpty!29896 () Bool)

(declare-fun mapDefault!29896 () ValueCell!8912)

(assert (=> b!909131 (= condMapEmpty!29896 (= (arr!25779 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8912)) mapDefault!29896)))))

(declare-fun b!909132 () Bool)

(declare-fun e!509606 () Bool)

(declare-fun e!509613 () Bool)

(assert (=> b!909132 (= e!509606 (not e!509613))))

(declare-fun res!613335 () Bool)

(assert (=> b!909132 (=> res!613335 e!509613)))

(declare-fun i!717 () (_ BitVec 32))

(assert (=> b!909132 (= res!613335 (or (bvslt i!717 #b00000000000000000000000000000000) (bvsge i!717 (size!26240 _keys!1386))))))

(declare-fun defaultEntry!1160 () Int)

(declare-fun lt!410001 () V!30015)

(declare-fun get!13578 (ValueCell!8912 V!30015) V!30015)

(declare-fun dynLambda!1387 (Int (_ BitVec 64)) V!30015)

(assert (=> b!909132 (= lt!410001 (get!13578 (select (arr!25779 _values!1152) i!717) (dynLambda!1387 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!53653 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!909132 (arrayContainsKey!0 _keys!1386 k0!1033 #b00000000000000000000000000000000)))

(declare-fun zeroValue!1094 () V!30015)

(declare-datatypes ((Unit!30814 0))(
  ( (Unit!30815) )
))
(declare-fun lt!410000 () Unit!30814)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!30015)

(declare-fun lemmaKeyInListMapIsInArray!246 (array!53653 array!53651 (_ BitVec 32) (_ BitVec 32) V!30015 V!30015 (_ BitVec 64) Int) Unit!30814)

(assert (=> b!909132 (= lt!410000 (lemmaKeyInListMapIsInArray!246 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 defaultEntry!1160))))

(declare-fun b!909133 () Bool)

(assert (=> b!909133 (= e!509607 tp_is_empty!18787)))

(declare-fun b!909134 () Bool)

(declare-fun res!613332 () Bool)

(assert (=> b!909134 (=> (not res!613332) (not e!509610))))

(declare-datatypes ((List!18070 0))(
  ( (Nil!18067) (Cons!18066 (h!19218 (_ BitVec 64)) (t!25603 List!18070)) )
))
(declare-fun arrayNoDuplicates!0 (array!53653 (_ BitVec 32) List!18070) Bool)

(assert (=> b!909134 (= res!613332 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18067))))

(declare-fun b!909135 () Bool)

(assert (=> b!909135 (= e!509610 e!509606)))

(declare-fun res!613337 () Bool)

(assert (=> b!909135 (=> (not res!613337) (not e!509606))))

(declare-datatypes ((tuple2!12244 0))(
  ( (tuple2!12245 (_1!6133 (_ BitVec 64)) (_2!6133 V!30015)) )
))
(declare-datatypes ((List!18071 0))(
  ( (Nil!18068) (Cons!18067 (h!19219 tuple2!12244) (t!25604 List!18071)) )
))
(declare-datatypes ((ListLongMap!10943 0))(
  ( (ListLongMap!10944 (toList!5487 List!18071)) )
))
(declare-fun lt!409997 () ListLongMap!10943)

(declare-fun contains!4540 (ListLongMap!10943 (_ BitVec 64)) Bool)

(assert (=> b!909135 (= res!613337 (contains!4540 lt!409997 k0!1033))))

(declare-fun getCurrentListMap!2750 (array!53653 array!53651 (_ BitVec 32) (_ BitVec 32) V!30015 V!30015 (_ BitVec 32) Int) ListLongMap!10943)

(assert (=> b!909135 (= lt!409997 (getCurrentListMap!2750 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun b!909136 () Bool)

(declare-fun res!613330 () Bool)

(assert (=> b!909136 (=> (not res!613330) (not e!509610))))

(assert (=> b!909136 (= res!613330 (and (= (size!26239 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26240 _keys!1386) (size!26239 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!909137 () Bool)

(declare-fun e!509608 () Bool)

(assert (=> b!909137 (= e!509613 e!509608)))

(declare-fun res!613331 () Bool)

(assert (=> b!909137 (=> res!613331 e!509608)))

(declare-fun lt!409999 () ListLongMap!10943)

(assert (=> b!909137 (= res!613331 (not (contains!4540 lt!409999 k0!1033)))))

(assert (=> b!909137 (= lt!409999 (getCurrentListMap!2750 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))

(declare-fun b!909138 () Bool)

(declare-fun e!509611 () Bool)

(assert (=> b!909138 (= e!509611 tp_is_empty!18787)))

(declare-fun b!909139 () Bool)

(declare-fun res!613333 () Bool)

(assert (=> b!909139 (=> res!613333 e!509608)))

(declare-fun apply!503 (ListLongMap!10943 (_ BitVec 64)) V!30015)

(assert (=> b!909139 (= res!613333 (not (= (apply!503 lt!409999 k0!1033) lt!410001)))))

(declare-fun mapIsEmpty!29896 () Bool)

(assert (=> mapIsEmpty!29896 mapRes!29896))

(declare-fun b!909140 () Bool)

(declare-fun res!613329 () Bool)

(assert (=> b!909140 (=> (not res!613329) (not e!509606))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!909140 (= res!613329 (inRange!0 i!717 mask!1756))))

(declare-fun b!909141 () Bool)

(declare-fun res!613336 () Bool)

(assert (=> b!909141 (=> (not res!613336) (not e!509606))))

(assert (=> b!909141 (= res!613336 (and (= (select (arr!25780 _keys!1386) i!717) k0!1033) (not (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!29896 () Bool)

(declare-fun tp!57372 () Bool)

(assert (=> mapNonEmpty!29896 (= mapRes!29896 (and tp!57372 e!509611))))

(declare-fun mapValue!29896 () ValueCell!8912)

(declare-fun mapKey!29896 () (_ BitVec 32))

(declare-fun mapRest!29896 () (Array (_ BitVec 32) ValueCell!8912))

(assert (=> mapNonEmpty!29896 (= (arr!25779 _values!1152) (store mapRest!29896 mapKey!29896 mapValue!29896))))

(declare-fun b!909142 () Bool)

(assert (=> b!909142 (= e!509608 true)))

(assert (=> b!909142 (= (apply!503 lt!409997 k0!1033) lt!410001)))

(declare-fun lt!409998 () Unit!30814)

(declare-fun lemmaListMapApplyFromThenApplyFromZero!50 (array!53653 array!53651 (_ BitVec 32) (_ BitVec 32) V!30015 V!30015 (_ BitVec 64) V!30015 (_ BitVec 32) Int) Unit!30814)

(assert (=> b!909142 (= lt!409998 (lemmaListMapApplyFromThenApplyFromZero!50 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 lt!410001 i!717 defaultEntry!1160))))

(assert (= (and start!77978 res!613334) b!909136))

(assert (= (and b!909136 res!613330) b!909130))

(assert (= (and b!909130 res!613328) b!909134))

(assert (= (and b!909134 res!613332) b!909135))

(assert (= (and b!909135 res!613337) b!909140))

(assert (= (and b!909140 res!613329) b!909141))

(assert (= (and b!909141 res!613336) b!909132))

(assert (= (and b!909132 (not res!613335)) b!909137))

(assert (= (and b!909137 (not res!613331)) b!909139))

(assert (= (and b!909139 (not res!613333)) b!909142))

(assert (= (and b!909131 condMapEmpty!29896) mapIsEmpty!29896))

(assert (= (and b!909131 (not condMapEmpty!29896)) mapNonEmpty!29896))

(get-info :version)

(assert (= (and mapNonEmpty!29896 ((_ is ValueCellFull!8912) mapValue!29896)) b!909138))

(assert (= (and b!909131 ((_ is ValueCellFull!8912) mapDefault!29896)) b!909133))

(assert (= start!77978 b!909131))

(declare-fun b_lambda!13267 () Bool)

(assert (=> (not b_lambda!13267) (not b!909132)))

(declare-fun t!25602 () Bool)

(declare-fun tb!5383 () Bool)

(assert (=> (and start!77978 (= defaultEntry!1160 defaultEntry!1160) t!25602) tb!5383))

(declare-fun result!10571 () Bool)

(assert (=> tb!5383 (= result!10571 tp_is_empty!18787)))

(assert (=> b!909132 t!25602))

(declare-fun b_and!26907 () Bool)

(assert (= b_and!26905 (and (=> t!25602 result!10571) b_and!26907)))

(declare-fun m!844863 () Bool)

(assert (=> b!909139 m!844863))

(declare-fun m!844865 () Bool)

(assert (=> b!909140 m!844865))

(declare-fun m!844867 () Bool)

(assert (=> b!909141 m!844867))

(declare-fun m!844869 () Bool)

(assert (=> b!909135 m!844869))

(declare-fun m!844871 () Bool)

(assert (=> b!909135 m!844871))

(declare-fun m!844873 () Bool)

(assert (=> b!909130 m!844873))

(declare-fun m!844875 () Bool)

(assert (=> b!909137 m!844875))

(declare-fun m!844877 () Bool)

(assert (=> b!909137 m!844877))

(declare-fun m!844879 () Bool)

(assert (=> b!909142 m!844879))

(declare-fun m!844881 () Bool)

(assert (=> b!909142 m!844881))

(declare-fun m!844883 () Bool)

(assert (=> b!909134 m!844883))

(declare-fun m!844885 () Bool)

(assert (=> start!77978 m!844885))

(declare-fun m!844887 () Bool)

(assert (=> start!77978 m!844887))

(declare-fun m!844889 () Bool)

(assert (=> start!77978 m!844889))

(declare-fun m!844891 () Bool)

(assert (=> b!909132 m!844891))

(declare-fun m!844893 () Bool)

(assert (=> b!909132 m!844893))

(declare-fun m!844895 () Bool)

(assert (=> b!909132 m!844895))

(declare-fun m!844897 () Bool)

(assert (=> b!909132 m!844897))

(assert (=> b!909132 m!844891))

(assert (=> b!909132 m!844895))

(declare-fun m!844899 () Bool)

(assert (=> b!909132 m!844899))

(declare-fun m!844901 () Bool)

(assert (=> mapNonEmpty!29896 m!844901))

(check-sat (not b!909132) (not b!909139) (not b!909130) b_and!26907 (not b!909134) (not b_lambda!13267) tp_is_empty!18787 (not b!909135) (not b!909142) (not b_next!16369) (not b!909137) (not start!77978) (not b!909140) (not mapNonEmpty!29896))
(check-sat b_and!26907 (not b_next!16369))
