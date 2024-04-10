; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!22154 () Bool)

(assert start!22154)

(declare-fun b!231307 () Bool)

(declare-fun b_free!6221 () Bool)

(declare-fun b_next!6221 () Bool)

(assert (=> b!231307 (= b_free!6221 (not b_next!6221))))

(declare-fun tp!21804 () Bool)

(declare-fun b_and!13119 () Bool)

(assert (=> b!231307 (= tp!21804 b_and!13119)))

(declare-fun b!231300 () Bool)

(declare-fun res!113683 () Bool)

(declare-fun e!150149 () Bool)

(assert (=> b!231300 (=> (not res!113683) (not e!150149))))

(declare-datatypes ((V!7757 0))(
  ( (V!7758 (val!3086 Int)) )
))
(declare-datatypes ((ValueCell!2698 0))(
  ( (ValueCellFull!2698 (v!5106 V!7757)) (EmptyCell!2698) )
))
(declare-datatypes ((array!11409 0))(
  ( (array!11410 (arr!5424 (Array (_ BitVec 32) ValueCell!2698)) (size!5757 (_ BitVec 32))) )
))
(declare-datatypes ((array!11411 0))(
  ( (array!11412 (arr!5425 (Array (_ BitVec 32) (_ BitVec 64))) (size!5758 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3296 0))(
  ( (LongMapFixedSize!3297 (defaultEntry!4307 Int) (mask!10207 (_ BitVec 32)) (extraKeys!4044 (_ BitVec 32)) (zeroValue!4148 V!7757) (minValue!4148 V!7757) (_size!1697 (_ BitVec 32)) (_keys!6361 array!11411) (_values!4290 array!11409) (_vacant!1697 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3296)

(declare-datatypes ((SeekEntryResult!950 0))(
  ( (MissingZero!950 (index!5970 (_ BitVec 32))) (Found!950 (index!5971 (_ BitVec 32))) (Intermediate!950 (undefined!1762 Bool) (index!5972 (_ BitVec 32)) (x!23490 (_ BitVec 32))) (Undefined!950) (MissingVacant!950 (index!5973 (_ BitVec 32))) )
))
(declare-fun lt!116579 () SeekEntryResult!950)

(assert (=> b!231300 (= res!113683 (= (select (arr!5425 (_keys!6361 thiss!1504)) (index!5970 lt!116579)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapIsEmpty!10294 () Bool)

(declare-fun mapRes!10294 () Bool)

(assert (=> mapIsEmpty!10294 mapRes!10294))

(declare-fun b!231301 () Bool)

(declare-datatypes ((Unit!7113 0))(
  ( (Unit!7114) )
))
(declare-fun e!150156 () Unit!7113)

(declare-fun Unit!7115 () Unit!7113)

(assert (=> b!231301 (= e!150156 Unit!7115)))

(declare-fun lt!116578 () Unit!7113)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaArrayContainsKeyThenInListMap!134 (array!11411 array!11409 (_ BitVec 32) (_ BitVec 32) V!7757 V!7757 (_ BitVec 64) (_ BitVec 32) Int) Unit!7113)

(assert (=> b!231301 (= lt!116578 (lemmaArrayContainsKeyThenInListMap!134 (_keys!6361 thiss!1504) (_values!4290 thiss!1504) (mask!10207 thiss!1504) (extraKeys!4044 thiss!1504) (zeroValue!4148 thiss!1504) (minValue!4148 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4307 thiss!1504)))))

(assert (=> b!231301 false))

(declare-fun b!231302 () Bool)

(declare-fun c!38424 () Bool)

(assert (=> b!231302 (= c!38424 (is-MissingVacant!950 lt!116579))))

(declare-fun e!150158 () Bool)

(declare-fun e!150152 () Bool)

(assert (=> b!231302 (= e!150158 e!150152)))

(declare-fun b!231304 () Bool)

(declare-fun res!113689 () Bool)

(assert (=> b!231304 (=> (not res!113689) (not e!150149))))

(declare-fun call!21498 () Bool)

(assert (=> b!231304 (= res!113689 call!21498)))

(assert (=> b!231304 (= e!150158 e!150149)))

(declare-fun b!231305 () Bool)

(declare-fun res!113684 () Bool)

(declare-fun e!150153 () Bool)

(assert (=> b!231305 (=> (not res!113684) (not e!150153))))

(assert (=> b!231305 (= res!113684 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!231306 () Bool)

(declare-fun e!150150 () Bool)

(declare-fun call!21497 () Bool)

(assert (=> b!231306 (= e!150150 (not call!21497))))

(declare-fun e!150157 () Bool)

(declare-fun e!150148 () Bool)

(declare-fun tp_is_empty!6083 () Bool)

(declare-fun array_inv!3579 (array!11411) Bool)

(declare-fun array_inv!3580 (array!11409) Bool)

(assert (=> b!231307 (= e!150148 (and tp!21804 tp_is_empty!6083 (array_inv!3579 (_keys!6361 thiss!1504)) (array_inv!3580 (_values!4290 thiss!1504)) e!150157))))

(declare-fun bm!21494 () Bool)

(declare-fun c!38422 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!21494 (= call!21498 (inRange!0 (ite c!38422 (index!5970 lt!116579) (index!5973 lt!116579)) (mask!10207 thiss!1504)))))

(declare-fun mapNonEmpty!10294 () Bool)

(declare-fun tp!21805 () Bool)

(declare-fun e!150151 () Bool)

(assert (=> mapNonEmpty!10294 (= mapRes!10294 (and tp!21805 e!150151))))

(declare-fun mapValue!10294 () ValueCell!2698)

(declare-fun mapRest!10294 () (Array (_ BitVec 32) ValueCell!2698))

(declare-fun mapKey!10294 () (_ BitVec 32))

(assert (=> mapNonEmpty!10294 (= (arr!5424 (_values!4290 thiss!1504)) (store mapRest!10294 mapKey!10294 mapValue!10294))))

(declare-fun b!231308 () Bool)

(declare-fun e!150155 () Unit!7113)

(declare-fun lt!116576 () Unit!7113)

(assert (=> b!231308 (= e!150155 lt!116576)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!317 (array!11411 array!11409 (_ BitVec 32) (_ BitVec 32) V!7757 V!7757 (_ BitVec 64) Int) Unit!7113)

(assert (=> b!231308 (= lt!116576 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!317 (_keys!6361 thiss!1504) (_values!4290 thiss!1504) (mask!10207 thiss!1504) (extraKeys!4044 thiss!1504) (zeroValue!4148 thiss!1504) (minValue!4148 thiss!1504) key!932 (defaultEntry!4307 thiss!1504)))))

(assert (=> b!231308 (= c!38422 (is-MissingZero!950 lt!116579))))

(assert (=> b!231308 e!150158))

(declare-fun b!231309 () Bool)

(declare-fun e!150145 () Bool)

(declare-fun e!150147 () Bool)

(assert (=> b!231309 (= e!150145 e!150147)))

(declare-fun res!113687 () Bool)

(assert (=> b!231309 (=> (not res!113687) (not e!150147))))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!231309 (= res!113687 (inRange!0 index!297 (mask!10207 thiss!1504)))))

(declare-fun lt!116575 () Unit!7113)

(assert (=> b!231309 (= lt!116575 e!150155)))

(declare-fun c!38421 () Bool)

(declare-datatypes ((tuple2!4554 0))(
  ( (tuple2!4555 (_1!2288 (_ BitVec 64)) (_2!2288 V!7757)) )
))
(declare-datatypes ((List!3474 0))(
  ( (Nil!3471) (Cons!3470 (h!4118 tuple2!4554) (t!8433 List!3474)) )
))
(declare-datatypes ((ListLongMap!3467 0))(
  ( (ListLongMap!3468 (toList!1749 List!3474)) )
))
(declare-fun lt!116569 () ListLongMap!3467)

(declare-fun contains!1620 (ListLongMap!3467 (_ BitVec 64)) Bool)

(assert (=> b!231309 (= c!38421 (contains!1620 lt!116569 key!932))))

(declare-fun getCurrentListMap!1277 (array!11411 array!11409 (_ BitVec 32) (_ BitVec 32) V!7757 V!7757 (_ BitVec 32) Int) ListLongMap!3467)

(assert (=> b!231309 (= lt!116569 (getCurrentListMap!1277 (_keys!6361 thiss!1504) (_values!4290 thiss!1504) (mask!10207 thiss!1504) (extraKeys!4044 thiss!1504) (zeroValue!4148 thiss!1504) (minValue!4148 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4307 thiss!1504)))))

(declare-fun bm!21495 () Bool)

(declare-fun arrayContainsKey!0 (array!11411 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!21495 (= call!21497 (arrayContainsKey!0 (_keys!6361 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!231310 () Bool)

(declare-fun e!150154 () Bool)

(assert (=> b!231310 (= e!150154 tp_is_empty!6083)))

(declare-fun b!231311 () Bool)

(assert (=> b!231311 (= e!150157 (and e!150154 mapRes!10294))))

(declare-fun condMapEmpty!10294 () Bool)

(declare-fun mapDefault!10294 () ValueCell!2698)

