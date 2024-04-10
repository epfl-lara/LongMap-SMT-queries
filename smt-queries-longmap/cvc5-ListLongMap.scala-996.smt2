; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!21488 () Bool)

(assert start!21488)

(declare-fun b!215614 () Bool)

(declare-fun b_free!5725 () Bool)

(declare-fun b_next!5725 () Bool)

(assert (=> b!215614 (= b_free!5725 (not b_next!5725))))

(declare-fun tp!20293 () Bool)

(declare-fun b_and!12615 () Bool)

(assert (=> b!215614 (= tp!20293 b_and!12615)))

(declare-fun mapIsEmpty!9526 () Bool)

(declare-fun mapRes!9526 () Bool)

(assert (=> mapIsEmpty!9526 mapRes!9526))

(declare-fun b!215612 () Bool)

(declare-fun e!140273 () Bool)

(declare-fun tp_is_empty!5587 () Bool)

(assert (=> b!215612 (= e!140273 tp_is_empty!5587)))

(declare-fun res!105460 () Bool)

(declare-fun e!140269 () Bool)

(assert (=> start!21488 (=> (not res!105460) (not e!140269))))

(declare-datatypes ((V!7097 0))(
  ( (V!7098 (val!2838 Int)) )
))
(declare-datatypes ((ValueCell!2450 0))(
  ( (ValueCellFull!2450 (v!4856 V!7097)) (EmptyCell!2450) )
))
(declare-datatypes ((array!10403 0))(
  ( (array!10404 (arr!4928 (Array (_ BitVec 32) ValueCell!2450)) (size!5258 (_ BitVec 32))) )
))
(declare-datatypes ((array!10405 0))(
  ( (array!10406 (arr!4929 (Array (_ BitVec 32) (_ BitVec 64))) (size!5259 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2800 0))(
  ( (LongMapFixedSize!2801 (defaultEntry!4050 Int) (mask!9756 (_ BitVec 32)) (extraKeys!3787 (_ BitVec 32)) (zeroValue!3891 V!7097) (minValue!3891 V!7097) (_size!1449 (_ BitVec 32)) (_keys!6085 array!10405) (_values!4033 array!10403) (_vacant!1449 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!2800)

(declare-fun valid!1140 (LongMapFixedSize!2800) Bool)

(assert (=> start!21488 (= res!105460 (valid!1140 thiss!1504))))

(assert (=> start!21488 e!140269))

(declare-fun e!140271 () Bool)

(assert (=> start!21488 e!140271))

(assert (=> start!21488 true))

(declare-fun b!215613 () Bool)

(declare-fun e!140270 () Bool)

(assert (=> b!215613 (= e!140269 e!140270)))

(declare-fun res!105459 () Bool)

(assert (=> b!215613 (=> (not res!105459) (not e!140270))))

(declare-datatypes ((SeekEntryResult!733 0))(
  ( (MissingZero!733 (index!5102 (_ BitVec 32))) (Found!733 (index!5103 (_ BitVec 32))) (Intermediate!733 (undefined!1545 Bool) (index!5104 (_ BitVec 32)) (x!22531 (_ BitVec 32))) (Undefined!733) (MissingVacant!733 (index!5105 (_ BitVec 32))) )
))
(declare-fun lt!110991 () SeekEntryResult!733)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!215613 (= res!105459 (or (= lt!110991 (MissingZero!733 index!297)) (= lt!110991 (MissingVacant!733 index!297))))))

(declare-fun key!932 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10405 (_ BitVec 32)) SeekEntryResult!733)

(assert (=> b!215613 (= lt!110991 (seekEntryOrOpen!0 key!932 (_keys!6085 thiss!1504) (mask!9756 thiss!1504)))))

(declare-fun e!140268 () Bool)

(declare-fun array_inv!3261 (array!10405) Bool)

(declare-fun array_inv!3262 (array!10403) Bool)

(assert (=> b!215614 (= e!140271 (and tp!20293 tp_is_empty!5587 (array_inv!3261 (_keys!6085 thiss!1504)) (array_inv!3262 (_values!4033 thiss!1504)) e!140268))))

(declare-fun b!215615 () Bool)

(assert (=> b!215615 (= e!140270 (and (= (size!5258 (_values!4033 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!9756 thiss!1504))) (= (size!5259 (_keys!6085 thiss!1504)) (size!5258 (_values!4033 thiss!1504))) (bvsge (mask!9756 thiss!1504) #b00000000000000000000000000000000) (bvslt (extraKeys!3787 thiss!1504) #b00000000000000000000000000000000)))))

(declare-fun b!215616 () Bool)

(declare-fun res!105457 () Bool)

(assert (=> b!215616 (=> (not res!105457) (not e!140269))))

(assert (=> b!215616 (= res!105457 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!215617 () Bool)

(declare-fun res!105458 () Bool)

(assert (=> b!215617 (=> (not res!105458) (not e!140270))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!215617 (= res!105458 (validMask!0 (mask!9756 thiss!1504)))))

(declare-fun b!215618 () Bool)

(assert (=> b!215618 (= e!140268 (and e!140273 mapRes!9526))))

(declare-fun condMapEmpty!9526 () Bool)

(declare-fun mapDefault!9526 () ValueCell!2450)

