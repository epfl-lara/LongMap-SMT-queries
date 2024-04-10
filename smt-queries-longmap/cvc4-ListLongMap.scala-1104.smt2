; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!22720 () Bool)

(assert start!22720)

(declare-fun b!237120 () Bool)

(declare-fun b_free!6377 () Bool)

(declare-fun b_next!6377 () Bool)

(assert (=> b!237120 (= b_free!6377 (not b_next!6377))))

(declare-fun tp!22318 () Bool)

(declare-fun b_and!13325 () Bool)

(assert (=> b!237120 (= tp!22318 b_and!13325)))

(declare-fun e!154000 () Bool)

(declare-datatypes ((V!7965 0))(
  ( (V!7966 (val!3164 Int)) )
))
(declare-datatypes ((ValueCell!2776 0))(
  ( (ValueCellFull!2776 (v!5197 V!7965)) (EmptyCell!2776) )
))
(declare-datatypes ((array!11747 0))(
  ( (array!11748 (arr!5580 (Array (_ BitVec 32) ValueCell!2776)) (size!5919 (_ BitVec 32))) )
))
(declare-datatypes ((array!11749 0))(
  ( (array!11750 (arr!5581 (Array (_ BitVec 32) (_ BitVec 64))) (size!5920 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3452 0))(
  ( (LongMapFixedSize!3453 (defaultEntry!4404 Int) (mask!10409 (_ BitVec 32)) (extraKeys!4141 (_ BitVec 32)) (zeroValue!4245 V!7965) (minValue!4245 V!7965) (_size!1775 (_ BitVec 32)) (_keys!6492 array!11749) (_values!4387 array!11747) (_vacant!1775 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3452)

(declare-fun tp_is_empty!6239 () Bool)

(declare-fun e!153996 () Bool)

(declare-fun array_inv!3683 (array!11749) Bool)

(declare-fun array_inv!3684 (array!11747) Bool)

(assert (=> b!237120 (= e!154000 (and tp!22318 tp_is_empty!6239 (array_inv!3683 (_keys!6492 thiss!1504)) (array_inv!3684 (_values!4387 thiss!1504)) e!153996))))

(declare-fun b!237121 () Bool)

(declare-fun e!153997 () Bool)

(assert (=> b!237121 (= e!153997 tp_is_empty!6239)))

(declare-fun b!237122 () Bool)

(declare-fun e!153998 () Bool)

(declare-fun e!153995 () Bool)

(assert (=> b!237122 (= e!153998 e!153995)))

(declare-fun res!116239 () Bool)

(assert (=> b!237122 (=> (not res!116239) (not e!153995))))

(declare-datatypes ((SeekEntryResult!1008 0))(
  ( (MissingZero!1008 (index!6202 (_ BitVec 32))) (Found!1008 (index!6203 (_ BitVec 32))) (Intermediate!1008 (undefined!1820 Bool) (index!6204 (_ BitVec 32)) (x!23934 (_ BitVec 32))) (Undefined!1008) (MissingVacant!1008 (index!6205 (_ BitVec 32))) )
))
(declare-fun lt!119885 () SeekEntryResult!1008)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!237122 (= res!116239 (or (= lt!119885 (MissingZero!1008 index!297)) (= lt!119885 (MissingVacant!1008 index!297))))))

(declare-fun key!932 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11749 (_ BitVec 32)) SeekEntryResult!1008)

(assert (=> b!237122 (= lt!119885 (seekEntryOrOpen!0 key!932 (_keys!6492 thiss!1504) (mask!10409 thiss!1504)))))

(declare-fun res!116238 () Bool)

(assert (=> start!22720 (=> (not res!116238) (not e!153998))))

(declare-fun valid!1362 (LongMapFixedSize!3452) Bool)

(assert (=> start!22720 (= res!116238 (valid!1362 thiss!1504))))

(assert (=> start!22720 e!153998))

(assert (=> start!22720 e!154000))

(assert (=> start!22720 true))

(declare-fun b!237123 () Bool)

(declare-fun res!116240 () Bool)

(assert (=> b!237123 (=> (not res!116240) (not e!153998))))

(assert (=> b!237123 (= res!116240 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!237124 () Bool)

(declare-fun res!116241 () Bool)

(assert (=> b!237124 (=> (not res!116241) (not e!153995))))

(declare-datatypes ((tuple2!4662 0))(
  ( (tuple2!4663 (_1!2342 (_ BitVec 64)) (_2!2342 V!7965)) )
))
(declare-datatypes ((List!3563 0))(
  ( (Nil!3560) (Cons!3559 (h!4213 tuple2!4662) (t!8548 List!3563)) )
))
(declare-datatypes ((ListLongMap!3575 0))(
  ( (ListLongMap!3576 (toList!1803 List!3563)) )
))
(declare-fun contains!1685 (ListLongMap!3575 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1331 (array!11749 array!11747 (_ BitVec 32) (_ BitVec 32) V!7965 V!7965 (_ BitVec 32) Int) ListLongMap!3575)

(assert (=> b!237124 (= res!116241 (not (contains!1685 (getCurrentListMap!1331 (_keys!6492 thiss!1504) (_values!4387 thiss!1504) (mask!10409 thiss!1504) (extraKeys!4141 thiss!1504) (zeroValue!4245 thiss!1504) (minValue!4245 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4404 thiss!1504)) key!932)))))

(declare-fun b!237125 () Bool)

(assert (=> b!237125 (= e!153995 (and (= (size!5919 (_values!4387 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10409 thiss!1504))) (= (size!5920 (_keys!6492 thiss!1504)) (size!5919 (_values!4387 thiss!1504))) (bvsge (mask!10409 thiss!1504) #b00000000000000000000000000000000) (bvslt (extraKeys!4141 thiss!1504) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!10573 () Bool)

(declare-fun mapRes!10573 () Bool)

(assert (=> mapIsEmpty!10573 mapRes!10573))

(declare-fun b!237126 () Bool)

(assert (=> b!237126 (= e!153996 (and e!153997 mapRes!10573))))

(declare-fun condMapEmpty!10573 () Bool)

(declare-fun mapDefault!10573 () ValueCell!2776)

