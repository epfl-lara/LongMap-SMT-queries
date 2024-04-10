; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!76776 () Bool)

(assert start!76776)

(declare-fun b!898263 () Bool)

(declare-fun b_free!16011 () Bool)

(declare-fun b_next!16011 () Bool)

(assert (=> b!898263 (= b_free!16011 (not b_next!16011))))

(declare-fun tp!56098 () Bool)

(declare-fun b_and!26303 () Bool)

(assert (=> b!898263 (= tp!56098 b_and!26303)))

(declare-fun b!898261 () Bool)

(declare-fun res!607074 () Bool)

(declare-fun e!502444 () Bool)

(assert (=> b!898261 (=> (not res!607074) (not e!502444))))

(declare-fun key!785 () (_ BitVec 64))

(assert (=> b!898261 (= res!607074 (not (= key!785 (bvneg key!785))))))

(declare-fun b!898262 () Bool)

(declare-fun e!502446 () Bool)

(declare-fun e!502445 () Bool)

(declare-fun mapRes!29160 () Bool)

(assert (=> b!898262 (= e!502446 (and e!502445 mapRes!29160))))

(declare-fun condMapEmpty!29160 () Bool)

(declare-datatypes ((array!52714 0))(
  ( (array!52715 (arr!25335 (Array (_ BitVec 32) (_ BitVec 64))) (size!25790 (_ BitVec 32))) )
))
(declare-datatypes ((V!29417 0))(
  ( (V!29418 (val!9220 Int)) )
))
(declare-datatypes ((ValueCell!8688 0))(
  ( (ValueCellFull!8688 (v!11710 V!29417)) (EmptyCell!8688) )
))
(declare-datatypes ((array!52716 0))(
  ( (array!52717 (arr!25336 (Array (_ BitVec 32) ValueCell!8688)) (size!25791 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4392 0))(
  ( (LongMapFixedSize!4393 (defaultEntry!5408 Int) (mask!26132 (_ BitVec 32)) (extraKeys!5123 (_ BitVec 32)) (zeroValue!5227 V!29417) (minValue!5227 V!29417) (_size!2251 (_ BitVec 32)) (_keys!10181 array!52714) (_values!5414 array!52716) (_vacant!2251 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4392)

(declare-fun mapDefault!29160 () ValueCell!8688)

(assert (=> b!898262 (= condMapEmpty!29160 (= (arr!25336 (_values!5414 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8688)) mapDefault!29160)))))

(declare-fun tp_is_empty!18339 () Bool)

(declare-fun e!502448 () Bool)

(declare-fun array_inv!19884 (array!52714) Bool)

(declare-fun array_inv!19885 (array!52716) Bool)

(assert (=> b!898263 (= e!502448 (and tp!56098 tp_is_empty!18339 (array_inv!19884 (_keys!10181 thiss!1181)) (array_inv!19885 (_values!5414 thiss!1181)) e!502446))))

(declare-fun b!898264 () Bool)

(declare-fun e!502447 () Bool)

(assert (=> b!898264 (= e!502447 tp_is_empty!18339)))

(declare-fun b!898265 () Bool)

(declare-fun e!502442 () Bool)

(assert (=> b!898265 (= e!502444 (not e!502442))))

(declare-fun res!607071 () Bool)

(assert (=> b!898265 (=> res!607071 e!502442)))

(declare-datatypes ((SeekEntryResult!8923 0))(
  ( (MissingZero!8923 (index!38063 (_ BitVec 32))) (Found!8923 (index!38064 (_ BitVec 32))) (Intermediate!8923 (undefined!9735 Bool) (index!38065 (_ BitVec 32)) (x!76552 (_ BitVec 32))) (Undefined!8923) (MissingVacant!8923 (index!38066 (_ BitVec 32))) )
))
(declare-fun lt!405466 () SeekEntryResult!8923)

(get-info :version)

(assert (=> b!898265 (= res!607071 (not ((_ is Found!8923) lt!405466)))))

(declare-fun e!502443 () Bool)

(assert (=> b!898265 e!502443))

(declare-fun res!607073 () Bool)

(assert (=> b!898265 (=> res!607073 e!502443)))

(assert (=> b!898265 (= res!607073 (not ((_ is Found!8923) lt!405466)))))

(declare-datatypes ((Unit!30534 0))(
  ( (Unit!30535) )
))
(declare-fun lt!405469 () Unit!30534)

(declare-fun lemmaSeekEntryGivesInRangeIndex!90 (array!52714 array!52716 (_ BitVec 32) (_ BitVec 32) V!29417 V!29417 (_ BitVec 64)) Unit!30534)

(assert (=> b!898265 (= lt!405469 (lemmaSeekEntryGivesInRangeIndex!90 (_keys!10181 thiss!1181) (_values!5414 thiss!1181) (mask!26132 thiss!1181) (extraKeys!5123 thiss!1181) (zeroValue!5227 thiss!1181) (minValue!5227 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52714 (_ BitVec 32)) SeekEntryResult!8923)

(assert (=> b!898265 (= lt!405466 (seekEntry!0 key!785 (_keys!10181 thiss!1181) (mask!26132 thiss!1181)))))

(declare-fun b!898266 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!898266 (= e!502443 (inRange!0 (index!38064 lt!405466) (mask!26132 thiss!1181)))))

(declare-fun mapNonEmpty!29160 () Bool)

(declare-fun tp!56099 () Bool)

(assert (=> mapNonEmpty!29160 (= mapRes!29160 (and tp!56099 e!502447))))

(declare-fun mapKey!29160 () (_ BitVec 32))

(declare-fun mapRest!29160 () (Array (_ BitVec 32) ValueCell!8688))

(declare-fun mapValue!29160 () ValueCell!8688)

(assert (=> mapNonEmpty!29160 (= (arr!25336 (_values!5414 thiss!1181)) (store mapRest!29160 mapKey!29160 mapValue!29160))))

(declare-fun res!607072 () Bool)

(assert (=> start!76776 (=> (not res!607072) (not e!502444))))

(declare-fun valid!1690 (LongMapFixedSize!4392) Bool)

(assert (=> start!76776 (= res!607072 (valid!1690 thiss!1181))))

(assert (=> start!76776 e!502444))

(assert (=> start!76776 e!502448))

(assert (=> start!76776 true))

(declare-fun mapIsEmpty!29160 () Bool)

(assert (=> mapIsEmpty!29160 mapRes!29160))

(declare-fun b!898267 () Bool)

(assert (=> b!898267 (= e!502445 tp_is_empty!18339)))

(declare-fun b!898268 () Bool)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!898268 (= e!502442 (validMask!0 (mask!26132 thiss!1181)))))

(declare-datatypes ((tuple2!12032 0))(
  ( (tuple2!12033 (_1!6027 (_ BitVec 64)) (_2!6027 V!29417)) )
))
(declare-datatypes ((List!17838 0))(
  ( (Nil!17835) (Cons!17834 (h!18976 tuple2!12032) (t!25177 List!17838)) )
))
(declare-datatypes ((ListLongMap!10729 0))(
  ( (ListLongMap!10730 (toList!5380 List!17838)) )
))
(declare-fun contains!4409 (ListLongMap!10729 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2654 (array!52714 array!52716 (_ BitVec 32) (_ BitVec 32) V!29417 V!29417 (_ BitVec 32) Int) ListLongMap!10729)

(assert (=> b!898268 (contains!4409 (getCurrentListMap!2654 (_keys!10181 thiss!1181) (_values!5414 thiss!1181) (mask!26132 thiss!1181) (extraKeys!5123 thiss!1181) (zeroValue!5227 thiss!1181) (minValue!5227 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5408 thiss!1181)) (select (arr!25335 (_keys!10181 thiss!1181)) (index!38064 lt!405466)))))

(declare-fun lt!405467 () Unit!30534)

(declare-fun lemmaValidKeyInArrayIsInListMap!243 (array!52714 array!52716 (_ BitVec 32) (_ BitVec 32) V!29417 V!29417 (_ BitVec 32) Int) Unit!30534)

(assert (=> b!898268 (= lt!405467 (lemmaValidKeyInArrayIsInListMap!243 (_keys!10181 thiss!1181) (_values!5414 thiss!1181) (mask!26132 thiss!1181) (extraKeys!5123 thiss!1181) (zeroValue!5227 thiss!1181) (minValue!5227 thiss!1181) (index!38064 lt!405466) (defaultEntry!5408 thiss!1181)))))

(declare-fun arrayContainsKey!0 (array!52714 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!898268 (arrayContainsKey!0 (_keys!10181 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-fun lt!405468 () Unit!30534)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52714 (_ BitVec 64) (_ BitVec 32)) Unit!30534)

(assert (=> b!898268 (= lt!405468 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10181 thiss!1181) key!785 (index!38064 lt!405466)))))

(assert (= (and start!76776 res!607072) b!898261))

(assert (= (and b!898261 res!607074) b!898265))

(assert (= (and b!898265 (not res!607073)) b!898266))

(assert (= (and b!898265 (not res!607071)) b!898268))

(assert (= (and b!898262 condMapEmpty!29160) mapIsEmpty!29160))

(assert (= (and b!898262 (not condMapEmpty!29160)) mapNonEmpty!29160))

(assert (= (and mapNonEmpty!29160 ((_ is ValueCellFull!8688) mapValue!29160)) b!898264))

(assert (= (and b!898262 ((_ is ValueCellFull!8688) mapDefault!29160)) b!898267))

(assert (= b!898263 b!898262))

(assert (= start!76776 b!898263))

(declare-fun m!834777 () Bool)

(assert (=> start!76776 m!834777))

(declare-fun m!834779 () Bool)

(assert (=> b!898266 m!834779))

(declare-fun m!834781 () Bool)

(assert (=> mapNonEmpty!29160 m!834781))

(declare-fun m!834783 () Bool)

(assert (=> b!898263 m!834783))

(declare-fun m!834785 () Bool)

(assert (=> b!898263 m!834785))

(declare-fun m!834787 () Bool)

(assert (=> b!898268 m!834787))

(declare-fun m!834789 () Bool)

(assert (=> b!898268 m!834789))

(declare-fun m!834791 () Bool)

(assert (=> b!898268 m!834791))

(declare-fun m!834793 () Bool)

(assert (=> b!898268 m!834793))

(declare-fun m!834795 () Bool)

(assert (=> b!898268 m!834795))

(assert (=> b!898268 m!834793))

(declare-fun m!834797 () Bool)

(assert (=> b!898268 m!834797))

(declare-fun m!834799 () Bool)

(assert (=> b!898268 m!834799))

(assert (=> b!898268 m!834797))

(declare-fun m!834801 () Bool)

(assert (=> b!898265 m!834801))

(declare-fun m!834803 () Bool)

(assert (=> b!898265 m!834803))

(check-sat tp_is_empty!18339 (not start!76776) (not b!898268) (not b!898263) (not b_next!16011) (not b!898266) (not mapNonEmpty!29160) b_and!26303 (not b!898265))
(check-sat b_and!26303 (not b_next!16011))
(get-model)

(declare-fun d!111213 () Bool)

(declare-fun e!502475 () Bool)

(assert (=> d!111213 e!502475))

(declare-fun res!607089 () Bool)

(assert (=> d!111213 (=> res!607089 e!502475)))

(declare-fun lt!405487 () SeekEntryResult!8923)

(assert (=> d!111213 (= res!607089 (not ((_ is Found!8923) lt!405487)))))

(assert (=> d!111213 (= lt!405487 (seekEntry!0 key!785 (_keys!10181 thiss!1181) (mask!26132 thiss!1181)))))

(declare-fun lt!405486 () Unit!30534)

(declare-fun choose!1488 (array!52714 array!52716 (_ BitVec 32) (_ BitVec 32) V!29417 V!29417 (_ BitVec 64)) Unit!30534)

(assert (=> d!111213 (= lt!405486 (choose!1488 (_keys!10181 thiss!1181) (_values!5414 thiss!1181) (mask!26132 thiss!1181) (extraKeys!5123 thiss!1181) (zeroValue!5227 thiss!1181) (minValue!5227 thiss!1181) key!785))))

(assert (=> d!111213 (validMask!0 (mask!26132 thiss!1181))))

(assert (=> d!111213 (= (lemmaSeekEntryGivesInRangeIndex!90 (_keys!10181 thiss!1181) (_values!5414 thiss!1181) (mask!26132 thiss!1181) (extraKeys!5123 thiss!1181) (zeroValue!5227 thiss!1181) (minValue!5227 thiss!1181) key!785) lt!405486)))

(declare-fun b!898295 () Bool)

(assert (=> b!898295 (= e!502475 (inRange!0 (index!38064 lt!405487) (mask!26132 thiss!1181)))))

(assert (= (and d!111213 (not res!607089)) b!898295))

(assert (=> d!111213 m!834803))

(declare-fun m!834833 () Bool)

(assert (=> d!111213 m!834833))

(assert (=> d!111213 m!834791))

(declare-fun m!834835 () Bool)

(assert (=> b!898295 m!834835))

(assert (=> b!898265 d!111213))

(declare-fun b!898308 () Bool)

(declare-fun c!94921 () Bool)

(declare-fun lt!405498 () (_ BitVec 64))

(assert (=> b!898308 (= c!94921 (= lt!405498 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!502484 () SeekEntryResult!8923)

(declare-fun e!502483 () SeekEntryResult!8923)

(assert (=> b!898308 (= e!502484 e!502483)))

(declare-fun b!898309 () Bool)

(declare-fun lt!405497 () SeekEntryResult!8923)

(assert (=> b!898309 (= e!502483 (MissingZero!8923 (index!38065 lt!405497)))))

(declare-fun b!898310 () Bool)

(declare-fun e!502482 () SeekEntryResult!8923)

(assert (=> b!898310 (= e!502482 Undefined!8923)))

(declare-fun b!898311 () Bool)

(assert (=> b!898311 (= e!502484 (Found!8923 (index!38065 lt!405497)))))

(declare-fun d!111215 () Bool)

(declare-fun lt!405499 () SeekEntryResult!8923)

(assert (=> d!111215 (and (or ((_ is MissingVacant!8923) lt!405499) (not ((_ is Found!8923) lt!405499)) (and (bvsge (index!38064 lt!405499) #b00000000000000000000000000000000) (bvslt (index!38064 lt!405499) (size!25790 (_keys!10181 thiss!1181))))) (not ((_ is MissingVacant!8923) lt!405499)) (or (not ((_ is Found!8923) lt!405499)) (= (select (arr!25335 (_keys!10181 thiss!1181)) (index!38064 lt!405499)) key!785)))))

(assert (=> d!111215 (= lt!405499 e!502482)))

(declare-fun c!94920 () Bool)

(assert (=> d!111215 (= c!94920 (and ((_ is Intermediate!8923) lt!405497) (undefined!9735 lt!405497)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52714 (_ BitVec 32)) SeekEntryResult!8923)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!111215 (= lt!405497 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!785 (mask!26132 thiss!1181)) key!785 (_keys!10181 thiss!1181) (mask!26132 thiss!1181)))))

(assert (=> d!111215 (validMask!0 (mask!26132 thiss!1181))))

(assert (=> d!111215 (= (seekEntry!0 key!785 (_keys!10181 thiss!1181) (mask!26132 thiss!1181)) lt!405499)))

(declare-fun b!898312 () Bool)

(declare-fun lt!405496 () SeekEntryResult!8923)

(assert (=> b!898312 (= e!502483 (ite ((_ is MissingVacant!8923) lt!405496) (MissingZero!8923 (index!38066 lt!405496)) lt!405496))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52714 (_ BitVec 32)) SeekEntryResult!8923)

(assert (=> b!898312 (= lt!405496 (seekKeyOrZeroReturnVacant!0 (x!76552 lt!405497) (index!38065 lt!405497) (index!38065 lt!405497) key!785 (_keys!10181 thiss!1181) (mask!26132 thiss!1181)))))

(declare-fun b!898313 () Bool)

(assert (=> b!898313 (= e!502482 e!502484)))

(assert (=> b!898313 (= lt!405498 (select (arr!25335 (_keys!10181 thiss!1181)) (index!38065 lt!405497)))))

(declare-fun c!94922 () Bool)

(assert (=> b!898313 (= c!94922 (= lt!405498 key!785))))

(assert (= (and d!111215 c!94920) b!898310))

(assert (= (and d!111215 (not c!94920)) b!898313))

(assert (= (and b!898313 c!94922) b!898311))

(assert (= (and b!898313 (not c!94922)) b!898308))

(assert (= (and b!898308 c!94921) b!898309))

(assert (= (and b!898308 (not c!94921)) b!898312))

(declare-fun m!834837 () Bool)

(assert (=> d!111215 m!834837))

(declare-fun m!834839 () Bool)

(assert (=> d!111215 m!834839))

(assert (=> d!111215 m!834839))

(declare-fun m!834841 () Bool)

(assert (=> d!111215 m!834841))

(assert (=> d!111215 m!834791))

(declare-fun m!834843 () Bool)

(assert (=> b!898312 m!834843))

(declare-fun m!834845 () Bool)

(assert (=> b!898313 m!834845))

(assert (=> b!898265 d!111215))

(declare-fun d!111217 () Bool)

(declare-fun res!607094 () Bool)

(declare-fun e!502489 () Bool)

(assert (=> d!111217 (=> res!607094 e!502489)))

(assert (=> d!111217 (= res!607094 (= (select (arr!25335 (_keys!10181 thiss!1181)) #b00000000000000000000000000000000) key!785))))

(assert (=> d!111217 (= (arrayContainsKey!0 (_keys!10181 thiss!1181) key!785 #b00000000000000000000000000000000) e!502489)))

(declare-fun b!898318 () Bool)

(declare-fun e!502490 () Bool)

(assert (=> b!898318 (= e!502489 e!502490)))

(declare-fun res!607095 () Bool)

(assert (=> b!898318 (=> (not res!607095) (not e!502490))))

(assert (=> b!898318 (= res!607095 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!25790 (_keys!10181 thiss!1181))))))

(declare-fun b!898319 () Bool)

(assert (=> b!898319 (= e!502490 (arrayContainsKey!0 (_keys!10181 thiss!1181) key!785 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!111217 (not res!607094)) b!898318))

(assert (= (and b!898318 res!607095) b!898319))

(declare-fun m!834847 () Bool)

(assert (=> d!111217 m!834847))

(declare-fun m!834849 () Bool)

(assert (=> b!898319 m!834849))

(assert (=> b!898268 d!111217))

(declare-fun d!111219 () Bool)

(declare-fun e!502493 () Bool)

(assert (=> d!111219 e!502493))

(declare-fun res!607098 () Bool)

(assert (=> d!111219 (=> (not res!607098) (not e!502493))))

(assert (=> d!111219 (= res!607098 (and (bvsge (index!38064 lt!405466) #b00000000000000000000000000000000) (bvslt (index!38064 lt!405466) (size!25790 (_keys!10181 thiss!1181)))))))

(declare-fun lt!405502 () Unit!30534)

(declare-fun choose!1489 (array!52714 array!52716 (_ BitVec 32) (_ BitVec 32) V!29417 V!29417 (_ BitVec 32) Int) Unit!30534)

(assert (=> d!111219 (= lt!405502 (choose!1489 (_keys!10181 thiss!1181) (_values!5414 thiss!1181) (mask!26132 thiss!1181) (extraKeys!5123 thiss!1181) (zeroValue!5227 thiss!1181) (minValue!5227 thiss!1181) (index!38064 lt!405466) (defaultEntry!5408 thiss!1181)))))

(assert (=> d!111219 (validMask!0 (mask!26132 thiss!1181))))

(assert (=> d!111219 (= (lemmaValidKeyInArrayIsInListMap!243 (_keys!10181 thiss!1181) (_values!5414 thiss!1181) (mask!26132 thiss!1181) (extraKeys!5123 thiss!1181) (zeroValue!5227 thiss!1181) (minValue!5227 thiss!1181) (index!38064 lt!405466) (defaultEntry!5408 thiss!1181)) lt!405502)))

(declare-fun b!898322 () Bool)

(assert (=> b!898322 (= e!502493 (contains!4409 (getCurrentListMap!2654 (_keys!10181 thiss!1181) (_values!5414 thiss!1181) (mask!26132 thiss!1181) (extraKeys!5123 thiss!1181) (zeroValue!5227 thiss!1181) (minValue!5227 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5408 thiss!1181)) (select (arr!25335 (_keys!10181 thiss!1181)) (index!38064 lt!405466))))))

(assert (= (and d!111219 res!607098) b!898322))

(declare-fun m!834851 () Bool)

(assert (=> d!111219 m!834851))

(assert (=> d!111219 m!834791))

(assert (=> b!898322 m!834793))

(assert (=> b!898322 m!834797))

(assert (=> b!898322 m!834793))

(assert (=> b!898322 m!834797))

(assert (=> b!898322 m!834799))

(assert (=> b!898268 d!111219))

(declare-fun d!111221 () Bool)

(assert (=> d!111221 (arrayContainsKey!0 (_keys!10181 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-fun lt!405505 () Unit!30534)

(declare-fun choose!13 (array!52714 (_ BitVec 64) (_ BitVec 32)) Unit!30534)

(assert (=> d!111221 (= lt!405505 (choose!13 (_keys!10181 thiss!1181) key!785 (index!38064 lt!405466)))))

(assert (=> d!111221 (bvsge (index!38064 lt!405466) #b00000000000000000000000000000000)))

(assert (=> d!111221 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10181 thiss!1181) key!785 (index!38064 lt!405466)) lt!405505)))

(declare-fun bs!25210 () Bool)

(assert (= bs!25210 d!111221))

(assert (=> bs!25210 m!834787))

(declare-fun m!834853 () Bool)

(assert (=> bs!25210 m!834853))

(assert (=> b!898268 d!111221))

(declare-fun d!111223 () Bool)

(assert (=> d!111223 (= (validMask!0 (mask!26132 thiss!1181)) (and (or (= (mask!26132 thiss!1181) #b00000000000000000000000000000111) (= (mask!26132 thiss!1181) #b00000000000000000000000000001111) (= (mask!26132 thiss!1181) #b00000000000000000000000000011111) (= (mask!26132 thiss!1181) #b00000000000000000000000000111111) (= (mask!26132 thiss!1181) #b00000000000000000000000001111111) (= (mask!26132 thiss!1181) #b00000000000000000000000011111111) (= (mask!26132 thiss!1181) #b00000000000000000000000111111111) (= (mask!26132 thiss!1181) #b00000000000000000000001111111111) (= (mask!26132 thiss!1181) #b00000000000000000000011111111111) (= (mask!26132 thiss!1181) #b00000000000000000000111111111111) (= (mask!26132 thiss!1181) #b00000000000000000001111111111111) (= (mask!26132 thiss!1181) #b00000000000000000011111111111111) (= (mask!26132 thiss!1181) #b00000000000000000111111111111111) (= (mask!26132 thiss!1181) #b00000000000000001111111111111111) (= (mask!26132 thiss!1181) #b00000000000000011111111111111111) (= (mask!26132 thiss!1181) #b00000000000000111111111111111111) (= (mask!26132 thiss!1181) #b00000000000001111111111111111111) (= (mask!26132 thiss!1181) #b00000000000011111111111111111111) (= (mask!26132 thiss!1181) #b00000000000111111111111111111111) (= (mask!26132 thiss!1181) #b00000000001111111111111111111111) (= (mask!26132 thiss!1181) #b00000000011111111111111111111111) (= (mask!26132 thiss!1181) #b00000000111111111111111111111111) (= (mask!26132 thiss!1181) #b00000001111111111111111111111111) (= (mask!26132 thiss!1181) #b00000011111111111111111111111111) (= (mask!26132 thiss!1181) #b00000111111111111111111111111111) (= (mask!26132 thiss!1181) #b00001111111111111111111111111111) (= (mask!26132 thiss!1181) #b00011111111111111111111111111111) (= (mask!26132 thiss!1181) #b00111111111111111111111111111111)) (bvsle (mask!26132 thiss!1181) #b00111111111111111111111111111111)))))

(assert (=> b!898268 d!111223))

(declare-fun d!111225 () Bool)

(declare-fun e!502531 () Bool)

(assert (=> d!111225 e!502531))

(declare-fun res!607118 () Bool)

(assert (=> d!111225 (=> (not res!607118) (not e!502531))))

(assert (=> d!111225 (= res!607118 (or (bvsge #b00000000000000000000000000000000 (size!25790 (_keys!10181 thiss!1181))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25790 (_keys!10181 thiss!1181))))))))

(declare-fun lt!405569 () ListLongMap!10729)

(declare-fun lt!405565 () ListLongMap!10729)

(assert (=> d!111225 (= lt!405569 lt!405565)))

(declare-fun lt!405559 () Unit!30534)

(declare-fun e!502526 () Unit!30534)

(assert (=> d!111225 (= lt!405559 e!502526)))

(declare-fun c!94938 () Bool)

(declare-fun e!502532 () Bool)

(assert (=> d!111225 (= c!94938 e!502532)))

(declare-fun res!607117 () Bool)

(assert (=> d!111225 (=> (not res!607117) (not e!502532))))

(assert (=> d!111225 (= res!607117 (bvslt #b00000000000000000000000000000000 (size!25790 (_keys!10181 thiss!1181))))))

(declare-fun e!502521 () ListLongMap!10729)

(assert (=> d!111225 (= lt!405565 e!502521)))

(declare-fun c!94939 () Bool)

(assert (=> d!111225 (= c!94939 (and (not (= (bvand (extraKeys!5123 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5123 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!111225 (validMask!0 (mask!26132 thiss!1181))))

(assert (=> d!111225 (= (getCurrentListMap!2654 (_keys!10181 thiss!1181) (_values!5414 thiss!1181) (mask!26132 thiss!1181) (extraKeys!5123 thiss!1181) (zeroValue!5227 thiss!1181) (minValue!5227 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5408 thiss!1181)) lt!405569)))

(declare-fun b!898365 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!898365 (= e!502532 (validKeyInArray!0 (select (arr!25335 (_keys!10181 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!898366 () Bool)

(declare-fun call!39854 () ListLongMap!10729)

(declare-fun +!2590 (ListLongMap!10729 tuple2!12032) ListLongMap!10729)

(assert (=> b!898366 (= e!502521 (+!2590 call!39854 (tuple2!12033 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5227 thiss!1181))))))

(declare-fun b!898367 () Bool)

(declare-fun c!94936 () Bool)

(assert (=> b!898367 (= c!94936 (and (not (= (bvand (extraKeys!5123 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5123 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!502522 () ListLongMap!10729)

(declare-fun e!502524 () ListLongMap!10729)

(assert (=> b!898367 (= e!502522 e!502524)))

(declare-fun bm!39847 () Bool)

(declare-fun call!39856 () ListLongMap!10729)

(declare-fun getCurrentListMapNoExtraKeys!3277 (array!52714 array!52716 (_ BitVec 32) (_ BitVec 32) V!29417 V!29417 (_ BitVec 32) Int) ListLongMap!10729)

(assert (=> bm!39847 (= call!39856 (getCurrentListMapNoExtraKeys!3277 (_keys!10181 thiss!1181) (_values!5414 thiss!1181) (mask!26132 thiss!1181) (extraKeys!5123 thiss!1181) (zeroValue!5227 thiss!1181) (minValue!5227 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5408 thiss!1181)))))

(declare-fun b!898368 () Bool)

(declare-fun lt!405551 () Unit!30534)

(assert (=> b!898368 (= e!502526 lt!405551)))

(declare-fun lt!405561 () ListLongMap!10729)

(assert (=> b!898368 (= lt!405561 (getCurrentListMapNoExtraKeys!3277 (_keys!10181 thiss!1181) (_values!5414 thiss!1181) (mask!26132 thiss!1181) (extraKeys!5123 thiss!1181) (zeroValue!5227 thiss!1181) (minValue!5227 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5408 thiss!1181)))))

(declare-fun lt!405568 () (_ BitVec 64))

(assert (=> b!898368 (= lt!405568 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!405566 () (_ BitVec 64))

(assert (=> b!898368 (= lt!405566 (select (arr!25335 (_keys!10181 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun lt!405567 () Unit!30534)

(declare-fun addStillContains!331 (ListLongMap!10729 (_ BitVec 64) V!29417 (_ BitVec 64)) Unit!30534)

(assert (=> b!898368 (= lt!405567 (addStillContains!331 lt!405561 lt!405568 (zeroValue!5227 thiss!1181) lt!405566))))

(assert (=> b!898368 (contains!4409 (+!2590 lt!405561 (tuple2!12033 lt!405568 (zeroValue!5227 thiss!1181))) lt!405566)))

(declare-fun lt!405563 () Unit!30534)

(assert (=> b!898368 (= lt!405563 lt!405567)))

(declare-fun lt!405564 () ListLongMap!10729)

(assert (=> b!898368 (= lt!405564 (getCurrentListMapNoExtraKeys!3277 (_keys!10181 thiss!1181) (_values!5414 thiss!1181) (mask!26132 thiss!1181) (extraKeys!5123 thiss!1181) (zeroValue!5227 thiss!1181) (minValue!5227 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5408 thiss!1181)))))

(declare-fun lt!405553 () (_ BitVec 64))

(assert (=> b!898368 (= lt!405553 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!405555 () (_ BitVec 64))

(assert (=> b!898368 (= lt!405555 (select (arr!25335 (_keys!10181 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun lt!405550 () Unit!30534)

(declare-fun addApplyDifferent!331 (ListLongMap!10729 (_ BitVec 64) V!29417 (_ BitVec 64)) Unit!30534)

(assert (=> b!898368 (= lt!405550 (addApplyDifferent!331 lt!405564 lt!405553 (minValue!5227 thiss!1181) lt!405555))))

(declare-fun apply!409 (ListLongMap!10729 (_ BitVec 64)) V!29417)

(assert (=> b!898368 (= (apply!409 (+!2590 lt!405564 (tuple2!12033 lt!405553 (minValue!5227 thiss!1181))) lt!405555) (apply!409 lt!405564 lt!405555))))

(declare-fun lt!405570 () Unit!30534)

(assert (=> b!898368 (= lt!405570 lt!405550)))

(declare-fun lt!405558 () ListLongMap!10729)

(assert (=> b!898368 (= lt!405558 (getCurrentListMapNoExtraKeys!3277 (_keys!10181 thiss!1181) (_values!5414 thiss!1181) (mask!26132 thiss!1181) (extraKeys!5123 thiss!1181) (zeroValue!5227 thiss!1181) (minValue!5227 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5408 thiss!1181)))))

(declare-fun lt!405562 () (_ BitVec 64))

(assert (=> b!898368 (= lt!405562 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!405557 () (_ BitVec 64))

(assert (=> b!898368 (= lt!405557 (select (arr!25335 (_keys!10181 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun lt!405552 () Unit!30534)

(assert (=> b!898368 (= lt!405552 (addApplyDifferent!331 lt!405558 lt!405562 (zeroValue!5227 thiss!1181) lt!405557))))

(assert (=> b!898368 (= (apply!409 (+!2590 lt!405558 (tuple2!12033 lt!405562 (zeroValue!5227 thiss!1181))) lt!405557) (apply!409 lt!405558 lt!405557))))

(declare-fun lt!405554 () Unit!30534)

(assert (=> b!898368 (= lt!405554 lt!405552)))

(declare-fun lt!405571 () ListLongMap!10729)

(assert (=> b!898368 (= lt!405571 (getCurrentListMapNoExtraKeys!3277 (_keys!10181 thiss!1181) (_values!5414 thiss!1181) (mask!26132 thiss!1181) (extraKeys!5123 thiss!1181) (zeroValue!5227 thiss!1181) (minValue!5227 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5408 thiss!1181)))))

(declare-fun lt!405560 () (_ BitVec 64))

(assert (=> b!898368 (= lt!405560 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!405556 () (_ BitVec 64))

(assert (=> b!898368 (= lt!405556 (select (arr!25335 (_keys!10181 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!898368 (= lt!405551 (addApplyDifferent!331 lt!405571 lt!405560 (minValue!5227 thiss!1181) lt!405556))))

(assert (=> b!898368 (= (apply!409 (+!2590 lt!405571 (tuple2!12033 lt!405560 (minValue!5227 thiss!1181))) lt!405556) (apply!409 lt!405571 lt!405556))))

(declare-fun b!898369 () Bool)

(declare-fun Unit!30536 () Unit!30534)

(assert (=> b!898369 (= e!502526 Unit!30536)))

(declare-fun bm!39848 () Bool)

(declare-fun call!39852 () Bool)

(assert (=> bm!39848 (= call!39852 (contains!4409 lt!405569 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!898370 () Bool)

(declare-fun e!502520 () Bool)

(assert (=> b!898370 (= e!502520 (= (apply!409 lt!405569 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!5227 thiss!1181)))))

(declare-fun b!898371 () Bool)

(declare-fun e!502527 () Bool)

(declare-fun e!502530 () Bool)

(assert (=> b!898371 (= e!502527 e!502530)))

(declare-fun res!607119 () Bool)

(declare-fun call!39851 () Bool)

(assert (=> b!898371 (= res!607119 call!39851)))

(assert (=> b!898371 (=> (not res!607119) (not e!502530))))

(declare-fun b!898372 () Bool)

(declare-fun res!607120 () Bool)

(assert (=> b!898372 (=> (not res!607120) (not e!502531))))

(assert (=> b!898372 (= res!607120 e!502527)))

(declare-fun c!94937 () Bool)

(assert (=> b!898372 (= c!94937 (not (= (bvand (extraKeys!5123 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!898373 () Bool)

(assert (=> b!898373 (= e!502530 (= (apply!409 lt!405569 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!5227 thiss!1181)))))

(declare-fun b!898374 () Bool)

(declare-fun e!502523 () Bool)

(assert (=> b!898374 (= e!502531 e!502523)))

(declare-fun c!94935 () Bool)

(assert (=> b!898374 (= c!94935 (not (= (bvand (extraKeys!5123 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!898375 () Bool)

(declare-fun e!502525 () Bool)

(declare-fun get!13319 (ValueCell!8688 V!29417) V!29417)

(declare-fun dynLambda!1303 (Int (_ BitVec 64)) V!29417)

(assert (=> b!898375 (= e!502525 (= (apply!409 lt!405569 (select (arr!25335 (_keys!10181 thiss!1181)) #b00000000000000000000000000000000)) (get!13319 (select (arr!25336 (_values!5414 thiss!1181)) #b00000000000000000000000000000000) (dynLambda!1303 (defaultEntry!5408 thiss!1181) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!898375 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25791 (_values!5414 thiss!1181))))))

(assert (=> b!898375 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25790 (_keys!10181 thiss!1181))))))

(declare-fun bm!39849 () Bool)

(declare-fun call!39853 () ListLongMap!10729)

(assert (=> bm!39849 (= call!39853 call!39856)))

(declare-fun b!898376 () Bool)

(assert (=> b!898376 (= e!502527 (not call!39851))))

(declare-fun b!898377 () Bool)

(declare-fun e!502528 () Bool)

(assert (=> b!898377 (= e!502528 e!502525)))

(declare-fun res!607123 () Bool)

(assert (=> b!898377 (=> (not res!607123) (not e!502525))))

(assert (=> b!898377 (= res!607123 (contains!4409 lt!405569 (select (arr!25335 (_keys!10181 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (=> b!898377 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25790 (_keys!10181 thiss!1181))))))

(declare-fun b!898378 () Bool)

(assert (=> b!898378 (= e!502523 e!502520)))

(declare-fun res!607122 () Bool)

(assert (=> b!898378 (= res!607122 call!39852)))

(assert (=> b!898378 (=> (not res!607122) (not e!502520))))

(declare-fun bm!39850 () Bool)

(declare-fun call!39850 () ListLongMap!10729)

(assert (=> bm!39850 (= call!39850 call!39853)))

(declare-fun b!898379 () Bool)

(declare-fun e!502529 () Bool)

(assert (=> b!898379 (= e!502529 (validKeyInArray!0 (select (arr!25335 (_keys!10181 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun c!94940 () Bool)

(declare-fun bm!39851 () Bool)

(assert (=> bm!39851 (= call!39854 (+!2590 (ite c!94939 call!39856 (ite c!94940 call!39853 call!39850)) (ite (or c!94939 c!94940) (tuple2!12033 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5227 thiss!1181)) (tuple2!12033 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5227 thiss!1181)))))))

(declare-fun b!898380 () Bool)

(declare-fun res!607124 () Bool)

(assert (=> b!898380 (=> (not res!607124) (not e!502531))))

(assert (=> b!898380 (= res!607124 e!502528)))

(declare-fun res!607125 () Bool)

(assert (=> b!898380 (=> res!607125 e!502528)))

(assert (=> b!898380 (= res!607125 (not e!502529))))

(declare-fun res!607121 () Bool)

(assert (=> b!898380 (=> (not res!607121) (not e!502529))))

(assert (=> b!898380 (= res!607121 (bvslt #b00000000000000000000000000000000 (size!25790 (_keys!10181 thiss!1181))))))

(declare-fun bm!39852 () Bool)

(declare-fun call!39855 () ListLongMap!10729)

(assert (=> bm!39852 (= call!39855 call!39854)))

(declare-fun bm!39853 () Bool)

(assert (=> bm!39853 (= call!39851 (contains!4409 lt!405569 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!898381 () Bool)

(assert (=> b!898381 (= e!502522 call!39855)))

(declare-fun b!898382 () Bool)

(assert (=> b!898382 (= e!502524 call!39850)))

(declare-fun b!898383 () Bool)

(assert (=> b!898383 (= e!502524 call!39855)))

(declare-fun b!898384 () Bool)

(assert (=> b!898384 (= e!502523 (not call!39852))))

(declare-fun b!898385 () Bool)

(assert (=> b!898385 (= e!502521 e!502522)))

(assert (=> b!898385 (= c!94940 (and (not (= (bvand (extraKeys!5123 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5123 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and d!111225 c!94939) b!898366))

(assert (= (and d!111225 (not c!94939)) b!898385))

(assert (= (and b!898385 c!94940) b!898381))

(assert (= (and b!898385 (not c!94940)) b!898367))

(assert (= (and b!898367 c!94936) b!898383))

(assert (= (and b!898367 (not c!94936)) b!898382))

(assert (= (or b!898383 b!898382) bm!39850))

(assert (= (or b!898381 bm!39850) bm!39849))

(assert (= (or b!898381 b!898383) bm!39852))

(assert (= (or b!898366 bm!39849) bm!39847))

(assert (= (or b!898366 bm!39852) bm!39851))

(assert (= (and d!111225 res!607117) b!898365))

(assert (= (and d!111225 c!94938) b!898368))

(assert (= (and d!111225 (not c!94938)) b!898369))

(assert (= (and d!111225 res!607118) b!898380))

(assert (= (and b!898380 res!607121) b!898379))

(assert (= (and b!898380 (not res!607125)) b!898377))

(assert (= (and b!898377 res!607123) b!898375))

(assert (= (and b!898380 res!607124) b!898372))

(assert (= (and b!898372 c!94937) b!898371))

(assert (= (and b!898372 (not c!94937)) b!898376))

(assert (= (and b!898371 res!607119) b!898373))

(assert (= (or b!898371 b!898376) bm!39853))

(assert (= (and b!898372 res!607120) b!898374))

(assert (= (and b!898374 c!94935) b!898378))

(assert (= (and b!898374 (not c!94935)) b!898384))

(assert (= (and b!898378 res!607122) b!898370))

(assert (= (or b!898378 b!898384) bm!39848))

(declare-fun b_lambda!12959 () Bool)

(assert (=> (not b_lambda!12959) (not b!898375)))

(declare-fun t!25179 () Bool)

(declare-fun tb!5191 () Bool)

(assert (=> (and b!898263 (= (defaultEntry!5408 thiss!1181) (defaultEntry!5408 thiss!1181)) t!25179) tb!5191))

(declare-fun result!10145 () Bool)

(assert (=> tb!5191 (= result!10145 tp_is_empty!18339)))

(assert (=> b!898375 t!25179))

(declare-fun b_and!26307 () Bool)

(assert (= b_and!26303 (and (=> t!25179 result!10145) b_and!26307)))

(declare-fun m!834855 () Bool)

(assert (=> bm!39853 m!834855))

(declare-fun m!834857 () Bool)

(assert (=> b!898373 m!834857))

(declare-fun m!834859 () Bool)

(assert (=> b!898375 m!834859))

(declare-fun m!834861 () Bool)

(assert (=> b!898375 m!834861))

(declare-fun m!834863 () Bool)

(assert (=> b!898375 m!834863))

(assert (=> b!898375 m!834861))

(assert (=> b!898375 m!834859))

(assert (=> b!898375 m!834847))

(declare-fun m!834865 () Bool)

(assert (=> b!898375 m!834865))

(assert (=> b!898375 m!834847))

(declare-fun m!834867 () Bool)

(assert (=> b!898370 m!834867))

(declare-fun m!834869 () Bool)

(assert (=> bm!39848 m!834869))

(declare-fun m!834871 () Bool)

(assert (=> b!898366 m!834871))

(declare-fun m!834873 () Bool)

(assert (=> b!898368 m!834873))

(declare-fun m!834875 () Bool)

(assert (=> b!898368 m!834875))

(declare-fun m!834877 () Bool)

(assert (=> b!898368 m!834877))

(declare-fun m!834879 () Bool)

(assert (=> b!898368 m!834879))

(assert (=> b!898368 m!834847))

(declare-fun m!834881 () Bool)

(assert (=> b!898368 m!834881))

(declare-fun m!834883 () Bool)

(assert (=> b!898368 m!834883))

(assert (=> b!898368 m!834881))

(declare-fun m!834885 () Bool)

(assert (=> b!898368 m!834885))

(declare-fun m!834887 () Bool)

(assert (=> b!898368 m!834887))

(declare-fun m!834889 () Bool)

(assert (=> b!898368 m!834889))

(declare-fun m!834891 () Bool)

(assert (=> b!898368 m!834891))

(declare-fun m!834893 () Bool)

(assert (=> b!898368 m!834893))

(declare-fun m!834895 () Bool)

(assert (=> b!898368 m!834895))

(declare-fun m!834897 () Bool)

(assert (=> b!898368 m!834897))

(assert (=> b!898368 m!834887))

(assert (=> b!898368 m!834877))

(declare-fun m!834899 () Bool)

(assert (=> b!898368 m!834899))

(assert (=> b!898368 m!834893))

(declare-fun m!834901 () Bool)

(assert (=> b!898368 m!834901))

(declare-fun m!834903 () Bool)

(assert (=> b!898368 m!834903))

(assert (=> d!111225 m!834791))

(assert (=> bm!39847 m!834897))

(declare-fun m!834905 () Bool)

(assert (=> bm!39851 m!834905))

(assert (=> b!898365 m!834847))

(assert (=> b!898365 m!834847))

(declare-fun m!834907 () Bool)

(assert (=> b!898365 m!834907))

(assert (=> b!898379 m!834847))

(assert (=> b!898379 m!834847))

(assert (=> b!898379 m!834907))

(assert (=> b!898377 m!834847))

(assert (=> b!898377 m!834847))

(declare-fun m!834909 () Bool)

(assert (=> b!898377 m!834909))

(assert (=> b!898268 d!111225))

(declare-fun d!111227 () Bool)

(declare-fun e!502537 () Bool)

(assert (=> d!111227 e!502537))

(declare-fun res!607128 () Bool)

(assert (=> d!111227 (=> res!607128 e!502537)))

(declare-fun lt!405580 () Bool)

(assert (=> d!111227 (= res!607128 (not lt!405580))))

(declare-fun lt!405582 () Bool)

(assert (=> d!111227 (= lt!405580 lt!405582)))

(declare-fun lt!405583 () Unit!30534)

(declare-fun e!502538 () Unit!30534)

(assert (=> d!111227 (= lt!405583 e!502538)))

(declare-fun c!94943 () Bool)

(assert (=> d!111227 (= c!94943 lt!405582)))

(declare-fun containsKey!424 (List!17838 (_ BitVec 64)) Bool)

(assert (=> d!111227 (= lt!405582 (containsKey!424 (toList!5380 (getCurrentListMap!2654 (_keys!10181 thiss!1181) (_values!5414 thiss!1181) (mask!26132 thiss!1181) (extraKeys!5123 thiss!1181) (zeroValue!5227 thiss!1181) (minValue!5227 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5408 thiss!1181))) (select (arr!25335 (_keys!10181 thiss!1181)) (index!38064 lt!405466))))))

(assert (=> d!111227 (= (contains!4409 (getCurrentListMap!2654 (_keys!10181 thiss!1181) (_values!5414 thiss!1181) (mask!26132 thiss!1181) (extraKeys!5123 thiss!1181) (zeroValue!5227 thiss!1181) (minValue!5227 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5408 thiss!1181)) (select (arr!25335 (_keys!10181 thiss!1181)) (index!38064 lt!405466))) lt!405580)))

(declare-fun b!898394 () Bool)

(declare-fun lt!405581 () Unit!30534)

(assert (=> b!898394 (= e!502538 lt!405581)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!320 (List!17838 (_ BitVec 64)) Unit!30534)

(assert (=> b!898394 (= lt!405581 (lemmaContainsKeyImpliesGetValueByKeyDefined!320 (toList!5380 (getCurrentListMap!2654 (_keys!10181 thiss!1181) (_values!5414 thiss!1181) (mask!26132 thiss!1181) (extraKeys!5123 thiss!1181) (zeroValue!5227 thiss!1181) (minValue!5227 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5408 thiss!1181))) (select (arr!25335 (_keys!10181 thiss!1181)) (index!38064 lt!405466))))))

(declare-datatypes ((Option!461 0))(
  ( (Some!460 (v!11712 V!29417)) (None!459) )
))
(declare-fun isDefined!329 (Option!461) Bool)

(declare-fun getValueByKey!455 (List!17838 (_ BitVec 64)) Option!461)

(assert (=> b!898394 (isDefined!329 (getValueByKey!455 (toList!5380 (getCurrentListMap!2654 (_keys!10181 thiss!1181) (_values!5414 thiss!1181) (mask!26132 thiss!1181) (extraKeys!5123 thiss!1181) (zeroValue!5227 thiss!1181) (minValue!5227 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5408 thiss!1181))) (select (arr!25335 (_keys!10181 thiss!1181)) (index!38064 lt!405466))))))

(declare-fun b!898395 () Bool)

(declare-fun Unit!30537 () Unit!30534)

(assert (=> b!898395 (= e!502538 Unit!30537)))

(declare-fun b!898396 () Bool)

(assert (=> b!898396 (= e!502537 (isDefined!329 (getValueByKey!455 (toList!5380 (getCurrentListMap!2654 (_keys!10181 thiss!1181) (_values!5414 thiss!1181) (mask!26132 thiss!1181) (extraKeys!5123 thiss!1181) (zeroValue!5227 thiss!1181) (minValue!5227 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5408 thiss!1181))) (select (arr!25335 (_keys!10181 thiss!1181)) (index!38064 lt!405466)))))))

(assert (= (and d!111227 c!94943) b!898394))

(assert (= (and d!111227 (not c!94943)) b!898395))

(assert (= (and d!111227 (not res!607128)) b!898396))

(assert (=> d!111227 m!834797))

(declare-fun m!834911 () Bool)

(assert (=> d!111227 m!834911))

(assert (=> b!898394 m!834797))

(declare-fun m!834913 () Bool)

(assert (=> b!898394 m!834913))

(assert (=> b!898394 m!834797))

(declare-fun m!834915 () Bool)

(assert (=> b!898394 m!834915))

(assert (=> b!898394 m!834915))

(declare-fun m!834917 () Bool)

(assert (=> b!898394 m!834917))

(assert (=> b!898396 m!834797))

(assert (=> b!898396 m!834915))

(assert (=> b!898396 m!834915))

(assert (=> b!898396 m!834917))

(assert (=> b!898268 d!111227))

(declare-fun d!111229 () Bool)

(assert (=> d!111229 (= (inRange!0 (index!38064 lt!405466) (mask!26132 thiss!1181)) (and (bvsge (index!38064 lt!405466) #b00000000000000000000000000000000) (bvslt (index!38064 lt!405466) (bvadd (mask!26132 thiss!1181) #b00000000000000000000000000000001))))))

(assert (=> b!898266 d!111229))

(declare-fun d!111231 () Bool)

(declare-fun res!607135 () Bool)

(declare-fun e!502541 () Bool)

(assert (=> d!111231 (=> (not res!607135) (not e!502541))))

(declare-fun simpleValid!323 (LongMapFixedSize!4392) Bool)

(assert (=> d!111231 (= res!607135 (simpleValid!323 thiss!1181))))

(assert (=> d!111231 (= (valid!1690 thiss!1181) e!502541)))

(declare-fun b!898403 () Bool)

(declare-fun res!607136 () Bool)

(assert (=> b!898403 (=> (not res!607136) (not e!502541))))

(declare-fun arrayCountValidKeys!0 (array!52714 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!898403 (= res!607136 (= (arrayCountValidKeys!0 (_keys!10181 thiss!1181) #b00000000000000000000000000000000 (size!25790 (_keys!10181 thiss!1181))) (_size!2251 thiss!1181)))))

(declare-fun b!898404 () Bool)

(declare-fun res!607137 () Bool)

(assert (=> b!898404 (=> (not res!607137) (not e!502541))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52714 (_ BitVec 32)) Bool)

(assert (=> b!898404 (= res!607137 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10181 thiss!1181) (mask!26132 thiss!1181)))))

(declare-fun b!898405 () Bool)

(declare-datatypes ((List!17839 0))(
  ( (Nil!17836) (Cons!17835 (h!18977 (_ BitVec 64)) (t!25180 List!17839)) )
))
(declare-fun arrayNoDuplicates!0 (array!52714 (_ BitVec 32) List!17839) Bool)

(assert (=> b!898405 (= e!502541 (arrayNoDuplicates!0 (_keys!10181 thiss!1181) #b00000000000000000000000000000000 Nil!17836))))

(assert (= (and d!111231 res!607135) b!898403))

(assert (= (and b!898403 res!607136) b!898404))

(assert (= (and b!898404 res!607137) b!898405))

(declare-fun m!834919 () Bool)

(assert (=> d!111231 m!834919))

(declare-fun m!834921 () Bool)

(assert (=> b!898403 m!834921))

(declare-fun m!834923 () Bool)

(assert (=> b!898404 m!834923))

(declare-fun m!834925 () Bool)

(assert (=> b!898405 m!834925))

(assert (=> start!76776 d!111231))

(declare-fun d!111233 () Bool)

(assert (=> d!111233 (= (array_inv!19884 (_keys!10181 thiss!1181)) (bvsge (size!25790 (_keys!10181 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!898263 d!111233))

(declare-fun d!111235 () Bool)

(assert (=> d!111235 (= (array_inv!19885 (_values!5414 thiss!1181)) (bvsge (size!25791 (_values!5414 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!898263 d!111235))

(declare-fun condMapEmpty!29166 () Bool)

(declare-fun mapDefault!29166 () ValueCell!8688)

(assert (=> mapNonEmpty!29160 (= condMapEmpty!29166 (= mapRest!29160 ((as const (Array (_ BitVec 32) ValueCell!8688)) mapDefault!29166)))))

(declare-fun e!502546 () Bool)

(declare-fun mapRes!29166 () Bool)

(assert (=> mapNonEmpty!29160 (= tp!56099 (and e!502546 mapRes!29166))))

(declare-fun mapIsEmpty!29166 () Bool)

(assert (=> mapIsEmpty!29166 mapRes!29166))

(declare-fun mapNonEmpty!29166 () Bool)

(declare-fun tp!56108 () Bool)

(declare-fun e!502547 () Bool)

(assert (=> mapNonEmpty!29166 (= mapRes!29166 (and tp!56108 e!502547))))

(declare-fun mapRest!29166 () (Array (_ BitVec 32) ValueCell!8688))

(declare-fun mapKey!29166 () (_ BitVec 32))

(declare-fun mapValue!29166 () ValueCell!8688)

(assert (=> mapNonEmpty!29166 (= mapRest!29160 (store mapRest!29166 mapKey!29166 mapValue!29166))))

(declare-fun b!898413 () Bool)

(assert (=> b!898413 (= e!502546 tp_is_empty!18339)))

(declare-fun b!898412 () Bool)

(assert (=> b!898412 (= e!502547 tp_is_empty!18339)))

(assert (= (and mapNonEmpty!29160 condMapEmpty!29166) mapIsEmpty!29166))

(assert (= (and mapNonEmpty!29160 (not condMapEmpty!29166)) mapNonEmpty!29166))

(assert (= (and mapNonEmpty!29166 ((_ is ValueCellFull!8688) mapValue!29166)) b!898412))

(assert (= (and mapNonEmpty!29160 ((_ is ValueCellFull!8688) mapDefault!29166)) b!898413))

(declare-fun m!834927 () Bool)

(assert (=> mapNonEmpty!29166 m!834927))

(declare-fun b_lambda!12961 () Bool)

(assert (= b_lambda!12959 (or (and b!898263 b_free!16011) b_lambda!12961)))

(check-sat tp_is_empty!18339 (not b!898377) (not bm!39848) (not b!898394) (not bm!39847) (not b!898295) (not b!898375) (not b!898365) (not b!898379) (not b!898366) (not d!111225) (not d!111227) (not b!898404) (not d!111231) (not b!898403) (not b!898370) (not mapNonEmpty!29166) (not b!898319) (not b!898405) b_and!26307 (not d!111221) (not b!898373) (not d!111219) (not b!898322) (not b!898312) (not bm!39851) (not d!111215) (not b!898396) (not d!111213) (not b_next!16011) (not b!898368) (not b_lambda!12961) (not bm!39853))
(check-sat b_and!26307 (not b_next!16011))
