; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!90520 () Bool)

(assert start!90520)

(declare-fun b!1035443 () Bool)

(declare-fun b_free!20843 () Bool)

(declare-fun b_next!20843 () Bool)

(assert (=> b!1035443 (= b_free!20843 (not b_next!20843))))

(declare-fun tp!73657 () Bool)

(declare-fun b_and!33343 () Bool)

(assert (=> b!1035443 (= tp!73657 b_and!33343)))

(declare-fun res!691359 () Bool)

(declare-fun e!585477 () Bool)

(assert (=> start!90520 (=> (not res!691359) (not e!585477))))

(declare-datatypes ((V!37623 0))(
  ( (V!37624 (val!12332 Int)) )
))
(declare-datatypes ((ValueCell!11578 0))(
  ( (ValueCellFull!11578 (v!14912 V!37623)) (EmptyCell!11578) )
))
(declare-datatypes ((array!65220 0))(
  ( (array!65221 (arr!31397 (Array (_ BitVec 32) (_ BitVec 64))) (size!31925 (_ BitVec 32))) )
))
(declare-datatypes ((array!65222 0))(
  ( (array!65223 (arr!31398 (Array (_ BitVec 32) ValueCell!11578)) (size!31926 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5750 0))(
  ( (LongMapFixedSize!5751 (defaultEntry!6253 Int) (mask!30138 (_ BitVec 32)) (extraKeys!5983 (_ BitVec 32)) (zeroValue!6087 V!37623) (minValue!6089 V!37623) (_size!2930 (_ BitVec 32)) (_keys!11440 array!65220) (_values!6276 array!65222) (_vacant!2930 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5750)

(declare-fun valid!2172 (LongMapFixedSize!5750) Bool)

(assert (=> start!90520 (= res!691359 (valid!2172 thiss!1427))))

(assert (=> start!90520 e!585477))

(declare-fun e!585479 () Bool)

(assert (=> start!90520 e!585479))

(assert (=> start!90520 true))

(declare-fun b!1035442 () Bool)

(declare-fun res!691360 () Bool)

(assert (=> b!1035442 (=> (not res!691360) (not e!585477))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1035442 (= res!691360 (and (= key!909 (bvneg key!909)) (not (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapIsEmpty!38355 () Bool)

(declare-fun mapRes!38355 () Bool)

(assert (=> mapIsEmpty!38355 mapRes!38355))

(declare-fun mapNonEmpty!38355 () Bool)

(declare-fun tp!73656 () Bool)

(declare-fun e!585478 () Bool)

(assert (=> mapNonEmpty!38355 (= mapRes!38355 (and tp!73656 e!585478))))

(declare-fun mapKey!38355 () (_ BitVec 32))

(declare-fun mapValue!38355 () ValueCell!11578)

(declare-fun mapRest!38355 () (Array (_ BitVec 32) ValueCell!11578))

(assert (=> mapNonEmpty!38355 (= (arr!31398 (_values!6276 thiss!1427)) (store mapRest!38355 mapKey!38355 mapValue!38355))))

(declare-fun e!585476 () Bool)

(declare-fun tp_is_empty!24563 () Bool)

(declare-fun array_inv!24287 (array!65220) Bool)

(declare-fun array_inv!24288 (array!65222) Bool)

(assert (=> b!1035443 (= e!585479 (and tp!73657 tp_is_empty!24563 (array_inv!24287 (_keys!11440 thiss!1427)) (array_inv!24288 (_values!6276 thiss!1427)) e!585476))))

(declare-fun b!1035444 () Bool)

(declare-fun res!691361 () Bool)

(assert (=> b!1035444 (=> (not res!691361) (not e!585477))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1035444 (= res!691361 (validMask!0 (mask!30138 thiss!1427)))))

(declare-fun b!1035445 () Bool)

(declare-fun e!585480 () Bool)

(assert (=> b!1035445 (= e!585476 (and e!585480 mapRes!38355))))

(declare-fun condMapEmpty!38355 () Bool)

(declare-fun mapDefault!38355 () ValueCell!11578)

