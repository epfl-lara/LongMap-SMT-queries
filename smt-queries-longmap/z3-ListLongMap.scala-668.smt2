; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16500 () Bool)

(assert start!16500)

(declare-fun b!164092 () Bool)

(declare-fun b_free!3819 () Bool)

(declare-fun b_next!3819 () Bool)

(assert (=> b!164092 (= b_free!3819 (not b_next!3819))))

(declare-fun tp!14055 () Bool)

(declare-fun b_and!10233 () Bool)

(assert (=> b!164092 (= tp!14055 b_and!10233)))

(declare-fun mapIsEmpty!6147 () Bool)

(declare-fun mapRes!6147 () Bool)

(assert (=> mapIsEmpty!6147 mapRes!6147))

(declare-fun mapNonEmpty!6147 () Bool)

(declare-fun tp!14054 () Bool)

(declare-fun e!107663 () Bool)

(assert (=> mapNonEmpty!6147 (= mapRes!6147 (and tp!14054 e!107663))))

(declare-datatypes ((V!4475 0))(
  ( (V!4476 (val!1855 Int)) )
))
(declare-datatypes ((ValueCell!1467 0))(
  ( (ValueCellFull!1467 (v!3720 V!4475)) (EmptyCell!1467) )
))
(declare-fun mapValue!6147 () ValueCell!1467)

(declare-fun mapKey!6147 () (_ BitVec 32))

(declare-datatypes ((array!6337 0))(
  ( (array!6338 (arr!3005 (Array (_ BitVec 32) (_ BitVec 64))) (size!3293 (_ BitVec 32))) )
))
(declare-datatypes ((array!6339 0))(
  ( (array!6340 (arr!3006 (Array (_ BitVec 32) ValueCell!1467)) (size!3294 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1842 0))(
  ( (LongMapFixedSize!1843 (defaultEntry!3363 Int) (mask!8045 (_ BitVec 32)) (extraKeys!3104 (_ BitVec 32)) (zeroValue!3206 V!4475) (minValue!3206 V!4475) (_size!970 (_ BitVec 32)) (_keys!5186 array!6337) (_values!3346 array!6339) (_vacant!970 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1842)

(declare-fun mapRest!6147 () (Array (_ BitVec 32) ValueCell!1467))

(assert (=> mapNonEmpty!6147 (= (arr!3006 (_values!3346 thiss!1248)) (store mapRest!6147 mapKey!6147 mapValue!6147))))

(declare-fun b!164089 () Bool)

(declare-fun tp_is_empty!3621 () Bool)

(assert (=> b!164089 (= e!107663 tp_is_empty!3621)))

(declare-fun b!164090 () Bool)

(declare-fun e!107667 () Bool)

(assert (=> b!164090 (= e!107667 (bvsgt #b00000000000000000000000000000000 (size!3293 (_keys!5186 thiss!1248))))))

(declare-fun b!164091 () Bool)

(declare-fun res!77646 () Bool)

(declare-fun e!107664 () Bool)

(assert (=> b!164091 (=> (not res!77646) (not e!107664))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!164091 (= res!77646 (not (= key!828 (bvneg key!828))))))

(declare-fun e!107666 () Bool)

(declare-fun e!107668 () Bool)

(declare-fun array_inv!1923 (array!6337) Bool)

(declare-fun array_inv!1924 (array!6339) Bool)

(assert (=> b!164092 (= e!107668 (and tp!14055 tp_is_empty!3621 (array_inv!1923 (_keys!5186 thiss!1248)) (array_inv!1924 (_values!3346 thiss!1248)) e!107666))))

(declare-fun b!164093 () Bool)

(declare-fun res!77650 () Bool)

(assert (=> b!164093 (=> (not res!77650) (not e!107667))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!164093 (= res!77650 (validMask!0 (mask!8045 thiss!1248)))))

(declare-fun b!164094 () Bool)

(declare-fun res!77647 () Bool)

(assert (=> b!164094 (=> (not res!77647) (not e!107667))))

(declare-datatypes ((List!1996 0))(
  ( (Nil!1993) (Cons!1992 (h!2609 (_ BitVec 64)) (t!6798 List!1996)) )
))
(declare-fun arrayNoDuplicates!0 (array!6337 (_ BitVec 32) List!1996) Bool)

(assert (=> b!164094 (= res!77647 (arrayNoDuplicates!0 (_keys!5186 thiss!1248) #b00000000000000000000000000000000 Nil!1993))))

(declare-fun b!164095 () Bool)

(declare-fun res!77652 () Bool)

(assert (=> b!164095 (=> (not res!77652) (not e!107667))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!6337 (_ BitVec 32)) Bool)

(assert (=> b!164095 (= res!77652 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5186 thiss!1248) (mask!8045 thiss!1248)))))

(declare-fun b!164096 () Bool)

(declare-fun res!77651 () Bool)

(assert (=> b!164096 (=> (not res!77651) (not e!107667))))

(assert (=> b!164096 (= res!77651 (and (= (size!3294 (_values!3346 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8045 thiss!1248))) (= (size!3293 (_keys!5186 thiss!1248)) (size!3294 (_values!3346 thiss!1248))) (bvsge (mask!8045 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3104 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3104 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!164097 () Bool)

(declare-fun e!107665 () Bool)

(assert (=> b!164097 (= e!107665 tp_is_empty!3621)))

(declare-fun b!164098 () Bool)

(assert (=> b!164098 (= e!107666 (and e!107665 mapRes!6147))))

(declare-fun condMapEmpty!6147 () Bool)

(declare-fun mapDefault!6147 () ValueCell!1467)

(assert (=> b!164098 (= condMapEmpty!6147 (= (arr!3006 (_values!3346 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1467)) mapDefault!6147)))))

(declare-fun res!77649 () Bool)

(assert (=> start!16500 (=> (not res!77649) (not e!107664))))

(declare-fun valid!822 (LongMapFixedSize!1842) Bool)

(assert (=> start!16500 (= res!77649 (valid!822 thiss!1248))))

(assert (=> start!16500 e!107664))

(assert (=> start!16500 e!107668))

(assert (=> start!16500 true))

(declare-fun b!164088 () Bool)

(assert (=> b!164088 (= e!107664 e!107667)))

(declare-fun res!77648 () Bool)

(assert (=> b!164088 (=> (not res!77648) (not e!107667))))

(declare-datatypes ((SeekEntryResult!410 0))(
  ( (MissingZero!410 (index!3808 (_ BitVec 32))) (Found!410 (index!3809 (_ BitVec 32))) (Intermediate!410 (undefined!1222 Bool) (index!3810 (_ BitVec 32)) (x!18198 (_ BitVec 32))) (Undefined!410) (MissingVacant!410 (index!3811 (_ BitVec 32))) )
))
(declare-fun lt!82822 () SeekEntryResult!410)

(get-info :version)

(assert (=> b!164088 (= res!77648 (and (not ((_ is Undefined!410) lt!82822)) (not ((_ is MissingVacant!410) lt!82822)) (not ((_ is MissingZero!410) lt!82822)) ((_ is Found!410) lt!82822)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6337 (_ BitVec 32)) SeekEntryResult!410)

(assert (=> b!164088 (= lt!82822 (seekEntryOrOpen!0 key!828 (_keys!5186 thiss!1248) (mask!8045 thiss!1248)))))

(assert (= (and start!16500 res!77649) b!164091))

(assert (= (and b!164091 res!77646) b!164088))

(assert (= (and b!164088 res!77648) b!164093))

(assert (= (and b!164093 res!77650) b!164096))

(assert (= (and b!164096 res!77651) b!164095))

(assert (= (and b!164095 res!77652) b!164094))

(assert (= (and b!164094 res!77647) b!164090))

(assert (= (and b!164098 condMapEmpty!6147) mapIsEmpty!6147))

(assert (= (and b!164098 (not condMapEmpty!6147)) mapNonEmpty!6147))

(assert (= (and mapNonEmpty!6147 ((_ is ValueCellFull!1467) mapValue!6147)) b!164089))

(assert (= (and b!164098 ((_ is ValueCellFull!1467) mapDefault!6147)) b!164097))

(assert (= b!164092 b!164098))

(assert (= start!16500 b!164092))

(declare-fun m!194443 () Bool)

(assert (=> b!164095 m!194443))

(declare-fun m!194445 () Bool)

(assert (=> mapNonEmpty!6147 m!194445))

(declare-fun m!194447 () Bool)

(assert (=> b!164088 m!194447))

(declare-fun m!194449 () Bool)

(assert (=> b!164093 m!194449))

(declare-fun m!194451 () Bool)

(assert (=> b!164094 m!194451))

(declare-fun m!194453 () Bool)

(assert (=> start!16500 m!194453))

(declare-fun m!194455 () Bool)

(assert (=> b!164092 m!194455))

(declare-fun m!194457 () Bool)

(assert (=> b!164092 m!194457))

(check-sat (not b!164095) (not start!16500) (not b_next!3819) (not b!164094) (not mapNonEmpty!6147) (not b!164088) tp_is_empty!3621 (not b!164093) b_and!10233 (not b!164092))
(check-sat b_and!10233 (not b_next!3819))
(get-model)

(declare-fun d!51515 () Bool)

(declare-fun res!77680 () Bool)

(declare-fun e!107693 () Bool)

(assert (=> d!51515 (=> (not res!77680) (not e!107693))))

(declare-fun simpleValid!126 (LongMapFixedSize!1842) Bool)

(assert (=> d!51515 (= res!77680 (simpleValid!126 thiss!1248))))

(assert (=> d!51515 (= (valid!822 thiss!1248) e!107693)))

(declare-fun b!164138 () Bool)

(declare-fun res!77681 () Bool)

(assert (=> b!164138 (=> (not res!77681) (not e!107693))))

(declare-fun arrayCountValidKeys!0 (array!6337 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!164138 (= res!77681 (= (arrayCountValidKeys!0 (_keys!5186 thiss!1248) #b00000000000000000000000000000000 (size!3293 (_keys!5186 thiss!1248))) (_size!970 thiss!1248)))))

(declare-fun b!164139 () Bool)

(declare-fun res!77682 () Bool)

(assert (=> b!164139 (=> (not res!77682) (not e!107693))))

(assert (=> b!164139 (= res!77682 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5186 thiss!1248) (mask!8045 thiss!1248)))))

(declare-fun b!164140 () Bool)

(assert (=> b!164140 (= e!107693 (arrayNoDuplicates!0 (_keys!5186 thiss!1248) #b00000000000000000000000000000000 Nil!1993))))

(assert (= (and d!51515 res!77680) b!164138))

(assert (= (and b!164138 res!77681) b!164139))

(assert (= (and b!164139 res!77682) b!164140))

(declare-fun m!194475 () Bool)

(assert (=> d!51515 m!194475))

(declare-fun m!194477 () Bool)

(assert (=> b!164138 m!194477))

(assert (=> b!164139 m!194443))

(assert (=> b!164140 m!194451))

(assert (=> start!16500 d!51515))

(declare-fun d!51517 () Bool)

(declare-fun res!77687 () Bool)

(declare-fun e!107701 () Bool)

(assert (=> d!51517 (=> res!77687 e!107701)))

(assert (=> d!51517 (= res!77687 (bvsge #b00000000000000000000000000000000 (size!3293 (_keys!5186 thiss!1248))))))

(assert (=> d!51517 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5186 thiss!1248) (mask!8045 thiss!1248)) e!107701)))

(declare-fun b!164149 () Bool)

(declare-fun e!107702 () Bool)

(declare-fun e!107700 () Bool)

(assert (=> b!164149 (= e!107702 e!107700)))

(declare-fun lt!82832 () (_ BitVec 64))

(assert (=> b!164149 (= lt!82832 (select (arr!3005 (_keys!5186 thiss!1248)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!5047 0))(
  ( (Unit!5048) )
))
(declare-fun lt!82833 () Unit!5047)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!6337 (_ BitVec 64) (_ BitVec 32)) Unit!5047)

(assert (=> b!164149 (= lt!82833 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5186 thiss!1248) lt!82832 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!6337 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!164149 (arrayContainsKey!0 (_keys!5186 thiss!1248) lt!82832 #b00000000000000000000000000000000)))

(declare-fun lt!82834 () Unit!5047)

(assert (=> b!164149 (= lt!82834 lt!82833)))

(declare-fun res!77688 () Bool)

(assert (=> b!164149 (= res!77688 (= (seekEntryOrOpen!0 (select (arr!3005 (_keys!5186 thiss!1248)) #b00000000000000000000000000000000) (_keys!5186 thiss!1248) (mask!8045 thiss!1248)) (Found!410 #b00000000000000000000000000000000)))))

(assert (=> b!164149 (=> (not res!77688) (not e!107700))))

(declare-fun b!164150 () Bool)

(declare-fun call!17332 () Bool)

(assert (=> b!164150 (= e!107702 call!17332)))

(declare-fun b!164151 () Bool)

(assert (=> b!164151 (= e!107701 e!107702)))

(declare-fun c!30181 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!164151 (= c!30181 (validKeyInArray!0 (select (arr!3005 (_keys!5186 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!17329 () Bool)

(assert (=> bm!17329 (= call!17332 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5186 thiss!1248) (mask!8045 thiss!1248)))))

(declare-fun b!164152 () Bool)

(assert (=> b!164152 (= e!107700 call!17332)))

(assert (= (and d!51517 (not res!77687)) b!164151))

(assert (= (and b!164151 c!30181) b!164149))

(assert (= (and b!164151 (not c!30181)) b!164150))

(assert (= (and b!164149 res!77688) b!164152))

(assert (= (or b!164152 b!164150) bm!17329))

(declare-fun m!194479 () Bool)

(assert (=> b!164149 m!194479))

(declare-fun m!194481 () Bool)

(assert (=> b!164149 m!194481))

(declare-fun m!194483 () Bool)

(assert (=> b!164149 m!194483))

(assert (=> b!164149 m!194479))

(declare-fun m!194485 () Bool)

(assert (=> b!164149 m!194485))

(assert (=> b!164151 m!194479))

(assert (=> b!164151 m!194479))

(declare-fun m!194487 () Bool)

(assert (=> b!164151 m!194487))

(declare-fun m!194489 () Bool)

(assert (=> bm!17329 m!194489))

(assert (=> b!164095 d!51517))

(declare-fun b!164163 () Bool)

(declare-fun e!107714 () Bool)

(declare-fun call!17335 () Bool)

(assert (=> b!164163 (= e!107714 call!17335)))

(declare-fun bm!17332 () Bool)

(declare-fun c!30184 () Bool)

(assert (=> bm!17332 (= call!17335 (arrayNoDuplicates!0 (_keys!5186 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!30184 (Cons!1992 (select (arr!3005 (_keys!5186 thiss!1248)) #b00000000000000000000000000000000) Nil!1993) Nil!1993)))))

(declare-fun d!51519 () Bool)

(declare-fun res!77696 () Bool)

(declare-fun e!107712 () Bool)

(assert (=> d!51519 (=> res!77696 e!107712)))

(assert (=> d!51519 (= res!77696 (bvsge #b00000000000000000000000000000000 (size!3293 (_keys!5186 thiss!1248))))))

(assert (=> d!51519 (= (arrayNoDuplicates!0 (_keys!5186 thiss!1248) #b00000000000000000000000000000000 Nil!1993) e!107712)))

(declare-fun b!164164 () Bool)

(declare-fun e!107711 () Bool)

(assert (=> b!164164 (= e!107712 e!107711)))

(declare-fun res!77697 () Bool)

(assert (=> b!164164 (=> (not res!77697) (not e!107711))))

(declare-fun e!107713 () Bool)

(assert (=> b!164164 (= res!77697 (not e!107713))))

(declare-fun res!77695 () Bool)

(assert (=> b!164164 (=> (not res!77695) (not e!107713))))

(assert (=> b!164164 (= res!77695 (validKeyInArray!0 (select (arr!3005 (_keys!5186 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!164165 () Bool)

(assert (=> b!164165 (= e!107711 e!107714)))

(assert (=> b!164165 (= c!30184 (validKeyInArray!0 (select (arr!3005 (_keys!5186 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!164166 () Bool)

(assert (=> b!164166 (= e!107714 call!17335)))

(declare-fun b!164167 () Bool)

(declare-fun contains!1041 (List!1996 (_ BitVec 64)) Bool)

(assert (=> b!164167 (= e!107713 (contains!1041 Nil!1993 (select (arr!3005 (_keys!5186 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (= (and d!51519 (not res!77696)) b!164164))

(assert (= (and b!164164 res!77695) b!164167))

(assert (= (and b!164164 res!77697) b!164165))

(assert (= (and b!164165 c!30184) b!164163))

(assert (= (and b!164165 (not c!30184)) b!164166))

(assert (= (or b!164163 b!164166) bm!17332))

(assert (=> bm!17332 m!194479))

(declare-fun m!194491 () Bool)

(assert (=> bm!17332 m!194491))

(assert (=> b!164164 m!194479))

(assert (=> b!164164 m!194479))

(assert (=> b!164164 m!194487))

(assert (=> b!164165 m!194479))

(assert (=> b!164165 m!194479))

(assert (=> b!164165 m!194487))

(assert (=> b!164167 m!194479))

(assert (=> b!164167 m!194479))

(declare-fun m!194493 () Bool)

(assert (=> b!164167 m!194493))

(assert (=> b!164094 d!51519))

(declare-fun d!51521 () Bool)

(assert (=> d!51521 (= (validMask!0 (mask!8045 thiss!1248)) (and (or (= (mask!8045 thiss!1248) #b00000000000000000000000000000111) (= (mask!8045 thiss!1248) #b00000000000000000000000000001111) (= (mask!8045 thiss!1248) #b00000000000000000000000000011111) (= (mask!8045 thiss!1248) #b00000000000000000000000000111111) (= (mask!8045 thiss!1248) #b00000000000000000000000001111111) (= (mask!8045 thiss!1248) #b00000000000000000000000011111111) (= (mask!8045 thiss!1248) #b00000000000000000000000111111111) (= (mask!8045 thiss!1248) #b00000000000000000000001111111111) (= (mask!8045 thiss!1248) #b00000000000000000000011111111111) (= (mask!8045 thiss!1248) #b00000000000000000000111111111111) (= (mask!8045 thiss!1248) #b00000000000000000001111111111111) (= (mask!8045 thiss!1248) #b00000000000000000011111111111111) (= (mask!8045 thiss!1248) #b00000000000000000111111111111111) (= (mask!8045 thiss!1248) #b00000000000000001111111111111111) (= (mask!8045 thiss!1248) #b00000000000000011111111111111111) (= (mask!8045 thiss!1248) #b00000000000000111111111111111111) (= (mask!8045 thiss!1248) #b00000000000001111111111111111111) (= (mask!8045 thiss!1248) #b00000000000011111111111111111111) (= (mask!8045 thiss!1248) #b00000000000111111111111111111111) (= (mask!8045 thiss!1248) #b00000000001111111111111111111111) (= (mask!8045 thiss!1248) #b00000000011111111111111111111111) (= (mask!8045 thiss!1248) #b00000000111111111111111111111111) (= (mask!8045 thiss!1248) #b00000001111111111111111111111111) (= (mask!8045 thiss!1248) #b00000011111111111111111111111111) (= (mask!8045 thiss!1248) #b00000111111111111111111111111111) (= (mask!8045 thiss!1248) #b00001111111111111111111111111111) (= (mask!8045 thiss!1248) #b00011111111111111111111111111111) (= (mask!8045 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!8045 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!164093 d!51521))

(declare-fun d!51523 () Bool)

(assert (=> d!51523 (= (array_inv!1923 (_keys!5186 thiss!1248)) (bvsge (size!3293 (_keys!5186 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!164092 d!51523))

(declare-fun d!51525 () Bool)

(assert (=> d!51525 (= (array_inv!1924 (_values!3346 thiss!1248)) (bvsge (size!3294 (_values!3346 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!164092 d!51525))

(declare-fun d!51527 () Bool)

(declare-fun lt!82841 () SeekEntryResult!410)

(assert (=> d!51527 (and (or ((_ is Undefined!410) lt!82841) (not ((_ is Found!410) lt!82841)) (and (bvsge (index!3809 lt!82841) #b00000000000000000000000000000000) (bvslt (index!3809 lt!82841) (size!3293 (_keys!5186 thiss!1248))))) (or ((_ is Undefined!410) lt!82841) ((_ is Found!410) lt!82841) (not ((_ is MissingZero!410) lt!82841)) (and (bvsge (index!3808 lt!82841) #b00000000000000000000000000000000) (bvslt (index!3808 lt!82841) (size!3293 (_keys!5186 thiss!1248))))) (or ((_ is Undefined!410) lt!82841) ((_ is Found!410) lt!82841) ((_ is MissingZero!410) lt!82841) (not ((_ is MissingVacant!410) lt!82841)) (and (bvsge (index!3811 lt!82841) #b00000000000000000000000000000000) (bvslt (index!3811 lt!82841) (size!3293 (_keys!5186 thiss!1248))))) (or ((_ is Undefined!410) lt!82841) (ite ((_ is Found!410) lt!82841) (= (select (arr!3005 (_keys!5186 thiss!1248)) (index!3809 lt!82841)) key!828) (ite ((_ is MissingZero!410) lt!82841) (= (select (arr!3005 (_keys!5186 thiss!1248)) (index!3808 lt!82841)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!410) lt!82841) (= (select (arr!3005 (_keys!5186 thiss!1248)) (index!3811 lt!82841)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!107723 () SeekEntryResult!410)

(assert (=> d!51527 (= lt!82841 e!107723)))

(declare-fun c!30193 () Bool)

(declare-fun lt!82842 () SeekEntryResult!410)

(assert (=> d!51527 (= c!30193 (and ((_ is Intermediate!410) lt!82842) (undefined!1222 lt!82842)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!6337 (_ BitVec 32)) SeekEntryResult!410)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!51527 (= lt!82842 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!8045 thiss!1248)) key!828 (_keys!5186 thiss!1248) (mask!8045 thiss!1248)))))

(assert (=> d!51527 (validMask!0 (mask!8045 thiss!1248))))

(assert (=> d!51527 (= (seekEntryOrOpen!0 key!828 (_keys!5186 thiss!1248) (mask!8045 thiss!1248)) lt!82841)))

(declare-fun b!164180 () Bool)

(declare-fun e!107722 () SeekEntryResult!410)

(assert (=> b!164180 (= e!107722 (Found!410 (index!3810 lt!82842)))))

(declare-fun b!164181 () Bool)

(declare-fun c!30191 () Bool)

(declare-fun lt!82843 () (_ BitVec 64))

(assert (=> b!164181 (= c!30191 (= lt!82843 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!107721 () SeekEntryResult!410)

(assert (=> b!164181 (= e!107722 e!107721)))

(declare-fun b!164182 () Bool)

(assert (=> b!164182 (= e!107721 (MissingZero!410 (index!3810 lt!82842)))))

(declare-fun b!164183 () Bool)

(assert (=> b!164183 (= e!107723 e!107722)))

(assert (=> b!164183 (= lt!82843 (select (arr!3005 (_keys!5186 thiss!1248)) (index!3810 lt!82842)))))

(declare-fun c!30192 () Bool)

(assert (=> b!164183 (= c!30192 (= lt!82843 key!828))))

(declare-fun b!164184 () Bool)

(assert (=> b!164184 (= e!107723 Undefined!410)))

(declare-fun b!164185 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!6337 (_ BitVec 32)) SeekEntryResult!410)

(assert (=> b!164185 (= e!107721 (seekKeyOrZeroReturnVacant!0 (x!18198 lt!82842) (index!3810 lt!82842) (index!3810 lt!82842) key!828 (_keys!5186 thiss!1248) (mask!8045 thiss!1248)))))

(assert (= (and d!51527 c!30193) b!164184))

(assert (= (and d!51527 (not c!30193)) b!164183))

(assert (= (and b!164183 c!30192) b!164180))

(assert (= (and b!164183 (not c!30192)) b!164181))

(assert (= (and b!164181 c!30191) b!164182))

(assert (= (and b!164181 (not c!30191)) b!164185))

(assert (=> d!51527 m!194449))

(declare-fun m!194495 () Bool)

(assert (=> d!51527 m!194495))

(declare-fun m!194497 () Bool)

(assert (=> d!51527 m!194497))

(declare-fun m!194499 () Bool)

(assert (=> d!51527 m!194499))

(declare-fun m!194501 () Bool)

(assert (=> d!51527 m!194501))

(declare-fun m!194503 () Bool)

(assert (=> d!51527 m!194503))

(assert (=> d!51527 m!194497))

(declare-fun m!194505 () Bool)

(assert (=> b!164183 m!194505))

(declare-fun m!194507 () Bool)

(assert (=> b!164185 m!194507))

(assert (=> b!164088 d!51527))

(declare-fun b!164192 () Bool)

(declare-fun e!107729 () Bool)

(assert (=> b!164192 (= e!107729 tp_is_empty!3621)))

(declare-fun mapNonEmpty!6153 () Bool)

(declare-fun mapRes!6153 () Bool)

(declare-fun tp!14064 () Bool)

(assert (=> mapNonEmpty!6153 (= mapRes!6153 (and tp!14064 e!107729))))

(declare-fun mapValue!6153 () ValueCell!1467)

(declare-fun mapRest!6153 () (Array (_ BitVec 32) ValueCell!1467))

(declare-fun mapKey!6153 () (_ BitVec 32))

(assert (=> mapNonEmpty!6153 (= mapRest!6147 (store mapRest!6153 mapKey!6153 mapValue!6153))))

(declare-fun b!164193 () Bool)

(declare-fun e!107728 () Bool)

(assert (=> b!164193 (= e!107728 tp_is_empty!3621)))

(declare-fun mapIsEmpty!6153 () Bool)

(assert (=> mapIsEmpty!6153 mapRes!6153))

(declare-fun condMapEmpty!6153 () Bool)

(declare-fun mapDefault!6153 () ValueCell!1467)

(assert (=> mapNonEmpty!6147 (= condMapEmpty!6153 (= mapRest!6147 ((as const (Array (_ BitVec 32) ValueCell!1467)) mapDefault!6153)))))

(assert (=> mapNonEmpty!6147 (= tp!14054 (and e!107728 mapRes!6153))))

(assert (= (and mapNonEmpty!6147 condMapEmpty!6153) mapIsEmpty!6153))

(assert (= (and mapNonEmpty!6147 (not condMapEmpty!6153)) mapNonEmpty!6153))

(assert (= (and mapNonEmpty!6153 ((_ is ValueCellFull!1467) mapValue!6153)) b!164192))

(assert (= (and mapNonEmpty!6147 ((_ is ValueCellFull!1467) mapDefault!6153)) b!164193))

(declare-fun m!194509 () Bool)

(assert (=> mapNonEmpty!6153 m!194509))

(check-sat (not b!164149) (not d!51515) (not b!164167) (not b!164139) (not bm!17332) (not b!164164) (not b!164151) (not b!164185) (not b_next!3819) (not b!164165) (not b!164140) (not b!164138) (not d!51527) (not bm!17329) tp_is_empty!3621 b_and!10233 (not mapNonEmpty!6153))
(check-sat b_and!10233 (not b_next!3819))
