; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!22558 () Bool)

(assert start!22558)

(declare-fun b!235840 () Bool)

(declare-fun b_free!6343 () Bool)

(declare-fun b_next!6343 () Bool)

(assert (=> b!235840 (= b_free!6343 (not b_next!6343))))

(declare-fun tp!22202 () Bool)

(declare-fun b_and!13275 () Bool)

(assert (=> b!235840 (= tp!22202 b_and!13275)))

(declare-fun res!115667 () Bool)

(declare-fun e!153149 () Bool)

(assert (=> start!22558 (=> (not res!115667) (not e!153149))))

(declare-datatypes ((V!7921 0))(
  ( (V!7922 (val!3147 Int)) )
))
(declare-datatypes ((ValueCell!2759 0))(
  ( (ValueCellFull!2759 (v!5176 V!7921)) (EmptyCell!2759) )
))
(declare-datatypes ((array!11671 0))(
  ( (array!11672 (arr!5546 (Array (_ BitVec 32) ValueCell!2759)) (size!5883 (_ BitVec 32))) )
))
(declare-datatypes ((array!11673 0))(
  ( (array!11674 (arr!5547 (Array (_ BitVec 32) (_ BitVec 64))) (size!5884 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3418 0))(
  ( (LongMapFixedSize!3419 (defaultEntry!4381 Int) (mask!10360 (_ BitVec 32)) (extraKeys!4118 (_ BitVec 32)) (zeroValue!4222 V!7921) (minValue!4222 V!7921) (_size!1758 (_ BitVec 32)) (_keys!6459 array!11673) (_values!4364 array!11671) (_vacant!1758 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3418)

(declare-fun valid!1351 (LongMapFixedSize!3418) Bool)

(assert (=> start!22558 (= res!115667 (valid!1351 thiss!1504))))

(assert (=> start!22558 e!153149))

(declare-fun e!153152 () Bool)

(assert (=> start!22558 e!153152))

(assert (=> start!22558 true))

(declare-fun b!235835 () Bool)

(declare-fun e!153147 () Bool)

(assert (=> b!235835 (= e!153149 e!153147)))

(declare-fun res!115664 () Bool)

(assert (=> b!235835 (=> (not res!115664) (not e!153147))))

(declare-datatypes ((SeekEntryResult!994 0))(
  ( (MissingZero!994 (index!6146 (_ BitVec 32))) (Found!994 (index!6147 (_ BitVec 32))) (Intermediate!994 (undefined!1806 Bool) (index!6148 (_ BitVec 32)) (x!23824 (_ BitVec 32))) (Undefined!994) (MissingVacant!994 (index!6149 (_ BitVec 32))) )
))
(declare-fun lt!119260 () SeekEntryResult!994)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!235835 (= res!115664 (or (= lt!119260 (MissingZero!994 index!297)) (= lt!119260 (MissingVacant!994 index!297))))))

(declare-fun key!932 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11673 (_ BitVec 32)) SeekEntryResult!994)

(assert (=> b!235835 (= lt!119260 (seekEntryOrOpen!0 key!932 (_keys!6459 thiss!1504) (mask!10360 thiss!1504)))))

(declare-fun b!235836 () Bool)

(assert (=> b!235836 (= e!153147 (not false))))

(declare-fun e!153151 () Bool)

(assert (=> b!235836 e!153151))

(declare-fun res!115663 () Bool)

(assert (=> b!235836 (=> (not res!115663) (not e!153151))))

(assert (=> b!235836 (= res!115663 (is-Found!994 lt!119260))))

(declare-datatypes ((Unit!7262 0))(
  ( (Unit!7263) )
))
(declare-fun lt!119259 () Unit!7262)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!315 (array!11673 array!11671 (_ BitVec 32) (_ BitVec 32) V!7921 V!7921 (_ BitVec 64) Int) Unit!7262)

(assert (=> b!235836 (= lt!119259 (lemmaInListMapThenSeekEntryOrOpenFindsIt!315 (_keys!6459 thiss!1504) (_values!4364 thiss!1504) (mask!10360 thiss!1504) (extraKeys!4118 thiss!1504) (zeroValue!4222 thiss!1504) (minValue!4222 thiss!1504) key!932 (defaultEntry!4381 thiss!1504)))))

(declare-fun mapNonEmpty!10508 () Bool)

(declare-fun mapRes!10508 () Bool)

(declare-fun tp!22201 () Bool)

(declare-fun e!153148 () Bool)

(assert (=> mapNonEmpty!10508 (= mapRes!10508 (and tp!22201 e!153148))))

(declare-fun mapRest!10508 () (Array (_ BitVec 32) ValueCell!2759))

(declare-fun mapValue!10508 () ValueCell!2759)

(declare-fun mapKey!10508 () (_ BitVec 32))

(assert (=> mapNonEmpty!10508 (= (arr!5546 (_values!4364 thiss!1504)) (store mapRest!10508 mapKey!10508 mapValue!10508))))

(declare-fun mapIsEmpty!10508 () Bool)

(assert (=> mapIsEmpty!10508 mapRes!10508))

(declare-fun b!235837 () Bool)

(declare-fun e!153154 () Bool)

(declare-fun e!153153 () Bool)

(assert (=> b!235837 (= e!153154 (and e!153153 mapRes!10508))))

(declare-fun condMapEmpty!10508 () Bool)

(declare-fun mapDefault!10508 () ValueCell!2759)

