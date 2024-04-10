; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!90254 () Bool)

(assert start!90254)

(declare-fun b!1033218 () Bool)

(declare-fun b_free!20773 () Bool)

(declare-fun b_next!20773 () Bool)

(assert (=> b!1033218 (= b_free!20773 (not b_next!20773))))

(declare-fun tp!73413 () Bool)

(declare-fun b_and!33241 () Bool)

(assert (=> b!1033218 (= tp!73413 b_and!33241)))

(declare-fun res!690403 () Bool)

(declare-fun e!583956 () Bool)

(assert (=> start!90254 (=> (not res!690403) (not e!583956))))

(declare-datatypes ((V!37531 0))(
  ( (V!37532 (val!12297 Int)) )
))
(declare-datatypes ((ValueCell!11543 0))(
  ( (ValueCellFull!11543 (v!14874 V!37531)) (EmptyCell!11543) )
))
(declare-datatypes ((array!65062 0))(
  ( (array!65063 (arr!31327 (Array (_ BitVec 32) (_ BitVec 64))) (size!31849 (_ BitVec 32))) )
))
(declare-datatypes ((array!65064 0))(
  ( (array!65065 (arr!31328 (Array (_ BitVec 32) ValueCell!11543)) (size!31850 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5680 0))(
  ( (LongMapFixedSize!5681 (defaultEntry!6214 Int) (mask!30059 (_ BitVec 32)) (extraKeys!5946 (_ BitVec 32)) (zeroValue!6050 V!37531) (minValue!6050 V!37531) (_size!2895 (_ BitVec 32)) (_keys!11392 array!65062) (_values!6237 array!65064) (_vacant!2895 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5680)

(declare-fun valid!2146 (LongMapFixedSize!5680) Bool)

(assert (=> start!90254 (= res!690403 (valid!2146 thiss!1427))))

(assert (=> start!90254 e!583956))

(declare-fun e!583953 () Bool)

(assert (=> start!90254 e!583953))

(assert (=> start!90254 true))

(declare-fun mapNonEmpty!38216 () Bool)

(declare-fun mapRes!38216 () Bool)

(declare-fun tp!73412 () Bool)

(declare-fun e!583955 () Bool)

(assert (=> mapNonEmpty!38216 (= mapRes!38216 (and tp!73412 e!583955))))

(declare-fun mapValue!38216 () ValueCell!11543)

(declare-fun mapKey!38216 () (_ BitVec 32))

(declare-fun mapRest!38216 () (Array (_ BitVec 32) ValueCell!11543))

(assert (=> mapNonEmpty!38216 (= (arr!31328 (_values!6237 thiss!1427)) (store mapRest!38216 mapKey!38216 mapValue!38216))))

(declare-fun tp_is_empty!24493 () Bool)

(declare-fun e!583952 () Bool)

(declare-fun array_inv!24239 (array!65062) Bool)

(declare-fun array_inv!24240 (array!65064) Bool)

(assert (=> b!1033218 (= e!583953 (and tp!73413 tp_is_empty!24493 (array_inv!24239 (_keys!11392 thiss!1427)) (array_inv!24240 (_values!6237 thiss!1427)) e!583952))))

(declare-fun b!1033219 () Bool)

(assert (=> b!1033219 (= e!583956 (and (= (size!31850 (_values!6237 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!30059 thiss!1427))) (= (size!31849 (_keys!11392 thiss!1427)) (size!31850 (_values!6237 thiss!1427))) (bvsge (mask!30059 thiss!1427) #b00000000000000000000000000000000) (bvsge (extraKeys!5946 thiss!1427) #b00000000000000000000000000000000) (bvsle (extraKeys!5946 thiss!1427) #b00000000000000000000000000000011) (bvsge (bvand (extraKeys!5946 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsle (bvand (extraKeys!5946 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000011) (not (= (bvand (extraKeys!5946 thiss!1427) #b00000000000000000000000000000010) (bvand (bvand (extraKeys!5946 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000010)))))))

(declare-fun b!1033220 () Bool)

(declare-fun e!583957 () Bool)

(assert (=> b!1033220 (= e!583952 (and e!583957 mapRes!38216))))

(declare-fun condMapEmpty!38216 () Bool)

(declare-fun mapDefault!38216 () ValueCell!11543)

