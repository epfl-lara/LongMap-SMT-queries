; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16690 () Bool)

(assert start!16690)

(declare-fun b!167218 () Bool)

(declare-fun b_free!3995 () Bool)

(declare-fun b_next!3995 () Bool)

(assert (=> b!167218 (= b_free!3995 (not b_next!3995))))

(declare-fun tp!14585 () Bool)

(declare-fun b_and!10409 () Bool)

(assert (=> b!167218 (= tp!14585 b_and!10409)))

(declare-fun b!167214 () Bool)

(declare-fun res!79520 () Bool)

(declare-fun e!109795 () Bool)

(assert (=> b!167214 (=> (not res!79520) (not e!109795))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!167214 (= res!79520 (not (= key!828 (bvneg key!828))))))

(declare-fun b!167215 () Bool)

(declare-fun e!109792 () Bool)

(declare-fun e!109791 () Bool)

(assert (=> b!167215 (= e!109792 e!109791)))

(declare-fun res!79522 () Bool)

(assert (=> b!167215 (=> (not res!79522) (not e!109791))))

(declare-datatypes ((V!4709 0))(
  ( (V!4710 (val!1943 Int)) )
))
(declare-datatypes ((ValueCell!1555 0))(
  ( (ValueCellFull!1555 (v!3808 V!4709)) (EmptyCell!1555) )
))
(declare-datatypes ((array!6691 0))(
  ( (array!6692 (arr!3181 (Array (_ BitVec 32) (_ BitVec 64))) (size!3469 (_ BitVec 32))) )
))
(declare-datatypes ((array!6693 0))(
  ( (array!6694 (arr!3182 (Array (_ BitVec 32) ValueCell!1555)) (size!3470 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2018 0))(
  ( (LongMapFixedSize!2019 (defaultEntry!3451 Int) (mask!8194 (_ BitVec 32)) (extraKeys!3192 (_ BitVec 32)) (zeroValue!3294 V!4709) (minValue!3294 V!4709) (_size!1058 (_ BitVec 32)) (_keys!5276 array!6691) (_values!3434 array!6693) (_vacant!1058 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2018)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!167215 (= res!79522 (validMask!0 (mask!8194 thiss!1248)))))

(declare-datatypes ((Unit!5112 0))(
  ( (Unit!5113) )
))
(declare-fun lt!83605 () Unit!5112)

(declare-fun e!109794 () Unit!5112)

(assert (=> b!167215 (= lt!83605 e!109794)))

(declare-fun c!30274 () Bool)

(declare-datatypes ((tuple2!3134 0))(
  ( (tuple2!3135 (_1!1578 (_ BitVec 64)) (_2!1578 V!4709)) )
))
(declare-datatypes ((List!2121 0))(
  ( (Nil!2118) (Cons!2117 (h!2734 tuple2!3134) (t!6923 List!2121)) )
))
(declare-datatypes ((ListLongMap!2089 0))(
  ( (ListLongMap!2090 (toList!1060 List!2121)) )
))
(declare-fun contains!1102 (ListLongMap!2089 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!718 (array!6691 array!6693 (_ BitVec 32) (_ BitVec 32) V!4709 V!4709 (_ BitVec 32) Int) ListLongMap!2089)

(assert (=> b!167215 (= c!30274 (contains!1102 (getCurrentListMap!718 (_keys!5276 thiss!1248) (_values!3434 thiss!1248) (mask!8194 thiss!1248) (extraKeys!3192 thiss!1248) (zeroValue!3294 thiss!1248) (minValue!3294 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3451 thiss!1248)) key!828))))

(declare-fun b!167216 () Bool)

(declare-fun Unit!5114 () Unit!5112)

(assert (=> b!167216 (= e!109794 Unit!5114)))

(declare-fun lt!83604 () Unit!5112)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!103 (array!6691 array!6693 (_ BitVec 32) (_ BitVec 32) V!4709 V!4709 (_ BitVec 64) Int) Unit!5112)

(assert (=> b!167216 (= lt!83604 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!103 (_keys!5276 thiss!1248) (_values!3434 thiss!1248) (mask!8194 thiss!1248) (extraKeys!3192 thiss!1248) (zeroValue!3294 thiss!1248) (minValue!3294 thiss!1248) key!828 (defaultEntry!3451 thiss!1248)))))

(assert (=> b!167216 false))

(declare-fun b!167217 () Bool)

(declare-fun e!109799 () Bool)

(declare-fun tp_is_empty!3797 () Bool)

(assert (=> b!167217 (= e!109799 tp_is_empty!3797)))

(declare-fun e!109793 () Bool)

(declare-fun e!109797 () Bool)

(declare-fun array_inv!2047 (array!6691) Bool)

(declare-fun array_inv!2048 (array!6693) Bool)

(assert (=> b!167218 (= e!109793 (and tp!14585 tp_is_empty!3797 (array_inv!2047 (_keys!5276 thiss!1248)) (array_inv!2048 (_values!3434 thiss!1248)) e!109797))))

(declare-datatypes ((SeekEntryResult!474 0))(
  ( (MissingZero!474 (index!4064 (_ BitVec 32))) (Found!474 (index!4065 (_ BitVec 32))) (Intermediate!474 (undefined!1286 Bool) (index!4066 (_ BitVec 32)) (x!18502 (_ BitVec 32))) (Undefined!474) (MissingVacant!474 (index!4067 (_ BitVec 32))) )
))
(declare-fun lt!83607 () SeekEntryResult!474)

(declare-fun b!167219 () Bool)

(declare-fun e!109798 () Bool)

(assert (=> b!167219 (= e!109798 (= (select (arr!3181 (_keys!5276 thiss!1248)) (index!4065 lt!83607)) key!828))))

(declare-fun b!167220 () Bool)

(declare-fun res!79518 () Bool)

(assert (=> b!167220 (=> (not res!79518) (not e!109791))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!6691 (_ BitVec 32)) Bool)

(assert (=> b!167220 (= res!79518 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5276 thiss!1248) (mask!8194 thiss!1248)))))

(declare-fun mapIsEmpty!6414 () Bool)

(declare-fun mapRes!6414 () Bool)

(assert (=> mapIsEmpty!6414 mapRes!6414))

(declare-fun b!167221 () Bool)

(assert (=> b!167221 (= e!109795 e!109792)))

(declare-fun res!79524 () Bool)

(assert (=> b!167221 (=> (not res!79524) (not e!109792))))

(assert (=> b!167221 (= res!79524 (and (not (is-Undefined!474 lt!83607)) (not (is-MissingVacant!474 lt!83607)) (not (is-MissingZero!474 lt!83607)) (is-Found!474 lt!83607)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6691 (_ BitVec 32)) SeekEntryResult!474)

(assert (=> b!167221 (= lt!83607 (seekEntryOrOpen!0 key!828 (_keys!5276 thiss!1248) (mask!8194 thiss!1248)))))

(declare-fun b!167222 () Bool)

(declare-fun lt!83608 () Unit!5112)

(assert (=> b!167222 (= e!109794 lt!83608)))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!101 (array!6691 array!6693 (_ BitVec 32) (_ BitVec 32) V!4709 V!4709 (_ BitVec 64) Int) Unit!5112)

(assert (=> b!167222 (= lt!83608 (lemmaInListMapThenSeekEntryOrOpenFindsIt!101 (_keys!5276 thiss!1248) (_values!3434 thiss!1248) (mask!8194 thiss!1248) (extraKeys!3192 thiss!1248) (zeroValue!3294 thiss!1248) (minValue!3294 thiss!1248) key!828 (defaultEntry!3451 thiss!1248)))))

(declare-fun res!79521 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!167222 (= res!79521 (inRange!0 (index!4065 lt!83607) (mask!8194 thiss!1248)))))

(assert (=> b!167222 (=> (not res!79521) (not e!109798))))

(assert (=> b!167222 e!109798))

(declare-fun b!167223 () Bool)

(declare-fun e!109796 () Bool)

(assert (=> b!167223 (= e!109796 tp_is_empty!3797)))

(declare-fun b!167224 () Bool)

(assert (=> b!167224 (= e!109797 (and e!109799 mapRes!6414))))

(declare-fun condMapEmpty!6414 () Bool)

(declare-fun mapDefault!6414 () ValueCell!1555)

