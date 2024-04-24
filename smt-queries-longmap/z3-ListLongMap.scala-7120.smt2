; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!90488 () Bool)

(assert start!90488)

(declare-fun b!1034533 () Bool)

(declare-fun b_free!20773 () Bool)

(declare-fun b_next!20773 () Bool)

(assert (=> b!1034533 (= b_free!20773 (not b_next!20773))))

(declare-fun tp!73412 () Bool)

(declare-fun b_and!33251 () Bool)

(assert (=> b!1034533 (= tp!73412 b_and!33251)))

(declare-fun e!584798 () Bool)

(declare-fun e!584796 () Bool)

(declare-datatypes ((V!37531 0))(
  ( (V!37532 (val!12297 Int)) )
))
(declare-datatypes ((ValueCell!11543 0))(
  ( (ValueCellFull!11543 (v!14870 V!37531)) (EmptyCell!11543) )
))
(declare-datatypes ((array!65111 0))(
  ( (array!65112 (arr!31345 (Array (_ BitVec 32) (_ BitVec 64))) (size!31868 (_ BitVec 32))) )
))
(declare-datatypes ((array!65113 0))(
  ( (array!65114 (arr!31346 (Array (_ BitVec 32) ValueCell!11543)) (size!31869 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5680 0))(
  ( (LongMapFixedSize!5681 (defaultEntry!6214 Int) (mask!30119 (_ BitVec 32)) (extraKeys!5946 (_ BitVec 32)) (zeroValue!6050 V!37531) (minValue!6050 V!37531) (_size!2895 (_ BitVec 32)) (_keys!11430 array!65111) (_values!6237 array!65113) (_vacant!2895 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5680)

(declare-fun tp_is_empty!24493 () Bool)

(declare-fun array_inv!24263 (array!65111) Bool)

(declare-fun array_inv!24264 (array!65113) Bool)

(assert (=> b!1034533 (= e!584796 (and tp!73412 tp_is_empty!24493 (array_inv!24263 (_keys!11430 thiss!1427)) (array_inv!24264 (_values!6237 thiss!1427)) e!584798))))

(declare-fun mapIsEmpty!38216 () Bool)

(declare-fun mapRes!38216 () Bool)

(assert (=> mapIsEmpty!38216 mapRes!38216))

(declare-fun b!1034534 () Bool)

(declare-fun res!690913 () Bool)

(declare-fun e!584797 () Bool)

(assert (=> b!1034534 (=> (not res!690913) (not e!584797))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1034534 (= res!690913 (validMask!0 (mask!30119 thiss!1427)))))

(declare-fun mapNonEmpty!38216 () Bool)

(declare-fun tp!73413 () Bool)

(declare-fun e!584799 () Bool)

(assert (=> mapNonEmpty!38216 (= mapRes!38216 (and tp!73413 e!584799))))

(declare-fun mapKey!38216 () (_ BitVec 32))

(declare-fun mapValue!38216 () ValueCell!11543)

(declare-fun mapRest!38216 () (Array (_ BitVec 32) ValueCell!11543))

(assert (=> mapNonEmpty!38216 (= (arr!31346 (_values!6237 thiss!1427)) (store mapRest!38216 mapKey!38216 mapValue!38216))))

(declare-fun b!1034535 () Bool)

(assert (=> b!1034535 (= e!584797 (and (= (size!31869 (_values!6237 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!30119 thiss!1427))) (= (size!31868 (_keys!11430 thiss!1427)) (size!31869 (_values!6237 thiss!1427))) (bvsge (mask!30119 thiss!1427) #b00000000000000000000000000000000) (bvsge (extraKeys!5946 thiss!1427) #b00000000000000000000000000000000) (bvsle (extraKeys!5946 thiss!1427) #b00000000000000000000000000000011) (bvsge (bvand (extraKeys!5946 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsle (bvand (extraKeys!5946 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000011) (not (= (bvand (extraKeys!5946 thiss!1427) #b00000000000000000000000000000010) (bvand (bvand (extraKeys!5946 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000010)))))))

(declare-fun b!1034536 () Bool)

(declare-fun e!584800 () Bool)

(assert (=> b!1034536 (= e!584800 tp_is_empty!24493)))

(declare-fun b!1034537 () Bool)

(assert (=> b!1034537 (= e!584799 tp_is_empty!24493)))

(declare-fun res!690912 () Bool)

(assert (=> start!90488 (=> (not res!690912) (not e!584797))))

(declare-fun valid!2153 (LongMapFixedSize!5680) Bool)

(assert (=> start!90488 (= res!690912 (valid!2153 thiss!1427))))

(assert (=> start!90488 e!584797))

(assert (=> start!90488 e!584796))

(assert (=> start!90488 true))

(declare-fun b!1034538 () Bool)

(declare-fun res!690914 () Bool)

(assert (=> b!1034538 (=> (not res!690914) (not e!584797))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1034538 (= res!690914 (and (= key!909 (bvneg key!909)) (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1034539 () Bool)

(assert (=> b!1034539 (= e!584798 (and e!584800 mapRes!38216))))

(declare-fun condMapEmpty!38216 () Bool)

(declare-fun mapDefault!38216 () ValueCell!11543)

(assert (=> b!1034539 (= condMapEmpty!38216 (= (arr!31346 (_values!6237 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11543)) mapDefault!38216)))))

(assert (= (and start!90488 res!690912) b!1034538))

(assert (= (and b!1034538 res!690914) b!1034534))

(assert (= (and b!1034534 res!690913) b!1034535))

(assert (= (and b!1034539 condMapEmpty!38216) mapIsEmpty!38216))

(assert (= (and b!1034539 (not condMapEmpty!38216)) mapNonEmpty!38216))

(get-info :version)

(assert (= (and mapNonEmpty!38216 ((_ is ValueCellFull!11543) mapValue!38216)) b!1034537))

(assert (= (and b!1034539 ((_ is ValueCellFull!11543) mapDefault!38216)) b!1034536))

(assert (= b!1034533 b!1034539))

(assert (= start!90488 b!1034533))

(declare-fun m!954751 () Bool)

(assert (=> b!1034533 m!954751))

(declare-fun m!954753 () Bool)

(assert (=> b!1034533 m!954753))

(declare-fun m!954755 () Bool)

(assert (=> b!1034534 m!954755))

(declare-fun m!954757 () Bool)

(assert (=> mapNonEmpty!38216 m!954757))

(declare-fun m!954759 () Bool)

(assert (=> start!90488 m!954759))

(check-sat (not b!1034534) (not mapNonEmpty!38216) (not start!90488) (not b!1034533) (not b_next!20773) b_and!33251 tp_is_empty!24493)
(check-sat b_and!33251 (not b_next!20773))
