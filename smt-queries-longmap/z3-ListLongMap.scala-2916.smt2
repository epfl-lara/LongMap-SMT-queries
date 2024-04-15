; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41638 () Bool)

(assert start!41638)

(declare-fun b_free!11305 () Bool)

(declare-fun b_next!11305 () Bool)

(assert (=> start!41638 (= b_free!11305 (not b_next!11305))))

(declare-fun tp!39915 () Bool)

(declare-fun b_and!19627 () Bool)

(assert (=> start!41638 (= tp!39915 b_and!19627)))

(declare-fun b!464863 () Bool)

(declare-fun e!271616 () Bool)

(declare-fun tp_is_empty!12733 () Bool)

(assert (=> b!464863 (= e!271616 tp_is_empty!12733)))

(declare-fun res!277925 () Bool)

(declare-fun e!271614 () Bool)

(assert (=> start!41638 (=> (not res!277925) (not e!271614))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41638 (= res!277925 (validMask!0 mask!1365))))

(assert (=> start!41638 e!271614))

(assert (=> start!41638 tp_is_empty!12733))

(assert (=> start!41638 tp!39915))

(assert (=> start!41638 true))

(declare-datatypes ((array!29247 0))(
  ( (array!29248 (arr!14054 (Array (_ BitVec 32) (_ BitVec 64))) (size!14407 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29247)

(declare-fun array_inv!10234 (array!29247) Bool)

(assert (=> start!41638 (array_inv!10234 _keys!1025)))

(declare-datatypes ((V!18083 0))(
  ( (V!18084 (val!6411 Int)) )
))
(declare-datatypes ((ValueCell!6023 0))(
  ( (ValueCellFull!6023 (v!8692 V!18083)) (EmptyCell!6023) )
))
(declare-datatypes ((array!29249 0))(
  ( (array!29250 (arr!14055 (Array (_ BitVec 32) ValueCell!6023)) (size!14408 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29249)

(declare-fun e!271618 () Bool)

(declare-fun array_inv!10235 (array!29249) Bool)

(assert (=> start!41638 (and (array_inv!10235 _values!833) e!271618)))

(declare-fun b!464864 () Bool)

(declare-fun mapRes!20779 () Bool)

(assert (=> b!464864 (= e!271618 (and e!271616 mapRes!20779))))

(declare-fun condMapEmpty!20779 () Bool)

(declare-fun mapDefault!20779 () ValueCell!6023)

(assert (=> b!464864 (= condMapEmpty!20779 (= (arr!14055 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6023)) mapDefault!20779)))))

(declare-fun b!464865 () Bool)

(assert (=> b!464865 (= e!271614 (not true))))

(declare-datatypes ((tuple2!8434 0))(
  ( (tuple2!8435 (_1!4228 (_ BitVec 64)) (_2!4228 V!18083)) )
))
(declare-datatypes ((List!8524 0))(
  ( (Nil!8521) (Cons!8520 (h!9376 tuple2!8434) (t!14463 List!8524)) )
))
(declare-datatypes ((ListLongMap!7337 0))(
  ( (ListLongMap!7338 (toList!3684 List!8524)) )
))
(declare-fun lt!209783 () ListLongMap!7337)

(declare-fun lt!209782 () ListLongMap!7337)

(assert (=> b!464865 (= lt!209783 lt!209782)))

(declare-datatypes ((Unit!13484 0))(
  ( (Unit!13485) )
))
(declare-fun lt!209784 () Unit!13484)

(declare-fun minValueBefore!38 () V!18083)

(declare-fun zeroValue!794 () V!18083)

(declare-fun defaultEntry!841 () Int)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-fun minValueAfter!38 () V!18083)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!33 (array!29247 array!29249 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18083 V!18083 V!18083 V!18083 (_ BitVec 32) Int) Unit!13484)

(assert (=> b!464865 (= lt!209784 (lemmaNoChangeToArrayThenSameMapNoExtras!33 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1876 (array!29247 array!29249 (_ BitVec 32) (_ BitVec 32) V!18083 V!18083 (_ BitVec 32) Int) ListLongMap!7337)

(assert (=> b!464865 (= lt!209782 (getCurrentListMapNoExtraKeys!1876 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!464865 (= lt!209783 (getCurrentListMapNoExtraKeys!1876 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!464866 () Bool)

(declare-fun res!277926 () Bool)

(assert (=> b!464866 (=> (not res!277926) (not e!271614))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29247 (_ BitVec 32)) Bool)

(assert (=> b!464866 (= res!277926 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!464867 () Bool)

(declare-fun res!277923 () Bool)

(assert (=> b!464867 (=> (not res!277923) (not e!271614))))

(assert (=> b!464867 (= res!277923 (and (= (size!14408 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14407 _keys!1025) (size!14408 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!464868 () Bool)

(declare-fun res!277924 () Bool)

(assert (=> b!464868 (=> (not res!277924) (not e!271614))))

(declare-datatypes ((List!8525 0))(
  ( (Nil!8522) (Cons!8521 (h!9377 (_ BitVec 64)) (t!14464 List!8525)) )
))
(declare-fun arrayNoDuplicates!0 (array!29247 (_ BitVec 32) List!8525) Bool)

(assert (=> b!464868 (= res!277924 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8522))))

(declare-fun b!464869 () Bool)

(declare-fun e!271615 () Bool)

(assert (=> b!464869 (= e!271615 tp_is_empty!12733)))

(declare-fun mapNonEmpty!20779 () Bool)

(declare-fun tp!39916 () Bool)

(assert (=> mapNonEmpty!20779 (= mapRes!20779 (and tp!39916 e!271615))))

(declare-fun mapValue!20779 () ValueCell!6023)

(declare-fun mapRest!20779 () (Array (_ BitVec 32) ValueCell!6023))

(declare-fun mapKey!20779 () (_ BitVec 32))

(assert (=> mapNonEmpty!20779 (= (arr!14055 _values!833) (store mapRest!20779 mapKey!20779 mapValue!20779))))

(declare-fun mapIsEmpty!20779 () Bool)

(assert (=> mapIsEmpty!20779 mapRes!20779))

(assert (= (and start!41638 res!277925) b!464867))

(assert (= (and b!464867 res!277923) b!464866))

(assert (= (and b!464866 res!277926) b!464868))

(assert (= (and b!464868 res!277924) b!464865))

(assert (= (and b!464864 condMapEmpty!20779) mapIsEmpty!20779))

(assert (= (and b!464864 (not condMapEmpty!20779)) mapNonEmpty!20779))

(get-info :version)

(assert (= (and mapNonEmpty!20779 ((_ is ValueCellFull!6023) mapValue!20779)) b!464869))

(assert (= (and b!464864 ((_ is ValueCellFull!6023) mapDefault!20779)) b!464863))

(assert (= start!41638 b!464864))

(declare-fun m!446679 () Bool)

(assert (=> b!464866 m!446679))

(declare-fun m!446681 () Bool)

(assert (=> b!464868 m!446681))

(declare-fun m!446683 () Bool)

(assert (=> mapNonEmpty!20779 m!446683))

(declare-fun m!446685 () Bool)

(assert (=> b!464865 m!446685))

(declare-fun m!446687 () Bool)

(assert (=> b!464865 m!446687))

(declare-fun m!446689 () Bool)

(assert (=> b!464865 m!446689))

(declare-fun m!446691 () Bool)

(assert (=> start!41638 m!446691))

(declare-fun m!446693 () Bool)

(assert (=> start!41638 m!446693))

(declare-fun m!446695 () Bool)

(assert (=> start!41638 m!446695))

(check-sat b_and!19627 (not mapNonEmpty!20779) (not b_next!11305) (not b!464868) tp_is_empty!12733 (not b!464865) (not b!464866) (not start!41638))
(check-sat b_and!19627 (not b_next!11305))
