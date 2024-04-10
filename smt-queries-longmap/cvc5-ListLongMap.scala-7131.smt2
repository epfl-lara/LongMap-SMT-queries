; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!90516 () Bool)

(assert start!90516)

(declare-fun b!1035402 () Bool)

(declare-fun b_free!20839 () Bool)

(declare-fun b_next!20839 () Bool)

(assert (=> b!1035402 (= b_free!20839 (not b_next!20839))))

(declare-fun tp!73644 () Bool)

(declare-fun b_and!33339 () Bool)

(assert (=> b!1035402 (= tp!73644 b_and!33339)))

(declare-fun mapNonEmpty!38349 () Bool)

(declare-fun mapRes!38349 () Bool)

(declare-fun tp!73645 () Bool)

(declare-fun e!585440 () Bool)

(assert (=> mapNonEmpty!38349 (= mapRes!38349 (and tp!73645 e!585440))))

(declare-datatypes ((V!37619 0))(
  ( (V!37620 (val!12330 Int)) )
))
(declare-datatypes ((ValueCell!11576 0))(
  ( (ValueCellFull!11576 (v!14910 V!37619)) (EmptyCell!11576) )
))
(declare-fun mapRest!38349 () (Array (_ BitVec 32) ValueCell!11576))

(declare-fun mapValue!38349 () ValueCell!11576)

(declare-datatypes ((array!65212 0))(
  ( (array!65213 (arr!31393 (Array (_ BitVec 32) (_ BitVec 64))) (size!31921 (_ BitVec 32))) )
))
(declare-datatypes ((array!65214 0))(
  ( (array!65215 (arr!31394 (Array (_ BitVec 32) ValueCell!11576)) (size!31922 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5746 0))(
  ( (LongMapFixedSize!5747 (defaultEntry!6251 Int) (mask!30136 (_ BitVec 32)) (extraKeys!5981 (_ BitVec 32)) (zeroValue!6085 V!37619) (minValue!6087 V!37619) (_size!2928 (_ BitVec 32)) (_keys!11438 array!65212) (_values!6274 array!65214) (_vacant!2928 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5746)

(declare-fun mapKey!38349 () (_ BitVec 32))

(assert (=> mapNonEmpty!38349 (= (arr!31394 (_values!6274 thiss!1427)) (store mapRest!38349 mapKey!38349 mapValue!38349))))

(declare-fun b!1035400 () Bool)

(declare-fun e!585445 () Bool)

(declare-fun tp_is_empty!24559 () Bool)

(assert (=> b!1035400 (= e!585445 tp_is_empty!24559)))

(declare-fun b!1035401 () Bool)

(declare-fun res!691341 () Bool)

(declare-fun e!585441 () Bool)

(assert (=> b!1035401 (=> (not res!691341) (not e!585441))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1035401 (= res!691341 (and (= key!909 (bvneg key!909)) (not (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!585442 () Bool)

(declare-fun e!585444 () Bool)

(declare-fun array_inv!24283 (array!65212) Bool)

(declare-fun array_inv!24284 (array!65214) Bool)

(assert (=> b!1035402 (= e!585442 (and tp!73644 tp_is_empty!24559 (array_inv!24283 (_keys!11438 thiss!1427)) (array_inv!24284 (_values!6274 thiss!1427)) e!585444))))

(declare-fun mapIsEmpty!38349 () Bool)

(assert (=> mapIsEmpty!38349 mapRes!38349))

(declare-fun res!691342 () Bool)

(assert (=> start!90516 (=> (not res!691342) (not e!585441))))

(declare-fun valid!2170 (LongMapFixedSize!5746) Bool)

(assert (=> start!90516 (= res!691342 (valid!2170 thiss!1427))))

(assert (=> start!90516 e!585441))

(assert (=> start!90516 e!585442))

(assert (=> start!90516 true))

(declare-fun b!1035403 () Bool)

(assert (=> b!1035403 (= e!585444 (and e!585445 mapRes!38349))))

(declare-fun condMapEmpty!38349 () Bool)

(declare-fun mapDefault!38349 () ValueCell!11576)

