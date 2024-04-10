; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!22172 () Bool)

(assert start!22172)

(declare-fun b!231840 () Bool)

(declare-fun b_free!6239 () Bool)

(declare-fun b_next!6239 () Bool)

(assert (=> b!231840 (= b_free!6239 (not b_next!6239))))

(declare-fun tp!21859 () Bool)

(declare-fun b_and!13137 () Bool)

(assert (=> b!231840 (= tp!21859 b_and!13137)))

(declare-fun tp_is_empty!6101 () Bool)

(declare-datatypes ((V!7781 0))(
  ( (V!7782 (val!3095 Int)) )
))
(declare-datatypes ((ValueCell!2707 0))(
  ( (ValueCellFull!2707 (v!5115 V!7781)) (EmptyCell!2707) )
))
(declare-datatypes ((array!11445 0))(
  ( (array!11446 (arr!5442 (Array (_ BitVec 32) ValueCell!2707)) (size!5775 (_ BitVec 32))) )
))
(declare-datatypes ((array!11447 0))(
  ( (array!11448 (arr!5443 (Array (_ BitVec 32) (_ BitVec 64))) (size!5776 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3314 0))(
  ( (LongMapFixedSize!3315 (defaultEntry!4316 Int) (mask!10222 (_ BitVec 32)) (extraKeys!4053 (_ BitVec 32)) (zeroValue!4157 V!7781) (minValue!4157 V!7781) (_size!1706 (_ BitVec 32)) (_keys!6370 array!11447) (_values!4299 array!11445) (_vacant!1706 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3314)

(declare-fun e!150536 () Bool)

(declare-fun e!150528 () Bool)

(declare-fun array_inv!3587 (array!11447) Bool)

(declare-fun array_inv!3588 (array!11445) Bool)

(assert (=> b!231840 (= e!150536 (and tp!21859 tp_is_empty!6101 (array_inv!3587 (_keys!6370 thiss!1504)) (array_inv!3588 (_values!4299 thiss!1504)) e!150528))))

(declare-fun b!231841 () Bool)

(declare-datatypes ((Unit!7143 0))(
  ( (Unit!7144) )
))
(declare-fun e!150529 () Unit!7143)

(declare-fun Unit!7145 () Unit!7143)

(assert (=> b!231841 (= e!150529 Unit!7145)))

(declare-fun lt!116956 () Unit!7143)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaArrayContainsKeyThenInListMap!140 (array!11447 array!11445 (_ BitVec 32) (_ BitVec 32) V!7781 V!7781 (_ BitVec 64) (_ BitVec 32) Int) Unit!7143)

(assert (=> b!231841 (= lt!116956 (lemmaArrayContainsKeyThenInListMap!140 (_keys!6370 thiss!1504) (_values!4299 thiss!1504) (mask!10222 thiss!1504) (extraKeys!4053 thiss!1504) (zeroValue!4157 thiss!1504) (minValue!4157 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4316 thiss!1504)))))

(assert (=> b!231841 false))

(declare-fun b!231842 () Bool)

(declare-fun e!150534 () Unit!7143)

(declare-fun Unit!7146 () Unit!7143)

(assert (=> b!231842 (= e!150534 Unit!7146)))

(declare-fun lt!116947 () Unit!7143)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!304 (array!11447 array!11445 (_ BitVec 32) (_ BitVec 32) V!7781 V!7781 (_ BitVec 64) Int) Unit!7143)

(assert (=> b!231842 (= lt!116947 (lemmaInListMapThenSeekEntryOrOpenFindsIt!304 (_keys!6370 thiss!1504) (_values!4299 thiss!1504) (mask!10222 thiss!1504) (extraKeys!4053 thiss!1504) (zeroValue!4157 thiss!1504) (minValue!4157 thiss!1504) key!932 (defaultEntry!4316 thiss!1504)))))

(assert (=> b!231842 false))

(declare-fun b!231843 () Bool)

(declare-fun e!150525 () Bool)

(declare-fun call!21552 () Bool)

(assert (=> b!231843 (= e!150525 (not call!21552))))

(declare-fun res!113898 () Bool)

(declare-fun e!150523 () Bool)

(assert (=> start!22172 (=> (not res!113898) (not e!150523))))

(declare-fun valid!1314 (LongMapFixedSize!3314) Bool)

(assert (=> start!22172 (= res!113898 (valid!1314 thiss!1504))))

(assert (=> start!22172 e!150523))

(assert (=> start!22172 e!150536))

(assert (=> start!22172 true))

(assert (=> start!22172 tp_is_empty!6101))

(declare-fun b!231844 () Bool)

(declare-fun e!150526 () Bool)

(assert (=> b!231844 (= e!150526 e!150525)))

(declare-fun res!113905 () Bool)

(declare-fun call!21551 () Bool)

(assert (=> b!231844 (= res!113905 call!21551)))

(assert (=> b!231844 (=> (not res!113905) (not e!150525))))

(declare-fun mapNonEmpty!10321 () Bool)

(declare-fun mapRes!10321 () Bool)

(declare-fun tp!21858 () Bool)

(declare-fun e!150527 () Bool)

(assert (=> mapNonEmpty!10321 (= mapRes!10321 (and tp!21858 e!150527))))

(declare-fun mapRest!10321 () (Array (_ BitVec 32) ValueCell!2707))

(declare-fun mapKey!10321 () (_ BitVec 32))

(declare-fun mapValue!10321 () ValueCell!2707)

(assert (=> mapNonEmpty!10321 (= (arr!5442 (_values!4299 thiss!1504)) (store mapRest!10321 mapKey!10321 mapValue!10321))))

(declare-fun bm!21548 () Bool)

(declare-fun arrayContainsKey!0 (array!11447 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!21548 (= call!21552 (arrayContainsKey!0 (_keys!6370 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!231845 () Bool)

(declare-fun e!150530 () Bool)

(assert (=> b!231845 (= e!150528 (and e!150530 mapRes!10321))))

(declare-fun condMapEmpty!10321 () Bool)

(declare-fun mapDefault!10321 () ValueCell!2707)

