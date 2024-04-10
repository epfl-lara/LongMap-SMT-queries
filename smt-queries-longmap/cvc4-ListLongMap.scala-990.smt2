; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!21352 () Bool)

(assert start!21352)

(declare-fun b!214729 () Bool)

(declare-fun b_free!5693 () Bool)

(declare-fun b_next!5693 () Bool)

(assert (=> b!214729 (= b_free!5693 (not b_next!5693))))

(declare-fun tp!20176 () Bool)

(declare-fun b_and!12583 () Bool)

(assert (=> b!214729 (= tp!20176 b_and!12583)))

(declare-fun b!214724 () Bool)

(declare-fun res!105103 () Bool)

(declare-fun e!139671 () Bool)

(assert (=> b!214724 (=> (not res!105103) (not e!139671))))

(declare-datatypes ((V!7053 0))(
  ( (V!7054 (val!2822 Int)) )
))
(declare-datatypes ((ValueCell!2434 0))(
  ( (ValueCellFull!2434 (v!4840 V!7053)) (EmptyCell!2434) )
))
(declare-datatypes ((array!10327 0))(
  ( (array!10328 (arr!4896 (Array (_ BitVec 32) ValueCell!2434)) (size!5223 (_ BitVec 32))) )
))
(declare-datatypes ((array!10329 0))(
  ( (array!10330 (arr!4897 (Array (_ BitVec 32) (_ BitVec 64))) (size!5224 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2768 0))(
  ( (LongMapFixedSize!2769 (defaultEntry!4034 Int) (mask!9704 (_ BitVec 32)) (extraKeys!3771 (_ BitVec 32)) (zeroValue!3875 V!7053) (minValue!3875 V!7053) (_size!1433 (_ BitVec 32)) (_keys!6054 array!10329) (_values!4017 array!10327) (_vacant!1433 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!2768)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!214724 (= res!105103 (validMask!0 (mask!9704 thiss!1504)))))

(declare-fun res!105102 () Bool)

(assert (=> start!21352 (=> (not res!105102) (not e!139671))))

(declare-fun valid!1132 (LongMapFixedSize!2768) Bool)

(assert (=> start!21352 (= res!105102 (valid!1132 thiss!1504))))

(assert (=> start!21352 e!139671))

(declare-fun e!139667 () Bool)

(assert (=> start!21352 e!139667))

(assert (=> start!21352 true))

(declare-fun b!214725 () Bool)

(assert (=> b!214725 (= e!139671 (and (bvsge (mask!9704 thiss!1504) #b00000000000000000000000000000000) (not (= (size!5224 (_keys!6054 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!9704 thiss!1504))))))))

(declare-fun b!214726 () Bool)

(declare-fun e!139666 () Bool)

(declare-fun tp_is_empty!5555 () Bool)

(assert (=> b!214726 (= e!139666 tp_is_empty!5555)))

(declare-fun mapIsEmpty!9457 () Bool)

(declare-fun mapRes!9457 () Bool)

(assert (=> mapIsEmpty!9457 mapRes!9457))

(declare-fun b!214727 () Bool)

(declare-fun res!105101 () Bool)

(assert (=> b!214727 (=> (not res!105101) (not e!139671))))

(declare-fun key!932 () (_ BitVec 64))

(declare-fun index!297 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!723 0))(
  ( (MissingZero!723 (index!5062 (_ BitVec 32))) (Found!723 (index!5063 (_ BitVec 32))) (Intermediate!723 (undefined!1535 Bool) (index!5064 (_ BitVec 32)) (x!22398 (_ BitVec 32))) (Undefined!723) (MissingVacant!723 (index!5065 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10329 (_ BitVec 32)) SeekEntryResult!723)

(assert (=> b!214727 (= res!105101 (not (= (seekEntryOrOpen!0 key!932 (_keys!6054 thiss!1504) (mask!9704 thiss!1504)) (MissingZero!723 index!297))))))

(declare-fun mapNonEmpty!9457 () Bool)

(declare-fun tp!20175 () Bool)

(declare-fun e!139668 () Bool)

(assert (=> mapNonEmpty!9457 (= mapRes!9457 (and tp!20175 e!139668))))

(declare-fun mapRest!9457 () (Array (_ BitVec 32) ValueCell!2434))

(declare-fun mapValue!9457 () ValueCell!2434)

(declare-fun mapKey!9457 () (_ BitVec 32))

(assert (=> mapNonEmpty!9457 (= (arr!4896 (_values!4017 thiss!1504)) (store mapRest!9457 mapKey!9457 mapValue!9457))))

(declare-fun b!214728 () Bool)

(declare-fun res!105100 () Bool)

(assert (=> b!214728 (=> (not res!105100) (not e!139671))))

(assert (=> b!214728 (= res!105100 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!139670 () Bool)

(declare-fun array_inv!3239 (array!10329) Bool)

(declare-fun array_inv!3240 (array!10327) Bool)

(assert (=> b!214729 (= e!139667 (and tp!20176 tp_is_empty!5555 (array_inv!3239 (_keys!6054 thiss!1504)) (array_inv!3240 (_values!4017 thiss!1504)) e!139670))))

(declare-fun b!214730 () Bool)

(assert (=> b!214730 (= e!139668 tp_is_empty!5555)))

(declare-fun b!214731 () Bool)

(assert (=> b!214731 (= e!139670 (and e!139666 mapRes!9457))))

(declare-fun condMapEmpty!9457 () Bool)

(declare-fun mapDefault!9457 () ValueCell!2434)

