; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!19914 () Bool)

(assert start!19914)

(declare-fun b!195435 () Bool)

(declare-fun b_free!4723 () Bool)

(declare-fun b_next!4723 () Bool)

(assert (=> b!195435 (= b_free!4723 (not b_next!4723))))

(declare-fun tp!17044 () Bool)

(declare-fun b_and!11469 () Bool)

(assert (=> b!195435 (= tp!17044 b_and!11469)))

(declare-fun mapIsEmpty!7780 () Bool)

(declare-fun mapRes!7780 () Bool)

(assert (=> mapIsEmpty!7780 mapRes!7780))

(declare-fun b!195432 () Bool)

(declare-fun res!92266 () Bool)

(declare-fun e!128535 () Bool)

(assert (=> b!195432 (=> (not res!92266) (not e!128535))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!195432 (= res!92266 (not (= key!828 (bvneg key!828))))))

(declare-fun b!195433 () Bool)

(declare-datatypes ((SeekEntryResult!695 0))(
  ( (MissingZero!695 (index!4950 (_ BitVec 32))) (Found!695 (index!4951 (_ BitVec 32))) (Intermediate!695 (undefined!1507 Bool) (index!4952 (_ BitVec 32)) (x!20734 (_ BitVec 32))) (Undefined!695) (MissingVacant!695 (index!4953 (_ BitVec 32))) )
))
(declare-fun lt!97451 () SeekEntryResult!695)

(assert (=> b!195433 (= e!128535 (and (not (is-Undefined!695 lt!97451)) (not (is-MissingVacant!695 lt!97451)) (not (is-MissingZero!695 lt!97451)) (not (is-Found!695 lt!97451))))))

(declare-datatypes ((V!5641 0))(
  ( (V!5642 (val!2292 Int)) )
))
(declare-datatypes ((ValueCell!1904 0))(
  ( (ValueCellFull!1904 (v!4260 V!5641)) (EmptyCell!1904) )
))
(declare-datatypes ((array!8243 0))(
  ( (array!8244 (arr!3879 (Array (_ BitVec 32) (_ BitVec 64))) (size!4204 (_ BitVec 32))) )
))
(declare-datatypes ((array!8245 0))(
  ( (array!8246 (arr!3880 (Array (_ BitVec 32) ValueCell!1904)) (size!4205 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2716 0))(
  ( (LongMapFixedSize!2717 (defaultEntry!3972 Int) (mask!9245 (_ BitVec 32)) (extraKeys!3709 (_ BitVec 32)) (zeroValue!3813 V!5641) (minValue!3813 V!5641) (_size!1407 (_ BitVec 32)) (_keys!5970 array!8243) (_values!3955 array!8245) (_vacant!1407 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2716)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!8243 (_ BitVec 32)) SeekEntryResult!695)

(assert (=> b!195433 (= lt!97451 (seekEntryOrOpen!0 key!828 (_keys!5970 thiss!1248) (mask!9245 thiss!1248)))))

(declare-fun res!92267 () Bool)

(assert (=> start!19914 (=> (not res!92267) (not e!128535))))

(declare-fun valid!1114 (LongMapFixedSize!2716) Bool)

(assert (=> start!19914 (= res!92267 (valid!1114 thiss!1248))))

(assert (=> start!19914 e!128535))

(declare-fun e!128530 () Bool)

(assert (=> start!19914 e!128530))

(assert (=> start!19914 true))

(declare-fun b!195434 () Bool)

(declare-fun e!128533 () Bool)

(declare-fun tp_is_empty!4495 () Bool)

(assert (=> b!195434 (= e!128533 tp_is_empty!4495)))

(declare-fun mapNonEmpty!7780 () Bool)

(declare-fun tp!17043 () Bool)

(assert (=> mapNonEmpty!7780 (= mapRes!7780 (and tp!17043 e!128533))))

(declare-fun mapKey!7780 () (_ BitVec 32))

(declare-fun mapRest!7780 () (Array (_ BitVec 32) ValueCell!1904))

(declare-fun mapValue!7780 () ValueCell!1904)

(assert (=> mapNonEmpty!7780 (= (arr!3880 (_values!3955 thiss!1248)) (store mapRest!7780 mapKey!7780 mapValue!7780))))

(declare-fun e!128531 () Bool)

(declare-fun array_inv!2517 (array!8243) Bool)

(declare-fun array_inv!2518 (array!8245) Bool)

(assert (=> b!195435 (= e!128530 (and tp!17044 tp_is_empty!4495 (array_inv!2517 (_keys!5970 thiss!1248)) (array_inv!2518 (_values!3955 thiss!1248)) e!128531))))

(declare-fun b!195436 () Bool)

(declare-fun e!128532 () Bool)

(assert (=> b!195436 (= e!128531 (and e!128532 mapRes!7780))))

(declare-fun condMapEmpty!7780 () Bool)

(declare-fun mapDefault!7780 () ValueCell!1904)

