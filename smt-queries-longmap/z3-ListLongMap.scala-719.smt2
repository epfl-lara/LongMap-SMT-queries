; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16822 () Bool)

(assert start!16822)

(declare-fun b!169414 () Bool)

(declare-fun b_free!4147 () Bool)

(declare-fun b_next!4147 () Bool)

(assert (=> b!169414 (= b_free!4147 (not b_next!4147))))

(declare-fun tp!15047 () Bool)

(declare-fun b_and!10535 () Bool)

(assert (=> b!169414 (= tp!15047 b_and!10535)))

(declare-fun b!169411 () Bool)

(declare-fun b_free!4149 () Bool)

(declare-fun b_next!4149 () Bool)

(assert (=> b!169411 (= b_free!4149 (not b_next!4149))))

(declare-fun tp!15048 () Bool)

(declare-fun b_and!10537 () Bool)

(assert (=> b!169411 (= tp!15048 b_and!10537)))

(declare-fun mapIsEmpty!6644 () Bool)

(declare-fun mapRes!6644 () Bool)

(assert (=> mapIsEmpty!6644 mapRes!6644))

(declare-fun res!80534 () Bool)

(declare-fun e!111685 () Bool)

(assert (=> start!16822 (=> (not res!80534) (not e!111685))))

(declare-datatypes ((V!4881 0))(
  ( (V!4882 (val!2007 Int)) )
))
(declare-datatypes ((ValueCell!1619 0))(
  ( (ValueCellFull!1619 (v!3866 V!4881)) (EmptyCell!1619) )
))
(declare-datatypes ((array!6927 0))(
  ( (array!6928 (arr!3298 (Array (_ BitVec 32) (_ BitVec 64))) (size!3587 (_ BitVec 32))) )
))
(declare-datatypes ((array!6929 0))(
  ( (array!6930 (arr!3299 (Array (_ BitVec 32) ValueCell!1619)) (size!3588 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2146 0))(
  ( (LongMapFixedSize!2147 (defaultEntry!3515 Int) (mask!8301 (_ BitVec 32)) (extraKeys!3256 (_ BitVec 32)) (zeroValue!3358 V!4881) (minValue!3358 V!4881) (_size!1122 (_ BitVec 32)) (_keys!5339 array!6927) (_values!3498 array!6929) (_vacant!1122 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2146)

(declare-fun valid!939 (LongMapFixedSize!2146) Bool)

(assert (=> start!16822 (= res!80534 (valid!939 thiss!1248))))

(assert (=> start!16822 e!111685))

(declare-fun e!111681 () Bool)

(assert (=> start!16822 e!111681))

(assert (=> start!16822 true))

(declare-fun mapNonEmpty!6644 () Bool)

(declare-fun mapRes!6645 () Bool)

(declare-fun tp!15045 () Bool)

(declare-fun e!111686 () Bool)

(assert (=> mapNonEmpty!6644 (= mapRes!6645 (and tp!15045 e!111686))))

(declare-fun mapRest!6644 () (Array (_ BitVec 32) ValueCell!1619))

(declare-datatypes ((tuple2!3226 0))(
  ( (tuple2!3227 (_1!1624 Bool) (_2!1624 LongMapFixedSize!2146)) )
))
(declare-fun err!87 () tuple2!3226)

(declare-fun mapValue!6645 () ValueCell!1619)

(declare-fun mapKey!6645 () (_ BitVec 32))

(assert (=> mapNonEmpty!6644 (= (arr!3299 (_values!3498 (_2!1624 err!87))) (store mapRest!6644 mapKey!6645 mapValue!6645))))

(declare-fun b!169406 () Bool)

(declare-fun e!111680 () Bool)

(declare-fun e!111682 () Bool)

(assert (=> b!169406 (= e!111680 (and e!111682 mapRes!6645))))

(declare-fun condMapEmpty!6644 () Bool)

(declare-fun mapDefault!6644 () ValueCell!1619)

(assert (=> b!169406 (= condMapEmpty!6644 (= (arr!3299 (_values!3498 (_2!1624 err!87))) ((as const (Array (_ BitVec 32) ValueCell!1619)) mapDefault!6644)))))

(declare-fun b!169407 () Bool)

(declare-fun tp_is_empty!3925 () Bool)

(assert (=> b!169407 (= e!111682 tp_is_empty!3925)))

(declare-fun b!169408 () Bool)

(declare-fun e!111684 () Bool)

(assert (=> b!169408 (= e!111684 tp_is_empty!3925)))

(declare-fun b!169409 () Bool)

(declare-fun e!111687 () Bool)

(assert (=> b!169409 (= e!111687 false)))

(declare-fun lt!84756 () Bool)

(assert (=> b!169409 (= lt!84756 (valid!939 (_2!1624 err!87)))))

(assert (=> b!169409 true))

(declare-fun e!111676 () Bool)

(assert (=> b!169409 e!111676))

(declare-fun b!169410 () Bool)

(declare-fun e!111683 () Bool)

(assert (=> b!169410 (= e!111683 tp_is_empty!3925)))

(declare-fun e!111677 () Bool)

(declare-fun array_inv!2119 (array!6927) Bool)

(declare-fun array_inv!2120 (array!6929) Bool)

(assert (=> b!169411 (= e!111681 (and tp!15048 tp_is_empty!3925 (array_inv!2119 (_keys!5339 thiss!1248)) (array_inv!2120 (_values!3498 thiss!1248)) e!111677))))

(declare-fun b!169412 () Bool)

(assert (=> b!169412 (= e!111685 e!111687)))

(declare-fun res!80536 () Bool)

(assert (=> b!169412 (=> (not res!80536) (not e!111687))))

(declare-datatypes ((SeekEntryResult!537 0))(
  ( (MissingZero!537 (index!4316 (_ BitVec 32))) (Found!537 (index!4317 (_ BitVec 32))) (Intermediate!537 (undefined!1349 Bool) (index!4318 (_ BitVec 32)) (x!18740 (_ BitVec 32))) (Undefined!537) (MissingVacant!537 (index!4319 (_ BitVec 32))) )
))
(declare-fun lt!84755 () SeekEntryResult!537)

(get-info :version)

(assert (=> b!169412 (= res!80536 (and (not ((_ is Undefined!537) lt!84755)) (not ((_ is MissingVacant!537) lt!84755)) (not ((_ is MissingZero!537) lt!84755)) (not ((_ is Found!537) lt!84755))))))

(declare-fun key!828 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6927 (_ BitVec 32)) SeekEntryResult!537)

(assert (=> b!169412 (= lt!84755 (seekEntryOrOpen!0 key!828 (_keys!5339 thiss!1248) (mask!8301 thiss!1248)))))

(declare-fun b!169413 () Bool)

(assert (=> b!169413 (= e!111686 tp_is_empty!3925)))

(declare-fun mapIsEmpty!6645 () Bool)

(assert (=> mapIsEmpty!6645 mapRes!6645))

(declare-fun mapNonEmpty!6645 () Bool)

(declare-fun tp!15046 () Bool)

(assert (=> mapNonEmpty!6645 (= mapRes!6644 (and tp!15046 e!111684))))

(declare-fun mapValue!6644 () ValueCell!1619)

(declare-fun mapRest!6645 () (Array (_ BitVec 32) ValueCell!1619))

(declare-fun mapKey!6644 () (_ BitVec 32))

(assert (=> mapNonEmpty!6645 (= (arr!3299 (_values!3498 thiss!1248)) (store mapRest!6645 mapKey!6644 mapValue!6644))))

(assert (=> b!169414 (= e!111676 (and tp!15047 tp_is_empty!3925 (array_inv!2119 (_keys!5339 (_2!1624 err!87))) (array_inv!2120 (_values!3498 (_2!1624 err!87))) e!111680))))

(declare-fun b!169415 () Bool)

(declare-fun res!80535 () Bool)

(assert (=> b!169415 (=> (not res!80535) (not e!111685))))

(assert (=> b!169415 (= res!80535 (not (= key!828 (bvneg key!828))))))

(declare-fun b!169416 () Bool)

(assert (=> b!169416 (= e!111677 (and e!111683 mapRes!6644))))

(declare-fun condMapEmpty!6645 () Bool)

(declare-fun mapDefault!6645 () ValueCell!1619)

(assert (=> b!169416 (= condMapEmpty!6645 (= (arr!3299 (_values!3498 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1619)) mapDefault!6645)))))

(assert (= (and start!16822 res!80534) b!169415))

(assert (= (and b!169415 res!80535) b!169412))

(assert (= (and b!169412 res!80536) b!169409))

(assert (= (and b!169406 condMapEmpty!6644) mapIsEmpty!6645))

(assert (= (and b!169406 (not condMapEmpty!6644)) mapNonEmpty!6644))

(assert (= (and mapNonEmpty!6644 ((_ is ValueCellFull!1619) mapValue!6645)) b!169413))

(assert (= (and b!169406 ((_ is ValueCellFull!1619) mapDefault!6644)) b!169407))

(assert (= b!169414 b!169406))

(assert (= b!169409 b!169414))

(assert (= (and b!169416 condMapEmpty!6645) mapIsEmpty!6644))

(assert (= (and b!169416 (not condMapEmpty!6645)) mapNonEmpty!6645))

(assert (= (and mapNonEmpty!6645 ((_ is ValueCellFull!1619) mapValue!6644)) b!169408))

(assert (= (and b!169416 ((_ is ValueCellFull!1619) mapDefault!6645)) b!169410))

(assert (= b!169411 b!169416))

(assert (= start!16822 b!169411))

(declare-fun m!197899 () Bool)

(assert (=> b!169409 m!197899))

(declare-fun m!197901 () Bool)

(assert (=> b!169411 m!197901))

(declare-fun m!197903 () Bool)

(assert (=> b!169411 m!197903))

(declare-fun m!197905 () Bool)

(assert (=> mapNonEmpty!6645 m!197905))

(declare-fun m!197907 () Bool)

(assert (=> b!169414 m!197907))

(declare-fun m!197909 () Bool)

(assert (=> b!169414 m!197909))

(declare-fun m!197911 () Bool)

(assert (=> start!16822 m!197911))

(declare-fun m!197913 () Bool)

(assert (=> b!169412 m!197913))

(declare-fun m!197915 () Bool)

(assert (=> mapNonEmpty!6644 m!197915))

(check-sat (not b!169412) b_and!10537 (not b_next!4147) (not mapNonEmpty!6645) (not mapNonEmpty!6644) (not b!169411) tp_is_empty!3925 (not b_next!4149) (not b!169414) (not start!16822) (not b!169409) b_and!10535)
(check-sat b_and!10535 b_and!10537 (not b_next!4147) (not b_next!4149))
