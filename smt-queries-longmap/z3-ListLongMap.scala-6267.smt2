; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!80118 () Bool)

(assert start!80118)

(declare-fun b!941518 () Bool)

(declare-fun b_free!17923 () Bool)

(declare-fun b_next!17923 () Bool)

(assert (=> b!941518 (= b_free!17923 (not b_next!17923))))

(declare-fun tp!62259 () Bool)

(declare-fun b_and!29309 () Bool)

(assert (=> b!941518 (= tp!62259 b_and!29309)))

(declare-fun b!941511 () Bool)

(declare-fun res!632891 () Bool)

(declare-fun e!529321 () Bool)

(assert (=> b!941511 (=> (not res!632891) (not e!529321))))

(declare-datatypes ((V!32207 0))(
  ( (V!32208 (val!10266 Int)) )
))
(declare-datatypes ((ValueCell!9734 0))(
  ( (ValueCellFull!9734 (v!12796 V!32207)) (EmptyCell!9734) )
))
(declare-datatypes ((array!56783 0))(
  ( (array!56784 (arr!27323 (Array (_ BitVec 32) ValueCell!9734)) (size!27788 (_ BitVec 32))) )
))
(declare-datatypes ((array!56785 0))(
  ( (array!56786 (arr!27324 (Array (_ BitVec 32) (_ BitVec 64))) (size!27789 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4618 0))(
  ( (LongMapFixedSize!4619 (defaultEntry!5600 Int) (mask!27174 (_ BitVec 32)) (extraKeys!5332 (_ BitVec 32)) (zeroValue!5436 V!32207) (minValue!5436 V!32207) (_size!2364 (_ BitVec 32)) (_keys!10455 array!56785) (_values!5623 array!56783) (_vacant!2364 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4618)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!941511 (= res!632891 (validMask!0 (mask!27174 thiss!1141)))))

(declare-fun b!941512 () Bool)

(declare-fun res!632893 () Bool)

(assert (=> b!941512 (=> (not res!632893) (not e!529321))))

(declare-fun key!756 () (_ BitVec 64))

(get-info :version)

(declare-datatypes ((SeekEntryResult!9026 0))(
  ( (MissingZero!9026 (index!38475 (_ BitVec 32))) (Found!9026 (index!38476 (_ BitVec 32))) (Intermediate!9026 (undefined!9838 Bool) (index!38477 (_ BitVec 32)) (x!80828 (_ BitVec 32))) (Undefined!9026) (MissingVacant!9026 (index!38478 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!56785 (_ BitVec 32)) SeekEntryResult!9026)

(assert (=> b!941512 (= res!632893 (not ((_ is Found!9026) (seekEntry!0 key!756 (_keys!10455 thiss!1141) (mask!27174 thiss!1141)))))))

(declare-fun b!941513 () Bool)

(declare-fun res!632890 () Bool)

(assert (=> b!941513 (=> (not res!632890) (not e!529321))))

(assert (=> b!941513 (= res!632890 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!941514 () Bool)

(declare-fun e!529318 () Bool)

(declare-fun e!529317 () Bool)

(declare-fun mapRes!32451 () Bool)

(assert (=> b!941514 (= e!529318 (and e!529317 mapRes!32451))))

(declare-fun condMapEmpty!32451 () Bool)

(declare-fun mapDefault!32451 () ValueCell!9734)

(assert (=> b!941514 (= condMapEmpty!32451 (= (arr!27323 (_values!5623 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9734)) mapDefault!32451)))))

(declare-fun b!941515 () Bool)

(declare-fun e!529316 () Bool)

(declare-fun tp_is_empty!20431 () Bool)

(assert (=> b!941515 (= e!529316 tp_is_empty!20431)))

(declare-fun mapIsEmpty!32451 () Bool)

(assert (=> mapIsEmpty!32451 mapRes!32451))

(declare-fun res!632892 () Bool)

(assert (=> start!80118 (=> (not res!632892) (not e!529321))))

(declare-fun valid!1779 (LongMapFixedSize!4618) Bool)

(assert (=> start!80118 (= res!632892 (valid!1779 thiss!1141))))

(assert (=> start!80118 e!529321))

(declare-fun e!529320 () Bool)

(assert (=> start!80118 e!529320))

(assert (=> start!80118 true))

(declare-fun mapNonEmpty!32451 () Bool)

(declare-fun tp!62258 () Bool)

(assert (=> mapNonEmpty!32451 (= mapRes!32451 (and tp!62258 e!529316))))

(declare-fun mapRest!32451 () (Array (_ BitVec 32) ValueCell!9734))

(declare-fun mapKey!32451 () (_ BitVec 32))

(declare-fun mapValue!32451 () ValueCell!9734)

(assert (=> mapNonEmpty!32451 (= (arr!27323 (_values!5623 thiss!1141)) (store mapRest!32451 mapKey!32451 mapValue!32451))))

(declare-fun b!941516 () Bool)

(assert (=> b!941516 (= e!529317 tp_is_empty!20431)))

(declare-fun b!941517 () Bool)

(assert (=> b!941517 (= e!529321 (and (= (size!27788 (_values!5623 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27174 thiss!1141))) (= (size!27789 (_keys!10455 thiss!1141)) (size!27788 (_values!5623 thiss!1141))) (bvsge (mask!27174 thiss!1141) #b00000000000000000000000000000000) (bvslt (extraKeys!5332 thiss!1141) #b00000000000000000000000000000000)))))

(declare-fun array_inv!21302 (array!56785) Bool)

(declare-fun array_inv!21303 (array!56783) Bool)

(assert (=> b!941518 (= e!529320 (and tp!62259 tp_is_empty!20431 (array_inv!21302 (_keys!10455 thiss!1141)) (array_inv!21303 (_values!5623 thiss!1141)) e!529318))))

(assert (= (and start!80118 res!632892) b!941513))

(assert (= (and b!941513 res!632890) b!941512))

(assert (= (and b!941512 res!632893) b!941511))

(assert (= (and b!941511 res!632891) b!941517))

(assert (= (and b!941514 condMapEmpty!32451) mapIsEmpty!32451))

(assert (= (and b!941514 (not condMapEmpty!32451)) mapNonEmpty!32451))

(assert (= (and mapNonEmpty!32451 ((_ is ValueCellFull!9734) mapValue!32451)) b!941515))

(assert (= (and b!941514 ((_ is ValueCellFull!9734) mapDefault!32451)) b!941516))

(assert (= b!941518 b!941514))

(assert (= start!80118 b!941518))

(declare-fun m!875921 () Bool)

(assert (=> b!941511 m!875921))

(declare-fun m!875923 () Bool)

(assert (=> b!941518 m!875923))

(declare-fun m!875925 () Bool)

(assert (=> b!941518 m!875925))

(declare-fun m!875927 () Bool)

(assert (=> mapNonEmpty!32451 m!875927))

(declare-fun m!875929 () Bool)

(assert (=> b!941512 m!875929))

(declare-fun m!875931 () Bool)

(assert (=> start!80118 m!875931))

(check-sat (not b!941512) (not b_next!17923) (not start!80118) (not b!941518) b_and!29309 (not mapNonEmpty!32451) (not b!941511) tp_is_empty!20431)
(check-sat b_and!29309 (not b_next!17923))
(get-model)

(declare-fun d!113909 () Bool)

(assert (=> d!113909 (= (validMask!0 (mask!27174 thiss!1141)) (and (or (= (mask!27174 thiss!1141) #b00000000000000000000000000000111) (= (mask!27174 thiss!1141) #b00000000000000000000000000001111) (= (mask!27174 thiss!1141) #b00000000000000000000000000011111) (= (mask!27174 thiss!1141) #b00000000000000000000000000111111) (= (mask!27174 thiss!1141) #b00000000000000000000000001111111) (= (mask!27174 thiss!1141) #b00000000000000000000000011111111) (= (mask!27174 thiss!1141) #b00000000000000000000000111111111) (= (mask!27174 thiss!1141) #b00000000000000000000001111111111) (= (mask!27174 thiss!1141) #b00000000000000000000011111111111) (= (mask!27174 thiss!1141) #b00000000000000000000111111111111) (= (mask!27174 thiss!1141) #b00000000000000000001111111111111) (= (mask!27174 thiss!1141) #b00000000000000000011111111111111) (= (mask!27174 thiss!1141) #b00000000000000000111111111111111) (= (mask!27174 thiss!1141) #b00000000000000001111111111111111) (= (mask!27174 thiss!1141) #b00000000000000011111111111111111) (= (mask!27174 thiss!1141) #b00000000000000111111111111111111) (= (mask!27174 thiss!1141) #b00000000000001111111111111111111) (= (mask!27174 thiss!1141) #b00000000000011111111111111111111) (= (mask!27174 thiss!1141) #b00000000000111111111111111111111) (= (mask!27174 thiss!1141) #b00000000001111111111111111111111) (= (mask!27174 thiss!1141) #b00000000011111111111111111111111) (= (mask!27174 thiss!1141) #b00000000111111111111111111111111) (= (mask!27174 thiss!1141) #b00000001111111111111111111111111) (= (mask!27174 thiss!1141) #b00000011111111111111111111111111) (= (mask!27174 thiss!1141) #b00000111111111111111111111111111) (= (mask!27174 thiss!1141) #b00001111111111111111111111111111) (= (mask!27174 thiss!1141) #b00011111111111111111111111111111) (= (mask!27174 thiss!1141) #b00111111111111111111111111111111)) (bvsle (mask!27174 thiss!1141) #b00111111111111111111111111111111)))))

(assert (=> b!941511 d!113909))

(declare-fun b!941579 () Bool)

(declare-fun e!529365 () SeekEntryResult!9026)

(declare-fun e!529366 () SeekEntryResult!9026)

(assert (=> b!941579 (= e!529365 e!529366)))

(declare-fun lt!424803 () (_ BitVec 64))

(declare-fun lt!424805 () SeekEntryResult!9026)

(assert (=> b!941579 (= lt!424803 (select (arr!27324 (_keys!10455 thiss!1141)) (index!38477 lt!424805)))))

(declare-fun c!98065 () Bool)

(assert (=> b!941579 (= c!98065 (= lt!424803 key!756))))

(declare-fun d!113911 () Bool)

(declare-fun lt!424802 () SeekEntryResult!9026)

(assert (=> d!113911 (and (or ((_ is MissingVacant!9026) lt!424802) (not ((_ is Found!9026) lt!424802)) (and (bvsge (index!38476 lt!424802) #b00000000000000000000000000000000) (bvslt (index!38476 lt!424802) (size!27789 (_keys!10455 thiss!1141))))) (not ((_ is MissingVacant!9026) lt!424802)) (or (not ((_ is Found!9026) lt!424802)) (= (select (arr!27324 (_keys!10455 thiss!1141)) (index!38476 lt!424802)) key!756)))))

(assert (=> d!113911 (= lt!424802 e!529365)))

(declare-fun c!98066 () Bool)

(assert (=> d!113911 (= c!98066 (and ((_ is Intermediate!9026) lt!424805) (undefined!9838 lt!424805)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!56785 (_ BitVec 32)) SeekEntryResult!9026)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!113911 (= lt!424805 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!756 (mask!27174 thiss!1141)) key!756 (_keys!10455 thiss!1141) (mask!27174 thiss!1141)))))

(assert (=> d!113911 (validMask!0 (mask!27174 thiss!1141))))

(assert (=> d!113911 (= (seekEntry!0 key!756 (_keys!10455 thiss!1141) (mask!27174 thiss!1141)) lt!424802)))

(declare-fun b!941580 () Bool)

(assert (=> b!941580 (= e!529366 (Found!9026 (index!38477 lt!424805)))))

(declare-fun b!941581 () Bool)

(declare-fun e!529364 () SeekEntryResult!9026)

(declare-fun lt!424804 () SeekEntryResult!9026)

(assert (=> b!941581 (= e!529364 (ite ((_ is MissingVacant!9026) lt!424804) (MissingZero!9026 (index!38478 lt!424804)) lt!424804))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!56785 (_ BitVec 32)) SeekEntryResult!9026)

(assert (=> b!941581 (= lt!424804 (seekKeyOrZeroReturnVacant!0 (x!80828 lt!424805) (index!38477 lt!424805) (index!38477 lt!424805) key!756 (_keys!10455 thiss!1141) (mask!27174 thiss!1141)))))

(declare-fun b!941582 () Bool)

(declare-fun c!98064 () Bool)

(assert (=> b!941582 (= c!98064 (= lt!424803 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!941582 (= e!529366 e!529364)))

(declare-fun b!941583 () Bool)

(assert (=> b!941583 (= e!529365 Undefined!9026)))

(declare-fun b!941584 () Bool)

(assert (=> b!941584 (= e!529364 (MissingZero!9026 (index!38477 lt!424805)))))

(assert (= (and d!113911 c!98066) b!941583))

(assert (= (and d!113911 (not c!98066)) b!941579))

(assert (= (and b!941579 c!98065) b!941580))

(assert (= (and b!941579 (not c!98065)) b!941582))

(assert (= (and b!941582 c!98064) b!941584))

(assert (= (and b!941582 (not c!98064)) b!941581))

(declare-fun m!875957 () Bool)

(assert (=> b!941579 m!875957))

(declare-fun m!875959 () Bool)

(assert (=> d!113911 m!875959))

(declare-fun m!875961 () Bool)

(assert (=> d!113911 m!875961))

(assert (=> d!113911 m!875961))

(declare-fun m!875963 () Bool)

(assert (=> d!113911 m!875963))

(assert (=> d!113911 m!875921))

(declare-fun m!875965 () Bool)

(assert (=> b!941581 m!875965))

(assert (=> b!941512 d!113911))

(declare-fun d!113913 () Bool)

(declare-fun res!632924 () Bool)

(declare-fun e!529369 () Bool)

(assert (=> d!113913 (=> (not res!632924) (not e!529369))))

(declare-fun simpleValid!343 (LongMapFixedSize!4618) Bool)

(assert (=> d!113913 (= res!632924 (simpleValid!343 thiss!1141))))

(assert (=> d!113913 (= (valid!1779 thiss!1141) e!529369)))

(declare-fun b!941591 () Bool)

(declare-fun res!632925 () Bool)

(assert (=> b!941591 (=> (not res!632925) (not e!529369))))

(declare-fun arrayCountValidKeys!0 (array!56785 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!941591 (= res!632925 (= (arrayCountValidKeys!0 (_keys!10455 thiss!1141) #b00000000000000000000000000000000 (size!27789 (_keys!10455 thiss!1141))) (_size!2364 thiss!1141)))))

(declare-fun b!941592 () Bool)

(declare-fun res!632926 () Bool)

(assert (=> b!941592 (=> (not res!632926) (not e!529369))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56785 (_ BitVec 32)) Bool)

(assert (=> b!941592 (= res!632926 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10455 thiss!1141) (mask!27174 thiss!1141)))))

(declare-fun b!941593 () Bool)

(declare-datatypes ((List!19219 0))(
  ( (Nil!19216) (Cons!19215 (h!20363 (_ BitVec 64)) (t!27525 List!19219)) )
))
(declare-fun arrayNoDuplicates!0 (array!56785 (_ BitVec 32) List!19219) Bool)

(assert (=> b!941593 (= e!529369 (arrayNoDuplicates!0 (_keys!10455 thiss!1141) #b00000000000000000000000000000000 Nil!19216))))

(assert (= (and d!113913 res!632924) b!941591))

(assert (= (and b!941591 res!632925) b!941592))

(assert (= (and b!941592 res!632926) b!941593))

(declare-fun m!875967 () Bool)

(assert (=> d!113913 m!875967))

(declare-fun m!875969 () Bool)

(assert (=> b!941591 m!875969))

(declare-fun m!875971 () Bool)

(assert (=> b!941592 m!875971))

(declare-fun m!875973 () Bool)

(assert (=> b!941593 m!875973))

(assert (=> start!80118 d!113913))

(declare-fun d!113915 () Bool)

(assert (=> d!113915 (= (array_inv!21302 (_keys!10455 thiss!1141)) (bvsge (size!27789 (_keys!10455 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!941518 d!113915))

(declare-fun d!113917 () Bool)

(assert (=> d!113917 (= (array_inv!21303 (_values!5623 thiss!1141)) (bvsge (size!27788 (_values!5623 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!941518 d!113917))

(declare-fun b!941600 () Bool)

(declare-fun e!529375 () Bool)

(assert (=> b!941600 (= e!529375 tp_is_empty!20431)))

(declare-fun mapNonEmpty!32460 () Bool)

(declare-fun mapRes!32460 () Bool)

(declare-fun tp!62274 () Bool)

(assert (=> mapNonEmpty!32460 (= mapRes!32460 (and tp!62274 e!529375))))

(declare-fun mapValue!32460 () ValueCell!9734)

(declare-fun mapKey!32460 () (_ BitVec 32))

(declare-fun mapRest!32460 () (Array (_ BitVec 32) ValueCell!9734))

(assert (=> mapNonEmpty!32460 (= mapRest!32451 (store mapRest!32460 mapKey!32460 mapValue!32460))))

(declare-fun condMapEmpty!32460 () Bool)

(declare-fun mapDefault!32460 () ValueCell!9734)

(assert (=> mapNonEmpty!32451 (= condMapEmpty!32460 (= mapRest!32451 ((as const (Array (_ BitVec 32) ValueCell!9734)) mapDefault!32460)))))

(declare-fun e!529374 () Bool)

(assert (=> mapNonEmpty!32451 (= tp!62258 (and e!529374 mapRes!32460))))

(declare-fun b!941601 () Bool)

(assert (=> b!941601 (= e!529374 tp_is_empty!20431)))

(declare-fun mapIsEmpty!32460 () Bool)

(assert (=> mapIsEmpty!32460 mapRes!32460))

(assert (= (and mapNonEmpty!32451 condMapEmpty!32460) mapIsEmpty!32460))

(assert (= (and mapNonEmpty!32451 (not condMapEmpty!32460)) mapNonEmpty!32460))

(assert (= (and mapNonEmpty!32460 ((_ is ValueCellFull!9734) mapValue!32460)) b!941600))

(assert (= (and mapNonEmpty!32451 ((_ is ValueCellFull!9734) mapDefault!32460)) b!941601))

(declare-fun m!875975 () Bool)

(assert (=> mapNonEmpty!32460 m!875975))

(check-sat (not d!113911) (not b_next!17923) tp_is_empty!20431 b_and!29309 (not b!941581) (not b!941592) (not b!941591) (not b!941593) (not mapNonEmpty!32460) (not d!113913))
(check-sat b_and!29309 (not b_next!17923))
(get-model)

(declare-fun b!941612 () Bool)

(declare-fun res!632935 () Bool)

(declare-fun e!529378 () Bool)

(assert (=> b!941612 (=> (not res!632935) (not e!529378))))

(declare-fun size!27794 (LongMapFixedSize!4618) (_ BitVec 32))

(assert (=> b!941612 (= res!632935 (= (size!27794 thiss!1141) (bvadd (_size!2364 thiss!1141) (bvsdiv (bvadd (extraKeys!5332 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!941610 () Bool)

(declare-fun res!632938 () Bool)

(assert (=> b!941610 (=> (not res!632938) (not e!529378))))

(assert (=> b!941610 (= res!632938 (and (= (size!27788 (_values!5623 thiss!1141)) (bvadd (mask!27174 thiss!1141) #b00000000000000000000000000000001)) (= (size!27789 (_keys!10455 thiss!1141)) (size!27788 (_values!5623 thiss!1141))) (bvsge (_size!2364 thiss!1141) #b00000000000000000000000000000000) (bvsle (_size!2364 thiss!1141) (bvadd (mask!27174 thiss!1141) #b00000000000000000000000000000001))))))

(declare-fun b!941611 () Bool)

(declare-fun res!632937 () Bool)

(assert (=> b!941611 (=> (not res!632937) (not e!529378))))

(assert (=> b!941611 (= res!632937 (bvsge (size!27794 thiss!1141) (_size!2364 thiss!1141)))))

(declare-fun b!941613 () Bool)

(assert (=> b!941613 (= e!529378 (and (bvsge (extraKeys!5332 thiss!1141) #b00000000000000000000000000000000) (bvsle (extraKeys!5332 thiss!1141) #b00000000000000000000000000000011) (bvsge (_vacant!2364 thiss!1141) #b00000000000000000000000000000000)))))

(declare-fun d!113919 () Bool)

(declare-fun res!632936 () Bool)

(assert (=> d!113919 (=> (not res!632936) (not e!529378))))

(assert (=> d!113919 (= res!632936 (validMask!0 (mask!27174 thiss!1141)))))

(assert (=> d!113919 (= (simpleValid!343 thiss!1141) e!529378)))

(assert (= (and d!113919 res!632936) b!941610))

(assert (= (and b!941610 res!632938) b!941611))

(assert (= (and b!941611 res!632937) b!941612))

(assert (= (and b!941612 res!632935) b!941613))

(declare-fun m!875977 () Bool)

(assert (=> b!941612 m!875977))

(assert (=> b!941611 m!875977))

(assert (=> d!113919 m!875921))

(assert (=> d!113913 d!113919))

(declare-fun b!941622 () Bool)

(declare-fun e!529384 () (_ BitVec 32))

(declare-fun call!40909 () (_ BitVec 32))

(assert (=> b!941622 (= e!529384 call!40909)))

(declare-fun bm!40906 () Bool)

(assert (=> bm!40906 (= call!40909 (arrayCountValidKeys!0 (_keys!10455 thiss!1141) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!27789 (_keys!10455 thiss!1141))))))

(declare-fun b!941624 () Bool)

(assert (=> b!941624 (= e!529384 (bvadd #b00000000000000000000000000000001 call!40909))))

(declare-fun b!941625 () Bool)

(declare-fun e!529383 () (_ BitVec 32))

(assert (=> b!941625 (= e!529383 e!529384)))

(declare-fun c!98072 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!941625 (= c!98072 (validKeyInArray!0 (select (arr!27324 (_keys!10455 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun d!113921 () Bool)

(declare-fun lt!424808 () (_ BitVec 32))

(assert (=> d!113921 (and (bvsge lt!424808 #b00000000000000000000000000000000) (bvsle lt!424808 (bvsub (size!27789 (_keys!10455 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (=> d!113921 (= lt!424808 e!529383)))

(declare-fun c!98071 () Bool)

(assert (=> d!113921 (= c!98071 (bvsge #b00000000000000000000000000000000 (size!27789 (_keys!10455 thiss!1141))))))

(assert (=> d!113921 (and (bvsle #b00000000000000000000000000000000 (size!27789 (_keys!10455 thiss!1141))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!27789 (_keys!10455 thiss!1141)) (size!27789 (_keys!10455 thiss!1141))))))

(assert (=> d!113921 (= (arrayCountValidKeys!0 (_keys!10455 thiss!1141) #b00000000000000000000000000000000 (size!27789 (_keys!10455 thiss!1141))) lt!424808)))

(declare-fun b!941623 () Bool)

(assert (=> b!941623 (= e!529383 #b00000000000000000000000000000000)))

(assert (= (and d!113921 c!98071) b!941623))

(assert (= (and d!113921 (not c!98071)) b!941625))

(assert (= (and b!941625 c!98072) b!941624))

(assert (= (and b!941625 (not c!98072)) b!941622))

(assert (= (or b!941624 b!941622) bm!40906))

(declare-fun m!875979 () Bool)

(assert (=> bm!40906 m!875979))

(declare-fun m!875981 () Bool)

(assert (=> b!941625 m!875981))

(assert (=> b!941625 m!875981))

(declare-fun m!875983 () Bool)

(assert (=> b!941625 m!875983))

(assert (=> b!941591 d!113921))

(declare-fun b!941638 () Bool)

(declare-fun e!529393 () SeekEntryResult!9026)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!941638 (= e!529393 (seekKeyOrZeroReturnVacant!0 (bvadd (x!80828 lt!424805) #b00000000000000000000000000000001) (nextIndex!0 (index!38477 lt!424805) (x!80828 lt!424805) (mask!27174 thiss!1141)) (index!38477 lt!424805) key!756 (_keys!10455 thiss!1141) (mask!27174 thiss!1141)))))

(declare-fun b!941639 () Bool)

(declare-fun e!529392 () SeekEntryResult!9026)

(assert (=> b!941639 (= e!529392 Undefined!9026)))

(declare-fun b!941640 () Bool)

(assert (=> b!941640 (= e!529393 (MissingVacant!9026 (index!38477 lt!424805)))))

(declare-fun lt!424813 () SeekEntryResult!9026)

(declare-fun d!113923 () Bool)

(assert (=> d!113923 (and (or ((_ is Undefined!9026) lt!424813) (not ((_ is Found!9026) lt!424813)) (and (bvsge (index!38476 lt!424813) #b00000000000000000000000000000000) (bvslt (index!38476 lt!424813) (size!27789 (_keys!10455 thiss!1141))))) (or ((_ is Undefined!9026) lt!424813) ((_ is Found!9026) lt!424813) (not ((_ is MissingVacant!9026) lt!424813)) (not (= (index!38478 lt!424813) (index!38477 lt!424805))) (and (bvsge (index!38478 lt!424813) #b00000000000000000000000000000000) (bvslt (index!38478 lt!424813) (size!27789 (_keys!10455 thiss!1141))))) (or ((_ is Undefined!9026) lt!424813) (ite ((_ is Found!9026) lt!424813) (= (select (arr!27324 (_keys!10455 thiss!1141)) (index!38476 lt!424813)) key!756) (and ((_ is MissingVacant!9026) lt!424813) (= (index!38478 lt!424813) (index!38477 lt!424805)) (= (select (arr!27324 (_keys!10455 thiss!1141)) (index!38478 lt!424813)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!113923 (= lt!424813 e!529392)))

(declare-fun c!98079 () Bool)

(assert (=> d!113923 (= c!98079 (bvsge (x!80828 lt!424805) #b01111111111111111111111111111110))))

(declare-fun lt!424814 () (_ BitVec 64))

(assert (=> d!113923 (= lt!424814 (select (arr!27324 (_keys!10455 thiss!1141)) (index!38477 lt!424805)))))

(assert (=> d!113923 (validMask!0 (mask!27174 thiss!1141))))

(assert (=> d!113923 (= (seekKeyOrZeroReturnVacant!0 (x!80828 lt!424805) (index!38477 lt!424805) (index!38477 lt!424805) key!756 (_keys!10455 thiss!1141) (mask!27174 thiss!1141)) lt!424813)))

(declare-fun b!941641 () Bool)

(declare-fun e!529391 () SeekEntryResult!9026)

(assert (=> b!941641 (= e!529391 (Found!9026 (index!38477 lt!424805)))))

(declare-fun b!941642 () Bool)

(assert (=> b!941642 (= e!529392 e!529391)))

(declare-fun c!98081 () Bool)

(assert (=> b!941642 (= c!98081 (= lt!424814 key!756))))

(declare-fun b!941643 () Bool)

(declare-fun c!98080 () Bool)

(assert (=> b!941643 (= c!98080 (= lt!424814 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!941643 (= e!529391 e!529393)))

(assert (= (and d!113923 c!98079) b!941639))

(assert (= (and d!113923 (not c!98079)) b!941642))

(assert (= (and b!941642 c!98081) b!941641))

(assert (= (and b!941642 (not c!98081)) b!941643))

(assert (= (and b!941643 c!98080) b!941640))

(assert (= (and b!941643 (not c!98080)) b!941638))

(declare-fun m!875985 () Bool)

(assert (=> b!941638 m!875985))

(assert (=> b!941638 m!875985))

(declare-fun m!875987 () Bool)

(assert (=> b!941638 m!875987))

(declare-fun m!875989 () Bool)

(assert (=> d!113923 m!875989))

(declare-fun m!875991 () Bool)

(assert (=> d!113923 m!875991))

(assert (=> d!113923 m!875957))

(assert (=> d!113923 m!875921))

(assert (=> b!941581 d!113923))

(declare-fun b!941652 () Bool)

(declare-fun e!529402 () Bool)

(declare-fun call!40912 () Bool)

(assert (=> b!941652 (= e!529402 call!40912)))

(declare-fun b!941653 () Bool)

(declare-fun e!529401 () Bool)

(assert (=> b!941653 (= e!529401 call!40912)))

(declare-fun d!113925 () Bool)

(declare-fun res!632944 () Bool)

(declare-fun e!529400 () Bool)

(assert (=> d!113925 (=> res!632944 e!529400)))

(assert (=> d!113925 (= res!632944 (bvsge #b00000000000000000000000000000000 (size!27789 (_keys!10455 thiss!1141))))))

(assert (=> d!113925 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10455 thiss!1141) (mask!27174 thiss!1141)) e!529400)))

(declare-fun b!941654 () Bool)

(assert (=> b!941654 (= e!529400 e!529401)))

(declare-fun c!98084 () Bool)

(assert (=> b!941654 (= c!98084 (validKeyInArray!0 (select (arr!27324 (_keys!10455 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!941655 () Bool)

(assert (=> b!941655 (= e!529401 e!529402)))

(declare-fun lt!424822 () (_ BitVec 64))

(assert (=> b!941655 (= lt!424822 (select (arr!27324 (_keys!10455 thiss!1141)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!31689 0))(
  ( (Unit!31690) )
))
(declare-fun lt!424823 () Unit!31689)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!56785 (_ BitVec 64) (_ BitVec 32)) Unit!31689)

(assert (=> b!941655 (= lt!424823 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10455 thiss!1141) lt!424822 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!56785 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!941655 (arrayContainsKey!0 (_keys!10455 thiss!1141) lt!424822 #b00000000000000000000000000000000)))

(declare-fun lt!424821 () Unit!31689)

(assert (=> b!941655 (= lt!424821 lt!424823)))

(declare-fun res!632943 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!56785 (_ BitVec 32)) SeekEntryResult!9026)

(assert (=> b!941655 (= res!632943 (= (seekEntryOrOpen!0 (select (arr!27324 (_keys!10455 thiss!1141)) #b00000000000000000000000000000000) (_keys!10455 thiss!1141) (mask!27174 thiss!1141)) (Found!9026 #b00000000000000000000000000000000)))))

(assert (=> b!941655 (=> (not res!632943) (not e!529402))))

(declare-fun bm!40909 () Bool)

(assert (=> bm!40909 (= call!40912 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!10455 thiss!1141) (mask!27174 thiss!1141)))))

(assert (= (and d!113925 (not res!632944)) b!941654))

(assert (= (and b!941654 c!98084) b!941655))

(assert (= (and b!941654 (not c!98084)) b!941653))

(assert (= (and b!941655 res!632943) b!941652))

(assert (= (or b!941652 b!941653) bm!40909))

(assert (=> b!941654 m!875981))

(assert (=> b!941654 m!875981))

(assert (=> b!941654 m!875983))

(assert (=> b!941655 m!875981))

(declare-fun m!875993 () Bool)

(assert (=> b!941655 m!875993))

(declare-fun m!875995 () Bool)

(assert (=> b!941655 m!875995))

(assert (=> b!941655 m!875981))

(declare-fun m!875997 () Bool)

(assert (=> b!941655 m!875997))

(declare-fun m!875999 () Bool)

(assert (=> bm!40909 m!875999))

(assert (=> b!941592 d!113925))

(declare-fun b!941666 () Bool)

(declare-fun e!529412 () Bool)

(declare-fun call!40915 () Bool)

(assert (=> b!941666 (= e!529412 call!40915)))

(declare-fun b!941667 () Bool)

(declare-fun e!529411 () Bool)

(declare-fun contains!5096 (List!19219 (_ BitVec 64)) Bool)

(assert (=> b!941667 (= e!529411 (contains!5096 Nil!19216 (select (arr!27324 (_keys!10455 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!941668 () Bool)

(declare-fun e!529414 () Bool)

(declare-fun e!529413 () Bool)

(assert (=> b!941668 (= e!529414 e!529413)))

(declare-fun res!632953 () Bool)

(assert (=> b!941668 (=> (not res!632953) (not e!529413))))

(assert (=> b!941668 (= res!632953 (not e!529411))))

(declare-fun res!632952 () Bool)

(assert (=> b!941668 (=> (not res!632952) (not e!529411))))

(assert (=> b!941668 (= res!632952 (validKeyInArray!0 (select (arr!27324 (_keys!10455 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun d!113927 () Bool)

(declare-fun res!632951 () Bool)

(assert (=> d!113927 (=> res!632951 e!529414)))

(assert (=> d!113927 (= res!632951 (bvsge #b00000000000000000000000000000000 (size!27789 (_keys!10455 thiss!1141))))))

(assert (=> d!113927 (= (arrayNoDuplicates!0 (_keys!10455 thiss!1141) #b00000000000000000000000000000000 Nil!19216) e!529414)))

(declare-fun b!941669 () Bool)

(assert (=> b!941669 (= e!529413 e!529412)))

(declare-fun c!98087 () Bool)

(assert (=> b!941669 (= c!98087 (validKeyInArray!0 (select (arr!27324 (_keys!10455 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!941670 () Bool)

(assert (=> b!941670 (= e!529412 call!40915)))

(declare-fun bm!40912 () Bool)

(assert (=> bm!40912 (= call!40915 (arrayNoDuplicates!0 (_keys!10455 thiss!1141) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!98087 (Cons!19215 (select (arr!27324 (_keys!10455 thiss!1141)) #b00000000000000000000000000000000) Nil!19216) Nil!19216)))))

(assert (= (and d!113927 (not res!632951)) b!941668))

(assert (= (and b!941668 res!632952) b!941667))

(assert (= (and b!941668 res!632953) b!941669))

(assert (= (and b!941669 c!98087) b!941666))

(assert (= (and b!941669 (not c!98087)) b!941670))

(assert (= (or b!941666 b!941670) bm!40912))

(assert (=> b!941667 m!875981))

(assert (=> b!941667 m!875981))

(declare-fun m!876001 () Bool)

(assert (=> b!941667 m!876001))

(assert (=> b!941668 m!875981))

(assert (=> b!941668 m!875981))

(assert (=> b!941668 m!875983))

(assert (=> b!941669 m!875981))

(assert (=> b!941669 m!875981))

(assert (=> b!941669 m!875983))

(assert (=> bm!40912 m!875981))

(declare-fun m!876003 () Bool)

(assert (=> bm!40912 m!876003))

(assert (=> b!941593 d!113927))

(declare-fun b!941689 () Bool)

(declare-fun e!529425 () Bool)

(declare-fun e!529429 () Bool)

(assert (=> b!941689 (= e!529425 e!529429)))

(declare-fun res!632961 () Bool)

(declare-fun lt!424828 () SeekEntryResult!9026)

(assert (=> b!941689 (= res!632961 (and ((_ is Intermediate!9026) lt!424828) (not (undefined!9838 lt!424828)) (bvslt (x!80828 lt!424828) #b01111111111111111111111111111110) (bvsge (x!80828 lt!424828) #b00000000000000000000000000000000) (bvsge (x!80828 lt!424828) #b00000000000000000000000000000000)))))

(assert (=> b!941689 (=> (not res!632961) (not e!529429))))

(declare-fun b!941690 () Bool)

(assert (=> b!941690 (and (bvsge (index!38477 lt!424828) #b00000000000000000000000000000000) (bvslt (index!38477 lt!424828) (size!27789 (_keys!10455 thiss!1141))))))

(declare-fun res!632960 () Bool)

(assert (=> b!941690 (= res!632960 (= (select (arr!27324 (_keys!10455 thiss!1141)) (index!38477 lt!424828)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!529428 () Bool)

(assert (=> b!941690 (=> res!632960 e!529428)))

(declare-fun b!941691 () Bool)

(assert (=> b!941691 (and (bvsge (index!38477 lt!424828) #b00000000000000000000000000000000) (bvslt (index!38477 lt!424828) (size!27789 (_keys!10455 thiss!1141))))))

(declare-fun res!632962 () Bool)

(assert (=> b!941691 (= res!632962 (= (select (arr!27324 (_keys!10455 thiss!1141)) (index!38477 lt!424828)) key!756))))

(assert (=> b!941691 (=> res!632962 e!529428)))

(assert (=> b!941691 (= e!529429 e!529428)))

(declare-fun b!941692 () Bool)

(assert (=> b!941692 (and (bvsge (index!38477 lt!424828) #b00000000000000000000000000000000) (bvslt (index!38477 lt!424828) (size!27789 (_keys!10455 thiss!1141))))))

(assert (=> b!941692 (= e!529428 (= (select (arr!27324 (_keys!10455 thiss!1141)) (index!38477 lt!424828)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!941693 () Bool)

(declare-fun e!529426 () SeekEntryResult!9026)

(declare-fun e!529427 () SeekEntryResult!9026)

(assert (=> b!941693 (= e!529426 e!529427)))

(declare-fun c!98096 () Bool)

(declare-fun lt!424829 () (_ BitVec 64))

(assert (=> b!941693 (= c!98096 (or (= lt!424829 key!756) (= (bvadd lt!424829 lt!424829) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!941694 () Bool)

(assert (=> b!941694 (= e!529425 (bvsge (x!80828 lt!424828) #b01111111111111111111111111111110))))

(declare-fun b!941696 () Bool)

(assert (=> b!941696 (= e!529427 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!756 (mask!27174 thiss!1141)) #b00000000000000000000000000000000 (mask!27174 thiss!1141)) key!756 (_keys!10455 thiss!1141) (mask!27174 thiss!1141)))))

(declare-fun b!941697 () Bool)

(assert (=> b!941697 (= e!529427 (Intermediate!9026 false (toIndex!0 key!756 (mask!27174 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun d!113929 () Bool)

(assert (=> d!113929 e!529425))

(declare-fun c!98094 () Bool)

(assert (=> d!113929 (= c!98094 (and ((_ is Intermediate!9026) lt!424828) (undefined!9838 lt!424828)))))

(assert (=> d!113929 (= lt!424828 e!529426)))

(declare-fun c!98095 () Bool)

(assert (=> d!113929 (= c!98095 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!113929 (= lt!424829 (select (arr!27324 (_keys!10455 thiss!1141)) (toIndex!0 key!756 (mask!27174 thiss!1141))))))

(assert (=> d!113929 (validMask!0 (mask!27174 thiss!1141))))

(assert (=> d!113929 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!756 (mask!27174 thiss!1141)) key!756 (_keys!10455 thiss!1141) (mask!27174 thiss!1141)) lt!424828)))

(declare-fun b!941695 () Bool)

(assert (=> b!941695 (= e!529426 (Intermediate!9026 true (toIndex!0 key!756 (mask!27174 thiss!1141)) #b00000000000000000000000000000000))))

(assert (= (and d!113929 c!98095) b!941695))

(assert (= (and d!113929 (not c!98095)) b!941693))

(assert (= (and b!941693 c!98096) b!941697))

(assert (= (and b!941693 (not c!98096)) b!941696))

(assert (= (and d!113929 c!98094) b!941694))

(assert (= (and d!113929 (not c!98094)) b!941689))

(assert (= (and b!941689 res!632961) b!941691))

(assert (= (and b!941691 (not res!632962)) b!941690))

(assert (= (and b!941690 (not res!632960)) b!941692))

(declare-fun m!876005 () Bool)

(assert (=> b!941692 m!876005))

(assert (=> d!113929 m!875961))

(declare-fun m!876007 () Bool)

(assert (=> d!113929 m!876007))

(assert (=> d!113929 m!875921))

(assert (=> b!941691 m!876005))

(assert (=> b!941690 m!876005))

(assert (=> b!941696 m!875961))

(declare-fun m!876009 () Bool)

(assert (=> b!941696 m!876009))

(assert (=> b!941696 m!876009))

(declare-fun m!876011 () Bool)

(assert (=> b!941696 m!876011))

(assert (=> d!113911 d!113929))

(declare-fun d!113931 () Bool)

(declare-fun lt!424835 () (_ BitVec 32))

(declare-fun lt!424834 () (_ BitVec 32))

(assert (=> d!113931 (= lt!424835 (bvmul (bvxor lt!424834 (bvlshr lt!424834 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!113931 (= lt!424834 ((_ extract 31 0) (bvand (bvxor key!756 (bvlshr key!756 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!113931 (and (bvsge (mask!27174 thiss!1141) #b00000000000000000000000000000000) (let ((res!632963 (let ((h!20364 ((_ extract 31 0) (bvand (bvxor key!756 (bvlshr key!756 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!80845 (bvmul (bvxor h!20364 (bvlshr h!20364 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!80845 (bvlshr x!80845 #b00000000000000000000000000001101)) (mask!27174 thiss!1141)))))) (and (bvslt res!632963 (bvadd (mask!27174 thiss!1141) #b00000000000000000000000000000001)) (bvsge res!632963 #b00000000000000000000000000000000))))))

(assert (=> d!113931 (= (toIndex!0 key!756 (mask!27174 thiss!1141)) (bvand (bvxor lt!424835 (bvlshr lt!424835 #b00000000000000000000000000001101)) (mask!27174 thiss!1141)))))

(assert (=> d!113911 d!113931))

(assert (=> d!113911 d!113909))

(declare-fun b!941698 () Bool)

(declare-fun e!529431 () Bool)

(assert (=> b!941698 (= e!529431 tp_is_empty!20431)))

(declare-fun mapNonEmpty!32461 () Bool)

(declare-fun mapRes!32461 () Bool)

(declare-fun tp!62275 () Bool)

(assert (=> mapNonEmpty!32461 (= mapRes!32461 (and tp!62275 e!529431))))

(declare-fun mapValue!32461 () ValueCell!9734)

(declare-fun mapRest!32461 () (Array (_ BitVec 32) ValueCell!9734))

(declare-fun mapKey!32461 () (_ BitVec 32))

(assert (=> mapNonEmpty!32461 (= mapRest!32460 (store mapRest!32461 mapKey!32461 mapValue!32461))))

(declare-fun condMapEmpty!32461 () Bool)

(declare-fun mapDefault!32461 () ValueCell!9734)

(assert (=> mapNonEmpty!32460 (= condMapEmpty!32461 (= mapRest!32460 ((as const (Array (_ BitVec 32) ValueCell!9734)) mapDefault!32461)))))

(declare-fun e!529430 () Bool)

(assert (=> mapNonEmpty!32460 (= tp!62274 (and e!529430 mapRes!32461))))

(declare-fun b!941699 () Bool)

(assert (=> b!941699 (= e!529430 tp_is_empty!20431)))

(declare-fun mapIsEmpty!32461 () Bool)

(assert (=> mapIsEmpty!32461 mapRes!32461))

(assert (= (and mapNonEmpty!32460 condMapEmpty!32461) mapIsEmpty!32461))

(assert (= (and mapNonEmpty!32460 (not condMapEmpty!32461)) mapNonEmpty!32461))

(assert (= (and mapNonEmpty!32461 ((_ is ValueCellFull!9734) mapValue!32461)) b!941698))

(assert (= (and mapNonEmpty!32460 ((_ is ValueCellFull!9734) mapDefault!32461)) b!941699))

(declare-fun m!876013 () Bool)

(assert (=> mapNonEmpty!32461 m!876013))

(check-sat (not d!113929) (not b_next!17923) (not mapNonEmpty!32461) (not bm!40909) tp_is_empty!20431 b_and!29309 (not b!941669) (not b!941696) (not b!941654) (not b!941612) (not b!941638) (not b!941625) (not bm!40912) (not bm!40906) (not b!941668) (not b!941655) (not d!113923) (not b!941611) (not d!113919) (not b!941667))
(check-sat b_and!29309 (not b_next!17923))
