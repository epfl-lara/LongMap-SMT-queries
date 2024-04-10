; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!22102 () Bool)

(assert start!22102)

(declare-fun b!229747 () Bool)

(declare-fun b_free!6169 () Bool)

(declare-fun b_next!6169 () Bool)

(assert (=> b!229747 (= b_free!6169 (not b_next!6169))))

(declare-fun tp!21649 () Bool)

(declare-fun b_and!13067 () Bool)

(assert (=> b!229747 (= tp!21649 b_and!13067)))

(declare-fun res!113060 () Bool)

(declare-fun e!149061 () Bool)

(assert (=> start!22102 (=> (not res!113060) (not e!149061))))

(declare-datatypes ((V!7689 0))(
  ( (V!7690 (val!3060 Int)) )
))
(declare-datatypes ((ValueCell!2672 0))(
  ( (ValueCellFull!2672 (v!5080 V!7689)) (EmptyCell!2672) )
))
(declare-datatypes ((array!11305 0))(
  ( (array!11306 (arr!5372 (Array (_ BitVec 32) ValueCell!2672)) (size!5705 (_ BitVec 32))) )
))
(declare-datatypes ((array!11307 0))(
  ( (array!11308 (arr!5373 (Array (_ BitVec 32) (_ BitVec 64))) (size!5706 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3244 0))(
  ( (LongMapFixedSize!3245 (defaultEntry!4281 Int) (mask!10165 (_ BitVec 32)) (extraKeys!4018 (_ BitVec 32)) (zeroValue!4122 V!7689) (minValue!4122 V!7689) (_size!1671 (_ BitVec 32)) (_keys!6335 array!11307) (_values!4264 array!11305) (_vacant!1671 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3244)

(declare-fun valid!1294 (LongMapFixedSize!3244) Bool)

(assert (=> start!22102 (= res!113060 (valid!1294 thiss!1504))))

(assert (=> start!22102 e!149061))

(declare-fun e!149057 () Bool)

(assert (=> start!22102 e!149057))

(assert (=> start!22102 true))

(declare-fun tp_is_empty!6031 () Bool)

(assert (=> start!22102 tp_is_empty!6031))

(declare-fun b!229740 () Bool)

(declare-fun e!149053 () Bool)

(declare-fun e!149055 () Bool)

(assert (=> b!229740 (= e!149053 e!149055)))

(declare-fun res!113064 () Bool)

(assert (=> b!229740 (=> (not res!113064) (not e!149055))))

(declare-fun index!297 () (_ BitVec 32))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!229740 (= res!113064 (inRange!0 index!297 (mask!10165 thiss!1504)))))

(declare-datatypes ((Unit!7014 0))(
  ( (Unit!7015) )
))
(declare-fun lt!115555 () Unit!7014)

(declare-fun e!149056 () Unit!7014)

(assert (=> b!229740 (= lt!115555 e!149056)))

(declare-fun c!38110 () Bool)

(declare-datatypes ((tuple2!4512 0))(
  ( (tuple2!4513 (_1!2267 (_ BitVec 64)) (_2!2267 V!7689)) )
))
(declare-datatypes ((List!3437 0))(
  ( (Nil!3434) (Cons!3433 (h!4081 tuple2!4512) (t!8396 List!3437)) )
))
(declare-datatypes ((ListLongMap!3425 0))(
  ( (ListLongMap!3426 (toList!1728 List!3437)) )
))
(declare-fun lt!115563 () ListLongMap!3425)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun contains!1602 (ListLongMap!3425 (_ BitVec 64)) Bool)

(assert (=> b!229740 (= c!38110 (contains!1602 lt!115563 key!932))))

(declare-fun getCurrentListMap!1256 (array!11307 array!11305 (_ BitVec 32) (_ BitVec 32) V!7689 V!7689 (_ BitVec 32) Int) ListLongMap!3425)

(assert (=> b!229740 (= lt!115563 (getCurrentListMap!1256 (_keys!6335 thiss!1504) (_values!4264 thiss!1504) (mask!10165 thiss!1504) (extraKeys!4018 thiss!1504) (zeroValue!4122 thiss!1504) (minValue!4122 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4281 thiss!1504)))))

(declare-fun b!229741 () Bool)

(declare-fun res!113059 () Bool)

(declare-datatypes ((SeekEntryResult!926 0))(
  ( (MissingZero!926 (index!5874 (_ BitVec 32))) (Found!926 (index!5875 (_ BitVec 32))) (Intermediate!926 (undefined!1738 Bool) (index!5876 (_ BitVec 32)) (x!23402 (_ BitVec 32))) (Undefined!926) (MissingVacant!926 (index!5877 (_ BitVec 32))) )
))
(declare-fun lt!115556 () SeekEntryResult!926)

(assert (=> b!229741 (= res!113059 (= (select (arr!5373 (_keys!6335 thiss!1504)) (index!5877 lt!115556)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!149064 () Bool)

(assert (=> b!229741 (=> (not res!113059) (not e!149064))))

(declare-fun bm!21338 () Bool)

(declare-fun call!21341 () Bool)

(declare-fun arrayContainsKey!0 (array!11307 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!21338 (= call!21341 (arrayContainsKey!0 (_keys!6335 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!229742 () Bool)

(declare-fun res!113065 () Bool)

(assert (=> b!229742 (=> (not res!113065) (not e!149061))))

(assert (=> b!229742 (= res!113065 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!229743 () Bool)

(declare-fun e!149065 () Bool)

(declare-fun e!149054 () Bool)

(declare-fun mapRes!10216 () Bool)

(assert (=> b!229743 (= e!149065 (and e!149054 mapRes!10216))))

(declare-fun condMapEmpty!10216 () Bool)

(declare-fun mapDefault!10216 () ValueCell!2672)

