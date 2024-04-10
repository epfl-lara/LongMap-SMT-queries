; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!22912 () Bool)

(assert start!22912)

(declare-fun b!238835 () Bool)

(declare-fun b_free!6415 () Bool)

(declare-fun b_next!6415 () Bool)

(assert (=> b!238835 (= b_free!6415 (not b_next!6415))))

(declare-fun tp!22448 () Bool)

(declare-fun b_and!13381 () Bool)

(assert (=> b!238835 (= tp!22448 b_and!13381)))

(declare-fun b!238820 () Bool)

(declare-fun e!155065 () Bool)

(declare-fun e!155069 () Bool)

(assert (=> b!238820 (= e!155065 e!155069)))

(declare-fun res!117044 () Bool)

(declare-fun call!22205 () Bool)

(assert (=> b!238820 (= res!117044 call!22205)))

(assert (=> b!238820 (=> (not res!117044) (not e!155069))))

(declare-fun b!238821 () Bool)

(declare-fun res!117039 () Bool)

(declare-fun e!155068 () Bool)

(assert (=> b!238821 (=> (not res!117039) (not e!155068))))

(declare-datatypes ((V!8017 0))(
  ( (V!8018 (val!3183 Int)) )
))
(declare-datatypes ((ValueCell!2795 0))(
  ( (ValueCellFull!2795 (v!5221 V!8017)) (EmptyCell!2795) )
))
(declare-datatypes ((array!11833 0))(
  ( (array!11834 (arr!5618 (Array (_ BitVec 32) ValueCell!2795)) (size!5959 (_ BitVec 32))) )
))
(declare-datatypes ((array!11835 0))(
  ( (array!11836 (arr!5619 (Array (_ BitVec 32) (_ BitVec 64))) (size!5960 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3490 0))(
  ( (LongMapFixedSize!3491 (defaultEntry!4430 Int) (mask!10470 (_ BitVec 32)) (extraKeys!4167 (_ BitVec 32)) (zeroValue!4271 V!8017) (minValue!4271 V!8017) (_size!1794 (_ BitVec 32)) (_keys!6532 array!11835) (_values!4413 array!11833) (_vacant!1794 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3490)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!11835 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!238821 (= res!117039 (arrayContainsKey!0 (_keys!6532 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!238822 () Bool)

(declare-fun e!155058 () Bool)

(declare-fun e!155066 () Bool)

(assert (=> b!238822 (= e!155058 e!155066)))

(declare-fun res!117047 () Bool)

(assert (=> b!238822 (=> (not res!117047) (not e!155066))))

(declare-datatypes ((SeekEntryResult!1023 0))(
  ( (MissingZero!1023 (index!6262 (_ BitVec 32))) (Found!1023 (index!6263 (_ BitVec 32))) (Intermediate!1023 (undefined!1835 Bool) (index!6264 (_ BitVec 32)) (x!24071 (_ BitVec 32))) (Undefined!1023) (MissingVacant!1023 (index!6265 (_ BitVec 32))) )
))
(declare-fun lt!120667 () SeekEntryResult!1023)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!238822 (= res!117047 (or (= lt!120667 (MissingZero!1023 index!297)) (= lt!120667 (MissingVacant!1023 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11835 (_ BitVec 32)) SeekEntryResult!1023)

(assert (=> b!238822 (= lt!120667 (seekEntryOrOpen!0 key!932 (_keys!6532 thiss!1504) (mask!10470 thiss!1504)))))

(declare-fun bm!22202 () Bool)

(declare-fun call!22206 () Bool)

(assert (=> bm!22202 (= call!22206 (arrayContainsKey!0 (_keys!6532 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!238823 () Bool)

(declare-fun c!39820 () Bool)

(assert (=> b!238823 (= c!39820 (is-MissingVacant!1023 lt!120667))))

(declare-fun e!155064 () Bool)

(assert (=> b!238823 (= e!155064 e!155065)))

(declare-fun b!238824 () Bool)

(assert (=> b!238824 (= e!155069 (not call!22206))))

(declare-fun b!238825 () Bool)

(declare-fun e!155063 () Bool)

(declare-fun e!155061 () Bool)

(declare-fun mapRes!10647 () Bool)

(assert (=> b!238825 (= e!155063 (and e!155061 mapRes!10647))))

(declare-fun condMapEmpty!10647 () Bool)

(declare-fun mapDefault!10647 () ValueCell!2795)

