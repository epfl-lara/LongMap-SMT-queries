; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!22136 () Bool)

(assert start!22136)

(declare-fun b!230763 () Bool)

(declare-fun b_free!6203 () Bool)

(declare-fun b_next!6203 () Bool)

(assert (=> b!230763 (= b_free!6203 (not b_next!6203))))

(declare-fun tp!21751 () Bool)

(declare-fun b_and!13101 () Bool)

(assert (=> b!230763 (= tp!21751 b_and!13101)))

(declare-fun b!230760 () Bool)

(declare-datatypes ((Unit!7072 0))(
  ( (Unit!7073) )
))
(declare-fun e!149768 () Unit!7072)

(declare-fun Unit!7074 () Unit!7072)

(assert (=> b!230760 (= e!149768 Unit!7074)))

(declare-fun b!230761 () Bool)

(declare-fun c!38314 () Bool)

(declare-datatypes ((SeekEntryResult!941 0))(
  ( (MissingZero!941 (index!5934 (_ BitVec 32))) (Found!941 (index!5935 (_ BitVec 32))) (Intermediate!941 (undefined!1753 Bool) (index!5936 (_ BitVec 32)) (x!23457 (_ BitVec 32))) (Undefined!941) (MissingVacant!941 (index!5937 (_ BitVec 32))) )
))
(declare-fun lt!116195 () SeekEntryResult!941)

(assert (=> b!230761 (= c!38314 (is-MissingVacant!941 lt!116195))))

(declare-fun e!149777 () Bool)

(declare-fun e!149776 () Bool)

(assert (=> b!230761 (= e!149777 e!149776)))

(declare-fun mapNonEmpty!10267 () Bool)

(declare-fun mapRes!10267 () Bool)

(declare-fun tp!21750 () Bool)

(declare-fun e!149774 () Bool)

(assert (=> mapNonEmpty!10267 (= mapRes!10267 (and tp!21750 e!149774))))

(declare-datatypes ((V!7733 0))(
  ( (V!7734 (val!3077 Int)) )
))
(declare-datatypes ((ValueCell!2689 0))(
  ( (ValueCellFull!2689 (v!5097 V!7733)) (EmptyCell!2689) )
))
(declare-fun mapRest!10267 () (Array (_ BitVec 32) ValueCell!2689))

(declare-fun mapKey!10267 () (_ BitVec 32))

(declare-datatypes ((array!11373 0))(
  ( (array!11374 (arr!5406 (Array (_ BitVec 32) ValueCell!2689)) (size!5739 (_ BitVec 32))) )
))
(declare-datatypes ((array!11375 0))(
  ( (array!11376 (arr!5407 (Array (_ BitVec 32) (_ BitVec 64))) (size!5740 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3278 0))(
  ( (LongMapFixedSize!3279 (defaultEntry!4298 Int) (mask!10192 (_ BitVec 32)) (extraKeys!4035 (_ BitVec 32)) (zeroValue!4139 V!7733) (minValue!4139 V!7733) (_size!1688 (_ BitVec 32)) (_keys!6352 array!11375) (_values!4281 array!11373) (_vacant!1688 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3278)

(declare-fun mapValue!10267 () ValueCell!2689)

(assert (=> mapNonEmpty!10267 (= (arr!5406 (_values!4281 thiss!1504)) (store mapRest!10267 mapKey!10267 mapValue!10267))))

(declare-fun b!230762 () Bool)

(declare-fun e!149778 () Bool)

(declare-fun tp_is_empty!6065 () Bool)

(assert (=> b!230762 (= e!149778 tp_is_empty!6065)))

(declare-fun e!149775 () Bool)

(declare-fun e!149771 () Bool)

(declare-fun array_inv!3565 (array!11375) Bool)

(declare-fun array_inv!3566 (array!11373) Bool)

(assert (=> b!230763 (= e!149771 (and tp!21751 tp_is_empty!6065 (array_inv!3565 (_keys!6352 thiss!1504)) (array_inv!3566 (_values!4281 thiss!1504)) e!149775))))

(declare-fun b!230764 () Bool)

(declare-fun e!149770 () Bool)

(declare-fun call!21443 () Bool)

(assert (=> b!230764 (= e!149770 (not call!21443))))

(declare-fun b!230765 () Bool)

(declare-fun e!149769 () Bool)

(assert (=> b!230765 (= e!149776 e!149769)))

(declare-fun res!113471 () Bool)

(declare-fun call!21444 () Bool)

(assert (=> b!230765 (= res!113471 call!21444)))

(assert (=> b!230765 (=> (not res!113471) (not e!149769))))

(declare-fun b!230766 () Bool)

(declare-fun Unit!7075 () Unit!7072)

(assert (=> b!230766 (= e!149768 Unit!7075)))

(declare-fun lt!116194 () Unit!7072)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaArrayContainsKeyThenInListMap!127 (array!11375 array!11373 (_ BitVec 32) (_ BitVec 32) V!7733 V!7733 (_ BitVec 64) (_ BitVec 32) Int) Unit!7072)

(assert (=> b!230766 (= lt!116194 (lemmaArrayContainsKeyThenInListMap!127 (_keys!6352 thiss!1504) (_values!4281 thiss!1504) (mask!10192 thiss!1504) (extraKeys!4035 thiss!1504) (zeroValue!4139 thiss!1504) (minValue!4139 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4298 thiss!1504)))))

(assert (=> b!230766 false))

(declare-fun b!230767 () Bool)

(declare-fun res!113472 () Bool)

(assert (=> b!230767 (=> (not res!113472) (not e!149770))))

(assert (=> b!230767 (= res!113472 call!21444)))

(assert (=> b!230767 (= e!149777 e!149770)))

(declare-fun b!230768 () Bool)

(declare-fun res!113466 () Bool)

(declare-fun e!149780 () Bool)

(assert (=> b!230768 (=> (not res!113466) (not e!149780))))

(assert (=> b!230768 (= res!113466 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!230769 () Bool)

(declare-fun e!149772 () Bool)

(assert (=> b!230769 (= e!149780 e!149772)))

(declare-fun res!113467 () Bool)

(assert (=> b!230769 (=> (not res!113467) (not e!149772))))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!230769 (= res!113467 (or (= lt!116195 (MissingZero!941 index!297)) (= lt!116195 (MissingVacant!941 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11375 (_ BitVec 32)) SeekEntryResult!941)

(assert (=> b!230769 (= lt!116195 (seekEntryOrOpen!0 key!932 (_keys!6352 thiss!1504) (mask!10192 thiss!1504)))))

(declare-fun b!230770 () Bool)

(assert (=> b!230770 (= e!149776 (is-Undefined!941 lt!116195))))

(declare-fun b!230771 () Bool)

(assert (=> b!230771 (= e!149775 (and e!149778 mapRes!10267))))

(declare-fun condMapEmpty!10267 () Bool)

(declare-fun mapDefault!10267 () ValueCell!2689)

