; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89496 () Bool)

(assert start!89496)

(declare-fun b!1026256 () Bool)

(declare-fun b_free!20497 () Bool)

(declare-fun b_next!20497 () Bool)

(assert (=> b!1026256 (= b_free!20497 (not b_next!20497))))

(declare-fun tp!72537 () Bool)

(declare-fun b_and!32717 () Bool)

(assert (=> b!1026256 (= tp!72537 b_and!32717)))

(declare-fun b!1026250 () Bool)

(declare-fun e!578925 () Bool)

(declare-fun tp_is_empty!24217 () Bool)

(assert (=> b!1026250 (= e!578925 tp_is_empty!24217)))

(declare-fun b!1026252 () Bool)

(declare-fun res!687015 () Bool)

(declare-fun e!578930 () Bool)

(assert (=> b!1026252 (=> res!687015 e!578930)))

(declare-datatypes ((V!37163 0))(
  ( (V!37164 (val!12159 Int)) )
))
(declare-datatypes ((ValueCell!11405 0))(
  ( (ValueCellFull!11405 (v!14727 V!37163)) (EmptyCell!11405) )
))
(declare-datatypes ((array!64423 0))(
  ( (array!64424 (arr!31020 (Array (_ BitVec 32) (_ BitVec 64))) (size!31535 (_ BitVec 32))) )
))
(declare-datatypes ((array!64425 0))(
  ( (array!64426 (arr!31021 (Array (_ BitVec 32) ValueCell!11405)) (size!31536 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5404 0))(
  ( (LongMapFixedSize!5405 (defaultEntry!6054 Int) (mask!29743 (_ BitVec 32)) (extraKeys!5786 (_ BitVec 32)) (zeroValue!5890 V!37163) (minValue!5890 V!37163) (_size!2757 (_ BitVec 32)) (_keys!11197 array!64423) (_values!6077 array!64425) (_vacant!2757 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5404)

(assert (=> b!1026252 (= res!687015 (or (not (= (size!31536 (_values!6077 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!29743 thiss!1427)))) (not (= (size!31535 (_keys!11197 thiss!1427)) (size!31536 (_values!6077 thiss!1427)))) (bvslt (mask!29743 thiss!1427) #b00000000000000000000000000000000) (bvslt (extraKeys!5786 thiss!1427) #b00000000000000000000000000000000) (bvsgt (extraKeys!5786 thiss!1427) #b00000000000000000000000000000011)))))

(declare-fun b!1026253 () Bool)

(declare-fun e!578926 () Bool)

(assert (=> b!1026253 (= e!578926 (not e!578930))))

(declare-fun res!687019 () Bool)

(assert (=> b!1026253 (=> res!687019 e!578930)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1026253 (= res!687019 (not (validMask!0 (mask!29743 thiss!1427))))))

(declare-fun lt!451334 () array!64423)

(declare-fun key!909 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!64423 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1026253 (not (arrayContainsKey!0 lt!451334 key!909 #b00000000000000000000000000000000))))

(declare-datatypes ((SeekEntryResult!9641 0))(
  ( (MissingZero!9641 (index!40935 (_ BitVec 32))) (Found!9641 (index!40936 (_ BitVec 32))) (Intermediate!9641 (undefined!10453 Bool) (index!40937 (_ BitVec 32)) (x!91300 (_ BitVec 32))) (Undefined!9641) (MissingVacant!9641 (index!40938 (_ BitVec 32))) )
))
(declare-fun lt!451336 () SeekEntryResult!9641)

(declare-datatypes ((Unit!33333 0))(
  ( (Unit!33334) )
))
(declare-fun lt!451330 () Unit!33333)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!64423 (_ BitVec 32) (_ BitVec 64)) Unit!33333)

(assert (=> b!1026253 (= lt!451330 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11197 thiss!1427) (index!40936 lt!451336) key!909))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64423 (_ BitVec 32)) Bool)

(assert (=> b!1026253 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!451334 (mask!29743 thiss!1427))))

(declare-fun lt!451332 () Unit!33333)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!64423 (_ BitVec 32) (_ BitVec 32)) Unit!33333)

(assert (=> b!1026253 (= lt!451332 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11197 thiss!1427) (index!40936 lt!451336) (mask!29743 thiss!1427)))))

(declare-datatypes ((List!21814 0))(
  ( (Nil!21811) (Cons!21810 (h!23008 (_ BitVec 64)) (t!30867 List!21814)) )
))
(declare-fun arrayNoDuplicates!0 (array!64423 (_ BitVec 32) List!21814) Bool)

(assert (=> b!1026253 (arrayNoDuplicates!0 lt!451334 #b00000000000000000000000000000000 Nil!21811)))

(declare-fun lt!451335 () Unit!33333)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!64423 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21814) Unit!33333)

(assert (=> b!1026253 (= lt!451335 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11197 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!40936 lt!451336) #b00000000000000000000000000000000 Nil!21811))))

(declare-fun arrayCountValidKeys!0 (array!64423 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1026253 (= (arrayCountValidKeys!0 lt!451334 #b00000000000000000000000000000000 (size!31535 (_keys!11197 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11197 thiss!1427) #b00000000000000000000000000000000 (size!31535 (_keys!11197 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1026253 (= lt!451334 (array!64424 (store (arr!31020 (_keys!11197 thiss!1427)) (index!40936 lt!451336) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31535 (_keys!11197 thiss!1427))))))

(declare-fun lt!451331 () Unit!33333)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!64423 (_ BitVec 32) (_ BitVec 64)) Unit!33333)

(assert (=> b!1026253 (= lt!451331 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11197 thiss!1427) (index!40936 lt!451336) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1026254 () Bool)

(declare-fun e!578929 () Bool)

(assert (=> b!1026254 (= e!578929 tp_is_empty!24217)))

(declare-fun b!1026255 () Bool)

(declare-fun e!578924 () Bool)

(declare-fun mapRes!37754 () Bool)

(assert (=> b!1026255 (= e!578924 (and e!578929 mapRes!37754))))

(declare-fun condMapEmpty!37754 () Bool)

(declare-fun mapDefault!37754 () ValueCell!11405)

(assert (=> b!1026255 (= condMapEmpty!37754 (= (arr!31021 (_values!6077 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11405)) mapDefault!37754)))))

(declare-fun e!578931 () Bool)

(declare-fun array_inv!24033 (array!64423) Bool)

(declare-fun array_inv!24034 (array!64425) Bool)

(assert (=> b!1026256 (= e!578931 (and tp!72537 tp_is_empty!24217 (array_inv!24033 (_keys!11197 thiss!1427)) (array_inv!24034 (_values!6077 thiss!1427)) e!578924))))

(declare-fun mapIsEmpty!37754 () Bool)

(assert (=> mapIsEmpty!37754 mapRes!37754))

(declare-fun b!1026257 () Bool)

(declare-fun e!578927 () Bool)

(assert (=> b!1026257 (= e!578927 e!578926)))

(declare-fun res!687018 () Bool)

(assert (=> b!1026257 (=> (not res!687018) (not e!578926))))

(get-info :version)

(assert (=> b!1026257 (= res!687018 ((_ is Found!9641) lt!451336))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!64423 (_ BitVec 32)) SeekEntryResult!9641)

(assert (=> b!1026257 (= lt!451336 (seekEntry!0 key!909 (_keys!11197 thiss!1427) (mask!29743 thiss!1427)))))

(declare-fun b!1026258 () Bool)

(declare-fun res!687014 () Bool)

(assert (=> b!1026258 (=> res!687014 e!578930)))

(assert (=> b!1026258 (= res!687014 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11197 thiss!1427) (mask!29743 thiss!1427))))))

(declare-fun res!687017 () Bool)

(assert (=> start!89496 (=> (not res!687017) (not e!578927))))

(declare-fun valid!2048 (LongMapFixedSize!5404) Bool)

(assert (=> start!89496 (= res!687017 (valid!2048 thiss!1427))))

(assert (=> start!89496 e!578927))

(assert (=> start!89496 e!578931))

(assert (=> start!89496 true))

(declare-fun b!1026251 () Bool)

(declare-fun res!687016 () Bool)

(assert (=> b!1026251 (=> (not res!687016) (not e!578927))))

(assert (=> b!1026251 (= res!687016 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1026259 () Bool)

(assert (=> b!1026259 (= e!578930 true)))

(declare-fun lt!451333 () Bool)

(assert (=> b!1026259 (= lt!451333 (arrayNoDuplicates!0 (_keys!11197 thiss!1427) #b00000000000000000000000000000000 Nil!21811))))

(declare-fun mapNonEmpty!37754 () Bool)

(declare-fun tp!72536 () Bool)

(assert (=> mapNonEmpty!37754 (= mapRes!37754 (and tp!72536 e!578925))))

(declare-fun mapKey!37754 () (_ BitVec 32))

(declare-fun mapRest!37754 () (Array (_ BitVec 32) ValueCell!11405))

(declare-fun mapValue!37754 () ValueCell!11405)

(assert (=> mapNonEmpty!37754 (= (arr!31021 (_values!6077 thiss!1427)) (store mapRest!37754 mapKey!37754 mapValue!37754))))

(assert (= (and start!89496 res!687017) b!1026251))

(assert (= (and b!1026251 res!687016) b!1026257))

(assert (= (and b!1026257 res!687018) b!1026253))

(assert (= (and b!1026253 (not res!687019)) b!1026252))

(assert (= (and b!1026252 (not res!687015)) b!1026258))

(assert (= (and b!1026258 (not res!687014)) b!1026259))

(assert (= (and b!1026255 condMapEmpty!37754) mapIsEmpty!37754))

(assert (= (and b!1026255 (not condMapEmpty!37754)) mapNonEmpty!37754))

(assert (= (and mapNonEmpty!37754 ((_ is ValueCellFull!11405) mapValue!37754)) b!1026250))

(assert (= (and b!1026255 ((_ is ValueCellFull!11405) mapDefault!37754)) b!1026254))

(assert (= b!1026256 b!1026255))

(assert (= start!89496 b!1026256))

(declare-fun m!944039 () Bool)

(assert (=> start!89496 m!944039))

(declare-fun m!944041 () Bool)

(assert (=> b!1026253 m!944041))

(declare-fun m!944043 () Bool)

(assert (=> b!1026253 m!944043))

(declare-fun m!944045 () Bool)

(assert (=> b!1026253 m!944045))

(declare-fun m!944047 () Bool)

(assert (=> b!1026253 m!944047))

(declare-fun m!944049 () Bool)

(assert (=> b!1026253 m!944049))

(declare-fun m!944051 () Bool)

(assert (=> b!1026253 m!944051))

(declare-fun m!944053 () Bool)

(assert (=> b!1026253 m!944053))

(declare-fun m!944055 () Bool)

(assert (=> b!1026253 m!944055))

(declare-fun m!944057 () Bool)

(assert (=> b!1026253 m!944057))

(declare-fun m!944059 () Bool)

(assert (=> b!1026253 m!944059))

(declare-fun m!944061 () Bool)

(assert (=> b!1026253 m!944061))

(declare-fun m!944063 () Bool)

(assert (=> b!1026258 m!944063))

(declare-fun m!944065 () Bool)

(assert (=> b!1026259 m!944065))

(declare-fun m!944067 () Bool)

(assert (=> b!1026256 m!944067))

(declare-fun m!944069 () Bool)

(assert (=> b!1026256 m!944069))

(declare-fun m!944071 () Bool)

(assert (=> mapNonEmpty!37754 m!944071))

(declare-fun m!944073 () Bool)

(assert (=> b!1026257 m!944073))

(check-sat tp_is_empty!24217 (not b_next!20497) b_and!32717 (not b!1026259) (not b!1026256) (not mapNonEmpty!37754) (not b!1026257) (not b!1026258) (not b!1026253) (not start!89496))
(check-sat b_and!32717 (not b_next!20497))
