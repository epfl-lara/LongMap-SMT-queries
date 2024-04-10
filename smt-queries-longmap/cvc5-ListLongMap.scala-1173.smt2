; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25184 () Bool)

(assert start!25184)

(declare-fun b!262412 () Bool)

(declare-fun b_free!6787 () Bool)

(declare-fun b_next!6787 () Bool)

(assert (=> b!262412 (= b_free!6787 (not b_next!6787))))

(declare-fun tp!23694 () Bool)

(declare-fun b_and!13925 () Bool)

(assert (=> b!262412 (= tp!23694 b_and!13925)))

(declare-fun bm!25075 () Bool)

(declare-fun call!25079 () Bool)

(declare-datatypes ((V!8513 0))(
  ( (V!8514 (val!3369 Int)) )
))
(declare-datatypes ((ValueCell!2981 0))(
  ( (ValueCellFull!2981 (v!5497 V!8513)) (EmptyCell!2981) )
))
(declare-datatypes ((array!12657 0))(
  ( (array!12658 (arr!5990 (Array (_ BitVec 32) ValueCell!2981)) (size!6341 (_ BitVec 32))) )
))
(declare-datatypes ((array!12659 0))(
  ( (array!12660 (arr!5991 (Array (_ BitVec 32) (_ BitVec 64))) (size!6342 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3862 0))(
  ( (LongMapFixedSize!3863 (defaultEntry!4834 Int) (mask!11193 (_ BitVec 32)) (extraKeys!4571 (_ BitVec 32)) (zeroValue!4675 V!8513) (minValue!4675 V!8513) (_size!1980 (_ BitVec 32)) (_keys!7024 array!12659) (_values!4817 array!12657) (_vacant!1980 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3862)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!12659 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!25075 (= call!25079 (arrayContainsKey!0 (_keys!7024 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun mapIsEmpty!11335 () Bool)

(declare-fun mapRes!11335 () Bool)

(assert (=> mapIsEmpty!11335 mapRes!11335))

(declare-fun mapNonEmpty!11335 () Bool)

(declare-fun tp!23695 () Bool)

(declare-fun e!170055 () Bool)

(assert (=> mapNonEmpty!11335 (= mapRes!11335 (and tp!23695 e!170055))))

(declare-fun mapRest!11335 () (Array (_ BitVec 32) ValueCell!2981))

(declare-fun mapValue!11335 () ValueCell!2981)

(declare-fun mapKey!11335 () (_ BitVec 32))

(assert (=> mapNonEmpty!11335 (= (arr!5990 (_values!4817 thiss!1504)) (store mapRest!11335 mapKey!11335 mapValue!11335))))

(declare-fun b!262405 () Bool)

(declare-fun res!128172 () Bool)

(declare-fun e!170056 () Bool)

(assert (=> b!262405 (=> (not res!128172) (not e!170056))))

(assert (=> b!262405 (= res!128172 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!262406 () Bool)

(declare-fun e!170057 () Bool)

(declare-fun e!170054 () Bool)

(assert (=> b!262406 (= e!170057 e!170054)))

(declare-fun res!128178 () Bool)

(assert (=> b!262406 (=> (not res!128178) (not e!170054))))

(declare-fun index!297 () (_ BitVec 32))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!262406 (= res!128178 (inRange!0 index!297 (mask!11193 thiss!1504)))))

(declare-datatypes ((Unit!8173 0))(
  ( (Unit!8174) )
))
(declare-fun lt!132644 () Unit!8173)

(declare-fun e!170049 () Unit!8173)

(assert (=> b!262406 (= lt!132644 e!170049)))

(declare-fun c!44715 () Bool)

(declare-datatypes ((tuple2!4970 0))(
  ( (tuple2!4971 (_1!2496 (_ BitVec 64)) (_2!2496 V!8513)) )
))
(declare-datatypes ((List!3846 0))(
  ( (Nil!3843) (Cons!3842 (h!4508 tuple2!4970) (t!8921 List!3846)) )
))
(declare-datatypes ((ListLongMap!3883 0))(
  ( (ListLongMap!3884 (toList!1957 List!3846)) )
))
(declare-fun lt!132642 () ListLongMap!3883)

(declare-fun contains!1906 (ListLongMap!3883 (_ BitVec 64)) Bool)

(assert (=> b!262406 (= c!44715 (contains!1906 lt!132642 key!932))))

(declare-fun getCurrentListMap!1485 (array!12659 array!12657 (_ BitVec 32) (_ BitVec 32) V!8513 V!8513 (_ BitVec 32) Int) ListLongMap!3883)

(assert (=> b!262406 (= lt!132642 (getCurrentListMap!1485 (_keys!7024 thiss!1504) (_values!4817 thiss!1504) (mask!11193 thiss!1504) (extraKeys!4571 thiss!1504) (zeroValue!4675 thiss!1504) (minValue!4675 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4834 thiss!1504)))))

(declare-fun b!262407 () Bool)

(declare-fun res!128169 () Bool)

(declare-fun e!170058 () Bool)

(assert (=> b!262407 (=> res!128169 e!170058)))

(assert (=> b!262407 (= res!128169 (or (not (= (size!6341 (_values!4817 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!11193 thiss!1504)))) (not (= (size!6342 (_keys!7024 thiss!1504)) (size!6341 (_values!4817 thiss!1504)))) (bvslt (mask!11193 thiss!1504) #b00000000000000000000000000000000) (bvslt (extraKeys!4571 thiss!1504) #b00000000000000000000000000000000) (bvsgt (extraKeys!4571 thiss!1504) #b00000000000000000000000000000011) (bvslt index!297 #b00000000000000000000000000000000) (bvsge index!297 (size!6342 (_keys!7024 thiss!1504)))))))

(declare-fun call!25078 () Bool)

(declare-datatypes ((SeekEntryResult!1196 0))(
  ( (MissingZero!1196 (index!6954 (_ BitVec 32))) (Found!1196 (index!6955 (_ BitVec 32))) (Intermediate!1196 (undefined!2008 Bool) (index!6956 (_ BitVec 32)) (x!25220 (_ BitVec 32))) (Undefined!1196) (MissingVacant!1196 (index!6957 (_ BitVec 32))) )
))
(declare-fun lt!132641 () SeekEntryResult!1196)

(declare-fun bm!25076 () Bool)

(declare-fun c!44716 () Bool)

(assert (=> bm!25076 (= call!25078 (inRange!0 (ite c!44716 (index!6954 lt!132641) (index!6957 lt!132641)) (mask!11193 thiss!1504)))))

(declare-fun b!262408 () Bool)

(declare-fun res!128173 () Bool)

(assert (=> b!262408 (= res!128173 (= (select (arr!5991 (_keys!7024 thiss!1504)) (index!6957 lt!132641)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!170062 () Bool)

(assert (=> b!262408 (=> (not res!128173) (not e!170062))))

(declare-fun b!262409 () Bool)

(assert (=> b!262409 (= e!170062 (not call!25079))))

(declare-fun b!262410 () Bool)

(declare-fun e!170060 () Bool)

(declare-fun e!170052 () Bool)

(assert (=> b!262410 (= e!170060 (and e!170052 mapRes!11335))))

(declare-fun condMapEmpty!11335 () Bool)

(declare-fun mapDefault!11335 () ValueCell!2981)

