; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!91070 () Bool)

(assert start!91070)

(declare-fun b!1039628 () Bool)

(declare-fun b_free!20935 () Bool)

(declare-fun b_next!20935 () Bool)

(assert (=> b!1039628 (= b_free!20935 (not b_next!20935))))

(declare-fun tp!73966 () Bool)

(declare-fun b_and!33477 () Bool)

(assert (=> b!1039628 (= tp!73966 b_and!33477)))

(declare-fun b!1039624 () Bool)

(declare-fun res!693168 () Bool)

(declare-fun e!588319 () Bool)

(assert (=> b!1039624 (=> (not res!693168) (not e!588319))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1039624 (= res!693168 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1039625 () Bool)

(declare-fun res!693170 () Bool)

(declare-fun e!588313 () Bool)

(assert (=> b!1039625 (=> res!693170 e!588313)))

(declare-datatypes ((List!21922 0))(
  ( (Nil!21919) (Cons!21918 (h!23130 (_ BitVec 64)) (t!31128 List!21922)) )
))
(declare-fun contains!6062 (List!21922 (_ BitVec 64)) Bool)

(assert (=> b!1039625 (= res!693170 (contains!6062 Nil!21919 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1039626 () Bool)

(declare-fun res!693164 () Bool)

(assert (=> b!1039626 (=> res!693164 e!588313)))

(assert (=> b!1039626 (= res!693164 (contains!6062 Nil!21919 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapIsEmpty!38526 () Bool)

(declare-fun mapRes!38526 () Bool)

(assert (=> mapIsEmpty!38526 mapRes!38526))

(declare-fun b!1039627 () Bool)

(declare-fun res!693167 () Bool)

(assert (=> b!1039627 (=> res!693167 e!588313)))

(declare-datatypes ((V!37747 0))(
  ( (V!37748 (val!12378 Int)) )
))
(declare-datatypes ((ValueCell!11624 0))(
  ( (ValueCellFull!11624 (v!14960 V!37747)) (EmptyCell!11624) )
))
(declare-datatypes ((array!65473 0))(
  ( (array!65474 (arr!31507 (Array (_ BitVec 32) (_ BitVec 64))) (size!32038 (_ BitVec 32))) )
))
(declare-datatypes ((array!65475 0))(
  ( (array!65476 (arr!31508 (Array (_ BitVec 32) ValueCell!11624)) (size!32039 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5842 0))(
  ( (LongMapFixedSize!5843 (defaultEntry!6303 Int) (mask!30299 (_ BitVec 32)) (extraKeys!6031 (_ BitVec 32)) (zeroValue!6137 V!37747) (minValue!6137 V!37747) (_size!2976 (_ BitVec 32)) (_keys!11542 array!65473) (_values!6326 array!65475) (_vacant!2976 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5842)

(declare-fun arrayNoDuplicates!0 (array!65473 (_ BitVec 32) List!21922) Bool)

(assert (=> b!1039627 (= res!693167 (not (arrayNoDuplicates!0 (_keys!11542 thiss!1427) #b00000000000000000000000000000000 Nil!21919)))))

(declare-fun e!588316 () Bool)

(declare-fun e!588320 () Bool)

(declare-fun tp_is_empty!24655 () Bool)

(declare-fun array_inv!24375 (array!65473) Bool)

(declare-fun array_inv!24376 (array!65475) Bool)

(assert (=> b!1039628 (= e!588316 (and tp!73966 tp_is_empty!24655 (array_inv!24375 (_keys!11542 thiss!1427)) (array_inv!24376 (_values!6326 thiss!1427)) e!588320))))

(declare-fun b!1039629 () Bool)

(declare-datatypes ((SeekEntryResult!9723 0))(
  ( (MissingZero!9723 (index!41263 (_ BitVec 32))) (Found!9723 (index!41264 (_ BitVec 32))) (Intermediate!9723 (undefined!10535 Bool) (index!41265 (_ BitVec 32)) (x!92624 (_ BitVec 32))) (Undefined!9723) (MissingVacant!9723 (index!41266 (_ BitVec 32))) )
))
(declare-fun lt!458213 () SeekEntryResult!9723)

(assert (=> b!1039629 (= e!588313 true)))

(declare-fun mapNonEmpty!38526 () Bool)

(declare-fun tp!73965 () Bool)

(declare-fun e!588317 () Bool)

(assert (=> mapNonEmpty!38526 (= mapRes!38526 (and tp!73965 e!588317))))

(declare-fun mapKey!38526 () (_ BitVec 32))

(declare-fun mapRest!38526 () (Array (_ BitVec 32) ValueCell!11624))

(declare-fun mapValue!38526 () ValueCell!11624)

(assert (=> mapNonEmpty!38526 (= (arr!31508 (_values!6326 thiss!1427)) (store mapRest!38526 mapKey!38526 mapValue!38526))))

(declare-fun b!1039631 () Bool)

(declare-fun res!693165 () Bool)

(assert (=> b!1039631 (=> res!693165 e!588313)))

(declare-fun noDuplicate!1499 (List!21922) Bool)

(assert (=> b!1039631 (= res!693165 (not (noDuplicate!1499 Nil!21919)))))

(declare-fun b!1039632 () Bool)

(declare-fun e!588318 () Bool)

(assert (=> b!1039632 (= e!588319 e!588318)))

(declare-fun res!693171 () Bool)

(assert (=> b!1039632 (=> (not res!693171) (not e!588318))))

(get-info :version)

(assert (=> b!1039632 (= res!693171 ((_ is Found!9723) lt!458213))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!65473 (_ BitVec 32)) SeekEntryResult!9723)

(assert (=> b!1039632 (= lt!458213 (seekEntry!0 key!909 (_keys!11542 thiss!1427) (mask!30299 thiss!1427)))))

(declare-fun b!1039633 () Bool)

(assert (=> b!1039633 (= e!588317 tp_is_empty!24655)))

(declare-fun b!1039634 () Bool)

(declare-fun e!588315 () Bool)

(assert (=> b!1039634 (= e!588320 (and e!588315 mapRes!38526))))

(declare-fun condMapEmpty!38526 () Bool)

(declare-fun mapDefault!38526 () ValueCell!11624)

(assert (=> b!1039634 (= condMapEmpty!38526 (= (arr!31508 (_values!6326 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11624)) mapDefault!38526)))))

(declare-fun b!1039635 () Bool)

(assert (=> b!1039635 (= e!588315 tp_is_empty!24655)))

(declare-fun res!693166 () Bool)

(assert (=> start!91070 (=> (not res!693166) (not e!588319))))

(declare-fun valid!2207 (LongMapFixedSize!5842) Bool)

(assert (=> start!91070 (= res!693166 (valid!2207 thiss!1427))))

(assert (=> start!91070 e!588319))

(assert (=> start!91070 e!588316))

(assert (=> start!91070 true))

(declare-fun b!1039630 () Bool)

(assert (=> b!1039630 (= e!588318 (not e!588313))))

(declare-fun res!693169 () Bool)

(assert (=> b!1039630 (=> res!693169 e!588313)))

(assert (=> b!1039630 (= res!693169 (or (bvsge (size!32038 (_keys!11542 thiss!1427)) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!32038 (_keys!11542 thiss!1427)))))))

(declare-fun arrayCountValidKeys!0 (array!65473 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1039630 (= (arrayCountValidKeys!0 (array!65474 (store (arr!31507 (_keys!11542 thiss!1427)) (index!41264 lt!458213) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32038 (_keys!11542 thiss!1427))) #b00000000000000000000000000000000 (size!32038 (_keys!11542 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11542 thiss!1427) #b00000000000000000000000000000000 (size!32038 (_keys!11542 thiss!1427))) #b00000000000000000000000000000001))))

(declare-datatypes ((Unit!33975 0))(
  ( (Unit!33976) )
))
(declare-fun lt!458214 () Unit!33975)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!65473 (_ BitVec 32) (_ BitVec 64)) Unit!33975)

(assert (=> b!1039630 (= lt!458214 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11542 thiss!1427) (index!41264 lt!458213) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!91070 res!693166) b!1039624))

(assert (= (and b!1039624 res!693168) b!1039632))

(assert (= (and b!1039632 res!693171) b!1039630))

(assert (= (and b!1039630 (not res!693169)) b!1039631))

(assert (= (and b!1039631 (not res!693165)) b!1039626))

(assert (= (and b!1039626 (not res!693164)) b!1039625))

(assert (= (and b!1039625 (not res!693170)) b!1039627))

(assert (= (and b!1039627 (not res!693167)) b!1039629))

(assert (= (and b!1039634 condMapEmpty!38526) mapIsEmpty!38526))

(assert (= (and b!1039634 (not condMapEmpty!38526)) mapNonEmpty!38526))

(assert (= (and mapNonEmpty!38526 ((_ is ValueCellFull!11624) mapValue!38526)) b!1039633))

(assert (= (and b!1039634 ((_ is ValueCellFull!11624) mapDefault!38526)) b!1039635))

(assert (= b!1039628 b!1039634))

(assert (= start!91070 b!1039628))

(declare-fun m!959935 () Bool)

(assert (=> b!1039628 m!959935))

(declare-fun m!959937 () Bool)

(assert (=> b!1039628 m!959937))

(declare-fun m!959939 () Bool)

(assert (=> b!1039631 m!959939))

(declare-fun m!959941 () Bool)

(assert (=> b!1039627 m!959941))

(declare-fun m!959943 () Bool)

(assert (=> b!1039626 m!959943))

(declare-fun m!959945 () Bool)

(assert (=> mapNonEmpty!38526 m!959945))

(declare-fun m!959947 () Bool)

(assert (=> start!91070 m!959947))

(declare-fun m!959949 () Bool)

(assert (=> b!1039632 m!959949))

(declare-fun m!959951 () Bool)

(assert (=> b!1039630 m!959951))

(declare-fun m!959953 () Bool)

(assert (=> b!1039630 m!959953))

(declare-fun m!959955 () Bool)

(assert (=> b!1039630 m!959955))

(declare-fun m!959957 () Bool)

(assert (=> b!1039630 m!959957))

(declare-fun m!959959 () Bool)

(assert (=> b!1039625 m!959959))

(check-sat (not b!1039631) b_and!33477 (not b!1039627) (not b!1039628) (not b_next!20935) (not b!1039630) (not b!1039626) (not b!1039632) tp_is_empty!24655 (not b!1039625) (not start!91070) (not mapNonEmpty!38526))
(check-sat b_and!33477 (not b_next!20935))
