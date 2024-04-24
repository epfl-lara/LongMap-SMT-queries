; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42316 () Bool)

(assert start!42316)

(declare-fun b_free!11821 () Bool)

(declare-fun b_next!11821 () Bool)

(assert (=> start!42316 (= b_free!11821 (not b_next!11821))))

(declare-fun tp!41494 () Bool)

(declare-fun b_and!20277 () Bool)

(assert (=> start!42316 (= tp!41494 b_and!20277)))

(declare-fun res!282098 () Bool)

(declare-fun e!276858 () Bool)

(assert (=> start!42316 (=> (not res!282098) (not e!276858))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42316 (= res!282098 (validMask!0 mask!1365))))

(assert (=> start!42316 e!276858))

(declare-fun tp_is_empty!13249 () Bool)

(assert (=> start!42316 tp_is_empty!13249))

(assert (=> start!42316 tp!41494))

(assert (=> start!42316 true))

(declare-datatypes ((array!30244 0))(
  ( (array!30245 (arr!14542 (Array (_ BitVec 32) (_ BitVec 64))) (size!14894 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30244)

(declare-fun array_inv!10574 (array!30244) Bool)

(assert (=> start!42316 (array_inv!10574 _keys!1025)))

(declare-datatypes ((V!18771 0))(
  ( (V!18772 (val!6669 Int)) )
))
(declare-datatypes ((ValueCell!6281 0))(
  ( (ValueCellFull!6281 (v!8961 V!18771)) (EmptyCell!6281) )
))
(declare-datatypes ((array!30246 0))(
  ( (array!30247 (arr!14543 (Array (_ BitVec 32) ValueCell!6281)) (size!14895 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30246)

(declare-fun e!276862 () Bool)

(declare-fun array_inv!10575 (array!30246) Bool)

(assert (=> start!42316 (and (array_inv!10575 _values!833) e!276862)))

(declare-fun b!472215 () Bool)

(declare-fun res!282097 () Bool)

(assert (=> b!472215 (=> (not res!282097) (not e!276858))))

(declare-datatypes ((List!8770 0))(
  ( (Nil!8767) (Cons!8766 (h!9622 (_ BitVec 64)) (t!14730 List!8770)) )
))
(declare-fun arrayNoDuplicates!0 (array!30244 (_ BitVec 32) List!8770) Bool)

(assert (=> b!472215 (= res!282097 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8767))))

(declare-fun b!472216 () Bool)

(declare-fun e!276860 () Bool)

(declare-fun mapRes!21583 () Bool)

(assert (=> b!472216 (= e!276862 (and e!276860 mapRes!21583))))

(declare-fun condMapEmpty!21583 () Bool)

(declare-fun mapDefault!21583 () ValueCell!6281)

(assert (=> b!472216 (= condMapEmpty!21583 (= (arr!14543 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6281)) mapDefault!21583)))))

(declare-fun mapIsEmpty!21583 () Bool)

(assert (=> mapIsEmpty!21583 mapRes!21583))

(declare-fun mapNonEmpty!21583 () Bool)

(declare-fun tp!41493 () Bool)

(declare-fun e!276857 () Bool)

(assert (=> mapNonEmpty!21583 (= mapRes!21583 (and tp!41493 e!276857))))

(declare-fun mapValue!21583 () ValueCell!6281)

(declare-fun mapRest!21583 () (Array (_ BitVec 32) ValueCell!6281))

(declare-fun mapKey!21583 () (_ BitVec 32))

(assert (=> mapNonEmpty!21583 (= (arr!14543 _values!833) (store mapRest!21583 mapKey!21583 mapValue!21583))))

(declare-fun b!472217 () Bool)

(assert (=> b!472217 (= e!276860 tp_is_empty!13249)))

(declare-fun b!472218 () Bool)

(declare-fun e!276861 () Bool)

(assert (=> b!472218 (= e!276861 true)))

(declare-fun minValueBefore!38 () V!18771)

(declare-fun zeroValue!794 () V!18771)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((tuple2!8704 0))(
  ( (tuple2!8705 (_1!4363 (_ BitVec 64)) (_2!4363 V!18771)) )
))
(declare-datatypes ((List!8771 0))(
  ( (Nil!8768) (Cons!8767 (h!9623 tuple2!8704) (t!14731 List!8771)) )
))
(declare-datatypes ((ListLongMap!7619 0))(
  ( (ListLongMap!7620 (toList!3825 List!8771)) )
))
(declare-fun lt!214275 () ListLongMap!7619)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun getCurrentListMap!2194 (array!30244 array!30246 (_ BitVec 32) (_ BitVec 32) V!18771 V!18771 (_ BitVec 32) Int) ListLongMap!7619)

(assert (=> b!472218 (= lt!214275 (getCurrentListMap!2194 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!472219 () Bool)

(declare-fun res!282100 () Bool)

(assert (=> b!472219 (=> (not res!282100) (not e!276858))))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(assert (=> b!472219 (= res!282100 (and (= (size!14895 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14894 _keys!1025) (size!14895 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!472220 () Bool)

(assert (=> b!472220 (= e!276858 (not e!276861))))

(declare-fun res!282099 () Bool)

(assert (=> b!472220 (=> res!282099 e!276861)))

(assert (=> b!472220 (= res!282099 (or (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun lt!214277 () ListLongMap!7619)

(declare-fun lt!214276 () ListLongMap!7619)

(assert (=> b!472220 (= lt!214277 lt!214276)))

(declare-datatypes ((Unit!13861 0))(
  ( (Unit!13862) )
))
(declare-fun lt!214278 () Unit!13861)

(declare-fun minValueAfter!38 () V!18771)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!199 (array!30244 array!30246 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18771 V!18771 V!18771 V!18771 (_ BitVec 32) Int) Unit!13861)

(assert (=> b!472220 (= lt!214278 (lemmaNoChangeToArrayThenSameMapNoExtras!199 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!2039 (array!30244 array!30246 (_ BitVec 32) (_ BitVec 32) V!18771 V!18771 (_ BitVec 32) Int) ListLongMap!7619)

(assert (=> b!472220 (= lt!214276 (getCurrentListMapNoExtraKeys!2039 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!472220 (= lt!214277 (getCurrentListMapNoExtraKeys!2039 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!472221 () Bool)

(assert (=> b!472221 (= e!276857 tp_is_empty!13249)))

(declare-fun b!472222 () Bool)

(declare-fun res!282101 () Bool)

(assert (=> b!472222 (=> (not res!282101) (not e!276858))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30244 (_ BitVec 32)) Bool)

(assert (=> b!472222 (= res!282101 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(assert (= (and start!42316 res!282098) b!472219))

(assert (= (and b!472219 res!282100) b!472222))

(assert (= (and b!472222 res!282101) b!472215))

(assert (= (and b!472215 res!282097) b!472220))

(assert (= (and b!472220 (not res!282099)) b!472218))

(assert (= (and b!472216 condMapEmpty!21583) mapIsEmpty!21583))

(assert (= (and b!472216 (not condMapEmpty!21583)) mapNonEmpty!21583))

(get-info :version)

(assert (= (and mapNonEmpty!21583 ((_ is ValueCellFull!6281) mapValue!21583)) b!472221))

(assert (= (and b!472216 ((_ is ValueCellFull!6281) mapDefault!21583)) b!472217))

(assert (= start!42316 b!472216))

(declare-fun m!454459 () Bool)

(assert (=> mapNonEmpty!21583 m!454459))

(declare-fun m!454461 () Bool)

(assert (=> start!42316 m!454461))

(declare-fun m!454463 () Bool)

(assert (=> start!42316 m!454463))

(declare-fun m!454465 () Bool)

(assert (=> start!42316 m!454465))

(declare-fun m!454467 () Bool)

(assert (=> b!472220 m!454467))

(declare-fun m!454469 () Bool)

(assert (=> b!472220 m!454469))

(declare-fun m!454471 () Bool)

(assert (=> b!472220 m!454471))

(declare-fun m!454473 () Bool)

(assert (=> b!472222 m!454473))

(declare-fun m!454475 () Bool)

(assert (=> b!472215 m!454475))

(declare-fun m!454477 () Bool)

(assert (=> b!472218 m!454477))

(check-sat (not b_next!11821) (not start!42316) (not b!472215) tp_is_empty!13249 (not b!472220) (not b!472222) (not mapNonEmpty!21583) b_and!20277 (not b!472218))
(check-sat b_and!20277 (not b_next!11821))
