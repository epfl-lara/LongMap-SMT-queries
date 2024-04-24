; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!8166 () Bool)

(assert start!8166)

(declare-fun b!51451 () Bool)

(declare-fun b_free!1597 () Bool)

(declare-fun b_next!1597 () Bool)

(assert (=> b!51451 (= b_free!1597 (not b_next!1597))))

(declare-fun tp!6882 () Bool)

(declare-fun b_and!2805 () Bool)

(assert (=> b!51451 (= tp!6882 b_and!2805)))

(declare-fun b!51450 () Bool)

(declare-fun b_free!1599 () Bool)

(declare-fun b_next!1599 () Bool)

(assert (=> b!51450 (= b_free!1599 (not b_next!1599))))

(declare-fun tp!6881 () Bool)

(declare-fun b_and!2807 () Bool)

(assert (=> b!51450 (= tp!6881 b_and!2807)))

(declare-fun b!51440 () Bool)

(declare-fun e!33365 () Bool)

(declare-fun tp_is_empty!2215 () Bool)

(assert (=> b!51440 (= e!33365 tp_is_empty!2215)))

(declare-fun b!51441 () Bool)

(declare-fun e!33367 () Bool)

(assert (=> b!51441 (= e!33367 tp_is_empty!2215)))

(declare-fun b!51442 () Bool)

(declare-fun e!33366 () Bool)

(assert (=> b!51442 (= e!33366 tp_is_empty!2215)))

(declare-fun b!51444 () Bool)

(declare-fun res!29427 () Bool)

(declare-fun e!33369 () Bool)

(assert (=> b!51444 (=> (not res!29427) (not e!33369))))

(declare-datatypes ((V!2601 0))(
  ( (V!2602 (val!1152 Int)) )
))
(declare-datatypes ((array!3335 0))(
  ( (array!3336 (arr!1592 (Array (_ BitVec 32) (_ BitVec 64))) (size!1819 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!764 0))(
  ( (ValueCellFull!764 (v!2193 V!2601)) (EmptyCell!764) )
))
(declare-datatypes ((array!3337 0))(
  ( (array!3338 (arr!1593 (Array (_ BitVec 32) ValueCell!764)) (size!1820 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!436 0))(
  ( (LongMapFixedSize!437 (defaultEntry!1932 Int) (mask!5741 (_ BitVec 32)) (extraKeys!1823 (_ BitVec 32)) (zeroValue!1850 V!2601) (minValue!1850 V!2601) (_size!267 (_ BitVec 32)) (_keys!3548 array!3335) (_values!1915 array!3337) (_vacant!267 (_ BitVec 32))) )
))
(declare-fun newMap!16 () LongMapFixedSize!436)

(declare-fun valid!163 (LongMapFixedSize!436) Bool)

(assert (=> b!51444 (= res!29427 (valid!163 newMap!16))))

(declare-fun b!51445 () Bool)

(declare-datatypes ((Cell!258 0))(
  ( (Cell!259 (v!2194 LongMapFixedSize!436)) )
))
(declare-datatypes ((LongMap!258 0))(
  ( (LongMap!259 (underlying!140 Cell!258)) )
))
(declare-fun thiss!992 () LongMap!258)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!3335 (_ BitVec 32)) Bool)

(assert (=> b!51445 (= e!33369 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3548 (v!2194 (underlying!140 thiss!992))) (mask!5741 (v!2194 (underlying!140 thiss!992))))))))

(declare-fun b!51446 () Bool)

(declare-fun res!29431 () Bool)

(assert (=> b!51446 (=> (not res!29431) (not e!33369))))

(assert (=> b!51446 (= res!29431 (and (= (size!1820 (_values!1915 (v!2194 (underlying!140 thiss!992)))) (bvadd #b00000000000000000000000000000001 (mask!5741 (v!2194 (underlying!140 thiss!992))))) (= (size!1819 (_keys!3548 (v!2194 (underlying!140 thiss!992)))) (size!1820 (_values!1915 (v!2194 (underlying!140 thiss!992))))) (bvsge (mask!5741 (v!2194 (underlying!140 thiss!992))) #b00000000000000000000000000000000) (bvsge (extraKeys!1823 (v!2194 (underlying!140 thiss!992))) #b00000000000000000000000000000000) (bvsle (extraKeys!1823 (v!2194 (underlying!140 thiss!992))) #b00000000000000000000000000000011)))))

(declare-fun b!51447 () Bool)

(declare-fun e!33363 () Bool)

(declare-fun e!33357 () Bool)

(assert (=> b!51447 (= e!33363 e!33357)))

(declare-fun mapNonEmpty!2303 () Bool)

(declare-fun mapRes!2304 () Bool)

(declare-fun tp!6879 () Bool)

(assert (=> mapNonEmpty!2303 (= mapRes!2304 (and tp!6879 e!33366))))

(declare-fun mapKey!2304 () (_ BitVec 32))

(declare-fun mapRest!2304 () (Array (_ BitVec 32) ValueCell!764))

(declare-fun mapValue!2303 () ValueCell!764)

(assert (=> mapNonEmpty!2303 (= (arr!1593 (_values!1915 (v!2194 (underlying!140 thiss!992)))) (store mapRest!2304 mapKey!2304 mapValue!2303))))

(declare-fun b!51448 () Bool)

(declare-fun res!29430 () Bool)

(assert (=> b!51448 (=> (not res!29430) (not e!33369))))

(assert (=> b!51448 (= res!29430 (bvsge (bvadd #b00000000000000000000000000000001 (mask!5741 newMap!16)) (_size!267 (v!2194 (underlying!140 thiss!992)))))))

(declare-fun mapIsEmpty!2303 () Bool)

(assert (=> mapIsEmpty!2303 mapRes!2304))

(declare-fun b!51449 () Bool)

(declare-fun e!33368 () Bool)

(assert (=> b!51449 (= e!33368 (and e!33367 mapRes!2304))))

(declare-fun condMapEmpty!2304 () Bool)

(declare-fun mapDefault!2303 () ValueCell!764)

(assert (=> b!51449 (= condMapEmpty!2304 (= (arr!1593 (_values!1915 (v!2194 (underlying!140 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!764)) mapDefault!2303)))))

(declare-fun e!33359 () Bool)

(declare-fun e!33358 () Bool)

(declare-fun array_inv!957 (array!3335) Bool)

(declare-fun array_inv!958 (array!3337) Bool)

(assert (=> b!51450 (= e!33358 (and tp!6881 tp_is_empty!2215 (array_inv!957 (_keys!3548 newMap!16)) (array_inv!958 (_values!1915 newMap!16)) e!33359))))

(assert (=> b!51451 (= e!33357 (and tp!6882 tp_is_empty!2215 (array_inv!957 (_keys!3548 (v!2194 (underlying!140 thiss!992)))) (array_inv!958 (_values!1915 (v!2194 (underlying!140 thiss!992)))) e!33368))))

(declare-fun mapNonEmpty!2304 () Bool)

(declare-fun mapRes!2303 () Bool)

(declare-fun tp!6880 () Bool)

(assert (=> mapNonEmpty!2304 (= mapRes!2303 (and tp!6880 e!33365))))

(declare-fun mapValue!2304 () ValueCell!764)

(declare-fun mapRest!2303 () (Array (_ BitVec 32) ValueCell!764))

(declare-fun mapKey!2303 () (_ BitVec 32))

(assert (=> mapNonEmpty!2304 (= (arr!1593 (_values!1915 newMap!16)) (store mapRest!2303 mapKey!2303 mapValue!2304))))

(declare-fun b!51452 () Bool)

(declare-fun res!29432 () Bool)

(assert (=> b!51452 (=> (not res!29432) (not e!33369))))

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!51452 (= res!29432 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!1819 (_keys!3548 (v!2194 (underlying!140 thiss!992)))))))))

(declare-fun res!29429 () Bool)

(assert (=> start!8166 (=> (not res!29429) (not e!33369))))

(declare-fun valid!164 (LongMap!258) Bool)

(assert (=> start!8166 (= res!29429 (valid!164 thiss!992))))

(assert (=> start!8166 e!33369))

(declare-fun e!33364 () Bool)

(assert (=> start!8166 e!33364))

(assert (=> start!8166 true))

(assert (=> start!8166 e!33358))

(declare-fun b!51443 () Bool)

(assert (=> b!51443 (= e!33364 e!33363)))

(declare-fun b!51453 () Bool)

(declare-fun e!33361 () Bool)

(assert (=> b!51453 (= e!33361 tp_is_empty!2215)))

(declare-fun b!51454 () Bool)

(assert (=> b!51454 (= e!33359 (and e!33361 mapRes!2303))))

(declare-fun condMapEmpty!2303 () Bool)

(declare-fun mapDefault!2304 () ValueCell!764)

(assert (=> b!51454 (= condMapEmpty!2303 (= (arr!1593 (_values!1915 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!764)) mapDefault!2304)))))

(declare-fun mapIsEmpty!2304 () Bool)

(assert (=> mapIsEmpty!2304 mapRes!2303))

(declare-fun b!51455 () Bool)

(declare-fun res!29428 () Bool)

(assert (=> b!51455 (=> (not res!29428) (not e!33369))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!51455 (= res!29428 (validMask!0 (mask!5741 (v!2194 (underlying!140 thiss!992)))))))

(assert (= (and start!8166 res!29429) b!51452))

(assert (= (and b!51452 res!29432) b!51444))

(assert (= (and b!51444 res!29427) b!51448))

(assert (= (and b!51448 res!29430) b!51455))

(assert (= (and b!51455 res!29428) b!51446))

(assert (= (and b!51446 res!29431) b!51445))

(assert (= (and b!51449 condMapEmpty!2304) mapIsEmpty!2303))

(assert (= (and b!51449 (not condMapEmpty!2304)) mapNonEmpty!2303))

(get-info :version)

(assert (= (and mapNonEmpty!2303 ((_ is ValueCellFull!764) mapValue!2303)) b!51442))

(assert (= (and b!51449 ((_ is ValueCellFull!764) mapDefault!2303)) b!51441))

(assert (= b!51451 b!51449))

(assert (= b!51447 b!51451))

(assert (= b!51443 b!51447))

(assert (= start!8166 b!51443))

(assert (= (and b!51454 condMapEmpty!2303) mapIsEmpty!2304))

(assert (= (and b!51454 (not condMapEmpty!2303)) mapNonEmpty!2304))

(assert (= (and mapNonEmpty!2304 ((_ is ValueCellFull!764) mapValue!2304)) b!51440))

(assert (= (and b!51454 ((_ is ValueCellFull!764) mapDefault!2304)) b!51453))

(assert (= b!51450 b!51454))

(assert (= start!8166 b!51450))

(declare-fun m!44213 () Bool)

(assert (=> b!51444 m!44213))

(declare-fun m!44215 () Bool)

(assert (=> b!51445 m!44215))

(declare-fun m!44217 () Bool)

(assert (=> mapNonEmpty!2304 m!44217))

(declare-fun m!44219 () Bool)

(assert (=> b!51451 m!44219))

(declare-fun m!44221 () Bool)

(assert (=> b!51451 m!44221))

(declare-fun m!44223 () Bool)

(assert (=> mapNonEmpty!2303 m!44223))

(declare-fun m!44225 () Bool)

(assert (=> start!8166 m!44225))

(declare-fun m!44227 () Bool)

(assert (=> b!51450 m!44227))

(declare-fun m!44229 () Bool)

(assert (=> b!51450 m!44229))

(declare-fun m!44231 () Bool)

(assert (=> b!51455 m!44231))

(check-sat (not b_next!1599) b_and!2807 b_and!2805 (not b!51451) (not b!51445) (not b_next!1597) tp_is_empty!2215 (not b!51444) (not start!8166) (not mapNonEmpty!2304) (not mapNonEmpty!2303) (not b!51455) (not b!51450))
(check-sat b_and!2805 b_and!2807 (not b_next!1597) (not b_next!1599))
(get-model)

(declare-fun d!10345 () Bool)

(declare-fun res!29475 () Bool)

(declare-fun e!33450 () Bool)

(assert (=> d!10345 (=> (not res!29475) (not e!33450))))

(declare-fun simpleValid!38 (LongMapFixedSize!436) Bool)

(assert (=> d!10345 (= res!29475 (simpleValid!38 newMap!16))))

(assert (=> d!10345 (= (valid!163 newMap!16) e!33450)))

(declare-fun b!51558 () Bool)

(declare-fun res!29476 () Bool)

(assert (=> b!51558 (=> (not res!29476) (not e!33450))))

(declare-fun arrayCountValidKeys!0 (array!3335 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!51558 (= res!29476 (= (arrayCountValidKeys!0 (_keys!3548 newMap!16) #b00000000000000000000000000000000 (size!1819 (_keys!3548 newMap!16))) (_size!267 newMap!16)))))

(declare-fun b!51559 () Bool)

(declare-fun res!29477 () Bool)

(assert (=> b!51559 (=> (not res!29477) (not e!33450))))

(assert (=> b!51559 (= res!29477 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3548 newMap!16) (mask!5741 newMap!16)))))

(declare-fun b!51560 () Bool)

(declare-datatypes ((List!1319 0))(
  ( (Nil!1316) (Cons!1315 (h!1895 (_ BitVec 64)) (t!4353 List!1319)) )
))
(declare-fun arrayNoDuplicates!0 (array!3335 (_ BitVec 32) List!1319) Bool)

(assert (=> b!51560 (= e!33450 (arrayNoDuplicates!0 (_keys!3548 newMap!16) #b00000000000000000000000000000000 Nil!1316))))

(assert (= (and d!10345 res!29475) b!51558))

(assert (= (and b!51558 res!29476) b!51559))

(assert (= (and b!51559 res!29477) b!51560))

(declare-fun m!44273 () Bool)

(assert (=> d!10345 m!44273))

(declare-fun m!44275 () Bool)

(assert (=> b!51558 m!44275))

(declare-fun m!44277 () Bool)

(assert (=> b!51559 m!44277))

(declare-fun m!44279 () Bool)

(assert (=> b!51560 m!44279))

(assert (=> b!51444 d!10345))

(declare-fun b!51569 () Bool)

(declare-fun e!33458 () Bool)

(declare-fun call!3935 () Bool)

(assert (=> b!51569 (= e!33458 call!3935)))

(declare-fun b!51570 () Bool)

(declare-fun e!33459 () Bool)

(assert (=> b!51570 (= e!33458 e!33459)))

(declare-fun lt!21151 () (_ BitVec 64))

(assert (=> b!51570 (= lt!21151 (select (arr!1592 (_keys!3548 (v!2194 (underlying!140 thiss!992)))) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!1438 0))(
  ( (Unit!1439) )
))
(declare-fun lt!21150 () Unit!1438)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!3335 (_ BitVec 64) (_ BitVec 32)) Unit!1438)

(assert (=> b!51570 (= lt!21150 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!3548 (v!2194 (underlying!140 thiss!992))) lt!21151 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!3335 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!51570 (arrayContainsKey!0 (_keys!3548 (v!2194 (underlying!140 thiss!992))) lt!21151 #b00000000000000000000000000000000)))

(declare-fun lt!21152 () Unit!1438)

(assert (=> b!51570 (= lt!21152 lt!21150)))

(declare-fun res!29482 () Bool)

(declare-datatypes ((SeekEntryResult!217 0))(
  ( (MissingZero!217 (index!2990 (_ BitVec 32))) (Found!217 (index!2991 (_ BitVec 32))) (Intermediate!217 (undefined!1029 Bool) (index!2992 (_ BitVec 32)) (x!9383 (_ BitVec 32))) (Undefined!217) (MissingVacant!217 (index!2993 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!3335 (_ BitVec 32)) SeekEntryResult!217)

(assert (=> b!51570 (= res!29482 (= (seekEntryOrOpen!0 (select (arr!1592 (_keys!3548 (v!2194 (underlying!140 thiss!992)))) #b00000000000000000000000000000000) (_keys!3548 (v!2194 (underlying!140 thiss!992))) (mask!5741 (v!2194 (underlying!140 thiss!992)))) (Found!217 #b00000000000000000000000000000000)))))

(assert (=> b!51570 (=> (not res!29482) (not e!33459))))

(declare-fun d!10347 () Bool)

(declare-fun res!29483 () Bool)

(declare-fun e!33457 () Bool)

(assert (=> d!10347 (=> res!29483 e!33457)))

(assert (=> d!10347 (= res!29483 (bvsge #b00000000000000000000000000000000 (size!1819 (_keys!3548 (v!2194 (underlying!140 thiss!992))))))))

(assert (=> d!10347 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3548 (v!2194 (underlying!140 thiss!992))) (mask!5741 (v!2194 (underlying!140 thiss!992)))) e!33457)))

(declare-fun bm!3932 () Bool)

(assert (=> bm!3932 (= call!3935 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!3548 (v!2194 (underlying!140 thiss!992))) (mask!5741 (v!2194 (underlying!140 thiss!992)))))))

(declare-fun b!51571 () Bool)

(assert (=> b!51571 (= e!33457 e!33458)))

(declare-fun c!6891 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!51571 (= c!6891 (validKeyInArray!0 (select (arr!1592 (_keys!3548 (v!2194 (underlying!140 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun b!51572 () Bool)

(assert (=> b!51572 (= e!33459 call!3935)))

(assert (= (and d!10347 (not res!29483)) b!51571))

(assert (= (and b!51571 c!6891) b!51570))

(assert (= (and b!51571 (not c!6891)) b!51569))

(assert (= (and b!51570 res!29482) b!51572))

(assert (= (or b!51572 b!51569) bm!3932))

(declare-fun m!44281 () Bool)

(assert (=> b!51570 m!44281))

(declare-fun m!44283 () Bool)

(assert (=> b!51570 m!44283))

(declare-fun m!44285 () Bool)

(assert (=> b!51570 m!44285))

(assert (=> b!51570 m!44281))

(declare-fun m!44287 () Bool)

(assert (=> b!51570 m!44287))

(declare-fun m!44289 () Bool)

(assert (=> bm!3932 m!44289))

(assert (=> b!51571 m!44281))

(assert (=> b!51571 m!44281))

(declare-fun m!44291 () Bool)

(assert (=> b!51571 m!44291))

(assert (=> b!51445 d!10347))

(declare-fun d!10349 () Bool)

(assert (=> d!10349 (= (array_inv!957 (_keys!3548 newMap!16)) (bvsge (size!1819 (_keys!3548 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!51450 d!10349))

(declare-fun d!10351 () Bool)

(assert (=> d!10351 (= (array_inv!958 (_values!1915 newMap!16)) (bvsge (size!1820 (_values!1915 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!51450 d!10351))

(declare-fun d!10353 () Bool)

(assert (=> d!10353 (= (validMask!0 (mask!5741 (v!2194 (underlying!140 thiss!992)))) (and (or (= (mask!5741 (v!2194 (underlying!140 thiss!992))) #b00000000000000000000000000000111) (= (mask!5741 (v!2194 (underlying!140 thiss!992))) #b00000000000000000000000000001111) (= (mask!5741 (v!2194 (underlying!140 thiss!992))) #b00000000000000000000000000011111) (= (mask!5741 (v!2194 (underlying!140 thiss!992))) #b00000000000000000000000000111111) (= (mask!5741 (v!2194 (underlying!140 thiss!992))) #b00000000000000000000000001111111) (= (mask!5741 (v!2194 (underlying!140 thiss!992))) #b00000000000000000000000011111111) (= (mask!5741 (v!2194 (underlying!140 thiss!992))) #b00000000000000000000000111111111) (= (mask!5741 (v!2194 (underlying!140 thiss!992))) #b00000000000000000000001111111111) (= (mask!5741 (v!2194 (underlying!140 thiss!992))) #b00000000000000000000011111111111) (= (mask!5741 (v!2194 (underlying!140 thiss!992))) #b00000000000000000000111111111111) (= (mask!5741 (v!2194 (underlying!140 thiss!992))) #b00000000000000000001111111111111) (= (mask!5741 (v!2194 (underlying!140 thiss!992))) #b00000000000000000011111111111111) (= (mask!5741 (v!2194 (underlying!140 thiss!992))) #b00000000000000000111111111111111) (= (mask!5741 (v!2194 (underlying!140 thiss!992))) #b00000000000000001111111111111111) (= (mask!5741 (v!2194 (underlying!140 thiss!992))) #b00000000000000011111111111111111) (= (mask!5741 (v!2194 (underlying!140 thiss!992))) #b00000000000000111111111111111111) (= (mask!5741 (v!2194 (underlying!140 thiss!992))) #b00000000000001111111111111111111) (= (mask!5741 (v!2194 (underlying!140 thiss!992))) #b00000000000011111111111111111111) (= (mask!5741 (v!2194 (underlying!140 thiss!992))) #b00000000000111111111111111111111) (= (mask!5741 (v!2194 (underlying!140 thiss!992))) #b00000000001111111111111111111111) (= (mask!5741 (v!2194 (underlying!140 thiss!992))) #b00000000011111111111111111111111) (= (mask!5741 (v!2194 (underlying!140 thiss!992))) #b00000000111111111111111111111111) (= (mask!5741 (v!2194 (underlying!140 thiss!992))) #b00000001111111111111111111111111) (= (mask!5741 (v!2194 (underlying!140 thiss!992))) #b00000011111111111111111111111111) (= (mask!5741 (v!2194 (underlying!140 thiss!992))) #b00000111111111111111111111111111) (= (mask!5741 (v!2194 (underlying!140 thiss!992))) #b00001111111111111111111111111111) (= (mask!5741 (v!2194 (underlying!140 thiss!992))) #b00011111111111111111111111111111) (= (mask!5741 (v!2194 (underlying!140 thiss!992))) #b00111111111111111111111111111111)) (bvsle (mask!5741 (v!2194 (underlying!140 thiss!992))) #b00111111111111111111111111111111)))))

(assert (=> b!51455 d!10353))

(declare-fun d!10355 () Bool)

(assert (=> d!10355 (= (valid!164 thiss!992) (valid!163 (v!2194 (underlying!140 thiss!992))))))

(declare-fun bs!2381 () Bool)

(assert (= bs!2381 d!10355))

(declare-fun m!44293 () Bool)

(assert (=> bs!2381 m!44293))

(assert (=> start!8166 d!10355))

(declare-fun d!10357 () Bool)

(assert (=> d!10357 (= (array_inv!957 (_keys!3548 (v!2194 (underlying!140 thiss!992)))) (bvsge (size!1819 (_keys!3548 (v!2194 (underlying!140 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!51451 d!10357))

(declare-fun d!10359 () Bool)

(assert (=> d!10359 (= (array_inv!958 (_values!1915 (v!2194 (underlying!140 thiss!992)))) (bvsge (size!1820 (_values!1915 (v!2194 (underlying!140 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!51451 d!10359))

(declare-fun b!51579 () Bool)

(declare-fun e!33464 () Bool)

(assert (=> b!51579 (= e!33464 tp_is_empty!2215)))

(declare-fun condMapEmpty!2319 () Bool)

(declare-fun mapDefault!2319 () ValueCell!764)

(assert (=> mapNonEmpty!2304 (= condMapEmpty!2319 (= mapRest!2303 ((as const (Array (_ BitVec 32) ValueCell!764)) mapDefault!2319)))))

(declare-fun e!33465 () Bool)

(declare-fun mapRes!2319 () Bool)

(assert (=> mapNonEmpty!2304 (= tp!6880 (and e!33465 mapRes!2319))))

(declare-fun b!51580 () Bool)

(assert (=> b!51580 (= e!33465 tp_is_empty!2215)))

(declare-fun mapNonEmpty!2319 () Bool)

(declare-fun tp!6909 () Bool)

(assert (=> mapNonEmpty!2319 (= mapRes!2319 (and tp!6909 e!33464))))

(declare-fun mapValue!2319 () ValueCell!764)

(declare-fun mapKey!2319 () (_ BitVec 32))

(declare-fun mapRest!2319 () (Array (_ BitVec 32) ValueCell!764))

(assert (=> mapNonEmpty!2319 (= mapRest!2303 (store mapRest!2319 mapKey!2319 mapValue!2319))))

(declare-fun mapIsEmpty!2319 () Bool)

(assert (=> mapIsEmpty!2319 mapRes!2319))

(assert (= (and mapNonEmpty!2304 condMapEmpty!2319) mapIsEmpty!2319))

(assert (= (and mapNonEmpty!2304 (not condMapEmpty!2319)) mapNonEmpty!2319))

(assert (= (and mapNonEmpty!2319 ((_ is ValueCellFull!764) mapValue!2319)) b!51579))

(assert (= (and mapNonEmpty!2304 ((_ is ValueCellFull!764) mapDefault!2319)) b!51580))

(declare-fun m!44295 () Bool)

(assert (=> mapNonEmpty!2319 m!44295))

(declare-fun b!51581 () Bool)

(declare-fun e!33466 () Bool)

(assert (=> b!51581 (= e!33466 tp_is_empty!2215)))

(declare-fun condMapEmpty!2320 () Bool)

(declare-fun mapDefault!2320 () ValueCell!764)

(assert (=> mapNonEmpty!2303 (= condMapEmpty!2320 (= mapRest!2304 ((as const (Array (_ BitVec 32) ValueCell!764)) mapDefault!2320)))))

(declare-fun e!33467 () Bool)

(declare-fun mapRes!2320 () Bool)

(assert (=> mapNonEmpty!2303 (= tp!6879 (and e!33467 mapRes!2320))))

(declare-fun b!51582 () Bool)

(assert (=> b!51582 (= e!33467 tp_is_empty!2215)))

(declare-fun mapNonEmpty!2320 () Bool)

(declare-fun tp!6910 () Bool)

(assert (=> mapNonEmpty!2320 (= mapRes!2320 (and tp!6910 e!33466))))

(declare-fun mapValue!2320 () ValueCell!764)

(declare-fun mapRest!2320 () (Array (_ BitVec 32) ValueCell!764))

(declare-fun mapKey!2320 () (_ BitVec 32))

(assert (=> mapNonEmpty!2320 (= mapRest!2304 (store mapRest!2320 mapKey!2320 mapValue!2320))))

(declare-fun mapIsEmpty!2320 () Bool)

(assert (=> mapIsEmpty!2320 mapRes!2320))

(assert (= (and mapNonEmpty!2303 condMapEmpty!2320) mapIsEmpty!2320))

(assert (= (and mapNonEmpty!2303 (not condMapEmpty!2320)) mapNonEmpty!2320))

(assert (= (and mapNonEmpty!2320 ((_ is ValueCellFull!764) mapValue!2320)) b!51581))

(assert (= (and mapNonEmpty!2303 ((_ is ValueCellFull!764) mapDefault!2320)) b!51582))

(declare-fun m!44297 () Bool)

(assert (=> mapNonEmpty!2320 m!44297))

(check-sat (not b_next!1599) (not b!51560) (not b!51571) (not d!10345) (not mapNonEmpty!2319) (not d!10355) b_and!2807 b_and!2805 (not b!51558) (not b!51570) (not mapNonEmpty!2320) (not b_next!1597) tp_is_empty!2215 (not bm!3932) (not b!51559))
(check-sat b_and!2805 b_and!2807 (not b_next!1597) (not b_next!1599))
(get-model)

(declare-fun d!10361 () Bool)

(declare-fun res!29495 () Bool)

(declare-fun e!33470 () Bool)

(assert (=> d!10361 (=> (not res!29495) (not e!33470))))

(assert (=> d!10361 (= res!29495 (validMask!0 (mask!5741 newMap!16)))))

(assert (=> d!10361 (= (simpleValid!38 newMap!16) e!33470)))

(declare-fun b!51593 () Bool)

(declare-fun res!29492 () Bool)

(assert (=> b!51593 (=> (not res!29492) (not e!33470))))

(declare-fun size!1825 (LongMapFixedSize!436) (_ BitVec 32))

(assert (=> b!51593 (= res!29492 (= (size!1825 newMap!16) (bvadd (_size!267 newMap!16) (bvsdiv (bvadd (extraKeys!1823 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!51594 () Bool)

(assert (=> b!51594 (= e!33470 (and (bvsge (extraKeys!1823 newMap!16) #b00000000000000000000000000000000) (bvsle (extraKeys!1823 newMap!16) #b00000000000000000000000000000011) (bvsge (_vacant!267 newMap!16) #b00000000000000000000000000000000)))))

(declare-fun b!51591 () Bool)

(declare-fun res!29493 () Bool)

(assert (=> b!51591 (=> (not res!29493) (not e!33470))))

(assert (=> b!51591 (= res!29493 (and (= (size!1820 (_values!1915 newMap!16)) (bvadd (mask!5741 newMap!16) #b00000000000000000000000000000001)) (= (size!1819 (_keys!3548 newMap!16)) (size!1820 (_values!1915 newMap!16))) (bvsge (_size!267 newMap!16) #b00000000000000000000000000000000) (bvsle (_size!267 newMap!16) (bvadd (mask!5741 newMap!16) #b00000000000000000000000000000001))))))

(declare-fun b!51592 () Bool)

(declare-fun res!29494 () Bool)

(assert (=> b!51592 (=> (not res!29494) (not e!33470))))

(assert (=> b!51592 (= res!29494 (bvsge (size!1825 newMap!16) (_size!267 newMap!16)))))

(assert (= (and d!10361 res!29495) b!51591))

(assert (= (and b!51591 res!29493) b!51592))

(assert (= (and b!51592 res!29494) b!51593))

(assert (= (and b!51593 res!29492) b!51594))

(declare-fun m!44299 () Bool)

(assert (=> d!10361 m!44299))

(declare-fun m!44301 () Bool)

(assert (=> b!51593 m!44301))

(assert (=> b!51592 m!44301))

(assert (=> d!10345 d!10361))

(declare-fun b!51595 () Bool)

(declare-fun e!33472 () Bool)

(declare-fun call!3936 () Bool)

(assert (=> b!51595 (= e!33472 call!3936)))

(declare-fun b!51596 () Bool)

(declare-fun e!33473 () Bool)

(assert (=> b!51596 (= e!33472 e!33473)))

(declare-fun lt!21154 () (_ BitVec 64))

(assert (=> b!51596 (= lt!21154 (select (arr!1592 (_keys!3548 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!21153 () Unit!1438)

(assert (=> b!51596 (= lt!21153 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!3548 newMap!16) lt!21154 #b00000000000000000000000000000000))))

(assert (=> b!51596 (arrayContainsKey!0 (_keys!3548 newMap!16) lt!21154 #b00000000000000000000000000000000)))

(declare-fun lt!21155 () Unit!1438)

(assert (=> b!51596 (= lt!21155 lt!21153)))

(declare-fun res!29496 () Bool)

(assert (=> b!51596 (= res!29496 (= (seekEntryOrOpen!0 (select (arr!1592 (_keys!3548 newMap!16)) #b00000000000000000000000000000000) (_keys!3548 newMap!16) (mask!5741 newMap!16)) (Found!217 #b00000000000000000000000000000000)))))

(assert (=> b!51596 (=> (not res!29496) (not e!33473))))

(declare-fun d!10363 () Bool)

(declare-fun res!29497 () Bool)

(declare-fun e!33471 () Bool)

(assert (=> d!10363 (=> res!29497 e!33471)))

(assert (=> d!10363 (= res!29497 (bvsge #b00000000000000000000000000000000 (size!1819 (_keys!3548 newMap!16))))))

(assert (=> d!10363 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3548 newMap!16) (mask!5741 newMap!16)) e!33471)))

(declare-fun bm!3933 () Bool)

(assert (=> bm!3933 (= call!3936 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!3548 newMap!16) (mask!5741 newMap!16)))))

(declare-fun b!51597 () Bool)

(assert (=> b!51597 (= e!33471 e!33472)))

(declare-fun c!6892 () Bool)

(assert (=> b!51597 (= c!6892 (validKeyInArray!0 (select (arr!1592 (_keys!3548 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!51598 () Bool)

(assert (=> b!51598 (= e!33473 call!3936)))

(assert (= (and d!10363 (not res!29497)) b!51597))

(assert (= (and b!51597 c!6892) b!51596))

(assert (= (and b!51597 (not c!6892)) b!51595))

(assert (= (and b!51596 res!29496) b!51598))

(assert (= (or b!51598 b!51595) bm!3933))

(declare-fun m!44303 () Bool)

(assert (=> b!51596 m!44303))

(declare-fun m!44305 () Bool)

(assert (=> b!51596 m!44305))

(declare-fun m!44307 () Bool)

(assert (=> b!51596 m!44307))

(assert (=> b!51596 m!44303))

(declare-fun m!44309 () Bool)

(assert (=> b!51596 m!44309))

(declare-fun m!44311 () Bool)

(assert (=> bm!3933 m!44311))

(assert (=> b!51597 m!44303))

(assert (=> b!51597 m!44303))

(declare-fun m!44313 () Bool)

(assert (=> b!51597 m!44313))

(assert (=> b!51559 d!10363))

(declare-fun d!10365 () Bool)

(assert (=> d!10365 (arrayContainsKey!0 (_keys!3548 (v!2194 (underlying!140 thiss!992))) lt!21151 #b00000000000000000000000000000000)))

(declare-fun lt!21158 () Unit!1438)

(declare-fun choose!13 (array!3335 (_ BitVec 64) (_ BitVec 32)) Unit!1438)

(assert (=> d!10365 (= lt!21158 (choose!13 (_keys!3548 (v!2194 (underlying!140 thiss!992))) lt!21151 #b00000000000000000000000000000000))))

(assert (=> d!10365 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!10365 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!3548 (v!2194 (underlying!140 thiss!992))) lt!21151 #b00000000000000000000000000000000) lt!21158)))

(declare-fun bs!2382 () Bool)

(assert (= bs!2382 d!10365))

(assert (=> bs!2382 m!44285))

(declare-fun m!44315 () Bool)

(assert (=> bs!2382 m!44315))

(assert (=> b!51570 d!10365))

(declare-fun d!10367 () Bool)

(declare-fun res!29502 () Bool)

(declare-fun e!33478 () Bool)

(assert (=> d!10367 (=> res!29502 e!33478)))

(assert (=> d!10367 (= res!29502 (= (select (arr!1592 (_keys!3548 (v!2194 (underlying!140 thiss!992)))) #b00000000000000000000000000000000) lt!21151))))

(assert (=> d!10367 (= (arrayContainsKey!0 (_keys!3548 (v!2194 (underlying!140 thiss!992))) lt!21151 #b00000000000000000000000000000000) e!33478)))

(declare-fun b!51603 () Bool)

(declare-fun e!33479 () Bool)

(assert (=> b!51603 (= e!33478 e!33479)))

(declare-fun res!29503 () Bool)

(assert (=> b!51603 (=> (not res!29503) (not e!33479))))

(assert (=> b!51603 (= res!29503 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1819 (_keys!3548 (v!2194 (underlying!140 thiss!992))))))))

(declare-fun b!51604 () Bool)

(assert (=> b!51604 (= e!33479 (arrayContainsKey!0 (_keys!3548 (v!2194 (underlying!140 thiss!992))) lt!21151 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!10367 (not res!29502)) b!51603))

(assert (= (and b!51603 res!29503) b!51604))

(assert (=> d!10367 m!44281))

(declare-fun m!44317 () Bool)

(assert (=> b!51604 m!44317))

(assert (=> b!51570 d!10367))

(declare-fun b!51617 () Bool)

(declare-fun e!33487 () SeekEntryResult!217)

(declare-fun lt!21165 () SeekEntryResult!217)

(assert (=> b!51617 (= e!33487 (Found!217 (index!2992 lt!21165)))))

(declare-fun b!51618 () Bool)

(declare-fun e!33486 () SeekEntryResult!217)

(assert (=> b!51618 (= e!33486 e!33487)))

(declare-fun lt!21166 () (_ BitVec 64))

(assert (=> b!51618 (= lt!21166 (select (arr!1592 (_keys!3548 (v!2194 (underlying!140 thiss!992)))) (index!2992 lt!21165)))))

(declare-fun c!6899 () Bool)

(assert (=> b!51618 (= c!6899 (= lt!21166 (select (arr!1592 (_keys!3548 (v!2194 (underlying!140 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun b!51619 () Bool)

(declare-fun e!33488 () SeekEntryResult!217)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!3335 (_ BitVec 32)) SeekEntryResult!217)

(assert (=> b!51619 (= e!33488 (seekKeyOrZeroReturnVacant!0 (x!9383 lt!21165) (index!2992 lt!21165) (index!2992 lt!21165) (select (arr!1592 (_keys!3548 (v!2194 (underlying!140 thiss!992)))) #b00000000000000000000000000000000) (_keys!3548 (v!2194 (underlying!140 thiss!992))) (mask!5741 (v!2194 (underlying!140 thiss!992)))))))

(declare-fun b!51620 () Bool)

(assert (=> b!51620 (= e!33486 Undefined!217)))

(declare-fun b!51621 () Bool)

(assert (=> b!51621 (= e!33488 (MissingZero!217 (index!2992 lt!21165)))))

(declare-fun d!10369 () Bool)

(declare-fun lt!21167 () SeekEntryResult!217)

(assert (=> d!10369 (and (or ((_ is Undefined!217) lt!21167) (not ((_ is Found!217) lt!21167)) (and (bvsge (index!2991 lt!21167) #b00000000000000000000000000000000) (bvslt (index!2991 lt!21167) (size!1819 (_keys!3548 (v!2194 (underlying!140 thiss!992))))))) (or ((_ is Undefined!217) lt!21167) ((_ is Found!217) lt!21167) (not ((_ is MissingZero!217) lt!21167)) (and (bvsge (index!2990 lt!21167) #b00000000000000000000000000000000) (bvslt (index!2990 lt!21167) (size!1819 (_keys!3548 (v!2194 (underlying!140 thiss!992))))))) (or ((_ is Undefined!217) lt!21167) ((_ is Found!217) lt!21167) ((_ is MissingZero!217) lt!21167) (not ((_ is MissingVacant!217) lt!21167)) (and (bvsge (index!2993 lt!21167) #b00000000000000000000000000000000) (bvslt (index!2993 lt!21167) (size!1819 (_keys!3548 (v!2194 (underlying!140 thiss!992))))))) (or ((_ is Undefined!217) lt!21167) (ite ((_ is Found!217) lt!21167) (= (select (arr!1592 (_keys!3548 (v!2194 (underlying!140 thiss!992)))) (index!2991 lt!21167)) (select (arr!1592 (_keys!3548 (v!2194 (underlying!140 thiss!992)))) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!217) lt!21167) (= (select (arr!1592 (_keys!3548 (v!2194 (underlying!140 thiss!992)))) (index!2990 lt!21167)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!217) lt!21167) (= (select (arr!1592 (_keys!3548 (v!2194 (underlying!140 thiss!992)))) (index!2993 lt!21167)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!10369 (= lt!21167 e!33486)))

(declare-fun c!6901 () Bool)

(assert (=> d!10369 (= c!6901 (and ((_ is Intermediate!217) lt!21165) (undefined!1029 lt!21165)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!3335 (_ BitVec 32)) SeekEntryResult!217)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!10369 (= lt!21165 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!1592 (_keys!3548 (v!2194 (underlying!140 thiss!992)))) #b00000000000000000000000000000000) (mask!5741 (v!2194 (underlying!140 thiss!992)))) (select (arr!1592 (_keys!3548 (v!2194 (underlying!140 thiss!992)))) #b00000000000000000000000000000000) (_keys!3548 (v!2194 (underlying!140 thiss!992))) (mask!5741 (v!2194 (underlying!140 thiss!992)))))))

(assert (=> d!10369 (validMask!0 (mask!5741 (v!2194 (underlying!140 thiss!992))))))

(assert (=> d!10369 (= (seekEntryOrOpen!0 (select (arr!1592 (_keys!3548 (v!2194 (underlying!140 thiss!992)))) #b00000000000000000000000000000000) (_keys!3548 (v!2194 (underlying!140 thiss!992))) (mask!5741 (v!2194 (underlying!140 thiss!992)))) lt!21167)))

(declare-fun b!51622 () Bool)

(declare-fun c!6900 () Bool)

(assert (=> b!51622 (= c!6900 (= lt!21166 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!51622 (= e!33487 e!33488)))

(assert (= (and d!10369 c!6901) b!51620))

(assert (= (and d!10369 (not c!6901)) b!51618))

(assert (= (and b!51618 c!6899) b!51617))

(assert (= (and b!51618 (not c!6899)) b!51622))

(assert (= (and b!51622 c!6900) b!51621))

(assert (= (and b!51622 (not c!6900)) b!51619))

(declare-fun m!44319 () Bool)

(assert (=> b!51618 m!44319))

(assert (=> b!51619 m!44281))

(declare-fun m!44321 () Bool)

(assert (=> b!51619 m!44321))

(declare-fun m!44323 () Bool)

(assert (=> d!10369 m!44323))

(assert (=> d!10369 m!44281))

(declare-fun m!44325 () Bool)

(assert (=> d!10369 m!44325))

(assert (=> d!10369 m!44281))

(assert (=> d!10369 m!44323))

(assert (=> d!10369 m!44231))

(declare-fun m!44327 () Bool)

(assert (=> d!10369 m!44327))

(declare-fun m!44329 () Bool)

(assert (=> d!10369 m!44329))

(declare-fun m!44331 () Bool)

(assert (=> d!10369 m!44331))

(assert (=> b!51570 d!10369))

(declare-fun d!10371 () Bool)

(declare-fun res!29504 () Bool)

(declare-fun e!33489 () Bool)

(assert (=> d!10371 (=> (not res!29504) (not e!33489))))

(assert (=> d!10371 (= res!29504 (simpleValid!38 (v!2194 (underlying!140 thiss!992))))))

(assert (=> d!10371 (= (valid!163 (v!2194 (underlying!140 thiss!992))) e!33489)))

(declare-fun b!51623 () Bool)

(declare-fun res!29505 () Bool)

(assert (=> b!51623 (=> (not res!29505) (not e!33489))))

(assert (=> b!51623 (= res!29505 (= (arrayCountValidKeys!0 (_keys!3548 (v!2194 (underlying!140 thiss!992))) #b00000000000000000000000000000000 (size!1819 (_keys!3548 (v!2194 (underlying!140 thiss!992))))) (_size!267 (v!2194 (underlying!140 thiss!992)))))))

(declare-fun b!51624 () Bool)

(declare-fun res!29506 () Bool)

(assert (=> b!51624 (=> (not res!29506) (not e!33489))))

(assert (=> b!51624 (= res!29506 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3548 (v!2194 (underlying!140 thiss!992))) (mask!5741 (v!2194 (underlying!140 thiss!992)))))))

(declare-fun b!51625 () Bool)

(assert (=> b!51625 (= e!33489 (arrayNoDuplicates!0 (_keys!3548 (v!2194 (underlying!140 thiss!992))) #b00000000000000000000000000000000 Nil!1316))))

(assert (= (and d!10371 res!29504) b!51623))

(assert (= (and b!51623 res!29505) b!51624))

(assert (= (and b!51624 res!29506) b!51625))

(declare-fun m!44333 () Bool)

(assert (=> d!10371 m!44333))

(declare-fun m!44335 () Bool)

(assert (=> b!51623 m!44335))

(assert (=> b!51624 m!44215))

(declare-fun m!44337 () Bool)

(assert (=> b!51625 m!44337))

(assert (=> d!10355 d!10371))

(declare-fun bm!3936 () Bool)

(declare-fun call!3939 () (_ BitVec 32))

(assert (=> bm!3936 (= call!3939 (arrayCountValidKeys!0 (_keys!3548 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1819 (_keys!3548 newMap!16))))))

(declare-fun d!10373 () Bool)

(declare-fun lt!21170 () (_ BitVec 32))

(assert (=> d!10373 (and (bvsge lt!21170 #b00000000000000000000000000000000) (bvsle lt!21170 (bvsub (size!1819 (_keys!3548 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun e!33495 () (_ BitVec 32))

(assert (=> d!10373 (= lt!21170 e!33495)))

(declare-fun c!6907 () Bool)

(assert (=> d!10373 (= c!6907 (bvsge #b00000000000000000000000000000000 (size!1819 (_keys!3548 newMap!16))))))

(assert (=> d!10373 (and (bvsle #b00000000000000000000000000000000 (size!1819 (_keys!3548 newMap!16))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!1819 (_keys!3548 newMap!16)) (size!1819 (_keys!3548 newMap!16))))))

(assert (=> d!10373 (= (arrayCountValidKeys!0 (_keys!3548 newMap!16) #b00000000000000000000000000000000 (size!1819 (_keys!3548 newMap!16))) lt!21170)))

(declare-fun b!51634 () Bool)

(declare-fun e!33494 () (_ BitVec 32))

(assert (=> b!51634 (= e!33494 call!3939)))

(declare-fun b!51635 () Bool)

(assert (=> b!51635 (= e!33495 #b00000000000000000000000000000000)))

(declare-fun b!51636 () Bool)

(assert (=> b!51636 (= e!33494 (bvadd #b00000000000000000000000000000001 call!3939))))

(declare-fun b!51637 () Bool)

(assert (=> b!51637 (= e!33495 e!33494)))

(declare-fun c!6906 () Bool)

(assert (=> b!51637 (= c!6906 (validKeyInArray!0 (select (arr!1592 (_keys!3548 newMap!16)) #b00000000000000000000000000000000)))))

(assert (= (and d!10373 c!6907) b!51635))

(assert (= (and d!10373 (not c!6907)) b!51637))

(assert (= (and b!51637 c!6906) b!51636))

(assert (= (and b!51637 (not c!6906)) b!51634))

(assert (= (or b!51636 b!51634) bm!3936))

(declare-fun m!44339 () Bool)

(assert (=> bm!3936 m!44339))

(assert (=> b!51637 m!44303))

(assert (=> b!51637 m!44303))

(assert (=> b!51637 m!44313))

(assert (=> b!51558 d!10373))

(declare-fun d!10375 () Bool)

(assert (=> d!10375 (= (validKeyInArray!0 (select (arr!1592 (_keys!3548 (v!2194 (underlying!140 thiss!992)))) #b00000000000000000000000000000000)) (and (not (= (select (arr!1592 (_keys!3548 (v!2194 (underlying!140 thiss!992)))) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1592 (_keys!3548 (v!2194 (underlying!140 thiss!992)))) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!51571 d!10375))

(declare-fun b!51648 () Bool)

(declare-fun e!33504 () Bool)

(declare-fun call!3942 () Bool)

(assert (=> b!51648 (= e!33504 call!3942)))

(declare-fun b!51649 () Bool)

(declare-fun e!33506 () Bool)

(declare-fun e!33505 () Bool)

(assert (=> b!51649 (= e!33506 e!33505)))

(declare-fun res!29515 () Bool)

(assert (=> b!51649 (=> (not res!29515) (not e!33505))))

(declare-fun e!33507 () Bool)

(assert (=> b!51649 (= res!29515 (not e!33507))))

(declare-fun res!29514 () Bool)

(assert (=> b!51649 (=> (not res!29514) (not e!33507))))

(assert (=> b!51649 (= res!29514 (validKeyInArray!0 (select (arr!1592 (_keys!3548 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!51650 () Bool)

(declare-fun contains!614 (List!1319 (_ BitVec 64)) Bool)

(assert (=> b!51650 (= e!33507 (contains!614 Nil!1316 (select (arr!1592 (_keys!3548 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun bm!3939 () Bool)

(declare-fun c!6910 () Bool)

(assert (=> bm!3939 (= call!3942 (arrayNoDuplicates!0 (_keys!3548 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!6910 (Cons!1315 (select (arr!1592 (_keys!3548 newMap!16)) #b00000000000000000000000000000000) Nil!1316) Nil!1316)))))

(declare-fun b!51651 () Bool)

(assert (=> b!51651 (= e!33505 e!33504)))

(assert (=> b!51651 (= c!6910 (validKeyInArray!0 (select (arr!1592 (_keys!3548 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun d!10377 () Bool)

(declare-fun res!29513 () Bool)

(assert (=> d!10377 (=> res!29513 e!33506)))

(assert (=> d!10377 (= res!29513 (bvsge #b00000000000000000000000000000000 (size!1819 (_keys!3548 newMap!16))))))

(assert (=> d!10377 (= (arrayNoDuplicates!0 (_keys!3548 newMap!16) #b00000000000000000000000000000000 Nil!1316) e!33506)))

(declare-fun b!51652 () Bool)

(assert (=> b!51652 (= e!33504 call!3942)))

(assert (= (and d!10377 (not res!29513)) b!51649))

(assert (= (and b!51649 res!29514) b!51650))

(assert (= (and b!51649 res!29515) b!51651))

(assert (= (and b!51651 c!6910) b!51652))

(assert (= (and b!51651 (not c!6910)) b!51648))

(assert (= (or b!51652 b!51648) bm!3939))

(assert (=> b!51649 m!44303))

(assert (=> b!51649 m!44303))

(assert (=> b!51649 m!44313))

(assert (=> b!51650 m!44303))

(assert (=> b!51650 m!44303))

(declare-fun m!44341 () Bool)

(assert (=> b!51650 m!44341))

(assert (=> bm!3939 m!44303))

(declare-fun m!44343 () Bool)

(assert (=> bm!3939 m!44343))

(assert (=> b!51651 m!44303))

(assert (=> b!51651 m!44303))

(assert (=> b!51651 m!44313))

(assert (=> b!51560 d!10377))

(declare-fun b!51653 () Bool)

(declare-fun e!33509 () Bool)

(declare-fun call!3943 () Bool)

(assert (=> b!51653 (= e!33509 call!3943)))

(declare-fun b!51654 () Bool)

(declare-fun e!33510 () Bool)

(assert (=> b!51654 (= e!33509 e!33510)))

(declare-fun lt!21172 () (_ BitVec 64))

(assert (=> b!51654 (= lt!21172 (select (arr!1592 (_keys!3548 (v!2194 (underlying!140 thiss!992)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!21171 () Unit!1438)

(assert (=> b!51654 (= lt!21171 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!3548 (v!2194 (underlying!140 thiss!992))) lt!21172 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!51654 (arrayContainsKey!0 (_keys!3548 (v!2194 (underlying!140 thiss!992))) lt!21172 #b00000000000000000000000000000000)))

(declare-fun lt!21173 () Unit!1438)

(assert (=> b!51654 (= lt!21173 lt!21171)))

(declare-fun res!29516 () Bool)

(assert (=> b!51654 (= res!29516 (= (seekEntryOrOpen!0 (select (arr!1592 (_keys!3548 (v!2194 (underlying!140 thiss!992)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (_keys!3548 (v!2194 (underlying!140 thiss!992))) (mask!5741 (v!2194 (underlying!140 thiss!992)))) (Found!217 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!51654 (=> (not res!29516) (not e!33510))))

(declare-fun d!10379 () Bool)

(declare-fun res!29517 () Bool)

(declare-fun e!33508 () Bool)

(assert (=> d!10379 (=> res!29517 e!33508)))

(assert (=> d!10379 (= res!29517 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1819 (_keys!3548 (v!2194 (underlying!140 thiss!992))))))))

(assert (=> d!10379 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!3548 (v!2194 (underlying!140 thiss!992))) (mask!5741 (v!2194 (underlying!140 thiss!992)))) e!33508)))

(declare-fun bm!3940 () Bool)

(assert (=> bm!3940 (= call!3943 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (_keys!3548 (v!2194 (underlying!140 thiss!992))) (mask!5741 (v!2194 (underlying!140 thiss!992)))))))

(declare-fun b!51655 () Bool)

(assert (=> b!51655 (= e!33508 e!33509)))

(declare-fun c!6911 () Bool)

(assert (=> b!51655 (= c!6911 (validKeyInArray!0 (select (arr!1592 (_keys!3548 (v!2194 (underlying!140 thiss!992)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!51656 () Bool)

(assert (=> b!51656 (= e!33510 call!3943)))

(assert (= (and d!10379 (not res!29517)) b!51655))

(assert (= (and b!51655 c!6911) b!51654))

(assert (= (and b!51655 (not c!6911)) b!51653))

(assert (= (and b!51654 res!29516) b!51656))

(assert (= (or b!51656 b!51653) bm!3940))

(declare-fun m!44345 () Bool)

(assert (=> b!51654 m!44345))

(declare-fun m!44347 () Bool)

(assert (=> b!51654 m!44347))

(declare-fun m!44349 () Bool)

(assert (=> b!51654 m!44349))

(assert (=> b!51654 m!44345))

(declare-fun m!44351 () Bool)

(assert (=> b!51654 m!44351))

(declare-fun m!44353 () Bool)

(assert (=> bm!3940 m!44353))

(assert (=> b!51655 m!44345))

(assert (=> b!51655 m!44345))

(declare-fun m!44355 () Bool)

(assert (=> b!51655 m!44355))

(assert (=> bm!3932 d!10379))

(declare-fun b!51657 () Bool)

(declare-fun e!33511 () Bool)

(assert (=> b!51657 (= e!33511 tp_is_empty!2215)))

(declare-fun condMapEmpty!2321 () Bool)

(declare-fun mapDefault!2321 () ValueCell!764)

(assert (=> mapNonEmpty!2320 (= condMapEmpty!2321 (= mapRest!2320 ((as const (Array (_ BitVec 32) ValueCell!764)) mapDefault!2321)))))

(declare-fun e!33512 () Bool)

(declare-fun mapRes!2321 () Bool)

(assert (=> mapNonEmpty!2320 (= tp!6910 (and e!33512 mapRes!2321))))

(declare-fun b!51658 () Bool)

(assert (=> b!51658 (= e!33512 tp_is_empty!2215)))

(declare-fun mapNonEmpty!2321 () Bool)

(declare-fun tp!6911 () Bool)

(assert (=> mapNonEmpty!2321 (= mapRes!2321 (and tp!6911 e!33511))))

(declare-fun mapValue!2321 () ValueCell!764)

(declare-fun mapRest!2321 () (Array (_ BitVec 32) ValueCell!764))

(declare-fun mapKey!2321 () (_ BitVec 32))

(assert (=> mapNonEmpty!2321 (= mapRest!2320 (store mapRest!2321 mapKey!2321 mapValue!2321))))

(declare-fun mapIsEmpty!2321 () Bool)

(assert (=> mapIsEmpty!2321 mapRes!2321))

(assert (= (and mapNonEmpty!2320 condMapEmpty!2321) mapIsEmpty!2321))

(assert (= (and mapNonEmpty!2320 (not condMapEmpty!2321)) mapNonEmpty!2321))

(assert (= (and mapNonEmpty!2321 ((_ is ValueCellFull!764) mapValue!2321)) b!51657))

(assert (= (and mapNonEmpty!2320 ((_ is ValueCellFull!764) mapDefault!2321)) b!51658))

(declare-fun m!44357 () Bool)

(assert (=> mapNonEmpty!2321 m!44357))

(declare-fun b!51659 () Bool)

(declare-fun e!33513 () Bool)

(assert (=> b!51659 (= e!33513 tp_is_empty!2215)))

(declare-fun condMapEmpty!2322 () Bool)

(declare-fun mapDefault!2322 () ValueCell!764)

(assert (=> mapNonEmpty!2319 (= condMapEmpty!2322 (= mapRest!2319 ((as const (Array (_ BitVec 32) ValueCell!764)) mapDefault!2322)))))

(declare-fun e!33514 () Bool)

(declare-fun mapRes!2322 () Bool)

(assert (=> mapNonEmpty!2319 (= tp!6909 (and e!33514 mapRes!2322))))

(declare-fun b!51660 () Bool)

(assert (=> b!51660 (= e!33514 tp_is_empty!2215)))

(declare-fun mapNonEmpty!2322 () Bool)

(declare-fun tp!6912 () Bool)

(assert (=> mapNonEmpty!2322 (= mapRes!2322 (and tp!6912 e!33513))))

(declare-fun mapRest!2322 () (Array (_ BitVec 32) ValueCell!764))

(declare-fun mapValue!2322 () ValueCell!764)

(declare-fun mapKey!2322 () (_ BitVec 32))

(assert (=> mapNonEmpty!2322 (= mapRest!2319 (store mapRest!2322 mapKey!2322 mapValue!2322))))

(declare-fun mapIsEmpty!2322 () Bool)

(assert (=> mapIsEmpty!2322 mapRes!2322))

(assert (= (and mapNonEmpty!2319 condMapEmpty!2322) mapIsEmpty!2322))

(assert (= (and mapNonEmpty!2319 (not condMapEmpty!2322)) mapNonEmpty!2322))

(assert (= (and mapNonEmpty!2322 ((_ is ValueCellFull!764) mapValue!2322)) b!51659))

(assert (= (and mapNonEmpty!2319 ((_ is ValueCellFull!764) mapDefault!2322)) b!51660))

(declare-fun m!44359 () Bool)

(assert (=> mapNonEmpty!2322 m!44359))

(check-sat (not bm!3940) (not b!51624) (not d!10369) (not b!51593) (not d!10365) (not b!51604) (not b!51637) (not b_next!1597) tp_is_empty!2215 (not b!51623) (not bm!3936) (not bm!3933) (not b!51592) (not b_next!1599) (not b!51651) (not d!10371) (not mapNonEmpty!2321) (not b!51654) (not b!51597) b_and!2807 b_and!2805 (not b!51596) (not b!51655) (not b!51619) (not d!10361) (not b!51650) (not bm!3939) (not b!51625) (not b!51649) (not mapNonEmpty!2322))
(check-sat b_and!2805 b_and!2807 (not b_next!1597) (not b_next!1599))
