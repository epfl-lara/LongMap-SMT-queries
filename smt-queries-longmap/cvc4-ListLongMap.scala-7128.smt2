; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!90462 () Bool)

(assert start!90462)

(declare-fun b!1035096 () Bool)

(declare-fun b_free!20825 () Bool)

(declare-fun b_next!20825 () Bool)

(assert (=> b!1035096 (= b_free!20825 (not b_next!20825))))

(declare-fun tp!73592 () Bool)

(declare-fun b_and!33325 () Bool)

(assert (=> b!1035096 (= tp!73592 b_and!33325)))

(declare-fun res!691197 () Bool)

(declare-fun e!585225 () Bool)

(assert (=> start!90462 (=> (not res!691197) (not e!585225))))

(declare-datatypes ((V!37599 0))(
  ( (V!37600 (val!12323 Int)) )
))
(declare-datatypes ((ValueCell!11569 0))(
  ( (ValueCellFull!11569 (v!14903 V!37599)) (EmptyCell!11569) )
))
(declare-datatypes ((array!65178 0))(
  ( (array!65179 (arr!31379 (Array (_ BitVec 32) (_ BitVec 64))) (size!31905 (_ BitVec 32))) )
))
(declare-datatypes ((array!65180 0))(
  ( (array!65181 (arr!31380 (Array (_ BitVec 32) ValueCell!11569)) (size!31906 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5732 0))(
  ( (LongMapFixedSize!5733 (defaultEntry!6244 Int) (mask!30118 (_ BitVec 32)) (extraKeys!5974 (_ BitVec 32)) (zeroValue!6078 V!37599) (minValue!6080 V!37599) (_size!2921 (_ BitVec 32)) (_keys!11429 array!65178) (_values!6267 array!65180) (_vacant!2921 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5732)

(declare-fun valid!2165 (LongMapFixedSize!5732) Bool)

(assert (=> start!90462 (= res!691197 (valid!2165 thiss!1427))))

(assert (=> start!90462 e!585225))

(declare-fun e!585226 () Bool)

(assert (=> start!90462 e!585226))

(assert (=> start!90462 true))

(declare-fun mapNonEmpty!38317 () Bool)

(declare-fun mapRes!38317 () Bool)

(declare-fun tp!73591 () Bool)

(declare-fun e!585224 () Bool)

(assert (=> mapNonEmpty!38317 (= mapRes!38317 (and tp!73591 e!585224))))

(declare-fun mapRest!38317 () (Array (_ BitVec 32) ValueCell!11569))

(declare-fun mapValue!38317 () ValueCell!11569)

(declare-fun mapKey!38317 () (_ BitVec 32))

(assert (=> mapNonEmpty!38317 (= (arr!31380 (_values!6267 thiss!1427)) (store mapRest!38317 mapKey!38317 mapValue!38317))))

(declare-fun tp_is_empty!24545 () Bool)

(declare-fun e!585228 () Bool)

(declare-fun array_inv!24273 (array!65178) Bool)

(declare-fun array_inv!24274 (array!65180) Bool)

(assert (=> b!1035096 (= e!585226 (and tp!73592 tp_is_empty!24545 (array_inv!24273 (_keys!11429 thiss!1427)) (array_inv!24274 (_values!6267 thiss!1427)) e!585228))))

(declare-fun b!1035097 () Bool)

(declare-fun e!585227 () Bool)

(assert (=> b!1035097 (= e!585228 (and e!585227 mapRes!38317))))

(declare-fun condMapEmpty!38317 () Bool)

(declare-fun mapDefault!38317 () ValueCell!11569)

