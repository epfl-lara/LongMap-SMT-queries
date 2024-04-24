; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78202 () Bool)

(assert start!78202)

(declare-fun b_free!16561 () Bool)

(declare-fun b_next!16561 () Bool)

(assert (=> start!78202 (= b_free!16561 (not b_next!16561))))

(declare-fun tp!57954 () Bool)

(declare-fun b_and!27143 () Bool)

(assert (=> start!78202 (= tp!57954 b_and!27143)))

(declare-fun b!911808 () Bool)

(declare-fun e!511376 () Bool)

(declare-fun tp_is_empty!18979 () Bool)

(assert (=> b!911808 (= e!511376 tp_is_empty!18979)))

(declare-fun res!614973 () Bool)

(declare-fun e!511377 () Bool)

(assert (=> start!78202 (=> (not res!614973) (not e!511377))))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78202 (= res!614973 (validMask!0 mask!1756))))

(assert (=> start!78202 e!511377))

(declare-datatypes ((V!30271 0))(
  ( (V!30272 (val!9540 Int)) )
))
(declare-datatypes ((ValueCell!9008 0))(
  ( (ValueCellFull!9008 (v!12046 V!30271)) (EmptyCell!9008) )
))
(declare-datatypes ((array!54029 0))(
  ( (array!54030 (arr!25966 (Array (_ BitVec 32) ValueCell!9008)) (size!26426 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!54029)

(declare-fun e!511373 () Bool)

(declare-fun array_inv!20374 (array!54029) Bool)

(assert (=> start!78202 (and (array_inv!20374 _values!1152) e!511373)))

(assert (=> start!78202 tp!57954))

(assert (=> start!78202 true))

(assert (=> start!78202 tp_is_empty!18979))

(declare-datatypes ((array!54031 0))(
  ( (array!54032 (arr!25967 (Array (_ BitVec 32) (_ BitVec 64))) (size!26427 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!54031)

(declare-fun array_inv!20375 (array!54031) Bool)

(assert (=> start!78202 (array_inv!20375 _keys!1386)))

(declare-fun b!911809 () Bool)

(declare-fun e!511375 () Bool)

(assert (=> b!911809 (= e!511375 tp_is_empty!18979)))

(declare-fun mapNonEmpty!30190 () Bool)

(declare-fun mapRes!30190 () Bool)

(declare-fun tp!57955 () Bool)

(assert (=> mapNonEmpty!30190 (= mapRes!30190 (and tp!57955 e!511376))))

(declare-fun mapRest!30190 () (Array (_ BitVec 32) ValueCell!9008))

(declare-fun mapKey!30190 () (_ BitVec 32))

(declare-fun mapValue!30190 () ValueCell!9008)

(assert (=> mapNonEmpty!30190 (= (arr!25966 _values!1152) (store mapRest!30190 mapKey!30190 mapValue!30190))))

(declare-fun b!911810 () Bool)

(declare-fun res!614972 () Bool)

(assert (=> b!911810 (=> (not res!614972) (not e!511377))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54031 (_ BitVec 32)) Bool)

(assert (=> b!911810 (= res!614972 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun mapIsEmpty!30190 () Bool)

(assert (=> mapIsEmpty!30190 mapRes!30190))

(declare-fun b!911811 () Bool)

(assert (=> b!911811 (= e!511377 false)))

(declare-fun lt!410685 () Bool)

(declare-fun zeroValue!1094 () V!30271)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!30271)

(declare-fun defaultEntry!1160 () Int)

(declare-datatypes ((tuple2!12392 0))(
  ( (tuple2!12393 (_1!6207 (_ BitVec 64)) (_2!6207 V!30271)) )
))
(declare-datatypes ((List!18213 0))(
  ( (Nil!18210) (Cons!18209 (h!19361 tuple2!12392) (t!25790 List!18213)) )
))
(declare-datatypes ((ListLongMap!11091 0))(
  ( (ListLongMap!11092 (toList!5561 List!18213)) )
))
(declare-fun contains!4614 (ListLongMap!11091 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2822 (array!54031 array!54029 (_ BitVec 32) (_ BitVec 32) V!30271 V!30271 (_ BitVec 32) Int) ListLongMap!11091)

(assert (=> b!911811 (= lt!410685 (contains!4614 (getCurrentListMap!2822 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(declare-fun b!911812 () Bool)

(declare-fun res!614975 () Bool)

(assert (=> b!911812 (=> (not res!614975) (not e!511377))))

(declare-datatypes ((List!18214 0))(
  ( (Nil!18211) (Cons!18210 (h!19362 (_ BitVec 64)) (t!25791 List!18214)) )
))
(declare-fun arrayNoDuplicates!0 (array!54031 (_ BitVec 32) List!18214) Bool)

(assert (=> b!911812 (= res!614975 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18211))))

(declare-fun b!911813 () Bool)

(assert (=> b!911813 (= e!511373 (and e!511375 mapRes!30190))))

(declare-fun condMapEmpty!30190 () Bool)

(declare-fun mapDefault!30190 () ValueCell!9008)

(assert (=> b!911813 (= condMapEmpty!30190 (= (arr!25966 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!9008)) mapDefault!30190)))))

(declare-fun b!911814 () Bool)

(declare-fun res!614974 () Bool)

(assert (=> b!911814 (=> (not res!614974) (not e!511377))))

(assert (=> b!911814 (= res!614974 (and (= (size!26426 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26427 _keys!1386) (size!26426 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(assert (= (and start!78202 res!614973) b!911814))

(assert (= (and b!911814 res!614974) b!911810))

(assert (= (and b!911810 res!614972) b!911812))

(assert (= (and b!911812 res!614975) b!911811))

(assert (= (and b!911813 condMapEmpty!30190) mapIsEmpty!30190))

(assert (= (and b!911813 (not condMapEmpty!30190)) mapNonEmpty!30190))

(get-info :version)

(assert (= (and mapNonEmpty!30190 ((_ is ValueCellFull!9008) mapValue!30190)) b!911808))

(assert (= (and b!911813 ((_ is ValueCellFull!9008) mapDefault!30190)) b!911809))

(assert (= start!78202 b!911813))

(declare-fun m!847087 () Bool)

(assert (=> start!78202 m!847087))

(declare-fun m!847089 () Bool)

(assert (=> start!78202 m!847089))

(declare-fun m!847091 () Bool)

(assert (=> start!78202 m!847091))

(declare-fun m!847093 () Bool)

(assert (=> b!911812 m!847093))

(declare-fun m!847095 () Bool)

(assert (=> b!911810 m!847095))

(declare-fun m!847097 () Bool)

(assert (=> mapNonEmpty!30190 m!847097))

(declare-fun m!847099 () Bool)

(assert (=> b!911811 m!847099))

(assert (=> b!911811 m!847099))

(declare-fun m!847101 () Bool)

(assert (=> b!911811 m!847101))

(check-sat (not b!911810) b_and!27143 (not b!911811) tp_is_empty!18979 (not b_next!16561) (not b!911812) (not mapNonEmpty!30190) (not start!78202))
(check-sat b_and!27143 (not b_next!16561))
