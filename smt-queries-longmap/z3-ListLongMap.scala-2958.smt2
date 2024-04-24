; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41970 () Bool)

(assert start!41970)

(declare-fun b_free!11557 () Bool)

(declare-fun b_next!11557 () Bool)

(assert (=> start!41970 (= b_free!11557 (not b_next!11557))))

(declare-fun tp!40686 () Bool)

(declare-fun b_and!19965 () Bool)

(assert (=> start!41970 (= tp!40686 b_and!19965)))

(declare-fun b!468677 () Bool)

(declare-fun e!274336 () Bool)

(declare-fun e!274340 () Bool)

(assert (=> b!468677 (= e!274336 (not e!274340))))

(declare-fun res!280114 () Bool)

(assert (=> b!468677 (=> res!280114 e!274340)))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(assert (=> b!468677 (= res!280114 (or (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!18419 0))(
  ( (V!18420 (val!6537 Int)) )
))
(declare-datatypes ((tuple2!8512 0))(
  ( (tuple2!8513 (_1!4267 (_ BitVec 64)) (_2!4267 V!18419)) )
))
(declare-datatypes ((List!8588 0))(
  ( (Nil!8585) (Cons!8584 (h!9440 tuple2!8512) (t!14538 List!8588)) )
))
(declare-datatypes ((ListLongMap!7427 0))(
  ( (ListLongMap!7428 (toList!3729 List!8588)) )
))
(declare-fun lt!212117 () ListLongMap!7427)

(declare-fun lt!212114 () ListLongMap!7427)

(assert (=> b!468677 (= lt!212117 lt!212114)))

(declare-datatypes ((Unit!13667 0))(
  ( (Unit!13668) )
))
(declare-fun lt!212115 () Unit!13667)

(declare-fun minValueBefore!38 () V!18419)

(declare-fun zeroValue!794 () V!18419)

(declare-fun defaultEntry!841 () Int)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!29730 0))(
  ( (array!29731 (arr!14290 (Array (_ BitVec 32) (_ BitVec 64))) (size!14642 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29730)

(declare-datatypes ((ValueCell!6149 0))(
  ( (ValueCellFull!6149 (v!8827 V!18419)) (EmptyCell!6149) )
))
(declare-datatypes ((array!29732 0))(
  ( (array!29733 (arr!14291 (Array (_ BitVec 32) ValueCell!6149)) (size!14643 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29732)

(declare-fun minValueAfter!38 () V!18419)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!108 (array!29730 array!29732 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18419 V!18419 V!18419 V!18419 (_ BitVec 32) Int) Unit!13667)

(assert (=> b!468677 (= lt!212115 (lemmaNoChangeToArrayThenSameMapNoExtras!108 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1948 (array!29730 array!29732 (_ BitVec 32) (_ BitVec 32) V!18419 V!18419 (_ BitVec 32) Int) ListLongMap!7427)

(assert (=> b!468677 (= lt!212114 (getCurrentListMapNoExtraKeys!1948 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!468677 (= lt!212117 (getCurrentListMapNoExtraKeys!1948 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!468678 () Bool)

(assert (=> b!468678 (= e!274340 true)))

(declare-fun lt!212118 () tuple2!8512)

(declare-fun +!1691 (ListLongMap!7427 tuple2!8512) ListLongMap!7427)

(assert (=> b!468678 (= (+!1691 lt!212117 lt!212118) (+!1691 (+!1691 lt!212117 (tuple2!8513 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) lt!212118))))

(assert (=> b!468678 (= lt!212118 (tuple2!8513 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))

(declare-fun lt!212113 () Unit!13667)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!97 (ListLongMap!7427 (_ BitVec 64) V!18419 V!18419) Unit!13667)

(assert (=> b!468678 (= lt!212113 (addSameAsAddTwiceSameKeyDiffValues!97 lt!212117 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38 minValueAfter!38))))

(declare-fun lt!212116 () ListLongMap!7427)

(declare-fun getCurrentListMap!2157 (array!29730 array!29732 (_ BitVec 32) (_ BitVec 32) V!18419 V!18419 (_ BitVec 32) Int) ListLongMap!7427)

(assert (=> b!468678 (= lt!212116 (getCurrentListMap!2157 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!212119 () ListLongMap!7427)

(assert (=> b!468678 (= lt!212119 (getCurrentListMap!2157 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!468679 () Bool)

(declare-fun e!274335 () Bool)

(declare-fun tp_is_empty!12985 () Bool)

(assert (=> b!468679 (= e!274335 tp_is_empty!12985)))

(declare-fun b!468680 () Bool)

(declare-fun res!280115 () Bool)

(assert (=> b!468680 (=> (not res!280115) (not e!274336))))

(assert (=> b!468680 (= res!280115 (and (= (size!14643 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14642 _keys!1025) (size!14643 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!468681 () Bool)

(declare-fun e!274337 () Bool)

(assert (=> b!468681 (= e!274337 tp_is_empty!12985)))

(declare-fun mapNonEmpty!21172 () Bool)

(declare-fun mapRes!21172 () Bool)

(declare-fun tp!40687 () Bool)

(assert (=> mapNonEmpty!21172 (= mapRes!21172 (and tp!40687 e!274337))))

(declare-fun mapValue!21172 () ValueCell!6149)

(declare-fun mapKey!21172 () (_ BitVec 32))

(declare-fun mapRest!21172 () (Array (_ BitVec 32) ValueCell!6149))

(assert (=> mapNonEmpty!21172 (= (arr!14291 _values!833) (store mapRest!21172 mapKey!21172 mapValue!21172))))

(declare-fun b!468682 () Bool)

(declare-fun res!280117 () Bool)

(assert (=> b!468682 (=> (not res!280117) (not e!274336))))

(declare-datatypes ((List!8589 0))(
  ( (Nil!8586) (Cons!8585 (h!9441 (_ BitVec 64)) (t!14539 List!8589)) )
))
(declare-fun arrayNoDuplicates!0 (array!29730 (_ BitVec 32) List!8589) Bool)

(assert (=> b!468682 (= res!280117 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8586))))

(declare-fun b!468683 () Bool)

(declare-fun e!274339 () Bool)

(assert (=> b!468683 (= e!274339 (and e!274335 mapRes!21172))))

(declare-fun condMapEmpty!21172 () Bool)

(declare-fun mapDefault!21172 () ValueCell!6149)

(assert (=> b!468683 (= condMapEmpty!21172 (= (arr!14291 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6149)) mapDefault!21172)))))

(declare-fun b!468684 () Bool)

(declare-fun res!280116 () Bool)

(assert (=> b!468684 (=> (not res!280116) (not e!274336))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29730 (_ BitVec 32)) Bool)

(assert (=> b!468684 (= res!280116 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun mapIsEmpty!21172 () Bool)

(assert (=> mapIsEmpty!21172 mapRes!21172))

(declare-fun res!280113 () Bool)

(assert (=> start!41970 (=> (not res!280113) (not e!274336))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41970 (= res!280113 (validMask!0 mask!1365))))

(assert (=> start!41970 e!274336))

(assert (=> start!41970 tp_is_empty!12985))

(assert (=> start!41970 tp!40686))

(assert (=> start!41970 true))

(declare-fun array_inv!10404 (array!29730) Bool)

(assert (=> start!41970 (array_inv!10404 _keys!1025)))

(declare-fun array_inv!10405 (array!29732) Bool)

(assert (=> start!41970 (and (array_inv!10405 _values!833) e!274339)))

(assert (= (and start!41970 res!280113) b!468680))

(assert (= (and b!468680 res!280115) b!468684))

(assert (= (and b!468684 res!280116) b!468682))

(assert (= (and b!468682 res!280117) b!468677))

(assert (= (and b!468677 (not res!280114)) b!468678))

(assert (= (and b!468683 condMapEmpty!21172) mapIsEmpty!21172))

(assert (= (and b!468683 (not condMapEmpty!21172)) mapNonEmpty!21172))

(get-info :version)

(assert (= (and mapNonEmpty!21172 ((_ is ValueCellFull!6149) mapValue!21172)) b!468681))

(assert (= (and b!468683 ((_ is ValueCellFull!6149) mapDefault!21172)) b!468679))

(assert (= start!41970 b!468683))

(declare-fun m!450933 () Bool)

(assert (=> b!468684 m!450933))

(declare-fun m!450935 () Bool)

(assert (=> b!468678 m!450935))

(declare-fun m!450937 () Bool)

(assert (=> b!468678 m!450937))

(declare-fun m!450939 () Bool)

(assert (=> b!468678 m!450939))

(assert (=> b!468678 m!450939))

(declare-fun m!450941 () Bool)

(assert (=> b!468678 m!450941))

(declare-fun m!450943 () Bool)

(assert (=> b!468678 m!450943))

(declare-fun m!450945 () Bool)

(assert (=> b!468678 m!450945))

(declare-fun m!450947 () Bool)

(assert (=> start!41970 m!450947))

(declare-fun m!450949 () Bool)

(assert (=> start!41970 m!450949))

(declare-fun m!450951 () Bool)

(assert (=> start!41970 m!450951))

(declare-fun m!450953 () Bool)

(assert (=> mapNonEmpty!21172 m!450953))

(declare-fun m!450955 () Bool)

(assert (=> b!468677 m!450955))

(declare-fun m!450957 () Bool)

(assert (=> b!468677 m!450957))

(declare-fun m!450959 () Bool)

(assert (=> b!468677 m!450959))

(declare-fun m!450961 () Bool)

(assert (=> b!468682 m!450961))

(check-sat (not b!468682) (not b!468677) b_and!19965 (not b!468678) tp_is_empty!12985 (not mapNonEmpty!21172) (not b_next!11557) (not start!41970) (not b!468684))
(check-sat b_and!19965 (not b_next!11557))
