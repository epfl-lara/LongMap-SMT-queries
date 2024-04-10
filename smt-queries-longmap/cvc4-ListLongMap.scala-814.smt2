; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!19918 () Bool)

(assert start!19918)

(declare-fun b!195469 () Bool)

(declare-fun b_free!4727 () Bool)

(declare-fun b_next!4727 () Bool)

(assert (=> b!195469 (= b_free!4727 (not b_next!4727))))

(declare-fun tp!17055 () Bool)

(declare-fun b_and!11473 () Bool)

(assert (=> b!195469 (= tp!17055 b_and!11473)))

(declare-fun b!195468 () Bool)

(declare-fun e!128566 () Bool)

(declare-datatypes ((SeekEntryResult!697 0))(
  ( (MissingZero!697 (index!4958 (_ BitVec 32))) (Found!697 (index!4959 (_ BitVec 32))) (Intermediate!697 (undefined!1509 Bool) (index!4960 (_ BitVec 32)) (x!20736 (_ BitVec 32))) (Undefined!697) (MissingVacant!697 (index!4961 (_ BitVec 32))) )
))
(declare-fun lt!97457 () SeekEntryResult!697)

(assert (=> b!195468 (= e!128566 (and (not (is-Undefined!697 lt!97457)) (not (is-MissingVacant!697 lt!97457)) (not (is-MissingZero!697 lt!97457)) (not (is-Found!697 lt!97457))))))

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((V!5645 0))(
  ( (V!5646 (val!2294 Int)) )
))
(declare-datatypes ((ValueCell!1906 0))(
  ( (ValueCellFull!1906 (v!4262 V!5645)) (EmptyCell!1906) )
))
(declare-datatypes ((array!8251 0))(
  ( (array!8252 (arr!3883 (Array (_ BitVec 32) (_ BitVec 64))) (size!4208 (_ BitVec 32))) )
))
(declare-datatypes ((array!8253 0))(
  ( (array!8254 (arr!3884 (Array (_ BitVec 32) ValueCell!1906)) (size!4209 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2720 0))(
  ( (LongMapFixedSize!2721 (defaultEntry!3974 Int) (mask!9247 (_ BitVec 32)) (extraKeys!3711 (_ BitVec 32)) (zeroValue!3815 V!5645) (minValue!3815 V!5645) (_size!1409 (_ BitVec 32)) (_keys!5972 array!8251) (_values!3957 array!8253) (_vacant!1409 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2720)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!8251 (_ BitVec 32)) SeekEntryResult!697)

(assert (=> b!195468 (= lt!97457 (seekEntryOrOpen!0 key!828 (_keys!5972 thiss!1248) (mask!9247 thiss!1248)))))

(declare-fun tp_is_empty!4499 () Bool)

(declare-fun e!128570 () Bool)

(declare-fun e!128571 () Bool)

(declare-fun array_inv!2521 (array!8251) Bool)

(declare-fun array_inv!2522 (array!8253) Bool)

(assert (=> b!195469 (= e!128570 (and tp!17055 tp_is_empty!4499 (array_inv!2521 (_keys!5972 thiss!1248)) (array_inv!2522 (_values!3957 thiss!1248)) e!128571))))

(declare-fun b!195470 () Bool)

(declare-fun e!128568 () Bool)

(declare-fun mapRes!7786 () Bool)

(assert (=> b!195470 (= e!128571 (and e!128568 mapRes!7786))))

(declare-fun condMapEmpty!7786 () Bool)

(declare-fun mapDefault!7786 () ValueCell!1906)

