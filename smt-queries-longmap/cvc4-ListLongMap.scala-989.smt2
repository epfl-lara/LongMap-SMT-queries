; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!21336 () Bool)

(assert start!21336)

(declare-fun b!214621 () Bool)

(declare-fun b_free!5687 () Bool)

(declare-fun b_next!5687 () Bool)

(assert (=> b!214621 (= b_free!5687 (not b_next!5687))))

(declare-fun tp!20155 () Bool)

(declare-fun b_and!12577 () Bool)

(assert (=> b!214621 (= tp!20155 b_and!12577)))

(declare-fun res!105056 () Bool)

(declare-fun e!139594 () Bool)

(assert (=> start!21336 (=> (not res!105056) (not e!139594))))

(declare-datatypes ((V!7045 0))(
  ( (V!7046 (val!2819 Int)) )
))
(declare-datatypes ((ValueCell!2431 0))(
  ( (ValueCellFull!2431 (v!4837 V!7045)) (EmptyCell!2431) )
))
(declare-datatypes ((array!10313 0))(
  ( (array!10314 (arr!4890 (Array (_ BitVec 32) ValueCell!2431)) (size!5217 (_ BitVec 32))) )
))
(declare-datatypes ((array!10315 0))(
  ( (array!10316 (arr!4891 (Array (_ BitVec 32) (_ BitVec 64))) (size!5218 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2762 0))(
  ( (LongMapFixedSize!2763 (defaultEntry!4031 Int) (mask!9697 (_ BitVec 32)) (extraKeys!3768 (_ BitVec 32)) (zeroValue!3872 V!7045) (minValue!3872 V!7045) (_size!1430 (_ BitVec 32)) (_keys!6050 array!10315) (_values!4014 array!10313) (_vacant!1430 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!2762)

(declare-fun valid!1130 (LongMapFixedSize!2762) Bool)

(assert (=> start!21336 (= res!105056 (valid!1130 thiss!1504))))

(assert (=> start!21336 e!139594))

(declare-fun e!139597 () Bool)

(assert (=> start!21336 e!139597))

(assert (=> start!21336 true))

(declare-fun mapIsEmpty!9445 () Bool)

(declare-fun mapRes!9445 () Bool)

(assert (=> mapIsEmpty!9445 mapRes!9445))

(declare-fun mapNonEmpty!9445 () Bool)

(declare-fun tp!20154 () Bool)

(declare-fun e!139596 () Bool)

(assert (=> mapNonEmpty!9445 (= mapRes!9445 (and tp!20154 e!139596))))

(declare-fun mapKey!9445 () (_ BitVec 32))

(declare-fun mapValue!9445 () ValueCell!2431)

(declare-fun mapRest!9445 () (Array (_ BitVec 32) ValueCell!2431))

(assert (=> mapNonEmpty!9445 (= (arr!4890 (_values!4014 thiss!1504)) (store mapRest!9445 mapKey!9445 mapValue!9445))))

(declare-fun b!214617 () Bool)

(declare-fun res!105057 () Bool)

(assert (=> b!214617 (=> (not res!105057) (not e!139594))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!214617 (= res!105057 (validMask!0 (mask!9697 thiss!1504)))))

(declare-fun b!214618 () Bool)

(assert (=> b!214618 (= e!139594 (bvslt (mask!9697 thiss!1504) #b00000000000000000000000000000000))))

(declare-fun b!214619 () Bool)

(declare-fun e!139599 () Bool)

(declare-fun tp_is_empty!5549 () Bool)

(assert (=> b!214619 (= e!139599 tp_is_empty!5549)))

(declare-fun b!214620 () Bool)

(declare-fun res!105058 () Bool)

(assert (=> b!214620 (=> (not res!105058) (not e!139594))))

(declare-fun index!297 () (_ BitVec 32))

(declare-fun key!932 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!721 0))(
  ( (MissingZero!721 (index!5054 (_ BitVec 32))) (Found!721 (index!5055 (_ BitVec 32))) (Intermediate!721 (undefined!1533 Bool) (index!5056 (_ BitVec 32)) (x!22380 (_ BitVec 32))) (Undefined!721) (MissingVacant!721 (index!5057 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10315 (_ BitVec 32)) SeekEntryResult!721)

(assert (=> b!214620 (= res!105058 (not (= (seekEntryOrOpen!0 key!932 (_keys!6050 thiss!1504) (mask!9697 thiss!1504)) (MissingZero!721 index!297))))))

(declare-fun e!139598 () Bool)

(declare-fun array_inv!3235 (array!10315) Bool)

(declare-fun array_inv!3236 (array!10313) Bool)

(assert (=> b!214621 (= e!139597 (and tp!20155 tp_is_empty!5549 (array_inv!3235 (_keys!6050 thiss!1504)) (array_inv!3236 (_values!4014 thiss!1504)) e!139598))))

(declare-fun b!214622 () Bool)

(assert (=> b!214622 (= e!139598 (and e!139599 mapRes!9445))))

(declare-fun condMapEmpty!9445 () Bool)

(declare-fun mapDefault!9445 () ValueCell!2431)

