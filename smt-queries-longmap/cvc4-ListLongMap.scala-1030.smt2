; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!21866 () Bool)

(assert start!21866)

(declare-fun b!220799 () Bool)

(declare-fun b_free!5933 () Bool)

(declare-fun b_next!5933 () Bool)

(assert (=> b!220799 (= b_free!5933 (not b_next!5933))))

(declare-fun tp!20941 () Bool)

(declare-fun b_and!12831 () Bool)

(assert (=> b!220799 (= tp!20941 b_and!12831)))

(declare-fun b!220786 () Bool)

(declare-fun c!36730 () Bool)

(declare-datatypes ((SeekEntryResult!816 0))(
  ( (MissingZero!816 (index!5434 (_ BitVec 32))) (Found!816 (index!5435 (_ BitVec 32))) (Intermediate!816 (undefined!1628 Bool) (index!5436 (_ BitVec 32)) (x!22972 (_ BitVec 32))) (Undefined!816) (MissingVacant!816 (index!5437 (_ BitVec 32))) )
))
(declare-fun lt!112259 () SeekEntryResult!816)

(assert (=> b!220786 (= c!36730 (is-MissingVacant!816 lt!112259))))

(declare-fun e!143541 () Bool)

(declare-fun e!143542 () Bool)

(assert (=> b!220786 (= e!143541 e!143542)))

(declare-fun c!36732 () Bool)

(declare-fun call!20634 () Bool)

(declare-fun bm!20630 () Bool)

(declare-datatypes ((V!7373 0))(
  ( (V!7374 (val!2942 Int)) )
))
(declare-datatypes ((ValueCell!2554 0))(
  ( (ValueCellFull!2554 (v!4962 V!7373)) (EmptyCell!2554) )
))
(declare-datatypes ((array!10833 0))(
  ( (array!10834 (arr!5136 (Array (_ BitVec 32) ValueCell!2554)) (size!5469 (_ BitVec 32))) )
))
(declare-datatypes ((array!10835 0))(
  ( (array!10836 (arr!5137 (Array (_ BitVec 32) (_ BitVec 64))) (size!5470 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3008 0))(
  ( (LongMapFixedSize!3009 (defaultEntry!4163 Int) (mask!9967 (_ BitVec 32)) (extraKeys!3900 (_ BitVec 32)) (zeroValue!4004 V!7373) (minValue!4004 V!7373) (_size!1553 (_ BitVec 32)) (_keys!6217 array!10835) (_values!4146 array!10833) (_vacant!1553 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3008)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!20630 (= call!20634 (inRange!0 (ite c!36732 (index!5434 lt!112259) (index!5437 lt!112259)) (mask!9967 thiss!1504)))))

(declare-fun mapIsEmpty!9862 () Bool)

(declare-fun mapRes!9862 () Bool)

(assert (=> mapIsEmpty!9862 mapRes!9862))

(declare-fun b!220787 () Bool)

(declare-datatypes ((Unit!6588 0))(
  ( (Unit!6589) )
))
(declare-fun e!143537 () Unit!6588)

(declare-fun lt!112258 () Unit!6588)

(assert (=> b!220787 (= e!143537 lt!112258)))

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!219 (array!10835 array!10833 (_ BitVec 32) (_ BitVec 32) V!7373 V!7373 (_ BitVec 64) Int) Unit!6588)

(assert (=> b!220787 (= lt!112258 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!219 (_keys!6217 thiss!1504) (_values!4146 thiss!1504) (mask!9967 thiss!1504) (extraKeys!3900 thiss!1504) (zeroValue!4004 thiss!1504) (minValue!4004 thiss!1504) key!932 (defaultEntry!4163 thiss!1504)))))

(assert (=> b!220787 (= c!36732 (is-MissingZero!816 lt!112259))))

(assert (=> b!220787 e!143541))

(declare-fun b!220788 () Bool)

(declare-fun e!143532 () Bool)

(assert (=> b!220788 (= e!143532 false)))

(declare-fun lt!112261 () Bool)

(declare-datatypes ((List!3267 0))(
  ( (Nil!3264) (Cons!3263 (h!3911 (_ BitVec 64)) (t!8226 List!3267)) )
))
(declare-fun arrayNoDuplicates!0 (array!10835 (_ BitVec 32) List!3267) Bool)

(assert (=> b!220788 (= lt!112261 (arrayNoDuplicates!0 (_keys!6217 thiss!1504) #b00000000000000000000000000000000 Nil!3264))))

(declare-fun b!220789 () Bool)

(declare-fun e!143535 () Bool)

(declare-fun tp_is_empty!5795 () Bool)

(assert (=> b!220789 (= e!143535 tp_is_empty!5795)))

(declare-fun b!220790 () Bool)

(declare-fun res!108281 () Bool)

(declare-fun e!143533 () Bool)

(assert (=> b!220790 (=> (not res!108281) (not e!143533))))

(assert (=> b!220790 (= res!108281 (= (select (arr!5137 (_keys!6217 thiss!1504)) (index!5434 lt!112259)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!108280 () Bool)

(declare-fun e!143540 () Bool)

(assert (=> start!21866 (=> (not res!108280) (not e!143540))))

(declare-fun valid!1213 (LongMapFixedSize!3008) Bool)

(assert (=> start!21866 (= res!108280 (valid!1213 thiss!1504))))

(assert (=> start!21866 e!143540))

(declare-fun e!143543 () Bool)

(assert (=> start!21866 e!143543))

(assert (=> start!21866 true))

(declare-fun b!220791 () Bool)

(declare-fun res!108282 () Bool)

(assert (=> b!220791 (= res!108282 (= (select (arr!5137 (_keys!6217 thiss!1504)) (index!5437 lt!112259)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!143534 () Bool)

(assert (=> b!220791 (=> (not res!108282) (not e!143534))))

(declare-fun b!220792 () Bool)

(declare-fun res!108279 () Bool)

(assert (=> b!220792 (=> (not res!108279) (not e!143532))))

(assert (=> b!220792 (= res!108279 (and (= (size!5469 (_values!4146 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!9967 thiss!1504))) (= (size!5470 (_keys!6217 thiss!1504)) (size!5469 (_values!4146 thiss!1504))) (bvsge (mask!9967 thiss!1504) #b00000000000000000000000000000000) (bvsge (extraKeys!3900 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!3900 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun b!220793 () Bool)

(declare-fun e!143539 () Bool)

(assert (=> b!220793 (= e!143539 e!143532)))

(declare-fun res!108286 () Bool)

(assert (=> b!220793 (=> (not res!108286) (not e!143532))))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!220793 (= res!108286 (inRange!0 index!297 (mask!9967 thiss!1504)))))

(declare-fun lt!112260 () Unit!6588)

(assert (=> b!220793 (= lt!112260 e!143537)))

(declare-fun c!36731 () Bool)

(declare-datatypes ((tuple2!4364 0))(
  ( (tuple2!4365 (_1!2193 (_ BitVec 64)) (_2!2193 V!7373)) )
))
(declare-datatypes ((List!3268 0))(
  ( (Nil!3265) (Cons!3264 (h!3912 tuple2!4364) (t!8227 List!3268)) )
))
(declare-datatypes ((ListLongMap!3277 0))(
  ( (ListLongMap!3278 (toList!1654 List!3268)) )
))
(declare-fun contains!1497 (ListLongMap!3277 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1182 (array!10835 array!10833 (_ BitVec 32) (_ BitVec 32) V!7373 V!7373 (_ BitVec 32) Int) ListLongMap!3277)

(assert (=> b!220793 (= c!36731 (contains!1497 (getCurrentListMap!1182 (_keys!6217 thiss!1504) (_values!4146 thiss!1504) (mask!9967 thiss!1504) (extraKeys!3900 thiss!1504) (zeroValue!4004 thiss!1504) (minValue!4004 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4163 thiss!1504)) key!932))))

(declare-fun b!220794 () Bool)

(declare-fun call!20633 () Bool)

(assert (=> b!220794 (= e!143534 (not call!20633))))

(declare-fun b!220795 () Bool)

(declare-fun Unit!6590 () Unit!6588)

(assert (=> b!220795 (= e!143537 Unit!6590)))

(declare-fun lt!112262 () Unit!6588)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!207 (array!10835 array!10833 (_ BitVec 32) (_ BitVec 32) V!7373 V!7373 (_ BitVec 64) Int) Unit!6588)

(assert (=> b!220795 (= lt!112262 (lemmaInListMapThenSeekEntryOrOpenFindsIt!207 (_keys!6217 thiss!1504) (_values!4146 thiss!1504) (mask!9967 thiss!1504) (extraKeys!3900 thiss!1504) (zeroValue!4004 thiss!1504) (minValue!4004 thiss!1504) key!932 (defaultEntry!4163 thiss!1504)))))

(assert (=> b!220795 false))

(declare-fun bm!20631 () Bool)

(declare-fun arrayContainsKey!0 (array!10835 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!20631 (= call!20633 (arrayContainsKey!0 (_keys!6217 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!220796 () Bool)

(declare-fun e!143536 () Bool)

(assert (=> b!220796 (= e!143536 (and e!143535 mapRes!9862))))

(declare-fun condMapEmpty!9862 () Bool)

(declare-fun mapDefault!9862 () ValueCell!2554)

