; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!21492 () Bool)

(assert start!21492)

(declare-fun b!215666 () Bool)

(declare-fun b_free!5729 () Bool)

(declare-fun b_next!5729 () Bool)

(assert (=> b!215666 (= b_free!5729 (not b_next!5729))))

(declare-fun tp!20304 () Bool)

(declare-fun b_and!12619 () Bool)

(assert (=> b!215666 (= tp!20304 b_and!12619)))

(declare-fun mapIsEmpty!9532 () Bool)

(declare-fun mapRes!9532 () Bool)

(assert (=> mapIsEmpty!9532 mapRes!9532))

(declare-fun b!215660 () Bool)

(declare-fun e!140312 () Bool)

(declare-fun e!140313 () Bool)

(assert (=> b!215660 (= e!140312 e!140313)))

(declare-fun res!105482 () Bool)

(assert (=> b!215660 (=> (not res!105482) (not e!140313))))

(declare-datatypes ((SeekEntryResult!735 0))(
  ( (MissingZero!735 (index!5110 (_ BitVec 32))) (Found!735 (index!5111 (_ BitVec 32))) (Intermediate!735 (undefined!1547 Bool) (index!5112 (_ BitVec 32)) (x!22533 (_ BitVec 32))) (Undefined!735) (MissingVacant!735 (index!5113 (_ BitVec 32))) )
))
(declare-fun lt!110997 () SeekEntryResult!735)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!215660 (= res!105482 (or (= lt!110997 (MissingZero!735 index!297)) (= lt!110997 (MissingVacant!735 index!297))))))

(declare-fun key!932 () (_ BitVec 64))

(declare-datatypes ((V!7101 0))(
  ( (V!7102 (val!2840 Int)) )
))
(declare-datatypes ((ValueCell!2452 0))(
  ( (ValueCellFull!2452 (v!4858 V!7101)) (EmptyCell!2452) )
))
(declare-datatypes ((array!10411 0))(
  ( (array!10412 (arr!4932 (Array (_ BitVec 32) ValueCell!2452)) (size!5262 (_ BitVec 32))) )
))
(declare-datatypes ((array!10413 0))(
  ( (array!10414 (arr!4933 (Array (_ BitVec 32) (_ BitVec 64))) (size!5263 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2804 0))(
  ( (LongMapFixedSize!2805 (defaultEntry!4052 Int) (mask!9758 (_ BitVec 32)) (extraKeys!3789 (_ BitVec 32)) (zeroValue!3893 V!7101) (minValue!3893 V!7101) (_size!1451 (_ BitVec 32)) (_keys!6087 array!10413) (_values!4035 array!10411) (_vacant!1451 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!2804)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10413 (_ BitVec 32)) SeekEntryResult!735)

(assert (=> b!215660 (= lt!110997 (seekEntryOrOpen!0 key!932 (_keys!6087 thiss!1504) (mask!9758 thiss!1504)))))

(declare-fun b!215661 () Bool)

(assert (=> b!215661 (= e!140313 (and (= (size!5262 (_values!4035 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!9758 thiss!1504))) (= (size!5263 (_keys!6087 thiss!1504)) (size!5262 (_values!4035 thiss!1504))) (bvsge (mask!9758 thiss!1504) #b00000000000000000000000000000000) (bvslt (extraKeys!3789 thiss!1504) #b00000000000000000000000000000000)))))

(declare-fun b!215662 () Bool)

(declare-fun e!140311 () Bool)

(declare-fun tp_is_empty!5591 () Bool)

(assert (=> b!215662 (= e!140311 tp_is_empty!5591)))

(declare-fun b!215663 () Bool)

(declare-fun e!140315 () Bool)

(assert (=> b!215663 (= e!140315 tp_is_empty!5591)))

(declare-fun b!215664 () Bool)

(declare-fun e!140314 () Bool)

(assert (=> b!215664 (= e!140314 (and e!140311 mapRes!9532))))

(declare-fun condMapEmpty!9532 () Bool)

(declare-fun mapDefault!9532 () ValueCell!2452)

