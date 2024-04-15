; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!17996 () Bool)

(assert start!17996)

(declare-fun b!179006 () Bool)

(declare-fun b_free!4417 () Bool)

(declare-fun b_next!4417 () Bool)

(assert (=> b!179006 (= b_free!4417 (not b_next!4417))))

(declare-fun tp!15972 () Bool)

(declare-fun b_and!10919 () Bool)

(assert (=> b!179006 (= tp!15972 b_and!10919)))

(declare-fun b!179004 () Bool)

(declare-fun res!84753 () Bool)

(declare-fun e!117942 () Bool)

(assert (=> b!179004 (=> (not res!84753) (not e!117942))))

(declare-datatypes ((V!5233 0))(
  ( (V!5234 (val!2139 Int)) )
))
(declare-datatypes ((ValueCell!1751 0))(
  ( (ValueCellFull!1751 (v!4019 V!5233)) (EmptyCell!1751) )
))
(declare-datatypes ((array!7521 0))(
  ( (array!7522 (arr!3562 (Array (_ BitVec 32) (_ BitVec 64))) (size!3871 (_ BitVec 32))) )
))
(declare-datatypes ((array!7523 0))(
  ( (array!7524 (arr!3563 (Array (_ BitVec 32) ValueCell!1751)) (size!3872 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2410 0))(
  ( (LongMapFixedSize!2411 (defaultEntry!3678 Int) (mask!8653 (_ BitVec 32)) (extraKeys!3415 (_ BitVec 32)) (zeroValue!3519 V!5233) (minValue!3519 V!5233) (_size!1254 (_ BitVec 32)) (_keys!5562 array!7521) (_values!3661 array!7523) (_vacant!1254 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2410)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!179004 (= res!84753 (validMask!0 (mask!8653 thiss!1248)))))

(declare-fun b!179005 () Bool)

(declare-fun e!117944 () Bool)

(declare-fun tp_is_empty!4189 () Bool)

(assert (=> b!179005 (= e!117944 tp_is_empty!4189)))

(declare-fun e!117946 () Bool)

(declare-fun e!117947 () Bool)

(declare-fun array_inv!2301 (array!7521) Bool)

(declare-fun array_inv!2302 (array!7523) Bool)

(assert (=> b!179006 (= e!117947 (and tp!15972 tp_is_empty!4189 (array_inv!2301 (_keys!5562 thiss!1248)) (array_inv!2302 (_values!3661 thiss!1248)) e!117946))))

(declare-fun b!179007 () Bool)

(declare-fun res!84750 () Bool)

(assert (=> b!179007 (=> (not res!84750) (not e!117942))))

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((tuple2!3308 0))(
  ( (tuple2!3309 (_1!1665 (_ BitVec 64)) (_2!1665 V!5233)) )
))
(declare-datatypes ((List!2271 0))(
  ( (Nil!2268) (Cons!2267 (h!2892 tuple2!3308) (t!7104 List!2271)) )
))
(declare-datatypes ((ListLongMap!2227 0))(
  ( (ListLongMap!2228 (toList!1129 List!2271)) )
))
(declare-fun contains!1208 (ListLongMap!2227 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!765 (array!7521 array!7523 (_ BitVec 32) (_ BitVec 32) V!5233 V!5233 (_ BitVec 32) Int) ListLongMap!2227)

(assert (=> b!179007 (= res!84750 (not (contains!1208 (getCurrentListMap!765 (_keys!5562 thiss!1248) (_values!3661 thiss!1248) (mask!8653 thiss!1248) (extraKeys!3415 thiss!1248) (zeroValue!3519 thiss!1248) (minValue!3519 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3678 thiss!1248)) key!828)))))

(declare-fun b!179008 () Bool)

(declare-fun e!117945 () Bool)

(assert (=> b!179008 (= e!117945 tp_is_empty!4189)))

(declare-fun mapIsEmpty!7168 () Bool)

(declare-fun mapRes!7168 () Bool)

(assert (=> mapIsEmpty!7168 mapRes!7168))

(declare-fun mapNonEmpty!7168 () Bool)

(declare-fun tp!15973 () Bool)

(assert (=> mapNonEmpty!7168 (= mapRes!7168 (and tp!15973 e!117944))))

(declare-fun mapRest!7168 () (Array (_ BitVec 32) ValueCell!1751))

(declare-fun mapKey!7168 () (_ BitVec 32))

(declare-fun mapValue!7168 () ValueCell!1751)

(assert (=> mapNonEmpty!7168 (= (arr!3563 (_values!3661 thiss!1248)) (store mapRest!7168 mapKey!7168 mapValue!7168))))

(declare-fun b!179009 () Bool)

(assert (=> b!179009 (= e!117946 (and e!117945 mapRes!7168))))

(declare-fun condMapEmpty!7168 () Bool)

(declare-fun mapDefault!7168 () ValueCell!1751)

(assert (=> b!179009 (= condMapEmpty!7168 (= (arr!3563 (_values!3661 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1751)) mapDefault!7168)))))

(declare-fun b!179011 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!7521 (_ BitVec 32)) Bool)

(assert (=> b!179011 (= e!117942 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5562 thiss!1248) (mask!8653 thiss!1248))))))

(declare-fun b!179012 () Bool)

(declare-fun res!84754 () Bool)

(assert (=> b!179012 (=> (not res!84754) (not e!117942))))

(assert (=> b!179012 (= res!84754 (not (= key!828 (bvneg key!828))))))

(declare-fun b!179013 () Bool)

(declare-fun res!84755 () Bool)

(assert (=> b!179013 (=> (not res!84755) (not e!117942))))

(assert (=> b!179013 (= res!84755 (and (= (size!3872 (_values!3661 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8653 thiss!1248))) (= (size!3871 (_keys!5562 thiss!1248)) (size!3872 (_values!3661 thiss!1248))) (bvsge (mask!8653 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3415 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3415 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun res!84751 () Bool)

(assert (=> start!17996 (=> (not res!84751) (not e!117942))))

(declare-fun valid!1022 (LongMapFixedSize!2410) Bool)

(assert (=> start!17996 (= res!84751 (valid!1022 thiss!1248))))

(assert (=> start!17996 e!117942))

(assert (=> start!17996 e!117947))

(assert (=> start!17996 true))

(declare-fun b!179010 () Bool)

(declare-fun res!84752 () Bool)

(assert (=> b!179010 (=> (not res!84752) (not e!117942))))

(get-info :version)

(declare-datatypes ((SeekEntryResult!587 0))(
  ( (MissingZero!587 (index!4516 (_ BitVec 32))) (Found!587 (index!4517 (_ BitVec 32))) (Intermediate!587 (undefined!1399 Bool) (index!4518 (_ BitVec 32)) (x!19606 (_ BitVec 32))) (Undefined!587) (MissingVacant!587 (index!4519 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7521 (_ BitVec 32)) SeekEntryResult!587)

(assert (=> b!179010 (= res!84752 ((_ is Undefined!587) (seekEntryOrOpen!0 key!828 (_keys!5562 thiss!1248) (mask!8653 thiss!1248))))))

(assert (= (and start!17996 res!84751) b!179012))

(assert (= (and b!179012 res!84754) b!179010))

(assert (= (and b!179010 res!84752) b!179007))

(assert (= (and b!179007 res!84750) b!179004))

(assert (= (and b!179004 res!84753) b!179013))

(assert (= (and b!179013 res!84755) b!179011))

(assert (= (and b!179009 condMapEmpty!7168) mapIsEmpty!7168))

(assert (= (and b!179009 (not condMapEmpty!7168)) mapNonEmpty!7168))

(assert (= (and mapNonEmpty!7168 ((_ is ValueCellFull!1751) mapValue!7168)) b!179005))

(assert (= (and b!179009 ((_ is ValueCellFull!1751) mapDefault!7168)) b!179008))

(assert (= b!179006 b!179009))

(assert (= start!17996 b!179006))

(declare-fun m!206873 () Bool)

(assert (=> b!179010 m!206873))

(declare-fun m!206875 () Bool)

(assert (=> b!179004 m!206875))

(declare-fun m!206877 () Bool)

(assert (=> b!179011 m!206877))

(declare-fun m!206879 () Bool)

(assert (=> b!179006 m!206879))

(declare-fun m!206881 () Bool)

(assert (=> b!179006 m!206881))

(declare-fun m!206883 () Bool)

(assert (=> start!17996 m!206883))

(declare-fun m!206885 () Bool)

(assert (=> mapNonEmpty!7168 m!206885))

(declare-fun m!206887 () Bool)

(assert (=> b!179007 m!206887))

(assert (=> b!179007 m!206887))

(declare-fun m!206889 () Bool)

(assert (=> b!179007 m!206889))

(check-sat (not b!179011) tp_is_empty!4189 (not b!179006) (not mapNonEmpty!7168) (not b!179010) (not b!179004) (not b_next!4417) (not b!179007) (not start!17996) b_and!10919)
(check-sat b_and!10919 (not b_next!4417))
(get-model)

(declare-fun d!53977 () Bool)

(assert (=> d!53977 (= (validMask!0 (mask!8653 thiss!1248)) (and (or (= (mask!8653 thiss!1248) #b00000000000000000000000000000111) (= (mask!8653 thiss!1248) #b00000000000000000000000000001111) (= (mask!8653 thiss!1248) #b00000000000000000000000000011111) (= (mask!8653 thiss!1248) #b00000000000000000000000000111111) (= (mask!8653 thiss!1248) #b00000000000000000000000001111111) (= (mask!8653 thiss!1248) #b00000000000000000000000011111111) (= (mask!8653 thiss!1248) #b00000000000000000000000111111111) (= (mask!8653 thiss!1248) #b00000000000000000000001111111111) (= (mask!8653 thiss!1248) #b00000000000000000000011111111111) (= (mask!8653 thiss!1248) #b00000000000000000000111111111111) (= (mask!8653 thiss!1248) #b00000000000000000001111111111111) (= (mask!8653 thiss!1248) #b00000000000000000011111111111111) (= (mask!8653 thiss!1248) #b00000000000000000111111111111111) (= (mask!8653 thiss!1248) #b00000000000000001111111111111111) (= (mask!8653 thiss!1248) #b00000000000000011111111111111111) (= (mask!8653 thiss!1248) #b00000000000000111111111111111111) (= (mask!8653 thiss!1248) #b00000000000001111111111111111111) (= (mask!8653 thiss!1248) #b00000000000011111111111111111111) (= (mask!8653 thiss!1248) #b00000000000111111111111111111111) (= (mask!8653 thiss!1248) #b00000000001111111111111111111111) (= (mask!8653 thiss!1248) #b00000000011111111111111111111111) (= (mask!8653 thiss!1248) #b00000000111111111111111111111111) (= (mask!8653 thiss!1248) #b00000001111111111111111111111111) (= (mask!8653 thiss!1248) #b00000011111111111111111111111111) (= (mask!8653 thiss!1248) #b00000111111111111111111111111111) (= (mask!8653 thiss!1248) #b00001111111111111111111111111111) (= (mask!8653 thiss!1248) #b00011111111111111111111111111111) (= (mask!8653 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!8653 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!179004 d!53977))

(declare-fun d!53979 () Bool)

(assert (=> d!53979 (= (array_inv!2301 (_keys!5562 thiss!1248)) (bvsge (size!3871 (_keys!5562 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!179006 d!53979))

(declare-fun d!53981 () Bool)

(assert (=> d!53981 (= (array_inv!2302 (_values!3661 thiss!1248)) (bvsge (size!3872 (_values!3661 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!179006 d!53981))

(declare-fun b!179082 () Bool)

(declare-fun e!117991 () Bool)

(declare-fun call!18076 () Bool)

(assert (=> b!179082 (= e!117991 call!18076)))

(declare-fun bm!18073 () Bool)

(assert (=> bm!18073 (= call!18076 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5562 thiss!1248) (mask!8653 thiss!1248)))))

(declare-fun b!179083 () Bool)

(declare-fun e!117990 () Bool)

(assert (=> b!179083 (= e!117990 call!18076)))

(declare-fun d!53983 () Bool)

(declare-fun res!84796 () Bool)

(declare-fun e!117992 () Bool)

(assert (=> d!53983 (=> res!84796 e!117992)))

(assert (=> d!53983 (= res!84796 (bvsge #b00000000000000000000000000000000 (size!3871 (_keys!5562 thiss!1248))))))

(assert (=> d!53983 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5562 thiss!1248) (mask!8653 thiss!1248)) e!117992)))

(declare-fun b!179084 () Bool)

(assert (=> b!179084 (= e!117992 e!117991)))

(declare-fun c!32109 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!179084 (= c!32109 (validKeyInArray!0 (select (arr!3562 (_keys!5562 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!179085 () Bool)

(assert (=> b!179085 (= e!117991 e!117990)))

(declare-fun lt!88375 () (_ BitVec 64))

(assert (=> b!179085 (= lt!88375 (select (arr!3562 (_keys!5562 thiss!1248)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!5433 0))(
  ( (Unit!5434) )
))
(declare-fun lt!88373 () Unit!5433)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!7521 (_ BitVec 64) (_ BitVec 32)) Unit!5433)

(assert (=> b!179085 (= lt!88373 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5562 thiss!1248) lt!88375 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!7521 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!179085 (arrayContainsKey!0 (_keys!5562 thiss!1248) lt!88375 #b00000000000000000000000000000000)))

(declare-fun lt!88374 () Unit!5433)

(assert (=> b!179085 (= lt!88374 lt!88373)))

(declare-fun res!84797 () Bool)

(assert (=> b!179085 (= res!84797 (= (seekEntryOrOpen!0 (select (arr!3562 (_keys!5562 thiss!1248)) #b00000000000000000000000000000000) (_keys!5562 thiss!1248) (mask!8653 thiss!1248)) (Found!587 #b00000000000000000000000000000000)))))

(assert (=> b!179085 (=> (not res!84797) (not e!117990))))

(assert (= (and d!53983 (not res!84796)) b!179084))

(assert (= (and b!179084 c!32109) b!179085))

(assert (= (and b!179084 (not c!32109)) b!179082))

(assert (= (and b!179085 res!84797) b!179083))

(assert (= (or b!179083 b!179082) bm!18073))

(declare-fun m!206927 () Bool)

(assert (=> bm!18073 m!206927))

(declare-fun m!206929 () Bool)

(assert (=> b!179084 m!206929))

(assert (=> b!179084 m!206929))

(declare-fun m!206931 () Bool)

(assert (=> b!179084 m!206931))

(assert (=> b!179085 m!206929))

(declare-fun m!206933 () Bool)

(assert (=> b!179085 m!206933))

(declare-fun m!206935 () Bool)

(assert (=> b!179085 m!206935))

(assert (=> b!179085 m!206929))

(declare-fun m!206937 () Bool)

(assert (=> b!179085 m!206937))

(assert (=> b!179011 d!53983))

(declare-fun d!53985 () Bool)

(declare-fun res!84804 () Bool)

(declare-fun e!117995 () Bool)

(assert (=> d!53985 (=> (not res!84804) (not e!117995))))

(declare-fun simpleValid!160 (LongMapFixedSize!2410) Bool)

(assert (=> d!53985 (= res!84804 (simpleValid!160 thiss!1248))))

(assert (=> d!53985 (= (valid!1022 thiss!1248) e!117995)))

(declare-fun b!179092 () Bool)

(declare-fun res!84805 () Bool)

(assert (=> b!179092 (=> (not res!84805) (not e!117995))))

(declare-fun arrayCountValidKeys!0 (array!7521 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!179092 (= res!84805 (= (arrayCountValidKeys!0 (_keys!5562 thiss!1248) #b00000000000000000000000000000000 (size!3871 (_keys!5562 thiss!1248))) (_size!1254 thiss!1248)))))

(declare-fun b!179093 () Bool)

(declare-fun res!84806 () Bool)

(assert (=> b!179093 (=> (not res!84806) (not e!117995))))

(assert (=> b!179093 (= res!84806 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5562 thiss!1248) (mask!8653 thiss!1248)))))

(declare-fun b!179094 () Bool)

(declare-datatypes ((List!2272 0))(
  ( (Nil!2269) (Cons!2268 (h!2893 (_ BitVec 64)) (t!7107 List!2272)) )
))
(declare-fun arrayNoDuplicates!0 (array!7521 (_ BitVec 32) List!2272) Bool)

(assert (=> b!179094 (= e!117995 (arrayNoDuplicates!0 (_keys!5562 thiss!1248) #b00000000000000000000000000000000 Nil!2269))))

(assert (= (and d!53985 res!84804) b!179092))

(assert (= (and b!179092 res!84805) b!179093))

(assert (= (and b!179093 res!84806) b!179094))

(declare-fun m!206939 () Bool)

(assert (=> d!53985 m!206939))

(declare-fun m!206941 () Bool)

(assert (=> b!179092 m!206941))

(assert (=> b!179093 m!206877))

(declare-fun m!206943 () Bool)

(assert (=> b!179094 m!206943))

(assert (=> start!17996 d!53985))

(declare-fun lt!88382 () SeekEntryResult!587)

(declare-fun b!179107 () Bool)

(declare-fun e!118002 () SeekEntryResult!587)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7521 (_ BitVec 32)) SeekEntryResult!587)

(assert (=> b!179107 (= e!118002 (seekKeyOrZeroReturnVacant!0 (x!19606 lt!88382) (index!4518 lt!88382) (index!4518 lt!88382) key!828 (_keys!5562 thiss!1248) (mask!8653 thiss!1248)))))

(declare-fun b!179108 () Bool)

(assert (=> b!179108 (= e!118002 (MissingZero!587 (index!4518 lt!88382)))))

(declare-fun b!179109 () Bool)

(declare-fun e!118004 () SeekEntryResult!587)

(assert (=> b!179109 (= e!118004 Undefined!587)))

(declare-fun b!179110 () Bool)

(declare-fun e!118003 () SeekEntryResult!587)

(assert (=> b!179110 (= e!118003 (Found!587 (index!4518 lt!88382)))))

(declare-fun b!179111 () Bool)

(declare-fun c!32118 () Bool)

(declare-fun lt!88384 () (_ BitVec 64))

(assert (=> b!179111 (= c!32118 (= lt!88384 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!179111 (= e!118003 e!118002)))

(declare-fun d!53987 () Bool)

(declare-fun lt!88383 () SeekEntryResult!587)

(assert (=> d!53987 (and (or ((_ is Undefined!587) lt!88383) (not ((_ is Found!587) lt!88383)) (and (bvsge (index!4517 lt!88383) #b00000000000000000000000000000000) (bvslt (index!4517 lt!88383) (size!3871 (_keys!5562 thiss!1248))))) (or ((_ is Undefined!587) lt!88383) ((_ is Found!587) lt!88383) (not ((_ is MissingZero!587) lt!88383)) (and (bvsge (index!4516 lt!88383) #b00000000000000000000000000000000) (bvslt (index!4516 lt!88383) (size!3871 (_keys!5562 thiss!1248))))) (or ((_ is Undefined!587) lt!88383) ((_ is Found!587) lt!88383) ((_ is MissingZero!587) lt!88383) (not ((_ is MissingVacant!587) lt!88383)) (and (bvsge (index!4519 lt!88383) #b00000000000000000000000000000000) (bvslt (index!4519 lt!88383) (size!3871 (_keys!5562 thiss!1248))))) (or ((_ is Undefined!587) lt!88383) (ite ((_ is Found!587) lt!88383) (= (select (arr!3562 (_keys!5562 thiss!1248)) (index!4517 lt!88383)) key!828) (ite ((_ is MissingZero!587) lt!88383) (= (select (arr!3562 (_keys!5562 thiss!1248)) (index!4516 lt!88383)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!587) lt!88383) (= (select (arr!3562 (_keys!5562 thiss!1248)) (index!4519 lt!88383)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!53987 (= lt!88383 e!118004)))

(declare-fun c!32117 () Bool)

(assert (=> d!53987 (= c!32117 (and ((_ is Intermediate!587) lt!88382) (undefined!1399 lt!88382)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7521 (_ BitVec 32)) SeekEntryResult!587)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!53987 (= lt!88382 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!8653 thiss!1248)) key!828 (_keys!5562 thiss!1248) (mask!8653 thiss!1248)))))

(assert (=> d!53987 (validMask!0 (mask!8653 thiss!1248))))

(assert (=> d!53987 (= (seekEntryOrOpen!0 key!828 (_keys!5562 thiss!1248) (mask!8653 thiss!1248)) lt!88383)))

(declare-fun b!179112 () Bool)

(assert (=> b!179112 (= e!118004 e!118003)))

(assert (=> b!179112 (= lt!88384 (select (arr!3562 (_keys!5562 thiss!1248)) (index!4518 lt!88382)))))

(declare-fun c!32116 () Bool)

(assert (=> b!179112 (= c!32116 (= lt!88384 key!828))))

(assert (= (and d!53987 c!32117) b!179109))

(assert (= (and d!53987 (not c!32117)) b!179112))

(assert (= (and b!179112 c!32116) b!179110))

(assert (= (and b!179112 (not c!32116)) b!179111))

(assert (= (and b!179111 c!32118) b!179108))

(assert (= (and b!179111 (not c!32118)) b!179107))

(declare-fun m!206945 () Bool)

(assert (=> b!179107 m!206945))

(declare-fun m!206947 () Bool)

(assert (=> d!53987 m!206947))

(declare-fun m!206949 () Bool)

(assert (=> d!53987 m!206949))

(declare-fun m!206951 () Bool)

(assert (=> d!53987 m!206951))

(assert (=> d!53987 m!206949))

(declare-fun m!206953 () Bool)

(assert (=> d!53987 m!206953))

(declare-fun m!206955 () Bool)

(assert (=> d!53987 m!206955))

(assert (=> d!53987 m!206875))

(declare-fun m!206957 () Bool)

(assert (=> b!179112 m!206957))

(assert (=> b!179010 d!53987))

(declare-fun d!53989 () Bool)

(declare-fun e!118009 () Bool)

(assert (=> d!53989 e!118009))

(declare-fun res!84809 () Bool)

(assert (=> d!53989 (=> res!84809 e!118009)))

(declare-fun lt!88393 () Bool)

(assert (=> d!53989 (= res!84809 (not lt!88393))))

(declare-fun lt!88395 () Bool)

(assert (=> d!53989 (= lt!88393 lt!88395)))

(declare-fun lt!88396 () Unit!5433)

(declare-fun e!118010 () Unit!5433)

(assert (=> d!53989 (= lt!88396 e!118010)))

(declare-fun c!32121 () Bool)

(assert (=> d!53989 (= c!32121 lt!88395)))

(declare-fun containsKey!203 (List!2271 (_ BitVec 64)) Bool)

(assert (=> d!53989 (= lt!88395 (containsKey!203 (toList!1129 (getCurrentListMap!765 (_keys!5562 thiss!1248) (_values!3661 thiss!1248) (mask!8653 thiss!1248) (extraKeys!3415 thiss!1248) (zeroValue!3519 thiss!1248) (minValue!3519 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3678 thiss!1248))) key!828))))

(assert (=> d!53989 (= (contains!1208 (getCurrentListMap!765 (_keys!5562 thiss!1248) (_values!3661 thiss!1248) (mask!8653 thiss!1248) (extraKeys!3415 thiss!1248) (zeroValue!3519 thiss!1248) (minValue!3519 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3678 thiss!1248)) key!828) lt!88393)))

(declare-fun b!179119 () Bool)

(declare-fun lt!88394 () Unit!5433)

(assert (=> b!179119 (= e!118010 lt!88394)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!152 (List!2271 (_ BitVec 64)) Unit!5433)

(assert (=> b!179119 (= lt!88394 (lemmaContainsKeyImpliesGetValueByKeyDefined!152 (toList!1129 (getCurrentListMap!765 (_keys!5562 thiss!1248) (_values!3661 thiss!1248) (mask!8653 thiss!1248) (extraKeys!3415 thiss!1248) (zeroValue!3519 thiss!1248) (minValue!3519 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3678 thiss!1248))) key!828))))

(declare-datatypes ((Option!205 0))(
  ( (Some!204 (v!4022 V!5233)) (None!203) )
))
(declare-fun isDefined!153 (Option!205) Bool)

(declare-fun getValueByKey!199 (List!2271 (_ BitVec 64)) Option!205)

(assert (=> b!179119 (isDefined!153 (getValueByKey!199 (toList!1129 (getCurrentListMap!765 (_keys!5562 thiss!1248) (_values!3661 thiss!1248) (mask!8653 thiss!1248) (extraKeys!3415 thiss!1248) (zeroValue!3519 thiss!1248) (minValue!3519 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3678 thiss!1248))) key!828))))

(declare-fun b!179120 () Bool)

(declare-fun Unit!5435 () Unit!5433)

(assert (=> b!179120 (= e!118010 Unit!5435)))

(declare-fun b!179121 () Bool)

(assert (=> b!179121 (= e!118009 (isDefined!153 (getValueByKey!199 (toList!1129 (getCurrentListMap!765 (_keys!5562 thiss!1248) (_values!3661 thiss!1248) (mask!8653 thiss!1248) (extraKeys!3415 thiss!1248) (zeroValue!3519 thiss!1248) (minValue!3519 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3678 thiss!1248))) key!828)))))

(assert (= (and d!53989 c!32121) b!179119))

(assert (= (and d!53989 (not c!32121)) b!179120))

(assert (= (and d!53989 (not res!84809)) b!179121))

(declare-fun m!206959 () Bool)

(assert (=> d!53989 m!206959))

(declare-fun m!206961 () Bool)

(assert (=> b!179119 m!206961))

(declare-fun m!206963 () Bool)

(assert (=> b!179119 m!206963))

(assert (=> b!179119 m!206963))

(declare-fun m!206965 () Bool)

(assert (=> b!179119 m!206965))

(assert (=> b!179121 m!206963))

(assert (=> b!179121 m!206963))

(assert (=> b!179121 m!206965))

(assert (=> b!179007 d!53989))

(declare-fun b!179164 () Bool)

(declare-fun res!84828 () Bool)

(declare-fun e!118048 () Bool)

(assert (=> b!179164 (=> (not res!84828) (not e!118048))))

(declare-fun e!118037 () Bool)

(assert (=> b!179164 (= res!84828 e!118037)))

(declare-fun res!84834 () Bool)

(assert (=> b!179164 (=> res!84834 e!118037)))

(declare-fun e!118045 () Bool)

(assert (=> b!179164 (= res!84834 (not e!118045))))

(declare-fun res!84832 () Bool)

(assert (=> b!179164 (=> (not res!84832) (not e!118045))))

(assert (=> b!179164 (= res!84832 (bvslt #b00000000000000000000000000000000 (size!3871 (_keys!5562 thiss!1248))))))

(declare-fun bm!18088 () Bool)

(declare-fun call!18096 () Bool)

(declare-fun lt!88442 () ListLongMap!2227)

(assert (=> bm!18088 (= call!18096 (contains!1208 lt!88442 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!179165 () Bool)

(declare-fun c!32134 () Bool)

(assert (=> b!179165 (= c!32134 (and (not (= (bvand (extraKeys!3415 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3415 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!118046 () ListLongMap!2227)

(declare-fun e!118043 () ListLongMap!2227)

(assert (=> b!179165 (= e!118046 e!118043)))

(declare-fun call!18091 () ListLongMap!2227)

(declare-fun call!18095 () ListLongMap!2227)

(declare-fun call!18092 () ListLongMap!2227)

(declare-fun c!32137 () Bool)

(declare-fun bm!18089 () Bool)

(declare-fun call!18094 () ListLongMap!2227)

(declare-fun c!32139 () Bool)

(declare-fun +!258 (ListLongMap!2227 tuple2!3308) ListLongMap!2227)

(assert (=> bm!18089 (= call!18092 (+!258 (ite c!32139 call!18094 (ite c!32137 call!18091 call!18095)) (ite (or c!32139 c!32137) (tuple2!3309 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3519 thiss!1248)) (tuple2!3309 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3519 thiss!1248)))))))

(declare-fun bm!18090 () Bool)

(declare-fun call!18097 () Bool)

(assert (=> bm!18090 (= call!18097 (contains!1208 lt!88442 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!179166 () Bool)

(declare-fun e!118038 () Bool)

(declare-fun e!118044 () Bool)

(assert (=> b!179166 (= e!118038 e!118044)))

(declare-fun res!84833 () Bool)

(assert (=> b!179166 (= res!84833 call!18096)))

(assert (=> b!179166 (=> (not res!84833) (not e!118044))))

(declare-fun b!179167 () Bool)

(declare-fun e!118047 () Bool)

(declare-fun apply!146 (ListLongMap!2227 (_ BitVec 64)) V!5233)

(assert (=> b!179167 (= e!118047 (= (apply!146 lt!88442 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3519 thiss!1248)))))

(declare-fun b!179168 () Bool)

(declare-fun e!118042 () Bool)

(assert (=> b!179168 (= e!118042 (not call!18097))))

(declare-fun bm!18091 () Bool)

(assert (=> bm!18091 (= call!18095 call!18091)))

(declare-fun b!179170 () Bool)

(declare-fun e!118040 () ListLongMap!2227)

(assert (=> b!179170 (= e!118040 (+!258 call!18092 (tuple2!3309 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3519 thiss!1248))))))

(declare-fun b!179171 () Bool)

(declare-fun e!118039 () Bool)

(declare-fun get!2041 (ValueCell!1751 V!5233) V!5233)

(declare-fun dynLambda!480 (Int (_ BitVec 64)) V!5233)

(assert (=> b!179171 (= e!118039 (= (apply!146 lt!88442 (select (arr!3562 (_keys!5562 thiss!1248)) #b00000000000000000000000000000000)) (get!2041 (select (arr!3563 (_values!3661 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!480 (defaultEntry!3678 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!179171 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3872 (_values!3661 thiss!1248))))))

(assert (=> b!179171 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3871 (_keys!5562 thiss!1248))))))

(declare-fun b!179172 () Bool)

(assert (=> b!179172 (= e!118045 (validKeyInArray!0 (select (arr!3562 (_keys!5562 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!179173 () Bool)

(declare-fun call!18093 () ListLongMap!2227)

(assert (=> b!179173 (= e!118043 call!18093)))

(declare-fun bm!18092 () Bool)

(assert (=> bm!18092 (= call!18091 call!18094)))

(declare-fun b!179174 () Bool)

(assert (=> b!179174 (= e!118037 e!118039)))

(declare-fun res!84830 () Bool)

(assert (=> b!179174 (=> (not res!84830) (not e!118039))))

(assert (=> b!179174 (= res!84830 (contains!1208 lt!88442 (select (arr!3562 (_keys!5562 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!179174 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3871 (_keys!5562 thiss!1248))))))

(declare-fun b!179175 () Bool)

(assert (=> b!179175 (= e!118040 e!118046)))

(assert (=> b!179175 (= c!32137 (and (not (= (bvand (extraKeys!3415 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3415 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!179176 () Bool)

(declare-fun e!118049 () Unit!5433)

(declare-fun lt!88447 () Unit!5433)

(assert (=> b!179176 (= e!118049 lt!88447)))

(declare-fun lt!88454 () ListLongMap!2227)

(declare-fun getCurrentListMapNoExtraKeys!167 (array!7521 array!7523 (_ BitVec 32) (_ BitVec 32) V!5233 V!5233 (_ BitVec 32) Int) ListLongMap!2227)

(assert (=> b!179176 (= lt!88454 (getCurrentListMapNoExtraKeys!167 (_keys!5562 thiss!1248) (_values!3661 thiss!1248) (mask!8653 thiss!1248) (extraKeys!3415 thiss!1248) (zeroValue!3519 thiss!1248) (minValue!3519 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3678 thiss!1248)))))

(declare-fun lt!88459 () (_ BitVec 64))

(assert (=> b!179176 (= lt!88459 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!88461 () (_ BitVec 64))

(assert (=> b!179176 (= lt!88461 (select (arr!3562 (_keys!5562 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!88451 () Unit!5433)

(declare-fun addStillContains!122 (ListLongMap!2227 (_ BitVec 64) V!5233 (_ BitVec 64)) Unit!5433)

(assert (=> b!179176 (= lt!88451 (addStillContains!122 lt!88454 lt!88459 (zeroValue!3519 thiss!1248) lt!88461))))

(assert (=> b!179176 (contains!1208 (+!258 lt!88454 (tuple2!3309 lt!88459 (zeroValue!3519 thiss!1248))) lt!88461)))

(declare-fun lt!88450 () Unit!5433)

(assert (=> b!179176 (= lt!88450 lt!88451)))

(declare-fun lt!88445 () ListLongMap!2227)

(assert (=> b!179176 (= lt!88445 (getCurrentListMapNoExtraKeys!167 (_keys!5562 thiss!1248) (_values!3661 thiss!1248) (mask!8653 thiss!1248) (extraKeys!3415 thiss!1248) (zeroValue!3519 thiss!1248) (minValue!3519 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3678 thiss!1248)))))

(declare-fun lt!88446 () (_ BitVec 64))

(assert (=> b!179176 (= lt!88446 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!88449 () (_ BitVec 64))

(assert (=> b!179176 (= lt!88449 (select (arr!3562 (_keys!5562 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!88443 () Unit!5433)

(declare-fun addApplyDifferent!122 (ListLongMap!2227 (_ BitVec 64) V!5233 (_ BitVec 64)) Unit!5433)

(assert (=> b!179176 (= lt!88443 (addApplyDifferent!122 lt!88445 lt!88446 (minValue!3519 thiss!1248) lt!88449))))

(assert (=> b!179176 (= (apply!146 (+!258 lt!88445 (tuple2!3309 lt!88446 (minValue!3519 thiss!1248))) lt!88449) (apply!146 lt!88445 lt!88449))))

(declare-fun lt!88456 () Unit!5433)

(assert (=> b!179176 (= lt!88456 lt!88443)))

(declare-fun lt!88458 () ListLongMap!2227)

(assert (=> b!179176 (= lt!88458 (getCurrentListMapNoExtraKeys!167 (_keys!5562 thiss!1248) (_values!3661 thiss!1248) (mask!8653 thiss!1248) (extraKeys!3415 thiss!1248) (zeroValue!3519 thiss!1248) (minValue!3519 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3678 thiss!1248)))))

(declare-fun lt!88453 () (_ BitVec 64))

(assert (=> b!179176 (= lt!88453 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!88457 () (_ BitVec 64))

(assert (=> b!179176 (= lt!88457 (select (arr!3562 (_keys!5562 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!88441 () Unit!5433)

(assert (=> b!179176 (= lt!88441 (addApplyDifferent!122 lt!88458 lt!88453 (zeroValue!3519 thiss!1248) lt!88457))))

(assert (=> b!179176 (= (apply!146 (+!258 lt!88458 (tuple2!3309 lt!88453 (zeroValue!3519 thiss!1248))) lt!88457) (apply!146 lt!88458 lt!88457))))

(declare-fun lt!88444 () Unit!5433)

(assert (=> b!179176 (= lt!88444 lt!88441)))

(declare-fun lt!88460 () ListLongMap!2227)

(assert (=> b!179176 (= lt!88460 (getCurrentListMapNoExtraKeys!167 (_keys!5562 thiss!1248) (_values!3661 thiss!1248) (mask!8653 thiss!1248) (extraKeys!3415 thiss!1248) (zeroValue!3519 thiss!1248) (minValue!3519 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3678 thiss!1248)))))

(declare-fun lt!88448 () (_ BitVec 64))

(assert (=> b!179176 (= lt!88448 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!88462 () (_ BitVec 64))

(assert (=> b!179176 (= lt!88462 (select (arr!3562 (_keys!5562 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!179176 (= lt!88447 (addApplyDifferent!122 lt!88460 lt!88448 (minValue!3519 thiss!1248) lt!88462))))

(assert (=> b!179176 (= (apply!146 (+!258 lt!88460 (tuple2!3309 lt!88448 (minValue!3519 thiss!1248))) lt!88462) (apply!146 lt!88460 lt!88462))))

(declare-fun b!179177 () Bool)

(assert (=> b!179177 (= e!118042 e!118047)))

(declare-fun res!84831 () Bool)

(assert (=> b!179177 (= res!84831 call!18097)))

(assert (=> b!179177 (=> (not res!84831) (not e!118047))))

(declare-fun b!179178 () Bool)

(declare-fun e!118041 () Bool)

(assert (=> b!179178 (= e!118041 (validKeyInArray!0 (select (arr!3562 (_keys!5562 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!179179 () Bool)

(assert (=> b!179179 (= e!118044 (= (apply!146 lt!88442 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3519 thiss!1248)))))

(declare-fun bm!18093 () Bool)

(assert (=> bm!18093 (= call!18093 call!18092)))

(declare-fun b!179169 () Bool)

(assert (=> b!179169 (= e!118048 e!118042)))

(declare-fun c!32138 () Bool)

(assert (=> b!179169 (= c!32138 (not (= (bvand (extraKeys!3415 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun d!53991 () Bool)

(assert (=> d!53991 e!118048))

(declare-fun res!84835 () Bool)

(assert (=> d!53991 (=> (not res!84835) (not e!118048))))

(assert (=> d!53991 (= res!84835 (or (bvsge #b00000000000000000000000000000000 (size!3871 (_keys!5562 thiss!1248))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3871 (_keys!5562 thiss!1248))))))))

(declare-fun lt!88452 () ListLongMap!2227)

(assert (=> d!53991 (= lt!88442 lt!88452)))

(declare-fun lt!88455 () Unit!5433)

(assert (=> d!53991 (= lt!88455 e!118049)))

(declare-fun c!32135 () Bool)

(assert (=> d!53991 (= c!32135 e!118041)))

(declare-fun res!84829 () Bool)

(assert (=> d!53991 (=> (not res!84829) (not e!118041))))

(assert (=> d!53991 (= res!84829 (bvslt #b00000000000000000000000000000000 (size!3871 (_keys!5562 thiss!1248))))))

(assert (=> d!53991 (= lt!88452 e!118040)))

(assert (=> d!53991 (= c!32139 (and (not (= (bvand (extraKeys!3415 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3415 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!53991 (validMask!0 (mask!8653 thiss!1248))))

(assert (=> d!53991 (= (getCurrentListMap!765 (_keys!5562 thiss!1248) (_values!3661 thiss!1248) (mask!8653 thiss!1248) (extraKeys!3415 thiss!1248) (zeroValue!3519 thiss!1248) (minValue!3519 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3678 thiss!1248)) lt!88442)))

(declare-fun b!179180 () Bool)

(assert (=> b!179180 (= e!118046 call!18093)))

(declare-fun b!179181 () Bool)

(assert (=> b!179181 (= e!118043 call!18095)))

(declare-fun b!179182 () Bool)

(declare-fun Unit!5436 () Unit!5433)

(assert (=> b!179182 (= e!118049 Unit!5436)))

(declare-fun bm!18094 () Bool)

(assert (=> bm!18094 (= call!18094 (getCurrentListMapNoExtraKeys!167 (_keys!5562 thiss!1248) (_values!3661 thiss!1248) (mask!8653 thiss!1248) (extraKeys!3415 thiss!1248) (zeroValue!3519 thiss!1248) (minValue!3519 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3678 thiss!1248)))))

(declare-fun b!179183 () Bool)

(declare-fun res!84836 () Bool)

(assert (=> b!179183 (=> (not res!84836) (not e!118048))))

(assert (=> b!179183 (= res!84836 e!118038)))

(declare-fun c!32136 () Bool)

(assert (=> b!179183 (= c!32136 (not (= (bvand (extraKeys!3415 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!179184 () Bool)

(assert (=> b!179184 (= e!118038 (not call!18096))))

(assert (= (and d!53991 c!32139) b!179170))

(assert (= (and d!53991 (not c!32139)) b!179175))

(assert (= (and b!179175 c!32137) b!179180))

(assert (= (and b!179175 (not c!32137)) b!179165))

(assert (= (and b!179165 c!32134) b!179173))

(assert (= (and b!179165 (not c!32134)) b!179181))

(assert (= (or b!179173 b!179181) bm!18091))

(assert (= (or b!179180 bm!18091) bm!18092))

(assert (= (or b!179180 b!179173) bm!18093))

(assert (= (or b!179170 bm!18092) bm!18094))

(assert (= (or b!179170 bm!18093) bm!18089))

(assert (= (and d!53991 res!84829) b!179178))

(assert (= (and d!53991 c!32135) b!179176))

(assert (= (and d!53991 (not c!32135)) b!179182))

(assert (= (and d!53991 res!84835) b!179164))

(assert (= (and b!179164 res!84832) b!179172))

(assert (= (and b!179164 (not res!84834)) b!179174))

(assert (= (and b!179174 res!84830) b!179171))

(assert (= (and b!179164 res!84828) b!179183))

(assert (= (and b!179183 c!32136) b!179166))

(assert (= (and b!179183 (not c!32136)) b!179184))

(assert (= (and b!179166 res!84833) b!179179))

(assert (= (or b!179166 b!179184) bm!18088))

(assert (= (and b!179183 res!84836) b!179169))

(assert (= (and b!179169 c!32138) b!179177))

(assert (= (and b!179169 (not c!32138)) b!179168))

(assert (= (and b!179177 res!84831) b!179167))

(assert (= (or b!179177 b!179168) bm!18090))

(declare-fun b_lambda!7089 () Bool)

(assert (=> (not b_lambda!7089) (not b!179171)))

(declare-fun t!7106 () Bool)

(declare-fun tb!2795 () Bool)

(assert (=> (and b!179006 (= (defaultEntry!3678 thiss!1248) (defaultEntry!3678 thiss!1248)) t!7106) tb!2795))

(declare-fun result!4675 () Bool)

(assert (=> tb!2795 (= result!4675 tp_is_empty!4189)))

(assert (=> b!179171 t!7106))

(declare-fun b_and!10925 () Bool)

(assert (= b_and!10919 (and (=> t!7106 result!4675) b_and!10925)))

(assert (=> b!179174 m!206929))

(assert (=> b!179174 m!206929))

(declare-fun m!206967 () Bool)

(assert (=> b!179174 m!206967))

(declare-fun m!206969 () Bool)

(assert (=> b!179176 m!206969))

(assert (=> b!179176 m!206929))

(declare-fun m!206971 () Bool)

(assert (=> b!179176 m!206971))

(declare-fun m!206973 () Bool)

(assert (=> b!179176 m!206973))

(declare-fun m!206975 () Bool)

(assert (=> b!179176 m!206975))

(declare-fun m!206977 () Bool)

(assert (=> b!179176 m!206977))

(declare-fun m!206979 () Bool)

(assert (=> b!179176 m!206979))

(declare-fun m!206981 () Bool)

(assert (=> b!179176 m!206981))

(declare-fun m!206983 () Bool)

(assert (=> b!179176 m!206983))

(declare-fun m!206985 () Bool)

(assert (=> b!179176 m!206985))

(declare-fun m!206987 () Bool)

(assert (=> b!179176 m!206987))

(assert (=> b!179176 m!206971))

(declare-fun m!206989 () Bool)

(assert (=> b!179176 m!206989))

(declare-fun m!206991 () Bool)

(assert (=> b!179176 m!206991))

(assert (=> b!179176 m!206985))

(declare-fun m!206993 () Bool)

(assert (=> b!179176 m!206993))

(declare-fun m!206995 () Bool)

(assert (=> b!179176 m!206995))

(assert (=> b!179176 m!206983))

(declare-fun m!206997 () Bool)

(assert (=> b!179176 m!206997))

(assert (=> b!179176 m!206975))

(declare-fun m!206999 () Bool)

(assert (=> b!179176 m!206999))

(declare-fun m!207001 () Bool)

(assert (=> bm!18089 m!207001))

(declare-fun m!207003 () Bool)

(assert (=> b!179179 m!207003))

(assert (=> b!179171 m!206929))

(declare-fun m!207005 () Bool)

(assert (=> b!179171 m!207005))

(assert (=> b!179171 m!206929))

(declare-fun m!207007 () Bool)

(assert (=> b!179171 m!207007))

(declare-fun m!207009 () Bool)

(assert (=> b!179171 m!207009))

(assert (=> b!179171 m!207005))

(declare-fun m!207011 () Bool)

(assert (=> b!179171 m!207011))

(assert (=> b!179171 m!207009))

(declare-fun m!207013 () Bool)

(assert (=> b!179167 m!207013))

(declare-fun m!207015 () Bool)

(assert (=> b!179170 m!207015))

(assert (=> b!179172 m!206929))

(assert (=> b!179172 m!206929))

(assert (=> b!179172 m!206931))

(declare-fun m!207017 () Bool)

(assert (=> bm!18088 m!207017))

(declare-fun m!207019 () Bool)

(assert (=> bm!18090 m!207019))

(assert (=> bm!18094 m!206989))

(assert (=> b!179178 m!206929))

(assert (=> b!179178 m!206929))

(assert (=> b!179178 m!206931))

(assert (=> d!53991 m!206875))

(assert (=> b!179007 d!53991))

(declare-fun condMapEmpty!7177 () Bool)

(declare-fun mapDefault!7177 () ValueCell!1751)

(assert (=> mapNonEmpty!7168 (= condMapEmpty!7177 (= mapRest!7168 ((as const (Array (_ BitVec 32) ValueCell!1751)) mapDefault!7177)))))

(declare-fun e!118055 () Bool)

(declare-fun mapRes!7177 () Bool)

(assert (=> mapNonEmpty!7168 (= tp!15973 (and e!118055 mapRes!7177))))

(declare-fun b!179193 () Bool)

(declare-fun e!118054 () Bool)

(assert (=> b!179193 (= e!118054 tp_is_empty!4189)))

(declare-fun mapNonEmpty!7177 () Bool)

(declare-fun tp!15988 () Bool)

(assert (=> mapNonEmpty!7177 (= mapRes!7177 (and tp!15988 e!118054))))

(declare-fun mapValue!7177 () ValueCell!1751)

(declare-fun mapKey!7177 () (_ BitVec 32))

(declare-fun mapRest!7177 () (Array (_ BitVec 32) ValueCell!1751))

(assert (=> mapNonEmpty!7177 (= mapRest!7168 (store mapRest!7177 mapKey!7177 mapValue!7177))))

(declare-fun mapIsEmpty!7177 () Bool)

(assert (=> mapIsEmpty!7177 mapRes!7177))

(declare-fun b!179194 () Bool)

(assert (=> b!179194 (= e!118055 tp_is_empty!4189)))

(assert (= (and mapNonEmpty!7168 condMapEmpty!7177) mapIsEmpty!7177))

(assert (= (and mapNonEmpty!7168 (not condMapEmpty!7177)) mapNonEmpty!7177))

(assert (= (and mapNonEmpty!7177 ((_ is ValueCellFull!1751) mapValue!7177)) b!179193))

(assert (= (and mapNonEmpty!7168 ((_ is ValueCellFull!1751) mapDefault!7177)) b!179194))

(declare-fun m!207021 () Bool)

(assert (=> mapNonEmpty!7177 m!207021))

(declare-fun b_lambda!7091 () Bool)

(assert (= b_lambda!7089 (or (and b!179006 b_free!4417) b_lambda!7091)))

(check-sat (not b!179094) (not b!179176) (not d!53985) (not b!179167) (not b!179119) (not mapNonEmpty!7177) (not b!179174) (not b!179171) (not b_lambda!7091) (not b!179121) (not b!179179) (not b!179092) b_and!10925 (not b!179085) tp_is_empty!4189 (not b!179107) (not bm!18088) (not bm!18090) (not b!179084) (not bm!18089) (not d!53989) (not b_next!4417) (not b!179170) (not b!179093) (not bm!18094) (not d!53987) (not bm!18073) (not d!53991) (not b!179178) (not b!179172))
(check-sat b_and!10925 (not b_next!4417))
