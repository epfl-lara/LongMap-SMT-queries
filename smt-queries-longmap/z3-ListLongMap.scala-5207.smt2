; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70440 () Bool)

(assert start!70440)

(declare-fun b_free!12649 () Bool)

(declare-fun b_next!12649 () Bool)

(assert (=> start!70440 (= b_free!12649 (not b_next!12649))))

(declare-fun tp!44670 () Bool)

(declare-fun b_and!21459 () Bool)

(assert (=> start!70440 (= tp!44670 b_and!21459)))

(declare-fun mapIsEmpty!23128 () Bool)

(declare-fun mapRes!23128 () Bool)

(assert (=> mapIsEmpty!23128 mapRes!23128))

(declare-fun b!817310 () Bool)

(declare-fun e!453440 () Bool)

(declare-fun e!453444 () Bool)

(assert (=> b!817310 (= e!453440 (and e!453444 mapRes!23128))))

(declare-fun condMapEmpty!23128 () Bool)

(declare-datatypes ((V!24147 0))(
  ( (V!24148 (val!7227 Int)) )
))
(declare-datatypes ((ValueCell!6764 0))(
  ( (ValueCellFull!6764 (v!9655 V!24147)) (EmptyCell!6764) )
))
(declare-datatypes ((array!44919 0))(
  ( (array!44920 (arr!21512 (Array (_ BitVec 32) ValueCell!6764)) (size!21932 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44919)

(declare-fun mapDefault!23128 () ValueCell!6764)

(assert (=> b!817310 (= condMapEmpty!23128 (= (arr!21512 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6764)) mapDefault!23128)))))

(declare-fun b!817311 () Bool)

(declare-fun e!453442 () Bool)

(declare-fun tp_is_empty!14359 () Bool)

(assert (=> b!817311 (= e!453442 tp_is_empty!14359)))

(declare-fun mapNonEmpty!23128 () Bool)

(declare-fun tp!44671 () Bool)

(assert (=> mapNonEmpty!23128 (= mapRes!23128 (and tp!44671 e!453442))))

(declare-fun mapKey!23128 () (_ BitVec 32))

(declare-fun mapValue!23128 () ValueCell!6764)

(declare-fun mapRest!23128 () (Array (_ BitVec 32) ValueCell!6764))

(assert (=> mapNonEmpty!23128 (= (arr!21512 _values!788) (store mapRest!23128 mapKey!23128 mapValue!23128))))

(declare-fun b!817312 () Bool)

(assert (=> b!817312 (= e!453444 tp_is_empty!14359)))

(declare-fun b!817313 () Bool)

(declare-fun res!557734 () Bool)

(declare-fun e!453441 () Bool)

(assert (=> b!817313 (=> (not res!557734) (not e!453441))))

(declare-datatypes ((array!44921 0))(
  ( (array!44922 (arr!21513 (Array (_ BitVec 32) (_ BitVec 64))) (size!21933 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44921)

(declare-datatypes ((List!15215 0))(
  ( (Nil!15212) (Cons!15211 (h!16346 (_ BitVec 64)) (t!21530 List!15215)) )
))
(declare-fun arrayNoDuplicates!0 (array!44921 (_ BitVec 32) List!15215) Bool)

(assert (=> b!817313 (= res!557734 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15212))))

(declare-fun b!817314 () Bool)

(declare-fun res!557737 () Bool)

(assert (=> b!817314 (=> (not res!557737) (not e!453441))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!817314 (= res!557737 (and (= (size!21932 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21933 _keys!976) (size!21932 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!817309 () Bool)

(declare-fun e!453439 () Bool)

(assert (=> b!817309 (= e!453439 true)))

(declare-fun zeroValueAfter!34 () V!24147)

(declare-fun minValue!754 () V!24147)

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((tuple2!9402 0))(
  ( (tuple2!9403 (_1!4712 (_ BitVec 64)) (_2!4712 V!24147)) )
))
(declare-datatypes ((List!15216 0))(
  ( (Nil!15213) (Cons!15212 (h!16347 tuple2!9402) (t!21531 List!15216)) )
))
(declare-datatypes ((ListLongMap!8227 0))(
  ( (ListLongMap!8228 (toList!4129 List!15216)) )
))
(declare-fun lt!366013 () ListLongMap!8227)

(declare-fun getCurrentListMap!2348 (array!44921 array!44919 (_ BitVec 32) (_ BitVec 32) V!24147 V!24147 (_ BitVec 32) Int) ListLongMap!8227)

(assert (=> b!817309 (= lt!366013 (getCurrentListMap!2348 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun zeroValueBefore!34 () V!24147)

(declare-fun lt!366016 () ListLongMap!8227)

(declare-fun +!1808 (ListLongMap!8227 tuple2!9402) ListLongMap!8227)

(assert (=> b!817309 (= lt!366016 (+!1808 (getCurrentListMap!2348 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) (tuple2!9403 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))

(declare-fun res!557733 () Bool)

(assert (=> start!70440 (=> (not res!557733) (not e!453441))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70440 (= res!557733 (validMask!0 mask!1312))))

(assert (=> start!70440 e!453441))

(assert (=> start!70440 tp_is_empty!14359))

(declare-fun array_inv!17245 (array!44921) Bool)

(assert (=> start!70440 (array_inv!17245 _keys!976)))

(assert (=> start!70440 true))

(declare-fun array_inv!17246 (array!44919) Bool)

(assert (=> start!70440 (and (array_inv!17246 _values!788) e!453440)))

(assert (=> start!70440 tp!44670))

(declare-fun b!817315 () Bool)

(assert (=> b!817315 (= e!453441 (not e!453439))))

(declare-fun res!557736 () Bool)

(assert (=> b!817315 (=> res!557736 e!453439)))

(assert (=> b!817315 (= res!557736 (or (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun lt!366015 () ListLongMap!8227)

(declare-fun lt!366012 () ListLongMap!8227)

(assert (=> b!817315 (= lt!366015 lt!366012)))

(declare-datatypes ((Unit!27819 0))(
  ( (Unit!27820) )
))
(declare-fun lt!366014 () Unit!27819)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!320 (array!44921 array!44919 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24147 V!24147 V!24147 V!24147 (_ BitVec 32) Int) Unit!27819)

(assert (=> b!817315 (= lt!366014 (lemmaNoChangeToArrayThenSameMapNoExtras!320 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2232 (array!44921 array!44919 (_ BitVec 32) (_ BitVec 32) V!24147 V!24147 (_ BitVec 32) Int) ListLongMap!8227)

(assert (=> b!817315 (= lt!366012 (getCurrentListMapNoExtraKeys!2232 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!817315 (= lt!366015 (getCurrentListMapNoExtraKeys!2232 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!817316 () Bool)

(declare-fun res!557735 () Bool)

(assert (=> b!817316 (=> (not res!557735) (not e!453441))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44921 (_ BitVec 32)) Bool)

(assert (=> b!817316 (= res!557735 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(assert (= (and start!70440 res!557733) b!817314))

(assert (= (and b!817314 res!557737) b!817316))

(assert (= (and b!817316 res!557735) b!817313))

(assert (= (and b!817313 res!557734) b!817315))

(assert (= (and b!817315 (not res!557736)) b!817309))

(assert (= (and b!817310 condMapEmpty!23128) mapIsEmpty!23128))

(assert (= (and b!817310 (not condMapEmpty!23128)) mapNonEmpty!23128))

(get-info :version)

(assert (= (and mapNonEmpty!23128 ((_ is ValueCellFull!6764) mapValue!23128)) b!817311))

(assert (= (and b!817310 ((_ is ValueCellFull!6764) mapDefault!23128)) b!817312))

(assert (= start!70440 b!817310))

(declare-fun m!759329 () Bool)

(assert (=> b!817315 m!759329))

(declare-fun m!759331 () Bool)

(assert (=> b!817315 m!759331))

(declare-fun m!759333 () Bool)

(assert (=> b!817315 m!759333))

(declare-fun m!759335 () Bool)

(assert (=> b!817316 m!759335))

(declare-fun m!759337 () Bool)

(assert (=> start!70440 m!759337))

(declare-fun m!759339 () Bool)

(assert (=> start!70440 m!759339))

(declare-fun m!759341 () Bool)

(assert (=> start!70440 m!759341))

(declare-fun m!759343 () Bool)

(assert (=> b!817309 m!759343))

(declare-fun m!759345 () Bool)

(assert (=> b!817309 m!759345))

(assert (=> b!817309 m!759345))

(declare-fun m!759347 () Bool)

(assert (=> b!817309 m!759347))

(declare-fun m!759349 () Bool)

(assert (=> mapNonEmpty!23128 m!759349))

(declare-fun m!759351 () Bool)

(assert (=> b!817313 m!759351))

(check-sat (not b!817309) tp_is_empty!14359 (not b!817313) (not mapNonEmpty!23128) (not b!817316) (not start!70440) (not b!817315) (not b_next!12649) b_and!21459)
(check-sat b_and!21459 (not b_next!12649))
