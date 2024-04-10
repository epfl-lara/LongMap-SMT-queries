; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16592 () Bool)

(assert start!16592)

(declare-fun b!165440 () Bool)

(declare-fun b_free!3897 () Bool)

(declare-fun b_next!3897 () Bool)

(assert (=> b!165440 (= b_free!3897 (not b_next!3897))))

(declare-fun tp!14291 () Bool)

(declare-fun b_and!10311 () Bool)

(assert (=> b!165440 (= tp!14291 b_and!10311)))

(declare-fun mapIsEmpty!6267 () Bool)

(declare-fun mapRes!6267 () Bool)

(assert (=> mapIsEmpty!6267 mapRes!6267))

(declare-fun b!165437 () Bool)

(declare-fun res!78489 () Bool)

(declare-fun e!108527 () Bool)

(assert (=> b!165437 (=> (not res!78489) (not e!108527))))

(declare-datatypes ((V!4579 0))(
  ( (V!4580 (val!1894 Int)) )
))
(declare-datatypes ((ValueCell!1506 0))(
  ( (ValueCellFull!1506 (v!3759 V!4579)) (EmptyCell!1506) )
))
(declare-datatypes ((array!6495 0))(
  ( (array!6496 (arr!3083 (Array (_ BitVec 32) (_ BitVec 64))) (size!3371 (_ BitVec 32))) )
))
(declare-datatypes ((array!6497 0))(
  ( (array!6498 (arr!3084 (Array (_ BitVec 32) ValueCell!1506)) (size!3372 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1920 0))(
  ( (LongMapFixedSize!1921 (defaultEntry!3402 Int) (mask!8113 (_ BitVec 32)) (extraKeys!3143 (_ BitVec 32)) (zeroValue!3245 V!4579) (minValue!3245 V!4579) (_size!1009 (_ BitVec 32)) (_keys!5227 array!6495) (_values!3385 array!6497) (_vacant!1009 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1920)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!165437 (= res!78489 (validMask!0 (mask!8113 thiss!1248)))))

(declare-fun b!165438 () Bool)

(declare-fun res!78495 () Bool)

(assert (=> b!165438 (=> (not res!78495) (not e!108527))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!6495 (_ BitVec 32)) Bool)

(assert (=> b!165438 (= res!78495 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5227 thiss!1248) (mask!8113 thiss!1248)))))

(declare-fun res!78494 () Bool)

(declare-fun e!108525 () Bool)

(assert (=> start!16592 (=> (not res!78494) (not e!108525))))

(declare-fun valid!850 (LongMapFixedSize!1920) Bool)

(assert (=> start!16592 (= res!78494 (valid!850 thiss!1248))))

(assert (=> start!16592 e!108525))

(declare-fun e!108522 () Bool)

(assert (=> start!16592 e!108522))

(assert (=> start!16592 true))

(declare-fun b!165439 () Bool)

(declare-fun e!108523 () Bool)

(declare-fun tp_is_empty!3699 () Bool)

(assert (=> b!165439 (= e!108523 tp_is_empty!3699)))

(declare-fun e!108521 () Bool)

(declare-fun array_inv!1981 (array!6495) Bool)

(declare-fun array_inv!1982 (array!6497) Bool)

(assert (=> b!165440 (= e!108522 (and tp!14291 tp_is_empty!3699 (array_inv!1981 (_keys!5227 thiss!1248)) (array_inv!1982 (_values!3385 thiss!1248)) e!108521))))

(declare-fun b!165441 () Bool)

(declare-fun res!78491 () Bool)

(assert (=> b!165441 (=> (not res!78491) (not e!108527))))

(assert (=> b!165441 (= res!78491 (and (= (size!3372 (_values!3385 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8113 thiss!1248))) (= (size!3371 (_keys!5227 thiss!1248)) (size!3372 (_values!3385 thiss!1248))) (bvsge (mask!8113 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3143 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3143 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!165442 () Bool)

(assert (=> b!165442 (= e!108525 e!108527)))

(declare-fun res!78492 () Bool)

(assert (=> b!165442 (=> (not res!78492) (not e!108527))))

(declare-datatypes ((SeekEntryResult!436 0))(
  ( (MissingZero!436 (index!3912 (_ BitVec 32))) (Found!436 (index!3913 (_ BitVec 32))) (Intermediate!436 (undefined!1248 Bool) (index!3914 (_ BitVec 32)) (x!18336 (_ BitVec 32))) (Undefined!436) (MissingVacant!436 (index!3915 (_ BitVec 32))) )
))
(declare-fun lt!83070 () SeekEntryResult!436)

(get-info :version)

(assert (=> b!165442 (= res!78492 (and (not ((_ is Undefined!436) lt!83070)) (not ((_ is MissingVacant!436) lt!83070)) (not ((_ is MissingZero!436) lt!83070)) ((_ is Found!436) lt!83070)))))

(declare-fun key!828 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6495 (_ BitVec 32)) SeekEntryResult!436)

(assert (=> b!165442 (= lt!83070 (seekEntryOrOpen!0 key!828 (_keys!5227 thiss!1248) (mask!8113 thiss!1248)))))

(declare-fun b!165443 () Bool)

(declare-fun res!78493 () Bool)

(assert (=> b!165443 (=> (not res!78493) (not e!108527))))

(declare-datatypes ((tuple2!3070 0))(
  ( (tuple2!3071 (_1!1546 (_ BitVec 64)) (_2!1546 V!4579)) )
))
(declare-datatypes ((List!2053 0))(
  ( (Nil!2050) (Cons!2049 (h!2666 tuple2!3070) (t!6855 List!2053)) )
))
(declare-datatypes ((ListLongMap!2025 0))(
  ( (ListLongMap!2026 (toList!1028 List!2053)) )
))
(declare-fun contains!1070 (ListLongMap!2025 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!686 (array!6495 array!6497 (_ BitVec 32) (_ BitVec 32) V!4579 V!4579 (_ BitVec 32) Int) ListLongMap!2025)

(assert (=> b!165443 (= res!78493 (not (contains!1070 (getCurrentListMap!686 (_keys!5227 thiss!1248) (_values!3385 thiss!1248) (mask!8113 thiss!1248) (extraKeys!3143 thiss!1248) (zeroValue!3245 thiss!1248) (minValue!3245 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3402 thiss!1248)) key!828)))))

(declare-fun b!165444 () Bool)

(assert (=> b!165444 (= e!108521 (and e!108523 mapRes!6267))))

(declare-fun condMapEmpty!6267 () Bool)

(declare-fun mapDefault!6267 () ValueCell!1506)

(assert (=> b!165444 (= condMapEmpty!6267 (= (arr!3084 (_values!3385 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1506)) mapDefault!6267)))))

(declare-fun b!165445 () Bool)

(assert (=> b!165445 (= e!108527 false)))

(declare-fun lt!83071 () Bool)

(declare-datatypes ((List!2054 0))(
  ( (Nil!2051) (Cons!2050 (h!2667 (_ BitVec 64)) (t!6856 List!2054)) )
))
(declare-fun arrayNoDuplicates!0 (array!6495 (_ BitVec 32) List!2054) Bool)

(assert (=> b!165445 (= lt!83071 (arrayNoDuplicates!0 (_keys!5227 thiss!1248) #b00000000000000000000000000000000 Nil!2051))))

(declare-fun b!165446 () Bool)

(declare-fun e!108526 () Bool)

(assert (=> b!165446 (= e!108526 tp_is_empty!3699)))

(declare-fun mapNonEmpty!6267 () Bool)

(declare-fun tp!14292 () Bool)

(assert (=> mapNonEmpty!6267 (= mapRes!6267 (and tp!14292 e!108526))))

(declare-fun mapKey!6267 () (_ BitVec 32))

(declare-fun mapRest!6267 () (Array (_ BitVec 32) ValueCell!1506))

(declare-fun mapValue!6267 () ValueCell!1506)

(assert (=> mapNonEmpty!6267 (= (arr!3084 (_values!3385 thiss!1248)) (store mapRest!6267 mapKey!6267 mapValue!6267))))

(declare-fun b!165447 () Bool)

(declare-fun res!78490 () Bool)

(assert (=> b!165447 (=> (not res!78490) (not e!108525))))

(assert (=> b!165447 (= res!78490 (not (= key!828 (bvneg key!828))))))

(assert (= (and start!16592 res!78494) b!165447))

(assert (= (and b!165447 res!78490) b!165442))

(assert (= (and b!165442 res!78492) b!165443))

(assert (= (and b!165443 res!78493) b!165437))

(assert (= (and b!165437 res!78489) b!165441))

(assert (= (and b!165441 res!78491) b!165438))

(assert (= (and b!165438 res!78495) b!165445))

(assert (= (and b!165444 condMapEmpty!6267) mapIsEmpty!6267))

(assert (= (and b!165444 (not condMapEmpty!6267)) mapNonEmpty!6267))

(assert (= (and mapNonEmpty!6267 ((_ is ValueCellFull!1506) mapValue!6267)) b!165446))

(assert (= (and b!165444 ((_ is ValueCellFull!1506) mapDefault!6267)) b!165439))

(assert (= b!165440 b!165444))

(assert (= start!16592 b!165440))

(declare-fun m!195251 () Bool)

(assert (=> b!165438 m!195251))

(declare-fun m!195253 () Bool)

(assert (=> b!165440 m!195253))

(declare-fun m!195255 () Bool)

(assert (=> b!165440 m!195255))

(declare-fun m!195257 () Bool)

(assert (=> b!165443 m!195257))

(assert (=> b!165443 m!195257))

(declare-fun m!195259 () Bool)

(assert (=> b!165443 m!195259))

(declare-fun m!195261 () Bool)

(assert (=> b!165445 m!195261))

(declare-fun m!195263 () Bool)

(assert (=> start!16592 m!195263))

(declare-fun m!195265 () Bool)

(assert (=> b!165437 m!195265))

(declare-fun m!195267 () Bool)

(assert (=> b!165442 m!195267))

(declare-fun m!195269 () Bool)

(assert (=> mapNonEmpty!6267 m!195269))

(check-sat (not b_next!3897) (not b!165438) (not b!165445) (not start!16592) (not b!165437) tp_is_empty!3699 (not b!165442) (not b!165440) b_and!10311 (not mapNonEmpty!6267) (not b!165443))
(check-sat b_and!10311 (not b_next!3897))
