; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41570 () Bool)

(assert start!41570)

(declare-fun b_free!11251 () Bool)

(declare-fun b_next!11251 () Bool)

(assert (=> start!41570 (= b_free!11251 (not b_next!11251))))

(declare-fun tp!39750 () Bool)

(declare-fun b_and!19565 () Bool)

(assert (=> start!41570 (= tp!39750 b_and!19565)))

(declare-fun b!464211 () Bool)

(declare-fun res!277571 () Bool)

(declare-fun e!271154 () Bool)

(assert (=> b!464211 (=> (not res!277571) (not e!271154))))

(declare-datatypes ((array!29141 0))(
  ( (array!29142 (arr!14002 (Array (_ BitVec 32) (_ BitVec 64))) (size!14355 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29141)

(declare-datatypes ((List!8480 0))(
  ( (Nil!8477) (Cons!8476 (h!9332 (_ BitVec 64)) (t!14417 List!8480)) )
))
(declare-fun arrayNoDuplicates!0 (array!29141 (_ BitVec 32) List!8480) Bool)

(assert (=> b!464211 (= res!277571 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8477))))

(declare-fun b!464212 () Bool)

(declare-fun e!271157 () Bool)

(declare-fun e!271155 () Bool)

(declare-fun mapRes!20695 () Bool)

(assert (=> b!464212 (= e!271157 (and e!271155 mapRes!20695))))

(declare-fun condMapEmpty!20695 () Bool)

(declare-datatypes ((V!18011 0))(
  ( (V!18012 (val!6384 Int)) )
))
(declare-datatypes ((ValueCell!5996 0))(
  ( (ValueCellFull!5996 (v!8665 V!18011)) (EmptyCell!5996) )
))
(declare-datatypes ((array!29143 0))(
  ( (array!29144 (arr!14003 (Array (_ BitVec 32) ValueCell!5996)) (size!14356 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29143)

(declare-fun mapDefault!20695 () ValueCell!5996)

(assert (=> b!464212 (= condMapEmpty!20695 (= (arr!14003 _values!833) ((as const (Array (_ BitVec 32) ValueCell!5996)) mapDefault!20695)))))

(declare-fun b!464213 () Bool)

(declare-fun res!277570 () Bool)

(assert (=> b!464213 (=> (not res!277570) (not e!271154))))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-fun mask!1365 () (_ BitVec 32))

(assert (=> b!464213 (= res!277570 (and (= (size!14356 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14355 _keys!1025) (size!14356 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapNonEmpty!20695 () Bool)

(declare-fun tp!39751 () Bool)

(declare-fun e!271158 () Bool)

(assert (=> mapNonEmpty!20695 (= mapRes!20695 (and tp!39751 e!271158))))

(declare-fun mapValue!20695 () ValueCell!5996)

(declare-fun mapRest!20695 () (Array (_ BitVec 32) ValueCell!5996))

(declare-fun mapKey!20695 () (_ BitVec 32))

(assert (=> mapNonEmpty!20695 (= (arr!14003 _values!833) (store mapRest!20695 mapKey!20695 mapValue!20695))))

(declare-fun b!464214 () Bool)

(declare-fun tp_is_empty!12679 () Bool)

(assert (=> b!464214 (= e!271155 tp_is_empty!12679)))

(declare-fun b!464215 () Bool)

(assert (=> b!464215 (= e!271158 tp_is_empty!12679)))

(declare-fun res!277569 () Bool)

(assert (=> start!41570 (=> (not res!277569) (not e!271154))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41570 (= res!277569 (validMask!0 mask!1365))))

(assert (=> start!41570 e!271154))

(assert (=> start!41570 tp_is_empty!12679))

(assert (=> start!41570 tp!39750))

(assert (=> start!41570 true))

(declare-fun array_inv!10192 (array!29141) Bool)

(assert (=> start!41570 (array_inv!10192 _keys!1025)))

(declare-fun array_inv!10193 (array!29143) Bool)

(assert (=> start!41570 (and (array_inv!10193 _values!833) e!271157)))

(declare-fun b!464216 () Bool)

(declare-fun res!277568 () Bool)

(assert (=> b!464216 (=> (not res!277568) (not e!271154))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29141 (_ BitVec 32)) Bool)

(assert (=> b!464216 (= res!277568 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun mapIsEmpty!20695 () Bool)

(assert (=> mapIsEmpty!20695 mapRes!20695))

(declare-fun b!464217 () Bool)

(assert (=> b!464217 (= e!271154 (not true))))

(declare-datatypes ((tuple2!8392 0))(
  ( (tuple2!8393 (_1!4207 (_ BitVec 64)) (_2!4207 V!18011)) )
))
(declare-datatypes ((List!8481 0))(
  ( (Nil!8478) (Cons!8477 (h!9333 tuple2!8392) (t!14418 List!8481)) )
))
(declare-datatypes ((ListLongMap!7295 0))(
  ( (ListLongMap!7296 (toList!3663 List!8481)) )
))
(declare-fun lt!209500 () ListLongMap!7295)

(declare-fun lt!209501 () ListLongMap!7295)

(assert (=> b!464217 (= lt!209500 lt!209501)))

(declare-fun minValueBefore!38 () V!18011)

(declare-fun zeroValue!794 () V!18011)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((Unit!13442 0))(
  ( (Unit!13443) )
))
(declare-fun lt!209499 () Unit!13442)

(declare-fun minValueAfter!38 () V!18011)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!12 (array!29141 array!29143 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18011 V!18011 V!18011 V!18011 (_ BitVec 32) Int) Unit!13442)

(assert (=> b!464217 (= lt!209499 (lemmaNoChangeToArrayThenSameMapNoExtras!12 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1855 (array!29141 array!29143 (_ BitVec 32) (_ BitVec 32) V!18011 V!18011 (_ BitVec 32) Int) ListLongMap!7295)

(assert (=> b!464217 (= lt!209501 (getCurrentListMapNoExtraKeys!1855 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!464217 (= lt!209500 (getCurrentListMapNoExtraKeys!1855 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (= (and start!41570 res!277569) b!464213))

(assert (= (and b!464213 res!277570) b!464216))

(assert (= (and b!464216 res!277568) b!464211))

(assert (= (and b!464211 res!277571) b!464217))

(assert (= (and b!464212 condMapEmpty!20695) mapIsEmpty!20695))

(assert (= (and b!464212 (not condMapEmpty!20695)) mapNonEmpty!20695))

(get-info :version)

(assert (= (and mapNonEmpty!20695 ((_ is ValueCellFull!5996) mapValue!20695)) b!464215))

(assert (= (and b!464212 ((_ is ValueCellFull!5996) mapDefault!20695)) b!464214))

(assert (= start!41570 b!464212))

(declare-fun m!446127 () Bool)

(assert (=> b!464217 m!446127))

(declare-fun m!446129 () Bool)

(assert (=> b!464217 m!446129))

(declare-fun m!446131 () Bool)

(assert (=> b!464217 m!446131))

(declare-fun m!446133 () Bool)

(assert (=> mapNonEmpty!20695 m!446133))

(declare-fun m!446135 () Bool)

(assert (=> b!464211 m!446135))

(declare-fun m!446137 () Bool)

(assert (=> b!464216 m!446137))

(declare-fun m!446139 () Bool)

(assert (=> start!41570 m!446139))

(declare-fun m!446141 () Bool)

(assert (=> start!41570 m!446141))

(declare-fun m!446143 () Bool)

(assert (=> start!41570 m!446143))

(check-sat b_and!19565 (not b!464211) (not mapNonEmpty!20695) (not b!464217) (not b!464216) (not start!41570) tp_is_empty!12679 (not b_next!11251))
(check-sat b_and!19565 (not b_next!11251))
