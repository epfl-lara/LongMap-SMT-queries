; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!90252 () Bool)

(assert start!90252)

(declare-fun b!1033068 () Bool)

(declare-fun b_free!20773 () Bool)

(declare-fun b_next!20773 () Bool)

(assert (=> b!1033068 (= b_free!20773 (not b_next!20773))))

(declare-fun tp!73412 () Bool)

(declare-fun b_and!33215 () Bool)

(assert (=> b!1033068 (= tp!73412 b_and!33215)))

(declare-fun mapNonEmpty!38216 () Bool)

(declare-fun mapRes!38216 () Bool)

(declare-fun tp!73413 () Bool)

(declare-fun e!583866 () Bool)

(assert (=> mapNonEmpty!38216 (= mapRes!38216 (and tp!73413 e!583866))))

(declare-fun mapKey!38216 () (_ BitVec 32))

(declare-datatypes ((V!37531 0))(
  ( (V!37532 (val!12297 Int)) )
))
(declare-datatypes ((ValueCell!11543 0))(
  ( (ValueCellFull!11543 (v!14873 V!37531)) (EmptyCell!11543) )
))
(declare-fun mapRest!38216 () (Array (_ BitVec 32) ValueCell!11543))

(declare-datatypes ((array!65001 0))(
  ( (array!65002 (arr!31296 (Array (_ BitVec 32) (_ BitVec 64))) (size!31820 (_ BitVec 32))) )
))
(declare-datatypes ((array!65003 0))(
  ( (array!65004 (arr!31297 (Array (_ BitVec 32) ValueCell!11543)) (size!31821 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5680 0))(
  ( (LongMapFixedSize!5681 (defaultEntry!6214 Int) (mask!30054 (_ BitVec 32)) (extraKeys!5946 (_ BitVec 32)) (zeroValue!6050 V!37531) (minValue!6050 V!37531) (_size!2895 (_ BitVec 32)) (_keys!11388 array!65001) (_values!6237 array!65003) (_vacant!2895 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5680)

(declare-fun mapValue!38216 () ValueCell!11543)

(assert (=> mapNonEmpty!38216 (= (arr!31297 (_values!6237 thiss!1427)) (store mapRest!38216 mapKey!38216 mapValue!38216))))

(declare-fun b!1033067 () Bool)

(declare-fun e!583865 () Bool)

(declare-fun tp_is_empty!24493 () Bool)

(assert (=> b!1033067 (= e!583865 tp_is_empty!24493)))

(declare-fun res!690335 () Bool)

(declare-fun e!583864 () Bool)

(assert (=> start!90252 (=> (not res!690335) (not e!583864))))

(declare-fun valid!2137 (LongMapFixedSize!5680) Bool)

(assert (=> start!90252 (= res!690335 (valid!2137 thiss!1427))))

(assert (=> start!90252 e!583864))

(declare-fun e!583862 () Bool)

(assert (=> start!90252 e!583862))

(assert (=> start!90252 true))

(declare-fun e!583863 () Bool)

(declare-fun array_inv!24215 (array!65001) Bool)

(declare-fun array_inv!24216 (array!65003) Bool)

(assert (=> b!1033068 (= e!583862 (and tp!73412 tp_is_empty!24493 (array_inv!24215 (_keys!11388 thiss!1427)) (array_inv!24216 (_values!6237 thiss!1427)) e!583863))))

(declare-fun b!1033069 () Bool)

(assert (=> b!1033069 (= e!583863 (and e!583865 mapRes!38216))))

(declare-fun condMapEmpty!38216 () Bool)

(declare-fun mapDefault!38216 () ValueCell!11543)

(assert (=> b!1033069 (= condMapEmpty!38216 (= (arr!31297 (_values!6237 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11543)) mapDefault!38216)))))

(declare-fun b!1033070 () Bool)

(declare-fun res!690336 () Bool)

(assert (=> b!1033070 (=> (not res!690336) (not e!583864))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1033070 (= res!690336 (and (= key!909 (bvneg key!909)) (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapIsEmpty!38216 () Bool)

(assert (=> mapIsEmpty!38216 mapRes!38216))

(declare-fun b!1033071 () Bool)

(declare-fun res!690337 () Bool)

(assert (=> b!1033071 (=> (not res!690337) (not e!583864))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1033071 (= res!690337 (validMask!0 (mask!30054 thiss!1427)))))

(declare-fun b!1033072 () Bool)

(assert (=> b!1033072 (= e!583866 tp_is_empty!24493)))

(declare-fun b!1033073 () Bool)

(assert (=> b!1033073 (= e!583864 (and (= (size!31821 (_values!6237 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!30054 thiss!1427))) (= (size!31820 (_keys!11388 thiss!1427)) (size!31821 (_values!6237 thiss!1427))) (bvsge (mask!30054 thiss!1427) #b00000000000000000000000000000000) (bvsge (extraKeys!5946 thiss!1427) #b00000000000000000000000000000000) (bvsle (extraKeys!5946 thiss!1427) #b00000000000000000000000000000011) (bvsge (bvand (extraKeys!5946 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsle (bvand (extraKeys!5946 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000011) (not (= (bvand (extraKeys!5946 thiss!1427) #b00000000000000000000000000000010) (bvand (bvand (extraKeys!5946 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000010)))))))

(assert (= (and start!90252 res!690335) b!1033070))

(assert (= (and b!1033070 res!690336) b!1033071))

(assert (= (and b!1033071 res!690337) b!1033073))

(assert (= (and b!1033069 condMapEmpty!38216) mapIsEmpty!38216))

(assert (= (and b!1033069 (not condMapEmpty!38216)) mapNonEmpty!38216))

(get-info :version)

(assert (= (and mapNonEmpty!38216 ((_ is ValueCellFull!11543) mapValue!38216)) b!1033072))

(assert (= (and b!1033069 ((_ is ValueCellFull!11543) mapDefault!38216)) b!1033067))

(assert (= b!1033068 b!1033069))

(assert (= start!90252 b!1033068))

(declare-fun m!952467 () Bool)

(assert (=> mapNonEmpty!38216 m!952467))

(declare-fun m!952469 () Bool)

(assert (=> start!90252 m!952469))

(declare-fun m!952471 () Bool)

(assert (=> b!1033068 m!952471))

(declare-fun m!952473 () Bool)

(assert (=> b!1033068 m!952473))

(declare-fun m!952475 () Bool)

(assert (=> b!1033071 m!952475))

(check-sat (not b!1033068) (not start!90252) tp_is_empty!24493 (not mapNonEmpty!38216) (not b!1033071) (not b_next!20773) b_and!33215)
(check-sat b_and!33215 (not b_next!20773))
