; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!22142 () Bool)

(assert start!22142)

(declare-fun b!230951 () Bool)

(declare-fun b_free!6209 () Bool)

(declare-fun b_next!6209 () Bool)

(assert (=> b!230951 (= b_free!6209 (not b_next!6209))))

(declare-fun tp!21769 () Bool)

(declare-fun b_and!13107 () Bool)

(assert (=> b!230951 (= tp!21769 b_and!13107)))

(declare-fun b!230940 () Bool)

(declare-fun e!149897 () Bool)

(declare-datatypes ((SeekEntryResult!944 0))(
  ( (MissingZero!944 (index!5946 (_ BitVec 32))) (Found!944 (index!5947 (_ BitVec 32))) (Intermediate!944 (undefined!1756 Bool) (index!5948 (_ BitVec 32)) (x!23468 (_ BitVec 32))) (Undefined!944) (MissingVacant!944 (index!5949 (_ BitVec 32))) )
))
(declare-fun lt!116328 () SeekEntryResult!944)

(assert (=> b!230940 (= e!149897 (is-Undefined!944 lt!116328))))

(declare-fun b!230941 () Bool)

(declare-fun c!38350 () Bool)

(assert (=> b!230941 (= c!38350 (is-MissingVacant!944 lt!116328))))

(declare-fun e!149899 () Bool)

(assert (=> b!230941 (= e!149899 e!149897)))

(declare-fun b!230943 () Bool)

(declare-fun e!149904 () Bool)

(declare-fun e!149898 () Bool)

(assert (=> b!230943 (= e!149904 e!149898)))

(declare-fun res!113543 () Bool)

(assert (=> b!230943 (=> (not res!113543) (not e!149898))))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!230943 (= res!113543 (or (= lt!116328 (MissingZero!944 index!297)) (= lt!116328 (MissingVacant!944 index!297))))))

(declare-fun key!932 () (_ BitVec 64))

(declare-datatypes ((V!7741 0))(
  ( (V!7742 (val!3080 Int)) )
))
(declare-datatypes ((ValueCell!2692 0))(
  ( (ValueCellFull!2692 (v!5100 V!7741)) (EmptyCell!2692) )
))
(declare-datatypes ((array!11385 0))(
  ( (array!11386 (arr!5412 (Array (_ BitVec 32) ValueCell!2692)) (size!5745 (_ BitVec 32))) )
))
(declare-datatypes ((array!11387 0))(
  ( (array!11388 (arr!5413 (Array (_ BitVec 32) (_ BitVec 64))) (size!5746 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3284 0))(
  ( (LongMapFixedSize!3285 (defaultEntry!4301 Int) (mask!10197 (_ BitVec 32)) (extraKeys!4038 (_ BitVec 32)) (zeroValue!4142 V!7741) (minValue!4142 V!7741) (_size!1691 (_ BitVec 32)) (_keys!6355 array!11387) (_values!4284 array!11385) (_vacant!1691 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3284)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11387 (_ BitVec 32)) SeekEntryResult!944)

(assert (=> b!230943 (= lt!116328 (seekEntryOrOpen!0 key!932 (_keys!6355 thiss!1504) (mask!10197 thiss!1504)))))

(declare-fun call!21461 () Bool)

(declare-fun bm!21458 () Bool)

(declare-fun c!38349 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!21458 (= call!21461 (inRange!0 (ite c!38349 (index!5946 lt!116328) (index!5949 lt!116328)) (mask!10197 thiss!1504)))))

(declare-fun b!230944 () Bool)

(declare-datatypes ((Unit!7086 0))(
  ( (Unit!7087) )
))
(declare-fun e!149895 () Unit!7086)

(declare-fun Unit!7088 () Unit!7086)

(assert (=> b!230944 (= e!149895 Unit!7088)))

(declare-fun lt!116323 () Unit!7086)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!295 (array!11387 array!11385 (_ BitVec 32) (_ BitVec 32) V!7741 V!7741 (_ BitVec 64) Int) Unit!7086)

(assert (=> b!230944 (= lt!116323 (lemmaInListMapThenSeekEntryOrOpenFindsIt!295 (_keys!6355 thiss!1504) (_values!4284 thiss!1504) (mask!10197 thiss!1504) (extraKeys!4038 thiss!1504) (zeroValue!4142 thiss!1504) (minValue!4142 thiss!1504) key!932 (defaultEntry!4301 thiss!1504)))))

(assert (=> b!230944 false))

(declare-fun b!230945 () Bool)

(declare-fun res!113541 () Bool)

(assert (=> b!230945 (= res!113541 (= (select (arr!5413 (_keys!6355 thiss!1504)) (index!5949 lt!116328)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!149905 () Bool)

(assert (=> b!230945 (=> (not res!113541) (not e!149905))))

(declare-fun mapIsEmpty!10276 () Bool)

(declare-fun mapRes!10276 () Bool)

(assert (=> mapIsEmpty!10276 mapRes!10276))

(declare-fun b!230946 () Bool)

(declare-fun e!149900 () Bool)

(declare-fun call!21462 () Bool)

(assert (=> b!230946 (= e!149900 (not call!21462))))

(declare-fun b!230947 () Bool)

(declare-fun e!149893 () Bool)

(assert (=> b!230947 (= e!149898 e!149893)))

(declare-fun res!113538 () Bool)

(assert (=> b!230947 (=> (not res!113538) (not e!149893))))

(assert (=> b!230947 (= res!113538 (inRange!0 index!297 (mask!10197 thiss!1504)))))

(declare-fun lt!116319 () Unit!7086)

(assert (=> b!230947 (= lt!116319 e!149895)))

(declare-fun c!38351 () Bool)

(declare-datatypes ((tuple2!4544 0))(
  ( (tuple2!4545 (_1!2283 (_ BitVec 64)) (_2!2283 V!7741)) )
))
(declare-datatypes ((List!3465 0))(
  ( (Nil!3462) (Cons!3461 (h!4109 tuple2!4544) (t!8424 List!3465)) )
))
(declare-datatypes ((ListLongMap!3457 0))(
  ( (ListLongMap!3458 (toList!1744 List!3465)) )
))
(declare-fun lt!116330 () ListLongMap!3457)

(declare-fun contains!1616 (ListLongMap!3457 (_ BitVec 64)) Bool)

(assert (=> b!230947 (= c!38351 (contains!1616 lt!116330 key!932))))

(declare-fun getCurrentListMap!1272 (array!11387 array!11385 (_ BitVec 32) (_ BitVec 32) V!7741 V!7741 (_ BitVec 32) Int) ListLongMap!3457)

(assert (=> b!230947 (= lt!116330 (getCurrentListMap!1272 (_keys!6355 thiss!1504) (_values!4284 thiss!1504) (mask!10197 thiss!1504) (extraKeys!4038 thiss!1504) (zeroValue!4142 thiss!1504) (minValue!4142 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4301 thiss!1504)))))

(declare-fun b!230948 () Bool)

(declare-fun e!149906 () Bool)

(declare-fun tp_is_empty!6071 () Bool)

(assert (=> b!230948 (= e!149906 tp_is_empty!6071)))

(declare-fun bm!21459 () Bool)

(declare-fun arrayContainsKey!0 (array!11387 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!21459 (= call!21462 (arrayContainsKey!0 (_keys!6355 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun res!113544 () Bool)

(assert (=> start!22142 (=> (not res!113544) (not e!149904))))

(declare-fun valid!1305 (LongMapFixedSize!3284) Bool)

(assert (=> start!22142 (= res!113544 (valid!1305 thiss!1504))))

(assert (=> start!22142 e!149904))

(declare-fun e!149901 () Bool)

(assert (=> start!22142 e!149901))

(assert (=> start!22142 true))

(assert (=> start!22142 tp_is_empty!6071))

(declare-fun b!230942 () Bool)

(declare-fun e!149894 () Unit!7086)

(declare-fun Unit!7089 () Unit!7086)

(assert (=> b!230942 (= e!149894 Unit!7089)))

(declare-fun b!230949 () Bool)

(declare-fun lt!116317 () Unit!7086)

(assert (=> b!230949 (= e!149895 lt!116317)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!313 (array!11387 array!11385 (_ BitVec 32) (_ BitVec 32) V!7741 V!7741 (_ BitVec 64) Int) Unit!7086)

(assert (=> b!230949 (= lt!116317 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!313 (_keys!6355 thiss!1504) (_values!4284 thiss!1504) (mask!10197 thiss!1504) (extraKeys!4038 thiss!1504) (zeroValue!4142 thiss!1504) (minValue!4142 thiss!1504) key!932 (defaultEntry!4301 thiss!1504)))))

(assert (=> b!230949 (= c!38349 (is-MissingZero!944 lt!116328))))

(assert (=> b!230949 e!149899))

(declare-fun b!230950 () Bool)

(declare-fun res!113545 () Bool)

(assert (=> b!230950 (=> (not res!113545) (not e!149900))))

(assert (=> b!230950 (= res!113545 (= (select (arr!5413 (_keys!6355 thiss!1504)) (index!5946 lt!116328)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!149903 () Bool)

(declare-fun array_inv!3569 (array!11387) Bool)

(declare-fun array_inv!3570 (array!11385) Bool)

(assert (=> b!230951 (= e!149901 (and tp!21769 tp_is_empty!6071 (array_inv!3569 (_keys!6355 thiss!1504)) (array_inv!3570 (_values!4284 thiss!1504)) e!149903))))

(declare-fun b!230952 () Bool)

(assert (=> b!230952 (= e!149897 e!149905)))

(declare-fun res!113542 () Bool)

(assert (=> b!230952 (= res!113542 call!21461)))

(assert (=> b!230952 (=> (not res!113542) (not e!149905))))

(declare-fun b!230953 () Bool)

(declare-fun e!149896 () Bool)

(assert (=> b!230953 (= e!149903 (and e!149896 mapRes!10276))))

(declare-fun condMapEmpty!10276 () Bool)

(declare-fun mapDefault!10276 () ValueCell!2692)

