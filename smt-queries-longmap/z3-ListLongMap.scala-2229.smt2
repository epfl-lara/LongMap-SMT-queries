; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36822 () Bool)

(assert start!36822)

(declare-fun b_free!7963 () Bool)

(declare-fun b_next!7963 () Bool)

(assert (=> start!36822 (= b_free!7963 (not b_next!7963))))

(declare-fun tp!28605 () Bool)

(declare-fun b_and!15219 () Bool)

(assert (=> start!36822 (= tp!28605 b_and!15219)))

(declare-fun b!368269 () Bool)

(declare-fun res!206391 () Bool)

(declare-fun e!225247 () Bool)

(assert (=> b!368269 (=> (not res!206391) (not e!225247))))

(declare-datatypes ((array!21158 0))(
  ( (array!21159 (arr!10047 (Array (_ BitVec 32) (_ BitVec 64))) (size!10399 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21158)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!368269 (= res!206391 (or (= (select (arr!10047 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10047 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!206392 () Bool)

(assert (=> start!36822 (=> (not res!206392) (not e!225247))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36822 (= res!206392 (validMask!0 mask!970))))

(assert (=> start!36822 e!225247))

(assert (=> start!36822 true))

(declare-datatypes ((V!12587 0))(
  ( (V!12588 (val!4350 Int)) )
))
(declare-datatypes ((ValueCell!3962 0))(
  ( (ValueCellFull!3962 (v!6548 V!12587)) (EmptyCell!3962) )
))
(declare-datatypes ((array!21160 0))(
  ( (array!21161 (arr!10048 (Array (_ BitVec 32) ValueCell!3962)) (size!10400 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21160)

(declare-fun e!225245 () Bool)

(declare-fun array_inv!7462 (array!21160) Bool)

(assert (=> start!36822 (and (array_inv!7462 _values!506) e!225245)))

(assert (=> start!36822 tp!28605))

(declare-fun tp_is_empty!8611 () Bool)

(assert (=> start!36822 tp_is_empty!8611))

(declare-fun array_inv!7463 (array!21158) Bool)

(assert (=> start!36822 (array_inv!7463 _keys!658)))

(declare-fun b!368270 () Bool)

(declare-fun res!206388 () Bool)

(assert (=> b!368270 (=> (not res!206388) (not e!225247))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!368270 (= res!206388 (and (= (size!10400 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10399 _keys!658) (size!10400 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!368271 () Bool)

(declare-fun res!206390 () Bool)

(assert (=> b!368271 (=> (not res!206390) (not e!225247))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!21158 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!368271 (= res!206390 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!368272 () Bool)

(declare-fun e!225249 () Bool)

(assert (=> b!368272 (= e!225247 e!225249)))

(declare-fun res!206394 () Bool)

(assert (=> b!368272 (=> (not res!206394) (not e!225249))))

(declare-fun lt!169530 () array!21158)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21158 (_ BitVec 32)) Bool)

(assert (=> b!368272 (= res!206394 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!169530 mask!970))))

(assert (=> b!368272 (= lt!169530 (array!21159 (store (arr!10047 _keys!658) i!548 k0!778) (size!10399 _keys!658)))))

(declare-fun b!368273 () Bool)

(declare-fun e!225248 () Bool)

(assert (=> b!368273 (= e!225248 tp_is_empty!8611)))

(declare-fun b!368274 () Bool)

(declare-fun res!206396 () Bool)

(assert (=> b!368274 (=> (not res!206396) (not e!225247))))

(assert (=> b!368274 (= res!206396 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10399 _keys!658))))))

(declare-fun b!368275 () Bool)

(declare-fun e!225244 () Bool)

(assert (=> b!368275 (= e!225244 tp_is_empty!8611)))

(declare-fun mapIsEmpty!14481 () Bool)

(declare-fun mapRes!14481 () Bool)

(assert (=> mapIsEmpty!14481 mapRes!14481))

(declare-fun b!368276 () Bool)

(declare-fun res!206395 () Bool)

(assert (=> b!368276 (=> (not res!206395) (not e!225247))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!368276 (= res!206395 (validKeyInArray!0 k0!778))))

(declare-fun b!368277 () Bool)

(declare-fun res!206389 () Bool)

(assert (=> b!368277 (=> (not res!206389) (not e!225247))))

(assert (=> b!368277 (= res!206389 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!368278 () Bool)

(declare-fun res!206393 () Bool)

(assert (=> b!368278 (=> (not res!206393) (not e!225249))))

(declare-datatypes ((List!5502 0))(
  ( (Nil!5499) (Cons!5498 (h!6354 (_ BitVec 64)) (t!10644 List!5502)) )
))
(declare-fun arrayNoDuplicates!0 (array!21158 (_ BitVec 32) List!5502) Bool)

(assert (=> b!368278 (= res!206393 (arrayNoDuplicates!0 lt!169530 #b00000000000000000000000000000000 Nil!5499))))

(declare-fun b!368279 () Bool)

(assert (=> b!368279 (= e!225245 (and e!225248 mapRes!14481))))

(declare-fun condMapEmpty!14481 () Bool)

(declare-fun mapDefault!14481 () ValueCell!3962)

(assert (=> b!368279 (= condMapEmpty!14481 (= (arr!10048 _values!506) ((as const (Array (_ BitVec 32) ValueCell!3962)) mapDefault!14481)))))

(declare-fun b!368280 () Bool)

(declare-fun res!206387 () Bool)

(assert (=> b!368280 (=> (not res!206387) (not e!225247))))

(assert (=> b!368280 (= res!206387 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5499))))

(declare-fun b!368281 () Bool)

(assert (=> b!368281 (= e!225249 false)))

(declare-datatypes ((tuple2!5680 0))(
  ( (tuple2!5681 (_1!2851 (_ BitVec 64)) (_2!2851 V!12587)) )
))
(declare-datatypes ((List!5503 0))(
  ( (Nil!5500) (Cons!5499 (h!6355 tuple2!5680) (t!10645 List!5503)) )
))
(declare-datatypes ((ListLongMap!4595 0))(
  ( (ListLongMap!4596 (toList!2313 List!5503)) )
))
(declare-fun lt!169531 () ListLongMap!4595)

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!12587)

(declare-fun minValue!472 () V!12587)

(declare-fun getCurrentListMapNoExtraKeys!622 (array!21158 array!21160 (_ BitVec 32) (_ BitVec 32) V!12587 V!12587 (_ BitVec 32) Int) ListLongMap!4595)

(assert (=> b!368281 (= lt!169531 (getCurrentListMapNoExtraKeys!622 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun mapNonEmpty!14481 () Bool)

(declare-fun tp!28604 () Bool)

(assert (=> mapNonEmpty!14481 (= mapRes!14481 (and tp!28604 e!225244))))

(declare-fun mapKey!14481 () (_ BitVec 32))

(declare-fun mapRest!14481 () (Array (_ BitVec 32) ValueCell!3962))

(declare-fun mapValue!14481 () ValueCell!3962)

(assert (=> mapNonEmpty!14481 (= (arr!10048 _values!506) (store mapRest!14481 mapKey!14481 mapValue!14481))))

(assert (= (and start!36822 res!206392) b!368270))

(assert (= (and b!368270 res!206388) b!368277))

(assert (= (and b!368277 res!206389) b!368280))

(assert (= (and b!368280 res!206387) b!368274))

(assert (= (and b!368274 res!206396) b!368276))

(assert (= (and b!368276 res!206395) b!368269))

(assert (= (and b!368269 res!206391) b!368271))

(assert (= (and b!368271 res!206390) b!368272))

(assert (= (and b!368272 res!206394) b!368278))

(assert (= (and b!368278 res!206393) b!368281))

(assert (= (and b!368279 condMapEmpty!14481) mapIsEmpty!14481))

(assert (= (and b!368279 (not condMapEmpty!14481)) mapNonEmpty!14481))

(get-info :version)

(assert (= (and mapNonEmpty!14481 ((_ is ValueCellFull!3962) mapValue!14481)) b!368275))

(assert (= (and b!368279 ((_ is ValueCellFull!3962) mapDefault!14481)) b!368273))

(assert (= start!36822 b!368279))

(declare-fun m!365231 () Bool)

(assert (=> b!368269 m!365231))

(declare-fun m!365233 () Bool)

(assert (=> b!368278 m!365233))

(declare-fun m!365235 () Bool)

(assert (=> b!368276 m!365235))

(declare-fun m!365237 () Bool)

(assert (=> b!368277 m!365237))

(declare-fun m!365239 () Bool)

(assert (=> b!368281 m!365239))

(declare-fun m!365241 () Bool)

(assert (=> b!368271 m!365241))

(declare-fun m!365243 () Bool)

(assert (=> mapNonEmpty!14481 m!365243))

(declare-fun m!365245 () Bool)

(assert (=> start!36822 m!365245))

(declare-fun m!365247 () Bool)

(assert (=> start!36822 m!365247))

(declare-fun m!365249 () Bool)

(assert (=> start!36822 m!365249))

(declare-fun m!365251 () Bool)

(assert (=> b!368272 m!365251))

(declare-fun m!365253 () Bool)

(assert (=> b!368272 m!365253))

(declare-fun m!365255 () Bool)

(assert (=> b!368280 m!365255))

(check-sat (not b!368277) (not b!368281) (not b!368278) tp_is_empty!8611 (not b!368280) (not b_next!7963) (not b!368271) (not b!368272) (not mapNonEmpty!14481) (not start!36822) (not b!368276) b_and!15219)
(check-sat b_and!15219 (not b_next!7963))
