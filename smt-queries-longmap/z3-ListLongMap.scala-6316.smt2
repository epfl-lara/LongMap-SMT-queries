; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!81080 () Bool)

(assert start!81080)

(declare-fun b!949126 () Bool)

(declare-fun b_free!18217 () Bool)

(declare-fun b_next!18217 () Bool)

(assert (=> b!949126 (= b_free!18217 (not b_next!18217))))

(declare-fun tp!63237 () Bool)

(declare-fun b_and!29637 () Bool)

(assert (=> b!949126 (= tp!63237 b_and!29637)))

(declare-fun b!949119 () Bool)

(declare-fun res!636589 () Bool)

(declare-fun e!534313 () Bool)

(assert (=> b!949119 (=> (not res!636589) (not e!534313))))

(declare-datatypes ((V!32599 0))(
  ( (V!32600 (val!10413 Int)) )
))
(declare-datatypes ((ValueCell!9881 0))(
  ( (ValueCellFull!9881 (v!12952 V!32599)) (EmptyCell!9881) )
))
(declare-datatypes ((array!57427 0))(
  ( (array!57428 (arr!27617 (Array (_ BitVec 32) ValueCell!9881)) (size!28095 (_ BitVec 32))) )
))
(declare-datatypes ((array!57429 0))(
  ( (array!57430 (arr!27618 (Array (_ BitVec 32) (_ BitVec 64))) (size!28096 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4912 0))(
  ( (LongMapFixedSize!4913 (defaultEntry!5763 Int) (mask!27536 (_ BitVec 32)) (extraKeys!5495 (_ BitVec 32)) (zeroValue!5599 V!32599) (minValue!5599 V!32599) (_size!2511 (_ BitVec 32)) (_keys!10686 array!57429) (_values!5786 array!57427) (_vacant!2511 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4912)

(declare-fun key!756 () (_ BitVec 64))

(declare-datatypes ((tuple2!13582 0))(
  ( (tuple2!13583 (_1!6802 (_ BitVec 64)) (_2!6802 V!32599)) )
))
(declare-datatypes ((List!19330 0))(
  ( (Nil!19327) (Cons!19326 (h!20485 tuple2!13582) (t!27654 List!19330)) )
))
(declare-datatypes ((ListLongMap!12269 0))(
  ( (ListLongMap!12270 (toList!6150 List!19330)) )
))
(declare-fun contains!5181 (ListLongMap!12269 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3312 (array!57429 array!57427 (_ BitVec 32) (_ BitVec 32) V!32599 V!32599 (_ BitVec 32) Int) ListLongMap!12269)

(assert (=> b!949119 (= res!636589 (contains!5181 (getCurrentListMap!3312 (_keys!10686 thiss!1141) (_values!5786 thiss!1141) (mask!27536 thiss!1141) (extraKeys!5495 thiss!1141) (zeroValue!5599 thiss!1141) (minValue!5599 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5763 thiss!1141)) key!756))))

(declare-fun b!949120 () Bool)

(declare-fun e!534318 () Bool)

(declare-fun e!534315 () Bool)

(declare-fun mapRes!32989 () Bool)

(assert (=> b!949120 (= e!534318 (and e!534315 mapRes!32989))))

(declare-fun condMapEmpty!32989 () Bool)

(declare-fun mapDefault!32989 () ValueCell!9881)

(assert (=> b!949120 (= condMapEmpty!32989 (= (arr!27617 (_values!5786 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9881)) mapDefault!32989)))))

(declare-fun b!949121 () Bool)

(declare-fun tp_is_empty!20725 () Bool)

(assert (=> b!949121 (= e!534315 tp_is_empty!20725)))

(declare-fun b!949122 () Bool)

(declare-fun e!534314 () Bool)

(assert (=> b!949122 (= e!534314 tp_is_empty!20725)))

(declare-fun b!949123 () Bool)

(assert (=> b!949123 (= e!534313 (and (= (size!28095 (_values!5786 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27536 thiss!1141))) (= (size!28096 (_keys!10686 thiss!1141)) (size!28095 (_values!5786 thiss!1141))) (bvsge (mask!27536 thiss!1141) #b00000000000000000000000000000000) (bvsge (extraKeys!5495 thiss!1141) #b00000000000000000000000000000000) (bvsgt (extraKeys!5495 thiss!1141) #b00000000000000000000000000000011)))))

(declare-fun b!949124 () Bool)

(declare-fun res!636590 () Bool)

(assert (=> b!949124 (=> (not res!636590) (not e!534313))))

(assert (=> b!949124 (= res!636590 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!949125 () Bool)

(declare-fun res!636587 () Bool)

(assert (=> b!949125 (=> (not res!636587) (not e!534313))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!949125 (= res!636587 (validMask!0 (mask!27536 thiss!1141)))))

(declare-fun e!534317 () Bool)

(declare-fun array_inv!21496 (array!57429) Bool)

(declare-fun array_inv!21497 (array!57427) Bool)

(assert (=> b!949126 (= e!534317 (and tp!63237 tp_is_empty!20725 (array_inv!21496 (_keys!10686 thiss!1141)) (array_inv!21497 (_values!5786 thiss!1141)) e!534318))))

(declare-fun b!949127 () Bool)

(declare-fun res!636591 () Bool)

(assert (=> b!949127 (=> (not res!636591) (not e!534313))))

(get-info :version)

(declare-datatypes ((SeekEntryResult!9132 0))(
  ( (MissingZero!9132 (index!38899 (_ BitVec 32))) (Found!9132 (index!38900 (_ BitVec 32))) (Intermediate!9132 (undefined!9944 Bool) (index!38901 (_ BitVec 32)) (x!81675 (_ BitVec 32))) (Undefined!9132) (MissingVacant!9132 (index!38902 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!57429 (_ BitVec 32)) SeekEntryResult!9132)

(assert (=> b!949127 (= res!636591 (not ((_ is Found!9132) (seekEntry!0 key!756 (_keys!10686 thiss!1141) (mask!27536 thiss!1141)))))))

(declare-fun mapNonEmpty!32989 () Bool)

(declare-fun tp!63238 () Bool)

(assert (=> mapNonEmpty!32989 (= mapRes!32989 (and tp!63238 e!534314))))

(declare-fun mapValue!32989 () ValueCell!9881)

(declare-fun mapRest!32989 () (Array (_ BitVec 32) ValueCell!9881))

(declare-fun mapKey!32989 () (_ BitVec 32))

(assert (=> mapNonEmpty!32989 (= (arr!27617 (_values!5786 thiss!1141)) (store mapRest!32989 mapKey!32989 mapValue!32989))))

(declare-fun mapIsEmpty!32989 () Bool)

(assert (=> mapIsEmpty!32989 mapRes!32989))

(declare-fun res!636588 () Bool)

(assert (=> start!81080 (=> (not res!636588) (not e!534313))))

(declare-fun valid!1874 (LongMapFixedSize!4912) Bool)

(assert (=> start!81080 (= res!636588 (valid!1874 thiss!1141))))

(assert (=> start!81080 e!534313))

(assert (=> start!81080 e!534317))

(assert (=> start!81080 true))

(assert (= (and start!81080 res!636588) b!949124))

(assert (= (and b!949124 res!636590) b!949127))

(assert (= (and b!949127 res!636591) b!949119))

(assert (= (and b!949119 res!636589) b!949125))

(assert (= (and b!949125 res!636587) b!949123))

(assert (= (and b!949120 condMapEmpty!32989) mapIsEmpty!32989))

(assert (= (and b!949120 (not condMapEmpty!32989)) mapNonEmpty!32989))

(assert (= (and mapNonEmpty!32989 ((_ is ValueCellFull!9881) mapValue!32989)) b!949122))

(assert (= (and b!949120 ((_ is ValueCellFull!9881) mapDefault!32989)) b!949121))

(assert (= b!949126 b!949120))

(assert (= start!81080 b!949126))

(declare-fun m!881261 () Bool)

(assert (=> b!949125 m!881261))

(declare-fun m!881263 () Bool)

(assert (=> start!81080 m!881263))

(declare-fun m!881265 () Bool)

(assert (=> b!949119 m!881265))

(assert (=> b!949119 m!881265))

(declare-fun m!881267 () Bool)

(assert (=> b!949119 m!881267))

(declare-fun m!881269 () Bool)

(assert (=> b!949127 m!881269))

(declare-fun m!881271 () Bool)

(assert (=> b!949126 m!881271))

(declare-fun m!881273 () Bool)

(assert (=> b!949126 m!881273))

(declare-fun m!881275 () Bool)

(assert (=> mapNonEmpty!32989 m!881275))

(check-sat (not b!949125) (not start!81080) (not b_next!18217) b_and!29637 (not b!949119) (not b!949127) (not b!949126) tp_is_empty!20725 (not mapNonEmpty!32989))
(check-sat b_and!29637 (not b_next!18217))
(get-model)

(declare-fun d!114839 () Bool)

(declare-fun res!636628 () Bool)

(declare-fun e!534357 () Bool)

(assert (=> d!114839 (=> (not res!636628) (not e!534357))))

(declare-fun simpleValid!371 (LongMapFixedSize!4912) Bool)

(assert (=> d!114839 (= res!636628 (simpleValid!371 thiss!1141))))

(assert (=> d!114839 (= (valid!1874 thiss!1141) e!534357)))

(declare-fun b!949188 () Bool)

(declare-fun res!636629 () Bool)

(assert (=> b!949188 (=> (not res!636629) (not e!534357))))

(declare-fun arrayCountValidKeys!0 (array!57429 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!949188 (= res!636629 (= (arrayCountValidKeys!0 (_keys!10686 thiss!1141) #b00000000000000000000000000000000 (size!28096 (_keys!10686 thiss!1141))) (_size!2511 thiss!1141)))))

(declare-fun b!949189 () Bool)

(declare-fun res!636630 () Bool)

(assert (=> b!949189 (=> (not res!636630) (not e!534357))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57429 (_ BitVec 32)) Bool)

(assert (=> b!949189 (= res!636630 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10686 thiss!1141) (mask!27536 thiss!1141)))))

(declare-fun b!949190 () Bool)

(declare-datatypes ((List!19332 0))(
  ( (Nil!19329) (Cons!19328 (h!20487 (_ BitVec 64)) (t!27658 List!19332)) )
))
(declare-fun arrayNoDuplicates!0 (array!57429 (_ BitVec 32) List!19332) Bool)

(assert (=> b!949190 (= e!534357 (arrayNoDuplicates!0 (_keys!10686 thiss!1141) #b00000000000000000000000000000000 Nil!19329))))

(assert (= (and d!114839 res!636628) b!949188))

(assert (= (and b!949188 res!636629) b!949189))

(assert (= (and b!949189 res!636630) b!949190))

(declare-fun m!881309 () Bool)

(assert (=> d!114839 m!881309))

(declare-fun m!881311 () Bool)

(assert (=> b!949188 m!881311))

(declare-fun m!881313 () Bool)

(assert (=> b!949189 m!881313))

(declare-fun m!881315 () Bool)

(assert (=> b!949190 m!881315))

(assert (=> start!81080 d!114839))

(declare-fun b!949203 () Bool)

(declare-fun e!534366 () SeekEntryResult!9132)

(declare-fun lt!427307 () SeekEntryResult!9132)

(assert (=> b!949203 (= e!534366 (Found!9132 (index!38901 lt!427307)))))

(declare-fun b!949204 () Bool)

(declare-fun c!99005 () Bool)

(declare-fun lt!427306 () (_ BitVec 64))

(assert (=> b!949204 (= c!99005 (= lt!427306 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!534365 () SeekEntryResult!9132)

(assert (=> b!949204 (= e!534366 e!534365)))

(declare-fun b!949205 () Bool)

(assert (=> b!949205 (= e!534365 (MissingZero!9132 (index!38901 lt!427307)))))

(declare-fun b!949206 () Bool)

(declare-fun e!534364 () SeekEntryResult!9132)

(assert (=> b!949206 (= e!534364 Undefined!9132)))

(declare-fun b!949207 () Bool)

(declare-fun lt!427304 () SeekEntryResult!9132)

(assert (=> b!949207 (= e!534365 (ite ((_ is MissingVacant!9132) lt!427304) (MissingZero!9132 (index!38902 lt!427304)) lt!427304))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!57429 (_ BitVec 32)) SeekEntryResult!9132)

(assert (=> b!949207 (= lt!427304 (seekKeyOrZeroReturnVacant!0 (x!81675 lt!427307) (index!38901 lt!427307) (index!38901 lt!427307) key!756 (_keys!10686 thiss!1141) (mask!27536 thiss!1141)))))

(declare-fun d!114841 () Bool)

(declare-fun lt!427305 () SeekEntryResult!9132)

(assert (=> d!114841 (and (or ((_ is MissingVacant!9132) lt!427305) (not ((_ is Found!9132) lt!427305)) (and (bvsge (index!38900 lt!427305) #b00000000000000000000000000000000) (bvslt (index!38900 lt!427305) (size!28096 (_keys!10686 thiss!1141))))) (not ((_ is MissingVacant!9132) lt!427305)) (or (not ((_ is Found!9132) lt!427305)) (= (select (arr!27618 (_keys!10686 thiss!1141)) (index!38900 lt!427305)) key!756)))))

(assert (=> d!114841 (= lt!427305 e!534364)))

(declare-fun c!99007 () Bool)

(assert (=> d!114841 (= c!99007 (and ((_ is Intermediate!9132) lt!427307) (undefined!9944 lt!427307)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!57429 (_ BitVec 32)) SeekEntryResult!9132)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!114841 (= lt!427307 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!756 (mask!27536 thiss!1141)) key!756 (_keys!10686 thiss!1141) (mask!27536 thiss!1141)))))

(assert (=> d!114841 (validMask!0 (mask!27536 thiss!1141))))

(assert (=> d!114841 (= (seekEntry!0 key!756 (_keys!10686 thiss!1141) (mask!27536 thiss!1141)) lt!427305)))

(declare-fun b!949208 () Bool)

(assert (=> b!949208 (= e!534364 e!534366)))

(assert (=> b!949208 (= lt!427306 (select (arr!27618 (_keys!10686 thiss!1141)) (index!38901 lt!427307)))))

(declare-fun c!99006 () Bool)

(assert (=> b!949208 (= c!99006 (= lt!427306 key!756))))

(assert (= (and d!114841 c!99007) b!949206))

(assert (= (and d!114841 (not c!99007)) b!949208))

(assert (= (and b!949208 c!99006) b!949203))

(assert (= (and b!949208 (not c!99006)) b!949204))

(assert (= (and b!949204 c!99005) b!949205))

(assert (= (and b!949204 (not c!99005)) b!949207))

(declare-fun m!881317 () Bool)

(assert (=> b!949207 m!881317))

(declare-fun m!881319 () Bool)

(assert (=> d!114841 m!881319))

(declare-fun m!881321 () Bool)

(assert (=> d!114841 m!881321))

(assert (=> d!114841 m!881321))

(declare-fun m!881323 () Bool)

(assert (=> d!114841 m!881323))

(assert (=> d!114841 m!881261))

(declare-fun m!881325 () Bool)

(assert (=> b!949208 m!881325))

(assert (=> b!949127 d!114841))

(declare-fun d!114843 () Bool)

(declare-fun e!534372 () Bool)

(assert (=> d!114843 e!534372))

(declare-fun res!636633 () Bool)

(assert (=> d!114843 (=> res!636633 e!534372)))

(declare-fun lt!427317 () Bool)

(assert (=> d!114843 (= res!636633 (not lt!427317))))

(declare-fun lt!427318 () Bool)

(assert (=> d!114843 (= lt!427317 lt!427318)))

(declare-datatypes ((Unit!31851 0))(
  ( (Unit!31852) )
))
(declare-fun lt!427319 () Unit!31851)

(declare-fun e!534371 () Unit!31851)

(assert (=> d!114843 (= lt!427319 e!534371)))

(declare-fun c!99010 () Bool)

(assert (=> d!114843 (= c!99010 lt!427318)))

(declare-fun containsKey!461 (List!19330 (_ BitVec 64)) Bool)

(assert (=> d!114843 (= lt!427318 (containsKey!461 (toList!6150 (getCurrentListMap!3312 (_keys!10686 thiss!1141) (_values!5786 thiss!1141) (mask!27536 thiss!1141) (extraKeys!5495 thiss!1141) (zeroValue!5599 thiss!1141) (minValue!5599 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5763 thiss!1141))) key!756))))

(assert (=> d!114843 (= (contains!5181 (getCurrentListMap!3312 (_keys!10686 thiss!1141) (_values!5786 thiss!1141) (mask!27536 thiss!1141) (extraKeys!5495 thiss!1141) (zeroValue!5599 thiss!1141) (minValue!5599 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5763 thiss!1141)) key!756) lt!427317)))

(declare-fun b!949215 () Bool)

(declare-fun lt!427316 () Unit!31851)

(assert (=> b!949215 (= e!534371 lt!427316)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!356 (List!19330 (_ BitVec 64)) Unit!31851)

(assert (=> b!949215 (= lt!427316 (lemmaContainsKeyImpliesGetValueByKeyDefined!356 (toList!6150 (getCurrentListMap!3312 (_keys!10686 thiss!1141) (_values!5786 thiss!1141) (mask!27536 thiss!1141) (extraKeys!5495 thiss!1141) (zeroValue!5599 thiss!1141) (minValue!5599 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5763 thiss!1141))) key!756))))

(declare-datatypes ((Option!503 0))(
  ( (Some!502 (v!12955 V!32599)) (None!501) )
))
(declare-fun isDefined!369 (Option!503) Bool)

(declare-fun getValueByKey!497 (List!19330 (_ BitVec 64)) Option!503)

(assert (=> b!949215 (isDefined!369 (getValueByKey!497 (toList!6150 (getCurrentListMap!3312 (_keys!10686 thiss!1141) (_values!5786 thiss!1141) (mask!27536 thiss!1141) (extraKeys!5495 thiss!1141) (zeroValue!5599 thiss!1141) (minValue!5599 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5763 thiss!1141))) key!756))))

(declare-fun b!949216 () Bool)

(declare-fun Unit!31853 () Unit!31851)

(assert (=> b!949216 (= e!534371 Unit!31853)))

(declare-fun b!949217 () Bool)

(assert (=> b!949217 (= e!534372 (isDefined!369 (getValueByKey!497 (toList!6150 (getCurrentListMap!3312 (_keys!10686 thiss!1141) (_values!5786 thiss!1141) (mask!27536 thiss!1141) (extraKeys!5495 thiss!1141) (zeroValue!5599 thiss!1141) (minValue!5599 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5763 thiss!1141))) key!756)))))

(assert (= (and d!114843 c!99010) b!949215))

(assert (= (and d!114843 (not c!99010)) b!949216))

(assert (= (and d!114843 (not res!636633)) b!949217))

(declare-fun m!881327 () Bool)

(assert (=> d!114843 m!881327))

(declare-fun m!881329 () Bool)

(assert (=> b!949215 m!881329))

(declare-fun m!881331 () Bool)

(assert (=> b!949215 m!881331))

(assert (=> b!949215 m!881331))

(declare-fun m!881333 () Bool)

(assert (=> b!949215 m!881333))

(assert (=> b!949217 m!881331))

(assert (=> b!949217 m!881331))

(assert (=> b!949217 m!881333))

(assert (=> b!949119 d!114843))

(declare-fun bm!41272 () Bool)

(declare-fun call!41279 () ListLongMap!12269)

(declare-fun call!41281 () ListLongMap!12269)

(assert (=> bm!41272 (= call!41279 call!41281)))

(declare-fun c!99023 () Bool)

(declare-fun c!99027 () Bool)

(declare-fun call!41277 () ListLongMap!12269)

(declare-fun call!41276 () ListLongMap!12269)

(declare-fun bm!41273 () Bool)

(declare-fun +!2878 (ListLongMap!12269 tuple2!13582) ListLongMap!12269)

(assert (=> bm!41273 (= call!41276 (+!2878 (ite c!99027 call!41277 (ite c!99023 call!41281 call!41279)) (ite (or c!99027 c!99023) (tuple2!13583 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5599 thiss!1141)) (tuple2!13583 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5599 thiss!1141)))))))

(declare-fun bm!41274 () Bool)

(declare-fun call!41280 () Bool)

(declare-fun lt!427369 () ListLongMap!12269)

(assert (=> bm!41274 (= call!41280 (contains!5181 lt!427369 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!949260 () Bool)

(declare-fun e!534403 () Bool)

(assert (=> b!949260 (= e!534403 (not call!41280))))

(declare-fun b!949261 () Bool)

(declare-fun e!534404 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!949261 (= e!534404 (validKeyInArray!0 (select (arr!27618 (_keys!10686 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!949262 () Bool)

(declare-fun e!534399 () Bool)

(declare-fun e!534410 () Bool)

(assert (=> b!949262 (= e!534399 e!534410)))

(declare-fun res!636659 () Bool)

(assert (=> b!949262 (=> (not res!636659) (not e!534410))))

(assert (=> b!949262 (= res!636659 (contains!5181 lt!427369 (select (arr!27618 (_keys!10686 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (=> b!949262 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28096 (_keys!10686 thiss!1141))))))

(declare-fun b!949263 () Bool)

(declare-fun e!534406 () Unit!31851)

(declare-fun lt!427378 () Unit!31851)

(assert (=> b!949263 (= e!534406 lt!427378)))

(declare-fun lt!427384 () ListLongMap!12269)

(declare-fun getCurrentListMapNoExtraKeys!3350 (array!57429 array!57427 (_ BitVec 32) (_ BitVec 32) V!32599 V!32599 (_ BitVec 32) Int) ListLongMap!12269)

(assert (=> b!949263 (= lt!427384 (getCurrentListMapNoExtraKeys!3350 (_keys!10686 thiss!1141) (_values!5786 thiss!1141) (mask!27536 thiss!1141) (extraKeys!5495 thiss!1141) (zeroValue!5599 thiss!1141) (minValue!5599 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5763 thiss!1141)))))

(declare-fun lt!427380 () (_ BitVec 64))

(assert (=> b!949263 (= lt!427380 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!427383 () (_ BitVec 64))

(assert (=> b!949263 (= lt!427383 (select (arr!27618 (_keys!10686 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!427385 () Unit!31851)

(declare-fun addStillContains!567 (ListLongMap!12269 (_ BitVec 64) V!32599 (_ BitVec 64)) Unit!31851)

(assert (=> b!949263 (= lt!427385 (addStillContains!567 lt!427384 lt!427380 (zeroValue!5599 thiss!1141) lt!427383))))

(assert (=> b!949263 (contains!5181 (+!2878 lt!427384 (tuple2!13583 lt!427380 (zeroValue!5599 thiss!1141))) lt!427383)))

(declare-fun lt!427368 () Unit!31851)

(assert (=> b!949263 (= lt!427368 lt!427385)))

(declare-fun lt!427382 () ListLongMap!12269)

(assert (=> b!949263 (= lt!427382 (getCurrentListMapNoExtraKeys!3350 (_keys!10686 thiss!1141) (_values!5786 thiss!1141) (mask!27536 thiss!1141) (extraKeys!5495 thiss!1141) (zeroValue!5599 thiss!1141) (minValue!5599 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5763 thiss!1141)))))

(declare-fun lt!427374 () (_ BitVec 64))

(assert (=> b!949263 (= lt!427374 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!427377 () (_ BitVec 64))

(assert (=> b!949263 (= lt!427377 (select (arr!27618 (_keys!10686 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!427376 () Unit!31851)

(declare-fun addApplyDifferent!447 (ListLongMap!12269 (_ BitVec 64) V!32599 (_ BitVec 64)) Unit!31851)

(assert (=> b!949263 (= lt!427376 (addApplyDifferent!447 lt!427382 lt!427374 (minValue!5599 thiss!1141) lt!427377))))

(declare-fun apply!868 (ListLongMap!12269 (_ BitVec 64)) V!32599)

(assert (=> b!949263 (= (apply!868 (+!2878 lt!427382 (tuple2!13583 lt!427374 (minValue!5599 thiss!1141))) lt!427377) (apply!868 lt!427382 lt!427377))))

(declare-fun lt!427370 () Unit!31851)

(assert (=> b!949263 (= lt!427370 lt!427376)))

(declare-fun lt!427371 () ListLongMap!12269)

(assert (=> b!949263 (= lt!427371 (getCurrentListMapNoExtraKeys!3350 (_keys!10686 thiss!1141) (_values!5786 thiss!1141) (mask!27536 thiss!1141) (extraKeys!5495 thiss!1141) (zeroValue!5599 thiss!1141) (minValue!5599 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5763 thiss!1141)))))

(declare-fun lt!427373 () (_ BitVec 64))

(assert (=> b!949263 (= lt!427373 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!427367 () (_ BitVec 64))

(assert (=> b!949263 (= lt!427367 (select (arr!27618 (_keys!10686 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!427372 () Unit!31851)

(assert (=> b!949263 (= lt!427372 (addApplyDifferent!447 lt!427371 lt!427373 (zeroValue!5599 thiss!1141) lt!427367))))

(assert (=> b!949263 (= (apply!868 (+!2878 lt!427371 (tuple2!13583 lt!427373 (zeroValue!5599 thiss!1141))) lt!427367) (apply!868 lt!427371 lt!427367))))

(declare-fun lt!427381 () Unit!31851)

(assert (=> b!949263 (= lt!427381 lt!427372)))

(declare-fun lt!427364 () ListLongMap!12269)

(assert (=> b!949263 (= lt!427364 (getCurrentListMapNoExtraKeys!3350 (_keys!10686 thiss!1141) (_values!5786 thiss!1141) (mask!27536 thiss!1141) (extraKeys!5495 thiss!1141) (zeroValue!5599 thiss!1141) (minValue!5599 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5763 thiss!1141)))))

(declare-fun lt!427366 () (_ BitVec 64))

(assert (=> b!949263 (= lt!427366 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!427375 () (_ BitVec 64))

(assert (=> b!949263 (= lt!427375 (select (arr!27618 (_keys!10686 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!949263 (= lt!427378 (addApplyDifferent!447 lt!427364 lt!427366 (minValue!5599 thiss!1141) lt!427375))))

(assert (=> b!949263 (= (apply!868 (+!2878 lt!427364 (tuple2!13583 lt!427366 (minValue!5599 thiss!1141))) lt!427375) (apply!868 lt!427364 lt!427375))))

(declare-fun bm!41275 () Bool)

(declare-fun call!41278 () Bool)

(assert (=> bm!41275 (= call!41278 (contains!5181 lt!427369 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!949264 () Bool)

(declare-fun res!636660 () Bool)

(declare-fun e!534401 () Bool)

(assert (=> b!949264 (=> (not res!636660) (not e!534401))))

(assert (=> b!949264 (= res!636660 e!534399)))

(declare-fun res!636658 () Bool)

(assert (=> b!949264 (=> res!636658 e!534399)))

(assert (=> b!949264 (= res!636658 (not e!534404))))

(declare-fun res!636655 () Bool)

(assert (=> b!949264 (=> (not res!636655) (not e!534404))))

(assert (=> b!949264 (= res!636655 (bvslt #b00000000000000000000000000000000 (size!28096 (_keys!10686 thiss!1141))))))

(declare-fun b!949265 () Bool)

(declare-fun e!534409 () ListLongMap!12269)

(assert (=> b!949265 (= e!534409 (+!2878 call!41276 (tuple2!13583 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5599 thiss!1141))))))

(declare-fun b!949266 () Bool)

(declare-fun e!534405 () Bool)

(declare-fun e!534408 () Bool)

(assert (=> b!949266 (= e!534405 e!534408)))

(declare-fun res!636654 () Bool)

(assert (=> b!949266 (= res!636654 call!41278)))

(assert (=> b!949266 (=> (not res!636654) (not e!534408))))

(declare-fun b!949267 () Bool)

(assert (=> b!949267 (= e!534401 e!534405)))

(declare-fun c!99026 () Bool)

(assert (=> b!949267 (= c!99026 (not (= (bvand (extraKeys!5495 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!949268 () Bool)

(declare-fun e!534411 () ListLongMap!12269)

(assert (=> b!949268 (= e!534411 call!41279)))

(declare-fun b!949269 () Bool)

(declare-fun e!534407 () Bool)

(assert (=> b!949269 (= e!534403 e!534407)))

(declare-fun res!636653 () Bool)

(assert (=> b!949269 (= res!636653 call!41280)))

(assert (=> b!949269 (=> (not res!636653) (not e!534407))))

(declare-fun b!949270 () Bool)

(declare-fun e!534402 () Bool)

(assert (=> b!949270 (= e!534402 (validKeyInArray!0 (select (arr!27618 (_keys!10686 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!949271 () Bool)

(declare-fun Unit!31854 () Unit!31851)

(assert (=> b!949271 (= e!534406 Unit!31854)))

(declare-fun d!114845 () Bool)

(assert (=> d!114845 e!534401))

(declare-fun res!636657 () Bool)

(assert (=> d!114845 (=> (not res!636657) (not e!534401))))

(assert (=> d!114845 (= res!636657 (or (bvsge #b00000000000000000000000000000000 (size!28096 (_keys!10686 thiss!1141))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28096 (_keys!10686 thiss!1141))))))))

(declare-fun lt!427365 () ListLongMap!12269)

(assert (=> d!114845 (= lt!427369 lt!427365)))

(declare-fun lt!427379 () Unit!31851)

(assert (=> d!114845 (= lt!427379 e!534406)))

(declare-fun c!99028 () Bool)

(assert (=> d!114845 (= c!99028 e!534402)))

(declare-fun res!636656 () Bool)

(assert (=> d!114845 (=> (not res!636656) (not e!534402))))

(assert (=> d!114845 (= res!636656 (bvslt #b00000000000000000000000000000000 (size!28096 (_keys!10686 thiss!1141))))))

(assert (=> d!114845 (= lt!427365 e!534409)))

(assert (=> d!114845 (= c!99027 (and (not (= (bvand (extraKeys!5495 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5495 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!114845 (validMask!0 (mask!27536 thiss!1141))))

(assert (=> d!114845 (= (getCurrentListMap!3312 (_keys!10686 thiss!1141) (_values!5786 thiss!1141) (mask!27536 thiss!1141) (extraKeys!5495 thiss!1141) (zeroValue!5599 thiss!1141) (minValue!5599 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5763 thiss!1141)) lt!427369)))

(declare-fun b!949272 () Bool)

(declare-fun e!534400 () ListLongMap!12269)

(assert (=> b!949272 (= e!534409 e!534400)))

(assert (=> b!949272 (= c!99023 (and (not (= (bvand (extraKeys!5495 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5495 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!41276 () Bool)

(assert (=> bm!41276 (= call!41277 (getCurrentListMapNoExtraKeys!3350 (_keys!10686 thiss!1141) (_values!5786 thiss!1141) (mask!27536 thiss!1141) (extraKeys!5495 thiss!1141) (zeroValue!5599 thiss!1141) (minValue!5599 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5763 thiss!1141)))))

(declare-fun b!949273 () Bool)

(declare-fun call!41275 () ListLongMap!12269)

(assert (=> b!949273 (= e!534411 call!41275)))

(declare-fun b!949274 () Bool)

(assert (=> b!949274 (= e!534407 (= (apply!868 lt!427369 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!5599 thiss!1141)))))

(declare-fun b!949275 () Bool)

(assert (=> b!949275 (= e!534405 (not call!41278))))

(declare-fun b!949276 () Bool)

(declare-fun res!636652 () Bool)

(assert (=> b!949276 (=> (not res!636652) (not e!534401))))

(assert (=> b!949276 (= res!636652 e!534403)))

(declare-fun c!99024 () Bool)

(assert (=> b!949276 (= c!99024 (not (= (bvand (extraKeys!5495 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!949277 () Bool)

(assert (=> b!949277 (= e!534400 call!41275)))

(declare-fun bm!41277 () Bool)

(assert (=> bm!41277 (= call!41281 call!41277)))

(declare-fun b!949278 () Bool)

(declare-fun get!14512 (ValueCell!9881 V!32599) V!32599)

(declare-fun dynLambda!1634 (Int (_ BitVec 64)) V!32599)

(assert (=> b!949278 (= e!534410 (= (apply!868 lt!427369 (select (arr!27618 (_keys!10686 thiss!1141)) #b00000000000000000000000000000000)) (get!14512 (select (arr!27617 (_values!5786 thiss!1141)) #b00000000000000000000000000000000) (dynLambda!1634 (defaultEntry!5763 thiss!1141) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!949278 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28095 (_values!5786 thiss!1141))))))

(assert (=> b!949278 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28096 (_keys!10686 thiss!1141))))))

(declare-fun b!949279 () Bool)

(assert (=> b!949279 (= e!534408 (= (apply!868 lt!427369 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!5599 thiss!1141)))))

(declare-fun b!949280 () Bool)

(declare-fun c!99025 () Bool)

(assert (=> b!949280 (= c!99025 (and (not (= (bvand (extraKeys!5495 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5495 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!949280 (= e!534400 e!534411)))

(declare-fun bm!41278 () Bool)

(assert (=> bm!41278 (= call!41275 call!41276)))

(assert (= (and d!114845 c!99027) b!949265))

(assert (= (and d!114845 (not c!99027)) b!949272))

(assert (= (and b!949272 c!99023) b!949277))

(assert (= (and b!949272 (not c!99023)) b!949280))

(assert (= (and b!949280 c!99025) b!949273))

(assert (= (and b!949280 (not c!99025)) b!949268))

(assert (= (or b!949273 b!949268) bm!41272))

(assert (= (or b!949277 bm!41272) bm!41277))

(assert (= (or b!949277 b!949273) bm!41278))

(assert (= (or b!949265 bm!41277) bm!41276))

(assert (= (or b!949265 bm!41278) bm!41273))

(assert (= (and d!114845 res!636656) b!949270))

(assert (= (and d!114845 c!99028) b!949263))

(assert (= (and d!114845 (not c!99028)) b!949271))

(assert (= (and d!114845 res!636657) b!949264))

(assert (= (and b!949264 res!636655) b!949261))

(assert (= (and b!949264 (not res!636658)) b!949262))

(assert (= (and b!949262 res!636659) b!949278))

(assert (= (and b!949264 res!636660) b!949276))

(assert (= (and b!949276 c!99024) b!949269))

(assert (= (and b!949276 (not c!99024)) b!949260))

(assert (= (and b!949269 res!636653) b!949274))

(assert (= (or b!949269 b!949260) bm!41274))

(assert (= (and b!949276 res!636652) b!949267))

(assert (= (and b!949267 c!99026) b!949266))

(assert (= (and b!949267 (not c!99026)) b!949275))

(assert (= (and b!949266 res!636654) b!949279))

(assert (= (or b!949266 b!949275) bm!41275))

(declare-fun b_lambda!14329 () Bool)

(assert (=> (not b_lambda!14329) (not b!949278)))

(declare-fun t!27657 () Bool)

(declare-fun tb!6177 () Bool)

(assert (=> (and b!949126 (= (defaultEntry!5763 thiss!1141) (defaultEntry!5763 thiss!1141)) t!27657) tb!6177))

(declare-fun result!12269 () Bool)

(assert (=> tb!6177 (= result!12269 tp_is_empty!20725)))

(assert (=> b!949278 t!27657))

(declare-fun b_and!29643 () Bool)

(assert (= b_and!29637 (and (=> t!27657 result!12269) b_and!29643)))

(declare-fun m!881335 () Bool)

(assert (=> bm!41276 m!881335))

(declare-fun m!881337 () Bool)

(assert (=> b!949261 m!881337))

(assert (=> b!949261 m!881337))

(declare-fun m!881339 () Bool)

(assert (=> b!949261 m!881339))

(declare-fun m!881341 () Bool)

(assert (=> b!949263 m!881341))

(declare-fun m!881343 () Bool)

(assert (=> b!949263 m!881343))

(declare-fun m!881345 () Bool)

(assert (=> b!949263 m!881345))

(declare-fun m!881347 () Bool)

(assert (=> b!949263 m!881347))

(assert (=> b!949263 m!881337))

(declare-fun m!881349 () Bool)

(assert (=> b!949263 m!881349))

(declare-fun m!881351 () Bool)

(assert (=> b!949263 m!881351))

(declare-fun m!881353 () Bool)

(assert (=> b!949263 m!881353))

(declare-fun m!881355 () Bool)

(assert (=> b!949263 m!881355))

(declare-fun m!881357 () Bool)

(assert (=> b!949263 m!881357))

(declare-fun m!881359 () Bool)

(assert (=> b!949263 m!881359))

(assert (=> b!949263 m!881353))

(declare-fun m!881361 () Bool)

(assert (=> b!949263 m!881361))

(declare-fun m!881363 () Bool)

(assert (=> b!949263 m!881363))

(assert (=> b!949263 m!881341))

(declare-fun m!881365 () Bool)

(assert (=> b!949263 m!881365))

(assert (=> b!949263 m!881357))

(assert (=> b!949263 m!881361))

(assert (=> b!949263 m!881335))

(declare-fun m!881367 () Bool)

(assert (=> b!949263 m!881367))

(declare-fun m!881369 () Bool)

(assert (=> b!949263 m!881369))

(declare-fun m!881371 () Bool)

(assert (=> b!949279 m!881371))

(assert (=> d!114845 m!881261))

(declare-fun m!881373 () Bool)

(assert (=> bm!41274 m!881373))

(declare-fun m!881375 () Bool)

(assert (=> b!949265 m!881375))

(assert (=> b!949262 m!881337))

(assert (=> b!949262 m!881337))

(declare-fun m!881377 () Bool)

(assert (=> b!949262 m!881377))

(assert (=> b!949278 m!881337))

(declare-fun m!881379 () Bool)

(assert (=> b!949278 m!881379))

(declare-fun m!881381 () Bool)

(assert (=> b!949278 m!881381))

(assert (=> b!949278 m!881379))

(assert (=> b!949278 m!881381))

(declare-fun m!881383 () Bool)

(assert (=> b!949278 m!881383))

(assert (=> b!949278 m!881337))

(declare-fun m!881385 () Bool)

(assert (=> b!949278 m!881385))

(declare-fun m!881387 () Bool)

(assert (=> bm!41273 m!881387))

(declare-fun m!881389 () Bool)

(assert (=> bm!41275 m!881389))

(declare-fun m!881391 () Bool)

(assert (=> b!949274 m!881391))

(assert (=> b!949270 m!881337))

(assert (=> b!949270 m!881337))

(assert (=> b!949270 m!881339))

(assert (=> b!949119 d!114845))

(declare-fun d!114847 () Bool)

(assert (=> d!114847 (= (validMask!0 (mask!27536 thiss!1141)) (and (or (= (mask!27536 thiss!1141) #b00000000000000000000000000000111) (= (mask!27536 thiss!1141) #b00000000000000000000000000001111) (= (mask!27536 thiss!1141) #b00000000000000000000000000011111) (= (mask!27536 thiss!1141) #b00000000000000000000000000111111) (= (mask!27536 thiss!1141) #b00000000000000000000000001111111) (= (mask!27536 thiss!1141) #b00000000000000000000000011111111) (= (mask!27536 thiss!1141) #b00000000000000000000000111111111) (= (mask!27536 thiss!1141) #b00000000000000000000001111111111) (= (mask!27536 thiss!1141) #b00000000000000000000011111111111) (= (mask!27536 thiss!1141) #b00000000000000000000111111111111) (= (mask!27536 thiss!1141) #b00000000000000000001111111111111) (= (mask!27536 thiss!1141) #b00000000000000000011111111111111) (= (mask!27536 thiss!1141) #b00000000000000000111111111111111) (= (mask!27536 thiss!1141) #b00000000000000001111111111111111) (= (mask!27536 thiss!1141) #b00000000000000011111111111111111) (= (mask!27536 thiss!1141) #b00000000000000111111111111111111) (= (mask!27536 thiss!1141) #b00000000000001111111111111111111) (= (mask!27536 thiss!1141) #b00000000000011111111111111111111) (= (mask!27536 thiss!1141) #b00000000000111111111111111111111) (= (mask!27536 thiss!1141) #b00000000001111111111111111111111) (= (mask!27536 thiss!1141) #b00000000011111111111111111111111) (= (mask!27536 thiss!1141) #b00000000111111111111111111111111) (= (mask!27536 thiss!1141) #b00000001111111111111111111111111) (= (mask!27536 thiss!1141) #b00000011111111111111111111111111) (= (mask!27536 thiss!1141) #b00000111111111111111111111111111) (= (mask!27536 thiss!1141) #b00001111111111111111111111111111) (= (mask!27536 thiss!1141) #b00011111111111111111111111111111) (= (mask!27536 thiss!1141) #b00111111111111111111111111111111)) (bvsle (mask!27536 thiss!1141) #b00111111111111111111111111111111)))))

(assert (=> b!949125 d!114847))

(declare-fun d!114849 () Bool)

(assert (=> d!114849 (= (array_inv!21496 (_keys!10686 thiss!1141)) (bvsge (size!28096 (_keys!10686 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!949126 d!114849))

(declare-fun d!114851 () Bool)

(assert (=> d!114851 (= (array_inv!21497 (_values!5786 thiss!1141)) (bvsge (size!28095 (_values!5786 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!949126 d!114851))

(declare-fun b!949290 () Bool)

(declare-fun e!534417 () Bool)

(assert (=> b!949290 (= e!534417 tp_is_empty!20725)))

(declare-fun condMapEmpty!32998 () Bool)

(declare-fun mapDefault!32998 () ValueCell!9881)

(assert (=> mapNonEmpty!32989 (= condMapEmpty!32998 (= mapRest!32989 ((as const (Array (_ BitVec 32) ValueCell!9881)) mapDefault!32998)))))

(declare-fun mapRes!32998 () Bool)

(assert (=> mapNonEmpty!32989 (= tp!63238 (and e!534417 mapRes!32998))))

(declare-fun b!949289 () Bool)

(declare-fun e!534416 () Bool)

(assert (=> b!949289 (= e!534416 tp_is_empty!20725)))

(declare-fun mapIsEmpty!32998 () Bool)

(assert (=> mapIsEmpty!32998 mapRes!32998))

(declare-fun mapNonEmpty!32998 () Bool)

(declare-fun tp!63253 () Bool)

(assert (=> mapNonEmpty!32998 (= mapRes!32998 (and tp!63253 e!534416))))

(declare-fun mapValue!32998 () ValueCell!9881)

(declare-fun mapRest!32998 () (Array (_ BitVec 32) ValueCell!9881))

(declare-fun mapKey!32998 () (_ BitVec 32))

(assert (=> mapNonEmpty!32998 (= mapRest!32989 (store mapRest!32998 mapKey!32998 mapValue!32998))))

(assert (= (and mapNonEmpty!32989 condMapEmpty!32998) mapIsEmpty!32998))

(assert (= (and mapNonEmpty!32989 (not condMapEmpty!32998)) mapNonEmpty!32998))

(assert (= (and mapNonEmpty!32998 ((_ is ValueCellFull!9881) mapValue!32998)) b!949289))

(assert (= (and mapNonEmpty!32989 ((_ is ValueCellFull!9881) mapDefault!32998)) b!949290))

(declare-fun m!881393 () Bool)

(assert (=> mapNonEmpty!32998 m!881393))

(declare-fun b_lambda!14331 () Bool)

(assert (= b_lambda!14329 (or (and b!949126 b_free!18217) b_lambda!14331)))

(check-sat (not b!949274) (not bm!41273) (not b!949261) (not d!114841) (not b!949207) (not bm!41275) (not b_lambda!14331) (not b!949262) (not b!949215) tp_is_empty!20725 (not b!949217) (not b!949189) (not b!949270) (not d!114845) (not b!949278) (not b!949279) (not d!114839) (not b_next!18217) b_and!29643 (not d!114843) (not b!949190) (not b!949265) (not b!949263) (not b!949188) (not bm!41276) (not mapNonEmpty!32998) (not bm!41274))
(check-sat b_and!29643 (not b_next!18217))
(get-model)

(declare-fun d!114853 () Bool)

(declare-fun res!636665 () Bool)

(declare-fun e!534425 () Bool)

(assert (=> d!114853 (=> res!636665 e!534425)))

(assert (=> d!114853 (= res!636665 (bvsge #b00000000000000000000000000000000 (size!28096 (_keys!10686 thiss!1141))))))

(assert (=> d!114853 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10686 thiss!1141) (mask!27536 thiss!1141)) e!534425)))

(declare-fun b!949299 () Bool)

(declare-fun e!534426 () Bool)

(assert (=> b!949299 (= e!534425 e!534426)))

(declare-fun c!99031 () Bool)

(assert (=> b!949299 (= c!99031 (validKeyInArray!0 (select (arr!27618 (_keys!10686 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!949300 () Bool)

(declare-fun call!41284 () Bool)

(assert (=> b!949300 (= e!534426 call!41284)))

(declare-fun b!949301 () Bool)

(declare-fun e!534424 () Bool)

(assert (=> b!949301 (= e!534424 call!41284)))

(declare-fun b!949302 () Bool)

(assert (=> b!949302 (= e!534426 e!534424)))

(declare-fun lt!427394 () (_ BitVec 64))

(assert (=> b!949302 (= lt!427394 (select (arr!27618 (_keys!10686 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!427393 () Unit!31851)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!57429 (_ BitVec 64) (_ BitVec 32)) Unit!31851)

(assert (=> b!949302 (= lt!427393 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10686 thiss!1141) lt!427394 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!57429 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!949302 (arrayContainsKey!0 (_keys!10686 thiss!1141) lt!427394 #b00000000000000000000000000000000)))

(declare-fun lt!427392 () Unit!31851)

(assert (=> b!949302 (= lt!427392 lt!427393)))

(declare-fun res!636666 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!57429 (_ BitVec 32)) SeekEntryResult!9132)

(assert (=> b!949302 (= res!636666 (= (seekEntryOrOpen!0 (select (arr!27618 (_keys!10686 thiss!1141)) #b00000000000000000000000000000000) (_keys!10686 thiss!1141) (mask!27536 thiss!1141)) (Found!9132 #b00000000000000000000000000000000)))))

(assert (=> b!949302 (=> (not res!636666) (not e!534424))))

(declare-fun bm!41281 () Bool)

(assert (=> bm!41281 (= call!41284 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!10686 thiss!1141) (mask!27536 thiss!1141)))))

(assert (= (and d!114853 (not res!636665)) b!949299))

(assert (= (and b!949299 c!99031) b!949302))

(assert (= (and b!949299 (not c!99031)) b!949300))

(assert (= (and b!949302 res!636666) b!949301))

(assert (= (or b!949301 b!949300) bm!41281))

(assert (=> b!949299 m!881337))

(assert (=> b!949299 m!881337))

(assert (=> b!949299 m!881339))

(assert (=> b!949302 m!881337))

(declare-fun m!881395 () Bool)

(assert (=> b!949302 m!881395))

(declare-fun m!881397 () Bool)

(assert (=> b!949302 m!881397))

(assert (=> b!949302 m!881337))

(declare-fun m!881399 () Bool)

(assert (=> b!949302 m!881399))

(declare-fun m!881401 () Bool)

(assert (=> bm!41281 m!881401))

(assert (=> b!949189 d!114853))

(declare-fun b!949321 () Bool)

(declare-fun e!534437 () Bool)

(declare-fun lt!427400 () SeekEntryResult!9132)

(assert (=> b!949321 (= e!534437 (bvsge (x!81675 lt!427400) #b01111111111111111111111111111110))))

(declare-fun b!949322 () Bool)

(assert (=> b!949322 (and (bvsge (index!38901 lt!427400) #b00000000000000000000000000000000) (bvslt (index!38901 lt!427400) (size!28096 (_keys!10686 thiss!1141))))))

(declare-fun res!636674 () Bool)

(assert (=> b!949322 (= res!636674 (= (select (arr!27618 (_keys!10686 thiss!1141)) (index!38901 lt!427400)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!534440 () Bool)

(assert (=> b!949322 (=> res!636674 e!534440)))

(declare-fun b!949323 () Bool)

(declare-fun e!534438 () SeekEntryResult!9132)

(assert (=> b!949323 (= e!534438 (Intermediate!9132 true (toIndex!0 key!756 (mask!27536 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun d!114855 () Bool)

(assert (=> d!114855 e!534437))

(declare-fun c!99039 () Bool)

(assert (=> d!114855 (= c!99039 (and ((_ is Intermediate!9132) lt!427400) (undefined!9944 lt!427400)))))

(assert (=> d!114855 (= lt!427400 e!534438)))

(declare-fun c!99040 () Bool)

(assert (=> d!114855 (= c!99040 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!427399 () (_ BitVec 64))

(assert (=> d!114855 (= lt!427399 (select (arr!27618 (_keys!10686 thiss!1141)) (toIndex!0 key!756 (mask!27536 thiss!1141))))))

(assert (=> d!114855 (validMask!0 (mask!27536 thiss!1141))))

(assert (=> d!114855 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!756 (mask!27536 thiss!1141)) key!756 (_keys!10686 thiss!1141) (mask!27536 thiss!1141)) lt!427400)))

(declare-fun b!949324 () Bool)

(declare-fun e!534439 () SeekEntryResult!9132)

(assert (=> b!949324 (= e!534439 (Intermediate!9132 false (toIndex!0 key!756 (mask!27536 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun b!949325 () Bool)

(assert (=> b!949325 (and (bvsge (index!38901 lt!427400) #b00000000000000000000000000000000) (bvslt (index!38901 lt!427400) (size!28096 (_keys!10686 thiss!1141))))))

(declare-fun res!636675 () Bool)

(assert (=> b!949325 (= res!636675 (= (select (arr!27618 (_keys!10686 thiss!1141)) (index!38901 lt!427400)) key!756))))

(assert (=> b!949325 (=> res!636675 e!534440)))

(declare-fun e!534441 () Bool)

(assert (=> b!949325 (= e!534441 e!534440)))

(declare-fun b!949326 () Bool)

(assert (=> b!949326 (= e!534438 e!534439)))

(declare-fun c!99038 () Bool)

(assert (=> b!949326 (= c!99038 (or (= lt!427399 key!756) (= (bvadd lt!427399 lt!427399) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!949327 () Bool)

(assert (=> b!949327 (and (bvsge (index!38901 lt!427400) #b00000000000000000000000000000000) (bvslt (index!38901 lt!427400) (size!28096 (_keys!10686 thiss!1141))))))

(assert (=> b!949327 (= e!534440 (= (select (arr!27618 (_keys!10686 thiss!1141)) (index!38901 lt!427400)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!949328 () Bool)

(assert (=> b!949328 (= e!534437 e!534441)))

(declare-fun res!636673 () Bool)

(assert (=> b!949328 (= res!636673 (and ((_ is Intermediate!9132) lt!427400) (not (undefined!9944 lt!427400)) (bvslt (x!81675 lt!427400) #b01111111111111111111111111111110) (bvsge (x!81675 lt!427400) #b00000000000000000000000000000000) (bvsge (x!81675 lt!427400) #b00000000000000000000000000000000)))))

(assert (=> b!949328 (=> (not res!636673) (not e!534441))))

(declare-fun b!949329 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!949329 (= e!534439 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!756 (mask!27536 thiss!1141)) #b00000000000000000000000000000000 (mask!27536 thiss!1141)) key!756 (_keys!10686 thiss!1141) (mask!27536 thiss!1141)))))

(assert (= (and d!114855 c!99040) b!949323))

(assert (= (and d!114855 (not c!99040)) b!949326))

(assert (= (and b!949326 c!99038) b!949324))

(assert (= (and b!949326 (not c!99038)) b!949329))

(assert (= (and d!114855 c!99039) b!949321))

(assert (= (and d!114855 (not c!99039)) b!949328))

(assert (= (and b!949328 res!636673) b!949325))

(assert (= (and b!949325 (not res!636675)) b!949322))

(assert (= (and b!949322 (not res!636674)) b!949327))

(assert (=> d!114855 m!881321))

(declare-fun m!881403 () Bool)

(assert (=> d!114855 m!881403))

(assert (=> d!114855 m!881261))

(declare-fun m!881405 () Bool)

(assert (=> b!949327 m!881405))

(assert (=> b!949322 m!881405))

(assert (=> b!949329 m!881321))

(declare-fun m!881407 () Bool)

(assert (=> b!949329 m!881407))

(assert (=> b!949329 m!881407))

(declare-fun m!881409 () Bool)

(assert (=> b!949329 m!881409))

(assert (=> b!949325 m!881405))

(assert (=> d!114841 d!114855))

(declare-fun d!114857 () Bool)

(declare-fun lt!427406 () (_ BitVec 32))

(declare-fun lt!427405 () (_ BitVec 32))

(assert (=> d!114857 (= lt!427406 (bvmul (bvxor lt!427405 (bvlshr lt!427405 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!114857 (= lt!427405 ((_ extract 31 0) (bvand (bvxor key!756 (bvlshr key!756 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!114857 (and (bvsge (mask!27536 thiss!1141) #b00000000000000000000000000000000) (let ((res!636676 (let ((h!20488 ((_ extract 31 0) (bvand (bvxor key!756 (bvlshr key!756 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!81692 (bvmul (bvxor h!20488 (bvlshr h!20488 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!81692 (bvlshr x!81692 #b00000000000000000000000000001101)) (mask!27536 thiss!1141)))))) (and (bvslt res!636676 (bvadd (mask!27536 thiss!1141) #b00000000000000000000000000000001)) (bvsge res!636676 #b00000000000000000000000000000000))))))

(assert (=> d!114857 (= (toIndex!0 key!756 (mask!27536 thiss!1141)) (bvand (bvxor lt!427406 (bvlshr lt!427406 #b00000000000000000000000000001101)) (mask!27536 thiss!1141)))))

(assert (=> d!114841 d!114857))

(assert (=> d!114841 d!114847))

(declare-fun d!114859 () Bool)

(declare-fun e!534444 () Bool)

(assert (=> d!114859 e!534444))

(declare-fun res!636681 () Bool)

(assert (=> d!114859 (=> (not res!636681) (not e!534444))))

(declare-fun lt!427418 () ListLongMap!12269)

(assert (=> d!114859 (= res!636681 (contains!5181 lt!427418 (_1!6802 (ite (or c!99027 c!99023) (tuple2!13583 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5599 thiss!1141)) (tuple2!13583 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5599 thiss!1141))))))))

(declare-fun lt!427417 () List!19330)

(assert (=> d!114859 (= lt!427418 (ListLongMap!12270 lt!427417))))

(declare-fun lt!427416 () Unit!31851)

(declare-fun lt!427415 () Unit!31851)

(assert (=> d!114859 (= lt!427416 lt!427415)))

(assert (=> d!114859 (= (getValueByKey!497 lt!427417 (_1!6802 (ite (or c!99027 c!99023) (tuple2!13583 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5599 thiss!1141)) (tuple2!13583 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5599 thiss!1141))))) (Some!502 (_2!6802 (ite (or c!99027 c!99023) (tuple2!13583 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5599 thiss!1141)) (tuple2!13583 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5599 thiss!1141))))))))

(declare-fun lemmaContainsTupThenGetReturnValue!266 (List!19330 (_ BitVec 64) V!32599) Unit!31851)

(assert (=> d!114859 (= lt!427415 (lemmaContainsTupThenGetReturnValue!266 lt!427417 (_1!6802 (ite (or c!99027 c!99023) (tuple2!13583 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5599 thiss!1141)) (tuple2!13583 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5599 thiss!1141)))) (_2!6802 (ite (or c!99027 c!99023) (tuple2!13583 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5599 thiss!1141)) (tuple2!13583 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5599 thiss!1141))))))))

(declare-fun insertStrictlySorted!323 (List!19330 (_ BitVec 64) V!32599) List!19330)

(assert (=> d!114859 (= lt!427417 (insertStrictlySorted!323 (toList!6150 (ite c!99027 call!41277 (ite c!99023 call!41281 call!41279))) (_1!6802 (ite (or c!99027 c!99023) (tuple2!13583 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5599 thiss!1141)) (tuple2!13583 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5599 thiss!1141)))) (_2!6802 (ite (or c!99027 c!99023) (tuple2!13583 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5599 thiss!1141)) (tuple2!13583 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5599 thiss!1141))))))))

(assert (=> d!114859 (= (+!2878 (ite c!99027 call!41277 (ite c!99023 call!41281 call!41279)) (ite (or c!99027 c!99023) (tuple2!13583 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5599 thiss!1141)) (tuple2!13583 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5599 thiss!1141)))) lt!427418)))

(declare-fun b!949334 () Bool)

(declare-fun res!636682 () Bool)

(assert (=> b!949334 (=> (not res!636682) (not e!534444))))

(assert (=> b!949334 (= res!636682 (= (getValueByKey!497 (toList!6150 lt!427418) (_1!6802 (ite (or c!99027 c!99023) (tuple2!13583 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5599 thiss!1141)) (tuple2!13583 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5599 thiss!1141))))) (Some!502 (_2!6802 (ite (or c!99027 c!99023) (tuple2!13583 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5599 thiss!1141)) (tuple2!13583 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5599 thiss!1141)))))))))

(declare-fun b!949335 () Bool)

(declare-fun contains!5183 (List!19330 tuple2!13582) Bool)

(assert (=> b!949335 (= e!534444 (contains!5183 (toList!6150 lt!427418) (ite (or c!99027 c!99023) (tuple2!13583 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5599 thiss!1141)) (tuple2!13583 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5599 thiss!1141)))))))

(assert (= (and d!114859 res!636681) b!949334))

(assert (= (and b!949334 res!636682) b!949335))

(declare-fun m!881411 () Bool)

(assert (=> d!114859 m!881411))

(declare-fun m!881413 () Bool)

(assert (=> d!114859 m!881413))

(declare-fun m!881415 () Bool)

(assert (=> d!114859 m!881415))

(declare-fun m!881417 () Bool)

(assert (=> d!114859 m!881417))

(declare-fun m!881419 () Bool)

(assert (=> b!949334 m!881419))

(declare-fun m!881421 () Bool)

(assert (=> b!949335 m!881421))

(assert (=> bm!41273 d!114859))

(declare-fun e!534452 () SeekEntryResult!9132)

(declare-fun b!949348 () Bool)

(assert (=> b!949348 (= e!534452 (seekKeyOrZeroReturnVacant!0 (bvadd (x!81675 lt!427307) #b00000000000000000000000000000001) (nextIndex!0 (index!38901 lt!427307) (x!81675 lt!427307) (mask!27536 thiss!1141)) (index!38901 lt!427307) key!756 (_keys!10686 thiss!1141) (mask!27536 thiss!1141)))))

(declare-fun d!114861 () Bool)

(declare-fun lt!427424 () SeekEntryResult!9132)

(assert (=> d!114861 (and (or ((_ is Undefined!9132) lt!427424) (not ((_ is Found!9132) lt!427424)) (and (bvsge (index!38900 lt!427424) #b00000000000000000000000000000000) (bvslt (index!38900 lt!427424) (size!28096 (_keys!10686 thiss!1141))))) (or ((_ is Undefined!9132) lt!427424) ((_ is Found!9132) lt!427424) (not ((_ is MissingVacant!9132) lt!427424)) (not (= (index!38902 lt!427424) (index!38901 lt!427307))) (and (bvsge (index!38902 lt!427424) #b00000000000000000000000000000000) (bvslt (index!38902 lt!427424) (size!28096 (_keys!10686 thiss!1141))))) (or ((_ is Undefined!9132) lt!427424) (ite ((_ is Found!9132) lt!427424) (= (select (arr!27618 (_keys!10686 thiss!1141)) (index!38900 lt!427424)) key!756) (and ((_ is MissingVacant!9132) lt!427424) (= (index!38902 lt!427424) (index!38901 lt!427307)) (= (select (arr!27618 (_keys!10686 thiss!1141)) (index!38902 lt!427424)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!534451 () SeekEntryResult!9132)

(assert (=> d!114861 (= lt!427424 e!534451)))

(declare-fun c!99047 () Bool)

(assert (=> d!114861 (= c!99047 (bvsge (x!81675 lt!427307) #b01111111111111111111111111111110))))

(declare-fun lt!427423 () (_ BitVec 64))

(assert (=> d!114861 (= lt!427423 (select (arr!27618 (_keys!10686 thiss!1141)) (index!38901 lt!427307)))))

(assert (=> d!114861 (validMask!0 (mask!27536 thiss!1141))))

(assert (=> d!114861 (= (seekKeyOrZeroReturnVacant!0 (x!81675 lt!427307) (index!38901 lt!427307) (index!38901 lt!427307) key!756 (_keys!10686 thiss!1141) (mask!27536 thiss!1141)) lt!427424)))

(declare-fun b!949349 () Bool)

(declare-fun e!534453 () SeekEntryResult!9132)

(assert (=> b!949349 (= e!534453 (Found!9132 (index!38901 lt!427307)))))

(declare-fun b!949350 () Bool)

(assert (=> b!949350 (= e!534451 e!534453)))

(declare-fun c!99049 () Bool)

(assert (=> b!949350 (= c!99049 (= lt!427423 key!756))))

(declare-fun b!949351 () Bool)

(assert (=> b!949351 (= e!534451 Undefined!9132)))

(declare-fun b!949352 () Bool)

(assert (=> b!949352 (= e!534452 (MissingVacant!9132 (index!38901 lt!427307)))))

(declare-fun b!949353 () Bool)

(declare-fun c!99048 () Bool)

(assert (=> b!949353 (= c!99048 (= lt!427423 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!949353 (= e!534453 e!534452)))

(assert (= (and d!114861 c!99047) b!949351))

(assert (= (and d!114861 (not c!99047)) b!949350))

(assert (= (and b!949350 c!99049) b!949349))

(assert (= (and b!949350 (not c!99049)) b!949353))

(assert (= (and b!949353 c!99048) b!949352))

(assert (= (and b!949353 (not c!99048)) b!949348))

(declare-fun m!881423 () Bool)

(assert (=> b!949348 m!881423))

(assert (=> b!949348 m!881423))

(declare-fun m!881425 () Bool)

(assert (=> b!949348 m!881425))

(declare-fun m!881427 () Bool)

(assert (=> d!114861 m!881427))

(declare-fun m!881429 () Bool)

(assert (=> d!114861 m!881429))

(assert (=> d!114861 m!881325))

(assert (=> d!114861 m!881261))

(assert (=> b!949207 d!114861))

(declare-fun bm!41284 () Bool)

(declare-fun call!41287 () Bool)

(declare-fun c!99052 () Bool)

(assert (=> bm!41284 (= call!41287 (arrayNoDuplicates!0 (_keys!10686 thiss!1141) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!99052 (Cons!19328 (select (arr!27618 (_keys!10686 thiss!1141)) #b00000000000000000000000000000000) Nil!19329) Nil!19329)))))

(declare-fun b!949364 () Bool)

(declare-fun e!534464 () Bool)

(assert (=> b!949364 (= e!534464 call!41287)))

(declare-fun b!949365 () Bool)

(declare-fun e!534462 () Bool)

(declare-fun e!534463 () Bool)

(assert (=> b!949365 (= e!534462 e!534463)))

(declare-fun res!636690 () Bool)

(assert (=> b!949365 (=> (not res!636690) (not e!534463))))

(declare-fun e!534465 () Bool)

(assert (=> b!949365 (= res!636690 (not e!534465))))

(declare-fun res!636691 () Bool)

(assert (=> b!949365 (=> (not res!636691) (not e!534465))))

(assert (=> b!949365 (= res!636691 (validKeyInArray!0 (select (arr!27618 (_keys!10686 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun d!114863 () Bool)

(declare-fun res!636689 () Bool)

(assert (=> d!114863 (=> res!636689 e!534462)))

(assert (=> d!114863 (= res!636689 (bvsge #b00000000000000000000000000000000 (size!28096 (_keys!10686 thiss!1141))))))

(assert (=> d!114863 (= (arrayNoDuplicates!0 (_keys!10686 thiss!1141) #b00000000000000000000000000000000 Nil!19329) e!534462)))

(declare-fun b!949366 () Bool)

(declare-fun contains!5184 (List!19332 (_ BitVec 64)) Bool)

(assert (=> b!949366 (= e!534465 (contains!5184 Nil!19329 (select (arr!27618 (_keys!10686 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!949367 () Bool)

(assert (=> b!949367 (= e!534464 call!41287)))

(declare-fun b!949368 () Bool)

(assert (=> b!949368 (= e!534463 e!534464)))

(assert (=> b!949368 (= c!99052 (validKeyInArray!0 (select (arr!27618 (_keys!10686 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (= (and d!114863 (not res!636689)) b!949365))

(assert (= (and b!949365 res!636691) b!949366))

(assert (= (and b!949365 res!636690) b!949368))

(assert (= (and b!949368 c!99052) b!949367))

(assert (= (and b!949368 (not c!99052)) b!949364))

(assert (= (or b!949367 b!949364) bm!41284))

(assert (=> bm!41284 m!881337))

(declare-fun m!881431 () Bool)

(assert (=> bm!41284 m!881431))

(assert (=> b!949365 m!881337))

(assert (=> b!949365 m!881337))

(assert (=> b!949365 m!881339))

(assert (=> b!949366 m!881337))

(assert (=> b!949366 m!881337))

(declare-fun m!881433 () Bool)

(assert (=> b!949366 m!881433))

(assert (=> b!949368 m!881337))

(assert (=> b!949368 m!881337))

(assert (=> b!949368 m!881339))

(assert (=> b!949190 d!114863))

(declare-fun d!114865 () Bool)

(declare-fun e!534467 () Bool)

(assert (=> d!114865 e!534467))

(declare-fun res!636692 () Bool)

(assert (=> d!114865 (=> res!636692 e!534467)))

(declare-fun lt!427426 () Bool)

(assert (=> d!114865 (= res!636692 (not lt!427426))))

(declare-fun lt!427427 () Bool)

(assert (=> d!114865 (= lt!427426 lt!427427)))

(declare-fun lt!427428 () Unit!31851)

(declare-fun e!534466 () Unit!31851)

(assert (=> d!114865 (= lt!427428 e!534466)))

(declare-fun c!99053 () Bool)

(assert (=> d!114865 (= c!99053 lt!427427)))

(assert (=> d!114865 (= lt!427427 (containsKey!461 (toList!6150 lt!427369) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!114865 (= (contains!5181 lt!427369 #b0000000000000000000000000000000000000000000000000000000000000000) lt!427426)))

(declare-fun b!949369 () Bool)

(declare-fun lt!427425 () Unit!31851)

(assert (=> b!949369 (= e!534466 lt!427425)))

(assert (=> b!949369 (= lt!427425 (lemmaContainsKeyImpliesGetValueByKeyDefined!356 (toList!6150 lt!427369) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!949369 (isDefined!369 (getValueByKey!497 (toList!6150 lt!427369) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!949370 () Bool)

(declare-fun Unit!31855 () Unit!31851)

(assert (=> b!949370 (= e!534466 Unit!31855)))

(declare-fun b!949371 () Bool)

(assert (=> b!949371 (= e!534467 (isDefined!369 (getValueByKey!497 (toList!6150 lt!427369) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!114865 c!99053) b!949369))

(assert (= (and d!114865 (not c!99053)) b!949370))

(assert (= (and d!114865 (not res!636692)) b!949371))

(declare-fun m!881435 () Bool)

(assert (=> d!114865 m!881435))

(declare-fun m!881437 () Bool)

(assert (=> b!949369 m!881437))

(declare-fun m!881439 () Bool)

(assert (=> b!949369 m!881439))

(assert (=> b!949369 m!881439))

(declare-fun m!881441 () Bool)

(assert (=> b!949369 m!881441))

(assert (=> b!949371 m!881439))

(assert (=> b!949371 m!881439))

(assert (=> b!949371 m!881441))

(assert (=> bm!41274 d!114865))

(declare-fun d!114867 () Bool)

(declare-fun get!14513 (Option!503) V!32599)

(assert (=> d!114867 (= (apply!868 lt!427369 #b0000000000000000000000000000000000000000000000000000000000000000) (get!14513 (getValueByKey!497 (toList!6150 lt!427369) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!26656 () Bool)

(assert (= bs!26656 d!114867))

(assert (=> bs!26656 m!881439))

(assert (=> bs!26656 m!881439))

(declare-fun m!881443 () Bool)

(assert (=> bs!26656 m!881443))

(assert (=> b!949274 d!114867))

(declare-fun d!114869 () Bool)

(declare-fun isEmpty!715 (Option!503) Bool)

(assert (=> d!114869 (= (isDefined!369 (getValueByKey!497 (toList!6150 (getCurrentListMap!3312 (_keys!10686 thiss!1141) (_values!5786 thiss!1141) (mask!27536 thiss!1141) (extraKeys!5495 thiss!1141) (zeroValue!5599 thiss!1141) (minValue!5599 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5763 thiss!1141))) key!756)) (not (isEmpty!715 (getValueByKey!497 (toList!6150 (getCurrentListMap!3312 (_keys!10686 thiss!1141) (_values!5786 thiss!1141) (mask!27536 thiss!1141) (extraKeys!5495 thiss!1141) (zeroValue!5599 thiss!1141) (minValue!5599 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5763 thiss!1141))) key!756))))))

(declare-fun bs!26657 () Bool)

(assert (= bs!26657 d!114869))

(assert (=> bs!26657 m!881331))

(declare-fun m!881445 () Bool)

(assert (=> bs!26657 m!881445))

(assert (=> b!949217 d!114869))

(declare-fun d!114871 () Bool)

(declare-fun c!99058 () Bool)

(assert (=> d!114871 (= c!99058 (and ((_ is Cons!19326) (toList!6150 (getCurrentListMap!3312 (_keys!10686 thiss!1141) (_values!5786 thiss!1141) (mask!27536 thiss!1141) (extraKeys!5495 thiss!1141) (zeroValue!5599 thiss!1141) (minValue!5599 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5763 thiss!1141)))) (= (_1!6802 (h!20485 (toList!6150 (getCurrentListMap!3312 (_keys!10686 thiss!1141) (_values!5786 thiss!1141) (mask!27536 thiss!1141) (extraKeys!5495 thiss!1141) (zeroValue!5599 thiss!1141) (minValue!5599 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5763 thiss!1141))))) key!756)))))

(declare-fun e!534472 () Option!503)

(assert (=> d!114871 (= (getValueByKey!497 (toList!6150 (getCurrentListMap!3312 (_keys!10686 thiss!1141) (_values!5786 thiss!1141) (mask!27536 thiss!1141) (extraKeys!5495 thiss!1141) (zeroValue!5599 thiss!1141) (minValue!5599 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5763 thiss!1141))) key!756) e!534472)))

(declare-fun b!949381 () Bool)

(declare-fun e!534473 () Option!503)

(assert (=> b!949381 (= e!534472 e!534473)))

(declare-fun c!99059 () Bool)

(assert (=> b!949381 (= c!99059 (and ((_ is Cons!19326) (toList!6150 (getCurrentListMap!3312 (_keys!10686 thiss!1141) (_values!5786 thiss!1141) (mask!27536 thiss!1141) (extraKeys!5495 thiss!1141) (zeroValue!5599 thiss!1141) (minValue!5599 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5763 thiss!1141)))) (not (= (_1!6802 (h!20485 (toList!6150 (getCurrentListMap!3312 (_keys!10686 thiss!1141) (_values!5786 thiss!1141) (mask!27536 thiss!1141) (extraKeys!5495 thiss!1141) (zeroValue!5599 thiss!1141) (minValue!5599 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5763 thiss!1141))))) key!756))))))

(declare-fun b!949380 () Bool)

(assert (=> b!949380 (= e!534472 (Some!502 (_2!6802 (h!20485 (toList!6150 (getCurrentListMap!3312 (_keys!10686 thiss!1141) (_values!5786 thiss!1141) (mask!27536 thiss!1141) (extraKeys!5495 thiss!1141) (zeroValue!5599 thiss!1141) (minValue!5599 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5763 thiss!1141)))))))))

(declare-fun b!949383 () Bool)

(assert (=> b!949383 (= e!534473 None!501)))

(declare-fun b!949382 () Bool)

(assert (=> b!949382 (= e!534473 (getValueByKey!497 (t!27654 (toList!6150 (getCurrentListMap!3312 (_keys!10686 thiss!1141) (_values!5786 thiss!1141) (mask!27536 thiss!1141) (extraKeys!5495 thiss!1141) (zeroValue!5599 thiss!1141) (minValue!5599 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5763 thiss!1141)))) key!756))))

(assert (= (and d!114871 c!99058) b!949380))

(assert (= (and d!114871 (not c!99058)) b!949381))

(assert (= (and b!949381 c!99059) b!949382))

(assert (= (and b!949381 (not c!99059)) b!949383))

(declare-fun m!881447 () Bool)

(assert (=> b!949382 m!881447))

(assert (=> b!949217 d!114871))

(declare-fun d!114873 () Bool)

(declare-fun e!534474 () Bool)

(assert (=> d!114873 e!534474))

(declare-fun res!636693 () Bool)

(assert (=> d!114873 (=> (not res!636693) (not e!534474))))

(declare-fun lt!427432 () ListLongMap!12269)

(assert (=> d!114873 (= res!636693 (contains!5181 lt!427432 (_1!6802 (tuple2!13583 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5599 thiss!1141)))))))

(declare-fun lt!427431 () List!19330)

(assert (=> d!114873 (= lt!427432 (ListLongMap!12270 lt!427431))))

(declare-fun lt!427430 () Unit!31851)

(declare-fun lt!427429 () Unit!31851)

(assert (=> d!114873 (= lt!427430 lt!427429)))

(assert (=> d!114873 (= (getValueByKey!497 lt!427431 (_1!6802 (tuple2!13583 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5599 thiss!1141)))) (Some!502 (_2!6802 (tuple2!13583 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5599 thiss!1141)))))))

(assert (=> d!114873 (= lt!427429 (lemmaContainsTupThenGetReturnValue!266 lt!427431 (_1!6802 (tuple2!13583 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5599 thiss!1141))) (_2!6802 (tuple2!13583 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5599 thiss!1141)))))))

(assert (=> d!114873 (= lt!427431 (insertStrictlySorted!323 (toList!6150 call!41276) (_1!6802 (tuple2!13583 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5599 thiss!1141))) (_2!6802 (tuple2!13583 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5599 thiss!1141)))))))

(assert (=> d!114873 (= (+!2878 call!41276 (tuple2!13583 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5599 thiss!1141))) lt!427432)))

(declare-fun b!949384 () Bool)

(declare-fun res!636694 () Bool)

(assert (=> b!949384 (=> (not res!636694) (not e!534474))))

(assert (=> b!949384 (= res!636694 (= (getValueByKey!497 (toList!6150 lt!427432) (_1!6802 (tuple2!13583 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5599 thiss!1141)))) (Some!502 (_2!6802 (tuple2!13583 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5599 thiss!1141))))))))

(declare-fun b!949385 () Bool)

(assert (=> b!949385 (= e!534474 (contains!5183 (toList!6150 lt!427432) (tuple2!13583 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5599 thiss!1141))))))

(assert (= (and d!114873 res!636693) b!949384))

(assert (= (and b!949384 res!636694) b!949385))

(declare-fun m!881449 () Bool)

(assert (=> d!114873 m!881449))

(declare-fun m!881451 () Bool)

(assert (=> d!114873 m!881451))

(declare-fun m!881453 () Bool)

(assert (=> d!114873 m!881453))

(declare-fun m!881455 () Bool)

(assert (=> d!114873 m!881455))

(declare-fun m!881457 () Bool)

(assert (=> b!949384 m!881457))

(declare-fun m!881459 () Bool)

(assert (=> b!949385 m!881459))

(assert (=> b!949265 d!114873))

(declare-fun b!949394 () Bool)

(declare-fun e!534479 () (_ BitVec 32))

(declare-fun call!41290 () (_ BitVec 32))

(assert (=> b!949394 (= e!534479 (bvadd #b00000000000000000000000000000001 call!41290))))

(declare-fun b!949395 () Bool)

(declare-fun e!534480 () (_ BitVec 32))

(assert (=> b!949395 (= e!534480 #b00000000000000000000000000000000)))

(declare-fun d!114875 () Bool)

(declare-fun lt!427435 () (_ BitVec 32))

(assert (=> d!114875 (and (bvsge lt!427435 #b00000000000000000000000000000000) (bvsle lt!427435 (bvsub (size!28096 (_keys!10686 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (=> d!114875 (= lt!427435 e!534480)))

(declare-fun c!99065 () Bool)

(assert (=> d!114875 (= c!99065 (bvsge #b00000000000000000000000000000000 (size!28096 (_keys!10686 thiss!1141))))))

(assert (=> d!114875 (and (bvsle #b00000000000000000000000000000000 (size!28096 (_keys!10686 thiss!1141))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!28096 (_keys!10686 thiss!1141)) (size!28096 (_keys!10686 thiss!1141))))))

(assert (=> d!114875 (= (arrayCountValidKeys!0 (_keys!10686 thiss!1141) #b00000000000000000000000000000000 (size!28096 (_keys!10686 thiss!1141))) lt!427435)))

(declare-fun bm!41287 () Bool)

(assert (=> bm!41287 (= call!41290 (arrayCountValidKeys!0 (_keys!10686 thiss!1141) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!28096 (_keys!10686 thiss!1141))))))

(declare-fun b!949396 () Bool)

(assert (=> b!949396 (= e!534480 e!534479)))

(declare-fun c!99064 () Bool)

(assert (=> b!949396 (= c!99064 (validKeyInArray!0 (select (arr!27618 (_keys!10686 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!949397 () Bool)

(assert (=> b!949397 (= e!534479 call!41290)))

(assert (= (and d!114875 c!99065) b!949395))

(assert (= (and d!114875 (not c!99065)) b!949396))

(assert (= (and b!949396 c!99064) b!949394))

(assert (= (and b!949396 (not c!99064)) b!949397))

(assert (= (or b!949394 b!949397) bm!41287))

(declare-fun m!881461 () Bool)

(assert (=> bm!41287 m!881461))

(assert (=> b!949396 m!881337))

(assert (=> b!949396 m!881337))

(assert (=> b!949396 m!881339))

(assert (=> b!949188 d!114875))

(declare-fun b!949407 () Bool)

(declare-fun res!636703 () Bool)

(declare-fun e!534483 () Bool)

(assert (=> b!949407 (=> (not res!636703) (not e!534483))))

(declare-fun size!28101 (LongMapFixedSize!4912) (_ BitVec 32))

(assert (=> b!949407 (= res!636703 (bvsge (size!28101 thiss!1141) (_size!2511 thiss!1141)))))

(declare-fun b!949406 () Bool)

(declare-fun res!636705 () Bool)

(assert (=> b!949406 (=> (not res!636705) (not e!534483))))

(assert (=> b!949406 (= res!636705 (and (= (size!28095 (_values!5786 thiss!1141)) (bvadd (mask!27536 thiss!1141) #b00000000000000000000000000000001)) (= (size!28096 (_keys!10686 thiss!1141)) (size!28095 (_values!5786 thiss!1141))) (bvsge (_size!2511 thiss!1141) #b00000000000000000000000000000000) (bvsle (_size!2511 thiss!1141) (bvadd (mask!27536 thiss!1141) #b00000000000000000000000000000001))))))

(declare-fun d!114877 () Bool)

(declare-fun res!636704 () Bool)

(assert (=> d!114877 (=> (not res!636704) (not e!534483))))

(assert (=> d!114877 (= res!636704 (validMask!0 (mask!27536 thiss!1141)))))

(assert (=> d!114877 (= (simpleValid!371 thiss!1141) e!534483)))

(declare-fun b!949409 () Bool)

(assert (=> b!949409 (= e!534483 (and (bvsge (extraKeys!5495 thiss!1141) #b00000000000000000000000000000000) (bvsle (extraKeys!5495 thiss!1141) #b00000000000000000000000000000011) (bvsge (_vacant!2511 thiss!1141) #b00000000000000000000000000000000)))))

(declare-fun b!949408 () Bool)

(declare-fun res!636706 () Bool)

(assert (=> b!949408 (=> (not res!636706) (not e!534483))))

(assert (=> b!949408 (= res!636706 (= (size!28101 thiss!1141) (bvadd (_size!2511 thiss!1141) (bvsdiv (bvadd (extraKeys!5495 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(assert (= (and d!114877 res!636704) b!949406))

(assert (= (and b!949406 res!636705) b!949407))

(assert (= (and b!949407 res!636703) b!949408))

(assert (= (and b!949408 res!636706) b!949409))

(declare-fun m!881463 () Bool)

(assert (=> b!949407 m!881463))

(assert (=> d!114877 m!881261))

(assert (=> b!949408 m!881463))

(assert (=> d!114839 d!114877))

(declare-fun b!949434 () Bool)

(declare-fun e!534499 () ListLongMap!12269)

(declare-fun e!534501 () ListLongMap!12269)

(assert (=> b!949434 (= e!534499 e!534501)))

(declare-fun c!99077 () Bool)

(assert (=> b!949434 (= c!99077 (validKeyInArray!0 (select (arr!27618 (_keys!10686 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun bm!41290 () Bool)

(declare-fun call!41293 () ListLongMap!12269)

(assert (=> bm!41290 (= call!41293 (getCurrentListMapNoExtraKeys!3350 (_keys!10686 thiss!1141) (_values!5786 thiss!1141) (mask!27536 thiss!1141) (extraKeys!5495 thiss!1141) (zeroValue!5599 thiss!1141) (minValue!5599 thiss!1141) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!5763 thiss!1141)))))

(declare-fun b!949435 () Bool)

(assert (=> b!949435 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28096 (_keys!10686 thiss!1141))))))

(assert (=> b!949435 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28095 (_values!5786 thiss!1141))))))

(declare-fun e!534502 () Bool)

(declare-fun lt!427455 () ListLongMap!12269)

(assert (=> b!949435 (= e!534502 (= (apply!868 lt!427455 (select (arr!27618 (_keys!10686 thiss!1141)) #b00000000000000000000000000000000)) (get!14512 (select (arr!27617 (_values!5786 thiss!1141)) #b00000000000000000000000000000000) (dynLambda!1634 (defaultEntry!5763 thiss!1141) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!949436 () Bool)

(declare-fun e!534503 () Bool)

(assert (=> b!949436 (= e!534503 e!534502)))

(assert (=> b!949436 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28096 (_keys!10686 thiss!1141))))))

(declare-fun res!636715 () Bool)

(assert (=> b!949436 (= res!636715 (contains!5181 lt!427455 (select (arr!27618 (_keys!10686 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (=> b!949436 (=> (not res!636715) (not e!534502))))

(declare-fun b!949437 () Bool)

(assert (=> b!949437 (= e!534499 (ListLongMap!12270 Nil!19327))))

(declare-fun d!114879 () Bool)

(declare-fun e!534500 () Bool)

(assert (=> d!114879 e!534500))

(declare-fun res!636718 () Bool)

(assert (=> d!114879 (=> (not res!636718) (not e!534500))))

(assert (=> d!114879 (= res!636718 (not (contains!5181 lt!427455 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!114879 (= lt!427455 e!534499)))

(declare-fun c!99075 () Bool)

(assert (=> d!114879 (= c!99075 (bvsge #b00000000000000000000000000000000 (size!28096 (_keys!10686 thiss!1141))))))

(assert (=> d!114879 (validMask!0 (mask!27536 thiss!1141))))

(assert (=> d!114879 (= (getCurrentListMapNoExtraKeys!3350 (_keys!10686 thiss!1141) (_values!5786 thiss!1141) (mask!27536 thiss!1141) (extraKeys!5495 thiss!1141) (zeroValue!5599 thiss!1141) (minValue!5599 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5763 thiss!1141)) lt!427455)))

(declare-fun b!949438 () Bool)

(declare-fun e!534504 () Bool)

(assert (=> b!949438 (= e!534503 e!534504)))

(declare-fun c!99076 () Bool)

(assert (=> b!949438 (= c!99076 (bvslt #b00000000000000000000000000000000 (size!28096 (_keys!10686 thiss!1141))))))

(declare-fun b!949439 () Bool)

(assert (=> b!949439 (= e!534501 call!41293)))

(declare-fun b!949440 () Bool)

(assert (=> b!949440 (= e!534500 e!534503)))

(declare-fun c!99074 () Bool)

(declare-fun e!534498 () Bool)

(assert (=> b!949440 (= c!99074 e!534498)))

(declare-fun res!636717 () Bool)

(assert (=> b!949440 (=> (not res!636717) (not e!534498))))

(assert (=> b!949440 (= res!636717 (bvslt #b00000000000000000000000000000000 (size!28096 (_keys!10686 thiss!1141))))))

(declare-fun b!949441 () Bool)

(declare-fun res!636716 () Bool)

(assert (=> b!949441 (=> (not res!636716) (not e!534500))))

(assert (=> b!949441 (= res!636716 (not (contains!5181 lt!427455 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!949442 () Bool)

(assert (=> b!949442 (= e!534498 (validKeyInArray!0 (select (arr!27618 (_keys!10686 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (=> b!949442 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!949443 () Bool)

(declare-fun isEmpty!716 (ListLongMap!12269) Bool)

(assert (=> b!949443 (= e!534504 (isEmpty!716 lt!427455))))

(declare-fun b!949444 () Bool)

(assert (=> b!949444 (= e!534504 (= lt!427455 (getCurrentListMapNoExtraKeys!3350 (_keys!10686 thiss!1141) (_values!5786 thiss!1141) (mask!27536 thiss!1141) (extraKeys!5495 thiss!1141) (zeroValue!5599 thiss!1141) (minValue!5599 thiss!1141) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!5763 thiss!1141))))))

(declare-fun b!949445 () Bool)

(declare-fun lt!427450 () Unit!31851)

(declare-fun lt!427453 () Unit!31851)

(assert (=> b!949445 (= lt!427450 lt!427453)))

(declare-fun lt!427451 () ListLongMap!12269)

(declare-fun lt!427452 () (_ BitVec 64))

(declare-fun lt!427456 () V!32599)

(declare-fun lt!427454 () (_ BitVec 64))

(assert (=> b!949445 (not (contains!5181 (+!2878 lt!427451 (tuple2!13583 lt!427452 lt!427456)) lt!427454))))

(declare-fun addStillNotContains!227 (ListLongMap!12269 (_ BitVec 64) V!32599 (_ BitVec 64)) Unit!31851)

(assert (=> b!949445 (= lt!427453 (addStillNotContains!227 lt!427451 lt!427452 lt!427456 lt!427454))))

(assert (=> b!949445 (= lt!427454 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!949445 (= lt!427456 (get!14512 (select (arr!27617 (_values!5786 thiss!1141)) #b00000000000000000000000000000000) (dynLambda!1634 (defaultEntry!5763 thiss!1141) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!949445 (= lt!427452 (select (arr!27618 (_keys!10686 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!949445 (= lt!427451 call!41293)))

(assert (=> b!949445 (= e!534501 (+!2878 call!41293 (tuple2!13583 (select (arr!27618 (_keys!10686 thiss!1141)) #b00000000000000000000000000000000) (get!14512 (select (arr!27617 (_values!5786 thiss!1141)) #b00000000000000000000000000000000) (dynLambda!1634 (defaultEntry!5763 thiss!1141) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!114879 c!99075) b!949437))

(assert (= (and d!114879 (not c!99075)) b!949434))

(assert (= (and b!949434 c!99077) b!949445))

(assert (= (and b!949434 (not c!99077)) b!949439))

(assert (= (or b!949445 b!949439) bm!41290))

(assert (= (and d!114879 res!636718) b!949441))

(assert (= (and b!949441 res!636716) b!949440))

(assert (= (and b!949440 res!636717) b!949442))

(assert (= (and b!949440 c!99074) b!949436))

(assert (= (and b!949440 (not c!99074)) b!949438))

(assert (= (and b!949436 res!636715) b!949435))

(assert (= (and b!949438 c!99076) b!949444))

(assert (= (and b!949438 (not c!99076)) b!949443))

(declare-fun b_lambda!14333 () Bool)

(assert (=> (not b_lambda!14333) (not b!949435)))

(assert (=> b!949435 t!27657))

(declare-fun b_and!29645 () Bool)

(assert (= b_and!29643 (and (=> t!27657 result!12269) b_and!29645)))

(declare-fun b_lambda!14335 () Bool)

(assert (=> (not b_lambda!14335) (not b!949445)))

(assert (=> b!949445 t!27657))

(declare-fun b_and!29647 () Bool)

(assert (= b_and!29645 (and (=> t!27657 result!12269) b_and!29647)))

(declare-fun m!881465 () Bool)

(assert (=> b!949444 m!881465))

(assert (=> b!949435 m!881337))

(assert (=> b!949435 m!881379))

(assert (=> b!949435 m!881381))

(assert (=> b!949435 m!881383))

(assert (=> b!949435 m!881379))

(assert (=> b!949435 m!881381))

(assert (=> b!949435 m!881337))

(declare-fun m!881467 () Bool)

(assert (=> b!949435 m!881467))

(declare-fun m!881469 () Bool)

(assert (=> b!949443 m!881469))

(assert (=> bm!41290 m!881465))

(assert (=> b!949436 m!881337))

(assert (=> b!949436 m!881337))

(declare-fun m!881471 () Bool)

(assert (=> b!949436 m!881471))

(declare-fun m!881473 () Bool)

(assert (=> b!949445 m!881473))

(declare-fun m!881475 () Bool)

(assert (=> b!949445 m!881475))

(assert (=> b!949445 m!881337))

(assert (=> b!949445 m!881379))

(assert (=> b!949445 m!881381))

(assert (=> b!949445 m!881383))

(assert (=> b!949445 m!881379))

(declare-fun m!881477 () Bool)

(assert (=> b!949445 m!881477))

(assert (=> b!949445 m!881381))

(declare-fun m!881479 () Bool)

(assert (=> b!949445 m!881479))

(assert (=> b!949445 m!881473))

(assert (=> b!949442 m!881337))

(assert (=> b!949442 m!881337))

(assert (=> b!949442 m!881339))

(assert (=> b!949434 m!881337))

(assert (=> b!949434 m!881337))

(assert (=> b!949434 m!881339))

(declare-fun m!881481 () Bool)

(assert (=> b!949441 m!881481))

(declare-fun m!881483 () Bool)

(assert (=> d!114879 m!881483))

(assert (=> d!114879 m!881261))

(assert (=> bm!41276 d!114879))

(declare-fun d!114881 () Bool)

(declare-fun e!534505 () Bool)

(assert (=> d!114881 e!534505))

(declare-fun res!636719 () Bool)

(assert (=> d!114881 (=> (not res!636719) (not e!534505))))

(declare-fun lt!427460 () ListLongMap!12269)

(assert (=> d!114881 (= res!636719 (contains!5181 lt!427460 (_1!6802 (tuple2!13583 lt!427366 (minValue!5599 thiss!1141)))))))

(declare-fun lt!427459 () List!19330)

(assert (=> d!114881 (= lt!427460 (ListLongMap!12270 lt!427459))))

(declare-fun lt!427458 () Unit!31851)

(declare-fun lt!427457 () Unit!31851)

(assert (=> d!114881 (= lt!427458 lt!427457)))

(assert (=> d!114881 (= (getValueByKey!497 lt!427459 (_1!6802 (tuple2!13583 lt!427366 (minValue!5599 thiss!1141)))) (Some!502 (_2!6802 (tuple2!13583 lt!427366 (minValue!5599 thiss!1141)))))))

(assert (=> d!114881 (= lt!427457 (lemmaContainsTupThenGetReturnValue!266 lt!427459 (_1!6802 (tuple2!13583 lt!427366 (minValue!5599 thiss!1141))) (_2!6802 (tuple2!13583 lt!427366 (minValue!5599 thiss!1141)))))))

(assert (=> d!114881 (= lt!427459 (insertStrictlySorted!323 (toList!6150 lt!427364) (_1!6802 (tuple2!13583 lt!427366 (minValue!5599 thiss!1141))) (_2!6802 (tuple2!13583 lt!427366 (minValue!5599 thiss!1141)))))))

(assert (=> d!114881 (= (+!2878 lt!427364 (tuple2!13583 lt!427366 (minValue!5599 thiss!1141))) lt!427460)))

(declare-fun b!949446 () Bool)

(declare-fun res!636720 () Bool)

(assert (=> b!949446 (=> (not res!636720) (not e!534505))))

(assert (=> b!949446 (= res!636720 (= (getValueByKey!497 (toList!6150 lt!427460) (_1!6802 (tuple2!13583 lt!427366 (minValue!5599 thiss!1141)))) (Some!502 (_2!6802 (tuple2!13583 lt!427366 (minValue!5599 thiss!1141))))))))

(declare-fun b!949447 () Bool)

(assert (=> b!949447 (= e!534505 (contains!5183 (toList!6150 lt!427460) (tuple2!13583 lt!427366 (minValue!5599 thiss!1141))))))

(assert (= (and d!114881 res!636719) b!949446))

(assert (= (and b!949446 res!636720) b!949447))

(declare-fun m!881485 () Bool)

(assert (=> d!114881 m!881485))

(declare-fun m!881487 () Bool)

(assert (=> d!114881 m!881487))

(declare-fun m!881489 () Bool)

(assert (=> d!114881 m!881489))

(declare-fun m!881491 () Bool)

(assert (=> d!114881 m!881491))

(declare-fun m!881493 () Bool)

(assert (=> b!949446 m!881493))

(declare-fun m!881495 () Bool)

(assert (=> b!949447 m!881495))

(assert (=> b!949263 d!114881))

(declare-fun d!114883 () Bool)

(declare-fun e!534507 () Bool)

(assert (=> d!114883 e!534507))

(declare-fun res!636721 () Bool)

(assert (=> d!114883 (=> res!636721 e!534507)))

(declare-fun lt!427462 () Bool)

(assert (=> d!114883 (= res!636721 (not lt!427462))))

(declare-fun lt!427463 () Bool)

(assert (=> d!114883 (= lt!427462 lt!427463)))

(declare-fun lt!427464 () Unit!31851)

(declare-fun e!534506 () Unit!31851)

(assert (=> d!114883 (= lt!427464 e!534506)))

(declare-fun c!99078 () Bool)

(assert (=> d!114883 (= c!99078 lt!427463)))

(assert (=> d!114883 (= lt!427463 (containsKey!461 (toList!6150 (+!2878 lt!427384 (tuple2!13583 lt!427380 (zeroValue!5599 thiss!1141)))) lt!427383))))

(assert (=> d!114883 (= (contains!5181 (+!2878 lt!427384 (tuple2!13583 lt!427380 (zeroValue!5599 thiss!1141))) lt!427383) lt!427462)))

(declare-fun b!949448 () Bool)

(declare-fun lt!427461 () Unit!31851)

(assert (=> b!949448 (= e!534506 lt!427461)))

(assert (=> b!949448 (= lt!427461 (lemmaContainsKeyImpliesGetValueByKeyDefined!356 (toList!6150 (+!2878 lt!427384 (tuple2!13583 lt!427380 (zeroValue!5599 thiss!1141)))) lt!427383))))

(assert (=> b!949448 (isDefined!369 (getValueByKey!497 (toList!6150 (+!2878 lt!427384 (tuple2!13583 lt!427380 (zeroValue!5599 thiss!1141)))) lt!427383))))

(declare-fun b!949449 () Bool)

(declare-fun Unit!31856 () Unit!31851)

(assert (=> b!949449 (= e!534506 Unit!31856)))

(declare-fun b!949450 () Bool)

(assert (=> b!949450 (= e!534507 (isDefined!369 (getValueByKey!497 (toList!6150 (+!2878 lt!427384 (tuple2!13583 lt!427380 (zeroValue!5599 thiss!1141)))) lt!427383)))))

(assert (= (and d!114883 c!99078) b!949448))

(assert (= (and d!114883 (not c!99078)) b!949449))

(assert (= (and d!114883 (not res!636721)) b!949450))

(declare-fun m!881497 () Bool)

(assert (=> d!114883 m!881497))

(declare-fun m!881499 () Bool)

(assert (=> b!949448 m!881499))

(declare-fun m!881501 () Bool)

(assert (=> b!949448 m!881501))

(assert (=> b!949448 m!881501))

(declare-fun m!881503 () Bool)

(assert (=> b!949448 m!881503))

(assert (=> b!949450 m!881501))

(assert (=> b!949450 m!881501))

(assert (=> b!949450 m!881503))

(assert (=> b!949263 d!114883))

(declare-fun d!114885 () Bool)

(assert (=> d!114885 (= (apply!868 (+!2878 lt!427382 (tuple2!13583 lt!427374 (minValue!5599 thiss!1141))) lt!427377) (get!14513 (getValueByKey!497 (toList!6150 (+!2878 lt!427382 (tuple2!13583 lt!427374 (minValue!5599 thiss!1141)))) lt!427377)))))

(declare-fun bs!26658 () Bool)

(assert (= bs!26658 d!114885))

(declare-fun m!881505 () Bool)

(assert (=> bs!26658 m!881505))

(assert (=> bs!26658 m!881505))

(declare-fun m!881507 () Bool)

(assert (=> bs!26658 m!881507))

(assert (=> b!949263 d!114885))

(declare-fun d!114887 () Bool)

(declare-fun e!534508 () Bool)

(assert (=> d!114887 e!534508))

(declare-fun res!636722 () Bool)

(assert (=> d!114887 (=> (not res!636722) (not e!534508))))

(declare-fun lt!427468 () ListLongMap!12269)

(assert (=> d!114887 (= res!636722 (contains!5181 lt!427468 (_1!6802 (tuple2!13583 lt!427374 (minValue!5599 thiss!1141)))))))

(declare-fun lt!427467 () List!19330)

(assert (=> d!114887 (= lt!427468 (ListLongMap!12270 lt!427467))))

(declare-fun lt!427466 () Unit!31851)

(declare-fun lt!427465 () Unit!31851)

(assert (=> d!114887 (= lt!427466 lt!427465)))

(assert (=> d!114887 (= (getValueByKey!497 lt!427467 (_1!6802 (tuple2!13583 lt!427374 (minValue!5599 thiss!1141)))) (Some!502 (_2!6802 (tuple2!13583 lt!427374 (minValue!5599 thiss!1141)))))))

(assert (=> d!114887 (= lt!427465 (lemmaContainsTupThenGetReturnValue!266 lt!427467 (_1!6802 (tuple2!13583 lt!427374 (minValue!5599 thiss!1141))) (_2!6802 (tuple2!13583 lt!427374 (minValue!5599 thiss!1141)))))))

(assert (=> d!114887 (= lt!427467 (insertStrictlySorted!323 (toList!6150 lt!427382) (_1!6802 (tuple2!13583 lt!427374 (minValue!5599 thiss!1141))) (_2!6802 (tuple2!13583 lt!427374 (minValue!5599 thiss!1141)))))))

(assert (=> d!114887 (= (+!2878 lt!427382 (tuple2!13583 lt!427374 (minValue!5599 thiss!1141))) lt!427468)))

(declare-fun b!949451 () Bool)

(declare-fun res!636723 () Bool)

(assert (=> b!949451 (=> (not res!636723) (not e!534508))))

(assert (=> b!949451 (= res!636723 (= (getValueByKey!497 (toList!6150 lt!427468) (_1!6802 (tuple2!13583 lt!427374 (minValue!5599 thiss!1141)))) (Some!502 (_2!6802 (tuple2!13583 lt!427374 (minValue!5599 thiss!1141))))))))

(declare-fun b!949452 () Bool)

(assert (=> b!949452 (= e!534508 (contains!5183 (toList!6150 lt!427468) (tuple2!13583 lt!427374 (minValue!5599 thiss!1141))))))

(assert (= (and d!114887 res!636722) b!949451))

(assert (= (and b!949451 res!636723) b!949452))

(declare-fun m!881509 () Bool)

(assert (=> d!114887 m!881509))

(declare-fun m!881511 () Bool)

(assert (=> d!114887 m!881511))

(declare-fun m!881513 () Bool)

(assert (=> d!114887 m!881513))

(declare-fun m!881515 () Bool)

(assert (=> d!114887 m!881515))

(declare-fun m!881517 () Bool)

(assert (=> b!949451 m!881517))

(declare-fun m!881519 () Bool)

(assert (=> b!949452 m!881519))

(assert (=> b!949263 d!114887))

(declare-fun d!114889 () Bool)

(assert (=> d!114889 (= (apply!868 (+!2878 lt!427364 (tuple2!13583 lt!427366 (minValue!5599 thiss!1141))) lt!427375) (apply!868 lt!427364 lt!427375))))

(declare-fun lt!427471 () Unit!31851)

(declare-fun choose!1590 (ListLongMap!12269 (_ BitVec 64) V!32599 (_ BitVec 64)) Unit!31851)

(assert (=> d!114889 (= lt!427471 (choose!1590 lt!427364 lt!427366 (minValue!5599 thiss!1141) lt!427375))))

(declare-fun e!534511 () Bool)

(assert (=> d!114889 e!534511))

(declare-fun res!636726 () Bool)

(assert (=> d!114889 (=> (not res!636726) (not e!534511))))

(assert (=> d!114889 (= res!636726 (contains!5181 lt!427364 lt!427375))))

(assert (=> d!114889 (= (addApplyDifferent!447 lt!427364 lt!427366 (minValue!5599 thiss!1141) lt!427375) lt!427471)))

(declare-fun b!949456 () Bool)

(assert (=> b!949456 (= e!534511 (not (= lt!427375 lt!427366)))))

(assert (= (and d!114889 res!636726) b!949456))

(declare-fun m!881521 () Bool)

(assert (=> d!114889 m!881521))

(assert (=> d!114889 m!881349))

(assert (=> d!114889 m!881341))

(declare-fun m!881523 () Bool)

(assert (=> d!114889 m!881523))

(assert (=> d!114889 m!881341))

(assert (=> d!114889 m!881343))

(assert (=> b!949263 d!114889))

(declare-fun d!114891 () Bool)

(declare-fun e!534512 () Bool)

(assert (=> d!114891 e!534512))

(declare-fun res!636727 () Bool)

(assert (=> d!114891 (=> (not res!636727) (not e!534512))))

(declare-fun lt!427475 () ListLongMap!12269)

(assert (=> d!114891 (= res!636727 (contains!5181 lt!427475 (_1!6802 (tuple2!13583 lt!427380 (zeroValue!5599 thiss!1141)))))))

(declare-fun lt!427474 () List!19330)

(assert (=> d!114891 (= lt!427475 (ListLongMap!12270 lt!427474))))

(declare-fun lt!427473 () Unit!31851)

(declare-fun lt!427472 () Unit!31851)

(assert (=> d!114891 (= lt!427473 lt!427472)))

(assert (=> d!114891 (= (getValueByKey!497 lt!427474 (_1!6802 (tuple2!13583 lt!427380 (zeroValue!5599 thiss!1141)))) (Some!502 (_2!6802 (tuple2!13583 lt!427380 (zeroValue!5599 thiss!1141)))))))

(assert (=> d!114891 (= lt!427472 (lemmaContainsTupThenGetReturnValue!266 lt!427474 (_1!6802 (tuple2!13583 lt!427380 (zeroValue!5599 thiss!1141))) (_2!6802 (tuple2!13583 lt!427380 (zeroValue!5599 thiss!1141)))))))

(assert (=> d!114891 (= lt!427474 (insertStrictlySorted!323 (toList!6150 lt!427384) (_1!6802 (tuple2!13583 lt!427380 (zeroValue!5599 thiss!1141))) (_2!6802 (tuple2!13583 lt!427380 (zeroValue!5599 thiss!1141)))))))

(assert (=> d!114891 (= (+!2878 lt!427384 (tuple2!13583 lt!427380 (zeroValue!5599 thiss!1141))) lt!427475)))

(declare-fun b!949457 () Bool)

(declare-fun res!636728 () Bool)

(assert (=> b!949457 (=> (not res!636728) (not e!534512))))

(assert (=> b!949457 (= res!636728 (= (getValueByKey!497 (toList!6150 lt!427475) (_1!6802 (tuple2!13583 lt!427380 (zeroValue!5599 thiss!1141)))) (Some!502 (_2!6802 (tuple2!13583 lt!427380 (zeroValue!5599 thiss!1141))))))))

(declare-fun b!949458 () Bool)

(assert (=> b!949458 (= e!534512 (contains!5183 (toList!6150 lt!427475) (tuple2!13583 lt!427380 (zeroValue!5599 thiss!1141))))))

(assert (= (and d!114891 res!636727) b!949457))

(assert (= (and b!949457 res!636728) b!949458))

(declare-fun m!881525 () Bool)

(assert (=> d!114891 m!881525))

(declare-fun m!881527 () Bool)

(assert (=> d!114891 m!881527))

(declare-fun m!881529 () Bool)

(assert (=> d!114891 m!881529))

(declare-fun m!881531 () Bool)

(assert (=> d!114891 m!881531))

(declare-fun m!881533 () Bool)

(assert (=> b!949457 m!881533))

(declare-fun m!881535 () Bool)

(assert (=> b!949458 m!881535))

(assert (=> b!949263 d!114891))

(declare-fun d!114893 () Bool)

(assert (=> d!114893 (= (apply!868 lt!427382 lt!427377) (get!14513 (getValueByKey!497 (toList!6150 lt!427382) lt!427377)))))

(declare-fun bs!26659 () Bool)

(assert (= bs!26659 d!114893))

(declare-fun m!881537 () Bool)

(assert (=> bs!26659 m!881537))

(assert (=> bs!26659 m!881537))

(declare-fun m!881539 () Bool)

(assert (=> bs!26659 m!881539))

(assert (=> b!949263 d!114893))

(declare-fun d!114895 () Bool)

(assert (=> d!114895 (= (apply!868 lt!427364 lt!427375) (get!14513 (getValueByKey!497 (toList!6150 lt!427364) lt!427375)))))

(declare-fun bs!26660 () Bool)

(assert (= bs!26660 d!114895))

(declare-fun m!881541 () Bool)

(assert (=> bs!26660 m!881541))

(assert (=> bs!26660 m!881541))

(declare-fun m!881543 () Bool)

(assert (=> bs!26660 m!881543))

(assert (=> b!949263 d!114895))

(declare-fun d!114897 () Bool)

(assert (=> d!114897 (contains!5181 (+!2878 lt!427384 (tuple2!13583 lt!427380 (zeroValue!5599 thiss!1141))) lt!427383)))

(declare-fun lt!427478 () Unit!31851)

(declare-fun choose!1591 (ListLongMap!12269 (_ BitVec 64) V!32599 (_ BitVec 64)) Unit!31851)

(assert (=> d!114897 (= lt!427478 (choose!1591 lt!427384 lt!427380 (zeroValue!5599 thiss!1141) lt!427383))))

(assert (=> d!114897 (contains!5181 lt!427384 lt!427383)))

(assert (=> d!114897 (= (addStillContains!567 lt!427384 lt!427380 (zeroValue!5599 thiss!1141) lt!427383) lt!427478)))

(declare-fun bs!26661 () Bool)

(assert (= bs!26661 d!114897))

(assert (=> bs!26661 m!881361))

(assert (=> bs!26661 m!881361))

(assert (=> bs!26661 m!881363))

(declare-fun m!881545 () Bool)

(assert (=> bs!26661 m!881545))

(declare-fun m!881547 () Bool)

(assert (=> bs!26661 m!881547))

(assert (=> b!949263 d!114897))

(assert (=> b!949263 d!114879))

(declare-fun d!114899 () Bool)

(declare-fun e!534513 () Bool)

(assert (=> d!114899 e!534513))

(declare-fun res!636729 () Bool)

(assert (=> d!114899 (=> (not res!636729) (not e!534513))))

(declare-fun lt!427482 () ListLongMap!12269)

(assert (=> d!114899 (= res!636729 (contains!5181 lt!427482 (_1!6802 (tuple2!13583 lt!427373 (zeroValue!5599 thiss!1141)))))))

(declare-fun lt!427481 () List!19330)

(assert (=> d!114899 (= lt!427482 (ListLongMap!12270 lt!427481))))

(declare-fun lt!427480 () Unit!31851)

(declare-fun lt!427479 () Unit!31851)

(assert (=> d!114899 (= lt!427480 lt!427479)))

(assert (=> d!114899 (= (getValueByKey!497 lt!427481 (_1!6802 (tuple2!13583 lt!427373 (zeroValue!5599 thiss!1141)))) (Some!502 (_2!6802 (tuple2!13583 lt!427373 (zeroValue!5599 thiss!1141)))))))

(assert (=> d!114899 (= lt!427479 (lemmaContainsTupThenGetReturnValue!266 lt!427481 (_1!6802 (tuple2!13583 lt!427373 (zeroValue!5599 thiss!1141))) (_2!6802 (tuple2!13583 lt!427373 (zeroValue!5599 thiss!1141)))))))

(assert (=> d!114899 (= lt!427481 (insertStrictlySorted!323 (toList!6150 lt!427371) (_1!6802 (tuple2!13583 lt!427373 (zeroValue!5599 thiss!1141))) (_2!6802 (tuple2!13583 lt!427373 (zeroValue!5599 thiss!1141)))))))

(assert (=> d!114899 (= (+!2878 lt!427371 (tuple2!13583 lt!427373 (zeroValue!5599 thiss!1141))) lt!427482)))

(declare-fun b!949460 () Bool)

(declare-fun res!636730 () Bool)

(assert (=> b!949460 (=> (not res!636730) (not e!534513))))

(assert (=> b!949460 (= res!636730 (= (getValueByKey!497 (toList!6150 lt!427482) (_1!6802 (tuple2!13583 lt!427373 (zeroValue!5599 thiss!1141)))) (Some!502 (_2!6802 (tuple2!13583 lt!427373 (zeroValue!5599 thiss!1141))))))))

(declare-fun b!949461 () Bool)

(assert (=> b!949461 (= e!534513 (contains!5183 (toList!6150 lt!427482) (tuple2!13583 lt!427373 (zeroValue!5599 thiss!1141))))))

(assert (= (and d!114899 res!636729) b!949460))

(assert (= (and b!949460 res!636730) b!949461))

(declare-fun m!881549 () Bool)

(assert (=> d!114899 m!881549))

(declare-fun m!881551 () Bool)

(assert (=> d!114899 m!881551))

(declare-fun m!881553 () Bool)

(assert (=> d!114899 m!881553))

(declare-fun m!881555 () Bool)

(assert (=> d!114899 m!881555))

(declare-fun m!881557 () Bool)

(assert (=> b!949460 m!881557))

(declare-fun m!881559 () Bool)

(assert (=> b!949461 m!881559))

(assert (=> b!949263 d!114899))

(declare-fun d!114901 () Bool)

(assert (=> d!114901 (= (apply!868 (+!2878 lt!427371 (tuple2!13583 lt!427373 (zeroValue!5599 thiss!1141))) lt!427367) (apply!868 lt!427371 lt!427367))))

(declare-fun lt!427483 () Unit!31851)

(assert (=> d!114901 (= lt!427483 (choose!1590 lt!427371 lt!427373 (zeroValue!5599 thiss!1141) lt!427367))))

(declare-fun e!534514 () Bool)

(assert (=> d!114901 e!534514))

(declare-fun res!636731 () Bool)

(assert (=> d!114901 (=> (not res!636731) (not e!534514))))

(assert (=> d!114901 (= res!636731 (contains!5181 lt!427371 lt!427367))))

(assert (=> d!114901 (= (addApplyDifferent!447 lt!427371 lt!427373 (zeroValue!5599 thiss!1141) lt!427367) lt!427483)))

(declare-fun b!949462 () Bool)

(assert (=> b!949462 (= e!534514 (not (= lt!427367 lt!427373)))))

(assert (= (and d!114901 res!636731) b!949462))

(declare-fun m!881561 () Bool)

(assert (=> d!114901 m!881561))

(assert (=> d!114901 m!881367))

(assert (=> d!114901 m!881353))

(declare-fun m!881563 () Bool)

(assert (=> d!114901 m!881563))

(assert (=> d!114901 m!881353))

(assert (=> d!114901 m!881355))

(assert (=> b!949263 d!114901))

(declare-fun d!114903 () Bool)

(assert (=> d!114903 (= (apply!868 (+!2878 lt!427371 (tuple2!13583 lt!427373 (zeroValue!5599 thiss!1141))) lt!427367) (get!14513 (getValueByKey!497 (toList!6150 (+!2878 lt!427371 (tuple2!13583 lt!427373 (zeroValue!5599 thiss!1141)))) lt!427367)))))

(declare-fun bs!26662 () Bool)

(assert (= bs!26662 d!114903))

(declare-fun m!881565 () Bool)

(assert (=> bs!26662 m!881565))

(assert (=> bs!26662 m!881565))

(declare-fun m!881567 () Bool)

(assert (=> bs!26662 m!881567))

(assert (=> b!949263 d!114903))

(declare-fun d!114905 () Bool)

(assert (=> d!114905 (= (apply!868 (+!2878 lt!427364 (tuple2!13583 lt!427366 (minValue!5599 thiss!1141))) lt!427375) (get!14513 (getValueByKey!497 (toList!6150 (+!2878 lt!427364 (tuple2!13583 lt!427366 (minValue!5599 thiss!1141)))) lt!427375)))))

(declare-fun bs!26663 () Bool)

(assert (= bs!26663 d!114905))

(declare-fun m!881569 () Bool)

(assert (=> bs!26663 m!881569))

(assert (=> bs!26663 m!881569))

(declare-fun m!881571 () Bool)

(assert (=> bs!26663 m!881571))

(assert (=> b!949263 d!114905))

(declare-fun d!114907 () Bool)

(assert (=> d!114907 (= (apply!868 (+!2878 lt!427382 (tuple2!13583 lt!427374 (minValue!5599 thiss!1141))) lt!427377) (apply!868 lt!427382 lt!427377))))

(declare-fun lt!427484 () Unit!31851)

(assert (=> d!114907 (= lt!427484 (choose!1590 lt!427382 lt!427374 (minValue!5599 thiss!1141) lt!427377))))

(declare-fun e!534515 () Bool)

(assert (=> d!114907 e!534515))

(declare-fun res!636732 () Bool)

(assert (=> d!114907 (=> (not res!636732) (not e!534515))))

(assert (=> d!114907 (= res!636732 (contains!5181 lt!427382 lt!427377))))

(assert (=> d!114907 (= (addApplyDifferent!447 lt!427382 lt!427374 (minValue!5599 thiss!1141) lt!427377) lt!427484)))

(declare-fun b!949463 () Bool)

(assert (=> b!949463 (= e!534515 (not (= lt!427377 lt!427374)))))

(assert (= (and d!114907 res!636732) b!949463))

(declare-fun m!881573 () Bool)

(assert (=> d!114907 m!881573))

(assert (=> d!114907 m!881347))

(assert (=> d!114907 m!881357))

(declare-fun m!881575 () Bool)

(assert (=> d!114907 m!881575))

(assert (=> d!114907 m!881357))

(assert (=> d!114907 m!881359))

(assert (=> b!949263 d!114907))

(declare-fun d!114909 () Bool)

(assert (=> d!114909 (= (apply!868 lt!427371 lt!427367) (get!14513 (getValueByKey!497 (toList!6150 lt!427371) lt!427367)))))

(declare-fun bs!26664 () Bool)

(assert (= bs!26664 d!114909))

(declare-fun m!881577 () Bool)

(assert (=> bs!26664 m!881577))

(assert (=> bs!26664 m!881577))

(declare-fun m!881579 () Bool)

(assert (=> bs!26664 m!881579))

(assert (=> b!949263 d!114909))

(declare-fun d!114911 () Bool)

(assert (=> d!114911 (isDefined!369 (getValueByKey!497 (toList!6150 (getCurrentListMap!3312 (_keys!10686 thiss!1141) (_values!5786 thiss!1141) (mask!27536 thiss!1141) (extraKeys!5495 thiss!1141) (zeroValue!5599 thiss!1141) (minValue!5599 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5763 thiss!1141))) key!756))))

(declare-fun lt!427487 () Unit!31851)

(declare-fun choose!1592 (List!19330 (_ BitVec 64)) Unit!31851)

(assert (=> d!114911 (= lt!427487 (choose!1592 (toList!6150 (getCurrentListMap!3312 (_keys!10686 thiss!1141) (_values!5786 thiss!1141) (mask!27536 thiss!1141) (extraKeys!5495 thiss!1141) (zeroValue!5599 thiss!1141) (minValue!5599 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5763 thiss!1141))) key!756))))

(declare-fun e!534518 () Bool)

(assert (=> d!114911 e!534518))

(declare-fun res!636735 () Bool)

(assert (=> d!114911 (=> (not res!636735) (not e!534518))))

(declare-fun isStrictlySorted!507 (List!19330) Bool)

(assert (=> d!114911 (= res!636735 (isStrictlySorted!507 (toList!6150 (getCurrentListMap!3312 (_keys!10686 thiss!1141) (_values!5786 thiss!1141) (mask!27536 thiss!1141) (extraKeys!5495 thiss!1141) (zeroValue!5599 thiss!1141) (minValue!5599 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5763 thiss!1141)))))))

(assert (=> d!114911 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!356 (toList!6150 (getCurrentListMap!3312 (_keys!10686 thiss!1141) (_values!5786 thiss!1141) (mask!27536 thiss!1141) (extraKeys!5495 thiss!1141) (zeroValue!5599 thiss!1141) (minValue!5599 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5763 thiss!1141))) key!756) lt!427487)))

(declare-fun b!949466 () Bool)

(assert (=> b!949466 (= e!534518 (containsKey!461 (toList!6150 (getCurrentListMap!3312 (_keys!10686 thiss!1141) (_values!5786 thiss!1141) (mask!27536 thiss!1141) (extraKeys!5495 thiss!1141) (zeroValue!5599 thiss!1141) (minValue!5599 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5763 thiss!1141))) key!756))))

(assert (= (and d!114911 res!636735) b!949466))

(assert (=> d!114911 m!881331))

(assert (=> d!114911 m!881331))

(assert (=> d!114911 m!881333))

(declare-fun m!881581 () Bool)

(assert (=> d!114911 m!881581))

(declare-fun m!881583 () Bool)

(assert (=> d!114911 m!881583))

(assert (=> b!949466 m!881327))

(assert (=> b!949215 d!114911))

(assert (=> b!949215 d!114869))

(assert (=> b!949215 d!114871))

(declare-fun d!114913 () Bool)

(declare-fun e!534520 () Bool)

(assert (=> d!114913 e!534520))

(declare-fun res!636736 () Bool)

(assert (=> d!114913 (=> res!636736 e!534520)))

(declare-fun lt!427489 () Bool)

(assert (=> d!114913 (= res!636736 (not lt!427489))))

(declare-fun lt!427490 () Bool)

(assert (=> d!114913 (= lt!427489 lt!427490)))

(declare-fun lt!427491 () Unit!31851)

(declare-fun e!534519 () Unit!31851)

(assert (=> d!114913 (= lt!427491 e!534519)))

(declare-fun c!99079 () Bool)

(assert (=> d!114913 (= c!99079 lt!427490)))

(assert (=> d!114913 (= lt!427490 (containsKey!461 (toList!6150 lt!427369) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!114913 (= (contains!5181 lt!427369 #b1000000000000000000000000000000000000000000000000000000000000000) lt!427489)))

(declare-fun b!949467 () Bool)

(declare-fun lt!427488 () Unit!31851)

(assert (=> b!949467 (= e!534519 lt!427488)))

(assert (=> b!949467 (= lt!427488 (lemmaContainsKeyImpliesGetValueByKeyDefined!356 (toList!6150 lt!427369) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!949467 (isDefined!369 (getValueByKey!497 (toList!6150 lt!427369) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!949468 () Bool)

(declare-fun Unit!31857 () Unit!31851)

(assert (=> b!949468 (= e!534519 Unit!31857)))

(declare-fun b!949469 () Bool)

(assert (=> b!949469 (= e!534520 (isDefined!369 (getValueByKey!497 (toList!6150 lt!427369) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!114913 c!99079) b!949467))

(assert (= (and d!114913 (not c!99079)) b!949468))

(assert (= (and d!114913 (not res!636736)) b!949469))

(declare-fun m!881585 () Bool)

(assert (=> d!114913 m!881585))

(declare-fun m!881587 () Bool)

(assert (=> b!949467 m!881587))

(declare-fun m!881589 () Bool)

(assert (=> b!949467 m!881589))

(assert (=> b!949467 m!881589))

(declare-fun m!881591 () Bool)

(assert (=> b!949467 m!881591))

(assert (=> b!949469 m!881589))

(assert (=> b!949469 m!881589))

(assert (=> b!949469 m!881591))

(assert (=> bm!41275 d!114913))

(assert (=> d!114845 d!114847))

(declare-fun d!114915 () Bool)

(declare-fun res!636741 () Bool)

(declare-fun e!534525 () Bool)

(assert (=> d!114915 (=> res!636741 e!534525)))

(assert (=> d!114915 (= res!636741 (and ((_ is Cons!19326) (toList!6150 (getCurrentListMap!3312 (_keys!10686 thiss!1141) (_values!5786 thiss!1141) (mask!27536 thiss!1141) (extraKeys!5495 thiss!1141) (zeroValue!5599 thiss!1141) (minValue!5599 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5763 thiss!1141)))) (= (_1!6802 (h!20485 (toList!6150 (getCurrentListMap!3312 (_keys!10686 thiss!1141) (_values!5786 thiss!1141) (mask!27536 thiss!1141) (extraKeys!5495 thiss!1141) (zeroValue!5599 thiss!1141) (minValue!5599 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5763 thiss!1141))))) key!756)))))

(assert (=> d!114915 (= (containsKey!461 (toList!6150 (getCurrentListMap!3312 (_keys!10686 thiss!1141) (_values!5786 thiss!1141) (mask!27536 thiss!1141) (extraKeys!5495 thiss!1141) (zeroValue!5599 thiss!1141) (minValue!5599 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5763 thiss!1141))) key!756) e!534525)))

(declare-fun b!949474 () Bool)

(declare-fun e!534526 () Bool)

(assert (=> b!949474 (= e!534525 e!534526)))

(declare-fun res!636742 () Bool)

(assert (=> b!949474 (=> (not res!636742) (not e!534526))))

(assert (=> b!949474 (= res!636742 (and (or (not ((_ is Cons!19326) (toList!6150 (getCurrentListMap!3312 (_keys!10686 thiss!1141) (_values!5786 thiss!1141) (mask!27536 thiss!1141) (extraKeys!5495 thiss!1141) (zeroValue!5599 thiss!1141) (minValue!5599 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5763 thiss!1141))))) (bvsle (_1!6802 (h!20485 (toList!6150 (getCurrentListMap!3312 (_keys!10686 thiss!1141) (_values!5786 thiss!1141) (mask!27536 thiss!1141) (extraKeys!5495 thiss!1141) (zeroValue!5599 thiss!1141) (minValue!5599 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5763 thiss!1141))))) key!756)) ((_ is Cons!19326) (toList!6150 (getCurrentListMap!3312 (_keys!10686 thiss!1141) (_values!5786 thiss!1141) (mask!27536 thiss!1141) (extraKeys!5495 thiss!1141) (zeroValue!5599 thiss!1141) (minValue!5599 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5763 thiss!1141)))) (bvslt (_1!6802 (h!20485 (toList!6150 (getCurrentListMap!3312 (_keys!10686 thiss!1141) (_values!5786 thiss!1141) (mask!27536 thiss!1141) (extraKeys!5495 thiss!1141) (zeroValue!5599 thiss!1141) (minValue!5599 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5763 thiss!1141))))) key!756)))))

(declare-fun b!949475 () Bool)

(assert (=> b!949475 (= e!534526 (containsKey!461 (t!27654 (toList!6150 (getCurrentListMap!3312 (_keys!10686 thiss!1141) (_values!5786 thiss!1141) (mask!27536 thiss!1141) (extraKeys!5495 thiss!1141) (zeroValue!5599 thiss!1141) (minValue!5599 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5763 thiss!1141)))) key!756))))

(assert (= (and d!114915 (not res!636741)) b!949474))

(assert (= (and b!949474 res!636742) b!949475))

(declare-fun m!881593 () Bool)

(assert (=> b!949475 m!881593))

(assert (=> d!114843 d!114915))

(declare-fun d!114917 () Bool)

(assert (=> d!114917 (= (apply!868 lt!427369 (select (arr!27618 (_keys!10686 thiss!1141)) #b00000000000000000000000000000000)) (get!14513 (getValueByKey!497 (toList!6150 lt!427369) (select (arr!27618 (_keys!10686 thiss!1141)) #b00000000000000000000000000000000))))))

(declare-fun bs!26665 () Bool)

(assert (= bs!26665 d!114917))

(assert (=> bs!26665 m!881337))

(declare-fun m!881595 () Bool)

(assert (=> bs!26665 m!881595))

(assert (=> bs!26665 m!881595))

(declare-fun m!881597 () Bool)

(assert (=> bs!26665 m!881597))

(assert (=> b!949278 d!114917))

(declare-fun d!114919 () Bool)

(declare-fun c!99082 () Bool)

(assert (=> d!114919 (= c!99082 ((_ is ValueCellFull!9881) (select (arr!27617 (_values!5786 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun e!534529 () V!32599)

(assert (=> d!114919 (= (get!14512 (select (arr!27617 (_values!5786 thiss!1141)) #b00000000000000000000000000000000) (dynLambda!1634 (defaultEntry!5763 thiss!1141) #b0000000000000000000000000000000000000000000000000000000000000000)) e!534529)))

(declare-fun b!949480 () Bool)

(declare-fun get!14514 (ValueCell!9881 V!32599) V!32599)

(assert (=> b!949480 (= e!534529 (get!14514 (select (arr!27617 (_values!5786 thiss!1141)) #b00000000000000000000000000000000) (dynLambda!1634 (defaultEntry!5763 thiss!1141) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!949481 () Bool)

(declare-fun get!14515 (ValueCell!9881 V!32599) V!32599)

(assert (=> b!949481 (= e!534529 (get!14515 (select (arr!27617 (_values!5786 thiss!1141)) #b00000000000000000000000000000000) (dynLambda!1634 (defaultEntry!5763 thiss!1141) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!114919 c!99082) b!949480))

(assert (= (and d!114919 (not c!99082)) b!949481))

(assert (=> b!949480 m!881379))

(assert (=> b!949480 m!881381))

(declare-fun m!881599 () Bool)

(assert (=> b!949480 m!881599))

(assert (=> b!949481 m!881379))

(assert (=> b!949481 m!881381))

(declare-fun m!881601 () Bool)

(assert (=> b!949481 m!881601))

(assert (=> b!949278 d!114919))

(declare-fun d!114921 () Bool)

(assert (=> d!114921 (= (apply!868 lt!427369 #b1000000000000000000000000000000000000000000000000000000000000000) (get!14513 (getValueByKey!497 (toList!6150 lt!427369) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!26666 () Bool)

(assert (= bs!26666 d!114921))

(assert (=> bs!26666 m!881589))

(assert (=> bs!26666 m!881589))

(declare-fun m!881603 () Bool)

(assert (=> bs!26666 m!881603))

(assert (=> b!949279 d!114921))

(declare-fun d!114923 () Bool)

(assert (=> d!114923 (= (validKeyInArray!0 (select (arr!27618 (_keys!10686 thiss!1141)) #b00000000000000000000000000000000)) (and (not (= (select (arr!27618 (_keys!10686 thiss!1141)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!27618 (_keys!10686 thiss!1141)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!949270 d!114923))

(assert (=> b!949261 d!114923))

(declare-fun d!114925 () Bool)

(declare-fun e!534531 () Bool)

(assert (=> d!114925 e!534531))

(declare-fun res!636743 () Bool)

(assert (=> d!114925 (=> res!636743 e!534531)))

(declare-fun lt!427493 () Bool)

(assert (=> d!114925 (= res!636743 (not lt!427493))))

(declare-fun lt!427494 () Bool)

(assert (=> d!114925 (= lt!427493 lt!427494)))

(declare-fun lt!427495 () Unit!31851)

(declare-fun e!534530 () Unit!31851)

(assert (=> d!114925 (= lt!427495 e!534530)))

(declare-fun c!99083 () Bool)

(assert (=> d!114925 (= c!99083 lt!427494)))

(assert (=> d!114925 (= lt!427494 (containsKey!461 (toList!6150 lt!427369) (select (arr!27618 (_keys!10686 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (=> d!114925 (= (contains!5181 lt!427369 (select (arr!27618 (_keys!10686 thiss!1141)) #b00000000000000000000000000000000)) lt!427493)))

(declare-fun b!949482 () Bool)

(declare-fun lt!427492 () Unit!31851)

(assert (=> b!949482 (= e!534530 lt!427492)))

(assert (=> b!949482 (= lt!427492 (lemmaContainsKeyImpliesGetValueByKeyDefined!356 (toList!6150 lt!427369) (select (arr!27618 (_keys!10686 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (=> b!949482 (isDefined!369 (getValueByKey!497 (toList!6150 lt!427369) (select (arr!27618 (_keys!10686 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!949483 () Bool)

(declare-fun Unit!31858 () Unit!31851)

(assert (=> b!949483 (= e!534530 Unit!31858)))

(declare-fun b!949484 () Bool)

(assert (=> b!949484 (= e!534531 (isDefined!369 (getValueByKey!497 (toList!6150 lt!427369) (select (arr!27618 (_keys!10686 thiss!1141)) #b00000000000000000000000000000000))))))

(assert (= (and d!114925 c!99083) b!949482))

(assert (= (and d!114925 (not c!99083)) b!949483))

(assert (= (and d!114925 (not res!636743)) b!949484))

(assert (=> d!114925 m!881337))

(declare-fun m!881605 () Bool)

(assert (=> d!114925 m!881605))

(assert (=> b!949482 m!881337))

(declare-fun m!881607 () Bool)

(assert (=> b!949482 m!881607))

(assert (=> b!949482 m!881337))

(assert (=> b!949482 m!881595))

(assert (=> b!949482 m!881595))

(declare-fun m!881609 () Bool)

(assert (=> b!949482 m!881609))

(assert (=> b!949484 m!881337))

(assert (=> b!949484 m!881595))

(assert (=> b!949484 m!881595))

(assert (=> b!949484 m!881609))

(assert (=> b!949262 d!114925))

(declare-fun b!949486 () Bool)

(declare-fun e!534533 () Bool)

(assert (=> b!949486 (= e!534533 tp_is_empty!20725)))

(declare-fun condMapEmpty!32999 () Bool)

(declare-fun mapDefault!32999 () ValueCell!9881)

(assert (=> mapNonEmpty!32998 (= condMapEmpty!32999 (= mapRest!32998 ((as const (Array (_ BitVec 32) ValueCell!9881)) mapDefault!32999)))))

(declare-fun mapRes!32999 () Bool)

(assert (=> mapNonEmpty!32998 (= tp!63253 (and e!534533 mapRes!32999))))

(declare-fun b!949485 () Bool)

(declare-fun e!534532 () Bool)

(assert (=> b!949485 (= e!534532 tp_is_empty!20725)))

(declare-fun mapIsEmpty!32999 () Bool)

(assert (=> mapIsEmpty!32999 mapRes!32999))

(declare-fun mapNonEmpty!32999 () Bool)

(declare-fun tp!63254 () Bool)

(assert (=> mapNonEmpty!32999 (= mapRes!32999 (and tp!63254 e!534532))))

(declare-fun mapValue!32999 () ValueCell!9881)

(declare-fun mapRest!32999 () (Array (_ BitVec 32) ValueCell!9881))

(declare-fun mapKey!32999 () (_ BitVec 32))

(assert (=> mapNonEmpty!32999 (= mapRest!32998 (store mapRest!32999 mapKey!32999 mapValue!32999))))

(assert (= (and mapNonEmpty!32998 condMapEmpty!32999) mapIsEmpty!32999))

(assert (= (and mapNonEmpty!32998 (not condMapEmpty!32999)) mapNonEmpty!32999))

(assert (= (and mapNonEmpty!32999 ((_ is ValueCellFull!9881) mapValue!32999)) b!949485))

(assert (= (and mapNonEmpty!32998 ((_ is ValueCellFull!9881) mapDefault!32999)) b!949486))

(declare-fun m!881611 () Bool)

(assert (=> mapNonEmpty!32999 m!881611))

(declare-fun b_lambda!14337 () Bool)

(assert (= b_lambda!14335 (or (and b!949126 b_free!18217) b_lambda!14337)))

(declare-fun b_lambda!14339 () Bool)

(assert (= b_lambda!14333 (or (and b!949126 b_free!18217) b_lambda!14339)))

(check-sat (not b!949443) (not d!114865) (not bm!41284) tp_is_empty!20725 (not d!114889) (not d!114873) (not d!114899) (not b!949484) (not b!949368) (not d!114905) (not d!114887) (not b!949475) (not b!949466) (not b!949460) (not b!949448) (not b!949467) (not d!114883) (not d!114893) (not b!949385) (not b!949408) (not b!949451) (not d!114895) (not b_lambda!14337) (not d!114913) (not b!949384) (not b!949441) (not d!114859) (not b!949366) (not b!949461) (not b!949299) (not d!114855) (not b!949371) (not b!949452) (not b_next!18217) (not b!949365) b_and!29647 (not d!114891) (not b_lambda!14339) (not b!949329) (not b!949382) (not d!114901) (not b!949457) (not b!949369) (not d!114911) (not d!114917) (not b!949435) (not d!114909) (not b!949335) (not d!114881) (not d!114897) (not b!949442) (not mapNonEmpty!32999) (not b_lambda!14331) (not b!949481) (not d!114879) (not b!949444) (not d!114907) (not b!949348) (not bm!41281) (not b!949469) (not d!114869) (not d!114877) (not b!949447) (not b!949482) (not b!949434) (not d!114885) (not d!114861) (not b!949450) (not b!949396) (not b!949302) (not d!114903) (not b!949446) (not bm!41290) (not bm!41287) (not b!949436) (not d!114921) (not d!114925) (not d!114867) (not b!949445) (not b!949334) (not b!949407) (not b!949480) (not b!949458))
(check-sat b_and!29647 (not b_next!18217))
