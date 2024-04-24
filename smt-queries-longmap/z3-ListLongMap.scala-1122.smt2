; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22982 () Bool)

(assert start!22982)

(declare-fun b!240954 () Bool)

(declare-fun b_free!6481 () Bool)

(declare-fun b_next!6481 () Bool)

(assert (=> b!240954 (= b_free!6481 (not b_next!6481))))

(declare-fun tp!22647 () Bool)

(declare-fun b_and!13461 () Bool)

(assert (=> b!240954 (= tp!22647 b_and!13461)))

(declare-fun b!240946 () Bool)

(declare-fun res!118148 () Bool)

(declare-datatypes ((V!8105 0))(
  ( (V!8106 (val!3216 Int)) )
))
(declare-datatypes ((ValueCell!2828 0))(
  ( (ValueCellFull!2828 (v!5255 V!8105)) (EmptyCell!2828) )
))
(declare-datatypes ((array!11963 0))(
  ( (array!11964 (arr!5683 (Array (_ BitVec 32) ValueCell!2828)) (size!6024 (_ BitVec 32))) )
))
(declare-datatypes ((array!11965 0))(
  ( (array!11966 (arr!5684 (Array (_ BitVec 32) (_ BitVec 64))) (size!6025 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3556 0))(
  ( (LongMapFixedSize!3557 (defaultEntry!4463 Int) (mask!10525 (_ BitVec 32)) (extraKeys!4200 (_ BitVec 32)) (zeroValue!4304 V!8105) (minValue!4304 V!8105) (_size!1827 (_ BitVec 32)) (_keys!6565 array!11965) (_values!4446 array!11963) (_vacant!1827 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3556)

(declare-datatypes ((SeekEntryResult!1020 0))(
  ( (MissingZero!1020 (index!6250 (_ BitVec 32))) (Found!1020 (index!6251 (_ BitVec 32))) (Intermediate!1020 (undefined!1832 Bool) (index!6252 (_ BitVec 32)) (x!24156 (_ BitVec 32))) (Undefined!1020) (MissingVacant!1020 (index!6253 (_ BitVec 32))) )
))
(declare-fun lt!121154 () SeekEntryResult!1020)

(assert (=> b!240946 (= res!118148 (= (select (arr!5684 (_keys!6565 thiss!1504)) (index!6253 lt!121154)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!156375 () Bool)

(assert (=> b!240946 (=> (not res!118148) (not e!156375))))

(declare-fun b!240947 () Bool)

(declare-datatypes ((Unit!7391 0))(
  ( (Unit!7392) )
))
(declare-fun e!156377 () Unit!7391)

(declare-fun Unit!7393 () Unit!7391)

(assert (=> b!240947 (= e!156377 Unit!7393)))

(declare-fun lt!121157 () Unit!7391)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaArrayContainsKeyThenInListMap!160 (array!11965 array!11963 (_ BitVec 32) (_ BitVec 32) V!8105 V!8105 (_ BitVec 64) (_ BitVec 32) Int) Unit!7391)

(assert (=> b!240947 (= lt!121157 (lemmaArrayContainsKeyThenInListMap!160 (_keys!6565 thiss!1504) (_values!4446 thiss!1504) (mask!10525 thiss!1504) (extraKeys!4200 thiss!1504) (zeroValue!4304 thiss!1504) (minValue!4304 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4463 thiss!1504)))))

(assert (=> b!240947 false))

(declare-fun b!240948 () Bool)

(declare-fun res!118151 () Bool)

(declare-fun e!156383 () Bool)

(assert (=> b!240948 (=> (not res!118151) (not e!156383))))

(assert (=> b!240948 (= res!118151 (= (select (arr!5684 (_keys!6565 thiss!1504)) (index!6250 lt!121154)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!240949 () Bool)

(declare-fun e!156373 () Bool)

(declare-fun tp_is_empty!6343 () Bool)

(assert (=> b!240949 (= e!156373 tp_is_empty!6343)))

(declare-fun b!240950 () Bool)

(declare-fun e!156380 () Unit!7391)

(declare-fun Unit!7394 () Unit!7391)

(assert (=> b!240950 (= e!156380 Unit!7394)))

(declare-fun lt!121152 () Unit!7391)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!347 (array!11965 array!11963 (_ BitVec 32) (_ BitVec 32) V!8105 V!8105 (_ BitVec 64) Int) Unit!7391)

(assert (=> b!240950 (= lt!121152 (lemmaInListMapThenSeekEntryOrOpenFindsIt!347 (_keys!6565 thiss!1504) (_values!4446 thiss!1504) (mask!10525 thiss!1504) (extraKeys!4200 thiss!1504) (zeroValue!4304 thiss!1504) (minValue!4304 thiss!1504) key!932 (defaultEntry!4463 thiss!1504)))))

(assert (=> b!240950 false))

(declare-fun b!240951 () Bool)

(declare-fun c!40131 () Bool)

(get-info :version)

(assert (=> b!240951 (= c!40131 ((_ is MissingVacant!1020) lt!121154))))

(declare-fun e!156372 () Bool)

(declare-fun e!156376 () Bool)

(assert (=> b!240951 (= e!156372 e!156376)))

(declare-fun b!240952 () Bool)

(declare-fun e!156374 () Bool)

(assert (=> b!240952 (= e!156374 (bvsge (size!6025 (_keys!6565 thiss!1504)) #b01111111111111111111111111111111))))

(declare-fun lt!121153 () Unit!7391)

(assert (=> b!240952 (= lt!121153 e!156377)))

(declare-fun c!40134 () Bool)

(declare-fun arrayContainsKey!0 (array!11965 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!240952 (= c!40134 (arrayContainsKey!0 (_keys!6565 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun bm!22388 () Bool)

(declare-fun c!40133 () Bool)

(declare-fun call!22391 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!22388 (= call!22391 (inRange!0 (ite c!40133 (index!6250 lt!121154) (index!6253 lt!121154)) (mask!10525 thiss!1504)))))

(declare-fun bm!22389 () Bool)

(declare-fun call!22392 () Bool)

(assert (=> bm!22389 (= call!22392 (arrayContainsKey!0 (_keys!6565 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!240953 () Bool)

(declare-fun e!156384 () Bool)

(assert (=> b!240953 (= e!156384 tp_is_empty!6343)))

(declare-fun e!156371 () Bool)

(declare-fun e!156378 () Bool)

(declare-fun array_inv!3733 (array!11965) Bool)

(declare-fun array_inv!3734 (array!11963) Bool)

(assert (=> b!240954 (= e!156378 (and tp!22647 tp_is_empty!6343 (array_inv!3733 (_keys!6565 thiss!1504)) (array_inv!3734 (_values!4446 thiss!1504)) e!156371))))

(declare-fun b!240955 () Bool)

(assert (=> b!240955 (= e!156376 e!156375)))

(declare-fun res!118149 () Bool)

(assert (=> b!240955 (= res!118149 call!22391)))

(assert (=> b!240955 (=> (not res!118149) (not e!156375))))

(declare-fun mapNonEmpty!10746 () Bool)

(declare-fun mapRes!10746 () Bool)

(declare-fun tp!22646 () Bool)

(assert (=> mapNonEmpty!10746 (= mapRes!10746 (and tp!22646 e!156384))))

(declare-fun mapRest!10746 () (Array (_ BitVec 32) ValueCell!2828))

(declare-fun mapKey!10746 () (_ BitVec 32))

(declare-fun mapValue!10746 () ValueCell!2828)

(assert (=> mapNonEmpty!10746 (= (arr!5683 (_values!4446 thiss!1504)) (store mapRest!10746 mapKey!10746 mapValue!10746))))

(declare-fun b!240956 () Bool)

(declare-fun Unit!7395 () Unit!7391)

(assert (=> b!240956 (= e!156377 Unit!7395)))

(declare-fun mapIsEmpty!10746 () Bool)

(assert (=> mapIsEmpty!10746 mapRes!10746))

(declare-fun b!240958 () Bool)

(declare-fun e!156382 () Bool)

(assert (=> b!240958 (= e!156382 e!156374)))

(declare-fun res!118146 () Bool)

(assert (=> b!240958 (=> (not res!118146) (not e!156374))))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!240958 (= res!118146 (inRange!0 index!297 (mask!10525 thiss!1504)))))

(declare-fun lt!121155 () Unit!7391)

(assert (=> b!240958 (= lt!121155 e!156380)))

(declare-fun c!40132 () Bool)

(declare-datatypes ((tuple2!4666 0))(
  ( (tuple2!4667 (_1!2344 (_ BitVec 64)) (_2!2344 V!8105)) )
))
(declare-datatypes ((List!3541 0))(
  ( (Nil!3538) (Cons!3537 (h!4193 tuple2!4666) (t!8528 List!3541)) )
))
(declare-datatypes ((ListLongMap!3581 0))(
  ( (ListLongMap!3582 (toList!1806 List!3541)) )
))
(declare-fun contains!1708 (ListLongMap!3581 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1338 (array!11965 array!11963 (_ BitVec 32) (_ BitVec 32) V!8105 V!8105 (_ BitVec 32) Int) ListLongMap!3581)

(assert (=> b!240958 (= c!40132 (contains!1708 (getCurrentListMap!1338 (_keys!6565 thiss!1504) (_values!4446 thiss!1504) (mask!10525 thiss!1504) (extraKeys!4200 thiss!1504) (zeroValue!4304 thiss!1504) (minValue!4304 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4463 thiss!1504)) key!932))))

(declare-fun b!240959 () Bool)

(declare-fun res!118147 () Bool)

(assert (=> b!240959 (=> (not res!118147) (not e!156383))))

(assert (=> b!240959 (= res!118147 call!22391)))

(assert (=> b!240959 (= e!156372 e!156383)))

(declare-fun b!240960 () Bool)

(assert (=> b!240960 (= e!156371 (and e!156373 mapRes!10746))))

(declare-fun condMapEmpty!10746 () Bool)

(declare-fun mapDefault!10746 () ValueCell!2828)

(assert (=> b!240960 (= condMapEmpty!10746 (= (arr!5683 (_values!4446 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2828)) mapDefault!10746)))))

(declare-fun b!240961 () Bool)

(assert (=> b!240961 (= e!156383 (not call!22392))))

(declare-fun b!240962 () Bool)

(declare-fun res!118150 () Bool)

(declare-fun e!156379 () Bool)

(assert (=> b!240962 (=> (not res!118150) (not e!156379))))

(assert (=> b!240962 (= res!118150 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!240963 () Bool)

(assert (=> b!240963 (= e!156379 e!156382)))

(declare-fun res!118145 () Bool)

(assert (=> b!240963 (=> (not res!118145) (not e!156382))))

(assert (=> b!240963 (= res!118145 (or (= lt!121154 (MissingZero!1020 index!297)) (= lt!121154 (MissingVacant!1020 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11965 (_ BitVec 32)) SeekEntryResult!1020)

(assert (=> b!240963 (= lt!121154 (seekEntryOrOpen!0 key!932 (_keys!6565 thiss!1504) (mask!10525 thiss!1504)))))

(declare-fun b!240964 () Bool)

(assert (=> b!240964 (= e!156375 (not call!22392))))

(declare-fun b!240965 () Bool)

(assert (=> b!240965 (= e!156376 ((_ is Undefined!1020) lt!121154))))

(declare-fun res!118144 () Bool)

(assert (=> start!22982 (=> (not res!118144) (not e!156379))))

(declare-fun valid!1410 (LongMapFixedSize!3556) Bool)

(assert (=> start!22982 (= res!118144 (valid!1410 thiss!1504))))

(assert (=> start!22982 e!156379))

(assert (=> start!22982 e!156378))

(assert (=> start!22982 true))

(declare-fun b!240957 () Bool)

(declare-fun lt!121156 () Unit!7391)

(assert (=> b!240957 (= e!156380 lt!121156)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!339 (array!11965 array!11963 (_ BitVec 32) (_ BitVec 32) V!8105 V!8105 (_ BitVec 64) Int) Unit!7391)

(assert (=> b!240957 (= lt!121156 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!339 (_keys!6565 thiss!1504) (_values!4446 thiss!1504) (mask!10525 thiss!1504) (extraKeys!4200 thiss!1504) (zeroValue!4304 thiss!1504) (minValue!4304 thiss!1504) key!932 (defaultEntry!4463 thiss!1504)))))

(assert (=> b!240957 (= c!40133 ((_ is MissingZero!1020) lt!121154))))

(assert (=> b!240957 e!156372))

(assert (= (and start!22982 res!118144) b!240962))

(assert (= (and b!240962 res!118150) b!240963))

(assert (= (and b!240963 res!118145) b!240958))

(assert (= (and b!240958 c!40132) b!240950))

(assert (= (and b!240958 (not c!40132)) b!240957))

(assert (= (and b!240957 c!40133) b!240959))

(assert (= (and b!240957 (not c!40133)) b!240951))

(assert (= (and b!240959 res!118147) b!240948))

(assert (= (and b!240948 res!118151) b!240961))

(assert (= (and b!240951 c!40131) b!240955))

(assert (= (and b!240951 (not c!40131)) b!240965))

(assert (= (and b!240955 res!118149) b!240946))

(assert (= (and b!240946 res!118148) b!240964))

(assert (= (or b!240959 b!240955) bm!22388))

(assert (= (or b!240961 b!240964) bm!22389))

(assert (= (and b!240958 res!118146) b!240952))

(assert (= (and b!240952 c!40134) b!240947))

(assert (= (and b!240952 (not c!40134)) b!240956))

(assert (= (and b!240960 condMapEmpty!10746) mapIsEmpty!10746))

(assert (= (and b!240960 (not condMapEmpty!10746)) mapNonEmpty!10746))

(assert (= (and mapNonEmpty!10746 ((_ is ValueCellFull!2828) mapValue!10746)) b!240953))

(assert (= (and b!240960 ((_ is ValueCellFull!2828) mapDefault!10746)) b!240949))

(assert (= b!240954 b!240960))

(assert (= start!22982 b!240954))

(declare-fun m!260437 () Bool)

(assert (=> bm!22389 m!260437))

(declare-fun m!260439 () Bool)

(assert (=> b!240948 m!260439))

(declare-fun m!260441 () Bool)

(assert (=> start!22982 m!260441))

(declare-fun m!260443 () Bool)

(assert (=> b!240963 m!260443))

(declare-fun m!260445 () Bool)

(assert (=> b!240946 m!260445))

(assert (=> b!240952 m!260437))

(declare-fun m!260447 () Bool)

(assert (=> mapNonEmpty!10746 m!260447))

(declare-fun m!260449 () Bool)

(assert (=> b!240954 m!260449))

(declare-fun m!260451 () Bool)

(assert (=> b!240954 m!260451))

(declare-fun m!260453 () Bool)

(assert (=> b!240958 m!260453))

(declare-fun m!260455 () Bool)

(assert (=> b!240958 m!260455))

(assert (=> b!240958 m!260455))

(declare-fun m!260457 () Bool)

(assert (=> b!240958 m!260457))

(declare-fun m!260459 () Bool)

(assert (=> b!240957 m!260459))

(declare-fun m!260461 () Bool)

(assert (=> b!240947 m!260461))

(declare-fun m!260463 () Bool)

(assert (=> b!240950 m!260463))

(declare-fun m!260465 () Bool)

(assert (=> bm!22388 m!260465))

(check-sat (not b!240958) (not b!240950) (not mapNonEmpty!10746) (not bm!22389) tp_is_empty!6343 (not b!240954) (not b_next!6481) (not start!22982) b_and!13461 (not bm!22388) (not b!240963) (not b!240952) (not b!240957) (not b!240947))
(check-sat b_and!13461 (not b_next!6481))
(get-model)

(declare-fun d!59871 () Bool)

(assert (=> d!59871 (= (inRange!0 (ite c!40133 (index!6250 lt!121154) (index!6253 lt!121154)) (mask!10525 thiss!1504)) (and (bvsge (ite c!40133 (index!6250 lt!121154) (index!6253 lt!121154)) #b00000000000000000000000000000000) (bvslt (ite c!40133 (index!6250 lt!121154) (index!6253 lt!121154)) (bvadd (mask!10525 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> bm!22388 d!59871))

(declare-fun d!59873 () Bool)

(assert (=> d!59873 (contains!1708 (getCurrentListMap!1338 (_keys!6565 thiss!1504) (_values!4446 thiss!1504) (mask!10525 thiss!1504) (extraKeys!4200 thiss!1504) (zeroValue!4304 thiss!1504) (minValue!4304 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4463 thiss!1504)) key!932)))

(declare-fun lt!121196 () Unit!7391)

(declare-fun choose!1123 (array!11965 array!11963 (_ BitVec 32) (_ BitVec 32) V!8105 V!8105 (_ BitVec 64) (_ BitVec 32) Int) Unit!7391)

(assert (=> d!59873 (= lt!121196 (choose!1123 (_keys!6565 thiss!1504) (_values!4446 thiss!1504) (mask!10525 thiss!1504) (extraKeys!4200 thiss!1504) (zeroValue!4304 thiss!1504) (minValue!4304 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4463 thiss!1504)))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!59873 (validMask!0 (mask!10525 thiss!1504))))

(assert (=> d!59873 (= (lemmaArrayContainsKeyThenInListMap!160 (_keys!6565 thiss!1504) (_values!4446 thiss!1504) (mask!10525 thiss!1504) (extraKeys!4200 thiss!1504) (zeroValue!4304 thiss!1504) (minValue!4304 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4463 thiss!1504)) lt!121196)))

(declare-fun bs!8853 () Bool)

(assert (= bs!8853 d!59873))

(assert (=> bs!8853 m!260455))

(assert (=> bs!8853 m!260455))

(assert (=> bs!8853 m!260457))

(declare-fun m!260527 () Bool)

(assert (=> bs!8853 m!260527))

(declare-fun m!260529 () Bool)

(assert (=> bs!8853 m!260529))

(assert (=> b!240947 d!59873))

(declare-fun d!59875 () Bool)

(declare-fun res!118204 () Bool)

(declare-fun e!156473 () Bool)

(assert (=> d!59875 (=> res!118204 e!156473)))

(assert (=> d!59875 (= res!118204 (= (select (arr!5684 (_keys!6565 thiss!1504)) #b00000000000000000000000000000000) key!932))))

(assert (=> d!59875 (= (arrayContainsKey!0 (_keys!6565 thiss!1504) key!932 #b00000000000000000000000000000000) e!156473)))

(declare-fun b!241090 () Bool)

(declare-fun e!156474 () Bool)

(assert (=> b!241090 (= e!156473 e!156474)))

(declare-fun res!118205 () Bool)

(assert (=> b!241090 (=> (not res!118205) (not e!156474))))

(assert (=> b!241090 (= res!118205 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6025 (_keys!6565 thiss!1504))))))

(declare-fun b!241091 () Bool)

(assert (=> b!241091 (= e!156474 (arrayContainsKey!0 (_keys!6565 thiss!1504) key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!59875 (not res!118204)) b!241090))

(assert (= (and b!241090 res!118205) b!241091))

(declare-fun m!260531 () Bool)

(assert (=> d!59875 m!260531))

(declare-fun m!260533 () Bool)

(assert (=> b!241091 m!260533))

(assert (=> b!240952 d!59875))

(declare-fun b!241104 () Bool)

(declare-fun e!156482 () SeekEntryResult!1020)

(assert (=> b!241104 (= e!156482 Undefined!1020)))

(declare-fun b!241105 () Bool)

(declare-fun e!156481 () SeekEntryResult!1020)

(declare-fun lt!121205 () SeekEntryResult!1020)

(assert (=> b!241105 (= e!156481 (Found!1020 (index!6252 lt!121205)))))

(declare-fun b!241106 () Bool)

(declare-fun e!156483 () SeekEntryResult!1020)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!11965 (_ BitVec 32)) SeekEntryResult!1020)

(assert (=> b!241106 (= e!156483 (seekKeyOrZeroReturnVacant!0 (x!24156 lt!121205) (index!6252 lt!121205) (index!6252 lt!121205) key!932 (_keys!6565 thiss!1504) (mask!10525 thiss!1504)))))

(declare-fun b!241107 () Bool)

(declare-fun c!40166 () Bool)

(declare-fun lt!121203 () (_ BitVec 64))

(assert (=> b!241107 (= c!40166 (= lt!121203 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!241107 (= e!156481 e!156483)))

(declare-fun d!59877 () Bool)

(declare-fun lt!121204 () SeekEntryResult!1020)

(assert (=> d!59877 (and (or ((_ is Undefined!1020) lt!121204) (not ((_ is Found!1020) lt!121204)) (and (bvsge (index!6251 lt!121204) #b00000000000000000000000000000000) (bvslt (index!6251 lt!121204) (size!6025 (_keys!6565 thiss!1504))))) (or ((_ is Undefined!1020) lt!121204) ((_ is Found!1020) lt!121204) (not ((_ is MissingZero!1020) lt!121204)) (and (bvsge (index!6250 lt!121204) #b00000000000000000000000000000000) (bvslt (index!6250 lt!121204) (size!6025 (_keys!6565 thiss!1504))))) (or ((_ is Undefined!1020) lt!121204) ((_ is Found!1020) lt!121204) ((_ is MissingZero!1020) lt!121204) (not ((_ is MissingVacant!1020) lt!121204)) (and (bvsge (index!6253 lt!121204) #b00000000000000000000000000000000) (bvslt (index!6253 lt!121204) (size!6025 (_keys!6565 thiss!1504))))) (or ((_ is Undefined!1020) lt!121204) (ite ((_ is Found!1020) lt!121204) (= (select (arr!5684 (_keys!6565 thiss!1504)) (index!6251 lt!121204)) key!932) (ite ((_ is MissingZero!1020) lt!121204) (= (select (arr!5684 (_keys!6565 thiss!1504)) (index!6250 lt!121204)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1020) lt!121204) (= (select (arr!5684 (_keys!6565 thiss!1504)) (index!6253 lt!121204)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!59877 (= lt!121204 e!156482)))

(declare-fun c!40167 () Bool)

(assert (=> d!59877 (= c!40167 (and ((_ is Intermediate!1020) lt!121205) (undefined!1832 lt!121205)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!11965 (_ BitVec 32)) SeekEntryResult!1020)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!59877 (= lt!121205 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!10525 thiss!1504)) key!932 (_keys!6565 thiss!1504) (mask!10525 thiss!1504)))))

(assert (=> d!59877 (validMask!0 (mask!10525 thiss!1504))))

(assert (=> d!59877 (= (seekEntryOrOpen!0 key!932 (_keys!6565 thiss!1504) (mask!10525 thiss!1504)) lt!121204)))

(declare-fun b!241108 () Bool)

(assert (=> b!241108 (= e!156482 e!156481)))

(assert (=> b!241108 (= lt!121203 (select (arr!5684 (_keys!6565 thiss!1504)) (index!6252 lt!121205)))))

(declare-fun c!40165 () Bool)

(assert (=> b!241108 (= c!40165 (= lt!121203 key!932))))

(declare-fun b!241109 () Bool)

(assert (=> b!241109 (= e!156483 (MissingZero!1020 (index!6252 lt!121205)))))

(assert (= (and d!59877 c!40167) b!241104))

(assert (= (and d!59877 (not c!40167)) b!241108))

(assert (= (and b!241108 c!40165) b!241105))

(assert (= (and b!241108 (not c!40165)) b!241107))

(assert (= (and b!241107 c!40166) b!241109))

(assert (= (and b!241107 (not c!40166)) b!241106))

(declare-fun m!260535 () Bool)

(assert (=> b!241106 m!260535))

(declare-fun m!260537 () Bool)

(assert (=> d!59877 m!260537))

(declare-fun m!260539 () Bool)

(assert (=> d!59877 m!260539))

(declare-fun m!260541 () Bool)

(assert (=> d!59877 m!260541))

(declare-fun m!260543 () Bool)

(assert (=> d!59877 m!260543))

(declare-fun m!260545 () Bool)

(assert (=> d!59877 m!260545))

(assert (=> d!59877 m!260529))

(assert (=> d!59877 m!260543))

(declare-fun m!260547 () Bool)

(assert (=> b!241108 m!260547))

(assert (=> b!240963 d!59877))

(declare-fun d!59879 () Bool)

(assert (=> d!59879 (= (inRange!0 index!297 (mask!10525 thiss!1504)) (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (bvadd (mask!10525 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> b!240958 d!59879))

(declare-fun d!59881 () Bool)

(declare-fun e!156488 () Bool)

(assert (=> d!59881 e!156488))

(declare-fun res!118208 () Bool)

(assert (=> d!59881 (=> res!118208 e!156488)))

(declare-fun lt!121215 () Bool)

(assert (=> d!59881 (= res!118208 (not lt!121215))))

(declare-fun lt!121216 () Bool)

(assert (=> d!59881 (= lt!121215 lt!121216)))

(declare-fun lt!121217 () Unit!7391)

(declare-fun e!156489 () Unit!7391)

(assert (=> d!59881 (= lt!121217 e!156489)))

(declare-fun c!40170 () Bool)

(assert (=> d!59881 (= c!40170 lt!121216)))

(declare-fun containsKey!271 (List!3541 (_ BitVec 64)) Bool)

(assert (=> d!59881 (= lt!121216 (containsKey!271 (toList!1806 (getCurrentListMap!1338 (_keys!6565 thiss!1504) (_values!4446 thiss!1504) (mask!10525 thiss!1504) (extraKeys!4200 thiss!1504) (zeroValue!4304 thiss!1504) (minValue!4304 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4463 thiss!1504))) key!932))))

(assert (=> d!59881 (= (contains!1708 (getCurrentListMap!1338 (_keys!6565 thiss!1504) (_values!4446 thiss!1504) (mask!10525 thiss!1504) (extraKeys!4200 thiss!1504) (zeroValue!4304 thiss!1504) (minValue!4304 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4463 thiss!1504)) key!932) lt!121215)))

(declare-fun b!241116 () Bool)

(declare-fun lt!121214 () Unit!7391)

(assert (=> b!241116 (= e!156489 lt!121214)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!219 (List!3541 (_ BitVec 64)) Unit!7391)

(assert (=> b!241116 (= lt!121214 (lemmaContainsKeyImpliesGetValueByKeyDefined!219 (toList!1806 (getCurrentListMap!1338 (_keys!6565 thiss!1504) (_values!4446 thiss!1504) (mask!10525 thiss!1504) (extraKeys!4200 thiss!1504) (zeroValue!4304 thiss!1504) (minValue!4304 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4463 thiss!1504))) key!932))))

(declare-datatypes ((Option!286 0))(
  ( (Some!285 (v!5258 V!8105)) (None!284) )
))
(declare-fun isDefined!220 (Option!286) Bool)

(declare-fun getValueByKey!280 (List!3541 (_ BitVec 64)) Option!286)

(assert (=> b!241116 (isDefined!220 (getValueByKey!280 (toList!1806 (getCurrentListMap!1338 (_keys!6565 thiss!1504) (_values!4446 thiss!1504) (mask!10525 thiss!1504) (extraKeys!4200 thiss!1504) (zeroValue!4304 thiss!1504) (minValue!4304 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4463 thiss!1504))) key!932))))

(declare-fun b!241117 () Bool)

(declare-fun Unit!7404 () Unit!7391)

(assert (=> b!241117 (= e!156489 Unit!7404)))

(declare-fun b!241118 () Bool)

(assert (=> b!241118 (= e!156488 (isDefined!220 (getValueByKey!280 (toList!1806 (getCurrentListMap!1338 (_keys!6565 thiss!1504) (_values!4446 thiss!1504) (mask!10525 thiss!1504) (extraKeys!4200 thiss!1504) (zeroValue!4304 thiss!1504) (minValue!4304 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4463 thiss!1504))) key!932)))))

(assert (= (and d!59881 c!40170) b!241116))

(assert (= (and d!59881 (not c!40170)) b!241117))

(assert (= (and d!59881 (not res!118208)) b!241118))

(declare-fun m!260549 () Bool)

(assert (=> d!59881 m!260549))

(declare-fun m!260551 () Bool)

(assert (=> b!241116 m!260551))

(declare-fun m!260553 () Bool)

(assert (=> b!241116 m!260553))

(assert (=> b!241116 m!260553))

(declare-fun m!260555 () Bool)

(assert (=> b!241116 m!260555))

(assert (=> b!241118 m!260553))

(assert (=> b!241118 m!260553))

(assert (=> b!241118 m!260555))

(assert (=> b!240958 d!59881))

(declare-fun b!241161 () Bool)

(declare-fun e!156519 () Bool)

(declare-fun lt!121281 () ListLongMap!3581)

(declare-fun apply!221 (ListLongMap!3581 (_ BitVec 64)) V!8105)

(declare-fun get!2924 (ValueCell!2828 V!8105) V!8105)

(declare-fun dynLambda!564 (Int (_ BitVec 64)) V!8105)

(assert (=> b!241161 (= e!156519 (= (apply!221 lt!121281 (select (arr!5684 (_keys!6565 thiss!1504)) #b00000000000000000000000000000000)) (get!2924 (select (arr!5683 (_values!4446 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!564 (defaultEntry!4463 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!241161 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6024 (_values!4446 thiss!1504))))))

(assert (=> b!241161 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6025 (_keys!6565 thiss!1504))))))

(declare-fun b!241162 () Bool)

(declare-fun e!156522 () Unit!7391)

(declare-fun Unit!7405 () Unit!7391)

(assert (=> b!241162 (= e!156522 Unit!7405)))

(declare-fun b!241163 () Bool)

(declare-fun res!118229 () Bool)

(declare-fun e!156526 () Bool)

(assert (=> b!241163 (=> (not res!118229) (not e!156526))))

(declare-fun e!156517 () Bool)

(assert (=> b!241163 (= res!118229 e!156517)))

(declare-fun res!118233 () Bool)

(assert (=> b!241163 (=> res!118233 e!156517)))

(declare-fun e!156521 () Bool)

(assert (=> b!241163 (= res!118233 (not e!156521))))

(declare-fun res!118230 () Bool)

(assert (=> b!241163 (=> (not res!118230) (not e!156521))))

(assert (=> b!241163 (= res!118230 (bvslt #b00000000000000000000000000000000 (size!6025 (_keys!6565 thiss!1504))))))

(declare-fun b!241164 () Bool)

(assert (=> b!241164 (= e!156517 e!156519)))

(declare-fun res!118232 () Bool)

(assert (=> b!241164 (=> (not res!118232) (not e!156519))))

(assert (=> b!241164 (= res!118232 (contains!1708 lt!121281 (select (arr!5684 (_keys!6565 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!241164 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6025 (_keys!6565 thiss!1504))))))

(declare-fun b!241165 () Bool)

(declare-fun e!156525 () ListLongMap!3581)

(declare-fun call!22424 () ListLongMap!3581)

(declare-fun +!648 (ListLongMap!3581 tuple2!4666) ListLongMap!3581)

(assert (=> b!241165 (= e!156525 (+!648 call!22424 (tuple2!4667 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4304 thiss!1504))))))

(declare-fun b!241166 () Bool)

(declare-fun e!156527 () Bool)

(assert (=> b!241166 (= e!156527 (= (apply!221 lt!121281 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4304 thiss!1504)))))

(declare-fun b!241167 () Bool)

(declare-fun c!40184 () Bool)

(assert (=> b!241167 (= c!40184 (and (not (= (bvand (extraKeys!4200 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4200 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!156516 () ListLongMap!3581)

(declare-fun e!156528 () ListLongMap!3581)

(assert (=> b!241167 (= e!156516 e!156528)))

(declare-fun b!241168 () Bool)

(declare-fun e!156518 () Bool)

(assert (=> b!241168 (= e!156518 (= (apply!221 lt!121281 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4304 thiss!1504)))))

(declare-fun b!241169 () Bool)

(declare-fun call!22420 () ListLongMap!3581)

(assert (=> b!241169 (= e!156528 call!22420)))

(declare-fun b!241170 () Bool)

(declare-fun res!118234 () Bool)

(assert (=> b!241170 (=> (not res!118234) (not e!156526))))

(declare-fun e!156520 () Bool)

(assert (=> b!241170 (= res!118234 e!156520)))

(declare-fun c!40188 () Bool)

(assert (=> b!241170 (= c!40188 (not (= (bvand (extraKeys!4200 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!241171 () Bool)

(declare-fun lt!121270 () Unit!7391)

(assert (=> b!241171 (= e!156522 lt!121270)))

(declare-fun lt!121280 () ListLongMap!3581)

(declare-fun getCurrentListMapNoExtraKeys!537 (array!11965 array!11963 (_ BitVec 32) (_ BitVec 32) V!8105 V!8105 (_ BitVec 32) Int) ListLongMap!3581)

(assert (=> b!241171 (= lt!121280 (getCurrentListMapNoExtraKeys!537 (_keys!6565 thiss!1504) (_values!4446 thiss!1504) (mask!10525 thiss!1504) (extraKeys!4200 thiss!1504) (zeroValue!4304 thiss!1504) (minValue!4304 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4463 thiss!1504)))))

(declare-fun lt!121263 () (_ BitVec 64))

(assert (=> b!241171 (= lt!121263 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!121262 () (_ BitVec 64))

(assert (=> b!241171 (= lt!121262 (select (arr!5684 (_keys!6565 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!121277 () Unit!7391)

(declare-fun addStillContains!197 (ListLongMap!3581 (_ BitVec 64) V!8105 (_ BitVec 64)) Unit!7391)

(assert (=> b!241171 (= lt!121277 (addStillContains!197 lt!121280 lt!121263 (zeroValue!4304 thiss!1504) lt!121262))))

(assert (=> b!241171 (contains!1708 (+!648 lt!121280 (tuple2!4667 lt!121263 (zeroValue!4304 thiss!1504))) lt!121262)))

(declare-fun lt!121267 () Unit!7391)

(assert (=> b!241171 (= lt!121267 lt!121277)))

(declare-fun lt!121274 () ListLongMap!3581)

(assert (=> b!241171 (= lt!121274 (getCurrentListMapNoExtraKeys!537 (_keys!6565 thiss!1504) (_values!4446 thiss!1504) (mask!10525 thiss!1504) (extraKeys!4200 thiss!1504) (zeroValue!4304 thiss!1504) (minValue!4304 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4463 thiss!1504)))))

(declare-fun lt!121264 () (_ BitVec 64))

(assert (=> b!241171 (= lt!121264 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!121271 () (_ BitVec 64))

(assert (=> b!241171 (= lt!121271 (select (arr!5684 (_keys!6565 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!121268 () Unit!7391)

(declare-fun addApplyDifferent!197 (ListLongMap!3581 (_ BitVec 64) V!8105 (_ BitVec 64)) Unit!7391)

(assert (=> b!241171 (= lt!121268 (addApplyDifferent!197 lt!121274 lt!121264 (minValue!4304 thiss!1504) lt!121271))))

(assert (=> b!241171 (= (apply!221 (+!648 lt!121274 (tuple2!4667 lt!121264 (minValue!4304 thiss!1504))) lt!121271) (apply!221 lt!121274 lt!121271))))

(declare-fun lt!121272 () Unit!7391)

(assert (=> b!241171 (= lt!121272 lt!121268)))

(declare-fun lt!121275 () ListLongMap!3581)

(assert (=> b!241171 (= lt!121275 (getCurrentListMapNoExtraKeys!537 (_keys!6565 thiss!1504) (_values!4446 thiss!1504) (mask!10525 thiss!1504) (extraKeys!4200 thiss!1504) (zeroValue!4304 thiss!1504) (minValue!4304 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4463 thiss!1504)))))

(declare-fun lt!121266 () (_ BitVec 64))

(assert (=> b!241171 (= lt!121266 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!121273 () (_ BitVec 64))

(assert (=> b!241171 (= lt!121273 (select (arr!5684 (_keys!6565 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!121269 () Unit!7391)

(assert (=> b!241171 (= lt!121269 (addApplyDifferent!197 lt!121275 lt!121266 (zeroValue!4304 thiss!1504) lt!121273))))

(assert (=> b!241171 (= (apply!221 (+!648 lt!121275 (tuple2!4667 lt!121266 (zeroValue!4304 thiss!1504))) lt!121273) (apply!221 lt!121275 lt!121273))))

(declare-fun lt!121276 () Unit!7391)

(assert (=> b!241171 (= lt!121276 lt!121269)))

(declare-fun lt!121279 () ListLongMap!3581)

(assert (=> b!241171 (= lt!121279 (getCurrentListMapNoExtraKeys!537 (_keys!6565 thiss!1504) (_values!4446 thiss!1504) (mask!10525 thiss!1504) (extraKeys!4200 thiss!1504) (zeroValue!4304 thiss!1504) (minValue!4304 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4463 thiss!1504)))))

(declare-fun lt!121278 () (_ BitVec 64))

(assert (=> b!241171 (= lt!121278 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!121282 () (_ BitVec 64))

(assert (=> b!241171 (= lt!121282 (select (arr!5684 (_keys!6565 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!241171 (= lt!121270 (addApplyDifferent!197 lt!121279 lt!121278 (minValue!4304 thiss!1504) lt!121282))))

(assert (=> b!241171 (= (apply!221 (+!648 lt!121279 (tuple2!4667 lt!121278 (minValue!4304 thiss!1504))) lt!121282) (apply!221 lt!121279 lt!121282))))

(declare-fun bm!22416 () Bool)

(declare-fun call!22423 () Bool)

(assert (=> bm!22416 (= call!22423 (contains!1708 lt!121281 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!241172 () Bool)

(declare-fun e!156524 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!241172 (= e!156524 (validKeyInArray!0 (select (arr!5684 (_keys!6565 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun bm!22417 () Bool)

(declare-fun call!22425 () ListLongMap!3581)

(assert (=> bm!22417 (= call!22420 call!22425)))

(declare-fun b!241173 () Bool)

(declare-fun e!156523 () Bool)

(assert (=> b!241173 (= e!156523 (not call!22423))))

(declare-fun bm!22418 () Bool)

(declare-fun call!22422 () ListLongMap!3581)

(assert (=> bm!22418 (= call!22425 call!22422)))

(declare-fun b!241174 () Bool)

(assert (=> b!241174 (= e!156520 e!156527)))

(declare-fun res!118231 () Bool)

(declare-fun call!22421 () Bool)

(assert (=> b!241174 (= res!118231 call!22421)))

(assert (=> b!241174 (=> (not res!118231) (not e!156527))))

(declare-fun b!241175 () Bool)

(assert (=> b!241175 (= e!156526 e!156523)))

(declare-fun c!40183 () Bool)

(assert (=> b!241175 (= c!40183 (not (= (bvand (extraKeys!4200 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun c!40185 () Bool)

(declare-fun bm!22419 () Bool)

(declare-fun c!40187 () Bool)

(assert (=> bm!22419 (= call!22424 (+!648 (ite c!40185 call!22422 (ite c!40187 call!22425 call!22420)) (ite (or c!40185 c!40187) (tuple2!4667 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4304 thiss!1504)) (tuple2!4667 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4304 thiss!1504)))))))

(declare-fun b!241176 () Bool)

(declare-fun call!22419 () ListLongMap!3581)

(assert (=> b!241176 (= e!156528 call!22419)))

(declare-fun bm!22420 () Bool)

(assert (=> bm!22420 (= call!22421 (contains!1708 lt!121281 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!241177 () Bool)

(assert (=> b!241177 (= e!156523 e!156518)))

(declare-fun res!118227 () Bool)

(assert (=> b!241177 (= res!118227 call!22423)))

(assert (=> b!241177 (=> (not res!118227) (not e!156518))))

(declare-fun b!241178 () Bool)

(assert (=> b!241178 (= e!156521 (validKeyInArray!0 (select (arr!5684 (_keys!6565 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!241179 () Bool)

(assert (=> b!241179 (= e!156525 e!156516)))

(assert (=> b!241179 (= c!40187 (and (not (= (bvand (extraKeys!4200 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4200 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun d!59883 () Bool)

(assert (=> d!59883 e!156526))

(declare-fun res!118235 () Bool)

(assert (=> d!59883 (=> (not res!118235) (not e!156526))))

(assert (=> d!59883 (= res!118235 (or (bvsge #b00000000000000000000000000000000 (size!6025 (_keys!6565 thiss!1504))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6025 (_keys!6565 thiss!1504))))))))

(declare-fun lt!121265 () ListLongMap!3581)

(assert (=> d!59883 (= lt!121281 lt!121265)))

(declare-fun lt!121283 () Unit!7391)

(assert (=> d!59883 (= lt!121283 e!156522)))

(declare-fun c!40186 () Bool)

(assert (=> d!59883 (= c!40186 e!156524)))

(declare-fun res!118228 () Bool)

(assert (=> d!59883 (=> (not res!118228) (not e!156524))))

(assert (=> d!59883 (= res!118228 (bvslt #b00000000000000000000000000000000 (size!6025 (_keys!6565 thiss!1504))))))

(assert (=> d!59883 (= lt!121265 e!156525)))

(assert (=> d!59883 (= c!40185 (and (not (= (bvand (extraKeys!4200 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4200 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!59883 (validMask!0 (mask!10525 thiss!1504))))

(assert (=> d!59883 (= (getCurrentListMap!1338 (_keys!6565 thiss!1504) (_values!4446 thiss!1504) (mask!10525 thiss!1504) (extraKeys!4200 thiss!1504) (zeroValue!4304 thiss!1504) (minValue!4304 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4463 thiss!1504)) lt!121281)))

(declare-fun bm!22421 () Bool)

(assert (=> bm!22421 (= call!22422 (getCurrentListMapNoExtraKeys!537 (_keys!6565 thiss!1504) (_values!4446 thiss!1504) (mask!10525 thiss!1504) (extraKeys!4200 thiss!1504) (zeroValue!4304 thiss!1504) (minValue!4304 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4463 thiss!1504)))))

(declare-fun bm!22422 () Bool)

(assert (=> bm!22422 (= call!22419 call!22424)))

(declare-fun b!241180 () Bool)

(assert (=> b!241180 (= e!156516 call!22419)))

(declare-fun b!241181 () Bool)

(assert (=> b!241181 (= e!156520 (not call!22421))))

(assert (= (and d!59883 c!40185) b!241165))

(assert (= (and d!59883 (not c!40185)) b!241179))

(assert (= (and b!241179 c!40187) b!241180))

(assert (= (and b!241179 (not c!40187)) b!241167))

(assert (= (and b!241167 c!40184) b!241176))

(assert (= (and b!241167 (not c!40184)) b!241169))

(assert (= (or b!241176 b!241169) bm!22417))

(assert (= (or b!241180 bm!22417) bm!22418))

(assert (= (or b!241180 b!241176) bm!22422))

(assert (= (or b!241165 bm!22418) bm!22421))

(assert (= (or b!241165 bm!22422) bm!22419))

(assert (= (and d!59883 res!118228) b!241172))

(assert (= (and d!59883 c!40186) b!241171))

(assert (= (and d!59883 (not c!40186)) b!241162))

(assert (= (and d!59883 res!118235) b!241163))

(assert (= (and b!241163 res!118230) b!241178))

(assert (= (and b!241163 (not res!118233)) b!241164))

(assert (= (and b!241164 res!118232) b!241161))

(assert (= (and b!241163 res!118229) b!241170))

(assert (= (and b!241170 c!40188) b!241174))

(assert (= (and b!241170 (not c!40188)) b!241181))

(assert (= (and b!241174 res!118231) b!241166))

(assert (= (or b!241174 b!241181) bm!22420))

(assert (= (and b!241170 res!118234) b!241175))

(assert (= (and b!241175 c!40183) b!241177))

(assert (= (and b!241175 (not c!40183)) b!241173))

(assert (= (and b!241177 res!118227) b!241168))

(assert (= (or b!241177 b!241173) bm!22416))

(declare-fun b_lambda!8001 () Bool)

(assert (=> (not b_lambda!8001) (not b!241161)))

(declare-fun t!8532 () Bool)

(declare-fun tb!2947 () Bool)

(assert (=> (and b!240954 (= (defaultEntry!4463 thiss!1504) (defaultEntry!4463 thiss!1504)) t!8532) tb!2947))

(declare-fun result!5179 () Bool)

(assert (=> tb!2947 (= result!5179 tp_is_empty!6343)))

(assert (=> b!241161 t!8532))

(declare-fun b_and!13467 () Bool)

(assert (= b_and!13461 (and (=> t!8532 result!5179) b_and!13467)))

(assert (=> b!241178 m!260531))

(assert (=> b!241178 m!260531))

(declare-fun m!260557 () Bool)

(assert (=> b!241178 m!260557))

(assert (=> b!241164 m!260531))

(assert (=> b!241164 m!260531))

(declare-fun m!260559 () Bool)

(assert (=> b!241164 m!260559))

(assert (=> d!59883 m!260529))

(declare-fun m!260561 () Bool)

(assert (=> bm!22419 m!260561))

(declare-fun m!260563 () Bool)

(assert (=> b!241166 m!260563))

(declare-fun m!260565 () Bool)

(assert (=> bm!22416 m!260565))

(declare-fun m!260567 () Bool)

(assert (=> b!241161 m!260567))

(assert (=> b!241161 m!260567))

(declare-fun m!260569 () Bool)

(assert (=> b!241161 m!260569))

(declare-fun m!260571 () Bool)

(assert (=> b!241161 m!260571))

(assert (=> b!241161 m!260569))

(assert (=> b!241161 m!260531))

(declare-fun m!260573 () Bool)

(assert (=> b!241161 m!260573))

(assert (=> b!241161 m!260531))

(declare-fun m!260575 () Bool)

(assert (=> bm!22421 m!260575))

(assert (=> b!241172 m!260531))

(assert (=> b!241172 m!260531))

(assert (=> b!241172 m!260557))

(declare-fun m!260577 () Bool)

(assert (=> b!241168 m!260577))

(declare-fun m!260579 () Bool)

(assert (=> b!241171 m!260579))

(assert (=> b!241171 m!260575))

(declare-fun m!260581 () Bool)

(assert (=> b!241171 m!260581))

(declare-fun m!260583 () Bool)

(assert (=> b!241171 m!260583))

(declare-fun m!260585 () Bool)

(assert (=> b!241171 m!260585))

(declare-fun m!260587 () Bool)

(assert (=> b!241171 m!260587))

(declare-fun m!260589 () Bool)

(assert (=> b!241171 m!260589))

(assert (=> b!241171 m!260531))

(assert (=> b!241171 m!260581))

(assert (=> b!241171 m!260587))

(declare-fun m!260591 () Bool)

(assert (=> b!241171 m!260591))

(declare-fun m!260593 () Bool)

(assert (=> b!241171 m!260593))

(declare-fun m!260595 () Bool)

(assert (=> b!241171 m!260595))

(declare-fun m!260597 () Bool)

(assert (=> b!241171 m!260597))

(declare-fun m!260599 () Bool)

(assert (=> b!241171 m!260599))

(assert (=> b!241171 m!260597))

(declare-fun m!260601 () Bool)

(assert (=> b!241171 m!260601))

(declare-fun m!260603 () Bool)

(assert (=> b!241171 m!260603))

(assert (=> b!241171 m!260601))

(declare-fun m!260605 () Bool)

(assert (=> b!241171 m!260605))

(declare-fun m!260607 () Bool)

(assert (=> b!241171 m!260607))

(declare-fun m!260609 () Bool)

(assert (=> b!241165 m!260609))

(declare-fun m!260611 () Bool)

(assert (=> bm!22420 m!260611))

(assert (=> b!240958 d!59883))

(declare-fun d!59885 () Bool)

(declare-fun res!118242 () Bool)

(declare-fun e!156531 () Bool)

(assert (=> d!59885 (=> (not res!118242) (not e!156531))))

(declare-fun simpleValid!244 (LongMapFixedSize!3556) Bool)

(assert (=> d!59885 (= res!118242 (simpleValid!244 thiss!1504))))

(assert (=> d!59885 (= (valid!1410 thiss!1504) e!156531)))

(declare-fun b!241190 () Bool)

(declare-fun res!118243 () Bool)

(assert (=> b!241190 (=> (not res!118243) (not e!156531))))

(declare-fun arrayCountValidKeys!0 (array!11965 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!241190 (= res!118243 (= (arrayCountValidKeys!0 (_keys!6565 thiss!1504) #b00000000000000000000000000000000 (size!6025 (_keys!6565 thiss!1504))) (_size!1827 thiss!1504)))))

(declare-fun b!241191 () Bool)

(declare-fun res!118244 () Bool)

(assert (=> b!241191 (=> (not res!118244) (not e!156531))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11965 (_ BitVec 32)) Bool)

(assert (=> b!241191 (= res!118244 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6565 thiss!1504) (mask!10525 thiss!1504)))))

(declare-fun b!241192 () Bool)

(declare-datatypes ((List!3544 0))(
  ( (Nil!3541) (Cons!3540 (h!4196 (_ BitVec 64)) (t!8533 List!3544)) )
))
(declare-fun arrayNoDuplicates!0 (array!11965 (_ BitVec 32) List!3544) Bool)

(assert (=> b!241192 (= e!156531 (arrayNoDuplicates!0 (_keys!6565 thiss!1504) #b00000000000000000000000000000000 Nil!3541))))

(assert (= (and d!59885 res!118242) b!241190))

(assert (= (and b!241190 res!118243) b!241191))

(assert (= (and b!241191 res!118244) b!241192))

(declare-fun m!260613 () Bool)

(assert (=> d!59885 m!260613))

(declare-fun m!260615 () Bool)

(assert (=> b!241190 m!260615))

(declare-fun m!260617 () Bool)

(assert (=> b!241191 m!260617))

(declare-fun m!260619 () Bool)

(assert (=> b!241192 m!260619))

(assert (=> start!22982 d!59885))

(declare-fun d!59887 () Bool)

(assert (=> d!59887 (= (array_inv!3733 (_keys!6565 thiss!1504)) (bvsge (size!6025 (_keys!6565 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!240954 d!59887))

(declare-fun d!59889 () Bool)

(assert (=> d!59889 (= (array_inv!3734 (_values!4446 thiss!1504)) (bvsge (size!6024 (_values!4446 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!240954 d!59889))

(declare-fun d!59891 () Bool)

(declare-fun e!156534 () Bool)

(assert (=> d!59891 e!156534))

(declare-fun res!118250 () Bool)

(assert (=> d!59891 (=> (not res!118250) (not e!156534))))

(declare-fun lt!121289 () SeekEntryResult!1020)

(assert (=> d!59891 (= res!118250 ((_ is Found!1020) lt!121289))))

(assert (=> d!59891 (= lt!121289 (seekEntryOrOpen!0 key!932 (_keys!6565 thiss!1504) (mask!10525 thiss!1504)))))

(declare-fun lt!121288 () Unit!7391)

(declare-fun choose!1124 (array!11965 array!11963 (_ BitVec 32) (_ BitVec 32) V!8105 V!8105 (_ BitVec 64) Int) Unit!7391)

(assert (=> d!59891 (= lt!121288 (choose!1124 (_keys!6565 thiss!1504) (_values!4446 thiss!1504) (mask!10525 thiss!1504) (extraKeys!4200 thiss!1504) (zeroValue!4304 thiss!1504) (minValue!4304 thiss!1504) key!932 (defaultEntry!4463 thiss!1504)))))

(assert (=> d!59891 (validMask!0 (mask!10525 thiss!1504))))

(assert (=> d!59891 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!347 (_keys!6565 thiss!1504) (_values!4446 thiss!1504) (mask!10525 thiss!1504) (extraKeys!4200 thiss!1504) (zeroValue!4304 thiss!1504) (minValue!4304 thiss!1504) key!932 (defaultEntry!4463 thiss!1504)) lt!121288)))

(declare-fun b!241197 () Bool)

(declare-fun res!118249 () Bool)

(assert (=> b!241197 (=> (not res!118249) (not e!156534))))

(assert (=> b!241197 (= res!118249 (inRange!0 (index!6251 lt!121289) (mask!10525 thiss!1504)))))

(declare-fun b!241198 () Bool)

(assert (=> b!241198 (= e!156534 (= (select (arr!5684 (_keys!6565 thiss!1504)) (index!6251 lt!121289)) key!932))))

(assert (=> b!241198 (and (bvsge (index!6251 lt!121289) #b00000000000000000000000000000000) (bvslt (index!6251 lt!121289) (size!6025 (_keys!6565 thiss!1504))))))

(assert (= (and d!59891 res!118250) b!241197))

(assert (= (and b!241197 res!118249) b!241198))

(assert (=> d!59891 m!260443))

(declare-fun m!260621 () Bool)

(assert (=> d!59891 m!260621))

(assert (=> d!59891 m!260529))

(declare-fun m!260623 () Bool)

(assert (=> b!241197 m!260623))

(declare-fun m!260625 () Bool)

(assert (=> b!241198 m!260625))

(assert (=> b!240950 d!59891))

(declare-fun b!241215 () Bool)

(declare-fun res!118259 () Bool)

(declare-fun e!156546 () Bool)

(assert (=> b!241215 (=> (not res!118259) (not e!156546))))

(declare-fun lt!121294 () SeekEntryResult!1020)

(assert (=> b!241215 (= res!118259 (= (select (arr!5684 (_keys!6565 thiss!1504)) (index!6253 lt!121294)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!241215 (and (bvsge (index!6253 lt!121294) #b00000000000000000000000000000000) (bvslt (index!6253 lt!121294) (size!6025 (_keys!6565 thiss!1504))))))

(declare-fun d!59893 () Bool)

(declare-fun e!156544 () Bool)

(assert (=> d!59893 e!156544))

(declare-fun c!40193 () Bool)

(assert (=> d!59893 (= c!40193 ((_ is MissingZero!1020) lt!121294))))

(assert (=> d!59893 (= lt!121294 (seekEntryOrOpen!0 key!932 (_keys!6565 thiss!1504) (mask!10525 thiss!1504)))))

(declare-fun lt!121295 () Unit!7391)

(declare-fun choose!1125 (array!11965 array!11963 (_ BitVec 32) (_ BitVec 32) V!8105 V!8105 (_ BitVec 64) Int) Unit!7391)

(assert (=> d!59893 (= lt!121295 (choose!1125 (_keys!6565 thiss!1504) (_values!4446 thiss!1504) (mask!10525 thiss!1504) (extraKeys!4200 thiss!1504) (zeroValue!4304 thiss!1504) (minValue!4304 thiss!1504) key!932 (defaultEntry!4463 thiss!1504)))))

(assert (=> d!59893 (validMask!0 (mask!10525 thiss!1504))))

(assert (=> d!59893 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!339 (_keys!6565 thiss!1504) (_values!4446 thiss!1504) (mask!10525 thiss!1504) (extraKeys!4200 thiss!1504) (zeroValue!4304 thiss!1504) (minValue!4304 thiss!1504) key!932 (defaultEntry!4463 thiss!1504)) lt!121295)))

(declare-fun b!241216 () Bool)

(declare-fun e!156545 () Bool)

(declare-fun call!22431 () Bool)

(assert (=> b!241216 (= e!156545 (not call!22431))))

(declare-fun call!22430 () Bool)

(declare-fun bm!22427 () Bool)

(assert (=> bm!22427 (= call!22430 (inRange!0 (ite c!40193 (index!6250 lt!121294) (index!6253 lt!121294)) (mask!10525 thiss!1504)))))

(declare-fun b!241217 () Bool)

(declare-fun res!118261 () Bool)

(assert (=> b!241217 (=> (not res!118261) (not e!156546))))

(assert (=> b!241217 (= res!118261 call!22430)))

(declare-fun e!156543 () Bool)

(assert (=> b!241217 (= e!156543 e!156546)))

(declare-fun b!241218 () Bool)

(assert (=> b!241218 (and (bvsge (index!6250 lt!121294) #b00000000000000000000000000000000) (bvslt (index!6250 lt!121294) (size!6025 (_keys!6565 thiss!1504))))))

(declare-fun res!118262 () Bool)

(assert (=> b!241218 (= res!118262 (= (select (arr!5684 (_keys!6565 thiss!1504)) (index!6250 lt!121294)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!241218 (=> (not res!118262) (not e!156545))))

(declare-fun b!241219 () Bool)

(assert (=> b!241219 (= e!156543 ((_ is Undefined!1020) lt!121294))))

(declare-fun b!241220 () Bool)

(assert (=> b!241220 (= e!156544 e!156543)))

(declare-fun c!40194 () Bool)

(assert (=> b!241220 (= c!40194 ((_ is MissingVacant!1020) lt!121294))))

(declare-fun b!241221 () Bool)

(assert (=> b!241221 (= e!156546 (not call!22431))))

(declare-fun b!241222 () Bool)

(assert (=> b!241222 (= e!156544 e!156545)))

(declare-fun res!118260 () Bool)

(assert (=> b!241222 (= res!118260 call!22430)))

(assert (=> b!241222 (=> (not res!118260) (not e!156545))))

(declare-fun bm!22428 () Bool)

(assert (=> bm!22428 (= call!22431 (arrayContainsKey!0 (_keys!6565 thiss!1504) key!932 #b00000000000000000000000000000000))))

(assert (= (and d!59893 c!40193) b!241222))

(assert (= (and d!59893 (not c!40193)) b!241220))

(assert (= (and b!241222 res!118260) b!241218))

(assert (= (and b!241218 res!118262) b!241216))

(assert (= (and b!241220 c!40194) b!241217))

(assert (= (and b!241220 (not c!40194)) b!241219))

(assert (= (and b!241217 res!118261) b!241215))

(assert (= (and b!241215 res!118259) b!241221))

(assert (= (or b!241222 b!241217) bm!22427))

(assert (= (or b!241216 b!241221) bm!22428))

(declare-fun m!260627 () Bool)

(assert (=> b!241218 m!260627))

(declare-fun m!260629 () Bool)

(assert (=> bm!22427 m!260629))

(assert (=> bm!22428 m!260437))

(declare-fun m!260631 () Bool)

(assert (=> b!241215 m!260631))

(assert (=> d!59893 m!260443))

(declare-fun m!260633 () Bool)

(assert (=> d!59893 m!260633))

(assert (=> d!59893 m!260529))

(assert (=> b!240957 d!59893))

(assert (=> bm!22389 d!59875))

(declare-fun condMapEmpty!10755 () Bool)

(declare-fun mapDefault!10755 () ValueCell!2828)

(assert (=> mapNonEmpty!10746 (= condMapEmpty!10755 (= mapRest!10746 ((as const (Array (_ BitVec 32) ValueCell!2828)) mapDefault!10755)))))

(declare-fun e!156551 () Bool)

(declare-fun mapRes!10755 () Bool)

(assert (=> mapNonEmpty!10746 (= tp!22646 (and e!156551 mapRes!10755))))

(declare-fun b!241230 () Bool)

(assert (=> b!241230 (= e!156551 tp_is_empty!6343)))

(declare-fun b!241229 () Bool)

(declare-fun e!156552 () Bool)

(assert (=> b!241229 (= e!156552 tp_is_empty!6343)))

(declare-fun mapNonEmpty!10755 () Bool)

(declare-fun tp!22662 () Bool)

(assert (=> mapNonEmpty!10755 (= mapRes!10755 (and tp!22662 e!156552))))

(declare-fun mapRest!10755 () (Array (_ BitVec 32) ValueCell!2828))

(declare-fun mapKey!10755 () (_ BitVec 32))

(declare-fun mapValue!10755 () ValueCell!2828)

(assert (=> mapNonEmpty!10755 (= mapRest!10746 (store mapRest!10755 mapKey!10755 mapValue!10755))))

(declare-fun mapIsEmpty!10755 () Bool)

(assert (=> mapIsEmpty!10755 mapRes!10755))

(assert (= (and mapNonEmpty!10746 condMapEmpty!10755) mapIsEmpty!10755))

(assert (= (and mapNonEmpty!10746 (not condMapEmpty!10755)) mapNonEmpty!10755))

(assert (= (and mapNonEmpty!10755 ((_ is ValueCellFull!2828) mapValue!10755)) b!241229))

(assert (= (and mapNonEmpty!10746 ((_ is ValueCellFull!2828) mapDefault!10755)) b!241230))

(declare-fun m!260635 () Bool)

(assert (=> mapNonEmpty!10755 m!260635))

(declare-fun b_lambda!8003 () Bool)

(assert (= b_lambda!8001 (or (and b!240954 b_free!6481) b_lambda!8003)))

(check-sat (not bm!22427) (not bm!22428) (not bm!22416) (not b!241178) (not b!241192) (not mapNonEmpty!10755) (not bm!22421) (not b_next!6481) (not bm!22420) (not b!241164) (not b!241168) (not b!241118) (not b_lambda!8003) (not b!241191) (not b!241116) (not d!59891) (not b!241197) b_and!13467 (not b!241106) (not d!59885) (not b!241161) (not d!59881) (not b!241091) tp_is_empty!6343 (not b!241166) (not b!241190) (not b!241172) (not d!59883) (not b!241165) (not d!59877) (not bm!22419) (not d!59873) (not d!59893) (not b!241171))
(check-sat b_and!13467 (not b_next!6481))
(get-model)

(declare-fun d!59895 () Bool)

(declare-fun get!2925 (Option!286) V!8105)

(assert (=> d!59895 (= (apply!221 lt!121281 #b1000000000000000000000000000000000000000000000000000000000000000) (get!2925 (getValueByKey!280 (toList!1806 lt!121281) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!8854 () Bool)

(assert (= bs!8854 d!59895))

(declare-fun m!260637 () Bool)

(assert (=> bs!8854 m!260637))

(assert (=> bs!8854 m!260637))

(declare-fun m!260639 () Bool)

(assert (=> bs!8854 m!260639))

(assert (=> b!241168 d!59895))

(declare-fun d!59897 () Bool)

(declare-fun isEmpty!526 (Option!286) Bool)

(assert (=> d!59897 (= (isDefined!220 (getValueByKey!280 (toList!1806 (getCurrentListMap!1338 (_keys!6565 thiss!1504) (_values!4446 thiss!1504) (mask!10525 thiss!1504) (extraKeys!4200 thiss!1504) (zeroValue!4304 thiss!1504) (minValue!4304 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4463 thiss!1504))) key!932)) (not (isEmpty!526 (getValueByKey!280 (toList!1806 (getCurrentListMap!1338 (_keys!6565 thiss!1504) (_values!4446 thiss!1504) (mask!10525 thiss!1504) (extraKeys!4200 thiss!1504) (zeroValue!4304 thiss!1504) (minValue!4304 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4463 thiss!1504))) key!932))))))

(declare-fun bs!8855 () Bool)

(assert (= bs!8855 d!59897))

(assert (=> bs!8855 m!260553))

(declare-fun m!260641 () Bool)

(assert (=> bs!8855 m!260641))

(assert (=> b!241118 d!59897))

(declare-fun d!59899 () Bool)

(declare-fun c!40199 () Bool)

(assert (=> d!59899 (= c!40199 (and ((_ is Cons!3537) (toList!1806 (getCurrentListMap!1338 (_keys!6565 thiss!1504) (_values!4446 thiss!1504) (mask!10525 thiss!1504) (extraKeys!4200 thiss!1504) (zeroValue!4304 thiss!1504) (minValue!4304 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4463 thiss!1504)))) (= (_1!2344 (h!4193 (toList!1806 (getCurrentListMap!1338 (_keys!6565 thiss!1504) (_values!4446 thiss!1504) (mask!10525 thiss!1504) (extraKeys!4200 thiss!1504) (zeroValue!4304 thiss!1504) (minValue!4304 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4463 thiss!1504))))) key!932)))))

(declare-fun e!156557 () Option!286)

(assert (=> d!59899 (= (getValueByKey!280 (toList!1806 (getCurrentListMap!1338 (_keys!6565 thiss!1504) (_values!4446 thiss!1504) (mask!10525 thiss!1504) (extraKeys!4200 thiss!1504) (zeroValue!4304 thiss!1504) (minValue!4304 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4463 thiss!1504))) key!932) e!156557)))

(declare-fun b!241242 () Bool)

(declare-fun e!156558 () Option!286)

(assert (=> b!241242 (= e!156558 None!284)))

(declare-fun b!241239 () Bool)

(assert (=> b!241239 (= e!156557 (Some!285 (_2!2344 (h!4193 (toList!1806 (getCurrentListMap!1338 (_keys!6565 thiss!1504) (_values!4446 thiss!1504) (mask!10525 thiss!1504) (extraKeys!4200 thiss!1504) (zeroValue!4304 thiss!1504) (minValue!4304 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4463 thiss!1504)))))))))

(declare-fun b!241240 () Bool)

(assert (=> b!241240 (= e!156557 e!156558)))

(declare-fun c!40200 () Bool)

(assert (=> b!241240 (= c!40200 (and ((_ is Cons!3537) (toList!1806 (getCurrentListMap!1338 (_keys!6565 thiss!1504) (_values!4446 thiss!1504) (mask!10525 thiss!1504) (extraKeys!4200 thiss!1504) (zeroValue!4304 thiss!1504) (minValue!4304 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4463 thiss!1504)))) (not (= (_1!2344 (h!4193 (toList!1806 (getCurrentListMap!1338 (_keys!6565 thiss!1504) (_values!4446 thiss!1504) (mask!10525 thiss!1504) (extraKeys!4200 thiss!1504) (zeroValue!4304 thiss!1504) (minValue!4304 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4463 thiss!1504))))) key!932))))))

(declare-fun b!241241 () Bool)

(assert (=> b!241241 (= e!156558 (getValueByKey!280 (t!8528 (toList!1806 (getCurrentListMap!1338 (_keys!6565 thiss!1504) (_values!4446 thiss!1504) (mask!10525 thiss!1504) (extraKeys!4200 thiss!1504) (zeroValue!4304 thiss!1504) (minValue!4304 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4463 thiss!1504)))) key!932))))

(assert (= (and d!59899 c!40199) b!241239))

(assert (= (and d!59899 (not c!40199)) b!241240))

(assert (= (and b!241240 c!40200) b!241241))

(assert (= (and b!241240 (not c!40200)) b!241242))

(declare-fun m!260643 () Bool)

(assert (=> b!241241 m!260643))

(assert (=> b!241118 d!59899))

(declare-fun d!59901 () Bool)

(assert (=> d!59901 (isDefined!220 (getValueByKey!280 (toList!1806 (getCurrentListMap!1338 (_keys!6565 thiss!1504) (_values!4446 thiss!1504) (mask!10525 thiss!1504) (extraKeys!4200 thiss!1504) (zeroValue!4304 thiss!1504) (minValue!4304 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4463 thiss!1504))) key!932))))

(declare-fun lt!121298 () Unit!7391)

(declare-fun choose!1126 (List!3541 (_ BitVec 64)) Unit!7391)

(assert (=> d!59901 (= lt!121298 (choose!1126 (toList!1806 (getCurrentListMap!1338 (_keys!6565 thiss!1504) (_values!4446 thiss!1504) (mask!10525 thiss!1504) (extraKeys!4200 thiss!1504) (zeroValue!4304 thiss!1504) (minValue!4304 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4463 thiss!1504))) key!932))))

(declare-fun e!156561 () Bool)

(assert (=> d!59901 e!156561))

(declare-fun res!118265 () Bool)

(assert (=> d!59901 (=> (not res!118265) (not e!156561))))

(declare-fun isStrictlySorted!354 (List!3541) Bool)

(assert (=> d!59901 (= res!118265 (isStrictlySorted!354 (toList!1806 (getCurrentListMap!1338 (_keys!6565 thiss!1504) (_values!4446 thiss!1504) (mask!10525 thiss!1504) (extraKeys!4200 thiss!1504) (zeroValue!4304 thiss!1504) (minValue!4304 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4463 thiss!1504)))))))

(assert (=> d!59901 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!219 (toList!1806 (getCurrentListMap!1338 (_keys!6565 thiss!1504) (_values!4446 thiss!1504) (mask!10525 thiss!1504) (extraKeys!4200 thiss!1504) (zeroValue!4304 thiss!1504) (minValue!4304 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4463 thiss!1504))) key!932) lt!121298)))

(declare-fun b!241245 () Bool)

(assert (=> b!241245 (= e!156561 (containsKey!271 (toList!1806 (getCurrentListMap!1338 (_keys!6565 thiss!1504) (_values!4446 thiss!1504) (mask!10525 thiss!1504) (extraKeys!4200 thiss!1504) (zeroValue!4304 thiss!1504) (minValue!4304 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4463 thiss!1504))) key!932))))

(assert (= (and d!59901 res!118265) b!241245))

(assert (=> d!59901 m!260553))

(assert (=> d!59901 m!260553))

(assert (=> d!59901 m!260555))

(declare-fun m!260645 () Bool)

(assert (=> d!59901 m!260645))

(declare-fun m!260647 () Bool)

(assert (=> d!59901 m!260647))

(assert (=> b!241245 m!260549))

(assert (=> b!241116 d!59901))

(assert (=> b!241116 d!59897))

(assert (=> b!241116 d!59899))

(declare-fun d!59903 () Bool)

(declare-fun e!156576 () Bool)

(assert (=> d!59903 e!156576))

(declare-fun c!40207 () Bool)

(declare-fun lt!121303 () SeekEntryResult!1020)

(assert (=> d!59903 (= c!40207 (and ((_ is Intermediate!1020) lt!121303) (undefined!1832 lt!121303)))))

(declare-fun e!156575 () SeekEntryResult!1020)

(assert (=> d!59903 (= lt!121303 e!156575)))

(declare-fun c!40208 () Bool)

(assert (=> d!59903 (= c!40208 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!121304 () (_ BitVec 64))

(assert (=> d!59903 (= lt!121304 (select (arr!5684 (_keys!6565 thiss!1504)) (toIndex!0 key!932 (mask!10525 thiss!1504))))))

(assert (=> d!59903 (validMask!0 (mask!10525 thiss!1504))))

(assert (=> d!59903 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!10525 thiss!1504)) key!932 (_keys!6565 thiss!1504) (mask!10525 thiss!1504)) lt!121303)))

(declare-fun b!241264 () Bool)

(declare-fun e!156572 () SeekEntryResult!1020)

(assert (=> b!241264 (= e!156575 e!156572)))

(declare-fun c!40209 () Bool)

(assert (=> b!241264 (= c!40209 (or (= lt!121304 key!932) (= (bvadd lt!121304 lt!121304) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!241265 () Bool)

(assert (=> b!241265 (and (bvsge (index!6252 lt!121303) #b00000000000000000000000000000000) (bvslt (index!6252 lt!121303) (size!6025 (_keys!6565 thiss!1504))))))

(declare-fun res!118272 () Bool)

(assert (=> b!241265 (= res!118272 (= (select (arr!5684 (_keys!6565 thiss!1504)) (index!6252 lt!121303)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!156574 () Bool)

(assert (=> b!241265 (=> res!118272 e!156574)))

(declare-fun b!241266 () Bool)

(assert (=> b!241266 (= e!156575 (Intermediate!1020 true (toIndex!0 key!932 (mask!10525 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun b!241267 () Bool)

(assert (=> b!241267 (= e!156576 (bvsge (x!24156 lt!121303) #b01111111111111111111111111111110))))

(declare-fun b!241268 () Bool)

(assert (=> b!241268 (= e!156572 (Intermediate!1020 false (toIndex!0 key!932 (mask!10525 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun b!241269 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!241269 (= e!156572 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!932 (mask!10525 thiss!1504)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (mask!10525 thiss!1504)) key!932 (_keys!6565 thiss!1504) (mask!10525 thiss!1504)))))

(declare-fun b!241270 () Bool)

(declare-fun e!156573 () Bool)

(assert (=> b!241270 (= e!156576 e!156573)))

(declare-fun res!118274 () Bool)

(assert (=> b!241270 (= res!118274 (and ((_ is Intermediate!1020) lt!121303) (not (undefined!1832 lt!121303)) (bvslt (x!24156 lt!121303) #b01111111111111111111111111111110) (bvsge (x!24156 lt!121303) #b00000000000000000000000000000000) (bvsge (x!24156 lt!121303) #b00000000000000000000000000000000)))))

(assert (=> b!241270 (=> (not res!118274) (not e!156573))))

(declare-fun b!241271 () Bool)

(assert (=> b!241271 (and (bvsge (index!6252 lt!121303) #b00000000000000000000000000000000) (bvslt (index!6252 lt!121303) (size!6025 (_keys!6565 thiss!1504))))))

(assert (=> b!241271 (= e!156574 (= (select (arr!5684 (_keys!6565 thiss!1504)) (index!6252 lt!121303)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!241272 () Bool)

(assert (=> b!241272 (and (bvsge (index!6252 lt!121303) #b00000000000000000000000000000000) (bvslt (index!6252 lt!121303) (size!6025 (_keys!6565 thiss!1504))))))

(declare-fun res!118273 () Bool)

(assert (=> b!241272 (= res!118273 (= (select (arr!5684 (_keys!6565 thiss!1504)) (index!6252 lt!121303)) key!932))))

(assert (=> b!241272 (=> res!118273 e!156574)))

(assert (=> b!241272 (= e!156573 e!156574)))

(assert (= (and d!59903 c!40208) b!241266))

(assert (= (and d!59903 (not c!40208)) b!241264))

(assert (= (and b!241264 c!40209) b!241268))

(assert (= (and b!241264 (not c!40209)) b!241269))

(assert (= (and d!59903 c!40207) b!241267))

(assert (= (and d!59903 (not c!40207)) b!241270))

(assert (= (and b!241270 res!118274) b!241272))

(assert (= (and b!241272 (not res!118273)) b!241265))

(assert (= (and b!241265 (not res!118272)) b!241271))

(declare-fun m!260649 () Bool)

(assert (=> b!241272 m!260649))

(assert (=> b!241271 m!260649))

(assert (=> b!241265 m!260649))

(assert (=> d!59903 m!260543))

(declare-fun m!260651 () Bool)

(assert (=> d!59903 m!260651))

(assert (=> d!59903 m!260529))

(assert (=> b!241269 m!260543))

(declare-fun m!260653 () Bool)

(assert (=> b!241269 m!260653))

(assert (=> b!241269 m!260653))

(declare-fun m!260655 () Bool)

(assert (=> b!241269 m!260655))

(assert (=> d!59877 d!59903))

(declare-fun d!59905 () Bool)

(declare-fun lt!121310 () (_ BitVec 32))

(declare-fun lt!121309 () (_ BitVec 32))

(assert (=> d!59905 (= lt!121310 (bvmul (bvxor lt!121309 (bvlshr lt!121309 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!59905 (= lt!121309 ((_ extract 31 0) (bvand (bvxor key!932 (bvlshr key!932 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!59905 (and (bvsge (mask!10525 thiss!1504) #b00000000000000000000000000000000) (let ((res!118275 (let ((h!4197 ((_ extract 31 0) (bvand (bvxor key!932 (bvlshr key!932 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!24174 (bvmul (bvxor h!4197 (bvlshr h!4197 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!24174 (bvlshr x!24174 #b00000000000000000000000000001101)) (mask!10525 thiss!1504)))))) (and (bvslt res!118275 (bvadd (mask!10525 thiss!1504) #b00000000000000000000000000000001)) (bvsge res!118275 #b00000000000000000000000000000000))))))

(assert (=> d!59905 (= (toIndex!0 key!932 (mask!10525 thiss!1504)) (bvand (bvxor lt!121310 (bvlshr lt!121310 #b00000000000000000000000000001101)) (mask!10525 thiss!1504)))))

(assert (=> d!59877 d!59905))

(declare-fun d!59907 () Bool)

(assert (=> d!59907 (= (validMask!0 (mask!10525 thiss!1504)) (and (or (= (mask!10525 thiss!1504) #b00000000000000000000000000000111) (= (mask!10525 thiss!1504) #b00000000000000000000000000001111) (= (mask!10525 thiss!1504) #b00000000000000000000000000011111) (= (mask!10525 thiss!1504) #b00000000000000000000000000111111) (= (mask!10525 thiss!1504) #b00000000000000000000000001111111) (= (mask!10525 thiss!1504) #b00000000000000000000000011111111) (= (mask!10525 thiss!1504) #b00000000000000000000000111111111) (= (mask!10525 thiss!1504) #b00000000000000000000001111111111) (= (mask!10525 thiss!1504) #b00000000000000000000011111111111) (= (mask!10525 thiss!1504) #b00000000000000000000111111111111) (= (mask!10525 thiss!1504) #b00000000000000000001111111111111) (= (mask!10525 thiss!1504) #b00000000000000000011111111111111) (= (mask!10525 thiss!1504) #b00000000000000000111111111111111) (= (mask!10525 thiss!1504) #b00000000000000001111111111111111) (= (mask!10525 thiss!1504) #b00000000000000011111111111111111) (= (mask!10525 thiss!1504) #b00000000000000111111111111111111) (= (mask!10525 thiss!1504) #b00000000000001111111111111111111) (= (mask!10525 thiss!1504) #b00000000000011111111111111111111) (= (mask!10525 thiss!1504) #b00000000000111111111111111111111) (= (mask!10525 thiss!1504) #b00000000001111111111111111111111) (= (mask!10525 thiss!1504) #b00000000011111111111111111111111) (= (mask!10525 thiss!1504) #b00000000111111111111111111111111) (= (mask!10525 thiss!1504) #b00000001111111111111111111111111) (= (mask!10525 thiss!1504) #b00000011111111111111111111111111) (= (mask!10525 thiss!1504) #b00000111111111111111111111111111) (= (mask!10525 thiss!1504) #b00001111111111111111111111111111) (= (mask!10525 thiss!1504) #b00011111111111111111111111111111) (= (mask!10525 thiss!1504) #b00111111111111111111111111111111)) (bvsle (mask!10525 thiss!1504) #b00111111111111111111111111111111)))))

(assert (=> d!59877 d!59907))

(assert (=> bm!22428 d!59875))

(declare-fun d!59909 () Bool)

(declare-fun e!156579 () Bool)

(assert (=> d!59909 e!156579))

(declare-fun res!118281 () Bool)

(assert (=> d!59909 (=> (not res!118281) (not e!156579))))

(declare-fun lt!121322 () ListLongMap!3581)

(assert (=> d!59909 (= res!118281 (contains!1708 lt!121322 (_1!2344 (tuple2!4667 lt!121263 (zeroValue!4304 thiss!1504)))))))

(declare-fun lt!121319 () List!3541)

(assert (=> d!59909 (= lt!121322 (ListLongMap!3582 lt!121319))))

(declare-fun lt!121321 () Unit!7391)

(declare-fun lt!121320 () Unit!7391)

(assert (=> d!59909 (= lt!121321 lt!121320)))

(assert (=> d!59909 (= (getValueByKey!280 lt!121319 (_1!2344 (tuple2!4667 lt!121263 (zeroValue!4304 thiss!1504)))) (Some!285 (_2!2344 (tuple2!4667 lt!121263 (zeroValue!4304 thiss!1504)))))))

(declare-fun lemmaContainsTupThenGetReturnValue!156 (List!3541 (_ BitVec 64) V!8105) Unit!7391)

(assert (=> d!59909 (= lt!121320 (lemmaContainsTupThenGetReturnValue!156 lt!121319 (_1!2344 (tuple2!4667 lt!121263 (zeroValue!4304 thiss!1504))) (_2!2344 (tuple2!4667 lt!121263 (zeroValue!4304 thiss!1504)))))))

(declare-fun insertStrictlySorted!159 (List!3541 (_ BitVec 64) V!8105) List!3541)

(assert (=> d!59909 (= lt!121319 (insertStrictlySorted!159 (toList!1806 lt!121280) (_1!2344 (tuple2!4667 lt!121263 (zeroValue!4304 thiss!1504))) (_2!2344 (tuple2!4667 lt!121263 (zeroValue!4304 thiss!1504)))))))

(assert (=> d!59909 (= (+!648 lt!121280 (tuple2!4667 lt!121263 (zeroValue!4304 thiss!1504))) lt!121322)))

(declare-fun b!241277 () Bool)

(declare-fun res!118280 () Bool)

(assert (=> b!241277 (=> (not res!118280) (not e!156579))))

(assert (=> b!241277 (= res!118280 (= (getValueByKey!280 (toList!1806 lt!121322) (_1!2344 (tuple2!4667 lt!121263 (zeroValue!4304 thiss!1504)))) (Some!285 (_2!2344 (tuple2!4667 lt!121263 (zeroValue!4304 thiss!1504))))))))

(declare-fun b!241278 () Bool)

(declare-fun contains!1711 (List!3541 tuple2!4666) Bool)

(assert (=> b!241278 (= e!156579 (contains!1711 (toList!1806 lt!121322) (tuple2!4667 lt!121263 (zeroValue!4304 thiss!1504))))))

(assert (= (and d!59909 res!118281) b!241277))

(assert (= (and b!241277 res!118280) b!241278))

(declare-fun m!260657 () Bool)

(assert (=> d!59909 m!260657))

(declare-fun m!260659 () Bool)

(assert (=> d!59909 m!260659))

(declare-fun m!260661 () Bool)

(assert (=> d!59909 m!260661))

(declare-fun m!260663 () Bool)

(assert (=> d!59909 m!260663))

(declare-fun m!260665 () Bool)

(assert (=> b!241277 m!260665))

(declare-fun m!260667 () Bool)

(assert (=> b!241278 m!260667))

(assert (=> b!241171 d!59909))

(declare-fun d!59911 () Bool)

(assert (=> d!59911 (= (apply!221 (+!648 lt!121274 (tuple2!4667 lt!121264 (minValue!4304 thiss!1504))) lt!121271) (apply!221 lt!121274 lt!121271))))

(declare-fun lt!121325 () Unit!7391)

(declare-fun choose!1127 (ListLongMap!3581 (_ BitVec 64) V!8105 (_ BitVec 64)) Unit!7391)

(assert (=> d!59911 (= lt!121325 (choose!1127 lt!121274 lt!121264 (minValue!4304 thiss!1504) lt!121271))))

(declare-fun e!156582 () Bool)

(assert (=> d!59911 e!156582))

(declare-fun res!118284 () Bool)

(assert (=> d!59911 (=> (not res!118284) (not e!156582))))

(assert (=> d!59911 (= res!118284 (contains!1708 lt!121274 lt!121271))))

(assert (=> d!59911 (= (addApplyDifferent!197 lt!121274 lt!121264 (minValue!4304 thiss!1504) lt!121271) lt!121325)))

(declare-fun b!241282 () Bool)

(assert (=> b!241282 (= e!156582 (not (= lt!121271 lt!121264)))))

(assert (= (and d!59911 res!118284) b!241282))

(assert (=> d!59911 m!260581))

(assert (=> d!59911 m!260579))

(assert (=> d!59911 m!260581))

(assert (=> d!59911 m!260583))

(declare-fun m!260669 () Bool)

(assert (=> d!59911 m!260669))

(declare-fun m!260671 () Bool)

(assert (=> d!59911 m!260671))

(assert (=> b!241171 d!59911))

(declare-fun d!59913 () Bool)

(declare-fun e!156583 () Bool)

(assert (=> d!59913 e!156583))

(declare-fun res!118286 () Bool)

(assert (=> d!59913 (=> (not res!118286) (not e!156583))))

(declare-fun lt!121329 () ListLongMap!3581)

(assert (=> d!59913 (= res!118286 (contains!1708 lt!121329 (_1!2344 (tuple2!4667 lt!121278 (minValue!4304 thiss!1504)))))))

(declare-fun lt!121326 () List!3541)

(assert (=> d!59913 (= lt!121329 (ListLongMap!3582 lt!121326))))

(declare-fun lt!121328 () Unit!7391)

(declare-fun lt!121327 () Unit!7391)

(assert (=> d!59913 (= lt!121328 lt!121327)))

(assert (=> d!59913 (= (getValueByKey!280 lt!121326 (_1!2344 (tuple2!4667 lt!121278 (minValue!4304 thiss!1504)))) (Some!285 (_2!2344 (tuple2!4667 lt!121278 (minValue!4304 thiss!1504)))))))

(assert (=> d!59913 (= lt!121327 (lemmaContainsTupThenGetReturnValue!156 lt!121326 (_1!2344 (tuple2!4667 lt!121278 (minValue!4304 thiss!1504))) (_2!2344 (tuple2!4667 lt!121278 (minValue!4304 thiss!1504)))))))

(assert (=> d!59913 (= lt!121326 (insertStrictlySorted!159 (toList!1806 lt!121279) (_1!2344 (tuple2!4667 lt!121278 (minValue!4304 thiss!1504))) (_2!2344 (tuple2!4667 lt!121278 (minValue!4304 thiss!1504)))))))

(assert (=> d!59913 (= (+!648 lt!121279 (tuple2!4667 lt!121278 (minValue!4304 thiss!1504))) lt!121329)))

(declare-fun b!241283 () Bool)

(declare-fun res!118285 () Bool)

(assert (=> b!241283 (=> (not res!118285) (not e!156583))))

(assert (=> b!241283 (= res!118285 (= (getValueByKey!280 (toList!1806 lt!121329) (_1!2344 (tuple2!4667 lt!121278 (minValue!4304 thiss!1504)))) (Some!285 (_2!2344 (tuple2!4667 lt!121278 (minValue!4304 thiss!1504))))))))

(declare-fun b!241284 () Bool)

(assert (=> b!241284 (= e!156583 (contains!1711 (toList!1806 lt!121329) (tuple2!4667 lt!121278 (minValue!4304 thiss!1504))))))

(assert (= (and d!59913 res!118286) b!241283))

(assert (= (and b!241283 res!118285) b!241284))

(declare-fun m!260673 () Bool)

(assert (=> d!59913 m!260673))

(declare-fun m!260675 () Bool)

(assert (=> d!59913 m!260675))

(declare-fun m!260677 () Bool)

(assert (=> d!59913 m!260677))

(declare-fun m!260679 () Bool)

(assert (=> d!59913 m!260679))

(declare-fun m!260681 () Bool)

(assert (=> b!241283 m!260681))

(declare-fun m!260683 () Bool)

(assert (=> b!241284 m!260683))

(assert (=> b!241171 d!59913))

(declare-fun d!59915 () Bool)

(assert (=> d!59915 (= (apply!221 lt!121279 lt!121282) (get!2925 (getValueByKey!280 (toList!1806 lt!121279) lt!121282)))))

(declare-fun bs!8856 () Bool)

(assert (= bs!8856 d!59915))

(declare-fun m!260685 () Bool)

(assert (=> bs!8856 m!260685))

(assert (=> bs!8856 m!260685))

(declare-fun m!260687 () Bool)

(assert (=> bs!8856 m!260687))

(assert (=> b!241171 d!59915))

(declare-fun d!59917 () Bool)

(assert (=> d!59917 (= (apply!221 (+!648 lt!121275 (tuple2!4667 lt!121266 (zeroValue!4304 thiss!1504))) lt!121273) (get!2925 (getValueByKey!280 (toList!1806 (+!648 lt!121275 (tuple2!4667 lt!121266 (zeroValue!4304 thiss!1504)))) lt!121273)))))

(declare-fun bs!8857 () Bool)

(assert (= bs!8857 d!59917))

(declare-fun m!260689 () Bool)

(assert (=> bs!8857 m!260689))

(assert (=> bs!8857 m!260689))

(declare-fun m!260691 () Bool)

(assert (=> bs!8857 m!260691))

(assert (=> b!241171 d!59917))

(declare-fun d!59919 () Bool)

(assert (=> d!59919 (= (apply!221 lt!121274 lt!121271) (get!2925 (getValueByKey!280 (toList!1806 lt!121274) lt!121271)))))

(declare-fun bs!8858 () Bool)

(assert (= bs!8858 d!59919))

(declare-fun m!260693 () Bool)

(assert (=> bs!8858 m!260693))

(assert (=> bs!8858 m!260693))

(declare-fun m!260695 () Bool)

(assert (=> bs!8858 m!260695))

(assert (=> b!241171 d!59919))

(declare-fun d!59921 () Bool)

(declare-fun e!156584 () Bool)

(assert (=> d!59921 e!156584))

(declare-fun res!118288 () Bool)

(assert (=> d!59921 (=> (not res!118288) (not e!156584))))

(declare-fun lt!121333 () ListLongMap!3581)

(assert (=> d!59921 (= res!118288 (contains!1708 lt!121333 (_1!2344 (tuple2!4667 lt!121266 (zeroValue!4304 thiss!1504)))))))

(declare-fun lt!121330 () List!3541)

(assert (=> d!59921 (= lt!121333 (ListLongMap!3582 lt!121330))))

(declare-fun lt!121332 () Unit!7391)

(declare-fun lt!121331 () Unit!7391)

(assert (=> d!59921 (= lt!121332 lt!121331)))

(assert (=> d!59921 (= (getValueByKey!280 lt!121330 (_1!2344 (tuple2!4667 lt!121266 (zeroValue!4304 thiss!1504)))) (Some!285 (_2!2344 (tuple2!4667 lt!121266 (zeroValue!4304 thiss!1504)))))))

(assert (=> d!59921 (= lt!121331 (lemmaContainsTupThenGetReturnValue!156 lt!121330 (_1!2344 (tuple2!4667 lt!121266 (zeroValue!4304 thiss!1504))) (_2!2344 (tuple2!4667 lt!121266 (zeroValue!4304 thiss!1504)))))))

(assert (=> d!59921 (= lt!121330 (insertStrictlySorted!159 (toList!1806 lt!121275) (_1!2344 (tuple2!4667 lt!121266 (zeroValue!4304 thiss!1504))) (_2!2344 (tuple2!4667 lt!121266 (zeroValue!4304 thiss!1504)))))))

(assert (=> d!59921 (= (+!648 lt!121275 (tuple2!4667 lt!121266 (zeroValue!4304 thiss!1504))) lt!121333)))

(declare-fun b!241285 () Bool)

(declare-fun res!118287 () Bool)

(assert (=> b!241285 (=> (not res!118287) (not e!156584))))

(assert (=> b!241285 (= res!118287 (= (getValueByKey!280 (toList!1806 lt!121333) (_1!2344 (tuple2!4667 lt!121266 (zeroValue!4304 thiss!1504)))) (Some!285 (_2!2344 (tuple2!4667 lt!121266 (zeroValue!4304 thiss!1504))))))))

(declare-fun b!241286 () Bool)

(assert (=> b!241286 (= e!156584 (contains!1711 (toList!1806 lt!121333) (tuple2!4667 lt!121266 (zeroValue!4304 thiss!1504))))))

(assert (= (and d!59921 res!118288) b!241285))

(assert (= (and b!241285 res!118287) b!241286))

(declare-fun m!260697 () Bool)

(assert (=> d!59921 m!260697))

(declare-fun m!260699 () Bool)

(assert (=> d!59921 m!260699))

(declare-fun m!260701 () Bool)

(assert (=> d!59921 m!260701))

(declare-fun m!260703 () Bool)

(assert (=> d!59921 m!260703))

(declare-fun m!260705 () Bool)

(assert (=> b!241285 m!260705))

(declare-fun m!260707 () Bool)

(assert (=> b!241286 m!260707))

(assert (=> b!241171 d!59921))

(declare-fun d!59923 () Bool)

(assert (=> d!59923 (= (apply!221 lt!121275 lt!121273) (get!2925 (getValueByKey!280 (toList!1806 lt!121275) lt!121273)))))

(declare-fun bs!8859 () Bool)

(assert (= bs!8859 d!59923))

(declare-fun m!260709 () Bool)

(assert (=> bs!8859 m!260709))

(assert (=> bs!8859 m!260709))

(declare-fun m!260711 () Bool)

(assert (=> bs!8859 m!260711))

(assert (=> b!241171 d!59923))

(declare-fun d!59925 () Bool)

(assert (=> d!59925 (= (apply!221 (+!648 lt!121279 (tuple2!4667 lt!121278 (minValue!4304 thiss!1504))) lt!121282) (get!2925 (getValueByKey!280 (toList!1806 (+!648 lt!121279 (tuple2!4667 lt!121278 (minValue!4304 thiss!1504)))) lt!121282)))))

(declare-fun bs!8860 () Bool)

(assert (= bs!8860 d!59925))

(declare-fun m!260713 () Bool)

(assert (=> bs!8860 m!260713))

(assert (=> bs!8860 m!260713))

(declare-fun m!260715 () Bool)

(assert (=> bs!8860 m!260715))

(assert (=> b!241171 d!59925))

(declare-fun d!59927 () Bool)

(assert (=> d!59927 (= (apply!221 (+!648 lt!121275 (tuple2!4667 lt!121266 (zeroValue!4304 thiss!1504))) lt!121273) (apply!221 lt!121275 lt!121273))))

(declare-fun lt!121334 () Unit!7391)

(assert (=> d!59927 (= lt!121334 (choose!1127 lt!121275 lt!121266 (zeroValue!4304 thiss!1504) lt!121273))))

(declare-fun e!156585 () Bool)

(assert (=> d!59927 e!156585))

(declare-fun res!118289 () Bool)

(assert (=> d!59927 (=> (not res!118289) (not e!156585))))

(assert (=> d!59927 (= res!118289 (contains!1708 lt!121275 lt!121273))))

(assert (=> d!59927 (= (addApplyDifferent!197 lt!121275 lt!121266 (zeroValue!4304 thiss!1504) lt!121273) lt!121334)))

(declare-fun b!241287 () Bool)

(assert (=> b!241287 (= e!156585 (not (= lt!121273 lt!121266)))))

(assert (= (and d!59927 res!118289) b!241287))

(assert (=> d!59927 m!260587))

(assert (=> d!59927 m!260595))

(assert (=> d!59927 m!260587))

(assert (=> d!59927 m!260591))

(declare-fun m!260717 () Bool)

(assert (=> d!59927 m!260717))

(declare-fun m!260719 () Bool)

(assert (=> d!59927 m!260719))

(assert (=> b!241171 d!59927))

(declare-fun d!59929 () Bool)

(assert (=> d!59929 (contains!1708 (+!648 lt!121280 (tuple2!4667 lt!121263 (zeroValue!4304 thiss!1504))) lt!121262)))

(declare-fun lt!121337 () Unit!7391)

(declare-fun choose!1128 (ListLongMap!3581 (_ BitVec 64) V!8105 (_ BitVec 64)) Unit!7391)

(assert (=> d!59929 (= lt!121337 (choose!1128 lt!121280 lt!121263 (zeroValue!4304 thiss!1504) lt!121262))))

(assert (=> d!59929 (contains!1708 lt!121280 lt!121262)))

(assert (=> d!59929 (= (addStillContains!197 lt!121280 lt!121263 (zeroValue!4304 thiss!1504) lt!121262) lt!121337)))

(declare-fun bs!8861 () Bool)

(assert (= bs!8861 d!59929))

(assert (=> bs!8861 m!260601))

(assert (=> bs!8861 m!260601))

(assert (=> bs!8861 m!260603))

(declare-fun m!260721 () Bool)

(assert (=> bs!8861 m!260721))

(declare-fun m!260723 () Bool)

(assert (=> bs!8861 m!260723))

(assert (=> b!241171 d!59929))

(declare-fun b!241313 () Bool)

(declare-fun e!156606 () Bool)

(declare-fun lt!121352 () ListLongMap!3581)

(assert (=> b!241313 (= e!156606 (= lt!121352 (getCurrentListMapNoExtraKeys!537 (_keys!6565 thiss!1504) (_values!4446 thiss!1504) (mask!10525 thiss!1504) (extraKeys!4200 thiss!1504) (zeroValue!4304 thiss!1504) (minValue!4304 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!4463 thiss!1504))))))

(declare-fun b!241314 () Bool)

(declare-fun res!118301 () Bool)

(declare-fun e!156600 () Bool)

(assert (=> b!241314 (=> (not res!118301) (not e!156600))))

(assert (=> b!241314 (= res!118301 (not (contains!1708 lt!121352 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!241315 () Bool)

(declare-fun e!156605 () ListLongMap!3581)

(declare-fun e!156603 () ListLongMap!3581)

(assert (=> b!241315 (= e!156605 e!156603)))

(declare-fun c!40220 () Bool)

(assert (=> b!241315 (= c!40220 (validKeyInArray!0 (select (arr!5684 (_keys!6565 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!241316 () Bool)

(assert (=> b!241316 (= e!156605 (ListLongMap!3582 Nil!3538))))

(declare-fun b!241317 () Bool)

(declare-fun isEmpty!527 (ListLongMap!3581) Bool)

(assert (=> b!241317 (= e!156606 (isEmpty!527 lt!121352))))

(declare-fun b!241318 () Bool)

(declare-fun call!22434 () ListLongMap!3581)

(assert (=> b!241318 (= e!156603 call!22434)))

(declare-fun b!241319 () Bool)

(declare-fun e!156601 () Bool)

(assert (=> b!241319 (= e!156601 (validKeyInArray!0 (select (arr!5684 (_keys!6565 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!241319 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun bm!22431 () Bool)

(assert (=> bm!22431 (= call!22434 (getCurrentListMapNoExtraKeys!537 (_keys!6565 thiss!1504) (_values!4446 thiss!1504) (mask!10525 thiss!1504) (extraKeys!4200 thiss!1504) (zeroValue!4304 thiss!1504) (minValue!4304 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!4463 thiss!1504)))))

(declare-fun b!241320 () Bool)

(declare-fun e!156602 () Bool)

(assert (=> b!241320 (= e!156602 e!156606)))

(declare-fun c!40218 () Bool)

(assert (=> b!241320 (= c!40218 (bvslt #b00000000000000000000000000000000 (size!6025 (_keys!6565 thiss!1504))))))

(declare-fun b!241321 () Bool)

(declare-fun lt!121357 () Unit!7391)

(declare-fun lt!121355 () Unit!7391)

(assert (=> b!241321 (= lt!121357 lt!121355)))

(declare-fun lt!121356 () (_ BitVec 64))

(declare-fun lt!121353 () (_ BitVec 64))

(declare-fun lt!121354 () ListLongMap!3581)

(declare-fun lt!121358 () V!8105)

(assert (=> b!241321 (not (contains!1708 (+!648 lt!121354 (tuple2!4667 lt!121353 lt!121358)) lt!121356))))

(declare-fun addStillNotContains!121 (ListLongMap!3581 (_ BitVec 64) V!8105 (_ BitVec 64)) Unit!7391)

(assert (=> b!241321 (= lt!121355 (addStillNotContains!121 lt!121354 lt!121353 lt!121358 lt!121356))))

(assert (=> b!241321 (= lt!121356 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!241321 (= lt!121358 (get!2924 (select (arr!5683 (_values!4446 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!564 (defaultEntry!4463 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!241321 (= lt!121353 (select (arr!5684 (_keys!6565 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!241321 (= lt!121354 call!22434)))

(assert (=> b!241321 (= e!156603 (+!648 call!22434 (tuple2!4667 (select (arr!5684 (_keys!6565 thiss!1504)) #b00000000000000000000000000000000) (get!2924 (select (arr!5683 (_values!4446 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!564 (defaultEntry!4463 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!241322 () Bool)

(assert (=> b!241322 (= e!156600 e!156602)))

(declare-fun c!40219 () Bool)

(assert (=> b!241322 (= c!40219 e!156601)))

(declare-fun res!118300 () Bool)

(assert (=> b!241322 (=> (not res!118300) (not e!156601))))

(assert (=> b!241322 (= res!118300 (bvslt #b00000000000000000000000000000000 (size!6025 (_keys!6565 thiss!1504))))))

(declare-fun b!241323 () Bool)

(declare-fun e!156604 () Bool)

(assert (=> b!241323 (= e!156602 e!156604)))

(assert (=> b!241323 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6025 (_keys!6565 thiss!1504))))))

(declare-fun res!118299 () Bool)

(assert (=> b!241323 (= res!118299 (contains!1708 lt!121352 (select (arr!5684 (_keys!6565 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!241323 (=> (not res!118299) (not e!156604))))

(declare-fun b!241324 () Bool)

(assert (=> b!241324 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6025 (_keys!6565 thiss!1504))))))

(assert (=> b!241324 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6024 (_values!4446 thiss!1504))))))

(assert (=> b!241324 (= e!156604 (= (apply!221 lt!121352 (select (arr!5684 (_keys!6565 thiss!1504)) #b00000000000000000000000000000000)) (get!2924 (select (arr!5683 (_values!4446 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!564 (defaultEntry!4463 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!59931 () Bool)

(assert (=> d!59931 e!156600))

(declare-fun res!118298 () Bool)

(assert (=> d!59931 (=> (not res!118298) (not e!156600))))

(assert (=> d!59931 (= res!118298 (not (contains!1708 lt!121352 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!59931 (= lt!121352 e!156605)))

(declare-fun c!40221 () Bool)

(assert (=> d!59931 (= c!40221 (bvsge #b00000000000000000000000000000000 (size!6025 (_keys!6565 thiss!1504))))))

(assert (=> d!59931 (validMask!0 (mask!10525 thiss!1504))))

(assert (=> d!59931 (= (getCurrentListMapNoExtraKeys!537 (_keys!6565 thiss!1504) (_values!4446 thiss!1504) (mask!10525 thiss!1504) (extraKeys!4200 thiss!1504) (zeroValue!4304 thiss!1504) (minValue!4304 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4463 thiss!1504)) lt!121352)))

(assert (= (and d!59931 c!40221) b!241316))

(assert (= (and d!59931 (not c!40221)) b!241315))

(assert (= (and b!241315 c!40220) b!241321))

(assert (= (and b!241315 (not c!40220)) b!241318))

(assert (= (or b!241321 b!241318) bm!22431))

(assert (= (and d!59931 res!118298) b!241314))

(assert (= (and b!241314 res!118301) b!241322))

(assert (= (and b!241322 res!118300) b!241319))

(assert (= (and b!241322 c!40219) b!241323))

(assert (= (and b!241322 (not c!40219)) b!241320))

(assert (= (and b!241323 res!118299) b!241324))

(assert (= (and b!241320 c!40218) b!241313))

(assert (= (and b!241320 (not c!40218)) b!241317))

(declare-fun b_lambda!8005 () Bool)

(assert (=> (not b_lambda!8005) (not b!241321)))

(assert (=> b!241321 t!8532))

(declare-fun b_and!13469 () Bool)

(assert (= b_and!13467 (and (=> t!8532 result!5179) b_and!13469)))

(declare-fun b_lambda!8007 () Bool)

(assert (=> (not b_lambda!8007) (not b!241324)))

(assert (=> b!241324 t!8532))

(declare-fun b_and!13471 () Bool)

(assert (= b_and!13469 (and (=> t!8532 result!5179) b_and!13471)))

(assert (=> b!241324 m!260531))

(assert (=> b!241324 m!260567))

(assert (=> b!241324 m!260567))

(assert (=> b!241324 m!260569))

(assert (=> b!241324 m!260571))

(assert (=> b!241324 m!260569))

(assert (=> b!241324 m!260531))

(declare-fun m!260725 () Bool)

(assert (=> b!241324 m!260725))

(declare-fun m!260727 () Bool)

(assert (=> b!241317 m!260727))

(declare-fun m!260729 () Bool)

(assert (=> b!241313 m!260729))

(declare-fun m!260731 () Bool)

(assert (=> d!59931 m!260731))

(assert (=> d!59931 m!260529))

(declare-fun m!260733 () Bool)

(assert (=> b!241321 m!260733))

(declare-fun m!260735 () Bool)

(assert (=> b!241321 m!260735))

(declare-fun m!260737 () Bool)

(assert (=> b!241321 m!260737))

(declare-fun m!260739 () Bool)

(assert (=> b!241321 m!260739))

(assert (=> b!241321 m!260567))

(assert (=> b!241321 m!260567))

(assert (=> b!241321 m!260569))

(assert (=> b!241321 m!260571))

(assert (=> b!241321 m!260569))

(assert (=> b!241321 m!260531))

(assert (=> b!241321 m!260737))

(assert (=> b!241319 m!260531))

(assert (=> b!241319 m!260531))

(assert (=> b!241319 m!260557))

(assert (=> bm!22431 m!260729))

(assert (=> b!241315 m!260531))

(assert (=> b!241315 m!260531))

(assert (=> b!241315 m!260557))

(assert (=> b!241323 m!260531))

(assert (=> b!241323 m!260531))

(declare-fun m!260741 () Bool)

(assert (=> b!241323 m!260741))

(declare-fun m!260743 () Bool)

(assert (=> b!241314 m!260743))

(assert (=> b!241171 d!59931))

(declare-fun d!59933 () Bool)

(declare-fun e!156607 () Bool)

(assert (=> d!59933 e!156607))

(declare-fun res!118302 () Bool)

(assert (=> d!59933 (=> res!118302 e!156607)))

(declare-fun lt!121360 () Bool)

(assert (=> d!59933 (= res!118302 (not lt!121360))))

(declare-fun lt!121361 () Bool)

(assert (=> d!59933 (= lt!121360 lt!121361)))

(declare-fun lt!121362 () Unit!7391)

(declare-fun e!156608 () Unit!7391)

(assert (=> d!59933 (= lt!121362 e!156608)))

(declare-fun c!40222 () Bool)

(assert (=> d!59933 (= c!40222 lt!121361)))

(assert (=> d!59933 (= lt!121361 (containsKey!271 (toList!1806 (+!648 lt!121280 (tuple2!4667 lt!121263 (zeroValue!4304 thiss!1504)))) lt!121262))))

(assert (=> d!59933 (= (contains!1708 (+!648 lt!121280 (tuple2!4667 lt!121263 (zeroValue!4304 thiss!1504))) lt!121262) lt!121360)))

(declare-fun b!241325 () Bool)

(declare-fun lt!121359 () Unit!7391)

(assert (=> b!241325 (= e!156608 lt!121359)))

(assert (=> b!241325 (= lt!121359 (lemmaContainsKeyImpliesGetValueByKeyDefined!219 (toList!1806 (+!648 lt!121280 (tuple2!4667 lt!121263 (zeroValue!4304 thiss!1504)))) lt!121262))))

(assert (=> b!241325 (isDefined!220 (getValueByKey!280 (toList!1806 (+!648 lt!121280 (tuple2!4667 lt!121263 (zeroValue!4304 thiss!1504)))) lt!121262))))

(declare-fun b!241326 () Bool)

(declare-fun Unit!7406 () Unit!7391)

(assert (=> b!241326 (= e!156608 Unit!7406)))

(declare-fun b!241327 () Bool)

(assert (=> b!241327 (= e!156607 (isDefined!220 (getValueByKey!280 (toList!1806 (+!648 lt!121280 (tuple2!4667 lt!121263 (zeroValue!4304 thiss!1504)))) lt!121262)))))

(assert (= (and d!59933 c!40222) b!241325))

(assert (= (and d!59933 (not c!40222)) b!241326))

(assert (= (and d!59933 (not res!118302)) b!241327))

(declare-fun m!260745 () Bool)

(assert (=> d!59933 m!260745))

(declare-fun m!260747 () Bool)

(assert (=> b!241325 m!260747))

(declare-fun m!260749 () Bool)

(assert (=> b!241325 m!260749))

(assert (=> b!241325 m!260749))

(declare-fun m!260751 () Bool)

(assert (=> b!241325 m!260751))

(assert (=> b!241327 m!260749))

(assert (=> b!241327 m!260749))

(assert (=> b!241327 m!260751))

(assert (=> b!241171 d!59933))

(declare-fun d!59935 () Bool)

(assert (=> d!59935 (= (apply!221 (+!648 lt!121274 (tuple2!4667 lt!121264 (minValue!4304 thiss!1504))) lt!121271) (get!2925 (getValueByKey!280 (toList!1806 (+!648 lt!121274 (tuple2!4667 lt!121264 (minValue!4304 thiss!1504)))) lt!121271)))))

(declare-fun bs!8862 () Bool)

(assert (= bs!8862 d!59935))

(declare-fun m!260753 () Bool)

(assert (=> bs!8862 m!260753))

(assert (=> bs!8862 m!260753))

(declare-fun m!260755 () Bool)

(assert (=> bs!8862 m!260755))

(assert (=> b!241171 d!59935))

(declare-fun d!59937 () Bool)

(assert (=> d!59937 (= (apply!221 (+!648 lt!121279 (tuple2!4667 lt!121278 (minValue!4304 thiss!1504))) lt!121282) (apply!221 lt!121279 lt!121282))))

(declare-fun lt!121363 () Unit!7391)

(assert (=> d!59937 (= lt!121363 (choose!1127 lt!121279 lt!121278 (minValue!4304 thiss!1504) lt!121282))))

(declare-fun e!156609 () Bool)

(assert (=> d!59937 e!156609))

(declare-fun res!118303 () Bool)

(assert (=> d!59937 (=> (not res!118303) (not e!156609))))

(assert (=> d!59937 (= res!118303 (contains!1708 lt!121279 lt!121282))))

(assert (=> d!59937 (= (addApplyDifferent!197 lt!121279 lt!121278 (minValue!4304 thiss!1504) lt!121282) lt!121363)))

(declare-fun b!241328 () Bool)

(assert (=> b!241328 (= e!156609 (not (= lt!121282 lt!121278)))))

(assert (= (and d!59937 res!118303) b!241328))

(assert (=> d!59937 m!260597))

(assert (=> d!59937 m!260607))

(assert (=> d!59937 m!260597))

(assert (=> d!59937 m!260599))

(declare-fun m!260757 () Bool)

(assert (=> d!59937 m!260757))

(declare-fun m!260759 () Bool)

(assert (=> d!59937 m!260759))

(assert (=> b!241171 d!59937))

(declare-fun d!59939 () Bool)

(declare-fun e!156610 () Bool)

(assert (=> d!59939 e!156610))

(declare-fun res!118305 () Bool)

(assert (=> d!59939 (=> (not res!118305) (not e!156610))))

(declare-fun lt!121367 () ListLongMap!3581)

(assert (=> d!59939 (= res!118305 (contains!1708 lt!121367 (_1!2344 (tuple2!4667 lt!121264 (minValue!4304 thiss!1504)))))))

(declare-fun lt!121364 () List!3541)

(assert (=> d!59939 (= lt!121367 (ListLongMap!3582 lt!121364))))

(declare-fun lt!121366 () Unit!7391)

(declare-fun lt!121365 () Unit!7391)

(assert (=> d!59939 (= lt!121366 lt!121365)))

(assert (=> d!59939 (= (getValueByKey!280 lt!121364 (_1!2344 (tuple2!4667 lt!121264 (minValue!4304 thiss!1504)))) (Some!285 (_2!2344 (tuple2!4667 lt!121264 (minValue!4304 thiss!1504)))))))

(assert (=> d!59939 (= lt!121365 (lemmaContainsTupThenGetReturnValue!156 lt!121364 (_1!2344 (tuple2!4667 lt!121264 (minValue!4304 thiss!1504))) (_2!2344 (tuple2!4667 lt!121264 (minValue!4304 thiss!1504)))))))

(assert (=> d!59939 (= lt!121364 (insertStrictlySorted!159 (toList!1806 lt!121274) (_1!2344 (tuple2!4667 lt!121264 (minValue!4304 thiss!1504))) (_2!2344 (tuple2!4667 lt!121264 (minValue!4304 thiss!1504)))))))

(assert (=> d!59939 (= (+!648 lt!121274 (tuple2!4667 lt!121264 (minValue!4304 thiss!1504))) lt!121367)))

(declare-fun b!241329 () Bool)

(declare-fun res!118304 () Bool)

(assert (=> b!241329 (=> (not res!118304) (not e!156610))))

(assert (=> b!241329 (= res!118304 (= (getValueByKey!280 (toList!1806 lt!121367) (_1!2344 (tuple2!4667 lt!121264 (minValue!4304 thiss!1504)))) (Some!285 (_2!2344 (tuple2!4667 lt!121264 (minValue!4304 thiss!1504))))))))

(declare-fun b!241330 () Bool)

(assert (=> b!241330 (= e!156610 (contains!1711 (toList!1806 lt!121367) (tuple2!4667 lt!121264 (minValue!4304 thiss!1504))))))

(assert (= (and d!59939 res!118305) b!241329))

(assert (= (and b!241329 res!118304) b!241330))

(declare-fun m!260761 () Bool)

(assert (=> d!59939 m!260761))

(declare-fun m!260763 () Bool)

(assert (=> d!59939 m!260763))

(declare-fun m!260765 () Bool)

(assert (=> d!59939 m!260765))

(declare-fun m!260767 () Bool)

(assert (=> d!59939 m!260767))

(declare-fun m!260769 () Bool)

(assert (=> b!241329 m!260769))

(declare-fun m!260771 () Bool)

(assert (=> b!241330 m!260771))

(assert (=> b!241171 d!59939))

(assert (=> d!59893 d!59877))

(declare-fun d!59941 () Bool)

(declare-fun e!156622 () Bool)

(assert (=> d!59941 e!156622))

(declare-fun c!40227 () Bool)

(declare-fun lt!121370 () SeekEntryResult!1020)

(assert (=> d!59941 (= c!40227 ((_ is MissingZero!1020) lt!121370))))

(assert (=> d!59941 (= lt!121370 (seekEntryOrOpen!0 key!932 (_keys!6565 thiss!1504) (mask!10525 thiss!1504)))))

(assert (=> d!59941 true))

(declare-fun _$34!1101 () Unit!7391)

(assert (=> d!59941 (= (choose!1125 (_keys!6565 thiss!1504) (_values!4446 thiss!1504) (mask!10525 thiss!1504) (extraKeys!4200 thiss!1504) (zeroValue!4304 thiss!1504) (minValue!4304 thiss!1504) key!932 (defaultEntry!4463 thiss!1504)) _$34!1101)))

(declare-fun b!241347 () Bool)

(declare-fun e!156620 () Bool)

(assert (=> b!241347 (= e!156622 e!156620)))

(declare-fun res!118317 () Bool)

(declare-fun call!22439 () Bool)

(assert (=> b!241347 (= res!118317 call!22439)))

(assert (=> b!241347 (=> (not res!118317) (not e!156620))))

(declare-fun b!241348 () Bool)

(declare-fun res!118316 () Bool)

(declare-fun e!156619 () Bool)

(assert (=> b!241348 (=> (not res!118316) (not e!156619))))

(assert (=> b!241348 (= res!118316 call!22439)))

(declare-fun e!156621 () Bool)

(assert (=> b!241348 (= e!156621 e!156619)))

(declare-fun b!241349 () Bool)

(declare-fun call!22440 () Bool)

(assert (=> b!241349 (= e!156620 (not call!22440))))

(declare-fun b!241350 () Bool)

(declare-fun res!118314 () Bool)

(assert (=> b!241350 (= res!118314 (= (select (arr!5684 (_keys!6565 thiss!1504)) (index!6250 lt!121370)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!241350 (=> (not res!118314) (not e!156620))))

(declare-fun bm!22436 () Bool)

(assert (=> bm!22436 (= call!22439 (inRange!0 (ite c!40227 (index!6250 lt!121370) (index!6253 lt!121370)) (mask!10525 thiss!1504)))))

(declare-fun b!241351 () Bool)

(assert (=> b!241351 (= e!156619 (not call!22440))))

(declare-fun b!241352 () Bool)

(assert (=> b!241352 (= e!156621 ((_ is Undefined!1020) lt!121370))))

(declare-fun bm!22437 () Bool)

(assert (=> bm!22437 (= call!22440 (arrayContainsKey!0 (_keys!6565 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!241353 () Bool)

(declare-fun res!118315 () Bool)

(assert (=> b!241353 (=> (not res!118315) (not e!156619))))

(assert (=> b!241353 (= res!118315 (= (select (arr!5684 (_keys!6565 thiss!1504)) (index!6253 lt!121370)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!241354 () Bool)

(assert (=> b!241354 (= e!156622 e!156621)))

(declare-fun c!40228 () Bool)

(assert (=> b!241354 (= c!40228 ((_ is MissingVacant!1020) lt!121370))))

(assert (= (and d!59941 c!40227) b!241347))

(assert (= (and d!59941 (not c!40227)) b!241354))

(assert (= (and b!241347 res!118317) b!241350))

(assert (= (and b!241350 res!118314) b!241349))

(assert (= (and b!241354 c!40228) b!241348))

(assert (= (and b!241354 (not c!40228)) b!241352))

(assert (= (and b!241348 res!118316) b!241353))

(assert (= (and b!241353 res!118315) b!241351))

(assert (= (or b!241347 b!241348) bm!22436))

(assert (= (or b!241349 b!241351) bm!22437))

(assert (=> bm!22437 m!260437))

(declare-fun m!260773 () Bool)

(assert (=> b!241353 m!260773))

(declare-fun m!260775 () Bool)

(assert (=> bm!22436 m!260775))

(declare-fun m!260777 () Bool)

(assert (=> b!241350 m!260777))

(assert (=> d!59941 m!260443))

(assert (=> d!59893 d!59941))

(assert (=> d!59893 d!59907))

(declare-fun d!59943 () Bool)

(declare-fun e!156623 () Bool)

(assert (=> d!59943 e!156623))

(declare-fun res!118318 () Bool)

(assert (=> d!59943 (=> res!118318 e!156623)))

(declare-fun lt!121372 () Bool)

(assert (=> d!59943 (= res!118318 (not lt!121372))))

(declare-fun lt!121373 () Bool)

(assert (=> d!59943 (= lt!121372 lt!121373)))

(declare-fun lt!121374 () Unit!7391)

(declare-fun e!156624 () Unit!7391)

(assert (=> d!59943 (= lt!121374 e!156624)))

(declare-fun c!40229 () Bool)

(assert (=> d!59943 (= c!40229 lt!121373)))

(assert (=> d!59943 (= lt!121373 (containsKey!271 (toList!1806 lt!121281) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!59943 (= (contains!1708 lt!121281 #b1000000000000000000000000000000000000000000000000000000000000000) lt!121372)))

(declare-fun b!241355 () Bool)

(declare-fun lt!121371 () Unit!7391)

(assert (=> b!241355 (= e!156624 lt!121371)))

(assert (=> b!241355 (= lt!121371 (lemmaContainsKeyImpliesGetValueByKeyDefined!219 (toList!1806 lt!121281) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!241355 (isDefined!220 (getValueByKey!280 (toList!1806 lt!121281) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!241356 () Bool)

(declare-fun Unit!7407 () Unit!7391)

(assert (=> b!241356 (= e!156624 Unit!7407)))

(declare-fun b!241357 () Bool)

(assert (=> b!241357 (= e!156623 (isDefined!220 (getValueByKey!280 (toList!1806 lt!121281) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!59943 c!40229) b!241355))

(assert (= (and d!59943 (not c!40229)) b!241356))

(assert (= (and d!59943 (not res!118318)) b!241357))

(declare-fun m!260779 () Bool)

(assert (=> d!59943 m!260779))

(declare-fun m!260781 () Bool)

(assert (=> b!241355 m!260781))

(assert (=> b!241355 m!260637))

(assert (=> b!241355 m!260637))

(declare-fun m!260783 () Bool)

(assert (=> b!241355 m!260783))

(assert (=> b!241357 m!260637))

(assert (=> b!241357 m!260637))

(assert (=> b!241357 m!260783))

(assert (=> bm!22416 d!59943))

(declare-fun d!59945 () Bool)

(assert (=> d!59945 (= (validKeyInArray!0 (select (arr!5684 (_keys!6565 thiss!1504)) #b00000000000000000000000000000000)) (and (not (= (select (arr!5684 (_keys!6565 thiss!1504)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!5684 (_keys!6565 thiss!1504)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!241172 d!59945))

(declare-fun d!59947 () Bool)

(declare-fun res!118327 () Bool)

(declare-fun e!156627 () Bool)

(assert (=> d!59947 (=> (not res!118327) (not e!156627))))

(assert (=> d!59947 (= res!118327 (validMask!0 (mask!10525 thiss!1504)))))

(assert (=> d!59947 (= (simpleValid!244 thiss!1504) e!156627)))

(declare-fun b!241368 () Bool)

(declare-fun res!118328 () Bool)

(assert (=> b!241368 (=> (not res!118328) (not e!156627))))

(declare-fun size!6030 (LongMapFixedSize!3556) (_ BitVec 32))

(assert (=> b!241368 (= res!118328 (= (size!6030 thiss!1504) (bvadd (_size!1827 thiss!1504) (bvsdiv (bvadd (extraKeys!4200 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!241369 () Bool)

(assert (=> b!241369 (= e!156627 (and (bvsge (extraKeys!4200 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!4200 thiss!1504) #b00000000000000000000000000000011) (bvsge (_vacant!1827 thiss!1504) #b00000000000000000000000000000000)))))

(declare-fun b!241367 () Bool)

(declare-fun res!118330 () Bool)

(assert (=> b!241367 (=> (not res!118330) (not e!156627))))

(assert (=> b!241367 (= res!118330 (bvsge (size!6030 thiss!1504) (_size!1827 thiss!1504)))))

(declare-fun b!241366 () Bool)

(declare-fun res!118329 () Bool)

(assert (=> b!241366 (=> (not res!118329) (not e!156627))))

(assert (=> b!241366 (= res!118329 (and (= (size!6024 (_values!4446 thiss!1504)) (bvadd (mask!10525 thiss!1504) #b00000000000000000000000000000001)) (= (size!6025 (_keys!6565 thiss!1504)) (size!6024 (_values!4446 thiss!1504))) (bvsge (_size!1827 thiss!1504) #b00000000000000000000000000000000) (bvsle (_size!1827 thiss!1504) (bvadd (mask!10525 thiss!1504) #b00000000000000000000000000000001))))))

(assert (= (and d!59947 res!118327) b!241366))

(assert (= (and b!241366 res!118329) b!241367))

(assert (= (and b!241367 res!118330) b!241368))

(assert (= (and b!241368 res!118328) b!241369))

(assert (=> d!59947 m!260529))

(declare-fun m!260785 () Bool)

(assert (=> b!241368 m!260785))

(assert (=> b!241367 m!260785))

(assert (=> d!59885 d!59947))

(declare-fun b!241382 () Bool)

(declare-fun c!40238 () Bool)

(declare-fun lt!121379 () (_ BitVec 64))

(assert (=> b!241382 (= c!40238 (= lt!121379 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!156635 () SeekEntryResult!1020)

(declare-fun e!156634 () SeekEntryResult!1020)

(assert (=> b!241382 (= e!156635 e!156634)))

(declare-fun b!241383 () Bool)

(assert (=> b!241383 (= e!156634 (MissingVacant!1020 (index!6252 lt!121205)))))

(declare-fun b!241384 () Bool)

(declare-fun e!156636 () SeekEntryResult!1020)

(assert (=> b!241384 (= e!156636 Undefined!1020)))

(declare-fun b!241385 () Bool)

(assert (=> b!241385 (= e!156636 e!156635)))

(declare-fun c!40236 () Bool)

(assert (=> b!241385 (= c!40236 (= lt!121379 key!932))))

(declare-fun b!241386 () Bool)

(assert (=> b!241386 (= e!156634 (seekKeyOrZeroReturnVacant!0 (bvadd (x!24156 lt!121205) #b00000000000000000000000000000001) (nextIndex!0 (index!6252 lt!121205) (bvadd (x!24156 lt!121205) #b00000000000000000000000000000001) (mask!10525 thiss!1504)) (index!6252 lt!121205) key!932 (_keys!6565 thiss!1504) (mask!10525 thiss!1504)))))

(declare-fun b!241387 () Bool)

(assert (=> b!241387 (= e!156635 (Found!1020 (index!6252 lt!121205)))))

(declare-fun lt!121380 () SeekEntryResult!1020)

(declare-fun d!59949 () Bool)

(assert (=> d!59949 (and (or ((_ is Undefined!1020) lt!121380) (not ((_ is Found!1020) lt!121380)) (and (bvsge (index!6251 lt!121380) #b00000000000000000000000000000000) (bvslt (index!6251 lt!121380) (size!6025 (_keys!6565 thiss!1504))))) (or ((_ is Undefined!1020) lt!121380) ((_ is Found!1020) lt!121380) (not ((_ is MissingVacant!1020) lt!121380)) (not (= (index!6253 lt!121380) (index!6252 lt!121205))) (and (bvsge (index!6253 lt!121380) #b00000000000000000000000000000000) (bvslt (index!6253 lt!121380) (size!6025 (_keys!6565 thiss!1504))))) (or ((_ is Undefined!1020) lt!121380) (ite ((_ is Found!1020) lt!121380) (= (select (arr!5684 (_keys!6565 thiss!1504)) (index!6251 lt!121380)) key!932) (and ((_ is MissingVacant!1020) lt!121380) (= (index!6253 lt!121380) (index!6252 lt!121205)) (= (select (arr!5684 (_keys!6565 thiss!1504)) (index!6253 lt!121380)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!59949 (= lt!121380 e!156636)))

(declare-fun c!40237 () Bool)

(assert (=> d!59949 (= c!40237 (bvsge (x!24156 lt!121205) #b01111111111111111111111111111110))))

(assert (=> d!59949 (= lt!121379 (select (arr!5684 (_keys!6565 thiss!1504)) (index!6252 lt!121205)))))

(assert (=> d!59949 (validMask!0 (mask!10525 thiss!1504))))

(assert (=> d!59949 (= (seekKeyOrZeroReturnVacant!0 (x!24156 lt!121205) (index!6252 lt!121205) (index!6252 lt!121205) key!932 (_keys!6565 thiss!1504) (mask!10525 thiss!1504)) lt!121380)))

(assert (= (and d!59949 c!40237) b!241384))

(assert (= (and d!59949 (not c!40237)) b!241385))

(assert (= (and b!241385 c!40236) b!241387))

(assert (= (and b!241385 (not c!40236)) b!241382))

(assert (= (and b!241382 c!40238) b!241383))

(assert (= (and b!241382 (not c!40238)) b!241386))

(declare-fun m!260787 () Bool)

(assert (=> b!241386 m!260787))

(assert (=> b!241386 m!260787))

(declare-fun m!260789 () Bool)

(assert (=> b!241386 m!260789))

(declare-fun m!260791 () Bool)

(assert (=> d!59949 m!260791))

(declare-fun m!260793 () Bool)

(assert (=> d!59949 m!260793))

(assert (=> d!59949 m!260547))

(assert (=> d!59949 m!260529))

(assert (=> b!241106 d!59949))

(declare-fun d!59951 () Bool)

(declare-fun res!118335 () Bool)

(declare-fun e!156641 () Bool)

(assert (=> d!59951 (=> res!118335 e!156641)))

(assert (=> d!59951 (= res!118335 (and ((_ is Cons!3537) (toList!1806 (getCurrentListMap!1338 (_keys!6565 thiss!1504) (_values!4446 thiss!1504) (mask!10525 thiss!1504) (extraKeys!4200 thiss!1504) (zeroValue!4304 thiss!1504) (minValue!4304 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4463 thiss!1504)))) (= (_1!2344 (h!4193 (toList!1806 (getCurrentListMap!1338 (_keys!6565 thiss!1504) (_values!4446 thiss!1504) (mask!10525 thiss!1504) (extraKeys!4200 thiss!1504) (zeroValue!4304 thiss!1504) (minValue!4304 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4463 thiss!1504))))) key!932)))))

(assert (=> d!59951 (= (containsKey!271 (toList!1806 (getCurrentListMap!1338 (_keys!6565 thiss!1504) (_values!4446 thiss!1504) (mask!10525 thiss!1504) (extraKeys!4200 thiss!1504) (zeroValue!4304 thiss!1504) (minValue!4304 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4463 thiss!1504))) key!932) e!156641)))

(declare-fun b!241392 () Bool)

(declare-fun e!156642 () Bool)

(assert (=> b!241392 (= e!156641 e!156642)))

(declare-fun res!118336 () Bool)

(assert (=> b!241392 (=> (not res!118336) (not e!156642))))

(assert (=> b!241392 (= res!118336 (and (or (not ((_ is Cons!3537) (toList!1806 (getCurrentListMap!1338 (_keys!6565 thiss!1504) (_values!4446 thiss!1504) (mask!10525 thiss!1504) (extraKeys!4200 thiss!1504) (zeroValue!4304 thiss!1504) (minValue!4304 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4463 thiss!1504))))) (bvsle (_1!2344 (h!4193 (toList!1806 (getCurrentListMap!1338 (_keys!6565 thiss!1504) (_values!4446 thiss!1504) (mask!10525 thiss!1504) (extraKeys!4200 thiss!1504) (zeroValue!4304 thiss!1504) (minValue!4304 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4463 thiss!1504))))) key!932)) ((_ is Cons!3537) (toList!1806 (getCurrentListMap!1338 (_keys!6565 thiss!1504) (_values!4446 thiss!1504) (mask!10525 thiss!1504) (extraKeys!4200 thiss!1504) (zeroValue!4304 thiss!1504) (minValue!4304 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4463 thiss!1504)))) (bvslt (_1!2344 (h!4193 (toList!1806 (getCurrentListMap!1338 (_keys!6565 thiss!1504) (_values!4446 thiss!1504) (mask!10525 thiss!1504) (extraKeys!4200 thiss!1504) (zeroValue!4304 thiss!1504) (minValue!4304 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4463 thiss!1504))))) key!932)))))

(declare-fun b!241393 () Bool)

(assert (=> b!241393 (= e!156642 (containsKey!271 (t!8528 (toList!1806 (getCurrentListMap!1338 (_keys!6565 thiss!1504) (_values!4446 thiss!1504) (mask!10525 thiss!1504) (extraKeys!4200 thiss!1504) (zeroValue!4304 thiss!1504) (minValue!4304 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4463 thiss!1504)))) key!932))))

(assert (= (and d!59951 (not res!118335)) b!241392))

(assert (= (and b!241392 res!118336) b!241393))

(declare-fun m!260795 () Bool)

(assert (=> b!241393 m!260795))

(assert (=> d!59881 d!59951))

(declare-fun d!59953 () Bool)

(declare-fun e!156643 () Bool)

(assert (=> d!59953 e!156643))

(declare-fun res!118338 () Bool)

(assert (=> d!59953 (=> (not res!118338) (not e!156643))))

(declare-fun lt!121384 () ListLongMap!3581)

(assert (=> d!59953 (= res!118338 (contains!1708 lt!121384 (_1!2344 (ite (or c!40185 c!40187) (tuple2!4667 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4304 thiss!1504)) (tuple2!4667 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4304 thiss!1504))))))))

(declare-fun lt!121381 () List!3541)

(assert (=> d!59953 (= lt!121384 (ListLongMap!3582 lt!121381))))

(declare-fun lt!121383 () Unit!7391)

(declare-fun lt!121382 () Unit!7391)

(assert (=> d!59953 (= lt!121383 lt!121382)))

(assert (=> d!59953 (= (getValueByKey!280 lt!121381 (_1!2344 (ite (or c!40185 c!40187) (tuple2!4667 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4304 thiss!1504)) (tuple2!4667 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4304 thiss!1504))))) (Some!285 (_2!2344 (ite (or c!40185 c!40187) (tuple2!4667 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4304 thiss!1504)) (tuple2!4667 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4304 thiss!1504))))))))

(assert (=> d!59953 (= lt!121382 (lemmaContainsTupThenGetReturnValue!156 lt!121381 (_1!2344 (ite (or c!40185 c!40187) (tuple2!4667 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4304 thiss!1504)) (tuple2!4667 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4304 thiss!1504)))) (_2!2344 (ite (or c!40185 c!40187) (tuple2!4667 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4304 thiss!1504)) (tuple2!4667 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4304 thiss!1504))))))))

(assert (=> d!59953 (= lt!121381 (insertStrictlySorted!159 (toList!1806 (ite c!40185 call!22422 (ite c!40187 call!22425 call!22420))) (_1!2344 (ite (or c!40185 c!40187) (tuple2!4667 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4304 thiss!1504)) (tuple2!4667 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4304 thiss!1504)))) (_2!2344 (ite (or c!40185 c!40187) (tuple2!4667 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4304 thiss!1504)) (tuple2!4667 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4304 thiss!1504))))))))

(assert (=> d!59953 (= (+!648 (ite c!40185 call!22422 (ite c!40187 call!22425 call!22420)) (ite (or c!40185 c!40187) (tuple2!4667 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4304 thiss!1504)) (tuple2!4667 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4304 thiss!1504)))) lt!121384)))

(declare-fun b!241394 () Bool)

(declare-fun res!118337 () Bool)

(assert (=> b!241394 (=> (not res!118337) (not e!156643))))

(assert (=> b!241394 (= res!118337 (= (getValueByKey!280 (toList!1806 lt!121384) (_1!2344 (ite (or c!40185 c!40187) (tuple2!4667 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4304 thiss!1504)) (tuple2!4667 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4304 thiss!1504))))) (Some!285 (_2!2344 (ite (or c!40185 c!40187) (tuple2!4667 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4304 thiss!1504)) (tuple2!4667 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4304 thiss!1504)))))))))

(declare-fun b!241395 () Bool)

(assert (=> b!241395 (= e!156643 (contains!1711 (toList!1806 lt!121384) (ite (or c!40185 c!40187) (tuple2!4667 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4304 thiss!1504)) (tuple2!4667 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4304 thiss!1504)))))))

(assert (= (and d!59953 res!118338) b!241394))

(assert (= (and b!241394 res!118337) b!241395))

(declare-fun m!260797 () Bool)

(assert (=> d!59953 m!260797))

(declare-fun m!260799 () Bool)

(assert (=> d!59953 m!260799))

(declare-fun m!260801 () Bool)

(assert (=> d!59953 m!260801))

(declare-fun m!260803 () Bool)

(assert (=> d!59953 m!260803))

(declare-fun m!260805 () Bool)

(assert (=> b!241394 m!260805))

(declare-fun m!260807 () Bool)

(assert (=> b!241395 m!260807))

(assert (=> bm!22419 d!59953))

(assert (=> d!59883 d!59907))

(declare-fun b!241406 () Bool)

(declare-fun e!156654 () Bool)

(declare-fun e!156655 () Bool)

(assert (=> b!241406 (= e!156654 e!156655)))

(declare-fun c!40241 () Bool)

(assert (=> b!241406 (= c!40241 (validKeyInArray!0 (select (arr!5684 (_keys!6565 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun bm!22440 () Bool)

(declare-fun call!22443 () Bool)

(assert (=> bm!22440 (= call!22443 (arrayNoDuplicates!0 (_keys!6565 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!40241 (Cons!3540 (select (arr!5684 (_keys!6565 thiss!1504)) #b00000000000000000000000000000000) Nil!3541) Nil!3541)))))

(declare-fun b!241407 () Bool)

(assert (=> b!241407 (= e!156655 call!22443)))

(declare-fun b!241408 () Bool)

(declare-fun e!156653 () Bool)

(assert (=> b!241408 (= e!156653 e!156654)))

(declare-fun res!118346 () Bool)

(assert (=> b!241408 (=> (not res!118346) (not e!156654))))

(declare-fun e!156652 () Bool)

(assert (=> b!241408 (= res!118346 (not e!156652))))

(declare-fun res!118345 () Bool)

(assert (=> b!241408 (=> (not res!118345) (not e!156652))))

(assert (=> b!241408 (= res!118345 (validKeyInArray!0 (select (arr!5684 (_keys!6565 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun d!59955 () Bool)

(declare-fun res!118347 () Bool)

(assert (=> d!59955 (=> res!118347 e!156653)))

(assert (=> d!59955 (= res!118347 (bvsge #b00000000000000000000000000000000 (size!6025 (_keys!6565 thiss!1504))))))

(assert (=> d!59955 (= (arrayNoDuplicates!0 (_keys!6565 thiss!1504) #b00000000000000000000000000000000 Nil!3541) e!156653)))

(declare-fun b!241409 () Bool)

(declare-fun contains!1712 (List!3544 (_ BitVec 64)) Bool)

(assert (=> b!241409 (= e!156652 (contains!1712 Nil!3541 (select (arr!5684 (_keys!6565 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!241410 () Bool)

(assert (=> b!241410 (= e!156655 call!22443)))

(assert (= (and d!59955 (not res!118347)) b!241408))

(assert (= (and b!241408 res!118345) b!241409))

(assert (= (and b!241408 res!118346) b!241406))

(assert (= (and b!241406 c!40241) b!241410))

(assert (= (and b!241406 (not c!40241)) b!241407))

(assert (= (or b!241410 b!241407) bm!22440))

(assert (=> b!241406 m!260531))

(assert (=> b!241406 m!260531))

(assert (=> b!241406 m!260557))

(assert (=> bm!22440 m!260531))

(declare-fun m!260809 () Bool)

(assert (=> bm!22440 m!260809))

(assert (=> b!241408 m!260531))

(assert (=> b!241408 m!260531))

(assert (=> b!241408 m!260557))

(assert (=> b!241409 m!260531))

(assert (=> b!241409 m!260531))

(declare-fun m!260811 () Bool)

(assert (=> b!241409 m!260811))

(assert (=> b!241192 d!59955))

(declare-fun d!59957 () Bool)

(declare-fun lt!121387 () (_ BitVec 32))

(assert (=> d!59957 (and (bvsge lt!121387 #b00000000000000000000000000000000) (bvsle lt!121387 (bvsub (size!6025 (_keys!6565 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun e!156661 () (_ BitVec 32))

(assert (=> d!59957 (= lt!121387 e!156661)))

(declare-fun c!40247 () Bool)

(assert (=> d!59957 (= c!40247 (bvsge #b00000000000000000000000000000000 (size!6025 (_keys!6565 thiss!1504))))))

(assert (=> d!59957 (and (bvsle #b00000000000000000000000000000000 (size!6025 (_keys!6565 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6025 (_keys!6565 thiss!1504)) (size!6025 (_keys!6565 thiss!1504))))))

(assert (=> d!59957 (= (arrayCountValidKeys!0 (_keys!6565 thiss!1504) #b00000000000000000000000000000000 (size!6025 (_keys!6565 thiss!1504))) lt!121387)))

(declare-fun b!241419 () Bool)

(assert (=> b!241419 (= e!156661 #b00000000000000000000000000000000)))

(declare-fun bm!22443 () Bool)

(declare-fun call!22446 () (_ BitVec 32))

(assert (=> bm!22443 (= call!22446 (arrayCountValidKeys!0 (_keys!6565 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6025 (_keys!6565 thiss!1504))))))

(declare-fun b!241420 () Bool)

(declare-fun e!156660 () (_ BitVec 32))

(assert (=> b!241420 (= e!156660 (bvadd #b00000000000000000000000000000001 call!22446))))

(declare-fun b!241421 () Bool)

(assert (=> b!241421 (= e!156660 call!22446)))

(declare-fun b!241422 () Bool)

(assert (=> b!241422 (= e!156661 e!156660)))

(declare-fun c!40246 () Bool)

(assert (=> b!241422 (= c!40246 (validKeyInArray!0 (select (arr!5684 (_keys!6565 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (= (and d!59957 c!40247) b!241419))

(assert (= (and d!59957 (not c!40247)) b!241422))

(assert (= (and b!241422 c!40246) b!241420))

(assert (= (and b!241422 (not c!40246)) b!241421))

(assert (= (or b!241420 b!241421) bm!22443))

(declare-fun m!260813 () Bool)

(assert (=> bm!22443 m!260813))

(assert (=> b!241422 m!260531))

(assert (=> b!241422 m!260531))

(assert (=> b!241422 m!260557))

(assert (=> b!241190 d!59957))

(declare-fun b!241431 () Bool)

(declare-fun e!156670 () Bool)

(declare-fun e!156668 () Bool)

(assert (=> b!241431 (= e!156670 e!156668)))

(declare-fun lt!121394 () (_ BitVec 64))

(assert (=> b!241431 (= lt!121394 (select (arr!5684 (_keys!6565 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!121395 () Unit!7391)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!11965 (_ BitVec 64) (_ BitVec 32)) Unit!7391)

(assert (=> b!241431 (= lt!121395 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!6565 thiss!1504) lt!121394 #b00000000000000000000000000000000))))

(assert (=> b!241431 (arrayContainsKey!0 (_keys!6565 thiss!1504) lt!121394 #b00000000000000000000000000000000)))

(declare-fun lt!121396 () Unit!7391)

(assert (=> b!241431 (= lt!121396 lt!121395)))

(declare-fun res!118352 () Bool)

(assert (=> b!241431 (= res!118352 (= (seekEntryOrOpen!0 (select (arr!5684 (_keys!6565 thiss!1504)) #b00000000000000000000000000000000) (_keys!6565 thiss!1504) (mask!10525 thiss!1504)) (Found!1020 #b00000000000000000000000000000000)))))

(assert (=> b!241431 (=> (not res!118352) (not e!156668))))

(declare-fun b!241432 () Bool)

(declare-fun call!22449 () Bool)

(assert (=> b!241432 (= e!156668 call!22449)))

(declare-fun b!241433 () Bool)

(assert (=> b!241433 (= e!156670 call!22449)))

(declare-fun d!59959 () Bool)

(declare-fun res!118353 () Bool)

(declare-fun e!156669 () Bool)

(assert (=> d!59959 (=> res!118353 e!156669)))

(assert (=> d!59959 (= res!118353 (bvsge #b00000000000000000000000000000000 (size!6025 (_keys!6565 thiss!1504))))))

(assert (=> d!59959 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6565 thiss!1504) (mask!10525 thiss!1504)) e!156669)))

(declare-fun bm!22446 () Bool)

(assert (=> bm!22446 (= call!22449 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!6565 thiss!1504) (mask!10525 thiss!1504)))))

(declare-fun b!241434 () Bool)

(assert (=> b!241434 (= e!156669 e!156670)))

(declare-fun c!40250 () Bool)

(assert (=> b!241434 (= c!40250 (validKeyInArray!0 (select (arr!5684 (_keys!6565 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (= (and d!59959 (not res!118353)) b!241434))

(assert (= (and b!241434 c!40250) b!241431))

(assert (= (and b!241434 (not c!40250)) b!241433))

(assert (= (and b!241431 res!118352) b!241432))

(assert (= (or b!241432 b!241433) bm!22446))

(assert (=> b!241431 m!260531))

(declare-fun m!260815 () Bool)

(assert (=> b!241431 m!260815))

(declare-fun m!260817 () Bool)

(assert (=> b!241431 m!260817))

(assert (=> b!241431 m!260531))

(declare-fun m!260819 () Bool)

(assert (=> b!241431 m!260819))

(declare-fun m!260821 () Bool)

(assert (=> bm!22446 m!260821))

(assert (=> b!241434 m!260531))

(assert (=> b!241434 m!260531))

(assert (=> b!241434 m!260557))

(assert (=> b!241191 d!59959))

(assert (=> d!59891 d!59877))

(declare-fun d!59961 () Bool)

(declare-fun e!156673 () Bool)

(assert (=> d!59961 e!156673))

(declare-fun res!118358 () Bool)

(assert (=> d!59961 (=> (not res!118358) (not e!156673))))

(declare-fun lt!121399 () SeekEntryResult!1020)

(assert (=> d!59961 (= res!118358 ((_ is Found!1020) lt!121399))))

(assert (=> d!59961 (= lt!121399 (seekEntryOrOpen!0 key!932 (_keys!6565 thiss!1504) (mask!10525 thiss!1504)))))

(assert (=> d!59961 true))

(declare-fun _$33!156 () Unit!7391)

(assert (=> d!59961 (= (choose!1124 (_keys!6565 thiss!1504) (_values!4446 thiss!1504) (mask!10525 thiss!1504) (extraKeys!4200 thiss!1504) (zeroValue!4304 thiss!1504) (minValue!4304 thiss!1504) key!932 (defaultEntry!4463 thiss!1504)) _$33!156)))

(declare-fun b!241439 () Bool)

(declare-fun res!118359 () Bool)

(assert (=> b!241439 (=> (not res!118359) (not e!156673))))

(assert (=> b!241439 (= res!118359 (inRange!0 (index!6251 lt!121399) (mask!10525 thiss!1504)))))

(declare-fun b!241440 () Bool)

(assert (=> b!241440 (= e!156673 (= (select (arr!5684 (_keys!6565 thiss!1504)) (index!6251 lt!121399)) key!932))))

(assert (= (and d!59961 res!118358) b!241439))

(assert (= (and b!241439 res!118359) b!241440))

(assert (=> d!59961 m!260443))

(declare-fun m!260823 () Bool)

(assert (=> b!241439 m!260823))

(declare-fun m!260825 () Bool)

(assert (=> b!241440 m!260825))

(assert (=> d!59891 d!59961))

(assert (=> d!59891 d!59907))

(declare-fun d!59963 () Bool)

(assert (=> d!59963 (= (apply!221 lt!121281 (select (arr!5684 (_keys!6565 thiss!1504)) #b00000000000000000000000000000000)) (get!2925 (getValueByKey!280 (toList!1806 lt!121281) (select (arr!5684 (_keys!6565 thiss!1504)) #b00000000000000000000000000000000))))))

(declare-fun bs!8863 () Bool)

(assert (= bs!8863 d!59963))

(assert (=> bs!8863 m!260531))

(declare-fun m!260827 () Bool)

(assert (=> bs!8863 m!260827))

(assert (=> bs!8863 m!260827))

(declare-fun m!260829 () Bool)

(assert (=> bs!8863 m!260829))

(assert (=> b!241161 d!59963))

(declare-fun d!59965 () Bool)

(declare-fun c!40253 () Bool)

(assert (=> d!59965 (= c!40253 ((_ is ValueCellFull!2828) (select (arr!5683 (_values!4446 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun e!156676 () V!8105)

(assert (=> d!59965 (= (get!2924 (select (arr!5683 (_values!4446 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!564 (defaultEntry!4463 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)) e!156676)))

(declare-fun b!241445 () Bool)

(declare-fun get!2926 (ValueCell!2828 V!8105) V!8105)

(assert (=> b!241445 (= e!156676 (get!2926 (select (arr!5683 (_values!4446 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!564 (defaultEntry!4463 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!241446 () Bool)

(declare-fun get!2927 (ValueCell!2828 V!8105) V!8105)

(assert (=> b!241446 (= e!156676 (get!2927 (select (arr!5683 (_values!4446 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!564 (defaultEntry!4463 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!59965 c!40253) b!241445))

(assert (= (and d!59965 (not c!40253)) b!241446))

(assert (=> b!241445 m!260567))

(assert (=> b!241445 m!260569))

(declare-fun m!260831 () Bool)

(assert (=> b!241445 m!260831))

(assert (=> b!241446 m!260567))

(assert (=> b!241446 m!260569))

(declare-fun m!260833 () Bool)

(assert (=> b!241446 m!260833))

(assert (=> b!241161 d!59965))

(assert (=> d!59873 d!59881))

(assert (=> d!59873 d!59883))

(declare-fun d!59967 () Bool)

(assert (=> d!59967 (contains!1708 (getCurrentListMap!1338 (_keys!6565 thiss!1504) (_values!4446 thiss!1504) (mask!10525 thiss!1504) (extraKeys!4200 thiss!1504) (zeroValue!4304 thiss!1504) (minValue!4304 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4463 thiss!1504)) key!932)))

(assert (=> d!59967 true))

(declare-fun _$17!65 () Unit!7391)

(assert (=> d!59967 (= (choose!1123 (_keys!6565 thiss!1504) (_values!4446 thiss!1504) (mask!10525 thiss!1504) (extraKeys!4200 thiss!1504) (zeroValue!4304 thiss!1504) (minValue!4304 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4463 thiss!1504)) _$17!65)))

(declare-fun bs!8864 () Bool)

(assert (= bs!8864 d!59967))

(assert (=> bs!8864 m!260455))

(assert (=> bs!8864 m!260455))

(assert (=> bs!8864 m!260457))

(assert (=> d!59873 d!59967))

(assert (=> d!59873 d!59907))

(declare-fun d!59969 () Bool)

(declare-fun e!156677 () Bool)

(assert (=> d!59969 e!156677))

(declare-fun res!118360 () Bool)

(assert (=> d!59969 (=> res!118360 e!156677)))

(declare-fun lt!121401 () Bool)

(assert (=> d!59969 (= res!118360 (not lt!121401))))

(declare-fun lt!121402 () Bool)

(assert (=> d!59969 (= lt!121401 lt!121402)))

(declare-fun lt!121403 () Unit!7391)

(declare-fun e!156678 () Unit!7391)

(assert (=> d!59969 (= lt!121403 e!156678)))

(declare-fun c!40254 () Bool)

(assert (=> d!59969 (= c!40254 lt!121402)))

(assert (=> d!59969 (= lt!121402 (containsKey!271 (toList!1806 lt!121281) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!59969 (= (contains!1708 lt!121281 #b0000000000000000000000000000000000000000000000000000000000000000) lt!121401)))

(declare-fun b!241447 () Bool)

(declare-fun lt!121400 () Unit!7391)

(assert (=> b!241447 (= e!156678 lt!121400)))

(assert (=> b!241447 (= lt!121400 (lemmaContainsKeyImpliesGetValueByKeyDefined!219 (toList!1806 lt!121281) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!241447 (isDefined!220 (getValueByKey!280 (toList!1806 lt!121281) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!241448 () Bool)

(declare-fun Unit!7408 () Unit!7391)

(assert (=> b!241448 (= e!156678 Unit!7408)))

(declare-fun b!241449 () Bool)

(assert (=> b!241449 (= e!156677 (isDefined!220 (getValueByKey!280 (toList!1806 lt!121281) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!59969 c!40254) b!241447))

(assert (= (and d!59969 (not c!40254)) b!241448))

(assert (= (and d!59969 (not res!118360)) b!241449))

(declare-fun m!260835 () Bool)

(assert (=> d!59969 m!260835))

(declare-fun m!260837 () Bool)

(assert (=> b!241447 m!260837))

(declare-fun m!260839 () Bool)

(assert (=> b!241447 m!260839))

(assert (=> b!241447 m!260839))

(declare-fun m!260841 () Bool)

(assert (=> b!241447 m!260841))

(assert (=> b!241449 m!260839))

(assert (=> b!241449 m!260839))

(assert (=> b!241449 m!260841))

(assert (=> bm!22420 d!59969))

(assert (=> bm!22421 d!59931))

(assert (=> b!241178 d!59945))

(declare-fun d!59971 () Bool)

(declare-fun res!118361 () Bool)

(declare-fun e!156679 () Bool)

(assert (=> d!59971 (=> res!118361 e!156679)))

(assert (=> d!59971 (= res!118361 (= (select (arr!5684 (_keys!6565 thiss!1504)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) key!932))))

(assert (=> d!59971 (= (arrayContainsKey!0 (_keys!6565 thiss!1504) key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!156679)))

(declare-fun b!241450 () Bool)

(declare-fun e!156680 () Bool)

(assert (=> b!241450 (= e!156679 e!156680)))

(declare-fun res!118362 () Bool)

(assert (=> b!241450 (=> (not res!118362) (not e!156680))))

(assert (=> b!241450 (= res!118362 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!6025 (_keys!6565 thiss!1504))))))

(declare-fun b!241451 () Bool)

(assert (=> b!241451 (= e!156680 (arrayContainsKey!0 (_keys!6565 thiss!1504) key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!59971 (not res!118361)) b!241450))

(assert (= (and b!241450 res!118362) b!241451))

(declare-fun m!260843 () Bool)

(assert (=> d!59971 m!260843))

(declare-fun m!260845 () Bool)

(assert (=> b!241451 m!260845))

(assert (=> b!241091 d!59971))

(declare-fun d!59973 () Bool)

(assert (=> d!59973 (= (inRange!0 (index!6251 lt!121289) (mask!10525 thiss!1504)) (and (bvsge (index!6251 lt!121289) #b00000000000000000000000000000000) (bvslt (index!6251 lt!121289) (bvadd (mask!10525 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> b!241197 d!59973))

(declare-fun d!59975 () Bool)

(assert (=> d!59975 (= (apply!221 lt!121281 #b0000000000000000000000000000000000000000000000000000000000000000) (get!2925 (getValueByKey!280 (toList!1806 lt!121281) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!8865 () Bool)

(assert (= bs!8865 d!59975))

(assert (=> bs!8865 m!260839))

(assert (=> bs!8865 m!260839))

(declare-fun m!260847 () Bool)

(assert (=> bs!8865 m!260847))

(assert (=> b!241166 d!59975))

(declare-fun d!59977 () Bool)

(assert (=> d!59977 (= (inRange!0 (ite c!40193 (index!6250 lt!121294) (index!6253 lt!121294)) (mask!10525 thiss!1504)) (and (bvsge (ite c!40193 (index!6250 lt!121294) (index!6253 lt!121294)) #b00000000000000000000000000000000) (bvslt (ite c!40193 (index!6250 lt!121294) (index!6253 lt!121294)) (bvadd (mask!10525 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> bm!22427 d!59977))

(declare-fun d!59979 () Bool)

(declare-fun e!156681 () Bool)

(assert (=> d!59979 e!156681))

(declare-fun res!118363 () Bool)

(assert (=> d!59979 (=> res!118363 e!156681)))

(declare-fun lt!121405 () Bool)

(assert (=> d!59979 (= res!118363 (not lt!121405))))

(declare-fun lt!121406 () Bool)

(assert (=> d!59979 (= lt!121405 lt!121406)))

(declare-fun lt!121407 () Unit!7391)

(declare-fun e!156682 () Unit!7391)

(assert (=> d!59979 (= lt!121407 e!156682)))

(declare-fun c!40255 () Bool)

(assert (=> d!59979 (= c!40255 lt!121406)))

(assert (=> d!59979 (= lt!121406 (containsKey!271 (toList!1806 lt!121281) (select (arr!5684 (_keys!6565 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> d!59979 (= (contains!1708 lt!121281 (select (arr!5684 (_keys!6565 thiss!1504)) #b00000000000000000000000000000000)) lt!121405)))

(declare-fun b!241452 () Bool)

(declare-fun lt!121404 () Unit!7391)

(assert (=> b!241452 (= e!156682 lt!121404)))

(assert (=> b!241452 (= lt!121404 (lemmaContainsKeyImpliesGetValueByKeyDefined!219 (toList!1806 lt!121281) (select (arr!5684 (_keys!6565 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!241452 (isDefined!220 (getValueByKey!280 (toList!1806 lt!121281) (select (arr!5684 (_keys!6565 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!241453 () Bool)

(declare-fun Unit!7409 () Unit!7391)

(assert (=> b!241453 (= e!156682 Unit!7409)))

(declare-fun b!241454 () Bool)

(assert (=> b!241454 (= e!156681 (isDefined!220 (getValueByKey!280 (toList!1806 lt!121281) (select (arr!5684 (_keys!6565 thiss!1504)) #b00000000000000000000000000000000))))))

(assert (= (and d!59979 c!40255) b!241452))

(assert (= (and d!59979 (not c!40255)) b!241453))

(assert (= (and d!59979 (not res!118363)) b!241454))

(assert (=> d!59979 m!260531))

(declare-fun m!260849 () Bool)

(assert (=> d!59979 m!260849))

(assert (=> b!241452 m!260531))

(declare-fun m!260851 () Bool)

(assert (=> b!241452 m!260851))

(assert (=> b!241452 m!260531))

(assert (=> b!241452 m!260827))

(assert (=> b!241452 m!260827))

(declare-fun m!260853 () Bool)

(assert (=> b!241452 m!260853))

(assert (=> b!241454 m!260531))

(assert (=> b!241454 m!260827))

(assert (=> b!241454 m!260827))

(assert (=> b!241454 m!260853))

(assert (=> b!241164 d!59979))

(declare-fun d!59981 () Bool)

(declare-fun e!156683 () Bool)

(assert (=> d!59981 e!156683))

(declare-fun res!118365 () Bool)

(assert (=> d!59981 (=> (not res!118365) (not e!156683))))

(declare-fun lt!121411 () ListLongMap!3581)

(assert (=> d!59981 (= res!118365 (contains!1708 lt!121411 (_1!2344 (tuple2!4667 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4304 thiss!1504)))))))

(declare-fun lt!121408 () List!3541)

(assert (=> d!59981 (= lt!121411 (ListLongMap!3582 lt!121408))))

(declare-fun lt!121410 () Unit!7391)

(declare-fun lt!121409 () Unit!7391)

(assert (=> d!59981 (= lt!121410 lt!121409)))

(assert (=> d!59981 (= (getValueByKey!280 lt!121408 (_1!2344 (tuple2!4667 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4304 thiss!1504)))) (Some!285 (_2!2344 (tuple2!4667 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4304 thiss!1504)))))))

(assert (=> d!59981 (= lt!121409 (lemmaContainsTupThenGetReturnValue!156 lt!121408 (_1!2344 (tuple2!4667 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4304 thiss!1504))) (_2!2344 (tuple2!4667 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4304 thiss!1504)))))))

(assert (=> d!59981 (= lt!121408 (insertStrictlySorted!159 (toList!1806 call!22424) (_1!2344 (tuple2!4667 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4304 thiss!1504))) (_2!2344 (tuple2!4667 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4304 thiss!1504)))))))

(assert (=> d!59981 (= (+!648 call!22424 (tuple2!4667 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4304 thiss!1504))) lt!121411)))

(declare-fun b!241455 () Bool)

(declare-fun res!118364 () Bool)

(assert (=> b!241455 (=> (not res!118364) (not e!156683))))

(assert (=> b!241455 (= res!118364 (= (getValueByKey!280 (toList!1806 lt!121411) (_1!2344 (tuple2!4667 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4304 thiss!1504)))) (Some!285 (_2!2344 (tuple2!4667 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4304 thiss!1504))))))))

(declare-fun b!241456 () Bool)

(assert (=> b!241456 (= e!156683 (contains!1711 (toList!1806 lt!121411) (tuple2!4667 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4304 thiss!1504))))))

(assert (= (and d!59981 res!118365) b!241455))

(assert (= (and b!241455 res!118364) b!241456))

(declare-fun m!260855 () Bool)

(assert (=> d!59981 m!260855))

(declare-fun m!260857 () Bool)

(assert (=> d!59981 m!260857))

(declare-fun m!260859 () Bool)

(assert (=> d!59981 m!260859))

(declare-fun m!260861 () Bool)

(assert (=> d!59981 m!260861))

(declare-fun m!260863 () Bool)

(assert (=> b!241455 m!260863))

(declare-fun m!260865 () Bool)

(assert (=> b!241456 m!260865))

(assert (=> b!241165 d!59981))

(declare-fun condMapEmpty!10756 () Bool)

(declare-fun mapDefault!10756 () ValueCell!2828)

(assert (=> mapNonEmpty!10755 (= condMapEmpty!10756 (= mapRest!10755 ((as const (Array (_ BitVec 32) ValueCell!2828)) mapDefault!10756)))))

(declare-fun e!156684 () Bool)

(declare-fun mapRes!10756 () Bool)

(assert (=> mapNonEmpty!10755 (= tp!22662 (and e!156684 mapRes!10756))))

(declare-fun b!241458 () Bool)

(assert (=> b!241458 (= e!156684 tp_is_empty!6343)))

(declare-fun b!241457 () Bool)

(declare-fun e!156685 () Bool)

(assert (=> b!241457 (= e!156685 tp_is_empty!6343)))

(declare-fun mapNonEmpty!10756 () Bool)

(declare-fun tp!22663 () Bool)

(assert (=> mapNonEmpty!10756 (= mapRes!10756 (and tp!22663 e!156685))))

(declare-fun mapKey!10756 () (_ BitVec 32))

(declare-fun mapValue!10756 () ValueCell!2828)

(declare-fun mapRest!10756 () (Array (_ BitVec 32) ValueCell!2828))

(assert (=> mapNonEmpty!10756 (= mapRest!10755 (store mapRest!10756 mapKey!10756 mapValue!10756))))

(declare-fun mapIsEmpty!10756 () Bool)

(assert (=> mapIsEmpty!10756 mapRes!10756))

(assert (= (and mapNonEmpty!10755 condMapEmpty!10756) mapIsEmpty!10756))

(assert (= (and mapNonEmpty!10755 (not condMapEmpty!10756)) mapNonEmpty!10756))

(assert (= (and mapNonEmpty!10756 ((_ is ValueCellFull!2828) mapValue!10756)) b!241457))

(assert (= (and mapNonEmpty!10755 ((_ is ValueCellFull!2828) mapDefault!10756)) b!241458))

(declare-fun m!260867 () Bool)

(assert (=> mapNonEmpty!10756 m!260867))

(declare-fun b_lambda!8009 () Bool)

(assert (= b_lambda!8005 (or (and b!240954 b_free!6481) b_lambda!8009)))

(declare-fun b_lambda!8011 () Bool)

(assert (= b_lambda!8007 (or (and b!240954 b_free!6481) b_lambda!8011)))

(check-sat (not b!241394) (not d!59927) (not b!241329) (not d!59947) (not b!241357) (not b!241422) (not d!59919) (not b!241269) (not b_lambda!8003) (not d!59929) (not b!241408) (not d!59911) (not b!241317) (not d!59967) (not d!59921) (not b!241434) (not b!241368) (not mapNonEmpty!10756) (not b!241395) (not b!241283) (not b!241452) (not d!59917) (not b_lambda!8011) (not bm!22446) (not b!241439) (not b!241321) (not b!241323) (not d!59963) (not b!241245) (not d!59969) (not d!59931) (not b!241445) (not bm!22436) (not d!59925) (not bm!22431) (not d!59913) (not b!241314) (not b!241286) (not b!241409) (not d!59909) (not b!241355) (not b!241324) (not d!59923) (not d!59903) (not d!59961) (not b!241277) (not d!59915) (not d!59895) b_and!13471 tp_is_empty!6343 (not b!241284) (not b!241455) (not b!241327) (not b!241451) (not b!241313) (not b!241456) (not d!59981) (not b!241449) (not b!241431) (not b!241330) (not d!59953) (not b!241447) (not bm!22440) (not b!241393) (not b!241446) (not d!59979) (not d!59897) (not d!59975) (not b!241454) (not d!59943) (not d!59939) (not b!241386) (not b_lambda!8009) (not b_next!6481) (not b!241367) (not d!59933) (not b!241319) (not d!59935) (not d!59937) (not bm!22443) (not b!241406) (not d!59901) (not b!241315) (not b!241278) (not d!59949) (not b!241241) (not bm!22437) (not b!241285) (not b!241325) (not d!59941))
(check-sat b_and!13471 (not b_next!6481))
