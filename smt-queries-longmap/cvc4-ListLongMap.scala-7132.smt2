; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!90526 () Bool)

(assert start!90526)

(declare-fun b!1035506 () Bool)

(declare-fun b_free!20849 () Bool)

(declare-fun b_next!20849 () Bool)

(assert (=> b!1035506 (= b_free!20849 (not b_next!20849))))

(declare-fun tp!73675 () Bool)

(declare-fun b_and!33349 () Bool)

(assert (=> b!1035506 (= tp!73675 b_and!33349)))

(declare-fun b!1035505 () Bool)

(declare-fun e!585534 () Bool)

(declare-datatypes ((V!37631 0))(
  ( (V!37632 (val!12335 Int)) )
))
(declare-datatypes ((ValueCell!11581 0))(
  ( (ValueCellFull!11581 (v!14915 V!37631)) (EmptyCell!11581) )
))
(declare-datatypes ((array!65232 0))(
  ( (array!65233 (arr!31403 (Array (_ BitVec 32) (_ BitVec 64))) (size!31931 (_ BitVec 32))) )
))
(declare-datatypes ((array!65234 0))(
  ( (array!65235 (arr!31404 (Array (_ BitVec 32) ValueCell!11581)) (size!31932 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5756 0))(
  ( (LongMapFixedSize!5757 (defaultEntry!6256 Int) (mask!30143 (_ BitVec 32)) (extraKeys!5986 (_ BitVec 32)) (zeroValue!6090 V!37631) (minValue!6092 V!37631) (_size!2933 (_ BitVec 32)) (_keys!11443 array!65232) (_values!6279 array!65234) (_vacant!2933 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5756)

(assert (=> b!1035505 (= e!585534 (and (= (size!31932 (_values!6279 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!30143 thiss!1427))) (= (size!31931 (_keys!11443 thiss!1427)) (size!31932 (_values!6279 thiss!1427))) (bvsge (mask!30143 thiss!1427) #b00000000000000000000000000000000) (bvsge (extraKeys!5986 thiss!1427) #b00000000000000000000000000000000) (bvsle (extraKeys!5986 thiss!1427) #b00000000000000000000000000000011) (bvsge (bvand (extraKeys!5986 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsgt (bvand (extraKeys!5986 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!38364 () Bool)

(declare-fun mapRes!38364 () Bool)

(assert (=> mapIsEmpty!38364 mapRes!38364))

(declare-fun e!585535 () Bool)

(declare-fun tp_is_empty!24569 () Bool)

(declare-fun e!585531 () Bool)

(declare-fun array_inv!24291 (array!65232) Bool)

(declare-fun array_inv!24292 (array!65234) Bool)

(assert (=> b!1035506 (= e!585535 (and tp!73675 tp_is_empty!24569 (array_inv!24291 (_keys!11443 thiss!1427)) (array_inv!24292 (_values!6279 thiss!1427)) e!585531))))

(declare-fun res!691386 () Bool)

(assert (=> start!90526 (=> (not res!691386) (not e!585534))))

(declare-fun valid!2174 (LongMapFixedSize!5756) Bool)

(assert (=> start!90526 (= res!691386 (valid!2174 thiss!1427))))

(assert (=> start!90526 e!585534))

(assert (=> start!90526 e!585535))

(assert (=> start!90526 true))

(declare-fun b!1035507 () Bool)

(declare-fun e!585532 () Bool)

(assert (=> b!1035507 (= e!585532 tp_is_empty!24569)))

(declare-fun b!1035508 () Bool)

(declare-fun e!585530 () Bool)

(assert (=> b!1035508 (= e!585530 tp_is_empty!24569)))

(declare-fun b!1035509 () Bool)

(assert (=> b!1035509 (= e!585531 (and e!585530 mapRes!38364))))

(declare-fun condMapEmpty!38364 () Bool)

(declare-fun mapDefault!38364 () ValueCell!11581)

