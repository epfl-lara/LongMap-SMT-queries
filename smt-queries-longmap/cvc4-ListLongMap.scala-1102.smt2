; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!22644 () Bool)

(assert start!22644)

(declare-fun b!236544 () Bool)

(declare-fun b_free!6365 () Bool)

(declare-fun b_next!6365 () Bool)

(assert (=> b!236544 (= b_free!6365 (not b_next!6365))))

(declare-fun tp!22275 () Bool)

(declare-fun b_and!13305 () Bool)

(assert (=> b!236544 (= tp!22275 b_and!13305)))

(declare-fun mapIsEmpty!10548 () Bool)

(declare-fun mapRes!10548 () Bool)

(assert (=> mapIsEmpty!10548 mapRes!10548))

(declare-fun tp_is_empty!6227 () Bool)

(declare-datatypes ((V!7949 0))(
  ( (V!7950 (val!3158 Int)) )
))
(declare-datatypes ((ValueCell!2770 0))(
  ( (ValueCellFull!2770 (v!5189 V!7949)) (EmptyCell!2770) )
))
(declare-datatypes ((array!11719 0))(
  ( (array!11720 (arr!5568 (Array (_ BitVec 32) ValueCell!2770)) (size!5906 (_ BitVec 32))) )
))
(declare-datatypes ((array!11721 0))(
  ( (array!11722 (arr!5569 (Array (_ BitVec 32) (_ BitVec 64))) (size!5907 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3440 0))(
  ( (LongMapFixedSize!3441 (defaultEntry!4395 Int) (mask!10388 (_ BitVec 32)) (extraKeys!4132 (_ BitVec 32)) (zeroValue!4236 V!7949) (minValue!4236 V!7949) (_size!1769 (_ BitVec 32)) (_keys!6478 array!11721) (_values!4378 array!11719) (_vacant!1769 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3440)

(declare-fun e!153629 () Bool)

(declare-fun e!153627 () Bool)

(declare-fun array_inv!3673 (array!11721) Bool)

(declare-fun array_inv!3674 (array!11719) Bool)

(assert (=> b!236544 (= e!153627 (and tp!22275 tp_is_empty!6227 (array_inv!3673 (_keys!6478 thiss!1504)) (array_inv!3674 (_values!4378 thiss!1504)) e!153629))))

(declare-fun b!236545 () Bool)

(declare-fun e!153631 () Bool)

(declare-fun e!153632 () Bool)

(assert (=> b!236545 (= e!153631 e!153632)))

(declare-fun res!115988 () Bool)

(assert (=> b!236545 (=> (not res!115988) (not e!153632))))

(declare-datatypes ((SeekEntryResult!1003 0))(
  ( (MissingZero!1003 (index!6182 (_ BitVec 32))) (Found!1003 (index!6183 (_ BitVec 32))) (Intermediate!1003 (undefined!1815 Bool) (index!6184 (_ BitVec 32)) (x!23885 (_ BitVec 32))) (Undefined!1003) (MissingVacant!1003 (index!6185 (_ BitVec 32))) )
))
(declare-fun lt!119583 () SeekEntryResult!1003)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!236545 (= res!115988 (or (= lt!119583 (MissingZero!1003 index!297)) (= lt!119583 (MissingVacant!1003 index!297))))))

(declare-fun key!932 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11721 (_ BitVec 32)) SeekEntryResult!1003)

(assert (=> b!236545 (= lt!119583 (seekEntryOrOpen!0 key!932 (_keys!6478 thiss!1504) (mask!10388 thiss!1504)))))

(declare-fun b!236546 () Bool)

(declare-fun e!153628 () Bool)

(assert (=> b!236546 (= e!153629 (and e!153628 mapRes!10548))))

(declare-fun condMapEmpty!10548 () Bool)

(declare-fun mapDefault!10548 () ValueCell!2770)

