; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16078 () Bool)

(assert start!16078)

(declare-fun b!159695 () Bool)

(declare-fun b_free!3539 () Bool)

(declare-fun b_next!3539 () Bool)

(assert (=> b!159695 (= b_free!3539 (not b_next!3539))))

(declare-fun tp!13186 () Bool)

(declare-fun b_and!9953 () Bool)

(assert (=> b!159695 (= tp!13186 b_and!9953)))

(declare-fun b!159693 () Bool)

(declare-fun res!75491 () Bool)

(declare-fun e!104498 () Bool)

(assert (=> b!159693 (=> (not res!75491) (not e!104498))))

(declare-datatypes ((V!4101 0))(
  ( (V!4102 (val!1715 Int)) )
))
(declare-datatypes ((ValueCell!1327 0))(
  ( (ValueCellFull!1327 (v!3580 V!4101)) (EmptyCell!1327) )
))
(declare-datatypes ((array!5761 0))(
  ( (array!5762 (arr!2725 (Array (_ BitVec 32) (_ BitVec 64))) (size!3009 (_ BitVec 32))) )
))
(declare-datatypes ((array!5763 0))(
  ( (array!5764 (arr!2726 (Array (_ BitVec 32) ValueCell!1327)) (size!3010 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1562 0))(
  ( (LongMapFixedSize!1563 (defaultEntry!3223 Int) (mask!7777 (_ BitVec 32)) (extraKeys!2964 (_ BitVec 32)) (zeroValue!3066 V!4101) (minValue!3066 V!4101) (_size!830 (_ BitVec 32)) (_keys!5024 array!5761) (_values!3206 array!5763) (_vacant!830 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1562)

(assert (=> b!159693 (= res!75491 (and (= (size!3010 (_values!3206 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!7777 thiss!1248))) (= (size!3009 (_keys!5024 thiss!1248)) (size!3010 (_values!3206 thiss!1248))) (bvsge (mask!7777 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!2964 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!2964 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!159694 () Bool)

(declare-fun res!75493 () Bool)

(assert (=> b!159694 (=> (not res!75493) (not e!104498))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!159694 (= res!75493 (not (= key!828 (bvneg key!828))))))

(declare-fun e!104501 () Bool)

(declare-fun e!104499 () Bool)

(declare-fun tp_is_empty!3341 () Bool)

(declare-fun array_inv!1733 (array!5761) Bool)

(declare-fun array_inv!1734 (array!5763) Bool)

(assert (=> b!159695 (= e!104501 (and tp!13186 tp_is_empty!3341 (array_inv!1733 (_keys!5024 thiss!1248)) (array_inv!1734 (_values!3206 thiss!1248)) e!104499))))

(declare-fun res!75492 () Bool)

(assert (=> start!16078 (=> (not res!75492) (not e!104498))))

(declare-fun valid!729 (LongMapFixedSize!1562) Bool)

(assert (=> start!16078 (= res!75492 (valid!729 thiss!1248))))

(assert (=> start!16078 e!104498))

(assert (=> start!16078 e!104501))

(assert (=> start!16078 true))

(declare-fun b!159696 () Bool)

(declare-fun res!75495 () Bool)

(assert (=> b!159696 (=> (not res!75495) (not e!104498))))

(declare-datatypes ((SeekEntryResult!316 0))(
  ( (MissingZero!316 (index!3432 (_ BitVec 32))) (Found!316 (index!3433 (_ BitVec 32))) (Intermediate!316 (undefined!1128 Bool) (index!3434 (_ BitVec 32)) (x!17628 (_ BitVec 32))) (Undefined!316) (MissingVacant!316 (index!3435 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!5761 (_ BitVec 32)) SeekEntryResult!316)

(assert (=> b!159696 (= res!75495 (is-Undefined!316 (seekEntryOrOpen!0 key!828 (_keys!5024 thiss!1248) (mask!7777 thiss!1248))))))

(declare-fun b!159697 () Bool)

(declare-fun e!104497 () Bool)

(declare-fun mapRes!5699 () Bool)

(assert (=> b!159697 (= e!104499 (and e!104497 mapRes!5699))))

(declare-fun condMapEmpty!5699 () Bool)

(declare-fun mapDefault!5699 () ValueCell!1327)

