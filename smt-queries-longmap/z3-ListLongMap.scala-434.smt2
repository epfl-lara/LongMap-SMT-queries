; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!8166 () Bool)

(assert start!8166)

(declare-fun b!51431 () Bool)

(declare-fun b_free!1597 () Bool)

(declare-fun b_next!1597 () Bool)

(assert (=> b!51431 (= b_free!1597 (not b_next!1597))))

(declare-fun tp!6879 () Bool)

(declare-fun b_and!2809 () Bool)

(assert (=> b!51431 (= tp!6879 b_and!2809)))

(declare-fun b!51442 () Bool)

(declare-fun b_free!1599 () Bool)

(declare-fun b_next!1599 () Bool)

(assert (=> b!51442 (= b_free!1599 (not b_next!1599))))

(declare-fun tp!6882 () Bool)

(declare-fun b_and!2811 () Bool)

(assert (=> b!51442 (= tp!6882 b_and!2811)))

(declare-fun tp_is_empty!2215 () Bool)

(declare-datatypes ((V!2601 0))(
  ( (V!2602 (val!1152 Int)) )
))
(declare-datatypes ((array!3329 0))(
  ( (array!3330 (arr!1588 (Array (_ BitVec 32) (_ BitVec 64))) (size!1816 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!764 0))(
  ( (ValueCellFull!764 (v!2191 V!2601)) (EmptyCell!764) )
))
(declare-datatypes ((array!3331 0))(
  ( (array!3332 (arr!1589 (Array (_ BitVec 32) ValueCell!764)) (size!1817 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!436 0))(
  ( (LongMapFixedSize!437 (defaultEntry!1932 Int) (mask!5740 (_ BitVec 32)) (extraKeys!1823 (_ BitVec 32)) (zeroValue!1850 V!2601) (minValue!1850 V!2601) (_size!267 (_ BitVec 32)) (_keys!3547 array!3329) (_values!1915 array!3331) (_vacant!267 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!260 0))(
  ( (Cell!261 (v!2192 LongMapFixedSize!436)) )
))
(declare-datatypes ((LongMap!260 0))(
  ( (LongMap!261 (underlying!141 Cell!260)) )
))
(declare-fun thiss!992 () LongMap!260)

(declare-fun e!33354 () Bool)

(declare-fun e!33362 () Bool)

(declare-fun array_inv!973 (array!3329) Bool)

(declare-fun array_inv!974 (array!3331) Bool)

(assert (=> b!51431 (= e!33362 (and tp!6879 tp_is_empty!2215 (array_inv!973 (_keys!3547 (v!2192 (underlying!141 thiss!992)))) (array_inv!974 (_values!1915 (v!2192 (underlying!141 thiss!992)))) e!33354))))

(declare-fun b!51432 () Bool)

(declare-fun res!29435 () Bool)

(declare-fun e!33355 () Bool)

(assert (=> b!51432 (=> (not res!29435) (not e!33355))))

(declare-fun newMap!16 () LongMapFixedSize!436)

(declare-fun valid!160 (LongMapFixedSize!436) Bool)

(assert (=> b!51432 (= res!29435 (valid!160 newMap!16))))

(declare-fun b!51433 () Bool)

(declare-fun e!33351 () Bool)

(assert (=> b!51433 (= e!33351 tp_is_empty!2215)))

(declare-fun mapIsEmpty!2303 () Bool)

(declare-fun mapRes!2303 () Bool)

(assert (=> mapIsEmpty!2303 mapRes!2303))

(declare-fun b!51434 () Bool)

(declare-fun res!29433 () Bool)

(assert (=> b!51434 (=> (not res!29433) (not e!33355))))

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!51434 (= res!29433 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!1816 (_keys!3547 (v!2192 (underlying!141 thiss!992)))))))))

(declare-fun b!51435 () Bool)

(declare-fun e!33352 () Bool)

(assert (=> b!51435 (= e!33352 tp_is_empty!2215)))

(declare-fun b!51436 () Bool)

(declare-fun e!33361 () Bool)

(assert (=> b!51436 (= e!33361 tp_is_empty!2215)))

(declare-fun b!51437 () Bool)

(declare-fun res!29434 () Bool)

(assert (=> b!51437 (=> (not res!29434) (not e!33355))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!51437 (= res!29434 (validMask!0 (mask!5740 (v!2192 (underlying!141 thiss!992)))))))

(declare-fun b!51438 () Bool)

(declare-fun res!29432 () Bool)

(assert (=> b!51438 (=> (not res!29432) (not e!33355))))

(assert (=> b!51438 (= res!29432 (bvsge (bvadd #b00000000000000000000000000000001 (mask!5740 newMap!16)) (_size!267 (v!2192 (underlying!141 thiss!992)))))))

(declare-fun b!51439 () Bool)

(declare-fun res!29436 () Bool)

(assert (=> b!51439 (=> (not res!29436) (not e!33355))))

(assert (=> b!51439 (= res!29436 (and (= (size!1817 (_values!1915 (v!2192 (underlying!141 thiss!992)))) (bvadd #b00000000000000000000000000000001 (mask!5740 (v!2192 (underlying!141 thiss!992))))) (= (size!1816 (_keys!3547 (v!2192 (underlying!141 thiss!992)))) (size!1817 (_values!1915 (v!2192 (underlying!141 thiss!992))))) (bvsge (mask!5740 (v!2192 (underlying!141 thiss!992))) #b00000000000000000000000000000000) (bvsge (extraKeys!1823 (v!2192 (underlying!141 thiss!992))) #b00000000000000000000000000000000) (bvsle (extraKeys!1823 (v!2192 (underlying!141 thiss!992))) #b00000000000000000000000000000011)))))

(declare-fun b!51440 () Bool)

(declare-fun e!33360 () Bool)

(assert (=> b!51440 (= e!33360 e!33362)))

(declare-fun b!51441 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!3329 (_ BitVec 32)) Bool)

(assert (=> b!51441 (= e!33355 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3547 (v!2192 (underlying!141 thiss!992))) (mask!5740 (v!2192 (underlying!141 thiss!992))))))))

(declare-fun mapNonEmpty!2303 () Bool)

(declare-fun tp!6880 () Bool)

(assert (=> mapNonEmpty!2303 (= mapRes!2303 (and tp!6880 e!33361))))

(declare-fun mapValue!2303 () ValueCell!764)

(declare-fun mapKey!2303 () (_ BitVec 32))

(declare-fun mapRest!2304 () (Array (_ BitVec 32) ValueCell!764))

(assert (=> mapNonEmpty!2303 (= (arr!1589 (_values!1915 newMap!16)) (store mapRest!2304 mapKey!2303 mapValue!2303))))

(declare-fun mapIsEmpty!2304 () Bool)

(declare-fun mapRes!2304 () Bool)

(assert (=> mapIsEmpty!2304 mapRes!2304))

(declare-fun e!33358 () Bool)

(declare-fun e!33363 () Bool)

(assert (=> b!51442 (= e!33358 (and tp!6882 tp_is_empty!2215 (array_inv!973 (_keys!3547 newMap!16)) (array_inv!974 (_values!1915 newMap!16)) e!33363))))

(declare-fun mapNonEmpty!2304 () Bool)

(declare-fun tp!6881 () Bool)

(assert (=> mapNonEmpty!2304 (= mapRes!2304 (and tp!6881 e!33351))))

(declare-fun mapRest!2303 () (Array (_ BitVec 32) ValueCell!764))

(declare-fun mapValue!2304 () ValueCell!764)

(declare-fun mapKey!2304 () (_ BitVec 32))

(assert (=> mapNonEmpty!2304 (= (arr!1589 (_values!1915 (v!2192 (underlying!141 thiss!992)))) (store mapRest!2303 mapKey!2304 mapValue!2304))))

(declare-fun res!29437 () Bool)

(assert (=> start!8166 (=> (not res!29437) (not e!33355))))

(declare-fun valid!161 (LongMap!260) Bool)

(assert (=> start!8166 (= res!29437 (valid!161 thiss!992))))

(assert (=> start!8166 e!33355))

(declare-fun e!33357 () Bool)

(assert (=> start!8166 e!33357))

(assert (=> start!8166 true))

(assert (=> start!8166 e!33358))

(declare-fun b!51443 () Bool)

(assert (=> b!51443 (= e!33363 (and e!33352 mapRes!2303))))

(declare-fun condMapEmpty!2304 () Bool)

(declare-fun mapDefault!2304 () ValueCell!764)

(assert (=> b!51443 (= condMapEmpty!2304 (= (arr!1589 (_values!1915 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!764)) mapDefault!2304)))))

(declare-fun b!51444 () Bool)

(declare-fun e!33356 () Bool)

(assert (=> b!51444 (= e!33354 (and e!33356 mapRes!2304))))

(declare-fun condMapEmpty!2303 () Bool)

(declare-fun mapDefault!2303 () ValueCell!764)

(assert (=> b!51444 (= condMapEmpty!2303 (= (arr!1589 (_values!1915 (v!2192 (underlying!141 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!764)) mapDefault!2303)))))

(declare-fun b!51445 () Bool)

(assert (=> b!51445 (= e!33356 tp_is_empty!2215)))

(declare-fun b!51446 () Bool)

(assert (=> b!51446 (= e!33357 e!33360)))

(assert (= (and start!8166 res!29437) b!51434))

(assert (= (and b!51434 res!29433) b!51432))

(assert (= (and b!51432 res!29435) b!51438))

(assert (= (and b!51438 res!29432) b!51437))

(assert (= (and b!51437 res!29434) b!51439))

(assert (= (and b!51439 res!29436) b!51441))

(assert (= (and b!51444 condMapEmpty!2303) mapIsEmpty!2304))

(assert (= (and b!51444 (not condMapEmpty!2303)) mapNonEmpty!2304))

(get-info :version)

(assert (= (and mapNonEmpty!2304 ((_ is ValueCellFull!764) mapValue!2304)) b!51433))

(assert (= (and b!51444 ((_ is ValueCellFull!764) mapDefault!2303)) b!51445))

(assert (= b!51431 b!51444))

(assert (= b!51440 b!51431))

(assert (= b!51446 b!51440))

(assert (= start!8166 b!51446))

(assert (= (and b!51443 condMapEmpty!2304) mapIsEmpty!2303))

(assert (= (and b!51443 (not condMapEmpty!2304)) mapNonEmpty!2303))

(assert (= (and mapNonEmpty!2303 ((_ is ValueCellFull!764) mapValue!2303)) b!51436))

(assert (= (and b!51443 ((_ is ValueCellFull!764) mapDefault!2304)) b!51435))

(assert (= b!51442 b!51443))

(assert (= start!8166 b!51442))

(declare-fun m!44255 () Bool)

(assert (=> start!8166 m!44255))

(declare-fun m!44257 () Bool)

(assert (=> b!51441 m!44257))

(declare-fun m!44259 () Bool)

(assert (=> b!51431 m!44259))

(declare-fun m!44261 () Bool)

(assert (=> b!51431 m!44261))

(declare-fun m!44263 () Bool)

(assert (=> mapNonEmpty!2304 m!44263))

(declare-fun m!44265 () Bool)

(assert (=> mapNonEmpty!2303 m!44265))

(declare-fun m!44267 () Bool)

(assert (=> b!51437 m!44267))

(declare-fun m!44269 () Bool)

(assert (=> b!51442 m!44269))

(declare-fun m!44271 () Bool)

(assert (=> b!51442 m!44271))

(declare-fun m!44273 () Bool)

(assert (=> b!51432 m!44273))

(check-sat (not start!8166) b_and!2809 (not b_next!1599) (not b_next!1597) (not b!51431) b_and!2811 (not b!51441) (not b!51437) tp_is_empty!2215 (not b!51442) (not mapNonEmpty!2304) (not b!51432) (not mapNonEmpty!2303))
(check-sat b_and!2809 b_and!2811 (not b_next!1597) (not b_next!1599))
(get-model)

(declare-fun d!10335 () Bool)

(assert (=> d!10335 (= (array_inv!973 (_keys!3547 newMap!16)) (bvsge (size!1816 (_keys!3547 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!51442 d!10335))

(declare-fun d!10337 () Bool)

(assert (=> d!10337 (= (array_inv!974 (_values!1915 newMap!16)) (bvsge (size!1817 (_values!1915 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!51442 d!10337))

(declare-fun d!10339 () Bool)

(assert (=> d!10339 (= (array_inv!973 (_keys!3547 (v!2192 (underlying!141 thiss!992)))) (bvsge (size!1816 (_keys!3547 (v!2192 (underlying!141 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!51431 d!10339))

(declare-fun d!10341 () Bool)

(assert (=> d!10341 (= (array_inv!974 (_values!1915 (v!2192 (underlying!141 thiss!992)))) (bvsge (size!1817 (_values!1915 (v!2192 (underlying!141 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!51431 d!10341))

(declare-fun d!10343 () Bool)

(assert (=> d!10343 (= (valid!161 thiss!992) (valid!160 (v!2192 (underlying!141 thiss!992))))))

(declare-fun bs!2380 () Bool)

(assert (= bs!2380 d!10343))

(declare-fun m!44315 () Bool)

(assert (=> bs!2380 m!44315))

(assert (=> start!8166 d!10343))

(declare-fun d!10345 () Bool)

(declare-fun res!29480 () Bool)

(declare-fun e!33444 () Bool)

(assert (=> d!10345 (=> (not res!29480) (not e!33444))))

(declare-fun simpleValid!38 (LongMapFixedSize!436) Bool)

(assert (=> d!10345 (= res!29480 (simpleValid!38 newMap!16))))

(assert (=> d!10345 (= (valid!160 newMap!16) e!33444)))

(declare-fun b!51549 () Bool)

(declare-fun res!29481 () Bool)

(assert (=> b!51549 (=> (not res!29481) (not e!33444))))

(declare-fun arrayCountValidKeys!0 (array!3329 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!51549 (= res!29481 (= (arrayCountValidKeys!0 (_keys!3547 newMap!16) #b00000000000000000000000000000000 (size!1816 (_keys!3547 newMap!16))) (_size!267 newMap!16)))))

(declare-fun b!51550 () Bool)

(declare-fun res!29482 () Bool)

(assert (=> b!51550 (=> (not res!29482) (not e!33444))))

(assert (=> b!51550 (= res!29482 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3547 newMap!16) (mask!5740 newMap!16)))))

(declare-fun b!51551 () Bool)

(declare-datatypes ((List!1329 0))(
  ( (Nil!1326) (Cons!1325 (h!1905 (_ BitVec 64)) (t!4362 List!1329)) )
))
(declare-fun arrayNoDuplicates!0 (array!3329 (_ BitVec 32) List!1329) Bool)

(assert (=> b!51551 (= e!33444 (arrayNoDuplicates!0 (_keys!3547 newMap!16) #b00000000000000000000000000000000 Nil!1326))))

(assert (= (and d!10345 res!29480) b!51549))

(assert (= (and b!51549 res!29481) b!51550))

(assert (= (and b!51550 res!29482) b!51551))

(declare-fun m!44317 () Bool)

(assert (=> d!10345 m!44317))

(declare-fun m!44319 () Bool)

(assert (=> b!51549 m!44319))

(declare-fun m!44321 () Bool)

(assert (=> b!51550 m!44321))

(declare-fun m!44323 () Bool)

(assert (=> b!51551 m!44323))

(assert (=> b!51432 d!10345))

(declare-fun b!51560 () Bool)

(declare-fun e!33453 () Bool)

(declare-fun e!33452 () Bool)

(assert (=> b!51560 (= e!33453 e!33452)))

(declare-fun c!6884 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!51560 (= c!6884 (validKeyInArray!0 (select (arr!1588 (_keys!3547 (v!2192 (underlying!141 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun b!51561 () Bool)

(declare-fun e!33451 () Bool)

(declare-fun call!3948 () Bool)

(assert (=> b!51561 (= e!33451 call!3948)))

(declare-fun b!51563 () Bool)

(assert (=> b!51563 (= e!33452 e!33451)))

(declare-fun lt!21179 () (_ BitVec 64))

(assert (=> b!51563 (= lt!21179 (select (arr!1588 (_keys!3547 (v!2192 (underlying!141 thiss!992)))) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!1432 0))(
  ( (Unit!1433) )
))
(declare-fun lt!21178 () Unit!1432)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!3329 (_ BitVec 64) (_ BitVec 32)) Unit!1432)

(assert (=> b!51563 (= lt!21178 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!3547 (v!2192 (underlying!141 thiss!992))) lt!21179 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!3329 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!51563 (arrayContainsKey!0 (_keys!3547 (v!2192 (underlying!141 thiss!992))) lt!21179 #b00000000000000000000000000000000)))

(declare-fun lt!21177 () Unit!1432)

(assert (=> b!51563 (= lt!21177 lt!21178)))

(declare-fun res!29487 () Bool)

(declare-datatypes ((SeekEntryResult!226 0))(
  ( (MissingZero!226 (index!3026 (_ BitVec 32))) (Found!226 (index!3027 (_ BitVec 32))) (Intermediate!226 (undefined!1038 Bool) (index!3028 (_ BitVec 32)) (x!9391 (_ BitVec 32))) (Undefined!226) (MissingVacant!226 (index!3029 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!3329 (_ BitVec 32)) SeekEntryResult!226)

(assert (=> b!51563 (= res!29487 (= (seekEntryOrOpen!0 (select (arr!1588 (_keys!3547 (v!2192 (underlying!141 thiss!992)))) #b00000000000000000000000000000000) (_keys!3547 (v!2192 (underlying!141 thiss!992))) (mask!5740 (v!2192 (underlying!141 thiss!992)))) (Found!226 #b00000000000000000000000000000000)))))

(assert (=> b!51563 (=> (not res!29487) (not e!33451))))

(declare-fun bm!3945 () Bool)

(assert (=> bm!3945 (= call!3948 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!3547 (v!2192 (underlying!141 thiss!992))) (mask!5740 (v!2192 (underlying!141 thiss!992)))))))

(declare-fun d!10347 () Bool)

(declare-fun res!29488 () Bool)

(assert (=> d!10347 (=> res!29488 e!33453)))

(assert (=> d!10347 (= res!29488 (bvsge #b00000000000000000000000000000000 (size!1816 (_keys!3547 (v!2192 (underlying!141 thiss!992))))))))

(assert (=> d!10347 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3547 (v!2192 (underlying!141 thiss!992))) (mask!5740 (v!2192 (underlying!141 thiss!992)))) e!33453)))

(declare-fun b!51562 () Bool)

(assert (=> b!51562 (= e!33452 call!3948)))

(assert (= (and d!10347 (not res!29488)) b!51560))

(assert (= (and b!51560 c!6884) b!51563))

(assert (= (and b!51560 (not c!6884)) b!51562))

(assert (= (and b!51563 res!29487) b!51561))

(assert (= (or b!51561 b!51562) bm!3945))

(declare-fun m!44325 () Bool)

(assert (=> b!51560 m!44325))

(assert (=> b!51560 m!44325))

(declare-fun m!44327 () Bool)

(assert (=> b!51560 m!44327))

(assert (=> b!51563 m!44325))

(declare-fun m!44329 () Bool)

(assert (=> b!51563 m!44329))

(declare-fun m!44331 () Bool)

(assert (=> b!51563 m!44331))

(assert (=> b!51563 m!44325))

(declare-fun m!44333 () Bool)

(assert (=> b!51563 m!44333))

(declare-fun m!44335 () Bool)

(assert (=> bm!3945 m!44335))

(assert (=> b!51441 d!10347))

(declare-fun d!10349 () Bool)

(assert (=> d!10349 (= (validMask!0 (mask!5740 (v!2192 (underlying!141 thiss!992)))) (and (or (= (mask!5740 (v!2192 (underlying!141 thiss!992))) #b00000000000000000000000000000111) (= (mask!5740 (v!2192 (underlying!141 thiss!992))) #b00000000000000000000000000001111) (= (mask!5740 (v!2192 (underlying!141 thiss!992))) #b00000000000000000000000000011111) (= (mask!5740 (v!2192 (underlying!141 thiss!992))) #b00000000000000000000000000111111) (= (mask!5740 (v!2192 (underlying!141 thiss!992))) #b00000000000000000000000001111111) (= (mask!5740 (v!2192 (underlying!141 thiss!992))) #b00000000000000000000000011111111) (= (mask!5740 (v!2192 (underlying!141 thiss!992))) #b00000000000000000000000111111111) (= (mask!5740 (v!2192 (underlying!141 thiss!992))) #b00000000000000000000001111111111) (= (mask!5740 (v!2192 (underlying!141 thiss!992))) #b00000000000000000000011111111111) (= (mask!5740 (v!2192 (underlying!141 thiss!992))) #b00000000000000000000111111111111) (= (mask!5740 (v!2192 (underlying!141 thiss!992))) #b00000000000000000001111111111111) (= (mask!5740 (v!2192 (underlying!141 thiss!992))) #b00000000000000000011111111111111) (= (mask!5740 (v!2192 (underlying!141 thiss!992))) #b00000000000000000111111111111111) (= (mask!5740 (v!2192 (underlying!141 thiss!992))) #b00000000000000001111111111111111) (= (mask!5740 (v!2192 (underlying!141 thiss!992))) #b00000000000000011111111111111111) (= (mask!5740 (v!2192 (underlying!141 thiss!992))) #b00000000000000111111111111111111) (= (mask!5740 (v!2192 (underlying!141 thiss!992))) #b00000000000001111111111111111111) (= (mask!5740 (v!2192 (underlying!141 thiss!992))) #b00000000000011111111111111111111) (= (mask!5740 (v!2192 (underlying!141 thiss!992))) #b00000000000111111111111111111111) (= (mask!5740 (v!2192 (underlying!141 thiss!992))) #b00000000001111111111111111111111) (= (mask!5740 (v!2192 (underlying!141 thiss!992))) #b00000000011111111111111111111111) (= (mask!5740 (v!2192 (underlying!141 thiss!992))) #b00000000111111111111111111111111) (= (mask!5740 (v!2192 (underlying!141 thiss!992))) #b00000001111111111111111111111111) (= (mask!5740 (v!2192 (underlying!141 thiss!992))) #b00000011111111111111111111111111) (= (mask!5740 (v!2192 (underlying!141 thiss!992))) #b00000111111111111111111111111111) (= (mask!5740 (v!2192 (underlying!141 thiss!992))) #b00001111111111111111111111111111) (= (mask!5740 (v!2192 (underlying!141 thiss!992))) #b00011111111111111111111111111111) (= (mask!5740 (v!2192 (underlying!141 thiss!992))) #b00111111111111111111111111111111)) (bvsle (mask!5740 (v!2192 (underlying!141 thiss!992))) #b00111111111111111111111111111111)))))

(assert (=> b!51437 d!10349))

(declare-fun mapNonEmpty!2319 () Bool)

(declare-fun mapRes!2319 () Bool)

(declare-fun tp!6909 () Bool)

(declare-fun e!33458 () Bool)

(assert (=> mapNonEmpty!2319 (= mapRes!2319 (and tp!6909 e!33458))))

(declare-fun mapKey!2319 () (_ BitVec 32))

(declare-fun mapRest!2319 () (Array (_ BitVec 32) ValueCell!764))

(declare-fun mapValue!2319 () ValueCell!764)

(assert (=> mapNonEmpty!2319 (= mapRest!2303 (store mapRest!2319 mapKey!2319 mapValue!2319))))

(declare-fun b!51570 () Bool)

(assert (=> b!51570 (= e!33458 tp_is_empty!2215)))

(declare-fun b!51571 () Bool)

(declare-fun e!33459 () Bool)

(assert (=> b!51571 (= e!33459 tp_is_empty!2215)))

(declare-fun condMapEmpty!2319 () Bool)

(declare-fun mapDefault!2319 () ValueCell!764)

(assert (=> mapNonEmpty!2304 (= condMapEmpty!2319 (= mapRest!2303 ((as const (Array (_ BitVec 32) ValueCell!764)) mapDefault!2319)))))

(assert (=> mapNonEmpty!2304 (= tp!6881 (and e!33459 mapRes!2319))))

(declare-fun mapIsEmpty!2319 () Bool)

(assert (=> mapIsEmpty!2319 mapRes!2319))

(assert (= (and mapNonEmpty!2304 condMapEmpty!2319) mapIsEmpty!2319))

(assert (= (and mapNonEmpty!2304 (not condMapEmpty!2319)) mapNonEmpty!2319))

(assert (= (and mapNonEmpty!2319 ((_ is ValueCellFull!764) mapValue!2319)) b!51570))

(assert (= (and mapNonEmpty!2304 ((_ is ValueCellFull!764) mapDefault!2319)) b!51571))

(declare-fun m!44337 () Bool)

(assert (=> mapNonEmpty!2319 m!44337))

(declare-fun mapNonEmpty!2320 () Bool)

(declare-fun mapRes!2320 () Bool)

(declare-fun tp!6910 () Bool)

(declare-fun e!33460 () Bool)

(assert (=> mapNonEmpty!2320 (= mapRes!2320 (and tp!6910 e!33460))))

(declare-fun mapValue!2320 () ValueCell!764)

(declare-fun mapRest!2320 () (Array (_ BitVec 32) ValueCell!764))

(declare-fun mapKey!2320 () (_ BitVec 32))

(assert (=> mapNonEmpty!2320 (= mapRest!2304 (store mapRest!2320 mapKey!2320 mapValue!2320))))

(declare-fun b!51572 () Bool)

(assert (=> b!51572 (= e!33460 tp_is_empty!2215)))

(declare-fun b!51573 () Bool)

(declare-fun e!33461 () Bool)

(assert (=> b!51573 (= e!33461 tp_is_empty!2215)))

(declare-fun condMapEmpty!2320 () Bool)

(declare-fun mapDefault!2320 () ValueCell!764)

(assert (=> mapNonEmpty!2303 (= condMapEmpty!2320 (= mapRest!2304 ((as const (Array (_ BitVec 32) ValueCell!764)) mapDefault!2320)))))

(assert (=> mapNonEmpty!2303 (= tp!6880 (and e!33461 mapRes!2320))))

(declare-fun mapIsEmpty!2320 () Bool)

(assert (=> mapIsEmpty!2320 mapRes!2320))

(assert (= (and mapNonEmpty!2303 condMapEmpty!2320) mapIsEmpty!2320))

(assert (= (and mapNonEmpty!2303 (not condMapEmpty!2320)) mapNonEmpty!2320))

(assert (= (and mapNonEmpty!2320 ((_ is ValueCellFull!764) mapValue!2320)) b!51572))

(assert (= (and mapNonEmpty!2303 ((_ is ValueCellFull!764) mapDefault!2320)) b!51573))

(declare-fun m!44339 () Bool)

(assert (=> mapNonEmpty!2320 m!44339))

(check-sat (not b!51550) tp_is_empty!2215 b_and!2809 (not b_next!1599) (not mapNonEmpty!2320) (not b!51551) (not bm!3945) (not d!10345) (not mapNonEmpty!2319) b_and!2811 (not b!51563) (not b!51549) (not d!10343) (not b!51560) (not b_next!1597))
(check-sat b_and!2809 b_and!2811 (not b_next!1597) (not b_next!1599))
(get-model)

(declare-fun b!51574 () Bool)

(declare-fun e!33464 () Bool)

(declare-fun e!33463 () Bool)

(assert (=> b!51574 (= e!33464 e!33463)))

(declare-fun c!6885 () Bool)

(assert (=> b!51574 (= c!6885 (validKeyInArray!0 (select (arr!1588 (_keys!3547 (v!2192 (underlying!141 thiss!992)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!51575 () Bool)

(declare-fun e!33462 () Bool)

(declare-fun call!3949 () Bool)

(assert (=> b!51575 (= e!33462 call!3949)))

(declare-fun b!51577 () Bool)

(assert (=> b!51577 (= e!33463 e!33462)))

(declare-fun lt!21182 () (_ BitVec 64))

(assert (=> b!51577 (= lt!21182 (select (arr!1588 (_keys!3547 (v!2192 (underlying!141 thiss!992)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!21181 () Unit!1432)

(assert (=> b!51577 (= lt!21181 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!3547 (v!2192 (underlying!141 thiss!992))) lt!21182 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!51577 (arrayContainsKey!0 (_keys!3547 (v!2192 (underlying!141 thiss!992))) lt!21182 #b00000000000000000000000000000000)))

(declare-fun lt!21180 () Unit!1432)

(assert (=> b!51577 (= lt!21180 lt!21181)))

(declare-fun res!29489 () Bool)

(assert (=> b!51577 (= res!29489 (= (seekEntryOrOpen!0 (select (arr!1588 (_keys!3547 (v!2192 (underlying!141 thiss!992)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (_keys!3547 (v!2192 (underlying!141 thiss!992))) (mask!5740 (v!2192 (underlying!141 thiss!992)))) (Found!226 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!51577 (=> (not res!29489) (not e!33462))))

(declare-fun bm!3946 () Bool)

(assert (=> bm!3946 (= call!3949 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (_keys!3547 (v!2192 (underlying!141 thiss!992))) (mask!5740 (v!2192 (underlying!141 thiss!992)))))))

(declare-fun d!10351 () Bool)

(declare-fun res!29490 () Bool)

(assert (=> d!10351 (=> res!29490 e!33464)))

(assert (=> d!10351 (= res!29490 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1816 (_keys!3547 (v!2192 (underlying!141 thiss!992))))))))

(assert (=> d!10351 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!3547 (v!2192 (underlying!141 thiss!992))) (mask!5740 (v!2192 (underlying!141 thiss!992)))) e!33464)))

(declare-fun b!51576 () Bool)

(assert (=> b!51576 (= e!33463 call!3949)))

(assert (= (and d!10351 (not res!29490)) b!51574))

(assert (= (and b!51574 c!6885) b!51577))

(assert (= (and b!51574 (not c!6885)) b!51576))

(assert (= (and b!51577 res!29489) b!51575))

(assert (= (or b!51575 b!51576) bm!3946))

(declare-fun m!44341 () Bool)

(assert (=> b!51574 m!44341))

(assert (=> b!51574 m!44341))

(declare-fun m!44343 () Bool)

(assert (=> b!51574 m!44343))

(assert (=> b!51577 m!44341))

(declare-fun m!44345 () Bool)

(assert (=> b!51577 m!44345))

(declare-fun m!44347 () Bool)

(assert (=> b!51577 m!44347))

(assert (=> b!51577 m!44341))

(declare-fun m!44349 () Bool)

(assert (=> b!51577 m!44349))

(declare-fun m!44351 () Bool)

(assert (=> bm!3946 m!44351))

(assert (=> bm!3945 d!10351))

(declare-fun b!51588 () Bool)

(declare-fun res!29502 () Bool)

(declare-fun e!33467 () Bool)

(assert (=> b!51588 (=> (not res!29502) (not e!33467))))

(declare-fun size!1822 (LongMapFixedSize!436) (_ BitVec 32))

(assert (=> b!51588 (= res!29502 (= (size!1822 newMap!16) (bvadd (_size!267 newMap!16) (bvsdiv (bvadd (extraKeys!1823 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!51587 () Bool)

(declare-fun res!29500 () Bool)

(assert (=> b!51587 (=> (not res!29500) (not e!33467))))

(assert (=> b!51587 (= res!29500 (bvsge (size!1822 newMap!16) (_size!267 newMap!16)))))

(declare-fun b!51586 () Bool)

(declare-fun res!29501 () Bool)

(assert (=> b!51586 (=> (not res!29501) (not e!33467))))

(assert (=> b!51586 (= res!29501 (and (= (size!1817 (_values!1915 newMap!16)) (bvadd (mask!5740 newMap!16) #b00000000000000000000000000000001)) (= (size!1816 (_keys!3547 newMap!16)) (size!1817 (_values!1915 newMap!16))) (bvsge (_size!267 newMap!16) #b00000000000000000000000000000000) (bvsle (_size!267 newMap!16) (bvadd (mask!5740 newMap!16) #b00000000000000000000000000000001))))))

(declare-fun d!10353 () Bool)

(declare-fun res!29499 () Bool)

(assert (=> d!10353 (=> (not res!29499) (not e!33467))))

(assert (=> d!10353 (= res!29499 (validMask!0 (mask!5740 newMap!16)))))

(assert (=> d!10353 (= (simpleValid!38 newMap!16) e!33467)))

(declare-fun b!51589 () Bool)

(assert (=> b!51589 (= e!33467 (and (bvsge (extraKeys!1823 newMap!16) #b00000000000000000000000000000000) (bvsle (extraKeys!1823 newMap!16) #b00000000000000000000000000000011) (bvsge (_vacant!267 newMap!16) #b00000000000000000000000000000000)))))

(assert (= (and d!10353 res!29499) b!51586))

(assert (= (and b!51586 res!29501) b!51587))

(assert (= (and b!51587 res!29500) b!51588))

(assert (= (and b!51588 res!29502) b!51589))

(declare-fun m!44353 () Bool)

(assert (=> b!51588 m!44353))

(assert (=> b!51587 m!44353))

(declare-fun m!44355 () Bool)

(assert (=> d!10353 m!44355))

(assert (=> d!10345 d!10353))

(declare-fun d!10355 () Bool)

(assert (=> d!10355 (= (validKeyInArray!0 (select (arr!1588 (_keys!3547 (v!2192 (underlying!141 thiss!992)))) #b00000000000000000000000000000000)) (and (not (= (select (arr!1588 (_keys!3547 (v!2192 (underlying!141 thiss!992)))) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1588 (_keys!3547 (v!2192 (underlying!141 thiss!992)))) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!51560 d!10355))

(declare-fun b!51590 () Bool)

(declare-fun e!33470 () Bool)

(declare-fun e!33469 () Bool)

(assert (=> b!51590 (= e!33470 e!33469)))

(declare-fun c!6886 () Bool)

(assert (=> b!51590 (= c!6886 (validKeyInArray!0 (select (arr!1588 (_keys!3547 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!51591 () Bool)

(declare-fun e!33468 () Bool)

(declare-fun call!3950 () Bool)

(assert (=> b!51591 (= e!33468 call!3950)))

(declare-fun b!51593 () Bool)

(assert (=> b!51593 (= e!33469 e!33468)))

(declare-fun lt!21185 () (_ BitVec 64))

(assert (=> b!51593 (= lt!21185 (select (arr!1588 (_keys!3547 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!21184 () Unit!1432)

(assert (=> b!51593 (= lt!21184 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!3547 newMap!16) lt!21185 #b00000000000000000000000000000000))))

(assert (=> b!51593 (arrayContainsKey!0 (_keys!3547 newMap!16) lt!21185 #b00000000000000000000000000000000)))

(declare-fun lt!21183 () Unit!1432)

(assert (=> b!51593 (= lt!21183 lt!21184)))

(declare-fun res!29503 () Bool)

(assert (=> b!51593 (= res!29503 (= (seekEntryOrOpen!0 (select (arr!1588 (_keys!3547 newMap!16)) #b00000000000000000000000000000000) (_keys!3547 newMap!16) (mask!5740 newMap!16)) (Found!226 #b00000000000000000000000000000000)))))

(assert (=> b!51593 (=> (not res!29503) (not e!33468))))

(declare-fun bm!3947 () Bool)

(assert (=> bm!3947 (= call!3950 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!3547 newMap!16) (mask!5740 newMap!16)))))

(declare-fun d!10357 () Bool)

(declare-fun res!29504 () Bool)

(assert (=> d!10357 (=> res!29504 e!33470)))

(assert (=> d!10357 (= res!29504 (bvsge #b00000000000000000000000000000000 (size!1816 (_keys!3547 newMap!16))))))

(assert (=> d!10357 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3547 newMap!16) (mask!5740 newMap!16)) e!33470)))

(declare-fun b!51592 () Bool)

(assert (=> b!51592 (= e!33469 call!3950)))

(assert (= (and d!10357 (not res!29504)) b!51590))

(assert (= (and b!51590 c!6886) b!51593))

(assert (= (and b!51590 (not c!6886)) b!51592))

(assert (= (and b!51593 res!29503) b!51591))

(assert (= (or b!51591 b!51592) bm!3947))

(declare-fun m!44357 () Bool)

(assert (=> b!51590 m!44357))

(assert (=> b!51590 m!44357))

(declare-fun m!44359 () Bool)

(assert (=> b!51590 m!44359))

(assert (=> b!51593 m!44357))

(declare-fun m!44361 () Bool)

(assert (=> b!51593 m!44361))

(declare-fun m!44363 () Bool)

(assert (=> b!51593 m!44363))

(assert (=> b!51593 m!44357))

(declare-fun m!44365 () Bool)

(assert (=> b!51593 m!44365))

(declare-fun m!44367 () Bool)

(assert (=> bm!3947 m!44367))

(assert (=> b!51550 d!10357))

(declare-fun b!51602 () Bool)

(declare-fun e!33475 () (_ BitVec 32))

(declare-fun e!33476 () (_ BitVec 32))

(assert (=> b!51602 (= e!33475 e!33476)))

(declare-fun c!6892 () Bool)

(assert (=> b!51602 (= c!6892 (validKeyInArray!0 (select (arr!1588 (_keys!3547 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!51603 () Bool)

(assert (=> b!51603 (= e!33475 #b00000000000000000000000000000000)))

(declare-fun d!10359 () Bool)

(declare-fun lt!21188 () (_ BitVec 32))

(assert (=> d!10359 (and (bvsge lt!21188 #b00000000000000000000000000000000) (bvsle lt!21188 (bvsub (size!1816 (_keys!3547 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> d!10359 (= lt!21188 e!33475)))

(declare-fun c!6891 () Bool)

(assert (=> d!10359 (= c!6891 (bvsge #b00000000000000000000000000000000 (size!1816 (_keys!3547 newMap!16))))))

(assert (=> d!10359 (and (bvsle #b00000000000000000000000000000000 (size!1816 (_keys!3547 newMap!16))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!1816 (_keys!3547 newMap!16)) (size!1816 (_keys!3547 newMap!16))))))

(assert (=> d!10359 (= (arrayCountValidKeys!0 (_keys!3547 newMap!16) #b00000000000000000000000000000000 (size!1816 (_keys!3547 newMap!16))) lt!21188)))

(declare-fun b!51604 () Bool)

(declare-fun call!3953 () (_ BitVec 32))

(assert (=> b!51604 (= e!33476 (bvadd #b00000000000000000000000000000001 call!3953))))

(declare-fun b!51605 () Bool)

(assert (=> b!51605 (= e!33476 call!3953)))

(declare-fun bm!3950 () Bool)

(assert (=> bm!3950 (= call!3953 (arrayCountValidKeys!0 (_keys!3547 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1816 (_keys!3547 newMap!16))))))

(assert (= (and d!10359 c!6891) b!51603))

(assert (= (and d!10359 (not c!6891)) b!51602))

(assert (= (and b!51602 c!6892) b!51604))

(assert (= (and b!51602 (not c!6892)) b!51605))

(assert (= (or b!51604 b!51605) bm!3950))

(assert (=> b!51602 m!44357))

(assert (=> b!51602 m!44357))

(assert (=> b!51602 m!44359))

(declare-fun m!44369 () Bool)

(assert (=> bm!3950 m!44369))

(assert (=> b!51549 d!10359))

(declare-fun d!10361 () Bool)

(assert (=> d!10361 (arrayContainsKey!0 (_keys!3547 (v!2192 (underlying!141 thiss!992))) lt!21179 #b00000000000000000000000000000000)))

(declare-fun lt!21191 () Unit!1432)

(declare-fun choose!13 (array!3329 (_ BitVec 64) (_ BitVec 32)) Unit!1432)

(assert (=> d!10361 (= lt!21191 (choose!13 (_keys!3547 (v!2192 (underlying!141 thiss!992))) lt!21179 #b00000000000000000000000000000000))))

(assert (=> d!10361 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!10361 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!3547 (v!2192 (underlying!141 thiss!992))) lt!21179 #b00000000000000000000000000000000) lt!21191)))

(declare-fun bs!2381 () Bool)

(assert (= bs!2381 d!10361))

(assert (=> bs!2381 m!44331))

(declare-fun m!44371 () Bool)

(assert (=> bs!2381 m!44371))

(assert (=> b!51563 d!10361))

(declare-fun d!10363 () Bool)

(declare-fun res!29509 () Bool)

(declare-fun e!33481 () Bool)

(assert (=> d!10363 (=> res!29509 e!33481)))

(assert (=> d!10363 (= res!29509 (= (select (arr!1588 (_keys!3547 (v!2192 (underlying!141 thiss!992)))) #b00000000000000000000000000000000) lt!21179))))

(assert (=> d!10363 (= (arrayContainsKey!0 (_keys!3547 (v!2192 (underlying!141 thiss!992))) lt!21179 #b00000000000000000000000000000000) e!33481)))

(declare-fun b!51610 () Bool)

(declare-fun e!33482 () Bool)

(assert (=> b!51610 (= e!33481 e!33482)))

(declare-fun res!29510 () Bool)

(assert (=> b!51610 (=> (not res!29510) (not e!33482))))

(assert (=> b!51610 (= res!29510 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1816 (_keys!3547 (v!2192 (underlying!141 thiss!992))))))))

(declare-fun b!51611 () Bool)

(assert (=> b!51611 (= e!33482 (arrayContainsKey!0 (_keys!3547 (v!2192 (underlying!141 thiss!992))) lt!21179 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!10363 (not res!29509)) b!51610))

(assert (= (and b!51610 res!29510) b!51611))

(assert (=> d!10363 m!44325))

(declare-fun m!44373 () Bool)

(assert (=> b!51611 m!44373))

(assert (=> b!51563 d!10363))

(declare-fun b!51624 () Bool)

(declare-fun e!33490 () SeekEntryResult!226)

(declare-fun lt!21199 () SeekEntryResult!226)

(assert (=> b!51624 (= e!33490 (MissingZero!226 (index!3028 lt!21199)))))

(declare-fun b!51625 () Bool)

(declare-fun e!33489 () SeekEntryResult!226)

(assert (=> b!51625 (= e!33489 (Found!226 (index!3028 lt!21199)))))

(declare-fun b!51626 () Bool)

(declare-fun e!33491 () SeekEntryResult!226)

(assert (=> b!51626 (= e!33491 e!33489)))

(declare-fun lt!21198 () (_ BitVec 64))

(assert (=> b!51626 (= lt!21198 (select (arr!1588 (_keys!3547 (v!2192 (underlying!141 thiss!992)))) (index!3028 lt!21199)))))

(declare-fun c!6899 () Bool)

(assert (=> b!51626 (= c!6899 (= lt!21198 (select (arr!1588 (_keys!3547 (v!2192 (underlying!141 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun b!51627 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!3329 (_ BitVec 32)) SeekEntryResult!226)

(assert (=> b!51627 (= e!33490 (seekKeyOrZeroReturnVacant!0 (x!9391 lt!21199) (index!3028 lt!21199) (index!3028 lt!21199) (select (arr!1588 (_keys!3547 (v!2192 (underlying!141 thiss!992)))) #b00000000000000000000000000000000) (_keys!3547 (v!2192 (underlying!141 thiss!992))) (mask!5740 (v!2192 (underlying!141 thiss!992)))))))

(declare-fun b!51628 () Bool)

(declare-fun c!6901 () Bool)

(assert (=> b!51628 (= c!6901 (= lt!21198 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!51628 (= e!33489 e!33490)))

(declare-fun d!10365 () Bool)

(declare-fun lt!21200 () SeekEntryResult!226)

(assert (=> d!10365 (and (or ((_ is Undefined!226) lt!21200) (not ((_ is Found!226) lt!21200)) (and (bvsge (index!3027 lt!21200) #b00000000000000000000000000000000) (bvslt (index!3027 lt!21200) (size!1816 (_keys!3547 (v!2192 (underlying!141 thiss!992))))))) (or ((_ is Undefined!226) lt!21200) ((_ is Found!226) lt!21200) (not ((_ is MissingZero!226) lt!21200)) (and (bvsge (index!3026 lt!21200) #b00000000000000000000000000000000) (bvslt (index!3026 lt!21200) (size!1816 (_keys!3547 (v!2192 (underlying!141 thiss!992))))))) (or ((_ is Undefined!226) lt!21200) ((_ is Found!226) lt!21200) ((_ is MissingZero!226) lt!21200) (not ((_ is MissingVacant!226) lt!21200)) (and (bvsge (index!3029 lt!21200) #b00000000000000000000000000000000) (bvslt (index!3029 lt!21200) (size!1816 (_keys!3547 (v!2192 (underlying!141 thiss!992))))))) (or ((_ is Undefined!226) lt!21200) (ite ((_ is Found!226) lt!21200) (= (select (arr!1588 (_keys!3547 (v!2192 (underlying!141 thiss!992)))) (index!3027 lt!21200)) (select (arr!1588 (_keys!3547 (v!2192 (underlying!141 thiss!992)))) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!226) lt!21200) (= (select (arr!1588 (_keys!3547 (v!2192 (underlying!141 thiss!992)))) (index!3026 lt!21200)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!226) lt!21200) (= (select (arr!1588 (_keys!3547 (v!2192 (underlying!141 thiss!992)))) (index!3029 lt!21200)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!10365 (= lt!21200 e!33491)))

(declare-fun c!6900 () Bool)

(assert (=> d!10365 (= c!6900 (and ((_ is Intermediate!226) lt!21199) (undefined!1038 lt!21199)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!3329 (_ BitVec 32)) SeekEntryResult!226)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!10365 (= lt!21199 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!1588 (_keys!3547 (v!2192 (underlying!141 thiss!992)))) #b00000000000000000000000000000000) (mask!5740 (v!2192 (underlying!141 thiss!992)))) (select (arr!1588 (_keys!3547 (v!2192 (underlying!141 thiss!992)))) #b00000000000000000000000000000000) (_keys!3547 (v!2192 (underlying!141 thiss!992))) (mask!5740 (v!2192 (underlying!141 thiss!992)))))))

(assert (=> d!10365 (validMask!0 (mask!5740 (v!2192 (underlying!141 thiss!992))))))

(assert (=> d!10365 (= (seekEntryOrOpen!0 (select (arr!1588 (_keys!3547 (v!2192 (underlying!141 thiss!992)))) #b00000000000000000000000000000000) (_keys!3547 (v!2192 (underlying!141 thiss!992))) (mask!5740 (v!2192 (underlying!141 thiss!992)))) lt!21200)))

(declare-fun b!51629 () Bool)

(assert (=> b!51629 (= e!33491 Undefined!226)))

(assert (= (and d!10365 c!6900) b!51629))

(assert (= (and d!10365 (not c!6900)) b!51626))

(assert (= (and b!51626 c!6899) b!51625))

(assert (= (and b!51626 (not c!6899)) b!51628))

(assert (= (and b!51628 c!6901) b!51624))

(assert (= (and b!51628 (not c!6901)) b!51627))

(declare-fun m!44375 () Bool)

(assert (=> b!51626 m!44375))

(assert (=> b!51627 m!44325))

(declare-fun m!44377 () Bool)

(assert (=> b!51627 m!44377))

(declare-fun m!44379 () Bool)

(assert (=> d!10365 m!44379))

(declare-fun m!44381 () Bool)

(assert (=> d!10365 m!44381))

(declare-fun m!44383 () Bool)

(assert (=> d!10365 m!44383))

(assert (=> d!10365 m!44325))

(declare-fun m!44385 () Bool)

(assert (=> d!10365 m!44385))

(assert (=> d!10365 m!44325))

(assert (=> d!10365 m!44383))

(declare-fun m!44387 () Bool)

(assert (=> d!10365 m!44387))

(assert (=> d!10365 m!44267))

(assert (=> b!51563 d!10365))

(declare-fun bm!3953 () Bool)

(declare-fun call!3956 () Bool)

(declare-fun c!6904 () Bool)

(assert (=> bm!3953 (= call!3956 (arrayNoDuplicates!0 (_keys!3547 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!6904 (Cons!1325 (select (arr!1588 (_keys!3547 newMap!16)) #b00000000000000000000000000000000) Nil!1326) Nil!1326)))))

(declare-fun b!51640 () Bool)

(declare-fun e!33500 () Bool)

(declare-fun e!33503 () Bool)

(assert (=> b!51640 (= e!33500 e!33503)))

(declare-fun res!29518 () Bool)

(assert (=> b!51640 (=> (not res!29518) (not e!33503))))

(declare-fun e!33501 () Bool)

(assert (=> b!51640 (= res!29518 (not e!33501))))

(declare-fun res!29519 () Bool)

(assert (=> b!51640 (=> (not res!29519) (not e!33501))))

(assert (=> b!51640 (= res!29519 (validKeyInArray!0 (select (arr!1588 (_keys!3547 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!51641 () Bool)

(declare-fun e!33502 () Bool)

(assert (=> b!51641 (= e!33502 call!3956)))

(declare-fun b!51642 () Bool)

(assert (=> b!51642 (= e!33503 e!33502)))

(assert (=> b!51642 (= c!6904 (validKeyInArray!0 (select (arr!1588 (_keys!3547 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun d!10367 () Bool)

(declare-fun res!29517 () Bool)

(assert (=> d!10367 (=> res!29517 e!33500)))

(assert (=> d!10367 (= res!29517 (bvsge #b00000000000000000000000000000000 (size!1816 (_keys!3547 newMap!16))))))

(assert (=> d!10367 (= (arrayNoDuplicates!0 (_keys!3547 newMap!16) #b00000000000000000000000000000000 Nil!1326) e!33500)))

(declare-fun b!51643 () Bool)

(assert (=> b!51643 (= e!33502 call!3956)))

(declare-fun b!51644 () Bool)

(declare-fun contains!619 (List!1329 (_ BitVec 64)) Bool)

(assert (=> b!51644 (= e!33501 (contains!619 Nil!1326 (select (arr!1588 (_keys!3547 newMap!16)) #b00000000000000000000000000000000)))))

(assert (= (and d!10367 (not res!29517)) b!51640))

(assert (= (and b!51640 res!29519) b!51644))

(assert (= (and b!51640 res!29518) b!51642))

(assert (= (and b!51642 c!6904) b!51643))

(assert (= (and b!51642 (not c!6904)) b!51641))

(assert (= (or b!51643 b!51641) bm!3953))

(assert (=> bm!3953 m!44357))

(declare-fun m!44389 () Bool)

(assert (=> bm!3953 m!44389))

(assert (=> b!51640 m!44357))

(assert (=> b!51640 m!44357))

(assert (=> b!51640 m!44359))

(assert (=> b!51642 m!44357))

(assert (=> b!51642 m!44357))

(assert (=> b!51642 m!44359))

(assert (=> b!51644 m!44357))

(assert (=> b!51644 m!44357))

(declare-fun m!44391 () Bool)

(assert (=> b!51644 m!44391))

(assert (=> b!51551 d!10367))

(declare-fun d!10369 () Bool)

(declare-fun res!29520 () Bool)

(declare-fun e!33504 () Bool)

(assert (=> d!10369 (=> (not res!29520) (not e!33504))))

(assert (=> d!10369 (= res!29520 (simpleValid!38 (v!2192 (underlying!141 thiss!992))))))

(assert (=> d!10369 (= (valid!160 (v!2192 (underlying!141 thiss!992))) e!33504)))

(declare-fun b!51645 () Bool)

(declare-fun res!29521 () Bool)

(assert (=> b!51645 (=> (not res!29521) (not e!33504))))

(assert (=> b!51645 (= res!29521 (= (arrayCountValidKeys!0 (_keys!3547 (v!2192 (underlying!141 thiss!992))) #b00000000000000000000000000000000 (size!1816 (_keys!3547 (v!2192 (underlying!141 thiss!992))))) (_size!267 (v!2192 (underlying!141 thiss!992)))))))

(declare-fun b!51646 () Bool)

(declare-fun res!29522 () Bool)

(assert (=> b!51646 (=> (not res!29522) (not e!33504))))

(assert (=> b!51646 (= res!29522 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3547 (v!2192 (underlying!141 thiss!992))) (mask!5740 (v!2192 (underlying!141 thiss!992)))))))

(declare-fun b!51647 () Bool)

(assert (=> b!51647 (= e!33504 (arrayNoDuplicates!0 (_keys!3547 (v!2192 (underlying!141 thiss!992))) #b00000000000000000000000000000000 Nil!1326))))

(assert (= (and d!10369 res!29520) b!51645))

(assert (= (and b!51645 res!29521) b!51646))

(assert (= (and b!51646 res!29522) b!51647))

(declare-fun m!44393 () Bool)

(assert (=> d!10369 m!44393))

(declare-fun m!44395 () Bool)

(assert (=> b!51645 m!44395))

(assert (=> b!51646 m!44257))

(declare-fun m!44397 () Bool)

(assert (=> b!51647 m!44397))

(assert (=> d!10343 d!10369))

(declare-fun mapNonEmpty!2321 () Bool)

(declare-fun mapRes!2321 () Bool)

(declare-fun tp!6911 () Bool)

(declare-fun e!33505 () Bool)

(assert (=> mapNonEmpty!2321 (= mapRes!2321 (and tp!6911 e!33505))))

(declare-fun mapKey!2321 () (_ BitVec 32))

(declare-fun mapRest!2321 () (Array (_ BitVec 32) ValueCell!764))

(declare-fun mapValue!2321 () ValueCell!764)

(assert (=> mapNonEmpty!2321 (= mapRest!2320 (store mapRest!2321 mapKey!2321 mapValue!2321))))

(declare-fun b!51648 () Bool)

(assert (=> b!51648 (= e!33505 tp_is_empty!2215)))

(declare-fun b!51649 () Bool)

(declare-fun e!33506 () Bool)

(assert (=> b!51649 (= e!33506 tp_is_empty!2215)))

(declare-fun condMapEmpty!2321 () Bool)

(declare-fun mapDefault!2321 () ValueCell!764)

(assert (=> mapNonEmpty!2320 (= condMapEmpty!2321 (= mapRest!2320 ((as const (Array (_ BitVec 32) ValueCell!764)) mapDefault!2321)))))

(assert (=> mapNonEmpty!2320 (= tp!6910 (and e!33506 mapRes!2321))))

(declare-fun mapIsEmpty!2321 () Bool)

(assert (=> mapIsEmpty!2321 mapRes!2321))

(assert (= (and mapNonEmpty!2320 condMapEmpty!2321) mapIsEmpty!2321))

(assert (= (and mapNonEmpty!2320 (not condMapEmpty!2321)) mapNonEmpty!2321))

(assert (= (and mapNonEmpty!2321 ((_ is ValueCellFull!764) mapValue!2321)) b!51648))

(assert (= (and mapNonEmpty!2320 ((_ is ValueCellFull!764) mapDefault!2321)) b!51649))

(declare-fun m!44399 () Bool)

(assert (=> mapNonEmpty!2321 m!44399))

(declare-fun mapNonEmpty!2322 () Bool)

(declare-fun mapRes!2322 () Bool)

(declare-fun tp!6912 () Bool)

(declare-fun e!33507 () Bool)

(assert (=> mapNonEmpty!2322 (= mapRes!2322 (and tp!6912 e!33507))))

(declare-fun mapRest!2322 () (Array (_ BitVec 32) ValueCell!764))

(declare-fun mapValue!2322 () ValueCell!764)

(declare-fun mapKey!2322 () (_ BitVec 32))

(assert (=> mapNonEmpty!2322 (= mapRest!2319 (store mapRest!2322 mapKey!2322 mapValue!2322))))

(declare-fun b!51650 () Bool)

(assert (=> b!51650 (= e!33507 tp_is_empty!2215)))

(declare-fun b!51651 () Bool)

(declare-fun e!33508 () Bool)

(assert (=> b!51651 (= e!33508 tp_is_empty!2215)))

(declare-fun condMapEmpty!2322 () Bool)

(declare-fun mapDefault!2322 () ValueCell!764)

(assert (=> mapNonEmpty!2319 (= condMapEmpty!2322 (= mapRest!2319 ((as const (Array (_ BitVec 32) ValueCell!764)) mapDefault!2322)))))

(assert (=> mapNonEmpty!2319 (= tp!6909 (and e!33508 mapRes!2322))))

(declare-fun mapIsEmpty!2322 () Bool)

(assert (=> mapIsEmpty!2322 mapRes!2322))

(assert (= (and mapNonEmpty!2319 condMapEmpty!2322) mapIsEmpty!2322))

(assert (= (and mapNonEmpty!2319 (not condMapEmpty!2322)) mapNonEmpty!2322))

(assert (= (and mapNonEmpty!2322 ((_ is ValueCellFull!764) mapValue!2322)) b!51650))

(assert (= (and mapNonEmpty!2319 ((_ is ValueCellFull!764) mapDefault!2322)) b!51651))

(declare-fun m!44401 () Bool)

(assert (=> mapNonEmpty!2322 m!44401))

(check-sat (not d!10361) (not b!51642) (not d!10353) (not b!51645) (not b_next!1599) (not b_next!1597) (not b!51647) (not d!10365) (not b!51587) (not b!51590) (not b!51588) (not b!51644) (not bm!3950) tp_is_empty!2215 (not b!51611) (not b!51593) (not b!51574) (not d!10369) (not b!51646) b_and!2809 (not bm!3947) (not mapNonEmpty!2322) (not b!51627) (not b!51602) (not bm!3953) (not b!51640) (not b!51577) (not mapNonEmpty!2321) (not bm!3946) b_and!2811)
(check-sat b_and!2809 b_and!2811 (not b_next!1597) (not b_next!1599))
