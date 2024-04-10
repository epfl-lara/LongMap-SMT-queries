; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42506 () Bool)

(assert start!42506)

(declare-fun b_free!11961 () Bool)

(declare-fun b_next!11961 () Bool)

(assert (=> start!42506 (= b_free!11961 (not b_next!11961))))

(declare-fun tp!41919 () Bool)

(declare-fun b_and!20429 () Bool)

(assert (=> start!42506 (= tp!41919 b_and!20429)))

(declare-fun b!474285 () Bool)

(declare-fun e!278366 () Bool)

(declare-fun tp_is_empty!13389 () Bool)

(assert (=> b!474285 (= e!278366 tp_is_empty!13389)))

(declare-fun b!474286 () Bool)

(declare-fun res!283292 () Bool)

(declare-fun e!278363 () Bool)

(assert (=> b!474286 (=> (not res!283292) (not e!278363))))

(declare-datatypes ((array!30529 0))(
  ( (array!30530 (arr!14683 (Array (_ BitVec 32) (_ BitVec 64))) (size!15035 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30529)

(declare-datatypes ((List!8965 0))(
  ( (Nil!8962) (Cons!8961 (h!9817 (_ BitVec 64)) (t!14937 List!8965)) )
))
(declare-fun arrayNoDuplicates!0 (array!30529 (_ BitVec 32) List!8965) Bool)

(assert (=> b!474286 (= res!283292 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8962))))

(declare-fun mapNonEmpty!21799 () Bool)

(declare-fun mapRes!21799 () Bool)

(declare-fun tp!41920 () Bool)

(declare-fun e!278368 () Bool)

(assert (=> mapNonEmpty!21799 (= mapRes!21799 (and tp!41920 e!278368))))

(declare-datatypes ((V!18957 0))(
  ( (V!18958 (val!6739 Int)) )
))
(declare-datatypes ((ValueCell!6351 0))(
  ( (ValueCellFull!6351 (v!9031 V!18957)) (EmptyCell!6351) )
))
(declare-fun mapValue!21799 () ValueCell!6351)

(declare-datatypes ((array!30531 0))(
  ( (array!30532 (arr!14684 (Array (_ BitVec 32) ValueCell!6351)) (size!15036 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30531)

(declare-fun mapRest!21799 () (Array (_ BitVec 32) ValueCell!6351))

(declare-fun mapKey!21799 () (_ BitVec 32))

(assert (=> mapNonEmpty!21799 (= (arr!14684 _values!833) (store mapRest!21799 mapKey!21799 mapValue!21799))))

(declare-fun res!283294 () Bool)

(assert (=> start!42506 (=> (not res!283294) (not e!278363))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42506 (= res!283294 (validMask!0 mask!1365))))

(assert (=> start!42506 e!278363))

(assert (=> start!42506 tp_is_empty!13389))

(assert (=> start!42506 tp!41919))

(assert (=> start!42506 true))

(declare-fun array_inv!10596 (array!30529) Bool)

(assert (=> start!42506 (array_inv!10596 _keys!1025)))

(declare-fun e!278364 () Bool)

(declare-fun array_inv!10597 (array!30531) Bool)

(assert (=> start!42506 (and (array_inv!10597 _values!833) e!278364)))

(declare-fun mapIsEmpty!21799 () Bool)

(assert (=> mapIsEmpty!21799 mapRes!21799))

(declare-fun b!474287 () Bool)

(declare-fun e!278367 () Bool)

(assert (=> b!474287 (= e!278367 true)))

(declare-datatypes ((tuple2!8888 0))(
  ( (tuple2!8889 (_1!4455 (_ BitVec 64)) (_2!4455 V!18957)) )
))
(declare-datatypes ((List!8966 0))(
  ( (Nil!8963) (Cons!8962 (h!9818 tuple2!8888) (t!14938 List!8966)) )
))
(declare-datatypes ((ListLongMap!7801 0))(
  ( (ListLongMap!7802 (toList!3916 List!8966)) )
))
(declare-fun lt!215960 () ListLongMap!7801)

(declare-fun lt!215964 () tuple2!8888)

(declare-fun minValueBefore!38 () V!18957)

(declare-fun +!1751 (ListLongMap!7801 tuple2!8888) ListLongMap!7801)

(assert (=> b!474287 (= (+!1751 lt!215960 lt!215964) (+!1751 (+!1751 lt!215960 (tuple2!8889 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) lt!215964))))

(declare-fun minValueAfter!38 () V!18957)

(assert (=> b!474287 (= lt!215964 (tuple2!8889 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))

(declare-datatypes ((Unit!13990 0))(
  ( (Unit!13991) )
))
(declare-fun lt!215965 () Unit!13990)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!160 (ListLongMap!7801 (_ BitVec 64) V!18957 V!18957) Unit!13990)

(assert (=> b!474287 (= lt!215965 (addSameAsAddTwiceSameKeyDiffValues!160 lt!215960 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38 minValueAfter!38))))

(declare-fun lt!215963 () ListLongMap!7801)

(declare-fun zeroValue!794 () V!18957)

(assert (=> b!474287 (= lt!215960 (+!1751 lt!215963 (tuple2!8889 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794)))))

(declare-fun lt!215962 () ListLongMap!7801)

(declare-fun defaultEntry!841 () Int)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-fun getCurrentListMap!2280 (array!30529 array!30531 (_ BitVec 32) (_ BitVec 32) V!18957 V!18957 (_ BitVec 32) Int) ListLongMap!7801)

(assert (=> b!474287 (= lt!215962 (getCurrentListMap!2280 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!215961 () ListLongMap!7801)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(assert (=> b!474287 (= lt!215961 (getCurrentListMap!2280 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!474288 () Bool)

(assert (=> b!474288 (= e!278368 tp_is_empty!13389)))

(declare-fun b!474289 () Bool)

(declare-fun res!283291 () Bool)

(assert (=> b!474289 (=> (not res!283291) (not e!278363))))

(assert (=> b!474289 (= res!283291 (and (= (size!15036 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!15035 _keys!1025) (size!15036 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!474290 () Bool)

(assert (=> b!474290 (= e!278364 (and e!278366 mapRes!21799))))

(declare-fun condMapEmpty!21799 () Bool)

(declare-fun mapDefault!21799 () ValueCell!6351)

(assert (=> b!474290 (= condMapEmpty!21799 (= (arr!14684 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6351)) mapDefault!21799)))))

(declare-fun b!474291 () Bool)

(assert (=> b!474291 (= e!278363 (not e!278367))))

(declare-fun res!283295 () Bool)

(assert (=> b!474291 (=> res!283295 e!278367)))

(assert (=> b!474291 (= res!283295 (or (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun lt!215967 () ListLongMap!7801)

(assert (=> b!474291 (= lt!215963 lt!215967)))

(declare-fun lt!215966 () Unit!13990)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!253 (array!30529 array!30531 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18957 V!18957 V!18957 V!18957 (_ BitVec 32) Int) Unit!13990)

(assert (=> b!474291 (= lt!215966 (lemmaNoChangeToArrayThenSameMapNoExtras!253 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!2073 (array!30529 array!30531 (_ BitVec 32) (_ BitVec 32) V!18957 V!18957 (_ BitVec 32) Int) ListLongMap!7801)

(assert (=> b!474291 (= lt!215967 (getCurrentListMapNoExtraKeys!2073 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!474291 (= lt!215963 (getCurrentListMapNoExtraKeys!2073 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!474292 () Bool)

(declare-fun res!283293 () Bool)

(assert (=> b!474292 (=> (not res!283293) (not e!278363))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30529 (_ BitVec 32)) Bool)

(assert (=> b!474292 (= res!283293 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(assert (= (and start!42506 res!283294) b!474289))

(assert (= (and b!474289 res!283291) b!474292))

(assert (= (and b!474292 res!283293) b!474286))

(assert (= (and b!474286 res!283292) b!474291))

(assert (= (and b!474291 (not res!283295)) b!474287))

(assert (= (and b!474290 condMapEmpty!21799) mapIsEmpty!21799))

(assert (= (and b!474290 (not condMapEmpty!21799)) mapNonEmpty!21799))

(get-info :version)

(assert (= (and mapNonEmpty!21799 ((_ is ValueCellFull!6351) mapValue!21799)) b!474288))

(assert (= (and b!474290 ((_ is ValueCellFull!6351) mapDefault!21799)) b!474285))

(assert (= start!42506 b!474290))

(declare-fun m!456589 () Bool)

(assert (=> b!474287 m!456589))

(declare-fun m!456591 () Bool)

(assert (=> b!474287 m!456591))

(declare-fun m!456593 () Bool)

(assert (=> b!474287 m!456593))

(declare-fun m!456595 () Bool)

(assert (=> b!474287 m!456595))

(declare-fun m!456597 () Bool)

(assert (=> b!474287 m!456597))

(assert (=> b!474287 m!456595))

(declare-fun m!456599 () Bool)

(assert (=> b!474287 m!456599))

(declare-fun m!456601 () Bool)

(assert (=> b!474287 m!456601))

(declare-fun m!456603 () Bool)

(assert (=> start!42506 m!456603))

(declare-fun m!456605 () Bool)

(assert (=> start!42506 m!456605))

(declare-fun m!456607 () Bool)

(assert (=> start!42506 m!456607))

(declare-fun m!456609 () Bool)

(assert (=> b!474286 m!456609))

(declare-fun m!456611 () Bool)

(assert (=> b!474292 m!456611))

(declare-fun m!456613 () Bool)

(assert (=> mapNonEmpty!21799 m!456613))

(declare-fun m!456615 () Bool)

(assert (=> b!474291 m!456615))

(declare-fun m!456617 () Bool)

(assert (=> b!474291 m!456617))

(declare-fun m!456619 () Bool)

(assert (=> b!474291 m!456619))

(check-sat (not start!42506) (not b!474292) b_and!20429 (not mapNonEmpty!21799) (not b!474287) (not b!474291) (not b!474286) tp_is_empty!13389 (not b_next!11961))
(check-sat b_and!20429 (not b_next!11961))
