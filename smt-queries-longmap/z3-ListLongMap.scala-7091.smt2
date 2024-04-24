; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!90120 () Bool)

(assert start!90120)

(declare-fun b!1031009 () Bool)

(declare-fun b_free!20599 () Bool)

(declare-fun b_next!20599 () Bool)

(assert (=> b!1031009 (= b_free!20599 (not b_next!20599))))

(declare-fun tp!72860 () Bool)

(declare-fun b_and!32951 () Bool)

(assert (=> b!1031009 (= tp!72860 b_and!32951)))

(declare-fun res!689230 () Bool)

(declare-fun e!582214 () Bool)

(assert (=> start!90120 (=> (not res!689230) (not e!582214))))

(declare-datatypes ((V!37299 0))(
  ( (V!37300 (val!12210 Int)) )
))
(declare-datatypes ((ValueCell!11456 0))(
  ( (ValueCellFull!11456 (v!14781 V!37299)) (EmptyCell!11456) )
))
(declare-datatypes ((array!64747 0))(
  ( (array!64748 (arr!31171 (Array (_ BitVec 32) (_ BitVec 64))) (size!31688 (_ BitVec 32))) )
))
(declare-datatypes ((array!64749 0))(
  ( (array!64750 (arr!31172 (Array (_ BitVec 32) ValueCell!11456)) (size!31689 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5506 0))(
  ( (LongMapFixedSize!5507 (defaultEntry!6121 Int) (mask!29944 (_ BitVec 32)) (extraKeys!5853 (_ BitVec 32)) (zeroValue!5957 V!37299) (minValue!5957 V!37299) (_size!2808 (_ BitVec 32)) (_keys!11325 array!64747) (_values!6144 array!64749) (_vacant!2808 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5506)

(declare-fun valid!2093 (LongMapFixedSize!5506) Bool)

(assert (=> start!90120 (= res!689230 (valid!2093 thiss!1427))))

(assert (=> start!90120 e!582214))

(declare-fun e!582215 () Bool)

(assert (=> start!90120 e!582215))

(assert (=> start!90120 true))

(declare-fun b!1031006 () Bool)

(declare-fun e!582216 () Bool)

(declare-fun e!582218 () Bool)

(declare-fun mapRes!37925 () Bool)

(assert (=> b!1031006 (= e!582216 (and e!582218 mapRes!37925))))

(declare-fun condMapEmpty!37925 () Bool)

(declare-fun mapDefault!37925 () ValueCell!11456)

(assert (=> b!1031006 (= condMapEmpty!37925 (= (arr!31172 (_values!6144 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11456)) mapDefault!37925)))))

(declare-fun b!1031007 () Bool)

(declare-fun res!689231 () Bool)

(assert (=> b!1031007 (=> (not res!689231) (not e!582214))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1031007 (= res!689231 (not (= key!909 (bvneg key!909))))))

(declare-fun mapIsEmpty!37925 () Bool)

(assert (=> mapIsEmpty!37925 mapRes!37925))

(declare-fun b!1031008 () Bool)

(declare-fun tp_is_empty!24319 () Bool)

(assert (=> b!1031008 (= e!582218 tp_is_empty!24319)))

(declare-fun array_inv!24147 (array!64747) Bool)

(declare-fun array_inv!24148 (array!64749) Bool)

(assert (=> b!1031009 (= e!582215 (and tp!72860 tp_is_empty!24319 (array_inv!24147 (_keys!11325 thiss!1427)) (array_inv!24148 (_values!6144 thiss!1427)) e!582216))))

(declare-fun b!1031010 () Bool)

(declare-fun e!582220 () Bool)

(declare-fun e!582219 () Bool)

(assert (=> b!1031010 (= e!582220 (not e!582219))))

(declare-fun res!689228 () Bool)

(assert (=> b!1031010 (=> res!689228 e!582219)))

(declare-datatypes ((Unit!33642 0))(
  ( (Unit!33643) )
))
(declare-datatypes ((tuple2!15580 0))(
  ( (tuple2!15581 (_1!7801 Unit!33642) (_2!7801 LongMapFixedSize!5506)) )
))
(declare-fun lt!454489 () tuple2!15580)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1031010 (= res!689228 (not (validMask!0 (mask!29944 (_2!7801 lt!454489)))))))

(declare-fun lt!454491 () array!64747)

(declare-fun lt!454494 () array!64749)

(declare-fun Unit!33644 () Unit!33642)

(declare-fun Unit!33645 () Unit!33642)

(assert (=> b!1031010 (= lt!454489 (ite (bvsgt (bvadd #b00000000000000000000000000000001 (_vacant!2808 thiss!1427)) #b00000000000000000000000000000000) (tuple2!15581 Unit!33644 (LongMapFixedSize!5507 (defaultEntry!6121 thiss!1427) (mask!29944 thiss!1427) (extraKeys!5853 thiss!1427) (zeroValue!5957 thiss!1427) (minValue!5957 thiss!1427) (bvsub (_size!2808 thiss!1427) #b00000000000000000000000000000001) lt!454491 lt!454494 (bvadd #b00000000000000000000000000000001 (_vacant!2808 thiss!1427)))) (tuple2!15581 Unit!33645 (LongMapFixedSize!5507 (defaultEntry!6121 thiss!1427) (mask!29944 thiss!1427) (extraKeys!5853 thiss!1427) (zeroValue!5957 thiss!1427) (minValue!5957 thiss!1427) (bvsub (_size!2808 thiss!1427) #b00000000000000000000000000000001) lt!454491 lt!454494 (_vacant!2808 thiss!1427)))))))

(declare-datatypes ((tuple2!15582 0))(
  ( (tuple2!15583 (_1!7802 (_ BitVec 64)) (_2!7802 V!37299)) )
))
(declare-datatypes ((List!21816 0))(
  ( (Nil!21813) (Cons!21812 (h!23022 tuple2!15582) (t!30902 List!21816)) )
))
(declare-datatypes ((ListLongMap!13699 0))(
  ( (ListLongMap!13700 (toList!6865 List!21816)) )
))
(declare-fun -!488 (ListLongMap!13699 (_ BitVec 64)) ListLongMap!13699)

(declare-fun getCurrentListMap!3911 (array!64747 array!64749 (_ BitVec 32) (_ BitVec 32) V!37299 V!37299 (_ BitVec 32) Int) ListLongMap!13699)

(assert (=> b!1031010 (= (-!488 (getCurrentListMap!3911 (_keys!11325 thiss!1427) (_values!6144 thiss!1427) (mask!29944 thiss!1427) (extraKeys!5853 thiss!1427) (zeroValue!5957 thiss!1427) (minValue!5957 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6121 thiss!1427)) key!909) (getCurrentListMap!3911 lt!454491 lt!454494 (mask!29944 thiss!1427) (extraKeys!5853 thiss!1427) (zeroValue!5957 thiss!1427) (minValue!5957 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6121 thiss!1427)))))

(declare-datatypes ((SeekEntryResult!9641 0))(
  ( (MissingZero!9641 (index!40935 (_ BitVec 32))) (Found!9641 (index!40936 (_ BitVec 32))) (Intermediate!9641 (undefined!10453 Bool) (index!40937 (_ BitVec 32)) (x!91611 (_ BitVec 32))) (Undefined!9641) (MissingVacant!9641 (index!40938 (_ BitVec 32))) )
))
(declare-fun lt!454488 () SeekEntryResult!9641)

(declare-fun dynLambda!1982 (Int (_ BitVec 64)) V!37299)

(assert (=> b!1031010 (= lt!454494 (array!64750 (store (arr!31172 (_values!6144 thiss!1427)) (index!40936 lt!454488) (ValueCellFull!11456 (dynLambda!1982 (defaultEntry!6121 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!31689 (_values!6144 thiss!1427))))))

(declare-fun lt!454486 () Unit!33642)

(declare-fun lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!14 (array!64747 array!64749 (_ BitVec 32) (_ BitVec 32) V!37299 V!37299 (_ BitVec 32) (_ BitVec 64) Int) Unit!33642)

(assert (=> b!1031010 (= lt!454486 (lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!14 (_keys!11325 thiss!1427) (_values!6144 thiss!1427) (mask!29944 thiss!1427) (extraKeys!5853 thiss!1427) (zeroValue!5957 thiss!1427) (minValue!5957 thiss!1427) (index!40936 lt!454488) key!909 (defaultEntry!6121 thiss!1427)))))

(declare-fun arrayContainsKey!0 (array!64747 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1031010 (not (arrayContainsKey!0 lt!454491 key!909 #b00000000000000000000000000000000))))

(declare-fun lt!454490 () Unit!33642)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!64747 (_ BitVec 32) (_ BitVec 64)) Unit!33642)

(assert (=> b!1031010 (= lt!454490 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11325 thiss!1427) (index!40936 lt!454488) key!909))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64747 (_ BitVec 32)) Bool)

(assert (=> b!1031010 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!454491 (mask!29944 thiss!1427))))

(declare-fun lt!454487 () Unit!33642)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!64747 (_ BitVec 32) (_ BitVec 32)) Unit!33642)

(assert (=> b!1031010 (= lt!454487 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11325 thiss!1427) (index!40936 lt!454488) (mask!29944 thiss!1427)))))

(declare-datatypes ((List!21817 0))(
  ( (Nil!21814) (Cons!21813 (h!23023 (_ BitVec 64)) (t!30903 List!21817)) )
))
(declare-fun arrayNoDuplicates!0 (array!64747 (_ BitVec 32) List!21817) Bool)

(assert (=> b!1031010 (arrayNoDuplicates!0 lt!454491 #b00000000000000000000000000000000 Nil!21814)))

(declare-fun lt!454493 () Unit!33642)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!64747 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21817) Unit!33642)

(assert (=> b!1031010 (= lt!454493 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11325 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!40936 lt!454488) #b00000000000000000000000000000000 Nil!21814))))

(declare-fun arrayCountValidKeys!0 (array!64747 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1031010 (= (arrayCountValidKeys!0 lt!454491 #b00000000000000000000000000000000 (size!31688 (_keys!11325 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11325 thiss!1427) #b00000000000000000000000000000000 (size!31688 (_keys!11325 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1031010 (= lt!454491 (array!64748 (store (arr!31171 (_keys!11325 thiss!1427)) (index!40936 lt!454488) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31688 (_keys!11325 thiss!1427))))))

(declare-fun lt!454492 () Unit!33642)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!64747 (_ BitVec 32) (_ BitVec 64)) Unit!33642)

(assert (=> b!1031010 (= lt!454492 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11325 thiss!1427) (index!40936 lt!454488) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapNonEmpty!37925 () Bool)

(declare-fun tp!72861 () Bool)

(declare-fun e!582213 () Bool)

(assert (=> mapNonEmpty!37925 (= mapRes!37925 (and tp!72861 e!582213))))

(declare-fun mapRest!37925 () (Array (_ BitVec 32) ValueCell!11456))

(declare-fun mapValue!37925 () ValueCell!11456)

(declare-fun mapKey!37925 () (_ BitVec 32))

(assert (=> mapNonEmpty!37925 (= (arr!31172 (_values!6144 thiss!1427)) (store mapRest!37925 mapKey!37925 mapValue!37925))))

(declare-fun b!1031011 () Bool)

(assert (=> b!1031011 (= e!582213 tp_is_empty!24319)))

(declare-fun b!1031012 () Bool)

(assert (=> b!1031012 (= e!582214 e!582220)))

(declare-fun res!689229 () Bool)

(assert (=> b!1031012 (=> (not res!689229) (not e!582220))))

(get-info :version)

(assert (=> b!1031012 (= res!689229 ((_ is Found!9641) lt!454488))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!64747 (_ BitVec 32)) SeekEntryResult!9641)

(assert (=> b!1031012 (= lt!454488 (seekEntry!0 key!909 (_keys!11325 thiss!1427) (mask!29944 thiss!1427)))))

(declare-fun b!1031013 () Bool)

(assert (=> b!1031013 (= e!582219 (or (not (= (size!31689 (_values!6144 (_2!7801 lt!454489))) (bvadd #b00000000000000000000000000000001 (mask!29944 (_2!7801 lt!454489))))) (not (= (size!31688 (_keys!11325 (_2!7801 lt!454489))) (size!31689 (_values!6144 (_2!7801 lt!454489))))) (bvslt (mask!29944 (_2!7801 lt!454489)) #b00000000000000000000000000000000) (bvslt (extraKeys!5853 (_2!7801 lt!454489)) #b00000000000000000000000000000000) (bvsle (extraKeys!5853 (_2!7801 lt!454489)) #b00000000000000000000000000000011)))))

(assert (= (and start!90120 res!689230) b!1031007))

(assert (= (and b!1031007 res!689231) b!1031012))

(assert (= (and b!1031012 res!689229) b!1031010))

(assert (= (and b!1031010 (not res!689228)) b!1031013))

(assert (= (and b!1031006 condMapEmpty!37925) mapIsEmpty!37925))

(assert (= (and b!1031006 (not condMapEmpty!37925)) mapNonEmpty!37925))

(assert (= (and mapNonEmpty!37925 ((_ is ValueCellFull!11456) mapValue!37925)) b!1031011))

(assert (= (and b!1031006 ((_ is ValueCellFull!11456) mapDefault!37925)) b!1031008))

(assert (= b!1031009 b!1031006))

(assert (= start!90120 b!1031009))

(declare-fun b_lambda!15901 () Bool)

(assert (=> (not b_lambda!15901) (not b!1031010)))

(declare-fun t!30901 () Bool)

(declare-fun tb!6909 () Bool)

(assert (=> (and b!1031009 (= (defaultEntry!6121 thiss!1427) (defaultEntry!6121 thiss!1427)) t!30901) tb!6909))

(declare-fun result!14151 () Bool)

(assert (=> tb!6909 (= result!14151 tp_is_empty!24319)))

(assert (=> b!1031010 t!30901))

(declare-fun b_and!32953 () Bool)

(assert (= b_and!32951 (and (=> t!30901 result!14151) b_and!32953)))

(declare-fun m!950739 () Bool)

(assert (=> mapNonEmpty!37925 m!950739))

(declare-fun m!950741 () Bool)

(assert (=> start!90120 m!950741))

(declare-fun m!950743 () Bool)

(assert (=> b!1031012 m!950743))

(declare-fun m!950745 () Bool)

(assert (=> b!1031009 m!950745))

(declare-fun m!950747 () Bool)

(assert (=> b!1031009 m!950747))

(declare-fun m!950749 () Bool)

(assert (=> b!1031010 m!950749))

(declare-fun m!950751 () Bool)

(assert (=> b!1031010 m!950751))

(declare-fun m!950753 () Bool)

(assert (=> b!1031010 m!950753))

(declare-fun m!950755 () Bool)

(assert (=> b!1031010 m!950755))

(declare-fun m!950757 () Bool)

(assert (=> b!1031010 m!950757))

(declare-fun m!950759 () Bool)

(assert (=> b!1031010 m!950759))

(declare-fun m!950761 () Bool)

(assert (=> b!1031010 m!950761))

(declare-fun m!950763 () Bool)

(assert (=> b!1031010 m!950763))

(declare-fun m!950765 () Bool)

(assert (=> b!1031010 m!950765))

(assert (=> b!1031010 m!950761))

(declare-fun m!950767 () Bool)

(assert (=> b!1031010 m!950767))

(declare-fun m!950769 () Bool)

(assert (=> b!1031010 m!950769))

(declare-fun m!950771 () Bool)

(assert (=> b!1031010 m!950771))

(declare-fun m!950773 () Bool)

(assert (=> b!1031010 m!950773))

(declare-fun m!950775 () Bool)

(assert (=> b!1031010 m!950775))

(declare-fun m!950777 () Bool)

(assert (=> b!1031010 m!950777))

(declare-fun m!950779 () Bool)

(assert (=> b!1031010 m!950779))

(declare-fun m!950781 () Bool)

(assert (=> b!1031010 m!950781))

(check-sat tp_is_empty!24319 (not b!1031009) (not b_lambda!15901) (not start!90120) (not b_next!20599) (not mapNonEmpty!37925) b_and!32953 (not b!1031010) (not b!1031012))
(check-sat b_and!32953 (not b_next!20599))
(get-model)

(declare-fun b_lambda!15907 () Bool)

(assert (= b_lambda!15901 (or (and b!1031009 b_free!20599) b_lambda!15907)))

(check-sat tp_is_empty!24319 (not b!1031009) (not start!90120) (not b_next!20599) (not b_lambda!15907) (not mapNonEmpty!37925) b_and!32953 (not b!1031010) (not b!1031012))
(check-sat b_and!32953 (not b_next!20599))
(get-model)

(declare-fun d!123851 () Bool)

(declare-fun res!689262 () Bool)

(declare-fun e!582271 () Bool)

(assert (=> d!123851 (=> (not res!689262) (not e!582271))))

(declare-fun simpleValid!395 (LongMapFixedSize!5506) Bool)

(assert (=> d!123851 (= res!689262 (simpleValid!395 thiss!1427))))

(assert (=> d!123851 (= (valid!2093 thiss!1427) e!582271)))

(declare-fun b!1031074 () Bool)

(declare-fun res!689263 () Bool)

(assert (=> b!1031074 (=> (not res!689263) (not e!582271))))

(assert (=> b!1031074 (= res!689263 (= (arrayCountValidKeys!0 (_keys!11325 thiss!1427) #b00000000000000000000000000000000 (size!31688 (_keys!11325 thiss!1427))) (_size!2808 thiss!1427)))))

(declare-fun b!1031075 () Bool)

(declare-fun res!689264 () Bool)

(assert (=> b!1031075 (=> (not res!689264) (not e!582271))))

(assert (=> b!1031075 (= res!689264 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11325 thiss!1427) (mask!29944 thiss!1427)))))

(declare-fun b!1031076 () Bool)

(assert (=> b!1031076 (= e!582271 (arrayNoDuplicates!0 (_keys!11325 thiss!1427) #b00000000000000000000000000000000 Nil!21814))))

(assert (= (and d!123851 res!689262) b!1031074))

(assert (= (and b!1031074 res!689263) b!1031075))

(assert (= (and b!1031075 res!689264) b!1031076))

(declare-fun m!950871 () Bool)

(assert (=> d!123851 m!950871))

(assert (=> b!1031074 m!950755))

(declare-fun m!950873 () Bool)

(assert (=> b!1031075 m!950873))

(declare-fun m!950875 () Bool)

(assert (=> b!1031076 m!950875))

(assert (=> start!90120 d!123851))

(declare-fun d!123853 () Bool)

(assert (=> d!123853 (= (array_inv!24147 (_keys!11325 thiss!1427)) (bvsge (size!31688 (_keys!11325 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1031009 d!123853))

(declare-fun d!123855 () Bool)

(assert (=> d!123855 (= (array_inv!24148 (_values!6144 thiss!1427)) (bvsge (size!31689 (_values!6144 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1031009 d!123855))

(declare-fun b!1031085 () Bool)

(declare-fun e!582280 () Bool)

(declare-fun e!582278 () Bool)

(assert (=> b!1031085 (= e!582280 e!582278)))

(declare-fun lt!454556 () (_ BitVec 64))

(assert (=> b!1031085 (= lt!454556 (select (arr!31171 lt!454491) #b00000000000000000000000000000000))))

(declare-fun lt!454555 () Unit!33642)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!64747 (_ BitVec 64) (_ BitVec 32)) Unit!33642)

(assert (=> b!1031085 (= lt!454555 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!454491 lt!454556 #b00000000000000000000000000000000))))

(assert (=> b!1031085 (arrayContainsKey!0 lt!454491 lt!454556 #b00000000000000000000000000000000)))

(declare-fun lt!454557 () Unit!33642)

(assert (=> b!1031085 (= lt!454557 lt!454555)))

(declare-fun res!689270 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!64747 (_ BitVec 32)) SeekEntryResult!9641)

(assert (=> b!1031085 (= res!689270 (= (seekEntryOrOpen!0 (select (arr!31171 lt!454491) #b00000000000000000000000000000000) lt!454491 (mask!29944 thiss!1427)) (Found!9641 #b00000000000000000000000000000000)))))

(assert (=> b!1031085 (=> (not res!689270) (not e!582278))))

(declare-fun b!1031086 () Bool)

(declare-fun e!582279 () Bool)

(assert (=> b!1031086 (= e!582279 e!582280)))

(declare-fun c!104464 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1031086 (= c!104464 (validKeyInArray!0 (select (arr!31171 lt!454491) #b00000000000000000000000000000000)))))

(declare-fun bm!43559 () Bool)

(declare-fun call!43562 () Bool)

(assert (=> bm!43559 (= call!43562 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!454491 (mask!29944 thiss!1427)))))

(declare-fun b!1031087 () Bool)

(assert (=> b!1031087 (= e!582280 call!43562)))

(declare-fun b!1031088 () Bool)

(assert (=> b!1031088 (= e!582278 call!43562)))

(declare-fun d!123857 () Bool)

(declare-fun res!689269 () Bool)

(assert (=> d!123857 (=> res!689269 e!582279)))

(assert (=> d!123857 (= res!689269 (bvsge #b00000000000000000000000000000000 (size!31688 lt!454491)))))

(assert (=> d!123857 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!454491 (mask!29944 thiss!1427)) e!582279)))

(assert (= (and d!123857 (not res!689269)) b!1031086))

(assert (= (and b!1031086 c!104464) b!1031085))

(assert (= (and b!1031086 (not c!104464)) b!1031087))

(assert (= (and b!1031085 res!689270) b!1031088))

(assert (= (or b!1031088 b!1031087) bm!43559))

(declare-fun m!950877 () Bool)

(assert (=> b!1031085 m!950877))

(declare-fun m!950879 () Bool)

(assert (=> b!1031085 m!950879))

(declare-fun m!950881 () Bool)

(assert (=> b!1031085 m!950881))

(assert (=> b!1031085 m!950877))

(declare-fun m!950883 () Bool)

(assert (=> b!1031085 m!950883))

(assert (=> b!1031086 m!950877))

(assert (=> b!1031086 m!950877))

(declare-fun m!950885 () Bool)

(assert (=> b!1031086 m!950885))

(declare-fun m!950887 () Bool)

(assert (=> bm!43559 m!950887))

(assert (=> b!1031010 d!123857))

(declare-fun b!1031131 () Bool)

(declare-fun e!582308 () Bool)

(declare-fun e!582317 () Bool)

(assert (=> b!1031131 (= e!582308 e!582317)))

(declare-fun res!689292 () Bool)

(declare-fun call!43578 () Bool)

(assert (=> b!1031131 (= res!689292 call!43578)))

(assert (=> b!1031131 (=> (not res!689292) (not e!582317))))

(declare-fun b!1031132 () Bool)

(declare-fun res!689297 () Bool)

(declare-fun e!582313 () Bool)

(assert (=> b!1031132 (=> (not res!689297) (not e!582313))))

(assert (=> b!1031132 (= res!689297 e!582308)))

(declare-fun c!104478 () Bool)

(assert (=> b!1031132 (= c!104478 (not (= (bvand (extraKeys!5853 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1031133 () Bool)

(declare-fun c!104482 () Bool)

(assert (=> b!1031133 (= c!104482 (and (not (= (bvand (extraKeys!5853 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5853 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!582318 () ListLongMap!13699)

(declare-fun e!582316 () ListLongMap!13699)

(assert (=> b!1031133 (= e!582318 e!582316)))

(declare-fun bm!43574 () Bool)

(declare-fun call!43583 () ListLongMap!13699)

(declare-fun call!43577 () ListLongMap!13699)

(assert (=> bm!43574 (= call!43583 call!43577)))

(declare-fun bm!43575 () Bool)

(declare-fun call!43579 () ListLongMap!13699)

(declare-fun call!43580 () ListLongMap!13699)

(assert (=> bm!43575 (= call!43579 call!43580)))

(declare-fun b!1031134 () Bool)

(declare-fun e!582314 () Bool)

(declare-fun lt!454608 () ListLongMap!13699)

(declare-fun apply!913 (ListLongMap!13699 (_ BitVec 64)) V!37299)

(declare-fun get!16391 (ValueCell!11456 V!37299) V!37299)

(assert (=> b!1031134 (= e!582314 (= (apply!913 lt!454608 (select (arr!31171 (_keys!11325 thiss!1427)) #b00000000000000000000000000000000)) (get!16391 (select (arr!31172 (_values!6144 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1982 (defaultEntry!6121 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1031134 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31689 (_values!6144 thiss!1427))))))

(assert (=> b!1031134 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31688 (_keys!11325 thiss!1427))))))

(declare-fun b!1031135 () Bool)

(declare-fun e!582311 () Bool)

(assert (=> b!1031135 (= e!582311 (validKeyInArray!0 (select (arr!31171 (_keys!11325 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun d!123859 () Bool)

(assert (=> d!123859 e!582313))

(declare-fun res!689294 () Bool)

(assert (=> d!123859 (=> (not res!689294) (not e!582313))))

(assert (=> d!123859 (= res!689294 (or (bvsge #b00000000000000000000000000000000 (size!31688 (_keys!11325 thiss!1427))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31688 (_keys!11325 thiss!1427))))))))

(declare-fun lt!454602 () ListLongMap!13699)

(assert (=> d!123859 (= lt!454608 lt!454602)))

(declare-fun lt!454614 () Unit!33642)

(declare-fun e!582307 () Unit!33642)

(assert (=> d!123859 (= lt!454614 e!582307)))

(declare-fun c!104481 () Bool)

(declare-fun e!582315 () Bool)

(assert (=> d!123859 (= c!104481 e!582315)))

(declare-fun res!689289 () Bool)

(assert (=> d!123859 (=> (not res!689289) (not e!582315))))

(assert (=> d!123859 (= res!689289 (bvslt #b00000000000000000000000000000000 (size!31688 (_keys!11325 thiss!1427))))))

(declare-fun e!582319 () ListLongMap!13699)

(assert (=> d!123859 (= lt!454602 e!582319)))

(declare-fun c!104480 () Bool)

(assert (=> d!123859 (= c!104480 (and (not (= (bvand (extraKeys!5853 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5853 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!123859 (validMask!0 (mask!29944 thiss!1427))))

(assert (=> d!123859 (= (getCurrentListMap!3911 (_keys!11325 thiss!1427) (_values!6144 thiss!1427) (mask!29944 thiss!1427) (extraKeys!5853 thiss!1427) (zeroValue!5957 thiss!1427) (minValue!5957 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6121 thiss!1427)) lt!454608)))

(declare-fun b!1031136 () Bool)

(declare-fun e!582310 () Bool)

(assert (=> b!1031136 (= e!582313 e!582310)))

(declare-fun c!104477 () Bool)

(assert (=> b!1031136 (= c!104477 (not (= (bvand (extraKeys!5853 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1031137 () Bool)

(declare-fun +!3124 (ListLongMap!13699 tuple2!15582) ListLongMap!13699)

(assert (=> b!1031137 (= e!582319 (+!3124 call!43577 (tuple2!15583 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5957 thiss!1427))))))

(declare-fun bm!43576 () Bool)

(declare-fun call!43582 () ListLongMap!13699)

(declare-fun getCurrentListMapNoExtraKeys!3564 (array!64747 array!64749 (_ BitVec 32) (_ BitVec 32) V!37299 V!37299 (_ BitVec 32) Int) ListLongMap!13699)

(assert (=> bm!43576 (= call!43582 (getCurrentListMapNoExtraKeys!3564 (_keys!11325 thiss!1427) (_values!6144 thiss!1427) (mask!29944 thiss!1427) (extraKeys!5853 thiss!1427) (zeroValue!5957 thiss!1427) (minValue!5957 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6121 thiss!1427)))))

(declare-fun bm!43577 () Bool)

(declare-fun contains!6000 (ListLongMap!13699 (_ BitVec 64)) Bool)

(assert (=> bm!43577 (= call!43578 (contains!6000 lt!454608 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1031138 () Bool)

(assert (=> b!1031138 (= e!582316 call!43583)))

(declare-fun b!1031139 () Bool)

(assert (=> b!1031139 (= e!582315 (validKeyInArray!0 (select (arr!31171 (_keys!11325 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1031140 () Bool)

(assert (=> b!1031140 (= e!582317 (= (apply!913 lt!454608 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!5957 thiss!1427)))))

(declare-fun bm!43578 () Bool)

(assert (=> bm!43578 (= call!43580 call!43582)))

(declare-fun b!1031141 () Bool)

(assert (=> b!1031141 (= e!582308 (not call!43578))))

(declare-fun b!1031142 () Bool)

(declare-fun Unit!33646 () Unit!33642)

(assert (=> b!1031142 (= e!582307 Unit!33646)))

(declare-fun b!1031143 () Bool)

(assert (=> b!1031143 (= e!582318 call!43583)))

(declare-fun b!1031144 () Bool)

(assert (=> b!1031144 (= e!582316 call!43579)))

(declare-fun b!1031145 () Bool)

(declare-fun lt!454620 () Unit!33642)

(assert (=> b!1031145 (= e!582307 lt!454620)))

(declare-fun lt!454604 () ListLongMap!13699)

(assert (=> b!1031145 (= lt!454604 (getCurrentListMapNoExtraKeys!3564 (_keys!11325 thiss!1427) (_values!6144 thiss!1427) (mask!29944 thiss!1427) (extraKeys!5853 thiss!1427) (zeroValue!5957 thiss!1427) (minValue!5957 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6121 thiss!1427)))))

(declare-fun lt!454615 () (_ BitVec 64))

(assert (=> b!1031145 (= lt!454615 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!454618 () (_ BitVec 64))

(assert (=> b!1031145 (= lt!454618 (select (arr!31171 (_keys!11325 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun lt!454616 () Unit!33642)

(declare-fun addStillContains!623 (ListLongMap!13699 (_ BitVec 64) V!37299 (_ BitVec 64)) Unit!33642)

(assert (=> b!1031145 (= lt!454616 (addStillContains!623 lt!454604 lt!454615 (zeroValue!5957 thiss!1427) lt!454618))))

(assert (=> b!1031145 (contains!6000 (+!3124 lt!454604 (tuple2!15583 lt!454615 (zeroValue!5957 thiss!1427))) lt!454618)))

(declare-fun lt!454607 () Unit!33642)

(assert (=> b!1031145 (= lt!454607 lt!454616)))

(declare-fun lt!454622 () ListLongMap!13699)

(assert (=> b!1031145 (= lt!454622 (getCurrentListMapNoExtraKeys!3564 (_keys!11325 thiss!1427) (_values!6144 thiss!1427) (mask!29944 thiss!1427) (extraKeys!5853 thiss!1427) (zeroValue!5957 thiss!1427) (minValue!5957 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6121 thiss!1427)))))

(declare-fun lt!454612 () (_ BitVec 64))

(assert (=> b!1031145 (= lt!454612 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!454609 () (_ BitVec 64))

(assert (=> b!1031145 (= lt!454609 (select (arr!31171 (_keys!11325 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun lt!454621 () Unit!33642)

(declare-fun addApplyDifferent!479 (ListLongMap!13699 (_ BitVec 64) V!37299 (_ BitVec 64)) Unit!33642)

(assert (=> b!1031145 (= lt!454621 (addApplyDifferent!479 lt!454622 lt!454612 (minValue!5957 thiss!1427) lt!454609))))

(assert (=> b!1031145 (= (apply!913 (+!3124 lt!454622 (tuple2!15583 lt!454612 (minValue!5957 thiss!1427))) lt!454609) (apply!913 lt!454622 lt!454609))))

(declare-fun lt!454619 () Unit!33642)

(assert (=> b!1031145 (= lt!454619 lt!454621)))

(declare-fun lt!454606 () ListLongMap!13699)

(assert (=> b!1031145 (= lt!454606 (getCurrentListMapNoExtraKeys!3564 (_keys!11325 thiss!1427) (_values!6144 thiss!1427) (mask!29944 thiss!1427) (extraKeys!5853 thiss!1427) (zeroValue!5957 thiss!1427) (minValue!5957 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6121 thiss!1427)))))

(declare-fun lt!454623 () (_ BitVec 64))

(assert (=> b!1031145 (= lt!454623 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!454613 () (_ BitVec 64))

(assert (=> b!1031145 (= lt!454613 (select (arr!31171 (_keys!11325 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun lt!454611 () Unit!33642)

(assert (=> b!1031145 (= lt!454611 (addApplyDifferent!479 lt!454606 lt!454623 (zeroValue!5957 thiss!1427) lt!454613))))

(assert (=> b!1031145 (= (apply!913 (+!3124 lt!454606 (tuple2!15583 lt!454623 (zeroValue!5957 thiss!1427))) lt!454613) (apply!913 lt!454606 lt!454613))))

(declare-fun lt!454610 () Unit!33642)

(assert (=> b!1031145 (= lt!454610 lt!454611)))

(declare-fun lt!454617 () ListLongMap!13699)

(assert (=> b!1031145 (= lt!454617 (getCurrentListMapNoExtraKeys!3564 (_keys!11325 thiss!1427) (_values!6144 thiss!1427) (mask!29944 thiss!1427) (extraKeys!5853 thiss!1427) (zeroValue!5957 thiss!1427) (minValue!5957 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6121 thiss!1427)))))

(declare-fun lt!454605 () (_ BitVec 64))

(assert (=> b!1031145 (= lt!454605 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!454603 () (_ BitVec 64))

(assert (=> b!1031145 (= lt!454603 (select (arr!31171 (_keys!11325 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1031145 (= lt!454620 (addApplyDifferent!479 lt!454617 lt!454605 (minValue!5957 thiss!1427) lt!454603))))

(assert (=> b!1031145 (= (apply!913 (+!3124 lt!454617 (tuple2!15583 lt!454605 (minValue!5957 thiss!1427))) lt!454603) (apply!913 lt!454617 lt!454603))))

(declare-fun c!104479 () Bool)

(declare-fun bm!43579 () Bool)

(assert (=> bm!43579 (= call!43577 (+!3124 (ite c!104480 call!43582 (ite c!104479 call!43580 call!43579)) (ite (or c!104480 c!104479) (tuple2!15583 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5957 thiss!1427)) (tuple2!15583 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5957 thiss!1427)))))))

(declare-fun b!1031146 () Bool)

(declare-fun call!43581 () Bool)

(assert (=> b!1031146 (= e!582310 (not call!43581))))

(declare-fun b!1031147 () Bool)

(assert (=> b!1031147 (= e!582319 e!582318)))

(assert (=> b!1031147 (= c!104479 (and (not (= (bvand (extraKeys!5853 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5853 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!43580 () Bool)

(assert (=> bm!43580 (= call!43581 (contains!6000 lt!454608 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1031148 () Bool)

(declare-fun e!582309 () Bool)

(assert (=> b!1031148 (= e!582310 e!582309)))

(declare-fun res!689296 () Bool)

(assert (=> b!1031148 (= res!689296 call!43581)))

(assert (=> b!1031148 (=> (not res!689296) (not e!582309))))

(declare-fun b!1031149 () Bool)

(declare-fun e!582312 () Bool)

(assert (=> b!1031149 (= e!582312 e!582314)))

(declare-fun res!689295 () Bool)

(assert (=> b!1031149 (=> (not res!689295) (not e!582314))))

(assert (=> b!1031149 (= res!689295 (contains!6000 lt!454608 (select (arr!31171 (_keys!11325 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> b!1031149 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31688 (_keys!11325 thiss!1427))))))

(declare-fun b!1031150 () Bool)

(declare-fun res!689290 () Bool)

(assert (=> b!1031150 (=> (not res!689290) (not e!582313))))

(assert (=> b!1031150 (= res!689290 e!582312)))

(declare-fun res!689293 () Bool)

(assert (=> b!1031150 (=> res!689293 e!582312)))

(assert (=> b!1031150 (= res!689293 (not e!582311))))

(declare-fun res!689291 () Bool)

(assert (=> b!1031150 (=> (not res!689291) (not e!582311))))

(assert (=> b!1031150 (= res!689291 (bvslt #b00000000000000000000000000000000 (size!31688 (_keys!11325 thiss!1427))))))

(declare-fun b!1031151 () Bool)

(assert (=> b!1031151 (= e!582309 (= (apply!913 lt!454608 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!5957 thiss!1427)))))

(assert (= (and d!123859 c!104480) b!1031137))

(assert (= (and d!123859 (not c!104480)) b!1031147))

(assert (= (and b!1031147 c!104479) b!1031143))

(assert (= (and b!1031147 (not c!104479)) b!1031133))

(assert (= (and b!1031133 c!104482) b!1031138))

(assert (= (and b!1031133 (not c!104482)) b!1031144))

(assert (= (or b!1031138 b!1031144) bm!43575))

(assert (= (or b!1031143 bm!43575) bm!43578))

(assert (= (or b!1031143 b!1031138) bm!43574))

(assert (= (or b!1031137 bm!43578) bm!43576))

(assert (= (or b!1031137 bm!43574) bm!43579))

(assert (= (and d!123859 res!689289) b!1031139))

(assert (= (and d!123859 c!104481) b!1031145))

(assert (= (and d!123859 (not c!104481)) b!1031142))

(assert (= (and d!123859 res!689294) b!1031150))

(assert (= (and b!1031150 res!689291) b!1031135))

(assert (= (and b!1031150 (not res!689293)) b!1031149))

(assert (= (and b!1031149 res!689295) b!1031134))

(assert (= (and b!1031150 res!689290) b!1031132))

(assert (= (and b!1031132 c!104478) b!1031131))

(assert (= (and b!1031132 (not c!104478)) b!1031141))

(assert (= (and b!1031131 res!689292) b!1031140))

(assert (= (or b!1031131 b!1031141) bm!43577))

(assert (= (and b!1031132 res!689297) b!1031136))

(assert (= (and b!1031136 c!104477) b!1031148))

(assert (= (and b!1031136 (not c!104477)) b!1031146))

(assert (= (and b!1031148 res!689296) b!1031151))

(assert (= (or b!1031148 b!1031146) bm!43580))

(declare-fun b_lambda!15909 () Bool)

(assert (=> (not b_lambda!15909) (not b!1031134)))

(assert (=> b!1031134 t!30901))

(declare-fun b_and!32963 () Bool)

(assert (= b_and!32953 (and (=> t!30901 result!14151) b_and!32963)))

(declare-fun m!950889 () Bool)

(assert (=> b!1031134 m!950889))

(assert (=> b!1031134 m!950889))

(assert (=> b!1031134 m!950781))

(declare-fun m!950891 () Bool)

(assert (=> b!1031134 m!950891))

(declare-fun m!950893 () Bool)

(assert (=> b!1031134 m!950893))

(assert (=> b!1031134 m!950893))

(declare-fun m!950895 () Bool)

(assert (=> b!1031134 m!950895))

(assert (=> b!1031134 m!950781))

(declare-fun m!950897 () Bool)

(assert (=> b!1031145 m!950897))

(declare-fun m!950899 () Bool)

(assert (=> b!1031145 m!950899))

(declare-fun m!950901 () Bool)

(assert (=> b!1031145 m!950901))

(declare-fun m!950903 () Bool)

(assert (=> b!1031145 m!950903))

(assert (=> b!1031145 m!950899))

(declare-fun m!950905 () Bool)

(assert (=> b!1031145 m!950905))

(assert (=> b!1031145 m!950901))

(declare-fun m!950907 () Bool)

(assert (=> b!1031145 m!950907))

(declare-fun m!950909 () Bool)

(assert (=> b!1031145 m!950909))

(declare-fun m!950911 () Bool)

(assert (=> b!1031145 m!950911))

(declare-fun m!950913 () Bool)

(assert (=> b!1031145 m!950913))

(assert (=> b!1031145 m!950893))

(declare-fun m!950915 () Bool)

(assert (=> b!1031145 m!950915))

(assert (=> b!1031145 m!950907))

(declare-fun m!950917 () Bool)

(assert (=> b!1031145 m!950917))

(declare-fun m!950919 () Bool)

(assert (=> b!1031145 m!950919))

(declare-fun m!950921 () Bool)

(assert (=> b!1031145 m!950921))

(declare-fun m!950923 () Bool)

(assert (=> b!1031145 m!950923))

(declare-fun m!950925 () Bool)

(assert (=> b!1031145 m!950925))

(assert (=> b!1031145 m!950917))

(declare-fun m!950927 () Bool)

(assert (=> b!1031145 m!950927))

(assert (=> b!1031139 m!950893))

(assert (=> b!1031139 m!950893))

(declare-fun m!950929 () Bool)

(assert (=> b!1031139 m!950929))

(declare-fun m!950931 () Bool)

(assert (=> b!1031137 m!950931))

(declare-fun m!950933 () Bool)

(assert (=> bm!43579 m!950933))

(declare-fun m!950935 () Bool)

(assert (=> b!1031140 m!950935))

(assert (=> b!1031149 m!950893))

(assert (=> b!1031149 m!950893))

(declare-fun m!950937 () Bool)

(assert (=> b!1031149 m!950937))

(declare-fun m!950939 () Bool)

(assert (=> d!123859 m!950939))

(assert (=> bm!43576 m!950897))

(declare-fun m!950941 () Bool)

(assert (=> b!1031151 m!950941))

(assert (=> b!1031135 m!950893))

(assert (=> b!1031135 m!950893))

(assert (=> b!1031135 m!950929))

(declare-fun m!950943 () Bool)

(assert (=> bm!43577 m!950943))

(declare-fun m!950945 () Bool)

(assert (=> bm!43580 m!950945))

(assert (=> b!1031010 d!123859))

(declare-fun d!123861 () Bool)

(declare-fun e!582325 () Bool)

(assert (=> d!123861 e!582325))

(declare-fun res!689309 () Bool)

(assert (=> d!123861 (=> (not res!689309) (not e!582325))))

(assert (=> d!123861 (= res!689309 (and (bvsge (index!40936 lt!454488) #b00000000000000000000000000000000) (bvslt (index!40936 lt!454488) (size!31688 (_keys!11325 thiss!1427)))))))

(declare-fun lt!454626 () Unit!33642)

(declare-fun choose!82 (array!64747 (_ BitVec 32) (_ BitVec 64)) Unit!33642)

(assert (=> d!123861 (= lt!454626 (choose!82 (_keys!11325 thiss!1427) (index!40936 lt!454488) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!582324 () Bool)

(assert (=> d!123861 e!582324))

(declare-fun res!689307 () Bool)

(assert (=> d!123861 (=> (not res!689307) (not e!582324))))

(assert (=> d!123861 (= res!689307 (and (bvsge (index!40936 lt!454488) #b00000000000000000000000000000000) (bvslt (index!40936 lt!454488) (size!31688 (_keys!11325 thiss!1427)))))))

(assert (=> d!123861 (= (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11325 thiss!1427) (index!40936 lt!454488) #b1000000000000000000000000000000000000000000000000000000000000000) lt!454626)))

(declare-fun b!1031163 () Bool)

(assert (=> b!1031163 (= e!582325 (= (arrayCountValidKeys!0 (array!64748 (store (arr!31171 (_keys!11325 thiss!1427)) (index!40936 lt!454488) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31688 (_keys!11325 thiss!1427))) #b00000000000000000000000000000000 (size!31688 (_keys!11325 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11325 thiss!1427) #b00000000000000000000000000000000 (size!31688 (_keys!11325 thiss!1427))) #b00000000000000000000000000000001)))))

(declare-fun b!1031162 () Bool)

(assert (=> b!1031162 (= e!582324 (bvslt (size!31688 (_keys!11325 thiss!1427)) #b01111111111111111111111111111111))))

(declare-fun b!1031161 () Bool)

(declare-fun res!689308 () Bool)

(assert (=> b!1031161 (=> (not res!689308) (not e!582324))))

(assert (=> b!1031161 (= res!689308 (not (validKeyInArray!0 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1031160 () Bool)

(declare-fun res!689306 () Bool)

(assert (=> b!1031160 (=> (not res!689306) (not e!582324))))

(assert (=> b!1031160 (= res!689306 (validKeyInArray!0 (select (arr!31171 (_keys!11325 thiss!1427)) (index!40936 lt!454488))))))

(assert (= (and d!123861 res!689307) b!1031160))

(assert (= (and b!1031160 res!689306) b!1031161))

(assert (= (and b!1031161 res!689308) b!1031162))

(assert (= (and d!123861 res!689309) b!1031163))

(declare-fun m!950947 () Bool)

(assert (=> d!123861 m!950947))

(assert (=> b!1031163 m!950779))

(declare-fun m!950949 () Bool)

(assert (=> b!1031163 m!950949))

(assert (=> b!1031163 m!950755))

(declare-fun m!950951 () Bool)

(assert (=> b!1031161 m!950951))

(declare-fun m!950953 () Bool)

(assert (=> b!1031160 m!950953))

(assert (=> b!1031160 m!950953))

(declare-fun m!950955 () Bool)

(assert (=> b!1031160 m!950955))

(assert (=> b!1031010 d!123861))

(declare-fun d!123863 () Bool)

(assert (=> d!123863 (= (validMask!0 (mask!29944 (_2!7801 lt!454489))) (and (or (= (mask!29944 (_2!7801 lt!454489)) #b00000000000000000000000000000111) (= (mask!29944 (_2!7801 lt!454489)) #b00000000000000000000000000001111) (= (mask!29944 (_2!7801 lt!454489)) #b00000000000000000000000000011111) (= (mask!29944 (_2!7801 lt!454489)) #b00000000000000000000000000111111) (= (mask!29944 (_2!7801 lt!454489)) #b00000000000000000000000001111111) (= (mask!29944 (_2!7801 lt!454489)) #b00000000000000000000000011111111) (= (mask!29944 (_2!7801 lt!454489)) #b00000000000000000000000111111111) (= (mask!29944 (_2!7801 lt!454489)) #b00000000000000000000001111111111) (= (mask!29944 (_2!7801 lt!454489)) #b00000000000000000000011111111111) (= (mask!29944 (_2!7801 lt!454489)) #b00000000000000000000111111111111) (= (mask!29944 (_2!7801 lt!454489)) #b00000000000000000001111111111111) (= (mask!29944 (_2!7801 lt!454489)) #b00000000000000000011111111111111) (= (mask!29944 (_2!7801 lt!454489)) #b00000000000000000111111111111111) (= (mask!29944 (_2!7801 lt!454489)) #b00000000000000001111111111111111) (= (mask!29944 (_2!7801 lt!454489)) #b00000000000000011111111111111111) (= (mask!29944 (_2!7801 lt!454489)) #b00000000000000111111111111111111) (= (mask!29944 (_2!7801 lt!454489)) #b00000000000001111111111111111111) (= (mask!29944 (_2!7801 lt!454489)) #b00000000000011111111111111111111) (= (mask!29944 (_2!7801 lt!454489)) #b00000000000111111111111111111111) (= (mask!29944 (_2!7801 lt!454489)) #b00000000001111111111111111111111) (= (mask!29944 (_2!7801 lt!454489)) #b00000000011111111111111111111111) (= (mask!29944 (_2!7801 lt!454489)) #b00000000111111111111111111111111) (= (mask!29944 (_2!7801 lt!454489)) #b00000001111111111111111111111111) (= (mask!29944 (_2!7801 lt!454489)) #b00000011111111111111111111111111) (= (mask!29944 (_2!7801 lt!454489)) #b00000111111111111111111111111111) (= (mask!29944 (_2!7801 lt!454489)) #b00001111111111111111111111111111) (= (mask!29944 (_2!7801 lt!454489)) #b00011111111111111111111111111111) (= (mask!29944 (_2!7801 lt!454489)) #b00111111111111111111111111111111)) (bvsle (mask!29944 (_2!7801 lt!454489)) #b00111111111111111111111111111111)))))

(assert (=> b!1031010 d!123863))

(declare-fun b!1031164 () Bool)

(declare-fun e!582327 () Bool)

(declare-fun e!582336 () Bool)

(assert (=> b!1031164 (= e!582327 e!582336)))

(declare-fun res!689313 () Bool)

(declare-fun call!43585 () Bool)

(assert (=> b!1031164 (= res!689313 call!43585)))

(assert (=> b!1031164 (=> (not res!689313) (not e!582336))))

(declare-fun b!1031165 () Bool)

(declare-fun res!689318 () Bool)

(declare-fun e!582332 () Bool)

(assert (=> b!1031165 (=> (not res!689318) (not e!582332))))

(assert (=> b!1031165 (= res!689318 e!582327)))

(declare-fun c!104484 () Bool)

(assert (=> b!1031165 (= c!104484 (not (= (bvand (extraKeys!5853 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1031166 () Bool)

(declare-fun c!104488 () Bool)

(assert (=> b!1031166 (= c!104488 (and (not (= (bvand (extraKeys!5853 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5853 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!582337 () ListLongMap!13699)

(declare-fun e!582335 () ListLongMap!13699)

(assert (=> b!1031166 (= e!582337 e!582335)))

(declare-fun bm!43581 () Bool)

(declare-fun call!43590 () ListLongMap!13699)

(declare-fun call!43584 () ListLongMap!13699)

(assert (=> bm!43581 (= call!43590 call!43584)))

(declare-fun bm!43582 () Bool)

(declare-fun call!43586 () ListLongMap!13699)

(declare-fun call!43587 () ListLongMap!13699)

(assert (=> bm!43582 (= call!43586 call!43587)))

(declare-fun lt!454633 () ListLongMap!13699)

(declare-fun b!1031167 () Bool)

(declare-fun e!582333 () Bool)

(assert (=> b!1031167 (= e!582333 (= (apply!913 lt!454633 (select (arr!31171 lt!454491) #b00000000000000000000000000000000)) (get!16391 (select (arr!31172 lt!454494) #b00000000000000000000000000000000) (dynLambda!1982 (defaultEntry!6121 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1031167 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31689 lt!454494)))))

(assert (=> b!1031167 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31688 lt!454491)))))

(declare-fun b!1031168 () Bool)

(declare-fun e!582330 () Bool)

(assert (=> b!1031168 (= e!582330 (validKeyInArray!0 (select (arr!31171 lt!454491) #b00000000000000000000000000000000)))))

(declare-fun d!123865 () Bool)

(assert (=> d!123865 e!582332))

(declare-fun res!689315 () Bool)

(assert (=> d!123865 (=> (not res!689315) (not e!582332))))

(assert (=> d!123865 (= res!689315 (or (bvsge #b00000000000000000000000000000000 (size!31688 lt!454491)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31688 lt!454491)))))))

(declare-fun lt!454627 () ListLongMap!13699)

(assert (=> d!123865 (= lt!454633 lt!454627)))

(declare-fun lt!454639 () Unit!33642)

(declare-fun e!582326 () Unit!33642)

(assert (=> d!123865 (= lt!454639 e!582326)))

(declare-fun c!104487 () Bool)

(declare-fun e!582334 () Bool)

(assert (=> d!123865 (= c!104487 e!582334)))

(declare-fun res!689310 () Bool)

(assert (=> d!123865 (=> (not res!689310) (not e!582334))))

(assert (=> d!123865 (= res!689310 (bvslt #b00000000000000000000000000000000 (size!31688 lt!454491)))))

(declare-fun e!582338 () ListLongMap!13699)

(assert (=> d!123865 (= lt!454627 e!582338)))

(declare-fun c!104486 () Bool)

(assert (=> d!123865 (= c!104486 (and (not (= (bvand (extraKeys!5853 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5853 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!123865 (validMask!0 (mask!29944 thiss!1427))))

(assert (=> d!123865 (= (getCurrentListMap!3911 lt!454491 lt!454494 (mask!29944 thiss!1427) (extraKeys!5853 thiss!1427) (zeroValue!5957 thiss!1427) (minValue!5957 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6121 thiss!1427)) lt!454633)))

(declare-fun b!1031169 () Bool)

(declare-fun e!582329 () Bool)

(assert (=> b!1031169 (= e!582332 e!582329)))

(declare-fun c!104483 () Bool)

(assert (=> b!1031169 (= c!104483 (not (= (bvand (extraKeys!5853 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1031170 () Bool)

(assert (=> b!1031170 (= e!582338 (+!3124 call!43584 (tuple2!15583 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5957 thiss!1427))))))

(declare-fun call!43589 () ListLongMap!13699)

(declare-fun bm!43583 () Bool)

(assert (=> bm!43583 (= call!43589 (getCurrentListMapNoExtraKeys!3564 lt!454491 lt!454494 (mask!29944 thiss!1427) (extraKeys!5853 thiss!1427) (zeroValue!5957 thiss!1427) (minValue!5957 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6121 thiss!1427)))))

(declare-fun bm!43584 () Bool)

(assert (=> bm!43584 (= call!43585 (contains!6000 lt!454633 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1031171 () Bool)

(assert (=> b!1031171 (= e!582335 call!43590)))

(declare-fun b!1031172 () Bool)

(assert (=> b!1031172 (= e!582334 (validKeyInArray!0 (select (arr!31171 lt!454491) #b00000000000000000000000000000000)))))

(declare-fun b!1031173 () Bool)

(assert (=> b!1031173 (= e!582336 (= (apply!913 lt!454633 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!5957 thiss!1427)))))

(declare-fun bm!43585 () Bool)

(assert (=> bm!43585 (= call!43587 call!43589)))

(declare-fun b!1031174 () Bool)

(assert (=> b!1031174 (= e!582327 (not call!43585))))

(declare-fun b!1031175 () Bool)

(declare-fun Unit!33647 () Unit!33642)

(assert (=> b!1031175 (= e!582326 Unit!33647)))

(declare-fun b!1031176 () Bool)

(assert (=> b!1031176 (= e!582337 call!43590)))

(declare-fun b!1031177 () Bool)

(assert (=> b!1031177 (= e!582335 call!43586)))

(declare-fun b!1031178 () Bool)

(declare-fun lt!454645 () Unit!33642)

(assert (=> b!1031178 (= e!582326 lt!454645)))

(declare-fun lt!454629 () ListLongMap!13699)

(assert (=> b!1031178 (= lt!454629 (getCurrentListMapNoExtraKeys!3564 lt!454491 lt!454494 (mask!29944 thiss!1427) (extraKeys!5853 thiss!1427) (zeroValue!5957 thiss!1427) (minValue!5957 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6121 thiss!1427)))))

(declare-fun lt!454640 () (_ BitVec 64))

(assert (=> b!1031178 (= lt!454640 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!454643 () (_ BitVec 64))

(assert (=> b!1031178 (= lt!454643 (select (arr!31171 lt!454491) #b00000000000000000000000000000000))))

(declare-fun lt!454641 () Unit!33642)

(assert (=> b!1031178 (= lt!454641 (addStillContains!623 lt!454629 lt!454640 (zeroValue!5957 thiss!1427) lt!454643))))

(assert (=> b!1031178 (contains!6000 (+!3124 lt!454629 (tuple2!15583 lt!454640 (zeroValue!5957 thiss!1427))) lt!454643)))

(declare-fun lt!454632 () Unit!33642)

(assert (=> b!1031178 (= lt!454632 lt!454641)))

(declare-fun lt!454647 () ListLongMap!13699)

(assert (=> b!1031178 (= lt!454647 (getCurrentListMapNoExtraKeys!3564 lt!454491 lt!454494 (mask!29944 thiss!1427) (extraKeys!5853 thiss!1427) (zeroValue!5957 thiss!1427) (minValue!5957 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6121 thiss!1427)))))

(declare-fun lt!454637 () (_ BitVec 64))

(assert (=> b!1031178 (= lt!454637 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!454634 () (_ BitVec 64))

(assert (=> b!1031178 (= lt!454634 (select (arr!31171 lt!454491) #b00000000000000000000000000000000))))

(declare-fun lt!454646 () Unit!33642)

(assert (=> b!1031178 (= lt!454646 (addApplyDifferent!479 lt!454647 lt!454637 (minValue!5957 thiss!1427) lt!454634))))

(assert (=> b!1031178 (= (apply!913 (+!3124 lt!454647 (tuple2!15583 lt!454637 (minValue!5957 thiss!1427))) lt!454634) (apply!913 lt!454647 lt!454634))))

(declare-fun lt!454644 () Unit!33642)

(assert (=> b!1031178 (= lt!454644 lt!454646)))

(declare-fun lt!454631 () ListLongMap!13699)

(assert (=> b!1031178 (= lt!454631 (getCurrentListMapNoExtraKeys!3564 lt!454491 lt!454494 (mask!29944 thiss!1427) (extraKeys!5853 thiss!1427) (zeroValue!5957 thiss!1427) (minValue!5957 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6121 thiss!1427)))))

(declare-fun lt!454648 () (_ BitVec 64))

(assert (=> b!1031178 (= lt!454648 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!454638 () (_ BitVec 64))

(assert (=> b!1031178 (= lt!454638 (select (arr!31171 lt!454491) #b00000000000000000000000000000000))))

(declare-fun lt!454636 () Unit!33642)

(assert (=> b!1031178 (= lt!454636 (addApplyDifferent!479 lt!454631 lt!454648 (zeroValue!5957 thiss!1427) lt!454638))))

(assert (=> b!1031178 (= (apply!913 (+!3124 lt!454631 (tuple2!15583 lt!454648 (zeroValue!5957 thiss!1427))) lt!454638) (apply!913 lt!454631 lt!454638))))

(declare-fun lt!454635 () Unit!33642)

(assert (=> b!1031178 (= lt!454635 lt!454636)))

(declare-fun lt!454642 () ListLongMap!13699)

(assert (=> b!1031178 (= lt!454642 (getCurrentListMapNoExtraKeys!3564 lt!454491 lt!454494 (mask!29944 thiss!1427) (extraKeys!5853 thiss!1427) (zeroValue!5957 thiss!1427) (minValue!5957 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6121 thiss!1427)))))

(declare-fun lt!454630 () (_ BitVec 64))

(assert (=> b!1031178 (= lt!454630 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!454628 () (_ BitVec 64))

(assert (=> b!1031178 (= lt!454628 (select (arr!31171 lt!454491) #b00000000000000000000000000000000))))

(assert (=> b!1031178 (= lt!454645 (addApplyDifferent!479 lt!454642 lt!454630 (minValue!5957 thiss!1427) lt!454628))))

(assert (=> b!1031178 (= (apply!913 (+!3124 lt!454642 (tuple2!15583 lt!454630 (minValue!5957 thiss!1427))) lt!454628) (apply!913 lt!454642 lt!454628))))

(declare-fun bm!43586 () Bool)

(declare-fun c!104485 () Bool)

(assert (=> bm!43586 (= call!43584 (+!3124 (ite c!104486 call!43589 (ite c!104485 call!43587 call!43586)) (ite (or c!104486 c!104485) (tuple2!15583 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5957 thiss!1427)) (tuple2!15583 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5957 thiss!1427)))))))

(declare-fun b!1031179 () Bool)

(declare-fun call!43588 () Bool)

(assert (=> b!1031179 (= e!582329 (not call!43588))))

(declare-fun b!1031180 () Bool)

(assert (=> b!1031180 (= e!582338 e!582337)))

(assert (=> b!1031180 (= c!104485 (and (not (= (bvand (extraKeys!5853 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5853 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!43587 () Bool)

(assert (=> bm!43587 (= call!43588 (contains!6000 lt!454633 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1031181 () Bool)

(declare-fun e!582328 () Bool)

(assert (=> b!1031181 (= e!582329 e!582328)))

(declare-fun res!689317 () Bool)

(assert (=> b!1031181 (= res!689317 call!43588)))

(assert (=> b!1031181 (=> (not res!689317) (not e!582328))))

(declare-fun b!1031182 () Bool)

(declare-fun e!582331 () Bool)

(assert (=> b!1031182 (= e!582331 e!582333)))

(declare-fun res!689316 () Bool)

(assert (=> b!1031182 (=> (not res!689316) (not e!582333))))

(assert (=> b!1031182 (= res!689316 (contains!6000 lt!454633 (select (arr!31171 lt!454491) #b00000000000000000000000000000000)))))

(assert (=> b!1031182 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31688 lt!454491)))))

(declare-fun b!1031183 () Bool)

(declare-fun res!689311 () Bool)

(assert (=> b!1031183 (=> (not res!689311) (not e!582332))))

(assert (=> b!1031183 (= res!689311 e!582331)))

(declare-fun res!689314 () Bool)

(assert (=> b!1031183 (=> res!689314 e!582331)))

(assert (=> b!1031183 (= res!689314 (not e!582330))))

(declare-fun res!689312 () Bool)

(assert (=> b!1031183 (=> (not res!689312) (not e!582330))))

(assert (=> b!1031183 (= res!689312 (bvslt #b00000000000000000000000000000000 (size!31688 lt!454491)))))

(declare-fun b!1031184 () Bool)

(assert (=> b!1031184 (= e!582328 (= (apply!913 lt!454633 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!5957 thiss!1427)))))

(assert (= (and d!123865 c!104486) b!1031170))

(assert (= (and d!123865 (not c!104486)) b!1031180))

(assert (= (and b!1031180 c!104485) b!1031176))

(assert (= (and b!1031180 (not c!104485)) b!1031166))

(assert (= (and b!1031166 c!104488) b!1031171))

(assert (= (and b!1031166 (not c!104488)) b!1031177))

(assert (= (or b!1031171 b!1031177) bm!43582))

(assert (= (or b!1031176 bm!43582) bm!43585))

(assert (= (or b!1031176 b!1031171) bm!43581))

(assert (= (or b!1031170 bm!43585) bm!43583))

(assert (= (or b!1031170 bm!43581) bm!43586))

(assert (= (and d!123865 res!689310) b!1031172))

(assert (= (and d!123865 c!104487) b!1031178))

(assert (= (and d!123865 (not c!104487)) b!1031175))

(assert (= (and d!123865 res!689315) b!1031183))

(assert (= (and b!1031183 res!689312) b!1031168))

(assert (= (and b!1031183 (not res!689314)) b!1031182))

(assert (= (and b!1031182 res!689316) b!1031167))

(assert (= (and b!1031183 res!689311) b!1031165))

(assert (= (and b!1031165 c!104484) b!1031164))

(assert (= (and b!1031165 (not c!104484)) b!1031174))

(assert (= (and b!1031164 res!689313) b!1031173))

(assert (= (or b!1031164 b!1031174) bm!43584))

(assert (= (and b!1031165 res!689318) b!1031169))

(assert (= (and b!1031169 c!104483) b!1031181))

(assert (= (and b!1031169 (not c!104483)) b!1031179))

(assert (= (and b!1031181 res!689317) b!1031184))

(assert (= (or b!1031181 b!1031179) bm!43587))

(declare-fun b_lambda!15911 () Bool)

(assert (=> (not b_lambda!15911) (not b!1031167)))

(assert (=> b!1031167 t!30901))

(declare-fun b_and!32965 () Bool)

(assert (= b_and!32963 (and (=> t!30901 result!14151) b_and!32965)))

(declare-fun m!950957 () Bool)

(assert (=> b!1031167 m!950957))

(assert (=> b!1031167 m!950957))

(assert (=> b!1031167 m!950781))

(declare-fun m!950959 () Bool)

(assert (=> b!1031167 m!950959))

(assert (=> b!1031167 m!950877))

(assert (=> b!1031167 m!950877))

(declare-fun m!950961 () Bool)

(assert (=> b!1031167 m!950961))

(assert (=> b!1031167 m!950781))

(declare-fun m!950963 () Bool)

(assert (=> b!1031178 m!950963))

(declare-fun m!950965 () Bool)

(assert (=> b!1031178 m!950965))

(declare-fun m!950967 () Bool)

(assert (=> b!1031178 m!950967))

(declare-fun m!950969 () Bool)

(assert (=> b!1031178 m!950969))

(assert (=> b!1031178 m!950965))

(declare-fun m!950971 () Bool)

(assert (=> b!1031178 m!950971))

(assert (=> b!1031178 m!950967))

(declare-fun m!950973 () Bool)

(assert (=> b!1031178 m!950973))

(declare-fun m!950975 () Bool)

(assert (=> b!1031178 m!950975))

(declare-fun m!950977 () Bool)

(assert (=> b!1031178 m!950977))

(declare-fun m!950979 () Bool)

(assert (=> b!1031178 m!950979))

(assert (=> b!1031178 m!950877))

(declare-fun m!950981 () Bool)

(assert (=> b!1031178 m!950981))

(assert (=> b!1031178 m!950973))

(declare-fun m!950983 () Bool)

(assert (=> b!1031178 m!950983))

(declare-fun m!950985 () Bool)

(assert (=> b!1031178 m!950985))

(declare-fun m!950987 () Bool)

(assert (=> b!1031178 m!950987))

(declare-fun m!950989 () Bool)

(assert (=> b!1031178 m!950989))

(declare-fun m!950991 () Bool)

(assert (=> b!1031178 m!950991))

(assert (=> b!1031178 m!950983))

(declare-fun m!950993 () Bool)

(assert (=> b!1031178 m!950993))

(assert (=> b!1031172 m!950877))

(assert (=> b!1031172 m!950877))

(assert (=> b!1031172 m!950885))

(declare-fun m!950995 () Bool)

(assert (=> b!1031170 m!950995))

(declare-fun m!950997 () Bool)

(assert (=> bm!43586 m!950997))

(declare-fun m!950999 () Bool)

(assert (=> b!1031173 m!950999))

(assert (=> b!1031182 m!950877))

(assert (=> b!1031182 m!950877))

(declare-fun m!951001 () Bool)

(assert (=> b!1031182 m!951001))

(assert (=> d!123865 m!950939))

(assert (=> bm!43583 m!950963))

(declare-fun m!951003 () Bool)

(assert (=> b!1031184 m!951003))

(assert (=> b!1031168 m!950877))

(assert (=> b!1031168 m!950877))

(assert (=> b!1031168 m!950885))

(declare-fun m!951005 () Bool)

(assert (=> bm!43584 m!951005))

(declare-fun m!951007 () Bool)

(assert (=> bm!43587 m!951007))

(assert (=> b!1031010 d!123865))

(declare-fun d!123867 () Bool)

(declare-fun e!582341 () Bool)

(assert (=> d!123867 e!582341))

(declare-fun res!689321 () Bool)

(assert (=> d!123867 (=> (not res!689321) (not e!582341))))

(assert (=> d!123867 (= res!689321 (and (bvsge (index!40936 lt!454488) #b00000000000000000000000000000000) (bvslt (index!40936 lt!454488) (size!31688 (_keys!11325 thiss!1427)))))))

(declare-fun lt!454651 () Unit!33642)

(declare-fun choose!53 (array!64747 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21817) Unit!33642)

(assert (=> d!123867 (= lt!454651 (choose!53 (_keys!11325 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!40936 lt!454488) #b00000000000000000000000000000000 Nil!21814))))

(assert (=> d!123867 (bvslt (size!31688 (_keys!11325 thiss!1427)) #b01111111111111111111111111111111)))

(assert (=> d!123867 (= (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11325 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!40936 lt!454488) #b00000000000000000000000000000000 Nil!21814) lt!454651)))

(declare-fun b!1031187 () Bool)

(assert (=> b!1031187 (= e!582341 (arrayNoDuplicates!0 (array!64748 (store (arr!31171 (_keys!11325 thiss!1427)) (index!40936 lt!454488) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31688 (_keys!11325 thiss!1427))) #b00000000000000000000000000000000 Nil!21814))))

(assert (= (and d!123867 res!689321) b!1031187))

(declare-fun m!951009 () Bool)

(assert (=> d!123867 m!951009))

(assert (=> b!1031187 m!950779))

(declare-fun m!951011 () Bool)

(assert (=> b!1031187 m!951011))

(assert (=> b!1031010 d!123867))

(declare-fun d!123869 () Bool)

(declare-fun e!582344 () Bool)

(assert (=> d!123869 e!582344))

(declare-fun res!689324 () Bool)

(assert (=> d!123869 (=> (not res!689324) (not e!582344))))

(assert (=> d!123869 (= res!689324 (bvslt (index!40936 lt!454488) (size!31688 (_keys!11325 thiss!1427))))))

(declare-fun lt!454654 () Unit!33642)

(declare-fun choose!121 (array!64747 (_ BitVec 32) (_ BitVec 64)) Unit!33642)

(assert (=> d!123869 (= lt!454654 (choose!121 (_keys!11325 thiss!1427) (index!40936 lt!454488) key!909))))

(assert (=> d!123869 (bvsge (index!40936 lt!454488) #b00000000000000000000000000000000)))

(assert (=> d!123869 (= (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11325 thiss!1427) (index!40936 lt!454488) key!909) lt!454654)))

(declare-fun b!1031190 () Bool)

(assert (=> b!1031190 (= e!582344 (not (arrayContainsKey!0 (array!64748 (store (arr!31171 (_keys!11325 thiss!1427)) (index!40936 lt!454488) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31688 (_keys!11325 thiss!1427))) key!909 #b00000000000000000000000000000000)))))

(assert (= (and d!123869 res!689324) b!1031190))

(declare-fun m!951013 () Bool)

(assert (=> d!123869 m!951013))

(assert (=> b!1031190 m!950779))

(declare-fun m!951015 () Bool)

(assert (=> b!1031190 m!951015))

(assert (=> b!1031010 d!123869))

(declare-fun b!1031199 () Bool)

(declare-fun e!582349 () (_ BitVec 32))

(declare-fun call!43593 () (_ BitVec 32))

(assert (=> b!1031199 (= e!582349 call!43593)))

(declare-fun b!1031200 () Bool)

(declare-fun e!582350 () (_ BitVec 32))

(assert (=> b!1031200 (= e!582350 #b00000000000000000000000000000000)))

(declare-fun b!1031201 () Bool)

(assert (=> b!1031201 (= e!582350 e!582349)))

(declare-fun c!104493 () Bool)

(assert (=> b!1031201 (= c!104493 (validKeyInArray!0 (select (arr!31171 lt!454491) #b00000000000000000000000000000000)))))

(declare-fun d!123871 () Bool)

(declare-fun lt!454657 () (_ BitVec 32))

(assert (=> d!123871 (and (bvsge lt!454657 #b00000000000000000000000000000000) (bvsle lt!454657 (bvsub (size!31688 lt!454491) #b00000000000000000000000000000000)))))

(assert (=> d!123871 (= lt!454657 e!582350)))

(declare-fun c!104494 () Bool)

(assert (=> d!123871 (= c!104494 (bvsge #b00000000000000000000000000000000 (size!31688 (_keys!11325 thiss!1427))))))

(assert (=> d!123871 (and (bvsle #b00000000000000000000000000000000 (size!31688 (_keys!11325 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!31688 (_keys!11325 thiss!1427)) (size!31688 lt!454491)))))

(assert (=> d!123871 (= (arrayCountValidKeys!0 lt!454491 #b00000000000000000000000000000000 (size!31688 (_keys!11325 thiss!1427))) lt!454657)))

(declare-fun b!1031202 () Bool)

(assert (=> b!1031202 (= e!582349 (bvadd #b00000000000000000000000000000001 call!43593))))

(declare-fun bm!43590 () Bool)

(assert (=> bm!43590 (= call!43593 (arrayCountValidKeys!0 lt!454491 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31688 (_keys!11325 thiss!1427))))))

(assert (= (and d!123871 c!104494) b!1031200))

(assert (= (and d!123871 (not c!104494)) b!1031201))

(assert (= (and b!1031201 c!104493) b!1031202))

(assert (= (and b!1031201 (not c!104493)) b!1031199))

(assert (= (or b!1031202 b!1031199) bm!43590))

(assert (=> b!1031201 m!950877))

(assert (=> b!1031201 m!950877))

(assert (=> b!1031201 m!950885))

(declare-fun m!951017 () Bool)

(assert (=> bm!43590 m!951017))

(assert (=> b!1031010 d!123871))

(declare-fun d!123873 () Bool)

(declare-fun e!582353 () Bool)

(assert (=> d!123873 e!582353))

(declare-fun res!689327 () Bool)

(assert (=> d!123873 (=> (not res!689327) (not e!582353))))

(assert (=> d!123873 (= res!689327 (and (bvsge (index!40936 lt!454488) #b00000000000000000000000000000000) (bvslt (index!40936 lt!454488) (size!31688 (_keys!11325 thiss!1427)))))))

(declare-fun lt!454660 () Unit!33642)

(declare-fun choose!25 (array!64747 (_ BitVec 32) (_ BitVec 32)) Unit!33642)

(assert (=> d!123873 (= lt!454660 (choose!25 (_keys!11325 thiss!1427) (index!40936 lt!454488) (mask!29944 thiss!1427)))))

(assert (=> d!123873 (validMask!0 (mask!29944 thiss!1427))))

(assert (=> d!123873 (= (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11325 thiss!1427) (index!40936 lt!454488) (mask!29944 thiss!1427)) lt!454660)))

(declare-fun b!1031205 () Bool)

(assert (=> b!1031205 (= e!582353 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!64748 (store (arr!31171 (_keys!11325 thiss!1427)) (index!40936 lt!454488) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31688 (_keys!11325 thiss!1427))) (mask!29944 thiss!1427)))))

(assert (= (and d!123873 res!689327) b!1031205))

(declare-fun m!951019 () Bool)

(assert (=> d!123873 m!951019))

(assert (=> d!123873 m!950939))

(assert (=> b!1031205 m!950779))

(declare-fun m!951021 () Bool)

(assert (=> b!1031205 m!951021))

(assert (=> b!1031010 d!123873))

(declare-fun d!123875 () Bool)

(declare-fun res!689332 () Bool)

(declare-fun e!582358 () Bool)

(assert (=> d!123875 (=> res!689332 e!582358)))

(assert (=> d!123875 (= res!689332 (= (select (arr!31171 lt!454491) #b00000000000000000000000000000000) key!909))))

(assert (=> d!123875 (= (arrayContainsKey!0 lt!454491 key!909 #b00000000000000000000000000000000) e!582358)))

(declare-fun b!1031210 () Bool)

(declare-fun e!582359 () Bool)

(assert (=> b!1031210 (= e!582358 e!582359)))

(declare-fun res!689333 () Bool)

(assert (=> b!1031210 (=> (not res!689333) (not e!582359))))

(assert (=> b!1031210 (= res!689333 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31688 lt!454491)))))

(declare-fun b!1031211 () Bool)

(assert (=> b!1031211 (= e!582359 (arrayContainsKey!0 lt!454491 key!909 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!123875 (not res!689332)) b!1031210))

(assert (= (and b!1031210 res!689333) b!1031211))

(assert (=> d!123875 m!950877))

(declare-fun m!951023 () Bool)

(assert (=> b!1031211 m!951023))

(assert (=> b!1031010 d!123875))

(declare-fun d!123877 () Bool)

(declare-fun lt!454663 () ListLongMap!13699)

(assert (=> d!123877 (not (contains!6000 lt!454663 key!909))))

(declare-fun removeStrictlySorted!53 (List!21816 (_ BitVec 64)) List!21816)

(assert (=> d!123877 (= lt!454663 (ListLongMap!13700 (removeStrictlySorted!53 (toList!6865 (getCurrentListMap!3911 (_keys!11325 thiss!1427) (_values!6144 thiss!1427) (mask!29944 thiss!1427) (extraKeys!5853 thiss!1427) (zeroValue!5957 thiss!1427) (minValue!5957 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6121 thiss!1427))) key!909)))))

(assert (=> d!123877 (= (-!488 (getCurrentListMap!3911 (_keys!11325 thiss!1427) (_values!6144 thiss!1427) (mask!29944 thiss!1427) (extraKeys!5853 thiss!1427) (zeroValue!5957 thiss!1427) (minValue!5957 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6121 thiss!1427)) key!909) lt!454663)))

(declare-fun bs!30105 () Bool)

(assert (= bs!30105 d!123877))

(declare-fun m!951025 () Bool)

(assert (=> bs!30105 m!951025))

(declare-fun m!951027 () Bool)

(assert (=> bs!30105 m!951027))

(assert (=> b!1031010 d!123877))

(declare-fun d!123879 () Bool)

(declare-fun e!582362 () Bool)

(assert (=> d!123879 e!582362))

(declare-fun res!689336 () Bool)

(assert (=> d!123879 (=> (not res!689336) (not e!582362))))

(assert (=> d!123879 (= res!689336 (and (bvsge (index!40936 lt!454488) #b00000000000000000000000000000000) (bvslt (index!40936 lt!454488) (size!31688 (_keys!11325 thiss!1427)))))))

(declare-fun lt!454666 () Unit!33642)

(declare-fun choose!1696 (array!64747 array!64749 (_ BitVec 32) (_ BitVec 32) V!37299 V!37299 (_ BitVec 32) (_ BitVec 64) Int) Unit!33642)

(assert (=> d!123879 (= lt!454666 (choose!1696 (_keys!11325 thiss!1427) (_values!6144 thiss!1427) (mask!29944 thiss!1427) (extraKeys!5853 thiss!1427) (zeroValue!5957 thiss!1427) (minValue!5957 thiss!1427) (index!40936 lt!454488) key!909 (defaultEntry!6121 thiss!1427)))))

(assert (=> d!123879 (validMask!0 (mask!29944 thiss!1427))))

(assert (=> d!123879 (= (lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!14 (_keys!11325 thiss!1427) (_values!6144 thiss!1427) (mask!29944 thiss!1427) (extraKeys!5853 thiss!1427) (zeroValue!5957 thiss!1427) (minValue!5957 thiss!1427) (index!40936 lt!454488) key!909 (defaultEntry!6121 thiss!1427)) lt!454666)))

(declare-fun b!1031214 () Bool)

(assert (=> b!1031214 (= e!582362 (= (-!488 (getCurrentListMap!3911 (_keys!11325 thiss!1427) (_values!6144 thiss!1427) (mask!29944 thiss!1427) (extraKeys!5853 thiss!1427) (zeroValue!5957 thiss!1427) (minValue!5957 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6121 thiss!1427)) key!909) (getCurrentListMap!3911 (array!64748 (store (arr!31171 (_keys!11325 thiss!1427)) (index!40936 lt!454488) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31688 (_keys!11325 thiss!1427))) (array!64750 (store (arr!31172 (_values!6144 thiss!1427)) (index!40936 lt!454488) (ValueCellFull!11456 (dynLambda!1982 (defaultEntry!6121 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!31689 (_values!6144 thiss!1427))) (mask!29944 thiss!1427) (extraKeys!5853 thiss!1427) (zeroValue!5957 thiss!1427) (minValue!5957 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6121 thiss!1427))))))

(assert (=> b!1031214 (bvslt (index!40936 lt!454488) (size!31689 (_values!6144 thiss!1427)))))

(assert (= (and d!123879 res!689336) b!1031214))

(declare-fun b_lambda!15913 () Bool)

(assert (=> (not b_lambda!15913) (not b!1031214)))

(assert (=> b!1031214 t!30901))

(declare-fun b_and!32967 () Bool)

(assert (= b_and!32965 (and (=> t!30901 result!14151) b_and!32967)))

(declare-fun m!951029 () Bool)

(assert (=> d!123879 m!951029))

(assert (=> d!123879 m!950939))

(assert (=> b!1031214 m!950761))

(assert (=> b!1031214 m!950763))

(assert (=> b!1031214 m!950761))

(assert (=> b!1031214 m!950773))

(assert (=> b!1031214 m!950781))

(declare-fun m!951031 () Bool)

(assert (=> b!1031214 m!951031))

(assert (=> b!1031214 m!950779))

(assert (=> b!1031010 d!123879))

(declare-fun b!1031215 () Bool)

(declare-fun e!582363 () (_ BitVec 32))

(declare-fun call!43594 () (_ BitVec 32))

(assert (=> b!1031215 (= e!582363 call!43594)))

(declare-fun b!1031216 () Bool)

(declare-fun e!582364 () (_ BitVec 32))

(assert (=> b!1031216 (= e!582364 #b00000000000000000000000000000000)))

(declare-fun b!1031217 () Bool)

(assert (=> b!1031217 (= e!582364 e!582363)))

(declare-fun c!104495 () Bool)

(assert (=> b!1031217 (= c!104495 (validKeyInArray!0 (select (arr!31171 (_keys!11325 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun d!123881 () Bool)

(declare-fun lt!454667 () (_ BitVec 32))

(assert (=> d!123881 (and (bvsge lt!454667 #b00000000000000000000000000000000) (bvsle lt!454667 (bvsub (size!31688 (_keys!11325 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> d!123881 (= lt!454667 e!582364)))

(declare-fun c!104496 () Bool)

(assert (=> d!123881 (= c!104496 (bvsge #b00000000000000000000000000000000 (size!31688 (_keys!11325 thiss!1427))))))

(assert (=> d!123881 (and (bvsle #b00000000000000000000000000000000 (size!31688 (_keys!11325 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!31688 (_keys!11325 thiss!1427)) (size!31688 (_keys!11325 thiss!1427))))))

(assert (=> d!123881 (= (arrayCountValidKeys!0 (_keys!11325 thiss!1427) #b00000000000000000000000000000000 (size!31688 (_keys!11325 thiss!1427))) lt!454667)))

(declare-fun b!1031218 () Bool)

(assert (=> b!1031218 (= e!582363 (bvadd #b00000000000000000000000000000001 call!43594))))

(declare-fun bm!43591 () Bool)

(assert (=> bm!43591 (= call!43594 (arrayCountValidKeys!0 (_keys!11325 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31688 (_keys!11325 thiss!1427))))))

(assert (= (and d!123881 c!104496) b!1031216))

(assert (= (and d!123881 (not c!104496)) b!1031217))

(assert (= (and b!1031217 c!104495) b!1031218))

(assert (= (and b!1031217 (not c!104495)) b!1031215))

(assert (= (or b!1031218 b!1031215) bm!43591))

(assert (=> b!1031217 m!950893))

(assert (=> b!1031217 m!950893))

(assert (=> b!1031217 m!950929))

(declare-fun m!951033 () Bool)

(assert (=> bm!43591 m!951033))

(assert (=> b!1031010 d!123881))

(declare-fun bm!43594 () Bool)

(declare-fun call!43597 () Bool)

(declare-fun c!104499 () Bool)

(assert (=> bm!43594 (= call!43597 (arrayNoDuplicates!0 lt!454491 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!104499 (Cons!21813 (select (arr!31171 lt!454491) #b00000000000000000000000000000000) Nil!21814) Nil!21814)))))

(declare-fun b!1031229 () Bool)

(declare-fun e!582373 () Bool)

(declare-fun e!582374 () Bool)

(assert (=> b!1031229 (= e!582373 e!582374)))

(assert (=> b!1031229 (= c!104499 (validKeyInArray!0 (select (arr!31171 lt!454491) #b00000000000000000000000000000000)))))

(declare-fun b!1031230 () Bool)

(declare-fun e!582375 () Bool)

(declare-fun contains!6001 (List!21817 (_ BitVec 64)) Bool)

(assert (=> b!1031230 (= e!582375 (contains!6001 Nil!21814 (select (arr!31171 lt!454491) #b00000000000000000000000000000000)))))

(declare-fun b!1031231 () Bool)

(assert (=> b!1031231 (= e!582374 call!43597)))

(declare-fun d!123883 () Bool)

(declare-fun res!689344 () Bool)

(declare-fun e!582376 () Bool)

(assert (=> d!123883 (=> res!689344 e!582376)))

(assert (=> d!123883 (= res!689344 (bvsge #b00000000000000000000000000000000 (size!31688 lt!454491)))))

(assert (=> d!123883 (= (arrayNoDuplicates!0 lt!454491 #b00000000000000000000000000000000 Nil!21814) e!582376)))

(declare-fun b!1031232 () Bool)

(assert (=> b!1031232 (= e!582376 e!582373)))

(declare-fun res!689345 () Bool)

(assert (=> b!1031232 (=> (not res!689345) (not e!582373))))

(assert (=> b!1031232 (= res!689345 (not e!582375))))

(declare-fun res!689343 () Bool)

(assert (=> b!1031232 (=> (not res!689343) (not e!582375))))

(assert (=> b!1031232 (= res!689343 (validKeyInArray!0 (select (arr!31171 lt!454491) #b00000000000000000000000000000000)))))

(declare-fun b!1031233 () Bool)

(assert (=> b!1031233 (= e!582374 call!43597)))

(assert (= (and d!123883 (not res!689344)) b!1031232))

(assert (= (and b!1031232 res!689343) b!1031230))

(assert (= (and b!1031232 res!689345) b!1031229))

(assert (= (and b!1031229 c!104499) b!1031231))

(assert (= (and b!1031229 (not c!104499)) b!1031233))

(assert (= (or b!1031231 b!1031233) bm!43594))

(assert (=> bm!43594 m!950877))

(declare-fun m!951035 () Bool)

(assert (=> bm!43594 m!951035))

(assert (=> b!1031229 m!950877))

(assert (=> b!1031229 m!950877))

(assert (=> b!1031229 m!950885))

(assert (=> b!1031230 m!950877))

(assert (=> b!1031230 m!950877))

(declare-fun m!951037 () Bool)

(assert (=> b!1031230 m!951037))

(assert (=> b!1031232 m!950877))

(assert (=> b!1031232 m!950877))

(assert (=> b!1031232 m!950885))

(assert (=> b!1031010 d!123883))

(declare-fun b!1031246 () Bool)

(declare-fun e!582383 () SeekEntryResult!9641)

(declare-fun lt!454677 () SeekEntryResult!9641)

(assert (=> b!1031246 (= e!582383 (MissingZero!9641 (index!40937 lt!454677)))))

(declare-fun b!1031247 () Bool)

(declare-fun e!582384 () SeekEntryResult!9641)

(declare-fun e!582385 () SeekEntryResult!9641)

(assert (=> b!1031247 (= e!582384 e!582385)))

(declare-fun lt!454678 () (_ BitVec 64))

(assert (=> b!1031247 (= lt!454678 (select (arr!31171 (_keys!11325 thiss!1427)) (index!40937 lt!454677)))))

(declare-fun c!104507 () Bool)

(assert (=> b!1031247 (= c!104507 (= lt!454678 key!909))))

(declare-fun b!1031248 () Bool)

(declare-fun c!104508 () Bool)

(assert (=> b!1031248 (= c!104508 (= lt!454678 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1031248 (= e!582385 e!582383)))

(declare-fun b!1031249 () Bool)

(assert (=> b!1031249 (= e!582385 (Found!9641 (index!40937 lt!454677)))))

(declare-fun d!123885 () Bool)

(declare-fun lt!454676 () SeekEntryResult!9641)

(assert (=> d!123885 (and (or ((_ is MissingVacant!9641) lt!454676) (not ((_ is Found!9641) lt!454676)) (and (bvsge (index!40936 lt!454676) #b00000000000000000000000000000000) (bvslt (index!40936 lt!454676) (size!31688 (_keys!11325 thiss!1427))))) (not ((_ is MissingVacant!9641) lt!454676)) (or (not ((_ is Found!9641) lt!454676)) (= (select (arr!31171 (_keys!11325 thiss!1427)) (index!40936 lt!454676)) key!909)))))

(assert (=> d!123885 (= lt!454676 e!582384)))

(declare-fun c!104506 () Bool)

(assert (=> d!123885 (= c!104506 (and ((_ is Intermediate!9641) lt!454677) (undefined!10453 lt!454677)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!64747 (_ BitVec 32)) SeekEntryResult!9641)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!123885 (= lt!454677 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!909 (mask!29944 thiss!1427)) key!909 (_keys!11325 thiss!1427) (mask!29944 thiss!1427)))))

(assert (=> d!123885 (validMask!0 (mask!29944 thiss!1427))))

(assert (=> d!123885 (= (seekEntry!0 key!909 (_keys!11325 thiss!1427) (mask!29944 thiss!1427)) lt!454676)))

(declare-fun b!1031250 () Bool)

(assert (=> b!1031250 (= e!582384 Undefined!9641)))

(declare-fun b!1031251 () Bool)

(declare-fun lt!454679 () SeekEntryResult!9641)

(assert (=> b!1031251 (= e!582383 (ite ((_ is MissingVacant!9641) lt!454679) (MissingZero!9641 (index!40938 lt!454679)) lt!454679))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!64747 (_ BitVec 32)) SeekEntryResult!9641)

(assert (=> b!1031251 (= lt!454679 (seekKeyOrZeroReturnVacant!0 (x!91611 lt!454677) (index!40937 lt!454677) (index!40937 lt!454677) key!909 (_keys!11325 thiss!1427) (mask!29944 thiss!1427)))))

(assert (= (and d!123885 c!104506) b!1031250))

(assert (= (and d!123885 (not c!104506)) b!1031247))

(assert (= (and b!1031247 c!104507) b!1031249))

(assert (= (and b!1031247 (not c!104507)) b!1031248))

(assert (= (and b!1031248 c!104508) b!1031246))

(assert (= (and b!1031248 (not c!104508)) b!1031251))

(declare-fun m!951039 () Bool)

(assert (=> b!1031247 m!951039))

(declare-fun m!951041 () Bool)

(assert (=> d!123885 m!951041))

(declare-fun m!951043 () Bool)

(assert (=> d!123885 m!951043))

(assert (=> d!123885 m!951043))

(declare-fun m!951045 () Bool)

(assert (=> d!123885 m!951045))

(assert (=> d!123885 m!950939))

(declare-fun m!951047 () Bool)

(assert (=> b!1031251 m!951047))

(assert (=> b!1031012 d!123885))

(declare-fun b!1031259 () Bool)

(declare-fun e!582390 () Bool)

(assert (=> b!1031259 (= e!582390 tp_is_empty!24319)))

(declare-fun mapNonEmpty!37934 () Bool)

(declare-fun mapRes!37934 () Bool)

(declare-fun tp!72876 () Bool)

(declare-fun e!582391 () Bool)

(assert (=> mapNonEmpty!37934 (= mapRes!37934 (and tp!72876 e!582391))))

(declare-fun mapValue!37934 () ValueCell!11456)

(declare-fun mapKey!37934 () (_ BitVec 32))

(declare-fun mapRest!37934 () (Array (_ BitVec 32) ValueCell!11456))

(assert (=> mapNonEmpty!37934 (= mapRest!37925 (store mapRest!37934 mapKey!37934 mapValue!37934))))

(declare-fun condMapEmpty!37934 () Bool)

(declare-fun mapDefault!37934 () ValueCell!11456)

(assert (=> mapNonEmpty!37925 (= condMapEmpty!37934 (= mapRest!37925 ((as const (Array (_ BitVec 32) ValueCell!11456)) mapDefault!37934)))))

(assert (=> mapNonEmpty!37925 (= tp!72861 (and e!582390 mapRes!37934))))

(declare-fun b!1031258 () Bool)

(assert (=> b!1031258 (= e!582391 tp_is_empty!24319)))

(declare-fun mapIsEmpty!37934 () Bool)

(assert (=> mapIsEmpty!37934 mapRes!37934))

(assert (= (and mapNonEmpty!37925 condMapEmpty!37934) mapIsEmpty!37934))

(assert (= (and mapNonEmpty!37925 (not condMapEmpty!37934)) mapNonEmpty!37934))

(assert (= (and mapNonEmpty!37934 ((_ is ValueCellFull!11456) mapValue!37934)) b!1031258))

(assert (= (and mapNonEmpty!37925 ((_ is ValueCellFull!11456) mapDefault!37934)) b!1031259))

(declare-fun m!951049 () Bool)

(assert (=> mapNonEmpty!37934 m!951049))

(declare-fun b_lambda!15915 () Bool)

(assert (= b_lambda!15911 (or (and b!1031009 b_free!20599) b_lambda!15915)))

(declare-fun b_lambda!15917 () Bool)

(assert (= b_lambda!15913 (or (and b!1031009 b_free!20599) b_lambda!15917)))

(declare-fun b_lambda!15919 () Bool)

(assert (= b_lambda!15909 (or (and b!1031009 b_free!20599) b_lambda!15919)))

(check-sat (not bm!43580) (not bm!43591) (not b!1031211) (not b!1031173) (not bm!43583) (not b!1031187) (not b!1031137) (not b!1031217) (not bm!43586) (not bm!43559) (not d!123861) (not b!1031160) (not b!1031161) (not bm!43584) tp_is_empty!24319 (not b!1031251) (not d!123873) (not b!1031214) (not b!1031184) (not bm!43594) b_and!32967 (not mapNonEmpty!37934) (not d!123877) (not b!1031232) (not bm!43587) (not d!123879) (not b!1031085) (not b!1031168) (not b!1031075) (not b!1031201) (not b!1031135) (not b!1031140) (not b!1031230) (not d!123865) (not b!1031190) (not b!1031139) (not b!1031172) (not b!1031151) (not b!1031178) (not bm!43590) (not b!1031149) (not bm!43576) (not b!1031163) (not b!1031167) (not b!1031205) (not b!1031182) (not b!1031145) (not d!123867) (not d!123851) (not d!123869) (not b!1031229) (not bm!43579) (not b!1031134) (not b!1031074) (not b_next!20599) (not b_lambda!15915) (not d!123859) (not d!123885) (not bm!43577) (not b!1031170) (not b!1031086) (not b_lambda!15907) (not b_lambda!15919) (not b_lambda!15917) (not b!1031076))
(check-sat b_and!32967 (not b_next!20599))
(get-model)

(declare-fun d!123887 () Bool)

(declare-fun e!582394 () Bool)

(assert (=> d!123887 e!582394))

(declare-fun res!689351 () Bool)

(assert (=> d!123887 (=> (not res!689351) (not e!582394))))

(declare-fun lt!454689 () ListLongMap!13699)

(assert (=> d!123887 (= res!689351 (contains!6000 lt!454689 (_1!7802 (tuple2!15583 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5957 thiss!1427)))))))

(declare-fun lt!454691 () List!21816)

(assert (=> d!123887 (= lt!454689 (ListLongMap!13700 lt!454691))))

(declare-fun lt!454690 () Unit!33642)

(declare-fun lt!454688 () Unit!33642)

(assert (=> d!123887 (= lt!454690 lt!454688)))

(declare-datatypes ((Option!634 0))(
  ( (Some!633 (v!14785 V!37299)) (None!632) )
))
(declare-fun getValueByKey!583 (List!21816 (_ BitVec 64)) Option!634)

(assert (=> d!123887 (= (getValueByKey!583 lt!454691 (_1!7802 (tuple2!15583 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5957 thiss!1427)))) (Some!633 (_2!7802 (tuple2!15583 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5957 thiss!1427)))))))

(declare-fun lemmaContainsTupThenGetReturnValue!279 (List!21816 (_ BitVec 64) V!37299) Unit!33642)

(assert (=> d!123887 (= lt!454688 (lemmaContainsTupThenGetReturnValue!279 lt!454691 (_1!7802 (tuple2!15583 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5957 thiss!1427))) (_2!7802 (tuple2!15583 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5957 thiss!1427)))))))

(declare-fun insertStrictlySorted!372 (List!21816 (_ BitVec 64) V!37299) List!21816)

(assert (=> d!123887 (= lt!454691 (insertStrictlySorted!372 (toList!6865 call!43577) (_1!7802 (tuple2!15583 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5957 thiss!1427))) (_2!7802 (tuple2!15583 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5957 thiss!1427)))))))

(assert (=> d!123887 (= (+!3124 call!43577 (tuple2!15583 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5957 thiss!1427))) lt!454689)))

(declare-fun b!1031264 () Bool)

(declare-fun res!689350 () Bool)

(assert (=> b!1031264 (=> (not res!689350) (not e!582394))))

(assert (=> b!1031264 (= res!689350 (= (getValueByKey!583 (toList!6865 lt!454689) (_1!7802 (tuple2!15583 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5957 thiss!1427)))) (Some!633 (_2!7802 (tuple2!15583 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5957 thiss!1427))))))))

(declare-fun b!1031265 () Bool)

(declare-fun contains!6002 (List!21816 tuple2!15582) Bool)

(assert (=> b!1031265 (= e!582394 (contains!6002 (toList!6865 lt!454689) (tuple2!15583 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5957 thiss!1427))))))

(assert (= (and d!123887 res!689351) b!1031264))

(assert (= (and b!1031264 res!689350) b!1031265))

(declare-fun m!951051 () Bool)

(assert (=> d!123887 m!951051))

(declare-fun m!951053 () Bool)

(assert (=> d!123887 m!951053))

(declare-fun m!951055 () Bool)

(assert (=> d!123887 m!951055))

(declare-fun m!951057 () Bool)

(assert (=> d!123887 m!951057))

(declare-fun m!951059 () Bool)

(assert (=> b!1031264 m!951059))

(declare-fun m!951061 () Bool)

(assert (=> b!1031265 m!951061))

(assert (=> b!1031137 d!123887))

(declare-fun d!123889 () Bool)

(declare-fun e!582399 () Bool)

(assert (=> d!123889 e!582399))

(declare-fun res!689354 () Bool)

(assert (=> d!123889 (=> res!689354 e!582399)))

(declare-fun lt!454703 () Bool)

(assert (=> d!123889 (= res!689354 (not lt!454703))))

(declare-fun lt!454702 () Bool)

(assert (=> d!123889 (= lt!454703 lt!454702)))

(declare-fun lt!454701 () Unit!33642)

(declare-fun e!582400 () Unit!33642)

(assert (=> d!123889 (= lt!454701 e!582400)))

(declare-fun c!104511 () Bool)

(assert (=> d!123889 (= c!104511 lt!454702)))

(declare-fun containsKey!564 (List!21816 (_ BitVec 64)) Bool)

(assert (=> d!123889 (= lt!454702 (containsKey!564 (toList!6865 lt!454608) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!123889 (= (contains!6000 lt!454608 #b0000000000000000000000000000000000000000000000000000000000000000) lt!454703)))

(declare-fun b!1031272 () Bool)

(declare-fun lt!454700 () Unit!33642)

(assert (=> b!1031272 (= e!582400 lt!454700)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!395 (List!21816 (_ BitVec 64)) Unit!33642)

(assert (=> b!1031272 (= lt!454700 (lemmaContainsKeyImpliesGetValueByKeyDefined!395 (toList!6865 lt!454608) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun isDefined!433 (Option!634) Bool)

(assert (=> b!1031272 (isDefined!433 (getValueByKey!583 (toList!6865 lt!454608) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1031273 () Bool)

(declare-fun Unit!33648 () Unit!33642)

(assert (=> b!1031273 (= e!582400 Unit!33648)))

(declare-fun b!1031274 () Bool)

(assert (=> b!1031274 (= e!582399 (isDefined!433 (getValueByKey!583 (toList!6865 lt!454608) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!123889 c!104511) b!1031272))

(assert (= (and d!123889 (not c!104511)) b!1031273))

(assert (= (and d!123889 (not res!689354)) b!1031274))

(declare-fun m!951063 () Bool)

(assert (=> d!123889 m!951063))

(declare-fun m!951065 () Bool)

(assert (=> b!1031272 m!951065))

(declare-fun m!951067 () Bool)

(assert (=> b!1031272 m!951067))

(assert (=> b!1031272 m!951067))

(declare-fun m!951069 () Bool)

(assert (=> b!1031272 m!951069))

(assert (=> b!1031274 m!951067))

(assert (=> b!1031274 m!951067))

(assert (=> b!1031274 m!951069))

(assert (=> bm!43577 d!123889))

(declare-fun bm!43595 () Bool)

(declare-fun c!104512 () Bool)

(declare-fun call!43598 () Bool)

(assert (=> bm!43595 (= call!43598 (arrayNoDuplicates!0 (array!64748 (store (arr!31171 (_keys!11325 thiss!1427)) (index!40936 lt!454488) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31688 (_keys!11325 thiss!1427))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!104512 (Cons!21813 (select (arr!31171 (array!64748 (store (arr!31171 (_keys!11325 thiss!1427)) (index!40936 lt!454488) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31688 (_keys!11325 thiss!1427)))) #b00000000000000000000000000000000) Nil!21814) Nil!21814)))))

(declare-fun b!1031275 () Bool)

(declare-fun e!582401 () Bool)

(declare-fun e!582402 () Bool)

(assert (=> b!1031275 (= e!582401 e!582402)))

(assert (=> b!1031275 (= c!104512 (validKeyInArray!0 (select (arr!31171 (array!64748 (store (arr!31171 (_keys!11325 thiss!1427)) (index!40936 lt!454488) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31688 (_keys!11325 thiss!1427)))) #b00000000000000000000000000000000)))))

(declare-fun b!1031276 () Bool)

(declare-fun e!582403 () Bool)

(assert (=> b!1031276 (= e!582403 (contains!6001 Nil!21814 (select (arr!31171 (array!64748 (store (arr!31171 (_keys!11325 thiss!1427)) (index!40936 lt!454488) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31688 (_keys!11325 thiss!1427)))) #b00000000000000000000000000000000)))))

(declare-fun b!1031277 () Bool)

(assert (=> b!1031277 (= e!582402 call!43598)))

(declare-fun d!123891 () Bool)

(declare-fun res!689356 () Bool)

(declare-fun e!582404 () Bool)

(assert (=> d!123891 (=> res!689356 e!582404)))

(assert (=> d!123891 (= res!689356 (bvsge #b00000000000000000000000000000000 (size!31688 (array!64748 (store (arr!31171 (_keys!11325 thiss!1427)) (index!40936 lt!454488) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31688 (_keys!11325 thiss!1427))))))))

(assert (=> d!123891 (= (arrayNoDuplicates!0 (array!64748 (store (arr!31171 (_keys!11325 thiss!1427)) (index!40936 lt!454488) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31688 (_keys!11325 thiss!1427))) #b00000000000000000000000000000000 Nil!21814) e!582404)))

(declare-fun b!1031278 () Bool)

(assert (=> b!1031278 (= e!582404 e!582401)))

(declare-fun res!689357 () Bool)

(assert (=> b!1031278 (=> (not res!689357) (not e!582401))))

(assert (=> b!1031278 (= res!689357 (not e!582403))))

(declare-fun res!689355 () Bool)

(assert (=> b!1031278 (=> (not res!689355) (not e!582403))))

(assert (=> b!1031278 (= res!689355 (validKeyInArray!0 (select (arr!31171 (array!64748 (store (arr!31171 (_keys!11325 thiss!1427)) (index!40936 lt!454488) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31688 (_keys!11325 thiss!1427)))) #b00000000000000000000000000000000)))))

(declare-fun b!1031279 () Bool)

(assert (=> b!1031279 (= e!582402 call!43598)))

(assert (= (and d!123891 (not res!689356)) b!1031278))

(assert (= (and b!1031278 res!689355) b!1031276))

(assert (= (and b!1031278 res!689357) b!1031275))

(assert (= (and b!1031275 c!104512) b!1031277))

(assert (= (and b!1031275 (not c!104512)) b!1031279))

(assert (= (or b!1031277 b!1031279) bm!43595))

(declare-fun m!951071 () Bool)

(assert (=> bm!43595 m!951071))

(declare-fun m!951073 () Bool)

(assert (=> bm!43595 m!951073))

(assert (=> b!1031275 m!951071))

(assert (=> b!1031275 m!951071))

(declare-fun m!951075 () Bool)

(assert (=> b!1031275 m!951075))

(assert (=> b!1031276 m!951071))

(assert (=> b!1031276 m!951071))

(declare-fun m!951077 () Bool)

(assert (=> b!1031276 m!951077))

(assert (=> b!1031278 m!951071))

(assert (=> b!1031278 m!951071))

(assert (=> b!1031278 m!951075))

(assert (=> b!1031187 d!123891))

(declare-fun d!123893 () Bool)

(declare-fun res!689358 () Bool)

(declare-fun e!582405 () Bool)

(assert (=> d!123893 (=> res!689358 e!582405)))

(assert (=> d!123893 (= res!689358 (= (select (arr!31171 (array!64748 (store (arr!31171 (_keys!11325 thiss!1427)) (index!40936 lt!454488) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31688 (_keys!11325 thiss!1427)))) #b00000000000000000000000000000000) key!909))))

(assert (=> d!123893 (= (arrayContainsKey!0 (array!64748 (store (arr!31171 (_keys!11325 thiss!1427)) (index!40936 lt!454488) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31688 (_keys!11325 thiss!1427))) key!909 #b00000000000000000000000000000000) e!582405)))

(declare-fun b!1031280 () Bool)

(declare-fun e!582406 () Bool)

(assert (=> b!1031280 (= e!582405 e!582406)))

(declare-fun res!689359 () Bool)

(assert (=> b!1031280 (=> (not res!689359) (not e!582406))))

(assert (=> b!1031280 (= res!689359 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31688 (array!64748 (store (arr!31171 (_keys!11325 thiss!1427)) (index!40936 lt!454488) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31688 (_keys!11325 thiss!1427))))))))

(declare-fun b!1031281 () Bool)

(assert (=> b!1031281 (= e!582406 (arrayContainsKey!0 (array!64748 (store (arr!31171 (_keys!11325 thiss!1427)) (index!40936 lt!454488) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31688 (_keys!11325 thiss!1427))) key!909 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!123893 (not res!689358)) b!1031280))

(assert (= (and b!1031280 res!689359) b!1031281))

(assert (=> d!123893 m!951071))

(declare-fun m!951079 () Bool)

(assert (=> b!1031281 m!951079))

(assert (=> b!1031190 d!123893))

(declare-fun d!123895 () Bool)

(declare-fun e!582407 () Bool)

(assert (=> d!123895 e!582407))

(declare-fun res!689361 () Bool)

(assert (=> d!123895 (=> (not res!689361) (not e!582407))))

(declare-fun lt!454705 () ListLongMap!13699)

(assert (=> d!123895 (= res!689361 (contains!6000 lt!454705 (_1!7802 (ite (or c!104486 c!104485) (tuple2!15583 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5957 thiss!1427)) (tuple2!15583 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5957 thiss!1427))))))))

(declare-fun lt!454707 () List!21816)

(assert (=> d!123895 (= lt!454705 (ListLongMap!13700 lt!454707))))

(declare-fun lt!454706 () Unit!33642)

(declare-fun lt!454704 () Unit!33642)

(assert (=> d!123895 (= lt!454706 lt!454704)))

(assert (=> d!123895 (= (getValueByKey!583 lt!454707 (_1!7802 (ite (or c!104486 c!104485) (tuple2!15583 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5957 thiss!1427)) (tuple2!15583 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5957 thiss!1427))))) (Some!633 (_2!7802 (ite (or c!104486 c!104485) (tuple2!15583 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5957 thiss!1427)) (tuple2!15583 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5957 thiss!1427))))))))

(assert (=> d!123895 (= lt!454704 (lemmaContainsTupThenGetReturnValue!279 lt!454707 (_1!7802 (ite (or c!104486 c!104485) (tuple2!15583 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5957 thiss!1427)) (tuple2!15583 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5957 thiss!1427)))) (_2!7802 (ite (or c!104486 c!104485) (tuple2!15583 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5957 thiss!1427)) (tuple2!15583 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5957 thiss!1427))))))))

(assert (=> d!123895 (= lt!454707 (insertStrictlySorted!372 (toList!6865 (ite c!104486 call!43589 (ite c!104485 call!43587 call!43586))) (_1!7802 (ite (or c!104486 c!104485) (tuple2!15583 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5957 thiss!1427)) (tuple2!15583 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5957 thiss!1427)))) (_2!7802 (ite (or c!104486 c!104485) (tuple2!15583 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5957 thiss!1427)) (tuple2!15583 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5957 thiss!1427))))))))

(assert (=> d!123895 (= (+!3124 (ite c!104486 call!43589 (ite c!104485 call!43587 call!43586)) (ite (or c!104486 c!104485) (tuple2!15583 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5957 thiss!1427)) (tuple2!15583 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5957 thiss!1427)))) lt!454705)))

(declare-fun b!1031282 () Bool)

(declare-fun res!689360 () Bool)

(assert (=> b!1031282 (=> (not res!689360) (not e!582407))))

(assert (=> b!1031282 (= res!689360 (= (getValueByKey!583 (toList!6865 lt!454705) (_1!7802 (ite (or c!104486 c!104485) (tuple2!15583 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5957 thiss!1427)) (tuple2!15583 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5957 thiss!1427))))) (Some!633 (_2!7802 (ite (or c!104486 c!104485) (tuple2!15583 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5957 thiss!1427)) (tuple2!15583 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5957 thiss!1427)))))))))

(declare-fun b!1031283 () Bool)

(assert (=> b!1031283 (= e!582407 (contains!6002 (toList!6865 lt!454705) (ite (or c!104486 c!104485) (tuple2!15583 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5957 thiss!1427)) (tuple2!15583 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5957 thiss!1427)))))))

(assert (= (and d!123895 res!689361) b!1031282))

(assert (= (and b!1031282 res!689360) b!1031283))

(declare-fun m!951081 () Bool)

(assert (=> d!123895 m!951081))

(declare-fun m!951083 () Bool)

(assert (=> d!123895 m!951083))

(declare-fun m!951085 () Bool)

(assert (=> d!123895 m!951085))

(declare-fun m!951087 () Bool)

(assert (=> d!123895 m!951087))

(declare-fun m!951089 () Bool)

(assert (=> b!1031282 m!951089))

(declare-fun m!951091 () Bool)

(assert (=> b!1031283 m!951091))

(assert (=> bm!43586 d!123895))

(declare-fun d!123897 () Bool)

(assert (=> d!123897 (= (validKeyInArray!0 (select (arr!31171 lt!454491) #b00000000000000000000000000000000)) (and (not (= (select (arr!31171 lt!454491) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!31171 lt!454491) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1031201 d!123897))

(declare-fun b!1031284 () Bool)

(declare-fun e!582408 () (_ BitVec 32))

(declare-fun call!43599 () (_ BitVec 32))

(assert (=> b!1031284 (= e!582408 call!43599)))

(declare-fun b!1031285 () Bool)

(declare-fun e!582409 () (_ BitVec 32))

(assert (=> b!1031285 (= e!582409 #b00000000000000000000000000000000)))

(declare-fun b!1031286 () Bool)

(assert (=> b!1031286 (= e!582409 e!582408)))

(declare-fun c!104513 () Bool)

(assert (=> b!1031286 (= c!104513 (validKeyInArray!0 (select (arr!31171 lt!454491) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!123899 () Bool)

(declare-fun lt!454708 () (_ BitVec 32))

(assert (=> d!123899 (and (bvsge lt!454708 #b00000000000000000000000000000000) (bvsle lt!454708 (bvsub (size!31688 lt!454491) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> d!123899 (= lt!454708 e!582409)))

(declare-fun c!104514 () Bool)

(assert (=> d!123899 (= c!104514 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31688 (_keys!11325 thiss!1427))))))

(assert (=> d!123899 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31688 (_keys!11325 thiss!1427))) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (size!31688 (_keys!11325 thiss!1427)) (size!31688 lt!454491)))))

(assert (=> d!123899 (= (arrayCountValidKeys!0 lt!454491 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31688 (_keys!11325 thiss!1427))) lt!454708)))

(declare-fun b!1031287 () Bool)

(assert (=> b!1031287 (= e!582408 (bvadd #b00000000000000000000000000000001 call!43599))))

(declare-fun bm!43596 () Bool)

(assert (=> bm!43596 (= call!43599 (arrayCountValidKeys!0 lt!454491 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!31688 (_keys!11325 thiss!1427))))))

(assert (= (and d!123899 c!104514) b!1031285))

(assert (= (and d!123899 (not c!104514)) b!1031286))

(assert (= (and b!1031286 c!104513) b!1031287))

(assert (= (and b!1031286 (not c!104513)) b!1031284))

(assert (= (or b!1031287 b!1031284) bm!43596))

(declare-fun m!951093 () Bool)

(assert (=> b!1031286 m!951093))

(assert (=> b!1031286 m!951093))

(declare-fun m!951095 () Bool)

(assert (=> b!1031286 m!951095))

(declare-fun m!951097 () Bool)

(assert (=> bm!43596 m!951097))

(assert (=> bm!43590 d!123899))

(declare-fun b!1031288 () Bool)

(declare-fun e!582412 () Bool)

(declare-fun e!582410 () Bool)

(assert (=> b!1031288 (= e!582412 e!582410)))

(declare-fun lt!454710 () (_ BitVec 64))

(assert (=> b!1031288 (= lt!454710 (select (arr!31171 (array!64748 (store (arr!31171 (_keys!11325 thiss!1427)) (index!40936 lt!454488) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31688 (_keys!11325 thiss!1427)))) #b00000000000000000000000000000000))))

(declare-fun lt!454709 () Unit!33642)

(assert (=> b!1031288 (= lt!454709 (lemmaArrayContainsFromImpliesContainsFromZero!0 (array!64748 (store (arr!31171 (_keys!11325 thiss!1427)) (index!40936 lt!454488) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31688 (_keys!11325 thiss!1427))) lt!454710 #b00000000000000000000000000000000))))

(assert (=> b!1031288 (arrayContainsKey!0 (array!64748 (store (arr!31171 (_keys!11325 thiss!1427)) (index!40936 lt!454488) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31688 (_keys!11325 thiss!1427))) lt!454710 #b00000000000000000000000000000000)))

(declare-fun lt!454711 () Unit!33642)

(assert (=> b!1031288 (= lt!454711 lt!454709)))

(declare-fun res!689363 () Bool)

(assert (=> b!1031288 (= res!689363 (= (seekEntryOrOpen!0 (select (arr!31171 (array!64748 (store (arr!31171 (_keys!11325 thiss!1427)) (index!40936 lt!454488) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31688 (_keys!11325 thiss!1427)))) #b00000000000000000000000000000000) (array!64748 (store (arr!31171 (_keys!11325 thiss!1427)) (index!40936 lt!454488) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31688 (_keys!11325 thiss!1427))) (mask!29944 thiss!1427)) (Found!9641 #b00000000000000000000000000000000)))))

(assert (=> b!1031288 (=> (not res!689363) (not e!582410))))

(declare-fun b!1031289 () Bool)

(declare-fun e!582411 () Bool)

(assert (=> b!1031289 (= e!582411 e!582412)))

(declare-fun c!104515 () Bool)

(assert (=> b!1031289 (= c!104515 (validKeyInArray!0 (select (arr!31171 (array!64748 (store (arr!31171 (_keys!11325 thiss!1427)) (index!40936 lt!454488) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31688 (_keys!11325 thiss!1427)))) #b00000000000000000000000000000000)))))

(declare-fun bm!43597 () Bool)

(declare-fun call!43600 () Bool)

(assert (=> bm!43597 (= call!43600 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (array!64748 (store (arr!31171 (_keys!11325 thiss!1427)) (index!40936 lt!454488) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31688 (_keys!11325 thiss!1427))) (mask!29944 thiss!1427)))))

(declare-fun b!1031290 () Bool)

(assert (=> b!1031290 (= e!582412 call!43600)))

(declare-fun b!1031291 () Bool)

(assert (=> b!1031291 (= e!582410 call!43600)))

(declare-fun d!123901 () Bool)

(declare-fun res!689362 () Bool)

(assert (=> d!123901 (=> res!689362 e!582411)))

(assert (=> d!123901 (= res!689362 (bvsge #b00000000000000000000000000000000 (size!31688 (array!64748 (store (arr!31171 (_keys!11325 thiss!1427)) (index!40936 lt!454488) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31688 (_keys!11325 thiss!1427))))))))

(assert (=> d!123901 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!64748 (store (arr!31171 (_keys!11325 thiss!1427)) (index!40936 lt!454488) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31688 (_keys!11325 thiss!1427))) (mask!29944 thiss!1427)) e!582411)))

(assert (= (and d!123901 (not res!689362)) b!1031289))

(assert (= (and b!1031289 c!104515) b!1031288))

(assert (= (and b!1031289 (not c!104515)) b!1031290))

(assert (= (and b!1031288 res!689363) b!1031291))

(assert (= (or b!1031291 b!1031290) bm!43597))

(assert (=> b!1031288 m!951071))

(declare-fun m!951099 () Bool)

(assert (=> b!1031288 m!951099))

(declare-fun m!951101 () Bool)

(assert (=> b!1031288 m!951101))

(assert (=> b!1031288 m!951071))

(declare-fun m!951103 () Bool)

(assert (=> b!1031288 m!951103))

(assert (=> b!1031289 m!951071))

(assert (=> b!1031289 m!951071))

(assert (=> b!1031289 m!951075))

(declare-fun m!951105 () Bool)

(assert (=> bm!43597 m!951105))

(assert (=> b!1031205 d!123901))

(declare-fun d!123903 () Bool)

(assert (=> d!123903 (= (validKeyInArray!0 (select (arr!31171 (_keys!11325 thiss!1427)) #b00000000000000000000000000000000)) (and (not (= (select (arr!31171 (_keys!11325 thiss!1427)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!31171 (_keys!11325 thiss!1427)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1031139 d!123903))

(declare-fun d!123905 () Bool)

(assert (=> d!123905 (arrayNoDuplicates!0 (array!64748 (store (arr!31171 (_keys!11325 thiss!1427)) (index!40936 lt!454488) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31688 (_keys!11325 thiss!1427))) #b00000000000000000000000000000000 Nil!21814)))

(assert (=> d!123905 true))

(declare-fun _$66!41 () Unit!33642)

(assert (=> d!123905 (= (choose!53 (_keys!11325 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!40936 lt!454488) #b00000000000000000000000000000000 Nil!21814) _$66!41)))

(declare-fun bs!30106 () Bool)

(assert (= bs!30106 d!123905))

(assert (=> bs!30106 m!950779))

(assert (=> bs!30106 m!951011))

(assert (=> d!123867 d!123905))

(assert (=> b!1031172 d!123897))

(assert (=> b!1031229 d!123897))

(declare-fun d!123907 () Bool)

(declare-fun e!582413 () Bool)

(assert (=> d!123907 e!582413))

(declare-fun res!689364 () Bool)

(assert (=> d!123907 (=> res!689364 e!582413)))

(declare-fun lt!454715 () Bool)

(assert (=> d!123907 (= res!689364 (not lt!454715))))

(declare-fun lt!454714 () Bool)

(assert (=> d!123907 (= lt!454715 lt!454714)))

(declare-fun lt!454713 () Unit!33642)

(declare-fun e!582414 () Unit!33642)

(assert (=> d!123907 (= lt!454713 e!582414)))

(declare-fun c!104516 () Bool)

(assert (=> d!123907 (= c!104516 lt!454714)))

(assert (=> d!123907 (= lt!454714 (containsKey!564 (toList!6865 lt!454608) (select (arr!31171 (_keys!11325 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> d!123907 (= (contains!6000 lt!454608 (select (arr!31171 (_keys!11325 thiss!1427)) #b00000000000000000000000000000000)) lt!454715)))

(declare-fun b!1031292 () Bool)

(declare-fun lt!454712 () Unit!33642)

(assert (=> b!1031292 (= e!582414 lt!454712)))

(assert (=> b!1031292 (= lt!454712 (lemmaContainsKeyImpliesGetValueByKeyDefined!395 (toList!6865 lt!454608) (select (arr!31171 (_keys!11325 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> b!1031292 (isDefined!433 (getValueByKey!583 (toList!6865 lt!454608) (select (arr!31171 (_keys!11325 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1031293 () Bool)

(declare-fun Unit!33649 () Unit!33642)

(assert (=> b!1031293 (= e!582414 Unit!33649)))

(declare-fun b!1031294 () Bool)

(assert (=> b!1031294 (= e!582413 (isDefined!433 (getValueByKey!583 (toList!6865 lt!454608) (select (arr!31171 (_keys!11325 thiss!1427)) #b00000000000000000000000000000000))))))

(assert (= (and d!123907 c!104516) b!1031292))

(assert (= (and d!123907 (not c!104516)) b!1031293))

(assert (= (and d!123907 (not res!689364)) b!1031294))

(assert (=> d!123907 m!950893))

(declare-fun m!951107 () Bool)

(assert (=> d!123907 m!951107))

(assert (=> b!1031292 m!950893))

(declare-fun m!951109 () Bool)

(assert (=> b!1031292 m!951109))

(assert (=> b!1031292 m!950893))

(declare-fun m!951111 () Bool)

(assert (=> b!1031292 m!951111))

(assert (=> b!1031292 m!951111))

(declare-fun m!951113 () Bool)

(assert (=> b!1031292 m!951113))

(assert (=> b!1031294 m!950893))

(assert (=> b!1031294 m!951111))

(assert (=> b!1031294 m!951111))

(assert (=> b!1031294 m!951113))

(assert (=> b!1031149 d!123907))

(assert (=> b!1031135 d!123903))

(declare-fun d!123909 () Bool)

(declare-fun get!16392 (Option!634) V!37299)

(assert (=> d!123909 (= (apply!913 lt!454608 #b1000000000000000000000000000000000000000000000000000000000000000) (get!16392 (getValueByKey!583 (toList!6865 lt!454608) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!30107 () Bool)

(assert (= bs!30107 d!123909))

(declare-fun m!951115 () Bool)

(assert (=> bs!30107 m!951115))

(assert (=> bs!30107 m!951115))

(declare-fun m!951117 () Bool)

(assert (=> bs!30107 m!951117))

(assert (=> b!1031151 d!123909))

(assert (=> b!1031074 d!123881))

(declare-fun d!123911 () Bool)

(assert (=> d!123911 (= (validKeyInArray!0 #b1000000000000000000000000000000000000000000000000000000000000000) false)))

(assert (=> b!1031161 d!123911))

(declare-fun d!123913 () Bool)

(declare-fun e!582415 () Bool)

(assert (=> d!123913 e!582415))

(declare-fun res!689366 () Bool)

(assert (=> d!123913 (=> (not res!689366) (not e!582415))))

(declare-fun lt!454717 () ListLongMap!13699)

(assert (=> d!123913 (= res!689366 (contains!6000 lt!454717 (_1!7802 (ite (or c!104480 c!104479) (tuple2!15583 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5957 thiss!1427)) (tuple2!15583 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5957 thiss!1427))))))))

(declare-fun lt!454719 () List!21816)

(assert (=> d!123913 (= lt!454717 (ListLongMap!13700 lt!454719))))

(declare-fun lt!454718 () Unit!33642)

(declare-fun lt!454716 () Unit!33642)

(assert (=> d!123913 (= lt!454718 lt!454716)))

(assert (=> d!123913 (= (getValueByKey!583 lt!454719 (_1!7802 (ite (or c!104480 c!104479) (tuple2!15583 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5957 thiss!1427)) (tuple2!15583 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5957 thiss!1427))))) (Some!633 (_2!7802 (ite (or c!104480 c!104479) (tuple2!15583 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5957 thiss!1427)) (tuple2!15583 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5957 thiss!1427))))))))

(assert (=> d!123913 (= lt!454716 (lemmaContainsTupThenGetReturnValue!279 lt!454719 (_1!7802 (ite (or c!104480 c!104479) (tuple2!15583 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5957 thiss!1427)) (tuple2!15583 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5957 thiss!1427)))) (_2!7802 (ite (or c!104480 c!104479) (tuple2!15583 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5957 thiss!1427)) (tuple2!15583 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5957 thiss!1427))))))))

(assert (=> d!123913 (= lt!454719 (insertStrictlySorted!372 (toList!6865 (ite c!104480 call!43582 (ite c!104479 call!43580 call!43579))) (_1!7802 (ite (or c!104480 c!104479) (tuple2!15583 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5957 thiss!1427)) (tuple2!15583 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5957 thiss!1427)))) (_2!7802 (ite (or c!104480 c!104479) (tuple2!15583 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5957 thiss!1427)) (tuple2!15583 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5957 thiss!1427))))))))

(assert (=> d!123913 (= (+!3124 (ite c!104480 call!43582 (ite c!104479 call!43580 call!43579)) (ite (or c!104480 c!104479) (tuple2!15583 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5957 thiss!1427)) (tuple2!15583 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5957 thiss!1427)))) lt!454717)))

(declare-fun b!1031295 () Bool)

(declare-fun res!689365 () Bool)

(assert (=> b!1031295 (=> (not res!689365) (not e!582415))))

(assert (=> b!1031295 (= res!689365 (= (getValueByKey!583 (toList!6865 lt!454717) (_1!7802 (ite (or c!104480 c!104479) (tuple2!15583 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5957 thiss!1427)) (tuple2!15583 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5957 thiss!1427))))) (Some!633 (_2!7802 (ite (or c!104480 c!104479) (tuple2!15583 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5957 thiss!1427)) (tuple2!15583 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5957 thiss!1427)))))))))

(declare-fun b!1031296 () Bool)

(assert (=> b!1031296 (= e!582415 (contains!6002 (toList!6865 lt!454717) (ite (or c!104480 c!104479) (tuple2!15583 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5957 thiss!1427)) (tuple2!15583 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5957 thiss!1427)))))))

(assert (= (and d!123913 res!689366) b!1031295))

(assert (= (and b!1031295 res!689365) b!1031296))

(declare-fun m!951119 () Bool)

(assert (=> d!123913 m!951119))

(declare-fun m!951121 () Bool)

(assert (=> d!123913 m!951121))

(declare-fun m!951123 () Bool)

(assert (=> d!123913 m!951123))

(declare-fun m!951125 () Bool)

(assert (=> d!123913 m!951125))

(declare-fun m!951127 () Bool)

(assert (=> b!1031295 m!951127))

(declare-fun m!951129 () Bool)

(assert (=> b!1031296 m!951129))

(assert (=> bm!43579 d!123913))

(declare-fun d!123915 () Bool)

(declare-fun res!689367 () Bool)

(declare-fun e!582416 () Bool)

(assert (=> d!123915 (=> res!689367 e!582416)))

(assert (=> d!123915 (= res!689367 (= (select (arr!31171 lt!454491) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) key!909))))

(assert (=> d!123915 (= (arrayContainsKey!0 lt!454491 key!909 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!582416)))

(declare-fun b!1031297 () Bool)

(declare-fun e!582417 () Bool)

(assert (=> b!1031297 (= e!582416 e!582417)))

(declare-fun res!689368 () Bool)

(assert (=> b!1031297 (=> (not res!689368) (not e!582417))))

(assert (=> b!1031297 (= res!689368 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!31688 lt!454491)))))

(declare-fun b!1031298 () Bool)

(assert (=> b!1031298 (= e!582417 (arrayContainsKey!0 lt!454491 key!909 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!123915 (not res!689367)) b!1031297))

(assert (= (and b!1031297 res!689368) b!1031298))

(assert (=> d!123915 m!951093))

(declare-fun m!951131 () Bool)

(assert (=> b!1031298 m!951131))

(assert (=> b!1031211 d!123915))

(declare-fun bm!43598 () Bool)

(declare-fun call!43601 () Bool)

(declare-fun c!104517 () Bool)

(assert (=> bm!43598 (= call!43601 (arrayNoDuplicates!0 (_keys!11325 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!104517 (Cons!21813 (select (arr!31171 (_keys!11325 thiss!1427)) #b00000000000000000000000000000000) Nil!21814) Nil!21814)))))

(declare-fun b!1031299 () Bool)

(declare-fun e!582418 () Bool)

(declare-fun e!582419 () Bool)

(assert (=> b!1031299 (= e!582418 e!582419)))

(assert (=> b!1031299 (= c!104517 (validKeyInArray!0 (select (arr!31171 (_keys!11325 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1031300 () Bool)

(declare-fun e!582420 () Bool)

(assert (=> b!1031300 (= e!582420 (contains!6001 Nil!21814 (select (arr!31171 (_keys!11325 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1031301 () Bool)

(assert (=> b!1031301 (= e!582419 call!43601)))

(declare-fun d!123917 () Bool)

(declare-fun res!689370 () Bool)

(declare-fun e!582421 () Bool)

(assert (=> d!123917 (=> res!689370 e!582421)))

(assert (=> d!123917 (= res!689370 (bvsge #b00000000000000000000000000000000 (size!31688 (_keys!11325 thiss!1427))))))

(assert (=> d!123917 (= (arrayNoDuplicates!0 (_keys!11325 thiss!1427) #b00000000000000000000000000000000 Nil!21814) e!582421)))

(declare-fun b!1031302 () Bool)

(assert (=> b!1031302 (= e!582421 e!582418)))

(declare-fun res!689371 () Bool)

(assert (=> b!1031302 (=> (not res!689371) (not e!582418))))

(assert (=> b!1031302 (= res!689371 (not e!582420))))

(declare-fun res!689369 () Bool)

(assert (=> b!1031302 (=> (not res!689369) (not e!582420))))

(assert (=> b!1031302 (= res!689369 (validKeyInArray!0 (select (arr!31171 (_keys!11325 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1031303 () Bool)

(assert (=> b!1031303 (= e!582419 call!43601)))

(assert (= (and d!123917 (not res!689370)) b!1031302))

(assert (= (and b!1031302 res!689369) b!1031300))

(assert (= (and b!1031302 res!689371) b!1031299))

(assert (= (and b!1031299 c!104517) b!1031301))

(assert (= (and b!1031299 (not c!104517)) b!1031303))

(assert (= (or b!1031301 b!1031303) bm!43598))

(assert (=> bm!43598 m!950893))

(declare-fun m!951133 () Bool)

(assert (=> bm!43598 m!951133))

(assert (=> b!1031299 m!950893))

(assert (=> b!1031299 m!950893))

(assert (=> b!1031299 m!950929))

(assert (=> b!1031300 m!950893))

(assert (=> b!1031300 m!950893))

(declare-fun m!951135 () Bool)

(assert (=> b!1031300 m!951135))

(assert (=> b!1031302 m!950893))

(assert (=> b!1031302 m!950893))

(assert (=> b!1031302 m!950929))

(assert (=> b!1031076 d!123917))

(declare-fun b!1031328 () Bool)

(declare-fun e!582439 () ListLongMap!13699)

(declare-fun call!43604 () ListLongMap!13699)

(assert (=> b!1031328 (= e!582439 call!43604)))

(declare-fun b!1031329 () Bool)

(declare-fun e!582436 () Bool)

(declare-fun e!582440 () Bool)

(assert (=> b!1031329 (= e!582436 e!582440)))

(assert (=> b!1031329 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31688 lt!454491)))))

(declare-fun res!689382 () Bool)

(declare-fun lt!454734 () ListLongMap!13699)

(assert (=> b!1031329 (= res!689382 (contains!6000 lt!454734 (select (arr!31171 lt!454491) #b00000000000000000000000000000000)))))

(assert (=> b!1031329 (=> (not res!689382) (not e!582440))))

(declare-fun b!1031330 () Bool)

(declare-fun e!582437 () ListLongMap!13699)

(assert (=> b!1031330 (= e!582437 e!582439)))

(declare-fun c!104528 () Bool)

(assert (=> b!1031330 (= c!104528 (validKeyInArray!0 (select (arr!31171 lt!454491) #b00000000000000000000000000000000)))))

(declare-fun b!1031331 () Bool)

(assert (=> b!1031331 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31688 lt!454491)))))

(assert (=> b!1031331 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31689 lt!454494)))))

(assert (=> b!1031331 (= e!582440 (= (apply!913 lt!454734 (select (arr!31171 lt!454491) #b00000000000000000000000000000000)) (get!16391 (select (arr!31172 lt!454494) #b00000000000000000000000000000000) (dynLambda!1982 (defaultEntry!6121 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1031332 () Bool)

(declare-fun e!582442 () Bool)

(assert (=> b!1031332 (= e!582442 (= lt!454734 (getCurrentListMapNoExtraKeys!3564 lt!454491 lt!454494 (mask!29944 thiss!1427) (extraKeys!5853 thiss!1427) (zeroValue!5957 thiss!1427) (minValue!5957 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!6121 thiss!1427))))))

(declare-fun d!123919 () Bool)

(declare-fun e!582438 () Bool)

(assert (=> d!123919 e!582438))

(declare-fun res!689381 () Bool)

(assert (=> d!123919 (=> (not res!689381) (not e!582438))))

(assert (=> d!123919 (= res!689381 (not (contains!6000 lt!454734 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!123919 (= lt!454734 e!582437)))

(declare-fun c!104529 () Bool)

(assert (=> d!123919 (= c!104529 (bvsge #b00000000000000000000000000000000 (size!31688 lt!454491)))))

(assert (=> d!123919 (validMask!0 (mask!29944 thiss!1427))))

(assert (=> d!123919 (= (getCurrentListMapNoExtraKeys!3564 lt!454491 lt!454494 (mask!29944 thiss!1427) (extraKeys!5853 thiss!1427) (zeroValue!5957 thiss!1427) (minValue!5957 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6121 thiss!1427)) lt!454734)))

(declare-fun b!1031333 () Bool)

(declare-fun res!689380 () Bool)

(assert (=> b!1031333 (=> (not res!689380) (not e!582438))))

(assert (=> b!1031333 (= res!689380 (not (contains!6000 lt!454734 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bm!43601 () Bool)

(assert (=> bm!43601 (= call!43604 (getCurrentListMapNoExtraKeys!3564 lt!454491 lt!454494 (mask!29944 thiss!1427) (extraKeys!5853 thiss!1427) (zeroValue!5957 thiss!1427) (minValue!5957 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!6121 thiss!1427)))))

(declare-fun b!1031334 () Bool)

(assert (=> b!1031334 (= e!582438 e!582436)))

(declare-fun c!104526 () Bool)

(declare-fun e!582441 () Bool)

(assert (=> b!1031334 (= c!104526 e!582441)))

(declare-fun res!689383 () Bool)

(assert (=> b!1031334 (=> (not res!689383) (not e!582441))))

(assert (=> b!1031334 (= res!689383 (bvslt #b00000000000000000000000000000000 (size!31688 lt!454491)))))

(declare-fun b!1031335 () Bool)

(assert (=> b!1031335 (= e!582437 (ListLongMap!13700 Nil!21813))))

(declare-fun b!1031336 () Bool)

(assert (=> b!1031336 (= e!582441 (validKeyInArray!0 (select (arr!31171 lt!454491) #b00000000000000000000000000000000)))))

(assert (=> b!1031336 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1031337 () Bool)

(assert (=> b!1031337 (= e!582436 e!582442)))

(declare-fun c!104527 () Bool)

(assert (=> b!1031337 (= c!104527 (bvslt #b00000000000000000000000000000000 (size!31688 lt!454491)))))

(declare-fun b!1031338 () Bool)

(declare-fun isEmpty!929 (ListLongMap!13699) Bool)

(assert (=> b!1031338 (= e!582442 (isEmpty!929 lt!454734))))

(declare-fun b!1031339 () Bool)

(declare-fun lt!454736 () Unit!33642)

(declare-fun lt!454738 () Unit!33642)

(assert (=> b!1031339 (= lt!454736 lt!454738)))

(declare-fun lt!454735 () ListLongMap!13699)

(declare-fun lt!454737 () V!37299)

(declare-fun lt!454740 () (_ BitVec 64))

(declare-fun lt!454739 () (_ BitVec 64))

(assert (=> b!1031339 (not (contains!6000 (+!3124 lt!454735 (tuple2!15583 lt!454739 lt!454737)) lt!454740))))

(declare-fun addStillNotContains!243 (ListLongMap!13699 (_ BitVec 64) V!37299 (_ BitVec 64)) Unit!33642)

(assert (=> b!1031339 (= lt!454738 (addStillNotContains!243 lt!454735 lt!454739 lt!454737 lt!454740))))

(assert (=> b!1031339 (= lt!454740 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1031339 (= lt!454737 (get!16391 (select (arr!31172 lt!454494) #b00000000000000000000000000000000) (dynLambda!1982 (defaultEntry!6121 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1031339 (= lt!454739 (select (arr!31171 lt!454491) #b00000000000000000000000000000000))))

(assert (=> b!1031339 (= lt!454735 call!43604)))

(assert (=> b!1031339 (= e!582439 (+!3124 call!43604 (tuple2!15583 (select (arr!31171 lt!454491) #b00000000000000000000000000000000) (get!16391 (select (arr!31172 lt!454494) #b00000000000000000000000000000000) (dynLambda!1982 (defaultEntry!6121 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!123919 c!104529) b!1031335))

(assert (= (and d!123919 (not c!104529)) b!1031330))

(assert (= (and b!1031330 c!104528) b!1031339))

(assert (= (and b!1031330 (not c!104528)) b!1031328))

(assert (= (or b!1031339 b!1031328) bm!43601))

(assert (= (and d!123919 res!689381) b!1031333))

(assert (= (and b!1031333 res!689380) b!1031334))

(assert (= (and b!1031334 res!689383) b!1031336))

(assert (= (and b!1031334 c!104526) b!1031329))

(assert (= (and b!1031334 (not c!104526)) b!1031337))

(assert (= (and b!1031329 res!689382) b!1031331))

(assert (= (and b!1031337 c!104527) b!1031332))

(assert (= (and b!1031337 (not c!104527)) b!1031338))

(declare-fun b_lambda!15921 () Bool)

(assert (=> (not b_lambda!15921) (not b!1031331)))

(assert (=> b!1031331 t!30901))

(declare-fun b_and!32969 () Bool)

(assert (= b_and!32967 (and (=> t!30901 result!14151) b_and!32969)))

(declare-fun b_lambda!15923 () Bool)

(assert (=> (not b_lambda!15923) (not b!1031339)))

(assert (=> b!1031339 t!30901))

(declare-fun b_and!32971 () Bool)

(assert (= b_and!32969 (and (=> t!30901 result!14151) b_and!32971)))

(declare-fun m!951137 () Bool)

(assert (=> d!123919 m!951137))

(assert (=> d!123919 m!950939))

(assert (=> b!1031329 m!950877))

(assert (=> b!1031329 m!950877))

(declare-fun m!951139 () Bool)

(assert (=> b!1031329 m!951139))

(assert (=> b!1031330 m!950877))

(assert (=> b!1031330 m!950877))

(assert (=> b!1031330 m!950885))

(assert (=> b!1031336 m!950877))

(assert (=> b!1031336 m!950877))

(assert (=> b!1031336 m!950885))

(declare-fun m!951141 () Bool)

(assert (=> b!1031333 m!951141))

(declare-fun m!951143 () Bool)

(assert (=> bm!43601 m!951143))

(assert (=> b!1031331 m!950877))

(declare-fun m!951145 () Bool)

(assert (=> b!1031331 m!951145))

(assert (=> b!1031331 m!950781))

(assert (=> b!1031331 m!950877))

(assert (=> b!1031331 m!950957))

(assert (=> b!1031331 m!950957))

(assert (=> b!1031331 m!950781))

(assert (=> b!1031331 m!950959))

(declare-fun m!951147 () Bool)

(assert (=> b!1031339 m!951147))

(declare-fun m!951149 () Bool)

(assert (=> b!1031339 m!951149))

(assert (=> b!1031339 m!950781))

(assert (=> b!1031339 m!951147))

(declare-fun m!951151 () Bool)

(assert (=> b!1031339 m!951151))

(assert (=> b!1031339 m!950877))

(assert (=> b!1031339 m!950957))

(declare-fun m!951153 () Bool)

(assert (=> b!1031339 m!951153))

(assert (=> b!1031339 m!950957))

(assert (=> b!1031339 m!950781))

(assert (=> b!1031339 m!950959))

(declare-fun m!951155 () Bool)

(assert (=> b!1031338 m!951155))

(assert (=> b!1031332 m!951143))

(assert (=> bm!43583 d!123919))

(declare-fun b!1031340 () Bool)

(declare-fun e!582443 () (_ BitVec 32))

(declare-fun call!43605 () (_ BitVec 32))

(assert (=> b!1031340 (= e!582443 call!43605)))

(declare-fun b!1031341 () Bool)

(declare-fun e!582444 () (_ BitVec 32))

(assert (=> b!1031341 (= e!582444 #b00000000000000000000000000000000)))

(declare-fun b!1031342 () Bool)

(assert (=> b!1031342 (= e!582444 e!582443)))

(declare-fun c!104530 () Bool)

(assert (=> b!1031342 (= c!104530 (validKeyInArray!0 (select (arr!31171 (array!64748 (store (arr!31171 (_keys!11325 thiss!1427)) (index!40936 lt!454488) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31688 (_keys!11325 thiss!1427)))) #b00000000000000000000000000000000)))))

(declare-fun d!123921 () Bool)

(declare-fun lt!454741 () (_ BitVec 32))

(assert (=> d!123921 (and (bvsge lt!454741 #b00000000000000000000000000000000) (bvsle lt!454741 (bvsub (size!31688 (array!64748 (store (arr!31171 (_keys!11325 thiss!1427)) (index!40936 lt!454488) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31688 (_keys!11325 thiss!1427)))) #b00000000000000000000000000000000)))))

(assert (=> d!123921 (= lt!454741 e!582444)))

(declare-fun c!104531 () Bool)

(assert (=> d!123921 (= c!104531 (bvsge #b00000000000000000000000000000000 (size!31688 (_keys!11325 thiss!1427))))))

(assert (=> d!123921 (and (bvsle #b00000000000000000000000000000000 (size!31688 (_keys!11325 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!31688 (_keys!11325 thiss!1427)) (size!31688 (array!64748 (store (arr!31171 (_keys!11325 thiss!1427)) (index!40936 lt!454488) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31688 (_keys!11325 thiss!1427))))))))

(assert (=> d!123921 (= (arrayCountValidKeys!0 (array!64748 (store (arr!31171 (_keys!11325 thiss!1427)) (index!40936 lt!454488) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31688 (_keys!11325 thiss!1427))) #b00000000000000000000000000000000 (size!31688 (_keys!11325 thiss!1427))) lt!454741)))

(declare-fun b!1031343 () Bool)

(assert (=> b!1031343 (= e!582443 (bvadd #b00000000000000000000000000000001 call!43605))))

(declare-fun bm!43602 () Bool)

(assert (=> bm!43602 (= call!43605 (arrayCountValidKeys!0 (array!64748 (store (arr!31171 (_keys!11325 thiss!1427)) (index!40936 lt!454488) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31688 (_keys!11325 thiss!1427))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31688 (_keys!11325 thiss!1427))))))

(assert (= (and d!123921 c!104531) b!1031341))

(assert (= (and d!123921 (not c!104531)) b!1031342))

(assert (= (and b!1031342 c!104530) b!1031343))

(assert (= (and b!1031342 (not c!104530)) b!1031340))

(assert (= (or b!1031343 b!1031340) bm!43602))

(assert (=> b!1031342 m!951071))

(assert (=> b!1031342 m!951071))

(assert (=> b!1031342 m!951075))

(declare-fun m!951157 () Bool)

(assert (=> bm!43602 m!951157))

(assert (=> b!1031163 d!123921))

(assert (=> b!1031163 d!123881))

(assert (=> b!1031086 d!123897))

(declare-fun b!1031362 () Bool)

(declare-fun lt!454746 () SeekEntryResult!9641)

(assert (=> b!1031362 (and (bvsge (index!40937 lt!454746) #b00000000000000000000000000000000) (bvslt (index!40937 lt!454746) (size!31688 (_keys!11325 thiss!1427))))))

(declare-fun e!582455 () Bool)

(assert (=> b!1031362 (= e!582455 (= (select (arr!31171 (_keys!11325 thiss!1427)) (index!40937 lt!454746)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1031363 () Bool)

(declare-fun e!582457 () SeekEntryResult!9641)

(assert (=> b!1031363 (= e!582457 (Intermediate!9641 false (toIndex!0 key!909 (mask!29944 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun b!1031364 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1031364 (= e!582457 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!909 (mask!29944 thiss!1427)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (mask!29944 thiss!1427)) key!909 (_keys!11325 thiss!1427) (mask!29944 thiss!1427)))))

(declare-fun b!1031365 () Bool)

(assert (=> b!1031365 (and (bvsge (index!40937 lt!454746) #b00000000000000000000000000000000) (bvslt (index!40937 lt!454746) (size!31688 (_keys!11325 thiss!1427))))))

(declare-fun res!689391 () Bool)

(assert (=> b!1031365 (= res!689391 (= (select (arr!31171 (_keys!11325 thiss!1427)) (index!40937 lt!454746)) key!909))))

(assert (=> b!1031365 (=> res!689391 e!582455)))

(declare-fun e!582459 () Bool)

(assert (=> b!1031365 (= e!582459 e!582455)))

(declare-fun b!1031366 () Bool)

(declare-fun e!582458 () Bool)

(assert (=> b!1031366 (= e!582458 e!582459)))

(declare-fun res!689392 () Bool)

(assert (=> b!1031366 (= res!689392 (and ((_ is Intermediate!9641) lt!454746) (not (undefined!10453 lt!454746)) (bvslt (x!91611 lt!454746) #b01111111111111111111111111111110) (bvsge (x!91611 lt!454746) #b00000000000000000000000000000000) (bvsge (x!91611 lt!454746) #b00000000000000000000000000000000)))))

(assert (=> b!1031366 (=> (not res!689392) (not e!582459))))

(declare-fun b!1031367 () Bool)

(declare-fun e!582456 () SeekEntryResult!9641)

(assert (=> b!1031367 (= e!582456 (Intermediate!9641 true (toIndex!0 key!909 (mask!29944 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun b!1031368 () Bool)

(assert (=> b!1031368 (and (bvsge (index!40937 lt!454746) #b00000000000000000000000000000000) (bvslt (index!40937 lt!454746) (size!31688 (_keys!11325 thiss!1427))))))

(declare-fun res!689390 () Bool)

(assert (=> b!1031368 (= res!689390 (= (select (arr!31171 (_keys!11325 thiss!1427)) (index!40937 lt!454746)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1031368 (=> res!689390 e!582455)))

(declare-fun b!1031369 () Bool)

(assert (=> b!1031369 (= e!582456 e!582457)))

(declare-fun c!104538 () Bool)

(declare-fun lt!454747 () (_ BitVec 64))

(assert (=> b!1031369 (= c!104538 (or (= lt!454747 key!909) (= (bvadd lt!454747 lt!454747) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!123923 () Bool)

(assert (=> d!123923 e!582458))

(declare-fun c!104539 () Bool)

(assert (=> d!123923 (= c!104539 (and ((_ is Intermediate!9641) lt!454746) (undefined!10453 lt!454746)))))

(assert (=> d!123923 (= lt!454746 e!582456)))

(declare-fun c!104540 () Bool)

(assert (=> d!123923 (= c!104540 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!123923 (= lt!454747 (select (arr!31171 (_keys!11325 thiss!1427)) (toIndex!0 key!909 (mask!29944 thiss!1427))))))

(assert (=> d!123923 (validMask!0 (mask!29944 thiss!1427))))

(assert (=> d!123923 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!909 (mask!29944 thiss!1427)) key!909 (_keys!11325 thiss!1427) (mask!29944 thiss!1427)) lt!454746)))

(declare-fun b!1031370 () Bool)

(assert (=> b!1031370 (= e!582458 (bvsge (x!91611 lt!454746) #b01111111111111111111111111111110))))

(assert (= (and d!123923 c!104540) b!1031367))

(assert (= (and d!123923 (not c!104540)) b!1031369))

(assert (= (and b!1031369 c!104538) b!1031363))

(assert (= (and b!1031369 (not c!104538)) b!1031364))

(assert (= (and d!123923 c!104539) b!1031370))

(assert (= (and d!123923 (not c!104539)) b!1031366))

(assert (= (and b!1031366 res!689392) b!1031365))

(assert (= (and b!1031365 (not res!689391)) b!1031368))

(assert (= (and b!1031368 (not res!689390)) b!1031362))

(assert (=> b!1031364 m!951043))

(declare-fun m!951159 () Bool)

(assert (=> b!1031364 m!951159))

(assert (=> b!1031364 m!951159))

(declare-fun m!951161 () Bool)

(assert (=> b!1031364 m!951161))

(assert (=> d!123923 m!951043))

(declare-fun m!951163 () Bool)

(assert (=> d!123923 m!951163))

(assert (=> d!123923 m!950939))

(declare-fun m!951165 () Bool)

(assert (=> b!1031362 m!951165))

(assert (=> b!1031365 m!951165))

(assert (=> b!1031368 m!951165))

(assert (=> d!123885 d!123923))

(declare-fun d!123925 () Bool)

(declare-fun lt!454753 () (_ BitVec 32))

(declare-fun lt!454752 () (_ BitVec 32))

(assert (=> d!123925 (= lt!454753 (bvmul (bvxor lt!454752 (bvlshr lt!454752 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!123925 (= lt!454752 ((_ extract 31 0) (bvand (bvxor key!909 (bvlshr key!909 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!123925 (and (bvsge (mask!29944 thiss!1427) #b00000000000000000000000000000000) (let ((res!689393 (let ((h!23024 ((_ extract 31 0) (bvand (bvxor key!909 (bvlshr key!909 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!91644 (bvmul (bvxor h!23024 (bvlshr h!23024 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!91644 (bvlshr x!91644 #b00000000000000000000000000001101)) (mask!29944 thiss!1427)))))) (and (bvslt res!689393 (bvadd (mask!29944 thiss!1427) #b00000000000000000000000000000001)) (bvsge res!689393 #b00000000000000000000000000000000))))))

(assert (=> d!123925 (= (toIndex!0 key!909 (mask!29944 thiss!1427)) (bvand (bvxor lt!454753 (bvlshr lt!454753 #b00000000000000000000000000001101)) (mask!29944 thiss!1427)))))

(assert (=> d!123885 d!123925))

(declare-fun d!123927 () Bool)

(assert (=> d!123927 (= (validMask!0 (mask!29944 thiss!1427)) (and (or (= (mask!29944 thiss!1427) #b00000000000000000000000000000111) (= (mask!29944 thiss!1427) #b00000000000000000000000000001111) (= (mask!29944 thiss!1427) #b00000000000000000000000000011111) (= (mask!29944 thiss!1427) #b00000000000000000000000000111111) (= (mask!29944 thiss!1427) #b00000000000000000000000001111111) (= (mask!29944 thiss!1427) #b00000000000000000000000011111111) (= (mask!29944 thiss!1427) #b00000000000000000000000111111111) (= (mask!29944 thiss!1427) #b00000000000000000000001111111111) (= (mask!29944 thiss!1427) #b00000000000000000000011111111111) (= (mask!29944 thiss!1427) #b00000000000000000000111111111111) (= (mask!29944 thiss!1427) #b00000000000000000001111111111111) (= (mask!29944 thiss!1427) #b00000000000000000011111111111111) (= (mask!29944 thiss!1427) #b00000000000000000111111111111111) (= (mask!29944 thiss!1427) #b00000000000000001111111111111111) (= (mask!29944 thiss!1427) #b00000000000000011111111111111111) (= (mask!29944 thiss!1427) #b00000000000000111111111111111111) (= (mask!29944 thiss!1427) #b00000000000001111111111111111111) (= (mask!29944 thiss!1427) #b00000000000011111111111111111111) (= (mask!29944 thiss!1427) #b00000000000111111111111111111111) (= (mask!29944 thiss!1427) #b00000000001111111111111111111111) (= (mask!29944 thiss!1427) #b00000000011111111111111111111111) (= (mask!29944 thiss!1427) #b00000000111111111111111111111111) (= (mask!29944 thiss!1427) #b00000001111111111111111111111111) (= (mask!29944 thiss!1427) #b00000011111111111111111111111111) (= (mask!29944 thiss!1427) #b00000111111111111111111111111111) (= (mask!29944 thiss!1427) #b00001111111111111111111111111111) (= (mask!29944 thiss!1427) #b00011111111111111111111111111111) (= (mask!29944 thiss!1427) #b00111111111111111111111111111111)) (bvsle (mask!29944 thiss!1427) #b00111111111111111111111111111111)))))

(assert (=> d!123885 d!123927))

(declare-fun d!123929 () Bool)

(assert (=> d!123929 (not (arrayContainsKey!0 (array!64748 (store (arr!31171 (_keys!11325 thiss!1427)) (index!40936 lt!454488) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31688 (_keys!11325 thiss!1427))) key!909 #b00000000000000000000000000000000))))

(assert (=> d!123929 true))

(declare-fun _$59!20 () Unit!33642)

(assert (=> d!123929 (= (choose!121 (_keys!11325 thiss!1427) (index!40936 lt!454488) key!909) _$59!20)))

(declare-fun bs!30108 () Bool)

(assert (= bs!30108 d!123929))

(assert (=> bs!30108 m!950779))

(assert (=> bs!30108 m!951015))

(assert (=> d!123869 d!123929))

(declare-fun d!123931 () Bool)

(assert (=> d!123931 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!64748 (store (arr!31171 (_keys!11325 thiss!1427)) (index!40936 lt!454488) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31688 (_keys!11325 thiss!1427))) (mask!29944 thiss!1427))))

(assert (=> d!123931 true))

(declare-fun _$44!18 () Unit!33642)

(assert (=> d!123931 (= (choose!25 (_keys!11325 thiss!1427) (index!40936 lt!454488) (mask!29944 thiss!1427)) _$44!18)))

(declare-fun bs!30109 () Bool)

(assert (= bs!30109 d!123931))

(assert (=> bs!30109 m!950779))

(assert (=> bs!30109 m!951021))

(assert (=> d!123873 d!123931))

(assert (=> d!123873 d!123927))

(assert (=> d!123865 d!123927))

(assert (=> d!123859 d!123927))

(declare-fun d!123933 () Bool)

(assert (=> d!123933 (= (apply!913 lt!454633 (select (arr!31171 lt!454491) #b00000000000000000000000000000000)) (get!16392 (getValueByKey!583 (toList!6865 lt!454633) (select (arr!31171 lt!454491) #b00000000000000000000000000000000))))))

(declare-fun bs!30110 () Bool)

(assert (= bs!30110 d!123933))

(assert (=> bs!30110 m!950877))

(declare-fun m!951167 () Bool)

(assert (=> bs!30110 m!951167))

(assert (=> bs!30110 m!951167))

(declare-fun m!951169 () Bool)

(assert (=> bs!30110 m!951169))

(assert (=> b!1031167 d!123933))

(declare-fun d!123935 () Bool)

(declare-fun c!104543 () Bool)

(assert (=> d!123935 (= c!104543 ((_ is ValueCellFull!11456) (select (arr!31172 lt!454494) #b00000000000000000000000000000000)))))

(declare-fun e!582462 () V!37299)

(assert (=> d!123935 (= (get!16391 (select (arr!31172 lt!454494) #b00000000000000000000000000000000) (dynLambda!1982 (defaultEntry!6121 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)) e!582462)))

(declare-fun b!1031375 () Bool)

(declare-fun get!16393 (ValueCell!11456 V!37299) V!37299)

(assert (=> b!1031375 (= e!582462 (get!16393 (select (arr!31172 lt!454494) #b00000000000000000000000000000000) (dynLambda!1982 (defaultEntry!6121 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1031376 () Bool)

(declare-fun get!16394 (ValueCell!11456 V!37299) V!37299)

(assert (=> b!1031376 (= e!582462 (get!16394 (select (arr!31172 lt!454494) #b00000000000000000000000000000000) (dynLambda!1982 (defaultEntry!6121 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!123935 c!104543) b!1031375))

(assert (= (and d!123935 (not c!104543)) b!1031376))

(assert (=> b!1031375 m!950957))

(assert (=> b!1031375 m!950781))

(declare-fun m!951171 () Bool)

(assert (=> b!1031375 m!951171))

(assert (=> b!1031376 m!950957))

(assert (=> b!1031376 m!950781))

(declare-fun m!951173 () Bool)

(assert (=> b!1031376 m!951173))

(assert (=> b!1031167 d!123935))

(declare-fun d!123937 () Bool)

(assert (=> d!123937 (= (apply!913 (+!3124 lt!454642 (tuple2!15583 lt!454630 (minValue!5957 thiss!1427))) lt!454628) (apply!913 lt!454642 lt!454628))))

(declare-fun lt!454756 () Unit!33642)

(declare-fun choose!1697 (ListLongMap!13699 (_ BitVec 64) V!37299 (_ BitVec 64)) Unit!33642)

(assert (=> d!123937 (= lt!454756 (choose!1697 lt!454642 lt!454630 (minValue!5957 thiss!1427) lt!454628))))

(declare-fun e!582465 () Bool)

(assert (=> d!123937 e!582465))

(declare-fun res!689396 () Bool)

(assert (=> d!123937 (=> (not res!689396) (not e!582465))))

(assert (=> d!123937 (= res!689396 (contains!6000 lt!454642 lt!454628))))

(assert (=> d!123937 (= (addApplyDifferent!479 lt!454642 lt!454630 (minValue!5957 thiss!1427) lt!454628) lt!454756)))

(declare-fun b!1031380 () Bool)

(assert (=> b!1031380 (= e!582465 (not (= lt!454628 lt!454630)))))

(assert (= (and d!123937 res!689396) b!1031380))

(assert (=> d!123937 m!950967))

(declare-fun m!951175 () Bool)

(assert (=> d!123937 m!951175))

(assert (=> d!123937 m!950967))

(assert (=> d!123937 m!950969))

(assert (=> d!123937 m!950993))

(declare-fun m!951177 () Bool)

(assert (=> d!123937 m!951177))

(assert (=> b!1031178 d!123937))

(declare-fun d!123939 () Bool)

(assert (=> d!123939 (= (apply!913 lt!454631 lt!454638) (get!16392 (getValueByKey!583 (toList!6865 lt!454631) lt!454638)))))

(declare-fun bs!30111 () Bool)

(assert (= bs!30111 d!123939))

(declare-fun m!951179 () Bool)

(assert (=> bs!30111 m!951179))

(assert (=> bs!30111 m!951179))

(declare-fun m!951181 () Bool)

(assert (=> bs!30111 m!951181))

(assert (=> b!1031178 d!123939))

(declare-fun d!123941 () Bool)

(assert (=> d!123941 (contains!6000 (+!3124 lt!454629 (tuple2!15583 lt!454640 (zeroValue!5957 thiss!1427))) lt!454643)))

(declare-fun lt!454759 () Unit!33642)

(declare-fun choose!1698 (ListLongMap!13699 (_ BitVec 64) V!37299 (_ BitVec 64)) Unit!33642)

(assert (=> d!123941 (= lt!454759 (choose!1698 lt!454629 lt!454640 (zeroValue!5957 thiss!1427) lt!454643))))

(assert (=> d!123941 (contains!6000 lt!454629 lt!454643)))

(assert (=> d!123941 (= (addStillContains!623 lt!454629 lt!454640 (zeroValue!5957 thiss!1427) lt!454643) lt!454759)))

(declare-fun bs!30112 () Bool)

(assert (= bs!30112 d!123941))

(assert (=> bs!30112 m!950965))

(assert (=> bs!30112 m!950965))

(assert (=> bs!30112 m!950971))

(declare-fun m!951183 () Bool)

(assert (=> bs!30112 m!951183))

(declare-fun m!951185 () Bool)

(assert (=> bs!30112 m!951185))

(assert (=> b!1031178 d!123941))

(declare-fun d!123943 () Bool)

(assert (=> d!123943 (= (apply!913 (+!3124 lt!454647 (tuple2!15583 lt!454637 (minValue!5957 thiss!1427))) lt!454634) (get!16392 (getValueByKey!583 (toList!6865 (+!3124 lt!454647 (tuple2!15583 lt!454637 (minValue!5957 thiss!1427)))) lt!454634)))))

(declare-fun bs!30113 () Bool)

(assert (= bs!30113 d!123943))

(declare-fun m!951187 () Bool)

(assert (=> bs!30113 m!951187))

(assert (=> bs!30113 m!951187))

(declare-fun m!951189 () Bool)

(assert (=> bs!30113 m!951189))

(assert (=> b!1031178 d!123943))

(declare-fun d!123945 () Bool)

(declare-fun e!582466 () Bool)

(assert (=> d!123945 e!582466))

(declare-fun res!689398 () Bool)

(assert (=> d!123945 (=> (not res!689398) (not e!582466))))

(declare-fun lt!454761 () ListLongMap!13699)

(assert (=> d!123945 (= res!689398 (contains!6000 lt!454761 (_1!7802 (tuple2!15583 lt!454630 (minValue!5957 thiss!1427)))))))

(declare-fun lt!454763 () List!21816)

(assert (=> d!123945 (= lt!454761 (ListLongMap!13700 lt!454763))))

(declare-fun lt!454762 () Unit!33642)

(declare-fun lt!454760 () Unit!33642)

(assert (=> d!123945 (= lt!454762 lt!454760)))

(assert (=> d!123945 (= (getValueByKey!583 lt!454763 (_1!7802 (tuple2!15583 lt!454630 (minValue!5957 thiss!1427)))) (Some!633 (_2!7802 (tuple2!15583 lt!454630 (minValue!5957 thiss!1427)))))))

(assert (=> d!123945 (= lt!454760 (lemmaContainsTupThenGetReturnValue!279 lt!454763 (_1!7802 (tuple2!15583 lt!454630 (minValue!5957 thiss!1427))) (_2!7802 (tuple2!15583 lt!454630 (minValue!5957 thiss!1427)))))))

(assert (=> d!123945 (= lt!454763 (insertStrictlySorted!372 (toList!6865 lt!454642) (_1!7802 (tuple2!15583 lt!454630 (minValue!5957 thiss!1427))) (_2!7802 (tuple2!15583 lt!454630 (minValue!5957 thiss!1427)))))))

(assert (=> d!123945 (= (+!3124 lt!454642 (tuple2!15583 lt!454630 (minValue!5957 thiss!1427))) lt!454761)))

(declare-fun b!1031382 () Bool)

(declare-fun res!689397 () Bool)

(assert (=> b!1031382 (=> (not res!689397) (not e!582466))))

(assert (=> b!1031382 (= res!689397 (= (getValueByKey!583 (toList!6865 lt!454761) (_1!7802 (tuple2!15583 lt!454630 (minValue!5957 thiss!1427)))) (Some!633 (_2!7802 (tuple2!15583 lt!454630 (minValue!5957 thiss!1427))))))))

(declare-fun b!1031383 () Bool)

(assert (=> b!1031383 (= e!582466 (contains!6002 (toList!6865 lt!454761) (tuple2!15583 lt!454630 (minValue!5957 thiss!1427))))))

(assert (= (and d!123945 res!689398) b!1031382))

(assert (= (and b!1031382 res!689397) b!1031383))

(declare-fun m!951191 () Bool)

(assert (=> d!123945 m!951191))

(declare-fun m!951193 () Bool)

(assert (=> d!123945 m!951193))

(declare-fun m!951195 () Bool)

(assert (=> d!123945 m!951195))

(declare-fun m!951197 () Bool)

(assert (=> d!123945 m!951197))

(declare-fun m!951199 () Bool)

(assert (=> b!1031382 m!951199))

(declare-fun m!951201 () Bool)

(assert (=> b!1031383 m!951201))

(assert (=> b!1031178 d!123945))

(declare-fun d!123947 () Bool)

(assert (=> d!123947 (= (apply!913 (+!3124 lt!454631 (tuple2!15583 lt!454648 (zeroValue!5957 thiss!1427))) lt!454638) (apply!913 lt!454631 lt!454638))))

(declare-fun lt!454764 () Unit!33642)

(assert (=> d!123947 (= lt!454764 (choose!1697 lt!454631 lt!454648 (zeroValue!5957 thiss!1427) lt!454638))))

(declare-fun e!582467 () Bool)

(assert (=> d!123947 e!582467))

(declare-fun res!689399 () Bool)

(assert (=> d!123947 (=> (not res!689399) (not e!582467))))

(assert (=> d!123947 (= res!689399 (contains!6000 lt!454631 lt!454638))))

(assert (=> d!123947 (= (addApplyDifferent!479 lt!454631 lt!454648 (zeroValue!5957 thiss!1427) lt!454638) lt!454764)))

(declare-fun b!1031384 () Bool)

(assert (=> b!1031384 (= e!582467 (not (= lt!454638 lt!454648)))))

(assert (= (and d!123947 res!689399) b!1031384))

(assert (=> d!123947 m!950983))

(declare-fun m!951203 () Bool)

(assert (=> d!123947 m!951203))

(assert (=> d!123947 m!950983))

(assert (=> d!123947 m!950985))

(assert (=> d!123947 m!950979))

(declare-fun m!951205 () Bool)

(assert (=> d!123947 m!951205))

(assert (=> b!1031178 d!123947))

(declare-fun d!123949 () Bool)

(assert (=> d!123949 (= (apply!913 (+!3124 lt!454647 (tuple2!15583 lt!454637 (minValue!5957 thiss!1427))) lt!454634) (apply!913 lt!454647 lt!454634))))

(declare-fun lt!454765 () Unit!33642)

(assert (=> d!123949 (= lt!454765 (choose!1697 lt!454647 lt!454637 (minValue!5957 thiss!1427) lt!454634))))

(declare-fun e!582468 () Bool)

(assert (=> d!123949 e!582468))

(declare-fun res!689400 () Bool)

(assert (=> d!123949 (=> (not res!689400) (not e!582468))))

(assert (=> d!123949 (= res!689400 (contains!6000 lt!454647 lt!454634))))

(assert (=> d!123949 (= (addApplyDifferent!479 lt!454647 lt!454637 (minValue!5957 thiss!1427) lt!454634) lt!454765)))

(declare-fun b!1031385 () Bool)

(assert (=> b!1031385 (= e!582468 (not (= lt!454634 lt!454637)))))

(assert (= (and d!123949 res!689400) b!1031385))

(assert (=> d!123949 m!950973))

(declare-fun m!951207 () Bool)

(assert (=> d!123949 m!951207))

(assert (=> d!123949 m!950973))

(assert (=> d!123949 m!950975))

(assert (=> d!123949 m!950977))

(declare-fun m!951209 () Bool)

(assert (=> d!123949 m!951209))

(assert (=> b!1031178 d!123949))

(assert (=> b!1031178 d!123919))

(declare-fun d!123951 () Bool)

(assert (=> d!123951 (= (apply!913 lt!454647 lt!454634) (get!16392 (getValueByKey!583 (toList!6865 lt!454647) lt!454634)))))

(declare-fun bs!30114 () Bool)

(assert (= bs!30114 d!123951))

(declare-fun m!951211 () Bool)

(assert (=> bs!30114 m!951211))

(assert (=> bs!30114 m!951211))

(declare-fun m!951213 () Bool)

(assert (=> bs!30114 m!951213))

(assert (=> b!1031178 d!123951))

(declare-fun d!123953 () Bool)

(assert (=> d!123953 (= (apply!913 (+!3124 lt!454631 (tuple2!15583 lt!454648 (zeroValue!5957 thiss!1427))) lt!454638) (get!16392 (getValueByKey!583 (toList!6865 (+!3124 lt!454631 (tuple2!15583 lt!454648 (zeroValue!5957 thiss!1427)))) lt!454638)))))

(declare-fun bs!30115 () Bool)

(assert (= bs!30115 d!123953))

(declare-fun m!951215 () Bool)

(assert (=> bs!30115 m!951215))

(assert (=> bs!30115 m!951215))

(declare-fun m!951217 () Bool)

(assert (=> bs!30115 m!951217))

(assert (=> b!1031178 d!123953))

(declare-fun d!123955 () Bool)

(assert (=> d!123955 (= (apply!913 (+!3124 lt!454642 (tuple2!15583 lt!454630 (minValue!5957 thiss!1427))) lt!454628) (get!16392 (getValueByKey!583 (toList!6865 (+!3124 lt!454642 (tuple2!15583 lt!454630 (minValue!5957 thiss!1427)))) lt!454628)))))

(declare-fun bs!30116 () Bool)

(assert (= bs!30116 d!123955))

(declare-fun m!951219 () Bool)

(assert (=> bs!30116 m!951219))

(assert (=> bs!30116 m!951219))

(declare-fun m!951221 () Bool)

(assert (=> bs!30116 m!951221))

(assert (=> b!1031178 d!123955))

(declare-fun d!123957 () Bool)

(declare-fun e!582469 () Bool)

(assert (=> d!123957 e!582469))

(declare-fun res!689402 () Bool)

(assert (=> d!123957 (=> (not res!689402) (not e!582469))))

(declare-fun lt!454767 () ListLongMap!13699)

(assert (=> d!123957 (= res!689402 (contains!6000 lt!454767 (_1!7802 (tuple2!15583 lt!454648 (zeroValue!5957 thiss!1427)))))))

(declare-fun lt!454769 () List!21816)

(assert (=> d!123957 (= lt!454767 (ListLongMap!13700 lt!454769))))

(declare-fun lt!454768 () Unit!33642)

(declare-fun lt!454766 () Unit!33642)

(assert (=> d!123957 (= lt!454768 lt!454766)))

(assert (=> d!123957 (= (getValueByKey!583 lt!454769 (_1!7802 (tuple2!15583 lt!454648 (zeroValue!5957 thiss!1427)))) (Some!633 (_2!7802 (tuple2!15583 lt!454648 (zeroValue!5957 thiss!1427)))))))

(assert (=> d!123957 (= lt!454766 (lemmaContainsTupThenGetReturnValue!279 lt!454769 (_1!7802 (tuple2!15583 lt!454648 (zeroValue!5957 thiss!1427))) (_2!7802 (tuple2!15583 lt!454648 (zeroValue!5957 thiss!1427)))))))

(assert (=> d!123957 (= lt!454769 (insertStrictlySorted!372 (toList!6865 lt!454631) (_1!7802 (tuple2!15583 lt!454648 (zeroValue!5957 thiss!1427))) (_2!7802 (tuple2!15583 lt!454648 (zeroValue!5957 thiss!1427)))))))

(assert (=> d!123957 (= (+!3124 lt!454631 (tuple2!15583 lt!454648 (zeroValue!5957 thiss!1427))) lt!454767)))

(declare-fun b!1031386 () Bool)

(declare-fun res!689401 () Bool)

(assert (=> b!1031386 (=> (not res!689401) (not e!582469))))

(assert (=> b!1031386 (= res!689401 (= (getValueByKey!583 (toList!6865 lt!454767) (_1!7802 (tuple2!15583 lt!454648 (zeroValue!5957 thiss!1427)))) (Some!633 (_2!7802 (tuple2!15583 lt!454648 (zeroValue!5957 thiss!1427))))))))

(declare-fun b!1031387 () Bool)

(assert (=> b!1031387 (= e!582469 (contains!6002 (toList!6865 lt!454767) (tuple2!15583 lt!454648 (zeroValue!5957 thiss!1427))))))

(assert (= (and d!123957 res!689402) b!1031386))

(assert (= (and b!1031386 res!689401) b!1031387))

(declare-fun m!951223 () Bool)

(assert (=> d!123957 m!951223))

(declare-fun m!951225 () Bool)

(assert (=> d!123957 m!951225))

(declare-fun m!951227 () Bool)

(assert (=> d!123957 m!951227))

(declare-fun m!951229 () Bool)

(assert (=> d!123957 m!951229))

(declare-fun m!951231 () Bool)

(assert (=> b!1031386 m!951231))

(declare-fun m!951233 () Bool)

(assert (=> b!1031387 m!951233))

(assert (=> b!1031178 d!123957))

(declare-fun d!123959 () Bool)

(assert (=> d!123959 (= (apply!913 lt!454642 lt!454628) (get!16392 (getValueByKey!583 (toList!6865 lt!454642) lt!454628)))))

(declare-fun bs!30117 () Bool)

(assert (= bs!30117 d!123959))

(declare-fun m!951235 () Bool)

(assert (=> bs!30117 m!951235))

(assert (=> bs!30117 m!951235))

(declare-fun m!951237 () Bool)

(assert (=> bs!30117 m!951237))

(assert (=> b!1031178 d!123959))

(declare-fun d!123961 () Bool)

(declare-fun e!582470 () Bool)

(assert (=> d!123961 e!582470))

(declare-fun res!689403 () Bool)

(assert (=> d!123961 (=> res!689403 e!582470)))

(declare-fun lt!454773 () Bool)

(assert (=> d!123961 (= res!689403 (not lt!454773))))

(declare-fun lt!454772 () Bool)

(assert (=> d!123961 (= lt!454773 lt!454772)))

(declare-fun lt!454771 () Unit!33642)

(declare-fun e!582471 () Unit!33642)

(assert (=> d!123961 (= lt!454771 e!582471)))

(declare-fun c!104544 () Bool)

(assert (=> d!123961 (= c!104544 lt!454772)))

(assert (=> d!123961 (= lt!454772 (containsKey!564 (toList!6865 (+!3124 lt!454629 (tuple2!15583 lt!454640 (zeroValue!5957 thiss!1427)))) lt!454643))))

(assert (=> d!123961 (= (contains!6000 (+!3124 lt!454629 (tuple2!15583 lt!454640 (zeroValue!5957 thiss!1427))) lt!454643) lt!454773)))

(declare-fun b!1031388 () Bool)

(declare-fun lt!454770 () Unit!33642)

(assert (=> b!1031388 (= e!582471 lt!454770)))

(assert (=> b!1031388 (= lt!454770 (lemmaContainsKeyImpliesGetValueByKeyDefined!395 (toList!6865 (+!3124 lt!454629 (tuple2!15583 lt!454640 (zeroValue!5957 thiss!1427)))) lt!454643))))

(assert (=> b!1031388 (isDefined!433 (getValueByKey!583 (toList!6865 (+!3124 lt!454629 (tuple2!15583 lt!454640 (zeroValue!5957 thiss!1427)))) lt!454643))))

(declare-fun b!1031389 () Bool)

(declare-fun Unit!33650 () Unit!33642)

(assert (=> b!1031389 (= e!582471 Unit!33650)))

(declare-fun b!1031390 () Bool)

(assert (=> b!1031390 (= e!582470 (isDefined!433 (getValueByKey!583 (toList!6865 (+!3124 lt!454629 (tuple2!15583 lt!454640 (zeroValue!5957 thiss!1427)))) lt!454643)))))

(assert (= (and d!123961 c!104544) b!1031388))

(assert (= (and d!123961 (not c!104544)) b!1031389))

(assert (= (and d!123961 (not res!689403)) b!1031390))

(declare-fun m!951239 () Bool)

(assert (=> d!123961 m!951239))

(declare-fun m!951241 () Bool)

(assert (=> b!1031388 m!951241))

(declare-fun m!951243 () Bool)

(assert (=> b!1031388 m!951243))

(assert (=> b!1031388 m!951243))

(declare-fun m!951245 () Bool)

(assert (=> b!1031388 m!951245))

(assert (=> b!1031390 m!951243))

(assert (=> b!1031390 m!951243))

(assert (=> b!1031390 m!951245))

(assert (=> b!1031178 d!123961))

(declare-fun d!123963 () Bool)

(declare-fun e!582472 () Bool)

(assert (=> d!123963 e!582472))

(declare-fun res!689405 () Bool)

(assert (=> d!123963 (=> (not res!689405) (not e!582472))))

(declare-fun lt!454775 () ListLongMap!13699)

(assert (=> d!123963 (= res!689405 (contains!6000 lt!454775 (_1!7802 (tuple2!15583 lt!454637 (minValue!5957 thiss!1427)))))))

(declare-fun lt!454777 () List!21816)

(assert (=> d!123963 (= lt!454775 (ListLongMap!13700 lt!454777))))

(declare-fun lt!454776 () Unit!33642)

(declare-fun lt!454774 () Unit!33642)

(assert (=> d!123963 (= lt!454776 lt!454774)))

(assert (=> d!123963 (= (getValueByKey!583 lt!454777 (_1!7802 (tuple2!15583 lt!454637 (minValue!5957 thiss!1427)))) (Some!633 (_2!7802 (tuple2!15583 lt!454637 (minValue!5957 thiss!1427)))))))

(assert (=> d!123963 (= lt!454774 (lemmaContainsTupThenGetReturnValue!279 lt!454777 (_1!7802 (tuple2!15583 lt!454637 (minValue!5957 thiss!1427))) (_2!7802 (tuple2!15583 lt!454637 (minValue!5957 thiss!1427)))))))

(assert (=> d!123963 (= lt!454777 (insertStrictlySorted!372 (toList!6865 lt!454647) (_1!7802 (tuple2!15583 lt!454637 (minValue!5957 thiss!1427))) (_2!7802 (tuple2!15583 lt!454637 (minValue!5957 thiss!1427)))))))

(assert (=> d!123963 (= (+!3124 lt!454647 (tuple2!15583 lt!454637 (minValue!5957 thiss!1427))) lt!454775)))

(declare-fun b!1031391 () Bool)

(declare-fun res!689404 () Bool)

(assert (=> b!1031391 (=> (not res!689404) (not e!582472))))

(assert (=> b!1031391 (= res!689404 (= (getValueByKey!583 (toList!6865 lt!454775) (_1!7802 (tuple2!15583 lt!454637 (minValue!5957 thiss!1427)))) (Some!633 (_2!7802 (tuple2!15583 lt!454637 (minValue!5957 thiss!1427))))))))

(declare-fun b!1031392 () Bool)

(assert (=> b!1031392 (= e!582472 (contains!6002 (toList!6865 lt!454775) (tuple2!15583 lt!454637 (minValue!5957 thiss!1427))))))

(assert (= (and d!123963 res!689405) b!1031391))

(assert (= (and b!1031391 res!689404) b!1031392))

(declare-fun m!951247 () Bool)

(assert (=> d!123963 m!951247))

(declare-fun m!951249 () Bool)

(assert (=> d!123963 m!951249))

(declare-fun m!951251 () Bool)

(assert (=> d!123963 m!951251))

(declare-fun m!951253 () Bool)

(assert (=> d!123963 m!951253))

(declare-fun m!951255 () Bool)

(assert (=> b!1031391 m!951255))

(declare-fun m!951257 () Bool)

(assert (=> b!1031392 m!951257))

(assert (=> b!1031178 d!123963))

(declare-fun d!123965 () Bool)

(declare-fun e!582473 () Bool)

(assert (=> d!123965 e!582473))

(declare-fun res!689407 () Bool)

(assert (=> d!123965 (=> (not res!689407) (not e!582473))))

(declare-fun lt!454779 () ListLongMap!13699)

(assert (=> d!123965 (= res!689407 (contains!6000 lt!454779 (_1!7802 (tuple2!15583 lt!454640 (zeroValue!5957 thiss!1427)))))))

(declare-fun lt!454781 () List!21816)

(assert (=> d!123965 (= lt!454779 (ListLongMap!13700 lt!454781))))

(declare-fun lt!454780 () Unit!33642)

(declare-fun lt!454778 () Unit!33642)

(assert (=> d!123965 (= lt!454780 lt!454778)))

(assert (=> d!123965 (= (getValueByKey!583 lt!454781 (_1!7802 (tuple2!15583 lt!454640 (zeroValue!5957 thiss!1427)))) (Some!633 (_2!7802 (tuple2!15583 lt!454640 (zeroValue!5957 thiss!1427)))))))

(assert (=> d!123965 (= lt!454778 (lemmaContainsTupThenGetReturnValue!279 lt!454781 (_1!7802 (tuple2!15583 lt!454640 (zeroValue!5957 thiss!1427))) (_2!7802 (tuple2!15583 lt!454640 (zeroValue!5957 thiss!1427)))))))

(assert (=> d!123965 (= lt!454781 (insertStrictlySorted!372 (toList!6865 lt!454629) (_1!7802 (tuple2!15583 lt!454640 (zeroValue!5957 thiss!1427))) (_2!7802 (tuple2!15583 lt!454640 (zeroValue!5957 thiss!1427)))))))

(assert (=> d!123965 (= (+!3124 lt!454629 (tuple2!15583 lt!454640 (zeroValue!5957 thiss!1427))) lt!454779)))

(declare-fun b!1031393 () Bool)

(declare-fun res!689406 () Bool)

(assert (=> b!1031393 (=> (not res!689406) (not e!582473))))

(assert (=> b!1031393 (= res!689406 (= (getValueByKey!583 (toList!6865 lt!454779) (_1!7802 (tuple2!15583 lt!454640 (zeroValue!5957 thiss!1427)))) (Some!633 (_2!7802 (tuple2!15583 lt!454640 (zeroValue!5957 thiss!1427))))))))

(declare-fun b!1031394 () Bool)

(assert (=> b!1031394 (= e!582473 (contains!6002 (toList!6865 lt!454779) (tuple2!15583 lt!454640 (zeroValue!5957 thiss!1427))))))

(assert (= (and d!123965 res!689407) b!1031393))

(assert (= (and b!1031393 res!689406) b!1031394))

(declare-fun m!951259 () Bool)

(assert (=> d!123965 m!951259))

(declare-fun m!951261 () Bool)

(assert (=> d!123965 m!951261))

(declare-fun m!951263 () Bool)

(assert (=> d!123965 m!951263))

(declare-fun m!951265 () Bool)

(assert (=> d!123965 m!951265))

(declare-fun m!951267 () Bool)

(assert (=> b!1031393 m!951267))

(declare-fun m!951269 () Bool)

(assert (=> b!1031394 m!951269))

(assert (=> b!1031178 d!123965))

(declare-fun b!1031395 () Bool)

(declare-fun e!582477 () ListLongMap!13699)

(declare-fun call!43606 () ListLongMap!13699)

(assert (=> b!1031395 (= e!582477 call!43606)))

(declare-fun b!1031396 () Bool)

(declare-fun e!582474 () Bool)

(declare-fun e!582478 () Bool)

(assert (=> b!1031396 (= e!582474 e!582478)))

(assert (=> b!1031396 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31688 (_keys!11325 thiss!1427))))))

(declare-fun res!689410 () Bool)

(declare-fun lt!454782 () ListLongMap!13699)

(assert (=> b!1031396 (= res!689410 (contains!6000 lt!454782 (select (arr!31171 (_keys!11325 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> b!1031396 (=> (not res!689410) (not e!582478))))

(declare-fun b!1031397 () Bool)

(declare-fun e!582475 () ListLongMap!13699)

(assert (=> b!1031397 (= e!582475 e!582477)))

(declare-fun c!104547 () Bool)

(assert (=> b!1031397 (= c!104547 (validKeyInArray!0 (select (arr!31171 (_keys!11325 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1031398 () Bool)

(assert (=> b!1031398 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31688 (_keys!11325 thiss!1427))))))

(assert (=> b!1031398 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31689 (_values!6144 thiss!1427))))))

(assert (=> b!1031398 (= e!582478 (= (apply!913 lt!454782 (select (arr!31171 (_keys!11325 thiss!1427)) #b00000000000000000000000000000000)) (get!16391 (select (arr!31172 (_values!6144 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1982 (defaultEntry!6121 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1031399 () Bool)

(declare-fun e!582480 () Bool)

(assert (=> b!1031399 (= e!582480 (= lt!454782 (getCurrentListMapNoExtraKeys!3564 (_keys!11325 thiss!1427) (_values!6144 thiss!1427) (mask!29944 thiss!1427) (extraKeys!5853 thiss!1427) (zeroValue!5957 thiss!1427) (minValue!5957 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!6121 thiss!1427))))))

(declare-fun d!123967 () Bool)

(declare-fun e!582476 () Bool)

(assert (=> d!123967 e!582476))

(declare-fun res!689409 () Bool)

(assert (=> d!123967 (=> (not res!689409) (not e!582476))))

(assert (=> d!123967 (= res!689409 (not (contains!6000 lt!454782 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!123967 (= lt!454782 e!582475)))

(declare-fun c!104548 () Bool)

(assert (=> d!123967 (= c!104548 (bvsge #b00000000000000000000000000000000 (size!31688 (_keys!11325 thiss!1427))))))

(assert (=> d!123967 (validMask!0 (mask!29944 thiss!1427))))

(assert (=> d!123967 (= (getCurrentListMapNoExtraKeys!3564 (_keys!11325 thiss!1427) (_values!6144 thiss!1427) (mask!29944 thiss!1427) (extraKeys!5853 thiss!1427) (zeroValue!5957 thiss!1427) (minValue!5957 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6121 thiss!1427)) lt!454782)))

(declare-fun b!1031400 () Bool)

(declare-fun res!689408 () Bool)

(assert (=> b!1031400 (=> (not res!689408) (not e!582476))))

(assert (=> b!1031400 (= res!689408 (not (contains!6000 lt!454782 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bm!43603 () Bool)

(assert (=> bm!43603 (= call!43606 (getCurrentListMapNoExtraKeys!3564 (_keys!11325 thiss!1427) (_values!6144 thiss!1427) (mask!29944 thiss!1427) (extraKeys!5853 thiss!1427) (zeroValue!5957 thiss!1427) (minValue!5957 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!6121 thiss!1427)))))

(declare-fun b!1031401 () Bool)

(assert (=> b!1031401 (= e!582476 e!582474)))

(declare-fun c!104545 () Bool)

(declare-fun e!582479 () Bool)

(assert (=> b!1031401 (= c!104545 e!582479)))

(declare-fun res!689411 () Bool)

(assert (=> b!1031401 (=> (not res!689411) (not e!582479))))

(assert (=> b!1031401 (= res!689411 (bvslt #b00000000000000000000000000000000 (size!31688 (_keys!11325 thiss!1427))))))

(declare-fun b!1031402 () Bool)

(assert (=> b!1031402 (= e!582475 (ListLongMap!13700 Nil!21813))))

(declare-fun b!1031403 () Bool)

(assert (=> b!1031403 (= e!582479 (validKeyInArray!0 (select (arr!31171 (_keys!11325 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> b!1031403 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1031404 () Bool)

(assert (=> b!1031404 (= e!582474 e!582480)))

(declare-fun c!104546 () Bool)

(assert (=> b!1031404 (= c!104546 (bvslt #b00000000000000000000000000000000 (size!31688 (_keys!11325 thiss!1427))))))

(declare-fun b!1031405 () Bool)

(assert (=> b!1031405 (= e!582480 (isEmpty!929 lt!454782))))

(declare-fun b!1031406 () Bool)

(declare-fun lt!454784 () Unit!33642)

(declare-fun lt!454786 () Unit!33642)

(assert (=> b!1031406 (= lt!454784 lt!454786)))

(declare-fun lt!454788 () (_ BitVec 64))

(declare-fun lt!454785 () V!37299)

(declare-fun lt!454787 () (_ BitVec 64))

(declare-fun lt!454783 () ListLongMap!13699)

(assert (=> b!1031406 (not (contains!6000 (+!3124 lt!454783 (tuple2!15583 lt!454787 lt!454785)) lt!454788))))

(assert (=> b!1031406 (= lt!454786 (addStillNotContains!243 lt!454783 lt!454787 lt!454785 lt!454788))))

(assert (=> b!1031406 (= lt!454788 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1031406 (= lt!454785 (get!16391 (select (arr!31172 (_values!6144 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1982 (defaultEntry!6121 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1031406 (= lt!454787 (select (arr!31171 (_keys!11325 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1031406 (= lt!454783 call!43606)))

(assert (=> b!1031406 (= e!582477 (+!3124 call!43606 (tuple2!15583 (select (arr!31171 (_keys!11325 thiss!1427)) #b00000000000000000000000000000000) (get!16391 (select (arr!31172 (_values!6144 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1982 (defaultEntry!6121 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!123967 c!104548) b!1031402))

(assert (= (and d!123967 (not c!104548)) b!1031397))

(assert (= (and b!1031397 c!104547) b!1031406))

(assert (= (and b!1031397 (not c!104547)) b!1031395))

(assert (= (or b!1031406 b!1031395) bm!43603))

(assert (= (and d!123967 res!689409) b!1031400))

(assert (= (and b!1031400 res!689408) b!1031401))

(assert (= (and b!1031401 res!689411) b!1031403))

(assert (= (and b!1031401 c!104545) b!1031396))

(assert (= (and b!1031401 (not c!104545)) b!1031404))

(assert (= (and b!1031396 res!689410) b!1031398))

(assert (= (and b!1031404 c!104546) b!1031399))

(assert (= (and b!1031404 (not c!104546)) b!1031405))

(declare-fun b_lambda!15925 () Bool)

(assert (=> (not b_lambda!15925) (not b!1031398)))

(assert (=> b!1031398 t!30901))

(declare-fun b_and!32973 () Bool)

(assert (= b_and!32971 (and (=> t!30901 result!14151) b_and!32973)))

(declare-fun b_lambda!15927 () Bool)

(assert (=> (not b_lambda!15927) (not b!1031406)))

(assert (=> b!1031406 t!30901))

(declare-fun b_and!32975 () Bool)

(assert (= b_and!32973 (and (=> t!30901 result!14151) b_and!32975)))

(declare-fun m!951271 () Bool)

(assert (=> d!123967 m!951271))

(assert (=> d!123967 m!950939))

(assert (=> b!1031396 m!950893))

(assert (=> b!1031396 m!950893))

(declare-fun m!951273 () Bool)

(assert (=> b!1031396 m!951273))

(assert (=> b!1031397 m!950893))

(assert (=> b!1031397 m!950893))

(assert (=> b!1031397 m!950929))

(assert (=> b!1031403 m!950893))

(assert (=> b!1031403 m!950893))

(assert (=> b!1031403 m!950929))

(declare-fun m!951275 () Bool)

(assert (=> b!1031400 m!951275))

(declare-fun m!951277 () Bool)

(assert (=> bm!43603 m!951277))

(assert (=> b!1031398 m!950893))

(declare-fun m!951279 () Bool)

(assert (=> b!1031398 m!951279))

(assert (=> b!1031398 m!950781))

(assert (=> b!1031398 m!950893))

(assert (=> b!1031398 m!950889))

(assert (=> b!1031398 m!950889))

(assert (=> b!1031398 m!950781))

(assert (=> b!1031398 m!950891))

(declare-fun m!951281 () Bool)

(assert (=> b!1031406 m!951281))

(declare-fun m!951283 () Bool)

(assert (=> b!1031406 m!951283))

(assert (=> b!1031406 m!950781))

(assert (=> b!1031406 m!951281))

(declare-fun m!951285 () Bool)

(assert (=> b!1031406 m!951285))

(assert (=> b!1031406 m!950893))

(assert (=> b!1031406 m!950889))

(declare-fun m!951287 () Bool)

(assert (=> b!1031406 m!951287))

(assert (=> b!1031406 m!950889))

(assert (=> b!1031406 m!950781))

(assert (=> b!1031406 m!950891))

(declare-fun m!951289 () Bool)

(assert (=> b!1031405 m!951289))

(assert (=> b!1031399 m!951277))

(assert (=> bm!43576 d!123967))

(declare-fun call!43607 () Bool)

(declare-fun bm!43604 () Bool)

(declare-fun c!104549 () Bool)

(assert (=> bm!43604 (= call!43607 (arrayNoDuplicates!0 lt!454491 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!104549 (Cons!21813 (select (arr!31171 lt!454491) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!104499 (Cons!21813 (select (arr!31171 lt!454491) #b00000000000000000000000000000000) Nil!21814) Nil!21814)) (ite c!104499 (Cons!21813 (select (arr!31171 lt!454491) #b00000000000000000000000000000000) Nil!21814) Nil!21814))))))

(declare-fun b!1031407 () Bool)

(declare-fun e!582481 () Bool)

(declare-fun e!582482 () Bool)

(assert (=> b!1031407 (= e!582481 e!582482)))

(assert (=> b!1031407 (= c!104549 (validKeyInArray!0 (select (arr!31171 lt!454491) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1031408 () Bool)

(declare-fun e!582483 () Bool)

(assert (=> b!1031408 (= e!582483 (contains!6001 (ite c!104499 (Cons!21813 (select (arr!31171 lt!454491) #b00000000000000000000000000000000) Nil!21814) Nil!21814) (select (arr!31171 lt!454491) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1031409 () Bool)

(assert (=> b!1031409 (= e!582482 call!43607)))

(declare-fun d!123969 () Bool)

(declare-fun res!689413 () Bool)

(declare-fun e!582484 () Bool)

(assert (=> d!123969 (=> res!689413 e!582484)))

(assert (=> d!123969 (= res!689413 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31688 lt!454491)))))

(assert (=> d!123969 (= (arrayNoDuplicates!0 lt!454491 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!104499 (Cons!21813 (select (arr!31171 lt!454491) #b00000000000000000000000000000000) Nil!21814) Nil!21814)) e!582484)))

(declare-fun b!1031410 () Bool)

(assert (=> b!1031410 (= e!582484 e!582481)))

(declare-fun res!689414 () Bool)

(assert (=> b!1031410 (=> (not res!689414) (not e!582481))))

(assert (=> b!1031410 (= res!689414 (not e!582483))))

(declare-fun res!689412 () Bool)

(assert (=> b!1031410 (=> (not res!689412) (not e!582483))))

(assert (=> b!1031410 (= res!689412 (validKeyInArray!0 (select (arr!31171 lt!454491) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1031411 () Bool)

(assert (=> b!1031411 (= e!582482 call!43607)))

(assert (= (and d!123969 (not res!689413)) b!1031410))

(assert (= (and b!1031410 res!689412) b!1031408))

(assert (= (and b!1031410 res!689414) b!1031407))

(assert (= (and b!1031407 c!104549) b!1031409))

(assert (= (and b!1031407 (not c!104549)) b!1031411))

(assert (= (or b!1031409 b!1031411) bm!43604))

(assert (=> bm!43604 m!951093))

(declare-fun m!951291 () Bool)

(assert (=> bm!43604 m!951291))

(assert (=> b!1031407 m!951093))

(assert (=> b!1031407 m!951093))

(assert (=> b!1031407 m!951095))

(assert (=> b!1031408 m!951093))

(assert (=> b!1031408 m!951093))

(declare-fun m!951293 () Bool)

(assert (=> b!1031408 m!951293))

(assert (=> b!1031410 m!951093))

(assert (=> b!1031410 m!951093))

(assert (=> b!1031410 m!951095))

(assert (=> bm!43594 d!123969))

(declare-fun d!123971 () Bool)

(declare-fun e!582485 () Bool)

(assert (=> d!123971 e!582485))

(declare-fun res!689415 () Bool)

(assert (=> d!123971 (=> res!689415 e!582485)))

(declare-fun lt!454792 () Bool)

(assert (=> d!123971 (= res!689415 (not lt!454792))))

(declare-fun lt!454791 () Bool)

(assert (=> d!123971 (= lt!454792 lt!454791)))

(declare-fun lt!454790 () Unit!33642)

(declare-fun e!582486 () Unit!33642)

(assert (=> d!123971 (= lt!454790 e!582486)))

(declare-fun c!104550 () Bool)

(assert (=> d!123971 (= c!104550 lt!454791)))

(assert (=> d!123971 (= lt!454791 (containsKey!564 (toList!6865 lt!454663) key!909))))

(assert (=> d!123971 (= (contains!6000 lt!454663 key!909) lt!454792)))

(declare-fun b!1031412 () Bool)

(declare-fun lt!454789 () Unit!33642)

(assert (=> b!1031412 (= e!582486 lt!454789)))

(assert (=> b!1031412 (= lt!454789 (lemmaContainsKeyImpliesGetValueByKeyDefined!395 (toList!6865 lt!454663) key!909))))

(assert (=> b!1031412 (isDefined!433 (getValueByKey!583 (toList!6865 lt!454663) key!909))))

(declare-fun b!1031413 () Bool)

(declare-fun Unit!33651 () Unit!33642)

(assert (=> b!1031413 (= e!582486 Unit!33651)))

(declare-fun b!1031414 () Bool)

(assert (=> b!1031414 (= e!582485 (isDefined!433 (getValueByKey!583 (toList!6865 lt!454663) key!909)))))

(assert (= (and d!123971 c!104550) b!1031412))

(assert (= (and d!123971 (not c!104550)) b!1031413))

(assert (= (and d!123971 (not res!689415)) b!1031414))

(declare-fun m!951295 () Bool)

(assert (=> d!123971 m!951295))

(declare-fun m!951297 () Bool)

(assert (=> b!1031412 m!951297))

(declare-fun m!951299 () Bool)

(assert (=> b!1031412 m!951299))

(assert (=> b!1031412 m!951299))

(declare-fun m!951301 () Bool)

(assert (=> b!1031412 m!951301))

(assert (=> b!1031414 m!951299))

(assert (=> b!1031414 m!951299))

(assert (=> b!1031414 m!951301))

(assert (=> d!123877 d!123971))

(declare-fun b!1031425 () Bool)

(declare-fun e!582494 () List!21816)

(assert (=> b!1031425 (= e!582494 (t!30902 (toList!6865 (getCurrentListMap!3911 (_keys!11325 thiss!1427) (_values!6144 thiss!1427) (mask!29944 thiss!1427) (extraKeys!5853 thiss!1427) (zeroValue!5957 thiss!1427) (minValue!5957 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6121 thiss!1427)))))))

(declare-fun b!1031426 () Bool)

(declare-fun e!582495 () List!21816)

(assert (=> b!1031426 (= e!582494 e!582495)))

(declare-fun c!104556 () Bool)

(assert (=> b!1031426 (= c!104556 (and ((_ is Cons!21812) (toList!6865 (getCurrentListMap!3911 (_keys!11325 thiss!1427) (_values!6144 thiss!1427) (mask!29944 thiss!1427) (extraKeys!5853 thiss!1427) (zeroValue!5957 thiss!1427) (minValue!5957 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6121 thiss!1427)))) (not (= (_1!7802 (h!23022 (toList!6865 (getCurrentListMap!3911 (_keys!11325 thiss!1427) (_values!6144 thiss!1427) (mask!29944 thiss!1427) (extraKeys!5853 thiss!1427) (zeroValue!5957 thiss!1427) (minValue!5957 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6121 thiss!1427))))) key!909))))))

(declare-fun d!123973 () Bool)

(declare-fun e!582493 () Bool)

(assert (=> d!123973 e!582493))

(declare-fun res!689418 () Bool)

(assert (=> d!123973 (=> (not res!689418) (not e!582493))))

(declare-fun lt!454795 () List!21816)

(declare-fun isStrictlySorted!705 (List!21816) Bool)

(assert (=> d!123973 (= res!689418 (isStrictlySorted!705 lt!454795))))

(assert (=> d!123973 (= lt!454795 e!582494)))

(declare-fun c!104555 () Bool)

(assert (=> d!123973 (= c!104555 (and ((_ is Cons!21812) (toList!6865 (getCurrentListMap!3911 (_keys!11325 thiss!1427) (_values!6144 thiss!1427) (mask!29944 thiss!1427) (extraKeys!5853 thiss!1427) (zeroValue!5957 thiss!1427) (minValue!5957 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6121 thiss!1427)))) (= (_1!7802 (h!23022 (toList!6865 (getCurrentListMap!3911 (_keys!11325 thiss!1427) (_values!6144 thiss!1427) (mask!29944 thiss!1427) (extraKeys!5853 thiss!1427) (zeroValue!5957 thiss!1427) (minValue!5957 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6121 thiss!1427))))) key!909)))))

(assert (=> d!123973 (isStrictlySorted!705 (toList!6865 (getCurrentListMap!3911 (_keys!11325 thiss!1427) (_values!6144 thiss!1427) (mask!29944 thiss!1427) (extraKeys!5853 thiss!1427) (zeroValue!5957 thiss!1427) (minValue!5957 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6121 thiss!1427))))))

(assert (=> d!123973 (= (removeStrictlySorted!53 (toList!6865 (getCurrentListMap!3911 (_keys!11325 thiss!1427) (_values!6144 thiss!1427) (mask!29944 thiss!1427) (extraKeys!5853 thiss!1427) (zeroValue!5957 thiss!1427) (minValue!5957 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6121 thiss!1427))) key!909) lt!454795)))

(declare-fun b!1031427 () Bool)

(declare-fun $colon$colon!602 (List!21816 tuple2!15582) List!21816)

(assert (=> b!1031427 (= e!582495 ($colon$colon!602 (removeStrictlySorted!53 (t!30902 (toList!6865 (getCurrentListMap!3911 (_keys!11325 thiss!1427) (_values!6144 thiss!1427) (mask!29944 thiss!1427) (extraKeys!5853 thiss!1427) (zeroValue!5957 thiss!1427) (minValue!5957 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6121 thiss!1427)))) key!909) (h!23022 (toList!6865 (getCurrentListMap!3911 (_keys!11325 thiss!1427) (_values!6144 thiss!1427) (mask!29944 thiss!1427) (extraKeys!5853 thiss!1427) (zeroValue!5957 thiss!1427) (minValue!5957 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6121 thiss!1427))))))))

(declare-fun b!1031428 () Bool)

(assert (=> b!1031428 (= e!582493 (not (containsKey!564 lt!454795 key!909)))))

(declare-fun b!1031429 () Bool)

(assert (=> b!1031429 (= e!582495 Nil!21813)))

(assert (= (and d!123973 c!104555) b!1031425))

(assert (= (and d!123973 (not c!104555)) b!1031426))

(assert (= (and b!1031426 c!104556) b!1031427))

(assert (= (and b!1031426 (not c!104556)) b!1031429))

(assert (= (and d!123973 res!689418) b!1031428))

(declare-fun m!951303 () Bool)

(assert (=> d!123973 m!951303))

(declare-fun m!951305 () Bool)

(assert (=> d!123973 m!951305))

(declare-fun m!951307 () Bool)

(assert (=> b!1031427 m!951307))

(assert (=> b!1031427 m!951307))

(declare-fun m!951309 () Bool)

(assert (=> b!1031427 m!951309))

(declare-fun m!951311 () Bool)

(assert (=> b!1031428 m!951311))

(assert (=> d!123877 d!123973))

(declare-fun d!123975 () Bool)

(declare-fun lt!454798 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!514 (List!21817) (InoxSet (_ BitVec 64)))

(assert (=> d!123975 (= lt!454798 (select (content!514 Nil!21814) (select (arr!31171 lt!454491) #b00000000000000000000000000000000)))))

(declare-fun e!582500 () Bool)

(assert (=> d!123975 (= lt!454798 e!582500)))

(declare-fun res!689424 () Bool)

(assert (=> d!123975 (=> (not res!689424) (not e!582500))))

(assert (=> d!123975 (= res!689424 ((_ is Cons!21813) Nil!21814))))

(assert (=> d!123975 (= (contains!6001 Nil!21814 (select (arr!31171 lt!454491) #b00000000000000000000000000000000)) lt!454798)))

(declare-fun b!1031434 () Bool)

(declare-fun e!582501 () Bool)

(assert (=> b!1031434 (= e!582500 e!582501)))

(declare-fun res!689423 () Bool)

(assert (=> b!1031434 (=> res!689423 e!582501)))

(assert (=> b!1031434 (= res!689423 (= (h!23023 Nil!21814) (select (arr!31171 lt!454491) #b00000000000000000000000000000000)))))

(declare-fun b!1031435 () Bool)

(assert (=> b!1031435 (= e!582501 (contains!6001 (t!30903 Nil!21814) (select (arr!31171 lt!454491) #b00000000000000000000000000000000)))))

(assert (= (and d!123975 res!689424) b!1031434))

(assert (= (and b!1031434 (not res!689423)) b!1031435))

(declare-fun m!951313 () Bool)

(assert (=> d!123975 m!951313))

(assert (=> d!123975 m!950877))

(declare-fun m!951315 () Bool)

(assert (=> d!123975 m!951315))

(assert (=> b!1031435 m!950877))

(declare-fun m!951317 () Bool)

(assert (=> b!1031435 m!951317))

(assert (=> b!1031230 d!123975))

(declare-fun b!1031448 () Bool)

(declare-fun c!104563 () Bool)

(declare-fun lt!454803 () (_ BitVec 64))

(assert (=> b!1031448 (= c!104563 (= lt!454803 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!582509 () SeekEntryResult!9641)

(declare-fun e!582510 () SeekEntryResult!9641)

(assert (=> b!1031448 (= e!582509 e!582510)))

(declare-fun b!1031449 () Bool)

(assert (=> b!1031449 (= e!582510 (MissingVacant!9641 (index!40937 lt!454677)))))

(declare-fun d!123977 () Bool)

(declare-fun lt!454804 () SeekEntryResult!9641)

(assert (=> d!123977 (and (or ((_ is Undefined!9641) lt!454804) (not ((_ is Found!9641) lt!454804)) (and (bvsge (index!40936 lt!454804) #b00000000000000000000000000000000) (bvslt (index!40936 lt!454804) (size!31688 (_keys!11325 thiss!1427))))) (or ((_ is Undefined!9641) lt!454804) ((_ is Found!9641) lt!454804) (not ((_ is MissingVacant!9641) lt!454804)) (not (= (index!40938 lt!454804) (index!40937 lt!454677))) (and (bvsge (index!40938 lt!454804) #b00000000000000000000000000000000) (bvslt (index!40938 lt!454804) (size!31688 (_keys!11325 thiss!1427))))) (or ((_ is Undefined!9641) lt!454804) (ite ((_ is Found!9641) lt!454804) (= (select (arr!31171 (_keys!11325 thiss!1427)) (index!40936 lt!454804)) key!909) (and ((_ is MissingVacant!9641) lt!454804) (= (index!40938 lt!454804) (index!40937 lt!454677)) (= (select (arr!31171 (_keys!11325 thiss!1427)) (index!40938 lt!454804)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!582508 () SeekEntryResult!9641)

(assert (=> d!123977 (= lt!454804 e!582508)))

(declare-fun c!104564 () Bool)

(assert (=> d!123977 (= c!104564 (bvsge (x!91611 lt!454677) #b01111111111111111111111111111110))))

(assert (=> d!123977 (= lt!454803 (select (arr!31171 (_keys!11325 thiss!1427)) (index!40937 lt!454677)))))

(assert (=> d!123977 (validMask!0 (mask!29944 thiss!1427))))

(assert (=> d!123977 (= (seekKeyOrZeroReturnVacant!0 (x!91611 lt!454677) (index!40937 lt!454677) (index!40937 lt!454677) key!909 (_keys!11325 thiss!1427) (mask!29944 thiss!1427)) lt!454804)))

(declare-fun b!1031450 () Bool)

(assert (=> b!1031450 (= e!582510 (seekKeyOrZeroReturnVacant!0 (bvadd (x!91611 lt!454677) #b00000000000000000000000000000001) (nextIndex!0 (index!40937 lt!454677) (bvadd (x!91611 lt!454677) #b00000000000000000000000000000001) (mask!29944 thiss!1427)) (index!40937 lt!454677) key!909 (_keys!11325 thiss!1427) (mask!29944 thiss!1427)))))

(declare-fun b!1031451 () Bool)

(assert (=> b!1031451 (= e!582509 (Found!9641 (index!40937 lt!454677)))))

(declare-fun b!1031452 () Bool)

(assert (=> b!1031452 (= e!582508 Undefined!9641)))

(declare-fun b!1031453 () Bool)

(assert (=> b!1031453 (= e!582508 e!582509)))

(declare-fun c!104565 () Bool)

(assert (=> b!1031453 (= c!104565 (= lt!454803 key!909))))

(assert (= (and d!123977 c!104564) b!1031452))

(assert (= (and d!123977 (not c!104564)) b!1031453))

(assert (= (and b!1031453 c!104565) b!1031451))

(assert (= (and b!1031453 (not c!104565)) b!1031448))

(assert (= (and b!1031448 c!104563) b!1031449))

(assert (= (and b!1031448 (not c!104563)) b!1031450))

(declare-fun m!951319 () Bool)

(assert (=> d!123977 m!951319))

(declare-fun m!951321 () Bool)

(assert (=> d!123977 m!951321))

(assert (=> d!123977 m!951039))

(assert (=> d!123977 m!950939))

(declare-fun m!951323 () Bool)

(assert (=> b!1031450 m!951323))

(assert (=> b!1031450 m!951323))

(declare-fun m!951325 () Bool)

(assert (=> b!1031450 m!951325))

(assert (=> b!1031251 d!123977))

(declare-fun d!123979 () Bool)

(assert (=> d!123979 (= (apply!913 lt!454633 #b0000000000000000000000000000000000000000000000000000000000000000) (get!16392 (getValueByKey!583 (toList!6865 lt!454633) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!30118 () Bool)

(assert (= bs!30118 d!123979))

(declare-fun m!951327 () Bool)

(assert (=> bs!30118 m!951327))

(assert (=> bs!30118 m!951327))

(declare-fun m!951329 () Bool)

(assert (=> bs!30118 m!951329))

(assert (=> b!1031173 d!123979))

(declare-fun d!123981 () Bool)

(assert (=> d!123981 (= (arrayCountValidKeys!0 (array!64748 (store (arr!31171 (_keys!11325 thiss!1427)) (index!40936 lt!454488) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31688 (_keys!11325 thiss!1427))) #b00000000000000000000000000000000 (size!31688 (_keys!11325 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11325 thiss!1427) #b00000000000000000000000000000000 (size!31688 (_keys!11325 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> d!123981 true))

(declare-fun _$79!17 () Unit!33642)

(assert (=> d!123981 (= (choose!82 (_keys!11325 thiss!1427) (index!40936 lt!454488) #b1000000000000000000000000000000000000000000000000000000000000000) _$79!17)))

(declare-fun bs!30119 () Bool)

(assert (= bs!30119 d!123981))

(assert (=> bs!30119 m!950779))

(assert (=> bs!30119 m!950949))

(assert (=> bs!30119 m!950755))

(assert (=> d!123861 d!123981))

(declare-fun d!123983 () Bool)

(assert (=> d!123983 (= (apply!913 lt!454608 (select (arr!31171 (_keys!11325 thiss!1427)) #b00000000000000000000000000000000)) (get!16392 (getValueByKey!583 (toList!6865 lt!454608) (select (arr!31171 (_keys!11325 thiss!1427)) #b00000000000000000000000000000000))))))

(declare-fun bs!30120 () Bool)

(assert (= bs!30120 d!123983))

(assert (=> bs!30120 m!950893))

(assert (=> bs!30120 m!951111))

(assert (=> bs!30120 m!951111))

(declare-fun m!951331 () Bool)

(assert (=> bs!30120 m!951331))

(assert (=> b!1031134 d!123983))

(declare-fun d!123985 () Bool)

(declare-fun c!104566 () Bool)

(assert (=> d!123985 (= c!104566 ((_ is ValueCellFull!11456) (select (arr!31172 (_values!6144 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun e!582511 () V!37299)

(assert (=> d!123985 (= (get!16391 (select (arr!31172 (_values!6144 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1982 (defaultEntry!6121 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)) e!582511)))

(declare-fun b!1031454 () Bool)

(assert (=> b!1031454 (= e!582511 (get!16393 (select (arr!31172 (_values!6144 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1982 (defaultEntry!6121 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1031455 () Bool)

(assert (=> b!1031455 (= e!582511 (get!16394 (select (arr!31172 (_values!6144 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1982 (defaultEntry!6121 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!123985 c!104566) b!1031454))

(assert (= (and d!123985 (not c!104566)) b!1031455))

(assert (=> b!1031454 m!950889))

(assert (=> b!1031454 m!950781))

(declare-fun m!951333 () Bool)

(assert (=> b!1031454 m!951333))

(assert (=> b!1031455 m!950889))

(assert (=> b!1031455 m!950781))

(declare-fun m!951335 () Bool)

(assert (=> b!1031455 m!951335))

(assert (=> b!1031134 d!123985))

(assert (=> b!1031232 d!123897))

(declare-fun d!123987 () Bool)

(assert (=> d!123987 (= (validKeyInArray!0 (select (arr!31171 (_keys!11325 thiss!1427)) (index!40936 lt!454488))) (and (not (= (select (arr!31171 (_keys!11325 thiss!1427)) (index!40936 lt!454488)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!31171 (_keys!11325 thiss!1427)) (index!40936 lt!454488)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1031160 d!123987))

(declare-fun d!123989 () Bool)

(assert (=> d!123989 (= (apply!913 (+!3124 lt!454622 (tuple2!15583 lt!454612 (minValue!5957 thiss!1427))) lt!454609) (get!16392 (getValueByKey!583 (toList!6865 (+!3124 lt!454622 (tuple2!15583 lt!454612 (minValue!5957 thiss!1427)))) lt!454609)))))

(declare-fun bs!30121 () Bool)

(assert (= bs!30121 d!123989))

(declare-fun m!951337 () Bool)

(assert (=> bs!30121 m!951337))

(assert (=> bs!30121 m!951337))

(declare-fun m!951339 () Bool)

(assert (=> bs!30121 m!951339))

(assert (=> b!1031145 d!123989))

(declare-fun d!123991 () Bool)

(declare-fun e!582512 () Bool)

(assert (=> d!123991 e!582512))

(declare-fun res!689425 () Bool)

(assert (=> d!123991 (=> res!689425 e!582512)))

(declare-fun lt!454808 () Bool)

(assert (=> d!123991 (= res!689425 (not lt!454808))))

(declare-fun lt!454807 () Bool)

(assert (=> d!123991 (= lt!454808 lt!454807)))

(declare-fun lt!454806 () Unit!33642)

(declare-fun e!582513 () Unit!33642)

(assert (=> d!123991 (= lt!454806 e!582513)))

(declare-fun c!104567 () Bool)

(assert (=> d!123991 (= c!104567 lt!454807)))

(assert (=> d!123991 (= lt!454807 (containsKey!564 (toList!6865 (+!3124 lt!454604 (tuple2!15583 lt!454615 (zeroValue!5957 thiss!1427)))) lt!454618))))

(assert (=> d!123991 (= (contains!6000 (+!3124 lt!454604 (tuple2!15583 lt!454615 (zeroValue!5957 thiss!1427))) lt!454618) lt!454808)))

(declare-fun b!1031456 () Bool)

(declare-fun lt!454805 () Unit!33642)

(assert (=> b!1031456 (= e!582513 lt!454805)))

(assert (=> b!1031456 (= lt!454805 (lemmaContainsKeyImpliesGetValueByKeyDefined!395 (toList!6865 (+!3124 lt!454604 (tuple2!15583 lt!454615 (zeroValue!5957 thiss!1427)))) lt!454618))))

(assert (=> b!1031456 (isDefined!433 (getValueByKey!583 (toList!6865 (+!3124 lt!454604 (tuple2!15583 lt!454615 (zeroValue!5957 thiss!1427)))) lt!454618))))

(declare-fun b!1031457 () Bool)

(declare-fun Unit!33652 () Unit!33642)

(assert (=> b!1031457 (= e!582513 Unit!33652)))

(declare-fun b!1031458 () Bool)

(assert (=> b!1031458 (= e!582512 (isDefined!433 (getValueByKey!583 (toList!6865 (+!3124 lt!454604 (tuple2!15583 lt!454615 (zeroValue!5957 thiss!1427)))) lt!454618)))))

(assert (= (and d!123991 c!104567) b!1031456))

(assert (= (and d!123991 (not c!104567)) b!1031457))

(assert (= (and d!123991 (not res!689425)) b!1031458))

(declare-fun m!951341 () Bool)

(assert (=> d!123991 m!951341))

(declare-fun m!951343 () Bool)

(assert (=> b!1031456 m!951343))

(declare-fun m!951345 () Bool)

(assert (=> b!1031456 m!951345))

(assert (=> b!1031456 m!951345))

(declare-fun m!951347 () Bool)

(assert (=> b!1031456 m!951347))

(assert (=> b!1031458 m!951345))

(assert (=> b!1031458 m!951345))

(assert (=> b!1031458 m!951347))

(assert (=> b!1031145 d!123991))

(declare-fun d!123993 () Bool)

(assert (=> d!123993 (= (apply!913 lt!454606 lt!454613) (get!16392 (getValueByKey!583 (toList!6865 lt!454606) lt!454613)))))

(declare-fun bs!30122 () Bool)

(assert (= bs!30122 d!123993))

(declare-fun m!951349 () Bool)

(assert (=> bs!30122 m!951349))

(assert (=> bs!30122 m!951349))

(declare-fun m!951351 () Bool)

(assert (=> bs!30122 m!951351))

(assert (=> b!1031145 d!123993))

(declare-fun d!123995 () Bool)

(assert (=> d!123995 (contains!6000 (+!3124 lt!454604 (tuple2!15583 lt!454615 (zeroValue!5957 thiss!1427))) lt!454618)))

(declare-fun lt!454809 () Unit!33642)

(assert (=> d!123995 (= lt!454809 (choose!1698 lt!454604 lt!454615 (zeroValue!5957 thiss!1427) lt!454618))))

(assert (=> d!123995 (contains!6000 lt!454604 lt!454618)))

(assert (=> d!123995 (= (addStillContains!623 lt!454604 lt!454615 (zeroValue!5957 thiss!1427) lt!454618) lt!454809)))

(declare-fun bs!30123 () Bool)

(assert (= bs!30123 d!123995))

(assert (=> bs!30123 m!950899))

(assert (=> bs!30123 m!950899))

(assert (=> bs!30123 m!950905))

(declare-fun m!951353 () Bool)

(assert (=> bs!30123 m!951353))

(declare-fun m!951355 () Bool)

(assert (=> bs!30123 m!951355))

(assert (=> b!1031145 d!123995))

(declare-fun d!123997 () Bool)

(declare-fun e!582514 () Bool)

(assert (=> d!123997 e!582514))

(declare-fun res!689427 () Bool)

(assert (=> d!123997 (=> (not res!689427) (not e!582514))))

(declare-fun lt!454811 () ListLongMap!13699)

(assert (=> d!123997 (= res!689427 (contains!6000 lt!454811 (_1!7802 (tuple2!15583 lt!454605 (minValue!5957 thiss!1427)))))))

(declare-fun lt!454813 () List!21816)

(assert (=> d!123997 (= lt!454811 (ListLongMap!13700 lt!454813))))

(declare-fun lt!454812 () Unit!33642)

(declare-fun lt!454810 () Unit!33642)

(assert (=> d!123997 (= lt!454812 lt!454810)))

(assert (=> d!123997 (= (getValueByKey!583 lt!454813 (_1!7802 (tuple2!15583 lt!454605 (minValue!5957 thiss!1427)))) (Some!633 (_2!7802 (tuple2!15583 lt!454605 (minValue!5957 thiss!1427)))))))

(assert (=> d!123997 (= lt!454810 (lemmaContainsTupThenGetReturnValue!279 lt!454813 (_1!7802 (tuple2!15583 lt!454605 (minValue!5957 thiss!1427))) (_2!7802 (tuple2!15583 lt!454605 (minValue!5957 thiss!1427)))))))

(assert (=> d!123997 (= lt!454813 (insertStrictlySorted!372 (toList!6865 lt!454617) (_1!7802 (tuple2!15583 lt!454605 (minValue!5957 thiss!1427))) (_2!7802 (tuple2!15583 lt!454605 (minValue!5957 thiss!1427)))))))

(assert (=> d!123997 (= (+!3124 lt!454617 (tuple2!15583 lt!454605 (minValue!5957 thiss!1427))) lt!454811)))

(declare-fun b!1031459 () Bool)

(declare-fun res!689426 () Bool)

(assert (=> b!1031459 (=> (not res!689426) (not e!582514))))

(assert (=> b!1031459 (= res!689426 (= (getValueByKey!583 (toList!6865 lt!454811) (_1!7802 (tuple2!15583 lt!454605 (minValue!5957 thiss!1427)))) (Some!633 (_2!7802 (tuple2!15583 lt!454605 (minValue!5957 thiss!1427))))))))

(declare-fun b!1031460 () Bool)

(assert (=> b!1031460 (= e!582514 (contains!6002 (toList!6865 lt!454811) (tuple2!15583 lt!454605 (minValue!5957 thiss!1427))))))

(assert (= (and d!123997 res!689427) b!1031459))

(assert (= (and b!1031459 res!689426) b!1031460))

(declare-fun m!951357 () Bool)

(assert (=> d!123997 m!951357))

(declare-fun m!951359 () Bool)

(assert (=> d!123997 m!951359))

(declare-fun m!951361 () Bool)

(assert (=> d!123997 m!951361))

(declare-fun m!951363 () Bool)

(assert (=> d!123997 m!951363))

(declare-fun m!951365 () Bool)

(assert (=> b!1031459 m!951365))

(declare-fun m!951367 () Bool)

(assert (=> b!1031460 m!951367))

(assert (=> b!1031145 d!123997))

(declare-fun d!123999 () Bool)

(assert (=> d!123999 (= (apply!913 lt!454622 lt!454609) (get!16392 (getValueByKey!583 (toList!6865 lt!454622) lt!454609)))))

(declare-fun bs!30124 () Bool)

(assert (= bs!30124 d!123999))

(declare-fun m!951369 () Bool)

(assert (=> bs!30124 m!951369))

(assert (=> bs!30124 m!951369))

(declare-fun m!951371 () Bool)

(assert (=> bs!30124 m!951371))

(assert (=> b!1031145 d!123999))

(declare-fun d!124001 () Bool)

(assert (=> d!124001 (= (apply!913 (+!3124 lt!454606 (tuple2!15583 lt!454623 (zeroValue!5957 thiss!1427))) lt!454613) (get!16392 (getValueByKey!583 (toList!6865 (+!3124 lt!454606 (tuple2!15583 lt!454623 (zeroValue!5957 thiss!1427)))) lt!454613)))))

(declare-fun bs!30125 () Bool)

(assert (= bs!30125 d!124001))

(declare-fun m!951373 () Bool)

(assert (=> bs!30125 m!951373))

(assert (=> bs!30125 m!951373))

(declare-fun m!951375 () Bool)

(assert (=> bs!30125 m!951375))

(assert (=> b!1031145 d!124001))

(declare-fun d!124003 () Bool)

(assert (=> d!124003 (= (apply!913 (+!3124 lt!454617 (tuple2!15583 lt!454605 (minValue!5957 thiss!1427))) lt!454603) (apply!913 lt!454617 lt!454603))))

(declare-fun lt!454814 () Unit!33642)

(assert (=> d!124003 (= lt!454814 (choose!1697 lt!454617 lt!454605 (minValue!5957 thiss!1427) lt!454603))))

(declare-fun e!582515 () Bool)

(assert (=> d!124003 e!582515))

(declare-fun res!689428 () Bool)

(assert (=> d!124003 (=> (not res!689428) (not e!582515))))

(assert (=> d!124003 (= res!689428 (contains!6000 lt!454617 lt!454603))))

(assert (=> d!124003 (= (addApplyDifferent!479 lt!454617 lt!454605 (minValue!5957 thiss!1427) lt!454603) lt!454814)))

(declare-fun b!1031461 () Bool)

(assert (=> b!1031461 (= e!582515 (not (= lt!454603 lt!454605)))))

(assert (= (and d!124003 res!689428) b!1031461))

(assert (=> d!124003 m!950901))

(declare-fun m!951377 () Bool)

(assert (=> d!124003 m!951377))

(assert (=> d!124003 m!950901))

(assert (=> d!124003 m!950903))

(assert (=> d!124003 m!950927))

(declare-fun m!951379 () Bool)

(assert (=> d!124003 m!951379))

(assert (=> b!1031145 d!124003))

(declare-fun d!124005 () Bool)

(assert (=> d!124005 (= (apply!913 (+!3124 lt!454617 (tuple2!15583 lt!454605 (minValue!5957 thiss!1427))) lt!454603) (get!16392 (getValueByKey!583 (toList!6865 (+!3124 lt!454617 (tuple2!15583 lt!454605 (minValue!5957 thiss!1427)))) lt!454603)))))

(declare-fun bs!30126 () Bool)

(assert (= bs!30126 d!124005))

(declare-fun m!951381 () Bool)

(assert (=> bs!30126 m!951381))

(assert (=> bs!30126 m!951381))

(declare-fun m!951383 () Bool)

(assert (=> bs!30126 m!951383))

(assert (=> b!1031145 d!124005))

(declare-fun d!124007 () Bool)

(assert (=> d!124007 (= (apply!913 (+!3124 lt!454606 (tuple2!15583 lt!454623 (zeroValue!5957 thiss!1427))) lt!454613) (apply!913 lt!454606 lt!454613))))

(declare-fun lt!454815 () Unit!33642)

(assert (=> d!124007 (= lt!454815 (choose!1697 lt!454606 lt!454623 (zeroValue!5957 thiss!1427) lt!454613))))

(declare-fun e!582516 () Bool)

(assert (=> d!124007 e!582516))

(declare-fun res!689429 () Bool)

(assert (=> d!124007 (=> (not res!689429) (not e!582516))))

(assert (=> d!124007 (= res!689429 (contains!6000 lt!454606 lt!454613))))

(assert (=> d!124007 (= (addApplyDifferent!479 lt!454606 lt!454623 (zeroValue!5957 thiss!1427) lt!454613) lt!454815)))

(declare-fun b!1031462 () Bool)

(assert (=> b!1031462 (= e!582516 (not (= lt!454613 lt!454623)))))

(assert (= (and d!124007 res!689429) b!1031462))

(assert (=> d!124007 m!950917))

(declare-fun m!951385 () Bool)

(assert (=> d!124007 m!951385))

(assert (=> d!124007 m!950917))

(assert (=> d!124007 m!950919))

(assert (=> d!124007 m!950913))

(declare-fun m!951387 () Bool)

(assert (=> d!124007 m!951387))

(assert (=> b!1031145 d!124007))

(declare-fun d!124009 () Bool)

(declare-fun e!582517 () Bool)

(assert (=> d!124009 e!582517))

(declare-fun res!689431 () Bool)

(assert (=> d!124009 (=> (not res!689431) (not e!582517))))

(declare-fun lt!454817 () ListLongMap!13699)

(assert (=> d!124009 (= res!689431 (contains!6000 lt!454817 (_1!7802 (tuple2!15583 lt!454612 (minValue!5957 thiss!1427)))))))

(declare-fun lt!454819 () List!21816)

(assert (=> d!124009 (= lt!454817 (ListLongMap!13700 lt!454819))))

(declare-fun lt!454818 () Unit!33642)

(declare-fun lt!454816 () Unit!33642)

(assert (=> d!124009 (= lt!454818 lt!454816)))

(assert (=> d!124009 (= (getValueByKey!583 lt!454819 (_1!7802 (tuple2!15583 lt!454612 (minValue!5957 thiss!1427)))) (Some!633 (_2!7802 (tuple2!15583 lt!454612 (minValue!5957 thiss!1427)))))))

(assert (=> d!124009 (= lt!454816 (lemmaContainsTupThenGetReturnValue!279 lt!454819 (_1!7802 (tuple2!15583 lt!454612 (minValue!5957 thiss!1427))) (_2!7802 (tuple2!15583 lt!454612 (minValue!5957 thiss!1427)))))))

(assert (=> d!124009 (= lt!454819 (insertStrictlySorted!372 (toList!6865 lt!454622) (_1!7802 (tuple2!15583 lt!454612 (minValue!5957 thiss!1427))) (_2!7802 (tuple2!15583 lt!454612 (minValue!5957 thiss!1427)))))))

(assert (=> d!124009 (= (+!3124 lt!454622 (tuple2!15583 lt!454612 (minValue!5957 thiss!1427))) lt!454817)))

(declare-fun b!1031463 () Bool)

(declare-fun res!689430 () Bool)

(assert (=> b!1031463 (=> (not res!689430) (not e!582517))))

(assert (=> b!1031463 (= res!689430 (= (getValueByKey!583 (toList!6865 lt!454817) (_1!7802 (tuple2!15583 lt!454612 (minValue!5957 thiss!1427)))) (Some!633 (_2!7802 (tuple2!15583 lt!454612 (minValue!5957 thiss!1427))))))))

(declare-fun b!1031464 () Bool)

(assert (=> b!1031464 (= e!582517 (contains!6002 (toList!6865 lt!454817) (tuple2!15583 lt!454612 (minValue!5957 thiss!1427))))))

(assert (= (and d!124009 res!689431) b!1031463))

(assert (= (and b!1031463 res!689430) b!1031464))

(declare-fun m!951389 () Bool)

(assert (=> d!124009 m!951389))

(declare-fun m!951391 () Bool)

(assert (=> d!124009 m!951391))

(declare-fun m!951393 () Bool)

(assert (=> d!124009 m!951393))

(declare-fun m!951395 () Bool)

(assert (=> d!124009 m!951395))

(declare-fun m!951397 () Bool)

(assert (=> b!1031463 m!951397))

(declare-fun m!951399 () Bool)

(assert (=> b!1031464 m!951399))

(assert (=> b!1031145 d!124009))

(assert (=> b!1031145 d!123967))

(declare-fun d!124011 () Bool)

(declare-fun e!582518 () Bool)

(assert (=> d!124011 e!582518))

(declare-fun res!689433 () Bool)

(assert (=> d!124011 (=> (not res!689433) (not e!582518))))

(declare-fun lt!454821 () ListLongMap!13699)

(assert (=> d!124011 (= res!689433 (contains!6000 lt!454821 (_1!7802 (tuple2!15583 lt!454623 (zeroValue!5957 thiss!1427)))))))

(declare-fun lt!454823 () List!21816)

(assert (=> d!124011 (= lt!454821 (ListLongMap!13700 lt!454823))))

(declare-fun lt!454822 () Unit!33642)

(declare-fun lt!454820 () Unit!33642)

(assert (=> d!124011 (= lt!454822 lt!454820)))

(assert (=> d!124011 (= (getValueByKey!583 lt!454823 (_1!7802 (tuple2!15583 lt!454623 (zeroValue!5957 thiss!1427)))) (Some!633 (_2!7802 (tuple2!15583 lt!454623 (zeroValue!5957 thiss!1427)))))))

(assert (=> d!124011 (= lt!454820 (lemmaContainsTupThenGetReturnValue!279 lt!454823 (_1!7802 (tuple2!15583 lt!454623 (zeroValue!5957 thiss!1427))) (_2!7802 (tuple2!15583 lt!454623 (zeroValue!5957 thiss!1427)))))))

(assert (=> d!124011 (= lt!454823 (insertStrictlySorted!372 (toList!6865 lt!454606) (_1!7802 (tuple2!15583 lt!454623 (zeroValue!5957 thiss!1427))) (_2!7802 (tuple2!15583 lt!454623 (zeroValue!5957 thiss!1427)))))))

(assert (=> d!124011 (= (+!3124 lt!454606 (tuple2!15583 lt!454623 (zeroValue!5957 thiss!1427))) lt!454821)))

(declare-fun b!1031465 () Bool)

(declare-fun res!689432 () Bool)

(assert (=> b!1031465 (=> (not res!689432) (not e!582518))))

(assert (=> b!1031465 (= res!689432 (= (getValueByKey!583 (toList!6865 lt!454821) (_1!7802 (tuple2!15583 lt!454623 (zeroValue!5957 thiss!1427)))) (Some!633 (_2!7802 (tuple2!15583 lt!454623 (zeroValue!5957 thiss!1427))))))))

(declare-fun b!1031466 () Bool)

(assert (=> b!1031466 (= e!582518 (contains!6002 (toList!6865 lt!454821) (tuple2!15583 lt!454623 (zeroValue!5957 thiss!1427))))))

(assert (= (and d!124011 res!689433) b!1031465))

(assert (= (and b!1031465 res!689432) b!1031466))

(declare-fun m!951401 () Bool)

(assert (=> d!124011 m!951401))

(declare-fun m!951403 () Bool)

(assert (=> d!124011 m!951403))

(declare-fun m!951405 () Bool)

(assert (=> d!124011 m!951405))

(declare-fun m!951407 () Bool)

(assert (=> d!124011 m!951407))

(declare-fun m!951409 () Bool)

(assert (=> b!1031465 m!951409))

(declare-fun m!951411 () Bool)

(assert (=> b!1031466 m!951411))

(assert (=> b!1031145 d!124011))

(declare-fun d!124013 () Bool)

(assert (=> d!124013 (= (apply!913 lt!454617 lt!454603) (get!16392 (getValueByKey!583 (toList!6865 lt!454617) lt!454603)))))

(declare-fun bs!30127 () Bool)

(assert (= bs!30127 d!124013))

(declare-fun m!951413 () Bool)

(assert (=> bs!30127 m!951413))

(assert (=> bs!30127 m!951413))

(declare-fun m!951415 () Bool)

(assert (=> bs!30127 m!951415))

(assert (=> b!1031145 d!124013))

(declare-fun d!124015 () Bool)

(assert (=> d!124015 (= (apply!913 (+!3124 lt!454622 (tuple2!15583 lt!454612 (minValue!5957 thiss!1427))) lt!454609) (apply!913 lt!454622 lt!454609))))

(declare-fun lt!454824 () Unit!33642)

(assert (=> d!124015 (= lt!454824 (choose!1697 lt!454622 lt!454612 (minValue!5957 thiss!1427) lt!454609))))

(declare-fun e!582519 () Bool)

(assert (=> d!124015 e!582519))

(declare-fun res!689434 () Bool)

(assert (=> d!124015 (=> (not res!689434) (not e!582519))))

(assert (=> d!124015 (= res!689434 (contains!6000 lt!454622 lt!454609))))

(assert (=> d!124015 (= (addApplyDifferent!479 lt!454622 lt!454612 (minValue!5957 thiss!1427) lt!454609) lt!454824)))

(declare-fun b!1031467 () Bool)

(assert (=> b!1031467 (= e!582519 (not (= lt!454609 lt!454612)))))

(assert (= (and d!124015 res!689434) b!1031467))

(assert (=> d!124015 m!950907))

(declare-fun m!951417 () Bool)

(assert (=> d!124015 m!951417))

(assert (=> d!124015 m!950907))

(assert (=> d!124015 m!950909))

(assert (=> d!124015 m!950911))

(declare-fun m!951419 () Bool)

(assert (=> d!124015 m!951419))

(assert (=> b!1031145 d!124015))

(declare-fun d!124017 () Bool)

(declare-fun e!582520 () Bool)

(assert (=> d!124017 e!582520))

(declare-fun res!689436 () Bool)

(assert (=> d!124017 (=> (not res!689436) (not e!582520))))

(declare-fun lt!454826 () ListLongMap!13699)

(assert (=> d!124017 (= res!689436 (contains!6000 lt!454826 (_1!7802 (tuple2!15583 lt!454615 (zeroValue!5957 thiss!1427)))))))

(declare-fun lt!454828 () List!21816)

(assert (=> d!124017 (= lt!454826 (ListLongMap!13700 lt!454828))))

(declare-fun lt!454827 () Unit!33642)

(declare-fun lt!454825 () Unit!33642)

(assert (=> d!124017 (= lt!454827 lt!454825)))

(assert (=> d!124017 (= (getValueByKey!583 lt!454828 (_1!7802 (tuple2!15583 lt!454615 (zeroValue!5957 thiss!1427)))) (Some!633 (_2!7802 (tuple2!15583 lt!454615 (zeroValue!5957 thiss!1427)))))))

(assert (=> d!124017 (= lt!454825 (lemmaContainsTupThenGetReturnValue!279 lt!454828 (_1!7802 (tuple2!15583 lt!454615 (zeroValue!5957 thiss!1427))) (_2!7802 (tuple2!15583 lt!454615 (zeroValue!5957 thiss!1427)))))))

(assert (=> d!124017 (= lt!454828 (insertStrictlySorted!372 (toList!6865 lt!454604) (_1!7802 (tuple2!15583 lt!454615 (zeroValue!5957 thiss!1427))) (_2!7802 (tuple2!15583 lt!454615 (zeroValue!5957 thiss!1427)))))))

(assert (=> d!124017 (= (+!3124 lt!454604 (tuple2!15583 lt!454615 (zeroValue!5957 thiss!1427))) lt!454826)))

(declare-fun b!1031468 () Bool)

(declare-fun res!689435 () Bool)

(assert (=> b!1031468 (=> (not res!689435) (not e!582520))))

(assert (=> b!1031468 (= res!689435 (= (getValueByKey!583 (toList!6865 lt!454826) (_1!7802 (tuple2!15583 lt!454615 (zeroValue!5957 thiss!1427)))) (Some!633 (_2!7802 (tuple2!15583 lt!454615 (zeroValue!5957 thiss!1427))))))))

(declare-fun b!1031469 () Bool)

(assert (=> b!1031469 (= e!582520 (contains!6002 (toList!6865 lt!454826) (tuple2!15583 lt!454615 (zeroValue!5957 thiss!1427))))))

(assert (= (and d!124017 res!689436) b!1031468))

(assert (= (and b!1031468 res!689435) b!1031469))

(declare-fun m!951421 () Bool)

(assert (=> d!124017 m!951421))

(declare-fun m!951423 () Bool)

(assert (=> d!124017 m!951423))

(declare-fun m!951425 () Bool)

(assert (=> d!124017 m!951425))

(declare-fun m!951427 () Bool)

(assert (=> d!124017 m!951427))

(declare-fun m!951429 () Bool)

(assert (=> b!1031468 m!951429))

(declare-fun m!951431 () Bool)

(assert (=> b!1031469 m!951431))

(assert (=> b!1031145 d!124017))

(declare-fun b!1031478 () Bool)

(declare-fun res!689446 () Bool)

(declare-fun e!582523 () Bool)

(assert (=> b!1031478 (=> (not res!689446) (not e!582523))))

(assert (=> b!1031478 (= res!689446 (and (= (size!31689 (_values!6144 thiss!1427)) (bvadd (mask!29944 thiss!1427) #b00000000000000000000000000000001)) (= (size!31688 (_keys!11325 thiss!1427)) (size!31689 (_values!6144 thiss!1427))) (bvsge (_size!2808 thiss!1427) #b00000000000000000000000000000000) (bvsle (_size!2808 thiss!1427) (bvadd (mask!29944 thiss!1427) #b00000000000000000000000000000001))))))

(declare-fun d!124019 () Bool)

(declare-fun res!689447 () Bool)

(assert (=> d!124019 (=> (not res!689447) (not e!582523))))

(assert (=> d!124019 (= res!689447 (validMask!0 (mask!29944 thiss!1427)))))

(assert (=> d!124019 (= (simpleValid!395 thiss!1427) e!582523)))

(declare-fun b!1031481 () Bool)

(assert (=> b!1031481 (= e!582523 (and (bvsge (extraKeys!5853 thiss!1427) #b00000000000000000000000000000000) (bvsle (extraKeys!5853 thiss!1427) #b00000000000000000000000000000011) (bvsge (_vacant!2808 thiss!1427) #b00000000000000000000000000000000)))))

(declare-fun b!1031480 () Bool)

(declare-fun res!689448 () Bool)

(assert (=> b!1031480 (=> (not res!689448) (not e!582523))))

(declare-fun size!31694 (LongMapFixedSize!5506) (_ BitVec 32))

(assert (=> b!1031480 (= res!689448 (= (size!31694 thiss!1427) (bvadd (_size!2808 thiss!1427) (bvsdiv (bvadd (extraKeys!5853 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!1031479 () Bool)

(declare-fun res!689445 () Bool)

(assert (=> b!1031479 (=> (not res!689445) (not e!582523))))

(assert (=> b!1031479 (= res!689445 (bvsge (size!31694 thiss!1427) (_size!2808 thiss!1427)))))

(assert (= (and d!124019 res!689447) b!1031478))

(assert (= (and b!1031478 res!689446) b!1031479))

(assert (= (and b!1031479 res!689445) b!1031480))

(assert (= (and b!1031480 res!689448) b!1031481))

(assert (=> d!124019 m!950939))

(declare-fun m!951433 () Bool)

(assert (=> b!1031480 m!951433))

(assert (=> b!1031479 m!951433))

(assert (=> d!123851 d!124019))

(declare-fun b!1031482 () Bool)

(declare-fun e!582526 () Bool)

(declare-fun e!582524 () Bool)

(assert (=> b!1031482 (= e!582526 e!582524)))

(declare-fun lt!454830 () (_ BitVec 64))

(assert (=> b!1031482 (= lt!454830 (select (arr!31171 (_keys!11325 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun lt!454829 () Unit!33642)

(assert (=> b!1031482 (= lt!454829 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!11325 thiss!1427) lt!454830 #b00000000000000000000000000000000))))

(assert (=> b!1031482 (arrayContainsKey!0 (_keys!11325 thiss!1427) lt!454830 #b00000000000000000000000000000000)))

(declare-fun lt!454831 () Unit!33642)

(assert (=> b!1031482 (= lt!454831 lt!454829)))

(declare-fun res!689450 () Bool)

(assert (=> b!1031482 (= res!689450 (= (seekEntryOrOpen!0 (select (arr!31171 (_keys!11325 thiss!1427)) #b00000000000000000000000000000000) (_keys!11325 thiss!1427) (mask!29944 thiss!1427)) (Found!9641 #b00000000000000000000000000000000)))))

(assert (=> b!1031482 (=> (not res!689450) (not e!582524))))

(declare-fun b!1031483 () Bool)

(declare-fun e!582525 () Bool)

(assert (=> b!1031483 (= e!582525 e!582526)))

(declare-fun c!104568 () Bool)

(assert (=> b!1031483 (= c!104568 (validKeyInArray!0 (select (arr!31171 (_keys!11325 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun bm!43605 () Bool)

(declare-fun call!43608 () Bool)

(assert (=> bm!43605 (= call!43608 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!11325 thiss!1427) (mask!29944 thiss!1427)))))

(declare-fun b!1031484 () Bool)

(assert (=> b!1031484 (= e!582526 call!43608)))

(declare-fun b!1031485 () Bool)

(assert (=> b!1031485 (= e!582524 call!43608)))

(declare-fun d!124021 () Bool)

(declare-fun res!689449 () Bool)

(assert (=> d!124021 (=> res!689449 e!582525)))

(assert (=> d!124021 (= res!689449 (bvsge #b00000000000000000000000000000000 (size!31688 (_keys!11325 thiss!1427))))))

(assert (=> d!124021 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11325 thiss!1427) (mask!29944 thiss!1427)) e!582525)))

(assert (= (and d!124021 (not res!689449)) b!1031483))

(assert (= (and b!1031483 c!104568) b!1031482))

(assert (= (and b!1031483 (not c!104568)) b!1031484))

(assert (= (and b!1031482 res!689450) b!1031485))

(assert (= (or b!1031485 b!1031484) bm!43605))

(assert (=> b!1031482 m!950893))

(declare-fun m!951435 () Bool)

(assert (=> b!1031482 m!951435))

(declare-fun m!951437 () Bool)

(assert (=> b!1031482 m!951437))

(assert (=> b!1031482 m!950893))

(declare-fun m!951439 () Bool)

(assert (=> b!1031482 m!951439))

(assert (=> b!1031483 m!950893))

(assert (=> b!1031483 m!950893))

(assert (=> b!1031483 m!950929))

(declare-fun m!951441 () Bool)

(assert (=> bm!43605 m!951441))

(assert (=> b!1031075 d!124021))

(declare-fun d!124023 () Bool)

(declare-fun e!582527 () Bool)

(assert (=> d!124023 e!582527))

(declare-fun res!689452 () Bool)

(assert (=> d!124023 (=> (not res!689452) (not e!582527))))

(declare-fun lt!454833 () ListLongMap!13699)

(assert (=> d!124023 (= res!689452 (contains!6000 lt!454833 (_1!7802 (tuple2!15583 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5957 thiss!1427)))))))

(declare-fun lt!454835 () List!21816)

(assert (=> d!124023 (= lt!454833 (ListLongMap!13700 lt!454835))))

(declare-fun lt!454834 () Unit!33642)

(declare-fun lt!454832 () Unit!33642)

(assert (=> d!124023 (= lt!454834 lt!454832)))

(assert (=> d!124023 (= (getValueByKey!583 lt!454835 (_1!7802 (tuple2!15583 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5957 thiss!1427)))) (Some!633 (_2!7802 (tuple2!15583 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5957 thiss!1427)))))))

(assert (=> d!124023 (= lt!454832 (lemmaContainsTupThenGetReturnValue!279 lt!454835 (_1!7802 (tuple2!15583 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5957 thiss!1427))) (_2!7802 (tuple2!15583 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5957 thiss!1427)))))))

(assert (=> d!124023 (= lt!454835 (insertStrictlySorted!372 (toList!6865 call!43584) (_1!7802 (tuple2!15583 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5957 thiss!1427))) (_2!7802 (tuple2!15583 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5957 thiss!1427)))))))

(assert (=> d!124023 (= (+!3124 call!43584 (tuple2!15583 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5957 thiss!1427))) lt!454833)))

(declare-fun b!1031486 () Bool)

(declare-fun res!689451 () Bool)

(assert (=> b!1031486 (=> (not res!689451) (not e!582527))))

(assert (=> b!1031486 (= res!689451 (= (getValueByKey!583 (toList!6865 lt!454833) (_1!7802 (tuple2!15583 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5957 thiss!1427)))) (Some!633 (_2!7802 (tuple2!15583 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5957 thiss!1427))))))))

(declare-fun b!1031487 () Bool)

(assert (=> b!1031487 (= e!582527 (contains!6002 (toList!6865 lt!454833) (tuple2!15583 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5957 thiss!1427))))))

(assert (= (and d!124023 res!689452) b!1031486))

(assert (= (and b!1031486 res!689451) b!1031487))

(declare-fun m!951443 () Bool)

(assert (=> d!124023 m!951443))

(declare-fun m!951445 () Bool)

(assert (=> d!124023 m!951445))

(declare-fun m!951447 () Bool)

(assert (=> d!124023 m!951447))

(declare-fun m!951449 () Bool)

(assert (=> d!124023 m!951449))

(declare-fun m!951451 () Bool)

(assert (=> b!1031486 m!951451))

(declare-fun m!951453 () Bool)

(assert (=> b!1031487 m!951453))

(assert (=> b!1031170 d!124023))

(declare-fun d!124025 () Bool)

(declare-fun e!582528 () Bool)

(assert (=> d!124025 e!582528))

(declare-fun res!689453 () Bool)

(assert (=> d!124025 (=> res!689453 e!582528)))

(declare-fun lt!454839 () Bool)

(assert (=> d!124025 (= res!689453 (not lt!454839))))

(declare-fun lt!454838 () Bool)

(assert (=> d!124025 (= lt!454839 lt!454838)))

(declare-fun lt!454837 () Unit!33642)

(declare-fun e!582529 () Unit!33642)

(assert (=> d!124025 (= lt!454837 e!582529)))

(declare-fun c!104569 () Bool)

(assert (=> d!124025 (= c!104569 lt!454838)))

(assert (=> d!124025 (= lt!454838 (containsKey!564 (toList!6865 lt!454633) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!124025 (= (contains!6000 lt!454633 #b0000000000000000000000000000000000000000000000000000000000000000) lt!454839)))

(declare-fun b!1031488 () Bool)

(declare-fun lt!454836 () Unit!33642)

(assert (=> b!1031488 (= e!582529 lt!454836)))

(assert (=> b!1031488 (= lt!454836 (lemmaContainsKeyImpliesGetValueByKeyDefined!395 (toList!6865 lt!454633) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1031488 (isDefined!433 (getValueByKey!583 (toList!6865 lt!454633) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1031489 () Bool)

(declare-fun Unit!33653 () Unit!33642)

(assert (=> b!1031489 (= e!582529 Unit!33653)))

(declare-fun b!1031490 () Bool)

(assert (=> b!1031490 (= e!582528 (isDefined!433 (getValueByKey!583 (toList!6865 lt!454633) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!124025 c!104569) b!1031488))

(assert (= (and d!124025 (not c!104569)) b!1031489))

(assert (= (and d!124025 (not res!689453)) b!1031490))

(declare-fun m!951455 () Bool)

(assert (=> d!124025 m!951455))

(declare-fun m!951457 () Bool)

(assert (=> b!1031488 m!951457))

(assert (=> b!1031488 m!951327))

(assert (=> b!1031488 m!951327))

(declare-fun m!951459 () Bool)

(assert (=> b!1031488 m!951459))

(assert (=> b!1031490 m!951327))

(assert (=> b!1031490 m!951327))

(assert (=> b!1031490 m!951459))

(assert (=> bm!43584 d!124025))

(declare-fun d!124027 () Bool)

(assert (=> d!124027 (arrayContainsKey!0 lt!454491 lt!454556 #b00000000000000000000000000000000)))

(declare-fun lt!454842 () Unit!33642)

(declare-fun choose!13 (array!64747 (_ BitVec 64) (_ BitVec 32)) Unit!33642)

(assert (=> d!124027 (= lt!454842 (choose!13 lt!454491 lt!454556 #b00000000000000000000000000000000))))

(assert (=> d!124027 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!124027 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!454491 lt!454556 #b00000000000000000000000000000000) lt!454842)))

(declare-fun bs!30128 () Bool)

(assert (= bs!30128 d!124027))

(assert (=> bs!30128 m!950881))

(declare-fun m!951461 () Bool)

(assert (=> bs!30128 m!951461))

(assert (=> b!1031085 d!124027))

(declare-fun d!124029 () Bool)

(declare-fun res!689454 () Bool)

(declare-fun e!582530 () Bool)

(assert (=> d!124029 (=> res!689454 e!582530)))

(assert (=> d!124029 (= res!689454 (= (select (arr!31171 lt!454491) #b00000000000000000000000000000000) lt!454556))))

(assert (=> d!124029 (= (arrayContainsKey!0 lt!454491 lt!454556 #b00000000000000000000000000000000) e!582530)))

(declare-fun b!1031491 () Bool)

(declare-fun e!582531 () Bool)

(assert (=> b!1031491 (= e!582530 e!582531)))

(declare-fun res!689455 () Bool)

(assert (=> b!1031491 (=> (not res!689455) (not e!582531))))

(assert (=> b!1031491 (= res!689455 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31688 lt!454491)))))

(declare-fun b!1031492 () Bool)

(assert (=> b!1031492 (= e!582531 (arrayContainsKey!0 lt!454491 lt!454556 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!124029 (not res!689454)) b!1031491))

(assert (= (and b!1031491 res!689455) b!1031492))

(assert (=> d!124029 m!950877))

(declare-fun m!951463 () Bool)

(assert (=> b!1031492 m!951463))

(assert (=> b!1031085 d!124029))

(declare-fun b!1031505 () Bool)

(declare-fun c!104577 () Bool)

(declare-fun lt!454849 () (_ BitVec 64))

(assert (=> b!1031505 (= c!104577 (= lt!454849 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!582540 () SeekEntryResult!9641)

(declare-fun e!582538 () SeekEntryResult!9641)

(assert (=> b!1031505 (= e!582540 e!582538)))

(declare-fun b!1031506 () Bool)

(declare-fun lt!454850 () SeekEntryResult!9641)

(assert (=> b!1031506 (= e!582540 (Found!9641 (index!40937 lt!454850)))))

(declare-fun b!1031507 () Bool)

(assert (=> b!1031507 (= e!582538 (MissingZero!9641 (index!40937 lt!454850)))))

(declare-fun b!1031508 () Bool)

(assert (=> b!1031508 (= e!582538 (seekKeyOrZeroReturnVacant!0 (x!91611 lt!454850) (index!40937 lt!454850) (index!40937 lt!454850) (select (arr!31171 lt!454491) #b00000000000000000000000000000000) lt!454491 (mask!29944 thiss!1427)))))

(declare-fun d!124031 () Bool)

(declare-fun lt!454851 () SeekEntryResult!9641)

(assert (=> d!124031 (and (or ((_ is Undefined!9641) lt!454851) (not ((_ is Found!9641) lt!454851)) (and (bvsge (index!40936 lt!454851) #b00000000000000000000000000000000) (bvslt (index!40936 lt!454851) (size!31688 lt!454491)))) (or ((_ is Undefined!9641) lt!454851) ((_ is Found!9641) lt!454851) (not ((_ is MissingZero!9641) lt!454851)) (and (bvsge (index!40935 lt!454851) #b00000000000000000000000000000000) (bvslt (index!40935 lt!454851) (size!31688 lt!454491)))) (or ((_ is Undefined!9641) lt!454851) ((_ is Found!9641) lt!454851) ((_ is MissingZero!9641) lt!454851) (not ((_ is MissingVacant!9641) lt!454851)) (and (bvsge (index!40938 lt!454851) #b00000000000000000000000000000000) (bvslt (index!40938 lt!454851) (size!31688 lt!454491)))) (or ((_ is Undefined!9641) lt!454851) (ite ((_ is Found!9641) lt!454851) (= (select (arr!31171 lt!454491) (index!40936 lt!454851)) (select (arr!31171 lt!454491) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!9641) lt!454851) (= (select (arr!31171 lt!454491) (index!40935 lt!454851)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!9641) lt!454851) (= (select (arr!31171 lt!454491) (index!40938 lt!454851)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!582539 () SeekEntryResult!9641)

(assert (=> d!124031 (= lt!454851 e!582539)))

(declare-fun c!104576 () Bool)

(assert (=> d!124031 (= c!104576 (and ((_ is Intermediate!9641) lt!454850) (undefined!10453 lt!454850)))))

(assert (=> d!124031 (= lt!454850 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!31171 lt!454491) #b00000000000000000000000000000000) (mask!29944 thiss!1427)) (select (arr!31171 lt!454491) #b00000000000000000000000000000000) lt!454491 (mask!29944 thiss!1427)))))

(assert (=> d!124031 (validMask!0 (mask!29944 thiss!1427))))

(assert (=> d!124031 (= (seekEntryOrOpen!0 (select (arr!31171 lt!454491) #b00000000000000000000000000000000) lt!454491 (mask!29944 thiss!1427)) lt!454851)))

(declare-fun b!1031509 () Bool)

(assert (=> b!1031509 (= e!582539 e!582540)))

(assert (=> b!1031509 (= lt!454849 (select (arr!31171 lt!454491) (index!40937 lt!454850)))))

(declare-fun c!104578 () Bool)

(assert (=> b!1031509 (= c!104578 (= lt!454849 (select (arr!31171 lt!454491) #b00000000000000000000000000000000)))))

(declare-fun b!1031510 () Bool)

(assert (=> b!1031510 (= e!582539 Undefined!9641)))

(assert (= (and d!124031 c!104576) b!1031510))

(assert (= (and d!124031 (not c!104576)) b!1031509))

(assert (= (and b!1031509 c!104578) b!1031506))

(assert (= (and b!1031509 (not c!104578)) b!1031505))

(assert (= (and b!1031505 c!104577) b!1031507))

(assert (= (and b!1031505 (not c!104577)) b!1031508))

(assert (=> b!1031508 m!950877))

(declare-fun m!951465 () Bool)

(assert (=> b!1031508 m!951465))

(declare-fun m!951467 () Bool)

(assert (=> d!124031 m!951467))

(declare-fun m!951469 () Bool)

(assert (=> d!124031 m!951469))

(assert (=> d!124031 m!950877))

(declare-fun m!951471 () Bool)

(assert (=> d!124031 m!951471))

(declare-fun m!951473 () Bool)

(assert (=> d!124031 m!951473))

(declare-fun m!951475 () Bool)

(assert (=> d!124031 m!951475))

(assert (=> d!124031 m!950877))

(assert (=> d!124031 m!951469))

(assert (=> d!124031 m!950939))

(declare-fun m!951477 () Bool)

(assert (=> b!1031509 m!951477))

(assert (=> b!1031085 d!124031))

(declare-fun b!1031511 () Bool)

(declare-fun e!582543 () Bool)

(declare-fun e!582541 () Bool)

(assert (=> b!1031511 (= e!582543 e!582541)))

(declare-fun lt!454853 () (_ BitVec 64))

(assert (=> b!1031511 (= lt!454853 (select (arr!31171 lt!454491) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!454852 () Unit!33642)

(assert (=> b!1031511 (= lt!454852 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!454491 lt!454853 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!1031511 (arrayContainsKey!0 lt!454491 lt!454853 #b00000000000000000000000000000000)))

(declare-fun lt!454854 () Unit!33642)

(assert (=> b!1031511 (= lt!454854 lt!454852)))

(declare-fun res!689457 () Bool)

(assert (=> b!1031511 (= res!689457 (= (seekEntryOrOpen!0 (select (arr!31171 lt!454491) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!454491 (mask!29944 thiss!1427)) (Found!9641 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!1031511 (=> (not res!689457) (not e!582541))))

(declare-fun b!1031512 () Bool)

(declare-fun e!582542 () Bool)

(assert (=> b!1031512 (= e!582542 e!582543)))

(declare-fun c!104579 () Bool)

(assert (=> b!1031512 (= c!104579 (validKeyInArray!0 (select (arr!31171 lt!454491) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun bm!43606 () Bool)

(declare-fun call!43609 () Bool)

(assert (=> bm!43606 (= call!43609 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) lt!454491 (mask!29944 thiss!1427)))))

(declare-fun b!1031513 () Bool)

(assert (=> b!1031513 (= e!582543 call!43609)))

(declare-fun b!1031514 () Bool)

(assert (=> b!1031514 (= e!582541 call!43609)))

(declare-fun d!124033 () Bool)

(declare-fun res!689456 () Bool)

(assert (=> d!124033 (=> res!689456 e!582542)))

(assert (=> d!124033 (= res!689456 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31688 lt!454491)))))

(assert (=> d!124033 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!454491 (mask!29944 thiss!1427)) e!582542)))

(assert (= (and d!124033 (not res!689456)) b!1031512))

(assert (= (and b!1031512 c!104579) b!1031511))

(assert (= (and b!1031512 (not c!104579)) b!1031513))

(assert (= (and b!1031511 res!689457) b!1031514))

(assert (= (or b!1031514 b!1031513) bm!43606))

(assert (=> b!1031511 m!951093))

(declare-fun m!951479 () Bool)

(assert (=> b!1031511 m!951479))

(declare-fun m!951481 () Bool)

(assert (=> b!1031511 m!951481))

(assert (=> b!1031511 m!951093))

(declare-fun m!951483 () Bool)

(assert (=> b!1031511 m!951483))

(assert (=> b!1031512 m!951093))

(assert (=> b!1031512 m!951093))

(assert (=> b!1031512 m!951095))

(declare-fun m!951485 () Bool)

(assert (=> bm!43606 m!951485))

(assert (=> bm!43559 d!124033))

(declare-fun d!124035 () Bool)

(declare-fun e!582544 () Bool)

(assert (=> d!124035 e!582544))

(declare-fun res!689458 () Bool)

(assert (=> d!124035 (=> res!689458 e!582544)))

(declare-fun lt!454858 () Bool)

(assert (=> d!124035 (= res!689458 (not lt!454858))))

(declare-fun lt!454857 () Bool)

(assert (=> d!124035 (= lt!454858 lt!454857)))

(declare-fun lt!454856 () Unit!33642)

(declare-fun e!582545 () Unit!33642)

(assert (=> d!124035 (= lt!454856 e!582545)))

(declare-fun c!104580 () Bool)

(assert (=> d!124035 (= c!104580 lt!454857)))

(assert (=> d!124035 (= lt!454857 (containsKey!564 (toList!6865 lt!454608) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!124035 (= (contains!6000 lt!454608 #b1000000000000000000000000000000000000000000000000000000000000000) lt!454858)))

(declare-fun b!1031515 () Bool)

(declare-fun lt!454855 () Unit!33642)

(assert (=> b!1031515 (= e!582545 lt!454855)))

(assert (=> b!1031515 (= lt!454855 (lemmaContainsKeyImpliesGetValueByKeyDefined!395 (toList!6865 lt!454608) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1031515 (isDefined!433 (getValueByKey!583 (toList!6865 lt!454608) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1031516 () Bool)

(declare-fun Unit!33654 () Unit!33642)

(assert (=> b!1031516 (= e!582545 Unit!33654)))

(declare-fun b!1031517 () Bool)

(assert (=> b!1031517 (= e!582544 (isDefined!433 (getValueByKey!583 (toList!6865 lt!454608) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!124035 c!104580) b!1031515))

(assert (= (and d!124035 (not c!104580)) b!1031516))

(assert (= (and d!124035 (not res!689458)) b!1031517))

(declare-fun m!951487 () Bool)

(assert (=> d!124035 m!951487))

(declare-fun m!951489 () Bool)

(assert (=> b!1031515 m!951489))

(assert (=> b!1031515 m!951115))

(assert (=> b!1031515 m!951115))

(declare-fun m!951491 () Bool)

(assert (=> b!1031515 m!951491))

(assert (=> b!1031517 m!951115))

(assert (=> b!1031517 m!951115))

(assert (=> b!1031517 m!951491))

(assert (=> bm!43580 d!124035))

(declare-fun d!124037 () Bool)

(declare-fun e!582546 () Bool)

(assert (=> d!124037 e!582546))

(declare-fun res!689459 () Bool)

(assert (=> d!124037 (=> res!689459 e!582546)))

(declare-fun lt!454862 () Bool)

(assert (=> d!124037 (= res!689459 (not lt!454862))))

(declare-fun lt!454861 () Bool)

(assert (=> d!124037 (= lt!454862 lt!454861)))

(declare-fun lt!454860 () Unit!33642)

(declare-fun e!582547 () Unit!33642)

(assert (=> d!124037 (= lt!454860 e!582547)))

(declare-fun c!104581 () Bool)

(assert (=> d!124037 (= c!104581 lt!454861)))

(assert (=> d!124037 (= lt!454861 (containsKey!564 (toList!6865 lt!454633) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!124037 (= (contains!6000 lt!454633 #b1000000000000000000000000000000000000000000000000000000000000000) lt!454862)))

(declare-fun b!1031518 () Bool)

(declare-fun lt!454859 () Unit!33642)

(assert (=> b!1031518 (= e!582547 lt!454859)))

(assert (=> b!1031518 (= lt!454859 (lemmaContainsKeyImpliesGetValueByKeyDefined!395 (toList!6865 lt!454633) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1031518 (isDefined!433 (getValueByKey!583 (toList!6865 lt!454633) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1031519 () Bool)

(declare-fun Unit!33655 () Unit!33642)

(assert (=> b!1031519 (= e!582547 Unit!33655)))

(declare-fun b!1031520 () Bool)

(assert (=> b!1031520 (= e!582546 (isDefined!433 (getValueByKey!583 (toList!6865 lt!454633) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!124037 c!104581) b!1031518))

(assert (= (and d!124037 (not c!104581)) b!1031519))

(assert (= (and d!124037 (not res!689459)) b!1031520))

(declare-fun m!951493 () Bool)

(assert (=> d!124037 m!951493))

(declare-fun m!951495 () Bool)

(assert (=> b!1031518 m!951495))

(declare-fun m!951497 () Bool)

(assert (=> b!1031518 m!951497))

(assert (=> b!1031518 m!951497))

(declare-fun m!951499 () Bool)

(assert (=> b!1031518 m!951499))

(assert (=> b!1031520 m!951497))

(assert (=> b!1031520 m!951497))

(assert (=> b!1031520 m!951499))

(assert (=> bm!43587 d!124037))

(declare-fun d!124039 () Bool)

(assert (=> d!124039 (= (apply!913 lt!454608 #b0000000000000000000000000000000000000000000000000000000000000000) (get!16392 (getValueByKey!583 (toList!6865 lt!454608) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!30129 () Bool)

(assert (= bs!30129 d!124039))

(assert (=> bs!30129 m!951067))

(assert (=> bs!30129 m!951067))

(declare-fun m!951501 () Bool)

(assert (=> bs!30129 m!951501))

(assert (=> b!1031140 d!124039))

(declare-fun d!124041 () Bool)

(assert (=> d!124041 (= (-!488 (getCurrentListMap!3911 (_keys!11325 thiss!1427) (_values!6144 thiss!1427) (mask!29944 thiss!1427) (extraKeys!5853 thiss!1427) (zeroValue!5957 thiss!1427) (minValue!5957 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6121 thiss!1427)) key!909) (getCurrentListMap!3911 (array!64748 (store (arr!31171 (_keys!11325 thiss!1427)) (index!40936 lt!454488) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31688 (_keys!11325 thiss!1427))) (array!64750 (store (arr!31172 (_values!6144 thiss!1427)) (index!40936 lt!454488) (ValueCellFull!11456 (dynLambda!1982 (defaultEntry!6121 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!31689 (_values!6144 thiss!1427))) (mask!29944 thiss!1427) (extraKeys!5853 thiss!1427) (zeroValue!5957 thiss!1427) (minValue!5957 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6121 thiss!1427)))))

(assert (=> d!124041 true))

(declare-fun _$9!44 () Unit!33642)

(assert (=> d!124041 (= (choose!1696 (_keys!11325 thiss!1427) (_values!6144 thiss!1427) (mask!29944 thiss!1427) (extraKeys!5853 thiss!1427) (zeroValue!5957 thiss!1427) (minValue!5957 thiss!1427) (index!40936 lt!454488) key!909 (defaultEntry!6121 thiss!1427)) _$9!44)))

(declare-fun b_lambda!15929 () Bool)

(assert (=> (not b_lambda!15929) (not d!124041)))

(assert (=> d!124041 t!30901))

(declare-fun b_and!32977 () Bool)

(assert (= b_and!32975 (and (=> t!30901 result!14151) b_and!32977)))

(assert (=> d!124041 m!950761))

(assert (=> d!124041 m!950763))

(assert (=> d!124041 m!950781))

(assert (=> d!124041 m!950773))

(assert (=> d!124041 m!951031))

(assert (=> d!124041 m!950761))

(assert (=> d!124041 m!950779))

(assert (=> d!123879 d!124041))

(assert (=> d!123879 d!123927))

(assert (=> b!1031217 d!123903))

(declare-fun d!124043 () Bool)

(declare-fun e!582548 () Bool)

(assert (=> d!124043 e!582548))

(declare-fun res!689460 () Bool)

(assert (=> d!124043 (=> res!689460 e!582548)))

(declare-fun lt!454866 () Bool)

(assert (=> d!124043 (= res!689460 (not lt!454866))))

(declare-fun lt!454865 () Bool)

(assert (=> d!124043 (= lt!454866 lt!454865)))

(declare-fun lt!454864 () Unit!33642)

(declare-fun e!582549 () Unit!33642)

(assert (=> d!124043 (= lt!454864 e!582549)))

(declare-fun c!104582 () Bool)

(assert (=> d!124043 (= c!104582 lt!454865)))

(assert (=> d!124043 (= lt!454865 (containsKey!564 (toList!6865 lt!454633) (select (arr!31171 lt!454491) #b00000000000000000000000000000000)))))

(assert (=> d!124043 (= (contains!6000 lt!454633 (select (arr!31171 lt!454491) #b00000000000000000000000000000000)) lt!454866)))

(declare-fun b!1031521 () Bool)

(declare-fun lt!454863 () Unit!33642)

(assert (=> b!1031521 (= e!582549 lt!454863)))

(assert (=> b!1031521 (= lt!454863 (lemmaContainsKeyImpliesGetValueByKeyDefined!395 (toList!6865 lt!454633) (select (arr!31171 lt!454491) #b00000000000000000000000000000000)))))

(assert (=> b!1031521 (isDefined!433 (getValueByKey!583 (toList!6865 lt!454633) (select (arr!31171 lt!454491) #b00000000000000000000000000000000)))))

(declare-fun b!1031522 () Bool)

(declare-fun Unit!33656 () Unit!33642)

(assert (=> b!1031522 (= e!582549 Unit!33656)))

(declare-fun b!1031523 () Bool)

(assert (=> b!1031523 (= e!582548 (isDefined!433 (getValueByKey!583 (toList!6865 lt!454633) (select (arr!31171 lt!454491) #b00000000000000000000000000000000))))))

(assert (= (and d!124043 c!104582) b!1031521))

(assert (= (and d!124043 (not c!104582)) b!1031522))

(assert (= (and d!124043 (not res!689460)) b!1031523))

(assert (=> d!124043 m!950877))

(declare-fun m!951503 () Bool)

(assert (=> d!124043 m!951503))

(assert (=> b!1031521 m!950877))

(declare-fun m!951505 () Bool)

(assert (=> b!1031521 m!951505))

(assert (=> b!1031521 m!950877))

(assert (=> b!1031521 m!951167))

(assert (=> b!1031521 m!951167))

(declare-fun m!951507 () Bool)

(assert (=> b!1031521 m!951507))

(assert (=> b!1031523 m!950877))

(assert (=> b!1031523 m!951167))

(assert (=> b!1031523 m!951167))

(assert (=> b!1031523 m!951507))

(assert (=> b!1031182 d!124043))

(assert (=> b!1031214 d!123877))

(assert (=> b!1031214 d!123859))

(declare-fun b!1031524 () Bool)

(declare-fun e!582551 () Bool)

(declare-fun e!582560 () Bool)

(assert (=> b!1031524 (= e!582551 e!582560)))

(declare-fun res!689464 () Bool)

(declare-fun call!43611 () Bool)

(assert (=> b!1031524 (= res!689464 call!43611)))

(assert (=> b!1031524 (=> (not res!689464) (not e!582560))))

(declare-fun b!1031525 () Bool)

(declare-fun res!689469 () Bool)

(declare-fun e!582556 () Bool)

(assert (=> b!1031525 (=> (not res!689469) (not e!582556))))

(assert (=> b!1031525 (= res!689469 e!582551)))

(declare-fun c!104584 () Bool)

(assert (=> b!1031525 (= c!104584 (not (= (bvand (extraKeys!5853 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1031526 () Bool)

(declare-fun c!104588 () Bool)

(assert (=> b!1031526 (= c!104588 (and (not (= (bvand (extraKeys!5853 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5853 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!582561 () ListLongMap!13699)

(declare-fun e!582559 () ListLongMap!13699)

(assert (=> b!1031526 (= e!582561 e!582559)))

(declare-fun bm!43607 () Bool)

(declare-fun call!43616 () ListLongMap!13699)

(declare-fun call!43610 () ListLongMap!13699)

(assert (=> bm!43607 (= call!43616 call!43610)))

(declare-fun bm!43608 () Bool)

(declare-fun call!43612 () ListLongMap!13699)

(declare-fun call!43613 () ListLongMap!13699)

(assert (=> bm!43608 (= call!43612 call!43613)))

(declare-fun e!582557 () Bool)

(declare-fun b!1031527 () Bool)

(declare-fun lt!454873 () ListLongMap!13699)

(assert (=> b!1031527 (= e!582557 (= (apply!913 lt!454873 (select (arr!31171 (array!64748 (store (arr!31171 (_keys!11325 thiss!1427)) (index!40936 lt!454488) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31688 (_keys!11325 thiss!1427)))) #b00000000000000000000000000000000)) (get!16391 (select (arr!31172 (array!64750 (store (arr!31172 (_values!6144 thiss!1427)) (index!40936 lt!454488) (ValueCellFull!11456 (dynLambda!1982 (defaultEntry!6121 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!31689 (_values!6144 thiss!1427)))) #b00000000000000000000000000000000) (dynLambda!1982 (defaultEntry!6121 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1031527 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31689 (array!64750 (store (arr!31172 (_values!6144 thiss!1427)) (index!40936 lt!454488) (ValueCellFull!11456 (dynLambda!1982 (defaultEntry!6121 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!31689 (_values!6144 thiss!1427))))))))

(assert (=> b!1031527 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31688 (array!64748 (store (arr!31171 (_keys!11325 thiss!1427)) (index!40936 lt!454488) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31688 (_keys!11325 thiss!1427))))))))

(declare-fun b!1031528 () Bool)

(declare-fun e!582554 () Bool)

(assert (=> b!1031528 (= e!582554 (validKeyInArray!0 (select (arr!31171 (array!64748 (store (arr!31171 (_keys!11325 thiss!1427)) (index!40936 lt!454488) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31688 (_keys!11325 thiss!1427)))) #b00000000000000000000000000000000)))))

(declare-fun d!124045 () Bool)

(assert (=> d!124045 e!582556))

(declare-fun res!689466 () Bool)

(assert (=> d!124045 (=> (not res!689466) (not e!582556))))

(assert (=> d!124045 (= res!689466 (or (bvsge #b00000000000000000000000000000000 (size!31688 (array!64748 (store (arr!31171 (_keys!11325 thiss!1427)) (index!40936 lt!454488) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31688 (_keys!11325 thiss!1427))))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31688 (array!64748 (store (arr!31171 (_keys!11325 thiss!1427)) (index!40936 lt!454488) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31688 (_keys!11325 thiss!1427))))))))))

(declare-fun lt!454867 () ListLongMap!13699)

(assert (=> d!124045 (= lt!454873 lt!454867)))

(declare-fun lt!454879 () Unit!33642)

(declare-fun e!582550 () Unit!33642)

(assert (=> d!124045 (= lt!454879 e!582550)))

(declare-fun c!104587 () Bool)

(declare-fun e!582558 () Bool)

(assert (=> d!124045 (= c!104587 e!582558)))

(declare-fun res!689461 () Bool)

(assert (=> d!124045 (=> (not res!689461) (not e!582558))))

(assert (=> d!124045 (= res!689461 (bvslt #b00000000000000000000000000000000 (size!31688 (array!64748 (store (arr!31171 (_keys!11325 thiss!1427)) (index!40936 lt!454488) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31688 (_keys!11325 thiss!1427))))))))

(declare-fun e!582562 () ListLongMap!13699)

(assert (=> d!124045 (= lt!454867 e!582562)))

(declare-fun c!104586 () Bool)

(assert (=> d!124045 (= c!104586 (and (not (= (bvand (extraKeys!5853 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5853 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!124045 (validMask!0 (mask!29944 thiss!1427))))

(assert (=> d!124045 (= (getCurrentListMap!3911 (array!64748 (store (arr!31171 (_keys!11325 thiss!1427)) (index!40936 lt!454488) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31688 (_keys!11325 thiss!1427))) (array!64750 (store (arr!31172 (_values!6144 thiss!1427)) (index!40936 lt!454488) (ValueCellFull!11456 (dynLambda!1982 (defaultEntry!6121 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!31689 (_values!6144 thiss!1427))) (mask!29944 thiss!1427) (extraKeys!5853 thiss!1427) (zeroValue!5957 thiss!1427) (minValue!5957 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6121 thiss!1427)) lt!454873)))

(declare-fun b!1031529 () Bool)

(declare-fun e!582553 () Bool)

(assert (=> b!1031529 (= e!582556 e!582553)))

(declare-fun c!104583 () Bool)

(assert (=> b!1031529 (= c!104583 (not (= (bvand (extraKeys!5853 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1031530 () Bool)

(assert (=> b!1031530 (= e!582562 (+!3124 call!43610 (tuple2!15583 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5957 thiss!1427))))))

(declare-fun bm!43609 () Bool)

(declare-fun call!43615 () ListLongMap!13699)

(assert (=> bm!43609 (= call!43615 (getCurrentListMapNoExtraKeys!3564 (array!64748 (store (arr!31171 (_keys!11325 thiss!1427)) (index!40936 lt!454488) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31688 (_keys!11325 thiss!1427))) (array!64750 (store (arr!31172 (_values!6144 thiss!1427)) (index!40936 lt!454488) (ValueCellFull!11456 (dynLambda!1982 (defaultEntry!6121 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!31689 (_values!6144 thiss!1427))) (mask!29944 thiss!1427) (extraKeys!5853 thiss!1427) (zeroValue!5957 thiss!1427) (minValue!5957 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6121 thiss!1427)))))

(declare-fun bm!43610 () Bool)

(assert (=> bm!43610 (= call!43611 (contains!6000 lt!454873 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1031531 () Bool)

(assert (=> b!1031531 (= e!582559 call!43616)))

(declare-fun b!1031532 () Bool)

(assert (=> b!1031532 (= e!582558 (validKeyInArray!0 (select (arr!31171 (array!64748 (store (arr!31171 (_keys!11325 thiss!1427)) (index!40936 lt!454488) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31688 (_keys!11325 thiss!1427)))) #b00000000000000000000000000000000)))))

(declare-fun b!1031533 () Bool)

(assert (=> b!1031533 (= e!582560 (= (apply!913 lt!454873 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!5957 thiss!1427)))))

(declare-fun bm!43611 () Bool)

(assert (=> bm!43611 (= call!43613 call!43615)))

(declare-fun b!1031534 () Bool)

(assert (=> b!1031534 (= e!582551 (not call!43611))))

(declare-fun b!1031535 () Bool)

(declare-fun Unit!33657 () Unit!33642)

(assert (=> b!1031535 (= e!582550 Unit!33657)))

(declare-fun b!1031536 () Bool)

(assert (=> b!1031536 (= e!582561 call!43616)))

(declare-fun b!1031537 () Bool)

(assert (=> b!1031537 (= e!582559 call!43612)))

(declare-fun b!1031538 () Bool)

(declare-fun lt!454885 () Unit!33642)

(assert (=> b!1031538 (= e!582550 lt!454885)))

(declare-fun lt!454869 () ListLongMap!13699)

(assert (=> b!1031538 (= lt!454869 (getCurrentListMapNoExtraKeys!3564 (array!64748 (store (arr!31171 (_keys!11325 thiss!1427)) (index!40936 lt!454488) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31688 (_keys!11325 thiss!1427))) (array!64750 (store (arr!31172 (_values!6144 thiss!1427)) (index!40936 lt!454488) (ValueCellFull!11456 (dynLambda!1982 (defaultEntry!6121 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!31689 (_values!6144 thiss!1427))) (mask!29944 thiss!1427) (extraKeys!5853 thiss!1427) (zeroValue!5957 thiss!1427) (minValue!5957 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6121 thiss!1427)))))

(declare-fun lt!454880 () (_ BitVec 64))

(assert (=> b!1031538 (= lt!454880 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!454883 () (_ BitVec 64))

(assert (=> b!1031538 (= lt!454883 (select (arr!31171 (array!64748 (store (arr!31171 (_keys!11325 thiss!1427)) (index!40936 lt!454488) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31688 (_keys!11325 thiss!1427)))) #b00000000000000000000000000000000))))

(declare-fun lt!454881 () Unit!33642)

(assert (=> b!1031538 (= lt!454881 (addStillContains!623 lt!454869 lt!454880 (zeroValue!5957 thiss!1427) lt!454883))))

(assert (=> b!1031538 (contains!6000 (+!3124 lt!454869 (tuple2!15583 lt!454880 (zeroValue!5957 thiss!1427))) lt!454883)))

(declare-fun lt!454872 () Unit!33642)

(assert (=> b!1031538 (= lt!454872 lt!454881)))

(declare-fun lt!454887 () ListLongMap!13699)

(assert (=> b!1031538 (= lt!454887 (getCurrentListMapNoExtraKeys!3564 (array!64748 (store (arr!31171 (_keys!11325 thiss!1427)) (index!40936 lt!454488) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31688 (_keys!11325 thiss!1427))) (array!64750 (store (arr!31172 (_values!6144 thiss!1427)) (index!40936 lt!454488) (ValueCellFull!11456 (dynLambda!1982 (defaultEntry!6121 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!31689 (_values!6144 thiss!1427))) (mask!29944 thiss!1427) (extraKeys!5853 thiss!1427) (zeroValue!5957 thiss!1427) (minValue!5957 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6121 thiss!1427)))))

(declare-fun lt!454877 () (_ BitVec 64))

(assert (=> b!1031538 (= lt!454877 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!454874 () (_ BitVec 64))

(assert (=> b!1031538 (= lt!454874 (select (arr!31171 (array!64748 (store (arr!31171 (_keys!11325 thiss!1427)) (index!40936 lt!454488) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31688 (_keys!11325 thiss!1427)))) #b00000000000000000000000000000000))))

(declare-fun lt!454886 () Unit!33642)

(assert (=> b!1031538 (= lt!454886 (addApplyDifferent!479 lt!454887 lt!454877 (minValue!5957 thiss!1427) lt!454874))))

(assert (=> b!1031538 (= (apply!913 (+!3124 lt!454887 (tuple2!15583 lt!454877 (minValue!5957 thiss!1427))) lt!454874) (apply!913 lt!454887 lt!454874))))

(declare-fun lt!454884 () Unit!33642)

(assert (=> b!1031538 (= lt!454884 lt!454886)))

(declare-fun lt!454871 () ListLongMap!13699)

(assert (=> b!1031538 (= lt!454871 (getCurrentListMapNoExtraKeys!3564 (array!64748 (store (arr!31171 (_keys!11325 thiss!1427)) (index!40936 lt!454488) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31688 (_keys!11325 thiss!1427))) (array!64750 (store (arr!31172 (_values!6144 thiss!1427)) (index!40936 lt!454488) (ValueCellFull!11456 (dynLambda!1982 (defaultEntry!6121 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!31689 (_values!6144 thiss!1427))) (mask!29944 thiss!1427) (extraKeys!5853 thiss!1427) (zeroValue!5957 thiss!1427) (minValue!5957 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6121 thiss!1427)))))

(declare-fun lt!454888 () (_ BitVec 64))

(assert (=> b!1031538 (= lt!454888 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!454878 () (_ BitVec 64))

(assert (=> b!1031538 (= lt!454878 (select (arr!31171 (array!64748 (store (arr!31171 (_keys!11325 thiss!1427)) (index!40936 lt!454488) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31688 (_keys!11325 thiss!1427)))) #b00000000000000000000000000000000))))

(declare-fun lt!454876 () Unit!33642)

(assert (=> b!1031538 (= lt!454876 (addApplyDifferent!479 lt!454871 lt!454888 (zeroValue!5957 thiss!1427) lt!454878))))

(assert (=> b!1031538 (= (apply!913 (+!3124 lt!454871 (tuple2!15583 lt!454888 (zeroValue!5957 thiss!1427))) lt!454878) (apply!913 lt!454871 lt!454878))))

(declare-fun lt!454875 () Unit!33642)

(assert (=> b!1031538 (= lt!454875 lt!454876)))

(declare-fun lt!454882 () ListLongMap!13699)

(assert (=> b!1031538 (= lt!454882 (getCurrentListMapNoExtraKeys!3564 (array!64748 (store (arr!31171 (_keys!11325 thiss!1427)) (index!40936 lt!454488) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31688 (_keys!11325 thiss!1427))) (array!64750 (store (arr!31172 (_values!6144 thiss!1427)) (index!40936 lt!454488) (ValueCellFull!11456 (dynLambda!1982 (defaultEntry!6121 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!31689 (_values!6144 thiss!1427))) (mask!29944 thiss!1427) (extraKeys!5853 thiss!1427) (zeroValue!5957 thiss!1427) (minValue!5957 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6121 thiss!1427)))))

(declare-fun lt!454870 () (_ BitVec 64))

(assert (=> b!1031538 (= lt!454870 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!454868 () (_ BitVec 64))

(assert (=> b!1031538 (= lt!454868 (select (arr!31171 (array!64748 (store (arr!31171 (_keys!11325 thiss!1427)) (index!40936 lt!454488) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31688 (_keys!11325 thiss!1427)))) #b00000000000000000000000000000000))))

(assert (=> b!1031538 (= lt!454885 (addApplyDifferent!479 lt!454882 lt!454870 (minValue!5957 thiss!1427) lt!454868))))

(assert (=> b!1031538 (= (apply!913 (+!3124 lt!454882 (tuple2!15583 lt!454870 (minValue!5957 thiss!1427))) lt!454868) (apply!913 lt!454882 lt!454868))))

(declare-fun bm!43612 () Bool)

(declare-fun c!104585 () Bool)

(assert (=> bm!43612 (= call!43610 (+!3124 (ite c!104586 call!43615 (ite c!104585 call!43613 call!43612)) (ite (or c!104586 c!104585) (tuple2!15583 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5957 thiss!1427)) (tuple2!15583 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5957 thiss!1427)))))))

(declare-fun b!1031539 () Bool)

(declare-fun call!43614 () Bool)

(assert (=> b!1031539 (= e!582553 (not call!43614))))

(declare-fun b!1031540 () Bool)

(assert (=> b!1031540 (= e!582562 e!582561)))

(assert (=> b!1031540 (= c!104585 (and (not (= (bvand (extraKeys!5853 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5853 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!43613 () Bool)

(assert (=> bm!43613 (= call!43614 (contains!6000 lt!454873 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1031541 () Bool)

(declare-fun e!582552 () Bool)

(assert (=> b!1031541 (= e!582553 e!582552)))

(declare-fun res!689468 () Bool)

(assert (=> b!1031541 (= res!689468 call!43614)))

(assert (=> b!1031541 (=> (not res!689468) (not e!582552))))

(declare-fun b!1031542 () Bool)

(declare-fun e!582555 () Bool)

(assert (=> b!1031542 (= e!582555 e!582557)))

(declare-fun res!689467 () Bool)

(assert (=> b!1031542 (=> (not res!689467) (not e!582557))))

(assert (=> b!1031542 (= res!689467 (contains!6000 lt!454873 (select (arr!31171 (array!64748 (store (arr!31171 (_keys!11325 thiss!1427)) (index!40936 lt!454488) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31688 (_keys!11325 thiss!1427)))) #b00000000000000000000000000000000)))))

(assert (=> b!1031542 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31688 (array!64748 (store (arr!31171 (_keys!11325 thiss!1427)) (index!40936 lt!454488) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31688 (_keys!11325 thiss!1427))))))))

(declare-fun b!1031543 () Bool)

(declare-fun res!689462 () Bool)

(assert (=> b!1031543 (=> (not res!689462) (not e!582556))))

(assert (=> b!1031543 (= res!689462 e!582555)))

(declare-fun res!689465 () Bool)

(assert (=> b!1031543 (=> res!689465 e!582555)))

(assert (=> b!1031543 (= res!689465 (not e!582554))))

(declare-fun res!689463 () Bool)

(assert (=> b!1031543 (=> (not res!689463) (not e!582554))))

(assert (=> b!1031543 (= res!689463 (bvslt #b00000000000000000000000000000000 (size!31688 (array!64748 (store (arr!31171 (_keys!11325 thiss!1427)) (index!40936 lt!454488) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31688 (_keys!11325 thiss!1427))))))))

(declare-fun b!1031544 () Bool)

(assert (=> b!1031544 (= e!582552 (= (apply!913 lt!454873 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!5957 thiss!1427)))))

(assert (= (and d!124045 c!104586) b!1031530))

(assert (= (and d!124045 (not c!104586)) b!1031540))

(assert (= (and b!1031540 c!104585) b!1031536))

(assert (= (and b!1031540 (not c!104585)) b!1031526))

(assert (= (and b!1031526 c!104588) b!1031531))

(assert (= (and b!1031526 (not c!104588)) b!1031537))

(assert (= (or b!1031531 b!1031537) bm!43608))

(assert (= (or b!1031536 bm!43608) bm!43611))

(assert (= (or b!1031536 b!1031531) bm!43607))

(assert (= (or b!1031530 bm!43611) bm!43609))

(assert (= (or b!1031530 bm!43607) bm!43612))

(assert (= (and d!124045 res!689461) b!1031532))

(assert (= (and d!124045 c!104587) b!1031538))

(assert (= (and d!124045 (not c!104587)) b!1031535))

(assert (= (and d!124045 res!689466) b!1031543))

(assert (= (and b!1031543 res!689463) b!1031528))

(assert (= (and b!1031543 (not res!689465)) b!1031542))

(assert (= (and b!1031542 res!689467) b!1031527))

(assert (= (and b!1031543 res!689462) b!1031525))

(assert (= (and b!1031525 c!104584) b!1031524))

(assert (= (and b!1031525 (not c!104584)) b!1031534))

(assert (= (and b!1031524 res!689464) b!1031533))

(assert (= (or b!1031524 b!1031534) bm!43610))

(assert (= (and b!1031525 res!689469) b!1031529))

(assert (= (and b!1031529 c!104583) b!1031541))

(assert (= (and b!1031529 (not c!104583)) b!1031539))

(assert (= (and b!1031541 res!689468) b!1031544))

(assert (= (or b!1031541 b!1031539) bm!43613))

(declare-fun b_lambda!15931 () Bool)

(assert (=> (not b_lambda!15931) (not b!1031527)))

(assert (=> b!1031527 t!30901))

(declare-fun b_and!32979 () Bool)

(assert (= b_and!32977 (and (=> t!30901 result!14151) b_and!32979)))

(declare-fun m!951509 () Bool)

(assert (=> b!1031527 m!951509))

(assert (=> b!1031527 m!951509))

(assert (=> b!1031527 m!950781))

(declare-fun m!951511 () Bool)

(assert (=> b!1031527 m!951511))

(assert (=> b!1031527 m!951071))

(assert (=> b!1031527 m!951071))

(declare-fun m!951513 () Bool)

(assert (=> b!1031527 m!951513))

(assert (=> b!1031527 m!950781))

(declare-fun m!951515 () Bool)

(assert (=> b!1031538 m!951515))

(declare-fun m!951517 () Bool)

(assert (=> b!1031538 m!951517))

(declare-fun m!951519 () Bool)

(assert (=> b!1031538 m!951519))

(declare-fun m!951521 () Bool)

(assert (=> b!1031538 m!951521))

(assert (=> b!1031538 m!951517))

(declare-fun m!951523 () Bool)

(assert (=> b!1031538 m!951523))

(assert (=> b!1031538 m!951519))

(declare-fun m!951525 () Bool)

(assert (=> b!1031538 m!951525))

(declare-fun m!951527 () Bool)

(assert (=> b!1031538 m!951527))

(declare-fun m!951529 () Bool)

(assert (=> b!1031538 m!951529))

(declare-fun m!951531 () Bool)

(assert (=> b!1031538 m!951531))

(assert (=> b!1031538 m!951071))

(declare-fun m!951533 () Bool)

(assert (=> b!1031538 m!951533))

(assert (=> b!1031538 m!951525))

(declare-fun m!951535 () Bool)

(assert (=> b!1031538 m!951535))

(declare-fun m!951537 () Bool)

(assert (=> b!1031538 m!951537))

(declare-fun m!951539 () Bool)

(assert (=> b!1031538 m!951539))

(declare-fun m!951541 () Bool)

(assert (=> b!1031538 m!951541))

(declare-fun m!951543 () Bool)

(assert (=> b!1031538 m!951543))

(assert (=> b!1031538 m!951535))

(declare-fun m!951545 () Bool)

(assert (=> b!1031538 m!951545))

(assert (=> b!1031532 m!951071))

(assert (=> b!1031532 m!951071))

(assert (=> b!1031532 m!951075))

(declare-fun m!951547 () Bool)

(assert (=> b!1031530 m!951547))

(declare-fun m!951549 () Bool)

(assert (=> bm!43612 m!951549))

(declare-fun m!951551 () Bool)

(assert (=> b!1031533 m!951551))

(assert (=> b!1031542 m!951071))

(assert (=> b!1031542 m!951071))

(declare-fun m!951553 () Bool)

(assert (=> b!1031542 m!951553))

(assert (=> d!124045 m!950939))

(assert (=> bm!43609 m!951515))

(declare-fun m!951555 () Bool)

(assert (=> b!1031544 m!951555))

(assert (=> b!1031528 m!951071))

(assert (=> b!1031528 m!951071))

(assert (=> b!1031528 m!951075))

(declare-fun m!951557 () Bool)

(assert (=> bm!43610 m!951557))

(declare-fun m!951559 () Bool)

(assert (=> bm!43613 m!951559))

(assert (=> b!1031214 d!124045))

(assert (=> b!1031168 d!123897))

(declare-fun b!1031545 () Bool)

(declare-fun e!582563 () (_ BitVec 32))

(declare-fun call!43617 () (_ BitVec 32))

(assert (=> b!1031545 (= e!582563 call!43617)))

(declare-fun b!1031546 () Bool)

(declare-fun e!582564 () (_ BitVec 32))

(assert (=> b!1031546 (= e!582564 #b00000000000000000000000000000000)))

(declare-fun b!1031547 () Bool)

(assert (=> b!1031547 (= e!582564 e!582563)))

(declare-fun c!104589 () Bool)

(assert (=> b!1031547 (= c!104589 (validKeyInArray!0 (select (arr!31171 (_keys!11325 thiss!1427)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!124047 () Bool)

(declare-fun lt!454889 () (_ BitVec 32))

(assert (=> d!124047 (and (bvsge lt!454889 #b00000000000000000000000000000000) (bvsle lt!454889 (bvsub (size!31688 (_keys!11325 thiss!1427)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> d!124047 (= lt!454889 e!582564)))

(declare-fun c!104590 () Bool)

(assert (=> d!124047 (= c!104590 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31688 (_keys!11325 thiss!1427))))))

(assert (=> d!124047 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31688 (_keys!11325 thiss!1427))) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (size!31688 (_keys!11325 thiss!1427)) (size!31688 (_keys!11325 thiss!1427))))))

(assert (=> d!124047 (= (arrayCountValidKeys!0 (_keys!11325 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31688 (_keys!11325 thiss!1427))) lt!454889)))

(declare-fun b!1031548 () Bool)

(assert (=> b!1031548 (= e!582563 (bvadd #b00000000000000000000000000000001 call!43617))))

(declare-fun bm!43614 () Bool)

(assert (=> bm!43614 (= call!43617 (arrayCountValidKeys!0 (_keys!11325 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!31688 (_keys!11325 thiss!1427))))))

(assert (= (and d!124047 c!104590) b!1031546))

(assert (= (and d!124047 (not c!104590)) b!1031547))

(assert (= (and b!1031547 c!104589) b!1031548))

(assert (= (and b!1031547 (not c!104589)) b!1031545))

(assert (= (or b!1031548 b!1031545) bm!43614))

(declare-fun m!951561 () Bool)

(assert (=> b!1031547 m!951561))

(assert (=> b!1031547 m!951561))

(declare-fun m!951563 () Bool)

(assert (=> b!1031547 m!951563))

(declare-fun m!951565 () Bool)

(assert (=> bm!43614 m!951565))

(assert (=> bm!43591 d!124047))

(declare-fun d!124049 () Bool)

(assert (=> d!124049 (= (apply!913 lt!454633 #b1000000000000000000000000000000000000000000000000000000000000000) (get!16392 (getValueByKey!583 (toList!6865 lt!454633) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!30130 () Bool)

(assert (= bs!30130 d!124049))

(assert (=> bs!30130 m!951497))

(assert (=> bs!30130 m!951497))

(declare-fun m!951567 () Bool)

(assert (=> bs!30130 m!951567))

(assert (=> b!1031184 d!124049))

(declare-fun b!1031550 () Bool)

(declare-fun e!582565 () Bool)

(assert (=> b!1031550 (= e!582565 tp_is_empty!24319)))

(declare-fun mapNonEmpty!37935 () Bool)

(declare-fun mapRes!37935 () Bool)

(declare-fun tp!72877 () Bool)

(declare-fun e!582566 () Bool)

(assert (=> mapNonEmpty!37935 (= mapRes!37935 (and tp!72877 e!582566))))

(declare-fun mapKey!37935 () (_ BitVec 32))

(declare-fun mapRest!37935 () (Array (_ BitVec 32) ValueCell!11456))

(declare-fun mapValue!37935 () ValueCell!11456)

(assert (=> mapNonEmpty!37935 (= mapRest!37934 (store mapRest!37935 mapKey!37935 mapValue!37935))))

(declare-fun condMapEmpty!37935 () Bool)

(declare-fun mapDefault!37935 () ValueCell!11456)

(assert (=> mapNonEmpty!37934 (= condMapEmpty!37935 (= mapRest!37934 ((as const (Array (_ BitVec 32) ValueCell!11456)) mapDefault!37935)))))

(assert (=> mapNonEmpty!37934 (= tp!72876 (and e!582565 mapRes!37935))))

(declare-fun b!1031549 () Bool)

(assert (=> b!1031549 (= e!582566 tp_is_empty!24319)))

(declare-fun mapIsEmpty!37935 () Bool)

(assert (=> mapIsEmpty!37935 mapRes!37935))

(assert (= (and mapNonEmpty!37934 condMapEmpty!37935) mapIsEmpty!37935))

(assert (= (and mapNonEmpty!37934 (not condMapEmpty!37935)) mapNonEmpty!37935))

(assert (= (and mapNonEmpty!37935 ((_ is ValueCellFull!11456) mapValue!37935)) b!1031549))

(assert (= (and mapNonEmpty!37934 ((_ is ValueCellFull!11456) mapDefault!37935)) b!1031550))

(declare-fun m!951569 () Bool)

(assert (=> mapNonEmpty!37935 m!951569))

(declare-fun b_lambda!15933 () Bool)

(assert (= b_lambda!15929 (or (and b!1031009 b_free!20599) b_lambda!15933)))

(declare-fun b_lambda!15935 () Bool)

(assert (= b_lambda!15927 (or (and b!1031009 b_free!20599) b_lambda!15935)))

(declare-fun b_lambda!15937 () Bool)

(assert (= b_lambda!15923 (or (and b!1031009 b_free!20599) b_lambda!15937)))

(declare-fun b_lambda!15939 () Bool)

(assert (= b_lambda!15921 (or (and b!1031009 b_free!20599) b_lambda!15939)))

(declare-fun b_lambda!15941 () Bool)

(assert (= b_lambda!15931 (or (and b!1031009 b_free!20599) b_lambda!15941)))

(declare-fun b_lambda!15943 () Bool)

(assert (= b_lambda!15925 (or (and b!1031009 b_free!20599) b_lambda!15943)))

(check-sat (not d!123955) (not b!1031376) (not b_lambda!15935) (not b!1031406) (not b!1031544) (not d!124001) (not b!1031547) (not b!1031542) (not d!124035) (not bm!43612) (not d!123973) (not b!1031521) (not b!1031428) (not bm!43604) (not bm!43597) (not b!1031400) (not b!1031517) tp_is_empty!24319 (not d!123983) (not b!1031394) (not d!123895) (not d!123889) (not b!1031455) (not d!123975) (not b_lambda!15933) (not d!124007) (not d!123919) (not d!123995) (not b!1031515) (not b!1031265) (not b!1031392) (not b!1031342) (not b!1031396) (not b!1031492) (not b!1031435) b_and!32979 (not b!1031364) (not b!1031292) (not d!123929) (not b!1031512) (not d!123937) (not d!123961) (not d!124011) (not b!1031410) (not b_lambda!15937) (not b!1031508) (not b_lambda!15941) (not bm!43606) (not d!123967) (not d!123977) (not b!1031282) (not b!1031264) (not b!1031538) (not b!1031276) (not d!124041) (not b_lambda!15943) (not b!1031520) (not b!1031298) (not b!1031464) (not b!1031523) (not b!1031333) (not b!1031511) (not b!1031286) (not b!1031487) (not d!124015) (not mapNonEmpty!37935) (not b!1031386) (not b!1031272) (not b!1031281) (not d!124009) (not b!1031454) (not d!124003) (not b!1031397) (not d!124027) (not b!1031289) (not d!123887) (not bm!43602) (not d!123951) (not d!123907) (not b!1031299) (not b!1031465) (not d!124013) (not d!123959) (not d!123991) (not b!1031403) (not b!1031387) (not d!124005) (not d!124025) (not bm!43595) (not d!123941) (not d!123949) (not d!123993) (not b!1031532) (not bm!43605) (not b!1031278) (not b!1031456) (not b!1031294) (not bm!43601) (not b!1031482) (not b!1031375) (not b!1031296) (not b!1031463) (not b!1031533) (not b!1031490) (not b!1031459) (not b!1031405) (not b!1031390) (not b!1031330) (not d!124049) (not bm!43598) (not bm!43610) (not d!123913) (not bm!43609) (not b!1031530) (not b!1031283) (not b!1031479) (not b!1031458) (not b!1031408) (not d!123997) (not d!124017) (not b!1031332) (not d!123943) (not d!123905) (not b!1031295) (not d!123957) (not d!123933) (not b!1031466) (not b!1031414) (not b!1031288) (not b!1031331) (not b!1031450) (not b!1031486) (not d!123979) (not d!123953) (not b!1031275) (not b_next!20599) (not bm!43613) (not b!1031469) (not bm!43596) (not b!1031339) (not d!124037) (not b!1031427) (not d!124023) (not b!1031329) (not b!1031336) (not d!124039) (not b_lambda!15915) (not b!1031483) (not b!1031407) (not d!123965) (not b!1031468) (not b!1031274) (not b_lambda!15907) (not b_lambda!15919) (not d!124031) (not b!1031488) (not d!123999) (not b!1031518) (not b!1031399) (not b!1031300) (not b!1031480) (not d!124045) (not d!123947) (not d!123989) (not b!1031388) (not d!123981) (not d!124019) (not d!123931) (not b!1031382) (not bm!43614) (not b!1031398) (not d!123939) (not b!1031412) (not d!123909) (not b!1031338) (not b_lambda!15917) (not d!123971) (not b!1031383) (not bm!43603) (not d!124043) (not b!1031527) (not b!1031460) (not d!123963) (not b!1031302) (not b!1031393) (not d!123923) (not b_lambda!15939) (not d!123945) (not b!1031528) (not b!1031391))
(check-sat b_and!32979 (not b_next!20599))
