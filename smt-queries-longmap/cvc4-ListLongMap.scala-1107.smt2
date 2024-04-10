; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!22854 () Bool)

(assert start!22854)

(declare-fun b!238120 () Bool)

(declare-fun b_free!6395 () Bool)

(declare-fun b_next!6395 () Bool)

(assert (=> b!238120 (= b_free!6395 (not b_next!6395))))

(declare-fun tp!22383 () Bool)

(declare-fun b_and!13357 () Bool)

(assert (=> b!238120 (= tp!22383 b_and!13357)))

(declare-fun b!238119 () Bool)

(declare-fun e!154615 () Bool)

(declare-datatypes ((V!7989 0))(
  ( (V!7990 (val!3173 Int)) )
))
(declare-datatypes ((ValueCell!2785 0))(
  ( (ValueCellFull!2785 (v!5209 V!7989)) (EmptyCell!2785) )
))
(declare-datatypes ((array!11789 0))(
  ( (array!11790 (arr!5598 (Array (_ BitVec 32) ValueCell!2785)) (size!5939 (_ BitVec 32))) )
))
(declare-datatypes ((array!11791 0))(
  ( (array!11792 (arr!5599 (Array (_ BitVec 32) (_ BitVec 64))) (size!5940 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3470 0))(
  ( (LongMapFixedSize!3471 (defaultEntry!4418 Int) (mask!10444 (_ BitVec 32)) (extraKeys!4155 (_ BitVec 32)) (zeroValue!4259 V!7989) (minValue!4259 V!7989) (_size!1784 (_ BitVec 32)) (_keys!6516 array!11791) (_values!4401 array!11789) (_vacant!1784 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3470)

(declare-datatypes ((List!3575 0))(
  ( (Nil!3572) (Cons!3571 (h!4227 (_ BitVec 64)) (t!8566 List!3575)) )
))
(declare-fun arrayNoDuplicates!0 (array!11791 (_ BitVec 32) List!3575) Bool)

(assert (=> b!238119 (= e!154615 (not (arrayNoDuplicates!0 (_keys!6516 thiss!1504) #b00000000000000000000000000000000 Nil!3572)))))

(declare-fun res!116688 () Bool)

(declare-fun e!154614 () Bool)

(assert (=> start!22854 (=> (not res!116688) (not e!154614))))

(declare-fun valid!1370 (LongMapFixedSize!3470) Bool)

(assert (=> start!22854 (= res!116688 (valid!1370 thiss!1504))))

(assert (=> start!22854 e!154614))

(declare-fun e!154618 () Bool)

(assert (=> start!22854 e!154618))

(assert (=> start!22854 true))

(declare-fun e!154616 () Bool)

(declare-fun tp_is_empty!6257 () Bool)

(declare-fun array_inv!3699 (array!11791) Bool)

(declare-fun array_inv!3700 (array!11789) Bool)

(assert (=> b!238120 (= e!154618 (and tp!22383 tp_is_empty!6257 (array_inv!3699 (_keys!6516 thiss!1504)) (array_inv!3700 (_values!4401 thiss!1504)) e!154616))))

(declare-fun b!238121 () Bool)

(declare-fun res!116687 () Bool)

(assert (=> b!238121 (=> (not res!116687) (not e!154615))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11791 (_ BitVec 32)) Bool)

(assert (=> b!238121 (= res!116687 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6516 thiss!1504) (mask!10444 thiss!1504)))))

(declare-fun b!238122 () Bool)

(assert (=> b!238122 (= e!154614 e!154615)))

(declare-fun res!116689 () Bool)

(assert (=> b!238122 (=> (not res!116689) (not e!154615))))

(declare-datatypes ((SeekEntryResult!1014 0))(
  ( (MissingZero!1014 (index!6226 (_ BitVec 32))) (Found!1014 (index!6227 (_ BitVec 32))) (Intermediate!1014 (undefined!1826 Bool) (index!6228 (_ BitVec 32)) (x!24010 (_ BitVec 32))) (Undefined!1014) (MissingVacant!1014 (index!6229 (_ BitVec 32))) )
))
(declare-fun lt!120402 () SeekEntryResult!1014)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!238122 (= res!116689 (or (= lt!120402 (MissingZero!1014 index!297)) (= lt!120402 (MissingVacant!1014 index!297))))))

(declare-fun key!932 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11791 (_ BitVec 32)) SeekEntryResult!1014)

(assert (=> b!238122 (= lt!120402 (seekEntryOrOpen!0 key!932 (_keys!6516 thiss!1504) (mask!10444 thiss!1504)))))

(declare-fun b!238123 () Bool)

(declare-fun e!154619 () Bool)

(assert (=> b!238123 (= e!154619 tp_is_empty!6257)))

(declare-fun b!238124 () Bool)

(declare-fun mapRes!10611 () Bool)

(assert (=> b!238124 (= e!154616 (and e!154619 mapRes!10611))))

(declare-fun condMapEmpty!10611 () Bool)

(declare-fun mapDefault!10611 () ValueCell!2785)

