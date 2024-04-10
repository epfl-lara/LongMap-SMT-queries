; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!18840 () Bool)

(assert start!18840)

(declare-fun b!186208 () Bool)

(declare-fun b_free!4595 () Bool)

(declare-fun b_next!4595 () Bool)

(assert (=> b!186208 (= b_free!4595 (not b_next!4595))))

(declare-fun tp!16587 () Bool)

(declare-fun b_and!11199 () Bool)

(assert (=> b!186208 (= tp!16587 b_and!11199)))

(declare-fun mapIsEmpty!7515 () Bool)

(declare-fun mapRes!7515 () Bool)

(assert (=> mapIsEmpty!7515 mapRes!7515))

(declare-fun b!186204 () Bool)

(declare-datatypes ((Unit!5613 0))(
  ( (Unit!5614) )
))
(declare-fun e!122562 () Unit!5613)

(declare-fun lt!92055 () Unit!5613)

(assert (=> b!186204 (= e!122562 lt!92055)))

(declare-datatypes ((V!5469 0))(
  ( (V!5470 (val!2228 Int)) )
))
(declare-datatypes ((ValueCell!1840 0))(
  ( (ValueCellFull!1840 (v!4140 V!5469)) (EmptyCell!1840) )
))
(declare-datatypes ((array!7945 0))(
  ( (array!7946 (arr!3751 (Array (_ BitVec 32) (_ BitVec 64))) (size!4067 (_ BitVec 32))) )
))
(declare-datatypes ((array!7947 0))(
  ( (array!7948 (arr!3752 (Array (_ BitVec 32) ValueCell!1840)) (size!4068 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2588 0))(
  ( (LongMapFixedSize!2589 (defaultEntry!3799 Int) (mask!8921 (_ BitVec 32)) (extraKeys!3536 (_ BitVec 32)) (zeroValue!3640 V!5469) (minValue!3640 V!5469) (_size!1343 (_ BitVec 32)) (_keys!5741 array!7945) (_values!3782 array!7947) (_vacant!1343 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2588)

(declare-fun key!828 () (_ BitVec 64))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!145 (array!7945 array!7947 (_ BitVec 32) (_ BitVec 32) V!5469 V!5469 (_ BitVec 64) Int) Unit!5613)

(assert (=> b!186204 (= lt!92055 (lemmaInListMapThenSeekEntryOrOpenFindsIt!145 (_keys!5741 thiss!1248) (_values!3782 thiss!1248) (mask!8921 thiss!1248) (extraKeys!3536 thiss!1248) (zeroValue!3640 thiss!1248) (minValue!3640 thiss!1248) key!828 (defaultEntry!3799 thiss!1248)))))

(declare-fun res!88084 () Bool)

(declare-datatypes ((SeekEntryResult!643 0))(
  ( (MissingZero!643 (index!4742 (_ BitVec 32))) (Found!643 (index!4743 (_ BitVec 32))) (Intermediate!643 (undefined!1455 Bool) (index!4744 (_ BitVec 32)) (x!20207 (_ BitVec 32))) (Undefined!643) (MissingVacant!643 (index!4745 (_ BitVec 32))) )
))
(declare-fun lt!92057 () SeekEntryResult!643)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!186204 (= res!88084 (inRange!0 (index!4743 lt!92057) (mask!8921 thiss!1248)))))

(declare-fun e!122568 () Bool)

(assert (=> b!186204 (=> (not res!88084) (not e!122568))))

(assert (=> b!186204 e!122568))

(declare-fun b!186205 () Bool)

(declare-fun res!88085 () Bool)

(declare-fun e!122566 () Bool)

(assert (=> b!186205 (=> (not res!88085) (not e!122566))))

(assert (=> b!186205 (= res!88085 (not (= key!828 (bvneg key!828))))))

(declare-fun b!186206 () Bool)

(declare-fun e!122565 () Bool)

(declare-fun tp_is_empty!4367 () Bool)

(assert (=> b!186206 (= e!122565 tp_is_empty!4367)))

(declare-fun b!186207 () Bool)

(declare-fun e!122569 () Bool)

(declare-fun e!122560 () Bool)

(assert (=> b!186207 (= e!122569 (and e!122560 mapRes!7515))))

(declare-fun condMapEmpty!7515 () Bool)

(declare-fun mapDefault!7515 () ValueCell!1840)

