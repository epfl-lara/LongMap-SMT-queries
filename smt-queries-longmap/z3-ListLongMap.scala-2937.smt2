; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41814 () Bool)

(assert start!41814)

(declare-fun b_free!11431 () Bool)

(declare-fun b_next!11431 () Bool)

(assert (=> start!41814 (= b_free!11431 (not b_next!11431))))

(declare-fun tp!40302 () Bool)

(declare-fun b_and!19785 () Bool)

(assert (=> start!41814 (= tp!40302 b_and!19785)))

(declare-fun res!279037 () Bool)

(declare-fun e!273000 () Bool)

(assert (=> start!41814 (=> (not res!279037) (not e!273000))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41814 (= res!279037 (validMask!0 mask!1365))))

(assert (=> start!41814 e!273000))

(declare-fun tp_is_empty!12859 () Bool)

(assert (=> start!41814 tp_is_empty!12859))

(assert (=> start!41814 tp!40302))

(assert (=> start!41814 true))

(declare-datatypes ((array!29495 0))(
  ( (array!29496 (arr!14175 (Array (_ BitVec 32) (_ BitVec 64))) (size!14528 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29495)

(declare-fun array_inv!10318 (array!29495) Bool)

(assert (=> start!41814 (array_inv!10318 _keys!1025)))

(declare-datatypes ((V!18251 0))(
  ( (V!18252 (val!6474 Int)) )
))
(declare-datatypes ((ValueCell!6086 0))(
  ( (ValueCellFull!6086 (v!8757 V!18251)) (EmptyCell!6086) )
))
(declare-datatypes ((array!29497 0))(
  ( (array!29498 (arr!14176 (Array (_ BitVec 32) ValueCell!6086)) (size!14529 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29497)

(declare-fun e!272996 () Bool)

(declare-fun array_inv!10319 (array!29497) Bool)

(assert (=> start!41814 (and (array_inv!10319 _values!833) e!272996)))

(declare-fun b!466801 () Bool)

(declare-fun e!272999 () Bool)

(assert (=> b!466801 (= e!272999 tp_is_empty!12859)))

(declare-fun b!466802 () Bool)

(declare-fun e!272997 () Bool)

(assert (=> b!466802 (= e!272997 tp_is_empty!12859)))

(declare-fun b!466803 () Bool)

(declare-fun mapRes!20977 () Bool)

(assert (=> b!466803 (= e!272996 (and e!272997 mapRes!20977))))

(declare-fun condMapEmpty!20977 () Bool)

(declare-fun mapDefault!20977 () ValueCell!6086)

(assert (=> b!466803 (= condMapEmpty!20977 (= (arr!14176 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6086)) mapDefault!20977)))))

(declare-fun mapNonEmpty!20977 () Bool)

(declare-fun tp!40303 () Bool)

(assert (=> mapNonEmpty!20977 (= mapRes!20977 (and tp!40303 e!272999))))

(declare-fun mapKey!20977 () (_ BitVec 32))

(declare-fun mapValue!20977 () ValueCell!6086)

(declare-fun mapRest!20977 () (Array (_ BitVec 32) ValueCell!6086))

(assert (=> mapNonEmpty!20977 (= (arr!14176 _values!833) (store mapRest!20977 mapKey!20977 mapValue!20977))))

(declare-fun mapIsEmpty!20977 () Bool)

(assert (=> mapIsEmpty!20977 mapRes!20977))

(declare-fun b!466804 () Bool)

(assert (=> b!466804 (= e!273000 (not true))))

(declare-datatypes ((tuple2!8538 0))(
  ( (tuple2!8539 (_1!4280 (_ BitVec 64)) (_2!4280 V!18251)) )
))
(declare-datatypes ((List!8618 0))(
  ( (Nil!8615) (Cons!8614 (h!9470 tuple2!8538) (t!14563 List!8618)) )
))
(declare-datatypes ((ListLongMap!7441 0))(
  ( (ListLongMap!7442 (toList!3736 List!8618)) )
))
(declare-fun lt!210958 () ListLongMap!7441)

(declare-fun lt!210957 () ListLongMap!7441)

(assert (=> b!466804 (= lt!210958 lt!210957)))

(declare-fun minValueBefore!38 () V!18251)

(declare-fun zeroValue!794 () V!18251)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((Unit!13576 0))(
  ( (Unit!13577) )
))
(declare-fun lt!210959 () Unit!13576)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-fun minValueAfter!38 () V!18251)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!77 (array!29495 array!29497 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18251 V!18251 V!18251 V!18251 (_ BitVec 32) Int) Unit!13576)

(assert (=> b!466804 (= lt!210959 (lemmaNoChangeToArrayThenSameMapNoExtras!77 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1920 (array!29495 array!29497 (_ BitVec 32) (_ BitVec 32) V!18251 V!18251 (_ BitVec 32) Int) ListLongMap!7441)

(assert (=> b!466804 (= lt!210957 (getCurrentListMapNoExtraKeys!1920 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!466804 (= lt!210958 (getCurrentListMapNoExtraKeys!1920 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!466805 () Bool)

(declare-fun res!279036 () Bool)

(assert (=> b!466805 (=> (not res!279036) (not e!273000))))

(assert (=> b!466805 (= res!279036 (and (= (size!14529 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14528 _keys!1025) (size!14529 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!466806 () Bool)

(declare-fun res!279038 () Bool)

(assert (=> b!466806 (=> (not res!279038) (not e!273000))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29495 (_ BitVec 32)) Bool)

(assert (=> b!466806 (= res!279038 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!466807 () Bool)

(declare-fun res!279039 () Bool)

(assert (=> b!466807 (=> (not res!279039) (not e!273000))))

(declare-datatypes ((List!8619 0))(
  ( (Nil!8616) (Cons!8615 (h!9471 (_ BitVec 64)) (t!14564 List!8619)) )
))
(declare-fun arrayNoDuplicates!0 (array!29495 (_ BitVec 32) List!8619) Bool)

(assert (=> b!466807 (= res!279039 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8616))))

(assert (= (and start!41814 res!279037) b!466805))

(assert (= (and b!466805 res!279036) b!466806))

(assert (= (and b!466806 res!279038) b!466807))

(assert (= (and b!466807 res!279039) b!466804))

(assert (= (and b!466803 condMapEmpty!20977) mapIsEmpty!20977))

(assert (= (and b!466803 (not condMapEmpty!20977)) mapNonEmpty!20977))

(get-info :version)

(assert (= (and mapNonEmpty!20977 ((_ is ValueCellFull!6086) mapValue!20977)) b!466801))

(assert (= (and b!466803 ((_ is ValueCellFull!6086) mapDefault!20977)) b!466802))

(assert (= start!41814 b!466803))

(declare-fun m!448543 () Bool)

(assert (=> start!41814 m!448543))

(declare-fun m!448545 () Bool)

(assert (=> start!41814 m!448545))

(declare-fun m!448547 () Bool)

(assert (=> start!41814 m!448547))

(declare-fun m!448549 () Bool)

(assert (=> mapNonEmpty!20977 m!448549))

(declare-fun m!448551 () Bool)

(assert (=> b!466804 m!448551))

(declare-fun m!448553 () Bool)

(assert (=> b!466804 m!448553))

(declare-fun m!448555 () Bool)

(assert (=> b!466804 m!448555))

(declare-fun m!448557 () Bool)

(assert (=> b!466807 m!448557))

(declare-fun m!448559 () Bool)

(assert (=> b!466806 m!448559))

(check-sat (not b!466807) (not b!466806) (not start!41814) tp_is_empty!12859 (not mapNonEmpty!20977) (not b_next!11431) b_and!19785 (not b!466804))
(check-sat b_and!19785 (not b_next!11431))
