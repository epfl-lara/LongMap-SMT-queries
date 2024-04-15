; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!80658 () Bool)

(assert start!80658)

(declare-fun b!946232 () Bool)

(declare-fun b_free!18139 () Bool)

(declare-fun b_next!18139 () Bool)

(assert (=> b!946232 (= b_free!18139 (not b_next!18139))))

(declare-fun tp!62960 () Bool)

(declare-fun b_and!29535 () Bool)

(assert (=> b!946232 (= tp!62960 b_and!29535)))

(declare-fun b!946230 () Bool)

(declare-fun e!532390 () Bool)

(declare-fun e!532393 () Bool)

(assert (=> b!946230 (= e!532390 e!532393)))

(declare-fun res!635276 () Bool)

(assert (=> b!946230 (=> (not res!635276) (not e!532393))))

(declare-datatypes ((SeekEntryResult!9099 0))(
  ( (MissingZero!9099 (index!38767 (_ BitVec 32))) (Found!9099 (index!38768 (_ BitVec 32))) (Intermediate!9099 (undefined!9911 Bool) (index!38769 (_ BitVec 32)) (x!81380 (_ BitVec 32))) (Undefined!9099) (MissingVacant!9099 (index!38770 (_ BitVec 32))) )
))
(declare-fun lt!426066 () SeekEntryResult!9099)

(get-info :version)

(assert (=> b!946230 (= res!635276 ((_ is Found!9099) lt!426066))))

(declare-fun key!756 () (_ BitVec 64))

(declare-datatypes ((V!32495 0))(
  ( (V!32496 (val!10374 Int)) )
))
(declare-datatypes ((ValueCell!9842 0))(
  ( (ValueCellFull!9842 (v!12907 V!32495)) (EmptyCell!9842) )
))
(declare-datatypes ((array!57245 0))(
  ( (array!57246 (arr!27539 (Array (_ BitVec 32) ValueCell!9842)) (size!28012 (_ BitVec 32))) )
))
(declare-datatypes ((array!57247 0))(
  ( (array!57248 (arr!27540 (Array (_ BitVec 32) (_ BitVec 64))) (size!28013 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4834 0))(
  ( (LongMapFixedSize!4835 (defaultEntry!5714 Int) (mask!27412 (_ BitVec 32)) (extraKeys!5446 (_ BitVec 32)) (zeroValue!5550 V!32495) (minValue!5550 V!32495) (_size!2472 (_ BitVec 32)) (_keys!10605 array!57247) (_values!5737 array!57245) (_vacant!2472 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4834)

(declare-fun seekEntry!0 ((_ BitVec 64) array!57247 (_ BitVec 32)) SeekEntryResult!9099)

(assert (=> b!946230 (= lt!426066 (seekEntry!0 key!756 (_keys!10605 thiss!1141) (mask!27412 thiss!1141)))))

(declare-fun b!946231 () Bool)

(declare-fun res!635274 () Bool)

(assert (=> b!946231 (=> (not res!635274) (not e!532390))))

(assert (=> b!946231 (= res!635274 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!635275 () Bool)

(assert (=> start!80658 (=> (not res!635275) (not e!532390))))

(declare-fun valid!1847 (LongMapFixedSize!4834) Bool)

(assert (=> start!80658 (= res!635275 (valid!1847 thiss!1141))))

(assert (=> start!80658 e!532390))

(declare-fun e!532391 () Bool)

(assert (=> start!80658 e!532391))

(assert (=> start!80658 true))

(declare-fun mapNonEmpty!32828 () Bool)

(declare-fun mapRes!32828 () Bool)

(declare-fun tp!62959 () Bool)

(declare-fun e!532389 () Bool)

(assert (=> mapNonEmpty!32828 (= mapRes!32828 (and tp!62959 e!532389))))

(declare-fun mapRest!32828 () (Array (_ BitVec 32) ValueCell!9842))

(declare-fun mapKey!32828 () (_ BitVec 32))

(declare-fun mapValue!32828 () ValueCell!9842)

(assert (=> mapNonEmpty!32828 (= (arr!27539 (_values!5737 thiss!1141)) (store mapRest!32828 mapKey!32828 mapValue!32828))))

(declare-fun e!532392 () Bool)

(declare-fun tp_is_empty!20647 () Bool)

(declare-fun array_inv!21442 (array!57247) Bool)

(declare-fun array_inv!21443 (array!57245) Bool)

(assert (=> b!946232 (= e!532391 (and tp!62960 tp_is_empty!20647 (array_inv!21442 (_keys!10605 thiss!1141)) (array_inv!21443 (_values!5737 thiss!1141)) e!532392))))

(declare-fun b!946233 () Bool)

(assert (=> b!946233 (= e!532389 tp_is_empty!20647)))

(declare-fun b!946234 () Bool)

(declare-fun e!532387 () Bool)

(assert (=> b!946234 (= e!532393 (not e!532387))))

(declare-fun res!635273 () Bool)

(assert (=> b!946234 (=> res!635273 e!532387)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!946234 (= res!635273 (not (validMask!0 (mask!27412 thiss!1141))))))

(declare-fun arrayContainsKey!0 (array!57247 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!946234 (arrayContainsKey!0 (_keys!10605 thiss!1141) key!756 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!31782 0))(
  ( (Unit!31783) )
))
(declare-fun lt!426067 () Unit!31782)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!57247 (_ BitVec 64) (_ BitVec 32)) Unit!31782)

(assert (=> b!946234 (= lt!426067 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10605 thiss!1141) key!756 (index!38768 lt!426066)))))

(declare-fun b!946235 () Bool)

(declare-fun e!532394 () Bool)

(assert (=> b!946235 (= e!532392 (and e!532394 mapRes!32828))))

(declare-fun condMapEmpty!32828 () Bool)

(declare-fun mapDefault!32828 () ValueCell!9842)

(assert (=> b!946235 (= condMapEmpty!32828 (= (arr!27539 (_values!5737 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9842)) mapDefault!32828)))))

(declare-fun b!946236 () Bool)

(assert (=> b!946236 (= e!532394 tp_is_empty!20647)))

(declare-fun b!946237 () Bool)

(assert (=> b!946237 (= e!532387 (or (not (= (size!28012 (_values!5737 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27412 thiss!1141)))) (not (= (size!28013 (_keys!10605 thiss!1141)) (size!28012 (_values!5737 thiss!1141)))) (bvsge (mask!27412 thiss!1141) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!32828 () Bool)

(assert (=> mapIsEmpty!32828 mapRes!32828))

(assert (= (and start!80658 res!635275) b!946231))

(assert (= (and b!946231 res!635274) b!946230))

(assert (= (and b!946230 res!635276) b!946234))

(assert (= (and b!946234 (not res!635273)) b!946237))

(assert (= (and b!946235 condMapEmpty!32828) mapIsEmpty!32828))

(assert (= (and b!946235 (not condMapEmpty!32828)) mapNonEmpty!32828))

(assert (= (and mapNonEmpty!32828 ((_ is ValueCellFull!9842) mapValue!32828)) b!946233))

(assert (= (and b!946235 ((_ is ValueCellFull!9842) mapDefault!32828)) b!946236))

(assert (= b!946232 b!946235))

(assert (= start!80658 b!946232))

(declare-fun m!879067 () Bool)

(assert (=> b!946232 m!879067))

(declare-fun m!879069 () Bool)

(assert (=> b!946232 m!879069))

(declare-fun m!879071 () Bool)

(assert (=> b!946234 m!879071))

(declare-fun m!879073 () Bool)

(assert (=> b!946234 m!879073))

(declare-fun m!879075 () Bool)

(assert (=> b!946234 m!879075))

(declare-fun m!879077 () Bool)

(assert (=> start!80658 m!879077))

(declare-fun m!879079 () Bool)

(assert (=> b!946230 m!879079))

(declare-fun m!879081 () Bool)

(assert (=> mapNonEmpty!32828 m!879081))

(check-sat (not b_next!18139) tp_is_empty!20647 (not b!946230) (not b!946234) b_and!29535 (not start!80658) (not b!946232) (not mapNonEmpty!32828))
(check-sat b_and!29535 (not b_next!18139))
(get-model)

(declare-fun d!114349 () Bool)

(assert (=> d!114349 (= (array_inv!21442 (_keys!10605 thiss!1141)) (bvsge (size!28013 (_keys!10605 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!946232 d!114349))

(declare-fun d!114351 () Bool)

(assert (=> d!114351 (= (array_inv!21443 (_values!5737 thiss!1141)) (bvsge (size!28012 (_values!5737 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!946232 d!114351))

(declare-fun b!946298 () Bool)

(declare-fun e!532451 () SeekEntryResult!9099)

(declare-fun lt!426090 () SeekEntryResult!9099)

(assert (=> b!946298 (= e!532451 (MissingZero!9099 (index!38769 lt!426090)))))

(declare-fun b!946299 () Bool)

(declare-fun c!98517 () Bool)

(declare-fun lt!426089 () (_ BitVec 64))

(assert (=> b!946299 (= c!98517 (= lt!426089 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!532449 () SeekEntryResult!9099)

(assert (=> b!946299 (= e!532449 e!532451)))

(declare-fun b!946300 () Bool)

(declare-fun lt!426091 () SeekEntryResult!9099)

(assert (=> b!946300 (= e!532451 (ite ((_ is MissingVacant!9099) lt!426091) (MissingZero!9099 (index!38770 lt!426091)) lt!426091))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!57247 (_ BitVec 32)) SeekEntryResult!9099)

(assert (=> b!946300 (= lt!426091 (seekKeyOrZeroReturnVacant!0 (x!81380 lt!426090) (index!38769 lt!426090) (index!38769 lt!426090) key!756 (_keys!10605 thiss!1141) (mask!27412 thiss!1141)))))

(declare-fun b!946301 () Bool)

(assert (=> b!946301 (= e!532449 (Found!9099 (index!38769 lt!426090)))))

(declare-fun b!946302 () Bool)

(declare-fun e!532450 () SeekEntryResult!9099)

(assert (=> b!946302 (= e!532450 Undefined!9099)))

(declare-fun b!946303 () Bool)

(assert (=> b!946303 (= e!532450 e!532449)))

(assert (=> b!946303 (= lt!426089 (select (arr!27540 (_keys!10605 thiss!1141)) (index!38769 lt!426090)))))

(declare-fun c!98516 () Bool)

(assert (=> b!946303 (= c!98516 (= lt!426089 key!756))))

(declare-fun d!114353 () Bool)

(declare-fun lt!426088 () SeekEntryResult!9099)

(assert (=> d!114353 (and (or ((_ is MissingVacant!9099) lt!426088) (not ((_ is Found!9099) lt!426088)) (and (bvsge (index!38768 lt!426088) #b00000000000000000000000000000000) (bvslt (index!38768 lt!426088) (size!28013 (_keys!10605 thiss!1141))))) (not ((_ is MissingVacant!9099) lt!426088)) (or (not ((_ is Found!9099) lt!426088)) (= (select (arr!27540 (_keys!10605 thiss!1141)) (index!38768 lt!426088)) key!756)))))

(assert (=> d!114353 (= lt!426088 e!532450)))

(declare-fun c!98515 () Bool)

(assert (=> d!114353 (= c!98515 (and ((_ is Intermediate!9099) lt!426090) (undefined!9911 lt!426090)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!57247 (_ BitVec 32)) SeekEntryResult!9099)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!114353 (= lt!426090 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!756 (mask!27412 thiss!1141)) key!756 (_keys!10605 thiss!1141) (mask!27412 thiss!1141)))))

(assert (=> d!114353 (validMask!0 (mask!27412 thiss!1141))))

(assert (=> d!114353 (= (seekEntry!0 key!756 (_keys!10605 thiss!1141) (mask!27412 thiss!1141)) lt!426088)))

(assert (= (and d!114353 c!98515) b!946302))

(assert (= (and d!114353 (not c!98515)) b!946303))

(assert (= (and b!946303 c!98516) b!946301))

(assert (= (and b!946303 (not c!98516)) b!946299))

(assert (= (and b!946299 c!98517) b!946298))

(assert (= (and b!946299 (not c!98517)) b!946300))

(declare-fun m!879115 () Bool)

(assert (=> b!946300 m!879115))

(declare-fun m!879117 () Bool)

(assert (=> b!946303 m!879117))

(declare-fun m!879119 () Bool)

(assert (=> d!114353 m!879119))

(declare-fun m!879121 () Bool)

(assert (=> d!114353 m!879121))

(assert (=> d!114353 m!879121))

(declare-fun m!879123 () Bool)

(assert (=> d!114353 m!879123))

(assert (=> d!114353 m!879071))

(assert (=> b!946230 d!114353))

(declare-fun d!114355 () Bool)

(assert (=> d!114355 (= (validMask!0 (mask!27412 thiss!1141)) (and (or (= (mask!27412 thiss!1141) #b00000000000000000000000000000111) (= (mask!27412 thiss!1141) #b00000000000000000000000000001111) (= (mask!27412 thiss!1141) #b00000000000000000000000000011111) (= (mask!27412 thiss!1141) #b00000000000000000000000000111111) (= (mask!27412 thiss!1141) #b00000000000000000000000001111111) (= (mask!27412 thiss!1141) #b00000000000000000000000011111111) (= (mask!27412 thiss!1141) #b00000000000000000000000111111111) (= (mask!27412 thiss!1141) #b00000000000000000000001111111111) (= (mask!27412 thiss!1141) #b00000000000000000000011111111111) (= (mask!27412 thiss!1141) #b00000000000000000000111111111111) (= (mask!27412 thiss!1141) #b00000000000000000001111111111111) (= (mask!27412 thiss!1141) #b00000000000000000011111111111111) (= (mask!27412 thiss!1141) #b00000000000000000111111111111111) (= (mask!27412 thiss!1141) #b00000000000000001111111111111111) (= (mask!27412 thiss!1141) #b00000000000000011111111111111111) (= (mask!27412 thiss!1141) #b00000000000000111111111111111111) (= (mask!27412 thiss!1141) #b00000000000001111111111111111111) (= (mask!27412 thiss!1141) #b00000000000011111111111111111111) (= (mask!27412 thiss!1141) #b00000000000111111111111111111111) (= (mask!27412 thiss!1141) #b00000000001111111111111111111111) (= (mask!27412 thiss!1141) #b00000000011111111111111111111111) (= (mask!27412 thiss!1141) #b00000000111111111111111111111111) (= (mask!27412 thiss!1141) #b00000001111111111111111111111111) (= (mask!27412 thiss!1141) #b00000011111111111111111111111111) (= (mask!27412 thiss!1141) #b00000111111111111111111111111111) (= (mask!27412 thiss!1141) #b00001111111111111111111111111111) (= (mask!27412 thiss!1141) #b00011111111111111111111111111111) (= (mask!27412 thiss!1141) #b00111111111111111111111111111111)) (bvsle (mask!27412 thiss!1141) #b00111111111111111111111111111111)))))

(assert (=> b!946234 d!114355))

(declare-fun d!114357 () Bool)

(declare-fun res!635305 () Bool)

(declare-fun e!532456 () Bool)

(assert (=> d!114357 (=> res!635305 e!532456)))

(assert (=> d!114357 (= res!635305 (= (select (arr!27540 (_keys!10605 thiss!1141)) #b00000000000000000000000000000000) key!756))))

(assert (=> d!114357 (= (arrayContainsKey!0 (_keys!10605 thiss!1141) key!756 #b00000000000000000000000000000000) e!532456)))

(declare-fun b!946308 () Bool)

(declare-fun e!532457 () Bool)

(assert (=> b!946308 (= e!532456 e!532457)))

(declare-fun res!635306 () Bool)

(assert (=> b!946308 (=> (not res!635306) (not e!532457))))

(assert (=> b!946308 (= res!635306 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!28013 (_keys!10605 thiss!1141))))))

(declare-fun b!946309 () Bool)

(assert (=> b!946309 (= e!532457 (arrayContainsKey!0 (_keys!10605 thiss!1141) key!756 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!114357 (not res!635305)) b!946308))

(assert (= (and b!946308 res!635306) b!946309))

(declare-fun m!879125 () Bool)

(assert (=> d!114357 m!879125))

(declare-fun m!879127 () Bool)

(assert (=> b!946309 m!879127))

(assert (=> b!946234 d!114357))

(declare-fun d!114359 () Bool)

(assert (=> d!114359 (arrayContainsKey!0 (_keys!10605 thiss!1141) key!756 #b00000000000000000000000000000000)))

(declare-fun lt!426094 () Unit!31782)

(declare-fun choose!13 (array!57247 (_ BitVec 64) (_ BitVec 32)) Unit!31782)

(assert (=> d!114359 (= lt!426094 (choose!13 (_keys!10605 thiss!1141) key!756 (index!38768 lt!426066)))))

(assert (=> d!114359 (bvsge (index!38768 lt!426066) #b00000000000000000000000000000000)))

(assert (=> d!114359 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10605 thiss!1141) key!756 (index!38768 lt!426066)) lt!426094)))

(declare-fun bs!26573 () Bool)

(assert (= bs!26573 d!114359))

(assert (=> bs!26573 m!879073))

(declare-fun m!879129 () Bool)

(assert (=> bs!26573 m!879129))

(assert (=> b!946234 d!114359))

(declare-fun d!114361 () Bool)

(declare-fun res!635313 () Bool)

(declare-fun e!532460 () Bool)

(assert (=> d!114361 (=> (not res!635313) (not e!532460))))

(declare-fun simpleValid!358 (LongMapFixedSize!4834) Bool)

(assert (=> d!114361 (= res!635313 (simpleValid!358 thiss!1141))))

(assert (=> d!114361 (= (valid!1847 thiss!1141) e!532460)))

(declare-fun b!946316 () Bool)

(declare-fun res!635314 () Bool)

(assert (=> b!946316 (=> (not res!635314) (not e!532460))))

(declare-fun arrayCountValidKeys!0 (array!57247 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!946316 (= res!635314 (= (arrayCountValidKeys!0 (_keys!10605 thiss!1141) #b00000000000000000000000000000000 (size!28013 (_keys!10605 thiss!1141))) (_size!2472 thiss!1141)))))

(declare-fun b!946317 () Bool)

(declare-fun res!635315 () Bool)

(assert (=> b!946317 (=> (not res!635315) (not e!532460))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57247 (_ BitVec 32)) Bool)

(assert (=> b!946317 (= res!635315 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10605 thiss!1141) (mask!27412 thiss!1141)))))

(declare-fun b!946318 () Bool)

(declare-datatypes ((List!19303 0))(
  ( (Nil!19300) (Cons!19299 (h!20453 (_ BitVec 64)) (t!27615 List!19303)) )
))
(declare-fun arrayNoDuplicates!0 (array!57247 (_ BitVec 32) List!19303) Bool)

(assert (=> b!946318 (= e!532460 (arrayNoDuplicates!0 (_keys!10605 thiss!1141) #b00000000000000000000000000000000 Nil!19300))))

(assert (= (and d!114361 res!635313) b!946316))

(assert (= (and b!946316 res!635314) b!946317))

(assert (= (and b!946317 res!635315) b!946318))

(declare-fun m!879131 () Bool)

(assert (=> d!114361 m!879131))

(declare-fun m!879133 () Bool)

(assert (=> b!946316 m!879133))

(declare-fun m!879135 () Bool)

(assert (=> b!946317 m!879135))

(declare-fun m!879137 () Bool)

(assert (=> b!946318 m!879137))

(assert (=> start!80658 d!114361))

(declare-fun mapIsEmpty!32837 () Bool)

(declare-fun mapRes!32837 () Bool)

(assert (=> mapIsEmpty!32837 mapRes!32837))

(declare-fun b!946325 () Bool)

(declare-fun e!532466 () Bool)

(assert (=> b!946325 (= e!532466 tp_is_empty!20647)))

(declare-fun mapNonEmpty!32837 () Bool)

(declare-fun tp!62975 () Bool)

(assert (=> mapNonEmpty!32837 (= mapRes!32837 (and tp!62975 e!532466))))

(declare-fun mapRest!32837 () (Array (_ BitVec 32) ValueCell!9842))

(declare-fun mapValue!32837 () ValueCell!9842)

(declare-fun mapKey!32837 () (_ BitVec 32))

(assert (=> mapNonEmpty!32837 (= mapRest!32828 (store mapRest!32837 mapKey!32837 mapValue!32837))))

(declare-fun b!946326 () Bool)

(declare-fun e!532465 () Bool)

(assert (=> b!946326 (= e!532465 tp_is_empty!20647)))

(declare-fun condMapEmpty!32837 () Bool)

(declare-fun mapDefault!32837 () ValueCell!9842)

(assert (=> mapNonEmpty!32828 (= condMapEmpty!32837 (= mapRest!32828 ((as const (Array (_ BitVec 32) ValueCell!9842)) mapDefault!32837)))))

(assert (=> mapNonEmpty!32828 (= tp!62959 (and e!532465 mapRes!32837))))

(assert (= (and mapNonEmpty!32828 condMapEmpty!32837) mapIsEmpty!32837))

(assert (= (and mapNonEmpty!32828 (not condMapEmpty!32837)) mapNonEmpty!32837))

(assert (= (and mapNonEmpty!32837 ((_ is ValueCellFull!9842) mapValue!32837)) b!946325))

(assert (= (and mapNonEmpty!32828 ((_ is ValueCellFull!9842) mapDefault!32837)) b!946326))

(declare-fun m!879139 () Bool)

(assert (=> mapNonEmpty!32837 m!879139))

(check-sat (not b_next!18139) (not mapNonEmpty!32837) (not b!946300) tp_is_empty!20647 (not b!946317) (not d!114359) (not d!114353) (not b!946309) (not b!946318) (not d!114361) (not b!946316) b_and!29535)
(check-sat b_and!29535 (not b_next!18139))
