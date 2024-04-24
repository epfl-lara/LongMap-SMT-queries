; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16822 () Bool)

(assert start!16822)

(declare-fun b!169601 () Bool)

(declare-fun b_free!4147 () Bool)

(declare-fun b_next!4147 () Bool)

(assert (=> b!169601 (= b_free!4147 (not b_next!4147))))

(declare-fun tp!15047 () Bool)

(declare-fun b_and!10575 () Bool)

(assert (=> b!169601 (= tp!15047 b_and!10575)))

(declare-fun b!169603 () Bool)

(declare-fun b_free!4149 () Bool)

(declare-fun b_next!4149 () Bool)

(assert (=> b!169603 (= b_free!4149 (not b_next!4149))))

(declare-fun tp!15046 () Bool)

(declare-fun b_and!10577 () Bool)

(assert (=> b!169603 (= tp!15046 b_and!10577)))

(declare-fun res!80650 () Bool)

(declare-fun e!111807 () Bool)

(assert (=> start!16822 (=> (not res!80650) (not e!111807))))

(declare-datatypes ((V!4881 0))(
  ( (V!4882 (val!2007 Int)) )
))
(declare-datatypes ((ValueCell!1619 0))(
  ( (ValueCellFull!1619 (v!3873 V!4881)) (EmptyCell!1619) )
))
(declare-datatypes ((array!6933 0))(
  ( (array!6934 (arr!3302 (Array (_ BitVec 32) (_ BitVec 64))) (size!3590 (_ BitVec 32))) )
))
(declare-datatypes ((array!6935 0))(
  ( (array!6936 (arr!3303 (Array (_ BitVec 32) ValueCell!1619)) (size!3591 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2146 0))(
  ( (LongMapFixedSize!2147 (defaultEntry!3515 Int) (mask!8302 (_ BitVec 32)) (extraKeys!3256 (_ BitVec 32)) (zeroValue!3358 V!4881) (minValue!3358 V!4881) (_size!1122 (_ BitVec 32)) (_keys!5340 array!6933) (_values!3498 array!6935) (_vacant!1122 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2146)

(declare-fun valid!936 (LongMapFixedSize!2146) Bool)

(assert (=> start!16822 (= res!80650 (valid!936 thiss!1248))))

(assert (=> start!16822 e!111807))

(declare-fun e!111805 () Bool)

(assert (=> start!16822 e!111805))

(assert (=> start!16822 true))

(declare-fun b!169600 () Bool)

(declare-fun e!111810 () Bool)

(declare-fun tp_is_empty!3925 () Bool)

(assert (=> b!169600 (= e!111810 tp_is_empty!3925)))

(declare-fun e!111811 () Bool)

(declare-fun e!111803 () Bool)

(declare-datatypes ((tuple2!3194 0))(
  ( (tuple2!3195 (_1!1608 Bool) (_2!1608 LongMapFixedSize!2146)) )
))
(declare-fun err!87 () tuple2!3194)

(declare-fun array_inv!2117 (array!6933) Bool)

(declare-fun array_inv!2118 (array!6935) Bool)

(assert (=> b!169601 (= e!111803 (and tp!15047 tp_is_empty!3925 (array_inv!2117 (_keys!5340 (_2!1608 err!87))) (array_inv!2118 (_values!3498 (_2!1608 err!87))) e!111811))))

(declare-fun b!169602 () Bool)

(declare-fun mapRes!6644 () Bool)

(assert (=> b!169602 (= e!111811 (and e!111810 mapRes!6644))))

(declare-fun condMapEmpty!6644 () Bool)

(declare-fun mapDefault!6645 () ValueCell!1619)

(assert (=> b!169602 (= condMapEmpty!6644 (= (arr!3303 (_values!3498 (_2!1608 err!87))) ((as const (Array (_ BitVec 32) ValueCell!1619)) mapDefault!6645)))))

(declare-fun mapNonEmpty!6644 () Bool)

(declare-fun mapRes!6645 () Bool)

(declare-fun tp!15048 () Bool)

(declare-fun e!111801 () Bool)

(assert (=> mapNonEmpty!6644 (= mapRes!6645 (and tp!15048 e!111801))))

(declare-fun mapKey!6644 () (_ BitVec 32))

(declare-fun mapRest!6644 () (Array (_ BitVec 32) ValueCell!1619))

(declare-fun mapValue!6645 () ValueCell!1619)

(assert (=> mapNonEmpty!6644 (= (arr!3303 (_values!3498 thiss!1248)) (store mapRest!6644 mapKey!6644 mapValue!6645))))

(declare-fun mapNonEmpty!6645 () Bool)

(declare-fun tp!15045 () Bool)

(declare-fun e!111806 () Bool)

(assert (=> mapNonEmpty!6645 (= mapRes!6644 (and tp!15045 e!111806))))

(declare-fun mapRest!6645 () (Array (_ BitVec 32) ValueCell!1619))

(declare-fun mapValue!6644 () ValueCell!1619)

(declare-fun mapKey!6645 () (_ BitVec 32))

(assert (=> mapNonEmpty!6645 (= (arr!3303 (_values!3498 (_2!1608 err!87))) (store mapRest!6645 mapKey!6645 mapValue!6644))))

(declare-fun e!111802 () Bool)

(assert (=> b!169603 (= e!111805 (and tp!15046 tp_is_empty!3925 (array_inv!2117 (_keys!5340 thiss!1248)) (array_inv!2118 (_values!3498 thiss!1248)) e!111802))))

(declare-fun b!169604 () Bool)

(assert (=> b!169604 (= e!111801 tp_is_empty!3925)))

(declare-fun b!169605 () Bool)

(assert (=> b!169605 (= e!111806 tp_is_empty!3925)))

(declare-fun b!169606 () Bool)

(declare-fun e!111804 () Bool)

(assert (=> b!169606 (= e!111807 e!111804)))

(declare-fun res!80652 () Bool)

(assert (=> b!169606 (=> (not res!80652) (not e!111804))))

(declare-datatypes ((SeekEntryResult!519 0))(
  ( (MissingZero!519 (index!4244 (_ BitVec 32))) (Found!519 (index!4245 (_ BitVec 32))) (Intermediate!519 (undefined!1331 Bool) (index!4246 (_ BitVec 32)) (x!18723 (_ BitVec 32))) (Undefined!519) (MissingVacant!519 (index!4247 (_ BitVec 32))) )
))
(declare-fun lt!84996 () SeekEntryResult!519)

(get-info :version)

(assert (=> b!169606 (= res!80652 (and (not ((_ is Undefined!519) lt!84996)) (not ((_ is MissingVacant!519) lt!84996)) (not ((_ is MissingZero!519) lt!84996)) (not ((_ is Found!519) lt!84996))))))

(declare-fun key!828 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6933 (_ BitVec 32)) SeekEntryResult!519)

(assert (=> b!169606 (= lt!84996 (seekEntryOrOpen!0 key!828 (_keys!5340 thiss!1248) (mask!8302 thiss!1248)))))

(declare-fun b!169607 () Bool)

(declare-fun res!80651 () Bool)

(assert (=> b!169607 (=> (not res!80651) (not e!111807))))

(assert (=> b!169607 (= res!80651 (not (= key!828 (bvneg key!828))))))

(declare-fun mapIsEmpty!6644 () Bool)

(assert (=> mapIsEmpty!6644 mapRes!6644))

(declare-fun mapIsEmpty!6645 () Bool)

(assert (=> mapIsEmpty!6645 mapRes!6645))

(declare-fun b!169608 () Bool)

(declare-fun e!111809 () Bool)

(assert (=> b!169608 (= e!111809 tp_is_empty!3925)))

(declare-fun b!169609 () Bool)

(assert (=> b!169609 (= e!111802 (and e!111809 mapRes!6645))))

(declare-fun condMapEmpty!6645 () Bool)

(declare-fun mapDefault!6644 () ValueCell!1619)

(assert (=> b!169609 (= condMapEmpty!6645 (= (arr!3303 (_values!3498 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1619)) mapDefault!6644)))))

(declare-fun b!169610 () Bool)

(assert (=> b!169610 (= e!111804 false)))

(declare-fun lt!84995 () Bool)

(assert (=> b!169610 (= lt!84995 (valid!936 (_2!1608 err!87)))))

(assert (=> b!169610 true))

(assert (=> b!169610 e!111803))

(assert (= (and start!16822 res!80650) b!169607))

(assert (= (and b!169607 res!80651) b!169606))

(assert (= (and b!169606 res!80652) b!169610))

(assert (= (and b!169602 condMapEmpty!6644) mapIsEmpty!6644))

(assert (= (and b!169602 (not condMapEmpty!6644)) mapNonEmpty!6645))

(assert (= (and mapNonEmpty!6645 ((_ is ValueCellFull!1619) mapValue!6644)) b!169605))

(assert (= (and b!169602 ((_ is ValueCellFull!1619) mapDefault!6645)) b!169600))

(assert (= b!169601 b!169602))

(assert (= b!169610 b!169601))

(assert (= (and b!169609 condMapEmpty!6645) mapIsEmpty!6645))

(assert (= (and b!169609 (not condMapEmpty!6645)) mapNonEmpty!6644))

(assert (= (and mapNonEmpty!6644 ((_ is ValueCellFull!1619) mapValue!6645)) b!169604))

(assert (= (and b!169609 ((_ is ValueCellFull!1619) mapDefault!6644)) b!169608))

(assert (= b!169603 b!169609))

(assert (= start!16822 b!169603))

(declare-fun m!198701 () Bool)

(assert (=> b!169606 m!198701))

(declare-fun m!198703 () Bool)

(assert (=> b!169603 m!198703))

(declare-fun m!198705 () Bool)

(assert (=> b!169603 m!198705))

(declare-fun m!198707 () Bool)

(assert (=> b!169610 m!198707))

(declare-fun m!198709 () Bool)

(assert (=> mapNonEmpty!6645 m!198709))

(declare-fun m!198711 () Bool)

(assert (=> mapNonEmpty!6644 m!198711))

(declare-fun m!198713 () Bool)

(assert (=> start!16822 m!198713))

(declare-fun m!198715 () Bool)

(assert (=> b!169601 m!198715))

(declare-fun m!198717 () Bool)

(assert (=> b!169601 m!198717))

(check-sat (not mapNonEmpty!6645) (not b!169601) b_and!10577 (not mapNonEmpty!6644) b_and!10575 (not b!169603) (not b!169606) (not b_next!4149) (not start!16822) (not b_next!4147) tp_is_empty!3925 (not b!169610))
(check-sat b_and!10575 b_and!10577 (not b_next!4149) (not b_next!4147))
