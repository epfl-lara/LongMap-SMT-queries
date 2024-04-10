; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!23178 () Bool)

(assert start!23178)

(declare-fun b!243105 () Bool)

(declare-fun b_free!6517 () Bool)

(declare-fun b_next!6517 () Bool)

(assert (=> b!243105 (= b_free!6517 (not b_next!6517))))

(declare-fun tp!22771 () Bool)

(declare-fun b_and!13497 () Bool)

(assert (=> b!243105 (= tp!22771 b_and!13497)))

(declare-fun b!243083 () Bool)

(declare-fun res!119132 () Bool)

(declare-fun e!157756 () Bool)

(assert (=> b!243083 (=> (not res!119132) (not e!157756))))

(declare-datatypes ((V!8153 0))(
  ( (V!8154 (val!3234 Int)) )
))
(declare-datatypes ((ValueCell!2846 0))(
  ( (ValueCellFull!2846 (v!5279 V!8153)) (EmptyCell!2846) )
))
(declare-datatypes ((array!12047 0))(
  ( (array!12048 (arr!5720 (Array (_ BitVec 32) ValueCell!2846)) (size!6062 (_ BitVec 32))) )
))
(declare-datatypes ((array!12049 0))(
  ( (array!12050 (arr!5721 (Array (_ BitVec 32) (_ BitVec 64))) (size!6063 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3592 0))(
  ( (LongMapFixedSize!3593 (defaultEntry!4505 Int) (mask!10594 (_ BitVec 32)) (extraKeys!4242 (_ BitVec 32)) (zeroValue!4346 V!8153) (minValue!4346 V!8153) (_size!1845 (_ BitVec 32)) (_keys!6615 array!12049) (_values!4488 array!12047) (_vacant!1845 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3592)

(declare-datatypes ((SeekEntryResult!1069 0))(
  ( (MissingZero!1069 (index!6446 (_ BitVec 32))) (Found!1069 (index!6447 (_ BitVec 32))) (Intermediate!1069 (undefined!1881 Bool) (index!6448 (_ BitVec 32)) (x!24311 (_ BitVec 32))) (Undefined!1069) (MissingVacant!1069 (index!6449 (_ BitVec 32))) )
))
(declare-fun lt!122052 () SeekEntryResult!1069)

(assert (=> b!243083 (= res!119132 (= (select (arr!5721 (_keys!6615 thiss!1504)) (index!6446 lt!122052)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!243084 () Bool)

(declare-fun e!157755 () Bool)

(declare-fun e!157771 () Bool)

(assert (=> b!243084 (= e!157755 e!157771)))

(declare-fun res!119131 () Bool)

(assert (=> b!243084 (=> (not res!119131) (not e!157771))))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!243084 (= res!119131 (or (= lt!122052 (MissingZero!1069 index!297)) (= lt!122052 (MissingVacant!1069 index!297))))))

(declare-fun key!932 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12049 (_ BitVec 32)) SeekEntryResult!1069)

(assert (=> b!243084 (= lt!122052 (seekEntryOrOpen!0 key!932 (_keys!6615 thiss!1504) (mask!10594 thiss!1504)))))

(declare-fun b!243085 () Bool)

(declare-fun res!119134 () Bool)

(declare-fun e!157754 () Bool)

(assert (=> b!243085 (=> (not res!119134) (not e!157754))))

(declare-datatypes ((List!3642 0))(
  ( (Nil!3639) (Cons!3638 (h!4295 (_ BitVec 64)) (t!8647 List!3642)) )
))
(declare-fun contains!1750 (List!3642 (_ BitVec 64)) Bool)

(assert (=> b!243085 (= res!119134 (not (contains!1750 Nil!3639 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapNonEmpty!10816 () Bool)

(declare-fun mapRes!10816 () Bool)

(declare-fun tp!22770 () Bool)

(declare-fun e!157765 () Bool)

(assert (=> mapNonEmpty!10816 (= mapRes!10816 (and tp!22770 e!157765))))

(declare-fun mapKey!10816 () (_ BitVec 32))

(declare-fun mapRest!10816 () (Array (_ BitVec 32) ValueCell!2846))

(declare-fun mapValue!10816 () ValueCell!2846)

(assert (=> mapNonEmpty!10816 (= (arr!5720 (_values!4488 thiss!1504)) (store mapRest!10816 mapKey!10816 mapValue!10816))))

(declare-fun b!243086 () Bool)

(declare-fun e!157760 () Bool)

(declare-fun tp_is_empty!6379 () Bool)

(assert (=> b!243086 (= e!157760 tp_is_empty!6379)))

(declare-fun b!243087 () Bool)

(declare-fun res!119125 () Bool)

(assert (=> b!243087 (=> (not res!119125) (not e!157754))))

(assert (=> b!243087 (= res!119125 (not (contains!1750 Nil!3639 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!243088 () Bool)

(assert (=> b!243088 (= e!157765 tp_is_empty!6379)))

(declare-fun b!243089 () Bool)

(declare-fun e!157761 () Bool)

(declare-fun call!22665 () Bool)

(assert (=> b!243089 (= e!157761 (not call!22665))))

(declare-fun b!243090 () Bool)

(declare-datatypes ((Unit!7499 0))(
  ( (Unit!7500) )
))
(declare-fun e!157768 () Unit!7499)

(declare-fun Unit!7501 () Unit!7499)

(assert (=> b!243090 (= e!157768 Unit!7501)))

(declare-fun lt!122054 () Unit!7499)

(declare-fun lemmaArrayContainsKeyThenInListMap!163 (array!12049 array!12047 (_ BitVec 32) (_ BitVec 32) V!8153 V!8153 (_ BitVec 64) (_ BitVec 32) Int) Unit!7499)

(assert (=> b!243090 (= lt!122054 (lemmaArrayContainsKeyThenInListMap!163 (_keys!6615 thiss!1504) (_values!4488 thiss!1504) (mask!10594 thiss!1504) (extraKeys!4242 thiss!1504) (zeroValue!4346 thiss!1504) (minValue!4346 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4505 thiss!1504)))))

(assert (=> b!243090 false))

(declare-fun b!243091 () Bool)

(declare-fun arrayNoDuplicates!0 (array!12049 (_ BitVec 32) List!3642) Bool)

(assert (=> b!243091 (= e!157754 (not (arrayNoDuplicates!0 (_keys!6615 thiss!1504) #b00000000000000000000000000000000 Nil!3639)))))

(declare-fun b!243092 () Bool)

(declare-fun e!157764 () Bool)

(assert (=> b!243092 (= e!157764 e!157754)))

(declare-fun res!119139 () Bool)

(assert (=> b!243092 (=> (not res!119139) (not e!157754))))

(assert (=> b!243092 (= res!119139 (and (bvslt (size!6063 (_keys!6615 thiss!1504)) #b01111111111111111111111111111111) (bvslt #b00000000000000000000000000000000 (size!6063 (_keys!6615 thiss!1504)))))))

(declare-fun lt!122056 () Unit!7499)

(assert (=> b!243092 (= lt!122056 e!157768)))

(declare-fun c!40578 () Bool)

(declare-fun arrayContainsKey!0 (array!12049 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!243092 (= c!40578 (arrayContainsKey!0 (_keys!6615 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!243093 () Bool)

(declare-fun e!157762 () Bool)

(assert (=> b!243093 (= e!157762 e!157761)))

(declare-fun res!119128 () Bool)

(declare-fun call!22664 () Bool)

(assert (=> b!243093 (= res!119128 call!22664)))

(assert (=> b!243093 (=> (not res!119128) (not e!157761))))

(declare-fun b!243094 () Bool)

(declare-fun res!119137 () Bool)

(assert (=> b!243094 (= res!119137 (= (select (arr!5721 (_keys!6615 thiss!1504)) (index!6449 lt!122052)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!243094 (=> (not res!119137) (not e!157761))))

(declare-fun b!243095 () Bool)

(declare-fun e!157759 () Unit!7499)

(declare-fun Unit!7502 () Unit!7499)

(assert (=> b!243095 (= e!157759 Unit!7502)))

(declare-fun lt!122055 () Unit!7499)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!358 (array!12049 array!12047 (_ BitVec 32) (_ BitVec 32) V!8153 V!8153 (_ BitVec 64) Int) Unit!7499)

(assert (=> b!243095 (= lt!122055 (lemmaInListMapThenSeekEntryOrOpenFindsIt!358 (_keys!6615 thiss!1504) (_values!4488 thiss!1504) (mask!10594 thiss!1504) (extraKeys!4242 thiss!1504) (zeroValue!4346 thiss!1504) (minValue!4346 thiss!1504) key!932 (defaultEntry!4505 thiss!1504)))))

(assert (=> b!243095 false))

(declare-fun b!243096 () Bool)

(declare-fun e!157757 () Bool)

(assert (=> b!243096 (= e!157757 (and e!157760 mapRes!10816))))

(declare-fun condMapEmpty!10816 () Bool)

(declare-fun mapDefault!10816 () ValueCell!2846)

