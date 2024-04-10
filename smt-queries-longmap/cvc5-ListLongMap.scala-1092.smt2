; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!22348 () Bool)

(assert start!22348)

(declare-fun b!234090 () Bool)

(declare-fun b_free!6301 () Bool)

(declare-fun b_next!6301 () Bool)

(assert (=> b!234090 (= b_free!6301 (not b_next!6301))))

(declare-fun tp!22056 () Bool)

(declare-fun b_and!13213 () Bool)

(assert (=> b!234090 (= tp!22056 b_and!13213)))

(declare-fun b!234082 () Bool)

(declare-fun res!114841 () Bool)

(declare-fun e!152048 () Bool)

(assert (=> b!234082 (=> (not res!114841) (not e!152048))))

(declare-datatypes ((V!7865 0))(
  ( (V!7866 (val!3126 Int)) )
))
(declare-datatypes ((ValueCell!2738 0))(
  ( (ValueCellFull!2738 (v!5149 V!7865)) (EmptyCell!2738) )
))
(declare-datatypes ((array!11575 0))(
  ( (array!11576 (arr!5504 (Array (_ BitVec 32) ValueCell!2738)) (size!5839 (_ BitVec 32))) )
))
(declare-datatypes ((array!11577 0))(
  ( (array!11578 (arr!5505 (Array (_ BitVec 32) (_ BitVec 64))) (size!5840 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3376 0))(
  ( (LongMapFixedSize!3377 (defaultEntry!4352 Int) (mask!10294 (_ BitVec 32)) (extraKeys!4089 (_ BitVec 32)) (zeroValue!4193 V!7865) (minValue!4193 V!7865) (_size!1737 (_ BitVec 32)) (_keys!6415 array!11577) (_values!4335 array!11575) (_vacant!1737 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3376)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!234082 (= res!114841 (validMask!0 (mask!10294 thiss!1504)))))

(declare-fun b!234083 () Bool)

(declare-fun res!114840 () Bool)

(declare-fun e!152044 () Bool)

(assert (=> b!234083 (=> (not res!114840) (not e!152044))))

(declare-fun key!932 () (_ BitVec 64))

(assert (=> b!234083 (= res!114840 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!234084 () Bool)

(assert (=> b!234084 (= e!152044 e!152048)))

(declare-fun res!114842 () Bool)

(assert (=> b!234084 (=> (not res!114842) (not e!152048))))

(declare-datatypes ((SeekEntryResult!978 0))(
  ( (MissingZero!978 (index!6082 (_ BitVec 32))) (Found!978 (index!6083 (_ BitVec 32))) (Intermediate!978 (undefined!1790 Bool) (index!6084 (_ BitVec 32)) (x!23676 (_ BitVec 32))) (Undefined!978) (MissingVacant!978 (index!6085 (_ BitVec 32))) )
))
(declare-fun lt!118416 () SeekEntryResult!978)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!234084 (= res!114842 (or (= lt!118416 (MissingZero!978 index!297)) (= lt!118416 (MissingVacant!978 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11577 (_ BitVec 32)) SeekEntryResult!978)

(assert (=> b!234084 (= lt!118416 (seekEntryOrOpen!0 key!932 (_keys!6415 thiss!1504) (mask!10294 thiss!1504)))))

(declare-fun res!114838 () Bool)

(assert (=> start!22348 (=> (not res!114838) (not e!152044))))

(declare-fun valid!1332 (LongMapFixedSize!3376) Bool)

(assert (=> start!22348 (= res!114838 (valid!1332 thiss!1504))))

(assert (=> start!22348 e!152044))

(declare-fun e!152043 () Bool)

(assert (=> start!22348 e!152043))

(assert (=> start!22348 true))

(declare-fun b!234085 () Bool)

(declare-fun e!152046 () Bool)

(declare-fun tp_is_empty!6163 () Bool)

(assert (=> b!234085 (= e!152046 tp_is_empty!6163)))

(declare-fun mapNonEmpty!10425 () Bool)

(declare-fun mapRes!10425 () Bool)

(declare-fun tp!22055 () Bool)

(assert (=> mapNonEmpty!10425 (= mapRes!10425 (and tp!22055 e!152046))))

(declare-fun mapValue!10425 () ValueCell!2738)

(declare-fun mapKey!10425 () (_ BitVec 32))

(declare-fun mapRest!10425 () (Array (_ BitVec 32) ValueCell!2738))

(assert (=> mapNonEmpty!10425 (= (arr!5504 (_values!4335 thiss!1504)) (store mapRest!10425 mapKey!10425 mapValue!10425))))

(declare-fun b!234086 () Bool)

(declare-fun e!152049 () Bool)

(declare-fun e!152047 () Bool)

(assert (=> b!234086 (= e!152049 (and e!152047 mapRes!10425))))

(declare-fun condMapEmpty!10425 () Bool)

(declare-fun mapDefault!10425 () ValueCell!2738)

