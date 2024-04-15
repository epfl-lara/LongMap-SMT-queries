; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89292 () Bool)

(assert start!89292)

(declare-fun b!1023738 () Bool)

(declare-fun b_free!20335 () Bool)

(declare-fun b_next!20335 () Bool)

(assert (=> b!1023738 (= b_free!20335 (not b_next!20335))))

(declare-fun tp!72039 () Bool)

(declare-fun b_and!32555 () Bool)

(assert (=> b!1023738 (= tp!72039 b_and!32555)))

(declare-fun b!1023736 () Bool)

(declare-fun res!685549 () Bool)

(declare-fun e!576960 () Bool)

(assert (=> b!1023736 (=> (not res!685549) (not e!576960))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1023736 (= res!685549 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1023737 () Bool)

(declare-fun e!576959 () Bool)

(declare-fun e!576957 () Bool)

(declare-fun mapRes!37500 () Bool)

(assert (=> b!1023737 (= e!576959 (and e!576957 mapRes!37500))))

(declare-fun condMapEmpty!37500 () Bool)

(declare-datatypes ((V!36947 0))(
  ( (V!36948 (val!12078 Int)) )
))
(declare-datatypes ((ValueCell!11324 0))(
  ( (ValueCellFull!11324 (v!14646 V!36947)) (EmptyCell!11324) )
))
(declare-datatypes ((array!64093 0))(
  ( (array!64094 (arr!30858 (Array (_ BitVec 32) (_ BitVec 64))) (size!31371 (_ BitVec 32))) )
))
(declare-datatypes ((array!64095 0))(
  ( (array!64096 (arr!30859 (Array (_ BitVec 32) ValueCell!11324)) (size!31372 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5242 0))(
  ( (LongMapFixedSize!5243 (defaultEntry!5973 Int) (mask!29603 (_ BitVec 32)) (extraKeys!5705 (_ BitVec 32)) (zeroValue!5809 V!36947) (minValue!5809 V!36947) (_size!2676 (_ BitVec 32)) (_keys!11114 array!64093) (_values!5996 array!64095) (_vacant!2676 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5242)

(declare-fun mapDefault!37500 () ValueCell!11324)

(assert (=> b!1023737 (= condMapEmpty!37500 (= (arr!30859 (_values!5996 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11324)) mapDefault!37500)))))

(declare-fun e!576961 () Bool)

(declare-fun tp_is_empty!24055 () Bool)

(declare-fun array_inv!23921 (array!64093) Bool)

(declare-fun array_inv!23922 (array!64095) Bool)

(assert (=> b!1023738 (= e!576961 (and tp!72039 tp_is_empty!24055 (array_inv!23921 (_keys!11114 thiss!1427)) (array_inv!23922 (_values!5996 thiss!1427)) e!576959))))

(declare-fun mapIsEmpty!37500 () Bool)

(assert (=> mapIsEmpty!37500 mapRes!37500))

(declare-fun res!685548 () Bool)

(assert (=> start!89292 (=> (not res!685548) (not e!576960))))

(declare-fun valid!1992 (LongMapFixedSize!5242) Bool)

(assert (=> start!89292 (= res!685548 (valid!1992 thiss!1427))))

(assert (=> start!89292 e!576960))

(assert (=> start!89292 e!576961))

(assert (=> start!89292 true))

(declare-fun b!1023739 () Bool)

(assert (=> b!1023739 (= e!576957 tp_is_empty!24055)))

(declare-fun b!1023740 () Bool)

(declare-fun e!576958 () Bool)

(assert (=> b!1023740 (= e!576958 tp_is_empty!24055)))

(declare-fun mapNonEmpty!37500 () Bool)

(declare-fun tp!72040 () Bool)

(assert (=> mapNonEmpty!37500 (= mapRes!37500 (and tp!72040 e!576958))))

(declare-fun mapKey!37500 () (_ BitVec 32))

(declare-fun mapValue!37500 () ValueCell!11324)

(declare-fun mapRest!37500 () (Array (_ BitVec 32) ValueCell!11324))

(assert (=> mapNonEmpty!37500 (= (arr!30859 (_values!5996 thiss!1427)) (store mapRest!37500 mapKey!37500 mapValue!37500))))

(declare-fun b!1023741 () Bool)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1023741 (= e!576960 (not (validMask!0 (mask!29603 thiss!1427))))))

(assert (= (and start!89292 res!685548) b!1023736))

(assert (= (and b!1023736 res!685549) b!1023741))

(assert (= (and b!1023737 condMapEmpty!37500) mapIsEmpty!37500))

(assert (= (and b!1023737 (not condMapEmpty!37500)) mapNonEmpty!37500))

(get-info :version)

(assert (= (and mapNonEmpty!37500 ((_ is ValueCellFull!11324) mapValue!37500)) b!1023740))

(assert (= (and b!1023737 ((_ is ValueCellFull!11324) mapDefault!37500)) b!1023739))

(assert (= b!1023738 b!1023737))

(assert (= start!89292 b!1023738))

(declare-fun m!941853 () Bool)

(assert (=> b!1023738 m!941853))

(declare-fun m!941855 () Bool)

(assert (=> b!1023738 m!941855))

(declare-fun m!941857 () Bool)

(assert (=> start!89292 m!941857))

(declare-fun m!941859 () Bool)

(assert (=> mapNonEmpty!37500 m!941859))

(declare-fun m!941861 () Bool)

(assert (=> b!1023741 m!941861))

(check-sat (not b!1023741) (not mapNonEmpty!37500) (not start!89292) (not b_next!20335) tp_is_empty!24055 (not b!1023738) b_and!32555)
(check-sat b_and!32555 (not b_next!20335))
(get-model)

(declare-fun d!122437 () Bool)

(declare-fun res!685568 () Bool)

(declare-fun e!577001 () Bool)

(assert (=> d!122437 (=> (not res!685568) (not e!577001))))

(declare-fun simpleValid!387 (LongMapFixedSize!5242) Bool)

(assert (=> d!122437 (= res!685568 (simpleValid!387 thiss!1427))))

(assert (=> d!122437 (= (valid!1992 thiss!1427) e!577001)))

(declare-fun b!1023784 () Bool)

(declare-fun res!685569 () Bool)

(assert (=> b!1023784 (=> (not res!685569) (not e!577001))))

(declare-fun arrayCountValidKeys!0 (array!64093 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1023784 (= res!685569 (= (arrayCountValidKeys!0 (_keys!11114 thiss!1427) #b00000000000000000000000000000000 (size!31371 (_keys!11114 thiss!1427))) (_size!2676 thiss!1427)))))

(declare-fun b!1023785 () Bool)

(declare-fun res!685570 () Bool)

(assert (=> b!1023785 (=> (not res!685570) (not e!577001))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64093 (_ BitVec 32)) Bool)

(assert (=> b!1023785 (= res!685570 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11114 thiss!1427) (mask!29603 thiss!1427)))))

(declare-fun b!1023786 () Bool)

(declare-datatypes ((List!21754 0))(
  ( (Nil!21751) (Cons!21750 (h!22948 (_ BitVec 64)) (t!30807 List!21754)) )
))
(declare-fun arrayNoDuplicates!0 (array!64093 (_ BitVec 32) List!21754) Bool)

(assert (=> b!1023786 (= e!577001 (arrayNoDuplicates!0 (_keys!11114 thiss!1427) #b00000000000000000000000000000000 Nil!21751))))

(assert (= (and d!122437 res!685568) b!1023784))

(assert (= (and b!1023784 res!685569) b!1023785))

(assert (= (and b!1023785 res!685570) b!1023786))

(declare-fun m!941883 () Bool)

(assert (=> d!122437 m!941883))

(declare-fun m!941885 () Bool)

(assert (=> b!1023784 m!941885))

(declare-fun m!941887 () Bool)

(assert (=> b!1023785 m!941887))

(declare-fun m!941889 () Bool)

(assert (=> b!1023786 m!941889))

(assert (=> start!89292 d!122437))

(declare-fun d!122439 () Bool)

(assert (=> d!122439 (= (array_inv!23921 (_keys!11114 thiss!1427)) (bvsge (size!31371 (_keys!11114 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1023738 d!122439))

(declare-fun d!122441 () Bool)

(assert (=> d!122441 (= (array_inv!23922 (_values!5996 thiss!1427)) (bvsge (size!31372 (_values!5996 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1023738 d!122441))

(declare-fun d!122443 () Bool)

(assert (=> d!122443 (= (validMask!0 (mask!29603 thiss!1427)) (and (or (= (mask!29603 thiss!1427) #b00000000000000000000000000000111) (= (mask!29603 thiss!1427) #b00000000000000000000000000001111) (= (mask!29603 thiss!1427) #b00000000000000000000000000011111) (= (mask!29603 thiss!1427) #b00000000000000000000000000111111) (= (mask!29603 thiss!1427) #b00000000000000000000000001111111) (= (mask!29603 thiss!1427) #b00000000000000000000000011111111) (= (mask!29603 thiss!1427) #b00000000000000000000000111111111) (= (mask!29603 thiss!1427) #b00000000000000000000001111111111) (= (mask!29603 thiss!1427) #b00000000000000000000011111111111) (= (mask!29603 thiss!1427) #b00000000000000000000111111111111) (= (mask!29603 thiss!1427) #b00000000000000000001111111111111) (= (mask!29603 thiss!1427) #b00000000000000000011111111111111) (= (mask!29603 thiss!1427) #b00000000000000000111111111111111) (= (mask!29603 thiss!1427) #b00000000000000001111111111111111) (= (mask!29603 thiss!1427) #b00000000000000011111111111111111) (= (mask!29603 thiss!1427) #b00000000000000111111111111111111) (= (mask!29603 thiss!1427) #b00000000000001111111111111111111) (= (mask!29603 thiss!1427) #b00000000000011111111111111111111) (= (mask!29603 thiss!1427) #b00000000000111111111111111111111) (= (mask!29603 thiss!1427) #b00000000001111111111111111111111) (= (mask!29603 thiss!1427) #b00000000011111111111111111111111) (= (mask!29603 thiss!1427) #b00000000111111111111111111111111) (= (mask!29603 thiss!1427) #b00000001111111111111111111111111) (= (mask!29603 thiss!1427) #b00000011111111111111111111111111) (= (mask!29603 thiss!1427) #b00000111111111111111111111111111) (= (mask!29603 thiss!1427) #b00001111111111111111111111111111) (= (mask!29603 thiss!1427) #b00011111111111111111111111111111) (= (mask!29603 thiss!1427) #b00111111111111111111111111111111)) (bvsle (mask!29603 thiss!1427) #b00111111111111111111111111111111)))))

(assert (=> b!1023741 d!122443))

(declare-fun mapNonEmpty!37509 () Bool)

(declare-fun mapRes!37509 () Bool)

(declare-fun tp!72055 () Bool)

(declare-fun e!577007 () Bool)

(assert (=> mapNonEmpty!37509 (= mapRes!37509 (and tp!72055 e!577007))))

(declare-fun mapRest!37509 () (Array (_ BitVec 32) ValueCell!11324))

(declare-fun mapKey!37509 () (_ BitVec 32))

(declare-fun mapValue!37509 () ValueCell!11324)

(assert (=> mapNonEmpty!37509 (= mapRest!37500 (store mapRest!37509 mapKey!37509 mapValue!37509))))

(declare-fun mapIsEmpty!37509 () Bool)

(assert (=> mapIsEmpty!37509 mapRes!37509))

(declare-fun b!1023793 () Bool)

(assert (=> b!1023793 (= e!577007 tp_is_empty!24055)))

(declare-fun b!1023794 () Bool)

(declare-fun e!577006 () Bool)

(assert (=> b!1023794 (= e!577006 tp_is_empty!24055)))

(declare-fun condMapEmpty!37509 () Bool)

(declare-fun mapDefault!37509 () ValueCell!11324)

(assert (=> mapNonEmpty!37500 (= condMapEmpty!37509 (= mapRest!37500 ((as const (Array (_ BitVec 32) ValueCell!11324)) mapDefault!37509)))))

(assert (=> mapNonEmpty!37500 (= tp!72040 (and e!577006 mapRes!37509))))

(assert (= (and mapNonEmpty!37500 condMapEmpty!37509) mapIsEmpty!37509))

(assert (= (and mapNonEmpty!37500 (not condMapEmpty!37509)) mapNonEmpty!37509))

(assert (= (and mapNonEmpty!37509 ((_ is ValueCellFull!11324) mapValue!37509)) b!1023793))

(assert (= (and mapNonEmpty!37500 ((_ is ValueCellFull!11324) mapDefault!37509)) b!1023794))

(declare-fun m!941891 () Bool)

(assert (=> mapNonEmpty!37509 m!941891))

(check-sat (not d!122437) (not b!1023784) (not b!1023785) (not b_next!20335) tp_is_empty!24055 (not b!1023786) (not mapNonEmpty!37509) b_and!32555)
(check-sat b_and!32555 (not b_next!20335))
(get-model)

(declare-fun d!122445 () Bool)

(declare-fun lt!450340 () (_ BitVec 32))

(assert (=> d!122445 (and (bvsge lt!450340 #b00000000000000000000000000000000) (bvsle lt!450340 (bvsub (size!31371 (_keys!11114 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun e!577013 () (_ BitVec 32))

(assert (=> d!122445 (= lt!450340 e!577013)))

(declare-fun c!103512 () Bool)

(assert (=> d!122445 (= c!103512 (bvsge #b00000000000000000000000000000000 (size!31371 (_keys!11114 thiss!1427))))))

(assert (=> d!122445 (and (bvsle #b00000000000000000000000000000000 (size!31371 (_keys!11114 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!31371 (_keys!11114 thiss!1427)) (size!31371 (_keys!11114 thiss!1427))))))

(assert (=> d!122445 (= (arrayCountValidKeys!0 (_keys!11114 thiss!1427) #b00000000000000000000000000000000 (size!31371 (_keys!11114 thiss!1427))) lt!450340)))

(declare-fun b!1023803 () Bool)

(assert (=> b!1023803 (= e!577013 #b00000000000000000000000000000000)))

(declare-fun b!1023804 () Bool)

(declare-fun e!577012 () (_ BitVec 32))

(declare-fun call!43204 () (_ BitVec 32))

(assert (=> b!1023804 (= e!577012 call!43204)))

(declare-fun b!1023805 () Bool)

(assert (=> b!1023805 (= e!577013 e!577012)))

(declare-fun c!103513 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1023805 (= c!103513 (validKeyInArray!0 (select (arr!30858 (_keys!11114 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1023806 () Bool)

(assert (=> b!1023806 (= e!577012 (bvadd #b00000000000000000000000000000001 call!43204))))

(declare-fun bm!43201 () Bool)

(assert (=> bm!43201 (= call!43204 (arrayCountValidKeys!0 (_keys!11114 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31371 (_keys!11114 thiss!1427))))))

(assert (= (and d!122445 c!103512) b!1023803))

(assert (= (and d!122445 (not c!103512)) b!1023805))

(assert (= (and b!1023805 c!103513) b!1023806))

(assert (= (and b!1023805 (not c!103513)) b!1023804))

(assert (= (or b!1023806 b!1023804) bm!43201))

(declare-fun m!941893 () Bool)

(assert (=> b!1023805 m!941893))

(assert (=> b!1023805 m!941893))

(declare-fun m!941895 () Bool)

(assert (=> b!1023805 m!941895))

(declare-fun m!941897 () Bool)

(assert (=> bm!43201 m!941897))

(assert (=> b!1023784 d!122445))

(declare-fun b!1023816 () Bool)

(declare-fun res!685579 () Bool)

(declare-fun e!577016 () Bool)

(assert (=> b!1023816 (=> (not res!685579) (not e!577016))))

(declare-fun size!31377 (LongMapFixedSize!5242) (_ BitVec 32))

(assert (=> b!1023816 (= res!685579 (bvsge (size!31377 thiss!1427) (_size!2676 thiss!1427)))))

(declare-fun d!122447 () Bool)

(declare-fun res!685581 () Bool)

(assert (=> d!122447 (=> (not res!685581) (not e!577016))))

(assert (=> d!122447 (= res!685581 (validMask!0 (mask!29603 thiss!1427)))))

(assert (=> d!122447 (= (simpleValid!387 thiss!1427) e!577016)))

(declare-fun b!1023818 () Bool)

(assert (=> b!1023818 (= e!577016 (and (bvsge (extraKeys!5705 thiss!1427) #b00000000000000000000000000000000) (bvsle (extraKeys!5705 thiss!1427) #b00000000000000000000000000000011) (bvsge (_vacant!2676 thiss!1427) #b00000000000000000000000000000000)))))

(declare-fun b!1023815 () Bool)

(declare-fun res!685582 () Bool)

(assert (=> b!1023815 (=> (not res!685582) (not e!577016))))

(assert (=> b!1023815 (= res!685582 (and (= (size!31372 (_values!5996 thiss!1427)) (bvadd (mask!29603 thiss!1427) #b00000000000000000000000000000001)) (= (size!31371 (_keys!11114 thiss!1427)) (size!31372 (_values!5996 thiss!1427))) (bvsge (_size!2676 thiss!1427) #b00000000000000000000000000000000) (bvsle (_size!2676 thiss!1427) (bvadd (mask!29603 thiss!1427) #b00000000000000000000000000000001))))))

(declare-fun b!1023817 () Bool)

(declare-fun res!685580 () Bool)

(assert (=> b!1023817 (=> (not res!685580) (not e!577016))))

(assert (=> b!1023817 (= res!685580 (= (size!31377 thiss!1427) (bvadd (_size!2676 thiss!1427) (bvsdiv (bvadd (extraKeys!5705 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(assert (= (and d!122447 res!685581) b!1023815))

(assert (= (and b!1023815 res!685582) b!1023816))

(assert (= (and b!1023816 res!685579) b!1023817))

(assert (= (and b!1023817 res!685580) b!1023818))

(declare-fun m!941899 () Bool)

(assert (=> b!1023816 m!941899))

(assert (=> d!122447 m!941861))

(assert (=> b!1023817 m!941899))

(assert (=> d!122437 d!122447))

(declare-fun b!1023828 () Bool)

(declare-fun e!577024 () Bool)

(declare-fun e!577025 () Bool)

(assert (=> b!1023828 (= e!577024 e!577025)))

(declare-fun c!103516 () Bool)

(assert (=> b!1023828 (= c!103516 (validKeyInArray!0 (select (arr!30858 (_keys!11114 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun bm!43204 () Bool)

(declare-fun call!43207 () Bool)

(assert (=> bm!43204 (= call!43207 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!11114 thiss!1427) (mask!29603 thiss!1427)))))

(declare-fun b!1023829 () Bool)

(assert (=> b!1023829 (= e!577025 call!43207)))

(declare-fun b!1023830 () Bool)

(declare-fun e!577023 () Bool)

(assert (=> b!1023830 (= e!577023 call!43207)))

(declare-fun d!122449 () Bool)

(declare-fun res!685588 () Bool)

(assert (=> d!122449 (=> res!685588 e!577024)))

(assert (=> d!122449 (= res!685588 (bvsge #b00000000000000000000000000000000 (size!31371 (_keys!11114 thiss!1427))))))

(assert (=> d!122449 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11114 thiss!1427) (mask!29603 thiss!1427)) e!577024)))

(declare-fun b!1023827 () Bool)

(assert (=> b!1023827 (= e!577025 e!577023)))

(declare-fun lt!450349 () (_ BitVec 64))

(assert (=> b!1023827 (= lt!450349 (select (arr!30858 (_keys!11114 thiss!1427)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!33239 0))(
  ( (Unit!33240) )
))
(declare-fun lt!450347 () Unit!33239)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!64093 (_ BitVec 64) (_ BitVec 32)) Unit!33239)

(assert (=> b!1023827 (= lt!450347 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!11114 thiss!1427) lt!450349 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!64093 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1023827 (arrayContainsKey!0 (_keys!11114 thiss!1427) lt!450349 #b00000000000000000000000000000000)))

(declare-fun lt!450348 () Unit!33239)

(assert (=> b!1023827 (= lt!450348 lt!450347)))

(declare-fun res!685587 () Bool)

(declare-datatypes ((SeekEntryResult!9582 0))(
  ( (MissingZero!9582 (index!40699 (_ BitVec 32))) (Found!9582 (index!40700 (_ BitVec 32))) (Intermediate!9582 (undefined!10394 Bool) (index!40701 (_ BitVec 32)) (x!91003 (_ BitVec 32))) (Undefined!9582) (MissingVacant!9582 (index!40702 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!64093 (_ BitVec 32)) SeekEntryResult!9582)

(assert (=> b!1023827 (= res!685587 (= (seekEntryOrOpen!0 (select (arr!30858 (_keys!11114 thiss!1427)) #b00000000000000000000000000000000) (_keys!11114 thiss!1427) (mask!29603 thiss!1427)) (Found!9582 #b00000000000000000000000000000000)))))

(assert (=> b!1023827 (=> (not res!685587) (not e!577023))))

(assert (= (and d!122449 (not res!685588)) b!1023828))

(assert (= (and b!1023828 c!103516) b!1023827))

(assert (= (and b!1023828 (not c!103516)) b!1023829))

(assert (= (and b!1023827 res!685587) b!1023830))

(assert (= (or b!1023830 b!1023829) bm!43204))

(assert (=> b!1023828 m!941893))

(assert (=> b!1023828 m!941893))

(assert (=> b!1023828 m!941895))

(declare-fun m!941901 () Bool)

(assert (=> bm!43204 m!941901))

(assert (=> b!1023827 m!941893))

(declare-fun m!941903 () Bool)

(assert (=> b!1023827 m!941903))

(declare-fun m!941905 () Bool)

(assert (=> b!1023827 m!941905))

(assert (=> b!1023827 m!941893))

(declare-fun m!941907 () Bool)

(assert (=> b!1023827 m!941907))

(assert (=> b!1023785 d!122449))

(declare-fun b!1023841 () Bool)

(declare-fun e!577035 () Bool)

(declare-fun e!577036 () Bool)

(assert (=> b!1023841 (= e!577035 e!577036)))

(declare-fun c!103519 () Bool)

(assert (=> b!1023841 (= c!103519 (validKeyInArray!0 (select (arr!30858 (_keys!11114 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1023842 () Bool)

(declare-fun e!577037 () Bool)

(declare-fun contains!5917 (List!21754 (_ BitVec 64)) Bool)

(assert (=> b!1023842 (= e!577037 (contains!5917 Nil!21751 (select (arr!30858 (_keys!11114 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1023843 () Bool)

(declare-fun call!43210 () Bool)

(assert (=> b!1023843 (= e!577036 call!43210)))

(declare-fun bm!43207 () Bool)

(assert (=> bm!43207 (= call!43210 (arrayNoDuplicates!0 (_keys!11114 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!103519 (Cons!21750 (select (arr!30858 (_keys!11114 thiss!1427)) #b00000000000000000000000000000000) Nil!21751) Nil!21751)))))

(declare-fun b!1023844 () Bool)

(assert (=> b!1023844 (= e!577036 call!43210)))

(declare-fun d!122451 () Bool)

(declare-fun res!685597 () Bool)

(declare-fun e!577034 () Bool)

(assert (=> d!122451 (=> res!685597 e!577034)))

(assert (=> d!122451 (= res!685597 (bvsge #b00000000000000000000000000000000 (size!31371 (_keys!11114 thiss!1427))))))

(assert (=> d!122451 (= (arrayNoDuplicates!0 (_keys!11114 thiss!1427) #b00000000000000000000000000000000 Nil!21751) e!577034)))

(declare-fun b!1023845 () Bool)

(assert (=> b!1023845 (= e!577034 e!577035)))

(declare-fun res!685595 () Bool)

(assert (=> b!1023845 (=> (not res!685595) (not e!577035))))

(assert (=> b!1023845 (= res!685595 (not e!577037))))

(declare-fun res!685596 () Bool)

(assert (=> b!1023845 (=> (not res!685596) (not e!577037))))

(assert (=> b!1023845 (= res!685596 (validKeyInArray!0 (select (arr!30858 (_keys!11114 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (= (and d!122451 (not res!685597)) b!1023845))

(assert (= (and b!1023845 res!685596) b!1023842))

(assert (= (and b!1023845 res!685595) b!1023841))

(assert (= (and b!1023841 c!103519) b!1023844))

(assert (= (and b!1023841 (not c!103519)) b!1023843))

(assert (= (or b!1023844 b!1023843) bm!43207))

(assert (=> b!1023841 m!941893))

(assert (=> b!1023841 m!941893))

(assert (=> b!1023841 m!941895))

(assert (=> b!1023842 m!941893))

(assert (=> b!1023842 m!941893))

(declare-fun m!941909 () Bool)

(assert (=> b!1023842 m!941909))

(assert (=> bm!43207 m!941893))

(declare-fun m!941911 () Bool)

(assert (=> bm!43207 m!941911))

(assert (=> b!1023845 m!941893))

(assert (=> b!1023845 m!941893))

(assert (=> b!1023845 m!941895))

(assert (=> b!1023786 d!122451))

(declare-fun mapNonEmpty!37510 () Bool)

(declare-fun mapRes!37510 () Bool)

(declare-fun tp!72056 () Bool)

(declare-fun e!577039 () Bool)

(assert (=> mapNonEmpty!37510 (= mapRes!37510 (and tp!72056 e!577039))))

(declare-fun mapValue!37510 () ValueCell!11324)

(declare-fun mapRest!37510 () (Array (_ BitVec 32) ValueCell!11324))

(declare-fun mapKey!37510 () (_ BitVec 32))

(assert (=> mapNonEmpty!37510 (= mapRest!37509 (store mapRest!37510 mapKey!37510 mapValue!37510))))

(declare-fun mapIsEmpty!37510 () Bool)

(assert (=> mapIsEmpty!37510 mapRes!37510))

(declare-fun b!1023846 () Bool)

(assert (=> b!1023846 (= e!577039 tp_is_empty!24055)))

(declare-fun b!1023847 () Bool)

(declare-fun e!577038 () Bool)

(assert (=> b!1023847 (= e!577038 tp_is_empty!24055)))

(declare-fun condMapEmpty!37510 () Bool)

(declare-fun mapDefault!37510 () ValueCell!11324)

(assert (=> mapNonEmpty!37509 (= condMapEmpty!37510 (= mapRest!37509 ((as const (Array (_ BitVec 32) ValueCell!11324)) mapDefault!37510)))))

(assert (=> mapNonEmpty!37509 (= tp!72055 (and e!577038 mapRes!37510))))

(assert (= (and mapNonEmpty!37509 condMapEmpty!37510) mapIsEmpty!37510))

(assert (= (and mapNonEmpty!37509 (not condMapEmpty!37510)) mapNonEmpty!37510))

(assert (= (and mapNonEmpty!37510 ((_ is ValueCellFull!11324) mapValue!37510)) b!1023846))

(assert (= (and mapNonEmpty!37509 ((_ is ValueCellFull!11324) mapDefault!37510)) b!1023847))

(declare-fun m!941913 () Bool)

(assert (=> mapNonEmpty!37510 m!941913))

(check-sat (not b!1023827) (not b!1023817) (not b!1023845) (not mapNonEmpty!37510) (not d!122447) (not b!1023828) (not b_next!20335) (not bm!43201) b_and!32555 (not bm!43204) tp_is_empty!24055 (not b!1023816) (not bm!43207) (not b!1023841) (not b!1023805) (not b!1023842))
(check-sat b_and!32555 (not b_next!20335))
