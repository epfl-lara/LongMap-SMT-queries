; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41694 () Bool)

(assert start!41694)

(declare-fun b_free!11347 () Bool)

(declare-fun b_next!11347 () Bool)

(assert (=> start!41694 (= b_free!11347 (not b_next!11347))))

(declare-fun tp!40044 () Bool)

(declare-fun b_and!19713 () Bool)

(assert (=> start!41694 (= tp!40044 b_and!19713)))

(declare-fun b!465637 () Bool)

(declare-fun e!272161 () Bool)

(assert (=> b!465637 (= e!272161 true)))

(declare-datatypes ((V!18139 0))(
  ( (V!18140 (val!6432 Int)) )
))
(declare-datatypes ((tuple2!8366 0))(
  ( (tuple2!8367 (_1!4194 (_ BitVec 64)) (_2!4194 V!18139)) )
))
(declare-datatypes ((List!8453 0))(
  ( (Nil!8450) (Cons!8449 (h!9305 tuple2!8366) (t!14395 List!8453)) )
))
(declare-datatypes ((ListLongMap!7281 0))(
  ( (ListLongMap!7282 (toList!3656 List!8453)) )
))
(declare-fun lt!210335 () ListLongMap!7281)

(declare-fun zeroValue!794 () V!18139)

(declare-fun defaultEntry!841 () Int)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!29332 0))(
  ( (array!29333 (arr!14095 (Array (_ BitVec 32) (_ BitVec 64))) (size!14447 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29332)

(declare-datatypes ((ValueCell!6044 0))(
  ( (ValueCellFull!6044 (v!8720 V!18139)) (EmptyCell!6044) )
))
(declare-datatypes ((array!29334 0))(
  ( (array!29335 (arr!14096 (Array (_ BitVec 32) ValueCell!6044)) (size!14448 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29334)

(declare-fun minValueAfter!38 () V!18139)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun getCurrentListMap!2106 (array!29332 array!29334 (_ BitVec 32) (_ BitVec 32) V!18139 V!18139 (_ BitVec 32) Int) ListLongMap!7281)

(assert (=> b!465637 (= lt!210335 (getCurrentListMap!2106 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun minValueBefore!38 () V!18139)

(declare-fun lt!210333 () ListLongMap!7281)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun +!1655 (ListLongMap!7281 tuple2!8366) ListLongMap!7281)

(assert (=> b!465637 (= lt!210333 (+!1655 (getCurrentListMap!2106 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) (tuple2!8367 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38)))))

(declare-fun b!465638 () Bool)

(declare-fun res!278367 () Bool)

(declare-fun e!272158 () Bool)

(assert (=> b!465638 (=> (not res!278367) (not e!272158))))

(declare-datatypes ((List!8454 0))(
  ( (Nil!8451) (Cons!8450 (h!9306 (_ BitVec 64)) (t!14396 List!8454)) )
))
(declare-fun arrayNoDuplicates!0 (array!29332 (_ BitVec 32) List!8454) Bool)

(assert (=> b!465638 (= res!278367 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8451))))

(declare-fun mapIsEmpty!20845 () Bool)

(declare-fun mapRes!20845 () Bool)

(assert (=> mapIsEmpty!20845 mapRes!20845))

(declare-fun b!465639 () Bool)

(assert (=> b!465639 (= e!272158 (not e!272161))))

(declare-fun res!278370 () Bool)

(assert (=> b!465639 (=> res!278370 e!272161)))

(assert (=> b!465639 (= res!278370 (or (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!210334 () ListLongMap!7281)

(declare-fun lt!210336 () ListLongMap!7281)

(assert (=> b!465639 (= lt!210334 lt!210336)))

(declare-datatypes ((Unit!13530 0))(
  ( (Unit!13531) )
))
(declare-fun lt!210337 () Unit!13530)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!43 (array!29332 array!29334 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18139 V!18139 V!18139 V!18139 (_ BitVec 32) Int) Unit!13530)

(assert (=> b!465639 (= lt!210337 (lemmaNoChangeToArrayThenSameMapNoExtras!43 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1883 (array!29332 array!29334 (_ BitVec 32) (_ BitVec 32) V!18139 V!18139 (_ BitVec 32) Int) ListLongMap!7281)

(assert (=> b!465639 (= lt!210336 (getCurrentListMapNoExtraKeys!1883 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!465639 (= lt!210334 (getCurrentListMapNoExtraKeys!1883 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun res!278369 () Bool)

(assert (=> start!41694 (=> (not res!278369) (not e!272158))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41694 (= res!278369 (validMask!0 mask!1365))))

(assert (=> start!41694 e!272158))

(declare-fun tp_is_empty!12775 () Bool)

(assert (=> start!41694 tp_is_empty!12775))

(assert (=> start!41694 tp!40044))

(assert (=> start!41694 true))

(declare-fun array_inv!10258 (array!29332) Bool)

(assert (=> start!41694 (array_inv!10258 _keys!1025)))

(declare-fun e!272159 () Bool)

(declare-fun array_inv!10259 (array!29334) Bool)

(assert (=> start!41694 (and (array_inv!10259 _values!833) e!272159)))

(declare-fun b!465640 () Bool)

(declare-fun res!278368 () Bool)

(assert (=> b!465640 (=> (not res!278368) (not e!272158))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29332 (_ BitVec 32)) Bool)

(assert (=> b!465640 (= res!278368 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun mapNonEmpty!20845 () Bool)

(declare-fun tp!40045 () Bool)

(declare-fun e!272162 () Bool)

(assert (=> mapNonEmpty!20845 (= mapRes!20845 (and tp!40045 e!272162))))

(declare-fun mapRest!20845 () (Array (_ BitVec 32) ValueCell!6044))

(declare-fun mapValue!20845 () ValueCell!6044)

(declare-fun mapKey!20845 () (_ BitVec 32))

(assert (=> mapNonEmpty!20845 (= (arr!14096 _values!833) (store mapRest!20845 mapKey!20845 mapValue!20845))))

(declare-fun b!465641 () Bool)

(declare-fun e!272160 () Bool)

(assert (=> b!465641 (= e!272159 (and e!272160 mapRes!20845))))

(declare-fun condMapEmpty!20845 () Bool)

(declare-fun mapDefault!20845 () ValueCell!6044)

(assert (=> b!465641 (= condMapEmpty!20845 (= (arr!14096 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6044)) mapDefault!20845)))))

(declare-fun b!465642 () Bool)

(assert (=> b!465642 (= e!272160 tp_is_empty!12775)))

(declare-fun b!465643 () Bool)

(assert (=> b!465643 (= e!272162 tp_is_empty!12775)))

(declare-fun b!465644 () Bool)

(declare-fun res!278366 () Bool)

(assert (=> b!465644 (=> (not res!278366) (not e!272158))))

(assert (=> b!465644 (= res!278366 (and (= (size!14448 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14447 _keys!1025) (size!14448 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and start!41694 res!278369) b!465644))

(assert (= (and b!465644 res!278366) b!465640))

(assert (= (and b!465640 res!278368) b!465638))

(assert (= (and b!465638 res!278367) b!465639))

(assert (= (and b!465639 (not res!278370)) b!465637))

(assert (= (and b!465641 condMapEmpty!20845) mapIsEmpty!20845))

(assert (= (and b!465641 (not condMapEmpty!20845)) mapNonEmpty!20845))

(get-info :version)

(assert (= (and mapNonEmpty!20845 ((_ is ValueCellFull!6044) mapValue!20845)) b!465643))

(assert (= (and b!465641 ((_ is ValueCellFull!6044) mapDefault!20845)) b!465642))

(assert (= start!41694 b!465641))

(declare-fun m!448111 () Bool)

(assert (=> b!465639 m!448111))

(declare-fun m!448113 () Bool)

(assert (=> b!465639 m!448113))

(declare-fun m!448115 () Bool)

(assert (=> b!465639 m!448115))

(declare-fun m!448117 () Bool)

(assert (=> b!465637 m!448117))

(declare-fun m!448119 () Bool)

(assert (=> b!465637 m!448119))

(assert (=> b!465637 m!448119))

(declare-fun m!448121 () Bool)

(assert (=> b!465637 m!448121))

(declare-fun m!448123 () Bool)

(assert (=> b!465638 m!448123))

(declare-fun m!448125 () Bool)

(assert (=> mapNonEmpty!20845 m!448125))

(declare-fun m!448127 () Bool)

(assert (=> start!41694 m!448127))

(declare-fun m!448129 () Bool)

(assert (=> start!41694 m!448129))

(declare-fun m!448131 () Bool)

(assert (=> start!41694 m!448131))

(declare-fun m!448133 () Bool)

(assert (=> b!465640 m!448133))

(check-sat (not b!465638) (not b_next!11347) tp_is_empty!12775 (not start!41694) b_and!19713 (not b!465639) (not b!465640) (not mapNonEmpty!20845) (not b!465637))
(check-sat b_and!19713 (not b_next!11347))
