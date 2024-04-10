; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!21382 () Bool)

(assert start!21382)

(declare-fun b!214943 () Bool)

(declare-fun b_free!5699 () Bool)

(declare-fun b_next!5699 () Bool)

(assert (=> b!214943 (= b_free!5699 (not b_next!5699))))

(declare-fun tp!20197 () Bool)

(declare-fun b_and!12589 () Bool)

(assert (=> b!214943 (= tp!20197 b_and!12589)))

(declare-fun res!105193 () Bool)

(declare-fun e!139796 () Bool)

(assert (=> start!21382 (=> (not res!105193) (not e!139796))))

(declare-datatypes ((V!7061 0))(
  ( (V!7062 (val!2825 Int)) )
))
(declare-datatypes ((ValueCell!2437 0))(
  ( (ValueCellFull!2437 (v!4843 V!7061)) (EmptyCell!2437) )
))
(declare-datatypes ((array!10341 0))(
  ( (array!10342 (arr!4902 (Array (_ BitVec 32) ValueCell!2437)) (size!5230 (_ BitVec 32))) )
))
(declare-datatypes ((array!10343 0))(
  ( (array!10344 (arr!4903 (Array (_ BitVec 32) (_ BitVec 64))) (size!5231 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2774 0))(
  ( (LongMapFixedSize!2775 (defaultEntry!4037 Int) (mask!9715 (_ BitVec 32)) (extraKeys!3774 (_ BitVec 32)) (zeroValue!3878 V!7061) (minValue!3878 V!7061) (_size!1436 (_ BitVec 32)) (_keys!6061 array!10343) (_values!4020 array!10341) (_vacant!1436 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!2774)

(declare-fun valid!1134 (LongMapFixedSize!2774) Bool)

(assert (=> start!21382 (= res!105193 (valid!1134 thiss!1504))))

(assert (=> start!21382 e!139796))

(declare-fun e!139797 () Bool)

(assert (=> start!21382 e!139797))

(assert (=> start!21382 true))

(declare-fun b!214937 () Bool)

(declare-fun e!139795 () Bool)

(declare-fun tp_is_empty!5561 () Bool)

(assert (=> b!214937 (= e!139795 tp_is_empty!5561)))

(declare-fun b!214938 () Bool)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!214938 (= e!139796 (not (validKeyInArray!0 key!932)))))

(declare-fun mapIsEmpty!9470 () Bool)

(declare-fun mapRes!9470 () Bool)

(assert (=> mapIsEmpty!9470 mapRes!9470))

(declare-fun b!214939 () Bool)

(declare-fun res!105194 () Bool)

(assert (=> b!214939 (=> (not res!105194) (not e!139796))))

(assert (=> b!214939 (= res!105194 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!214940 () Bool)

(declare-fun res!105191 () Bool)

(assert (=> b!214940 (=> (not res!105191) (not e!139796))))

(declare-fun index!297 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!726 0))(
  ( (MissingZero!726 (index!5074 (_ BitVec 32))) (Found!726 (index!5075 (_ BitVec 32))) (Intermediate!726 (undefined!1538 Bool) (index!5076 (_ BitVec 32)) (x!22426 (_ BitVec 32))) (Undefined!726) (MissingVacant!726 (index!5077 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10343 (_ BitVec 32)) SeekEntryResult!726)

(assert (=> b!214940 (= res!105191 (not (= (seekEntryOrOpen!0 key!932 (_keys!6061 thiss!1504) (mask!9715 thiss!1504)) (MissingZero!726 index!297))))))

(declare-fun b!214941 () Bool)

(declare-fun e!139794 () Bool)

(assert (=> b!214941 (= e!139794 tp_is_empty!5561)))

(declare-fun b!214942 () Bool)

(declare-fun res!105192 () Bool)

(assert (=> b!214942 (=> (not res!105192) (not e!139796))))

(assert (=> b!214942 (= res!105192 (and (bvsge (mask!9715 thiss!1504) #b00000000000000000000000000000000) (= (size!5231 (_keys!6061 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!9715 thiss!1504)))))))

(declare-fun e!139799 () Bool)

(declare-fun array_inv!3245 (array!10343) Bool)

(declare-fun array_inv!3246 (array!10341) Bool)

(assert (=> b!214943 (= e!139797 (and tp!20197 tp_is_empty!5561 (array_inv!3245 (_keys!6061 thiss!1504)) (array_inv!3246 (_values!4020 thiss!1504)) e!139799))))

(declare-fun b!214944 () Bool)

(declare-fun res!105190 () Bool)

(assert (=> b!214944 (=> (not res!105190) (not e!139796))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!214944 (= res!105190 (validMask!0 (mask!9715 thiss!1504)))))

(declare-fun b!214945 () Bool)

(assert (=> b!214945 (= e!139799 (and e!139794 mapRes!9470))))

(declare-fun condMapEmpty!9470 () Bool)

(declare-fun mapDefault!9470 () ValueCell!2437)

