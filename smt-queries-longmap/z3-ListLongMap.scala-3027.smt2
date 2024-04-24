; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42522 () Bool)

(assert start!42522)

(declare-fun b_free!11971 () Bool)

(declare-fun b_next!11971 () Bool)

(assert (=> start!42522 (= b_free!11971 (not b_next!11971))))

(declare-fun tp!41953 () Bool)

(declare-fun b_and!20461 () Bool)

(assert (=> start!42522 (= tp!41953 b_and!20461)))

(declare-fun b!474523 () Bool)

(declare-fun e!278526 () Bool)

(assert (=> b!474523 (= e!278526 (not true))))

(declare-datatypes ((V!18971 0))(
  ( (V!18972 (val!6744 Int)) )
))
(declare-datatypes ((tuple2!8816 0))(
  ( (tuple2!8817 (_1!4419 (_ BitVec 64)) (_2!4419 V!18971)) )
))
(declare-datatypes ((List!8876 0))(
  ( (Nil!8873) (Cons!8872 (h!9728 tuple2!8816) (t!14842 List!8876)) )
))
(declare-datatypes ((ListLongMap!7731 0))(
  ( (ListLongMap!7732 (toList!3881 List!8876)) )
))
(declare-fun lt!216237 () ListLongMap!7731)

(declare-fun lt!216239 () ListLongMap!7731)

(assert (=> b!474523 (= lt!216237 lt!216239)))

(declare-fun minValueBefore!38 () V!18971)

(declare-fun zeroValue!794 () V!18971)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((Unit!13970 0))(
  ( (Unit!13971) )
))
(declare-fun lt!216238 () Unit!13970)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!30526 0))(
  ( (array!30527 (arr!14680 (Array (_ BitVec 32) (_ BitVec 64))) (size!15032 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30526)

(declare-datatypes ((ValueCell!6356 0))(
  ( (ValueCellFull!6356 (v!9038 V!18971)) (EmptyCell!6356) )
))
(declare-datatypes ((array!30528 0))(
  ( (array!30529 (arr!14681 (Array (_ BitVec 32) ValueCell!6356)) (size!15033 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30528)

(declare-fun minValueAfter!38 () V!18971)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!248 (array!30526 array!30528 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18971 V!18971 V!18971 V!18971 (_ BitVec 32) Int) Unit!13970)

(assert (=> b!474523 (= lt!216238 (lemmaNoChangeToArrayThenSameMapNoExtras!248 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!2088 (array!30526 array!30528 (_ BitVec 32) (_ BitVec 32) V!18971 V!18971 (_ BitVec 32) Int) ListLongMap!7731)

(assert (=> b!474523 (= lt!216239 (getCurrentListMapNoExtraKeys!2088 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!474523 (= lt!216237 (getCurrentListMapNoExtraKeys!2088 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun res!283437 () Bool)

(assert (=> start!42522 (=> (not res!283437) (not e!278526))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42522 (= res!283437 (validMask!0 mask!1365))))

(assert (=> start!42522 e!278526))

(declare-fun tp_is_empty!13399 () Bool)

(assert (=> start!42522 tp_is_empty!13399))

(assert (=> start!42522 tp!41953))

(assert (=> start!42522 true))

(declare-fun array_inv!10672 (array!30526) Bool)

(assert (=> start!42522 (array_inv!10672 _keys!1025)))

(declare-fun e!278527 () Bool)

(declare-fun array_inv!10673 (array!30528) Bool)

(assert (=> start!42522 (and (array_inv!10673 _values!833) e!278527)))

(declare-fun mapNonEmpty!21817 () Bool)

(declare-fun mapRes!21817 () Bool)

(declare-fun tp!41952 () Bool)

(declare-fun e!278529 () Bool)

(assert (=> mapNonEmpty!21817 (= mapRes!21817 (and tp!41952 e!278529))))

(declare-fun mapValue!21817 () ValueCell!6356)

(declare-fun mapRest!21817 () (Array (_ BitVec 32) ValueCell!6356))

(declare-fun mapKey!21817 () (_ BitVec 32))

(assert (=> mapNonEmpty!21817 (= (arr!14681 _values!833) (store mapRest!21817 mapKey!21817 mapValue!21817))))

(declare-fun b!474524 () Bool)

(declare-fun res!283439 () Bool)

(assert (=> b!474524 (=> (not res!283439) (not e!278526))))

(assert (=> b!474524 (= res!283439 (and (= (size!15033 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!15032 _keys!1025) (size!15033 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!21817 () Bool)

(assert (=> mapIsEmpty!21817 mapRes!21817))

(declare-fun b!474525 () Bool)

(assert (=> b!474525 (= e!278529 tp_is_empty!13399)))

(declare-fun b!474526 () Bool)

(declare-fun res!283438 () Bool)

(assert (=> b!474526 (=> (not res!283438) (not e!278526))))

(declare-datatypes ((List!8877 0))(
  ( (Nil!8874) (Cons!8873 (h!9729 (_ BitVec 64)) (t!14843 List!8877)) )
))
(declare-fun arrayNoDuplicates!0 (array!30526 (_ BitVec 32) List!8877) Bool)

(assert (=> b!474526 (= res!283438 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8874))))

(declare-fun b!474527 () Bool)

(declare-fun res!283436 () Bool)

(assert (=> b!474527 (=> (not res!283436) (not e!278526))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30526 (_ BitVec 32)) Bool)

(assert (=> b!474527 (= res!283436 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!474528 () Bool)

(declare-fun e!278525 () Bool)

(assert (=> b!474528 (= e!278525 tp_is_empty!13399)))

(declare-fun b!474529 () Bool)

(assert (=> b!474529 (= e!278527 (and e!278525 mapRes!21817))))

(declare-fun condMapEmpty!21817 () Bool)

(declare-fun mapDefault!21817 () ValueCell!6356)

(assert (=> b!474529 (= condMapEmpty!21817 (= (arr!14681 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6356)) mapDefault!21817)))))

(assert (= (and start!42522 res!283437) b!474524))

(assert (= (and b!474524 res!283439) b!474527))

(assert (= (and b!474527 res!283436) b!474526))

(assert (= (and b!474526 res!283438) b!474523))

(assert (= (and b!474529 condMapEmpty!21817) mapIsEmpty!21817))

(assert (= (and b!474529 (not condMapEmpty!21817)) mapNonEmpty!21817))

(get-info :version)

(assert (= (and mapNonEmpty!21817 ((_ is ValueCellFull!6356) mapValue!21817)) b!474525))

(assert (= (and b!474529 ((_ is ValueCellFull!6356) mapDefault!21817)) b!474528))

(assert (= start!42522 b!474529))

(declare-fun m!457143 () Bool)

(assert (=> b!474527 m!457143))

(declare-fun m!457145 () Bool)

(assert (=> b!474526 m!457145))

(declare-fun m!457147 () Bool)

(assert (=> start!42522 m!457147))

(declare-fun m!457149 () Bool)

(assert (=> start!42522 m!457149))

(declare-fun m!457151 () Bool)

(assert (=> start!42522 m!457151))

(declare-fun m!457153 () Bool)

(assert (=> mapNonEmpty!21817 m!457153))

(declare-fun m!457155 () Bool)

(assert (=> b!474523 m!457155))

(declare-fun m!457157 () Bool)

(assert (=> b!474523 m!457157))

(declare-fun m!457159 () Bool)

(assert (=> b!474523 m!457159))

(check-sat b_and!20461 (not b_next!11971) (not b!474523) (not b!474527) tp_is_empty!13399 (not b!474526) (not start!42522) (not mapNonEmpty!21817))
(check-sat b_and!20461 (not b_next!11971))
