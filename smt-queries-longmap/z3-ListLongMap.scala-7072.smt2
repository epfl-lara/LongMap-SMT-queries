; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89484 () Bool)

(assert start!89484)

(declare-fun b!1026084 () Bool)

(declare-fun b_free!20485 () Bool)

(declare-fun b_next!20485 () Bool)

(assert (=> b!1026084 (= b_free!20485 (not b_next!20485))))

(declare-fun tp!72500 () Bool)

(declare-fun b_and!32705 () Bool)

(assert (=> b!1026084 (= tp!72500 b_and!32705)))

(declare-fun e!578782 () Bool)

(declare-fun e!578780 () Bool)

(declare-datatypes ((V!37147 0))(
  ( (V!37148 (val!12153 Int)) )
))
(declare-datatypes ((ValueCell!11399 0))(
  ( (ValueCellFull!11399 (v!14721 V!37147)) (EmptyCell!11399) )
))
(declare-datatypes ((array!64399 0))(
  ( (array!64400 (arr!31008 (Array (_ BitVec 32) (_ BitVec 64))) (size!31523 (_ BitVec 32))) )
))
(declare-datatypes ((array!64401 0))(
  ( (array!64402 (arr!31009 (Array (_ BitVec 32) ValueCell!11399)) (size!31524 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5392 0))(
  ( (LongMapFixedSize!5393 (defaultEntry!6048 Int) (mask!29733 (_ BitVec 32)) (extraKeys!5780 (_ BitVec 32)) (zeroValue!5884 V!37147) (minValue!5884 V!37147) (_size!2751 (_ BitVec 32)) (_keys!11191 array!64399) (_values!6071 array!64401) (_vacant!2751 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5392)

(declare-fun tp_is_empty!24205 () Bool)

(declare-fun array_inv!24025 (array!64399) Bool)

(declare-fun array_inv!24026 (array!64401) Bool)

(assert (=> b!1026084 (= e!578782 (and tp!72500 tp_is_empty!24205 (array_inv!24025 (_keys!11191 thiss!1427)) (array_inv!24026 (_values!6071 thiss!1427)) e!578780))))

(declare-fun mapIsEmpty!37736 () Bool)

(declare-fun mapRes!37736 () Bool)

(assert (=> mapIsEmpty!37736 mapRes!37736))

(declare-fun b!1026085 () Bool)

(declare-fun e!578783 () Bool)

(assert (=> b!1026085 (= e!578783 tp_is_empty!24205)))

(declare-fun b!1026086 () Bool)

(declare-fun e!578784 () Bool)

(declare-fun e!578785 () Bool)

(assert (=> b!1026086 (= e!578784 (not e!578785))))

(declare-fun res!686920 () Bool)

(assert (=> b!1026086 (=> res!686920 e!578785)))

(declare-datatypes ((SeekEntryResult!9637 0))(
  ( (MissingZero!9637 (index!40919 (_ BitVec 32))) (Found!9637 (index!40920 (_ BitVec 32))) (Intermediate!9637 (undefined!10449 Bool) (index!40921 (_ BitVec 32)) (x!91280 (_ BitVec 32))) (Undefined!9637) (MissingVacant!9637 (index!40922 (_ BitVec 32))) )
))
(declare-fun lt!451215 () SeekEntryResult!9637)

(assert (=> b!1026086 (= res!686920 (or (bvslt (index!40920 lt!451215) #b00000000000000000000000000000000) (bvsge (index!40920 lt!451215) (size!31523 (_keys!11191 thiss!1427))) (bvsge (size!31523 (_keys!11191 thiss!1427)) #b01111111111111111111111111111111)))))

(declare-fun lt!451212 () array!64399)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64399 (_ BitVec 32)) Bool)

(assert (=> b!1026086 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!451212 (mask!29733 thiss!1427))))

(declare-datatypes ((Unit!33325 0))(
  ( (Unit!33326) )
))
(declare-fun lt!451216 () Unit!33325)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!64399 (_ BitVec 32) (_ BitVec 32)) Unit!33325)

(assert (=> b!1026086 (= lt!451216 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11191 thiss!1427) (index!40920 lt!451215) (mask!29733 thiss!1427)))))

(declare-datatypes ((List!21809 0))(
  ( (Nil!21806) (Cons!21805 (h!23003 (_ BitVec 64)) (t!30862 List!21809)) )
))
(declare-fun arrayNoDuplicates!0 (array!64399 (_ BitVec 32) List!21809) Bool)

(assert (=> b!1026086 (arrayNoDuplicates!0 lt!451212 #b00000000000000000000000000000000 Nil!21806)))

(declare-fun lt!451213 () Unit!33325)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!64399 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21809) Unit!33325)

(assert (=> b!1026086 (= lt!451213 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11191 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!40920 lt!451215) #b00000000000000000000000000000000 Nil!21806))))

(declare-fun arrayCountValidKeys!0 (array!64399 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1026086 (= (arrayCountValidKeys!0 lt!451212 #b00000000000000000000000000000000 (size!31523 (_keys!11191 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11191 thiss!1427) #b00000000000000000000000000000000 (size!31523 (_keys!11191 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1026086 (= lt!451212 (array!64400 (store (arr!31008 (_keys!11191 thiss!1427)) (index!40920 lt!451215) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31523 (_keys!11191 thiss!1427))))))

(declare-fun lt!451214 () Unit!33325)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!64399 (_ BitVec 32) (_ BitVec 64)) Unit!33325)

(assert (=> b!1026086 (= lt!451214 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11191 thiss!1427) (index!40920 lt!451215) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1026087 () Bool)

(declare-fun res!686923 () Bool)

(declare-fun e!578786 () Bool)

(assert (=> b!1026087 (=> (not res!686923) (not e!578786))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1026087 (= res!686923 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1026088 () Bool)

(declare-fun e!578787 () Bool)

(assert (=> b!1026088 (= e!578787 tp_is_empty!24205)))

(declare-fun b!1026089 () Bool)

(assert (=> b!1026089 (= e!578785 true)))

(declare-fun lt!451211 () Bool)

(assert (=> b!1026089 (= lt!451211 (arrayNoDuplicates!0 (_keys!11191 thiss!1427) #b00000000000000000000000000000000 Nil!21806))))

(declare-fun res!686922 () Bool)

(assert (=> start!89484 (=> (not res!686922) (not e!578786))))

(declare-fun valid!2045 (LongMapFixedSize!5392) Bool)

(assert (=> start!89484 (= res!686922 (valid!2045 thiss!1427))))

(assert (=> start!89484 e!578786))

(assert (=> start!89484 e!578782))

(assert (=> start!89484 true))

(declare-fun mapNonEmpty!37736 () Bool)

(declare-fun tp!72501 () Bool)

(assert (=> mapNonEmpty!37736 (= mapRes!37736 (and tp!72501 e!578787))))

(declare-fun mapRest!37736 () (Array (_ BitVec 32) ValueCell!11399))

(declare-fun mapValue!37736 () ValueCell!11399)

(declare-fun mapKey!37736 () (_ BitVec 32))

(assert (=> mapNonEmpty!37736 (= (arr!31009 (_values!6071 thiss!1427)) (store mapRest!37736 mapKey!37736 mapValue!37736))))

(declare-fun b!1026090 () Bool)

(assert (=> b!1026090 (= e!578786 e!578784)))

(declare-fun res!686921 () Bool)

(assert (=> b!1026090 (=> (not res!686921) (not e!578784))))

(get-info :version)

(assert (=> b!1026090 (= res!686921 ((_ is Found!9637) lt!451215))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!64399 (_ BitVec 32)) SeekEntryResult!9637)

(assert (=> b!1026090 (= lt!451215 (seekEntry!0 key!909 (_keys!11191 thiss!1427) (mask!29733 thiss!1427)))))

(declare-fun b!1026091 () Bool)

(assert (=> b!1026091 (= e!578780 (and e!578783 mapRes!37736))))

(declare-fun condMapEmpty!37736 () Bool)

(declare-fun mapDefault!37736 () ValueCell!11399)

(assert (=> b!1026091 (= condMapEmpty!37736 (= (arr!31009 (_values!6071 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11399)) mapDefault!37736)))))

(assert (= (and start!89484 res!686922) b!1026087))

(assert (= (and b!1026087 res!686923) b!1026090))

(assert (= (and b!1026090 res!686921) b!1026086))

(assert (= (and b!1026086 (not res!686920)) b!1026089))

(assert (= (and b!1026091 condMapEmpty!37736) mapIsEmpty!37736))

(assert (= (and b!1026091 (not condMapEmpty!37736)) mapNonEmpty!37736))

(assert (= (and mapNonEmpty!37736 ((_ is ValueCellFull!11399) mapValue!37736)) b!1026088))

(assert (= (and b!1026091 ((_ is ValueCellFull!11399) mapDefault!37736)) b!1026085))

(assert (= b!1026084 b!1026091))

(assert (= start!89484 b!1026084))

(declare-fun m!943847 () Bool)

(assert (=> b!1026084 m!943847))

(declare-fun m!943849 () Bool)

(assert (=> b!1026084 m!943849))

(declare-fun m!943851 () Bool)

(assert (=> b!1026089 m!943851))

(declare-fun m!943853 () Bool)

(assert (=> mapNonEmpty!37736 m!943853))

(declare-fun m!943855 () Bool)

(assert (=> start!89484 m!943855))

(declare-fun m!943857 () Bool)

(assert (=> b!1026090 m!943857))

(declare-fun m!943859 () Bool)

(assert (=> b!1026086 m!943859))

(declare-fun m!943861 () Bool)

(assert (=> b!1026086 m!943861))

(declare-fun m!943863 () Bool)

(assert (=> b!1026086 m!943863))

(declare-fun m!943865 () Bool)

(assert (=> b!1026086 m!943865))

(declare-fun m!943867 () Bool)

(assert (=> b!1026086 m!943867))

(declare-fun m!943869 () Bool)

(assert (=> b!1026086 m!943869))

(declare-fun m!943871 () Bool)

(assert (=> b!1026086 m!943871))

(declare-fun m!943873 () Bool)

(assert (=> b!1026086 m!943873))

(check-sat tp_is_empty!24205 (not b_next!20485) (not start!89484) (not b!1026089) b_and!32705 (not b!1026090) (not mapNonEmpty!37736) (not b!1026084) (not b!1026086))
(check-sat b_and!32705 (not b_next!20485))
