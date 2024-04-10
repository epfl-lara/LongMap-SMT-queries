; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41940 () Bool)

(assert start!41940)

(declare-fun b_free!11529 () Bool)

(declare-fun b_next!11529 () Bool)

(assert (=> start!41940 (= b_free!11529 (not b_next!11529))))

(declare-fun tp!40599 () Bool)

(declare-fun b_and!19917 () Bool)

(assert (=> start!41940 (= tp!40599 b_and!19917)))

(declare-fun res!279853 () Bool)

(declare-fun e!274033 () Bool)

(assert (=> start!41940 (=> (not res!279853) (not e!274033))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41940 (= res!279853 (validMask!0 mask!1365))))

(assert (=> start!41940 e!274033))

(declare-fun tp_is_empty!12957 () Bool)

(assert (=> start!41940 tp_is_empty!12957))

(assert (=> start!41940 tp!40599))

(assert (=> start!41940 true))

(declare-datatypes ((array!29689 0))(
  ( (array!29690 (arr!14271 (Array (_ BitVec 32) (_ BitVec 64))) (size!14623 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29689)

(declare-fun array_inv!10304 (array!29689) Bool)

(assert (=> start!41940 (array_inv!10304 _keys!1025)))

(declare-datatypes ((V!18381 0))(
  ( (V!18382 (val!6523 Int)) )
))
(declare-datatypes ((ValueCell!6135 0))(
  ( (ValueCellFull!6135 (v!8812 V!18381)) (EmptyCell!6135) )
))
(declare-datatypes ((array!29691 0))(
  ( (array!29692 (arr!14272 (Array (_ BitVec 32) ValueCell!6135)) (size!14624 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29691)

(declare-fun e!274031 () Bool)

(declare-fun array_inv!10305 (array!29691) Bool)

(assert (=> start!41940 (and (array_inv!10305 _values!833) e!274031)))

(declare-fun b!468254 () Bool)

(declare-fun res!279856 () Bool)

(assert (=> b!468254 (=> (not res!279856) (not e!274033))))

(declare-datatypes ((List!8658 0))(
  ( (Nil!8655) (Cons!8654 (h!9510 (_ BitVec 64)) (t!14614 List!8658)) )
))
(declare-fun arrayNoDuplicates!0 (array!29689 (_ BitVec 32) List!8658) Bool)

(assert (=> b!468254 (= res!279856 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8655))))

(declare-fun b!468255 () Bool)

(declare-fun e!274029 () Bool)

(assert (=> b!468255 (= e!274029 tp_is_empty!12957)))

(declare-fun b!468256 () Bool)

(declare-fun e!274028 () Bool)

(assert (=> b!468256 (= e!274033 (not e!274028))))

(declare-fun res!279852 () Bool)

(assert (=> b!468256 (=> res!279852 e!274028)))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(assert (=> b!468256 (= res!279852 (or (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!8570 0))(
  ( (tuple2!8571 (_1!4296 (_ BitVec 64)) (_2!4296 V!18381)) )
))
(declare-datatypes ((List!8659 0))(
  ( (Nil!8656) (Cons!8655 (h!9511 tuple2!8570) (t!14615 List!8659)) )
))
(declare-datatypes ((ListLongMap!7483 0))(
  ( (ListLongMap!7484 (toList!3757 List!8659)) )
))
(declare-fun lt!211741 () ListLongMap!7483)

(declare-fun lt!211743 () ListLongMap!7483)

(assert (=> b!468256 (= lt!211741 lt!211743)))

(declare-fun minValueBefore!38 () V!18381)

(declare-fun zeroValue!794 () V!18381)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((Unit!13670 0))(
  ( (Unit!13671) )
))
(declare-fun lt!211742 () Unit!13670)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-fun minValueAfter!38 () V!18381)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!109 (array!29689 array!29691 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18381 V!18381 V!18381 V!18381 (_ BitVec 32) Int) Unit!13670)

(assert (=> b!468256 (= lt!211742 (lemmaNoChangeToArrayThenSameMapNoExtras!109 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1929 (array!29689 array!29691 (_ BitVec 32) (_ BitVec 32) V!18381 V!18381 (_ BitVec 32) Int) ListLongMap!7483)

(assert (=> b!468256 (= lt!211743 (getCurrentListMapNoExtraKeys!1929 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!468256 (= lt!211741 (getCurrentListMapNoExtraKeys!1929 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!468257 () Bool)

(declare-fun e!274032 () Bool)

(declare-fun mapRes!21127 () Bool)

(assert (=> b!468257 (= e!274031 (and e!274032 mapRes!21127))))

(declare-fun condMapEmpty!21127 () Bool)

(declare-fun mapDefault!21127 () ValueCell!6135)

(assert (=> b!468257 (= condMapEmpty!21127 (= (arr!14272 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6135)) mapDefault!21127)))))

(declare-fun b!468258 () Bool)

(assert (=> b!468258 (= e!274032 tp_is_empty!12957)))

(declare-fun b!468259 () Bool)

(assert (=> b!468259 (= e!274028 true)))

(declare-fun lt!211740 () ListLongMap!7483)

(declare-fun getCurrentListMap!2185 (array!29689 array!29691 (_ BitVec 32) (_ BitVec 32) V!18381 V!18381 (_ BitVec 32) Int) ListLongMap!7483)

(assert (=> b!468259 (= lt!211740 (getCurrentListMap!2185 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!468260 () Bool)

(declare-fun res!279855 () Bool)

(assert (=> b!468260 (=> (not res!279855) (not e!274033))))

(assert (=> b!468260 (= res!279855 (and (= (size!14624 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14623 _keys!1025) (size!14624 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapNonEmpty!21127 () Bool)

(declare-fun tp!40600 () Bool)

(assert (=> mapNonEmpty!21127 (= mapRes!21127 (and tp!40600 e!274029))))

(declare-fun mapKey!21127 () (_ BitVec 32))

(declare-fun mapRest!21127 () (Array (_ BitVec 32) ValueCell!6135))

(declare-fun mapValue!21127 () ValueCell!6135)

(assert (=> mapNonEmpty!21127 (= (arr!14272 _values!833) (store mapRest!21127 mapKey!21127 mapValue!21127))))

(declare-fun b!468261 () Bool)

(declare-fun res!279854 () Bool)

(assert (=> b!468261 (=> (not res!279854) (not e!274033))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29689 (_ BitVec 32)) Bool)

(assert (=> b!468261 (= res!279854 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun mapIsEmpty!21127 () Bool)

(assert (=> mapIsEmpty!21127 mapRes!21127))

(assert (= (and start!41940 res!279853) b!468260))

(assert (= (and b!468260 res!279855) b!468261))

(assert (= (and b!468261 res!279854) b!468254))

(assert (= (and b!468254 res!279856) b!468256))

(assert (= (and b!468256 (not res!279852)) b!468259))

(assert (= (and b!468257 condMapEmpty!21127) mapIsEmpty!21127))

(assert (= (and b!468257 (not condMapEmpty!21127)) mapNonEmpty!21127))

(get-info :version)

(assert (= (and mapNonEmpty!21127 ((_ is ValueCellFull!6135) mapValue!21127)) b!468255))

(assert (= (and b!468257 ((_ is ValueCellFull!6135) mapDefault!21127)) b!468258))

(assert (= start!41940 b!468257))

(declare-fun m!450269 () Bool)

(assert (=> b!468259 m!450269))

(declare-fun m!450271 () Bool)

(assert (=> mapNonEmpty!21127 m!450271))

(declare-fun m!450273 () Bool)

(assert (=> b!468256 m!450273))

(declare-fun m!450275 () Bool)

(assert (=> b!468256 m!450275))

(declare-fun m!450277 () Bool)

(assert (=> b!468256 m!450277))

(declare-fun m!450279 () Bool)

(assert (=> start!41940 m!450279))

(declare-fun m!450281 () Bool)

(assert (=> start!41940 m!450281))

(declare-fun m!450283 () Bool)

(assert (=> start!41940 m!450283))

(declare-fun m!450285 () Bool)

(assert (=> b!468261 m!450285))

(declare-fun m!450287 () Bool)

(assert (=> b!468254 m!450287))

(check-sat b_and!19917 (not b!468259) (not b!468256) (not b_next!11529) (not b!468254) (not mapNonEmpty!21127) (not b!468261) (not start!41940) tp_is_empty!12957)
(check-sat b_and!19917 (not b_next!11529))
