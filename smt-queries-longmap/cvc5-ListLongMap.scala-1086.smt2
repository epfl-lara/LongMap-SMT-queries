; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!22198 () Bool)

(assert start!22198)

(declare-fun b!232625 () Bool)

(declare-fun b_free!6265 () Bool)

(declare-fun b_next!6265 () Bool)

(assert (=> b!232625 (= b_free!6265 (not b_next!6265))))

(declare-fun tp!21937 () Bool)

(declare-fun b_and!13163 () Bool)

(assert (=> b!232625 (= tp!21937 b_and!13163)))

(declare-fun b!232622 () Bool)

(declare-fun res!114215 () Bool)

(declare-fun e!151076 () Bool)

(assert (=> b!232622 (=> (not res!114215) (not e!151076))))

(declare-datatypes ((V!7817 0))(
  ( (V!7818 (val!3108 Int)) )
))
(declare-datatypes ((ValueCell!2720 0))(
  ( (ValueCellFull!2720 (v!5128 V!7817)) (EmptyCell!2720) )
))
(declare-datatypes ((array!11497 0))(
  ( (array!11498 (arr!5468 (Array (_ BitVec 32) ValueCell!2720)) (size!5801 (_ BitVec 32))) )
))
(declare-datatypes ((array!11499 0))(
  ( (array!11500 (arr!5469 (Array (_ BitVec 32) (_ BitVec 64))) (size!5802 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3340 0))(
  ( (LongMapFixedSize!3341 (defaultEntry!4329 Int) (mask!10245 (_ BitVec 32)) (extraKeys!4066 (_ BitVec 32)) (zeroValue!4170 V!7817) (minValue!4170 V!7817) (_size!1719 (_ BitVec 32)) (_keys!6383 array!11499) (_values!4312 array!11497) (_vacant!1719 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3340)

(declare-datatypes ((SeekEntryResult!967 0))(
  ( (MissingZero!967 (index!6038 (_ BitVec 32))) (Found!967 (index!6039 (_ BitVec 32))) (Intermediate!967 (undefined!1779 Bool) (index!6040 (_ BitVec 32)) (x!23571 (_ BitVec 32))) (Undefined!967) (MissingVacant!967 (index!6041 (_ BitVec 32))) )
))
(declare-fun lt!117560 () SeekEntryResult!967)

(assert (=> b!232622 (= res!114215 (= (select (arr!5469 (_keys!6383 thiss!1504)) (index!6038 lt!117560)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun c!38685 () Bool)

(declare-fun call!21629 () Bool)

(declare-fun bm!21626 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!21626 (= call!21629 (inRange!0 (ite c!38685 (index!6038 lt!117560) (index!6041 lt!117560)) (mask!10245 thiss!1504)))))

(declare-fun mapNonEmpty!10360 () Bool)

(declare-fun mapRes!10360 () Bool)

(declare-fun tp!21936 () Bool)

(declare-fun e!151081 () Bool)

(assert (=> mapNonEmpty!10360 (= mapRes!10360 (and tp!21936 e!151081))))

(declare-fun mapValue!10360 () ValueCell!2720)

(declare-fun mapRest!10360 () (Array (_ BitVec 32) ValueCell!2720))

(declare-fun mapKey!10360 () (_ BitVec 32))

(assert (=> mapNonEmpty!10360 (= (arr!5468 (_values!4312 thiss!1504)) (store mapRest!10360 mapKey!10360 mapValue!10360))))

(declare-fun b!232623 () Bool)

(declare-fun e!151073 () Bool)

(declare-fun e!151072 () Bool)

(assert (=> b!232623 (= e!151073 e!151072)))

(declare-fun res!114213 () Bool)

(assert (=> b!232623 (= res!114213 call!21629)))

(assert (=> b!232623 (=> (not res!114213) (not e!151072))))

(declare-fun b!232624 () Bool)

(assert (=> b!232624 (= e!151073 (is-Undefined!967 lt!117560))))

(declare-fun e!151084 () Bool)

(declare-fun tp_is_empty!6127 () Bool)

(declare-fun e!151083 () Bool)

(declare-fun array_inv!3603 (array!11499) Bool)

(declare-fun array_inv!3604 (array!11497) Bool)

(assert (=> b!232625 (= e!151084 (and tp!21937 tp_is_empty!6127 (array_inv!3603 (_keys!6383 thiss!1504)) (array_inv!3604 (_values!4312 thiss!1504)) e!151083))))

(declare-fun b!232626 () Bool)

(declare-fun e!151078 () Bool)

(declare-fun e!151079 () Bool)

(assert (=> b!232626 (= e!151078 e!151079)))

(declare-fun res!114216 () Bool)

(assert (=> b!232626 (=> (not res!114216) (not e!151079))))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!232626 (= res!114216 (inRange!0 index!297 (mask!10245 thiss!1504)))))

(declare-datatypes ((Unit!7186 0))(
  ( (Unit!7187) )
))
(declare-fun lt!117550 () Unit!7186)

(declare-fun e!151071 () Unit!7186)

(assert (=> b!232626 (= lt!117550 e!151071)))

(declare-fun c!38686 () Bool)

(declare-datatypes ((tuple2!4586 0))(
  ( (tuple2!4587 (_1!2304 (_ BitVec 64)) (_2!2304 V!7817)) )
))
(declare-datatypes ((List!3503 0))(
  ( (Nil!3500) (Cons!3499 (h!4147 tuple2!4586) (t!8462 List!3503)) )
))
(declare-datatypes ((ListLongMap!3499 0))(
  ( (ListLongMap!3500 (toList!1765 List!3503)) )
))
(declare-fun lt!117569 () ListLongMap!3499)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun contains!1633 (ListLongMap!3499 (_ BitVec 64)) Bool)

(assert (=> b!232626 (= c!38686 (contains!1633 lt!117569 key!932))))

(declare-fun getCurrentListMap!1293 (array!11499 array!11497 (_ BitVec 32) (_ BitVec 32) V!7817 V!7817 (_ BitVec 32) Int) ListLongMap!3499)

(assert (=> b!232626 (= lt!117569 (getCurrentListMap!1293 (_keys!6383 thiss!1504) (_values!4312 thiss!1504) (mask!10245 thiss!1504) (extraKeys!4066 thiss!1504) (zeroValue!4170 thiss!1504) (minValue!4170 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4329 thiss!1504)))))

(declare-fun mapIsEmpty!10360 () Bool)

(assert (=> mapIsEmpty!10360 mapRes!10360))

(declare-fun b!232627 () Bool)

(declare-fun e!151082 () Bool)

(assert (=> b!232627 (= e!151083 (and e!151082 mapRes!10360))))

(declare-fun condMapEmpty!10360 () Bool)

(declare-fun mapDefault!10360 () ValueCell!2720)

