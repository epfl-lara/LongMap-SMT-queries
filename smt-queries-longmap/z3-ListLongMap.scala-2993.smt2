; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42248 () Bool)

(assert start!42248)

(declare-fun b_free!11767 () Bool)

(declare-fun b_next!11767 () Bool)

(assert (=> start!42248 (= b_free!11767 (not b_next!11767))))

(declare-fun tp!41328 () Bool)

(declare-fun b_and!20179 () Bool)

(assert (=> start!42248 (= tp!41328 b_and!20179)))

(declare-fun res!281603 () Bool)

(declare-fun e!276243 () Bool)

(assert (=> start!42248 (=> (not res!281603) (not e!276243))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42248 (= res!281603 (validMask!0 mask!1365))))

(assert (=> start!42248 e!276243))

(declare-fun tp_is_empty!13195 () Bool)

(assert (=> start!42248 tp_is_empty!13195))

(assert (=> start!42248 tp!41328))

(assert (=> start!42248 true))

(declare-datatypes ((array!30135 0))(
  ( (array!30136 (arr!14489 (Array (_ BitVec 32) (_ BitVec 64))) (size!14842 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30135)

(declare-fun array_inv!10538 (array!30135) Bool)

(assert (=> start!42248 (array_inv!10538 _keys!1025)))

(declare-datatypes ((V!18699 0))(
  ( (V!18700 (val!6642 Int)) )
))
(declare-datatypes ((ValueCell!6254 0))(
  ( (ValueCellFull!6254 (v!8927 V!18699)) (EmptyCell!6254) )
))
(declare-datatypes ((array!30137 0))(
  ( (array!30138 (arr!14490 (Array (_ BitVec 32) ValueCell!6254)) (size!14843 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30137)

(declare-fun e!276242 () Bool)

(declare-fun array_inv!10539 (array!30137) Bool)

(assert (=> start!42248 (and (array_inv!10539 _values!833) e!276242)))

(declare-fun b!471333 () Bool)

(declare-fun res!281602 () Bool)

(assert (=> b!471333 (=> (not res!281602) (not e!276243))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30135 (_ BitVec 32)) Bool)

(assert (=> b!471333 (= res!281602 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!471334 () Bool)

(declare-fun e!276244 () Bool)

(assert (=> b!471334 (= e!276244 tp_is_empty!13195)))

(declare-fun b!471335 () Bool)

(declare-fun e!276246 () Bool)

(assert (=> b!471335 (= e!276246 tp_is_empty!13195)))

(declare-fun mapIsEmpty!21499 () Bool)

(declare-fun mapRes!21499 () Bool)

(assert (=> mapIsEmpty!21499 mapRes!21499))

(declare-fun mapNonEmpty!21499 () Bool)

(declare-fun tp!41329 () Bool)

(assert (=> mapNonEmpty!21499 (= mapRes!21499 (and tp!41329 e!276244))))

(declare-fun mapValue!21499 () ValueCell!6254)

(declare-fun mapRest!21499 () (Array (_ BitVec 32) ValueCell!6254))

(declare-fun mapKey!21499 () (_ BitVec 32))

(assert (=> mapNonEmpty!21499 (= (arr!14490 _values!833) (store mapRest!21499 mapKey!21499 mapValue!21499))))

(declare-fun b!471336 () Bool)

(assert (=> b!471336 (= e!276242 (and e!276246 mapRes!21499))))

(declare-fun condMapEmpty!21499 () Bool)

(declare-fun mapDefault!21499 () ValueCell!6254)

(assert (=> b!471336 (= condMapEmpty!21499 (= (arr!14490 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6254)) mapDefault!21499)))))

(declare-fun b!471337 () Bool)

(declare-fun res!281601 () Bool)

(assert (=> b!471337 (=> (not res!281601) (not e!276243))))

(declare-datatypes ((List!8852 0))(
  ( (Nil!8849) (Cons!8848 (h!9704 (_ BitVec 64)) (t!14809 List!8852)) )
))
(declare-fun arrayNoDuplicates!0 (array!30135 (_ BitVec 32) List!8852) Bool)

(assert (=> b!471337 (= res!281601 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8849))))

(declare-fun b!471338 () Bool)

(assert (=> b!471338 (= e!276243 (not true))))

(declare-datatypes ((tuple2!8782 0))(
  ( (tuple2!8783 (_1!4402 (_ BitVec 64)) (_2!4402 V!18699)) )
))
(declare-datatypes ((List!8853 0))(
  ( (Nil!8850) (Cons!8849 (h!9705 tuple2!8782) (t!14810 List!8853)) )
))
(declare-datatypes ((ListLongMap!7685 0))(
  ( (ListLongMap!7686 (toList!3858 List!8853)) )
))
(declare-fun lt!213726 () ListLongMap!7685)

(declare-fun lt!213728 () ListLongMap!7685)

(assert (=> b!471338 (= lt!213726 lt!213728)))

(declare-fun minValueBefore!38 () V!18699)

(declare-fun zeroValue!794 () V!18699)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((Unit!13817 0))(
  ( (Unit!13818) )
))
(declare-fun lt!213727 () Unit!13817)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun minValueAfter!38 () V!18699)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!190 (array!30135 array!30137 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18699 V!18699 V!18699 V!18699 (_ BitVec 32) Int) Unit!13817)

(assert (=> b!471338 (= lt!213727 (lemmaNoChangeToArrayThenSameMapNoExtras!190 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!2033 (array!30135 array!30137 (_ BitVec 32) (_ BitVec 32) V!18699 V!18699 (_ BitVec 32) Int) ListLongMap!7685)

(assert (=> b!471338 (= lt!213728 (getCurrentListMapNoExtraKeys!2033 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!471338 (= lt!213726 (getCurrentListMapNoExtraKeys!2033 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!471339 () Bool)

(declare-fun res!281600 () Bool)

(assert (=> b!471339 (=> (not res!281600) (not e!276243))))

(assert (=> b!471339 (= res!281600 (and (= (size!14843 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14842 _keys!1025) (size!14843 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and start!42248 res!281603) b!471339))

(assert (= (and b!471339 res!281600) b!471333))

(assert (= (and b!471333 res!281602) b!471337))

(assert (= (and b!471337 res!281601) b!471338))

(assert (= (and b!471336 condMapEmpty!21499) mapIsEmpty!21499))

(assert (= (and b!471336 (not condMapEmpty!21499)) mapNonEmpty!21499))

(get-info :version)

(assert (= (and mapNonEmpty!21499 ((_ is ValueCellFull!6254) mapValue!21499)) b!471334))

(assert (= (and b!471336 ((_ is ValueCellFull!6254) mapDefault!21499)) b!471335))

(assert (= start!42248 b!471336))

(declare-fun m!452979 () Bool)

(assert (=> start!42248 m!452979))

(declare-fun m!452981 () Bool)

(assert (=> start!42248 m!452981))

(declare-fun m!452983 () Bool)

(assert (=> start!42248 m!452983))

(declare-fun m!452985 () Bool)

(assert (=> b!471337 m!452985))

(declare-fun m!452987 () Bool)

(assert (=> mapNonEmpty!21499 m!452987))

(declare-fun m!452989 () Bool)

(assert (=> b!471338 m!452989))

(declare-fun m!452991 () Bool)

(assert (=> b!471338 m!452991))

(declare-fun m!452993 () Bool)

(assert (=> b!471338 m!452993))

(declare-fun m!452995 () Bool)

(assert (=> b!471333 m!452995))

(check-sat b_and!20179 (not b!471338) (not mapNonEmpty!21499) (not b_next!11767) (not start!42248) (not b!471333) tp_is_empty!13195 (not b!471337))
(check-sat b_and!20179 (not b_next!11767))
