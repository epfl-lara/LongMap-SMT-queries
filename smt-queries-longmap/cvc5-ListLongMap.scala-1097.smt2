; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!22526 () Bool)

(assert start!22526)

(declare-fun b!235498 () Bool)

(declare-fun b_free!6331 () Bool)

(declare-fun b_next!6331 () Bool)

(assert (=> b!235498 (= b_free!6331 (not b_next!6331))))

(declare-fun tp!22162 () Bool)

(declare-fun b_and!13261 () Bool)

(assert (=> b!235498 (= tp!22162 b_and!13261)))

(declare-fun b!235494 () Bool)

(declare-fun res!115478 () Bool)

(declare-fun e!152937 () Bool)

(assert (=> b!235494 (=> (not res!115478) (not e!152937))))

(declare-datatypes ((V!7905 0))(
  ( (V!7906 (val!3141 Int)) )
))
(declare-datatypes ((ValueCell!2753 0))(
  ( (ValueCellFull!2753 (v!5169 V!7905)) (EmptyCell!2753) )
))
(declare-datatypes ((array!11645 0))(
  ( (array!11646 (arr!5534 (Array (_ BitVec 32) ValueCell!2753)) (size!5871 (_ BitVec 32))) )
))
(declare-datatypes ((array!11647 0))(
  ( (array!11648 (arr!5535 (Array (_ BitVec 32) (_ BitVec 64))) (size!5872 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3406 0))(
  ( (LongMapFixedSize!3407 (defaultEntry!4374 Int) (mask!10346 (_ BitVec 32)) (extraKeys!4111 (_ BitVec 32)) (zeroValue!4215 V!7905) (minValue!4215 V!7905) (_size!1752 (_ BitVec 32)) (_keys!6450 array!11647) (_values!4357 array!11645) (_vacant!1752 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3406)

(assert (=> b!235494 (= res!115478 (and (= (size!5871 (_values!4357 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10346 thiss!1504))) (= (size!5872 (_keys!6450 thiss!1504)) (size!5871 (_values!4357 thiss!1504))) (bvsge (mask!10346 thiss!1504) #b00000000000000000000000000000000) (bvsge (extraKeys!4111 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!4111 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun b!235495 () Bool)

(declare-fun e!152938 () Bool)

(declare-fun tp_is_empty!6193 () Bool)

(assert (=> b!235495 (= e!152938 tp_is_empty!6193)))

(declare-fun mapIsEmpty!10487 () Bool)

(declare-fun mapRes!10487 () Bool)

(assert (=> mapIsEmpty!10487 mapRes!10487))

(declare-fun b!235496 () Bool)

(declare-fun res!115477 () Bool)

(assert (=> b!235496 (=> (not res!115477) (not e!152937))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11647 (_ BitVec 32)) Bool)

(assert (=> b!235496 (= res!115477 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6450 thiss!1504) (mask!10346 thiss!1504)))))

(declare-fun b!235497 () Bool)

(assert (=> b!235497 (= e!152937 false)))

(declare-fun lt!119137 () Bool)

(declare-datatypes ((List!3538 0))(
  ( (Nil!3535) (Cons!3534 (h!4186 (_ BitVec 64)) (t!8513 List!3538)) )
))
(declare-fun arrayNoDuplicates!0 (array!11647 (_ BitVec 32) List!3538) Bool)

(assert (=> b!235497 (= lt!119137 (arrayNoDuplicates!0 (_keys!6450 thiss!1504) #b00000000000000000000000000000000 Nil!3535))))

(declare-fun res!115476 () Bool)

(declare-fun e!152936 () Bool)

(assert (=> start!22526 (=> (not res!115476) (not e!152936))))

(declare-fun valid!1345 (LongMapFixedSize!3406) Bool)

(assert (=> start!22526 (= res!115476 (valid!1345 thiss!1504))))

(assert (=> start!22526 e!152936))

(declare-fun e!152941 () Bool)

(assert (=> start!22526 e!152941))

(assert (=> start!22526 true))

(declare-fun mapNonEmpty!10487 () Bool)

(declare-fun tp!22163 () Bool)

(assert (=> mapNonEmpty!10487 (= mapRes!10487 (and tp!22163 e!152938))))

(declare-fun mapRest!10487 () (Array (_ BitVec 32) ValueCell!2753))

(declare-fun mapKey!10487 () (_ BitVec 32))

(declare-fun mapValue!10487 () ValueCell!2753)

(assert (=> mapNonEmpty!10487 (= (arr!5534 (_values!4357 thiss!1504)) (store mapRest!10487 mapKey!10487 mapValue!10487))))

(declare-fun e!152940 () Bool)

(declare-fun array_inv!3651 (array!11647) Bool)

(declare-fun array_inv!3652 (array!11645) Bool)

(assert (=> b!235498 (= e!152941 (and tp!22162 tp_is_empty!6193 (array_inv!3651 (_keys!6450 thiss!1504)) (array_inv!3652 (_values!4357 thiss!1504)) e!152940))))

(declare-fun b!235499 () Bool)

(assert (=> b!235499 (= e!152936 e!152937)))

(declare-fun res!115481 () Bool)

(assert (=> b!235499 (=> (not res!115481) (not e!152937))))

(declare-datatypes ((SeekEntryResult!989 0))(
  ( (MissingZero!989 (index!6126 (_ BitVec 32))) (Found!989 (index!6127 (_ BitVec 32))) (Intermediate!989 (undefined!1801 Bool) (index!6128 (_ BitVec 32)) (x!23793 (_ BitVec 32))) (Undefined!989) (MissingVacant!989 (index!6129 (_ BitVec 32))) )
))
(declare-fun lt!119136 () SeekEntryResult!989)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!235499 (= res!115481 (or (= lt!119136 (MissingZero!989 index!297)) (= lt!119136 (MissingVacant!989 index!297))))))

(declare-fun key!932 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11647 (_ BitVec 32)) SeekEntryResult!989)

(assert (=> b!235499 (= lt!119136 (seekEntryOrOpen!0 key!932 (_keys!6450 thiss!1504) (mask!10346 thiss!1504)))))

(declare-fun b!235500 () Bool)

(declare-fun res!115482 () Bool)

(assert (=> b!235500 (=> (not res!115482) (not e!152936))))

(assert (=> b!235500 (= res!115482 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!235501 () Bool)

(declare-fun res!115479 () Bool)

(assert (=> b!235501 (=> (not res!115479) (not e!152937))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!235501 (= res!115479 (validMask!0 (mask!10346 thiss!1504)))))

(declare-fun b!235502 () Bool)

(declare-fun e!152939 () Bool)

(assert (=> b!235502 (= e!152939 tp_is_empty!6193)))

(declare-fun b!235503 () Bool)

(assert (=> b!235503 (= e!152940 (and e!152939 mapRes!10487))))

(declare-fun condMapEmpty!10487 () Bool)

(declare-fun mapDefault!10487 () ValueCell!2753)

