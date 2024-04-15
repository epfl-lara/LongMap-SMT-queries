; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!80148 () Bool)

(assert start!80148)

(declare-fun b!941720 () Bool)

(declare-fun b_free!17929 () Bool)

(declare-fun b_next!17929 () Bool)

(assert (=> b!941720 (= b_free!17929 (not b_next!17929))))

(declare-fun tp!62280 () Bool)

(declare-fun b_and!29315 () Bool)

(assert (=> b!941720 (= tp!62280 b_and!29315)))

(declare-fun res!632972 () Bool)

(declare-fun e!529446 () Bool)

(assert (=> start!80148 (=> (not res!632972) (not e!529446))))

(declare-datatypes ((V!32215 0))(
  ( (V!32216 (val!10269 Int)) )
))
(declare-datatypes ((ValueCell!9737 0))(
  ( (ValueCellFull!9737 (v!12799 V!32215)) (EmptyCell!9737) )
))
(declare-datatypes ((array!56797 0))(
  ( (array!56798 (arr!27329 (Array (_ BitVec 32) ValueCell!9737)) (size!27795 (_ BitVec 32))) )
))
(declare-datatypes ((array!56799 0))(
  ( (array!56800 (arr!27330 (Array (_ BitVec 32) (_ BitVec 64))) (size!27796 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4624 0))(
  ( (LongMapFixedSize!4625 (defaultEntry!5603 Int) (mask!27185 (_ BitVec 32)) (extraKeys!5335 (_ BitVec 32)) (zeroValue!5439 V!32215) (minValue!5439 V!32215) (_size!2367 (_ BitVec 32)) (_keys!10462 array!56799) (_values!5626 array!56797) (_vacant!2367 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4624)

(declare-fun valid!1781 (LongMapFixedSize!4624) Bool)

(assert (=> start!80148 (= res!632972 (valid!1781 thiss!1141))))

(assert (=> start!80148 e!529446))

(declare-fun e!529444 () Bool)

(assert (=> start!80148 e!529444))

(assert (=> start!80148 true))

(declare-fun b!941716 () Bool)

(declare-fun res!632975 () Bool)

(assert (=> b!941716 (=> (not res!632975) (not e!529446))))

(declare-fun key!756 () (_ BitVec 64))

(get-info :version)

(declare-datatypes ((SeekEntryResult!9027 0))(
  ( (MissingZero!9027 (index!38479 (_ BitVec 32))) (Found!9027 (index!38480 (_ BitVec 32))) (Intermediate!9027 (undefined!9839 Bool) (index!38481 (_ BitVec 32)) (x!80854 (_ BitVec 32))) (Undefined!9027) (MissingVacant!9027 (index!38482 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!56799 (_ BitVec 32)) SeekEntryResult!9027)

(assert (=> b!941716 (= res!632975 (not ((_ is Found!9027) (seekEntry!0 key!756 (_keys!10462 thiss!1141) (mask!27185 thiss!1141)))))))

(declare-fun mapNonEmpty!32464 () Bool)

(declare-fun mapRes!32464 () Bool)

(declare-fun tp!62281 () Bool)

(declare-fun e!529445 () Bool)

(assert (=> mapNonEmpty!32464 (= mapRes!32464 (and tp!62281 e!529445))))

(declare-fun mapValue!32464 () ValueCell!9737)

(declare-fun mapKey!32464 () (_ BitVec 32))

(declare-fun mapRest!32464 () (Array (_ BitVec 32) ValueCell!9737))

(assert (=> mapNonEmpty!32464 (= (arr!27329 (_values!5626 thiss!1141)) (store mapRest!32464 mapKey!32464 mapValue!32464))))

(declare-fun b!941717 () Bool)

(declare-fun e!529447 () Bool)

(declare-fun e!529449 () Bool)

(assert (=> b!941717 (= e!529447 (and e!529449 mapRes!32464))))

(declare-fun condMapEmpty!32464 () Bool)

(declare-fun mapDefault!32464 () ValueCell!9737)

(assert (=> b!941717 (= condMapEmpty!32464 (= (arr!27329 (_values!5626 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9737)) mapDefault!32464)))))

(declare-fun b!941718 () Bool)

(assert (=> b!941718 (= e!529446 (and (= (size!27795 (_values!5626 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27185 thiss!1141))) (= (size!27796 (_keys!10462 thiss!1141)) (size!27795 (_values!5626 thiss!1141))) (bvsge (mask!27185 thiss!1141) #b00000000000000000000000000000000) (bvsge (extraKeys!5335 thiss!1141) #b00000000000000000000000000000000) (bvsgt (extraKeys!5335 thiss!1141) #b00000000000000000000000000000011)))))

(declare-fun b!941719 () Bool)

(declare-fun tp_is_empty!20437 () Bool)

(assert (=> b!941719 (= e!529445 tp_is_empty!20437)))

(declare-fun array_inv!21306 (array!56799) Bool)

(declare-fun array_inv!21307 (array!56797) Bool)

(assert (=> b!941720 (= e!529444 (and tp!62280 tp_is_empty!20437 (array_inv!21306 (_keys!10462 thiss!1141)) (array_inv!21307 (_values!5626 thiss!1141)) e!529447))))

(declare-fun b!941721 () Bool)

(declare-fun res!632974 () Bool)

(assert (=> b!941721 (=> (not res!632974) (not e!529446))))

(assert (=> b!941721 (= res!632974 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!941722 () Bool)

(declare-fun res!632973 () Bool)

(assert (=> b!941722 (=> (not res!632973) (not e!529446))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!941722 (= res!632973 (validMask!0 (mask!27185 thiss!1141)))))

(declare-fun mapIsEmpty!32464 () Bool)

(assert (=> mapIsEmpty!32464 mapRes!32464))

(declare-fun b!941723 () Bool)

(assert (=> b!941723 (= e!529449 tp_is_empty!20437)))

(assert (= (and start!80148 res!632972) b!941721))

(assert (= (and b!941721 res!632974) b!941716))

(assert (= (and b!941716 res!632975) b!941722))

(assert (= (and b!941722 res!632973) b!941718))

(assert (= (and b!941717 condMapEmpty!32464) mapIsEmpty!32464))

(assert (= (and b!941717 (not condMapEmpty!32464)) mapNonEmpty!32464))

(assert (= (and mapNonEmpty!32464 ((_ is ValueCellFull!9737) mapValue!32464)) b!941719))

(assert (= (and b!941717 ((_ is ValueCellFull!9737) mapDefault!32464)) b!941723))

(assert (= b!941720 b!941717))

(assert (= start!80148 b!941720))

(declare-fun m!876015 () Bool)

(assert (=> b!941716 m!876015))

(declare-fun m!876017 () Bool)

(assert (=> b!941720 m!876017))

(declare-fun m!876019 () Bool)

(assert (=> b!941720 m!876019))

(declare-fun m!876021 () Bool)

(assert (=> mapNonEmpty!32464 m!876021))

(declare-fun m!876023 () Bool)

(assert (=> b!941722 m!876023))

(declare-fun m!876025 () Bool)

(assert (=> start!80148 m!876025))

(check-sat (not start!80148) (not b!941716) b_and!29315 (not mapNonEmpty!32464) (not b_next!17929) (not b!941720) (not b!941722) tp_is_empty!20437)
(check-sat b_and!29315 (not b_next!17929))
(get-model)

(declare-fun d!113935 () Bool)

(declare-fun res!633006 () Bool)

(declare-fun e!529488 () Bool)

(assert (=> d!113935 (=> (not res!633006) (not e!529488))))

(declare-fun simpleValid!344 (LongMapFixedSize!4624) Bool)

(assert (=> d!113935 (= res!633006 (simpleValid!344 thiss!1141))))

(assert (=> d!113935 (= (valid!1781 thiss!1141) e!529488)))

(declare-fun b!941778 () Bool)

(declare-fun res!633007 () Bool)

(assert (=> b!941778 (=> (not res!633007) (not e!529488))))

(declare-fun arrayCountValidKeys!0 (array!56799 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!941778 (= res!633007 (= (arrayCountValidKeys!0 (_keys!10462 thiss!1141) #b00000000000000000000000000000000 (size!27796 (_keys!10462 thiss!1141))) (_size!2367 thiss!1141)))))

(declare-fun b!941779 () Bool)

(declare-fun res!633008 () Bool)

(assert (=> b!941779 (=> (not res!633008) (not e!529488))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56799 (_ BitVec 32)) Bool)

(assert (=> b!941779 (= res!633008 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10462 thiss!1141) (mask!27185 thiss!1141)))))

(declare-fun b!941780 () Bool)

(declare-datatypes ((List!19220 0))(
  ( (Nil!19217) (Cons!19216 (h!20365 (_ BitVec 64)) (t!27526 List!19220)) )
))
(declare-fun arrayNoDuplicates!0 (array!56799 (_ BitVec 32) List!19220) Bool)

(assert (=> b!941780 (= e!529488 (arrayNoDuplicates!0 (_keys!10462 thiss!1141) #b00000000000000000000000000000000 Nil!19217))))

(assert (= (and d!113935 res!633006) b!941778))

(assert (= (and b!941778 res!633007) b!941779))

(assert (= (and b!941779 res!633008) b!941780))

(declare-fun m!876051 () Bool)

(assert (=> d!113935 m!876051))

(declare-fun m!876053 () Bool)

(assert (=> b!941778 m!876053))

(declare-fun m!876055 () Bool)

(assert (=> b!941779 m!876055))

(declare-fun m!876057 () Bool)

(assert (=> b!941780 m!876057))

(assert (=> start!80148 d!113935))

(declare-fun d!113937 () Bool)

(assert (=> d!113937 (= (validMask!0 (mask!27185 thiss!1141)) (and (or (= (mask!27185 thiss!1141) #b00000000000000000000000000000111) (= (mask!27185 thiss!1141) #b00000000000000000000000000001111) (= (mask!27185 thiss!1141) #b00000000000000000000000000011111) (= (mask!27185 thiss!1141) #b00000000000000000000000000111111) (= (mask!27185 thiss!1141) #b00000000000000000000000001111111) (= (mask!27185 thiss!1141) #b00000000000000000000000011111111) (= (mask!27185 thiss!1141) #b00000000000000000000000111111111) (= (mask!27185 thiss!1141) #b00000000000000000000001111111111) (= (mask!27185 thiss!1141) #b00000000000000000000011111111111) (= (mask!27185 thiss!1141) #b00000000000000000000111111111111) (= (mask!27185 thiss!1141) #b00000000000000000001111111111111) (= (mask!27185 thiss!1141) #b00000000000000000011111111111111) (= (mask!27185 thiss!1141) #b00000000000000000111111111111111) (= (mask!27185 thiss!1141) #b00000000000000001111111111111111) (= (mask!27185 thiss!1141) #b00000000000000011111111111111111) (= (mask!27185 thiss!1141) #b00000000000000111111111111111111) (= (mask!27185 thiss!1141) #b00000000000001111111111111111111) (= (mask!27185 thiss!1141) #b00000000000011111111111111111111) (= (mask!27185 thiss!1141) #b00000000000111111111111111111111) (= (mask!27185 thiss!1141) #b00000000001111111111111111111111) (= (mask!27185 thiss!1141) #b00000000011111111111111111111111) (= (mask!27185 thiss!1141) #b00000000111111111111111111111111) (= (mask!27185 thiss!1141) #b00000001111111111111111111111111) (= (mask!27185 thiss!1141) #b00000011111111111111111111111111) (= (mask!27185 thiss!1141) #b00000111111111111111111111111111) (= (mask!27185 thiss!1141) #b00001111111111111111111111111111) (= (mask!27185 thiss!1141) #b00011111111111111111111111111111) (= (mask!27185 thiss!1141) #b00111111111111111111111111111111)) (bvsle (mask!27185 thiss!1141) #b00111111111111111111111111111111)))))

(assert (=> b!941722 d!113937))

(declare-fun b!941793 () Bool)

(declare-fun c!98104 () Bool)

(declare-fun lt!424844 () (_ BitVec 64))

(assert (=> b!941793 (= c!98104 (= lt!424844 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!529496 () SeekEntryResult!9027)

(declare-fun e!529497 () SeekEntryResult!9027)

(assert (=> b!941793 (= e!529496 e!529497)))

(declare-fun b!941794 () Bool)

(declare-fun lt!424846 () SeekEntryResult!9027)

(assert (=> b!941794 (= e!529496 (Found!9027 (index!38481 lt!424846)))))

(declare-fun b!941795 () Bool)

(assert (=> b!941795 (= e!529497 (MissingZero!9027 (index!38481 lt!424846)))))

(declare-fun d!113939 () Bool)

(declare-fun lt!424847 () SeekEntryResult!9027)

(assert (=> d!113939 (and (or ((_ is MissingVacant!9027) lt!424847) (not ((_ is Found!9027) lt!424847)) (and (bvsge (index!38480 lt!424847) #b00000000000000000000000000000000) (bvslt (index!38480 lt!424847) (size!27796 (_keys!10462 thiss!1141))))) (not ((_ is MissingVacant!9027) lt!424847)) (or (not ((_ is Found!9027) lt!424847)) (= (select (arr!27330 (_keys!10462 thiss!1141)) (index!38480 lt!424847)) key!756)))))

(declare-fun e!529495 () SeekEntryResult!9027)

(assert (=> d!113939 (= lt!424847 e!529495)))

(declare-fun c!98105 () Bool)

(assert (=> d!113939 (= c!98105 (and ((_ is Intermediate!9027) lt!424846) (undefined!9839 lt!424846)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!56799 (_ BitVec 32)) SeekEntryResult!9027)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!113939 (= lt!424846 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!756 (mask!27185 thiss!1141)) key!756 (_keys!10462 thiss!1141) (mask!27185 thiss!1141)))))

(assert (=> d!113939 (validMask!0 (mask!27185 thiss!1141))))

(assert (=> d!113939 (= (seekEntry!0 key!756 (_keys!10462 thiss!1141) (mask!27185 thiss!1141)) lt!424847)))

(declare-fun b!941796 () Bool)

(assert (=> b!941796 (= e!529495 Undefined!9027)))

(declare-fun b!941797 () Bool)

(assert (=> b!941797 (= e!529495 e!529496)))

(assert (=> b!941797 (= lt!424844 (select (arr!27330 (_keys!10462 thiss!1141)) (index!38481 lt!424846)))))

(declare-fun c!98103 () Bool)

(assert (=> b!941797 (= c!98103 (= lt!424844 key!756))))

(declare-fun b!941798 () Bool)

(declare-fun lt!424845 () SeekEntryResult!9027)

(assert (=> b!941798 (= e!529497 (ite ((_ is MissingVacant!9027) lt!424845) (MissingZero!9027 (index!38482 lt!424845)) lt!424845))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!56799 (_ BitVec 32)) SeekEntryResult!9027)

(assert (=> b!941798 (= lt!424845 (seekKeyOrZeroReturnVacant!0 (x!80854 lt!424846) (index!38481 lt!424846) (index!38481 lt!424846) key!756 (_keys!10462 thiss!1141) (mask!27185 thiss!1141)))))

(assert (= (and d!113939 c!98105) b!941796))

(assert (= (and d!113939 (not c!98105)) b!941797))

(assert (= (and b!941797 c!98103) b!941794))

(assert (= (and b!941797 (not c!98103)) b!941793))

(assert (= (and b!941793 c!98104) b!941795))

(assert (= (and b!941793 (not c!98104)) b!941798))

(declare-fun m!876059 () Bool)

(assert (=> d!113939 m!876059))

(declare-fun m!876061 () Bool)

(assert (=> d!113939 m!876061))

(assert (=> d!113939 m!876061))

(declare-fun m!876063 () Bool)

(assert (=> d!113939 m!876063))

(assert (=> d!113939 m!876023))

(declare-fun m!876065 () Bool)

(assert (=> b!941797 m!876065))

(declare-fun m!876067 () Bool)

(assert (=> b!941798 m!876067))

(assert (=> b!941716 d!113939))

(declare-fun d!113941 () Bool)

(assert (=> d!113941 (= (array_inv!21306 (_keys!10462 thiss!1141)) (bvsge (size!27796 (_keys!10462 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!941720 d!113941))

(declare-fun d!113943 () Bool)

(assert (=> d!113943 (= (array_inv!21307 (_values!5626 thiss!1141)) (bvsge (size!27795 (_values!5626 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!941720 d!113943))

(declare-fun mapIsEmpty!32473 () Bool)

(declare-fun mapRes!32473 () Bool)

(assert (=> mapIsEmpty!32473 mapRes!32473))

(declare-fun b!941805 () Bool)

(declare-fun e!529503 () Bool)

(assert (=> b!941805 (= e!529503 tp_is_empty!20437)))

(declare-fun condMapEmpty!32473 () Bool)

(declare-fun mapDefault!32473 () ValueCell!9737)

(assert (=> mapNonEmpty!32464 (= condMapEmpty!32473 (= mapRest!32464 ((as const (Array (_ BitVec 32) ValueCell!9737)) mapDefault!32473)))))

(declare-fun e!529502 () Bool)

(assert (=> mapNonEmpty!32464 (= tp!62281 (and e!529502 mapRes!32473))))

(declare-fun b!941806 () Bool)

(assert (=> b!941806 (= e!529502 tp_is_empty!20437)))

(declare-fun mapNonEmpty!32473 () Bool)

(declare-fun tp!62296 () Bool)

(assert (=> mapNonEmpty!32473 (= mapRes!32473 (and tp!62296 e!529503))))

(declare-fun mapKey!32473 () (_ BitVec 32))

(declare-fun mapValue!32473 () ValueCell!9737)

(declare-fun mapRest!32473 () (Array (_ BitVec 32) ValueCell!9737))

(assert (=> mapNonEmpty!32473 (= mapRest!32464 (store mapRest!32473 mapKey!32473 mapValue!32473))))

(assert (= (and mapNonEmpty!32464 condMapEmpty!32473) mapIsEmpty!32473))

(assert (= (and mapNonEmpty!32464 (not condMapEmpty!32473)) mapNonEmpty!32473))

(assert (= (and mapNonEmpty!32473 ((_ is ValueCellFull!9737) mapValue!32473)) b!941805))

(assert (= (and mapNonEmpty!32464 ((_ is ValueCellFull!9737) mapDefault!32473)) b!941806))

(declare-fun m!876069 () Bool)

(assert (=> mapNonEmpty!32473 m!876069))

(check-sat (not d!113935) b_and!29315 (not b_next!17929) (not d!113939) (not b!941779) (not mapNonEmpty!32473) (not b!941778) (not b!941780) (not b!941798) tp_is_empty!20437)
(check-sat b_and!29315 (not b_next!17929))
(get-model)

(declare-fun b!941817 () Bool)

(declare-fun e!529512 () Bool)

(declare-fun e!529515 () Bool)

(assert (=> b!941817 (= e!529512 e!529515)))

(declare-fun res!633015 () Bool)

(assert (=> b!941817 (=> (not res!633015) (not e!529515))))

(declare-fun e!529514 () Bool)

(assert (=> b!941817 (= res!633015 (not e!529514))))

(declare-fun res!633016 () Bool)

(assert (=> b!941817 (=> (not res!633016) (not e!529514))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!941817 (= res!633016 (validKeyInArray!0 (select (arr!27330 (_keys!10462 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!941818 () Bool)

(declare-fun e!529513 () Bool)

(assert (=> b!941818 (= e!529515 e!529513)))

(declare-fun c!98108 () Bool)

(assert (=> b!941818 (= c!98108 (validKeyInArray!0 (select (arr!27330 (_keys!10462 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!941819 () Bool)

(declare-fun call!40918 () Bool)

(assert (=> b!941819 (= e!529513 call!40918)))

(declare-fun d!113945 () Bool)

(declare-fun res!633017 () Bool)

(assert (=> d!113945 (=> res!633017 e!529512)))

(assert (=> d!113945 (= res!633017 (bvsge #b00000000000000000000000000000000 (size!27796 (_keys!10462 thiss!1141))))))

(assert (=> d!113945 (= (arrayNoDuplicates!0 (_keys!10462 thiss!1141) #b00000000000000000000000000000000 Nil!19217) e!529512)))

(declare-fun b!941820 () Bool)

(assert (=> b!941820 (= e!529513 call!40918)))

(declare-fun b!941821 () Bool)

(declare-fun contains!5097 (List!19220 (_ BitVec 64)) Bool)

(assert (=> b!941821 (= e!529514 (contains!5097 Nil!19217 (select (arr!27330 (_keys!10462 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun bm!40915 () Bool)

(assert (=> bm!40915 (= call!40918 (arrayNoDuplicates!0 (_keys!10462 thiss!1141) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!98108 (Cons!19216 (select (arr!27330 (_keys!10462 thiss!1141)) #b00000000000000000000000000000000) Nil!19217) Nil!19217)))))

(assert (= (and d!113945 (not res!633017)) b!941817))

(assert (= (and b!941817 res!633016) b!941821))

(assert (= (and b!941817 res!633015) b!941818))

(assert (= (and b!941818 c!98108) b!941819))

(assert (= (and b!941818 (not c!98108)) b!941820))

(assert (= (or b!941819 b!941820) bm!40915))

(declare-fun m!876071 () Bool)

(assert (=> b!941817 m!876071))

(assert (=> b!941817 m!876071))

(declare-fun m!876073 () Bool)

(assert (=> b!941817 m!876073))

(assert (=> b!941818 m!876071))

(assert (=> b!941818 m!876071))

(assert (=> b!941818 m!876073))

(assert (=> b!941821 m!876071))

(assert (=> b!941821 m!876071))

(declare-fun m!876075 () Bool)

(assert (=> b!941821 m!876075))

(assert (=> bm!40915 m!876071))

(declare-fun m!876077 () Bool)

(assert (=> bm!40915 m!876077))

(assert (=> b!941780 d!113945))

(declare-fun b!941834 () Bool)

(declare-fun e!529524 () SeekEntryResult!9027)

(declare-fun e!529523 () SeekEntryResult!9027)

(assert (=> b!941834 (= e!529524 e!529523)))

(declare-fun c!98117 () Bool)

(declare-fun lt!424852 () (_ BitVec 64))

(assert (=> b!941834 (= c!98117 (= lt!424852 key!756))))

(declare-fun b!941835 () Bool)

(assert (=> b!941835 (= e!529523 (Found!9027 (index!38481 lt!424846)))))

(declare-fun b!941836 () Bool)

(declare-fun e!529522 () SeekEntryResult!9027)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!941836 (= e!529522 (seekKeyOrZeroReturnVacant!0 (bvadd (x!80854 lt!424846) #b00000000000000000000000000000001) (nextIndex!0 (index!38481 lt!424846) (x!80854 lt!424846) (mask!27185 thiss!1141)) (index!38481 lt!424846) key!756 (_keys!10462 thiss!1141) (mask!27185 thiss!1141)))))

(declare-fun b!941837 () Bool)

(assert (=> b!941837 (= e!529524 Undefined!9027)))

(declare-fun b!941839 () Bool)

(declare-fun c!98115 () Bool)

(assert (=> b!941839 (= c!98115 (= lt!424852 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!941839 (= e!529523 e!529522)))

(declare-fun b!941838 () Bool)

(assert (=> b!941838 (= e!529522 (MissingVacant!9027 (index!38481 lt!424846)))))

(declare-fun d!113947 () Bool)

(declare-fun lt!424853 () SeekEntryResult!9027)

(assert (=> d!113947 (and (or ((_ is Undefined!9027) lt!424853) (not ((_ is Found!9027) lt!424853)) (and (bvsge (index!38480 lt!424853) #b00000000000000000000000000000000) (bvslt (index!38480 lt!424853) (size!27796 (_keys!10462 thiss!1141))))) (or ((_ is Undefined!9027) lt!424853) ((_ is Found!9027) lt!424853) (not ((_ is MissingVacant!9027) lt!424853)) (not (= (index!38482 lt!424853) (index!38481 lt!424846))) (and (bvsge (index!38482 lt!424853) #b00000000000000000000000000000000) (bvslt (index!38482 lt!424853) (size!27796 (_keys!10462 thiss!1141))))) (or ((_ is Undefined!9027) lt!424853) (ite ((_ is Found!9027) lt!424853) (= (select (arr!27330 (_keys!10462 thiss!1141)) (index!38480 lt!424853)) key!756) (and ((_ is MissingVacant!9027) lt!424853) (= (index!38482 lt!424853) (index!38481 lt!424846)) (= (select (arr!27330 (_keys!10462 thiss!1141)) (index!38482 lt!424853)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!113947 (= lt!424853 e!529524)))

(declare-fun c!98116 () Bool)

(assert (=> d!113947 (= c!98116 (bvsge (x!80854 lt!424846) #b01111111111111111111111111111110))))

(assert (=> d!113947 (= lt!424852 (select (arr!27330 (_keys!10462 thiss!1141)) (index!38481 lt!424846)))))

(assert (=> d!113947 (validMask!0 (mask!27185 thiss!1141))))

(assert (=> d!113947 (= (seekKeyOrZeroReturnVacant!0 (x!80854 lt!424846) (index!38481 lt!424846) (index!38481 lt!424846) key!756 (_keys!10462 thiss!1141) (mask!27185 thiss!1141)) lt!424853)))

(assert (= (and d!113947 c!98116) b!941837))

(assert (= (and d!113947 (not c!98116)) b!941834))

(assert (= (and b!941834 c!98117) b!941835))

(assert (= (and b!941834 (not c!98117)) b!941839))

(assert (= (and b!941839 c!98115) b!941838))

(assert (= (and b!941839 (not c!98115)) b!941836))

(declare-fun m!876079 () Bool)

(assert (=> b!941836 m!876079))

(assert (=> b!941836 m!876079))

(declare-fun m!876081 () Bool)

(assert (=> b!941836 m!876081))

(declare-fun m!876083 () Bool)

(assert (=> d!113947 m!876083))

(declare-fun m!876085 () Bool)

(assert (=> d!113947 m!876085))

(assert (=> d!113947 m!876065))

(assert (=> d!113947 m!876023))

(assert (=> b!941798 d!113947))

(declare-fun b!941858 () Bool)

(declare-fun e!529537 () SeekEntryResult!9027)

(assert (=> b!941858 (= e!529537 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!756 (mask!27185 thiss!1141)) #b00000000000000000000000000000000 (mask!27185 thiss!1141)) key!756 (_keys!10462 thiss!1141) (mask!27185 thiss!1141)))))

(declare-fun b!941859 () Bool)

(declare-fun e!529539 () Bool)

(declare-fun lt!424858 () SeekEntryResult!9027)

(assert (=> b!941859 (= e!529539 (bvsge (x!80854 lt!424858) #b01111111111111111111111111111110))))

(declare-fun b!941860 () Bool)

(declare-fun e!529538 () SeekEntryResult!9027)

(assert (=> b!941860 (= e!529538 e!529537)))

(declare-fun c!98125 () Bool)

(declare-fun lt!424859 () (_ BitVec 64))

(assert (=> b!941860 (= c!98125 (or (= lt!424859 key!756) (= (bvadd lt!424859 lt!424859) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!941861 () Bool)

(assert (=> b!941861 (and (bvsge (index!38481 lt!424858) #b00000000000000000000000000000000) (bvslt (index!38481 lt!424858) (size!27796 (_keys!10462 thiss!1141))))))

(declare-fun e!529535 () Bool)

(assert (=> b!941861 (= e!529535 (= (select (arr!27330 (_keys!10462 thiss!1141)) (index!38481 lt!424858)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!941862 () Bool)

(declare-fun e!529536 () Bool)

(assert (=> b!941862 (= e!529539 e!529536)))

(declare-fun res!633024 () Bool)

(assert (=> b!941862 (= res!633024 (and ((_ is Intermediate!9027) lt!424858) (not (undefined!9839 lt!424858)) (bvslt (x!80854 lt!424858) #b01111111111111111111111111111110) (bvsge (x!80854 lt!424858) #b00000000000000000000000000000000) (bvsge (x!80854 lt!424858) #b00000000000000000000000000000000)))))

(assert (=> b!941862 (=> (not res!633024) (not e!529536))))

(declare-fun d!113949 () Bool)

(assert (=> d!113949 e!529539))

(declare-fun c!98126 () Bool)

(assert (=> d!113949 (= c!98126 (and ((_ is Intermediate!9027) lt!424858) (undefined!9839 lt!424858)))))

(assert (=> d!113949 (= lt!424858 e!529538)))

(declare-fun c!98124 () Bool)

(assert (=> d!113949 (= c!98124 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!113949 (= lt!424859 (select (arr!27330 (_keys!10462 thiss!1141)) (toIndex!0 key!756 (mask!27185 thiss!1141))))))

(assert (=> d!113949 (validMask!0 (mask!27185 thiss!1141))))

(assert (=> d!113949 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!756 (mask!27185 thiss!1141)) key!756 (_keys!10462 thiss!1141) (mask!27185 thiss!1141)) lt!424858)))

(declare-fun b!941863 () Bool)

(assert (=> b!941863 (and (bvsge (index!38481 lt!424858) #b00000000000000000000000000000000) (bvslt (index!38481 lt!424858) (size!27796 (_keys!10462 thiss!1141))))))

(declare-fun res!633025 () Bool)

(assert (=> b!941863 (= res!633025 (= (select (arr!27330 (_keys!10462 thiss!1141)) (index!38481 lt!424858)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!941863 (=> res!633025 e!529535)))

(declare-fun b!941864 () Bool)

(assert (=> b!941864 (= e!529537 (Intermediate!9027 false (toIndex!0 key!756 (mask!27185 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun b!941865 () Bool)

(assert (=> b!941865 (and (bvsge (index!38481 lt!424858) #b00000000000000000000000000000000) (bvslt (index!38481 lt!424858) (size!27796 (_keys!10462 thiss!1141))))))

(declare-fun res!633026 () Bool)

(assert (=> b!941865 (= res!633026 (= (select (arr!27330 (_keys!10462 thiss!1141)) (index!38481 lt!424858)) key!756))))

(assert (=> b!941865 (=> res!633026 e!529535)))

(assert (=> b!941865 (= e!529536 e!529535)))

(declare-fun b!941866 () Bool)

(assert (=> b!941866 (= e!529538 (Intermediate!9027 true (toIndex!0 key!756 (mask!27185 thiss!1141)) #b00000000000000000000000000000000))))

(assert (= (and d!113949 c!98124) b!941866))

(assert (= (and d!113949 (not c!98124)) b!941860))

(assert (= (and b!941860 c!98125) b!941864))

(assert (= (and b!941860 (not c!98125)) b!941858))

(assert (= (and d!113949 c!98126) b!941859))

(assert (= (and d!113949 (not c!98126)) b!941862))

(assert (= (and b!941862 res!633024) b!941865))

(assert (= (and b!941865 (not res!633026)) b!941863))

(assert (= (and b!941863 (not res!633025)) b!941861))

(declare-fun m!876087 () Bool)

(assert (=> b!941863 m!876087))

(assert (=> b!941858 m!876061))

(declare-fun m!876089 () Bool)

(assert (=> b!941858 m!876089))

(assert (=> b!941858 m!876089))

(declare-fun m!876091 () Bool)

(assert (=> b!941858 m!876091))

(assert (=> d!113949 m!876061))

(declare-fun m!876093 () Bool)

(assert (=> d!113949 m!876093))

(assert (=> d!113949 m!876023))

(assert (=> b!941865 m!876087))

(assert (=> b!941861 m!876087))

(assert (=> d!113939 d!113949))

(declare-fun d!113951 () Bool)

(declare-fun lt!424865 () (_ BitVec 32))

(declare-fun lt!424864 () (_ BitVec 32))

(assert (=> d!113951 (= lt!424865 (bvmul (bvxor lt!424864 (bvlshr lt!424864 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!113951 (= lt!424864 ((_ extract 31 0) (bvand (bvxor key!756 (bvlshr key!756 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!113951 (and (bvsge (mask!27185 thiss!1141) #b00000000000000000000000000000000) (let ((res!633027 (let ((h!20366 ((_ extract 31 0) (bvand (bvxor key!756 (bvlshr key!756 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!80872 (bvmul (bvxor h!20366 (bvlshr h!20366 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!80872 (bvlshr x!80872 #b00000000000000000000000000001101)) (mask!27185 thiss!1141)))))) (and (bvslt res!633027 (bvadd (mask!27185 thiss!1141) #b00000000000000000000000000000001)) (bvsge res!633027 #b00000000000000000000000000000000))))))

(assert (=> d!113951 (= (toIndex!0 key!756 (mask!27185 thiss!1141)) (bvand (bvxor lt!424865 (bvlshr lt!424865 #b00000000000000000000000000001101)) (mask!27185 thiss!1141)))))

(assert (=> d!113939 d!113951))

(assert (=> d!113939 d!113937))

(declare-fun b!941875 () Bool)

(declare-fun e!529546 () Bool)

(declare-fun call!40921 () Bool)

(assert (=> b!941875 (= e!529546 call!40921)))

(declare-fun bm!40918 () Bool)

(assert (=> bm!40918 (= call!40921 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!10462 thiss!1141) (mask!27185 thiss!1141)))))

(declare-fun d!113953 () Bool)

(declare-fun res!633032 () Bool)

(declare-fun e!529547 () Bool)

(assert (=> d!113953 (=> res!633032 e!529547)))

(assert (=> d!113953 (= res!633032 (bvsge #b00000000000000000000000000000000 (size!27796 (_keys!10462 thiss!1141))))))

(assert (=> d!113953 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10462 thiss!1141) (mask!27185 thiss!1141)) e!529547)))

(declare-fun b!941876 () Bool)

(declare-fun e!529548 () Bool)

(assert (=> b!941876 (= e!529547 e!529548)))

(declare-fun c!98129 () Bool)

(assert (=> b!941876 (= c!98129 (validKeyInArray!0 (select (arr!27330 (_keys!10462 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!941877 () Bool)

(assert (=> b!941877 (= e!529548 e!529546)))

(declare-fun lt!424873 () (_ BitVec 64))

(assert (=> b!941877 (= lt!424873 (select (arr!27330 (_keys!10462 thiss!1141)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!31691 0))(
  ( (Unit!31692) )
))
(declare-fun lt!424872 () Unit!31691)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!56799 (_ BitVec 64) (_ BitVec 32)) Unit!31691)

(assert (=> b!941877 (= lt!424872 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10462 thiss!1141) lt!424873 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!56799 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!941877 (arrayContainsKey!0 (_keys!10462 thiss!1141) lt!424873 #b00000000000000000000000000000000)))

(declare-fun lt!424874 () Unit!31691)

(assert (=> b!941877 (= lt!424874 lt!424872)))

(declare-fun res!633033 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!56799 (_ BitVec 32)) SeekEntryResult!9027)

(assert (=> b!941877 (= res!633033 (= (seekEntryOrOpen!0 (select (arr!27330 (_keys!10462 thiss!1141)) #b00000000000000000000000000000000) (_keys!10462 thiss!1141) (mask!27185 thiss!1141)) (Found!9027 #b00000000000000000000000000000000)))))

(assert (=> b!941877 (=> (not res!633033) (not e!529546))))

(declare-fun b!941878 () Bool)

(assert (=> b!941878 (= e!529548 call!40921)))

(assert (= (and d!113953 (not res!633032)) b!941876))

(assert (= (and b!941876 c!98129) b!941877))

(assert (= (and b!941876 (not c!98129)) b!941878))

(assert (= (and b!941877 res!633033) b!941875))

(assert (= (or b!941875 b!941878) bm!40918))

(declare-fun m!876095 () Bool)

(assert (=> bm!40918 m!876095))

(assert (=> b!941876 m!876071))

(assert (=> b!941876 m!876071))

(assert (=> b!941876 m!876073))

(assert (=> b!941877 m!876071))

(declare-fun m!876097 () Bool)

(assert (=> b!941877 m!876097))

(declare-fun m!876099 () Bool)

(assert (=> b!941877 m!876099))

(assert (=> b!941877 m!876071))

(declare-fun m!876101 () Bool)

(assert (=> b!941877 m!876101))

(assert (=> b!941779 d!113953))

(declare-fun b!941887 () Bool)

(declare-fun e!529553 () (_ BitVec 32))

(assert (=> b!941887 (= e!529553 #b00000000000000000000000000000000)))

(declare-fun b!941888 () Bool)

(declare-fun e!529554 () (_ BitVec 32))

(declare-fun call!40924 () (_ BitVec 32))

(assert (=> b!941888 (= e!529554 call!40924)))

(declare-fun d!113955 () Bool)

(declare-fun lt!424877 () (_ BitVec 32))

(assert (=> d!113955 (and (bvsge lt!424877 #b00000000000000000000000000000000) (bvsle lt!424877 (bvsub (size!27796 (_keys!10462 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (=> d!113955 (= lt!424877 e!529553)))

(declare-fun c!98134 () Bool)

(assert (=> d!113955 (= c!98134 (bvsge #b00000000000000000000000000000000 (size!27796 (_keys!10462 thiss!1141))))))

(assert (=> d!113955 (and (bvsle #b00000000000000000000000000000000 (size!27796 (_keys!10462 thiss!1141))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!27796 (_keys!10462 thiss!1141)) (size!27796 (_keys!10462 thiss!1141))))))

(assert (=> d!113955 (= (arrayCountValidKeys!0 (_keys!10462 thiss!1141) #b00000000000000000000000000000000 (size!27796 (_keys!10462 thiss!1141))) lt!424877)))

(declare-fun bm!40921 () Bool)

(assert (=> bm!40921 (= call!40924 (arrayCountValidKeys!0 (_keys!10462 thiss!1141) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!27796 (_keys!10462 thiss!1141))))))

(declare-fun b!941889 () Bool)

(assert (=> b!941889 (= e!529553 e!529554)))

(declare-fun c!98135 () Bool)

(assert (=> b!941889 (= c!98135 (validKeyInArray!0 (select (arr!27330 (_keys!10462 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!941890 () Bool)

(assert (=> b!941890 (= e!529554 (bvadd #b00000000000000000000000000000001 call!40924))))

(assert (= (and d!113955 c!98134) b!941887))

(assert (= (and d!113955 (not c!98134)) b!941889))

(assert (= (and b!941889 c!98135) b!941890))

(assert (= (and b!941889 (not c!98135)) b!941888))

(assert (= (or b!941890 b!941888) bm!40921))

(declare-fun m!876103 () Bool)

(assert (=> bm!40921 m!876103))

(assert (=> b!941889 m!876071))

(assert (=> b!941889 m!876071))

(assert (=> b!941889 m!876073))

(assert (=> b!941778 d!113955))

(declare-fun b!941902 () Bool)

(declare-fun e!529557 () Bool)

(assert (=> b!941902 (= e!529557 (and (bvsge (extraKeys!5335 thiss!1141) #b00000000000000000000000000000000) (bvsle (extraKeys!5335 thiss!1141) #b00000000000000000000000000000011) (bvsge (_vacant!2367 thiss!1141) #b00000000000000000000000000000000)))))

(declare-fun d!113957 () Bool)

(declare-fun res!633042 () Bool)

(assert (=> d!113957 (=> (not res!633042) (not e!529557))))

(assert (=> d!113957 (= res!633042 (validMask!0 (mask!27185 thiss!1141)))))

(assert (=> d!113957 (= (simpleValid!344 thiss!1141) e!529557)))

(declare-fun b!941901 () Bool)

(declare-fun res!633043 () Bool)

(assert (=> b!941901 (=> (not res!633043) (not e!529557))))

(declare-fun size!27801 (LongMapFixedSize!4624) (_ BitVec 32))

(assert (=> b!941901 (= res!633043 (= (size!27801 thiss!1141) (bvadd (_size!2367 thiss!1141) (bvsdiv (bvadd (extraKeys!5335 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!941899 () Bool)

(declare-fun res!633045 () Bool)

(assert (=> b!941899 (=> (not res!633045) (not e!529557))))

(assert (=> b!941899 (= res!633045 (and (= (size!27795 (_values!5626 thiss!1141)) (bvadd (mask!27185 thiss!1141) #b00000000000000000000000000000001)) (= (size!27796 (_keys!10462 thiss!1141)) (size!27795 (_values!5626 thiss!1141))) (bvsge (_size!2367 thiss!1141) #b00000000000000000000000000000000) (bvsle (_size!2367 thiss!1141) (bvadd (mask!27185 thiss!1141) #b00000000000000000000000000000001))))))

(declare-fun b!941900 () Bool)

(declare-fun res!633044 () Bool)

(assert (=> b!941900 (=> (not res!633044) (not e!529557))))

(assert (=> b!941900 (= res!633044 (bvsge (size!27801 thiss!1141) (_size!2367 thiss!1141)))))

(assert (= (and d!113957 res!633042) b!941899))

(assert (= (and b!941899 res!633045) b!941900))

(assert (= (and b!941900 res!633044) b!941901))

(assert (= (and b!941901 res!633043) b!941902))

(assert (=> d!113957 m!876023))

(declare-fun m!876105 () Bool)

(assert (=> b!941901 m!876105))

(assert (=> b!941900 m!876105))

(assert (=> d!113935 d!113957))

(declare-fun mapIsEmpty!32474 () Bool)

(declare-fun mapRes!32474 () Bool)

(assert (=> mapIsEmpty!32474 mapRes!32474))

(declare-fun b!941903 () Bool)

(declare-fun e!529559 () Bool)

(assert (=> b!941903 (= e!529559 tp_is_empty!20437)))

(declare-fun condMapEmpty!32474 () Bool)

(declare-fun mapDefault!32474 () ValueCell!9737)

(assert (=> mapNonEmpty!32473 (= condMapEmpty!32474 (= mapRest!32473 ((as const (Array (_ BitVec 32) ValueCell!9737)) mapDefault!32474)))))

(declare-fun e!529558 () Bool)

(assert (=> mapNonEmpty!32473 (= tp!62296 (and e!529558 mapRes!32474))))

(declare-fun b!941904 () Bool)

(assert (=> b!941904 (= e!529558 tp_is_empty!20437)))

(declare-fun mapNonEmpty!32474 () Bool)

(declare-fun tp!62297 () Bool)

(assert (=> mapNonEmpty!32474 (= mapRes!32474 (and tp!62297 e!529559))))

(declare-fun mapValue!32474 () ValueCell!9737)

(declare-fun mapRest!32474 () (Array (_ BitVec 32) ValueCell!9737))

(declare-fun mapKey!32474 () (_ BitVec 32))

(assert (=> mapNonEmpty!32474 (= mapRest!32473 (store mapRest!32474 mapKey!32474 mapValue!32474))))

(assert (= (and mapNonEmpty!32473 condMapEmpty!32474) mapIsEmpty!32474))

(assert (= (and mapNonEmpty!32473 (not condMapEmpty!32474)) mapNonEmpty!32474))

(assert (= (and mapNonEmpty!32474 ((_ is ValueCellFull!9737) mapValue!32474)) b!941903))

(assert (= (and mapNonEmpty!32473 ((_ is ValueCellFull!9737) mapDefault!32474)) b!941904))

(declare-fun m!876107 () Bool)

(assert (=> mapNonEmpty!32474 m!876107))

(check-sat (not b!941818) (not b!941821) (not bm!40918) (not d!113957) (not b!941836) b_and!29315 (not d!113949) (not b_next!17929) (not b!941889) (not bm!40915) (not b!941876) (not b!941901) tp_is_empty!20437 (not b!941858) (not d!113947) (not bm!40921) (not b!941877) (not b!941817) (not mapNonEmpty!32474) (not b!941900))
(check-sat b_and!29315 (not b_next!17929))
