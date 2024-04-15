; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!80072 () Bool)

(assert start!80072)

(declare-fun b!941200 () Bool)

(declare-fun b_free!17911 () Bool)

(declare-fun b_next!17911 () Bool)

(assert (=> b!941200 (= b_free!17911 (not b_next!17911))))

(declare-fun tp!62215 () Bool)

(declare-fun b_and!29297 () Bool)

(assert (=> b!941200 (= tp!62215 b_and!29297)))

(declare-fun b!941199 () Bool)

(declare-fun res!632765 () Bool)

(declare-fun e!529116 () Bool)

(assert (=> b!941199 (=> (not res!632765) (not e!529116))))

(declare-fun key!756 () (_ BitVec 64))

(declare-datatypes ((V!32191 0))(
  ( (V!32192 (val!10260 Int)) )
))
(declare-datatypes ((ValueCell!9728 0))(
  ( (ValueCellFull!9728 (v!12790 V!32191)) (EmptyCell!9728) )
))
(declare-datatypes ((array!56755 0))(
  ( (array!56756 (arr!27311 (Array (_ BitVec 32) ValueCell!9728)) (size!27775 (_ BitVec 32))) )
))
(declare-datatypes ((array!56757 0))(
  ( (array!56758 (arr!27312 (Array (_ BitVec 32) (_ BitVec 64))) (size!27776 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4606 0))(
  ( (LongMapFixedSize!4607 (defaultEntry!5594 Int) (mask!27156 (_ BitVec 32)) (extraKeys!5326 (_ BitVec 32)) (zeroValue!5430 V!32191) (minValue!5430 V!32191) (_size!2358 (_ BitVec 32)) (_keys!10444 array!56757) (_values!5617 array!56755) (_vacant!2358 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4606)

(get-info :version)

(declare-datatypes ((SeekEntryResult!9020 0))(
  ( (MissingZero!9020 (index!38451 (_ BitVec 32))) (Found!9020 (index!38452 (_ BitVec 32))) (Intermediate!9020 (undefined!9832 Bool) (index!38453 (_ BitVec 32)) (x!80781 (_ BitVec 32))) (Undefined!9020) (MissingVacant!9020 (index!38454 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!56757 (_ BitVec 32)) SeekEntryResult!9020)

(assert (=> b!941199 (= res!632765 (not ((_ is Found!9020) (seekEntry!0 key!756 (_keys!10444 thiss!1141) (mask!27156 thiss!1141)))))))

(declare-fun e!529117 () Bool)

(declare-fun e!529121 () Bool)

(declare-fun tp_is_empty!20419 () Bool)

(declare-fun array_inv!21292 (array!56757) Bool)

(declare-fun array_inv!21293 (array!56755) Bool)

(assert (=> b!941200 (= e!529121 (and tp!62215 tp_is_empty!20419 (array_inv!21292 (_keys!10444 thiss!1141)) (array_inv!21293 (_values!5617 thiss!1141)) e!529117))))

(declare-fun res!632763 () Bool)

(assert (=> start!80072 (=> (not res!632763) (not e!529116))))

(declare-fun valid!1773 (LongMapFixedSize!4606) Bool)

(assert (=> start!80072 (= res!632763 (valid!1773 thiss!1141))))

(assert (=> start!80072 e!529116))

(assert (=> start!80072 e!529121))

(assert (=> start!80072 true))

(declare-fun mapNonEmpty!32426 () Bool)

(declare-fun mapRes!32426 () Bool)

(declare-fun tp!62216 () Bool)

(declare-fun e!529120 () Bool)

(assert (=> mapNonEmpty!32426 (= mapRes!32426 (and tp!62216 e!529120))))

(declare-fun mapKey!32426 () (_ BitVec 32))

(declare-fun mapValue!32426 () ValueCell!9728)

(declare-fun mapRest!32426 () (Array (_ BitVec 32) ValueCell!9728))

(assert (=> mapNonEmpty!32426 (= (arr!27311 (_values!5617 thiss!1141)) (store mapRest!32426 mapKey!32426 mapValue!32426))))

(declare-fun mapIsEmpty!32426 () Bool)

(assert (=> mapIsEmpty!32426 mapRes!32426))

(declare-fun b!941201 () Bool)

(declare-fun e!529119 () Bool)

(assert (=> b!941201 (= e!529117 (and e!529119 mapRes!32426))))

(declare-fun condMapEmpty!32426 () Bool)

(declare-fun mapDefault!32426 () ValueCell!9728)

(assert (=> b!941201 (= condMapEmpty!32426 (= (arr!27311 (_values!5617 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9728)) mapDefault!32426)))))

(declare-fun b!941202 () Bool)

(declare-fun res!632766 () Bool)

(assert (=> b!941202 (=> (not res!632766) (not e!529116))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!941202 (= res!632766 (validMask!0 (mask!27156 thiss!1141)))))

(declare-fun b!941203 () Bool)

(assert (=> b!941203 (= e!529116 (and (= (size!27775 (_values!5617 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27156 thiss!1141))) (not (= (size!27776 (_keys!10444 thiss!1141)) (size!27775 (_values!5617 thiss!1141))))))))

(declare-fun b!941204 () Bool)

(assert (=> b!941204 (= e!529120 tp_is_empty!20419)))

(declare-fun b!941205 () Bool)

(assert (=> b!941205 (= e!529119 tp_is_empty!20419)))

(declare-fun b!941206 () Bool)

(declare-fun res!632764 () Bool)

(assert (=> b!941206 (=> (not res!632764) (not e!529116))))

(assert (=> b!941206 (= res!632764 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!80072 res!632763) b!941206))

(assert (= (and b!941206 res!632764) b!941199))

(assert (= (and b!941199 res!632765) b!941202))

(assert (= (and b!941202 res!632766) b!941203))

(assert (= (and b!941201 condMapEmpty!32426) mapIsEmpty!32426))

(assert (= (and b!941201 (not condMapEmpty!32426)) mapNonEmpty!32426))

(assert (= (and mapNonEmpty!32426 ((_ is ValueCellFull!9728) mapValue!32426)) b!941204))

(assert (= (and b!941201 ((_ is ValueCellFull!9728) mapDefault!32426)) b!941205))

(assert (= b!941200 b!941201))

(assert (= start!80072 b!941200))

(declare-fun m!875771 () Bool)

(assert (=> mapNonEmpty!32426 m!875771))

(declare-fun m!875773 () Bool)

(assert (=> b!941199 m!875773))

(declare-fun m!875775 () Bool)

(assert (=> b!941202 m!875775))

(declare-fun m!875777 () Bool)

(assert (=> b!941200 m!875777))

(declare-fun m!875779 () Bool)

(assert (=> b!941200 m!875779))

(declare-fun m!875781 () Bool)

(assert (=> start!80072 m!875781))

(check-sat (not b!941200) b_and!29297 (not b_next!17911) (not start!80072) (not mapNonEmpty!32426) tp_is_empty!20419 (not b!941202) (not b!941199))
(check-sat b_and!29297 (not b_next!17911))
(get-model)

(declare-fun d!113871 () Bool)

(declare-fun res!632797 () Bool)

(declare-fun e!529160 () Bool)

(assert (=> d!113871 (=> (not res!632797) (not e!529160))))

(declare-fun simpleValid!341 (LongMapFixedSize!4606) Bool)

(assert (=> d!113871 (= res!632797 (simpleValid!341 thiss!1141))))

(assert (=> d!113871 (= (valid!1773 thiss!1141) e!529160)))

(declare-fun b!941261 () Bool)

(declare-fun res!632798 () Bool)

(assert (=> b!941261 (=> (not res!632798) (not e!529160))))

(declare-fun arrayCountValidKeys!0 (array!56757 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!941261 (= res!632798 (= (arrayCountValidKeys!0 (_keys!10444 thiss!1141) #b00000000000000000000000000000000 (size!27776 (_keys!10444 thiss!1141))) (_size!2358 thiss!1141)))))

(declare-fun b!941262 () Bool)

(declare-fun res!632799 () Bool)

(assert (=> b!941262 (=> (not res!632799) (not e!529160))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56757 (_ BitVec 32)) Bool)

(assert (=> b!941262 (= res!632799 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10444 thiss!1141) (mask!27156 thiss!1141)))))

(declare-fun b!941263 () Bool)

(declare-datatypes ((List!19217 0))(
  ( (Nil!19214) (Cons!19213 (h!20360 (_ BitVec 64)) (t!27523 List!19217)) )
))
(declare-fun arrayNoDuplicates!0 (array!56757 (_ BitVec 32) List!19217) Bool)

(assert (=> b!941263 (= e!529160 (arrayNoDuplicates!0 (_keys!10444 thiss!1141) #b00000000000000000000000000000000 Nil!19214))))

(assert (= (and d!113871 res!632797) b!941261))

(assert (= (and b!941261 res!632798) b!941262))

(assert (= (and b!941262 res!632799) b!941263))

(declare-fun m!875807 () Bool)

(assert (=> d!113871 m!875807))

(declare-fun m!875809 () Bool)

(assert (=> b!941261 m!875809))

(declare-fun m!875811 () Bool)

(assert (=> b!941262 m!875811))

(declare-fun m!875813 () Bool)

(assert (=> b!941263 m!875813))

(assert (=> start!80072 d!113871))

(declare-fun d!113873 () Bool)

(assert (=> d!113873 (= (validMask!0 (mask!27156 thiss!1141)) (and (or (= (mask!27156 thiss!1141) #b00000000000000000000000000000111) (= (mask!27156 thiss!1141) #b00000000000000000000000000001111) (= (mask!27156 thiss!1141) #b00000000000000000000000000011111) (= (mask!27156 thiss!1141) #b00000000000000000000000000111111) (= (mask!27156 thiss!1141) #b00000000000000000000000001111111) (= (mask!27156 thiss!1141) #b00000000000000000000000011111111) (= (mask!27156 thiss!1141) #b00000000000000000000000111111111) (= (mask!27156 thiss!1141) #b00000000000000000000001111111111) (= (mask!27156 thiss!1141) #b00000000000000000000011111111111) (= (mask!27156 thiss!1141) #b00000000000000000000111111111111) (= (mask!27156 thiss!1141) #b00000000000000000001111111111111) (= (mask!27156 thiss!1141) #b00000000000000000011111111111111) (= (mask!27156 thiss!1141) #b00000000000000000111111111111111) (= (mask!27156 thiss!1141) #b00000000000000001111111111111111) (= (mask!27156 thiss!1141) #b00000000000000011111111111111111) (= (mask!27156 thiss!1141) #b00000000000000111111111111111111) (= (mask!27156 thiss!1141) #b00000000000001111111111111111111) (= (mask!27156 thiss!1141) #b00000000000011111111111111111111) (= (mask!27156 thiss!1141) #b00000000000111111111111111111111) (= (mask!27156 thiss!1141) #b00000000001111111111111111111111) (= (mask!27156 thiss!1141) #b00000000011111111111111111111111) (= (mask!27156 thiss!1141) #b00000000111111111111111111111111) (= (mask!27156 thiss!1141) #b00000001111111111111111111111111) (= (mask!27156 thiss!1141) #b00000011111111111111111111111111) (= (mask!27156 thiss!1141) #b00000111111111111111111111111111) (= (mask!27156 thiss!1141) #b00001111111111111111111111111111) (= (mask!27156 thiss!1141) #b00011111111111111111111111111111) (= (mask!27156 thiss!1141) #b00111111111111111111111111111111)) (bvsle (mask!27156 thiss!1141) #b00111111111111111111111111111111)))))

(assert (=> b!941202 d!113873))

(declare-fun d!113875 () Bool)

(assert (=> d!113875 (= (array_inv!21292 (_keys!10444 thiss!1141)) (bvsge (size!27776 (_keys!10444 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!941200 d!113875))

(declare-fun d!113877 () Bool)

(assert (=> d!113877 (= (array_inv!21293 (_values!5617 thiss!1141)) (bvsge (size!27775 (_values!5617 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!941200 d!113877))

(declare-fun b!941276 () Bool)

(declare-fun e!529168 () SeekEntryResult!9020)

(declare-fun lt!424748 () SeekEntryResult!9020)

(assert (=> b!941276 (= e!529168 (ite ((_ is MissingVacant!9020) lt!424748) (MissingZero!9020 (index!38454 lt!424748)) lt!424748))))

(declare-fun lt!424749 () SeekEntryResult!9020)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!56757 (_ BitVec 32)) SeekEntryResult!9020)

(assert (=> b!941276 (= lt!424748 (seekKeyOrZeroReturnVacant!0 (x!80781 lt!424749) (index!38453 lt!424749) (index!38453 lt!424749) key!756 (_keys!10444 thiss!1141) (mask!27156 thiss!1141)))))

(declare-fun b!941277 () Bool)

(declare-fun e!529167 () SeekEntryResult!9020)

(assert (=> b!941277 (= e!529167 (Found!9020 (index!38453 lt!424749)))))

(declare-fun b!941278 () Bool)

(declare-fun e!529169 () SeekEntryResult!9020)

(assert (=> b!941278 (= e!529169 Undefined!9020)))

(declare-fun d!113879 () Bool)

(declare-fun lt!424750 () SeekEntryResult!9020)

(assert (=> d!113879 (and (or ((_ is MissingVacant!9020) lt!424750) (not ((_ is Found!9020) lt!424750)) (and (bvsge (index!38452 lt!424750) #b00000000000000000000000000000000) (bvslt (index!38452 lt!424750) (size!27776 (_keys!10444 thiss!1141))))) (not ((_ is MissingVacant!9020) lt!424750)) (or (not ((_ is Found!9020) lt!424750)) (= (select (arr!27312 (_keys!10444 thiss!1141)) (index!38452 lt!424750)) key!756)))))

(assert (=> d!113879 (= lt!424750 e!529169)))

(declare-fun c!98016 () Bool)

(assert (=> d!113879 (= c!98016 (and ((_ is Intermediate!9020) lt!424749) (undefined!9832 lt!424749)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!56757 (_ BitVec 32)) SeekEntryResult!9020)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!113879 (= lt!424749 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!756 (mask!27156 thiss!1141)) key!756 (_keys!10444 thiss!1141) (mask!27156 thiss!1141)))))

(assert (=> d!113879 (validMask!0 (mask!27156 thiss!1141))))

(assert (=> d!113879 (= (seekEntry!0 key!756 (_keys!10444 thiss!1141) (mask!27156 thiss!1141)) lt!424750)))

(declare-fun b!941279 () Bool)

(assert (=> b!941279 (= e!529169 e!529167)))

(declare-fun lt!424751 () (_ BitVec 64))

(assert (=> b!941279 (= lt!424751 (select (arr!27312 (_keys!10444 thiss!1141)) (index!38453 lt!424749)))))

(declare-fun c!98018 () Bool)

(assert (=> b!941279 (= c!98018 (= lt!424751 key!756))))

(declare-fun b!941280 () Bool)

(declare-fun c!98017 () Bool)

(assert (=> b!941280 (= c!98017 (= lt!424751 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!941280 (= e!529167 e!529168)))

(declare-fun b!941281 () Bool)

(assert (=> b!941281 (= e!529168 (MissingZero!9020 (index!38453 lt!424749)))))

(assert (= (and d!113879 c!98016) b!941278))

(assert (= (and d!113879 (not c!98016)) b!941279))

(assert (= (and b!941279 c!98018) b!941277))

(assert (= (and b!941279 (not c!98018)) b!941280))

(assert (= (and b!941280 c!98017) b!941281))

(assert (= (and b!941280 (not c!98017)) b!941276))

(declare-fun m!875815 () Bool)

(assert (=> b!941276 m!875815))

(declare-fun m!875817 () Bool)

(assert (=> d!113879 m!875817))

(declare-fun m!875819 () Bool)

(assert (=> d!113879 m!875819))

(assert (=> d!113879 m!875819))

(declare-fun m!875821 () Bool)

(assert (=> d!113879 m!875821))

(assert (=> d!113879 m!875775))

(declare-fun m!875823 () Bool)

(assert (=> b!941279 m!875823))

(assert (=> b!941199 d!113879))

(declare-fun b!941289 () Bool)

(declare-fun e!529174 () Bool)

(assert (=> b!941289 (= e!529174 tp_is_empty!20419)))

(declare-fun b!941288 () Bool)

(declare-fun e!529175 () Bool)

(assert (=> b!941288 (= e!529175 tp_is_empty!20419)))

(declare-fun condMapEmpty!32435 () Bool)

(declare-fun mapDefault!32435 () ValueCell!9728)

(assert (=> mapNonEmpty!32426 (= condMapEmpty!32435 (= mapRest!32426 ((as const (Array (_ BitVec 32) ValueCell!9728)) mapDefault!32435)))))

(declare-fun mapRes!32435 () Bool)

(assert (=> mapNonEmpty!32426 (= tp!62216 (and e!529174 mapRes!32435))))

(declare-fun mapIsEmpty!32435 () Bool)

(assert (=> mapIsEmpty!32435 mapRes!32435))

(declare-fun mapNonEmpty!32435 () Bool)

(declare-fun tp!62231 () Bool)

(assert (=> mapNonEmpty!32435 (= mapRes!32435 (and tp!62231 e!529175))))

(declare-fun mapValue!32435 () ValueCell!9728)

(declare-fun mapRest!32435 () (Array (_ BitVec 32) ValueCell!9728))

(declare-fun mapKey!32435 () (_ BitVec 32))

(assert (=> mapNonEmpty!32435 (= mapRest!32426 (store mapRest!32435 mapKey!32435 mapValue!32435))))

(assert (= (and mapNonEmpty!32426 condMapEmpty!32435) mapIsEmpty!32435))

(assert (= (and mapNonEmpty!32426 (not condMapEmpty!32435)) mapNonEmpty!32435))

(assert (= (and mapNonEmpty!32435 ((_ is ValueCellFull!9728) mapValue!32435)) b!941288))

(assert (= (and mapNonEmpty!32426 ((_ is ValueCellFull!9728) mapDefault!32435)) b!941289))

(declare-fun m!875825 () Bool)

(assert (=> mapNonEmpty!32435 m!875825))

(check-sat (not b!941263) b_and!29297 (not b_next!17911) (not d!113879) (not b!941261) (not b!941262) (not mapNonEmpty!32435) (not d!113871) tp_is_empty!20419 (not b!941276))
(check-sat b_and!29297 (not b_next!17911))
(get-model)

(declare-fun b!941300 () Bool)

(declare-fun res!632810 () Bool)

(declare-fun e!529178 () Bool)

(assert (=> b!941300 (=> (not res!632810) (not e!529178))))

(declare-fun size!27781 (LongMapFixedSize!4606) (_ BitVec 32))

(assert (=> b!941300 (= res!632810 (= (size!27781 thiss!1141) (bvadd (_size!2358 thiss!1141) (bvsdiv (bvadd (extraKeys!5326 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun d!113881 () Bool)

(declare-fun res!632808 () Bool)

(assert (=> d!113881 (=> (not res!632808) (not e!529178))))

(assert (=> d!113881 (= res!632808 (validMask!0 (mask!27156 thiss!1141)))))

(assert (=> d!113881 (= (simpleValid!341 thiss!1141) e!529178)))

(declare-fun b!941301 () Bool)

(assert (=> b!941301 (= e!529178 (and (bvsge (extraKeys!5326 thiss!1141) #b00000000000000000000000000000000) (bvsle (extraKeys!5326 thiss!1141) #b00000000000000000000000000000011) (bvsge (_vacant!2358 thiss!1141) #b00000000000000000000000000000000)))))

(declare-fun b!941299 () Bool)

(declare-fun res!632809 () Bool)

(assert (=> b!941299 (=> (not res!632809) (not e!529178))))

(assert (=> b!941299 (= res!632809 (bvsge (size!27781 thiss!1141) (_size!2358 thiss!1141)))))

(declare-fun b!941298 () Bool)

(declare-fun res!632811 () Bool)

(assert (=> b!941298 (=> (not res!632811) (not e!529178))))

(assert (=> b!941298 (= res!632811 (and (= (size!27775 (_values!5617 thiss!1141)) (bvadd (mask!27156 thiss!1141) #b00000000000000000000000000000001)) (= (size!27776 (_keys!10444 thiss!1141)) (size!27775 (_values!5617 thiss!1141))) (bvsge (_size!2358 thiss!1141) #b00000000000000000000000000000000) (bvsle (_size!2358 thiss!1141) (bvadd (mask!27156 thiss!1141) #b00000000000000000000000000000001))))))

(assert (= (and d!113881 res!632808) b!941298))

(assert (= (and b!941298 res!632811) b!941299))

(assert (= (and b!941299 res!632809) b!941300))

(assert (= (and b!941300 res!632810) b!941301))

(declare-fun m!875827 () Bool)

(assert (=> b!941300 m!875827))

(assert (=> d!113881 m!875775))

(assert (=> b!941299 m!875827))

(assert (=> d!113871 d!113881))

(declare-fun b!941320 () Bool)

(declare-fun e!529191 () Bool)

(declare-fun lt!424756 () SeekEntryResult!9020)

(assert (=> b!941320 (= e!529191 (bvsge (x!80781 lt!424756) #b01111111111111111111111111111110))))

(declare-fun b!941321 () Bool)

(assert (=> b!941321 (and (bvsge (index!38453 lt!424756) #b00000000000000000000000000000000) (bvslt (index!38453 lt!424756) (size!27776 (_keys!10444 thiss!1141))))))

(declare-fun res!632818 () Bool)

(assert (=> b!941321 (= res!632818 (= (select (arr!27312 (_keys!10444 thiss!1141)) (index!38453 lt!424756)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!529190 () Bool)

(assert (=> b!941321 (=> res!632818 e!529190)))

(declare-fun b!941322 () Bool)

(declare-fun e!529193 () Bool)

(assert (=> b!941322 (= e!529191 e!529193)))

(declare-fun res!632820 () Bool)

(assert (=> b!941322 (= res!632820 (and ((_ is Intermediate!9020) lt!424756) (not (undefined!9832 lt!424756)) (bvslt (x!80781 lt!424756) #b01111111111111111111111111111110) (bvsge (x!80781 lt!424756) #b00000000000000000000000000000000) (bvsge (x!80781 lt!424756) #b00000000000000000000000000000000)))))

(assert (=> b!941322 (=> (not res!632820) (not e!529193))))

(declare-fun b!941323 () Bool)

(declare-fun e!529192 () SeekEntryResult!9020)

(assert (=> b!941323 (= e!529192 (Intermediate!9020 true (toIndex!0 key!756 (mask!27156 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun d!113883 () Bool)

(assert (=> d!113883 e!529191))

(declare-fun c!98027 () Bool)

(assert (=> d!113883 (= c!98027 (and ((_ is Intermediate!9020) lt!424756) (undefined!9832 lt!424756)))))

(assert (=> d!113883 (= lt!424756 e!529192)))

(declare-fun c!98026 () Bool)

(assert (=> d!113883 (= c!98026 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!424757 () (_ BitVec 64))

(assert (=> d!113883 (= lt!424757 (select (arr!27312 (_keys!10444 thiss!1141)) (toIndex!0 key!756 (mask!27156 thiss!1141))))))

(assert (=> d!113883 (validMask!0 (mask!27156 thiss!1141))))

(assert (=> d!113883 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!756 (mask!27156 thiss!1141)) key!756 (_keys!10444 thiss!1141) (mask!27156 thiss!1141)) lt!424756)))

(declare-fun b!941324 () Bool)

(assert (=> b!941324 (and (bvsge (index!38453 lt!424756) #b00000000000000000000000000000000) (bvslt (index!38453 lt!424756) (size!27776 (_keys!10444 thiss!1141))))))

(declare-fun res!632819 () Bool)

(assert (=> b!941324 (= res!632819 (= (select (arr!27312 (_keys!10444 thiss!1141)) (index!38453 lt!424756)) key!756))))

(assert (=> b!941324 (=> res!632819 e!529190)))

(assert (=> b!941324 (= e!529193 e!529190)))

(declare-fun b!941325 () Bool)

(declare-fun e!529189 () SeekEntryResult!9020)

(assert (=> b!941325 (= e!529192 e!529189)))

(declare-fun c!98025 () Bool)

(assert (=> b!941325 (= c!98025 (or (= lt!424757 key!756) (= (bvadd lt!424757 lt!424757) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!941326 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!941326 (= e!529189 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!756 (mask!27156 thiss!1141)) #b00000000000000000000000000000000 (mask!27156 thiss!1141)) key!756 (_keys!10444 thiss!1141) (mask!27156 thiss!1141)))))

(declare-fun b!941327 () Bool)

(assert (=> b!941327 (= e!529189 (Intermediate!9020 false (toIndex!0 key!756 (mask!27156 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun b!941328 () Bool)

(assert (=> b!941328 (and (bvsge (index!38453 lt!424756) #b00000000000000000000000000000000) (bvslt (index!38453 lt!424756) (size!27776 (_keys!10444 thiss!1141))))))

(assert (=> b!941328 (= e!529190 (= (select (arr!27312 (_keys!10444 thiss!1141)) (index!38453 lt!424756)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!113883 c!98026) b!941323))

(assert (= (and d!113883 (not c!98026)) b!941325))

(assert (= (and b!941325 c!98025) b!941327))

(assert (= (and b!941325 (not c!98025)) b!941326))

(assert (= (and d!113883 c!98027) b!941320))

(assert (= (and d!113883 (not c!98027)) b!941322))

(assert (= (and b!941322 res!632820) b!941324))

(assert (= (and b!941324 (not res!632819)) b!941321))

(assert (= (and b!941321 (not res!632818)) b!941328))

(assert (=> d!113883 m!875819))

(declare-fun m!875829 () Bool)

(assert (=> d!113883 m!875829))

(assert (=> d!113883 m!875775))

(declare-fun m!875831 () Bool)

(assert (=> b!941328 m!875831))

(assert (=> b!941321 m!875831))

(assert (=> b!941324 m!875831))

(assert (=> b!941326 m!875819))

(declare-fun m!875833 () Bool)

(assert (=> b!941326 m!875833))

(assert (=> b!941326 m!875833))

(declare-fun m!875835 () Bool)

(assert (=> b!941326 m!875835))

(assert (=> d!113879 d!113883))

(declare-fun d!113885 () Bool)

(declare-fun lt!424763 () (_ BitVec 32))

(declare-fun lt!424762 () (_ BitVec 32))

(assert (=> d!113885 (= lt!424763 (bvmul (bvxor lt!424762 (bvlshr lt!424762 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!113885 (= lt!424762 ((_ extract 31 0) (bvand (bvxor key!756 (bvlshr key!756 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!113885 (and (bvsge (mask!27156 thiss!1141) #b00000000000000000000000000000000) (let ((res!632821 (let ((h!20361 ((_ extract 31 0) (bvand (bvxor key!756 (bvlshr key!756 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!80799 (bvmul (bvxor h!20361 (bvlshr h!20361 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!80799 (bvlshr x!80799 #b00000000000000000000000000001101)) (mask!27156 thiss!1141)))))) (and (bvslt res!632821 (bvadd (mask!27156 thiss!1141) #b00000000000000000000000000000001)) (bvsge res!632821 #b00000000000000000000000000000000))))))

(assert (=> d!113885 (= (toIndex!0 key!756 (mask!27156 thiss!1141)) (bvand (bvxor lt!424763 (bvlshr lt!424763 #b00000000000000000000000000001101)) (mask!27156 thiss!1141)))))

(assert (=> d!113879 d!113885))

(assert (=> d!113879 d!113873))

(declare-fun b!941337 () Bool)

(declare-fun e!529199 () (_ BitVec 32))

(declare-fun call!40900 () (_ BitVec 32))

(assert (=> b!941337 (= e!529199 (bvadd #b00000000000000000000000000000001 call!40900))))

(declare-fun b!941338 () Bool)

(declare-fun e!529198 () (_ BitVec 32))

(assert (=> b!941338 (= e!529198 e!529199)))

(declare-fun c!98032 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!941338 (= c!98032 (validKeyInArray!0 (select (arr!27312 (_keys!10444 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun d!113887 () Bool)

(declare-fun lt!424766 () (_ BitVec 32))

(assert (=> d!113887 (and (bvsge lt!424766 #b00000000000000000000000000000000) (bvsle lt!424766 (bvsub (size!27776 (_keys!10444 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (=> d!113887 (= lt!424766 e!529198)))

(declare-fun c!98033 () Bool)

(assert (=> d!113887 (= c!98033 (bvsge #b00000000000000000000000000000000 (size!27776 (_keys!10444 thiss!1141))))))

(assert (=> d!113887 (and (bvsle #b00000000000000000000000000000000 (size!27776 (_keys!10444 thiss!1141))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!27776 (_keys!10444 thiss!1141)) (size!27776 (_keys!10444 thiss!1141))))))

(assert (=> d!113887 (= (arrayCountValidKeys!0 (_keys!10444 thiss!1141) #b00000000000000000000000000000000 (size!27776 (_keys!10444 thiss!1141))) lt!424766)))

(declare-fun b!941339 () Bool)

(assert (=> b!941339 (= e!529199 call!40900)))

(declare-fun b!941340 () Bool)

(assert (=> b!941340 (= e!529198 #b00000000000000000000000000000000)))

(declare-fun bm!40897 () Bool)

(assert (=> bm!40897 (= call!40900 (arrayCountValidKeys!0 (_keys!10444 thiss!1141) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!27776 (_keys!10444 thiss!1141))))))

(assert (= (and d!113887 c!98033) b!941340))

(assert (= (and d!113887 (not c!98033)) b!941338))

(assert (= (and b!941338 c!98032) b!941337))

(assert (= (and b!941338 (not c!98032)) b!941339))

(assert (= (or b!941337 b!941339) bm!40897))

(declare-fun m!875837 () Bool)

(assert (=> b!941338 m!875837))

(assert (=> b!941338 m!875837))

(declare-fun m!875839 () Bool)

(assert (=> b!941338 m!875839))

(declare-fun m!875841 () Bool)

(assert (=> bm!40897 m!875841))

(assert (=> b!941261 d!113887))

(declare-fun b!941349 () Bool)

(declare-fun e!529207 () Bool)

(declare-fun call!40903 () Bool)

(assert (=> b!941349 (= e!529207 call!40903)))

(declare-fun d!113889 () Bool)

(declare-fun res!632827 () Bool)

(declare-fun e!529208 () Bool)

(assert (=> d!113889 (=> res!632827 e!529208)))

(assert (=> d!113889 (= res!632827 (bvsge #b00000000000000000000000000000000 (size!27776 (_keys!10444 thiss!1141))))))

(assert (=> d!113889 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10444 thiss!1141) (mask!27156 thiss!1141)) e!529208)))

(declare-fun b!941350 () Bool)

(declare-fun e!529206 () Bool)

(assert (=> b!941350 (= e!529206 call!40903)))

(declare-fun bm!40900 () Bool)

(assert (=> bm!40900 (= call!40903 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!10444 thiss!1141) (mask!27156 thiss!1141)))))

(declare-fun b!941351 () Bool)

(assert (=> b!941351 (= e!529207 e!529206)))

(declare-fun lt!424775 () (_ BitVec 64))

(assert (=> b!941351 (= lt!424775 (select (arr!27312 (_keys!10444 thiss!1141)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!31687 0))(
  ( (Unit!31688) )
))
(declare-fun lt!424773 () Unit!31687)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!56757 (_ BitVec 64) (_ BitVec 32)) Unit!31687)

(assert (=> b!941351 (= lt!424773 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10444 thiss!1141) lt!424775 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!56757 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!941351 (arrayContainsKey!0 (_keys!10444 thiss!1141) lt!424775 #b00000000000000000000000000000000)))

(declare-fun lt!424774 () Unit!31687)

(assert (=> b!941351 (= lt!424774 lt!424773)))

(declare-fun res!632826 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!56757 (_ BitVec 32)) SeekEntryResult!9020)

(assert (=> b!941351 (= res!632826 (= (seekEntryOrOpen!0 (select (arr!27312 (_keys!10444 thiss!1141)) #b00000000000000000000000000000000) (_keys!10444 thiss!1141) (mask!27156 thiss!1141)) (Found!9020 #b00000000000000000000000000000000)))))

(assert (=> b!941351 (=> (not res!632826) (not e!529206))))

(declare-fun b!941352 () Bool)

(assert (=> b!941352 (= e!529208 e!529207)))

(declare-fun c!98036 () Bool)

(assert (=> b!941352 (= c!98036 (validKeyInArray!0 (select (arr!27312 (_keys!10444 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (= (and d!113889 (not res!632827)) b!941352))

(assert (= (and b!941352 c!98036) b!941351))

(assert (= (and b!941352 (not c!98036)) b!941349))

(assert (= (and b!941351 res!632826) b!941350))

(assert (= (or b!941350 b!941349) bm!40900))

(declare-fun m!875843 () Bool)

(assert (=> bm!40900 m!875843))

(assert (=> b!941351 m!875837))

(declare-fun m!875845 () Bool)

(assert (=> b!941351 m!875845))

(declare-fun m!875847 () Bool)

(assert (=> b!941351 m!875847))

(assert (=> b!941351 m!875837))

(declare-fun m!875849 () Bool)

(assert (=> b!941351 m!875849))

(assert (=> b!941352 m!875837))

(assert (=> b!941352 m!875837))

(assert (=> b!941352 m!875839))

(assert (=> b!941262 d!113889))

(declare-fun lt!424781 () SeekEntryResult!9020)

(declare-fun d!113891 () Bool)

(assert (=> d!113891 (and (or ((_ is Undefined!9020) lt!424781) (not ((_ is Found!9020) lt!424781)) (and (bvsge (index!38452 lt!424781) #b00000000000000000000000000000000) (bvslt (index!38452 lt!424781) (size!27776 (_keys!10444 thiss!1141))))) (or ((_ is Undefined!9020) lt!424781) ((_ is Found!9020) lt!424781) (not ((_ is MissingVacant!9020) lt!424781)) (not (= (index!38454 lt!424781) (index!38453 lt!424749))) (and (bvsge (index!38454 lt!424781) #b00000000000000000000000000000000) (bvslt (index!38454 lt!424781) (size!27776 (_keys!10444 thiss!1141))))) (or ((_ is Undefined!9020) lt!424781) (ite ((_ is Found!9020) lt!424781) (= (select (arr!27312 (_keys!10444 thiss!1141)) (index!38452 lt!424781)) key!756) (and ((_ is MissingVacant!9020) lt!424781) (= (index!38454 lt!424781) (index!38453 lt!424749)) (= (select (arr!27312 (_keys!10444 thiss!1141)) (index!38454 lt!424781)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!529215 () SeekEntryResult!9020)

(assert (=> d!113891 (= lt!424781 e!529215)))

(declare-fun c!98044 () Bool)

(assert (=> d!113891 (= c!98044 (bvsge (x!80781 lt!424749) #b01111111111111111111111111111110))))

(declare-fun lt!424780 () (_ BitVec 64))

(assert (=> d!113891 (= lt!424780 (select (arr!27312 (_keys!10444 thiss!1141)) (index!38453 lt!424749)))))

(assert (=> d!113891 (validMask!0 (mask!27156 thiss!1141))))

(assert (=> d!113891 (= (seekKeyOrZeroReturnVacant!0 (x!80781 lt!424749) (index!38453 lt!424749) (index!38453 lt!424749) key!756 (_keys!10444 thiss!1141) (mask!27156 thiss!1141)) lt!424781)))

(declare-fun b!941365 () Bool)

(declare-fun e!529216 () SeekEntryResult!9020)

(assert (=> b!941365 (= e!529216 (MissingVacant!9020 (index!38453 lt!424749)))))

(declare-fun b!941366 () Bool)

(declare-fun e!529217 () SeekEntryResult!9020)

(assert (=> b!941366 (= e!529215 e!529217)))

(declare-fun c!98045 () Bool)

(assert (=> b!941366 (= c!98045 (= lt!424780 key!756))))

(declare-fun b!941367 () Bool)

(assert (=> b!941367 (= e!529217 (Found!9020 (index!38453 lt!424749)))))

(declare-fun b!941368 () Bool)

(declare-fun c!98043 () Bool)

(assert (=> b!941368 (= c!98043 (= lt!424780 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!941368 (= e!529217 e!529216)))

(declare-fun b!941369 () Bool)

(assert (=> b!941369 (= e!529215 Undefined!9020)))

(declare-fun b!941370 () Bool)

(assert (=> b!941370 (= e!529216 (seekKeyOrZeroReturnVacant!0 (bvadd (x!80781 lt!424749) #b00000000000000000000000000000001) (nextIndex!0 (index!38453 lt!424749) (x!80781 lt!424749) (mask!27156 thiss!1141)) (index!38453 lt!424749) key!756 (_keys!10444 thiss!1141) (mask!27156 thiss!1141)))))

(assert (= (and d!113891 c!98044) b!941369))

(assert (= (and d!113891 (not c!98044)) b!941366))

(assert (= (and b!941366 c!98045) b!941367))

(assert (= (and b!941366 (not c!98045)) b!941368))

(assert (= (and b!941368 c!98043) b!941365))

(assert (= (and b!941368 (not c!98043)) b!941370))

(declare-fun m!875851 () Bool)

(assert (=> d!113891 m!875851))

(declare-fun m!875853 () Bool)

(assert (=> d!113891 m!875853))

(assert (=> d!113891 m!875823))

(assert (=> d!113891 m!875775))

(declare-fun m!875855 () Bool)

(assert (=> b!941370 m!875855))

(assert (=> b!941370 m!875855))

(declare-fun m!875857 () Bool)

(assert (=> b!941370 m!875857))

(assert (=> b!941276 d!113891))

(declare-fun b!941381 () Bool)

(declare-fun e!529228 () Bool)

(declare-fun contains!5095 (List!19217 (_ BitVec 64)) Bool)

(assert (=> b!941381 (= e!529228 (contains!5095 Nil!19214 (select (arr!27312 (_keys!10444 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun bm!40903 () Bool)

(declare-fun call!40906 () Bool)

(declare-fun c!98048 () Bool)

(assert (=> bm!40903 (= call!40906 (arrayNoDuplicates!0 (_keys!10444 thiss!1141) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!98048 (Cons!19213 (select (arr!27312 (_keys!10444 thiss!1141)) #b00000000000000000000000000000000) Nil!19214) Nil!19214)))))

(declare-fun b!941382 () Bool)

(declare-fun e!529229 () Bool)

(declare-fun e!529226 () Bool)

(assert (=> b!941382 (= e!529229 e!529226)))

(declare-fun res!632834 () Bool)

(assert (=> b!941382 (=> (not res!632834) (not e!529226))))

(assert (=> b!941382 (= res!632834 (not e!529228))))

(declare-fun res!632835 () Bool)

(assert (=> b!941382 (=> (not res!632835) (not e!529228))))

(assert (=> b!941382 (= res!632835 (validKeyInArray!0 (select (arr!27312 (_keys!10444 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!941384 () Bool)

(declare-fun e!529227 () Bool)

(assert (=> b!941384 (= e!529226 e!529227)))

(assert (=> b!941384 (= c!98048 (validKeyInArray!0 (select (arr!27312 (_keys!10444 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!941385 () Bool)

(assert (=> b!941385 (= e!529227 call!40906)))

(declare-fun d!113893 () Bool)

(declare-fun res!632836 () Bool)

(assert (=> d!113893 (=> res!632836 e!529229)))

(assert (=> d!113893 (= res!632836 (bvsge #b00000000000000000000000000000000 (size!27776 (_keys!10444 thiss!1141))))))

(assert (=> d!113893 (= (arrayNoDuplicates!0 (_keys!10444 thiss!1141) #b00000000000000000000000000000000 Nil!19214) e!529229)))

(declare-fun b!941383 () Bool)

(assert (=> b!941383 (= e!529227 call!40906)))

(assert (= (and d!113893 (not res!632836)) b!941382))

(assert (= (and b!941382 res!632835) b!941381))

(assert (= (and b!941382 res!632834) b!941384))

(assert (= (and b!941384 c!98048) b!941383))

(assert (= (and b!941384 (not c!98048)) b!941385))

(assert (= (or b!941383 b!941385) bm!40903))

(assert (=> b!941381 m!875837))

(assert (=> b!941381 m!875837))

(declare-fun m!875859 () Bool)

(assert (=> b!941381 m!875859))

(assert (=> bm!40903 m!875837))

(declare-fun m!875861 () Bool)

(assert (=> bm!40903 m!875861))

(assert (=> b!941382 m!875837))

(assert (=> b!941382 m!875837))

(assert (=> b!941382 m!875839))

(assert (=> b!941384 m!875837))

(assert (=> b!941384 m!875837))

(assert (=> b!941384 m!875839))

(assert (=> b!941263 d!113893))

(declare-fun b!941387 () Bool)

(declare-fun e!529230 () Bool)

(assert (=> b!941387 (= e!529230 tp_is_empty!20419)))

(declare-fun b!941386 () Bool)

(declare-fun e!529231 () Bool)

(assert (=> b!941386 (= e!529231 tp_is_empty!20419)))

(declare-fun condMapEmpty!32436 () Bool)

(declare-fun mapDefault!32436 () ValueCell!9728)

(assert (=> mapNonEmpty!32435 (= condMapEmpty!32436 (= mapRest!32435 ((as const (Array (_ BitVec 32) ValueCell!9728)) mapDefault!32436)))))

(declare-fun mapRes!32436 () Bool)

(assert (=> mapNonEmpty!32435 (= tp!62231 (and e!529230 mapRes!32436))))

(declare-fun mapIsEmpty!32436 () Bool)

(assert (=> mapIsEmpty!32436 mapRes!32436))

(declare-fun mapNonEmpty!32436 () Bool)

(declare-fun tp!62232 () Bool)

(assert (=> mapNonEmpty!32436 (= mapRes!32436 (and tp!62232 e!529231))))

(declare-fun mapRest!32436 () (Array (_ BitVec 32) ValueCell!9728))

(declare-fun mapKey!32436 () (_ BitVec 32))

(declare-fun mapValue!32436 () ValueCell!9728)

(assert (=> mapNonEmpty!32436 (= mapRest!32435 (store mapRest!32436 mapKey!32436 mapValue!32436))))

(assert (= (and mapNonEmpty!32435 condMapEmpty!32436) mapIsEmpty!32436))

(assert (= (and mapNonEmpty!32435 (not condMapEmpty!32436)) mapNonEmpty!32436))

(assert (= (and mapNonEmpty!32436 ((_ is ValueCellFull!9728) mapValue!32436)) b!941386))

(assert (= (and mapNonEmpty!32435 ((_ is ValueCellFull!9728) mapDefault!32436)) b!941387))

(declare-fun m!875863 () Bool)

(assert (=> mapNonEmpty!32436 m!875863))

(check-sat (not b!941300) (not mapNonEmpty!32436) (not bm!40897) b_and!29297 (not bm!40900) (not b!941338) (not b_next!17911) (not b!941351) (not b!941370) (not bm!40903) tp_is_empty!20419 (not b!941326) (not d!113883) (not b!941352) (not b!941384) (not b!941382) (not d!113881) (not d!113891) (not b!941299) (not b!941381))
(check-sat b_and!29297 (not b_next!17911))
