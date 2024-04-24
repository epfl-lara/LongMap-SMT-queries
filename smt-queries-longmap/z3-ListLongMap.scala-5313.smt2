; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71264 () Bool)

(assert start!71264)

(declare-fun b_free!13285 () Bool)

(declare-fun b_next!13285 () Bool)

(assert (=> start!71264 (= b_free!13285 (not b_next!13285))))

(declare-fun tp!46612 () Bool)

(declare-fun b_and!22209 () Bool)

(assert (=> start!71264 (= tp!46612 b_and!22209)))

(declare-fun b!826632 () Bool)

(declare-fun e!460253 () Bool)

(declare-fun tp_is_empty!14995 () Bool)

(assert (=> b!826632 (= e!460253 tp_is_empty!14995)))

(declare-fun b!826633 () Bool)

(declare-fun e!460257 () Bool)

(assert (=> b!826633 (= e!460257 tp_is_empty!14995)))

(declare-datatypes ((V!24995 0))(
  ( (V!24996 (val!7545 Int)) )
))
(declare-datatypes ((tuple2!9914 0))(
  ( (tuple2!9915 (_1!4968 (_ BitVec 64)) (_2!4968 V!24995)) )
))
(declare-datatypes ((List!15696 0))(
  ( (Nil!15693) (Cons!15692 (h!16827 tuple2!9914) (t!22033 List!15696)) )
))
(declare-datatypes ((ListLongMap!8739 0))(
  ( (ListLongMap!8740 (toList!4385 List!15696)) )
))
(declare-fun lt!373447 () ListLongMap!8739)

(declare-fun e!460254 () Bool)

(declare-fun b!826634 () Bool)

(declare-fun lt!373450 () ListLongMap!8739)

(declare-fun lt!373445 () tuple2!9914)

(declare-fun lt!373452 () tuple2!9914)

(declare-fun +!1932 (ListLongMap!8739 tuple2!9914) ListLongMap!8739)

(assert (=> b!826634 (= e!460254 (= lt!373450 (+!1932 (+!1932 lt!373447 lt!373452) lt!373445)))))

(declare-fun b!826635 () Bool)

(declare-fun res!563252 () Bool)

(declare-fun e!460252 () Bool)

(assert (=> b!826635 (=> (not res!563252) (not e!460252))))

(declare-datatypes ((array!46173 0))(
  ( (array!46174 (arr!22128 (Array (_ BitVec 32) (_ BitVec 64))) (size!22548 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46173)

(declare-datatypes ((List!15697 0))(
  ( (Nil!15694) (Cons!15693 (h!16828 (_ BitVec 64)) (t!22034 List!15697)) )
))
(declare-fun arrayNoDuplicates!0 (array!46173 (_ BitVec 32) List!15697) Bool)

(assert (=> b!826635 (= res!563252 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15694))))

(declare-fun b!826637 () Bool)

(declare-fun e!460258 () Bool)

(declare-fun mapRes!24115 () Bool)

(assert (=> b!826637 (= e!460258 (and e!460257 mapRes!24115))))

(declare-fun condMapEmpty!24115 () Bool)

(declare-datatypes ((ValueCell!7082 0))(
  ( (ValueCellFull!7082 (v!9978 V!24995)) (EmptyCell!7082) )
))
(declare-datatypes ((array!46175 0))(
  ( (array!46176 (arr!22129 (Array (_ BitVec 32) ValueCell!7082)) (size!22549 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46175)

(declare-fun mapDefault!24115 () ValueCell!7082)

(assert (=> b!826637 (= condMapEmpty!24115 (= (arr!22129 _values!788) ((as const (Array (_ BitVec 32) ValueCell!7082)) mapDefault!24115)))))

(declare-fun mapNonEmpty!24115 () Bool)

(declare-fun tp!46611 () Bool)

(assert (=> mapNonEmpty!24115 (= mapRes!24115 (and tp!46611 e!460253))))

(declare-fun mapKey!24115 () (_ BitVec 32))

(declare-fun mapValue!24115 () ValueCell!7082)

(declare-fun mapRest!24115 () (Array (_ BitVec 32) ValueCell!7082))

(assert (=> mapNonEmpty!24115 (= (arr!22129 _values!788) (store mapRest!24115 mapKey!24115 mapValue!24115))))

(declare-fun b!826638 () Bool)

(declare-fun e!460259 () Bool)

(assert (=> b!826638 (= e!460252 (not e!460259))))

(declare-fun res!563253 () Bool)

(assert (=> b!826638 (=> res!563253 e!460259)))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!826638 (= res!563253 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun lt!373456 () ListLongMap!8739)

(assert (=> b!826638 (= lt!373456 lt!373447)))

(declare-fun zeroValueBefore!34 () V!24995)

(declare-fun zeroValueAfter!34 () V!24995)

(declare-fun minValue!754 () V!24995)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-datatypes ((Unit!28320 0))(
  ( (Unit!28321) )
))
(declare-fun lt!373448 () Unit!28320)

(declare-fun defaultEntry!796 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!552 (array!46173 array!46175 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24995 V!24995 V!24995 V!24995 (_ BitVec 32) Int) Unit!28320)

(assert (=> b!826638 (= lt!373448 (lemmaNoChangeToArrayThenSameMapNoExtras!552 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2464 (array!46173 array!46175 (_ BitVec 32) (_ BitVec 32) V!24995 V!24995 (_ BitVec 32) Int) ListLongMap!8739)

(assert (=> b!826638 (= lt!373447 (getCurrentListMapNoExtraKeys!2464 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!826638 (= lt!373456 (getCurrentListMapNoExtraKeys!2464 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!826636 () Bool)

(declare-fun res!563255 () Bool)

(assert (=> b!826636 (=> (not res!563255) (not e!460252))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46173 (_ BitVec 32)) Bool)

(assert (=> b!826636 (= res!563255 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun res!563256 () Bool)

(assert (=> start!71264 (=> (not res!563256) (not e!460252))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71264 (= res!563256 (validMask!0 mask!1312))))

(assert (=> start!71264 e!460252))

(assert (=> start!71264 tp_is_empty!14995))

(declare-fun array_inv!17681 (array!46173) Bool)

(assert (=> start!71264 (array_inv!17681 _keys!976)))

(assert (=> start!71264 true))

(declare-fun array_inv!17682 (array!46175) Bool)

(assert (=> start!71264 (and (array_inv!17682 _values!788) e!460258)))

(assert (=> start!71264 tp!46612))

(declare-fun e!460255 () Bool)

(declare-fun b!826639 () Bool)

(assert (=> b!826639 (= e!460255 (= lt!373450 (+!1932 (+!1932 lt!373447 (tuple2!9915 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) lt!373452)))))

(declare-fun mapIsEmpty!24115 () Bool)

(assert (=> mapIsEmpty!24115 mapRes!24115))

(declare-fun b!826640 () Bool)

(declare-fun res!563254 () Bool)

(assert (=> b!826640 (=> (not res!563254) (not e!460252))))

(assert (=> b!826640 (= res!563254 (and (= (size!22549 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22548 _keys!976) (size!22549 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!826641 () Bool)

(assert (=> b!826641 (= e!460259 true)))

(declare-fun lt!373455 () ListLongMap!8739)

(assert (=> b!826641 (= lt!373455 (+!1932 (+!1932 lt!373456 lt!373445) lt!373452))))

(declare-fun lt!373451 () ListLongMap!8739)

(declare-fun lt!373446 () ListLongMap!8739)

(assert (=> b!826641 (and (= lt!373451 lt!373446) (= lt!373450 lt!373446) (= lt!373450 lt!373451))))

(declare-fun lt!373449 () ListLongMap!8739)

(assert (=> b!826641 (= lt!373446 (+!1932 lt!373449 lt!373445))))

(declare-fun lt!373458 () ListLongMap!8739)

(assert (=> b!826641 (= lt!373451 (+!1932 lt!373458 lt!373445))))

(declare-fun lt!373454 () Unit!28320)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!218 (ListLongMap!8739 (_ BitVec 64) V!24995 V!24995) Unit!28320)

(assert (=> b!826641 (= lt!373454 (addSameAsAddTwiceSameKeyDiffValues!218 lt!373458 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34 zeroValueAfter!34))))

(assert (=> b!826641 e!460254))

(declare-fun res!563258 () Bool)

(assert (=> b!826641 (=> (not res!563258) (not e!460254))))

(declare-fun lt!373457 () ListLongMap!8739)

(assert (=> b!826641 (= res!563258 (= lt!373457 lt!373449))))

(declare-fun lt!373453 () tuple2!9914)

(assert (=> b!826641 (= lt!373449 (+!1932 lt!373458 lt!373453))))

(assert (=> b!826641 (= lt!373458 (+!1932 lt!373456 lt!373452))))

(assert (=> b!826641 (= lt!373445 (tuple2!9915 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(assert (=> b!826641 e!460255))

(declare-fun res!563257 () Bool)

(assert (=> b!826641 (=> (not res!563257) (not e!460255))))

(assert (=> b!826641 (= res!563257 (= lt!373457 (+!1932 (+!1932 lt!373456 lt!373453) lt!373452)))))

(assert (=> b!826641 (= lt!373452 (tuple2!9915 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(assert (=> b!826641 (= lt!373453 (tuple2!9915 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))

(declare-fun getCurrentListMap!2509 (array!46173 array!46175 (_ BitVec 32) (_ BitVec 32) V!24995 V!24995 (_ BitVec 32) Int) ListLongMap!8739)

(assert (=> b!826641 (= lt!373450 (getCurrentListMap!2509 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!826641 (= lt!373457 (getCurrentListMap!2509 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (= (and start!71264 res!563256) b!826640))

(assert (= (and b!826640 res!563254) b!826636))

(assert (= (and b!826636 res!563255) b!826635))

(assert (= (and b!826635 res!563252) b!826638))

(assert (= (and b!826638 (not res!563253)) b!826641))

(assert (= (and b!826641 res!563257) b!826639))

(assert (= (and b!826641 res!563258) b!826634))

(assert (= (and b!826637 condMapEmpty!24115) mapIsEmpty!24115))

(assert (= (and b!826637 (not condMapEmpty!24115)) mapNonEmpty!24115))

(get-info :version)

(assert (= (and mapNonEmpty!24115 ((_ is ValueCellFull!7082) mapValue!24115)) b!826632))

(assert (= (and b!826637 ((_ is ValueCellFull!7082) mapDefault!24115)) b!826633))

(assert (= start!71264 b!826637))

(declare-fun m!769359 () Bool)

(assert (=> b!826639 m!769359))

(assert (=> b!826639 m!769359))

(declare-fun m!769361 () Bool)

(assert (=> b!826639 m!769361))

(declare-fun m!769363 () Bool)

(assert (=> b!826635 m!769363))

(declare-fun m!769365 () Bool)

(assert (=> b!826638 m!769365))

(declare-fun m!769367 () Bool)

(assert (=> b!826638 m!769367))

(declare-fun m!769369 () Bool)

(assert (=> b!826638 m!769369))

(declare-fun m!769371 () Bool)

(assert (=> b!826636 m!769371))

(declare-fun m!769373 () Bool)

(assert (=> start!71264 m!769373))

(declare-fun m!769375 () Bool)

(assert (=> start!71264 m!769375))

(declare-fun m!769377 () Bool)

(assert (=> start!71264 m!769377))

(declare-fun m!769379 () Bool)

(assert (=> b!826641 m!769379))

(declare-fun m!769381 () Bool)

(assert (=> b!826641 m!769381))

(declare-fun m!769383 () Bool)

(assert (=> b!826641 m!769383))

(declare-fun m!769385 () Bool)

(assert (=> b!826641 m!769385))

(declare-fun m!769387 () Bool)

(assert (=> b!826641 m!769387))

(declare-fun m!769389 () Bool)

(assert (=> b!826641 m!769389))

(declare-fun m!769391 () Bool)

(assert (=> b!826641 m!769391))

(assert (=> b!826641 m!769379))

(declare-fun m!769393 () Bool)

(assert (=> b!826641 m!769393))

(declare-fun m!769395 () Bool)

(assert (=> b!826641 m!769395))

(declare-fun m!769397 () Bool)

(assert (=> b!826641 m!769397))

(declare-fun m!769399 () Bool)

(assert (=> b!826641 m!769399))

(assert (=> b!826641 m!769387))

(declare-fun m!769401 () Bool)

(assert (=> b!826634 m!769401))

(assert (=> b!826634 m!769401))

(declare-fun m!769403 () Bool)

(assert (=> b!826634 m!769403))

(declare-fun m!769405 () Bool)

(assert (=> mapNonEmpty!24115 m!769405))

(check-sat (not start!71264) (not b!826635) (not b!826636) (not b!826641) (not b!826639) tp_is_empty!14995 (not b_next!13285) (not b!826638) b_and!22209 (not mapNonEmpty!24115) (not b!826634))
(check-sat b_and!22209 (not b_next!13285))
