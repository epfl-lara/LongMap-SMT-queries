; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41922 () Bool)

(assert start!41922)

(declare-fun b_free!11511 () Bool)

(declare-fun b_next!11511 () Bool)

(assert (=> start!41922 (= b_free!11511 (not b_next!11511))))

(declare-fun tp!40545 () Bool)

(declare-fun b_and!19899 () Bool)

(assert (=> start!41922 (= tp!40545 b_and!19899)))

(declare-fun b!468038 () Bool)

(declare-fun e!273871 () Bool)

(declare-fun e!273868 () Bool)

(declare-fun mapRes!21100 () Bool)

(assert (=> b!468038 (= e!273871 (and e!273868 mapRes!21100))))

(declare-fun condMapEmpty!21100 () Bool)

(declare-datatypes ((V!18357 0))(
  ( (V!18358 (val!6514 Int)) )
))
(declare-datatypes ((ValueCell!6126 0))(
  ( (ValueCellFull!6126 (v!8803 V!18357)) (EmptyCell!6126) )
))
(declare-datatypes ((array!29655 0))(
  ( (array!29656 (arr!14254 (Array (_ BitVec 32) ValueCell!6126)) (size!14606 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29655)

(declare-fun mapDefault!21100 () ValueCell!6126)

(assert (=> b!468038 (= condMapEmpty!21100 (= (arr!14254 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6126)) mapDefault!21100)))))

(declare-fun b!468039 () Bool)

(declare-fun res!279717 () Bool)

(declare-fun e!273870 () Bool)

(assert (=> b!468039 (=> (not res!279717) (not e!273870))))

(declare-datatypes ((array!29657 0))(
  ( (array!29658 (arr!14255 (Array (_ BitVec 32) (_ BitVec 64))) (size!14607 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29657)

(declare-datatypes ((List!8644 0))(
  ( (Nil!8641) (Cons!8640 (h!9496 (_ BitVec 64)) (t!14600 List!8644)) )
))
(declare-fun arrayNoDuplicates!0 (array!29657 (_ BitVec 32) List!8644) Bool)

(assert (=> b!468039 (= res!279717 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8641))))

(declare-fun b!468040 () Bool)

(declare-fun res!279721 () Bool)

(assert (=> b!468040 (=> (not res!279721) (not e!273870))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29657 (_ BitVec 32)) Bool)

(assert (=> b!468040 (= res!279721 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!468041 () Bool)

(declare-fun e!273866 () Bool)

(assert (=> b!468041 (= e!273866 true)))

(declare-fun minValueBefore!38 () V!18357)

(declare-fun zeroValue!794 () V!18357)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((tuple2!8556 0))(
  ( (tuple2!8557 (_1!4289 (_ BitVec 64)) (_2!4289 V!18357)) )
))
(declare-datatypes ((List!8645 0))(
  ( (Nil!8642) (Cons!8641 (h!9497 tuple2!8556) (t!14601 List!8645)) )
))
(declare-datatypes ((ListLongMap!7469 0))(
  ( (ListLongMap!7470 (toList!3750 List!8645)) )
))
(declare-fun lt!211633 () ListLongMap!7469)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun getCurrentListMap!2179 (array!29657 array!29655 (_ BitVec 32) (_ BitVec 32) V!18357 V!18357 (_ BitVec 32) Int) ListLongMap!7469)

(assert (=> b!468041 (= lt!211633 (getCurrentListMap!2179 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!468042 () Bool)

(assert (=> b!468042 (= e!273870 (not e!273866))))

(declare-fun res!279719 () Bool)

(assert (=> b!468042 (=> res!279719 e!273866)))

(assert (=> b!468042 (= res!279719 (or (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun lt!211632 () ListLongMap!7469)

(declare-fun lt!211634 () ListLongMap!7469)

(assert (=> b!468042 (= lt!211632 lt!211634)))

(declare-datatypes ((Unit!13658 0))(
  ( (Unit!13659) )
))
(declare-fun lt!211635 () Unit!13658)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-fun minValueAfter!38 () V!18357)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!103 (array!29657 array!29655 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18357 V!18357 V!18357 V!18357 (_ BitVec 32) Int) Unit!13658)

(assert (=> b!468042 (= lt!211635 (lemmaNoChangeToArrayThenSameMapNoExtras!103 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1923 (array!29657 array!29655 (_ BitVec 32) (_ BitVec 32) V!18357 V!18357 (_ BitVec 32) Int) ListLongMap!7469)

(assert (=> b!468042 (= lt!211634 (getCurrentListMapNoExtraKeys!1923 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!468042 (= lt!211632 (getCurrentListMapNoExtraKeys!1923 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!468043 () Bool)

(declare-fun res!279720 () Bool)

(assert (=> b!468043 (=> (not res!279720) (not e!273870))))

(assert (=> b!468043 (= res!279720 (and (= (size!14606 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14607 _keys!1025) (size!14606 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!468044 () Bool)

(declare-fun tp_is_empty!12939 () Bool)

(assert (=> b!468044 (= e!273868 tp_is_empty!12939)))

(declare-fun mapNonEmpty!21100 () Bool)

(declare-fun tp!40546 () Bool)

(declare-fun e!273869 () Bool)

(assert (=> mapNonEmpty!21100 (= mapRes!21100 (and tp!40546 e!273869))))

(declare-fun mapValue!21100 () ValueCell!6126)

(declare-fun mapRest!21100 () (Array (_ BitVec 32) ValueCell!6126))

(declare-fun mapKey!21100 () (_ BitVec 32))

(assert (=> mapNonEmpty!21100 (= (arr!14254 _values!833) (store mapRest!21100 mapKey!21100 mapValue!21100))))

(declare-fun mapIsEmpty!21100 () Bool)

(assert (=> mapIsEmpty!21100 mapRes!21100))

(declare-fun res!279718 () Bool)

(assert (=> start!41922 (=> (not res!279718) (not e!273870))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41922 (= res!279718 (validMask!0 mask!1365))))

(assert (=> start!41922 e!273870))

(assert (=> start!41922 tp_is_empty!12939))

(assert (=> start!41922 tp!40545))

(assert (=> start!41922 true))

(declare-fun array_inv!10292 (array!29657) Bool)

(assert (=> start!41922 (array_inv!10292 _keys!1025)))

(declare-fun array_inv!10293 (array!29655) Bool)

(assert (=> start!41922 (and (array_inv!10293 _values!833) e!273871)))

(declare-fun b!468045 () Bool)

(assert (=> b!468045 (= e!273869 tp_is_empty!12939)))

(assert (= (and start!41922 res!279718) b!468043))

(assert (= (and b!468043 res!279720) b!468040))

(assert (= (and b!468040 res!279721) b!468039))

(assert (= (and b!468039 res!279717) b!468042))

(assert (= (and b!468042 (not res!279719)) b!468041))

(assert (= (and b!468038 condMapEmpty!21100) mapIsEmpty!21100))

(assert (= (and b!468038 (not condMapEmpty!21100)) mapNonEmpty!21100))

(get-info :version)

(assert (= (and mapNonEmpty!21100 ((_ is ValueCellFull!6126) mapValue!21100)) b!468045))

(assert (= (and b!468038 ((_ is ValueCellFull!6126) mapDefault!21100)) b!468044))

(assert (= start!41922 b!468038))

(declare-fun m!450089 () Bool)

(assert (=> b!468042 m!450089))

(declare-fun m!450091 () Bool)

(assert (=> b!468042 m!450091))

(declare-fun m!450093 () Bool)

(assert (=> b!468042 m!450093))

(declare-fun m!450095 () Bool)

(assert (=> b!468041 m!450095))

(declare-fun m!450097 () Bool)

(assert (=> start!41922 m!450097))

(declare-fun m!450099 () Bool)

(assert (=> start!41922 m!450099))

(declare-fun m!450101 () Bool)

(assert (=> start!41922 m!450101))

(declare-fun m!450103 () Bool)

(assert (=> b!468039 m!450103))

(declare-fun m!450105 () Bool)

(assert (=> mapNonEmpty!21100 m!450105))

(declare-fun m!450107 () Bool)

(assert (=> b!468040 m!450107))

(check-sat (not start!41922) (not b!468042) tp_is_empty!12939 (not b!468039) (not b!468041) (not b_next!11511) (not mapNonEmpty!21100) b_and!19899 (not b!468040))
(check-sat b_and!19899 (not b_next!11511))
