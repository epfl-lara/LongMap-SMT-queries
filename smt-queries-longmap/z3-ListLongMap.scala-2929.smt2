; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41764 () Bool)

(assert start!41764)

(declare-fun b_free!11385 () Bool)

(declare-fun b_next!11385 () Bool)

(assert (=> start!41764 (= b_free!11385 (not b_next!11385))))

(declare-fun tp!40162 () Bool)

(declare-fun b_and!19753 () Bool)

(assert (=> start!41764 (= tp!40162 b_and!19753)))

(declare-fun b!466338 () Bool)

(declare-fun e!272648 () Bool)

(assert (=> b!466338 (= e!272648 true)))

(declare-datatypes ((V!18189 0))(
  ( (V!18190 (val!6451 Int)) )
))
(declare-fun zeroValue!794 () V!18189)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((tuple2!8456 0))(
  ( (tuple2!8457 (_1!4239 (_ BitVec 64)) (_2!4239 V!18189)) )
))
(declare-datatypes ((List!8548 0))(
  ( (Nil!8545) (Cons!8544 (h!9400 tuple2!8456) (t!14500 List!8548)) )
))
(declare-datatypes ((ListLongMap!7369 0))(
  ( (ListLongMap!7370 (toList!3700 List!8548)) )
))
(declare-fun lt!210728 () ListLongMap!7369)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!29409 0))(
  ( (array!29410 (arr!14133 (Array (_ BitVec 32) (_ BitVec 64))) (size!14485 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29409)

(declare-datatypes ((ValueCell!6063 0))(
  ( (ValueCellFull!6063 (v!8739 V!18189)) (EmptyCell!6063) )
))
(declare-datatypes ((array!29411 0))(
  ( (array!29412 (arr!14134 (Array (_ BitVec 32) ValueCell!6063)) (size!14486 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29411)

(declare-fun minValueAfter!38 () V!18189)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun getCurrentListMap!2150 (array!29409 array!29411 (_ BitVec 32) (_ BitVec 32) V!18189 V!18189 (_ BitVec 32) Int) ListLongMap!7369)

(assert (=> b!466338 (= lt!210728 (getCurrentListMap!2150 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun minValueBefore!38 () V!18189)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun lt!210729 () ListLongMap!7369)

(declare-fun +!1656 (ListLongMap!7369 tuple2!8456) ListLongMap!7369)

(assert (=> b!466338 (= lt!210729 (+!1656 (getCurrentListMap!2150 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) (tuple2!8457 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38)))))

(declare-fun b!466339 () Bool)

(declare-fun res!278743 () Bool)

(declare-fun e!272650 () Bool)

(assert (=> b!466339 (=> (not res!278743) (not e!272650))))

(declare-datatypes ((List!8549 0))(
  ( (Nil!8546) (Cons!8545 (h!9401 (_ BitVec 64)) (t!14501 List!8549)) )
))
(declare-fun arrayNoDuplicates!0 (array!29409 (_ BitVec 32) List!8549) Bool)

(assert (=> b!466339 (= res!278743 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8546))))

(declare-fun res!278740 () Bool)

(assert (=> start!41764 (=> (not res!278740) (not e!272650))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41764 (= res!278740 (validMask!0 mask!1365))))

(assert (=> start!41764 e!272650))

(declare-fun tp_is_empty!12813 () Bool)

(assert (=> start!41764 tp_is_empty!12813))

(assert (=> start!41764 tp!40162))

(assert (=> start!41764 true))

(declare-fun array_inv!10204 (array!29409) Bool)

(assert (=> start!41764 (array_inv!10204 _keys!1025)))

(declare-fun e!272653 () Bool)

(declare-fun array_inv!10205 (array!29411) Bool)

(assert (=> start!41764 (and (array_inv!10205 _values!833) e!272653)))

(declare-fun b!466340 () Bool)

(declare-fun res!278744 () Bool)

(assert (=> b!466340 (=> (not res!278744) (not e!272650))))

(assert (=> b!466340 (= res!278744 (and (= (size!14486 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14485 _keys!1025) (size!14486 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!466341 () Bool)

(declare-fun e!272651 () Bool)

(assert (=> b!466341 (= e!272651 tp_is_empty!12813)))

(declare-fun b!466342 () Bool)

(declare-fun e!272652 () Bool)

(assert (=> b!466342 (= e!272652 tp_is_empty!12813)))

(declare-fun b!466343 () Bool)

(declare-fun res!278742 () Bool)

(assert (=> b!466343 (=> (not res!278742) (not e!272650))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29409 (_ BitVec 32)) Bool)

(assert (=> b!466343 (= res!278742 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!466344 () Bool)

(declare-fun mapRes!20905 () Bool)

(assert (=> b!466344 (= e!272653 (and e!272651 mapRes!20905))))

(declare-fun condMapEmpty!20905 () Bool)

(declare-fun mapDefault!20905 () ValueCell!6063)

(assert (=> b!466344 (= condMapEmpty!20905 (= (arr!14134 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6063)) mapDefault!20905)))))

(declare-fun mapIsEmpty!20905 () Bool)

(assert (=> mapIsEmpty!20905 mapRes!20905))

(declare-fun b!466345 () Bool)

(assert (=> b!466345 (= e!272650 (not e!272648))))

(declare-fun res!278741 () Bool)

(assert (=> b!466345 (=> res!278741 e!272648)))

(assert (=> b!466345 (= res!278741 (or (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!210732 () ListLongMap!7369)

(declare-fun lt!210731 () ListLongMap!7369)

(assert (=> b!466345 (= lt!210732 lt!210731)))

(declare-datatypes ((Unit!13566 0))(
  ( (Unit!13567) )
))
(declare-fun lt!210730 () Unit!13566)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!58 (array!29409 array!29411 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18189 V!18189 V!18189 V!18189 (_ BitVec 32) Int) Unit!13566)

(assert (=> b!466345 (= lt!210730 (lemmaNoChangeToArrayThenSameMapNoExtras!58 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1878 (array!29409 array!29411 (_ BitVec 32) (_ BitVec 32) V!18189 V!18189 (_ BitVec 32) Int) ListLongMap!7369)

(assert (=> b!466345 (= lt!210731 (getCurrentListMapNoExtraKeys!1878 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!466345 (= lt!210732 (getCurrentListMapNoExtraKeys!1878 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun mapNonEmpty!20905 () Bool)

(declare-fun tp!40161 () Bool)

(assert (=> mapNonEmpty!20905 (= mapRes!20905 (and tp!40161 e!272652))))

(declare-fun mapValue!20905 () ValueCell!6063)

(declare-fun mapKey!20905 () (_ BitVec 32))

(declare-fun mapRest!20905 () (Array (_ BitVec 32) ValueCell!6063))

(assert (=> mapNonEmpty!20905 (= (arr!14134 _values!833) (store mapRest!20905 mapKey!20905 mapValue!20905))))

(assert (= (and start!41764 res!278740) b!466340))

(assert (= (and b!466340 res!278744) b!466343))

(assert (= (and b!466343 res!278742) b!466339))

(assert (= (and b!466339 res!278743) b!466345))

(assert (= (and b!466345 (not res!278741)) b!466338))

(assert (= (and b!466344 condMapEmpty!20905) mapIsEmpty!20905))

(assert (= (and b!466344 (not condMapEmpty!20905)) mapNonEmpty!20905))

(get-info :version)

(assert (= (and mapNonEmpty!20905 ((_ is ValueCellFull!6063) mapValue!20905)) b!466342))

(assert (= (and b!466344 ((_ is ValueCellFull!6063) mapDefault!20905)) b!466341))

(assert (= start!41764 b!466344))

(declare-fun m!448555 () Bool)

(assert (=> b!466343 m!448555))

(declare-fun m!448557 () Bool)

(assert (=> b!466338 m!448557))

(declare-fun m!448559 () Bool)

(assert (=> b!466338 m!448559))

(assert (=> b!466338 m!448559))

(declare-fun m!448561 () Bool)

(assert (=> b!466338 m!448561))

(declare-fun m!448563 () Bool)

(assert (=> b!466339 m!448563))

(declare-fun m!448565 () Bool)

(assert (=> start!41764 m!448565))

(declare-fun m!448567 () Bool)

(assert (=> start!41764 m!448567))

(declare-fun m!448569 () Bool)

(assert (=> start!41764 m!448569))

(declare-fun m!448571 () Bool)

(assert (=> mapNonEmpty!20905 m!448571))

(declare-fun m!448573 () Bool)

(assert (=> b!466345 m!448573))

(declare-fun m!448575 () Bool)

(assert (=> b!466345 m!448575))

(declare-fun m!448577 () Bool)

(assert (=> b!466345 m!448577))

(check-sat (not start!41764) (not mapNonEmpty!20905) (not b!466338) (not b!466345) (not b_next!11385) (not b!466339) b_and!19753 (not b!466343) tp_is_empty!12813)
(check-sat b_and!19753 (not b_next!11385))
