; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21860 () Bool)

(assert start!21860)

(declare-fun b!220309 () Bool)

(declare-fun b_free!5923 () Bool)

(declare-fun b_next!5923 () Bool)

(assert (=> b!220309 (= b_free!5923 (not b_next!5923))))

(declare-fun tp!20911 () Bool)

(declare-fun b_and!12795 () Bool)

(assert (=> b!220309 (= tp!20911 b_and!12795)))

(declare-fun tp_is_empty!5785 () Bool)

(declare-fun e!143241 () Bool)

(declare-datatypes ((V!7361 0))(
  ( (V!7362 (val!2937 Int)) )
))
(declare-datatypes ((ValueCell!2549 0))(
  ( (ValueCellFull!2549 (v!4951 V!7361)) (EmptyCell!2549) )
))
(declare-datatypes ((array!10805 0))(
  ( (array!10806 (arr!5121 (Array (_ BitVec 32) ValueCell!2549)) (size!5455 (_ BitVec 32))) )
))
(declare-datatypes ((array!10807 0))(
  ( (array!10808 (arr!5122 (Array (_ BitVec 32) (_ BitVec 64))) (size!5456 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2998 0))(
  ( (LongMapFixedSize!2999 (defaultEntry!4158 Int) (mask!9959 (_ BitVec 32)) (extraKeys!3895 (_ BitVec 32)) (zeroValue!3999 V!7361) (minValue!3999 V!7361) (_size!1548 (_ BitVec 32)) (_keys!6211 array!10807) (_values!4141 array!10805) (_vacant!1548 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!2998)

(declare-fun e!143240 () Bool)

(declare-fun array_inv!3373 (array!10807) Bool)

(declare-fun array_inv!3374 (array!10805) Bool)

(assert (=> b!220309 (= e!143240 (and tp!20911 tp_is_empty!5785 (array_inv!3373 (_keys!6211 thiss!1504)) (array_inv!3374 (_values!4141 thiss!1504)) e!143241))))

(declare-fun b!220310 () Bool)

(declare-fun e!143243 () Bool)

(assert (=> b!220310 (= e!143243 tp_is_empty!5785)))

(declare-fun mapNonEmpty!9847 () Bool)

(declare-fun mapRes!9847 () Bool)

(declare-fun tp!20910 () Bool)

(assert (=> mapNonEmpty!9847 (= mapRes!9847 (and tp!20910 e!143243))))

(declare-fun mapValue!9847 () ValueCell!2549)

(declare-fun mapKey!9847 () (_ BitVec 32))

(declare-fun mapRest!9847 () (Array (_ BitVec 32) ValueCell!2549))

(assert (=> mapNonEmpty!9847 (= (arr!5121 (_values!4141 thiss!1504)) (store mapRest!9847 mapKey!9847 mapValue!9847))))

(declare-fun b!220311 () Bool)

(declare-fun e!143238 () Bool)

(assert (=> b!220311 (= e!143241 (and e!143238 mapRes!9847))))

(declare-fun condMapEmpty!9847 () Bool)

(declare-fun mapDefault!9847 () ValueCell!2549)

(assert (=> b!220311 (= condMapEmpty!9847 (= (arr!5121 (_values!4141 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2549)) mapDefault!9847)))))

(declare-fun res!108014 () Bool)

(declare-fun e!143235 () Bool)

(assert (=> start!21860 (=> (not res!108014) (not e!143235))))

(declare-fun valid!1224 (LongMapFixedSize!2998) Bool)

(assert (=> start!21860 (= res!108014 (valid!1224 thiss!1504))))

(assert (=> start!21860 e!143235))

(assert (=> start!21860 e!143240))

(assert (=> start!21860 true))

(declare-fun b!220312 () Bool)

(declare-fun res!108005 () Bool)

(declare-fun e!143244 () Bool)

(assert (=> b!220312 (=> (not res!108005) (not e!143244))))

(declare-fun key!932 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!10807 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!220312 (= res!108005 (arrayContainsKey!0 (_keys!6211 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun bm!20576 () Bool)

(declare-fun call!20579 () Bool)

(assert (=> bm!20576 (= call!20579 (arrayContainsKey!0 (_keys!6211 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!220313 () Bool)

(declare-fun e!143237 () Bool)

(assert (=> b!220313 (= e!143235 e!143237)))

(declare-fun res!108013 () Bool)

(assert (=> b!220313 (=> (not res!108013) (not e!143237))))

(declare-datatypes ((SeekEntryResult!806 0))(
  ( (MissingZero!806 (index!5394 (_ BitVec 32))) (Found!806 (index!5395 (_ BitVec 32))) (Intermediate!806 (undefined!1618 Bool) (index!5396 (_ BitVec 32)) (x!22953 (_ BitVec 32))) (Undefined!806) (MissingVacant!806 (index!5397 (_ BitVec 32))) )
))
(declare-fun lt!112005 () SeekEntryResult!806)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!220313 (= res!108013 (or (= lt!112005 (MissingZero!806 index!297)) (= lt!112005 (MissingVacant!806 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10807 (_ BitVec 32)) SeekEntryResult!806)

(assert (=> b!220313 (= lt!112005 (seekEntryOrOpen!0 key!932 (_keys!6211 thiss!1504) (mask!9959 thiss!1504)))))

(declare-fun b!220314 () Bool)

(assert (=> b!220314 (= e!143237 e!143244)))

(declare-fun res!108003 () Bool)

(assert (=> b!220314 (=> (not res!108003) (not e!143244))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!220314 (= res!108003 (inRange!0 index!297 (mask!9959 thiss!1504)))))

(declare-datatypes ((Unit!6529 0))(
  ( (Unit!6530) )
))
(declare-fun lt!112004 () Unit!6529)

(declare-fun e!143242 () Unit!6529)

(assert (=> b!220314 (= lt!112004 e!143242)))

(declare-fun c!36660 () Bool)

(declare-datatypes ((tuple2!4320 0))(
  ( (tuple2!4321 (_1!2171 (_ BitVec 64)) (_2!2171 V!7361)) )
))
(declare-datatypes ((List!3243 0))(
  ( (Nil!3240) (Cons!3239 (h!3887 tuple2!4320) (t!8193 List!3243)) )
))
(declare-datatypes ((ListLongMap!3223 0))(
  ( (ListLongMap!3224 (toList!1627 List!3243)) )
))
(declare-fun contains!1470 (ListLongMap!3223 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1136 (array!10807 array!10805 (_ BitVec 32) (_ BitVec 32) V!7361 V!7361 (_ BitVec 32) Int) ListLongMap!3223)

(assert (=> b!220314 (= c!36660 (contains!1470 (getCurrentListMap!1136 (_keys!6211 thiss!1504) (_values!4141 thiss!1504) (mask!9959 thiss!1504) (extraKeys!3895 thiss!1504) (zeroValue!3999 thiss!1504) (minValue!3999 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4158 thiss!1504)) key!932))))

(declare-fun b!220315 () Bool)

(declare-fun c!36661 () Bool)

(get-info :version)

(assert (=> b!220315 (= c!36661 ((_ is MissingVacant!806) lt!112005))))

(declare-fun e!143247 () Bool)

(declare-fun e!143236 () Bool)

(assert (=> b!220315 (= e!143247 e!143236)))

(declare-fun b!220316 () Bool)

(declare-fun res!108007 () Bool)

(assert (=> b!220316 (=> (not res!108007) (not e!143244))))

(assert (=> b!220316 (= res!108007 (and (= (size!5455 (_values!4141 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!9959 thiss!1504))) (= (size!5456 (_keys!6211 thiss!1504)) (size!5455 (_values!4141 thiss!1504))) (bvsge (mask!9959 thiss!1504) #b00000000000000000000000000000000) (bvsge (extraKeys!3895 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!3895 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun b!220317 () Bool)

(assert (=> b!220317 (= e!143238 tp_is_empty!5785)))

(declare-fun b!220318 () Bool)

(declare-fun res!108004 () Bool)

(declare-fun e!143246 () Bool)

(assert (=> b!220318 (=> (not res!108004) (not e!143246))))

(assert (=> b!220318 (= res!108004 (= (select (arr!5122 (_keys!6211 thiss!1504)) (index!5394 lt!112005)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!220319 () Bool)

(declare-fun lt!112006 () Unit!6529)

(assert (=> b!220319 (= e!143242 lt!112006)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!201 (array!10807 array!10805 (_ BitVec 32) (_ BitVec 32) V!7361 V!7361 (_ BitVec 64) Int) Unit!6529)

(assert (=> b!220319 (= lt!112006 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!201 (_keys!6211 thiss!1504) (_values!4141 thiss!1504) (mask!9959 thiss!1504) (extraKeys!3895 thiss!1504) (zeroValue!3999 thiss!1504) (minValue!3999 thiss!1504) key!932 (defaultEntry!4158 thiss!1504)))))

(declare-fun c!36659 () Bool)

(assert (=> b!220319 (= c!36659 ((_ is MissingZero!806) lt!112005))))

(assert (=> b!220319 e!143247))

(declare-fun mapIsEmpty!9847 () Bool)

(assert (=> mapIsEmpty!9847 mapRes!9847))

(declare-fun bm!20577 () Bool)

(declare-fun call!20580 () Bool)

(assert (=> bm!20577 (= call!20580 (inRange!0 (ite c!36659 (index!5394 lt!112005) (index!5397 lt!112005)) (mask!9959 thiss!1504)))))

(declare-fun b!220320 () Bool)

(declare-fun res!108006 () Bool)

(assert (=> b!220320 (=> (not res!108006) (not e!143244))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10807 (_ BitVec 32)) Bool)

(assert (=> b!220320 (= res!108006 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6211 thiss!1504) (mask!9959 thiss!1504)))))

(declare-fun b!220321 () Bool)

(declare-fun res!108008 () Bool)

(assert (=> b!220321 (= res!108008 (= (select (arr!5122 (_keys!6211 thiss!1504)) (index!5397 lt!112005)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!143245 () Bool)

(assert (=> b!220321 (=> (not res!108008) (not e!143245))))

(declare-fun b!220322 () Bool)

(declare-fun res!108009 () Bool)

(assert (=> b!220322 (=> (not res!108009) (not e!143235))))

(assert (=> b!220322 (= res!108009 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!220323 () Bool)

(assert (=> b!220323 (= e!143236 e!143245)))

(declare-fun res!108012 () Bool)

(assert (=> b!220323 (= res!108012 call!20580)))

(assert (=> b!220323 (=> (not res!108012) (not e!143245))))

(declare-fun b!220324 () Bool)

(assert (=> b!220324 (= e!143246 (not call!20579))))

(declare-fun b!220325 () Bool)

(assert (=> b!220325 (= e!143245 (not call!20579))))

(declare-fun b!220326 () Bool)

(declare-fun res!108010 () Bool)

(assert (=> b!220326 (=> (not res!108010) (not e!143244))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!220326 (= res!108010 (validMask!0 (mask!9959 thiss!1504)))))

(declare-fun b!220327 () Bool)

(assert (=> b!220327 (= e!143244 false)))

(declare-fun lt!112002 () Bool)

(declare-datatypes ((List!3244 0))(
  ( (Nil!3241) (Cons!3240 (h!3888 (_ BitVec 64)) (t!8194 List!3244)) )
))
(declare-fun arrayNoDuplicates!0 (array!10807 (_ BitVec 32) List!3244) Bool)

(assert (=> b!220327 (= lt!112002 (arrayNoDuplicates!0 (_keys!6211 thiss!1504) #b00000000000000000000000000000000 Nil!3241))))

(declare-fun b!220328 () Bool)

(declare-fun res!108011 () Bool)

(assert (=> b!220328 (=> (not res!108011) (not e!143246))))

(assert (=> b!220328 (= res!108011 call!20580)))

(assert (=> b!220328 (= e!143247 e!143246)))

(declare-fun b!220329 () Bool)

(assert (=> b!220329 (= e!143236 ((_ is Undefined!806) lt!112005))))

(declare-fun b!220330 () Bool)

(declare-fun Unit!6531 () Unit!6529)

(assert (=> b!220330 (= e!143242 Unit!6531)))

(declare-fun lt!112003 () Unit!6529)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!199 (array!10807 array!10805 (_ BitVec 32) (_ BitVec 32) V!7361 V!7361 (_ BitVec 64) Int) Unit!6529)

(assert (=> b!220330 (= lt!112003 (lemmaInListMapThenSeekEntryOrOpenFindsIt!199 (_keys!6211 thiss!1504) (_values!4141 thiss!1504) (mask!9959 thiss!1504) (extraKeys!3895 thiss!1504) (zeroValue!3999 thiss!1504) (minValue!3999 thiss!1504) key!932 (defaultEntry!4158 thiss!1504)))))

(assert (=> b!220330 false))

(assert (= (and start!21860 res!108014) b!220322))

(assert (= (and b!220322 res!108009) b!220313))

(assert (= (and b!220313 res!108013) b!220314))

(assert (= (and b!220314 c!36660) b!220330))

(assert (= (and b!220314 (not c!36660)) b!220319))

(assert (= (and b!220319 c!36659) b!220328))

(assert (= (and b!220319 (not c!36659)) b!220315))

(assert (= (and b!220328 res!108011) b!220318))

(assert (= (and b!220318 res!108004) b!220324))

(assert (= (and b!220315 c!36661) b!220323))

(assert (= (and b!220315 (not c!36661)) b!220329))

(assert (= (and b!220323 res!108012) b!220321))

(assert (= (and b!220321 res!108008) b!220325))

(assert (= (or b!220328 b!220323) bm!20577))

(assert (= (or b!220324 b!220325) bm!20576))

(assert (= (and b!220314 res!108003) b!220312))

(assert (= (and b!220312 res!108005) b!220326))

(assert (= (and b!220326 res!108010) b!220316))

(assert (= (and b!220316 res!108007) b!220320))

(assert (= (and b!220320 res!108006) b!220327))

(assert (= (and b!220311 condMapEmpty!9847) mapIsEmpty!9847))

(assert (= (and b!220311 (not condMapEmpty!9847)) mapNonEmpty!9847))

(assert (= (and mapNonEmpty!9847 ((_ is ValueCellFull!2549) mapValue!9847)) b!220310))

(assert (= (and b!220311 ((_ is ValueCellFull!2549) mapDefault!9847)) b!220317))

(assert (= b!220309 b!220311))

(assert (= start!21860 b!220309))

(declare-fun m!244957 () Bool)

(assert (=> b!220327 m!244957))

(declare-fun m!244959 () Bool)

(assert (=> b!220326 m!244959))

(declare-fun m!244961 () Bool)

(assert (=> start!21860 m!244961))

(declare-fun m!244963 () Bool)

(assert (=> b!220318 m!244963))

(declare-fun m!244965 () Bool)

(assert (=> bm!20576 m!244965))

(declare-fun m!244967 () Bool)

(assert (=> b!220330 m!244967))

(declare-fun m!244969 () Bool)

(assert (=> b!220321 m!244969))

(declare-fun m!244971 () Bool)

(assert (=> b!220320 m!244971))

(declare-fun m!244973 () Bool)

(assert (=> bm!20577 m!244973))

(declare-fun m!244975 () Bool)

(assert (=> b!220309 m!244975))

(declare-fun m!244977 () Bool)

(assert (=> b!220309 m!244977))

(declare-fun m!244979 () Bool)

(assert (=> mapNonEmpty!9847 m!244979))

(assert (=> b!220312 m!244965))

(declare-fun m!244981 () Bool)

(assert (=> b!220319 m!244981))

(declare-fun m!244983 () Bool)

(assert (=> b!220313 m!244983))

(declare-fun m!244985 () Bool)

(assert (=> b!220314 m!244985))

(declare-fun m!244987 () Bool)

(assert (=> b!220314 m!244987))

(assert (=> b!220314 m!244987))

(declare-fun m!244989 () Bool)

(assert (=> b!220314 m!244989))

(check-sat (not b!220326) (not b!220314) (not b!220320) b_and!12795 (not b!220312) tp_is_empty!5785 (not b!220330) (not bm!20576) (not mapNonEmpty!9847) (not b_next!5923) (not b!220319) (not b!220327) (not b!220309) (not bm!20577) (not start!21860) (not b!220313))
(check-sat b_and!12795 (not b_next!5923))
