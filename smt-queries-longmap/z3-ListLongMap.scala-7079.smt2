; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89762 () Bool)

(assert start!89762)

(declare-fun b!1028170 () Bool)

(declare-fun b_free!20527 () Bool)

(declare-fun b_next!20527 () Bool)

(assert (=> b!1028170 (= b_free!20527 (not b_next!20527))))

(declare-fun tp!72627 () Bool)

(declare-fun b_and!32783 () Bool)

(assert (=> b!1028170 (= tp!72627 b_and!32783)))

(declare-fun b!1028166 () Bool)

(declare-fun e!580221 () Bool)

(declare-fun e!580219 () Bool)

(assert (=> b!1028166 (= e!580221 (not e!580219))))

(declare-fun res!687866 () Bool)

(assert (=> b!1028166 (=> res!687866 e!580219)))

(declare-datatypes ((V!37203 0))(
  ( (V!37204 (val!12174 Int)) )
))
(declare-datatypes ((ValueCell!11420 0))(
  ( (ValueCellFull!11420 (v!14739 V!37203)) (EmptyCell!11420) )
))
(declare-datatypes ((array!64593 0))(
  ( (array!64594 (arr!31099 (Array (_ BitVec 32) (_ BitVec 64))) (size!31613 (_ BitVec 32))) )
))
(declare-datatypes ((array!64595 0))(
  ( (array!64596 (arr!31100 (Array (_ BitVec 32) ValueCell!11420)) (size!31614 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5434 0))(
  ( (LongMapFixedSize!5435 (defaultEntry!6069 Int) (mask!29833 (_ BitVec 32)) (extraKeys!5801 (_ BitVec 32)) (zeroValue!5905 V!37203) (minValue!5905 V!37203) (_size!2772 (_ BitVec 32)) (_keys!11254 array!64593) (_values!6092 array!64595) (_vacant!2772 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5434)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1028166 (= res!687866 (not (validMask!0 (mask!29833 thiss!1427))))))

(declare-fun lt!452361 () array!64593)

(declare-fun key!909 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!64593 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1028166 (not (arrayContainsKey!0 lt!452361 key!909 #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!33468 0))(
  ( (Unit!33469) )
))
(declare-fun lt!452364 () Unit!33468)

(declare-datatypes ((SeekEntryResult!9613 0))(
  ( (MissingZero!9613 (index!40823 (_ BitVec 32))) (Found!9613 (index!40824 (_ BitVec 32))) (Intermediate!9613 (undefined!10425 Bool) (index!40825 (_ BitVec 32)) (x!91337 (_ BitVec 32))) (Undefined!9613) (MissingVacant!9613 (index!40826 (_ BitVec 32))) )
))
(declare-fun lt!452366 () SeekEntryResult!9613)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!64593 (_ BitVec 32) (_ BitVec 64)) Unit!33468)

(assert (=> b!1028166 (= lt!452364 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11254 thiss!1427) (index!40824 lt!452366) key!909))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64593 (_ BitVec 32)) Bool)

(assert (=> b!1028166 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!452361 (mask!29833 thiss!1427))))

(declare-fun lt!452360 () Unit!33468)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!64593 (_ BitVec 32) (_ BitVec 32)) Unit!33468)

(assert (=> b!1028166 (= lt!452360 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11254 thiss!1427) (index!40824 lt!452366) (mask!29833 thiss!1427)))))

(declare-datatypes ((List!21778 0))(
  ( (Nil!21775) (Cons!21774 (h!22981 (_ BitVec 64)) (t!30832 List!21778)) )
))
(declare-fun arrayNoDuplicates!0 (array!64593 (_ BitVec 32) List!21778) Bool)

(assert (=> b!1028166 (arrayNoDuplicates!0 lt!452361 #b00000000000000000000000000000000 Nil!21775)))

(declare-fun lt!452362 () Unit!33468)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!64593 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21778) Unit!33468)

(assert (=> b!1028166 (= lt!452362 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11254 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!40824 lt!452366) #b00000000000000000000000000000000 Nil!21775))))

(declare-fun arrayCountValidKeys!0 (array!64593 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1028166 (= (arrayCountValidKeys!0 lt!452361 #b00000000000000000000000000000000 (size!31613 (_keys!11254 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11254 thiss!1427) #b00000000000000000000000000000000 (size!31613 (_keys!11254 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1028166 (= lt!452361 (array!64594 (store (arr!31099 (_keys!11254 thiss!1427)) (index!40824 lt!452366) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31613 (_keys!11254 thiss!1427))))))

(declare-fun lt!452365 () Unit!33468)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!64593 (_ BitVec 32) (_ BitVec 64)) Unit!33468)

(assert (=> b!1028166 (= lt!452365 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11254 thiss!1427) (index!40824 lt!452366) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1028168 () Bool)

(declare-fun e!580223 () Bool)

(assert (=> b!1028168 (= e!580223 e!580221)))

(declare-fun res!687861 () Bool)

(assert (=> b!1028168 (=> (not res!687861) (not e!580221))))

(get-info :version)

(assert (=> b!1028168 (= res!687861 ((_ is Found!9613) lt!452366))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!64593 (_ BitVec 32)) SeekEntryResult!9613)

(assert (=> b!1028168 (= lt!452366 (seekEntry!0 key!909 (_keys!11254 thiss!1427) (mask!29833 thiss!1427)))))

(declare-fun b!1028169 () Bool)

(declare-fun e!580224 () Bool)

(declare-fun tp_is_empty!24247 () Bool)

(assert (=> b!1028169 (= e!580224 tp_is_empty!24247)))

(declare-fun e!580225 () Bool)

(declare-fun e!580220 () Bool)

(declare-fun array_inv!24093 (array!64593) Bool)

(declare-fun array_inv!24094 (array!64595) Bool)

(assert (=> b!1028170 (= e!580225 (and tp!72627 tp_is_empty!24247 (array_inv!24093 (_keys!11254 thiss!1427)) (array_inv!24094 (_values!6092 thiss!1427)) e!580220))))

(declare-fun b!1028171 () Bool)

(declare-fun e!580218 () Bool)

(assert (=> b!1028171 (= e!580218 tp_is_empty!24247)))

(declare-fun mapNonEmpty!37799 () Bool)

(declare-fun mapRes!37799 () Bool)

(declare-fun tp!72626 () Bool)

(assert (=> mapNonEmpty!37799 (= mapRes!37799 (and tp!72626 e!580224))))

(declare-fun mapValue!37799 () ValueCell!11420)

(declare-fun mapRest!37799 () (Array (_ BitVec 32) ValueCell!11420))

(declare-fun mapKey!37799 () (_ BitVec 32))

(assert (=> mapNonEmpty!37799 (= (arr!31100 (_values!6092 thiss!1427)) (store mapRest!37799 mapKey!37799 mapValue!37799))))

(declare-fun b!1028172 () Bool)

(declare-fun res!687863 () Bool)

(assert (=> b!1028172 (=> res!687863 e!580219)))

(assert (=> b!1028172 (= res!687863 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11254 thiss!1427) (mask!29833 thiss!1427))))))

(declare-fun b!1028173 () Bool)

(assert (=> b!1028173 (= e!580219 true)))

(declare-fun lt!452363 () Bool)

(assert (=> b!1028173 (= lt!452363 (arrayNoDuplicates!0 (_keys!11254 thiss!1427) #b00000000000000000000000000000000 Nil!21775))))

(declare-fun b!1028174 () Bool)

(declare-fun res!687864 () Bool)

(assert (=> b!1028174 (=> res!687864 e!580219)))

(assert (=> b!1028174 (= res!687864 (or (not (= (size!31614 (_values!6092 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!29833 thiss!1427)))) (not (= (size!31613 (_keys!11254 thiss!1427)) (size!31614 (_values!6092 thiss!1427)))) (bvslt (mask!29833 thiss!1427) #b00000000000000000000000000000000) (bvslt (extraKeys!5801 thiss!1427) #b00000000000000000000000000000000) (bvsgt (extraKeys!5801 thiss!1427) #b00000000000000000000000000000011)))))

(declare-fun res!687865 () Bool)

(assert (=> start!89762 (=> (not res!687865) (not e!580223))))

(declare-fun valid!2069 (LongMapFixedSize!5434) Bool)

(assert (=> start!89762 (= res!687865 (valid!2069 thiss!1427))))

(assert (=> start!89762 e!580223))

(assert (=> start!89762 e!580225))

(assert (=> start!89762 true))

(declare-fun b!1028167 () Bool)

(declare-fun res!687862 () Bool)

(assert (=> b!1028167 (=> (not res!687862) (not e!580223))))

(assert (=> b!1028167 (= res!687862 (not (= key!909 (bvneg key!909))))))

(declare-fun mapIsEmpty!37799 () Bool)

(assert (=> mapIsEmpty!37799 mapRes!37799))

(declare-fun b!1028175 () Bool)

(assert (=> b!1028175 (= e!580220 (and e!580218 mapRes!37799))))

(declare-fun condMapEmpty!37799 () Bool)

(declare-fun mapDefault!37799 () ValueCell!11420)

(assert (=> b!1028175 (= condMapEmpty!37799 (= (arr!31100 (_values!6092 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11420)) mapDefault!37799)))))

(assert (= (and start!89762 res!687865) b!1028167))

(assert (= (and b!1028167 res!687862) b!1028168))

(assert (= (and b!1028168 res!687861) b!1028166))

(assert (= (and b!1028166 (not res!687866)) b!1028174))

(assert (= (and b!1028174 (not res!687864)) b!1028172))

(assert (= (and b!1028172 (not res!687863)) b!1028173))

(assert (= (and b!1028175 condMapEmpty!37799) mapIsEmpty!37799))

(assert (= (and b!1028175 (not condMapEmpty!37799)) mapNonEmpty!37799))

(assert (= (and mapNonEmpty!37799 ((_ is ValueCellFull!11420) mapValue!37799)) b!1028169))

(assert (= (and b!1028175 ((_ is ValueCellFull!11420) mapDefault!37799)) b!1028171))

(assert (= b!1028170 b!1028175))

(assert (= start!89762 b!1028170))

(declare-fun m!946863 () Bool)

(assert (=> b!1028168 m!946863))

(declare-fun m!946865 () Bool)

(assert (=> start!89762 m!946865))

(declare-fun m!946867 () Bool)

(assert (=> b!1028172 m!946867))

(declare-fun m!946869 () Bool)

(assert (=> b!1028170 m!946869))

(declare-fun m!946871 () Bool)

(assert (=> b!1028170 m!946871))

(declare-fun m!946873 () Bool)

(assert (=> mapNonEmpty!37799 m!946873))

(declare-fun m!946875 () Bool)

(assert (=> b!1028173 m!946875))

(declare-fun m!946877 () Bool)

(assert (=> b!1028166 m!946877))

(declare-fun m!946879 () Bool)

(assert (=> b!1028166 m!946879))

(declare-fun m!946881 () Bool)

(assert (=> b!1028166 m!946881))

(declare-fun m!946883 () Bool)

(assert (=> b!1028166 m!946883))

(declare-fun m!946885 () Bool)

(assert (=> b!1028166 m!946885))

(declare-fun m!946887 () Bool)

(assert (=> b!1028166 m!946887))

(declare-fun m!946889 () Bool)

(assert (=> b!1028166 m!946889))

(declare-fun m!946891 () Bool)

(assert (=> b!1028166 m!946891))

(declare-fun m!946893 () Bool)

(assert (=> b!1028166 m!946893))

(declare-fun m!946895 () Bool)

(assert (=> b!1028166 m!946895))

(declare-fun m!946897 () Bool)

(assert (=> b!1028166 m!946897))

(check-sat (not b!1028168) (not start!89762) (not b!1028172) (not mapNonEmpty!37799) b_and!32783 (not b!1028170) (not b!1028173) tp_is_empty!24247 (not b!1028166) (not b_next!20527))
(check-sat b_and!32783 (not b_next!20527))
