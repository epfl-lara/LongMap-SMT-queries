; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89446 () Bool)

(assert start!89446)

(declare-fun b!1025720 () Bool)

(declare-fun b_free!20445 () Bool)

(declare-fun b_next!20445 () Bool)

(assert (=> b!1025720 (= b_free!20445 (not b_next!20445))))

(declare-fun tp!72381 () Bool)

(declare-fun b_and!32691 () Bool)

(assert (=> b!1025720 (= tp!72381 b_and!32691)))

(declare-fun b!1025716 () Bool)

(declare-fun e!578397 () Bool)

(declare-fun e!578392 () Bool)

(assert (=> b!1025716 (= e!578397 e!578392)))

(declare-fun res!686709 () Bool)

(assert (=> b!1025716 (=> (not res!686709) (not e!578392))))

(declare-datatypes ((SeekEntryResult!9627 0))(
  ( (MissingZero!9627 (index!40879 (_ BitVec 32))) (Found!9627 (index!40880 (_ BitVec 32))) (Intermediate!9627 (undefined!10439 Bool) (index!40881 (_ BitVec 32)) (x!91217 (_ BitVec 32))) (Undefined!9627) (MissingVacant!9627 (index!40882 (_ BitVec 32))) )
))
(declare-fun lt!451064 () SeekEntryResult!9627)

(get-info :version)

(assert (=> b!1025716 (= res!686709 ((_ is Found!9627) lt!451064))))

(declare-fun key!909 () (_ BitVec 64))

(declare-datatypes ((V!37093 0))(
  ( (V!37094 (val!12133 Int)) )
))
(declare-datatypes ((ValueCell!11379 0))(
  ( (ValueCellFull!11379 (v!14702 V!37093)) (EmptyCell!11379) )
))
(declare-datatypes ((array!64380 0))(
  ( (array!64381 (arr!30999 (Array (_ BitVec 32) (_ BitVec 64))) (size!31512 (_ BitVec 32))) )
))
(declare-datatypes ((array!64382 0))(
  ( (array!64383 (arr!31000 (Array (_ BitVec 32) ValueCell!11379)) (size!31513 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5352 0))(
  ( (LongMapFixedSize!5353 (defaultEntry!6028 Int) (mask!29704 (_ BitVec 32)) (extraKeys!5760 (_ BitVec 32)) (zeroValue!5864 V!37093) (minValue!5864 V!37093) (_size!2731 (_ BitVec 32)) (_keys!11175 array!64380) (_values!6051 array!64382) (_vacant!2731 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5352)

(declare-fun seekEntry!0 ((_ BitVec 64) array!64380 (_ BitVec 32)) SeekEntryResult!9627)

(assert (=> b!1025716 (= lt!451064 (seekEntry!0 key!909 (_keys!11175 thiss!1427) (mask!29704 thiss!1427)))))

(declare-fun b!1025717 () Bool)

(declare-fun res!686714 () Bool)

(declare-fun e!578395 () Bool)

(assert (=> b!1025717 (=> res!686714 e!578395)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1025717 (= res!686714 (not (validKeyInArray!0 (select (arr!30999 (_keys!11175 thiss!1427)) (index!40880 lt!451064)))))))

(declare-fun res!686713 () Bool)

(assert (=> start!89446 (=> (not res!686713) (not e!578397))))

(declare-fun valid!2034 (LongMapFixedSize!5352) Bool)

(assert (=> start!89446 (= res!686713 (valid!2034 thiss!1427))))

(assert (=> start!89446 e!578397))

(declare-fun e!578396 () Bool)

(assert (=> start!89446 e!578396))

(assert (=> start!89446 true))

(declare-fun b!1025718 () Bool)

(declare-fun res!686712 () Bool)

(assert (=> b!1025718 (=> res!686712 e!578395)))

(assert (=> b!1025718 (= res!686712 (or (not (= (size!31512 (_keys!11175 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!29704 thiss!1427)))) (bvslt (index!40880 lt!451064) #b00000000000000000000000000000000) (bvsge (index!40880 lt!451064) (size!31512 (_keys!11175 thiss!1427)))))))

(declare-fun b!1025719 () Bool)

(assert (=> b!1025719 (= e!578392 (not e!578395))))

(declare-fun res!686708 () Bool)

(assert (=> b!1025719 (=> res!686708 e!578395)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1025719 (= res!686708 (not (validMask!0 (mask!29704 thiss!1427))))))

(declare-fun lt!451065 () array!64380)

(declare-datatypes ((List!21759 0))(
  ( (Nil!21756) (Cons!21755 (h!22953 (_ BitVec 64)) (t!30821 List!21759)) )
))
(declare-fun arrayNoDuplicates!0 (array!64380 (_ BitVec 32) List!21759) Bool)

(assert (=> b!1025719 (arrayNoDuplicates!0 lt!451065 #b00000000000000000000000000000000 Nil!21756)))

(declare-datatypes ((Unit!33403 0))(
  ( (Unit!33404) )
))
(declare-fun lt!451068 () Unit!33403)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!64380 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21759) Unit!33403)

(assert (=> b!1025719 (= lt!451068 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11175 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!40880 lt!451064) #b00000000000000000000000000000000 Nil!21756))))

(declare-fun arrayCountValidKeys!0 (array!64380 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1025719 (= (arrayCountValidKeys!0 lt!451065 #b00000000000000000000000000000000 (size!31512 (_keys!11175 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11175 thiss!1427) #b00000000000000000000000000000000 (size!31512 (_keys!11175 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1025719 (= lt!451065 (array!64381 (store (arr!30999 (_keys!11175 thiss!1427)) (index!40880 lt!451064) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31512 (_keys!11175 thiss!1427))))))

(declare-fun lt!451066 () Unit!33403)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!64380 (_ BitVec 32) (_ BitVec 64)) Unit!33403)

(assert (=> b!1025719 (= lt!451066 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11175 thiss!1427) (index!40880 lt!451064) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun tp_is_empty!24165 () Bool)

(declare-fun e!578394 () Bool)

(declare-fun array_inv!24009 (array!64380) Bool)

(declare-fun array_inv!24010 (array!64382) Bool)

(assert (=> b!1025720 (= e!578396 (and tp!72381 tp_is_empty!24165 (array_inv!24009 (_keys!11175 thiss!1427)) (array_inv!24010 (_values!6051 thiss!1427)) e!578394))))

(declare-fun b!1025721 () Bool)

(declare-fun res!686710 () Bool)

(assert (=> b!1025721 (=> (not res!686710) (not e!578397))))

(assert (=> b!1025721 (= res!686710 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1025722 () Bool)

(declare-fun e!578398 () Bool)

(assert (=> b!1025722 (= e!578398 tp_is_empty!24165)))

(declare-fun mapIsEmpty!37676 () Bool)

(declare-fun mapRes!37676 () Bool)

(assert (=> mapIsEmpty!37676 mapRes!37676))

(declare-fun b!1025723 () Bool)

(declare-fun e!578391 () Bool)

(assert (=> b!1025723 (= e!578391 tp_is_empty!24165)))

(declare-fun b!1025724 () Bool)

(declare-fun res!686711 () Bool)

(assert (=> b!1025724 (=> res!686711 e!578395)))

(assert (=> b!1025724 (= res!686711 (not (arrayNoDuplicates!0 (_keys!11175 thiss!1427) #b00000000000000000000000000000000 Nil!21756)))))

(declare-fun b!1025725 () Bool)

(assert (=> b!1025725 (= e!578394 (and e!578398 mapRes!37676))))

(declare-fun condMapEmpty!37676 () Bool)

(declare-fun mapDefault!37676 () ValueCell!11379)

(assert (=> b!1025725 (= condMapEmpty!37676 (= (arr!31000 (_values!6051 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11379)) mapDefault!37676)))))

(declare-fun mapNonEmpty!37676 () Bool)

(declare-fun tp!72380 () Bool)

(assert (=> mapNonEmpty!37676 (= mapRes!37676 (and tp!72380 e!578391))))

(declare-fun mapRest!37676 () (Array (_ BitVec 32) ValueCell!11379))

(declare-fun mapValue!37676 () ValueCell!11379)

(declare-fun mapKey!37676 () (_ BitVec 32))

(assert (=> mapNonEmpty!37676 (= (arr!31000 (_values!6051 thiss!1427)) (store mapRest!37676 mapKey!37676 mapValue!37676))))

(declare-fun b!1025726 () Bool)

(assert (=> b!1025726 (= e!578395 true)))

(declare-fun lt!451067 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64380 (_ BitVec 32)) Bool)

(assert (=> b!1025726 (= lt!451067 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11175 thiss!1427) (mask!29704 thiss!1427)))))

(assert (= (and start!89446 res!686713) b!1025721))

(assert (= (and b!1025721 res!686710) b!1025716))

(assert (= (and b!1025716 res!686709) b!1025719))

(assert (= (and b!1025719 (not res!686708)) b!1025718))

(assert (= (and b!1025718 (not res!686712)) b!1025717))

(assert (= (and b!1025717 (not res!686714)) b!1025724))

(assert (= (and b!1025724 (not res!686711)) b!1025726))

(assert (= (and b!1025725 condMapEmpty!37676) mapIsEmpty!37676))

(assert (= (and b!1025725 (not condMapEmpty!37676)) mapNonEmpty!37676))

(assert (= (and mapNonEmpty!37676 ((_ is ValueCellFull!11379) mapValue!37676)) b!1025723))

(assert (= (and b!1025725 ((_ is ValueCellFull!11379) mapDefault!37676)) b!1025722))

(assert (= b!1025720 b!1025725))

(assert (= start!89446 b!1025720))

(declare-fun m!943887 () Bool)

(assert (=> b!1025726 m!943887))

(declare-fun m!943889 () Bool)

(assert (=> b!1025716 m!943889))

(declare-fun m!943891 () Bool)

(assert (=> b!1025717 m!943891))

(assert (=> b!1025717 m!943891))

(declare-fun m!943893 () Bool)

(assert (=> b!1025717 m!943893))

(declare-fun m!943895 () Bool)

(assert (=> mapNonEmpty!37676 m!943895))

(declare-fun m!943897 () Bool)

(assert (=> b!1025724 m!943897))

(declare-fun m!943899 () Bool)

(assert (=> b!1025720 m!943899))

(declare-fun m!943901 () Bool)

(assert (=> b!1025720 m!943901))

(declare-fun m!943903 () Bool)

(assert (=> b!1025719 m!943903))

(declare-fun m!943905 () Bool)

(assert (=> b!1025719 m!943905))

(declare-fun m!943907 () Bool)

(assert (=> b!1025719 m!943907))

(declare-fun m!943909 () Bool)

(assert (=> b!1025719 m!943909))

(declare-fun m!943911 () Bool)

(assert (=> b!1025719 m!943911))

(declare-fun m!943913 () Bool)

(assert (=> b!1025719 m!943913))

(declare-fun m!943915 () Bool)

(assert (=> b!1025719 m!943915))

(declare-fun m!943917 () Bool)

(assert (=> start!89446 m!943917))

(check-sat (not b!1025716) tp_is_empty!24165 (not b!1025717) (not b!1025724) (not b!1025720) (not start!89446) (not b_next!20445) (not b!1025719) b_and!32691 (not mapNonEmpty!37676) (not b!1025726))
(check-sat b_and!32691 (not b_next!20445))
