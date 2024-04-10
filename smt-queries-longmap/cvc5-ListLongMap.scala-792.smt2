; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!18836 () Bool)

(assert start!18836)

(declare-fun b!186138 () Bool)

(declare-fun b_free!4591 () Bool)

(declare-fun b_next!4591 () Bool)

(assert (=> b!186138 (= b_free!4591 (not b_next!4591))))

(declare-fun tp!16575 () Bool)

(declare-fun b_and!11195 () Bool)

(assert (=> b!186138 (= tp!16575 b_and!11195)))

(declare-fun tp_is_empty!4363 () Bool)

(declare-fun e!122508 () Bool)

(declare-datatypes ((V!5465 0))(
  ( (V!5466 (val!2226 Int)) )
))
(declare-datatypes ((ValueCell!1838 0))(
  ( (ValueCellFull!1838 (v!4138 V!5465)) (EmptyCell!1838) )
))
(declare-datatypes ((array!7937 0))(
  ( (array!7938 (arr!3747 (Array (_ BitVec 32) (_ BitVec 64))) (size!4063 (_ BitVec 32))) )
))
(declare-datatypes ((array!7939 0))(
  ( (array!7940 (arr!3748 (Array (_ BitVec 32) ValueCell!1838)) (size!4064 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2584 0))(
  ( (LongMapFixedSize!2585 (defaultEntry!3797 Int) (mask!8919 (_ BitVec 32)) (extraKeys!3534 (_ BitVec 32)) (zeroValue!3638 V!5465) (minValue!3638 V!5465) (_size!1341 (_ BitVec 32)) (_keys!5739 array!7937) (_values!3780 array!7939) (_vacant!1341 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2584)

(declare-fun e!122501 () Bool)

(declare-fun array_inv!2423 (array!7937) Bool)

(declare-fun array_inv!2424 (array!7939) Bool)

(assert (=> b!186138 (= e!122501 (and tp!16575 tp_is_empty!4363 (array_inv!2423 (_keys!5739 thiss!1248)) (array_inv!2424 (_values!3780 thiss!1248)) e!122508))))

(declare-fun mapNonEmpty!7509 () Bool)

(declare-fun mapRes!7509 () Bool)

(declare-fun tp!16574 () Bool)

(declare-fun e!122506 () Bool)

(assert (=> mapNonEmpty!7509 (= mapRes!7509 (and tp!16574 e!122506))))

(declare-fun mapRest!7509 () (Array (_ BitVec 32) ValueCell!1838))

(declare-fun mapValue!7509 () ValueCell!1838)

(declare-fun mapKey!7509 () (_ BitVec 32))

(assert (=> mapNonEmpty!7509 (= (arr!3748 (_values!3780 thiss!1248)) (store mapRest!7509 mapKey!7509 mapValue!7509))))

(declare-fun res!88055 () Bool)

(declare-fun e!122504 () Bool)

(assert (=> start!18836 (=> (not res!88055) (not e!122504))))

(declare-fun valid!1065 (LongMapFixedSize!2584) Bool)

(assert (=> start!18836 (= res!88055 (valid!1065 thiss!1248))))

(assert (=> start!18836 e!122504))

(assert (=> start!18836 e!122501))

(assert (=> start!18836 true))

(declare-fun b!186139 () Bool)

(declare-fun e!122507 () Bool)

(assert (=> b!186139 (= e!122508 (and e!122507 mapRes!7509))))

(declare-fun condMapEmpty!7509 () Bool)

(declare-fun mapDefault!7509 () ValueCell!1838)

