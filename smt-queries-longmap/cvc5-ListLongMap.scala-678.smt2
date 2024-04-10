; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16572 () Bool)

(assert start!16572)

(declare-fun b!165109 () Bool)

(declare-fun b_free!3877 () Bool)

(declare-fun b_next!3877 () Bool)

(assert (=> b!165109 (= b_free!3877 (not b_next!3877))))

(declare-fun tp!14232 () Bool)

(declare-fun b_and!10291 () Bool)

(assert (=> b!165109 (= tp!14232 b_and!10291)))

(declare-fun b!165107 () Bool)

(declare-fun e!108315 () Bool)

(declare-fun tp_is_empty!3679 () Bool)

(assert (=> b!165107 (= e!108315 tp_is_empty!3679)))

(declare-fun b!165108 () Bool)

(declare-fun res!78282 () Bool)

(declare-fun e!108314 () Bool)

(assert (=> b!165108 (=> (not res!78282) (not e!108314))))

(declare-datatypes ((V!4553 0))(
  ( (V!4554 (val!1884 Int)) )
))
(declare-datatypes ((ValueCell!1496 0))(
  ( (ValueCellFull!1496 (v!3749 V!4553)) (EmptyCell!1496) )
))
(declare-datatypes ((array!6455 0))(
  ( (array!6456 (arr!3063 (Array (_ BitVec 32) (_ BitVec 64))) (size!3351 (_ BitVec 32))) )
))
(declare-datatypes ((array!6457 0))(
  ( (array!6458 (arr!3064 (Array (_ BitVec 32) ValueCell!1496)) (size!3352 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1900 0))(
  ( (LongMapFixedSize!1901 (defaultEntry!3392 Int) (mask!8097 (_ BitVec 32)) (extraKeys!3133 (_ BitVec 32)) (zeroValue!3235 V!4553) (minValue!3235 V!4553) (_size!999 (_ BitVec 32)) (_keys!5217 array!6455) (_values!3375 array!6457) (_vacant!999 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1900)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!165108 (= res!78282 (validMask!0 (mask!8097 thiss!1248)))))

(declare-fun mapIsEmpty!6237 () Bool)

(declare-fun mapRes!6237 () Bool)

(assert (=> mapIsEmpty!6237 mapRes!6237))

(declare-fun mapNonEmpty!6237 () Bool)

(declare-fun tp!14231 () Bool)

(assert (=> mapNonEmpty!6237 (= mapRes!6237 (and tp!14231 e!108315))))

(declare-fun mapValue!6237 () ValueCell!1496)

(declare-fun mapKey!6237 () (_ BitVec 32))

(declare-fun mapRest!6237 () (Array (_ BitVec 32) ValueCell!1496))

(assert (=> mapNonEmpty!6237 (= (arr!3064 (_values!3375 thiss!1248)) (store mapRest!6237 mapKey!6237 mapValue!6237))))

(declare-fun b!165110 () Bool)

(declare-fun e!108312 () Bool)

(assert (=> b!165110 (= e!108312 e!108314)))

(declare-fun res!78285 () Bool)

(assert (=> b!165110 (=> (not res!78285) (not e!108314))))

(declare-datatypes ((SeekEntryResult!428 0))(
  ( (MissingZero!428 (index!3880 (_ BitVec 32))) (Found!428 (index!3881 (_ BitVec 32))) (Intermediate!428 (undefined!1240 Bool) (index!3882 (_ BitVec 32)) (x!18304 (_ BitVec 32))) (Undefined!428) (MissingVacant!428 (index!3883 (_ BitVec 32))) )
))
(declare-fun lt!83011 () SeekEntryResult!428)

(assert (=> b!165110 (= res!78285 (and (not (is-Undefined!428 lt!83011)) (not (is-MissingVacant!428 lt!83011)) (not (is-MissingZero!428 lt!83011)) (is-Found!428 lt!83011)))))

(declare-fun key!828 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6455 (_ BitVec 32)) SeekEntryResult!428)

(assert (=> b!165110 (= lt!83011 (seekEntryOrOpen!0 key!828 (_keys!5217 thiss!1248) (mask!8097 thiss!1248)))))

(declare-fun b!165111 () Bool)

(declare-fun res!78284 () Bool)

(assert (=> b!165111 (=> (not res!78284) (not e!108314))))

(assert (=> b!165111 (= res!78284 (and (= (size!3352 (_values!3375 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8097 thiss!1248))) (= (size!3351 (_keys!5217 thiss!1248)) (size!3352 (_values!3375 thiss!1248))) (bvsge (mask!8097 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3133 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3133 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!165112 () Bool)

(declare-fun res!78283 () Bool)

(assert (=> b!165112 (=> (not res!78283) (not e!108312))))

(assert (=> b!165112 (= res!78283 (not (= key!828 (bvneg key!828))))))

(declare-fun b!165113 () Bool)

(declare-fun e!108317 () Bool)

(declare-fun e!108316 () Bool)

(assert (=> b!165113 (= e!108317 (and e!108316 mapRes!6237))))

(declare-fun condMapEmpty!6237 () Bool)

(declare-fun mapDefault!6237 () ValueCell!1496)

