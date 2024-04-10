; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!13548 () Bool)

(assert start!13548)

(declare-fun b!124369 () Bool)

(declare-fun b_free!2837 () Bool)

(declare-fun b_next!2837 () Bool)

(assert (=> b!124369 (= b_free!2837 (not b_next!2837))))

(declare-fun tp!10910 () Bool)

(declare-fun b_and!7643 () Bool)

(assert (=> b!124369 (= tp!10910 b_and!7643)))

(declare-fun b!124375 () Bool)

(declare-fun b_free!2839 () Bool)

(declare-fun b_next!2839 () Bool)

(assert (=> b!124375 (= b_free!2839 (not b_next!2839))))

(declare-fun tp!10911 () Bool)

(declare-fun b_and!7645 () Bool)

(assert (=> b!124375 (= tp!10911 b_and!7645)))

(declare-fun mapNonEmpty!4473 () Bool)

(declare-fun mapRes!4473 () Bool)

(declare-fun tp!10912 () Bool)

(declare-fun e!81312 () Bool)

(assert (=> mapNonEmpty!4473 (= mapRes!4473 (and tp!10912 e!81312))))

(declare-datatypes ((V!3427 0))(
  ( (V!3428 (val!1462 Int)) )
))
(declare-datatypes ((array!4685 0))(
  ( (array!4686 (arr!2219 (Array (_ BitVec 32) (_ BitVec 64))) (size!2482 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1074 0))(
  ( (ValueCellFull!1074 (v!3107 V!3427)) (EmptyCell!1074) )
))
(declare-datatypes ((array!4687 0))(
  ( (array!4688 (arr!2220 (Array (_ BitVec 32) ValueCell!1074)) (size!2483 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1056 0))(
  ( (LongMapFixedSize!1057 (defaultEntry!2764 Int) (mask!7010 (_ BitVec 32)) (extraKeys!2549 (_ BitVec 32)) (zeroValue!2629 V!3427) (minValue!2629 V!3427) (_size!577 (_ BitVec 32)) (_keys!4493 array!4685) (_values!2747 array!4687) (_vacant!577 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!850 0))(
  ( (Cell!851 (v!3108 LongMapFixedSize!1056)) )
))
(declare-datatypes ((LongMap!850 0))(
  ( (LongMap!851 (underlying!436 Cell!850)) )
))
(declare-fun thiss!992 () LongMap!850)

(declare-fun mapRest!4473 () (Array (_ BitVec 32) ValueCell!1074))

(declare-fun mapKey!4474 () (_ BitVec 32))

(declare-fun mapValue!4473 () ValueCell!1074)

(assert (=> mapNonEmpty!4473 (= (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) (store mapRest!4473 mapKey!4474 mapValue!4473))))

(declare-fun b!124367 () Bool)

(declare-fun res!60290 () Bool)

(declare-fun e!81313 () Bool)

(assert (=> b!124367 (=> (not res!60290) (not e!81313))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!124367 (= res!60290 (validMask!0 (mask!7010 (v!3108 (underlying!436 thiss!992)))))))

(declare-fun b!124368 () Bool)

(declare-fun e!81311 () Bool)

(assert (=> b!124368 (= e!81311 e!81313)))

(declare-fun res!60292 () Bool)

(assert (=> b!124368 (=> (not res!60292) (not e!81313))))

(declare-fun from!355 () (_ BitVec 32))

(declare-datatypes ((tuple2!2568 0))(
  ( (tuple2!2569 (_1!1295 (_ BitVec 64)) (_2!1295 V!3427)) )
))
(declare-datatypes ((List!1695 0))(
  ( (Nil!1692) (Cons!1691 (h!2292 tuple2!2568) (t!6022 List!1695)) )
))
(declare-datatypes ((ListLongMap!1677 0))(
  ( (ListLongMap!1678 (toList!854 List!1695)) )
))
(declare-fun lt!63941 () ListLongMap!1677)

(declare-fun contains!873 (ListLongMap!1677 (_ BitVec 64)) Bool)

(assert (=> b!124368 (= res!60292 (contains!873 lt!63941 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355)))))

(declare-datatypes ((tuple2!2570 0))(
  ( (tuple2!2571 (_1!1296 Bool) (_2!1296 LongMapFixedSize!1056)) )
))
(declare-fun lt!63942 () tuple2!2570)

(declare-fun newMap!16 () LongMapFixedSize!1056)

(declare-fun update!180 (LongMapFixedSize!1056 (_ BitVec 64) V!3427) tuple2!2570)

(declare-fun get!1436 (ValueCell!1074 V!3427) V!3427)

(declare-fun dynLambda!411 (Int (_ BitVec 64)) V!3427)

(assert (=> b!124368 (= lt!63942 (update!180 newMap!16 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!81307 () Bool)

(declare-fun tp_is_empty!2835 () Bool)

(declare-fun e!81314 () Bool)

(declare-fun array_inv!1393 (array!4685) Bool)

(declare-fun array_inv!1394 (array!4687) Bool)

(assert (=> b!124369 (= e!81314 (and tp!10910 tp_is_empty!2835 (array_inv!1393 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) (array_inv!1394 (_values!2747 (v!3108 (underlying!436 thiss!992)))) e!81307))))

(declare-fun mapIsEmpty!4473 () Bool)

(assert (=> mapIsEmpty!4473 mapRes!4473))

(declare-fun b!124370 () Bool)

(declare-fun e!81319 () Bool)

(assert (=> b!124370 (= e!81319 tp_is_empty!2835)))

(declare-fun b!124371 () Bool)

(declare-fun res!60287 () Bool)

(declare-fun e!81309 () Bool)

(assert (=> b!124371 (=> (not res!60287) (not e!81309))))

(assert (=> b!124371 (= res!60287 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2482 (_keys!4493 (v!3108 (underlying!436 thiss!992)))))))))

(declare-fun b!124372 () Bool)

(declare-fun e!81308 () Bool)

(assert (=> b!124372 (= e!81308 e!81314)))

(declare-fun b!124373 () Bool)

(assert (=> b!124373 (= e!81313 (not (= (size!2483 (_values!2747 (v!3108 (underlying!436 thiss!992)))) (bvadd #b00000000000000000000000000000001 (mask!7010 (v!3108 (underlying!436 thiss!992)))))))))

(declare-fun b!124374 () Bool)

(declare-fun e!81320 () Bool)

(declare-fun mapRes!4474 () Bool)

(assert (=> b!124374 (= e!81320 (and e!81319 mapRes!4474))))

(declare-fun condMapEmpty!4474 () Bool)

(declare-fun mapDefault!4474 () ValueCell!1074)

(assert (=> b!124374 (= condMapEmpty!4474 (= (arr!2220 (_values!2747 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!1074)) mapDefault!4474)))))

(declare-fun e!81306 () Bool)

(assert (=> b!124375 (= e!81306 (and tp!10911 tp_is_empty!2835 (array_inv!1393 (_keys!4493 newMap!16)) (array_inv!1394 (_values!2747 newMap!16)) e!81320))))

(declare-fun mapIsEmpty!4474 () Bool)

(assert (=> mapIsEmpty!4474 mapRes!4474))

(declare-fun b!124377 () Bool)

(assert (=> b!124377 (= e!81312 tp_is_empty!2835)))

(declare-fun b!124378 () Bool)

(declare-fun res!60291 () Bool)

(assert (=> b!124378 (=> (not res!60291) (not e!81309))))

(declare-fun valid!502 (LongMapFixedSize!1056) Bool)

(assert (=> b!124378 (= res!60291 (valid!502 newMap!16))))

(declare-fun b!124379 () Bool)

(declare-fun e!81310 () Bool)

(assert (=> b!124379 (= e!81307 (and e!81310 mapRes!4473))))

(declare-fun condMapEmpty!4473 () Bool)

(declare-fun mapDefault!4473 () ValueCell!1074)

(assert (=> b!124379 (= condMapEmpty!4473 (= (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!1074)) mapDefault!4473)))))

(declare-fun mapNonEmpty!4474 () Bool)

(declare-fun tp!10909 () Bool)

(declare-fun e!81316 () Bool)

(assert (=> mapNonEmpty!4474 (= mapRes!4474 (and tp!10909 e!81316))))

(declare-fun mapKey!4473 () (_ BitVec 32))

(declare-fun mapRest!4474 () (Array (_ BitVec 32) ValueCell!1074))

(declare-fun mapValue!4474 () ValueCell!1074)

(assert (=> mapNonEmpty!4474 (= (arr!2220 (_values!2747 newMap!16)) (store mapRest!4474 mapKey!4473 mapValue!4474))))

(declare-fun b!124380 () Bool)

(declare-fun res!60288 () Bool)

(assert (=> b!124380 (=> (not res!60288) (not e!81309))))

(assert (=> b!124380 (= res!60288 (bvsge (bvadd #b00000000000000000000000000000001 (mask!7010 newMap!16)) (_size!577 (v!3108 (underlying!436 thiss!992)))))))

(declare-fun b!124381 () Bool)

(assert (=> b!124381 (= e!81316 tp_is_empty!2835)))

(declare-fun b!124382 () Bool)

(assert (=> b!124382 (= e!81310 tp_is_empty!2835)))

(declare-fun b!124383 () Bool)

(declare-fun e!81315 () Bool)

(assert (=> b!124383 (= e!81315 e!81308)))

(declare-fun res!60289 () Bool)

(assert (=> start!13548 (=> (not res!60289) (not e!81309))))

(declare-fun valid!503 (LongMap!850) Bool)

(assert (=> start!13548 (= res!60289 (valid!503 thiss!992))))

(assert (=> start!13548 e!81309))

(assert (=> start!13548 e!81315))

(assert (=> start!13548 true))

(assert (=> start!13548 e!81306))

(declare-fun b!124376 () Bool)

(assert (=> b!124376 (= e!81309 e!81311)))

(declare-fun res!60293 () Bool)

(assert (=> b!124376 (=> (not res!60293) (not e!81311))))

(declare-fun lt!63943 () ListLongMap!1677)

(assert (=> b!124376 (= res!60293 (and (= lt!63943 lt!63941) (not (= (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun map!1384 (LongMapFixedSize!1056) ListLongMap!1677)

(assert (=> b!124376 (= lt!63941 (map!1384 newMap!16))))

(declare-fun getCurrentListMap!535 (array!4685 array!4687 (_ BitVec 32) (_ BitVec 32) V!3427 V!3427 (_ BitVec 32) Int) ListLongMap!1677)

(assert (=> b!124376 (= lt!63943 (getCurrentListMap!535 (_keys!4493 (v!3108 (underlying!436 thiss!992))) (_values!2747 (v!3108 (underlying!436 thiss!992))) (mask!7010 (v!3108 (underlying!436 thiss!992))) (extraKeys!2549 (v!3108 (underlying!436 thiss!992))) (zeroValue!2629 (v!3108 (underlying!436 thiss!992))) (minValue!2629 (v!3108 (underlying!436 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2764 (v!3108 (underlying!436 thiss!992)))))))

(assert (= (and start!13548 res!60289) b!124371))

(assert (= (and b!124371 res!60287) b!124378))

(assert (= (and b!124378 res!60291) b!124380))

(assert (= (and b!124380 res!60288) b!124376))

(assert (= (and b!124376 res!60293) b!124368))

(assert (= (and b!124368 res!60292) b!124367))

(assert (= (and b!124367 res!60290) b!124373))

(assert (= (and b!124379 condMapEmpty!4473) mapIsEmpty!4473))

(assert (= (and b!124379 (not condMapEmpty!4473)) mapNonEmpty!4473))

(get-info :version)

(assert (= (and mapNonEmpty!4473 ((_ is ValueCellFull!1074) mapValue!4473)) b!124377))

(assert (= (and b!124379 ((_ is ValueCellFull!1074) mapDefault!4473)) b!124382))

(assert (= b!124369 b!124379))

(assert (= b!124372 b!124369))

(assert (= b!124383 b!124372))

(assert (= start!13548 b!124383))

(assert (= (and b!124374 condMapEmpty!4474) mapIsEmpty!4474))

(assert (= (and b!124374 (not condMapEmpty!4474)) mapNonEmpty!4474))

(assert (= (and mapNonEmpty!4474 ((_ is ValueCellFull!1074) mapValue!4474)) b!124381))

(assert (= (and b!124374 ((_ is ValueCellFull!1074) mapDefault!4474)) b!124370))

(assert (= b!124375 b!124374))

(assert (= start!13548 b!124375))

(declare-fun b_lambda!5459 () Bool)

(assert (=> (not b_lambda!5459) (not b!124368)))

(declare-fun t!6019 () Bool)

(declare-fun tb!2289 () Bool)

(assert (=> (and b!124369 (= (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) (defaultEntry!2764 (v!3108 (underlying!436 thiss!992)))) t!6019) tb!2289))

(declare-fun result!3805 () Bool)

(assert (=> tb!2289 (= result!3805 tp_is_empty!2835)))

(assert (=> b!124368 t!6019))

(declare-fun b_and!7647 () Bool)

(assert (= b_and!7643 (and (=> t!6019 result!3805) b_and!7647)))

(declare-fun tb!2291 () Bool)

(declare-fun t!6021 () Bool)

(assert (=> (and b!124375 (= (defaultEntry!2764 newMap!16) (defaultEntry!2764 (v!3108 (underlying!436 thiss!992)))) t!6021) tb!2291))

(declare-fun result!3809 () Bool)

(assert (= result!3809 result!3805))

(assert (=> b!124368 t!6021))

(declare-fun b_and!7649 () Bool)

(assert (= b_and!7645 (and (=> t!6021 result!3809) b_and!7649)))

(declare-fun m!144413 () Bool)

(assert (=> b!124367 m!144413))

(declare-fun m!144415 () Bool)

(assert (=> b!124376 m!144415))

(declare-fun m!144417 () Bool)

(assert (=> b!124376 m!144417))

(declare-fun m!144419 () Bool)

(assert (=> b!124376 m!144419))

(declare-fun m!144421 () Bool)

(assert (=> b!124368 m!144421))

(declare-fun m!144423 () Bool)

(assert (=> b!124368 m!144423))

(declare-fun m!144425 () Bool)

(assert (=> b!124368 m!144425))

(assert (=> b!124368 m!144415))

(assert (=> b!124368 m!144415))

(declare-fun m!144427 () Bool)

(assert (=> b!124368 m!144427))

(assert (=> b!124368 m!144423))

(assert (=> b!124368 m!144415))

(assert (=> b!124368 m!144425))

(declare-fun m!144429 () Bool)

(assert (=> b!124368 m!144429))

(assert (=> b!124368 m!144421))

(declare-fun m!144431 () Bool)

(assert (=> b!124375 m!144431))

(declare-fun m!144433 () Bool)

(assert (=> b!124375 m!144433))

(declare-fun m!144435 () Bool)

(assert (=> mapNonEmpty!4473 m!144435))

(declare-fun m!144437 () Bool)

(assert (=> b!124369 m!144437))

(declare-fun m!144439 () Bool)

(assert (=> b!124369 m!144439))

(declare-fun m!144441 () Bool)

(assert (=> start!13548 m!144441))

(declare-fun m!144443 () Bool)

(assert (=> b!124378 m!144443))

(declare-fun m!144445 () Bool)

(assert (=> mapNonEmpty!4474 m!144445))

(check-sat (not b!124368) (not b!124376) (not b_next!2837) tp_is_empty!2835 (not b_lambda!5459) (not b_next!2839) (not b!124369) (not b!124367) b_and!7649 (not b!124375) b_and!7647 (not mapNonEmpty!4474) (not start!13548) (not b!124378) (not mapNonEmpty!4473))
(check-sat b_and!7647 b_and!7649 (not b_next!2837) (not b_next!2839))
(get-model)

(declare-fun b_lambda!5463 () Bool)

(assert (= b_lambda!5459 (or (and b!124369 b_free!2837) (and b!124375 b_free!2839 (= (defaultEntry!2764 newMap!16) (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))))) b_lambda!5463)))

(check-sat (not b!124368) (not b!124376) (not b_next!2837) (not b_lambda!5463) tp_is_empty!2835 (not b_next!2839) (not b!124369) (not b!124367) b_and!7649 (not b!124375) b_and!7647 (not mapNonEmpty!4474) (not start!13548) (not b!124378) (not mapNonEmpty!4473))
(check-sat b_and!7647 b_and!7649 (not b_next!2837) (not b_next!2839))
(get-model)

(declare-fun d!37285 () Bool)

(assert (=> d!37285 (= (array_inv!1393 (_keys!4493 newMap!16)) (bvsge (size!2482 (_keys!4493 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!124375 d!37285))

(declare-fun d!37287 () Bool)

(assert (=> d!37287 (= (array_inv!1394 (_values!2747 newMap!16)) (bvsge (size!2483 (_values!2747 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!124375 d!37287))

(declare-fun d!37289 () Bool)

(assert (=> d!37289 (= (array_inv!1393 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) (bvsge (size!2482 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!124369 d!37289))

(declare-fun d!37291 () Bool)

(assert (=> d!37291 (= (array_inv!1394 (_values!2747 (v!3108 (underlying!436 thiss!992)))) (bvsge (size!2483 (_values!2747 (v!3108 (underlying!436 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!124369 d!37291))

(declare-fun d!37293 () Bool)

(assert (=> d!37293 (= (valid!503 thiss!992) (valid!502 (v!3108 (underlying!436 thiss!992))))))

(declare-fun bs!5147 () Bool)

(assert (= bs!5147 d!37293))

(declare-fun m!144481 () Bool)

(assert (=> bs!5147 m!144481))

(assert (=> start!13548 d!37293))

(declare-fun d!37295 () Bool)

(declare-fun res!60321 () Bool)

(declare-fun e!81368 () Bool)

(assert (=> d!37295 (=> (not res!60321) (not e!81368))))

(declare-fun simpleValid!86 (LongMapFixedSize!1056) Bool)

(assert (=> d!37295 (= res!60321 (simpleValid!86 newMap!16))))

(assert (=> d!37295 (= (valid!502 newMap!16) e!81368)))

(declare-fun b!124445 () Bool)

(declare-fun res!60322 () Bool)

(assert (=> b!124445 (=> (not res!60322) (not e!81368))))

(declare-fun arrayCountValidKeys!0 (array!4685 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!124445 (= res!60322 (= (arrayCountValidKeys!0 (_keys!4493 newMap!16) #b00000000000000000000000000000000 (size!2482 (_keys!4493 newMap!16))) (_size!577 newMap!16)))))

(declare-fun b!124446 () Bool)

(declare-fun res!60323 () Bool)

(assert (=> b!124446 (=> (not res!60323) (not e!81368))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!4685 (_ BitVec 32)) Bool)

(assert (=> b!124446 (= res!60323 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4493 newMap!16) (mask!7010 newMap!16)))))

(declare-fun b!124447 () Bool)

(declare-datatypes ((List!1696 0))(
  ( (Nil!1693) (Cons!1692 (h!2293 (_ BitVec 64)) (t!6027 List!1696)) )
))
(declare-fun arrayNoDuplicates!0 (array!4685 (_ BitVec 32) List!1696) Bool)

(assert (=> b!124447 (= e!81368 (arrayNoDuplicates!0 (_keys!4493 newMap!16) #b00000000000000000000000000000000 Nil!1693))))

(assert (= (and d!37295 res!60321) b!124445))

(assert (= (and b!124445 res!60322) b!124446))

(assert (= (and b!124446 res!60323) b!124447))

(declare-fun m!144483 () Bool)

(assert (=> d!37295 m!144483))

(declare-fun m!144485 () Bool)

(assert (=> b!124445 m!144485))

(declare-fun m!144487 () Bool)

(assert (=> b!124446 m!144487))

(declare-fun m!144489 () Bool)

(assert (=> b!124447 m!144489))

(assert (=> b!124378 d!37295))

(declare-fun d!37297 () Bool)

(assert (=> d!37297 (= (map!1384 newMap!16) (getCurrentListMap!535 (_keys!4493 newMap!16) (_values!2747 newMap!16) (mask!7010 newMap!16) (extraKeys!2549 newMap!16) (zeroValue!2629 newMap!16) (minValue!2629 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2764 newMap!16)))))

(declare-fun bs!5148 () Bool)

(assert (= bs!5148 d!37297))

(declare-fun m!144491 () Bool)

(assert (=> bs!5148 m!144491))

(assert (=> b!124376 d!37297))

(declare-fun bm!13259 () Bool)

(declare-fun call!13262 () ListLongMap!1677)

(declare-fun getCurrentListMapNoExtraKeys!135 (array!4685 array!4687 (_ BitVec 32) (_ BitVec 32) V!3427 V!3427 (_ BitVec 32) Int) ListLongMap!1677)

(assert (=> bm!13259 (= call!13262 (getCurrentListMapNoExtraKeys!135 (_keys!4493 (v!3108 (underlying!436 thiss!992))) (_values!2747 (v!3108 (underlying!436 thiss!992))) (mask!7010 (v!3108 (underlying!436 thiss!992))) (extraKeys!2549 (v!3108 (underlying!436 thiss!992))) (zeroValue!2629 (v!3108 (underlying!436 thiss!992))) (minValue!2629 (v!3108 (underlying!436 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2764 (v!3108 (underlying!436 thiss!992)))))))

(declare-fun call!13264 () ListLongMap!1677)

(declare-fun call!13268 () ListLongMap!1677)

(declare-fun call!13263 () ListLongMap!1677)

(declare-fun c!22603 () Bool)

(declare-fun bm!13260 () Bool)

(declare-fun c!22605 () Bool)

(declare-fun +!169 (ListLongMap!1677 tuple2!2568) ListLongMap!1677)

(assert (=> bm!13260 (= call!13268 (+!169 (ite c!22605 call!13262 (ite c!22603 call!13264 call!13263)) (ite (or c!22605 c!22603) (tuple2!2569 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2629 (v!3108 (underlying!436 thiss!992)))) (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2629 (v!3108 (underlying!436 thiss!992)))))))))

(declare-fun bm!13261 () Bool)

(assert (=> bm!13261 (= call!13264 call!13262)))

(declare-fun b!124491 () Bool)

(declare-fun e!81398 () ListLongMap!1677)

(declare-fun call!13267 () ListLongMap!1677)

(assert (=> b!124491 (= e!81398 call!13267)))

(declare-fun b!124492 () Bool)

(declare-fun e!81403 () ListLongMap!1677)

(assert (=> b!124492 (= e!81403 call!13263)))

(declare-fun b!124493 () Bool)

(declare-fun e!81405 () ListLongMap!1677)

(assert (=> b!124493 (= e!81405 e!81398)))

(assert (=> b!124493 (= c!22603 (and (not (= (bvand (extraKeys!2549 (v!3108 (underlying!436 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2549 (v!3108 (underlying!436 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!124494 () Bool)

(declare-fun e!81406 () Bool)

(declare-fun call!13266 () Bool)

(assert (=> b!124494 (= e!81406 (not call!13266))))

(declare-fun b!124495 () Bool)

(declare-fun e!81401 () Bool)

(declare-fun e!81404 () Bool)

(assert (=> b!124495 (= e!81401 e!81404)))

(declare-fun res!60350 () Bool)

(assert (=> b!124495 (=> (not res!60350) (not e!81404))))

(declare-fun lt!64012 () ListLongMap!1677)

(assert (=> b!124495 (= res!60350 (contains!873 lt!64012 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!124495 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2482 (_keys!4493 (v!3108 (underlying!436 thiss!992))))))))

(declare-fun bm!13262 () Bool)

(assert (=> bm!13262 (= call!13263 call!13264)))

(declare-fun b!124496 () Bool)

(declare-fun e!81402 () Bool)

(declare-fun call!13265 () Bool)

(assert (=> b!124496 (= e!81402 (not call!13265))))

(declare-fun b!124497 () Bool)

(declare-datatypes ((Unit!3867 0))(
  ( (Unit!3868) )
))
(declare-fun e!81400 () Unit!3867)

(declare-fun Unit!3869 () Unit!3867)

(assert (=> b!124497 (= e!81400 Unit!3869)))

(declare-fun b!124498 () Bool)

(declare-fun e!81395 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!124498 (= e!81395 (validKeyInArray!0 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!124499 () Bool)

(declare-fun e!81396 () Bool)

(assert (=> b!124499 (= e!81402 e!81396)))

(declare-fun res!60343 () Bool)

(assert (=> b!124499 (= res!60343 call!13265)))

(assert (=> b!124499 (=> (not res!60343) (not e!81396))))

(declare-fun b!124500 () Bool)

(declare-fun lt!64008 () Unit!3867)

(assert (=> b!124500 (= e!81400 lt!64008)))

(declare-fun lt!63997 () ListLongMap!1677)

(assert (=> b!124500 (= lt!63997 (getCurrentListMapNoExtraKeys!135 (_keys!4493 (v!3108 (underlying!436 thiss!992))) (_values!2747 (v!3108 (underlying!436 thiss!992))) (mask!7010 (v!3108 (underlying!436 thiss!992))) (extraKeys!2549 (v!3108 (underlying!436 thiss!992))) (zeroValue!2629 (v!3108 (underlying!436 thiss!992))) (minValue!2629 (v!3108 (underlying!436 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2764 (v!3108 (underlying!436 thiss!992)))))))

(declare-fun lt!64003 () (_ BitVec 64))

(assert (=> b!124500 (= lt!64003 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!64013 () (_ BitVec 64))

(assert (=> b!124500 (= lt!64013 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!63998 () Unit!3867)

(declare-fun addStillContains!86 (ListLongMap!1677 (_ BitVec 64) V!3427 (_ BitVec 64)) Unit!3867)

(assert (=> b!124500 (= lt!63998 (addStillContains!86 lt!63997 lt!64003 (zeroValue!2629 (v!3108 (underlying!436 thiss!992))) lt!64013))))

(assert (=> b!124500 (contains!873 (+!169 lt!63997 (tuple2!2569 lt!64003 (zeroValue!2629 (v!3108 (underlying!436 thiss!992))))) lt!64013)))

(declare-fun lt!64015 () Unit!3867)

(assert (=> b!124500 (= lt!64015 lt!63998)))

(declare-fun lt!64016 () ListLongMap!1677)

(assert (=> b!124500 (= lt!64016 (getCurrentListMapNoExtraKeys!135 (_keys!4493 (v!3108 (underlying!436 thiss!992))) (_values!2747 (v!3108 (underlying!436 thiss!992))) (mask!7010 (v!3108 (underlying!436 thiss!992))) (extraKeys!2549 (v!3108 (underlying!436 thiss!992))) (zeroValue!2629 (v!3108 (underlying!436 thiss!992))) (minValue!2629 (v!3108 (underlying!436 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2764 (v!3108 (underlying!436 thiss!992)))))))

(declare-fun lt!63999 () (_ BitVec 64))

(assert (=> b!124500 (= lt!63999 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!64011 () (_ BitVec 64))

(assert (=> b!124500 (= lt!64011 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!64009 () Unit!3867)

(declare-fun addApplyDifferent!86 (ListLongMap!1677 (_ BitVec 64) V!3427 (_ BitVec 64)) Unit!3867)

(assert (=> b!124500 (= lt!64009 (addApplyDifferent!86 lt!64016 lt!63999 (minValue!2629 (v!3108 (underlying!436 thiss!992))) lt!64011))))

(declare-fun apply!110 (ListLongMap!1677 (_ BitVec 64)) V!3427)

(assert (=> b!124500 (= (apply!110 (+!169 lt!64016 (tuple2!2569 lt!63999 (minValue!2629 (v!3108 (underlying!436 thiss!992))))) lt!64011) (apply!110 lt!64016 lt!64011))))

(declare-fun lt!64014 () Unit!3867)

(assert (=> b!124500 (= lt!64014 lt!64009)))

(declare-fun lt!64007 () ListLongMap!1677)

(assert (=> b!124500 (= lt!64007 (getCurrentListMapNoExtraKeys!135 (_keys!4493 (v!3108 (underlying!436 thiss!992))) (_values!2747 (v!3108 (underlying!436 thiss!992))) (mask!7010 (v!3108 (underlying!436 thiss!992))) (extraKeys!2549 (v!3108 (underlying!436 thiss!992))) (zeroValue!2629 (v!3108 (underlying!436 thiss!992))) (minValue!2629 (v!3108 (underlying!436 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2764 (v!3108 (underlying!436 thiss!992)))))))

(declare-fun lt!64017 () (_ BitVec 64))

(assert (=> b!124500 (= lt!64017 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!64005 () (_ BitVec 64))

(assert (=> b!124500 (= lt!64005 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!64018 () Unit!3867)

(assert (=> b!124500 (= lt!64018 (addApplyDifferent!86 lt!64007 lt!64017 (zeroValue!2629 (v!3108 (underlying!436 thiss!992))) lt!64005))))

(assert (=> b!124500 (= (apply!110 (+!169 lt!64007 (tuple2!2569 lt!64017 (zeroValue!2629 (v!3108 (underlying!436 thiss!992))))) lt!64005) (apply!110 lt!64007 lt!64005))))

(declare-fun lt!64010 () Unit!3867)

(assert (=> b!124500 (= lt!64010 lt!64018)))

(declare-fun lt!64004 () ListLongMap!1677)

(assert (=> b!124500 (= lt!64004 (getCurrentListMapNoExtraKeys!135 (_keys!4493 (v!3108 (underlying!436 thiss!992))) (_values!2747 (v!3108 (underlying!436 thiss!992))) (mask!7010 (v!3108 (underlying!436 thiss!992))) (extraKeys!2549 (v!3108 (underlying!436 thiss!992))) (zeroValue!2629 (v!3108 (underlying!436 thiss!992))) (minValue!2629 (v!3108 (underlying!436 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2764 (v!3108 (underlying!436 thiss!992)))))))

(declare-fun lt!64001 () (_ BitVec 64))

(assert (=> b!124500 (= lt!64001 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!64002 () (_ BitVec 64))

(assert (=> b!124500 (= lt!64002 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(assert (=> b!124500 (= lt!64008 (addApplyDifferent!86 lt!64004 lt!64001 (minValue!2629 (v!3108 (underlying!436 thiss!992))) lt!64002))))

(assert (=> b!124500 (= (apply!110 (+!169 lt!64004 (tuple2!2569 lt!64001 (minValue!2629 (v!3108 (underlying!436 thiss!992))))) lt!64002) (apply!110 lt!64004 lt!64002))))

(declare-fun b!124501 () Bool)

(declare-fun res!60348 () Bool)

(declare-fun e!81399 () Bool)

(assert (=> b!124501 (=> (not res!60348) (not e!81399))))

(assert (=> b!124501 (= res!60348 e!81402)))

(declare-fun c!22601 () Bool)

(assert (=> b!124501 (= c!22601 (not (= (bvand (extraKeys!2549 (v!3108 (underlying!436 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!124502 () Bool)

(declare-fun c!22604 () Bool)

(assert (=> b!124502 (= c!22604 (and (not (= (bvand (extraKeys!2549 (v!3108 (underlying!436 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2549 (v!3108 (underlying!436 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!124502 (= e!81398 e!81403)))

(declare-fun b!124503 () Bool)

(assert (=> b!124503 (= e!81396 (= (apply!110 lt!64012 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2629 (v!3108 (underlying!436 thiss!992)))))))

(declare-fun bm!13263 () Bool)

(assert (=> bm!13263 (= call!13265 (contains!873 lt!64012 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!124504 () Bool)

(assert (=> b!124504 (= e!81405 (+!169 call!13268 (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2629 (v!3108 (underlying!436 thiss!992))))))))

(declare-fun b!124490 () Bool)

(assert (=> b!124490 (= e!81404 (= (apply!110 lt!64012 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!124490 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2483 (_values!2747 (v!3108 (underlying!436 thiss!992))))))))

(assert (=> b!124490 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2482 (_keys!4493 (v!3108 (underlying!436 thiss!992))))))))

(declare-fun d!37299 () Bool)

(assert (=> d!37299 e!81399))

(declare-fun res!60344 () Bool)

(assert (=> d!37299 (=> (not res!60344) (not e!81399))))

(assert (=> d!37299 (= res!60344 (or (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2482 (_keys!4493 (v!3108 (underlying!436 thiss!992))))) (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2482 (_keys!4493 (v!3108 (underlying!436 thiss!992))))))))))

(declare-fun lt!64000 () ListLongMap!1677)

(assert (=> d!37299 (= lt!64012 lt!64000)))

(declare-fun lt!64006 () Unit!3867)

(assert (=> d!37299 (= lt!64006 e!81400)))

(declare-fun c!22602 () Bool)

(declare-fun e!81397 () Bool)

(assert (=> d!37299 (= c!22602 e!81397)))

(declare-fun res!60345 () Bool)

(assert (=> d!37299 (=> (not res!60345) (not e!81397))))

(assert (=> d!37299 (= res!60345 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2482 (_keys!4493 (v!3108 (underlying!436 thiss!992))))))))

(assert (=> d!37299 (= lt!64000 e!81405)))

(assert (=> d!37299 (= c!22605 (and (not (= (bvand (extraKeys!2549 (v!3108 (underlying!436 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2549 (v!3108 (underlying!436 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!37299 (validMask!0 (mask!7010 (v!3108 (underlying!436 thiss!992))))))

(assert (=> d!37299 (= (getCurrentListMap!535 (_keys!4493 (v!3108 (underlying!436 thiss!992))) (_values!2747 (v!3108 (underlying!436 thiss!992))) (mask!7010 (v!3108 (underlying!436 thiss!992))) (extraKeys!2549 (v!3108 (underlying!436 thiss!992))) (zeroValue!2629 (v!3108 (underlying!436 thiss!992))) (minValue!2629 (v!3108 (underlying!436 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2764 (v!3108 (underlying!436 thiss!992)))) lt!64012)))

(declare-fun bm!13264 () Bool)

(assert (=> bm!13264 (= call!13267 call!13268)))

(declare-fun b!124505 () Bool)

(assert (=> b!124505 (= e!81399 e!81406)))

(declare-fun c!22600 () Bool)

(assert (=> b!124505 (= c!22600 (not (= (bvand (extraKeys!2549 (v!3108 (underlying!436 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!13265 () Bool)

(assert (=> bm!13265 (= call!13266 (contains!873 lt!64012 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!124506 () Bool)

(assert (=> b!124506 (= e!81397 (validKeyInArray!0 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!124507 () Bool)

(declare-fun e!81407 () Bool)

(assert (=> b!124507 (= e!81406 e!81407)))

(declare-fun res!60349 () Bool)

(assert (=> b!124507 (= res!60349 call!13266)))

(assert (=> b!124507 (=> (not res!60349) (not e!81407))))

(declare-fun b!124508 () Bool)

(declare-fun res!60346 () Bool)

(assert (=> b!124508 (=> (not res!60346) (not e!81399))))

(assert (=> b!124508 (= res!60346 e!81401)))

(declare-fun res!60342 () Bool)

(assert (=> b!124508 (=> res!60342 e!81401)))

(assert (=> b!124508 (= res!60342 (not e!81395))))

(declare-fun res!60347 () Bool)

(assert (=> b!124508 (=> (not res!60347) (not e!81395))))

(assert (=> b!124508 (= res!60347 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2482 (_keys!4493 (v!3108 (underlying!436 thiss!992))))))))

(declare-fun b!124509 () Bool)

(assert (=> b!124509 (= e!81403 call!13267)))

(declare-fun b!124510 () Bool)

(assert (=> b!124510 (= e!81407 (= (apply!110 lt!64012 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2629 (v!3108 (underlying!436 thiss!992)))))))

(assert (= (and d!37299 c!22605) b!124504))

(assert (= (and d!37299 (not c!22605)) b!124493))

(assert (= (and b!124493 c!22603) b!124491))

(assert (= (and b!124493 (not c!22603)) b!124502))

(assert (= (and b!124502 c!22604) b!124509))

(assert (= (and b!124502 (not c!22604)) b!124492))

(assert (= (or b!124509 b!124492) bm!13262))

(assert (= (or b!124491 bm!13262) bm!13261))

(assert (= (or b!124491 b!124509) bm!13264))

(assert (= (or b!124504 bm!13261) bm!13259))

(assert (= (or b!124504 bm!13264) bm!13260))

(assert (= (and d!37299 res!60345) b!124506))

(assert (= (and d!37299 c!22602) b!124500))

(assert (= (and d!37299 (not c!22602)) b!124497))

(assert (= (and d!37299 res!60344) b!124508))

(assert (= (and b!124508 res!60347) b!124498))

(assert (= (and b!124508 (not res!60342)) b!124495))

(assert (= (and b!124495 res!60350) b!124490))

(assert (= (and b!124508 res!60346) b!124501))

(assert (= (and b!124501 c!22601) b!124499))

(assert (= (and b!124501 (not c!22601)) b!124496))

(assert (= (and b!124499 res!60343) b!124503))

(assert (= (or b!124499 b!124496) bm!13263))

(assert (= (and b!124501 res!60348) b!124505))

(assert (= (and b!124505 c!22600) b!124507))

(assert (= (and b!124505 (not c!22600)) b!124494))

(assert (= (and b!124507 res!60349) b!124510))

(assert (= (or b!124507 b!124494) bm!13265))

(declare-fun b_lambda!5465 () Bool)

(assert (=> (not b_lambda!5465) (not b!124490)))

(assert (=> b!124490 t!6019))

(declare-fun b_and!7659 () Bool)

(assert (= b_and!7647 (and (=> t!6019 result!3805) b_and!7659)))

(assert (=> b!124490 t!6021))

(declare-fun b_and!7661 () Bool)

(assert (= b_and!7649 (and (=> t!6021 result!3809) b_and!7661)))

(declare-fun m!144493 () Bool)

(assert (=> b!124506 m!144493))

(assert (=> b!124506 m!144493))

(declare-fun m!144495 () Bool)

(assert (=> b!124506 m!144495))

(declare-fun m!144497 () Bool)

(assert (=> b!124490 m!144497))

(assert (=> b!124490 m!144423))

(declare-fun m!144499 () Bool)

(assert (=> b!124490 m!144499))

(assert (=> b!124490 m!144493))

(assert (=> b!124490 m!144423))

(assert (=> b!124490 m!144493))

(declare-fun m!144501 () Bool)

(assert (=> b!124490 m!144501))

(assert (=> b!124490 m!144497))

(assert (=> b!124498 m!144493))

(assert (=> b!124498 m!144493))

(assert (=> b!124498 m!144495))

(declare-fun m!144503 () Bool)

(assert (=> b!124500 m!144503))

(declare-fun m!144505 () Bool)

(assert (=> b!124500 m!144505))

(declare-fun m!144507 () Bool)

(assert (=> b!124500 m!144507))

(declare-fun m!144509 () Bool)

(assert (=> b!124500 m!144509))

(assert (=> b!124500 m!144493))

(declare-fun m!144511 () Bool)

(assert (=> b!124500 m!144511))

(declare-fun m!144513 () Bool)

(assert (=> b!124500 m!144513))

(declare-fun m!144515 () Bool)

(assert (=> b!124500 m!144515))

(assert (=> b!124500 m!144515))

(declare-fun m!144517 () Bool)

(assert (=> b!124500 m!144517))

(declare-fun m!144519 () Bool)

(assert (=> b!124500 m!144519))

(declare-fun m!144521 () Bool)

(assert (=> b!124500 m!144521))

(assert (=> b!124500 m!144509))

(declare-fun m!144523 () Bool)

(assert (=> b!124500 m!144523))

(declare-fun m!144525 () Bool)

(assert (=> b!124500 m!144525))

(declare-fun m!144527 () Bool)

(assert (=> b!124500 m!144527))

(declare-fun m!144529 () Bool)

(assert (=> b!124500 m!144529))

(assert (=> b!124500 m!144519))

(declare-fun m!144531 () Bool)

(assert (=> b!124500 m!144531))

(assert (=> b!124500 m!144505))

(declare-fun m!144533 () Bool)

(assert (=> b!124500 m!144533))

(assert (=> b!124495 m!144493))

(assert (=> b!124495 m!144493))

(declare-fun m!144535 () Bool)

(assert (=> b!124495 m!144535))

(declare-fun m!144537 () Bool)

(assert (=> b!124504 m!144537))

(declare-fun m!144539 () Bool)

(assert (=> b!124510 m!144539))

(declare-fun m!144541 () Bool)

(assert (=> bm!13263 m!144541))

(assert (=> bm!13259 m!144531))

(declare-fun m!144543 () Bool)

(assert (=> bm!13265 m!144543))

(declare-fun m!144545 () Bool)

(assert (=> b!124503 m!144545))

(declare-fun m!144547 () Bool)

(assert (=> bm!13260 m!144547))

(assert (=> d!37299 m!144413))

(assert (=> b!124376 d!37299))

(declare-fun d!37301 () Bool)

(declare-fun e!81412 () Bool)

(assert (=> d!37301 e!81412))

(declare-fun res!60353 () Bool)

(assert (=> d!37301 (=> res!60353 e!81412)))

(declare-fun lt!64029 () Bool)

(assert (=> d!37301 (= res!60353 (not lt!64029))))

(declare-fun lt!64030 () Bool)

(assert (=> d!37301 (= lt!64029 lt!64030)))

(declare-fun lt!64027 () Unit!3867)

(declare-fun e!81413 () Unit!3867)

(assert (=> d!37301 (= lt!64027 e!81413)))

(declare-fun c!22608 () Bool)

(assert (=> d!37301 (= c!22608 lt!64030)))

(declare-fun containsKey!170 (List!1695 (_ BitVec 64)) Bool)

(assert (=> d!37301 (= lt!64030 (containsKey!170 (toList!854 lt!63941) (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355)))))

(assert (=> d!37301 (= (contains!873 lt!63941 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355)) lt!64029)))

(declare-fun b!124517 () Bool)

(declare-fun lt!64028 () Unit!3867)

(assert (=> b!124517 (= e!81413 lt!64028)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!118 (List!1695 (_ BitVec 64)) Unit!3867)

(assert (=> b!124517 (= lt!64028 (lemmaContainsKeyImpliesGetValueByKeyDefined!118 (toList!854 lt!63941) (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355)))))

(declare-datatypes ((Option!172 0))(
  ( (Some!171 (v!3112 V!3427)) (None!170) )
))
(declare-fun isDefined!119 (Option!172) Bool)

(declare-fun getValueByKey!166 (List!1695 (_ BitVec 64)) Option!172)

(assert (=> b!124517 (isDefined!119 (getValueByKey!166 (toList!854 lt!63941) (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355)))))

(declare-fun b!124518 () Bool)

(declare-fun Unit!3870 () Unit!3867)

(assert (=> b!124518 (= e!81413 Unit!3870)))

(declare-fun b!124519 () Bool)

(assert (=> b!124519 (= e!81412 (isDefined!119 (getValueByKey!166 (toList!854 lt!63941) (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355))))))

(assert (= (and d!37301 c!22608) b!124517))

(assert (= (and d!37301 (not c!22608)) b!124518))

(assert (= (and d!37301 (not res!60353)) b!124519))

(assert (=> d!37301 m!144415))

(declare-fun m!144549 () Bool)

(assert (=> d!37301 m!144549))

(assert (=> b!124517 m!144415))

(declare-fun m!144551 () Bool)

(assert (=> b!124517 m!144551))

(assert (=> b!124517 m!144415))

(declare-fun m!144553 () Bool)

(assert (=> b!124517 m!144553))

(assert (=> b!124517 m!144553))

(declare-fun m!144555 () Bool)

(assert (=> b!124517 m!144555))

(assert (=> b!124519 m!144415))

(assert (=> b!124519 m!144553))

(assert (=> b!124519 m!144553))

(assert (=> b!124519 m!144555))

(assert (=> b!124368 d!37301))

(declare-fun b!124604 () Bool)

(declare-fun res!60389 () Bool)

(declare-fun e!81474 () Bool)

(assert (=> b!124604 (=> (not res!60389) (not e!81474))))

(declare-datatypes ((SeekEntryResult!269 0))(
  ( (MissingZero!269 (index!3230 (_ BitVec 32))) (Found!269 (index!3231 (_ BitVec 32))) (Intermediate!269 (undefined!1081 Bool) (index!3232 (_ BitVec 32)) (x!14818 (_ BitVec 32))) (Undefined!269) (MissingVacant!269 (index!3233 (_ BitVec 32))) )
))
(declare-fun lt!64100 () SeekEntryResult!269)

(assert (=> b!124604 (= res!60389 (= (select (arr!2219 (_keys!4493 newMap!16)) (index!3230 lt!64100)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!13314 () Bool)

(declare-fun call!13338 () Bool)

(declare-fun call!13321 () Bool)

(assert (=> bm!13314 (= call!13338 call!13321)))

(declare-fun bm!13315 () Bool)

(declare-fun call!13320 () ListLongMap!1677)

(declare-fun call!13323 () ListLongMap!1677)

(assert (=> bm!13315 (= call!13320 call!13323)))

(declare-fun b!124605 () Bool)

(declare-fun res!60384 () Bool)

(declare-fun lt!64085 () SeekEntryResult!269)

(assert (=> b!124605 (= res!60384 (= (select (arr!2219 (_keys!4493 newMap!16)) (index!3233 lt!64085)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!81466 () Bool)

(assert (=> b!124605 (=> (not res!60384) (not e!81466))))

(declare-fun bm!13317 () Bool)

(declare-fun call!13340 () ListLongMap!1677)

(declare-fun lt!64096 () tuple2!2570)

(assert (=> bm!13317 (= call!13340 (map!1384 (_2!1296 lt!64096)))))

(declare-fun b!124606 () Bool)

(declare-fun e!81473 () Unit!3867)

(declare-fun Unit!3871 () Unit!3867)

(assert (=> b!124606 (= e!81473 Unit!3871)))

(declare-fun lt!64089 () Unit!3867)

(declare-fun call!13325 () Unit!3867)

(assert (=> b!124606 (= lt!64089 call!13325)))

(declare-fun lt!64095 () SeekEntryResult!269)

(declare-fun call!13327 () SeekEntryResult!269)

(assert (=> b!124606 (= lt!64095 call!13327)))

(declare-fun res!60387 () Bool)

(assert (=> b!124606 (= res!60387 ((_ is Found!269) lt!64095))))

(declare-fun e!81478 () Bool)

(assert (=> b!124606 (=> (not res!60387) (not e!81478))))

(assert (=> b!124606 e!81478))

(declare-fun lt!64098 () Unit!3867)

(assert (=> b!124606 (= lt!64098 lt!64089)))

(assert (=> b!124606 false))

(declare-fun bm!13318 () Bool)

(declare-fun call!13324 () Bool)

(declare-fun call!13333 () Bool)

(assert (=> bm!13318 (= call!13324 call!13333)))

(declare-fun b!124607 () Bool)

(declare-fun res!60386 () Bool)

(assert (=> b!124607 (=> (not res!60386) (not e!81474))))

(declare-fun call!13317 () Bool)

(assert (=> b!124607 (= res!60386 call!13317)))

(declare-fun e!81461 () Bool)

(assert (=> b!124607 (= e!81461 e!81474)))

(declare-fun bm!13319 () Bool)

(declare-fun call!13330 () SeekEntryResult!269)

(declare-fun call!13336 () SeekEntryResult!269)

(assert (=> bm!13319 (= call!13330 call!13336)))

(declare-fun b!124608 () Bool)

(declare-fun e!81477 () Bool)

(declare-fun e!81467 () Bool)

(assert (=> b!124608 (= e!81477 e!81467)))

(declare-fun res!60382 () Bool)

(assert (=> b!124608 (= res!60382 call!13317)))

(assert (=> b!124608 (=> (not res!60382) (not e!81467))))

(declare-fun b!124609 () Bool)

(assert (=> b!124609 (= e!81477 ((_ is Undefined!269) lt!64100))))

(declare-fun bm!13320 () Bool)

(declare-fun call!13332 () ListLongMap!1677)

(declare-fun call!13318 () ListLongMap!1677)

(assert (=> bm!13320 (= call!13332 call!13318)))

(declare-fun bm!13321 () Bool)

(declare-fun lt!64109 () array!4687)

(declare-fun c!22640 () Bool)

(declare-fun c!22645 () Bool)

(declare-fun lt!64087 () (_ BitVec 32))

(assert (=> bm!13321 (= call!13323 (getCurrentListMap!535 (_keys!4493 newMap!16) (ite c!22645 (_values!2747 newMap!16) lt!64109) (mask!7010 newMap!16) (ite (and c!22645 c!22640) lt!64087 (extraKeys!2549 newMap!16)) (ite (and c!22645 c!22640) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2629 newMap!16)) (minValue!2629 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2764 newMap!16)))))

(declare-fun bm!13322 () Bool)

(declare-fun c!22643 () Bool)

(declare-fun c!22647 () Bool)

(assert (=> bm!13322 (= c!22643 c!22647)))

(declare-fun e!81464 () ListLongMap!1677)

(declare-fun lt!64093 () SeekEntryResult!269)

(declare-fun call!13328 () Bool)

(assert (=> bm!13322 (= call!13328 (contains!873 e!81464 (ite c!22647 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355) (select (arr!2219 (_keys!4493 newMap!16)) (index!3231 lt!64093)))))))

(declare-fun bm!13323 () Bool)

(declare-fun call!13331 () ListLongMap!1677)

(declare-fun call!13334 () ListLongMap!1677)

(assert (=> bm!13323 (= call!13331 call!13334)))

(declare-fun bm!13324 () Bool)

(declare-fun call!13337 () ListLongMap!1677)

(assert (=> bm!13324 (= call!13337 call!13334)))

(declare-fun b!124610 () Bool)

(declare-fun c!22637 () Bool)

(assert (=> b!124610 (= c!22637 ((_ is MissingVacant!269) lt!64093))))

(declare-fun e!81476 () tuple2!2570)

(declare-fun e!81463 () tuple2!2570)

(assert (=> b!124610 (= e!81476 e!81463)))

(declare-fun b!124611 () Bool)

(declare-fun e!81459 () Bool)

(assert (=> b!124611 (= e!81459 (not call!13338))))

(declare-fun b!124612 () Bool)

(declare-fun lt!64090 () Unit!3867)

(assert (=> b!124612 (= e!81473 lt!64090)))

(declare-fun call!13335 () Unit!3867)

(assert (=> b!124612 (= lt!64090 call!13335)))

(assert (=> b!124612 (= lt!64100 call!13327)))

(declare-fun c!22641 () Bool)

(assert (=> b!124612 (= c!22641 ((_ is MissingZero!269) lt!64100))))

(assert (=> b!124612 e!81461))

(declare-fun b!124613 () Bool)

(declare-fun lt!64091 () tuple2!2570)

(assert (=> b!124613 (= e!81463 (tuple2!2571 (_1!1296 lt!64091) (_2!1296 lt!64091)))))

(declare-fun call!13339 () tuple2!2570)

(assert (=> b!124613 (= lt!64091 call!13339)))

(declare-fun b!124614 () Bool)

(assert (=> b!124614 (= e!81464 call!13323)))

(declare-fun b!124615 () Bool)

(assert (=> b!124615 (= e!81464 call!13331)))

(declare-fun bm!13325 () Bool)

(declare-fun call!13329 () Bool)

(assert (=> bm!13325 (= call!13329 call!13321)))

(declare-fun c!22638 () Bool)

(declare-fun c!22639 () Bool)

(declare-fun bm!13326 () Bool)

(declare-fun lt!64088 () SeekEntryResult!269)

(declare-fun c!22642 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!13326 (= call!13333 (inRange!0 (ite c!22647 (ite c!22638 (index!3231 lt!64095) (ite c!22641 (index!3230 lt!64100) (index!3233 lt!64100))) (ite c!22639 (index!3231 lt!64088) (ite c!22642 (index!3230 lt!64085) (index!3233 lt!64085)))) (mask!7010 newMap!16)))))

(declare-fun b!124616 () Bool)

(declare-fun e!81468 () tuple2!2570)

(assert (=> b!124616 (= e!81468 e!81476)))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!4685 (_ BitVec 32)) SeekEntryResult!269)

(assert (=> b!124616 (= lt!64093 (seekEntryOrOpen!0 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355) (_keys!4493 newMap!16) (mask!7010 newMap!16)))))

(assert (=> b!124616 (= c!22647 ((_ is Undefined!269) lt!64093))))

(declare-fun b!124617 () Bool)

(assert (=> b!124617 (= e!81478 (= (select (arr!2219 (_keys!4493 newMap!16)) (index!3231 lt!64095)) (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355)))))

(declare-fun b!124618 () Bool)

(declare-fun res!60383 () Bool)

(declare-fun call!13322 () Bool)

(assert (=> b!124618 (= res!60383 call!13322)))

(declare-fun e!81462 () Bool)

(assert (=> b!124618 (=> (not res!60383) (not e!81462))))

(declare-fun bm!13327 () Bool)

(assert (=> bm!13327 (= call!13327 call!13336)))

(declare-fun bm!13328 () Bool)

(assert (=> bm!13328 (= call!13322 call!13333)))

(declare-fun e!81471 () ListLongMap!1677)

(declare-fun b!124619 () Bool)

(assert (=> b!124619 (= e!81471 (ite c!22640 call!13337 call!13320))))

(declare-fun bm!13329 () Bool)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!55 (array!4685 array!4687 (_ BitVec 32) (_ BitVec 32) V!3427 V!3427 (_ BitVec 64) Int) Unit!3867)

(assert (=> bm!13329 (= call!13325 (lemmaInListMapThenSeekEntryOrOpenFindsIt!55 (_keys!4493 newMap!16) (_values!2747 newMap!16) (mask!7010 newMap!16) (extraKeys!2549 newMap!16) (zeroValue!2629 newMap!16) (minValue!2629 newMap!16) (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355) (defaultEntry!2764 newMap!16)))))

(declare-fun b!124620 () Bool)

(declare-fun res!60394 () Bool)

(assert (=> b!124620 (= res!60394 (= (select (arr!2219 (_keys!4493 newMap!16)) (index!3233 lt!64100)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!124620 (=> (not res!60394) (not e!81467))))

(declare-fun b!124621 () Bool)

(declare-fun e!81469 () tuple2!2570)

(assert (=> b!124621 (= e!81468 e!81469)))

(assert (=> b!124621 (= c!22640 (= (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!124622 () Bool)

(declare-fun e!81460 () Bool)

(assert (=> b!124622 (= e!81460 ((_ is Undefined!269) lt!64085))))

(declare-fun b!124623 () Bool)

(declare-fun lt!64102 () Unit!3867)

(assert (=> b!124623 (= lt!64102 e!81473)))

(assert (=> b!124623 (= c!22638 call!13328)))

(assert (=> b!124623 (= e!81476 (tuple2!2571 false newMap!16))))

(declare-fun b!124624 () Bool)

(declare-fun e!81465 () Unit!3867)

(declare-fun lt!64106 () Unit!3867)

(assert (=> b!124624 (= e!81465 lt!64106)))

(assert (=> b!124624 (= lt!64106 call!13325)))

(assert (=> b!124624 (= lt!64088 call!13330)))

(declare-fun res!60391 () Bool)

(assert (=> b!124624 (= res!60391 ((_ is Found!269) lt!64088))))

(assert (=> b!124624 (=> (not res!60391) (not e!81462))))

(assert (=> b!124624 e!81462))

(declare-fun b!124625 () Bool)

(declare-fun e!81472 () Bool)

(declare-fun e!81458 () Bool)

(assert (=> b!124625 (= e!81472 e!81458)))

(declare-fun res!60393 () Bool)

(assert (=> b!124625 (= res!60393 (contains!873 call!13340 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355)))))

(assert (=> b!124625 (=> (not res!60393) (not e!81458))))

(declare-fun b!124626 () Bool)

(declare-fun res!60392 () Bool)

(assert (=> b!124626 (= res!60392 call!13324)))

(assert (=> b!124626 (=> (not res!60392) (not e!81478))))

(declare-fun bm!13316 () Bool)

(declare-fun call!13326 () Bool)

(assert (=> bm!13316 (= call!13326 call!13322)))

(declare-fun d!37303 () Bool)

(declare-fun e!81479 () Bool)

(assert (=> d!37303 e!81479))

(declare-fun res!60390 () Bool)

(assert (=> d!37303 (=> (not res!60390) (not e!81479))))

(assert (=> d!37303 (= res!60390 (valid!502 (_2!1296 lt!64096)))))

(assert (=> d!37303 (= lt!64096 e!81468)))

(assert (=> d!37303 (= c!22645 (= (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355) (bvneg (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355))))))

(assert (=> d!37303 (valid!502 newMap!16)))

(assert (=> d!37303 (= (update!180 newMap!16 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) lt!64096)))

(declare-fun b!124627 () Bool)

(declare-fun c!22644 () Bool)

(assert (=> b!124627 (= c!22644 ((_ is MissingVacant!269) lt!64085))))

(declare-fun e!81475 () Bool)

(assert (=> b!124627 (= e!81475 e!81460)))

(declare-fun b!124628 () Bool)

(declare-fun lt!64111 () Unit!3867)

(declare-fun lt!64110 () Unit!3867)

(assert (=> b!124628 (= lt!64111 lt!64110)))

(assert (=> b!124628 call!13328))

(declare-fun lemmaValidKeyInArrayIsInListMap!116 (array!4685 array!4687 (_ BitVec 32) (_ BitVec 32) V!3427 V!3427 (_ BitVec 32) Int) Unit!3867)

(assert (=> b!124628 (= lt!64110 (lemmaValidKeyInArrayIsInListMap!116 (_keys!4493 newMap!16) lt!64109 (mask!7010 newMap!16) (extraKeys!2549 newMap!16) (zeroValue!2629 newMap!16) (minValue!2629 newMap!16) (index!3231 lt!64093) (defaultEntry!2764 newMap!16)))))

(assert (=> b!124628 (= lt!64109 (array!4688 (store (arr!2220 (_values!2747 newMap!16)) (index!3231 lt!64093) (ValueCellFull!1074 (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2483 (_values!2747 newMap!16))))))

(declare-fun lt!64108 () Unit!3867)

(declare-fun lt!64086 () Unit!3867)

(assert (=> b!124628 (= lt!64108 lt!64086)))

(assert (=> b!124628 (= call!13318 call!13331)))

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!55 (array!4685 array!4687 (_ BitVec 32) (_ BitVec 32) V!3427 V!3427 (_ BitVec 32) (_ BitVec 64) V!3427 Int) Unit!3867)

(assert (=> b!124628 (= lt!64086 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!55 (_keys!4493 newMap!16) (_values!2747 newMap!16) (mask!7010 newMap!16) (extraKeys!2549 newMap!16) (zeroValue!2629 newMap!16) (minValue!2629 newMap!16) (index!3231 lt!64093) (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2764 newMap!16)))))

(declare-fun lt!64092 () Unit!3867)

(assert (=> b!124628 (= lt!64092 e!81465)))

(assert (=> b!124628 (= c!22639 (contains!873 (getCurrentListMap!535 (_keys!4493 newMap!16) (_values!2747 newMap!16) (mask!7010 newMap!16) (extraKeys!2549 newMap!16) (zeroValue!2629 newMap!16) (minValue!2629 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2764 newMap!16)) (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355)))))

(declare-fun e!81470 () tuple2!2570)

(assert (=> b!124628 (= e!81470 (tuple2!2571 true (LongMapFixedSize!1057 (defaultEntry!2764 newMap!16) (mask!7010 newMap!16) (extraKeys!2549 newMap!16) (zeroValue!2629 newMap!16) (minValue!2629 newMap!16) (_size!577 newMap!16) (_keys!4493 newMap!16) (array!4688 (store (arr!2220 (_values!2747 newMap!16)) (index!3231 lt!64093) (ValueCellFull!1074 (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2483 (_values!2747 newMap!16))) (_vacant!577 newMap!16))))))

(declare-fun b!124629 () Bool)

(assert (=> b!124629 (= e!81460 e!81466)))

(declare-fun res!60395 () Bool)

(assert (=> b!124629 (= res!60395 call!13326)))

(assert (=> b!124629 (=> (not res!60395) (not e!81466))))

(declare-fun b!124630 () Bool)

(declare-fun Unit!3872 () Unit!3867)

(assert (=> b!124630 (= e!81465 Unit!3872)))

(declare-fun lt!64101 () Unit!3867)

(assert (=> b!124630 (= lt!64101 call!13335)))

(assert (=> b!124630 (= lt!64085 call!13330)))

(assert (=> b!124630 (= c!22642 ((_ is MissingZero!269) lt!64085))))

(assert (=> b!124630 e!81475))

(declare-fun lt!64097 () Unit!3867)

(assert (=> b!124630 (= lt!64097 lt!64101)))

(assert (=> b!124630 false))

(declare-fun b!124631 () Bool)

(assert (=> b!124631 (= e!81466 (not call!13338))))

(declare-fun b!124632 () Bool)

(assert (=> b!124632 (= e!81474 (not call!13329))))

(declare-fun b!124633 () Bool)

(declare-fun lt!64105 () Unit!3867)

(declare-fun lt!64099 () Unit!3867)

(assert (=> b!124633 (= lt!64105 lt!64099)))

(assert (=> b!124633 (= call!13332 call!13337)))

(declare-fun lt!64103 () (_ BitVec 32))

(declare-fun lemmaChangeLongMinValueKeyThenAddPairToListMap!55 (array!4685 array!4687 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3427 V!3427 V!3427 Int) Unit!3867)

(assert (=> b!124633 (= lt!64099 (lemmaChangeLongMinValueKeyThenAddPairToListMap!55 (_keys!4493 newMap!16) (_values!2747 newMap!16) (mask!7010 newMap!16) (extraKeys!2549 newMap!16) lt!64103 (zeroValue!2629 newMap!16) (minValue!2629 newMap!16) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2764 newMap!16)))))

(assert (=> b!124633 (= lt!64103 (bvor (extraKeys!2549 newMap!16) #b00000000000000000000000000000010))))

(assert (=> b!124633 (= e!81469 (tuple2!2571 true (LongMapFixedSize!1057 (defaultEntry!2764 newMap!16) (mask!7010 newMap!16) (bvor (extraKeys!2549 newMap!16) #b00000000000000000000000000000010) (zeroValue!2629 newMap!16) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (_size!577 newMap!16) (_keys!4493 newMap!16) (_values!2747 newMap!16) (_vacant!577 newMap!16))))))

(declare-fun bm!13330 () Bool)

(assert (=> bm!13330 (= call!13318 (+!169 e!81471 (ite c!22645 (ite c!22640 (tuple2!2569 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2569 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun c!22650 () Bool)

(assert (=> bm!13330 (= c!22650 c!22645)))

(declare-fun bm!13331 () Bool)

(assert (=> bm!13331 (= call!13317 call!13324)))

(declare-fun bm!13332 () Bool)

(declare-fun call!13319 () ListLongMap!1677)

(assert (=> bm!13332 (= call!13319 (map!1384 newMap!16))))

(declare-fun bm!13333 () Bool)

(assert (=> bm!13333 (= call!13334 (getCurrentListMap!535 (_keys!4493 newMap!16) (ite (or c!22645 c!22647) (_values!2747 newMap!16) (array!4688 (store (arr!2220 (_values!2747 newMap!16)) (index!3231 lt!64093) (ValueCellFull!1074 (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2483 (_values!2747 newMap!16)))) (mask!7010 newMap!16) (ite c!22645 (ite c!22640 (extraKeys!2549 newMap!16) lt!64103) (extraKeys!2549 newMap!16)) (zeroValue!2629 newMap!16) (ite c!22645 (ite c!22640 (minValue!2629 newMap!16) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2629 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2764 newMap!16)))))

(declare-fun b!124634 () Bool)

(declare-fun res!60385 () Bool)

(assert (=> b!124634 (=> (not res!60385) (not e!81459))))

(assert (=> b!124634 (= res!60385 call!13326)))

(assert (=> b!124634 (= e!81475 e!81459)))

(declare-fun b!124635 () Bool)

(assert (=> b!124635 (= e!81467 (not call!13329))))

(declare-fun b!124636 () Bool)

(declare-fun lt!64094 () Unit!3867)

(declare-fun lt!64107 () Unit!3867)

(assert (=> b!124636 (= lt!64094 lt!64107)))

(assert (=> b!124636 (= call!13332 call!13320)))

(declare-fun lemmaChangeZeroKeyThenAddPairToListMap!55 (array!4685 array!4687 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3427 V!3427 V!3427 Int) Unit!3867)

(assert (=> b!124636 (= lt!64107 (lemmaChangeZeroKeyThenAddPairToListMap!55 (_keys!4493 newMap!16) (_values!2747 newMap!16) (mask!7010 newMap!16) (extraKeys!2549 newMap!16) lt!64087 (zeroValue!2629 newMap!16) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2629 newMap!16) (defaultEntry!2764 newMap!16)))))

(assert (=> b!124636 (= lt!64087 (bvor (extraKeys!2549 newMap!16) #b00000000000000000000000000000001))))

(assert (=> b!124636 (= e!81469 (tuple2!2571 true (LongMapFixedSize!1057 (defaultEntry!2764 newMap!16) (mask!7010 newMap!16) (bvor (extraKeys!2549 newMap!16) #b00000000000000000000000000000001) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2629 newMap!16) (_size!577 newMap!16) (_keys!4493 newMap!16) (_values!2747 newMap!16) (_vacant!577 newMap!16))))))

(declare-fun b!124637 () Bool)

(assert (=> b!124637 (= e!81462 (= (select (arr!2219 (_keys!4493 newMap!16)) (index!3231 lt!64088)) (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355)))))

(declare-fun b!124638 () Bool)

(declare-fun lt!64104 () tuple2!2570)

(assert (=> b!124638 (= lt!64104 call!13339)))

(assert (=> b!124638 (= e!81470 (tuple2!2571 (_1!1296 lt!64104) (_2!1296 lt!64104)))))

(declare-fun b!124639 () Bool)

(assert (=> b!124639 (= e!81463 e!81470)))

(declare-fun c!22649 () Bool)

(assert (=> b!124639 (= c!22649 ((_ is MissingZero!269) lt!64093))))

(declare-fun b!124640 () Bool)

(declare-fun res!60388 () Bool)

(assert (=> b!124640 (=> (not res!60388) (not e!81459))))

(assert (=> b!124640 (= res!60388 (= (select (arr!2219 (_keys!4493 newMap!16)) (index!3230 lt!64085)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!13334 () Bool)

(declare-fun arrayContainsKey!0 (array!4685 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!13334 (= call!13321 (arrayContainsKey!0 (_keys!4493 newMap!16) (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun b!124641 () Bool)

(assert (=> b!124641 (= e!81472 (= call!13340 call!13319))))

(declare-fun bm!13335 () Bool)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!55 (array!4685 array!4687 (_ BitVec 32) (_ BitVec 32) V!3427 V!3427 (_ BitVec 64) Int) Unit!3867)

(assert (=> bm!13335 (= call!13335 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!55 (_keys!4493 newMap!16) (_values!2747 newMap!16) (mask!7010 newMap!16) (extraKeys!2549 newMap!16) (zeroValue!2629 newMap!16) (minValue!2629 newMap!16) (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355) (defaultEntry!2764 newMap!16)))))

(declare-fun b!124642 () Bool)

(declare-fun c!22648 () Bool)

(assert (=> b!124642 (= c!22648 ((_ is MissingVacant!269) lt!64100))))

(assert (=> b!124642 (= e!81461 e!81477)))

(declare-fun b!124643 () Bool)

(assert (=> b!124643 (= e!81479 e!81472)))

(declare-fun c!22646 () Bool)

(assert (=> b!124643 (= c!22646 (_1!1296 lt!64096))))

(declare-fun bm!13336 () Bool)

(assert (=> bm!13336 (= call!13336 (seekEntryOrOpen!0 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355) (_keys!4493 newMap!16) (mask!7010 newMap!16)))))

(declare-fun b!124644 () Bool)

(assert (=> b!124644 (= e!81471 (getCurrentListMap!535 (_keys!4493 newMap!16) (_values!2747 newMap!16) (mask!7010 newMap!16) (extraKeys!2549 newMap!16) (zeroValue!2629 newMap!16) (minValue!2629 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2764 newMap!16)))))

(declare-fun bm!13337 () Bool)

(declare-fun updateHelperNewKey!55 (LongMapFixedSize!1056 (_ BitVec 64) V!3427 (_ BitVec 32)) tuple2!2570)

(assert (=> bm!13337 (= call!13339 (updateHelperNewKey!55 newMap!16 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (ite c!22637 (index!3233 lt!64093) (index!3230 lt!64093))))))

(declare-fun b!124645 () Bool)

(assert (=> b!124645 (= e!81458 (= call!13340 (+!169 call!13319 (tuple2!2569 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (= (and d!37303 c!22645) b!124621))

(assert (= (and d!37303 (not c!22645)) b!124616))

(assert (= (and b!124621 c!22640) b!124636))

(assert (= (and b!124621 (not c!22640)) b!124633))

(assert (= (or b!124636 b!124633) bm!13324))

(assert (= (or b!124636 b!124633) bm!13315))

(assert (= (or b!124636 b!124633) bm!13320))

(assert (= (and b!124616 c!22647) b!124623))

(assert (= (and b!124616 (not c!22647)) b!124610))

(assert (= (and b!124623 c!22638) b!124606))

(assert (= (and b!124623 (not c!22638)) b!124612))

(assert (= (and b!124606 res!60387) b!124626))

(assert (= (and b!124626 res!60392) b!124617))

(assert (= (and b!124612 c!22641) b!124607))

(assert (= (and b!124612 (not c!22641)) b!124642))

(assert (= (and b!124607 res!60386) b!124604))

(assert (= (and b!124604 res!60389) b!124632))

(assert (= (and b!124642 c!22648) b!124608))

(assert (= (and b!124642 (not c!22648)) b!124609))

(assert (= (and b!124608 res!60382) b!124620))

(assert (= (and b!124620 res!60394) b!124635))

(assert (= (or b!124607 b!124608) bm!13331))

(assert (= (or b!124632 b!124635) bm!13325))

(assert (= (or b!124626 bm!13331) bm!13318))

(assert (= (or b!124606 b!124612) bm!13327))

(assert (= (and b!124610 c!22637) b!124613))

(assert (= (and b!124610 (not c!22637)) b!124639))

(assert (= (and b!124639 c!22649) b!124638))

(assert (= (and b!124639 (not c!22649)) b!124628))

(assert (= (and b!124628 c!22639) b!124624))

(assert (= (and b!124628 (not c!22639)) b!124630))

(assert (= (and b!124624 res!60391) b!124618))

(assert (= (and b!124618 res!60383) b!124637))

(assert (= (and b!124630 c!22642) b!124634))

(assert (= (and b!124630 (not c!22642)) b!124627))

(assert (= (and b!124634 res!60385) b!124640))

(assert (= (and b!124640 res!60388) b!124611))

(assert (= (and b!124627 c!22644) b!124629))

(assert (= (and b!124627 (not c!22644)) b!124622))

(assert (= (and b!124629 res!60395) b!124605))

(assert (= (and b!124605 res!60384) b!124631))

(assert (= (or b!124634 b!124629) bm!13316))

(assert (= (or b!124611 b!124631) bm!13314))

(assert (= (or b!124618 bm!13316) bm!13328))

(assert (= (or b!124624 b!124630) bm!13319))

(assert (= (or b!124613 b!124638) bm!13337))

(assert (= (or b!124606 b!124624) bm!13329))

(assert (= (or b!124612 b!124630) bm!13335))

(assert (= (or b!124623 b!124628) bm!13323))

(assert (= (or bm!13325 bm!13314) bm!13334))

(assert (= (or bm!13327 bm!13319) bm!13336))

(assert (= (or bm!13318 bm!13328) bm!13326))

(assert (= (or b!124623 b!124628) bm!13322))

(assert (= (and bm!13322 c!22643) b!124615))

(assert (= (and bm!13322 (not c!22643)) b!124614))

(assert (= (or bm!13315 b!124614) bm!13321))

(assert (= (or bm!13324 bm!13323) bm!13333))

(assert (= (or bm!13320 b!124628) bm!13330))

(assert (= (and bm!13330 c!22650) b!124619))

(assert (= (and bm!13330 (not c!22650)) b!124644))

(assert (= (and d!37303 res!60390) b!124643))

(assert (= (and b!124643 c!22646) b!124625))

(assert (= (and b!124643 (not c!22646)) b!124641))

(assert (= (and b!124625 res!60393) b!124645))

(assert (= (or b!124645 b!124641) bm!13332))

(assert (= (or b!124625 b!124645 b!124641) bm!13317))

(assert (=> b!124616 m!144415))

(declare-fun m!144557 () Bool)

(assert (=> b!124616 m!144557))

(assert (=> b!124644 m!144491))

(declare-fun m!144559 () Bool)

(assert (=> b!124640 m!144559))

(assert (=> bm!13335 m!144415))

(declare-fun m!144561 () Bool)

(assert (=> bm!13335 m!144561))

(declare-fun m!144563 () Bool)

(assert (=> d!37303 m!144563))

(assert (=> d!37303 m!144443))

(assert (=> b!124636 m!144425))

(declare-fun m!144565 () Bool)

(assert (=> b!124636 m!144565))

(declare-fun m!144567 () Bool)

(assert (=> bm!13333 m!144567))

(declare-fun m!144569 () Bool)

(assert (=> bm!13333 m!144569))

(declare-fun m!144571 () Bool)

(assert (=> bm!13321 m!144571))

(assert (=> bm!13336 m!144415))

(assert (=> bm!13336 m!144557))

(assert (=> b!124633 m!144425))

(declare-fun m!144573 () Bool)

(assert (=> b!124633 m!144573))

(declare-fun m!144575 () Bool)

(assert (=> bm!13330 m!144575))

(assert (=> bm!13329 m!144415))

(declare-fun m!144577 () Bool)

(assert (=> bm!13329 m!144577))

(assert (=> bm!13332 m!144417))

(assert (=> bm!13334 m!144415))

(declare-fun m!144579 () Bool)

(assert (=> bm!13334 m!144579))

(declare-fun m!144581 () Bool)

(assert (=> b!124605 m!144581))

(declare-fun m!144583 () Bool)

(assert (=> b!124604 m!144583))

(assert (=> b!124628 m!144491))

(assert (=> b!124628 m!144491))

(assert (=> b!124628 m!144415))

(declare-fun m!144585 () Bool)

(assert (=> b!124628 m!144585))

(assert (=> b!124628 m!144567))

(declare-fun m!144587 () Bool)

(assert (=> b!124628 m!144587))

(assert (=> b!124628 m!144415))

(assert (=> b!124628 m!144425))

(declare-fun m!144589 () Bool)

(assert (=> b!124628 m!144589))

(assert (=> bm!13337 m!144415))

(assert (=> bm!13337 m!144425))

(declare-fun m!144591 () Bool)

(assert (=> bm!13337 m!144591))

(declare-fun m!144593 () Bool)

(assert (=> b!124617 m!144593))

(declare-fun m!144595 () Bool)

(assert (=> bm!13317 m!144595))

(declare-fun m!144597 () Bool)

(assert (=> b!124645 m!144597))

(declare-fun m!144599 () Bool)

(assert (=> b!124620 m!144599))

(declare-fun m!144601 () Bool)

(assert (=> bm!13326 m!144601))

(declare-fun m!144603 () Bool)

(assert (=> bm!13322 m!144603))

(declare-fun m!144605 () Bool)

(assert (=> bm!13322 m!144605))

(assert (=> b!124625 m!144415))

(declare-fun m!144607 () Bool)

(assert (=> b!124625 m!144607))

(declare-fun m!144609 () Bool)

(assert (=> b!124637 m!144609))

(assert (=> b!124368 d!37303))

(declare-fun d!37305 () Bool)

(declare-fun c!22653 () Bool)

(assert (=> d!37305 (= c!22653 ((_ is ValueCellFull!1074) (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355)))))

(declare-fun e!81482 () V!3427)

(assert (=> d!37305 (= (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) e!81482)))

(declare-fun b!124650 () Bool)

(declare-fun get!1437 (ValueCell!1074 V!3427) V!3427)

(assert (=> b!124650 (= e!81482 (get!1437 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!124651 () Bool)

(declare-fun get!1438 (ValueCell!1074 V!3427) V!3427)

(assert (=> b!124651 (= e!81482 (get!1438 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!37305 c!22653) b!124650))

(assert (= (and d!37305 (not c!22653)) b!124651))

(assert (=> b!124650 m!144421))

(assert (=> b!124650 m!144423))

(declare-fun m!144611 () Bool)

(assert (=> b!124650 m!144611))

(assert (=> b!124651 m!144421))

(assert (=> b!124651 m!144423))

(declare-fun m!144613 () Bool)

(assert (=> b!124651 m!144613))

(assert (=> b!124368 d!37305))

(declare-fun d!37307 () Bool)

(assert (=> d!37307 (= (validMask!0 (mask!7010 (v!3108 (underlying!436 thiss!992)))) (and (or (= (mask!7010 (v!3108 (underlying!436 thiss!992))) #b00000000000000000000000000000111) (= (mask!7010 (v!3108 (underlying!436 thiss!992))) #b00000000000000000000000000001111) (= (mask!7010 (v!3108 (underlying!436 thiss!992))) #b00000000000000000000000000011111) (= (mask!7010 (v!3108 (underlying!436 thiss!992))) #b00000000000000000000000000111111) (= (mask!7010 (v!3108 (underlying!436 thiss!992))) #b00000000000000000000000001111111) (= (mask!7010 (v!3108 (underlying!436 thiss!992))) #b00000000000000000000000011111111) (= (mask!7010 (v!3108 (underlying!436 thiss!992))) #b00000000000000000000000111111111) (= (mask!7010 (v!3108 (underlying!436 thiss!992))) #b00000000000000000000001111111111) (= (mask!7010 (v!3108 (underlying!436 thiss!992))) #b00000000000000000000011111111111) (= (mask!7010 (v!3108 (underlying!436 thiss!992))) #b00000000000000000000111111111111) (= (mask!7010 (v!3108 (underlying!436 thiss!992))) #b00000000000000000001111111111111) (= (mask!7010 (v!3108 (underlying!436 thiss!992))) #b00000000000000000011111111111111) (= (mask!7010 (v!3108 (underlying!436 thiss!992))) #b00000000000000000111111111111111) (= (mask!7010 (v!3108 (underlying!436 thiss!992))) #b00000000000000001111111111111111) (= (mask!7010 (v!3108 (underlying!436 thiss!992))) #b00000000000000011111111111111111) (= (mask!7010 (v!3108 (underlying!436 thiss!992))) #b00000000000000111111111111111111) (= (mask!7010 (v!3108 (underlying!436 thiss!992))) #b00000000000001111111111111111111) (= (mask!7010 (v!3108 (underlying!436 thiss!992))) #b00000000000011111111111111111111) (= (mask!7010 (v!3108 (underlying!436 thiss!992))) #b00000000000111111111111111111111) (= (mask!7010 (v!3108 (underlying!436 thiss!992))) #b00000000001111111111111111111111) (= (mask!7010 (v!3108 (underlying!436 thiss!992))) #b00000000011111111111111111111111) (= (mask!7010 (v!3108 (underlying!436 thiss!992))) #b00000000111111111111111111111111) (= (mask!7010 (v!3108 (underlying!436 thiss!992))) #b00000001111111111111111111111111) (= (mask!7010 (v!3108 (underlying!436 thiss!992))) #b00000011111111111111111111111111) (= (mask!7010 (v!3108 (underlying!436 thiss!992))) #b00000111111111111111111111111111) (= (mask!7010 (v!3108 (underlying!436 thiss!992))) #b00001111111111111111111111111111) (= (mask!7010 (v!3108 (underlying!436 thiss!992))) #b00011111111111111111111111111111) (= (mask!7010 (v!3108 (underlying!436 thiss!992))) #b00111111111111111111111111111111)) (bvsle (mask!7010 (v!3108 (underlying!436 thiss!992))) #b00111111111111111111111111111111)))))

(assert (=> b!124367 d!37307))

(declare-fun mapIsEmpty!4483 () Bool)

(declare-fun mapRes!4483 () Bool)

(assert (=> mapIsEmpty!4483 mapRes!4483))

(declare-fun b!124659 () Bool)

(declare-fun e!81488 () Bool)

(assert (=> b!124659 (= e!81488 tp_is_empty!2835)))

(declare-fun mapNonEmpty!4483 () Bool)

(declare-fun tp!10927 () Bool)

(declare-fun e!81487 () Bool)

(assert (=> mapNonEmpty!4483 (= mapRes!4483 (and tp!10927 e!81487))))

(declare-fun mapValue!4483 () ValueCell!1074)

(declare-fun mapRest!4483 () (Array (_ BitVec 32) ValueCell!1074))

(declare-fun mapKey!4483 () (_ BitVec 32))

(assert (=> mapNonEmpty!4483 (= mapRest!4474 (store mapRest!4483 mapKey!4483 mapValue!4483))))

(declare-fun condMapEmpty!4483 () Bool)

(declare-fun mapDefault!4483 () ValueCell!1074)

(assert (=> mapNonEmpty!4474 (= condMapEmpty!4483 (= mapRest!4474 ((as const (Array (_ BitVec 32) ValueCell!1074)) mapDefault!4483)))))

(assert (=> mapNonEmpty!4474 (= tp!10909 (and e!81488 mapRes!4483))))

(declare-fun b!124658 () Bool)

(assert (=> b!124658 (= e!81487 tp_is_empty!2835)))

(assert (= (and mapNonEmpty!4474 condMapEmpty!4483) mapIsEmpty!4483))

(assert (= (and mapNonEmpty!4474 (not condMapEmpty!4483)) mapNonEmpty!4483))

(assert (= (and mapNonEmpty!4483 ((_ is ValueCellFull!1074) mapValue!4483)) b!124658))

(assert (= (and mapNonEmpty!4474 ((_ is ValueCellFull!1074) mapDefault!4483)) b!124659))

(declare-fun m!144615 () Bool)

(assert (=> mapNonEmpty!4483 m!144615))

(declare-fun mapIsEmpty!4484 () Bool)

(declare-fun mapRes!4484 () Bool)

(assert (=> mapIsEmpty!4484 mapRes!4484))

(declare-fun b!124661 () Bool)

(declare-fun e!81490 () Bool)

(assert (=> b!124661 (= e!81490 tp_is_empty!2835)))

(declare-fun mapNonEmpty!4484 () Bool)

(declare-fun tp!10928 () Bool)

(declare-fun e!81489 () Bool)

(assert (=> mapNonEmpty!4484 (= mapRes!4484 (and tp!10928 e!81489))))

(declare-fun mapRest!4484 () (Array (_ BitVec 32) ValueCell!1074))

(declare-fun mapKey!4484 () (_ BitVec 32))

(declare-fun mapValue!4484 () ValueCell!1074)

(assert (=> mapNonEmpty!4484 (= mapRest!4473 (store mapRest!4484 mapKey!4484 mapValue!4484))))

(declare-fun condMapEmpty!4484 () Bool)

(declare-fun mapDefault!4484 () ValueCell!1074)

(assert (=> mapNonEmpty!4473 (= condMapEmpty!4484 (= mapRest!4473 ((as const (Array (_ BitVec 32) ValueCell!1074)) mapDefault!4484)))))

(assert (=> mapNonEmpty!4473 (= tp!10912 (and e!81490 mapRes!4484))))

(declare-fun b!124660 () Bool)

(assert (=> b!124660 (= e!81489 tp_is_empty!2835)))

(assert (= (and mapNonEmpty!4473 condMapEmpty!4484) mapIsEmpty!4484))

(assert (= (and mapNonEmpty!4473 (not condMapEmpty!4484)) mapNonEmpty!4484))

(assert (= (and mapNonEmpty!4484 ((_ is ValueCellFull!1074) mapValue!4484)) b!124660))

(assert (= (and mapNonEmpty!4473 ((_ is ValueCellFull!1074) mapDefault!4484)) b!124661))

(declare-fun m!144617 () Bool)

(assert (=> mapNonEmpty!4484 m!144617))

(declare-fun b_lambda!5467 () Bool)

(assert (= b_lambda!5465 (or (and b!124369 b_free!2837) (and b!124375 b_free!2839 (= (defaultEntry!2764 newMap!16) (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))))) b_lambda!5467)))

(check-sat (not b!124633) (not b!124625) (not b!124519) (not bm!13334) b_and!7659 (not b!124616) (not bm!13337) (not bm!13329) (not b!124506) (not b!124447) (not bm!13259) (not d!37295) (not d!37299) (not d!37293) (not b!124636) (not bm!13335) (not b!124445) (not b!124504) (not b_lambda!5467) (not d!37301) (not b!124651) (not b!124644) (not b!124490) (not bm!13317) (not b!124517) (not b!124645) (not b_next!2837) (not b!124446) (not bm!13263) (not b!124500) b_and!7661 (not bm!13326) (not bm!13260) (not bm!13321) (not d!37303) (not b_lambda!5463) (not b!124495) (not bm!13322) tp_is_empty!2835 (not bm!13265) (not b!124510) (not b_next!2839) (not b!124503) (not mapNonEmpty!4484) (not b!124650) (not mapNonEmpty!4483) (not b!124628) (not bm!13332) (not bm!13336) (not b!124498) (not d!37297) (not bm!13330) (not bm!13333))
(check-sat b_and!7659 b_and!7661 (not b_next!2837) (not b_next!2839))
(get-model)

(declare-fun b!124670 () Bool)

(declare-fun e!81499 () Bool)

(declare-fun e!81497 () Bool)

(assert (=> b!124670 (= e!81499 e!81497)))

(declare-fun lt!64120 () (_ BitVec 64))

(assert (=> b!124670 (= lt!64120 (select (arr!2219 (_keys!4493 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!64119 () Unit!3867)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!4685 (_ BitVec 64) (_ BitVec 32)) Unit!3867)

(assert (=> b!124670 (= lt!64119 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!4493 newMap!16) lt!64120 #b00000000000000000000000000000000))))

(assert (=> b!124670 (arrayContainsKey!0 (_keys!4493 newMap!16) lt!64120 #b00000000000000000000000000000000)))

(declare-fun lt!64118 () Unit!3867)

(assert (=> b!124670 (= lt!64118 lt!64119)))

(declare-fun res!60400 () Bool)

(assert (=> b!124670 (= res!60400 (= (seekEntryOrOpen!0 (select (arr!2219 (_keys!4493 newMap!16)) #b00000000000000000000000000000000) (_keys!4493 newMap!16) (mask!7010 newMap!16)) (Found!269 #b00000000000000000000000000000000)))))

(assert (=> b!124670 (=> (not res!60400) (not e!81497))))

(declare-fun b!124671 () Bool)

(declare-fun call!13343 () Bool)

(assert (=> b!124671 (= e!81497 call!13343)))

(declare-fun d!37309 () Bool)

(declare-fun res!60401 () Bool)

(declare-fun e!81498 () Bool)

(assert (=> d!37309 (=> res!60401 e!81498)))

(assert (=> d!37309 (= res!60401 (bvsge #b00000000000000000000000000000000 (size!2482 (_keys!4493 newMap!16))))))

(assert (=> d!37309 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4493 newMap!16) (mask!7010 newMap!16)) e!81498)))

(declare-fun bm!13340 () Bool)

(assert (=> bm!13340 (= call!13343 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!4493 newMap!16) (mask!7010 newMap!16)))))

(declare-fun b!124672 () Bool)

(assert (=> b!124672 (= e!81499 call!13343)))

(declare-fun b!124673 () Bool)

(assert (=> b!124673 (= e!81498 e!81499)))

(declare-fun c!22656 () Bool)

(assert (=> b!124673 (= c!22656 (validKeyInArray!0 (select (arr!2219 (_keys!4493 newMap!16)) #b00000000000000000000000000000000)))))

(assert (= (and d!37309 (not res!60401)) b!124673))

(assert (= (and b!124673 c!22656) b!124670))

(assert (= (and b!124673 (not c!22656)) b!124672))

(assert (= (and b!124670 res!60400) b!124671))

(assert (= (or b!124671 b!124672) bm!13340))

(declare-fun m!144619 () Bool)

(assert (=> b!124670 m!144619))

(declare-fun m!144621 () Bool)

(assert (=> b!124670 m!144621))

(declare-fun m!144623 () Bool)

(assert (=> b!124670 m!144623))

(assert (=> b!124670 m!144619))

(declare-fun m!144625 () Bool)

(assert (=> b!124670 m!144625))

(declare-fun m!144627 () Bool)

(assert (=> bm!13340 m!144627))

(assert (=> b!124673 m!144619))

(assert (=> b!124673 m!144619))

(declare-fun m!144629 () Bool)

(assert (=> b!124673 m!144629))

(assert (=> b!124446 d!37309))

(declare-fun b!124690 () Bool)

(declare-fun e!81511 () Bool)

(declare-fun e!81509 () Bool)

(assert (=> b!124690 (= e!81511 e!81509)))

(declare-fun c!22662 () Bool)

(declare-fun lt!64126 () SeekEntryResult!269)

(assert (=> b!124690 (= c!22662 ((_ is MissingVacant!269) lt!64126))))

(declare-fun b!124691 () Bool)

(declare-fun res!60413 () Bool)

(declare-fun e!81510 () Bool)

(assert (=> b!124691 (=> (not res!60413) (not e!81510))))

(assert (=> b!124691 (= res!60413 (= (select (arr!2219 (_keys!4493 newMap!16)) (index!3233 lt!64126)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!124691 (and (bvsge (index!3233 lt!64126) #b00000000000000000000000000000000) (bvslt (index!3233 lt!64126) (size!2482 (_keys!4493 newMap!16))))))

(declare-fun d!37311 () Bool)

(assert (=> d!37311 e!81511))

(declare-fun c!22661 () Bool)

(assert (=> d!37311 (= c!22661 ((_ is MissingZero!269) lt!64126))))

(assert (=> d!37311 (= lt!64126 (seekEntryOrOpen!0 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355) (_keys!4493 newMap!16) (mask!7010 newMap!16)))))

(declare-fun lt!64125 () Unit!3867)

(declare-fun choose!747 (array!4685 array!4687 (_ BitVec 32) (_ BitVec 32) V!3427 V!3427 (_ BitVec 64) Int) Unit!3867)

(assert (=> d!37311 (= lt!64125 (choose!747 (_keys!4493 newMap!16) (_values!2747 newMap!16) (mask!7010 newMap!16) (extraKeys!2549 newMap!16) (zeroValue!2629 newMap!16) (minValue!2629 newMap!16) (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355) (defaultEntry!2764 newMap!16)))))

(assert (=> d!37311 (validMask!0 (mask!7010 newMap!16))))

(assert (=> d!37311 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!55 (_keys!4493 newMap!16) (_values!2747 newMap!16) (mask!7010 newMap!16) (extraKeys!2549 newMap!16) (zeroValue!2629 newMap!16) (minValue!2629 newMap!16) (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355) (defaultEntry!2764 newMap!16)) lt!64125)))

(declare-fun b!124692 () Bool)

(declare-fun res!60410 () Bool)

(assert (=> b!124692 (=> (not res!60410) (not e!81510))))

(declare-fun call!13348 () Bool)

(assert (=> b!124692 (= res!60410 call!13348)))

(assert (=> b!124692 (= e!81509 e!81510)))

(declare-fun bm!13345 () Bool)

(assert (=> bm!13345 (= call!13348 (inRange!0 (ite c!22661 (index!3230 lt!64126) (index!3233 lt!64126)) (mask!7010 newMap!16)))))

(declare-fun b!124693 () Bool)

(declare-fun call!13349 () Bool)

(assert (=> b!124693 (= e!81510 (not call!13349))))

(declare-fun b!124694 () Bool)

(declare-fun e!81508 () Bool)

(assert (=> b!124694 (= e!81508 (not call!13349))))

(declare-fun b!124695 () Bool)

(assert (=> b!124695 (and (bvsge (index!3230 lt!64126) #b00000000000000000000000000000000) (bvslt (index!3230 lt!64126) (size!2482 (_keys!4493 newMap!16))))))

(declare-fun res!60412 () Bool)

(assert (=> b!124695 (= res!60412 (= (select (arr!2219 (_keys!4493 newMap!16)) (index!3230 lt!64126)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!124695 (=> (not res!60412) (not e!81508))))

(declare-fun bm!13346 () Bool)

(assert (=> bm!13346 (= call!13349 (arrayContainsKey!0 (_keys!4493 newMap!16) (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun b!124696 () Bool)

(assert (=> b!124696 (= e!81509 ((_ is Undefined!269) lt!64126))))

(declare-fun b!124697 () Bool)

(assert (=> b!124697 (= e!81511 e!81508)))

(declare-fun res!60411 () Bool)

(assert (=> b!124697 (= res!60411 call!13348)))

(assert (=> b!124697 (=> (not res!60411) (not e!81508))))

(assert (= (and d!37311 c!22661) b!124697))

(assert (= (and d!37311 (not c!22661)) b!124690))

(assert (= (and b!124697 res!60411) b!124695))

(assert (= (and b!124695 res!60412) b!124694))

(assert (= (and b!124690 c!22662) b!124692))

(assert (= (and b!124690 (not c!22662)) b!124696))

(assert (= (and b!124692 res!60410) b!124691))

(assert (= (and b!124691 res!60413) b!124693))

(assert (= (or b!124697 b!124692) bm!13345))

(assert (= (or b!124694 b!124693) bm!13346))

(assert (=> bm!13346 m!144415))

(assert (=> bm!13346 m!144579))

(assert (=> d!37311 m!144415))

(assert (=> d!37311 m!144557))

(assert (=> d!37311 m!144415))

(declare-fun m!144631 () Bool)

(assert (=> d!37311 m!144631))

(declare-fun m!144633 () Bool)

(assert (=> d!37311 m!144633))

(declare-fun m!144635 () Bool)

(assert (=> bm!13345 m!144635))

(declare-fun m!144637 () Bool)

(assert (=> b!124695 m!144637))

(declare-fun m!144639 () Bool)

(assert (=> b!124691 m!144639))

(assert (=> bm!13335 d!37311))

(declare-fun d!37313 () Bool)

(declare-fun e!81512 () Bool)

(assert (=> d!37313 e!81512))

(declare-fun res!60414 () Bool)

(assert (=> d!37313 (=> res!60414 e!81512)))

(declare-fun lt!64129 () Bool)

(assert (=> d!37313 (= res!60414 (not lt!64129))))

(declare-fun lt!64130 () Bool)

(assert (=> d!37313 (= lt!64129 lt!64130)))

(declare-fun lt!64127 () Unit!3867)

(declare-fun e!81513 () Unit!3867)

(assert (=> d!37313 (= lt!64127 e!81513)))

(declare-fun c!22663 () Bool)

(assert (=> d!37313 (= c!22663 lt!64130)))

(assert (=> d!37313 (= lt!64130 (containsKey!170 (toList!854 call!13340) (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355)))))

(assert (=> d!37313 (= (contains!873 call!13340 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355)) lt!64129)))

(declare-fun b!124698 () Bool)

(declare-fun lt!64128 () Unit!3867)

(assert (=> b!124698 (= e!81513 lt!64128)))

(assert (=> b!124698 (= lt!64128 (lemmaContainsKeyImpliesGetValueByKeyDefined!118 (toList!854 call!13340) (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355)))))

(assert (=> b!124698 (isDefined!119 (getValueByKey!166 (toList!854 call!13340) (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355)))))

(declare-fun b!124699 () Bool)

(declare-fun Unit!3873 () Unit!3867)

(assert (=> b!124699 (= e!81513 Unit!3873)))

(declare-fun b!124700 () Bool)

(assert (=> b!124700 (= e!81512 (isDefined!119 (getValueByKey!166 (toList!854 call!13340) (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355))))))

(assert (= (and d!37313 c!22663) b!124698))

(assert (= (and d!37313 (not c!22663)) b!124699))

(assert (= (and d!37313 (not res!60414)) b!124700))

(assert (=> d!37313 m!144415))

(declare-fun m!144641 () Bool)

(assert (=> d!37313 m!144641))

(assert (=> b!124698 m!144415))

(declare-fun m!144643 () Bool)

(assert (=> b!124698 m!144643))

(assert (=> b!124698 m!144415))

(declare-fun m!144645 () Bool)

(assert (=> b!124698 m!144645))

(assert (=> b!124698 m!144645))

(declare-fun m!144647 () Bool)

(assert (=> b!124698 m!144647))

(assert (=> b!124700 m!144415))

(assert (=> b!124700 m!144645))

(assert (=> b!124700 m!144645))

(assert (=> b!124700 m!144647))

(assert (=> b!124625 d!37313))

(declare-fun b!124712 () Bool)

(declare-fun e!81516 () Bool)

(assert (=> b!124712 (= e!81516 (and (bvsge (extraKeys!2549 newMap!16) #b00000000000000000000000000000000) (bvsle (extraKeys!2549 newMap!16) #b00000000000000000000000000000011) (bvsge (_vacant!577 newMap!16) #b00000000000000000000000000000000)))))

(declare-fun b!124710 () Bool)

(declare-fun res!60426 () Bool)

(assert (=> b!124710 (=> (not res!60426) (not e!81516))))

(declare-fun size!2486 (LongMapFixedSize!1056) (_ BitVec 32))

(assert (=> b!124710 (= res!60426 (bvsge (size!2486 newMap!16) (_size!577 newMap!16)))))

(declare-fun b!124709 () Bool)

(declare-fun res!60425 () Bool)

(assert (=> b!124709 (=> (not res!60425) (not e!81516))))

(assert (=> b!124709 (= res!60425 (and (= (size!2483 (_values!2747 newMap!16)) (bvadd (mask!7010 newMap!16) #b00000000000000000000000000000001)) (= (size!2482 (_keys!4493 newMap!16)) (size!2483 (_values!2747 newMap!16))) (bvsge (_size!577 newMap!16) #b00000000000000000000000000000000) (bvsle (_size!577 newMap!16) (bvadd (mask!7010 newMap!16) #b00000000000000000000000000000001))))))

(declare-fun b!124711 () Bool)

(declare-fun res!60424 () Bool)

(assert (=> b!124711 (=> (not res!60424) (not e!81516))))

(assert (=> b!124711 (= res!60424 (= (size!2486 newMap!16) (bvadd (_size!577 newMap!16) (bvsdiv (bvadd (extraKeys!2549 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun d!37315 () Bool)

(declare-fun res!60423 () Bool)

(assert (=> d!37315 (=> (not res!60423) (not e!81516))))

(assert (=> d!37315 (= res!60423 (validMask!0 (mask!7010 newMap!16)))))

(assert (=> d!37315 (= (simpleValid!86 newMap!16) e!81516)))

(assert (= (and d!37315 res!60423) b!124709))

(assert (= (and b!124709 res!60425) b!124710))

(assert (= (and b!124710 res!60426) b!124711))

(assert (= (and b!124711 res!60424) b!124712))

(declare-fun m!144649 () Bool)

(assert (=> b!124710 m!144649))

(assert (=> b!124711 m!144649))

(assert (=> d!37315 m!144633))

(assert (=> d!37295 d!37315))

(declare-fun d!37317 () Bool)

(declare-fun e!81519 () Bool)

(assert (=> d!37317 e!81519))

(declare-fun res!60431 () Bool)

(assert (=> d!37317 (=> (not res!60431) (not e!81519))))

(declare-fun lt!64139 () ListLongMap!1677)

(assert (=> d!37317 (= res!60431 (contains!873 lt!64139 (_1!1295 (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2629 (v!3108 (underlying!436 thiss!992)))))))))

(declare-fun lt!64140 () List!1695)

(assert (=> d!37317 (= lt!64139 (ListLongMap!1678 lt!64140))))

(declare-fun lt!64142 () Unit!3867)

(declare-fun lt!64141 () Unit!3867)

(assert (=> d!37317 (= lt!64142 lt!64141)))

(assert (=> d!37317 (= (getValueByKey!166 lt!64140 (_1!1295 (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2629 (v!3108 (underlying!436 thiss!992)))))) (Some!171 (_2!1295 (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2629 (v!3108 (underlying!436 thiss!992)))))))))

(declare-fun lemmaContainsTupThenGetReturnValue!81 (List!1695 (_ BitVec 64) V!3427) Unit!3867)

(assert (=> d!37317 (= lt!64141 (lemmaContainsTupThenGetReturnValue!81 lt!64140 (_1!1295 (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2629 (v!3108 (underlying!436 thiss!992))))) (_2!1295 (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2629 (v!3108 (underlying!436 thiss!992)))))))))

(declare-fun insertStrictlySorted!84 (List!1695 (_ BitVec 64) V!3427) List!1695)

(assert (=> d!37317 (= lt!64140 (insertStrictlySorted!84 (toList!854 call!13268) (_1!1295 (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2629 (v!3108 (underlying!436 thiss!992))))) (_2!1295 (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2629 (v!3108 (underlying!436 thiss!992)))))))))

(assert (=> d!37317 (= (+!169 call!13268 (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2629 (v!3108 (underlying!436 thiss!992))))) lt!64139)))

(declare-fun b!124717 () Bool)

(declare-fun res!60432 () Bool)

(assert (=> b!124717 (=> (not res!60432) (not e!81519))))

(assert (=> b!124717 (= res!60432 (= (getValueByKey!166 (toList!854 lt!64139) (_1!1295 (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2629 (v!3108 (underlying!436 thiss!992)))))) (Some!171 (_2!1295 (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2629 (v!3108 (underlying!436 thiss!992))))))))))

(declare-fun b!124718 () Bool)

(declare-fun contains!874 (List!1695 tuple2!2568) Bool)

(assert (=> b!124718 (= e!81519 (contains!874 (toList!854 lt!64139) (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2629 (v!3108 (underlying!436 thiss!992))))))))

(assert (= (and d!37317 res!60431) b!124717))

(assert (= (and b!124717 res!60432) b!124718))

(declare-fun m!144651 () Bool)

(assert (=> d!37317 m!144651))

(declare-fun m!144653 () Bool)

(assert (=> d!37317 m!144653))

(declare-fun m!144655 () Bool)

(assert (=> d!37317 m!144655))

(declare-fun m!144657 () Bool)

(assert (=> d!37317 m!144657))

(declare-fun m!144659 () Bool)

(assert (=> b!124717 m!144659))

(declare-fun m!144661 () Bool)

(assert (=> b!124718 m!144661))

(assert (=> b!124504 d!37317))

(declare-fun d!37319 () Bool)

(assert (=> d!37319 (isDefined!119 (getValueByKey!166 (toList!854 lt!63941) (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355)))))

(declare-fun lt!64145 () Unit!3867)

(declare-fun choose!748 (List!1695 (_ BitVec 64)) Unit!3867)

(assert (=> d!37319 (= lt!64145 (choose!748 (toList!854 lt!63941) (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355)))))

(declare-fun e!81522 () Bool)

(assert (=> d!37319 e!81522))

(declare-fun res!60435 () Bool)

(assert (=> d!37319 (=> (not res!60435) (not e!81522))))

(declare-fun isStrictlySorted!316 (List!1695) Bool)

(assert (=> d!37319 (= res!60435 (isStrictlySorted!316 (toList!854 lt!63941)))))

(assert (=> d!37319 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!118 (toList!854 lt!63941) (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355)) lt!64145)))

(declare-fun b!124721 () Bool)

(assert (=> b!124721 (= e!81522 (containsKey!170 (toList!854 lt!63941) (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355)))))

(assert (= (and d!37319 res!60435) b!124721))

(assert (=> d!37319 m!144415))

(assert (=> d!37319 m!144553))

(assert (=> d!37319 m!144553))

(assert (=> d!37319 m!144555))

(assert (=> d!37319 m!144415))

(declare-fun m!144663 () Bool)

(assert (=> d!37319 m!144663))

(declare-fun m!144665 () Bool)

(assert (=> d!37319 m!144665))

(assert (=> b!124721 m!144415))

(assert (=> b!124721 m!144549))

(assert (=> b!124517 d!37319))

(declare-fun d!37321 () Bool)

(declare-fun isEmpty!393 (Option!172) Bool)

(assert (=> d!37321 (= (isDefined!119 (getValueByKey!166 (toList!854 lt!63941) (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355))) (not (isEmpty!393 (getValueByKey!166 (toList!854 lt!63941) (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355)))))))

(declare-fun bs!5149 () Bool)

(assert (= bs!5149 d!37321))

(assert (=> bs!5149 m!144553))

(declare-fun m!144667 () Bool)

(assert (=> bs!5149 m!144667))

(assert (=> b!124517 d!37321))

(declare-fun d!37323 () Bool)

(declare-fun c!22668 () Bool)

(assert (=> d!37323 (= c!22668 (and ((_ is Cons!1691) (toList!854 lt!63941)) (= (_1!1295 (h!2292 (toList!854 lt!63941))) (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355))))))

(declare-fun e!81527 () Option!172)

(assert (=> d!37323 (= (getValueByKey!166 (toList!854 lt!63941) (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355)) e!81527)))

(declare-fun b!124730 () Bool)

(assert (=> b!124730 (= e!81527 (Some!171 (_2!1295 (h!2292 (toList!854 lt!63941)))))))

(declare-fun b!124732 () Bool)

(declare-fun e!81528 () Option!172)

(assert (=> b!124732 (= e!81528 (getValueByKey!166 (t!6022 (toList!854 lt!63941)) (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355)))))

(declare-fun b!124733 () Bool)

(assert (=> b!124733 (= e!81528 None!170)))

(declare-fun b!124731 () Bool)

(assert (=> b!124731 (= e!81527 e!81528)))

(declare-fun c!22669 () Bool)

(assert (=> b!124731 (= c!22669 (and ((_ is Cons!1691) (toList!854 lt!63941)) (not (= (_1!1295 (h!2292 (toList!854 lt!63941))) (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355)))))))

(assert (= (and d!37323 c!22668) b!124730))

(assert (= (and d!37323 (not c!22668)) b!124731))

(assert (= (and b!124731 c!22669) b!124732))

(assert (= (and b!124731 (not c!22669)) b!124733))

(assert (=> b!124732 m!144415))

(declare-fun m!144669 () Bool)

(assert (=> b!124732 m!144669))

(assert (=> b!124517 d!37323))

(declare-fun d!37325 () Bool)

(declare-fun lt!64148 () (_ BitVec 32))

(assert (=> d!37325 (and (bvsge lt!64148 #b00000000000000000000000000000000) (bvsle lt!64148 (bvsub (size!2482 (_keys!4493 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun e!81533 () (_ BitVec 32))

(assert (=> d!37325 (= lt!64148 e!81533)))

(declare-fun c!22674 () Bool)

(assert (=> d!37325 (= c!22674 (bvsge #b00000000000000000000000000000000 (size!2482 (_keys!4493 newMap!16))))))

(assert (=> d!37325 (and (bvsle #b00000000000000000000000000000000 (size!2482 (_keys!4493 newMap!16))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!2482 (_keys!4493 newMap!16)) (size!2482 (_keys!4493 newMap!16))))))

(assert (=> d!37325 (= (arrayCountValidKeys!0 (_keys!4493 newMap!16) #b00000000000000000000000000000000 (size!2482 (_keys!4493 newMap!16))) lt!64148)))

(declare-fun b!124742 () Bool)

(declare-fun e!81534 () (_ BitVec 32))

(assert (=> b!124742 (= e!81533 e!81534)))

(declare-fun c!22675 () Bool)

(assert (=> b!124742 (= c!22675 (validKeyInArray!0 (select (arr!2219 (_keys!4493 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!124743 () Bool)

(declare-fun call!13352 () (_ BitVec 32))

(assert (=> b!124743 (= e!81534 (bvadd #b00000000000000000000000000000001 call!13352))))

(declare-fun b!124744 () Bool)

(assert (=> b!124744 (= e!81534 call!13352)))

(declare-fun b!124745 () Bool)

(assert (=> b!124745 (= e!81533 #b00000000000000000000000000000000)))

(declare-fun bm!13349 () Bool)

(assert (=> bm!13349 (= call!13352 (arrayCountValidKeys!0 (_keys!4493 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2482 (_keys!4493 newMap!16))))))

(assert (= (and d!37325 c!22674) b!124745))

(assert (= (and d!37325 (not c!22674)) b!124742))

(assert (= (and b!124742 c!22675) b!124743))

(assert (= (and b!124742 (not c!22675)) b!124744))

(assert (= (or b!124743 b!124744) bm!13349))

(assert (=> b!124742 m!144619))

(assert (=> b!124742 m!144619))

(assert (=> b!124742 m!144629))

(declare-fun m!144671 () Bool)

(assert (=> bm!13349 m!144671))

(assert (=> b!124445 d!37325))

(declare-fun b!124758 () Bool)

(declare-fun e!81542 () SeekEntryResult!269)

(declare-fun lt!64156 () SeekEntryResult!269)

(assert (=> b!124758 (= e!81542 (MissingZero!269 (index!3232 lt!64156)))))

(declare-fun b!124759 () Bool)

(declare-fun c!22683 () Bool)

(declare-fun lt!64157 () (_ BitVec 64))

(assert (=> b!124759 (= c!22683 (= lt!64157 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!81541 () SeekEntryResult!269)

(assert (=> b!124759 (= e!81541 e!81542)))

(declare-fun lt!64155 () SeekEntryResult!269)

(declare-fun d!37327 () Bool)

(assert (=> d!37327 (and (or ((_ is Undefined!269) lt!64155) (not ((_ is Found!269) lt!64155)) (and (bvsge (index!3231 lt!64155) #b00000000000000000000000000000000) (bvslt (index!3231 lt!64155) (size!2482 (_keys!4493 newMap!16))))) (or ((_ is Undefined!269) lt!64155) ((_ is Found!269) lt!64155) (not ((_ is MissingZero!269) lt!64155)) (and (bvsge (index!3230 lt!64155) #b00000000000000000000000000000000) (bvslt (index!3230 lt!64155) (size!2482 (_keys!4493 newMap!16))))) (or ((_ is Undefined!269) lt!64155) ((_ is Found!269) lt!64155) ((_ is MissingZero!269) lt!64155) (not ((_ is MissingVacant!269) lt!64155)) (and (bvsge (index!3233 lt!64155) #b00000000000000000000000000000000) (bvslt (index!3233 lt!64155) (size!2482 (_keys!4493 newMap!16))))) (or ((_ is Undefined!269) lt!64155) (ite ((_ is Found!269) lt!64155) (= (select (arr!2219 (_keys!4493 newMap!16)) (index!3231 lt!64155)) (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355)) (ite ((_ is MissingZero!269) lt!64155) (= (select (arr!2219 (_keys!4493 newMap!16)) (index!3230 lt!64155)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!269) lt!64155) (= (select (arr!2219 (_keys!4493 newMap!16)) (index!3233 lt!64155)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!81543 () SeekEntryResult!269)

(assert (=> d!37327 (= lt!64155 e!81543)))

(declare-fun c!22682 () Bool)

(assert (=> d!37327 (= c!22682 (and ((_ is Intermediate!269) lt!64156) (undefined!1081 lt!64156)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!4685 (_ BitVec 32)) SeekEntryResult!269)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!37327 (= lt!64156 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355) (mask!7010 newMap!16)) (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355) (_keys!4493 newMap!16) (mask!7010 newMap!16)))))

(assert (=> d!37327 (validMask!0 (mask!7010 newMap!16))))

(assert (=> d!37327 (= (seekEntryOrOpen!0 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355) (_keys!4493 newMap!16) (mask!7010 newMap!16)) lt!64155)))

(declare-fun b!124760 () Bool)

(assert (=> b!124760 (= e!81543 e!81541)))

(assert (=> b!124760 (= lt!64157 (select (arr!2219 (_keys!4493 newMap!16)) (index!3232 lt!64156)))))

(declare-fun c!22684 () Bool)

(assert (=> b!124760 (= c!22684 (= lt!64157 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355)))))

(declare-fun b!124761 () Bool)

(assert (=> b!124761 (= e!81543 Undefined!269)))

(declare-fun b!124762 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!4685 (_ BitVec 32)) SeekEntryResult!269)

(assert (=> b!124762 (= e!81542 (seekKeyOrZeroReturnVacant!0 (x!14818 lt!64156) (index!3232 lt!64156) (index!3232 lt!64156) (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355) (_keys!4493 newMap!16) (mask!7010 newMap!16)))))

(declare-fun b!124763 () Bool)

(assert (=> b!124763 (= e!81541 (Found!269 (index!3232 lt!64156)))))

(assert (= (and d!37327 c!22682) b!124761))

(assert (= (and d!37327 (not c!22682)) b!124760))

(assert (= (and b!124760 c!22684) b!124763))

(assert (= (and b!124760 (not c!22684)) b!124759))

(assert (= (and b!124759 c!22683) b!124758))

(assert (= (and b!124759 (not c!22683)) b!124762))

(assert (=> d!37327 m!144633))

(declare-fun m!144673 () Bool)

(assert (=> d!37327 m!144673))

(assert (=> d!37327 m!144415))

(declare-fun m!144675 () Bool)

(assert (=> d!37327 m!144675))

(assert (=> d!37327 m!144415))

(assert (=> d!37327 m!144673))

(declare-fun m!144677 () Bool)

(assert (=> d!37327 m!144677))

(declare-fun m!144679 () Bool)

(assert (=> d!37327 m!144679))

(declare-fun m!144681 () Bool)

(assert (=> d!37327 m!144681))

(declare-fun m!144683 () Bool)

(assert (=> b!124760 m!144683))

(assert (=> b!124762 m!144415))

(declare-fun m!144685 () Bool)

(assert (=> b!124762 m!144685))

(assert (=> bm!13336 d!37327))

(declare-fun d!37329 () Bool)

(assert (=> d!37329 (= (validKeyInArray!0 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (and (not (= (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!124506 d!37329))

(declare-fun d!37331 () Bool)

(declare-fun e!81544 () Bool)

(assert (=> d!37331 e!81544))

(declare-fun res!60436 () Bool)

(assert (=> d!37331 (=> (not res!60436) (not e!81544))))

(declare-fun lt!64158 () ListLongMap!1677)

(assert (=> d!37331 (= res!60436 (contains!873 lt!64158 (_1!1295 (ite (or c!22605 c!22603) (tuple2!2569 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2629 (v!3108 (underlying!436 thiss!992)))) (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2629 (v!3108 (underlying!436 thiss!992))))))))))

(declare-fun lt!64159 () List!1695)

(assert (=> d!37331 (= lt!64158 (ListLongMap!1678 lt!64159))))

(declare-fun lt!64161 () Unit!3867)

(declare-fun lt!64160 () Unit!3867)

(assert (=> d!37331 (= lt!64161 lt!64160)))

(assert (=> d!37331 (= (getValueByKey!166 lt!64159 (_1!1295 (ite (or c!22605 c!22603) (tuple2!2569 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2629 (v!3108 (underlying!436 thiss!992)))) (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2629 (v!3108 (underlying!436 thiss!992))))))) (Some!171 (_2!1295 (ite (or c!22605 c!22603) (tuple2!2569 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2629 (v!3108 (underlying!436 thiss!992)))) (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2629 (v!3108 (underlying!436 thiss!992))))))))))

(assert (=> d!37331 (= lt!64160 (lemmaContainsTupThenGetReturnValue!81 lt!64159 (_1!1295 (ite (or c!22605 c!22603) (tuple2!2569 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2629 (v!3108 (underlying!436 thiss!992)))) (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2629 (v!3108 (underlying!436 thiss!992)))))) (_2!1295 (ite (or c!22605 c!22603) (tuple2!2569 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2629 (v!3108 (underlying!436 thiss!992)))) (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2629 (v!3108 (underlying!436 thiss!992))))))))))

(assert (=> d!37331 (= lt!64159 (insertStrictlySorted!84 (toList!854 (ite c!22605 call!13262 (ite c!22603 call!13264 call!13263))) (_1!1295 (ite (or c!22605 c!22603) (tuple2!2569 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2629 (v!3108 (underlying!436 thiss!992)))) (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2629 (v!3108 (underlying!436 thiss!992)))))) (_2!1295 (ite (or c!22605 c!22603) (tuple2!2569 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2629 (v!3108 (underlying!436 thiss!992)))) (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2629 (v!3108 (underlying!436 thiss!992))))))))))

(assert (=> d!37331 (= (+!169 (ite c!22605 call!13262 (ite c!22603 call!13264 call!13263)) (ite (or c!22605 c!22603) (tuple2!2569 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2629 (v!3108 (underlying!436 thiss!992)))) (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2629 (v!3108 (underlying!436 thiss!992)))))) lt!64158)))

(declare-fun b!124764 () Bool)

(declare-fun res!60437 () Bool)

(assert (=> b!124764 (=> (not res!60437) (not e!81544))))

(assert (=> b!124764 (= res!60437 (= (getValueByKey!166 (toList!854 lt!64158) (_1!1295 (ite (or c!22605 c!22603) (tuple2!2569 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2629 (v!3108 (underlying!436 thiss!992)))) (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2629 (v!3108 (underlying!436 thiss!992))))))) (Some!171 (_2!1295 (ite (or c!22605 c!22603) (tuple2!2569 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2629 (v!3108 (underlying!436 thiss!992)))) (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2629 (v!3108 (underlying!436 thiss!992)))))))))))

(declare-fun b!124765 () Bool)

(assert (=> b!124765 (= e!81544 (contains!874 (toList!854 lt!64158) (ite (or c!22605 c!22603) (tuple2!2569 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2629 (v!3108 (underlying!436 thiss!992)))) (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2629 (v!3108 (underlying!436 thiss!992)))))))))

(assert (= (and d!37331 res!60436) b!124764))

(assert (= (and b!124764 res!60437) b!124765))

(declare-fun m!144687 () Bool)

(assert (=> d!37331 m!144687))

(declare-fun m!144689 () Bool)

(assert (=> d!37331 m!144689))

(declare-fun m!144691 () Bool)

(assert (=> d!37331 m!144691))

(declare-fun m!144693 () Bool)

(assert (=> d!37331 m!144693))

(declare-fun m!144695 () Bool)

(assert (=> b!124764 m!144695))

(declare-fun m!144697 () Bool)

(assert (=> b!124765 m!144697))

(assert (=> bm!13260 d!37331))

(declare-fun d!37333 () Bool)

(declare-fun e!81547 () Bool)

(assert (=> d!37333 e!81547))

(declare-fun res!60440 () Bool)

(assert (=> d!37333 (=> (not res!60440) (not e!81547))))

(assert (=> d!37333 (= res!60440 (and (bvsge (index!3231 lt!64093) #b00000000000000000000000000000000) (bvslt (index!3231 lt!64093) (size!2482 (_keys!4493 newMap!16)))))))

(declare-fun lt!64164 () Unit!3867)

(declare-fun choose!749 (array!4685 array!4687 (_ BitVec 32) (_ BitVec 32) V!3427 V!3427 (_ BitVec 32) Int) Unit!3867)

(assert (=> d!37333 (= lt!64164 (choose!749 (_keys!4493 newMap!16) lt!64109 (mask!7010 newMap!16) (extraKeys!2549 newMap!16) (zeroValue!2629 newMap!16) (minValue!2629 newMap!16) (index!3231 lt!64093) (defaultEntry!2764 newMap!16)))))

(assert (=> d!37333 (validMask!0 (mask!7010 newMap!16))))

(assert (=> d!37333 (= (lemmaValidKeyInArrayIsInListMap!116 (_keys!4493 newMap!16) lt!64109 (mask!7010 newMap!16) (extraKeys!2549 newMap!16) (zeroValue!2629 newMap!16) (minValue!2629 newMap!16) (index!3231 lt!64093) (defaultEntry!2764 newMap!16)) lt!64164)))

(declare-fun b!124768 () Bool)

(assert (=> b!124768 (= e!81547 (contains!873 (getCurrentListMap!535 (_keys!4493 newMap!16) lt!64109 (mask!7010 newMap!16) (extraKeys!2549 newMap!16) (zeroValue!2629 newMap!16) (minValue!2629 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2764 newMap!16)) (select (arr!2219 (_keys!4493 newMap!16)) (index!3231 lt!64093))))))

(assert (= (and d!37333 res!60440) b!124768))

(declare-fun m!144699 () Bool)

(assert (=> d!37333 m!144699))

(assert (=> d!37333 m!144633))

(declare-fun m!144701 () Bool)

(assert (=> b!124768 m!144701))

(assert (=> b!124768 m!144603))

(assert (=> b!124768 m!144701))

(assert (=> b!124768 m!144603))

(declare-fun m!144703 () Bool)

(assert (=> b!124768 m!144703))

(assert (=> b!124628 d!37333))

(declare-fun d!37335 () Bool)

(declare-fun e!81550 () Bool)

(assert (=> d!37335 e!81550))

(declare-fun res!60443 () Bool)

(assert (=> d!37335 (=> (not res!60443) (not e!81550))))

(assert (=> d!37335 (= res!60443 (and (bvsge (index!3231 lt!64093) #b00000000000000000000000000000000) (bvslt (index!3231 lt!64093) (size!2483 (_values!2747 newMap!16)))))))

(declare-fun lt!64167 () Unit!3867)

(declare-fun choose!750 (array!4685 array!4687 (_ BitVec 32) (_ BitVec 32) V!3427 V!3427 (_ BitVec 32) (_ BitVec 64) V!3427 Int) Unit!3867)

(assert (=> d!37335 (= lt!64167 (choose!750 (_keys!4493 newMap!16) (_values!2747 newMap!16) (mask!7010 newMap!16) (extraKeys!2549 newMap!16) (zeroValue!2629 newMap!16) (minValue!2629 newMap!16) (index!3231 lt!64093) (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2764 newMap!16)))))

(assert (=> d!37335 (validMask!0 (mask!7010 newMap!16))))

(assert (=> d!37335 (= (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!55 (_keys!4493 newMap!16) (_values!2747 newMap!16) (mask!7010 newMap!16) (extraKeys!2549 newMap!16) (zeroValue!2629 newMap!16) (minValue!2629 newMap!16) (index!3231 lt!64093) (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2764 newMap!16)) lt!64167)))

(declare-fun b!124771 () Bool)

(assert (=> b!124771 (= e!81550 (= (+!169 (getCurrentListMap!535 (_keys!4493 newMap!16) (_values!2747 newMap!16) (mask!7010 newMap!16) (extraKeys!2549 newMap!16) (zeroValue!2629 newMap!16) (minValue!2629 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2764 newMap!16)) (tuple2!2569 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (getCurrentListMap!535 (_keys!4493 newMap!16) (array!4688 (store (arr!2220 (_values!2747 newMap!16)) (index!3231 lt!64093) (ValueCellFull!1074 (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2483 (_values!2747 newMap!16))) (mask!7010 newMap!16) (extraKeys!2549 newMap!16) (zeroValue!2629 newMap!16) (minValue!2629 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2764 newMap!16))))))

(assert (= (and d!37335 res!60443) b!124771))

(assert (=> d!37335 m!144415))

(assert (=> d!37335 m!144425))

(declare-fun m!144705 () Bool)

(assert (=> d!37335 m!144705))

(assert (=> d!37335 m!144633))

(assert (=> b!124771 m!144491))

(assert (=> b!124771 m!144491))

(declare-fun m!144707 () Bool)

(assert (=> b!124771 m!144707))

(assert (=> b!124771 m!144567))

(declare-fun m!144709 () Bool)

(assert (=> b!124771 m!144709))

(assert (=> b!124628 d!37335))

(declare-fun d!37337 () Bool)

(declare-fun e!81551 () Bool)

(assert (=> d!37337 e!81551))

(declare-fun res!60444 () Bool)

(assert (=> d!37337 (=> res!60444 e!81551)))

(declare-fun lt!64170 () Bool)

(assert (=> d!37337 (= res!60444 (not lt!64170))))

(declare-fun lt!64171 () Bool)

(assert (=> d!37337 (= lt!64170 lt!64171)))

(declare-fun lt!64168 () Unit!3867)

(declare-fun e!81552 () Unit!3867)

(assert (=> d!37337 (= lt!64168 e!81552)))

(declare-fun c!22685 () Bool)

(assert (=> d!37337 (= c!22685 lt!64171)))

(assert (=> d!37337 (= lt!64171 (containsKey!170 (toList!854 (getCurrentListMap!535 (_keys!4493 newMap!16) (_values!2747 newMap!16) (mask!7010 newMap!16) (extraKeys!2549 newMap!16) (zeroValue!2629 newMap!16) (minValue!2629 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2764 newMap!16))) (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355)))))

(assert (=> d!37337 (= (contains!873 (getCurrentListMap!535 (_keys!4493 newMap!16) (_values!2747 newMap!16) (mask!7010 newMap!16) (extraKeys!2549 newMap!16) (zeroValue!2629 newMap!16) (minValue!2629 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2764 newMap!16)) (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355)) lt!64170)))

(declare-fun b!124772 () Bool)

(declare-fun lt!64169 () Unit!3867)

(assert (=> b!124772 (= e!81552 lt!64169)))

(assert (=> b!124772 (= lt!64169 (lemmaContainsKeyImpliesGetValueByKeyDefined!118 (toList!854 (getCurrentListMap!535 (_keys!4493 newMap!16) (_values!2747 newMap!16) (mask!7010 newMap!16) (extraKeys!2549 newMap!16) (zeroValue!2629 newMap!16) (minValue!2629 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2764 newMap!16))) (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355)))))

(assert (=> b!124772 (isDefined!119 (getValueByKey!166 (toList!854 (getCurrentListMap!535 (_keys!4493 newMap!16) (_values!2747 newMap!16) (mask!7010 newMap!16) (extraKeys!2549 newMap!16) (zeroValue!2629 newMap!16) (minValue!2629 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2764 newMap!16))) (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355)))))

(declare-fun b!124773 () Bool)

(declare-fun Unit!3874 () Unit!3867)

(assert (=> b!124773 (= e!81552 Unit!3874)))

(declare-fun b!124774 () Bool)

(assert (=> b!124774 (= e!81551 (isDefined!119 (getValueByKey!166 (toList!854 (getCurrentListMap!535 (_keys!4493 newMap!16) (_values!2747 newMap!16) (mask!7010 newMap!16) (extraKeys!2549 newMap!16) (zeroValue!2629 newMap!16) (minValue!2629 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2764 newMap!16))) (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355))))))

(assert (= (and d!37337 c!22685) b!124772))

(assert (= (and d!37337 (not c!22685)) b!124773))

(assert (= (and d!37337 (not res!60444)) b!124774))

(assert (=> d!37337 m!144415))

(declare-fun m!144711 () Bool)

(assert (=> d!37337 m!144711))

(assert (=> b!124772 m!144415))

(declare-fun m!144713 () Bool)

(assert (=> b!124772 m!144713))

(assert (=> b!124772 m!144415))

(declare-fun m!144715 () Bool)

(assert (=> b!124772 m!144715))

(assert (=> b!124772 m!144715))

(declare-fun m!144717 () Bool)

(assert (=> b!124772 m!144717))

(assert (=> b!124774 m!144415))

(assert (=> b!124774 m!144715))

(assert (=> b!124774 m!144715))

(assert (=> b!124774 m!144717))

(assert (=> b!124628 d!37337))

(declare-fun bm!13350 () Bool)

(declare-fun call!13353 () ListLongMap!1677)

(assert (=> bm!13350 (= call!13353 (getCurrentListMapNoExtraKeys!135 (_keys!4493 newMap!16) (_values!2747 newMap!16) (mask!7010 newMap!16) (extraKeys!2549 newMap!16) (zeroValue!2629 newMap!16) (minValue!2629 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2764 newMap!16)))))

(declare-fun call!13355 () ListLongMap!1677)

(declare-fun bm!13351 () Bool)

(declare-fun c!22691 () Bool)

(declare-fun c!22689 () Bool)

(declare-fun call!13354 () ListLongMap!1677)

(declare-fun call!13359 () ListLongMap!1677)

(assert (=> bm!13351 (= call!13359 (+!169 (ite c!22691 call!13353 (ite c!22689 call!13355 call!13354)) (ite (or c!22691 c!22689) (tuple2!2569 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2629 newMap!16)) (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2629 newMap!16)))))))

(declare-fun bm!13352 () Bool)

(assert (=> bm!13352 (= call!13355 call!13353)))

(declare-fun b!124776 () Bool)

(declare-fun e!81556 () ListLongMap!1677)

(declare-fun call!13358 () ListLongMap!1677)

(assert (=> b!124776 (= e!81556 call!13358)))

(declare-fun b!124777 () Bool)

(declare-fun e!81561 () ListLongMap!1677)

(assert (=> b!124777 (= e!81561 call!13354)))

(declare-fun b!124778 () Bool)

(declare-fun e!81563 () ListLongMap!1677)

(assert (=> b!124778 (= e!81563 e!81556)))

(assert (=> b!124778 (= c!22689 (and (not (= (bvand (extraKeys!2549 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2549 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!124779 () Bool)

(declare-fun e!81564 () Bool)

(declare-fun call!13357 () Bool)

(assert (=> b!124779 (= e!81564 (not call!13357))))

(declare-fun b!124780 () Bool)

(declare-fun e!81559 () Bool)

(declare-fun e!81562 () Bool)

(assert (=> b!124780 (= e!81559 e!81562)))

(declare-fun res!60453 () Bool)

(assert (=> b!124780 (=> (not res!60453) (not e!81562))))

(declare-fun lt!64187 () ListLongMap!1677)

(assert (=> b!124780 (= res!60453 (contains!873 lt!64187 (select (arr!2219 (_keys!4493 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!124780 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2482 (_keys!4493 newMap!16))))))

(declare-fun bm!13353 () Bool)

(assert (=> bm!13353 (= call!13354 call!13355)))

(declare-fun b!124781 () Bool)

(declare-fun e!81560 () Bool)

(declare-fun call!13356 () Bool)

(assert (=> b!124781 (= e!81560 (not call!13356))))

(declare-fun b!124782 () Bool)

(declare-fun e!81558 () Unit!3867)

(declare-fun Unit!3875 () Unit!3867)

(assert (=> b!124782 (= e!81558 Unit!3875)))

(declare-fun b!124783 () Bool)

(declare-fun e!81553 () Bool)

(assert (=> b!124783 (= e!81553 (validKeyInArray!0 (select (arr!2219 (_keys!4493 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!124784 () Bool)

(declare-fun e!81554 () Bool)

(assert (=> b!124784 (= e!81560 e!81554)))

(declare-fun res!60446 () Bool)

(assert (=> b!124784 (= res!60446 call!13356)))

(assert (=> b!124784 (=> (not res!60446) (not e!81554))))

(declare-fun b!124785 () Bool)

(declare-fun lt!64183 () Unit!3867)

(assert (=> b!124785 (= e!81558 lt!64183)))

(declare-fun lt!64172 () ListLongMap!1677)

(assert (=> b!124785 (= lt!64172 (getCurrentListMapNoExtraKeys!135 (_keys!4493 newMap!16) (_values!2747 newMap!16) (mask!7010 newMap!16) (extraKeys!2549 newMap!16) (zeroValue!2629 newMap!16) (minValue!2629 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2764 newMap!16)))))

(declare-fun lt!64178 () (_ BitVec 64))

(assert (=> b!124785 (= lt!64178 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!64188 () (_ BitVec 64))

(assert (=> b!124785 (= lt!64188 (select (arr!2219 (_keys!4493 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!64173 () Unit!3867)

(assert (=> b!124785 (= lt!64173 (addStillContains!86 lt!64172 lt!64178 (zeroValue!2629 newMap!16) lt!64188))))

(assert (=> b!124785 (contains!873 (+!169 lt!64172 (tuple2!2569 lt!64178 (zeroValue!2629 newMap!16))) lt!64188)))

(declare-fun lt!64190 () Unit!3867)

(assert (=> b!124785 (= lt!64190 lt!64173)))

(declare-fun lt!64191 () ListLongMap!1677)

(assert (=> b!124785 (= lt!64191 (getCurrentListMapNoExtraKeys!135 (_keys!4493 newMap!16) (_values!2747 newMap!16) (mask!7010 newMap!16) (extraKeys!2549 newMap!16) (zeroValue!2629 newMap!16) (minValue!2629 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2764 newMap!16)))))

(declare-fun lt!64174 () (_ BitVec 64))

(assert (=> b!124785 (= lt!64174 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!64186 () (_ BitVec 64))

(assert (=> b!124785 (= lt!64186 (select (arr!2219 (_keys!4493 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!64184 () Unit!3867)

(assert (=> b!124785 (= lt!64184 (addApplyDifferent!86 lt!64191 lt!64174 (minValue!2629 newMap!16) lt!64186))))

(assert (=> b!124785 (= (apply!110 (+!169 lt!64191 (tuple2!2569 lt!64174 (minValue!2629 newMap!16))) lt!64186) (apply!110 lt!64191 lt!64186))))

(declare-fun lt!64189 () Unit!3867)

(assert (=> b!124785 (= lt!64189 lt!64184)))

(declare-fun lt!64182 () ListLongMap!1677)

(assert (=> b!124785 (= lt!64182 (getCurrentListMapNoExtraKeys!135 (_keys!4493 newMap!16) (_values!2747 newMap!16) (mask!7010 newMap!16) (extraKeys!2549 newMap!16) (zeroValue!2629 newMap!16) (minValue!2629 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2764 newMap!16)))))

(declare-fun lt!64192 () (_ BitVec 64))

(assert (=> b!124785 (= lt!64192 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!64180 () (_ BitVec 64))

(assert (=> b!124785 (= lt!64180 (select (arr!2219 (_keys!4493 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!64193 () Unit!3867)

(assert (=> b!124785 (= lt!64193 (addApplyDifferent!86 lt!64182 lt!64192 (zeroValue!2629 newMap!16) lt!64180))))

(assert (=> b!124785 (= (apply!110 (+!169 lt!64182 (tuple2!2569 lt!64192 (zeroValue!2629 newMap!16))) lt!64180) (apply!110 lt!64182 lt!64180))))

(declare-fun lt!64185 () Unit!3867)

(assert (=> b!124785 (= lt!64185 lt!64193)))

(declare-fun lt!64179 () ListLongMap!1677)

(assert (=> b!124785 (= lt!64179 (getCurrentListMapNoExtraKeys!135 (_keys!4493 newMap!16) (_values!2747 newMap!16) (mask!7010 newMap!16) (extraKeys!2549 newMap!16) (zeroValue!2629 newMap!16) (minValue!2629 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2764 newMap!16)))))

(declare-fun lt!64176 () (_ BitVec 64))

(assert (=> b!124785 (= lt!64176 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!64177 () (_ BitVec 64))

(assert (=> b!124785 (= lt!64177 (select (arr!2219 (_keys!4493 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!124785 (= lt!64183 (addApplyDifferent!86 lt!64179 lt!64176 (minValue!2629 newMap!16) lt!64177))))

(assert (=> b!124785 (= (apply!110 (+!169 lt!64179 (tuple2!2569 lt!64176 (minValue!2629 newMap!16))) lt!64177) (apply!110 lt!64179 lt!64177))))

(declare-fun b!124786 () Bool)

(declare-fun res!60451 () Bool)

(declare-fun e!81557 () Bool)

(assert (=> b!124786 (=> (not res!60451) (not e!81557))))

(assert (=> b!124786 (= res!60451 e!81560)))

(declare-fun c!22687 () Bool)

(assert (=> b!124786 (= c!22687 (not (= (bvand (extraKeys!2549 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!124787 () Bool)

(declare-fun c!22690 () Bool)

(assert (=> b!124787 (= c!22690 (and (not (= (bvand (extraKeys!2549 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2549 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!124787 (= e!81556 e!81561)))

(declare-fun b!124788 () Bool)

(assert (=> b!124788 (= e!81554 (= (apply!110 lt!64187 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2629 newMap!16)))))

(declare-fun bm!13354 () Bool)

(assert (=> bm!13354 (= call!13356 (contains!873 lt!64187 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!124789 () Bool)

(assert (=> b!124789 (= e!81563 (+!169 call!13359 (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2629 newMap!16))))))

(declare-fun b!124775 () Bool)

(assert (=> b!124775 (= e!81562 (= (apply!110 lt!64187 (select (arr!2219 (_keys!4493 newMap!16)) #b00000000000000000000000000000000)) (get!1436 (select (arr!2220 (_values!2747 newMap!16)) #b00000000000000000000000000000000) (dynLambda!411 (defaultEntry!2764 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!124775 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2483 (_values!2747 newMap!16))))))

(assert (=> b!124775 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2482 (_keys!4493 newMap!16))))))

(declare-fun d!37339 () Bool)

(assert (=> d!37339 e!81557))

(declare-fun res!60447 () Bool)

(assert (=> d!37339 (=> (not res!60447) (not e!81557))))

(assert (=> d!37339 (= res!60447 (or (bvsge #b00000000000000000000000000000000 (size!2482 (_keys!4493 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2482 (_keys!4493 newMap!16))))))))

(declare-fun lt!64175 () ListLongMap!1677)

(assert (=> d!37339 (= lt!64187 lt!64175)))

(declare-fun lt!64181 () Unit!3867)

(assert (=> d!37339 (= lt!64181 e!81558)))

(declare-fun c!22688 () Bool)

(declare-fun e!81555 () Bool)

(assert (=> d!37339 (= c!22688 e!81555)))

(declare-fun res!60448 () Bool)

(assert (=> d!37339 (=> (not res!60448) (not e!81555))))

(assert (=> d!37339 (= res!60448 (bvslt #b00000000000000000000000000000000 (size!2482 (_keys!4493 newMap!16))))))

(assert (=> d!37339 (= lt!64175 e!81563)))

(assert (=> d!37339 (= c!22691 (and (not (= (bvand (extraKeys!2549 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2549 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!37339 (validMask!0 (mask!7010 newMap!16))))

(assert (=> d!37339 (= (getCurrentListMap!535 (_keys!4493 newMap!16) (_values!2747 newMap!16) (mask!7010 newMap!16) (extraKeys!2549 newMap!16) (zeroValue!2629 newMap!16) (minValue!2629 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2764 newMap!16)) lt!64187)))

(declare-fun bm!13355 () Bool)

(assert (=> bm!13355 (= call!13358 call!13359)))

(declare-fun b!124790 () Bool)

(assert (=> b!124790 (= e!81557 e!81564)))

(declare-fun c!22686 () Bool)

(assert (=> b!124790 (= c!22686 (not (= (bvand (extraKeys!2549 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!13356 () Bool)

(assert (=> bm!13356 (= call!13357 (contains!873 lt!64187 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!124791 () Bool)

(assert (=> b!124791 (= e!81555 (validKeyInArray!0 (select (arr!2219 (_keys!4493 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!124792 () Bool)

(declare-fun e!81565 () Bool)

(assert (=> b!124792 (= e!81564 e!81565)))

(declare-fun res!60452 () Bool)

(assert (=> b!124792 (= res!60452 call!13357)))

(assert (=> b!124792 (=> (not res!60452) (not e!81565))))

(declare-fun b!124793 () Bool)

(declare-fun res!60449 () Bool)

(assert (=> b!124793 (=> (not res!60449) (not e!81557))))

(assert (=> b!124793 (= res!60449 e!81559)))

(declare-fun res!60445 () Bool)

(assert (=> b!124793 (=> res!60445 e!81559)))

(assert (=> b!124793 (= res!60445 (not e!81553))))

(declare-fun res!60450 () Bool)

(assert (=> b!124793 (=> (not res!60450) (not e!81553))))

(assert (=> b!124793 (= res!60450 (bvslt #b00000000000000000000000000000000 (size!2482 (_keys!4493 newMap!16))))))

(declare-fun b!124794 () Bool)

(assert (=> b!124794 (= e!81561 call!13358)))

(declare-fun b!124795 () Bool)

(assert (=> b!124795 (= e!81565 (= (apply!110 lt!64187 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2629 newMap!16)))))

(assert (= (and d!37339 c!22691) b!124789))

(assert (= (and d!37339 (not c!22691)) b!124778))

(assert (= (and b!124778 c!22689) b!124776))

(assert (= (and b!124778 (not c!22689)) b!124787))

(assert (= (and b!124787 c!22690) b!124794))

(assert (= (and b!124787 (not c!22690)) b!124777))

(assert (= (or b!124794 b!124777) bm!13353))

(assert (= (or b!124776 bm!13353) bm!13352))

(assert (= (or b!124776 b!124794) bm!13355))

(assert (= (or b!124789 bm!13352) bm!13350))

(assert (= (or b!124789 bm!13355) bm!13351))

(assert (= (and d!37339 res!60448) b!124791))

(assert (= (and d!37339 c!22688) b!124785))

(assert (= (and d!37339 (not c!22688)) b!124782))

(assert (= (and d!37339 res!60447) b!124793))

(assert (= (and b!124793 res!60450) b!124783))

(assert (= (and b!124793 (not res!60445)) b!124780))

(assert (= (and b!124780 res!60453) b!124775))

(assert (= (and b!124793 res!60449) b!124786))

(assert (= (and b!124786 c!22687) b!124784))

(assert (= (and b!124786 (not c!22687)) b!124781))

(assert (= (and b!124784 res!60446) b!124788))

(assert (= (or b!124784 b!124781) bm!13354))

(assert (= (and b!124786 res!60451) b!124790))

(assert (= (and b!124790 c!22686) b!124792))

(assert (= (and b!124790 (not c!22686)) b!124779))

(assert (= (and b!124792 res!60452) b!124795))

(assert (= (or b!124792 b!124779) bm!13356))

(declare-fun b_lambda!5469 () Bool)

(assert (=> (not b_lambda!5469) (not b!124775)))

(declare-fun t!6029 () Bool)

(declare-fun tb!2297 () Bool)

(assert (=> (and b!124369 (= (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) (defaultEntry!2764 newMap!16)) t!6029) tb!2297))

(declare-fun result!3819 () Bool)

(assert (=> tb!2297 (= result!3819 tp_is_empty!2835)))

(assert (=> b!124775 t!6029))

(declare-fun b_and!7663 () Bool)

(assert (= b_and!7659 (and (=> t!6029 result!3819) b_and!7663)))

(declare-fun t!6031 () Bool)

(declare-fun tb!2299 () Bool)

(assert (=> (and b!124375 (= (defaultEntry!2764 newMap!16) (defaultEntry!2764 newMap!16)) t!6031) tb!2299))

(declare-fun result!3821 () Bool)

(assert (= result!3821 result!3819))

(assert (=> b!124775 t!6031))

(declare-fun b_and!7665 () Bool)

(assert (= b_and!7661 (and (=> t!6031 result!3821) b_and!7665)))

(assert (=> b!124791 m!144619))

(assert (=> b!124791 m!144619))

(assert (=> b!124791 m!144629))

(declare-fun m!144719 () Bool)

(assert (=> b!124775 m!144719))

(declare-fun m!144721 () Bool)

(assert (=> b!124775 m!144721))

(declare-fun m!144723 () Bool)

(assert (=> b!124775 m!144723))

(assert (=> b!124775 m!144619))

(assert (=> b!124775 m!144721))

(assert (=> b!124775 m!144619))

(declare-fun m!144725 () Bool)

(assert (=> b!124775 m!144725))

(assert (=> b!124775 m!144719))

(assert (=> b!124783 m!144619))

(assert (=> b!124783 m!144619))

(assert (=> b!124783 m!144629))

(declare-fun m!144727 () Bool)

(assert (=> b!124785 m!144727))

(declare-fun m!144729 () Bool)

(assert (=> b!124785 m!144729))

(declare-fun m!144731 () Bool)

(assert (=> b!124785 m!144731))

(declare-fun m!144733 () Bool)

(assert (=> b!124785 m!144733))

(assert (=> b!124785 m!144619))

(declare-fun m!144735 () Bool)

(assert (=> b!124785 m!144735))

(declare-fun m!144737 () Bool)

(assert (=> b!124785 m!144737))

(declare-fun m!144739 () Bool)

(assert (=> b!124785 m!144739))

(assert (=> b!124785 m!144739))

(declare-fun m!144741 () Bool)

(assert (=> b!124785 m!144741))

(declare-fun m!144743 () Bool)

(assert (=> b!124785 m!144743))

(declare-fun m!144745 () Bool)

(assert (=> b!124785 m!144745))

(assert (=> b!124785 m!144733))

(declare-fun m!144747 () Bool)

(assert (=> b!124785 m!144747))

(declare-fun m!144749 () Bool)

(assert (=> b!124785 m!144749))

(declare-fun m!144751 () Bool)

(assert (=> b!124785 m!144751))

(declare-fun m!144753 () Bool)

(assert (=> b!124785 m!144753))

(assert (=> b!124785 m!144743))

(declare-fun m!144755 () Bool)

(assert (=> b!124785 m!144755))

(assert (=> b!124785 m!144729))

(declare-fun m!144757 () Bool)

(assert (=> b!124785 m!144757))

(assert (=> b!124780 m!144619))

(assert (=> b!124780 m!144619))

(declare-fun m!144759 () Bool)

(assert (=> b!124780 m!144759))

(declare-fun m!144761 () Bool)

(assert (=> b!124789 m!144761))

(declare-fun m!144763 () Bool)

(assert (=> b!124795 m!144763))

(declare-fun m!144765 () Bool)

(assert (=> bm!13354 m!144765))

(assert (=> bm!13350 m!144755))

(declare-fun m!144767 () Bool)

(assert (=> bm!13356 m!144767))

(declare-fun m!144769 () Bool)

(assert (=> b!124788 m!144769))

(declare-fun m!144771 () Bool)

(assert (=> bm!13351 m!144771))

(assert (=> d!37339 m!144633))

(assert (=> b!124628 d!37339))

(assert (=> b!124519 d!37321))

(assert (=> b!124519 d!37323))

(declare-fun d!37341 () Bool)

(declare-fun get!1439 (Option!172) V!3427)

(assert (=> d!37341 (= (apply!110 lt!64012 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1439 (getValueByKey!166 (toList!854 lt!64012) (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(declare-fun bs!5150 () Bool)

(assert (= bs!5150 d!37341))

(assert (=> bs!5150 m!144493))

(declare-fun m!144773 () Bool)

(assert (=> bs!5150 m!144773))

(assert (=> bs!5150 m!144773))

(declare-fun m!144775 () Bool)

(assert (=> bs!5150 m!144775))

(assert (=> b!124490 d!37341))

(declare-fun d!37343 () Bool)

(declare-fun c!22692 () Bool)

(assert (=> d!37343 (= c!22692 ((_ is ValueCellFull!1074) (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun e!81566 () V!3427)

(assert (=> d!37343 (= (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) e!81566)))

(declare-fun b!124796 () Bool)

(assert (=> b!124796 (= e!81566 (get!1437 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!124797 () Bool)

(assert (=> b!124797 (= e!81566 (get!1438 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!37343 c!22692) b!124796))

(assert (= (and d!37343 (not c!22692)) b!124797))

(assert (=> b!124796 m!144497))

(assert (=> b!124796 m!144423))

(declare-fun m!144777 () Bool)

(assert (=> b!124796 m!144777))

(assert (=> b!124797 m!144497))

(assert (=> b!124797 m!144423))

(declare-fun m!144779 () Bool)

(assert (=> b!124797 m!144779))

(assert (=> b!124490 d!37343))

(declare-fun b!124808 () Bool)

(declare-fun e!81577 () Bool)

(declare-fun e!81575 () Bool)

(assert (=> b!124808 (= e!81577 e!81575)))

(declare-fun c!22695 () Bool)

(assert (=> b!124808 (= c!22695 (validKeyInArray!0 (select (arr!2219 (_keys!4493 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!124809 () Bool)

(declare-fun e!81578 () Bool)

(declare-fun contains!875 (List!1696 (_ BitVec 64)) Bool)

(assert (=> b!124809 (= e!81578 (contains!875 Nil!1693 (select (arr!2219 (_keys!4493 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!124810 () Bool)

(declare-fun call!13362 () Bool)

(assert (=> b!124810 (= e!81575 call!13362)))

(declare-fun d!37345 () Bool)

(declare-fun res!60460 () Bool)

(declare-fun e!81576 () Bool)

(assert (=> d!37345 (=> res!60460 e!81576)))

(assert (=> d!37345 (= res!60460 (bvsge #b00000000000000000000000000000000 (size!2482 (_keys!4493 newMap!16))))))

(assert (=> d!37345 (= (arrayNoDuplicates!0 (_keys!4493 newMap!16) #b00000000000000000000000000000000 Nil!1693) e!81576)))

(declare-fun bm!13359 () Bool)

(assert (=> bm!13359 (= call!13362 (arrayNoDuplicates!0 (_keys!4493 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!22695 (Cons!1692 (select (arr!2219 (_keys!4493 newMap!16)) #b00000000000000000000000000000000) Nil!1693) Nil!1693)))))

(declare-fun b!124811 () Bool)

(assert (=> b!124811 (= e!81576 e!81577)))

(declare-fun res!60462 () Bool)

(assert (=> b!124811 (=> (not res!60462) (not e!81577))))

(assert (=> b!124811 (= res!60462 (not e!81578))))

(declare-fun res!60461 () Bool)

(assert (=> b!124811 (=> (not res!60461) (not e!81578))))

(assert (=> b!124811 (= res!60461 (validKeyInArray!0 (select (arr!2219 (_keys!4493 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!124812 () Bool)

(assert (=> b!124812 (= e!81575 call!13362)))

(assert (= (and d!37345 (not res!60460)) b!124811))

(assert (= (and b!124811 res!60461) b!124809))

(assert (= (and b!124811 res!60462) b!124808))

(assert (= (and b!124808 c!22695) b!124810))

(assert (= (and b!124808 (not c!22695)) b!124812))

(assert (= (or b!124810 b!124812) bm!13359))

(assert (=> b!124808 m!144619))

(assert (=> b!124808 m!144619))

(assert (=> b!124808 m!144629))

(assert (=> b!124809 m!144619))

(assert (=> b!124809 m!144619))

(declare-fun m!144781 () Bool)

(assert (=> b!124809 m!144781))

(assert (=> bm!13359 m!144619))

(declare-fun m!144783 () Bool)

(assert (=> bm!13359 m!144783))

(assert (=> b!124811 m!144619))

(assert (=> b!124811 m!144619))

(assert (=> b!124811 m!144629))

(assert (=> b!124447 d!37345))

(assert (=> b!124644 d!37339))

(declare-fun d!37347 () Bool)

(declare-fun e!81579 () Bool)

(assert (=> d!37347 e!81579))

(declare-fun res!60463 () Bool)

(assert (=> d!37347 (=> res!60463 e!81579)))

(declare-fun lt!64196 () Bool)

(assert (=> d!37347 (= res!60463 (not lt!64196))))

(declare-fun lt!64197 () Bool)

(assert (=> d!37347 (= lt!64196 lt!64197)))

(declare-fun lt!64194 () Unit!3867)

(declare-fun e!81580 () Unit!3867)

(assert (=> d!37347 (= lt!64194 e!81580)))

(declare-fun c!22696 () Bool)

(assert (=> d!37347 (= c!22696 lt!64197)))

(assert (=> d!37347 (= lt!64197 (containsKey!170 (toList!854 lt!64012) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!37347 (= (contains!873 lt!64012 #b1000000000000000000000000000000000000000000000000000000000000000) lt!64196)))

(declare-fun b!124813 () Bool)

(declare-fun lt!64195 () Unit!3867)

(assert (=> b!124813 (= e!81580 lt!64195)))

(assert (=> b!124813 (= lt!64195 (lemmaContainsKeyImpliesGetValueByKeyDefined!118 (toList!854 lt!64012) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!124813 (isDefined!119 (getValueByKey!166 (toList!854 lt!64012) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!124814 () Bool)

(declare-fun Unit!3876 () Unit!3867)

(assert (=> b!124814 (= e!81580 Unit!3876)))

(declare-fun b!124815 () Bool)

(assert (=> b!124815 (= e!81579 (isDefined!119 (getValueByKey!166 (toList!854 lt!64012) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!37347 c!22696) b!124813))

(assert (= (and d!37347 (not c!22696)) b!124814))

(assert (= (and d!37347 (not res!60463)) b!124815))

(declare-fun m!144785 () Bool)

(assert (=> d!37347 m!144785))

(declare-fun m!144787 () Bool)

(assert (=> b!124813 m!144787))

(declare-fun m!144789 () Bool)

(assert (=> b!124813 m!144789))

(assert (=> b!124813 m!144789))

(declare-fun m!144791 () Bool)

(assert (=> b!124813 m!144791))

(assert (=> b!124815 m!144789))

(assert (=> b!124815 m!144789))

(assert (=> b!124815 m!144791))

(assert (=> bm!13265 d!37347))

(declare-fun b!124840 () Bool)

(declare-fun res!60472 () Bool)

(declare-fun e!81596 () Bool)

(assert (=> b!124840 (=> (not res!60472) (not e!81596))))

(declare-fun lt!64216 () ListLongMap!1677)

(assert (=> b!124840 (= res!60472 (not (contains!873 lt!64216 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bm!13362 () Bool)

(declare-fun call!13365 () ListLongMap!1677)

(assert (=> bm!13362 (= call!13365 (getCurrentListMapNoExtraKeys!135 (_keys!4493 (v!3108 (underlying!436 thiss!992))) (_values!2747 (v!3108 (underlying!436 thiss!992))) (mask!7010 (v!3108 (underlying!436 thiss!992))) (extraKeys!2549 (v!3108 (underlying!436 thiss!992))) (zeroValue!2629 (v!3108 (underlying!436 thiss!992))) (minValue!2629 (v!3108 (underlying!436 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!2764 (v!3108 (underlying!436 thiss!992)))))))

(declare-fun b!124841 () Bool)

(declare-fun e!81595 () Bool)

(declare-fun e!81599 () Bool)

(assert (=> b!124841 (= e!81595 e!81599)))

(assert (=> b!124841 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2482 (_keys!4493 (v!3108 (underlying!436 thiss!992))))))))

(declare-fun res!60474 () Bool)

(assert (=> b!124841 (= res!60474 (contains!873 lt!64216 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!124841 (=> (not res!60474) (not e!81599))))

(declare-fun b!124842 () Bool)

(assert (=> b!124842 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2482 (_keys!4493 (v!3108 (underlying!436 thiss!992))))))))

(assert (=> b!124842 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2483 (_values!2747 (v!3108 (underlying!436 thiss!992))))))))

(assert (=> b!124842 (= e!81599 (= (apply!110 lt!64216 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!37349 () Bool)

(assert (=> d!37349 e!81596))

(declare-fun res!60475 () Bool)

(assert (=> d!37349 (=> (not res!60475) (not e!81596))))

(assert (=> d!37349 (= res!60475 (not (contains!873 lt!64216 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!81597 () ListLongMap!1677)

(assert (=> d!37349 (= lt!64216 e!81597)))

(declare-fun c!22705 () Bool)

(assert (=> d!37349 (= c!22705 (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2482 (_keys!4493 (v!3108 (underlying!436 thiss!992))))))))

(assert (=> d!37349 (validMask!0 (mask!7010 (v!3108 (underlying!436 thiss!992))))))

(assert (=> d!37349 (= (getCurrentListMapNoExtraKeys!135 (_keys!4493 (v!3108 (underlying!436 thiss!992))) (_values!2747 (v!3108 (underlying!436 thiss!992))) (mask!7010 (v!3108 (underlying!436 thiss!992))) (extraKeys!2549 (v!3108 (underlying!436 thiss!992))) (zeroValue!2629 (v!3108 (underlying!436 thiss!992))) (minValue!2629 (v!3108 (underlying!436 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2764 (v!3108 (underlying!436 thiss!992)))) lt!64216)))

(declare-fun b!124843 () Bool)

(declare-fun e!81600 () Bool)

(assert (=> b!124843 (= e!81600 (validKeyInArray!0 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!124843 (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000)))

(declare-fun b!124844 () Bool)

(assert (=> b!124844 (= e!81596 e!81595)))

(declare-fun c!22708 () Bool)

(assert (=> b!124844 (= c!22708 e!81600)))

(declare-fun res!60473 () Bool)

(assert (=> b!124844 (=> (not res!60473) (not e!81600))))

(assert (=> b!124844 (= res!60473 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2482 (_keys!4493 (v!3108 (underlying!436 thiss!992))))))))

(declare-fun b!124845 () Bool)

(declare-fun e!81598 () Bool)

(declare-fun isEmpty!394 (ListLongMap!1677) Bool)

(assert (=> b!124845 (= e!81598 (isEmpty!394 lt!64216))))

(declare-fun b!124846 () Bool)

(declare-fun e!81601 () ListLongMap!1677)

(assert (=> b!124846 (= e!81601 call!13365)))

(declare-fun b!124847 () Bool)

(assert (=> b!124847 (= e!81597 (ListLongMap!1678 Nil!1692))))

(declare-fun b!124848 () Bool)

(declare-fun lt!64218 () Unit!3867)

(declare-fun lt!64212 () Unit!3867)

(assert (=> b!124848 (= lt!64218 lt!64212)))

(declare-fun lt!64214 () (_ BitVec 64))

(declare-fun lt!64217 () V!3427)

(declare-fun lt!64215 () (_ BitVec 64))

(declare-fun lt!64213 () ListLongMap!1677)

(assert (=> b!124848 (not (contains!873 (+!169 lt!64213 (tuple2!2569 lt!64214 lt!64217)) lt!64215))))

(declare-fun addStillNotContains!55 (ListLongMap!1677 (_ BitVec 64) V!3427 (_ BitVec 64)) Unit!3867)

(assert (=> b!124848 (= lt!64212 (addStillNotContains!55 lt!64213 lt!64214 lt!64217 lt!64215))))

(assert (=> b!124848 (= lt!64215 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!124848 (= lt!64217 (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!124848 (= lt!64214 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(assert (=> b!124848 (= lt!64213 call!13365)))

(assert (=> b!124848 (= e!81601 (+!169 call!13365 (tuple2!2569 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!124849 () Bool)

(assert (=> b!124849 (= e!81597 e!81601)))

(declare-fun c!22706 () Bool)

(assert (=> b!124849 (= c!22706 (validKeyInArray!0 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!124850 () Bool)

(assert (=> b!124850 (= e!81598 (= lt!64216 (getCurrentListMapNoExtraKeys!135 (_keys!4493 (v!3108 (underlying!436 thiss!992))) (_values!2747 (v!3108 (underlying!436 thiss!992))) (mask!7010 (v!3108 (underlying!436 thiss!992))) (extraKeys!2549 (v!3108 (underlying!436 thiss!992))) (zeroValue!2629 (v!3108 (underlying!436 thiss!992))) (minValue!2629 (v!3108 (underlying!436 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))))))))

(declare-fun b!124851 () Bool)

(assert (=> b!124851 (= e!81595 e!81598)))

(declare-fun c!22707 () Bool)

(assert (=> b!124851 (= c!22707 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2482 (_keys!4493 (v!3108 (underlying!436 thiss!992))))))))

(assert (= (and d!37349 c!22705) b!124847))

(assert (= (and d!37349 (not c!22705)) b!124849))

(assert (= (and b!124849 c!22706) b!124848))

(assert (= (and b!124849 (not c!22706)) b!124846))

(assert (= (or b!124848 b!124846) bm!13362))

(assert (= (and d!37349 res!60475) b!124840))

(assert (= (and b!124840 res!60472) b!124844))

(assert (= (and b!124844 res!60473) b!124843))

(assert (= (and b!124844 c!22708) b!124841))

(assert (= (and b!124844 (not c!22708)) b!124851))

(assert (= (and b!124841 res!60474) b!124842))

(assert (= (and b!124851 c!22707) b!124850))

(assert (= (and b!124851 (not c!22707)) b!124845))

(declare-fun b_lambda!5471 () Bool)

(assert (=> (not b_lambda!5471) (not b!124842)))

(assert (=> b!124842 t!6019))

(declare-fun b_and!7667 () Bool)

(assert (= b_and!7663 (and (=> t!6019 result!3805) b_and!7667)))

(assert (=> b!124842 t!6021))

(declare-fun b_and!7669 () Bool)

(assert (= b_and!7665 (and (=> t!6021 result!3809) b_and!7669)))

(declare-fun b_lambda!5473 () Bool)

(assert (=> (not b_lambda!5473) (not b!124848)))

(assert (=> b!124848 t!6019))

(declare-fun b_and!7671 () Bool)

(assert (= b_and!7667 (and (=> t!6019 result!3805) b_and!7671)))

(assert (=> b!124848 t!6021))

(declare-fun b_and!7673 () Bool)

(assert (= b_and!7669 (and (=> t!6021 result!3809) b_and!7673)))

(declare-fun m!144793 () Bool)

(assert (=> bm!13362 m!144793))

(assert (=> b!124843 m!144493))

(assert (=> b!124843 m!144493))

(assert (=> b!124843 m!144495))

(assert (=> b!124841 m!144493))

(assert (=> b!124841 m!144493))

(declare-fun m!144795 () Bool)

(assert (=> b!124841 m!144795))

(declare-fun m!144797 () Bool)

(assert (=> b!124845 m!144797))

(assert (=> b!124842 m!144493))

(declare-fun m!144799 () Bool)

(assert (=> b!124842 m!144799))

(assert (=> b!124842 m!144493))

(assert (=> b!124842 m!144423))

(assert (=> b!124842 m!144497))

(assert (=> b!124842 m!144497))

(assert (=> b!124842 m!144423))

(assert (=> b!124842 m!144499))

(declare-fun m!144801 () Bool)

(assert (=> b!124848 m!144801))

(declare-fun m!144803 () Bool)

(assert (=> b!124848 m!144803))

(assert (=> b!124848 m!144497))

(assert (=> b!124848 m!144497))

(assert (=> b!124848 m!144423))

(assert (=> b!124848 m!144499))

(assert (=> b!124848 m!144493))

(declare-fun m!144805 () Bool)

(assert (=> b!124848 m!144805))

(assert (=> b!124848 m!144423))

(assert (=> b!124848 m!144805))

(declare-fun m!144807 () Bool)

(assert (=> b!124848 m!144807))

(assert (=> b!124849 m!144493))

(assert (=> b!124849 m!144493))

(assert (=> b!124849 m!144495))

(assert (=> b!124850 m!144793))

(declare-fun m!144809 () Bool)

(assert (=> b!124840 m!144809))

(declare-fun m!144811 () Bool)

(assert (=> d!37349 m!144811))

(assert (=> d!37349 m!144413))

(assert (=> bm!13259 d!37349))

(declare-fun lt!64285 () SeekEntryResult!269)

(declare-fun b!124886 () Bool)

(declare-fun e!81622 () Bool)

(assert (=> b!124886 (= e!81622 (= (select (arr!2219 (_keys!4493 newMap!16)) (index!3231 lt!64285)) (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355)))))

(declare-fun lt!64306 () SeekEntryResult!269)

(declare-fun bm!13371 () Bool)

(declare-fun call!13377 () Bool)

(declare-fun c!22718 () Bool)

(declare-fun c!22717 () Bool)

(assert (=> bm!13371 (= call!13377 (inRange!0 (ite c!22717 (index!3231 lt!64285) (ite c!22718 (index!3230 lt!64306) (index!3233 lt!64306))) (mask!7010 newMap!16)))))

(declare-fun b!124887 () Bool)

(declare-fun res!60496 () Bool)

(declare-fun e!81623 () Bool)

(assert (=> b!124887 (=> (not res!60496) (not e!81623))))

(assert (=> b!124887 (= res!60496 (= (select (arr!2219 (_keys!4493 newMap!16)) (index!3230 lt!64306)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!37351 () Bool)

(declare-fun e!81621 () Bool)

(assert (=> d!37351 e!81621))

(declare-fun res!60501 () Bool)

(assert (=> d!37351 (=> (not res!60501) (not e!81621))))

(declare-fun lt!64299 () tuple2!2570)

(assert (=> d!37351 (= res!60501 (_1!1296 lt!64299))))

(assert (=> d!37351 (= lt!64299 (tuple2!2571 true (LongMapFixedSize!1057 (defaultEntry!2764 newMap!16) (mask!7010 newMap!16) (extraKeys!2549 newMap!16) (zeroValue!2629 newMap!16) (minValue!2629 newMap!16) (bvadd (_size!577 newMap!16) #b00000000000000000000000000000001) (array!4686 (store (arr!2219 (_keys!4493 newMap!16)) (ite c!22637 (index!3233 lt!64093) (index!3230 lt!64093)) (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355)) (size!2482 (_keys!4493 newMap!16))) (array!4688 (store (arr!2220 (_values!2747 newMap!16)) (ite c!22637 (index!3233 lt!64093) (index!3230 lt!64093)) (ValueCellFull!1074 (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2483 (_values!2747 newMap!16))) (_vacant!577 newMap!16))))))

(declare-fun lt!64293 () Unit!3867)

(declare-fun lt!64296 () Unit!3867)

(assert (=> d!37351 (= lt!64293 lt!64296)))

(declare-fun lt!64279 () array!4687)

(declare-fun lt!64304 () array!4685)

(assert (=> d!37351 (contains!873 (getCurrentListMap!535 lt!64304 lt!64279 (mask!7010 newMap!16) (extraKeys!2549 newMap!16) (zeroValue!2629 newMap!16) (minValue!2629 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2764 newMap!16)) (select (store (arr!2219 (_keys!4493 newMap!16)) (ite c!22637 (index!3233 lt!64093) (index!3230 lt!64093)) (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355)) (ite c!22637 (index!3233 lt!64093) (index!3230 lt!64093))))))

(assert (=> d!37351 (= lt!64296 (lemmaValidKeyInArrayIsInListMap!116 lt!64304 lt!64279 (mask!7010 newMap!16) (extraKeys!2549 newMap!16) (zeroValue!2629 newMap!16) (minValue!2629 newMap!16) (ite c!22637 (index!3233 lt!64093) (index!3230 lt!64093)) (defaultEntry!2764 newMap!16)))))

(assert (=> d!37351 (= lt!64279 (array!4688 (store (arr!2220 (_values!2747 newMap!16)) (ite c!22637 (index!3233 lt!64093) (index!3230 lt!64093)) (ValueCellFull!1074 (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2483 (_values!2747 newMap!16))))))

(assert (=> d!37351 (= lt!64304 (array!4686 (store (arr!2219 (_keys!4493 newMap!16)) (ite c!22637 (index!3233 lt!64093) (index!3230 lt!64093)) (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355)) (size!2482 (_keys!4493 newMap!16))))))

(declare-fun lt!64298 () Unit!3867)

(declare-fun lt!64300 () Unit!3867)

(assert (=> d!37351 (= lt!64298 lt!64300)))

(declare-fun lt!64280 () array!4685)

(assert (=> d!37351 (= (arrayCountValidKeys!0 lt!64280 (ite c!22637 (index!3233 lt!64093) (index!3230 lt!64093)) (bvadd (ite c!22637 (index!3233 lt!64093) (index!3230 lt!64093)) #b00000000000000000000000000000001)) #b00000000000000000000000000000001)))

(declare-fun lemmaValidKeyAtIImpliesCountKeysIsOne!0 (array!4685 (_ BitVec 32)) Unit!3867)

(assert (=> d!37351 (= lt!64300 (lemmaValidKeyAtIImpliesCountKeysIsOne!0 lt!64280 (ite c!22637 (index!3233 lt!64093) (index!3230 lt!64093))))))

(assert (=> d!37351 (= lt!64280 (array!4686 (store (arr!2219 (_keys!4493 newMap!16)) (ite c!22637 (index!3233 lt!64093) (index!3230 lt!64093)) (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355)) (size!2482 (_keys!4493 newMap!16))))))

(declare-fun lt!64308 () Unit!3867)

(declare-fun lt!64307 () Unit!3867)

(assert (=> d!37351 (= lt!64308 lt!64307)))

(declare-fun lt!64294 () array!4685)

(assert (=> d!37351 (arrayContainsKey!0 lt!64294 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355) #b00000000000000000000000000000000)))

(assert (=> d!37351 (= lt!64307 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!64294 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355) (ite c!22637 (index!3233 lt!64093) (index!3230 lt!64093))))))

(assert (=> d!37351 (= lt!64294 (array!4686 (store (arr!2219 (_keys!4493 newMap!16)) (ite c!22637 (index!3233 lt!64093) (index!3230 lt!64093)) (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355)) (size!2482 (_keys!4493 newMap!16))))))

(declare-fun lt!64289 () Unit!3867)

(declare-fun lt!64301 () Unit!3867)

(assert (=> d!37351 (= lt!64289 lt!64301)))

(assert (=> d!37351 (= (+!169 (getCurrentListMap!535 (_keys!4493 newMap!16) (_values!2747 newMap!16) (mask!7010 newMap!16) (extraKeys!2549 newMap!16) (zeroValue!2629 newMap!16) (minValue!2629 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2764 newMap!16)) (tuple2!2569 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (getCurrentListMap!535 (array!4686 (store (arr!2219 (_keys!4493 newMap!16)) (ite c!22637 (index!3233 lt!64093) (index!3230 lt!64093)) (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355)) (size!2482 (_keys!4493 newMap!16))) (array!4688 (store (arr!2220 (_values!2747 newMap!16)) (ite c!22637 (index!3233 lt!64093) (index!3230 lt!64093)) (ValueCellFull!1074 (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2483 (_values!2747 newMap!16))) (mask!7010 newMap!16) (extraKeys!2549 newMap!16) (zeroValue!2629 newMap!16) (minValue!2629 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2764 newMap!16)))))

(declare-fun lemmaAddValidKeyToArrayThenAddPairToListMap!36 (array!4685 array!4687 (_ BitVec 32) (_ BitVec 32) V!3427 V!3427 (_ BitVec 32) (_ BitVec 64) V!3427 Int) Unit!3867)

(assert (=> d!37351 (= lt!64301 (lemmaAddValidKeyToArrayThenAddPairToListMap!36 (_keys!4493 newMap!16) (_values!2747 newMap!16) (mask!7010 newMap!16) (extraKeys!2549 newMap!16) (zeroValue!2629 newMap!16) (minValue!2629 newMap!16) (ite c!22637 (index!3233 lt!64093) (index!3230 lt!64093)) (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2764 newMap!16)))))

(declare-fun lt!64288 () Unit!3867)

(declare-fun lt!64302 () Unit!3867)

(assert (=> d!37351 (= lt!64288 lt!64302)))

(assert (=> d!37351 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!4686 (store (arr!2219 (_keys!4493 newMap!16)) (ite c!22637 (index!3233 lt!64093) (index!3230 lt!64093)) (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355)) (size!2482 (_keys!4493 newMap!16))) (mask!7010 newMap!16))))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!4685 (_ BitVec 32) (_ BitVec 32)) Unit!3867)

(assert (=> d!37351 (= lt!64302 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355) (_keys!4493 newMap!16) (ite c!22637 (index!3233 lt!64093) (index!3230 lt!64093)) (mask!7010 newMap!16)))))

(declare-fun lt!64297 () Unit!3867)

(declare-fun lt!64281 () Unit!3867)

(assert (=> d!37351 (= lt!64297 lt!64281)))

(assert (=> d!37351 (= (arrayCountValidKeys!0 (array!4686 (store (arr!2219 (_keys!4493 newMap!16)) (ite c!22637 (index!3233 lt!64093) (index!3230 lt!64093)) (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355)) (size!2482 (_keys!4493 newMap!16))) #b00000000000000000000000000000000 (size!2482 (_keys!4493 newMap!16))) (bvadd (arrayCountValidKeys!0 (_keys!4493 newMap!16) #b00000000000000000000000000000000 (size!2482 (_keys!4493 newMap!16))) #b00000000000000000000000000000001))))

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!4685 (_ BitVec 32) (_ BitVec 64)) Unit!3867)

(assert (=> d!37351 (= lt!64281 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!4493 newMap!16) (ite c!22637 (index!3233 lt!64093) (index!3230 lt!64093)) (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355)))))

(declare-fun lt!64303 () Unit!3867)

(declare-fun lt!64286 () Unit!3867)

(assert (=> d!37351 (= lt!64303 lt!64286)))

(declare-fun lt!64295 () List!1696)

(declare-fun lt!64282 () (_ BitVec 32))

(assert (=> d!37351 (arrayNoDuplicates!0 (array!4686 (store (arr!2219 (_keys!4493 newMap!16)) (ite c!22637 (index!3233 lt!64093) (index!3230 lt!64093)) (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355)) (size!2482 (_keys!4493 newMap!16))) lt!64282 lt!64295)))

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!4685 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!1696) Unit!3867)

(assert (=> d!37351 (= lt!64286 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!4493 newMap!16) (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355) (ite c!22637 (index!3233 lt!64093) (index!3230 lt!64093)) lt!64282 lt!64295))))

(assert (=> d!37351 (= lt!64295 Nil!1693)))

(assert (=> d!37351 (= lt!64282 #b00000000000000000000000000000000)))

(declare-fun lt!64305 () Unit!3867)

(declare-fun e!81619 () Unit!3867)

(assert (=> d!37351 (= lt!64305 e!81619)))

(declare-fun c!22720 () Bool)

(assert (=> d!37351 (= c!22720 (arrayContainsKey!0 (_keys!4493 newMap!16) (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun lt!64291 () Unit!3867)

(declare-fun e!81620 () Unit!3867)

(assert (=> d!37351 (= lt!64291 e!81620)))

(assert (=> d!37351 (= c!22717 (contains!873 (getCurrentListMap!535 (_keys!4493 newMap!16) (_values!2747 newMap!16) (mask!7010 newMap!16) (extraKeys!2549 newMap!16) (zeroValue!2629 newMap!16) (minValue!2629 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2764 newMap!16)) (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355)))))

(assert (=> d!37351 (valid!502 newMap!16)))

(assert (=> d!37351 (= (updateHelperNewKey!55 newMap!16 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (ite c!22637 (index!3233 lt!64093) (index!3230 lt!64093))) lt!64299)))

(declare-fun b!124888 () Bool)

(declare-fun res!60494 () Bool)

(assert (=> b!124888 (=> (not res!60494) (not e!81621))))

(assert (=> b!124888 (= res!60494 (contains!873 (map!1384 (_2!1296 lt!64299)) (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355)))))

(declare-fun b!124889 () Bool)

(declare-fun call!13376 () Bool)

(assert (=> b!124889 (= e!81623 (not call!13376))))

(declare-fun bm!13372 () Bool)

(declare-fun call!13375 () SeekEntryResult!269)

(assert (=> bm!13372 (= call!13375 (seekEntryOrOpen!0 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355) (_keys!4493 newMap!16) (mask!7010 newMap!16)))))

(declare-fun b!124890 () Bool)

(declare-fun Unit!3877 () Unit!3867)

(assert (=> b!124890 (= e!81620 Unit!3877)))

(declare-fun lt!64292 () Unit!3867)

(assert (=> b!124890 (= lt!64292 (lemmaInListMapThenSeekEntryOrOpenFindsIt!55 (_keys!4493 newMap!16) (_values!2747 newMap!16) (mask!7010 newMap!16) (extraKeys!2549 newMap!16) (zeroValue!2629 newMap!16) (minValue!2629 newMap!16) (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355) (defaultEntry!2764 newMap!16)))))

(assert (=> b!124890 (= lt!64285 call!13375)))

(declare-fun res!60502 () Bool)

(assert (=> b!124890 (= res!60502 ((_ is Found!269) lt!64285))))

(assert (=> b!124890 (=> (not res!60502) (not e!81622))))

(assert (=> b!124890 e!81622))

(declare-fun lt!64290 () Unit!3867)

(assert (=> b!124890 (= lt!64290 lt!64292)))

(assert (=> b!124890 false))

(declare-fun b!124891 () Bool)

(assert (=> b!124891 (= e!81621 (= (map!1384 (_2!1296 lt!64299)) (+!169 (map!1384 newMap!16) (tuple2!2569 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun bm!13373 () Bool)

(assert (=> bm!13373 (= call!13376 (arrayContainsKey!0 (_keys!4493 newMap!16) (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun b!124892 () Bool)

(declare-fun res!60500 () Bool)

(assert (=> b!124892 (= res!60500 (= (select (arr!2219 (_keys!4493 newMap!16)) (index!3233 lt!64306)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!81624 () Bool)

(assert (=> b!124892 (=> (not res!60500) (not e!81624))))

(declare-fun b!124893 () Bool)

(declare-fun Unit!3878 () Unit!3867)

(assert (=> b!124893 (= e!81619 Unit!3878)))

(declare-fun b!124894 () Bool)

(declare-fun Unit!3879 () Unit!3867)

(assert (=> b!124894 (= e!81619 Unit!3879)))

(declare-fun lt!64283 () Unit!3867)

(declare-fun lemmaArrayContainsKeyThenInListMap!36 (array!4685 array!4687 (_ BitVec 32) (_ BitVec 32) V!3427 V!3427 (_ BitVec 64) (_ BitVec 32) Int) Unit!3867)

(assert (=> b!124894 (= lt!64283 (lemmaArrayContainsKeyThenInListMap!36 (_keys!4493 newMap!16) (_values!2747 newMap!16) (mask!7010 newMap!16) (extraKeys!2549 newMap!16) (zeroValue!2629 newMap!16) (minValue!2629 newMap!16) (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355) #b00000000000000000000000000000000 (defaultEntry!2764 newMap!16)))))

(assert (=> b!124894 (contains!873 (getCurrentListMap!535 (_keys!4493 newMap!16) (_values!2747 newMap!16) (mask!7010 newMap!16) (extraKeys!2549 newMap!16) (zeroValue!2629 newMap!16) (minValue!2629 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2764 newMap!16)) (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355))))

(declare-fun lt!64284 () Unit!3867)

(assert (=> b!124894 (= lt!64284 lt!64283)))

(assert (=> b!124894 false))

(declare-fun b!124895 () Bool)

(assert (=> b!124895 (= e!81624 (not call!13376))))

(declare-fun b!124896 () Bool)

(declare-fun lt!64287 () Unit!3867)

(assert (=> b!124896 (= e!81620 lt!64287)))

(assert (=> b!124896 (= lt!64287 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!55 (_keys!4493 newMap!16) (_values!2747 newMap!16) (mask!7010 newMap!16) (extraKeys!2549 newMap!16) (zeroValue!2629 newMap!16) (minValue!2629 newMap!16) (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355) (defaultEntry!2764 newMap!16)))))

(assert (=> b!124896 (= lt!64306 call!13375)))

(assert (=> b!124896 (= c!22718 ((_ is MissingZero!269) lt!64306))))

(declare-fun e!81618 () Bool)

(assert (=> b!124896 e!81618))

(declare-fun b!124897 () Bool)

(declare-fun res!60495 () Bool)

(assert (=> b!124897 (=> (not res!60495) (not e!81623))))

(declare-fun call!13374 () Bool)

(assert (=> b!124897 (= res!60495 call!13374)))

(assert (=> b!124897 (= e!81618 e!81623)))

(declare-fun b!124898 () Bool)

(declare-fun c!22719 () Bool)

(assert (=> b!124898 (= c!22719 ((_ is MissingVacant!269) lt!64306))))

(declare-fun e!81625 () Bool)

(assert (=> b!124898 (= e!81618 e!81625)))

(declare-fun bm!13374 () Bool)

(assert (=> bm!13374 (= call!13374 call!13377)))

(declare-fun b!124899 () Bool)

(assert (=> b!124899 (= e!81625 e!81624)))

(declare-fun res!60499 () Bool)

(assert (=> b!124899 (= res!60499 call!13374)))

(assert (=> b!124899 (=> (not res!60499) (not e!81624))))

(declare-fun b!124900 () Bool)

(declare-fun res!60498 () Bool)

(assert (=> b!124900 (=> (not res!60498) (not e!81621))))

(assert (=> b!124900 (= res!60498 (valid!502 (_2!1296 lt!64299)))))

(declare-fun b!124901 () Bool)

(declare-fun res!60497 () Bool)

(assert (=> b!124901 (= res!60497 call!13377)))

(assert (=> b!124901 (=> (not res!60497) (not e!81622))))

(declare-fun b!124902 () Bool)

(assert (=> b!124902 (= e!81625 ((_ is Undefined!269) lt!64306))))

(assert (= (and d!37351 c!22717) b!124890))

(assert (= (and d!37351 (not c!22717)) b!124896))

(assert (= (and b!124890 res!60502) b!124901))

(assert (= (and b!124901 res!60497) b!124886))

(assert (= (and b!124896 c!22718) b!124897))

(assert (= (and b!124896 (not c!22718)) b!124898))

(assert (= (and b!124897 res!60495) b!124887))

(assert (= (and b!124887 res!60496) b!124889))

(assert (= (and b!124898 c!22719) b!124899))

(assert (= (and b!124898 (not c!22719)) b!124902))

(assert (= (and b!124899 res!60499) b!124892))

(assert (= (and b!124892 res!60500) b!124895))

(assert (= (or b!124897 b!124899) bm!13374))

(assert (= (or b!124889 b!124895) bm!13373))

(assert (= (or b!124901 bm!13374) bm!13371))

(assert (= (or b!124890 b!124896) bm!13372))

(assert (= (and d!37351 c!22720) b!124894))

(assert (= (and d!37351 (not c!22720)) b!124893))

(assert (= (and d!37351 res!60501) b!124900))

(assert (= (and b!124900 res!60498) b!124888))

(assert (= (and b!124888 res!60494) b!124891))

(declare-fun m!144813 () Bool)

(assert (=> bm!13371 m!144813))

(declare-fun m!144815 () Bool)

(assert (=> b!124891 m!144815))

(assert (=> b!124891 m!144417))

(assert (=> b!124891 m!144417))

(declare-fun m!144817 () Bool)

(assert (=> b!124891 m!144817))

(assert (=> b!124896 m!144415))

(assert (=> b!124896 m!144561))

(declare-fun m!144819 () Bool)

(assert (=> b!124900 m!144819))

(declare-fun m!144821 () Bool)

(assert (=> b!124887 m!144821))

(assert (=> b!124888 m!144815))

(assert (=> b!124888 m!144815))

(assert (=> b!124888 m!144415))

(declare-fun m!144823 () Bool)

(assert (=> b!124888 m!144823))

(declare-fun m!144825 () Bool)

(assert (=> d!37351 m!144825))

(declare-fun m!144827 () Bool)

(assert (=> d!37351 m!144827))

(assert (=> d!37351 m!144415))

(assert (=> d!37351 m!144425))

(declare-fun m!144829 () Bool)

(assert (=> d!37351 m!144829))

(declare-fun m!144831 () Bool)

(assert (=> d!37351 m!144831))

(declare-fun m!144833 () Bool)

(assert (=> d!37351 m!144833))

(assert (=> d!37351 m!144491))

(declare-fun m!144835 () Bool)

(assert (=> d!37351 m!144835))

(assert (=> d!37351 m!144415))

(declare-fun m!144837 () Bool)

(assert (=> d!37351 m!144837))

(declare-fun m!144839 () Bool)

(assert (=> d!37351 m!144839))

(assert (=> d!37351 m!144415))

(assert (=> d!37351 m!144579))

(declare-fun m!144841 () Bool)

(assert (=> d!37351 m!144841))

(assert (=> d!37351 m!144415))

(declare-fun m!144843 () Bool)

(assert (=> d!37351 m!144843))

(declare-fun m!144845 () Bool)

(assert (=> d!37351 m!144845))

(assert (=> d!37351 m!144485))

(declare-fun m!144847 () Bool)

(assert (=> d!37351 m!144847))

(assert (=> d!37351 m!144835))

(assert (=> d!37351 m!144839))

(declare-fun m!144849 () Bool)

(assert (=> d!37351 m!144849))

(assert (=> d!37351 m!144491))

(assert (=> d!37351 m!144415))

(assert (=> d!37351 m!144585))

(declare-fun m!144851 () Bool)

(assert (=> d!37351 m!144851))

(assert (=> d!37351 m!144415))

(declare-fun m!144853 () Bool)

(assert (=> d!37351 m!144853))

(assert (=> d!37351 m!144415))

(declare-fun m!144855 () Bool)

(assert (=> d!37351 m!144855))

(assert (=> d!37351 m!144415))

(declare-fun m!144857 () Bool)

(assert (=> d!37351 m!144857))

(assert (=> d!37351 m!144443))

(assert (=> d!37351 m!144491))

(assert (=> d!37351 m!144707))

(declare-fun m!144859 () Bool)

(assert (=> d!37351 m!144859))

(declare-fun m!144861 () Bool)

(assert (=> b!124886 m!144861))

(assert (=> b!124890 m!144415))

(assert (=> b!124890 m!144577))

(assert (=> bm!13372 m!144415))

(assert (=> bm!13372 m!144557))

(assert (=> b!124894 m!144415))

(declare-fun m!144863 () Bool)

(assert (=> b!124894 m!144863))

(assert (=> b!124894 m!144491))

(assert (=> b!124894 m!144491))

(assert (=> b!124894 m!144415))

(assert (=> b!124894 m!144585))

(declare-fun m!144865 () Bool)

(assert (=> b!124892 m!144865))

(assert (=> bm!13373 m!144415))

(assert (=> bm!13373 m!144579))

(assert (=> bm!13337 d!37351))

(declare-fun d!37353 () Bool)

(declare-fun e!81626 () Bool)

(assert (=> d!37353 e!81626))

(declare-fun res!60503 () Bool)

(assert (=> d!37353 (=> (not res!60503) (not e!81626))))

(declare-fun lt!64309 () ListLongMap!1677)

(assert (=> d!37353 (= res!60503 (contains!873 lt!64309 (_1!1295 (tuple2!2569 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!64310 () List!1695)

(assert (=> d!37353 (= lt!64309 (ListLongMap!1678 lt!64310))))

(declare-fun lt!64312 () Unit!3867)

(declare-fun lt!64311 () Unit!3867)

(assert (=> d!37353 (= lt!64312 lt!64311)))

(assert (=> d!37353 (= (getValueByKey!166 lt!64310 (_1!1295 (tuple2!2569 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!171 (_2!1295 (tuple2!2569 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!37353 (= lt!64311 (lemmaContainsTupThenGetReturnValue!81 lt!64310 (_1!1295 (tuple2!2569 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1295 (tuple2!2569 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!37353 (= lt!64310 (insertStrictlySorted!84 (toList!854 call!13319) (_1!1295 (tuple2!2569 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1295 (tuple2!2569 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!37353 (= (+!169 call!13319 (tuple2!2569 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!64309)))

(declare-fun b!124903 () Bool)

(declare-fun res!60504 () Bool)

(assert (=> b!124903 (=> (not res!60504) (not e!81626))))

(assert (=> b!124903 (= res!60504 (= (getValueByKey!166 (toList!854 lt!64309) (_1!1295 (tuple2!2569 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!171 (_2!1295 (tuple2!2569 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!124904 () Bool)

(assert (=> b!124904 (= e!81626 (contains!874 (toList!854 lt!64309) (tuple2!2569 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!37353 res!60503) b!124903))

(assert (= (and b!124903 res!60504) b!124904))

(declare-fun m!144867 () Bool)

(assert (=> d!37353 m!144867))

(declare-fun m!144869 () Bool)

(assert (=> d!37353 m!144869))

(declare-fun m!144871 () Bool)

(assert (=> d!37353 m!144871))

(declare-fun m!144873 () Bool)

(assert (=> d!37353 m!144873))

(declare-fun m!144875 () Bool)

(assert (=> b!124903 m!144875))

(declare-fun m!144877 () Bool)

(assert (=> b!124904 m!144877))

(assert (=> b!124645 d!37353))

(declare-fun d!37355 () Bool)

(declare-fun e!81627 () Bool)

(assert (=> d!37355 e!81627))

(declare-fun res!60505 () Bool)

(assert (=> d!37355 (=> (not res!60505) (not e!81627))))

(declare-fun lt!64313 () ListLongMap!1677)

(assert (=> d!37355 (= res!60505 (contains!873 lt!64313 (_1!1295 (ite c!22645 (ite c!22640 (tuple2!2569 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2569 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun lt!64314 () List!1695)

(assert (=> d!37355 (= lt!64313 (ListLongMap!1678 lt!64314))))

(declare-fun lt!64316 () Unit!3867)

(declare-fun lt!64315 () Unit!3867)

(assert (=> d!37355 (= lt!64316 lt!64315)))

(assert (=> d!37355 (= (getValueByKey!166 lt!64314 (_1!1295 (ite c!22645 (ite c!22640 (tuple2!2569 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2569 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))) (Some!171 (_2!1295 (ite c!22645 (ite c!22640 (tuple2!2569 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2569 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!37355 (= lt!64315 (lemmaContainsTupThenGetReturnValue!81 lt!64314 (_1!1295 (ite c!22645 (ite c!22640 (tuple2!2569 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2569 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (_2!1295 (ite c!22645 (ite c!22640 (tuple2!2569 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2569 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!37355 (= lt!64314 (insertStrictlySorted!84 (toList!854 e!81471) (_1!1295 (ite c!22645 (ite c!22640 (tuple2!2569 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2569 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (_2!1295 (ite c!22645 (ite c!22640 (tuple2!2569 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2569 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!37355 (= (+!169 e!81471 (ite c!22645 (ite c!22640 (tuple2!2569 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2569 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) lt!64313)))

(declare-fun b!124905 () Bool)

(declare-fun res!60506 () Bool)

(assert (=> b!124905 (=> (not res!60506) (not e!81627))))

(assert (=> b!124905 (= res!60506 (= (getValueByKey!166 (toList!854 lt!64313) (_1!1295 (ite c!22645 (ite c!22640 (tuple2!2569 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2569 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))) (Some!171 (_2!1295 (ite c!22645 (ite c!22640 (tuple2!2569 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2569 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(declare-fun b!124906 () Bool)

(assert (=> b!124906 (= e!81627 (contains!874 (toList!854 lt!64313) (ite c!22645 (ite c!22640 (tuple2!2569 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2569 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (= (and d!37355 res!60505) b!124905))

(assert (= (and b!124905 res!60506) b!124906))

(declare-fun m!144879 () Bool)

(assert (=> d!37355 m!144879))

(declare-fun m!144881 () Bool)

(assert (=> d!37355 m!144881))

(declare-fun m!144883 () Bool)

(assert (=> d!37355 m!144883))

(declare-fun m!144885 () Bool)

(assert (=> d!37355 m!144885))

(declare-fun m!144887 () Bool)

(assert (=> b!124905 m!144887))

(declare-fun m!144889 () Bool)

(assert (=> b!124906 m!144889))

(assert (=> bm!13330 d!37355))

(declare-fun d!37357 () Bool)

(assert (=> d!37357 (= (inRange!0 (ite c!22647 (ite c!22638 (index!3231 lt!64095) (ite c!22641 (index!3230 lt!64100) (index!3233 lt!64100))) (ite c!22639 (index!3231 lt!64088) (ite c!22642 (index!3230 lt!64085) (index!3233 lt!64085)))) (mask!7010 newMap!16)) (and (bvsge (ite c!22647 (ite c!22638 (index!3231 lt!64095) (ite c!22641 (index!3230 lt!64100) (index!3233 lt!64100))) (ite c!22639 (index!3231 lt!64088) (ite c!22642 (index!3230 lt!64085) (index!3233 lt!64085)))) #b00000000000000000000000000000000) (bvslt (ite c!22647 (ite c!22638 (index!3231 lt!64095) (ite c!22641 (index!3230 lt!64100) (index!3233 lt!64100))) (ite c!22639 (index!3231 lt!64088) (ite c!22642 (index!3230 lt!64085) (index!3233 lt!64085)))) (bvadd (mask!7010 newMap!16) #b00000000000000000000000000000001))))))

(assert (=> bm!13326 d!37357))

(declare-fun d!37359 () Bool)

(assert (=> d!37359 (= (+!169 (getCurrentListMap!535 (_keys!4493 newMap!16) (_values!2747 newMap!16) (mask!7010 newMap!16) (extraKeys!2549 newMap!16) (zeroValue!2629 newMap!16) (minValue!2629 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2764 newMap!16)) (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (getCurrentListMap!535 (_keys!4493 newMap!16) (_values!2747 newMap!16) (mask!7010 newMap!16) lt!64103 (zeroValue!2629 newMap!16) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) #b00000000000000000000000000000000 (defaultEntry!2764 newMap!16)))))

(declare-fun lt!64319 () Unit!3867)

(declare-fun choose!751 (array!4685 array!4687 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3427 V!3427 V!3427 Int) Unit!3867)

(assert (=> d!37359 (= lt!64319 (choose!751 (_keys!4493 newMap!16) (_values!2747 newMap!16) (mask!7010 newMap!16) (extraKeys!2549 newMap!16) lt!64103 (zeroValue!2629 newMap!16) (minValue!2629 newMap!16) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2764 newMap!16)))))

(assert (=> d!37359 (validMask!0 (mask!7010 newMap!16))))

(assert (=> d!37359 (= (lemmaChangeLongMinValueKeyThenAddPairToListMap!55 (_keys!4493 newMap!16) (_values!2747 newMap!16) (mask!7010 newMap!16) (extraKeys!2549 newMap!16) lt!64103 (zeroValue!2629 newMap!16) (minValue!2629 newMap!16) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2764 newMap!16)) lt!64319)))

(declare-fun bs!5151 () Bool)

(assert (= bs!5151 d!37359))

(assert (=> bs!5151 m!144425))

(declare-fun m!144891 () Bool)

(assert (=> bs!5151 m!144891))

(assert (=> bs!5151 m!144491))

(declare-fun m!144893 () Bool)

(assert (=> bs!5151 m!144893))

(assert (=> bs!5151 m!144633))

(assert (=> bs!5151 m!144491))

(assert (=> bs!5151 m!144425))

(declare-fun m!144895 () Bool)

(assert (=> bs!5151 m!144895))

(assert (=> b!124633 d!37359))

(declare-fun d!37361 () Bool)

(assert (=> d!37361 (= (apply!110 lt!64012 #b1000000000000000000000000000000000000000000000000000000000000000) (get!1439 (getValueByKey!166 (toList!854 lt!64012) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!5152 () Bool)

(assert (= bs!5152 d!37361))

(assert (=> bs!5152 m!144789))

(assert (=> bs!5152 m!144789))

(declare-fun m!144897 () Bool)

(assert (=> bs!5152 m!144897))

(assert (=> b!124510 d!37361))

(declare-fun d!37363 () Bool)

(declare-fun res!60511 () Bool)

(declare-fun e!81632 () Bool)

(assert (=> d!37363 (=> res!60511 e!81632)))

(assert (=> d!37363 (= res!60511 (and ((_ is Cons!1691) (toList!854 lt!63941)) (= (_1!1295 (h!2292 (toList!854 lt!63941))) (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355))))))

(assert (=> d!37363 (= (containsKey!170 (toList!854 lt!63941) (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355)) e!81632)))

(declare-fun b!124911 () Bool)

(declare-fun e!81633 () Bool)

(assert (=> b!124911 (= e!81632 e!81633)))

(declare-fun res!60512 () Bool)

(assert (=> b!124911 (=> (not res!60512) (not e!81633))))

(assert (=> b!124911 (= res!60512 (and (or (not ((_ is Cons!1691) (toList!854 lt!63941))) (bvsle (_1!1295 (h!2292 (toList!854 lt!63941))) (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355))) ((_ is Cons!1691) (toList!854 lt!63941)) (bvslt (_1!1295 (h!2292 (toList!854 lt!63941))) (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355))))))

(declare-fun b!124912 () Bool)

(assert (=> b!124912 (= e!81633 (containsKey!170 (t!6022 (toList!854 lt!63941)) (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355)))))

(assert (= (and d!37363 (not res!60511)) b!124911))

(assert (= (and b!124911 res!60512) b!124912))

(assert (=> b!124912 m!144415))

(declare-fun m!144899 () Bool)

(assert (=> b!124912 m!144899))

(assert (=> d!37301 d!37363))

(assert (=> b!124616 d!37327))

(declare-fun d!37365 () Bool)

(declare-fun res!60513 () Bool)

(declare-fun e!81634 () Bool)

(assert (=> d!37365 (=> (not res!60513) (not e!81634))))

(assert (=> d!37365 (= res!60513 (simpleValid!86 (_2!1296 lt!64096)))))

(assert (=> d!37365 (= (valid!502 (_2!1296 lt!64096)) e!81634)))

(declare-fun b!124913 () Bool)

(declare-fun res!60514 () Bool)

(assert (=> b!124913 (=> (not res!60514) (not e!81634))))

(assert (=> b!124913 (= res!60514 (= (arrayCountValidKeys!0 (_keys!4493 (_2!1296 lt!64096)) #b00000000000000000000000000000000 (size!2482 (_keys!4493 (_2!1296 lt!64096)))) (_size!577 (_2!1296 lt!64096))))))

(declare-fun b!124914 () Bool)

(declare-fun res!60515 () Bool)

(assert (=> b!124914 (=> (not res!60515) (not e!81634))))

(assert (=> b!124914 (= res!60515 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4493 (_2!1296 lt!64096)) (mask!7010 (_2!1296 lt!64096))))))

(declare-fun b!124915 () Bool)

(assert (=> b!124915 (= e!81634 (arrayNoDuplicates!0 (_keys!4493 (_2!1296 lt!64096)) #b00000000000000000000000000000000 Nil!1693))))

(assert (= (and d!37365 res!60513) b!124913))

(assert (= (and b!124913 res!60514) b!124914))

(assert (= (and b!124914 res!60515) b!124915))

(declare-fun m!144901 () Bool)

(assert (=> d!37365 m!144901))

(declare-fun m!144903 () Bool)

(assert (=> b!124913 m!144903))

(declare-fun m!144905 () Bool)

(assert (=> b!124914 m!144905))

(declare-fun m!144907 () Bool)

(assert (=> b!124915 m!144907))

(assert (=> d!37303 d!37365))

(assert (=> d!37303 d!37295))

(assert (=> d!37297 d!37339))

(assert (=> bm!13332 d!37297))

(declare-fun d!37367 () Bool)

(assert (=> d!37367 (= (map!1384 (_2!1296 lt!64096)) (getCurrentListMap!535 (_keys!4493 (_2!1296 lt!64096)) (_values!2747 (_2!1296 lt!64096)) (mask!7010 (_2!1296 lt!64096)) (extraKeys!2549 (_2!1296 lt!64096)) (zeroValue!2629 (_2!1296 lt!64096)) (minValue!2629 (_2!1296 lt!64096)) #b00000000000000000000000000000000 (defaultEntry!2764 (_2!1296 lt!64096))))))

(declare-fun bs!5153 () Bool)

(assert (= bs!5153 d!37367))

(declare-fun m!144909 () Bool)

(assert (=> bs!5153 m!144909))

(assert (=> bm!13317 d!37367))

(declare-fun d!37369 () Bool)

(declare-fun e!81635 () Bool)

(assert (=> d!37369 e!81635))

(declare-fun res!60516 () Bool)

(assert (=> d!37369 (=> res!60516 e!81635)))

(declare-fun lt!64322 () Bool)

(assert (=> d!37369 (= res!60516 (not lt!64322))))

(declare-fun lt!64323 () Bool)

(assert (=> d!37369 (= lt!64322 lt!64323)))

(declare-fun lt!64320 () Unit!3867)

(declare-fun e!81636 () Unit!3867)

(assert (=> d!37369 (= lt!64320 e!81636)))

(declare-fun c!22721 () Bool)

(assert (=> d!37369 (= c!22721 lt!64323)))

(assert (=> d!37369 (= lt!64323 (containsKey!170 (toList!854 lt!64012) (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> d!37369 (= (contains!873 lt!64012 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) lt!64322)))

(declare-fun b!124916 () Bool)

(declare-fun lt!64321 () Unit!3867)

(assert (=> b!124916 (= e!81636 lt!64321)))

(assert (=> b!124916 (= lt!64321 (lemmaContainsKeyImpliesGetValueByKeyDefined!118 (toList!854 lt!64012) (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!124916 (isDefined!119 (getValueByKey!166 (toList!854 lt!64012) (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!124917 () Bool)

(declare-fun Unit!3880 () Unit!3867)

(assert (=> b!124917 (= e!81636 Unit!3880)))

(declare-fun b!124918 () Bool)

(assert (=> b!124918 (= e!81635 (isDefined!119 (getValueByKey!166 (toList!854 lt!64012) (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(assert (= (and d!37369 c!22721) b!124916))

(assert (= (and d!37369 (not c!22721)) b!124917))

(assert (= (and d!37369 (not res!60516)) b!124918))

(assert (=> d!37369 m!144493))

(declare-fun m!144911 () Bool)

(assert (=> d!37369 m!144911))

(assert (=> b!124916 m!144493))

(declare-fun m!144913 () Bool)

(assert (=> b!124916 m!144913))

(assert (=> b!124916 m!144493))

(assert (=> b!124916 m!144773))

(assert (=> b!124916 m!144773))

(declare-fun m!144915 () Bool)

(assert (=> b!124916 m!144915))

(assert (=> b!124918 m!144493))

(assert (=> b!124918 m!144773))

(assert (=> b!124918 m!144773))

(assert (=> b!124918 m!144915))

(assert (=> b!124495 d!37369))

(declare-fun bm!13375 () Bool)

(declare-fun call!13378 () ListLongMap!1677)

(assert (=> bm!13375 (= call!13378 (getCurrentListMapNoExtraKeys!135 (_keys!4493 newMap!16) (ite (or c!22645 c!22647) (_values!2747 newMap!16) (array!4688 (store (arr!2220 (_values!2747 newMap!16)) (index!3231 lt!64093) (ValueCellFull!1074 (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2483 (_values!2747 newMap!16)))) (mask!7010 newMap!16) (ite c!22645 (ite c!22640 (extraKeys!2549 newMap!16) lt!64103) (extraKeys!2549 newMap!16)) (zeroValue!2629 newMap!16) (ite c!22645 (ite c!22640 (minValue!2629 newMap!16) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2629 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2764 newMap!16)))))

(declare-fun call!13379 () ListLongMap!1677)

(declare-fun c!22725 () Bool)

(declare-fun call!13384 () ListLongMap!1677)

(declare-fun c!22727 () Bool)

(declare-fun call!13380 () ListLongMap!1677)

(declare-fun bm!13376 () Bool)

(assert (=> bm!13376 (= call!13384 (+!169 (ite c!22727 call!13378 (ite c!22725 call!13380 call!13379)) (ite (or c!22727 c!22725) (tuple2!2569 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2629 newMap!16)) (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!22645 (ite c!22640 (minValue!2629 newMap!16) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2629 newMap!16))))))))

(declare-fun bm!13377 () Bool)

(assert (=> bm!13377 (= call!13380 call!13378)))

(declare-fun b!124920 () Bool)

(declare-fun e!81640 () ListLongMap!1677)

(declare-fun call!13383 () ListLongMap!1677)

(assert (=> b!124920 (= e!81640 call!13383)))

(declare-fun b!124921 () Bool)

(declare-fun e!81645 () ListLongMap!1677)

(assert (=> b!124921 (= e!81645 call!13379)))

(declare-fun b!124922 () Bool)

(declare-fun e!81647 () ListLongMap!1677)

(assert (=> b!124922 (= e!81647 e!81640)))

(assert (=> b!124922 (= c!22725 (and (not (= (bvand (ite c!22645 (ite c!22640 (extraKeys!2549 newMap!16) lt!64103) (extraKeys!2549 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (ite c!22645 (ite c!22640 (extraKeys!2549 newMap!16) lt!64103) (extraKeys!2549 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!124923 () Bool)

(declare-fun e!81648 () Bool)

(declare-fun call!13382 () Bool)

(assert (=> b!124923 (= e!81648 (not call!13382))))

(declare-fun b!124924 () Bool)

(declare-fun e!81643 () Bool)

(declare-fun e!81646 () Bool)

(assert (=> b!124924 (= e!81643 e!81646)))

(declare-fun res!60525 () Bool)

(assert (=> b!124924 (=> (not res!60525) (not e!81646))))

(declare-fun lt!64339 () ListLongMap!1677)

(assert (=> b!124924 (= res!60525 (contains!873 lt!64339 (select (arr!2219 (_keys!4493 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!124924 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2482 (_keys!4493 newMap!16))))))

(declare-fun bm!13378 () Bool)

(assert (=> bm!13378 (= call!13379 call!13380)))

(declare-fun b!124925 () Bool)

(declare-fun e!81644 () Bool)

(declare-fun call!13381 () Bool)

(assert (=> b!124925 (= e!81644 (not call!13381))))

(declare-fun b!124926 () Bool)

(declare-fun e!81642 () Unit!3867)

(declare-fun Unit!3881 () Unit!3867)

(assert (=> b!124926 (= e!81642 Unit!3881)))

(declare-fun b!124927 () Bool)

(declare-fun e!81637 () Bool)

(assert (=> b!124927 (= e!81637 (validKeyInArray!0 (select (arr!2219 (_keys!4493 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!124928 () Bool)

(declare-fun e!81638 () Bool)

(assert (=> b!124928 (= e!81644 e!81638)))

(declare-fun res!60518 () Bool)

(assert (=> b!124928 (= res!60518 call!13381)))

(assert (=> b!124928 (=> (not res!60518) (not e!81638))))

(declare-fun b!124929 () Bool)

(declare-fun lt!64335 () Unit!3867)

(assert (=> b!124929 (= e!81642 lt!64335)))

(declare-fun lt!64324 () ListLongMap!1677)

(assert (=> b!124929 (= lt!64324 (getCurrentListMapNoExtraKeys!135 (_keys!4493 newMap!16) (ite (or c!22645 c!22647) (_values!2747 newMap!16) (array!4688 (store (arr!2220 (_values!2747 newMap!16)) (index!3231 lt!64093) (ValueCellFull!1074 (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2483 (_values!2747 newMap!16)))) (mask!7010 newMap!16) (ite c!22645 (ite c!22640 (extraKeys!2549 newMap!16) lt!64103) (extraKeys!2549 newMap!16)) (zeroValue!2629 newMap!16) (ite c!22645 (ite c!22640 (minValue!2629 newMap!16) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2629 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2764 newMap!16)))))

(declare-fun lt!64330 () (_ BitVec 64))

(assert (=> b!124929 (= lt!64330 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!64340 () (_ BitVec 64))

(assert (=> b!124929 (= lt!64340 (select (arr!2219 (_keys!4493 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!64325 () Unit!3867)

(assert (=> b!124929 (= lt!64325 (addStillContains!86 lt!64324 lt!64330 (zeroValue!2629 newMap!16) lt!64340))))

(assert (=> b!124929 (contains!873 (+!169 lt!64324 (tuple2!2569 lt!64330 (zeroValue!2629 newMap!16))) lt!64340)))

(declare-fun lt!64342 () Unit!3867)

(assert (=> b!124929 (= lt!64342 lt!64325)))

(declare-fun lt!64343 () ListLongMap!1677)

(assert (=> b!124929 (= lt!64343 (getCurrentListMapNoExtraKeys!135 (_keys!4493 newMap!16) (ite (or c!22645 c!22647) (_values!2747 newMap!16) (array!4688 (store (arr!2220 (_values!2747 newMap!16)) (index!3231 lt!64093) (ValueCellFull!1074 (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2483 (_values!2747 newMap!16)))) (mask!7010 newMap!16) (ite c!22645 (ite c!22640 (extraKeys!2549 newMap!16) lt!64103) (extraKeys!2549 newMap!16)) (zeroValue!2629 newMap!16) (ite c!22645 (ite c!22640 (minValue!2629 newMap!16) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2629 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2764 newMap!16)))))

(declare-fun lt!64326 () (_ BitVec 64))

(assert (=> b!124929 (= lt!64326 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!64338 () (_ BitVec 64))

(assert (=> b!124929 (= lt!64338 (select (arr!2219 (_keys!4493 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!64336 () Unit!3867)

(assert (=> b!124929 (= lt!64336 (addApplyDifferent!86 lt!64343 lt!64326 (ite c!22645 (ite c!22640 (minValue!2629 newMap!16) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2629 newMap!16)) lt!64338))))

(assert (=> b!124929 (= (apply!110 (+!169 lt!64343 (tuple2!2569 lt!64326 (ite c!22645 (ite c!22640 (minValue!2629 newMap!16) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2629 newMap!16)))) lt!64338) (apply!110 lt!64343 lt!64338))))

(declare-fun lt!64341 () Unit!3867)

(assert (=> b!124929 (= lt!64341 lt!64336)))

(declare-fun lt!64334 () ListLongMap!1677)

(assert (=> b!124929 (= lt!64334 (getCurrentListMapNoExtraKeys!135 (_keys!4493 newMap!16) (ite (or c!22645 c!22647) (_values!2747 newMap!16) (array!4688 (store (arr!2220 (_values!2747 newMap!16)) (index!3231 lt!64093) (ValueCellFull!1074 (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2483 (_values!2747 newMap!16)))) (mask!7010 newMap!16) (ite c!22645 (ite c!22640 (extraKeys!2549 newMap!16) lt!64103) (extraKeys!2549 newMap!16)) (zeroValue!2629 newMap!16) (ite c!22645 (ite c!22640 (minValue!2629 newMap!16) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2629 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2764 newMap!16)))))

(declare-fun lt!64344 () (_ BitVec 64))

(assert (=> b!124929 (= lt!64344 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!64332 () (_ BitVec 64))

(assert (=> b!124929 (= lt!64332 (select (arr!2219 (_keys!4493 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!64345 () Unit!3867)

(assert (=> b!124929 (= lt!64345 (addApplyDifferent!86 lt!64334 lt!64344 (zeroValue!2629 newMap!16) lt!64332))))

(assert (=> b!124929 (= (apply!110 (+!169 lt!64334 (tuple2!2569 lt!64344 (zeroValue!2629 newMap!16))) lt!64332) (apply!110 lt!64334 lt!64332))))

(declare-fun lt!64337 () Unit!3867)

(assert (=> b!124929 (= lt!64337 lt!64345)))

(declare-fun lt!64331 () ListLongMap!1677)

(assert (=> b!124929 (= lt!64331 (getCurrentListMapNoExtraKeys!135 (_keys!4493 newMap!16) (ite (or c!22645 c!22647) (_values!2747 newMap!16) (array!4688 (store (arr!2220 (_values!2747 newMap!16)) (index!3231 lt!64093) (ValueCellFull!1074 (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2483 (_values!2747 newMap!16)))) (mask!7010 newMap!16) (ite c!22645 (ite c!22640 (extraKeys!2549 newMap!16) lt!64103) (extraKeys!2549 newMap!16)) (zeroValue!2629 newMap!16) (ite c!22645 (ite c!22640 (minValue!2629 newMap!16) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2629 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2764 newMap!16)))))

(declare-fun lt!64328 () (_ BitVec 64))

(assert (=> b!124929 (= lt!64328 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!64329 () (_ BitVec 64))

(assert (=> b!124929 (= lt!64329 (select (arr!2219 (_keys!4493 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!124929 (= lt!64335 (addApplyDifferent!86 lt!64331 lt!64328 (ite c!22645 (ite c!22640 (minValue!2629 newMap!16) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2629 newMap!16)) lt!64329))))

(assert (=> b!124929 (= (apply!110 (+!169 lt!64331 (tuple2!2569 lt!64328 (ite c!22645 (ite c!22640 (minValue!2629 newMap!16) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2629 newMap!16)))) lt!64329) (apply!110 lt!64331 lt!64329))))

(declare-fun b!124930 () Bool)

(declare-fun res!60523 () Bool)

(declare-fun e!81641 () Bool)

(assert (=> b!124930 (=> (not res!60523) (not e!81641))))

(assert (=> b!124930 (= res!60523 e!81644)))

(declare-fun c!22723 () Bool)

(assert (=> b!124930 (= c!22723 (not (= (bvand (ite c!22645 (ite c!22640 (extraKeys!2549 newMap!16) lt!64103) (extraKeys!2549 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!124931 () Bool)

(declare-fun c!22726 () Bool)

(assert (=> b!124931 (= c!22726 (and (not (= (bvand (ite c!22645 (ite c!22640 (extraKeys!2549 newMap!16) lt!64103) (extraKeys!2549 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (ite c!22645 (ite c!22640 (extraKeys!2549 newMap!16) lt!64103) (extraKeys!2549 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!124931 (= e!81640 e!81645)))

(declare-fun b!124932 () Bool)

(assert (=> b!124932 (= e!81638 (= (apply!110 lt!64339 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2629 newMap!16)))))

(declare-fun bm!13379 () Bool)

(assert (=> bm!13379 (= call!13381 (contains!873 lt!64339 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!124933 () Bool)

(assert (=> b!124933 (= e!81647 (+!169 call!13384 (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!22645 (ite c!22640 (minValue!2629 newMap!16) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2629 newMap!16)))))))

(declare-fun b!124919 () Bool)

(assert (=> b!124919 (= e!81646 (= (apply!110 lt!64339 (select (arr!2219 (_keys!4493 newMap!16)) #b00000000000000000000000000000000)) (get!1436 (select (arr!2220 (ite (or c!22645 c!22647) (_values!2747 newMap!16) (array!4688 (store (arr!2220 (_values!2747 newMap!16)) (index!3231 lt!64093) (ValueCellFull!1074 (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2483 (_values!2747 newMap!16))))) #b00000000000000000000000000000000) (dynLambda!411 (defaultEntry!2764 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!124919 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2483 (ite (or c!22645 c!22647) (_values!2747 newMap!16) (array!4688 (store (arr!2220 (_values!2747 newMap!16)) (index!3231 lt!64093) (ValueCellFull!1074 (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2483 (_values!2747 newMap!16)))))))))

(assert (=> b!124919 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2482 (_keys!4493 newMap!16))))))

(declare-fun d!37371 () Bool)

(assert (=> d!37371 e!81641))

(declare-fun res!60519 () Bool)

(assert (=> d!37371 (=> (not res!60519) (not e!81641))))

(assert (=> d!37371 (= res!60519 (or (bvsge #b00000000000000000000000000000000 (size!2482 (_keys!4493 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2482 (_keys!4493 newMap!16))))))))

(declare-fun lt!64327 () ListLongMap!1677)

(assert (=> d!37371 (= lt!64339 lt!64327)))

(declare-fun lt!64333 () Unit!3867)

(assert (=> d!37371 (= lt!64333 e!81642)))

(declare-fun c!22724 () Bool)

(declare-fun e!81639 () Bool)

(assert (=> d!37371 (= c!22724 e!81639)))

(declare-fun res!60520 () Bool)

(assert (=> d!37371 (=> (not res!60520) (not e!81639))))

(assert (=> d!37371 (= res!60520 (bvslt #b00000000000000000000000000000000 (size!2482 (_keys!4493 newMap!16))))))

(assert (=> d!37371 (= lt!64327 e!81647)))

(assert (=> d!37371 (= c!22727 (and (not (= (bvand (ite c!22645 (ite c!22640 (extraKeys!2549 newMap!16) lt!64103) (extraKeys!2549 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (ite c!22645 (ite c!22640 (extraKeys!2549 newMap!16) lt!64103) (extraKeys!2549 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!37371 (validMask!0 (mask!7010 newMap!16))))

(assert (=> d!37371 (= (getCurrentListMap!535 (_keys!4493 newMap!16) (ite (or c!22645 c!22647) (_values!2747 newMap!16) (array!4688 (store (arr!2220 (_values!2747 newMap!16)) (index!3231 lt!64093) (ValueCellFull!1074 (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2483 (_values!2747 newMap!16)))) (mask!7010 newMap!16) (ite c!22645 (ite c!22640 (extraKeys!2549 newMap!16) lt!64103) (extraKeys!2549 newMap!16)) (zeroValue!2629 newMap!16) (ite c!22645 (ite c!22640 (minValue!2629 newMap!16) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2629 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2764 newMap!16)) lt!64339)))

(declare-fun bm!13380 () Bool)

(assert (=> bm!13380 (= call!13383 call!13384)))

(declare-fun b!124934 () Bool)

(assert (=> b!124934 (= e!81641 e!81648)))

(declare-fun c!22722 () Bool)

(assert (=> b!124934 (= c!22722 (not (= (bvand (ite c!22645 (ite c!22640 (extraKeys!2549 newMap!16) lt!64103) (extraKeys!2549 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!13381 () Bool)

(assert (=> bm!13381 (= call!13382 (contains!873 lt!64339 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!124935 () Bool)

(assert (=> b!124935 (= e!81639 (validKeyInArray!0 (select (arr!2219 (_keys!4493 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!124936 () Bool)

(declare-fun e!81649 () Bool)

(assert (=> b!124936 (= e!81648 e!81649)))

(declare-fun res!60524 () Bool)

(assert (=> b!124936 (= res!60524 call!13382)))

(assert (=> b!124936 (=> (not res!60524) (not e!81649))))

(declare-fun b!124937 () Bool)

(declare-fun res!60521 () Bool)

(assert (=> b!124937 (=> (not res!60521) (not e!81641))))

(assert (=> b!124937 (= res!60521 e!81643)))

(declare-fun res!60517 () Bool)

(assert (=> b!124937 (=> res!60517 e!81643)))

(assert (=> b!124937 (= res!60517 (not e!81637))))

(declare-fun res!60522 () Bool)

(assert (=> b!124937 (=> (not res!60522) (not e!81637))))

(assert (=> b!124937 (= res!60522 (bvslt #b00000000000000000000000000000000 (size!2482 (_keys!4493 newMap!16))))))

(declare-fun b!124938 () Bool)

(assert (=> b!124938 (= e!81645 call!13383)))

(declare-fun b!124939 () Bool)

(assert (=> b!124939 (= e!81649 (= (apply!110 lt!64339 #b1000000000000000000000000000000000000000000000000000000000000000) (ite c!22645 (ite c!22640 (minValue!2629 newMap!16) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2629 newMap!16))))))

(assert (= (and d!37371 c!22727) b!124933))

(assert (= (and d!37371 (not c!22727)) b!124922))

(assert (= (and b!124922 c!22725) b!124920))

(assert (= (and b!124922 (not c!22725)) b!124931))

(assert (= (and b!124931 c!22726) b!124938))

(assert (= (and b!124931 (not c!22726)) b!124921))

(assert (= (or b!124938 b!124921) bm!13378))

(assert (= (or b!124920 bm!13378) bm!13377))

(assert (= (or b!124920 b!124938) bm!13380))

(assert (= (or b!124933 bm!13377) bm!13375))

(assert (= (or b!124933 bm!13380) bm!13376))

(assert (= (and d!37371 res!60520) b!124935))

(assert (= (and d!37371 c!22724) b!124929))

(assert (= (and d!37371 (not c!22724)) b!124926))

(assert (= (and d!37371 res!60519) b!124937))

(assert (= (and b!124937 res!60522) b!124927))

(assert (= (and b!124937 (not res!60517)) b!124924))

(assert (= (and b!124924 res!60525) b!124919))

(assert (= (and b!124937 res!60521) b!124930))

(assert (= (and b!124930 c!22723) b!124928))

(assert (= (and b!124930 (not c!22723)) b!124925))

(assert (= (and b!124928 res!60518) b!124932))

(assert (= (or b!124928 b!124925) bm!13379))

(assert (= (and b!124930 res!60523) b!124934))

(assert (= (and b!124934 c!22722) b!124936))

(assert (= (and b!124934 (not c!22722)) b!124923))

(assert (= (and b!124936 res!60524) b!124939))

(assert (= (or b!124936 b!124923) bm!13381))

(declare-fun b_lambda!5475 () Bool)

(assert (=> (not b_lambda!5475) (not b!124919)))

(assert (=> b!124919 t!6029))

(declare-fun b_and!7675 () Bool)

(assert (= b_and!7671 (and (=> t!6029 result!3819) b_and!7675)))

(assert (=> b!124919 t!6031))

(declare-fun b_and!7677 () Bool)

(assert (= b_and!7673 (and (=> t!6031 result!3821) b_and!7677)))

(assert (=> b!124935 m!144619))

(assert (=> b!124935 m!144619))

(assert (=> b!124935 m!144629))

(declare-fun m!144917 () Bool)

(assert (=> b!124919 m!144917))

(assert (=> b!124919 m!144721))

(declare-fun m!144919 () Bool)

(assert (=> b!124919 m!144919))

(assert (=> b!124919 m!144619))

(assert (=> b!124919 m!144721))

(assert (=> b!124919 m!144619))

(declare-fun m!144921 () Bool)

(assert (=> b!124919 m!144921))

(assert (=> b!124919 m!144917))

(assert (=> b!124927 m!144619))

(assert (=> b!124927 m!144619))

(assert (=> b!124927 m!144629))

(declare-fun m!144923 () Bool)

(assert (=> b!124929 m!144923))

(declare-fun m!144925 () Bool)

(assert (=> b!124929 m!144925))

(declare-fun m!144927 () Bool)

(assert (=> b!124929 m!144927))

(declare-fun m!144929 () Bool)

(assert (=> b!124929 m!144929))

(assert (=> b!124929 m!144619))

(declare-fun m!144931 () Bool)

(assert (=> b!124929 m!144931))

(declare-fun m!144933 () Bool)

(assert (=> b!124929 m!144933))

(declare-fun m!144935 () Bool)

(assert (=> b!124929 m!144935))

(assert (=> b!124929 m!144935))

(declare-fun m!144937 () Bool)

(assert (=> b!124929 m!144937))

(declare-fun m!144939 () Bool)

(assert (=> b!124929 m!144939))

(declare-fun m!144941 () Bool)

(assert (=> b!124929 m!144941))

(assert (=> b!124929 m!144929))

(declare-fun m!144943 () Bool)

(assert (=> b!124929 m!144943))

(declare-fun m!144945 () Bool)

(assert (=> b!124929 m!144945))

(declare-fun m!144947 () Bool)

(assert (=> b!124929 m!144947))

(declare-fun m!144949 () Bool)

(assert (=> b!124929 m!144949))

(assert (=> b!124929 m!144939))

(declare-fun m!144951 () Bool)

(assert (=> b!124929 m!144951))

(assert (=> b!124929 m!144925))

(declare-fun m!144953 () Bool)

(assert (=> b!124929 m!144953))

(assert (=> b!124924 m!144619))

(assert (=> b!124924 m!144619))

(declare-fun m!144955 () Bool)

(assert (=> b!124924 m!144955))

(declare-fun m!144957 () Bool)

(assert (=> b!124933 m!144957))

(declare-fun m!144959 () Bool)

(assert (=> b!124939 m!144959))

(declare-fun m!144961 () Bool)

(assert (=> bm!13379 m!144961))

(assert (=> bm!13375 m!144951))

(declare-fun m!144963 () Bool)

(assert (=> bm!13381 m!144963))

(declare-fun m!144965 () Bool)

(assert (=> b!124932 m!144965))

(declare-fun m!144967 () Bool)

(assert (=> bm!13376 m!144967))

(assert (=> d!37371 m!144633))

(assert (=> bm!13333 d!37371))

(assert (=> b!124498 d!37329))

(declare-fun d!37373 () Bool)

(assert (=> d!37373 (= (get!1437 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (v!3107 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355)))))

(assert (=> b!124650 d!37373))

(declare-fun d!37375 () Bool)

(declare-fun res!60526 () Bool)

(declare-fun e!81650 () Bool)

(assert (=> d!37375 (=> (not res!60526) (not e!81650))))

(assert (=> d!37375 (= res!60526 (simpleValid!86 (v!3108 (underlying!436 thiss!992))))))

(assert (=> d!37375 (= (valid!502 (v!3108 (underlying!436 thiss!992))) e!81650)))

(declare-fun b!124940 () Bool)

(declare-fun res!60527 () Bool)

(assert (=> b!124940 (=> (not res!60527) (not e!81650))))

(assert (=> b!124940 (= res!60527 (= (arrayCountValidKeys!0 (_keys!4493 (v!3108 (underlying!436 thiss!992))) #b00000000000000000000000000000000 (size!2482 (_keys!4493 (v!3108 (underlying!436 thiss!992))))) (_size!577 (v!3108 (underlying!436 thiss!992)))))))

(declare-fun b!124941 () Bool)

(declare-fun res!60528 () Bool)

(assert (=> b!124941 (=> (not res!60528) (not e!81650))))

(assert (=> b!124941 (= res!60528 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4493 (v!3108 (underlying!436 thiss!992))) (mask!7010 (v!3108 (underlying!436 thiss!992)))))))

(declare-fun b!124942 () Bool)

(assert (=> b!124942 (= e!81650 (arrayNoDuplicates!0 (_keys!4493 (v!3108 (underlying!436 thiss!992))) #b00000000000000000000000000000000 Nil!1693))))

(assert (= (and d!37375 res!60526) b!124940))

(assert (= (and b!124940 res!60527) b!124941))

(assert (= (and b!124941 res!60528) b!124942))

(declare-fun m!144969 () Bool)

(assert (=> d!37375 m!144969))

(declare-fun m!144971 () Bool)

(assert (=> b!124940 m!144971))

(declare-fun m!144973 () Bool)

(assert (=> b!124941 m!144973))

(declare-fun m!144975 () Bool)

(assert (=> b!124942 m!144975))

(assert (=> d!37293 d!37375))

(declare-fun d!37377 () Bool)

(declare-fun e!81653 () Bool)

(assert (=> d!37377 e!81653))

(declare-fun res!60534 () Bool)

(assert (=> d!37377 (=> (not res!60534) (not e!81653))))

(declare-fun lt!64350 () SeekEntryResult!269)

(assert (=> d!37377 (= res!60534 ((_ is Found!269) lt!64350))))

(assert (=> d!37377 (= lt!64350 (seekEntryOrOpen!0 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355) (_keys!4493 newMap!16) (mask!7010 newMap!16)))))

(declare-fun lt!64351 () Unit!3867)

(declare-fun choose!752 (array!4685 array!4687 (_ BitVec 32) (_ BitVec 32) V!3427 V!3427 (_ BitVec 64) Int) Unit!3867)

(assert (=> d!37377 (= lt!64351 (choose!752 (_keys!4493 newMap!16) (_values!2747 newMap!16) (mask!7010 newMap!16) (extraKeys!2549 newMap!16) (zeroValue!2629 newMap!16) (minValue!2629 newMap!16) (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355) (defaultEntry!2764 newMap!16)))))

(assert (=> d!37377 (validMask!0 (mask!7010 newMap!16))))

(assert (=> d!37377 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!55 (_keys!4493 newMap!16) (_values!2747 newMap!16) (mask!7010 newMap!16) (extraKeys!2549 newMap!16) (zeroValue!2629 newMap!16) (minValue!2629 newMap!16) (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355) (defaultEntry!2764 newMap!16)) lt!64351)))

(declare-fun b!124947 () Bool)

(declare-fun res!60533 () Bool)

(assert (=> b!124947 (=> (not res!60533) (not e!81653))))

(assert (=> b!124947 (= res!60533 (inRange!0 (index!3231 lt!64350) (mask!7010 newMap!16)))))

(declare-fun b!124948 () Bool)

(assert (=> b!124948 (= e!81653 (= (select (arr!2219 (_keys!4493 newMap!16)) (index!3231 lt!64350)) (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355)))))

(assert (=> b!124948 (and (bvsge (index!3231 lt!64350) #b00000000000000000000000000000000) (bvslt (index!3231 lt!64350) (size!2482 (_keys!4493 newMap!16))))))

(assert (= (and d!37377 res!60534) b!124947))

(assert (= (and b!124947 res!60533) b!124948))

(assert (=> d!37377 m!144415))

(assert (=> d!37377 m!144557))

(assert (=> d!37377 m!144415))

(declare-fun m!144977 () Bool)

(assert (=> d!37377 m!144977))

(assert (=> d!37377 m!144633))

(declare-fun m!144979 () Bool)

(assert (=> b!124947 m!144979))

(declare-fun m!144981 () Bool)

(assert (=> b!124948 m!144981))

(assert (=> bm!13329 d!37377))

(declare-fun d!37379 () Bool)

(assert (=> d!37379 (= (+!169 (getCurrentListMap!535 (_keys!4493 newMap!16) (_values!2747 newMap!16) (mask!7010 newMap!16) (extraKeys!2549 newMap!16) (zeroValue!2629 newMap!16) (minValue!2629 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2764 newMap!16)) (tuple2!2569 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (getCurrentListMap!535 (_keys!4493 newMap!16) (_values!2747 newMap!16) (mask!7010 newMap!16) lt!64087 (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2629 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2764 newMap!16)))))

(declare-fun lt!64354 () Unit!3867)

(declare-fun choose!753 (array!4685 array!4687 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3427 V!3427 V!3427 Int) Unit!3867)

(assert (=> d!37379 (= lt!64354 (choose!753 (_keys!4493 newMap!16) (_values!2747 newMap!16) (mask!7010 newMap!16) (extraKeys!2549 newMap!16) lt!64087 (zeroValue!2629 newMap!16) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2629 newMap!16) (defaultEntry!2764 newMap!16)))))

(assert (=> d!37379 (validMask!0 (mask!7010 newMap!16))))

(assert (=> d!37379 (= (lemmaChangeZeroKeyThenAddPairToListMap!55 (_keys!4493 newMap!16) (_values!2747 newMap!16) (mask!7010 newMap!16) (extraKeys!2549 newMap!16) lt!64087 (zeroValue!2629 newMap!16) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2629 newMap!16) (defaultEntry!2764 newMap!16)) lt!64354)))

(declare-fun bs!5154 () Bool)

(assert (= bs!5154 d!37379))

(assert (=> bs!5154 m!144425))

(declare-fun m!144983 () Bool)

(assert (=> bs!5154 m!144983))

(assert (=> bs!5154 m!144491))

(assert (=> bs!5154 m!144491))

(declare-fun m!144985 () Bool)

(assert (=> bs!5154 m!144985))

(assert (=> bs!5154 m!144633))

(assert (=> bs!5154 m!144425))

(declare-fun m!144987 () Bool)

(assert (=> bs!5154 m!144987))

(assert (=> b!124636 d!37379))

(declare-fun d!37381 () Bool)

(assert (=> d!37381 (= (get!1438 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!124651 d!37381))

(declare-fun d!37383 () Bool)

(assert (=> d!37383 (= (apply!110 lt!64016 lt!64011) (get!1439 (getValueByKey!166 (toList!854 lt!64016) lt!64011)))))

(declare-fun bs!5155 () Bool)

(assert (= bs!5155 d!37383))

(declare-fun m!144989 () Bool)

(assert (=> bs!5155 m!144989))

(assert (=> bs!5155 m!144989))

(declare-fun m!144991 () Bool)

(assert (=> bs!5155 m!144991))

(assert (=> b!124500 d!37383))

(declare-fun d!37385 () Bool)

(declare-fun e!81654 () Bool)

(assert (=> d!37385 e!81654))

(declare-fun res!60535 () Bool)

(assert (=> d!37385 (=> (not res!60535) (not e!81654))))

(declare-fun lt!64355 () ListLongMap!1677)

(assert (=> d!37385 (= res!60535 (contains!873 lt!64355 (_1!1295 (tuple2!2569 lt!63999 (minValue!2629 (v!3108 (underlying!436 thiss!992)))))))))

(declare-fun lt!64356 () List!1695)

(assert (=> d!37385 (= lt!64355 (ListLongMap!1678 lt!64356))))

(declare-fun lt!64358 () Unit!3867)

(declare-fun lt!64357 () Unit!3867)

(assert (=> d!37385 (= lt!64358 lt!64357)))

(assert (=> d!37385 (= (getValueByKey!166 lt!64356 (_1!1295 (tuple2!2569 lt!63999 (minValue!2629 (v!3108 (underlying!436 thiss!992)))))) (Some!171 (_2!1295 (tuple2!2569 lt!63999 (minValue!2629 (v!3108 (underlying!436 thiss!992)))))))))

(assert (=> d!37385 (= lt!64357 (lemmaContainsTupThenGetReturnValue!81 lt!64356 (_1!1295 (tuple2!2569 lt!63999 (minValue!2629 (v!3108 (underlying!436 thiss!992))))) (_2!1295 (tuple2!2569 lt!63999 (minValue!2629 (v!3108 (underlying!436 thiss!992)))))))))

(assert (=> d!37385 (= lt!64356 (insertStrictlySorted!84 (toList!854 lt!64016) (_1!1295 (tuple2!2569 lt!63999 (minValue!2629 (v!3108 (underlying!436 thiss!992))))) (_2!1295 (tuple2!2569 lt!63999 (minValue!2629 (v!3108 (underlying!436 thiss!992)))))))))

(assert (=> d!37385 (= (+!169 lt!64016 (tuple2!2569 lt!63999 (minValue!2629 (v!3108 (underlying!436 thiss!992))))) lt!64355)))

(declare-fun b!124949 () Bool)

(declare-fun res!60536 () Bool)

(assert (=> b!124949 (=> (not res!60536) (not e!81654))))

(assert (=> b!124949 (= res!60536 (= (getValueByKey!166 (toList!854 lt!64355) (_1!1295 (tuple2!2569 lt!63999 (minValue!2629 (v!3108 (underlying!436 thiss!992)))))) (Some!171 (_2!1295 (tuple2!2569 lt!63999 (minValue!2629 (v!3108 (underlying!436 thiss!992))))))))))

(declare-fun b!124950 () Bool)

(assert (=> b!124950 (= e!81654 (contains!874 (toList!854 lt!64355) (tuple2!2569 lt!63999 (minValue!2629 (v!3108 (underlying!436 thiss!992))))))))

(assert (= (and d!37385 res!60535) b!124949))

(assert (= (and b!124949 res!60536) b!124950))

(declare-fun m!144993 () Bool)

(assert (=> d!37385 m!144993))

(declare-fun m!144995 () Bool)

(assert (=> d!37385 m!144995))

(declare-fun m!144997 () Bool)

(assert (=> d!37385 m!144997))

(declare-fun m!144999 () Bool)

(assert (=> d!37385 m!144999))

(declare-fun m!145001 () Bool)

(assert (=> b!124949 m!145001))

(declare-fun m!145003 () Bool)

(assert (=> b!124950 m!145003))

(assert (=> b!124500 d!37385))

(declare-fun d!37387 () Bool)

(assert (=> d!37387 (= (apply!110 (+!169 lt!64016 (tuple2!2569 lt!63999 (minValue!2629 (v!3108 (underlying!436 thiss!992))))) lt!64011) (apply!110 lt!64016 lt!64011))))

(declare-fun lt!64361 () Unit!3867)

(declare-fun choose!754 (ListLongMap!1677 (_ BitVec 64) V!3427 (_ BitVec 64)) Unit!3867)

(assert (=> d!37387 (= lt!64361 (choose!754 lt!64016 lt!63999 (minValue!2629 (v!3108 (underlying!436 thiss!992))) lt!64011))))

(declare-fun e!81657 () Bool)

(assert (=> d!37387 e!81657))

(declare-fun res!60539 () Bool)

(assert (=> d!37387 (=> (not res!60539) (not e!81657))))

(assert (=> d!37387 (= res!60539 (contains!873 lt!64016 lt!64011))))

(assert (=> d!37387 (= (addApplyDifferent!86 lt!64016 lt!63999 (minValue!2629 (v!3108 (underlying!436 thiss!992))) lt!64011) lt!64361)))

(declare-fun b!124954 () Bool)

(assert (=> b!124954 (= e!81657 (not (= lt!64011 lt!63999)))))

(assert (= (and d!37387 res!60539) b!124954))

(assert (=> d!37387 m!144515))

(declare-fun m!145005 () Bool)

(assert (=> d!37387 m!145005))

(assert (=> d!37387 m!144511))

(assert (=> d!37387 m!144515))

(assert (=> d!37387 m!144517))

(declare-fun m!145007 () Bool)

(assert (=> d!37387 m!145007))

(assert (=> b!124500 d!37387))

(declare-fun d!37389 () Bool)

(assert (=> d!37389 (= (apply!110 lt!64004 lt!64002) (get!1439 (getValueByKey!166 (toList!854 lt!64004) lt!64002)))))

(declare-fun bs!5156 () Bool)

(assert (= bs!5156 d!37389))

(declare-fun m!145009 () Bool)

(assert (=> bs!5156 m!145009))

(assert (=> bs!5156 m!145009))

(declare-fun m!145011 () Bool)

(assert (=> bs!5156 m!145011))

(assert (=> b!124500 d!37389))

(declare-fun d!37391 () Bool)

(assert (=> d!37391 (= (apply!110 (+!169 lt!64004 (tuple2!2569 lt!64001 (minValue!2629 (v!3108 (underlying!436 thiss!992))))) lt!64002) (get!1439 (getValueByKey!166 (toList!854 (+!169 lt!64004 (tuple2!2569 lt!64001 (minValue!2629 (v!3108 (underlying!436 thiss!992)))))) lt!64002)))))

(declare-fun bs!5157 () Bool)

(assert (= bs!5157 d!37391))

(declare-fun m!145013 () Bool)

(assert (=> bs!5157 m!145013))

(assert (=> bs!5157 m!145013))

(declare-fun m!145015 () Bool)

(assert (=> bs!5157 m!145015))

(assert (=> b!124500 d!37391))

(declare-fun d!37393 () Bool)

(declare-fun e!81658 () Bool)

(assert (=> d!37393 e!81658))

(declare-fun res!60540 () Bool)

(assert (=> d!37393 (=> (not res!60540) (not e!81658))))

(declare-fun lt!64362 () ListLongMap!1677)

(assert (=> d!37393 (= res!60540 (contains!873 lt!64362 (_1!1295 (tuple2!2569 lt!64001 (minValue!2629 (v!3108 (underlying!436 thiss!992)))))))))

(declare-fun lt!64363 () List!1695)

(assert (=> d!37393 (= lt!64362 (ListLongMap!1678 lt!64363))))

(declare-fun lt!64365 () Unit!3867)

(declare-fun lt!64364 () Unit!3867)

(assert (=> d!37393 (= lt!64365 lt!64364)))

(assert (=> d!37393 (= (getValueByKey!166 lt!64363 (_1!1295 (tuple2!2569 lt!64001 (minValue!2629 (v!3108 (underlying!436 thiss!992)))))) (Some!171 (_2!1295 (tuple2!2569 lt!64001 (minValue!2629 (v!3108 (underlying!436 thiss!992)))))))))

(assert (=> d!37393 (= lt!64364 (lemmaContainsTupThenGetReturnValue!81 lt!64363 (_1!1295 (tuple2!2569 lt!64001 (minValue!2629 (v!3108 (underlying!436 thiss!992))))) (_2!1295 (tuple2!2569 lt!64001 (minValue!2629 (v!3108 (underlying!436 thiss!992)))))))))

(assert (=> d!37393 (= lt!64363 (insertStrictlySorted!84 (toList!854 lt!64004) (_1!1295 (tuple2!2569 lt!64001 (minValue!2629 (v!3108 (underlying!436 thiss!992))))) (_2!1295 (tuple2!2569 lt!64001 (minValue!2629 (v!3108 (underlying!436 thiss!992)))))))))

(assert (=> d!37393 (= (+!169 lt!64004 (tuple2!2569 lt!64001 (minValue!2629 (v!3108 (underlying!436 thiss!992))))) lt!64362)))

(declare-fun b!124955 () Bool)

(declare-fun res!60541 () Bool)

(assert (=> b!124955 (=> (not res!60541) (not e!81658))))

(assert (=> b!124955 (= res!60541 (= (getValueByKey!166 (toList!854 lt!64362) (_1!1295 (tuple2!2569 lt!64001 (minValue!2629 (v!3108 (underlying!436 thiss!992)))))) (Some!171 (_2!1295 (tuple2!2569 lt!64001 (minValue!2629 (v!3108 (underlying!436 thiss!992))))))))))

(declare-fun b!124956 () Bool)

(assert (=> b!124956 (= e!81658 (contains!874 (toList!854 lt!64362) (tuple2!2569 lt!64001 (minValue!2629 (v!3108 (underlying!436 thiss!992))))))))

(assert (= (and d!37393 res!60540) b!124955))

(assert (= (and b!124955 res!60541) b!124956))

(declare-fun m!145017 () Bool)

(assert (=> d!37393 m!145017))

(declare-fun m!145019 () Bool)

(assert (=> d!37393 m!145019))

(declare-fun m!145021 () Bool)

(assert (=> d!37393 m!145021))

(declare-fun m!145023 () Bool)

(assert (=> d!37393 m!145023))

(declare-fun m!145025 () Bool)

(assert (=> b!124955 m!145025))

(declare-fun m!145027 () Bool)

(assert (=> b!124956 m!145027))

(assert (=> b!124500 d!37393))

(declare-fun d!37395 () Bool)

(assert (=> d!37395 (= (apply!110 (+!169 lt!64004 (tuple2!2569 lt!64001 (minValue!2629 (v!3108 (underlying!436 thiss!992))))) lt!64002) (apply!110 lt!64004 lt!64002))))

(declare-fun lt!64366 () Unit!3867)

(assert (=> d!37395 (= lt!64366 (choose!754 lt!64004 lt!64001 (minValue!2629 (v!3108 (underlying!436 thiss!992))) lt!64002))))

(declare-fun e!81659 () Bool)

(assert (=> d!37395 e!81659))

(declare-fun res!60542 () Bool)

(assert (=> d!37395 (=> (not res!60542) (not e!81659))))

(assert (=> d!37395 (= res!60542 (contains!873 lt!64004 lt!64002))))

(assert (=> d!37395 (= (addApplyDifferent!86 lt!64004 lt!64001 (minValue!2629 (v!3108 (underlying!436 thiss!992))) lt!64002) lt!64366)))

(declare-fun b!124957 () Bool)

(assert (=> b!124957 (= e!81659 (not (= lt!64002 lt!64001)))))

(assert (= (and d!37395 res!60542) b!124957))

(assert (=> d!37395 m!144505))

(declare-fun m!145029 () Bool)

(assert (=> d!37395 m!145029))

(assert (=> d!37395 m!144503))

(assert (=> d!37395 m!144505))

(assert (=> d!37395 m!144507))

(declare-fun m!145031 () Bool)

(assert (=> d!37395 m!145031))

(assert (=> b!124500 d!37395))

(declare-fun d!37397 () Bool)

(assert (=> d!37397 (= (apply!110 (+!169 lt!64016 (tuple2!2569 lt!63999 (minValue!2629 (v!3108 (underlying!436 thiss!992))))) lt!64011) (get!1439 (getValueByKey!166 (toList!854 (+!169 lt!64016 (tuple2!2569 lt!63999 (minValue!2629 (v!3108 (underlying!436 thiss!992)))))) lt!64011)))))

(declare-fun bs!5158 () Bool)

(assert (= bs!5158 d!37397))

(declare-fun m!145033 () Bool)

(assert (=> bs!5158 m!145033))

(assert (=> bs!5158 m!145033))

(declare-fun m!145035 () Bool)

(assert (=> bs!5158 m!145035))

(assert (=> b!124500 d!37397))

(declare-fun d!37399 () Bool)

(assert (=> d!37399 (= (apply!110 (+!169 lt!64007 (tuple2!2569 lt!64017 (zeroValue!2629 (v!3108 (underlying!436 thiss!992))))) lt!64005) (get!1439 (getValueByKey!166 (toList!854 (+!169 lt!64007 (tuple2!2569 lt!64017 (zeroValue!2629 (v!3108 (underlying!436 thiss!992)))))) lt!64005)))))

(declare-fun bs!5159 () Bool)

(assert (= bs!5159 d!37399))

(declare-fun m!145037 () Bool)

(assert (=> bs!5159 m!145037))

(assert (=> bs!5159 m!145037))

(declare-fun m!145039 () Bool)

(assert (=> bs!5159 m!145039))

(assert (=> b!124500 d!37399))

(assert (=> b!124500 d!37349))

(declare-fun d!37401 () Bool)

(declare-fun e!81660 () Bool)

(assert (=> d!37401 e!81660))

(declare-fun res!60543 () Bool)

(assert (=> d!37401 (=> (not res!60543) (not e!81660))))

(declare-fun lt!64367 () ListLongMap!1677)

(assert (=> d!37401 (= res!60543 (contains!873 lt!64367 (_1!1295 (tuple2!2569 lt!64003 (zeroValue!2629 (v!3108 (underlying!436 thiss!992)))))))))

(declare-fun lt!64368 () List!1695)

(assert (=> d!37401 (= lt!64367 (ListLongMap!1678 lt!64368))))

(declare-fun lt!64370 () Unit!3867)

(declare-fun lt!64369 () Unit!3867)

(assert (=> d!37401 (= lt!64370 lt!64369)))

(assert (=> d!37401 (= (getValueByKey!166 lt!64368 (_1!1295 (tuple2!2569 lt!64003 (zeroValue!2629 (v!3108 (underlying!436 thiss!992)))))) (Some!171 (_2!1295 (tuple2!2569 lt!64003 (zeroValue!2629 (v!3108 (underlying!436 thiss!992)))))))))

(assert (=> d!37401 (= lt!64369 (lemmaContainsTupThenGetReturnValue!81 lt!64368 (_1!1295 (tuple2!2569 lt!64003 (zeroValue!2629 (v!3108 (underlying!436 thiss!992))))) (_2!1295 (tuple2!2569 lt!64003 (zeroValue!2629 (v!3108 (underlying!436 thiss!992)))))))))

(assert (=> d!37401 (= lt!64368 (insertStrictlySorted!84 (toList!854 lt!63997) (_1!1295 (tuple2!2569 lt!64003 (zeroValue!2629 (v!3108 (underlying!436 thiss!992))))) (_2!1295 (tuple2!2569 lt!64003 (zeroValue!2629 (v!3108 (underlying!436 thiss!992)))))))))

(assert (=> d!37401 (= (+!169 lt!63997 (tuple2!2569 lt!64003 (zeroValue!2629 (v!3108 (underlying!436 thiss!992))))) lt!64367)))

(declare-fun b!124958 () Bool)

(declare-fun res!60544 () Bool)

(assert (=> b!124958 (=> (not res!60544) (not e!81660))))

(assert (=> b!124958 (= res!60544 (= (getValueByKey!166 (toList!854 lt!64367) (_1!1295 (tuple2!2569 lt!64003 (zeroValue!2629 (v!3108 (underlying!436 thiss!992)))))) (Some!171 (_2!1295 (tuple2!2569 lt!64003 (zeroValue!2629 (v!3108 (underlying!436 thiss!992))))))))))

(declare-fun b!124959 () Bool)

(assert (=> b!124959 (= e!81660 (contains!874 (toList!854 lt!64367) (tuple2!2569 lt!64003 (zeroValue!2629 (v!3108 (underlying!436 thiss!992))))))))

(assert (= (and d!37401 res!60543) b!124958))

(assert (= (and b!124958 res!60544) b!124959))

(declare-fun m!145041 () Bool)

(assert (=> d!37401 m!145041))

(declare-fun m!145043 () Bool)

(assert (=> d!37401 m!145043))

(declare-fun m!145045 () Bool)

(assert (=> d!37401 m!145045))

(declare-fun m!145047 () Bool)

(assert (=> d!37401 m!145047))

(declare-fun m!145049 () Bool)

(assert (=> b!124958 m!145049))

(declare-fun m!145051 () Bool)

(assert (=> b!124959 m!145051))

(assert (=> b!124500 d!37401))

(declare-fun d!37403 () Bool)

(declare-fun e!81661 () Bool)

(assert (=> d!37403 e!81661))

(declare-fun res!60545 () Bool)

(assert (=> d!37403 (=> res!60545 e!81661)))

(declare-fun lt!64373 () Bool)

(assert (=> d!37403 (= res!60545 (not lt!64373))))

(declare-fun lt!64374 () Bool)

(assert (=> d!37403 (= lt!64373 lt!64374)))

(declare-fun lt!64371 () Unit!3867)

(declare-fun e!81662 () Unit!3867)

(assert (=> d!37403 (= lt!64371 e!81662)))

(declare-fun c!22728 () Bool)

(assert (=> d!37403 (= c!22728 lt!64374)))

(assert (=> d!37403 (= lt!64374 (containsKey!170 (toList!854 (+!169 lt!63997 (tuple2!2569 lt!64003 (zeroValue!2629 (v!3108 (underlying!436 thiss!992)))))) lt!64013))))

(assert (=> d!37403 (= (contains!873 (+!169 lt!63997 (tuple2!2569 lt!64003 (zeroValue!2629 (v!3108 (underlying!436 thiss!992))))) lt!64013) lt!64373)))

(declare-fun b!124960 () Bool)

(declare-fun lt!64372 () Unit!3867)

(assert (=> b!124960 (= e!81662 lt!64372)))

(assert (=> b!124960 (= lt!64372 (lemmaContainsKeyImpliesGetValueByKeyDefined!118 (toList!854 (+!169 lt!63997 (tuple2!2569 lt!64003 (zeroValue!2629 (v!3108 (underlying!436 thiss!992)))))) lt!64013))))

(assert (=> b!124960 (isDefined!119 (getValueByKey!166 (toList!854 (+!169 lt!63997 (tuple2!2569 lt!64003 (zeroValue!2629 (v!3108 (underlying!436 thiss!992)))))) lt!64013))))

(declare-fun b!124961 () Bool)

(declare-fun Unit!3882 () Unit!3867)

(assert (=> b!124961 (= e!81662 Unit!3882)))

(declare-fun b!124962 () Bool)

(assert (=> b!124962 (= e!81661 (isDefined!119 (getValueByKey!166 (toList!854 (+!169 lt!63997 (tuple2!2569 lt!64003 (zeroValue!2629 (v!3108 (underlying!436 thiss!992)))))) lt!64013)))))

(assert (= (and d!37403 c!22728) b!124960))

(assert (= (and d!37403 (not c!22728)) b!124961))

(assert (= (and d!37403 (not res!60545)) b!124962))

(declare-fun m!145053 () Bool)

(assert (=> d!37403 m!145053))

(declare-fun m!145055 () Bool)

(assert (=> b!124960 m!145055))

(declare-fun m!145057 () Bool)

(assert (=> b!124960 m!145057))

(assert (=> b!124960 m!145057))

(declare-fun m!145059 () Bool)

(assert (=> b!124960 m!145059))

(assert (=> b!124962 m!145057))

(assert (=> b!124962 m!145057))

(assert (=> b!124962 m!145059))

(assert (=> b!124500 d!37403))

(declare-fun d!37405 () Bool)

(assert (=> d!37405 (= (apply!110 lt!64007 lt!64005) (get!1439 (getValueByKey!166 (toList!854 lt!64007) lt!64005)))))

(declare-fun bs!5160 () Bool)

(assert (= bs!5160 d!37405))

(declare-fun m!145061 () Bool)

(assert (=> bs!5160 m!145061))

(assert (=> bs!5160 m!145061))

(declare-fun m!145063 () Bool)

(assert (=> bs!5160 m!145063))

(assert (=> b!124500 d!37405))

(declare-fun d!37407 () Bool)

(assert (=> d!37407 (= (apply!110 (+!169 lt!64007 (tuple2!2569 lt!64017 (zeroValue!2629 (v!3108 (underlying!436 thiss!992))))) lt!64005) (apply!110 lt!64007 lt!64005))))

(declare-fun lt!64375 () Unit!3867)

(assert (=> d!37407 (= lt!64375 (choose!754 lt!64007 lt!64017 (zeroValue!2629 (v!3108 (underlying!436 thiss!992))) lt!64005))))

(declare-fun e!81663 () Bool)

(assert (=> d!37407 e!81663))

(declare-fun res!60546 () Bool)

(assert (=> d!37407 (=> (not res!60546) (not e!81663))))

(assert (=> d!37407 (= res!60546 (contains!873 lt!64007 lt!64005))))

(assert (=> d!37407 (= (addApplyDifferent!86 lt!64007 lt!64017 (zeroValue!2629 (v!3108 (underlying!436 thiss!992))) lt!64005) lt!64375)))

(declare-fun b!124963 () Bool)

(assert (=> b!124963 (= e!81663 (not (= lt!64005 lt!64017)))))

(assert (= (and d!37407 res!60546) b!124963))

(assert (=> d!37407 m!144519))

(declare-fun m!145065 () Bool)

(assert (=> d!37407 m!145065))

(assert (=> d!37407 m!144513))

(assert (=> d!37407 m!144519))

(assert (=> d!37407 m!144521))

(declare-fun m!145067 () Bool)

(assert (=> d!37407 m!145067))

(assert (=> b!124500 d!37407))

(declare-fun d!37409 () Bool)

(declare-fun e!81664 () Bool)

(assert (=> d!37409 e!81664))

(declare-fun res!60547 () Bool)

(assert (=> d!37409 (=> (not res!60547) (not e!81664))))

(declare-fun lt!64376 () ListLongMap!1677)

(assert (=> d!37409 (= res!60547 (contains!873 lt!64376 (_1!1295 (tuple2!2569 lt!64017 (zeroValue!2629 (v!3108 (underlying!436 thiss!992)))))))))

(declare-fun lt!64377 () List!1695)

(assert (=> d!37409 (= lt!64376 (ListLongMap!1678 lt!64377))))

(declare-fun lt!64379 () Unit!3867)

(declare-fun lt!64378 () Unit!3867)

(assert (=> d!37409 (= lt!64379 lt!64378)))

(assert (=> d!37409 (= (getValueByKey!166 lt!64377 (_1!1295 (tuple2!2569 lt!64017 (zeroValue!2629 (v!3108 (underlying!436 thiss!992)))))) (Some!171 (_2!1295 (tuple2!2569 lt!64017 (zeroValue!2629 (v!3108 (underlying!436 thiss!992)))))))))

(assert (=> d!37409 (= lt!64378 (lemmaContainsTupThenGetReturnValue!81 lt!64377 (_1!1295 (tuple2!2569 lt!64017 (zeroValue!2629 (v!3108 (underlying!436 thiss!992))))) (_2!1295 (tuple2!2569 lt!64017 (zeroValue!2629 (v!3108 (underlying!436 thiss!992)))))))))

(assert (=> d!37409 (= lt!64377 (insertStrictlySorted!84 (toList!854 lt!64007) (_1!1295 (tuple2!2569 lt!64017 (zeroValue!2629 (v!3108 (underlying!436 thiss!992))))) (_2!1295 (tuple2!2569 lt!64017 (zeroValue!2629 (v!3108 (underlying!436 thiss!992)))))))))

(assert (=> d!37409 (= (+!169 lt!64007 (tuple2!2569 lt!64017 (zeroValue!2629 (v!3108 (underlying!436 thiss!992))))) lt!64376)))

(declare-fun b!124964 () Bool)

(declare-fun res!60548 () Bool)

(assert (=> b!124964 (=> (not res!60548) (not e!81664))))

(assert (=> b!124964 (= res!60548 (= (getValueByKey!166 (toList!854 lt!64376) (_1!1295 (tuple2!2569 lt!64017 (zeroValue!2629 (v!3108 (underlying!436 thiss!992)))))) (Some!171 (_2!1295 (tuple2!2569 lt!64017 (zeroValue!2629 (v!3108 (underlying!436 thiss!992))))))))))

(declare-fun b!124965 () Bool)

(assert (=> b!124965 (= e!81664 (contains!874 (toList!854 lt!64376) (tuple2!2569 lt!64017 (zeroValue!2629 (v!3108 (underlying!436 thiss!992))))))))

(assert (= (and d!37409 res!60547) b!124964))

(assert (= (and b!124964 res!60548) b!124965))

(declare-fun m!145069 () Bool)

(assert (=> d!37409 m!145069))

(declare-fun m!145071 () Bool)

(assert (=> d!37409 m!145071))

(declare-fun m!145073 () Bool)

(assert (=> d!37409 m!145073))

(declare-fun m!145075 () Bool)

(assert (=> d!37409 m!145075))

(declare-fun m!145077 () Bool)

(assert (=> b!124964 m!145077))

(declare-fun m!145079 () Bool)

(assert (=> b!124965 m!145079))

(assert (=> b!124500 d!37409))

(declare-fun d!37411 () Bool)

(assert (=> d!37411 (contains!873 (+!169 lt!63997 (tuple2!2569 lt!64003 (zeroValue!2629 (v!3108 (underlying!436 thiss!992))))) lt!64013)))

(declare-fun lt!64382 () Unit!3867)

(declare-fun choose!755 (ListLongMap!1677 (_ BitVec 64) V!3427 (_ BitVec 64)) Unit!3867)

(assert (=> d!37411 (= lt!64382 (choose!755 lt!63997 lt!64003 (zeroValue!2629 (v!3108 (underlying!436 thiss!992))) lt!64013))))

(assert (=> d!37411 (contains!873 lt!63997 lt!64013)))

(assert (=> d!37411 (= (addStillContains!86 lt!63997 lt!64003 (zeroValue!2629 (v!3108 (underlying!436 thiss!992))) lt!64013) lt!64382)))

(declare-fun bs!5161 () Bool)

(assert (= bs!5161 d!37411))

(assert (=> bs!5161 m!144509))

(assert (=> bs!5161 m!144509))

(assert (=> bs!5161 m!144523))

(declare-fun m!145081 () Bool)

(assert (=> bs!5161 m!145081))

(declare-fun m!145083 () Bool)

(assert (=> bs!5161 m!145083))

(assert (=> b!124500 d!37411))

(declare-fun d!37413 () Bool)

(declare-fun e!81665 () Bool)

(assert (=> d!37413 e!81665))

(declare-fun res!60549 () Bool)

(assert (=> d!37413 (=> res!60549 e!81665)))

(declare-fun lt!64385 () Bool)

(assert (=> d!37413 (= res!60549 (not lt!64385))))

(declare-fun lt!64386 () Bool)

(assert (=> d!37413 (= lt!64385 lt!64386)))

(declare-fun lt!64383 () Unit!3867)

(declare-fun e!81666 () Unit!3867)

(assert (=> d!37413 (= lt!64383 e!81666)))

(declare-fun c!22729 () Bool)

(assert (=> d!37413 (= c!22729 lt!64386)))

(assert (=> d!37413 (= lt!64386 (containsKey!170 (toList!854 e!81464) (ite c!22647 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355) (select (arr!2219 (_keys!4493 newMap!16)) (index!3231 lt!64093)))))))

(assert (=> d!37413 (= (contains!873 e!81464 (ite c!22647 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355) (select (arr!2219 (_keys!4493 newMap!16)) (index!3231 lt!64093)))) lt!64385)))

(declare-fun b!124967 () Bool)

(declare-fun lt!64384 () Unit!3867)

(assert (=> b!124967 (= e!81666 lt!64384)))

(assert (=> b!124967 (= lt!64384 (lemmaContainsKeyImpliesGetValueByKeyDefined!118 (toList!854 e!81464) (ite c!22647 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355) (select (arr!2219 (_keys!4493 newMap!16)) (index!3231 lt!64093)))))))

(assert (=> b!124967 (isDefined!119 (getValueByKey!166 (toList!854 e!81464) (ite c!22647 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355) (select (arr!2219 (_keys!4493 newMap!16)) (index!3231 lt!64093)))))))

(declare-fun b!124968 () Bool)

(declare-fun Unit!3883 () Unit!3867)

(assert (=> b!124968 (= e!81666 Unit!3883)))

(declare-fun b!124969 () Bool)

(assert (=> b!124969 (= e!81665 (isDefined!119 (getValueByKey!166 (toList!854 e!81464) (ite c!22647 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355) (select (arr!2219 (_keys!4493 newMap!16)) (index!3231 lt!64093))))))))

(assert (= (and d!37413 c!22729) b!124967))

(assert (= (and d!37413 (not c!22729)) b!124968))

(assert (= (and d!37413 (not res!60549)) b!124969))

(declare-fun m!145085 () Bool)

(assert (=> d!37413 m!145085))

(declare-fun m!145087 () Bool)

(assert (=> b!124967 m!145087))

(declare-fun m!145089 () Bool)

(assert (=> b!124967 m!145089))

(assert (=> b!124967 m!145089))

(declare-fun m!145091 () Bool)

(assert (=> b!124967 m!145091))

(assert (=> b!124969 m!145089))

(assert (=> b!124969 m!145089))

(assert (=> b!124969 m!145091))

(assert (=> bm!13322 d!37413))

(declare-fun d!37415 () Bool)

(declare-fun e!81667 () Bool)

(assert (=> d!37415 e!81667))

(declare-fun res!60550 () Bool)

(assert (=> d!37415 (=> res!60550 e!81667)))

(declare-fun lt!64389 () Bool)

(assert (=> d!37415 (= res!60550 (not lt!64389))))

(declare-fun lt!64390 () Bool)

(assert (=> d!37415 (= lt!64389 lt!64390)))

(declare-fun lt!64387 () Unit!3867)

(declare-fun e!81668 () Unit!3867)

(assert (=> d!37415 (= lt!64387 e!81668)))

(declare-fun c!22730 () Bool)

(assert (=> d!37415 (= c!22730 lt!64390)))

(assert (=> d!37415 (= lt!64390 (containsKey!170 (toList!854 lt!64012) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!37415 (= (contains!873 lt!64012 #b0000000000000000000000000000000000000000000000000000000000000000) lt!64389)))

(declare-fun b!124970 () Bool)

(declare-fun lt!64388 () Unit!3867)

(assert (=> b!124970 (= e!81668 lt!64388)))

(assert (=> b!124970 (= lt!64388 (lemmaContainsKeyImpliesGetValueByKeyDefined!118 (toList!854 lt!64012) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!124970 (isDefined!119 (getValueByKey!166 (toList!854 lt!64012) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!124971 () Bool)

(declare-fun Unit!3884 () Unit!3867)

(assert (=> b!124971 (= e!81668 Unit!3884)))

(declare-fun b!124972 () Bool)

(assert (=> b!124972 (= e!81667 (isDefined!119 (getValueByKey!166 (toList!854 lt!64012) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!37415 c!22730) b!124970))

(assert (= (and d!37415 (not c!22730)) b!124971))

(assert (= (and d!37415 (not res!60550)) b!124972))

(declare-fun m!145093 () Bool)

(assert (=> d!37415 m!145093))

(declare-fun m!145095 () Bool)

(assert (=> b!124970 m!145095))

(declare-fun m!145097 () Bool)

(assert (=> b!124970 m!145097))

(assert (=> b!124970 m!145097))

(declare-fun m!145099 () Bool)

(assert (=> b!124970 m!145099))

(assert (=> b!124972 m!145097))

(assert (=> b!124972 m!145097))

(assert (=> b!124972 m!145099))

(assert (=> bm!13263 d!37415))

(assert (=> d!37299 d!37307))

(declare-fun bm!13382 () Bool)

(declare-fun call!13385 () ListLongMap!1677)

(assert (=> bm!13382 (= call!13385 (getCurrentListMapNoExtraKeys!135 (_keys!4493 newMap!16) (ite c!22645 (_values!2747 newMap!16) lt!64109) (mask!7010 newMap!16) (ite (and c!22645 c!22640) lt!64087 (extraKeys!2549 newMap!16)) (ite (and c!22645 c!22640) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2629 newMap!16)) (minValue!2629 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2764 newMap!16)))))

(declare-fun call!13386 () ListLongMap!1677)

(declare-fun call!13391 () ListLongMap!1677)

(declare-fun c!22734 () Bool)

(declare-fun bm!13383 () Bool)

(declare-fun call!13387 () ListLongMap!1677)

(declare-fun c!22736 () Bool)

(assert (=> bm!13383 (= call!13391 (+!169 (ite c!22736 call!13385 (ite c!22734 call!13387 call!13386)) (ite (or c!22736 c!22734) (tuple2!2569 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (and c!22645 c!22640) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2629 newMap!16))) (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2629 newMap!16)))))))

(declare-fun bm!13384 () Bool)

(assert (=> bm!13384 (= call!13387 call!13385)))

(declare-fun b!124974 () Bool)

(declare-fun e!81672 () ListLongMap!1677)

(declare-fun call!13390 () ListLongMap!1677)

(assert (=> b!124974 (= e!81672 call!13390)))

(declare-fun b!124975 () Bool)

(declare-fun e!81677 () ListLongMap!1677)

(assert (=> b!124975 (= e!81677 call!13386)))

(declare-fun b!124976 () Bool)

(declare-fun e!81679 () ListLongMap!1677)

(assert (=> b!124976 (= e!81679 e!81672)))

(assert (=> b!124976 (= c!22734 (and (not (= (bvand (ite (and c!22645 c!22640) lt!64087 (extraKeys!2549 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (ite (and c!22645 c!22640) lt!64087 (extraKeys!2549 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!124977 () Bool)

(declare-fun e!81680 () Bool)

(declare-fun call!13389 () Bool)

(assert (=> b!124977 (= e!81680 (not call!13389))))

(declare-fun b!124978 () Bool)

(declare-fun e!81675 () Bool)

(declare-fun e!81678 () Bool)

(assert (=> b!124978 (= e!81675 e!81678)))

(declare-fun res!60559 () Bool)

(assert (=> b!124978 (=> (not res!60559) (not e!81678))))

(declare-fun lt!64406 () ListLongMap!1677)

(assert (=> b!124978 (= res!60559 (contains!873 lt!64406 (select (arr!2219 (_keys!4493 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!124978 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2482 (_keys!4493 newMap!16))))))

(declare-fun bm!13385 () Bool)

(assert (=> bm!13385 (= call!13386 call!13387)))

(declare-fun b!124979 () Bool)

(declare-fun e!81676 () Bool)

(declare-fun call!13388 () Bool)

(assert (=> b!124979 (= e!81676 (not call!13388))))

(declare-fun b!124980 () Bool)

(declare-fun e!81674 () Unit!3867)

(declare-fun Unit!3885 () Unit!3867)

(assert (=> b!124980 (= e!81674 Unit!3885)))

(declare-fun b!124981 () Bool)

(declare-fun e!81669 () Bool)

(assert (=> b!124981 (= e!81669 (validKeyInArray!0 (select (arr!2219 (_keys!4493 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!124982 () Bool)

(declare-fun e!81670 () Bool)

(assert (=> b!124982 (= e!81676 e!81670)))

(declare-fun res!60552 () Bool)

(assert (=> b!124982 (= res!60552 call!13388)))

(assert (=> b!124982 (=> (not res!60552) (not e!81670))))

(declare-fun b!124983 () Bool)

(declare-fun lt!64402 () Unit!3867)

(assert (=> b!124983 (= e!81674 lt!64402)))

(declare-fun lt!64391 () ListLongMap!1677)

(assert (=> b!124983 (= lt!64391 (getCurrentListMapNoExtraKeys!135 (_keys!4493 newMap!16) (ite c!22645 (_values!2747 newMap!16) lt!64109) (mask!7010 newMap!16) (ite (and c!22645 c!22640) lt!64087 (extraKeys!2549 newMap!16)) (ite (and c!22645 c!22640) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2629 newMap!16)) (minValue!2629 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2764 newMap!16)))))

(declare-fun lt!64397 () (_ BitVec 64))

(assert (=> b!124983 (= lt!64397 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!64407 () (_ BitVec 64))

(assert (=> b!124983 (= lt!64407 (select (arr!2219 (_keys!4493 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!64392 () Unit!3867)

(assert (=> b!124983 (= lt!64392 (addStillContains!86 lt!64391 lt!64397 (ite (and c!22645 c!22640) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2629 newMap!16)) lt!64407))))

(assert (=> b!124983 (contains!873 (+!169 lt!64391 (tuple2!2569 lt!64397 (ite (and c!22645 c!22640) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2629 newMap!16)))) lt!64407)))

(declare-fun lt!64409 () Unit!3867)

(assert (=> b!124983 (= lt!64409 lt!64392)))

(declare-fun lt!64410 () ListLongMap!1677)

(assert (=> b!124983 (= lt!64410 (getCurrentListMapNoExtraKeys!135 (_keys!4493 newMap!16) (ite c!22645 (_values!2747 newMap!16) lt!64109) (mask!7010 newMap!16) (ite (and c!22645 c!22640) lt!64087 (extraKeys!2549 newMap!16)) (ite (and c!22645 c!22640) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2629 newMap!16)) (minValue!2629 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2764 newMap!16)))))

(declare-fun lt!64393 () (_ BitVec 64))

(assert (=> b!124983 (= lt!64393 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!64405 () (_ BitVec 64))

(assert (=> b!124983 (= lt!64405 (select (arr!2219 (_keys!4493 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!64403 () Unit!3867)

(assert (=> b!124983 (= lt!64403 (addApplyDifferent!86 lt!64410 lt!64393 (minValue!2629 newMap!16) lt!64405))))

(assert (=> b!124983 (= (apply!110 (+!169 lt!64410 (tuple2!2569 lt!64393 (minValue!2629 newMap!16))) lt!64405) (apply!110 lt!64410 lt!64405))))

(declare-fun lt!64408 () Unit!3867)

(assert (=> b!124983 (= lt!64408 lt!64403)))

(declare-fun lt!64401 () ListLongMap!1677)

(assert (=> b!124983 (= lt!64401 (getCurrentListMapNoExtraKeys!135 (_keys!4493 newMap!16) (ite c!22645 (_values!2747 newMap!16) lt!64109) (mask!7010 newMap!16) (ite (and c!22645 c!22640) lt!64087 (extraKeys!2549 newMap!16)) (ite (and c!22645 c!22640) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2629 newMap!16)) (minValue!2629 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2764 newMap!16)))))

(declare-fun lt!64411 () (_ BitVec 64))

(assert (=> b!124983 (= lt!64411 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!64399 () (_ BitVec 64))

(assert (=> b!124983 (= lt!64399 (select (arr!2219 (_keys!4493 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!64412 () Unit!3867)

(assert (=> b!124983 (= lt!64412 (addApplyDifferent!86 lt!64401 lt!64411 (ite (and c!22645 c!22640) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2629 newMap!16)) lt!64399))))

(assert (=> b!124983 (= (apply!110 (+!169 lt!64401 (tuple2!2569 lt!64411 (ite (and c!22645 c!22640) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2629 newMap!16)))) lt!64399) (apply!110 lt!64401 lt!64399))))

(declare-fun lt!64404 () Unit!3867)

(assert (=> b!124983 (= lt!64404 lt!64412)))

(declare-fun lt!64398 () ListLongMap!1677)

(assert (=> b!124983 (= lt!64398 (getCurrentListMapNoExtraKeys!135 (_keys!4493 newMap!16) (ite c!22645 (_values!2747 newMap!16) lt!64109) (mask!7010 newMap!16) (ite (and c!22645 c!22640) lt!64087 (extraKeys!2549 newMap!16)) (ite (and c!22645 c!22640) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2629 newMap!16)) (minValue!2629 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2764 newMap!16)))))

(declare-fun lt!64395 () (_ BitVec 64))

(assert (=> b!124983 (= lt!64395 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!64396 () (_ BitVec 64))

(assert (=> b!124983 (= lt!64396 (select (arr!2219 (_keys!4493 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!124983 (= lt!64402 (addApplyDifferent!86 lt!64398 lt!64395 (minValue!2629 newMap!16) lt!64396))))

(assert (=> b!124983 (= (apply!110 (+!169 lt!64398 (tuple2!2569 lt!64395 (minValue!2629 newMap!16))) lt!64396) (apply!110 lt!64398 lt!64396))))

(declare-fun b!124984 () Bool)

(declare-fun res!60557 () Bool)

(declare-fun e!81673 () Bool)

(assert (=> b!124984 (=> (not res!60557) (not e!81673))))

(assert (=> b!124984 (= res!60557 e!81676)))

(declare-fun c!22732 () Bool)

(assert (=> b!124984 (= c!22732 (not (= (bvand (ite (and c!22645 c!22640) lt!64087 (extraKeys!2549 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun c!22735 () Bool)

(declare-fun b!124985 () Bool)

(assert (=> b!124985 (= c!22735 (and (not (= (bvand (ite (and c!22645 c!22640) lt!64087 (extraKeys!2549 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (ite (and c!22645 c!22640) lt!64087 (extraKeys!2549 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!124985 (= e!81672 e!81677)))

(declare-fun b!124986 () Bool)

(assert (=> b!124986 (= e!81670 (= (apply!110 lt!64406 #b0000000000000000000000000000000000000000000000000000000000000000) (ite (and c!22645 c!22640) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2629 newMap!16))))))

(declare-fun bm!13386 () Bool)

(assert (=> bm!13386 (= call!13388 (contains!873 lt!64406 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!124987 () Bool)

(assert (=> b!124987 (= e!81679 (+!169 call!13391 (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2629 newMap!16))))))

(declare-fun b!124973 () Bool)

(assert (=> b!124973 (= e!81678 (= (apply!110 lt!64406 (select (arr!2219 (_keys!4493 newMap!16)) #b00000000000000000000000000000000)) (get!1436 (select (arr!2220 (ite c!22645 (_values!2747 newMap!16) lt!64109)) #b00000000000000000000000000000000) (dynLambda!411 (defaultEntry!2764 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!124973 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2483 (ite c!22645 (_values!2747 newMap!16) lt!64109))))))

(assert (=> b!124973 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2482 (_keys!4493 newMap!16))))))

(declare-fun d!37417 () Bool)

(assert (=> d!37417 e!81673))

(declare-fun res!60553 () Bool)

(assert (=> d!37417 (=> (not res!60553) (not e!81673))))

(assert (=> d!37417 (= res!60553 (or (bvsge #b00000000000000000000000000000000 (size!2482 (_keys!4493 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2482 (_keys!4493 newMap!16))))))))

(declare-fun lt!64394 () ListLongMap!1677)

(assert (=> d!37417 (= lt!64406 lt!64394)))

(declare-fun lt!64400 () Unit!3867)

(assert (=> d!37417 (= lt!64400 e!81674)))

(declare-fun c!22733 () Bool)

(declare-fun e!81671 () Bool)

(assert (=> d!37417 (= c!22733 e!81671)))

(declare-fun res!60554 () Bool)

(assert (=> d!37417 (=> (not res!60554) (not e!81671))))

(assert (=> d!37417 (= res!60554 (bvslt #b00000000000000000000000000000000 (size!2482 (_keys!4493 newMap!16))))))

(assert (=> d!37417 (= lt!64394 e!81679)))

(assert (=> d!37417 (= c!22736 (and (not (= (bvand (ite (and c!22645 c!22640) lt!64087 (extraKeys!2549 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (ite (and c!22645 c!22640) lt!64087 (extraKeys!2549 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!37417 (validMask!0 (mask!7010 newMap!16))))

(assert (=> d!37417 (= (getCurrentListMap!535 (_keys!4493 newMap!16) (ite c!22645 (_values!2747 newMap!16) lt!64109) (mask!7010 newMap!16) (ite (and c!22645 c!22640) lt!64087 (extraKeys!2549 newMap!16)) (ite (and c!22645 c!22640) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2629 newMap!16)) (minValue!2629 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2764 newMap!16)) lt!64406)))

(declare-fun bm!13387 () Bool)

(assert (=> bm!13387 (= call!13390 call!13391)))

(declare-fun b!124988 () Bool)

(assert (=> b!124988 (= e!81673 e!81680)))

(declare-fun c!22731 () Bool)

(assert (=> b!124988 (= c!22731 (not (= (bvand (ite (and c!22645 c!22640) lt!64087 (extraKeys!2549 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!13388 () Bool)

(assert (=> bm!13388 (= call!13389 (contains!873 lt!64406 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!124989 () Bool)

(assert (=> b!124989 (= e!81671 (validKeyInArray!0 (select (arr!2219 (_keys!4493 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!124990 () Bool)

(declare-fun e!81681 () Bool)

(assert (=> b!124990 (= e!81680 e!81681)))

(declare-fun res!60558 () Bool)

(assert (=> b!124990 (= res!60558 call!13389)))

(assert (=> b!124990 (=> (not res!60558) (not e!81681))))

(declare-fun b!124991 () Bool)

(declare-fun res!60555 () Bool)

(assert (=> b!124991 (=> (not res!60555) (not e!81673))))

(assert (=> b!124991 (= res!60555 e!81675)))

(declare-fun res!60551 () Bool)

(assert (=> b!124991 (=> res!60551 e!81675)))

(assert (=> b!124991 (= res!60551 (not e!81669))))

(declare-fun res!60556 () Bool)

(assert (=> b!124991 (=> (not res!60556) (not e!81669))))

(assert (=> b!124991 (= res!60556 (bvslt #b00000000000000000000000000000000 (size!2482 (_keys!4493 newMap!16))))))

(declare-fun b!124992 () Bool)

(assert (=> b!124992 (= e!81677 call!13390)))

(declare-fun b!124993 () Bool)

(assert (=> b!124993 (= e!81681 (= (apply!110 lt!64406 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2629 newMap!16)))))

(assert (= (and d!37417 c!22736) b!124987))

(assert (= (and d!37417 (not c!22736)) b!124976))

(assert (= (and b!124976 c!22734) b!124974))

(assert (= (and b!124976 (not c!22734)) b!124985))

(assert (= (and b!124985 c!22735) b!124992))

(assert (= (and b!124985 (not c!22735)) b!124975))

(assert (= (or b!124992 b!124975) bm!13385))

(assert (= (or b!124974 bm!13385) bm!13384))

(assert (= (or b!124974 b!124992) bm!13387))

(assert (= (or b!124987 bm!13384) bm!13382))

(assert (= (or b!124987 bm!13387) bm!13383))

(assert (= (and d!37417 res!60554) b!124989))

(assert (= (and d!37417 c!22733) b!124983))

(assert (= (and d!37417 (not c!22733)) b!124980))

(assert (= (and d!37417 res!60553) b!124991))

(assert (= (and b!124991 res!60556) b!124981))

(assert (= (and b!124991 (not res!60551)) b!124978))

(assert (= (and b!124978 res!60559) b!124973))

(assert (= (and b!124991 res!60555) b!124984))

(assert (= (and b!124984 c!22732) b!124982))

(assert (= (and b!124984 (not c!22732)) b!124979))

(assert (= (and b!124982 res!60552) b!124986))

(assert (= (or b!124982 b!124979) bm!13386))

(assert (= (and b!124984 res!60557) b!124988))

(assert (= (and b!124988 c!22731) b!124990))

(assert (= (and b!124988 (not c!22731)) b!124977))

(assert (= (and b!124990 res!60558) b!124993))

(assert (= (or b!124990 b!124977) bm!13388))

(declare-fun b_lambda!5477 () Bool)

(assert (=> (not b_lambda!5477) (not b!124973)))

(assert (=> b!124973 t!6029))

(declare-fun b_and!7679 () Bool)

(assert (= b_and!7675 (and (=> t!6029 result!3819) b_and!7679)))

(assert (=> b!124973 t!6031))

(declare-fun b_and!7681 () Bool)

(assert (= b_and!7677 (and (=> t!6031 result!3821) b_and!7681)))

(assert (=> b!124989 m!144619))

(assert (=> b!124989 m!144619))

(assert (=> b!124989 m!144629))

(declare-fun m!145101 () Bool)

(assert (=> b!124973 m!145101))

(assert (=> b!124973 m!144721))

(declare-fun m!145103 () Bool)

(assert (=> b!124973 m!145103))

(assert (=> b!124973 m!144619))

(assert (=> b!124973 m!144721))

(assert (=> b!124973 m!144619))

(declare-fun m!145105 () Bool)

(assert (=> b!124973 m!145105))

(assert (=> b!124973 m!145101))

(assert (=> b!124981 m!144619))

(assert (=> b!124981 m!144619))

(assert (=> b!124981 m!144629))

(declare-fun m!145107 () Bool)

(assert (=> b!124983 m!145107))

(declare-fun m!145109 () Bool)

(assert (=> b!124983 m!145109))

(declare-fun m!145111 () Bool)

(assert (=> b!124983 m!145111))

(declare-fun m!145113 () Bool)

(assert (=> b!124983 m!145113))

(assert (=> b!124983 m!144619))

(declare-fun m!145115 () Bool)

(assert (=> b!124983 m!145115))

(declare-fun m!145117 () Bool)

(assert (=> b!124983 m!145117))

(declare-fun m!145119 () Bool)

(assert (=> b!124983 m!145119))

(assert (=> b!124983 m!145119))

(declare-fun m!145121 () Bool)

(assert (=> b!124983 m!145121))

(declare-fun m!145123 () Bool)

(assert (=> b!124983 m!145123))

(declare-fun m!145125 () Bool)

(assert (=> b!124983 m!145125))

(assert (=> b!124983 m!145113))

(declare-fun m!145127 () Bool)

(assert (=> b!124983 m!145127))

(declare-fun m!145129 () Bool)

(assert (=> b!124983 m!145129))

(declare-fun m!145131 () Bool)

(assert (=> b!124983 m!145131))

(declare-fun m!145133 () Bool)

(assert (=> b!124983 m!145133))

(assert (=> b!124983 m!145123))

(declare-fun m!145135 () Bool)

(assert (=> b!124983 m!145135))

(assert (=> b!124983 m!145109))

(declare-fun m!145137 () Bool)

(assert (=> b!124983 m!145137))

(assert (=> b!124978 m!144619))

(assert (=> b!124978 m!144619))

(declare-fun m!145139 () Bool)

(assert (=> b!124978 m!145139))

(declare-fun m!145141 () Bool)

(assert (=> b!124987 m!145141))

(declare-fun m!145143 () Bool)

(assert (=> b!124993 m!145143))

(declare-fun m!145145 () Bool)

(assert (=> bm!13386 m!145145))

(assert (=> bm!13382 m!145135))

(declare-fun m!145147 () Bool)

(assert (=> bm!13388 m!145147))

(declare-fun m!145149 () Bool)

(assert (=> b!124986 m!145149))

(declare-fun m!145151 () Bool)

(assert (=> bm!13383 m!145151))

(assert (=> d!37417 m!144633))

(assert (=> bm!13321 d!37417))

(declare-fun d!37419 () Bool)

(assert (=> d!37419 (= (apply!110 lt!64012 #b0000000000000000000000000000000000000000000000000000000000000000) (get!1439 (getValueByKey!166 (toList!854 lt!64012) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!5162 () Bool)

(assert (= bs!5162 d!37419))

(assert (=> bs!5162 m!145097))

(assert (=> bs!5162 m!145097))

(declare-fun m!145153 () Bool)

(assert (=> bs!5162 m!145153))

(assert (=> b!124503 d!37419))

(declare-fun d!37421 () Bool)

(declare-fun res!60564 () Bool)

(declare-fun e!81686 () Bool)

(assert (=> d!37421 (=> res!60564 e!81686)))

(assert (=> d!37421 (= res!60564 (= (select (arr!2219 (_keys!4493 newMap!16)) #b00000000000000000000000000000000) (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355)))))

(assert (=> d!37421 (= (arrayContainsKey!0 (_keys!4493 newMap!16) (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355) #b00000000000000000000000000000000) e!81686)))

(declare-fun b!124998 () Bool)

(declare-fun e!81687 () Bool)

(assert (=> b!124998 (= e!81686 e!81687)))

(declare-fun res!60565 () Bool)

(assert (=> b!124998 (=> (not res!60565) (not e!81687))))

(assert (=> b!124998 (= res!60565 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2482 (_keys!4493 newMap!16))))))

(declare-fun b!124999 () Bool)

(assert (=> b!124999 (= e!81687 (arrayContainsKey!0 (_keys!4493 newMap!16) (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!37421 (not res!60564)) b!124998))

(assert (= (and b!124998 res!60565) b!124999))

(assert (=> d!37421 m!144619))

(assert (=> b!124999 m!144415))

(declare-fun m!145155 () Bool)

(assert (=> b!124999 m!145155))

(assert (=> bm!13334 d!37421))

(declare-fun mapIsEmpty!4485 () Bool)

(declare-fun mapRes!4485 () Bool)

(assert (=> mapIsEmpty!4485 mapRes!4485))

(declare-fun b!125001 () Bool)

(declare-fun e!81689 () Bool)

(assert (=> b!125001 (= e!81689 tp_is_empty!2835)))

(declare-fun mapNonEmpty!4485 () Bool)

(declare-fun tp!10929 () Bool)

(declare-fun e!81688 () Bool)

(assert (=> mapNonEmpty!4485 (= mapRes!4485 (and tp!10929 e!81688))))

(declare-fun mapRest!4485 () (Array (_ BitVec 32) ValueCell!1074))

(declare-fun mapValue!4485 () ValueCell!1074)

(declare-fun mapKey!4485 () (_ BitVec 32))

(assert (=> mapNonEmpty!4485 (= mapRest!4484 (store mapRest!4485 mapKey!4485 mapValue!4485))))

(declare-fun condMapEmpty!4485 () Bool)

(declare-fun mapDefault!4485 () ValueCell!1074)

(assert (=> mapNonEmpty!4484 (= condMapEmpty!4485 (= mapRest!4484 ((as const (Array (_ BitVec 32) ValueCell!1074)) mapDefault!4485)))))

(assert (=> mapNonEmpty!4484 (= tp!10928 (and e!81689 mapRes!4485))))

(declare-fun b!125000 () Bool)

(assert (=> b!125000 (= e!81688 tp_is_empty!2835)))

(assert (= (and mapNonEmpty!4484 condMapEmpty!4485) mapIsEmpty!4485))

(assert (= (and mapNonEmpty!4484 (not condMapEmpty!4485)) mapNonEmpty!4485))

(assert (= (and mapNonEmpty!4485 ((_ is ValueCellFull!1074) mapValue!4485)) b!125000))

(assert (= (and mapNonEmpty!4484 ((_ is ValueCellFull!1074) mapDefault!4485)) b!125001))

(declare-fun m!145157 () Bool)

(assert (=> mapNonEmpty!4485 m!145157))

(declare-fun mapIsEmpty!4486 () Bool)

(declare-fun mapRes!4486 () Bool)

(assert (=> mapIsEmpty!4486 mapRes!4486))

(declare-fun b!125003 () Bool)

(declare-fun e!81691 () Bool)

(assert (=> b!125003 (= e!81691 tp_is_empty!2835)))

(declare-fun mapNonEmpty!4486 () Bool)

(declare-fun tp!10930 () Bool)

(declare-fun e!81690 () Bool)

(assert (=> mapNonEmpty!4486 (= mapRes!4486 (and tp!10930 e!81690))))

(declare-fun mapKey!4486 () (_ BitVec 32))

(declare-fun mapValue!4486 () ValueCell!1074)

(declare-fun mapRest!4486 () (Array (_ BitVec 32) ValueCell!1074))

(assert (=> mapNonEmpty!4486 (= mapRest!4483 (store mapRest!4486 mapKey!4486 mapValue!4486))))

(declare-fun condMapEmpty!4486 () Bool)

(declare-fun mapDefault!4486 () ValueCell!1074)

(assert (=> mapNonEmpty!4483 (= condMapEmpty!4486 (= mapRest!4483 ((as const (Array (_ BitVec 32) ValueCell!1074)) mapDefault!4486)))))

(assert (=> mapNonEmpty!4483 (= tp!10927 (and e!81691 mapRes!4486))))

(declare-fun b!125002 () Bool)

(assert (=> b!125002 (= e!81690 tp_is_empty!2835)))

(assert (= (and mapNonEmpty!4483 condMapEmpty!4486) mapIsEmpty!4486))

(assert (= (and mapNonEmpty!4483 (not condMapEmpty!4486)) mapNonEmpty!4486))

(assert (= (and mapNonEmpty!4486 ((_ is ValueCellFull!1074) mapValue!4486)) b!125002))

(assert (= (and mapNonEmpty!4483 ((_ is ValueCellFull!1074) mapDefault!4486)) b!125003))

(declare-fun m!145159 () Bool)

(assert (=> mapNonEmpty!4486 m!145159))

(declare-fun b_lambda!5479 () Bool)

(assert (= b_lambda!5475 (or (and b!124369 b_free!2837 (= (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) (defaultEntry!2764 newMap!16))) (and b!124375 b_free!2839) b_lambda!5479)))

(declare-fun b_lambda!5481 () Bool)

(assert (= b_lambda!5471 (or (and b!124369 b_free!2837) (and b!124375 b_free!2839 (= (defaultEntry!2764 newMap!16) (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))))) b_lambda!5481)))

(declare-fun b_lambda!5483 () Bool)

(assert (= b_lambda!5469 (or (and b!124369 b_free!2837 (= (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) (defaultEntry!2764 newMap!16))) (and b!124375 b_free!2839) b_lambda!5483)))

(declare-fun b_lambda!5485 () Bool)

(assert (= b_lambda!5473 (or (and b!124369 b_free!2837) (and b!124375 b_free!2839 (= (defaultEntry!2764 newMap!16) (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))))) b_lambda!5485)))

(declare-fun b_lambda!5487 () Bool)

(assert (= b_lambda!5477 (or (and b!124369 b_free!2837 (= (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) (defaultEntry!2764 newMap!16))) (and b!124375 b_free!2839) b_lambda!5487)))

(check-sat (not b!124965) (not b!124958) (not d!37415) (not b!124764) (not d!37319) (not b!124791) (not b!124973) (not b!124912) (not b_lambda!5485) (not b!124742) (not d!37331) (not bm!13362) (not bm!13371) (not b!124775) (not bm!13388) (not b!124959) (not b!124942) (not b!124950) (not b!124960) (not b_lambda!5467) (not d!37413) (not b!124717) (not b!124933) (not b!124780) (not b!124789) (not b!124710) (not d!37395) (not b!124913) (not d!37355) (not d!37409) (not d!37391) (not d!37399) (not d!37333) (not b!124972) (not b!124808) (not bm!13382) (not b!124939) (not d!37379) (not b_next!2837) (not b!124941) (not b!124849) (not b!124918) (not d!37321) (not b!124842) (not b!124949) (not d!37315) (not d!37335) (not b!124841) (not b!124967) (not b!124795) (not b!124906) (not d!37359) (not b!124999) (not d!37365) (not bm!13379) (not b!124772) (not b!124924) (not mapNonEmpty!4486) (not bm!13349) (not b!124673) (not b!124914) (not b!124916) (not b!124905) (not b!124955) (not b!124904) (not b!124711) (not b_lambda!5479) (not bm!13359) (not b!124947) (not b!124698) (not b!124840) (not bm!13375) (not bm!13346) (not b!124915) (not bm!13354) (not bm!13351) (not bm!13386) (not b!124989) (not b_lambda!5463) (not d!37403) (not b!124796) (not d!37417) (not d!37419) (not d!37349) (not d!37393) (not b!124848) (not b!124843) (not b!124978) (not b!124900) (not b_lambda!5483) (not d!37351) (not bm!13345) (not b!124987) (not b!124815) (not bm!13372) (not b!124983) (not d!37347) (not b!124964) (not b!124981) (not d!37327) (not b_lambda!5487) (not d!37411) tp_is_empty!2835 (not b!124935) (not b!124850) (not b!124890) (not b!124896) (not b!124762) (not b!124891) (not d!37341) (not d!37369) (not b!124771) (not b!124993) (not bm!13356) (not b!124670) (not d!37367) (not b!124919) (not d!37377) (not b!124932) (not b!124721) (not d!37375) (not d!37405) (not b!124809) (not b!124774) (not b!124783) (not bm!13381) (not d!37401) (not b!124797) (not b_next!2839) (not b!124811) (not b!124929) (not bm!13350) (not b!124969) (not b!124732) (not bm!13340) (not d!37317) (not mapNonEmpty!4485) (not b!124785) (not d!37385) (not d!37397) (not b!124940) (not d!37311) (not b!124927) (not d!37313) (not b!124888) (not b!124970) (not b!124788) (not d!37371) (not b!124894) (not b!124813) (not d!37407) (not b!124962) (not b!124765) (not d!37361) (not d!37339) (not b!124986) (not b!124845) (not d!37337) (not d!37353) (not bm!13373) (not bm!13376) (not b!124768) (not d!37387) (not b!124903) (not d!37389) (not b!124718) (not d!37383) (not bm!13383) b_and!7679 (not b!124956) (not b!124700) (not b_lambda!5481) b_and!7681)
(check-sat b_and!7679 b_and!7681 (not b_next!2837) (not b_next!2839))
(get-model)

(declare-fun b!125004 () Bool)

(declare-fun e!81694 () Bool)

(declare-fun e!81692 () Bool)

(assert (=> b!125004 (= e!81694 e!81692)))

(declare-fun lt!64415 () (_ BitVec 64))

(assert (=> b!125004 (= lt!64415 (select (arr!2219 (_keys!4493 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!64414 () Unit!3867)

(assert (=> b!125004 (= lt!64414 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!4493 newMap!16) lt!64415 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!125004 (arrayContainsKey!0 (_keys!4493 newMap!16) lt!64415 #b00000000000000000000000000000000)))

(declare-fun lt!64413 () Unit!3867)

(assert (=> b!125004 (= lt!64413 lt!64414)))

(declare-fun res!60566 () Bool)

(assert (=> b!125004 (= res!60566 (= (seekEntryOrOpen!0 (select (arr!2219 (_keys!4493 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (_keys!4493 newMap!16) (mask!7010 newMap!16)) (Found!269 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!125004 (=> (not res!60566) (not e!81692))))

(declare-fun b!125005 () Bool)

(declare-fun call!13392 () Bool)

(assert (=> b!125005 (= e!81692 call!13392)))

(declare-fun d!37423 () Bool)

(declare-fun res!60567 () Bool)

(declare-fun e!81693 () Bool)

(assert (=> d!37423 (=> res!60567 e!81693)))

(assert (=> d!37423 (= res!60567 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2482 (_keys!4493 newMap!16))))))

(assert (=> d!37423 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!4493 newMap!16) (mask!7010 newMap!16)) e!81693)))

(declare-fun bm!13389 () Bool)

(assert (=> bm!13389 (= call!13392 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (_keys!4493 newMap!16) (mask!7010 newMap!16)))))

(declare-fun b!125006 () Bool)

(assert (=> b!125006 (= e!81694 call!13392)))

(declare-fun b!125007 () Bool)

(assert (=> b!125007 (= e!81693 e!81694)))

(declare-fun c!22737 () Bool)

(assert (=> b!125007 (= c!22737 (validKeyInArray!0 (select (arr!2219 (_keys!4493 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!37423 (not res!60567)) b!125007))

(assert (= (and b!125007 c!22737) b!125004))

(assert (= (and b!125007 (not c!22737)) b!125006))

(assert (= (and b!125004 res!60566) b!125005))

(assert (= (or b!125005 b!125006) bm!13389))

(declare-fun m!145161 () Bool)

(assert (=> b!125004 m!145161))

(declare-fun m!145163 () Bool)

(assert (=> b!125004 m!145163))

(declare-fun m!145165 () Bool)

(assert (=> b!125004 m!145165))

(assert (=> b!125004 m!145161))

(declare-fun m!145167 () Bool)

(assert (=> b!125004 m!145167))

(declare-fun m!145169 () Bool)

(assert (=> bm!13389 m!145169))

(assert (=> b!125007 m!145161))

(assert (=> b!125007 m!145161))

(declare-fun m!145171 () Bool)

(assert (=> b!125007 m!145171))

(assert (=> bm!13340 d!37423))

(declare-fun d!37425 () Bool)

(assert (=> d!37425 (= (get!1439 (getValueByKey!166 (toList!854 lt!64016) lt!64011)) (v!3112 (getValueByKey!166 (toList!854 lt!64016) lt!64011)))))

(assert (=> d!37383 d!37425))

(declare-fun d!37427 () Bool)

(declare-fun c!22738 () Bool)

(assert (=> d!37427 (= c!22738 (and ((_ is Cons!1691) (toList!854 lt!64016)) (= (_1!1295 (h!2292 (toList!854 lt!64016))) lt!64011)))))

(declare-fun e!81695 () Option!172)

(assert (=> d!37427 (= (getValueByKey!166 (toList!854 lt!64016) lt!64011) e!81695)))

(declare-fun b!125008 () Bool)

(assert (=> b!125008 (= e!81695 (Some!171 (_2!1295 (h!2292 (toList!854 lt!64016)))))))

(declare-fun b!125010 () Bool)

(declare-fun e!81696 () Option!172)

(assert (=> b!125010 (= e!81696 (getValueByKey!166 (t!6022 (toList!854 lt!64016)) lt!64011))))

(declare-fun b!125011 () Bool)

(assert (=> b!125011 (= e!81696 None!170)))

(declare-fun b!125009 () Bool)

(assert (=> b!125009 (= e!81695 e!81696)))

(declare-fun c!22739 () Bool)

(assert (=> b!125009 (= c!22739 (and ((_ is Cons!1691) (toList!854 lt!64016)) (not (= (_1!1295 (h!2292 (toList!854 lt!64016))) lt!64011))))))

(assert (= (and d!37427 c!22738) b!125008))

(assert (= (and d!37427 (not c!22738)) b!125009))

(assert (= (and b!125009 c!22739) b!125010))

(assert (= (and b!125009 (not c!22739)) b!125011))

(declare-fun m!145173 () Bool)

(assert (=> b!125010 m!145173))

(assert (=> d!37383 d!37427))

(declare-fun b!125012 () Bool)

(declare-fun res!60568 () Bool)

(declare-fun e!81698 () Bool)

(assert (=> b!125012 (=> (not res!60568) (not e!81698))))

(declare-fun lt!64420 () ListLongMap!1677)

(assert (=> b!125012 (= res!60568 (not (contains!873 lt!64420 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bm!13390 () Bool)

(declare-fun call!13393 () ListLongMap!1677)

(assert (=> bm!13390 (= call!13393 (getCurrentListMapNoExtraKeys!135 (_keys!4493 newMap!16) (_values!2747 newMap!16) (mask!7010 newMap!16) (extraKeys!2549 newMap!16) (zeroValue!2629 newMap!16) (minValue!2629 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!2764 newMap!16)))))

(declare-fun b!125013 () Bool)

(declare-fun e!81697 () Bool)

(declare-fun e!81701 () Bool)

(assert (=> b!125013 (= e!81697 e!81701)))

(assert (=> b!125013 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2482 (_keys!4493 newMap!16))))))

(declare-fun res!60570 () Bool)

(assert (=> b!125013 (= res!60570 (contains!873 lt!64420 (select (arr!2219 (_keys!4493 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!125013 (=> (not res!60570) (not e!81701))))

(declare-fun b!125014 () Bool)

(assert (=> b!125014 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2482 (_keys!4493 newMap!16))))))

(assert (=> b!125014 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2483 (_values!2747 newMap!16))))))

(assert (=> b!125014 (= e!81701 (= (apply!110 lt!64420 (select (arr!2219 (_keys!4493 newMap!16)) #b00000000000000000000000000000000)) (get!1436 (select (arr!2220 (_values!2747 newMap!16)) #b00000000000000000000000000000000) (dynLambda!411 (defaultEntry!2764 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!37429 () Bool)

(assert (=> d!37429 e!81698))

(declare-fun res!60571 () Bool)

(assert (=> d!37429 (=> (not res!60571) (not e!81698))))

(assert (=> d!37429 (= res!60571 (not (contains!873 lt!64420 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!81699 () ListLongMap!1677)

(assert (=> d!37429 (= lt!64420 e!81699)))

(declare-fun c!22740 () Bool)

(assert (=> d!37429 (= c!22740 (bvsge #b00000000000000000000000000000000 (size!2482 (_keys!4493 newMap!16))))))

(assert (=> d!37429 (validMask!0 (mask!7010 newMap!16))))

(assert (=> d!37429 (= (getCurrentListMapNoExtraKeys!135 (_keys!4493 newMap!16) (_values!2747 newMap!16) (mask!7010 newMap!16) (extraKeys!2549 newMap!16) (zeroValue!2629 newMap!16) (minValue!2629 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2764 newMap!16)) lt!64420)))

(declare-fun b!125015 () Bool)

(declare-fun e!81702 () Bool)

(assert (=> b!125015 (= e!81702 (validKeyInArray!0 (select (arr!2219 (_keys!4493 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!125015 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!125016 () Bool)

(assert (=> b!125016 (= e!81698 e!81697)))

(declare-fun c!22743 () Bool)

(assert (=> b!125016 (= c!22743 e!81702)))

(declare-fun res!60569 () Bool)

(assert (=> b!125016 (=> (not res!60569) (not e!81702))))

(assert (=> b!125016 (= res!60569 (bvslt #b00000000000000000000000000000000 (size!2482 (_keys!4493 newMap!16))))))

(declare-fun b!125017 () Bool)

(declare-fun e!81700 () Bool)

(assert (=> b!125017 (= e!81700 (isEmpty!394 lt!64420))))

(declare-fun b!125018 () Bool)

(declare-fun e!81703 () ListLongMap!1677)

(assert (=> b!125018 (= e!81703 call!13393)))

(declare-fun b!125019 () Bool)

(assert (=> b!125019 (= e!81699 (ListLongMap!1678 Nil!1692))))

(declare-fun b!125020 () Bool)

(declare-fun lt!64422 () Unit!3867)

(declare-fun lt!64416 () Unit!3867)

(assert (=> b!125020 (= lt!64422 lt!64416)))

(declare-fun lt!64417 () ListLongMap!1677)

(declare-fun lt!64418 () (_ BitVec 64))

(declare-fun lt!64421 () V!3427)

(declare-fun lt!64419 () (_ BitVec 64))

(assert (=> b!125020 (not (contains!873 (+!169 lt!64417 (tuple2!2569 lt!64418 lt!64421)) lt!64419))))

(assert (=> b!125020 (= lt!64416 (addStillNotContains!55 lt!64417 lt!64418 lt!64421 lt!64419))))

(assert (=> b!125020 (= lt!64419 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!125020 (= lt!64421 (get!1436 (select (arr!2220 (_values!2747 newMap!16)) #b00000000000000000000000000000000) (dynLambda!411 (defaultEntry!2764 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!125020 (= lt!64418 (select (arr!2219 (_keys!4493 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!125020 (= lt!64417 call!13393)))

(assert (=> b!125020 (= e!81703 (+!169 call!13393 (tuple2!2569 (select (arr!2219 (_keys!4493 newMap!16)) #b00000000000000000000000000000000) (get!1436 (select (arr!2220 (_values!2747 newMap!16)) #b00000000000000000000000000000000) (dynLambda!411 (defaultEntry!2764 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!125021 () Bool)

(assert (=> b!125021 (= e!81699 e!81703)))

(declare-fun c!22741 () Bool)

(assert (=> b!125021 (= c!22741 (validKeyInArray!0 (select (arr!2219 (_keys!4493 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!125022 () Bool)

(assert (=> b!125022 (= e!81700 (= lt!64420 (getCurrentListMapNoExtraKeys!135 (_keys!4493 newMap!16) (_values!2747 newMap!16) (mask!7010 newMap!16) (extraKeys!2549 newMap!16) (zeroValue!2629 newMap!16) (minValue!2629 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!2764 newMap!16))))))

(declare-fun b!125023 () Bool)

(assert (=> b!125023 (= e!81697 e!81700)))

(declare-fun c!22742 () Bool)

(assert (=> b!125023 (= c!22742 (bvslt #b00000000000000000000000000000000 (size!2482 (_keys!4493 newMap!16))))))

(assert (= (and d!37429 c!22740) b!125019))

(assert (= (and d!37429 (not c!22740)) b!125021))

(assert (= (and b!125021 c!22741) b!125020))

(assert (= (and b!125021 (not c!22741)) b!125018))

(assert (= (or b!125020 b!125018) bm!13390))

(assert (= (and d!37429 res!60571) b!125012))

(assert (= (and b!125012 res!60568) b!125016))

(assert (= (and b!125016 res!60569) b!125015))

(assert (= (and b!125016 c!22743) b!125013))

(assert (= (and b!125016 (not c!22743)) b!125023))

(assert (= (and b!125013 res!60570) b!125014))

(assert (= (and b!125023 c!22742) b!125022))

(assert (= (and b!125023 (not c!22742)) b!125017))

(declare-fun b_lambda!5489 () Bool)

(assert (=> (not b_lambda!5489) (not b!125014)))

(assert (=> b!125014 t!6029))

(declare-fun b_and!7683 () Bool)

(assert (= b_and!7679 (and (=> t!6029 result!3819) b_and!7683)))

(assert (=> b!125014 t!6031))

(declare-fun b_and!7685 () Bool)

(assert (= b_and!7681 (and (=> t!6031 result!3821) b_and!7685)))

(declare-fun b_lambda!5491 () Bool)

(assert (=> (not b_lambda!5491) (not b!125020)))

(assert (=> b!125020 t!6029))

(declare-fun b_and!7687 () Bool)

(assert (= b_and!7683 (and (=> t!6029 result!3819) b_and!7687)))

(assert (=> b!125020 t!6031))

(declare-fun b_and!7689 () Bool)

(assert (= b_and!7685 (and (=> t!6031 result!3821) b_and!7689)))

(declare-fun m!145175 () Bool)

(assert (=> bm!13390 m!145175))

(assert (=> b!125015 m!144619))

(assert (=> b!125015 m!144619))

(assert (=> b!125015 m!144629))

(assert (=> b!125013 m!144619))

(assert (=> b!125013 m!144619))

(declare-fun m!145177 () Bool)

(assert (=> b!125013 m!145177))

(declare-fun m!145179 () Bool)

(assert (=> b!125017 m!145179))

(assert (=> b!125014 m!144619))

(declare-fun m!145181 () Bool)

(assert (=> b!125014 m!145181))

(assert (=> b!125014 m!144619))

(assert (=> b!125014 m!144721))

(assert (=> b!125014 m!144719))

(assert (=> b!125014 m!144719))

(assert (=> b!125014 m!144721))

(assert (=> b!125014 m!144723))

(declare-fun m!145183 () Bool)

(assert (=> b!125020 m!145183))

(declare-fun m!145185 () Bool)

(assert (=> b!125020 m!145185))

(assert (=> b!125020 m!144719))

(assert (=> b!125020 m!144719))

(assert (=> b!125020 m!144721))

(assert (=> b!125020 m!144723))

(assert (=> b!125020 m!144619))

(declare-fun m!145187 () Bool)

(assert (=> b!125020 m!145187))

(assert (=> b!125020 m!144721))

(assert (=> b!125020 m!145187))

(declare-fun m!145189 () Bool)

(assert (=> b!125020 m!145189))

(assert (=> b!125021 m!144619))

(assert (=> b!125021 m!144619))

(assert (=> b!125021 m!144629))

(assert (=> b!125022 m!145175))

(declare-fun m!145191 () Bool)

(assert (=> b!125012 m!145191))

(declare-fun m!145193 () Bool)

(assert (=> d!37429 m!145193))

(assert (=> d!37429 m!144633))

(assert (=> bm!13350 d!37429))

(declare-fun b!125027 () Bool)

(declare-fun e!81704 () Bool)

(assert (=> b!125027 (= e!81704 (and (bvsge (extraKeys!2549 (_2!1296 lt!64096)) #b00000000000000000000000000000000) (bvsle (extraKeys!2549 (_2!1296 lt!64096)) #b00000000000000000000000000000011) (bvsge (_vacant!577 (_2!1296 lt!64096)) #b00000000000000000000000000000000)))))

(declare-fun b!125025 () Bool)

(declare-fun res!60575 () Bool)

(assert (=> b!125025 (=> (not res!60575) (not e!81704))))

(assert (=> b!125025 (= res!60575 (bvsge (size!2486 (_2!1296 lt!64096)) (_size!577 (_2!1296 lt!64096))))))

(declare-fun b!125024 () Bool)

(declare-fun res!60574 () Bool)

(assert (=> b!125024 (=> (not res!60574) (not e!81704))))

(assert (=> b!125024 (= res!60574 (and (= (size!2483 (_values!2747 (_2!1296 lt!64096))) (bvadd (mask!7010 (_2!1296 lt!64096)) #b00000000000000000000000000000001)) (= (size!2482 (_keys!4493 (_2!1296 lt!64096))) (size!2483 (_values!2747 (_2!1296 lt!64096)))) (bvsge (_size!577 (_2!1296 lt!64096)) #b00000000000000000000000000000000) (bvsle (_size!577 (_2!1296 lt!64096)) (bvadd (mask!7010 (_2!1296 lt!64096)) #b00000000000000000000000000000001))))))

(declare-fun b!125026 () Bool)

(declare-fun res!60573 () Bool)

(assert (=> b!125026 (=> (not res!60573) (not e!81704))))

(assert (=> b!125026 (= res!60573 (= (size!2486 (_2!1296 lt!64096)) (bvadd (_size!577 (_2!1296 lt!64096)) (bvsdiv (bvadd (extraKeys!2549 (_2!1296 lt!64096)) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun d!37431 () Bool)

(declare-fun res!60572 () Bool)

(assert (=> d!37431 (=> (not res!60572) (not e!81704))))

(assert (=> d!37431 (= res!60572 (validMask!0 (mask!7010 (_2!1296 lt!64096))))))

(assert (=> d!37431 (= (simpleValid!86 (_2!1296 lt!64096)) e!81704)))

(assert (= (and d!37431 res!60572) b!125024))

(assert (= (and b!125024 res!60574) b!125025))

(assert (= (and b!125025 res!60575) b!125026))

(assert (= (and b!125026 res!60573) b!125027))

(declare-fun m!145195 () Bool)

(assert (=> b!125025 m!145195))

(assert (=> b!125026 m!145195))

(declare-fun m!145197 () Bool)

(assert (=> d!37431 m!145197))

(assert (=> d!37365 d!37431))

(declare-fun d!37433 () Bool)

(declare-fun e!81705 () Bool)

(assert (=> d!37433 e!81705))

(declare-fun res!60576 () Bool)

(assert (=> d!37433 (=> res!60576 e!81705)))

(declare-fun lt!64425 () Bool)

(assert (=> d!37433 (= res!60576 (not lt!64425))))

(declare-fun lt!64426 () Bool)

(assert (=> d!37433 (= lt!64425 lt!64426)))

(declare-fun lt!64423 () Unit!3867)

(declare-fun e!81706 () Unit!3867)

(assert (=> d!37433 (= lt!64423 e!81706)))

(declare-fun c!22744 () Bool)

(assert (=> d!37433 (= c!22744 lt!64426)))

(assert (=> d!37433 (= lt!64426 (containsKey!170 (toList!854 lt!64406) (select (arr!2219 (_keys!4493 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> d!37433 (= (contains!873 lt!64406 (select (arr!2219 (_keys!4493 newMap!16)) #b00000000000000000000000000000000)) lt!64425)))

(declare-fun b!125028 () Bool)

(declare-fun lt!64424 () Unit!3867)

(assert (=> b!125028 (= e!81706 lt!64424)))

(assert (=> b!125028 (= lt!64424 (lemmaContainsKeyImpliesGetValueByKeyDefined!118 (toList!854 lt!64406) (select (arr!2219 (_keys!4493 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!125028 (isDefined!119 (getValueByKey!166 (toList!854 lt!64406) (select (arr!2219 (_keys!4493 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!125029 () Bool)

(declare-fun Unit!3886 () Unit!3867)

(assert (=> b!125029 (= e!81706 Unit!3886)))

(declare-fun b!125030 () Bool)

(assert (=> b!125030 (= e!81705 (isDefined!119 (getValueByKey!166 (toList!854 lt!64406) (select (arr!2219 (_keys!4493 newMap!16)) #b00000000000000000000000000000000))))))

(assert (= (and d!37433 c!22744) b!125028))

(assert (= (and d!37433 (not c!22744)) b!125029))

(assert (= (and d!37433 (not res!60576)) b!125030))

(assert (=> d!37433 m!144619))

(declare-fun m!145199 () Bool)

(assert (=> d!37433 m!145199))

(assert (=> b!125028 m!144619))

(declare-fun m!145201 () Bool)

(assert (=> b!125028 m!145201))

(assert (=> b!125028 m!144619))

(declare-fun m!145203 () Bool)

(assert (=> b!125028 m!145203))

(assert (=> b!125028 m!145203))

(declare-fun m!145205 () Bool)

(assert (=> b!125028 m!145205))

(assert (=> b!125030 m!144619))

(assert (=> b!125030 m!145203))

(assert (=> b!125030 m!145203))

(assert (=> b!125030 m!145205))

(assert (=> b!124978 d!37433))

(declare-fun d!37435 () Bool)

(assert (=> d!37435 (= (validMask!0 (mask!7010 newMap!16)) (and (or (= (mask!7010 newMap!16) #b00000000000000000000000000000111) (= (mask!7010 newMap!16) #b00000000000000000000000000001111) (= (mask!7010 newMap!16) #b00000000000000000000000000011111) (= (mask!7010 newMap!16) #b00000000000000000000000000111111) (= (mask!7010 newMap!16) #b00000000000000000000000001111111) (= (mask!7010 newMap!16) #b00000000000000000000000011111111) (= (mask!7010 newMap!16) #b00000000000000000000000111111111) (= (mask!7010 newMap!16) #b00000000000000000000001111111111) (= (mask!7010 newMap!16) #b00000000000000000000011111111111) (= (mask!7010 newMap!16) #b00000000000000000000111111111111) (= (mask!7010 newMap!16) #b00000000000000000001111111111111) (= (mask!7010 newMap!16) #b00000000000000000011111111111111) (= (mask!7010 newMap!16) #b00000000000000000111111111111111) (= (mask!7010 newMap!16) #b00000000000000001111111111111111) (= (mask!7010 newMap!16) #b00000000000000011111111111111111) (= (mask!7010 newMap!16) #b00000000000000111111111111111111) (= (mask!7010 newMap!16) #b00000000000001111111111111111111) (= (mask!7010 newMap!16) #b00000000000011111111111111111111) (= (mask!7010 newMap!16) #b00000000000111111111111111111111) (= (mask!7010 newMap!16) #b00000000001111111111111111111111) (= (mask!7010 newMap!16) #b00000000011111111111111111111111) (= (mask!7010 newMap!16) #b00000000111111111111111111111111) (= (mask!7010 newMap!16) #b00000001111111111111111111111111) (= (mask!7010 newMap!16) #b00000011111111111111111111111111) (= (mask!7010 newMap!16) #b00000111111111111111111111111111) (= (mask!7010 newMap!16) #b00001111111111111111111111111111) (= (mask!7010 newMap!16) #b00011111111111111111111111111111) (= (mask!7010 newMap!16) #b00111111111111111111111111111111)) (bvsle (mask!7010 newMap!16) #b00111111111111111111111111111111)))))

(assert (=> d!37339 d!37435))

(declare-fun d!37437 () Bool)

(assert (=> d!37437 (= (inRange!0 (index!3231 lt!64350) (mask!7010 newMap!16)) (and (bvsge (index!3231 lt!64350) #b00000000000000000000000000000000) (bvslt (index!3231 lt!64350) (bvadd (mask!7010 newMap!16) #b00000000000000000000000000000001))))))

(assert (=> b!124947 d!37437))

(declare-fun d!37439 () Bool)

(assert (=> d!37439 (contains!873 (getCurrentListMap!535 (_keys!4493 newMap!16) lt!64109 (mask!7010 newMap!16) (extraKeys!2549 newMap!16) (zeroValue!2629 newMap!16) (minValue!2629 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2764 newMap!16)) (select (arr!2219 (_keys!4493 newMap!16)) (index!3231 lt!64093)))))

(assert (=> d!37439 true))

(declare-fun _$16!139 () Unit!3867)

(assert (=> d!37439 (= (choose!749 (_keys!4493 newMap!16) lt!64109 (mask!7010 newMap!16) (extraKeys!2549 newMap!16) (zeroValue!2629 newMap!16) (minValue!2629 newMap!16) (index!3231 lt!64093) (defaultEntry!2764 newMap!16)) _$16!139)))

(declare-fun bs!5163 () Bool)

(assert (= bs!5163 d!37439))

(assert (=> bs!5163 m!144701))

(assert (=> bs!5163 m!144603))

(assert (=> bs!5163 m!144701))

(assert (=> bs!5163 m!144603))

(assert (=> bs!5163 m!144703))

(assert (=> d!37333 d!37439))

(assert (=> d!37333 d!37435))

(declare-fun d!37441 () Bool)

(declare-fun e!81707 () Bool)

(assert (=> d!37441 e!81707))

(declare-fun res!60577 () Bool)

(assert (=> d!37441 (=> res!60577 e!81707)))

(declare-fun lt!64429 () Bool)

(assert (=> d!37441 (= res!60577 (not lt!64429))))

(declare-fun lt!64430 () Bool)

(assert (=> d!37441 (= lt!64429 lt!64430)))

(declare-fun lt!64427 () Unit!3867)

(declare-fun e!81708 () Unit!3867)

(assert (=> d!37441 (= lt!64427 e!81708)))

(declare-fun c!22745 () Bool)

(assert (=> d!37441 (= c!22745 lt!64430)))

(assert (=> d!37441 (= lt!64430 (containsKey!170 (toList!854 lt!64376) (_1!1295 (tuple2!2569 lt!64017 (zeroValue!2629 (v!3108 (underlying!436 thiss!992)))))))))

(assert (=> d!37441 (= (contains!873 lt!64376 (_1!1295 (tuple2!2569 lt!64017 (zeroValue!2629 (v!3108 (underlying!436 thiss!992)))))) lt!64429)))

(declare-fun b!125031 () Bool)

(declare-fun lt!64428 () Unit!3867)

(assert (=> b!125031 (= e!81708 lt!64428)))

(assert (=> b!125031 (= lt!64428 (lemmaContainsKeyImpliesGetValueByKeyDefined!118 (toList!854 lt!64376) (_1!1295 (tuple2!2569 lt!64017 (zeroValue!2629 (v!3108 (underlying!436 thiss!992)))))))))

(assert (=> b!125031 (isDefined!119 (getValueByKey!166 (toList!854 lt!64376) (_1!1295 (tuple2!2569 lt!64017 (zeroValue!2629 (v!3108 (underlying!436 thiss!992)))))))))

(declare-fun b!125032 () Bool)

(declare-fun Unit!3887 () Unit!3867)

(assert (=> b!125032 (= e!81708 Unit!3887)))

(declare-fun b!125033 () Bool)

(assert (=> b!125033 (= e!81707 (isDefined!119 (getValueByKey!166 (toList!854 lt!64376) (_1!1295 (tuple2!2569 lt!64017 (zeroValue!2629 (v!3108 (underlying!436 thiss!992))))))))))

(assert (= (and d!37441 c!22745) b!125031))

(assert (= (and d!37441 (not c!22745)) b!125032))

(assert (= (and d!37441 (not res!60577)) b!125033))

(declare-fun m!145207 () Bool)

(assert (=> d!37441 m!145207))

(declare-fun m!145209 () Bool)

(assert (=> b!125031 m!145209))

(assert (=> b!125031 m!145077))

(assert (=> b!125031 m!145077))

(declare-fun m!145211 () Bool)

(assert (=> b!125031 m!145211))

(assert (=> b!125033 m!145077))

(assert (=> b!125033 m!145077))

(assert (=> b!125033 m!145211))

(assert (=> d!37409 d!37441))

(declare-fun c!22746 () Bool)

(declare-fun d!37443 () Bool)

(assert (=> d!37443 (= c!22746 (and ((_ is Cons!1691) lt!64377) (= (_1!1295 (h!2292 lt!64377)) (_1!1295 (tuple2!2569 lt!64017 (zeroValue!2629 (v!3108 (underlying!436 thiss!992))))))))))

(declare-fun e!81709 () Option!172)

(assert (=> d!37443 (= (getValueByKey!166 lt!64377 (_1!1295 (tuple2!2569 lt!64017 (zeroValue!2629 (v!3108 (underlying!436 thiss!992)))))) e!81709)))

(declare-fun b!125034 () Bool)

(assert (=> b!125034 (= e!81709 (Some!171 (_2!1295 (h!2292 lt!64377))))))

(declare-fun e!81710 () Option!172)

(declare-fun b!125036 () Bool)

(assert (=> b!125036 (= e!81710 (getValueByKey!166 (t!6022 lt!64377) (_1!1295 (tuple2!2569 lt!64017 (zeroValue!2629 (v!3108 (underlying!436 thiss!992)))))))))

(declare-fun b!125037 () Bool)

(assert (=> b!125037 (= e!81710 None!170)))

(declare-fun b!125035 () Bool)

(assert (=> b!125035 (= e!81709 e!81710)))

(declare-fun c!22747 () Bool)

(assert (=> b!125035 (= c!22747 (and ((_ is Cons!1691) lt!64377) (not (= (_1!1295 (h!2292 lt!64377)) (_1!1295 (tuple2!2569 lt!64017 (zeroValue!2629 (v!3108 (underlying!436 thiss!992)))))))))))

(assert (= (and d!37443 c!22746) b!125034))

(assert (= (and d!37443 (not c!22746)) b!125035))

(assert (= (and b!125035 c!22747) b!125036))

(assert (= (and b!125035 (not c!22747)) b!125037))

(declare-fun m!145213 () Bool)

(assert (=> b!125036 m!145213))

(assert (=> d!37409 d!37443))

(declare-fun d!37445 () Bool)

(assert (=> d!37445 (= (getValueByKey!166 lt!64377 (_1!1295 (tuple2!2569 lt!64017 (zeroValue!2629 (v!3108 (underlying!436 thiss!992)))))) (Some!171 (_2!1295 (tuple2!2569 lt!64017 (zeroValue!2629 (v!3108 (underlying!436 thiss!992)))))))))

(declare-fun lt!64433 () Unit!3867)

(declare-fun choose!756 (List!1695 (_ BitVec 64) V!3427) Unit!3867)

(assert (=> d!37445 (= lt!64433 (choose!756 lt!64377 (_1!1295 (tuple2!2569 lt!64017 (zeroValue!2629 (v!3108 (underlying!436 thiss!992))))) (_2!1295 (tuple2!2569 lt!64017 (zeroValue!2629 (v!3108 (underlying!436 thiss!992)))))))))

(declare-fun e!81713 () Bool)

(assert (=> d!37445 e!81713))

(declare-fun res!60582 () Bool)

(assert (=> d!37445 (=> (not res!60582) (not e!81713))))

(assert (=> d!37445 (= res!60582 (isStrictlySorted!316 lt!64377))))

(assert (=> d!37445 (= (lemmaContainsTupThenGetReturnValue!81 lt!64377 (_1!1295 (tuple2!2569 lt!64017 (zeroValue!2629 (v!3108 (underlying!436 thiss!992))))) (_2!1295 (tuple2!2569 lt!64017 (zeroValue!2629 (v!3108 (underlying!436 thiss!992)))))) lt!64433)))

(declare-fun b!125042 () Bool)

(declare-fun res!60583 () Bool)

(assert (=> b!125042 (=> (not res!60583) (not e!81713))))

(assert (=> b!125042 (= res!60583 (containsKey!170 lt!64377 (_1!1295 (tuple2!2569 lt!64017 (zeroValue!2629 (v!3108 (underlying!436 thiss!992)))))))))

(declare-fun b!125043 () Bool)

(assert (=> b!125043 (= e!81713 (contains!874 lt!64377 (tuple2!2569 (_1!1295 (tuple2!2569 lt!64017 (zeroValue!2629 (v!3108 (underlying!436 thiss!992))))) (_2!1295 (tuple2!2569 lt!64017 (zeroValue!2629 (v!3108 (underlying!436 thiss!992))))))))))

(assert (= (and d!37445 res!60582) b!125042))

(assert (= (and b!125042 res!60583) b!125043))

(assert (=> d!37445 m!145071))

(declare-fun m!145215 () Bool)

(assert (=> d!37445 m!145215))

(declare-fun m!145217 () Bool)

(assert (=> d!37445 m!145217))

(declare-fun m!145219 () Bool)

(assert (=> b!125042 m!145219))

(declare-fun m!145221 () Bool)

(assert (=> b!125043 m!145221))

(assert (=> d!37409 d!37445))

(declare-fun b!125064 () Bool)

(declare-fun e!81726 () List!1695)

(declare-fun call!13400 () List!1695)

(assert (=> b!125064 (= e!81726 call!13400)))

(declare-fun b!125065 () Bool)

(declare-fun e!81725 () List!1695)

(declare-fun e!81724 () List!1695)

(assert (=> b!125065 (= e!81725 e!81724)))

(declare-fun c!22758 () Bool)

(assert (=> b!125065 (= c!22758 (and ((_ is Cons!1691) (toList!854 lt!64007)) (= (_1!1295 (h!2292 (toList!854 lt!64007))) (_1!1295 (tuple2!2569 lt!64017 (zeroValue!2629 (v!3108 (underlying!436 thiss!992))))))))))

(declare-fun b!125066 () Bool)

(assert (=> b!125066 (= e!81726 call!13400)))

(declare-fun b!125067 () Bool)

(declare-fun call!13401 () List!1695)

(assert (=> b!125067 (= e!81724 call!13401)))

(declare-fun b!125068 () Bool)

(declare-fun res!60588 () Bool)

(declare-fun e!81727 () Bool)

(assert (=> b!125068 (=> (not res!60588) (not e!81727))))

(declare-fun lt!64436 () List!1695)

(assert (=> b!125068 (= res!60588 (containsKey!170 lt!64436 (_1!1295 (tuple2!2569 lt!64017 (zeroValue!2629 (v!3108 (underlying!436 thiss!992)))))))))

(declare-fun bm!13397 () Bool)

(assert (=> bm!13397 (= call!13400 call!13401)))

(declare-fun d!37447 () Bool)

(assert (=> d!37447 e!81727))

(declare-fun res!60589 () Bool)

(assert (=> d!37447 (=> (not res!60589) (not e!81727))))

(assert (=> d!37447 (= res!60589 (isStrictlySorted!316 lt!64436))))

(assert (=> d!37447 (= lt!64436 e!81725)))

(declare-fun c!22756 () Bool)

(assert (=> d!37447 (= c!22756 (and ((_ is Cons!1691) (toList!854 lt!64007)) (bvslt (_1!1295 (h!2292 (toList!854 lt!64007))) (_1!1295 (tuple2!2569 lt!64017 (zeroValue!2629 (v!3108 (underlying!436 thiss!992))))))))))

(assert (=> d!37447 (isStrictlySorted!316 (toList!854 lt!64007))))

(assert (=> d!37447 (= (insertStrictlySorted!84 (toList!854 lt!64007) (_1!1295 (tuple2!2569 lt!64017 (zeroValue!2629 (v!3108 (underlying!436 thiss!992))))) (_2!1295 (tuple2!2569 lt!64017 (zeroValue!2629 (v!3108 (underlying!436 thiss!992)))))) lt!64436)))

(declare-fun b!125069 () Bool)

(assert (=> b!125069 (= e!81727 (contains!874 lt!64436 (tuple2!2569 (_1!1295 (tuple2!2569 lt!64017 (zeroValue!2629 (v!3108 (underlying!436 thiss!992))))) (_2!1295 (tuple2!2569 lt!64017 (zeroValue!2629 (v!3108 (underlying!436 thiss!992))))))))))

(declare-fun call!13402 () List!1695)

(declare-fun bm!13398 () Bool)

(declare-fun e!81728 () List!1695)

(declare-fun $colon$colon!88 (List!1695 tuple2!2568) List!1695)

(assert (=> bm!13398 (= call!13402 ($colon$colon!88 e!81728 (ite c!22756 (h!2292 (toList!854 lt!64007)) (tuple2!2569 (_1!1295 (tuple2!2569 lt!64017 (zeroValue!2629 (v!3108 (underlying!436 thiss!992))))) (_2!1295 (tuple2!2569 lt!64017 (zeroValue!2629 (v!3108 (underlying!436 thiss!992)))))))))))

(declare-fun c!22759 () Bool)

(assert (=> bm!13398 (= c!22759 c!22756)))

(declare-fun c!22757 () Bool)

(declare-fun b!125070 () Bool)

(assert (=> b!125070 (= c!22757 (and ((_ is Cons!1691) (toList!854 lt!64007)) (bvsgt (_1!1295 (h!2292 (toList!854 lt!64007))) (_1!1295 (tuple2!2569 lt!64017 (zeroValue!2629 (v!3108 (underlying!436 thiss!992))))))))))

(assert (=> b!125070 (= e!81724 e!81726)))

(declare-fun b!125071 () Bool)

(assert (=> b!125071 (= e!81728 (insertStrictlySorted!84 (t!6022 (toList!854 lt!64007)) (_1!1295 (tuple2!2569 lt!64017 (zeroValue!2629 (v!3108 (underlying!436 thiss!992))))) (_2!1295 (tuple2!2569 lt!64017 (zeroValue!2629 (v!3108 (underlying!436 thiss!992)))))))))

(declare-fun b!125072 () Bool)

(assert (=> b!125072 (= e!81725 call!13402)))

(declare-fun bm!13399 () Bool)

(assert (=> bm!13399 (= call!13401 call!13402)))

(declare-fun b!125073 () Bool)

(assert (=> b!125073 (= e!81728 (ite c!22758 (t!6022 (toList!854 lt!64007)) (ite c!22757 (Cons!1691 (h!2292 (toList!854 lt!64007)) (t!6022 (toList!854 lt!64007))) Nil!1692)))))

(assert (= (and d!37447 c!22756) b!125072))

(assert (= (and d!37447 (not c!22756)) b!125065))

(assert (= (and b!125065 c!22758) b!125067))

(assert (= (and b!125065 (not c!22758)) b!125070))

(assert (= (and b!125070 c!22757) b!125064))

(assert (= (and b!125070 (not c!22757)) b!125066))

(assert (= (or b!125064 b!125066) bm!13397))

(assert (= (or b!125067 bm!13397) bm!13399))

(assert (= (or b!125072 bm!13399) bm!13398))

(assert (= (and bm!13398 c!22759) b!125071))

(assert (= (and bm!13398 (not c!22759)) b!125073))

(assert (= (and d!37447 res!60589) b!125068))

(assert (= (and b!125068 res!60588) b!125069))

(declare-fun m!145223 () Bool)

(assert (=> b!125071 m!145223))

(declare-fun m!145225 () Bool)

(assert (=> bm!13398 m!145225))

(declare-fun m!145227 () Bool)

(assert (=> d!37447 m!145227))

(declare-fun m!145229 () Bool)

(assert (=> d!37447 m!145229))

(declare-fun m!145231 () Bool)

(assert (=> b!125068 m!145231))

(declare-fun m!145233 () Bool)

(assert (=> b!125069 m!145233))

(assert (=> d!37409 d!37447))

(declare-fun d!37449 () Bool)

(declare-fun lt!64437 () (_ BitVec 32))

(assert (=> d!37449 (and (bvsge lt!64437 #b00000000000000000000000000000000) (bvsle lt!64437 (bvsub (size!2482 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun e!81729 () (_ BitVec 32))

(assert (=> d!37449 (= lt!64437 e!81729)))

(declare-fun c!22760 () Bool)

(assert (=> d!37449 (= c!22760 (bvsge #b00000000000000000000000000000000 (size!2482 (_keys!4493 (v!3108 (underlying!436 thiss!992))))))))

(assert (=> d!37449 (and (bvsle #b00000000000000000000000000000000 (size!2482 (_keys!4493 (v!3108 (underlying!436 thiss!992))))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!2482 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) (size!2482 (_keys!4493 (v!3108 (underlying!436 thiss!992))))))))

(assert (=> d!37449 (= (arrayCountValidKeys!0 (_keys!4493 (v!3108 (underlying!436 thiss!992))) #b00000000000000000000000000000000 (size!2482 (_keys!4493 (v!3108 (underlying!436 thiss!992))))) lt!64437)))

(declare-fun b!125074 () Bool)

(declare-fun e!81730 () (_ BitVec 32))

(assert (=> b!125074 (= e!81729 e!81730)))

(declare-fun c!22761 () Bool)

(assert (=> b!125074 (= c!22761 (validKeyInArray!0 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun b!125075 () Bool)

(declare-fun call!13403 () (_ BitVec 32))

(assert (=> b!125075 (= e!81730 (bvadd #b00000000000000000000000000000001 call!13403))))

(declare-fun b!125076 () Bool)

(assert (=> b!125076 (= e!81730 call!13403)))

(declare-fun b!125077 () Bool)

(assert (=> b!125077 (= e!81729 #b00000000000000000000000000000000)))

(declare-fun bm!13400 () Bool)

(assert (=> bm!13400 (= call!13403 (arrayCountValidKeys!0 (_keys!4493 (v!3108 (underlying!436 thiss!992))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2482 (_keys!4493 (v!3108 (underlying!436 thiss!992))))))))

(assert (= (and d!37449 c!22760) b!125077))

(assert (= (and d!37449 (not c!22760)) b!125074))

(assert (= (and b!125074 c!22761) b!125075))

(assert (= (and b!125074 (not c!22761)) b!125076))

(assert (= (or b!125075 b!125076) bm!13400))

(declare-fun m!145235 () Bool)

(assert (=> b!125074 m!145235))

(assert (=> b!125074 m!145235))

(declare-fun m!145237 () Bool)

(assert (=> b!125074 m!145237))

(declare-fun m!145239 () Bool)

(assert (=> bm!13400 m!145239))

(assert (=> b!124940 d!37449))

(declare-fun d!37451 () Bool)

(declare-fun res!60590 () Bool)

(declare-fun e!81731 () Bool)

(assert (=> d!37451 (=> res!60590 e!81731)))

(assert (=> d!37451 (= res!60590 (and ((_ is Cons!1691) (toList!854 (getCurrentListMap!535 (_keys!4493 newMap!16) (_values!2747 newMap!16) (mask!7010 newMap!16) (extraKeys!2549 newMap!16) (zeroValue!2629 newMap!16) (minValue!2629 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2764 newMap!16)))) (= (_1!1295 (h!2292 (toList!854 (getCurrentListMap!535 (_keys!4493 newMap!16) (_values!2747 newMap!16) (mask!7010 newMap!16) (extraKeys!2549 newMap!16) (zeroValue!2629 newMap!16) (minValue!2629 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2764 newMap!16))))) (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355))))))

(assert (=> d!37451 (= (containsKey!170 (toList!854 (getCurrentListMap!535 (_keys!4493 newMap!16) (_values!2747 newMap!16) (mask!7010 newMap!16) (extraKeys!2549 newMap!16) (zeroValue!2629 newMap!16) (minValue!2629 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2764 newMap!16))) (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355)) e!81731)))

(declare-fun b!125078 () Bool)

(declare-fun e!81732 () Bool)

(assert (=> b!125078 (= e!81731 e!81732)))

(declare-fun res!60591 () Bool)

(assert (=> b!125078 (=> (not res!60591) (not e!81732))))

(assert (=> b!125078 (= res!60591 (and (or (not ((_ is Cons!1691) (toList!854 (getCurrentListMap!535 (_keys!4493 newMap!16) (_values!2747 newMap!16) (mask!7010 newMap!16) (extraKeys!2549 newMap!16) (zeroValue!2629 newMap!16) (minValue!2629 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2764 newMap!16))))) (bvsle (_1!1295 (h!2292 (toList!854 (getCurrentListMap!535 (_keys!4493 newMap!16) (_values!2747 newMap!16) (mask!7010 newMap!16) (extraKeys!2549 newMap!16) (zeroValue!2629 newMap!16) (minValue!2629 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2764 newMap!16))))) (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355))) ((_ is Cons!1691) (toList!854 (getCurrentListMap!535 (_keys!4493 newMap!16) (_values!2747 newMap!16) (mask!7010 newMap!16) (extraKeys!2549 newMap!16) (zeroValue!2629 newMap!16) (minValue!2629 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2764 newMap!16)))) (bvslt (_1!1295 (h!2292 (toList!854 (getCurrentListMap!535 (_keys!4493 newMap!16) (_values!2747 newMap!16) (mask!7010 newMap!16) (extraKeys!2549 newMap!16) (zeroValue!2629 newMap!16) (minValue!2629 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2764 newMap!16))))) (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355))))))

(declare-fun b!125079 () Bool)

(assert (=> b!125079 (= e!81732 (containsKey!170 (t!6022 (toList!854 (getCurrentListMap!535 (_keys!4493 newMap!16) (_values!2747 newMap!16) (mask!7010 newMap!16) (extraKeys!2549 newMap!16) (zeroValue!2629 newMap!16) (minValue!2629 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2764 newMap!16)))) (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355)))))

(assert (= (and d!37451 (not res!60590)) b!125078))

(assert (= (and b!125078 res!60591) b!125079))

(assert (=> b!125079 m!144415))

(declare-fun m!145241 () Bool)

(assert (=> b!125079 m!145241))

(assert (=> d!37337 d!37451))

(declare-fun b!125080 () Bool)

(declare-fun res!60592 () Bool)

(declare-fun e!81734 () Bool)

(assert (=> b!125080 (=> (not res!60592) (not e!81734))))

(declare-fun lt!64442 () ListLongMap!1677)

(assert (=> b!125080 (= res!60592 (not (contains!873 lt!64442 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bm!13401 () Bool)

(declare-fun call!13404 () ListLongMap!1677)

(assert (=> bm!13401 (= call!13404 (getCurrentListMapNoExtraKeys!135 (_keys!4493 (v!3108 (underlying!436 thiss!992))) (_values!2747 (v!3108 (underlying!436 thiss!992))) (mask!7010 (v!3108 (underlying!436 thiss!992))) (extraKeys!2549 (v!3108 (underlying!436 thiss!992))) (zeroValue!2629 (v!3108 (underlying!436 thiss!992))) (minValue!2629 (v!3108 (underlying!436 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (defaultEntry!2764 (v!3108 (underlying!436 thiss!992)))))))

(declare-fun b!125081 () Bool)

(declare-fun e!81733 () Bool)

(declare-fun e!81737 () Bool)

(assert (=> b!125081 (= e!81733 e!81737)))

(assert (=> b!125081 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2482 (_keys!4493 (v!3108 (underlying!436 thiss!992))))))))

(declare-fun res!60594 () Bool)

(assert (=> b!125081 (= res!60594 (contains!873 lt!64442 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001))))))

(assert (=> b!125081 (=> (not res!60594) (not e!81737))))

(declare-fun b!125082 () Bool)

(assert (=> b!125082 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2482 (_keys!4493 (v!3108 (underlying!436 thiss!992))))))))

(assert (=> b!125082 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2483 (_values!2747 (v!3108 (underlying!436 thiss!992))))))))

(assert (=> b!125082 (= e!81737 (= (apply!110 lt!64442 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001))) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!37453 () Bool)

(assert (=> d!37453 e!81734))

(declare-fun res!60595 () Bool)

(assert (=> d!37453 (=> (not res!60595) (not e!81734))))

(assert (=> d!37453 (= res!60595 (not (contains!873 lt!64442 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!81735 () ListLongMap!1677)

(assert (=> d!37453 (= lt!64442 e!81735)))

(declare-fun c!22762 () Bool)

(assert (=> d!37453 (= c!22762 (bvsge (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2482 (_keys!4493 (v!3108 (underlying!436 thiss!992))))))))

(assert (=> d!37453 (validMask!0 (mask!7010 (v!3108 (underlying!436 thiss!992))))))

(assert (=> d!37453 (= (getCurrentListMapNoExtraKeys!135 (_keys!4493 (v!3108 (underlying!436 thiss!992))) (_values!2747 (v!3108 (underlying!436 thiss!992))) (mask!7010 (v!3108 (underlying!436 thiss!992))) (extraKeys!2549 (v!3108 (underlying!436 thiss!992))) (zeroValue!2629 (v!3108 (underlying!436 thiss!992))) (minValue!2629 (v!3108 (underlying!436 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!2764 (v!3108 (underlying!436 thiss!992)))) lt!64442)))

(declare-fun b!125083 () Bool)

(declare-fun e!81738 () Bool)

(assert (=> b!125083 (= e!81738 (validKeyInArray!0 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001))))))

(assert (=> b!125083 (bvsge (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(declare-fun b!125084 () Bool)

(assert (=> b!125084 (= e!81734 e!81733)))

(declare-fun c!22765 () Bool)

(assert (=> b!125084 (= c!22765 e!81738)))

(declare-fun res!60593 () Bool)

(assert (=> b!125084 (=> (not res!60593) (not e!81738))))

(assert (=> b!125084 (= res!60593 (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2482 (_keys!4493 (v!3108 (underlying!436 thiss!992))))))))

(declare-fun b!125085 () Bool)

(declare-fun e!81736 () Bool)

(assert (=> b!125085 (= e!81736 (isEmpty!394 lt!64442))))

(declare-fun b!125086 () Bool)

(declare-fun e!81739 () ListLongMap!1677)

(assert (=> b!125086 (= e!81739 call!13404)))

(declare-fun b!125087 () Bool)

(assert (=> b!125087 (= e!81735 (ListLongMap!1678 Nil!1692))))

(declare-fun b!125088 () Bool)

(declare-fun lt!64444 () Unit!3867)

(declare-fun lt!64438 () Unit!3867)

(assert (=> b!125088 (= lt!64444 lt!64438)))

(declare-fun lt!64441 () (_ BitVec 64))

(declare-fun lt!64439 () ListLongMap!1677)

(declare-fun lt!64443 () V!3427)

(declare-fun lt!64440 () (_ BitVec 64))

(assert (=> b!125088 (not (contains!873 (+!169 lt!64439 (tuple2!2569 lt!64440 lt!64443)) lt!64441))))

(assert (=> b!125088 (= lt!64438 (addStillNotContains!55 lt!64439 lt!64440 lt!64443 lt!64441))))

(assert (=> b!125088 (= lt!64441 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!125088 (= lt!64443 (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!125088 (= lt!64440 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)))))

(assert (=> b!125088 (= lt!64439 call!13404)))

(assert (=> b!125088 (= e!81739 (+!169 call!13404 (tuple2!2569 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!125089 () Bool)

(assert (=> b!125089 (= e!81735 e!81739)))

(declare-fun c!22763 () Bool)

(assert (=> b!125089 (= c!22763 (validKeyInArray!0 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001))))))

(declare-fun b!125090 () Bool)

(assert (=> b!125090 (= e!81736 (= lt!64442 (getCurrentListMapNoExtraKeys!135 (_keys!4493 (v!3108 (underlying!436 thiss!992))) (_values!2747 (v!3108 (underlying!436 thiss!992))) (mask!7010 (v!3108 (underlying!436 thiss!992))) (extraKeys!2549 (v!3108 (underlying!436 thiss!992))) (zeroValue!2629 (v!3108 (underlying!436 thiss!992))) (minValue!2629 (v!3108 (underlying!436 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))))))))

(declare-fun b!125091 () Bool)

(assert (=> b!125091 (= e!81733 e!81736)))

(declare-fun c!22764 () Bool)

(assert (=> b!125091 (= c!22764 (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2482 (_keys!4493 (v!3108 (underlying!436 thiss!992))))))))

(assert (= (and d!37453 c!22762) b!125087))

(assert (= (and d!37453 (not c!22762)) b!125089))

(assert (= (and b!125089 c!22763) b!125088))

(assert (= (and b!125089 (not c!22763)) b!125086))

(assert (= (or b!125088 b!125086) bm!13401))

(assert (= (and d!37453 res!60595) b!125080))

(assert (= (and b!125080 res!60592) b!125084))

(assert (= (and b!125084 res!60593) b!125083))

(assert (= (and b!125084 c!22765) b!125081))

(assert (= (and b!125084 (not c!22765)) b!125091))

(assert (= (and b!125081 res!60594) b!125082))

(assert (= (and b!125091 c!22764) b!125090))

(assert (= (and b!125091 (not c!22764)) b!125085))

(declare-fun b_lambda!5493 () Bool)

(assert (=> (not b_lambda!5493) (not b!125082)))

(assert (=> b!125082 t!6019))

(declare-fun b_and!7691 () Bool)

(assert (= b_and!7687 (and (=> t!6019 result!3805) b_and!7691)))

(assert (=> b!125082 t!6021))

(declare-fun b_and!7693 () Bool)

(assert (= b_and!7689 (and (=> t!6021 result!3809) b_and!7693)))

(declare-fun b_lambda!5495 () Bool)

(assert (=> (not b_lambda!5495) (not b!125088)))

(assert (=> b!125088 t!6019))

(declare-fun b_and!7695 () Bool)

(assert (= b_and!7691 (and (=> t!6019 result!3805) b_and!7695)))

(assert (=> b!125088 t!6021))

(declare-fun b_and!7697 () Bool)

(assert (= b_and!7693 (and (=> t!6021 result!3809) b_and!7697)))

(declare-fun m!145243 () Bool)

(assert (=> bm!13401 m!145243))

(declare-fun m!145245 () Bool)

(assert (=> b!125083 m!145245))

(assert (=> b!125083 m!145245))

(declare-fun m!145247 () Bool)

(assert (=> b!125083 m!145247))

(assert (=> b!125081 m!145245))

(assert (=> b!125081 m!145245))

(declare-fun m!145249 () Bool)

(assert (=> b!125081 m!145249))

(declare-fun m!145251 () Bool)

(assert (=> b!125085 m!145251))

(assert (=> b!125082 m!145245))

(declare-fun m!145253 () Bool)

(assert (=> b!125082 m!145253))

(assert (=> b!125082 m!145245))

(assert (=> b!125082 m!144423))

(declare-fun m!145255 () Bool)

(assert (=> b!125082 m!145255))

(assert (=> b!125082 m!145255))

(assert (=> b!125082 m!144423))

(declare-fun m!145257 () Bool)

(assert (=> b!125082 m!145257))

(declare-fun m!145259 () Bool)

(assert (=> b!125088 m!145259))

(declare-fun m!145261 () Bool)

(assert (=> b!125088 m!145261))

(assert (=> b!125088 m!145255))

(assert (=> b!125088 m!145255))

(assert (=> b!125088 m!144423))

(assert (=> b!125088 m!145257))

(assert (=> b!125088 m!145245))

(declare-fun m!145263 () Bool)

(assert (=> b!125088 m!145263))

(assert (=> b!125088 m!144423))

(assert (=> b!125088 m!145263))

(declare-fun m!145265 () Bool)

(assert (=> b!125088 m!145265))

(assert (=> b!125089 m!145245))

(assert (=> b!125089 m!145245))

(assert (=> b!125089 m!145247))

(assert (=> b!125090 m!145243))

(declare-fun m!145267 () Bool)

(assert (=> b!125080 m!145267))

(declare-fun m!145269 () Bool)

(assert (=> d!37453 m!145269))

(assert (=> d!37453 m!144413))

(assert (=> bm!13362 d!37453))

(declare-fun d!37455 () Bool)

(assert (=> d!37455 (= (validKeyInArray!0 (select (arr!2219 (_keys!4493 newMap!16)) #b00000000000000000000000000000000)) (and (not (= (select (arr!2219 (_keys!4493 newMap!16)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2219 (_keys!4493 newMap!16)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!124981 d!37455))

(declare-fun d!37457 () Bool)

(assert (=> d!37457 (= (inRange!0 (ite c!22661 (index!3230 lt!64126) (index!3233 lt!64126)) (mask!7010 newMap!16)) (and (bvsge (ite c!22661 (index!3230 lt!64126) (index!3233 lt!64126)) #b00000000000000000000000000000000) (bvslt (ite c!22661 (index!3230 lt!64126) (index!3233 lt!64126)) (bvadd (mask!7010 newMap!16) #b00000000000000000000000000000001))))))

(assert (=> bm!13345 d!37457))

(declare-fun d!37459 () Bool)

(assert (=> d!37459 (= (apply!110 (+!169 lt!64343 (tuple2!2569 lt!64326 (ite c!22645 (ite c!22640 (minValue!2629 newMap!16) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2629 newMap!16)))) lt!64338) (get!1439 (getValueByKey!166 (toList!854 (+!169 lt!64343 (tuple2!2569 lt!64326 (ite c!22645 (ite c!22640 (minValue!2629 newMap!16) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2629 newMap!16))))) lt!64338)))))

(declare-fun bs!5164 () Bool)

(assert (= bs!5164 d!37459))

(declare-fun m!145271 () Bool)

(assert (=> bs!5164 m!145271))

(assert (=> bs!5164 m!145271))

(declare-fun m!145273 () Bool)

(assert (=> bs!5164 m!145273))

(assert (=> b!124929 d!37459))

(declare-fun d!37461 () Bool)

(assert (=> d!37461 (= (apply!110 (+!169 lt!64331 (tuple2!2569 lt!64328 (ite c!22645 (ite c!22640 (minValue!2629 newMap!16) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2629 newMap!16)))) lt!64329) (apply!110 lt!64331 lt!64329))))

(declare-fun lt!64445 () Unit!3867)

(assert (=> d!37461 (= lt!64445 (choose!754 lt!64331 lt!64328 (ite c!22645 (ite c!22640 (minValue!2629 newMap!16) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2629 newMap!16)) lt!64329))))

(declare-fun e!81740 () Bool)

(assert (=> d!37461 e!81740))

(declare-fun res!60596 () Bool)

(assert (=> d!37461 (=> (not res!60596) (not e!81740))))

(assert (=> d!37461 (= res!60596 (contains!873 lt!64331 lt!64329))))

(assert (=> d!37461 (= (addApplyDifferent!86 lt!64331 lt!64328 (ite c!22645 (ite c!22640 (minValue!2629 newMap!16) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2629 newMap!16)) lt!64329) lt!64445)))

(declare-fun b!125092 () Bool)

(assert (=> b!125092 (= e!81740 (not (= lt!64329 lt!64328)))))

(assert (= (and d!37461 res!60596) b!125092))

(assert (=> d!37461 m!144925))

(declare-fun m!145275 () Bool)

(assert (=> d!37461 m!145275))

(assert (=> d!37461 m!144923))

(assert (=> d!37461 m!144925))

(assert (=> d!37461 m!144927))

(declare-fun m!145277 () Bool)

(assert (=> d!37461 m!145277))

(assert (=> b!124929 d!37461))

(declare-fun d!37463 () Bool)

(declare-fun e!81741 () Bool)

(assert (=> d!37463 e!81741))

(declare-fun res!60597 () Bool)

(assert (=> d!37463 (=> (not res!60597) (not e!81741))))

(declare-fun lt!64446 () ListLongMap!1677)

(assert (=> d!37463 (= res!60597 (contains!873 lt!64446 (_1!1295 (tuple2!2569 lt!64344 (zeroValue!2629 newMap!16)))))))

(declare-fun lt!64447 () List!1695)

(assert (=> d!37463 (= lt!64446 (ListLongMap!1678 lt!64447))))

(declare-fun lt!64449 () Unit!3867)

(declare-fun lt!64448 () Unit!3867)

(assert (=> d!37463 (= lt!64449 lt!64448)))

(assert (=> d!37463 (= (getValueByKey!166 lt!64447 (_1!1295 (tuple2!2569 lt!64344 (zeroValue!2629 newMap!16)))) (Some!171 (_2!1295 (tuple2!2569 lt!64344 (zeroValue!2629 newMap!16)))))))

(assert (=> d!37463 (= lt!64448 (lemmaContainsTupThenGetReturnValue!81 lt!64447 (_1!1295 (tuple2!2569 lt!64344 (zeroValue!2629 newMap!16))) (_2!1295 (tuple2!2569 lt!64344 (zeroValue!2629 newMap!16)))))))

(assert (=> d!37463 (= lt!64447 (insertStrictlySorted!84 (toList!854 lt!64334) (_1!1295 (tuple2!2569 lt!64344 (zeroValue!2629 newMap!16))) (_2!1295 (tuple2!2569 lt!64344 (zeroValue!2629 newMap!16)))))))

(assert (=> d!37463 (= (+!169 lt!64334 (tuple2!2569 lt!64344 (zeroValue!2629 newMap!16))) lt!64446)))

(declare-fun b!125093 () Bool)

(declare-fun res!60598 () Bool)

(assert (=> b!125093 (=> (not res!60598) (not e!81741))))

(assert (=> b!125093 (= res!60598 (= (getValueByKey!166 (toList!854 lt!64446) (_1!1295 (tuple2!2569 lt!64344 (zeroValue!2629 newMap!16)))) (Some!171 (_2!1295 (tuple2!2569 lt!64344 (zeroValue!2629 newMap!16))))))))

(declare-fun b!125094 () Bool)

(assert (=> b!125094 (= e!81741 (contains!874 (toList!854 lt!64446) (tuple2!2569 lt!64344 (zeroValue!2629 newMap!16))))))

(assert (= (and d!37463 res!60597) b!125093))

(assert (= (and b!125093 res!60598) b!125094))

(declare-fun m!145279 () Bool)

(assert (=> d!37463 m!145279))

(declare-fun m!145281 () Bool)

(assert (=> d!37463 m!145281))

(declare-fun m!145283 () Bool)

(assert (=> d!37463 m!145283))

(declare-fun m!145285 () Bool)

(assert (=> d!37463 m!145285))

(declare-fun m!145287 () Bool)

(assert (=> b!125093 m!145287))

(declare-fun m!145289 () Bool)

(assert (=> b!125094 m!145289))

(assert (=> b!124929 d!37463))

(declare-fun d!37465 () Bool)

(declare-fun e!81742 () Bool)

(assert (=> d!37465 e!81742))

(declare-fun res!60599 () Bool)

(assert (=> d!37465 (=> res!60599 e!81742)))

(declare-fun lt!64452 () Bool)

(assert (=> d!37465 (= res!60599 (not lt!64452))))

(declare-fun lt!64453 () Bool)

(assert (=> d!37465 (= lt!64452 lt!64453)))

(declare-fun lt!64450 () Unit!3867)

(declare-fun e!81743 () Unit!3867)

(assert (=> d!37465 (= lt!64450 e!81743)))

(declare-fun c!22766 () Bool)

(assert (=> d!37465 (= c!22766 lt!64453)))

(assert (=> d!37465 (= lt!64453 (containsKey!170 (toList!854 (+!169 lt!64324 (tuple2!2569 lt!64330 (zeroValue!2629 newMap!16)))) lt!64340))))

(assert (=> d!37465 (= (contains!873 (+!169 lt!64324 (tuple2!2569 lt!64330 (zeroValue!2629 newMap!16))) lt!64340) lt!64452)))

(declare-fun b!125095 () Bool)

(declare-fun lt!64451 () Unit!3867)

(assert (=> b!125095 (= e!81743 lt!64451)))

(assert (=> b!125095 (= lt!64451 (lemmaContainsKeyImpliesGetValueByKeyDefined!118 (toList!854 (+!169 lt!64324 (tuple2!2569 lt!64330 (zeroValue!2629 newMap!16)))) lt!64340))))

(assert (=> b!125095 (isDefined!119 (getValueByKey!166 (toList!854 (+!169 lt!64324 (tuple2!2569 lt!64330 (zeroValue!2629 newMap!16)))) lt!64340))))

(declare-fun b!125096 () Bool)

(declare-fun Unit!3888 () Unit!3867)

(assert (=> b!125096 (= e!81743 Unit!3888)))

(declare-fun b!125097 () Bool)

(assert (=> b!125097 (= e!81742 (isDefined!119 (getValueByKey!166 (toList!854 (+!169 lt!64324 (tuple2!2569 lt!64330 (zeroValue!2629 newMap!16)))) lt!64340)))))

(assert (= (and d!37465 c!22766) b!125095))

(assert (= (and d!37465 (not c!22766)) b!125096))

(assert (= (and d!37465 (not res!60599)) b!125097))

(declare-fun m!145291 () Bool)

(assert (=> d!37465 m!145291))

(declare-fun m!145293 () Bool)

(assert (=> b!125095 m!145293))

(declare-fun m!145295 () Bool)

(assert (=> b!125095 m!145295))

(assert (=> b!125095 m!145295))

(declare-fun m!145297 () Bool)

(assert (=> b!125095 m!145297))

(assert (=> b!125097 m!145295))

(assert (=> b!125097 m!145295))

(assert (=> b!125097 m!145297))

(assert (=> b!124929 d!37465))

(declare-fun b!125098 () Bool)

(declare-fun res!60600 () Bool)

(declare-fun e!81745 () Bool)

(assert (=> b!125098 (=> (not res!60600) (not e!81745))))

(declare-fun lt!64458 () ListLongMap!1677)

(assert (=> b!125098 (= res!60600 (not (contains!873 lt!64458 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bm!13402 () Bool)

(declare-fun call!13405 () ListLongMap!1677)

(assert (=> bm!13402 (= call!13405 (getCurrentListMapNoExtraKeys!135 (_keys!4493 newMap!16) (ite (or c!22645 c!22647) (_values!2747 newMap!16) (array!4688 (store (arr!2220 (_values!2747 newMap!16)) (index!3231 lt!64093) (ValueCellFull!1074 (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2483 (_values!2747 newMap!16)))) (mask!7010 newMap!16) (ite c!22645 (ite c!22640 (extraKeys!2549 newMap!16) lt!64103) (extraKeys!2549 newMap!16)) (zeroValue!2629 newMap!16) (ite c!22645 (ite c!22640 (minValue!2629 newMap!16) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2629 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!2764 newMap!16)))))

(declare-fun b!125099 () Bool)

(declare-fun e!81744 () Bool)

(declare-fun e!81748 () Bool)

(assert (=> b!125099 (= e!81744 e!81748)))

(assert (=> b!125099 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2482 (_keys!4493 newMap!16))))))

(declare-fun res!60602 () Bool)

(assert (=> b!125099 (= res!60602 (contains!873 lt!64458 (select (arr!2219 (_keys!4493 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!125099 (=> (not res!60602) (not e!81748))))

(declare-fun b!125100 () Bool)

(assert (=> b!125100 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2482 (_keys!4493 newMap!16))))))

(assert (=> b!125100 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2483 (ite (or c!22645 c!22647) (_values!2747 newMap!16) (array!4688 (store (arr!2220 (_values!2747 newMap!16)) (index!3231 lt!64093) (ValueCellFull!1074 (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2483 (_values!2747 newMap!16)))))))))

(assert (=> b!125100 (= e!81748 (= (apply!110 lt!64458 (select (arr!2219 (_keys!4493 newMap!16)) #b00000000000000000000000000000000)) (get!1436 (select (arr!2220 (ite (or c!22645 c!22647) (_values!2747 newMap!16) (array!4688 (store (arr!2220 (_values!2747 newMap!16)) (index!3231 lt!64093) (ValueCellFull!1074 (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2483 (_values!2747 newMap!16))))) #b00000000000000000000000000000000) (dynLambda!411 (defaultEntry!2764 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!37467 () Bool)

(assert (=> d!37467 e!81745))

(declare-fun res!60603 () Bool)

(assert (=> d!37467 (=> (not res!60603) (not e!81745))))

(assert (=> d!37467 (= res!60603 (not (contains!873 lt!64458 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!81746 () ListLongMap!1677)

(assert (=> d!37467 (= lt!64458 e!81746)))

(declare-fun c!22767 () Bool)

(assert (=> d!37467 (= c!22767 (bvsge #b00000000000000000000000000000000 (size!2482 (_keys!4493 newMap!16))))))

(assert (=> d!37467 (validMask!0 (mask!7010 newMap!16))))

(assert (=> d!37467 (= (getCurrentListMapNoExtraKeys!135 (_keys!4493 newMap!16) (ite (or c!22645 c!22647) (_values!2747 newMap!16) (array!4688 (store (arr!2220 (_values!2747 newMap!16)) (index!3231 lt!64093) (ValueCellFull!1074 (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2483 (_values!2747 newMap!16)))) (mask!7010 newMap!16) (ite c!22645 (ite c!22640 (extraKeys!2549 newMap!16) lt!64103) (extraKeys!2549 newMap!16)) (zeroValue!2629 newMap!16) (ite c!22645 (ite c!22640 (minValue!2629 newMap!16) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2629 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2764 newMap!16)) lt!64458)))

(declare-fun b!125101 () Bool)

(declare-fun e!81749 () Bool)

(assert (=> b!125101 (= e!81749 (validKeyInArray!0 (select (arr!2219 (_keys!4493 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!125101 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!125102 () Bool)

(assert (=> b!125102 (= e!81745 e!81744)))

(declare-fun c!22770 () Bool)

(assert (=> b!125102 (= c!22770 e!81749)))

(declare-fun res!60601 () Bool)

(assert (=> b!125102 (=> (not res!60601) (not e!81749))))

(assert (=> b!125102 (= res!60601 (bvslt #b00000000000000000000000000000000 (size!2482 (_keys!4493 newMap!16))))))

(declare-fun b!125103 () Bool)

(declare-fun e!81747 () Bool)

(assert (=> b!125103 (= e!81747 (isEmpty!394 lt!64458))))

(declare-fun b!125104 () Bool)

(declare-fun e!81750 () ListLongMap!1677)

(assert (=> b!125104 (= e!81750 call!13405)))

(declare-fun b!125105 () Bool)

(assert (=> b!125105 (= e!81746 (ListLongMap!1678 Nil!1692))))

(declare-fun b!125106 () Bool)

(declare-fun lt!64460 () Unit!3867)

(declare-fun lt!64454 () Unit!3867)

(assert (=> b!125106 (= lt!64460 lt!64454)))

(declare-fun lt!64459 () V!3427)

(declare-fun lt!64456 () (_ BitVec 64))

(declare-fun lt!64455 () ListLongMap!1677)

(declare-fun lt!64457 () (_ BitVec 64))

(assert (=> b!125106 (not (contains!873 (+!169 lt!64455 (tuple2!2569 lt!64456 lt!64459)) lt!64457))))

(assert (=> b!125106 (= lt!64454 (addStillNotContains!55 lt!64455 lt!64456 lt!64459 lt!64457))))

(assert (=> b!125106 (= lt!64457 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!125106 (= lt!64459 (get!1436 (select (arr!2220 (ite (or c!22645 c!22647) (_values!2747 newMap!16) (array!4688 (store (arr!2220 (_values!2747 newMap!16)) (index!3231 lt!64093) (ValueCellFull!1074 (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2483 (_values!2747 newMap!16))))) #b00000000000000000000000000000000) (dynLambda!411 (defaultEntry!2764 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!125106 (= lt!64456 (select (arr!2219 (_keys!4493 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!125106 (= lt!64455 call!13405)))

(assert (=> b!125106 (= e!81750 (+!169 call!13405 (tuple2!2569 (select (arr!2219 (_keys!4493 newMap!16)) #b00000000000000000000000000000000) (get!1436 (select (arr!2220 (ite (or c!22645 c!22647) (_values!2747 newMap!16) (array!4688 (store (arr!2220 (_values!2747 newMap!16)) (index!3231 lt!64093) (ValueCellFull!1074 (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2483 (_values!2747 newMap!16))))) #b00000000000000000000000000000000) (dynLambda!411 (defaultEntry!2764 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!125107 () Bool)

(assert (=> b!125107 (= e!81746 e!81750)))

(declare-fun c!22768 () Bool)

(assert (=> b!125107 (= c!22768 (validKeyInArray!0 (select (arr!2219 (_keys!4493 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!125108 () Bool)

(assert (=> b!125108 (= e!81747 (= lt!64458 (getCurrentListMapNoExtraKeys!135 (_keys!4493 newMap!16) (ite (or c!22645 c!22647) (_values!2747 newMap!16) (array!4688 (store (arr!2220 (_values!2747 newMap!16)) (index!3231 lt!64093) (ValueCellFull!1074 (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2483 (_values!2747 newMap!16)))) (mask!7010 newMap!16) (ite c!22645 (ite c!22640 (extraKeys!2549 newMap!16) lt!64103) (extraKeys!2549 newMap!16)) (zeroValue!2629 newMap!16) (ite c!22645 (ite c!22640 (minValue!2629 newMap!16) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2629 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!2764 newMap!16))))))

(declare-fun b!125109 () Bool)

(assert (=> b!125109 (= e!81744 e!81747)))

(declare-fun c!22769 () Bool)

(assert (=> b!125109 (= c!22769 (bvslt #b00000000000000000000000000000000 (size!2482 (_keys!4493 newMap!16))))))

(assert (= (and d!37467 c!22767) b!125105))

(assert (= (and d!37467 (not c!22767)) b!125107))

(assert (= (and b!125107 c!22768) b!125106))

(assert (= (and b!125107 (not c!22768)) b!125104))

(assert (= (or b!125106 b!125104) bm!13402))

(assert (= (and d!37467 res!60603) b!125098))

(assert (= (and b!125098 res!60600) b!125102))

(assert (= (and b!125102 res!60601) b!125101))

(assert (= (and b!125102 c!22770) b!125099))

(assert (= (and b!125102 (not c!22770)) b!125109))

(assert (= (and b!125099 res!60602) b!125100))

(assert (= (and b!125109 c!22769) b!125108))

(assert (= (and b!125109 (not c!22769)) b!125103))

(declare-fun b_lambda!5497 () Bool)

(assert (=> (not b_lambda!5497) (not b!125100)))

(assert (=> b!125100 t!6029))

(declare-fun b_and!7699 () Bool)

(assert (= b_and!7695 (and (=> t!6029 result!3819) b_and!7699)))

(assert (=> b!125100 t!6031))

(declare-fun b_and!7701 () Bool)

(assert (= b_and!7697 (and (=> t!6031 result!3821) b_and!7701)))

(declare-fun b_lambda!5499 () Bool)

(assert (=> (not b_lambda!5499) (not b!125106)))

(assert (=> b!125106 t!6029))

(declare-fun b_and!7703 () Bool)

(assert (= b_and!7699 (and (=> t!6029 result!3819) b_and!7703)))

(assert (=> b!125106 t!6031))

(declare-fun b_and!7705 () Bool)

(assert (= b_and!7701 (and (=> t!6031 result!3821) b_and!7705)))

(declare-fun m!145299 () Bool)

(assert (=> bm!13402 m!145299))

(assert (=> b!125101 m!144619))

(assert (=> b!125101 m!144619))

(assert (=> b!125101 m!144629))

(assert (=> b!125099 m!144619))

(assert (=> b!125099 m!144619))

(declare-fun m!145301 () Bool)

(assert (=> b!125099 m!145301))

(declare-fun m!145303 () Bool)

(assert (=> b!125103 m!145303))

(assert (=> b!125100 m!144619))

(declare-fun m!145305 () Bool)

(assert (=> b!125100 m!145305))

(assert (=> b!125100 m!144619))

(assert (=> b!125100 m!144721))

(assert (=> b!125100 m!144917))

(assert (=> b!125100 m!144917))

(assert (=> b!125100 m!144721))

(assert (=> b!125100 m!144919))

(declare-fun m!145307 () Bool)

(assert (=> b!125106 m!145307))

(declare-fun m!145309 () Bool)

(assert (=> b!125106 m!145309))

(assert (=> b!125106 m!144917))

(assert (=> b!125106 m!144917))

(assert (=> b!125106 m!144721))

(assert (=> b!125106 m!144919))

(assert (=> b!125106 m!144619))

(declare-fun m!145311 () Bool)

(assert (=> b!125106 m!145311))

(assert (=> b!125106 m!144721))

(assert (=> b!125106 m!145311))

(declare-fun m!145313 () Bool)

(assert (=> b!125106 m!145313))

(assert (=> b!125107 m!144619))

(assert (=> b!125107 m!144619))

(assert (=> b!125107 m!144629))

(assert (=> b!125108 m!145299))

(declare-fun m!145315 () Bool)

(assert (=> b!125098 m!145315))

(declare-fun m!145317 () Bool)

(assert (=> d!37467 m!145317))

(assert (=> d!37467 m!144633))

(assert (=> b!124929 d!37467))

(declare-fun d!37469 () Bool)

(declare-fun e!81751 () Bool)

(assert (=> d!37469 e!81751))

(declare-fun res!60604 () Bool)

(assert (=> d!37469 (=> (not res!60604) (not e!81751))))

(declare-fun lt!64461 () ListLongMap!1677)

(assert (=> d!37469 (= res!60604 (contains!873 lt!64461 (_1!1295 (tuple2!2569 lt!64326 (ite c!22645 (ite c!22640 (minValue!2629 newMap!16) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2629 newMap!16))))))))

(declare-fun lt!64462 () List!1695)

(assert (=> d!37469 (= lt!64461 (ListLongMap!1678 lt!64462))))

(declare-fun lt!64464 () Unit!3867)

(declare-fun lt!64463 () Unit!3867)

(assert (=> d!37469 (= lt!64464 lt!64463)))

(assert (=> d!37469 (= (getValueByKey!166 lt!64462 (_1!1295 (tuple2!2569 lt!64326 (ite c!22645 (ite c!22640 (minValue!2629 newMap!16) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2629 newMap!16))))) (Some!171 (_2!1295 (tuple2!2569 lt!64326 (ite c!22645 (ite c!22640 (minValue!2629 newMap!16) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2629 newMap!16))))))))

(assert (=> d!37469 (= lt!64463 (lemmaContainsTupThenGetReturnValue!81 lt!64462 (_1!1295 (tuple2!2569 lt!64326 (ite c!22645 (ite c!22640 (minValue!2629 newMap!16) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2629 newMap!16)))) (_2!1295 (tuple2!2569 lt!64326 (ite c!22645 (ite c!22640 (minValue!2629 newMap!16) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2629 newMap!16))))))))

(assert (=> d!37469 (= lt!64462 (insertStrictlySorted!84 (toList!854 lt!64343) (_1!1295 (tuple2!2569 lt!64326 (ite c!22645 (ite c!22640 (minValue!2629 newMap!16) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2629 newMap!16)))) (_2!1295 (tuple2!2569 lt!64326 (ite c!22645 (ite c!22640 (minValue!2629 newMap!16) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2629 newMap!16))))))))

(assert (=> d!37469 (= (+!169 lt!64343 (tuple2!2569 lt!64326 (ite c!22645 (ite c!22640 (minValue!2629 newMap!16) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2629 newMap!16)))) lt!64461)))

(declare-fun b!125110 () Bool)

(declare-fun res!60605 () Bool)

(assert (=> b!125110 (=> (not res!60605) (not e!81751))))

(assert (=> b!125110 (= res!60605 (= (getValueByKey!166 (toList!854 lt!64461) (_1!1295 (tuple2!2569 lt!64326 (ite c!22645 (ite c!22640 (minValue!2629 newMap!16) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2629 newMap!16))))) (Some!171 (_2!1295 (tuple2!2569 lt!64326 (ite c!22645 (ite c!22640 (minValue!2629 newMap!16) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2629 newMap!16)))))))))

(declare-fun b!125111 () Bool)

(assert (=> b!125111 (= e!81751 (contains!874 (toList!854 lt!64461) (tuple2!2569 lt!64326 (ite c!22645 (ite c!22640 (minValue!2629 newMap!16) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2629 newMap!16)))))))

(assert (= (and d!37469 res!60604) b!125110))

(assert (= (and b!125110 res!60605) b!125111))

(declare-fun m!145319 () Bool)

(assert (=> d!37469 m!145319))

(declare-fun m!145321 () Bool)

(assert (=> d!37469 m!145321))

(declare-fun m!145323 () Bool)

(assert (=> d!37469 m!145323))

(declare-fun m!145325 () Bool)

(assert (=> d!37469 m!145325))

(declare-fun m!145327 () Bool)

(assert (=> b!125110 m!145327))

(declare-fun m!145329 () Bool)

(assert (=> b!125111 m!145329))

(assert (=> b!124929 d!37469))

(declare-fun d!37471 () Bool)

(declare-fun e!81752 () Bool)

(assert (=> d!37471 e!81752))

(declare-fun res!60606 () Bool)

(assert (=> d!37471 (=> (not res!60606) (not e!81752))))

(declare-fun lt!64465 () ListLongMap!1677)

(assert (=> d!37471 (= res!60606 (contains!873 lt!64465 (_1!1295 (tuple2!2569 lt!64328 (ite c!22645 (ite c!22640 (minValue!2629 newMap!16) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2629 newMap!16))))))))

(declare-fun lt!64466 () List!1695)

(assert (=> d!37471 (= lt!64465 (ListLongMap!1678 lt!64466))))

(declare-fun lt!64468 () Unit!3867)

(declare-fun lt!64467 () Unit!3867)

(assert (=> d!37471 (= lt!64468 lt!64467)))

(assert (=> d!37471 (= (getValueByKey!166 lt!64466 (_1!1295 (tuple2!2569 lt!64328 (ite c!22645 (ite c!22640 (minValue!2629 newMap!16) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2629 newMap!16))))) (Some!171 (_2!1295 (tuple2!2569 lt!64328 (ite c!22645 (ite c!22640 (minValue!2629 newMap!16) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2629 newMap!16))))))))

(assert (=> d!37471 (= lt!64467 (lemmaContainsTupThenGetReturnValue!81 lt!64466 (_1!1295 (tuple2!2569 lt!64328 (ite c!22645 (ite c!22640 (minValue!2629 newMap!16) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2629 newMap!16)))) (_2!1295 (tuple2!2569 lt!64328 (ite c!22645 (ite c!22640 (minValue!2629 newMap!16) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2629 newMap!16))))))))

(assert (=> d!37471 (= lt!64466 (insertStrictlySorted!84 (toList!854 lt!64331) (_1!1295 (tuple2!2569 lt!64328 (ite c!22645 (ite c!22640 (minValue!2629 newMap!16) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2629 newMap!16)))) (_2!1295 (tuple2!2569 lt!64328 (ite c!22645 (ite c!22640 (minValue!2629 newMap!16) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2629 newMap!16))))))))

(assert (=> d!37471 (= (+!169 lt!64331 (tuple2!2569 lt!64328 (ite c!22645 (ite c!22640 (minValue!2629 newMap!16) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2629 newMap!16)))) lt!64465)))

(declare-fun b!125112 () Bool)

(declare-fun res!60607 () Bool)

(assert (=> b!125112 (=> (not res!60607) (not e!81752))))

(assert (=> b!125112 (= res!60607 (= (getValueByKey!166 (toList!854 lt!64465) (_1!1295 (tuple2!2569 lt!64328 (ite c!22645 (ite c!22640 (minValue!2629 newMap!16) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2629 newMap!16))))) (Some!171 (_2!1295 (tuple2!2569 lt!64328 (ite c!22645 (ite c!22640 (minValue!2629 newMap!16) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2629 newMap!16)))))))))

(declare-fun b!125113 () Bool)

(assert (=> b!125113 (= e!81752 (contains!874 (toList!854 lt!64465) (tuple2!2569 lt!64328 (ite c!22645 (ite c!22640 (minValue!2629 newMap!16) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2629 newMap!16)))))))

(assert (= (and d!37471 res!60606) b!125112))

(assert (= (and b!125112 res!60607) b!125113))

(declare-fun m!145331 () Bool)

(assert (=> d!37471 m!145331))

(declare-fun m!145333 () Bool)

(assert (=> d!37471 m!145333))

(declare-fun m!145335 () Bool)

(assert (=> d!37471 m!145335))

(declare-fun m!145337 () Bool)

(assert (=> d!37471 m!145337))

(declare-fun m!145339 () Bool)

(assert (=> b!125112 m!145339))

(declare-fun m!145341 () Bool)

(assert (=> b!125113 m!145341))

(assert (=> b!124929 d!37471))

(declare-fun d!37473 () Bool)

(assert (=> d!37473 (= (apply!110 lt!64334 lt!64332) (get!1439 (getValueByKey!166 (toList!854 lt!64334) lt!64332)))))

(declare-fun bs!5165 () Bool)

(assert (= bs!5165 d!37473))

(declare-fun m!145343 () Bool)

(assert (=> bs!5165 m!145343))

(assert (=> bs!5165 m!145343))

(declare-fun m!145345 () Bool)

(assert (=> bs!5165 m!145345))

(assert (=> b!124929 d!37473))

(declare-fun d!37475 () Bool)

(declare-fun e!81753 () Bool)

(assert (=> d!37475 e!81753))

(declare-fun res!60608 () Bool)

(assert (=> d!37475 (=> (not res!60608) (not e!81753))))

(declare-fun lt!64469 () ListLongMap!1677)

(assert (=> d!37475 (= res!60608 (contains!873 lt!64469 (_1!1295 (tuple2!2569 lt!64330 (zeroValue!2629 newMap!16)))))))

(declare-fun lt!64470 () List!1695)

(assert (=> d!37475 (= lt!64469 (ListLongMap!1678 lt!64470))))

(declare-fun lt!64472 () Unit!3867)

(declare-fun lt!64471 () Unit!3867)

(assert (=> d!37475 (= lt!64472 lt!64471)))

(assert (=> d!37475 (= (getValueByKey!166 lt!64470 (_1!1295 (tuple2!2569 lt!64330 (zeroValue!2629 newMap!16)))) (Some!171 (_2!1295 (tuple2!2569 lt!64330 (zeroValue!2629 newMap!16)))))))

(assert (=> d!37475 (= lt!64471 (lemmaContainsTupThenGetReturnValue!81 lt!64470 (_1!1295 (tuple2!2569 lt!64330 (zeroValue!2629 newMap!16))) (_2!1295 (tuple2!2569 lt!64330 (zeroValue!2629 newMap!16)))))))

(assert (=> d!37475 (= lt!64470 (insertStrictlySorted!84 (toList!854 lt!64324) (_1!1295 (tuple2!2569 lt!64330 (zeroValue!2629 newMap!16))) (_2!1295 (tuple2!2569 lt!64330 (zeroValue!2629 newMap!16)))))))

(assert (=> d!37475 (= (+!169 lt!64324 (tuple2!2569 lt!64330 (zeroValue!2629 newMap!16))) lt!64469)))

(declare-fun b!125114 () Bool)

(declare-fun res!60609 () Bool)

(assert (=> b!125114 (=> (not res!60609) (not e!81753))))

(assert (=> b!125114 (= res!60609 (= (getValueByKey!166 (toList!854 lt!64469) (_1!1295 (tuple2!2569 lt!64330 (zeroValue!2629 newMap!16)))) (Some!171 (_2!1295 (tuple2!2569 lt!64330 (zeroValue!2629 newMap!16))))))))

(declare-fun b!125115 () Bool)

(assert (=> b!125115 (= e!81753 (contains!874 (toList!854 lt!64469) (tuple2!2569 lt!64330 (zeroValue!2629 newMap!16))))))

(assert (= (and d!37475 res!60608) b!125114))

(assert (= (and b!125114 res!60609) b!125115))

(declare-fun m!145347 () Bool)

(assert (=> d!37475 m!145347))

(declare-fun m!145349 () Bool)

(assert (=> d!37475 m!145349))

(declare-fun m!145351 () Bool)

(assert (=> d!37475 m!145351))

(declare-fun m!145353 () Bool)

(assert (=> d!37475 m!145353))

(declare-fun m!145355 () Bool)

(assert (=> b!125114 m!145355))

(declare-fun m!145357 () Bool)

(assert (=> b!125115 m!145357))

(assert (=> b!124929 d!37475))

(declare-fun d!37477 () Bool)

(assert (=> d!37477 (= (apply!110 lt!64343 lt!64338) (get!1439 (getValueByKey!166 (toList!854 lt!64343) lt!64338)))))

(declare-fun bs!5166 () Bool)

(assert (= bs!5166 d!37477))

(declare-fun m!145359 () Bool)

(assert (=> bs!5166 m!145359))

(assert (=> bs!5166 m!145359))

(declare-fun m!145361 () Bool)

(assert (=> bs!5166 m!145361))

(assert (=> b!124929 d!37477))

(declare-fun d!37479 () Bool)

(assert (=> d!37479 (contains!873 (+!169 lt!64324 (tuple2!2569 lt!64330 (zeroValue!2629 newMap!16))) lt!64340)))

(declare-fun lt!64473 () Unit!3867)

(assert (=> d!37479 (= lt!64473 (choose!755 lt!64324 lt!64330 (zeroValue!2629 newMap!16) lt!64340))))

(assert (=> d!37479 (contains!873 lt!64324 lt!64340)))

(assert (=> d!37479 (= (addStillContains!86 lt!64324 lt!64330 (zeroValue!2629 newMap!16) lt!64340) lt!64473)))

(declare-fun bs!5167 () Bool)

(assert (= bs!5167 d!37479))

(assert (=> bs!5167 m!144929))

(assert (=> bs!5167 m!144929))

(assert (=> bs!5167 m!144943))

(declare-fun m!145363 () Bool)

(assert (=> bs!5167 m!145363))

(declare-fun m!145365 () Bool)

(assert (=> bs!5167 m!145365))

(assert (=> b!124929 d!37479))

(declare-fun d!37481 () Bool)

(assert (=> d!37481 (= (apply!110 (+!169 lt!64334 (tuple2!2569 lt!64344 (zeroValue!2629 newMap!16))) lt!64332) (apply!110 lt!64334 lt!64332))))

(declare-fun lt!64474 () Unit!3867)

(assert (=> d!37481 (= lt!64474 (choose!754 lt!64334 lt!64344 (zeroValue!2629 newMap!16) lt!64332))))

(declare-fun e!81754 () Bool)

(assert (=> d!37481 e!81754))

(declare-fun res!60610 () Bool)

(assert (=> d!37481 (=> (not res!60610) (not e!81754))))

(assert (=> d!37481 (= res!60610 (contains!873 lt!64334 lt!64332))))

(assert (=> d!37481 (= (addApplyDifferent!86 lt!64334 lt!64344 (zeroValue!2629 newMap!16) lt!64332) lt!64474)))

(declare-fun b!125116 () Bool)

(assert (=> b!125116 (= e!81754 (not (= lt!64332 lt!64344)))))

(assert (= (and d!37481 res!60610) b!125116))

(assert (=> d!37481 m!144939))

(declare-fun m!145367 () Bool)

(assert (=> d!37481 m!145367))

(assert (=> d!37481 m!144933))

(assert (=> d!37481 m!144939))

(assert (=> d!37481 m!144941))

(declare-fun m!145369 () Bool)

(assert (=> d!37481 m!145369))

(assert (=> b!124929 d!37481))

(declare-fun d!37483 () Bool)

(assert (=> d!37483 (= (apply!110 (+!169 lt!64331 (tuple2!2569 lt!64328 (ite c!22645 (ite c!22640 (minValue!2629 newMap!16) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2629 newMap!16)))) lt!64329) (get!1439 (getValueByKey!166 (toList!854 (+!169 lt!64331 (tuple2!2569 lt!64328 (ite c!22645 (ite c!22640 (minValue!2629 newMap!16) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2629 newMap!16))))) lt!64329)))))

(declare-fun bs!5168 () Bool)

(assert (= bs!5168 d!37483))

(declare-fun m!145371 () Bool)

(assert (=> bs!5168 m!145371))

(assert (=> bs!5168 m!145371))

(declare-fun m!145373 () Bool)

(assert (=> bs!5168 m!145373))

(assert (=> b!124929 d!37483))

(declare-fun d!37485 () Bool)

(assert (=> d!37485 (= (apply!110 (+!169 lt!64334 (tuple2!2569 lt!64344 (zeroValue!2629 newMap!16))) lt!64332) (get!1439 (getValueByKey!166 (toList!854 (+!169 lt!64334 (tuple2!2569 lt!64344 (zeroValue!2629 newMap!16)))) lt!64332)))))

(declare-fun bs!5169 () Bool)

(assert (= bs!5169 d!37485))

(declare-fun m!145375 () Bool)

(assert (=> bs!5169 m!145375))

(assert (=> bs!5169 m!145375))

(declare-fun m!145377 () Bool)

(assert (=> bs!5169 m!145377))

(assert (=> b!124929 d!37485))

(declare-fun d!37487 () Bool)

(assert (=> d!37487 (= (apply!110 (+!169 lt!64343 (tuple2!2569 lt!64326 (ite c!22645 (ite c!22640 (minValue!2629 newMap!16) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2629 newMap!16)))) lt!64338) (apply!110 lt!64343 lt!64338))))

(declare-fun lt!64475 () Unit!3867)

(assert (=> d!37487 (= lt!64475 (choose!754 lt!64343 lt!64326 (ite c!22645 (ite c!22640 (minValue!2629 newMap!16) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2629 newMap!16)) lt!64338))))

(declare-fun e!81755 () Bool)

(assert (=> d!37487 e!81755))

(declare-fun res!60611 () Bool)

(assert (=> d!37487 (=> (not res!60611) (not e!81755))))

(assert (=> d!37487 (= res!60611 (contains!873 lt!64343 lt!64338))))

(assert (=> d!37487 (= (addApplyDifferent!86 lt!64343 lt!64326 (ite c!22645 (ite c!22640 (minValue!2629 newMap!16) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2629 newMap!16)) lt!64338) lt!64475)))

(declare-fun b!125117 () Bool)

(assert (=> b!125117 (= e!81755 (not (= lt!64338 lt!64326)))))

(assert (= (and d!37487 res!60611) b!125117))

(assert (=> d!37487 m!144935))

(declare-fun m!145379 () Bool)

(assert (=> d!37487 m!145379))

(assert (=> d!37487 m!144931))

(assert (=> d!37487 m!144935))

(assert (=> d!37487 m!144937))

(declare-fun m!145381 () Bool)

(assert (=> d!37487 m!145381))

(assert (=> b!124929 d!37487))

(declare-fun d!37489 () Bool)

(assert (=> d!37489 (= (apply!110 lt!64331 lt!64329) (get!1439 (getValueByKey!166 (toList!854 lt!64331) lt!64329)))))

(declare-fun bs!5170 () Bool)

(assert (= bs!5170 d!37489))

(declare-fun m!145383 () Bool)

(assert (=> bs!5170 m!145383))

(assert (=> bs!5170 m!145383))

(declare-fun m!145385 () Bool)

(assert (=> bs!5170 m!145385))

(assert (=> b!124929 d!37489))

(declare-fun d!37491 () Bool)

(declare-fun res!60612 () Bool)

(declare-fun e!81756 () Bool)

(assert (=> d!37491 (=> (not res!60612) (not e!81756))))

(assert (=> d!37491 (= res!60612 (simpleValid!86 (_2!1296 lt!64299)))))

(assert (=> d!37491 (= (valid!502 (_2!1296 lt!64299)) e!81756)))

(declare-fun b!125118 () Bool)

(declare-fun res!60613 () Bool)

(assert (=> b!125118 (=> (not res!60613) (not e!81756))))

(assert (=> b!125118 (= res!60613 (= (arrayCountValidKeys!0 (_keys!4493 (_2!1296 lt!64299)) #b00000000000000000000000000000000 (size!2482 (_keys!4493 (_2!1296 lt!64299)))) (_size!577 (_2!1296 lt!64299))))))

(declare-fun b!125119 () Bool)

(declare-fun res!60614 () Bool)

(assert (=> b!125119 (=> (not res!60614) (not e!81756))))

(assert (=> b!125119 (= res!60614 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4493 (_2!1296 lt!64299)) (mask!7010 (_2!1296 lt!64299))))))

(declare-fun b!125120 () Bool)

(assert (=> b!125120 (= e!81756 (arrayNoDuplicates!0 (_keys!4493 (_2!1296 lt!64299)) #b00000000000000000000000000000000 Nil!1693))))

(assert (= (and d!37491 res!60612) b!125118))

(assert (= (and b!125118 res!60613) b!125119))

(assert (= (and b!125119 res!60614) b!125120))

(declare-fun m!145387 () Bool)

(assert (=> d!37491 m!145387))

(declare-fun m!145389 () Bool)

(assert (=> b!125118 m!145389))

(declare-fun m!145391 () Bool)

(assert (=> b!125119 m!145391))

(declare-fun m!145393 () Bool)

(assert (=> b!125120 m!145393))

(assert (=> b!124900 d!37491))

(assert (=> b!124742 d!37455))

(declare-fun d!37493 () Bool)

(assert (=> d!37493 (= (size!2486 newMap!16) (bvadd (_size!577 newMap!16) (bvsdiv (bvadd (extraKeys!2549 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000010)))))

(assert (=> b!124710 d!37493))

(declare-fun d!37495 () Bool)

(declare-fun res!60615 () Bool)

(declare-fun e!81757 () Bool)

(assert (=> d!37495 (=> res!60615 e!81757)))

(assert (=> d!37495 (= res!60615 (and ((_ is Cons!1691) (toList!854 (+!169 lt!63997 (tuple2!2569 lt!64003 (zeroValue!2629 (v!3108 (underlying!436 thiss!992))))))) (= (_1!1295 (h!2292 (toList!854 (+!169 lt!63997 (tuple2!2569 lt!64003 (zeroValue!2629 (v!3108 (underlying!436 thiss!992)))))))) lt!64013)))))

(assert (=> d!37495 (= (containsKey!170 (toList!854 (+!169 lt!63997 (tuple2!2569 lt!64003 (zeroValue!2629 (v!3108 (underlying!436 thiss!992)))))) lt!64013) e!81757)))

(declare-fun b!125121 () Bool)

(declare-fun e!81758 () Bool)

(assert (=> b!125121 (= e!81757 e!81758)))

(declare-fun res!60616 () Bool)

(assert (=> b!125121 (=> (not res!60616) (not e!81758))))

(assert (=> b!125121 (= res!60616 (and (or (not ((_ is Cons!1691) (toList!854 (+!169 lt!63997 (tuple2!2569 lt!64003 (zeroValue!2629 (v!3108 (underlying!436 thiss!992)))))))) (bvsle (_1!1295 (h!2292 (toList!854 (+!169 lt!63997 (tuple2!2569 lt!64003 (zeroValue!2629 (v!3108 (underlying!436 thiss!992)))))))) lt!64013)) ((_ is Cons!1691) (toList!854 (+!169 lt!63997 (tuple2!2569 lt!64003 (zeroValue!2629 (v!3108 (underlying!436 thiss!992))))))) (bvslt (_1!1295 (h!2292 (toList!854 (+!169 lt!63997 (tuple2!2569 lt!64003 (zeroValue!2629 (v!3108 (underlying!436 thiss!992)))))))) lt!64013)))))

(declare-fun b!125122 () Bool)

(assert (=> b!125122 (= e!81758 (containsKey!170 (t!6022 (toList!854 (+!169 lt!63997 (tuple2!2569 lt!64003 (zeroValue!2629 (v!3108 (underlying!436 thiss!992))))))) lt!64013))))

(assert (= (and d!37495 (not res!60615)) b!125121))

(assert (= (and b!125121 res!60616) b!125122))

(declare-fun m!145395 () Bool)

(assert (=> b!125122 m!145395))

(assert (=> d!37403 d!37495))

(declare-fun d!37497 () Bool)

(declare-fun lt!64478 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!123 (List!1695) (InoxSet tuple2!2568))

(assert (=> d!37497 (= lt!64478 (select (content!123 (toList!854 lt!64309)) (tuple2!2569 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!81764 () Bool)

(assert (=> d!37497 (= lt!64478 e!81764)))

(declare-fun res!60621 () Bool)

(assert (=> d!37497 (=> (not res!60621) (not e!81764))))

(assert (=> d!37497 (= res!60621 ((_ is Cons!1691) (toList!854 lt!64309)))))

(assert (=> d!37497 (= (contains!874 (toList!854 lt!64309) (tuple2!2569 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!64478)))

(declare-fun b!125127 () Bool)

(declare-fun e!81763 () Bool)

(assert (=> b!125127 (= e!81764 e!81763)))

(declare-fun res!60622 () Bool)

(assert (=> b!125127 (=> res!60622 e!81763)))

(assert (=> b!125127 (= res!60622 (= (h!2292 (toList!854 lt!64309)) (tuple2!2569 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!125128 () Bool)

(assert (=> b!125128 (= e!81763 (contains!874 (t!6022 (toList!854 lt!64309)) (tuple2!2569 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!37497 res!60621) b!125127))

(assert (= (and b!125127 (not res!60622)) b!125128))

(declare-fun m!145397 () Bool)

(assert (=> d!37497 m!145397))

(declare-fun m!145399 () Bool)

(assert (=> d!37497 m!145399))

(declare-fun m!145401 () Bool)

(assert (=> b!125128 m!145401))

(assert (=> b!124904 d!37497))

(declare-fun d!37499 () Bool)

(assert (=> d!37499 (= (get!1439 (getValueByKey!166 (toList!854 lt!64007) lt!64005)) (v!3112 (getValueByKey!166 (toList!854 lt!64007) lt!64005)))))

(assert (=> d!37405 d!37499))

(declare-fun d!37501 () Bool)

(declare-fun c!22771 () Bool)

(assert (=> d!37501 (= c!22771 (and ((_ is Cons!1691) (toList!854 lt!64007)) (= (_1!1295 (h!2292 (toList!854 lt!64007))) lt!64005)))))

(declare-fun e!81765 () Option!172)

(assert (=> d!37501 (= (getValueByKey!166 (toList!854 lt!64007) lt!64005) e!81765)))

(declare-fun b!125129 () Bool)

(assert (=> b!125129 (= e!81765 (Some!171 (_2!1295 (h!2292 (toList!854 lt!64007)))))))

(declare-fun b!125131 () Bool)

(declare-fun e!81766 () Option!172)

(assert (=> b!125131 (= e!81766 (getValueByKey!166 (t!6022 (toList!854 lt!64007)) lt!64005))))

(declare-fun b!125132 () Bool)

(assert (=> b!125132 (= e!81766 None!170)))

(declare-fun b!125130 () Bool)

(assert (=> b!125130 (= e!81765 e!81766)))

(declare-fun c!22772 () Bool)

(assert (=> b!125130 (= c!22772 (and ((_ is Cons!1691) (toList!854 lt!64007)) (not (= (_1!1295 (h!2292 (toList!854 lt!64007))) lt!64005))))))

(assert (= (and d!37501 c!22771) b!125129))

(assert (= (and d!37501 (not c!22771)) b!125130))

(assert (= (and b!125130 c!22772) b!125131))

(assert (= (and b!125130 (not c!22772)) b!125132))

(declare-fun m!145403 () Bool)

(assert (=> b!125131 m!145403))

(assert (=> d!37405 d!37501))

(declare-fun d!37503 () Bool)

(assert (=> d!37503 (= (get!1439 (getValueByKey!166 (toList!854 lt!64004) lt!64002)) (v!3112 (getValueByKey!166 (toList!854 lt!64004) lt!64002)))))

(assert (=> d!37389 d!37503))

(declare-fun d!37505 () Bool)

(declare-fun c!22773 () Bool)

(assert (=> d!37505 (= c!22773 (and ((_ is Cons!1691) (toList!854 lt!64004)) (= (_1!1295 (h!2292 (toList!854 lt!64004))) lt!64002)))))

(declare-fun e!81767 () Option!172)

(assert (=> d!37505 (= (getValueByKey!166 (toList!854 lt!64004) lt!64002) e!81767)))

(declare-fun b!125133 () Bool)

(assert (=> b!125133 (= e!81767 (Some!171 (_2!1295 (h!2292 (toList!854 lt!64004)))))))

(declare-fun b!125135 () Bool)

(declare-fun e!81768 () Option!172)

(assert (=> b!125135 (= e!81768 (getValueByKey!166 (t!6022 (toList!854 lt!64004)) lt!64002))))

(declare-fun b!125136 () Bool)

(assert (=> b!125136 (= e!81768 None!170)))

(declare-fun b!125134 () Bool)

(assert (=> b!125134 (= e!81767 e!81768)))

(declare-fun c!22774 () Bool)

(assert (=> b!125134 (= c!22774 (and ((_ is Cons!1691) (toList!854 lt!64004)) (not (= (_1!1295 (h!2292 (toList!854 lt!64004))) lt!64002))))))

(assert (= (and d!37505 c!22773) b!125133))

(assert (= (and d!37505 (not c!22773)) b!125134))

(assert (= (and b!125134 c!22774) b!125135))

(assert (= (and b!125134 (not c!22774)) b!125136))

(declare-fun m!145405 () Bool)

(assert (=> b!125135 m!145405))

(assert (=> d!37389 d!37505))

(declare-fun d!37507 () Bool)

(assert (=> d!37507 (= (inRange!0 (ite c!22717 (index!3231 lt!64285) (ite c!22718 (index!3230 lt!64306) (index!3233 lt!64306))) (mask!7010 newMap!16)) (and (bvsge (ite c!22717 (index!3231 lt!64285) (ite c!22718 (index!3230 lt!64306) (index!3233 lt!64306))) #b00000000000000000000000000000000) (bvslt (ite c!22717 (index!3231 lt!64285) (ite c!22718 (index!3230 lt!64306) (index!3233 lt!64306))) (bvadd (mask!7010 newMap!16) #b00000000000000000000000000000001))))))

(assert (=> bm!13371 d!37507))

(assert (=> bm!13346 d!37421))

(declare-fun d!37509 () Bool)

(declare-fun e!81769 () Bool)

(assert (=> d!37509 e!81769))

(declare-fun res!60623 () Bool)

(assert (=> d!37509 (=> res!60623 e!81769)))

(declare-fun lt!64481 () Bool)

(assert (=> d!37509 (= res!60623 (not lt!64481))))

(declare-fun lt!64482 () Bool)

(assert (=> d!37509 (= lt!64481 lt!64482)))

(declare-fun lt!64479 () Unit!3867)

(declare-fun e!81770 () Unit!3867)

(assert (=> d!37509 (= lt!64479 e!81770)))

(declare-fun c!22775 () Bool)

(assert (=> d!37509 (= c!22775 lt!64482)))

(assert (=> d!37509 (= lt!64482 (containsKey!170 (toList!854 lt!64339) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!37509 (= (contains!873 lt!64339 #b0000000000000000000000000000000000000000000000000000000000000000) lt!64481)))

(declare-fun b!125137 () Bool)

(declare-fun lt!64480 () Unit!3867)

(assert (=> b!125137 (= e!81770 lt!64480)))

(assert (=> b!125137 (= lt!64480 (lemmaContainsKeyImpliesGetValueByKeyDefined!118 (toList!854 lt!64339) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!125137 (isDefined!119 (getValueByKey!166 (toList!854 lt!64339) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!125138 () Bool)

(declare-fun Unit!3889 () Unit!3867)

(assert (=> b!125138 (= e!81770 Unit!3889)))

(declare-fun b!125139 () Bool)

(assert (=> b!125139 (= e!81769 (isDefined!119 (getValueByKey!166 (toList!854 lt!64339) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!37509 c!22775) b!125137))

(assert (= (and d!37509 (not c!22775)) b!125138))

(assert (= (and d!37509 (not res!60623)) b!125139))

(declare-fun m!145407 () Bool)

(assert (=> d!37509 m!145407))

(declare-fun m!145409 () Bool)

(assert (=> b!125137 m!145409))

(declare-fun m!145411 () Bool)

(assert (=> b!125137 m!145411))

(assert (=> b!125137 m!145411))

(declare-fun m!145413 () Bool)

(assert (=> b!125137 m!145413))

(assert (=> b!125139 m!145411))

(assert (=> b!125139 m!145411))

(assert (=> b!125139 m!145413))

(assert (=> bm!13379 d!37509))

(declare-fun d!37511 () Bool)

(assert (=> d!37511 (= (isDefined!119 (getValueByKey!166 (toList!854 lt!64012) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (isEmpty!393 (getValueByKey!166 (toList!854 lt!64012) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bs!5171 () Bool)

(assert (= bs!5171 d!37511))

(assert (=> bs!5171 m!145097))

(declare-fun m!145415 () Bool)

(assert (=> bs!5171 m!145415))

(assert (=> b!124972 d!37511))

(declare-fun d!37513 () Bool)

(declare-fun c!22776 () Bool)

(assert (=> d!37513 (= c!22776 (and ((_ is Cons!1691) (toList!854 lt!64012)) (= (_1!1295 (h!2292 (toList!854 lt!64012))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!81771 () Option!172)

(assert (=> d!37513 (= (getValueByKey!166 (toList!854 lt!64012) #b0000000000000000000000000000000000000000000000000000000000000000) e!81771)))

(declare-fun b!125140 () Bool)

(assert (=> b!125140 (= e!81771 (Some!171 (_2!1295 (h!2292 (toList!854 lt!64012)))))))

(declare-fun b!125142 () Bool)

(declare-fun e!81772 () Option!172)

(assert (=> b!125142 (= e!81772 (getValueByKey!166 (t!6022 (toList!854 lt!64012)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!125143 () Bool)

(assert (=> b!125143 (= e!81772 None!170)))

(declare-fun b!125141 () Bool)

(assert (=> b!125141 (= e!81771 e!81772)))

(declare-fun c!22777 () Bool)

(assert (=> b!125141 (= c!22777 (and ((_ is Cons!1691) (toList!854 lt!64012)) (not (= (_1!1295 (h!2292 (toList!854 lt!64012))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!37513 c!22776) b!125140))

(assert (= (and d!37513 (not c!22776)) b!125141))

(assert (= (and b!125141 c!22777) b!125142))

(assert (= (and b!125141 (not c!22777)) b!125143))

(declare-fun m!145417 () Bool)

(assert (=> b!125142 m!145417))

(assert (=> b!124972 d!37513))

(declare-fun d!37515 () Bool)

(assert (=> d!37515 (= (isDefined!119 (getValueByKey!166 (toList!854 lt!64012) (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))) (not (isEmpty!393 (getValueByKey!166 (toList!854 lt!64012) (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))))

(declare-fun bs!5172 () Bool)

(assert (= bs!5172 d!37515))

(assert (=> bs!5172 m!144773))

(declare-fun m!145419 () Bool)

(assert (=> bs!5172 m!145419))

(assert (=> b!124918 d!37515))

(declare-fun c!22778 () Bool)

(declare-fun d!37517 () Bool)

(assert (=> d!37517 (= c!22778 (and ((_ is Cons!1691) (toList!854 lt!64012)) (= (_1!1295 (h!2292 (toList!854 lt!64012))) (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(declare-fun e!81773 () Option!172)

(assert (=> d!37517 (= (getValueByKey!166 (toList!854 lt!64012) (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) e!81773)))

(declare-fun b!125144 () Bool)

(assert (=> b!125144 (= e!81773 (Some!171 (_2!1295 (h!2292 (toList!854 lt!64012)))))))

(declare-fun e!81774 () Option!172)

(declare-fun b!125146 () Bool)

(assert (=> b!125146 (= e!81774 (getValueByKey!166 (t!6022 (toList!854 lt!64012)) (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!125147 () Bool)

(assert (=> b!125147 (= e!81774 None!170)))

(declare-fun b!125145 () Bool)

(assert (=> b!125145 (= e!81773 e!81774)))

(declare-fun c!22779 () Bool)

(assert (=> b!125145 (= c!22779 (and ((_ is Cons!1691) (toList!854 lt!64012)) (not (= (_1!1295 (h!2292 (toList!854 lt!64012))) (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))))

(assert (= (and d!37517 c!22778) b!125144))

(assert (= (and d!37517 (not c!22778)) b!125145))

(assert (= (and b!125145 c!22779) b!125146))

(assert (= (and b!125145 (not c!22779)) b!125147))

(assert (=> b!125146 m!144493))

(declare-fun m!145421 () Bool)

(assert (=> b!125146 m!145421))

(assert (=> b!124918 d!37517))

(declare-fun d!37519 () Bool)

(declare-fun lt!64483 () (_ BitVec 32))

(assert (=> d!37519 (and (bvsge lt!64483 #b00000000000000000000000000000000) (bvsle lt!64483 (bvsub (size!2482 (_keys!4493 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun e!81775 () (_ BitVec 32))

(assert (=> d!37519 (= lt!64483 e!81775)))

(declare-fun c!22780 () Bool)

(assert (=> d!37519 (= c!22780 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2482 (_keys!4493 newMap!16))))))

(assert (=> d!37519 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2482 (_keys!4493 newMap!16))) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (size!2482 (_keys!4493 newMap!16)) (size!2482 (_keys!4493 newMap!16))))))

(assert (=> d!37519 (= (arrayCountValidKeys!0 (_keys!4493 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2482 (_keys!4493 newMap!16))) lt!64483)))

(declare-fun b!125148 () Bool)

(declare-fun e!81776 () (_ BitVec 32))

(assert (=> b!125148 (= e!81775 e!81776)))

(declare-fun c!22781 () Bool)

(assert (=> b!125148 (= c!22781 (validKeyInArray!0 (select (arr!2219 (_keys!4493 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!125149 () Bool)

(declare-fun call!13406 () (_ BitVec 32))

(assert (=> b!125149 (= e!81776 (bvadd #b00000000000000000000000000000001 call!13406))))

(declare-fun b!125150 () Bool)

(assert (=> b!125150 (= e!81776 call!13406)))

(declare-fun b!125151 () Bool)

(assert (=> b!125151 (= e!81775 #b00000000000000000000000000000000)))

(declare-fun bm!13403 () Bool)

(assert (=> bm!13403 (= call!13406 (arrayCountValidKeys!0 (_keys!4493 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!2482 (_keys!4493 newMap!16))))))

(assert (= (and d!37519 c!22780) b!125151))

(assert (= (and d!37519 (not c!22780)) b!125148))

(assert (= (and b!125148 c!22781) b!125149))

(assert (= (and b!125148 (not c!22781)) b!125150))

(assert (= (or b!125149 b!125150) bm!13403))

(assert (=> b!125148 m!145161))

(assert (=> b!125148 m!145161))

(assert (=> b!125148 m!145171))

(declare-fun m!145423 () Bool)

(assert (=> bm!13403 m!145423))

(assert (=> bm!13349 d!37519))

(declare-fun d!37521 () Bool)

(assert (=> d!37521 (= (isDefined!119 (getValueByKey!166 (toList!854 e!81464) (ite c!22647 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355) (select (arr!2219 (_keys!4493 newMap!16)) (index!3231 lt!64093))))) (not (isEmpty!393 (getValueByKey!166 (toList!854 e!81464) (ite c!22647 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355) (select (arr!2219 (_keys!4493 newMap!16)) (index!3231 lt!64093)))))))))

(declare-fun bs!5173 () Bool)

(assert (= bs!5173 d!37521))

(assert (=> bs!5173 m!145089))

(declare-fun m!145425 () Bool)

(assert (=> bs!5173 m!145425))

(assert (=> b!124969 d!37521))

(declare-fun d!37523 () Bool)

(declare-fun c!22782 () Bool)

(assert (=> d!37523 (= c!22782 (and ((_ is Cons!1691) (toList!854 e!81464)) (= (_1!1295 (h!2292 (toList!854 e!81464))) (ite c!22647 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355) (select (arr!2219 (_keys!4493 newMap!16)) (index!3231 lt!64093))))))))

(declare-fun e!81777 () Option!172)

(assert (=> d!37523 (= (getValueByKey!166 (toList!854 e!81464) (ite c!22647 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355) (select (arr!2219 (_keys!4493 newMap!16)) (index!3231 lt!64093)))) e!81777)))

(declare-fun b!125152 () Bool)

(assert (=> b!125152 (= e!81777 (Some!171 (_2!1295 (h!2292 (toList!854 e!81464)))))))

(declare-fun b!125154 () Bool)

(declare-fun e!81778 () Option!172)

(assert (=> b!125154 (= e!81778 (getValueByKey!166 (t!6022 (toList!854 e!81464)) (ite c!22647 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355) (select (arr!2219 (_keys!4493 newMap!16)) (index!3231 lt!64093)))))))

(declare-fun b!125155 () Bool)

(assert (=> b!125155 (= e!81778 None!170)))

(declare-fun b!125153 () Bool)

(assert (=> b!125153 (= e!81777 e!81778)))

(declare-fun c!22783 () Bool)

(assert (=> b!125153 (= c!22783 (and ((_ is Cons!1691) (toList!854 e!81464)) (not (= (_1!1295 (h!2292 (toList!854 e!81464))) (ite c!22647 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355) (select (arr!2219 (_keys!4493 newMap!16)) (index!3231 lt!64093)))))))))

(assert (= (and d!37523 c!22782) b!125152))

(assert (= (and d!37523 (not c!22782)) b!125153))

(assert (= (and b!125153 c!22783) b!125154))

(assert (= (and b!125153 (not c!22783)) b!125155))

(declare-fun m!145427 () Bool)

(assert (=> b!125154 m!145427))

(assert (=> b!124969 d!37523))

(declare-fun c!22784 () Bool)

(declare-fun d!37525 () Bool)

(assert (=> d!37525 (= c!22784 (and ((_ is Cons!1691) (toList!854 lt!64376)) (= (_1!1295 (h!2292 (toList!854 lt!64376))) (_1!1295 (tuple2!2569 lt!64017 (zeroValue!2629 (v!3108 (underlying!436 thiss!992))))))))))

(declare-fun e!81779 () Option!172)

(assert (=> d!37525 (= (getValueByKey!166 (toList!854 lt!64376) (_1!1295 (tuple2!2569 lt!64017 (zeroValue!2629 (v!3108 (underlying!436 thiss!992)))))) e!81779)))

(declare-fun b!125156 () Bool)

(assert (=> b!125156 (= e!81779 (Some!171 (_2!1295 (h!2292 (toList!854 lt!64376)))))))

(declare-fun e!81780 () Option!172)

(declare-fun b!125158 () Bool)

(assert (=> b!125158 (= e!81780 (getValueByKey!166 (t!6022 (toList!854 lt!64376)) (_1!1295 (tuple2!2569 lt!64017 (zeroValue!2629 (v!3108 (underlying!436 thiss!992)))))))))

(declare-fun b!125159 () Bool)

(assert (=> b!125159 (= e!81780 None!170)))

(declare-fun b!125157 () Bool)

(assert (=> b!125157 (= e!81779 e!81780)))

(declare-fun c!22785 () Bool)

(assert (=> b!125157 (= c!22785 (and ((_ is Cons!1691) (toList!854 lt!64376)) (not (= (_1!1295 (h!2292 (toList!854 lt!64376))) (_1!1295 (tuple2!2569 lt!64017 (zeroValue!2629 (v!3108 (underlying!436 thiss!992)))))))))))

(assert (= (and d!37525 c!22784) b!125156))

(assert (= (and d!37525 (not c!22784)) b!125157))

(assert (= (and b!125157 c!22785) b!125158))

(assert (= (and b!125157 (not c!22785)) b!125159))

(declare-fun m!145429 () Bool)

(assert (=> b!125158 m!145429))

(assert (=> b!124964 d!37525))

(assert (=> b!124721 d!37363))

(assert (=> bm!13372 d!37327))

(assert (=> b!124848 d!37343))

(declare-fun d!37527 () Bool)

(declare-fun e!81781 () Bool)

(assert (=> d!37527 e!81781))

(declare-fun res!60624 () Bool)

(assert (=> d!37527 (=> res!60624 e!81781)))

(declare-fun lt!64486 () Bool)

(assert (=> d!37527 (= res!60624 (not lt!64486))))

(declare-fun lt!64487 () Bool)

(assert (=> d!37527 (= lt!64486 lt!64487)))

(declare-fun lt!64484 () Unit!3867)

(declare-fun e!81782 () Unit!3867)

(assert (=> d!37527 (= lt!64484 e!81782)))

(declare-fun c!22786 () Bool)

(assert (=> d!37527 (= c!22786 lt!64487)))

(assert (=> d!37527 (= lt!64487 (containsKey!170 (toList!854 (+!169 lt!64213 (tuple2!2569 lt!64214 lt!64217))) lt!64215))))

(assert (=> d!37527 (= (contains!873 (+!169 lt!64213 (tuple2!2569 lt!64214 lt!64217)) lt!64215) lt!64486)))

(declare-fun b!125160 () Bool)

(declare-fun lt!64485 () Unit!3867)

(assert (=> b!125160 (= e!81782 lt!64485)))

(assert (=> b!125160 (= lt!64485 (lemmaContainsKeyImpliesGetValueByKeyDefined!118 (toList!854 (+!169 lt!64213 (tuple2!2569 lt!64214 lt!64217))) lt!64215))))

(assert (=> b!125160 (isDefined!119 (getValueByKey!166 (toList!854 (+!169 lt!64213 (tuple2!2569 lt!64214 lt!64217))) lt!64215))))

(declare-fun b!125161 () Bool)

(declare-fun Unit!3890 () Unit!3867)

(assert (=> b!125161 (= e!81782 Unit!3890)))

(declare-fun b!125162 () Bool)

(assert (=> b!125162 (= e!81781 (isDefined!119 (getValueByKey!166 (toList!854 (+!169 lt!64213 (tuple2!2569 lt!64214 lt!64217))) lt!64215)))))

(assert (= (and d!37527 c!22786) b!125160))

(assert (= (and d!37527 (not c!22786)) b!125161))

(assert (= (and d!37527 (not res!60624)) b!125162))

(declare-fun m!145431 () Bool)

(assert (=> d!37527 m!145431))

(declare-fun m!145433 () Bool)

(assert (=> b!125160 m!145433))

(declare-fun m!145435 () Bool)

(assert (=> b!125160 m!145435))

(assert (=> b!125160 m!145435))

(declare-fun m!145437 () Bool)

(assert (=> b!125160 m!145437))

(assert (=> b!125162 m!145435))

(assert (=> b!125162 m!145435))

(assert (=> b!125162 m!145437))

(assert (=> b!124848 d!37527))

(declare-fun d!37529 () Bool)

(declare-fun e!81783 () Bool)

(assert (=> d!37529 e!81783))

(declare-fun res!60625 () Bool)

(assert (=> d!37529 (=> (not res!60625) (not e!81783))))

(declare-fun lt!64488 () ListLongMap!1677)

(assert (=> d!37529 (= res!60625 (contains!873 lt!64488 (_1!1295 (tuple2!2569 lt!64214 lt!64217))))))

(declare-fun lt!64489 () List!1695)

(assert (=> d!37529 (= lt!64488 (ListLongMap!1678 lt!64489))))

(declare-fun lt!64491 () Unit!3867)

(declare-fun lt!64490 () Unit!3867)

(assert (=> d!37529 (= lt!64491 lt!64490)))

(assert (=> d!37529 (= (getValueByKey!166 lt!64489 (_1!1295 (tuple2!2569 lt!64214 lt!64217))) (Some!171 (_2!1295 (tuple2!2569 lt!64214 lt!64217))))))

(assert (=> d!37529 (= lt!64490 (lemmaContainsTupThenGetReturnValue!81 lt!64489 (_1!1295 (tuple2!2569 lt!64214 lt!64217)) (_2!1295 (tuple2!2569 lt!64214 lt!64217))))))

(assert (=> d!37529 (= lt!64489 (insertStrictlySorted!84 (toList!854 lt!64213) (_1!1295 (tuple2!2569 lt!64214 lt!64217)) (_2!1295 (tuple2!2569 lt!64214 lt!64217))))))

(assert (=> d!37529 (= (+!169 lt!64213 (tuple2!2569 lt!64214 lt!64217)) lt!64488)))

(declare-fun b!125163 () Bool)

(declare-fun res!60626 () Bool)

(assert (=> b!125163 (=> (not res!60626) (not e!81783))))

(assert (=> b!125163 (= res!60626 (= (getValueByKey!166 (toList!854 lt!64488) (_1!1295 (tuple2!2569 lt!64214 lt!64217))) (Some!171 (_2!1295 (tuple2!2569 lt!64214 lt!64217)))))))

(declare-fun b!125164 () Bool)

(assert (=> b!125164 (= e!81783 (contains!874 (toList!854 lt!64488) (tuple2!2569 lt!64214 lt!64217)))))

(assert (= (and d!37529 res!60625) b!125163))

(assert (= (and b!125163 res!60626) b!125164))

(declare-fun m!145439 () Bool)

(assert (=> d!37529 m!145439))

(declare-fun m!145441 () Bool)

(assert (=> d!37529 m!145441))

(declare-fun m!145443 () Bool)

(assert (=> d!37529 m!145443))

(declare-fun m!145445 () Bool)

(assert (=> d!37529 m!145445))

(declare-fun m!145447 () Bool)

(assert (=> b!125163 m!145447))

(declare-fun m!145449 () Bool)

(assert (=> b!125164 m!145449))

(assert (=> b!124848 d!37529))

(declare-fun d!37531 () Bool)

(declare-fun e!81784 () Bool)

(assert (=> d!37531 e!81784))

(declare-fun res!60627 () Bool)

(assert (=> d!37531 (=> (not res!60627) (not e!81784))))

(declare-fun lt!64492 () ListLongMap!1677)

(assert (=> d!37531 (= res!60627 (contains!873 lt!64492 (_1!1295 (tuple2!2569 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!64493 () List!1695)

(assert (=> d!37531 (= lt!64492 (ListLongMap!1678 lt!64493))))

(declare-fun lt!64495 () Unit!3867)

(declare-fun lt!64494 () Unit!3867)

(assert (=> d!37531 (= lt!64495 lt!64494)))

(assert (=> d!37531 (= (getValueByKey!166 lt!64493 (_1!1295 (tuple2!2569 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!171 (_2!1295 (tuple2!2569 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!37531 (= lt!64494 (lemmaContainsTupThenGetReturnValue!81 lt!64493 (_1!1295 (tuple2!2569 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1295 (tuple2!2569 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!37531 (= lt!64493 (insertStrictlySorted!84 (toList!854 call!13365) (_1!1295 (tuple2!2569 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1295 (tuple2!2569 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!37531 (= (+!169 call!13365 (tuple2!2569 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!64492)))

(declare-fun b!125165 () Bool)

(declare-fun res!60628 () Bool)

(assert (=> b!125165 (=> (not res!60628) (not e!81784))))

(assert (=> b!125165 (= res!60628 (= (getValueByKey!166 (toList!854 lt!64492) (_1!1295 (tuple2!2569 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!171 (_2!1295 (tuple2!2569 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!125166 () Bool)

(assert (=> b!125166 (= e!81784 (contains!874 (toList!854 lt!64492) (tuple2!2569 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!37531 res!60627) b!125165))

(assert (= (and b!125165 res!60628) b!125166))

(declare-fun m!145451 () Bool)

(assert (=> d!37531 m!145451))

(declare-fun m!145453 () Bool)

(assert (=> d!37531 m!145453))

(declare-fun m!145455 () Bool)

(assert (=> d!37531 m!145455))

(declare-fun m!145457 () Bool)

(assert (=> d!37531 m!145457))

(declare-fun m!145459 () Bool)

(assert (=> b!125165 m!145459))

(declare-fun m!145461 () Bool)

(assert (=> b!125166 m!145461))

(assert (=> b!124848 d!37531))

(declare-fun d!37533 () Bool)

(assert (=> d!37533 (not (contains!873 (+!169 lt!64213 (tuple2!2569 lt!64214 lt!64217)) lt!64215))))

(declare-fun lt!64498 () Unit!3867)

(declare-fun choose!757 (ListLongMap!1677 (_ BitVec 64) V!3427 (_ BitVec 64)) Unit!3867)

(assert (=> d!37533 (= lt!64498 (choose!757 lt!64213 lt!64214 lt!64217 lt!64215))))

(declare-fun e!81787 () Bool)

(assert (=> d!37533 e!81787))

(declare-fun res!60631 () Bool)

(assert (=> d!37533 (=> (not res!60631) (not e!81787))))

(assert (=> d!37533 (= res!60631 (not (contains!873 lt!64213 lt!64215)))))

(assert (=> d!37533 (= (addStillNotContains!55 lt!64213 lt!64214 lt!64217 lt!64215) lt!64498)))

(declare-fun b!125170 () Bool)

(assert (=> b!125170 (= e!81787 (not (= lt!64214 lt!64215)))))

(assert (= (and d!37533 res!60631) b!125170))

(assert (=> d!37533 m!144805))

(assert (=> d!37533 m!144805))

(assert (=> d!37533 m!144807))

(declare-fun m!145463 () Bool)

(assert (=> d!37533 m!145463))

(declare-fun m!145465 () Bool)

(assert (=> d!37533 m!145465))

(assert (=> b!124848 d!37533))

(declare-fun d!37535 () Bool)

(assert (=> d!37535 (= (isDefined!119 (getValueByKey!166 (toList!854 call!13340) (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355))) (not (isEmpty!393 (getValueByKey!166 (toList!854 call!13340) (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355)))))))

(declare-fun bs!5174 () Bool)

(assert (= bs!5174 d!37535))

(assert (=> bs!5174 m!144645))

(declare-fun m!145467 () Bool)

(assert (=> bs!5174 m!145467))

(assert (=> b!124700 d!37535))

(declare-fun c!22787 () Bool)

(declare-fun d!37537 () Bool)

(assert (=> d!37537 (= c!22787 (and ((_ is Cons!1691) (toList!854 call!13340)) (= (_1!1295 (h!2292 (toList!854 call!13340))) (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355))))))

(declare-fun e!81788 () Option!172)

(assert (=> d!37537 (= (getValueByKey!166 (toList!854 call!13340) (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355)) e!81788)))

(declare-fun b!125171 () Bool)

(assert (=> b!125171 (= e!81788 (Some!171 (_2!1295 (h!2292 (toList!854 call!13340)))))))

(declare-fun b!125173 () Bool)

(declare-fun e!81789 () Option!172)

(assert (=> b!125173 (= e!81789 (getValueByKey!166 (t!6022 (toList!854 call!13340)) (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355)))))

(declare-fun b!125174 () Bool)

(assert (=> b!125174 (= e!81789 None!170)))

(declare-fun b!125172 () Bool)

(assert (=> b!125172 (= e!81788 e!81789)))

(declare-fun c!22788 () Bool)

(assert (=> b!125172 (= c!22788 (and ((_ is Cons!1691) (toList!854 call!13340)) (not (= (_1!1295 (h!2292 (toList!854 call!13340))) (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355)))))))

(assert (= (and d!37537 c!22787) b!125171))

(assert (= (and d!37537 (not c!22787)) b!125172))

(assert (= (and b!125172 c!22788) b!125173))

(assert (= (and b!125172 (not c!22788)) b!125174))

(assert (=> b!125173 m!144415))

(declare-fun m!145469 () Bool)

(assert (=> b!125173 m!145469))

(assert (=> b!124700 d!37537))

(declare-fun d!37539 () Bool)

(declare-fun e!81790 () Bool)

(assert (=> d!37539 e!81790))

(declare-fun res!60632 () Bool)

(assert (=> d!37539 (=> res!60632 e!81790)))

(declare-fun lt!64501 () Bool)

(assert (=> d!37539 (= res!60632 (not lt!64501))))

(declare-fun lt!64502 () Bool)

(assert (=> d!37539 (= lt!64501 lt!64502)))

(declare-fun lt!64499 () Unit!3867)

(declare-fun e!81791 () Unit!3867)

(assert (=> d!37539 (= lt!64499 e!81791)))

(declare-fun c!22789 () Bool)

(assert (=> d!37539 (= c!22789 lt!64502)))

(assert (=> d!37539 (= lt!64502 (containsKey!170 (toList!854 lt!64339) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!37539 (= (contains!873 lt!64339 #b1000000000000000000000000000000000000000000000000000000000000000) lt!64501)))

(declare-fun b!125175 () Bool)

(declare-fun lt!64500 () Unit!3867)

(assert (=> b!125175 (= e!81791 lt!64500)))

(assert (=> b!125175 (= lt!64500 (lemmaContainsKeyImpliesGetValueByKeyDefined!118 (toList!854 lt!64339) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!125175 (isDefined!119 (getValueByKey!166 (toList!854 lt!64339) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!125176 () Bool)

(declare-fun Unit!3891 () Unit!3867)

(assert (=> b!125176 (= e!81791 Unit!3891)))

(declare-fun b!125177 () Bool)

(assert (=> b!125177 (= e!81790 (isDefined!119 (getValueByKey!166 (toList!854 lt!64339) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!37539 c!22789) b!125175))

(assert (= (and d!37539 (not c!22789)) b!125176))

(assert (= (and d!37539 (not res!60632)) b!125177))

(declare-fun m!145471 () Bool)

(assert (=> d!37539 m!145471))

(declare-fun m!145473 () Bool)

(assert (=> b!125175 m!145473))

(declare-fun m!145475 () Bool)

(assert (=> b!125175 m!145475))

(assert (=> b!125175 m!145475))

(declare-fun m!145477 () Bool)

(assert (=> b!125175 m!145477))

(assert (=> b!125177 m!145475))

(assert (=> b!125177 m!145475))

(assert (=> b!125177 m!145477))

(assert (=> bm!13381 d!37539))

(declare-fun d!37541 () Bool)

(assert (=> d!37541 (= (get!1439 (getValueByKey!166 (toList!854 lt!64012) (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))) (v!3112 (getValueByKey!166 (toList!854 lt!64012) (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(assert (=> d!37341 d!37541))

(assert (=> d!37341 d!37517))

(assert (=> bm!13375 d!37467))

(assert (=> d!37311 d!37327))

(declare-fun c!22795 () Bool)

(declare-fun bm!13408 () Bool)

(declare-fun call!13412 () Bool)

(declare-fun lt!64505 () SeekEntryResult!269)

(assert (=> bm!13408 (= call!13412 (inRange!0 (ite c!22795 (index!3230 lt!64505) (index!3233 lt!64505)) (mask!7010 newMap!16)))))

(declare-fun b!125194 () Bool)

(declare-fun res!60641 () Bool)

(assert (=> b!125194 (= res!60641 (= (select (arr!2219 (_keys!4493 newMap!16)) (index!3230 lt!64505)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!81801 () Bool)

(assert (=> b!125194 (=> (not res!60641) (not e!81801))))

(declare-fun b!125195 () Bool)

(declare-fun call!13411 () Bool)

(assert (=> b!125195 (= e!81801 (not call!13411))))

(declare-fun b!125196 () Bool)

(declare-fun e!81803 () Bool)

(assert (=> b!125196 (= e!81803 e!81801)))

(declare-fun res!60642 () Bool)

(assert (=> b!125196 (= res!60642 call!13412)))

(assert (=> b!125196 (=> (not res!60642) (not e!81801))))

(declare-fun b!125197 () Bool)

(declare-fun e!81802 () Bool)

(assert (=> b!125197 (= e!81802 (not call!13411))))

(declare-fun b!125198 () Bool)

(declare-fun e!81800 () Bool)

(assert (=> b!125198 (= e!81800 ((_ is Undefined!269) lt!64505))))

(declare-fun b!125199 () Bool)

(assert (=> b!125199 (= e!81803 e!81800)))

(declare-fun c!22794 () Bool)

(assert (=> b!125199 (= c!22794 ((_ is MissingVacant!269) lt!64505))))

(declare-fun b!125200 () Bool)

(declare-fun res!60643 () Bool)

(assert (=> b!125200 (=> (not res!60643) (not e!81802))))

(assert (=> b!125200 (= res!60643 (= (select (arr!2219 (_keys!4493 newMap!16)) (index!3233 lt!64505)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!125201 () Bool)

(declare-fun res!60644 () Bool)

(assert (=> b!125201 (=> (not res!60644) (not e!81802))))

(assert (=> b!125201 (= res!60644 call!13412)))

(assert (=> b!125201 (= e!81800 e!81802)))

(declare-fun bm!13409 () Bool)

(assert (=> bm!13409 (= call!13411 (arrayContainsKey!0 (_keys!4493 newMap!16) (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun d!37543 () Bool)

(assert (=> d!37543 e!81803))

(assert (=> d!37543 (= c!22795 ((_ is MissingZero!269) lt!64505))))

(assert (=> d!37543 (= lt!64505 (seekEntryOrOpen!0 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355) (_keys!4493 newMap!16) (mask!7010 newMap!16)))))

(assert (=> d!37543 true))

(declare-fun _$34!939 () Unit!3867)

(assert (=> d!37543 (= (choose!747 (_keys!4493 newMap!16) (_values!2747 newMap!16) (mask!7010 newMap!16) (extraKeys!2549 newMap!16) (zeroValue!2629 newMap!16) (minValue!2629 newMap!16) (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355) (defaultEntry!2764 newMap!16)) _$34!939)))

(assert (= (and d!37543 c!22795) b!125196))

(assert (= (and d!37543 (not c!22795)) b!125199))

(assert (= (and b!125196 res!60642) b!125194))

(assert (= (and b!125194 res!60641) b!125195))

(assert (= (and b!125199 c!22794) b!125201))

(assert (= (and b!125199 (not c!22794)) b!125198))

(assert (= (and b!125201 res!60644) b!125200))

(assert (= (and b!125200 res!60643) b!125197))

(assert (= (or b!125196 b!125201) bm!13408))

(assert (= (or b!125195 b!125197) bm!13409))

(declare-fun m!145479 () Bool)

(assert (=> bm!13408 m!145479))

(assert (=> bm!13409 m!144415))

(assert (=> bm!13409 m!144579))

(assert (=> d!37543 m!144415))

(assert (=> d!37543 m!144557))

(declare-fun m!145481 () Bool)

(assert (=> b!125194 m!145481))

(declare-fun m!145483 () Bool)

(assert (=> b!125200 m!145483))

(assert (=> d!37311 d!37543))

(assert (=> d!37311 d!37435))

(declare-fun lt!64506 () Bool)

(declare-fun d!37545 () Bool)

(assert (=> d!37545 (= lt!64506 (select (content!123 (toList!854 lt!64355)) (tuple2!2569 lt!63999 (minValue!2629 (v!3108 (underlying!436 thiss!992))))))))

(declare-fun e!81805 () Bool)

(assert (=> d!37545 (= lt!64506 e!81805)))

(declare-fun res!60645 () Bool)

(assert (=> d!37545 (=> (not res!60645) (not e!81805))))

(assert (=> d!37545 (= res!60645 ((_ is Cons!1691) (toList!854 lt!64355)))))

(assert (=> d!37545 (= (contains!874 (toList!854 lt!64355) (tuple2!2569 lt!63999 (minValue!2629 (v!3108 (underlying!436 thiss!992))))) lt!64506)))

(declare-fun b!125202 () Bool)

(declare-fun e!81804 () Bool)

(assert (=> b!125202 (= e!81805 e!81804)))

(declare-fun res!60646 () Bool)

(assert (=> b!125202 (=> res!60646 e!81804)))

(assert (=> b!125202 (= res!60646 (= (h!2292 (toList!854 lt!64355)) (tuple2!2569 lt!63999 (minValue!2629 (v!3108 (underlying!436 thiss!992))))))))

(declare-fun b!125203 () Bool)

(assert (=> b!125203 (= e!81804 (contains!874 (t!6022 (toList!854 lt!64355)) (tuple2!2569 lt!63999 (minValue!2629 (v!3108 (underlying!436 thiss!992))))))))

(assert (= (and d!37545 res!60645) b!125202))

(assert (= (and b!125202 (not res!60646)) b!125203))

(declare-fun m!145485 () Bool)

(assert (=> d!37545 m!145485))

(declare-fun m!145487 () Bool)

(assert (=> d!37545 m!145487))

(declare-fun m!145489 () Bool)

(assert (=> b!125203 m!145489))

(assert (=> b!124950 d!37545))

(declare-fun d!37547 () Bool)

(assert (=> d!37547 (= (apply!110 lt!64187 #b0000000000000000000000000000000000000000000000000000000000000000) (get!1439 (getValueByKey!166 (toList!854 lt!64187) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!5175 () Bool)

(assert (= bs!5175 d!37547))

(declare-fun m!145491 () Bool)

(assert (=> bs!5175 m!145491))

(assert (=> bs!5175 m!145491))

(declare-fun m!145493 () Bool)

(assert (=> bs!5175 m!145493))

(assert (=> b!124788 d!37547))

(declare-fun b!125223 () Bool)

(declare-fun e!81817 () SeekEntryResult!269)

(declare-fun e!81819 () SeekEntryResult!269)

(assert (=> b!125223 (= e!81817 e!81819)))

(declare-fun c!22803 () Bool)

(declare-fun lt!64512 () (_ BitVec 64))

(assert (=> b!125223 (= c!22803 (or (= lt!64512 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355)) (= (bvadd lt!64512 lt!64512) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!125224 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!125224 (= e!81819 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355) (mask!7010 newMap!16)) #b00000000000000000000000000000000 (mask!7010 newMap!16)) (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355) (_keys!4493 newMap!16) (mask!7010 newMap!16)))))

(declare-fun b!125225 () Bool)

(declare-fun lt!64511 () SeekEntryResult!269)

(assert (=> b!125225 (and (bvsge (index!3232 lt!64511) #b00000000000000000000000000000000) (bvslt (index!3232 lt!64511) (size!2482 (_keys!4493 newMap!16))))))

(declare-fun res!60654 () Bool)

(assert (=> b!125225 (= res!60654 (= (select (arr!2219 (_keys!4493 newMap!16)) (index!3232 lt!64511)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!81820 () Bool)

(assert (=> b!125225 (=> res!60654 e!81820)))

(declare-fun b!125226 () Bool)

(assert (=> b!125226 (and (bvsge (index!3232 lt!64511) #b00000000000000000000000000000000) (bvslt (index!3232 lt!64511) (size!2482 (_keys!4493 newMap!16))))))

(assert (=> b!125226 (= e!81820 (= (select (arr!2219 (_keys!4493 newMap!16)) (index!3232 lt!64511)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!125227 () Bool)

(declare-fun e!81816 () Bool)

(declare-fun e!81818 () Bool)

(assert (=> b!125227 (= e!81816 e!81818)))

(declare-fun res!60655 () Bool)

(assert (=> b!125227 (= res!60655 (and ((_ is Intermediate!269) lt!64511) (not (undefined!1081 lt!64511)) (bvslt (x!14818 lt!64511) #b01111111111111111111111111111110) (bvsge (x!14818 lt!64511) #b00000000000000000000000000000000) (bvsge (x!14818 lt!64511) #b00000000000000000000000000000000)))))

(assert (=> b!125227 (=> (not res!60655) (not e!81818))))

(declare-fun b!125228 () Bool)

(assert (=> b!125228 (and (bvsge (index!3232 lt!64511) #b00000000000000000000000000000000) (bvslt (index!3232 lt!64511) (size!2482 (_keys!4493 newMap!16))))))

(declare-fun res!60653 () Bool)

(assert (=> b!125228 (= res!60653 (= (select (arr!2219 (_keys!4493 newMap!16)) (index!3232 lt!64511)) (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355)))))

(assert (=> b!125228 (=> res!60653 e!81820)))

(assert (=> b!125228 (= e!81818 e!81820)))

(declare-fun b!125222 () Bool)

(assert (=> b!125222 (= e!81819 (Intermediate!269 false (toIndex!0 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355) (mask!7010 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun d!37549 () Bool)

(assert (=> d!37549 e!81816))

(declare-fun c!22802 () Bool)

(assert (=> d!37549 (= c!22802 (and ((_ is Intermediate!269) lt!64511) (undefined!1081 lt!64511)))))

(assert (=> d!37549 (= lt!64511 e!81817)))

(declare-fun c!22804 () Bool)

(assert (=> d!37549 (= c!22804 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!37549 (= lt!64512 (select (arr!2219 (_keys!4493 newMap!16)) (toIndex!0 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355) (mask!7010 newMap!16))))))

(assert (=> d!37549 (validMask!0 (mask!7010 newMap!16))))

(assert (=> d!37549 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355) (mask!7010 newMap!16)) (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355) (_keys!4493 newMap!16) (mask!7010 newMap!16)) lt!64511)))

(declare-fun b!125229 () Bool)

(assert (=> b!125229 (= e!81817 (Intermediate!269 true (toIndex!0 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355) (mask!7010 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun b!125230 () Bool)

(assert (=> b!125230 (= e!81816 (bvsge (x!14818 lt!64511) #b01111111111111111111111111111110))))

(assert (= (and d!37549 c!22804) b!125229))

(assert (= (and d!37549 (not c!22804)) b!125223))

(assert (= (and b!125223 c!22803) b!125222))

(assert (= (and b!125223 (not c!22803)) b!125224))

(assert (= (and d!37549 c!22802) b!125230))

(assert (= (and d!37549 (not c!22802)) b!125227))

(assert (= (and b!125227 res!60655) b!125228))

(assert (= (and b!125228 (not res!60653)) b!125225))

(assert (= (and b!125225 (not res!60654)) b!125226))

(declare-fun m!145495 () Bool)

(assert (=> b!125226 m!145495))

(assert (=> b!125225 m!145495))

(assert (=> b!125228 m!145495))

(assert (=> b!125224 m!144673))

(declare-fun m!145497 () Bool)

(assert (=> b!125224 m!145497))

(assert (=> b!125224 m!145497))

(assert (=> b!125224 m!144415))

(declare-fun m!145499 () Bool)

(assert (=> b!125224 m!145499))

(assert (=> d!37549 m!144673))

(declare-fun m!145501 () Bool)

(assert (=> d!37549 m!145501))

(assert (=> d!37549 m!144633))

(assert (=> d!37327 d!37549))

(declare-fun d!37551 () Bool)

(declare-fun lt!64518 () (_ BitVec 32))

(declare-fun lt!64517 () (_ BitVec 32))

(assert (=> d!37551 (= lt!64518 (bvmul (bvxor lt!64517 (bvlshr lt!64517 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!37551 (= lt!64517 ((_ extract 31 0) (bvand (bvxor (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355) (bvlshr (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!37551 (and (bvsge (mask!7010 newMap!16) #b00000000000000000000000000000000) (let ((res!60656 (let ((h!2294 ((_ extract 31 0) (bvand (bvxor (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355) (bvlshr (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!14921 (bvmul (bvxor h!2294 (bvlshr h!2294 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!14921 (bvlshr x!14921 #b00000000000000000000000000001101)) (mask!7010 newMap!16)))))) (and (bvslt res!60656 (bvadd (mask!7010 newMap!16) #b00000000000000000000000000000001)) (bvsge res!60656 #b00000000000000000000000000000000))))))

(assert (=> d!37551 (= (toIndex!0 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355) (mask!7010 newMap!16)) (bvand (bvxor lt!64518 (bvlshr lt!64518 #b00000000000000000000000000001101)) (mask!7010 newMap!16)))))

(assert (=> d!37327 d!37551))

(assert (=> d!37327 d!37435))

(assert (=> d!37377 d!37327))

(declare-fun d!37553 () Bool)

(declare-fun e!81823 () Bool)

(assert (=> d!37553 e!81823))

(declare-fun res!60661 () Bool)

(assert (=> d!37553 (=> (not res!60661) (not e!81823))))

(declare-fun lt!64521 () SeekEntryResult!269)

(assert (=> d!37553 (= res!60661 ((_ is Found!269) lt!64521))))

(assert (=> d!37553 (= lt!64521 (seekEntryOrOpen!0 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355) (_keys!4493 newMap!16) (mask!7010 newMap!16)))))

(assert (=> d!37553 true))

(declare-fun _$33!102 () Unit!3867)

(assert (=> d!37553 (= (choose!752 (_keys!4493 newMap!16) (_values!2747 newMap!16) (mask!7010 newMap!16) (extraKeys!2549 newMap!16) (zeroValue!2629 newMap!16) (minValue!2629 newMap!16) (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355) (defaultEntry!2764 newMap!16)) _$33!102)))

(declare-fun b!125235 () Bool)

(declare-fun res!60662 () Bool)

(assert (=> b!125235 (=> (not res!60662) (not e!81823))))

(assert (=> b!125235 (= res!60662 (inRange!0 (index!3231 lt!64521) (mask!7010 newMap!16)))))

(declare-fun b!125236 () Bool)

(assert (=> b!125236 (= e!81823 (= (select (arr!2219 (_keys!4493 newMap!16)) (index!3231 lt!64521)) (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355)))))

(assert (= (and d!37553 res!60661) b!125235))

(assert (= (and b!125235 res!60662) b!125236))

(assert (=> d!37553 m!144415))

(assert (=> d!37553 m!144557))

(declare-fun m!145503 () Bool)

(assert (=> b!125235 m!145503))

(declare-fun m!145505 () Bool)

(assert (=> b!125236 m!145505))

(assert (=> d!37377 d!37553))

(assert (=> d!37377 d!37435))

(declare-fun d!37555 () Bool)

(assert (=> d!37555 (= (isDefined!119 (getValueByKey!166 (toList!854 lt!64012) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (isEmpty!393 (getValueByKey!166 (toList!854 lt!64012) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bs!5176 () Bool)

(assert (= bs!5176 d!37555))

(assert (=> bs!5176 m!144789))

(declare-fun m!145507 () Bool)

(assert (=> bs!5176 m!145507))

(assert (=> b!124815 d!37555))

(declare-fun d!37557 () Bool)

(declare-fun c!22805 () Bool)

(assert (=> d!37557 (= c!22805 (and ((_ is Cons!1691) (toList!854 lt!64012)) (= (_1!1295 (h!2292 (toList!854 lt!64012))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!81824 () Option!172)

(assert (=> d!37557 (= (getValueByKey!166 (toList!854 lt!64012) #b1000000000000000000000000000000000000000000000000000000000000000) e!81824)))

(declare-fun b!125237 () Bool)

(assert (=> b!125237 (= e!81824 (Some!171 (_2!1295 (h!2292 (toList!854 lt!64012)))))))

(declare-fun b!125239 () Bool)

(declare-fun e!81825 () Option!172)

(assert (=> b!125239 (= e!81825 (getValueByKey!166 (t!6022 (toList!854 lt!64012)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!125240 () Bool)

(assert (=> b!125240 (= e!81825 None!170)))

(declare-fun b!125238 () Bool)

(assert (=> b!125238 (= e!81824 e!81825)))

(declare-fun c!22806 () Bool)

(assert (=> b!125238 (= c!22806 (and ((_ is Cons!1691) (toList!854 lt!64012)) (not (= (_1!1295 (h!2292 (toList!854 lt!64012))) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!37557 c!22805) b!125237))

(assert (= (and d!37557 (not c!22805)) b!125238))

(assert (= (and b!125238 c!22806) b!125239))

(assert (= (and b!125238 (not c!22806)) b!125240))

(declare-fun m!145509 () Bool)

(assert (=> b!125239 m!145509))

(assert (=> b!124815 d!37557))

(declare-fun d!37559 () Bool)

(declare-fun lt!64524 () Bool)

(declare-fun content!124 (List!1696) (InoxSet (_ BitVec 64)))

(assert (=> d!37559 (= lt!64524 (select (content!124 Nil!1693) (select (arr!2219 (_keys!4493 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun e!81830 () Bool)

(assert (=> d!37559 (= lt!64524 e!81830)))

(declare-fun res!60668 () Bool)

(assert (=> d!37559 (=> (not res!60668) (not e!81830))))

(assert (=> d!37559 (= res!60668 ((_ is Cons!1692) Nil!1693))))

(assert (=> d!37559 (= (contains!875 Nil!1693 (select (arr!2219 (_keys!4493 newMap!16)) #b00000000000000000000000000000000)) lt!64524)))

(declare-fun b!125245 () Bool)

(declare-fun e!81831 () Bool)

(assert (=> b!125245 (= e!81830 e!81831)))

(declare-fun res!60667 () Bool)

(assert (=> b!125245 (=> res!60667 e!81831)))

(assert (=> b!125245 (= res!60667 (= (h!2293 Nil!1693) (select (arr!2219 (_keys!4493 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!125246 () Bool)

(assert (=> b!125246 (= e!81831 (contains!875 (t!6027 Nil!1693) (select (arr!2219 (_keys!4493 newMap!16)) #b00000000000000000000000000000000)))))

(assert (= (and d!37559 res!60668) b!125245))

(assert (= (and b!125245 (not res!60667)) b!125246))

(declare-fun m!145511 () Bool)

(assert (=> d!37559 m!145511))

(assert (=> d!37559 m!144619))

(declare-fun m!145513 () Bool)

(assert (=> d!37559 m!145513))

(assert (=> b!125246 m!144619))

(declare-fun m!145515 () Bool)

(assert (=> b!125246 m!145515))

(assert (=> b!124809 d!37559))

(declare-fun d!37561 () Bool)

(assert (=> d!37561 (= (get!1439 (getValueByKey!166 (toList!854 lt!64012) #b0000000000000000000000000000000000000000000000000000000000000000)) (v!3112 (getValueByKey!166 (toList!854 lt!64012) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!37419 d!37561))

(assert (=> d!37419 d!37513))

(declare-fun d!37563 () Bool)

(assert (=> d!37563 (= (apply!110 lt!64187 (select (arr!2219 (_keys!4493 newMap!16)) #b00000000000000000000000000000000)) (get!1439 (getValueByKey!166 (toList!854 lt!64187) (select (arr!2219 (_keys!4493 newMap!16)) #b00000000000000000000000000000000))))))

(declare-fun bs!5177 () Bool)

(assert (= bs!5177 d!37563))

(assert (=> bs!5177 m!144619))

(declare-fun m!145517 () Bool)

(assert (=> bs!5177 m!145517))

(assert (=> bs!5177 m!145517))

(declare-fun m!145519 () Bool)

(assert (=> bs!5177 m!145519))

(assert (=> b!124775 d!37563))

(declare-fun d!37565 () Bool)

(declare-fun c!22807 () Bool)

(assert (=> d!37565 (= c!22807 ((_ is ValueCellFull!1074) (select (arr!2220 (_values!2747 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun e!81832 () V!3427)

(assert (=> d!37565 (= (get!1436 (select (arr!2220 (_values!2747 newMap!16)) #b00000000000000000000000000000000) (dynLambda!411 (defaultEntry!2764 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000)) e!81832)))

(declare-fun b!125247 () Bool)

(assert (=> b!125247 (= e!81832 (get!1437 (select (arr!2220 (_values!2747 newMap!16)) #b00000000000000000000000000000000) (dynLambda!411 (defaultEntry!2764 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!125248 () Bool)

(assert (=> b!125248 (= e!81832 (get!1438 (select (arr!2220 (_values!2747 newMap!16)) #b00000000000000000000000000000000) (dynLambda!411 (defaultEntry!2764 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!37565 c!22807) b!125247))

(assert (= (and d!37565 (not c!22807)) b!125248))

(assert (=> b!125247 m!144719))

(assert (=> b!125247 m!144721))

(declare-fun m!145521 () Bool)

(assert (=> b!125247 m!145521))

(assert (=> b!125248 m!144719))

(assert (=> b!125248 m!144721))

(declare-fun m!145523 () Bool)

(assert (=> b!125248 m!145523))

(assert (=> b!124775 d!37565))

(assert (=> d!37371 d!37435))

(declare-fun d!37567 () Bool)

(declare-fun e!81833 () Bool)

(assert (=> d!37567 e!81833))

(declare-fun res!60669 () Bool)

(assert (=> d!37567 (=> (not res!60669) (not e!81833))))

(declare-fun lt!64525 () ListLongMap!1677)

(assert (=> d!37567 (= res!60669 (contains!873 lt!64525 (_1!1295 (ite (or c!22691 c!22689) (tuple2!2569 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2629 newMap!16)) (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2629 newMap!16))))))))

(declare-fun lt!64526 () List!1695)

(assert (=> d!37567 (= lt!64525 (ListLongMap!1678 lt!64526))))

(declare-fun lt!64528 () Unit!3867)

(declare-fun lt!64527 () Unit!3867)

(assert (=> d!37567 (= lt!64528 lt!64527)))

(assert (=> d!37567 (= (getValueByKey!166 lt!64526 (_1!1295 (ite (or c!22691 c!22689) (tuple2!2569 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2629 newMap!16)) (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2629 newMap!16))))) (Some!171 (_2!1295 (ite (or c!22691 c!22689) (tuple2!2569 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2629 newMap!16)) (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2629 newMap!16))))))))

(assert (=> d!37567 (= lt!64527 (lemmaContainsTupThenGetReturnValue!81 lt!64526 (_1!1295 (ite (or c!22691 c!22689) (tuple2!2569 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2629 newMap!16)) (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2629 newMap!16)))) (_2!1295 (ite (or c!22691 c!22689) (tuple2!2569 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2629 newMap!16)) (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2629 newMap!16))))))))

(assert (=> d!37567 (= lt!64526 (insertStrictlySorted!84 (toList!854 (ite c!22691 call!13353 (ite c!22689 call!13355 call!13354))) (_1!1295 (ite (or c!22691 c!22689) (tuple2!2569 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2629 newMap!16)) (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2629 newMap!16)))) (_2!1295 (ite (or c!22691 c!22689) (tuple2!2569 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2629 newMap!16)) (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2629 newMap!16))))))))

(assert (=> d!37567 (= (+!169 (ite c!22691 call!13353 (ite c!22689 call!13355 call!13354)) (ite (or c!22691 c!22689) (tuple2!2569 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2629 newMap!16)) (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2629 newMap!16)))) lt!64525)))

(declare-fun b!125249 () Bool)

(declare-fun res!60670 () Bool)

(assert (=> b!125249 (=> (not res!60670) (not e!81833))))

(assert (=> b!125249 (= res!60670 (= (getValueByKey!166 (toList!854 lt!64525) (_1!1295 (ite (or c!22691 c!22689) (tuple2!2569 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2629 newMap!16)) (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2629 newMap!16))))) (Some!171 (_2!1295 (ite (or c!22691 c!22689) (tuple2!2569 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2629 newMap!16)) (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2629 newMap!16)))))))))

(declare-fun b!125250 () Bool)

(assert (=> b!125250 (= e!81833 (contains!874 (toList!854 lt!64525) (ite (or c!22691 c!22689) (tuple2!2569 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2629 newMap!16)) (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2629 newMap!16)))))))

(assert (= (and d!37567 res!60669) b!125249))

(assert (= (and b!125249 res!60670) b!125250))

(declare-fun m!145525 () Bool)

(assert (=> d!37567 m!145525))

(declare-fun m!145527 () Bool)

(assert (=> d!37567 m!145527))

(declare-fun m!145529 () Bool)

(assert (=> d!37567 m!145529))

(declare-fun m!145531 () Bool)

(assert (=> d!37567 m!145531))

(declare-fun m!145533 () Bool)

(assert (=> b!125249 m!145533))

(declare-fun m!145535 () Bool)

(assert (=> b!125250 m!145535))

(assert (=> bm!13351 d!37567))

(assert (=> b!124791 d!37455))

(declare-fun d!37569 () Bool)

(declare-fun res!60671 () Bool)

(declare-fun e!81834 () Bool)

(assert (=> d!37569 (=> res!60671 e!81834)))

(assert (=> d!37569 (= res!60671 (and ((_ is Cons!1691) (toList!854 lt!64012)) (= (_1!1295 (h!2292 (toList!854 lt!64012))) (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(assert (=> d!37569 (= (containsKey!170 (toList!854 lt!64012) (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) e!81834)))

(declare-fun b!125251 () Bool)

(declare-fun e!81835 () Bool)

(assert (=> b!125251 (= e!81834 e!81835)))

(declare-fun res!60672 () Bool)

(assert (=> b!125251 (=> (not res!60672) (not e!81835))))

(assert (=> b!125251 (= res!60672 (and (or (not ((_ is Cons!1691) (toList!854 lt!64012))) (bvsle (_1!1295 (h!2292 (toList!854 lt!64012))) (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))) ((_ is Cons!1691) (toList!854 lt!64012)) (bvslt (_1!1295 (h!2292 (toList!854 lt!64012))) (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(declare-fun b!125252 () Bool)

(assert (=> b!125252 (= e!81835 (containsKey!170 (t!6022 (toList!854 lt!64012)) (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (= (and d!37569 (not res!60671)) b!125251))

(assert (= (and b!125251 res!60672) b!125252))

(assert (=> b!125252 m!144493))

(declare-fun m!145537 () Bool)

(assert (=> b!125252 m!145537))

(assert (=> d!37369 d!37569))

(declare-fun d!37571 () Bool)

(assert (=> d!37571 (contains!873 (getCurrentListMap!535 (_keys!4493 newMap!16) (_values!2747 newMap!16) (mask!7010 newMap!16) (extraKeys!2549 newMap!16) (zeroValue!2629 newMap!16) (minValue!2629 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2764 newMap!16)) (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355))))

(declare-fun lt!64531 () Unit!3867)

(declare-fun choose!758 (array!4685 array!4687 (_ BitVec 32) (_ BitVec 32) V!3427 V!3427 (_ BitVec 64) (_ BitVec 32) Int) Unit!3867)

(assert (=> d!37571 (= lt!64531 (choose!758 (_keys!4493 newMap!16) (_values!2747 newMap!16) (mask!7010 newMap!16) (extraKeys!2549 newMap!16) (zeroValue!2629 newMap!16) (minValue!2629 newMap!16) (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355) #b00000000000000000000000000000000 (defaultEntry!2764 newMap!16)))))

(assert (=> d!37571 (validMask!0 (mask!7010 newMap!16))))

(assert (=> d!37571 (= (lemmaArrayContainsKeyThenInListMap!36 (_keys!4493 newMap!16) (_values!2747 newMap!16) (mask!7010 newMap!16) (extraKeys!2549 newMap!16) (zeroValue!2629 newMap!16) (minValue!2629 newMap!16) (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355) #b00000000000000000000000000000000 (defaultEntry!2764 newMap!16)) lt!64531)))

(declare-fun bs!5178 () Bool)

(assert (= bs!5178 d!37571))

(assert (=> bs!5178 m!144491))

(assert (=> bs!5178 m!144491))

(assert (=> bs!5178 m!144415))

(assert (=> bs!5178 m!144585))

(assert (=> bs!5178 m!144415))

(declare-fun m!145539 () Bool)

(assert (=> bs!5178 m!145539))

(assert (=> bs!5178 m!144633))

(assert (=> b!124894 d!37571))

(assert (=> b!124894 d!37337))

(assert (=> b!124894 d!37339))

(assert (=> d!37417 d!37435))

(declare-fun d!37573 () Bool)

(declare-fun res!60673 () Bool)

(declare-fun e!81836 () Bool)

(assert (=> d!37573 (=> res!60673 e!81836)))

(assert (=> d!37573 (= res!60673 (and ((_ is Cons!1691) (toList!854 e!81464)) (= (_1!1295 (h!2292 (toList!854 e!81464))) (ite c!22647 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355) (select (arr!2219 (_keys!4493 newMap!16)) (index!3231 lt!64093))))))))

(assert (=> d!37573 (= (containsKey!170 (toList!854 e!81464) (ite c!22647 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355) (select (arr!2219 (_keys!4493 newMap!16)) (index!3231 lt!64093)))) e!81836)))

(declare-fun b!125253 () Bool)

(declare-fun e!81837 () Bool)

(assert (=> b!125253 (= e!81836 e!81837)))

(declare-fun res!60674 () Bool)

(assert (=> b!125253 (=> (not res!60674) (not e!81837))))

(assert (=> b!125253 (= res!60674 (and (or (not ((_ is Cons!1691) (toList!854 e!81464))) (bvsle (_1!1295 (h!2292 (toList!854 e!81464))) (ite c!22647 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355) (select (arr!2219 (_keys!4493 newMap!16)) (index!3231 lt!64093))))) ((_ is Cons!1691) (toList!854 e!81464)) (bvslt (_1!1295 (h!2292 (toList!854 e!81464))) (ite c!22647 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355) (select (arr!2219 (_keys!4493 newMap!16)) (index!3231 lt!64093))))))))

(declare-fun b!125254 () Bool)

(assert (=> b!125254 (= e!81837 (containsKey!170 (t!6022 (toList!854 e!81464)) (ite c!22647 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355) (select (arr!2219 (_keys!4493 newMap!16)) (index!3231 lt!64093)))))))

(assert (= (and d!37573 (not res!60673)) b!125253))

(assert (= (and b!125253 res!60674) b!125254))

(declare-fun m!145541 () Bool)

(assert (=> b!125254 m!145541))

(assert (=> d!37413 d!37573))

(declare-fun d!37575 () Bool)

(declare-fun res!60675 () Bool)

(declare-fun e!81838 () Bool)

(assert (=> d!37575 (=> res!60675 e!81838)))

(assert (=> d!37575 (= res!60675 (and ((_ is Cons!1691) (toList!854 lt!64012)) (= (_1!1295 (h!2292 (toList!854 lt!64012))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!37575 (= (containsKey!170 (toList!854 lt!64012) #b0000000000000000000000000000000000000000000000000000000000000000) e!81838)))

(declare-fun b!125255 () Bool)

(declare-fun e!81839 () Bool)

(assert (=> b!125255 (= e!81838 e!81839)))

(declare-fun res!60676 () Bool)

(assert (=> b!125255 (=> (not res!60676) (not e!81839))))

(assert (=> b!125255 (= res!60676 (and (or (not ((_ is Cons!1691) (toList!854 lt!64012))) (bvsle (_1!1295 (h!2292 (toList!854 lt!64012))) #b0000000000000000000000000000000000000000000000000000000000000000)) ((_ is Cons!1691) (toList!854 lt!64012)) (bvslt (_1!1295 (h!2292 (toList!854 lt!64012))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!125256 () Bool)

(assert (=> b!125256 (= e!81839 (containsKey!170 (t!6022 (toList!854 lt!64012)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!37575 (not res!60675)) b!125255))

(assert (= (and b!125255 res!60676) b!125256))

(declare-fun m!145543 () Bool)

(assert (=> b!125256 m!145543))

(assert (=> d!37415 d!37575))

(assert (=> d!37315 d!37435))

(declare-fun d!37577 () Bool)

(declare-fun e!81840 () Bool)

(assert (=> d!37577 e!81840))

(declare-fun res!60677 () Bool)

(assert (=> d!37577 (=> res!60677 e!81840)))

(declare-fun lt!64534 () Bool)

(assert (=> d!37577 (= res!60677 (not lt!64534))))

(declare-fun lt!64535 () Bool)

(assert (=> d!37577 (= lt!64534 lt!64535)))

(declare-fun lt!64532 () Unit!3867)

(declare-fun e!81841 () Unit!3867)

(assert (=> d!37577 (= lt!64532 e!81841)))

(declare-fun c!22808 () Bool)

(assert (=> d!37577 (= c!22808 lt!64535)))

(assert (=> d!37577 (= lt!64535 (containsKey!170 (toList!854 lt!64313) (_1!1295 (ite c!22645 (ite c!22640 (tuple2!2569 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2569 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!37577 (= (contains!873 lt!64313 (_1!1295 (ite c!22645 (ite c!22640 (tuple2!2569 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2569 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))) lt!64534)))

(declare-fun b!125257 () Bool)

(declare-fun lt!64533 () Unit!3867)

(assert (=> b!125257 (= e!81841 lt!64533)))

(assert (=> b!125257 (= lt!64533 (lemmaContainsKeyImpliesGetValueByKeyDefined!118 (toList!854 lt!64313) (_1!1295 (ite c!22645 (ite c!22640 (tuple2!2569 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2569 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> b!125257 (isDefined!119 (getValueByKey!166 (toList!854 lt!64313) (_1!1295 (ite c!22645 (ite c!22640 (tuple2!2569 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2569 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!125258 () Bool)

(declare-fun Unit!3892 () Unit!3867)

(assert (=> b!125258 (= e!81841 Unit!3892)))

(declare-fun b!125259 () Bool)

(assert (=> b!125259 (= e!81840 (isDefined!119 (getValueByKey!166 (toList!854 lt!64313) (_1!1295 (ite c!22645 (ite c!22640 (tuple2!2569 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2569 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(assert (= (and d!37577 c!22808) b!125257))

(assert (= (and d!37577 (not c!22808)) b!125258))

(assert (= (and d!37577 (not res!60677)) b!125259))

(declare-fun m!145545 () Bool)

(assert (=> d!37577 m!145545))

(declare-fun m!145547 () Bool)

(assert (=> b!125257 m!145547))

(assert (=> b!125257 m!144887))

(assert (=> b!125257 m!144887))

(declare-fun m!145549 () Bool)

(assert (=> b!125257 m!145549))

(assert (=> b!125259 m!144887))

(assert (=> b!125259 m!144887))

(assert (=> b!125259 m!145549))

(assert (=> d!37355 d!37577))

(declare-fun c!22809 () Bool)

(declare-fun d!37579 () Bool)

(assert (=> d!37579 (= c!22809 (and ((_ is Cons!1691) lt!64314) (= (_1!1295 (h!2292 lt!64314)) (_1!1295 (ite c!22645 (ite c!22640 (tuple2!2569 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2569 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(declare-fun e!81842 () Option!172)

(assert (=> d!37579 (= (getValueByKey!166 lt!64314 (_1!1295 (ite c!22645 (ite c!22640 (tuple2!2569 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2569 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))) e!81842)))

(declare-fun b!125260 () Bool)

(assert (=> b!125260 (= e!81842 (Some!171 (_2!1295 (h!2292 lt!64314))))))

(declare-fun e!81843 () Option!172)

(declare-fun b!125262 () Bool)

(assert (=> b!125262 (= e!81843 (getValueByKey!166 (t!6022 lt!64314) (_1!1295 (ite c!22645 (ite c!22640 (tuple2!2569 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2569 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!125263 () Bool)

(assert (=> b!125263 (= e!81843 None!170)))

(declare-fun b!125261 () Bool)

(assert (=> b!125261 (= e!81842 e!81843)))

(declare-fun c!22810 () Bool)

(assert (=> b!125261 (= c!22810 (and ((_ is Cons!1691) lt!64314) (not (= (_1!1295 (h!2292 lt!64314)) (_1!1295 (ite c!22645 (ite c!22640 (tuple2!2569 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2569 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))))

(assert (= (and d!37579 c!22809) b!125260))

(assert (= (and d!37579 (not c!22809)) b!125261))

(assert (= (and b!125261 c!22810) b!125262))

(assert (= (and b!125261 (not c!22810)) b!125263))

(declare-fun m!145551 () Bool)

(assert (=> b!125262 m!145551))

(assert (=> d!37355 d!37579))

(declare-fun d!37581 () Bool)

(assert (=> d!37581 (= (getValueByKey!166 lt!64314 (_1!1295 (ite c!22645 (ite c!22640 (tuple2!2569 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2569 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))) (Some!171 (_2!1295 (ite c!22645 (ite c!22640 (tuple2!2569 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2569 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun lt!64536 () Unit!3867)

(assert (=> d!37581 (= lt!64536 (choose!756 lt!64314 (_1!1295 (ite c!22645 (ite c!22640 (tuple2!2569 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2569 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (_2!1295 (ite c!22645 (ite c!22640 (tuple2!2569 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2569 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun e!81844 () Bool)

(assert (=> d!37581 e!81844))

(declare-fun res!60678 () Bool)

(assert (=> d!37581 (=> (not res!60678) (not e!81844))))

(assert (=> d!37581 (= res!60678 (isStrictlySorted!316 lt!64314))))

(assert (=> d!37581 (= (lemmaContainsTupThenGetReturnValue!81 lt!64314 (_1!1295 (ite c!22645 (ite c!22640 (tuple2!2569 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2569 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (_2!1295 (ite c!22645 (ite c!22640 (tuple2!2569 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2569 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))) lt!64536)))

(declare-fun b!125264 () Bool)

(declare-fun res!60679 () Bool)

(assert (=> b!125264 (=> (not res!60679) (not e!81844))))

(assert (=> b!125264 (= res!60679 (containsKey!170 lt!64314 (_1!1295 (ite c!22645 (ite c!22640 (tuple2!2569 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2569 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!125265 () Bool)

(assert (=> b!125265 (= e!81844 (contains!874 lt!64314 (tuple2!2569 (_1!1295 (ite c!22645 (ite c!22640 (tuple2!2569 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2569 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (_2!1295 (ite c!22645 (ite c!22640 (tuple2!2569 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2569 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(assert (= (and d!37581 res!60678) b!125264))

(assert (= (and b!125264 res!60679) b!125265))

(assert (=> d!37581 m!144881))

(declare-fun m!145553 () Bool)

(assert (=> d!37581 m!145553))

(declare-fun m!145555 () Bool)

(assert (=> d!37581 m!145555))

(declare-fun m!145557 () Bool)

(assert (=> b!125264 m!145557))

(declare-fun m!145559 () Bool)

(assert (=> b!125265 m!145559))

(assert (=> d!37355 d!37581))

(declare-fun b!125266 () Bool)

(declare-fun e!81847 () List!1695)

(declare-fun call!13413 () List!1695)

(assert (=> b!125266 (= e!81847 call!13413)))

(declare-fun b!125267 () Bool)

(declare-fun e!81846 () List!1695)

(declare-fun e!81845 () List!1695)

(assert (=> b!125267 (= e!81846 e!81845)))

(declare-fun c!22813 () Bool)

(assert (=> b!125267 (= c!22813 (and ((_ is Cons!1691) (toList!854 e!81471)) (= (_1!1295 (h!2292 (toList!854 e!81471))) (_1!1295 (ite c!22645 (ite c!22640 (tuple2!2569 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2569 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(declare-fun b!125268 () Bool)

(assert (=> b!125268 (= e!81847 call!13413)))

(declare-fun b!125269 () Bool)

(declare-fun call!13414 () List!1695)

(assert (=> b!125269 (= e!81845 call!13414)))

(declare-fun b!125270 () Bool)

(declare-fun res!60680 () Bool)

(declare-fun e!81848 () Bool)

(assert (=> b!125270 (=> (not res!60680) (not e!81848))))

(declare-fun lt!64537 () List!1695)

(assert (=> b!125270 (= res!60680 (containsKey!170 lt!64537 (_1!1295 (ite c!22645 (ite c!22640 (tuple2!2569 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2569 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun bm!13410 () Bool)

(assert (=> bm!13410 (= call!13413 call!13414)))

(declare-fun d!37583 () Bool)

(assert (=> d!37583 e!81848))

(declare-fun res!60681 () Bool)

(assert (=> d!37583 (=> (not res!60681) (not e!81848))))

(assert (=> d!37583 (= res!60681 (isStrictlySorted!316 lt!64537))))

(assert (=> d!37583 (= lt!64537 e!81846)))

(declare-fun c!22811 () Bool)

(assert (=> d!37583 (= c!22811 (and ((_ is Cons!1691) (toList!854 e!81471)) (bvslt (_1!1295 (h!2292 (toList!854 e!81471))) (_1!1295 (ite c!22645 (ite c!22640 (tuple2!2569 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2569 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(assert (=> d!37583 (isStrictlySorted!316 (toList!854 e!81471))))

(assert (=> d!37583 (= (insertStrictlySorted!84 (toList!854 e!81471) (_1!1295 (ite c!22645 (ite c!22640 (tuple2!2569 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2569 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (_2!1295 (ite c!22645 (ite c!22640 (tuple2!2569 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2569 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))) lt!64537)))

(declare-fun b!125271 () Bool)

(assert (=> b!125271 (= e!81848 (contains!874 lt!64537 (tuple2!2569 (_1!1295 (ite c!22645 (ite c!22640 (tuple2!2569 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2569 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (_2!1295 (ite c!22645 (ite c!22640 (tuple2!2569 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2569 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(declare-fun e!81849 () List!1695)

(declare-fun call!13415 () List!1695)

(declare-fun bm!13411 () Bool)

(assert (=> bm!13411 (= call!13415 ($colon$colon!88 e!81849 (ite c!22811 (h!2292 (toList!854 e!81471)) (tuple2!2569 (_1!1295 (ite c!22645 (ite c!22640 (tuple2!2569 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2569 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (_2!1295 (ite c!22645 (ite c!22640 (tuple2!2569 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2569 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))))

(declare-fun c!22814 () Bool)

(assert (=> bm!13411 (= c!22814 c!22811)))

(declare-fun c!22812 () Bool)

(declare-fun b!125272 () Bool)

(assert (=> b!125272 (= c!22812 (and ((_ is Cons!1691) (toList!854 e!81471)) (bvsgt (_1!1295 (h!2292 (toList!854 e!81471))) (_1!1295 (ite c!22645 (ite c!22640 (tuple2!2569 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2569 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(assert (=> b!125272 (= e!81845 e!81847)))

(declare-fun b!125273 () Bool)

(assert (=> b!125273 (= e!81849 (insertStrictlySorted!84 (t!6022 (toList!854 e!81471)) (_1!1295 (ite c!22645 (ite c!22640 (tuple2!2569 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2569 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (_2!1295 (ite c!22645 (ite c!22640 (tuple2!2569 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2569 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!125274 () Bool)

(assert (=> b!125274 (= e!81846 call!13415)))

(declare-fun bm!13412 () Bool)

(assert (=> bm!13412 (= call!13414 call!13415)))

(declare-fun b!125275 () Bool)

(assert (=> b!125275 (= e!81849 (ite c!22813 (t!6022 (toList!854 e!81471)) (ite c!22812 (Cons!1691 (h!2292 (toList!854 e!81471)) (t!6022 (toList!854 e!81471))) Nil!1692)))))

(assert (= (and d!37583 c!22811) b!125274))

(assert (= (and d!37583 (not c!22811)) b!125267))

(assert (= (and b!125267 c!22813) b!125269))

(assert (= (and b!125267 (not c!22813)) b!125272))

(assert (= (and b!125272 c!22812) b!125266))

(assert (= (and b!125272 (not c!22812)) b!125268))

(assert (= (or b!125266 b!125268) bm!13410))

(assert (= (or b!125269 bm!13410) bm!13412))

(assert (= (or b!125274 bm!13412) bm!13411))

(assert (= (and bm!13411 c!22814) b!125273))

(assert (= (and bm!13411 (not c!22814)) b!125275))

(assert (= (and d!37583 res!60681) b!125270))

(assert (= (and b!125270 res!60680) b!125271))

(declare-fun m!145561 () Bool)

(assert (=> b!125273 m!145561))

(declare-fun m!145563 () Bool)

(assert (=> bm!13411 m!145563))

(declare-fun m!145565 () Bool)

(assert (=> d!37583 m!145565))

(declare-fun m!145567 () Bool)

(assert (=> d!37583 m!145567))

(declare-fun m!145569 () Bool)

(assert (=> b!125270 m!145569))

(declare-fun m!145571 () Bool)

(assert (=> b!125271 m!145571))

(assert (=> d!37355 d!37583))

(declare-fun d!37585 () Bool)

(assert (=> d!37585 (= (apply!110 lt!64187 #b1000000000000000000000000000000000000000000000000000000000000000) (get!1439 (getValueByKey!166 (toList!854 lt!64187) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!5179 () Bool)

(assert (= bs!5179 d!37585))

(declare-fun m!145573 () Bool)

(assert (=> bs!5179 m!145573))

(assert (=> bs!5179 m!145573))

(declare-fun m!145575 () Bool)

(assert (=> bs!5179 m!145575))

(assert (=> b!124795 d!37585))

(declare-fun d!37587 () Bool)

(declare-fun e!81850 () Bool)

(assert (=> d!37587 e!81850))

(declare-fun res!60682 () Bool)

(assert (=> d!37587 (=> res!60682 e!81850)))

(declare-fun lt!64540 () Bool)

(assert (=> d!37587 (= res!60682 (not lt!64540))))

(declare-fun lt!64541 () Bool)

(assert (=> d!37587 (= lt!64540 lt!64541)))

(declare-fun lt!64538 () Unit!3867)

(declare-fun e!81851 () Unit!3867)

(assert (=> d!37587 (= lt!64538 e!81851)))

(declare-fun c!22815 () Bool)

(assert (=> d!37587 (= c!22815 lt!64541)))

(assert (=> d!37587 (= lt!64541 (containsKey!170 (toList!854 lt!64362) (_1!1295 (tuple2!2569 lt!64001 (minValue!2629 (v!3108 (underlying!436 thiss!992)))))))))

(assert (=> d!37587 (= (contains!873 lt!64362 (_1!1295 (tuple2!2569 lt!64001 (minValue!2629 (v!3108 (underlying!436 thiss!992)))))) lt!64540)))

(declare-fun b!125276 () Bool)

(declare-fun lt!64539 () Unit!3867)

(assert (=> b!125276 (= e!81851 lt!64539)))

(assert (=> b!125276 (= lt!64539 (lemmaContainsKeyImpliesGetValueByKeyDefined!118 (toList!854 lt!64362) (_1!1295 (tuple2!2569 lt!64001 (minValue!2629 (v!3108 (underlying!436 thiss!992)))))))))

(assert (=> b!125276 (isDefined!119 (getValueByKey!166 (toList!854 lt!64362) (_1!1295 (tuple2!2569 lt!64001 (minValue!2629 (v!3108 (underlying!436 thiss!992)))))))))

(declare-fun b!125277 () Bool)

(declare-fun Unit!3893 () Unit!3867)

(assert (=> b!125277 (= e!81851 Unit!3893)))

(declare-fun b!125278 () Bool)

(assert (=> b!125278 (= e!81850 (isDefined!119 (getValueByKey!166 (toList!854 lt!64362) (_1!1295 (tuple2!2569 lt!64001 (minValue!2629 (v!3108 (underlying!436 thiss!992))))))))))

(assert (= (and d!37587 c!22815) b!125276))

(assert (= (and d!37587 (not c!22815)) b!125277))

(assert (= (and d!37587 (not res!60682)) b!125278))

(declare-fun m!145577 () Bool)

(assert (=> d!37587 m!145577))

(declare-fun m!145579 () Bool)

(assert (=> b!125276 m!145579))

(assert (=> b!125276 m!145025))

(assert (=> b!125276 m!145025))

(declare-fun m!145581 () Bool)

(assert (=> b!125276 m!145581))

(assert (=> b!125278 m!145025))

(assert (=> b!125278 m!145025))

(assert (=> b!125278 m!145581))

(assert (=> d!37393 d!37587))

(declare-fun d!37589 () Bool)

(declare-fun c!22816 () Bool)

(assert (=> d!37589 (= c!22816 (and ((_ is Cons!1691) lt!64363) (= (_1!1295 (h!2292 lt!64363)) (_1!1295 (tuple2!2569 lt!64001 (minValue!2629 (v!3108 (underlying!436 thiss!992))))))))))

(declare-fun e!81852 () Option!172)

(assert (=> d!37589 (= (getValueByKey!166 lt!64363 (_1!1295 (tuple2!2569 lt!64001 (minValue!2629 (v!3108 (underlying!436 thiss!992)))))) e!81852)))

(declare-fun b!125279 () Bool)

(assert (=> b!125279 (= e!81852 (Some!171 (_2!1295 (h!2292 lt!64363))))))

(declare-fun b!125281 () Bool)

(declare-fun e!81853 () Option!172)

(assert (=> b!125281 (= e!81853 (getValueByKey!166 (t!6022 lt!64363) (_1!1295 (tuple2!2569 lt!64001 (minValue!2629 (v!3108 (underlying!436 thiss!992)))))))))

(declare-fun b!125282 () Bool)

(assert (=> b!125282 (= e!81853 None!170)))

(declare-fun b!125280 () Bool)

(assert (=> b!125280 (= e!81852 e!81853)))

(declare-fun c!22817 () Bool)

(assert (=> b!125280 (= c!22817 (and ((_ is Cons!1691) lt!64363) (not (= (_1!1295 (h!2292 lt!64363)) (_1!1295 (tuple2!2569 lt!64001 (minValue!2629 (v!3108 (underlying!436 thiss!992)))))))))))

(assert (= (and d!37589 c!22816) b!125279))

(assert (= (and d!37589 (not c!22816)) b!125280))

(assert (= (and b!125280 c!22817) b!125281))

(assert (= (and b!125280 (not c!22817)) b!125282))

(declare-fun m!145583 () Bool)

(assert (=> b!125281 m!145583))

(assert (=> d!37393 d!37589))

(declare-fun d!37591 () Bool)

(assert (=> d!37591 (= (getValueByKey!166 lt!64363 (_1!1295 (tuple2!2569 lt!64001 (minValue!2629 (v!3108 (underlying!436 thiss!992)))))) (Some!171 (_2!1295 (tuple2!2569 lt!64001 (minValue!2629 (v!3108 (underlying!436 thiss!992)))))))))

(declare-fun lt!64542 () Unit!3867)

(assert (=> d!37591 (= lt!64542 (choose!756 lt!64363 (_1!1295 (tuple2!2569 lt!64001 (minValue!2629 (v!3108 (underlying!436 thiss!992))))) (_2!1295 (tuple2!2569 lt!64001 (minValue!2629 (v!3108 (underlying!436 thiss!992)))))))))

(declare-fun e!81854 () Bool)

(assert (=> d!37591 e!81854))

(declare-fun res!60683 () Bool)

(assert (=> d!37591 (=> (not res!60683) (not e!81854))))

(assert (=> d!37591 (= res!60683 (isStrictlySorted!316 lt!64363))))

(assert (=> d!37591 (= (lemmaContainsTupThenGetReturnValue!81 lt!64363 (_1!1295 (tuple2!2569 lt!64001 (minValue!2629 (v!3108 (underlying!436 thiss!992))))) (_2!1295 (tuple2!2569 lt!64001 (minValue!2629 (v!3108 (underlying!436 thiss!992)))))) lt!64542)))

(declare-fun b!125283 () Bool)

(declare-fun res!60684 () Bool)

(assert (=> b!125283 (=> (not res!60684) (not e!81854))))

(assert (=> b!125283 (= res!60684 (containsKey!170 lt!64363 (_1!1295 (tuple2!2569 lt!64001 (minValue!2629 (v!3108 (underlying!436 thiss!992)))))))))

(declare-fun b!125284 () Bool)

(assert (=> b!125284 (= e!81854 (contains!874 lt!64363 (tuple2!2569 (_1!1295 (tuple2!2569 lt!64001 (minValue!2629 (v!3108 (underlying!436 thiss!992))))) (_2!1295 (tuple2!2569 lt!64001 (minValue!2629 (v!3108 (underlying!436 thiss!992))))))))))

(assert (= (and d!37591 res!60683) b!125283))

(assert (= (and b!125283 res!60684) b!125284))

(assert (=> d!37591 m!145019))

(declare-fun m!145585 () Bool)

(assert (=> d!37591 m!145585))

(declare-fun m!145587 () Bool)

(assert (=> d!37591 m!145587))

(declare-fun m!145589 () Bool)

(assert (=> b!125283 m!145589))

(declare-fun m!145591 () Bool)

(assert (=> b!125284 m!145591))

(assert (=> d!37393 d!37591))

(declare-fun b!125285 () Bool)

(declare-fun e!81857 () List!1695)

(declare-fun call!13416 () List!1695)

(assert (=> b!125285 (= e!81857 call!13416)))

(declare-fun b!125286 () Bool)

(declare-fun e!81856 () List!1695)

(declare-fun e!81855 () List!1695)

(assert (=> b!125286 (= e!81856 e!81855)))

(declare-fun c!22820 () Bool)

(assert (=> b!125286 (= c!22820 (and ((_ is Cons!1691) (toList!854 lt!64004)) (= (_1!1295 (h!2292 (toList!854 lt!64004))) (_1!1295 (tuple2!2569 lt!64001 (minValue!2629 (v!3108 (underlying!436 thiss!992))))))))))

(declare-fun b!125287 () Bool)

(assert (=> b!125287 (= e!81857 call!13416)))

(declare-fun b!125288 () Bool)

(declare-fun call!13417 () List!1695)

(assert (=> b!125288 (= e!81855 call!13417)))

(declare-fun b!125289 () Bool)

(declare-fun res!60685 () Bool)

(declare-fun e!81858 () Bool)

(assert (=> b!125289 (=> (not res!60685) (not e!81858))))

(declare-fun lt!64543 () List!1695)

(assert (=> b!125289 (= res!60685 (containsKey!170 lt!64543 (_1!1295 (tuple2!2569 lt!64001 (minValue!2629 (v!3108 (underlying!436 thiss!992)))))))))

(declare-fun bm!13413 () Bool)

(assert (=> bm!13413 (= call!13416 call!13417)))

(declare-fun d!37593 () Bool)

(assert (=> d!37593 e!81858))

(declare-fun res!60686 () Bool)

(assert (=> d!37593 (=> (not res!60686) (not e!81858))))

(assert (=> d!37593 (= res!60686 (isStrictlySorted!316 lt!64543))))

(assert (=> d!37593 (= lt!64543 e!81856)))

(declare-fun c!22818 () Bool)

(assert (=> d!37593 (= c!22818 (and ((_ is Cons!1691) (toList!854 lt!64004)) (bvslt (_1!1295 (h!2292 (toList!854 lt!64004))) (_1!1295 (tuple2!2569 lt!64001 (minValue!2629 (v!3108 (underlying!436 thiss!992))))))))))

(assert (=> d!37593 (isStrictlySorted!316 (toList!854 lt!64004))))

(assert (=> d!37593 (= (insertStrictlySorted!84 (toList!854 lt!64004) (_1!1295 (tuple2!2569 lt!64001 (minValue!2629 (v!3108 (underlying!436 thiss!992))))) (_2!1295 (tuple2!2569 lt!64001 (minValue!2629 (v!3108 (underlying!436 thiss!992)))))) lt!64543)))

(declare-fun b!125290 () Bool)

(assert (=> b!125290 (= e!81858 (contains!874 lt!64543 (tuple2!2569 (_1!1295 (tuple2!2569 lt!64001 (minValue!2629 (v!3108 (underlying!436 thiss!992))))) (_2!1295 (tuple2!2569 lt!64001 (minValue!2629 (v!3108 (underlying!436 thiss!992))))))))))

(declare-fun bm!13414 () Bool)

(declare-fun call!13418 () List!1695)

(declare-fun e!81859 () List!1695)

(assert (=> bm!13414 (= call!13418 ($colon$colon!88 e!81859 (ite c!22818 (h!2292 (toList!854 lt!64004)) (tuple2!2569 (_1!1295 (tuple2!2569 lt!64001 (minValue!2629 (v!3108 (underlying!436 thiss!992))))) (_2!1295 (tuple2!2569 lt!64001 (minValue!2629 (v!3108 (underlying!436 thiss!992)))))))))))

(declare-fun c!22821 () Bool)

(assert (=> bm!13414 (= c!22821 c!22818)))

(declare-fun b!125291 () Bool)

(declare-fun c!22819 () Bool)

(assert (=> b!125291 (= c!22819 (and ((_ is Cons!1691) (toList!854 lt!64004)) (bvsgt (_1!1295 (h!2292 (toList!854 lt!64004))) (_1!1295 (tuple2!2569 lt!64001 (minValue!2629 (v!3108 (underlying!436 thiss!992))))))))))

(assert (=> b!125291 (= e!81855 e!81857)))

(declare-fun b!125292 () Bool)

(assert (=> b!125292 (= e!81859 (insertStrictlySorted!84 (t!6022 (toList!854 lt!64004)) (_1!1295 (tuple2!2569 lt!64001 (minValue!2629 (v!3108 (underlying!436 thiss!992))))) (_2!1295 (tuple2!2569 lt!64001 (minValue!2629 (v!3108 (underlying!436 thiss!992)))))))))

(declare-fun b!125293 () Bool)

(assert (=> b!125293 (= e!81856 call!13418)))

(declare-fun bm!13415 () Bool)

(assert (=> bm!13415 (= call!13417 call!13418)))

(declare-fun b!125294 () Bool)

(assert (=> b!125294 (= e!81859 (ite c!22820 (t!6022 (toList!854 lt!64004)) (ite c!22819 (Cons!1691 (h!2292 (toList!854 lt!64004)) (t!6022 (toList!854 lt!64004))) Nil!1692)))))

(assert (= (and d!37593 c!22818) b!125293))

(assert (= (and d!37593 (not c!22818)) b!125286))

(assert (= (and b!125286 c!22820) b!125288))

(assert (= (and b!125286 (not c!22820)) b!125291))

(assert (= (and b!125291 c!22819) b!125285))

(assert (= (and b!125291 (not c!22819)) b!125287))

(assert (= (or b!125285 b!125287) bm!13413))

(assert (= (or b!125288 bm!13413) bm!13415))

(assert (= (or b!125293 bm!13415) bm!13414))

(assert (= (and bm!13414 c!22821) b!125292))

(assert (= (and bm!13414 (not c!22821)) b!125294))

(assert (= (and d!37593 res!60686) b!125289))

(assert (= (and b!125289 res!60685) b!125290))

(declare-fun m!145593 () Bool)

(assert (=> b!125292 m!145593))

(declare-fun m!145595 () Bool)

(assert (=> bm!13414 m!145595))

(declare-fun m!145597 () Bool)

(assert (=> d!37593 m!145597))

(declare-fun m!145599 () Bool)

(assert (=> d!37593 m!145599))

(declare-fun m!145601 () Bool)

(assert (=> b!125289 m!145601))

(declare-fun m!145603 () Bool)

(assert (=> b!125290 m!145603))

(assert (=> d!37393 d!37593))

(declare-fun b!125307 () Bool)

(declare-fun e!81868 () SeekEntryResult!269)

(declare-fun e!81867 () SeekEntryResult!269)

(assert (=> b!125307 (= e!81868 e!81867)))

(declare-fun c!22828 () Bool)

(declare-fun lt!64548 () (_ BitVec 64))

(assert (=> b!125307 (= c!22828 (= lt!64548 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355)))))

(declare-fun b!125308 () Bool)

(declare-fun e!81866 () SeekEntryResult!269)

(assert (=> b!125308 (= e!81866 (seekKeyOrZeroReturnVacant!0 (bvadd (x!14818 lt!64156) #b00000000000000000000000000000001) (nextIndex!0 (index!3232 lt!64156) (x!14818 lt!64156) (mask!7010 newMap!16)) (index!3232 lt!64156) (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355) (_keys!4493 newMap!16) (mask!7010 newMap!16)))))

(declare-fun b!125309 () Bool)

(assert (=> b!125309 (= e!81866 (MissingVacant!269 (index!3232 lt!64156)))))

(declare-fun b!125310 () Bool)

(assert (=> b!125310 (= e!81867 (Found!269 (index!3232 lt!64156)))))

(declare-fun b!125311 () Bool)

(declare-fun c!22829 () Bool)

(assert (=> b!125311 (= c!22829 (= lt!64548 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!125311 (= e!81867 e!81866)))

(declare-fun d!37595 () Bool)

(declare-fun lt!64549 () SeekEntryResult!269)

(assert (=> d!37595 (and (or ((_ is Undefined!269) lt!64549) (not ((_ is Found!269) lt!64549)) (and (bvsge (index!3231 lt!64549) #b00000000000000000000000000000000) (bvslt (index!3231 lt!64549) (size!2482 (_keys!4493 newMap!16))))) (or ((_ is Undefined!269) lt!64549) ((_ is Found!269) lt!64549) (not ((_ is MissingVacant!269) lt!64549)) (not (= (index!3233 lt!64549) (index!3232 lt!64156))) (and (bvsge (index!3233 lt!64549) #b00000000000000000000000000000000) (bvslt (index!3233 lt!64549) (size!2482 (_keys!4493 newMap!16))))) (or ((_ is Undefined!269) lt!64549) (ite ((_ is Found!269) lt!64549) (= (select (arr!2219 (_keys!4493 newMap!16)) (index!3231 lt!64549)) (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355)) (and ((_ is MissingVacant!269) lt!64549) (= (index!3233 lt!64549) (index!3232 lt!64156)) (= (select (arr!2219 (_keys!4493 newMap!16)) (index!3233 lt!64549)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!37595 (= lt!64549 e!81868)))

(declare-fun c!22830 () Bool)

(assert (=> d!37595 (= c!22830 (bvsge (x!14818 lt!64156) #b01111111111111111111111111111110))))

(assert (=> d!37595 (= lt!64548 (select (arr!2219 (_keys!4493 newMap!16)) (index!3232 lt!64156)))))

(assert (=> d!37595 (validMask!0 (mask!7010 newMap!16))))

(assert (=> d!37595 (= (seekKeyOrZeroReturnVacant!0 (x!14818 lt!64156) (index!3232 lt!64156) (index!3232 lt!64156) (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355) (_keys!4493 newMap!16) (mask!7010 newMap!16)) lt!64549)))

(declare-fun b!125312 () Bool)

(assert (=> b!125312 (= e!81868 Undefined!269)))

(assert (= (and d!37595 c!22830) b!125312))

(assert (= (and d!37595 (not c!22830)) b!125307))

(assert (= (and b!125307 c!22828) b!125310))

(assert (= (and b!125307 (not c!22828)) b!125311))

(assert (= (and b!125311 c!22829) b!125309))

(assert (= (and b!125311 (not c!22829)) b!125308))

(declare-fun m!145605 () Bool)

(assert (=> b!125308 m!145605))

(assert (=> b!125308 m!145605))

(assert (=> b!125308 m!144415))

(declare-fun m!145607 () Bool)

(assert (=> b!125308 m!145607))

(declare-fun m!145609 () Bool)

(assert (=> d!37595 m!145609))

(declare-fun m!145611 () Bool)

(assert (=> d!37595 m!145611))

(assert (=> d!37595 m!144683))

(assert (=> d!37595 m!144633))

(assert (=> b!124762 d!37595))

(declare-fun d!37597 () Bool)

(declare-fun res!60687 () Bool)

(declare-fun e!81869 () Bool)

(assert (=> d!37597 (=> res!60687 e!81869)))

(assert (=> d!37597 (= res!60687 (and ((_ is Cons!1691) (toList!854 call!13340)) (= (_1!1295 (h!2292 (toList!854 call!13340))) (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355))))))

(assert (=> d!37597 (= (containsKey!170 (toList!854 call!13340) (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355)) e!81869)))

(declare-fun b!125313 () Bool)

(declare-fun e!81870 () Bool)

(assert (=> b!125313 (= e!81869 e!81870)))

(declare-fun res!60688 () Bool)

(assert (=> b!125313 (=> (not res!60688) (not e!81870))))

(assert (=> b!125313 (= res!60688 (and (or (not ((_ is Cons!1691) (toList!854 call!13340))) (bvsle (_1!1295 (h!2292 (toList!854 call!13340))) (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355))) ((_ is Cons!1691) (toList!854 call!13340)) (bvslt (_1!1295 (h!2292 (toList!854 call!13340))) (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355))))))

(declare-fun b!125314 () Bool)

(assert (=> b!125314 (= e!81870 (containsKey!170 (t!6022 (toList!854 call!13340)) (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355)))))

(assert (= (and d!37597 (not res!60687)) b!125313))

(assert (= (and b!125313 res!60688) b!125314))

(assert (=> b!125314 m!144415))

(declare-fun m!145613 () Bool)

(assert (=> b!125314 m!145613))

(assert (=> d!37313 d!37597))

(declare-fun d!37599 () Bool)

(declare-fun e!81871 () Bool)

(assert (=> d!37599 e!81871))

(declare-fun res!60689 () Bool)

(assert (=> d!37599 (=> res!60689 e!81871)))

(declare-fun lt!64552 () Bool)

(assert (=> d!37599 (= res!60689 (not lt!64552))))

(declare-fun lt!64553 () Bool)

(assert (=> d!37599 (= lt!64552 lt!64553)))

(declare-fun lt!64550 () Unit!3867)

(declare-fun e!81872 () Unit!3867)

(assert (=> d!37599 (= lt!64550 e!81872)))

(declare-fun c!22831 () Bool)

(assert (=> d!37599 (= c!22831 lt!64553)))

(assert (=> d!37599 (= lt!64553 (containsKey!170 (toList!854 lt!64216) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!37599 (= (contains!873 lt!64216 #b0000000000000000000000000000000000000000000000000000000000000000) lt!64552)))

(declare-fun b!125315 () Bool)

(declare-fun lt!64551 () Unit!3867)

(assert (=> b!125315 (= e!81872 lt!64551)))

(assert (=> b!125315 (= lt!64551 (lemmaContainsKeyImpliesGetValueByKeyDefined!118 (toList!854 lt!64216) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!125315 (isDefined!119 (getValueByKey!166 (toList!854 lt!64216) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!125316 () Bool)

(declare-fun Unit!3894 () Unit!3867)

(assert (=> b!125316 (= e!81872 Unit!3894)))

(declare-fun b!125317 () Bool)

(assert (=> b!125317 (= e!81871 (isDefined!119 (getValueByKey!166 (toList!854 lt!64216) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!37599 c!22831) b!125315))

(assert (= (and d!37599 (not c!22831)) b!125316))

(assert (= (and d!37599 (not res!60689)) b!125317))

(declare-fun m!145615 () Bool)

(assert (=> d!37599 m!145615))

(declare-fun m!145617 () Bool)

(assert (=> b!125315 m!145617))

(declare-fun m!145619 () Bool)

(assert (=> b!125315 m!145619))

(assert (=> b!125315 m!145619))

(declare-fun m!145621 () Bool)

(assert (=> b!125315 m!145621))

(assert (=> b!125317 m!145619))

(assert (=> b!125317 m!145619))

(assert (=> b!125317 m!145621))

(assert (=> d!37349 d!37599))

(assert (=> d!37349 d!37307))

(declare-fun b!125318 () Bool)

(declare-fun e!81875 () Bool)

(declare-fun e!81873 () Bool)

(assert (=> b!125318 (= e!81875 e!81873)))

(declare-fun lt!64556 () (_ BitVec 64))

(assert (=> b!125318 (= lt!64556 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) #b00000000000000000000000000000000))))

(declare-fun lt!64555 () Unit!3867)

(assert (=> b!125318 (= lt!64555 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!4493 (v!3108 (underlying!436 thiss!992))) lt!64556 #b00000000000000000000000000000000))))

(assert (=> b!125318 (arrayContainsKey!0 (_keys!4493 (v!3108 (underlying!436 thiss!992))) lt!64556 #b00000000000000000000000000000000)))

(declare-fun lt!64554 () Unit!3867)

(assert (=> b!125318 (= lt!64554 lt!64555)))

(declare-fun res!60690 () Bool)

(assert (=> b!125318 (= res!60690 (= (seekEntryOrOpen!0 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) #b00000000000000000000000000000000) (_keys!4493 (v!3108 (underlying!436 thiss!992))) (mask!7010 (v!3108 (underlying!436 thiss!992)))) (Found!269 #b00000000000000000000000000000000)))))

(assert (=> b!125318 (=> (not res!60690) (not e!81873))))

(declare-fun b!125319 () Bool)

(declare-fun call!13419 () Bool)

(assert (=> b!125319 (= e!81873 call!13419)))

(declare-fun d!37601 () Bool)

(declare-fun res!60691 () Bool)

(declare-fun e!81874 () Bool)

(assert (=> d!37601 (=> res!60691 e!81874)))

(assert (=> d!37601 (= res!60691 (bvsge #b00000000000000000000000000000000 (size!2482 (_keys!4493 (v!3108 (underlying!436 thiss!992))))))))

(assert (=> d!37601 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4493 (v!3108 (underlying!436 thiss!992))) (mask!7010 (v!3108 (underlying!436 thiss!992)))) e!81874)))

(declare-fun bm!13416 () Bool)

(assert (=> bm!13416 (= call!13419 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!4493 (v!3108 (underlying!436 thiss!992))) (mask!7010 (v!3108 (underlying!436 thiss!992)))))))

(declare-fun b!125320 () Bool)

(assert (=> b!125320 (= e!81875 call!13419)))

(declare-fun b!125321 () Bool)

(assert (=> b!125321 (= e!81874 e!81875)))

(declare-fun c!22832 () Bool)

(assert (=> b!125321 (= c!22832 (validKeyInArray!0 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) #b00000000000000000000000000000000)))))

(assert (= (and d!37601 (not res!60691)) b!125321))

(assert (= (and b!125321 c!22832) b!125318))

(assert (= (and b!125321 (not c!22832)) b!125320))

(assert (= (and b!125318 res!60690) b!125319))

(assert (= (or b!125319 b!125320) bm!13416))

(assert (=> b!125318 m!145235))

(declare-fun m!145623 () Bool)

(assert (=> b!125318 m!145623))

(declare-fun m!145625 () Bool)

(assert (=> b!125318 m!145625))

(assert (=> b!125318 m!145235))

(declare-fun m!145627 () Bool)

(assert (=> b!125318 m!145627))

(declare-fun m!145629 () Bool)

(assert (=> bm!13416 m!145629))

(assert (=> b!125321 m!145235))

(assert (=> b!125321 m!145235))

(assert (=> b!125321 m!145237))

(assert (=> b!124941 d!37601))

(declare-fun d!37603 () Bool)

(declare-fun res!60692 () Bool)

(declare-fun e!81876 () Bool)

(assert (=> d!37603 (=> res!60692 e!81876)))

(assert (=> d!37603 (= res!60692 (and ((_ is Cons!1691) (toList!854 lt!64012)) (= (_1!1295 (h!2292 (toList!854 lt!64012))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!37603 (= (containsKey!170 (toList!854 lt!64012) #b1000000000000000000000000000000000000000000000000000000000000000) e!81876)))

(declare-fun b!125322 () Bool)

(declare-fun e!81877 () Bool)

(assert (=> b!125322 (= e!81876 e!81877)))

(declare-fun res!60693 () Bool)

(assert (=> b!125322 (=> (not res!60693) (not e!81877))))

(assert (=> b!125322 (= res!60693 (and (or (not ((_ is Cons!1691) (toList!854 lt!64012))) (bvsle (_1!1295 (h!2292 (toList!854 lt!64012))) #b1000000000000000000000000000000000000000000000000000000000000000)) ((_ is Cons!1691) (toList!854 lt!64012)) (bvslt (_1!1295 (h!2292 (toList!854 lt!64012))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!125323 () Bool)

(assert (=> b!125323 (= e!81877 (containsKey!170 (t!6022 (toList!854 lt!64012)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!37603 (not res!60692)) b!125322))

(assert (= (and b!125322 res!60693) b!125323))

(declare-fun m!145631 () Bool)

(assert (=> b!125323 m!145631))

(assert (=> d!37347 d!37603))

(declare-fun d!37605 () Bool)

(declare-fun lt!64557 () (_ BitVec 32))

(assert (=> d!37605 (and (bvsge lt!64557 #b00000000000000000000000000000000) (bvsle lt!64557 (bvsub (size!2482 (_keys!4493 (_2!1296 lt!64096))) #b00000000000000000000000000000000)))))

(declare-fun e!81878 () (_ BitVec 32))

(assert (=> d!37605 (= lt!64557 e!81878)))

(declare-fun c!22833 () Bool)

(assert (=> d!37605 (= c!22833 (bvsge #b00000000000000000000000000000000 (size!2482 (_keys!4493 (_2!1296 lt!64096)))))))

(assert (=> d!37605 (and (bvsle #b00000000000000000000000000000000 (size!2482 (_keys!4493 (_2!1296 lt!64096)))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!2482 (_keys!4493 (_2!1296 lt!64096))) (size!2482 (_keys!4493 (_2!1296 lt!64096)))))))

(assert (=> d!37605 (= (arrayCountValidKeys!0 (_keys!4493 (_2!1296 lt!64096)) #b00000000000000000000000000000000 (size!2482 (_keys!4493 (_2!1296 lt!64096)))) lt!64557)))

(declare-fun b!125324 () Bool)

(declare-fun e!81879 () (_ BitVec 32))

(assert (=> b!125324 (= e!81878 e!81879)))

(declare-fun c!22834 () Bool)

(assert (=> b!125324 (= c!22834 (validKeyInArray!0 (select (arr!2219 (_keys!4493 (_2!1296 lt!64096))) #b00000000000000000000000000000000)))))

(declare-fun b!125325 () Bool)

(declare-fun call!13420 () (_ BitVec 32))

(assert (=> b!125325 (= e!81879 (bvadd #b00000000000000000000000000000001 call!13420))))

(declare-fun b!125326 () Bool)

(assert (=> b!125326 (= e!81879 call!13420)))

(declare-fun b!125327 () Bool)

(assert (=> b!125327 (= e!81878 #b00000000000000000000000000000000)))

(declare-fun bm!13417 () Bool)

(assert (=> bm!13417 (= call!13420 (arrayCountValidKeys!0 (_keys!4493 (_2!1296 lt!64096)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2482 (_keys!4493 (_2!1296 lt!64096)))))))

(assert (= (and d!37605 c!22833) b!125327))

(assert (= (and d!37605 (not c!22833)) b!125324))

(assert (= (and b!125324 c!22834) b!125325))

(assert (= (and b!125324 (not c!22834)) b!125326))

(assert (= (or b!125325 b!125326) bm!13417))

(declare-fun m!145633 () Bool)

(assert (=> b!125324 m!145633))

(assert (=> b!125324 m!145633))

(declare-fun m!145635 () Bool)

(assert (=> b!125324 m!145635))

(declare-fun m!145637 () Bool)

(assert (=> bm!13417 m!145637))

(assert (=> b!124913 d!37605))

(declare-fun d!37607 () Bool)

(assert (=> d!37607 (= (get!1437 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (v!3107 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!124796 d!37607))

(declare-fun d!37609 () Bool)

(declare-fun e!81880 () Bool)

(assert (=> d!37609 e!81880))

(declare-fun res!60694 () Bool)

(assert (=> d!37609 (=> res!60694 e!81880)))

(declare-fun lt!64560 () Bool)

(assert (=> d!37609 (= res!60694 (not lt!64560))))

(declare-fun lt!64561 () Bool)

(assert (=> d!37609 (= lt!64560 lt!64561)))

(declare-fun lt!64558 () Unit!3867)

(declare-fun e!81881 () Unit!3867)

(assert (=> d!37609 (= lt!64558 e!81881)))

(declare-fun c!22835 () Bool)

(assert (=> d!37609 (= c!22835 lt!64561)))

(assert (=> d!37609 (= lt!64561 (containsKey!170 (toList!854 (getCurrentListMap!535 (_keys!4493 newMap!16) lt!64109 (mask!7010 newMap!16) (extraKeys!2549 newMap!16) (zeroValue!2629 newMap!16) (minValue!2629 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2764 newMap!16))) (select (arr!2219 (_keys!4493 newMap!16)) (index!3231 lt!64093))))))

(assert (=> d!37609 (= (contains!873 (getCurrentListMap!535 (_keys!4493 newMap!16) lt!64109 (mask!7010 newMap!16) (extraKeys!2549 newMap!16) (zeroValue!2629 newMap!16) (minValue!2629 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2764 newMap!16)) (select (arr!2219 (_keys!4493 newMap!16)) (index!3231 lt!64093))) lt!64560)))

(declare-fun b!125328 () Bool)

(declare-fun lt!64559 () Unit!3867)

(assert (=> b!125328 (= e!81881 lt!64559)))

(assert (=> b!125328 (= lt!64559 (lemmaContainsKeyImpliesGetValueByKeyDefined!118 (toList!854 (getCurrentListMap!535 (_keys!4493 newMap!16) lt!64109 (mask!7010 newMap!16) (extraKeys!2549 newMap!16) (zeroValue!2629 newMap!16) (minValue!2629 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2764 newMap!16))) (select (arr!2219 (_keys!4493 newMap!16)) (index!3231 lt!64093))))))

(assert (=> b!125328 (isDefined!119 (getValueByKey!166 (toList!854 (getCurrentListMap!535 (_keys!4493 newMap!16) lt!64109 (mask!7010 newMap!16) (extraKeys!2549 newMap!16) (zeroValue!2629 newMap!16) (minValue!2629 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2764 newMap!16))) (select (arr!2219 (_keys!4493 newMap!16)) (index!3231 lt!64093))))))

(declare-fun b!125329 () Bool)

(declare-fun Unit!3895 () Unit!3867)

(assert (=> b!125329 (= e!81881 Unit!3895)))

(declare-fun b!125330 () Bool)

(assert (=> b!125330 (= e!81880 (isDefined!119 (getValueByKey!166 (toList!854 (getCurrentListMap!535 (_keys!4493 newMap!16) lt!64109 (mask!7010 newMap!16) (extraKeys!2549 newMap!16) (zeroValue!2629 newMap!16) (minValue!2629 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2764 newMap!16))) (select (arr!2219 (_keys!4493 newMap!16)) (index!3231 lt!64093)))))))

(assert (= (and d!37609 c!22835) b!125328))

(assert (= (and d!37609 (not c!22835)) b!125329))

(assert (= (and d!37609 (not res!60694)) b!125330))

(assert (=> d!37609 m!144603))

(declare-fun m!145639 () Bool)

(assert (=> d!37609 m!145639))

(assert (=> b!125328 m!144603))

(declare-fun m!145641 () Bool)

(assert (=> b!125328 m!145641))

(assert (=> b!125328 m!144603))

(declare-fun m!145643 () Bool)

(assert (=> b!125328 m!145643))

(assert (=> b!125328 m!145643))

(declare-fun m!145645 () Bool)

(assert (=> b!125328 m!145645))

(assert (=> b!125330 m!144603))

(assert (=> b!125330 m!145643))

(assert (=> b!125330 m!145643))

(assert (=> b!125330 m!145645))

(assert (=> b!124768 d!37609))

(declare-fun bm!13418 () Bool)

(declare-fun call!13421 () ListLongMap!1677)

(assert (=> bm!13418 (= call!13421 (getCurrentListMapNoExtraKeys!135 (_keys!4493 newMap!16) lt!64109 (mask!7010 newMap!16) (extraKeys!2549 newMap!16) (zeroValue!2629 newMap!16) (minValue!2629 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2764 newMap!16)))))

(declare-fun c!22839 () Bool)

(declare-fun bm!13419 () Bool)

(declare-fun call!13423 () ListLongMap!1677)

(declare-fun call!13427 () ListLongMap!1677)

(declare-fun c!22841 () Bool)

(declare-fun call!13422 () ListLongMap!1677)

(assert (=> bm!13419 (= call!13427 (+!169 (ite c!22841 call!13421 (ite c!22839 call!13423 call!13422)) (ite (or c!22841 c!22839) (tuple2!2569 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2629 newMap!16)) (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2629 newMap!16)))))))

(declare-fun bm!13420 () Bool)

(assert (=> bm!13420 (= call!13423 call!13421)))

(declare-fun b!125332 () Bool)

(declare-fun e!81885 () ListLongMap!1677)

(declare-fun call!13426 () ListLongMap!1677)

(assert (=> b!125332 (= e!81885 call!13426)))

(declare-fun b!125333 () Bool)

(declare-fun e!81890 () ListLongMap!1677)

(assert (=> b!125333 (= e!81890 call!13422)))

(declare-fun b!125334 () Bool)

(declare-fun e!81892 () ListLongMap!1677)

(assert (=> b!125334 (= e!81892 e!81885)))

(assert (=> b!125334 (= c!22839 (and (not (= (bvand (extraKeys!2549 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2549 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!125335 () Bool)

(declare-fun e!81893 () Bool)

(declare-fun call!13425 () Bool)

(assert (=> b!125335 (= e!81893 (not call!13425))))

(declare-fun b!125336 () Bool)

(declare-fun e!81888 () Bool)

(declare-fun e!81891 () Bool)

(assert (=> b!125336 (= e!81888 e!81891)))

(declare-fun res!60703 () Bool)

(assert (=> b!125336 (=> (not res!60703) (not e!81891))))

(declare-fun lt!64577 () ListLongMap!1677)

(assert (=> b!125336 (= res!60703 (contains!873 lt!64577 (select (arr!2219 (_keys!4493 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!125336 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2482 (_keys!4493 newMap!16))))))

(declare-fun bm!13421 () Bool)

(assert (=> bm!13421 (= call!13422 call!13423)))

(declare-fun b!125337 () Bool)

(declare-fun e!81889 () Bool)

(declare-fun call!13424 () Bool)

(assert (=> b!125337 (= e!81889 (not call!13424))))

(declare-fun b!125338 () Bool)

(declare-fun e!81887 () Unit!3867)

(declare-fun Unit!3896 () Unit!3867)

(assert (=> b!125338 (= e!81887 Unit!3896)))

(declare-fun b!125339 () Bool)

(declare-fun e!81882 () Bool)

(assert (=> b!125339 (= e!81882 (validKeyInArray!0 (select (arr!2219 (_keys!4493 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!125340 () Bool)

(declare-fun e!81883 () Bool)

(assert (=> b!125340 (= e!81889 e!81883)))

(declare-fun res!60696 () Bool)

(assert (=> b!125340 (= res!60696 call!13424)))

(assert (=> b!125340 (=> (not res!60696) (not e!81883))))

(declare-fun b!125341 () Bool)

(declare-fun lt!64573 () Unit!3867)

(assert (=> b!125341 (= e!81887 lt!64573)))

(declare-fun lt!64562 () ListLongMap!1677)

(assert (=> b!125341 (= lt!64562 (getCurrentListMapNoExtraKeys!135 (_keys!4493 newMap!16) lt!64109 (mask!7010 newMap!16) (extraKeys!2549 newMap!16) (zeroValue!2629 newMap!16) (minValue!2629 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2764 newMap!16)))))

(declare-fun lt!64568 () (_ BitVec 64))

(assert (=> b!125341 (= lt!64568 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!64578 () (_ BitVec 64))

(assert (=> b!125341 (= lt!64578 (select (arr!2219 (_keys!4493 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!64563 () Unit!3867)

(assert (=> b!125341 (= lt!64563 (addStillContains!86 lt!64562 lt!64568 (zeroValue!2629 newMap!16) lt!64578))))

(assert (=> b!125341 (contains!873 (+!169 lt!64562 (tuple2!2569 lt!64568 (zeroValue!2629 newMap!16))) lt!64578)))

(declare-fun lt!64580 () Unit!3867)

(assert (=> b!125341 (= lt!64580 lt!64563)))

(declare-fun lt!64581 () ListLongMap!1677)

(assert (=> b!125341 (= lt!64581 (getCurrentListMapNoExtraKeys!135 (_keys!4493 newMap!16) lt!64109 (mask!7010 newMap!16) (extraKeys!2549 newMap!16) (zeroValue!2629 newMap!16) (minValue!2629 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2764 newMap!16)))))

(declare-fun lt!64564 () (_ BitVec 64))

(assert (=> b!125341 (= lt!64564 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!64576 () (_ BitVec 64))

(assert (=> b!125341 (= lt!64576 (select (arr!2219 (_keys!4493 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!64574 () Unit!3867)

(assert (=> b!125341 (= lt!64574 (addApplyDifferent!86 lt!64581 lt!64564 (minValue!2629 newMap!16) lt!64576))))

(assert (=> b!125341 (= (apply!110 (+!169 lt!64581 (tuple2!2569 lt!64564 (minValue!2629 newMap!16))) lt!64576) (apply!110 lt!64581 lt!64576))))

(declare-fun lt!64579 () Unit!3867)

(assert (=> b!125341 (= lt!64579 lt!64574)))

(declare-fun lt!64572 () ListLongMap!1677)

(assert (=> b!125341 (= lt!64572 (getCurrentListMapNoExtraKeys!135 (_keys!4493 newMap!16) lt!64109 (mask!7010 newMap!16) (extraKeys!2549 newMap!16) (zeroValue!2629 newMap!16) (minValue!2629 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2764 newMap!16)))))

(declare-fun lt!64582 () (_ BitVec 64))

(assert (=> b!125341 (= lt!64582 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!64570 () (_ BitVec 64))

(assert (=> b!125341 (= lt!64570 (select (arr!2219 (_keys!4493 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!64583 () Unit!3867)

(assert (=> b!125341 (= lt!64583 (addApplyDifferent!86 lt!64572 lt!64582 (zeroValue!2629 newMap!16) lt!64570))))

(assert (=> b!125341 (= (apply!110 (+!169 lt!64572 (tuple2!2569 lt!64582 (zeroValue!2629 newMap!16))) lt!64570) (apply!110 lt!64572 lt!64570))))

(declare-fun lt!64575 () Unit!3867)

(assert (=> b!125341 (= lt!64575 lt!64583)))

(declare-fun lt!64569 () ListLongMap!1677)

(assert (=> b!125341 (= lt!64569 (getCurrentListMapNoExtraKeys!135 (_keys!4493 newMap!16) lt!64109 (mask!7010 newMap!16) (extraKeys!2549 newMap!16) (zeroValue!2629 newMap!16) (minValue!2629 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2764 newMap!16)))))

(declare-fun lt!64566 () (_ BitVec 64))

(assert (=> b!125341 (= lt!64566 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!64567 () (_ BitVec 64))

(assert (=> b!125341 (= lt!64567 (select (arr!2219 (_keys!4493 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!125341 (= lt!64573 (addApplyDifferent!86 lt!64569 lt!64566 (minValue!2629 newMap!16) lt!64567))))

(assert (=> b!125341 (= (apply!110 (+!169 lt!64569 (tuple2!2569 lt!64566 (minValue!2629 newMap!16))) lt!64567) (apply!110 lt!64569 lt!64567))))

(declare-fun b!125342 () Bool)

(declare-fun res!60701 () Bool)

(declare-fun e!81886 () Bool)

(assert (=> b!125342 (=> (not res!60701) (not e!81886))))

(assert (=> b!125342 (= res!60701 e!81889)))

(declare-fun c!22837 () Bool)

(assert (=> b!125342 (= c!22837 (not (= (bvand (extraKeys!2549 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!125343 () Bool)

(declare-fun c!22840 () Bool)

(assert (=> b!125343 (= c!22840 (and (not (= (bvand (extraKeys!2549 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2549 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!125343 (= e!81885 e!81890)))

(declare-fun b!125344 () Bool)

(assert (=> b!125344 (= e!81883 (= (apply!110 lt!64577 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2629 newMap!16)))))

(declare-fun bm!13422 () Bool)

(assert (=> bm!13422 (= call!13424 (contains!873 lt!64577 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!125345 () Bool)

(assert (=> b!125345 (= e!81892 (+!169 call!13427 (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2629 newMap!16))))))

(declare-fun b!125331 () Bool)

(assert (=> b!125331 (= e!81891 (= (apply!110 lt!64577 (select (arr!2219 (_keys!4493 newMap!16)) #b00000000000000000000000000000000)) (get!1436 (select (arr!2220 lt!64109) #b00000000000000000000000000000000) (dynLambda!411 (defaultEntry!2764 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!125331 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2483 lt!64109)))))

(assert (=> b!125331 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2482 (_keys!4493 newMap!16))))))

(declare-fun d!37611 () Bool)

(assert (=> d!37611 e!81886))

(declare-fun res!60697 () Bool)

(assert (=> d!37611 (=> (not res!60697) (not e!81886))))

(assert (=> d!37611 (= res!60697 (or (bvsge #b00000000000000000000000000000000 (size!2482 (_keys!4493 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2482 (_keys!4493 newMap!16))))))))

(declare-fun lt!64565 () ListLongMap!1677)

(assert (=> d!37611 (= lt!64577 lt!64565)))

(declare-fun lt!64571 () Unit!3867)

(assert (=> d!37611 (= lt!64571 e!81887)))

(declare-fun c!22838 () Bool)

(declare-fun e!81884 () Bool)

(assert (=> d!37611 (= c!22838 e!81884)))

(declare-fun res!60698 () Bool)

(assert (=> d!37611 (=> (not res!60698) (not e!81884))))

(assert (=> d!37611 (= res!60698 (bvslt #b00000000000000000000000000000000 (size!2482 (_keys!4493 newMap!16))))))

(assert (=> d!37611 (= lt!64565 e!81892)))

(assert (=> d!37611 (= c!22841 (and (not (= (bvand (extraKeys!2549 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2549 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!37611 (validMask!0 (mask!7010 newMap!16))))

(assert (=> d!37611 (= (getCurrentListMap!535 (_keys!4493 newMap!16) lt!64109 (mask!7010 newMap!16) (extraKeys!2549 newMap!16) (zeroValue!2629 newMap!16) (minValue!2629 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2764 newMap!16)) lt!64577)))

(declare-fun bm!13423 () Bool)

(assert (=> bm!13423 (= call!13426 call!13427)))

(declare-fun b!125346 () Bool)

(assert (=> b!125346 (= e!81886 e!81893)))

(declare-fun c!22836 () Bool)

(assert (=> b!125346 (= c!22836 (not (= (bvand (extraKeys!2549 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!13424 () Bool)

(assert (=> bm!13424 (= call!13425 (contains!873 lt!64577 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!125347 () Bool)

(assert (=> b!125347 (= e!81884 (validKeyInArray!0 (select (arr!2219 (_keys!4493 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!125348 () Bool)

(declare-fun e!81894 () Bool)

(assert (=> b!125348 (= e!81893 e!81894)))

(declare-fun res!60702 () Bool)

(assert (=> b!125348 (= res!60702 call!13425)))

(assert (=> b!125348 (=> (not res!60702) (not e!81894))))

(declare-fun b!125349 () Bool)

(declare-fun res!60699 () Bool)

(assert (=> b!125349 (=> (not res!60699) (not e!81886))))

(assert (=> b!125349 (= res!60699 e!81888)))

(declare-fun res!60695 () Bool)

(assert (=> b!125349 (=> res!60695 e!81888)))

(assert (=> b!125349 (= res!60695 (not e!81882))))

(declare-fun res!60700 () Bool)

(assert (=> b!125349 (=> (not res!60700) (not e!81882))))

(assert (=> b!125349 (= res!60700 (bvslt #b00000000000000000000000000000000 (size!2482 (_keys!4493 newMap!16))))))

(declare-fun b!125350 () Bool)

(assert (=> b!125350 (= e!81890 call!13426)))

(declare-fun b!125351 () Bool)

(assert (=> b!125351 (= e!81894 (= (apply!110 lt!64577 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2629 newMap!16)))))

(assert (= (and d!37611 c!22841) b!125345))

(assert (= (and d!37611 (not c!22841)) b!125334))

(assert (= (and b!125334 c!22839) b!125332))

(assert (= (and b!125334 (not c!22839)) b!125343))

(assert (= (and b!125343 c!22840) b!125350))

(assert (= (and b!125343 (not c!22840)) b!125333))

(assert (= (or b!125350 b!125333) bm!13421))

(assert (= (or b!125332 bm!13421) bm!13420))

(assert (= (or b!125332 b!125350) bm!13423))

(assert (= (or b!125345 bm!13420) bm!13418))

(assert (= (or b!125345 bm!13423) bm!13419))

(assert (= (and d!37611 res!60698) b!125347))

(assert (= (and d!37611 c!22838) b!125341))

(assert (= (and d!37611 (not c!22838)) b!125338))

(assert (= (and d!37611 res!60697) b!125349))

(assert (= (and b!125349 res!60700) b!125339))

(assert (= (and b!125349 (not res!60695)) b!125336))

(assert (= (and b!125336 res!60703) b!125331))

(assert (= (and b!125349 res!60699) b!125342))

(assert (= (and b!125342 c!22837) b!125340))

(assert (= (and b!125342 (not c!22837)) b!125337))

(assert (= (and b!125340 res!60696) b!125344))

(assert (= (or b!125340 b!125337) bm!13422))

(assert (= (and b!125342 res!60701) b!125346))

(assert (= (and b!125346 c!22836) b!125348))

(assert (= (and b!125346 (not c!22836)) b!125335))

(assert (= (and b!125348 res!60702) b!125351))

(assert (= (or b!125348 b!125335) bm!13424))

(declare-fun b_lambda!5501 () Bool)

(assert (=> (not b_lambda!5501) (not b!125331)))

(assert (=> b!125331 t!6029))

(declare-fun b_and!7707 () Bool)

(assert (= b_and!7703 (and (=> t!6029 result!3819) b_and!7707)))

(assert (=> b!125331 t!6031))

(declare-fun b_and!7709 () Bool)

(assert (= b_and!7705 (and (=> t!6031 result!3821) b_and!7709)))

(assert (=> b!125347 m!144619))

(assert (=> b!125347 m!144619))

(assert (=> b!125347 m!144629))

(declare-fun m!145647 () Bool)

(assert (=> b!125331 m!145647))

(assert (=> b!125331 m!144721))

(declare-fun m!145649 () Bool)

(assert (=> b!125331 m!145649))

(assert (=> b!125331 m!144619))

(assert (=> b!125331 m!144721))

(assert (=> b!125331 m!144619))

(declare-fun m!145651 () Bool)

(assert (=> b!125331 m!145651))

(assert (=> b!125331 m!145647))

(assert (=> b!125339 m!144619))

(assert (=> b!125339 m!144619))

(assert (=> b!125339 m!144629))

(declare-fun m!145653 () Bool)

(assert (=> b!125341 m!145653))

(declare-fun m!145655 () Bool)

(assert (=> b!125341 m!145655))

(declare-fun m!145657 () Bool)

(assert (=> b!125341 m!145657))

(declare-fun m!145659 () Bool)

(assert (=> b!125341 m!145659))

(assert (=> b!125341 m!144619))

(declare-fun m!145661 () Bool)

(assert (=> b!125341 m!145661))

(declare-fun m!145663 () Bool)

(assert (=> b!125341 m!145663))

(declare-fun m!145665 () Bool)

(assert (=> b!125341 m!145665))

(assert (=> b!125341 m!145665))

(declare-fun m!145667 () Bool)

(assert (=> b!125341 m!145667))

(declare-fun m!145669 () Bool)

(assert (=> b!125341 m!145669))

(declare-fun m!145671 () Bool)

(assert (=> b!125341 m!145671))

(assert (=> b!125341 m!145659))

(declare-fun m!145673 () Bool)

(assert (=> b!125341 m!145673))

(declare-fun m!145675 () Bool)

(assert (=> b!125341 m!145675))

(declare-fun m!145677 () Bool)

(assert (=> b!125341 m!145677))

(declare-fun m!145679 () Bool)

(assert (=> b!125341 m!145679))

(assert (=> b!125341 m!145669))

(declare-fun m!145681 () Bool)

(assert (=> b!125341 m!145681))

(assert (=> b!125341 m!145655))

(declare-fun m!145683 () Bool)

(assert (=> b!125341 m!145683))

(assert (=> b!125336 m!144619))

(assert (=> b!125336 m!144619))

(declare-fun m!145685 () Bool)

(assert (=> b!125336 m!145685))

(declare-fun m!145687 () Bool)

(assert (=> b!125345 m!145687))

(declare-fun m!145689 () Bool)

(assert (=> b!125351 m!145689))

(declare-fun m!145691 () Bool)

(assert (=> bm!13422 m!145691))

(assert (=> bm!13418 m!145681))

(declare-fun m!145693 () Bool)

(assert (=> bm!13424 m!145693))

(declare-fun m!145695 () Bool)

(assert (=> b!125344 m!145695))

(declare-fun m!145697 () Bool)

(assert (=> bm!13419 m!145697))

(assert (=> d!37611 m!144633))

(assert (=> b!124768 d!37611))

(assert (=> d!37387 d!37383))

(assert (=> d!37387 d!37385))

(declare-fun d!37613 () Bool)

(assert (=> d!37613 (= (apply!110 (+!169 lt!64016 (tuple2!2569 lt!63999 (minValue!2629 (v!3108 (underlying!436 thiss!992))))) lt!64011) (apply!110 lt!64016 lt!64011))))

(assert (=> d!37613 true))

(declare-fun _$34!942 () Unit!3867)

(assert (=> d!37613 (= (choose!754 lt!64016 lt!63999 (minValue!2629 (v!3108 (underlying!436 thiss!992))) lt!64011) _$34!942)))

(declare-fun bs!5180 () Bool)

(assert (= bs!5180 d!37613))

(assert (=> bs!5180 m!144515))

(assert (=> bs!5180 m!144515))

(assert (=> bs!5180 m!144517))

(assert (=> bs!5180 m!144511))

(assert (=> d!37387 d!37613))

(declare-fun d!37615 () Bool)

(declare-fun e!81895 () Bool)

(assert (=> d!37615 e!81895))

(declare-fun res!60704 () Bool)

(assert (=> d!37615 (=> res!60704 e!81895)))

(declare-fun lt!64586 () Bool)

(assert (=> d!37615 (= res!60704 (not lt!64586))))

(declare-fun lt!64587 () Bool)

(assert (=> d!37615 (= lt!64586 lt!64587)))

(declare-fun lt!64584 () Unit!3867)

(declare-fun e!81896 () Unit!3867)

(assert (=> d!37615 (= lt!64584 e!81896)))

(declare-fun c!22842 () Bool)

(assert (=> d!37615 (= c!22842 lt!64587)))

(assert (=> d!37615 (= lt!64587 (containsKey!170 (toList!854 lt!64016) lt!64011))))

(assert (=> d!37615 (= (contains!873 lt!64016 lt!64011) lt!64586)))

(declare-fun b!125353 () Bool)

(declare-fun lt!64585 () Unit!3867)

(assert (=> b!125353 (= e!81896 lt!64585)))

(assert (=> b!125353 (= lt!64585 (lemmaContainsKeyImpliesGetValueByKeyDefined!118 (toList!854 lt!64016) lt!64011))))

(assert (=> b!125353 (isDefined!119 (getValueByKey!166 (toList!854 lt!64016) lt!64011))))

(declare-fun b!125354 () Bool)

(declare-fun Unit!3897 () Unit!3867)

(assert (=> b!125354 (= e!81896 Unit!3897)))

(declare-fun b!125355 () Bool)

(assert (=> b!125355 (= e!81895 (isDefined!119 (getValueByKey!166 (toList!854 lt!64016) lt!64011)))))

(assert (= (and d!37615 c!22842) b!125353))

(assert (= (and d!37615 (not c!22842)) b!125354))

(assert (= (and d!37615 (not res!60704)) b!125355))

(declare-fun m!145699 () Bool)

(assert (=> d!37615 m!145699))

(declare-fun m!145701 () Bool)

(assert (=> b!125353 m!145701))

(assert (=> b!125353 m!144989))

(assert (=> b!125353 m!144989))

(declare-fun m!145703 () Bool)

(assert (=> b!125353 m!145703))

(assert (=> b!125355 m!144989))

(assert (=> b!125355 m!144989))

(assert (=> b!125355 m!145703))

(assert (=> d!37387 d!37615))

(assert (=> d!37387 d!37397))

(declare-fun d!37617 () Bool)

(declare-fun e!81897 () Bool)

(assert (=> d!37617 e!81897))

(declare-fun res!60705 () Bool)

(assert (=> d!37617 (=> res!60705 e!81897)))

(declare-fun lt!64590 () Bool)

(assert (=> d!37617 (= res!60705 (not lt!64590))))

(declare-fun lt!64591 () Bool)

(assert (=> d!37617 (= lt!64590 lt!64591)))

(declare-fun lt!64588 () Unit!3867)

(declare-fun e!81898 () Unit!3867)

(assert (=> d!37617 (= lt!64588 e!81898)))

(declare-fun c!22843 () Bool)

(assert (=> d!37617 (= c!22843 lt!64591)))

(assert (=> d!37617 (= lt!64591 (containsKey!170 (toList!854 lt!64216) (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> d!37617 (= (contains!873 lt!64216 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) lt!64590)))

(declare-fun b!125356 () Bool)

(declare-fun lt!64589 () Unit!3867)

(assert (=> b!125356 (= e!81898 lt!64589)))

(assert (=> b!125356 (= lt!64589 (lemmaContainsKeyImpliesGetValueByKeyDefined!118 (toList!854 lt!64216) (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!125356 (isDefined!119 (getValueByKey!166 (toList!854 lt!64216) (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!125357 () Bool)

(declare-fun Unit!3898 () Unit!3867)

(assert (=> b!125357 (= e!81898 Unit!3898)))

(declare-fun b!125358 () Bool)

(assert (=> b!125358 (= e!81897 (isDefined!119 (getValueByKey!166 (toList!854 lt!64216) (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(assert (= (and d!37617 c!22843) b!125356))

(assert (= (and d!37617 (not c!22843)) b!125357))

(assert (= (and d!37617 (not res!60705)) b!125358))

(assert (=> d!37617 m!144493))

(declare-fun m!145705 () Bool)

(assert (=> d!37617 m!145705))

(assert (=> b!125356 m!144493))

(declare-fun m!145707 () Bool)

(assert (=> b!125356 m!145707))

(assert (=> b!125356 m!144493))

(declare-fun m!145709 () Bool)

(assert (=> b!125356 m!145709))

(assert (=> b!125356 m!145709))

(declare-fun m!145711 () Bool)

(assert (=> b!125356 m!145711))

(assert (=> b!125358 m!144493))

(assert (=> b!125358 m!145709))

(assert (=> b!125358 m!145709))

(assert (=> b!125358 m!145711))

(assert (=> b!124841 d!37617))

(declare-fun d!37619 () Bool)

(declare-fun e!81899 () Bool)

(assert (=> d!37619 e!81899))

(declare-fun res!60706 () Bool)

(assert (=> d!37619 (=> (not res!60706) (not e!81899))))

(declare-fun lt!64592 () ListLongMap!1677)

(assert (=> d!37619 (= res!60706 (contains!873 lt!64592 (_1!1295 (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!64593 () List!1695)

(assert (=> d!37619 (= lt!64592 (ListLongMap!1678 lt!64593))))

(declare-fun lt!64595 () Unit!3867)

(declare-fun lt!64594 () Unit!3867)

(assert (=> d!37619 (= lt!64595 lt!64594)))

(assert (=> d!37619 (= (getValueByKey!166 lt!64593 (_1!1295 (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!171 (_2!1295 (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!37619 (= lt!64594 (lemmaContainsTupThenGetReturnValue!81 lt!64593 (_1!1295 (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1295 (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!37619 (= lt!64593 (insertStrictlySorted!84 (toList!854 (getCurrentListMap!535 (_keys!4493 newMap!16) (_values!2747 newMap!16) (mask!7010 newMap!16) (extraKeys!2549 newMap!16) (zeroValue!2629 newMap!16) (minValue!2629 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2764 newMap!16))) (_1!1295 (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1295 (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!37619 (= (+!169 (getCurrentListMap!535 (_keys!4493 newMap!16) (_values!2747 newMap!16) (mask!7010 newMap!16) (extraKeys!2549 newMap!16) (zeroValue!2629 newMap!16) (minValue!2629 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2764 newMap!16)) (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!64592)))

(declare-fun b!125359 () Bool)

(declare-fun res!60707 () Bool)

(assert (=> b!125359 (=> (not res!60707) (not e!81899))))

(assert (=> b!125359 (= res!60707 (= (getValueByKey!166 (toList!854 lt!64592) (_1!1295 (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!171 (_2!1295 (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!125360 () Bool)

(assert (=> b!125360 (= e!81899 (contains!874 (toList!854 lt!64592) (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!37619 res!60706) b!125359))

(assert (= (and b!125359 res!60707) b!125360))

(declare-fun m!145713 () Bool)

(assert (=> d!37619 m!145713))

(declare-fun m!145715 () Bool)

(assert (=> d!37619 m!145715))

(declare-fun m!145717 () Bool)

(assert (=> d!37619 m!145717))

(declare-fun m!145719 () Bool)

(assert (=> d!37619 m!145719))

(declare-fun m!145721 () Bool)

(assert (=> b!125359 m!145721))

(declare-fun m!145723 () Bool)

(assert (=> b!125360 m!145723))

(assert (=> d!37359 d!37619))

(assert (=> d!37359 d!37339))

(declare-fun d!37621 () Bool)

(assert (=> d!37621 (= (+!169 (getCurrentListMap!535 (_keys!4493 newMap!16) (_values!2747 newMap!16) (mask!7010 newMap!16) (extraKeys!2549 newMap!16) (zeroValue!2629 newMap!16) (minValue!2629 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2764 newMap!16)) (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (getCurrentListMap!535 (_keys!4493 newMap!16) (_values!2747 newMap!16) (mask!7010 newMap!16) lt!64103 (zeroValue!2629 newMap!16) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) #b00000000000000000000000000000000 (defaultEntry!2764 newMap!16)))))

(assert (=> d!37621 true))

(declare-fun _$8!106 () Unit!3867)

(assert (=> d!37621 (= (choose!751 (_keys!4493 newMap!16) (_values!2747 newMap!16) (mask!7010 newMap!16) (extraKeys!2549 newMap!16) lt!64103 (zeroValue!2629 newMap!16) (minValue!2629 newMap!16) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2764 newMap!16)) _$8!106)))

(declare-fun bs!5181 () Bool)

(assert (= bs!5181 d!37621))

(assert (=> bs!5181 m!144491))

(assert (=> bs!5181 m!144491))

(assert (=> bs!5181 m!144893))

(assert (=> bs!5181 m!144425))

(assert (=> bs!5181 m!144891))

(assert (=> d!37359 d!37621))

(assert (=> d!37359 d!37435))

(declare-fun bm!13425 () Bool)

(declare-fun call!13428 () ListLongMap!1677)

(assert (=> bm!13425 (= call!13428 (getCurrentListMapNoExtraKeys!135 (_keys!4493 newMap!16) (_values!2747 newMap!16) (mask!7010 newMap!16) lt!64103 (zeroValue!2629 newMap!16) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) #b00000000000000000000000000000000 (defaultEntry!2764 newMap!16)))))

(declare-fun call!13429 () ListLongMap!1677)

(declare-fun call!13430 () ListLongMap!1677)

(declare-fun bm!13426 () Bool)

(declare-fun c!22849 () Bool)

(declare-fun call!13434 () ListLongMap!1677)

(declare-fun c!22847 () Bool)

(assert (=> bm!13426 (= call!13434 (+!169 (ite c!22849 call!13428 (ite c!22847 call!13430 call!13429)) (ite (or c!22849 c!22847) (tuple2!2569 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2629 newMap!16)) (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun bm!13427 () Bool)

(assert (=> bm!13427 (= call!13430 call!13428)))

(declare-fun b!125362 () Bool)

(declare-fun e!81903 () ListLongMap!1677)

(declare-fun call!13433 () ListLongMap!1677)

(assert (=> b!125362 (= e!81903 call!13433)))

(declare-fun b!125363 () Bool)

(declare-fun e!81908 () ListLongMap!1677)

(assert (=> b!125363 (= e!81908 call!13429)))

(declare-fun b!125364 () Bool)

(declare-fun e!81910 () ListLongMap!1677)

(assert (=> b!125364 (= e!81910 e!81903)))

(assert (=> b!125364 (= c!22847 (and (not (= (bvand lt!64103 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand lt!64103 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!125365 () Bool)

(declare-fun e!81911 () Bool)

(declare-fun call!13432 () Bool)

(assert (=> b!125365 (= e!81911 (not call!13432))))

(declare-fun b!125366 () Bool)

(declare-fun e!81906 () Bool)

(declare-fun e!81909 () Bool)

(assert (=> b!125366 (= e!81906 e!81909)))

(declare-fun res!60716 () Bool)

(assert (=> b!125366 (=> (not res!60716) (not e!81909))))

(declare-fun lt!64611 () ListLongMap!1677)

(assert (=> b!125366 (= res!60716 (contains!873 lt!64611 (select (arr!2219 (_keys!4493 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!125366 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2482 (_keys!4493 newMap!16))))))

(declare-fun bm!13428 () Bool)

(assert (=> bm!13428 (= call!13429 call!13430)))

(declare-fun b!125367 () Bool)

(declare-fun e!81907 () Bool)

(declare-fun call!13431 () Bool)

(assert (=> b!125367 (= e!81907 (not call!13431))))

(declare-fun b!125368 () Bool)

(declare-fun e!81905 () Unit!3867)

(declare-fun Unit!3899 () Unit!3867)

(assert (=> b!125368 (= e!81905 Unit!3899)))

(declare-fun b!125369 () Bool)

(declare-fun e!81900 () Bool)

(assert (=> b!125369 (= e!81900 (validKeyInArray!0 (select (arr!2219 (_keys!4493 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!125370 () Bool)

(declare-fun e!81901 () Bool)

(assert (=> b!125370 (= e!81907 e!81901)))

(declare-fun res!60709 () Bool)

(assert (=> b!125370 (= res!60709 call!13431)))

(assert (=> b!125370 (=> (not res!60709) (not e!81901))))

(declare-fun b!125371 () Bool)

(declare-fun lt!64607 () Unit!3867)

(assert (=> b!125371 (= e!81905 lt!64607)))

(declare-fun lt!64596 () ListLongMap!1677)

(assert (=> b!125371 (= lt!64596 (getCurrentListMapNoExtraKeys!135 (_keys!4493 newMap!16) (_values!2747 newMap!16) (mask!7010 newMap!16) lt!64103 (zeroValue!2629 newMap!16) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) #b00000000000000000000000000000000 (defaultEntry!2764 newMap!16)))))

(declare-fun lt!64602 () (_ BitVec 64))

(assert (=> b!125371 (= lt!64602 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!64612 () (_ BitVec 64))

(assert (=> b!125371 (= lt!64612 (select (arr!2219 (_keys!4493 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!64597 () Unit!3867)

(assert (=> b!125371 (= lt!64597 (addStillContains!86 lt!64596 lt!64602 (zeroValue!2629 newMap!16) lt!64612))))

(assert (=> b!125371 (contains!873 (+!169 lt!64596 (tuple2!2569 lt!64602 (zeroValue!2629 newMap!16))) lt!64612)))

(declare-fun lt!64614 () Unit!3867)

(assert (=> b!125371 (= lt!64614 lt!64597)))

(declare-fun lt!64615 () ListLongMap!1677)

(assert (=> b!125371 (= lt!64615 (getCurrentListMapNoExtraKeys!135 (_keys!4493 newMap!16) (_values!2747 newMap!16) (mask!7010 newMap!16) lt!64103 (zeroValue!2629 newMap!16) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) #b00000000000000000000000000000000 (defaultEntry!2764 newMap!16)))))

(declare-fun lt!64598 () (_ BitVec 64))

(assert (=> b!125371 (= lt!64598 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!64610 () (_ BitVec 64))

(assert (=> b!125371 (= lt!64610 (select (arr!2219 (_keys!4493 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!64608 () Unit!3867)

(assert (=> b!125371 (= lt!64608 (addApplyDifferent!86 lt!64615 lt!64598 (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) lt!64610))))

(assert (=> b!125371 (= (apply!110 (+!169 lt!64615 (tuple2!2569 lt!64598 (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!64610) (apply!110 lt!64615 lt!64610))))

(declare-fun lt!64613 () Unit!3867)

(assert (=> b!125371 (= lt!64613 lt!64608)))

(declare-fun lt!64606 () ListLongMap!1677)

(assert (=> b!125371 (= lt!64606 (getCurrentListMapNoExtraKeys!135 (_keys!4493 newMap!16) (_values!2747 newMap!16) (mask!7010 newMap!16) lt!64103 (zeroValue!2629 newMap!16) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) #b00000000000000000000000000000000 (defaultEntry!2764 newMap!16)))))

(declare-fun lt!64616 () (_ BitVec 64))

(assert (=> b!125371 (= lt!64616 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!64604 () (_ BitVec 64))

(assert (=> b!125371 (= lt!64604 (select (arr!2219 (_keys!4493 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!64617 () Unit!3867)

(assert (=> b!125371 (= lt!64617 (addApplyDifferent!86 lt!64606 lt!64616 (zeroValue!2629 newMap!16) lt!64604))))

(assert (=> b!125371 (= (apply!110 (+!169 lt!64606 (tuple2!2569 lt!64616 (zeroValue!2629 newMap!16))) lt!64604) (apply!110 lt!64606 lt!64604))))

(declare-fun lt!64609 () Unit!3867)

(assert (=> b!125371 (= lt!64609 lt!64617)))

(declare-fun lt!64603 () ListLongMap!1677)

(assert (=> b!125371 (= lt!64603 (getCurrentListMapNoExtraKeys!135 (_keys!4493 newMap!16) (_values!2747 newMap!16) (mask!7010 newMap!16) lt!64103 (zeroValue!2629 newMap!16) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) #b00000000000000000000000000000000 (defaultEntry!2764 newMap!16)))))

(declare-fun lt!64600 () (_ BitVec 64))

(assert (=> b!125371 (= lt!64600 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!64601 () (_ BitVec 64))

(assert (=> b!125371 (= lt!64601 (select (arr!2219 (_keys!4493 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!125371 (= lt!64607 (addApplyDifferent!86 lt!64603 lt!64600 (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) lt!64601))))

(assert (=> b!125371 (= (apply!110 (+!169 lt!64603 (tuple2!2569 lt!64600 (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!64601) (apply!110 lt!64603 lt!64601))))

(declare-fun b!125372 () Bool)

(declare-fun res!60714 () Bool)

(declare-fun e!81904 () Bool)

(assert (=> b!125372 (=> (not res!60714) (not e!81904))))

(assert (=> b!125372 (= res!60714 e!81907)))

(declare-fun c!22845 () Bool)

(assert (=> b!125372 (= c!22845 (not (= (bvand lt!64103 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!125373 () Bool)

(declare-fun c!22848 () Bool)

(assert (=> b!125373 (= c!22848 (and (not (= (bvand lt!64103 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand lt!64103 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!125373 (= e!81903 e!81908)))

(declare-fun b!125374 () Bool)

(assert (=> b!125374 (= e!81901 (= (apply!110 lt!64611 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2629 newMap!16)))))

(declare-fun bm!13429 () Bool)

(assert (=> bm!13429 (= call!13431 (contains!873 lt!64611 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!125375 () Bool)

(assert (=> b!125375 (= e!81910 (+!169 call!13434 (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!125361 () Bool)

(assert (=> b!125361 (= e!81909 (= (apply!110 lt!64611 (select (arr!2219 (_keys!4493 newMap!16)) #b00000000000000000000000000000000)) (get!1436 (select (arr!2220 (_values!2747 newMap!16)) #b00000000000000000000000000000000) (dynLambda!411 (defaultEntry!2764 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!125361 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2483 (_values!2747 newMap!16))))))

(assert (=> b!125361 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2482 (_keys!4493 newMap!16))))))

(declare-fun d!37623 () Bool)

(assert (=> d!37623 e!81904))

(declare-fun res!60710 () Bool)

(assert (=> d!37623 (=> (not res!60710) (not e!81904))))

(assert (=> d!37623 (= res!60710 (or (bvsge #b00000000000000000000000000000000 (size!2482 (_keys!4493 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2482 (_keys!4493 newMap!16))))))))

(declare-fun lt!64599 () ListLongMap!1677)

(assert (=> d!37623 (= lt!64611 lt!64599)))

(declare-fun lt!64605 () Unit!3867)

(assert (=> d!37623 (= lt!64605 e!81905)))

(declare-fun c!22846 () Bool)

(declare-fun e!81902 () Bool)

(assert (=> d!37623 (= c!22846 e!81902)))

(declare-fun res!60711 () Bool)

(assert (=> d!37623 (=> (not res!60711) (not e!81902))))

(assert (=> d!37623 (= res!60711 (bvslt #b00000000000000000000000000000000 (size!2482 (_keys!4493 newMap!16))))))

(assert (=> d!37623 (= lt!64599 e!81910)))

(assert (=> d!37623 (= c!22849 (and (not (= (bvand lt!64103 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand lt!64103 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!37623 (validMask!0 (mask!7010 newMap!16))))

(assert (=> d!37623 (= (getCurrentListMap!535 (_keys!4493 newMap!16) (_values!2747 newMap!16) (mask!7010 newMap!16) lt!64103 (zeroValue!2629 newMap!16) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) #b00000000000000000000000000000000 (defaultEntry!2764 newMap!16)) lt!64611)))

(declare-fun bm!13430 () Bool)

(assert (=> bm!13430 (= call!13433 call!13434)))

(declare-fun b!125376 () Bool)

(assert (=> b!125376 (= e!81904 e!81911)))

(declare-fun c!22844 () Bool)

(assert (=> b!125376 (= c!22844 (not (= (bvand lt!64103 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!13431 () Bool)

(assert (=> bm!13431 (= call!13432 (contains!873 lt!64611 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!125377 () Bool)

(assert (=> b!125377 (= e!81902 (validKeyInArray!0 (select (arr!2219 (_keys!4493 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!125378 () Bool)

(declare-fun e!81912 () Bool)

(assert (=> b!125378 (= e!81911 e!81912)))

(declare-fun res!60715 () Bool)

(assert (=> b!125378 (= res!60715 call!13432)))

(assert (=> b!125378 (=> (not res!60715) (not e!81912))))

(declare-fun b!125379 () Bool)

(declare-fun res!60712 () Bool)

(assert (=> b!125379 (=> (not res!60712) (not e!81904))))

(assert (=> b!125379 (= res!60712 e!81906)))

(declare-fun res!60708 () Bool)

(assert (=> b!125379 (=> res!60708 e!81906)))

(assert (=> b!125379 (= res!60708 (not e!81900))))

(declare-fun res!60713 () Bool)

(assert (=> b!125379 (=> (not res!60713) (not e!81900))))

(assert (=> b!125379 (= res!60713 (bvslt #b00000000000000000000000000000000 (size!2482 (_keys!4493 newMap!16))))))

(declare-fun b!125380 () Bool)

(assert (=> b!125380 (= e!81908 call!13433)))

(declare-fun b!125381 () Bool)

(assert (=> b!125381 (= e!81912 (= (apply!110 lt!64611 #b1000000000000000000000000000000000000000000000000000000000000000) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!37623 c!22849) b!125375))

(assert (= (and d!37623 (not c!22849)) b!125364))

(assert (= (and b!125364 c!22847) b!125362))

(assert (= (and b!125364 (not c!22847)) b!125373))

(assert (= (and b!125373 c!22848) b!125380))

(assert (= (and b!125373 (not c!22848)) b!125363))

(assert (= (or b!125380 b!125363) bm!13428))

(assert (= (or b!125362 bm!13428) bm!13427))

(assert (= (or b!125362 b!125380) bm!13430))

(assert (= (or b!125375 bm!13427) bm!13425))

(assert (= (or b!125375 bm!13430) bm!13426))

(assert (= (and d!37623 res!60711) b!125377))

(assert (= (and d!37623 c!22846) b!125371))

(assert (= (and d!37623 (not c!22846)) b!125368))

(assert (= (and d!37623 res!60710) b!125379))

(assert (= (and b!125379 res!60713) b!125369))

(assert (= (and b!125379 (not res!60708)) b!125366))

(assert (= (and b!125366 res!60716) b!125361))

(assert (= (and b!125379 res!60712) b!125372))

(assert (= (and b!125372 c!22845) b!125370))

(assert (= (and b!125372 (not c!22845)) b!125367))

(assert (= (and b!125370 res!60709) b!125374))

(assert (= (or b!125370 b!125367) bm!13429))

(assert (= (and b!125372 res!60714) b!125376))

(assert (= (and b!125376 c!22844) b!125378))

(assert (= (and b!125376 (not c!22844)) b!125365))

(assert (= (and b!125378 res!60715) b!125381))

(assert (= (or b!125378 b!125365) bm!13431))

(declare-fun b_lambda!5503 () Bool)

(assert (=> (not b_lambda!5503) (not b!125361)))

(assert (=> b!125361 t!6029))

(declare-fun b_and!7711 () Bool)

(assert (= b_and!7707 (and (=> t!6029 result!3819) b_and!7711)))

(assert (=> b!125361 t!6031))

(declare-fun b_and!7713 () Bool)

(assert (= b_and!7709 (and (=> t!6031 result!3821) b_and!7713)))

(assert (=> b!125377 m!144619))

(assert (=> b!125377 m!144619))

(assert (=> b!125377 m!144629))

(assert (=> b!125361 m!144719))

(assert (=> b!125361 m!144721))

(assert (=> b!125361 m!144723))

(assert (=> b!125361 m!144619))

(assert (=> b!125361 m!144721))

(assert (=> b!125361 m!144619))

(declare-fun m!145725 () Bool)

(assert (=> b!125361 m!145725))

(assert (=> b!125361 m!144719))

(assert (=> b!125369 m!144619))

(assert (=> b!125369 m!144619))

(assert (=> b!125369 m!144629))

(declare-fun m!145727 () Bool)

(assert (=> b!125371 m!145727))

(declare-fun m!145729 () Bool)

(assert (=> b!125371 m!145729))

(declare-fun m!145731 () Bool)

(assert (=> b!125371 m!145731))

(declare-fun m!145733 () Bool)

(assert (=> b!125371 m!145733))

(assert (=> b!125371 m!144619))

(declare-fun m!145735 () Bool)

(assert (=> b!125371 m!145735))

(declare-fun m!145737 () Bool)

(assert (=> b!125371 m!145737))

(declare-fun m!145739 () Bool)

(assert (=> b!125371 m!145739))

(assert (=> b!125371 m!145739))

(declare-fun m!145741 () Bool)

(assert (=> b!125371 m!145741))

(declare-fun m!145743 () Bool)

(assert (=> b!125371 m!145743))

(declare-fun m!145745 () Bool)

(assert (=> b!125371 m!145745))

(assert (=> b!125371 m!145733))

(declare-fun m!145747 () Bool)

(assert (=> b!125371 m!145747))

(declare-fun m!145749 () Bool)

(assert (=> b!125371 m!145749))

(declare-fun m!145751 () Bool)

(assert (=> b!125371 m!145751))

(assert (=> b!125371 m!144425))

(declare-fun m!145753 () Bool)

(assert (=> b!125371 m!145753))

(assert (=> b!125371 m!145743))

(assert (=> b!125371 m!144425))

(declare-fun m!145755 () Bool)

(assert (=> b!125371 m!145755))

(assert (=> b!125371 m!145729))

(assert (=> b!125371 m!144425))

(declare-fun m!145757 () Bool)

(assert (=> b!125371 m!145757))

(assert (=> b!125366 m!144619))

(assert (=> b!125366 m!144619))

(declare-fun m!145759 () Bool)

(assert (=> b!125366 m!145759))

(declare-fun m!145761 () Bool)

(assert (=> b!125375 m!145761))

(declare-fun m!145763 () Bool)

(assert (=> b!125381 m!145763))

(declare-fun m!145765 () Bool)

(assert (=> bm!13429 m!145765))

(assert (=> bm!13425 m!144425))

(assert (=> bm!13425 m!145755))

(declare-fun m!145767 () Bool)

(assert (=> bm!13431 m!145767))

(declare-fun m!145769 () Bool)

(assert (=> b!125374 m!145769))

(declare-fun m!145771 () Bool)

(assert (=> bm!13426 m!145771))

(assert (=> d!37623 m!144633))

(assert (=> d!37359 d!37623))

(assert (=> b!124711 d!37493))

(declare-fun d!37625 () Bool)

(declare-fun e!81913 () Bool)

(assert (=> d!37625 e!81913))

(declare-fun res!60717 () Bool)

(assert (=> d!37625 (=> (not res!60717) (not e!81913))))

(declare-fun lt!64618 () ListLongMap!1677)

(assert (=> d!37625 (= res!60717 (contains!873 lt!64618 (_1!1295 (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!22645 (ite c!22640 (minValue!2629 newMap!16) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2629 newMap!16))))))))

(declare-fun lt!64619 () List!1695)

(assert (=> d!37625 (= lt!64618 (ListLongMap!1678 lt!64619))))

(declare-fun lt!64621 () Unit!3867)

(declare-fun lt!64620 () Unit!3867)

(assert (=> d!37625 (= lt!64621 lt!64620)))

(assert (=> d!37625 (= (getValueByKey!166 lt!64619 (_1!1295 (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!22645 (ite c!22640 (minValue!2629 newMap!16) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2629 newMap!16))))) (Some!171 (_2!1295 (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!22645 (ite c!22640 (minValue!2629 newMap!16) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2629 newMap!16))))))))

(assert (=> d!37625 (= lt!64620 (lemmaContainsTupThenGetReturnValue!81 lt!64619 (_1!1295 (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!22645 (ite c!22640 (minValue!2629 newMap!16) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2629 newMap!16)))) (_2!1295 (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!22645 (ite c!22640 (minValue!2629 newMap!16) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2629 newMap!16))))))))

(assert (=> d!37625 (= lt!64619 (insertStrictlySorted!84 (toList!854 call!13384) (_1!1295 (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!22645 (ite c!22640 (minValue!2629 newMap!16) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2629 newMap!16)))) (_2!1295 (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!22645 (ite c!22640 (minValue!2629 newMap!16) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2629 newMap!16))))))))

(assert (=> d!37625 (= (+!169 call!13384 (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!22645 (ite c!22640 (minValue!2629 newMap!16) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2629 newMap!16)))) lt!64618)))

(declare-fun b!125382 () Bool)

(declare-fun res!60718 () Bool)

(assert (=> b!125382 (=> (not res!60718) (not e!81913))))

(assert (=> b!125382 (= res!60718 (= (getValueByKey!166 (toList!854 lt!64618) (_1!1295 (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!22645 (ite c!22640 (minValue!2629 newMap!16) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2629 newMap!16))))) (Some!171 (_2!1295 (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!22645 (ite c!22640 (minValue!2629 newMap!16) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2629 newMap!16)))))))))

(declare-fun b!125383 () Bool)

(assert (=> b!125383 (= e!81913 (contains!874 (toList!854 lt!64618) (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!22645 (ite c!22640 (minValue!2629 newMap!16) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2629 newMap!16)))))))

(assert (= (and d!37625 res!60717) b!125382))

(assert (= (and b!125382 res!60718) b!125383))

(declare-fun m!145773 () Bool)

(assert (=> d!37625 m!145773))

(declare-fun m!145775 () Bool)

(assert (=> d!37625 m!145775))

(declare-fun m!145777 () Bool)

(assert (=> d!37625 m!145777))

(declare-fun m!145779 () Bool)

(assert (=> d!37625 m!145779))

(declare-fun m!145781 () Bool)

(assert (=> b!125382 m!145781))

(declare-fun m!145783 () Bool)

(assert (=> b!125383 m!145783))

(assert (=> b!124933 d!37625))

(declare-fun d!37627 () Bool)

(declare-fun c!22850 () Bool)

(assert (=> d!37627 (= c!22850 (and ((_ is Cons!1691) (toList!854 lt!64313)) (= (_1!1295 (h!2292 (toList!854 lt!64313))) (_1!1295 (ite c!22645 (ite c!22640 (tuple2!2569 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2569 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(declare-fun e!81914 () Option!172)

(assert (=> d!37627 (= (getValueByKey!166 (toList!854 lt!64313) (_1!1295 (ite c!22645 (ite c!22640 (tuple2!2569 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2569 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))) e!81914)))

(declare-fun b!125384 () Bool)

(assert (=> b!125384 (= e!81914 (Some!171 (_2!1295 (h!2292 (toList!854 lt!64313)))))))

(declare-fun e!81915 () Option!172)

(declare-fun b!125386 () Bool)

(assert (=> b!125386 (= e!81915 (getValueByKey!166 (t!6022 (toList!854 lt!64313)) (_1!1295 (ite c!22645 (ite c!22640 (tuple2!2569 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2569 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!125387 () Bool)

(assert (=> b!125387 (= e!81915 None!170)))

(declare-fun b!125385 () Bool)

(assert (=> b!125385 (= e!81914 e!81915)))

(declare-fun c!22851 () Bool)

(assert (=> b!125385 (= c!22851 (and ((_ is Cons!1691) (toList!854 lt!64313)) (not (= (_1!1295 (h!2292 (toList!854 lt!64313))) (_1!1295 (ite c!22645 (ite c!22640 (tuple2!2569 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2569 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))))

(assert (= (and d!37627 c!22850) b!125384))

(assert (= (and d!37627 (not c!22850)) b!125385))

(assert (= (and b!125385 c!22851) b!125386))

(assert (= (and b!125385 (not c!22851)) b!125387))

(declare-fun m!145785 () Bool)

(assert (=> b!125386 m!145785))

(assert (=> b!124905 d!37627))

(declare-fun d!37629 () Bool)

(assert (=> d!37629 (contains!873 (+!169 lt!64172 (tuple2!2569 lt!64178 (zeroValue!2629 newMap!16))) lt!64188)))

(declare-fun lt!64622 () Unit!3867)

(assert (=> d!37629 (= lt!64622 (choose!755 lt!64172 lt!64178 (zeroValue!2629 newMap!16) lt!64188))))

(assert (=> d!37629 (contains!873 lt!64172 lt!64188)))

(assert (=> d!37629 (= (addStillContains!86 lt!64172 lt!64178 (zeroValue!2629 newMap!16) lt!64188) lt!64622)))

(declare-fun bs!5182 () Bool)

(assert (= bs!5182 d!37629))

(assert (=> bs!5182 m!144733))

(assert (=> bs!5182 m!144733))

(assert (=> bs!5182 m!144747))

(declare-fun m!145787 () Bool)

(assert (=> bs!5182 m!145787))

(declare-fun m!145789 () Bool)

(assert (=> bs!5182 m!145789))

(assert (=> b!124785 d!37629))

(declare-fun d!37631 () Bool)

(assert (=> d!37631 (= (apply!110 (+!169 lt!64182 (tuple2!2569 lt!64192 (zeroValue!2629 newMap!16))) lt!64180) (apply!110 lt!64182 lt!64180))))

(declare-fun lt!64623 () Unit!3867)

(assert (=> d!37631 (= lt!64623 (choose!754 lt!64182 lt!64192 (zeroValue!2629 newMap!16) lt!64180))))

(declare-fun e!81916 () Bool)

(assert (=> d!37631 e!81916))

(declare-fun res!60719 () Bool)

(assert (=> d!37631 (=> (not res!60719) (not e!81916))))

(assert (=> d!37631 (= res!60719 (contains!873 lt!64182 lt!64180))))

(assert (=> d!37631 (= (addApplyDifferent!86 lt!64182 lt!64192 (zeroValue!2629 newMap!16) lt!64180) lt!64623)))

(declare-fun b!125388 () Bool)

(assert (=> b!125388 (= e!81916 (not (= lt!64180 lt!64192)))))

(assert (= (and d!37631 res!60719) b!125388))

(assert (=> d!37631 m!144743))

(declare-fun m!145791 () Bool)

(assert (=> d!37631 m!145791))

(assert (=> d!37631 m!144737))

(assert (=> d!37631 m!144743))

(assert (=> d!37631 m!144745))

(declare-fun m!145793 () Bool)

(assert (=> d!37631 m!145793))

(assert (=> b!124785 d!37631))

(declare-fun d!37633 () Bool)

(assert (=> d!37633 (= (apply!110 lt!64191 lt!64186) (get!1439 (getValueByKey!166 (toList!854 lt!64191) lt!64186)))))

(declare-fun bs!5183 () Bool)

(assert (= bs!5183 d!37633))

(declare-fun m!145795 () Bool)

(assert (=> bs!5183 m!145795))

(assert (=> bs!5183 m!145795))

(declare-fun m!145797 () Bool)

(assert (=> bs!5183 m!145797))

(assert (=> b!124785 d!37633))

(declare-fun d!37635 () Bool)

(declare-fun e!81917 () Bool)

(assert (=> d!37635 e!81917))

(declare-fun res!60720 () Bool)

(assert (=> d!37635 (=> (not res!60720) (not e!81917))))

(declare-fun lt!64624 () ListLongMap!1677)

(assert (=> d!37635 (= res!60720 (contains!873 lt!64624 (_1!1295 (tuple2!2569 lt!64174 (minValue!2629 newMap!16)))))))

(declare-fun lt!64625 () List!1695)

(assert (=> d!37635 (= lt!64624 (ListLongMap!1678 lt!64625))))

(declare-fun lt!64627 () Unit!3867)

(declare-fun lt!64626 () Unit!3867)

(assert (=> d!37635 (= lt!64627 lt!64626)))

(assert (=> d!37635 (= (getValueByKey!166 lt!64625 (_1!1295 (tuple2!2569 lt!64174 (minValue!2629 newMap!16)))) (Some!171 (_2!1295 (tuple2!2569 lt!64174 (minValue!2629 newMap!16)))))))

(assert (=> d!37635 (= lt!64626 (lemmaContainsTupThenGetReturnValue!81 lt!64625 (_1!1295 (tuple2!2569 lt!64174 (minValue!2629 newMap!16))) (_2!1295 (tuple2!2569 lt!64174 (minValue!2629 newMap!16)))))))

(assert (=> d!37635 (= lt!64625 (insertStrictlySorted!84 (toList!854 lt!64191) (_1!1295 (tuple2!2569 lt!64174 (minValue!2629 newMap!16))) (_2!1295 (tuple2!2569 lt!64174 (minValue!2629 newMap!16)))))))

(assert (=> d!37635 (= (+!169 lt!64191 (tuple2!2569 lt!64174 (minValue!2629 newMap!16))) lt!64624)))

(declare-fun b!125389 () Bool)

(declare-fun res!60721 () Bool)

(assert (=> b!125389 (=> (not res!60721) (not e!81917))))

(assert (=> b!125389 (= res!60721 (= (getValueByKey!166 (toList!854 lt!64624) (_1!1295 (tuple2!2569 lt!64174 (minValue!2629 newMap!16)))) (Some!171 (_2!1295 (tuple2!2569 lt!64174 (minValue!2629 newMap!16))))))))

(declare-fun b!125390 () Bool)

(assert (=> b!125390 (= e!81917 (contains!874 (toList!854 lt!64624) (tuple2!2569 lt!64174 (minValue!2629 newMap!16))))))

(assert (= (and d!37635 res!60720) b!125389))

(assert (= (and b!125389 res!60721) b!125390))

(declare-fun m!145799 () Bool)

(assert (=> d!37635 m!145799))

(declare-fun m!145801 () Bool)

(assert (=> d!37635 m!145801))

(declare-fun m!145803 () Bool)

(assert (=> d!37635 m!145803))

(declare-fun m!145805 () Bool)

(assert (=> d!37635 m!145805))

(declare-fun m!145807 () Bool)

(assert (=> b!125389 m!145807))

(declare-fun m!145809 () Bool)

(assert (=> b!125390 m!145809))

(assert (=> b!124785 d!37635))

(declare-fun d!37637 () Bool)

(assert (=> d!37637 (= (apply!110 (+!169 lt!64179 (tuple2!2569 lt!64176 (minValue!2629 newMap!16))) lt!64177) (get!1439 (getValueByKey!166 (toList!854 (+!169 lt!64179 (tuple2!2569 lt!64176 (minValue!2629 newMap!16)))) lt!64177)))))

(declare-fun bs!5184 () Bool)

(assert (= bs!5184 d!37637))

(declare-fun m!145811 () Bool)

(assert (=> bs!5184 m!145811))

(assert (=> bs!5184 m!145811))

(declare-fun m!145813 () Bool)

(assert (=> bs!5184 m!145813))

(assert (=> b!124785 d!37637))

(declare-fun d!37639 () Bool)

(assert (=> d!37639 (= (apply!110 (+!169 lt!64182 (tuple2!2569 lt!64192 (zeroValue!2629 newMap!16))) lt!64180) (get!1439 (getValueByKey!166 (toList!854 (+!169 lt!64182 (tuple2!2569 lt!64192 (zeroValue!2629 newMap!16)))) lt!64180)))))

(declare-fun bs!5185 () Bool)

(assert (= bs!5185 d!37639))

(declare-fun m!145815 () Bool)

(assert (=> bs!5185 m!145815))

(assert (=> bs!5185 m!145815))

(declare-fun m!145817 () Bool)

(assert (=> bs!5185 m!145817))

(assert (=> b!124785 d!37639))

(declare-fun d!37641 () Bool)

(assert (=> d!37641 (= (apply!110 (+!169 lt!64191 (tuple2!2569 lt!64174 (minValue!2629 newMap!16))) lt!64186) (get!1439 (getValueByKey!166 (toList!854 (+!169 lt!64191 (tuple2!2569 lt!64174 (minValue!2629 newMap!16)))) lt!64186)))))

(declare-fun bs!5186 () Bool)

(assert (= bs!5186 d!37641))

(declare-fun m!145819 () Bool)

(assert (=> bs!5186 m!145819))

(assert (=> bs!5186 m!145819))

(declare-fun m!145821 () Bool)

(assert (=> bs!5186 m!145821))

(assert (=> b!124785 d!37641))

(declare-fun d!37643 () Bool)

(declare-fun e!81918 () Bool)

(assert (=> d!37643 e!81918))

(declare-fun res!60722 () Bool)

(assert (=> d!37643 (=> (not res!60722) (not e!81918))))

(declare-fun lt!64628 () ListLongMap!1677)

(assert (=> d!37643 (= res!60722 (contains!873 lt!64628 (_1!1295 (tuple2!2569 lt!64178 (zeroValue!2629 newMap!16)))))))

(declare-fun lt!64629 () List!1695)

(assert (=> d!37643 (= lt!64628 (ListLongMap!1678 lt!64629))))

(declare-fun lt!64631 () Unit!3867)

(declare-fun lt!64630 () Unit!3867)

(assert (=> d!37643 (= lt!64631 lt!64630)))

(assert (=> d!37643 (= (getValueByKey!166 lt!64629 (_1!1295 (tuple2!2569 lt!64178 (zeroValue!2629 newMap!16)))) (Some!171 (_2!1295 (tuple2!2569 lt!64178 (zeroValue!2629 newMap!16)))))))

(assert (=> d!37643 (= lt!64630 (lemmaContainsTupThenGetReturnValue!81 lt!64629 (_1!1295 (tuple2!2569 lt!64178 (zeroValue!2629 newMap!16))) (_2!1295 (tuple2!2569 lt!64178 (zeroValue!2629 newMap!16)))))))

(assert (=> d!37643 (= lt!64629 (insertStrictlySorted!84 (toList!854 lt!64172) (_1!1295 (tuple2!2569 lt!64178 (zeroValue!2629 newMap!16))) (_2!1295 (tuple2!2569 lt!64178 (zeroValue!2629 newMap!16)))))))

(assert (=> d!37643 (= (+!169 lt!64172 (tuple2!2569 lt!64178 (zeroValue!2629 newMap!16))) lt!64628)))

(declare-fun b!125391 () Bool)

(declare-fun res!60723 () Bool)

(assert (=> b!125391 (=> (not res!60723) (not e!81918))))

(assert (=> b!125391 (= res!60723 (= (getValueByKey!166 (toList!854 lt!64628) (_1!1295 (tuple2!2569 lt!64178 (zeroValue!2629 newMap!16)))) (Some!171 (_2!1295 (tuple2!2569 lt!64178 (zeroValue!2629 newMap!16))))))))

(declare-fun b!125392 () Bool)

(assert (=> b!125392 (= e!81918 (contains!874 (toList!854 lt!64628) (tuple2!2569 lt!64178 (zeroValue!2629 newMap!16))))))

(assert (= (and d!37643 res!60722) b!125391))

(assert (= (and b!125391 res!60723) b!125392))

(declare-fun m!145823 () Bool)

(assert (=> d!37643 m!145823))

(declare-fun m!145825 () Bool)

(assert (=> d!37643 m!145825))

(declare-fun m!145827 () Bool)

(assert (=> d!37643 m!145827))

(declare-fun m!145829 () Bool)

(assert (=> d!37643 m!145829))

(declare-fun m!145831 () Bool)

(assert (=> b!125391 m!145831))

(declare-fun m!145833 () Bool)

(assert (=> b!125392 m!145833))

(assert (=> b!124785 d!37643))

(declare-fun d!37645 () Bool)

(assert (=> d!37645 (= (apply!110 (+!169 lt!64191 (tuple2!2569 lt!64174 (minValue!2629 newMap!16))) lt!64186) (apply!110 lt!64191 lt!64186))))

(declare-fun lt!64632 () Unit!3867)

(assert (=> d!37645 (= lt!64632 (choose!754 lt!64191 lt!64174 (minValue!2629 newMap!16) lt!64186))))

(declare-fun e!81919 () Bool)

(assert (=> d!37645 e!81919))

(declare-fun res!60724 () Bool)

(assert (=> d!37645 (=> (not res!60724) (not e!81919))))

(assert (=> d!37645 (= res!60724 (contains!873 lt!64191 lt!64186))))

(assert (=> d!37645 (= (addApplyDifferent!86 lt!64191 lt!64174 (minValue!2629 newMap!16) lt!64186) lt!64632)))

(declare-fun b!125393 () Bool)

(assert (=> b!125393 (= e!81919 (not (= lt!64186 lt!64174)))))

(assert (= (and d!37645 res!60724) b!125393))

(assert (=> d!37645 m!144739))

(declare-fun m!145835 () Bool)

(assert (=> d!37645 m!145835))

(assert (=> d!37645 m!144735))

(assert (=> d!37645 m!144739))

(assert (=> d!37645 m!144741))

(declare-fun m!145837 () Bool)

(assert (=> d!37645 m!145837))

(assert (=> b!124785 d!37645))

(declare-fun d!37647 () Bool)

(assert (=> d!37647 (= (apply!110 lt!64179 lt!64177) (get!1439 (getValueByKey!166 (toList!854 lt!64179) lt!64177)))))

(declare-fun bs!5187 () Bool)

(assert (= bs!5187 d!37647))

(declare-fun m!145839 () Bool)

(assert (=> bs!5187 m!145839))

(assert (=> bs!5187 m!145839))

(declare-fun m!145841 () Bool)

(assert (=> bs!5187 m!145841))

(assert (=> b!124785 d!37647))

(declare-fun d!37649 () Bool)

(assert (=> d!37649 (= (apply!110 lt!64182 lt!64180) (get!1439 (getValueByKey!166 (toList!854 lt!64182) lt!64180)))))

(declare-fun bs!5188 () Bool)

(assert (= bs!5188 d!37649))

(declare-fun m!145843 () Bool)

(assert (=> bs!5188 m!145843))

(assert (=> bs!5188 m!145843))

(declare-fun m!145845 () Bool)

(assert (=> bs!5188 m!145845))

(assert (=> b!124785 d!37649))

(declare-fun d!37651 () Bool)

(declare-fun e!81920 () Bool)

(assert (=> d!37651 e!81920))

(declare-fun res!60725 () Bool)

(assert (=> d!37651 (=> res!60725 e!81920)))

(declare-fun lt!64635 () Bool)

(assert (=> d!37651 (= res!60725 (not lt!64635))))

(declare-fun lt!64636 () Bool)

(assert (=> d!37651 (= lt!64635 lt!64636)))

(declare-fun lt!64633 () Unit!3867)

(declare-fun e!81921 () Unit!3867)

(assert (=> d!37651 (= lt!64633 e!81921)))

(declare-fun c!22852 () Bool)

(assert (=> d!37651 (= c!22852 lt!64636)))

(assert (=> d!37651 (= lt!64636 (containsKey!170 (toList!854 (+!169 lt!64172 (tuple2!2569 lt!64178 (zeroValue!2629 newMap!16)))) lt!64188))))

(assert (=> d!37651 (= (contains!873 (+!169 lt!64172 (tuple2!2569 lt!64178 (zeroValue!2629 newMap!16))) lt!64188) lt!64635)))

(declare-fun b!125394 () Bool)

(declare-fun lt!64634 () Unit!3867)

(assert (=> b!125394 (= e!81921 lt!64634)))

(assert (=> b!125394 (= lt!64634 (lemmaContainsKeyImpliesGetValueByKeyDefined!118 (toList!854 (+!169 lt!64172 (tuple2!2569 lt!64178 (zeroValue!2629 newMap!16)))) lt!64188))))

(assert (=> b!125394 (isDefined!119 (getValueByKey!166 (toList!854 (+!169 lt!64172 (tuple2!2569 lt!64178 (zeroValue!2629 newMap!16)))) lt!64188))))

(declare-fun b!125395 () Bool)

(declare-fun Unit!3900 () Unit!3867)

(assert (=> b!125395 (= e!81921 Unit!3900)))

(declare-fun b!125396 () Bool)

(assert (=> b!125396 (= e!81920 (isDefined!119 (getValueByKey!166 (toList!854 (+!169 lt!64172 (tuple2!2569 lt!64178 (zeroValue!2629 newMap!16)))) lt!64188)))))

(assert (= (and d!37651 c!22852) b!125394))

(assert (= (and d!37651 (not c!22852)) b!125395))

(assert (= (and d!37651 (not res!60725)) b!125396))

(declare-fun m!145847 () Bool)

(assert (=> d!37651 m!145847))

(declare-fun m!145849 () Bool)

(assert (=> b!125394 m!145849))

(declare-fun m!145851 () Bool)

(assert (=> b!125394 m!145851))

(assert (=> b!125394 m!145851))

(declare-fun m!145853 () Bool)

(assert (=> b!125394 m!145853))

(assert (=> b!125396 m!145851))

(assert (=> b!125396 m!145851))

(assert (=> b!125396 m!145853))

(assert (=> b!124785 d!37651))

(declare-fun d!37653 () Bool)

(declare-fun e!81922 () Bool)

(assert (=> d!37653 e!81922))

(declare-fun res!60726 () Bool)

(assert (=> d!37653 (=> (not res!60726) (not e!81922))))

(declare-fun lt!64637 () ListLongMap!1677)

(assert (=> d!37653 (= res!60726 (contains!873 lt!64637 (_1!1295 (tuple2!2569 lt!64176 (minValue!2629 newMap!16)))))))

(declare-fun lt!64638 () List!1695)

(assert (=> d!37653 (= lt!64637 (ListLongMap!1678 lt!64638))))

(declare-fun lt!64640 () Unit!3867)

(declare-fun lt!64639 () Unit!3867)

(assert (=> d!37653 (= lt!64640 lt!64639)))

(assert (=> d!37653 (= (getValueByKey!166 lt!64638 (_1!1295 (tuple2!2569 lt!64176 (minValue!2629 newMap!16)))) (Some!171 (_2!1295 (tuple2!2569 lt!64176 (minValue!2629 newMap!16)))))))

(assert (=> d!37653 (= lt!64639 (lemmaContainsTupThenGetReturnValue!81 lt!64638 (_1!1295 (tuple2!2569 lt!64176 (minValue!2629 newMap!16))) (_2!1295 (tuple2!2569 lt!64176 (minValue!2629 newMap!16)))))))

(assert (=> d!37653 (= lt!64638 (insertStrictlySorted!84 (toList!854 lt!64179) (_1!1295 (tuple2!2569 lt!64176 (minValue!2629 newMap!16))) (_2!1295 (tuple2!2569 lt!64176 (minValue!2629 newMap!16)))))))

(assert (=> d!37653 (= (+!169 lt!64179 (tuple2!2569 lt!64176 (minValue!2629 newMap!16))) lt!64637)))

(declare-fun b!125397 () Bool)

(declare-fun res!60727 () Bool)

(assert (=> b!125397 (=> (not res!60727) (not e!81922))))

(assert (=> b!125397 (= res!60727 (= (getValueByKey!166 (toList!854 lt!64637) (_1!1295 (tuple2!2569 lt!64176 (minValue!2629 newMap!16)))) (Some!171 (_2!1295 (tuple2!2569 lt!64176 (minValue!2629 newMap!16))))))))

(declare-fun b!125398 () Bool)

(assert (=> b!125398 (= e!81922 (contains!874 (toList!854 lt!64637) (tuple2!2569 lt!64176 (minValue!2629 newMap!16))))))

(assert (= (and d!37653 res!60726) b!125397))

(assert (= (and b!125397 res!60727) b!125398))

(declare-fun m!145855 () Bool)

(assert (=> d!37653 m!145855))

(declare-fun m!145857 () Bool)

(assert (=> d!37653 m!145857))

(declare-fun m!145859 () Bool)

(assert (=> d!37653 m!145859))

(declare-fun m!145861 () Bool)

(assert (=> d!37653 m!145861))

(declare-fun m!145863 () Bool)

(assert (=> b!125397 m!145863))

(declare-fun m!145865 () Bool)

(assert (=> b!125398 m!145865))

(assert (=> b!124785 d!37653))

(declare-fun d!37655 () Bool)

(assert (=> d!37655 (= (apply!110 (+!169 lt!64179 (tuple2!2569 lt!64176 (minValue!2629 newMap!16))) lt!64177) (apply!110 lt!64179 lt!64177))))

(declare-fun lt!64641 () Unit!3867)

(assert (=> d!37655 (= lt!64641 (choose!754 lt!64179 lt!64176 (minValue!2629 newMap!16) lt!64177))))

(declare-fun e!81923 () Bool)

(assert (=> d!37655 e!81923))

(declare-fun res!60728 () Bool)

(assert (=> d!37655 (=> (not res!60728) (not e!81923))))

(assert (=> d!37655 (= res!60728 (contains!873 lt!64179 lt!64177))))

(assert (=> d!37655 (= (addApplyDifferent!86 lt!64179 lt!64176 (minValue!2629 newMap!16) lt!64177) lt!64641)))

(declare-fun b!125399 () Bool)

(assert (=> b!125399 (= e!81923 (not (= lt!64177 lt!64176)))))

(assert (= (and d!37655 res!60728) b!125399))

(assert (=> d!37655 m!144729))

(declare-fun m!145867 () Bool)

(assert (=> d!37655 m!145867))

(assert (=> d!37655 m!144727))

(assert (=> d!37655 m!144729))

(assert (=> d!37655 m!144731))

(declare-fun m!145869 () Bool)

(assert (=> d!37655 m!145869))

(assert (=> b!124785 d!37655))

(declare-fun d!37657 () Bool)

(declare-fun e!81924 () Bool)

(assert (=> d!37657 e!81924))

(declare-fun res!60729 () Bool)

(assert (=> d!37657 (=> (not res!60729) (not e!81924))))

(declare-fun lt!64642 () ListLongMap!1677)

(assert (=> d!37657 (= res!60729 (contains!873 lt!64642 (_1!1295 (tuple2!2569 lt!64192 (zeroValue!2629 newMap!16)))))))

(declare-fun lt!64643 () List!1695)

(assert (=> d!37657 (= lt!64642 (ListLongMap!1678 lt!64643))))

(declare-fun lt!64645 () Unit!3867)

(declare-fun lt!64644 () Unit!3867)

(assert (=> d!37657 (= lt!64645 lt!64644)))

(assert (=> d!37657 (= (getValueByKey!166 lt!64643 (_1!1295 (tuple2!2569 lt!64192 (zeroValue!2629 newMap!16)))) (Some!171 (_2!1295 (tuple2!2569 lt!64192 (zeroValue!2629 newMap!16)))))))

(assert (=> d!37657 (= lt!64644 (lemmaContainsTupThenGetReturnValue!81 lt!64643 (_1!1295 (tuple2!2569 lt!64192 (zeroValue!2629 newMap!16))) (_2!1295 (tuple2!2569 lt!64192 (zeroValue!2629 newMap!16)))))))

(assert (=> d!37657 (= lt!64643 (insertStrictlySorted!84 (toList!854 lt!64182) (_1!1295 (tuple2!2569 lt!64192 (zeroValue!2629 newMap!16))) (_2!1295 (tuple2!2569 lt!64192 (zeroValue!2629 newMap!16)))))))

(assert (=> d!37657 (= (+!169 lt!64182 (tuple2!2569 lt!64192 (zeroValue!2629 newMap!16))) lt!64642)))

(declare-fun b!125400 () Bool)

(declare-fun res!60730 () Bool)

(assert (=> b!125400 (=> (not res!60730) (not e!81924))))

(assert (=> b!125400 (= res!60730 (= (getValueByKey!166 (toList!854 lt!64642) (_1!1295 (tuple2!2569 lt!64192 (zeroValue!2629 newMap!16)))) (Some!171 (_2!1295 (tuple2!2569 lt!64192 (zeroValue!2629 newMap!16))))))))

(declare-fun b!125401 () Bool)

(assert (=> b!125401 (= e!81924 (contains!874 (toList!854 lt!64642) (tuple2!2569 lt!64192 (zeroValue!2629 newMap!16))))))

(assert (= (and d!37657 res!60729) b!125400))

(assert (= (and b!125400 res!60730) b!125401))

(declare-fun m!145871 () Bool)

(assert (=> d!37657 m!145871))

(declare-fun m!145873 () Bool)

(assert (=> d!37657 m!145873))

(declare-fun m!145875 () Bool)

(assert (=> d!37657 m!145875))

(declare-fun m!145877 () Bool)

(assert (=> d!37657 m!145877))

(declare-fun m!145879 () Bool)

(assert (=> b!125400 m!145879))

(declare-fun m!145881 () Bool)

(assert (=> b!125401 m!145881))

(assert (=> b!124785 d!37657))

(assert (=> b!124785 d!37429))

(declare-fun d!37659 () Bool)

(assert (=> d!37659 (= (apply!110 lt!64406 #b0000000000000000000000000000000000000000000000000000000000000000) (get!1439 (getValueByKey!166 (toList!854 lt!64406) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!5189 () Bool)

(assert (= bs!5189 d!37659))

(declare-fun m!145883 () Bool)

(assert (=> bs!5189 m!145883))

(assert (=> bs!5189 m!145883))

(declare-fun m!145885 () Bool)

(assert (=> bs!5189 m!145885))

(assert (=> b!124986 d!37659))

(declare-fun c!22853 () Bool)

(declare-fun d!37661 () Bool)

(assert (=> d!37661 (= c!22853 (and ((_ is Cons!1691) (toList!854 lt!64362)) (= (_1!1295 (h!2292 (toList!854 lt!64362))) (_1!1295 (tuple2!2569 lt!64001 (minValue!2629 (v!3108 (underlying!436 thiss!992))))))))))

(declare-fun e!81925 () Option!172)

(assert (=> d!37661 (= (getValueByKey!166 (toList!854 lt!64362) (_1!1295 (tuple2!2569 lt!64001 (minValue!2629 (v!3108 (underlying!436 thiss!992)))))) e!81925)))

(declare-fun b!125402 () Bool)

(assert (=> b!125402 (= e!81925 (Some!171 (_2!1295 (h!2292 (toList!854 lt!64362)))))))

(declare-fun e!81926 () Option!172)

(declare-fun b!125404 () Bool)

(assert (=> b!125404 (= e!81926 (getValueByKey!166 (t!6022 (toList!854 lt!64362)) (_1!1295 (tuple2!2569 lt!64001 (minValue!2629 (v!3108 (underlying!436 thiss!992)))))))))

(declare-fun b!125405 () Bool)

(assert (=> b!125405 (= e!81926 None!170)))

(declare-fun b!125403 () Bool)

(assert (=> b!125403 (= e!81925 e!81926)))

(declare-fun c!22854 () Bool)

(assert (=> b!125403 (= c!22854 (and ((_ is Cons!1691) (toList!854 lt!64362)) (not (= (_1!1295 (h!2292 (toList!854 lt!64362))) (_1!1295 (tuple2!2569 lt!64001 (minValue!2629 (v!3108 (underlying!436 thiss!992)))))))))))

(assert (= (and d!37661 c!22853) b!125402))

(assert (= (and d!37661 (not c!22853)) b!125403))

(assert (= (and b!125403 c!22854) b!125404))

(assert (= (and b!125403 (not c!22854)) b!125405))

(declare-fun m!145887 () Bool)

(assert (=> b!125404 m!145887))

(assert (=> b!124955 d!37661))

(declare-fun d!37663 () Bool)

(declare-fun isEmpty!395 (List!1695) Bool)

(assert (=> d!37663 (= (isEmpty!394 lt!64216) (isEmpty!395 (toList!854 lt!64216)))))

(declare-fun bs!5190 () Bool)

(assert (= bs!5190 d!37663))

(declare-fun m!145889 () Bool)

(assert (=> bs!5190 m!145889))

(assert (=> b!124845 d!37663))

(declare-fun d!37665 () Bool)

(assert (=> d!37665 (isDefined!119 (getValueByKey!166 (toList!854 (getCurrentListMap!535 (_keys!4493 newMap!16) (_values!2747 newMap!16) (mask!7010 newMap!16) (extraKeys!2549 newMap!16) (zeroValue!2629 newMap!16) (minValue!2629 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2764 newMap!16))) (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355)))))

(declare-fun lt!64646 () Unit!3867)

(assert (=> d!37665 (= lt!64646 (choose!748 (toList!854 (getCurrentListMap!535 (_keys!4493 newMap!16) (_values!2747 newMap!16) (mask!7010 newMap!16) (extraKeys!2549 newMap!16) (zeroValue!2629 newMap!16) (minValue!2629 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2764 newMap!16))) (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355)))))

(declare-fun e!81927 () Bool)

(assert (=> d!37665 e!81927))

(declare-fun res!60731 () Bool)

(assert (=> d!37665 (=> (not res!60731) (not e!81927))))

(assert (=> d!37665 (= res!60731 (isStrictlySorted!316 (toList!854 (getCurrentListMap!535 (_keys!4493 newMap!16) (_values!2747 newMap!16) (mask!7010 newMap!16) (extraKeys!2549 newMap!16) (zeroValue!2629 newMap!16) (minValue!2629 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2764 newMap!16)))))))

(assert (=> d!37665 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!118 (toList!854 (getCurrentListMap!535 (_keys!4493 newMap!16) (_values!2747 newMap!16) (mask!7010 newMap!16) (extraKeys!2549 newMap!16) (zeroValue!2629 newMap!16) (minValue!2629 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2764 newMap!16))) (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355)) lt!64646)))

(declare-fun b!125406 () Bool)

(assert (=> b!125406 (= e!81927 (containsKey!170 (toList!854 (getCurrentListMap!535 (_keys!4493 newMap!16) (_values!2747 newMap!16) (mask!7010 newMap!16) (extraKeys!2549 newMap!16) (zeroValue!2629 newMap!16) (minValue!2629 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2764 newMap!16))) (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355)))))

(assert (= (and d!37665 res!60731) b!125406))

(assert (=> d!37665 m!144415))

(assert (=> d!37665 m!144715))

(assert (=> d!37665 m!144715))

(assert (=> d!37665 m!144717))

(assert (=> d!37665 m!144415))

(declare-fun m!145891 () Bool)

(assert (=> d!37665 m!145891))

(declare-fun m!145893 () Bool)

(assert (=> d!37665 m!145893))

(assert (=> b!125406 m!144415))

(assert (=> b!125406 m!144711))

(assert (=> b!124772 d!37665))

(declare-fun d!37667 () Bool)

(assert (=> d!37667 (= (isDefined!119 (getValueByKey!166 (toList!854 (getCurrentListMap!535 (_keys!4493 newMap!16) (_values!2747 newMap!16) (mask!7010 newMap!16) (extraKeys!2549 newMap!16) (zeroValue!2629 newMap!16) (minValue!2629 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2764 newMap!16))) (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355))) (not (isEmpty!393 (getValueByKey!166 (toList!854 (getCurrentListMap!535 (_keys!4493 newMap!16) (_values!2747 newMap!16) (mask!7010 newMap!16) (extraKeys!2549 newMap!16) (zeroValue!2629 newMap!16) (minValue!2629 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2764 newMap!16))) (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355)))))))

(declare-fun bs!5191 () Bool)

(assert (= bs!5191 d!37667))

(assert (=> bs!5191 m!144715))

(declare-fun m!145895 () Bool)

(assert (=> bs!5191 m!145895))

(assert (=> b!124772 d!37667))

(declare-fun c!22855 () Bool)

(declare-fun d!37669 () Bool)

(assert (=> d!37669 (= c!22855 (and ((_ is Cons!1691) (toList!854 (getCurrentListMap!535 (_keys!4493 newMap!16) (_values!2747 newMap!16) (mask!7010 newMap!16) (extraKeys!2549 newMap!16) (zeroValue!2629 newMap!16) (minValue!2629 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2764 newMap!16)))) (= (_1!1295 (h!2292 (toList!854 (getCurrentListMap!535 (_keys!4493 newMap!16) (_values!2747 newMap!16) (mask!7010 newMap!16) (extraKeys!2549 newMap!16) (zeroValue!2629 newMap!16) (minValue!2629 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2764 newMap!16))))) (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355))))))

(declare-fun e!81928 () Option!172)

(assert (=> d!37669 (= (getValueByKey!166 (toList!854 (getCurrentListMap!535 (_keys!4493 newMap!16) (_values!2747 newMap!16) (mask!7010 newMap!16) (extraKeys!2549 newMap!16) (zeroValue!2629 newMap!16) (minValue!2629 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2764 newMap!16))) (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355)) e!81928)))

(declare-fun b!125407 () Bool)

(assert (=> b!125407 (= e!81928 (Some!171 (_2!1295 (h!2292 (toList!854 (getCurrentListMap!535 (_keys!4493 newMap!16) (_values!2747 newMap!16) (mask!7010 newMap!16) (extraKeys!2549 newMap!16) (zeroValue!2629 newMap!16) (minValue!2629 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2764 newMap!16)))))))))

(declare-fun e!81929 () Option!172)

(declare-fun b!125409 () Bool)

(assert (=> b!125409 (= e!81929 (getValueByKey!166 (t!6022 (toList!854 (getCurrentListMap!535 (_keys!4493 newMap!16) (_values!2747 newMap!16) (mask!7010 newMap!16) (extraKeys!2549 newMap!16) (zeroValue!2629 newMap!16) (minValue!2629 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2764 newMap!16)))) (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355)))))

(declare-fun b!125410 () Bool)

(assert (=> b!125410 (= e!81929 None!170)))

(declare-fun b!125408 () Bool)

(assert (=> b!125408 (= e!81928 e!81929)))

(declare-fun c!22856 () Bool)

(assert (=> b!125408 (= c!22856 (and ((_ is Cons!1691) (toList!854 (getCurrentListMap!535 (_keys!4493 newMap!16) (_values!2747 newMap!16) (mask!7010 newMap!16) (extraKeys!2549 newMap!16) (zeroValue!2629 newMap!16) (minValue!2629 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2764 newMap!16)))) (not (= (_1!1295 (h!2292 (toList!854 (getCurrentListMap!535 (_keys!4493 newMap!16) (_values!2747 newMap!16) (mask!7010 newMap!16) (extraKeys!2549 newMap!16) (zeroValue!2629 newMap!16) (minValue!2629 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2764 newMap!16))))) (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355)))))))

(assert (= (and d!37669 c!22855) b!125407))

(assert (= (and d!37669 (not c!22855)) b!125408))

(assert (= (and b!125408 c!22856) b!125409))

(assert (= (and b!125408 (not c!22856)) b!125410))

(assert (=> b!125409 m!144415))

(declare-fun m!145897 () Bool)

(assert (=> b!125409 m!145897))

(assert (=> b!124772 d!37669))

(declare-fun d!37671 () Bool)

(declare-fun lt!64647 () Bool)

(assert (=> d!37671 (= lt!64647 (select (content!123 (toList!854 lt!64376)) (tuple2!2569 lt!64017 (zeroValue!2629 (v!3108 (underlying!436 thiss!992))))))))

(declare-fun e!81931 () Bool)

(assert (=> d!37671 (= lt!64647 e!81931)))

(declare-fun res!60732 () Bool)

(assert (=> d!37671 (=> (not res!60732) (not e!81931))))

(assert (=> d!37671 (= res!60732 ((_ is Cons!1691) (toList!854 lt!64376)))))

(assert (=> d!37671 (= (contains!874 (toList!854 lt!64376) (tuple2!2569 lt!64017 (zeroValue!2629 (v!3108 (underlying!436 thiss!992))))) lt!64647)))

(declare-fun b!125411 () Bool)

(declare-fun e!81930 () Bool)

(assert (=> b!125411 (= e!81931 e!81930)))

(declare-fun res!60733 () Bool)

(assert (=> b!125411 (=> res!60733 e!81930)))

(assert (=> b!125411 (= res!60733 (= (h!2292 (toList!854 lt!64376)) (tuple2!2569 lt!64017 (zeroValue!2629 (v!3108 (underlying!436 thiss!992))))))))

(declare-fun b!125412 () Bool)

(assert (=> b!125412 (= e!81930 (contains!874 (t!6022 (toList!854 lt!64376)) (tuple2!2569 lt!64017 (zeroValue!2629 (v!3108 (underlying!436 thiss!992))))))))

(assert (= (and d!37671 res!60732) b!125411))

(assert (= (and b!125411 (not res!60733)) b!125412))

(declare-fun m!145899 () Bool)

(assert (=> d!37671 m!145899))

(declare-fun m!145901 () Bool)

(assert (=> d!37671 m!145901))

(declare-fun m!145903 () Bool)

(assert (=> b!125412 m!145903))

(assert (=> b!124965 d!37671))

(declare-fun d!37673 () Bool)

(declare-fun e!81932 () Bool)

(assert (=> d!37673 e!81932))

(declare-fun res!60734 () Bool)

(assert (=> d!37673 (=> (not res!60734) (not e!81932))))

(declare-fun lt!64648 () ListLongMap!1677)

(assert (=> d!37673 (= res!60734 (contains!873 lt!64648 (_1!1295 (tuple2!2569 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!64649 () List!1695)

(assert (=> d!37673 (= lt!64648 (ListLongMap!1678 lt!64649))))

(declare-fun lt!64651 () Unit!3867)

(declare-fun lt!64650 () Unit!3867)

(assert (=> d!37673 (= lt!64651 lt!64650)))

(assert (=> d!37673 (= (getValueByKey!166 lt!64649 (_1!1295 (tuple2!2569 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!171 (_2!1295 (tuple2!2569 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!37673 (= lt!64650 (lemmaContainsTupThenGetReturnValue!81 lt!64649 (_1!1295 (tuple2!2569 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1295 (tuple2!2569 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!37673 (= lt!64649 (insertStrictlySorted!84 (toList!854 (getCurrentListMap!535 (_keys!4493 newMap!16) (_values!2747 newMap!16) (mask!7010 newMap!16) (extraKeys!2549 newMap!16) (zeroValue!2629 newMap!16) (minValue!2629 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2764 newMap!16))) (_1!1295 (tuple2!2569 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1295 (tuple2!2569 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!37673 (= (+!169 (getCurrentListMap!535 (_keys!4493 newMap!16) (_values!2747 newMap!16) (mask!7010 newMap!16) (extraKeys!2549 newMap!16) (zeroValue!2629 newMap!16) (minValue!2629 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2764 newMap!16)) (tuple2!2569 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!64648)))

(declare-fun b!125413 () Bool)

(declare-fun res!60735 () Bool)

(assert (=> b!125413 (=> (not res!60735) (not e!81932))))

(assert (=> b!125413 (= res!60735 (= (getValueByKey!166 (toList!854 lt!64648) (_1!1295 (tuple2!2569 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!171 (_2!1295 (tuple2!2569 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!125414 () Bool)

(assert (=> b!125414 (= e!81932 (contains!874 (toList!854 lt!64648) (tuple2!2569 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!37673 res!60734) b!125413))

(assert (= (and b!125413 res!60735) b!125414))

(declare-fun m!145905 () Bool)

(assert (=> d!37673 m!145905))

(declare-fun m!145907 () Bool)

(assert (=> d!37673 m!145907))

(declare-fun m!145909 () Bool)

(assert (=> d!37673 m!145909))

(declare-fun m!145911 () Bool)

(assert (=> d!37673 m!145911))

(declare-fun m!145913 () Bool)

(assert (=> b!125413 m!145913))

(declare-fun m!145915 () Bool)

(assert (=> b!125414 m!145915))

(assert (=> d!37379 d!37673))

(assert (=> d!37379 d!37435))

(declare-fun d!37675 () Bool)

(assert (=> d!37675 (= (+!169 (getCurrentListMap!535 (_keys!4493 newMap!16) (_values!2747 newMap!16) (mask!7010 newMap!16) (extraKeys!2549 newMap!16) (zeroValue!2629 newMap!16) (minValue!2629 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2764 newMap!16)) (tuple2!2569 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (getCurrentListMap!535 (_keys!4493 newMap!16) (_values!2747 newMap!16) (mask!7010 newMap!16) lt!64087 (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2629 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2764 newMap!16)))))

(assert (=> d!37675 true))

(declare-fun _$7!104 () Unit!3867)

(assert (=> d!37675 (= (choose!753 (_keys!4493 newMap!16) (_values!2747 newMap!16) (mask!7010 newMap!16) (extraKeys!2549 newMap!16) lt!64087 (zeroValue!2629 newMap!16) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2629 newMap!16) (defaultEntry!2764 newMap!16)) _$7!104)))

(declare-fun bs!5192 () Bool)

(assert (= bs!5192 d!37675))

(assert (=> bs!5192 m!144491))

(assert (=> bs!5192 m!144491))

(assert (=> bs!5192 m!144985))

(assert (=> bs!5192 m!144425))

(assert (=> bs!5192 m!144987))

(assert (=> d!37379 d!37675))

(declare-fun call!13435 () ListLongMap!1677)

(declare-fun bm!13432 () Bool)

(assert (=> bm!13432 (= call!13435 (getCurrentListMapNoExtraKeys!135 (_keys!4493 newMap!16) (_values!2747 newMap!16) (mask!7010 newMap!16) lt!64087 (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2629 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2764 newMap!16)))))

(declare-fun call!13437 () ListLongMap!1677)

(declare-fun c!22862 () Bool)

(declare-fun bm!13433 () Bool)

(declare-fun call!13436 () ListLongMap!1677)

(declare-fun c!22860 () Bool)

(declare-fun call!13441 () ListLongMap!1677)

(assert (=> bm!13433 (= call!13441 (+!169 (ite c!22862 call!13435 (ite c!22860 call!13437 call!13436)) (ite (or c!22862 c!22860) (tuple2!2569 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2629 newMap!16)))))))

(declare-fun bm!13434 () Bool)

(assert (=> bm!13434 (= call!13437 call!13435)))

(declare-fun b!125416 () Bool)

(declare-fun e!81936 () ListLongMap!1677)

(declare-fun call!13440 () ListLongMap!1677)

(assert (=> b!125416 (= e!81936 call!13440)))

(declare-fun b!125417 () Bool)

(declare-fun e!81941 () ListLongMap!1677)

(assert (=> b!125417 (= e!81941 call!13436)))

(declare-fun b!125418 () Bool)

(declare-fun e!81943 () ListLongMap!1677)

(assert (=> b!125418 (= e!81943 e!81936)))

(assert (=> b!125418 (= c!22860 (and (not (= (bvand lt!64087 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand lt!64087 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!125419 () Bool)

(declare-fun e!81944 () Bool)

(declare-fun call!13439 () Bool)

(assert (=> b!125419 (= e!81944 (not call!13439))))

(declare-fun b!125420 () Bool)

(declare-fun e!81939 () Bool)

(declare-fun e!81942 () Bool)

(assert (=> b!125420 (= e!81939 e!81942)))

(declare-fun res!60744 () Bool)

(assert (=> b!125420 (=> (not res!60744) (not e!81942))))

(declare-fun lt!64667 () ListLongMap!1677)

(assert (=> b!125420 (= res!60744 (contains!873 lt!64667 (select (arr!2219 (_keys!4493 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!125420 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2482 (_keys!4493 newMap!16))))))

(declare-fun bm!13435 () Bool)

(assert (=> bm!13435 (= call!13436 call!13437)))

(declare-fun b!125421 () Bool)

(declare-fun e!81940 () Bool)

(declare-fun call!13438 () Bool)

(assert (=> b!125421 (= e!81940 (not call!13438))))

(declare-fun b!125422 () Bool)

(declare-fun e!81938 () Unit!3867)

(declare-fun Unit!3901 () Unit!3867)

(assert (=> b!125422 (= e!81938 Unit!3901)))

(declare-fun b!125423 () Bool)

(declare-fun e!81933 () Bool)

(assert (=> b!125423 (= e!81933 (validKeyInArray!0 (select (arr!2219 (_keys!4493 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!125424 () Bool)

(declare-fun e!81934 () Bool)

(assert (=> b!125424 (= e!81940 e!81934)))

(declare-fun res!60737 () Bool)

(assert (=> b!125424 (= res!60737 call!13438)))

(assert (=> b!125424 (=> (not res!60737) (not e!81934))))

(declare-fun b!125425 () Bool)

(declare-fun lt!64663 () Unit!3867)

(assert (=> b!125425 (= e!81938 lt!64663)))

(declare-fun lt!64652 () ListLongMap!1677)

(assert (=> b!125425 (= lt!64652 (getCurrentListMapNoExtraKeys!135 (_keys!4493 newMap!16) (_values!2747 newMap!16) (mask!7010 newMap!16) lt!64087 (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2629 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2764 newMap!16)))))

(declare-fun lt!64658 () (_ BitVec 64))

(assert (=> b!125425 (= lt!64658 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!64668 () (_ BitVec 64))

(assert (=> b!125425 (= lt!64668 (select (arr!2219 (_keys!4493 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!64653 () Unit!3867)

(assert (=> b!125425 (= lt!64653 (addStillContains!86 lt!64652 lt!64658 (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) lt!64668))))

(assert (=> b!125425 (contains!873 (+!169 lt!64652 (tuple2!2569 lt!64658 (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!64668)))

(declare-fun lt!64670 () Unit!3867)

(assert (=> b!125425 (= lt!64670 lt!64653)))

(declare-fun lt!64671 () ListLongMap!1677)

(assert (=> b!125425 (= lt!64671 (getCurrentListMapNoExtraKeys!135 (_keys!4493 newMap!16) (_values!2747 newMap!16) (mask!7010 newMap!16) lt!64087 (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2629 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2764 newMap!16)))))

(declare-fun lt!64654 () (_ BitVec 64))

(assert (=> b!125425 (= lt!64654 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!64666 () (_ BitVec 64))

(assert (=> b!125425 (= lt!64666 (select (arr!2219 (_keys!4493 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!64664 () Unit!3867)

(assert (=> b!125425 (= lt!64664 (addApplyDifferent!86 lt!64671 lt!64654 (minValue!2629 newMap!16) lt!64666))))

(assert (=> b!125425 (= (apply!110 (+!169 lt!64671 (tuple2!2569 lt!64654 (minValue!2629 newMap!16))) lt!64666) (apply!110 lt!64671 lt!64666))))

(declare-fun lt!64669 () Unit!3867)

(assert (=> b!125425 (= lt!64669 lt!64664)))

(declare-fun lt!64662 () ListLongMap!1677)

(assert (=> b!125425 (= lt!64662 (getCurrentListMapNoExtraKeys!135 (_keys!4493 newMap!16) (_values!2747 newMap!16) (mask!7010 newMap!16) lt!64087 (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2629 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2764 newMap!16)))))

(declare-fun lt!64672 () (_ BitVec 64))

(assert (=> b!125425 (= lt!64672 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!64660 () (_ BitVec 64))

(assert (=> b!125425 (= lt!64660 (select (arr!2219 (_keys!4493 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!64673 () Unit!3867)

(assert (=> b!125425 (= lt!64673 (addApplyDifferent!86 lt!64662 lt!64672 (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) lt!64660))))

(assert (=> b!125425 (= (apply!110 (+!169 lt!64662 (tuple2!2569 lt!64672 (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!64660) (apply!110 lt!64662 lt!64660))))

(declare-fun lt!64665 () Unit!3867)

(assert (=> b!125425 (= lt!64665 lt!64673)))

(declare-fun lt!64659 () ListLongMap!1677)

(assert (=> b!125425 (= lt!64659 (getCurrentListMapNoExtraKeys!135 (_keys!4493 newMap!16) (_values!2747 newMap!16) (mask!7010 newMap!16) lt!64087 (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2629 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2764 newMap!16)))))

(declare-fun lt!64656 () (_ BitVec 64))

(assert (=> b!125425 (= lt!64656 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!64657 () (_ BitVec 64))

(assert (=> b!125425 (= lt!64657 (select (arr!2219 (_keys!4493 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!125425 (= lt!64663 (addApplyDifferent!86 lt!64659 lt!64656 (minValue!2629 newMap!16) lt!64657))))

(assert (=> b!125425 (= (apply!110 (+!169 lt!64659 (tuple2!2569 lt!64656 (minValue!2629 newMap!16))) lt!64657) (apply!110 lt!64659 lt!64657))))

(declare-fun b!125426 () Bool)

(declare-fun res!60742 () Bool)

(declare-fun e!81937 () Bool)

(assert (=> b!125426 (=> (not res!60742) (not e!81937))))

(assert (=> b!125426 (= res!60742 e!81940)))

(declare-fun c!22858 () Bool)

(assert (=> b!125426 (= c!22858 (not (= (bvand lt!64087 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!125427 () Bool)

(declare-fun c!22861 () Bool)

(assert (=> b!125427 (= c!22861 (and (not (= (bvand lt!64087 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand lt!64087 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!125427 (= e!81936 e!81941)))

(declare-fun b!125428 () Bool)

(assert (=> b!125428 (= e!81934 (= (apply!110 lt!64667 #b0000000000000000000000000000000000000000000000000000000000000000) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bm!13436 () Bool)

(assert (=> bm!13436 (= call!13438 (contains!873 lt!64667 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!125429 () Bool)

(assert (=> b!125429 (= e!81943 (+!169 call!13441 (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2629 newMap!16))))))

(declare-fun b!125415 () Bool)

(assert (=> b!125415 (= e!81942 (= (apply!110 lt!64667 (select (arr!2219 (_keys!4493 newMap!16)) #b00000000000000000000000000000000)) (get!1436 (select (arr!2220 (_values!2747 newMap!16)) #b00000000000000000000000000000000) (dynLambda!411 (defaultEntry!2764 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!125415 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2483 (_values!2747 newMap!16))))))

(assert (=> b!125415 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2482 (_keys!4493 newMap!16))))))

(declare-fun d!37677 () Bool)

(assert (=> d!37677 e!81937))

(declare-fun res!60738 () Bool)

(assert (=> d!37677 (=> (not res!60738) (not e!81937))))

(assert (=> d!37677 (= res!60738 (or (bvsge #b00000000000000000000000000000000 (size!2482 (_keys!4493 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2482 (_keys!4493 newMap!16))))))))

(declare-fun lt!64655 () ListLongMap!1677)

(assert (=> d!37677 (= lt!64667 lt!64655)))

(declare-fun lt!64661 () Unit!3867)

(assert (=> d!37677 (= lt!64661 e!81938)))

(declare-fun c!22859 () Bool)

(declare-fun e!81935 () Bool)

(assert (=> d!37677 (= c!22859 e!81935)))

(declare-fun res!60739 () Bool)

(assert (=> d!37677 (=> (not res!60739) (not e!81935))))

(assert (=> d!37677 (= res!60739 (bvslt #b00000000000000000000000000000000 (size!2482 (_keys!4493 newMap!16))))))

(assert (=> d!37677 (= lt!64655 e!81943)))

(assert (=> d!37677 (= c!22862 (and (not (= (bvand lt!64087 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand lt!64087 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!37677 (validMask!0 (mask!7010 newMap!16))))

(assert (=> d!37677 (= (getCurrentListMap!535 (_keys!4493 newMap!16) (_values!2747 newMap!16) (mask!7010 newMap!16) lt!64087 (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2629 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2764 newMap!16)) lt!64667)))

(declare-fun bm!13437 () Bool)

(assert (=> bm!13437 (= call!13440 call!13441)))

(declare-fun b!125430 () Bool)

(assert (=> b!125430 (= e!81937 e!81944)))

(declare-fun c!22857 () Bool)

(assert (=> b!125430 (= c!22857 (not (= (bvand lt!64087 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!13438 () Bool)

(assert (=> bm!13438 (= call!13439 (contains!873 lt!64667 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!125431 () Bool)

(assert (=> b!125431 (= e!81935 (validKeyInArray!0 (select (arr!2219 (_keys!4493 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!125432 () Bool)

(declare-fun e!81945 () Bool)

(assert (=> b!125432 (= e!81944 e!81945)))

(declare-fun res!60743 () Bool)

(assert (=> b!125432 (= res!60743 call!13439)))

(assert (=> b!125432 (=> (not res!60743) (not e!81945))))

(declare-fun b!125433 () Bool)

(declare-fun res!60740 () Bool)

(assert (=> b!125433 (=> (not res!60740) (not e!81937))))

(assert (=> b!125433 (= res!60740 e!81939)))

(declare-fun res!60736 () Bool)

(assert (=> b!125433 (=> res!60736 e!81939)))

(assert (=> b!125433 (= res!60736 (not e!81933))))

(declare-fun res!60741 () Bool)

(assert (=> b!125433 (=> (not res!60741) (not e!81933))))

(assert (=> b!125433 (= res!60741 (bvslt #b00000000000000000000000000000000 (size!2482 (_keys!4493 newMap!16))))))

(declare-fun b!125434 () Bool)

(assert (=> b!125434 (= e!81941 call!13440)))

(declare-fun b!125435 () Bool)

(assert (=> b!125435 (= e!81945 (= (apply!110 lt!64667 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2629 newMap!16)))))

(assert (= (and d!37677 c!22862) b!125429))

(assert (= (and d!37677 (not c!22862)) b!125418))

(assert (= (and b!125418 c!22860) b!125416))

(assert (= (and b!125418 (not c!22860)) b!125427))

(assert (= (and b!125427 c!22861) b!125434))

(assert (= (and b!125427 (not c!22861)) b!125417))

(assert (= (or b!125434 b!125417) bm!13435))

(assert (= (or b!125416 bm!13435) bm!13434))

(assert (= (or b!125416 b!125434) bm!13437))

(assert (= (or b!125429 bm!13434) bm!13432))

(assert (= (or b!125429 bm!13437) bm!13433))

(assert (= (and d!37677 res!60739) b!125431))

(assert (= (and d!37677 c!22859) b!125425))

(assert (= (and d!37677 (not c!22859)) b!125422))

(assert (= (and d!37677 res!60738) b!125433))

(assert (= (and b!125433 res!60741) b!125423))

(assert (= (and b!125433 (not res!60736)) b!125420))

(assert (= (and b!125420 res!60744) b!125415))

(assert (= (and b!125433 res!60740) b!125426))

(assert (= (and b!125426 c!22858) b!125424))

(assert (= (and b!125426 (not c!22858)) b!125421))

(assert (= (and b!125424 res!60737) b!125428))

(assert (= (or b!125424 b!125421) bm!13436))

(assert (= (and b!125426 res!60742) b!125430))

(assert (= (and b!125430 c!22857) b!125432))

(assert (= (and b!125430 (not c!22857)) b!125419))

(assert (= (and b!125432 res!60743) b!125435))

(assert (= (or b!125432 b!125419) bm!13438))

(declare-fun b_lambda!5505 () Bool)

(assert (=> (not b_lambda!5505) (not b!125415)))

(assert (=> b!125415 t!6029))

(declare-fun b_and!7715 () Bool)

(assert (= b_and!7711 (and (=> t!6029 result!3819) b_and!7715)))

(assert (=> b!125415 t!6031))

(declare-fun b_and!7717 () Bool)

(assert (= b_and!7713 (and (=> t!6031 result!3821) b_and!7717)))

(assert (=> b!125431 m!144619))

(assert (=> b!125431 m!144619))

(assert (=> b!125431 m!144629))

(assert (=> b!125415 m!144719))

(assert (=> b!125415 m!144721))

(assert (=> b!125415 m!144723))

(assert (=> b!125415 m!144619))

(assert (=> b!125415 m!144721))

(assert (=> b!125415 m!144619))

(declare-fun m!145917 () Bool)

(assert (=> b!125415 m!145917))

(assert (=> b!125415 m!144719))

(assert (=> b!125423 m!144619))

(assert (=> b!125423 m!144619))

(assert (=> b!125423 m!144629))

(declare-fun m!145919 () Bool)

(assert (=> b!125425 m!145919))

(declare-fun m!145921 () Bool)

(assert (=> b!125425 m!145921))

(declare-fun m!145923 () Bool)

(assert (=> b!125425 m!145923))

(declare-fun m!145925 () Bool)

(assert (=> b!125425 m!145925))

(assert (=> b!125425 m!144619))

(declare-fun m!145927 () Bool)

(assert (=> b!125425 m!145927))

(declare-fun m!145929 () Bool)

(assert (=> b!125425 m!145929))

(declare-fun m!145931 () Bool)

(assert (=> b!125425 m!145931))

(assert (=> b!125425 m!145931))

(declare-fun m!145933 () Bool)

(assert (=> b!125425 m!145933))

(declare-fun m!145935 () Bool)

(assert (=> b!125425 m!145935))

(declare-fun m!145937 () Bool)

(assert (=> b!125425 m!145937))

(assert (=> b!125425 m!145925))

(declare-fun m!145939 () Bool)

(assert (=> b!125425 m!145939))

(assert (=> b!125425 m!144425))

(declare-fun m!145941 () Bool)

(assert (=> b!125425 m!145941))

(assert (=> b!125425 m!144425))

(declare-fun m!145943 () Bool)

(assert (=> b!125425 m!145943))

(declare-fun m!145945 () Bool)

(assert (=> b!125425 m!145945))

(assert (=> b!125425 m!145935))

(assert (=> b!125425 m!144425))

(declare-fun m!145947 () Bool)

(assert (=> b!125425 m!145947))

(assert (=> b!125425 m!145921))

(declare-fun m!145949 () Bool)

(assert (=> b!125425 m!145949))

(assert (=> b!125420 m!144619))

(assert (=> b!125420 m!144619))

(declare-fun m!145951 () Bool)

(assert (=> b!125420 m!145951))

(declare-fun m!145953 () Bool)

(assert (=> b!125429 m!145953))

(declare-fun m!145955 () Bool)

(assert (=> b!125435 m!145955))

(declare-fun m!145957 () Bool)

(assert (=> bm!13436 m!145957))

(assert (=> bm!13432 m!144425))

(assert (=> bm!13432 m!145947))

(declare-fun m!145959 () Bool)

(assert (=> bm!13438 m!145959))

(declare-fun m!145961 () Bool)

(assert (=> b!125428 m!145961))

(declare-fun m!145963 () Bool)

(assert (=> bm!13433 m!145963))

(assert (=> d!37677 m!144633))

(assert (=> d!37379 d!37677))

(assert (=> d!37379 d!37339))

(declare-fun d!37679 () Bool)

(assert (=> d!37679 (= (get!1439 (getValueByKey!166 (toList!854 (+!169 lt!64016 (tuple2!2569 lt!63999 (minValue!2629 (v!3108 (underlying!436 thiss!992)))))) lt!64011)) (v!3112 (getValueByKey!166 (toList!854 (+!169 lt!64016 (tuple2!2569 lt!63999 (minValue!2629 (v!3108 (underlying!436 thiss!992)))))) lt!64011)))))

(assert (=> d!37397 d!37679))

(declare-fun c!22863 () Bool)

(declare-fun d!37681 () Bool)

(assert (=> d!37681 (= c!22863 (and ((_ is Cons!1691) (toList!854 (+!169 lt!64016 (tuple2!2569 lt!63999 (minValue!2629 (v!3108 (underlying!436 thiss!992))))))) (= (_1!1295 (h!2292 (toList!854 (+!169 lt!64016 (tuple2!2569 lt!63999 (minValue!2629 (v!3108 (underlying!436 thiss!992)))))))) lt!64011)))))

(declare-fun e!81946 () Option!172)

(assert (=> d!37681 (= (getValueByKey!166 (toList!854 (+!169 lt!64016 (tuple2!2569 lt!63999 (minValue!2629 (v!3108 (underlying!436 thiss!992)))))) lt!64011) e!81946)))

(declare-fun b!125436 () Bool)

(assert (=> b!125436 (= e!81946 (Some!171 (_2!1295 (h!2292 (toList!854 (+!169 lt!64016 (tuple2!2569 lt!63999 (minValue!2629 (v!3108 (underlying!436 thiss!992))))))))))))

(declare-fun e!81947 () Option!172)

(declare-fun b!125438 () Bool)

(assert (=> b!125438 (= e!81947 (getValueByKey!166 (t!6022 (toList!854 (+!169 lt!64016 (tuple2!2569 lt!63999 (minValue!2629 (v!3108 (underlying!436 thiss!992))))))) lt!64011))))

(declare-fun b!125439 () Bool)

(assert (=> b!125439 (= e!81947 None!170)))

(declare-fun b!125437 () Bool)

(assert (=> b!125437 (= e!81946 e!81947)))

(declare-fun c!22864 () Bool)

(assert (=> b!125437 (= c!22864 (and ((_ is Cons!1691) (toList!854 (+!169 lt!64016 (tuple2!2569 lt!63999 (minValue!2629 (v!3108 (underlying!436 thiss!992))))))) (not (= (_1!1295 (h!2292 (toList!854 (+!169 lt!64016 (tuple2!2569 lt!63999 (minValue!2629 (v!3108 (underlying!436 thiss!992)))))))) lt!64011))))))

(assert (= (and d!37681 c!22863) b!125436))

(assert (= (and d!37681 (not c!22863)) b!125437))

(assert (= (and b!125437 c!22864) b!125438))

(assert (= (and b!125437 (not c!22864)) b!125439))

(declare-fun m!145965 () Bool)

(assert (=> b!125438 m!145965))

(assert (=> d!37397 d!37681))

(assert (=> b!124935 d!37455))

(declare-fun d!37683 () Bool)

(assert (=> d!37683 (= (+!169 (getCurrentListMap!535 (_keys!4493 newMap!16) (_values!2747 newMap!16) (mask!7010 newMap!16) (extraKeys!2549 newMap!16) (zeroValue!2629 newMap!16) (minValue!2629 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2764 newMap!16)) (tuple2!2569 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (getCurrentListMap!535 (_keys!4493 newMap!16) (array!4688 (store (arr!2220 (_values!2747 newMap!16)) (index!3231 lt!64093) (ValueCellFull!1074 (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2483 (_values!2747 newMap!16))) (mask!7010 newMap!16) (extraKeys!2549 newMap!16) (zeroValue!2629 newMap!16) (minValue!2629 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2764 newMap!16)))))

(assert (=> d!37683 true))

(declare-fun _$5!122 () Unit!3867)

(assert (=> d!37683 (= (choose!750 (_keys!4493 newMap!16) (_values!2747 newMap!16) (mask!7010 newMap!16) (extraKeys!2549 newMap!16) (zeroValue!2629 newMap!16) (minValue!2629 newMap!16) (index!3231 lt!64093) (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2764 newMap!16)) _$5!122)))

(declare-fun bs!5193 () Bool)

(assert (= bs!5193 d!37683))

(assert (=> bs!5193 m!144491))

(assert (=> bs!5193 m!144491))

(assert (=> bs!5193 m!144707))

(assert (=> bs!5193 m!144567))

(assert (=> bs!5193 m!144709))

(assert (=> d!37335 d!37683))

(assert (=> d!37335 d!37435))

(declare-fun d!37685 () Bool)

(declare-fun e!81948 () Bool)

(assert (=> d!37685 e!81948))

(declare-fun res!60745 () Bool)

(assert (=> d!37685 (=> res!60745 e!81948)))

(declare-fun lt!64676 () Bool)

(assert (=> d!37685 (= res!60745 (not lt!64676))))

(declare-fun lt!64677 () Bool)

(assert (=> d!37685 (= lt!64676 lt!64677)))

(declare-fun lt!64674 () Unit!3867)

(declare-fun e!81949 () Unit!3867)

(assert (=> d!37685 (= lt!64674 e!81949)))

(declare-fun c!22865 () Bool)

(assert (=> d!37685 (= c!22865 lt!64677)))

(assert (=> d!37685 (= lt!64677 (containsKey!170 (toList!854 lt!64187) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!37685 (= (contains!873 lt!64187 #b0000000000000000000000000000000000000000000000000000000000000000) lt!64676)))

(declare-fun b!125440 () Bool)

(declare-fun lt!64675 () Unit!3867)

(assert (=> b!125440 (= e!81949 lt!64675)))

(assert (=> b!125440 (= lt!64675 (lemmaContainsKeyImpliesGetValueByKeyDefined!118 (toList!854 lt!64187) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!125440 (isDefined!119 (getValueByKey!166 (toList!854 lt!64187) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!125441 () Bool)

(declare-fun Unit!3902 () Unit!3867)

(assert (=> b!125441 (= e!81949 Unit!3902)))

(declare-fun b!125442 () Bool)

(assert (=> b!125442 (= e!81948 (isDefined!119 (getValueByKey!166 (toList!854 lt!64187) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!37685 c!22865) b!125440))

(assert (= (and d!37685 (not c!22865)) b!125441))

(assert (= (and d!37685 (not res!60745)) b!125442))

(declare-fun m!145967 () Bool)

(assert (=> d!37685 m!145967))

(declare-fun m!145969 () Bool)

(assert (=> b!125440 m!145969))

(assert (=> b!125440 m!145491))

(assert (=> b!125440 m!145491))

(declare-fun m!145971 () Bool)

(assert (=> b!125440 m!145971))

(assert (=> b!125442 m!145491))

(assert (=> b!125442 m!145491))

(assert (=> b!125442 m!145971))

(assert (=> bm!13354 d!37685))

(declare-fun d!37687 () Bool)

(assert (=> d!37687 (= (apply!110 lt!64406 (select (arr!2219 (_keys!4493 newMap!16)) #b00000000000000000000000000000000)) (get!1439 (getValueByKey!166 (toList!854 lt!64406) (select (arr!2219 (_keys!4493 newMap!16)) #b00000000000000000000000000000000))))))

(declare-fun bs!5194 () Bool)

(assert (= bs!5194 d!37687))

(assert (=> bs!5194 m!144619))

(assert (=> bs!5194 m!145203))

(assert (=> bs!5194 m!145203))

(declare-fun m!145973 () Bool)

(assert (=> bs!5194 m!145973))

(assert (=> b!124973 d!37687))

(declare-fun c!22866 () Bool)

(declare-fun d!37689 () Bool)

(assert (=> d!37689 (= c!22866 ((_ is ValueCellFull!1074) (select (arr!2220 (ite c!22645 (_values!2747 newMap!16) lt!64109)) #b00000000000000000000000000000000)))))

(declare-fun e!81950 () V!3427)

(assert (=> d!37689 (= (get!1436 (select (arr!2220 (ite c!22645 (_values!2747 newMap!16) lt!64109)) #b00000000000000000000000000000000) (dynLambda!411 (defaultEntry!2764 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000)) e!81950)))

(declare-fun b!125443 () Bool)

(assert (=> b!125443 (= e!81950 (get!1437 (select (arr!2220 (ite c!22645 (_values!2747 newMap!16) lt!64109)) #b00000000000000000000000000000000) (dynLambda!411 (defaultEntry!2764 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!125444 () Bool)

(assert (=> b!125444 (= e!81950 (get!1438 (select (arr!2220 (ite c!22645 (_values!2747 newMap!16) lt!64109)) #b00000000000000000000000000000000) (dynLambda!411 (defaultEntry!2764 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!37689 c!22866) b!125443))

(assert (= (and d!37689 (not c!22866)) b!125444))

(assert (=> b!125443 m!145101))

(assert (=> b!125443 m!144721))

(declare-fun m!145975 () Bool)

(assert (=> b!125443 m!145975))

(assert (=> b!125444 m!145101))

(assert (=> b!125444 m!144721))

(declare-fun m!145977 () Bool)

(assert (=> b!125444 m!145977))

(assert (=> b!124973 d!37689))

(declare-fun d!37691 () Bool)

(declare-fun e!81951 () Bool)

(assert (=> d!37691 e!81951))

(declare-fun res!60746 () Bool)

(assert (=> d!37691 (=> (not res!60746) (not e!81951))))

(declare-fun lt!64678 () ListLongMap!1677)

(assert (=> d!37691 (= res!60746 (contains!873 lt!64678 (_1!1295 (ite (or c!22727 c!22725) (tuple2!2569 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2629 newMap!16)) (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!22645 (ite c!22640 (minValue!2629 newMap!16) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2629 newMap!16)))))))))

(declare-fun lt!64679 () List!1695)

(assert (=> d!37691 (= lt!64678 (ListLongMap!1678 lt!64679))))

(declare-fun lt!64681 () Unit!3867)

(declare-fun lt!64680 () Unit!3867)

(assert (=> d!37691 (= lt!64681 lt!64680)))

(assert (=> d!37691 (= (getValueByKey!166 lt!64679 (_1!1295 (ite (or c!22727 c!22725) (tuple2!2569 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2629 newMap!16)) (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!22645 (ite c!22640 (minValue!2629 newMap!16) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2629 newMap!16)))))) (Some!171 (_2!1295 (ite (or c!22727 c!22725) (tuple2!2569 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2629 newMap!16)) (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!22645 (ite c!22640 (minValue!2629 newMap!16) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2629 newMap!16)))))))))

(assert (=> d!37691 (= lt!64680 (lemmaContainsTupThenGetReturnValue!81 lt!64679 (_1!1295 (ite (or c!22727 c!22725) (tuple2!2569 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2629 newMap!16)) (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!22645 (ite c!22640 (minValue!2629 newMap!16) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2629 newMap!16))))) (_2!1295 (ite (or c!22727 c!22725) (tuple2!2569 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2629 newMap!16)) (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!22645 (ite c!22640 (minValue!2629 newMap!16) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2629 newMap!16)))))))))

(assert (=> d!37691 (= lt!64679 (insertStrictlySorted!84 (toList!854 (ite c!22727 call!13378 (ite c!22725 call!13380 call!13379))) (_1!1295 (ite (or c!22727 c!22725) (tuple2!2569 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2629 newMap!16)) (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!22645 (ite c!22640 (minValue!2629 newMap!16) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2629 newMap!16))))) (_2!1295 (ite (or c!22727 c!22725) (tuple2!2569 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2629 newMap!16)) (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!22645 (ite c!22640 (minValue!2629 newMap!16) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2629 newMap!16)))))))))

(assert (=> d!37691 (= (+!169 (ite c!22727 call!13378 (ite c!22725 call!13380 call!13379)) (ite (or c!22727 c!22725) (tuple2!2569 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2629 newMap!16)) (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!22645 (ite c!22640 (minValue!2629 newMap!16) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2629 newMap!16))))) lt!64678)))

(declare-fun b!125445 () Bool)

(declare-fun res!60747 () Bool)

(assert (=> b!125445 (=> (not res!60747) (not e!81951))))

(assert (=> b!125445 (= res!60747 (= (getValueByKey!166 (toList!854 lt!64678) (_1!1295 (ite (or c!22727 c!22725) (tuple2!2569 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2629 newMap!16)) (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!22645 (ite c!22640 (minValue!2629 newMap!16) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2629 newMap!16)))))) (Some!171 (_2!1295 (ite (or c!22727 c!22725) (tuple2!2569 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2629 newMap!16)) (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!22645 (ite c!22640 (minValue!2629 newMap!16) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2629 newMap!16))))))))))

(declare-fun b!125446 () Bool)

(assert (=> b!125446 (= e!81951 (contains!874 (toList!854 lt!64678) (ite (or c!22727 c!22725) (tuple2!2569 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2629 newMap!16)) (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!22645 (ite c!22640 (minValue!2629 newMap!16) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2629 newMap!16))))))))

(assert (= (and d!37691 res!60746) b!125445))

(assert (= (and b!125445 res!60747) b!125446))

(declare-fun m!145979 () Bool)

(assert (=> d!37691 m!145979))

(declare-fun m!145981 () Bool)

(assert (=> d!37691 m!145981))

(declare-fun m!145983 () Bool)

(assert (=> d!37691 m!145983))

(declare-fun m!145985 () Bool)

(assert (=> d!37691 m!145985))

(declare-fun m!145987 () Bool)

(assert (=> b!125445 m!145987))

(declare-fun m!145989 () Bool)

(assert (=> b!125446 m!145989))

(assert (=> bm!13376 d!37691))

(assert (=> b!124890 d!37377))

(assert (=> b!124849 d!37329))

(declare-fun bm!13439 () Bool)

(declare-fun call!13442 () ListLongMap!1677)

(assert (=> bm!13439 (= call!13442 (getCurrentListMapNoExtraKeys!135 (_keys!4493 (_2!1296 lt!64096)) (_values!2747 (_2!1296 lt!64096)) (mask!7010 (_2!1296 lt!64096)) (extraKeys!2549 (_2!1296 lt!64096)) (zeroValue!2629 (_2!1296 lt!64096)) (minValue!2629 (_2!1296 lt!64096)) #b00000000000000000000000000000000 (defaultEntry!2764 (_2!1296 lt!64096))))))

(declare-fun bm!13440 () Bool)

(declare-fun c!22870 () Bool)

(declare-fun call!13443 () ListLongMap!1677)

(declare-fun call!13444 () ListLongMap!1677)

(declare-fun c!22872 () Bool)

(declare-fun call!13448 () ListLongMap!1677)

(assert (=> bm!13440 (= call!13448 (+!169 (ite c!22872 call!13442 (ite c!22870 call!13444 call!13443)) (ite (or c!22872 c!22870) (tuple2!2569 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2629 (_2!1296 lt!64096))) (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2629 (_2!1296 lt!64096))))))))

(declare-fun bm!13441 () Bool)

(assert (=> bm!13441 (= call!13444 call!13442)))

(declare-fun b!125448 () Bool)

(declare-fun e!81955 () ListLongMap!1677)

(declare-fun call!13447 () ListLongMap!1677)

(assert (=> b!125448 (= e!81955 call!13447)))

(declare-fun b!125449 () Bool)

(declare-fun e!81960 () ListLongMap!1677)

(assert (=> b!125449 (= e!81960 call!13443)))

(declare-fun b!125450 () Bool)

(declare-fun e!81962 () ListLongMap!1677)

(assert (=> b!125450 (= e!81962 e!81955)))

(assert (=> b!125450 (= c!22870 (and (not (= (bvand (extraKeys!2549 (_2!1296 lt!64096)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2549 (_2!1296 lt!64096)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!125451 () Bool)

(declare-fun e!81963 () Bool)

(declare-fun call!13446 () Bool)

(assert (=> b!125451 (= e!81963 (not call!13446))))

(declare-fun b!125452 () Bool)

(declare-fun e!81958 () Bool)

(declare-fun e!81961 () Bool)

(assert (=> b!125452 (= e!81958 e!81961)))

(declare-fun res!60756 () Bool)

(assert (=> b!125452 (=> (not res!60756) (not e!81961))))

(declare-fun lt!64697 () ListLongMap!1677)

(assert (=> b!125452 (= res!60756 (contains!873 lt!64697 (select (arr!2219 (_keys!4493 (_2!1296 lt!64096))) #b00000000000000000000000000000000)))))

(assert (=> b!125452 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2482 (_keys!4493 (_2!1296 lt!64096)))))))

(declare-fun bm!13442 () Bool)

(assert (=> bm!13442 (= call!13443 call!13444)))

(declare-fun b!125453 () Bool)

(declare-fun e!81959 () Bool)

(declare-fun call!13445 () Bool)

(assert (=> b!125453 (= e!81959 (not call!13445))))

(declare-fun b!125454 () Bool)

(declare-fun e!81957 () Unit!3867)

(declare-fun Unit!3903 () Unit!3867)

(assert (=> b!125454 (= e!81957 Unit!3903)))

(declare-fun b!125455 () Bool)

(declare-fun e!81952 () Bool)

(assert (=> b!125455 (= e!81952 (validKeyInArray!0 (select (arr!2219 (_keys!4493 (_2!1296 lt!64096))) #b00000000000000000000000000000000)))))

(declare-fun b!125456 () Bool)

(declare-fun e!81953 () Bool)

(assert (=> b!125456 (= e!81959 e!81953)))

(declare-fun res!60749 () Bool)

(assert (=> b!125456 (= res!60749 call!13445)))

(assert (=> b!125456 (=> (not res!60749) (not e!81953))))

(declare-fun b!125457 () Bool)

(declare-fun lt!64693 () Unit!3867)

(assert (=> b!125457 (= e!81957 lt!64693)))

(declare-fun lt!64682 () ListLongMap!1677)

(assert (=> b!125457 (= lt!64682 (getCurrentListMapNoExtraKeys!135 (_keys!4493 (_2!1296 lt!64096)) (_values!2747 (_2!1296 lt!64096)) (mask!7010 (_2!1296 lt!64096)) (extraKeys!2549 (_2!1296 lt!64096)) (zeroValue!2629 (_2!1296 lt!64096)) (minValue!2629 (_2!1296 lt!64096)) #b00000000000000000000000000000000 (defaultEntry!2764 (_2!1296 lt!64096))))))

(declare-fun lt!64688 () (_ BitVec 64))

(assert (=> b!125457 (= lt!64688 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!64698 () (_ BitVec 64))

(assert (=> b!125457 (= lt!64698 (select (arr!2219 (_keys!4493 (_2!1296 lt!64096))) #b00000000000000000000000000000000))))

(declare-fun lt!64683 () Unit!3867)

(assert (=> b!125457 (= lt!64683 (addStillContains!86 lt!64682 lt!64688 (zeroValue!2629 (_2!1296 lt!64096)) lt!64698))))

(assert (=> b!125457 (contains!873 (+!169 lt!64682 (tuple2!2569 lt!64688 (zeroValue!2629 (_2!1296 lt!64096)))) lt!64698)))

(declare-fun lt!64700 () Unit!3867)

(assert (=> b!125457 (= lt!64700 lt!64683)))

(declare-fun lt!64701 () ListLongMap!1677)

(assert (=> b!125457 (= lt!64701 (getCurrentListMapNoExtraKeys!135 (_keys!4493 (_2!1296 lt!64096)) (_values!2747 (_2!1296 lt!64096)) (mask!7010 (_2!1296 lt!64096)) (extraKeys!2549 (_2!1296 lt!64096)) (zeroValue!2629 (_2!1296 lt!64096)) (minValue!2629 (_2!1296 lt!64096)) #b00000000000000000000000000000000 (defaultEntry!2764 (_2!1296 lt!64096))))))

(declare-fun lt!64684 () (_ BitVec 64))

(assert (=> b!125457 (= lt!64684 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!64696 () (_ BitVec 64))

(assert (=> b!125457 (= lt!64696 (select (arr!2219 (_keys!4493 (_2!1296 lt!64096))) #b00000000000000000000000000000000))))

(declare-fun lt!64694 () Unit!3867)

(assert (=> b!125457 (= lt!64694 (addApplyDifferent!86 lt!64701 lt!64684 (minValue!2629 (_2!1296 lt!64096)) lt!64696))))

(assert (=> b!125457 (= (apply!110 (+!169 lt!64701 (tuple2!2569 lt!64684 (minValue!2629 (_2!1296 lt!64096)))) lt!64696) (apply!110 lt!64701 lt!64696))))

(declare-fun lt!64699 () Unit!3867)

(assert (=> b!125457 (= lt!64699 lt!64694)))

(declare-fun lt!64692 () ListLongMap!1677)

(assert (=> b!125457 (= lt!64692 (getCurrentListMapNoExtraKeys!135 (_keys!4493 (_2!1296 lt!64096)) (_values!2747 (_2!1296 lt!64096)) (mask!7010 (_2!1296 lt!64096)) (extraKeys!2549 (_2!1296 lt!64096)) (zeroValue!2629 (_2!1296 lt!64096)) (minValue!2629 (_2!1296 lt!64096)) #b00000000000000000000000000000000 (defaultEntry!2764 (_2!1296 lt!64096))))))

(declare-fun lt!64702 () (_ BitVec 64))

(assert (=> b!125457 (= lt!64702 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!64690 () (_ BitVec 64))

(assert (=> b!125457 (= lt!64690 (select (arr!2219 (_keys!4493 (_2!1296 lt!64096))) #b00000000000000000000000000000000))))

(declare-fun lt!64703 () Unit!3867)

(assert (=> b!125457 (= lt!64703 (addApplyDifferent!86 lt!64692 lt!64702 (zeroValue!2629 (_2!1296 lt!64096)) lt!64690))))

(assert (=> b!125457 (= (apply!110 (+!169 lt!64692 (tuple2!2569 lt!64702 (zeroValue!2629 (_2!1296 lt!64096)))) lt!64690) (apply!110 lt!64692 lt!64690))))

(declare-fun lt!64695 () Unit!3867)

(assert (=> b!125457 (= lt!64695 lt!64703)))

(declare-fun lt!64689 () ListLongMap!1677)

(assert (=> b!125457 (= lt!64689 (getCurrentListMapNoExtraKeys!135 (_keys!4493 (_2!1296 lt!64096)) (_values!2747 (_2!1296 lt!64096)) (mask!7010 (_2!1296 lt!64096)) (extraKeys!2549 (_2!1296 lt!64096)) (zeroValue!2629 (_2!1296 lt!64096)) (minValue!2629 (_2!1296 lt!64096)) #b00000000000000000000000000000000 (defaultEntry!2764 (_2!1296 lt!64096))))))

(declare-fun lt!64686 () (_ BitVec 64))

(assert (=> b!125457 (= lt!64686 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!64687 () (_ BitVec 64))

(assert (=> b!125457 (= lt!64687 (select (arr!2219 (_keys!4493 (_2!1296 lt!64096))) #b00000000000000000000000000000000))))

(assert (=> b!125457 (= lt!64693 (addApplyDifferent!86 lt!64689 lt!64686 (minValue!2629 (_2!1296 lt!64096)) lt!64687))))

(assert (=> b!125457 (= (apply!110 (+!169 lt!64689 (tuple2!2569 lt!64686 (minValue!2629 (_2!1296 lt!64096)))) lt!64687) (apply!110 lt!64689 lt!64687))))

(declare-fun b!125458 () Bool)

(declare-fun res!60754 () Bool)

(declare-fun e!81956 () Bool)

(assert (=> b!125458 (=> (not res!60754) (not e!81956))))

(assert (=> b!125458 (= res!60754 e!81959)))

(declare-fun c!22868 () Bool)

(assert (=> b!125458 (= c!22868 (not (= (bvand (extraKeys!2549 (_2!1296 lt!64096)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!125459 () Bool)

(declare-fun c!22871 () Bool)

(assert (=> b!125459 (= c!22871 (and (not (= (bvand (extraKeys!2549 (_2!1296 lt!64096)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2549 (_2!1296 lt!64096)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!125459 (= e!81955 e!81960)))

(declare-fun b!125460 () Bool)

(assert (=> b!125460 (= e!81953 (= (apply!110 lt!64697 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2629 (_2!1296 lt!64096))))))

(declare-fun bm!13443 () Bool)

(assert (=> bm!13443 (= call!13445 (contains!873 lt!64697 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!125461 () Bool)

(assert (=> b!125461 (= e!81962 (+!169 call!13448 (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2629 (_2!1296 lt!64096)))))))

(declare-fun b!125447 () Bool)

(assert (=> b!125447 (= e!81961 (= (apply!110 lt!64697 (select (arr!2219 (_keys!4493 (_2!1296 lt!64096))) #b00000000000000000000000000000000)) (get!1436 (select (arr!2220 (_values!2747 (_2!1296 lt!64096))) #b00000000000000000000000000000000) (dynLambda!411 (defaultEntry!2764 (_2!1296 lt!64096)) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!125447 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2483 (_values!2747 (_2!1296 lt!64096)))))))

(assert (=> b!125447 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2482 (_keys!4493 (_2!1296 lt!64096)))))))

(declare-fun d!37693 () Bool)

(assert (=> d!37693 e!81956))

(declare-fun res!60750 () Bool)

(assert (=> d!37693 (=> (not res!60750) (not e!81956))))

(assert (=> d!37693 (= res!60750 (or (bvsge #b00000000000000000000000000000000 (size!2482 (_keys!4493 (_2!1296 lt!64096)))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2482 (_keys!4493 (_2!1296 lt!64096)))))))))

(declare-fun lt!64685 () ListLongMap!1677)

(assert (=> d!37693 (= lt!64697 lt!64685)))

(declare-fun lt!64691 () Unit!3867)

(assert (=> d!37693 (= lt!64691 e!81957)))

(declare-fun c!22869 () Bool)

(declare-fun e!81954 () Bool)

(assert (=> d!37693 (= c!22869 e!81954)))

(declare-fun res!60751 () Bool)

(assert (=> d!37693 (=> (not res!60751) (not e!81954))))

(assert (=> d!37693 (= res!60751 (bvslt #b00000000000000000000000000000000 (size!2482 (_keys!4493 (_2!1296 lt!64096)))))))

(assert (=> d!37693 (= lt!64685 e!81962)))

(assert (=> d!37693 (= c!22872 (and (not (= (bvand (extraKeys!2549 (_2!1296 lt!64096)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2549 (_2!1296 lt!64096)) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!37693 (validMask!0 (mask!7010 (_2!1296 lt!64096)))))

(assert (=> d!37693 (= (getCurrentListMap!535 (_keys!4493 (_2!1296 lt!64096)) (_values!2747 (_2!1296 lt!64096)) (mask!7010 (_2!1296 lt!64096)) (extraKeys!2549 (_2!1296 lt!64096)) (zeroValue!2629 (_2!1296 lt!64096)) (minValue!2629 (_2!1296 lt!64096)) #b00000000000000000000000000000000 (defaultEntry!2764 (_2!1296 lt!64096))) lt!64697)))

(declare-fun bm!13444 () Bool)

(assert (=> bm!13444 (= call!13447 call!13448)))

(declare-fun b!125462 () Bool)

(assert (=> b!125462 (= e!81956 e!81963)))

(declare-fun c!22867 () Bool)

(assert (=> b!125462 (= c!22867 (not (= (bvand (extraKeys!2549 (_2!1296 lt!64096)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!13445 () Bool)

(assert (=> bm!13445 (= call!13446 (contains!873 lt!64697 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!125463 () Bool)

(assert (=> b!125463 (= e!81954 (validKeyInArray!0 (select (arr!2219 (_keys!4493 (_2!1296 lt!64096))) #b00000000000000000000000000000000)))))

(declare-fun b!125464 () Bool)

(declare-fun e!81964 () Bool)

(assert (=> b!125464 (= e!81963 e!81964)))

(declare-fun res!60755 () Bool)

(assert (=> b!125464 (= res!60755 call!13446)))

(assert (=> b!125464 (=> (not res!60755) (not e!81964))))

(declare-fun b!125465 () Bool)

(declare-fun res!60752 () Bool)

(assert (=> b!125465 (=> (not res!60752) (not e!81956))))

(assert (=> b!125465 (= res!60752 e!81958)))

(declare-fun res!60748 () Bool)

(assert (=> b!125465 (=> res!60748 e!81958)))

(assert (=> b!125465 (= res!60748 (not e!81952))))

(declare-fun res!60753 () Bool)

(assert (=> b!125465 (=> (not res!60753) (not e!81952))))

(assert (=> b!125465 (= res!60753 (bvslt #b00000000000000000000000000000000 (size!2482 (_keys!4493 (_2!1296 lt!64096)))))))

(declare-fun b!125466 () Bool)

(assert (=> b!125466 (= e!81960 call!13447)))

(declare-fun b!125467 () Bool)

(assert (=> b!125467 (= e!81964 (= (apply!110 lt!64697 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2629 (_2!1296 lt!64096))))))

(assert (= (and d!37693 c!22872) b!125461))

(assert (= (and d!37693 (not c!22872)) b!125450))

(assert (= (and b!125450 c!22870) b!125448))

(assert (= (and b!125450 (not c!22870)) b!125459))

(assert (= (and b!125459 c!22871) b!125466))

(assert (= (and b!125459 (not c!22871)) b!125449))

(assert (= (or b!125466 b!125449) bm!13442))

(assert (= (or b!125448 bm!13442) bm!13441))

(assert (= (or b!125448 b!125466) bm!13444))

(assert (= (or b!125461 bm!13441) bm!13439))

(assert (= (or b!125461 bm!13444) bm!13440))

(assert (= (and d!37693 res!60751) b!125463))

(assert (= (and d!37693 c!22869) b!125457))

(assert (= (and d!37693 (not c!22869)) b!125454))

(assert (= (and d!37693 res!60750) b!125465))

(assert (= (and b!125465 res!60753) b!125455))

(assert (= (and b!125465 (not res!60748)) b!125452))

(assert (= (and b!125452 res!60756) b!125447))

(assert (= (and b!125465 res!60752) b!125458))

(assert (= (and b!125458 c!22868) b!125456))

(assert (= (and b!125458 (not c!22868)) b!125453))

(assert (= (and b!125456 res!60749) b!125460))

(assert (= (or b!125456 b!125453) bm!13443))

(assert (= (and b!125458 res!60754) b!125462))

(assert (= (and b!125462 c!22867) b!125464))

(assert (= (and b!125462 (not c!22867)) b!125451))

(assert (= (and b!125464 res!60755) b!125467))

(assert (= (or b!125464 b!125451) bm!13445))

(declare-fun b_lambda!5507 () Bool)

(assert (=> (not b_lambda!5507) (not b!125447)))

(declare-fun t!6033 () Bool)

(declare-fun tb!2301 () Bool)

(assert (=> (and b!124369 (= (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) (defaultEntry!2764 (_2!1296 lt!64096))) t!6033) tb!2301))

(declare-fun result!3823 () Bool)

(assert (=> tb!2301 (= result!3823 tp_is_empty!2835)))

(assert (=> b!125447 t!6033))

(declare-fun b_and!7719 () Bool)

(assert (= b_and!7715 (and (=> t!6033 result!3823) b_and!7719)))

(declare-fun t!6035 () Bool)

(declare-fun tb!2303 () Bool)

(assert (=> (and b!124375 (= (defaultEntry!2764 newMap!16) (defaultEntry!2764 (_2!1296 lt!64096))) t!6035) tb!2303))

(declare-fun result!3825 () Bool)

(assert (= result!3825 result!3823))

(assert (=> b!125447 t!6035))

(declare-fun b_and!7721 () Bool)

(assert (= b_and!7717 (and (=> t!6035 result!3825) b_and!7721)))

(assert (=> b!125463 m!145633))

(assert (=> b!125463 m!145633))

(assert (=> b!125463 m!145635))

(declare-fun m!145991 () Bool)

(assert (=> b!125447 m!145991))

(declare-fun m!145993 () Bool)

(assert (=> b!125447 m!145993))

(declare-fun m!145995 () Bool)

(assert (=> b!125447 m!145995))

(assert (=> b!125447 m!145633))

(assert (=> b!125447 m!145993))

(assert (=> b!125447 m!145633))

(declare-fun m!145997 () Bool)

(assert (=> b!125447 m!145997))

(assert (=> b!125447 m!145991))

(assert (=> b!125455 m!145633))

(assert (=> b!125455 m!145633))

(assert (=> b!125455 m!145635))

(declare-fun m!145999 () Bool)

(assert (=> b!125457 m!145999))

(declare-fun m!146001 () Bool)

(assert (=> b!125457 m!146001))

(declare-fun m!146003 () Bool)

(assert (=> b!125457 m!146003))

(declare-fun m!146005 () Bool)

(assert (=> b!125457 m!146005))

(assert (=> b!125457 m!145633))

(declare-fun m!146007 () Bool)

(assert (=> b!125457 m!146007))

(declare-fun m!146009 () Bool)

(assert (=> b!125457 m!146009))

(declare-fun m!146011 () Bool)

(assert (=> b!125457 m!146011))

(assert (=> b!125457 m!146011))

(declare-fun m!146013 () Bool)

(assert (=> b!125457 m!146013))

(declare-fun m!146015 () Bool)

(assert (=> b!125457 m!146015))

(declare-fun m!146017 () Bool)

(assert (=> b!125457 m!146017))

(assert (=> b!125457 m!146005))

(declare-fun m!146019 () Bool)

(assert (=> b!125457 m!146019))

(declare-fun m!146021 () Bool)

(assert (=> b!125457 m!146021))

(declare-fun m!146023 () Bool)

(assert (=> b!125457 m!146023))

(declare-fun m!146025 () Bool)

(assert (=> b!125457 m!146025))

(assert (=> b!125457 m!146015))

(declare-fun m!146027 () Bool)

(assert (=> b!125457 m!146027))

(assert (=> b!125457 m!146001))

(declare-fun m!146029 () Bool)

(assert (=> b!125457 m!146029))

(assert (=> b!125452 m!145633))

(assert (=> b!125452 m!145633))

(declare-fun m!146031 () Bool)

(assert (=> b!125452 m!146031))

(declare-fun m!146033 () Bool)

(assert (=> b!125461 m!146033))

(declare-fun m!146035 () Bool)

(assert (=> b!125467 m!146035))

(declare-fun m!146037 () Bool)

(assert (=> bm!13443 m!146037))

(assert (=> bm!13439 m!146027))

(declare-fun m!146039 () Bool)

(assert (=> bm!13445 m!146039))

(declare-fun m!146041 () Bool)

(assert (=> b!125460 m!146041))

(declare-fun m!146043 () Bool)

(assert (=> bm!13440 m!146043))

(assert (=> d!37693 m!145197))

(assert (=> d!37367 d!37693))

(declare-fun d!37695 () Bool)

(declare-fun res!60757 () Bool)

(declare-fun e!81965 () Bool)

(assert (=> d!37695 (=> res!60757 e!81965)))

(assert (=> d!37695 (= res!60757 (and ((_ is Cons!1691) (t!6022 (toList!854 lt!63941))) (= (_1!1295 (h!2292 (t!6022 (toList!854 lt!63941)))) (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355))))))

(assert (=> d!37695 (= (containsKey!170 (t!6022 (toList!854 lt!63941)) (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355)) e!81965)))

(declare-fun b!125468 () Bool)

(declare-fun e!81966 () Bool)

(assert (=> b!125468 (= e!81965 e!81966)))

(declare-fun res!60758 () Bool)

(assert (=> b!125468 (=> (not res!60758) (not e!81966))))

(assert (=> b!125468 (= res!60758 (and (or (not ((_ is Cons!1691) (t!6022 (toList!854 lt!63941)))) (bvsle (_1!1295 (h!2292 (t!6022 (toList!854 lt!63941)))) (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355))) ((_ is Cons!1691) (t!6022 (toList!854 lt!63941))) (bvslt (_1!1295 (h!2292 (t!6022 (toList!854 lt!63941)))) (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355))))))

(declare-fun b!125469 () Bool)

(assert (=> b!125469 (= e!81966 (containsKey!170 (t!6022 (t!6022 (toList!854 lt!63941))) (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355)))))

(assert (= (and d!37695 (not res!60757)) b!125468))

(assert (= (and b!125468 res!60758) b!125469))

(assert (=> b!125469 m!144415))

(declare-fun m!146045 () Bool)

(assert (=> b!125469 m!146045))

(assert (=> b!124912 d!37695))

(declare-fun d!37697 () Bool)

(assert (=> d!37697 (= (apply!110 lt!64339 #b1000000000000000000000000000000000000000000000000000000000000000) (get!1439 (getValueByKey!166 (toList!854 lt!64339) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!5195 () Bool)

(assert (= bs!5195 d!37697))

(assert (=> bs!5195 m!145475))

(assert (=> bs!5195 m!145475))

(declare-fun m!146047 () Bool)

(assert (=> bs!5195 m!146047))

(assert (=> b!124939 d!37697))

(declare-fun d!37699 () Bool)

(declare-fun e!81967 () Bool)

(assert (=> d!37699 e!81967))

(declare-fun res!60759 () Bool)

(assert (=> d!37699 (=> (not res!60759) (not e!81967))))

(declare-fun lt!64704 () ListLongMap!1677)

(assert (=> d!37699 (= res!60759 (contains!873 lt!64704 (_1!1295 (tuple2!2569 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!64705 () List!1695)

(assert (=> d!37699 (= lt!64704 (ListLongMap!1678 lt!64705))))

(declare-fun lt!64707 () Unit!3867)

(declare-fun lt!64706 () Unit!3867)

(assert (=> d!37699 (= lt!64707 lt!64706)))

(assert (=> d!37699 (= (getValueByKey!166 lt!64705 (_1!1295 (tuple2!2569 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!171 (_2!1295 (tuple2!2569 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!37699 (= lt!64706 (lemmaContainsTupThenGetReturnValue!81 lt!64705 (_1!1295 (tuple2!2569 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1295 (tuple2!2569 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!37699 (= lt!64705 (insertStrictlySorted!84 (toList!854 (getCurrentListMap!535 (_keys!4493 newMap!16) (_values!2747 newMap!16) (mask!7010 newMap!16) (extraKeys!2549 newMap!16) (zeroValue!2629 newMap!16) (minValue!2629 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2764 newMap!16))) (_1!1295 (tuple2!2569 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1295 (tuple2!2569 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!37699 (= (+!169 (getCurrentListMap!535 (_keys!4493 newMap!16) (_values!2747 newMap!16) (mask!7010 newMap!16) (extraKeys!2549 newMap!16) (zeroValue!2629 newMap!16) (minValue!2629 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2764 newMap!16)) (tuple2!2569 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!64704)))

(declare-fun b!125470 () Bool)

(declare-fun res!60760 () Bool)

(assert (=> b!125470 (=> (not res!60760) (not e!81967))))

(assert (=> b!125470 (= res!60760 (= (getValueByKey!166 (toList!854 lt!64704) (_1!1295 (tuple2!2569 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!171 (_2!1295 (tuple2!2569 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!125471 () Bool)

(assert (=> b!125471 (= e!81967 (contains!874 (toList!854 lt!64704) (tuple2!2569 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!37699 res!60759) b!125470))

(assert (= (and b!125470 res!60760) b!125471))

(declare-fun m!146049 () Bool)

(assert (=> d!37699 m!146049))

(declare-fun m!146051 () Bool)

(assert (=> d!37699 m!146051))

(declare-fun m!146053 () Bool)

(assert (=> d!37699 m!146053))

(declare-fun m!146055 () Bool)

(assert (=> d!37699 m!146055))

(declare-fun m!146057 () Bool)

(assert (=> b!125470 m!146057))

(declare-fun m!146059 () Bool)

(assert (=> b!125471 m!146059))

(assert (=> b!124771 d!37699))

(assert (=> b!124771 d!37339))

(declare-fun bm!13446 () Bool)

(declare-fun call!13449 () ListLongMap!1677)

(assert (=> bm!13446 (= call!13449 (getCurrentListMapNoExtraKeys!135 (_keys!4493 newMap!16) (array!4688 (store (arr!2220 (_values!2747 newMap!16)) (index!3231 lt!64093) (ValueCellFull!1074 (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2483 (_values!2747 newMap!16))) (mask!7010 newMap!16) (extraKeys!2549 newMap!16) (zeroValue!2629 newMap!16) (minValue!2629 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2764 newMap!16)))))

(declare-fun bm!13447 () Bool)

(declare-fun call!13455 () ListLongMap!1677)

(declare-fun c!22878 () Bool)

(declare-fun call!13450 () ListLongMap!1677)

(declare-fun call!13451 () ListLongMap!1677)

(declare-fun c!22876 () Bool)

(assert (=> bm!13447 (= call!13455 (+!169 (ite c!22878 call!13449 (ite c!22876 call!13451 call!13450)) (ite (or c!22878 c!22876) (tuple2!2569 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2629 newMap!16)) (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2629 newMap!16)))))))

(declare-fun bm!13448 () Bool)

(assert (=> bm!13448 (= call!13451 call!13449)))

(declare-fun b!125473 () Bool)

(declare-fun e!81971 () ListLongMap!1677)

(declare-fun call!13454 () ListLongMap!1677)

(assert (=> b!125473 (= e!81971 call!13454)))

(declare-fun b!125474 () Bool)

(declare-fun e!81976 () ListLongMap!1677)

(assert (=> b!125474 (= e!81976 call!13450)))

(declare-fun b!125475 () Bool)

(declare-fun e!81978 () ListLongMap!1677)

(assert (=> b!125475 (= e!81978 e!81971)))

(assert (=> b!125475 (= c!22876 (and (not (= (bvand (extraKeys!2549 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2549 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!125476 () Bool)

(declare-fun e!81979 () Bool)

(declare-fun call!13453 () Bool)

(assert (=> b!125476 (= e!81979 (not call!13453))))

(declare-fun b!125477 () Bool)

(declare-fun e!81974 () Bool)

(declare-fun e!81977 () Bool)

(assert (=> b!125477 (= e!81974 e!81977)))

(declare-fun res!60769 () Bool)

(assert (=> b!125477 (=> (not res!60769) (not e!81977))))

(declare-fun lt!64723 () ListLongMap!1677)

(assert (=> b!125477 (= res!60769 (contains!873 lt!64723 (select (arr!2219 (_keys!4493 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!125477 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2482 (_keys!4493 newMap!16))))))

(declare-fun bm!13449 () Bool)

(assert (=> bm!13449 (= call!13450 call!13451)))

(declare-fun b!125478 () Bool)

(declare-fun e!81975 () Bool)

(declare-fun call!13452 () Bool)

(assert (=> b!125478 (= e!81975 (not call!13452))))

(declare-fun b!125479 () Bool)

(declare-fun e!81973 () Unit!3867)

(declare-fun Unit!3904 () Unit!3867)

(assert (=> b!125479 (= e!81973 Unit!3904)))

(declare-fun b!125480 () Bool)

(declare-fun e!81968 () Bool)

(assert (=> b!125480 (= e!81968 (validKeyInArray!0 (select (arr!2219 (_keys!4493 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!125481 () Bool)

(declare-fun e!81969 () Bool)

(assert (=> b!125481 (= e!81975 e!81969)))

(declare-fun res!60762 () Bool)

(assert (=> b!125481 (= res!60762 call!13452)))

(assert (=> b!125481 (=> (not res!60762) (not e!81969))))

(declare-fun b!125482 () Bool)

(declare-fun lt!64719 () Unit!3867)

(assert (=> b!125482 (= e!81973 lt!64719)))

(declare-fun lt!64708 () ListLongMap!1677)

(assert (=> b!125482 (= lt!64708 (getCurrentListMapNoExtraKeys!135 (_keys!4493 newMap!16) (array!4688 (store (arr!2220 (_values!2747 newMap!16)) (index!3231 lt!64093) (ValueCellFull!1074 (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2483 (_values!2747 newMap!16))) (mask!7010 newMap!16) (extraKeys!2549 newMap!16) (zeroValue!2629 newMap!16) (minValue!2629 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2764 newMap!16)))))

(declare-fun lt!64714 () (_ BitVec 64))

(assert (=> b!125482 (= lt!64714 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!64724 () (_ BitVec 64))

(assert (=> b!125482 (= lt!64724 (select (arr!2219 (_keys!4493 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!64709 () Unit!3867)

(assert (=> b!125482 (= lt!64709 (addStillContains!86 lt!64708 lt!64714 (zeroValue!2629 newMap!16) lt!64724))))

(assert (=> b!125482 (contains!873 (+!169 lt!64708 (tuple2!2569 lt!64714 (zeroValue!2629 newMap!16))) lt!64724)))

(declare-fun lt!64726 () Unit!3867)

(assert (=> b!125482 (= lt!64726 lt!64709)))

(declare-fun lt!64727 () ListLongMap!1677)

(assert (=> b!125482 (= lt!64727 (getCurrentListMapNoExtraKeys!135 (_keys!4493 newMap!16) (array!4688 (store (arr!2220 (_values!2747 newMap!16)) (index!3231 lt!64093) (ValueCellFull!1074 (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2483 (_values!2747 newMap!16))) (mask!7010 newMap!16) (extraKeys!2549 newMap!16) (zeroValue!2629 newMap!16) (minValue!2629 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2764 newMap!16)))))

(declare-fun lt!64710 () (_ BitVec 64))

(assert (=> b!125482 (= lt!64710 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!64722 () (_ BitVec 64))

(assert (=> b!125482 (= lt!64722 (select (arr!2219 (_keys!4493 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!64720 () Unit!3867)

(assert (=> b!125482 (= lt!64720 (addApplyDifferent!86 lt!64727 lt!64710 (minValue!2629 newMap!16) lt!64722))))

(assert (=> b!125482 (= (apply!110 (+!169 lt!64727 (tuple2!2569 lt!64710 (minValue!2629 newMap!16))) lt!64722) (apply!110 lt!64727 lt!64722))))

(declare-fun lt!64725 () Unit!3867)

(assert (=> b!125482 (= lt!64725 lt!64720)))

(declare-fun lt!64718 () ListLongMap!1677)

(assert (=> b!125482 (= lt!64718 (getCurrentListMapNoExtraKeys!135 (_keys!4493 newMap!16) (array!4688 (store (arr!2220 (_values!2747 newMap!16)) (index!3231 lt!64093) (ValueCellFull!1074 (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2483 (_values!2747 newMap!16))) (mask!7010 newMap!16) (extraKeys!2549 newMap!16) (zeroValue!2629 newMap!16) (minValue!2629 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2764 newMap!16)))))

(declare-fun lt!64728 () (_ BitVec 64))

(assert (=> b!125482 (= lt!64728 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!64716 () (_ BitVec 64))

(assert (=> b!125482 (= lt!64716 (select (arr!2219 (_keys!4493 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!64729 () Unit!3867)

(assert (=> b!125482 (= lt!64729 (addApplyDifferent!86 lt!64718 lt!64728 (zeroValue!2629 newMap!16) lt!64716))))

(assert (=> b!125482 (= (apply!110 (+!169 lt!64718 (tuple2!2569 lt!64728 (zeroValue!2629 newMap!16))) lt!64716) (apply!110 lt!64718 lt!64716))))

(declare-fun lt!64721 () Unit!3867)

(assert (=> b!125482 (= lt!64721 lt!64729)))

(declare-fun lt!64715 () ListLongMap!1677)

(assert (=> b!125482 (= lt!64715 (getCurrentListMapNoExtraKeys!135 (_keys!4493 newMap!16) (array!4688 (store (arr!2220 (_values!2747 newMap!16)) (index!3231 lt!64093) (ValueCellFull!1074 (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2483 (_values!2747 newMap!16))) (mask!7010 newMap!16) (extraKeys!2549 newMap!16) (zeroValue!2629 newMap!16) (minValue!2629 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2764 newMap!16)))))

(declare-fun lt!64712 () (_ BitVec 64))

(assert (=> b!125482 (= lt!64712 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!64713 () (_ BitVec 64))

(assert (=> b!125482 (= lt!64713 (select (arr!2219 (_keys!4493 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!125482 (= lt!64719 (addApplyDifferent!86 lt!64715 lt!64712 (minValue!2629 newMap!16) lt!64713))))

(assert (=> b!125482 (= (apply!110 (+!169 lt!64715 (tuple2!2569 lt!64712 (minValue!2629 newMap!16))) lt!64713) (apply!110 lt!64715 lt!64713))))

(declare-fun b!125483 () Bool)

(declare-fun res!60767 () Bool)

(declare-fun e!81972 () Bool)

(assert (=> b!125483 (=> (not res!60767) (not e!81972))))

(assert (=> b!125483 (= res!60767 e!81975)))

(declare-fun c!22874 () Bool)

(assert (=> b!125483 (= c!22874 (not (= (bvand (extraKeys!2549 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!125484 () Bool)

(declare-fun c!22877 () Bool)

(assert (=> b!125484 (= c!22877 (and (not (= (bvand (extraKeys!2549 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2549 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!125484 (= e!81971 e!81976)))

(declare-fun b!125485 () Bool)

(assert (=> b!125485 (= e!81969 (= (apply!110 lt!64723 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2629 newMap!16)))))

(declare-fun bm!13450 () Bool)

(assert (=> bm!13450 (= call!13452 (contains!873 lt!64723 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!125486 () Bool)

(assert (=> b!125486 (= e!81978 (+!169 call!13455 (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2629 newMap!16))))))

(declare-fun b!125472 () Bool)

(assert (=> b!125472 (= e!81977 (= (apply!110 lt!64723 (select (arr!2219 (_keys!4493 newMap!16)) #b00000000000000000000000000000000)) (get!1436 (select (arr!2220 (array!4688 (store (arr!2220 (_values!2747 newMap!16)) (index!3231 lt!64093) (ValueCellFull!1074 (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2483 (_values!2747 newMap!16)))) #b00000000000000000000000000000000) (dynLambda!411 (defaultEntry!2764 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!125472 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2483 (array!4688 (store (arr!2220 (_values!2747 newMap!16)) (index!3231 lt!64093) (ValueCellFull!1074 (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2483 (_values!2747 newMap!16))))))))

(assert (=> b!125472 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2482 (_keys!4493 newMap!16))))))

(declare-fun d!37701 () Bool)

(assert (=> d!37701 e!81972))

(declare-fun res!60763 () Bool)

(assert (=> d!37701 (=> (not res!60763) (not e!81972))))

(assert (=> d!37701 (= res!60763 (or (bvsge #b00000000000000000000000000000000 (size!2482 (_keys!4493 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2482 (_keys!4493 newMap!16))))))))

(declare-fun lt!64711 () ListLongMap!1677)

(assert (=> d!37701 (= lt!64723 lt!64711)))

(declare-fun lt!64717 () Unit!3867)

(assert (=> d!37701 (= lt!64717 e!81973)))

(declare-fun c!22875 () Bool)

(declare-fun e!81970 () Bool)

(assert (=> d!37701 (= c!22875 e!81970)))

(declare-fun res!60764 () Bool)

(assert (=> d!37701 (=> (not res!60764) (not e!81970))))

(assert (=> d!37701 (= res!60764 (bvslt #b00000000000000000000000000000000 (size!2482 (_keys!4493 newMap!16))))))

(assert (=> d!37701 (= lt!64711 e!81978)))

(assert (=> d!37701 (= c!22878 (and (not (= (bvand (extraKeys!2549 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2549 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!37701 (validMask!0 (mask!7010 newMap!16))))

(assert (=> d!37701 (= (getCurrentListMap!535 (_keys!4493 newMap!16) (array!4688 (store (arr!2220 (_values!2747 newMap!16)) (index!3231 lt!64093) (ValueCellFull!1074 (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2483 (_values!2747 newMap!16))) (mask!7010 newMap!16) (extraKeys!2549 newMap!16) (zeroValue!2629 newMap!16) (minValue!2629 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2764 newMap!16)) lt!64723)))

(declare-fun bm!13451 () Bool)

(assert (=> bm!13451 (= call!13454 call!13455)))

(declare-fun b!125487 () Bool)

(assert (=> b!125487 (= e!81972 e!81979)))

(declare-fun c!22873 () Bool)

(assert (=> b!125487 (= c!22873 (not (= (bvand (extraKeys!2549 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!13452 () Bool)

(assert (=> bm!13452 (= call!13453 (contains!873 lt!64723 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!125488 () Bool)

(assert (=> b!125488 (= e!81970 (validKeyInArray!0 (select (arr!2219 (_keys!4493 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!125489 () Bool)

(declare-fun e!81980 () Bool)

(assert (=> b!125489 (= e!81979 e!81980)))

(declare-fun res!60768 () Bool)

(assert (=> b!125489 (= res!60768 call!13453)))

(assert (=> b!125489 (=> (not res!60768) (not e!81980))))

(declare-fun b!125490 () Bool)

(declare-fun res!60765 () Bool)

(assert (=> b!125490 (=> (not res!60765) (not e!81972))))

(assert (=> b!125490 (= res!60765 e!81974)))

(declare-fun res!60761 () Bool)

(assert (=> b!125490 (=> res!60761 e!81974)))

(assert (=> b!125490 (= res!60761 (not e!81968))))

(declare-fun res!60766 () Bool)

(assert (=> b!125490 (=> (not res!60766) (not e!81968))))

(assert (=> b!125490 (= res!60766 (bvslt #b00000000000000000000000000000000 (size!2482 (_keys!4493 newMap!16))))))

(declare-fun b!125491 () Bool)

(assert (=> b!125491 (= e!81976 call!13454)))

(declare-fun b!125492 () Bool)

(assert (=> b!125492 (= e!81980 (= (apply!110 lt!64723 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2629 newMap!16)))))

(assert (= (and d!37701 c!22878) b!125486))

(assert (= (and d!37701 (not c!22878)) b!125475))

(assert (= (and b!125475 c!22876) b!125473))

(assert (= (and b!125475 (not c!22876)) b!125484))

(assert (= (and b!125484 c!22877) b!125491))

(assert (= (and b!125484 (not c!22877)) b!125474))

(assert (= (or b!125491 b!125474) bm!13449))

(assert (= (or b!125473 bm!13449) bm!13448))

(assert (= (or b!125473 b!125491) bm!13451))

(assert (= (or b!125486 bm!13448) bm!13446))

(assert (= (or b!125486 bm!13451) bm!13447))

(assert (= (and d!37701 res!60764) b!125488))

(assert (= (and d!37701 c!22875) b!125482))

(assert (= (and d!37701 (not c!22875)) b!125479))

(assert (= (and d!37701 res!60763) b!125490))

(assert (= (and b!125490 res!60766) b!125480))

(assert (= (and b!125490 (not res!60761)) b!125477))

(assert (= (and b!125477 res!60769) b!125472))

(assert (= (and b!125490 res!60765) b!125483))

(assert (= (and b!125483 c!22874) b!125481))

(assert (= (and b!125483 (not c!22874)) b!125478))

(assert (= (and b!125481 res!60762) b!125485))

(assert (= (or b!125481 b!125478) bm!13450))

(assert (= (and b!125483 res!60767) b!125487))

(assert (= (and b!125487 c!22873) b!125489))

(assert (= (and b!125487 (not c!22873)) b!125476))

(assert (= (and b!125489 res!60768) b!125492))

(assert (= (or b!125489 b!125476) bm!13452))

(declare-fun b_lambda!5509 () Bool)

(assert (=> (not b_lambda!5509) (not b!125472)))

(assert (=> b!125472 t!6029))

(declare-fun b_and!7723 () Bool)

(assert (= b_and!7719 (and (=> t!6029 result!3819) b_and!7723)))

(assert (=> b!125472 t!6031))

(declare-fun b_and!7725 () Bool)

(assert (= b_and!7721 (and (=> t!6031 result!3821) b_and!7725)))

(assert (=> b!125488 m!144619))

(assert (=> b!125488 m!144619))

(assert (=> b!125488 m!144629))

(declare-fun m!146061 () Bool)

(assert (=> b!125472 m!146061))

(assert (=> b!125472 m!144721))

(declare-fun m!146063 () Bool)

(assert (=> b!125472 m!146063))

(assert (=> b!125472 m!144619))

(assert (=> b!125472 m!144721))

(assert (=> b!125472 m!144619))

(declare-fun m!146065 () Bool)

(assert (=> b!125472 m!146065))

(assert (=> b!125472 m!146061))

(assert (=> b!125480 m!144619))

(assert (=> b!125480 m!144619))

(assert (=> b!125480 m!144629))

(declare-fun m!146067 () Bool)

(assert (=> b!125482 m!146067))

(declare-fun m!146069 () Bool)

(assert (=> b!125482 m!146069))

(declare-fun m!146071 () Bool)

(assert (=> b!125482 m!146071))

(declare-fun m!146073 () Bool)

(assert (=> b!125482 m!146073))

(assert (=> b!125482 m!144619))

(declare-fun m!146075 () Bool)

(assert (=> b!125482 m!146075))

(declare-fun m!146077 () Bool)

(assert (=> b!125482 m!146077))

(declare-fun m!146079 () Bool)

(assert (=> b!125482 m!146079))

(assert (=> b!125482 m!146079))

(declare-fun m!146081 () Bool)

(assert (=> b!125482 m!146081))

(declare-fun m!146083 () Bool)

(assert (=> b!125482 m!146083))

(declare-fun m!146085 () Bool)

(assert (=> b!125482 m!146085))

(assert (=> b!125482 m!146073))

(declare-fun m!146087 () Bool)

(assert (=> b!125482 m!146087))

(declare-fun m!146089 () Bool)

(assert (=> b!125482 m!146089))

(declare-fun m!146091 () Bool)

(assert (=> b!125482 m!146091))

(declare-fun m!146093 () Bool)

(assert (=> b!125482 m!146093))

(assert (=> b!125482 m!146083))

(declare-fun m!146095 () Bool)

(assert (=> b!125482 m!146095))

(assert (=> b!125482 m!146069))

(declare-fun m!146097 () Bool)

(assert (=> b!125482 m!146097))

(assert (=> b!125477 m!144619))

(assert (=> b!125477 m!144619))

(declare-fun m!146099 () Bool)

(assert (=> b!125477 m!146099))

(declare-fun m!146101 () Bool)

(assert (=> b!125486 m!146101))

(declare-fun m!146103 () Bool)

(assert (=> b!125492 m!146103))

(declare-fun m!146105 () Bool)

(assert (=> bm!13450 m!146105))

(assert (=> bm!13446 m!146095))

(declare-fun m!146107 () Bool)

(assert (=> bm!13452 m!146107))

(declare-fun m!146109 () Bool)

(assert (=> b!125485 m!146109))

(declare-fun m!146111 () Bool)

(assert (=> bm!13447 m!146111))

(assert (=> d!37701 m!144633))

(assert (=> b!124771 d!37701))

(assert (=> d!37319 d!37321))

(assert (=> d!37319 d!37323))

(declare-fun d!37703 () Bool)

(assert (=> d!37703 (isDefined!119 (getValueByKey!166 (toList!854 lt!63941) (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355)))))

(assert (=> d!37703 true))

(declare-fun _$12!387 () Unit!3867)

(assert (=> d!37703 (= (choose!748 (toList!854 lt!63941) (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355)) _$12!387)))

(declare-fun bs!5196 () Bool)

(assert (= bs!5196 d!37703))

(assert (=> bs!5196 m!144415))

(assert (=> bs!5196 m!144553))

(assert (=> bs!5196 m!144553))

(assert (=> bs!5196 m!144555))

(assert (=> d!37319 d!37703))

(declare-fun d!37705 () Bool)

(declare-fun res!60774 () Bool)

(declare-fun e!81985 () Bool)

(assert (=> d!37705 (=> res!60774 e!81985)))

(assert (=> d!37705 (= res!60774 (or ((_ is Nil!1692) (toList!854 lt!63941)) ((_ is Nil!1692) (t!6022 (toList!854 lt!63941)))))))

(assert (=> d!37705 (= (isStrictlySorted!316 (toList!854 lt!63941)) e!81985)))

(declare-fun b!125497 () Bool)

(declare-fun e!81986 () Bool)

(assert (=> b!125497 (= e!81985 e!81986)))

(declare-fun res!60775 () Bool)

(assert (=> b!125497 (=> (not res!60775) (not e!81986))))

(assert (=> b!125497 (= res!60775 (bvslt (_1!1295 (h!2292 (toList!854 lt!63941))) (_1!1295 (h!2292 (t!6022 (toList!854 lt!63941))))))))

(declare-fun b!125498 () Bool)

(assert (=> b!125498 (= e!81986 (isStrictlySorted!316 (t!6022 (toList!854 lt!63941))))))

(assert (= (and d!37705 (not res!60774)) b!125497))

(assert (= (and b!125497 res!60775) b!125498))

(declare-fun m!146113 () Bool)

(assert (=> b!125498 m!146113))

(assert (=> d!37319 d!37705))

(declare-fun d!37707 () Bool)

(assert (=> d!37707 (isDefined!119 (getValueByKey!166 (toList!854 (+!169 lt!63997 (tuple2!2569 lt!64003 (zeroValue!2629 (v!3108 (underlying!436 thiss!992)))))) lt!64013))))

(declare-fun lt!64730 () Unit!3867)

(assert (=> d!37707 (= lt!64730 (choose!748 (toList!854 (+!169 lt!63997 (tuple2!2569 lt!64003 (zeroValue!2629 (v!3108 (underlying!436 thiss!992)))))) lt!64013))))

(declare-fun e!81987 () Bool)

(assert (=> d!37707 e!81987))

(declare-fun res!60776 () Bool)

(assert (=> d!37707 (=> (not res!60776) (not e!81987))))

(assert (=> d!37707 (= res!60776 (isStrictlySorted!316 (toList!854 (+!169 lt!63997 (tuple2!2569 lt!64003 (zeroValue!2629 (v!3108 (underlying!436 thiss!992))))))))))

(assert (=> d!37707 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!118 (toList!854 (+!169 lt!63997 (tuple2!2569 lt!64003 (zeroValue!2629 (v!3108 (underlying!436 thiss!992)))))) lt!64013) lt!64730)))

(declare-fun b!125499 () Bool)

(assert (=> b!125499 (= e!81987 (containsKey!170 (toList!854 (+!169 lt!63997 (tuple2!2569 lt!64003 (zeroValue!2629 (v!3108 (underlying!436 thiss!992)))))) lt!64013))))

(assert (= (and d!37707 res!60776) b!125499))

(assert (=> d!37707 m!145057))

(assert (=> d!37707 m!145057))

(assert (=> d!37707 m!145059))

(declare-fun m!146115 () Bool)

(assert (=> d!37707 m!146115))

(declare-fun m!146117 () Bool)

(assert (=> d!37707 m!146117))

(assert (=> b!125499 m!145053))

(assert (=> b!124960 d!37707))

(declare-fun d!37709 () Bool)

(assert (=> d!37709 (= (isDefined!119 (getValueByKey!166 (toList!854 (+!169 lt!63997 (tuple2!2569 lt!64003 (zeroValue!2629 (v!3108 (underlying!436 thiss!992)))))) lt!64013)) (not (isEmpty!393 (getValueByKey!166 (toList!854 (+!169 lt!63997 (tuple2!2569 lt!64003 (zeroValue!2629 (v!3108 (underlying!436 thiss!992)))))) lt!64013))))))

(declare-fun bs!5197 () Bool)

(assert (= bs!5197 d!37709))

(assert (=> bs!5197 m!145057))

(declare-fun m!146119 () Bool)

(assert (=> bs!5197 m!146119))

(assert (=> b!124960 d!37709))

(declare-fun c!22879 () Bool)

(declare-fun d!37711 () Bool)

(assert (=> d!37711 (= c!22879 (and ((_ is Cons!1691) (toList!854 (+!169 lt!63997 (tuple2!2569 lt!64003 (zeroValue!2629 (v!3108 (underlying!436 thiss!992))))))) (= (_1!1295 (h!2292 (toList!854 (+!169 lt!63997 (tuple2!2569 lt!64003 (zeroValue!2629 (v!3108 (underlying!436 thiss!992)))))))) lt!64013)))))

(declare-fun e!81988 () Option!172)

(assert (=> d!37711 (= (getValueByKey!166 (toList!854 (+!169 lt!63997 (tuple2!2569 lt!64003 (zeroValue!2629 (v!3108 (underlying!436 thiss!992)))))) lt!64013) e!81988)))

(declare-fun b!125500 () Bool)

(assert (=> b!125500 (= e!81988 (Some!171 (_2!1295 (h!2292 (toList!854 (+!169 lt!63997 (tuple2!2569 lt!64003 (zeroValue!2629 (v!3108 (underlying!436 thiss!992))))))))))))

(declare-fun e!81989 () Option!172)

(declare-fun b!125502 () Bool)

(assert (=> b!125502 (= e!81989 (getValueByKey!166 (t!6022 (toList!854 (+!169 lt!63997 (tuple2!2569 lt!64003 (zeroValue!2629 (v!3108 (underlying!436 thiss!992))))))) lt!64013))))

(declare-fun b!125503 () Bool)

(assert (=> b!125503 (= e!81989 None!170)))

(declare-fun b!125501 () Bool)

(assert (=> b!125501 (= e!81988 e!81989)))

(declare-fun c!22880 () Bool)

(assert (=> b!125501 (= c!22880 (and ((_ is Cons!1691) (toList!854 (+!169 lt!63997 (tuple2!2569 lt!64003 (zeroValue!2629 (v!3108 (underlying!436 thiss!992))))))) (not (= (_1!1295 (h!2292 (toList!854 (+!169 lt!63997 (tuple2!2569 lt!64003 (zeroValue!2629 (v!3108 (underlying!436 thiss!992)))))))) lt!64013))))))

(assert (= (and d!37711 c!22879) b!125500))

(assert (= (and d!37711 (not c!22879)) b!125501))

(assert (= (and b!125501 c!22880) b!125502))

(assert (= (and b!125501 (not c!22880)) b!125503))

(declare-fun m!146121 () Bool)

(assert (=> b!125502 m!146121))

(assert (=> b!124960 d!37711))

(declare-fun d!37713 () Bool)

(declare-fun e!81990 () Bool)

(assert (=> d!37713 e!81990))

(declare-fun res!60777 () Bool)

(assert (=> d!37713 (=> res!60777 e!81990)))

(declare-fun lt!64733 () Bool)

(assert (=> d!37713 (= res!60777 (not lt!64733))))

(declare-fun lt!64734 () Bool)

(assert (=> d!37713 (= lt!64733 lt!64734)))

(declare-fun lt!64731 () Unit!3867)

(declare-fun e!81991 () Unit!3867)

(assert (=> d!37713 (= lt!64731 e!81991)))

(declare-fun c!22881 () Bool)

(assert (=> d!37713 (= c!22881 lt!64734)))

(assert (=> d!37713 (= lt!64734 (containsKey!170 (toList!854 lt!64187) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!37713 (= (contains!873 lt!64187 #b1000000000000000000000000000000000000000000000000000000000000000) lt!64733)))

(declare-fun b!125504 () Bool)

(declare-fun lt!64732 () Unit!3867)

(assert (=> b!125504 (= e!81991 lt!64732)))

(assert (=> b!125504 (= lt!64732 (lemmaContainsKeyImpliesGetValueByKeyDefined!118 (toList!854 lt!64187) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!125504 (isDefined!119 (getValueByKey!166 (toList!854 lt!64187) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!125505 () Bool)

(declare-fun Unit!3905 () Unit!3867)

(assert (=> b!125505 (= e!81991 Unit!3905)))

(declare-fun b!125506 () Bool)

(assert (=> b!125506 (= e!81990 (isDefined!119 (getValueByKey!166 (toList!854 lt!64187) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!37713 c!22881) b!125504))

(assert (= (and d!37713 (not c!22881)) b!125505))

(assert (= (and d!37713 (not res!60777)) b!125506))

(declare-fun m!146123 () Bool)

(assert (=> d!37713 m!146123))

(declare-fun m!146125 () Bool)

(assert (=> b!125504 m!146125))

(assert (=> b!125504 m!145573))

(assert (=> b!125504 m!145573))

(declare-fun m!146127 () Bool)

(assert (=> b!125504 m!146127))

(assert (=> b!125506 m!145573))

(assert (=> b!125506 m!145573))

(assert (=> b!125506 m!146127))

(assert (=> bm!13356 d!37713))

(declare-fun d!37715 () Bool)

(declare-fun e!81992 () Bool)

(assert (=> d!37715 e!81992))

(declare-fun res!60778 () Bool)

(assert (=> d!37715 (=> res!60778 e!81992)))

(declare-fun lt!64737 () Bool)

(assert (=> d!37715 (= res!60778 (not lt!64737))))

(declare-fun lt!64738 () Bool)

(assert (=> d!37715 (= lt!64737 lt!64738)))

(declare-fun lt!64735 () Unit!3867)

(declare-fun e!81993 () Unit!3867)

(assert (=> d!37715 (= lt!64735 e!81993)))

(declare-fun c!22882 () Bool)

(assert (=> d!37715 (= c!22882 lt!64738)))

(assert (=> d!37715 (= lt!64738 (containsKey!170 (toList!854 lt!64339) (select (arr!2219 (_keys!4493 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> d!37715 (= (contains!873 lt!64339 (select (arr!2219 (_keys!4493 newMap!16)) #b00000000000000000000000000000000)) lt!64737)))

(declare-fun b!125507 () Bool)

(declare-fun lt!64736 () Unit!3867)

(assert (=> b!125507 (= e!81993 lt!64736)))

(assert (=> b!125507 (= lt!64736 (lemmaContainsKeyImpliesGetValueByKeyDefined!118 (toList!854 lt!64339) (select (arr!2219 (_keys!4493 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!125507 (isDefined!119 (getValueByKey!166 (toList!854 lt!64339) (select (arr!2219 (_keys!4493 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!125508 () Bool)

(declare-fun Unit!3906 () Unit!3867)

(assert (=> b!125508 (= e!81993 Unit!3906)))

(declare-fun b!125509 () Bool)

(assert (=> b!125509 (= e!81992 (isDefined!119 (getValueByKey!166 (toList!854 lt!64339) (select (arr!2219 (_keys!4493 newMap!16)) #b00000000000000000000000000000000))))))

(assert (= (and d!37715 c!22882) b!125507))

(assert (= (and d!37715 (not c!22882)) b!125508))

(assert (= (and d!37715 (not res!60778)) b!125509))

(assert (=> d!37715 m!144619))

(declare-fun m!146129 () Bool)

(assert (=> d!37715 m!146129))

(assert (=> b!125507 m!144619))

(declare-fun m!146131 () Bool)

(assert (=> b!125507 m!146131))

(assert (=> b!125507 m!144619))

(declare-fun m!146133 () Bool)

(assert (=> b!125507 m!146133))

(assert (=> b!125507 m!146133))

(declare-fun m!146135 () Bool)

(assert (=> b!125507 m!146135))

(assert (=> b!125509 m!144619))

(assert (=> b!125509 m!146133))

(assert (=> b!125509 m!146133))

(assert (=> b!125509 m!146135))

(assert (=> b!124924 d!37715))

(declare-fun d!37717 () Bool)

(assert (=> d!37717 (= (apply!110 lt!64406 #b1000000000000000000000000000000000000000000000000000000000000000) (get!1439 (getValueByKey!166 (toList!854 lt!64406) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!5198 () Bool)

(assert (= bs!5198 d!37717))

(declare-fun m!146137 () Bool)

(assert (=> bs!5198 m!146137))

(assert (=> bs!5198 m!146137))

(declare-fun m!146139 () Bool)

(assert (=> bs!5198 m!146139))

(assert (=> b!124993 d!37717))

(declare-fun d!37719 () Bool)

(declare-fun c!22883 () Bool)

(assert (=> d!37719 (= c!22883 (and ((_ is Cons!1691) (toList!854 lt!64139)) (= (_1!1295 (h!2292 (toList!854 lt!64139))) (_1!1295 (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2629 (v!3108 (underlying!436 thiss!992))))))))))

(declare-fun e!81994 () Option!172)

(assert (=> d!37719 (= (getValueByKey!166 (toList!854 lt!64139) (_1!1295 (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2629 (v!3108 (underlying!436 thiss!992)))))) e!81994)))

(declare-fun b!125510 () Bool)

(assert (=> b!125510 (= e!81994 (Some!171 (_2!1295 (h!2292 (toList!854 lt!64139)))))))

(declare-fun b!125512 () Bool)

(declare-fun e!81995 () Option!172)

(assert (=> b!125512 (= e!81995 (getValueByKey!166 (t!6022 (toList!854 lt!64139)) (_1!1295 (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2629 (v!3108 (underlying!436 thiss!992)))))))))

(declare-fun b!125513 () Bool)

(assert (=> b!125513 (= e!81995 None!170)))

(declare-fun b!125511 () Bool)

(assert (=> b!125511 (= e!81994 e!81995)))

(declare-fun c!22884 () Bool)

(assert (=> b!125511 (= c!22884 (and ((_ is Cons!1691) (toList!854 lt!64139)) (not (= (_1!1295 (h!2292 (toList!854 lt!64139))) (_1!1295 (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2629 (v!3108 (underlying!436 thiss!992)))))))))))

(assert (= (and d!37719 c!22883) b!125510))

(assert (= (and d!37719 (not c!22883)) b!125511))

(assert (= (and b!125511 c!22884) b!125512))

(assert (= (and b!125511 (not c!22884)) b!125513))

(declare-fun m!146141 () Bool)

(assert (=> b!125512 m!146141))

(assert (=> b!124717 d!37719))

(assert (=> b!124673 d!37455))

(declare-fun d!37721 () Bool)

(declare-fun res!60779 () Bool)

(declare-fun e!81996 () Bool)

(assert (=> d!37721 (=> res!60779 e!81996)))

(assert (=> d!37721 (= res!60779 (= (select (arr!2219 (_keys!4493 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355)))))

(assert (=> d!37721 (= (arrayContainsKey!0 (_keys!4493 newMap!16) (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!81996)))

(declare-fun b!125514 () Bool)

(declare-fun e!81997 () Bool)

(assert (=> b!125514 (= e!81996 e!81997)))

(declare-fun res!60780 () Bool)

(assert (=> b!125514 (=> (not res!60780) (not e!81997))))

(assert (=> b!125514 (= res!60780 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!2482 (_keys!4493 newMap!16))))))

(declare-fun b!125515 () Bool)

(assert (=> b!125515 (= e!81997 (arrayContainsKey!0 (_keys!4493 newMap!16) (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!37721 (not res!60779)) b!125514))

(assert (= (and b!125514 res!60780) b!125515))

(assert (=> d!37721 m!145161))

(assert (=> b!125515 m!144415))

(declare-fun m!146143 () Bool)

(assert (=> b!125515 m!146143))

(assert (=> b!124999 d!37721))

(assert (=> b!124927 d!37455))

(declare-fun d!37723 () Bool)

(declare-fun e!81998 () Bool)

(assert (=> d!37723 e!81998))

(declare-fun res!60781 () Bool)

(assert (=> d!37723 (=> res!60781 e!81998)))

(declare-fun lt!64741 () Bool)

(assert (=> d!37723 (= res!60781 (not lt!64741))))

(declare-fun lt!64742 () Bool)

(assert (=> d!37723 (= lt!64741 lt!64742)))

(declare-fun lt!64739 () Unit!3867)

(declare-fun e!81999 () Unit!3867)

(assert (=> d!37723 (= lt!64739 e!81999)))

(declare-fun c!22885 () Bool)

(assert (=> d!37723 (= c!22885 lt!64742)))

(assert (=> d!37723 (= lt!64742 (containsKey!170 (toList!854 lt!64158) (_1!1295 (ite (or c!22605 c!22603) (tuple2!2569 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2629 (v!3108 (underlying!436 thiss!992)))) (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2629 (v!3108 (underlying!436 thiss!992))))))))))

(assert (=> d!37723 (= (contains!873 lt!64158 (_1!1295 (ite (or c!22605 c!22603) (tuple2!2569 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2629 (v!3108 (underlying!436 thiss!992)))) (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2629 (v!3108 (underlying!436 thiss!992))))))) lt!64741)))

(declare-fun b!125516 () Bool)

(declare-fun lt!64740 () Unit!3867)

(assert (=> b!125516 (= e!81999 lt!64740)))

(assert (=> b!125516 (= lt!64740 (lemmaContainsKeyImpliesGetValueByKeyDefined!118 (toList!854 lt!64158) (_1!1295 (ite (or c!22605 c!22603) (tuple2!2569 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2629 (v!3108 (underlying!436 thiss!992)))) (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2629 (v!3108 (underlying!436 thiss!992))))))))))

(assert (=> b!125516 (isDefined!119 (getValueByKey!166 (toList!854 lt!64158) (_1!1295 (ite (or c!22605 c!22603) (tuple2!2569 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2629 (v!3108 (underlying!436 thiss!992)))) (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2629 (v!3108 (underlying!436 thiss!992))))))))))

(declare-fun b!125517 () Bool)

(declare-fun Unit!3907 () Unit!3867)

(assert (=> b!125517 (= e!81999 Unit!3907)))

(declare-fun b!125518 () Bool)

(assert (=> b!125518 (= e!81998 (isDefined!119 (getValueByKey!166 (toList!854 lt!64158) (_1!1295 (ite (or c!22605 c!22603) (tuple2!2569 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2629 (v!3108 (underlying!436 thiss!992)))) (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2629 (v!3108 (underlying!436 thiss!992)))))))))))

(assert (= (and d!37723 c!22885) b!125516))

(assert (= (and d!37723 (not c!22885)) b!125517))

(assert (= (and d!37723 (not res!60781)) b!125518))

(declare-fun m!146145 () Bool)

(assert (=> d!37723 m!146145))

(declare-fun m!146147 () Bool)

(assert (=> b!125516 m!146147))

(assert (=> b!125516 m!144695))

(assert (=> b!125516 m!144695))

(declare-fun m!146149 () Bool)

(assert (=> b!125516 m!146149))

(assert (=> b!125518 m!144695))

(assert (=> b!125518 m!144695))

(assert (=> b!125518 m!146149))

(assert (=> d!37331 d!37723))

(declare-fun d!37725 () Bool)

(declare-fun c!22886 () Bool)

(assert (=> d!37725 (= c!22886 (and ((_ is Cons!1691) lt!64159) (= (_1!1295 (h!2292 lt!64159)) (_1!1295 (ite (or c!22605 c!22603) (tuple2!2569 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2629 (v!3108 (underlying!436 thiss!992)))) (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2629 (v!3108 (underlying!436 thiss!992)))))))))))

(declare-fun e!82000 () Option!172)

(assert (=> d!37725 (= (getValueByKey!166 lt!64159 (_1!1295 (ite (or c!22605 c!22603) (tuple2!2569 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2629 (v!3108 (underlying!436 thiss!992)))) (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2629 (v!3108 (underlying!436 thiss!992))))))) e!82000)))

(declare-fun b!125519 () Bool)

(assert (=> b!125519 (= e!82000 (Some!171 (_2!1295 (h!2292 lt!64159))))))

(declare-fun b!125521 () Bool)

(declare-fun e!82001 () Option!172)

(assert (=> b!125521 (= e!82001 (getValueByKey!166 (t!6022 lt!64159) (_1!1295 (ite (or c!22605 c!22603) (tuple2!2569 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2629 (v!3108 (underlying!436 thiss!992)))) (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2629 (v!3108 (underlying!436 thiss!992))))))))))

(declare-fun b!125522 () Bool)

(assert (=> b!125522 (= e!82001 None!170)))

(declare-fun b!125520 () Bool)

(assert (=> b!125520 (= e!82000 e!82001)))

(declare-fun c!22887 () Bool)

(assert (=> b!125520 (= c!22887 (and ((_ is Cons!1691) lt!64159) (not (= (_1!1295 (h!2292 lt!64159)) (_1!1295 (ite (or c!22605 c!22603) (tuple2!2569 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2629 (v!3108 (underlying!436 thiss!992)))) (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2629 (v!3108 (underlying!436 thiss!992))))))))))))

(assert (= (and d!37725 c!22886) b!125519))

(assert (= (and d!37725 (not c!22886)) b!125520))

(assert (= (and b!125520 c!22887) b!125521))

(assert (= (and b!125520 (not c!22887)) b!125522))

(declare-fun m!146151 () Bool)

(assert (=> b!125521 m!146151))

(assert (=> d!37331 d!37725))

(declare-fun d!37727 () Bool)

(assert (=> d!37727 (= (getValueByKey!166 lt!64159 (_1!1295 (ite (or c!22605 c!22603) (tuple2!2569 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2629 (v!3108 (underlying!436 thiss!992)))) (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2629 (v!3108 (underlying!436 thiss!992))))))) (Some!171 (_2!1295 (ite (or c!22605 c!22603) (tuple2!2569 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2629 (v!3108 (underlying!436 thiss!992)))) (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2629 (v!3108 (underlying!436 thiss!992))))))))))

(declare-fun lt!64743 () Unit!3867)

(assert (=> d!37727 (= lt!64743 (choose!756 lt!64159 (_1!1295 (ite (or c!22605 c!22603) (tuple2!2569 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2629 (v!3108 (underlying!436 thiss!992)))) (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2629 (v!3108 (underlying!436 thiss!992)))))) (_2!1295 (ite (or c!22605 c!22603) (tuple2!2569 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2629 (v!3108 (underlying!436 thiss!992)))) (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2629 (v!3108 (underlying!436 thiss!992))))))))))

(declare-fun e!82002 () Bool)

(assert (=> d!37727 e!82002))

(declare-fun res!60782 () Bool)

(assert (=> d!37727 (=> (not res!60782) (not e!82002))))

(assert (=> d!37727 (= res!60782 (isStrictlySorted!316 lt!64159))))

(assert (=> d!37727 (= (lemmaContainsTupThenGetReturnValue!81 lt!64159 (_1!1295 (ite (or c!22605 c!22603) (tuple2!2569 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2629 (v!3108 (underlying!436 thiss!992)))) (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2629 (v!3108 (underlying!436 thiss!992)))))) (_2!1295 (ite (or c!22605 c!22603) (tuple2!2569 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2629 (v!3108 (underlying!436 thiss!992)))) (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2629 (v!3108 (underlying!436 thiss!992))))))) lt!64743)))

(declare-fun b!125523 () Bool)

(declare-fun res!60783 () Bool)

(assert (=> b!125523 (=> (not res!60783) (not e!82002))))

(assert (=> b!125523 (= res!60783 (containsKey!170 lt!64159 (_1!1295 (ite (or c!22605 c!22603) (tuple2!2569 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2629 (v!3108 (underlying!436 thiss!992)))) (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2629 (v!3108 (underlying!436 thiss!992))))))))))

(declare-fun b!125524 () Bool)

(assert (=> b!125524 (= e!82002 (contains!874 lt!64159 (tuple2!2569 (_1!1295 (ite (or c!22605 c!22603) (tuple2!2569 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2629 (v!3108 (underlying!436 thiss!992)))) (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2629 (v!3108 (underlying!436 thiss!992)))))) (_2!1295 (ite (or c!22605 c!22603) (tuple2!2569 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2629 (v!3108 (underlying!436 thiss!992)))) (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2629 (v!3108 (underlying!436 thiss!992)))))))))))

(assert (= (and d!37727 res!60782) b!125523))

(assert (= (and b!125523 res!60783) b!125524))

(assert (=> d!37727 m!144689))

(declare-fun m!146153 () Bool)

(assert (=> d!37727 m!146153))

(declare-fun m!146155 () Bool)

(assert (=> d!37727 m!146155))

(declare-fun m!146157 () Bool)

(assert (=> b!125523 m!146157))

(declare-fun m!146159 () Bool)

(assert (=> b!125524 m!146159))

(assert (=> d!37331 d!37727))

(declare-fun b!125525 () Bool)

(declare-fun e!82005 () List!1695)

(declare-fun call!13456 () List!1695)

(assert (=> b!125525 (= e!82005 call!13456)))

(declare-fun b!125526 () Bool)

(declare-fun e!82004 () List!1695)

(declare-fun e!82003 () List!1695)

(assert (=> b!125526 (= e!82004 e!82003)))

(declare-fun c!22890 () Bool)

(assert (=> b!125526 (= c!22890 (and ((_ is Cons!1691) (toList!854 (ite c!22605 call!13262 (ite c!22603 call!13264 call!13263)))) (= (_1!1295 (h!2292 (toList!854 (ite c!22605 call!13262 (ite c!22603 call!13264 call!13263))))) (_1!1295 (ite (or c!22605 c!22603) (tuple2!2569 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2629 (v!3108 (underlying!436 thiss!992)))) (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2629 (v!3108 (underlying!436 thiss!992)))))))))))

(declare-fun b!125527 () Bool)

(assert (=> b!125527 (= e!82005 call!13456)))

(declare-fun b!125528 () Bool)

(declare-fun call!13457 () List!1695)

(assert (=> b!125528 (= e!82003 call!13457)))

(declare-fun b!125529 () Bool)

(declare-fun res!60784 () Bool)

(declare-fun e!82006 () Bool)

(assert (=> b!125529 (=> (not res!60784) (not e!82006))))

(declare-fun lt!64744 () List!1695)

(assert (=> b!125529 (= res!60784 (containsKey!170 lt!64744 (_1!1295 (ite (or c!22605 c!22603) (tuple2!2569 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2629 (v!3108 (underlying!436 thiss!992)))) (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2629 (v!3108 (underlying!436 thiss!992))))))))))

(declare-fun bm!13453 () Bool)

(assert (=> bm!13453 (= call!13456 call!13457)))

(declare-fun d!37729 () Bool)

(assert (=> d!37729 e!82006))

(declare-fun res!60785 () Bool)

(assert (=> d!37729 (=> (not res!60785) (not e!82006))))

(assert (=> d!37729 (= res!60785 (isStrictlySorted!316 lt!64744))))

(assert (=> d!37729 (= lt!64744 e!82004)))

(declare-fun c!22888 () Bool)

(assert (=> d!37729 (= c!22888 (and ((_ is Cons!1691) (toList!854 (ite c!22605 call!13262 (ite c!22603 call!13264 call!13263)))) (bvslt (_1!1295 (h!2292 (toList!854 (ite c!22605 call!13262 (ite c!22603 call!13264 call!13263))))) (_1!1295 (ite (or c!22605 c!22603) (tuple2!2569 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2629 (v!3108 (underlying!436 thiss!992)))) (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2629 (v!3108 (underlying!436 thiss!992)))))))))))

(assert (=> d!37729 (isStrictlySorted!316 (toList!854 (ite c!22605 call!13262 (ite c!22603 call!13264 call!13263))))))

(assert (=> d!37729 (= (insertStrictlySorted!84 (toList!854 (ite c!22605 call!13262 (ite c!22603 call!13264 call!13263))) (_1!1295 (ite (or c!22605 c!22603) (tuple2!2569 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2629 (v!3108 (underlying!436 thiss!992)))) (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2629 (v!3108 (underlying!436 thiss!992)))))) (_2!1295 (ite (or c!22605 c!22603) (tuple2!2569 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2629 (v!3108 (underlying!436 thiss!992)))) (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2629 (v!3108 (underlying!436 thiss!992))))))) lt!64744)))

(declare-fun b!125530 () Bool)

(assert (=> b!125530 (= e!82006 (contains!874 lt!64744 (tuple2!2569 (_1!1295 (ite (or c!22605 c!22603) (tuple2!2569 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2629 (v!3108 (underlying!436 thiss!992)))) (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2629 (v!3108 (underlying!436 thiss!992)))))) (_2!1295 (ite (or c!22605 c!22603) (tuple2!2569 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2629 (v!3108 (underlying!436 thiss!992)))) (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2629 (v!3108 (underlying!436 thiss!992)))))))))))

(declare-fun call!13458 () List!1695)

(declare-fun bm!13454 () Bool)

(declare-fun e!82007 () List!1695)

(assert (=> bm!13454 (= call!13458 ($colon$colon!88 e!82007 (ite c!22888 (h!2292 (toList!854 (ite c!22605 call!13262 (ite c!22603 call!13264 call!13263)))) (tuple2!2569 (_1!1295 (ite (or c!22605 c!22603) (tuple2!2569 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2629 (v!3108 (underlying!436 thiss!992)))) (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2629 (v!3108 (underlying!436 thiss!992)))))) (_2!1295 (ite (or c!22605 c!22603) (tuple2!2569 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2629 (v!3108 (underlying!436 thiss!992)))) (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2629 (v!3108 (underlying!436 thiss!992))))))))))))

(declare-fun c!22891 () Bool)

(assert (=> bm!13454 (= c!22891 c!22888)))

(declare-fun b!125531 () Bool)

(declare-fun c!22889 () Bool)

(assert (=> b!125531 (= c!22889 (and ((_ is Cons!1691) (toList!854 (ite c!22605 call!13262 (ite c!22603 call!13264 call!13263)))) (bvsgt (_1!1295 (h!2292 (toList!854 (ite c!22605 call!13262 (ite c!22603 call!13264 call!13263))))) (_1!1295 (ite (or c!22605 c!22603) (tuple2!2569 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2629 (v!3108 (underlying!436 thiss!992)))) (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2629 (v!3108 (underlying!436 thiss!992)))))))))))

(assert (=> b!125531 (= e!82003 e!82005)))

(declare-fun b!125532 () Bool)

(assert (=> b!125532 (= e!82007 (insertStrictlySorted!84 (t!6022 (toList!854 (ite c!22605 call!13262 (ite c!22603 call!13264 call!13263)))) (_1!1295 (ite (or c!22605 c!22603) (tuple2!2569 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2629 (v!3108 (underlying!436 thiss!992)))) (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2629 (v!3108 (underlying!436 thiss!992)))))) (_2!1295 (ite (or c!22605 c!22603) (tuple2!2569 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2629 (v!3108 (underlying!436 thiss!992)))) (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2629 (v!3108 (underlying!436 thiss!992))))))))))

(declare-fun b!125533 () Bool)

(assert (=> b!125533 (= e!82004 call!13458)))

(declare-fun bm!13455 () Bool)

(assert (=> bm!13455 (= call!13457 call!13458)))

(declare-fun b!125534 () Bool)

(assert (=> b!125534 (= e!82007 (ite c!22890 (t!6022 (toList!854 (ite c!22605 call!13262 (ite c!22603 call!13264 call!13263)))) (ite c!22889 (Cons!1691 (h!2292 (toList!854 (ite c!22605 call!13262 (ite c!22603 call!13264 call!13263)))) (t!6022 (toList!854 (ite c!22605 call!13262 (ite c!22603 call!13264 call!13263))))) Nil!1692)))))

(assert (= (and d!37729 c!22888) b!125533))

(assert (= (and d!37729 (not c!22888)) b!125526))

(assert (= (and b!125526 c!22890) b!125528))

(assert (= (and b!125526 (not c!22890)) b!125531))

(assert (= (and b!125531 c!22889) b!125525))

(assert (= (and b!125531 (not c!22889)) b!125527))

(assert (= (or b!125525 b!125527) bm!13453))

(assert (= (or b!125528 bm!13453) bm!13455))

(assert (= (or b!125533 bm!13455) bm!13454))

(assert (= (and bm!13454 c!22891) b!125532))

(assert (= (and bm!13454 (not c!22891)) b!125534))

(assert (= (and d!37729 res!60785) b!125529))

(assert (= (and b!125529 res!60784) b!125530))

(declare-fun m!146161 () Bool)

(assert (=> b!125532 m!146161))

(declare-fun m!146163 () Bool)

(assert (=> bm!13454 m!146163))

(declare-fun m!146165 () Bool)

(assert (=> d!37729 m!146165))

(declare-fun m!146167 () Bool)

(assert (=> d!37729 m!146167))

(declare-fun m!146169 () Bool)

(assert (=> b!125529 m!146169))

(declare-fun m!146171 () Bool)

(assert (=> b!125530 m!146171))

(assert (=> d!37331 d!37729))

(declare-fun b!125535 () Bool)

(declare-fun e!82010 () Bool)

(declare-fun e!82008 () Bool)

(assert (=> b!125535 (= e!82010 e!82008)))

(declare-fun lt!64747 () (_ BitVec 64))

(assert (=> b!125535 (= lt!64747 (select (arr!2219 (_keys!4493 (_2!1296 lt!64096))) #b00000000000000000000000000000000))))

(declare-fun lt!64746 () Unit!3867)

(assert (=> b!125535 (= lt!64746 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!4493 (_2!1296 lt!64096)) lt!64747 #b00000000000000000000000000000000))))

(assert (=> b!125535 (arrayContainsKey!0 (_keys!4493 (_2!1296 lt!64096)) lt!64747 #b00000000000000000000000000000000)))

(declare-fun lt!64745 () Unit!3867)

(assert (=> b!125535 (= lt!64745 lt!64746)))

(declare-fun res!60786 () Bool)

(assert (=> b!125535 (= res!60786 (= (seekEntryOrOpen!0 (select (arr!2219 (_keys!4493 (_2!1296 lt!64096))) #b00000000000000000000000000000000) (_keys!4493 (_2!1296 lt!64096)) (mask!7010 (_2!1296 lt!64096))) (Found!269 #b00000000000000000000000000000000)))))

(assert (=> b!125535 (=> (not res!60786) (not e!82008))))

(declare-fun b!125536 () Bool)

(declare-fun call!13459 () Bool)

(assert (=> b!125536 (= e!82008 call!13459)))

(declare-fun d!37731 () Bool)

(declare-fun res!60787 () Bool)

(declare-fun e!82009 () Bool)

(assert (=> d!37731 (=> res!60787 e!82009)))

(assert (=> d!37731 (= res!60787 (bvsge #b00000000000000000000000000000000 (size!2482 (_keys!4493 (_2!1296 lt!64096)))))))

(assert (=> d!37731 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4493 (_2!1296 lt!64096)) (mask!7010 (_2!1296 lt!64096))) e!82009)))

(declare-fun bm!13456 () Bool)

(assert (=> bm!13456 (= call!13459 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!4493 (_2!1296 lt!64096)) (mask!7010 (_2!1296 lt!64096))))))

(declare-fun b!125537 () Bool)

(assert (=> b!125537 (= e!82010 call!13459)))

(declare-fun b!125538 () Bool)

(assert (=> b!125538 (= e!82009 e!82010)))

(declare-fun c!22892 () Bool)

(assert (=> b!125538 (= c!22892 (validKeyInArray!0 (select (arr!2219 (_keys!4493 (_2!1296 lt!64096))) #b00000000000000000000000000000000)))))

(assert (= (and d!37731 (not res!60787)) b!125538))

(assert (= (and b!125538 c!22892) b!125535))

(assert (= (and b!125538 (not c!22892)) b!125537))

(assert (= (and b!125535 res!60786) b!125536))

(assert (= (or b!125536 b!125537) bm!13456))

(assert (=> b!125535 m!145633))

(declare-fun m!146173 () Bool)

(assert (=> b!125535 m!146173))

(declare-fun m!146175 () Bool)

(assert (=> b!125535 m!146175))

(assert (=> b!125535 m!145633))

(declare-fun m!146177 () Bool)

(assert (=> b!125535 m!146177))

(declare-fun m!146179 () Bool)

(assert (=> bm!13456 m!146179))

(assert (=> b!125538 m!145633))

(assert (=> b!125538 m!145633))

(assert (=> b!125538 m!145635))

(assert (=> b!124914 d!37731))

(declare-fun b!125539 () Bool)

(declare-fun e!82013 () Bool)

(declare-fun e!82011 () Bool)

(assert (=> b!125539 (= e!82013 e!82011)))

(declare-fun c!22893 () Bool)

(assert (=> b!125539 (= c!22893 (validKeyInArray!0 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun b!125540 () Bool)

(declare-fun e!82014 () Bool)

(assert (=> b!125540 (= e!82014 (contains!875 Nil!1693 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun b!125541 () Bool)

(declare-fun call!13460 () Bool)

(assert (=> b!125541 (= e!82011 call!13460)))

(declare-fun d!37733 () Bool)

(declare-fun res!60788 () Bool)

(declare-fun e!82012 () Bool)

(assert (=> d!37733 (=> res!60788 e!82012)))

(assert (=> d!37733 (= res!60788 (bvsge #b00000000000000000000000000000000 (size!2482 (_keys!4493 (v!3108 (underlying!436 thiss!992))))))))

(assert (=> d!37733 (= (arrayNoDuplicates!0 (_keys!4493 (v!3108 (underlying!436 thiss!992))) #b00000000000000000000000000000000 Nil!1693) e!82012)))

(declare-fun bm!13457 () Bool)

(assert (=> bm!13457 (= call!13460 (arrayNoDuplicates!0 (_keys!4493 (v!3108 (underlying!436 thiss!992))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!22893 (Cons!1692 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) #b00000000000000000000000000000000) Nil!1693) Nil!1693)))))

(declare-fun b!125542 () Bool)

(assert (=> b!125542 (= e!82012 e!82013)))

(declare-fun res!60790 () Bool)

(assert (=> b!125542 (=> (not res!60790) (not e!82013))))

(assert (=> b!125542 (= res!60790 (not e!82014))))

(declare-fun res!60789 () Bool)

(assert (=> b!125542 (=> (not res!60789) (not e!82014))))

(assert (=> b!125542 (= res!60789 (validKeyInArray!0 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun b!125543 () Bool)

(assert (=> b!125543 (= e!82011 call!13460)))

(assert (= (and d!37733 (not res!60788)) b!125542))

(assert (= (and b!125542 res!60789) b!125540))

(assert (= (and b!125542 res!60790) b!125539))

(assert (= (and b!125539 c!22893) b!125541))

(assert (= (and b!125539 (not c!22893)) b!125543))

(assert (= (or b!125541 b!125543) bm!13457))

(assert (=> b!125539 m!145235))

(assert (=> b!125539 m!145235))

(assert (=> b!125539 m!145237))

(assert (=> b!125540 m!145235))

(assert (=> b!125540 m!145235))

(declare-fun m!146181 () Bool)

(assert (=> b!125540 m!146181))

(assert (=> bm!13457 m!145235))

(declare-fun m!146183 () Bool)

(assert (=> bm!13457 m!146183))

(assert (=> b!125542 m!145235))

(assert (=> b!125542 m!145235))

(assert (=> b!125542 m!145237))

(assert (=> b!124942 d!37733))

(assert (=> d!37411 d!37403))

(assert (=> d!37411 d!37401))

(declare-fun d!37735 () Bool)

(assert (=> d!37735 (contains!873 (+!169 lt!63997 (tuple2!2569 lt!64003 (zeroValue!2629 (v!3108 (underlying!436 thiss!992))))) lt!64013)))

(assert (=> d!37735 true))

(declare-fun _$35!368 () Unit!3867)

(assert (=> d!37735 (= (choose!755 lt!63997 lt!64003 (zeroValue!2629 (v!3108 (underlying!436 thiss!992))) lt!64013) _$35!368)))

(declare-fun bs!5199 () Bool)

(assert (= bs!5199 d!37735))

(assert (=> bs!5199 m!144509))

(assert (=> bs!5199 m!144509))

(assert (=> bs!5199 m!144523))

(assert (=> d!37411 d!37735))

(declare-fun d!37737 () Bool)

(declare-fun e!82015 () Bool)

(assert (=> d!37737 e!82015))

(declare-fun res!60791 () Bool)

(assert (=> d!37737 (=> res!60791 e!82015)))

(declare-fun lt!64750 () Bool)

(assert (=> d!37737 (= res!60791 (not lt!64750))))

(declare-fun lt!64751 () Bool)

(assert (=> d!37737 (= lt!64750 lt!64751)))

(declare-fun lt!64748 () Unit!3867)

(declare-fun e!82016 () Unit!3867)

(assert (=> d!37737 (= lt!64748 e!82016)))

(declare-fun c!22894 () Bool)

(assert (=> d!37737 (= c!22894 lt!64751)))

(assert (=> d!37737 (= lt!64751 (containsKey!170 (toList!854 lt!63997) lt!64013))))

(assert (=> d!37737 (= (contains!873 lt!63997 lt!64013) lt!64750)))

(declare-fun b!125545 () Bool)

(declare-fun lt!64749 () Unit!3867)

(assert (=> b!125545 (= e!82016 lt!64749)))

(assert (=> b!125545 (= lt!64749 (lemmaContainsKeyImpliesGetValueByKeyDefined!118 (toList!854 lt!63997) lt!64013))))

(assert (=> b!125545 (isDefined!119 (getValueByKey!166 (toList!854 lt!63997) lt!64013))))

(declare-fun b!125546 () Bool)

(declare-fun Unit!3908 () Unit!3867)

(assert (=> b!125546 (= e!82016 Unit!3908)))

(declare-fun b!125547 () Bool)

(assert (=> b!125547 (= e!82015 (isDefined!119 (getValueByKey!166 (toList!854 lt!63997) lt!64013)))))

(assert (= (and d!37737 c!22894) b!125545))

(assert (= (and d!37737 (not c!22894)) b!125546))

(assert (= (and d!37737 (not res!60791)) b!125547))

(declare-fun m!146185 () Bool)

(assert (=> d!37737 m!146185))

(declare-fun m!146187 () Bool)

(assert (=> b!125545 m!146187))

(declare-fun m!146189 () Bool)

(assert (=> b!125545 m!146189))

(assert (=> b!125545 m!146189))

(declare-fun m!146191 () Bool)

(assert (=> b!125545 m!146191))

(assert (=> b!125547 m!146189))

(assert (=> b!125547 m!146189))

(assert (=> b!125547 m!146191))

(assert (=> d!37411 d!37737))

(declare-fun d!37739 () Bool)

(assert (=> d!37739 (contains!873 (+!169 lt!64391 (tuple2!2569 lt!64397 (ite (and c!22645 c!22640) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2629 newMap!16)))) lt!64407)))

(declare-fun lt!64752 () Unit!3867)

(assert (=> d!37739 (= lt!64752 (choose!755 lt!64391 lt!64397 (ite (and c!22645 c!22640) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2629 newMap!16)) lt!64407))))

(assert (=> d!37739 (contains!873 lt!64391 lt!64407)))

(assert (=> d!37739 (= (addStillContains!86 lt!64391 lt!64397 (ite (and c!22645 c!22640) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2629 newMap!16)) lt!64407) lt!64752)))

(declare-fun bs!5200 () Bool)

(assert (= bs!5200 d!37739))

(assert (=> bs!5200 m!145113))

(assert (=> bs!5200 m!145113))

(assert (=> bs!5200 m!145127))

(declare-fun m!146193 () Bool)

(assert (=> bs!5200 m!146193))

(declare-fun m!146195 () Bool)

(assert (=> bs!5200 m!146195))

(assert (=> b!124983 d!37739))

(declare-fun d!37741 () Bool)

(declare-fun e!82017 () Bool)

(assert (=> d!37741 e!82017))

(declare-fun res!60792 () Bool)

(assert (=> d!37741 (=> (not res!60792) (not e!82017))))

(declare-fun lt!64753 () ListLongMap!1677)

(assert (=> d!37741 (= res!60792 (contains!873 lt!64753 (_1!1295 (tuple2!2569 lt!64395 (minValue!2629 newMap!16)))))))

(declare-fun lt!64754 () List!1695)

(assert (=> d!37741 (= lt!64753 (ListLongMap!1678 lt!64754))))

(declare-fun lt!64756 () Unit!3867)

(declare-fun lt!64755 () Unit!3867)

(assert (=> d!37741 (= lt!64756 lt!64755)))

(assert (=> d!37741 (= (getValueByKey!166 lt!64754 (_1!1295 (tuple2!2569 lt!64395 (minValue!2629 newMap!16)))) (Some!171 (_2!1295 (tuple2!2569 lt!64395 (minValue!2629 newMap!16)))))))

(assert (=> d!37741 (= lt!64755 (lemmaContainsTupThenGetReturnValue!81 lt!64754 (_1!1295 (tuple2!2569 lt!64395 (minValue!2629 newMap!16))) (_2!1295 (tuple2!2569 lt!64395 (minValue!2629 newMap!16)))))))

(assert (=> d!37741 (= lt!64754 (insertStrictlySorted!84 (toList!854 lt!64398) (_1!1295 (tuple2!2569 lt!64395 (minValue!2629 newMap!16))) (_2!1295 (tuple2!2569 lt!64395 (minValue!2629 newMap!16)))))))

(assert (=> d!37741 (= (+!169 lt!64398 (tuple2!2569 lt!64395 (minValue!2629 newMap!16))) lt!64753)))

(declare-fun b!125548 () Bool)

(declare-fun res!60793 () Bool)

(assert (=> b!125548 (=> (not res!60793) (not e!82017))))

(assert (=> b!125548 (= res!60793 (= (getValueByKey!166 (toList!854 lt!64753) (_1!1295 (tuple2!2569 lt!64395 (minValue!2629 newMap!16)))) (Some!171 (_2!1295 (tuple2!2569 lt!64395 (minValue!2629 newMap!16))))))))

(declare-fun b!125549 () Bool)

(assert (=> b!125549 (= e!82017 (contains!874 (toList!854 lt!64753) (tuple2!2569 lt!64395 (minValue!2629 newMap!16))))))

(assert (= (and d!37741 res!60792) b!125548))

(assert (= (and b!125548 res!60793) b!125549))

(declare-fun m!146197 () Bool)

(assert (=> d!37741 m!146197))

(declare-fun m!146199 () Bool)

(assert (=> d!37741 m!146199))

(declare-fun m!146201 () Bool)

(assert (=> d!37741 m!146201))

(declare-fun m!146203 () Bool)

(assert (=> d!37741 m!146203))

(declare-fun m!146205 () Bool)

(assert (=> b!125548 m!146205))

(declare-fun m!146207 () Bool)

(assert (=> b!125549 m!146207))

(assert (=> b!124983 d!37741))

(declare-fun d!37743 () Bool)

(assert (=> d!37743 (= (apply!110 (+!169 lt!64401 (tuple2!2569 lt!64411 (ite (and c!22645 c!22640) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2629 newMap!16)))) lt!64399) (apply!110 lt!64401 lt!64399))))

(declare-fun lt!64757 () Unit!3867)

(assert (=> d!37743 (= lt!64757 (choose!754 lt!64401 lt!64411 (ite (and c!22645 c!22640) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2629 newMap!16)) lt!64399))))

(declare-fun e!82018 () Bool)

(assert (=> d!37743 e!82018))

(declare-fun res!60794 () Bool)

(assert (=> d!37743 (=> (not res!60794) (not e!82018))))

(assert (=> d!37743 (= res!60794 (contains!873 lt!64401 lt!64399))))

(assert (=> d!37743 (= (addApplyDifferent!86 lt!64401 lt!64411 (ite (and c!22645 c!22640) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2629 newMap!16)) lt!64399) lt!64757)))

(declare-fun b!125550 () Bool)

(assert (=> b!125550 (= e!82018 (not (= lt!64399 lt!64411)))))

(assert (= (and d!37743 res!60794) b!125550))

(assert (=> d!37743 m!145123))

(declare-fun m!146209 () Bool)

(assert (=> d!37743 m!146209))

(assert (=> d!37743 m!145117))

(assert (=> d!37743 m!145123))

(assert (=> d!37743 m!145125))

(declare-fun m!146211 () Bool)

(assert (=> d!37743 m!146211))

(assert (=> b!124983 d!37743))

(declare-fun d!37745 () Bool)

(declare-fun e!82019 () Bool)

(assert (=> d!37745 e!82019))

(declare-fun res!60795 () Bool)

(assert (=> d!37745 (=> (not res!60795) (not e!82019))))

(declare-fun lt!64758 () ListLongMap!1677)

(assert (=> d!37745 (= res!60795 (contains!873 lt!64758 (_1!1295 (tuple2!2569 lt!64393 (minValue!2629 newMap!16)))))))

(declare-fun lt!64759 () List!1695)

(assert (=> d!37745 (= lt!64758 (ListLongMap!1678 lt!64759))))

(declare-fun lt!64761 () Unit!3867)

(declare-fun lt!64760 () Unit!3867)

(assert (=> d!37745 (= lt!64761 lt!64760)))

(assert (=> d!37745 (= (getValueByKey!166 lt!64759 (_1!1295 (tuple2!2569 lt!64393 (minValue!2629 newMap!16)))) (Some!171 (_2!1295 (tuple2!2569 lt!64393 (minValue!2629 newMap!16)))))))

(assert (=> d!37745 (= lt!64760 (lemmaContainsTupThenGetReturnValue!81 lt!64759 (_1!1295 (tuple2!2569 lt!64393 (minValue!2629 newMap!16))) (_2!1295 (tuple2!2569 lt!64393 (minValue!2629 newMap!16)))))))

(assert (=> d!37745 (= lt!64759 (insertStrictlySorted!84 (toList!854 lt!64410) (_1!1295 (tuple2!2569 lt!64393 (minValue!2629 newMap!16))) (_2!1295 (tuple2!2569 lt!64393 (minValue!2629 newMap!16)))))))

(assert (=> d!37745 (= (+!169 lt!64410 (tuple2!2569 lt!64393 (minValue!2629 newMap!16))) lt!64758)))

(declare-fun b!125551 () Bool)

(declare-fun res!60796 () Bool)

(assert (=> b!125551 (=> (not res!60796) (not e!82019))))

(assert (=> b!125551 (= res!60796 (= (getValueByKey!166 (toList!854 lt!64758) (_1!1295 (tuple2!2569 lt!64393 (minValue!2629 newMap!16)))) (Some!171 (_2!1295 (tuple2!2569 lt!64393 (minValue!2629 newMap!16))))))))

(declare-fun b!125552 () Bool)

(assert (=> b!125552 (= e!82019 (contains!874 (toList!854 lt!64758) (tuple2!2569 lt!64393 (minValue!2629 newMap!16))))))

(assert (= (and d!37745 res!60795) b!125551))

(assert (= (and b!125551 res!60796) b!125552))

(declare-fun m!146213 () Bool)

(assert (=> d!37745 m!146213))

(declare-fun m!146215 () Bool)

(assert (=> d!37745 m!146215))

(declare-fun m!146217 () Bool)

(assert (=> d!37745 m!146217))

(declare-fun m!146219 () Bool)

(assert (=> d!37745 m!146219))

(declare-fun m!146221 () Bool)

(assert (=> b!125551 m!146221))

(declare-fun m!146223 () Bool)

(assert (=> b!125552 m!146223))

(assert (=> b!124983 d!37745))

(declare-fun d!37747 () Bool)

(assert (=> d!37747 (= (apply!110 (+!169 lt!64401 (tuple2!2569 lt!64411 (ite (and c!22645 c!22640) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2629 newMap!16)))) lt!64399) (get!1439 (getValueByKey!166 (toList!854 (+!169 lt!64401 (tuple2!2569 lt!64411 (ite (and c!22645 c!22640) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2629 newMap!16))))) lt!64399)))))

(declare-fun bs!5201 () Bool)

(assert (= bs!5201 d!37747))

(declare-fun m!146225 () Bool)

(assert (=> bs!5201 m!146225))

(assert (=> bs!5201 m!146225))

(declare-fun m!146227 () Bool)

(assert (=> bs!5201 m!146227))

(assert (=> b!124983 d!37747))

(declare-fun d!37749 () Bool)

(assert (=> d!37749 (= (apply!110 lt!64410 lt!64405) (get!1439 (getValueByKey!166 (toList!854 lt!64410) lt!64405)))))

(declare-fun bs!5202 () Bool)

(assert (= bs!5202 d!37749))

(declare-fun m!146229 () Bool)

(assert (=> bs!5202 m!146229))

(assert (=> bs!5202 m!146229))

(declare-fun m!146231 () Bool)

(assert (=> bs!5202 m!146231))

(assert (=> b!124983 d!37749))

(declare-fun d!37751 () Bool)

(assert (=> d!37751 (= (apply!110 lt!64401 lt!64399) (get!1439 (getValueByKey!166 (toList!854 lt!64401) lt!64399)))))

(declare-fun bs!5203 () Bool)

(assert (= bs!5203 d!37751))

(declare-fun m!146233 () Bool)

(assert (=> bs!5203 m!146233))

(assert (=> bs!5203 m!146233))

(declare-fun m!146235 () Bool)

(assert (=> bs!5203 m!146235))

(assert (=> b!124983 d!37751))

(declare-fun d!37753 () Bool)

(assert (=> d!37753 (= (apply!110 (+!169 lt!64398 (tuple2!2569 lt!64395 (minValue!2629 newMap!16))) lt!64396) (get!1439 (getValueByKey!166 (toList!854 (+!169 lt!64398 (tuple2!2569 lt!64395 (minValue!2629 newMap!16)))) lt!64396)))))

(declare-fun bs!5204 () Bool)

(assert (= bs!5204 d!37753))

(declare-fun m!146237 () Bool)

(assert (=> bs!5204 m!146237))

(assert (=> bs!5204 m!146237))

(declare-fun m!146239 () Bool)

(assert (=> bs!5204 m!146239))

(assert (=> b!124983 d!37753))

(declare-fun d!37755 () Bool)

(declare-fun e!82020 () Bool)

(assert (=> d!37755 e!82020))

(declare-fun res!60797 () Bool)

(assert (=> d!37755 (=> res!60797 e!82020)))

(declare-fun lt!64764 () Bool)

(assert (=> d!37755 (= res!60797 (not lt!64764))))

(declare-fun lt!64765 () Bool)

(assert (=> d!37755 (= lt!64764 lt!64765)))

(declare-fun lt!64762 () Unit!3867)

(declare-fun e!82021 () Unit!3867)

(assert (=> d!37755 (= lt!64762 e!82021)))

(declare-fun c!22895 () Bool)

(assert (=> d!37755 (= c!22895 lt!64765)))

(assert (=> d!37755 (= lt!64765 (containsKey!170 (toList!854 (+!169 lt!64391 (tuple2!2569 lt!64397 (ite (and c!22645 c!22640) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2629 newMap!16))))) lt!64407))))

(assert (=> d!37755 (= (contains!873 (+!169 lt!64391 (tuple2!2569 lt!64397 (ite (and c!22645 c!22640) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2629 newMap!16)))) lt!64407) lt!64764)))

(declare-fun b!125553 () Bool)

(declare-fun lt!64763 () Unit!3867)

(assert (=> b!125553 (= e!82021 lt!64763)))

(assert (=> b!125553 (= lt!64763 (lemmaContainsKeyImpliesGetValueByKeyDefined!118 (toList!854 (+!169 lt!64391 (tuple2!2569 lt!64397 (ite (and c!22645 c!22640) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2629 newMap!16))))) lt!64407))))

(assert (=> b!125553 (isDefined!119 (getValueByKey!166 (toList!854 (+!169 lt!64391 (tuple2!2569 lt!64397 (ite (and c!22645 c!22640) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2629 newMap!16))))) lt!64407))))

(declare-fun b!125554 () Bool)

(declare-fun Unit!3909 () Unit!3867)

(assert (=> b!125554 (= e!82021 Unit!3909)))

(declare-fun b!125555 () Bool)

(assert (=> b!125555 (= e!82020 (isDefined!119 (getValueByKey!166 (toList!854 (+!169 lt!64391 (tuple2!2569 lt!64397 (ite (and c!22645 c!22640) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2629 newMap!16))))) lt!64407)))))

(assert (= (and d!37755 c!22895) b!125553))

(assert (= (and d!37755 (not c!22895)) b!125554))

(assert (= (and d!37755 (not res!60797)) b!125555))

(declare-fun m!146241 () Bool)

(assert (=> d!37755 m!146241))

(declare-fun m!146243 () Bool)

(assert (=> b!125553 m!146243))

(declare-fun m!146245 () Bool)

(assert (=> b!125553 m!146245))

(assert (=> b!125553 m!146245))

(declare-fun m!146247 () Bool)

(assert (=> b!125553 m!146247))

(assert (=> b!125555 m!146245))

(assert (=> b!125555 m!146245))

(assert (=> b!125555 m!146247))

(assert (=> b!124983 d!37755))

(declare-fun b!125556 () Bool)

(declare-fun res!60798 () Bool)

(declare-fun e!82023 () Bool)

(assert (=> b!125556 (=> (not res!60798) (not e!82023))))

(declare-fun lt!64770 () ListLongMap!1677)

(assert (=> b!125556 (= res!60798 (not (contains!873 lt!64770 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun call!13461 () ListLongMap!1677)

(declare-fun bm!13458 () Bool)

(assert (=> bm!13458 (= call!13461 (getCurrentListMapNoExtraKeys!135 (_keys!4493 newMap!16) (ite c!22645 (_values!2747 newMap!16) lt!64109) (mask!7010 newMap!16) (ite (and c!22645 c!22640) lt!64087 (extraKeys!2549 newMap!16)) (ite (and c!22645 c!22640) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2629 newMap!16)) (minValue!2629 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!2764 newMap!16)))))

(declare-fun b!125557 () Bool)

(declare-fun e!82022 () Bool)

(declare-fun e!82026 () Bool)

(assert (=> b!125557 (= e!82022 e!82026)))

(assert (=> b!125557 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2482 (_keys!4493 newMap!16))))))

(declare-fun res!60800 () Bool)

(assert (=> b!125557 (= res!60800 (contains!873 lt!64770 (select (arr!2219 (_keys!4493 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!125557 (=> (not res!60800) (not e!82026))))

(declare-fun b!125558 () Bool)

(assert (=> b!125558 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2482 (_keys!4493 newMap!16))))))

(assert (=> b!125558 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2483 (ite c!22645 (_values!2747 newMap!16) lt!64109))))))

(assert (=> b!125558 (= e!82026 (= (apply!110 lt!64770 (select (arr!2219 (_keys!4493 newMap!16)) #b00000000000000000000000000000000)) (get!1436 (select (arr!2220 (ite c!22645 (_values!2747 newMap!16) lt!64109)) #b00000000000000000000000000000000) (dynLambda!411 (defaultEntry!2764 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!37757 () Bool)

(assert (=> d!37757 e!82023))

(declare-fun res!60801 () Bool)

(assert (=> d!37757 (=> (not res!60801) (not e!82023))))

(assert (=> d!37757 (= res!60801 (not (contains!873 lt!64770 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!82024 () ListLongMap!1677)

(assert (=> d!37757 (= lt!64770 e!82024)))

(declare-fun c!22896 () Bool)

(assert (=> d!37757 (= c!22896 (bvsge #b00000000000000000000000000000000 (size!2482 (_keys!4493 newMap!16))))))

(assert (=> d!37757 (validMask!0 (mask!7010 newMap!16))))

(assert (=> d!37757 (= (getCurrentListMapNoExtraKeys!135 (_keys!4493 newMap!16) (ite c!22645 (_values!2747 newMap!16) lt!64109) (mask!7010 newMap!16) (ite (and c!22645 c!22640) lt!64087 (extraKeys!2549 newMap!16)) (ite (and c!22645 c!22640) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2629 newMap!16)) (minValue!2629 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2764 newMap!16)) lt!64770)))

(declare-fun b!125559 () Bool)

(declare-fun e!82027 () Bool)

(assert (=> b!125559 (= e!82027 (validKeyInArray!0 (select (arr!2219 (_keys!4493 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!125559 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!125560 () Bool)

(assert (=> b!125560 (= e!82023 e!82022)))

(declare-fun c!22899 () Bool)

(assert (=> b!125560 (= c!22899 e!82027)))

(declare-fun res!60799 () Bool)

(assert (=> b!125560 (=> (not res!60799) (not e!82027))))

(assert (=> b!125560 (= res!60799 (bvslt #b00000000000000000000000000000000 (size!2482 (_keys!4493 newMap!16))))))

(declare-fun b!125561 () Bool)

(declare-fun e!82025 () Bool)

(assert (=> b!125561 (= e!82025 (isEmpty!394 lt!64770))))

(declare-fun b!125562 () Bool)

(declare-fun e!82028 () ListLongMap!1677)

(assert (=> b!125562 (= e!82028 call!13461)))

(declare-fun b!125563 () Bool)

(assert (=> b!125563 (= e!82024 (ListLongMap!1678 Nil!1692))))

(declare-fun b!125564 () Bool)

(declare-fun lt!64772 () Unit!3867)

(declare-fun lt!64766 () Unit!3867)

(assert (=> b!125564 (= lt!64772 lt!64766)))

(declare-fun lt!64767 () ListLongMap!1677)

(declare-fun lt!64771 () V!3427)

(declare-fun lt!64768 () (_ BitVec 64))

(declare-fun lt!64769 () (_ BitVec 64))

(assert (=> b!125564 (not (contains!873 (+!169 lt!64767 (tuple2!2569 lt!64768 lt!64771)) lt!64769))))

(assert (=> b!125564 (= lt!64766 (addStillNotContains!55 lt!64767 lt!64768 lt!64771 lt!64769))))

(assert (=> b!125564 (= lt!64769 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!125564 (= lt!64771 (get!1436 (select (arr!2220 (ite c!22645 (_values!2747 newMap!16) lt!64109)) #b00000000000000000000000000000000) (dynLambda!411 (defaultEntry!2764 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!125564 (= lt!64768 (select (arr!2219 (_keys!4493 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!125564 (= lt!64767 call!13461)))

(assert (=> b!125564 (= e!82028 (+!169 call!13461 (tuple2!2569 (select (arr!2219 (_keys!4493 newMap!16)) #b00000000000000000000000000000000) (get!1436 (select (arr!2220 (ite c!22645 (_values!2747 newMap!16) lt!64109)) #b00000000000000000000000000000000) (dynLambda!411 (defaultEntry!2764 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!125565 () Bool)

(assert (=> b!125565 (= e!82024 e!82028)))

(declare-fun c!22897 () Bool)

(assert (=> b!125565 (= c!22897 (validKeyInArray!0 (select (arr!2219 (_keys!4493 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!125566 () Bool)

(assert (=> b!125566 (= e!82025 (= lt!64770 (getCurrentListMapNoExtraKeys!135 (_keys!4493 newMap!16) (ite c!22645 (_values!2747 newMap!16) lt!64109) (mask!7010 newMap!16) (ite (and c!22645 c!22640) lt!64087 (extraKeys!2549 newMap!16)) (ite (and c!22645 c!22640) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2629 newMap!16)) (minValue!2629 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!2764 newMap!16))))))

(declare-fun b!125567 () Bool)

(assert (=> b!125567 (= e!82022 e!82025)))

(declare-fun c!22898 () Bool)

(assert (=> b!125567 (= c!22898 (bvslt #b00000000000000000000000000000000 (size!2482 (_keys!4493 newMap!16))))))

(assert (= (and d!37757 c!22896) b!125563))

(assert (= (and d!37757 (not c!22896)) b!125565))

(assert (= (and b!125565 c!22897) b!125564))

(assert (= (and b!125565 (not c!22897)) b!125562))

(assert (= (or b!125564 b!125562) bm!13458))

(assert (= (and d!37757 res!60801) b!125556))

(assert (= (and b!125556 res!60798) b!125560))

(assert (= (and b!125560 res!60799) b!125559))

(assert (= (and b!125560 c!22899) b!125557))

(assert (= (and b!125560 (not c!22899)) b!125567))

(assert (= (and b!125557 res!60800) b!125558))

(assert (= (and b!125567 c!22898) b!125566))

(assert (= (and b!125567 (not c!22898)) b!125561))

(declare-fun b_lambda!5511 () Bool)

(assert (=> (not b_lambda!5511) (not b!125558)))

(assert (=> b!125558 t!6029))

(declare-fun b_and!7727 () Bool)

(assert (= b_and!7723 (and (=> t!6029 result!3819) b_and!7727)))

(assert (=> b!125558 t!6031))

(declare-fun b_and!7729 () Bool)

(assert (= b_and!7725 (and (=> t!6031 result!3821) b_and!7729)))

(declare-fun b_lambda!5513 () Bool)

(assert (=> (not b_lambda!5513) (not b!125564)))

(assert (=> b!125564 t!6029))

(declare-fun b_and!7731 () Bool)

(assert (= b_and!7727 (and (=> t!6029 result!3819) b_and!7731)))

(assert (=> b!125564 t!6031))

(declare-fun b_and!7733 () Bool)

(assert (= b_and!7729 (and (=> t!6031 result!3821) b_and!7733)))

(declare-fun m!146249 () Bool)

(assert (=> bm!13458 m!146249))

(assert (=> b!125559 m!144619))

(assert (=> b!125559 m!144619))

(assert (=> b!125559 m!144629))

(assert (=> b!125557 m!144619))

(assert (=> b!125557 m!144619))

(declare-fun m!146251 () Bool)

(assert (=> b!125557 m!146251))

(declare-fun m!146253 () Bool)

(assert (=> b!125561 m!146253))

(assert (=> b!125558 m!144619))

(declare-fun m!146255 () Bool)

(assert (=> b!125558 m!146255))

(assert (=> b!125558 m!144619))

(assert (=> b!125558 m!144721))

(assert (=> b!125558 m!145101))

(assert (=> b!125558 m!145101))

(assert (=> b!125558 m!144721))

(assert (=> b!125558 m!145103))

(declare-fun m!146257 () Bool)

(assert (=> b!125564 m!146257))

(declare-fun m!146259 () Bool)

(assert (=> b!125564 m!146259))

(assert (=> b!125564 m!145101))

(assert (=> b!125564 m!145101))

(assert (=> b!125564 m!144721))

(assert (=> b!125564 m!145103))

(assert (=> b!125564 m!144619))

(declare-fun m!146261 () Bool)

(assert (=> b!125564 m!146261))

(assert (=> b!125564 m!144721))

(assert (=> b!125564 m!146261))

(declare-fun m!146263 () Bool)

(assert (=> b!125564 m!146263))

(assert (=> b!125565 m!144619))

(assert (=> b!125565 m!144619))

(assert (=> b!125565 m!144629))

(assert (=> b!125566 m!146249))

(declare-fun m!146265 () Bool)

(assert (=> b!125556 m!146265))

(declare-fun m!146267 () Bool)

(assert (=> d!37757 m!146267))

(assert (=> d!37757 m!144633))

(assert (=> b!124983 d!37757))

(declare-fun d!37759 () Bool)

(declare-fun e!82029 () Bool)

(assert (=> d!37759 e!82029))

(declare-fun res!60802 () Bool)

(assert (=> d!37759 (=> (not res!60802) (not e!82029))))

(declare-fun lt!64773 () ListLongMap!1677)

(assert (=> d!37759 (= res!60802 (contains!873 lt!64773 (_1!1295 (tuple2!2569 lt!64397 (ite (and c!22645 c!22640) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2629 newMap!16))))))))

(declare-fun lt!64774 () List!1695)

(assert (=> d!37759 (= lt!64773 (ListLongMap!1678 lt!64774))))

(declare-fun lt!64776 () Unit!3867)

(declare-fun lt!64775 () Unit!3867)

(assert (=> d!37759 (= lt!64776 lt!64775)))

(assert (=> d!37759 (= (getValueByKey!166 lt!64774 (_1!1295 (tuple2!2569 lt!64397 (ite (and c!22645 c!22640) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2629 newMap!16))))) (Some!171 (_2!1295 (tuple2!2569 lt!64397 (ite (and c!22645 c!22640) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2629 newMap!16))))))))

(assert (=> d!37759 (= lt!64775 (lemmaContainsTupThenGetReturnValue!81 lt!64774 (_1!1295 (tuple2!2569 lt!64397 (ite (and c!22645 c!22640) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2629 newMap!16)))) (_2!1295 (tuple2!2569 lt!64397 (ite (and c!22645 c!22640) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2629 newMap!16))))))))

(assert (=> d!37759 (= lt!64774 (insertStrictlySorted!84 (toList!854 lt!64391) (_1!1295 (tuple2!2569 lt!64397 (ite (and c!22645 c!22640) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2629 newMap!16)))) (_2!1295 (tuple2!2569 lt!64397 (ite (and c!22645 c!22640) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2629 newMap!16))))))))

(assert (=> d!37759 (= (+!169 lt!64391 (tuple2!2569 lt!64397 (ite (and c!22645 c!22640) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2629 newMap!16)))) lt!64773)))

(declare-fun b!125568 () Bool)

(declare-fun res!60803 () Bool)

(assert (=> b!125568 (=> (not res!60803) (not e!82029))))

(assert (=> b!125568 (= res!60803 (= (getValueByKey!166 (toList!854 lt!64773) (_1!1295 (tuple2!2569 lt!64397 (ite (and c!22645 c!22640) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2629 newMap!16))))) (Some!171 (_2!1295 (tuple2!2569 lt!64397 (ite (and c!22645 c!22640) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2629 newMap!16)))))))))

(declare-fun b!125569 () Bool)

(assert (=> b!125569 (= e!82029 (contains!874 (toList!854 lt!64773) (tuple2!2569 lt!64397 (ite (and c!22645 c!22640) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2629 newMap!16)))))))

(assert (= (and d!37759 res!60802) b!125568))

(assert (= (and b!125568 res!60803) b!125569))

(declare-fun m!146269 () Bool)

(assert (=> d!37759 m!146269))

(declare-fun m!146271 () Bool)

(assert (=> d!37759 m!146271))

(declare-fun m!146273 () Bool)

(assert (=> d!37759 m!146273))

(declare-fun m!146275 () Bool)

(assert (=> d!37759 m!146275))

(declare-fun m!146277 () Bool)

(assert (=> b!125568 m!146277))

(declare-fun m!146279 () Bool)

(assert (=> b!125569 m!146279))

(assert (=> b!124983 d!37759))

(declare-fun d!37761 () Bool)

(assert (=> d!37761 (= (apply!110 (+!169 lt!64410 (tuple2!2569 lt!64393 (minValue!2629 newMap!16))) lt!64405) (apply!110 lt!64410 lt!64405))))

(declare-fun lt!64777 () Unit!3867)

(assert (=> d!37761 (= lt!64777 (choose!754 lt!64410 lt!64393 (minValue!2629 newMap!16) lt!64405))))

(declare-fun e!82030 () Bool)

(assert (=> d!37761 e!82030))

(declare-fun res!60804 () Bool)

(assert (=> d!37761 (=> (not res!60804) (not e!82030))))

(assert (=> d!37761 (= res!60804 (contains!873 lt!64410 lt!64405))))

(assert (=> d!37761 (= (addApplyDifferent!86 lt!64410 lt!64393 (minValue!2629 newMap!16) lt!64405) lt!64777)))

(declare-fun b!125570 () Bool)

(assert (=> b!125570 (= e!82030 (not (= lt!64405 lt!64393)))))

(assert (= (and d!37761 res!60804) b!125570))

(assert (=> d!37761 m!145119))

(declare-fun m!146281 () Bool)

(assert (=> d!37761 m!146281))

(assert (=> d!37761 m!145115))

(assert (=> d!37761 m!145119))

(assert (=> d!37761 m!145121))

(declare-fun m!146283 () Bool)

(assert (=> d!37761 m!146283))

(assert (=> b!124983 d!37761))

(declare-fun d!37763 () Bool)

(assert (=> d!37763 (= (apply!110 (+!169 lt!64398 (tuple2!2569 lt!64395 (minValue!2629 newMap!16))) lt!64396) (apply!110 lt!64398 lt!64396))))

(declare-fun lt!64778 () Unit!3867)

(assert (=> d!37763 (= lt!64778 (choose!754 lt!64398 lt!64395 (minValue!2629 newMap!16) lt!64396))))

(declare-fun e!82031 () Bool)

(assert (=> d!37763 e!82031))

(declare-fun res!60805 () Bool)

(assert (=> d!37763 (=> (not res!60805) (not e!82031))))

(assert (=> d!37763 (= res!60805 (contains!873 lt!64398 lt!64396))))

(assert (=> d!37763 (= (addApplyDifferent!86 lt!64398 lt!64395 (minValue!2629 newMap!16) lt!64396) lt!64778)))

(declare-fun b!125571 () Bool)

(assert (=> b!125571 (= e!82031 (not (= lt!64396 lt!64395)))))

(assert (= (and d!37763 res!60805) b!125571))

(assert (=> d!37763 m!145109))

(declare-fun m!146285 () Bool)

(assert (=> d!37763 m!146285))

(assert (=> d!37763 m!145107))

(assert (=> d!37763 m!145109))

(assert (=> d!37763 m!145111))

(declare-fun m!146287 () Bool)

(assert (=> d!37763 m!146287))

(assert (=> b!124983 d!37763))

(declare-fun d!37765 () Bool)

(assert (=> d!37765 (= (apply!110 lt!64398 lt!64396) (get!1439 (getValueByKey!166 (toList!854 lt!64398) lt!64396)))))

(declare-fun bs!5205 () Bool)

(assert (= bs!5205 d!37765))

(declare-fun m!146289 () Bool)

(assert (=> bs!5205 m!146289))

(assert (=> bs!5205 m!146289))

(declare-fun m!146291 () Bool)

(assert (=> bs!5205 m!146291))

(assert (=> b!124983 d!37765))

(declare-fun d!37767 () Bool)

(declare-fun e!82032 () Bool)

(assert (=> d!37767 e!82032))

(declare-fun res!60806 () Bool)

(assert (=> d!37767 (=> (not res!60806) (not e!82032))))

(declare-fun lt!64779 () ListLongMap!1677)

(assert (=> d!37767 (= res!60806 (contains!873 lt!64779 (_1!1295 (tuple2!2569 lt!64411 (ite (and c!22645 c!22640) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2629 newMap!16))))))))

(declare-fun lt!64780 () List!1695)

(assert (=> d!37767 (= lt!64779 (ListLongMap!1678 lt!64780))))

(declare-fun lt!64782 () Unit!3867)

(declare-fun lt!64781 () Unit!3867)

(assert (=> d!37767 (= lt!64782 lt!64781)))

(assert (=> d!37767 (= (getValueByKey!166 lt!64780 (_1!1295 (tuple2!2569 lt!64411 (ite (and c!22645 c!22640) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2629 newMap!16))))) (Some!171 (_2!1295 (tuple2!2569 lt!64411 (ite (and c!22645 c!22640) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2629 newMap!16))))))))

(assert (=> d!37767 (= lt!64781 (lemmaContainsTupThenGetReturnValue!81 lt!64780 (_1!1295 (tuple2!2569 lt!64411 (ite (and c!22645 c!22640) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2629 newMap!16)))) (_2!1295 (tuple2!2569 lt!64411 (ite (and c!22645 c!22640) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2629 newMap!16))))))))

(assert (=> d!37767 (= lt!64780 (insertStrictlySorted!84 (toList!854 lt!64401) (_1!1295 (tuple2!2569 lt!64411 (ite (and c!22645 c!22640) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2629 newMap!16)))) (_2!1295 (tuple2!2569 lt!64411 (ite (and c!22645 c!22640) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2629 newMap!16))))))))

(assert (=> d!37767 (= (+!169 lt!64401 (tuple2!2569 lt!64411 (ite (and c!22645 c!22640) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2629 newMap!16)))) lt!64779)))

(declare-fun b!125572 () Bool)

(declare-fun res!60807 () Bool)

(assert (=> b!125572 (=> (not res!60807) (not e!82032))))

(assert (=> b!125572 (= res!60807 (= (getValueByKey!166 (toList!854 lt!64779) (_1!1295 (tuple2!2569 lt!64411 (ite (and c!22645 c!22640) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2629 newMap!16))))) (Some!171 (_2!1295 (tuple2!2569 lt!64411 (ite (and c!22645 c!22640) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2629 newMap!16)))))))))

(declare-fun b!125573 () Bool)

(assert (=> b!125573 (= e!82032 (contains!874 (toList!854 lt!64779) (tuple2!2569 lt!64411 (ite (and c!22645 c!22640) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2629 newMap!16)))))))

(assert (= (and d!37767 res!60806) b!125572))

(assert (= (and b!125572 res!60807) b!125573))

(declare-fun m!146293 () Bool)

(assert (=> d!37767 m!146293))

(declare-fun m!146295 () Bool)

(assert (=> d!37767 m!146295))

(declare-fun m!146297 () Bool)

(assert (=> d!37767 m!146297))

(declare-fun m!146299 () Bool)

(assert (=> d!37767 m!146299))

(declare-fun m!146301 () Bool)

(assert (=> b!125572 m!146301))

(declare-fun m!146303 () Bool)

(assert (=> b!125573 m!146303))

(assert (=> b!124983 d!37767))

(declare-fun d!37769 () Bool)

(assert (=> d!37769 (= (apply!110 (+!169 lt!64410 (tuple2!2569 lt!64393 (minValue!2629 newMap!16))) lt!64405) (get!1439 (getValueByKey!166 (toList!854 (+!169 lt!64410 (tuple2!2569 lt!64393 (minValue!2629 newMap!16)))) lt!64405)))))

(declare-fun bs!5206 () Bool)

(assert (= bs!5206 d!37769))

(declare-fun m!146305 () Bool)

(assert (=> bs!5206 m!146305))

(assert (=> bs!5206 m!146305))

(declare-fun m!146307 () Bool)

(assert (=> bs!5206 m!146307))

(assert (=> b!124983 d!37769))

(declare-fun d!37771 () Bool)

(declare-fun e!82033 () Bool)

(assert (=> d!37771 e!82033))

(declare-fun res!60808 () Bool)

(assert (=> d!37771 (=> res!60808 e!82033)))

(declare-fun lt!64785 () Bool)

(assert (=> d!37771 (= res!60808 (not lt!64785))))

(declare-fun lt!64786 () Bool)

(assert (=> d!37771 (= lt!64785 lt!64786)))

(declare-fun lt!64783 () Unit!3867)

(declare-fun e!82034 () Unit!3867)

(assert (=> d!37771 (= lt!64783 e!82034)))

(declare-fun c!22900 () Bool)

(assert (=> d!37771 (= c!22900 lt!64786)))

(assert (=> d!37771 (= lt!64786 (containsKey!170 (toList!854 lt!64367) (_1!1295 (tuple2!2569 lt!64003 (zeroValue!2629 (v!3108 (underlying!436 thiss!992)))))))))

(assert (=> d!37771 (= (contains!873 lt!64367 (_1!1295 (tuple2!2569 lt!64003 (zeroValue!2629 (v!3108 (underlying!436 thiss!992)))))) lt!64785)))

(declare-fun b!125574 () Bool)

(declare-fun lt!64784 () Unit!3867)

(assert (=> b!125574 (= e!82034 lt!64784)))

(assert (=> b!125574 (= lt!64784 (lemmaContainsKeyImpliesGetValueByKeyDefined!118 (toList!854 lt!64367) (_1!1295 (tuple2!2569 lt!64003 (zeroValue!2629 (v!3108 (underlying!436 thiss!992)))))))))

(assert (=> b!125574 (isDefined!119 (getValueByKey!166 (toList!854 lt!64367) (_1!1295 (tuple2!2569 lt!64003 (zeroValue!2629 (v!3108 (underlying!436 thiss!992)))))))))

(declare-fun b!125575 () Bool)

(declare-fun Unit!3910 () Unit!3867)

(assert (=> b!125575 (= e!82034 Unit!3910)))

(declare-fun b!125576 () Bool)

(assert (=> b!125576 (= e!82033 (isDefined!119 (getValueByKey!166 (toList!854 lt!64367) (_1!1295 (tuple2!2569 lt!64003 (zeroValue!2629 (v!3108 (underlying!436 thiss!992))))))))))

(assert (= (and d!37771 c!22900) b!125574))

(assert (= (and d!37771 (not c!22900)) b!125575))

(assert (= (and d!37771 (not res!60808)) b!125576))

(declare-fun m!146309 () Bool)

(assert (=> d!37771 m!146309))

(declare-fun m!146311 () Bool)

(assert (=> b!125574 m!146311))

(assert (=> b!125574 m!145049))

(assert (=> b!125574 m!145049))

(declare-fun m!146313 () Bool)

(assert (=> b!125574 m!146313))

(assert (=> b!125576 m!145049))

(assert (=> b!125576 m!145049))

(assert (=> b!125576 m!146313))

(assert (=> d!37401 d!37771))

(declare-fun c!22901 () Bool)

(declare-fun d!37773 () Bool)

(assert (=> d!37773 (= c!22901 (and ((_ is Cons!1691) lt!64368) (= (_1!1295 (h!2292 lt!64368)) (_1!1295 (tuple2!2569 lt!64003 (zeroValue!2629 (v!3108 (underlying!436 thiss!992))))))))))

(declare-fun e!82035 () Option!172)

(assert (=> d!37773 (= (getValueByKey!166 lt!64368 (_1!1295 (tuple2!2569 lt!64003 (zeroValue!2629 (v!3108 (underlying!436 thiss!992)))))) e!82035)))

(declare-fun b!125577 () Bool)

(assert (=> b!125577 (= e!82035 (Some!171 (_2!1295 (h!2292 lt!64368))))))

(declare-fun e!82036 () Option!172)

(declare-fun b!125579 () Bool)

(assert (=> b!125579 (= e!82036 (getValueByKey!166 (t!6022 lt!64368) (_1!1295 (tuple2!2569 lt!64003 (zeroValue!2629 (v!3108 (underlying!436 thiss!992)))))))))

(declare-fun b!125580 () Bool)

(assert (=> b!125580 (= e!82036 None!170)))

(declare-fun b!125578 () Bool)

(assert (=> b!125578 (= e!82035 e!82036)))

(declare-fun c!22902 () Bool)

(assert (=> b!125578 (= c!22902 (and ((_ is Cons!1691) lt!64368) (not (= (_1!1295 (h!2292 lt!64368)) (_1!1295 (tuple2!2569 lt!64003 (zeroValue!2629 (v!3108 (underlying!436 thiss!992)))))))))))

(assert (= (and d!37773 c!22901) b!125577))

(assert (= (and d!37773 (not c!22901)) b!125578))

(assert (= (and b!125578 c!22902) b!125579))

(assert (= (and b!125578 (not c!22902)) b!125580))

(declare-fun m!146315 () Bool)

(assert (=> b!125579 m!146315))

(assert (=> d!37401 d!37773))

(declare-fun d!37775 () Bool)

(assert (=> d!37775 (= (getValueByKey!166 lt!64368 (_1!1295 (tuple2!2569 lt!64003 (zeroValue!2629 (v!3108 (underlying!436 thiss!992)))))) (Some!171 (_2!1295 (tuple2!2569 lt!64003 (zeroValue!2629 (v!3108 (underlying!436 thiss!992)))))))))

(declare-fun lt!64787 () Unit!3867)

(assert (=> d!37775 (= lt!64787 (choose!756 lt!64368 (_1!1295 (tuple2!2569 lt!64003 (zeroValue!2629 (v!3108 (underlying!436 thiss!992))))) (_2!1295 (tuple2!2569 lt!64003 (zeroValue!2629 (v!3108 (underlying!436 thiss!992)))))))))

(declare-fun e!82037 () Bool)

(assert (=> d!37775 e!82037))

(declare-fun res!60809 () Bool)

(assert (=> d!37775 (=> (not res!60809) (not e!82037))))

(assert (=> d!37775 (= res!60809 (isStrictlySorted!316 lt!64368))))

(assert (=> d!37775 (= (lemmaContainsTupThenGetReturnValue!81 lt!64368 (_1!1295 (tuple2!2569 lt!64003 (zeroValue!2629 (v!3108 (underlying!436 thiss!992))))) (_2!1295 (tuple2!2569 lt!64003 (zeroValue!2629 (v!3108 (underlying!436 thiss!992)))))) lt!64787)))

(declare-fun b!125581 () Bool)

(declare-fun res!60810 () Bool)

(assert (=> b!125581 (=> (not res!60810) (not e!82037))))

(assert (=> b!125581 (= res!60810 (containsKey!170 lt!64368 (_1!1295 (tuple2!2569 lt!64003 (zeroValue!2629 (v!3108 (underlying!436 thiss!992)))))))))

(declare-fun b!125582 () Bool)

(assert (=> b!125582 (= e!82037 (contains!874 lt!64368 (tuple2!2569 (_1!1295 (tuple2!2569 lt!64003 (zeroValue!2629 (v!3108 (underlying!436 thiss!992))))) (_2!1295 (tuple2!2569 lt!64003 (zeroValue!2629 (v!3108 (underlying!436 thiss!992))))))))))

(assert (= (and d!37775 res!60809) b!125581))

(assert (= (and b!125581 res!60810) b!125582))

(assert (=> d!37775 m!145043))

(declare-fun m!146317 () Bool)

(assert (=> d!37775 m!146317))

(declare-fun m!146319 () Bool)

(assert (=> d!37775 m!146319))

(declare-fun m!146321 () Bool)

(assert (=> b!125581 m!146321))

(declare-fun m!146323 () Bool)

(assert (=> b!125582 m!146323))

(assert (=> d!37401 d!37775))

(declare-fun b!125583 () Bool)

(declare-fun e!82040 () List!1695)

(declare-fun call!13462 () List!1695)

(assert (=> b!125583 (= e!82040 call!13462)))

(declare-fun b!125584 () Bool)

(declare-fun e!82039 () List!1695)

(declare-fun e!82038 () List!1695)

(assert (=> b!125584 (= e!82039 e!82038)))

(declare-fun c!22905 () Bool)

(assert (=> b!125584 (= c!22905 (and ((_ is Cons!1691) (toList!854 lt!63997)) (= (_1!1295 (h!2292 (toList!854 lt!63997))) (_1!1295 (tuple2!2569 lt!64003 (zeroValue!2629 (v!3108 (underlying!436 thiss!992))))))))))

(declare-fun b!125585 () Bool)

(assert (=> b!125585 (= e!82040 call!13462)))

(declare-fun b!125586 () Bool)

(declare-fun call!13463 () List!1695)

(assert (=> b!125586 (= e!82038 call!13463)))

(declare-fun b!125587 () Bool)

(declare-fun res!60811 () Bool)

(declare-fun e!82041 () Bool)

(assert (=> b!125587 (=> (not res!60811) (not e!82041))))

(declare-fun lt!64788 () List!1695)

(assert (=> b!125587 (= res!60811 (containsKey!170 lt!64788 (_1!1295 (tuple2!2569 lt!64003 (zeroValue!2629 (v!3108 (underlying!436 thiss!992)))))))))

(declare-fun bm!13459 () Bool)

(assert (=> bm!13459 (= call!13462 call!13463)))

(declare-fun d!37777 () Bool)

(assert (=> d!37777 e!82041))

(declare-fun res!60812 () Bool)

(assert (=> d!37777 (=> (not res!60812) (not e!82041))))

(assert (=> d!37777 (= res!60812 (isStrictlySorted!316 lt!64788))))

(assert (=> d!37777 (= lt!64788 e!82039)))

(declare-fun c!22903 () Bool)

(assert (=> d!37777 (= c!22903 (and ((_ is Cons!1691) (toList!854 lt!63997)) (bvslt (_1!1295 (h!2292 (toList!854 lt!63997))) (_1!1295 (tuple2!2569 lt!64003 (zeroValue!2629 (v!3108 (underlying!436 thiss!992))))))))))

(assert (=> d!37777 (isStrictlySorted!316 (toList!854 lt!63997))))

(assert (=> d!37777 (= (insertStrictlySorted!84 (toList!854 lt!63997) (_1!1295 (tuple2!2569 lt!64003 (zeroValue!2629 (v!3108 (underlying!436 thiss!992))))) (_2!1295 (tuple2!2569 lt!64003 (zeroValue!2629 (v!3108 (underlying!436 thiss!992)))))) lt!64788)))

(declare-fun b!125588 () Bool)

(assert (=> b!125588 (= e!82041 (contains!874 lt!64788 (tuple2!2569 (_1!1295 (tuple2!2569 lt!64003 (zeroValue!2629 (v!3108 (underlying!436 thiss!992))))) (_2!1295 (tuple2!2569 lt!64003 (zeroValue!2629 (v!3108 (underlying!436 thiss!992))))))))))

(declare-fun e!82042 () List!1695)

(declare-fun bm!13460 () Bool)

(declare-fun call!13464 () List!1695)

(assert (=> bm!13460 (= call!13464 ($colon$colon!88 e!82042 (ite c!22903 (h!2292 (toList!854 lt!63997)) (tuple2!2569 (_1!1295 (tuple2!2569 lt!64003 (zeroValue!2629 (v!3108 (underlying!436 thiss!992))))) (_2!1295 (tuple2!2569 lt!64003 (zeroValue!2629 (v!3108 (underlying!436 thiss!992)))))))))))

(declare-fun c!22906 () Bool)

(assert (=> bm!13460 (= c!22906 c!22903)))

(declare-fun b!125589 () Bool)

(declare-fun c!22904 () Bool)

(assert (=> b!125589 (= c!22904 (and ((_ is Cons!1691) (toList!854 lt!63997)) (bvsgt (_1!1295 (h!2292 (toList!854 lt!63997))) (_1!1295 (tuple2!2569 lt!64003 (zeroValue!2629 (v!3108 (underlying!436 thiss!992))))))))))

(assert (=> b!125589 (= e!82038 e!82040)))

(declare-fun b!125590 () Bool)

(assert (=> b!125590 (= e!82042 (insertStrictlySorted!84 (t!6022 (toList!854 lt!63997)) (_1!1295 (tuple2!2569 lt!64003 (zeroValue!2629 (v!3108 (underlying!436 thiss!992))))) (_2!1295 (tuple2!2569 lt!64003 (zeroValue!2629 (v!3108 (underlying!436 thiss!992)))))))))

(declare-fun b!125591 () Bool)

(assert (=> b!125591 (= e!82039 call!13464)))

(declare-fun bm!13461 () Bool)

(assert (=> bm!13461 (= call!13463 call!13464)))

(declare-fun b!125592 () Bool)

(assert (=> b!125592 (= e!82042 (ite c!22905 (t!6022 (toList!854 lt!63997)) (ite c!22904 (Cons!1691 (h!2292 (toList!854 lt!63997)) (t!6022 (toList!854 lt!63997))) Nil!1692)))))

(assert (= (and d!37777 c!22903) b!125591))

(assert (= (and d!37777 (not c!22903)) b!125584))

(assert (= (and b!125584 c!22905) b!125586))

(assert (= (and b!125584 (not c!22905)) b!125589))

(assert (= (and b!125589 c!22904) b!125583))

(assert (= (and b!125589 (not c!22904)) b!125585))

(assert (= (or b!125583 b!125585) bm!13459))

(assert (= (or b!125586 bm!13459) bm!13461))

(assert (= (or b!125591 bm!13461) bm!13460))

(assert (= (and bm!13460 c!22906) b!125590))

(assert (= (and bm!13460 (not c!22906)) b!125592))

(assert (= (and d!37777 res!60812) b!125587))

(assert (= (and b!125587 res!60811) b!125588))

(declare-fun m!146325 () Bool)

(assert (=> b!125590 m!146325))

(declare-fun m!146327 () Bool)

(assert (=> bm!13460 m!146327))

(declare-fun m!146329 () Bool)

(assert (=> d!37777 m!146329))

(declare-fun m!146331 () Bool)

(assert (=> d!37777 m!146331))

(declare-fun m!146333 () Bool)

(assert (=> b!125587 m!146333))

(declare-fun m!146335 () Bool)

(assert (=> b!125588 m!146335))

(assert (=> d!37401 d!37777))

(declare-fun d!37779 () Bool)

(assert (=> d!37779 (= (get!1438 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!124797 d!37779))

(declare-fun d!37781 () Bool)

(assert (=> d!37781 (isDefined!119 (getValueByKey!166 (toList!854 lt!64012) (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun lt!64789 () Unit!3867)

(assert (=> d!37781 (= lt!64789 (choose!748 (toList!854 lt!64012) (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun e!82043 () Bool)

(assert (=> d!37781 e!82043))

(declare-fun res!60813 () Bool)

(assert (=> d!37781 (=> (not res!60813) (not e!82043))))

(assert (=> d!37781 (= res!60813 (isStrictlySorted!316 (toList!854 lt!64012)))))

(assert (=> d!37781 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!118 (toList!854 lt!64012) (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) lt!64789)))

(declare-fun b!125593 () Bool)

(assert (=> b!125593 (= e!82043 (containsKey!170 (toList!854 lt!64012) (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (= (and d!37781 res!60813) b!125593))

(assert (=> d!37781 m!144493))

(assert (=> d!37781 m!144773))

(assert (=> d!37781 m!144773))

(assert (=> d!37781 m!144915))

(assert (=> d!37781 m!144493))

(declare-fun m!146337 () Bool)

(assert (=> d!37781 m!146337))

(declare-fun m!146339 () Bool)

(assert (=> d!37781 m!146339))

(assert (=> b!125593 m!144493))

(assert (=> b!125593 m!144911))

(assert (=> b!124916 d!37781))

(assert (=> b!124916 d!37515))

(assert (=> b!124916 d!37517))

(declare-fun d!37783 () Bool)

(assert (=> d!37783 (= (apply!110 lt!64216 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1439 (getValueByKey!166 (toList!854 lt!64216) (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(declare-fun bs!5207 () Bool)

(assert (= bs!5207 d!37783))

(assert (=> bs!5207 m!144493))

(assert (=> bs!5207 m!145709))

(assert (=> bs!5207 m!145709))

(declare-fun m!146341 () Bool)

(assert (=> bs!5207 m!146341))

(assert (=> b!124842 d!37783))

(assert (=> b!124842 d!37343))

(declare-fun d!37785 () Bool)

(assert (=> d!37785 (isDefined!119 (getValueByKey!166 (toList!854 lt!64012) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!64790 () Unit!3867)

(assert (=> d!37785 (= lt!64790 (choose!748 (toList!854 lt!64012) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!82044 () Bool)

(assert (=> d!37785 e!82044))

(declare-fun res!60814 () Bool)

(assert (=> d!37785 (=> (not res!60814) (not e!82044))))

(assert (=> d!37785 (= res!60814 (isStrictlySorted!316 (toList!854 lt!64012)))))

(assert (=> d!37785 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!118 (toList!854 lt!64012) #b0000000000000000000000000000000000000000000000000000000000000000) lt!64790)))

(declare-fun b!125594 () Bool)

(assert (=> b!125594 (= e!82044 (containsKey!170 (toList!854 lt!64012) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!37785 res!60814) b!125594))

(assert (=> d!37785 m!145097))

(assert (=> d!37785 m!145097))

(assert (=> d!37785 m!145099))

(declare-fun m!146343 () Bool)

(assert (=> d!37785 m!146343))

(assert (=> d!37785 m!146339))

(assert (=> b!125594 m!145093))

(assert (=> b!124970 d!37785))

(assert (=> b!124970 d!37511))

(assert (=> b!124970 d!37513))

(declare-fun lt!64791 () Bool)

(declare-fun d!37787 () Bool)

(assert (=> d!37787 (= lt!64791 (select (content!123 (toList!854 lt!64313)) (ite c!22645 (ite c!22640 (tuple2!2569 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2569 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!82046 () Bool)

(assert (=> d!37787 (= lt!64791 e!82046)))

(declare-fun res!60815 () Bool)

(assert (=> d!37787 (=> (not res!60815) (not e!82046))))

(assert (=> d!37787 (= res!60815 ((_ is Cons!1691) (toList!854 lt!64313)))))

(assert (=> d!37787 (= (contains!874 (toList!854 lt!64313) (ite c!22645 (ite c!22640 (tuple2!2569 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2569 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) lt!64791)))

(declare-fun b!125595 () Bool)

(declare-fun e!82045 () Bool)

(assert (=> b!125595 (= e!82046 e!82045)))

(declare-fun res!60816 () Bool)

(assert (=> b!125595 (=> res!60816 e!82045)))

(assert (=> b!125595 (= res!60816 (= (h!2292 (toList!854 lt!64313)) (ite c!22645 (ite c!22640 (tuple2!2569 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2569 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!125596 () Bool)

(assert (=> b!125596 (= e!82045 (contains!874 (t!6022 (toList!854 lt!64313)) (ite c!22645 (ite c!22640 (tuple2!2569 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2569 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (= (and d!37787 res!60815) b!125595))

(assert (= (and b!125595 (not res!60816)) b!125596))

(declare-fun m!146345 () Bool)

(assert (=> d!37787 m!146345))

(declare-fun m!146347 () Bool)

(assert (=> d!37787 m!146347))

(declare-fun m!146349 () Bool)

(assert (=> b!125596 m!146349))

(assert (=> b!124906 d!37787))

(declare-fun d!37789 () Bool)

(assert (=> d!37789 (isDefined!119 (getValueByKey!166 (toList!854 e!81464) (ite c!22647 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355) (select (arr!2219 (_keys!4493 newMap!16)) (index!3231 lt!64093)))))))

(declare-fun lt!64792 () Unit!3867)

(assert (=> d!37789 (= lt!64792 (choose!748 (toList!854 e!81464) (ite c!22647 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355) (select (arr!2219 (_keys!4493 newMap!16)) (index!3231 lt!64093)))))))

(declare-fun e!82047 () Bool)

(assert (=> d!37789 e!82047))

(declare-fun res!60817 () Bool)

(assert (=> d!37789 (=> (not res!60817) (not e!82047))))

(assert (=> d!37789 (= res!60817 (isStrictlySorted!316 (toList!854 e!81464)))))

(assert (=> d!37789 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!118 (toList!854 e!81464) (ite c!22647 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355) (select (arr!2219 (_keys!4493 newMap!16)) (index!3231 lt!64093)))) lt!64792)))

(declare-fun b!125597 () Bool)

(assert (=> b!125597 (= e!82047 (containsKey!170 (toList!854 e!81464) (ite c!22647 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355) (select (arr!2219 (_keys!4493 newMap!16)) (index!3231 lt!64093)))))))

(assert (= (and d!37789 res!60817) b!125597))

(assert (=> d!37789 m!145089))

(assert (=> d!37789 m!145089))

(assert (=> d!37789 m!145091))

(declare-fun m!146351 () Bool)

(assert (=> d!37789 m!146351))

(declare-fun m!146353 () Bool)

(assert (=> d!37789 m!146353))

(assert (=> b!125597 m!145085))

(assert (=> b!124967 d!37789))

(assert (=> b!124967 d!37521))

(assert (=> b!124967 d!37523))

(declare-fun d!37791 () Bool)

(assert (=> d!37791 (isDefined!119 (getValueByKey!166 (toList!854 call!13340) (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355)))))

(declare-fun lt!64793 () Unit!3867)

(assert (=> d!37791 (= lt!64793 (choose!748 (toList!854 call!13340) (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355)))))

(declare-fun e!82048 () Bool)

(assert (=> d!37791 e!82048))

(declare-fun res!60818 () Bool)

(assert (=> d!37791 (=> (not res!60818) (not e!82048))))

(assert (=> d!37791 (= res!60818 (isStrictlySorted!316 (toList!854 call!13340)))))

(assert (=> d!37791 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!118 (toList!854 call!13340) (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355)) lt!64793)))

(declare-fun b!125598 () Bool)

(assert (=> b!125598 (= e!82048 (containsKey!170 (toList!854 call!13340) (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355)))))

(assert (= (and d!37791 res!60818) b!125598))

(assert (=> d!37791 m!144415))

(assert (=> d!37791 m!144645))

(assert (=> d!37791 m!144645))

(assert (=> d!37791 m!144647))

(assert (=> d!37791 m!144415))

(declare-fun m!146355 () Bool)

(assert (=> d!37791 m!146355))

(declare-fun m!146357 () Bool)

(assert (=> d!37791 m!146357))

(assert (=> b!125598 m!144415))

(assert (=> b!125598 m!144641))

(assert (=> b!124698 d!37791))

(assert (=> b!124698 d!37535))

(assert (=> b!124698 d!37537))

(declare-fun c!22907 () Bool)

(declare-fun d!37793 () Bool)

(assert (=> d!37793 (= c!22907 (and ((_ is Cons!1691) (toList!854 lt!64158)) (= (_1!1295 (h!2292 (toList!854 lt!64158))) (_1!1295 (ite (or c!22605 c!22603) (tuple2!2569 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2629 (v!3108 (underlying!436 thiss!992)))) (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2629 (v!3108 (underlying!436 thiss!992)))))))))))

(declare-fun e!82049 () Option!172)

(assert (=> d!37793 (= (getValueByKey!166 (toList!854 lt!64158) (_1!1295 (ite (or c!22605 c!22603) (tuple2!2569 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2629 (v!3108 (underlying!436 thiss!992)))) (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2629 (v!3108 (underlying!436 thiss!992))))))) e!82049)))

(declare-fun b!125599 () Bool)

(assert (=> b!125599 (= e!82049 (Some!171 (_2!1295 (h!2292 (toList!854 lt!64158)))))))

(declare-fun e!82050 () Option!172)

(declare-fun b!125601 () Bool)

(assert (=> b!125601 (= e!82050 (getValueByKey!166 (t!6022 (toList!854 lt!64158)) (_1!1295 (ite (or c!22605 c!22603) (tuple2!2569 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2629 (v!3108 (underlying!436 thiss!992)))) (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2629 (v!3108 (underlying!436 thiss!992))))))))))

(declare-fun b!125602 () Bool)

(assert (=> b!125602 (= e!82050 None!170)))

(declare-fun b!125600 () Bool)

(assert (=> b!125600 (= e!82049 e!82050)))

(declare-fun c!22908 () Bool)

(assert (=> b!125600 (= c!22908 (and ((_ is Cons!1691) (toList!854 lt!64158)) (not (= (_1!1295 (h!2292 (toList!854 lt!64158))) (_1!1295 (ite (or c!22605 c!22603) (tuple2!2569 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2629 (v!3108 (underlying!436 thiss!992)))) (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2629 (v!3108 (underlying!436 thiss!992))))))))))))

(assert (= (and d!37793 c!22907) b!125599))

(assert (= (and d!37793 (not c!22907)) b!125600))

(assert (= (and b!125600 c!22908) b!125601))

(assert (= (and b!125600 (not c!22908)) b!125602))

(declare-fun m!146359 () Bool)

(assert (=> b!125601 m!146359))

(assert (=> b!124764 d!37793))

(declare-fun d!37795 () Bool)

(declare-fun lt!64794 () Bool)

(assert (=> d!37795 (= lt!64794 (select (content!123 (toList!854 lt!64362)) (tuple2!2569 lt!64001 (minValue!2629 (v!3108 (underlying!436 thiss!992))))))))

(declare-fun e!82052 () Bool)

(assert (=> d!37795 (= lt!64794 e!82052)))

(declare-fun res!60819 () Bool)

(assert (=> d!37795 (=> (not res!60819) (not e!82052))))

(assert (=> d!37795 (= res!60819 ((_ is Cons!1691) (toList!854 lt!64362)))))

(assert (=> d!37795 (= (contains!874 (toList!854 lt!64362) (tuple2!2569 lt!64001 (minValue!2629 (v!3108 (underlying!436 thiss!992))))) lt!64794)))

(declare-fun b!125603 () Bool)

(declare-fun e!82051 () Bool)

(assert (=> b!125603 (= e!82052 e!82051)))

(declare-fun res!60820 () Bool)

(assert (=> b!125603 (=> res!60820 e!82051)))

(assert (=> b!125603 (= res!60820 (= (h!2292 (toList!854 lt!64362)) (tuple2!2569 lt!64001 (minValue!2629 (v!3108 (underlying!436 thiss!992))))))))

(declare-fun b!125604 () Bool)

(assert (=> b!125604 (= e!82051 (contains!874 (t!6022 (toList!854 lt!64362)) (tuple2!2569 lt!64001 (minValue!2629 (v!3108 (underlying!436 thiss!992))))))))

(assert (= (and d!37795 res!60819) b!125603))

(assert (= (and b!125603 (not res!60820)) b!125604))

(declare-fun m!146361 () Bool)

(assert (=> d!37795 m!146361))

(declare-fun m!146363 () Bool)

(assert (=> d!37795 m!146363))

(declare-fun m!146365 () Bool)

(assert (=> b!125604 m!146365))

(assert (=> b!124956 d!37795))

(declare-fun d!37797 () Bool)

(declare-fun e!82053 () Bool)

(assert (=> d!37797 e!82053))

(declare-fun res!60821 () Bool)

(assert (=> d!37797 (=> res!60821 e!82053)))

(declare-fun lt!64797 () Bool)

(assert (=> d!37797 (= res!60821 (not lt!64797))))

(declare-fun lt!64798 () Bool)

(assert (=> d!37797 (= lt!64797 lt!64798)))

(declare-fun lt!64795 () Unit!3867)

(declare-fun e!82054 () Unit!3867)

(assert (=> d!37797 (= lt!64795 e!82054)))

(declare-fun c!22909 () Bool)

(assert (=> d!37797 (= c!22909 lt!64798)))

(assert (=> d!37797 (= lt!64798 (containsKey!170 (toList!854 lt!64406) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!37797 (= (contains!873 lt!64406 #b0000000000000000000000000000000000000000000000000000000000000000) lt!64797)))

(declare-fun b!125605 () Bool)

(declare-fun lt!64796 () Unit!3867)

(assert (=> b!125605 (= e!82054 lt!64796)))

(assert (=> b!125605 (= lt!64796 (lemmaContainsKeyImpliesGetValueByKeyDefined!118 (toList!854 lt!64406) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!125605 (isDefined!119 (getValueByKey!166 (toList!854 lt!64406) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!125606 () Bool)

(declare-fun Unit!3911 () Unit!3867)

(assert (=> b!125606 (= e!82054 Unit!3911)))

(declare-fun b!125607 () Bool)

(assert (=> b!125607 (= e!82053 (isDefined!119 (getValueByKey!166 (toList!854 lt!64406) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!37797 c!22909) b!125605))

(assert (= (and d!37797 (not c!22909)) b!125606))

(assert (= (and d!37797 (not res!60821)) b!125607))

(declare-fun m!146367 () Bool)

(assert (=> d!37797 m!146367))

(declare-fun m!146369 () Bool)

(assert (=> b!125605 m!146369))

(assert (=> b!125605 m!145883))

(assert (=> b!125605 m!145883))

(declare-fun m!146371 () Bool)

(assert (=> b!125605 m!146371))

(assert (=> b!125607 m!145883))

(assert (=> b!125607 m!145883))

(assert (=> b!125607 m!146371))

(assert (=> bm!13386 d!37797))

(declare-fun d!37799 () Bool)

(declare-fun e!82055 () Bool)

(assert (=> d!37799 e!82055))

(declare-fun res!60822 () Bool)

(assert (=> d!37799 (=> res!60822 e!82055)))

(declare-fun lt!64801 () Bool)

(assert (=> d!37799 (= res!60822 (not lt!64801))))

(declare-fun lt!64802 () Bool)

(assert (=> d!37799 (= lt!64801 lt!64802)))

(declare-fun lt!64799 () Unit!3867)

(declare-fun e!82056 () Unit!3867)

(assert (=> d!37799 (= lt!64799 e!82056)))

(declare-fun c!22910 () Bool)

(assert (=> d!37799 (= c!22910 lt!64802)))

(assert (=> d!37799 (= lt!64802 (containsKey!170 (toList!854 (map!1384 (_2!1296 lt!64299))) (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355)))))

(assert (=> d!37799 (= (contains!873 (map!1384 (_2!1296 lt!64299)) (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355)) lt!64801)))

(declare-fun b!125608 () Bool)

(declare-fun lt!64800 () Unit!3867)

(assert (=> b!125608 (= e!82056 lt!64800)))

(assert (=> b!125608 (= lt!64800 (lemmaContainsKeyImpliesGetValueByKeyDefined!118 (toList!854 (map!1384 (_2!1296 lt!64299))) (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355)))))

(assert (=> b!125608 (isDefined!119 (getValueByKey!166 (toList!854 (map!1384 (_2!1296 lt!64299))) (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355)))))

(declare-fun b!125609 () Bool)

(declare-fun Unit!3912 () Unit!3867)

(assert (=> b!125609 (= e!82056 Unit!3912)))

(declare-fun b!125610 () Bool)

(assert (=> b!125610 (= e!82055 (isDefined!119 (getValueByKey!166 (toList!854 (map!1384 (_2!1296 lt!64299))) (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355))))))

(assert (= (and d!37799 c!22910) b!125608))

(assert (= (and d!37799 (not c!22910)) b!125609))

(assert (= (and d!37799 (not res!60822)) b!125610))

(assert (=> d!37799 m!144415))

(declare-fun m!146373 () Bool)

(assert (=> d!37799 m!146373))

(assert (=> b!125608 m!144415))

(declare-fun m!146375 () Bool)

(assert (=> b!125608 m!146375))

(assert (=> b!125608 m!144415))

(declare-fun m!146377 () Bool)

(assert (=> b!125608 m!146377))

(assert (=> b!125608 m!146377))

(declare-fun m!146379 () Bool)

(assert (=> b!125608 m!146379))

(assert (=> b!125610 m!144415))

(assert (=> b!125610 m!146377))

(assert (=> b!125610 m!146377))

(assert (=> b!125610 m!146379))

(assert (=> b!124888 d!37799))

(declare-fun d!37801 () Bool)

(assert (=> d!37801 (= (map!1384 (_2!1296 lt!64299)) (getCurrentListMap!535 (_keys!4493 (_2!1296 lt!64299)) (_values!2747 (_2!1296 lt!64299)) (mask!7010 (_2!1296 lt!64299)) (extraKeys!2549 (_2!1296 lt!64299)) (zeroValue!2629 (_2!1296 lt!64299)) (minValue!2629 (_2!1296 lt!64299)) #b00000000000000000000000000000000 (defaultEntry!2764 (_2!1296 lt!64299))))))

(declare-fun bs!5208 () Bool)

(assert (= bs!5208 d!37801))

(declare-fun m!146381 () Bool)

(assert (=> bs!5208 m!146381))

(assert (=> b!124888 d!37801))

(declare-fun d!37803 () Bool)

(assert (=> d!37803 (isDefined!119 (getValueByKey!166 (toList!854 lt!64012) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!64803 () Unit!3867)

(assert (=> d!37803 (= lt!64803 (choose!748 (toList!854 lt!64012) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!82057 () Bool)

(assert (=> d!37803 e!82057))

(declare-fun res!60823 () Bool)

(assert (=> d!37803 (=> (not res!60823) (not e!82057))))

(assert (=> d!37803 (= res!60823 (isStrictlySorted!316 (toList!854 lt!64012)))))

(assert (=> d!37803 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!118 (toList!854 lt!64012) #b1000000000000000000000000000000000000000000000000000000000000000) lt!64803)))

(declare-fun b!125611 () Bool)

(assert (=> b!125611 (= e!82057 (containsKey!170 (toList!854 lt!64012) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!37803 res!60823) b!125611))

(assert (=> d!37803 m!144789))

(assert (=> d!37803 m!144789))

(assert (=> d!37803 m!144791))

(declare-fun m!146383 () Bool)

(assert (=> d!37803 m!146383))

(assert (=> d!37803 m!146339))

(assert (=> b!125611 m!144785))

(assert (=> b!124813 d!37803))

(assert (=> b!124813 d!37555))

(assert (=> b!124813 d!37557))

(declare-fun d!37805 () Bool)

(declare-fun e!82058 () Bool)

(assert (=> d!37805 e!82058))

(declare-fun res!60824 () Bool)

(assert (=> d!37805 (=> res!60824 e!82058)))

(declare-fun lt!64806 () Bool)

(assert (=> d!37805 (= res!60824 (not lt!64806))))

(declare-fun lt!64807 () Bool)

(assert (=> d!37805 (= lt!64806 lt!64807)))

(declare-fun lt!64804 () Unit!3867)

(declare-fun e!82059 () Unit!3867)

(assert (=> d!37805 (= lt!64804 e!82059)))

(declare-fun c!22911 () Bool)

(assert (=> d!37805 (= c!22911 lt!64807)))

(assert (=> d!37805 (= lt!64807 (containsKey!170 (toList!854 lt!64139) (_1!1295 (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2629 (v!3108 (underlying!436 thiss!992)))))))))

(assert (=> d!37805 (= (contains!873 lt!64139 (_1!1295 (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2629 (v!3108 (underlying!436 thiss!992)))))) lt!64806)))

(declare-fun b!125612 () Bool)

(declare-fun lt!64805 () Unit!3867)

(assert (=> b!125612 (= e!82059 lt!64805)))

(assert (=> b!125612 (= lt!64805 (lemmaContainsKeyImpliesGetValueByKeyDefined!118 (toList!854 lt!64139) (_1!1295 (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2629 (v!3108 (underlying!436 thiss!992)))))))))

(assert (=> b!125612 (isDefined!119 (getValueByKey!166 (toList!854 lt!64139) (_1!1295 (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2629 (v!3108 (underlying!436 thiss!992)))))))))

(declare-fun b!125613 () Bool)

(declare-fun Unit!3913 () Unit!3867)

(assert (=> b!125613 (= e!82059 Unit!3913)))

(declare-fun b!125614 () Bool)

(assert (=> b!125614 (= e!82058 (isDefined!119 (getValueByKey!166 (toList!854 lt!64139) (_1!1295 (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2629 (v!3108 (underlying!436 thiss!992))))))))))

(assert (= (and d!37805 c!22911) b!125612))

(assert (= (and d!37805 (not c!22911)) b!125613))

(assert (= (and d!37805 (not res!60824)) b!125614))

(declare-fun m!146385 () Bool)

(assert (=> d!37805 m!146385))

(declare-fun m!146387 () Bool)

(assert (=> b!125612 m!146387))

(assert (=> b!125612 m!144659))

(assert (=> b!125612 m!144659))

(declare-fun m!146389 () Bool)

(assert (=> b!125612 m!146389))

(assert (=> b!125614 m!144659))

(assert (=> b!125614 m!144659))

(assert (=> b!125614 m!146389))

(assert (=> d!37317 d!37805))

(declare-fun d!37807 () Bool)

(declare-fun c!22912 () Bool)

(assert (=> d!37807 (= c!22912 (and ((_ is Cons!1691) lt!64140) (= (_1!1295 (h!2292 lt!64140)) (_1!1295 (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2629 (v!3108 (underlying!436 thiss!992))))))))))

(declare-fun e!82060 () Option!172)

(assert (=> d!37807 (= (getValueByKey!166 lt!64140 (_1!1295 (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2629 (v!3108 (underlying!436 thiss!992)))))) e!82060)))

(declare-fun b!125615 () Bool)

(assert (=> b!125615 (= e!82060 (Some!171 (_2!1295 (h!2292 lt!64140))))))

(declare-fun b!125617 () Bool)

(declare-fun e!82061 () Option!172)

(assert (=> b!125617 (= e!82061 (getValueByKey!166 (t!6022 lt!64140) (_1!1295 (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2629 (v!3108 (underlying!436 thiss!992)))))))))

(declare-fun b!125618 () Bool)

(assert (=> b!125618 (= e!82061 None!170)))

(declare-fun b!125616 () Bool)

(assert (=> b!125616 (= e!82060 e!82061)))

(declare-fun c!22913 () Bool)

(assert (=> b!125616 (= c!22913 (and ((_ is Cons!1691) lt!64140) (not (= (_1!1295 (h!2292 lt!64140)) (_1!1295 (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2629 (v!3108 (underlying!436 thiss!992)))))))))))

(assert (= (and d!37807 c!22912) b!125615))

(assert (= (and d!37807 (not c!22912)) b!125616))

(assert (= (and b!125616 c!22913) b!125617))

(assert (= (and b!125616 (not c!22913)) b!125618))

(declare-fun m!146391 () Bool)

(assert (=> b!125617 m!146391))

(assert (=> d!37317 d!37807))

(declare-fun d!37809 () Bool)

(assert (=> d!37809 (= (getValueByKey!166 lt!64140 (_1!1295 (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2629 (v!3108 (underlying!436 thiss!992)))))) (Some!171 (_2!1295 (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2629 (v!3108 (underlying!436 thiss!992)))))))))

(declare-fun lt!64808 () Unit!3867)

(assert (=> d!37809 (= lt!64808 (choose!756 lt!64140 (_1!1295 (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2629 (v!3108 (underlying!436 thiss!992))))) (_2!1295 (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2629 (v!3108 (underlying!436 thiss!992)))))))))

(declare-fun e!82062 () Bool)

(assert (=> d!37809 e!82062))

(declare-fun res!60825 () Bool)

(assert (=> d!37809 (=> (not res!60825) (not e!82062))))

(assert (=> d!37809 (= res!60825 (isStrictlySorted!316 lt!64140))))

(assert (=> d!37809 (= (lemmaContainsTupThenGetReturnValue!81 lt!64140 (_1!1295 (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2629 (v!3108 (underlying!436 thiss!992))))) (_2!1295 (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2629 (v!3108 (underlying!436 thiss!992)))))) lt!64808)))

(declare-fun b!125619 () Bool)

(declare-fun res!60826 () Bool)

(assert (=> b!125619 (=> (not res!60826) (not e!82062))))

(assert (=> b!125619 (= res!60826 (containsKey!170 lt!64140 (_1!1295 (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2629 (v!3108 (underlying!436 thiss!992)))))))))

(declare-fun b!125620 () Bool)

(assert (=> b!125620 (= e!82062 (contains!874 lt!64140 (tuple2!2569 (_1!1295 (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2629 (v!3108 (underlying!436 thiss!992))))) (_2!1295 (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2629 (v!3108 (underlying!436 thiss!992))))))))))

(assert (= (and d!37809 res!60825) b!125619))

(assert (= (and b!125619 res!60826) b!125620))

(assert (=> d!37809 m!144653))

(declare-fun m!146393 () Bool)

(assert (=> d!37809 m!146393))

(declare-fun m!146395 () Bool)

(assert (=> d!37809 m!146395))

(declare-fun m!146397 () Bool)

(assert (=> b!125619 m!146397))

(declare-fun m!146399 () Bool)

(assert (=> b!125620 m!146399))

(assert (=> d!37317 d!37809))

(declare-fun b!125621 () Bool)

(declare-fun e!82065 () List!1695)

(declare-fun call!13465 () List!1695)

(assert (=> b!125621 (= e!82065 call!13465)))

(declare-fun b!125622 () Bool)

(declare-fun e!82064 () List!1695)

(declare-fun e!82063 () List!1695)

(assert (=> b!125622 (= e!82064 e!82063)))

(declare-fun c!22916 () Bool)

(assert (=> b!125622 (= c!22916 (and ((_ is Cons!1691) (toList!854 call!13268)) (= (_1!1295 (h!2292 (toList!854 call!13268))) (_1!1295 (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2629 (v!3108 (underlying!436 thiss!992))))))))))

(declare-fun b!125623 () Bool)

(assert (=> b!125623 (= e!82065 call!13465)))

(declare-fun b!125624 () Bool)

(declare-fun call!13466 () List!1695)

(assert (=> b!125624 (= e!82063 call!13466)))

(declare-fun b!125625 () Bool)

(declare-fun res!60827 () Bool)

(declare-fun e!82066 () Bool)

(assert (=> b!125625 (=> (not res!60827) (not e!82066))))

(declare-fun lt!64809 () List!1695)

(assert (=> b!125625 (= res!60827 (containsKey!170 lt!64809 (_1!1295 (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2629 (v!3108 (underlying!436 thiss!992)))))))))

(declare-fun bm!13462 () Bool)

(assert (=> bm!13462 (= call!13465 call!13466)))

(declare-fun d!37811 () Bool)

(assert (=> d!37811 e!82066))

(declare-fun res!60828 () Bool)

(assert (=> d!37811 (=> (not res!60828) (not e!82066))))

(assert (=> d!37811 (= res!60828 (isStrictlySorted!316 lt!64809))))

(assert (=> d!37811 (= lt!64809 e!82064)))

(declare-fun c!22914 () Bool)

(assert (=> d!37811 (= c!22914 (and ((_ is Cons!1691) (toList!854 call!13268)) (bvslt (_1!1295 (h!2292 (toList!854 call!13268))) (_1!1295 (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2629 (v!3108 (underlying!436 thiss!992))))))))))

(assert (=> d!37811 (isStrictlySorted!316 (toList!854 call!13268))))

(assert (=> d!37811 (= (insertStrictlySorted!84 (toList!854 call!13268) (_1!1295 (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2629 (v!3108 (underlying!436 thiss!992))))) (_2!1295 (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2629 (v!3108 (underlying!436 thiss!992)))))) lt!64809)))

(declare-fun b!125626 () Bool)

(assert (=> b!125626 (= e!82066 (contains!874 lt!64809 (tuple2!2569 (_1!1295 (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2629 (v!3108 (underlying!436 thiss!992))))) (_2!1295 (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2629 (v!3108 (underlying!436 thiss!992))))))))))

(declare-fun bm!13463 () Bool)

(declare-fun call!13467 () List!1695)

(declare-fun e!82067 () List!1695)

(assert (=> bm!13463 (= call!13467 ($colon$colon!88 e!82067 (ite c!22914 (h!2292 (toList!854 call!13268)) (tuple2!2569 (_1!1295 (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2629 (v!3108 (underlying!436 thiss!992))))) (_2!1295 (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2629 (v!3108 (underlying!436 thiss!992)))))))))))

(declare-fun c!22917 () Bool)

(assert (=> bm!13463 (= c!22917 c!22914)))

(declare-fun b!125627 () Bool)

(declare-fun c!22915 () Bool)

(assert (=> b!125627 (= c!22915 (and ((_ is Cons!1691) (toList!854 call!13268)) (bvsgt (_1!1295 (h!2292 (toList!854 call!13268))) (_1!1295 (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2629 (v!3108 (underlying!436 thiss!992))))))))))

(assert (=> b!125627 (= e!82063 e!82065)))

(declare-fun b!125628 () Bool)

(assert (=> b!125628 (= e!82067 (insertStrictlySorted!84 (t!6022 (toList!854 call!13268)) (_1!1295 (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2629 (v!3108 (underlying!436 thiss!992))))) (_2!1295 (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2629 (v!3108 (underlying!436 thiss!992)))))))))

(declare-fun b!125629 () Bool)

(assert (=> b!125629 (= e!82064 call!13467)))

(declare-fun bm!13464 () Bool)

(assert (=> bm!13464 (= call!13466 call!13467)))

(declare-fun b!125630 () Bool)

(assert (=> b!125630 (= e!82067 (ite c!22916 (t!6022 (toList!854 call!13268)) (ite c!22915 (Cons!1691 (h!2292 (toList!854 call!13268)) (t!6022 (toList!854 call!13268))) Nil!1692)))))

(assert (= (and d!37811 c!22914) b!125629))

(assert (= (and d!37811 (not c!22914)) b!125622))

(assert (= (and b!125622 c!22916) b!125624))

(assert (= (and b!125622 (not c!22916)) b!125627))

(assert (= (and b!125627 c!22915) b!125621))

(assert (= (and b!125627 (not c!22915)) b!125623))

(assert (= (or b!125621 b!125623) bm!13462))

(assert (= (or b!125624 bm!13462) bm!13464))

(assert (= (or b!125629 bm!13464) bm!13463))

(assert (= (and bm!13463 c!22917) b!125628))

(assert (= (and bm!13463 (not c!22917)) b!125630))

(assert (= (and d!37811 res!60828) b!125625))

(assert (= (and b!125625 res!60827) b!125626))

(declare-fun m!146401 () Bool)

(assert (=> b!125628 m!146401))

(declare-fun m!146403 () Bool)

(assert (=> bm!13463 m!146403))

(declare-fun m!146405 () Bool)

(assert (=> d!37811 m!146405))

(declare-fun m!146407 () Bool)

(assert (=> d!37811 m!146407))

(declare-fun m!146409 () Bool)

(assert (=> b!125625 m!146409))

(declare-fun m!146411 () Bool)

(assert (=> b!125626 m!146411))

(assert (=> d!37317 d!37811))

(declare-fun d!37813 () Bool)

(declare-fun e!82068 () Bool)

(assert (=> d!37813 e!82068))

(declare-fun res!60829 () Bool)

(assert (=> d!37813 (=> res!60829 e!82068)))

(declare-fun lt!64812 () Bool)

(assert (=> d!37813 (= res!60829 (not lt!64812))))

(declare-fun lt!64813 () Bool)

(assert (=> d!37813 (= lt!64812 lt!64813)))

(declare-fun lt!64810 () Unit!3867)

(declare-fun e!82069 () Unit!3867)

(assert (=> d!37813 (= lt!64810 e!82069)))

(declare-fun c!22918 () Bool)

(assert (=> d!37813 (= c!22918 lt!64813)))

(assert (=> d!37813 (= lt!64813 (containsKey!170 (toList!854 lt!64406) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!37813 (= (contains!873 lt!64406 #b1000000000000000000000000000000000000000000000000000000000000000) lt!64812)))

(declare-fun b!125631 () Bool)

(declare-fun lt!64811 () Unit!3867)

(assert (=> b!125631 (= e!82069 lt!64811)))

(assert (=> b!125631 (= lt!64811 (lemmaContainsKeyImpliesGetValueByKeyDefined!118 (toList!854 lt!64406) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!125631 (isDefined!119 (getValueByKey!166 (toList!854 lt!64406) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!125632 () Bool)

(declare-fun Unit!3914 () Unit!3867)

(assert (=> b!125632 (= e!82069 Unit!3914)))

(declare-fun b!125633 () Bool)

(assert (=> b!125633 (= e!82068 (isDefined!119 (getValueByKey!166 (toList!854 lt!64406) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!37813 c!22918) b!125631))

(assert (= (and d!37813 (not c!22918)) b!125632))

(assert (= (and d!37813 (not res!60829)) b!125633))

(declare-fun m!146413 () Bool)

(assert (=> d!37813 m!146413))

(declare-fun m!146415 () Bool)

(assert (=> b!125631 m!146415))

(assert (=> b!125631 m!146137))

(assert (=> b!125631 m!146137))

(declare-fun m!146417 () Bool)

(assert (=> b!125631 m!146417))

(assert (=> b!125633 m!146137))

(assert (=> b!125633 m!146137))

(assert (=> b!125633 m!146417))

(assert (=> bm!13388 d!37813))

(declare-fun c!22919 () Bool)

(declare-fun d!37815 () Bool)

(assert (=> d!37815 (= c!22919 (and ((_ is Cons!1691) (toList!854 lt!64367)) (= (_1!1295 (h!2292 (toList!854 lt!64367))) (_1!1295 (tuple2!2569 lt!64003 (zeroValue!2629 (v!3108 (underlying!436 thiss!992))))))))))

(declare-fun e!82070 () Option!172)

(assert (=> d!37815 (= (getValueByKey!166 (toList!854 lt!64367) (_1!1295 (tuple2!2569 lt!64003 (zeroValue!2629 (v!3108 (underlying!436 thiss!992)))))) e!82070)))

(declare-fun b!125634 () Bool)

(assert (=> b!125634 (= e!82070 (Some!171 (_2!1295 (h!2292 (toList!854 lt!64367)))))))

(declare-fun b!125636 () Bool)

(declare-fun e!82071 () Option!172)

(assert (=> b!125636 (= e!82071 (getValueByKey!166 (t!6022 (toList!854 lt!64367)) (_1!1295 (tuple2!2569 lt!64003 (zeroValue!2629 (v!3108 (underlying!436 thiss!992)))))))))

(declare-fun b!125637 () Bool)

(assert (=> b!125637 (= e!82071 None!170)))

(declare-fun b!125635 () Bool)

(assert (=> b!125635 (= e!82070 e!82071)))

(declare-fun c!22920 () Bool)

(assert (=> b!125635 (= c!22920 (and ((_ is Cons!1691) (toList!854 lt!64367)) (not (= (_1!1295 (h!2292 (toList!854 lt!64367))) (_1!1295 (tuple2!2569 lt!64003 (zeroValue!2629 (v!3108 (underlying!436 thiss!992)))))))))))

(assert (= (and d!37815 c!22919) b!125634))

(assert (= (and d!37815 (not c!22919)) b!125635))

(assert (= (and b!125635 c!22920) b!125636))

(assert (= (and b!125635 (not c!22920)) b!125637))

(declare-fun m!146419 () Bool)

(assert (=> b!125636 m!146419))

(assert (=> b!124958 d!37815))

(declare-fun d!37817 () Bool)

(declare-fun e!82072 () Bool)

(assert (=> d!37817 e!82072))

(declare-fun res!60830 () Bool)

(assert (=> d!37817 (=> (not res!60830) (not e!82072))))

(declare-fun lt!64814 () ListLongMap!1677)

(assert (=> d!37817 (= res!60830 (contains!873 lt!64814 (_1!1295 (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2629 newMap!16)))))))

(declare-fun lt!64815 () List!1695)

(assert (=> d!37817 (= lt!64814 (ListLongMap!1678 lt!64815))))

(declare-fun lt!64817 () Unit!3867)

(declare-fun lt!64816 () Unit!3867)

(assert (=> d!37817 (= lt!64817 lt!64816)))

(assert (=> d!37817 (= (getValueByKey!166 lt!64815 (_1!1295 (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2629 newMap!16)))) (Some!171 (_2!1295 (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2629 newMap!16)))))))

(assert (=> d!37817 (= lt!64816 (lemmaContainsTupThenGetReturnValue!81 lt!64815 (_1!1295 (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2629 newMap!16))) (_2!1295 (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2629 newMap!16)))))))

(assert (=> d!37817 (= lt!64815 (insertStrictlySorted!84 (toList!854 call!13359) (_1!1295 (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2629 newMap!16))) (_2!1295 (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2629 newMap!16)))))))

(assert (=> d!37817 (= (+!169 call!13359 (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2629 newMap!16))) lt!64814)))

(declare-fun b!125638 () Bool)

(declare-fun res!60831 () Bool)

(assert (=> b!125638 (=> (not res!60831) (not e!82072))))

(assert (=> b!125638 (= res!60831 (= (getValueByKey!166 (toList!854 lt!64814) (_1!1295 (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2629 newMap!16)))) (Some!171 (_2!1295 (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2629 newMap!16))))))))

(declare-fun b!125639 () Bool)

(assert (=> b!125639 (= e!82072 (contains!874 (toList!854 lt!64814) (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2629 newMap!16))))))

(assert (= (and d!37817 res!60830) b!125638))

(assert (= (and b!125638 res!60831) b!125639))

(declare-fun m!146421 () Bool)

(assert (=> d!37817 m!146421))

(declare-fun m!146423 () Bool)

(assert (=> d!37817 m!146423))

(declare-fun m!146425 () Bool)

(assert (=> d!37817 m!146425))

(declare-fun m!146427 () Bool)

(assert (=> d!37817 m!146427))

(declare-fun m!146429 () Bool)

(assert (=> b!125638 m!146429))

(declare-fun m!146431 () Bool)

(assert (=> b!125639 m!146431))

(assert (=> b!124789 d!37817))

(assert (=> bm!13382 d!37757))

(assert (=> b!124891 d!37801))

(declare-fun d!37819 () Bool)

(declare-fun e!82073 () Bool)

(assert (=> d!37819 e!82073))

(declare-fun res!60832 () Bool)

(assert (=> d!37819 (=> (not res!60832) (not e!82073))))

(declare-fun lt!64818 () ListLongMap!1677)

(assert (=> d!37819 (= res!60832 (contains!873 lt!64818 (_1!1295 (tuple2!2569 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!64819 () List!1695)

(assert (=> d!37819 (= lt!64818 (ListLongMap!1678 lt!64819))))

(declare-fun lt!64821 () Unit!3867)

(declare-fun lt!64820 () Unit!3867)

(assert (=> d!37819 (= lt!64821 lt!64820)))

(assert (=> d!37819 (= (getValueByKey!166 lt!64819 (_1!1295 (tuple2!2569 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!171 (_2!1295 (tuple2!2569 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!37819 (= lt!64820 (lemmaContainsTupThenGetReturnValue!81 lt!64819 (_1!1295 (tuple2!2569 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1295 (tuple2!2569 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!37819 (= lt!64819 (insertStrictlySorted!84 (toList!854 (map!1384 newMap!16)) (_1!1295 (tuple2!2569 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1295 (tuple2!2569 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!37819 (= (+!169 (map!1384 newMap!16) (tuple2!2569 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!64818)))

(declare-fun b!125640 () Bool)

(declare-fun res!60833 () Bool)

(assert (=> b!125640 (=> (not res!60833) (not e!82073))))

(assert (=> b!125640 (= res!60833 (= (getValueByKey!166 (toList!854 lt!64818) (_1!1295 (tuple2!2569 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!171 (_2!1295 (tuple2!2569 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!125641 () Bool)

(assert (=> b!125641 (= e!82073 (contains!874 (toList!854 lt!64818) (tuple2!2569 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!37819 res!60832) b!125640))

(assert (= (and b!125640 res!60833) b!125641))

(declare-fun m!146433 () Bool)

(assert (=> d!37819 m!146433))

(declare-fun m!146435 () Bool)

(assert (=> d!37819 m!146435))

(declare-fun m!146437 () Bool)

(assert (=> d!37819 m!146437))

(declare-fun m!146439 () Bool)

(assert (=> d!37819 m!146439))

(declare-fun m!146441 () Bool)

(assert (=> b!125640 m!146441))

(declare-fun m!146443 () Bool)

(assert (=> b!125641 m!146443))

(assert (=> b!124891 d!37819))

(assert (=> b!124891 d!37297))

(assert (=> b!124850 d!37453))

(declare-fun d!37821 () Bool)

(assert (=> d!37821 (= (isEmpty!393 (getValueByKey!166 (toList!854 lt!63941) (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355))) (not ((_ is Some!171) (getValueByKey!166 (toList!854 lt!63941) (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355)))))))

(assert (=> d!37321 d!37821))

(declare-fun b!125642 () Bool)

(declare-fun e!82076 () Bool)

(declare-fun e!82074 () Bool)

(assert (=> b!125642 (= e!82076 e!82074)))

(declare-fun c!22921 () Bool)

(assert (=> b!125642 (= c!22921 (validKeyInArray!0 (select (arr!2219 (_keys!4493 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!125643 () Bool)

(declare-fun e!82077 () Bool)

(assert (=> b!125643 (= e!82077 (contains!875 (ite c!22695 (Cons!1692 (select (arr!2219 (_keys!4493 newMap!16)) #b00000000000000000000000000000000) Nil!1693) Nil!1693) (select (arr!2219 (_keys!4493 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!125644 () Bool)

(declare-fun call!13468 () Bool)

(assert (=> b!125644 (= e!82074 call!13468)))

(declare-fun d!37823 () Bool)

(declare-fun res!60834 () Bool)

(declare-fun e!82075 () Bool)

(assert (=> d!37823 (=> res!60834 e!82075)))

(assert (=> d!37823 (= res!60834 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2482 (_keys!4493 newMap!16))))))

(assert (=> d!37823 (= (arrayNoDuplicates!0 (_keys!4493 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!22695 (Cons!1692 (select (arr!2219 (_keys!4493 newMap!16)) #b00000000000000000000000000000000) Nil!1693) Nil!1693)) e!82075)))

(declare-fun bm!13465 () Bool)

(assert (=> bm!13465 (= call!13468 (arrayNoDuplicates!0 (_keys!4493 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!22921 (Cons!1692 (select (arr!2219 (_keys!4493 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!22695 (Cons!1692 (select (arr!2219 (_keys!4493 newMap!16)) #b00000000000000000000000000000000) Nil!1693) Nil!1693)) (ite c!22695 (Cons!1692 (select (arr!2219 (_keys!4493 newMap!16)) #b00000000000000000000000000000000) Nil!1693) Nil!1693))))))

(declare-fun b!125645 () Bool)

(assert (=> b!125645 (= e!82075 e!82076)))

(declare-fun res!60836 () Bool)

(assert (=> b!125645 (=> (not res!60836) (not e!82076))))

(assert (=> b!125645 (= res!60836 (not e!82077))))

(declare-fun res!60835 () Bool)

(assert (=> b!125645 (=> (not res!60835) (not e!82077))))

(assert (=> b!125645 (= res!60835 (validKeyInArray!0 (select (arr!2219 (_keys!4493 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!125646 () Bool)

(assert (=> b!125646 (= e!82074 call!13468)))

(assert (= (and d!37823 (not res!60834)) b!125645))

(assert (= (and b!125645 res!60835) b!125643))

(assert (= (and b!125645 res!60836) b!125642))

(assert (= (and b!125642 c!22921) b!125644))

(assert (= (and b!125642 (not c!22921)) b!125646))

(assert (= (or b!125644 b!125646) bm!13465))

(assert (=> b!125642 m!145161))

(assert (=> b!125642 m!145161))

(assert (=> b!125642 m!145171))

(assert (=> b!125643 m!145161))

(assert (=> b!125643 m!145161))

(declare-fun m!146445 () Bool)

(assert (=> b!125643 m!146445))

(assert (=> bm!13465 m!145161))

(declare-fun m!146447 () Bool)

(assert (=> bm!13465 m!146447))

(assert (=> b!125645 m!145161))

(assert (=> b!125645 m!145161))

(assert (=> b!125645 m!145171))

(assert (=> bm!13359 d!37823))

(declare-fun d!37825 () Bool)

(declare-fun e!82078 () Bool)

(assert (=> d!37825 e!82078))

(declare-fun res!60837 () Bool)

(assert (=> d!37825 (=> res!60837 e!82078)))

(declare-fun lt!64824 () Bool)

(assert (=> d!37825 (= res!60837 (not lt!64824))))

(declare-fun lt!64825 () Bool)

(assert (=> d!37825 (= lt!64824 lt!64825)))

(declare-fun lt!64822 () Unit!3867)

(declare-fun e!82079 () Unit!3867)

(assert (=> d!37825 (= lt!64822 e!82079)))

(declare-fun c!22922 () Bool)

(assert (=> d!37825 (= c!22922 lt!64825)))

(assert (=> d!37825 (= lt!64825 (containsKey!170 (toList!854 lt!64309) (_1!1295 (tuple2!2569 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!37825 (= (contains!873 lt!64309 (_1!1295 (tuple2!2569 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) lt!64824)))

(declare-fun b!125647 () Bool)

(declare-fun lt!64823 () Unit!3867)

(assert (=> b!125647 (= e!82079 lt!64823)))

(assert (=> b!125647 (= lt!64823 (lemmaContainsKeyImpliesGetValueByKeyDefined!118 (toList!854 lt!64309) (_1!1295 (tuple2!2569 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> b!125647 (isDefined!119 (getValueByKey!166 (toList!854 lt!64309) (_1!1295 (tuple2!2569 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!125648 () Bool)

(declare-fun Unit!3915 () Unit!3867)

(assert (=> b!125648 (= e!82079 Unit!3915)))

(declare-fun b!125649 () Bool)

(assert (=> b!125649 (= e!82078 (isDefined!119 (getValueByKey!166 (toList!854 lt!64309) (_1!1295 (tuple2!2569 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (= (and d!37825 c!22922) b!125647))

(assert (= (and d!37825 (not c!22922)) b!125648))

(assert (= (and d!37825 (not res!60837)) b!125649))

(declare-fun m!146449 () Bool)

(assert (=> d!37825 m!146449))

(declare-fun m!146451 () Bool)

(assert (=> b!125647 m!146451))

(assert (=> b!125647 m!144875))

(assert (=> b!125647 m!144875))

(declare-fun m!146453 () Bool)

(assert (=> b!125647 m!146453))

(assert (=> b!125649 m!144875))

(assert (=> b!125649 m!144875))

(assert (=> b!125649 m!146453))

(assert (=> d!37353 d!37825))

(declare-fun c!22923 () Bool)

(declare-fun d!37827 () Bool)

(assert (=> d!37827 (= c!22923 (and ((_ is Cons!1691) lt!64310) (= (_1!1295 (h!2292 lt!64310)) (_1!1295 (tuple2!2569 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun e!82080 () Option!172)

(assert (=> d!37827 (= (getValueByKey!166 lt!64310 (_1!1295 (tuple2!2569 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) e!82080)))

(declare-fun b!125650 () Bool)

(assert (=> b!125650 (= e!82080 (Some!171 (_2!1295 (h!2292 lt!64310))))))

(declare-fun e!82081 () Option!172)

(declare-fun b!125652 () Bool)

(assert (=> b!125652 (= e!82081 (getValueByKey!166 (t!6022 lt!64310) (_1!1295 (tuple2!2569 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!125653 () Bool)

(assert (=> b!125653 (= e!82081 None!170)))

(declare-fun b!125651 () Bool)

(assert (=> b!125651 (= e!82080 e!82081)))

(declare-fun c!22924 () Bool)

(assert (=> b!125651 (= c!22924 (and ((_ is Cons!1691) lt!64310) (not (= (_1!1295 (h!2292 lt!64310)) (_1!1295 (tuple2!2569 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(assert (= (and d!37827 c!22923) b!125650))

(assert (= (and d!37827 (not c!22923)) b!125651))

(assert (= (and b!125651 c!22924) b!125652))

(assert (= (and b!125651 (not c!22924)) b!125653))

(declare-fun m!146455 () Bool)

(assert (=> b!125652 m!146455))

(assert (=> d!37353 d!37827))

(declare-fun d!37829 () Bool)

(assert (=> d!37829 (= (getValueByKey!166 lt!64310 (_1!1295 (tuple2!2569 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!171 (_2!1295 (tuple2!2569 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!64826 () Unit!3867)

(assert (=> d!37829 (= lt!64826 (choose!756 lt!64310 (_1!1295 (tuple2!2569 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1295 (tuple2!2569 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!82082 () Bool)

(assert (=> d!37829 e!82082))

(declare-fun res!60838 () Bool)

(assert (=> d!37829 (=> (not res!60838) (not e!82082))))

(assert (=> d!37829 (= res!60838 (isStrictlySorted!316 lt!64310))))

(assert (=> d!37829 (= (lemmaContainsTupThenGetReturnValue!81 lt!64310 (_1!1295 (tuple2!2569 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1295 (tuple2!2569 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) lt!64826)))

(declare-fun b!125654 () Bool)

(declare-fun res!60839 () Bool)

(assert (=> b!125654 (=> (not res!60839) (not e!82082))))

(assert (=> b!125654 (= res!60839 (containsKey!170 lt!64310 (_1!1295 (tuple2!2569 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!125655 () Bool)

(assert (=> b!125655 (= e!82082 (contains!874 lt!64310 (tuple2!2569 (_1!1295 (tuple2!2569 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1295 (tuple2!2569 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (= (and d!37829 res!60838) b!125654))

(assert (= (and b!125654 res!60839) b!125655))

(assert (=> d!37829 m!144869))

(declare-fun m!146457 () Bool)

(assert (=> d!37829 m!146457))

(declare-fun m!146459 () Bool)

(assert (=> d!37829 m!146459))

(declare-fun m!146461 () Bool)

(assert (=> b!125654 m!146461))

(declare-fun m!146463 () Bool)

(assert (=> b!125655 m!146463))

(assert (=> d!37353 d!37829))

(declare-fun b!125656 () Bool)

(declare-fun e!82085 () List!1695)

(declare-fun call!13469 () List!1695)

(assert (=> b!125656 (= e!82085 call!13469)))

(declare-fun b!125657 () Bool)

(declare-fun e!82084 () List!1695)

(declare-fun e!82083 () List!1695)

(assert (=> b!125657 (= e!82084 e!82083)))

(declare-fun c!22927 () Bool)

(assert (=> b!125657 (= c!22927 (and ((_ is Cons!1691) (toList!854 call!13319)) (= (_1!1295 (h!2292 (toList!854 call!13319))) (_1!1295 (tuple2!2569 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!125658 () Bool)

(assert (=> b!125658 (= e!82085 call!13469)))

(declare-fun b!125659 () Bool)

(declare-fun call!13470 () List!1695)

(assert (=> b!125659 (= e!82083 call!13470)))

(declare-fun b!125660 () Bool)

(declare-fun res!60840 () Bool)

(declare-fun e!82086 () Bool)

(assert (=> b!125660 (=> (not res!60840) (not e!82086))))

(declare-fun lt!64827 () List!1695)

(assert (=> b!125660 (= res!60840 (containsKey!170 lt!64827 (_1!1295 (tuple2!2569 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun bm!13466 () Bool)

(assert (=> bm!13466 (= call!13469 call!13470)))

(declare-fun d!37831 () Bool)

(assert (=> d!37831 e!82086))

(declare-fun res!60841 () Bool)

(assert (=> d!37831 (=> (not res!60841) (not e!82086))))

(assert (=> d!37831 (= res!60841 (isStrictlySorted!316 lt!64827))))

(assert (=> d!37831 (= lt!64827 e!82084)))

(declare-fun c!22925 () Bool)

(assert (=> d!37831 (= c!22925 (and ((_ is Cons!1691) (toList!854 call!13319)) (bvslt (_1!1295 (h!2292 (toList!854 call!13319))) (_1!1295 (tuple2!2569 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!37831 (isStrictlySorted!316 (toList!854 call!13319))))

(assert (=> d!37831 (= (insertStrictlySorted!84 (toList!854 call!13319) (_1!1295 (tuple2!2569 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1295 (tuple2!2569 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) lt!64827)))

(declare-fun b!125661 () Bool)

(assert (=> b!125661 (= e!82086 (contains!874 lt!64827 (tuple2!2569 (_1!1295 (tuple2!2569 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1295 (tuple2!2569 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun call!13471 () List!1695)

(declare-fun bm!13467 () Bool)

(declare-fun e!82087 () List!1695)

(assert (=> bm!13467 (= call!13471 ($colon$colon!88 e!82087 (ite c!22925 (h!2292 (toList!854 call!13319)) (tuple2!2569 (_1!1295 (tuple2!2569 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1295 (tuple2!2569 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(declare-fun c!22928 () Bool)

(assert (=> bm!13467 (= c!22928 c!22925)))

(declare-fun c!22926 () Bool)

(declare-fun b!125662 () Bool)

(assert (=> b!125662 (= c!22926 (and ((_ is Cons!1691) (toList!854 call!13319)) (bvsgt (_1!1295 (h!2292 (toList!854 call!13319))) (_1!1295 (tuple2!2569 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> b!125662 (= e!82083 e!82085)))

(declare-fun b!125663 () Bool)

(assert (=> b!125663 (= e!82087 (insertStrictlySorted!84 (t!6022 (toList!854 call!13319)) (_1!1295 (tuple2!2569 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1295 (tuple2!2569 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!125664 () Bool)

(assert (=> b!125664 (= e!82084 call!13471)))

(declare-fun bm!13468 () Bool)

(assert (=> bm!13468 (= call!13470 call!13471)))

(declare-fun b!125665 () Bool)

(assert (=> b!125665 (= e!82087 (ite c!22927 (t!6022 (toList!854 call!13319)) (ite c!22926 (Cons!1691 (h!2292 (toList!854 call!13319)) (t!6022 (toList!854 call!13319))) Nil!1692)))))

(assert (= (and d!37831 c!22925) b!125664))

(assert (= (and d!37831 (not c!22925)) b!125657))

(assert (= (and b!125657 c!22927) b!125659))

(assert (= (and b!125657 (not c!22927)) b!125662))

(assert (= (and b!125662 c!22926) b!125656))

(assert (= (and b!125662 (not c!22926)) b!125658))

(assert (= (or b!125656 b!125658) bm!13466))

(assert (= (or b!125659 bm!13466) bm!13468))

(assert (= (or b!125664 bm!13468) bm!13467))

(assert (= (and bm!13467 c!22928) b!125663))

(assert (= (and bm!13467 (not c!22928)) b!125665))

(assert (= (and d!37831 res!60841) b!125660))

(assert (= (and b!125660 res!60840) b!125661))

(declare-fun m!146465 () Bool)

(assert (=> b!125663 m!146465))

(declare-fun m!146467 () Bool)

(assert (=> bm!13467 m!146467))

(declare-fun m!146469 () Bool)

(assert (=> d!37831 m!146469))

(declare-fun m!146471 () Bool)

(assert (=> d!37831 m!146471))

(declare-fun m!146473 () Bool)

(assert (=> b!125660 m!146473))

(declare-fun m!146475 () Bool)

(assert (=> b!125661 m!146475))

(assert (=> d!37353 d!37831))

(declare-fun b!125669 () Bool)

(declare-fun e!82088 () Bool)

(assert (=> b!125669 (= e!82088 (and (bvsge (extraKeys!2549 (v!3108 (underlying!436 thiss!992))) #b00000000000000000000000000000000) (bvsle (extraKeys!2549 (v!3108 (underlying!436 thiss!992))) #b00000000000000000000000000000011) (bvsge (_vacant!577 (v!3108 (underlying!436 thiss!992))) #b00000000000000000000000000000000)))))

(declare-fun b!125667 () Bool)

(declare-fun res!60845 () Bool)

(assert (=> b!125667 (=> (not res!60845) (not e!82088))))

(assert (=> b!125667 (= res!60845 (bvsge (size!2486 (v!3108 (underlying!436 thiss!992))) (_size!577 (v!3108 (underlying!436 thiss!992)))))))

(declare-fun b!125666 () Bool)

(declare-fun res!60844 () Bool)

(assert (=> b!125666 (=> (not res!60844) (not e!82088))))

(assert (=> b!125666 (= res!60844 (and (= (size!2483 (_values!2747 (v!3108 (underlying!436 thiss!992)))) (bvadd (mask!7010 (v!3108 (underlying!436 thiss!992))) #b00000000000000000000000000000001)) (= (size!2482 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) (size!2483 (_values!2747 (v!3108 (underlying!436 thiss!992))))) (bvsge (_size!577 (v!3108 (underlying!436 thiss!992))) #b00000000000000000000000000000000) (bvsle (_size!577 (v!3108 (underlying!436 thiss!992))) (bvadd (mask!7010 (v!3108 (underlying!436 thiss!992))) #b00000000000000000000000000000001))))))

(declare-fun b!125668 () Bool)

(declare-fun res!60843 () Bool)

(assert (=> b!125668 (=> (not res!60843) (not e!82088))))

(assert (=> b!125668 (= res!60843 (= (size!2486 (v!3108 (underlying!436 thiss!992))) (bvadd (_size!577 (v!3108 (underlying!436 thiss!992))) (bvsdiv (bvadd (extraKeys!2549 (v!3108 (underlying!436 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun d!37833 () Bool)

(declare-fun res!60842 () Bool)

(assert (=> d!37833 (=> (not res!60842) (not e!82088))))

(assert (=> d!37833 (= res!60842 (validMask!0 (mask!7010 (v!3108 (underlying!436 thiss!992)))))))

(assert (=> d!37833 (= (simpleValid!86 (v!3108 (underlying!436 thiss!992))) e!82088)))

(assert (= (and d!37833 res!60842) b!125666))

(assert (= (and b!125666 res!60844) b!125667))

(assert (= (and b!125667 res!60845) b!125668))

(assert (= (and b!125668 res!60843) b!125669))

(declare-fun m!146477 () Bool)

(assert (=> b!125667 m!146477))

(assert (=> b!125668 m!146477))

(assert (=> d!37833 m!144413))

(assert (=> d!37375 d!37833))

(assert (=> b!124896 d!37311))

(declare-fun d!37835 () Bool)

(assert (=> d!37835 (= (get!1439 (getValueByKey!166 (toList!854 (+!169 lt!64007 (tuple2!2569 lt!64017 (zeroValue!2629 (v!3108 (underlying!436 thiss!992)))))) lt!64005)) (v!3112 (getValueByKey!166 (toList!854 (+!169 lt!64007 (tuple2!2569 lt!64017 (zeroValue!2629 (v!3108 (underlying!436 thiss!992)))))) lt!64005)))))

(assert (=> d!37399 d!37835))

(declare-fun d!37837 () Bool)

(declare-fun c!22929 () Bool)

(assert (=> d!37837 (= c!22929 (and ((_ is Cons!1691) (toList!854 (+!169 lt!64007 (tuple2!2569 lt!64017 (zeroValue!2629 (v!3108 (underlying!436 thiss!992))))))) (= (_1!1295 (h!2292 (toList!854 (+!169 lt!64007 (tuple2!2569 lt!64017 (zeroValue!2629 (v!3108 (underlying!436 thiss!992)))))))) lt!64005)))))

(declare-fun e!82089 () Option!172)

(assert (=> d!37837 (= (getValueByKey!166 (toList!854 (+!169 lt!64007 (tuple2!2569 lt!64017 (zeroValue!2629 (v!3108 (underlying!436 thiss!992)))))) lt!64005) e!82089)))

(declare-fun b!125670 () Bool)

(assert (=> b!125670 (= e!82089 (Some!171 (_2!1295 (h!2292 (toList!854 (+!169 lt!64007 (tuple2!2569 lt!64017 (zeroValue!2629 (v!3108 (underlying!436 thiss!992))))))))))))

(declare-fun b!125672 () Bool)

(declare-fun e!82090 () Option!172)

(assert (=> b!125672 (= e!82090 (getValueByKey!166 (t!6022 (toList!854 (+!169 lt!64007 (tuple2!2569 lt!64017 (zeroValue!2629 (v!3108 (underlying!436 thiss!992))))))) lt!64005))))

(declare-fun b!125673 () Bool)

(assert (=> b!125673 (= e!82090 None!170)))

(declare-fun b!125671 () Bool)

(assert (=> b!125671 (= e!82089 e!82090)))

(declare-fun c!22930 () Bool)

(assert (=> b!125671 (= c!22930 (and ((_ is Cons!1691) (toList!854 (+!169 lt!64007 (tuple2!2569 lt!64017 (zeroValue!2629 (v!3108 (underlying!436 thiss!992))))))) (not (= (_1!1295 (h!2292 (toList!854 (+!169 lt!64007 (tuple2!2569 lt!64017 (zeroValue!2629 (v!3108 (underlying!436 thiss!992)))))))) lt!64005))))))

(assert (= (and d!37837 c!22929) b!125670))

(assert (= (and d!37837 (not c!22929)) b!125671))

(assert (= (and b!125671 c!22930) b!125672))

(assert (= (and b!125671 (not c!22930)) b!125673))

(declare-fun m!146479 () Bool)

(assert (=> b!125672 m!146479))

(assert (=> d!37399 d!37837))

(declare-fun d!37839 () Bool)

(declare-fun lt!64828 () Bool)

(assert (=> d!37839 (= lt!64828 (select (content!123 (toList!854 lt!64139)) (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2629 (v!3108 (underlying!436 thiss!992))))))))

(declare-fun e!82092 () Bool)

(assert (=> d!37839 (= lt!64828 e!82092)))

(declare-fun res!60846 () Bool)

(assert (=> d!37839 (=> (not res!60846) (not e!82092))))

(assert (=> d!37839 (= res!60846 ((_ is Cons!1691) (toList!854 lt!64139)))))

(assert (=> d!37839 (= (contains!874 (toList!854 lt!64139) (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2629 (v!3108 (underlying!436 thiss!992))))) lt!64828)))

(declare-fun b!125674 () Bool)

(declare-fun e!82091 () Bool)

(assert (=> b!125674 (= e!82092 e!82091)))

(declare-fun res!60847 () Bool)

(assert (=> b!125674 (=> res!60847 e!82091)))

(assert (=> b!125674 (= res!60847 (= (h!2292 (toList!854 lt!64139)) (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2629 (v!3108 (underlying!436 thiss!992))))))))

(declare-fun b!125675 () Bool)

(assert (=> b!125675 (= e!82091 (contains!874 (t!6022 (toList!854 lt!64139)) (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2629 (v!3108 (underlying!436 thiss!992))))))))

(assert (= (and d!37839 res!60846) b!125674))

(assert (= (and b!125674 (not res!60847)) b!125675))

(declare-fun m!146481 () Bool)

(assert (=> d!37839 m!146481))

(declare-fun m!146483 () Bool)

(assert (=> d!37839 m!146483))

(declare-fun m!146485 () Bool)

(assert (=> b!125675 m!146485))

(assert (=> b!124718 d!37839))

(declare-fun d!37841 () Bool)

(declare-fun e!82093 () Bool)

(assert (=> d!37841 e!82093))

(declare-fun res!60848 () Bool)

(assert (=> d!37841 (=> res!60848 e!82093)))

(declare-fun lt!64831 () Bool)

(assert (=> d!37841 (= res!60848 (not lt!64831))))

(declare-fun lt!64832 () Bool)

(assert (=> d!37841 (= lt!64831 lt!64832)))

(declare-fun lt!64829 () Unit!3867)

(declare-fun e!82094 () Unit!3867)

(assert (=> d!37841 (= lt!64829 e!82094)))

(declare-fun c!22931 () Bool)

(assert (=> d!37841 (= c!22931 lt!64832)))

(assert (=> d!37841 (= lt!64832 (containsKey!170 (toList!854 lt!64216) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!37841 (= (contains!873 lt!64216 #b1000000000000000000000000000000000000000000000000000000000000000) lt!64831)))

(declare-fun b!125676 () Bool)

(declare-fun lt!64830 () Unit!3867)

(assert (=> b!125676 (= e!82094 lt!64830)))

(assert (=> b!125676 (= lt!64830 (lemmaContainsKeyImpliesGetValueByKeyDefined!118 (toList!854 lt!64216) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!125676 (isDefined!119 (getValueByKey!166 (toList!854 lt!64216) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!125677 () Bool)

(declare-fun Unit!3916 () Unit!3867)

(assert (=> b!125677 (= e!82094 Unit!3916)))

(declare-fun b!125678 () Bool)

(assert (=> b!125678 (= e!82093 (isDefined!119 (getValueByKey!166 (toList!854 lt!64216) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!37841 c!22931) b!125676))

(assert (= (and d!37841 (not c!22931)) b!125677))

(assert (= (and d!37841 (not res!60848)) b!125678))

(declare-fun m!146487 () Bool)

(assert (=> d!37841 m!146487))

(declare-fun m!146489 () Bool)

(assert (=> b!125676 m!146489))

(declare-fun m!146491 () Bool)

(assert (=> b!125676 m!146491))

(assert (=> b!125676 m!146491))

(declare-fun m!146493 () Bool)

(assert (=> b!125676 m!146493))

(assert (=> b!125678 m!146491))

(assert (=> b!125678 m!146491))

(assert (=> b!125678 m!146493))

(assert (=> b!124840 d!37841))

(declare-fun d!37843 () Bool)

(assert (=> d!37843 (= (apply!110 (+!169 lt!64004 (tuple2!2569 lt!64001 (minValue!2629 (v!3108 (underlying!436 thiss!992))))) lt!64002) (apply!110 lt!64004 lt!64002))))

(assert (=> d!37843 true))

(declare-fun _$34!943 () Unit!3867)

(assert (=> d!37843 (= (choose!754 lt!64004 lt!64001 (minValue!2629 (v!3108 (underlying!436 thiss!992))) lt!64002) _$34!943)))

(declare-fun bs!5209 () Bool)

(assert (= bs!5209 d!37843))

(assert (=> bs!5209 m!144505))

(assert (=> bs!5209 m!144505))

(assert (=> bs!5209 m!144507))

(assert (=> bs!5209 m!144503))

(assert (=> d!37395 d!37843))

(declare-fun d!37845 () Bool)

(declare-fun e!82095 () Bool)

(assert (=> d!37845 e!82095))

(declare-fun res!60849 () Bool)

(assert (=> d!37845 (=> res!60849 e!82095)))

(declare-fun lt!64835 () Bool)

(assert (=> d!37845 (= res!60849 (not lt!64835))))

(declare-fun lt!64836 () Bool)

(assert (=> d!37845 (= lt!64835 lt!64836)))

(declare-fun lt!64833 () Unit!3867)

(declare-fun e!82096 () Unit!3867)

(assert (=> d!37845 (= lt!64833 e!82096)))

(declare-fun c!22932 () Bool)

(assert (=> d!37845 (= c!22932 lt!64836)))

(assert (=> d!37845 (= lt!64836 (containsKey!170 (toList!854 lt!64004) lt!64002))))

(assert (=> d!37845 (= (contains!873 lt!64004 lt!64002) lt!64835)))

(declare-fun b!125679 () Bool)

(declare-fun lt!64834 () Unit!3867)

(assert (=> b!125679 (= e!82096 lt!64834)))

(assert (=> b!125679 (= lt!64834 (lemmaContainsKeyImpliesGetValueByKeyDefined!118 (toList!854 lt!64004) lt!64002))))

(assert (=> b!125679 (isDefined!119 (getValueByKey!166 (toList!854 lt!64004) lt!64002))))

(declare-fun b!125680 () Bool)

(declare-fun Unit!3917 () Unit!3867)

(assert (=> b!125680 (= e!82096 Unit!3917)))

(declare-fun b!125681 () Bool)

(assert (=> b!125681 (= e!82095 (isDefined!119 (getValueByKey!166 (toList!854 lt!64004) lt!64002)))))

(assert (= (and d!37845 c!22932) b!125679))

(assert (= (and d!37845 (not c!22932)) b!125680))

(assert (= (and d!37845 (not res!60849)) b!125681))

(declare-fun m!146495 () Bool)

(assert (=> d!37845 m!146495))

(declare-fun m!146497 () Bool)

(assert (=> b!125679 m!146497))

(assert (=> b!125679 m!145009))

(assert (=> b!125679 m!145009))

(declare-fun m!146499 () Bool)

(assert (=> b!125679 m!146499))

(assert (=> b!125681 m!145009))

(assert (=> b!125681 m!145009))

(assert (=> b!125681 m!146499))

(assert (=> d!37395 d!37845))

(assert (=> d!37395 d!37389))

(assert (=> d!37395 d!37391))

(assert (=> d!37395 d!37393))

(declare-fun b!125682 () Bool)

(declare-fun e!82099 () Bool)

(declare-fun e!82097 () Bool)

(assert (=> b!125682 (= e!82099 e!82097)))

(declare-fun c!22933 () Bool)

(assert (=> b!125682 (= c!22933 (validKeyInArray!0 (select (arr!2219 (_keys!4493 (_2!1296 lt!64096))) #b00000000000000000000000000000000)))))

(declare-fun b!125683 () Bool)

(declare-fun e!82100 () Bool)

(assert (=> b!125683 (= e!82100 (contains!875 Nil!1693 (select (arr!2219 (_keys!4493 (_2!1296 lt!64096))) #b00000000000000000000000000000000)))))

(declare-fun b!125684 () Bool)

(declare-fun call!13472 () Bool)

(assert (=> b!125684 (= e!82097 call!13472)))

(declare-fun d!37847 () Bool)

(declare-fun res!60850 () Bool)

(declare-fun e!82098 () Bool)

(assert (=> d!37847 (=> res!60850 e!82098)))

(assert (=> d!37847 (= res!60850 (bvsge #b00000000000000000000000000000000 (size!2482 (_keys!4493 (_2!1296 lt!64096)))))))

(assert (=> d!37847 (= (arrayNoDuplicates!0 (_keys!4493 (_2!1296 lt!64096)) #b00000000000000000000000000000000 Nil!1693) e!82098)))

(declare-fun bm!13469 () Bool)

(assert (=> bm!13469 (= call!13472 (arrayNoDuplicates!0 (_keys!4493 (_2!1296 lt!64096)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!22933 (Cons!1692 (select (arr!2219 (_keys!4493 (_2!1296 lt!64096))) #b00000000000000000000000000000000) Nil!1693) Nil!1693)))))

(declare-fun b!125685 () Bool)

(assert (=> b!125685 (= e!82098 e!82099)))

(declare-fun res!60852 () Bool)

(assert (=> b!125685 (=> (not res!60852) (not e!82099))))

(assert (=> b!125685 (= res!60852 (not e!82100))))

(declare-fun res!60851 () Bool)

(assert (=> b!125685 (=> (not res!60851) (not e!82100))))

(assert (=> b!125685 (= res!60851 (validKeyInArray!0 (select (arr!2219 (_keys!4493 (_2!1296 lt!64096))) #b00000000000000000000000000000000)))))

(declare-fun b!125686 () Bool)

(assert (=> b!125686 (= e!82097 call!13472)))

(assert (= (and d!37847 (not res!60850)) b!125685))

(assert (= (and b!125685 res!60851) b!125683))

(assert (= (and b!125685 res!60852) b!125682))

(assert (= (and b!125682 c!22933) b!125684))

(assert (= (and b!125682 (not c!22933)) b!125686))

(assert (= (or b!125684 b!125686) bm!13469))

(assert (=> b!125682 m!145633))

(assert (=> b!125682 m!145633))

(assert (=> b!125682 m!145635))

(assert (=> b!125683 m!145633))

(assert (=> b!125683 m!145633))

(declare-fun m!146501 () Bool)

(assert (=> b!125683 m!146501))

(assert (=> bm!13469 m!145633))

(declare-fun m!146503 () Bool)

(assert (=> bm!13469 m!146503))

(assert (=> b!125685 m!145633))

(assert (=> b!125685 m!145633))

(assert (=> b!125685 m!145635))

(assert (=> b!124915 d!37847))

(declare-fun d!37849 () Bool)

(declare-fun e!82101 () Bool)

(assert (=> d!37849 e!82101))

(declare-fun res!60853 () Bool)

(assert (=> d!37849 (=> res!60853 e!82101)))

(declare-fun lt!64839 () Bool)

(assert (=> d!37849 (= res!60853 (not lt!64839))))

(declare-fun lt!64840 () Bool)

(assert (=> d!37849 (= lt!64839 lt!64840)))

(declare-fun lt!64837 () Unit!3867)

(declare-fun e!82102 () Unit!3867)

(assert (=> d!37849 (= lt!64837 e!82102)))

(declare-fun c!22934 () Bool)

(assert (=> d!37849 (= c!22934 lt!64840)))

(assert (=> d!37849 (= lt!64840 (containsKey!170 (toList!854 lt!64187) (select (arr!2219 (_keys!4493 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> d!37849 (= (contains!873 lt!64187 (select (arr!2219 (_keys!4493 newMap!16)) #b00000000000000000000000000000000)) lt!64839)))

(declare-fun b!125687 () Bool)

(declare-fun lt!64838 () Unit!3867)

(assert (=> b!125687 (= e!82102 lt!64838)))

(assert (=> b!125687 (= lt!64838 (lemmaContainsKeyImpliesGetValueByKeyDefined!118 (toList!854 lt!64187) (select (arr!2219 (_keys!4493 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!125687 (isDefined!119 (getValueByKey!166 (toList!854 lt!64187) (select (arr!2219 (_keys!4493 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!125688 () Bool)

(declare-fun Unit!3918 () Unit!3867)

(assert (=> b!125688 (= e!82102 Unit!3918)))

(declare-fun b!125689 () Bool)

(assert (=> b!125689 (= e!82101 (isDefined!119 (getValueByKey!166 (toList!854 lt!64187) (select (arr!2219 (_keys!4493 newMap!16)) #b00000000000000000000000000000000))))))

(assert (= (and d!37849 c!22934) b!125687))

(assert (= (and d!37849 (not c!22934)) b!125688))

(assert (= (and d!37849 (not res!60853)) b!125689))

(assert (=> d!37849 m!144619))

(declare-fun m!146505 () Bool)

(assert (=> d!37849 m!146505))

(assert (=> b!125687 m!144619))

(declare-fun m!146507 () Bool)

(assert (=> b!125687 m!146507))

(assert (=> b!125687 m!144619))

(assert (=> b!125687 m!145517))

(assert (=> b!125687 m!145517))

(declare-fun m!146509 () Bool)

(assert (=> b!125687 m!146509))

(assert (=> b!125689 m!144619))

(assert (=> b!125689 m!145517))

(assert (=> b!125689 m!145517))

(assert (=> b!125689 m!146509))

(assert (=> b!124780 d!37849))

(declare-fun d!37851 () Bool)

(declare-fun e!82103 () Bool)

(assert (=> d!37851 e!82103))

(declare-fun res!60854 () Bool)

(assert (=> d!37851 (=> res!60854 e!82103)))

(declare-fun lt!64843 () Bool)

(assert (=> d!37851 (= res!60854 (not lt!64843))))

(declare-fun lt!64844 () Bool)

(assert (=> d!37851 (= lt!64843 lt!64844)))

(declare-fun lt!64841 () Unit!3867)

(declare-fun e!82104 () Unit!3867)

(assert (=> d!37851 (= lt!64841 e!82104)))

(declare-fun c!22935 () Bool)

(assert (=> d!37851 (= c!22935 lt!64844)))

(assert (=> d!37851 (= lt!64844 (containsKey!170 (toList!854 lt!64355) (_1!1295 (tuple2!2569 lt!63999 (minValue!2629 (v!3108 (underlying!436 thiss!992)))))))))

(assert (=> d!37851 (= (contains!873 lt!64355 (_1!1295 (tuple2!2569 lt!63999 (minValue!2629 (v!3108 (underlying!436 thiss!992)))))) lt!64843)))

(declare-fun b!125690 () Bool)

(declare-fun lt!64842 () Unit!3867)

(assert (=> b!125690 (= e!82104 lt!64842)))

(assert (=> b!125690 (= lt!64842 (lemmaContainsKeyImpliesGetValueByKeyDefined!118 (toList!854 lt!64355) (_1!1295 (tuple2!2569 lt!63999 (minValue!2629 (v!3108 (underlying!436 thiss!992)))))))))

(assert (=> b!125690 (isDefined!119 (getValueByKey!166 (toList!854 lt!64355) (_1!1295 (tuple2!2569 lt!63999 (minValue!2629 (v!3108 (underlying!436 thiss!992)))))))))

(declare-fun b!125691 () Bool)

(declare-fun Unit!3919 () Unit!3867)

(assert (=> b!125691 (= e!82104 Unit!3919)))

(declare-fun b!125692 () Bool)

(assert (=> b!125692 (= e!82103 (isDefined!119 (getValueByKey!166 (toList!854 lt!64355) (_1!1295 (tuple2!2569 lt!63999 (minValue!2629 (v!3108 (underlying!436 thiss!992))))))))))

(assert (= (and d!37851 c!22935) b!125690))

(assert (= (and d!37851 (not c!22935)) b!125691))

(assert (= (and d!37851 (not res!60854)) b!125692))

(declare-fun m!146511 () Bool)

(assert (=> d!37851 m!146511))

(declare-fun m!146513 () Bool)

(assert (=> b!125690 m!146513))

(assert (=> b!125690 m!145001))

(assert (=> b!125690 m!145001))

(declare-fun m!146515 () Bool)

(assert (=> b!125690 m!146515))

(assert (=> b!125692 m!145001))

(assert (=> b!125692 m!145001))

(assert (=> b!125692 m!146515))

(assert (=> d!37385 d!37851))

(declare-fun d!37853 () Bool)

(declare-fun c!22936 () Bool)

(assert (=> d!37853 (= c!22936 (and ((_ is Cons!1691) lt!64356) (= (_1!1295 (h!2292 lt!64356)) (_1!1295 (tuple2!2569 lt!63999 (minValue!2629 (v!3108 (underlying!436 thiss!992))))))))))

(declare-fun e!82105 () Option!172)

(assert (=> d!37853 (= (getValueByKey!166 lt!64356 (_1!1295 (tuple2!2569 lt!63999 (minValue!2629 (v!3108 (underlying!436 thiss!992)))))) e!82105)))

(declare-fun b!125693 () Bool)

(assert (=> b!125693 (= e!82105 (Some!171 (_2!1295 (h!2292 lt!64356))))))

(declare-fun b!125695 () Bool)

(declare-fun e!82106 () Option!172)

(assert (=> b!125695 (= e!82106 (getValueByKey!166 (t!6022 lt!64356) (_1!1295 (tuple2!2569 lt!63999 (minValue!2629 (v!3108 (underlying!436 thiss!992)))))))))

(declare-fun b!125696 () Bool)

(assert (=> b!125696 (= e!82106 None!170)))

(declare-fun b!125694 () Bool)

(assert (=> b!125694 (= e!82105 e!82106)))

(declare-fun c!22937 () Bool)

(assert (=> b!125694 (= c!22937 (and ((_ is Cons!1691) lt!64356) (not (= (_1!1295 (h!2292 lt!64356)) (_1!1295 (tuple2!2569 lt!63999 (minValue!2629 (v!3108 (underlying!436 thiss!992)))))))))))

(assert (= (and d!37853 c!22936) b!125693))

(assert (= (and d!37853 (not c!22936)) b!125694))

(assert (= (and b!125694 c!22937) b!125695))

(assert (= (and b!125694 (not c!22937)) b!125696))

(declare-fun m!146517 () Bool)

(assert (=> b!125695 m!146517))

(assert (=> d!37385 d!37853))

(declare-fun d!37855 () Bool)

(assert (=> d!37855 (= (getValueByKey!166 lt!64356 (_1!1295 (tuple2!2569 lt!63999 (minValue!2629 (v!3108 (underlying!436 thiss!992)))))) (Some!171 (_2!1295 (tuple2!2569 lt!63999 (minValue!2629 (v!3108 (underlying!436 thiss!992)))))))))

(declare-fun lt!64845 () Unit!3867)

(assert (=> d!37855 (= lt!64845 (choose!756 lt!64356 (_1!1295 (tuple2!2569 lt!63999 (minValue!2629 (v!3108 (underlying!436 thiss!992))))) (_2!1295 (tuple2!2569 lt!63999 (minValue!2629 (v!3108 (underlying!436 thiss!992)))))))))

(declare-fun e!82107 () Bool)

(assert (=> d!37855 e!82107))

(declare-fun res!60855 () Bool)

(assert (=> d!37855 (=> (not res!60855) (not e!82107))))

(assert (=> d!37855 (= res!60855 (isStrictlySorted!316 lt!64356))))

(assert (=> d!37855 (= (lemmaContainsTupThenGetReturnValue!81 lt!64356 (_1!1295 (tuple2!2569 lt!63999 (minValue!2629 (v!3108 (underlying!436 thiss!992))))) (_2!1295 (tuple2!2569 lt!63999 (minValue!2629 (v!3108 (underlying!436 thiss!992)))))) lt!64845)))

(declare-fun b!125697 () Bool)

(declare-fun res!60856 () Bool)

(assert (=> b!125697 (=> (not res!60856) (not e!82107))))

(assert (=> b!125697 (= res!60856 (containsKey!170 lt!64356 (_1!1295 (tuple2!2569 lt!63999 (minValue!2629 (v!3108 (underlying!436 thiss!992)))))))))

(declare-fun b!125698 () Bool)

(assert (=> b!125698 (= e!82107 (contains!874 lt!64356 (tuple2!2569 (_1!1295 (tuple2!2569 lt!63999 (minValue!2629 (v!3108 (underlying!436 thiss!992))))) (_2!1295 (tuple2!2569 lt!63999 (minValue!2629 (v!3108 (underlying!436 thiss!992))))))))))

(assert (= (and d!37855 res!60855) b!125697))

(assert (= (and b!125697 res!60856) b!125698))

(assert (=> d!37855 m!144995))

(declare-fun m!146519 () Bool)

(assert (=> d!37855 m!146519))

(declare-fun m!146521 () Bool)

(assert (=> d!37855 m!146521))

(declare-fun m!146523 () Bool)

(assert (=> b!125697 m!146523))

(declare-fun m!146525 () Bool)

(assert (=> b!125698 m!146525))

(assert (=> d!37385 d!37855))

(declare-fun b!125699 () Bool)

(declare-fun e!82110 () List!1695)

(declare-fun call!13473 () List!1695)

(assert (=> b!125699 (= e!82110 call!13473)))

(declare-fun b!125700 () Bool)

(declare-fun e!82109 () List!1695)

(declare-fun e!82108 () List!1695)

(assert (=> b!125700 (= e!82109 e!82108)))

(declare-fun c!22940 () Bool)

(assert (=> b!125700 (= c!22940 (and ((_ is Cons!1691) (toList!854 lt!64016)) (= (_1!1295 (h!2292 (toList!854 lt!64016))) (_1!1295 (tuple2!2569 lt!63999 (minValue!2629 (v!3108 (underlying!436 thiss!992))))))))))

(declare-fun b!125701 () Bool)

(assert (=> b!125701 (= e!82110 call!13473)))

(declare-fun b!125702 () Bool)

(declare-fun call!13474 () List!1695)

(assert (=> b!125702 (= e!82108 call!13474)))

(declare-fun b!125703 () Bool)

(declare-fun res!60857 () Bool)

(declare-fun e!82111 () Bool)

(assert (=> b!125703 (=> (not res!60857) (not e!82111))))

(declare-fun lt!64846 () List!1695)

(assert (=> b!125703 (= res!60857 (containsKey!170 lt!64846 (_1!1295 (tuple2!2569 lt!63999 (minValue!2629 (v!3108 (underlying!436 thiss!992)))))))))

(declare-fun bm!13470 () Bool)

(assert (=> bm!13470 (= call!13473 call!13474)))

(declare-fun d!37857 () Bool)

(assert (=> d!37857 e!82111))

(declare-fun res!60858 () Bool)

(assert (=> d!37857 (=> (not res!60858) (not e!82111))))

(assert (=> d!37857 (= res!60858 (isStrictlySorted!316 lt!64846))))

(assert (=> d!37857 (= lt!64846 e!82109)))

(declare-fun c!22938 () Bool)

(assert (=> d!37857 (= c!22938 (and ((_ is Cons!1691) (toList!854 lt!64016)) (bvslt (_1!1295 (h!2292 (toList!854 lt!64016))) (_1!1295 (tuple2!2569 lt!63999 (minValue!2629 (v!3108 (underlying!436 thiss!992))))))))))

(assert (=> d!37857 (isStrictlySorted!316 (toList!854 lt!64016))))

(assert (=> d!37857 (= (insertStrictlySorted!84 (toList!854 lt!64016) (_1!1295 (tuple2!2569 lt!63999 (minValue!2629 (v!3108 (underlying!436 thiss!992))))) (_2!1295 (tuple2!2569 lt!63999 (minValue!2629 (v!3108 (underlying!436 thiss!992)))))) lt!64846)))

(declare-fun b!125704 () Bool)

(assert (=> b!125704 (= e!82111 (contains!874 lt!64846 (tuple2!2569 (_1!1295 (tuple2!2569 lt!63999 (minValue!2629 (v!3108 (underlying!436 thiss!992))))) (_2!1295 (tuple2!2569 lt!63999 (minValue!2629 (v!3108 (underlying!436 thiss!992))))))))))

(declare-fun e!82112 () List!1695)

(declare-fun call!13475 () List!1695)

(declare-fun bm!13471 () Bool)

(assert (=> bm!13471 (= call!13475 ($colon$colon!88 e!82112 (ite c!22938 (h!2292 (toList!854 lt!64016)) (tuple2!2569 (_1!1295 (tuple2!2569 lt!63999 (minValue!2629 (v!3108 (underlying!436 thiss!992))))) (_2!1295 (tuple2!2569 lt!63999 (minValue!2629 (v!3108 (underlying!436 thiss!992)))))))))))

(declare-fun c!22941 () Bool)

(assert (=> bm!13471 (= c!22941 c!22938)))

(declare-fun b!125705 () Bool)

(declare-fun c!22939 () Bool)

(assert (=> b!125705 (= c!22939 (and ((_ is Cons!1691) (toList!854 lt!64016)) (bvsgt (_1!1295 (h!2292 (toList!854 lt!64016))) (_1!1295 (tuple2!2569 lt!63999 (minValue!2629 (v!3108 (underlying!436 thiss!992))))))))))

(assert (=> b!125705 (= e!82108 e!82110)))

(declare-fun b!125706 () Bool)

(assert (=> b!125706 (= e!82112 (insertStrictlySorted!84 (t!6022 (toList!854 lt!64016)) (_1!1295 (tuple2!2569 lt!63999 (minValue!2629 (v!3108 (underlying!436 thiss!992))))) (_2!1295 (tuple2!2569 lt!63999 (minValue!2629 (v!3108 (underlying!436 thiss!992)))))))))

(declare-fun b!125707 () Bool)

(assert (=> b!125707 (= e!82109 call!13475)))

(declare-fun bm!13472 () Bool)

(assert (=> bm!13472 (= call!13474 call!13475)))

(declare-fun b!125708 () Bool)

(assert (=> b!125708 (= e!82112 (ite c!22940 (t!6022 (toList!854 lt!64016)) (ite c!22939 (Cons!1691 (h!2292 (toList!854 lt!64016)) (t!6022 (toList!854 lt!64016))) Nil!1692)))))

(assert (= (and d!37857 c!22938) b!125707))

(assert (= (and d!37857 (not c!22938)) b!125700))

(assert (= (and b!125700 c!22940) b!125702))

(assert (= (and b!125700 (not c!22940)) b!125705))

(assert (= (and b!125705 c!22939) b!125699))

(assert (= (and b!125705 (not c!22939)) b!125701))

(assert (= (or b!125699 b!125701) bm!13470))

(assert (= (or b!125702 bm!13470) bm!13472))

(assert (= (or b!125707 bm!13472) bm!13471))

(assert (= (and bm!13471 c!22941) b!125706))

(assert (= (and bm!13471 (not c!22941)) b!125708))

(assert (= (and d!37857 res!60858) b!125703))

(assert (= (and b!125703 res!60857) b!125704))

(declare-fun m!146527 () Bool)

(assert (=> b!125706 m!146527))

(declare-fun m!146529 () Bool)

(assert (=> bm!13471 m!146529))

(declare-fun m!146531 () Bool)

(assert (=> d!37857 m!146531))

(declare-fun m!146533 () Bool)

(assert (=> d!37857 m!146533))

(declare-fun m!146535 () Bool)

(assert (=> b!125703 m!146535))

(declare-fun m!146537 () Bool)

(assert (=> b!125704 m!146537))

(assert (=> d!37385 d!37857))

(declare-fun c!22942 () Bool)

(declare-fun d!37859 () Bool)

(assert (=> d!37859 (= c!22942 (and ((_ is Cons!1691) (toList!854 lt!64309)) (= (_1!1295 (h!2292 (toList!854 lt!64309))) (_1!1295 (tuple2!2569 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun e!82113 () Option!172)

(assert (=> d!37859 (= (getValueByKey!166 (toList!854 lt!64309) (_1!1295 (tuple2!2569 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) e!82113)))

(declare-fun b!125709 () Bool)

(assert (=> b!125709 (= e!82113 (Some!171 (_2!1295 (h!2292 (toList!854 lt!64309)))))))

(declare-fun e!82114 () Option!172)

(declare-fun b!125711 () Bool)

(assert (=> b!125711 (= e!82114 (getValueByKey!166 (t!6022 (toList!854 lt!64309)) (_1!1295 (tuple2!2569 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!125712 () Bool)

(assert (=> b!125712 (= e!82114 None!170)))

(declare-fun b!125710 () Bool)

(assert (=> b!125710 (= e!82113 e!82114)))

(declare-fun c!22943 () Bool)

(assert (=> b!125710 (= c!22943 (and ((_ is Cons!1691) (toList!854 lt!64309)) (not (= (_1!1295 (h!2292 (toList!854 lt!64309))) (_1!1295 (tuple2!2569 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(assert (= (and d!37859 c!22942) b!125709))

(assert (= (and d!37859 (not c!22942)) b!125710))

(assert (= (and b!125710 c!22943) b!125711))

(assert (= (and b!125710 (not c!22943)) b!125712))

(declare-fun m!146539 () Bool)

(assert (=> b!125711 m!146539))

(assert (=> b!124903 d!37859))

(assert (=> b!124843 d!37329))

(declare-fun d!37861 () Bool)

(assert (=> d!37861 (= (apply!110 lt!64339 #b0000000000000000000000000000000000000000000000000000000000000000) (get!1439 (getValueByKey!166 (toList!854 lt!64339) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!5210 () Bool)

(assert (= bs!5210 d!37861))

(assert (=> bs!5210 m!145411))

(assert (=> bs!5210 m!145411))

(declare-fun m!146541 () Bool)

(assert (=> bs!5210 m!146541))

(assert (=> b!124932 d!37861))

(declare-fun d!37863 () Bool)

(declare-fun res!60859 () Bool)

(declare-fun e!82115 () Bool)

(assert (=> d!37863 (=> res!60859 e!82115)))

(assert (=> d!37863 (= res!60859 (= (select (arr!2219 lt!64294) #b00000000000000000000000000000000) (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355)))))

(assert (=> d!37863 (= (arrayContainsKey!0 lt!64294 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355) #b00000000000000000000000000000000) e!82115)))

(declare-fun b!125713 () Bool)

(declare-fun e!82116 () Bool)

(assert (=> b!125713 (= e!82115 e!82116)))

(declare-fun res!60860 () Bool)

(assert (=> b!125713 (=> (not res!60860) (not e!82116))))

(assert (=> b!125713 (= res!60860 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2482 lt!64294)))))

(declare-fun b!125714 () Bool)

(assert (=> b!125714 (= e!82116 (arrayContainsKey!0 lt!64294 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!37863 (not res!60859)) b!125713))

(assert (= (and b!125713 res!60860) b!125714))

(declare-fun m!146543 () Bool)

(assert (=> d!37863 m!146543))

(assert (=> b!125714 m!144415))

(declare-fun m!146545 () Bool)

(assert (=> b!125714 m!146545))

(assert (=> d!37351 d!37863))

(declare-fun d!37865 () Bool)

(assert (=> d!37865 (arrayContainsKey!0 lt!64294 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355) #b00000000000000000000000000000000)))

(declare-fun lt!64849 () Unit!3867)

(declare-fun choose!13 (array!4685 (_ BitVec 64) (_ BitVec 32)) Unit!3867)

(assert (=> d!37865 (= lt!64849 (choose!13 lt!64294 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355) (ite c!22637 (index!3233 lt!64093) (index!3230 lt!64093))))))

(assert (=> d!37865 (bvsge (ite c!22637 (index!3233 lt!64093) (index!3230 lt!64093)) #b00000000000000000000000000000000)))

(assert (=> d!37865 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!64294 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355) (ite c!22637 (index!3233 lt!64093) (index!3230 lt!64093))) lt!64849)))

(declare-fun bs!5211 () Bool)

(assert (= bs!5211 d!37865))

(assert (=> bs!5211 m!144415))

(assert (=> bs!5211 m!144843))

(assert (=> bs!5211 m!144415))

(declare-fun m!146547 () Bool)

(assert (=> bs!5211 m!146547))

(assert (=> d!37351 d!37865))

(assert (=> d!37351 d!37337))

(assert (=> d!37351 d!37339))

(assert (=> d!37351 d!37421))

(assert (=> d!37351 d!37325))

(declare-fun b!125715 () Bool)

(declare-fun e!82119 () Bool)

(declare-fun e!82117 () Bool)

(assert (=> b!125715 (= e!82119 e!82117)))

(declare-fun c!22944 () Bool)

(assert (=> b!125715 (= c!22944 (validKeyInArray!0 (select (arr!2219 (array!4686 (store (arr!2219 (_keys!4493 newMap!16)) (ite c!22637 (index!3233 lt!64093) (index!3230 lt!64093)) (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355)) (size!2482 (_keys!4493 newMap!16)))) lt!64282)))))

(declare-fun e!82120 () Bool)

(declare-fun b!125716 () Bool)

(assert (=> b!125716 (= e!82120 (contains!875 lt!64295 (select (arr!2219 (array!4686 (store (arr!2219 (_keys!4493 newMap!16)) (ite c!22637 (index!3233 lt!64093) (index!3230 lt!64093)) (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355)) (size!2482 (_keys!4493 newMap!16)))) lt!64282)))))

(declare-fun b!125717 () Bool)

(declare-fun call!13476 () Bool)

(assert (=> b!125717 (= e!82117 call!13476)))

(declare-fun d!37867 () Bool)

(declare-fun res!60861 () Bool)

(declare-fun e!82118 () Bool)

(assert (=> d!37867 (=> res!60861 e!82118)))

(assert (=> d!37867 (= res!60861 (bvsge lt!64282 (size!2482 (array!4686 (store (arr!2219 (_keys!4493 newMap!16)) (ite c!22637 (index!3233 lt!64093) (index!3230 lt!64093)) (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355)) (size!2482 (_keys!4493 newMap!16))))))))

(assert (=> d!37867 (= (arrayNoDuplicates!0 (array!4686 (store (arr!2219 (_keys!4493 newMap!16)) (ite c!22637 (index!3233 lt!64093) (index!3230 lt!64093)) (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355)) (size!2482 (_keys!4493 newMap!16))) lt!64282 lt!64295) e!82118)))

(declare-fun bm!13473 () Bool)

(assert (=> bm!13473 (= call!13476 (arrayNoDuplicates!0 (array!4686 (store (arr!2219 (_keys!4493 newMap!16)) (ite c!22637 (index!3233 lt!64093) (index!3230 lt!64093)) (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355)) (size!2482 (_keys!4493 newMap!16))) (bvadd lt!64282 #b00000000000000000000000000000001) (ite c!22944 (Cons!1692 (select (arr!2219 (array!4686 (store (arr!2219 (_keys!4493 newMap!16)) (ite c!22637 (index!3233 lt!64093) (index!3230 lt!64093)) (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355)) (size!2482 (_keys!4493 newMap!16)))) lt!64282) lt!64295) lt!64295)))))

(declare-fun b!125718 () Bool)

(assert (=> b!125718 (= e!82118 e!82119)))

(declare-fun res!60863 () Bool)

(assert (=> b!125718 (=> (not res!60863) (not e!82119))))

(assert (=> b!125718 (= res!60863 (not e!82120))))

(declare-fun res!60862 () Bool)

(assert (=> b!125718 (=> (not res!60862) (not e!82120))))

(assert (=> b!125718 (= res!60862 (validKeyInArray!0 (select (arr!2219 (array!4686 (store (arr!2219 (_keys!4493 newMap!16)) (ite c!22637 (index!3233 lt!64093) (index!3230 lt!64093)) (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355)) (size!2482 (_keys!4493 newMap!16)))) lt!64282)))))

(declare-fun b!125719 () Bool)

(assert (=> b!125719 (= e!82117 call!13476)))

(assert (= (and d!37867 (not res!60861)) b!125718))

(assert (= (and b!125718 res!60862) b!125716))

(assert (= (and b!125718 res!60863) b!125715))

(assert (= (and b!125715 c!22944) b!125717))

(assert (= (and b!125715 (not c!22944)) b!125719))

(assert (= (or b!125717 b!125719) bm!13473))

(declare-fun m!146549 () Bool)

(assert (=> b!125715 m!146549))

(assert (=> b!125715 m!146549))

(declare-fun m!146551 () Bool)

(assert (=> b!125715 m!146551))

(assert (=> b!125716 m!146549))

(assert (=> b!125716 m!146549))

(declare-fun m!146553 () Bool)

(assert (=> b!125716 m!146553))

(assert (=> bm!13473 m!146549))

(declare-fun m!146555 () Bool)

(assert (=> bm!13473 m!146555))

(assert (=> b!125718 m!146549))

(assert (=> b!125718 m!146549))

(assert (=> b!125718 m!146551))

(assert (=> d!37351 d!37867))

(declare-fun d!37869 () Bool)

(declare-fun e!82123 () Bool)

(assert (=> d!37869 e!82123))

(declare-fun res!60866 () Bool)

(assert (=> d!37869 (=> (not res!60866) (not e!82123))))

(assert (=> d!37869 (= res!60866 (and (bvsge (ite c!22637 (index!3233 lt!64093) (index!3230 lt!64093)) #b00000000000000000000000000000000) (bvslt (ite c!22637 (index!3233 lt!64093) (index!3230 lt!64093)) (size!2482 (_keys!4493 newMap!16)))))))

(declare-fun lt!64852 () Unit!3867)

(declare-fun choose!41 (array!4685 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!1696) Unit!3867)

(assert (=> d!37869 (= lt!64852 (choose!41 (_keys!4493 newMap!16) (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355) (ite c!22637 (index!3233 lt!64093) (index!3230 lt!64093)) lt!64282 lt!64295))))

(assert (=> d!37869 (bvslt (size!2482 (_keys!4493 newMap!16)) #b01111111111111111111111111111111)))

(assert (=> d!37869 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!4493 newMap!16) (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355) (ite c!22637 (index!3233 lt!64093) (index!3230 lt!64093)) lt!64282 lt!64295) lt!64852)))

(declare-fun b!125722 () Bool)

(assert (=> b!125722 (= e!82123 (arrayNoDuplicates!0 (array!4686 (store (arr!2219 (_keys!4493 newMap!16)) (ite c!22637 (index!3233 lt!64093) (index!3230 lt!64093)) (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355)) (size!2482 (_keys!4493 newMap!16))) lt!64282 lt!64295))))

(assert (= (and d!37869 res!60866) b!125722))

(assert (=> d!37869 m!144415))

(declare-fun m!146557 () Bool)

(assert (=> d!37869 m!146557))

(assert (=> b!125722 m!144841))

(assert (=> b!125722 m!144847))

(assert (=> d!37351 d!37869))

(declare-fun d!37871 () Bool)

(declare-fun e!82126 () Bool)

(assert (=> d!37871 e!82126))

(declare-fun res!60869 () Bool)

(assert (=> d!37871 (=> (not res!60869) (not e!82126))))

(assert (=> d!37871 (= res!60869 (and (bvsge (ite c!22637 (index!3233 lt!64093) (index!3230 lt!64093)) #b00000000000000000000000000000000) (bvslt (ite c!22637 (index!3233 lt!64093) (index!3230 lt!64093)) (size!2482 (_keys!4493 newMap!16)))))))

(declare-fun lt!64855 () Unit!3867)

(declare-fun choose!102 ((_ BitVec 64) array!4685 (_ BitVec 32) (_ BitVec 32)) Unit!3867)

(assert (=> d!37871 (= lt!64855 (choose!102 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355) (_keys!4493 newMap!16) (ite c!22637 (index!3233 lt!64093) (index!3230 lt!64093)) (mask!7010 newMap!16)))))

(assert (=> d!37871 (validMask!0 (mask!7010 newMap!16))))

(assert (=> d!37871 (= (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355) (_keys!4493 newMap!16) (ite c!22637 (index!3233 lt!64093) (index!3230 lt!64093)) (mask!7010 newMap!16)) lt!64855)))

(declare-fun b!125725 () Bool)

(assert (=> b!125725 (= e!82126 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!4686 (store (arr!2219 (_keys!4493 newMap!16)) (ite c!22637 (index!3233 lt!64093) (index!3230 lt!64093)) (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355)) (size!2482 (_keys!4493 newMap!16))) (mask!7010 newMap!16)))))

(assert (= (and d!37871 res!60869) b!125725))

(assert (=> d!37871 m!144415))

(declare-fun m!146559 () Bool)

(assert (=> d!37871 m!146559))

(assert (=> d!37871 m!144633))

(assert (=> b!125725 m!144841))

(assert (=> b!125725 m!144859))

(assert (=> d!37351 d!37871))

(declare-fun d!37873 () Bool)

(declare-fun e!82127 () Bool)

(assert (=> d!37873 e!82127))

(declare-fun res!60870 () Bool)

(assert (=> d!37873 (=> res!60870 e!82127)))

(declare-fun lt!64858 () Bool)

(assert (=> d!37873 (= res!60870 (not lt!64858))))

(declare-fun lt!64859 () Bool)

(assert (=> d!37873 (= lt!64858 lt!64859)))

(declare-fun lt!64856 () Unit!3867)

(declare-fun e!82128 () Unit!3867)

(assert (=> d!37873 (= lt!64856 e!82128)))

(declare-fun c!22945 () Bool)

(assert (=> d!37873 (= c!22945 lt!64859)))

(assert (=> d!37873 (= lt!64859 (containsKey!170 (toList!854 (getCurrentListMap!535 lt!64304 lt!64279 (mask!7010 newMap!16) (extraKeys!2549 newMap!16) (zeroValue!2629 newMap!16) (minValue!2629 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2764 newMap!16))) (select (store (arr!2219 (_keys!4493 newMap!16)) (ite c!22637 (index!3233 lt!64093) (index!3230 lt!64093)) (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355)) (ite c!22637 (index!3233 lt!64093) (index!3230 lt!64093)))))))

(assert (=> d!37873 (= (contains!873 (getCurrentListMap!535 lt!64304 lt!64279 (mask!7010 newMap!16) (extraKeys!2549 newMap!16) (zeroValue!2629 newMap!16) (minValue!2629 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2764 newMap!16)) (select (store (arr!2219 (_keys!4493 newMap!16)) (ite c!22637 (index!3233 lt!64093) (index!3230 lt!64093)) (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355)) (ite c!22637 (index!3233 lt!64093) (index!3230 lt!64093)))) lt!64858)))

(declare-fun b!125726 () Bool)

(declare-fun lt!64857 () Unit!3867)

(assert (=> b!125726 (= e!82128 lt!64857)))

(assert (=> b!125726 (= lt!64857 (lemmaContainsKeyImpliesGetValueByKeyDefined!118 (toList!854 (getCurrentListMap!535 lt!64304 lt!64279 (mask!7010 newMap!16) (extraKeys!2549 newMap!16) (zeroValue!2629 newMap!16) (minValue!2629 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2764 newMap!16))) (select (store (arr!2219 (_keys!4493 newMap!16)) (ite c!22637 (index!3233 lt!64093) (index!3230 lt!64093)) (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355)) (ite c!22637 (index!3233 lt!64093) (index!3230 lt!64093)))))))

(assert (=> b!125726 (isDefined!119 (getValueByKey!166 (toList!854 (getCurrentListMap!535 lt!64304 lt!64279 (mask!7010 newMap!16) (extraKeys!2549 newMap!16) (zeroValue!2629 newMap!16) (minValue!2629 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2764 newMap!16))) (select (store (arr!2219 (_keys!4493 newMap!16)) (ite c!22637 (index!3233 lt!64093) (index!3230 lt!64093)) (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355)) (ite c!22637 (index!3233 lt!64093) (index!3230 lt!64093)))))))

(declare-fun b!125727 () Bool)

(declare-fun Unit!3920 () Unit!3867)

(assert (=> b!125727 (= e!82128 Unit!3920)))

(declare-fun b!125728 () Bool)

(assert (=> b!125728 (= e!82127 (isDefined!119 (getValueByKey!166 (toList!854 (getCurrentListMap!535 lt!64304 lt!64279 (mask!7010 newMap!16) (extraKeys!2549 newMap!16) (zeroValue!2629 newMap!16) (minValue!2629 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2764 newMap!16))) (select (store (arr!2219 (_keys!4493 newMap!16)) (ite c!22637 (index!3233 lt!64093) (index!3230 lt!64093)) (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355)) (ite c!22637 (index!3233 lt!64093) (index!3230 lt!64093))))))))

(assert (= (and d!37873 c!22945) b!125726))

(assert (= (and d!37873 (not c!22945)) b!125727))

(assert (= (and d!37873 (not res!60870)) b!125728))

(assert (=> d!37873 m!144839))

(declare-fun m!146561 () Bool)

(assert (=> d!37873 m!146561))

(assert (=> b!125726 m!144839))

(declare-fun m!146563 () Bool)

(assert (=> b!125726 m!146563))

(assert (=> b!125726 m!144839))

(declare-fun m!146565 () Bool)

(assert (=> b!125726 m!146565))

(assert (=> b!125726 m!146565))

(declare-fun m!146567 () Bool)

(assert (=> b!125726 m!146567))

(assert (=> b!125728 m!144839))

(assert (=> b!125728 m!146565))

(assert (=> b!125728 m!146565))

(assert (=> b!125728 m!146567))

(assert (=> d!37351 d!37873))

(declare-fun call!13477 () ListLongMap!1677)

(declare-fun bm!13474 () Bool)

(assert (=> bm!13474 (= call!13477 (getCurrentListMapNoExtraKeys!135 (array!4686 (store (arr!2219 (_keys!4493 newMap!16)) (ite c!22637 (index!3233 lt!64093) (index!3230 lt!64093)) (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355)) (size!2482 (_keys!4493 newMap!16))) (array!4688 (store (arr!2220 (_values!2747 newMap!16)) (ite c!22637 (index!3233 lt!64093) (index!3230 lt!64093)) (ValueCellFull!1074 (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2483 (_values!2747 newMap!16))) (mask!7010 newMap!16) (extraKeys!2549 newMap!16) (zeroValue!2629 newMap!16) (minValue!2629 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2764 newMap!16)))))

(declare-fun c!22949 () Bool)

(declare-fun bm!13475 () Bool)

(declare-fun call!13483 () ListLongMap!1677)

(declare-fun call!13479 () ListLongMap!1677)

(declare-fun c!22951 () Bool)

(declare-fun call!13478 () ListLongMap!1677)

(assert (=> bm!13475 (= call!13483 (+!169 (ite c!22951 call!13477 (ite c!22949 call!13479 call!13478)) (ite (or c!22951 c!22949) (tuple2!2569 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2629 newMap!16)) (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2629 newMap!16)))))))

(declare-fun bm!13476 () Bool)

(assert (=> bm!13476 (= call!13479 call!13477)))

(declare-fun b!125730 () Bool)

(declare-fun e!82132 () ListLongMap!1677)

(declare-fun call!13482 () ListLongMap!1677)

(assert (=> b!125730 (= e!82132 call!13482)))

(declare-fun b!125731 () Bool)

(declare-fun e!82137 () ListLongMap!1677)

(assert (=> b!125731 (= e!82137 call!13478)))

(declare-fun b!125732 () Bool)

(declare-fun e!82139 () ListLongMap!1677)

(assert (=> b!125732 (= e!82139 e!82132)))

(assert (=> b!125732 (= c!22949 (and (not (= (bvand (extraKeys!2549 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2549 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!125733 () Bool)

(declare-fun e!82140 () Bool)

(declare-fun call!13481 () Bool)

(assert (=> b!125733 (= e!82140 (not call!13481))))

(declare-fun b!125734 () Bool)

(declare-fun e!82135 () Bool)

(declare-fun e!82138 () Bool)

(assert (=> b!125734 (= e!82135 e!82138)))

(declare-fun res!60879 () Bool)

(assert (=> b!125734 (=> (not res!60879) (not e!82138))))

(declare-fun lt!64875 () ListLongMap!1677)

(assert (=> b!125734 (= res!60879 (contains!873 lt!64875 (select (arr!2219 (array!4686 (store (arr!2219 (_keys!4493 newMap!16)) (ite c!22637 (index!3233 lt!64093) (index!3230 lt!64093)) (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355)) (size!2482 (_keys!4493 newMap!16)))) #b00000000000000000000000000000000)))))

(assert (=> b!125734 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2482 (array!4686 (store (arr!2219 (_keys!4493 newMap!16)) (ite c!22637 (index!3233 lt!64093) (index!3230 lt!64093)) (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355)) (size!2482 (_keys!4493 newMap!16))))))))

(declare-fun bm!13477 () Bool)

(assert (=> bm!13477 (= call!13478 call!13479)))

(declare-fun b!125735 () Bool)

(declare-fun e!82136 () Bool)

(declare-fun call!13480 () Bool)

(assert (=> b!125735 (= e!82136 (not call!13480))))

(declare-fun b!125736 () Bool)

(declare-fun e!82134 () Unit!3867)

(declare-fun Unit!3921 () Unit!3867)

(assert (=> b!125736 (= e!82134 Unit!3921)))

(declare-fun e!82129 () Bool)

(declare-fun b!125737 () Bool)

(assert (=> b!125737 (= e!82129 (validKeyInArray!0 (select (arr!2219 (array!4686 (store (arr!2219 (_keys!4493 newMap!16)) (ite c!22637 (index!3233 lt!64093) (index!3230 lt!64093)) (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355)) (size!2482 (_keys!4493 newMap!16)))) #b00000000000000000000000000000000)))))

(declare-fun b!125738 () Bool)

(declare-fun e!82130 () Bool)

(assert (=> b!125738 (= e!82136 e!82130)))

(declare-fun res!60872 () Bool)

(assert (=> b!125738 (= res!60872 call!13480)))

(assert (=> b!125738 (=> (not res!60872) (not e!82130))))

(declare-fun b!125739 () Bool)

(declare-fun lt!64871 () Unit!3867)

(assert (=> b!125739 (= e!82134 lt!64871)))

(declare-fun lt!64860 () ListLongMap!1677)

(assert (=> b!125739 (= lt!64860 (getCurrentListMapNoExtraKeys!135 (array!4686 (store (arr!2219 (_keys!4493 newMap!16)) (ite c!22637 (index!3233 lt!64093) (index!3230 lt!64093)) (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355)) (size!2482 (_keys!4493 newMap!16))) (array!4688 (store (arr!2220 (_values!2747 newMap!16)) (ite c!22637 (index!3233 lt!64093) (index!3230 lt!64093)) (ValueCellFull!1074 (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2483 (_values!2747 newMap!16))) (mask!7010 newMap!16) (extraKeys!2549 newMap!16) (zeroValue!2629 newMap!16) (minValue!2629 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2764 newMap!16)))))

(declare-fun lt!64866 () (_ BitVec 64))

(assert (=> b!125739 (= lt!64866 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!64876 () (_ BitVec 64))

(assert (=> b!125739 (= lt!64876 (select (arr!2219 (array!4686 (store (arr!2219 (_keys!4493 newMap!16)) (ite c!22637 (index!3233 lt!64093) (index!3230 lt!64093)) (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355)) (size!2482 (_keys!4493 newMap!16)))) #b00000000000000000000000000000000))))

(declare-fun lt!64861 () Unit!3867)

(assert (=> b!125739 (= lt!64861 (addStillContains!86 lt!64860 lt!64866 (zeroValue!2629 newMap!16) lt!64876))))

(assert (=> b!125739 (contains!873 (+!169 lt!64860 (tuple2!2569 lt!64866 (zeroValue!2629 newMap!16))) lt!64876)))

(declare-fun lt!64878 () Unit!3867)

(assert (=> b!125739 (= lt!64878 lt!64861)))

(declare-fun lt!64879 () ListLongMap!1677)

(assert (=> b!125739 (= lt!64879 (getCurrentListMapNoExtraKeys!135 (array!4686 (store (arr!2219 (_keys!4493 newMap!16)) (ite c!22637 (index!3233 lt!64093) (index!3230 lt!64093)) (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355)) (size!2482 (_keys!4493 newMap!16))) (array!4688 (store (arr!2220 (_values!2747 newMap!16)) (ite c!22637 (index!3233 lt!64093) (index!3230 lt!64093)) (ValueCellFull!1074 (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2483 (_values!2747 newMap!16))) (mask!7010 newMap!16) (extraKeys!2549 newMap!16) (zeroValue!2629 newMap!16) (minValue!2629 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2764 newMap!16)))))

(declare-fun lt!64862 () (_ BitVec 64))

(assert (=> b!125739 (= lt!64862 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!64874 () (_ BitVec 64))

(assert (=> b!125739 (= lt!64874 (select (arr!2219 (array!4686 (store (arr!2219 (_keys!4493 newMap!16)) (ite c!22637 (index!3233 lt!64093) (index!3230 lt!64093)) (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355)) (size!2482 (_keys!4493 newMap!16)))) #b00000000000000000000000000000000))))

(declare-fun lt!64872 () Unit!3867)

(assert (=> b!125739 (= lt!64872 (addApplyDifferent!86 lt!64879 lt!64862 (minValue!2629 newMap!16) lt!64874))))

(assert (=> b!125739 (= (apply!110 (+!169 lt!64879 (tuple2!2569 lt!64862 (minValue!2629 newMap!16))) lt!64874) (apply!110 lt!64879 lt!64874))))

(declare-fun lt!64877 () Unit!3867)

(assert (=> b!125739 (= lt!64877 lt!64872)))

(declare-fun lt!64870 () ListLongMap!1677)

(assert (=> b!125739 (= lt!64870 (getCurrentListMapNoExtraKeys!135 (array!4686 (store (arr!2219 (_keys!4493 newMap!16)) (ite c!22637 (index!3233 lt!64093) (index!3230 lt!64093)) (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355)) (size!2482 (_keys!4493 newMap!16))) (array!4688 (store (arr!2220 (_values!2747 newMap!16)) (ite c!22637 (index!3233 lt!64093) (index!3230 lt!64093)) (ValueCellFull!1074 (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2483 (_values!2747 newMap!16))) (mask!7010 newMap!16) (extraKeys!2549 newMap!16) (zeroValue!2629 newMap!16) (minValue!2629 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2764 newMap!16)))))

(declare-fun lt!64880 () (_ BitVec 64))

(assert (=> b!125739 (= lt!64880 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!64868 () (_ BitVec 64))

(assert (=> b!125739 (= lt!64868 (select (arr!2219 (array!4686 (store (arr!2219 (_keys!4493 newMap!16)) (ite c!22637 (index!3233 lt!64093) (index!3230 lt!64093)) (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355)) (size!2482 (_keys!4493 newMap!16)))) #b00000000000000000000000000000000))))

(declare-fun lt!64881 () Unit!3867)

(assert (=> b!125739 (= lt!64881 (addApplyDifferent!86 lt!64870 lt!64880 (zeroValue!2629 newMap!16) lt!64868))))

(assert (=> b!125739 (= (apply!110 (+!169 lt!64870 (tuple2!2569 lt!64880 (zeroValue!2629 newMap!16))) lt!64868) (apply!110 lt!64870 lt!64868))))

(declare-fun lt!64873 () Unit!3867)

(assert (=> b!125739 (= lt!64873 lt!64881)))

(declare-fun lt!64867 () ListLongMap!1677)

(assert (=> b!125739 (= lt!64867 (getCurrentListMapNoExtraKeys!135 (array!4686 (store (arr!2219 (_keys!4493 newMap!16)) (ite c!22637 (index!3233 lt!64093) (index!3230 lt!64093)) (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355)) (size!2482 (_keys!4493 newMap!16))) (array!4688 (store (arr!2220 (_values!2747 newMap!16)) (ite c!22637 (index!3233 lt!64093) (index!3230 lt!64093)) (ValueCellFull!1074 (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2483 (_values!2747 newMap!16))) (mask!7010 newMap!16) (extraKeys!2549 newMap!16) (zeroValue!2629 newMap!16) (minValue!2629 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2764 newMap!16)))))

(declare-fun lt!64864 () (_ BitVec 64))

(assert (=> b!125739 (= lt!64864 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!64865 () (_ BitVec 64))

(assert (=> b!125739 (= lt!64865 (select (arr!2219 (array!4686 (store (arr!2219 (_keys!4493 newMap!16)) (ite c!22637 (index!3233 lt!64093) (index!3230 lt!64093)) (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355)) (size!2482 (_keys!4493 newMap!16)))) #b00000000000000000000000000000000))))

(assert (=> b!125739 (= lt!64871 (addApplyDifferent!86 lt!64867 lt!64864 (minValue!2629 newMap!16) lt!64865))))

(assert (=> b!125739 (= (apply!110 (+!169 lt!64867 (tuple2!2569 lt!64864 (minValue!2629 newMap!16))) lt!64865) (apply!110 lt!64867 lt!64865))))

(declare-fun b!125740 () Bool)

(declare-fun res!60877 () Bool)

(declare-fun e!82133 () Bool)

(assert (=> b!125740 (=> (not res!60877) (not e!82133))))

(assert (=> b!125740 (= res!60877 e!82136)))

(declare-fun c!22947 () Bool)

(assert (=> b!125740 (= c!22947 (not (= (bvand (extraKeys!2549 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!125741 () Bool)

(declare-fun c!22950 () Bool)

(assert (=> b!125741 (= c!22950 (and (not (= (bvand (extraKeys!2549 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2549 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!125741 (= e!82132 e!82137)))

(declare-fun b!125742 () Bool)

(assert (=> b!125742 (= e!82130 (= (apply!110 lt!64875 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2629 newMap!16)))))

(declare-fun bm!13478 () Bool)

(assert (=> bm!13478 (= call!13480 (contains!873 lt!64875 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!125743 () Bool)

(assert (=> b!125743 (= e!82139 (+!169 call!13483 (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2629 newMap!16))))))

(declare-fun b!125729 () Bool)

(assert (=> b!125729 (= e!82138 (= (apply!110 lt!64875 (select (arr!2219 (array!4686 (store (arr!2219 (_keys!4493 newMap!16)) (ite c!22637 (index!3233 lt!64093) (index!3230 lt!64093)) (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355)) (size!2482 (_keys!4493 newMap!16)))) #b00000000000000000000000000000000)) (get!1436 (select (arr!2220 (array!4688 (store (arr!2220 (_values!2747 newMap!16)) (ite c!22637 (index!3233 lt!64093) (index!3230 lt!64093)) (ValueCellFull!1074 (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2483 (_values!2747 newMap!16)))) #b00000000000000000000000000000000) (dynLambda!411 (defaultEntry!2764 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!125729 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2483 (array!4688 (store (arr!2220 (_values!2747 newMap!16)) (ite c!22637 (index!3233 lt!64093) (index!3230 lt!64093)) (ValueCellFull!1074 (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2483 (_values!2747 newMap!16))))))))

(assert (=> b!125729 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2482 (array!4686 (store (arr!2219 (_keys!4493 newMap!16)) (ite c!22637 (index!3233 lt!64093) (index!3230 lt!64093)) (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355)) (size!2482 (_keys!4493 newMap!16))))))))

(declare-fun d!37875 () Bool)

(assert (=> d!37875 e!82133))

(declare-fun res!60873 () Bool)

(assert (=> d!37875 (=> (not res!60873) (not e!82133))))

(assert (=> d!37875 (= res!60873 (or (bvsge #b00000000000000000000000000000000 (size!2482 (array!4686 (store (arr!2219 (_keys!4493 newMap!16)) (ite c!22637 (index!3233 lt!64093) (index!3230 lt!64093)) (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355)) (size!2482 (_keys!4493 newMap!16))))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2482 (array!4686 (store (arr!2219 (_keys!4493 newMap!16)) (ite c!22637 (index!3233 lt!64093) (index!3230 lt!64093)) (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355)) (size!2482 (_keys!4493 newMap!16))))))))))

(declare-fun lt!64863 () ListLongMap!1677)

(assert (=> d!37875 (= lt!64875 lt!64863)))

(declare-fun lt!64869 () Unit!3867)

(assert (=> d!37875 (= lt!64869 e!82134)))

(declare-fun c!22948 () Bool)

(declare-fun e!82131 () Bool)

(assert (=> d!37875 (= c!22948 e!82131)))

(declare-fun res!60874 () Bool)

(assert (=> d!37875 (=> (not res!60874) (not e!82131))))

(assert (=> d!37875 (= res!60874 (bvslt #b00000000000000000000000000000000 (size!2482 (array!4686 (store (arr!2219 (_keys!4493 newMap!16)) (ite c!22637 (index!3233 lt!64093) (index!3230 lt!64093)) (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355)) (size!2482 (_keys!4493 newMap!16))))))))

(assert (=> d!37875 (= lt!64863 e!82139)))

(assert (=> d!37875 (= c!22951 (and (not (= (bvand (extraKeys!2549 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2549 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!37875 (validMask!0 (mask!7010 newMap!16))))

(assert (=> d!37875 (= (getCurrentListMap!535 (array!4686 (store (arr!2219 (_keys!4493 newMap!16)) (ite c!22637 (index!3233 lt!64093) (index!3230 lt!64093)) (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355)) (size!2482 (_keys!4493 newMap!16))) (array!4688 (store (arr!2220 (_values!2747 newMap!16)) (ite c!22637 (index!3233 lt!64093) (index!3230 lt!64093)) (ValueCellFull!1074 (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2483 (_values!2747 newMap!16))) (mask!7010 newMap!16) (extraKeys!2549 newMap!16) (zeroValue!2629 newMap!16) (minValue!2629 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2764 newMap!16)) lt!64875)))

(declare-fun bm!13479 () Bool)

(assert (=> bm!13479 (= call!13482 call!13483)))

(declare-fun b!125744 () Bool)

(assert (=> b!125744 (= e!82133 e!82140)))

(declare-fun c!22946 () Bool)

(assert (=> b!125744 (= c!22946 (not (= (bvand (extraKeys!2549 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!13480 () Bool)

(assert (=> bm!13480 (= call!13481 (contains!873 lt!64875 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!125745 () Bool)

(assert (=> b!125745 (= e!82131 (validKeyInArray!0 (select (arr!2219 (array!4686 (store (arr!2219 (_keys!4493 newMap!16)) (ite c!22637 (index!3233 lt!64093) (index!3230 lt!64093)) (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355)) (size!2482 (_keys!4493 newMap!16)))) #b00000000000000000000000000000000)))))

(declare-fun b!125746 () Bool)

(declare-fun e!82141 () Bool)

(assert (=> b!125746 (= e!82140 e!82141)))

(declare-fun res!60878 () Bool)

(assert (=> b!125746 (= res!60878 call!13481)))

(assert (=> b!125746 (=> (not res!60878) (not e!82141))))

(declare-fun b!125747 () Bool)

(declare-fun res!60875 () Bool)

(assert (=> b!125747 (=> (not res!60875) (not e!82133))))

(assert (=> b!125747 (= res!60875 e!82135)))

(declare-fun res!60871 () Bool)

(assert (=> b!125747 (=> res!60871 e!82135)))

(assert (=> b!125747 (= res!60871 (not e!82129))))

(declare-fun res!60876 () Bool)

(assert (=> b!125747 (=> (not res!60876) (not e!82129))))

(assert (=> b!125747 (= res!60876 (bvslt #b00000000000000000000000000000000 (size!2482 (array!4686 (store (arr!2219 (_keys!4493 newMap!16)) (ite c!22637 (index!3233 lt!64093) (index!3230 lt!64093)) (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355)) (size!2482 (_keys!4493 newMap!16))))))))

(declare-fun b!125748 () Bool)

(assert (=> b!125748 (= e!82137 call!13482)))

(declare-fun b!125749 () Bool)

(assert (=> b!125749 (= e!82141 (= (apply!110 lt!64875 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2629 newMap!16)))))

(assert (= (and d!37875 c!22951) b!125743))

(assert (= (and d!37875 (not c!22951)) b!125732))

(assert (= (and b!125732 c!22949) b!125730))

(assert (= (and b!125732 (not c!22949)) b!125741))

(assert (= (and b!125741 c!22950) b!125748))

(assert (= (and b!125741 (not c!22950)) b!125731))

(assert (= (or b!125748 b!125731) bm!13477))

(assert (= (or b!125730 bm!13477) bm!13476))

(assert (= (or b!125730 b!125748) bm!13479))

(assert (= (or b!125743 bm!13476) bm!13474))

(assert (= (or b!125743 bm!13479) bm!13475))

(assert (= (and d!37875 res!60874) b!125745))

(assert (= (and d!37875 c!22948) b!125739))

(assert (= (and d!37875 (not c!22948)) b!125736))

(assert (= (and d!37875 res!60873) b!125747))

(assert (= (and b!125747 res!60876) b!125737))

(assert (= (and b!125747 (not res!60871)) b!125734))

(assert (= (and b!125734 res!60879) b!125729))

(assert (= (and b!125747 res!60875) b!125740))

(assert (= (and b!125740 c!22947) b!125738))

(assert (= (and b!125740 (not c!22947)) b!125735))

(assert (= (and b!125738 res!60872) b!125742))

(assert (= (or b!125738 b!125735) bm!13478))

(assert (= (and b!125740 res!60877) b!125744))

(assert (= (and b!125744 c!22946) b!125746))

(assert (= (and b!125744 (not c!22946)) b!125733))

(assert (= (and b!125746 res!60878) b!125749))

(assert (= (or b!125746 b!125733) bm!13480))

(declare-fun b_lambda!5515 () Bool)

(assert (=> (not b_lambda!5515) (not b!125729)))

(assert (=> b!125729 t!6029))

(declare-fun b_and!7735 () Bool)

(assert (= b_and!7731 (and (=> t!6029 result!3819) b_and!7735)))

(assert (=> b!125729 t!6031))

(declare-fun b_and!7737 () Bool)

(assert (= b_and!7733 (and (=> t!6031 result!3821) b_and!7737)))

(declare-fun m!146569 () Bool)

(assert (=> b!125745 m!146569))

(assert (=> b!125745 m!146569))

(declare-fun m!146571 () Bool)

(assert (=> b!125745 m!146571))

(declare-fun m!146573 () Bool)

(assert (=> b!125729 m!146573))

(assert (=> b!125729 m!144721))

(declare-fun m!146575 () Bool)

(assert (=> b!125729 m!146575))

(assert (=> b!125729 m!146569))

(assert (=> b!125729 m!144721))

(assert (=> b!125729 m!146569))

(declare-fun m!146577 () Bool)

(assert (=> b!125729 m!146577))

(assert (=> b!125729 m!146573))

(assert (=> b!125737 m!146569))

(assert (=> b!125737 m!146569))

(assert (=> b!125737 m!146571))

(declare-fun m!146579 () Bool)

(assert (=> b!125739 m!146579))

(declare-fun m!146581 () Bool)

(assert (=> b!125739 m!146581))

(declare-fun m!146583 () Bool)

(assert (=> b!125739 m!146583))

(declare-fun m!146585 () Bool)

(assert (=> b!125739 m!146585))

(assert (=> b!125739 m!146569))

(declare-fun m!146587 () Bool)

(assert (=> b!125739 m!146587))

(declare-fun m!146589 () Bool)

(assert (=> b!125739 m!146589))

(declare-fun m!146591 () Bool)

(assert (=> b!125739 m!146591))

(assert (=> b!125739 m!146591))

(declare-fun m!146593 () Bool)

(assert (=> b!125739 m!146593))

(declare-fun m!146595 () Bool)

(assert (=> b!125739 m!146595))

(declare-fun m!146597 () Bool)

(assert (=> b!125739 m!146597))

(assert (=> b!125739 m!146585))

(declare-fun m!146599 () Bool)

(assert (=> b!125739 m!146599))

(declare-fun m!146601 () Bool)

(assert (=> b!125739 m!146601))

(declare-fun m!146603 () Bool)

(assert (=> b!125739 m!146603))

(declare-fun m!146605 () Bool)

(assert (=> b!125739 m!146605))

(assert (=> b!125739 m!146595))

(declare-fun m!146607 () Bool)

(assert (=> b!125739 m!146607))

(assert (=> b!125739 m!146581))

(declare-fun m!146609 () Bool)

(assert (=> b!125739 m!146609))

(assert (=> b!125734 m!146569))

(assert (=> b!125734 m!146569))

(declare-fun m!146611 () Bool)

(assert (=> b!125734 m!146611))

(declare-fun m!146613 () Bool)

(assert (=> b!125743 m!146613))

(declare-fun m!146615 () Bool)

(assert (=> b!125749 m!146615))

(declare-fun m!146617 () Bool)

(assert (=> bm!13478 m!146617))

(assert (=> bm!13474 m!146607))

(declare-fun m!146619 () Bool)

(assert (=> bm!13480 m!146619))

(declare-fun m!146621 () Bool)

(assert (=> b!125742 m!146621))

(declare-fun m!146623 () Bool)

(assert (=> bm!13475 m!146623))

(assert (=> d!37875 m!144633))

(assert (=> d!37351 d!37875))

(assert (=> d!37351 d!37699))

(declare-fun d!37877 () Bool)

(declare-fun lt!64882 () (_ BitVec 32))

(assert (=> d!37877 (and (bvsge lt!64882 #b00000000000000000000000000000000) (bvsle lt!64882 (bvsub (size!2482 (array!4686 (store (arr!2219 (_keys!4493 newMap!16)) (ite c!22637 (index!3233 lt!64093) (index!3230 lt!64093)) (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355)) (size!2482 (_keys!4493 newMap!16)))) #b00000000000000000000000000000000)))))

(declare-fun e!82142 () (_ BitVec 32))

(assert (=> d!37877 (= lt!64882 e!82142)))

(declare-fun c!22952 () Bool)

(assert (=> d!37877 (= c!22952 (bvsge #b00000000000000000000000000000000 (size!2482 (_keys!4493 newMap!16))))))

(assert (=> d!37877 (and (bvsle #b00000000000000000000000000000000 (size!2482 (_keys!4493 newMap!16))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!2482 (_keys!4493 newMap!16)) (size!2482 (array!4686 (store (arr!2219 (_keys!4493 newMap!16)) (ite c!22637 (index!3233 lt!64093) (index!3230 lt!64093)) (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355)) (size!2482 (_keys!4493 newMap!16))))))))

(assert (=> d!37877 (= (arrayCountValidKeys!0 (array!4686 (store (arr!2219 (_keys!4493 newMap!16)) (ite c!22637 (index!3233 lt!64093) (index!3230 lt!64093)) (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355)) (size!2482 (_keys!4493 newMap!16))) #b00000000000000000000000000000000 (size!2482 (_keys!4493 newMap!16))) lt!64882)))

(declare-fun b!125750 () Bool)

(declare-fun e!82143 () (_ BitVec 32))

(assert (=> b!125750 (= e!82142 e!82143)))

(declare-fun c!22953 () Bool)

(assert (=> b!125750 (= c!22953 (validKeyInArray!0 (select (arr!2219 (array!4686 (store (arr!2219 (_keys!4493 newMap!16)) (ite c!22637 (index!3233 lt!64093) (index!3230 lt!64093)) (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355)) (size!2482 (_keys!4493 newMap!16)))) #b00000000000000000000000000000000)))))

(declare-fun b!125751 () Bool)

(declare-fun call!13484 () (_ BitVec 32))

(assert (=> b!125751 (= e!82143 (bvadd #b00000000000000000000000000000001 call!13484))))

(declare-fun b!125752 () Bool)

(assert (=> b!125752 (= e!82143 call!13484)))

(declare-fun b!125753 () Bool)

(assert (=> b!125753 (= e!82142 #b00000000000000000000000000000000)))

(declare-fun bm!13481 () Bool)

(assert (=> bm!13481 (= call!13484 (arrayCountValidKeys!0 (array!4686 (store (arr!2219 (_keys!4493 newMap!16)) (ite c!22637 (index!3233 lt!64093) (index!3230 lt!64093)) (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355)) (size!2482 (_keys!4493 newMap!16))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2482 (_keys!4493 newMap!16))))))

(assert (= (and d!37877 c!22952) b!125753))

(assert (= (and d!37877 (not c!22952)) b!125750))

(assert (= (and b!125750 c!22953) b!125751))

(assert (= (and b!125750 (not c!22953)) b!125752))

(assert (= (or b!125751 b!125752) bm!13481))

(assert (=> b!125750 m!146569))

(assert (=> b!125750 m!146569))

(assert (=> b!125750 m!146571))

(declare-fun m!146625 () Bool)

(assert (=> bm!13481 m!146625))

(assert (=> d!37351 d!37877))

(declare-fun d!37879 () Bool)

(declare-fun e!82146 () Bool)

(assert (=> d!37879 e!82146))

(declare-fun res!60882 () Bool)

(assert (=> d!37879 (=> (not res!60882) (not e!82146))))

(assert (=> d!37879 (= res!60882 (and (bvsge (ite c!22637 (index!3233 lt!64093) (index!3230 lt!64093)) #b00000000000000000000000000000000) (bvslt (ite c!22637 (index!3233 lt!64093) (index!3230 lt!64093)) (size!2482 (_keys!4493 newMap!16))) (bvslt (ite c!22637 (index!3233 lt!64093) (index!3230 lt!64093)) (size!2483 (_values!2747 newMap!16)))))))

(declare-fun lt!64885 () Unit!3867)

(declare-fun choose!759 (array!4685 array!4687 (_ BitVec 32) (_ BitVec 32) V!3427 V!3427 (_ BitVec 32) (_ BitVec 64) V!3427 Int) Unit!3867)

(assert (=> d!37879 (= lt!64885 (choose!759 (_keys!4493 newMap!16) (_values!2747 newMap!16) (mask!7010 newMap!16) (extraKeys!2549 newMap!16) (zeroValue!2629 newMap!16) (minValue!2629 newMap!16) (ite c!22637 (index!3233 lt!64093) (index!3230 lt!64093)) (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2764 newMap!16)))))

(assert (=> d!37879 (validMask!0 (mask!7010 newMap!16))))

(assert (=> d!37879 (= (lemmaAddValidKeyToArrayThenAddPairToListMap!36 (_keys!4493 newMap!16) (_values!2747 newMap!16) (mask!7010 newMap!16) (extraKeys!2549 newMap!16) (zeroValue!2629 newMap!16) (minValue!2629 newMap!16) (ite c!22637 (index!3233 lt!64093) (index!3230 lt!64093)) (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2764 newMap!16)) lt!64885)))

(declare-fun b!125756 () Bool)

(assert (=> b!125756 (= e!82146 (= (+!169 (getCurrentListMap!535 (_keys!4493 newMap!16) (_values!2747 newMap!16) (mask!7010 newMap!16) (extraKeys!2549 newMap!16) (zeroValue!2629 newMap!16) (minValue!2629 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2764 newMap!16)) (tuple2!2569 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (getCurrentListMap!535 (array!4686 (store (arr!2219 (_keys!4493 newMap!16)) (ite c!22637 (index!3233 lt!64093) (index!3230 lt!64093)) (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355)) (size!2482 (_keys!4493 newMap!16))) (array!4688 (store (arr!2220 (_values!2747 newMap!16)) (ite c!22637 (index!3233 lt!64093) (index!3230 lt!64093)) (ValueCellFull!1074 (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2483 (_values!2747 newMap!16))) (mask!7010 newMap!16) (extraKeys!2549 newMap!16) (zeroValue!2629 newMap!16) (minValue!2629 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2764 newMap!16))))))

(assert (= (and d!37879 res!60882) b!125756))

(assert (=> d!37879 m!144415))

(assert (=> d!37879 m!144425))

(declare-fun m!146627 () Bool)

(assert (=> d!37879 m!146627))

(assert (=> d!37879 m!144633))

(assert (=> b!125756 m!144491))

(assert (=> b!125756 m!144851))

(assert (=> b!125756 m!144841))

(assert (=> b!125756 m!144831))

(assert (=> b!125756 m!144491))

(assert (=> b!125756 m!144707))

(assert (=> d!37351 d!37879))

(declare-fun b!125757 () Bool)

(declare-fun e!82149 () Bool)

(declare-fun e!82147 () Bool)

(assert (=> b!125757 (= e!82149 e!82147)))

(declare-fun lt!64888 () (_ BitVec 64))

(assert (=> b!125757 (= lt!64888 (select (arr!2219 (array!4686 (store (arr!2219 (_keys!4493 newMap!16)) (ite c!22637 (index!3233 lt!64093) (index!3230 lt!64093)) (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355)) (size!2482 (_keys!4493 newMap!16)))) #b00000000000000000000000000000000))))

(declare-fun lt!64887 () Unit!3867)

(assert (=> b!125757 (= lt!64887 (lemmaArrayContainsFromImpliesContainsFromZero!0 (array!4686 (store (arr!2219 (_keys!4493 newMap!16)) (ite c!22637 (index!3233 lt!64093) (index!3230 lt!64093)) (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355)) (size!2482 (_keys!4493 newMap!16))) lt!64888 #b00000000000000000000000000000000))))

(assert (=> b!125757 (arrayContainsKey!0 (array!4686 (store (arr!2219 (_keys!4493 newMap!16)) (ite c!22637 (index!3233 lt!64093) (index!3230 lt!64093)) (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355)) (size!2482 (_keys!4493 newMap!16))) lt!64888 #b00000000000000000000000000000000)))

(declare-fun lt!64886 () Unit!3867)

(assert (=> b!125757 (= lt!64886 lt!64887)))

(declare-fun res!60883 () Bool)

(assert (=> b!125757 (= res!60883 (= (seekEntryOrOpen!0 (select (arr!2219 (array!4686 (store (arr!2219 (_keys!4493 newMap!16)) (ite c!22637 (index!3233 lt!64093) (index!3230 lt!64093)) (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355)) (size!2482 (_keys!4493 newMap!16)))) #b00000000000000000000000000000000) (array!4686 (store (arr!2219 (_keys!4493 newMap!16)) (ite c!22637 (index!3233 lt!64093) (index!3230 lt!64093)) (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355)) (size!2482 (_keys!4493 newMap!16))) (mask!7010 newMap!16)) (Found!269 #b00000000000000000000000000000000)))))

(assert (=> b!125757 (=> (not res!60883) (not e!82147))))

(declare-fun b!125758 () Bool)

(declare-fun call!13485 () Bool)

(assert (=> b!125758 (= e!82147 call!13485)))

(declare-fun d!37881 () Bool)

(declare-fun res!60884 () Bool)

(declare-fun e!82148 () Bool)

(assert (=> d!37881 (=> res!60884 e!82148)))

(assert (=> d!37881 (= res!60884 (bvsge #b00000000000000000000000000000000 (size!2482 (array!4686 (store (arr!2219 (_keys!4493 newMap!16)) (ite c!22637 (index!3233 lt!64093) (index!3230 lt!64093)) (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355)) (size!2482 (_keys!4493 newMap!16))))))))

(assert (=> d!37881 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!4686 (store (arr!2219 (_keys!4493 newMap!16)) (ite c!22637 (index!3233 lt!64093) (index!3230 lt!64093)) (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355)) (size!2482 (_keys!4493 newMap!16))) (mask!7010 newMap!16)) e!82148)))

(declare-fun bm!13482 () Bool)

(assert (=> bm!13482 (= call!13485 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (array!4686 (store (arr!2219 (_keys!4493 newMap!16)) (ite c!22637 (index!3233 lt!64093) (index!3230 lt!64093)) (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355)) (size!2482 (_keys!4493 newMap!16))) (mask!7010 newMap!16)))))

(declare-fun b!125759 () Bool)

(assert (=> b!125759 (= e!82149 call!13485)))

(declare-fun b!125760 () Bool)

(assert (=> b!125760 (= e!82148 e!82149)))

(declare-fun c!22954 () Bool)

(assert (=> b!125760 (= c!22954 (validKeyInArray!0 (select (arr!2219 (array!4686 (store (arr!2219 (_keys!4493 newMap!16)) (ite c!22637 (index!3233 lt!64093) (index!3230 lt!64093)) (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355)) (size!2482 (_keys!4493 newMap!16)))) #b00000000000000000000000000000000)))))

(assert (= (and d!37881 (not res!60884)) b!125760))

(assert (= (and b!125760 c!22954) b!125757))

(assert (= (and b!125760 (not c!22954)) b!125759))

(assert (= (and b!125757 res!60883) b!125758))

(assert (= (or b!125758 b!125759) bm!13482))

(assert (=> b!125757 m!146569))

(declare-fun m!146629 () Bool)

(assert (=> b!125757 m!146629))

(declare-fun m!146631 () Bool)

(assert (=> b!125757 m!146631))

(assert (=> b!125757 m!146569))

(declare-fun m!146633 () Bool)

(assert (=> b!125757 m!146633))

(declare-fun m!146635 () Bool)

(assert (=> bm!13482 m!146635))

(assert (=> b!125760 m!146569))

(assert (=> b!125760 m!146569))

(assert (=> b!125760 m!146571))

(assert (=> d!37351 d!37881))

(assert (=> d!37351 d!37295))

(declare-fun call!13486 () ListLongMap!1677)

(declare-fun bm!13483 () Bool)

(assert (=> bm!13483 (= call!13486 (getCurrentListMapNoExtraKeys!135 lt!64304 lt!64279 (mask!7010 newMap!16) (extraKeys!2549 newMap!16) (zeroValue!2629 newMap!16) (minValue!2629 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2764 newMap!16)))))

(declare-fun call!13492 () ListLongMap!1677)

(declare-fun c!22960 () Bool)

(declare-fun c!22958 () Bool)

(declare-fun call!13488 () ListLongMap!1677)

(declare-fun bm!13484 () Bool)

(declare-fun call!13487 () ListLongMap!1677)

(assert (=> bm!13484 (= call!13492 (+!169 (ite c!22960 call!13486 (ite c!22958 call!13488 call!13487)) (ite (or c!22960 c!22958) (tuple2!2569 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2629 newMap!16)) (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2629 newMap!16)))))))

(declare-fun bm!13485 () Bool)

(assert (=> bm!13485 (= call!13488 call!13486)))

(declare-fun b!125762 () Bool)

(declare-fun e!82153 () ListLongMap!1677)

(declare-fun call!13491 () ListLongMap!1677)

(assert (=> b!125762 (= e!82153 call!13491)))

(declare-fun b!125763 () Bool)

(declare-fun e!82158 () ListLongMap!1677)

(assert (=> b!125763 (= e!82158 call!13487)))

(declare-fun b!125764 () Bool)

(declare-fun e!82160 () ListLongMap!1677)

(assert (=> b!125764 (= e!82160 e!82153)))

(assert (=> b!125764 (= c!22958 (and (not (= (bvand (extraKeys!2549 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2549 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!125765 () Bool)

(declare-fun e!82161 () Bool)

(declare-fun call!13490 () Bool)

(assert (=> b!125765 (= e!82161 (not call!13490))))

(declare-fun b!125766 () Bool)

(declare-fun e!82156 () Bool)

(declare-fun e!82159 () Bool)

(assert (=> b!125766 (= e!82156 e!82159)))

(declare-fun res!60893 () Bool)

(assert (=> b!125766 (=> (not res!60893) (not e!82159))))

(declare-fun lt!64904 () ListLongMap!1677)

(assert (=> b!125766 (= res!60893 (contains!873 lt!64904 (select (arr!2219 lt!64304) #b00000000000000000000000000000000)))))

(assert (=> b!125766 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2482 lt!64304)))))

(declare-fun bm!13486 () Bool)

(assert (=> bm!13486 (= call!13487 call!13488)))

(declare-fun b!125767 () Bool)

(declare-fun e!82157 () Bool)

(declare-fun call!13489 () Bool)

(assert (=> b!125767 (= e!82157 (not call!13489))))

(declare-fun b!125768 () Bool)

(declare-fun e!82155 () Unit!3867)

(declare-fun Unit!3922 () Unit!3867)

(assert (=> b!125768 (= e!82155 Unit!3922)))

(declare-fun b!125769 () Bool)

(declare-fun e!82150 () Bool)

(assert (=> b!125769 (= e!82150 (validKeyInArray!0 (select (arr!2219 lt!64304) #b00000000000000000000000000000000)))))

(declare-fun b!125770 () Bool)

(declare-fun e!82151 () Bool)

(assert (=> b!125770 (= e!82157 e!82151)))

(declare-fun res!60886 () Bool)

(assert (=> b!125770 (= res!60886 call!13489)))

(assert (=> b!125770 (=> (not res!60886) (not e!82151))))

(declare-fun b!125771 () Bool)

(declare-fun lt!64900 () Unit!3867)

(assert (=> b!125771 (= e!82155 lt!64900)))

(declare-fun lt!64889 () ListLongMap!1677)

(assert (=> b!125771 (= lt!64889 (getCurrentListMapNoExtraKeys!135 lt!64304 lt!64279 (mask!7010 newMap!16) (extraKeys!2549 newMap!16) (zeroValue!2629 newMap!16) (minValue!2629 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2764 newMap!16)))))

(declare-fun lt!64895 () (_ BitVec 64))

(assert (=> b!125771 (= lt!64895 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!64905 () (_ BitVec 64))

(assert (=> b!125771 (= lt!64905 (select (arr!2219 lt!64304) #b00000000000000000000000000000000))))

(declare-fun lt!64890 () Unit!3867)

(assert (=> b!125771 (= lt!64890 (addStillContains!86 lt!64889 lt!64895 (zeroValue!2629 newMap!16) lt!64905))))

(assert (=> b!125771 (contains!873 (+!169 lt!64889 (tuple2!2569 lt!64895 (zeroValue!2629 newMap!16))) lt!64905)))

(declare-fun lt!64907 () Unit!3867)

(assert (=> b!125771 (= lt!64907 lt!64890)))

(declare-fun lt!64908 () ListLongMap!1677)

(assert (=> b!125771 (= lt!64908 (getCurrentListMapNoExtraKeys!135 lt!64304 lt!64279 (mask!7010 newMap!16) (extraKeys!2549 newMap!16) (zeroValue!2629 newMap!16) (minValue!2629 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2764 newMap!16)))))

(declare-fun lt!64891 () (_ BitVec 64))

(assert (=> b!125771 (= lt!64891 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!64903 () (_ BitVec 64))

(assert (=> b!125771 (= lt!64903 (select (arr!2219 lt!64304) #b00000000000000000000000000000000))))

(declare-fun lt!64901 () Unit!3867)

(assert (=> b!125771 (= lt!64901 (addApplyDifferent!86 lt!64908 lt!64891 (minValue!2629 newMap!16) lt!64903))))

(assert (=> b!125771 (= (apply!110 (+!169 lt!64908 (tuple2!2569 lt!64891 (minValue!2629 newMap!16))) lt!64903) (apply!110 lt!64908 lt!64903))))

(declare-fun lt!64906 () Unit!3867)

(assert (=> b!125771 (= lt!64906 lt!64901)))

(declare-fun lt!64899 () ListLongMap!1677)

(assert (=> b!125771 (= lt!64899 (getCurrentListMapNoExtraKeys!135 lt!64304 lt!64279 (mask!7010 newMap!16) (extraKeys!2549 newMap!16) (zeroValue!2629 newMap!16) (minValue!2629 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2764 newMap!16)))))

(declare-fun lt!64909 () (_ BitVec 64))

(assert (=> b!125771 (= lt!64909 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!64897 () (_ BitVec 64))

(assert (=> b!125771 (= lt!64897 (select (arr!2219 lt!64304) #b00000000000000000000000000000000))))

(declare-fun lt!64910 () Unit!3867)

(assert (=> b!125771 (= lt!64910 (addApplyDifferent!86 lt!64899 lt!64909 (zeroValue!2629 newMap!16) lt!64897))))

(assert (=> b!125771 (= (apply!110 (+!169 lt!64899 (tuple2!2569 lt!64909 (zeroValue!2629 newMap!16))) lt!64897) (apply!110 lt!64899 lt!64897))))

(declare-fun lt!64902 () Unit!3867)

(assert (=> b!125771 (= lt!64902 lt!64910)))

(declare-fun lt!64896 () ListLongMap!1677)

(assert (=> b!125771 (= lt!64896 (getCurrentListMapNoExtraKeys!135 lt!64304 lt!64279 (mask!7010 newMap!16) (extraKeys!2549 newMap!16) (zeroValue!2629 newMap!16) (minValue!2629 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2764 newMap!16)))))

(declare-fun lt!64893 () (_ BitVec 64))

(assert (=> b!125771 (= lt!64893 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!64894 () (_ BitVec 64))

(assert (=> b!125771 (= lt!64894 (select (arr!2219 lt!64304) #b00000000000000000000000000000000))))

(assert (=> b!125771 (= lt!64900 (addApplyDifferent!86 lt!64896 lt!64893 (minValue!2629 newMap!16) lt!64894))))

(assert (=> b!125771 (= (apply!110 (+!169 lt!64896 (tuple2!2569 lt!64893 (minValue!2629 newMap!16))) lt!64894) (apply!110 lt!64896 lt!64894))))

(declare-fun b!125772 () Bool)

(declare-fun res!60891 () Bool)

(declare-fun e!82154 () Bool)

(assert (=> b!125772 (=> (not res!60891) (not e!82154))))

(assert (=> b!125772 (= res!60891 e!82157)))

(declare-fun c!22956 () Bool)

(assert (=> b!125772 (= c!22956 (not (= (bvand (extraKeys!2549 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!125773 () Bool)

(declare-fun c!22959 () Bool)

(assert (=> b!125773 (= c!22959 (and (not (= (bvand (extraKeys!2549 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2549 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!125773 (= e!82153 e!82158)))

(declare-fun b!125774 () Bool)

(assert (=> b!125774 (= e!82151 (= (apply!110 lt!64904 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2629 newMap!16)))))

(declare-fun bm!13487 () Bool)

(assert (=> bm!13487 (= call!13489 (contains!873 lt!64904 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!125775 () Bool)

(assert (=> b!125775 (= e!82160 (+!169 call!13492 (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2629 newMap!16))))))

(declare-fun b!125761 () Bool)

(assert (=> b!125761 (= e!82159 (= (apply!110 lt!64904 (select (arr!2219 lt!64304) #b00000000000000000000000000000000)) (get!1436 (select (arr!2220 lt!64279) #b00000000000000000000000000000000) (dynLambda!411 (defaultEntry!2764 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!125761 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2483 lt!64279)))))

(assert (=> b!125761 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2482 lt!64304)))))

(declare-fun d!37883 () Bool)

(assert (=> d!37883 e!82154))

(declare-fun res!60887 () Bool)

(assert (=> d!37883 (=> (not res!60887) (not e!82154))))

(assert (=> d!37883 (= res!60887 (or (bvsge #b00000000000000000000000000000000 (size!2482 lt!64304)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2482 lt!64304)))))))

(declare-fun lt!64892 () ListLongMap!1677)

(assert (=> d!37883 (= lt!64904 lt!64892)))

(declare-fun lt!64898 () Unit!3867)

(assert (=> d!37883 (= lt!64898 e!82155)))

(declare-fun c!22957 () Bool)

(declare-fun e!82152 () Bool)

(assert (=> d!37883 (= c!22957 e!82152)))

(declare-fun res!60888 () Bool)

(assert (=> d!37883 (=> (not res!60888) (not e!82152))))

(assert (=> d!37883 (= res!60888 (bvslt #b00000000000000000000000000000000 (size!2482 lt!64304)))))

(assert (=> d!37883 (= lt!64892 e!82160)))

(assert (=> d!37883 (= c!22960 (and (not (= (bvand (extraKeys!2549 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2549 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!37883 (validMask!0 (mask!7010 newMap!16))))

(assert (=> d!37883 (= (getCurrentListMap!535 lt!64304 lt!64279 (mask!7010 newMap!16) (extraKeys!2549 newMap!16) (zeroValue!2629 newMap!16) (minValue!2629 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2764 newMap!16)) lt!64904)))

(declare-fun bm!13488 () Bool)

(assert (=> bm!13488 (= call!13491 call!13492)))

(declare-fun b!125776 () Bool)

(assert (=> b!125776 (= e!82154 e!82161)))

(declare-fun c!22955 () Bool)

(assert (=> b!125776 (= c!22955 (not (= (bvand (extraKeys!2549 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!13489 () Bool)

(assert (=> bm!13489 (= call!13490 (contains!873 lt!64904 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!125777 () Bool)

(assert (=> b!125777 (= e!82152 (validKeyInArray!0 (select (arr!2219 lt!64304) #b00000000000000000000000000000000)))))

(declare-fun b!125778 () Bool)

(declare-fun e!82162 () Bool)

(assert (=> b!125778 (= e!82161 e!82162)))

(declare-fun res!60892 () Bool)

(assert (=> b!125778 (= res!60892 call!13490)))

(assert (=> b!125778 (=> (not res!60892) (not e!82162))))

(declare-fun b!125779 () Bool)

(declare-fun res!60889 () Bool)

(assert (=> b!125779 (=> (not res!60889) (not e!82154))))

(assert (=> b!125779 (= res!60889 e!82156)))

(declare-fun res!60885 () Bool)

(assert (=> b!125779 (=> res!60885 e!82156)))

(assert (=> b!125779 (= res!60885 (not e!82150))))

(declare-fun res!60890 () Bool)

(assert (=> b!125779 (=> (not res!60890) (not e!82150))))

(assert (=> b!125779 (= res!60890 (bvslt #b00000000000000000000000000000000 (size!2482 lt!64304)))))

(declare-fun b!125780 () Bool)

(assert (=> b!125780 (= e!82158 call!13491)))

(declare-fun b!125781 () Bool)

(assert (=> b!125781 (= e!82162 (= (apply!110 lt!64904 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2629 newMap!16)))))

(assert (= (and d!37883 c!22960) b!125775))

(assert (= (and d!37883 (not c!22960)) b!125764))

(assert (= (and b!125764 c!22958) b!125762))

(assert (= (and b!125764 (not c!22958)) b!125773))

(assert (= (and b!125773 c!22959) b!125780))

(assert (= (and b!125773 (not c!22959)) b!125763))

(assert (= (or b!125780 b!125763) bm!13486))

(assert (= (or b!125762 bm!13486) bm!13485))

(assert (= (or b!125762 b!125780) bm!13488))

(assert (= (or b!125775 bm!13485) bm!13483))

(assert (= (or b!125775 bm!13488) bm!13484))

(assert (= (and d!37883 res!60888) b!125777))

(assert (= (and d!37883 c!22957) b!125771))

(assert (= (and d!37883 (not c!22957)) b!125768))

(assert (= (and d!37883 res!60887) b!125779))

(assert (= (and b!125779 res!60890) b!125769))

(assert (= (and b!125779 (not res!60885)) b!125766))

(assert (= (and b!125766 res!60893) b!125761))

(assert (= (and b!125779 res!60889) b!125772))

(assert (= (and b!125772 c!22956) b!125770))

(assert (= (and b!125772 (not c!22956)) b!125767))

(assert (= (and b!125770 res!60886) b!125774))

(assert (= (or b!125770 b!125767) bm!13487))

(assert (= (and b!125772 res!60891) b!125776))

(assert (= (and b!125776 c!22955) b!125778))

(assert (= (and b!125776 (not c!22955)) b!125765))

(assert (= (and b!125778 res!60892) b!125781))

(assert (= (or b!125778 b!125765) bm!13489))

(declare-fun b_lambda!5517 () Bool)

(assert (=> (not b_lambda!5517) (not b!125761)))

(assert (=> b!125761 t!6029))

(declare-fun b_and!7739 () Bool)

(assert (= b_and!7735 (and (=> t!6029 result!3819) b_and!7739)))

(assert (=> b!125761 t!6031))

(declare-fun b_and!7741 () Bool)

(assert (= b_and!7737 (and (=> t!6031 result!3821) b_and!7741)))

(declare-fun m!146637 () Bool)

(assert (=> b!125777 m!146637))

(assert (=> b!125777 m!146637))

(declare-fun m!146639 () Bool)

(assert (=> b!125777 m!146639))

(declare-fun m!146641 () Bool)

(assert (=> b!125761 m!146641))

(assert (=> b!125761 m!144721))

(declare-fun m!146643 () Bool)

(assert (=> b!125761 m!146643))

(assert (=> b!125761 m!146637))

(assert (=> b!125761 m!144721))

(assert (=> b!125761 m!146637))

(declare-fun m!146645 () Bool)

(assert (=> b!125761 m!146645))

(assert (=> b!125761 m!146641))

(assert (=> b!125769 m!146637))

(assert (=> b!125769 m!146637))

(assert (=> b!125769 m!146639))

(declare-fun m!146647 () Bool)

(assert (=> b!125771 m!146647))

(declare-fun m!146649 () Bool)

(assert (=> b!125771 m!146649))

(declare-fun m!146651 () Bool)

(assert (=> b!125771 m!146651))

(declare-fun m!146653 () Bool)

(assert (=> b!125771 m!146653))

(assert (=> b!125771 m!146637))

(declare-fun m!146655 () Bool)

(assert (=> b!125771 m!146655))

(declare-fun m!146657 () Bool)

(assert (=> b!125771 m!146657))

(declare-fun m!146659 () Bool)

(assert (=> b!125771 m!146659))

(assert (=> b!125771 m!146659))

(declare-fun m!146661 () Bool)

(assert (=> b!125771 m!146661))

(declare-fun m!146663 () Bool)

(assert (=> b!125771 m!146663))

(declare-fun m!146665 () Bool)

(assert (=> b!125771 m!146665))

(assert (=> b!125771 m!146653))

(declare-fun m!146667 () Bool)

(assert (=> b!125771 m!146667))

(declare-fun m!146669 () Bool)

(assert (=> b!125771 m!146669))

(declare-fun m!146671 () Bool)

(assert (=> b!125771 m!146671))

(declare-fun m!146673 () Bool)

(assert (=> b!125771 m!146673))

(assert (=> b!125771 m!146663))

(declare-fun m!146675 () Bool)

(assert (=> b!125771 m!146675))

(assert (=> b!125771 m!146649))

(declare-fun m!146677 () Bool)

(assert (=> b!125771 m!146677))

(assert (=> b!125766 m!146637))

(assert (=> b!125766 m!146637))

(declare-fun m!146679 () Bool)

(assert (=> b!125766 m!146679))

(declare-fun m!146681 () Bool)

(assert (=> b!125775 m!146681))

(declare-fun m!146683 () Bool)

(assert (=> b!125781 m!146683))

(declare-fun m!146685 () Bool)

(assert (=> bm!13487 m!146685))

(assert (=> bm!13483 m!146675))

(declare-fun m!146687 () Bool)

(assert (=> bm!13489 m!146687))

(declare-fun m!146689 () Bool)

(assert (=> b!125774 m!146689))

(declare-fun m!146691 () Bool)

(assert (=> bm!13484 m!146691))

(assert (=> d!37883 m!144633))

(assert (=> d!37351 d!37883))

(declare-fun d!37885 () Bool)

(declare-fun lt!64911 () (_ BitVec 32))

(assert (=> d!37885 (and (bvsge lt!64911 #b00000000000000000000000000000000) (bvsle lt!64911 (bvsub (size!2482 lt!64280) (ite c!22637 (index!3233 lt!64093) (index!3230 lt!64093)))))))

(declare-fun e!82163 () (_ BitVec 32))

(assert (=> d!37885 (= lt!64911 e!82163)))

(declare-fun c!22961 () Bool)

(assert (=> d!37885 (= c!22961 (bvsge (ite c!22637 (index!3233 lt!64093) (index!3230 lt!64093)) (bvadd (ite c!22637 (index!3233 lt!64093) (index!3230 lt!64093)) #b00000000000000000000000000000001)))))

(assert (=> d!37885 (and (bvsle (ite c!22637 (index!3233 lt!64093) (index!3230 lt!64093)) (bvadd (ite c!22637 (index!3233 lt!64093) (index!3230 lt!64093)) #b00000000000000000000000000000001)) (bvsge (ite c!22637 (index!3233 lt!64093) (index!3230 lt!64093)) #b00000000000000000000000000000000) (bvsle (bvadd (ite c!22637 (index!3233 lt!64093) (index!3230 lt!64093)) #b00000000000000000000000000000001) (size!2482 lt!64280)))))

(assert (=> d!37885 (= (arrayCountValidKeys!0 lt!64280 (ite c!22637 (index!3233 lt!64093) (index!3230 lt!64093)) (bvadd (ite c!22637 (index!3233 lt!64093) (index!3230 lt!64093)) #b00000000000000000000000000000001)) lt!64911)))

(declare-fun b!125782 () Bool)

(declare-fun e!82164 () (_ BitVec 32))

(assert (=> b!125782 (= e!82163 e!82164)))

(declare-fun c!22962 () Bool)

(assert (=> b!125782 (= c!22962 (validKeyInArray!0 (select (arr!2219 lt!64280) (ite c!22637 (index!3233 lt!64093) (index!3230 lt!64093)))))))

(declare-fun b!125783 () Bool)

(declare-fun call!13493 () (_ BitVec 32))

(assert (=> b!125783 (= e!82164 (bvadd #b00000000000000000000000000000001 call!13493))))

(declare-fun b!125784 () Bool)

(assert (=> b!125784 (= e!82164 call!13493)))

(declare-fun b!125785 () Bool)

(assert (=> b!125785 (= e!82163 #b00000000000000000000000000000000)))

(declare-fun bm!13490 () Bool)

(assert (=> bm!13490 (= call!13493 (arrayCountValidKeys!0 lt!64280 (bvadd (ite c!22637 (index!3233 lt!64093) (index!3230 lt!64093)) #b00000000000000000000000000000001) (bvadd (ite c!22637 (index!3233 lt!64093) (index!3230 lt!64093)) #b00000000000000000000000000000001)))))

(assert (= (and d!37885 c!22961) b!125785))

(assert (= (and d!37885 (not c!22961)) b!125782))

(assert (= (and b!125782 c!22962) b!125783))

(assert (= (and b!125782 (not c!22962)) b!125784))

(assert (= (or b!125783 b!125784) bm!13490))

(declare-fun m!146693 () Bool)

(assert (=> b!125782 m!146693))

(assert (=> b!125782 m!146693))

(declare-fun m!146695 () Bool)

(assert (=> b!125782 m!146695))

(declare-fun m!146697 () Bool)

(assert (=> bm!13490 m!146697))

(assert (=> d!37351 d!37885))

(declare-fun d!37887 () Bool)

(assert (=> d!37887 (= (arrayCountValidKeys!0 lt!64280 (ite c!22637 (index!3233 lt!64093) (index!3230 lt!64093)) (bvadd (ite c!22637 (index!3233 lt!64093) (index!3230 lt!64093)) #b00000000000000000000000000000001)) #b00000000000000000000000000000001)))

(declare-fun lt!64914 () Unit!3867)

(declare-fun choose!2 (array!4685 (_ BitVec 32)) Unit!3867)

(assert (=> d!37887 (= lt!64914 (choose!2 lt!64280 (ite c!22637 (index!3233 lt!64093) (index!3230 lt!64093))))))

(declare-fun e!82167 () Bool)

(assert (=> d!37887 e!82167))

(declare-fun res!60898 () Bool)

(assert (=> d!37887 (=> (not res!60898) (not e!82167))))

(assert (=> d!37887 (= res!60898 (and (bvsge (ite c!22637 (index!3233 lt!64093) (index!3230 lt!64093)) #b00000000000000000000000000000000) (bvslt (ite c!22637 (index!3233 lt!64093) (index!3230 lt!64093)) (size!2482 lt!64280))))))

(assert (=> d!37887 (= (lemmaValidKeyAtIImpliesCountKeysIsOne!0 lt!64280 (ite c!22637 (index!3233 lt!64093) (index!3230 lt!64093))) lt!64914)))

(declare-fun b!125790 () Bool)

(declare-fun res!60899 () Bool)

(assert (=> b!125790 (=> (not res!60899) (not e!82167))))

(assert (=> b!125790 (= res!60899 (validKeyInArray!0 (select (arr!2219 lt!64280) (ite c!22637 (index!3233 lt!64093) (index!3230 lt!64093)))))))

(declare-fun b!125791 () Bool)

(assert (=> b!125791 (= e!82167 (bvslt (size!2482 lt!64280) #b01111111111111111111111111111111))))

(assert (= (and d!37887 res!60898) b!125790))

(assert (= (and b!125790 res!60899) b!125791))

(assert (=> d!37887 m!144833))

(declare-fun m!146699 () Bool)

(assert (=> d!37887 m!146699))

(assert (=> b!125790 m!146693))

(assert (=> b!125790 m!146693))

(assert (=> b!125790 m!146695))

(assert (=> d!37351 d!37887))

(declare-fun d!37889 () Bool)

(declare-fun e!82172 () Bool)

(assert (=> d!37889 e!82172))

(declare-fun res!60908 () Bool)

(assert (=> d!37889 (=> (not res!60908) (not e!82172))))

(assert (=> d!37889 (= res!60908 (and (bvsge (ite c!22637 (index!3233 lt!64093) (index!3230 lt!64093)) #b00000000000000000000000000000000) (bvslt (ite c!22637 (index!3233 lt!64093) (index!3230 lt!64093)) (size!2482 (_keys!4493 newMap!16)))))))

(declare-fun lt!64917 () Unit!3867)

(declare-fun choose!1 (array!4685 (_ BitVec 32) (_ BitVec 64)) Unit!3867)

(assert (=> d!37889 (= lt!64917 (choose!1 (_keys!4493 newMap!16) (ite c!22637 (index!3233 lt!64093) (index!3230 lt!64093)) (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355)))))

(declare-fun e!82173 () Bool)

(assert (=> d!37889 e!82173))

(declare-fun res!60911 () Bool)

(assert (=> d!37889 (=> (not res!60911) (not e!82173))))

(assert (=> d!37889 (= res!60911 (and (bvsge (ite c!22637 (index!3233 lt!64093) (index!3230 lt!64093)) #b00000000000000000000000000000000) (bvslt (ite c!22637 (index!3233 lt!64093) (index!3230 lt!64093)) (size!2482 (_keys!4493 newMap!16)))))))

(assert (=> d!37889 (= (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!4493 newMap!16) (ite c!22637 (index!3233 lt!64093) (index!3230 lt!64093)) (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355)) lt!64917)))

(declare-fun b!125800 () Bool)

(declare-fun res!60910 () Bool)

(assert (=> b!125800 (=> (not res!60910) (not e!82173))))

(assert (=> b!125800 (= res!60910 (not (validKeyInArray!0 (select (arr!2219 (_keys!4493 newMap!16)) (ite c!22637 (index!3233 lt!64093) (index!3230 lt!64093))))))))

(declare-fun b!125802 () Bool)

(assert (=> b!125802 (= e!82173 (bvslt (size!2482 (_keys!4493 newMap!16)) #b01111111111111111111111111111111))))

(declare-fun b!125803 () Bool)

(assert (=> b!125803 (= e!82172 (= (arrayCountValidKeys!0 (array!4686 (store (arr!2219 (_keys!4493 newMap!16)) (ite c!22637 (index!3233 lt!64093) (index!3230 lt!64093)) (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355)) (size!2482 (_keys!4493 newMap!16))) #b00000000000000000000000000000000 (size!2482 (_keys!4493 newMap!16))) (bvadd (arrayCountValidKeys!0 (_keys!4493 newMap!16) #b00000000000000000000000000000000 (size!2482 (_keys!4493 newMap!16))) #b00000000000000000000000000000001)))))

(declare-fun b!125801 () Bool)

(declare-fun res!60909 () Bool)

(assert (=> b!125801 (=> (not res!60909) (not e!82173))))

(assert (=> b!125801 (= res!60909 (validKeyInArray!0 (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355)))))

(assert (= (and d!37889 res!60911) b!125800))

(assert (= (and b!125800 res!60910) b!125801))

(assert (= (and b!125801 res!60909) b!125802))

(assert (= (and d!37889 res!60908) b!125803))

(assert (=> d!37889 m!144415))

(declare-fun m!146701 () Bool)

(assert (=> d!37889 m!146701))

(declare-fun m!146703 () Bool)

(assert (=> b!125800 m!146703))

(assert (=> b!125800 m!146703))

(declare-fun m!146705 () Bool)

(assert (=> b!125800 m!146705))

(assert (=> b!125803 m!144841))

(assert (=> b!125803 m!144827))

(assert (=> b!125803 m!144485))

(assert (=> b!125801 m!144415))

(declare-fun m!146707 () Bool)

(assert (=> b!125801 m!146707))

(assert (=> d!37351 d!37889))

(declare-fun d!37891 () Bool)

(declare-fun e!82174 () Bool)

(assert (=> d!37891 e!82174))

(declare-fun res!60912 () Bool)

(assert (=> d!37891 (=> (not res!60912) (not e!82174))))

(assert (=> d!37891 (= res!60912 (and (bvsge (ite c!22637 (index!3233 lt!64093) (index!3230 lt!64093)) #b00000000000000000000000000000000) (bvslt (ite c!22637 (index!3233 lt!64093) (index!3230 lt!64093)) (size!2482 lt!64304))))))

(declare-fun lt!64918 () Unit!3867)

(assert (=> d!37891 (= lt!64918 (choose!749 lt!64304 lt!64279 (mask!7010 newMap!16) (extraKeys!2549 newMap!16) (zeroValue!2629 newMap!16) (minValue!2629 newMap!16) (ite c!22637 (index!3233 lt!64093) (index!3230 lt!64093)) (defaultEntry!2764 newMap!16)))))

(assert (=> d!37891 (validMask!0 (mask!7010 newMap!16))))

(assert (=> d!37891 (= (lemmaValidKeyInArrayIsInListMap!116 lt!64304 lt!64279 (mask!7010 newMap!16) (extraKeys!2549 newMap!16) (zeroValue!2629 newMap!16) (minValue!2629 newMap!16) (ite c!22637 (index!3233 lt!64093) (index!3230 lt!64093)) (defaultEntry!2764 newMap!16)) lt!64918)))

(declare-fun b!125804 () Bool)

(assert (=> b!125804 (= e!82174 (contains!873 (getCurrentListMap!535 lt!64304 lt!64279 (mask!7010 newMap!16) (extraKeys!2549 newMap!16) (zeroValue!2629 newMap!16) (minValue!2629 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2764 newMap!16)) (select (arr!2219 lt!64304) (ite c!22637 (index!3233 lt!64093) (index!3230 lt!64093)))))))

(assert (= (and d!37891 res!60912) b!125804))

(declare-fun m!146709 () Bool)

(assert (=> d!37891 m!146709))

(assert (=> d!37891 m!144633))

(assert (=> b!125804 m!144835))

(declare-fun m!146711 () Bool)

(assert (=> b!125804 m!146711))

(assert (=> b!125804 m!144835))

(assert (=> b!125804 m!146711))

(declare-fun m!146713 () Bool)

(assert (=> b!125804 m!146713))

(assert (=> d!37351 d!37891))

(declare-fun c!22963 () Bool)

(declare-fun d!37893 () Bool)

(assert (=> d!37893 (= c!22963 (and ((_ is Cons!1691) (t!6022 (toList!854 lt!63941))) (= (_1!1295 (h!2292 (t!6022 (toList!854 lt!63941)))) (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355))))))

(declare-fun e!82175 () Option!172)

(assert (=> d!37893 (= (getValueByKey!166 (t!6022 (toList!854 lt!63941)) (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355)) e!82175)))

(declare-fun b!125805 () Bool)

(assert (=> b!125805 (= e!82175 (Some!171 (_2!1295 (h!2292 (t!6022 (toList!854 lt!63941))))))))

(declare-fun b!125807 () Bool)

(declare-fun e!82176 () Option!172)

(assert (=> b!125807 (= e!82176 (getValueByKey!166 (t!6022 (t!6022 (toList!854 lt!63941))) (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355)))))

(declare-fun b!125808 () Bool)

(assert (=> b!125808 (= e!82176 None!170)))

(declare-fun b!125806 () Bool)

(assert (=> b!125806 (= e!82175 e!82176)))

(declare-fun c!22964 () Bool)

(assert (=> b!125806 (= c!22964 (and ((_ is Cons!1691) (t!6022 (toList!854 lt!63941))) (not (= (_1!1295 (h!2292 (t!6022 (toList!854 lt!63941)))) (select (arr!2219 (_keys!4493 (v!3108 (underlying!436 thiss!992)))) from!355)))))))

(assert (= (and d!37893 c!22963) b!125805))

(assert (= (and d!37893 (not c!22963)) b!125806))

(assert (= (and b!125806 c!22964) b!125807))

(assert (= (and b!125806 (not c!22964)) b!125808))

(assert (=> b!125807 m!144415))

(declare-fun m!146715 () Bool)

(assert (=> b!125807 m!146715))

(assert (=> b!124732 d!37893))

(assert (=> b!124783 d!37455))

(declare-fun d!37895 () Bool)

(assert (=> d!37895 (= (get!1439 (getValueByKey!166 (toList!854 lt!64012) #b1000000000000000000000000000000000000000000000000000000000000000)) (v!3112 (getValueByKey!166 (toList!854 lt!64012) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!37361 d!37895))

(assert (=> d!37361 d!37557))

(declare-fun d!37897 () Bool)

(assert (=> d!37897 (= (apply!110 lt!64339 (select (arr!2219 (_keys!4493 newMap!16)) #b00000000000000000000000000000000)) (get!1439 (getValueByKey!166 (toList!854 lt!64339) (select (arr!2219 (_keys!4493 newMap!16)) #b00000000000000000000000000000000))))))

(declare-fun bs!5212 () Bool)

(assert (= bs!5212 d!37897))

(assert (=> bs!5212 m!144619))

(assert (=> bs!5212 m!146133))

(assert (=> bs!5212 m!146133))

(declare-fun m!146717 () Bool)

(assert (=> bs!5212 m!146717))

(assert (=> b!124919 d!37897))

(declare-fun c!22965 () Bool)

(declare-fun d!37899 () Bool)

(assert (=> d!37899 (= c!22965 ((_ is ValueCellFull!1074) (select (arr!2220 (ite (or c!22645 c!22647) (_values!2747 newMap!16) (array!4688 (store (arr!2220 (_values!2747 newMap!16)) (index!3231 lt!64093) (ValueCellFull!1074 (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2483 (_values!2747 newMap!16))))) #b00000000000000000000000000000000)))))

(declare-fun e!82177 () V!3427)

(assert (=> d!37899 (= (get!1436 (select (arr!2220 (ite (or c!22645 c!22647) (_values!2747 newMap!16) (array!4688 (store (arr!2220 (_values!2747 newMap!16)) (index!3231 lt!64093) (ValueCellFull!1074 (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2483 (_values!2747 newMap!16))))) #b00000000000000000000000000000000) (dynLambda!411 (defaultEntry!2764 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000)) e!82177)))

(declare-fun b!125809 () Bool)

(assert (=> b!125809 (= e!82177 (get!1437 (select (arr!2220 (ite (or c!22645 c!22647) (_values!2747 newMap!16) (array!4688 (store (arr!2220 (_values!2747 newMap!16)) (index!3231 lt!64093) (ValueCellFull!1074 (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2483 (_values!2747 newMap!16))))) #b00000000000000000000000000000000) (dynLambda!411 (defaultEntry!2764 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!125810 () Bool)

(assert (=> b!125810 (= e!82177 (get!1438 (select (arr!2220 (ite (or c!22645 c!22647) (_values!2747 newMap!16) (array!4688 (store (arr!2220 (_values!2747 newMap!16)) (index!3231 lt!64093) (ValueCellFull!1074 (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2483 (_values!2747 newMap!16))))) #b00000000000000000000000000000000) (dynLambda!411 (defaultEntry!2764 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!37899 c!22965) b!125809))

(assert (= (and d!37899 (not c!22965)) b!125810))

(assert (=> b!125809 m!144917))

(assert (=> b!125809 m!144721))

(declare-fun m!146719 () Bool)

(assert (=> b!125809 m!146719))

(assert (=> b!125810 m!144917))

(assert (=> b!125810 m!144721))

(declare-fun m!146721 () Bool)

(assert (=> b!125810 m!146721))

(assert (=> b!124919 d!37899))

(declare-fun d!37901 () Bool)

(declare-fun lt!64919 () Bool)

(assert (=> d!37901 (= lt!64919 (select (content!123 (toList!854 lt!64158)) (ite (or c!22605 c!22603) (tuple2!2569 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2629 (v!3108 (underlying!436 thiss!992)))) (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2629 (v!3108 (underlying!436 thiss!992)))))))))

(declare-fun e!82179 () Bool)

(assert (=> d!37901 (= lt!64919 e!82179)))

(declare-fun res!60913 () Bool)

(assert (=> d!37901 (=> (not res!60913) (not e!82179))))

(assert (=> d!37901 (= res!60913 ((_ is Cons!1691) (toList!854 lt!64158)))))

(assert (=> d!37901 (= (contains!874 (toList!854 lt!64158) (ite (or c!22605 c!22603) (tuple2!2569 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2629 (v!3108 (underlying!436 thiss!992)))) (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2629 (v!3108 (underlying!436 thiss!992)))))) lt!64919)))

(declare-fun b!125811 () Bool)

(declare-fun e!82178 () Bool)

(assert (=> b!125811 (= e!82179 e!82178)))

(declare-fun res!60914 () Bool)

(assert (=> b!125811 (=> res!60914 e!82178)))

(assert (=> b!125811 (= res!60914 (= (h!2292 (toList!854 lt!64158)) (ite (or c!22605 c!22603) (tuple2!2569 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2629 (v!3108 (underlying!436 thiss!992)))) (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2629 (v!3108 (underlying!436 thiss!992)))))))))

(declare-fun b!125812 () Bool)

(assert (=> b!125812 (= e!82178 (contains!874 (t!6022 (toList!854 lt!64158)) (ite (or c!22605 c!22603) (tuple2!2569 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2629 (v!3108 (underlying!436 thiss!992)))) (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2629 (v!3108 (underlying!436 thiss!992)))))))))

(assert (= (and d!37901 res!60913) b!125811))

(assert (= (and b!125811 (not res!60914)) b!125812))

(declare-fun m!146723 () Bool)

(assert (=> d!37901 m!146723))

(declare-fun m!146725 () Bool)

(assert (=> d!37901 m!146725))

(declare-fun m!146727 () Bool)

(assert (=> b!125812 m!146727))

(assert (=> b!124765 d!37901))

(declare-fun d!37903 () Bool)

(declare-fun e!82180 () Bool)

(assert (=> d!37903 e!82180))

(declare-fun res!60915 () Bool)

(assert (=> d!37903 (=> (not res!60915) (not e!82180))))

(declare-fun lt!64920 () ListLongMap!1677)

(assert (=> d!37903 (= res!60915 (contains!873 lt!64920 (_1!1295 (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2629 newMap!16)))))))

(declare-fun lt!64921 () List!1695)

(assert (=> d!37903 (= lt!64920 (ListLongMap!1678 lt!64921))))

(declare-fun lt!64923 () Unit!3867)

(declare-fun lt!64922 () Unit!3867)

(assert (=> d!37903 (= lt!64923 lt!64922)))

(assert (=> d!37903 (= (getValueByKey!166 lt!64921 (_1!1295 (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2629 newMap!16)))) (Some!171 (_2!1295 (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2629 newMap!16)))))))

(assert (=> d!37903 (= lt!64922 (lemmaContainsTupThenGetReturnValue!81 lt!64921 (_1!1295 (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2629 newMap!16))) (_2!1295 (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2629 newMap!16)))))))

(assert (=> d!37903 (= lt!64921 (insertStrictlySorted!84 (toList!854 call!13391) (_1!1295 (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2629 newMap!16))) (_2!1295 (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2629 newMap!16)))))))

(assert (=> d!37903 (= (+!169 call!13391 (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2629 newMap!16))) lt!64920)))

(declare-fun b!125813 () Bool)

(declare-fun res!60916 () Bool)

(assert (=> b!125813 (=> (not res!60916) (not e!82180))))

(assert (=> b!125813 (= res!60916 (= (getValueByKey!166 (toList!854 lt!64920) (_1!1295 (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2629 newMap!16)))) (Some!171 (_2!1295 (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2629 newMap!16))))))))

(declare-fun b!125814 () Bool)

(assert (=> b!125814 (= e!82180 (contains!874 (toList!854 lt!64920) (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2629 newMap!16))))))

(assert (= (and d!37903 res!60915) b!125813))

(assert (= (and b!125813 res!60916) b!125814))

(declare-fun m!146729 () Bool)

(assert (=> d!37903 m!146729))

(declare-fun m!146731 () Bool)

(assert (=> d!37903 m!146731))

(declare-fun m!146733 () Bool)

(assert (=> d!37903 m!146733))

(declare-fun m!146735 () Bool)

(assert (=> d!37903 m!146735))

(declare-fun m!146737 () Bool)

(assert (=> b!125813 m!146737))

(declare-fun m!146739 () Bool)

(assert (=> b!125814 m!146739))

(assert (=> b!124987 d!37903))

(declare-fun c!22966 () Bool)

(declare-fun d!37905 () Bool)

(assert (=> d!37905 (= c!22966 (and ((_ is Cons!1691) (toList!854 lt!64355)) (= (_1!1295 (h!2292 (toList!854 lt!64355))) (_1!1295 (tuple2!2569 lt!63999 (minValue!2629 (v!3108 (underlying!436 thiss!992))))))))))

(declare-fun e!82181 () Option!172)

(assert (=> d!37905 (= (getValueByKey!166 (toList!854 lt!64355) (_1!1295 (tuple2!2569 lt!63999 (minValue!2629 (v!3108 (underlying!436 thiss!992)))))) e!82181)))

(declare-fun b!125815 () Bool)

(assert (=> b!125815 (= e!82181 (Some!171 (_2!1295 (h!2292 (toList!854 lt!64355)))))))

(declare-fun b!125817 () Bool)

(declare-fun e!82182 () Option!172)

(assert (=> b!125817 (= e!82182 (getValueByKey!166 (t!6022 (toList!854 lt!64355)) (_1!1295 (tuple2!2569 lt!63999 (minValue!2629 (v!3108 (underlying!436 thiss!992)))))))))

(declare-fun b!125818 () Bool)

(assert (=> b!125818 (= e!82182 None!170)))

(declare-fun b!125816 () Bool)

(assert (=> b!125816 (= e!82181 e!82182)))

(declare-fun c!22967 () Bool)

(assert (=> b!125816 (= c!22967 (and ((_ is Cons!1691) (toList!854 lt!64355)) (not (= (_1!1295 (h!2292 (toList!854 lt!64355))) (_1!1295 (tuple2!2569 lt!63999 (minValue!2629 (v!3108 (underlying!436 thiss!992)))))))))))

(assert (= (and d!37905 c!22966) b!125815))

(assert (= (and d!37905 (not c!22966)) b!125816))

(assert (= (and b!125816 c!22967) b!125817))

(assert (= (and b!125816 (not c!22967)) b!125818))

(declare-fun m!146741 () Bool)

(assert (=> b!125817 m!146741))

(assert (=> b!124949 d!37905))

(assert (=> b!124808 d!37455))

(assert (=> b!124774 d!37667))

(assert (=> b!124774 d!37669))

(declare-fun d!37907 () Bool)

(declare-fun e!82183 () Bool)

(assert (=> d!37907 e!82183))

(declare-fun res!60917 () Bool)

(assert (=> d!37907 (=> res!60917 e!82183)))

(declare-fun lt!64926 () Bool)

(assert (=> d!37907 (= res!60917 (not lt!64926))))

(declare-fun lt!64927 () Bool)

(assert (=> d!37907 (= lt!64926 lt!64927)))

(declare-fun lt!64924 () Unit!3867)

(declare-fun e!82184 () Unit!3867)

(assert (=> d!37907 (= lt!64924 e!82184)))

(declare-fun c!22968 () Bool)

(assert (=> d!37907 (= c!22968 lt!64927)))

(assert (=> d!37907 (= lt!64927 (containsKey!170 (toList!854 lt!64007) lt!64005))))

(assert (=> d!37907 (= (contains!873 lt!64007 lt!64005) lt!64926)))

(declare-fun b!125819 () Bool)

(declare-fun lt!64925 () Unit!3867)

(assert (=> b!125819 (= e!82184 lt!64925)))

(assert (=> b!125819 (= lt!64925 (lemmaContainsKeyImpliesGetValueByKeyDefined!118 (toList!854 lt!64007) lt!64005))))

(assert (=> b!125819 (isDefined!119 (getValueByKey!166 (toList!854 lt!64007) lt!64005))))

(declare-fun b!125820 () Bool)

(declare-fun Unit!3923 () Unit!3867)

(assert (=> b!125820 (= e!82184 Unit!3923)))

(declare-fun b!125821 () Bool)

(assert (=> b!125821 (= e!82183 (isDefined!119 (getValueByKey!166 (toList!854 lt!64007) lt!64005)))))

(assert (= (and d!37907 c!22968) b!125819))

(assert (= (and d!37907 (not c!22968)) b!125820))

(assert (= (and d!37907 (not res!60917)) b!125821))

(declare-fun m!146743 () Bool)

(assert (=> d!37907 m!146743))

(declare-fun m!146745 () Bool)

(assert (=> b!125819 m!146745))

(assert (=> b!125819 m!145061))

(assert (=> b!125819 m!145061))

(declare-fun m!146747 () Bool)

(assert (=> b!125819 m!146747))

(assert (=> b!125821 m!145061))

(assert (=> b!125821 m!145061))

(assert (=> b!125821 m!146747))

(assert (=> d!37407 d!37907))

(assert (=> d!37407 d!37405))

(assert (=> d!37407 d!37409))

(assert (=> d!37407 d!37399))

(declare-fun d!37909 () Bool)

(assert (=> d!37909 (= (apply!110 (+!169 lt!64007 (tuple2!2569 lt!64017 (zeroValue!2629 (v!3108 (underlying!436 thiss!992))))) lt!64005) (apply!110 lt!64007 lt!64005))))

(assert (=> d!37909 true))

(declare-fun _$34!944 () Unit!3867)

(assert (=> d!37909 (= (choose!754 lt!64007 lt!64017 (zeroValue!2629 (v!3108 (underlying!436 thiss!992))) lt!64005) _$34!944)))

(declare-fun bs!5213 () Bool)

(assert (= bs!5213 d!37909))

(assert (=> bs!5213 m!144519))

(assert (=> bs!5213 m!144519))

(assert (=> bs!5213 m!144521))

(assert (=> bs!5213 m!144513))

(assert (=> d!37407 d!37909))

(declare-fun d!37911 () Bool)

(assert (=> d!37911 (= (get!1439 (getValueByKey!166 (toList!854 (+!169 lt!64004 (tuple2!2569 lt!64001 (minValue!2629 (v!3108 (underlying!436 thiss!992)))))) lt!64002)) (v!3112 (getValueByKey!166 (toList!854 (+!169 lt!64004 (tuple2!2569 lt!64001 (minValue!2629 (v!3108 (underlying!436 thiss!992)))))) lt!64002)))))

(assert (=> d!37391 d!37911))

(declare-fun d!37913 () Bool)

(declare-fun c!22969 () Bool)

(assert (=> d!37913 (= c!22969 (and ((_ is Cons!1691) (toList!854 (+!169 lt!64004 (tuple2!2569 lt!64001 (minValue!2629 (v!3108 (underlying!436 thiss!992))))))) (= (_1!1295 (h!2292 (toList!854 (+!169 lt!64004 (tuple2!2569 lt!64001 (minValue!2629 (v!3108 (underlying!436 thiss!992)))))))) lt!64002)))))

(declare-fun e!82185 () Option!172)

(assert (=> d!37913 (= (getValueByKey!166 (toList!854 (+!169 lt!64004 (tuple2!2569 lt!64001 (minValue!2629 (v!3108 (underlying!436 thiss!992)))))) lt!64002) e!82185)))

(declare-fun b!125822 () Bool)

(assert (=> b!125822 (= e!82185 (Some!171 (_2!1295 (h!2292 (toList!854 (+!169 lt!64004 (tuple2!2569 lt!64001 (minValue!2629 (v!3108 (underlying!436 thiss!992))))))))))))

(declare-fun e!82186 () Option!172)

(declare-fun b!125824 () Bool)

(assert (=> b!125824 (= e!82186 (getValueByKey!166 (t!6022 (toList!854 (+!169 lt!64004 (tuple2!2569 lt!64001 (minValue!2629 (v!3108 (underlying!436 thiss!992))))))) lt!64002))))

(declare-fun b!125825 () Bool)

(assert (=> b!125825 (= e!82186 None!170)))

(declare-fun b!125823 () Bool)

(assert (=> b!125823 (= e!82185 e!82186)))

(declare-fun c!22970 () Bool)

(assert (=> b!125823 (= c!22970 (and ((_ is Cons!1691) (toList!854 (+!169 lt!64004 (tuple2!2569 lt!64001 (minValue!2629 (v!3108 (underlying!436 thiss!992))))))) (not (= (_1!1295 (h!2292 (toList!854 (+!169 lt!64004 (tuple2!2569 lt!64001 (minValue!2629 (v!3108 (underlying!436 thiss!992)))))))) lt!64002))))))

(assert (= (and d!37913 c!22969) b!125822))

(assert (= (and d!37913 (not c!22969)) b!125823))

(assert (= (and b!125823 c!22970) b!125824))

(assert (= (and b!125823 (not c!22970)) b!125825))

(declare-fun m!146749 () Bool)

(assert (=> b!125824 m!146749))

(assert (=> d!37391 d!37913))

(assert (=> bm!13373 d!37421))

(declare-fun d!37915 () Bool)

(declare-fun lt!64928 () Bool)

(assert (=> d!37915 (= lt!64928 (select (content!123 (toList!854 lt!64367)) (tuple2!2569 lt!64003 (zeroValue!2629 (v!3108 (underlying!436 thiss!992))))))))

(declare-fun e!82188 () Bool)

(assert (=> d!37915 (= lt!64928 e!82188)))

(declare-fun res!60918 () Bool)

(assert (=> d!37915 (=> (not res!60918) (not e!82188))))

(assert (=> d!37915 (= res!60918 ((_ is Cons!1691) (toList!854 lt!64367)))))

(assert (=> d!37915 (= (contains!874 (toList!854 lt!64367) (tuple2!2569 lt!64003 (zeroValue!2629 (v!3108 (underlying!436 thiss!992))))) lt!64928)))

(declare-fun b!125826 () Bool)

(declare-fun e!82187 () Bool)

(assert (=> b!125826 (= e!82188 e!82187)))

(declare-fun res!60919 () Bool)

(assert (=> b!125826 (=> res!60919 e!82187)))

(assert (=> b!125826 (= res!60919 (= (h!2292 (toList!854 lt!64367)) (tuple2!2569 lt!64003 (zeroValue!2629 (v!3108 (underlying!436 thiss!992))))))))

(declare-fun b!125827 () Bool)

(assert (=> b!125827 (= e!82187 (contains!874 (t!6022 (toList!854 lt!64367)) (tuple2!2569 lt!64003 (zeroValue!2629 (v!3108 (underlying!436 thiss!992))))))))

(assert (= (and d!37915 res!60918) b!125826))

(assert (= (and b!125826 (not res!60919)) b!125827))

(declare-fun m!146751 () Bool)

(assert (=> d!37915 m!146751))

(declare-fun m!146753 () Bool)

(assert (=> d!37915 m!146753))

(declare-fun m!146755 () Bool)

(assert (=> b!125827 m!146755))

(assert (=> b!124959 d!37915))

(declare-fun d!37917 () Bool)

(declare-fun e!82189 () Bool)

(assert (=> d!37917 e!82189))

(declare-fun res!60920 () Bool)

(assert (=> d!37917 (=> (not res!60920) (not e!82189))))

(declare-fun lt!64929 () ListLongMap!1677)

(assert (=> d!37917 (= res!60920 (contains!873 lt!64929 (_1!1295 (ite (or c!22736 c!22734) (tuple2!2569 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (and c!22645 c!22640) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2629 newMap!16))) (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2629 newMap!16))))))))

(declare-fun lt!64930 () List!1695)

(assert (=> d!37917 (= lt!64929 (ListLongMap!1678 lt!64930))))

(declare-fun lt!64932 () Unit!3867)

(declare-fun lt!64931 () Unit!3867)

(assert (=> d!37917 (= lt!64932 lt!64931)))

(assert (=> d!37917 (= (getValueByKey!166 lt!64930 (_1!1295 (ite (or c!22736 c!22734) (tuple2!2569 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (and c!22645 c!22640) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2629 newMap!16))) (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2629 newMap!16))))) (Some!171 (_2!1295 (ite (or c!22736 c!22734) (tuple2!2569 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (and c!22645 c!22640) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2629 newMap!16))) (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2629 newMap!16))))))))

(assert (=> d!37917 (= lt!64931 (lemmaContainsTupThenGetReturnValue!81 lt!64930 (_1!1295 (ite (or c!22736 c!22734) (tuple2!2569 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (and c!22645 c!22640) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2629 newMap!16))) (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2629 newMap!16)))) (_2!1295 (ite (or c!22736 c!22734) (tuple2!2569 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (and c!22645 c!22640) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2629 newMap!16))) (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2629 newMap!16))))))))

(assert (=> d!37917 (= lt!64930 (insertStrictlySorted!84 (toList!854 (ite c!22736 call!13385 (ite c!22734 call!13387 call!13386))) (_1!1295 (ite (or c!22736 c!22734) (tuple2!2569 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (and c!22645 c!22640) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2629 newMap!16))) (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2629 newMap!16)))) (_2!1295 (ite (or c!22736 c!22734) (tuple2!2569 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (and c!22645 c!22640) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2629 newMap!16))) (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2629 newMap!16))))))))

(assert (=> d!37917 (= (+!169 (ite c!22736 call!13385 (ite c!22734 call!13387 call!13386)) (ite (or c!22736 c!22734) (tuple2!2569 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (and c!22645 c!22640) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2629 newMap!16))) (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2629 newMap!16)))) lt!64929)))

(declare-fun b!125828 () Bool)

(declare-fun res!60921 () Bool)

(assert (=> b!125828 (=> (not res!60921) (not e!82189))))

(assert (=> b!125828 (= res!60921 (= (getValueByKey!166 (toList!854 lt!64929) (_1!1295 (ite (or c!22736 c!22734) (tuple2!2569 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (and c!22645 c!22640) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2629 newMap!16))) (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2629 newMap!16))))) (Some!171 (_2!1295 (ite (or c!22736 c!22734) (tuple2!2569 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (and c!22645 c!22640) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2629 newMap!16))) (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2629 newMap!16)))))))))

(declare-fun b!125829 () Bool)

(assert (=> b!125829 (= e!82189 (contains!874 (toList!854 lt!64929) (ite (or c!22736 c!22734) (tuple2!2569 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (and c!22645 c!22640) (get!1436 (select (arr!2220 (_values!2747 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!411 (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2629 newMap!16))) (tuple2!2569 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2629 newMap!16)))))))

(assert (= (and d!37917 res!60920) b!125828))

(assert (= (and b!125828 res!60921) b!125829))

(declare-fun m!146757 () Bool)

(assert (=> d!37917 m!146757))

(declare-fun m!146759 () Bool)

(assert (=> d!37917 m!146759))

(declare-fun m!146761 () Bool)

(assert (=> d!37917 m!146761))

(declare-fun m!146763 () Bool)

(assert (=> d!37917 m!146763))

(declare-fun m!146765 () Bool)

(assert (=> b!125828 m!146765))

(declare-fun m!146767 () Bool)

(assert (=> b!125829 m!146767))

(assert (=> bm!13383 d!37917))

(assert (=> b!124989 d!37455))

(assert (=> b!124811 d!37455))

(assert (=> b!124962 d!37709))

(assert (=> b!124962 d!37711))

(declare-fun d!37919 () Bool)

(assert (=> d!37919 (arrayContainsKey!0 (_keys!4493 newMap!16) lt!64120 #b00000000000000000000000000000000)))

(declare-fun lt!64933 () Unit!3867)

(assert (=> d!37919 (= lt!64933 (choose!13 (_keys!4493 newMap!16) lt!64120 #b00000000000000000000000000000000))))

(assert (=> d!37919 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!37919 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!4493 newMap!16) lt!64120 #b00000000000000000000000000000000) lt!64933)))

(declare-fun bs!5214 () Bool)

(assert (= bs!5214 d!37919))

(assert (=> bs!5214 m!144623))

(declare-fun m!146769 () Bool)

(assert (=> bs!5214 m!146769))

(assert (=> b!124670 d!37919))

(declare-fun d!37921 () Bool)

(declare-fun res!60922 () Bool)

(declare-fun e!82190 () Bool)

(assert (=> d!37921 (=> res!60922 e!82190)))

(assert (=> d!37921 (= res!60922 (= (select (arr!2219 (_keys!4493 newMap!16)) #b00000000000000000000000000000000) lt!64120))))

(assert (=> d!37921 (= (arrayContainsKey!0 (_keys!4493 newMap!16) lt!64120 #b00000000000000000000000000000000) e!82190)))

(declare-fun b!125830 () Bool)

(declare-fun e!82191 () Bool)

(assert (=> b!125830 (= e!82190 e!82191)))

(declare-fun res!60923 () Bool)

(assert (=> b!125830 (=> (not res!60923) (not e!82191))))

(assert (=> b!125830 (= res!60923 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2482 (_keys!4493 newMap!16))))))

(declare-fun b!125831 () Bool)

(assert (=> b!125831 (= e!82191 (arrayContainsKey!0 (_keys!4493 newMap!16) lt!64120 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!37921 (not res!60922)) b!125830))

(assert (= (and b!125830 res!60923) b!125831))

(assert (=> d!37921 m!144619))

(declare-fun m!146771 () Bool)

(assert (=> b!125831 m!146771))

(assert (=> b!124670 d!37921))

(declare-fun b!125832 () Bool)

(declare-fun e!82193 () SeekEntryResult!269)

(declare-fun lt!64935 () SeekEntryResult!269)

(assert (=> b!125832 (= e!82193 (MissingZero!269 (index!3232 lt!64935)))))

(declare-fun b!125833 () Bool)

(declare-fun c!22972 () Bool)

(declare-fun lt!64936 () (_ BitVec 64))

(assert (=> b!125833 (= c!22972 (= lt!64936 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!82192 () SeekEntryResult!269)

(assert (=> b!125833 (= e!82192 e!82193)))

(declare-fun d!37923 () Bool)

(declare-fun lt!64934 () SeekEntryResult!269)

(assert (=> d!37923 (and (or ((_ is Undefined!269) lt!64934) (not ((_ is Found!269) lt!64934)) (and (bvsge (index!3231 lt!64934) #b00000000000000000000000000000000) (bvslt (index!3231 lt!64934) (size!2482 (_keys!4493 newMap!16))))) (or ((_ is Undefined!269) lt!64934) ((_ is Found!269) lt!64934) (not ((_ is MissingZero!269) lt!64934)) (and (bvsge (index!3230 lt!64934) #b00000000000000000000000000000000) (bvslt (index!3230 lt!64934) (size!2482 (_keys!4493 newMap!16))))) (or ((_ is Undefined!269) lt!64934) ((_ is Found!269) lt!64934) ((_ is MissingZero!269) lt!64934) (not ((_ is MissingVacant!269) lt!64934)) (and (bvsge (index!3233 lt!64934) #b00000000000000000000000000000000) (bvslt (index!3233 lt!64934) (size!2482 (_keys!4493 newMap!16))))) (or ((_ is Undefined!269) lt!64934) (ite ((_ is Found!269) lt!64934) (= (select (arr!2219 (_keys!4493 newMap!16)) (index!3231 lt!64934)) (select (arr!2219 (_keys!4493 newMap!16)) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!269) lt!64934) (= (select (arr!2219 (_keys!4493 newMap!16)) (index!3230 lt!64934)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!269) lt!64934) (= (select (arr!2219 (_keys!4493 newMap!16)) (index!3233 lt!64934)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!82194 () SeekEntryResult!269)

(assert (=> d!37923 (= lt!64934 e!82194)))

(declare-fun c!22971 () Bool)

(assert (=> d!37923 (= c!22971 (and ((_ is Intermediate!269) lt!64935) (undefined!1081 lt!64935)))))

(assert (=> d!37923 (= lt!64935 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!2219 (_keys!4493 newMap!16)) #b00000000000000000000000000000000) (mask!7010 newMap!16)) (select (arr!2219 (_keys!4493 newMap!16)) #b00000000000000000000000000000000) (_keys!4493 newMap!16) (mask!7010 newMap!16)))))

(assert (=> d!37923 (validMask!0 (mask!7010 newMap!16))))

(assert (=> d!37923 (= (seekEntryOrOpen!0 (select (arr!2219 (_keys!4493 newMap!16)) #b00000000000000000000000000000000) (_keys!4493 newMap!16) (mask!7010 newMap!16)) lt!64934)))

(declare-fun b!125834 () Bool)

(assert (=> b!125834 (= e!82194 e!82192)))

(assert (=> b!125834 (= lt!64936 (select (arr!2219 (_keys!4493 newMap!16)) (index!3232 lt!64935)))))

(declare-fun c!22973 () Bool)

(assert (=> b!125834 (= c!22973 (= lt!64936 (select (arr!2219 (_keys!4493 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!125835 () Bool)

(assert (=> b!125835 (= e!82194 Undefined!269)))

(declare-fun b!125836 () Bool)

(assert (=> b!125836 (= e!82193 (seekKeyOrZeroReturnVacant!0 (x!14818 lt!64935) (index!3232 lt!64935) (index!3232 lt!64935) (select (arr!2219 (_keys!4493 newMap!16)) #b00000000000000000000000000000000) (_keys!4493 newMap!16) (mask!7010 newMap!16)))))

(declare-fun b!125837 () Bool)

(assert (=> b!125837 (= e!82192 (Found!269 (index!3232 lt!64935)))))

(assert (= (and d!37923 c!22971) b!125835))

(assert (= (and d!37923 (not c!22971)) b!125834))

(assert (= (and b!125834 c!22973) b!125837))

(assert (= (and b!125834 (not c!22973)) b!125833))

(assert (= (and b!125833 c!22972) b!125832))

(assert (= (and b!125833 (not c!22972)) b!125836))

(assert (=> d!37923 m!144633))

(declare-fun m!146773 () Bool)

(assert (=> d!37923 m!146773))

(assert (=> d!37923 m!144619))

(declare-fun m!146775 () Bool)

(assert (=> d!37923 m!146775))

(assert (=> d!37923 m!144619))

(assert (=> d!37923 m!146773))

(declare-fun m!146777 () Bool)

(assert (=> d!37923 m!146777))

(declare-fun m!146779 () Bool)

(assert (=> d!37923 m!146779))

(declare-fun m!146781 () Bool)

(assert (=> d!37923 m!146781))

(declare-fun m!146783 () Bool)

(assert (=> b!125834 m!146783))

(assert (=> b!125836 m!144619))

(declare-fun m!146785 () Bool)

(assert (=> b!125836 m!146785))

(assert (=> b!124670 d!37923))

(declare-fun mapIsEmpty!4487 () Bool)

(declare-fun mapRes!4487 () Bool)

(assert (=> mapIsEmpty!4487 mapRes!4487))

(declare-fun b!125839 () Bool)

(declare-fun e!82196 () Bool)

(assert (=> b!125839 (= e!82196 tp_is_empty!2835)))

(declare-fun mapNonEmpty!4487 () Bool)

(declare-fun tp!10931 () Bool)

(declare-fun e!82195 () Bool)

(assert (=> mapNonEmpty!4487 (= mapRes!4487 (and tp!10931 e!82195))))

(declare-fun mapValue!4487 () ValueCell!1074)

(declare-fun mapRest!4487 () (Array (_ BitVec 32) ValueCell!1074))

(declare-fun mapKey!4487 () (_ BitVec 32))

(assert (=> mapNonEmpty!4487 (= mapRest!4485 (store mapRest!4487 mapKey!4487 mapValue!4487))))

(declare-fun condMapEmpty!4487 () Bool)

(declare-fun mapDefault!4487 () ValueCell!1074)

(assert (=> mapNonEmpty!4485 (= condMapEmpty!4487 (= mapRest!4485 ((as const (Array (_ BitVec 32) ValueCell!1074)) mapDefault!4487)))))

(assert (=> mapNonEmpty!4485 (= tp!10929 (and e!82196 mapRes!4487))))

(declare-fun b!125838 () Bool)

(assert (=> b!125838 (= e!82195 tp_is_empty!2835)))

(assert (= (and mapNonEmpty!4485 condMapEmpty!4487) mapIsEmpty!4487))

(assert (= (and mapNonEmpty!4485 (not condMapEmpty!4487)) mapNonEmpty!4487))

(assert (= (and mapNonEmpty!4487 ((_ is ValueCellFull!1074) mapValue!4487)) b!125838))

(assert (= (and mapNonEmpty!4485 ((_ is ValueCellFull!1074) mapDefault!4487)) b!125839))

(declare-fun m!146787 () Bool)

(assert (=> mapNonEmpty!4487 m!146787))

(declare-fun mapIsEmpty!4488 () Bool)

(declare-fun mapRes!4488 () Bool)

(assert (=> mapIsEmpty!4488 mapRes!4488))

(declare-fun b!125841 () Bool)

(declare-fun e!82198 () Bool)

(assert (=> b!125841 (= e!82198 tp_is_empty!2835)))

(declare-fun mapNonEmpty!4488 () Bool)

(declare-fun tp!10932 () Bool)

(declare-fun e!82197 () Bool)

(assert (=> mapNonEmpty!4488 (= mapRes!4488 (and tp!10932 e!82197))))

(declare-fun mapValue!4488 () ValueCell!1074)

(declare-fun mapRest!4488 () (Array (_ BitVec 32) ValueCell!1074))

(declare-fun mapKey!4488 () (_ BitVec 32))

(assert (=> mapNonEmpty!4488 (= mapRest!4486 (store mapRest!4488 mapKey!4488 mapValue!4488))))

(declare-fun condMapEmpty!4488 () Bool)

(declare-fun mapDefault!4488 () ValueCell!1074)

(assert (=> mapNonEmpty!4486 (= condMapEmpty!4488 (= mapRest!4486 ((as const (Array (_ BitVec 32) ValueCell!1074)) mapDefault!4488)))))

(assert (=> mapNonEmpty!4486 (= tp!10930 (and e!82198 mapRes!4488))))

(declare-fun b!125840 () Bool)

(assert (=> b!125840 (= e!82197 tp_is_empty!2835)))

(assert (= (and mapNonEmpty!4486 condMapEmpty!4488) mapIsEmpty!4488))

(assert (= (and mapNonEmpty!4486 (not condMapEmpty!4488)) mapNonEmpty!4488))

(assert (= (and mapNonEmpty!4488 ((_ is ValueCellFull!1074) mapValue!4488)) b!125840))

(assert (= (and mapNonEmpty!4486 ((_ is ValueCellFull!1074) mapDefault!4488)) b!125841))

(declare-fun m!146789 () Bool)

(assert (=> mapNonEmpty!4488 m!146789))

(declare-fun b_lambda!5519 () Bool)

(assert (= b_lambda!5513 (or (and b!124369 b_free!2837 (= (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) (defaultEntry!2764 newMap!16))) (and b!124375 b_free!2839) b_lambda!5519)))

(declare-fun b_lambda!5521 () Bool)

(assert (= b_lambda!5489 (or (and b!124369 b_free!2837 (= (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) (defaultEntry!2764 newMap!16))) (and b!124375 b_free!2839) b_lambda!5521)))

(declare-fun b_lambda!5523 () Bool)

(assert (= b_lambda!5501 (or (and b!124369 b_free!2837 (= (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) (defaultEntry!2764 newMap!16))) (and b!124375 b_free!2839) b_lambda!5523)))

(declare-fun b_lambda!5525 () Bool)

(assert (= b_lambda!5499 (or (and b!124369 b_free!2837 (= (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) (defaultEntry!2764 newMap!16))) (and b!124375 b_free!2839) b_lambda!5525)))

(declare-fun b_lambda!5527 () Bool)

(assert (= b_lambda!5515 (or (and b!124369 b_free!2837 (= (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) (defaultEntry!2764 newMap!16))) (and b!124375 b_free!2839) b_lambda!5527)))

(declare-fun b_lambda!5529 () Bool)

(assert (= b_lambda!5503 (or (and b!124369 b_free!2837 (= (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) (defaultEntry!2764 newMap!16))) (and b!124375 b_free!2839) b_lambda!5529)))

(declare-fun b_lambda!5531 () Bool)

(assert (= b_lambda!5497 (or (and b!124369 b_free!2837 (= (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) (defaultEntry!2764 newMap!16))) (and b!124375 b_free!2839) b_lambda!5531)))

(declare-fun b_lambda!5533 () Bool)

(assert (= b_lambda!5495 (or (and b!124369 b_free!2837) (and b!124375 b_free!2839 (= (defaultEntry!2764 newMap!16) (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))))) b_lambda!5533)))

(declare-fun b_lambda!5535 () Bool)

(assert (= b_lambda!5511 (or (and b!124369 b_free!2837 (= (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) (defaultEntry!2764 newMap!16))) (and b!124375 b_free!2839) b_lambda!5535)))

(declare-fun b_lambda!5537 () Bool)

(assert (= b_lambda!5505 (or (and b!124369 b_free!2837 (= (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) (defaultEntry!2764 newMap!16))) (and b!124375 b_free!2839) b_lambda!5537)))

(declare-fun b_lambda!5539 () Bool)

(assert (= b_lambda!5491 (or (and b!124369 b_free!2837 (= (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) (defaultEntry!2764 newMap!16))) (and b!124375 b_free!2839) b_lambda!5539)))

(declare-fun b_lambda!5541 () Bool)

(assert (= b_lambda!5493 (or (and b!124369 b_free!2837) (and b!124375 b_free!2839 (= (defaultEntry!2764 newMap!16) (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))))) b_lambda!5541)))

(declare-fun b_lambda!5543 () Bool)

(assert (= b_lambda!5517 (or (and b!124369 b_free!2837 (= (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) (defaultEntry!2764 newMap!16))) (and b!124375 b_free!2839) b_lambda!5543)))

(declare-fun b_lambda!5545 () Bool)

(assert (= b_lambda!5509 (or (and b!124369 b_free!2837 (= (defaultEntry!2764 (v!3108 (underlying!436 thiss!992))) (defaultEntry!2764 newMap!16))) (and b!124375 b_free!2839) b_lambda!5545)))

(check-sat (not b!125654) (not d!37675) (not bm!13401) (not d!37657) (not b!125080) (not d!37697) (not b!125314) (not d!37869) (not b!125359) (not bm!13483) (not b!125289) (not d!37727) (not b!125025) (not b!125628) (not b_lambda!5485) (not b!125608) (not b!125071) (not b!125095) (not b!125131) (not b!125551) (not b!125663) (not d!37527) (not bm!13400) (not d!37805) (not b!125235) (not b!125492) (not d!37429) (not b!125775) (not b!125103) (not d!37545) (not bm!13424) (not b!125283) (not b!125341) (not d!37755) (not b!125142) (not b!125321) (not bm!13440) (not bm!13454) (not b!125010) (not d!37699) (not b!125695) (not b!125532) (not d!37787) (not b!125831) (not b!125315) (not b!125631) (not b!125726) (not b!125697) (not b!125090) (not b!125625) (not b!125545) (not b!125742) (not d!37691) (not bm!13471) (not d!37841) (not b!125548) (not b!125021) (not b!125777) (not b!125398) (not b_lambda!5467) (not d!37811) (not b!125423) (not b!125706) (not d!37767) (not d!37529) (not b!125415) (not d!37781) (not b!125139) (not d!37617) (not d!37849) (not b!125633) (not b_lambda!5541) (not b!125729) (not d!37587) (not b!125281) (not b!125317) (not b!125642) (not b!125579) (not b!125328) (not d!37567) (not b!125524) (not b!125079) (not d!37453) (not b!125564) (not b!125361) (not b!125643) (not b!125101) (not d!37515) (not d!37571) (not b!125771) (not b!125760) (not bm!13398) (not d!37559) (not d!37623) (not b!125128) (not b!125108) (not b!125004) (not b!125538) (not d!37747) (not b!125649) (not d!37843) (not b!125107) (not b!125512) (not d!37637) (not d!37701) (not b!125344) (not d!37625) (not d!37707) (not d!37915) (not d!37549) (not b!125420) (not d!37749) (not b!125318) (not d!37897) (not d!37693) (not b!125597) (not d!37511) (not b!125756) (not b!125017) (not b!125256) (not b_lambda!5533) (not b!125596) (not d!37799) (not bm!13446) (not b!125641) (not b!125722) (not d!37759) (not b!125270) (not b!125252) (not b!125739) (not d!37903) (not d!37769) (not b!125383) (not b!125276) (not d!37651) (not b!125248) (not b!125614) (not b!125590) (not b!125111) (not b!125308) (not b_next!2837) (not b!125360) (not b!125743) (not b!125082) (not b!125162) (not b!125089) (not d!37713) (not b_lambda!5527) (not d!37865) (not b!125804) (not d!37667) (not d!37631) (not d!37439) (not bm!13469) (not d!37611) (not b!125745) (not b!125681) (not b!125652) (not d!37585) (not bm!13480) (not b!125672) (not d!37665) (not bm!13460) (not b!125239) (not b!125488) (not b!125100) (not b!125711) (not bm!13422) (not b!125604) (not b!125404) (not b!125718) (not d!37825) (not b!125284) (not b!125518) (not d!37883) (not b!125535) (not b!125371) (not b!125118) (not b!125278) (not b!125714) (not b!125593) (not b!125119) b_and!7739 (not b!125112) (not b!125766) (not b!125381) (not d!37459) (not b_lambda!5507) (not d!37469) (not b!125601) (not bm!13489) (not bm!13463) (not b!125581) (not d!37743) (not b!125781) (not b!125553) (not d!37509) (not b!125540) (not b!125660) (not d!37729) (not b!125330) (not d!37907) (not b_lambda!5537) (not d!37783) (not b!125678) (not bm!13456) (not bm!13474) (not bm!13416) (not b!125438) (not b!125588) (not b!125413) (not b!125425) (not b!125254) (not b!125824) (not d!37621) (not b!125445) (not d!37475) (not d!37861) (not d!37771) (not b!125106) (not b!125620) (not b!125812) (not b!125467) (not b!125750) (not b!125647) (not d!37595) (not b!125203) (not b!125661) (not b!125356) (not b!125081) (not mapNonEmpty!4487) (not b_lambda!5479) (not b!125598) (not bm!13419) (not b!125486) (not b!125323) (not b!125509) (not d!37875) (not d!37777) (not b!125801) (not b!125088) (not b!125397) (not b!125574) (not d!37445) (not b!125391) (not b!125068) (not b!125817) (not bm!13432) (not d!37857) (not d!37577) (not b!125292) (not b!125506) (not b!125523) (not b!125782) (not b!125547) (not d!37563) (not b!125704) (not b!125246) (not b!125262) (not d!37845) (not b!125460) (not b!125452) (not bm!13450) (not bm!13443) (not d!37463) (not d!37683) (not b!125594) (not bm!13490) (not bm!13467) (not b!125836) (not d!37465) (not b!125549) (not d!37891) (not d!37887) (not b!125682) (not b!125561) (not d!37839) (not d!37763) (not d!37819) (not b_lambda!5463) (not d!37535) (not b!125122) (not b!125769) (not d!37809) (not b!125558) (not b!125401) (not b!125667) (not b!125366) (not b!125339) (not d!37671) b_and!7741 (not b!125617) (not b!125331) (not d!37481) (not b!125507) (not d!37741) (not b!125036) (not b!125728) (not b_lambda!5521) (not b!125573) (not b!125485) (not b!125074) (not d!37521) (not b!125556) (not b!125098) (not b!125690) (not b!125324) (not b_lambda!5483) (not d!37615) (not b_lambda!5545) (not b!125135) (not d!37645) (not bm!13433) (not d!37685) (not b!125154) (not d!37609) (not b!125471) (not b!125033) (not bm!13465) (not b!125821) (not b!125110) (not d!37581) (not bm!13411) (not b!125477) (not b!125166) (not b!125565) (not b!125813) (not d!37553) (not b!125358) (not d!37717) (not b!125030) (not b!125463) (not b!125828) (not bm!13475) (not d!37833) (not b!125114) (not b_lambda!5487) (not b_lambda!5529) tp_is_empty!2835 (not b!125259) (not b!125482) (not bm!13431) (not d!37795) (not d!37889) (not mapNonEmpty!4488) (not b!125498) (not d!37909) (not d!37633) (not b!125022) (not d!37871) (not b!125412) (not d!37447) (not d!37745) (not b!125611) (not b!125353) (not bm!13426) (not d!37851) (not d!37813) (not b!125703) (not bm!13409) (not d!37785) (not b!125369) (not b!125440) (not d!37547) (not b!125568) (not d!37659) (not bm!13390) (not b!125455) (not bm!13429) (not bm!13457) (not b!125020) (not b!125431) (not b!125555) (not d!37901) (not b!125559) (not d!37653) (not d!37641) (not b!125083) (not b!125007) (not d!37483) (not d!37555) (not b!125790) (not b!125442) (not b!125557) (not b!125689) (not d!37757) (not b!125257) (not d!37801) (not b!125607) (not b!125542) (not b!125435) (not b!125146) (not b!125290) (not b!125582) (not b!125265) (not d!37619) (not b!125676) (not b!125392) (not b!125094) (not b!125698) (not d!37489) (not b!125576) (not b!125803) (not b!125165) (not d!37803) (not d!37873) (not bm!13445) (not d!37879) (not b!125636) (not b!125809) (not b!125273) (not d!37431) (not b!125406) (not b!125734) (not b!125566) (not d!37923) (not b!125610) (not b!125015) (not b!125069) (not b!125612) (not b!125587) (not d!37829) (not b!125619) (not b!125173) (not bm!13447) (not b!125382) (not b_lambda!5519) (not b!125480) (not b!125148) (not b!125375) (not d!37473) (not bm!13402) (not b!125177) (not b!125716) (not b!125521) (not b!125175) (not d!37739) (not b_next!2839) (not d!37467) (not bm!13481) (not b!125158) (not b!125446) (not b!125085) (not d!37761) (not bm!13436) (not bm!13473) (not b!125761) (not b!125429) (not b!125516) (not b!125469) (not b!125247) (not bm!13438) (not bm!13487) (not b!125687) (not b!125679) (not b!125655) (not b!125137) (not b!125810) (not b!125461) (not b!125374) (not d!37753) (not d!37765) (not d!37487) (not b!125351) (not d!37831) (not b!125386) (not b!125414) (not b!125012) (not bm!13478) (not d!37917) (not d!37491) (not bm!13458) (not d!37639) (not b!125409) (not d!37797) (not d!37441) (not b!125692) (not b!125120) (not d!37751) (not b!125264) (not d!37479) (not d!37497) (not bm!13417) (not b!125807) (not b!125043) (not b!125336) (not bm!13484) (not b!125572) (not b!125428) (not b!125160) (not b!125757) (not b!125250) (not d!37723) (not b!125271) (not d!37775) (not d!37655) (not b!125400) (not b!125115) (not b_lambda!5523) (not d!37737) (not bm!13439) (not b!125685) (not b!125443) (not d!37635) (not b!125502) (not d!37583) (not d!37477) (not d!37735) (not b!125668) (not d!37539) (not b!125539) (not b!125347) (not b!125530) (not bm!13425) (not b!125800) (not b!125042) (not b_lambda!5535) (not b!125097) (not b_lambda!5531) (not b!125113) (not d!37629) (not d!37533) (not d!37471) (not d!37789) (not b!125028) (not b!125675) (not b!125099) (not d!37855) (not b!125715) (not b!125737) (not b!125390) (not d!37919) (not b!125626) (not b!125249) (not d!37647) (not b!125638) (not d!37677) (not b!125396) (not d!37485) (not b!125683) (not b!125529) (not b!125829) (not b!125457) (not d!37817) (not b_lambda!5543) (not d!37591) (not d!37433) (not d!37673) (not b!125472) (not b!125645) (not d!37613) (not b!125749) (not b!125164) (not bm!13389) (not b!125447) (not d!37649) (not bm!13418) (not b!125470) (not b!125224) (not b!125377) (not b!125163) (not b!125814) (not d!37703) (not d!37593) (not b!125444) (not d!37687) (not bm!13452) (not b!125355) (not b_lambda!5539) (not d!37663) (not b!125031) (not b!125774) (not b!125827) (not b!125639) (not bm!13414) (not d!37461) (not b!125552) (not d!37715) (not b!125394) (not d!37531) (not b!125605) (not b!125093) (not b!125389) (not b!125499) (not b!125725) (not b!125026) (not b!125819) (not d!37543) (not d!37709) (not b!125014) (not d!37791) (not bm!13408) (not b!125013) (not b!125345) (not b!125504) (not b!125640) (not b_lambda!5481) (not bm!13482) (not d!37643) (not b!125515) (not b!125569) (not bm!13403) (not d!37599) (not b_lambda!5525))
(check-sat b_and!7739 b_and!7741 (not b_next!2837) (not b_next!2839))
