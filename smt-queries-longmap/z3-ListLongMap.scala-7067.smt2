; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89458 () Bool)

(assert start!89458)

(declare-fun b!1025901 () Bool)

(declare-fun b_free!20457 () Bool)

(declare-fun b_next!20457 () Bool)

(assert (=> b!1025901 (= b_free!20457 (not b_next!20457))))

(declare-fun tp!72416 () Bool)

(declare-fun b_and!32703 () Bool)

(assert (=> b!1025901 (= tp!72416 b_and!32703)))

(declare-fun b!1025899 () Bool)

(declare-fun e!578541 () Bool)

(declare-fun tp_is_empty!24177 () Bool)

(assert (=> b!1025899 (= e!578541 tp_is_empty!24177)))

(declare-fun b!1025900 () Bool)

(declare-fun e!578539 () Bool)

(assert (=> b!1025900 (= e!578539 tp_is_empty!24177)))

(declare-fun e!578542 () Bool)

(declare-datatypes ((V!37109 0))(
  ( (V!37110 (val!12139 Int)) )
))
(declare-datatypes ((ValueCell!11385 0))(
  ( (ValueCellFull!11385 (v!14708 V!37109)) (EmptyCell!11385) )
))
(declare-datatypes ((array!64404 0))(
  ( (array!64405 (arr!31011 (Array (_ BitVec 32) (_ BitVec 64))) (size!31524 (_ BitVec 32))) )
))
(declare-datatypes ((array!64406 0))(
  ( (array!64407 (arr!31012 (Array (_ BitVec 32) ValueCell!11385)) (size!31525 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5364 0))(
  ( (LongMapFixedSize!5365 (defaultEntry!6034 Int) (mask!29714 (_ BitVec 32)) (extraKeys!5766 (_ BitVec 32)) (zeroValue!5870 V!37109) (minValue!5870 V!37109) (_size!2737 (_ BitVec 32)) (_keys!11181 array!64404) (_values!6057 array!64406) (_vacant!2737 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5364)

(declare-fun e!578537 () Bool)

(declare-fun array_inv!24019 (array!64404) Bool)

(declare-fun array_inv!24020 (array!64406) Bool)

(assert (=> b!1025901 (= e!578537 (and tp!72416 tp_is_empty!24177 (array_inv!24019 (_keys!11181 thiss!1427)) (array_inv!24020 (_values!6057 thiss!1427)) e!578542))))

(declare-fun mapIsEmpty!37694 () Bool)

(declare-fun mapRes!37694 () Bool)

(assert (=> mapIsEmpty!37694 mapRes!37694))

(declare-fun b!1025902 () Bool)

(assert (=> b!1025902 (= e!578542 (and e!578541 mapRes!37694))))

(declare-fun condMapEmpty!37694 () Bool)

(declare-fun mapDefault!37694 () ValueCell!11385)

(assert (=> b!1025902 (= condMapEmpty!37694 (= (arr!31012 (_values!6057 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11385)) mapDefault!37694)))))

(declare-fun b!1025903 () Bool)

(declare-fun res!686821 () Bool)

(declare-fun e!578540 () Bool)

(assert (=> b!1025903 (=> (not res!686821) (not e!578540))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1025903 (= res!686821 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1025904 () Bool)

(declare-fun e!578536 () Bool)

(assert (=> b!1025904 (= e!578536 true)))

(declare-fun lt!451160 () Bool)

(declare-datatypes ((List!21764 0))(
  ( (Nil!21761) (Cons!21760 (h!22958 (_ BitVec 64)) (t!30826 List!21764)) )
))
(declare-fun arrayNoDuplicates!0 (array!64404 (_ BitVec 32) List!21764) Bool)

(assert (=> b!1025904 (= lt!451160 (arrayNoDuplicates!0 (_keys!11181 thiss!1427) #b00000000000000000000000000000000 Nil!21761))))

(declare-fun b!1025905 () Bool)

(declare-fun e!578538 () Bool)

(assert (=> b!1025905 (= e!578540 e!578538)))

(declare-fun res!686822 () Bool)

(assert (=> b!1025905 (=> (not res!686822) (not e!578538))))

(declare-datatypes ((SeekEntryResult!9633 0))(
  ( (MissingZero!9633 (index!40903 (_ BitVec 32))) (Found!9633 (index!40904 (_ BitVec 32))) (Intermediate!9633 (undefined!10445 Bool) (index!40905 (_ BitVec 32)) (x!91239 (_ BitVec 32))) (Undefined!9633) (MissingVacant!9633 (index!40906 (_ BitVec 32))) )
))
(declare-fun lt!451159 () SeekEntryResult!9633)

(get-info :version)

(assert (=> b!1025905 (= res!686822 ((_ is Found!9633) lt!451159))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!64404 (_ BitVec 32)) SeekEntryResult!9633)

(assert (=> b!1025905 (= lt!451159 (seekEntry!0 key!909 (_keys!11181 thiss!1427) (mask!29714 thiss!1427)))))

(declare-fun res!686819 () Bool)

(assert (=> start!89458 (=> (not res!686819) (not e!578540))))

(declare-fun valid!2040 (LongMapFixedSize!5364) Bool)

(assert (=> start!89458 (= res!686819 (valid!2040 thiss!1427))))

(assert (=> start!89458 e!578540))

(assert (=> start!89458 e!578537))

(assert (=> start!89458 true))

(declare-fun mapNonEmpty!37694 () Bool)

(declare-fun tp!72417 () Bool)

(assert (=> mapNonEmpty!37694 (= mapRes!37694 (and tp!72417 e!578539))))

(declare-fun mapRest!37694 () (Array (_ BitVec 32) ValueCell!11385))

(declare-fun mapValue!37694 () ValueCell!11385)

(declare-fun mapKey!37694 () (_ BitVec 32))

(assert (=> mapNonEmpty!37694 (= (arr!31012 (_values!6057 thiss!1427)) (store mapRest!37694 mapKey!37694 mapValue!37694))))

(declare-fun b!1025906 () Bool)

(assert (=> b!1025906 (= e!578538 (not e!578536))))

(declare-fun res!686820 () Bool)

(assert (=> b!1025906 (=> res!686820 e!578536)))

(assert (=> b!1025906 (= res!686820 (or (bvslt (index!40904 lt!451159) #b00000000000000000000000000000000) (bvsge (index!40904 lt!451159) (size!31524 (_keys!11181 thiss!1427))) (bvsge (size!31524 (_keys!11181 thiss!1427)) #b01111111111111111111111111111111)))))

(declare-fun lt!451161 () array!64404)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64404 (_ BitVec 32)) Bool)

(assert (=> b!1025906 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!451161 (mask!29714 thiss!1427))))

(declare-datatypes ((Unit!33413 0))(
  ( (Unit!33414) )
))
(declare-fun lt!451164 () Unit!33413)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!64404 (_ BitVec 32) (_ BitVec 32)) Unit!33413)

(assert (=> b!1025906 (= lt!451164 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11181 thiss!1427) (index!40904 lt!451159) (mask!29714 thiss!1427)))))

(assert (=> b!1025906 (arrayNoDuplicates!0 lt!451161 #b00000000000000000000000000000000 Nil!21761)))

(declare-fun lt!451162 () Unit!33413)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!64404 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21764) Unit!33413)

(assert (=> b!1025906 (= lt!451162 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11181 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!40904 lt!451159) #b00000000000000000000000000000000 Nil!21761))))

(declare-fun arrayCountValidKeys!0 (array!64404 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1025906 (= (arrayCountValidKeys!0 lt!451161 #b00000000000000000000000000000000 (size!31524 (_keys!11181 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11181 thiss!1427) #b00000000000000000000000000000000 (size!31524 (_keys!11181 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1025906 (= lt!451161 (array!64405 (store (arr!31011 (_keys!11181 thiss!1427)) (index!40904 lt!451159) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31524 (_keys!11181 thiss!1427))))))

(declare-fun lt!451163 () Unit!33413)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!64404 (_ BitVec 32) (_ BitVec 64)) Unit!33413)

(assert (=> b!1025906 (= lt!451163 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11181 thiss!1427) (index!40904 lt!451159) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!89458 res!686819) b!1025903))

(assert (= (and b!1025903 res!686821) b!1025905))

(assert (= (and b!1025905 res!686822) b!1025906))

(assert (= (and b!1025906 (not res!686820)) b!1025904))

(assert (= (and b!1025902 condMapEmpty!37694) mapIsEmpty!37694))

(assert (= (and b!1025902 (not condMapEmpty!37694)) mapNonEmpty!37694))

(assert (= (and mapNonEmpty!37694 ((_ is ValueCellFull!11385) mapValue!37694)) b!1025900))

(assert (= (and b!1025902 ((_ is ValueCellFull!11385) mapDefault!37694)) b!1025899))

(assert (= b!1025901 b!1025902))

(assert (= start!89458 b!1025901))

(declare-fun m!944075 () Bool)

(assert (=> mapNonEmpty!37694 m!944075))

(declare-fun m!944077 () Bool)

(assert (=> b!1025901 m!944077))

(declare-fun m!944079 () Bool)

(assert (=> b!1025901 m!944079))

(declare-fun m!944081 () Bool)

(assert (=> b!1025904 m!944081))

(declare-fun m!944083 () Bool)

(assert (=> b!1025906 m!944083))

(declare-fun m!944085 () Bool)

(assert (=> b!1025906 m!944085))

(declare-fun m!944087 () Bool)

(assert (=> b!1025906 m!944087))

(declare-fun m!944089 () Bool)

(assert (=> b!1025906 m!944089))

(declare-fun m!944091 () Bool)

(assert (=> b!1025906 m!944091))

(declare-fun m!944093 () Bool)

(assert (=> b!1025906 m!944093))

(declare-fun m!944095 () Bool)

(assert (=> b!1025906 m!944095))

(declare-fun m!944097 () Bool)

(assert (=> b!1025906 m!944097))

(declare-fun m!944099 () Bool)

(assert (=> b!1025905 m!944099))

(declare-fun m!944101 () Bool)

(assert (=> start!89458 m!944101))

(check-sat (not start!89458) (not b!1025906) tp_is_empty!24177 (not mapNonEmpty!37694) b_and!32703 (not b_next!20457) (not b!1025901) (not b!1025905) (not b!1025904))
(check-sat b_and!32703 (not b_next!20457))
