; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!22084 () Bool)

(assert start!22084)

(declare-fun b!229138 () Bool)

(declare-fun b_free!6151 () Bool)

(declare-fun b_next!6151 () Bool)

(assert (=> b!229138 (= b_free!6151 (not b_next!6151))))

(declare-fun tp!21595 () Bool)

(declare-fun b_and!13049 () Bool)

(assert (=> b!229138 (= tp!21595 b_and!13049)))

(declare-fun b!229125 () Bool)

(declare-fun res!112773 () Bool)

(declare-fun e!148656 () Bool)

(assert (=> b!229125 (=> (not res!112773) (not e!148656))))

(declare-datatypes ((V!7665 0))(
  ( (V!7666 (val!3051 Int)) )
))
(declare-datatypes ((ValueCell!2663 0))(
  ( (ValueCellFull!2663 (v!5071 V!7665)) (EmptyCell!2663) )
))
(declare-datatypes ((array!11269 0))(
  ( (array!11270 (arr!5354 (Array (_ BitVec 32) ValueCell!2663)) (size!5687 (_ BitVec 32))) )
))
(declare-datatypes ((array!11271 0))(
  ( (array!11272 (arr!5355 (Array (_ BitVec 32) (_ BitVec 64))) (size!5688 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3226 0))(
  ( (LongMapFixedSize!3227 (defaultEntry!4272 Int) (mask!10150 (_ BitVec 32)) (extraKeys!4009 (_ BitVec 32)) (zeroValue!4113 V!7665) (minValue!4113 V!7665) (_size!1662 (_ BitVec 32)) (_keys!6326 array!11271) (_values!4255 array!11269) (_vacant!1662 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3226)

(declare-datatypes ((SeekEntryResult!917 0))(
  ( (MissingZero!917 (index!5838 (_ BitVec 32))) (Found!917 (index!5839 (_ BitVec 32))) (Intermediate!917 (undefined!1729 Bool) (index!5840 (_ BitVec 32)) (x!23369 (_ BitVec 32))) (Undefined!917) (MissingVacant!917 (index!5841 (_ BitVec 32))) )
))
(declare-fun lt!115259 () SeekEntryResult!917)

(assert (=> b!229125 (= res!112773 (= (select (arr!5355 (_keys!6326 thiss!1504)) (index!5838 lt!115259)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!229126 () Bool)

(declare-datatypes ((Unit!6982 0))(
  ( (Unit!6983) )
))
(declare-fun e!148653 () Unit!6982)

(declare-fun lt!115264 () Unit!6982)

(assert (=> b!229126 (= e!148653 lt!115264)))

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!295 (array!11271 array!11269 (_ BitVec 32) (_ BitVec 32) V!7665 V!7665 (_ BitVec 64) Int) Unit!6982)

(assert (=> b!229126 (= lt!115264 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!295 (_keys!6326 thiss!1504) (_values!4255 thiss!1504) (mask!10150 thiss!1504) (extraKeys!4009 thiss!1504) (zeroValue!4113 thiss!1504) (minValue!4113 thiss!1504) key!932 (defaultEntry!4272 thiss!1504)))))

(declare-fun c!38001 () Bool)

(assert (=> b!229126 (= c!38001 (is-MissingZero!917 lt!115259))))

(declare-fun e!148650 () Bool)

(assert (=> b!229126 e!148650))

(declare-fun b!229127 () Bool)

(declare-fun e!148663 () Unit!6982)

(declare-fun Unit!6984 () Unit!6982)

(assert (=> b!229127 (= e!148663 Unit!6984)))

(declare-fun b!229128 () Bool)

(declare-fun e!148655 () Bool)

(declare-fun e!148652 () Bool)

(assert (=> b!229128 (= e!148655 (not e!148652))))

(declare-fun res!112775 () Bool)

(assert (=> b!229128 (=> res!112775 e!148652)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!229128 (= res!112775 (not (validMask!0 (mask!10150 thiss!1504))))))

(declare-fun lt!115265 () array!11271)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11271 (_ BitVec 32)) Bool)

(assert (=> b!229128 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!115265 (mask!10150 thiss!1504))))

(declare-fun index!297 () (_ BitVec 32))

(declare-fun lt!115258 () Unit!6982)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!11271 (_ BitVec 32) (_ BitVec 32)) Unit!6982)

(assert (=> b!229128 (= lt!115258 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6326 thiss!1504) index!297 (mask!10150 thiss!1504)))))

(declare-fun arrayCountValidKeys!0 (array!11271 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!229128 (= (arrayCountValidKeys!0 lt!115265 #b00000000000000000000000000000000 (size!5688 (_keys!6326 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6326 thiss!1504) #b00000000000000000000000000000000 (size!5688 (_keys!6326 thiss!1504)))))))

(declare-fun lt!115261 () Unit!6982)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!11271 (_ BitVec 32) (_ BitVec 64)) Unit!6982)

(assert (=> b!229128 (= lt!115261 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6326 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3425 0))(
  ( (Nil!3422) (Cons!3421 (h!4069 (_ BitVec 64)) (t!8384 List!3425)) )
))
(declare-fun arrayNoDuplicates!0 (array!11271 (_ BitVec 32) List!3425) Bool)

(assert (=> b!229128 (arrayNoDuplicates!0 lt!115265 #b00000000000000000000000000000000 Nil!3422)))

(assert (=> b!229128 (= lt!115265 (array!11272 (store (arr!5355 (_keys!6326 thiss!1504)) index!297 key!932) (size!5688 (_keys!6326 thiss!1504))))))

(declare-fun lt!115262 () Unit!6982)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!11271 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3425) Unit!6982)

(assert (=> b!229128 (= lt!115262 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6326 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3422))))

(declare-fun lt!115255 () Unit!6982)

(assert (=> b!229128 (= lt!115255 e!148663)))

(declare-fun c!38004 () Bool)

(declare-fun arrayContainsKey!0 (array!11271 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!229128 (= c!38004 (arrayContainsKey!0 (_keys!6326 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!229129 () Bool)

(declare-fun res!112769 () Bool)

(assert (=> b!229129 (=> res!112769 e!148652)))

(assert (=> b!229129 (= res!112769 (or (not (= (size!5687 (_values!4255 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10150 thiss!1504)))) (not (= (size!5688 (_keys!6326 thiss!1504)) (size!5687 (_values!4255 thiss!1504)))) (bvslt (mask!10150 thiss!1504) #b00000000000000000000000000000000) (bvslt (extraKeys!4009 thiss!1504) #b00000000000000000000000000000000) (bvsgt (extraKeys!4009 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun res!112768 () Bool)

(declare-fun e!148662 () Bool)

(assert (=> start!22084 (=> (not res!112768) (not e!148662))))

(declare-fun valid!1287 (LongMapFixedSize!3226) Bool)

(assert (=> start!22084 (= res!112768 (valid!1287 thiss!1504))))

(assert (=> start!22084 e!148662))

(declare-fun e!148661 () Bool)

(assert (=> start!22084 e!148661))

(assert (=> start!22084 true))

(declare-fun b!229130 () Bool)

(declare-fun res!112767 () Bool)

(assert (=> b!229130 (=> (not res!112767) (not e!148656))))

(declare-fun call!21287 () Bool)

(assert (=> b!229130 (= res!112767 call!21287)))

(assert (=> b!229130 (= e!148650 e!148656)))

(declare-fun bm!21284 () Bool)

(declare-fun call!21288 () Bool)

(assert (=> bm!21284 (= call!21288 (arrayContainsKey!0 (_keys!6326 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!229131 () Bool)

(declare-fun e!148658 () Bool)

(assert (=> b!229131 (= e!148662 e!148658)))

(declare-fun res!112772 () Bool)

(assert (=> b!229131 (=> (not res!112772) (not e!148658))))

(assert (=> b!229131 (= res!112772 (or (= lt!115259 (MissingZero!917 index!297)) (= lt!115259 (MissingVacant!917 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11271 (_ BitVec 32)) SeekEntryResult!917)

(assert (=> b!229131 (= lt!115259 (seekEntryOrOpen!0 key!932 (_keys!6326 thiss!1504) (mask!10150 thiss!1504)))))

(declare-fun b!229132 () Bool)

(declare-fun e!148651 () Bool)

(assert (=> b!229132 (= e!148651 (is-Undefined!917 lt!115259))))

(declare-fun b!229133 () Bool)

(declare-fun c!38002 () Bool)

(assert (=> b!229133 (= c!38002 (is-MissingVacant!917 lt!115259))))

(assert (=> b!229133 (= e!148650 e!148651)))

(declare-fun b!229134 () Bool)

(declare-fun e!148657 () Bool)

(assert (=> b!229134 (= e!148651 e!148657)))

(declare-fun res!112776 () Bool)

(assert (=> b!229134 (= res!112776 call!21287)))

(assert (=> b!229134 (=> (not res!112776) (not e!148657))))

(declare-fun bm!21285 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!21285 (= call!21287 (inRange!0 (ite c!38001 (index!5838 lt!115259) (index!5841 lt!115259)) (mask!10150 thiss!1504)))))

(declare-fun b!229135 () Bool)

(declare-fun e!148660 () Bool)

(declare-fun tp_is_empty!6013 () Bool)

(assert (=> b!229135 (= e!148660 tp_is_empty!6013)))

(declare-fun b!229136 () Bool)

(assert (=> b!229136 (= e!148658 e!148655)))

(declare-fun res!112774 () Bool)

(assert (=> b!229136 (=> (not res!112774) (not e!148655))))

(assert (=> b!229136 (= res!112774 (inRange!0 index!297 (mask!10150 thiss!1504)))))

(declare-fun lt!115256 () Unit!6982)

(assert (=> b!229136 (= lt!115256 e!148653)))

(declare-fun c!38003 () Bool)

(declare-datatypes ((tuple2!4502 0))(
  ( (tuple2!4503 (_1!2262 (_ BitVec 64)) (_2!2262 V!7665)) )
))
(declare-datatypes ((List!3426 0))(
  ( (Nil!3423) (Cons!3422 (h!4070 tuple2!4502) (t!8385 List!3426)) )
))
(declare-datatypes ((ListLongMap!3415 0))(
  ( (ListLongMap!3416 (toList!1723 List!3426)) )
))
(declare-fun contains!1597 (ListLongMap!3415 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1251 (array!11271 array!11269 (_ BitVec 32) (_ BitVec 32) V!7665 V!7665 (_ BitVec 32) Int) ListLongMap!3415)

(assert (=> b!229136 (= c!38003 (contains!1597 (getCurrentListMap!1251 (_keys!6326 thiss!1504) (_values!4255 thiss!1504) (mask!10150 thiss!1504) (extraKeys!4009 thiss!1504) (zeroValue!4113 thiss!1504) (minValue!4113 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4272 thiss!1504)) key!932))))

(declare-fun b!229137 () Bool)

(assert (=> b!229137 (= e!148652 true)))

(declare-fun lt!115257 () Bool)

(assert (=> b!229137 (= lt!115257 (arrayNoDuplicates!0 (_keys!6326 thiss!1504) #b00000000000000000000000000000000 Nil!3422))))

(declare-fun e!148664 () Bool)

(declare-fun array_inv!3537 (array!11271) Bool)

(declare-fun array_inv!3538 (array!11269) Bool)

(assert (=> b!229138 (= e!148661 (and tp!21595 tp_is_empty!6013 (array_inv!3537 (_keys!6326 thiss!1504)) (array_inv!3538 (_values!4255 thiss!1504)) e!148664))))

(declare-fun b!229139 () Bool)

(declare-fun mapRes!10189 () Bool)

(assert (=> b!229139 (= e!148664 (and e!148660 mapRes!10189))))

(declare-fun condMapEmpty!10189 () Bool)

(declare-fun mapDefault!10189 () ValueCell!2663)

