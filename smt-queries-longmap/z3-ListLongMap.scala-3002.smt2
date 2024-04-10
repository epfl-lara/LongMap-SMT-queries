; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42332 () Bool)

(assert start!42332)

(declare-fun b_free!11823 () Bool)

(declare-fun b_next!11823 () Bool)

(assert (=> start!42332 (= b_free!11823 (not b_next!11823))))

(declare-fun tp!41499 () Bool)

(declare-fun b_and!20269 () Bool)

(assert (=> start!42332 (= tp!41499 b_and!20269)))

(declare-fun b!472300 () Bool)

(declare-fun e!276914 () Bool)

(declare-fun e!276919 () Bool)

(declare-fun mapRes!21586 () Bool)

(assert (=> b!472300 (= e!276914 (and e!276919 mapRes!21586))))

(declare-fun condMapEmpty!21586 () Bool)

(declare-datatypes ((V!18773 0))(
  ( (V!18774 (val!6670 Int)) )
))
(declare-datatypes ((ValueCell!6282 0))(
  ( (ValueCellFull!6282 (v!8961 V!18773)) (EmptyCell!6282) )
))
(declare-datatypes ((array!30259 0))(
  ( (array!30260 (arr!14550 (Array (_ BitVec 32) ValueCell!6282)) (size!14902 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30259)

(declare-fun mapDefault!21586 () ValueCell!6282)

(assert (=> b!472300 (= condMapEmpty!21586 (= (arr!14550 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6282)) mapDefault!21586)))))

(declare-fun res!282119 () Bool)

(declare-fun e!276915 () Bool)

(assert (=> start!42332 (=> (not res!282119) (not e!276915))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42332 (= res!282119 (validMask!0 mask!1365))))

(assert (=> start!42332 e!276915))

(declare-fun tp_is_empty!13251 () Bool)

(assert (=> start!42332 tp_is_empty!13251))

(assert (=> start!42332 tp!41499))

(assert (=> start!42332 true))

(declare-datatypes ((array!30261 0))(
  ( (array!30262 (arr!14551 (Array (_ BitVec 32) (_ BitVec 64))) (size!14903 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30261)

(declare-fun array_inv!10490 (array!30261) Bool)

(assert (=> start!42332 (array_inv!10490 _keys!1025)))

(declare-fun array_inv!10491 (array!30259) Bool)

(assert (=> start!42332 (and (array_inv!10491 _values!833) e!276914)))

(declare-fun b!472301 () Bool)

(declare-fun res!282121 () Bool)

(assert (=> b!472301 (=> (not res!282121) (not e!276915))))

(declare-datatypes ((List!8864 0))(
  ( (Nil!8861) (Cons!8860 (h!9716 (_ BitVec 64)) (t!14832 List!8864)) )
))
(declare-fun arrayNoDuplicates!0 (array!30261 (_ BitVec 32) List!8864) Bool)

(assert (=> b!472301 (= res!282121 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8861))))

(declare-fun b!472302 () Bool)

(assert (=> b!472302 (= e!276919 tp_is_empty!13251)))

(declare-fun b!472303 () Bool)

(declare-fun res!282123 () Bool)

(assert (=> b!472303 (=> (not res!282123) (not e!276915))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30261 (_ BitVec 32)) Bool)

(assert (=> b!472303 (= res!282123 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun mapNonEmpty!21586 () Bool)

(declare-fun tp!41500 () Bool)

(declare-fun e!276917 () Bool)

(assert (=> mapNonEmpty!21586 (= mapRes!21586 (and tp!41500 e!276917))))

(declare-fun mapKey!21586 () (_ BitVec 32))

(declare-fun mapRest!21586 () (Array (_ BitVec 32) ValueCell!6282))

(declare-fun mapValue!21586 () ValueCell!6282)

(assert (=> mapNonEmpty!21586 (= (arr!14550 _values!833) (store mapRest!21586 mapKey!21586 mapValue!21586))))

(declare-fun b!472304 () Bool)

(assert (=> b!472304 (= e!276917 tp_is_empty!13251)))

(declare-fun b!472305 () Bool)

(declare-fun res!282122 () Bool)

(assert (=> b!472305 (=> (not res!282122) (not e!276915))))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(assert (=> b!472305 (= res!282122 (and (= (size!14902 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14903 _keys!1025) (size!14902 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!21586 () Bool)

(assert (=> mapIsEmpty!21586 mapRes!21586))

(declare-fun b!472306 () Bool)

(declare-fun e!276916 () Bool)

(assert (=> b!472306 (= e!276916 true)))

(declare-fun minValueBefore!38 () V!18773)

(declare-fun zeroValue!794 () V!18773)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((tuple2!8782 0))(
  ( (tuple2!8783 (_1!4402 (_ BitVec 64)) (_2!4402 V!18773)) )
))
(declare-datatypes ((List!8865 0))(
  ( (Nil!8862) (Cons!8861 (h!9717 tuple2!8782) (t!14833 List!8865)) )
))
(declare-datatypes ((ListLongMap!7695 0))(
  ( (ListLongMap!7696 (toList!3863 List!8865)) )
))
(declare-fun lt!214276 () ListLongMap!7695)

(declare-fun getCurrentListMap!2234 (array!30261 array!30259 (_ BitVec 32) (_ BitVec 32) V!18773 V!18773 (_ BitVec 32) Int) ListLongMap!7695)

(assert (=> b!472306 (= lt!214276 (getCurrentListMap!2234 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!472307 () Bool)

(assert (=> b!472307 (= e!276915 (not e!276916))))

(declare-fun res!282120 () Bool)

(assert (=> b!472307 (=> res!282120 e!276916)))

(assert (=> b!472307 (= res!282120 (or (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun lt!214277 () ListLongMap!7695)

(declare-fun lt!214278 () ListLongMap!7695)

(assert (=> b!472307 (= lt!214277 lt!214278)))

(declare-datatypes ((Unit!13883 0))(
  ( (Unit!13884) )
))
(declare-fun lt!214275 () Unit!13883)

(declare-fun minValueAfter!38 () V!18773)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!205 (array!30261 array!30259 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18773 V!18773 V!18773 V!18773 (_ BitVec 32) Int) Unit!13883)

(assert (=> b!472307 (= lt!214275 (lemmaNoChangeToArrayThenSameMapNoExtras!205 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!2025 (array!30261 array!30259 (_ BitVec 32) (_ BitVec 32) V!18773 V!18773 (_ BitVec 32) Int) ListLongMap!7695)

(assert (=> b!472307 (= lt!214278 (getCurrentListMapNoExtraKeys!2025 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!472307 (= lt!214277 (getCurrentListMapNoExtraKeys!2025 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (= (and start!42332 res!282119) b!472305))

(assert (= (and b!472305 res!282122) b!472303))

(assert (= (and b!472303 res!282123) b!472301))

(assert (= (and b!472301 res!282121) b!472307))

(assert (= (and b!472307 (not res!282120)) b!472306))

(assert (= (and b!472300 condMapEmpty!21586) mapIsEmpty!21586))

(assert (= (and b!472300 (not condMapEmpty!21586)) mapNonEmpty!21586))

(get-info :version)

(assert (= (and mapNonEmpty!21586 ((_ is ValueCellFull!6282) mapValue!21586)) b!472304))

(assert (= (and b!472300 ((_ is ValueCellFull!6282) mapDefault!21586)) b!472302))

(assert (= start!42332 b!472300))

(declare-fun m!454297 () Bool)

(assert (=> start!42332 m!454297))

(declare-fun m!454299 () Bool)

(assert (=> start!42332 m!454299))

(declare-fun m!454301 () Bool)

(assert (=> start!42332 m!454301))

(declare-fun m!454303 () Bool)

(assert (=> b!472306 m!454303))

(declare-fun m!454305 () Bool)

(assert (=> b!472301 m!454305))

(declare-fun m!454307 () Bool)

(assert (=> mapNonEmpty!21586 m!454307))

(declare-fun m!454309 () Bool)

(assert (=> b!472303 m!454309))

(declare-fun m!454311 () Bool)

(assert (=> b!472307 m!454311))

(declare-fun m!454313 () Bool)

(assert (=> b!472307 m!454313))

(declare-fun m!454315 () Bool)

(assert (=> b!472307 m!454315))

(check-sat (not b_next!11823) (not b!472301) (not b!472306) (not mapNonEmpty!21586) tp_is_empty!13251 (not start!42332) b_and!20269 (not b!472307) (not b!472303))
(check-sat b_and!20269 (not b_next!11823))
