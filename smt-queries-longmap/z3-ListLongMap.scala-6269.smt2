; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!80364 () Bool)

(assert start!80364)

(declare-fun b!943067 () Bool)

(declare-fun b_free!17935 () Bool)

(declare-fun b_next!17935 () Bool)

(assert (=> b!943067 (= b_free!17935 (not b_next!17935))))

(declare-fun tp!62302 () Bool)

(declare-fun b_and!29357 () Bool)

(assert (=> b!943067 (= tp!62302 b_and!29357)))

(declare-fun res!633513 () Bool)

(declare-fun e!530303 () Bool)

(assert (=> start!80364 (=> (not res!633513) (not e!530303))))

(declare-datatypes ((V!32223 0))(
  ( (V!32224 (val!10272 Int)) )
))
(declare-datatypes ((ValueCell!9740 0))(
  ( (ValueCellFull!9740 (v!12800 V!32223)) (EmptyCell!9740) )
))
(declare-datatypes ((array!56897 0))(
  ( (array!56898 (arr!27373 (Array (_ BitVec 32) ValueCell!9740)) (size!27839 (_ BitVec 32))) )
))
(declare-datatypes ((array!56899 0))(
  ( (array!56900 (arr!27374 (Array (_ BitVec 32) (_ BitVec 64))) (size!27840 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4630 0))(
  ( (LongMapFixedSize!4631 (defaultEntry!5606 Int) (mask!27246 (_ BitVec 32)) (extraKeys!5338 (_ BitVec 32)) (zeroValue!5442 V!32223) (minValue!5442 V!32223) (_size!2370 (_ BitVec 32)) (_keys!10502 array!56899) (_values!5629 array!56897) (_vacant!2370 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4630)

(declare-fun valid!1778 (LongMapFixedSize!4630) Bool)

(assert (=> start!80364 (= res!633513 (valid!1778 thiss!1141))))

(assert (=> start!80364 e!530303))

(declare-fun e!530307 () Bool)

(assert (=> start!80364 e!530307))

(assert (=> start!80364 true))

(declare-fun b!943065 () Bool)

(declare-fun res!633514 () Bool)

(assert (=> b!943065 (=> (not res!633514) (not e!530303))))

(declare-fun key!756 () (_ BitVec 64))

(get-info :version)

(declare-datatypes ((SeekEntryResult!8983 0))(
  ( (MissingZero!8983 (index!38303 (_ BitVec 32))) (Found!8983 (index!38304 (_ BitVec 32))) (Intermediate!8983 (undefined!9795 Bool) (index!38305 (_ BitVec 32)) (x!80854 (_ BitVec 32))) (Undefined!8983) (MissingVacant!8983 (index!38306 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!56899 (_ BitVec 32)) SeekEntryResult!8983)

(assert (=> b!943065 (= res!633514 (not ((_ is Found!8983) (seekEntry!0 key!756 (_keys!10502 thiss!1141) (mask!27246 thiss!1141)))))))

(declare-fun b!943066 () Bool)

(declare-fun res!633510 () Bool)

(assert (=> b!943066 (=> (not res!633510) (not e!530303))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!943066 (= res!633510 (validMask!0 (mask!27246 thiss!1141)))))

(declare-fun tp_is_empty!20443 () Bool)

(declare-fun e!530304 () Bool)

(declare-fun array_inv!21360 (array!56899) Bool)

(declare-fun array_inv!21361 (array!56897) Bool)

(assert (=> b!943067 (= e!530307 (and tp!62302 tp_is_empty!20443 (array_inv!21360 (_keys!10502 thiss!1141)) (array_inv!21361 (_values!5629 thiss!1141)) e!530304))))

(declare-fun b!943068 () Bool)

(declare-fun res!633512 () Bool)

(assert (=> b!943068 (=> (not res!633512) (not e!530303))))

(assert (=> b!943068 (= res!633512 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!943069 () Bool)

(declare-fun res!633511 () Bool)

(assert (=> b!943069 (=> (not res!633511) (not e!530303))))

(assert (=> b!943069 (= res!633511 (and (= (size!27839 (_values!5629 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27246 thiss!1141))) (= (size!27840 (_keys!10502 thiss!1141)) (size!27839 (_values!5629 thiss!1141))) (bvsge (mask!27246 thiss!1141) #b00000000000000000000000000000000) (bvsge (extraKeys!5338 thiss!1141) #b00000000000000000000000000000000) (bvsle (extraKeys!5338 thiss!1141) #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!32477 () Bool)

(declare-fun mapRes!32477 () Bool)

(assert (=> mapIsEmpty!32477 mapRes!32477))

(declare-fun b!943070 () Bool)

(declare-fun e!530302 () Bool)

(assert (=> b!943070 (= e!530302 tp_is_empty!20443)))

(declare-fun b!943071 () Bool)

(declare-fun e!530305 () Bool)

(assert (=> b!943071 (= e!530305 tp_is_empty!20443)))

(declare-fun mapNonEmpty!32477 () Bool)

(declare-fun tp!62303 () Bool)

(assert (=> mapNonEmpty!32477 (= mapRes!32477 (and tp!62303 e!530305))))

(declare-fun mapValue!32477 () ValueCell!9740)

(declare-fun mapKey!32477 () (_ BitVec 32))

(declare-fun mapRest!32477 () (Array (_ BitVec 32) ValueCell!9740))

(assert (=> mapNonEmpty!32477 (= (arr!27373 (_values!5629 thiss!1141)) (store mapRest!32477 mapKey!32477 mapValue!32477))))

(declare-fun b!943072 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56899 (_ BitVec 32)) Bool)

(assert (=> b!943072 (= e!530303 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10502 thiss!1141) (mask!27246 thiss!1141))))))

(declare-fun b!943073 () Bool)

(assert (=> b!943073 (= e!530304 (and e!530302 mapRes!32477))))

(declare-fun condMapEmpty!32477 () Bool)

(declare-fun mapDefault!32477 () ValueCell!9740)

(assert (=> b!943073 (= condMapEmpty!32477 (= (arr!27373 (_values!5629 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9740)) mapDefault!32477)))))

(assert (= (and start!80364 res!633513) b!943068))

(assert (= (and b!943068 res!633512) b!943065))

(assert (= (and b!943065 res!633514) b!943066))

(assert (= (and b!943066 res!633510) b!943069))

(assert (= (and b!943069 res!633511) b!943072))

(assert (= (and b!943073 condMapEmpty!32477) mapIsEmpty!32477))

(assert (= (and b!943073 (not condMapEmpty!32477)) mapNonEmpty!32477))

(assert (= (and mapNonEmpty!32477 ((_ is ValueCellFull!9740) mapValue!32477)) b!943071))

(assert (= (and b!943073 ((_ is ValueCellFull!9740) mapDefault!32477)) b!943070))

(assert (= b!943067 b!943073))

(assert (= start!80364 b!943067))

(declare-fun m!878161 () Bool)

(assert (=> start!80364 m!878161))

(declare-fun m!878163 () Bool)

(assert (=> b!943066 m!878163))

(declare-fun m!878165 () Bool)

(assert (=> mapNonEmpty!32477 m!878165))

(declare-fun m!878167 () Bool)

(assert (=> b!943065 m!878167))

(declare-fun m!878169 () Bool)

(assert (=> b!943067 m!878169))

(declare-fun m!878171 () Bool)

(assert (=> b!943067 m!878171))

(declare-fun m!878173 () Bool)

(assert (=> b!943072 m!878173))

(check-sat (not b!943072) b_and!29357 (not b!943067) tp_is_empty!20443 (not start!80364) (not b!943065) (not mapNonEmpty!32477) (not b!943066) (not b_next!17935))
(check-sat b_and!29357 (not b_next!17935))
(get-model)

(declare-fun d!114481 () Bool)

(declare-fun res!633551 () Bool)

(declare-fun e!530346 () Bool)

(assert (=> d!114481 (=> (not res!633551) (not e!530346))))

(declare-fun simpleValid!345 (LongMapFixedSize!4630) Bool)

(assert (=> d!114481 (= res!633551 (simpleValid!345 thiss!1141))))

(assert (=> d!114481 (= (valid!1778 thiss!1141) e!530346)))

(declare-fun b!943134 () Bool)

(declare-fun res!633552 () Bool)

(assert (=> b!943134 (=> (not res!633552) (not e!530346))))

(declare-fun arrayCountValidKeys!0 (array!56899 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!943134 (= res!633552 (= (arrayCountValidKeys!0 (_keys!10502 thiss!1141) #b00000000000000000000000000000000 (size!27840 (_keys!10502 thiss!1141))) (_size!2370 thiss!1141)))))

(declare-fun b!943135 () Bool)

(declare-fun res!633553 () Bool)

(assert (=> b!943135 (=> (not res!633553) (not e!530346))))

(assert (=> b!943135 (= res!633553 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10502 thiss!1141) (mask!27246 thiss!1141)))))

(declare-fun b!943136 () Bool)

(declare-datatypes ((List!19196 0))(
  ( (Nil!19193) (Cons!19192 (h!20348 (_ BitVec 64)) (t!27503 List!19196)) )
))
(declare-fun arrayNoDuplicates!0 (array!56899 (_ BitVec 32) List!19196) Bool)

(assert (=> b!943136 (= e!530346 (arrayNoDuplicates!0 (_keys!10502 thiss!1141) #b00000000000000000000000000000000 Nil!19193))))

(assert (= (and d!114481 res!633551) b!943134))

(assert (= (and b!943134 res!633552) b!943135))

(assert (= (and b!943135 res!633553) b!943136))

(declare-fun m!878203 () Bool)

(assert (=> d!114481 m!878203))

(declare-fun m!878205 () Bool)

(assert (=> b!943134 m!878205))

(assert (=> b!943135 m!878173))

(declare-fun m!878207 () Bool)

(assert (=> b!943136 m!878207))

(assert (=> start!80364 d!114481))

(declare-fun b!943145 () Bool)

(declare-fun e!530353 () Bool)

(declare-fun call!40998 () Bool)

(assert (=> b!943145 (= e!530353 call!40998)))

(declare-fun b!943146 () Bool)

(declare-fun e!530354 () Bool)

(assert (=> b!943146 (= e!530354 call!40998)))

(declare-fun b!943147 () Bool)

(assert (=> b!943147 (= e!530353 e!530354)))

(declare-fun lt!425483 () (_ BitVec 64))

(assert (=> b!943147 (= lt!425483 (select (arr!27374 (_keys!10502 thiss!1141)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!31782 0))(
  ( (Unit!31783) )
))
(declare-fun lt!425481 () Unit!31782)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!56899 (_ BitVec 64) (_ BitVec 32)) Unit!31782)

(assert (=> b!943147 (= lt!425481 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10502 thiss!1141) lt!425483 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!56899 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!943147 (arrayContainsKey!0 (_keys!10502 thiss!1141) lt!425483 #b00000000000000000000000000000000)))

(declare-fun lt!425482 () Unit!31782)

(assert (=> b!943147 (= lt!425482 lt!425481)))

(declare-fun res!633558 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!56899 (_ BitVec 32)) SeekEntryResult!8983)

(assert (=> b!943147 (= res!633558 (= (seekEntryOrOpen!0 (select (arr!27374 (_keys!10502 thiss!1141)) #b00000000000000000000000000000000) (_keys!10502 thiss!1141) (mask!27246 thiss!1141)) (Found!8983 #b00000000000000000000000000000000)))))

(assert (=> b!943147 (=> (not res!633558) (not e!530354))))

(declare-fun bm!40995 () Bool)

(assert (=> bm!40995 (= call!40998 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!10502 thiss!1141) (mask!27246 thiss!1141)))))

(declare-fun b!943148 () Bool)

(declare-fun e!530355 () Bool)

(assert (=> b!943148 (= e!530355 e!530353)))

(declare-fun c!98485 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!943148 (= c!98485 (validKeyInArray!0 (select (arr!27374 (_keys!10502 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun d!114483 () Bool)

(declare-fun res!633559 () Bool)

(assert (=> d!114483 (=> res!633559 e!530355)))

(assert (=> d!114483 (= res!633559 (bvsge #b00000000000000000000000000000000 (size!27840 (_keys!10502 thiss!1141))))))

(assert (=> d!114483 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10502 thiss!1141) (mask!27246 thiss!1141)) e!530355)))

(assert (= (and d!114483 (not res!633559)) b!943148))

(assert (= (and b!943148 c!98485) b!943147))

(assert (= (and b!943148 (not c!98485)) b!943145))

(assert (= (and b!943147 res!633558) b!943146))

(assert (= (or b!943146 b!943145) bm!40995))

(declare-fun m!878209 () Bool)

(assert (=> b!943147 m!878209))

(declare-fun m!878211 () Bool)

(assert (=> b!943147 m!878211))

(declare-fun m!878213 () Bool)

(assert (=> b!943147 m!878213))

(assert (=> b!943147 m!878209))

(declare-fun m!878215 () Bool)

(assert (=> b!943147 m!878215))

(declare-fun m!878217 () Bool)

(assert (=> bm!40995 m!878217))

(assert (=> b!943148 m!878209))

(assert (=> b!943148 m!878209))

(declare-fun m!878219 () Bool)

(assert (=> b!943148 m!878219))

(assert (=> b!943072 d!114483))

(declare-fun b!943161 () Bool)

(declare-fun e!530363 () SeekEntryResult!8983)

(declare-fun lt!425493 () SeekEntryResult!8983)

(assert (=> b!943161 (= e!530363 (MissingZero!8983 (index!38305 lt!425493)))))

(declare-fun d!114485 () Bool)

(declare-fun lt!425495 () SeekEntryResult!8983)

(assert (=> d!114485 (and (or ((_ is MissingVacant!8983) lt!425495) (not ((_ is Found!8983) lt!425495)) (and (bvsge (index!38304 lt!425495) #b00000000000000000000000000000000) (bvslt (index!38304 lt!425495) (size!27840 (_keys!10502 thiss!1141))))) (not ((_ is MissingVacant!8983) lt!425495)) (or (not ((_ is Found!8983) lt!425495)) (= (select (arr!27374 (_keys!10502 thiss!1141)) (index!38304 lt!425495)) key!756)))))

(declare-fun e!530364 () SeekEntryResult!8983)

(assert (=> d!114485 (= lt!425495 e!530364)))

(declare-fun c!98492 () Bool)

(assert (=> d!114485 (= c!98492 (and ((_ is Intermediate!8983) lt!425493) (undefined!9795 lt!425493)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!56899 (_ BitVec 32)) SeekEntryResult!8983)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!114485 (= lt!425493 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!756 (mask!27246 thiss!1141)) key!756 (_keys!10502 thiss!1141) (mask!27246 thiss!1141)))))

(assert (=> d!114485 (validMask!0 (mask!27246 thiss!1141))))

(assert (=> d!114485 (= (seekEntry!0 key!756 (_keys!10502 thiss!1141) (mask!27246 thiss!1141)) lt!425495)))

(declare-fun b!943162 () Bool)

(declare-fun e!530362 () SeekEntryResult!8983)

(assert (=> b!943162 (= e!530362 (Found!8983 (index!38305 lt!425493)))))

(declare-fun b!943163 () Bool)

(assert (=> b!943163 (= e!530364 Undefined!8983)))

(declare-fun b!943164 () Bool)

(declare-fun lt!425492 () SeekEntryResult!8983)

(assert (=> b!943164 (= e!530363 (ite ((_ is MissingVacant!8983) lt!425492) (MissingZero!8983 (index!38306 lt!425492)) lt!425492))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!56899 (_ BitVec 32)) SeekEntryResult!8983)

(assert (=> b!943164 (= lt!425492 (seekKeyOrZeroReturnVacant!0 (x!80854 lt!425493) (index!38305 lt!425493) (index!38305 lt!425493) key!756 (_keys!10502 thiss!1141) (mask!27246 thiss!1141)))))

(declare-fun b!943165 () Bool)

(declare-fun c!98493 () Bool)

(declare-fun lt!425494 () (_ BitVec 64))

(assert (=> b!943165 (= c!98493 (= lt!425494 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!943165 (= e!530362 e!530363)))

(declare-fun b!943166 () Bool)

(assert (=> b!943166 (= e!530364 e!530362)))

(assert (=> b!943166 (= lt!425494 (select (arr!27374 (_keys!10502 thiss!1141)) (index!38305 lt!425493)))))

(declare-fun c!98494 () Bool)

(assert (=> b!943166 (= c!98494 (= lt!425494 key!756))))

(assert (= (and d!114485 c!98492) b!943163))

(assert (= (and d!114485 (not c!98492)) b!943166))

(assert (= (and b!943166 c!98494) b!943162))

(assert (= (and b!943166 (not c!98494)) b!943165))

(assert (= (and b!943165 c!98493) b!943161))

(assert (= (and b!943165 (not c!98493)) b!943164))

(declare-fun m!878221 () Bool)

(assert (=> d!114485 m!878221))

(declare-fun m!878223 () Bool)

(assert (=> d!114485 m!878223))

(assert (=> d!114485 m!878223))

(declare-fun m!878225 () Bool)

(assert (=> d!114485 m!878225))

(assert (=> d!114485 m!878163))

(declare-fun m!878227 () Bool)

(assert (=> b!943164 m!878227))

(declare-fun m!878229 () Bool)

(assert (=> b!943166 m!878229))

(assert (=> b!943065 d!114485))

(declare-fun d!114487 () Bool)

(assert (=> d!114487 (= (validMask!0 (mask!27246 thiss!1141)) (and (or (= (mask!27246 thiss!1141) #b00000000000000000000000000000111) (= (mask!27246 thiss!1141) #b00000000000000000000000000001111) (= (mask!27246 thiss!1141) #b00000000000000000000000000011111) (= (mask!27246 thiss!1141) #b00000000000000000000000000111111) (= (mask!27246 thiss!1141) #b00000000000000000000000001111111) (= (mask!27246 thiss!1141) #b00000000000000000000000011111111) (= (mask!27246 thiss!1141) #b00000000000000000000000111111111) (= (mask!27246 thiss!1141) #b00000000000000000000001111111111) (= (mask!27246 thiss!1141) #b00000000000000000000011111111111) (= (mask!27246 thiss!1141) #b00000000000000000000111111111111) (= (mask!27246 thiss!1141) #b00000000000000000001111111111111) (= (mask!27246 thiss!1141) #b00000000000000000011111111111111) (= (mask!27246 thiss!1141) #b00000000000000000111111111111111) (= (mask!27246 thiss!1141) #b00000000000000001111111111111111) (= (mask!27246 thiss!1141) #b00000000000000011111111111111111) (= (mask!27246 thiss!1141) #b00000000000000111111111111111111) (= (mask!27246 thiss!1141) #b00000000000001111111111111111111) (= (mask!27246 thiss!1141) #b00000000000011111111111111111111) (= (mask!27246 thiss!1141) #b00000000000111111111111111111111) (= (mask!27246 thiss!1141) #b00000000001111111111111111111111) (= (mask!27246 thiss!1141) #b00000000011111111111111111111111) (= (mask!27246 thiss!1141) #b00000000111111111111111111111111) (= (mask!27246 thiss!1141) #b00000001111111111111111111111111) (= (mask!27246 thiss!1141) #b00000011111111111111111111111111) (= (mask!27246 thiss!1141) #b00000111111111111111111111111111) (= (mask!27246 thiss!1141) #b00001111111111111111111111111111) (= (mask!27246 thiss!1141) #b00011111111111111111111111111111) (= (mask!27246 thiss!1141) #b00111111111111111111111111111111)) (bvsle (mask!27246 thiss!1141) #b00111111111111111111111111111111)))))

(assert (=> b!943066 d!114487))

(declare-fun d!114489 () Bool)

(assert (=> d!114489 (= (array_inv!21360 (_keys!10502 thiss!1141)) (bvsge (size!27840 (_keys!10502 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!943067 d!114489))

(declare-fun d!114491 () Bool)

(assert (=> d!114491 (= (array_inv!21361 (_values!5629 thiss!1141)) (bvsge (size!27839 (_values!5629 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!943067 d!114491))

(declare-fun mapNonEmpty!32486 () Bool)

(declare-fun mapRes!32486 () Bool)

(declare-fun tp!62318 () Bool)

(declare-fun e!530369 () Bool)

(assert (=> mapNonEmpty!32486 (= mapRes!32486 (and tp!62318 e!530369))))

(declare-fun mapKey!32486 () (_ BitVec 32))

(declare-fun mapValue!32486 () ValueCell!9740)

(declare-fun mapRest!32486 () (Array (_ BitVec 32) ValueCell!9740))

(assert (=> mapNonEmpty!32486 (= mapRest!32477 (store mapRest!32486 mapKey!32486 mapValue!32486))))

(declare-fun b!943173 () Bool)

(assert (=> b!943173 (= e!530369 tp_is_empty!20443)))

(declare-fun b!943174 () Bool)

(declare-fun e!530370 () Bool)

(assert (=> b!943174 (= e!530370 tp_is_empty!20443)))

(declare-fun mapIsEmpty!32486 () Bool)

(assert (=> mapIsEmpty!32486 mapRes!32486))

(declare-fun condMapEmpty!32486 () Bool)

(declare-fun mapDefault!32486 () ValueCell!9740)

(assert (=> mapNonEmpty!32477 (= condMapEmpty!32486 (= mapRest!32477 ((as const (Array (_ BitVec 32) ValueCell!9740)) mapDefault!32486)))))

(assert (=> mapNonEmpty!32477 (= tp!62303 (and e!530370 mapRes!32486))))

(assert (= (and mapNonEmpty!32477 condMapEmpty!32486) mapIsEmpty!32486))

(assert (= (and mapNonEmpty!32477 (not condMapEmpty!32486)) mapNonEmpty!32486))

(assert (= (and mapNonEmpty!32486 ((_ is ValueCellFull!9740) mapValue!32486)) b!943173))

(assert (= (and mapNonEmpty!32477 ((_ is ValueCellFull!9740) mapDefault!32486)) b!943174))

(declare-fun m!878231 () Bool)

(assert (=> mapNonEmpty!32486 m!878231))

(check-sat (not bm!40995) (not d!114485) b_and!29357 (not d!114481) (not b!943148) (not b!943147) tp_is_empty!20443 (not b!943136) (not b!943135) (not b!943164) (not mapNonEmpty!32486) (not b!943134) (not b_next!17935))
(check-sat b_and!29357 (not b_next!17935))
