; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!90198 () Bool)

(assert start!90198)

(declare-fun b!1032828 () Bool)

(declare-fun b_free!20749 () Bool)

(declare-fun b_next!20749 () Bool)

(assert (=> b!1032828 (= b_free!20749 (not b_next!20749))))

(declare-fun tp!73332 () Bool)

(declare-fun b_and!33217 () Bool)

(assert (=> b!1032828 (= tp!73332 b_and!33217)))

(declare-fun b!1032826 () Bool)

(declare-fun res!690224 () Bool)

(declare-fun e!583655 () Bool)

(assert (=> b!1032826 (=> (not res!690224) (not e!583655))))

(declare-datatypes ((V!37499 0))(
  ( (V!37500 (val!12285 Int)) )
))
(declare-datatypes ((ValueCell!11531 0))(
  ( (ValueCellFull!11531 (v!14862 V!37499)) (EmptyCell!11531) )
))
(declare-datatypes ((array!65010 0))(
  ( (array!65011 (arr!31303 (Array (_ BitVec 32) (_ BitVec 64))) (size!31823 (_ BitVec 32))) )
))
(declare-datatypes ((array!65012 0))(
  ( (array!65013 (arr!31304 (Array (_ BitVec 32) ValueCell!11531)) (size!31824 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5656 0))(
  ( (LongMapFixedSize!5657 (defaultEntry!6202 Int) (mask!30035 (_ BitVec 32)) (extraKeys!5934 (_ BitVec 32)) (zeroValue!6038 V!37499) (minValue!6038 V!37499) (_size!2883 (_ BitVec 32)) (_keys!11378 array!65010) (_values!6225 array!65012) (_vacant!2883 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5656)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1032826 (= res!690224 (validMask!0 (mask!30035 thiss!1427)))))

(declare-fun b!1032827 () Bool)

(declare-fun e!583654 () Bool)

(declare-fun tp_is_empty!24469 () Bool)

(assert (=> b!1032827 (= e!583654 tp_is_empty!24469)))

(declare-fun res!690223 () Bool)

(assert (=> start!90198 (=> (not res!690223) (not e!583655))))

(declare-fun valid!2139 (LongMapFixedSize!5656) Bool)

(assert (=> start!90198 (= res!690223 (valid!2139 thiss!1427))))

(assert (=> start!90198 e!583655))

(declare-fun e!583659 () Bool)

(assert (=> start!90198 e!583659))

(assert (=> start!90198 true))

(declare-fun e!583657 () Bool)

(declare-fun array_inv!24225 (array!65010) Bool)

(declare-fun array_inv!24226 (array!65012) Bool)

(assert (=> b!1032828 (= e!583659 (and tp!73332 tp_is_empty!24469 (array_inv!24225 (_keys!11378 thiss!1427)) (array_inv!24226 (_values!6225 thiss!1427)) e!583657))))

(declare-fun b!1032829 () Bool)

(declare-fun res!690222 () Bool)

(assert (=> b!1032829 (=> (not res!690222) (not e!583655))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1032829 (= res!690222 (and (= key!909 (bvneg key!909)) (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapNonEmpty!38172 () Bool)

(declare-fun mapRes!38172 () Bool)

(declare-fun tp!73333 () Bool)

(assert (=> mapNonEmpty!38172 (= mapRes!38172 (and tp!73333 e!583654))))

(declare-fun mapValue!38172 () ValueCell!11531)

(declare-fun mapRest!38172 () (Array (_ BitVec 32) ValueCell!11531))

(declare-fun mapKey!38172 () (_ BitVec 32))

(assert (=> mapNonEmpty!38172 (= (arr!31304 (_values!6225 thiss!1427)) (store mapRest!38172 mapKey!38172 mapValue!38172))))

(declare-fun b!1032830 () Bool)

(declare-fun e!583658 () Bool)

(assert (=> b!1032830 (= e!583657 (and e!583658 mapRes!38172))))

(declare-fun condMapEmpty!38172 () Bool)

(declare-fun mapDefault!38172 () ValueCell!11531)

