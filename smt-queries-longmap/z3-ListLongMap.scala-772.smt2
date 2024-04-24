; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!18200 () Bool)

(assert start!18200)

(declare-fun b!181042 () Bool)

(declare-fun b_free!4471 () Bool)

(declare-fun b_next!4471 () Bool)

(assert (=> b!181042 (= b_free!4471 (not b_next!4471))))

(declare-fun tp!16157 () Bool)

(declare-fun b_and!11027 () Bool)

(assert (=> b!181042 (= tp!16157 b_and!11027)))

(declare-fun mapNonEmpty!7271 () Bool)

(declare-fun mapRes!7271 () Bool)

(declare-fun tp!16156 () Bool)

(declare-fun e!119245 () Bool)

(assert (=> mapNonEmpty!7271 (= mapRes!7271 (and tp!16156 e!119245))))

(declare-datatypes ((V!5305 0))(
  ( (V!5306 (val!2166 Int)) )
))
(declare-datatypes ((ValueCell!1778 0))(
  ( (ValueCellFull!1778 (v!4062 V!5305)) (EmptyCell!1778) )
))
(declare-fun mapValue!7271 () ValueCell!1778)

(declare-fun mapRest!7271 () (Array (_ BitVec 32) ValueCell!1778))

(declare-datatypes ((array!7649 0))(
  ( (array!7650 (arr!3620 (Array (_ BitVec 32) (_ BitVec 64))) (size!3929 (_ BitVec 32))) )
))
(declare-datatypes ((array!7651 0))(
  ( (array!7652 (arr!3621 (Array (_ BitVec 32) ValueCell!1778)) (size!3930 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2464 0))(
  ( (LongMapFixedSize!2465 (defaultEntry!3711 Int) (mask!8724 (_ BitVec 32)) (extraKeys!3448 (_ BitVec 32)) (zeroValue!3552 V!5305) (minValue!3552 V!5305) (_size!1281 (_ BitVec 32)) (_keys!5609 array!7649) (_values!3694 array!7651) (_vacant!1281 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2464)

(declare-fun mapKey!7271 () (_ BitVec 32))

(assert (=> mapNonEmpty!7271 (= (arr!3621 (_values!3694 thiss!1248)) (store mapRest!7271 mapKey!7271 mapValue!7271))))

(declare-fun b!181039 () Bool)

(declare-fun res!85726 () Bool)

(declare-fun e!119240 () Bool)

(assert (=> b!181039 (=> (not res!85726) (not e!119240))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!181039 (= res!85726 (validMask!0 (mask!8724 thiss!1248)))))

(declare-fun res!85728 () Bool)

(declare-fun e!119246 () Bool)

(assert (=> start!18200 (=> (not res!85728) (not e!119246))))

(declare-fun valid!1047 (LongMapFixedSize!2464) Bool)

(assert (=> start!18200 (= res!85728 (valid!1047 thiss!1248))))

(assert (=> start!18200 e!119246))

(declare-fun e!119243 () Bool)

(assert (=> start!18200 e!119243))

(assert (=> start!18200 true))

(declare-fun b!181040 () Bool)

(declare-fun tp_is_empty!4243 () Bool)

(assert (=> b!181040 (= e!119245 tp_is_empty!4243)))

(declare-fun b!181041 () Bool)

(declare-fun res!85725 () Bool)

(assert (=> b!181041 (=> (not res!85725) (not e!119240))))

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((tuple2!3328 0))(
  ( (tuple2!3329 (_1!1675 (_ BitVec 64)) (_2!1675 V!5305)) )
))
(declare-datatypes ((List!2272 0))(
  ( (Nil!2269) (Cons!2268 (h!2894 tuple2!3328) (t!7116 List!2272)) )
))
(declare-datatypes ((ListLongMap!2249 0))(
  ( (ListLongMap!2250 (toList!1140 List!2272)) )
))
(declare-fun contains!1230 (ListLongMap!2249 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!792 (array!7649 array!7651 (_ BitVec 32) (_ BitVec 32) V!5305 V!5305 (_ BitVec 32) Int) ListLongMap!2249)

(assert (=> b!181041 (= res!85725 (contains!1230 (getCurrentListMap!792 (_keys!5609 thiss!1248) (_values!3694 thiss!1248) (mask!8724 thiss!1248) (extraKeys!3448 thiss!1248) (zeroValue!3552 thiss!1248) (minValue!3552 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3711 thiss!1248)) key!828))))

(declare-fun e!119241 () Bool)

(declare-fun array_inv!2337 (array!7649) Bool)

(declare-fun array_inv!2338 (array!7651) Bool)

(assert (=> b!181042 (= e!119243 (and tp!16157 tp_is_empty!4243 (array_inv!2337 (_keys!5609 thiss!1248)) (array_inv!2338 (_values!3694 thiss!1248)) e!119241))))

(declare-fun b!181043 () Bool)

(declare-fun e!119244 () Bool)

(assert (=> b!181043 (= e!119244 tp_is_empty!4243)))

(declare-fun b!181044 () Bool)

(assert (=> b!181044 (= e!119240 (and (= (size!3930 (_values!3694 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8724 thiss!1248))) (not (= (size!3929 (_keys!5609 thiss!1248)) (size!3930 (_values!3694 thiss!1248))))))))

(declare-fun b!181045 () Bool)

(assert (=> b!181045 (= e!119241 (and e!119244 mapRes!7271))))

(declare-fun condMapEmpty!7271 () Bool)

(declare-fun mapDefault!7271 () ValueCell!1778)

(assert (=> b!181045 (= condMapEmpty!7271 (= (arr!3621 (_values!3694 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1778)) mapDefault!7271)))))

(declare-fun mapIsEmpty!7271 () Bool)

(assert (=> mapIsEmpty!7271 mapRes!7271))

(declare-fun b!181046 () Bool)

(declare-fun res!85727 () Bool)

(assert (=> b!181046 (=> (not res!85727) (not e!119246))))

(assert (=> b!181046 (= res!85727 (not (= key!828 (bvneg key!828))))))

(declare-fun b!181047 () Bool)

(assert (=> b!181047 (= e!119246 e!119240)))

(declare-fun res!85724 () Bool)

(assert (=> b!181047 (=> (not res!85724) (not e!119240))))

(declare-datatypes ((SeekEntryResult!591 0))(
  ( (MissingZero!591 (index!4534 (_ BitVec 32))) (Found!591 (index!4535 (_ BitVec 32))) (Intermediate!591 (undefined!1403 Bool) (index!4536 (_ BitVec 32)) (x!19769 (_ BitVec 32))) (Undefined!591) (MissingVacant!591 (index!4537 (_ BitVec 32))) )
))
(declare-fun lt!89535 () SeekEntryResult!591)

(get-info :version)

(assert (=> b!181047 (= res!85724 (and (not ((_ is Undefined!591) lt!89535)) (not ((_ is MissingVacant!591) lt!89535)) (not ((_ is MissingZero!591) lt!89535)) ((_ is Found!591) lt!89535)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7649 (_ BitVec 32)) SeekEntryResult!591)

(assert (=> b!181047 (= lt!89535 (seekEntryOrOpen!0 key!828 (_keys!5609 thiss!1248) (mask!8724 thiss!1248)))))

(assert (= (and start!18200 res!85728) b!181046))

(assert (= (and b!181046 res!85727) b!181047))

(assert (= (and b!181047 res!85724) b!181041))

(assert (= (and b!181041 res!85725) b!181039))

(assert (= (and b!181039 res!85726) b!181044))

(assert (= (and b!181045 condMapEmpty!7271) mapIsEmpty!7271))

(assert (= (and b!181045 (not condMapEmpty!7271)) mapNonEmpty!7271))

(assert (= (and mapNonEmpty!7271 ((_ is ValueCellFull!1778) mapValue!7271)) b!181040))

(assert (= (and b!181045 ((_ is ValueCellFull!1778) mapDefault!7271)) b!181043))

(assert (= b!181042 b!181045))

(assert (= start!18200 b!181042))

(declare-fun m!209137 () Bool)

(assert (=> b!181047 m!209137))

(declare-fun m!209139 () Bool)

(assert (=> b!181039 m!209139))

(declare-fun m!209141 () Bool)

(assert (=> b!181042 m!209141))

(declare-fun m!209143 () Bool)

(assert (=> b!181042 m!209143))

(declare-fun m!209145 () Bool)

(assert (=> b!181041 m!209145))

(assert (=> b!181041 m!209145))

(declare-fun m!209147 () Bool)

(assert (=> b!181041 m!209147))

(declare-fun m!209149 () Bool)

(assert (=> start!18200 m!209149))

(declare-fun m!209151 () Bool)

(assert (=> mapNonEmpty!7271 m!209151))

(check-sat (not b!181041) (not b!181039) (not b!181047) (not b!181042) (not start!18200) b_and!11027 (not b_next!4471) (not mapNonEmpty!7271) tp_is_empty!4243)
(check-sat b_and!11027 (not b_next!4471))
(get-model)

(declare-fun d!54413 () Bool)

(assert (=> d!54413 (= (validMask!0 (mask!8724 thiss!1248)) (and (or (= (mask!8724 thiss!1248) #b00000000000000000000000000000111) (= (mask!8724 thiss!1248) #b00000000000000000000000000001111) (= (mask!8724 thiss!1248) #b00000000000000000000000000011111) (= (mask!8724 thiss!1248) #b00000000000000000000000000111111) (= (mask!8724 thiss!1248) #b00000000000000000000000001111111) (= (mask!8724 thiss!1248) #b00000000000000000000000011111111) (= (mask!8724 thiss!1248) #b00000000000000000000000111111111) (= (mask!8724 thiss!1248) #b00000000000000000000001111111111) (= (mask!8724 thiss!1248) #b00000000000000000000011111111111) (= (mask!8724 thiss!1248) #b00000000000000000000111111111111) (= (mask!8724 thiss!1248) #b00000000000000000001111111111111) (= (mask!8724 thiss!1248) #b00000000000000000011111111111111) (= (mask!8724 thiss!1248) #b00000000000000000111111111111111) (= (mask!8724 thiss!1248) #b00000000000000001111111111111111) (= (mask!8724 thiss!1248) #b00000000000000011111111111111111) (= (mask!8724 thiss!1248) #b00000000000000111111111111111111) (= (mask!8724 thiss!1248) #b00000000000001111111111111111111) (= (mask!8724 thiss!1248) #b00000000000011111111111111111111) (= (mask!8724 thiss!1248) #b00000000000111111111111111111111) (= (mask!8724 thiss!1248) #b00000000001111111111111111111111) (= (mask!8724 thiss!1248) #b00000000011111111111111111111111) (= (mask!8724 thiss!1248) #b00000000111111111111111111111111) (= (mask!8724 thiss!1248) #b00000001111111111111111111111111) (= (mask!8724 thiss!1248) #b00000011111111111111111111111111) (= (mask!8724 thiss!1248) #b00000111111111111111111111111111) (= (mask!8724 thiss!1248) #b00001111111111111111111111111111) (= (mask!8724 thiss!1248) #b00011111111111111111111111111111) (= (mask!8724 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!8724 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!181039 d!54413))

(declare-fun d!54415 () Bool)

(assert (=> d!54415 (= (array_inv!2337 (_keys!5609 thiss!1248)) (bvsge (size!3929 (_keys!5609 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!181042 d!54415))

(declare-fun d!54417 () Bool)

(assert (=> d!54417 (= (array_inv!2338 (_values!3694 thiss!1248)) (bvsge (size!3930 (_values!3694 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!181042 d!54417))

(declare-fun b!181114 () Bool)

(declare-fun e!119296 () SeekEntryResult!591)

(declare-fun lt!89550 () SeekEntryResult!591)

(assert (=> b!181114 (= e!119296 (Found!591 (index!4536 lt!89550)))))

(declare-fun b!181115 () Bool)

(declare-fun c!32449 () Bool)

(declare-fun lt!89549 () (_ BitVec 64))

(assert (=> b!181115 (= c!32449 (= lt!89549 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!119297 () SeekEntryResult!591)

(assert (=> b!181115 (= e!119296 e!119297)))

(declare-fun b!181116 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7649 (_ BitVec 32)) SeekEntryResult!591)

(assert (=> b!181116 (= e!119297 (seekKeyOrZeroReturnVacant!0 (x!19769 lt!89550) (index!4536 lt!89550) (index!4536 lt!89550) key!828 (_keys!5609 thiss!1248) (mask!8724 thiss!1248)))))

(declare-fun b!181117 () Bool)

(declare-fun e!119295 () SeekEntryResult!591)

(assert (=> b!181117 (= e!119295 e!119296)))

(assert (=> b!181117 (= lt!89549 (select (arr!3620 (_keys!5609 thiss!1248)) (index!4536 lt!89550)))))

(declare-fun c!32448 () Bool)

(assert (=> b!181117 (= c!32448 (= lt!89549 key!828))))

(declare-fun b!181118 () Bool)

(assert (=> b!181118 (= e!119297 (MissingZero!591 (index!4536 lt!89550)))))

(declare-fun b!181119 () Bool)

(assert (=> b!181119 (= e!119295 Undefined!591)))

(declare-fun d!54419 () Bool)

(declare-fun lt!89548 () SeekEntryResult!591)

(assert (=> d!54419 (and (or ((_ is Undefined!591) lt!89548) (not ((_ is Found!591) lt!89548)) (and (bvsge (index!4535 lt!89548) #b00000000000000000000000000000000) (bvslt (index!4535 lt!89548) (size!3929 (_keys!5609 thiss!1248))))) (or ((_ is Undefined!591) lt!89548) ((_ is Found!591) lt!89548) (not ((_ is MissingZero!591) lt!89548)) (and (bvsge (index!4534 lt!89548) #b00000000000000000000000000000000) (bvslt (index!4534 lt!89548) (size!3929 (_keys!5609 thiss!1248))))) (or ((_ is Undefined!591) lt!89548) ((_ is Found!591) lt!89548) ((_ is MissingZero!591) lt!89548) (not ((_ is MissingVacant!591) lt!89548)) (and (bvsge (index!4537 lt!89548) #b00000000000000000000000000000000) (bvslt (index!4537 lt!89548) (size!3929 (_keys!5609 thiss!1248))))) (or ((_ is Undefined!591) lt!89548) (ite ((_ is Found!591) lt!89548) (= (select (arr!3620 (_keys!5609 thiss!1248)) (index!4535 lt!89548)) key!828) (ite ((_ is MissingZero!591) lt!89548) (= (select (arr!3620 (_keys!5609 thiss!1248)) (index!4534 lt!89548)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!591) lt!89548) (= (select (arr!3620 (_keys!5609 thiss!1248)) (index!4537 lt!89548)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!54419 (= lt!89548 e!119295)))

(declare-fun c!32447 () Bool)

(assert (=> d!54419 (= c!32447 (and ((_ is Intermediate!591) lt!89550) (undefined!1403 lt!89550)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7649 (_ BitVec 32)) SeekEntryResult!591)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!54419 (= lt!89550 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!8724 thiss!1248)) key!828 (_keys!5609 thiss!1248) (mask!8724 thiss!1248)))))

(assert (=> d!54419 (validMask!0 (mask!8724 thiss!1248))))

(assert (=> d!54419 (= (seekEntryOrOpen!0 key!828 (_keys!5609 thiss!1248) (mask!8724 thiss!1248)) lt!89548)))

(assert (= (and d!54419 c!32447) b!181119))

(assert (= (and d!54419 (not c!32447)) b!181117))

(assert (= (and b!181117 c!32448) b!181114))

(assert (= (and b!181117 (not c!32448)) b!181115))

(assert (= (and b!181115 c!32449) b!181118))

(assert (= (and b!181115 (not c!32449)) b!181116))

(declare-fun m!209185 () Bool)

(assert (=> b!181116 m!209185))

(declare-fun m!209187 () Bool)

(assert (=> b!181117 m!209187))

(assert (=> d!54419 m!209139))

(declare-fun m!209189 () Bool)

(assert (=> d!54419 m!209189))

(declare-fun m!209191 () Bool)

(assert (=> d!54419 m!209191))

(declare-fun m!209193 () Bool)

(assert (=> d!54419 m!209193))

(declare-fun m!209195 () Bool)

(assert (=> d!54419 m!209195))

(assert (=> d!54419 m!209191))

(declare-fun m!209197 () Bool)

(assert (=> d!54419 m!209197))

(assert (=> b!181047 d!54419))

(declare-fun d!54421 () Bool)

(declare-fun res!85765 () Bool)

(declare-fun e!119300 () Bool)

(assert (=> d!54421 (=> (not res!85765) (not e!119300))))

(declare-fun simpleValid!167 (LongMapFixedSize!2464) Bool)

(assert (=> d!54421 (= res!85765 (simpleValid!167 thiss!1248))))

(assert (=> d!54421 (= (valid!1047 thiss!1248) e!119300)))

(declare-fun b!181126 () Bool)

(declare-fun res!85766 () Bool)

(assert (=> b!181126 (=> (not res!85766) (not e!119300))))

(declare-fun arrayCountValidKeys!0 (array!7649 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!181126 (= res!85766 (= (arrayCountValidKeys!0 (_keys!5609 thiss!1248) #b00000000000000000000000000000000 (size!3929 (_keys!5609 thiss!1248))) (_size!1281 thiss!1248)))))

(declare-fun b!181127 () Bool)

(declare-fun res!85767 () Bool)

(assert (=> b!181127 (=> (not res!85767) (not e!119300))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!7649 (_ BitVec 32)) Bool)

(assert (=> b!181127 (= res!85767 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5609 thiss!1248) (mask!8724 thiss!1248)))))

(declare-fun b!181128 () Bool)

(declare-datatypes ((List!2275 0))(
  ( (Nil!2272) (Cons!2271 (h!2897 (_ BitVec 64)) (t!7121 List!2275)) )
))
(declare-fun arrayNoDuplicates!0 (array!7649 (_ BitVec 32) List!2275) Bool)

(assert (=> b!181128 (= e!119300 (arrayNoDuplicates!0 (_keys!5609 thiss!1248) #b00000000000000000000000000000000 Nil!2272))))

(assert (= (and d!54421 res!85765) b!181126))

(assert (= (and b!181126 res!85766) b!181127))

(assert (= (and b!181127 res!85767) b!181128))

(declare-fun m!209199 () Bool)

(assert (=> d!54421 m!209199))

(declare-fun m!209201 () Bool)

(assert (=> b!181126 m!209201))

(declare-fun m!209203 () Bool)

(assert (=> b!181127 m!209203))

(declare-fun m!209205 () Bool)

(assert (=> b!181128 m!209205))

(assert (=> start!18200 d!54421))

(declare-fun d!54423 () Bool)

(declare-fun e!119305 () Bool)

(assert (=> d!54423 e!119305))

(declare-fun res!85770 () Bool)

(assert (=> d!54423 (=> res!85770 e!119305)))

(declare-fun lt!89561 () Bool)

(assert (=> d!54423 (= res!85770 (not lt!89561))))

(declare-fun lt!89562 () Bool)

(assert (=> d!54423 (= lt!89561 lt!89562)))

(declare-datatypes ((Unit!5504 0))(
  ( (Unit!5505) )
))
(declare-fun lt!89560 () Unit!5504)

(declare-fun e!119306 () Unit!5504)

(assert (=> d!54423 (= lt!89560 e!119306)))

(declare-fun c!32452 () Bool)

(assert (=> d!54423 (= c!32452 lt!89562)))

(declare-fun containsKey!212 (List!2272 (_ BitVec 64)) Bool)

(assert (=> d!54423 (= lt!89562 (containsKey!212 (toList!1140 (getCurrentListMap!792 (_keys!5609 thiss!1248) (_values!3694 thiss!1248) (mask!8724 thiss!1248) (extraKeys!3448 thiss!1248) (zeroValue!3552 thiss!1248) (minValue!3552 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3711 thiss!1248))) key!828))))

(assert (=> d!54423 (= (contains!1230 (getCurrentListMap!792 (_keys!5609 thiss!1248) (_values!3694 thiss!1248) (mask!8724 thiss!1248) (extraKeys!3448 thiss!1248) (zeroValue!3552 thiss!1248) (minValue!3552 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3711 thiss!1248)) key!828) lt!89561)))

(declare-fun b!181135 () Bool)

(declare-fun lt!89559 () Unit!5504)

(assert (=> b!181135 (= e!119306 lt!89559)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!160 (List!2272 (_ BitVec 64)) Unit!5504)

(assert (=> b!181135 (= lt!89559 (lemmaContainsKeyImpliesGetValueByKeyDefined!160 (toList!1140 (getCurrentListMap!792 (_keys!5609 thiss!1248) (_values!3694 thiss!1248) (mask!8724 thiss!1248) (extraKeys!3448 thiss!1248) (zeroValue!3552 thiss!1248) (minValue!3552 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3711 thiss!1248))) key!828))))

(declare-datatypes ((Option!215 0))(
  ( (Some!214 (v!4065 V!5305)) (None!213) )
))
(declare-fun isDefined!161 (Option!215) Bool)

(declare-fun getValueByKey!209 (List!2272 (_ BitVec 64)) Option!215)

(assert (=> b!181135 (isDefined!161 (getValueByKey!209 (toList!1140 (getCurrentListMap!792 (_keys!5609 thiss!1248) (_values!3694 thiss!1248) (mask!8724 thiss!1248) (extraKeys!3448 thiss!1248) (zeroValue!3552 thiss!1248) (minValue!3552 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3711 thiss!1248))) key!828))))

(declare-fun b!181136 () Bool)

(declare-fun Unit!5506 () Unit!5504)

(assert (=> b!181136 (= e!119306 Unit!5506)))

(declare-fun b!181137 () Bool)

(assert (=> b!181137 (= e!119305 (isDefined!161 (getValueByKey!209 (toList!1140 (getCurrentListMap!792 (_keys!5609 thiss!1248) (_values!3694 thiss!1248) (mask!8724 thiss!1248) (extraKeys!3448 thiss!1248) (zeroValue!3552 thiss!1248) (minValue!3552 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3711 thiss!1248))) key!828)))))

(assert (= (and d!54423 c!32452) b!181135))

(assert (= (and d!54423 (not c!32452)) b!181136))

(assert (= (and d!54423 (not res!85770)) b!181137))

(declare-fun m!209207 () Bool)

(assert (=> d!54423 m!209207))

(declare-fun m!209209 () Bool)

(assert (=> b!181135 m!209209))

(declare-fun m!209211 () Bool)

(assert (=> b!181135 m!209211))

(assert (=> b!181135 m!209211))

(declare-fun m!209213 () Bool)

(assert (=> b!181135 m!209213))

(assert (=> b!181137 m!209211))

(assert (=> b!181137 m!209211))

(assert (=> b!181137 m!209213))

(assert (=> b!181041 d!54423))

(declare-fun b!181180 () Bool)

(declare-fun e!119337 () Bool)

(declare-fun e!119345 () Bool)

(assert (=> b!181180 (= e!119337 e!119345)))

(declare-fun c!32470 () Bool)

(assert (=> b!181180 (= c!32470 (not (= (bvand (extraKeys!3448 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!181181 () Bool)

(declare-fun e!119333 () ListLongMap!2249)

(declare-fun call!18294 () ListLongMap!2249)

(assert (=> b!181181 (= e!119333 call!18294)))

(declare-fun bm!18289 () Bool)

(declare-fun call!18297 () Bool)

(declare-fun lt!89613 () ListLongMap!2249)

(assert (=> bm!18289 (= call!18297 (contains!1230 lt!89613 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!18290 () Bool)

(declare-fun call!18293 () ListLongMap!2249)

(declare-fun call!18292 () ListLongMap!2249)

(assert (=> bm!18290 (= call!18293 call!18292)))

(declare-fun b!181182 () Bool)

(declare-fun e!119338 () Bool)

(declare-fun e!119343 () Bool)

(assert (=> b!181182 (= e!119338 e!119343)))

(declare-fun res!85797 () Bool)

(assert (=> b!181182 (=> (not res!85797) (not e!119343))))

(assert (=> b!181182 (= res!85797 (contains!1230 lt!89613 (select (arr!3620 (_keys!5609 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!181182 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3929 (_keys!5609 thiss!1248))))))

(declare-fun b!181183 () Bool)

(declare-fun e!119340 () Bool)

(declare-fun e!119342 () Bool)

(assert (=> b!181183 (= e!119340 e!119342)))

(declare-fun res!85791 () Bool)

(declare-fun call!18295 () Bool)

(assert (=> b!181183 (= res!85791 call!18295)))

(assert (=> b!181183 (=> (not res!85791) (not e!119342))))

(declare-fun c!32467 () Bool)

(declare-fun bm!18291 () Bool)

(declare-fun call!18298 () ListLongMap!2249)

(declare-fun call!18296 () ListLongMap!2249)

(declare-fun c!32468 () Bool)

(declare-fun +!271 (ListLongMap!2249 tuple2!3328) ListLongMap!2249)

(assert (=> bm!18291 (= call!18296 (+!271 (ite c!32467 call!18298 (ite c!32468 call!18292 call!18293)) (ite (or c!32467 c!32468) (tuple2!3329 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3552 thiss!1248)) (tuple2!3329 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3552 thiss!1248)))))))

(declare-fun b!181184 () Bool)

(declare-fun e!119334 () Unit!5504)

(declare-fun lt!89622 () Unit!5504)

(assert (=> b!181184 (= e!119334 lt!89622)))

(declare-fun lt!89618 () ListLongMap!2249)

(declare-fun getCurrentListMapNoExtraKeys!182 (array!7649 array!7651 (_ BitVec 32) (_ BitVec 32) V!5305 V!5305 (_ BitVec 32) Int) ListLongMap!2249)

(assert (=> b!181184 (= lt!89618 (getCurrentListMapNoExtraKeys!182 (_keys!5609 thiss!1248) (_values!3694 thiss!1248) (mask!8724 thiss!1248) (extraKeys!3448 thiss!1248) (zeroValue!3552 thiss!1248) (minValue!3552 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3711 thiss!1248)))))

(declare-fun lt!89616 () (_ BitVec 64))

(assert (=> b!181184 (= lt!89616 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!89619 () (_ BitVec 64))

(assert (=> b!181184 (= lt!89619 (select (arr!3620 (_keys!5609 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!89615 () Unit!5504)

(declare-fun addStillContains!127 (ListLongMap!2249 (_ BitVec 64) V!5305 (_ BitVec 64)) Unit!5504)

(assert (=> b!181184 (= lt!89615 (addStillContains!127 lt!89618 lt!89616 (zeroValue!3552 thiss!1248) lt!89619))))

(assert (=> b!181184 (contains!1230 (+!271 lt!89618 (tuple2!3329 lt!89616 (zeroValue!3552 thiss!1248))) lt!89619)))

(declare-fun lt!89628 () Unit!5504)

(assert (=> b!181184 (= lt!89628 lt!89615)))

(declare-fun lt!89626 () ListLongMap!2249)

(assert (=> b!181184 (= lt!89626 (getCurrentListMapNoExtraKeys!182 (_keys!5609 thiss!1248) (_values!3694 thiss!1248) (mask!8724 thiss!1248) (extraKeys!3448 thiss!1248) (zeroValue!3552 thiss!1248) (minValue!3552 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3711 thiss!1248)))))

(declare-fun lt!89610 () (_ BitVec 64))

(assert (=> b!181184 (= lt!89610 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!89609 () (_ BitVec 64))

(assert (=> b!181184 (= lt!89609 (select (arr!3620 (_keys!5609 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!89625 () Unit!5504)

(declare-fun addApplyDifferent!127 (ListLongMap!2249 (_ BitVec 64) V!5305 (_ BitVec 64)) Unit!5504)

(assert (=> b!181184 (= lt!89625 (addApplyDifferent!127 lt!89626 lt!89610 (minValue!3552 thiss!1248) lt!89609))))

(declare-fun apply!151 (ListLongMap!2249 (_ BitVec 64)) V!5305)

(assert (=> b!181184 (= (apply!151 (+!271 lt!89626 (tuple2!3329 lt!89610 (minValue!3552 thiss!1248))) lt!89609) (apply!151 lt!89626 lt!89609))))

(declare-fun lt!89620 () Unit!5504)

(assert (=> b!181184 (= lt!89620 lt!89625)))

(declare-fun lt!89611 () ListLongMap!2249)

(assert (=> b!181184 (= lt!89611 (getCurrentListMapNoExtraKeys!182 (_keys!5609 thiss!1248) (_values!3694 thiss!1248) (mask!8724 thiss!1248) (extraKeys!3448 thiss!1248) (zeroValue!3552 thiss!1248) (minValue!3552 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3711 thiss!1248)))))

(declare-fun lt!89614 () (_ BitVec 64))

(assert (=> b!181184 (= lt!89614 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!89607 () (_ BitVec 64))

(assert (=> b!181184 (= lt!89607 (select (arr!3620 (_keys!5609 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!89623 () Unit!5504)

(assert (=> b!181184 (= lt!89623 (addApplyDifferent!127 lt!89611 lt!89614 (zeroValue!3552 thiss!1248) lt!89607))))

(assert (=> b!181184 (= (apply!151 (+!271 lt!89611 (tuple2!3329 lt!89614 (zeroValue!3552 thiss!1248))) lt!89607) (apply!151 lt!89611 lt!89607))))

(declare-fun lt!89624 () Unit!5504)

(assert (=> b!181184 (= lt!89624 lt!89623)))

(declare-fun lt!89612 () ListLongMap!2249)

(assert (=> b!181184 (= lt!89612 (getCurrentListMapNoExtraKeys!182 (_keys!5609 thiss!1248) (_values!3694 thiss!1248) (mask!8724 thiss!1248) (extraKeys!3448 thiss!1248) (zeroValue!3552 thiss!1248) (minValue!3552 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3711 thiss!1248)))))

(declare-fun lt!89627 () (_ BitVec 64))

(assert (=> b!181184 (= lt!89627 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!89621 () (_ BitVec 64))

(assert (=> b!181184 (= lt!89621 (select (arr!3620 (_keys!5609 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!181184 (= lt!89622 (addApplyDifferent!127 lt!89612 lt!89627 (minValue!3552 thiss!1248) lt!89621))))

(assert (=> b!181184 (= (apply!151 (+!271 lt!89612 (tuple2!3329 lt!89627 (minValue!3552 thiss!1248))) lt!89621) (apply!151 lt!89612 lt!89621))))

(declare-fun b!181185 () Bool)

(declare-fun e!119335 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!181185 (= e!119335 (validKeyInArray!0 (select (arr!3620 (_keys!5609 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!181186 () Bool)

(declare-fun e!119344 () ListLongMap!2249)

(assert (=> b!181186 (= e!119344 call!18294)))

(declare-fun bm!18292 () Bool)

(assert (=> bm!18292 (= call!18295 (contains!1230 lt!89613 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!181187 () Bool)

(assert (=> b!181187 (= e!119342 (= (apply!151 lt!89613 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3552 thiss!1248)))))

(declare-fun b!181189 () Bool)

(declare-fun e!119336 () Bool)

(assert (=> b!181189 (= e!119336 (= (apply!151 lt!89613 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3552 thiss!1248)))))

(declare-fun b!181190 () Bool)

(declare-fun e!119339 () ListLongMap!2249)

(assert (=> b!181190 (= e!119339 (+!271 call!18296 (tuple2!3329 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3552 thiss!1248))))))

(declare-fun b!181191 () Bool)

(assert (=> b!181191 (= e!119340 (not call!18295))))

(declare-fun b!181192 () Bool)

(declare-fun get!2079 (ValueCell!1778 V!5305) V!5305)

(declare-fun dynLambda!494 (Int (_ BitVec 64)) V!5305)

(assert (=> b!181192 (= e!119343 (= (apply!151 lt!89613 (select (arr!3620 (_keys!5609 thiss!1248)) #b00000000000000000000000000000000)) (get!2079 (select (arr!3621 (_values!3694 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!494 (defaultEntry!3711 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!181192 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3930 (_values!3694 thiss!1248))))))

(assert (=> b!181192 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3929 (_keys!5609 thiss!1248))))))

(declare-fun b!181193 () Bool)

(declare-fun e!119341 () Bool)

(assert (=> b!181193 (= e!119341 (validKeyInArray!0 (select (arr!3620 (_keys!5609 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!18293 () Bool)

(assert (=> bm!18293 (= call!18298 (getCurrentListMapNoExtraKeys!182 (_keys!5609 thiss!1248) (_values!3694 thiss!1248) (mask!8724 thiss!1248) (extraKeys!3448 thiss!1248) (zeroValue!3552 thiss!1248) (minValue!3552 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3711 thiss!1248)))))

(declare-fun b!181194 () Bool)

(declare-fun res!85796 () Bool)

(assert (=> b!181194 (=> (not res!85796) (not e!119337))))

(assert (=> b!181194 (= res!85796 e!119340)))

(declare-fun c!32466 () Bool)

(assert (=> b!181194 (= c!32466 (not (= (bvand (extraKeys!3448 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!181195 () Bool)

(declare-fun c!32465 () Bool)

(assert (=> b!181195 (= c!32465 (and (not (= (bvand (extraKeys!3448 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3448 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!181195 (= e!119333 e!119344)))

(declare-fun b!181196 () Bool)

(assert (=> b!181196 (= e!119339 e!119333)))

(assert (=> b!181196 (= c!32468 (and (not (= (bvand (extraKeys!3448 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3448 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!181197 () Bool)

(assert (=> b!181197 (= e!119345 (not call!18297))))

(declare-fun bm!18294 () Bool)

(assert (=> bm!18294 (= call!18294 call!18296)))

(declare-fun b!181198 () Bool)

(declare-fun Unit!5507 () Unit!5504)

(assert (=> b!181198 (= e!119334 Unit!5507)))

(declare-fun bm!18295 () Bool)

(assert (=> bm!18295 (= call!18292 call!18298)))

(declare-fun b!181199 () Bool)

(assert (=> b!181199 (= e!119345 e!119336)))

(declare-fun res!85790 () Bool)

(assert (=> b!181199 (= res!85790 call!18297)))

(assert (=> b!181199 (=> (not res!85790) (not e!119336))))

(declare-fun b!181200 () Bool)

(declare-fun res!85795 () Bool)

(assert (=> b!181200 (=> (not res!85795) (not e!119337))))

(assert (=> b!181200 (= res!85795 e!119338)))

(declare-fun res!85792 () Bool)

(assert (=> b!181200 (=> res!85792 e!119338)))

(assert (=> b!181200 (= res!85792 (not e!119341))))

(declare-fun res!85793 () Bool)

(assert (=> b!181200 (=> (not res!85793) (not e!119341))))

(assert (=> b!181200 (= res!85793 (bvslt #b00000000000000000000000000000000 (size!3929 (_keys!5609 thiss!1248))))))

(declare-fun d!54425 () Bool)

(assert (=> d!54425 e!119337))

(declare-fun res!85794 () Bool)

(assert (=> d!54425 (=> (not res!85794) (not e!119337))))

(assert (=> d!54425 (= res!85794 (or (bvsge #b00000000000000000000000000000000 (size!3929 (_keys!5609 thiss!1248))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3929 (_keys!5609 thiss!1248))))))))

(declare-fun lt!89617 () ListLongMap!2249)

(assert (=> d!54425 (= lt!89613 lt!89617)))

(declare-fun lt!89608 () Unit!5504)

(assert (=> d!54425 (= lt!89608 e!119334)))

(declare-fun c!32469 () Bool)

(assert (=> d!54425 (= c!32469 e!119335)))

(declare-fun res!85789 () Bool)

(assert (=> d!54425 (=> (not res!85789) (not e!119335))))

(assert (=> d!54425 (= res!85789 (bvslt #b00000000000000000000000000000000 (size!3929 (_keys!5609 thiss!1248))))))

(assert (=> d!54425 (= lt!89617 e!119339)))

(assert (=> d!54425 (= c!32467 (and (not (= (bvand (extraKeys!3448 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3448 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!54425 (validMask!0 (mask!8724 thiss!1248))))

(assert (=> d!54425 (= (getCurrentListMap!792 (_keys!5609 thiss!1248) (_values!3694 thiss!1248) (mask!8724 thiss!1248) (extraKeys!3448 thiss!1248) (zeroValue!3552 thiss!1248) (minValue!3552 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3711 thiss!1248)) lt!89613)))

(declare-fun b!181188 () Bool)

(assert (=> b!181188 (= e!119344 call!18293)))

(assert (= (and d!54425 c!32467) b!181190))

(assert (= (and d!54425 (not c!32467)) b!181196))

(assert (= (and b!181196 c!32468) b!181181))

(assert (= (and b!181196 (not c!32468)) b!181195))

(assert (= (and b!181195 c!32465) b!181186))

(assert (= (and b!181195 (not c!32465)) b!181188))

(assert (= (or b!181186 b!181188) bm!18290))

(assert (= (or b!181181 bm!18290) bm!18295))

(assert (= (or b!181181 b!181186) bm!18294))

(assert (= (or b!181190 bm!18295) bm!18293))

(assert (= (or b!181190 bm!18294) bm!18291))

(assert (= (and d!54425 res!85789) b!181185))

(assert (= (and d!54425 c!32469) b!181184))

(assert (= (and d!54425 (not c!32469)) b!181198))

(assert (= (and d!54425 res!85794) b!181200))

(assert (= (and b!181200 res!85793) b!181193))

(assert (= (and b!181200 (not res!85792)) b!181182))

(assert (= (and b!181182 res!85797) b!181192))

(assert (= (and b!181200 res!85795) b!181194))

(assert (= (and b!181194 c!32466) b!181183))

(assert (= (and b!181194 (not c!32466)) b!181191))

(assert (= (and b!181183 res!85791) b!181187))

(assert (= (or b!181183 b!181191) bm!18292))

(assert (= (and b!181194 res!85796) b!181180))

(assert (= (and b!181180 c!32470) b!181199))

(assert (= (and b!181180 (not c!32470)) b!181197))

(assert (= (and b!181199 res!85790) b!181189))

(assert (= (or b!181199 b!181197) bm!18289))

(declare-fun b_lambda!7157 () Bool)

(assert (=> (not b_lambda!7157) (not b!181192)))

(declare-fun t!7120 () Bool)

(declare-fun tb!2805 () Bool)

(assert (=> (and b!181042 (= (defaultEntry!3711 thiss!1248) (defaultEntry!3711 thiss!1248)) t!7120) tb!2805))

(declare-fun result!4709 () Bool)

(assert (=> tb!2805 (= result!4709 tp_is_empty!4243)))

(assert (=> b!181192 t!7120))

(declare-fun b_and!11033 () Bool)

(assert (= b_and!11027 (and (=> t!7120 result!4709) b_and!11033)))

(declare-fun m!209215 () Bool)

(assert (=> b!181184 m!209215))

(declare-fun m!209217 () Bool)

(assert (=> b!181184 m!209217))

(declare-fun m!209219 () Bool)

(assert (=> b!181184 m!209219))

(declare-fun m!209221 () Bool)

(assert (=> b!181184 m!209221))

(declare-fun m!209223 () Bool)

(assert (=> b!181184 m!209223))

(declare-fun m!209225 () Bool)

(assert (=> b!181184 m!209225))

(declare-fun m!209227 () Bool)

(assert (=> b!181184 m!209227))

(declare-fun m!209229 () Bool)

(assert (=> b!181184 m!209229))

(declare-fun m!209231 () Bool)

(assert (=> b!181184 m!209231))

(assert (=> b!181184 m!209229))

(declare-fun m!209233 () Bool)

(assert (=> b!181184 m!209233))

(assert (=> b!181184 m!209217))

(declare-fun m!209235 () Bool)

(assert (=> b!181184 m!209235))

(declare-fun m!209237 () Bool)

(assert (=> b!181184 m!209237))

(declare-fun m!209239 () Bool)

(assert (=> b!181184 m!209239))

(declare-fun m!209241 () Bool)

(assert (=> b!181184 m!209241))

(assert (=> b!181184 m!209237))

(assert (=> b!181184 m!209215))

(declare-fun m!209243 () Bool)

(assert (=> b!181184 m!209243))

(declare-fun m!209245 () Bool)

(assert (=> b!181184 m!209245))

(declare-fun m!209247 () Bool)

(assert (=> b!181184 m!209247))

(assert (=> b!181192 m!209225))

(declare-fun m!209249 () Bool)

(assert (=> b!181192 m!209249))

(assert (=> b!181192 m!209225))

(declare-fun m!209251 () Bool)

(assert (=> b!181192 m!209251))

(declare-fun m!209253 () Bool)

(assert (=> b!181192 m!209253))

(assert (=> b!181192 m!209249))

(declare-fun m!209255 () Bool)

(assert (=> b!181192 m!209255))

(assert (=> b!181192 m!209253))

(declare-fun m!209257 () Bool)

(assert (=> bm!18292 m!209257))

(assert (=> bm!18293 m!209219))

(assert (=> b!181185 m!209225))

(assert (=> b!181185 m!209225))

(declare-fun m!209259 () Bool)

(assert (=> b!181185 m!209259))

(declare-fun m!209261 () Bool)

(assert (=> bm!18291 m!209261))

(assert (=> b!181193 m!209225))

(assert (=> b!181193 m!209225))

(assert (=> b!181193 m!209259))

(assert (=> b!181182 m!209225))

(assert (=> b!181182 m!209225))

(declare-fun m!209263 () Bool)

(assert (=> b!181182 m!209263))

(declare-fun m!209265 () Bool)

(assert (=> bm!18289 m!209265))

(declare-fun m!209267 () Bool)

(assert (=> b!181189 m!209267))

(declare-fun m!209269 () Bool)

(assert (=> b!181187 m!209269))

(declare-fun m!209271 () Bool)

(assert (=> b!181190 m!209271))

(assert (=> d!54425 m!209139))

(assert (=> b!181041 d!54425))

(declare-fun b!181210 () Bool)

(declare-fun e!119350 () Bool)

(assert (=> b!181210 (= e!119350 tp_is_empty!4243)))

(declare-fun b!181209 () Bool)

(declare-fun e!119351 () Bool)

(assert (=> b!181209 (= e!119351 tp_is_empty!4243)))

(declare-fun mapIsEmpty!7280 () Bool)

(declare-fun mapRes!7280 () Bool)

(assert (=> mapIsEmpty!7280 mapRes!7280))

(declare-fun condMapEmpty!7280 () Bool)

(declare-fun mapDefault!7280 () ValueCell!1778)

(assert (=> mapNonEmpty!7271 (= condMapEmpty!7280 (= mapRest!7271 ((as const (Array (_ BitVec 32) ValueCell!1778)) mapDefault!7280)))))

(assert (=> mapNonEmpty!7271 (= tp!16156 (and e!119350 mapRes!7280))))

(declare-fun mapNonEmpty!7280 () Bool)

(declare-fun tp!16172 () Bool)

(assert (=> mapNonEmpty!7280 (= mapRes!7280 (and tp!16172 e!119351))))

(declare-fun mapValue!7280 () ValueCell!1778)

(declare-fun mapRest!7280 () (Array (_ BitVec 32) ValueCell!1778))

(declare-fun mapKey!7280 () (_ BitVec 32))

(assert (=> mapNonEmpty!7280 (= mapRest!7271 (store mapRest!7280 mapKey!7280 mapValue!7280))))

(assert (= (and mapNonEmpty!7271 condMapEmpty!7280) mapIsEmpty!7280))

(assert (= (and mapNonEmpty!7271 (not condMapEmpty!7280)) mapNonEmpty!7280))

(assert (= (and mapNonEmpty!7280 ((_ is ValueCellFull!1778) mapValue!7280)) b!181209))

(assert (= (and mapNonEmpty!7271 ((_ is ValueCellFull!1778) mapDefault!7280)) b!181210))

(declare-fun m!209273 () Bool)

(assert (=> mapNonEmpty!7280 m!209273))

(declare-fun b_lambda!7159 () Bool)

(assert (= b_lambda!7157 (or (and b!181042 b_free!4471) b_lambda!7159)))

(check-sat (not bm!18292) (not b_lambda!7159) (not b!181193) tp_is_empty!4243 (not b!181184) (not b!181126) (not b!181182) (not d!54421) (not b!181137) b_and!11033 (not b!181192) (not d!54425) (not b!181190) (not b!181189) (not b!181185) (not b!181135) (not b!181128) (not b!181127) (not bm!18289) (not d!54419) (not b!181116) (not bm!18293) (not b_next!4471) (not d!54423) (not b!181187) (not bm!18291) (not mapNonEmpty!7280))
(check-sat b_and!11033 (not b_next!4471))
(get-model)

(declare-fun d!54427 () Bool)

(declare-fun res!85802 () Bool)

(declare-fun e!119356 () Bool)

(assert (=> d!54427 (=> res!85802 e!119356)))

(assert (=> d!54427 (= res!85802 (and ((_ is Cons!2268) (toList!1140 (getCurrentListMap!792 (_keys!5609 thiss!1248) (_values!3694 thiss!1248) (mask!8724 thiss!1248) (extraKeys!3448 thiss!1248) (zeroValue!3552 thiss!1248) (minValue!3552 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3711 thiss!1248)))) (= (_1!1675 (h!2894 (toList!1140 (getCurrentListMap!792 (_keys!5609 thiss!1248) (_values!3694 thiss!1248) (mask!8724 thiss!1248) (extraKeys!3448 thiss!1248) (zeroValue!3552 thiss!1248) (minValue!3552 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3711 thiss!1248))))) key!828)))))

(assert (=> d!54427 (= (containsKey!212 (toList!1140 (getCurrentListMap!792 (_keys!5609 thiss!1248) (_values!3694 thiss!1248) (mask!8724 thiss!1248) (extraKeys!3448 thiss!1248) (zeroValue!3552 thiss!1248) (minValue!3552 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3711 thiss!1248))) key!828) e!119356)))

(declare-fun b!181215 () Bool)

(declare-fun e!119357 () Bool)

(assert (=> b!181215 (= e!119356 e!119357)))

(declare-fun res!85803 () Bool)

(assert (=> b!181215 (=> (not res!85803) (not e!119357))))

(assert (=> b!181215 (= res!85803 (and (or (not ((_ is Cons!2268) (toList!1140 (getCurrentListMap!792 (_keys!5609 thiss!1248) (_values!3694 thiss!1248) (mask!8724 thiss!1248) (extraKeys!3448 thiss!1248) (zeroValue!3552 thiss!1248) (minValue!3552 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3711 thiss!1248))))) (bvsle (_1!1675 (h!2894 (toList!1140 (getCurrentListMap!792 (_keys!5609 thiss!1248) (_values!3694 thiss!1248) (mask!8724 thiss!1248) (extraKeys!3448 thiss!1248) (zeroValue!3552 thiss!1248) (minValue!3552 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3711 thiss!1248))))) key!828)) ((_ is Cons!2268) (toList!1140 (getCurrentListMap!792 (_keys!5609 thiss!1248) (_values!3694 thiss!1248) (mask!8724 thiss!1248) (extraKeys!3448 thiss!1248) (zeroValue!3552 thiss!1248) (minValue!3552 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3711 thiss!1248)))) (bvslt (_1!1675 (h!2894 (toList!1140 (getCurrentListMap!792 (_keys!5609 thiss!1248) (_values!3694 thiss!1248) (mask!8724 thiss!1248) (extraKeys!3448 thiss!1248) (zeroValue!3552 thiss!1248) (minValue!3552 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3711 thiss!1248))))) key!828)))))

(declare-fun b!181216 () Bool)

(assert (=> b!181216 (= e!119357 (containsKey!212 (t!7116 (toList!1140 (getCurrentListMap!792 (_keys!5609 thiss!1248) (_values!3694 thiss!1248) (mask!8724 thiss!1248) (extraKeys!3448 thiss!1248) (zeroValue!3552 thiss!1248) (minValue!3552 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3711 thiss!1248)))) key!828))))

(assert (= (and d!54427 (not res!85802)) b!181215))

(assert (= (and b!181215 res!85803) b!181216))

(declare-fun m!209275 () Bool)

(assert (=> b!181216 m!209275))

(assert (=> d!54423 d!54427))

(declare-fun b!181225 () Bool)

(declare-fun e!119366 () Bool)

(declare-fun e!119364 () Bool)

(assert (=> b!181225 (= e!119366 e!119364)))

(declare-fun c!32473 () Bool)

(assert (=> b!181225 (= c!32473 (validKeyInArray!0 (select (arr!3620 (_keys!5609 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!18298 () Bool)

(declare-fun call!18301 () Bool)

(assert (=> bm!18298 (= call!18301 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5609 thiss!1248) (mask!8724 thiss!1248)))))

(declare-fun b!181226 () Bool)

(assert (=> b!181226 (= e!119364 call!18301)))

(declare-fun d!54429 () Bool)

(declare-fun res!85809 () Bool)

(assert (=> d!54429 (=> res!85809 e!119366)))

(assert (=> d!54429 (= res!85809 (bvsge #b00000000000000000000000000000000 (size!3929 (_keys!5609 thiss!1248))))))

(assert (=> d!54429 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5609 thiss!1248) (mask!8724 thiss!1248)) e!119366)))

(declare-fun b!181227 () Bool)

(declare-fun e!119365 () Bool)

(assert (=> b!181227 (= e!119364 e!119365)))

(declare-fun lt!89637 () (_ BitVec 64))

(assert (=> b!181227 (= lt!89637 (select (arr!3620 (_keys!5609 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!89636 () Unit!5504)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!7649 (_ BitVec 64) (_ BitVec 32)) Unit!5504)

(assert (=> b!181227 (= lt!89636 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5609 thiss!1248) lt!89637 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!7649 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!181227 (arrayContainsKey!0 (_keys!5609 thiss!1248) lt!89637 #b00000000000000000000000000000000)))

(declare-fun lt!89635 () Unit!5504)

(assert (=> b!181227 (= lt!89635 lt!89636)))

(declare-fun res!85808 () Bool)

(assert (=> b!181227 (= res!85808 (= (seekEntryOrOpen!0 (select (arr!3620 (_keys!5609 thiss!1248)) #b00000000000000000000000000000000) (_keys!5609 thiss!1248) (mask!8724 thiss!1248)) (Found!591 #b00000000000000000000000000000000)))))

(assert (=> b!181227 (=> (not res!85808) (not e!119365))))

(declare-fun b!181228 () Bool)

(assert (=> b!181228 (= e!119365 call!18301)))

(assert (= (and d!54429 (not res!85809)) b!181225))

(assert (= (and b!181225 c!32473) b!181227))

(assert (= (and b!181225 (not c!32473)) b!181226))

(assert (= (and b!181227 res!85808) b!181228))

(assert (= (or b!181228 b!181226) bm!18298))

(assert (=> b!181225 m!209225))

(assert (=> b!181225 m!209225))

(assert (=> b!181225 m!209259))

(declare-fun m!209277 () Bool)

(assert (=> bm!18298 m!209277))

(assert (=> b!181227 m!209225))

(declare-fun m!209279 () Bool)

(assert (=> b!181227 m!209279))

(declare-fun m!209281 () Bool)

(assert (=> b!181227 m!209281))

(assert (=> b!181227 m!209225))

(declare-fun m!209283 () Bool)

(assert (=> b!181227 m!209283))

(assert (=> b!181127 d!54429))

(declare-fun b!181239 () Bool)

(declare-fun e!119377 () Bool)

(declare-fun e!119376 () Bool)

(assert (=> b!181239 (= e!119377 e!119376)))

(declare-fun c!32476 () Bool)

(assert (=> b!181239 (= c!32476 (validKeyInArray!0 (select (arr!3620 (_keys!5609 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!18301 () Bool)

(declare-fun call!18304 () Bool)

(assert (=> bm!18301 (= call!18304 (arrayNoDuplicates!0 (_keys!5609 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!32476 (Cons!2271 (select (arr!3620 (_keys!5609 thiss!1248)) #b00000000000000000000000000000000) Nil!2272) Nil!2272)))))

(declare-fun b!181240 () Bool)

(assert (=> b!181240 (= e!119376 call!18304)))

(declare-fun d!54431 () Bool)

(declare-fun res!85816 () Bool)

(declare-fun e!119378 () Bool)

(assert (=> d!54431 (=> res!85816 e!119378)))

(assert (=> d!54431 (= res!85816 (bvsge #b00000000000000000000000000000000 (size!3929 (_keys!5609 thiss!1248))))))

(assert (=> d!54431 (= (arrayNoDuplicates!0 (_keys!5609 thiss!1248) #b00000000000000000000000000000000 Nil!2272) e!119378)))

(declare-fun b!181241 () Bool)

(assert (=> b!181241 (= e!119378 e!119377)))

(declare-fun res!85817 () Bool)

(assert (=> b!181241 (=> (not res!85817) (not e!119377))))

(declare-fun e!119375 () Bool)

(assert (=> b!181241 (= res!85817 (not e!119375))))

(declare-fun res!85818 () Bool)

(assert (=> b!181241 (=> (not res!85818) (not e!119375))))

(assert (=> b!181241 (= res!85818 (validKeyInArray!0 (select (arr!3620 (_keys!5609 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!181242 () Bool)

(declare-fun contains!1233 (List!2275 (_ BitVec 64)) Bool)

(assert (=> b!181242 (= e!119375 (contains!1233 Nil!2272 (select (arr!3620 (_keys!5609 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!181243 () Bool)

(assert (=> b!181243 (= e!119376 call!18304)))

(assert (= (and d!54431 (not res!85816)) b!181241))

(assert (= (and b!181241 res!85818) b!181242))

(assert (= (and b!181241 res!85817) b!181239))

(assert (= (and b!181239 c!32476) b!181240))

(assert (= (and b!181239 (not c!32476)) b!181243))

(assert (= (or b!181240 b!181243) bm!18301))

(assert (=> b!181239 m!209225))

(assert (=> b!181239 m!209225))

(assert (=> b!181239 m!209259))

(assert (=> bm!18301 m!209225))

(declare-fun m!209285 () Bool)

(assert (=> bm!18301 m!209285))

(assert (=> b!181241 m!209225))

(assert (=> b!181241 m!209225))

(assert (=> b!181241 m!209259))

(assert (=> b!181242 m!209225))

(assert (=> b!181242 m!209225))

(declare-fun m!209287 () Bool)

(assert (=> b!181242 m!209287))

(assert (=> b!181128 d!54431))

(declare-fun d!54433 () Bool)

(declare-fun e!119381 () Bool)

(assert (=> d!54433 e!119381))

(declare-fun res!85824 () Bool)

(assert (=> d!54433 (=> (not res!85824) (not e!119381))))

(declare-fun lt!89646 () ListLongMap!2249)

(assert (=> d!54433 (= res!85824 (contains!1230 lt!89646 (_1!1675 (tuple2!3329 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3552 thiss!1248)))))))

(declare-fun lt!89649 () List!2272)

(assert (=> d!54433 (= lt!89646 (ListLongMap!2250 lt!89649))))

(declare-fun lt!89648 () Unit!5504)

(declare-fun lt!89647 () Unit!5504)

(assert (=> d!54433 (= lt!89648 lt!89647)))

(assert (=> d!54433 (= (getValueByKey!209 lt!89649 (_1!1675 (tuple2!3329 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3552 thiss!1248)))) (Some!214 (_2!1675 (tuple2!3329 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3552 thiss!1248)))))))

(declare-fun lemmaContainsTupThenGetReturnValue!111 (List!2272 (_ BitVec 64) V!5305) Unit!5504)

(assert (=> d!54433 (= lt!89647 (lemmaContainsTupThenGetReturnValue!111 lt!89649 (_1!1675 (tuple2!3329 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3552 thiss!1248))) (_2!1675 (tuple2!3329 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3552 thiss!1248)))))))

(declare-fun insertStrictlySorted!114 (List!2272 (_ BitVec 64) V!5305) List!2272)

(assert (=> d!54433 (= lt!89649 (insertStrictlySorted!114 (toList!1140 call!18296) (_1!1675 (tuple2!3329 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3552 thiss!1248))) (_2!1675 (tuple2!3329 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3552 thiss!1248)))))))

(assert (=> d!54433 (= (+!271 call!18296 (tuple2!3329 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3552 thiss!1248))) lt!89646)))

(declare-fun b!181248 () Bool)

(declare-fun res!85823 () Bool)

(assert (=> b!181248 (=> (not res!85823) (not e!119381))))

(assert (=> b!181248 (= res!85823 (= (getValueByKey!209 (toList!1140 lt!89646) (_1!1675 (tuple2!3329 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3552 thiss!1248)))) (Some!214 (_2!1675 (tuple2!3329 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3552 thiss!1248))))))))

(declare-fun b!181249 () Bool)

(declare-fun contains!1234 (List!2272 tuple2!3328) Bool)

(assert (=> b!181249 (= e!119381 (contains!1234 (toList!1140 lt!89646) (tuple2!3329 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3552 thiss!1248))))))

(assert (= (and d!54433 res!85824) b!181248))

(assert (= (and b!181248 res!85823) b!181249))

(declare-fun m!209289 () Bool)

(assert (=> d!54433 m!209289))

(declare-fun m!209291 () Bool)

(assert (=> d!54433 m!209291))

(declare-fun m!209293 () Bool)

(assert (=> d!54433 m!209293))

(declare-fun m!209295 () Bool)

(assert (=> d!54433 m!209295))

(declare-fun m!209297 () Bool)

(assert (=> b!181248 m!209297))

(declare-fun m!209299 () Bool)

(assert (=> b!181249 m!209299))

(assert (=> b!181190 d!54433))

(declare-fun b!181262 () Bool)

(declare-fun e!119390 () SeekEntryResult!591)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!181262 (= e!119390 (seekKeyOrZeroReturnVacant!0 (bvadd (x!19769 lt!89550) #b00000000000000000000000000000001) (nextIndex!0 (index!4536 lt!89550) (bvadd (x!19769 lt!89550) #b00000000000000000000000000000001) (mask!8724 thiss!1248)) (index!4536 lt!89550) key!828 (_keys!5609 thiss!1248) (mask!8724 thiss!1248)))))

(declare-fun b!181263 () Bool)

(assert (=> b!181263 (= e!119390 (MissingVacant!591 (index!4536 lt!89550)))))

(declare-fun b!181264 () Bool)

(declare-fun e!119389 () SeekEntryResult!591)

(assert (=> b!181264 (= e!119389 (Found!591 (index!4536 lt!89550)))))

(declare-fun b!181265 () Bool)

(declare-fun c!32485 () Bool)

(declare-fun lt!89654 () (_ BitVec 64))

(assert (=> b!181265 (= c!32485 (= lt!89654 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!181265 (= e!119389 e!119390)))

(declare-fun b!181266 () Bool)

(declare-fun e!119388 () SeekEntryResult!591)

(assert (=> b!181266 (= e!119388 Undefined!591)))

(declare-fun lt!89655 () SeekEntryResult!591)

(declare-fun d!54435 () Bool)

(assert (=> d!54435 (and (or ((_ is Undefined!591) lt!89655) (not ((_ is Found!591) lt!89655)) (and (bvsge (index!4535 lt!89655) #b00000000000000000000000000000000) (bvslt (index!4535 lt!89655) (size!3929 (_keys!5609 thiss!1248))))) (or ((_ is Undefined!591) lt!89655) ((_ is Found!591) lt!89655) (not ((_ is MissingVacant!591) lt!89655)) (not (= (index!4537 lt!89655) (index!4536 lt!89550))) (and (bvsge (index!4537 lt!89655) #b00000000000000000000000000000000) (bvslt (index!4537 lt!89655) (size!3929 (_keys!5609 thiss!1248))))) (or ((_ is Undefined!591) lt!89655) (ite ((_ is Found!591) lt!89655) (= (select (arr!3620 (_keys!5609 thiss!1248)) (index!4535 lt!89655)) key!828) (and ((_ is MissingVacant!591) lt!89655) (= (index!4537 lt!89655) (index!4536 lt!89550)) (= (select (arr!3620 (_keys!5609 thiss!1248)) (index!4537 lt!89655)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!54435 (= lt!89655 e!119388)))

(declare-fun c!32483 () Bool)

(assert (=> d!54435 (= c!32483 (bvsge (x!19769 lt!89550) #b01111111111111111111111111111110))))

(assert (=> d!54435 (= lt!89654 (select (arr!3620 (_keys!5609 thiss!1248)) (index!4536 lt!89550)))))

(assert (=> d!54435 (validMask!0 (mask!8724 thiss!1248))))

(assert (=> d!54435 (= (seekKeyOrZeroReturnVacant!0 (x!19769 lt!89550) (index!4536 lt!89550) (index!4536 lt!89550) key!828 (_keys!5609 thiss!1248) (mask!8724 thiss!1248)) lt!89655)))

(declare-fun b!181267 () Bool)

(assert (=> b!181267 (= e!119388 e!119389)))

(declare-fun c!32484 () Bool)

(assert (=> b!181267 (= c!32484 (= lt!89654 key!828))))

(assert (= (and d!54435 c!32483) b!181266))

(assert (= (and d!54435 (not c!32483)) b!181267))

(assert (= (and b!181267 c!32484) b!181264))

(assert (= (and b!181267 (not c!32484)) b!181265))

(assert (= (and b!181265 c!32485) b!181263))

(assert (= (and b!181265 (not c!32485)) b!181262))

(declare-fun m!209301 () Bool)

(assert (=> b!181262 m!209301))

(assert (=> b!181262 m!209301))

(declare-fun m!209303 () Bool)

(assert (=> b!181262 m!209303))

(declare-fun m!209305 () Bool)

(assert (=> d!54435 m!209305))

(declare-fun m!209307 () Bool)

(assert (=> d!54435 m!209307))

(assert (=> d!54435 m!209187))

(assert (=> d!54435 m!209139))

(assert (=> b!181116 d!54435))

(declare-fun b!181276 () Bool)

(declare-fun e!119396 () (_ BitVec 32))

(assert (=> b!181276 (= e!119396 #b00000000000000000000000000000000)))

(declare-fun d!54437 () Bool)

(declare-fun lt!89658 () (_ BitVec 32))

(assert (=> d!54437 (and (bvsge lt!89658 #b00000000000000000000000000000000) (bvsle lt!89658 (bvsub (size!3929 (_keys!5609 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> d!54437 (= lt!89658 e!119396)))

(declare-fun c!32490 () Bool)

(assert (=> d!54437 (= c!32490 (bvsge #b00000000000000000000000000000000 (size!3929 (_keys!5609 thiss!1248))))))

(assert (=> d!54437 (and (bvsle #b00000000000000000000000000000000 (size!3929 (_keys!5609 thiss!1248))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!3929 (_keys!5609 thiss!1248)) (size!3929 (_keys!5609 thiss!1248))))))

(assert (=> d!54437 (= (arrayCountValidKeys!0 (_keys!5609 thiss!1248) #b00000000000000000000000000000000 (size!3929 (_keys!5609 thiss!1248))) lt!89658)))

(declare-fun b!181277 () Bool)

(declare-fun e!119395 () (_ BitVec 32))

(declare-fun call!18307 () (_ BitVec 32))

(assert (=> b!181277 (= e!119395 (bvadd #b00000000000000000000000000000001 call!18307))))

(declare-fun b!181278 () Bool)

(assert (=> b!181278 (= e!119395 call!18307)))

(declare-fun bm!18304 () Bool)

(assert (=> bm!18304 (= call!18307 (arrayCountValidKeys!0 (_keys!5609 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3929 (_keys!5609 thiss!1248))))))

(declare-fun b!181279 () Bool)

(assert (=> b!181279 (= e!119396 e!119395)))

(declare-fun c!32491 () Bool)

(assert (=> b!181279 (= c!32491 (validKeyInArray!0 (select (arr!3620 (_keys!5609 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (= (and d!54437 c!32490) b!181276))

(assert (= (and d!54437 (not c!32490)) b!181279))

(assert (= (and b!181279 c!32491) b!181277))

(assert (= (and b!181279 (not c!32491)) b!181278))

(assert (= (or b!181277 b!181278) bm!18304))

(declare-fun m!209309 () Bool)

(assert (=> bm!18304 m!209309))

(assert (=> b!181279 m!209225))

(assert (=> b!181279 m!209225))

(assert (=> b!181279 m!209259))

(assert (=> b!181126 d!54437))

(declare-fun d!54439 () Bool)

(declare-fun e!119397 () Bool)

(assert (=> d!54439 e!119397))

(declare-fun res!85825 () Bool)

(assert (=> d!54439 (=> res!85825 e!119397)))

(declare-fun lt!89661 () Bool)

(assert (=> d!54439 (= res!85825 (not lt!89661))))

(declare-fun lt!89662 () Bool)

(assert (=> d!54439 (= lt!89661 lt!89662)))

(declare-fun lt!89660 () Unit!5504)

(declare-fun e!119398 () Unit!5504)

(assert (=> d!54439 (= lt!89660 e!119398)))

(declare-fun c!32492 () Bool)

(assert (=> d!54439 (= c!32492 lt!89662)))

(assert (=> d!54439 (= lt!89662 (containsKey!212 (toList!1140 lt!89613) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!54439 (= (contains!1230 lt!89613 #b1000000000000000000000000000000000000000000000000000000000000000) lt!89661)))

(declare-fun b!181280 () Bool)

(declare-fun lt!89659 () Unit!5504)

(assert (=> b!181280 (= e!119398 lt!89659)))

(assert (=> b!181280 (= lt!89659 (lemmaContainsKeyImpliesGetValueByKeyDefined!160 (toList!1140 lt!89613) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!181280 (isDefined!161 (getValueByKey!209 (toList!1140 lt!89613) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!181281 () Bool)

(declare-fun Unit!5508 () Unit!5504)

(assert (=> b!181281 (= e!119398 Unit!5508)))

(declare-fun b!181282 () Bool)

(assert (=> b!181282 (= e!119397 (isDefined!161 (getValueByKey!209 (toList!1140 lt!89613) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!54439 c!32492) b!181280))

(assert (= (and d!54439 (not c!32492)) b!181281))

(assert (= (and d!54439 (not res!85825)) b!181282))

(declare-fun m!209311 () Bool)

(assert (=> d!54439 m!209311))

(declare-fun m!209313 () Bool)

(assert (=> b!181280 m!209313))

(declare-fun m!209315 () Bool)

(assert (=> b!181280 m!209315))

(assert (=> b!181280 m!209315))

(declare-fun m!209317 () Bool)

(assert (=> b!181280 m!209317))

(assert (=> b!181282 m!209315))

(assert (=> b!181282 m!209315))

(assert (=> b!181282 m!209317))

(assert (=> bm!18289 d!54439))

(declare-fun d!54441 () Bool)

(declare-fun get!2080 (Option!215) V!5305)

(assert (=> d!54441 (= (apply!151 lt!89613 #b1000000000000000000000000000000000000000000000000000000000000000) (get!2080 (getValueByKey!209 (toList!1140 lt!89613) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7413 () Bool)

(assert (= bs!7413 d!54441))

(assert (=> bs!7413 m!209315))

(assert (=> bs!7413 m!209315))

(declare-fun m!209319 () Bool)

(assert (=> bs!7413 m!209319))

(assert (=> b!181189 d!54441))

(declare-fun d!54443 () Bool)

(assert (=> d!54443 (= (apply!151 lt!89613 #b0000000000000000000000000000000000000000000000000000000000000000) (get!2080 (getValueByKey!209 (toList!1140 lt!89613) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7414 () Bool)

(assert (= bs!7414 d!54443))

(declare-fun m!209321 () Bool)

(assert (=> bs!7414 m!209321))

(assert (=> bs!7414 m!209321))

(declare-fun m!209323 () Bool)

(assert (=> bs!7414 m!209323))

(assert (=> b!181187 d!54443))

(declare-fun b!181291 () Bool)

(declare-fun res!85835 () Bool)

(declare-fun e!119401 () Bool)

(assert (=> b!181291 (=> (not res!85835) (not e!119401))))

(assert (=> b!181291 (= res!85835 (and (= (size!3930 (_values!3694 thiss!1248)) (bvadd (mask!8724 thiss!1248) #b00000000000000000000000000000001)) (= (size!3929 (_keys!5609 thiss!1248)) (size!3930 (_values!3694 thiss!1248))) (bvsge (_size!1281 thiss!1248) #b00000000000000000000000000000000) (bvsle (_size!1281 thiss!1248) (bvadd (mask!8724 thiss!1248) #b00000000000000000000000000000001))))))

(declare-fun b!181293 () Bool)

(declare-fun res!85837 () Bool)

(assert (=> b!181293 (=> (not res!85837) (not e!119401))))

(declare-fun size!3935 (LongMapFixedSize!2464) (_ BitVec 32))

(assert (=> b!181293 (= res!85837 (= (size!3935 thiss!1248) (bvadd (_size!1281 thiss!1248) (bvsdiv (bvadd (extraKeys!3448 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!181292 () Bool)

(declare-fun res!85834 () Bool)

(assert (=> b!181292 (=> (not res!85834) (not e!119401))))

(assert (=> b!181292 (= res!85834 (bvsge (size!3935 thiss!1248) (_size!1281 thiss!1248)))))

(declare-fun d!54445 () Bool)

(declare-fun res!85836 () Bool)

(assert (=> d!54445 (=> (not res!85836) (not e!119401))))

(assert (=> d!54445 (= res!85836 (validMask!0 (mask!8724 thiss!1248)))))

(assert (=> d!54445 (= (simpleValid!167 thiss!1248) e!119401)))

(declare-fun b!181294 () Bool)

(assert (=> b!181294 (= e!119401 (and (bvsge (extraKeys!3448 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3448 thiss!1248) #b00000000000000000000000000000011) (bvsge (_vacant!1281 thiss!1248) #b00000000000000000000000000000000)))))

(assert (= (and d!54445 res!85836) b!181291))

(assert (= (and b!181291 res!85835) b!181292))

(assert (= (and b!181292 res!85834) b!181293))

(assert (= (and b!181293 res!85837) b!181294))

(declare-fun m!209325 () Bool)

(assert (=> b!181293 m!209325))

(assert (=> b!181292 m!209325))

(assert (=> d!54445 m!209139))

(assert (=> d!54421 d!54445))

(declare-fun d!54447 () Bool)

(declare-fun e!119402 () Bool)

(assert (=> d!54447 e!119402))

(declare-fun res!85838 () Bool)

(assert (=> d!54447 (=> res!85838 e!119402)))

(declare-fun lt!89665 () Bool)

(assert (=> d!54447 (= res!85838 (not lt!89665))))

(declare-fun lt!89666 () Bool)

(assert (=> d!54447 (= lt!89665 lt!89666)))

(declare-fun lt!89664 () Unit!5504)

(declare-fun e!119403 () Unit!5504)

(assert (=> d!54447 (= lt!89664 e!119403)))

(declare-fun c!32493 () Bool)

(assert (=> d!54447 (= c!32493 lt!89666)))

(assert (=> d!54447 (= lt!89666 (containsKey!212 (toList!1140 lt!89613) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!54447 (= (contains!1230 lt!89613 #b0000000000000000000000000000000000000000000000000000000000000000) lt!89665)))

(declare-fun b!181295 () Bool)

(declare-fun lt!89663 () Unit!5504)

(assert (=> b!181295 (= e!119403 lt!89663)))

(assert (=> b!181295 (= lt!89663 (lemmaContainsKeyImpliesGetValueByKeyDefined!160 (toList!1140 lt!89613) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!181295 (isDefined!161 (getValueByKey!209 (toList!1140 lt!89613) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!181296 () Bool)

(declare-fun Unit!5509 () Unit!5504)

(assert (=> b!181296 (= e!119403 Unit!5509)))

(declare-fun b!181297 () Bool)

(assert (=> b!181297 (= e!119402 (isDefined!161 (getValueByKey!209 (toList!1140 lt!89613) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!54447 c!32493) b!181295))

(assert (= (and d!54447 (not c!32493)) b!181296))

(assert (= (and d!54447 (not res!85838)) b!181297))

(declare-fun m!209327 () Bool)

(assert (=> d!54447 m!209327))

(declare-fun m!209329 () Bool)

(assert (=> b!181295 m!209329))

(assert (=> b!181295 m!209321))

(assert (=> b!181295 m!209321))

(declare-fun m!209331 () Bool)

(assert (=> b!181295 m!209331))

(assert (=> b!181297 m!209321))

(assert (=> b!181297 m!209321))

(assert (=> b!181297 m!209331))

(assert (=> bm!18292 d!54447))

(declare-fun d!54449 () Bool)

(assert (=> d!54449 (= (validKeyInArray!0 (select (arr!3620 (_keys!5609 thiss!1248)) #b00000000000000000000000000000000)) (and (not (= (select (arr!3620 (_keys!5609 thiss!1248)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!3620 (_keys!5609 thiss!1248)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!181185 d!54449))

(declare-fun d!54451 () Bool)

(declare-fun isEmpty!463 (Option!215) Bool)

(assert (=> d!54451 (= (isDefined!161 (getValueByKey!209 (toList!1140 (getCurrentListMap!792 (_keys!5609 thiss!1248) (_values!3694 thiss!1248) (mask!8724 thiss!1248) (extraKeys!3448 thiss!1248) (zeroValue!3552 thiss!1248) (minValue!3552 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3711 thiss!1248))) key!828)) (not (isEmpty!463 (getValueByKey!209 (toList!1140 (getCurrentListMap!792 (_keys!5609 thiss!1248) (_values!3694 thiss!1248) (mask!8724 thiss!1248) (extraKeys!3448 thiss!1248) (zeroValue!3552 thiss!1248) (minValue!3552 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3711 thiss!1248))) key!828))))))

(declare-fun bs!7415 () Bool)

(assert (= bs!7415 d!54451))

(assert (=> bs!7415 m!209211))

(declare-fun m!209333 () Bool)

(assert (=> bs!7415 m!209333))

(assert (=> b!181137 d!54451))

(declare-fun b!181306 () Bool)

(declare-fun e!119408 () Option!215)

(assert (=> b!181306 (= e!119408 (Some!214 (_2!1675 (h!2894 (toList!1140 (getCurrentListMap!792 (_keys!5609 thiss!1248) (_values!3694 thiss!1248) (mask!8724 thiss!1248) (extraKeys!3448 thiss!1248) (zeroValue!3552 thiss!1248) (minValue!3552 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3711 thiss!1248)))))))))

(declare-fun b!181307 () Bool)

(declare-fun e!119409 () Option!215)

(assert (=> b!181307 (= e!119408 e!119409)))

(declare-fun c!32499 () Bool)

(assert (=> b!181307 (= c!32499 (and ((_ is Cons!2268) (toList!1140 (getCurrentListMap!792 (_keys!5609 thiss!1248) (_values!3694 thiss!1248) (mask!8724 thiss!1248) (extraKeys!3448 thiss!1248) (zeroValue!3552 thiss!1248) (minValue!3552 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3711 thiss!1248)))) (not (= (_1!1675 (h!2894 (toList!1140 (getCurrentListMap!792 (_keys!5609 thiss!1248) (_values!3694 thiss!1248) (mask!8724 thiss!1248) (extraKeys!3448 thiss!1248) (zeroValue!3552 thiss!1248) (minValue!3552 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3711 thiss!1248))))) key!828))))))

(declare-fun d!54453 () Bool)

(declare-fun c!32498 () Bool)

(assert (=> d!54453 (= c!32498 (and ((_ is Cons!2268) (toList!1140 (getCurrentListMap!792 (_keys!5609 thiss!1248) (_values!3694 thiss!1248) (mask!8724 thiss!1248) (extraKeys!3448 thiss!1248) (zeroValue!3552 thiss!1248) (minValue!3552 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3711 thiss!1248)))) (= (_1!1675 (h!2894 (toList!1140 (getCurrentListMap!792 (_keys!5609 thiss!1248) (_values!3694 thiss!1248) (mask!8724 thiss!1248) (extraKeys!3448 thiss!1248) (zeroValue!3552 thiss!1248) (minValue!3552 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3711 thiss!1248))))) key!828)))))

(assert (=> d!54453 (= (getValueByKey!209 (toList!1140 (getCurrentListMap!792 (_keys!5609 thiss!1248) (_values!3694 thiss!1248) (mask!8724 thiss!1248) (extraKeys!3448 thiss!1248) (zeroValue!3552 thiss!1248) (minValue!3552 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3711 thiss!1248))) key!828) e!119408)))

(declare-fun b!181309 () Bool)

(assert (=> b!181309 (= e!119409 None!213)))

(declare-fun b!181308 () Bool)

(assert (=> b!181308 (= e!119409 (getValueByKey!209 (t!7116 (toList!1140 (getCurrentListMap!792 (_keys!5609 thiss!1248) (_values!3694 thiss!1248) (mask!8724 thiss!1248) (extraKeys!3448 thiss!1248) (zeroValue!3552 thiss!1248) (minValue!3552 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3711 thiss!1248)))) key!828))))

(assert (= (and d!54453 c!32498) b!181306))

(assert (= (and d!54453 (not c!32498)) b!181307))

(assert (= (and b!181307 c!32499) b!181308))

(assert (= (and b!181307 (not c!32499)) b!181309))

(declare-fun m!209335 () Bool)

(assert (=> b!181308 m!209335))

(assert (=> b!181137 d!54453))

(declare-fun b!181328 () Bool)

(declare-fun e!119420 () Bool)

(declare-fun lt!89671 () SeekEntryResult!591)

(assert (=> b!181328 (= e!119420 (bvsge (x!19769 lt!89671) #b01111111111111111111111111111110))))

(declare-fun b!181329 () Bool)

(declare-fun e!119424 () Bool)

(assert (=> b!181329 (= e!119420 e!119424)))

(declare-fun res!85846 () Bool)

(assert (=> b!181329 (= res!85846 (and ((_ is Intermediate!591) lt!89671) (not (undefined!1403 lt!89671)) (bvslt (x!19769 lt!89671) #b01111111111111111111111111111110) (bvsge (x!19769 lt!89671) #b00000000000000000000000000000000) (bvsge (x!19769 lt!89671) #b00000000000000000000000000000000)))))

(assert (=> b!181329 (=> (not res!85846) (not e!119424))))

(declare-fun d!54455 () Bool)

(assert (=> d!54455 e!119420))

(declare-fun c!32507 () Bool)

(assert (=> d!54455 (= c!32507 (and ((_ is Intermediate!591) lt!89671) (undefined!1403 lt!89671)))))

(declare-fun e!119422 () SeekEntryResult!591)

(assert (=> d!54455 (= lt!89671 e!119422)))

(declare-fun c!32506 () Bool)

(assert (=> d!54455 (= c!32506 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!89672 () (_ BitVec 64))

(assert (=> d!54455 (= lt!89672 (select (arr!3620 (_keys!5609 thiss!1248)) (toIndex!0 key!828 (mask!8724 thiss!1248))))))

(assert (=> d!54455 (validMask!0 (mask!8724 thiss!1248))))

(assert (=> d!54455 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!8724 thiss!1248)) key!828 (_keys!5609 thiss!1248) (mask!8724 thiss!1248)) lt!89671)))

(declare-fun b!181330 () Bool)

(declare-fun e!119423 () SeekEntryResult!591)

(assert (=> b!181330 (= e!119423 (Intermediate!591 false (toIndex!0 key!828 (mask!8724 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun b!181331 () Bool)

(assert (=> b!181331 (and (bvsge (index!4536 lt!89671) #b00000000000000000000000000000000) (bvslt (index!4536 lt!89671) (size!3929 (_keys!5609 thiss!1248))))))

(declare-fun e!119421 () Bool)

(assert (=> b!181331 (= e!119421 (= (select (arr!3620 (_keys!5609 thiss!1248)) (index!4536 lt!89671)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!181332 () Bool)

(assert (=> b!181332 (and (bvsge (index!4536 lt!89671) #b00000000000000000000000000000000) (bvslt (index!4536 lt!89671) (size!3929 (_keys!5609 thiss!1248))))))

(declare-fun res!85845 () Bool)

(assert (=> b!181332 (= res!85845 (= (select (arr!3620 (_keys!5609 thiss!1248)) (index!4536 lt!89671)) key!828))))

(assert (=> b!181332 (=> res!85845 e!119421)))

(assert (=> b!181332 (= e!119424 e!119421)))

(declare-fun b!181333 () Bool)

(assert (=> b!181333 (and (bvsge (index!4536 lt!89671) #b00000000000000000000000000000000) (bvslt (index!4536 lt!89671) (size!3929 (_keys!5609 thiss!1248))))))

(declare-fun res!85847 () Bool)

(assert (=> b!181333 (= res!85847 (= (select (arr!3620 (_keys!5609 thiss!1248)) (index!4536 lt!89671)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!181333 (=> res!85847 e!119421)))

(declare-fun b!181334 () Bool)

(assert (=> b!181334 (= e!119422 e!119423)))

(declare-fun c!32508 () Bool)

(assert (=> b!181334 (= c!32508 (or (= lt!89672 key!828) (= (bvadd lt!89672 lt!89672) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!181335 () Bool)

(assert (=> b!181335 (= e!119422 (Intermediate!591 true (toIndex!0 key!828 (mask!8724 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun b!181336 () Bool)

(assert (=> b!181336 (= e!119423 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!828 (mask!8724 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (mask!8724 thiss!1248)) key!828 (_keys!5609 thiss!1248) (mask!8724 thiss!1248)))))

(assert (= (and d!54455 c!32506) b!181335))

(assert (= (and d!54455 (not c!32506)) b!181334))

(assert (= (and b!181334 c!32508) b!181330))

(assert (= (and b!181334 (not c!32508)) b!181336))

(assert (= (and d!54455 c!32507) b!181328))

(assert (= (and d!54455 (not c!32507)) b!181329))

(assert (= (and b!181329 res!85846) b!181332))

(assert (= (and b!181332 (not res!85845)) b!181333))

(assert (= (and b!181333 (not res!85847)) b!181331))

(declare-fun m!209337 () Bool)

(assert (=> b!181331 m!209337))

(assert (=> b!181336 m!209191))

(declare-fun m!209339 () Bool)

(assert (=> b!181336 m!209339))

(assert (=> b!181336 m!209339))

(declare-fun m!209341 () Bool)

(assert (=> b!181336 m!209341))

(assert (=> b!181332 m!209337))

(assert (=> d!54455 m!209191))

(declare-fun m!209343 () Bool)

(assert (=> d!54455 m!209343))

(assert (=> d!54455 m!209139))

(assert (=> b!181333 m!209337))

(assert (=> d!54419 d!54455))

(declare-fun d!54457 () Bool)

(declare-fun lt!89678 () (_ BitVec 32))

(declare-fun lt!89677 () (_ BitVec 32))

(assert (=> d!54457 (= lt!89678 (bvmul (bvxor lt!89677 (bvlshr lt!89677 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!54457 (= lt!89677 ((_ extract 31 0) (bvand (bvxor key!828 (bvlshr key!828 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!54457 (and (bvsge (mask!8724 thiss!1248) #b00000000000000000000000000000000) (let ((res!85848 (let ((h!2898 ((_ extract 31 0) (bvand (bvxor key!828 (bvlshr key!828 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!19787 (bvmul (bvxor h!2898 (bvlshr h!2898 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!19787 (bvlshr x!19787 #b00000000000000000000000000001101)) (mask!8724 thiss!1248)))))) (and (bvslt res!85848 (bvadd (mask!8724 thiss!1248) #b00000000000000000000000000000001)) (bvsge res!85848 #b00000000000000000000000000000000))))))

(assert (=> d!54457 (= (toIndex!0 key!828 (mask!8724 thiss!1248)) (bvand (bvxor lt!89678 (bvlshr lt!89678 #b00000000000000000000000000001101)) (mask!8724 thiss!1248)))))

(assert (=> d!54419 d!54457))

(assert (=> d!54419 d!54413))

(declare-fun b!181361 () Bool)

(declare-fun e!119442 () Bool)

(declare-fun e!119439 () Bool)

(assert (=> b!181361 (= e!119442 e!119439)))

(declare-fun c!32519 () Bool)

(declare-fun e!119444 () Bool)

(assert (=> b!181361 (= c!32519 e!119444)))

(declare-fun res!85858 () Bool)

(assert (=> b!181361 (=> (not res!85858) (not e!119444))))

(assert (=> b!181361 (= res!85858 (bvslt #b00000000000000000000000000000000 (size!3929 (_keys!5609 thiss!1248))))))

(declare-fun b!181362 () Bool)

(declare-fun e!119443 () ListLongMap!2249)

(assert (=> b!181362 (= e!119443 (ListLongMap!2250 Nil!2269))))

(declare-fun b!181363 () Bool)

(assert (=> b!181363 (= e!119444 (validKeyInArray!0 (select (arr!3620 (_keys!5609 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!181363 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!181364 () Bool)

(declare-fun e!119440 () Bool)

(assert (=> b!181364 (= e!119439 e!119440)))

(declare-fun c!32520 () Bool)

(assert (=> b!181364 (= c!32520 (bvslt #b00000000000000000000000000000000 (size!3929 (_keys!5609 thiss!1248))))))

(declare-fun b!181365 () Bool)

(declare-fun e!119441 () ListLongMap!2249)

(assert (=> b!181365 (= e!119443 e!119441)))

(declare-fun c!32518 () Bool)

(assert (=> b!181365 (= c!32518 (validKeyInArray!0 (select (arr!3620 (_keys!5609 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!181366 () Bool)

(declare-fun lt!89693 () Unit!5504)

(declare-fun lt!89696 () Unit!5504)

(assert (=> b!181366 (= lt!89693 lt!89696)))

(declare-fun lt!89699 () (_ BitVec 64))

(declare-fun lt!89697 () V!5305)

(declare-fun lt!89695 () ListLongMap!2249)

(declare-fun lt!89694 () (_ BitVec 64))

(assert (=> b!181366 (not (contains!1230 (+!271 lt!89695 (tuple2!3329 lt!89699 lt!89697)) lt!89694))))

(declare-fun addStillNotContains!84 (ListLongMap!2249 (_ BitVec 64) V!5305 (_ BitVec 64)) Unit!5504)

(assert (=> b!181366 (= lt!89696 (addStillNotContains!84 lt!89695 lt!89699 lt!89697 lt!89694))))

(assert (=> b!181366 (= lt!89694 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!181366 (= lt!89697 (get!2079 (select (arr!3621 (_values!3694 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!494 (defaultEntry!3711 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!181366 (= lt!89699 (select (arr!3620 (_keys!5609 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun call!18310 () ListLongMap!2249)

(assert (=> b!181366 (= lt!89695 call!18310)))

(assert (=> b!181366 (= e!119441 (+!271 call!18310 (tuple2!3329 (select (arr!3620 (_keys!5609 thiss!1248)) #b00000000000000000000000000000000) (get!2079 (select (arr!3621 (_values!3694 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!494 (defaultEntry!3711 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!181367 () Bool)

(assert (=> b!181367 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3929 (_keys!5609 thiss!1248))))))

(assert (=> b!181367 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3930 (_values!3694 thiss!1248))))))

(declare-fun e!119445 () Bool)

(declare-fun lt!89698 () ListLongMap!2249)

(assert (=> b!181367 (= e!119445 (= (apply!151 lt!89698 (select (arr!3620 (_keys!5609 thiss!1248)) #b00000000000000000000000000000000)) (get!2079 (select (arr!3621 (_values!3694 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!494 (defaultEntry!3711 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!181369 () Bool)

(assert (=> b!181369 (= e!119439 e!119445)))

(assert (=> b!181369 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3929 (_keys!5609 thiss!1248))))))

(declare-fun res!85859 () Bool)

(assert (=> b!181369 (= res!85859 (contains!1230 lt!89698 (select (arr!3620 (_keys!5609 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!181369 (=> (not res!85859) (not e!119445))))

(declare-fun bm!18307 () Bool)

(assert (=> bm!18307 (= call!18310 (getCurrentListMapNoExtraKeys!182 (_keys!5609 thiss!1248) (_values!3694 thiss!1248) (mask!8724 thiss!1248) (extraKeys!3448 thiss!1248) (zeroValue!3552 thiss!1248) (minValue!3552 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3711 thiss!1248)))))

(declare-fun d!54459 () Bool)

(assert (=> d!54459 e!119442))

(declare-fun res!85857 () Bool)

(assert (=> d!54459 (=> (not res!85857) (not e!119442))))

(assert (=> d!54459 (= res!85857 (not (contains!1230 lt!89698 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!54459 (= lt!89698 e!119443)))

(declare-fun c!32517 () Bool)

(assert (=> d!54459 (= c!32517 (bvsge #b00000000000000000000000000000000 (size!3929 (_keys!5609 thiss!1248))))))

(assert (=> d!54459 (validMask!0 (mask!8724 thiss!1248))))

(assert (=> d!54459 (= (getCurrentListMapNoExtraKeys!182 (_keys!5609 thiss!1248) (_values!3694 thiss!1248) (mask!8724 thiss!1248) (extraKeys!3448 thiss!1248) (zeroValue!3552 thiss!1248) (minValue!3552 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3711 thiss!1248)) lt!89698)))

(declare-fun b!181368 () Bool)

(declare-fun res!85860 () Bool)

(assert (=> b!181368 (=> (not res!85860) (not e!119442))))

(assert (=> b!181368 (= res!85860 (not (contains!1230 lt!89698 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!181370 () Bool)

(declare-fun isEmpty!464 (ListLongMap!2249) Bool)

(assert (=> b!181370 (= e!119440 (isEmpty!464 lt!89698))))

(declare-fun b!181371 () Bool)

(assert (=> b!181371 (= e!119440 (= lt!89698 (getCurrentListMapNoExtraKeys!182 (_keys!5609 thiss!1248) (_values!3694 thiss!1248) (mask!8724 thiss!1248) (extraKeys!3448 thiss!1248) (zeroValue!3552 thiss!1248) (minValue!3552 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3711 thiss!1248))))))

(declare-fun b!181372 () Bool)

(assert (=> b!181372 (= e!119441 call!18310)))

(assert (= (and d!54459 c!32517) b!181362))

(assert (= (and d!54459 (not c!32517)) b!181365))

(assert (= (and b!181365 c!32518) b!181366))

(assert (= (and b!181365 (not c!32518)) b!181372))

(assert (= (or b!181366 b!181372) bm!18307))

(assert (= (and d!54459 res!85857) b!181368))

(assert (= (and b!181368 res!85860) b!181361))

(assert (= (and b!181361 res!85858) b!181363))

(assert (= (and b!181361 c!32519) b!181369))

(assert (= (and b!181361 (not c!32519)) b!181364))

(assert (= (and b!181369 res!85859) b!181367))

(assert (= (and b!181364 c!32520) b!181371))

(assert (= (and b!181364 (not c!32520)) b!181370))

(declare-fun b_lambda!7161 () Bool)

(assert (=> (not b_lambda!7161) (not b!181366)))

(assert (=> b!181366 t!7120))

(declare-fun b_and!11035 () Bool)

(assert (= b_and!11033 (and (=> t!7120 result!4709) b_and!11035)))

(declare-fun b_lambda!7163 () Bool)

(assert (=> (not b_lambda!7163) (not b!181367)))

(assert (=> b!181367 t!7120))

(declare-fun b_and!11037 () Bool)

(assert (= b_and!11035 (and (=> t!7120 result!4709) b_and!11037)))

(assert (=> b!181367 m!209253))

(assert (=> b!181367 m!209249))

(assert (=> b!181367 m!209255))

(assert (=> b!181367 m!209225))

(declare-fun m!209345 () Bool)

(assert (=> b!181367 m!209345))

(assert (=> b!181367 m!209253))

(assert (=> b!181367 m!209225))

(assert (=> b!181367 m!209249))

(declare-fun m!209347 () Bool)

(assert (=> b!181370 m!209347))

(declare-fun m!209349 () Bool)

(assert (=> b!181371 m!209349))

(declare-fun m!209351 () Bool)

(assert (=> b!181368 m!209351))

(assert (=> b!181365 m!209225))

(assert (=> b!181365 m!209225))

(assert (=> b!181365 m!209259))

(assert (=> b!181369 m!209225))

(assert (=> b!181369 m!209225))

(declare-fun m!209353 () Bool)

(assert (=> b!181369 m!209353))

(assert (=> b!181363 m!209225))

(assert (=> b!181363 m!209225))

(assert (=> b!181363 m!209259))

(declare-fun m!209355 () Bool)

(assert (=> d!54459 m!209355))

(assert (=> d!54459 m!209139))

(assert (=> bm!18307 m!209349))

(assert (=> b!181366 m!209253))

(assert (=> b!181366 m!209249))

(assert (=> b!181366 m!209255))

(declare-fun m!209357 () Bool)

(assert (=> b!181366 m!209357))

(assert (=> b!181366 m!209357))

(declare-fun m!209359 () Bool)

(assert (=> b!181366 m!209359))

(assert (=> b!181366 m!209253))

(assert (=> b!181366 m!209225))

(assert (=> b!181366 m!209249))

(declare-fun m!209361 () Bool)

(assert (=> b!181366 m!209361))

(declare-fun m!209363 () Bool)

(assert (=> b!181366 m!209363))

(assert (=> b!181184 d!54459))

(declare-fun d!54461 () Bool)

(assert (=> d!54461 (= (apply!151 lt!89611 lt!89607) (get!2080 (getValueByKey!209 (toList!1140 lt!89611) lt!89607)))))

(declare-fun bs!7416 () Bool)

(assert (= bs!7416 d!54461))

(declare-fun m!209365 () Bool)

(assert (=> bs!7416 m!209365))

(assert (=> bs!7416 m!209365))

(declare-fun m!209367 () Bool)

(assert (=> bs!7416 m!209367))

(assert (=> b!181184 d!54461))

(declare-fun d!54463 () Bool)

(assert (=> d!54463 (= (apply!151 (+!271 lt!89611 (tuple2!3329 lt!89614 (zeroValue!3552 thiss!1248))) lt!89607) (get!2080 (getValueByKey!209 (toList!1140 (+!271 lt!89611 (tuple2!3329 lt!89614 (zeroValue!3552 thiss!1248)))) lt!89607)))))

(declare-fun bs!7417 () Bool)

(assert (= bs!7417 d!54463))

(declare-fun m!209369 () Bool)

(assert (=> bs!7417 m!209369))

(assert (=> bs!7417 m!209369))

(declare-fun m!209371 () Bool)

(assert (=> bs!7417 m!209371))

(assert (=> b!181184 d!54463))

(declare-fun d!54465 () Bool)

(assert (=> d!54465 (= (apply!151 (+!271 lt!89626 (tuple2!3329 lt!89610 (minValue!3552 thiss!1248))) lt!89609) (apply!151 lt!89626 lt!89609))))

(declare-fun lt!89702 () Unit!5504)

(declare-fun choose!968 (ListLongMap!2249 (_ BitVec 64) V!5305 (_ BitVec 64)) Unit!5504)

(assert (=> d!54465 (= lt!89702 (choose!968 lt!89626 lt!89610 (minValue!3552 thiss!1248) lt!89609))))

(declare-fun e!119448 () Bool)

(assert (=> d!54465 e!119448))

(declare-fun res!85863 () Bool)

(assert (=> d!54465 (=> (not res!85863) (not e!119448))))

(assert (=> d!54465 (= res!85863 (contains!1230 lt!89626 lt!89609))))

(assert (=> d!54465 (= (addApplyDifferent!127 lt!89626 lt!89610 (minValue!3552 thiss!1248) lt!89609) lt!89702)))

(declare-fun b!181376 () Bool)

(assert (=> b!181376 (= e!119448 (not (= lt!89609 lt!89610)))))

(assert (= (and d!54465 res!85863) b!181376))

(declare-fun m!209373 () Bool)

(assert (=> d!54465 m!209373))

(assert (=> d!54465 m!209215))

(assert (=> d!54465 m!209243))

(declare-fun m!209375 () Bool)

(assert (=> d!54465 m!209375))

(assert (=> d!54465 m!209233))

(assert (=> d!54465 m!209215))

(assert (=> b!181184 d!54465))

(declare-fun d!54467 () Bool)

(assert (=> d!54467 (= (apply!151 (+!271 lt!89611 (tuple2!3329 lt!89614 (zeroValue!3552 thiss!1248))) lt!89607) (apply!151 lt!89611 lt!89607))))

(declare-fun lt!89703 () Unit!5504)

(assert (=> d!54467 (= lt!89703 (choose!968 lt!89611 lt!89614 (zeroValue!3552 thiss!1248) lt!89607))))

(declare-fun e!119449 () Bool)

(assert (=> d!54467 e!119449))

(declare-fun res!85864 () Bool)

(assert (=> d!54467 (=> (not res!85864) (not e!119449))))

(assert (=> d!54467 (= res!85864 (contains!1230 lt!89611 lt!89607))))

(assert (=> d!54467 (= (addApplyDifferent!127 lt!89611 lt!89614 (zeroValue!3552 thiss!1248) lt!89607) lt!89703)))

(declare-fun b!181377 () Bool)

(assert (=> b!181377 (= e!119449 (not (= lt!89607 lt!89614)))))

(assert (= (and d!54467 res!85864) b!181377))

(declare-fun m!209377 () Bool)

(assert (=> d!54467 m!209377))

(assert (=> d!54467 m!209217))

(assert (=> d!54467 m!209235))

(declare-fun m!209379 () Bool)

(assert (=> d!54467 m!209379))

(assert (=> d!54467 m!209241))

(assert (=> d!54467 m!209217))

(assert (=> b!181184 d!54467))

(declare-fun d!54469 () Bool)

(assert (=> d!54469 (= (apply!151 (+!271 lt!89612 (tuple2!3329 lt!89627 (minValue!3552 thiss!1248))) lt!89621) (apply!151 lt!89612 lt!89621))))

(declare-fun lt!89704 () Unit!5504)

(assert (=> d!54469 (= lt!89704 (choose!968 lt!89612 lt!89627 (minValue!3552 thiss!1248) lt!89621))))

(declare-fun e!119450 () Bool)

(assert (=> d!54469 e!119450))

(declare-fun res!85865 () Bool)

(assert (=> d!54469 (=> (not res!85865) (not e!119450))))

(assert (=> d!54469 (= res!85865 (contains!1230 lt!89612 lt!89621))))

(assert (=> d!54469 (= (addApplyDifferent!127 lt!89612 lt!89627 (minValue!3552 thiss!1248) lt!89621) lt!89704)))

(declare-fun b!181378 () Bool)

(assert (=> b!181378 (= e!119450 (not (= lt!89621 lt!89627)))))

(assert (= (and d!54469 res!85865) b!181378))

(declare-fun m!209381 () Bool)

(assert (=> d!54469 m!209381))

(assert (=> d!54469 m!209229))

(assert (=> d!54469 m!209231))

(declare-fun m!209383 () Bool)

(assert (=> d!54469 m!209383))

(assert (=> d!54469 m!209227))

(assert (=> d!54469 m!209229))

(assert (=> b!181184 d!54469))

(declare-fun d!54471 () Bool)

(assert (=> d!54471 (= (apply!151 (+!271 lt!89612 (tuple2!3329 lt!89627 (minValue!3552 thiss!1248))) lt!89621) (get!2080 (getValueByKey!209 (toList!1140 (+!271 lt!89612 (tuple2!3329 lt!89627 (minValue!3552 thiss!1248)))) lt!89621)))))

(declare-fun bs!7418 () Bool)

(assert (= bs!7418 d!54471))

(declare-fun m!209385 () Bool)

(assert (=> bs!7418 m!209385))

(assert (=> bs!7418 m!209385))

(declare-fun m!209387 () Bool)

(assert (=> bs!7418 m!209387))

(assert (=> b!181184 d!54471))

(declare-fun d!54473 () Bool)

(declare-fun e!119451 () Bool)

(assert (=> d!54473 e!119451))

(declare-fun res!85867 () Bool)

(assert (=> d!54473 (=> (not res!85867) (not e!119451))))

(declare-fun lt!89705 () ListLongMap!2249)

(assert (=> d!54473 (= res!85867 (contains!1230 lt!89705 (_1!1675 (tuple2!3329 lt!89610 (minValue!3552 thiss!1248)))))))

(declare-fun lt!89708 () List!2272)

(assert (=> d!54473 (= lt!89705 (ListLongMap!2250 lt!89708))))

(declare-fun lt!89707 () Unit!5504)

(declare-fun lt!89706 () Unit!5504)

(assert (=> d!54473 (= lt!89707 lt!89706)))

(assert (=> d!54473 (= (getValueByKey!209 lt!89708 (_1!1675 (tuple2!3329 lt!89610 (minValue!3552 thiss!1248)))) (Some!214 (_2!1675 (tuple2!3329 lt!89610 (minValue!3552 thiss!1248)))))))

(assert (=> d!54473 (= lt!89706 (lemmaContainsTupThenGetReturnValue!111 lt!89708 (_1!1675 (tuple2!3329 lt!89610 (minValue!3552 thiss!1248))) (_2!1675 (tuple2!3329 lt!89610 (minValue!3552 thiss!1248)))))))

(assert (=> d!54473 (= lt!89708 (insertStrictlySorted!114 (toList!1140 lt!89626) (_1!1675 (tuple2!3329 lt!89610 (minValue!3552 thiss!1248))) (_2!1675 (tuple2!3329 lt!89610 (minValue!3552 thiss!1248)))))))

(assert (=> d!54473 (= (+!271 lt!89626 (tuple2!3329 lt!89610 (minValue!3552 thiss!1248))) lt!89705)))

(declare-fun b!181379 () Bool)

(declare-fun res!85866 () Bool)

(assert (=> b!181379 (=> (not res!85866) (not e!119451))))

(assert (=> b!181379 (= res!85866 (= (getValueByKey!209 (toList!1140 lt!89705) (_1!1675 (tuple2!3329 lt!89610 (minValue!3552 thiss!1248)))) (Some!214 (_2!1675 (tuple2!3329 lt!89610 (minValue!3552 thiss!1248))))))))

(declare-fun b!181380 () Bool)

(assert (=> b!181380 (= e!119451 (contains!1234 (toList!1140 lt!89705) (tuple2!3329 lt!89610 (minValue!3552 thiss!1248))))))

(assert (= (and d!54473 res!85867) b!181379))

(assert (= (and b!181379 res!85866) b!181380))

(declare-fun m!209389 () Bool)

(assert (=> d!54473 m!209389))

(declare-fun m!209391 () Bool)

(assert (=> d!54473 m!209391))

(declare-fun m!209393 () Bool)

(assert (=> d!54473 m!209393))

(declare-fun m!209395 () Bool)

(assert (=> d!54473 m!209395))

(declare-fun m!209397 () Bool)

(assert (=> b!181379 m!209397))

(declare-fun m!209399 () Bool)

(assert (=> b!181380 m!209399))

(assert (=> b!181184 d!54473))

(declare-fun d!54475 () Bool)

(assert (=> d!54475 (= (apply!151 (+!271 lt!89626 (tuple2!3329 lt!89610 (minValue!3552 thiss!1248))) lt!89609) (get!2080 (getValueByKey!209 (toList!1140 (+!271 lt!89626 (tuple2!3329 lt!89610 (minValue!3552 thiss!1248)))) lt!89609)))))

(declare-fun bs!7419 () Bool)

(assert (= bs!7419 d!54475))

(declare-fun m!209401 () Bool)

(assert (=> bs!7419 m!209401))

(assert (=> bs!7419 m!209401))

(declare-fun m!209403 () Bool)

(assert (=> bs!7419 m!209403))

(assert (=> b!181184 d!54475))

(declare-fun d!54477 () Bool)

(declare-fun e!119452 () Bool)

(assert (=> d!54477 e!119452))

(declare-fun res!85869 () Bool)

(assert (=> d!54477 (=> (not res!85869) (not e!119452))))

(declare-fun lt!89709 () ListLongMap!2249)

(assert (=> d!54477 (= res!85869 (contains!1230 lt!89709 (_1!1675 (tuple2!3329 lt!89614 (zeroValue!3552 thiss!1248)))))))

(declare-fun lt!89712 () List!2272)

(assert (=> d!54477 (= lt!89709 (ListLongMap!2250 lt!89712))))

(declare-fun lt!89711 () Unit!5504)

(declare-fun lt!89710 () Unit!5504)

(assert (=> d!54477 (= lt!89711 lt!89710)))

(assert (=> d!54477 (= (getValueByKey!209 lt!89712 (_1!1675 (tuple2!3329 lt!89614 (zeroValue!3552 thiss!1248)))) (Some!214 (_2!1675 (tuple2!3329 lt!89614 (zeroValue!3552 thiss!1248)))))))

(assert (=> d!54477 (= lt!89710 (lemmaContainsTupThenGetReturnValue!111 lt!89712 (_1!1675 (tuple2!3329 lt!89614 (zeroValue!3552 thiss!1248))) (_2!1675 (tuple2!3329 lt!89614 (zeroValue!3552 thiss!1248)))))))

(assert (=> d!54477 (= lt!89712 (insertStrictlySorted!114 (toList!1140 lt!89611) (_1!1675 (tuple2!3329 lt!89614 (zeroValue!3552 thiss!1248))) (_2!1675 (tuple2!3329 lt!89614 (zeroValue!3552 thiss!1248)))))))

(assert (=> d!54477 (= (+!271 lt!89611 (tuple2!3329 lt!89614 (zeroValue!3552 thiss!1248))) lt!89709)))

(declare-fun b!181381 () Bool)

(declare-fun res!85868 () Bool)

(assert (=> b!181381 (=> (not res!85868) (not e!119452))))

(assert (=> b!181381 (= res!85868 (= (getValueByKey!209 (toList!1140 lt!89709) (_1!1675 (tuple2!3329 lt!89614 (zeroValue!3552 thiss!1248)))) (Some!214 (_2!1675 (tuple2!3329 lt!89614 (zeroValue!3552 thiss!1248))))))))

(declare-fun b!181382 () Bool)

(assert (=> b!181382 (= e!119452 (contains!1234 (toList!1140 lt!89709) (tuple2!3329 lt!89614 (zeroValue!3552 thiss!1248))))))

(assert (= (and d!54477 res!85869) b!181381))

(assert (= (and b!181381 res!85868) b!181382))

(declare-fun m!209405 () Bool)

(assert (=> d!54477 m!209405))

(declare-fun m!209407 () Bool)

(assert (=> d!54477 m!209407))

(declare-fun m!209409 () Bool)

(assert (=> d!54477 m!209409))

(declare-fun m!209411 () Bool)

(assert (=> d!54477 m!209411))

(declare-fun m!209413 () Bool)

(assert (=> b!181381 m!209413))

(declare-fun m!209415 () Bool)

(assert (=> b!181382 m!209415))

(assert (=> b!181184 d!54477))

(declare-fun d!54479 () Bool)

(assert (=> d!54479 (= (apply!151 lt!89612 lt!89621) (get!2080 (getValueByKey!209 (toList!1140 lt!89612) lt!89621)))))

(declare-fun bs!7420 () Bool)

(assert (= bs!7420 d!54479))

(declare-fun m!209417 () Bool)

(assert (=> bs!7420 m!209417))

(assert (=> bs!7420 m!209417))

(declare-fun m!209419 () Bool)

(assert (=> bs!7420 m!209419))

(assert (=> b!181184 d!54479))

(declare-fun d!54481 () Bool)

(declare-fun e!119453 () Bool)

(assert (=> d!54481 e!119453))

(declare-fun res!85870 () Bool)

(assert (=> d!54481 (=> res!85870 e!119453)))

(declare-fun lt!89715 () Bool)

(assert (=> d!54481 (= res!85870 (not lt!89715))))

(declare-fun lt!89716 () Bool)

(assert (=> d!54481 (= lt!89715 lt!89716)))

(declare-fun lt!89714 () Unit!5504)

(declare-fun e!119454 () Unit!5504)

(assert (=> d!54481 (= lt!89714 e!119454)))

(declare-fun c!32521 () Bool)

(assert (=> d!54481 (= c!32521 lt!89716)))

(assert (=> d!54481 (= lt!89716 (containsKey!212 (toList!1140 (+!271 lt!89618 (tuple2!3329 lt!89616 (zeroValue!3552 thiss!1248)))) lt!89619))))

(assert (=> d!54481 (= (contains!1230 (+!271 lt!89618 (tuple2!3329 lt!89616 (zeroValue!3552 thiss!1248))) lt!89619) lt!89715)))

(declare-fun b!181383 () Bool)

(declare-fun lt!89713 () Unit!5504)

(assert (=> b!181383 (= e!119454 lt!89713)))

(assert (=> b!181383 (= lt!89713 (lemmaContainsKeyImpliesGetValueByKeyDefined!160 (toList!1140 (+!271 lt!89618 (tuple2!3329 lt!89616 (zeroValue!3552 thiss!1248)))) lt!89619))))

(assert (=> b!181383 (isDefined!161 (getValueByKey!209 (toList!1140 (+!271 lt!89618 (tuple2!3329 lt!89616 (zeroValue!3552 thiss!1248)))) lt!89619))))

(declare-fun b!181384 () Bool)

(declare-fun Unit!5510 () Unit!5504)

(assert (=> b!181384 (= e!119454 Unit!5510)))

(declare-fun b!181385 () Bool)

(assert (=> b!181385 (= e!119453 (isDefined!161 (getValueByKey!209 (toList!1140 (+!271 lt!89618 (tuple2!3329 lt!89616 (zeroValue!3552 thiss!1248)))) lt!89619)))))

(assert (= (and d!54481 c!32521) b!181383))

(assert (= (and d!54481 (not c!32521)) b!181384))

(assert (= (and d!54481 (not res!85870)) b!181385))

(declare-fun m!209421 () Bool)

(assert (=> d!54481 m!209421))

(declare-fun m!209423 () Bool)

(assert (=> b!181383 m!209423))

(declare-fun m!209425 () Bool)

(assert (=> b!181383 m!209425))

(assert (=> b!181383 m!209425))

(declare-fun m!209427 () Bool)

(assert (=> b!181383 m!209427))

(assert (=> b!181385 m!209425))

(assert (=> b!181385 m!209425))

(assert (=> b!181385 m!209427))

(assert (=> b!181184 d!54481))

(declare-fun d!54483 () Bool)

(assert (=> d!54483 (contains!1230 (+!271 lt!89618 (tuple2!3329 lt!89616 (zeroValue!3552 thiss!1248))) lt!89619)))

(declare-fun lt!89719 () Unit!5504)

(declare-fun choose!969 (ListLongMap!2249 (_ BitVec 64) V!5305 (_ BitVec 64)) Unit!5504)

(assert (=> d!54483 (= lt!89719 (choose!969 lt!89618 lt!89616 (zeroValue!3552 thiss!1248) lt!89619))))

(assert (=> d!54483 (contains!1230 lt!89618 lt!89619)))

(assert (=> d!54483 (= (addStillContains!127 lt!89618 lt!89616 (zeroValue!3552 thiss!1248) lt!89619) lt!89719)))

(declare-fun bs!7421 () Bool)

(assert (= bs!7421 d!54483))

(assert (=> bs!7421 m!209237))

(assert (=> bs!7421 m!209237))

(assert (=> bs!7421 m!209239))

(declare-fun m!209429 () Bool)

(assert (=> bs!7421 m!209429))

(declare-fun m!209431 () Bool)

(assert (=> bs!7421 m!209431))

(assert (=> b!181184 d!54483))

(declare-fun d!54485 () Bool)

(assert (=> d!54485 (= (apply!151 lt!89626 lt!89609) (get!2080 (getValueByKey!209 (toList!1140 lt!89626) lt!89609)))))

(declare-fun bs!7422 () Bool)

(assert (= bs!7422 d!54485))

(declare-fun m!209433 () Bool)

(assert (=> bs!7422 m!209433))

(assert (=> bs!7422 m!209433))

(declare-fun m!209435 () Bool)

(assert (=> bs!7422 m!209435))

(assert (=> b!181184 d!54485))

(declare-fun d!54487 () Bool)

(declare-fun e!119455 () Bool)

(assert (=> d!54487 e!119455))

(declare-fun res!85872 () Bool)

(assert (=> d!54487 (=> (not res!85872) (not e!119455))))

(declare-fun lt!89720 () ListLongMap!2249)

(assert (=> d!54487 (= res!85872 (contains!1230 lt!89720 (_1!1675 (tuple2!3329 lt!89627 (minValue!3552 thiss!1248)))))))

(declare-fun lt!89723 () List!2272)

(assert (=> d!54487 (= lt!89720 (ListLongMap!2250 lt!89723))))

(declare-fun lt!89722 () Unit!5504)

(declare-fun lt!89721 () Unit!5504)

(assert (=> d!54487 (= lt!89722 lt!89721)))

(assert (=> d!54487 (= (getValueByKey!209 lt!89723 (_1!1675 (tuple2!3329 lt!89627 (minValue!3552 thiss!1248)))) (Some!214 (_2!1675 (tuple2!3329 lt!89627 (minValue!3552 thiss!1248)))))))

(assert (=> d!54487 (= lt!89721 (lemmaContainsTupThenGetReturnValue!111 lt!89723 (_1!1675 (tuple2!3329 lt!89627 (minValue!3552 thiss!1248))) (_2!1675 (tuple2!3329 lt!89627 (minValue!3552 thiss!1248)))))))

(assert (=> d!54487 (= lt!89723 (insertStrictlySorted!114 (toList!1140 lt!89612) (_1!1675 (tuple2!3329 lt!89627 (minValue!3552 thiss!1248))) (_2!1675 (tuple2!3329 lt!89627 (minValue!3552 thiss!1248)))))))

(assert (=> d!54487 (= (+!271 lt!89612 (tuple2!3329 lt!89627 (minValue!3552 thiss!1248))) lt!89720)))

(declare-fun b!181387 () Bool)

(declare-fun res!85871 () Bool)

(assert (=> b!181387 (=> (not res!85871) (not e!119455))))

(assert (=> b!181387 (= res!85871 (= (getValueByKey!209 (toList!1140 lt!89720) (_1!1675 (tuple2!3329 lt!89627 (minValue!3552 thiss!1248)))) (Some!214 (_2!1675 (tuple2!3329 lt!89627 (minValue!3552 thiss!1248))))))))

(declare-fun b!181388 () Bool)

(assert (=> b!181388 (= e!119455 (contains!1234 (toList!1140 lt!89720) (tuple2!3329 lt!89627 (minValue!3552 thiss!1248))))))

(assert (= (and d!54487 res!85872) b!181387))

(assert (= (and b!181387 res!85871) b!181388))

(declare-fun m!209437 () Bool)

(assert (=> d!54487 m!209437))

(declare-fun m!209439 () Bool)

(assert (=> d!54487 m!209439))

(declare-fun m!209441 () Bool)

(assert (=> d!54487 m!209441))

(declare-fun m!209443 () Bool)

(assert (=> d!54487 m!209443))

(declare-fun m!209445 () Bool)

(assert (=> b!181387 m!209445))

(declare-fun m!209447 () Bool)

(assert (=> b!181388 m!209447))

(assert (=> b!181184 d!54487))

(declare-fun d!54489 () Bool)

(declare-fun e!119456 () Bool)

(assert (=> d!54489 e!119456))

(declare-fun res!85874 () Bool)

(assert (=> d!54489 (=> (not res!85874) (not e!119456))))

(declare-fun lt!89724 () ListLongMap!2249)

(assert (=> d!54489 (= res!85874 (contains!1230 lt!89724 (_1!1675 (tuple2!3329 lt!89616 (zeroValue!3552 thiss!1248)))))))

(declare-fun lt!89727 () List!2272)

(assert (=> d!54489 (= lt!89724 (ListLongMap!2250 lt!89727))))

(declare-fun lt!89726 () Unit!5504)

(declare-fun lt!89725 () Unit!5504)

(assert (=> d!54489 (= lt!89726 lt!89725)))

(assert (=> d!54489 (= (getValueByKey!209 lt!89727 (_1!1675 (tuple2!3329 lt!89616 (zeroValue!3552 thiss!1248)))) (Some!214 (_2!1675 (tuple2!3329 lt!89616 (zeroValue!3552 thiss!1248)))))))

(assert (=> d!54489 (= lt!89725 (lemmaContainsTupThenGetReturnValue!111 lt!89727 (_1!1675 (tuple2!3329 lt!89616 (zeroValue!3552 thiss!1248))) (_2!1675 (tuple2!3329 lt!89616 (zeroValue!3552 thiss!1248)))))))

(assert (=> d!54489 (= lt!89727 (insertStrictlySorted!114 (toList!1140 lt!89618) (_1!1675 (tuple2!3329 lt!89616 (zeroValue!3552 thiss!1248))) (_2!1675 (tuple2!3329 lt!89616 (zeroValue!3552 thiss!1248)))))))

(assert (=> d!54489 (= (+!271 lt!89618 (tuple2!3329 lt!89616 (zeroValue!3552 thiss!1248))) lt!89724)))

(declare-fun b!181389 () Bool)

(declare-fun res!85873 () Bool)

(assert (=> b!181389 (=> (not res!85873) (not e!119456))))

(assert (=> b!181389 (= res!85873 (= (getValueByKey!209 (toList!1140 lt!89724) (_1!1675 (tuple2!3329 lt!89616 (zeroValue!3552 thiss!1248)))) (Some!214 (_2!1675 (tuple2!3329 lt!89616 (zeroValue!3552 thiss!1248))))))))

(declare-fun b!181390 () Bool)

(assert (=> b!181390 (= e!119456 (contains!1234 (toList!1140 lt!89724) (tuple2!3329 lt!89616 (zeroValue!3552 thiss!1248))))))

(assert (= (and d!54489 res!85874) b!181389))

(assert (= (and b!181389 res!85873) b!181390))

(declare-fun m!209449 () Bool)

(assert (=> d!54489 m!209449))

(declare-fun m!209451 () Bool)

(assert (=> d!54489 m!209451))

(declare-fun m!209453 () Bool)

(assert (=> d!54489 m!209453))

(declare-fun m!209455 () Bool)

(assert (=> d!54489 m!209455))

(declare-fun m!209457 () Bool)

(assert (=> b!181389 m!209457))

(declare-fun m!209459 () Bool)

(assert (=> b!181390 m!209459))

(assert (=> b!181184 d!54489))

(assert (=> bm!18293 d!54459))

(assert (=> d!54425 d!54413))

(declare-fun d!54491 () Bool)

(assert (=> d!54491 (= (apply!151 lt!89613 (select (arr!3620 (_keys!5609 thiss!1248)) #b00000000000000000000000000000000)) (get!2080 (getValueByKey!209 (toList!1140 lt!89613) (select (arr!3620 (_keys!5609 thiss!1248)) #b00000000000000000000000000000000))))))

(declare-fun bs!7423 () Bool)

(assert (= bs!7423 d!54491))

(assert (=> bs!7423 m!209225))

(declare-fun m!209461 () Bool)

(assert (=> bs!7423 m!209461))

(assert (=> bs!7423 m!209461))

(declare-fun m!209463 () Bool)

(assert (=> bs!7423 m!209463))

(assert (=> b!181192 d!54491))

(declare-fun d!54493 () Bool)

(declare-fun c!32524 () Bool)

(assert (=> d!54493 (= c!32524 ((_ is ValueCellFull!1778) (select (arr!3621 (_values!3694 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun e!119459 () V!5305)

(assert (=> d!54493 (= (get!2079 (select (arr!3621 (_values!3694 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!494 (defaultEntry!3711 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)) e!119459)))

(declare-fun b!181395 () Bool)

(declare-fun get!2081 (ValueCell!1778 V!5305) V!5305)

(assert (=> b!181395 (= e!119459 (get!2081 (select (arr!3621 (_values!3694 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!494 (defaultEntry!3711 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!181396 () Bool)

(declare-fun get!2082 (ValueCell!1778 V!5305) V!5305)

(assert (=> b!181396 (= e!119459 (get!2082 (select (arr!3621 (_values!3694 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!494 (defaultEntry!3711 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!54493 c!32524) b!181395))

(assert (= (and d!54493 (not c!32524)) b!181396))

(assert (=> b!181395 m!209253))

(assert (=> b!181395 m!209249))

(declare-fun m!209465 () Bool)

(assert (=> b!181395 m!209465))

(assert (=> b!181396 m!209253))

(assert (=> b!181396 m!209249))

(declare-fun m!209467 () Bool)

(assert (=> b!181396 m!209467))

(assert (=> b!181192 d!54493))

(declare-fun d!54495 () Bool)

(declare-fun e!119460 () Bool)

(assert (=> d!54495 e!119460))

(declare-fun res!85876 () Bool)

(assert (=> d!54495 (=> (not res!85876) (not e!119460))))

(declare-fun lt!89728 () ListLongMap!2249)

(assert (=> d!54495 (= res!85876 (contains!1230 lt!89728 (_1!1675 (ite (or c!32467 c!32468) (tuple2!3329 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3552 thiss!1248)) (tuple2!3329 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3552 thiss!1248))))))))

(declare-fun lt!89731 () List!2272)

(assert (=> d!54495 (= lt!89728 (ListLongMap!2250 lt!89731))))

(declare-fun lt!89730 () Unit!5504)

(declare-fun lt!89729 () Unit!5504)

(assert (=> d!54495 (= lt!89730 lt!89729)))

(assert (=> d!54495 (= (getValueByKey!209 lt!89731 (_1!1675 (ite (or c!32467 c!32468) (tuple2!3329 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3552 thiss!1248)) (tuple2!3329 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3552 thiss!1248))))) (Some!214 (_2!1675 (ite (or c!32467 c!32468) (tuple2!3329 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3552 thiss!1248)) (tuple2!3329 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3552 thiss!1248))))))))

(assert (=> d!54495 (= lt!89729 (lemmaContainsTupThenGetReturnValue!111 lt!89731 (_1!1675 (ite (or c!32467 c!32468) (tuple2!3329 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3552 thiss!1248)) (tuple2!3329 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3552 thiss!1248)))) (_2!1675 (ite (or c!32467 c!32468) (tuple2!3329 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3552 thiss!1248)) (tuple2!3329 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3552 thiss!1248))))))))

(assert (=> d!54495 (= lt!89731 (insertStrictlySorted!114 (toList!1140 (ite c!32467 call!18298 (ite c!32468 call!18292 call!18293))) (_1!1675 (ite (or c!32467 c!32468) (tuple2!3329 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3552 thiss!1248)) (tuple2!3329 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3552 thiss!1248)))) (_2!1675 (ite (or c!32467 c!32468) (tuple2!3329 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3552 thiss!1248)) (tuple2!3329 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3552 thiss!1248))))))))

(assert (=> d!54495 (= (+!271 (ite c!32467 call!18298 (ite c!32468 call!18292 call!18293)) (ite (or c!32467 c!32468) (tuple2!3329 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3552 thiss!1248)) (tuple2!3329 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3552 thiss!1248)))) lt!89728)))

(declare-fun b!181397 () Bool)

(declare-fun res!85875 () Bool)

(assert (=> b!181397 (=> (not res!85875) (not e!119460))))

(assert (=> b!181397 (= res!85875 (= (getValueByKey!209 (toList!1140 lt!89728) (_1!1675 (ite (or c!32467 c!32468) (tuple2!3329 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3552 thiss!1248)) (tuple2!3329 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3552 thiss!1248))))) (Some!214 (_2!1675 (ite (or c!32467 c!32468) (tuple2!3329 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3552 thiss!1248)) (tuple2!3329 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3552 thiss!1248)))))))))

(declare-fun b!181398 () Bool)

(assert (=> b!181398 (= e!119460 (contains!1234 (toList!1140 lt!89728) (ite (or c!32467 c!32468) (tuple2!3329 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3552 thiss!1248)) (tuple2!3329 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3552 thiss!1248)))))))

(assert (= (and d!54495 res!85876) b!181397))

(assert (= (and b!181397 res!85875) b!181398))

(declare-fun m!209469 () Bool)

(assert (=> d!54495 m!209469))

(declare-fun m!209471 () Bool)

(assert (=> d!54495 m!209471))

(declare-fun m!209473 () Bool)

(assert (=> d!54495 m!209473))

(declare-fun m!209475 () Bool)

(assert (=> d!54495 m!209475))

(declare-fun m!209477 () Bool)

(assert (=> b!181397 m!209477))

(declare-fun m!209479 () Bool)

(assert (=> b!181398 m!209479))

(assert (=> bm!18291 d!54495))

(declare-fun d!54497 () Bool)

(assert (=> d!54497 (isDefined!161 (getValueByKey!209 (toList!1140 (getCurrentListMap!792 (_keys!5609 thiss!1248) (_values!3694 thiss!1248) (mask!8724 thiss!1248) (extraKeys!3448 thiss!1248) (zeroValue!3552 thiss!1248) (minValue!3552 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3711 thiss!1248))) key!828))))

(declare-fun lt!89734 () Unit!5504)

(declare-fun choose!970 (List!2272 (_ BitVec 64)) Unit!5504)

(assert (=> d!54497 (= lt!89734 (choose!970 (toList!1140 (getCurrentListMap!792 (_keys!5609 thiss!1248) (_values!3694 thiss!1248) (mask!8724 thiss!1248) (extraKeys!3448 thiss!1248) (zeroValue!3552 thiss!1248) (minValue!3552 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3711 thiss!1248))) key!828))))

(declare-fun e!119463 () Bool)

(assert (=> d!54497 e!119463))

(declare-fun res!85879 () Bool)

(assert (=> d!54497 (=> (not res!85879) (not e!119463))))

(declare-fun isStrictlySorted!329 (List!2272) Bool)

(assert (=> d!54497 (= res!85879 (isStrictlySorted!329 (toList!1140 (getCurrentListMap!792 (_keys!5609 thiss!1248) (_values!3694 thiss!1248) (mask!8724 thiss!1248) (extraKeys!3448 thiss!1248) (zeroValue!3552 thiss!1248) (minValue!3552 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3711 thiss!1248)))))))

(assert (=> d!54497 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!160 (toList!1140 (getCurrentListMap!792 (_keys!5609 thiss!1248) (_values!3694 thiss!1248) (mask!8724 thiss!1248) (extraKeys!3448 thiss!1248) (zeroValue!3552 thiss!1248) (minValue!3552 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3711 thiss!1248))) key!828) lt!89734)))

(declare-fun b!181401 () Bool)

(assert (=> b!181401 (= e!119463 (containsKey!212 (toList!1140 (getCurrentListMap!792 (_keys!5609 thiss!1248) (_values!3694 thiss!1248) (mask!8724 thiss!1248) (extraKeys!3448 thiss!1248) (zeroValue!3552 thiss!1248) (minValue!3552 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3711 thiss!1248))) key!828))))

(assert (= (and d!54497 res!85879) b!181401))

(assert (=> d!54497 m!209211))

(assert (=> d!54497 m!209211))

(assert (=> d!54497 m!209213))

(declare-fun m!209481 () Bool)

(assert (=> d!54497 m!209481))

(declare-fun m!209483 () Bool)

(assert (=> d!54497 m!209483))

(assert (=> b!181401 m!209207))

(assert (=> b!181135 d!54497))

(assert (=> b!181135 d!54451))

(assert (=> b!181135 d!54453))

(assert (=> b!181193 d!54449))

(declare-fun d!54499 () Bool)

(declare-fun e!119464 () Bool)

(assert (=> d!54499 e!119464))

(declare-fun res!85880 () Bool)

(assert (=> d!54499 (=> res!85880 e!119464)))

(declare-fun lt!89737 () Bool)

(assert (=> d!54499 (= res!85880 (not lt!89737))))

(declare-fun lt!89738 () Bool)

(assert (=> d!54499 (= lt!89737 lt!89738)))

(declare-fun lt!89736 () Unit!5504)

(declare-fun e!119465 () Unit!5504)

(assert (=> d!54499 (= lt!89736 e!119465)))

(declare-fun c!32525 () Bool)

(assert (=> d!54499 (= c!32525 lt!89738)))

(assert (=> d!54499 (= lt!89738 (containsKey!212 (toList!1140 lt!89613) (select (arr!3620 (_keys!5609 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> d!54499 (= (contains!1230 lt!89613 (select (arr!3620 (_keys!5609 thiss!1248)) #b00000000000000000000000000000000)) lt!89737)))

(declare-fun b!181402 () Bool)

(declare-fun lt!89735 () Unit!5504)

(assert (=> b!181402 (= e!119465 lt!89735)))

(assert (=> b!181402 (= lt!89735 (lemmaContainsKeyImpliesGetValueByKeyDefined!160 (toList!1140 lt!89613) (select (arr!3620 (_keys!5609 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!181402 (isDefined!161 (getValueByKey!209 (toList!1140 lt!89613) (select (arr!3620 (_keys!5609 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!181403 () Bool)

(declare-fun Unit!5511 () Unit!5504)

(assert (=> b!181403 (= e!119465 Unit!5511)))

(declare-fun b!181404 () Bool)

(assert (=> b!181404 (= e!119464 (isDefined!161 (getValueByKey!209 (toList!1140 lt!89613) (select (arr!3620 (_keys!5609 thiss!1248)) #b00000000000000000000000000000000))))))

(assert (= (and d!54499 c!32525) b!181402))

(assert (= (and d!54499 (not c!32525)) b!181403))

(assert (= (and d!54499 (not res!85880)) b!181404))

(assert (=> d!54499 m!209225))

(declare-fun m!209485 () Bool)

(assert (=> d!54499 m!209485))

(assert (=> b!181402 m!209225))

(declare-fun m!209487 () Bool)

(assert (=> b!181402 m!209487))

(assert (=> b!181402 m!209225))

(assert (=> b!181402 m!209461))

(assert (=> b!181402 m!209461))

(declare-fun m!209489 () Bool)

(assert (=> b!181402 m!209489))

(assert (=> b!181404 m!209225))

(assert (=> b!181404 m!209461))

(assert (=> b!181404 m!209461))

(assert (=> b!181404 m!209489))

(assert (=> b!181182 d!54499))

(declare-fun b!181406 () Bool)

(declare-fun e!119466 () Bool)

(assert (=> b!181406 (= e!119466 tp_is_empty!4243)))

(declare-fun b!181405 () Bool)

(declare-fun e!119467 () Bool)

(assert (=> b!181405 (= e!119467 tp_is_empty!4243)))

(declare-fun mapIsEmpty!7281 () Bool)

(declare-fun mapRes!7281 () Bool)

(assert (=> mapIsEmpty!7281 mapRes!7281))

(declare-fun condMapEmpty!7281 () Bool)

(declare-fun mapDefault!7281 () ValueCell!1778)

(assert (=> mapNonEmpty!7280 (= condMapEmpty!7281 (= mapRest!7280 ((as const (Array (_ BitVec 32) ValueCell!1778)) mapDefault!7281)))))

(assert (=> mapNonEmpty!7280 (= tp!16172 (and e!119466 mapRes!7281))))

(declare-fun mapNonEmpty!7281 () Bool)

(declare-fun tp!16173 () Bool)

(assert (=> mapNonEmpty!7281 (= mapRes!7281 (and tp!16173 e!119467))))

(declare-fun mapValue!7281 () ValueCell!1778)

(declare-fun mapKey!7281 () (_ BitVec 32))

(declare-fun mapRest!7281 () (Array (_ BitVec 32) ValueCell!1778))

(assert (=> mapNonEmpty!7281 (= mapRest!7280 (store mapRest!7281 mapKey!7281 mapValue!7281))))

(assert (= (and mapNonEmpty!7280 condMapEmpty!7281) mapIsEmpty!7281))

(assert (= (and mapNonEmpty!7280 (not condMapEmpty!7281)) mapNonEmpty!7281))

(assert (= (and mapNonEmpty!7281 ((_ is ValueCellFull!1778) mapValue!7281)) b!181405))

(assert (= (and mapNonEmpty!7280 ((_ is ValueCellFull!1778) mapDefault!7281)) b!181406))

(declare-fun m!209491 () Bool)

(assert (=> mapNonEmpty!7281 m!209491))

(declare-fun b_lambda!7165 () Bool)

(assert (= b_lambda!7163 (or (and b!181042 b_free!4471) b_lambda!7165)))

(declare-fun b_lambda!7167 () Bool)

(assert (= b_lambda!7161 (or (and b!181042 b_free!4471) b_lambda!7167)))

(check-sat (not b!181262) (not d!54447) (not d!54479) (not d!54489) (not b!181388) (not d!54433) (not b!181368) (not b!181369) (not bm!18301) (not d!54497) b_and!11037 (not b!181365) (not b!181381) (not d!54467) (not b_lambda!7165) (not d!54461) (not b!181227) (not b!181225) (not b!181249) (not d!54465) (not d!54459) (not d!54491) (not b!181395) (not d!54485) (not d!54495) (not b_lambda!7159) (not bm!18304) (not b!181389) (not b!181404) (not d!54463) (not d!54469) (not d!54475) (not b!181293) (not b!181371) tp_is_empty!4243 (not d!54477) (not b!181239) (not b!181248) (not b!181279) (not b!181382) (not b!181387) (not d!54441) (not bm!18298) (not b!181282) (not b!181398) (not d!54481) (not b!181385) (not b!181379) (not b!181297) (not b!181402) (not b!181390) (not b!181292) (not b!181280) (not b!181241) (not d!54471) (not b!181383) (not b!181396) (not d!54483) (not d!54473) (not b_lambda!7167) (not d!54439) (not d!54499) (not d!54451) (not b!181363) (not b!181308) (not d!54487) (not b!181397) (not b!181380) (not b!181216) (not b!181370) (not d!54455) (not b_next!4471) (not d!54445) (not b!181366) (not d!54435) (not b!181401) (not d!54443) (not mapNonEmpty!7281) (not b!181336) (not bm!18307) (not b!181367) (not b!181242) (not b!181295))
(check-sat b_and!11037 (not b_next!4471))
