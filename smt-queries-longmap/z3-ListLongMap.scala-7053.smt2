; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89606 () Bool)

(assert start!89606)

(declare-fun b!1025819 () Bool)

(declare-fun b_free!20371 () Bool)

(declare-fun b_next!20371 () Bool)

(assert (=> b!1025819 (= b_free!20371 (not b_next!20371))))

(declare-fun tp!72158 () Bool)

(declare-fun b_and!32627 () Bool)

(assert (=> b!1025819 (= tp!72158 b_and!32627)))

(declare-fun mapIsEmpty!37565 () Bool)

(declare-fun mapRes!37565 () Bool)

(assert (=> mapIsEmpty!37565 mapRes!37565))

(declare-fun b!1025810 () Bool)

(declare-fun e!578350 () Bool)

(assert (=> b!1025810 (= e!578350 true)))

(declare-fun lt!451148 () Bool)

(declare-datatypes ((V!36995 0))(
  ( (V!36996 (val!12096 Int)) )
))
(declare-datatypes ((ValueCell!11342 0))(
  ( (ValueCellFull!11342 (v!14661 V!36995)) (EmptyCell!11342) )
))
(declare-datatypes ((array!64281 0))(
  ( (array!64282 (arr!30943 (Array (_ BitVec 32) (_ BitVec 64))) (size!31457 (_ BitVec 32))) )
))
(declare-datatypes ((array!64283 0))(
  ( (array!64284 (arr!30944 (Array (_ BitVec 32) ValueCell!11342)) (size!31458 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5278 0))(
  ( (LongMapFixedSize!5279 (defaultEntry!5991 Int) (mask!29703 (_ BitVec 32)) (extraKeys!5723 (_ BitVec 32)) (zeroValue!5827 V!36995) (minValue!5827 V!36995) (_size!2694 (_ BitVec 32)) (_keys!11176 array!64281) (_values!6014 array!64283) (_vacant!2694 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5278)

(declare-datatypes ((List!21718 0))(
  ( (Nil!21715) (Cons!21714 (h!22921 (_ BitVec 64)) (t!30772 List!21718)) )
))
(declare-fun arrayNoDuplicates!0 (array!64281 (_ BitVec 32) List!21718) Bool)

(assert (=> b!1025810 (= lt!451148 (arrayNoDuplicates!0 (_keys!11176 thiss!1427) #b00000000000000000000000000000000 Nil!21715))))

(declare-fun b!1025811 () Bool)

(declare-fun res!686446 () Bool)

(declare-fun e!578351 () Bool)

(assert (=> b!1025811 (=> (not res!686446) (not e!578351))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1025811 (= res!686446 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1025812 () Bool)

(declare-fun e!578353 () Bool)

(assert (=> b!1025812 (= e!578353 (not e!578350))))

(declare-fun res!686441 () Bool)

(assert (=> b!1025812 (=> res!686441 e!578350)))

(assert (=> b!1025812 (= res!686441 (or (bvsge (size!31457 (_keys!11176 thiss!1427)) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!31457 (_keys!11176 thiss!1427)))))))

(declare-datatypes ((SeekEntryResult!9551 0))(
  ( (MissingZero!9551 (index!40575 (_ BitVec 32))) (Found!9551 (index!40576 (_ BitVec 32))) (Intermediate!9551 (undefined!10363 Bool) (index!40577 (_ BitVec 32)) (x!91067 (_ BitVec 32))) (Undefined!9551) (MissingVacant!9551 (index!40578 (_ BitVec 32))) )
))
(declare-fun lt!451147 () SeekEntryResult!9551)

(declare-fun arrayCountValidKeys!0 (array!64281 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1025812 (= (arrayCountValidKeys!0 (array!64282 (store (arr!30943 (_keys!11176 thiss!1427)) (index!40576 lt!451147) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31457 (_keys!11176 thiss!1427))) #b00000000000000000000000000000000 (size!31457 (_keys!11176 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11176 thiss!1427) #b00000000000000000000000000000000 (size!31457 (_keys!11176 thiss!1427))) #b00000000000000000000000000000001))))

(declare-datatypes ((Unit!33358 0))(
  ( (Unit!33359) )
))
(declare-fun lt!451146 () Unit!33358)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!64281 (_ BitVec 32) (_ BitVec 64)) Unit!33358)

(assert (=> b!1025812 (= lt!451146 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11176 thiss!1427) (index!40576 lt!451147) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1025813 () Bool)

(declare-fun e!578348 () Bool)

(declare-fun tp_is_empty!24091 () Bool)

(assert (=> b!1025813 (= e!578348 tp_is_empty!24091)))

(declare-fun b!1025814 () Bool)

(assert (=> b!1025814 (= e!578351 e!578353)))

(declare-fun res!686447 () Bool)

(assert (=> b!1025814 (=> (not res!686447) (not e!578353))))

(get-info :version)

(assert (=> b!1025814 (= res!686447 ((_ is Found!9551) lt!451147))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!64281 (_ BitVec 32)) SeekEntryResult!9551)

(assert (=> b!1025814 (= lt!451147 (seekEntry!0 key!909 (_keys!11176 thiss!1427) (mask!29703 thiss!1427)))))

(declare-fun b!1025815 () Bool)

(declare-fun res!686443 () Bool)

(assert (=> b!1025815 (=> res!686443 e!578350)))

(declare-fun noDuplicate!1475 (List!21718) Bool)

(assert (=> b!1025815 (= res!686443 (not (noDuplicate!1475 Nil!21715)))))

(declare-fun res!686445 () Bool)

(assert (=> start!89606 (=> (not res!686445) (not e!578351))))

(declare-fun valid!2014 (LongMapFixedSize!5278) Bool)

(assert (=> start!89606 (= res!686445 (valid!2014 thiss!1427))))

(assert (=> start!89606 e!578351))

(declare-fun e!578347 () Bool)

(assert (=> start!89606 e!578347))

(assert (=> start!89606 true))

(declare-fun b!1025816 () Bool)

(declare-fun e!578349 () Bool)

(declare-fun e!578346 () Bool)

(assert (=> b!1025816 (= e!578349 (and e!578346 mapRes!37565))))

(declare-fun condMapEmpty!37565 () Bool)

(declare-fun mapDefault!37565 () ValueCell!11342)

(assert (=> b!1025816 (= condMapEmpty!37565 (= (arr!30944 (_values!6014 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11342)) mapDefault!37565)))))

(declare-fun b!1025817 () Bool)

(declare-fun res!686442 () Bool)

(assert (=> b!1025817 (=> res!686442 e!578350)))

(declare-fun contains!5971 (List!21718 (_ BitVec 64)) Bool)

(assert (=> b!1025817 (= res!686442 (contains!5971 Nil!21715 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1025818 () Bool)

(declare-fun res!686444 () Bool)

(assert (=> b!1025818 (=> res!686444 e!578350)))

(assert (=> b!1025818 (= res!686444 (contains!5971 Nil!21715 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun array_inv!23987 (array!64281) Bool)

(declare-fun array_inv!23988 (array!64283) Bool)

(assert (=> b!1025819 (= e!578347 (and tp!72158 tp_is_empty!24091 (array_inv!23987 (_keys!11176 thiss!1427)) (array_inv!23988 (_values!6014 thiss!1427)) e!578349))))

(declare-fun b!1025820 () Bool)

(assert (=> b!1025820 (= e!578346 tp_is_empty!24091)))

(declare-fun mapNonEmpty!37565 () Bool)

(declare-fun tp!72159 () Bool)

(assert (=> mapNonEmpty!37565 (= mapRes!37565 (and tp!72159 e!578348))))

(declare-fun mapRest!37565 () (Array (_ BitVec 32) ValueCell!11342))

(declare-fun mapKey!37565 () (_ BitVec 32))

(declare-fun mapValue!37565 () ValueCell!11342)

(assert (=> mapNonEmpty!37565 (= (arr!30944 (_values!6014 thiss!1427)) (store mapRest!37565 mapKey!37565 mapValue!37565))))

(assert (= (and start!89606 res!686445) b!1025811))

(assert (= (and b!1025811 res!686446) b!1025814))

(assert (= (and b!1025814 res!686447) b!1025812))

(assert (= (and b!1025812 (not res!686441)) b!1025815))

(assert (= (and b!1025815 (not res!686443)) b!1025817))

(assert (= (and b!1025817 (not res!686442)) b!1025818))

(assert (= (and b!1025818 (not res!686444)) b!1025810))

(assert (= (and b!1025816 condMapEmpty!37565) mapIsEmpty!37565))

(assert (= (and b!1025816 (not condMapEmpty!37565)) mapNonEmpty!37565))

(assert (= (and mapNonEmpty!37565 ((_ is ValueCellFull!11342) mapValue!37565)) b!1025813))

(assert (= (and b!1025816 ((_ is ValueCellFull!11342) mapDefault!37565)) b!1025820))

(assert (= b!1025819 b!1025816))

(assert (= start!89606 b!1025819))

(declare-fun m!944493 () Bool)

(assert (=> b!1025818 m!944493))

(declare-fun m!944495 () Bool)

(assert (=> b!1025819 m!944495))

(declare-fun m!944497 () Bool)

(assert (=> b!1025819 m!944497))

(declare-fun m!944499 () Bool)

(assert (=> start!89606 m!944499))

(declare-fun m!944501 () Bool)

(assert (=> mapNonEmpty!37565 m!944501))

(declare-fun m!944503 () Bool)

(assert (=> b!1025812 m!944503))

(declare-fun m!944505 () Bool)

(assert (=> b!1025812 m!944505))

(declare-fun m!944507 () Bool)

(assert (=> b!1025812 m!944507))

(declare-fun m!944509 () Bool)

(assert (=> b!1025812 m!944509))

(declare-fun m!944511 () Bool)

(assert (=> b!1025810 m!944511))

(declare-fun m!944513 () Bool)

(assert (=> b!1025817 m!944513))

(declare-fun m!944515 () Bool)

(assert (=> b!1025815 m!944515))

(declare-fun m!944517 () Bool)

(assert (=> b!1025814 m!944517))

(check-sat (not b!1025817) (not b!1025810) (not b!1025814) (not b!1025819) (not start!89606) (not b!1025815) tp_is_empty!24091 (not mapNonEmpty!37565) (not b!1025812) b_and!32627 (not b_next!20371) (not b!1025818))
(check-sat b_and!32627 (not b_next!20371))
