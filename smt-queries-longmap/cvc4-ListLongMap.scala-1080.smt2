; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!22166 () Bool)

(assert start!22166)

(declare-fun b!231676 () Bool)

(declare-fun b_free!6233 () Bool)

(declare-fun b_next!6233 () Bool)

(assert (=> b!231676 (= b_free!6233 (not b_next!6233))))

(declare-fun tp!21840 () Bool)

(declare-fun b_and!13131 () Bool)

(assert (=> b!231676 (= tp!21840 b_and!13131)))

(declare-fun b!231660 () Bool)

(declare-fun res!113827 () Bool)

(declare-fun e!150401 () Bool)

(assert (=> b!231660 (=> (not res!113827) (not e!150401))))

(declare-fun key!932 () (_ BitVec 64))

(assert (=> b!231660 (= res!113827 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!231661 () Bool)

(declare-fun e!150399 () Bool)

(declare-fun e!150410 () Bool)

(assert (=> b!231661 (= e!150399 e!150410)))

(declare-fun res!113826 () Bool)

(assert (=> b!231661 (=> (not res!113826) (not e!150410))))

(declare-fun index!297 () (_ BitVec 32))

(declare-datatypes ((V!7773 0))(
  ( (V!7774 (val!3092 Int)) )
))
(declare-datatypes ((ValueCell!2704 0))(
  ( (ValueCellFull!2704 (v!5112 V!7773)) (EmptyCell!2704) )
))
(declare-datatypes ((array!11433 0))(
  ( (array!11434 (arr!5436 (Array (_ BitVec 32) ValueCell!2704)) (size!5769 (_ BitVec 32))) )
))
(declare-datatypes ((array!11435 0))(
  ( (array!11436 (arr!5437 (Array (_ BitVec 32) (_ BitVec 64))) (size!5770 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3308 0))(
  ( (LongMapFixedSize!3309 (defaultEntry!4313 Int) (mask!10217 (_ BitVec 32)) (extraKeys!4050 (_ BitVec 32)) (zeroValue!4154 V!7773) (minValue!4154 V!7773) (_size!1703 (_ BitVec 32)) (_keys!6367 array!11435) (_values!4296 array!11433) (_vacant!1703 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3308)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!231661 (= res!113826 (inRange!0 index!297 (mask!10217 thiss!1504)))))

(declare-datatypes ((Unit!7131 0))(
  ( (Unit!7132) )
))
(declare-fun lt!116827 () Unit!7131)

(declare-fun e!150407 () Unit!7131)

(assert (=> b!231661 (= lt!116827 e!150407)))

(declare-fun c!38494 () Bool)

(declare-datatypes ((tuple2!4564 0))(
  ( (tuple2!4565 (_1!2293 (_ BitVec 64)) (_2!2293 V!7773)) )
))
(declare-datatypes ((List!3483 0))(
  ( (Nil!3480) (Cons!3479 (h!4127 tuple2!4564) (t!8442 List!3483)) )
))
(declare-datatypes ((ListLongMap!3477 0))(
  ( (ListLongMap!3478 (toList!1754 List!3483)) )
))
(declare-fun lt!116828 () ListLongMap!3477)

(declare-fun contains!1623 (ListLongMap!3477 (_ BitVec 64)) Bool)

(assert (=> b!231661 (= c!38494 (contains!1623 lt!116828 key!932))))

(declare-fun getCurrentListMap!1282 (array!11435 array!11433 (_ BitVec 32) (_ BitVec 32) V!7773 V!7773 (_ BitVec 32) Int) ListLongMap!3477)

(assert (=> b!231661 (= lt!116828 (getCurrentListMap!1282 (_keys!6367 thiss!1504) (_values!4296 thiss!1504) (mask!10217 thiss!1504) (extraKeys!4050 thiss!1504) (zeroValue!4154 thiss!1504) (minValue!4154 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4313 thiss!1504)))))

(declare-fun b!231662 () Bool)

(declare-fun Unit!7133 () Unit!7131)

(assert (=> b!231662 (= e!150407 Unit!7133)))

(declare-fun lt!116834 () Unit!7131)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!302 (array!11435 array!11433 (_ BitVec 32) (_ BitVec 32) V!7773 V!7773 (_ BitVec 64) Int) Unit!7131)

(assert (=> b!231662 (= lt!116834 (lemmaInListMapThenSeekEntryOrOpenFindsIt!302 (_keys!6367 thiss!1504) (_values!4296 thiss!1504) (mask!10217 thiss!1504) (extraKeys!4050 thiss!1504) (zeroValue!4154 thiss!1504) (minValue!4154 thiss!1504) key!932 (defaultEntry!4313 thiss!1504)))))

(assert (=> b!231662 false))

(declare-fun b!231663 () Bool)

(declare-fun e!150404 () Bool)

(declare-fun tp_is_empty!6095 () Bool)

(assert (=> b!231663 (= e!150404 tp_is_empty!6095)))

(declare-fun b!231664 () Bool)

(declare-fun e!150400 () Bool)

(declare-fun e!150403 () Bool)

(assert (=> b!231664 (= e!150400 e!150403)))

(declare-fun res!113831 () Bool)

(declare-fun call!21533 () Bool)

(assert (=> b!231664 (= res!113831 call!21533)))

(assert (=> b!231664 (=> (not res!113831) (not e!150403))))

(declare-fun b!231665 () Bool)

(declare-fun e!150406 () Unit!7131)

(declare-fun Unit!7134 () Unit!7131)

(assert (=> b!231665 (= e!150406 Unit!7134)))

(declare-fun lt!116825 () Unit!7131)

(declare-fun lemmaArrayContainsKeyThenInListMap!138 (array!11435 array!11433 (_ BitVec 32) (_ BitVec 32) V!7773 V!7773 (_ BitVec 64) (_ BitVec 32) Int) Unit!7131)

(assert (=> b!231665 (= lt!116825 (lemmaArrayContainsKeyThenInListMap!138 (_keys!6367 thiss!1504) (_values!4296 thiss!1504) (mask!10217 thiss!1504) (extraKeys!4050 thiss!1504) (zeroValue!4154 thiss!1504) (minValue!4154 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4313 thiss!1504)))))

(assert (=> b!231665 false))

(declare-fun bm!21530 () Bool)

(declare-fun call!21534 () Bool)

(declare-fun arrayContainsKey!0 (array!11435 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!21530 (= call!21534 (arrayContainsKey!0 (_keys!6367 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!231666 () Bool)

(declare-fun res!113828 () Bool)

(declare-fun e!150408 () Bool)

(assert (=> b!231666 (=> (not res!113828) (not e!150408))))

(assert (=> b!231666 (= res!113828 call!21533)))

(declare-fun e!150402 () Bool)

(assert (=> b!231666 (= e!150402 e!150408)))

(declare-fun b!231667 () Bool)

(declare-fun res!113830 () Bool)

(declare-datatypes ((SeekEntryResult!954 0))(
  ( (MissingZero!954 (index!5986 (_ BitVec 32))) (Found!954 (index!5987 (_ BitVec 32))) (Intermediate!954 (undefined!1766 Bool) (index!5988 (_ BitVec 32)) (x!23510 (_ BitVec 32))) (Undefined!954) (MissingVacant!954 (index!5989 (_ BitVec 32))) )
))
(declare-fun lt!116830 () SeekEntryResult!954)

(assert (=> b!231667 (= res!113830 (= (select (arr!5437 (_keys!6367 thiss!1504)) (index!5989 lt!116830)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!231667 (=> (not res!113830) (not e!150403))))

(declare-fun b!231668 () Bool)

(assert (=> b!231668 (= e!150408 (not call!21534))))

(declare-fun b!231669 () Bool)

(declare-fun e!150409 () Bool)

(declare-fun mapRes!10312 () Bool)

(assert (=> b!231669 (= e!150409 (and e!150404 mapRes!10312))))

(declare-fun condMapEmpty!10312 () Bool)

(declare-fun mapDefault!10312 () ValueCell!2704)

