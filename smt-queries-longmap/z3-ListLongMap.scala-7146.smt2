; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!90814 () Bool)

(assert start!90814)

(declare-fun b!1038155 () Bool)

(declare-fun b_free!20931 () Bool)

(declare-fun b_next!20931 () Bool)

(assert (=> b!1038155 (= b_free!20931 (not b_next!20931))))

(declare-fun tp!73951 () Bool)

(declare-fun b_and!33463 () Bool)

(assert (=> b!1038155 (= tp!73951 b_and!33463)))

(declare-fun b!1038145 () Bool)

(declare-fun e!587370 () Bool)

(declare-fun tp_is_empty!24651 () Bool)

(assert (=> b!1038145 (= e!587370 tp_is_empty!24651)))

(declare-fun b!1038146 () Bool)

(declare-fun e!587365 () Bool)

(assert (=> b!1038146 (= e!587365 tp_is_empty!24651)))

(declare-fun mapNonEmpty!38517 () Bool)

(declare-fun mapRes!38517 () Bool)

(declare-fun tp!73950 () Bool)

(assert (=> mapNonEmpty!38517 (= mapRes!38517 (and tp!73950 e!587365))))

(declare-datatypes ((V!37741 0))(
  ( (V!37742 (val!12376 Int)) )
))
(declare-datatypes ((ValueCell!11622 0))(
  ( (ValueCellFull!11622 (v!14961 V!37741)) (EmptyCell!11622) )
))
(declare-fun mapRest!38517 () (Array (_ BitVec 32) ValueCell!11622))

(declare-fun mapValue!38517 () ValueCell!11622)

(declare-fun mapKey!38517 () (_ BitVec 32))

(declare-datatypes ((array!65414 0))(
  ( (array!65415 (arr!31485 (Array (_ BitVec 32) (_ BitVec 64))) (size!32015 (_ BitVec 32))) )
))
(declare-datatypes ((array!65416 0))(
  ( (array!65417 (arr!31486 (Array (_ BitVec 32) ValueCell!11622)) (size!32016 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5838 0))(
  ( (LongMapFixedSize!5839 (defaultEntry!6301 Int) (mask!30234 (_ BitVec 32)) (extraKeys!6029 (_ BitVec 32)) (zeroValue!6135 V!37741) (minValue!6135 V!37741) (_size!2974 (_ BitVec 32)) (_keys!11501 array!65414) (_values!6324 array!65416) (_vacant!2974 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5838)

(assert (=> mapNonEmpty!38517 (= (arr!31486 (_values!6324 thiss!1427)) (store mapRest!38517 mapKey!38517 mapValue!38517))))

(declare-fun b!1038147 () Bool)

(declare-fun res!692562 () Bool)

(declare-fun e!587369 () Bool)

(assert (=> b!1038147 (=> res!692562 e!587369)))

(declare-datatypes ((List!21933 0))(
  ( (Nil!21930) (Cons!21929 (h!23132 (_ BitVec 64)) (t!31147 List!21933)) )
))
(declare-fun contains!6034 (List!21933 (_ BitVec 64)) Bool)

(assert (=> b!1038147 (= res!692562 (contains!6034 Nil!21930 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1038148 () Bool)

(declare-datatypes ((SeekEntryResult!9767 0))(
  ( (MissingZero!9767 (index!41439 (_ BitVec 32))) (Found!9767 (index!41440 (_ BitVec 32))) (Intermediate!9767 (undefined!10579 Bool) (index!41441 (_ BitVec 32)) (x!92630 (_ BitVec 32))) (Undefined!9767) (MissingVacant!9767 (index!41442 (_ BitVec 32))) )
))
(declare-fun lt!457663 () SeekEntryResult!9767)

(assert (=> b!1038148 (= e!587369 (and (bvsge (index!41440 lt!457663) #b00000000000000000000000000000000) (bvslt (index!41440 lt!457663) (size!32015 (_keys!11501 thiss!1427)))))))

(declare-fun b!1038149 () Bool)

(declare-fun e!587364 () Bool)

(assert (=> b!1038149 (= e!587364 (not e!587369))))

(declare-fun res!692567 () Bool)

(assert (=> b!1038149 (=> res!692567 e!587369)))

(assert (=> b!1038149 (= res!692567 (or (bvsge (size!32015 (_keys!11501 thiss!1427)) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!32015 (_keys!11501 thiss!1427)))))))

(declare-fun arrayCountValidKeys!0 (array!65414 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1038149 (= (arrayCountValidKeys!0 (array!65415 (store (arr!31485 (_keys!11501 thiss!1427)) (index!41440 lt!457663) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32015 (_keys!11501 thiss!1427))) #b00000000000000000000000000000000 (size!32015 (_keys!11501 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11501 thiss!1427) #b00000000000000000000000000000000 (size!32015 (_keys!11501 thiss!1427))) #b00000000000000000000000000000001))))

(declare-datatypes ((Unit!33971 0))(
  ( (Unit!33972) )
))
(declare-fun lt!457664 () Unit!33971)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!65414 (_ BitVec 32) (_ BitVec 64)) Unit!33971)

(assert (=> b!1038149 (= lt!457664 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11501 thiss!1427) (index!41440 lt!457663) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1038150 () Bool)

(declare-fun e!587367 () Bool)

(assert (=> b!1038150 (= e!587367 e!587364)))

(declare-fun res!692563 () Bool)

(assert (=> b!1038150 (=> (not res!692563) (not e!587364))))

(get-info :version)

(assert (=> b!1038150 (= res!692563 ((_ is Found!9767) lt!457663))))

(declare-fun key!909 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!65414 (_ BitVec 32)) SeekEntryResult!9767)

(assert (=> b!1038150 (= lt!457663 (seekEntry!0 key!909 (_keys!11501 thiss!1427) (mask!30234 thiss!1427)))))

(declare-fun b!1038151 () Bool)

(declare-fun res!692568 () Bool)

(assert (=> b!1038151 (=> res!692568 e!587369)))

(declare-fun noDuplicate!1481 (List!21933) Bool)

(assert (=> b!1038151 (= res!692568 (not (noDuplicate!1481 Nil!21930)))))

(declare-fun b!1038152 () Bool)

(declare-fun res!692566 () Bool)

(assert (=> b!1038152 (=> (not res!692566) (not e!587367))))

(assert (=> b!1038152 (= res!692566 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1038153 () Bool)

(declare-fun res!692569 () Bool)

(assert (=> b!1038153 (=> res!692569 e!587369)))

(declare-fun arrayNoDuplicates!0 (array!65414 (_ BitVec 32) List!21933) Bool)

(assert (=> b!1038153 (= res!692569 (not (arrayNoDuplicates!0 (_keys!11501 thiss!1427) #b00000000000000000000000000000000 Nil!21930)))))

(declare-fun mapIsEmpty!38517 () Bool)

(assert (=> mapIsEmpty!38517 mapRes!38517))

(declare-fun res!692564 () Bool)

(assert (=> start!90814 (=> (not res!692564) (not e!587367))))

(declare-fun valid!2199 (LongMapFixedSize!5838) Bool)

(assert (=> start!90814 (= res!692564 (valid!2199 thiss!1427))))

(assert (=> start!90814 e!587367))

(declare-fun e!587366 () Bool)

(assert (=> start!90814 e!587366))

(assert (=> start!90814 true))

(declare-fun b!1038154 () Bool)

(declare-fun e!587371 () Bool)

(assert (=> b!1038154 (= e!587371 (and e!587370 mapRes!38517))))

(declare-fun condMapEmpty!38517 () Bool)

(declare-fun mapDefault!38517 () ValueCell!11622)

(assert (=> b!1038154 (= condMapEmpty!38517 (= (arr!31486 (_values!6324 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11622)) mapDefault!38517)))))

(declare-fun array_inv!24345 (array!65414) Bool)

(declare-fun array_inv!24346 (array!65416) Bool)

(assert (=> b!1038155 (= e!587366 (and tp!73951 tp_is_empty!24651 (array_inv!24345 (_keys!11501 thiss!1427)) (array_inv!24346 (_values!6324 thiss!1427)) e!587371))))

(declare-fun b!1038156 () Bool)

(declare-fun res!692565 () Bool)

(assert (=> b!1038156 (=> res!692565 e!587369)))

(assert (=> b!1038156 (= res!692565 (contains!6034 Nil!21930 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!90814 res!692564) b!1038152))

(assert (= (and b!1038152 res!692566) b!1038150))

(assert (= (and b!1038150 res!692563) b!1038149))

(assert (= (and b!1038149 (not res!692567)) b!1038151))

(assert (= (and b!1038151 (not res!692568)) b!1038156))

(assert (= (and b!1038156 (not res!692565)) b!1038147))

(assert (= (and b!1038147 (not res!692562)) b!1038153))

(assert (= (and b!1038153 (not res!692569)) b!1038148))

(assert (= (and b!1038154 condMapEmpty!38517) mapIsEmpty!38517))

(assert (= (and b!1038154 (not condMapEmpty!38517)) mapNonEmpty!38517))

(assert (= (and mapNonEmpty!38517 ((_ is ValueCellFull!11622) mapValue!38517)) b!1038146))

(assert (= (and b!1038154 ((_ is ValueCellFull!11622) mapDefault!38517)) b!1038145))

(assert (= b!1038155 b!1038154))

(assert (= start!90814 b!1038155))

(declare-fun m!958163 () Bool)

(assert (=> b!1038151 m!958163))

(declare-fun m!958165 () Bool)

(assert (=> b!1038155 m!958165))

(declare-fun m!958167 () Bool)

(assert (=> b!1038155 m!958167))

(declare-fun m!958169 () Bool)

(assert (=> b!1038150 m!958169))

(declare-fun m!958171 () Bool)

(assert (=> b!1038153 m!958171))

(declare-fun m!958173 () Bool)

(assert (=> start!90814 m!958173))

(declare-fun m!958175 () Bool)

(assert (=> mapNonEmpty!38517 m!958175))

(declare-fun m!958177 () Bool)

(assert (=> b!1038156 m!958177))

(declare-fun m!958179 () Bool)

(assert (=> b!1038149 m!958179))

(declare-fun m!958181 () Bool)

(assert (=> b!1038149 m!958181))

(declare-fun m!958183 () Bool)

(assert (=> b!1038149 m!958183))

(declare-fun m!958185 () Bool)

(assert (=> b!1038149 m!958185))

(declare-fun m!958187 () Bool)

(assert (=> b!1038147 m!958187))

(check-sat (not b!1038149) (not b!1038153) b_and!33463 (not b!1038151) (not b!1038147) (not b!1038155) (not b!1038156) (not b!1038150) (not b_next!20931) (not start!90814) tp_is_empty!24651 (not mapNonEmpty!38517))
(check-sat b_and!33463 (not b_next!20931))
(get-model)

(declare-fun d!125307 () Bool)

(declare-fun lt!457673 () (_ BitVec 32))

(assert (=> d!125307 (and (bvsge lt!457673 #b00000000000000000000000000000000) (bvsle lt!457673 (bvsub (size!32015 (array!65415 (store (arr!31485 (_keys!11501 thiss!1427)) (index!41440 lt!457663) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32015 (_keys!11501 thiss!1427)))) #b00000000000000000000000000000000)))))

(declare-fun e!587400 () (_ BitVec 32))

(assert (=> d!125307 (= lt!457673 e!587400)))

(declare-fun c!105183 () Bool)

(assert (=> d!125307 (= c!105183 (bvsge #b00000000000000000000000000000000 (size!32015 (_keys!11501 thiss!1427))))))

(assert (=> d!125307 (and (bvsle #b00000000000000000000000000000000 (size!32015 (_keys!11501 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!32015 (_keys!11501 thiss!1427)) (size!32015 (array!65415 (store (arr!31485 (_keys!11501 thiss!1427)) (index!41440 lt!457663) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32015 (_keys!11501 thiss!1427))))))))

(assert (=> d!125307 (= (arrayCountValidKeys!0 (array!65415 (store (arr!31485 (_keys!11501 thiss!1427)) (index!41440 lt!457663) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32015 (_keys!11501 thiss!1427))) #b00000000000000000000000000000000 (size!32015 (_keys!11501 thiss!1427))) lt!457673)))

(declare-fun b!1038201 () Bool)

(assert (=> b!1038201 (= e!587400 #b00000000000000000000000000000000)))

(declare-fun bm!43934 () Bool)

(declare-fun call!43937 () (_ BitVec 32))

(assert (=> bm!43934 (= call!43937 (arrayCountValidKeys!0 (array!65415 (store (arr!31485 (_keys!11501 thiss!1427)) (index!41440 lt!457663) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32015 (_keys!11501 thiss!1427))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32015 (_keys!11501 thiss!1427))))))

(declare-fun b!1038202 () Bool)

(declare-fun e!587401 () (_ BitVec 32))

(assert (=> b!1038202 (= e!587400 e!587401)))

(declare-fun c!105184 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1038202 (= c!105184 (validKeyInArray!0 (select (arr!31485 (array!65415 (store (arr!31485 (_keys!11501 thiss!1427)) (index!41440 lt!457663) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32015 (_keys!11501 thiss!1427)))) #b00000000000000000000000000000000)))))

(declare-fun b!1038203 () Bool)

(assert (=> b!1038203 (= e!587401 (bvadd #b00000000000000000000000000000001 call!43937))))

(declare-fun b!1038204 () Bool)

(assert (=> b!1038204 (= e!587401 call!43937)))

(assert (= (and d!125307 c!105183) b!1038201))

(assert (= (and d!125307 (not c!105183)) b!1038202))

(assert (= (and b!1038202 c!105184) b!1038203))

(assert (= (and b!1038202 (not c!105184)) b!1038204))

(assert (= (or b!1038203 b!1038204) bm!43934))

(declare-fun m!958215 () Bool)

(assert (=> bm!43934 m!958215))

(declare-fun m!958217 () Bool)

(assert (=> b!1038202 m!958217))

(assert (=> b!1038202 m!958217))

(declare-fun m!958219 () Bool)

(assert (=> b!1038202 m!958219))

(assert (=> b!1038149 d!125307))

(declare-fun d!125309 () Bool)

(declare-fun lt!457674 () (_ BitVec 32))

(assert (=> d!125309 (and (bvsge lt!457674 #b00000000000000000000000000000000) (bvsle lt!457674 (bvsub (size!32015 (_keys!11501 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun e!587402 () (_ BitVec 32))

(assert (=> d!125309 (= lt!457674 e!587402)))

(declare-fun c!105185 () Bool)

(assert (=> d!125309 (= c!105185 (bvsge #b00000000000000000000000000000000 (size!32015 (_keys!11501 thiss!1427))))))

(assert (=> d!125309 (and (bvsle #b00000000000000000000000000000000 (size!32015 (_keys!11501 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!32015 (_keys!11501 thiss!1427)) (size!32015 (_keys!11501 thiss!1427))))))

(assert (=> d!125309 (= (arrayCountValidKeys!0 (_keys!11501 thiss!1427) #b00000000000000000000000000000000 (size!32015 (_keys!11501 thiss!1427))) lt!457674)))

(declare-fun b!1038205 () Bool)

(assert (=> b!1038205 (= e!587402 #b00000000000000000000000000000000)))

(declare-fun bm!43935 () Bool)

(declare-fun call!43938 () (_ BitVec 32))

(assert (=> bm!43935 (= call!43938 (arrayCountValidKeys!0 (_keys!11501 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32015 (_keys!11501 thiss!1427))))))

(declare-fun b!1038206 () Bool)

(declare-fun e!587403 () (_ BitVec 32))

(assert (=> b!1038206 (= e!587402 e!587403)))

(declare-fun c!105186 () Bool)

(assert (=> b!1038206 (= c!105186 (validKeyInArray!0 (select (arr!31485 (_keys!11501 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1038207 () Bool)

(assert (=> b!1038207 (= e!587403 (bvadd #b00000000000000000000000000000001 call!43938))))

(declare-fun b!1038208 () Bool)

(assert (=> b!1038208 (= e!587403 call!43938)))

(assert (= (and d!125309 c!105185) b!1038205))

(assert (= (and d!125309 (not c!105185)) b!1038206))

(assert (= (and b!1038206 c!105186) b!1038207))

(assert (= (and b!1038206 (not c!105186)) b!1038208))

(assert (= (or b!1038207 b!1038208) bm!43935))

(declare-fun m!958221 () Bool)

(assert (=> bm!43935 m!958221))

(declare-fun m!958223 () Bool)

(assert (=> b!1038206 m!958223))

(assert (=> b!1038206 m!958223))

(declare-fun m!958225 () Bool)

(assert (=> b!1038206 m!958225))

(assert (=> b!1038149 d!125309))

(declare-fun b!1038219 () Bool)

(declare-fun e!587409 () Bool)

(assert (=> b!1038219 (= e!587409 (bvslt (size!32015 (_keys!11501 thiss!1427)) #b01111111111111111111111111111111))))

(declare-fun b!1038220 () Bool)

(declare-fun e!587408 () Bool)

(assert (=> b!1038220 (= e!587408 (= (arrayCountValidKeys!0 (array!65415 (store (arr!31485 (_keys!11501 thiss!1427)) (index!41440 lt!457663) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32015 (_keys!11501 thiss!1427))) #b00000000000000000000000000000000 (size!32015 (_keys!11501 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11501 thiss!1427) #b00000000000000000000000000000000 (size!32015 (_keys!11501 thiss!1427))) #b00000000000000000000000000000001)))))

(declare-fun b!1038217 () Bool)

(declare-fun res!692604 () Bool)

(assert (=> b!1038217 (=> (not res!692604) (not e!587409))))

(assert (=> b!1038217 (= res!692604 (validKeyInArray!0 (select (arr!31485 (_keys!11501 thiss!1427)) (index!41440 lt!457663))))))

(declare-fun d!125311 () Bool)

(assert (=> d!125311 e!587408))

(declare-fun res!692602 () Bool)

(assert (=> d!125311 (=> (not res!692602) (not e!587408))))

(assert (=> d!125311 (= res!692602 (and (bvsge (index!41440 lt!457663) #b00000000000000000000000000000000) (bvslt (index!41440 lt!457663) (size!32015 (_keys!11501 thiss!1427)))))))

(declare-fun lt!457677 () Unit!33971)

(declare-fun choose!82 (array!65414 (_ BitVec 32) (_ BitVec 64)) Unit!33971)

(assert (=> d!125311 (= lt!457677 (choose!82 (_keys!11501 thiss!1427) (index!41440 lt!457663) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!125311 e!587409))

(declare-fun res!692605 () Bool)

(assert (=> d!125311 (=> (not res!692605) (not e!587409))))

(assert (=> d!125311 (= res!692605 (and (bvsge (index!41440 lt!457663) #b00000000000000000000000000000000) (bvslt (index!41440 lt!457663) (size!32015 (_keys!11501 thiss!1427)))))))

(assert (=> d!125311 (= (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11501 thiss!1427) (index!41440 lt!457663) #b1000000000000000000000000000000000000000000000000000000000000000) lt!457677)))

(declare-fun b!1038218 () Bool)

(declare-fun res!692603 () Bool)

(assert (=> b!1038218 (=> (not res!692603) (not e!587409))))

(assert (=> b!1038218 (= res!692603 (not (validKeyInArray!0 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!125311 res!692605) b!1038217))

(assert (= (and b!1038217 res!692604) b!1038218))

(assert (= (and b!1038218 res!692603) b!1038219))

(assert (= (and d!125311 res!692602) b!1038220))

(assert (=> b!1038220 m!958179))

(assert (=> b!1038220 m!958181))

(assert (=> b!1038220 m!958183))

(declare-fun m!958227 () Bool)

(assert (=> b!1038217 m!958227))

(assert (=> b!1038217 m!958227))

(declare-fun m!958229 () Bool)

(assert (=> b!1038217 m!958229))

(declare-fun m!958231 () Bool)

(assert (=> d!125311 m!958231))

(declare-fun m!958233 () Bool)

(assert (=> b!1038218 m!958233))

(assert (=> b!1038149 d!125311))

(declare-fun b!1038233 () Bool)

(declare-fun c!105195 () Bool)

(declare-fun lt!457686 () (_ BitVec 64))

(assert (=> b!1038233 (= c!105195 (= lt!457686 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!587417 () SeekEntryResult!9767)

(declare-fun e!587416 () SeekEntryResult!9767)

(assert (=> b!1038233 (= e!587417 e!587416)))

(declare-fun b!1038234 () Bool)

(declare-fun e!587418 () SeekEntryResult!9767)

(assert (=> b!1038234 (= e!587418 e!587417)))

(declare-fun lt!457688 () SeekEntryResult!9767)

(assert (=> b!1038234 (= lt!457686 (select (arr!31485 (_keys!11501 thiss!1427)) (index!41441 lt!457688)))))

(declare-fun c!105194 () Bool)

(assert (=> b!1038234 (= c!105194 (= lt!457686 key!909))))

(declare-fun b!1038235 () Bool)

(declare-fun lt!457689 () SeekEntryResult!9767)

(assert (=> b!1038235 (= e!587416 (ite ((_ is MissingVacant!9767) lt!457689) (MissingZero!9767 (index!41442 lt!457689)) lt!457689))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65414 (_ BitVec 32)) SeekEntryResult!9767)

(assert (=> b!1038235 (= lt!457689 (seekKeyOrZeroReturnVacant!0 (x!92630 lt!457688) (index!41441 lt!457688) (index!41441 lt!457688) key!909 (_keys!11501 thiss!1427) (mask!30234 thiss!1427)))))

(declare-fun b!1038236 () Bool)

(assert (=> b!1038236 (= e!587416 (MissingZero!9767 (index!41441 lt!457688)))))

(declare-fun d!125313 () Bool)

(declare-fun lt!457687 () SeekEntryResult!9767)

(assert (=> d!125313 (and (or ((_ is MissingVacant!9767) lt!457687) (not ((_ is Found!9767) lt!457687)) (and (bvsge (index!41440 lt!457687) #b00000000000000000000000000000000) (bvslt (index!41440 lt!457687) (size!32015 (_keys!11501 thiss!1427))))) (not ((_ is MissingVacant!9767) lt!457687)) (or (not ((_ is Found!9767) lt!457687)) (= (select (arr!31485 (_keys!11501 thiss!1427)) (index!41440 lt!457687)) key!909)))))

(assert (=> d!125313 (= lt!457687 e!587418)))

(declare-fun c!105193 () Bool)

(assert (=> d!125313 (= c!105193 (and ((_ is Intermediate!9767) lt!457688) (undefined!10579 lt!457688)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65414 (_ BitVec 32)) SeekEntryResult!9767)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!125313 (= lt!457688 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!909 (mask!30234 thiss!1427)) key!909 (_keys!11501 thiss!1427) (mask!30234 thiss!1427)))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!125313 (validMask!0 (mask!30234 thiss!1427))))

(assert (=> d!125313 (= (seekEntry!0 key!909 (_keys!11501 thiss!1427) (mask!30234 thiss!1427)) lt!457687)))

(declare-fun b!1038237 () Bool)

(assert (=> b!1038237 (= e!587418 Undefined!9767)))

(declare-fun b!1038238 () Bool)

(assert (=> b!1038238 (= e!587417 (Found!9767 (index!41441 lt!457688)))))

(assert (= (and d!125313 c!105193) b!1038237))

(assert (= (and d!125313 (not c!105193)) b!1038234))

(assert (= (and b!1038234 c!105194) b!1038238))

(assert (= (and b!1038234 (not c!105194)) b!1038233))

(assert (= (and b!1038233 c!105195) b!1038236))

(assert (= (and b!1038233 (not c!105195)) b!1038235))

(declare-fun m!958235 () Bool)

(assert (=> b!1038234 m!958235))

(declare-fun m!958237 () Bool)

(assert (=> b!1038235 m!958237))

(declare-fun m!958239 () Bool)

(assert (=> d!125313 m!958239))

(declare-fun m!958241 () Bool)

(assert (=> d!125313 m!958241))

(assert (=> d!125313 m!958241))

(declare-fun m!958243 () Bool)

(assert (=> d!125313 m!958243))

(declare-fun m!958245 () Bool)

(assert (=> d!125313 m!958245))

(assert (=> b!1038150 d!125313))

(declare-fun d!125315 () Bool)

(assert (=> d!125315 (= (array_inv!24345 (_keys!11501 thiss!1427)) (bvsge (size!32015 (_keys!11501 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1038155 d!125315))

(declare-fun d!125317 () Bool)

(assert (=> d!125317 (= (array_inv!24346 (_values!6324 thiss!1427)) (bvsge (size!32016 (_values!6324 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1038155 d!125317))

(declare-fun d!125319 () Bool)

(declare-fun res!692610 () Bool)

(declare-fun e!587423 () Bool)

(assert (=> d!125319 (=> res!692610 e!587423)))

(assert (=> d!125319 (= res!692610 ((_ is Nil!21930) Nil!21930))))

(assert (=> d!125319 (= (noDuplicate!1481 Nil!21930) e!587423)))

(declare-fun b!1038243 () Bool)

(declare-fun e!587424 () Bool)

(assert (=> b!1038243 (= e!587423 e!587424)))

(declare-fun res!692611 () Bool)

(assert (=> b!1038243 (=> (not res!692611) (not e!587424))))

(assert (=> b!1038243 (= res!692611 (not (contains!6034 (t!31147 Nil!21930) (h!23132 Nil!21930))))))

(declare-fun b!1038244 () Bool)

(assert (=> b!1038244 (= e!587424 (noDuplicate!1481 (t!31147 Nil!21930)))))

(assert (= (and d!125319 (not res!692610)) b!1038243))

(assert (= (and b!1038243 res!692611) b!1038244))

(declare-fun m!958247 () Bool)

(assert (=> b!1038243 m!958247))

(declare-fun m!958249 () Bool)

(assert (=> b!1038244 m!958249))

(assert (=> b!1038151 d!125319))

(declare-fun d!125321 () Bool)

(declare-fun res!692618 () Bool)

(declare-fun e!587427 () Bool)

(assert (=> d!125321 (=> (not res!692618) (not e!587427))))

(declare-fun simpleValid!421 (LongMapFixedSize!5838) Bool)

(assert (=> d!125321 (= res!692618 (simpleValid!421 thiss!1427))))

(assert (=> d!125321 (= (valid!2199 thiss!1427) e!587427)))

(declare-fun b!1038251 () Bool)

(declare-fun res!692619 () Bool)

(assert (=> b!1038251 (=> (not res!692619) (not e!587427))))

(assert (=> b!1038251 (= res!692619 (= (arrayCountValidKeys!0 (_keys!11501 thiss!1427) #b00000000000000000000000000000000 (size!32015 (_keys!11501 thiss!1427))) (_size!2974 thiss!1427)))))

(declare-fun b!1038252 () Bool)

(declare-fun res!692620 () Bool)

(assert (=> b!1038252 (=> (not res!692620) (not e!587427))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!65414 (_ BitVec 32)) Bool)

(assert (=> b!1038252 (= res!692620 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11501 thiss!1427) (mask!30234 thiss!1427)))))

(declare-fun b!1038253 () Bool)

(assert (=> b!1038253 (= e!587427 (arrayNoDuplicates!0 (_keys!11501 thiss!1427) #b00000000000000000000000000000000 Nil!21930))))

(assert (= (and d!125321 res!692618) b!1038251))

(assert (= (and b!1038251 res!692619) b!1038252))

(assert (= (and b!1038252 res!692620) b!1038253))

(declare-fun m!958251 () Bool)

(assert (=> d!125321 m!958251))

(assert (=> b!1038251 m!958183))

(declare-fun m!958253 () Bool)

(assert (=> b!1038252 m!958253))

(assert (=> b!1038253 m!958171))

(assert (=> start!90814 d!125321))

(declare-fun d!125323 () Bool)

(declare-fun lt!457692 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!518 (List!21933) (InoxSet (_ BitVec 64)))

(assert (=> d!125323 (= lt!457692 (select (content!518 Nil!21930) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!587433 () Bool)

(assert (=> d!125323 (= lt!457692 e!587433)))

(declare-fun res!692626 () Bool)

(assert (=> d!125323 (=> (not res!692626) (not e!587433))))

(assert (=> d!125323 (= res!692626 ((_ is Cons!21929) Nil!21930))))

(assert (=> d!125323 (= (contains!6034 Nil!21930 #b0000000000000000000000000000000000000000000000000000000000000000) lt!457692)))

(declare-fun b!1038258 () Bool)

(declare-fun e!587432 () Bool)

(assert (=> b!1038258 (= e!587433 e!587432)))

(declare-fun res!692625 () Bool)

(assert (=> b!1038258 (=> res!692625 e!587432)))

(assert (=> b!1038258 (= res!692625 (= (h!23132 Nil!21930) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1038259 () Bool)

(assert (=> b!1038259 (= e!587432 (contains!6034 (t!31147 Nil!21930) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!125323 res!692626) b!1038258))

(assert (= (and b!1038258 (not res!692625)) b!1038259))

(declare-fun m!958255 () Bool)

(assert (=> d!125323 m!958255))

(declare-fun m!958257 () Bool)

(assert (=> d!125323 m!958257))

(declare-fun m!958259 () Bool)

(assert (=> b!1038259 m!958259))

(assert (=> b!1038156 d!125323))

(declare-fun d!125325 () Bool)

(declare-fun lt!457693 () Bool)

(assert (=> d!125325 (= lt!457693 (select (content!518 Nil!21930) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!587435 () Bool)

(assert (=> d!125325 (= lt!457693 e!587435)))

(declare-fun res!692628 () Bool)

(assert (=> d!125325 (=> (not res!692628) (not e!587435))))

(assert (=> d!125325 (= res!692628 ((_ is Cons!21929) Nil!21930))))

(assert (=> d!125325 (= (contains!6034 Nil!21930 #b1000000000000000000000000000000000000000000000000000000000000000) lt!457693)))

(declare-fun b!1038260 () Bool)

(declare-fun e!587434 () Bool)

(assert (=> b!1038260 (= e!587435 e!587434)))

(declare-fun res!692627 () Bool)

(assert (=> b!1038260 (=> res!692627 e!587434)))

(assert (=> b!1038260 (= res!692627 (= (h!23132 Nil!21930) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1038261 () Bool)

(assert (=> b!1038261 (= e!587434 (contains!6034 (t!31147 Nil!21930) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!125325 res!692628) b!1038260))

(assert (= (and b!1038260 (not res!692627)) b!1038261))

(assert (=> d!125325 m!958255))

(declare-fun m!958261 () Bool)

(assert (=> d!125325 m!958261))

(declare-fun m!958263 () Bool)

(assert (=> b!1038261 m!958263))

(assert (=> b!1038147 d!125325))

(declare-fun b!1038272 () Bool)

(declare-fun e!587445 () Bool)

(declare-fun call!43941 () Bool)

(assert (=> b!1038272 (= e!587445 call!43941)))

(declare-fun b!1038273 () Bool)

(declare-fun e!587447 () Bool)

(assert (=> b!1038273 (= e!587447 e!587445)))

(declare-fun c!105198 () Bool)

(assert (=> b!1038273 (= c!105198 (validKeyInArray!0 (select (arr!31485 (_keys!11501 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1038274 () Bool)

(assert (=> b!1038274 (= e!587445 call!43941)))

(declare-fun b!1038275 () Bool)

(declare-fun e!587446 () Bool)

(assert (=> b!1038275 (= e!587446 (contains!6034 Nil!21930 (select (arr!31485 (_keys!11501 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun d!125327 () Bool)

(declare-fun res!692635 () Bool)

(declare-fun e!587444 () Bool)

(assert (=> d!125327 (=> res!692635 e!587444)))

(assert (=> d!125327 (= res!692635 (bvsge #b00000000000000000000000000000000 (size!32015 (_keys!11501 thiss!1427))))))

(assert (=> d!125327 (= (arrayNoDuplicates!0 (_keys!11501 thiss!1427) #b00000000000000000000000000000000 Nil!21930) e!587444)))

(declare-fun bm!43938 () Bool)

(assert (=> bm!43938 (= call!43941 (arrayNoDuplicates!0 (_keys!11501 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!105198 (Cons!21929 (select (arr!31485 (_keys!11501 thiss!1427)) #b00000000000000000000000000000000) Nil!21930) Nil!21930)))))

(declare-fun b!1038276 () Bool)

(assert (=> b!1038276 (= e!587444 e!587447)))

(declare-fun res!692637 () Bool)

(assert (=> b!1038276 (=> (not res!692637) (not e!587447))))

(assert (=> b!1038276 (= res!692637 (not e!587446))))

(declare-fun res!692636 () Bool)

(assert (=> b!1038276 (=> (not res!692636) (not e!587446))))

(assert (=> b!1038276 (= res!692636 (validKeyInArray!0 (select (arr!31485 (_keys!11501 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (= (and d!125327 (not res!692635)) b!1038276))

(assert (= (and b!1038276 res!692636) b!1038275))

(assert (= (and b!1038276 res!692637) b!1038273))

(assert (= (and b!1038273 c!105198) b!1038274))

(assert (= (and b!1038273 (not c!105198)) b!1038272))

(assert (= (or b!1038274 b!1038272) bm!43938))

(assert (=> b!1038273 m!958223))

(assert (=> b!1038273 m!958223))

(assert (=> b!1038273 m!958225))

(assert (=> b!1038275 m!958223))

(assert (=> b!1038275 m!958223))

(declare-fun m!958265 () Bool)

(assert (=> b!1038275 m!958265))

(assert (=> bm!43938 m!958223))

(declare-fun m!958267 () Bool)

(assert (=> bm!43938 m!958267))

(assert (=> b!1038276 m!958223))

(assert (=> b!1038276 m!958223))

(assert (=> b!1038276 m!958225))

(assert (=> b!1038153 d!125327))

(declare-fun mapNonEmpty!38523 () Bool)

(declare-fun mapRes!38523 () Bool)

(declare-fun tp!73960 () Bool)

(declare-fun e!587452 () Bool)

(assert (=> mapNonEmpty!38523 (= mapRes!38523 (and tp!73960 e!587452))))

(declare-fun mapValue!38523 () ValueCell!11622)

(declare-fun mapKey!38523 () (_ BitVec 32))

(declare-fun mapRest!38523 () (Array (_ BitVec 32) ValueCell!11622))

(assert (=> mapNonEmpty!38523 (= mapRest!38517 (store mapRest!38523 mapKey!38523 mapValue!38523))))

(declare-fun b!1038284 () Bool)

(declare-fun e!587453 () Bool)

(assert (=> b!1038284 (= e!587453 tp_is_empty!24651)))

(declare-fun mapIsEmpty!38523 () Bool)

(assert (=> mapIsEmpty!38523 mapRes!38523))

(declare-fun b!1038283 () Bool)

(assert (=> b!1038283 (= e!587452 tp_is_empty!24651)))

(declare-fun condMapEmpty!38523 () Bool)

(declare-fun mapDefault!38523 () ValueCell!11622)

(assert (=> mapNonEmpty!38517 (= condMapEmpty!38523 (= mapRest!38517 ((as const (Array (_ BitVec 32) ValueCell!11622)) mapDefault!38523)))))

(assert (=> mapNonEmpty!38517 (= tp!73950 (and e!587453 mapRes!38523))))

(assert (= (and mapNonEmpty!38517 condMapEmpty!38523) mapIsEmpty!38523))

(assert (= (and mapNonEmpty!38517 (not condMapEmpty!38523)) mapNonEmpty!38523))

(assert (= (and mapNonEmpty!38523 ((_ is ValueCellFull!11622) mapValue!38523)) b!1038283))

(assert (= (and mapNonEmpty!38517 ((_ is ValueCellFull!11622) mapDefault!38523)) b!1038284))

(declare-fun m!958269 () Bool)

(assert (=> mapNonEmpty!38523 m!958269))

(check-sat (not mapNonEmpty!38523) (not b!1038218) (not d!125313) (not b!1038244) (not b!1038253) (not bm!43938) b_and!33463 (not b!1038273) (not b!1038252) (not b!1038220) (not b_next!20931) tp_is_empty!24651 (not bm!43935) (not b!1038206) (not b!1038243) (not d!125323) (not bm!43934) (not b!1038275) (not d!125325) (not b!1038261) (not b!1038259) (not b!1038251) (not d!125321) (not b!1038276) (not b!1038217) (not b!1038235) (not d!125311) (not b!1038202))
(check-sat b_and!33463 (not b_next!20931))
