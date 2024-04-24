; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42328 () Bool)

(assert start!42328)

(declare-fun b_free!11833 () Bool)

(declare-fun b_next!11833 () Bool)

(assert (=> start!42328 (= b_free!11833 (not b_next!11833))))

(declare-fun tp!41529 () Bool)

(declare-fun b_and!20289 () Bool)

(assert (=> start!42328 (= tp!41529 b_and!20289)))

(declare-fun b!472359 () Bool)

(declare-fun e!276966 () Bool)

(declare-fun tp_is_empty!13261 () Bool)

(assert (=> b!472359 (= e!276966 tp_is_empty!13261)))

(declare-fun mapIsEmpty!21601 () Bool)

(declare-fun mapRes!21601 () Bool)

(assert (=> mapIsEmpty!21601 mapRes!21601))

(declare-fun res!282189 () Bool)

(declare-fun e!276967 () Bool)

(assert (=> start!42328 (=> (not res!282189) (not e!276967))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42328 (= res!282189 (validMask!0 mask!1365))))

(assert (=> start!42328 e!276967))

(assert (=> start!42328 tp_is_empty!13261))

(assert (=> start!42328 tp!41529))

(assert (=> start!42328 true))

(declare-datatypes ((array!30268 0))(
  ( (array!30269 (arr!14554 (Array (_ BitVec 32) (_ BitVec 64))) (size!14906 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30268)

(declare-fun array_inv!10584 (array!30268) Bool)

(assert (=> start!42328 (array_inv!10584 _keys!1025)))

(declare-datatypes ((V!18787 0))(
  ( (V!18788 (val!6675 Int)) )
))
(declare-datatypes ((ValueCell!6287 0))(
  ( (ValueCellFull!6287 (v!8967 V!18787)) (EmptyCell!6287) )
))
(declare-datatypes ((array!30270 0))(
  ( (array!30271 (arr!14555 (Array (_ BitVec 32) ValueCell!6287)) (size!14907 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30270)

(declare-fun e!276970 () Bool)

(declare-fun array_inv!10585 (array!30270) Bool)

(assert (=> start!42328 (and (array_inv!10585 _values!833) e!276970)))

(declare-fun b!472360 () Bool)

(declare-fun e!276969 () Bool)

(assert (=> b!472360 (= e!276969 tp_is_empty!13261)))

(declare-fun b!472361 () Bool)

(declare-fun res!282190 () Bool)

(assert (=> b!472361 (=> (not res!282190) (not e!276967))))

(declare-datatypes ((List!8781 0))(
  ( (Nil!8778) (Cons!8777 (h!9633 (_ BitVec 64)) (t!14741 List!8781)) )
))
(declare-fun arrayNoDuplicates!0 (array!30268 (_ BitVec 32) List!8781) Bool)

(assert (=> b!472361 (= res!282190 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8778))))

(declare-fun b!472362 () Bool)

(declare-fun res!282188 () Bool)

(assert (=> b!472362 (=> (not res!282188) (not e!276967))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30268 (_ BitVec 32)) Bool)

(assert (=> b!472362 (= res!282188 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!472363 () Bool)

(declare-fun e!276965 () Bool)

(assert (=> b!472363 (= e!276967 (not e!276965))))

(declare-fun res!282187 () Bool)

(assert (=> b!472363 (=> res!282187 e!276965)))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(assert (=> b!472363 (= res!282187 (or (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!8716 0))(
  ( (tuple2!8717 (_1!4369 (_ BitVec 64)) (_2!4369 V!18787)) )
))
(declare-datatypes ((List!8782 0))(
  ( (Nil!8779) (Cons!8778 (h!9634 tuple2!8716) (t!14742 List!8782)) )
))
(declare-datatypes ((ListLongMap!7631 0))(
  ( (ListLongMap!7632 (toList!3831 List!8782)) )
))
(declare-fun lt!214347 () ListLongMap!7631)

(declare-fun lt!214350 () ListLongMap!7631)

(assert (=> b!472363 (= lt!214347 lt!214350)))

(declare-fun minValueBefore!38 () V!18787)

(declare-fun zeroValue!794 () V!18787)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((Unit!13871 0))(
  ( (Unit!13872) )
))
(declare-fun lt!214349 () Unit!13871)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-fun minValueAfter!38 () V!18787)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!204 (array!30268 array!30270 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18787 V!18787 V!18787 V!18787 (_ BitVec 32) Int) Unit!13871)

(assert (=> b!472363 (= lt!214349 (lemmaNoChangeToArrayThenSameMapNoExtras!204 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!2044 (array!30268 array!30270 (_ BitVec 32) (_ BitVec 32) V!18787 V!18787 (_ BitVec 32) Int) ListLongMap!7631)

(assert (=> b!472363 (= lt!214350 (getCurrentListMapNoExtraKeys!2044 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!472363 (= lt!214347 (getCurrentListMapNoExtraKeys!2044 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!472364 () Bool)

(assert (=> b!472364 (= e!276965 true)))

(declare-fun lt!214348 () ListLongMap!7631)

(declare-fun getCurrentListMap!2199 (array!30268 array!30270 (_ BitVec 32) (_ BitVec 32) V!18787 V!18787 (_ BitVec 32) Int) ListLongMap!7631)

(assert (=> b!472364 (= lt!214348 (getCurrentListMap!2199 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!472365 () Bool)

(assert (=> b!472365 (= e!276970 (and e!276966 mapRes!21601))))

(declare-fun condMapEmpty!21601 () Bool)

(declare-fun mapDefault!21601 () ValueCell!6287)

(assert (=> b!472365 (= condMapEmpty!21601 (= (arr!14555 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6287)) mapDefault!21601)))))

(declare-fun b!472366 () Bool)

(declare-fun res!282191 () Bool)

(assert (=> b!472366 (=> (not res!282191) (not e!276967))))

(assert (=> b!472366 (= res!282191 (and (= (size!14907 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14906 _keys!1025) (size!14907 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapNonEmpty!21601 () Bool)

(declare-fun tp!41530 () Bool)

(assert (=> mapNonEmpty!21601 (= mapRes!21601 (and tp!41530 e!276969))))

(declare-fun mapKey!21601 () (_ BitVec 32))

(declare-fun mapRest!21601 () (Array (_ BitVec 32) ValueCell!6287))

(declare-fun mapValue!21601 () ValueCell!6287)

(assert (=> mapNonEmpty!21601 (= (arr!14555 _values!833) (store mapRest!21601 mapKey!21601 mapValue!21601))))

(assert (= (and start!42328 res!282189) b!472366))

(assert (= (and b!472366 res!282191) b!472362))

(assert (= (and b!472362 res!282188) b!472361))

(assert (= (and b!472361 res!282190) b!472363))

(assert (= (and b!472363 (not res!282187)) b!472364))

(assert (= (and b!472365 condMapEmpty!21601) mapIsEmpty!21601))

(assert (= (and b!472365 (not condMapEmpty!21601)) mapNonEmpty!21601))

(get-info :version)

(assert (= (and mapNonEmpty!21601 ((_ is ValueCellFull!6287) mapValue!21601)) b!472360))

(assert (= (and b!472365 ((_ is ValueCellFull!6287) mapDefault!21601)) b!472359))

(assert (= start!42328 b!472365))

(declare-fun m!454579 () Bool)

(assert (=> b!472364 m!454579))

(declare-fun m!454581 () Bool)

(assert (=> start!42328 m!454581))

(declare-fun m!454583 () Bool)

(assert (=> start!42328 m!454583))

(declare-fun m!454585 () Bool)

(assert (=> start!42328 m!454585))

(declare-fun m!454587 () Bool)

(assert (=> b!472363 m!454587))

(declare-fun m!454589 () Bool)

(assert (=> b!472363 m!454589))

(declare-fun m!454591 () Bool)

(assert (=> b!472363 m!454591))

(declare-fun m!454593 () Bool)

(assert (=> b!472362 m!454593))

(declare-fun m!454595 () Bool)

(assert (=> b!472361 m!454595))

(declare-fun m!454597 () Bool)

(assert (=> mapNonEmpty!21601 m!454597))

(check-sat b_and!20289 (not start!42328) (not b!472361) tp_is_empty!13261 (not b!472364) (not b_next!11833) (not b!472363) (not mapNonEmpty!21601) (not b!472362))
(check-sat b_and!20289 (not b_next!11833))
