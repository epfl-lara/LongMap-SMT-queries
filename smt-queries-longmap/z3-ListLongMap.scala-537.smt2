; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!13550 () Bool)

(assert start!13550)

(declare-fun b!124545 () Bool)

(declare-fun b_free!2833 () Bool)

(declare-fun b_next!2833 () Bool)

(assert (=> b!124545 (= b_free!2833 (not b_next!2833))))

(declare-fun tp!10900 () Bool)

(declare-fun b_and!7649 () Bool)

(assert (=> b!124545 (= tp!10900 b_and!7649)))

(declare-fun b!124538 () Bool)

(declare-fun b_free!2835 () Bool)

(declare-fun b_next!2835 () Bool)

(assert (=> b!124538 (= b_free!2835 (not b_next!2835))))

(declare-fun tp!10897 () Bool)

(declare-fun b_and!7651 () Bool)

(assert (=> b!124538 (= tp!10897 b_and!7651)))

(declare-fun b!124533 () Bool)

(declare-fun e!81399 () Bool)

(declare-datatypes ((V!3425 0))(
  ( (V!3426 (val!1461 Int)) )
))
(declare-datatypes ((array!4667 0))(
  ( (array!4668 (arr!2210 (Array (_ BitVec 32) (_ BitVec 64))) (size!2473 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1073 0))(
  ( (ValueCellFull!1073 (v!3107 V!3425)) (EmptyCell!1073) )
))
(declare-datatypes ((array!4669 0))(
  ( (array!4670 (arr!2211 (Array (_ BitVec 32) ValueCell!1073)) (size!2474 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1054 0))(
  ( (LongMapFixedSize!1055 (defaultEntry!2763 Int) (mask!7009 (_ BitVec 32)) (extraKeys!2548 (_ BitVec 32)) (zeroValue!2628 V!3425) (minValue!2628 V!3425) (_size!576 (_ BitVec 32)) (_keys!4492 array!4667) (_values!2746 array!4669) (_vacant!576 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!850 0))(
  ( (Cell!851 (v!3108 LongMapFixedSize!1054)) )
))
(declare-datatypes ((LongMap!850 0))(
  ( (LongMap!851 (underlying!436 Cell!850)) )
))
(declare-fun thiss!992 () LongMap!850)

(assert (=> b!124533 (= e!81399 (not (= (size!2474 (_values!2746 (v!3108 (underlying!436 thiss!992)))) (bvadd #b00000000000000000000000000000001 (mask!7009 (v!3108 (underlying!436 thiss!992)))))))))

(declare-fun mapNonEmpty!4467 () Bool)

(declare-fun mapRes!4468 () Bool)

(declare-fun tp!10899 () Bool)

(declare-fun e!81391 () Bool)

(assert (=> mapNonEmpty!4467 (= mapRes!4468 (and tp!10899 e!81391))))

(declare-fun mapValue!4467 () ValueCell!1073)

(declare-fun mapRest!4468 () (Array (_ BitVec 32) ValueCell!1073))

(declare-fun mapKey!4468 () (_ BitVec 32))

(declare-fun newMap!16 () LongMapFixedSize!1054)

(assert (=> mapNonEmpty!4467 (= (arr!2211 (_values!2746 newMap!16)) (store mapRest!4468 mapKey!4468 mapValue!4467))))

(declare-fun b!124534 () Bool)

(declare-fun e!81398 () Bool)

(declare-fun e!81397 () Bool)

(assert (=> b!124534 (= e!81398 e!81397)))

(declare-fun b!124535 () Bool)

(declare-fun e!81400 () Bool)

(declare-fun e!81394 () Bool)

(declare-fun mapRes!4467 () Bool)

(assert (=> b!124535 (= e!81400 (and e!81394 mapRes!4467))))

(declare-fun condMapEmpty!4468 () Bool)

(declare-fun mapDefault!4468 () ValueCell!1073)

(assert (=> b!124535 (= condMapEmpty!4468 (= (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!1073)) mapDefault!4468)))))

(declare-fun b!124536 () Bool)

(declare-fun res!60343 () Bool)

(declare-fun e!81401 () Bool)

(assert (=> b!124536 (=> (not res!60343) (not e!81401))))

(assert (=> b!124536 (= res!60343 (bvsge (bvadd #b00000000000000000000000000000001 (mask!7009 newMap!16)) (_size!576 (v!3108 (underlying!436 thiss!992)))))))

(declare-fun mapNonEmpty!4468 () Bool)

(declare-fun tp!10898 () Bool)

(declare-fun e!81389 () Bool)

(assert (=> mapNonEmpty!4468 (= mapRes!4467 (and tp!10898 e!81389))))

(declare-fun mapValue!4468 () ValueCell!1073)

(declare-fun mapKey!4467 () (_ BitVec 32))

(declare-fun mapRest!4467 () (Array (_ BitVec 32) ValueCell!1073))

(assert (=> mapNonEmpty!4468 (= (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) (store mapRest!4467 mapKey!4467 mapValue!4468))))

(declare-fun b!124537 () Bool)

(declare-fun e!81402 () Bool)

(assert (=> b!124537 (= e!81402 e!81399)))

(declare-fun res!60341 () Bool)

(assert (=> b!124537 (=> (not res!60341) (not e!81399))))

(declare-datatypes ((tuple2!2520 0))(
  ( (tuple2!2521 (_1!1271 (_ BitVec 64)) (_2!1271 V!3425)) )
))
(declare-datatypes ((List!1676 0))(
  ( (Nil!1673) (Cons!1672 (h!2273 tuple2!2520) (t!5995 List!1676)) )
))
(declare-datatypes ((ListLongMap!1631 0))(
  ( (ListLongMap!1632 (toList!831 List!1676)) )
))
(declare-fun lt!64044 () ListLongMap!1631)

(declare-fun from!355 () (_ BitVec 32))

(declare-fun contains!861 (ListLongMap!1631 (_ BitVec 64)) Bool)

(assert (=> b!124537 (= res!60341 (contains!861 lt!64044 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355)))))

(declare-datatypes ((tuple2!2522 0))(
  ( (tuple2!2523 (_1!1272 Bool) (_2!1272 LongMapFixedSize!1054)) )
))
(declare-fun lt!64043 () tuple2!2522)

(declare-fun update!185 (LongMapFixedSize!1054 (_ BitVec 64) V!3425) tuple2!2522)

(declare-fun get!1446 (ValueCell!1073 V!3425) V!3425)

(declare-fun dynLambda!415 (Int (_ BitVec 64)) V!3425)

(assert (=> b!124537 (= lt!64043 (update!185 newMap!16 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun tp_is_empty!2833 () Bool)

(declare-fun e!81390 () Bool)

(declare-fun e!81395 () Bool)

(declare-fun array_inv!1385 (array!4667) Bool)

(declare-fun array_inv!1386 (array!4669) Bool)

(assert (=> b!124538 (= e!81390 (and tp!10897 tp_is_empty!2833 (array_inv!1385 (_keys!4492 newMap!16)) (array_inv!1386 (_values!2746 newMap!16)) e!81395))))

(declare-fun b!124539 () Bool)

(assert (=> b!124539 (= e!81394 tp_is_empty!2833)))

(declare-fun b!124540 () Bool)

(assert (=> b!124540 (= e!81389 tp_is_empty!2833)))

(declare-fun mapIsEmpty!4467 () Bool)

(assert (=> mapIsEmpty!4467 mapRes!4468))

(declare-fun b!124541 () Bool)

(declare-fun e!81396 () Bool)

(assert (=> b!124541 (= e!81395 (and e!81396 mapRes!4468))))

(declare-fun condMapEmpty!4467 () Bool)

(declare-fun mapDefault!4467 () ValueCell!1073)

(assert (=> b!124541 (= condMapEmpty!4467 (= (arr!2211 (_values!2746 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!1073)) mapDefault!4467)))))

(declare-fun b!124542 () Bool)

(declare-fun res!60339 () Bool)

(assert (=> b!124542 (=> (not res!60339) (not e!81401))))

(declare-fun valid!515 (LongMapFixedSize!1054) Bool)

(assert (=> b!124542 (= res!60339 (valid!515 newMap!16))))

(declare-fun b!124543 () Bool)

(declare-fun res!60340 () Bool)

(assert (=> b!124543 (=> (not res!60340) (not e!81399))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!124543 (= res!60340 (validMask!0 (mask!7009 (v!3108 (underlying!436 thiss!992)))))))

(declare-fun b!124544 () Bool)

(assert (=> b!124544 (= e!81401 e!81402)))

(declare-fun res!60337 () Bool)

(assert (=> b!124544 (=> (not res!60337) (not e!81402))))

(declare-fun lt!64042 () ListLongMap!1631)

(assert (=> b!124544 (= res!60337 (and (= lt!64042 lt!64044) (not (= (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun map!1377 (LongMapFixedSize!1054) ListLongMap!1631)

(assert (=> b!124544 (= lt!64044 (map!1377 newMap!16))))

(declare-fun getCurrentListMap!511 (array!4667 array!4669 (_ BitVec 32) (_ BitVec 32) V!3425 V!3425 (_ BitVec 32) Int) ListLongMap!1631)

(assert (=> b!124544 (= lt!64042 (getCurrentListMap!511 (_keys!4492 (v!3108 (underlying!436 thiss!992))) (_values!2746 (v!3108 (underlying!436 thiss!992))) (mask!7009 (v!3108 (underlying!436 thiss!992))) (extraKeys!2548 (v!3108 (underlying!436 thiss!992))) (zeroValue!2628 (v!3108 (underlying!436 thiss!992))) (minValue!2628 (v!3108 (underlying!436 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2763 (v!3108 (underlying!436 thiss!992)))))))

(declare-fun res!60338 () Bool)

(assert (=> start!13550 (=> (not res!60338) (not e!81401))))

(declare-fun valid!516 (LongMap!850) Bool)

(assert (=> start!13550 (= res!60338 (valid!516 thiss!992))))

(assert (=> start!13550 e!81401))

(declare-fun e!81393 () Bool)

(assert (=> start!13550 e!81393))

(assert (=> start!13550 true))

(assert (=> start!13550 e!81390))

(assert (=> b!124545 (= e!81397 (and tp!10900 tp_is_empty!2833 (array_inv!1385 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) (array_inv!1386 (_values!2746 (v!3108 (underlying!436 thiss!992)))) e!81400))))

(declare-fun b!124546 () Bool)

(declare-fun res!60342 () Bool)

(assert (=> b!124546 (=> (not res!60342) (not e!81401))))

(assert (=> b!124546 (= res!60342 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2473 (_keys!4492 (v!3108 (underlying!436 thiss!992)))))))))

(declare-fun b!124547 () Bool)

(assert (=> b!124547 (= e!81393 e!81398)))

(declare-fun b!124548 () Bool)

(assert (=> b!124548 (= e!81391 tp_is_empty!2833)))

(declare-fun mapIsEmpty!4468 () Bool)

(assert (=> mapIsEmpty!4468 mapRes!4467))

(declare-fun b!124549 () Bool)

(assert (=> b!124549 (= e!81396 tp_is_empty!2833)))

(assert (= (and start!13550 res!60338) b!124546))

(assert (= (and b!124546 res!60342) b!124542))

(assert (= (and b!124542 res!60339) b!124536))

(assert (= (and b!124536 res!60343) b!124544))

(assert (= (and b!124544 res!60337) b!124537))

(assert (= (and b!124537 res!60341) b!124543))

(assert (= (and b!124543 res!60340) b!124533))

(assert (= (and b!124535 condMapEmpty!4468) mapIsEmpty!4468))

(assert (= (and b!124535 (not condMapEmpty!4468)) mapNonEmpty!4468))

(get-info :version)

(assert (= (and mapNonEmpty!4468 ((_ is ValueCellFull!1073) mapValue!4468)) b!124540))

(assert (= (and b!124535 ((_ is ValueCellFull!1073) mapDefault!4468)) b!124539))

(assert (= b!124545 b!124535))

(assert (= b!124534 b!124545))

(assert (= b!124547 b!124534))

(assert (= start!13550 b!124547))

(assert (= (and b!124541 condMapEmpty!4467) mapIsEmpty!4467))

(assert (= (and b!124541 (not condMapEmpty!4467)) mapNonEmpty!4467))

(assert (= (and mapNonEmpty!4467 ((_ is ValueCellFull!1073) mapValue!4467)) b!124548))

(assert (= (and b!124541 ((_ is ValueCellFull!1073) mapDefault!4467)) b!124549))

(assert (= b!124538 b!124541))

(assert (= start!13550 b!124538))

(declare-fun b_lambda!5475 () Bool)

(assert (=> (not b_lambda!5475) (not b!124537)))

(declare-fun t!5992 () Bool)

(declare-fun tb!2281 () Bool)

(assert (=> (and b!124545 (= (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) (defaultEntry!2763 (v!3108 (underlying!436 thiss!992)))) t!5992) tb!2281))

(declare-fun result!3795 () Bool)

(assert (=> tb!2281 (= result!3795 tp_is_empty!2833)))

(assert (=> b!124537 t!5992))

(declare-fun b_and!7653 () Bool)

(assert (= b_and!7649 (and (=> t!5992 result!3795) b_and!7653)))

(declare-fun tb!2283 () Bool)

(declare-fun t!5994 () Bool)

(assert (=> (and b!124538 (= (defaultEntry!2763 newMap!16) (defaultEntry!2763 (v!3108 (underlying!436 thiss!992)))) t!5994) tb!2283))

(declare-fun result!3799 () Bool)

(assert (= result!3799 result!3795))

(assert (=> b!124537 t!5994))

(declare-fun b_and!7655 () Bool)

(assert (= b_and!7651 (and (=> t!5994 result!3799) b_and!7655)))

(declare-fun m!144789 () Bool)

(assert (=> start!13550 m!144789))

(declare-fun m!144791 () Bool)

(assert (=> b!124537 m!144791))

(declare-fun m!144793 () Bool)

(assert (=> b!124537 m!144793))

(declare-fun m!144795 () Bool)

(assert (=> b!124537 m!144795))

(declare-fun m!144797 () Bool)

(assert (=> b!124537 m!144797))

(assert (=> b!124537 m!144793))

(assert (=> b!124537 m!144797))

(declare-fun m!144799 () Bool)

(assert (=> b!124537 m!144799))

(assert (=> b!124537 m!144797))

(assert (=> b!124537 m!144795))

(declare-fun m!144801 () Bool)

(assert (=> b!124537 m!144801))

(assert (=> b!124537 m!144791))

(declare-fun m!144803 () Bool)

(assert (=> b!124545 m!144803))

(declare-fun m!144805 () Bool)

(assert (=> b!124545 m!144805))

(declare-fun m!144807 () Bool)

(assert (=> mapNonEmpty!4468 m!144807))

(declare-fun m!144809 () Bool)

(assert (=> b!124542 m!144809))

(declare-fun m!144811 () Bool)

(assert (=> b!124543 m!144811))

(declare-fun m!144813 () Bool)

(assert (=> b!124538 m!144813))

(declare-fun m!144815 () Bool)

(assert (=> b!124538 m!144815))

(declare-fun m!144817 () Bool)

(assert (=> mapNonEmpty!4467 m!144817))

(assert (=> b!124544 m!144797))

(declare-fun m!144819 () Bool)

(assert (=> b!124544 m!144819))

(declare-fun m!144821 () Bool)

(assert (=> b!124544 m!144821))

(check-sat (not b!124538) (not mapNonEmpty!4468) (not b!124537) (not start!13550) (not b_next!2833) b_and!7655 (not b!124542) (not b!124545) (not b_lambda!5475) (not b!124544) (not mapNonEmpty!4467) (not b!124543) tp_is_empty!2833 b_and!7653 (not b_next!2835))
(check-sat b_and!7653 b_and!7655 (not b_next!2833) (not b_next!2835))
(get-model)

(declare-fun b_lambda!5481 () Bool)

(assert (= b_lambda!5475 (or (and b!124545 b_free!2833) (and b!124538 b_free!2835 (= (defaultEntry!2763 newMap!16) (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))))) b_lambda!5481)))

(check-sat (not b!124538) (not mapNonEmpty!4468) (not b!124537) (not start!13550) (not b_next!2833) (not b_lambda!5481) b_and!7655 (not b!124542) (not b!124545) (not b!124544) (not mapNonEmpty!4467) (not b!124543) tp_is_empty!2833 b_and!7653 (not b_next!2835))
(check-sat b_and!7653 b_and!7655 (not b_next!2833) (not b_next!2835))
(get-model)

(declare-fun d!37493 () Bool)

(assert (=> d!37493 (= (array_inv!1385 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) (bvsge (size!2473 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!124545 d!37493))

(declare-fun d!37495 () Bool)

(assert (=> d!37495 (= (array_inv!1386 (_values!2746 (v!3108 (underlying!436 thiss!992)))) (bvsge (size!2474 (_values!2746 (v!3108 (underlying!436 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!124545 d!37495))

(declare-fun d!37497 () Bool)

(assert (=> d!37497 (= (valid!516 thiss!992) (valid!515 (v!3108 (underlying!436 thiss!992))))))

(declare-fun bs!5167 () Bool)

(assert (= bs!5167 d!37497))

(declare-fun m!144891 () Bool)

(assert (=> bs!5167 m!144891))

(assert (=> start!13550 d!37497))

(declare-fun d!37499 () Bool)

(assert (=> d!37499 (= (map!1377 newMap!16) (getCurrentListMap!511 (_keys!4492 newMap!16) (_values!2746 newMap!16) (mask!7009 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16)))))

(declare-fun bs!5168 () Bool)

(assert (= bs!5168 d!37499))

(declare-fun m!144893 () Bool)

(assert (=> bs!5168 m!144893))

(assert (=> b!124544 d!37499))

(declare-fun c!22679 () Bool)

(declare-fun call!13274 () ListLongMap!1631)

(declare-fun call!13273 () ListLongMap!1631)

(declare-fun bm!13265 () Bool)

(declare-fun call!13268 () ListLongMap!1631)

(declare-fun call!13270 () ListLongMap!1631)

(declare-fun c!22677 () Bool)

(declare-fun +!163 (ListLongMap!1631 tuple2!2520) ListLongMap!1631)

(assert (=> bm!13265 (= call!13268 (+!163 (ite c!22677 call!13273 (ite c!22679 call!13274 call!13270)) (ite (or c!22677 c!22679) (tuple2!2521 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2628 (v!3108 (underlying!436 thiss!992)))) (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 (v!3108 (underlying!436 thiss!992)))))))))

(declare-fun b!124700 () Bool)

(declare-fun e!81527 () Bool)

(declare-fun e!81520 () Bool)

(assert (=> b!124700 (= e!81527 e!81520)))

(declare-fun res!60404 () Bool)

(declare-fun call!13269 () Bool)

(assert (=> b!124700 (= res!60404 call!13269)))

(assert (=> b!124700 (=> (not res!60404) (not e!81520))))

(declare-fun bm!13266 () Bool)

(assert (=> bm!13266 (= call!13274 call!13273)))

(declare-fun lt!64108 () ListLongMap!1631)

(declare-fun b!124702 () Bool)

(declare-fun e!81530 () Bool)

(declare-fun apply!110 (ListLongMap!1631 (_ BitVec 64)) V!3425)

(assert (=> b!124702 (= e!81530 (= (apply!110 lt!64108 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!124702 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2474 (_values!2746 (v!3108 (underlying!436 thiss!992))))))))

(assert (=> b!124702 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2473 (_keys!4492 (v!3108 (underlying!436 thiss!992))))))))

(declare-fun bm!13267 () Bool)

(assert (=> bm!13267 (= call!13270 call!13274)))

(declare-fun b!124703 () Bool)

(declare-fun e!81521 () Bool)

(declare-fun e!81526 () Bool)

(assert (=> b!124703 (= e!81521 e!81526)))

(declare-fun res!60411 () Bool)

(declare-fun call!13272 () Bool)

(assert (=> b!124703 (= res!60411 call!13272)))

(assert (=> b!124703 (=> (not res!60411) (not e!81526))))

(declare-fun b!124704 () Bool)

(declare-datatypes ((Unit!3871 0))(
  ( (Unit!3872) )
))
(declare-fun e!81524 () Unit!3871)

(declare-fun lt!64119 () Unit!3871)

(assert (=> b!124704 (= e!81524 lt!64119)))

(declare-fun lt!64122 () ListLongMap!1631)

(declare-fun getCurrentListMapNoExtraKeys!130 (array!4667 array!4669 (_ BitVec 32) (_ BitVec 32) V!3425 V!3425 (_ BitVec 32) Int) ListLongMap!1631)

(assert (=> b!124704 (= lt!64122 (getCurrentListMapNoExtraKeys!130 (_keys!4492 (v!3108 (underlying!436 thiss!992))) (_values!2746 (v!3108 (underlying!436 thiss!992))) (mask!7009 (v!3108 (underlying!436 thiss!992))) (extraKeys!2548 (v!3108 (underlying!436 thiss!992))) (zeroValue!2628 (v!3108 (underlying!436 thiss!992))) (minValue!2628 (v!3108 (underlying!436 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2763 (v!3108 (underlying!436 thiss!992)))))))

(declare-fun lt!64114 () (_ BitVec 64))

(assert (=> b!124704 (= lt!64114 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!64109 () (_ BitVec 64))

(assert (=> b!124704 (= lt!64109 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!64112 () Unit!3871)

(declare-fun addStillContains!86 (ListLongMap!1631 (_ BitVec 64) V!3425 (_ BitVec 64)) Unit!3871)

(assert (=> b!124704 (= lt!64112 (addStillContains!86 lt!64122 lt!64114 (zeroValue!2628 (v!3108 (underlying!436 thiss!992))) lt!64109))))

(assert (=> b!124704 (contains!861 (+!163 lt!64122 (tuple2!2521 lt!64114 (zeroValue!2628 (v!3108 (underlying!436 thiss!992))))) lt!64109)))

(declare-fun lt!64107 () Unit!3871)

(assert (=> b!124704 (= lt!64107 lt!64112)))

(declare-fun lt!64116 () ListLongMap!1631)

(assert (=> b!124704 (= lt!64116 (getCurrentListMapNoExtraKeys!130 (_keys!4492 (v!3108 (underlying!436 thiss!992))) (_values!2746 (v!3108 (underlying!436 thiss!992))) (mask!7009 (v!3108 (underlying!436 thiss!992))) (extraKeys!2548 (v!3108 (underlying!436 thiss!992))) (zeroValue!2628 (v!3108 (underlying!436 thiss!992))) (minValue!2628 (v!3108 (underlying!436 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2763 (v!3108 (underlying!436 thiss!992)))))))

(declare-fun lt!64125 () (_ BitVec 64))

(assert (=> b!124704 (= lt!64125 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!64111 () (_ BitVec 64))

(assert (=> b!124704 (= lt!64111 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!64113 () Unit!3871)

(declare-fun addApplyDifferent!86 (ListLongMap!1631 (_ BitVec 64) V!3425 (_ BitVec 64)) Unit!3871)

(assert (=> b!124704 (= lt!64113 (addApplyDifferent!86 lt!64116 lt!64125 (minValue!2628 (v!3108 (underlying!436 thiss!992))) lt!64111))))

(assert (=> b!124704 (= (apply!110 (+!163 lt!64116 (tuple2!2521 lt!64125 (minValue!2628 (v!3108 (underlying!436 thiss!992))))) lt!64111) (apply!110 lt!64116 lt!64111))))

(declare-fun lt!64126 () Unit!3871)

(assert (=> b!124704 (= lt!64126 lt!64113)))

(declare-fun lt!64118 () ListLongMap!1631)

(assert (=> b!124704 (= lt!64118 (getCurrentListMapNoExtraKeys!130 (_keys!4492 (v!3108 (underlying!436 thiss!992))) (_values!2746 (v!3108 (underlying!436 thiss!992))) (mask!7009 (v!3108 (underlying!436 thiss!992))) (extraKeys!2548 (v!3108 (underlying!436 thiss!992))) (zeroValue!2628 (v!3108 (underlying!436 thiss!992))) (minValue!2628 (v!3108 (underlying!436 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2763 (v!3108 (underlying!436 thiss!992)))))))

(declare-fun lt!64124 () (_ BitVec 64))

(assert (=> b!124704 (= lt!64124 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!64121 () (_ BitVec 64))

(assert (=> b!124704 (= lt!64121 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!64120 () Unit!3871)

(assert (=> b!124704 (= lt!64120 (addApplyDifferent!86 lt!64118 lt!64124 (zeroValue!2628 (v!3108 (underlying!436 thiss!992))) lt!64121))))

(assert (=> b!124704 (= (apply!110 (+!163 lt!64118 (tuple2!2521 lt!64124 (zeroValue!2628 (v!3108 (underlying!436 thiss!992))))) lt!64121) (apply!110 lt!64118 lt!64121))))

(declare-fun lt!64115 () Unit!3871)

(assert (=> b!124704 (= lt!64115 lt!64120)))

(declare-fun lt!64110 () ListLongMap!1631)

(assert (=> b!124704 (= lt!64110 (getCurrentListMapNoExtraKeys!130 (_keys!4492 (v!3108 (underlying!436 thiss!992))) (_values!2746 (v!3108 (underlying!436 thiss!992))) (mask!7009 (v!3108 (underlying!436 thiss!992))) (extraKeys!2548 (v!3108 (underlying!436 thiss!992))) (zeroValue!2628 (v!3108 (underlying!436 thiss!992))) (minValue!2628 (v!3108 (underlying!436 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2763 (v!3108 (underlying!436 thiss!992)))))))

(declare-fun lt!64117 () (_ BitVec 64))

(assert (=> b!124704 (= lt!64117 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!64128 () (_ BitVec 64))

(assert (=> b!124704 (= lt!64128 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(assert (=> b!124704 (= lt!64119 (addApplyDifferent!86 lt!64110 lt!64117 (minValue!2628 (v!3108 (underlying!436 thiss!992))) lt!64128))))

(assert (=> b!124704 (= (apply!110 (+!163 lt!64110 (tuple2!2521 lt!64117 (minValue!2628 (v!3108 (underlying!436 thiss!992))))) lt!64128) (apply!110 lt!64110 lt!64128))))

(declare-fun b!124705 () Bool)

(declare-fun e!81522 () ListLongMap!1631)

(assert (=> b!124705 (= e!81522 call!13270)))

(declare-fun b!124706 () Bool)

(declare-fun e!81529 () Bool)

(assert (=> b!124706 (= e!81529 e!81521)))

(declare-fun c!22675 () Bool)

(assert (=> b!124706 (= c!22675 (not (= (bvand (extraKeys!2548 (v!3108 (underlying!436 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!124707 () Bool)

(assert (=> b!124707 (= e!81527 (not call!13269))))

(declare-fun bm!13268 () Bool)

(assert (=> bm!13268 (= call!13272 (contains!861 lt!64108 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!124708 () Bool)

(declare-fun e!81525 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!124708 (= e!81525 (validKeyInArray!0 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun d!37501 () Bool)

(assert (=> d!37501 e!81529))

(declare-fun res!60407 () Bool)

(assert (=> d!37501 (=> (not res!60407) (not e!81529))))

(assert (=> d!37501 (= res!60407 (or (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2473 (_keys!4492 (v!3108 (underlying!436 thiss!992))))) (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2473 (_keys!4492 (v!3108 (underlying!436 thiss!992))))))))))

(declare-fun lt!64123 () ListLongMap!1631)

(assert (=> d!37501 (= lt!64108 lt!64123)))

(declare-fun lt!64127 () Unit!3871)

(assert (=> d!37501 (= lt!64127 e!81524)))

(declare-fun c!22674 () Bool)

(declare-fun e!81531 () Bool)

(assert (=> d!37501 (= c!22674 e!81531)))

(declare-fun res!60409 () Bool)

(assert (=> d!37501 (=> (not res!60409) (not e!81531))))

(assert (=> d!37501 (= res!60409 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2473 (_keys!4492 (v!3108 (underlying!436 thiss!992))))))))

(declare-fun e!81519 () ListLongMap!1631)

(assert (=> d!37501 (= lt!64123 e!81519)))

(assert (=> d!37501 (= c!22677 (and (not (= (bvand (extraKeys!2548 (v!3108 (underlying!436 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2548 (v!3108 (underlying!436 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!37501 (validMask!0 (mask!7009 (v!3108 (underlying!436 thiss!992))))))

(assert (=> d!37501 (= (getCurrentListMap!511 (_keys!4492 (v!3108 (underlying!436 thiss!992))) (_values!2746 (v!3108 (underlying!436 thiss!992))) (mask!7009 (v!3108 (underlying!436 thiss!992))) (extraKeys!2548 (v!3108 (underlying!436 thiss!992))) (zeroValue!2628 (v!3108 (underlying!436 thiss!992))) (minValue!2628 (v!3108 (underlying!436 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2763 (v!3108 (underlying!436 thiss!992)))) lt!64108)))

(declare-fun b!124701 () Bool)

(assert (=> b!124701 (= e!81521 (not call!13272))))

(declare-fun bm!13269 () Bool)

(assert (=> bm!13269 (= call!13269 (contains!861 lt!64108 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!124709 () Bool)

(assert (=> b!124709 (= e!81531 (validKeyInArray!0 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!124710 () Bool)

(assert (=> b!124710 (= e!81526 (= (apply!110 lt!64108 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2628 (v!3108 (underlying!436 thiss!992)))))))

(declare-fun b!124711 () Bool)

(assert (=> b!124711 (= e!81520 (= (apply!110 lt!64108 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2628 (v!3108 (underlying!436 thiss!992)))))))

(declare-fun b!124712 () Bool)

(declare-fun e!81523 () Bool)

(assert (=> b!124712 (= e!81523 e!81530)))

(declare-fun res!60405 () Bool)

(assert (=> b!124712 (=> (not res!60405) (not e!81530))))

(assert (=> b!124712 (= res!60405 (contains!861 lt!64108 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!124712 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2473 (_keys!4492 (v!3108 (underlying!436 thiss!992))))))))

(declare-fun b!124713 () Bool)

(declare-fun e!81528 () ListLongMap!1631)

(assert (=> b!124713 (= e!81519 e!81528)))

(assert (=> b!124713 (= c!22679 (and (not (= (bvand (extraKeys!2548 (v!3108 (underlying!436 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2548 (v!3108 (underlying!436 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!124714 () Bool)

(declare-fun call!13271 () ListLongMap!1631)

(assert (=> b!124714 (= e!81522 call!13271)))

(declare-fun bm!13270 () Bool)

(assert (=> bm!13270 (= call!13273 (getCurrentListMapNoExtraKeys!130 (_keys!4492 (v!3108 (underlying!436 thiss!992))) (_values!2746 (v!3108 (underlying!436 thiss!992))) (mask!7009 (v!3108 (underlying!436 thiss!992))) (extraKeys!2548 (v!3108 (underlying!436 thiss!992))) (zeroValue!2628 (v!3108 (underlying!436 thiss!992))) (minValue!2628 (v!3108 (underlying!436 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2763 (v!3108 (underlying!436 thiss!992)))))))

(declare-fun b!124715 () Bool)

(declare-fun res!60406 () Bool)

(assert (=> b!124715 (=> (not res!60406) (not e!81529))))

(assert (=> b!124715 (= res!60406 e!81523)))

(declare-fun res!60410 () Bool)

(assert (=> b!124715 (=> res!60410 e!81523)))

(assert (=> b!124715 (= res!60410 (not e!81525))))

(declare-fun res!60408 () Bool)

(assert (=> b!124715 (=> (not res!60408) (not e!81525))))

(assert (=> b!124715 (= res!60408 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2473 (_keys!4492 (v!3108 (underlying!436 thiss!992))))))))

(declare-fun b!124716 () Bool)

(assert (=> b!124716 (= e!81528 call!13271)))

(declare-fun b!124717 () Bool)

(declare-fun Unit!3873 () Unit!3871)

(assert (=> b!124717 (= e!81524 Unit!3873)))

(declare-fun b!124718 () Bool)

(assert (=> b!124718 (= e!81519 (+!163 call!13268 (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 (v!3108 (underlying!436 thiss!992))))))))

(declare-fun b!124719 () Bool)

(declare-fun res!60412 () Bool)

(assert (=> b!124719 (=> (not res!60412) (not e!81529))))

(assert (=> b!124719 (= res!60412 e!81527)))

(declare-fun c!22676 () Bool)

(assert (=> b!124719 (= c!22676 (not (= (bvand (extraKeys!2548 (v!3108 (underlying!436 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!13271 () Bool)

(assert (=> bm!13271 (= call!13271 call!13268)))

(declare-fun b!124720 () Bool)

(declare-fun c!22678 () Bool)

(assert (=> b!124720 (= c!22678 (and (not (= (bvand (extraKeys!2548 (v!3108 (underlying!436 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2548 (v!3108 (underlying!436 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!124720 (= e!81528 e!81522)))

(assert (= (and d!37501 c!22677) b!124718))

(assert (= (and d!37501 (not c!22677)) b!124713))

(assert (= (and b!124713 c!22679) b!124716))

(assert (= (and b!124713 (not c!22679)) b!124720))

(assert (= (and b!124720 c!22678) b!124714))

(assert (= (and b!124720 (not c!22678)) b!124705))

(assert (= (or b!124714 b!124705) bm!13267))

(assert (= (or b!124716 bm!13267) bm!13266))

(assert (= (or b!124716 b!124714) bm!13271))

(assert (= (or b!124718 bm!13266) bm!13270))

(assert (= (or b!124718 bm!13271) bm!13265))

(assert (= (and d!37501 res!60409) b!124709))

(assert (= (and d!37501 c!22674) b!124704))

(assert (= (and d!37501 (not c!22674)) b!124717))

(assert (= (and d!37501 res!60407) b!124715))

(assert (= (and b!124715 res!60408) b!124708))

(assert (= (and b!124715 (not res!60410)) b!124712))

(assert (= (and b!124712 res!60405) b!124702))

(assert (= (and b!124715 res!60406) b!124719))

(assert (= (and b!124719 c!22676) b!124700))

(assert (= (and b!124719 (not c!22676)) b!124707))

(assert (= (and b!124700 res!60404) b!124711))

(assert (= (or b!124700 b!124707) bm!13269))

(assert (= (and b!124719 res!60412) b!124706))

(assert (= (and b!124706 c!22675) b!124703))

(assert (= (and b!124706 (not c!22675)) b!124701))

(assert (= (and b!124703 res!60411) b!124710))

(assert (= (or b!124703 b!124701) bm!13268))

(declare-fun b_lambda!5483 () Bool)

(assert (=> (not b_lambda!5483) (not b!124702)))

(assert (=> b!124702 t!5992))

(declare-fun b_and!7673 () Bool)

(assert (= b_and!7653 (and (=> t!5992 result!3795) b_and!7673)))

(assert (=> b!124702 t!5994))

(declare-fun b_and!7675 () Bool)

(assert (= b_and!7655 (and (=> t!5994 result!3799) b_and!7675)))

(declare-fun m!144895 () Bool)

(assert (=> b!124710 m!144895))

(declare-fun m!144897 () Bool)

(assert (=> bm!13270 m!144897))

(declare-fun m!144899 () Bool)

(assert (=> b!124711 m!144899))

(declare-fun m!144901 () Bool)

(assert (=> b!124718 m!144901))

(declare-fun m!144903 () Bool)

(assert (=> bm!13269 m!144903))

(declare-fun m!144905 () Bool)

(assert (=> b!124702 m!144905))

(declare-fun m!144907 () Bool)

(assert (=> b!124702 m!144907))

(assert (=> b!124702 m!144905))

(assert (=> b!124702 m!144793))

(declare-fun m!144909 () Bool)

(assert (=> b!124702 m!144909))

(assert (=> b!124702 m!144909))

(assert (=> b!124702 m!144793))

(declare-fun m!144911 () Bool)

(assert (=> b!124702 m!144911))

(assert (=> b!124712 m!144905))

(assert (=> b!124712 m!144905))

(declare-fun m!144913 () Bool)

(assert (=> b!124712 m!144913))

(declare-fun m!144915 () Bool)

(assert (=> b!124704 m!144915))

(declare-fun m!144917 () Bool)

(assert (=> b!124704 m!144917))

(assert (=> b!124704 m!144897))

(declare-fun m!144919 () Bool)

(assert (=> b!124704 m!144919))

(declare-fun m!144921 () Bool)

(assert (=> b!124704 m!144921))

(declare-fun m!144923 () Bool)

(assert (=> b!124704 m!144923))

(assert (=> b!124704 m!144915))

(declare-fun m!144925 () Bool)

(assert (=> b!124704 m!144925))

(assert (=> b!124704 m!144919))

(declare-fun m!144927 () Bool)

(assert (=> b!124704 m!144927))

(declare-fun m!144929 () Bool)

(assert (=> b!124704 m!144929))

(declare-fun m!144931 () Bool)

(assert (=> b!124704 m!144931))

(declare-fun m!144933 () Bool)

(assert (=> b!124704 m!144933))

(declare-fun m!144935 () Bool)

(assert (=> b!124704 m!144935))

(declare-fun m!144937 () Bool)

(assert (=> b!124704 m!144937))

(declare-fun m!144939 () Bool)

(assert (=> b!124704 m!144939))

(declare-fun m!144941 () Bool)

(assert (=> b!124704 m!144941))

(assert (=> b!124704 m!144937))

(assert (=> b!124704 m!144931))

(declare-fun m!144943 () Bool)

(assert (=> b!124704 m!144943))

(assert (=> b!124704 m!144905))

(assert (=> b!124708 m!144905))

(assert (=> b!124708 m!144905))

(declare-fun m!144945 () Bool)

(assert (=> b!124708 m!144945))

(declare-fun m!144947 () Bool)

(assert (=> bm!13268 m!144947))

(declare-fun m!144949 () Bool)

(assert (=> bm!13265 m!144949))

(assert (=> d!37501 m!144811))

(assert (=> b!124709 m!144905))

(assert (=> b!124709 m!144905))

(assert (=> b!124709 m!144945))

(assert (=> b!124544 d!37501))

(declare-fun d!37503 () Bool)

(declare-fun res!60419 () Bool)

(declare-fun e!81534 () Bool)

(assert (=> d!37503 (=> (not res!60419) (not e!81534))))

(declare-fun simpleValid!86 (LongMapFixedSize!1054) Bool)

(assert (=> d!37503 (= res!60419 (simpleValid!86 newMap!16))))

(assert (=> d!37503 (= (valid!515 newMap!16) e!81534)))

(declare-fun b!124727 () Bool)

(declare-fun res!60420 () Bool)

(assert (=> b!124727 (=> (not res!60420) (not e!81534))))

(declare-fun arrayCountValidKeys!0 (array!4667 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!124727 (= res!60420 (= (arrayCountValidKeys!0 (_keys!4492 newMap!16) #b00000000000000000000000000000000 (size!2473 (_keys!4492 newMap!16))) (_size!576 newMap!16)))))

(declare-fun b!124728 () Bool)

(declare-fun res!60421 () Bool)

(assert (=> b!124728 (=> (not res!60421) (not e!81534))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!4667 (_ BitVec 32)) Bool)

(assert (=> b!124728 (= res!60421 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4492 newMap!16) (mask!7009 newMap!16)))))

(declare-fun b!124729 () Bool)

(declare-datatypes ((List!1677 0))(
  ( (Nil!1674) (Cons!1673 (h!2274 (_ BitVec 64)) (t!6004 List!1677)) )
))
(declare-fun arrayNoDuplicates!0 (array!4667 (_ BitVec 32) List!1677) Bool)

(assert (=> b!124729 (= e!81534 (arrayNoDuplicates!0 (_keys!4492 newMap!16) #b00000000000000000000000000000000 Nil!1674))))

(assert (= (and d!37503 res!60419) b!124727))

(assert (= (and b!124727 res!60420) b!124728))

(assert (= (and b!124728 res!60421) b!124729))

(declare-fun m!144951 () Bool)

(assert (=> d!37503 m!144951))

(declare-fun m!144953 () Bool)

(assert (=> b!124727 m!144953))

(declare-fun m!144955 () Bool)

(assert (=> b!124728 m!144955))

(declare-fun m!144957 () Bool)

(assert (=> b!124729 m!144957))

(assert (=> b!124542 d!37503))

(declare-fun d!37505 () Bool)

(assert (=> d!37505 (= (array_inv!1385 (_keys!4492 newMap!16)) (bvsge (size!2473 (_keys!4492 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!124538 d!37505))

(declare-fun d!37507 () Bool)

(assert (=> d!37507 (= (array_inv!1386 (_values!2746 newMap!16)) (bvsge (size!2474 (_values!2746 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!124538 d!37507))

(declare-fun d!37509 () Bool)

(assert (=> d!37509 (= (validMask!0 (mask!7009 (v!3108 (underlying!436 thiss!992)))) (and (or (= (mask!7009 (v!3108 (underlying!436 thiss!992))) #b00000000000000000000000000000111) (= (mask!7009 (v!3108 (underlying!436 thiss!992))) #b00000000000000000000000000001111) (= (mask!7009 (v!3108 (underlying!436 thiss!992))) #b00000000000000000000000000011111) (= (mask!7009 (v!3108 (underlying!436 thiss!992))) #b00000000000000000000000000111111) (= (mask!7009 (v!3108 (underlying!436 thiss!992))) #b00000000000000000000000001111111) (= (mask!7009 (v!3108 (underlying!436 thiss!992))) #b00000000000000000000000011111111) (= (mask!7009 (v!3108 (underlying!436 thiss!992))) #b00000000000000000000000111111111) (= (mask!7009 (v!3108 (underlying!436 thiss!992))) #b00000000000000000000001111111111) (= (mask!7009 (v!3108 (underlying!436 thiss!992))) #b00000000000000000000011111111111) (= (mask!7009 (v!3108 (underlying!436 thiss!992))) #b00000000000000000000111111111111) (= (mask!7009 (v!3108 (underlying!436 thiss!992))) #b00000000000000000001111111111111) (= (mask!7009 (v!3108 (underlying!436 thiss!992))) #b00000000000000000011111111111111) (= (mask!7009 (v!3108 (underlying!436 thiss!992))) #b00000000000000000111111111111111) (= (mask!7009 (v!3108 (underlying!436 thiss!992))) #b00000000000000001111111111111111) (= (mask!7009 (v!3108 (underlying!436 thiss!992))) #b00000000000000011111111111111111) (= (mask!7009 (v!3108 (underlying!436 thiss!992))) #b00000000000000111111111111111111) (= (mask!7009 (v!3108 (underlying!436 thiss!992))) #b00000000000001111111111111111111) (= (mask!7009 (v!3108 (underlying!436 thiss!992))) #b00000000000011111111111111111111) (= (mask!7009 (v!3108 (underlying!436 thiss!992))) #b00000000000111111111111111111111) (= (mask!7009 (v!3108 (underlying!436 thiss!992))) #b00000000001111111111111111111111) (= (mask!7009 (v!3108 (underlying!436 thiss!992))) #b00000000011111111111111111111111) (= (mask!7009 (v!3108 (underlying!436 thiss!992))) #b00000000111111111111111111111111) (= (mask!7009 (v!3108 (underlying!436 thiss!992))) #b00000001111111111111111111111111) (= (mask!7009 (v!3108 (underlying!436 thiss!992))) #b00000011111111111111111111111111) (= (mask!7009 (v!3108 (underlying!436 thiss!992))) #b00000111111111111111111111111111) (= (mask!7009 (v!3108 (underlying!436 thiss!992))) #b00001111111111111111111111111111) (= (mask!7009 (v!3108 (underlying!436 thiss!992))) #b00011111111111111111111111111111) (= (mask!7009 (v!3108 (underlying!436 thiss!992))) #b00111111111111111111111111111111)) (bvsle (mask!7009 (v!3108 (underlying!436 thiss!992))) #b00111111111111111111111111111111)))))

(assert (=> b!124543 d!37509))

(declare-fun d!37511 () Bool)

(declare-fun e!81539 () Bool)

(assert (=> d!37511 e!81539))

(declare-fun res!60424 () Bool)

(assert (=> d!37511 (=> res!60424 e!81539)))

(declare-fun lt!64137 () Bool)

(assert (=> d!37511 (= res!60424 (not lt!64137))))

(declare-fun lt!64140 () Bool)

(assert (=> d!37511 (= lt!64137 lt!64140)))

(declare-fun lt!64139 () Unit!3871)

(declare-fun e!81540 () Unit!3871)

(assert (=> d!37511 (= lt!64139 e!81540)))

(declare-fun c!22682 () Bool)

(assert (=> d!37511 (= c!22682 lt!64140)))

(declare-fun containsKey!170 (List!1676 (_ BitVec 64)) Bool)

(assert (=> d!37511 (= lt!64140 (containsKey!170 (toList!831 lt!64044) (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355)))))

(assert (=> d!37511 (= (contains!861 lt!64044 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355)) lt!64137)))

(declare-fun b!124736 () Bool)

(declare-fun lt!64138 () Unit!3871)

(assert (=> b!124736 (= e!81540 lt!64138)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!118 (List!1676 (_ BitVec 64)) Unit!3871)

(assert (=> b!124736 (= lt!64138 (lemmaContainsKeyImpliesGetValueByKeyDefined!118 (toList!831 lt!64044) (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355)))))

(declare-datatypes ((Option!173 0))(
  ( (Some!172 (v!3114 V!3425)) (None!171) )
))
(declare-fun isDefined!119 (Option!173) Bool)

(declare-fun getValueByKey!167 (List!1676 (_ BitVec 64)) Option!173)

(assert (=> b!124736 (isDefined!119 (getValueByKey!167 (toList!831 lt!64044) (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355)))))

(declare-fun b!124737 () Bool)

(declare-fun Unit!3874 () Unit!3871)

(assert (=> b!124737 (= e!81540 Unit!3874)))

(declare-fun b!124738 () Bool)

(assert (=> b!124738 (= e!81539 (isDefined!119 (getValueByKey!167 (toList!831 lt!64044) (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355))))))

(assert (= (and d!37511 c!22682) b!124736))

(assert (= (and d!37511 (not c!22682)) b!124737))

(assert (= (and d!37511 (not res!60424)) b!124738))

(assert (=> d!37511 m!144797))

(declare-fun m!144959 () Bool)

(assert (=> d!37511 m!144959))

(assert (=> b!124736 m!144797))

(declare-fun m!144961 () Bool)

(assert (=> b!124736 m!144961))

(assert (=> b!124736 m!144797))

(declare-fun m!144963 () Bool)

(assert (=> b!124736 m!144963))

(assert (=> b!124736 m!144963))

(declare-fun m!144965 () Bool)

(assert (=> b!124736 m!144965))

(assert (=> b!124738 m!144797))

(assert (=> b!124738 m!144963))

(assert (=> b!124738 m!144963))

(assert (=> b!124738 m!144965))

(assert (=> b!124537 d!37511))

(declare-fun b!124819 () Bool)

(declare-fun e!81592 () ListLongMap!1631)

(assert (=> b!124819 (= e!81592 (getCurrentListMap!511 (_keys!4492 newMap!16) (_values!2746 newMap!16) (mask!7009 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16)))))

(declare-fun b!124820 () Bool)

(declare-fun e!81595 () Unit!3871)

(declare-fun lt!64197 () Unit!3871)

(assert (=> b!124820 (= e!81595 lt!64197)))

(declare-fun call!13335 () Unit!3871)

(assert (=> b!124820 (= lt!64197 call!13335)))

(declare-datatypes ((SeekEntryResult!263 0))(
  ( (MissingZero!263 (index!3206 (_ BitVec 32))) (Found!263 (index!3207 (_ BitVec 32))) (Intermediate!263 (undefined!1075 Bool) (index!3208 (_ BitVec 32)) (x!14812 (_ BitVec 32))) (Undefined!263) (MissingVacant!263 (index!3209 (_ BitVec 32))) )
))
(declare-fun lt!64220 () SeekEntryResult!263)

(declare-fun call!13345 () SeekEntryResult!263)

(assert (=> b!124820 (= lt!64220 call!13345)))

(declare-fun res!60465 () Bool)

(assert (=> b!124820 (= res!60465 ((_ is Found!263) lt!64220))))

(declare-fun e!81593 () Bool)

(assert (=> b!124820 (=> (not res!60465) (not e!81593))))

(assert (=> b!124820 e!81593))

(declare-fun bm!13320 () Bool)

(declare-fun call!13328 () Bool)

(declare-fun call!13325 () Bool)

(assert (=> bm!13320 (= call!13328 call!13325)))

(declare-fun b!124821 () Bool)

(declare-fun e!81599 () Bool)

(declare-fun e!81587 () Bool)

(assert (=> b!124821 (= e!81599 e!81587)))

(declare-fun res!60453 () Bool)

(declare-fun call!13323 () Bool)

(assert (=> b!124821 (= res!60453 call!13323)))

(assert (=> b!124821 (=> (not res!60453) (not e!81587))))

(declare-fun bm!13321 () Bool)

(declare-fun call!13337 () Bool)

(declare-fun call!13324 () Bool)

(assert (=> bm!13321 (= call!13337 call!13324)))

(declare-fun b!124822 () Bool)

(declare-fun e!81584 () Bool)

(declare-fun e!81602 () Bool)

(assert (=> b!124822 (= e!81584 e!81602)))

(declare-fun call!13342 () ListLongMap!1631)

(declare-fun res!60462 () Bool)

(assert (=> b!124822 (= res!60462 (contains!861 call!13342 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355)))))

(assert (=> b!124822 (=> (not res!60462) (not e!81602))))

(declare-fun b!124823 () Bool)

(declare-fun res!60456 () Bool)

(declare-fun e!81583 () Bool)

(assert (=> b!124823 (=> (not res!60456) (not e!81583))))

(assert (=> b!124823 (= res!60456 call!13323)))

(declare-fun e!81588 () Bool)

(assert (=> b!124823 (= e!81588 e!81583)))

(declare-fun b!124824 () Bool)

(declare-fun e!81603 () Bool)

(declare-fun call!13341 () Bool)

(assert (=> b!124824 (= e!81603 (not call!13341))))

(declare-fun b!124825 () Bool)

(declare-fun e!81598 () Bool)

(assert (=> b!124825 (= e!81598 (not call!13341))))

(declare-fun bm!13322 () Bool)

(declare-fun call!13343 () Unit!3871)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!55 (array!4667 array!4669 (_ BitVec 32) (_ BitVec 32) V!3425 V!3425 (_ BitVec 64) Int) Unit!3871)

(assert (=> bm!13322 (= call!13343 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!55 (_keys!4492 newMap!16) (_values!2746 newMap!16) (mask!7009 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355) (defaultEntry!2763 newMap!16)))))

(declare-fun b!124826 () Bool)

(declare-fun call!13340 () Bool)

(assert (=> b!124826 (= e!81583 (not call!13340))))

(declare-fun bm!13323 () Bool)

(declare-fun call!13346 () ListLongMap!1631)

(declare-fun call!13339 () ListLongMap!1631)

(assert (=> bm!13323 (= call!13346 call!13339)))

(declare-fun b!124827 () Bool)

(declare-fun c!22713 () Bool)

(declare-fun lt!64214 () SeekEntryResult!263)

(assert (=> b!124827 (= c!22713 ((_ is MissingVacant!263) lt!64214))))

(declare-fun e!81586 () tuple2!2522)

(declare-fun e!81600 () tuple2!2522)

(assert (=> b!124827 (= e!81586 e!81600)))

(declare-fun bm!13324 () Bool)

(assert (=> bm!13324 (= call!13323 call!13328)))

(declare-fun b!124828 () Bool)

(declare-fun e!81585 () tuple2!2522)

(assert (=> b!124828 (= e!81600 e!81585)))

(declare-fun c!22711 () Bool)

(assert (=> b!124828 (= c!22711 ((_ is MissingZero!263) lt!64214))))

(declare-fun b!124829 () Bool)

(declare-fun res!60457 () Bool)

(declare-fun lt!64199 () SeekEntryResult!263)

(assert (=> b!124829 (= res!60457 (= (select (arr!2210 (_keys!4492 newMap!16)) (index!3209 lt!64199)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!124829 (=> (not res!60457) (not e!81598))))

(declare-fun bm!13325 () Bool)

(declare-fun call!13336 () Bool)

(assert (=> bm!13325 (= call!13341 call!13336)))

(declare-fun bm!13326 () Bool)

(declare-fun call!13331 () SeekEntryResult!263)

(assert (=> bm!13326 (= call!13345 call!13331)))

(declare-fun b!124830 () Bool)

(declare-fun e!81596 () Bool)

(declare-fun lt!64207 () SeekEntryResult!263)

(assert (=> b!124830 (= e!81596 (= (select (arr!2210 (_keys!4492 newMap!16)) (index!3207 lt!64207)) (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355)))))

(declare-fun b!124831 () Bool)

(declare-fun e!81594 () Unit!3871)

(declare-fun Unit!3875 () Unit!3871)

(assert (=> b!124831 (= e!81594 Unit!3875)))

(declare-fun lt!64221 () Unit!3871)

(assert (=> b!124831 (= lt!64221 call!13335)))

(declare-fun call!13333 () SeekEntryResult!263)

(assert (=> b!124831 (= lt!64207 call!13333)))

(declare-fun res!60463 () Bool)

(assert (=> b!124831 (= res!60463 ((_ is Found!263) lt!64207))))

(assert (=> b!124831 (=> (not res!60463) (not e!81596))))

(assert (=> b!124831 e!81596))

(declare-fun lt!64196 () Unit!3871)

(assert (=> b!124831 (= lt!64196 lt!64221)))

(assert (=> b!124831 false))

(declare-fun b!124832 () Bool)

(declare-fun lt!64203 () tuple2!2522)

(assert (=> b!124832 (= e!81600 (tuple2!2523 (_1!1272 lt!64203) (_2!1272 lt!64203)))))

(declare-fun call!13332 () tuple2!2522)

(assert (=> b!124832 (= lt!64203 call!13332)))

(declare-fun bm!13327 () Bool)

(assert (=> bm!13327 (= call!13324 call!13325)))

(declare-fun c!22709 () Bool)

(declare-fun c!22721 () Bool)

(declare-fun c!22718 () Bool)

(declare-fun lt!64216 () SeekEntryResult!263)

(declare-fun c!22712 () Bool)

(declare-fun bm!13328 () Bool)

(declare-fun c!22719 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!13328 (= call!13325 (inRange!0 (ite c!22712 (ite c!22709 (index!3207 lt!64207) (ite c!22719 (index!3206 lt!64216) (index!3209 lt!64216))) (ite c!22721 (index!3207 lt!64220) (ite c!22718 (index!3206 lt!64199) (index!3209 lt!64199)))) (mask!7009 newMap!16)))))

(declare-fun b!124833 () Bool)

(declare-fun res!60458 () Bool)

(assert (=> b!124833 (=> (not res!60458) (not e!81583))))

(assert (=> b!124833 (= res!60458 (= (select (arr!2210 (_keys!4492 newMap!16)) (index!3206 lt!64216)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!13329 () Bool)

(declare-fun lt!64219 () tuple2!2522)

(assert (=> bm!13329 (= call!13342 (map!1377 (_2!1272 lt!64219)))))

(declare-fun bm!13330 () Bool)

(declare-fun call!13344 () ListLongMap!1631)

(declare-fun call!13329 () ListLongMap!1631)

(assert (=> bm!13330 (= call!13344 call!13329)))

(declare-fun b!124834 () Bool)

(declare-fun lt!64212 () tuple2!2522)

(assert (=> b!124834 (= lt!64212 call!13332)))

(assert (=> b!124834 (= e!81585 (tuple2!2523 (_1!1272 lt!64212) (_2!1272 lt!64212)))))

(declare-fun b!124835 () Bool)

(declare-fun lt!64213 () Unit!3871)

(declare-fun lt!64206 () Unit!3871)

(assert (=> b!124835 (= lt!64213 lt!64206)))

(declare-fun call!13326 () ListLongMap!1631)

(assert (=> b!124835 (= call!13326 call!13346)))

(declare-fun lt!64209 () (_ BitVec 32))

(declare-fun lemmaChangeZeroKeyThenAddPairToListMap!55 (array!4667 array!4669 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3425 V!3425 V!3425 Int) Unit!3871)

(assert (=> b!124835 (= lt!64206 (lemmaChangeZeroKeyThenAddPairToListMap!55 (_keys!4492 newMap!16) (_values!2746 newMap!16) (mask!7009 newMap!16) (extraKeys!2548 newMap!16) lt!64209 (zeroValue!2628 newMap!16) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2628 newMap!16) (defaultEntry!2763 newMap!16)))))

(assert (=> b!124835 (= lt!64209 (bvor (extraKeys!2548 newMap!16) #b00000000000000000000000000000001))))

(declare-fun e!81597 () tuple2!2522)

(assert (=> b!124835 (= e!81597 (tuple2!2523 true (LongMapFixedSize!1055 (defaultEntry!2763 newMap!16) (mask!7009 newMap!16) (bvor (extraKeys!2548 newMap!16) #b00000000000000000000000000000001) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2628 newMap!16) (_size!576 newMap!16) (_keys!4492 newMap!16) (_values!2746 newMap!16) (_vacant!576 newMap!16))))))

(declare-fun bm!13331 () Bool)

(assert (=> bm!13331 (= call!13333 call!13331)))

(declare-fun b!124836 () Bool)

(assert (=> b!124836 (= e!81587 (not call!13340))))

(declare-fun b!124837 () Bool)

(assert (=> b!124837 (= e!81592 call!13344)))

(declare-fun b!124838 () Bool)

(declare-fun c!22714 () Bool)

(assert (=> b!124838 (= c!22714 ((_ is MissingVacant!263) lt!64216))))

(assert (=> b!124838 (= e!81588 e!81599)))

(declare-fun b!124839 () Bool)

(declare-fun call!13334 () ListLongMap!1631)

(assert (=> b!124839 (= e!81602 (= call!13342 (+!163 call!13334 (tuple2!2521 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!124840 () Bool)

(declare-fun res!60464 () Bool)

(assert (=> b!124840 (=> (not res!60464) (not e!81603))))

(assert (=> b!124840 (= res!60464 call!13337)))

(declare-fun e!81601 () Bool)

(assert (=> b!124840 (= e!81601 e!81603)))

(declare-fun b!124841 () Bool)

(declare-fun Unit!3876 () Unit!3871)

(assert (=> b!124841 (= e!81595 Unit!3876)))

(declare-fun lt!64210 () Unit!3871)

(assert (=> b!124841 (= lt!64210 call!13343)))

(assert (=> b!124841 (= lt!64199 call!13345)))

(assert (=> b!124841 (= c!22718 ((_ is MissingZero!263) lt!64199))))

(assert (=> b!124841 e!81601))

(declare-fun lt!64218 () Unit!3871)

(assert (=> b!124841 (= lt!64218 lt!64210)))

(assert (=> b!124841 false))

(declare-fun b!124842 () Bool)

(declare-fun res!60466 () Bool)

(assert (=> b!124842 (= res!60466 (= (select (arr!2210 (_keys!4492 newMap!16)) (index!3209 lt!64216)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!124842 (=> (not res!60466) (not e!81587))))

(declare-fun bm!13332 () Bool)

(assert (=> bm!13332 (= call!13340 call!13336)))

(declare-fun b!124843 () Bool)

(declare-fun res!60454 () Bool)

(assert (=> b!124843 (=> (not res!60454) (not e!81603))))

(assert (=> b!124843 (= res!60454 (= (select (arr!2210 (_keys!4492 newMap!16)) (index!3206 lt!64199)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!13333 () Bool)

(declare-fun c!22717 () Bool)

(assert (=> bm!13333 (= call!13329 (getCurrentListMap!511 (_keys!4492 newMap!16) (ite c!22717 (_values!2746 newMap!16) (array!4670 (store (arr!2211 (_values!2746 newMap!16)) (index!3207 lt!64214) (ValueCellFull!1073 (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2474 (_values!2746 newMap!16)))) (mask!7009 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16)))))

(declare-fun bm!13334 () Bool)

(declare-fun arrayContainsKey!0 (array!4667 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!13334 (= call!13336 (arrayContainsKey!0 (_keys!4492 newMap!16) (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun call!13327 () Bool)

(declare-fun call!13330 () ListLongMap!1631)

(declare-fun bm!13335 () Bool)

(assert (=> bm!13335 (= call!13327 (contains!861 call!13330 (ite c!22712 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355) (select (arr!2210 (_keys!4492 newMap!16)) (index!3207 lt!64214)))))))

(declare-fun b!124844 () Bool)

(declare-fun e!81591 () tuple2!2522)

(assert (=> b!124844 (= e!81591 e!81586)))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!4667 (_ BitVec 32)) SeekEntryResult!263)

(assert (=> b!124844 (= lt!64214 (seekEntryOrOpen!0 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355) (_keys!4492 newMap!16) (mask!7009 newMap!16)))))

(assert (=> b!124844 (= c!22712 ((_ is Undefined!263) lt!64214))))

(declare-fun b!124845 () Bool)

(assert (=> b!124845 (= e!81584 (= call!13342 call!13334))))

(declare-fun b!124846 () Bool)

(declare-fun res!60461 () Bool)

(assert (=> b!124846 (= res!60461 call!13328)))

(assert (=> b!124846 (=> (not res!60461) (not e!81596))))

(declare-fun bm!13336 () Bool)

(declare-fun updateHelperNewKey!55 (LongMapFixedSize!1054 (_ BitVec 64) V!3425 (_ BitVec 32)) tuple2!2522)

(assert (=> bm!13336 (= call!13332 (updateHelperNewKey!55 newMap!16 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (ite c!22713 (index!3209 lt!64214) (index!3206 lt!64214))))))

(declare-fun b!124847 () Bool)

(declare-fun e!81589 () Bool)

(assert (=> b!124847 (= e!81589 e!81584)))

(declare-fun c!22720 () Bool)

(assert (=> b!124847 (= c!22720 (_1!1272 lt!64219))))

(declare-fun b!124848 () Bool)

(declare-fun lt!64202 () Unit!3871)

(declare-fun lt!64204 () Unit!3871)

(assert (=> b!124848 (= lt!64202 lt!64204)))

(assert (=> b!124848 call!13327))

(declare-fun lt!64198 () array!4669)

(declare-fun lemmaValidKeyInArrayIsInListMap!115 (array!4667 array!4669 (_ BitVec 32) (_ BitVec 32) V!3425 V!3425 (_ BitVec 32) Int) Unit!3871)

(assert (=> b!124848 (= lt!64204 (lemmaValidKeyInArrayIsInListMap!115 (_keys!4492 newMap!16) lt!64198 (mask!7009 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) (index!3207 lt!64214) (defaultEntry!2763 newMap!16)))))

(assert (=> b!124848 (= lt!64198 (array!4670 (store (arr!2211 (_values!2746 newMap!16)) (index!3207 lt!64214) (ValueCellFull!1073 (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2474 (_values!2746 newMap!16))))))

(declare-fun lt!64215 () Unit!3871)

(declare-fun lt!64208 () Unit!3871)

(assert (=> b!124848 (= lt!64215 lt!64208)))

(declare-fun call!13338 () ListLongMap!1631)

(assert (=> b!124848 (= call!13338 call!13329)))

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!55 (array!4667 array!4669 (_ BitVec 32) (_ BitVec 32) V!3425 V!3425 (_ BitVec 32) (_ BitVec 64) V!3425 Int) Unit!3871)

(assert (=> b!124848 (= lt!64208 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!55 (_keys!4492 newMap!16) (_values!2746 newMap!16) (mask!7009 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) (index!3207 lt!64214) (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2763 newMap!16)))))

(declare-fun lt!64201 () Unit!3871)

(assert (=> b!124848 (= lt!64201 e!81595)))

(assert (=> b!124848 (= c!22721 (contains!861 (getCurrentListMap!511 (_keys!4492 newMap!16) (_values!2746 newMap!16) (mask!7009 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16)) (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355)))))

(assert (=> b!124848 (= e!81585 (tuple2!2523 true (LongMapFixedSize!1055 (defaultEntry!2763 newMap!16) (mask!7009 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) (_size!576 newMap!16) (_keys!4492 newMap!16) (array!4670 (store (arr!2211 (_values!2746 newMap!16)) (index!3207 lt!64214) (ValueCellFull!1073 (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2474 (_values!2746 newMap!16))) (_vacant!576 newMap!16))))))

(declare-fun b!124849 () Bool)

(declare-fun lt!64217 () Unit!3871)

(declare-fun lt!64211 () Unit!3871)

(assert (=> b!124849 (= lt!64217 lt!64211)))

(assert (=> b!124849 (= call!13326 call!13346)))

(declare-fun lt!64205 () (_ BitVec 32))

(declare-fun lemmaChangeLongMinValueKeyThenAddPairToListMap!55 (array!4667 array!4669 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3425 V!3425 V!3425 Int) Unit!3871)

(assert (=> b!124849 (= lt!64211 (lemmaChangeLongMinValueKeyThenAddPairToListMap!55 (_keys!4492 newMap!16) (_values!2746 newMap!16) (mask!7009 newMap!16) (extraKeys!2548 newMap!16) lt!64205 (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2763 newMap!16)))))

(assert (=> b!124849 (= lt!64205 (bvor (extraKeys!2548 newMap!16) #b00000000000000000000000000000010))))

(assert (=> b!124849 (= e!81597 (tuple2!2523 true (LongMapFixedSize!1055 (defaultEntry!2763 newMap!16) (mask!7009 newMap!16) (bvor (extraKeys!2548 newMap!16) #b00000000000000000000000000000010) (zeroValue!2628 newMap!16) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (_size!576 newMap!16) (_keys!4492 newMap!16) (_values!2746 newMap!16) (_vacant!576 newMap!16))))))

(declare-fun bm!13337 () Bool)

(assert (=> bm!13337 (= call!13330 call!13339)))

(declare-fun bm!13338 () Bool)

(assert (=> bm!13338 (= call!13326 call!13338)))

(declare-fun b!124850 () Bool)

(declare-fun lt!64195 () Unit!3871)

(assert (=> b!124850 (= e!81594 lt!64195)))

(assert (=> b!124850 (= lt!64195 call!13343)))

(assert (=> b!124850 (= lt!64216 call!13333)))

(assert (=> b!124850 (= c!22719 ((_ is MissingZero!263) lt!64216))))

(assert (=> b!124850 e!81588))

(declare-fun bm!13339 () Bool)

(assert (=> bm!13339 (= call!13331 (seekEntryOrOpen!0 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355) (_keys!4492 newMap!16) (mask!7009 newMap!16)))))

(declare-fun b!124851 () Bool)

(declare-fun e!81590 () Bool)

(assert (=> b!124851 (= e!81590 ((_ is Undefined!263) lt!64199))))

(declare-fun d!37513 () Bool)

(assert (=> d!37513 e!81589))

(declare-fun res!60455 () Bool)

(assert (=> d!37513 (=> (not res!60455) (not e!81589))))

(assert (=> d!37513 (= res!60455 (valid!515 (_2!1272 lt!64219)))))

(assert (=> d!37513 (= lt!64219 e!81591)))

(assert (=> d!37513 (= c!22717 (= (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355) (bvneg (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355))))))

(assert (=> d!37513 (valid!515 newMap!16)))

(assert (=> d!37513 (= (update!185 newMap!16 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) lt!64219)))

(declare-fun b!124852 () Bool)

(assert (=> b!124852 (= e!81591 e!81597)))

(declare-fun c!22710 () Bool)

(assert (=> b!124852 (= c!22710 (= (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!124853 () Bool)

(assert (=> b!124853 (= e!81590 e!81598)))

(declare-fun res!60460 () Bool)

(assert (=> b!124853 (= res!60460 call!13337)))

(assert (=> b!124853 (=> (not res!60460) (not e!81598))))

(declare-fun b!124854 () Bool)

(assert (=> b!124854 (= e!81593 (= (select (arr!2210 (_keys!4492 newMap!16)) (index!3207 lt!64220)) (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355)))))

(declare-fun bm!13340 () Bool)

(assert (=> bm!13340 (= call!13338 (+!163 e!81592 (ite c!22717 (ite c!22710 (tuple2!2521 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2521 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun c!22715 () Bool)

(assert (=> bm!13340 (= c!22715 c!22717)))

(declare-fun b!124855 () Bool)

(declare-fun lt!64200 () Unit!3871)

(assert (=> b!124855 (= lt!64200 e!81594)))

(assert (=> b!124855 (= c!22709 call!13327)))

(assert (=> b!124855 (= e!81586 (tuple2!2523 false newMap!16))))

(declare-fun bm!13341 () Bool)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!55 (array!4667 array!4669 (_ BitVec 32) (_ BitVec 32) V!3425 V!3425 (_ BitVec 64) Int) Unit!3871)

(assert (=> bm!13341 (= call!13335 (lemmaInListMapThenSeekEntryOrOpenFindsIt!55 (_keys!4492 newMap!16) (_values!2746 newMap!16) (mask!7009 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355) (defaultEntry!2763 newMap!16)))))

(declare-fun b!124856 () Bool)

(assert (=> b!124856 (= e!81599 ((_ is Undefined!263) lt!64216))))

(declare-fun b!124857 () Bool)

(declare-fun c!22716 () Bool)

(assert (=> b!124857 (= c!22716 ((_ is MissingVacant!263) lt!64199))))

(assert (=> b!124857 (= e!81601 e!81590)))

(declare-fun bm!13342 () Bool)

(assert (=> bm!13342 (= call!13334 (map!1377 newMap!16))))

(declare-fun b!124858 () Bool)

(declare-fun res!60459 () Bool)

(assert (=> b!124858 (= res!60459 call!13324)))

(assert (=> b!124858 (=> (not res!60459) (not e!81593))))

(declare-fun bm!13343 () Bool)

(assert (=> bm!13343 (= call!13339 (getCurrentListMap!511 (_keys!4492 newMap!16) (ite (or c!22717 c!22712) (_values!2746 newMap!16) lt!64198) (mask!7009 newMap!16) (ite c!22717 (ite c!22710 lt!64209 lt!64205) (extraKeys!2548 newMap!16)) (ite (and c!22717 c!22710) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2628 newMap!16)) (ite c!22717 (ite c!22710 (minValue!2628 newMap!16) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2628 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16)))))

(assert (= (and d!37513 c!22717) b!124852))

(assert (= (and d!37513 (not c!22717)) b!124844))

(assert (= (and b!124852 c!22710) b!124835))

(assert (= (and b!124852 (not c!22710)) b!124849))

(assert (= (or b!124835 b!124849) bm!13323))

(assert (= (or b!124835 b!124849) bm!13330))

(assert (= (or b!124835 b!124849) bm!13338))

(assert (= (and b!124844 c!22712) b!124855))

(assert (= (and b!124844 (not c!22712)) b!124827))

(assert (= (and b!124855 c!22709) b!124831))

(assert (= (and b!124855 (not c!22709)) b!124850))

(assert (= (and b!124831 res!60463) b!124846))

(assert (= (and b!124846 res!60461) b!124830))

(assert (= (and b!124850 c!22719) b!124823))

(assert (= (and b!124850 (not c!22719)) b!124838))

(assert (= (and b!124823 res!60456) b!124833))

(assert (= (and b!124833 res!60458) b!124826))

(assert (= (and b!124838 c!22714) b!124821))

(assert (= (and b!124838 (not c!22714)) b!124856))

(assert (= (and b!124821 res!60453) b!124842))

(assert (= (and b!124842 res!60466) b!124836))

(assert (= (or b!124823 b!124821) bm!13324))

(assert (= (or b!124826 b!124836) bm!13332))

(assert (= (or b!124846 bm!13324) bm!13320))

(assert (= (or b!124831 b!124850) bm!13331))

(assert (= (and b!124827 c!22713) b!124832))

(assert (= (and b!124827 (not c!22713)) b!124828))

(assert (= (and b!124828 c!22711) b!124834))

(assert (= (and b!124828 (not c!22711)) b!124848))

(assert (= (and b!124848 c!22721) b!124820))

(assert (= (and b!124848 (not c!22721)) b!124841))

(assert (= (and b!124820 res!60465) b!124858))

(assert (= (and b!124858 res!60459) b!124854))

(assert (= (and b!124841 c!22718) b!124840))

(assert (= (and b!124841 (not c!22718)) b!124857))

(assert (= (and b!124840 res!60464) b!124843))

(assert (= (and b!124843 res!60454) b!124824))

(assert (= (and b!124857 c!22716) b!124853))

(assert (= (and b!124857 (not c!22716)) b!124851))

(assert (= (and b!124853 res!60460) b!124829))

(assert (= (and b!124829 res!60457) b!124825))

(assert (= (or b!124840 b!124853) bm!13321))

(assert (= (or b!124824 b!124825) bm!13325))

(assert (= (or b!124858 bm!13321) bm!13327))

(assert (= (or b!124820 b!124841) bm!13326))

(assert (= (or b!124832 b!124834) bm!13336))

(assert (= (or b!124855 b!124848) bm!13337))

(assert (= (or bm!13332 bm!13325) bm!13334))

(assert (= (or b!124831 b!124820) bm!13341))

(assert (= (or b!124850 b!124841) bm!13322))

(assert (= (or bm!13331 bm!13326) bm!13339))

(assert (= (or bm!13320 bm!13327) bm!13328))

(assert (= (or b!124855 b!124848) bm!13335))

(assert (= (or bm!13323 bm!13337) bm!13343))

(assert (= (or bm!13330 b!124848) bm!13333))

(assert (= (or bm!13338 b!124848) bm!13340))

(assert (= (and bm!13340 c!22715) b!124837))

(assert (= (and bm!13340 (not c!22715)) b!124819))

(assert (= (and d!37513 res!60455) b!124847))

(assert (= (and b!124847 c!22720) b!124822))

(assert (= (and b!124847 (not c!22720)) b!124845))

(assert (= (and b!124822 res!60462) b!124839))

(assert (= (or b!124839 b!124845) bm!13342))

(assert (= (or b!124822 b!124839 b!124845) bm!13329))

(assert (=> b!124849 m!144795))

(declare-fun m!144967 () Bool)

(assert (=> b!124849 m!144967))

(declare-fun m!144969 () Bool)

(assert (=> b!124854 m!144969))

(declare-fun m!144971 () Bool)

(assert (=> b!124839 m!144971))

(declare-fun m!144973 () Bool)

(assert (=> d!37513 m!144973))

(assert (=> d!37513 m!144809))

(declare-fun m!144975 () Bool)

(assert (=> b!124833 m!144975))

(assert (=> b!124844 m!144797))

(declare-fun m!144977 () Bool)

(assert (=> b!124844 m!144977))

(declare-fun m!144979 () Bool)

(assert (=> b!124829 m!144979))

(declare-fun m!144981 () Bool)

(assert (=> bm!13329 m!144981))

(declare-fun m!144983 () Bool)

(assert (=> b!124848 m!144983))

(assert (=> b!124848 m!144893))

(assert (=> b!124848 m!144893))

(assert (=> b!124848 m!144797))

(declare-fun m!144985 () Bool)

(assert (=> b!124848 m!144985))

(assert (=> b!124848 m!144797))

(assert (=> b!124848 m!144795))

(declare-fun m!144987 () Bool)

(assert (=> b!124848 m!144987))

(declare-fun m!144989 () Bool)

(assert (=> b!124848 m!144989))

(assert (=> bm!13341 m!144797))

(declare-fun m!144991 () Bool)

(assert (=> bm!13341 m!144991))

(assert (=> b!124819 m!144893))

(declare-fun m!144993 () Bool)

(assert (=> bm!13335 m!144993))

(declare-fun m!144995 () Bool)

(assert (=> bm!13335 m!144995))

(declare-fun m!144997 () Bool)

(assert (=> b!124843 m!144997))

(assert (=> bm!13339 m!144797))

(assert (=> bm!13339 m!144977))

(assert (=> b!124835 m!144795))

(declare-fun m!144999 () Bool)

(assert (=> b!124835 m!144999))

(declare-fun m!145001 () Bool)

(assert (=> bm!13343 m!145001))

(assert (=> bm!13334 m!144797))

(declare-fun m!145003 () Bool)

(assert (=> bm!13334 m!145003))

(assert (=> bm!13342 m!144819))

(assert (=> b!124822 m!144797))

(declare-fun m!145005 () Bool)

(assert (=> b!124822 m!145005))

(assert (=> bm!13322 m!144797))

(declare-fun m!145007 () Bool)

(assert (=> bm!13322 m!145007))

(declare-fun m!145009 () Bool)

(assert (=> b!124830 m!145009))

(assert (=> bm!13336 m!144797))

(assert (=> bm!13336 m!144795))

(declare-fun m!145011 () Bool)

(assert (=> bm!13336 m!145011))

(assert (=> bm!13333 m!144983))

(declare-fun m!145013 () Bool)

(assert (=> bm!13333 m!145013))

(declare-fun m!145015 () Bool)

(assert (=> bm!13340 m!145015))

(declare-fun m!145017 () Bool)

(assert (=> b!124842 m!145017))

(declare-fun m!145019 () Bool)

(assert (=> bm!13328 m!145019))

(assert (=> b!124537 d!37513))

(declare-fun d!37515 () Bool)

(declare-fun c!22724 () Bool)

(assert (=> d!37515 (= c!22724 ((_ is ValueCellFull!1073) (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355)))))

(declare-fun e!81606 () V!3425)

(assert (=> d!37515 (= (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) e!81606)))

(declare-fun b!124863 () Bool)

(declare-fun get!1447 (ValueCell!1073 V!3425) V!3425)

(assert (=> b!124863 (= e!81606 (get!1447 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!124864 () Bool)

(declare-fun get!1448 (ValueCell!1073 V!3425) V!3425)

(assert (=> b!124864 (= e!81606 (get!1448 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!37515 c!22724) b!124863))

(assert (= (and d!37515 (not c!22724)) b!124864))

(assert (=> b!124863 m!144791))

(assert (=> b!124863 m!144793))

(declare-fun m!145021 () Bool)

(assert (=> b!124863 m!145021))

(assert (=> b!124864 m!144791))

(assert (=> b!124864 m!144793))

(declare-fun m!145023 () Bool)

(assert (=> b!124864 m!145023))

(assert (=> b!124537 d!37515))

(declare-fun mapNonEmpty!4483 () Bool)

(declare-fun mapRes!4483 () Bool)

(declare-fun tp!10927 () Bool)

(declare-fun e!81611 () Bool)

(assert (=> mapNonEmpty!4483 (= mapRes!4483 (and tp!10927 e!81611))))

(declare-fun mapValue!4483 () ValueCell!1073)

(declare-fun mapRest!4483 () (Array (_ BitVec 32) ValueCell!1073))

(declare-fun mapKey!4483 () (_ BitVec 32))

(assert (=> mapNonEmpty!4483 (= mapRest!4467 (store mapRest!4483 mapKey!4483 mapValue!4483))))

(declare-fun condMapEmpty!4483 () Bool)

(declare-fun mapDefault!4483 () ValueCell!1073)

(assert (=> mapNonEmpty!4468 (= condMapEmpty!4483 (= mapRest!4467 ((as const (Array (_ BitVec 32) ValueCell!1073)) mapDefault!4483)))))

(declare-fun e!81612 () Bool)

(assert (=> mapNonEmpty!4468 (= tp!10898 (and e!81612 mapRes!4483))))

(declare-fun b!124871 () Bool)

(assert (=> b!124871 (= e!81611 tp_is_empty!2833)))

(declare-fun mapIsEmpty!4483 () Bool)

(assert (=> mapIsEmpty!4483 mapRes!4483))

(declare-fun b!124872 () Bool)

(assert (=> b!124872 (= e!81612 tp_is_empty!2833)))

(assert (= (and mapNonEmpty!4468 condMapEmpty!4483) mapIsEmpty!4483))

(assert (= (and mapNonEmpty!4468 (not condMapEmpty!4483)) mapNonEmpty!4483))

(assert (= (and mapNonEmpty!4483 ((_ is ValueCellFull!1073) mapValue!4483)) b!124871))

(assert (= (and mapNonEmpty!4468 ((_ is ValueCellFull!1073) mapDefault!4483)) b!124872))

(declare-fun m!145025 () Bool)

(assert (=> mapNonEmpty!4483 m!145025))

(declare-fun mapNonEmpty!4484 () Bool)

(declare-fun mapRes!4484 () Bool)

(declare-fun tp!10928 () Bool)

(declare-fun e!81613 () Bool)

(assert (=> mapNonEmpty!4484 (= mapRes!4484 (and tp!10928 e!81613))))

(declare-fun mapRest!4484 () (Array (_ BitVec 32) ValueCell!1073))

(declare-fun mapKey!4484 () (_ BitVec 32))

(declare-fun mapValue!4484 () ValueCell!1073)

(assert (=> mapNonEmpty!4484 (= mapRest!4468 (store mapRest!4484 mapKey!4484 mapValue!4484))))

(declare-fun condMapEmpty!4484 () Bool)

(declare-fun mapDefault!4484 () ValueCell!1073)

(assert (=> mapNonEmpty!4467 (= condMapEmpty!4484 (= mapRest!4468 ((as const (Array (_ BitVec 32) ValueCell!1073)) mapDefault!4484)))))

(declare-fun e!81614 () Bool)

(assert (=> mapNonEmpty!4467 (= tp!10899 (and e!81614 mapRes!4484))))

(declare-fun b!124873 () Bool)

(assert (=> b!124873 (= e!81613 tp_is_empty!2833)))

(declare-fun mapIsEmpty!4484 () Bool)

(assert (=> mapIsEmpty!4484 mapRes!4484))

(declare-fun b!124874 () Bool)

(assert (=> b!124874 (= e!81614 tp_is_empty!2833)))

(assert (= (and mapNonEmpty!4467 condMapEmpty!4484) mapIsEmpty!4484))

(assert (= (and mapNonEmpty!4467 (not condMapEmpty!4484)) mapNonEmpty!4484))

(assert (= (and mapNonEmpty!4484 ((_ is ValueCellFull!1073) mapValue!4484)) b!124873))

(assert (= (and mapNonEmpty!4467 ((_ is ValueCellFull!1073) mapDefault!4484)) b!124874))

(declare-fun m!145027 () Bool)

(assert (=> mapNonEmpty!4484 m!145027))

(declare-fun b_lambda!5485 () Bool)

(assert (= b_lambda!5483 (or (and b!124545 b_free!2833) (and b!124538 b_free!2835 (= (defaultEntry!2763 newMap!16) (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))))) b_lambda!5485)))

(check-sat (not b!124708) (not b!124844) (not b!124729) (not b!124849) (not bm!13269) b_and!7673 (not b!124712) (not b!124839) (not bm!13339) (not d!37513) (not bm!13336) (not bm!13340) (not bm!13334) (not b!124704) (not d!37499) (not b!124848) (not bm!13329) (not bm!13342) (not b!124718) (not d!37497) (not bm!13343) (not mapNonEmpty!4484) (not b!124822) (not b!124711) (not b!124738) (not b!124728) (not bm!13333) (not b_next!2833) b_and!7675 tp_is_empty!2833 (not b_next!2835) (not b!124835) (not b_lambda!5481) (not b!124736) (not bm!13265) (not d!37501) (not bm!13268) (not b!124709) (not mapNonEmpty!4483) (not d!37503) (not b!124863) (not b_lambda!5485) (not b!124702) (not bm!13335) (not b!124710) (not b!124727) (not bm!13341) (not b!124819) (not b!124864) (not bm!13322) (not d!37511) (not bm!13270) (not bm!13328))
(check-sat b_and!7673 b_and!7675 (not b_next!2833) (not b_next!2835))
(get-model)

(declare-fun d!37517 () Bool)

(assert (=> d!37517 (= (get!1448 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!124864 d!37517))

(declare-fun d!37519 () Bool)

(declare-fun isEmpty!399 (Option!173) Bool)

(assert (=> d!37519 (= (isDefined!119 (getValueByKey!167 (toList!831 lt!64044) (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355))) (not (isEmpty!399 (getValueByKey!167 (toList!831 lt!64044) (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355)))))))

(declare-fun bs!5169 () Bool)

(assert (= bs!5169 d!37519))

(assert (=> bs!5169 m!144963))

(declare-fun m!145029 () Bool)

(assert (=> bs!5169 m!145029))

(assert (=> b!124738 d!37519))

(declare-fun b!124884 () Bool)

(declare-fun e!81619 () Option!173)

(declare-fun e!81620 () Option!173)

(assert (=> b!124884 (= e!81619 e!81620)))

(declare-fun c!22730 () Bool)

(assert (=> b!124884 (= c!22730 (and ((_ is Cons!1672) (toList!831 lt!64044)) (not (= (_1!1271 (h!2273 (toList!831 lt!64044))) (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355)))))))

(declare-fun b!124885 () Bool)

(assert (=> b!124885 (= e!81620 (getValueByKey!167 (t!5995 (toList!831 lt!64044)) (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355)))))

(declare-fun d!37521 () Bool)

(declare-fun c!22729 () Bool)

(assert (=> d!37521 (= c!22729 (and ((_ is Cons!1672) (toList!831 lt!64044)) (= (_1!1271 (h!2273 (toList!831 lt!64044))) (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355))))))

(assert (=> d!37521 (= (getValueByKey!167 (toList!831 lt!64044) (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355)) e!81619)))

(declare-fun b!124886 () Bool)

(assert (=> b!124886 (= e!81620 None!171)))

(declare-fun b!124883 () Bool)

(assert (=> b!124883 (= e!81619 (Some!172 (_2!1271 (h!2273 (toList!831 lt!64044)))))))

(assert (= (and d!37521 c!22729) b!124883))

(assert (= (and d!37521 (not c!22729)) b!124884))

(assert (= (and b!124884 c!22730) b!124885))

(assert (= (and b!124884 (not c!22730)) b!124886))

(assert (=> b!124885 m!144797))

(declare-fun m!145031 () Bool)

(assert (=> b!124885 m!145031))

(assert (=> b!124738 d!37521))

(declare-fun d!37523 () Bool)

(declare-fun e!81623 () Bool)

(assert (=> d!37523 e!81623))

(declare-fun res!60471 () Bool)

(assert (=> d!37523 (=> (not res!60471) (not e!81623))))

(declare-fun lt!64231 () ListLongMap!1631)

(assert (=> d!37523 (= res!60471 (contains!861 lt!64231 (_1!1271 (ite (or c!22677 c!22679) (tuple2!2521 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2628 (v!3108 (underlying!436 thiss!992)))) (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 (v!3108 (underlying!436 thiss!992))))))))))

(declare-fun lt!64232 () List!1676)

(assert (=> d!37523 (= lt!64231 (ListLongMap!1632 lt!64232))))

(declare-fun lt!64233 () Unit!3871)

(declare-fun lt!64230 () Unit!3871)

(assert (=> d!37523 (= lt!64233 lt!64230)))

(assert (=> d!37523 (= (getValueByKey!167 lt!64232 (_1!1271 (ite (or c!22677 c!22679) (tuple2!2521 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2628 (v!3108 (underlying!436 thiss!992)))) (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 (v!3108 (underlying!436 thiss!992))))))) (Some!172 (_2!1271 (ite (or c!22677 c!22679) (tuple2!2521 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2628 (v!3108 (underlying!436 thiss!992)))) (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 (v!3108 (underlying!436 thiss!992))))))))))

(declare-fun lemmaContainsTupThenGetReturnValue!82 (List!1676 (_ BitVec 64) V!3425) Unit!3871)

(assert (=> d!37523 (= lt!64230 (lemmaContainsTupThenGetReturnValue!82 lt!64232 (_1!1271 (ite (or c!22677 c!22679) (tuple2!2521 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2628 (v!3108 (underlying!436 thiss!992)))) (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 (v!3108 (underlying!436 thiss!992)))))) (_2!1271 (ite (or c!22677 c!22679) (tuple2!2521 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2628 (v!3108 (underlying!436 thiss!992)))) (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 (v!3108 (underlying!436 thiss!992))))))))))

(declare-fun insertStrictlySorted!85 (List!1676 (_ BitVec 64) V!3425) List!1676)

(assert (=> d!37523 (= lt!64232 (insertStrictlySorted!85 (toList!831 (ite c!22677 call!13273 (ite c!22679 call!13274 call!13270))) (_1!1271 (ite (or c!22677 c!22679) (tuple2!2521 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2628 (v!3108 (underlying!436 thiss!992)))) (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 (v!3108 (underlying!436 thiss!992)))))) (_2!1271 (ite (or c!22677 c!22679) (tuple2!2521 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2628 (v!3108 (underlying!436 thiss!992)))) (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 (v!3108 (underlying!436 thiss!992))))))))))

(assert (=> d!37523 (= (+!163 (ite c!22677 call!13273 (ite c!22679 call!13274 call!13270)) (ite (or c!22677 c!22679) (tuple2!2521 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2628 (v!3108 (underlying!436 thiss!992)))) (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 (v!3108 (underlying!436 thiss!992)))))) lt!64231)))

(declare-fun b!124891 () Bool)

(declare-fun res!60472 () Bool)

(assert (=> b!124891 (=> (not res!60472) (not e!81623))))

(assert (=> b!124891 (= res!60472 (= (getValueByKey!167 (toList!831 lt!64231) (_1!1271 (ite (or c!22677 c!22679) (tuple2!2521 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2628 (v!3108 (underlying!436 thiss!992)))) (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 (v!3108 (underlying!436 thiss!992))))))) (Some!172 (_2!1271 (ite (or c!22677 c!22679) (tuple2!2521 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2628 (v!3108 (underlying!436 thiss!992)))) (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 (v!3108 (underlying!436 thiss!992)))))))))))

(declare-fun b!124892 () Bool)

(declare-fun contains!862 (List!1676 tuple2!2520) Bool)

(assert (=> b!124892 (= e!81623 (contains!862 (toList!831 lt!64231) (ite (or c!22677 c!22679) (tuple2!2521 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2628 (v!3108 (underlying!436 thiss!992)))) (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 (v!3108 (underlying!436 thiss!992)))))))))

(assert (= (and d!37523 res!60471) b!124891))

(assert (= (and b!124891 res!60472) b!124892))

(declare-fun m!145033 () Bool)

(assert (=> d!37523 m!145033))

(declare-fun m!145035 () Bool)

(assert (=> d!37523 m!145035))

(declare-fun m!145037 () Bool)

(assert (=> d!37523 m!145037))

(declare-fun m!145039 () Bool)

(assert (=> d!37523 m!145039))

(declare-fun m!145041 () Bool)

(assert (=> b!124891 m!145041))

(declare-fun m!145043 () Bool)

(assert (=> b!124892 m!145043))

(assert (=> bm!13265 d!37523))

(declare-fun d!37525 () Bool)

(declare-fun res!60473 () Bool)

(declare-fun e!81624 () Bool)

(assert (=> d!37525 (=> (not res!60473) (not e!81624))))

(assert (=> d!37525 (= res!60473 (simpleValid!86 (v!3108 (underlying!436 thiss!992))))))

(assert (=> d!37525 (= (valid!515 (v!3108 (underlying!436 thiss!992))) e!81624)))

(declare-fun b!124893 () Bool)

(declare-fun res!60474 () Bool)

(assert (=> b!124893 (=> (not res!60474) (not e!81624))))

(assert (=> b!124893 (= res!60474 (= (arrayCountValidKeys!0 (_keys!4492 (v!3108 (underlying!436 thiss!992))) #b00000000000000000000000000000000 (size!2473 (_keys!4492 (v!3108 (underlying!436 thiss!992))))) (_size!576 (v!3108 (underlying!436 thiss!992)))))))

(declare-fun b!124894 () Bool)

(declare-fun res!60475 () Bool)

(assert (=> b!124894 (=> (not res!60475) (not e!81624))))

(assert (=> b!124894 (= res!60475 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4492 (v!3108 (underlying!436 thiss!992))) (mask!7009 (v!3108 (underlying!436 thiss!992)))))))

(declare-fun b!124895 () Bool)

(assert (=> b!124895 (= e!81624 (arrayNoDuplicates!0 (_keys!4492 (v!3108 (underlying!436 thiss!992))) #b00000000000000000000000000000000 Nil!1674))))

(assert (= (and d!37525 res!60473) b!124893))

(assert (= (and b!124893 res!60474) b!124894))

(assert (= (and b!124894 res!60475) b!124895))

(declare-fun m!145045 () Bool)

(assert (=> d!37525 m!145045))

(declare-fun m!145047 () Bool)

(assert (=> b!124893 m!145047))

(declare-fun m!145049 () Bool)

(assert (=> b!124894 m!145049))

(declare-fun m!145051 () Bool)

(assert (=> b!124895 m!145051))

(assert (=> d!37497 d!37525))

(declare-fun b!124908 () Bool)

(declare-fun e!81633 () SeekEntryResult!263)

(declare-fun e!81632 () SeekEntryResult!263)

(assert (=> b!124908 (= e!81633 e!81632)))

(declare-fun lt!64241 () (_ BitVec 64))

(declare-fun lt!64240 () SeekEntryResult!263)

(assert (=> b!124908 (= lt!64241 (select (arr!2210 (_keys!4492 newMap!16)) (index!3208 lt!64240)))))

(declare-fun c!22739 () Bool)

(assert (=> b!124908 (= c!22739 (= lt!64241 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355)))))

(declare-fun b!124909 () Bool)

(declare-fun e!81631 () SeekEntryResult!263)

(assert (=> b!124909 (= e!81631 (MissingZero!263 (index!3208 lt!64240)))))

(declare-fun lt!64242 () SeekEntryResult!263)

(declare-fun d!37527 () Bool)

(assert (=> d!37527 (and (or ((_ is Undefined!263) lt!64242) (not ((_ is Found!263) lt!64242)) (and (bvsge (index!3207 lt!64242) #b00000000000000000000000000000000) (bvslt (index!3207 lt!64242) (size!2473 (_keys!4492 newMap!16))))) (or ((_ is Undefined!263) lt!64242) ((_ is Found!263) lt!64242) (not ((_ is MissingZero!263) lt!64242)) (and (bvsge (index!3206 lt!64242) #b00000000000000000000000000000000) (bvslt (index!3206 lt!64242) (size!2473 (_keys!4492 newMap!16))))) (or ((_ is Undefined!263) lt!64242) ((_ is Found!263) lt!64242) ((_ is MissingZero!263) lt!64242) (not ((_ is MissingVacant!263) lt!64242)) (and (bvsge (index!3209 lt!64242) #b00000000000000000000000000000000) (bvslt (index!3209 lt!64242) (size!2473 (_keys!4492 newMap!16))))) (or ((_ is Undefined!263) lt!64242) (ite ((_ is Found!263) lt!64242) (= (select (arr!2210 (_keys!4492 newMap!16)) (index!3207 lt!64242)) (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355)) (ite ((_ is MissingZero!263) lt!64242) (= (select (arr!2210 (_keys!4492 newMap!16)) (index!3206 lt!64242)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!263) lt!64242) (= (select (arr!2210 (_keys!4492 newMap!16)) (index!3209 lt!64242)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!37527 (= lt!64242 e!81633)))

(declare-fun c!22738 () Bool)

(assert (=> d!37527 (= c!22738 (and ((_ is Intermediate!263) lt!64240) (undefined!1075 lt!64240)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!4667 (_ BitVec 32)) SeekEntryResult!263)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!37527 (= lt!64240 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355) (mask!7009 newMap!16)) (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355) (_keys!4492 newMap!16) (mask!7009 newMap!16)))))

(assert (=> d!37527 (validMask!0 (mask!7009 newMap!16))))

(assert (=> d!37527 (= (seekEntryOrOpen!0 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355) (_keys!4492 newMap!16) (mask!7009 newMap!16)) lt!64242)))

(declare-fun b!124910 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!4667 (_ BitVec 32)) SeekEntryResult!263)

(assert (=> b!124910 (= e!81631 (seekKeyOrZeroReturnVacant!0 (x!14812 lt!64240) (index!3208 lt!64240) (index!3208 lt!64240) (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355) (_keys!4492 newMap!16) (mask!7009 newMap!16)))))

(declare-fun b!124911 () Bool)

(assert (=> b!124911 (= e!81632 (Found!263 (index!3208 lt!64240)))))

(declare-fun b!124912 () Bool)

(declare-fun c!22737 () Bool)

(assert (=> b!124912 (= c!22737 (= lt!64241 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!124912 (= e!81632 e!81631)))

(declare-fun b!124913 () Bool)

(assert (=> b!124913 (= e!81633 Undefined!263)))

(assert (= (and d!37527 c!22738) b!124913))

(assert (= (and d!37527 (not c!22738)) b!124908))

(assert (= (and b!124908 c!22739) b!124911))

(assert (= (and b!124908 (not c!22739)) b!124912))

(assert (= (and b!124912 c!22737) b!124909))

(assert (= (and b!124912 (not c!22737)) b!124910))

(declare-fun m!145053 () Bool)

(assert (=> b!124908 m!145053))

(assert (=> d!37527 m!144797))

(declare-fun m!145055 () Bool)

(assert (=> d!37527 m!145055))

(declare-fun m!145057 () Bool)

(assert (=> d!37527 m!145057))

(assert (=> d!37527 m!145055))

(assert (=> d!37527 m!144797))

(declare-fun m!145059 () Bool)

(assert (=> d!37527 m!145059))

(declare-fun m!145061 () Bool)

(assert (=> d!37527 m!145061))

(declare-fun m!145063 () Bool)

(assert (=> d!37527 m!145063))

(declare-fun m!145065 () Bool)

(assert (=> d!37527 m!145065))

(assert (=> b!124910 m!144797))

(declare-fun m!145067 () Bool)

(assert (=> b!124910 m!145067))

(assert (=> bm!13339 d!37527))

(declare-fun d!37529 () Bool)

(declare-fun e!81634 () Bool)

(assert (=> d!37529 e!81634))

(declare-fun res!60476 () Bool)

(assert (=> d!37529 (=> (not res!60476) (not e!81634))))

(declare-fun lt!64244 () ListLongMap!1631)

(assert (=> d!37529 (= res!60476 (contains!861 lt!64244 (_1!1271 (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 (v!3108 (underlying!436 thiss!992)))))))))

(declare-fun lt!64245 () List!1676)

(assert (=> d!37529 (= lt!64244 (ListLongMap!1632 lt!64245))))

(declare-fun lt!64246 () Unit!3871)

(declare-fun lt!64243 () Unit!3871)

(assert (=> d!37529 (= lt!64246 lt!64243)))

(assert (=> d!37529 (= (getValueByKey!167 lt!64245 (_1!1271 (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 (v!3108 (underlying!436 thiss!992)))))) (Some!172 (_2!1271 (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 (v!3108 (underlying!436 thiss!992)))))))))

(assert (=> d!37529 (= lt!64243 (lemmaContainsTupThenGetReturnValue!82 lt!64245 (_1!1271 (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 (v!3108 (underlying!436 thiss!992))))) (_2!1271 (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 (v!3108 (underlying!436 thiss!992)))))))))

(assert (=> d!37529 (= lt!64245 (insertStrictlySorted!85 (toList!831 call!13268) (_1!1271 (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 (v!3108 (underlying!436 thiss!992))))) (_2!1271 (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 (v!3108 (underlying!436 thiss!992)))))))))

(assert (=> d!37529 (= (+!163 call!13268 (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 (v!3108 (underlying!436 thiss!992))))) lt!64244)))

(declare-fun b!124914 () Bool)

(declare-fun res!60477 () Bool)

(assert (=> b!124914 (=> (not res!60477) (not e!81634))))

(assert (=> b!124914 (= res!60477 (= (getValueByKey!167 (toList!831 lt!64244) (_1!1271 (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 (v!3108 (underlying!436 thiss!992)))))) (Some!172 (_2!1271 (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 (v!3108 (underlying!436 thiss!992))))))))))

(declare-fun b!124915 () Bool)

(assert (=> b!124915 (= e!81634 (contains!862 (toList!831 lt!64244) (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 (v!3108 (underlying!436 thiss!992))))))))

(assert (= (and d!37529 res!60476) b!124914))

(assert (= (and b!124914 res!60477) b!124915))

(declare-fun m!145069 () Bool)

(assert (=> d!37529 m!145069))

(declare-fun m!145071 () Bool)

(assert (=> d!37529 m!145071))

(declare-fun m!145073 () Bool)

(assert (=> d!37529 m!145073))

(declare-fun m!145075 () Bool)

(assert (=> d!37529 m!145075))

(declare-fun m!145077 () Bool)

(assert (=> b!124914 m!145077))

(declare-fun m!145079 () Bool)

(assert (=> b!124915 m!145079))

(assert (=> b!124718 d!37529))

(declare-fun b!124933 () Bool)

(declare-fun lt!64252 () SeekEntryResult!263)

(assert (=> b!124933 (and (bvsge (index!3206 lt!64252) #b00000000000000000000000000000000) (bvslt (index!3206 lt!64252) (size!2473 (_keys!4492 newMap!16))))))

(declare-fun res!60489 () Bool)

(assert (=> b!124933 (= res!60489 (= (select (arr!2210 (_keys!4492 newMap!16)) (index!3206 lt!64252)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!81643 () Bool)

(assert (=> b!124933 (=> (not res!60489) (not e!81643))))

(declare-fun b!124934 () Bool)

(declare-fun e!81644 () Bool)

(assert (=> b!124934 (= e!81644 ((_ is Undefined!263) lt!64252))))

(declare-fun b!124935 () Bool)

(declare-fun e!81646 () Bool)

(declare-fun call!13351 () Bool)

(assert (=> b!124935 (= e!81646 (not call!13351))))

(declare-fun b!124936 () Bool)

(declare-fun res!60487 () Bool)

(assert (=> b!124936 (=> (not res!60487) (not e!81646))))

(declare-fun call!13352 () Bool)

(assert (=> b!124936 (= res!60487 call!13352)))

(assert (=> b!124936 (= e!81644 e!81646)))

(declare-fun b!124937 () Bool)

(assert (=> b!124937 (= e!81643 (not call!13351))))

(declare-fun b!124938 () Bool)

(declare-fun res!60486 () Bool)

(assert (=> b!124938 (=> (not res!60486) (not e!81646))))

(assert (=> b!124938 (= res!60486 (= (select (arr!2210 (_keys!4492 newMap!16)) (index!3209 lt!64252)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!124938 (and (bvsge (index!3209 lt!64252) #b00000000000000000000000000000000) (bvslt (index!3209 lt!64252) (size!2473 (_keys!4492 newMap!16))))))

(declare-fun b!124939 () Bool)

(declare-fun e!81645 () Bool)

(assert (=> b!124939 (= e!81645 e!81644)))

(declare-fun c!22745 () Bool)

(assert (=> b!124939 (= c!22745 ((_ is MissingVacant!263) lt!64252))))

(declare-fun bm!13348 () Bool)

(declare-fun c!22744 () Bool)

(assert (=> bm!13348 (= call!13352 (inRange!0 (ite c!22744 (index!3206 lt!64252) (index!3209 lt!64252)) (mask!7009 newMap!16)))))

(declare-fun bm!13349 () Bool)

(assert (=> bm!13349 (= call!13351 (arrayContainsKey!0 (_keys!4492 newMap!16) (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun b!124932 () Bool)

(assert (=> b!124932 (= e!81645 e!81643)))

(declare-fun res!60488 () Bool)

(assert (=> b!124932 (= res!60488 call!13352)))

(assert (=> b!124932 (=> (not res!60488) (not e!81643))))

(declare-fun d!37531 () Bool)

(assert (=> d!37531 e!81645))

(assert (=> d!37531 (= c!22744 ((_ is MissingZero!263) lt!64252))))

(assert (=> d!37531 (= lt!64252 (seekEntryOrOpen!0 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355) (_keys!4492 newMap!16) (mask!7009 newMap!16)))))

(declare-fun lt!64251 () Unit!3871)

(declare-fun choose!754 (array!4667 array!4669 (_ BitVec 32) (_ BitVec 32) V!3425 V!3425 (_ BitVec 64) Int) Unit!3871)

(assert (=> d!37531 (= lt!64251 (choose!754 (_keys!4492 newMap!16) (_values!2746 newMap!16) (mask!7009 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355) (defaultEntry!2763 newMap!16)))))

(assert (=> d!37531 (validMask!0 (mask!7009 newMap!16))))

(assert (=> d!37531 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!55 (_keys!4492 newMap!16) (_values!2746 newMap!16) (mask!7009 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355) (defaultEntry!2763 newMap!16)) lt!64251)))

(assert (= (and d!37531 c!22744) b!124932))

(assert (= (and d!37531 (not c!22744)) b!124939))

(assert (= (and b!124932 res!60488) b!124933))

(assert (= (and b!124933 res!60489) b!124937))

(assert (= (and b!124939 c!22745) b!124936))

(assert (= (and b!124939 (not c!22745)) b!124934))

(assert (= (and b!124936 res!60487) b!124938))

(assert (= (and b!124938 res!60486) b!124935))

(assert (= (or b!124932 b!124936) bm!13348))

(assert (= (or b!124937 b!124935) bm!13349))

(assert (=> bm!13349 m!144797))

(assert (=> bm!13349 m!145003))

(declare-fun m!145081 () Bool)

(assert (=> b!124938 m!145081))

(declare-fun m!145083 () Bool)

(assert (=> bm!13348 m!145083))

(assert (=> d!37531 m!144797))

(assert (=> d!37531 m!144977))

(assert (=> d!37531 m!144797))

(declare-fun m!145085 () Bool)

(assert (=> d!37531 m!145085))

(assert (=> d!37531 m!145065))

(declare-fun m!145087 () Bool)

(assert (=> b!124933 m!145087))

(assert (=> bm!13322 d!37531))

(declare-fun d!37533 () Bool)

(declare-fun e!81647 () Bool)

(assert (=> d!37533 e!81647))

(declare-fun res!60490 () Bool)

(assert (=> d!37533 (=> (not res!60490) (not e!81647))))

(declare-fun lt!64254 () ListLongMap!1631)

(assert (=> d!37533 (= res!60490 (contains!861 lt!64254 (_1!1271 (tuple2!2521 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!64255 () List!1676)

(assert (=> d!37533 (= lt!64254 (ListLongMap!1632 lt!64255))))

(declare-fun lt!64256 () Unit!3871)

(declare-fun lt!64253 () Unit!3871)

(assert (=> d!37533 (= lt!64256 lt!64253)))

(assert (=> d!37533 (= (getValueByKey!167 lt!64255 (_1!1271 (tuple2!2521 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!172 (_2!1271 (tuple2!2521 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!37533 (= lt!64253 (lemmaContainsTupThenGetReturnValue!82 lt!64255 (_1!1271 (tuple2!2521 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1271 (tuple2!2521 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!37533 (= lt!64255 (insertStrictlySorted!85 (toList!831 call!13334) (_1!1271 (tuple2!2521 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1271 (tuple2!2521 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!37533 (= (+!163 call!13334 (tuple2!2521 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!64254)))

(declare-fun b!124940 () Bool)

(declare-fun res!60491 () Bool)

(assert (=> b!124940 (=> (not res!60491) (not e!81647))))

(assert (=> b!124940 (= res!60491 (= (getValueByKey!167 (toList!831 lt!64254) (_1!1271 (tuple2!2521 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!172 (_2!1271 (tuple2!2521 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!124941 () Bool)

(assert (=> b!124941 (= e!81647 (contains!862 (toList!831 lt!64254) (tuple2!2521 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!37533 res!60490) b!124940))

(assert (= (and b!124940 res!60491) b!124941))

(declare-fun m!145089 () Bool)

(assert (=> d!37533 m!145089))

(declare-fun m!145091 () Bool)

(assert (=> d!37533 m!145091))

(declare-fun m!145093 () Bool)

(assert (=> d!37533 m!145093))

(declare-fun m!145095 () Bool)

(assert (=> d!37533 m!145095))

(declare-fun m!145097 () Bool)

(assert (=> b!124940 m!145097))

(declare-fun m!145099 () Bool)

(assert (=> b!124941 m!145099))

(assert (=> b!124839 d!37533))

(declare-fun d!37535 () Bool)

(declare-fun get!1449 (Option!173) V!3425)

(assert (=> d!37535 (= (apply!110 lt!64108 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1449 (getValueByKey!167 (toList!831 lt!64108) (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(declare-fun bs!5170 () Bool)

(assert (= bs!5170 d!37535))

(assert (=> bs!5170 m!144905))

(declare-fun m!145101 () Bool)

(assert (=> bs!5170 m!145101))

(assert (=> bs!5170 m!145101))

(declare-fun m!145103 () Bool)

(assert (=> bs!5170 m!145103))

(assert (=> b!124702 d!37535))

(declare-fun d!37537 () Bool)

(declare-fun c!22746 () Bool)

(assert (=> d!37537 (= c!22746 ((_ is ValueCellFull!1073) (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun e!81648 () V!3425)

(assert (=> d!37537 (= (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) e!81648)))

(declare-fun b!124942 () Bool)

(assert (=> b!124942 (= e!81648 (get!1447 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!124943 () Bool)

(assert (=> b!124943 (= e!81648 (get!1448 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!37537 c!22746) b!124942))

(assert (= (and d!37537 (not c!22746)) b!124943))

(assert (=> b!124942 m!144909))

(assert (=> b!124942 m!144793))

(declare-fun m!145105 () Bool)

(assert (=> b!124942 m!145105))

(assert (=> b!124943 m!144909))

(assert (=> b!124943 m!144793))

(declare-fun m!145107 () Bool)

(assert (=> b!124943 m!145107))

(assert (=> b!124702 d!37537))

(declare-fun d!37539 () Bool)

(declare-fun res!60496 () Bool)

(declare-fun e!81653 () Bool)

(assert (=> d!37539 (=> res!60496 e!81653)))

(assert (=> d!37539 (= res!60496 (and ((_ is Cons!1672) (toList!831 lt!64044)) (= (_1!1271 (h!2273 (toList!831 lt!64044))) (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355))))))

(assert (=> d!37539 (= (containsKey!170 (toList!831 lt!64044) (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355)) e!81653)))

(declare-fun b!124948 () Bool)

(declare-fun e!81654 () Bool)

(assert (=> b!124948 (= e!81653 e!81654)))

(declare-fun res!60497 () Bool)

(assert (=> b!124948 (=> (not res!60497) (not e!81654))))

(assert (=> b!124948 (= res!60497 (and (or (not ((_ is Cons!1672) (toList!831 lt!64044))) (bvsle (_1!1271 (h!2273 (toList!831 lt!64044))) (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355))) ((_ is Cons!1672) (toList!831 lt!64044)) (bvslt (_1!1271 (h!2273 (toList!831 lt!64044))) (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355))))))

(declare-fun b!124949 () Bool)

(assert (=> b!124949 (= e!81654 (containsKey!170 (t!5995 (toList!831 lt!64044)) (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355)))))

(assert (= (and d!37539 (not res!60496)) b!124948))

(assert (= (and b!124948 res!60497) b!124949))

(assert (=> b!124949 m!144797))

(declare-fun m!145109 () Bool)

(assert (=> b!124949 m!145109))

(assert (=> d!37511 d!37539))

(declare-fun d!37541 () Bool)

(declare-fun res!60507 () Bool)

(declare-fun e!81657 () Bool)

(assert (=> d!37541 (=> (not res!60507) (not e!81657))))

(assert (=> d!37541 (= res!60507 (validMask!0 (mask!7009 newMap!16)))))

(assert (=> d!37541 (= (simpleValid!86 newMap!16) e!81657)))

(declare-fun b!124960 () Bool)

(declare-fun res!60506 () Bool)

(assert (=> b!124960 (=> (not res!60506) (not e!81657))))

(declare-fun size!2479 (LongMapFixedSize!1054) (_ BitVec 32))

(assert (=> b!124960 (= res!60506 (= (size!2479 newMap!16) (bvadd (_size!576 newMap!16) (bvsdiv (bvadd (extraKeys!2548 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!124958 () Bool)

(declare-fun res!60509 () Bool)

(assert (=> b!124958 (=> (not res!60509) (not e!81657))))

(assert (=> b!124958 (= res!60509 (and (= (size!2474 (_values!2746 newMap!16)) (bvadd (mask!7009 newMap!16) #b00000000000000000000000000000001)) (= (size!2473 (_keys!4492 newMap!16)) (size!2474 (_values!2746 newMap!16))) (bvsge (_size!576 newMap!16) #b00000000000000000000000000000000) (bvsle (_size!576 newMap!16) (bvadd (mask!7009 newMap!16) #b00000000000000000000000000000001))))))

(declare-fun b!124961 () Bool)

(assert (=> b!124961 (= e!81657 (and (bvsge (extraKeys!2548 newMap!16) #b00000000000000000000000000000000) (bvsle (extraKeys!2548 newMap!16) #b00000000000000000000000000000011) (bvsge (_vacant!576 newMap!16) #b00000000000000000000000000000000)))))

(declare-fun b!124959 () Bool)

(declare-fun res!60508 () Bool)

(assert (=> b!124959 (=> (not res!60508) (not e!81657))))

(assert (=> b!124959 (= res!60508 (bvsge (size!2479 newMap!16) (_size!576 newMap!16)))))

(assert (= (and d!37541 res!60507) b!124958))

(assert (= (and b!124958 res!60509) b!124959))

(assert (= (and b!124959 res!60508) b!124960))

(assert (= (and b!124960 res!60506) b!124961))

(assert (=> d!37541 m!145065))

(declare-fun m!145111 () Bool)

(assert (=> b!124960 m!145111))

(assert (=> b!124959 m!145111))

(assert (=> d!37503 d!37541))

(declare-fun b!124970 () Bool)

(declare-fun e!81666 () Bool)

(declare-fun e!81664 () Bool)

(assert (=> b!124970 (= e!81666 e!81664)))

(declare-fun c!22749 () Bool)

(assert (=> b!124970 (= c!22749 (validKeyInArray!0 (select (arr!2210 (_keys!4492 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!124971 () Bool)

(declare-fun call!13355 () Bool)

(assert (=> b!124971 (= e!81664 call!13355)))

(declare-fun b!124972 () Bool)

(declare-fun e!81665 () Bool)

(assert (=> b!124972 (= e!81664 e!81665)))

(declare-fun lt!64265 () (_ BitVec 64))

(assert (=> b!124972 (= lt!64265 (select (arr!2210 (_keys!4492 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!64264 () Unit!3871)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!4667 (_ BitVec 64) (_ BitVec 32)) Unit!3871)

(assert (=> b!124972 (= lt!64264 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!4492 newMap!16) lt!64265 #b00000000000000000000000000000000))))

(assert (=> b!124972 (arrayContainsKey!0 (_keys!4492 newMap!16) lt!64265 #b00000000000000000000000000000000)))

(declare-fun lt!64263 () Unit!3871)

(assert (=> b!124972 (= lt!64263 lt!64264)))

(declare-fun res!60515 () Bool)

(assert (=> b!124972 (= res!60515 (= (seekEntryOrOpen!0 (select (arr!2210 (_keys!4492 newMap!16)) #b00000000000000000000000000000000) (_keys!4492 newMap!16) (mask!7009 newMap!16)) (Found!263 #b00000000000000000000000000000000)))))

(assert (=> b!124972 (=> (not res!60515) (not e!81665))))

(declare-fun bm!13352 () Bool)

(assert (=> bm!13352 (= call!13355 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!4492 newMap!16) (mask!7009 newMap!16)))))

(declare-fun b!124973 () Bool)

(assert (=> b!124973 (= e!81665 call!13355)))

(declare-fun d!37543 () Bool)

(declare-fun res!60514 () Bool)

(assert (=> d!37543 (=> res!60514 e!81666)))

(assert (=> d!37543 (= res!60514 (bvsge #b00000000000000000000000000000000 (size!2473 (_keys!4492 newMap!16))))))

(assert (=> d!37543 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4492 newMap!16) (mask!7009 newMap!16)) e!81666)))

(assert (= (and d!37543 (not res!60514)) b!124970))

(assert (= (and b!124970 c!22749) b!124972))

(assert (= (and b!124970 (not c!22749)) b!124971))

(assert (= (and b!124972 res!60515) b!124973))

(assert (= (or b!124973 b!124971) bm!13352))

(declare-fun m!145113 () Bool)

(assert (=> b!124970 m!145113))

(assert (=> b!124970 m!145113))

(declare-fun m!145115 () Bool)

(assert (=> b!124970 m!145115))

(assert (=> b!124972 m!145113))

(declare-fun m!145117 () Bool)

(assert (=> b!124972 m!145117))

(declare-fun m!145119 () Bool)

(assert (=> b!124972 m!145119))

(assert (=> b!124972 m!145113))

(declare-fun m!145121 () Bool)

(assert (=> b!124972 m!145121))

(declare-fun m!145123 () Bool)

(assert (=> bm!13352 m!145123))

(assert (=> b!124728 d!37543))

(declare-fun d!37545 () Bool)

(assert (=> d!37545 (= (apply!110 (+!163 lt!64116 (tuple2!2521 lt!64125 (minValue!2628 (v!3108 (underlying!436 thiss!992))))) lt!64111) (get!1449 (getValueByKey!167 (toList!831 (+!163 lt!64116 (tuple2!2521 lt!64125 (minValue!2628 (v!3108 (underlying!436 thiss!992)))))) lt!64111)))))

(declare-fun bs!5171 () Bool)

(assert (= bs!5171 d!37545))

(declare-fun m!145125 () Bool)

(assert (=> bs!5171 m!145125))

(assert (=> bs!5171 m!145125))

(declare-fun m!145127 () Bool)

(assert (=> bs!5171 m!145127))

(assert (=> b!124704 d!37545))

(declare-fun d!37547 () Bool)

(declare-fun e!81667 () Bool)

(assert (=> d!37547 e!81667))

(declare-fun res!60516 () Bool)

(assert (=> d!37547 (=> (not res!60516) (not e!81667))))

(declare-fun lt!64267 () ListLongMap!1631)

(assert (=> d!37547 (= res!60516 (contains!861 lt!64267 (_1!1271 (tuple2!2521 lt!64114 (zeroValue!2628 (v!3108 (underlying!436 thiss!992)))))))))

(declare-fun lt!64268 () List!1676)

(assert (=> d!37547 (= lt!64267 (ListLongMap!1632 lt!64268))))

(declare-fun lt!64269 () Unit!3871)

(declare-fun lt!64266 () Unit!3871)

(assert (=> d!37547 (= lt!64269 lt!64266)))

(assert (=> d!37547 (= (getValueByKey!167 lt!64268 (_1!1271 (tuple2!2521 lt!64114 (zeroValue!2628 (v!3108 (underlying!436 thiss!992)))))) (Some!172 (_2!1271 (tuple2!2521 lt!64114 (zeroValue!2628 (v!3108 (underlying!436 thiss!992)))))))))

(assert (=> d!37547 (= lt!64266 (lemmaContainsTupThenGetReturnValue!82 lt!64268 (_1!1271 (tuple2!2521 lt!64114 (zeroValue!2628 (v!3108 (underlying!436 thiss!992))))) (_2!1271 (tuple2!2521 lt!64114 (zeroValue!2628 (v!3108 (underlying!436 thiss!992)))))))))

(assert (=> d!37547 (= lt!64268 (insertStrictlySorted!85 (toList!831 lt!64122) (_1!1271 (tuple2!2521 lt!64114 (zeroValue!2628 (v!3108 (underlying!436 thiss!992))))) (_2!1271 (tuple2!2521 lt!64114 (zeroValue!2628 (v!3108 (underlying!436 thiss!992)))))))))

(assert (=> d!37547 (= (+!163 lt!64122 (tuple2!2521 lt!64114 (zeroValue!2628 (v!3108 (underlying!436 thiss!992))))) lt!64267)))

(declare-fun b!124974 () Bool)

(declare-fun res!60517 () Bool)

(assert (=> b!124974 (=> (not res!60517) (not e!81667))))

(assert (=> b!124974 (= res!60517 (= (getValueByKey!167 (toList!831 lt!64267) (_1!1271 (tuple2!2521 lt!64114 (zeroValue!2628 (v!3108 (underlying!436 thiss!992)))))) (Some!172 (_2!1271 (tuple2!2521 lt!64114 (zeroValue!2628 (v!3108 (underlying!436 thiss!992))))))))))

(declare-fun b!124975 () Bool)

(assert (=> b!124975 (= e!81667 (contains!862 (toList!831 lt!64267) (tuple2!2521 lt!64114 (zeroValue!2628 (v!3108 (underlying!436 thiss!992))))))))

(assert (= (and d!37547 res!60516) b!124974))

(assert (= (and b!124974 res!60517) b!124975))

(declare-fun m!145129 () Bool)

(assert (=> d!37547 m!145129))

(declare-fun m!145131 () Bool)

(assert (=> d!37547 m!145131))

(declare-fun m!145133 () Bool)

(assert (=> d!37547 m!145133))

(declare-fun m!145135 () Bool)

(assert (=> d!37547 m!145135))

(declare-fun m!145137 () Bool)

(assert (=> b!124974 m!145137))

(declare-fun m!145139 () Bool)

(assert (=> b!124975 m!145139))

(assert (=> b!124704 d!37547))

(declare-fun d!37549 () Bool)

(assert (=> d!37549 (= (apply!110 lt!64110 lt!64128) (get!1449 (getValueByKey!167 (toList!831 lt!64110) lt!64128)))))

(declare-fun bs!5172 () Bool)

(assert (= bs!5172 d!37549))

(declare-fun m!145141 () Bool)

(assert (=> bs!5172 m!145141))

(assert (=> bs!5172 m!145141))

(declare-fun m!145143 () Bool)

(assert (=> bs!5172 m!145143))

(assert (=> b!124704 d!37549))

(declare-fun b!125000 () Bool)

(declare-fun e!81683 () ListLongMap!1631)

(declare-fun e!81688 () ListLongMap!1631)

(assert (=> b!125000 (= e!81683 e!81688)))

(declare-fun c!22759 () Bool)

(assert (=> b!125000 (= c!22759 (validKeyInArray!0 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun lt!64289 () ListLongMap!1631)

(declare-fun e!81687 () Bool)

(declare-fun b!125001 () Bool)

(assert (=> b!125001 (= e!81687 (= lt!64289 (getCurrentListMapNoExtraKeys!130 (_keys!4492 (v!3108 (underlying!436 thiss!992))) (_values!2746 (v!3108 (underlying!436 thiss!992))) (mask!7009 (v!3108 (underlying!436 thiss!992))) (extraKeys!2548 (v!3108 (underlying!436 thiss!992))) (zeroValue!2628 (v!3108 (underlying!436 thiss!992))) (minValue!2628 (v!3108 (underlying!436 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))))))))

(declare-fun b!125002 () Bool)

(declare-fun e!81684 () Bool)

(assert (=> b!125002 (= e!81684 e!81687)))

(declare-fun c!22760 () Bool)

(assert (=> b!125002 (= c!22760 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2473 (_keys!4492 (v!3108 (underlying!436 thiss!992))))))))

(declare-fun b!125003 () Bool)

(declare-fun lt!64290 () Unit!3871)

(declare-fun lt!64287 () Unit!3871)

(assert (=> b!125003 (= lt!64290 lt!64287)))

(declare-fun lt!64285 () (_ BitVec 64))

(declare-fun lt!64286 () (_ BitVec 64))

(declare-fun lt!64284 () ListLongMap!1631)

(declare-fun lt!64288 () V!3425)

(assert (=> b!125003 (not (contains!861 (+!163 lt!64284 (tuple2!2521 lt!64285 lt!64288)) lt!64286))))

(declare-fun addStillNotContains!57 (ListLongMap!1631 (_ BitVec 64) V!3425 (_ BitVec 64)) Unit!3871)

(assert (=> b!125003 (= lt!64287 (addStillNotContains!57 lt!64284 lt!64285 lt!64288 lt!64286))))

(assert (=> b!125003 (= lt!64286 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!125003 (= lt!64288 (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!125003 (= lt!64285 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun call!13358 () ListLongMap!1631)

(assert (=> b!125003 (= lt!64284 call!13358)))

(assert (=> b!125003 (= e!81688 (+!163 call!13358 (tuple2!2521 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!125004 () Bool)

(assert (=> b!125004 (= e!81683 (ListLongMap!1632 Nil!1673))))

(declare-fun b!125005 () Bool)

(declare-fun e!81682 () Bool)

(assert (=> b!125005 (= e!81682 (validKeyInArray!0 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!125005 (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000)))

(declare-fun b!125006 () Bool)

(assert (=> b!125006 (= e!81688 call!13358)))

(declare-fun b!125007 () Bool)

(assert (=> b!125007 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2473 (_keys!4492 (v!3108 (underlying!436 thiss!992))))))))

(assert (=> b!125007 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2474 (_values!2746 (v!3108 (underlying!436 thiss!992))))))))

(declare-fun e!81685 () Bool)

(assert (=> b!125007 (= e!81685 (= (apply!110 lt!64289 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!125009 () Bool)

(assert (=> b!125009 (= e!81684 e!81685)))

(assert (=> b!125009 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2473 (_keys!4492 (v!3108 (underlying!436 thiss!992))))))))

(declare-fun res!60528 () Bool)

(assert (=> b!125009 (= res!60528 (contains!861 lt!64289 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!125009 (=> (not res!60528) (not e!81685))))

(declare-fun b!125010 () Bool)

(declare-fun e!81686 () Bool)

(assert (=> b!125010 (= e!81686 e!81684)))

(declare-fun c!22758 () Bool)

(assert (=> b!125010 (= c!22758 e!81682)))

(declare-fun res!60526 () Bool)

(assert (=> b!125010 (=> (not res!60526) (not e!81682))))

(assert (=> b!125010 (= res!60526 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2473 (_keys!4492 (v!3108 (underlying!436 thiss!992))))))))

(declare-fun bm!13355 () Bool)

(assert (=> bm!13355 (= call!13358 (getCurrentListMapNoExtraKeys!130 (_keys!4492 (v!3108 (underlying!436 thiss!992))) (_values!2746 (v!3108 (underlying!436 thiss!992))) (mask!7009 (v!3108 (underlying!436 thiss!992))) (extraKeys!2548 (v!3108 (underlying!436 thiss!992))) (zeroValue!2628 (v!3108 (underlying!436 thiss!992))) (minValue!2628 (v!3108 (underlying!436 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!2763 (v!3108 (underlying!436 thiss!992)))))))

(declare-fun b!125011 () Bool)

(declare-fun res!60527 () Bool)

(assert (=> b!125011 (=> (not res!60527) (not e!81686))))

(assert (=> b!125011 (= res!60527 (not (contains!861 lt!64289 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!37551 () Bool)

(assert (=> d!37551 e!81686))

(declare-fun res!60529 () Bool)

(assert (=> d!37551 (=> (not res!60529) (not e!81686))))

(assert (=> d!37551 (= res!60529 (not (contains!861 lt!64289 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!37551 (= lt!64289 e!81683)))

(declare-fun c!22761 () Bool)

(assert (=> d!37551 (= c!22761 (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2473 (_keys!4492 (v!3108 (underlying!436 thiss!992))))))))

(assert (=> d!37551 (validMask!0 (mask!7009 (v!3108 (underlying!436 thiss!992))))))

(assert (=> d!37551 (= (getCurrentListMapNoExtraKeys!130 (_keys!4492 (v!3108 (underlying!436 thiss!992))) (_values!2746 (v!3108 (underlying!436 thiss!992))) (mask!7009 (v!3108 (underlying!436 thiss!992))) (extraKeys!2548 (v!3108 (underlying!436 thiss!992))) (zeroValue!2628 (v!3108 (underlying!436 thiss!992))) (minValue!2628 (v!3108 (underlying!436 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2763 (v!3108 (underlying!436 thiss!992)))) lt!64289)))

(declare-fun b!125008 () Bool)

(declare-fun isEmpty!400 (ListLongMap!1631) Bool)

(assert (=> b!125008 (= e!81687 (isEmpty!400 lt!64289))))

(assert (= (and d!37551 c!22761) b!125004))

(assert (= (and d!37551 (not c!22761)) b!125000))

(assert (= (and b!125000 c!22759) b!125003))

(assert (= (and b!125000 (not c!22759)) b!125006))

(assert (= (or b!125003 b!125006) bm!13355))

(assert (= (and d!37551 res!60529) b!125011))

(assert (= (and b!125011 res!60527) b!125010))

(assert (= (and b!125010 res!60526) b!125005))

(assert (= (and b!125010 c!22758) b!125009))

(assert (= (and b!125010 (not c!22758)) b!125002))

(assert (= (and b!125009 res!60528) b!125007))

(assert (= (and b!125002 c!22760) b!125001))

(assert (= (and b!125002 (not c!22760)) b!125008))

(declare-fun b_lambda!5487 () Bool)

(assert (=> (not b_lambda!5487) (not b!125003)))

(assert (=> b!125003 t!5992))

(declare-fun b_and!7677 () Bool)

(assert (= b_and!7673 (and (=> t!5992 result!3795) b_and!7677)))

(assert (=> b!125003 t!5994))

(declare-fun b_and!7679 () Bool)

(assert (= b_and!7675 (and (=> t!5994 result!3799) b_and!7679)))

(declare-fun b_lambda!5489 () Bool)

(assert (=> (not b_lambda!5489) (not b!125007)))

(assert (=> b!125007 t!5992))

(declare-fun b_and!7681 () Bool)

(assert (= b_and!7677 (and (=> t!5992 result!3795) b_and!7681)))

(assert (=> b!125007 t!5994))

(declare-fun b_and!7683 () Bool)

(assert (= b_and!7679 (and (=> t!5994 result!3799) b_and!7683)))

(declare-fun m!145145 () Bool)

(assert (=> b!125001 m!145145))

(assert (=> b!125009 m!144905))

(assert (=> b!125009 m!144905))

(declare-fun m!145147 () Bool)

(assert (=> b!125009 m!145147))

(declare-fun m!145149 () Bool)

(assert (=> b!125011 m!145149))

(declare-fun m!145151 () Bool)

(assert (=> b!125008 m!145151))

(assert (=> bm!13355 m!145145))

(assert (=> b!125007 m!144793))

(assert (=> b!125007 m!144909))

(assert (=> b!125007 m!144793))

(assert (=> b!125007 m!144911))

(assert (=> b!125007 m!144909))

(assert (=> b!125007 m!144905))

(assert (=> b!125007 m!144905))

(declare-fun m!145153 () Bool)

(assert (=> b!125007 m!145153))

(declare-fun m!145155 () Bool)

(assert (=> d!37551 m!145155))

(assert (=> d!37551 m!144811))

(assert (=> b!125005 m!144905))

(assert (=> b!125005 m!144905))

(assert (=> b!125005 m!144945))

(declare-fun m!145157 () Bool)

(assert (=> b!125003 m!145157))

(declare-fun m!145159 () Bool)

(assert (=> b!125003 m!145159))

(declare-fun m!145161 () Bool)

(assert (=> b!125003 m!145161))

(assert (=> b!125003 m!144793))

(assert (=> b!125003 m!144905))

(declare-fun m!145163 () Bool)

(assert (=> b!125003 m!145163))

(assert (=> b!125003 m!144909))

(assert (=> b!125003 m!144793))

(assert (=> b!125003 m!144911))

(assert (=> b!125003 m!144909))

(assert (=> b!125003 m!145157))

(assert (=> b!125000 m!144905))

(assert (=> b!125000 m!144905))

(assert (=> b!125000 m!144945))

(assert (=> b!124704 d!37551))

(declare-fun d!37553 () Bool)

(declare-fun e!81689 () Bool)

(assert (=> d!37553 e!81689))

(declare-fun res!60530 () Bool)

(assert (=> d!37553 (=> (not res!60530) (not e!81689))))

(declare-fun lt!64292 () ListLongMap!1631)

(assert (=> d!37553 (= res!60530 (contains!861 lt!64292 (_1!1271 (tuple2!2521 lt!64117 (minValue!2628 (v!3108 (underlying!436 thiss!992)))))))))

(declare-fun lt!64293 () List!1676)

(assert (=> d!37553 (= lt!64292 (ListLongMap!1632 lt!64293))))

(declare-fun lt!64294 () Unit!3871)

(declare-fun lt!64291 () Unit!3871)

(assert (=> d!37553 (= lt!64294 lt!64291)))

(assert (=> d!37553 (= (getValueByKey!167 lt!64293 (_1!1271 (tuple2!2521 lt!64117 (minValue!2628 (v!3108 (underlying!436 thiss!992)))))) (Some!172 (_2!1271 (tuple2!2521 lt!64117 (minValue!2628 (v!3108 (underlying!436 thiss!992)))))))))

(assert (=> d!37553 (= lt!64291 (lemmaContainsTupThenGetReturnValue!82 lt!64293 (_1!1271 (tuple2!2521 lt!64117 (minValue!2628 (v!3108 (underlying!436 thiss!992))))) (_2!1271 (tuple2!2521 lt!64117 (minValue!2628 (v!3108 (underlying!436 thiss!992)))))))))

(assert (=> d!37553 (= lt!64293 (insertStrictlySorted!85 (toList!831 lt!64110) (_1!1271 (tuple2!2521 lt!64117 (minValue!2628 (v!3108 (underlying!436 thiss!992))))) (_2!1271 (tuple2!2521 lt!64117 (minValue!2628 (v!3108 (underlying!436 thiss!992)))))))))

(assert (=> d!37553 (= (+!163 lt!64110 (tuple2!2521 lt!64117 (minValue!2628 (v!3108 (underlying!436 thiss!992))))) lt!64292)))

(declare-fun b!125012 () Bool)

(declare-fun res!60531 () Bool)

(assert (=> b!125012 (=> (not res!60531) (not e!81689))))

(assert (=> b!125012 (= res!60531 (= (getValueByKey!167 (toList!831 lt!64292) (_1!1271 (tuple2!2521 lt!64117 (minValue!2628 (v!3108 (underlying!436 thiss!992)))))) (Some!172 (_2!1271 (tuple2!2521 lt!64117 (minValue!2628 (v!3108 (underlying!436 thiss!992))))))))))

(declare-fun b!125013 () Bool)

(assert (=> b!125013 (= e!81689 (contains!862 (toList!831 lt!64292) (tuple2!2521 lt!64117 (minValue!2628 (v!3108 (underlying!436 thiss!992))))))))

(assert (= (and d!37553 res!60530) b!125012))

(assert (= (and b!125012 res!60531) b!125013))

(declare-fun m!145165 () Bool)

(assert (=> d!37553 m!145165))

(declare-fun m!145167 () Bool)

(assert (=> d!37553 m!145167))

(declare-fun m!145169 () Bool)

(assert (=> d!37553 m!145169))

(declare-fun m!145171 () Bool)

(assert (=> d!37553 m!145171))

(declare-fun m!145173 () Bool)

(assert (=> b!125012 m!145173))

(declare-fun m!145175 () Bool)

(assert (=> b!125013 m!145175))

(assert (=> b!124704 d!37553))

(declare-fun d!37555 () Bool)

(assert (=> d!37555 (= (apply!110 lt!64116 lt!64111) (get!1449 (getValueByKey!167 (toList!831 lt!64116) lt!64111)))))

(declare-fun bs!5173 () Bool)

(assert (= bs!5173 d!37555))

(declare-fun m!145177 () Bool)

(assert (=> bs!5173 m!145177))

(assert (=> bs!5173 m!145177))

(declare-fun m!145179 () Bool)

(assert (=> bs!5173 m!145179))

(assert (=> b!124704 d!37555))

(declare-fun d!37557 () Bool)

(assert (=> d!37557 (= (apply!110 (+!163 lt!64110 (tuple2!2521 lt!64117 (minValue!2628 (v!3108 (underlying!436 thiss!992))))) lt!64128) (apply!110 lt!64110 lt!64128))))

(declare-fun lt!64297 () Unit!3871)

(declare-fun choose!755 (ListLongMap!1631 (_ BitVec 64) V!3425 (_ BitVec 64)) Unit!3871)

(assert (=> d!37557 (= lt!64297 (choose!755 lt!64110 lt!64117 (minValue!2628 (v!3108 (underlying!436 thiss!992))) lt!64128))))

(declare-fun e!81692 () Bool)

(assert (=> d!37557 e!81692))

(declare-fun res!60534 () Bool)

(assert (=> d!37557 (=> (not res!60534) (not e!81692))))

(assert (=> d!37557 (= res!60534 (contains!861 lt!64110 lt!64128))))

(assert (=> d!37557 (= (addApplyDifferent!86 lt!64110 lt!64117 (minValue!2628 (v!3108 (underlying!436 thiss!992))) lt!64128) lt!64297)))

(declare-fun b!125017 () Bool)

(assert (=> b!125017 (= e!81692 (not (= lt!64128 lt!64117)))))

(assert (= (and d!37557 res!60534) b!125017))

(assert (=> d!37557 m!144925))

(assert (=> d!37557 m!144919))

(declare-fun m!145181 () Bool)

(assert (=> d!37557 m!145181))

(declare-fun m!145183 () Bool)

(assert (=> d!37557 m!145183))

(assert (=> d!37557 m!144919))

(assert (=> d!37557 m!144921))

(assert (=> b!124704 d!37557))

(declare-fun d!37559 () Bool)

(assert (=> d!37559 (contains!861 (+!163 lt!64122 (tuple2!2521 lt!64114 (zeroValue!2628 (v!3108 (underlying!436 thiss!992))))) lt!64109)))

(declare-fun lt!64300 () Unit!3871)

(declare-fun choose!756 (ListLongMap!1631 (_ BitVec 64) V!3425 (_ BitVec 64)) Unit!3871)

(assert (=> d!37559 (= lt!64300 (choose!756 lt!64122 lt!64114 (zeroValue!2628 (v!3108 (underlying!436 thiss!992))) lt!64109))))

(assert (=> d!37559 (contains!861 lt!64122 lt!64109)))

(assert (=> d!37559 (= (addStillContains!86 lt!64122 lt!64114 (zeroValue!2628 (v!3108 (underlying!436 thiss!992))) lt!64109) lt!64300)))

(declare-fun bs!5174 () Bool)

(assert (= bs!5174 d!37559))

(assert (=> bs!5174 m!144931))

(assert (=> bs!5174 m!144931))

(assert (=> bs!5174 m!144933))

(declare-fun m!145185 () Bool)

(assert (=> bs!5174 m!145185))

(declare-fun m!145187 () Bool)

(assert (=> bs!5174 m!145187))

(assert (=> b!124704 d!37559))

(declare-fun d!37561 () Bool)

(assert (=> d!37561 (= (apply!110 (+!163 lt!64116 (tuple2!2521 lt!64125 (minValue!2628 (v!3108 (underlying!436 thiss!992))))) lt!64111) (apply!110 lt!64116 lt!64111))))

(declare-fun lt!64301 () Unit!3871)

(assert (=> d!37561 (= lt!64301 (choose!755 lt!64116 lt!64125 (minValue!2628 (v!3108 (underlying!436 thiss!992))) lt!64111))))

(declare-fun e!81693 () Bool)

(assert (=> d!37561 e!81693))

(declare-fun res!60535 () Bool)

(assert (=> d!37561 (=> (not res!60535) (not e!81693))))

(assert (=> d!37561 (= res!60535 (contains!861 lt!64116 lt!64111))))

(assert (=> d!37561 (= (addApplyDifferent!86 lt!64116 lt!64125 (minValue!2628 (v!3108 (underlying!436 thiss!992))) lt!64111) lt!64301)))

(declare-fun b!125019 () Bool)

(assert (=> b!125019 (= e!81693 (not (= lt!64111 lt!64125)))))

(assert (= (and d!37561 res!60535) b!125019))

(assert (=> d!37561 m!144923))

(assert (=> d!37561 m!144937))

(declare-fun m!145189 () Bool)

(assert (=> d!37561 m!145189))

(declare-fun m!145191 () Bool)

(assert (=> d!37561 m!145191))

(assert (=> d!37561 m!144937))

(assert (=> d!37561 m!144939))

(assert (=> b!124704 d!37561))

(declare-fun d!37563 () Bool)

(assert (=> d!37563 (= (apply!110 (+!163 lt!64118 (tuple2!2521 lt!64124 (zeroValue!2628 (v!3108 (underlying!436 thiss!992))))) lt!64121) (apply!110 lt!64118 lt!64121))))

(declare-fun lt!64302 () Unit!3871)

(assert (=> d!37563 (= lt!64302 (choose!755 lt!64118 lt!64124 (zeroValue!2628 (v!3108 (underlying!436 thiss!992))) lt!64121))))

(declare-fun e!81694 () Bool)

(assert (=> d!37563 e!81694))

(declare-fun res!60536 () Bool)

(assert (=> d!37563 (=> (not res!60536) (not e!81694))))

(assert (=> d!37563 (= res!60536 (contains!861 lt!64118 lt!64121))))

(assert (=> d!37563 (= (addApplyDifferent!86 lt!64118 lt!64124 (zeroValue!2628 (v!3108 (underlying!436 thiss!992))) lt!64121) lt!64302)))

(declare-fun b!125020 () Bool)

(assert (=> b!125020 (= e!81694 (not (= lt!64121 lt!64124)))))

(assert (= (and d!37563 res!60536) b!125020))

(assert (=> d!37563 m!144929))

(assert (=> d!37563 m!144915))

(declare-fun m!145193 () Bool)

(assert (=> d!37563 m!145193))

(declare-fun m!145195 () Bool)

(assert (=> d!37563 m!145195))

(assert (=> d!37563 m!144915))

(assert (=> d!37563 m!144917))

(assert (=> b!124704 d!37563))

(declare-fun d!37565 () Bool)

(declare-fun e!81695 () Bool)

(assert (=> d!37565 e!81695))

(declare-fun res!60537 () Bool)

(assert (=> d!37565 (=> (not res!60537) (not e!81695))))

(declare-fun lt!64304 () ListLongMap!1631)

(assert (=> d!37565 (= res!60537 (contains!861 lt!64304 (_1!1271 (tuple2!2521 lt!64124 (zeroValue!2628 (v!3108 (underlying!436 thiss!992)))))))))

(declare-fun lt!64305 () List!1676)

(assert (=> d!37565 (= lt!64304 (ListLongMap!1632 lt!64305))))

(declare-fun lt!64306 () Unit!3871)

(declare-fun lt!64303 () Unit!3871)

(assert (=> d!37565 (= lt!64306 lt!64303)))

(assert (=> d!37565 (= (getValueByKey!167 lt!64305 (_1!1271 (tuple2!2521 lt!64124 (zeroValue!2628 (v!3108 (underlying!436 thiss!992)))))) (Some!172 (_2!1271 (tuple2!2521 lt!64124 (zeroValue!2628 (v!3108 (underlying!436 thiss!992)))))))))

(assert (=> d!37565 (= lt!64303 (lemmaContainsTupThenGetReturnValue!82 lt!64305 (_1!1271 (tuple2!2521 lt!64124 (zeroValue!2628 (v!3108 (underlying!436 thiss!992))))) (_2!1271 (tuple2!2521 lt!64124 (zeroValue!2628 (v!3108 (underlying!436 thiss!992)))))))))

(assert (=> d!37565 (= lt!64305 (insertStrictlySorted!85 (toList!831 lt!64118) (_1!1271 (tuple2!2521 lt!64124 (zeroValue!2628 (v!3108 (underlying!436 thiss!992))))) (_2!1271 (tuple2!2521 lt!64124 (zeroValue!2628 (v!3108 (underlying!436 thiss!992)))))))))

(assert (=> d!37565 (= (+!163 lt!64118 (tuple2!2521 lt!64124 (zeroValue!2628 (v!3108 (underlying!436 thiss!992))))) lt!64304)))

(declare-fun b!125021 () Bool)

(declare-fun res!60538 () Bool)

(assert (=> b!125021 (=> (not res!60538) (not e!81695))))

(assert (=> b!125021 (= res!60538 (= (getValueByKey!167 (toList!831 lt!64304) (_1!1271 (tuple2!2521 lt!64124 (zeroValue!2628 (v!3108 (underlying!436 thiss!992)))))) (Some!172 (_2!1271 (tuple2!2521 lt!64124 (zeroValue!2628 (v!3108 (underlying!436 thiss!992))))))))))

(declare-fun b!125022 () Bool)

(assert (=> b!125022 (= e!81695 (contains!862 (toList!831 lt!64304) (tuple2!2521 lt!64124 (zeroValue!2628 (v!3108 (underlying!436 thiss!992))))))))

(assert (= (and d!37565 res!60537) b!125021))

(assert (= (and b!125021 res!60538) b!125022))

(declare-fun m!145197 () Bool)

(assert (=> d!37565 m!145197))

(declare-fun m!145199 () Bool)

(assert (=> d!37565 m!145199))

(declare-fun m!145201 () Bool)

(assert (=> d!37565 m!145201))

(declare-fun m!145203 () Bool)

(assert (=> d!37565 m!145203))

(declare-fun m!145205 () Bool)

(assert (=> b!125021 m!145205))

(declare-fun m!145207 () Bool)

(assert (=> b!125022 m!145207))

(assert (=> b!124704 d!37565))

(declare-fun d!37567 () Bool)

(assert (=> d!37567 (= (apply!110 (+!163 lt!64110 (tuple2!2521 lt!64117 (minValue!2628 (v!3108 (underlying!436 thiss!992))))) lt!64128) (get!1449 (getValueByKey!167 (toList!831 (+!163 lt!64110 (tuple2!2521 lt!64117 (minValue!2628 (v!3108 (underlying!436 thiss!992)))))) lt!64128)))))

(declare-fun bs!5175 () Bool)

(assert (= bs!5175 d!37567))

(declare-fun m!145209 () Bool)

(assert (=> bs!5175 m!145209))

(assert (=> bs!5175 m!145209))

(declare-fun m!145211 () Bool)

(assert (=> bs!5175 m!145211))

(assert (=> b!124704 d!37567))

(declare-fun d!37569 () Bool)

(declare-fun e!81696 () Bool)

(assert (=> d!37569 e!81696))

(declare-fun res!60539 () Bool)

(assert (=> d!37569 (=> res!60539 e!81696)))

(declare-fun lt!64307 () Bool)

(assert (=> d!37569 (= res!60539 (not lt!64307))))

(declare-fun lt!64310 () Bool)

(assert (=> d!37569 (= lt!64307 lt!64310)))

(declare-fun lt!64309 () Unit!3871)

(declare-fun e!81697 () Unit!3871)

(assert (=> d!37569 (= lt!64309 e!81697)))

(declare-fun c!22762 () Bool)

(assert (=> d!37569 (= c!22762 lt!64310)))

(assert (=> d!37569 (= lt!64310 (containsKey!170 (toList!831 (+!163 lt!64122 (tuple2!2521 lt!64114 (zeroValue!2628 (v!3108 (underlying!436 thiss!992)))))) lt!64109))))

(assert (=> d!37569 (= (contains!861 (+!163 lt!64122 (tuple2!2521 lt!64114 (zeroValue!2628 (v!3108 (underlying!436 thiss!992))))) lt!64109) lt!64307)))

(declare-fun b!125023 () Bool)

(declare-fun lt!64308 () Unit!3871)

(assert (=> b!125023 (= e!81697 lt!64308)))

(assert (=> b!125023 (= lt!64308 (lemmaContainsKeyImpliesGetValueByKeyDefined!118 (toList!831 (+!163 lt!64122 (tuple2!2521 lt!64114 (zeroValue!2628 (v!3108 (underlying!436 thiss!992)))))) lt!64109))))

(assert (=> b!125023 (isDefined!119 (getValueByKey!167 (toList!831 (+!163 lt!64122 (tuple2!2521 lt!64114 (zeroValue!2628 (v!3108 (underlying!436 thiss!992)))))) lt!64109))))

(declare-fun b!125024 () Bool)

(declare-fun Unit!3877 () Unit!3871)

(assert (=> b!125024 (= e!81697 Unit!3877)))

(declare-fun b!125025 () Bool)

(assert (=> b!125025 (= e!81696 (isDefined!119 (getValueByKey!167 (toList!831 (+!163 lt!64122 (tuple2!2521 lt!64114 (zeroValue!2628 (v!3108 (underlying!436 thiss!992)))))) lt!64109)))))

(assert (= (and d!37569 c!22762) b!125023))

(assert (= (and d!37569 (not c!22762)) b!125024))

(assert (= (and d!37569 (not res!60539)) b!125025))

(declare-fun m!145213 () Bool)

(assert (=> d!37569 m!145213))

(declare-fun m!145215 () Bool)

(assert (=> b!125023 m!145215))

(declare-fun m!145217 () Bool)

(assert (=> b!125023 m!145217))

(assert (=> b!125023 m!145217))

(declare-fun m!145219 () Bool)

(assert (=> b!125023 m!145219))

(assert (=> b!125025 m!145217))

(assert (=> b!125025 m!145217))

(assert (=> b!125025 m!145219))

(assert (=> b!124704 d!37569))

(declare-fun d!37571 () Bool)

(declare-fun e!81698 () Bool)

(assert (=> d!37571 e!81698))

(declare-fun res!60540 () Bool)

(assert (=> d!37571 (=> (not res!60540) (not e!81698))))

(declare-fun lt!64312 () ListLongMap!1631)

(assert (=> d!37571 (= res!60540 (contains!861 lt!64312 (_1!1271 (tuple2!2521 lt!64125 (minValue!2628 (v!3108 (underlying!436 thiss!992)))))))))

(declare-fun lt!64313 () List!1676)

(assert (=> d!37571 (= lt!64312 (ListLongMap!1632 lt!64313))))

(declare-fun lt!64314 () Unit!3871)

(declare-fun lt!64311 () Unit!3871)

(assert (=> d!37571 (= lt!64314 lt!64311)))

(assert (=> d!37571 (= (getValueByKey!167 lt!64313 (_1!1271 (tuple2!2521 lt!64125 (minValue!2628 (v!3108 (underlying!436 thiss!992)))))) (Some!172 (_2!1271 (tuple2!2521 lt!64125 (minValue!2628 (v!3108 (underlying!436 thiss!992)))))))))

(assert (=> d!37571 (= lt!64311 (lemmaContainsTupThenGetReturnValue!82 lt!64313 (_1!1271 (tuple2!2521 lt!64125 (minValue!2628 (v!3108 (underlying!436 thiss!992))))) (_2!1271 (tuple2!2521 lt!64125 (minValue!2628 (v!3108 (underlying!436 thiss!992)))))))))

(assert (=> d!37571 (= lt!64313 (insertStrictlySorted!85 (toList!831 lt!64116) (_1!1271 (tuple2!2521 lt!64125 (minValue!2628 (v!3108 (underlying!436 thiss!992))))) (_2!1271 (tuple2!2521 lt!64125 (minValue!2628 (v!3108 (underlying!436 thiss!992)))))))))

(assert (=> d!37571 (= (+!163 lt!64116 (tuple2!2521 lt!64125 (minValue!2628 (v!3108 (underlying!436 thiss!992))))) lt!64312)))

(declare-fun b!125026 () Bool)

(declare-fun res!60541 () Bool)

(assert (=> b!125026 (=> (not res!60541) (not e!81698))))

(assert (=> b!125026 (= res!60541 (= (getValueByKey!167 (toList!831 lt!64312) (_1!1271 (tuple2!2521 lt!64125 (minValue!2628 (v!3108 (underlying!436 thiss!992)))))) (Some!172 (_2!1271 (tuple2!2521 lt!64125 (minValue!2628 (v!3108 (underlying!436 thiss!992))))))))))

(declare-fun b!125027 () Bool)

(assert (=> b!125027 (= e!81698 (contains!862 (toList!831 lt!64312) (tuple2!2521 lt!64125 (minValue!2628 (v!3108 (underlying!436 thiss!992))))))))

(assert (= (and d!37571 res!60540) b!125026))

(assert (= (and b!125026 res!60541) b!125027))

(declare-fun m!145221 () Bool)

(assert (=> d!37571 m!145221))

(declare-fun m!145223 () Bool)

(assert (=> d!37571 m!145223))

(declare-fun m!145225 () Bool)

(assert (=> d!37571 m!145225))

(declare-fun m!145227 () Bool)

(assert (=> d!37571 m!145227))

(declare-fun m!145229 () Bool)

(assert (=> b!125026 m!145229))

(declare-fun m!145231 () Bool)

(assert (=> b!125027 m!145231))

(assert (=> b!124704 d!37571))

(declare-fun d!37573 () Bool)

(assert (=> d!37573 (= (apply!110 (+!163 lt!64118 (tuple2!2521 lt!64124 (zeroValue!2628 (v!3108 (underlying!436 thiss!992))))) lt!64121) (get!1449 (getValueByKey!167 (toList!831 (+!163 lt!64118 (tuple2!2521 lt!64124 (zeroValue!2628 (v!3108 (underlying!436 thiss!992)))))) lt!64121)))))

(declare-fun bs!5176 () Bool)

(assert (= bs!5176 d!37573))

(declare-fun m!145233 () Bool)

(assert (=> bs!5176 m!145233))

(assert (=> bs!5176 m!145233))

(declare-fun m!145235 () Bool)

(assert (=> bs!5176 m!145235))

(assert (=> b!124704 d!37573))

(declare-fun d!37575 () Bool)

(assert (=> d!37575 (= (apply!110 lt!64118 lt!64121) (get!1449 (getValueByKey!167 (toList!831 lt!64118) lt!64121)))))

(declare-fun bs!5177 () Bool)

(assert (= bs!5177 d!37575))

(declare-fun m!145237 () Bool)

(assert (=> bs!5177 m!145237))

(assert (=> bs!5177 m!145237))

(declare-fun m!145239 () Bool)

(assert (=> bs!5177 m!145239))

(assert (=> b!124704 d!37575))

(declare-fun d!37577 () Bool)

(declare-fun e!81699 () Bool)

(assert (=> d!37577 e!81699))

(declare-fun res!60542 () Bool)

(assert (=> d!37577 (=> (not res!60542) (not e!81699))))

(declare-fun lt!64316 () ListLongMap!1631)

(assert (=> d!37577 (= res!60542 (contains!861 lt!64316 (_1!1271 (ite c!22717 (ite c!22710 (tuple2!2521 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2521 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun lt!64317 () List!1676)

(assert (=> d!37577 (= lt!64316 (ListLongMap!1632 lt!64317))))

(declare-fun lt!64318 () Unit!3871)

(declare-fun lt!64315 () Unit!3871)

(assert (=> d!37577 (= lt!64318 lt!64315)))

(assert (=> d!37577 (= (getValueByKey!167 lt!64317 (_1!1271 (ite c!22717 (ite c!22710 (tuple2!2521 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2521 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))) (Some!172 (_2!1271 (ite c!22717 (ite c!22710 (tuple2!2521 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2521 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!37577 (= lt!64315 (lemmaContainsTupThenGetReturnValue!82 lt!64317 (_1!1271 (ite c!22717 (ite c!22710 (tuple2!2521 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2521 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (_2!1271 (ite c!22717 (ite c!22710 (tuple2!2521 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2521 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!37577 (= lt!64317 (insertStrictlySorted!85 (toList!831 e!81592) (_1!1271 (ite c!22717 (ite c!22710 (tuple2!2521 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2521 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (_2!1271 (ite c!22717 (ite c!22710 (tuple2!2521 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2521 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!37577 (= (+!163 e!81592 (ite c!22717 (ite c!22710 (tuple2!2521 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2521 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) lt!64316)))

(declare-fun b!125028 () Bool)

(declare-fun res!60543 () Bool)

(assert (=> b!125028 (=> (not res!60543) (not e!81699))))

(assert (=> b!125028 (= res!60543 (= (getValueByKey!167 (toList!831 lt!64316) (_1!1271 (ite c!22717 (ite c!22710 (tuple2!2521 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2521 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))) (Some!172 (_2!1271 (ite c!22717 (ite c!22710 (tuple2!2521 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2521 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(declare-fun b!125029 () Bool)

(assert (=> b!125029 (= e!81699 (contains!862 (toList!831 lt!64316) (ite c!22717 (ite c!22710 (tuple2!2521 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2521 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (= (and d!37577 res!60542) b!125028))

(assert (= (and b!125028 res!60543) b!125029))

(declare-fun m!145241 () Bool)

(assert (=> d!37577 m!145241))

(declare-fun m!145243 () Bool)

(assert (=> d!37577 m!145243))

(declare-fun m!145245 () Bool)

(assert (=> d!37577 m!145245))

(declare-fun m!145247 () Bool)

(assert (=> d!37577 m!145247))

(declare-fun m!145249 () Bool)

(assert (=> b!125028 m!145249))

(declare-fun m!145251 () Bool)

(assert (=> b!125029 m!145251))

(assert (=> bm!13340 d!37577))

(declare-fun b!125038 () Bool)

(declare-fun e!81704 () (_ BitVec 32))

(declare-fun e!81705 () (_ BitVec 32))

(assert (=> b!125038 (= e!81704 e!81705)))

(declare-fun c!22767 () Bool)

(assert (=> b!125038 (= c!22767 (validKeyInArray!0 (select (arr!2210 (_keys!4492 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!125039 () Bool)

(declare-fun call!13361 () (_ BitVec 32))

(assert (=> b!125039 (= e!81705 (bvadd #b00000000000000000000000000000001 call!13361))))

(declare-fun b!125040 () Bool)

(assert (=> b!125040 (= e!81704 #b00000000000000000000000000000000)))

(declare-fun b!125041 () Bool)

(assert (=> b!125041 (= e!81705 call!13361)))

(declare-fun bm!13358 () Bool)

(assert (=> bm!13358 (= call!13361 (arrayCountValidKeys!0 (_keys!4492 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2473 (_keys!4492 newMap!16))))))

(declare-fun d!37579 () Bool)

(declare-fun lt!64321 () (_ BitVec 32))

(assert (=> d!37579 (and (bvsge lt!64321 #b00000000000000000000000000000000) (bvsle lt!64321 (bvsub (size!2473 (_keys!4492 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> d!37579 (= lt!64321 e!81704)))

(declare-fun c!22768 () Bool)

(assert (=> d!37579 (= c!22768 (bvsge #b00000000000000000000000000000000 (size!2473 (_keys!4492 newMap!16))))))

(assert (=> d!37579 (and (bvsle #b00000000000000000000000000000000 (size!2473 (_keys!4492 newMap!16))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!2473 (_keys!4492 newMap!16)) (size!2473 (_keys!4492 newMap!16))))))

(assert (=> d!37579 (= (arrayCountValidKeys!0 (_keys!4492 newMap!16) #b00000000000000000000000000000000 (size!2473 (_keys!4492 newMap!16))) lt!64321)))

(assert (= (and d!37579 c!22768) b!125040))

(assert (= (and d!37579 (not c!22768)) b!125038))

(assert (= (and b!125038 c!22767) b!125039))

(assert (= (and b!125038 (not c!22767)) b!125041))

(assert (= (or b!125039 b!125041) bm!13358))

(assert (=> b!125038 m!145113))

(assert (=> b!125038 m!145113))

(assert (=> b!125038 m!145115))

(declare-fun m!145253 () Bool)

(assert (=> bm!13358 m!145253))

(assert (=> b!124727 d!37579))

(declare-fun d!37581 () Bool)

(declare-fun e!81708 () Bool)

(assert (=> d!37581 e!81708))

(declare-fun res!60549 () Bool)

(assert (=> d!37581 (=> (not res!60549) (not e!81708))))

(declare-fun lt!64327 () SeekEntryResult!263)

(assert (=> d!37581 (= res!60549 ((_ is Found!263) lt!64327))))

(assert (=> d!37581 (= lt!64327 (seekEntryOrOpen!0 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355) (_keys!4492 newMap!16) (mask!7009 newMap!16)))))

(declare-fun lt!64326 () Unit!3871)

(declare-fun choose!757 (array!4667 array!4669 (_ BitVec 32) (_ BitVec 32) V!3425 V!3425 (_ BitVec 64) Int) Unit!3871)

(assert (=> d!37581 (= lt!64326 (choose!757 (_keys!4492 newMap!16) (_values!2746 newMap!16) (mask!7009 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355) (defaultEntry!2763 newMap!16)))))

(assert (=> d!37581 (validMask!0 (mask!7009 newMap!16))))

(assert (=> d!37581 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!55 (_keys!4492 newMap!16) (_values!2746 newMap!16) (mask!7009 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355) (defaultEntry!2763 newMap!16)) lt!64326)))

(declare-fun b!125046 () Bool)

(declare-fun res!60548 () Bool)

(assert (=> b!125046 (=> (not res!60548) (not e!81708))))

(assert (=> b!125046 (= res!60548 (inRange!0 (index!3207 lt!64327) (mask!7009 newMap!16)))))

(declare-fun b!125047 () Bool)

(assert (=> b!125047 (= e!81708 (= (select (arr!2210 (_keys!4492 newMap!16)) (index!3207 lt!64327)) (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355)))))

(assert (=> b!125047 (and (bvsge (index!3207 lt!64327) #b00000000000000000000000000000000) (bvslt (index!3207 lt!64327) (size!2473 (_keys!4492 newMap!16))))))

(assert (= (and d!37581 res!60549) b!125046))

(assert (= (and b!125046 res!60548) b!125047))

(assert (=> d!37581 m!144797))

(assert (=> d!37581 m!144977))

(assert (=> d!37581 m!144797))

(declare-fun m!145255 () Bool)

(assert (=> d!37581 m!145255))

(assert (=> d!37581 m!145065))

(declare-fun m!145257 () Bool)

(assert (=> b!125046 m!145257))

(declare-fun m!145259 () Bool)

(assert (=> b!125047 m!145259))

(assert (=> bm!13341 d!37581))

(declare-fun b!125058 () Bool)

(declare-fun e!81718 () Bool)

(declare-fun contains!863 (List!1677 (_ BitVec 64)) Bool)

(assert (=> b!125058 (= e!81718 (contains!863 Nil!1674 (select (arr!2210 (_keys!4492 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!125059 () Bool)

(declare-fun e!81717 () Bool)

(declare-fun call!13364 () Bool)

(assert (=> b!125059 (= e!81717 call!13364)))

(declare-fun bm!13361 () Bool)

(declare-fun c!22771 () Bool)

(assert (=> bm!13361 (= call!13364 (arrayNoDuplicates!0 (_keys!4492 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!22771 (Cons!1673 (select (arr!2210 (_keys!4492 newMap!16)) #b00000000000000000000000000000000) Nil!1674) Nil!1674)))))

(declare-fun b!125060 () Bool)

(declare-fun e!81720 () Bool)

(declare-fun e!81719 () Bool)

(assert (=> b!125060 (= e!81720 e!81719)))

(declare-fun res!60556 () Bool)

(assert (=> b!125060 (=> (not res!60556) (not e!81719))))

(assert (=> b!125060 (= res!60556 (not e!81718))))

(declare-fun res!60558 () Bool)

(assert (=> b!125060 (=> (not res!60558) (not e!81718))))

(assert (=> b!125060 (= res!60558 (validKeyInArray!0 (select (arr!2210 (_keys!4492 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun d!37583 () Bool)

(declare-fun res!60557 () Bool)

(assert (=> d!37583 (=> res!60557 e!81720)))

(assert (=> d!37583 (= res!60557 (bvsge #b00000000000000000000000000000000 (size!2473 (_keys!4492 newMap!16))))))

(assert (=> d!37583 (= (arrayNoDuplicates!0 (_keys!4492 newMap!16) #b00000000000000000000000000000000 Nil!1674) e!81720)))

(declare-fun b!125061 () Bool)

(assert (=> b!125061 (= e!81719 e!81717)))

(assert (=> b!125061 (= c!22771 (validKeyInArray!0 (select (arr!2210 (_keys!4492 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!125062 () Bool)

(assert (=> b!125062 (= e!81717 call!13364)))

(assert (= (and d!37583 (not res!60557)) b!125060))

(assert (= (and b!125060 res!60558) b!125058))

(assert (= (and b!125060 res!60556) b!125061))

(assert (= (and b!125061 c!22771) b!125059))

(assert (= (and b!125061 (not c!22771)) b!125062))

(assert (= (or b!125059 b!125062) bm!13361))

(assert (=> b!125058 m!145113))

(assert (=> b!125058 m!145113))

(declare-fun m!145261 () Bool)

(assert (=> b!125058 m!145261))

(assert (=> bm!13361 m!145113))

(declare-fun m!145263 () Bool)

(assert (=> bm!13361 m!145263))

(assert (=> b!125060 m!145113))

(assert (=> b!125060 m!145113))

(assert (=> b!125060 m!145115))

(assert (=> b!125061 m!145113))

(assert (=> b!125061 m!145113))

(assert (=> b!125061 m!145115))

(assert (=> b!124729 d!37583))

(declare-fun call!13371 () ListLongMap!1631)

(declare-fun c!22777 () Bool)

(declare-fun call!13370 () ListLongMap!1631)

(declare-fun call!13365 () ListLongMap!1631)

(declare-fun bm!13362 () Bool)

(declare-fun call!13367 () ListLongMap!1631)

(declare-fun c!22775 () Bool)

(assert (=> bm!13362 (= call!13365 (+!163 (ite c!22775 call!13370 (ite c!22777 call!13371 call!13367)) (ite (or c!22775 c!22777) (tuple2!2521 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2628 newMap!16)) (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 newMap!16)))))))

(declare-fun b!125063 () Bool)

(declare-fun e!81729 () Bool)

(declare-fun e!81722 () Bool)

(assert (=> b!125063 (= e!81729 e!81722)))

(declare-fun res!60559 () Bool)

(declare-fun call!13366 () Bool)

(assert (=> b!125063 (= res!60559 call!13366)))

(assert (=> b!125063 (=> (not res!60559) (not e!81722))))

(declare-fun bm!13363 () Bool)

(assert (=> bm!13363 (= call!13371 call!13370)))

(declare-fun e!81732 () Bool)

(declare-fun b!125065 () Bool)

(declare-fun lt!64329 () ListLongMap!1631)

(assert (=> b!125065 (= e!81732 (= (apply!110 lt!64329 (select (arr!2210 (_keys!4492 newMap!16)) #b00000000000000000000000000000000)) (get!1446 (select (arr!2211 (ite c!22717 (_values!2746 newMap!16) (array!4670 (store (arr!2211 (_values!2746 newMap!16)) (index!3207 lt!64214) (ValueCellFull!1073 (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2474 (_values!2746 newMap!16))))) #b00000000000000000000000000000000) (dynLambda!415 (defaultEntry!2763 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!125065 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2474 (ite c!22717 (_values!2746 newMap!16) (array!4670 (store (arr!2211 (_values!2746 newMap!16)) (index!3207 lt!64214) (ValueCellFull!1073 (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2474 (_values!2746 newMap!16)))))))))

(assert (=> b!125065 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2473 (_keys!4492 newMap!16))))))

(declare-fun bm!13364 () Bool)

(assert (=> bm!13364 (= call!13367 call!13371)))

(declare-fun b!125066 () Bool)

(declare-fun e!81723 () Bool)

(declare-fun e!81728 () Bool)

(assert (=> b!125066 (= e!81723 e!81728)))

(declare-fun res!60566 () Bool)

(declare-fun call!13369 () Bool)

(assert (=> b!125066 (= res!60566 call!13369)))

(assert (=> b!125066 (=> (not res!60566) (not e!81728))))

(declare-fun b!125067 () Bool)

(declare-fun e!81726 () Unit!3871)

(declare-fun lt!64340 () Unit!3871)

(assert (=> b!125067 (= e!81726 lt!64340)))

(declare-fun lt!64343 () ListLongMap!1631)

(assert (=> b!125067 (= lt!64343 (getCurrentListMapNoExtraKeys!130 (_keys!4492 newMap!16) (ite c!22717 (_values!2746 newMap!16) (array!4670 (store (arr!2211 (_values!2746 newMap!16)) (index!3207 lt!64214) (ValueCellFull!1073 (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2474 (_values!2746 newMap!16)))) (mask!7009 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16)))))

(declare-fun lt!64335 () (_ BitVec 64))

(assert (=> b!125067 (= lt!64335 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!64330 () (_ BitVec 64))

(assert (=> b!125067 (= lt!64330 (select (arr!2210 (_keys!4492 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!64333 () Unit!3871)

(assert (=> b!125067 (= lt!64333 (addStillContains!86 lt!64343 lt!64335 (zeroValue!2628 newMap!16) lt!64330))))

(assert (=> b!125067 (contains!861 (+!163 lt!64343 (tuple2!2521 lt!64335 (zeroValue!2628 newMap!16))) lt!64330)))

(declare-fun lt!64328 () Unit!3871)

(assert (=> b!125067 (= lt!64328 lt!64333)))

(declare-fun lt!64337 () ListLongMap!1631)

(assert (=> b!125067 (= lt!64337 (getCurrentListMapNoExtraKeys!130 (_keys!4492 newMap!16) (ite c!22717 (_values!2746 newMap!16) (array!4670 (store (arr!2211 (_values!2746 newMap!16)) (index!3207 lt!64214) (ValueCellFull!1073 (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2474 (_values!2746 newMap!16)))) (mask!7009 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16)))))

(declare-fun lt!64346 () (_ BitVec 64))

(assert (=> b!125067 (= lt!64346 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!64332 () (_ BitVec 64))

(assert (=> b!125067 (= lt!64332 (select (arr!2210 (_keys!4492 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!64334 () Unit!3871)

(assert (=> b!125067 (= lt!64334 (addApplyDifferent!86 lt!64337 lt!64346 (minValue!2628 newMap!16) lt!64332))))

(assert (=> b!125067 (= (apply!110 (+!163 lt!64337 (tuple2!2521 lt!64346 (minValue!2628 newMap!16))) lt!64332) (apply!110 lt!64337 lt!64332))))

(declare-fun lt!64347 () Unit!3871)

(assert (=> b!125067 (= lt!64347 lt!64334)))

(declare-fun lt!64339 () ListLongMap!1631)

(assert (=> b!125067 (= lt!64339 (getCurrentListMapNoExtraKeys!130 (_keys!4492 newMap!16) (ite c!22717 (_values!2746 newMap!16) (array!4670 (store (arr!2211 (_values!2746 newMap!16)) (index!3207 lt!64214) (ValueCellFull!1073 (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2474 (_values!2746 newMap!16)))) (mask!7009 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16)))))

(declare-fun lt!64345 () (_ BitVec 64))

(assert (=> b!125067 (= lt!64345 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!64342 () (_ BitVec 64))

(assert (=> b!125067 (= lt!64342 (select (arr!2210 (_keys!4492 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!64341 () Unit!3871)

(assert (=> b!125067 (= lt!64341 (addApplyDifferent!86 lt!64339 lt!64345 (zeroValue!2628 newMap!16) lt!64342))))

(assert (=> b!125067 (= (apply!110 (+!163 lt!64339 (tuple2!2521 lt!64345 (zeroValue!2628 newMap!16))) lt!64342) (apply!110 lt!64339 lt!64342))))

(declare-fun lt!64336 () Unit!3871)

(assert (=> b!125067 (= lt!64336 lt!64341)))

(declare-fun lt!64331 () ListLongMap!1631)

(assert (=> b!125067 (= lt!64331 (getCurrentListMapNoExtraKeys!130 (_keys!4492 newMap!16) (ite c!22717 (_values!2746 newMap!16) (array!4670 (store (arr!2211 (_values!2746 newMap!16)) (index!3207 lt!64214) (ValueCellFull!1073 (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2474 (_values!2746 newMap!16)))) (mask!7009 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16)))))

(declare-fun lt!64338 () (_ BitVec 64))

(assert (=> b!125067 (= lt!64338 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!64349 () (_ BitVec 64))

(assert (=> b!125067 (= lt!64349 (select (arr!2210 (_keys!4492 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!125067 (= lt!64340 (addApplyDifferent!86 lt!64331 lt!64338 (minValue!2628 newMap!16) lt!64349))))

(assert (=> b!125067 (= (apply!110 (+!163 lt!64331 (tuple2!2521 lt!64338 (minValue!2628 newMap!16))) lt!64349) (apply!110 lt!64331 lt!64349))))

(declare-fun b!125068 () Bool)

(declare-fun e!81724 () ListLongMap!1631)

(assert (=> b!125068 (= e!81724 call!13367)))

(declare-fun b!125069 () Bool)

(declare-fun e!81731 () Bool)

(assert (=> b!125069 (= e!81731 e!81723)))

(declare-fun c!22773 () Bool)

(assert (=> b!125069 (= c!22773 (not (= (bvand (extraKeys!2548 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!125070 () Bool)

(assert (=> b!125070 (= e!81729 (not call!13366))))

(declare-fun bm!13365 () Bool)

(assert (=> bm!13365 (= call!13369 (contains!861 lt!64329 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!125071 () Bool)

(declare-fun e!81727 () Bool)

(assert (=> b!125071 (= e!81727 (validKeyInArray!0 (select (arr!2210 (_keys!4492 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun d!37585 () Bool)

(assert (=> d!37585 e!81731))

(declare-fun res!60562 () Bool)

(assert (=> d!37585 (=> (not res!60562) (not e!81731))))

(assert (=> d!37585 (= res!60562 (or (bvsge #b00000000000000000000000000000000 (size!2473 (_keys!4492 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2473 (_keys!4492 newMap!16))))))))

(declare-fun lt!64344 () ListLongMap!1631)

(assert (=> d!37585 (= lt!64329 lt!64344)))

(declare-fun lt!64348 () Unit!3871)

(assert (=> d!37585 (= lt!64348 e!81726)))

(declare-fun c!22772 () Bool)

(declare-fun e!81733 () Bool)

(assert (=> d!37585 (= c!22772 e!81733)))

(declare-fun res!60564 () Bool)

(assert (=> d!37585 (=> (not res!60564) (not e!81733))))

(assert (=> d!37585 (= res!60564 (bvslt #b00000000000000000000000000000000 (size!2473 (_keys!4492 newMap!16))))))

(declare-fun e!81721 () ListLongMap!1631)

(assert (=> d!37585 (= lt!64344 e!81721)))

(assert (=> d!37585 (= c!22775 (and (not (= (bvand (extraKeys!2548 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2548 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!37585 (validMask!0 (mask!7009 newMap!16))))

(assert (=> d!37585 (= (getCurrentListMap!511 (_keys!4492 newMap!16) (ite c!22717 (_values!2746 newMap!16) (array!4670 (store (arr!2211 (_values!2746 newMap!16)) (index!3207 lt!64214) (ValueCellFull!1073 (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2474 (_values!2746 newMap!16)))) (mask!7009 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16)) lt!64329)))

(declare-fun b!125064 () Bool)

(assert (=> b!125064 (= e!81723 (not call!13369))))

(declare-fun bm!13366 () Bool)

(assert (=> bm!13366 (= call!13366 (contains!861 lt!64329 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!125072 () Bool)

(assert (=> b!125072 (= e!81733 (validKeyInArray!0 (select (arr!2210 (_keys!4492 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!125073 () Bool)

(assert (=> b!125073 (= e!81728 (= (apply!110 lt!64329 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2628 newMap!16)))))

(declare-fun b!125074 () Bool)

(assert (=> b!125074 (= e!81722 (= (apply!110 lt!64329 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2628 newMap!16)))))

(declare-fun b!125075 () Bool)

(declare-fun e!81725 () Bool)

(assert (=> b!125075 (= e!81725 e!81732)))

(declare-fun res!60560 () Bool)

(assert (=> b!125075 (=> (not res!60560) (not e!81732))))

(assert (=> b!125075 (= res!60560 (contains!861 lt!64329 (select (arr!2210 (_keys!4492 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!125075 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2473 (_keys!4492 newMap!16))))))

(declare-fun b!125076 () Bool)

(declare-fun e!81730 () ListLongMap!1631)

(assert (=> b!125076 (= e!81721 e!81730)))

(assert (=> b!125076 (= c!22777 (and (not (= (bvand (extraKeys!2548 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2548 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!125077 () Bool)

(declare-fun call!13368 () ListLongMap!1631)

(assert (=> b!125077 (= e!81724 call!13368)))

(declare-fun bm!13367 () Bool)

(assert (=> bm!13367 (= call!13370 (getCurrentListMapNoExtraKeys!130 (_keys!4492 newMap!16) (ite c!22717 (_values!2746 newMap!16) (array!4670 (store (arr!2211 (_values!2746 newMap!16)) (index!3207 lt!64214) (ValueCellFull!1073 (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2474 (_values!2746 newMap!16)))) (mask!7009 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16)))))

(declare-fun b!125078 () Bool)

(declare-fun res!60561 () Bool)

(assert (=> b!125078 (=> (not res!60561) (not e!81731))))

(assert (=> b!125078 (= res!60561 e!81725)))

(declare-fun res!60565 () Bool)

(assert (=> b!125078 (=> res!60565 e!81725)))

(assert (=> b!125078 (= res!60565 (not e!81727))))

(declare-fun res!60563 () Bool)

(assert (=> b!125078 (=> (not res!60563) (not e!81727))))

(assert (=> b!125078 (= res!60563 (bvslt #b00000000000000000000000000000000 (size!2473 (_keys!4492 newMap!16))))))

(declare-fun b!125079 () Bool)

(assert (=> b!125079 (= e!81730 call!13368)))

(declare-fun b!125080 () Bool)

(declare-fun Unit!3878 () Unit!3871)

(assert (=> b!125080 (= e!81726 Unit!3878)))

(declare-fun b!125081 () Bool)

(assert (=> b!125081 (= e!81721 (+!163 call!13365 (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 newMap!16))))))

(declare-fun b!125082 () Bool)

(declare-fun res!60567 () Bool)

(assert (=> b!125082 (=> (not res!60567) (not e!81731))))

(assert (=> b!125082 (= res!60567 e!81729)))

(declare-fun c!22774 () Bool)

(assert (=> b!125082 (= c!22774 (not (= (bvand (extraKeys!2548 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!13368 () Bool)

(assert (=> bm!13368 (= call!13368 call!13365)))

(declare-fun b!125083 () Bool)

(declare-fun c!22776 () Bool)

(assert (=> b!125083 (= c!22776 (and (not (= (bvand (extraKeys!2548 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2548 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!125083 (= e!81730 e!81724)))

(assert (= (and d!37585 c!22775) b!125081))

(assert (= (and d!37585 (not c!22775)) b!125076))

(assert (= (and b!125076 c!22777) b!125079))

(assert (= (and b!125076 (not c!22777)) b!125083))

(assert (= (and b!125083 c!22776) b!125077))

(assert (= (and b!125083 (not c!22776)) b!125068))

(assert (= (or b!125077 b!125068) bm!13364))

(assert (= (or b!125079 bm!13364) bm!13363))

(assert (= (or b!125079 b!125077) bm!13368))

(assert (= (or b!125081 bm!13363) bm!13367))

(assert (= (or b!125081 bm!13368) bm!13362))

(assert (= (and d!37585 res!60564) b!125072))

(assert (= (and d!37585 c!22772) b!125067))

(assert (= (and d!37585 (not c!22772)) b!125080))

(assert (= (and d!37585 res!60562) b!125078))

(assert (= (and b!125078 res!60563) b!125071))

(assert (= (and b!125078 (not res!60565)) b!125075))

(assert (= (and b!125075 res!60560) b!125065))

(assert (= (and b!125078 res!60561) b!125082))

(assert (= (and b!125082 c!22774) b!125063))

(assert (= (and b!125082 (not c!22774)) b!125070))

(assert (= (and b!125063 res!60559) b!125074))

(assert (= (or b!125063 b!125070) bm!13366))

(assert (= (and b!125082 res!60567) b!125069))

(assert (= (and b!125069 c!22773) b!125066))

(assert (= (and b!125069 (not c!22773)) b!125064))

(assert (= (and b!125066 res!60566) b!125073))

(assert (= (or b!125066 b!125064) bm!13365))

(declare-fun b_lambda!5491 () Bool)

(assert (=> (not b_lambda!5491) (not b!125065)))

(declare-fun tb!2293 () Bool)

(declare-fun t!6006 () Bool)

(assert (=> (and b!124545 (= (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) (defaultEntry!2763 newMap!16)) t!6006) tb!2293))

(declare-fun result!3815 () Bool)

(assert (=> tb!2293 (= result!3815 tp_is_empty!2833)))

(assert (=> b!125065 t!6006))

(declare-fun b_and!7685 () Bool)

(assert (= b_and!7681 (and (=> t!6006 result!3815) b_and!7685)))

(declare-fun t!6008 () Bool)

(declare-fun tb!2295 () Bool)

(assert (=> (and b!124538 (= (defaultEntry!2763 newMap!16) (defaultEntry!2763 newMap!16)) t!6008) tb!2295))

(declare-fun result!3817 () Bool)

(assert (= result!3817 result!3815))

(assert (=> b!125065 t!6008))

(declare-fun b_and!7687 () Bool)

(assert (= b_and!7683 (and (=> t!6008 result!3817) b_and!7687)))

(declare-fun m!145265 () Bool)

(assert (=> b!125073 m!145265))

(declare-fun m!145267 () Bool)

(assert (=> bm!13367 m!145267))

(declare-fun m!145269 () Bool)

(assert (=> b!125074 m!145269))

(declare-fun m!145271 () Bool)

(assert (=> b!125081 m!145271))

(declare-fun m!145273 () Bool)

(assert (=> bm!13366 m!145273))

(assert (=> b!125065 m!145113))

(declare-fun m!145275 () Bool)

(assert (=> b!125065 m!145275))

(assert (=> b!125065 m!145113))

(declare-fun m!145277 () Bool)

(assert (=> b!125065 m!145277))

(declare-fun m!145279 () Bool)

(assert (=> b!125065 m!145279))

(assert (=> b!125065 m!145279))

(assert (=> b!125065 m!145277))

(declare-fun m!145281 () Bool)

(assert (=> b!125065 m!145281))

(assert (=> b!125075 m!145113))

(assert (=> b!125075 m!145113))

(declare-fun m!145283 () Bool)

(assert (=> b!125075 m!145283))

(declare-fun m!145285 () Bool)

(assert (=> b!125067 m!145285))

(declare-fun m!145287 () Bool)

(assert (=> b!125067 m!145287))

(assert (=> b!125067 m!145267))

(declare-fun m!145289 () Bool)

(assert (=> b!125067 m!145289))

(declare-fun m!145291 () Bool)

(assert (=> b!125067 m!145291))

(declare-fun m!145293 () Bool)

(assert (=> b!125067 m!145293))

(assert (=> b!125067 m!145285))

(declare-fun m!145295 () Bool)

(assert (=> b!125067 m!145295))

(assert (=> b!125067 m!145289))

(declare-fun m!145297 () Bool)

(assert (=> b!125067 m!145297))

(declare-fun m!145299 () Bool)

(assert (=> b!125067 m!145299))

(declare-fun m!145301 () Bool)

(assert (=> b!125067 m!145301))

(declare-fun m!145303 () Bool)

(assert (=> b!125067 m!145303))

(declare-fun m!145305 () Bool)

(assert (=> b!125067 m!145305))

(declare-fun m!145307 () Bool)

(assert (=> b!125067 m!145307))

(declare-fun m!145309 () Bool)

(assert (=> b!125067 m!145309))

(declare-fun m!145311 () Bool)

(assert (=> b!125067 m!145311))

(assert (=> b!125067 m!145307))

(assert (=> b!125067 m!145301))

(declare-fun m!145313 () Bool)

(assert (=> b!125067 m!145313))

(assert (=> b!125067 m!145113))

(assert (=> b!125071 m!145113))

(assert (=> b!125071 m!145113))

(assert (=> b!125071 m!145115))

(declare-fun m!145315 () Bool)

(assert (=> bm!13365 m!145315))

(declare-fun m!145317 () Bool)

(assert (=> bm!13362 m!145317))

(assert (=> d!37585 m!145065))

(assert (=> b!125072 m!145113))

(assert (=> b!125072 m!145113))

(assert (=> b!125072 m!145115))

(assert (=> bm!13333 d!37585))

(declare-fun call!13377 () ListLongMap!1631)

(declare-fun bm!13369 () Bool)

(declare-fun call!13372 () ListLongMap!1631)

(declare-fun call!13378 () ListLongMap!1631)

(declare-fun c!22783 () Bool)

(declare-fun call!13374 () ListLongMap!1631)

(declare-fun c!22781 () Bool)

(assert (=> bm!13369 (= call!13372 (+!163 (ite c!22781 call!13377 (ite c!22783 call!13378 call!13374)) (ite (or c!22781 c!22783) (tuple2!2521 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2628 newMap!16)) (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 newMap!16)))))))

(declare-fun b!125084 () Bool)

(declare-fun e!81742 () Bool)

(declare-fun e!81735 () Bool)

(assert (=> b!125084 (= e!81742 e!81735)))

(declare-fun res!60568 () Bool)

(declare-fun call!13373 () Bool)

(assert (=> b!125084 (= res!60568 call!13373)))

(assert (=> b!125084 (=> (not res!60568) (not e!81735))))

(declare-fun bm!13370 () Bool)

(assert (=> bm!13370 (= call!13378 call!13377)))

(declare-fun b!125086 () Bool)

(declare-fun e!81745 () Bool)

(declare-fun lt!64351 () ListLongMap!1631)

(assert (=> b!125086 (= e!81745 (= (apply!110 lt!64351 (select (arr!2210 (_keys!4492 newMap!16)) #b00000000000000000000000000000000)) (get!1446 (select (arr!2211 (_values!2746 newMap!16)) #b00000000000000000000000000000000) (dynLambda!415 (defaultEntry!2763 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!125086 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2474 (_values!2746 newMap!16))))))

(assert (=> b!125086 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2473 (_keys!4492 newMap!16))))))

(declare-fun bm!13371 () Bool)

(assert (=> bm!13371 (= call!13374 call!13378)))

(declare-fun b!125087 () Bool)

(declare-fun e!81736 () Bool)

(declare-fun e!81741 () Bool)

(assert (=> b!125087 (= e!81736 e!81741)))

(declare-fun res!60575 () Bool)

(declare-fun call!13376 () Bool)

(assert (=> b!125087 (= res!60575 call!13376)))

(assert (=> b!125087 (=> (not res!60575) (not e!81741))))

(declare-fun b!125088 () Bool)

(declare-fun e!81739 () Unit!3871)

(declare-fun lt!64362 () Unit!3871)

(assert (=> b!125088 (= e!81739 lt!64362)))

(declare-fun lt!64365 () ListLongMap!1631)

(assert (=> b!125088 (= lt!64365 (getCurrentListMapNoExtraKeys!130 (_keys!4492 newMap!16) (_values!2746 newMap!16) (mask!7009 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16)))))

(declare-fun lt!64357 () (_ BitVec 64))

(assert (=> b!125088 (= lt!64357 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!64352 () (_ BitVec 64))

(assert (=> b!125088 (= lt!64352 (select (arr!2210 (_keys!4492 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!64355 () Unit!3871)

(assert (=> b!125088 (= lt!64355 (addStillContains!86 lt!64365 lt!64357 (zeroValue!2628 newMap!16) lt!64352))))

(assert (=> b!125088 (contains!861 (+!163 lt!64365 (tuple2!2521 lt!64357 (zeroValue!2628 newMap!16))) lt!64352)))

(declare-fun lt!64350 () Unit!3871)

(assert (=> b!125088 (= lt!64350 lt!64355)))

(declare-fun lt!64359 () ListLongMap!1631)

(assert (=> b!125088 (= lt!64359 (getCurrentListMapNoExtraKeys!130 (_keys!4492 newMap!16) (_values!2746 newMap!16) (mask!7009 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16)))))

(declare-fun lt!64368 () (_ BitVec 64))

(assert (=> b!125088 (= lt!64368 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!64354 () (_ BitVec 64))

(assert (=> b!125088 (= lt!64354 (select (arr!2210 (_keys!4492 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!64356 () Unit!3871)

(assert (=> b!125088 (= lt!64356 (addApplyDifferent!86 lt!64359 lt!64368 (minValue!2628 newMap!16) lt!64354))))

(assert (=> b!125088 (= (apply!110 (+!163 lt!64359 (tuple2!2521 lt!64368 (minValue!2628 newMap!16))) lt!64354) (apply!110 lt!64359 lt!64354))))

(declare-fun lt!64369 () Unit!3871)

(assert (=> b!125088 (= lt!64369 lt!64356)))

(declare-fun lt!64361 () ListLongMap!1631)

(assert (=> b!125088 (= lt!64361 (getCurrentListMapNoExtraKeys!130 (_keys!4492 newMap!16) (_values!2746 newMap!16) (mask!7009 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16)))))

(declare-fun lt!64367 () (_ BitVec 64))

(assert (=> b!125088 (= lt!64367 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!64364 () (_ BitVec 64))

(assert (=> b!125088 (= lt!64364 (select (arr!2210 (_keys!4492 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!64363 () Unit!3871)

(assert (=> b!125088 (= lt!64363 (addApplyDifferent!86 lt!64361 lt!64367 (zeroValue!2628 newMap!16) lt!64364))))

(assert (=> b!125088 (= (apply!110 (+!163 lt!64361 (tuple2!2521 lt!64367 (zeroValue!2628 newMap!16))) lt!64364) (apply!110 lt!64361 lt!64364))))

(declare-fun lt!64358 () Unit!3871)

(assert (=> b!125088 (= lt!64358 lt!64363)))

(declare-fun lt!64353 () ListLongMap!1631)

(assert (=> b!125088 (= lt!64353 (getCurrentListMapNoExtraKeys!130 (_keys!4492 newMap!16) (_values!2746 newMap!16) (mask!7009 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16)))))

(declare-fun lt!64360 () (_ BitVec 64))

(assert (=> b!125088 (= lt!64360 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!64371 () (_ BitVec 64))

(assert (=> b!125088 (= lt!64371 (select (arr!2210 (_keys!4492 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!125088 (= lt!64362 (addApplyDifferent!86 lt!64353 lt!64360 (minValue!2628 newMap!16) lt!64371))))

(assert (=> b!125088 (= (apply!110 (+!163 lt!64353 (tuple2!2521 lt!64360 (minValue!2628 newMap!16))) lt!64371) (apply!110 lt!64353 lt!64371))))

(declare-fun b!125089 () Bool)

(declare-fun e!81737 () ListLongMap!1631)

(assert (=> b!125089 (= e!81737 call!13374)))

(declare-fun b!125090 () Bool)

(declare-fun e!81744 () Bool)

(assert (=> b!125090 (= e!81744 e!81736)))

(declare-fun c!22779 () Bool)

(assert (=> b!125090 (= c!22779 (not (= (bvand (extraKeys!2548 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!125091 () Bool)

(assert (=> b!125091 (= e!81742 (not call!13373))))

(declare-fun bm!13372 () Bool)

(assert (=> bm!13372 (= call!13376 (contains!861 lt!64351 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!125092 () Bool)

(declare-fun e!81740 () Bool)

(assert (=> b!125092 (= e!81740 (validKeyInArray!0 (select (arr!2210 (_keys!4492 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun d!37587 () Bool)

(assert (=> d!37587 e!81744))

(declare-fun res!60571 () Bool)

(assert (=> d!37587 (=> (not res!60571) (not e!81744))))

(assert (=> d!37587 (= res!60571 (or (bvsge #b00000000000000000000000000000000 (size!2473 (_keys!4492 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2473 (_keys!4492 newMap!16))))))))

(declare-fun lt!64366 () ListLongMap!1631)

(assert (=> d!37587 (= lt!64351 lt!64366)))

(declare-fun lt!64370 () Unit!3871)

(assert (=> d!37587 (= lt!64370 e!81739)))

(declare-fun c!22778 () Bool)

(declare-fun e!81746 () Bool)

(assert (=> d!37587 (= c!22778 e!81746)))

(declare-fun res!60573 () Bool)

(assert (=> d!37587 (=> (not res!60573) (not e!81746))))

(assert (=> d!37587 (= res!60573 (bvslt #b00000000000000000000000000000000 (size!2473 (_keys!4492 newMap!16))))))

(declare-fun e!81734 () ListLongMap!1631)

(assert (=> d!37587 (= lt!64366 e!81734)))

(assert (=> d!37587 (= c!22781 (and (not (= (bvand (extraKeys!2548 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2548 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!37587 (validMask!0 (mask!7009 newMap!16))))

(assert (=> d!37587 (= (getCurrentListMap!511 (_keys!4492 newMap!16) (_values!2746 newMap!16) (mask!7009 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16)) lt!64351)))

(declare-fun b!125085 () Bool)

(assert (=> b!125085 (= e!81736 (not call!13376))))

(declare-fun bm!13373 () Bool)

(assert (=> bm!13373 (= call!13373 (contains!861 lt!64351 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!125093 () Bool)

(assert (=> b!125093 (= e!81746 (validKeyInArray!0 (select (arr!2210 (_keys!4492 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!125094 () Bool)

(assert (=> b!125094 (= e!81741 (= (apply!110 lt!64351 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2628 newMap!16)))))

(declare-fun b!125095 () Bool)

(assert (=> b!125095 (= e!81735 (= (apply!110 lt!64351 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2628 newMap!16)))))

(declare-fun b!125096 () Bool)

(declare-fun e!81738 () Bool)

(assert (=> b!125096 (= e!81738 e!81745)))

(declare-fun res!60569 () Bool)

(assert (=> b!125096 (=> (not res!60569) (not e!81745))))

(assert (=> b!125096 (= res!60569 (contains!861 lt!64351 (select (arr!2210 (_keys!4492 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!125096 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2473 (_keys!4492 newMap!16))))))

(declare-fun b!125097 () Bool)

(declare-fun e!81743 () ListLongMap!1631)

(assert (=> b!125097 (= e!81734 e!81743)))

(assert (=> b!125097 (= c!22783 (and (not (= (bvand (extraKeys!2548 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2548 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!125098 () Bool)

(declare-fun call!13375 () ListLongMap!1631)

(assert (=> b!125098 (= e!81737 call!13375)))

(declare-fun bm!13374 () Bool)

(assert (=> bm!13374 (= call!13377 (getCurrentListMapNoExtraKeys!130 (_keys!4492 newMap!16) (_values!2746 newMap!16) (mask!7009 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16)))))

(declare-fun b!125099 () Bool)

(declare-fun res!60570 () Bool)

(assert (=> b!125099 (=> (not res!60570) (not e!81744))))

(assert (=> b!125099 (= res!60570 e!81738)))

(declare-fun res!60574 () Bool)

(assert (=> b!125099 (=> res!60574 e!81738)))

(assert (=> b!125099 (= res!60574 (not e!81740))))

(declare-fun res!60572 () Bool)

(assert (=> b!125099 (=> (not res!60572) (not e!81740))))

(assert (=> b!125099 (= res!60572 (bvslt #b00000000000000000000000000000000 (size!2473 (_keys!4492 newMap!16))))))

(declare-fun b!125100 () Bool)

(assert (=> b!125100 (= e!81743 call!13375)))

(declare-fun b!125101 () Bool)

(declare-fun Unit!3879 () Unit!3871)

(assert (=> b!125101 (= e!81739 Unit!3879)))

(declare-fun b!125102 () Bool)

(assert (=> b!125102 (= e!81734 (+!163 call!13372 (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 newMap!16))))))

(declare-fun b!125103 () Bool)

(declare-fun res!60576 () Bool)

(assert (=> b!125103 (=> (not res!60576) (not e!81744))))

(assert (=> b!125103 (= res!60576 e!81742)))

(declare-fun c!22780 () Bool)

(assert (=> b!125103 (= c!22780 (not (= (bvand (extraKeys!2548 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!13375 () Bool)

(assert (=> bm!13375 (= call!13375 call!13372)))

(declare-fun b!125104 () Bool)

(declare-fun c!22782 () Bool)

(assert (=> b!125104 (= c!22782 (and (not (= (bvand (extraKeys!2548 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2548 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!125104 (= e!81743 e!81737)))

(assert (= (and d!37587 c!22781) b!125102))

(assert (= (and d!37587 (not c!22781)) b!125097))

(assert (= (and b!125097 c!22783) b!125100))

(assert (= (and b!125097 (not c!22783)) b!125104))

(assert (= (and b!125104 c!22782) b!125098))

(assert (= (and b!125104 (not c!22782)) b!125089))

(assert (= (or b!125098 b!125089) bm!13371))

(assert (= (or b!125100 bm!13371) bm!13370))

(assert (= (or b!125100 b!125098) bm!13375))

(assert (= (or b!125102 bm!13370) bm!13374))

(assert (= (or b!125102 bm!13375) bm!13369))

(assert (= (and d!37587 res!60573) b!125093))

(assert (= (and d!37587 c!22778) b!125088))

(assert (= (and d!37587 (not c!22778)) b!125101))

(assert (= (and d!37587 res!60571) b!125099))

(assert (= (and b!125099 res!60572) b!125092))

(assert (= (and b!125099 (not res!60574)) b!125096))

(assert (= (and b!125096 res!60569) b!125086))

(assert (= (and b!125099 res!60570) b!125103))

(assert (= (and b!125103 c!22780) b!125084))

(assert (= (and b!125103 (not c!22780)) b!125091))

(assert (= (and b!125084 res!60568) b!125095))

(assert (= (or b!125084 b!125091) bm!13373))

(assert (= (and b!125103 res!60576) b!125090))

(assert (= (and b!125090 c!22779) b!125087))

(assert (= (and b!125090 (not c!22779)) b!125085))

(assert (= (and b!125087 res!60575) b!125094))

(assert (= (or b!125087 b!125085) bm!13372))

(declare-fun b_lambda!5493 () Bool)

(assert (=> (not b_lambda!5493) (not b!125086)))

(assert (=> b!125086 t!6006))

(declare-fun b_and!7689 () Bool)

(assert (= b_and!7685 (and (=> t!6006 result!3815) b_and!7689)))

(assert (=> b!125086 t!6008))

(declare-fun b_and!7691 () Bool)

(assert (= b_and!7687 (and (=> t!6008 result!3817) b_and!7691)))

(declare-fun m!145319 () Bool)

(assert (=> b!125094 m!145319))

(declare-fun m!145321 () Bool)

(assert (=> bm!13374 m!145321))

(declare-fun m!145323 () Bool)

(assert (=> b!125095 m!145323))

(declare-fun m!145325 () Bool)

(assert (=> b!125102 m!145325))

(declare-fun m!145327 () Bool)

(assert (=> bm!13373 m!145327))

(assert (=> b!125086 m!145113))

(declare-fun m!145329 () Bool)

(assert (=> b!125086 m!145329))

(assert (=> b!125086 m!145113))

(assert (=> b!125086 m!145277))

(declare-fun m!145331 () Bool)

(assert (=> b!125086 m!145331))

(assert (=> b!125086 m!145331))

(assert (=> b!125086 m!145277))

(declare-fun m!145333 () Bool)

(assert (=> b!125086 m!145333))

(assert (=> b!125096 m!145113))

(assert (=> b!125096 m!145113))

(declare-fun m!145335 () Bool)

(assert (=> b!125096 m!145335))

(declare-fun m!145337 () Bool)

(assert (=> b!125088 m!145337))

(declare-fun m!145339 () Bool)

(assert (=> b!125088 m!145339))

(assert (=> b!125088 m!145321))

(declare-fun m!145341 () Bool)

(assert (=> b!125088 m!145341))

(declare-fun m!145343 () Bool)

(assert (=> b!125088 m!145343))

(declare-fun m!145345 () Bool)

(assert (=> b!125088 m!145345))

(assert (=> b!125088 m!145337))

(declare-fun m!145347 () Bool)

(assert (=> b!125088 m!145347))

(assert (=> b!125088 m!145341))

(declare-fun m!145349 () Bool)

(assert (=> b!125088 m!145349))

(declare-fun m!145351 () Bool)

(assert (=> b!125088 m!145351))

(declare-fun m!145353 () Bool)

(assert (=> b!125088 m!145353))

(declare-fun m!145355 () Bool)

(assert (=> b!125088 m!145355))

(declare-fun m!145357 () Bool)

(assert (=> b!125088 m!145357))

(declare-fun m!145359 () Bool)

(assert (=> b!125088 m!145359))

(declare-fun m!145361 () Bool)

(assert (=> b!125088 m!145361))

(declare-fun m!145363 () Bool)

(assert (=> b!125088 m!145363))

(assert (=> b!125088 m!145359))

(assert (=> b!125088 m!145353))

(declare-fun m!145365 () Bool)

(assert (=> b!125088 m!145365))

(assert (=> b!125088 m!145113))

(assert (=> b!125092 m!145113))

(assert (=> b!125092 m!145113))

(assert (=> b!125092 m!145115))

(declare-fun m!145367 () Bool)

(assert (=> bm!13372 m!145367))

(declare-fun m!145369 () Bool)

(assert (=> bm!13369 m!145369))

(assert (=> d!37587 m!145065))

(assert (=> b!125093 m!145113))

(assert (=> b!125093 m!145113))

(assert (=> b!125093 m!145115))

(assert (=> d!37499 d!37587))

(declare-fun d!37589 () Bool)

(declare-fun res!60581 () Bool)

(declare-fun e!81751 () Bool)

(assert (=> d!37589 (=> res!60581 e!81751)))

(assert (=> d!37589 (= res!60581 (= (select (arr!2210 (_keys!4492 newMap!16)) #b00000000000000000000000000000000) (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355)))))

(assert (=> d!37589 (= (arrayContainsKey!0 (_keys!4492 newMap!16) (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355) #b00000000000000000000000000000000) e!81751)))

(declare-fun b!125109 () Bool)

(declare-fun e!81752 () Bool)

(assert (=> b!125109 (= e!81751 e!81752)))

(declare-fun res!60582 () Bool)

(assert (=> b!125109 (=> (not res!60582) (not e!81752))))

(assert (=> b!125109 (= res!60582 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2473 (_keys!4492 newMap!16))))))

(declare-fun b!125110 () Bool)

(assert (=> b!125110 (= e!81752 (arrayContainsKey!0 (_keys!4492 newMap!16) (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!37589 (not res!60581)) b!125109))

(assert (= (and b!125109 res!60582) b!125110))

(assert (=> d!37589 m!145113))

(assert (=> b!125110 m!144797))

(declare-fun m!145371 () Bool)

(assert (=> b!125110 m!145371))

(assert (=> bm!13334 d!37589))

(declare-fun d!37591 () Bool)

(declare-fun e!81753 () Bool)

(assert (=> d!37591 e!81753))

(declare-fun res!60583 () Bool)

(assert (=> d!37591 (=> res!60583 e!81753)))

(declare-fun lt!64372 () Bool)

(assert (=> d!37591 (= res!60583 (not lt!64372))))

(declare-fun lt!64375 () Bool)

(assert (=> d!37591 (= lt!64372 lt!64375)))

(declare-fun lt!64374 () Unit!3871)

(declare-fun e!81754 () Unit!3871)

(assert (=> d!37591 (= lt!64374 e!81754)))

(declare-fun c!22784 () Bool)

(assert (=> d!37591 (= c!22784 lt!64375)))

(assert (=> d!37591 (= lt!64375 (containsKey!170 (toList!831 lt!64108) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!37591 (= (contains!861 lt!64108 #b1000000000000000000000000000000000000000000000000000000000000000) lt!64372)))

(declare-fun b!125111 () Bool)

(declare-fun lt!64373 () Unit!3871)

(assert (=> b!125111 (= e!81754 lt!64373)))

(assert (=> b!125111 (= lt!64373 (lemmaContainsKeyImpliesGetValueByKeyDefined!118 (toList!831 lt!64108) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!125111 (isDefined!119 (getValueByKey!167 (toList!831 lt!64108) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!125112 () Bool)

(declare-fun Unit!3880 () Unit!3871)

(assert (=> b!125112 (= e!81754 Unit!3880)))

(declare-fun b!125113 () Bool)

(assert (=> b!125113 (= e!81753 (isDefined!119 (getValueByKey!167 (toList!831 lt!64108) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!37591 c!22784) b!125111))

(assert (= (and d!37591 (not c!22784)) b!125112))

(assert (= (and d!37591 (not res!60583)) b!125113))

(declare-fun m!145373 () Bool)

(assert (=> d!37591 m!145373))

(declare-fun m!145375 () Bool)

(assert (=> b!125111 m!145375))

(declare-fun m!145377 () Bool)

(assert (=> b!125111 m!145377))

(assert (=> b!125111 m!145377))

(declare-fun m!145379 () Bool)

(assert (=> b!125111 m!145379))

(assert (=> b!125113 m!145377))

(assert (=> b!125113 m!145377))

(assert (=> b!125113 m!145379))

(assert (=> bm!13268 d!37591))

(declare-fun d!37593 () Bool)

(declare-fun res!60584 () Bool)

(declare-fun e!81755 () Bool)

(assert (=> d!37593 (=> (not res!60584) (not e!81755))))

(assert (=> d!37593 (= res!60584 (simpleValid!86 (_2!1272 lt!64219)))))

(assert (=> d!37593 (= (valid!515 (_2!1272 lt!64219)) e!81755)))

(declare-fun b!125114 () Bool)

(declare-fun res!60585 () Bool)

(assert (=> b!125114 (=> (not res!60585) (not e!81755))))

(assert (=> b!125114 (= res!60585 (= (arrayCountValidKeys!0 (_keys!4492 (_2!1272 lt!64219)) #b00000000000000000000000000000000 (size!2473 (_keys!4492 (_2!1272 lt!64219)))) (_size!576 (_2!1272 lt!64219))))))

(declare-fun b!125115 () Bool)

(declare-fun res!60586 () Bool)

(assert (=> b!125115 (=> (not res!60586) (not e!81755))))

(assert (=> b!125115 (= res!60586 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4492 (_2!1272 lt!64219)) (mask!7009 (_2!1272 lt!64219))))))

(declare-fun b!125116 () Bool)

(assert (=> b!125116 (= e!81755 (arrayNoDuplicates!0 (_keys!4492 (_2!1272 lt!64219)) #b00000000000000000000000000000000 Nil!1674))))

(assert (= (and d!37593 res!60584) b!125114))

(assert (= (and b!125114 res!60585) b!125115))

(assert (= (and b!125115 res!60586) b!125116))

(declare-fun m!145381 () Bool)

(assert (=> d!37593 m!145381))

(declare-fun m!145383 () Bool)

(assert (=> b!125114 m!145383))

(declare-fun m!145385 () Bool)

(assert (=> b!125115 m!145385))

(declare-fun m!145387 () Bool)

(assert (=> b!125116 m!145387))

(assert (=> d!37513 d!37593))

(assert (=> d!37513 d!37503))

(declare-fun d!37595 () Bool)

(declare-fun e!81756 () Bool)

(assert (=> d!37595 e!81756))

(declare-fun res!60587 () Bool)

(assert (=> d!37595 (=> res!60587 e!81756)))

(declare-fun lt!64376 () Bool)

(assert (=> d!37595 (= res!60587 (not lt!64376))))

(declare-fun lt!64379 () Bool)

(assert (=> d!37595 (= lt!64376 lt!64379)))

(declare-fun lt!64378 () Unit!3871)

(declare-fun e!81757 () Unit!3871)

(assert (=> d!37595 (= lt!64378 e!81757)))

(declare-fun c!22785 () Bool)

(assert (=> d!37595 (= c!22785 lt!64379)))

(assert (=> d!37595 (= lt!64379 (containsKey!170 (toList!831 call!13330) (ite c!22712 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355) (select (arr!2210 (_keys!4492 newMap!16)) (index!3207 lt!64214)))))))

(assert (=> d!37595 (= (contains!861 call!13330 (ite c!22712 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355) (select (arr!2210 (_keys!4492 newMap!16)) (index!3207 lt!64214)))) lt!64376)))

(declare-fun b!125117 () Bool)

(declare-fun lt!64377 () Unit!3871)

(assert (=> b!125117 (= e!81757 lt!64377)))

(assert (=> b!125117 (= lt!64377 (lemmaContainsKeyImpliesGetValueByKeyDefined!118 (toList!831 call!13330) (ite c!22712 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355) (select (arr!2210 (_keys!4492 newMap!16)) (index!3207 lt!64214)))))))

(assert (=> b!125117 (isDefined!119 (getValueByKey!167 (toList!831 call!13330) (ite c!22712 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355) (select (arr!2210 (_keys!4492 newMap!16)) (index!3207 lt!64214)))))))

(declare-fun b!125118 () Bool)

(declare-fun Unit!3881 () Unit!3871)

(assert (=> b!125118 (= e!81757 Unit!3881)))

(declare-fun b!125119 () Bool)

(assert (=> b!125119 (= e!81756 (isDefined!119 (getValueByKey!167 (toList!831 call!13330) (ite c!22712 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355) (select (arr!2210 (_keys!4492 newMap!16)) (index!3207 lt!64214))))))))

(assert (= (and d!37595 c!22785) b!125117))

(assert (= (and d!37595 (not c!22785)) b!125118))

(assert (= (and d!37595 (not res!60587)) b!125119))

(declare-fun m!145389 () Bool)

(assert (=> d!37595 m!145389))

(declare-fun m!145391 () Bool)

(assert (=> b!125117 m!145391))

(declare-fun m!145393 () Bool)

(assert (=> b!125117 m!145393))

(assert (=> b!125117 m!145393))

(declare-fun m!145395 () Bool)

(assert (=> b!125117 m!145395))

(assert (=> b!125119 m!145393))

(assert (=> b!125119 m!145393))

(assert (=> b!125119 m!145395))

(assert (=> bm!13335 d!37595))

(declare-fun d!37597 () Bool)

(assert (=> d!37597 (= (validKeyInArray!0 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (and (not (= (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!124708 d!37597))

(assert (=> bm!13342 d!37499))

(assert (=> b!124709 d!37597))

(declare-fun call!13379 () ListLongMap!1631)

(declare-fun call!13385 () ListLongMap!1631)

(declare-fun c!22791 () Bool)

(declare-fun call!13381 () ListLongMap!1631)

(declare-fun c!22789 () Bool)

(declare-fun call!13384 () ListLongMap!1631)

(declare-fun bm!13376 () Bool)

(assert (=> bm!13376 (= call!13379 (+!163 (ite c!22789 call!13384 (ite c!22791 call!13385 call!13381)) (ite (or c!22789 c!22791) (tuple2!2521 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (and c!22717 c!22710) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2628 newMap!16))) (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!22717 (ite c!22710 (minValue!2628 newMap!16) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2628 newMap!16))))))))

(declare-fun b!125120 () Bool)

(declare-fun e!81766 () Bool)

(declare-fun e!81759 () Bool)

(assert (=> b!125120 (= e!81766 e!81759)))

(declare-fun res!60588 () Bool)

(declare-fun call!13380 () Bool)

(assert (=> b!125120 (= res!60588 call!13380)))

(assert (=> b!125120 (=> (not res!60588) (not e!81759))))

(declare-fun bm!13377 () Bool)

(assert (=> bm!13377 (= call!13385 call!13384)))

(declare-fun e!81769 () Bool)

(declare-fun b!125122 () Bool)

(declare-fun lt!64381 () ListLongMap!1631)

(assert (=> b!125122 (= e!81769 (= (apply!110 lt!64381 (select (arr!2210 (_keys!4492 newMap!16)) #b00000000000000000000000000000000)) (get!1446 (select (arr!2211 (ite (or c!22717 c!22712) (_values!2746 newMap!16) lt!64198)) #b00000000000000000000000000000000) (dynLambda!415 (defaultEntry!2763 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!125122 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2474 (ite (or c!22717 c!22712) (_values!2746 newMap!16) lt!64198))))))

(assert (=> b!125122 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2473 (_keys!4492 newMap!16))))))

(declare-fun bm!13378 () Bool)

(assert (=> bm!13378 (= call!13381 call!13385)))

(declare-fun b!125123 () Bool)

(declare-fun e!81760 () Bool)

(declare-fun e!81765 () Bool)

(assert (=> b!125123 (= e!81760 e!81765)))

(declare-fun res!60595 () Bool)

(declare-fun call!13383 () Bool)

(assert (=> b!125123 (= res!60595 call!13383)))

(assert (=> b!125123 (=> (not res!60595) (not e!81765))))

(declare-fun b!125124 () Bool)

(declare-fun e!81763 () Unit!3871)

(declare-fun lt!64392 () Unit!3871)

(assert (=> b!125124 (= e!81763 lt!64392)))

(declare-fun lt!64395 () ListLongMap!1631)

(assert (=> b!125124 (= lt!64395 (getCurrentListMapNoExtraKeys!130 (_keys!4492 newMap!16) (ite (or c!22717 c!22712) (_values!2746 newMap!16) lt!64198) (mask!7009 newMap!16) (ite c!22717 (ite c!22710 lt!64209 lt!64205) (extraKeys!2548 newMap!16)) (ite (and c!22717 c!22710) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2628 newMap!16)) (ite c!22717 (ite c!22710 (minValue!2628 newMap!16) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2628 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16)))))

(declare-fun lt!64387 () (_ BitVec 64))

(assert (=> b!125124 (= lt!64387 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!64382 () (_ BitVec 64))

(assert (=> b!125124 (= lt!64382 (select (arr!2210 (_keys!4492 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!64385 () Unit!3871)

(assert (=> b!125124 (= lt!64385 (addStillContains!86 lt!64395 lt!64387 (ite (and c!22717 c!22710) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2628 newMap!16)) lt!64382))))

(assert (=> b!125124 (contains!861 (+!163 lt!64395 (tuple2!2521 lt!64387 (ite (and c!22717 c!22710) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2628 newMap!16)))) lt!64382)))

(declare-fun lt!64380 () Unit!3871)

(assert (=> b!125124 (= lt!64380 lt!64385)))

(declare-fun lt!64389 () ListLongMap!1631)

(assert (=> b!125124 (= lt!64389 (getCurrentListMapNoExtraKeys!130 (_keys!4492 newMap!16) (ite (or c!22717 c!22712) (_values!2746 newMap!16) lt!64198) (mask!7009 newMap!16) (ite c!22717 (ite c!22710 lt!64209 lt!64205) (extraKeys!2548 newMap!16)) (ite (and c!22717 c!22710) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2628 newMap!16)) (ite c!22717 (ite c!22710 (minValue!2628 newMap!16) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2628 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16)))))

(declare-fun lt!64398 () (_ BitVec 64))

(assert (=> b!125124 (= lt!64398 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!64384 () (_ BitVec 64))

(assert (=> b!125124 (= lt!64384 (select (arr!2210 (_keys!4492 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!64386 () Unit!3871)

(assert (=> b!125124 (= lt!64386 (addApplyDifferent!86 lt!64389 lt!64398 (ite c!22717 (ite c!22710 (minValue!2628 newMap!16) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2628 newMap!16)) lt!64384))))

(assert (=> b!125124 (= (apply!110 (+!163 lt!64389 (tuple2!2521 lt!64398 (ite c!22717 (ite c!22710 (minValue!2628 newMap!16) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2628 newMap!16)))) lt!64384) (apply!110 lt!64389 lt!64384))))

(declare-fun lt!64399 () Unit!3871)

(assert (=> b!125124 (= lt!64399 lt!64386)))

(declare-fun lt!64391 () ListLongMap!1631)

(assert (=> b!125124 (= lt!64391 (getCurrentListMapNoExtraKeys!130 (_keys!4492 newMap!16) (ite (or c!22717 c!22712) (_values!2746 newMap!16) lt!64198) (mask!7009 newMap!16) (ite c!22717 (ite c!22710 lt!64209 lt!64205) (extraKeys!2548 newMap!16)) (ite (and c!22717 c!22710) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2628 newMap!16)) (ite c!22717 (ite c!22710 (minValue!2628 newMap!16) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2628 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16)))))

(declare-fun lt!64397 () (_ BitVec 64))

(assert (=> b!125124 (= lt!64397 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!64394 () (_ BitVec 64))

(assert (=> b!125124 (= lt!64394 (select (arr!2210 (_keys!4492 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!64393 () Unit!3871)

(assert (=> b!125124 (= lt!64393 (addApplyDifferent!86 lt!64391 lt!64397 (ite (and c!22717 c!22710) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2628 newMap!16)) lt!64394))))

(assert (=> b!125124 (= (apply!110 (+!163 lt!64391 (tuple2!2521 lt!64397 (ite (and c!22717 c!22710) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2628 newMap!16)))) lt!64394) (apply!110 lt!64391 lt!64394))))

(declare-fun lt!64388 () Unit!3871)

(assert (=> b!125124 (= lt!64388 lt!64393)))

(declare-fun lt!64383 () ListLongMap!1631)

(assert (=> b!125124 (= lt!64383 (getCurrentListMapNoExtraKeys!130 (_keys!4492 newMap!16) (ite (or c!22717 c!22712) (_values!2746 newMap!16) lt!64198) (mask!7009 newMap!16) (ite c!22717 (ite c!22710 lt!64209 lt!64205) (extraKeys!2548 newMap!16)) (ite (and c!22717 c!22710) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2628 newMap!16)) (ite c!22717 (ite c!22710 (minValue!2628 newMap!16) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2628 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16)))))

(declare-fun lt!64390 () (_ BitVec 64))

(assert (=> b!125124 (= lt!64390 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!64401 () (_ BitVec 64))

(assert (=> b!125124 (= lt!64401 (select (arr!2210 (_keys!4492 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!125124 (= lt!64392 (addApplyDifferent!86 lt!64383 lt!64390 (ite c!22717 (ite c!22710 (minValue!2628 newMap!16) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2628 newMap!16)) lt!64401))))

(assert (=> b!125124 (= (apply!110 (+!163 lt!64383 (tuple2!2521 lt!64390 (ite c!22717 (ite c!22710 (minValue!2628 newMap!16) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2628 newMap!16)))) lt!64401) (apply!110 lt!64383 lt!64401))))

(declare-fun b!125125 () Bool)

(declare-fun e!81761 () ListLongMap!1631)

(assert (=> b!125125 (= e!81761 call!13381)))

(declare-fun b!125126 () Bool)

(declare-fun e!81768 () Bool)

(assert (=> b!125126 (= e!81768 e!81760)))

(declare-fun c!22787 () Bool)

(assert (=> b!125126 (= c!22787 (not (= (bvand (ite c!22717 (ite c!22710 lt!64209 lt!64205) (extraKeys!2548 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!125127 () Bool)

(assert (=> b!125127 (= e!81766 (not call!13380))))

(declare-fun bm!13379 () Bool)

(assert (=> bm!13379 (= call!13383 (contains!861 lt!64381 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!125128 () Bool)

(declare-fun e!81764 () Bool)

(assert (=> b!125128 (= e!81764 (validKeyInArray!0 (select (arr!2210 (_keys!4492 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun d!37599 () Bool)

(assert (=> d!37599 e!81768))

(declare-fun res!60591 () Bool)

(assert (=> d!37599 (=> (not res!60591) (not e!81768))))

(assert (=> d!37599 (= res!60591 (or (bvsge #b00000000000000000000000000000000 (size!2473 (_keys!4492 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2473 (_keys!4492 newMap!16))))))))

(declare-fun lt!64396 () ListLongMap!1631)

(assert (=> d!37599 (= lt!64381 lt!64396)))

(declare-fun lt!64400 () Unit!3871)

(assert (=> d!37599 (= lt!64400 e!81763)))

(declare-fun c!22786 () Bool)

(declare-fun e!81770 () Bool)

(assert (=> d!37599 (= c!22786 e!81770)))

(declare-fun res!60593 () Bool)

(assert (=> d!37599 (=> (not res!60593) (not e!81770))))

(assert (=> d!37599 (= res!60593 (bvslt #b00000000000000000000000000000000 (size!2473 (_keys!4492 newMap!16))))))

(declare-fun e!81758 () ListLongMap!1631)

(assert (=> d!37599 (= lt!64396 e!81758)))

(assert (=> d!37599 (= c!22789 (and (not (= (bvand (ite c!22717 (ite c!22710 lt!64209 lt!64205) (extraKeys!2548 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (ite c!22717 (ite c!22710 lt!64209 lt!64205) (extraKeys!2548 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!37599 (validMask!0 (mask!7009 newMap!16))))

(assert (=> d!37599 (= (getCurrentListMap!511 (_keys!4492 newMap!16) (ite (or c!22717 c!22712) (_values!2746 newMap!16) lt!64198) (mask!7009 newMap!16) (ite c!22717 (ite c!22710 lt!64209 lt!64205) (extraKeys!2548 newMap!16)) (ite (and c!22717 c!22710) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2628 newMap!16)) (ite c!22717 (ite c!22710 (minValue!2628 newMap!16) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2628 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16)) lt!64381)))

(declare-fun b!125121 () Bool)

(assert (=> b!125121 (= e!81760 (not call!13383))))

(declare-fun bm!13380 () Bool)

(assert (=> bm!13380 (= call!13380 (contains!861 lt!64381 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!125129 () Bool)

(assert (=> b!125129 (= e!81770 (validKeyInArray!0 (select (arr!2210 (_keys!4492 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!125130 () Bool)

(assert (=> b!125130 (= e!81765 (= (apply!110 lt!64381 #b1000000000000000000000000000000000000000000000000000000000000000) (ite c!22717 (ite c!22710 (minValue!2628 newMap!16) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2628 newMap!16))))))

(declare-fun b!125131 () Bool)

(assert (=> b!125131 (= e!81759 (= (apply!110 lt!64381 #b0000000000000000000000000000000000000000000000000000000000000000) (ite (and c!22717 c!22710) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2628 newMap!16))))))

(declare-fun b!125132 () Bool)

(declare-fun e!81762 () Bool)

(assert (=> b!125132 (= e!81762 e!81769)))

(declare-fun res!60589 () Bool)

(assert (=> b!125132 (=> (not res!60589) (not e!81769))))

(assert (=> b!125132 (= res!60589 (contains!861 lt!64381 (select (arr!2210 (_keys!4492 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!125132 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2473 (_keys!4492 newMap!16))))))

(declare-fun b!125133 () Bool)

(declare-fun e!81767 () ListLongMap!1631)

(assert (=> b!125133 (= e!81758 e!81767)))

(assert (=> b!125133 (= c!22791 (and (not (= (bvand (ite c!22717 (ite c!22710 lt!64209 lt!64205) (extraKeys!2548 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (ite c!22717 (ite c!22710 lt!64209 lt!64205) (extraKeys!2548 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!125134 () Bool)

(declare-fun call!13382 () ListLongMap!1631)

(assert (=> b!125134 (= e!81761 call!13382)))

(declare-fun bm!13381 () Bool)

(assert (=> bm!13381 (= call!13384 (getCurrentListMapNoExtraKeys!130 (_keys!4492 newMap!16) (ite (or c!22717 c!22712) (_values!2746 newMap!16) lt!64198) (mask!7009 newMap!16) (ite c!22717 (ite c!22710 lt!64209 lt!64205) (extraKeys!2548 newMap!16)) (ite (and c!22717 c!22710) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2628 newMap!16)) (ite c!22717 (ite c!22710 (minValue!2628 newMap!16) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2628 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16)))))

(declare-fun b!125135 () Bool)

(declare-fun res!60590 () Bool)

(assert (=> b!125135 (=> (not res!60590) (not e!81768))))

(assert (=> b!125135 (= res!60590 e!81762)))

(declare-fun res!60594 () Bool)

(assert (=> b!125135 (=> res!60594 e!81762)))

(assert (=> b!125135 (= res!60594 (not e!81764))))

(declare-fun res!60592 () Bool)

(assert (=> b!125135 (=> (not res!60592) (not e!81764))))

(assert (=> b!125135 (= res!60592 (bvslt #b00000000000000000000000000000000 (size!2473 (_keys!4492 newMap!16))))))

(declare-fun b!125136 () Bool)

(assert (=> b!125136 (= e!81767 call!13382)))

(declare-fun b!125137 () Bool)

(declare-fun Unit!3882 () Unit!3871)

(assert (=> b!125137 (= e!81763 Unit!3882)))

(declare-fun b!125138 () Bool)

(assert (=> b!125138 (= e!81758 (+!163 call!13379 (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!22717 (ite c!22710 (minValue!2628 newMap!16) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2628 newMap!16)))))))

(declare-fun b!125139 () Bool)

(declare-fun res!60596 () Bool)

(assert (=> b!125139 (=> (not res!60596) (not e!81768))))

(assert (=> b!125139 (= res!60596 e!81766)))

(declare-fun c!22788 () Bool)

(assert (=> b!125139 (= c!22788 (not (= (bvand (ite c!22717 (ite c!22710 lt!64209 lt!64205) (extraKeys!2548 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!13382 () Bool)

(assert (=> bm!13382 (= call!13382 call!13379)))

(declare-fun c!22790 () Bool)

(declare-fun b!125140 () Bool)

(assert (=> b!125140 (= c!22790 (and (not (= (bvand (ite c!22717 (ite c!22710 lt!64209 lt!64205) (extraKeys!2548 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (ite c!22717 (ite c!22710 lt!64209 lt!64205) (extraKeys!2548 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!125140 (= e!81767 e!81761)))

(assert (= (and d!37599 c!22789) b!125138))

(assert (= (and d!37599 (not c!22789)) b!125133))

(assert (= (and b!125133 c!22791) b!125136))

(assert (= (and b!125133 (not c!22791)) b!125140))

(assert (= (and b!125140 c!22790) b!125134))

(assert (= (and b!125140 (not c!22790)) b!125125))

(assert (= (or b!125134 b!125125) bm!13378))

(assert (= (or b!125136 bm!13378) bm!13377))

(assert (= (or b!125136 b!125134) bm!13382))

(assert (= (or b!125138 bm!13377) bm!13381))

(assert (= (or b!125138 bm!13382) bm!13376))

(assert (= (and d!37599 res!60593) b!125129))

(assert (= (and d!37599 c!22786) b!125124))

(assert (= (and d!37599 (not c!22786)) b!125137))

(assert (= (and d!37599 res!60591) b!125135))

(assert (= (and b!125135 res!60592) b!125128))

(assert (= (and b!125135 (not res!60594)) b!125132))

(assert (= (and b!125132 res!60589) b!125122))

(assert (= (and b!125135 res!60590) b!125139))

(assert (= (and b!125139 c!22788) b!125120))

(assert (= (and b!125139 (not c!22788)) b!125127))

(assert (= (and b!125120 res!60588) b!125131))

(assert (= (or b!125120 b!125127) bm!13380))

(assert (= (and b!125139 res!60596) b!125126))

(assert (= (and b!125126 c!22787) b!125123))

(assert (= (and b!125126 (not c!22787)) b!125121))

(assert (= (and b!125123 res!60595) b!125130))

(assert (= (or b!125123 b!125121) bm!13379))

(declare-fun b_lambda!5495 () Bool)

(assert (=> (not b_lambda!5495) (not b!125122)))

(assert (=> b!125122 t!6006))

(declare-fun b_and!7693 () Bool)

(assert (= b_and!7689 (and (=> t!6006 result!3815) b_and!7693)))

(assert (=> b!125122 t!6008))

(declare-fun b_and!7695 () Bool)

(assert (= b_and!7691 (and (=> t!6008 result!3817) b_and!7695)))

(declare-fun m!145397 () Bool)

(assert (=> b!125130 m!145397))

(declare-fun m!145399 () Bool)

(assert (=> bm!13381 m!145399))

(declare-fun m!145401 () Bool)

(assert (=> b!125131 m!145401))

(declare-fun m!145403 () Bool)

(assert (=> b!125138 m!145403))

(declare-fun m!145405 () Bool)

(assert (=> bm!13380 m!145405))

(assert (=> b!125122 m!145113))

(declare-fun m!145407 () Bool)

(assert (=> b!125122 m!145407))

(assert (=> b!125122 m!145113))

(assert (=> b!125122 m!145277))

(declare-fun m!145409 () Bool)

(assert (=> b!125122 m!145409))

(assert (=> b!125122 m!145409))

(assert (=> b!125122 m!145277))

(declare-fun m!145411 () Bool)

(assert (=> b!125122 m!145411))

(assert (=> b!125132 m!145113))

(assert (=> b!125132 m!145113))

(declare-fun m!145413 () Bool)

(assert (=> b!125132 m!145413))

(declare-fun m!145415 () Bool)

(assert (=> b!125124 m!145415))

(declare-fun m!145417 () Bool)

(assert (=> b!125124 m!145417))

(assert (=> b!125124 m!145399))

(declare-fun m!145419 () Bool)

(assert (=> b!125124 m!145419))

(declare-fun m!145421 () Bool)

(assert (=> b!125124 m!145421))

(declare-fun m!145423 () Bool)

(assert (=> b!125124 m!145423))

(assert (=> b!125124 m!145415))

(declare-fun m!145425 () Bool)

(assert (=> b!125124 m!145425))

(assert (=> b!125124 m!145419))

(declare-fun m!145427 () Bool)

(assert (=> b!125124 m!145427))

(declare-fun m!145429 () Bool)

(assert (=> b!125124 m!145429))

(declare-fun m!145431 () Bool)

(assert (=> b!125124 m!145431))

(declare-fun m!145433 () Bool)

(assert (=> b!125124 m!145433))

(declare-fun m!145435 () Bool)

(assert (=> b!125124 m!145435))

(declare-fun m!145437 () Bool)

(assert (=> b!125124 m!145437))

(declare-fun m!145439 () Bool)

(assert (=> b!125124 m!145439))

(declare-fun m!145441 () Bool)

(assert (=> b!125124 m!145441))

(assert (=> b!125124 m!145437))

(assert (=> b!125124 m!145431))

(declare-fun m!145443 () Bool)

(assert (=> b!125124 m!145443))

(assert (=> b!125124 m!145113))

(assert (=> b!125128 m!145113))

(assert (=> b!125128 m!145113))

(assert (=> b!125128 m!145115))

(declare-fun m!145445 () Bool)

(assert (=> bm!13379 m!145445))

(declare-fun m!145447 () Bool)

(assert (=> bm!13376 m!145447))

(assert (=> d!37599 m!145065))

(assert (=> b!125129 m!145113))

(assert (=> b!125129 m!145113))

(assert (=> b!125129 m!145115))

(assert (=> bm!13343 d!37599))

(assert (=> b!124844 d!37527))

(declare-fun d!37601 () Bool)

(declare-fun e!81771 () Bool)

(assert (=> d!37601 e!81771))

(declare-fun res!60597 () Bool)

(assert (=> d!37601 (=> res!60597 e!81771)))

(declare-fun lt!64402 () Bool)

(assert (=> d!37601 (= res!60597 (not lt!64402))))

(declare-fun lt!64405 () Bool)

(assert (=> d!37601 (= lt!64402 lt!64405)))

(declare-fun lt!64404 () Unit!3871)

(declare-fun e!81772 () Unit!3871)

(assert (=> d!37601 (= lt!64404 e!81772)))

(declare-fun c!22792 () Bool)

(assert (=> d!37601 (= c!22792 lt!64405)))

(assert (=> d!37601 (= lt!64405 (containsKey!170 (toList!831 lt!64108) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!37601 (= (contains!861 lt!64108 #b0000000000000000000000000000000000000000000000000000000000000000) lt!64402)))

(declare-fun b!125141 () Bool)

(declare-fun lt!64403 () Unit!3871)

(assert (=> b!125141 (= e!81772 lt!64403)))

(assert (=> b!125141 (= lt!64403 (lemmaContainsKeyImpliesGetValueByKeyDefined!118 (toList!831 lt!64108) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!125141 (isDefined!119 (getValueByKey!167 (toList!831 lt!64108) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!125142 () Bool)

(declare-fun Unit!3883 () Unit!3871)

(assert (=> b!125142 (= e!81772 Unit!3883)))

(declare-fun b!125143 () Bool)

(assert (=> b!125143 (= e!81771 (isDefined!119 (getValueByKey!167 (toList!831 lt!64108) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!37601 c!22792) b!125141))

(assert (= (and d!37601 (not c!22792)) b!125142))

(assert (= (and d!37601 (not res!60597)) b!125143))

(declare-fun m!145449 () Bool)

(assert (=> d!37601 m!145449))

(declare-fun m!145451 () Bool)

(assert (=> b!125141 m!145451))

(declare-fun m!145453 () Bool)

(assert (=> b!125141 m!145453))

(assert (=> b!125141 m!145453))

(declare-fun m!145455 () Bool)

(assert (=> b!125141 m!145455))

(assert (=> b!125143 m!145453))

(assert (=> b!125143 m!145453))

(assert (=> b!125143 m!145455))

(assert (=> bm!13269 d!37601))

(declare-fun d!37603 () Bool)

(assert (=> d!37603 (= (inRange!0 (ite c!22712 (ite c!22709 (index!3207 lt!64207) (ite c!22719 (index!3206 lt!64216) (index!3209 lt!64216))) (ite c!22721 (index!3207 lt!64220) (ite c!22718 (index!3206 lt!64199) (index!3209 lt!64199)))) (mask!7009 newMap!16)) (and (bvsge (ite c!22712 (ite c!22709 (index!3207 lt!64207) (ite c!22719 (index!3206 lt!64216) (index!3209 lt!64216))) (ite c!22721 (index!3207 lt!64220) (ite c!22718 (index!3206 lt!64199) (index!3209 lt!64199)))) #b00000000000000000000000000000000) (bvslt (ite c!22712 (ite c!22709 (index!3207 lt!64207) (ite c!22719 (index!3206 lt!64216) (index!3209 lt!64216))) (ite c!22721 (index!3207 lt!64220) (ite c!22718 (index!3206 lt!64199) (index!3209 lt!64199)))) (bvadd (mask!7009 newMap!16) #b00000000000000000000000000000001))))))

(assert (=> bm!13328 d!37603))

(declare-fun d!37605 () Bool)

(assert (=> d!37605 (= (apply!110 lt!64108 #b1000000000000000000000000000000000000000000000000000000000000000) (get!1449 (getValueByKey!167 (toList!831 lt!64108) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!5178 () Bool)

(assert (= bs!5178 d!37605))

(assert (=> bs!5178 m!145377))

(assert (=> bs!5178 m!145377))

(declare-fun m!145457 () Bool)

(assert (=> bs!5178 m!145457))

(assert (=> b!124710 d!37605))

(assert (=> b!124819 d!37587))

(declare-fun b!125178 () Bool)

(declare-fun res!60618 () Bool)

(declare-fun e!81795 () Bool)

(assert (=> b!125178 (=> (not res!60618) (not e!81795))))

(declare-fun lt!64480 () tuple2!2522)

(assert (=> b!125178 (= res!60618 (contains!861 (map!1377 (_2!1272 lt!64480)) (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355)))))

(declare-fun b!125179 () Bool)

(declare-fun res!60616 () Bool)

(declare-fun call!13395 () Bool)

(assert (=> b!125179 (= res!60616 call!13395)))

(declare-fun e!81792 () Bool)

(assert (=> b!125179 (=> (not res!60616) (not e!81792))))

(declare-fun bm!13391 () Bool)

(declare-fun call!13394 () Bool)

(assert (=> bm!13391 (= call!13394 call!13395)))

(declare-fun b!125180 () Bool)

(declare-fun res!60624 () Bool)

(assert (=> b!125180 (=> (not res!60624) (not e!81795))))

(assert (=> b!125180 (= res!60624 (valid!515 (_2!1272 lt!64480)))))

(declare-fun b!125181 () Bool)

(declare-fun e!81790 () Bool)

(declare-fun e!81796 () Bool)

(assert (=> b!125181 (= e!81790 e!81796)))

(declare-fun res!60620 () Bool)

(assert (=> b!125181 (= res!60620 call!13394)))

(assert (=> b!125181 (=> (not res!60620) (not e!81796))))

(declare-fun b!125182 () Bool)

(declare-fun e!81793 () Unit!3871)

(declare-fun Unit!3884 () Unit!3871)

(assert (=> b!125182 (= e!81793 Unit!3884)))

(declare-fun b!125183 () Bool)

(declare-fun e!81791 () Bool)

(declare-fun call!13397 () Bool)

(assert (=> b!125183 (= e!81791 (not call!13397))))

(declare-fun b!125184 () Bool)

(declare-fun res!60617 () Bool)

(declare-fun lt!64488 () SeekEntryResult!263)

(assert (=> b!125184 (= res!60617 (= (select (arr!2210 (_keys!4492 newMap!16)) (index!3209 lt!64488)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!125184 (=> (not res!60617) (not e!81796))))

(declare-fun c!22802 () Bool)

(declare-fun lt!64493 () SeekEntryResult!263)

(declare-fun c!22801 () Bool)

(declare-fun bm!13392 () Bool)

(assert (=> bm!13392 (= call!13395 (inRange!0 (ite c!22802 (index!3207 lt!64493) (ite c!22801 (index!3206 lt!64488) (index!3209 lt!64488))) (mask!7009 newMap!16)))))

(declare-fun b!125186 () Bool)

(declare-fun Unit!3885 () Unit!3871)

(assert (=> b!125186 (= e!81793 Unit!3885)))

(declare-fun lt!64484 () Unit!3871)

(declare-fun lemmaArrayContainsKeyThenInListMap!36 (array!4667 array!4669 (_ BitVec 32) (_ BitVec 32) V!3425 V!3425 (_ BitVec 64) (_ BitVec 32) Int) Unit!3871)

(assert (=> b!125186 (= lt!64484 (lemmaArrayContainsKeyThenInListMap!36 (_keys!4492 newMap!16) (_values!2746 newMap!16) (mask!7009 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16)))))

(assert (=> b!125186 (contains!861 (getCurrentListMap!511 (_keys!4492 newMap!16) (_values!2746 newMap!16) (mask!7009 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16)) (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355))))

(declare-fun lt!64495 () Unit!3871)

(assert (=> b!125186 (= lt!64495 lt!64484)))

(assert (=> b!125186 false))

(declare-fun b!125187 () Bool)

(assert (=> b!125187 (= e!81792 (= (select (arr!2210 (_keys!4492 newMap!16)) (index!3207 lt!64493)) (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355)))))

(declare-fun b!125188 () Bool)

(assert (=> b!125188 (= e!81790 ((_ is Undefined!263) lt!64488))))

(declare-fun b!125189 () Bool)

(declare-fun res!60619 () Bool)

(assert (=> b!125189 (=> (not res!60619) (not e!81791))))

(assert (=> b!125189 (= res!60619 (= (select (arr!2210 (_keys!4492 newMap!16)) (index!3206 lt!64488)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!125190 () Bool)

(declare-fun e!81789 () Unit!3871)

(declare-fun Unit!3886 () Unit!3871)

(assert (=> b!125190 (= e!81789 Unit!3886)))

(declare-fun lt!64471 () Unit!3871)

(assert (=> b!125190 (= lt!64471 (lemmaInListMapThenSeekEntryOrOpenFindsIt!55 (_keys!4492 newMap!16) (_values!2746 newMap!16) (mask!7009 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355) (defaultEntry!2763 newMap!16)))))

(declare-fun call!13396 () SeekEntryResult!263)

(assert (=> b!125190 (= lt!64493 call!13396)))

(declare-fun res!60622 () Bool)

(assert (=> b!125190 (= res!60622 ((_ is Found!263) lt!64493))))

(assert (=> b!125190 (=> (not res!60622) (not e!81792))))

(assert (=> b!125190 e!81792))

(declare-fun lt!64473 () Unit!3871)

(assert (=> b!125190 (= lt!64473 lt!64471)))

(assert (=> b!125190 false))

(declare-fun b!125191 () Bool)

(declare-fun c!22803 () Bool)

(assert (=> b!125191 (= c!22803 ((_ is MissingVacant!263) lt!64488))))

(declare-fun e!81794 () Bool)

(assert (=> b!125191 (= e!81794 e!81790)))

(declare-fun b!125192 () Bool)

(declare-fun res!60623 () Bool)

(assert (=> b!125192 (=> (not res!60623) (not e!81791))))

(assert (=> b!125192 (= res!60623 call!13394)))

(assert (=> b!125192 (= e!81794 e!81791)))

(declare-fun b!125185 () Bool)

(declare-fun lt!64490 () Unit!3871)

(assert (=> b!125185 (= e!81789 lt!64490)))

(assert (=> b!125185 (= lt!64490 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!55 (_keys!4492 newMap!16) (_values!2746 newMap!16) (mask!7009 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355) (defaultEntry!2763 newMap!16)))))

(assert (=> b!125185 (= lt!64488 call!13396)))

(assert (=> b!125185 (= c!22801 ((_ is MissingZero!263) lt!64488))))

(assert (=> b!125185 e!81794))

(declare-fun d!37607 () Bool)

(assert (=> d!37607 e!81795))

(declare-fun res!60621 () Bool)

(assert (=> d!37607 (=> (not res!60621) (not e!81795))))

(assert (=> d!37607 (= res!60621 (_1!1272 lt!64480))))

(assert (=> d!37607 (= lt!64480 (tuple2!2523 true (LongMapFixedSize!1055 (defaultEntry!2763 newMap!16) (mask!7009 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) (bvadd (_size!576 newMap!16) #b00000000000000000000000000000001) (array!4668 (store (arr!2210 (_keys!4492 newMap!16)) (ite c!22713 (index!3209 lt!64214) (index!3206 lt!64214)) (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355)) (size!2473 (_keys!4492 newMap!16))) (array!4670 (store (arr!2211 (_values!2746 newMap!16)) (ite c!22713 (index!3209 lt!64214) (index!3206 lt!64214)) (ValueCellFull!1073 (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2474 (_values!2746 newMap!16))) (_vacant!576 newMap!16))))))

(declare-fun lt!64477 () Unit!3871)

(declare-fun lt!64475 () Unit!3871)

(assert (=> d!37607 (= lt!64477 lt!64475)))

(declare-fun lt!64482 () array!4667)

(declare-fun lt!64487 () array!4669)

(assert (=> d!37607 (contains!861 (getCurrentListMap!511 lt!64482 lt!64487 (mask!7009 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16)) (select (store (arr!2210 (_keys!4492 newMap!16)) (ite c!22713 (index!3209 lt!64214) (index!3206 lt!64214)) (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355)) (ite c!22713 (index!3209 lt!64214) (index!3206 lt!64214))))))

(assert (=> d!37607 (= lt!64475 (lemmaValidKeyInArrayIsInListMap!115 lt!64482 lt!64487 (mask!7009 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) (ite c!22713 (index!3209 lt!64214) (index!3206 lt!64214)) (defaultEntry!2763 newMap!16)))))

(assert (=> d!37607 (= lt!64487 (array!4670 (store (arr!2211 (_values!2746 newMap!16)) (ite c!22713 (index!3209 lt!64214) (index!3206 lt!64214)) (ValueCellFull!1073 (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2474 (_values!2746 newMap!16))))))

(assert (=> d!37607 (= lt!64482 (array!4668 (store (arr!2210 (_keys!4492 newMap!16)) (ite c!22713 (index!3209 lt!64214) (index!3206 lt!64214)) (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355)) (size!2473 (_keys!4492 newMap!16))))))

(declare-fun lt!64474 () Unit!3871)

(declare-fun lt!64492 () Unit!3871)

(assert (=> d!37607 (= lt!64474 lt!64492)))

(declare-fun lt!64479 () array!4667)

(assert (=> d!37607 (= (arrayCountValidKeys!0 lt!64479 (ite c!22713 (index!3209 lt!64214) (index!3206 lt!64214)) (bvadd (ite c!22713 (index!3209 lt!64214) (index!3206 lt!64214)) #b00000000000000000000000000000001)) #b00000000000000000000000000000001)))

(declare-fun lemmaValidKeyAtIImpliesCountKeysIsOne!0 (array!4667 (_ BitVec 32)) Unit!3871)

(assert (=> d!37607 (= lt!64492 (lemmaValidKeyAtIImpliesCountKeysIsOne!0 lt!64479 (ite c!22713 (index!3209 lt!64214) (index!3206 lt!64214))))))

(assert (=> d!37607 (= lt!64479 (array!4668 (store (arr!2210 (_keys!4492 newMap!16)) (ite c!22713 (index!3209 lt!64214) (index!3206 lt!64214)) (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355)) (size!2473 (_keys!4492 newMap!16))))))

(declare-fun lt!64485 () Unit!3871)

(declare-fun lt!64470 () Unit!3871)

(assert (=> d!37607 (= lt!64485 lt!64470)))

(declare-fun lt!64486 () array!4667)

(assert (=> d!37607 (arrayContainsKey!0 lt!64486 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355) #b00000000000000000000000000000000)))

(assert (=> d!37607 (= lt!64470 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!64486 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355) (ite c!22713 (index!3209 lt!64214) (index!3206 lt!64214))))))

(assert (=> d!37607 (= lt!64486 (array!4668 (store (arr!2210 (_keys!4492 newMap!16)) (ite c!22713 (index!3209 lt!64214) (index!3206 lt!64214)) (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355)) (size!2473 (_keys!4492 newMap!16))))))

(declare-fun lt!64494 () Unit!3871)

(declare-fun lt!64472 () Unit!3871)

(assert (=> d!37607 (= lt!64494 lt!64472)))

(assert (=> d!37607 (= (+!163 (getCurrentListMap!511 (_keys!4492 newMap!16) (_values!2746 newMap!16) (mask!7009 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16)) (tuple2!2521 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (getCurrentListMap!511 (array!4668 (store (arr!2210 (_keys!4492 newMap!16)) (ite c!22713 (index!3209 lt!64214) (index!3206 lt!64214)) (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355)) (size!2473 (_keys!4492 newMap!16))) (array!4670 (store (arr!2211 (_values!2746 newMap!16)) (ite c!22713 (index!3209 lt!64214) (index!3206 lt!64214)) (ValueCellFull!1073 (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2474 (_values!2746 newMap!16))) (mask!7009 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16)))))

(declare-fun lemmaAddValidKeyToArrayThenAddPairToListMap!36 (array!4667 array!4669 (_ BitVec 32) (_ BitVec 32) V!3425 V!3425 (_ BitVec 32) (_ BitVec 64) V!3425 Int) Unit!3871)

(assert (=> d!37607 (= lt!64472 (lemmaAddValidKeyToArrayThenAddPairToListMap!36 (_keys!4492 newMap!16) (_values!2746 newMap!16) (mask!7009 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) (ite c!22713 (index!3209 lt!64214) (index!3206 lt!64214)) (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2763 newMap!16)))))

(declare-fun lt!64491 () Unit!3871)

(declare-fun lt!64467 () Unit!3871)

(assert (=> d!37607 (= lt!64491 lt!64467)))

(assert (=> d!37607 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!4668 (store (arr!2210 (_keys!4492 newMap!16)) (ite c!22713 (index!3209 lt!64214) (index!3206 lt!64214)) (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355)) (size!2473 (_keys!4492 newMap!16))) (mask!7009 newMap!16))))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!4667 (_ BitVec 32) (_ BitVec 32)) Unit!3871)

(assert (=> d!37607 (= lt!64467 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355) (_keys!4492 newMap!16) (ite c!22713 (index!3209 lt!64214) (index!3206 lt!64214)) (mask!7009 newMap!16)))))

(declare-fun lt!64468 () Unit!3871)

(declare-fun lt!64483 () Unit!3871)

(assert (=> d!37607 (= lt!64468 lt!64483)))

(assert (=> d!37607 (= (arrayCountValidKeys!0 (array!4668 (store (arr!2210 (_keys!4492 newMap!16)) (ite c!22713 (index!3209 lt!64214) (index!3206 lt!64214)) (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355)) (size!2473 (_keys!4492 newMap!16))) #b00000000000000000000000000000000 (size!2473 (_keys!4492 newMap!16))) (bvadd (arrayCountValidKeys!0 (_keys!4492 newMap!16) #b00000000000000000000000000000000 (size!2473 (_keys!4492 newMap!16))) #b00000000000000000000000000000001))))

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!4667 (_ BitVec 32) (_ BitVec 64)) Unit!3871)

(assert (=> d!37607 (= lt!64483 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!4492 newMap!16) (ite c!22713 (index!3209 lt!64214) (index!3206 lt!64214)) (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355)))))

(declare-fun lt!64489 () Unit!3871)

(declare-fun lt!64481 () Unit!3871)

(assert (=> d!37607 (= lt!64489 lt!64481)))

(declare-fun lt!64478 () (_ BitVec 32))

(declare-fun lt!64469 () List!1677)

(assert (=> d!37607 (arrayNoDuplicates!0 (array!4668 (store (arr!2210 (_keys!4492 newMap!16)) (ite c!22713 (index!3209 lt!64214) (index!3206 lt!64214)) (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355)) (size!2473 (_keys!4492 newMap!16))) lt!64478 lt!64469)))

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!4667 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!1677) Unit!3871)

(assert (=> d!37607 (= lt!64481 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!4492 newMap!16) (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355) (ite c!22713 (index!3209 lt!64214) (index!3206 lt!64214)) lt!64478 lt!64469))))

(assert (=> d!37607 (= lt!64469 Nil!1674)))

(assert (=> d!37607 (= lt!64478 #b00000000000000000000000000000000)))

(declare-fun lt!64476 () Unit!3871)

(assert (=> d!37607 (= lt!64476 e!81793)))

(declare-fun c!22804 () Bool)

(assert (=> d!37607 (= c!22804 (arrayContainsKey!0 (_keys!4492 newMap!16) (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun lt!64466 () Unit!3871)

(assert (=> d!37607 (= lt!64466 e!81789)))

(assert (=> d!37607 (= c!22802 (contains!861 (getCurrentListMap!511 (_keys!4492 newMap!16) (_values!2746 newMap!16) (mask!7009 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16)) (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355)))))

(assert (=> d!37607 (valid!515 newMap!16)))

(assert (=> d!37607 (= (updateHelperNewKey!55 newMap!16 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (ite c!22713 (index!3209 lt!64214) (index!3206 lt!64214))) lt!64480)))

(declare-fun b!125193 () Bool)

(assert (=> b!125193 (= e!81796 (not call!13397))))

(declare-fun b!125194 () Bool)

(assert (=> b!125194 (= e!81795 (= (map!1377 (_2!1272 lt!64480)) (+!163 (map!1377 newMap!16) (tuple2!2521 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun bm!13393 () Bool)

(assert (=> bm!13393 (= call!13396 (seekEntryOrOpen!0 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355) (_keys!4492 newMap!16) (mask!7009 newMap!16)))))

(declare-fun bm!13394 () Bool)

(assert (=> bm!13394 (= call!13397 (arrayContainsKey!0 (_keys!4492 newMap!16) (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(assert (= (and d!37607 c!22802) b!125190))

(assert (= (and d!37607 (not c!22802)) b!125185))

(assert (= (and b!125190 res!60622) b!125179))

(assert (= (and b!125179 res!60616) b!125187))

(assert (= (and b!125185 c!22801) b!125192))

(assert (= (and b!125185 (not c!22801)) b!125191))

(assert (= (and b!125192 res!60623) b!125189))

(assert (= (and b!125189 res!60619) b!125183))

(assert (= (and b!125191 c!22803) b!125181))

(assert (= (and b!125191 (not c!22803)) b!125188))

(assert (= (and b!125181 res!60620) b!125184))

(assert (= (and b!125184 res!60617) b!125193))

(assert (= (or b!125192 b!125181) bm!13391))

(assert (= (or b!125183 b!125193) bm!13394))

(assert (= (or b!125179 bm!13391) bm!13392))

(assert (= (or b!125190 b!125185) bm!13393))

(assert (= (and d!37607 c!22804) b!125186))

(assert (= (and d!37607 (not c!22804)) b!125182))

(assert (= (and d!37607 res!60621) b!125180))

(assert (= (and b!125180 res!60624) b!125178))

(assert (= (and b!125178 res!60618) b!125194))

(declare-fun m!145459 () Bool)

(assert (=> b!125178 m!145459))

(assert (=> b!125178 m!145459))

(assert (=> b!125178 m!144797))

(declare-fun m!145461 () Bool)

(assert (=> b!125178 m!145461))

(assert (=> b!125185 m!144797))

(assert (=> b!125185 m!145007))

(assert (=> b!125190 m!144797))

(assert (=> b!125190 m!144991))

(assert (=> b!125186 m!144797))

(declare-fun m!145463 () Bool)

(assert (=> b!125186 m!145463))

(assert (=> b!125186 m!144893))

(assert (=> b!125186 m!144893))

(assert (=> b!125186 m!144797))

(assert (=> b!125186 m!144985))

(assert (=> bm!13393 m!144797))

(assert (=> bm!13393 m!144977))

(declare-fun m!145465 () Bool)

(assert (=> b!125189 m!145465))

(assert (=> bm!13394 m!144797))

(assert (=> bm!13394 m!145003))

(declare-fun m!145467 () Bool)

(assert (=> d!37607 m!145467))

(assert (=> d!37607 m!144797))

(assert (=> d!37607 m!144795))

(declare-fun m!145469 () Bool)

(assert (=> d!37607 m!145469))

(assert (=> d!37607 m!144797))

(declare-fun m!145471 () Bool)

(assert (=> d!37607 m!145471))

(declare-fun m!145473 () Bool)

(assert (=> d!37607 m!145473))

(assert (=> d!37607 m!144797))

(assert (=> d!37607 m!145003))

(declare-fun m!145475 () Bool)

(assert (=> d!37607 m!145475))

(assert (=> d!37607 m!144797))

(declare-fun m!145477 () Bool)

(assert (=> d!37607 m!145477))

(declare-fun m!145479 () Bool)

(assert (=> d!37607 m!145479))

(assert (=> d!37607 m!144893))

(assert (=> d!37607 m!144797))

(assert (=> d!37607 m!144985))

(declare-fun m!145481 () Bool)

(assert (=> d!37607 m!145481))

(declare-fun m!145483 () Bool)

(assert (=> d!37607 m!145483))

(declare-fun m!145485 () Bool)

(assert (=> d!37607 m!145485))

(declare-fun m!145487 () Bool)

(assert (=> d!37607 m!145487))

(assert (=> d!37607 m!145481))

(declare-fun m!145489 () Bool)

(assert (=> d!37607 m!145489))

(assert (=> d!37607 m!144809))

(declare-fun m!145491 () Bool)

(assert (=> d!37607 m!145491))

(assert (=> d!37607 m!144893))

(assert (=> d!37607 m!144893))

(declare-fun m!145493 () Bool)

(assert (=> d!37607 m!145493))

(assert (=> d!37607 m!144797))

(declare-fun m!145495 () Bool)

(assert (=> d!37607 m!145495))

(assert (=> d!37607 m!144797))

(declare-fun m!145497 () Bool)

(assert (=> d!37607 m!145497))

(declare-fun m!145499 () Bool)

(assert (=> d!37607 m!145499))

(assert (=> d!37607 m!145483))

(declare-fun m!145501 () Bool)

(assert (=> d!37607 m!145501))

(assert (=> d!37607 m!144797))

(declare-fun m!145503 () Bool)

(assert (=> d!37607 m!145503))

(assert (=> d!37607 m!144953))

(assert (=> b!125194 m!145459))

(assert (=> b!125194 m!144819))

(assert (=> b!125194 m!144819))

(declare-fun m!145505 () Bool)

(assert (=> b!125194 m!145505))

(declare-fun m!145507 () Bool)

(assert (=> b!125187 m!145507))

(declare-fun m!145509 () Bool)

(assert (=> b!125180 m!145509))

(declare-fun m!145511 () Bool)

(assert (=> bm!13392 m!145511))

(declare-fun m!145513 () Bool)

(assert (=> b!125184 m!145513))

(assert (=> bm!13336 d!37607))

(declare-fun d!37609 () Bool)

(assert (=> d!37609 (= (apply!110 lt!64108 #b0000000000000000000000000000000000000000000000000000000000000000) (get!1449 (getValueByKey!167 (toList!831 lt!64108) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!5179 () Bool)

(assert (= bs!5179 d!37609))

(assert (=> bs!5179 m!145453))

(assert (=> bs!5179 m!145453))

(declare-fun m!145515 () Bool)

(assert (=> bs!5179 m!145515))

(assert (=> b!124711 d!37609))

(declare-fun d!37611 () Bool)

(declare-fun e!81799 () Bool)

(assert (=> d!37611 e!81799))

(declare-fun res!60627 () Bool)

(assert (=> d!37611 (=> (not res!60627) (not e!81799))))

(assert (=> d!37611 (= res!60627 (and (bvsge (index!3207 lt!64214) #b00000000000000000000000000000000) (bvslt (index!3207 lt!64214) (size!2473 (_keys!4492 newMap!16)))))))

(declare-fun lt!64498 () Unit!3871)

(declare-fun choose!758 (array!4667 array!4669 (_ BitVec 32) (_ BitVec 32) V!3425 V!3425 (_ BitVec 32) Int) Unit!3871)

(assert (=> d!37611 (= lt!64498 (choose!758 (_keys!4492 newMap!16) lt!64198 (mask!7009 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) (index!3207 lt!64214) (defaultEntry!2763 newMap!16)))))

(assert (=> d!37611 (validMask!0 (mask!7009 newMap!16))))

(assert (=> d!37611 (= (lemmaValidKeyInArrayIsInListMap!115 (_keys!4492 newMap!16) lt!64198 (mask!7009 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) (index!3207 lt!64214) (defaultEntry!2763 newMap!16)) lt!64498)))

(declare-fun b!125197 () Bool)

(assert (=> b!125197 (= e!81799 (contains!861 (getCurrentListMap!511 (_keys!4492 newMap!16) lt!64198 (mask!7009 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16)) (select (arr!2210 (_keys!4492 newMap!16)) (index!3207 lt!64214))))))

(assert (= (and d!37611 res!60627) b!125197))

(declare-fun m!145517 () Bool)

(assert (=> d!37611 m!145517))

(assert (=> d!37611 m!145065))

(declare-fun m!145519 () Bool)

(assert (=> b!125197 m!145519))

(assert (=> b!125197 m!144993))

(assert (=> b!125197 m!145519))

(assert (=> b!125197 m!144993))

(declare-fun m!145521 () Bool)

(assert (=> b!125197 m!145521))

(assert (=> b!124848 d!37611))

(declare-fun d!37613 () Bool)

(declare-fun e!81802 () Bool)

(assert (=> d!37613 e!81802))

(declare-fun res!60630 () Bool)

(assert (=> d!37613 (=> (not res!60630) (not e!81802))))

(assert (=> d!37613 (= res!60630 (and (bvsge (index!3207 lt!64214) #b00000000000000000000000000000000) (bvslt (index!3207 lt!64214) (size!2474 (_values!2746 newMap!16)))))))

(declare-fun lt!64501 () Unit!3871)

(declare-fun choose!759 (array!4667 array!4669 (_ BitVec 32) (_ BitVec 32) V!3425 V!3425 (_ BitVec 32) (_ BitVec 64) V!3425 Int) Unit!3871)

(assert (=> d!37613 (= lt!64501 (choose!759 (_keys!4492 newMap!16) (_values!2746 newMap!16) (mask!7009 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) (index!3207 lt!64214) (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2763 newMap!16)))))

(assert (=> d!37613 (validMask!0 (mask!7009 newMap!16))))

(assert (=> d!37613 (= (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!55 (_keys!4492 newMap!16) (_values!2746 newMap!16) (mask!7009 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) (index!3207 lt!64214) (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2763 newMap!16)) lt!64501)))

(declare-fun b!125200 () Bool)

(assert (=> b!125200 (= e!81802 (= (+!163 (getCurrentListMap!511 (_keys!4492 newMap!16) (_values!2746 newMap!16) (mask!7009 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16)) (tuple2!2521 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (getCurrentListMap!511 (_keys!4492 newMap!16) (array!4670 (store (arr!2211 (_values!2746 newMap!16)) (index!3207 lt!64214) (ValueCellFull!1073 (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2474 (_values!2746 newMap!16))) (mask!7009 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16))))))

(assert (= (and d!37613 res!60630) b!125200))

(assert (=> d!37613 m!144797))

(assert (=> d!37613 m!144795))

(declare-fun m!145523 () Bool)

(assert (=> d!37613 m!145523))

(assert (=> d!37613 m!145065))

(assert (=> b!125200 m!144893))

(assert (=> b!125200 m!144893))

(assert (=> b!125200 m!145493))

(assert (=> b!125200 m!144983))

(declare-fun m!145525 () Bool)

(assert (=> b!125200 m!145525))

(assert (=> b!124848 d!37613))

(declare-fun d!37615 () Bool)

(declare-fun e!81803 () Bool)

(assert (=> d!37615 e!81803))

(declare-fun res!60631 () Bool)

(assert (=> d!37615 (=> res!60631 e!81803)))

(declare-fun lt!64502 () Bool)

(assert (=> d!37615 (= res!60631 (not lt!64502))))

(declare-fun lt!64505 () Bool)

(assert (=> d!37615 (= lt!64502 lt!64505)))

(declare-fun lt!64504 () Unit!3871)

(declare-fun e!81804 () Unit!3871)

(assert (=> d!37615 (= lt!64504 e!81804)))

(declare-fun c!22805 () Bool)

(assert (=> d!37615 (= c!22805 lt!64505)))

(assert (=> d!37615 (= lt!64505 (containsKey!170 (toList!831 (getCurrentListMap!511 (_keys!4492 newMap!16) (_values!2746 newMap!16) (mask!7009 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16))) (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355)))))

(assert (=> d!37615 (= (contains!861 (getCurrentListMap!511 (_keys!4492 newMap!16) (_values!2746 newMap!16) (mask!7009 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16)) (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355)) lt!64502)))

(declare-fun b!125201 () Bool)

(declare-fun lt!64503 () Unit!3871)

(assert (=> b!125201 (= e!81804 lt!64503)))

(assert (=> b!125201 (= lt!64503 (lemmaContainsKeyImpliesGetValueByKeyDefined!118 (toList!831 (getCurrentListMap!511 (_keys!4492 newMap!16) (_values!2746 newMap!16) (mask!7009 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16))) (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355)))))

(assert (=> b!125201 (isDefined!119 (getValueByKey!167 (toList!831 (getCurrentListMap!511 (_keys!4492 newMap!16) (_values!2746 newMap!16) (mask!7009 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16))) (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355)))))

(declare-fun b!125202 () Bool)

(declare-fun Unit!3887 () Unit!3871)

(assert (=> b!125202 (= e!81804 Unit!3887)))

(declare-fun b!125203 () Bool)

(assert (=> b!125203 (= e!81803 (isDefined!119 (getValueByKey!167 (toList!831 (getCurrentListMap!511 (_keys!4492 newMap!16) (_values!2746 newMap!16) (mask!7009 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16))) (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355))))))

(assert (= (and d!37615 c!22805) b!125201))

(assert (= (and d!37615 (not c!22805)) b!125202))

(assert (= (and d!37615 (not res!60631)) b!125203))

(assert (=> d!37615 m!144797))

(declare-fun m!145527 () Bool)

(assert (=> d!37615 m!145527))

(assert (=> b!125201 m!144797))

(declare-fun m!145529 () Bool)

(assert (=> b!125201 m!145529))

(assert (=> b!125201 m!144797))

(declare-fun m!145531 () Bool)

(assert (=> b!125201 m!145531))

(assert (=> b!125201 m!145531))

(declare-fun m!145533 () Bool)

(assert (=> b!125201 m!145533))

(assert (=> b!125203 m!144797))

(assert (=> b!125203 m!145531))

(assert (=> b!125203 m!145531))

(assert (=> b!125203 m!145533))

(assert (=> b!124848 d!37615))

(assert (=> b!124848 d!37587))

(assert (=> d!37501 d!37509))

(declare-fun d!37617 () Bool)

(assert (=> d!37617 (= (map!1377 (_2!1272 lt!64219)) (getCurrentListMap!511 (_keys!4492 (_2!1272 lt!64219)) (_values!2746 (_2!1272 lt!64219)) (mask!7009 (_2!1272 lt!64219)) (extraKeys!2548 (_2!1272 lt!64219)) (zeroValue!2628 (_2!1272 lt!64219)) (minValue!2628 (_2!1272 lt!64219)) #b00000000000000000000000000000000 (defaultEntry!2763 (_2!1272 lt!64219))))))

(declare-fun bs!5180 () Bool)

(assert (= bs!5180 d!37617))

(declare-fun m!145535 () Bool)

(assert (=> bs!5180 m!145535))

(assert (=> bm!13329 d!37617))

(declare-fun d!37619 () Bool)

(declare-fun e!81805 () Bool)

(assert (=> d!37619 e!81805))

(declare-fun res!60632 () Bool)

(assert (=> d!37619 (=> res!60632 e!81805)))

(declare-fun lt!64506 () Bool)

(assert (=> d!37619 (= res!60632 (not lt!64506))))

(declare-fun lt!64509 () Bool)

(assert (=> d!37619 (= lt!64506 lt!64509)))

(declare-fun lt!64508 () Unit!3871)

(declare-fun e!81806 () Unit!3871)

(assert (=> d!37619 (= lt!64508 e!81806)))

(declare-fun c!22806 () Bool)

(assert (=> d!37619 (= c!22806 lt!64509)))

(assert (=> d!37619 (= lt!64509 (containsKey!170 (toList!831 lt!64108) (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> d!37619 (= (contains!861 lt!64108 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) lt!64506)))

(declare-fun b!125204 () Bool)

(declare-fun lt!64507 () Unit!3871)

(assert (=> b!125204 (= e!81806 lt!64507)))

(assert (=> b!125204 (= lt!64507 (lemmaContainsKeyImpliesGetValueByKeyDefined!118 (toList!831 lt!64108) (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!125204 (isDefined!119 (getValueByKey!167 (toList!831 lt!64108) (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!125205 () Bool)

(declare-fun Unit!3888 () Unit!3871)

(assert (=> b!125205 (= e!81806 Unit!3888)))

(declare-fun b!125206 () Bool)

(assert (=> b!125206 (= e!81805 (isDefined!119 (getValueByKey!167 (toList!831 lt!64108) (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(assert (= (and d!37619 c!22806) b!125204))

(assert (= (and d!37619 (not c!22806)) b!125205))

(assert (= (and d!37619 (not res!60632)) b!125206))

(assert (=> d!37619 m!144905))

(declare-fun m!145537 () Bool)

(assert (=> d!37619 m!145537))

(assert (=> b!125204 m!144905))

(declare-fun m!145539 () Bool)

(assert (=> b!125204 m!145539))

(assert (=> b!125204 m!144905))

(assert (=> b!125204 m!145101))

(assert (=> b!125204 m!145101))

(declare-fun m!145541 () Bool)

(assert (=> b!125204 m!145541))

(assert (=> b!125206 m!144905))

(assert (=> b!125206 m!145101))

(assert (=> b!125206 m!145101))

(assert (=> b!125206 m!145541))

(assert (=> b!124712 d!37619))

(declare-fun d!37621 () Bool)

(assert (=> d!37621 (= (+!163 (getCurrentListMap!511 (_keys!4492 newMap!16) (_values!2746 newMap!16) (mask!7009 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16)) (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (getCurrentListMap!511 (_keys!4492 newMap!16) (_values!2746 newMap!16) (mask!7009 newMap!16) lt!64205 (zeroValue!2628 newMap!16) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16)))))

(declare-fun lt!64512 () Unit!3871)

(declare-fun choose!760 (array!4667 array!4669 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3425 V!3425 V!3425 Int) Unit!3871)

(assert (=> d!37621 (= lt!64512 (choose!760 (_keys!4492 newMap!16) (_values!2746 newMap!16) (mask!7009 newMap!16) (extraKeys!2548 newMap!16) lt!64205 (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2763 newMap!16)))))

(assert (=> d!37621 (validMask!0 (mask!7009 newMap!16))))

(assert (=> d!37621 (= (lemmaChangeLongMinValueKeyThenAddPairToListMap!55 (_keys!4492 newMap!16) (_values!2746 newMap!16) (mask!7009 newMap!16) (extraKeys!2548 newMap!16) lt!64205 (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2763 newMap!16)) lt!64512)))

(declare-fun bs!5181 () Bool)

(assert (= bs!5181 d!37621))

(assert (=> bs!5181 m!145065))

(assert (=> bs!5181 m!144893))

(declare-fun m!145543 () Bool)

(assert (=> bs!5181 m!145543))

(assert (=> bs!5181 m!144893))

(assert (=> bs!5181 m!144795))

(declare-fun m!145545 () Bool)

(assert (=> bs!5181 m!145545))

(assert (=> bs!5181 m!144795))

(declare-fun m!145547 () Bool)

(assert (=> bs!5181 m!145547))

(assert (=> b!124849 d!37621))

(declare-fun d!37623 () Bool)

(assert (=> d!37623 (= (get!1447 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (v!3107 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355)))))

(assert (=> b!124863 d!37623))

(declare-fun d!37625 () Bool)

(assert (=> d!37625 (= (+!163 (getCurrentListMap!511 (_keys!4492 newMap!16) (_values!2746 newMap!16) (mask!7009 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16)) (tuple2!2521 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (getCurrentListMap!511 (_keys!4492 newMap!16) (_values!2746 newMap!16) (mask!7009 newMap!16) lt!64209 (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2628 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16)))))

(declare-fun lt!64515 () Unit!3871)

(declare-fun choose!761 (array!4667 array!4669 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3425 V!3425 V!3425 Int) Unit!3871)

(assert (=> d!37625 (= lt!64515 (choose!761 (_keys!4492 newMap!16) (_values!2746 newMap!16) (mask!7009 newMap!16) (extraKeys!2548 newMap!16) lt!64209 (zeroValue!2628 newMap!16) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2628 newMap!16) (defaultEntry!2763 newMap!16)))))

(assert (=> d!37625 (validMask!0 (mask!7009 newMap!16))))

(assert (=> d!37625 (= (lemmaChangeZeroKeyThenAddPairToListMap!55 (_keys!4492 newMap!16) (_values!2746 newMap!16) (mask!7009 newMap!16) (extraKeys!2548 newMap!16) lt!64209 (zeroValue!2628 newMap!16) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2628 newMap!16) (defaultEntry!2763 newMap!16)) lt!64515)))

(declare-fun bs!5182 () Bool)

(assert (= bs!5182 d!37625))

(assert (=> bs!5182 m!144795))

(declare-fun m!145549 () Bool)

(assert (=> bs!5182 m!145549))

(assert (=> bs!5182 m!144893))

(declare-fun m!145551 () Bool)

(assert (=> bs!5182 m!145551))

(assert (=> bs!5182 m!144795))

(declare-fun m!145553 () Bool)

(assert (=> bs!5182 m!145553))

(assert (=> bs!5182 m!145065))

(assert (=> bs!5182 m!144893))

(assert (=> b!124835 d!37625))

(assert (=> bm!13270 d!37551))

(declare-fun d!37627 () Bool)

(declare-fun e!81807 () Bool)

(assert (=> d!37627 e!81807))

(declare-fun res!60633 () Bool)

(assert (=> d!37627 (=> res!60633 e!81807)))

(declare-fun lt!64516 () Bool)

(assert (=> d!37627 (= res!60633 (not lt!64516))))

(declare-fun lt!64519 () Bool)

(assert (=> d!37627 (= lt!64516 lt!64519)))

(declare-fun lt!64518 () Unit!3871)

(declare-fun e!81808 () Unit!3871)

(assert (=> d!37627 (= lt!64518 e!81808)))

(declare-fun c!22807 () Bool)

(assert (=> d!37627 (= c!22807 lt!64519)))

(assert (=> d!37627 (= lt!64519 (containsKey!170 (toList!831 call!13342) (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355)))))

(assert (=> d!37627 (= (contains!861 call!13342 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355)) lt!64516)))

(declare-fun b!125207 () Bool)

(declare-fun lt!64517 () Unit!3871)

(assert (=> b!125207 (= e!81808 lt!64517)))

(assert (=> b!125207 (= lt!64517 (lemmaContainsKeyImpliesGetValueByKeyDefined!118 (toList!831 call!13342) (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355)))))

(assert (=> b!125207 (isDefined!119 (getValueByKey!167 (toList!831 call!13342) (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355)))))

(declare-fun b!125208 () Bool)

(declare-fun Unit!3889 () Unit!3871)

(assert (=> b!125208 (= e!81808 Unit!3889)))

(declare-fun b!125209 () Bool)

(assert (=> b!125209 (= e!81807 (isDefined!119 (getValueByKey!167 (toList!831 call!13342) (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355))))))

(assert (= (and d!37627 c!22807) b!125207))

(assert (= (and d!37627 (not c!22807)) b!125208))

(assert (= (and d!37627 (not res!60633)) b!125209))

(assert (=> d!37627 m!144797))

(declare-fun m!145555 () Bool)

(assert (=> d!37627 m!145555))

(assert (=> b!125207 m!144797))

(declare-fun m!145557 () Bool)

(assert (=> b!125207 m!145557))

(assert (=> b!125207 m!144797))

(declare-fun m!145559 () Bool)

(assert (=> b!125207 m!145559))

(assert (=> b!125207 m!145559))

(declare-fun m!145561 () Bool)

(assert (=> b!125207 m!145561))

(assert (=> b!125209 m!144797))

(assert (=> b!125209 m!145559))

(assert (=> b!125209 m!145559))

(assert (=> b!125209 m!145561))

(assert (=> b!124822 d!37627))

(declare-fun d!37629 () Bool)

(assert (=> d!37629 (isDefined!119 (getValueByKey!167 (toList!831 lt!64044) (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355)))))

(declare-fun lt!64522 () Unit!3871)

(declare-fun choose!762 (List!1676 (_ BitVec 64)) Unit!3871)

(assert (=> d!37629 (= lt!64522 (choose!762 (toList!831 lt!64044) (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355)))))

(declare-fun e!81811 () Bool)

(assert (=> d!37629 e!81811))

(declare-fun res!60636 () Bool)

(assert (=> d!37629 (=> (not res!60636) (not e!81811))))

(declare-fun isStrictlySorted!303 (List!1676) Bool)

(assert (=> d!37629 (= res!60636 (isStrictlySorted!303 (toList!831 lt!64044)))))

(assert (=> d!37629 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!118 (toList!831 lt!64044) (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355)) lt!64522)))

(declare-fun b!125212 () Bool)

(assert (=> b!125212 (= e!81811 (containsKey!170 (toList!831 lt!64044) (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355)))))

(assert (= (and d!37629 res!60636) b!125212))

(assert (=> d!37629 m!144797))

(assert (=> d!37629 m!144963))

(assert (=> d!37629 m!144963))

(assert (=> d!37629 m!144965))

(assert (=> d!37629 m!144797))

(declare-fun m!145563 () Bool)

(assert (=> d!37629 m!145563))

(declare-fun m!145565 () Bool)

(assert (=> d!37629 m!145565))

(assert (=> b!125212 m!144797))

(assert (=> b!125212 m!144959))

(assert (=> b!124736 d!37629))

(assert (=> b!124736 d!37519))

(assert (=> b!124736 d!37521))

(declare-fun mapNonEmpty!4485 () Bool)

(declare-fun mapRes!4485 () Bool)

(declare-fun tp!10929 () Bool)

(declare-fun e!81812 () Bool)

(assert (=> mapNonEmpty!4485 (= mapRes!4485 (and tp!10929 e!81812))))

(declare-fun mapRest!4485 () (Array (_ BitVec 32) ValueCell!1073))

(declare-fun mapValue!4485 () ValueCell!1073)

(declare-fun mapKey!4485 () (_ BitVec 32))

(assert (=> mapNonEmpty!4485 (= mapRest!4483 (store mapRest!4485 mapKey!4485 mapValue!4485))))

(declare-fun condMapEmpty!4485 () Bool)

(declare-fun mapDefault!4485 () ValueCell!1073)

(assert (=> mapNonEmpty!4483 (= condMapEmpty!4485 (= mapRest!4483 ((as const (Array (_ BitVec 32) ValueCell!1073)) mapDefault!4485)))))

(declare-fun e!81813 () Bool)

(assert (=> mapNonEmpty!4483 (= tp!10927 (and e!81813 mapRes!4485))))

(declare-fun b!125213 () Bool)

(assert (=> b!125213 (= e!81812 tp_is_empty!2833)))

(declare-fun mapIsEmpty!4485 () Bool)

(assert (=> mapIsEmpty!4485 mapRes!4485))

(declare-fun b!125214 () Bool)

(assert (=> b!125214 (= e!81813 tp_is_empty!2833)))

(assert (= (and mapNonEmpty!4483 condMapEmpty!4485) mapIsEmpty!4485))

(assert (= (and mapNonEmpty!4483 (not condMapEmpty!4485)) mapNonEmpty!4485))

(assert (= (and mapNonEmpty!4485 ((_ is ValueCellFull!1073) mapValue!4485)) b!125213))

(assert (= (and mapNonEmpty!4483 ((_ is ValueCellFull!1073) mapDefault!4485)) b!125214))

(declare-fun m!145567 () Bool)

(assert (=> mapNonEmpty!4485 m!145567))

(declare-fun mapNonEmpty!4486 () Bool)

(declare-fun mapRes!4486 () Bool)

(declare-fun tp!10930 () Bool)

(declare-fun e!81814 () Bool)

(assert (=> mapNonEmpty!4486 (= mapRes!4486 (and tp!10930 e!81814))))

(declare-fun mapKey!4486 () (_ BitVec 32))

(declare-fun mapRest!4486 () (Array (_ BitVec 32) ValueCell!1073))

(declare-fun mapValue!4486 () ValueCell!1073)

(assert (=> mapNonEmpty!4486 (= mapRest!4484 (store mapRest!4486 mapKey!4486 mapValue!4486))))

(declare-fun condMapEmpty!4486 () Bool)

(declare-fun mapDefault!4486 () ValueCell!1073)

(assert (=> mapNonEmpty!4484 (= condMapEmpty!4486 (= mapRest!4484 ((as const (Array (_ BitVec 32) ValueCell!1073)) mapDefault!4486)))))

(declare-fun e!81815 () Bool)

(assert (=> mapNonEmpty!4484 (= tp!10928 (and e!81815 mapRes!4486))))

(declare-fun b!125215 () Bool)

(assert (=> b!125215 (= e!81814 tp_is_empty!2833)))

(declare-fun mapIsEmpty!4486 () Bool)

(assert (=> mapIsEmpty!4486 mapRes!4486))

(declare-fun b!125216 () Bool)

(assert (=> b!125216 (= e!81815 tp_is_empty!2833)))

(assert (= (and mapNonEmpty!4484 condMapEmpty!4486) mapIsEmpty!4486))

(assert (= (and mapNonEmpty!4484 (not condMapEmpty!4486)) mapNonEmpty!4486))

(assert (= (and mapNonEmpty!4486 ((_ is ValueCellFull!1073) mapValue!4486)) b!125215))

(assert (= (and mapNonEmpty!4484 ((_ is ValueCellFull!1073) mapDefault!4486)) b!125216))

(declare-fun m!145569 () Bool)

(assert (=> mapNonEmpty!4486 m!145569))

(declare-fun b_lambda!5497 () Bool)

(assert (= b_lambda!5487 (or (and b!124545 b_free!2833) (and b!124538 b_free!2835 (= (defaultEntry!2763 newMap!16) (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))))) b_lambda!5497)))

(declare-fun b_lambda!5499 () Bool)

(assert (= b_lambda!5495 (or (and b!124545 b_free!2833 (= (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) (defaultEntry!2763 newMap!16))) (and b!124538 b_free!2835) b_lambda!5499)))

(declare-fun b_lambda!5501 () Bool)

(assert (= b_lambda!5489 (or (and b!124545 b_free!2833) (and b!124538 b_free!2835 (= (defaultEntry!2763 newMap!16) (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))))) b_lambda!5501)))

(declare-fun b_lambda!5503 () Bool)

(assert (= b_lambda!5491 (or (and b!124545 b_free!2833 (= (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) (defaultEntry!2763 newMap!16))) (and b!124538 b_free!2835) b_lambda!5503)))

(declare-fun b_lambda!5505 () Bool)

(assert (= b_lambda!5493 (or (and b!124545 b_free!2833 (= (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) (defaultEntry!2763 newMap!16))) (and b!124538 b_free!2835) b_lambda!5505)))

(check-sat (not b!125143) (not b!124893) (not d!37591) (not b!125092) (not d!37573) (not d!37553) (not b!125065) (not d!37605) (not bm!13348) (not b!125074) b_and!7693 (not d!37593) (not b!125021) (not d!37551) (not b!125130) (not b!125206) (not d!37555) (not d!37567) (not b!125115) (not b!125008) (not b!125029) (not b!125129) (not bm!13381) (not b!125088) (not b_lambda!5497) (not b!124974) (not b!125027) (not b!125046) (not bm!13366) (not d!37563) (not b!125075) (not b!125186) (not b_lambda!5499) (not d!37549) (not b!125141) (not b!125113) (not d!37535) (not d!37529) (not b!125067) (not b!124942) (not b!125131) (not d!37629) (not b!124914) (not b!125072) (not d!37533) (not b!124940) (not b!125194) (not d!37601) (not d!37613) (not b!125061) (not d!37571) (not d!37585) (not d!37619) (not bm!13349) (not d!37611) (not b_next!2833) (not b_lambda!5505) (not b!124960) (not bm!13369) (not b!125190) (not bm!13394) (not d!37557) (not b!124895) (not mapNonEmpty!4486) (not b!124975) (not b!124959) (not b_next!2835) (not b!125058) tp_is_empty!2833 (not b!124892) (not b_lambda!5481) (not b!125207) (not d!37617) (not b!125001) (not b!125071) (not bm!13361) (not bm!13372) (not b!125013) (not bm!13352) (not b!125096) (not b!125038) (not b!125114) (not b!124910) (not bm!13376) (not b_lambda!5501) (not d!37621) (not b!125178) (not d!37587) (not b!125094) (not b!125132) (not b!125081) (not b!125110) (not b!125197) (not bm!13355) (not b!124891) (not b!125185) (not bm!13379) (not b!125003) (not d!37625) (not b!124970) (not b!125086) (not d!37545) (not b!125093) (not b!125102) (not b!124885) (not d!37599) (not bm!13367) (not b!124941) (not b!125212) (not b!125022) (not b!125026) (not b!125180) (not d!37569) (not b!125111) (not b!125203) (not b!125011) (not b!125209) (not b!125117) (not mapNonEmpty!4485) (not d!37607) (not d!37575) (not b!125028) (not b!124915) (not d!37565) (not b!125116) (not bm!13380) (not b!125204) (not b!125012) (not b!125119) (not b_lambda!5485) (not bm!13374) (not d!37519) (not d!37561) (not b!124972) (not bm!13358) (not d!37609) (not b!125124) (not b!125009) (not d!37581) (not d!37531) (not d!37615) (not b!125000) (not d!37559) (not b!125073) (not b!125138) (not b!125023) (not b!125007) (not b!125200) b_and!7695 (not b_lambda!5503) (not b!125128) (not b!125025) (not d!37541) (not b!125122) (not d!37577) (not b!124943) (not bm!13365) (not b!125060) (not bm!13393) (not d!37525) (not bm!13392) (not bm!13373) (not d!37595) (not b!125005) (not d!37627) (not bm!13362) (not b!125095) (not b!124894) (not d!37547) (not d!37527) (not d!37523) (not b!124949) (not b!125201))
(check-sat b_and!7693 b_and!7695 (not b_next!2833) (not b_next!2835))
(get-model)

(declare-fun d!37631 () Bool)

(declare-fun e!81816 () Bool)

(assert (=> d!37631 e!81816))

(declare-fun res!60637 () Bool)

(assert (=> d!37631 (=> res!60637 e!81816)))

(declare-fun lt!64523 () Bool)

(assert (=> d!37631 (= res!60637 (not lt!64523))))

(declare-fun lt!64526 () Bool)

(assert (=> d!37631 (= lt!64523 lt!64526)))

(declare-fun lt!64525 () Unit!3871)

(declare-fun e!81817 () Unit!3871)

(assert (=> d!37631 (= lt!64525 e!81817)))

(declare-fun c!22808 () Bool)

(assert (=> d!37631 (= c!22808 lt!64526)))

(assert (=> d!37631 (= lt!64526 (containsKey!170 (toList!831 lt!64381) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!37631 (= (contains!861 lt!64381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!64523)))

(declare-fun b!125217 () Bool)

(declare-fun lt!64524 () Unit!3871)

(assert (=> b!125217 (= e!81817 lt!64524)))

(assert (=> b!125217 (= lt!64524 (lemmaContainsKeyImpliesGetValueByKeyDefined!118 (toList!831 lt!64381) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!125217 (isDefined!119 (getValueByKey!167 (toList!831 lt!64381) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!125218 () Bool)

(declare-fun Unit!3890 () Unit!3871)

(assert (=> b!125218 (= e!81817 Unit!3890)))

(declare-fun b!125219 () Bool)

(assert (=> b!125219 (= e!81816 (isDefined!119 (getValueByKey!167 (toList!831 lt!64381) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!37631 c!22808) b!125217))

(assert (= (and d!37631 (not c!22808)) b!125218))

(assert (= (and d!37631 (not res!60637)) b!125219))

(declare-fun m!145571 () Bool)

(assert (=> d!37631 m!145571))

(declare-fun m!145573 () Bool)

(assert (=> b!125217 m!145573))

(declare-fun m!145575 () Bool)

(assert (=> b!125217 m!145575))

(assert (=> b!125217 m!145575))

(declare-fun m!145577 () Bool)

(assert (=> b!125217 m!145577))

(assert (=> b!125219 m!145575))

(assert (=> b!125219 m!145575))

(assert (=> b!125219 m!145577))

(assert (=> bm!13379 d!37631))

(declare-fun d!37633 () Bool)

(assert (=> d!37633 (= (validKeyInArray!0 (select (arr!2210 (_keys!4492 newMap!16)) #b00000000000000000000000000000000)) (and (not (= (select (arr!2210 (_keys!4492 newMap!16)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2210 (_keys!4492 newMap!16)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!125092 d!37633))

(declare-fun d!37635 () Bool)

(assert (=> d!37635 (= (isDefined!119 (getValueByKey!167 (toList!831 call!13330) (ite c!22712 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355) (select (arr!2210 (_keys!4492 newMap!16)) (index!3207 lt!64214))))) (not (isEmpty!399 (getValueByKey!167 (toList!831 call!13330) (ite c!22712 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355) (select (arr!2210 (_keys!4492 newMap!16)) (index!3207 lt!64214)))))))))

(declare-fun bs!5183 () Bool)

(assert (= bs!5183 d!37635))

(assert (=> bs!5183 m!145393))

(declare-fun m!145579 () Bool)

(assert (=> bs!5183 m!145579))

(assert (=> b!125119 d!37635))

(declare-fun b!125221 () Bool)

(declare-fun e!81818 () Option!173)

(declare-fun e!81819 () Option!173)

(assert (=> b!125221 (= e!81818 e!81819)))

(declare-fun c!22810 () Bool)

(assert (=> b!125221 (= c!22810 (and ((_ is Cons!1672) (toList!831 call!13330)) (not (= (_1!1271 (h!2273 (toList!831 call!13330))) (ite c!22712 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355) (select (arr!2210 (_keys!4492 newMap!16)) (index!3207 lt!64214)))))))))

(declare-fun b!125222 () Bool)

(assert (=> b!125222 (= e!81819 (getValueByKey!167 (t!5995 (toList!831 call!13330)) (ite c!22712 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355) (select (arr!2210 (_keys!4492 newMap!16)) (index!3207 lt!64214)))))))

(declare-fun d!37637 () Bool)

(declare-fun c!22809 () Bool)

(assert (=> d!37637 (= c!22809 (and ((_ is Cons!1672) (toList!831 call!13330)) (= (_1!1271 (h!2273 (toList!831 call!13330))) (ite c!22712 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355) (select (arr!2210 (_keys!4492 newMap!16)) (index!3207 lt!64214))))))))

(assert (=> d!37637 (= (getValueByKey!167 (toList!831 call!13330) (ite c!22712 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355) (select (arr!2210 (_keys!4492 newMap!16)) (index!3207 lt!64214)))) e!81818)))

(declare-fun b!125223 () Bool)

(assert (=> b!125223 (= e!81819 None!171)))

(declare-fun b!125220 () Bool)

(assert (=> b!125220 (= e!81818 (Some!172 (_2!1271 (h!2273 (toList!831 call!13330)))))))

(assert (= (and d!37637 c!22809) b!125220))

(assert (= (and d!37637 (not c!22809)) b!125221))

(assert (= (and b!125221 c!22810) b!125222))

(assert (= (and b!125221 (not c!22810)) b!125223))

(declare-fun m!145581 () Bool)

(assert (=> b!125222 m!145581))

(assert (=> b!125119 d!37637))

(declare-fun d!37639 () Bool)

(assert (=> d!37639 (= (inRange!0 (ite c!22744 (index!3206 lt!64252) (index!3209 lt!64252)) (mask!7009 newMap!16)) (and (bvsge (ite c!22744 (index!3206 lt!64252) (index!3209 lt!64252)) #b00000000000000000000000000000000) (bvslt (ite c!22744 (index!3206 lt!64252) (index!3209 lt!64252)) (bvadd (mask!7009 newMap!16) #b00000000000000000000000000000001))))))

(assert (=> bm!13348 d!37639))

(declare-fun d!37641 () Bool)

(declare-fun e!81820 () Bool)

(assert (=> d!37641 e!81820))

(declare-fun res!60638 () Bool)

(assert (=> d!37641 (=> (not res!60638) (not e!81820))))

(declare-fun lt!64528 () ListLongMap!1631)

(assert (=> d!37641 (= res!60638 (contains!861 lt!64528 (_1!1271 (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 newMap!16)))))))

(declare-fun lt!64529 () List!1676)

(assert (=> d!37641 (= lt!64528 (ListLongMap!1632 lt!64529))))

(declare-fun lt!64530 () Unit!3871)

(declare-fun lt!64527 () Unit!3871)

(assert (=> d!37641 (= lt!64530 lt!64527)))

(assert (=> d!37641 (= (getValueByKey!167 lt!64529 (_1!1271 (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 newMap!16)))) (Some!172 (_2!1271 (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 newMap!16)))))))

(assert (=> d!37641 (= lt!64527 (lemmaContainsTupThenGetReturnValue!82 lt!64529 (_1!1271 (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 newMap!16))) (_2!1271 (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 newMap!16)))))))

(assert (=> d!37641 (= lt!64529 (insertStrictlySorted!85 (toList!831 call!13365) (_1!1271 (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 newMap!16))) (_2!1271 (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 newMap!16)))))))

(assert (=> d!37641 (= (+!163 call!13365 (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 newMap!16))) lt!64528)))

(declare-fun b!125224 () Bool)

(declare-fun res!60639 () Bool)

(assert (=> b!125224 (=> (not res!60639) (not e!81820))))

(assert (=> b!125224 (= res!60639 (= (getValueByKey!167 (toList!831 lt!64528) (_1!1271 (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 newMap!16)))) (Some!172 (_2!1271 (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 newMap!16))))))))

(declare-fun b!125225 () Bool)

(assert (=> b!125225 (= e!81820 (contains!862 (toList!831 lt!64528) (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 newMap!16))))))

(assert (= (and d!37641 res!60638) b!125224))

(assert (= (and b!125224 res!60639) b!125225))

(declare-fun m!145583 () Bool)

(assert (=> d!37641 m!145583))

(declare-fun m!145585 () Bool)

(assert (=> d!37641 m!145585))

(declare-fun m!145587 () Bool)

(assert (=> d!37641 m!145587))

(declare-fun m!145589 () Bool)

(assert (=> d!37641 m!145589))

(declare-fun m!145591 () Bool)

(assert (=> b!125224 m!145591))

(declare-fun m!145593 () Bool)

(assert (=> b!125225 m!145593))

(assert (=> b!125081 d!37641))

(declare-fun d!37643 () Bool)

(assert (=> d!37643 (= (isEmpty!399 (getValueByKey!167 (toList!831 lt!64044) (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355))) (not ((_ is Some!172) (getValueByKey!167 (toList!831 lt!64044) (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355)))))))

(assert (=> d!37519 d!37643))

(declare-fun b!125226 () Bool)

(declare-fun e!81822 () Bool)

(assert (=> b!125226 (= e!81822 (contains!863 Nil!1674 (select (arr!2210 (_keys!4492 (_2!1272 lt!64219))) #b00000000000000000000000000000000)))))

(declare-fun b!125227 () Bool)

(declare-fun e!81821 () Bool)

(declare-fun call!13398 () Bool)

(assert (=> b!125227 (= e!81821 call!13398)))

(declare-fun bm!13395 () Bool)

(declare-fun c!22811 () Bool)

(assert (=> bm!13395 (= call!13398 (arrayNoDuplicates!0 (_keys!4492 (_2!1272 lt!64219)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!22811 (Cons!1673 (select (arr!2210 (_keys!4492 (_2!1272 lt!64219))) #b00000000000000000000000000000000) Nil!1674) Nil!1674)))))

(declare-fun b!125228 () Bool)

(declare-fun e!81824 () Bool)

(declare-fun e!81823 () Bool)

(assert (=> b!125228 (= e!81824 e!81823)))

(declare-fun res!60640 () Bool)

(assert (=> b!125228 (=> (not res!60640) (not e!81823))))

(assert (=> b!125228 (= res!60640 (not e!81822))))

(declare-fun res!60642 () Bool)

(assert (=> b!125228 (=> (not res!60642) (not e!81822))))

(assert (=> b!125228 (= res!60642 (validKeyInArray!0 (select (arr!2210 (_keys!4492 (_2!1272 lt!64219))) #b00000000000000000000000000000000)))))

(declare-fun d!37645 () Bool)

(declare-fun res!60641 () Bool)

(assert (=> d!37645 (=> res!60641 e!81824)))

(assert (=> d!37645 (= res!60641 (bvsge #b00000000000000000000000000000000 (size!2473 (_keys!4492 (_2!1272 lt!64219)))))))

(assert (=> d!37645 (= (arrayNoDuplicates!0 (_keys!4492 (_2!1272 lt!64219)) #b00000000000000000000000000000000 Nil!1674) e!81824)))

(declare-fun b!125229 () Bool)

(assert (=> b!125229 (= e!81823 e!81821)))

(assert (=> b!125229 (= c!22811 (validKeyInArray!0 (select (arr!2210 (_keys!4492 (_2!1272 lt!64219))) #b00000000000000000000000000000000)))))

(declare-fun b!125230 () Bool)

(assert (=> b!125230 (= e!81821 call!13398)))

(assert (= (and d!37645 (not res!60641)) b!125228))

(assert (= (and b!125228 res!60642) b!125226))

(assert (= (and b!125228 res!60640) b!125229))

(assert (= (and b!125229 c!22811) b!125227))

(assert (= (and b!125229 (not c!22811)) b!125230))

(assert (= (or b!125227 b!125230) bm!13395))

(declare-fun m!145595 () Bool)

(assert (=> b!125226 m!145595))

(assert (=> b!125226 m!145595))

(declare-fun m!145597 () Bool)

(assert (=> b!125226 m!145597))

(assert (=> bm!13395 m!145595))

(declare-fun m!145599 () Bool)

(assert (=> bm!13395 m!145599))

(assert (=> b!125228 m!145595))

(assert (=> b!125228 m!145595))

(declare-fun m!145601 () Bool)

(assert (=> b!125228 m!145601))

(assert (=> b!125229 m!145595))

(assert (=> b!125229 m!145595))

(assert (=> b!125229 m!145601))

(assert (=> b!125116 d!37645))

(declare-fun d!37647 () Bool)

(assert (=> d!37647 (= (get!1449 (getValueByKey!167 (toList!831 (+!163 lt!64118 (tuple2!2521 lt!64124 (zeroValue!2628 (v!3108 (underlying!436 thiss!992)))))) lt!64121)) (v!3114 (getValueByKey!167 (toList!831 (+!163 lt!64118 (tuple2!2521 lt!64124 (zeroValue!2628 (v!3108 (underlying!436 thiss!992)))))) lt!64121)))))

(assert (=> d!37573 d!37647))

(declare-fun b!125232 () Bool)

(declare-fun e!81825 () Option!173)

(declare-fun e!81826 () Option!173)

(assert (=> b!125232 (= e!81825 e!81826)))

(declare-fun c!22813 () Bool)

(assert (=> b!125232 (= c!22813 (and ((_ is Cons!1672) (toList!831 (+!163 lt!64118 (tuple2!2521 lt!64124 (zeroValue!2628 (v!3108 (underlying!436 thiss!992))))))) (not (= (_1!1271 (h!2273 (toList!831 (+!163 lt!64118 (tuple2!2521 lt!64124 (zeroValue!2628 (v!3108 (underlying!436 thiss!992)))))))) lt!64121))))))

(declare-fun b!125233 () Bool)

(assert (=> b!125233 (= e!81826 (getValueByKey!167 (t!5995 (toList!831 (+!163 lt!64118 (tuple2!2521 lt!64124 (zeroValue!2628 (v!3108 (underlying!436 thiss!992))))))) lt!64121))))

(declare-fun c!22812 () Bool)

(declare-fun d!37649 () Bool)

(assert (=> d!37649 (= c!22812 (and ((_ is Cons!1672) (toList!831 (+!163 lt!64118 (tuple2!2521 lt!64124 (zeroValue!2628 (v!3108 (underlying!436 thiss!992))))))) (= (_1!1271 (h!2273 (toList!831 (+!163 lt!64118 (tuple2!2521 lt!64124 (zeroValue!2628 (v!3108 (underlying!436 thiss!992)))))))) lt!64121)))))

(assert (=> d!37649 (= (getValueByKey!167 (toList!831 (+!163 lt!64118 (tuple2!2521 lt!64124 (zeroValue!2628 (v!3108 (underlying!436 thiss!992)))))) lt!64121) e!81825)))

(declare-fun b!125234 () Bool)

(assert (=> b!125234 (= e!81826 None!171)))

(declare-fun b!125231 () Bool)

(assert (=> b!125231 (= e!81825 (Some!172 (_2!1271 (h!2273 (toList!831 (+!163 lt!64118 (tuple2!2521 lt!64124 (zeroValue!2628 (v!3108 (underlying!436 thiss!992))))))))))))

(assert (= (and d!37649 c!22812) b!125231))

(assert (= (and d!37649 (not c!22812)) b!125232))

(assert (= (and b!125232 c!22813) b!125233))

(assert (= (and b!125232 (not c!22813)) b!125234))

(declare-fun m!145603 () Bool)

(assert (=> b!125233 m!145603))

(assert (=> d!37573 d!37649))

(assert (=> b!125212 d!37539))

(declare-fun d!37651 () Bool)

(assert (=> d!37651 (= (apply!110 lt!64381 #b1000000000000000000000000000000000000000000000000000000000000000) (get!1449 (getValueByKey!167 (toList!831 lt!64381) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!5184 () Bool)

(assert (= bs!5184 d!37651))

(assert (=> bs!5184 m!145575))

(assert (=> bs!5184 m!145575))

(declare-fun m!145605 () Bool)

(assert (=> bs!5184 m!145605))

(assert (=> b!125130 d!37651))

(declare-fun d!37653 () Bool)

(declare-fun e!81827 () Bool)

(assert (=> d!37653 e!81827))

(declare-fun res!60643 () Bool)

(assert (=> d!37653 (=> res!60643 e!81827)))

(declare-fun lt!64531 () Bool)

(assert (=> d!37653 (= res!60643 (not lt!64531))))

(declare-fun lt!64534 () Bool)

(assert (=> d!37653 (= lt!64531 lt!64534)))

(declare-fun lt!64533 () Unit!3871)

(declare-fun e!81828 () Unit!3871)

(assert (=> d!37653 (= lt!64533 e!81828)))

(declare-fun c!22814 () Bool)

(assert (=> d!37653 (= c!22814 lt!64534)))

(assert (=> d!37653 (= lt!64534 (containsKey!170 (toList!831 lt!64118) lt!64121))))

(assert (=> d!37653 (= (contains!861 lt!64118 lt!64121) lt!64531)))

(declare-fun b!125235 () Bool)

(declare-fun lt!64532 () Unit!3871)

(assert (=> b!125235 (= e!81828 lt!64532)))

(assert (=> b!125235 (= lt!64532 (lemmaContainsKeyImpliesGetValueByKeyDefined!118 (toList!831 lt!64118) lt!64121))))

(assert (=> b!125235 (isDefined!119 (getValueByKey!167 (toList!831 lt!64118) lt!64121))))

(declare-fun b!125236 () Bool)

(declare-fun Unit!3891 () Unit!3871)

(assert (=> b!125236 (= e!81828 Unit!3891)))

(declare-fun b!125237 () Bool)

(assert (=> b!125237 (= e!81827 (isDefined!119 (getValueByKey!167 (toList!831 lt!64118) lt!64121)))))

(assert (= (and d!37653 c!22814) b!125235))

(assert (= (and d!37653 (not c!22814)) b!125236))

(assert (= (and d!37653 (not res!60643)) b!125237))

(declare-fun m!145607 () Bool)

(assert (=> d!37653 m!145607))

(declare-fun m!145609 () Bool)

(assert (=> b!125235 m!145609))

(assert (=> b!125235 m!145237))

(assert (=> b!125235 m!145237))

(declare-fun m!145611 () Bool)

(assert (=> b!125235 m!145611))

(assert (=> b!125237 m!145237))

(assert (=> b!125237 m!145237))

(assert (=> b!125237 m!145611))

(assert (=> d!37563 d!37653))

(assert (=> d!37563 d!37565))

(declare-fun d!37655 () Bool)

(assert (=> d!37655 (= (apply!110 (+!163 lt!64118 (tuple2!2521 lt!64124 (zeroValue!2628 (v!3108 (underlying!436 thiss!992))))) lt!64121) (apply!110 lt!64118 lt!64121))))

(assert (=> d!37655 true))

(declare-fun _$34!942 () Unit!3871)

(assert (=> d!37655 (= (choose!755 lt!64118 lt!64124 (zeroValue!2628 (v!3108 (underlying!436 thiss!992))) lt!64121) _$34!942)))

(declare-fun bs!5185 () Bool)

(assert (= bs!5185 d!37655))

(assert (=> bs!5185 m!144915))

(assert (=> bs!5185 m!144915))

(assert (=> bs!5185 m!144917))

(assert (=> bs!5185 m!144929))

(assert (=> d!37563 d!37655))

(assert (=> d!37563 d!37573))

(assert (=> d!37563 d!37575))

(declare-fun d!37657 () Bool)

(assert (=> d!37657 (= (apply!110 lt!64351 #b0000000000000000000000000000000000000000000000000000000000000000) (get!1449 (getValueByKey!167 (toList!831 lt!64351) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!5186 () Bool)

(assert (= bs!5186 d!37657))

(declare-fun m!145613 () Bool)

(assert (=> bs!5186 m!145613))

(assert (=> bs!5186 m!145613))

(declare-fun m!145615 () Bool)

(assert (=> bs!5186 m!145615))

(assert (=> b!125095 d!37657))

(assert (=> b!125000 d!37597))

(declare-fun d!37659 () Bool)

(assert (=> d!37659 (= (inRange!0 (index!3207 lt!64327) (mask!7009 newMap!16)) (and (bvsge (index!3207 lt!64327) #b00000000000000000000000000000000) (bvslt (index!3207 lt!64327) (bvadd (mask!7009 newMap!16) #b00000000000000000000000000000001))))))

(assert (=> b!125046 d!37659))

(declare-fun d!37661 () Bool)

(assert (=> d!37661 (= (size!2479 newMap!16) (bvadd (_size!576 newMap!16) (bvsdiv (bvadd (extraKeys!2548 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000010)))))

(assert (=> b!124959 d!37661))

(declare-fun d!37663 () Bool)

(assert (=> d!37663 (= (isDefined!119 (getValueByKey!167 (toList!831 lt!64108) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (isEmpty!399 (getValueByKey!167 (toList!831 lt!64108) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bs!5187 () Bool)

(assert (= bs!5187 d!37663))

(assert (=> bs!5187 m!145377))

(declare-fun m!145617 () Bool)

(assert (=> bs!5187 m!145617))

(assert (=> b!125113 d!37663))

(declare-fun b!125240 () Bool)

(declare-fun e!81829 () Option!173)

(declare-fun e!81830 () Option!173)

(assert (=> b!125240 (= e!81829 e!81830)))

(declare-fun c!22816 () Bool)

(assert (=> b!125240 (= c!22816 (and ((_ is Cons!1672) (toList!831 lt!64108)) (not (= (_1!1271 (h!2273 (toList!831 lt!64108))) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!125241 () Bool)

(assert (=> b!125241 (= e!81830 (getValueByKey!167 (t!5995 (toList!831 lt!64108)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!37665 () Bool)

(declare-fun c!22815 () Bool)

(assert (=> d!37665 (= c!22815 (and ((_ is Cons!1672) (toList!831 lt!64108)) (= (_1!1271 (h!2273 (toList!831 lt!64108))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!37665 (= (getValueByKey!167 (toList!831 lt!64108) #b1000000000000000000000000000000000000000000000000000000000000000) e!81829)))

(declare-fun b!125242 () Bool)

(assert (=> b!125242 (= e!81830 None!171)))

(declare-fun b!125239 () Bool)

(assert (=> b!125239 (= e!81829 (Some!172 (_2!1271 (h!2273 (toList!831 lt!64108)))))))

(assert (= (and d!37665 c!22815) b!125239))

(assert (= (and d!37665 (not c!22815)) b!125240))

(assert (= (and b!125240 c!22816) b!125241))

(assert (= (and b!125240 (not c!22816)) b!125242))

(declare-fun m!145619 () Bool)

(assert (=> b!125241 m!145619))

(assert (=> b!125113 d!37665))

(declare-fun d!37667 () Bool)

(assert (=> d!37667 (contains!861 (+!163 lt!64343 (tuple2!2521 lt!64335 (zeroValue!2628 newMap!16))) lt!64330)))

(declare-fun lt!64535 () Unit!3871)

(assert (=> d!37667 (= lt!64535 (choose!756 lt!64343 lt!64335 (zeroValue!2628 newMap!16) lt!64330))))

(assert (=> d!37667 (contains!861 lt!64343 lt!64330)))

(assert (=> d!37667 (= (addStillContains!86 lt!64343 lt!64335 (zeroValue!2628 newMap!16) lt!64330) lt!64535)))

(declare-fun bs!5188 () Bool)

(assert (= bs!5188 d!37667))

(assert (=> bs!5188 m!145301))

(assert (=> bs!5188 m!145301))

(assert (=> bs!5188 m!145303))

(declare-fun m!145621 () Bool)

(assert (=> bs!5188 m!145621))

(declare-fun m!145623 () Bool)

(assert (=> bs!5188 m!145623))

(assert (=> b!125067 d!37667))

(declare-fun d!37669 () Bool)

(assert (=> d!37669 (= (apply!110 lt!64331 lt!64349) (get!1449 (getValueByKey!167 (toList!831 lt!64331) lt!64349)))))

(declare-fun bs!5189 () Bool)

(assert (= bs!5189 d!37669))

(declare-fun m!145625 () Bool)

(assert (=> bs!5189 m!145625))

(assert (=> bs!5189 m!145625))

(declare-fun m!145627 () Bool)

(assert (=> bs!5189 m!145627))

(assert (=> b!125067 d!37669))

(declare-fun d!37671 () Bool)

(assert (=> d!37671 (= (apply!110 (+!163 lt!64331 (tuple2!2521 lt!64338 (minValue!2628 newMap!16))) lt!64349) (get!1449 (getValueByKey!167 (toList!831 (+!163 lt!64331 (tuple2!2521 lt!64338 (minValue!2628 newMap!16)))) lt!64349)))))

(declare-fun bs!5190 () Bool)

(assert (= bs!5190 d!37671))

(declare-fun m!145629 () Bool)

(assert (=> bs!5190 m!145629))

(assert (=> bs!5190 m!145629))

(declare-fun m!145631 () Bool)

(assert (=> bs!5190 m!145631))

(assert (=> b!125067 d!37671))

(declare-fun d!37673 () Bool)

(declare-fun e!81831 () Bool)

(assert (=> d!37673 e!81831))

(declare-fun res!60644 () Bool)

(assert (=> d!37673 (=> (not res!60644) (not e!81831))))

(declare-fun lt!64537 () ListLongMap!1631)

(assert (=> d!37673 (= res!60644 (contains!861 lt!64537 (_1!1271 (tuple2!2521 lt!64338 (minValue!2628 newMap!16)))))))

(declare-fun lt!64538 () List!1676)

(assert (=> d!37673 (= lt!64537 (ListLongMap!1632 lt!64538))))

(declare-fun lt!64539 () Unit!3871)

(declare-fun lt!64536 () Unit!3871)

(assert (=> d!37673 (= lt!64539 lt!64536)))

(assert (=> d!37673 (= (getValueByKey!167 lt!64538 (_1!1271 (tuple2!2521 lt!64338 (minValue!2628 newMap!16)))) (Some!172 (_2!1271 (tuple2!2521 lt!64338 (minValue!2628 newMap!16)))))))

(assert (=> d!37673 (= lt!64536 (lemmaContainsTupThenGetReturnValue!82 lt!64538 (_1!1271 (tuple2!2521 lt!64338 (minValue!2628 newMap!16))) (_2!1271 (tuple2!2521 lt!64338 (minValue!2628 newMap!16)))))))

(assert (=> d!37673 (= lt!64538 (insertStrictlySorted!85 (toList!831 lt!64331) (_1!1271 (tuple2!2521 lt!64338 (minValue!2628 newMap!16))) (_2!1271 (tuple2!2521 lt!64338 (minValue!2628 newMap!16)))))))

(assert (=> d!37673 (= (+!163 lt!64331 (tuple2!2521 lt!64338 (minValue!2628 newMap!16))) lt!64537)))

(declare-fun b!125243 () Bool)

(declare-fun res!60645 () Bool)

(assert (=> b!125243 (=> (not res!60645) (not e!81831))))

(assert (=> b!125243 (= res!60645 (= (getValueByKey!167 (toList!831 lt!64537) (_1!1271 (tuple2!2521 lt!64338 (minValue!2628 newMap!16)))) (Some!172 (_2!1271 (tuple2!2521 lt!64338 (minValue!2628 newMap!16))))))))

(declare-fun b!125244 () Bool)

(assert (=> b!125244 (= e!81831 (contains!862 (toList!831 lt!64537) (tuple2!2521 lt!64338 (minValue!2628 newMap!16))))))

(assert (= (and d!37673 res!60644) b!125243))

(assert (= (and b!125243 res!60645) b!125244))

(declare-fun m!145633 () Bool)

(assert (=> d!37673 m!145633))

(declare-fun m!145635 () Bool)

(assert (=> d!37673 m!145635))

(declare-fun m!145637 () Bool)

(assert (=> d!37673 m!145637))

(declare-fun m!145639 () Bool)

(assert (=> d!37673 m!145639))

(declare-fun m!145641 () Bool)

(assert (=> b!125243 m!145641))

(declare-fun m!145643 () Bool)

(assert (=> b!125244 m!145643))

(assert (=> b!125067 d!37673))

(declare-fun d!37675 () Bool)

(declare-fun e!81832 () Bool)

(assert (=> d!37675 e!81832))

(declare-fun res!60646 () Bool)

(assert (=> d!37675 (=> (not res!60646) (not e!81832))))

(declare-fun lt!64541 () ListLongMap!1631)

(assert (=> d!37675 (= res!60646 (contains!861 lt!64541 (_1!1271 (tuple2!2521 lt!64346 (minValue!2628 newMap!16)))))))

(declare-fun lt!64542 () List!1676)

(assert (=> d!37675 (= lt!64541 (ListLongMap!1632 lt!64542))))

(declare-fun lt!64543 () Unit!3871)

(declare-fun lt!64540 () Unit!3871)

(assert (=> d!37675 (= lt!64543 lt!64540)))

(assert (=> d!37675 (= (getValueByKey!167 lt!64542 (_1!1271 (tuple2!2521 lt!64346 (minValue!2628 newMap!16)))) (Some!172 (_2!1271 (tuple2!2521 lt!64346 (minValue!2628 newMap!16)))))))

(assert (=> d!37675 (= lt!64540 (lemmaContainsTupThenGetReturnValue!82 lt!64542 (_1!1271 (tuple2!2521 lt!64346 (minValue!2628 newMap!16))) (_2!1271 (tuple2!2521 lt!64346 (minValue!2628 newMap!16)))))))

(assert (=> d!37675 (= lt!64542 (insertStrictlySorted!85 (toList!831 lt!64337) (_1!1271 (tuple2!2521 lt!64346 (minValue!2628 newMap!16))) (_2!1271 (tuple2!2521 lt!64346 (minValue!2628 newMap!16)))))))

(assert (=> d!37675 (= (+!163 lt!64337 (tuple2!2521 lt!64346 (minValue!2628 newMap!16))) lt!64541)))

(declare-fun b!125245 () Bool)

(declare-fun res!60647 () Bool)

(assert (=> b!125245 (=> (not res!60647) (not e!81832))))

(assert (=> b!125245 (= res!60647 (= (getValueByKey!167 (toList!831 lt!64541) (_1!1271 (tuple2!2521 lt!64346 (minValue!2628 newMap!16)))) (Some!172 (_2!1271 (tuple2!2521 lt!64346 (minValue!2628 newMap!16))))))))

(declare-fun b!125246 () Bool)

(assert (=> b!125246 (= e!81832 (contains!862 (toList!831 lt!64541) (tuple2!2521 lt!64346 (minValue!2628 newMap!16))))))

(assert (= (and d!37675 res!60646) b!125245))

(assert (= (and b!125245 res!60647) b!125246))

(declare-fun m!145645 () Bool)

(assert (=> d!37675 m!145645))

(declare-fun m!145647 () Bool)

(assert (=> d!37675 m!145647))

(declare-fun m!145649 () Bool)

(assert (=> d!37675 m!145649))

(declare-fun m!145651 () Bool)

(assert (=> d!37675 m!145651))

(declare-fun m!145653 () Bool)

(assert (=> b!125245 m!145653))

(declare-fun m!145655 () Bool)

(assert (=> b!125246 m!145655))

(assert (=> b!125067 d!37675))

(declare-fun d!37677 () Bool)

(declare-fun e!81833 () Bool)

(assert (=> d!37677 e!81833))

(declare-fun res!60648 () Bool)

(assert (=> d!37677 (=> (not res!60648) (not e!81833))))

(declare-fun lt!64545 () ListLongMap!1631)

(assert (=> d!37677 (= res!60648 (contains!861 lt!64545 (_1!1271 (tuple2!2521 lt!64345 (zeroValue!2628 newMap!16)))))))

(declare-fun lt!64546 () List!1676)

(assert (=> d!37677 (= lt!64545 (ListLongMap!1632 lt!64546))))

(declare-fun lt!64547 () Unit!3871)

(declare-fun lt!64544 () Unit!3871)

(assert (=> d!37677 (= lt!64547 lt!64544)))

(assert (=> d!37677 (= (getValueByKey!167 lt!64546 (_1!1271 (tuple2!2521 lt!64345 (zeroValue!2628 newMap!16)))) (Some!172 (_2!1271 (tuple2!2521 lt!64345 (zeroValue!2628 newMap!16)))))))

(assert (=> d!37677 (= lt!64544 (lemmaContainsTupThenGetReturnValue!82 lt!64546 (_1!1271 (tuple2!2521 lt!64345 (zeroValue!2628 newMap!16))) (_2!1271 (tuple2!2521 lt!64345 (zeroValue!2628 newMap!16)))))))

(assert (=> d!37677 (= lt!64546 (insertStrictlySorted!85 (toList!831 lt!64339) (_1!1271 (tuple2!2521 lt!64345 (zeroValue!2628 newMap!16))) (_2!1271 (tuple2!2521 lt!64345 (zeroValue!2628 newMap!16)))))))

(assert (=> d!37677 (= (+!163 lt!64339 (tuple2!2521 lt!64345 (zeroValue!2628 newMap!16))) lt!64545)))

(declare-fun b!125247 () Bool)

(declare-fun res!60649 () Bool)

(assert (=> b!125247 (=> (not res!60649) (not e!81833))))

(assert (=> b!125247 (= res!60649 (= (getValueByKey!167 (toList!831 lt!64545) (_1!1271 (tuple2!2521 lt!64345 (zeroValue!2628 newMap!16)))) (Some!172 (_2!1271 (tuple2!2521 lt!64345 (zeroValue!2628 newMap!16))))))))

(declare-fun b!125248 () Bool)

(assert (=> b!125248 (= e!81833 (contains!862 (toList!831 lt!64545) (tuple2!2521 lt!64345 (zeroValue!2628 newMap!16))))))

(assert (= (and d!37677 res!60648) b!125247))

(assert (= (and b!125247 res!60649) b!125248))

(declare-fun m!145657 () Bool)

(assert (=> d!37677 m!145657))

(declare-fun m!145659 () Bool)

(assert (=> d!37677 m!145659))

(declare-fun m!145661 () Bool)

(assert (=> d!37677 m!145661))

(declare-fun m!145663 () Bool)

(assert (=> d!37677 m!145663))

(declare-fun m!145665 () Bool)

(assert (=> b!125247 m!145665))

(declare-fun m!145667 () Bool)

(assert (=> b!125248 m!145667))

(assert (=> b!125067 d!37677))

(declare-fun d!37679 () Bool)

(declare-fun e!81834 () Bool)

(assert (=> d!37679 e!81834))

(declare-fun res!60650 () Bool)

(assert (=> d!37679 (=> res!60650 e!81834)))

(declare-fun lt!64548 () Bool)

(assert (=> d!37679 (= res!60650 (not lt!64548))))

(declare-fun lt!64551 () Bool)

(assert (=> d!37679 (= lt!64548 lt!64551)))

(declare-fun lt!64550 () Unit!3871)

(declare-fun e!81835 () Unit!3871)

(assert (=> d!37679 (= lt!64550 e!81835)))

(declare-fun c!22817 () Bool)

(assert (=> d!37679 (= c!22817 lt!64551)))

(assert (=> d!37679 (= lt!64551 (containsKey!170 (toList!831 (+!163 lt!64343 (tuple2!2521 lt!64335 (zeroValue!2628 newMap!16)))) lt!64330))))

(assert (=> d!37679 (= (contains!861 (+!163 lt!64343 (tuple2!2521 lt!64335 (zeroValue!2628 newMap!16))) lt!64330) lt!64548)))

(declare-fun b!125249 () Bool)

(declare-fun lt!64549 () Unit!3871)

(assert (=> b!125249 (= e!81835 lt!64549)))

(assert (=> b!125249 (= lt!64549 (lemmaContainsKeyImpliesGetValueByKeyDefined!118 (toList!831 (+!163 lt!64343 (tuple2!2521 lt!64335 (zeroValue!2628 newMap!16)))) lt!64330))))

(assert (=> b!125249 (isDefined!119 (getValueByKey!167 (toList!831 (+!163 lt!64343 (tuple2!2521 lt!64335 (zeroValue!2628 newMap!16)))) lt!64330))))

(declare-fun b!125250 () Bool)

(declare-fun Unit!3892 () Unit!3871)

(assert (=> b!125250 (= e!81835 Unit!3892)))

(declare-fun b!125251 () Bool)

(assert (=> b!125251 (= e!81834 (isDefined!119 (getValueByKey!167 (toList!831 (+!163 lt!64343 (tuple2!2521 lt!64335 (zeroValue!2628 newMap!16)))) lt!64330)))))

(assert (= (and d!37679 c!22817) b!125249))

(assert (= (and d!37679 (not c!22817)) b!125250))

(assert (= (and d!37679 (not res!60650)) b!125251))

(declare-fun m!145669 () Bool)

(assert (=> d!37679 m!145669))

(declare-fun m!145671 () Bool)

(assert (=> b!125249 m!145671))

(declare-fun m!145673 () Bool)

(assert (=> b!125249 m!145673))

(assert (=> b!125249 m!145673))

(declare-fun m!145675 () Bool)

(assert (=> b!125249 m!145675))

(assert (=> b!125251 m!145673))

(assert (=> b!125251 m!145673))

(assert (=> b!125251 m!145675))

(assert (=> b!125067 d!37679))

(declare-fun d!37681 () Bool)

(declare-fun e!81836 () Bool)

(assert (=> d!37681 e!81836))

(declare-fun res!60651 () Bool)

(assert (=> d!37681 (=> (not res!60651) (not e!81836))))

(declare-fun lt!64553 () ListLongMap!1631)

(assert (=> d!37681 (= res!60651 (contains!861 lt!64553 (_1!1271 (tuple2!2521 lt!64335 (zeroValue!2628 newMap!16)))))))

(declare-fun lt!64554 () List!1676)

(assert (=> d!37681 (= lt!64553 (ListLongMap!1632 lt!64554))))

(declare-fun lt!64555 () Unit!3871)

(declare-fun lt!64552 () Unit!3871)

(assert (=> d!37681 (= lt!64555 lt!64552)))

(assert (=> d!37681 (= (getValueByKey!167 lt!64554 (_1!1271 (tuple2!2521 lt!64335 (zeroValue!2628 newMap!16)))) (Some!172 (_2!1271 (tuple2!2521 lt!64335 (zeroValue!2628 newMap!16)))))))

(assert (=> d!37681 (= lt!64552 (lemmaContainsTupThenGetReturnValue!82 lt!64554 (_1!1271 (tuple2!2521 lt!64335 (zeroValue!2628 newMap!16))) (_2!1271 (tuple2!2521 lt!64335 (zeroValue!2628 newMap!16)))))))

(assert (=> d!37681 (= lt!64554 (insertStrictlySorted!85 (toList!831 lt!64343) (_1!1271 (tuple2!2521 lt!64335 (zeroValue!2628 newMap!16))) (_2!1271 (tuple2!2521 lt!64335 (zeroValue!2628 newMap!16)))))))

(assert (=> d!37681 (= (+!163 lt!64343 (tuple2!2521 lt!64335 (zeroValue!2628 newMap!16))) lt!64553)))

(declare-fun b!125252 () Bool)

(declare-fun res!60652 () Bool)

(assert (=> b!125252 (=> (not res!60652) (not e!81836))))

(assert (=> b!125252 (= res!60652 (= (getValueByKey!167 (toList!831 lt!64553) (_1!1271 (tuple2!2521 lt!64335 (zeroValue!2628 newMap!16)))) (Some!172 (_2!1271 (tuple2!2521 lt!64335 (zeroValue!2628 newMap!16))))))))

(declare-fun b!125253 () Bool)

(assert (=> b!125253 (= e!81836 (contains!862 (toList!831 lt!64553) (tuple2!2521 lt!64335 (zeroValue!2628 newMap!16))))))

(assert (= (and d!37681 res!60651) b!125252))

(assert (= (and b!125252 res!60652) b!125253))

(declare-fun m!145677 () Bool)

(assert (=> d!37681 m!145677))

(declare-fun m!145679 () Bool)

(assert (=> d!37681 m!145679))

(declare-fun m!145681 () Bool)

(assert (=> d!37681 m!145681))

(declare-fun m!145683 () Bool)

(assert (=> d!37681 m!145683))

(declare-fun m!145685 () Bool)

(assert (=> b!125252 m!145685))

(declare-fun m!145687 () Bool)

(assert (=> b!125253 m!145687))

(assert (=> b!125067 d!37681))

(declare-fun d!37683 () Bool)

(assert (=> d!37683 (= (apply!110 (+!163 lt!64337 (tuple2!2521 lt!64346 (minValue!2628 newMap!16))) lt!64332) (apply!110 lt!64337 lt!64332))))

(declare-fun lt!64556 () Unit!3871)

(assert (=> d!37683 (= lt!64556 (choose!755 lt!64337 lt!64346 (minValue!2628 newMap!16) lt!64332))))

(declare-fun e!81837 () Bool)

(assert (=> d!37683 e!81837))

(declare-fun res!60653 () Bool)

(assert (=> d!37683 (=> (not res!60653) (not e!81837))))

(assert (=> d!37683 (= res!60653 (contains!861 lt!64337 lt!64332))))

(assert (=> d!37683 (= (addApplyDifferent!86 lt!64337 lt!64346 (minValue!2628 newMap!16) lt!64332) lt!64556)))

(declare-fun b!125254 () Bool)

(assert (=> b!125254 (= e!81837 (not (= lt!64332 lt!64346)))))

(assert (= (and d!37683 res!60653) b!125254))

(assert (=> d!37683 m!145293))

(assert (=> d!37683 m!145307))

(declare-fun m!145689 () Bool)

(assert (=> d!37683 m!145689))

(declare-fun m!145691 () Bool)

(assert (=> d!37683 m!145691))

(assert (=> d!37683 m!145307))

(assert (=> d!37683 m!145309))

(assert (=> b!125067 d!37683))

(declare-fun d!37685 () Bool)

(assert (=> d!37685 (= (apply!110 (+!163 lt!64339 (tuple2!2521 lt!64345 (zeroValue!2628 newMap!16))) lt!64342) (apply!110 lt!64339 lt!64342))))

(declare-fun lt!64557 () Unit!3871)

(assert (=> d!37685 (= lt!64557 (choose!755 lt!64339 lt!64345 (zeroValue!2628 newMap!16) lt!64342))))

(declare-fun e!81838 () Bool)

(assert (=> d!37685 e!81838))

(declare-fun res!60654 () Bool)

(assert (=> d!37685 (=> (not res!60654) (not e!81838))))

(assert (=> d!37685 (= res!60654 (contains!861 lt!64339 lt!64342))))

(assert (=> d!37685 (= (addApplyDifferent!86 lt!64339 lt!64345 (zeroValue!2628 newMap!16) lt!64342) lt!64557)))

(declare-fun b!125255 () Bool)

(assert (=> b!125255 (= e!81838 (not (= lt!64342 lt!64345)))))

(assert (= (and d!37685 res!60654) b!125255))

(assert (=> d!37685 m!145299))

(assert (=> d!37685 m!145285))

(declare-fun m!145693 () Bool)

(assert (=> d!37685 m!145693))

(declare-fun m!145695 () Bool)

(assert (=> d!37685 m!145695))

(assert (=> d!37685 m!145285))

(assert (=> d!37685 m!145287))

(assert (=> b!125067 d!37685))

(declare-fun d!37687 () Bool)

(assert (=> d!37687 (= (apply!110 lt!64337 lt!64332) (get!1449 (getValueByKey!167 (toList!831 lt!64337) lt!64332)))))

(declare-fun bs!5191 () Bool)

(assert (= bs!5191 d!37687))

(declare-fun m!145697 () Bool)

(assert (=> bs!5191 m!145697))

(assert (=> bs!5191 m!145697))

(declare-fun m!145699 () Bool)

(assert (=> bs!5191 m!145699))

(assert (=> b!125067 d!37687))

(declare-fun b!125256 () Bool)

(declare-fun e!81840 () ListLongMap!1631)

(declare-fun e!81845 () ListLongMap!1631)

(assert (=> b!125256 (= e!81840 e!81845)))

(declare-fun c!22819 () Bool)

(assert (=> b!125256 (= c!22819 (validKeyInArray!0 (select (arr!2210 (_keys!4492 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun e!81844 () Bool)

(declare-fun b!125257 () Bool)

(declare-fun lt!64563 () ListLongMap!1631)

(assert (=> b!125257 (= e!81844 (= lt!64563 (getCurrentListMapNoExtraKeys!130 (_keys!4492 newMap!16) (ite c!22717 (_values!2746 newMap!16) (array!4670 (store (arr!2211 (_values!2746 newMap!16)) (index!3207 lt!64214) (ValueCellFull!1073 (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2474 (_values!2746 newMap!16)))) (mask!7009 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!2763 newMap!16))))))

(declare-fun b!125258 () Bool)

(declare-fun e!81841 () Bool)

(assert (=> b!125258 (= e!81841 e!81844)))

(declare-fun c!22820 () Bool)

(assert (=> b!125258 (= c!22820 (bvslt #b00000000000000000000000000000000 (size!2473 (_keys!4492 newMap!16))))))

(declare-fun b!125259 () Bool)

(declare-fun lt!64564 () Unit!3871)

(declare-fun lt!64561 () Unit!3871)

(assert (=> b!125259 (= lt!64564 lt!64561)))

(declare-fun lt!64559 () (_ BitVec 64))

(declare-fun lt!64562 () V!3425)

(declare-fun lt!64558 () ListLongMap!1631)

(declare-fun lt!64560 () (_ BitVec 64))

(assert (=> b!125259 (not (contains!861 (+!163 lt!64558 (tuple2!2521 lt!64559 lt!64562)) lt!64560))))

(assert (=> b!125259 (= lt!64561 (addStillNotContains!57 lt!64558 lt!64559 lt!64562 lt!64560))))

(assert (=> b!125259 (= lt!64560 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!125259 (= lt!64562 (get!1446 (select (arr!2211 (ite c!22717 (_values!2746 newMap!16) (array!4670 (store (arr!2211 (_values!2746 newMap!16)) (index!3207 lt!64214) (ValueCellFull!1073 (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2474 (_values!2746 newMap!16))))) #b00000000000000000000000000000000) (dynLambda!415 (defaultEntry!2763 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!125259 (= lt!64559 (select (arr!2210 (_keys!4492 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun call!13399 () ListLongMap!1631)

(assert (=> b!125259 (= lt!64558 call!13399)))

(assert (=> b!125259 (= e!81845 (+!163 call!13399 (tuple2!2521 (select (arr!2210 (_keys!4492 newMap!16)) #b00000000000000000000000000000000) (get!1446 (select (arr!2211 (ite c!22717 (_values!2746 newMap!16) (array!4670 (store (arr!2211 (_values!2746 newMap!16)) (index!3207 lt!64214) (ValueCellFull!1073 (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2474 (_values!2746 newMap!16))))) #b00000000000000000000000000000000) (dynLambda!415 (defaultEntry!2763 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!125260 () Bool)

(assert (=> b!125260 (= e!81840 (ListLongMap!1632 Nil!1673))))

(declare-fun b!125261 () Bool)

(declare-fun e!81839 () Bool)

(assert (=> b!125261 (= e!81839 (validKeyInArray!0 (select (arr!2210 (_keys!4492 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!125261 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!125262 () Bool)

(assert (=> b!125262 (= e!81845 call!13399)))

(declare-fun b!125263 () Bool)

(assert (=> b!125263 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2473 (_keys!4492 newMap!16))))))

(assert (=> b!125263 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2474 (ite c!22717 (_values!2746 newMap!16) (array!4670 (store (arr!2211 (_values!2746 newMap!16)) (index!3207 lt!64214) (ValueCellFull!1073 (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2474 (_values!2746 newMap!16)))))))))

(declare-fun e!81842 () Bool)

(assert (=> b!125263 (= e!81842 (= (apply!110 lt!64563 (select (arr!2210 (_keys!4492 newMap!16)) #b00000000000000000000000000000000)) (get!1446 (select (arr!2211 (ite c!22717 (_values!2746 newMap!16) (array!4670 (store (arr!2211 (_values!2746 newMap!16)) (index!3207 lt!64214) (ValueCellFull!1073 (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2474 (_values!2746 newMap!16))))) #b00000000000000000000000000000000) (dynLambda!415 (defaultEntry!2763 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!125265 () Bool)

(assert (=> b!125265 (= e!81841 e!81842)))

(assert (=> b!125265 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2473 (_keys!4492 newMap!16))))))

(declare-fun res!60657 () Bool)

(assert (=> b!125265 (= res!60657 (contains!861 lt!64563 (select (arr!2210 (_keys!4492 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!125265 (=> (not res!60657) (not e!81842))))

(declare-fun b!125266 () Bool)

(declare-fun e!81843 () Bool)

(assert (=> b!125266 (= e!81843 e!81841)))

(declare-fun c!22818 () Bool)

(assert (=> b!125266 (= c!22818 e!81839)))

(declare-fun res!60655 () Bool)

(assert (=> b!125266 (=> (not res!60655) (not e!81839))))

(assert (=> b!125266 (= res!60655 (bvslt #b00000000000000000000000000000000 (size!2473 (_keys!4492 newMap!16))))))

(declare-fun bm!13396 () Bool)

(assert (=> bm!13396 (= call!13399 (getCurrentListMapNoExtraKeys!130 (_keys!4492 newMap!16) (ite c!22717 (_values!2746 newMap!16) (array!4670 (store (arr!2211 (_values!2746 newMap!16)) (index!3207 lt!64214) (ValueCellFull!1073 (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2474 (_values!2746 newMap!16)))) (mask!7009 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!2763 newMap!16)))))

(declare-fun b!125267 () Bool)

(declare-fun res!60656 () Bool)

(assert (=> b!125267 (=> (not res!60656) (not e!81843))))

(assert (=> b!125267 (= res!60656 (not (contains!861 lt!64563 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!37689 () Bool)

(assert (=> d!37689 e!81843))

(declare-fun res!60658 () Bool)

(assert (=> d!37689 (=> (not res!60658) (not e!81843))))

(assert (=> d!37689 (= res!60658 (not (contains!861 lt!64563 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!37689 (= lt!64563 e!81840)))

(declare-fun c!22821 () Bool)

(assert (=> d!37689 (= c!22821 (bvsge #b00000000000000000000000000000000 (size!2473 (_keys!4492 newMap!16))))))

(assert (=> d!37689 (validMask!0 (mask!7009 newMap!16))))

(assert (=> d!37689 (= (getCurrentListMapNoExtraKeys!130 (_keys!4492 newMap!16) (ite c!22717 (_values!2746 newMap!16) (array!4670 (store (arr!2211 (_values!2746 newMap!16)) (index!3207 lt!64214) (ValueCellFull!1073 (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2474 (_values!2746 newMap!16)))) (mask!7009 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16)) lt!64563)))

(declare-fun b!125264 () Bool)

(assert (=> b!125264 (= e!81844 (isEmpty!400 lt!64563))))

(assert (= (and d!37689 c!22821) b!125260))

(assert (= (and d!37689 (not c!22821)) b!125256))

(assert (= (and b!125256 c!22819) b!125259))

(assert (= (and b!125256 (not c!22819)) b!125262))

(assert (= (or b!125259 b!125262) bm!13396))

(assert (= (and d!37689 res!60658) b!125267))

(assert (= (and b!125267 res!60656) b!125266))

(assert (= (and b!125266 res!60655) b!125261))

(assert (= (and b!125266 c!22818) b!125265))

(assert (= (and b!125266 (not c!22818)) b!125258))

(assert (= (and b!125265 res!60657) b!125263))

(assert (= (and b!125258 c!22820) b!125257))

(assert (= (and b!125258 (not c!22820)) b!125264))

(declare-fun b_lambda!5507 () Bool)

(assert (=> (not b_lambda!5507) (not b!125259)))

(assert (=> b!125259 t!6006))

(declare-fun b_and!7697 () Bool)

(assert (= b_and!7693 (and (=> t!6006 result!3815) b_and!7697)))

(assert (=> b!125259 t!6008))

(declare-fun b_and!7699 () Bool)

(assert (= b_and!7695 (and (=> t!6008 result!3817) b_and!7699)))

(declare-fun b_lambda!5509 () Bool)

(assert (=> (not b_lambda!5509) (not b!125263)))

(assert (=> b!125263 t!6006))

(declare-fun b_and!7701 () Bool)

(assert (= b_and!7697 (and (=> t!6006 result!3815) b_and!7701)))

(assert (=> b!125263 t!6008))

(declare-fun b_and!7703 () Bool)

(assert (= b_and!7699 (and (=> t!6008 result!3817) b_and!7703)))

(declare-fun m!145701 () Bool)

(assert (=> b!125257 m!145701))

(assert (=> b!125265 m!145113))

(assert (=> b!125265 m!145113))

(declare-fun m!145703 () Bool)

(assert (=> b!125265 m!145703))

(declare-fun m!145705 () Bool)

(assert (=> b!125267 m!145705))

(declare-fun m!145707 () Bool)

(assert (=> b!125264 m!145707))

(assert (=> bm!13396 m!145701))

(assert (=> b!125263 m!145277))

(assert (=> b!125263 m!145279))

(assert (=> b!125263 m!145277))

(assert (=> b!125263 m!145281))

(assert (=> b!125263 m!145279))

(assert (=> b!125263 m!145113))

(assert (=> b!125263 m!145113))

(declare-fun m!145709 () Bool)

(assert (=> b!125263 m!145709))

(declare-fun m!145711 () Bool)

(assert (=> d!37689 m!145711))

(assert (=> d!37689 m!145065))

(assert (=> b!125261 m!145113))

(assert (=> b!125261 m!145113))

(assert (=> b!125261 m!145115))

(declare-fun m!145713 () Bool)

(assert (=> b!125259 m!145713))

(declare-fun m!145715 () Bool)

(assert (=> b!125259 m!145715))

(declare-fun m!145717 () Bool)

(assert (=> b!125259 m!145717))

(assert (=> b!125259 m!145277))

(assert (=> b!125259 m!145113))

(declare-fun m!145719 () Bool)

(assert (=> b!125259 m!145719))

(assert (=> b!125259 m!145279))

(assert (=> b!125259 m!145277))

(assert (=> b!125259 m!145281))

(assert (=> b!125259 m!145279))

(assert (=> b!125259 m!145713))

(assert (=> b!125256 m!145113))

(assert (=> b!125256 m!145113))

(assert (=> b!125256 m!145115))

(assert (=> b!125067 d!37689))

(declare-fun d!37691 () Bool)

(assert (=> d!37691 (= (apply!110 lt!64339 lt!64342) (get!1449 (getValueByKey!167 (toList!831 lt!64339) lt!64342)))))

(declare-fun bs!5192 () Bool)

(assert (= bs!5192 d!37691))

(declare-fun m!145721 () Bool)

(assert (=> bs!5192 m!145721))

(assert (=> bs!5192 m!145721))

(declare-fun m!145723 () Bool)

(assert (=> bs!5192 m!145723))

(assert (=> b!125067 d!37691))

(declare-fun d!37693 () Bool)

(assert (=> d!37693 (= (apply!110 (+!163 lt!64337 (tuple2!2521 lt!64346 (minValue!2628 newMap!16))) lt!64332) (get!1449 (getValueByKey!167 (toList!831 (+!163 lt!64337 (tuple2!2521 lt!64346 (minValue!2628 newMap!16)))) lt!64332)))))

(declare-fun bs!5193 () Bool)

(assert (= bs!5193 d!37693))

(declare-fun m!145725 () Bool)

(assert (=> bs!5193 m!145725))

(assert (=> bs!5193 m!145725))

(declare-fun m!145727 () Bool)

(assert (=> bs!5193 m!145727))

(assert (=> b!125067 d!37693))

(declare-fun d!37695 () Bool)

(assert (=> d!37695 (= (apply!110 (+!163 lt!64331 (tuple2!2521 lt!64338 (minValue!2628 newMap!16))) lt!64349) (apply!110 lt!64331 lt!64349))))

(declare-fun lt!64565 () Unit!3871)

(assert (=> d!37695 (= lt!64565 (choose!755 lt!64331 lt!64338 (minValue!2628 newMap!16) lt!64349))))

(declare-fun e!81846 () Bool)

(assert (=> d!37695 e!81846))

(declare-fun res!60659 () Bool)

(assert (=> d!37695 (=> (not res!60659) (not e!81846))))

(assert (=> d!37695 (= res!60659 (contains!861 lt!64331 lt!64349))))

(assert (=> d!37695 (= (addApplyDifferent!86 lt!64331 lt!64338 (minValue!2628 newMap!16) lt!64349) lt!64565)))

(declare-fun b!125268 () Bool)

(assert (=> b!125268 (= e!81846 (not (= lt!64349 lt!64338)))))

(assert (= (and d!37695 res!60659) b!125268))

(assert (=> d!37695 m!145295))

(assert (=> d!37695 m!145289))

(declare-fun m!145729 () Bool)

(assert (=> d!37695 m!145729))

(declare-fun m!145731 () Bool)

(assert (=> d!37695 m!145731))

(assert (=> d!37695 m!145289))

(assert (=> d!37695 m!145291))

(assert (=> b!125067 d!37695))

(declare-fun d!37697 () Bool)

(assert (=> d!37697 (= (apply!110 (+!163 lt!64339 (tuple2!2521 lt!64345 (zeroValue!2628 newMap!16))) lt!64342) (get!1449 (getValueByKey!167 (toList!831 (+!163 lt!64339 (tuple2!2521 lt!64345 (zeroValue!2628 newMap!16)))) lt!64342)))))

(declare-fun bs!5194 () Bool)

(assert (= bs!5194 d!37697))

(declare-fun m!145733 () Bool)

(assert (=> bs!5194 m!145733))

(assert (=> bs!5194 m!145733))

(declare-fun m!145735 () Bool)

(assert (=> bs!5194 m!145735))

(assert (=> b!125067 d!37697))

(declare-fun b!125269 () Bool)

(declare-fun e!81848 () ListLongMap!1631)

(declare-fun e!81853 () ListLongMap!1631)

(assert (=> b!125269 (= e!81848 e!81853)))

(declare-fun c!22823 () Bool)

(assert (=> b!125269 (= c!22823 (validKeyInArray!0 (select (arr!2210 (_keys!4492 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!125270 () Bool)

(declare-fun e!81852 () Bool)

(declare-fun lt!64571 () ListLongMap!1631)

(assert (=> b!125270 (= e!81852 (= lt!64571 (getCurrentListMapNoExtraKeys!130 (_keys!4492 newMap!16) (_values!2746 newMap!16) (mask!7009 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!2763 newMap!16))))))

(declare-fun b!125271 () Bool)

(declare-fun e!81849 () Bool)

(assert (=> b!125271 (= e!81849 e!81852)))

(declare-fun c!22824 () Bool)

(assert (=> b!125271 (= c!22824 (bvslt #b00000000000000000000000000000000 (size!2473 (_keys!4492 newMap!16))))))

(declare-fun b!125272 () Bool)

(declare-fun lt!64572 () Unit!3871)

(declare-fun lt!64569 () Unit!3871)

(assert (=> b!125272 (= lt!64572 lt!64569)))

(declare-fun lt!64570 () V!3425)

(declare-fun lt!64566 () ListLongMap!1631)

(declare-fun lt!64567 () (_ BitVec 64))

(declare-fun lt!64568 () (_ BitVec 64))

(assert (=> b!125272 (not (contains!861 (+!163 lt!64566 (tuple2!2521 lt!64567 lt!64570)) lt!64568))))

(assert (=> b!125272 (= lt!64569 (addStillNotContains!57 lt!64566 lt!64567 lt!64570 lt!64568))))

(assert (=> b!125272 (= lt!64568 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!125272 (= lt!64570 (get!1446 (select (arr!2211 (_values!2746 newMap!16)) #b00000000000000000000000000000000) (dynLambda!415 (defaultEntry!2763 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!125272 (= lt!64567 (select (arr!2210 (_keys!4492 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun call!13400 () ListLongMap!1631)

(assert (=> b!125272 (= lt!64566 call!13400)))

(assert (=> b!125272 (= e!81853 (+!163 call!13400 (tuple2!2521 (select (arr!2210 (_keys!4492 newMap!16)) #b00000000000000000000000000000000) (get!1446 (select (arr!2211 (_values!2746 newMap!16)) #b00000000000000000000000000000000) (dynLambda!415 (defaultEntry!2763 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!125273 () Bool)

(assert (=> b!125273 (= e!81848 (ListLongMap!1632 Nil!1673))))

(declare-fun b!125274 () Bool)

(declare-fun e!81847 () Bool)

(assert (=> b!125274 (= e!81847 (validKeyInArray!0 (select (arr!2210 (_keys!4492 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!125274 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!125275 () Bool)

(assert (=> b!125275 (= e!81853 call!13400)))

(declare-fun b!125276 () Bool)

(assert (=> b!125276 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2473 (_keys!4492 newMap!16))))))

(assert (=> b!125276 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2474 (_values!2746 newMap!16))))))

(declare-fun e!81850 () Bool)

(assert (=> b!125276 (= e!81850 (= (apply!110 lt!64571 (select (arr!2210 (_keys!4492 newMap!16)) #b00000000000000000000000000000000)) (get!1446 (select (arr!2211 (_values!2746 newMap!16)) #b00000000000000000000000000000000) (dynLambda!415 (defaultEntry!2763 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!125278 () Bool)

(assert (=> b!125278 (= e!81849 e!81850)))

(assert (=> b!125278 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2473 (_keys!4492 newMap!16))))))

(declare-fun res!60662 () Bool)

(assert (=> b!125278 (= res!60662 (contains!861 lt!64571 (select (arr!2210 (_keys!4492 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!125278 (=> (not res!60662) (not e!81850))))

(declare-fun b!125279 () Bool)

(declare-fun e!81851 () Bool)

(assert (=> b!125279 (= e!81851 e!81849)))

(declare-fun c!22822 () Bool)

(assert (=> b!125279 (= c!22822 e!81847)))

(declare-fun res!60660 () Bool)

(assert (=> b!125279 (=> (not res!60660) (not e!81847))))

(assert (=> b!125279 (= res!60660 (bvslt #b00000000000000000000000000000000 (size!2473 (_keys!4492 newMap!16))))))

(declare-fun bm!13397 () Bool)

(assert (=> bm!13397 (= call!13400 (getCurrentListMapNoExtraKeys!130 (_keys!4492 newMap!16) (_values!2746 newMap!16) (mask!7009 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!2763 newMap!16)))))

(declare-fun b!125280 () Bool)

(declare-fun res!60661 () Bool)

(assert (=> b!125280 (=> (not res!60661) (not e!81851))))

(assert (=> b!125280 (= res!60661 (not (contains!861 lt!64571 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!37699 () Bool)

(assert (=> d!37699 e!81851))

(declare-fun res!60663 () Bool)

(assert (=> d!37699 (=> (not res!60663) (not e!81851))))

(assert (=> d!37699 (= res!60663 (not (contains!861 lt!64571 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!37699 (= lt!64571 e!81848)))

(declare-fun c!22825 () Bool)

(assert (=> d!37699 (= c!22825 (bvsge #b00000000000000000000000000000000 (size!2473 (_keys!4492 newMap!16))))))

(assert (=> d!37699 (validMask!0 (mask!7009 newMap!16))))

(assert (=> d!37699 (= (getCurrentListMapNoExtraKeys!130 (_keys!4492 newMap!16) (_values!2746 newMap!16) (mask!7009 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16)) lt!64571)))

(declare-fun b!125277 () Bool)

(assert (=> b!125277 (= e!81852 (isEmpty!400 lt!64571))))

(assert (= (and d!37699 c!22825) b!125273))

(assert (= (and d!37699 (not c!22825)) b!125269))

(assert (= (and b!125269 c!22823) b!125272))

(assert (= (and b!125269 (not c!22823)) b!125275))

(assert (= (or b!125272 b!125275) bm!13397))

(assert (= (and d!37699 res!60663) b!125280))

(assert (= (and b!125280 res!60661) b!125279))

(assert (= (and b!125279 res!60660) b!125274))

(assert (= (and b!125279 c!22822) b!125278))

(assert (= (and b!125279 (not c!22822)) b!125271))

(assert (= (and b!125278 res!60662) b!125276))

(assert (= (and b!125271 c!22824) b!125270))

(assert (= (and b!125271 (not c!22824)) b!125277))

(declare-fun b_lambda!5511 () Bool)

(assert (=> (not b_lambda!5511) (not b!125272)))

(assert (=> b!125272 t!6006))

(declare-fun b_and!7705 () Bool)

(assert (= b_and!7701 (and (=> t!6006 result!3815) b_and!7705)))

(assert (=> b!125272 t!6008))

(declare-fun b_and!7707 () Bool)

(assert (= b_and!7703 (and (=> t!6008 result!3817) b_and!7707)))

(declare-fun b_lambda!5513 () Bool)

(assert (=> (not b_lambda!5513) (not b!125276)))

(assert (=> b!125276 t!6006))

(declare-fun b_and!7709 () Bool)

(assert (= b_and!7705 (and (=> t!6006 result!3815) b_and!7709)))

(assert (=> b!125276 t!6008))

(declare-fun b_and!7711 () Bool)

(assert (= b_and!7707 (and (=> t!6008 result!3817) b_and!7711)))

(declare-fun m!145737 () Bool)

(assert (=> b!125270 m!145737))

(assert (=> b!125278 m!145113))

(assert (=> b!125278 m!145113))

(declare-fun m!145739 () Bool)

(assert (=> b!125278 m!145739))

(declare-fun m!145741 () Bool)

(assert (=> b!125280 m!145741))

(declare-fun m!145743 () Bool)

(assert (=> b!125277 m!145743))

(assert (=> bm!13397 m!145737))

(assert (=> b!125276 m!145277))

(assert (=> b!125276 m!145331))

(assert (=> b!125276 m!145277))

(assert (=> b!125276 m!145333))

(assert (=> b!125276 m!145331))

(assert (=> b!125276 m!145113))

(assert (=> b!125276 m!145113))

(declare-fun m!145745 () Bool)

(assert (=> b!125276 m!145745))

(declare-fun m!145747 () Bool)

(assert (=> d!37699 m!145747))

(assert (=> d!37699 m!145065))

(assert (=> b!125274 m!145113))

(assert (=> b!125274 m!145113))

(assert (=> b!125274 m!145115))

(declare-fun m!145749 () Bool)

(assert (=> b!125272 m!145749))

(declare-fun m!145751 () Bool)

(assert (=> b!125272 m!145751))

(declare-fun m!145753 () Bool)

(assert (=> b!125272 m!145753))

(assert (=> b!125272 m!145277))

(assert (=> b!125272 m!145113))

(declare-fun m!145755 () Bool)

(assert (=> b!125272 m!145755))

(assert (=> b!125272 m!145331))

(assert (=> b!125272 m!145277))

(assert (=> b!125272 m!145333))

(assert (=> b!125272 m!145331))

(assert (=> b!125272 m!145749))

(assert (=> b!125269 m!145113))

(assert (=> b!125269 m!145113))

(assert (=> b!125269 m!145115))

(assert (=> bm!13374 d!37699))

(assert (=> b!125038 d!37633))

(declare-fun b!125281 () Bool)

(declare-fun e!81855 () Bool)

(assert (=> b!125281 (= e!81855 (contains!863 Nil!1674 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun b!125282 () Bool)

(declare-fun e!81854 () Bool)

(declare-fun call!13401 () Bool)

(assert (=> b!125282 (= e!81854 call!13401)))

(declare-fun bm!13398 () Bool)

(declare-fun c!22826 () Bool)

(assert (=> bm!13398 (= call!13401 (arrayNoDuplicates!0 (_keys!4492 (v!3108 (underlying!436 thiss!992))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!22826 (Cons!1673 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) #b00000000000000000000000000000000) Nil!1674) Nil!1674)))))

(declare-fun b!125283 () Bool)

(declare-fun e!81857 () Bool)

(declare-fun e!81856 () Bool)

(assert (=> b!125283 (= e!81857 e!81856)))

(declare-fun res!60664 () Bool)

(assert (=> b!125283 (=> (not res!60664) (not e!81856))))

(assert (=> b!125283 (= res!60664 (not e!81855))))

(declare-fun res!60666 () Bool)

(assert (=> b!125283 (=> (not res!60666) (not e!81855))))

(assert (=> b!125283 (= res!60666 (validKeyInArray!0 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun d!37701 () Bool)

(declare-fun res!60665 () Bool)

(assert (=> d!37701 (=> res!60665 e!81857)))

(assert (=> d!37701 (= res!60665 (bvsge #b00000000000000000000000000000000 (size!2473 (_keys!4492 (v!3108 (underlying!436 thiss!992))))))))

(assert (=> d!37701 (= (arrayNoDuplicates!0 (_keys!4492 (v!3108 (underlying!436 thiss!992))) #b00000000000000000000000000000000 Nil!1674) e!81857)))

(declare-fun b!125284 () Bool)

(assert (=> b!125284 (= e!81856 e!81854)))

(assert (=> b!125284 (= c!22826 (validKeyInArray!0 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun b!125285 () Bool)

(assert (=> b!125285 (= e!81854 call!13401)))

(assert (= (and d!37701 (not res!60665)) b!125283))

(assert (= (and b!125283 res!60666) b!125281))

(assert (= (and b!125283 res!60664) b!125284))

(assert (= (and b!125284 c!22826) b!125282))

(assert (= (and b!125284 (not c!22826)) b!125285))

(assert (= (or b!125282 b!125285) bm!13398))

(declare-fun m!145757 () Bool)

(assert (=> b!125281 m!145757))

(assert (=> b!125281 m!145757))

(declare-fun m!145759 () Bool)

(assert (=> b!125281 m!145759))

(assert (=> bm!13398 m!145757))

(declare-fun m!145761 () Bool)

(assert (=> bm!13398 m!145761))

(assert (=> b!125283 m!145757))

(assert (=> b!125283 m!145757))

(declare-fun m!145763 () Bool)

(assert (=> b!125283 m!145763))

(assert (=> b!125284 m!145757))

(assert (=> b!125284 m!145757))

(assert (=> b!125284 m!145763))

(assert (=> b!124895 d!37701))

(declare-fun d!37703 () Bool)

(declare-fun e!81858 () Bool)

(assert (=> d!37703 e!81858))

(declare-fun res!60667 () Bool)

(assert (=> d!37703 (=> res!60667 e!81858)))

(declare-fun lt!64573 () Bool)

(assert (=> d!37703 (= res!60667 (not lt!64573))))

(declare-fun lt!64576 () Bool)

(assert (=> d!37703 (= lt!64573 lt!64576)))

(declare-fun lt!64575 () Unit!3871)

(declare-fun e!81859 () Unit!3871)

(assert (=> d!37703 (= lt!64575 e!81859)))

(declare-fun c!22827 () Bool)

(assert (=> d!37703 (= c!22827 lt!64576)))

(assert (=> d!37703 (= lt!64576 (containsKey!170 (toList!831 lt!64292) (_1!1271 (tuple2!2521 lt!64117 (minValue!2628 (v!3108 (underlying!436 thiss!992)))))))))

(assert (=> d!37703 (= (contains!861 lt!64292 (_1!1271 (tuple2!2521 lt!64117 (minValue!2628 (v!3108 (underlying!436 thiss!992)))))) lt!64573)))

(declare-fun b!125286 () Bool)

(declare-fun lt!64574 () Unit!3871)

(assert (=> b!125286 (= e!81859 lt!64574)))

(assert (=> b!125286 (= lt!64574 (lemmaContainsKeyImpliesGetValueByKeyDefined!118 (toList!831 lt!64292) (_1!1271 (tuple2!2521 lt!64117 (minValue!2628 (v!3108 (underlying!436 thiss!992)))))))))

(assert (=> b!125286 (isDefined!119 (getValueByKey!167 (toList!831 lt!64292) (_1!1271 (tuple2!2521 lt!64117 (minValue!2628 (v!3108 (underlying!436 thiss!992)))))))))

(declare-fun b!125287 () Bool)

(declare-fun Unit!3893 () Unit!3871)

(assert (=> b!125287 (= e!81859 Unit!3893)))

(declare-fun b!125288 () Bool)

(assert (=> b!125288 (= e!81858 (isDefined!119 (getValueByKey!167 (toList!831 lt!64292) (_1!1271 (tuple2!2521 lt!64117 (minValue!2628 (v!3108 (underlying!436 thiss!992))))))))))

(assert (= (and d!37703 c!22827) b!125286))

(assert (= (and d!37703 (not c!22827)) b!125287))

(assert (= (and d!37703 (not res!60667)) b!125288))

(declare-fun m!145765 () Bool)

(assert (=> d!37703 m!145765))

(declare-fun m!145767 () Bool)

(assert (=> b!125286 m!145767))

(assert (=> b!125286 m!145173))

(assert (=> b!125286 m!145173))

(declare-fun m!145769 () Bool)

(assert (=> b!125286 m!145769))

(assert (=> b!125288 m!145173))

(assert (=> b!125288 m!145173))

(assert (=> b!125288 m!145769))

(assert (=> d!37553 d!37703))

(declare-fun b!125290 () Bool)

(declare-fun e!81860 () Option!173)

(declare-fun e!81861 () Option!173)

(assert (=> b!125290 (= e!81860 e!81861)))

(declare-fun c!22829 () Bool)

(assert (=> b!125290 (= c!22829 (and ((_ is Cons!1672) lt!64293) (not (= (_1!1271 (h!2273 lt!64293)) (_1!1271 (tuple2!2521 lt!64117 (minValue!2628 (v!3108 (underlying!436 thiss!992)))))))))))

(declare-fun b!125291 () Bool)

(assert (=> b!125291 (= e!81861 (getValueByKey!167 (t!5995 lt!64293) (_1!1271 (tuple2!2521 lt!64117 (minValue!2628 (v!3108 (underlying!436 thiss!992)))))))))

(declare-fun c!22828 () Bool)

(declare-fun d!37705 () Bool)

(assert (=> d!37705 (= c!22828 (and ((_ is Cons!1672) lt!64293) (= (_1!1271 (h!2273 lt!64293)) (_1!1271 (tuple2!2521 lt!64117 (minValue!2628 (v!3108 (underlying!436 thiss!992))))))))))

(assert (=> d!37705 (= (getValueByKey!167 lt!64293 (_1!1271 (tuple2!2521 lt!64117 (minValue!2628 (v!3108 (underlying!436 thiss!992)))))) e!81860)))

(declare-fun b!125292 () Bool)

(assert (=> b!125292 (= e!81861 None!171)))

(declare-fun b!125289 () Bool)

(assert (=> b!125289 (= e!81860 (Some!172 (_2!1271 (h!2273 lt!64293))))))

(assert (= (and d!37705 c!22828) b!125289))

(assert (= (and d!37705 (not c!22828)) b!125290))

(assert (= (and b!125290 c!22829) b!125291))

(assert (= (and b!125290 (not c!22829)) b!125292))

(declare-fun m!145771 () Bool)

(assert (=> b!125291 m!145771))

(assert (=> d!37553 d!37705))

(declare-fun d!37707 () Bool)

(assert (=> d!37707 (= (getValueByKey!167 lt!64293 (_1!1271 (tuple2!2521 lt!64117 (minValue!2628 (v!3108 (underlying!436 thiss!992)))))) (Some!172 (_2!1271 (tuple2!2521 lt!64117 (minValue!2628 (v!3108 (underlying!436 thiss!992)))))))))

(declare-fun lt!64579 () Unit!3871)

(declare-fun choose!763 (List!1676 (_ BitVec 64) V!3425) Unit!3871)

(assert (=> d!37707 (= lt!64579 (choose!763 lt!64293 (_1!1271 (tuple2!2521 lt!64117 (minValue!2628 (v!3108 (underlying!436 thiss!992))))) (_2!1271 (tuple2!2521 lt!64117 (minValue!2628 (v!3108 (underlying!436 thiss!992)))))))))

(declare-fun e!81864 () Bool)

(assert (=> d!37707 e!81864))

(declare-fun res!60672 () Bool)

(assert (=> d!37707 (=> (not res!60672) (not e!81864))))

(assert (=> d!37707 (= res!60672 (isStrictlySorted!303 lt!64293))))

(assert (=> d!37707 (= (lemmaContainsTupThenGetReturnValue!82 lt!64293 (_1!1271 (tuple2!2521 lt!64117 (minValue!2628 (v!3108 (underlying!436 thiss!992))))) (_2!1271 (tuple2!2521 lt!64117 (minValue!2628 (v!3108 (underlying!436 thiss!992)))))) lt!64579)))

(declare-fun b!125297 () Bool)

(declare-fun res!60673 () Bool)

(assert (=> b!125297 (=> (not res!60673) (not e!81864))))

(assert (=> b!125297 (= res!60673 (containsKey!170 lt!64293 (_1!1271 (tuple2!2521 lt!64117 (minValue!2628 (v!3108 (underlying!436 thiss!992)))))))))

(declare-fun b!125298 () Bool)

(assert (=> b!125298 (= e!81864 (contains!862 lt!64293 (tuple2!2521 (_1!1271 (tuple2!2521 lt!64117 (minValue!2628 (v!3108 (underlying!436 thiss!992))))) (_2!1271 (tuple2!2521 lt!64117 (minValue!2628 (v!3108 (underlying!436 thiss!992))))))))))

(assert (= (and d!37707 res!60672) b!125297))

(assert (= (and b!125297 res!60673) b!125298))

(assert (=> d!37707 m!145167))

(declare-fun m!145773 () Bool)

(assert (=> d!37707 m!145773))

(declare-fun m!145775 () Bool)

(assert (=> d!37707 m!145775))

(declare-fun m!145777 () Bool)

(assert (=> b!125297 m!145777))

(declare-fun m!145779 () Bool)

(assert (=> b!125298 m!145779))

(assert (=> d!37553 d!37707))

(declare-fun b!125319 () Bool)

(declare-fun e!81875 () List!1676)

(declare-fun call!13410 () List!1676)

(assert (=> b!125319 (= e!81875 call!13410)))

(declare-fun b!125320 () Bool)

(declare-fun c!22838 () Bool)

(assert (=> b!125320 (= c!22838 (and ((_ is Cons!1672) (toList!831 lt!64110)) (bvsgt (_1!1271 (h!2273 (toList!831 lt!64110))) (_1!1271 (tuple2!2521 lt!64117 (minValue!2628 (v!3108 (underlying!436 thiss!992))))))))))

(declare-fun e!81879 () List!1676)

(assert (=> b!125320 (= e!81879 e!81875)))

(declare-fun b!125321 () Bool)

(declare-fun res!60679 () Bool)

(declare-fun e!81878 () Bool)

(assert (=> b!125321 (=> (not res!60679) (not e!81878))))

(declare-fun lt!64582 () List!1676)

(assert (=> b!125321 (= res!60679 (containsKey!170 lt!64582 (_1!1271 (tuple2!2521 lt!64117 (minValue!2628 (v!3108 (underlying!436 thiss!992)))))))))

(declare-fun d!37709 () Bool)

(assert (=> d!37709 e!81878))

(declare-fun res!60678 () Bool)

(assert (=> d!37709 (=> (not res!60678) (not e!81878))))

(assert (=> d!37709 (= res!60678 (isStrictlySorted!303 lt!64582))))

(declare-fun e!81876 () List!1676)

(assert (=> d!37709 (= lt!64582 e!81876)))

(declare-fun c!22840 () Bool)

(assert (=> d!37709 (= c!22840 (and ((_ is Cons!1672) (toList!831 lt!64110)) (bvslt (_1!1271 (h!2273 (toList!831 lt!64110))) (_1!1271 (tuple2!2521 lt!64117 (minValue!2628 (v!3108 (underlying!436 thiss!992))))))))))

(assert (=> d!37709 (isStrictlySorted!303 (toList!831 lt!64110))))

(assert (=> d!37709 (= (insertStrictlySorted!85 (toList!831 lt!64110) (_1!1271 (tuple2!2521 lt!64117 (minValue!2628 (v!3108 (underlying!436 thiss!992))))) (_2!1271 (tuple2!2521 lt!64117 (minValue!2628 (v!3108 (underlying!436 thiss!992)))))) lt!64582)))

(declare-fun b!125322 () Bool)

(declare-fun call!13408 () List!1676)

(assert (=> b!125322 (= e!81876 call!13408)))

(declare-fun b!125323 () Bool)

(assert (=> b!125323 (= e!81878 (contains!862 lt!64582 (tuple2!2521 (_1!1271 (tuple2!2521 lt!64117 (minValue!2628 (v!3108 (underlying!436 thiss!992))))) (_2!1271 (tuple2!2521 lt!64117 (minValue!2628 (v!3108 (underlying!436 thiss!992))))))))))

(declare-fun bm!13405 () Bool)

(declare-fun e!81877 () List!1676)

(declare-fun $colon$colon!87 (List!1676 tuple2!2520) List!1676)

(assert (=> bm!13405 (= call!13408 ($colon$colon!87 e!81877 (ite c!22840 (h!2273 (toList!831 lt!64110)) (tuple2!2521 (_1!1271 (tuple2!2521 lt!64117 (minValue!2628 (v!3108 (underlying!436 thiss!992))))) (_2!1271 (tuple2!2521 lt!64117 (minValue!2628 (v!3108 (underlying!436 thiss!992)))))))))))

(declare-fun c!22841 () Bool)

(assert (=> bm!13405 (= c!22841 c!22840)))

(declare-fun bm!13406 () Bool)

(declare-fun call!13409 () List!1676)

(assert (=> bm!13406 (= call!13409 call!13408)))

(declare-fun bm!13407 () Bool)

(assert (=> bm!13407 (= call!13410 call!13409)))

(declare-fun b!125324 () Bool)

(assert (=> b!125324 (= e!81876 e!81879)))

(declare-fun c!22839 () Bool)

(assert (=> b!125324 (= c!22839 (and ((_ is Cons!1672) (toList!831 lt!64110)) (= (_1!1271 (h!2273 (toList!831 lt!64110))) (_1!1271 (tuple2!2521 lt!64117 (minValue!2628 (v!3108 (underlying!436 thiss!992))))))))))

(declare-fun b!125325 () Bool)

(assert (=> b!125325 (= e!81875 call!13410)))

(declare-fun b!125326 () Bool)

(assert (=> b!125326 (= e!81877 (ite c!22839 (t!5995 (toList!831 lt!64110)) (ite c!22838 (Cons!1672 (h!2273 (toList!831 lt!64110)) (t!5995 (toList!831 lt!64110))) Nil!1673)))))

(declare-fun b!125327 () Bool)

(assert (=> b!125327 (= e!81877 (insertStrictlySorted!85 (t!5995 (toList!831 lt!64110)) (_1!1271 (tuple2!2521 lt!64117 (minValue!2628 (v!3108 (underlying!436 thiss!992))))) (_2!1271 (tuple2!2521 lt!64117 (minValue!2628 (v!3108 (underlying!436 thiss!992)))))))))

(declare-fun b!125328 () Bool)

(assert (=> b!125328 (= e!81879 call!13409)))

(assert (= (and d!37709 c!22840) b!125322))

(assert (= (and d!37709 (not c!22840)) b!125324))

(assert (= (and b!125324 c!22839) b!125328))

(assert (= (and b!125324 (not c!22839)) b!125320))

(assert (= (and b!125320 c!22838) b!125319))

(assert (= (and b!125320 (not c!22838)) b!125325))

(assert (= (or b!125319 b!125325) bm!13407))

(assert (= (or b!125328 bm!13407) bm!13406))

(assert (= (or b!125322 bm!13406) bm!13405))

(assert (= (and bm!13405 c!22841) b!125327))

(assert (= (and bm!13405 (not c!22841)) b!125326))

(assert (= (and d!37709 res!60678) b!125321))

(assert (= (and b!125321 res!60679) b!125323))

(declare-fun m!145781 () Bool)

(assert (=> d!37709 m!145781))

(declare-fun m!145783 () Bool)

(assert (=> d!37709 m!145783))

(declare-fun m!145785 () Bool)

(assert (=> bm!13405 m!145785))

(declare-fun m!145787 () Bool)

(assert (=> b!125323 m!145787))

(declare-fun m!145789 () Bool)

(assert (=> b!125321 m!145789))

(declare-fun m!145791 () Bool)

(assert (=> b!125327 m!145791))

(assert (=> d!37553 d!37709))

(declare-fun d!37711 () Bool)

(declare-fun lt!64585 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!124 (List!1676) (InoxSet tuple2!2520))

(assert (=> d!37711 (= lt!64585 (select (content!124 (toList!831 lt!64231)) (ite (or c!22677 c!22679) (tuple2!2521 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2628 (v!3108 (underlying!436 thiss!992)))) (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 (v!3108 (underlying!436 thiss!992)))))))))

(declare-fun e!81884 () Bool)

(assert (=> d!37711 (= lt!64585 e!81884)))

(declare-fun res!60684 () Bool)

(assert (=> d!37711 (=> (not res!60684) (not e!81884))))

(assert (=> d!37711 (= res!60684 ((_ is Cons!1672) (toList!831 lt!64231)))))

(assert (=> d!37711 (= (contains!862 (toList!831 lt!64231) (ite (or c!22677 c!22679) (tuple2!2521 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2628 (v!3108 (underlying!436 thiss!992)))) (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 (v!3108 (underlying!436 thiss!992)))))) lt!64585)))

(declare-fun b!125333 () Bool)

(declare-fun e!81885 () Bool)

(assert (=> b!125333 (= e!81884 e!81885)))

(declare-fun res!60685 () Bool)

(assert (=> b!125333 (=> res!60685 e!81885)))

(assert (=> b!125333 (= res!60685 (= (h!2273 (toList!831 lt!64231)) (ite (or c!22677 c!22679) (tuple2!2521 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2628 (v!3108 (underlying!436 thiss!992)))) (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 (v!3108 (underlying!436 thiss!992)))))))))

(declare-fun b!125334 () Bool)

(assert (=> b!125334 (= e!81885 (contains!862 (t!5995 (toList!831 lt!64231)) (ite (or c!22677 c!22679) (tuple2!2521 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2628 (v!3108 (underlying!436 thiss!992)))) (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 (v!3108 (underlying!436 thiss!992)))))))))

(assert (= (and d!37711 res!60684) b!125333))

(assert (= (and b!125333 (not res!60685)) b!125334))

(declare-fun m!145793 () Bool)

(assert (=> d!37711 m!145793))

(declare-fun m!145795 () Bool)

(assert (=> d!37711 m!145795))

(declare-fun m!145797 () Bool)

(assert (=> b!125334 m!145797))

(assert (=> b!124892 d!37711))

(declare-fun d!37713 () Bool)

(declare-fun e!81886 () Bool)

(assert (=> d!37713 e!81886))

(declare-fun res!60686 () Bool)

(assert (=> d!37713 (=> res!60686 e!81886)))

(declare-fun lt!64586 () Bool)

(assert (=> d!37713 (= res!60686 (not lt!64586))))

(declare-fun lt!64589 () Bool)

(assert (=> d!37713 (= lt!64586 lt!64589)))

(declare-fun lt!64588 () Unit!3871)

(declare-fun e!81887 () Unit!3871)

(assert (=> d!37713 (= lt!64588 e!81887)))

(declare-fun c!22842 () Bool)

(assert (=> d!37713 (= c!22842 lt!64589)))

(assert (=> d!37713 (= lt!64589 (containsKey!170 (toList!831 lt!64329) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!37713 (= (contains!861 lt!64329 #b1000000000000000000000000000000000000000000000000000000000000000) lt!64586)))

(declare-fun b!125335 () Bool)

(declare-fun lt!64587 () Unit!3871)

(assert (=> b!125335 (= e!81887 lt!64587)))

(assert (=> b!125335 (= lt!64587 (lemmaContainsKeyImpliesGetValueByKeyDefined!118 (toList!831 lt!64329) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!125335 (isDefined!119 (getValueByKey!167 (toList!831 lt!64329) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!125336 () Bool)

(declare-fun Unit!3894 () Unit!3871)

(assert (=> b!125336 (= e!81887 Unit!3894)))

(declare-fun b!125337 () Bool)

(assert (=> b!125337 (= e!81886 (isDefined!119 (getValueByKey!167 (toList!831 lt!64329) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!37713 c!22842) b!125335))

(assert (= (and d!37713 (not c!22842)) b!125336))

(assert (= (and d!37713 (not res!60686)) b!125337))

(declare-fun m!145799 () Bool)

(assert (=> d!37713 m!145799))

(declare-fun m!145801 () Bool)

(assert (=> b!125335 m!145801))

(declare-fun m!145803 () Bool)

(assert (=> b!125335 m!145803))

(assert (=> b!125335 m!145803))

(declare-fun m!145805 () Bool)

(assert (=> b!125335 m!145805))

(assert (=> b!125337 m!145803))

(assert (=> b!125337 m!145803))

(assert (=> b!125337 m!145805))

(assert (=> bm!13365 d!37713))

(declare-fun d!37715 () Bool)

(assert (=> d!37715 (= (inRange!0 (ite c!22802 (index!3207 lt!64493) (ite c!22801 (index!3206 lt!64488) (index!3209 lt!64488))) (mask!7009 newMap!16)) (and (bvsge (ite c!22802 (index!3207 lt!64493) (ite c!22801 (index!3206 lt!64488) (index!3209 lt!64488))) #b00000000000000000000000000000000) (bvslt (ite c!22802 (index!3207 lt!64493) (ite c!22801 (index!3206 lt!64488) (index!3209 lt!64488))) (bvadd (mask!7009 newMap!16) #b00000000000000000000000000000001))))))

(assert (=> bm!13392 d!37715))

(declare-fun d!37717 () Bool)

(declare-fun e!81888 () Bool)

(assert (=> d!37717 e!81888))

(declare-fun res!60687 () Bool)

(assert (=> d!37717 (=> (not res!60687) (not e!81888))))

(declare-fun lt!64591 () ListLongMap!1631)

(assert (=> d!37717 (= res!60687 (contains!861 lt!64591 (_1!1271 (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 newMap!16)))))))

(declare-fun lt!64592 () List!1676)

(assert (=> d!37717 (= lt!64591 (ListLongMap!1632 lt!64592))))

(declare-fun lt!64593 () Unit!3871)

(declare-fun lt!64590 () Unit!3871)

(assert (=> d!37717 (= lt!64593 lt!64590)))

(assert (=> d!37717 (= (getValueByKey!167 lt!64592 (_1!1271 (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 newMap!16)))) (Some!172 (_2!1271 (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 newMap!16)))))))

(assert (=> d!37717 (= lt!64590 (lemmaContainsTupThenGetReturnValue!82 lt!64592 (_1!1271 (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 newMap!16))) (_2!1271 (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 newMap!16)))))))

(assert (=> d!37717 (= lt!64592 (insertStrictlySorted!85 (toList!831 call!13372) (_1!1271 (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 newMap!16))) (_2!1271 (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 newMap!16)))))))

(assert (=> d!37717 (= (+!163 call!13372 (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 newMap!16))) lt!64591)))

(declare-fun b!125338 () Bool)

(declare-fun res!60688 () Bool)

(assert (=> b!125338 (=> (not res!60688) (not e!81888))))

(assert (=> b!125338 (= res!60688 (= (getValueByKey!167 (toList!831 lt!64591) (_1!1271 (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 newMap!16)))) (Some!172 (_2!1271 (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 newMap!16))))))))

(declare-fun b!125339 () Bool)

(assert (=> b!125339 (= e!81888 (contains!862 (toList!831 lt!64591) (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 newMap!16))))))

(assert (= (and d!37717 res!60687) b!125338))

(assert (= (and b!125338 res!60688) b!125339))

(declare-fun m!145807 () Bool)

(assert (=> d!37717 m!145807))

(declare-fun m!145809 () Bool)

(assert (=> d!37717 m!145809))

(declare-fun m!145811 () Bool)

(assert (=> d!37717 m!145811))

(declare-fun m!145813 () Bool)

(assert (=> d!37717 m!145813))

(declare-fun m!145815 () Bool)

(assert (=> b!125338 m!145815))

(declare-fun m!145817 () Bool)

(assert (=> b!125339 m!145817))

(assert (=> b!125102 d!37717))

(declare-fun d!37719 () Bool)

(declare-fun isEmpty!401 (List!1676) Bool)

(assert (=> d!37719 (= (isEmpty!400 lt!64289) (isEmpty!401 (toList!831 lt!64289)))))

(declare-fun bs!5195 () Bool)

(assert (= bs!5195 d!37719))

(declare-fun m!145819 () Bool)

(assert (=> bs!5195 m!145819))

(assert (=> b!125008 d!37719))

(declare-fun d!37721 () Bool)

(assert (=> d!37721 (= (isDefined!119 (getValueByKey!167 (toList!831 lt!64108) (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))) (not (isEmpty!399 (getValueByKey!167 (toList!831 lt!64108) (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))))

(declare-fun bs!5196 () Bool)

(assert (= bs!5196 d!37721))

(assert (=> bs!5196 m!145101))

(declare-fun m!145821 () Bool)

(assert (=> bs!5196 m!145821))

(assert (=> b!125206 d!37721))

(declare-fun b!125341 () Bool)

(declare-fun e!81889 () Option!173)

(declare-fun e!81890 () Option!173)

(assert (=> b!125341 (= e!81889 e!81890)))

(declare-fun c!22844 () Bool)

(assert (=> b!125341 (= c!22844 (and ((_ is Cons!1672) (toList!831 lt!64108)) (not (= (_1!1271 (h!2273 (toList!831 lt!64108))) (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))))

(declare-fun b!125342 () Bool)

(assert (=> b!125342 (= e!81890 (getValueByKey!167 (t!5995 (toList!831 lt!64108)) (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun d!37723 () Bool)

(declare-fun c!22843 () Bool)

(assert (=> d!37723 (= c!22843 (and ((_ is Cons!1672) (toList!831 lt!64108)) (= (_1!1271 (h!2273 (toList!831 lt!64108))) (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(assert (=> d!37723 (= (getValueByKey!167 (toList!831 lt!64108) (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) e!81889)))

(declare-fun b!125343 () Bool)

(assert (=> b!125343 (= e!81890 None!171)))

(declare-fun b!125340 () Bool)

(assert (=> b!125340 (= e!81889 (Some!172 (_2!1271 (h!2273 (toList!831 lt!64108)))))))

(assert (= (and d!37723 c!22843) b!125340))

(assert (= (and d!37723 (not c!22843)) b!125341))

(assert (= (and b!125341 c!22844) b!125342))

(assert (= (and b!125341 (not c!22844)) b!125343))

(assert (=> b!125342 m!144905))

(declare-fun m!145823 () Bool)

(assert (=> b!125342 m!145823))

(assert (=> b!125206 d!37723))

(declare-fun d!37725 () Bool)

(assert (=> d!37725 (= (apply!110 lt!64329 #b1000000000000000000000000000000000000000000000000000000000000000) (get!1449 (getValueByKey!167 (toList!831 lt!64329) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!5197 () Bool)

(assert (= bs!5197 d!37725))

(assert (=> bs!5197 m!145803))

(assert (=> bs!5197 m!145803))

(declare-fun m!145825 () Bool)

(assert (=> bs!5197 m!145825))

(assert (=> b!125073 d!37725))

(declare-fun d!37727 () Bool)

(assert (=> d!37727 (arrayContainsKey!0 (_keys!4492 newMap!16) lt!64265 #b00000000000000000000000000000000)))

(declare-fun lt!64596 () Unit!3871)

(declare-fun choose!13 (array!4667 (_ BitVec 64) (_ BitVec 32)) Unit!3871)

(assert (=> d!37727 (= lt!64596 (choose!13 (_keys!4492 newMap!16) lt!64265 #b00000000000000000000000000000000))))

(assert (=> d!37727 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!37727 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!4492 newMap!16) lt!64265 #b00000000000000000000000000000000) lt!64596)))

(declare-fun bs!5198 () Bool)

(assert (= bs!5198 d!37727))

(assert (=> bs!5198 m!145119))

(declare-fun m!145827 () Bool)

(assert (=> bs!5198 m!145827))

(assert (=> b!124972 d!37727))

(declare-fun d!37729 () Bool)

(declare-fun res!60689 () Bool)

(declare-fun e!81891 () Bool)

(assert (=> d!37729 (=> res!60689 e!81891)))

(assert (=> d!37729 (= res!60689 (= (select (arr!2210 (_keys!4492 newMap!16)) #b00000000000000000000000000000000) lt!64265))))

(assert (=> d!37729 (= (arrayContainsKey!0 (_keys!4492 newMap!16) lt!64265 #b00000000000000000000000000000000) e!81891)))

(declare-fun b!125344 () Bool)

(declare-fun e!81892 () Bool)

(assert (=> b!125344 (= e!81891 e!81892)))

(declare-fun res!60690 () Bool)

(assert (=> b!125344 (=> (not res!60690) (not e!81892))))

(assert (=> b!125344 (= res!60690 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2473 (_keys!4492 newMap!16))))))

(declare-fun b!125345 () Bool)

(assert (=> b!125345 (= e!81892 (arrayContainsKey!0 (_keys!4492 newMap!16) lt!64265 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!37729 (not res!60689)) b!125344))

(assert (= (and b!125344 res!60690) b!125345))

(assert (=> d!37729 m!145113))

(declare-fun m!145829 () Bool)

(assert (=> b!125345 m!145829))

(assert (=> b!124972 d!37729))

(declare-fun b!125346 () Bool)

(declare-fun e!81895 () SeekEntryResult!263)

(declare-fun e!81894 () SeekEntryResult!263)

(assert (=> b!125346 (= e!81895 e!81894)))

(declare-fun lt!64598 () (_ BitVec 64))

(declare-fun lt!64597 () SeekEntryResult!263)

(assert (=> b!125346 (= lt!64598 (select (arr!2210 (_keys!4492 newMap!16)) (index!3208 lt!64597)))))

(declare-fun c!22847 () Bool)

(assert (=> b!125346 (= c!22847 (= lt!64598 (select (arr!2210 (_keys!4492 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!125347 () Bool)

(declare-fun e!81893 () SeekEntryResult!263)

(assert (=> b!125347 (= e!81893 (MissingZero!263 (index!3208 lt!64597)))))

(declare-fun d!37731 () Bool)

(declare-fun lt!64599 () SeekEntryResult!263)

(assert (=> d!37731 (and (or ((_ is Undefined!263) lt!64599) (not ((_ is Found!263) lt!64599)) (and (bvsge (index!3207 lt!64599) #b00000000000000000000000000000000) (bvslt (index!3207 lt!64599) (size!2473 (_keys!4492 newMap!16))))) (or ((_ is Undefined!263) lt!64599) ((_ is Found!263) lt!64599) (not ((_ is MissingZero!263) lt!64599)) (and (bvsge (index!3206 lt!64599) #b00000000000000000000000000000000) (bvslt (index!3206 lt!64599) (size!2473 (_keys!4492 newMap!16))))) (or ((_ is Undefined!263) lt!64599) ((_ is Found!263) lt!64599) ((_ is MissingZero!263) lt!64599) (not ((_ is MissingVacant!263) lt!64599)) (and (bvsge (index!3209 lt!64599) #b00000000000000000000000000000000) (bvslt (index!3209 lt!64599) (size!2473 (_keys!4492 newMap!16))))) (or ((_ is Undefined!263) lt!64599) (ite ((_ is Found!263) lt!64599) (= (select (arr!2210 (_keys!4492 newMap!16)) (index!3207 lt!64599)) (select (arr!2210 (_keys!4492 newMap!16)) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!263) lt!64599) (= (select (arr!2210 (_keys!4492 newMap!16)) (index!3206 lt!64599)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!263) lt!64599) (= (select (arr!2210 (_keys!4492 newMap!16)) (index!3209 lt!64599)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!37731 (= lt!64599 e!81895)))

(declare-fun c!22846 () Bool)

(assert (=> d!37731 (= c!22846 (and ((_ is Intermediate!263) lt!64597) (undefined!1075 lt!64597)))))

(assert (=> d!37731 (= lt!64597 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!2210 (_keys!4492 newMap!16)) #b00000000000000000000000000000000) (mask!7009 newMap!16)) (select (arr!2210 (_keys!4492 newMap!16)) #b00000000000000000000000000000000) (_keys!4492 newMap!16) (mask!7009 newMap!16)))))

(assert (=> d!37731 (validMask!0 (mask!7009 newMap!16))))

(assert (=> d!37731 (= (seekEntryOrOpen!0 (select (arr!2210 (_keys!4492 newMap!16)) #b00000000000000000000000000000000) (_keys!4492 newMap!16) (mask!7009 newMap!16)) lt!64599)))

(declare-fun b!125348 () Bool)

(assert (=> b!125348 (= e!81893 (seekKeyOrZeroReturnVacant!0 (x!14812 lt!64597) (index!3208 lt!64597) (index!3208 lt!64597) (select (arr!2210 (_keys!4492 newMap!16)) #b00000000000000000000000000000000) (_keys!4492 newMap!16) (mask!7009 newMap!16)))))

(declare-fun b!125349 () Bool)

(assert (=> b!125349 (= e!81894 (Found!263 (index!3208 lt!64597)))))

(declare-fun b!125350 () Bool)

(declare-fun c!22845 () Bool)

(assert (=> b!125350 (= c!22845 (= lt!64598 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!125350 (= e!81894 e!81893)))

(declare-fun b!125351 () Bool)

(assert (=> b!125351 (= e!81895 Undefined!263)))

(assert (= (and d!37731 c!22846) b!125351))

(assert (= (and d!37731 (not c!22846)) b!125346))

(assert (= (and b!125346 c!22847) b!125349))

(assert (= (and b!125346 (not c!22847)) b!125350))

(assert (= (and b!125350 c!22845) b!125347))

(assert (= (and b!125350 (not c!22845)) b!125348))

(declare-fun m!145831 () Bool)

(assert (=> b!125346 m!145831))

(assert (=> d!37731 m!145113))

(declare-fun m!145833 () Bool)

(assert (=> d!37731 m!145833))

(declare-fun m!145835 () Bool)

(assert (=> d!37731 m!145835))

(assert (=> d!37731 m!145833))

(assert (=> d!37731 m!145113))

(declare-fun m!145837 () Bool)

(assert (=> d!37731 m!145837))

(declare-fun m!145839 () Bool)

(assert (=> d!37731 m!145839))

(declare-fun m!145841 () Bool)

(assert (=> d!37731 m!145841))

(assert (=> d!37731 m!145065))

(assert (=> b!125348 m!145113))

(declare-fun m!145843 () Bool)

(assert (=> b!125348 m!145843))

(assert (=> b!124972 d!37731))

(declare-fun d!37733 () Bool)

(assert (=> d!37733 (= (get!1449 (getValueByKey!167 (toList!831 (+!163 lt!64110 (tuple2!2521 lt!64117 (minValue!2628 (v!3108 (underlying!436 thiss!992)))))) lt!64128)) (v!3114 (getValueByKey!167 (toList!831 (+!163 lt!64110 (tuple2!2521 lt!64117 (minValue!2628 (v!3108 (underlying!436 thiss!992)))))) lt!64128)))))

(assert (=> d!37567 d!37733))

(declare-fun b!125353 () Bool)

(declare-fun e!81896 () Option!173)

(declare-fun e!81897 () Option!173)

(assert (=> b!125353 (= e!81896 e!81897)))

(declare-fun c!22849 () Bool)

(assert (=> b!125353 (= c!22849 (and ((_ is Cons!1672) (toList!831 (+!163 lt!64110 (tuple2!2521 lt!64117 (minValue!2628 (v!3108 (underlying!436 thiss!992))))))) (not (= (_1!1271 (h!2273 (toList!831 (+!163 lt!64110 (tuple2!2521 lt!64117 (minValue!2628 (v!3108 (underlying!436 thiss!992)))))))) lt!64128))))))

(declare-fun b!125354 () Bool)

(assert (=> b!125354 (= e!81897 (getValueByKey!167 (t!5995 (toList!831 (+!163 lt!64110 (tuple2!2521 lt!64117 (minValue!2628 (v!3108 (underlying!436 thiss!992))))))) lt!64128))))

(declare-fun c!22848 () Bool)

(declare-fun d!37735 () Bool)

(assert (=> d!37735 (= c!22848 (and ((_ is Cons!1672) (toList!831 (+!163 lt!64110 (tuple2!2521 lt!64117 (minValue!2628 (v!3108 (underlying!436 thiss!992))))))) (= (_1!1271 (h!2273 (toList!831 (+!163 lt!64110 (tuple2!2521 lt!64117 (minValue!2628 (v!3108 (underlying!436 thiss!992)))))))) lt!64128)))))

(assert (=> d!37735 (= (getValueByKey!167 (toList!831 (+!163 lt!64110 (tuple2!2521 lt!64117 (minValue!2628 (v!3108 (underlying!436 thiss!992)))))) lt!64128) e!81896)))

(declare-fun b!125355 () Bool)

(assert (=> b!125355 (= e!81897 None!171)))

(declare-fun b!125352 () Bool)

(assert (=> b!125352 (= e!81896 (Some!172 (_2!1271 (h!2273 (toList!831 (+!163 lt!64110 (tuple2!2521 lt!64117 (minValue!2628 (v!3108 (underlying!436 thiss!992))))))))))))

(assert (= (and d!37735 c!22848) b!125352))

(assert (= (and d!37735 (not c!22848)) b!125353))

(assert (= (and b!125353 c!22849) b!125354))

(assert (= (and b!125353 (not c!22849)) b!125355))

(declare-fun m!145845 () Bool)

(assert (=> b!125354 m!145845))

(assert (=> d!37567 d!37735))

(declare-fun d!37737 () Bool)

(declare-fun e!81898 () Bool)

(assert (=> d!37737 e!81898))

(declare-fun res!60691 () Bool)

(assert (=> d!37737 (=> (not res!60691) (not e!81898))))

(declare-fun lt!64601 () ListLongMap!1631)

(assert (=> d!37737 (= res!60691 (contains!861 lt!64601 (_1!1271 (tuple2!2521 lt!64368 (minValue!2628 newMap!16)))))))

(declare-fun lt!64602 () List!1676)

(assert (=> d!37737 (= lt!64601 (ListLongMap!1632 lt!64602))))

(declare-fun lt!64603 () Unit!3871)

(declare-fun lt!64600 () Unit!3871)

(assert (=> d!37737 (= lt!64603 lt!64600)))

(assert (=> d!37737 (= (getValueByKey!167 lt!64602 (_1!1271 (tuple2!2521 lt!64368 (minValue!2628 newMap!16)))) (Some!172 (_2!1271 (tuple2!2521 lt!64368 (minValue!2628 newMap!16)))))))

(assert (=> d!37737 (= lt!64600 (lemmaContainsTupThenGetReturnValue!82 lt!64602 (_1!1271 (tuple2!2521 lt!64368 (minValue!2628 newMap!16))) (_2!1271 (tuple2!2521 lt!64368 (minValue!2628 newMap!16)))))))

(assert (=> d!37737 (= lt!64602 (insertStrictlySorted!85 (toList!831 lt!64359) (_1!1271 (tuple2!2521 lt!64368 (minValue!2628 newMap!16))) (_2!1271 (tuple2!2521 lt!64368 (minValue!2628 newMap!16)))))))

(assert (=> d!37737 (= (+!163 lt!64359 (tuple2!2521 lt!64368 (minValue!2628 newMap!16))) lt!64601)))

(declare-fun b!125356 () Bool)

(declare-fun res!60692 () Bool)

(assert (=> b!125356 (=> (not res!60692) (not e!81898))))

(assert (=> b!125356 (= res!60692 (= (getValueByKey!167 (toList!831 lt!64601) (_1!1271 (tuple2!2521 lt!64368 (minValue!2628 newMap!16)))) (Some!172 (_2!1271 (tuple2!2521 lt!64368 (minValue!2628 newMap!16))))))))

(declare-fun b!125357 () Bool)

(assert (=> b!125357 (= e!81898 (contains!862 (toList!831 lt!64601) (tuple2!2521 lt!64368 (minValue!2628 newMap!16))))))

(assert (= (and d!37737 res!60691) b!125356))

(assert (= (and b!125356 res!60692) b!125357))

(declare-fun m!145847 () Bool)

(assert (=> d!37737 m!145847))

(declare-fun m!145849 () Bool)

(assert (=> d!37737 m!145849))

(declare-fun m!145851 () Bool)

(assert (=> d!37737 m!145851))

(declare-fun m!145853 () Bool)

(assert (=> d!37737 m!145853))

(declare-fun m!145855 () Bool)

(assert (=> b!125356 m!145855))

(declare-fun m!145857 () Bool)

(assert (=> b!125357 m!145857))

(assert (=> b!125088 d!37737))

(declare-fun d!37739 () Bool)

(assert (=> d!37739 (= (apply!110 (+!163 lt!64353 (tuple2!2521 lt!64360 (minValue!2628 newMap!16))) lt!64371) (apply!110 lt!64353 lt!64371))))

(declare-fun lt!64604 () Unit!3871)

(assert (=> d!37739 (= lt!64604 (choose!755 lt!64353 lt!64360 (minValue!2628 newMap!16) lt!64371))))

(declare-fun e!81899 () Bool)

(assert (=> d!37739 e!81899))

(declare-fun res!60693 () Bool)

(assert (=> d!37739 (=> (not res!60693) (not e!81899))))

(assert (=> d!37739 (= res!60693 (contains!861 lt!64353 lt!64371))))

(assert (=> d!37739 (= (addApplyDifferent!86 lt!64353 lt!64360 (minValue!2628 newMap!16) lt!64371) lt!64604)))

(declare-fun b!125358 () Bool)

(assert (=> b!125358 (= e!81899 (not (= lt!64371 lt!64360)))))

(assert (= (and d!37739 res!60693) b!125358))

(assert (=> d!37739 m!145347))

(assert (=> d!37739 m!145341))

(declare-fun m!145859 () Bool)

(assert (=> d!37739 m!145859))

(declare-fun m!145861 () Bool)

(assert (=> d!37739 m!145861))

(assert (=> d!37739 m!145341))

(assert (=> d!37739 m!145343))

(assert (=> b!125088 d!37739))

(declare-fun d!37741 () Bool)

(declare-fun e!81900 () Bool)

(assert (=> d!37741 e!81900))

(declare-fun res!60694 () Bool)

(assert (=> d!37741 (=> res!60694 e!81900)))

(declare-fun lt!64605 () Bool)

(assert (=> d!37741 (= res!60694 (not lt!64605))))

(declare-fun lt!64608 () Bool)

(assert (=> d!37741 (= lt!64605 lt!64608)))

(declare-fun lt!64607 () Unit!3871)

(declare-fun e!81901 () Unit!3871)

(assert (=> d!37741 (= lt!64607 e!81901)))

(declare-fun c!22850 () Bool)

(assert (=> d!37741 (= c!22850 lt!64608)))

(assert (=> d!37741 (= lt!64608 (containsKey!170 (toList!831 (+!163 lt!64365 (tuple2!2521 lt!64357 (zeroValue!2628 newMap!16)))) lt!64352))))

(assert (=> d!37741 (= (contains!861 (+!163 lt!64365 (tuple2!2521 lt!64357 (zeroValue!2628 newMap!16))) lt!64352) lt!64605)))

(declare-fun b!125359 () Bool)

(declare-fun lt!64606 () Unit!3871)

(assert (=> b!125359 (= e!81901 lt!64606)))

(assert (=> b!125359 (= lt!64606 (lemmaContainsKeyImpliesGetValueByKeyDefined!118 (toList!831 (+!163 lt!64365 (tuple2!2521 lt!64357 (zeroValue!2628 newMap!16)))) lt!64352))))

(assert (=> b!125359 (isDefined!119 (getValueByKey!167 (toList!831 (+!163 lt!64365 (tuple2!2521 lt!64357 (zeroValue!2628 newMap!16)))) lt!64352))))

(declare-fun b!125360 () Bool)

(declare-fun Unit!3895 () Unit!3871)

(assert (=> b!125360 (= e!81901 Unit!3895)))

(declare-fun b!125361 () Bool)

(assert (=> b!125361 (= e!81900 (isDefined!119 (getValueByKey!167 (toList!831 (+!163 lt!64365 (tuple2!2521 lt!64357 (zeroValue!2628 newMap!16)))) lt!64352)))))

(assert (= (and d!37741 c!22850) b!125359))

(assert (= (and d!37741 (not c!22850)) b!125360))

(assert (= (and d!37741 (not res!60694)) b!125361))

(declare-fun m!145863 () Bool)

(assert (=> d!37741 m!145863))

(declare-fun m!145865 () Bool)

(assert (=> b!125359 m!145865))

(declare-fun m!145867 () Bool)

(assert (=> b!125359 m!145867))

(assert (=> b!125359 m!145867))

(declare-fun m!145869 () Bool)

(assert (=> b!125359 m!145869))

(assert (=> b!125361 m!145867))

(assert (=> b!125361 m!145867))

(assert (=> b!125361 m!145869))

(assert (=> b!125088 d!37741))

(declare-fun d!37743 () Bool)

(assert (=> d!37743 (= (apply!110 lt!64359 lt!64354) (get!1449 (getValueByKey!167 (toList!831 lt!64359) lt!64354)))))

(declare-fun bs!5199 () Bool)

(assert (= bs!5199 d!37743))

(declare-fun m!145871 () Bool)

(assert (=> bs!5199 m!145871))

(assert (=> bs!5199 m!145871))

(declare-fun m!145873 () Bool)

(assert (=> bs!5199 m!145873))

(assert (=> b!125088 d!37743))

(declare-fun d!37745 () Bool)

(declare-fun e!81902 () Bool)

(assert (=> d!37745 e!81902))

(declare-fun res!60695 () Bool)

(assert (=> d!37745 (=> (not res!60695) (not e!81902))))

(declare-fun lt!64610 () ListLongMap!1631)

(assert (=> d!37745 (= res!60695 (contains!861 lt!64610 (_1!1271 (tuple2!2521 lt!64357 (zeroValue!2628 newMap!16)))))))

(declare-fun lt!64611 () List!1676)

(assert (=> d!37745 (= lt!64610 (ListLongMap!1632 lt!64611))))

(declare-fun lt!64612 () Unit!3871)

(declare-fun lt!64609 () Unit!3871)

(assert (=> d!37745 (= lt!64612 lt!64609)))

(assert (=> d!37745 (= (getValueByKey!167 lt!64611 (_1!1271 (tuple2!2521 lt!64357 (zeroValue!2628 newMap!16)))) (Some!172 (_2!1271 (tuple2!2521 lt!64357 (zeroValue!2628 newMap!16)))))))

(assert (=> d!37745 (= lt!64609 (lemmaContainsTupThenGetReturnValue!82 lt!64611 (_1!1271 (tuple2!2521 lt!64357 (zeroValue!2628 newMap!16))) (_2!1271 (tuple2!2521 lt!64357 (zeroValue!2628 newMap!16)))))))

(assert (=> d!37745 (= lt!64611 (insertStrictlySorted!85 (toList!831 lt!64365) (_1!1271 (tuple2!2521 lt!64357 (zeroValue!2628 newMap!16))) (_2!1271 (tuple2!2521 lt!64357 (zeroValue!2628 newMap!16)))))))

(assert (=> d!37745 (= (+!163 lt!64365 (tuple2!2521 lt!64357 (zeroValue!2628 newMap!16))) lt!64610)))

(declare-fun b!125362 () Bool)

(declare-fun res!60696 () Bool)

(assert (=> b!125362 (=> (not res!60696) (not e!81902))))

(assert (=> b!125362 (= res!60696 (= (getValueByKey!167 (toList!831 lt!64610) (_1!1271 (tuple2!2521 lt!64357 (zeroValue!2628 newMap!16)))) (Some!172 (_2!1271 (tuple2!2521 lt!64357 (zeroValue!2628 newMap!16))))))))

(declare-fun b!125363 () Bool)

(assert (=> b!125363 (= e!81902 (contains!862 (toList!831 lt!64610) (tuple2!2521 lt!64357 (zeroValue!2628 newMap!16))))))

(assert (= (and d!37745 res!60695) b!125362))

(assert (= (and b!125362 res!60696) b!125363))

(declare-fun m!145875 () Bool)

(assert (=> d!37745 m!145875))

(declare-fun m!145877 () Bool)

(assert (=> d!37745 m!145877))

(declare-fun m!145879 () Bool)

(assert (=> d!37745 m!145879))

(declare-fun m!145881 () Bool)

(assert (=> d!37745 m!145881))

(declare-fun m!145883 () Bool)

(assert (=> b!125362 m!145883))

(declare-fun m!145885 () Bool)

(assert (=> b!125363 m!145885))

(assert (=> b!125088 d!37745))

(declare-fun d!37747 () Bool)

(assert (=> d!37747 (= (apply!110 (+!163 lt!64361 (tuple2!2521 lt!64367 (zeroValue!2628 newMap!16))) lt!64364) (get!1449 (getValueByKey!167 (toList!831 (+!163 lt!64361 (tuple2!2521 lt!64367 (zeroValue!2628 newMap!16)))) lt!64364)))))

(declare-fun bs!5200 () Bool)

(assert (= bs!5200 d!37747))

(declare-fun m!145887 () Bool)

(assert (=> bs!5200 m!145887))

(assert (=> bs!5200 m!145887))

(declare-fun m!145889 () Bool)

(assert (=> bs!5200 m!145889))

(assert (=> b!125088 d!37747))

(declare-fun d!37749 () Bool)

(assert (=> d!37749 (= (apply!110 lt!64361 lt!64364) (get!1449 (getValueByKey!167 (toList!831 lt!64361) lt!64364)))))

(declare-fun bs!5201 () Bool)

(assert (= bs!5201 d!37749))

(declare-fun m!145891 () Bool)

(assert (=> bs!5201 m!145891))

(assert (=> bs!5201 m!145891))

(declare-fun m!145893 () Bool)

(assert (=> bs!5201 m!145893))

(assert (=> b!125088 d!37749))

(declare-fun d!37751 () Bool)

(declare-fun e!81903 () Bool)

(assert (=> d!37751 e!81903))

(declare-fun res!60697 () Bool)

(assert (=> d!37751 (=> (not res!60697) (not e!81903))))

(declare-fun lt!64614 () ListLongMap!1631)

(assert (=> d!37751 (= res!60697 (contains!861 lt!64614 (_1!1271 (tuple2!2521 lt!64360 (minValue!2628 newMap!16)))))))

(declare-fun lt!64615 () List!1676)

(assert (=> d!37751 (= lt!64614 (ListLongMap!1632 lt!64615))))

(declare-fun lt!64616 () Unit!3871)

(declare-fun lt!64613 () Unit!3871)

(assert (=> d!37751 (= lt!64616 lt!64613)))

(assert (=> d!37751 (= (getValueByKey!167 lt!64615 (_1!1271 (tuple2!2521 lt!64360 (minValue!2628 newMap!16)))) (Some!172 (_2!1271 (tuple2!2521 lt!64360 (minValue!2628 newMap!16)))))))

(assert (=> d!37751 (= lt!64613 (lemmaContainsTupThenGetReturnValue!82 lt!64615 (_1!1271 (tuple2!2521 lt!64360 (minValue!2628 newMap!16))) (_2!1271 (tuple2!2521 lt!64360 (minValue!2628 newMap!16)))))))

(assert (=> d!37751 (= lt!64615 (insertStrictlySorted!85 (toList!831 lt!64353) (_1!1271 (tuple2!2521 lt!64360 (minValue!2628 newMap!16))) (_2!1271 (tuple2!2521 lt!64360 (minValue!2628 newMap!16)))))))

(assert (=> d!37751 (= (+!163 lt!64353 (tuple2!2521 lt!64360 (minValue!2628 newMap!16))) lt!64614)))

(declare-fun b!125364 () Bool)

(declare-fun res!60698 () Bool)

(assert (=> b!125364 (=> (not res!60698) (not e!81903))))

(assert (=> b!125364 (= res!60698 (= (getValueByKey!167 (toList!831 lt!64614) (_1!1271 (tuple2!2521 lt!64360 (minValue!2628 newMap!16)))) (Some!172 (_2!1271 (tuple2!2521 lt!64360 (minValue!2628 newMap!16))))))))

(declare-fun b!125365 () Bool)

(assert (=> b!125365 (= e!81903 (contains!862 (toList!831 lt!64614) (tuple2!2521 lt!64360 (minValue!2628 newMap!16))))))

(assert (= (and d!37751 res!60697) b!125364))

(assert (= (and b!125364 res!60698) b!125365))

(declare-fun m!145895 () Bool)

(assert (=> d!37751 m!145895))

(declare-fun m!145897 () Bool)

(assert (=> d!37751 m!145897))

(declare-fun m!145899 () Bool)

(assert (=> d!37751 m!145899))

(declare-fun m!145901 () Bool)

(assert (=> d!37751 m!145901))

(declare-fun m!145903 () Bool)

(assert (=> b!125364 m!145903))

(declare-fun m!145905 () Bool)

(assert (=> b!125365 m!145905))

(assert (=> b!125088 d!37751))

(declare-fun d!37753 () Bool)

(assert (=> d!37753 (= (apply!110 (+!163 lt!64359 (tuple2!2521 lt!64368 (minValue!2628 newMap!16))) lt!64354) (get!1449 (getValueByKey!167 (toList!831 (+!163 lt!64359 (tuple2!2521 lt!64368 (minValue!2628 newMap!16)))) lt!64354)))))

(declare-fun bs!5202 () Bool)

(assert (= bs!5202 d!37753))

(declare-fun m!145907 () Bool)

(assert (=> bs!5202 m!145907))

(assert (=> bs!5202 m!145907))

(declare-fun m!145909 () Bool)

(assert (=> bs!5202 m!145909))

(assert (=> b!125088 d!37753))

(declare-fun d!37755 () Bool)

(assert (=> d!37755 (contains!861 (+!163 lt!64365 (tuple2!2521 lt!64357 (zeroValue!2628 newMap!16))) lt!64352)))

(declare-fun lt!64617 () Unit!3871)

(assert (=> d!37755 (= lt!64617 (choose!756 lt!64365 lt!64357 (zeroValue!2628 newMap!16) lt!64352))))

(assert (=> d!37755 (contains!861 lt!64365 lt!64352)))

(assert (=> d!37755 (= (addStillContains!86 lt!64365 lt!64357 (zeroValue!2628 newMap!16) lt!64352) lt!64617)))

(declare-fun bs!5203 () Bool)

(assert (= bs!5203 d!37755))

(assert (=> bs!5203 m!145353))

(assert (=> bs!5203 m!145353))

(assert (=> bs!5203 m!145355))

(declare-fun m!145911 () Bool)

(assert (=> bs!5203 m!145911))

(declare-fun m!145913 () Bool)

(assert (=> bs!5203 m!145913))

(assert (=> b!125088 d!37755))

(declare-fun d!37757 () Bool)

(assert (=> d!37757 (= (apply!110 (+!163 lt!64361 (tuple2!2521 lt!64367 (zeroValue!2628 newMap!16))) lt!64364) (apply!110 lt!64361 lt!64364))))

(declare-fun lt!64618 () Unit!3871)

(assert (=> d!37757 (= lt!64618 (choose!755 lt!64361 lt!64367 (zeroValue!2628 newMap!16) lt!64364))))

(declare-fun e!81904 () Bool)

(assert (=> d!37757 e!81904))

(declare-fun res!60699 () Bool)

(assert (=> d!37757 (=> (not res!60699) (not e!81904))))

(assert (=> d!37757 (= res!60699 (contains!861 lt!64361 lt!64364))))

(assert (=> d!37757 (= (addApplyDifferent!86 lt!64361 lt!64367 (zeroValue!2628 newMap!16) lt!64364) lt!64618)))

(declare-fun b!125366 () Bool)

(assert (=> b!125366 (= e!81904 (not (= lt!64364 lt!64367)))))

(assert (= (and d!37757 res!60699) b!125366))

(assert (=> d!37757 m!145351))

(assert (=> d!37757 m!145337))

(declare-fun m!145915 () Bool)

(assert (=> d!37757 m!145915))

(declare-fun m!145917 () Bool)

(assert (=> d!37757 m!145917))

(assert (=> d!37757 m!145337))

(assert (=> d!37757 m!145339))

(assert (=> b!125088 d!37757))

(declare-fun d!37759 () Bool)

(assert (=> d!37759 (= (apply!110 lt!64353 lt!64371) (get!1449 (getValueByKey!167 (toList!831 lt!64353) lt!64371)))))

(declare-fun bs!5204 () Bool)

(assert (= bs!5204 d!37759))

(declare-fun m!145919 () Bool)

(assert (=> bs!5204 m!145919))

(assert (=> bs!5204 m!145919))

(declare-fun m!145921 () Bool)

(assert (=> bs!5204 m!145921))

(assert (=> b!125088 d!37759))

(declare-fun d!37761 () Bool)

(assert (=> d!37761 (= (apply!110 (+!163 lt!64359 (tuple2!2521 lt!64368 (minValue!2628 newMap!16))) lt!64354) (apply!110 lt!64359 lt!64354))))

(declare-fun lt!64619 () Unit!3871)

(assert (=> d!37761 (= lt!64619 (choose!755 lt!64359 lt!64368 (minValue!2628 newMap!16) lt!64354))))

(declare-fun e!81905 () Bool)

(assert (=> d!37761 e!81905))

(declare-fun res!60700 () Bool)

(assert (=> d!37761 (=> (not res!60700) (not e!81905))))

(assert (=> d!37761 (= res!60700 (contains!861 lt!64359 lt!64354))))

(assert (=> d!37761 (= (addApplyDifferent!86 lt!64359 lt!64368 (minValue!2628 newMap!16) lt!64354) lt!64619)))

(declare-fun b!125367 () Bool)

(assert (=> b!125367 (= e!81905 (not (= lt!64354 lt!64368)))))

(assert (= (and d!37761 res!60700) b!125367))

(assert (=> d!37761 m!145345))

(assert (=> d!37761 m!145359))

(declare-fun m!145923 () Bool)

(assert (=> d!37761 m!145923))

(declare-fun m!145925 () Bool)

(assert (=> d!37761 m!145925))

(assert (=> d!37761 m!145359))

(assert (=> d!37761 m!145361))

(assert (=> b!125088 d!37761))

(declare-fun d!37763 () Bool)

(declare-fun e!81906 () Bool)

(assert (=> d!37763 e!81906))

(declare-fun res!60701 () Bool)

(assert (=> d!37763 (=> (not res!60701) (not e!81906))))

(declare-fun lt!64621 () ListLongMap!1631)

(assert (=> d!37763 (= res!60701 (contains!861 lt!64621 (_1!1271 (tuple2!2521 lt!64367 (zeroValue!2628 newMap!16)))))))

(declare-fun lt!64622 () List!1676)

(assert (=> d!37763 (= lt!64621 (ListLongMap!1632 lt!64622))))

(declare-fun lt!64623 () Unit!3871)

(declare-fun lt!64620 () Unit!3871)

(assert (=> d!37763 (= lt!64623 lt!64620)))

(assert (=> d!37763 (= (getValueByKey!167 lt!64622 (_1!1271 (tuple2!2521 lt!64367 (zeroValue!2628 newMap!16)))) (Some!172 (_2!1271 (tuple2!2521 lt!64367 (zeroValue!2628 newMap!16)))))))

(assert (=> d!37763 (= lt!64620 (lemmaContainsTupThenGetReturnValue!82 lt!64622 (_1!1271 (tuple2!2521 lt!64367 (zeroValue!2628 newMap!16))) (_2!1271 (tuple2!2521 lt!64367 (zeroValue!2628 newMap!16)))))))

(assert (=> d!37763 (= lt!64622 (insertStrictlySorted!85 (toList!831 lt!64361) (_1!1271 (tuple2!2521 lt!64367 (zeroValue!2628 newMap!16))) (_2!1271 (tuple2!2521 lt!64367 (zeroValue!2628 newMap!16)))))))

(assert (=> d!37763 (= (+!163 lt!64361 (tuple2!2521 lt!64367 (zeroValue!2628 newMap!16))) lt!64621)))

(declare-fun b!125368 () Bool)

(declare-fun res!60702 () Bool)

(assert (=> b!125368 (=> (not res!60702) (not e!81906))))

(assert (=> b!125368 (= res!60702 (= (getValueByKey!167 (toList!831 lt!64621) (_1!1271 (tuple2!2521 lt!64367 (zeroValue!2628 newMap!16)))) (Some!172 (_2!1271 (tuple2!2521 lt!64367 (zeroValue!2628 newMap!16))))))))

(declare-fun b!125369 () Bool)

(assert (=> b!125369 (= e!81906 (contains!862 (toList!831 lt!64621) (tuple2!2521 lt!64367 (zeroValue!2628 newMap!16))))))

(assert (= (and d!37763 res!60701) b!125368))

(assert (= (and b!125368 res!60702) b!125369))

(declare-fun m!145927 () Bool)

(assert (=> d!37763 m!145927))

(declare-fun m!145929 () Bool)

(assert (=> d!37763 m!145929))

(declare-fun m!145931 () Bool)

(assert (=> d!37763 m!145931))

(declare-fun m!145933 () Bool)

(assert (=> d!37763 m!145933))

(declare-fun m!145935 () Bool)

(assert (=> b!125368 m!145935))

(declare-fun m!145937 () Bool)

(assert (=> b!125369 m!145937))

(assert (=> b!125088 d!37763))

(declare-fun d!37765 () Bool)

(assert (=> d!37765 (= (apply!110 (+!163 lt!64353 (tuple2!2521 lt!64360 (minValue!2628 newMap!16))) lt!64371) (get!1449 (getValueByKey!167 (toList!831 (+!163 lt!64353 (tuple2!2521 lt!64360 (minValue!2628 newMap!16)))) lt!64371)))))

(declare-fun bs!5205 () Bool)

(assert (= bs!5205 d!37765))

(declare-fun m!145939 () Bool)

(assert (=> bs!5205 m!145939))

(assert (=> bs!5205 m!145939))

(declare-fun m!145941 () Bool)

(assert (=> bs!5205 m!145941))

(assert (=> b!125088 d!37765))

(assert (=> b!125088 d!37699))

(declare-fun d!37767 () Bool)

(declare-fun lt!64626 () Bool)

(declare-fun content!125 (List!1677) (InoxSet (_ BitVec 64)))

(assert (=> d!37767 (= lt!64626 (select (content!125 Nil!1674) (select (arr!2210 (_keys!4492 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun e!81912 () Bool)

(assert (=> d!37767 (= lt!64626 e!81912)))

(declare-fun res!60708 () Bool)

(assert (=> d!37767 (=> (not res!60708) (not e!81912))))

(assert (=> d!37767 (= res!60708 ((_ is Cons!1673) Nil!1674))))

(assert (=> d!37767 (= (contains!863 Nil!1674 (select (arr!2210 (_keys!4492 newMap!16)) #b00000000000000000000000000000000)) lt!64626)))

(declare-fun b!125374 () Bool)

(declare-fun e!81911 () Bool)

(assert (=> b!125374 (= e!81912 e!81911)))

(declare-fun res!60707 () Bool)

(assert (=> b!125374 (=> res!60707 e!81911)))

(assert (=> b!125374 (= res!60707 (= (h!2274 Nil!1674) (select (arr!2210 (_keys!4492 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!125375 () Bool)

(assert (=> b!125375 (= e!81911 (contains!863 (t!6004 Nil!1674) (select (arr!2210 (_keys!4492 newMap!16)) #b00000000000000000000000000000000)))))

(assert (= (and d!37767 res!60708) b!125374))

(assert (= (and b!125374 (not res!60707)) b!125375))

(declare-fun m!145943 () Bool)

(assert (=> d!37767 m!145943))

(assert (=> d!37767 m!145113))

(declare-fun m!145945 () Bool)

(assert (=> d!37767 m!145945))

(assert (=> b!125375 m!145113))

(declare-fun m!145947 () Bool)

(assert (=> b!125375 m!145947))

(assert (=> b!125058 d!37767))

(assert (=> d!37581 d!37527))

(declare-fun d!37769 () Bool)

(declare-fun e!81915 () Bool)

(assert (=> d!37769 e!81915))

(declare-fun res!60714 () Bool)

(assert (=> d!37769 (=> (not res!60714) (not e!81915))))

(declare-fun lt!64629 () SeekEntryResult!263)

(assert (=> d!37769 (= res!60714 ((_ is Found!263) lt!64629))))

(assert (=> d!37769 (= lt!64629 (seekEntryOrOpen!0 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355) (_keys!4492 newMap!16) (mask!7009 newMap!16)))))

(assert (=> d!37769 true))

(declare-fun _$33!102 () Unit!3871)

(assert (=> d!37769 (= (choose!757 (_keys!4492 newMap!16) (_values!2746 newMap!16) (mask!7009 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355) (defaultEntry!2763 newMap!16)) _$33!102)))

(declare-fun b!125380 () Bool)

(declare-fun res!60713 () Bool)

(assert (=> b!125380 (=> (not res!60713) (not e!81915))))

(assert (=> b!125380 (= res!60713 (inRange!0 (index!3207 lt!64629) (mask!7009 newMap!16)))))

(declare-fun b!125381 () Bool)

(assert (=> b!125381 (= e!81915 (= (select (arr!2210 (_keys!4492 newMap!16)) (index!3207 lt!64629)) (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355)))))

(assert (= (and d!37769 res!60714) b!125380))

(assert (= (and b!125380 res!60713) b!125381))

(assert (=> d!37769 m!144797))

(assert (=> d!37769 m!144977))

(declare-fun m!145949 () Bool)

(assert (=> b!125380 m!145949))

(declare-fun m!145951 () Bool)

(assert (=> b!125381 m!145951))

(assert (=> d!37581 d!37769))

(declare-fun d!37771 () Bool)

(assert (=> d!37771 (= (validMask!0 (mask!7009 newMap!16)) (and (or (= (mask!7009 newMap!16) #b00000000000000000000000000000111) (= (mask!7009 newMap!16) #b00000000000000000000000000001111) (= (mask!7009 newMap!16) #b00000000000000000000000000011111) (= (mask!7009 newMap!16) #b00000000000000000000000000111111) (= (mask!7009 newMap!16) #b00000000000000000000000001111111) (= (mask!7009 newMap!16) #b00000000000000000000000011111111) (= (mask!7009 newMap!16) #b00000000000000000000000111111111) (= (mask!7009 newMap!16) #b00000000000000000000001111111111) (= (mask!7009 newMap!16) #b00000000000000000000011111111111) (= (mask!7009 newMap!16) #b00000000000000000000111111111111) (= (mask!7009 newMap!16) #b00000000000000000001111111111111) (= (mask!7009 newMap!16) #b00000000000000000011111111111111) (= (mask!7009 newMap!16) #b00000000000000000111111111111111) (= (mask!7009 newMap!16) #b00000000000000001111111111111111) (= (mask!7009 newMap!16) #b00000000000000011111111111111111) (= (mask!7009 newMap!16) #b00000000000000111111111111111111) (= (mask!7009 newMap!16) #b00000000000001111111111111111111) (= (mask!7009 newMap!16) #b00000000000011111111111111111111) (= (mask!7009 newMap!16) #b00000000000111111111111111111111) (= (mask!7009 newMap!16) #b00000000001111111111111111111111) (= (mask!7009 newMap!16) #b00000000011111111111111111111111) (= (mask!7009 newMap!16) #b00000000111111111111111111111111) (= (mask!7009 newMap!16) #b00000001111111111111111111111111) (= (mask!7009 newMap!16) #b00000011111111111111111111111111) (= (mask!7009 newMap!16) #b00000111111111111111111111111111) (= (mask!7009 newMap!16) #b00001111111111111111111111111111) (= (mask!7009 newMap!16) #b00011111111111111111111111111111) (= (mask!7009 newMap!16) #b00111111111111111111111111111111)) (bvsle (mask!7009 newMap!16) #b00111111111111111111111111111111)))))

(assert (=> d!37581 d!37771))

(declare-fun d!37773 () Bool)

(declare-fun e!81916 () Bool)

(assert (=> d!37773 e!81916))

(declare-fun res!60715 () Bool)

(assert (=> d!37773 (=> res!60715 e!81916)))

(declare-fun lt!64630 () Bool)

(assert (=> d!37773 (= res!60715 (not lt!64630))))

(declare-fun lt!64633 () Bool)

(assert (=> d!37773 (= lt!64630 lt!64633)))

(declare-fun lt!64632 () Unit!3871)

(declare-fun e!81917 () Unit!3871)

(assert (=> d!37773 (= lt!64632 e!81917)))

(declare-fun c!22851 () Bool)

(assert (=> d!37773 (= c!22851 lt!64633)))

(assert (=> d!37773 (= lt!64633 (containsKey!170 (toList!831 lt!64289) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!37773 (= (contains!861 lt!64289 #b1000000000000000000000000000000000000000000000000000000000000000) lt!64630)))

(declare-fun b!125382 () Bool)

(declare-fun lt!64631 () Unit!3871)

(assert (=> b!125382 (= e!81917 lt!64631)))

(assert (=> b!125382 (= lt!64631 (lemmaContainsKeyImpliesGetValueByKeyDefined!118 (toList!831 lt!64289) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!125382 (isDefined!119 (getValueByKey!167 (toList!831 lt!64289) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!125383 () Bool)

(declare-fun Unit!3896 () Unit!3871)

(assert (=> b!125383 (= e!81917 Unit!3896)))

(declare-fun b!125384 () Bool)

(assert (=> b!125384 (= e!81916 (isDefined!119 (getValueByKey!167 (toList!831 lt!64289) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!37773 c!22851) b!125382))

(assert (= (and d!37773 (not c!22851)) b!125383))

(assert (= (and d!37773 (not res!60715)) b!125384))

(declare-fun m!145953 () Bool)

(assert (=> d!37773 m!145953))

(declare-fun m!145955 () Bool)

(assert (=> b!125382 m!145955))

(declare-fun m!145957 () Bool)

(assert (=> b!125382 m!145957))

(assert (=> b!125382 m!145957))

(declare-fun m!145959 () Bool)

(assert (=> b!125382 m!145959))

(assert (=> b!125384 m!145957))

(assert (=> b!125384 m!145957))

(assert (=> b!125384 m!145959))

(assert (=> b!125011 d!37773))

(declare-fun b!125386 () Bool)

(declare-fun e!81918 () Option!173)

(declare-fun e!81919 () Option!173)

(assert (=> b!125386 (= e!81918 e!81919)))

(declare-fun c!22853 () Bool)

(assert (=> b!125386 (= c!22853 (and ((_ is Cons!1672) (toList!831 lt!64292)) (not (= (_1!1271 (h!2273 (toList!831 lt!64292))) (_1!1271 (tuple2!2521 lt!64117 (minValue!2628 (v!3108 (underlying!436 thiss!992)))))))))))

(declare-fun b!125387 () Bool)

(assert (=> b!125387 (= e!81919 (getValueByKey!167 (t!5995 (toList!831 lt!64292)) (_1!1271 (tuple2!2521 lt!64117 (minValue!2628 (v!3108 (underlying!436 thiss!992)))))))))

(declare-fun c!22852 () Bool)

(declare-fun d!37775 () Bool)

(assert (=> d!37775 (= c!22852 (and ((_ is Cons!1672) (toList!831 lt!64292)) (= (_1!1271 (h!2273 (toList!831 lt!64292))) (_1!1271 (tuple2!2521 lt!64117 (minValue!2628 (v!3108 (underlying!436 thiss!992))))))))))

(assert (=> d!37775 (= (getValueByKey!167 (toList!831 lt!64292) (_1!1271 (tuple2!2521 lt!64117 (minValue!2628 (v!3108 (underlying!436 thiss!992)))))) e!81918)))

(declare-fun b!125388 () Bool)

(assert (=> b!125388 (= e!81919 None!171)))

(declare-fun b!125385 () Bool)

(assert (=> b!125385 (= e!81918 (Some!172 (_2!1271 (h!2273 (toList!831 lt!64292)))))))

(assert (= (and d!37775 c!22852) b!125385))

(assert (= (and d!37775 (not c!22852)) b!125386))

(assert (= (and b!125386 c!22853) b!125387))

(assert (= (and b!125386 (not c!22853)) b!125388))

(declare-fun m!145961 () Bool)

(assert (=> b!125387 m!145961))

(assert (=> b!125012 d!37775))

(assert (=> d!37559 d!37569))

(assert (=> d!37559 d!37547))

(declare-fun d!37777 () Bool)

(assert (=> d!37777 (contains!861 (+!163 lt!64122 (tuple2!2521 lt!64114 (zeroValue!2628 (v!3108 (underlying!436 thiss!992))))) lt!64109)))

(assert (=> d!37777 true))

(declare-fun _$35!369 () Unit!3871)

(assert (=> d!37777 (= (choose!756 lt!64122 lt!64114 (zeroValue!2628 (v!3108 (underlying!436 thiss!992))) lt!64109) _$35!369)))

(declare-fun bs!5206 () Bool)

(assert (= bs!5206 d!37777))

(assert (=> bs!5206 m!144931))

(assert (=> bs!5206 m!144931))

(assert (=> bs!5206 m!144933))

(assert (=> d!37559 d!37777))

(declare-fun d!37779 () Bool)

(declare-fun e!81920 () Bool)

(assert (=> d!37779 e!81920))

(declare-fun res!60716 () Bool)

(assert (=> d!37779 (=> res!60716 e!81920)))

(declare-fun lt!64634 () Bool)

(assert (=> d!37779 (= res!60716 (not lt!64634))))

(declare-fun lt!64637 () Bool)

(assert (=> d!37779 (= lt!64634 lt!64637)))

(declare-fun lt!64636 () Unit!3871)

(declare-fun e!81921 () Unit!3871)

(assert (=> d!37779 (= lt!64636 e!81921)))

(declare-fun c!22854 () Bool)

(assert (=> d!37779 (= c!22854 lt!64637)))

(assert (=> d!37779 (= lt!64637 (containsKey!170 (toList!831 lt!64122) lt!64109))))

(assert (=> d!37779 (= (contains!861 lt!64122 lt!64109) lt!64634)))

(declare-fun b!125390 () Bool)

(declare-fun lt!64635 () Unit!3871)

(assert (=> b!125390 (= e!81921 lt!64635)))

(assert (=> b!125390 (= lt!64635 (lemmaContainsKeyImpliesGetValueByKeyDefined!118 (toList!831 lt!64122) lt!64109))))

(assert (=> b!125390 (isDefined!119 (getValueByKey!167 (toList!831 lt!64122) lt!64109))))

(declare-fun b!125391 () Bool)

(declare-fun Unit!3897 () Unit!3871)

(assert (=> b!125391 (= e!81921 Unit!3897)))

(declare-fun b!125392 () Bool)

(assert (=> b!125392 (= e!81920 (isDefined!119 (getValueByKey!167 (toList!831 lt!64122) lt!64109)))))

(assert (= (and d!37779 c!22854) b!125390))

(assert (= (and d!37779 (not c!22854)) b!125391))

(assert (= (and d!37779 (not res!60716)) b!125392))

(declare-fun m!145963 () Bool)

(assert (=> d!37779 m!145963))

(declare-fun m!145965 () Bool)

(assert (=> b!125390 m!145965))

(declare-fun m!145967 () Bool)

(assert (=> b!125390 m!145967))

(assert (=> b!125390 m!145967))

(declare-fun m!145969 () Bool)

(assert (=> b!125390 m!145969))

(assert (=> b!125392 m!145967))

(assert (=> b!125392 m!145967))

(assert (=> b!125392 m!145969))

(assert (=> d!37559 d!37779))

(declare-fun d!37781 () Bool)

(assert (=> d!37781 (= (isDefined!119 (getValueByKey!167 (toList!831 call!13342) (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355))) (not (isEmpty!399 (getValueByKey!167 (toList!831 call!13342) (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355)))))))

(declare-fun bs!5207 () Bool)

(assert (= bs!5207 d!37781))

(assert (=> bs!5207 m!145559))

(declare-fun m!145971 () Bool)

(assert (=> bs!5207 m!145971))

(assert (=> b!125209 d!37781))

(declare-fun b!125394 () Bool)

(declare-fun e!81922 () Option!173)

(declare-fun e!81923 () Option!173)

(assert (=> b!125394 (= e!81922 e!81923)))

(declare-fun c!22856 () Bool)

(assert (=> b!125394 (= c!22856 (and ((_ is Cons!1672) (toList!831 call!13342)) (not (= (_1!1271 (h!2273 (toList!831 call!13342))) (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355)))))))

(declare-fun b!125395 () Bool)

(assert (=> b!125395 (= e!81923 (getValueByKey!167 (t!5995 (toList!831 call!13342)) (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355)))))

(declare-fun c!22855 () Bool)

(declare-fun d!37783 () Bool)

(assert (=> d!37783 (= c!22855 (and ((_ is Cons!1672) (toList!831 call!13342)) (= (_1!1271 (h!2273 (toList!831 call!13342))) (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355))))))

(assert (=> d!37783 (= (getValueByKey!167 (toList!831 call!13342) (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355)) e!81922)))

(declare-fun b!125396 () Bool)

(assert (=> b!125396 (= e!81923 None!171)))

(declare-fun b!125393 () Bool)

(assert (=> b!125393 (= e!81922 (Some!172 (_2!1271 (h!2273 (toList!831 call!13342)))))))

(assert (= (and d!37783 c!22855) b!125393))

(assert (= (and d!37783 (not c!22855)) b!125394))

(assert (= (and b!125394 c!22856) b!125395))

(assert (= (and b!125394 (not c!22856)) b!125396))

(assert (=> b!125395 m!144797))

(declare-fun m!145973 () Bool)

(assert (=> b!125395 m!145973))

(assert (=> b!125209 d!37783))

(declare-fun d!37785 () Bool)

(declare-fun e!81924 () Bool)

(assert (=> d!37785 e!81924))

(declare-fun res!60717 () Bool)

(assert (=> d!37785 (=> res!60717 e!81924)))

(declare-fun lt!64638 () Bool)

(assert (=> d!37785 (= res!60717 (not lt!64638))))

(declare-fun lt!64641 () Bool)

(assert (=> d!37785 (= lt!64638 lt!64641)))

(declare-fun lt!64640 () Unit!3871)

(declare-fun e!81925 () Unit!3871)

(assert (=> d!37785 (= lt!64640 e!81925)))

(declare-fun c!22857 () Bool)

(assert (=> d!37785 (= c!22857 lt!64641)))

(assert (=> d!37785 (= lt!64641 (containsKey!170 (toList!831 lt!64351) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!37785 (= (contains!861 lt!64351 #b1000000000000000000000000000000000000000000000000000000000000000) lt!64638)))

(declare-fun b!125397 () Bool)

(declare-fun lt!64639 () Unit!3871)

(assert (=> b!125397 (= e!81925 lt!64639)))

(assert (=> b!125397 (= lt!64639 (lemmaContainsKeyImpliesGetValueByKeyDefined!118 (toList!831 lt!64351) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!125397 (isDefined!119 (getValueByKey!167 (toList!831 lt!64351) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!125398 () Bool)

(declare-fun Unit!3898 () Unit!3871)

(assert (=> b!125398 (= e!81925 Unit!3898)))

(declare-fun b!125399 () Bool)

(assert (=> b!125399 (= e!81924 (isDefined!119 (getValueByKey!167 (toList!831 lt!64351) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!37785 c!22857) b!125397))

(assert (= (and d!37785 (not c!22857)) b!125398))

(assert (= (and d!37785 (not res!60717)) b!125399))

(declare-fun m!145975 () Bool)

(assert (=> d!37785 m!145975))

(declare-fun m!145977 () Bool)

(assert (=> b!125397 m!145977))

(declare-fun m!145979 () Bool)

(assert (=> b!125397 m!145979))

(assert (=> b!125397 m!145979))

(declare-fun m!145981 () Bool)

(assert (=> b!125397 m!145981))

(assert (=> b!125399 m!145979))

(assert (=> b!125399 m!145979))

(assert (=> b!125399 m!145981))

(assert (=> bm!13372 d!37785))

(declare-fun d!37787 () Bool)

(assert (=> d!37787 (= (get!1449 (getValueByKey!167 (toList!831 lt!64110) lt!64128)) (v!3114 (getValueByKey!167 (toList!831 lt!64110) lt!64128)))))

(assert (=> d!37549 d!37787))

(declare-fun b!125401 () Bool)

(declare-fun e!81926 () Option!173)

(declare-fun e!81927 () Option!173)

(assert (=> b!125401 (= e!81926 e!81927)))

(declare-fun c!22859 () Bool)

(assert (=> b!125401 (= c!22859 (and ((_ is Cons!1672) (toList!831 lt!64110)) (not (= (_1!1271 (h!2273 (toList!831 lt!64110))) lt!64128))))))

(declare-fun b!125402 () Bool)

(assert (=> b!125402 (= e!81927 (getValueByKey!167 (t!5995 (toList!831 lt!64110)) lt!64128))))

(declare-fun d!37789 () Bool)

(declare-fun c!22858 () Bool)

(assert (=> d!37789 (= c!22858 (and ((_ is Cons!1672) (toList!831 lt!64110)) (= (_1!1271 (h!2273 (toList!831 lt!64110))) lt!64128)))))

(assert (=> d!37789 (= (getValueByKey!167 (toList!831 lt!64110) lt!64128) e!81926)))

(declare-fun b!125403 () Bool)

(assert (=> b!125403 (= e!81927 None!171)))

(declare-fun b!125400 () Bool)

(assert (=> b!125400 (= e!81926 (Some!172 (_2!1271 (h!2273 (toList!831 lt!64110)))))))

(assert (= (and d!37789 c!22858) b!125400))

(assert (= (and d!37789 (not c!22858)) b!125401))

(assert (= (and b!125401 c!22859) b!125402))

(assert (= (and b!125401 (not c!22859)) b!125403))

(declare-fun m!145983 () Bool)

(assert (=> b!125402 m!145983))

(assert (=> d!37549 d!37789))

(assert (=> b!125061 d!37633))

(declare-fun d!37791 () Bool)

(declare-fun e!81928 () Bool)

(assert (=> d!37791 e!81928))

(declare-fun res!60718 () Bool)

(assert (=> d!37791 (=> (not res!60718) (not e!81928))))

(declare-fun lt!64643 () ListLongMap!1631)

(assert (=> d!37791 (= res!60718 (contains!861 lt!64643 (_1!1271 (ite (or c!22775 c!22777) (tuple2!2521 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2628 newMap!16)) (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 newMap!16))))))))

(declare-fun lt!64644 () List!1676)

(assert (=> d!37791 (= lt!64643 (ListLongMap!1632 lt!64644))))

(declare-fun lt!64645 () Unit!3871)

(declare-fun lt!64642 () Unit!3871)

(assert (=> d!37791 (= lt!64645 lt!64642)))

(assert (=> d!37791 (= (getValueByKey!167 lt!64644 (_1!1271 (ite (or c!22775 c!22777) (tuple2!2521 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2628 newMap!16)) (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 newMap!16))))) (Some!172 (_2!1271 (ite (or c!22775 c!22777) (tuple2!2521 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2628 newMap!16)) (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 newMap!16))))))))

(assert (=> d!37791 (= lt!64642 (lemmaContainsTupThenGetReturnValue!82 lt!64644 (_1!1271 (ite (or c!22775 c!22777) (tuple2!2521 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2628 newMap!16)) (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 newMap!16)))) (_2!1271 (ite (or c!22775 c!22777) (tuple2!2521 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2628 newMap!16)) (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 newMap!16))))))))

(assert (=> d!37791 (= lt!64644 (insertStrictlySorted!85 (toList!831 (ite c!22775 call!13370 (ite c!22777 call!13371 call!13367))) (_1!1271 (ite (or c!22775 c!22777) (tuple2!2521 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2628 newMap!16)) (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 newMap!16)))) (_2!1271 (ite (or c!22775 c!22777) (tuple2!2521 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2628 newMap!16)) (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 newMap!16))))))))

(assert (=> d!37791 (= (+!163 (ite c!22775 call!13370 (ite c!22777 call!13371 call!13367)) (ite (or c!22775 c!22777) (tuple2!2521 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2628 newMap!16)) (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 newMap!16)))) lt!64643)))

(declare-fun b!125404 () Bool)

(declare-fun res!60719 () Bool)

(assert (=> b!125404 (=> (not res!60719) (not e!81928))))

(assert (=> b!125404 (= res!60719 (= (getValueByKey!167 (toList!831 lt!64643) (_1!1271 (ite (or c!22775 c!22777) (tuple2!2521 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2628 newMap!16)) (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 newMap!16))))) (Some!172 (_2!1271 (ite (or c!22775 c!22777) (tuple2!2521 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2628 newMap!16)) (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 newMap!16)))))))))

(declare-fun b!125405 () Bool)

(assert (=> b!125405 (= e!81928 (contains!862 (toList!831 lt!64643) (ite (or c!22775 c!22777) (tuple2!2521 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2628 newMap!16)) (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 newMap!16)))))))

(assert (= (and d!37791 res!60718) b!125404))

(assert (= (and b!125404 res!60719) b!125405))

(declare-fun m!145985 () Bool)

(assert (=> d!37791 m!145985))

(declare-fun m!145987 () Bool)

(assert (=> d!37791 m!145987))

(declare-fun m!145989 () Bool)

(assert (=> d!37791 m!145989))

(declare-fun m!145991 () Bool)

(assert (=> d!37791 m!145991))

(declare-fun m!145993 () Bool)

(assert (=> b!125404 m!145993))

(declare-fun m!145995 () Bool)

(assert (=> b!125405 m!145995))

(assert (=> bm!13362 d!37791))

(declare-fun b!125407 () Bool)

(declare-fun e!81929 () Option!173)

(declare-fun e!81930 () Option!173)

(assert (=> b!125407 (= e!81929 e!81930)))

(declare-fun c!22861 () Bool)

(assert (=> b!125407 (= c!22861 (and ((_ is Cons!1672) (toList!831 lt!64304)) (not (= (_1!1271 (h!2273 (toList!831 lt!64304))) (_1!1271 (tuple2!2521 lt!64124 (zeroValue!2628 (v!3108 (underlying!436 thiss!992)))))))))))

(declare-fun b!125408 () Bool)

(assert (=> b!125408 (= e!81930 (getValueByKey!167 (t!5995 (toList!831 lt!64304)) (_1!1271 (tuple2!2521 lt!64124 (zeroValue!2628 (v!3108 (underlying!436 thiss!992)))))))))

(declare-fun d!37793 () Bool)

(declare-fun c!22860 () Bool)

(assert (=> d!37793 (= c!22860 (and ((_ is Cons!1672) (toList!831 lt!64304)) (= (_1!1271 (h!2273 (toList!831 lt!64304))) (_1!1271 (tuple2!2521 lt!64124 (zeroValue!2628 (v!3108 (underlying!436 thiss!992))))))))))

(assert (=> d!37793 (= (getValueByKey!167 (toList!831 lt!64304) (_1!1271 (tuple2!2521 lt!64124 (zeroValue!2628 (v!3108 (underlying!436 thiss!992)))))) e!81929)))

(declare-fun b!125409 () Bool)

(assert (=> b!125409 (= e!81930 None!171)))

(declare-fun b!125406 () Bool)

(assert (=> b!125406 (= e!81929 (Some!172 (_2!1271 (h!2273 (toList!831 lt!64304)))))))

(assert (= (and d!37793 c!22860) b!125406))

(assert (= (and d!37793 (not c!22860)) b!125407))

(assert (= (and b!125407 c!22861) b!125408))

(assert (= (and b!125407 (not c!22861)) b!125409))

(declare-fun m!145997 () Bool)

(assert (=> b!125408 m!145997))

(assert (=> b!125021 d!37793))

(assert (=> bm!13393 d!37527))

(declare-fun d!37795 () Bool)

(assert (=> d!37795 (isDefined!119 (getValueByKey!167 (toList!831 lt!64108) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!64646 () Unit!3871)

(assert (=> d!37795 (= lt!64646 (choose!762 (toList!831 lt!64108) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!81931 () Bool)

(assert (=> d!37795 e!81931))

(declare-fun res!60720 () Bool)

(assert (=> d!37795 (=> (not res!60720) (not e!81931))))

(assert (=> d!37795 (= res!60720 (isStrictlySorted!303 (toList!831 lt!64108)))))

(assert (=> d!37795 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!118 (toList!831 lt!64108) #b0000000000000000000000000000000000000000000000000000000000000000) lt!64646)))

(declare-fun b!125410 () Bool)

(assert (=> b!125410 (= e!81931 (containsKey!170 (toList!831 lt!64108) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!37795 res!60720) b!125410))

(assert (=> d!37795 m!145453))

(assert (=> d!37795 m!145453))

(assert (=> d!37795 m!145455))

(declare-fun m!145999 () Bool)

(assert (=> d!37795 m!145999))

(declare-fun m!146001 () Bool)

(assert (=> d!37795 m!146001))

(assert (=> b!125410 m!145449))

(assert (=> b!125141 d!37795))

(declare-fun d!37797 () Bool)

(assert (=> d!37797 (= (isDefined!119 (getValueByKey!167 (toList!831 lt!64108) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (isEmpty!399 (getValueByKey!167 (toList!831 lt!64108) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bs!5208 () Bool)

(assert (= bs!5208 d!37797))

(assert (=> bs!5208 m!145453))

(declare-fun m!146003 () Bool)

(assert (=> bs!5208 m!146003))

(assert (=> b!125141 d!37797))

(declare-fun b!125412 () Bool)

(declare-fun e!81932 () Option!173)

(declare-fun e!81933 () Option!173)

(assert (=> b!125412 (= e!81932 e!81933)))

(declare-fun c!22863 () Bool)

(assert (=> b!125412 (= c!22863 (and ((_ is Cons!1672) (toList!831 lt!64108)) (not (= (_1!1271 (h!2273 (toList!831 lt!64108))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!125413 () Bool)

(assert (=> b!125413 (= e!81933 (getValueByKey!167 (t!5995 (toList!831 lt!64108)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!37799 () Bool)

(declare-fun c!22862 () Bool)

(assert (=> d!37799 (= c!22862 (and ((_ is Cons!1672) (toList!831 lt!64108)) (= (_1!1271 (h!2273 (toList!831 lt!64108))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!37799 (= (getValueByKey!167 (toList!831 lt!64108) #b0000000000000000000000000000000000000000000000000000000000000000) e!81932)))

(declare-fun b!125414 () Bool)

(assert (=> b!125414 (= e!81933 None!171)))

(declare-fun b!125411 () Bool)

(assert (=> b!125411 (= e!81932 (Some!172 (_2!1271 (h!2273 (toList!831 lt!64108)))))))

(assert (= (and d!37799 c!22862) b!125411))

(assert (= (and d!37799 (not c!22862)) b!125412))

(assert (= (and b!125412 c!22863) b!125413))

(assert (= (and b!125412 (not c!22863)) b!125414))

(declare-fun m!146005 () Bool)

(assert (=> b!125413 m!146005))

(assert (=> b!125141 d!37799))

(declare-fun d!37801 () Bool)

(declare-fun e!81934 () Bool)

(assert (=> d!37801 e!81934))

(declare-fun res!60721 () Bool)

(assert (=> d!37801 (=> res!60721 e!81934)))

(declare-fun lt!64647 () Bool)

(assert (=> d!37801 (= res!60721 (not lt!64647))))

(declare-fun lt!64650 () Bool)

(assert (=> d!37801 (= lt!64647 lt!64650)))

(declare-fun lt!64649 () Unit!3871)

(declare-fun e!81935 () Unit!3871)

(assert (=> d!37801 (= lt!64649 e!81935)))

(declare-fun c!22864 () Bool)

(assert (=> d!37801 (= c!22864 lt!64650)))

(assert (=> d!37801 (= lt!64650 (containsKey!170 (toList!831 lt!64351) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!37801 (= (contains!861 lt!64351 #b0000000000000000000000000000000000000000000000000000000000000000) lt!64647)))

(declare-fun b!125415 () Bool)

(declare-fun lt!64648 () Unit!3871)

(assert (=> b!125415 (= e!81935 lt!64648)))

(assert (=> b!125415 (= lt!64648 (lemmaContainsKeyImpliesGetValueByKeyDefined!118 (toList!831 lt!64351) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!125415 (isDefined!119 (getValueByKey!167 (toList!831 lt!64351) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!125416 () Bool)

(declare-fun Unit!3899 () Unit!3871)

(assert (=> b!125416 (= e!81935 Unit!3899)))

(declare-fun b!125417 () Bool)

(assert (=> b!125417 (= e!81934 (isDefined!119 (getValueByKey!167 (toList!831 lt!64351) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!37801 c!22864) b!125415))

(assert (= (and d!37801 (not c!22864)) b!125416))

(assert (= (and d!37801 (not res!60721)) b!125417))

(declare-fun m!146007 () Bool)

(assert (=> d!37801 m!146007))

(declare-fun m!146009 () Bool)

(assert (=> b!125415 m!146009))

(assert (=> b!125415 m!145613))

(assert (=> b!125415 m!145613))

(declare-fun m!146011 () Bool)

(assert (=> b!125415 m!146011))

(assert (=> b!125417 m!145613))

(assert (=> b!125417 m!145613))

(assert (=> b!125417 m!146011))

(assert (=> bm!13373 d!37801))

(declare-fun d!37803 () Bool)

(declare-fun res!60722 () Bool)

(declare-fun e!81936 () Bool)

(assert (=> d!37803 (=> res!60722 e!81936)))

(assert (=> d!37803 (= res!60722 (and ((_ is Cons!1672) (toList!831 lt!64108)) (= (_1!1271 (h!2273 (toList!831 lt!64108))) (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(assert (=> d!37803 (= (containsKey!170 (toList!831 lt!64108) (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) e!81936)))

(declare-fun b!125418 () Bool)

(declare-fun e!81937 () Bool)

(assert (=> b!125418 (= e!81936 e!81937)))

(declare-fun res!60723 () Bool)

(assert (=> b!125418 (=> (not res!60723) (not e!81937))))

(assert (=> b!125418 (= res!60723 (and (or (not ((_ is Cons!1672) (toList!831 lt!64108))) (bvsle (_1!1271 (h!2273 (toList!831 lt!64108))) (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))) ((_ is Cons!1672) (toList!831 lt!64108)) (bvslt (_1!1271 (h!2273 (toList!831 lt!64108))) (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(declare-fun b!125419 () Bool)

(assert (=> b!125419 (= e!81937 (containsKey!170 (t!5995 (toList!831 lt!64108)) (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (= (and d!37803 (not res!60722)) b!125418))

(assert (= (and b!125418 res!60723) b!125419))

(assert (=> b!125419 m!144905))

(declare-fun m!146013 () Bool)

(assert (=> b!125419 m!146013))

(assert (=> d!37619 d!37803))

(assert (=> b!125128 d!37633))

(declare-fun d!37805 () Bool)

(declare-fun res!60725 () Bool)

(declare-fun e!81938 () Bool)

(assert (=> d!37805 (=> (not res!60725) (not e!81938))))

(assert (=> d!37805 (= res!60725 (validMask!0 (mask!7009 (v!3108 (underlying!436 thiss!992)))))))

(assert (=> d!37805 (= (simpleValid!86 (v!3108 (underlying!436 thiss!992))) e!81938)))

(declare-fun b!125422 () Bool)

(declare-fun res!60724 () Bool)

(assert (=> b!125422 (=> (not res!60724) (not e!81938))))

(assert (=> b!125422 (= res!60724 (= (size!2479 (v!3108 (underlying!436 thiss!992))) (bvadd (_size!576 (v!3108 (underlying!436 thiss!992))) (bvsdiv (bvadd (extraKeys!2548 (v!3108 (underlying!436 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!125420 () Bool)

(declare-fun res!60727 () Bool)

(assert (=> b!125420 (=> (not res!60727) (not e!81938))))

(assert (=> b!125420 (= res!60727 (and (= (size!2474 (_values!2746 (v!3108 (underlying!436 thiss!992)))) (bvadd (mask!7009 (v!3108 (underlying!436 thiss!992))) #b00000000000000000000000000000001)) (= (size!2473 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) (size!2474 (_values!2746 (v!3108 (underlying!436 thiss!992))))) (bvsge (_size!576 (v!3108 (underlying!436 thiss!992))) #b00000000000000000000000000000000) (bvsle (_size!576 (v!3108 (underlying!436 thiss!992))) (bvadd (mask!7009 (v!3108 (underlying!436 thiss!992))) #b00000000000000000000000000000001))))))

(declare-fun b!125423 () Bool)

(assert (=> b!125423 (= e!81938 (and (bvsge (extraKeys!2548 (v!3108 (underlying!436 thiss!992))) #b00000000000000000000000000000000) (bvsle (extraKeys!2548 (v!3108 (underlying!436 thiss!992))) #b00000000000000000000000000000011) (bvsge (_vacant!576 (v!3108 (underlying!436 thiss!992))) #b00000000000000000000000000000000)))))

(declare-fun b!125421 () Bool)

(declare-fun res!60726 () Bool)

(assert (=> b!125421 (=> (not res!60726) (not e!81938))))

(assert (=> b!125421 (= res!60726 (bvsge (size!2479 (v!3108 (underlying!436 thiss!992))) (_size!576 (v!3108 (underlying!436 thiss!992)))))))

(assert (= (and d!37805 res!60725) b!125420))

(assert (= (and b!125420 res!60727) b!125421))

(assert (= (and b!125421 res!60726) b!125422))

(assert (= (and b!125422 res!60724) b!125423))

(assert (=> d!37805 m!144811))

(declare-fun m!146015 () Bool)

(assert (=> b!125422 m!146015))

(assert (=> b!125421 m!146015))

(assert (=> d!37525 d!37805))

(declare-fun b!125425 () Bool)

(declare-fun e!81939 () Option!173)

(declare-fun e!81940 () Option!173)

(assert (=> b!125425 (= e!81939 e!81940)))

(declare-fun c!22866 () Bool)

(assert (=> b!125425 (= c!22866 (and ((_ is Cons!1672) (toList!831 lt!64316)) (not (= (_1!1271 (h!2273 (toList!831 lt!64316))) (_1!1271 (ite c!22717 (ite c!22710 (tuple2!2521 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2521 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))))

(declare-fun b!125426 () Bool)

(assert (=> b!125426 (= e!81940 (getValueByKey!167 (t!5995 (toList!831 lt!64316)) (_1!1271 (ite c!22717 (ite c!22710 (tuple2!2521 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2521 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun d!37807 () Bool)

(declare-fun c!22865 () Bool)

(assert (=> d!37807 (= c!22865 (and ((_ is Cons!1672) (toList!831 lt!64316)) (= (_1!1271 (h!2273 (toList!831 lt!64316))) (_1!1271 (ite c!22717 (ite c!22710 (tuple2!2521 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2521 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(assert (=> d!37807 (= (getValueByKey!167 (toList!831 lt!64316) (_1!1271 (ite c!22717 (ite c!22710 (tuple2!2521 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2521 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))) e!81939)))

(declare-fun b!125427 () Bool)

(assert (=> b!125427 (= e!81940 None!171)))

(declare-fun b!125424 () Bool)

(assert (=> b!125424 (= e!81939 (Some!172 (_2!1271 (h!2273 (toList!831 lt!64316)))))))

(assert (= (and d!37807 c!22865) b!125424))

(assert (= (and d!37807 (not c!22865)) b!125425))

(assert (= (and b!125425 c!22866) b!125426))

(assert (= (and b!125425 (not c!22866)) b!125427))

(declare-fun m!146017 () Bool)

(assert (=> b!125426 m!146017))

(assert (=> b!125028 d!37807))

(declare-fun d!37809 () Bool)

(assert (=> d!37809 (= (apply!110 lt!64329 (select (arr!2210 (_keys!4492 newMap!16)) #b00000000000000000000000000000000)) (get!1449 (getValueByKey!167 (toList!831 lt!64329) (select (arr!2210 (_keys!4492 newMap!16)) #b00000000000000000000000000000000))))))

(declare-fun bs!5209 () Bool)

(assert (= bs!5209 d!37809))

(assert (=> bs!5209 m!145113))

(declare-fun m!146019 () Bool)

(assert (=> bs!5209 m!146019))

(assert (=> bs!5209 m!146019))

(declare-fun m!146021 () Bool)

(assert (=> bs!5209 m!146021))

(assert (=> b!125065 d!37809))

(declare-fun c!22867 () Bool)

(declare-fun d!37811 () Bool)

(assert (=> d!37811 (= c!22867 ((_ is ValueCellFull!1073) (select (arr!2211 (ite c!22717 (_values!2746 newMap!16) (array!4670 (store (arr!2211 (_values!2746 newMap!16)) (index!3207 lt!64214) (ValueCellFull!1073 (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2474 (_values!2746 newMap!16))))) #b00000000000000000000000000000000)))))

(declare-fun e!81941 () V!3425)

(assert (=> d!37811 (= (get!1446 (select (arr!2211 (ite c!22717 (_values!2746 newMap!16) (array!4670 (store (arr!2211 (_values!2746 newMap!16)) (index!3207 lt!64214) (ValueCellFull!1073 (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2474 (_values!2746 newMap!16))))) #b00000000000000000000000000000000) (dynLambda!415 (defaultEntry!2763 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000)) e!81941)))

(declare-fun b!125428 () Bool)

(assert (=> b!125428 (= e!81941 (get!1447 (select (arr!2211 (ite c!22717 (_values!2746 newMap!16) (array!4670 (store (arr!2211 (_values!2746 newMap!16)) (index!3207 lt!64214) (ValueCellFull!1073 (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2474 (_values!2746 newMap!16))))) #b00000000000000000000000000000000) (dynLambda!415 (defaultEntry!2763 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!125429 () Bool)

(assert (=> b!125429 (= e!81941 (get!1448 (select (arr!2211 (ite c!22717 (_values!2746 newMap!16) (array!4670 (store (arr!2211 (_values!2746 newMap!16)) (index!3207 lt!64214) (ValueCellFull!1073 (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2474 (_values!2746 newMap!16))))) #b00000000000000000000000000000000) (dynLambda!415 (defaultEntry!2763 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!37811 c!22867) b!125428))

(assert (= (and d!37811 (not c!22867)) b!125429))

(assert (=> b!125428 m!145279))

(assert (=> b!125428 m!145277))

(declare-fun m!146023 () Bool)

(assert (=> b!125428 m!146023))

(assert (=> b!125429 m!145279))

(assert (=> b!125429 m!145277))

(declare-fun m!146025 () Bool)

(assert (=> b!125429 m!146025))

(assert (=> b!125065 d!37811))

(assert (=> bm!13349 d!37589))

(declare-fun d!37813 () Bool)

(declare-fun e!81942 () Bool)

(assert (=> d!37813 e!81942))

(declare-fun res!60728 () Bool)

(assert (=> d!37813 (=> res!60728 e!81942)))

(declare-fun lt!64651 () Bool)

(assert (=> d!37813 (= res!60728 (not lt!64651))))

(declare-fun lt!64654 () Bool)

(assert (=> d!37813 (= lt!64651 lt!64654)))

(declare-fun lt!64653 () Unit!3871)

(declare-fun e!81943 () Unit!3871)

(assert (=> d!37813 (= lt!64653 e!81943)))

(declare-fun c!22868 () Bool)

(assert (=> d!37813 (= c!22868 lt!64654)))

(assert (=> d!37813 (= lt!64654 (containsKey!170 (toList!831 lt!64244) (_1!1271 (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 (v!3108 (underlying!436 thiss!992)))))))))

(assert (=> d!37813 (= (contains!861 lt!64244 (_1!1271 (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 (v!3108 (underlying!436 thiss!992)))))) lt!64651)))

(declare-fun b!125430 () Bool)

(declare-fun lt!64652 () Unit!3871)

(assert (=> b!125430 (= e!81943 lt!64652)))

(assert (=> b!125430 (= lt!64652 (lemmaContainsKeyImpliesGetValueByKeyDefined!118 (toList!831 lt!64244) (_1!1271 (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 (v!3108 (underlying!436 thiss!992)))))))))

(assert (=> b!125430 (isDefined!119 (getValueByKey!167 (toList!831 lt!64244) (_1!1271 (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 (v!3108 (underlying!436 thiss!992)))))))))

(declare-fun b!125431 () Bool)

(declare-fun Unit!3900 () Unit!3871)

(assert (=> b!125431 (= e!81943 Unit!3900)))

(declare-fun b!125432 () Bool)

(assert (=> b!125432 (= e!81942 (isDefined!119 (getValueByKey!167 (toList!831 lt!64244) (_1!1271 (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 (v!3108 (underlying!436 thiss!992))))))))))

(assert (= (and d!37813 c!22868) b!125430))

(assert (= (and d!37813 (not c!22868)) b!125431))

(assert (= (and d!37813 (not res!60728)) b!125432))

(declare-fun m!146027 () Bool)

(assert (=> d!37813 m!146027))

(declare-fun m!146029 () Bool)

(assert (=> b!125430 m!146029))

(assert (=> b!125430 m!145077))

(assert (=> b!125430 m!145077))

(declare-fun m!146031 () Bool)

(assert (=> b!125430 m!146031))

(assert (=> b!125432 m!145077))

(assert (=> b!125432 m!145077))

(assert (=> b!125432 m!146031))

(assert (=> d!37529 d!37813))

(declare-fun b!125434 () Bool)

(declare-fun e!81944 () Option!173)

(declare-fun e!81945 () Option!173)

(assert (=> b!125434 (= e!81944 e!81945)))

(declare-fun c!22870 () Bool)

(assert (=> b!125434 (= c!22870 (and ((_ is Cons!1672) lt!64245) (not (= (_1!1271 (h!2273 lt!64245)) (_1!1271 (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 (v!3108 (underlying!436 thiss!992)))))))))))

(declare-fun b!125435 () Bool)

(assert (=> b!125435 (= e!81945 (getValueByKey!167 (t!5995 lt!64245) (_1!1271 (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 (v!3108 (underlying!436 thiss!992)))))))))

(declare-fun d!37815 () Bool)

(declare-fun c!22869 () Bool)

(assert (=> d!37815 (= c!22869 (and ((_ is Cons!1672) lt!64245) (= (_1!1271 (h!2273 lt!64245)) (_1!1271 (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 (v!3108 (underlying!436 thiss!992))))))))))

(assert (=> d!37815 (= (getValueByKey!167 lt!64245 (_1!1271 (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 (v!3108 (underlying!436 thiss!992)))))) e!81944)))

(declare-fun b!125436 () Bool)

(assert (=> b!125436 (= e!81945 None!171)))

(declare-fun b!125433 () Bool)

(assert (=> b!125433 (= e!81944 (Some!172 (_2!1271 (h!2273 lt!64245))))))

(assert (= (and d!37815 c!22869) b!125433))

(assert (= (and d!37815 (not c!22869)) b!125434))

(assert (= (and b!125434 c!22870) b!125435))

(assert (= (and b!125434 (not c!22870)) b!125436))

(declare-fun m!146033 () Bool)

(assert (=> b!125435 m!146033))

(assert (=> d!37529 d!37815))

(declare-fun d!37817 () Bool)

(assert (=> d!37817 (= (getValueByKey!167 lt!64245 (_1!1271 (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 (v!3108 (underlying!436 thiss!992)))))) (Some!172 (_2!1271 (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 (v!3108 (underlying!436 thiss!992)))))))))

(declare-fun lt!64655 () Unit!3871)

(assert (=> d!37817 (= lt!64655 (choose!763 lt!64245 (_1!1271 (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 (v!3108 (underlying!436 thiss!992))))) (_2!1271 (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 (v!3108 (underlying!436 thiss!992)))))))))

(declare-fun e!81946 () Bool)

(assert (=> d!37817 e!81946))

(declare-fun res!60729 () Bool)

(assert (=> d!37817 (=> (not res!60729) (not e!81946))))

(assert (=> d!37817 (= res!60729 (isStrictlySorted!303 lt!64245))))

(assert (=> d!37817 (= (lemmaContainsTupThenGetReturnValue!82 lt!64245 (_1!1271 (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 (v!3108 (underlying!436 thiss!992))))) (_2!1271 (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 (v!3108 (underlying!436 thiss!992)))))) lt!64655)))

(declare-fun b!125437 () Bool)

(declare-fun res!60730 () Bool)

(assert (=> b!125437 (=> (not res!60730) (not e!81946))))

(assert (=> b!125437 (= res!60730 (containsKey!170 lt!64245 (_1!1271 (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 (v!3108 (underlying!436 thiss!992)))))))))

(declare-fun b!125438 () Bool)

(assert (=> b!125438 (= e!81946 (contains!862 lt!64245 (tuple2!2521 (_1!1271 (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 (v!3108 (underlying!436 thiss!992))))) (_2!1271 (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 (v!3108 (underlying!436 thiss!992))))))))))

(assert (= (and d!37817 res!60729) b!125437))

(assert (= (and b!125437 res!60730) b!125438))

(assert (=> d!37817 m!145071))

(declare-fun m!146035 () Bool)

(assert (=> d!37817 m!146035))

(declare-fun m!146037 () Bool)

(assert (=> d!37817 m!146037))

(declare-fun m!146039 () Bool)

(assert (=> b!125437 m!146039))

(declare-fun m!146041 () Bool)

(assert (=> b!125438 m!146041))

(assert (=> d!37529 d!37817))

(declare-fun b!125439 () Bool)

(declare-fun e!81947 () List!1676)

(declare-fun call!13413 () List!1676)

(assert (=> b!125439 (= e!81947 call!13413)))

(declare-fun b!125440 () Bool)

(declare-fun c!22871 () Bool)

(assert (=> b!125440 (= c!22871 (and ((_ is Cons!1672) (toList!831 call!13268)) (bvsgt (_1!1271 (h!2273 (toList!831 call!13268))) (_1!1271 (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 (v!3108 (underlying!436 thiss!992))))))))))

(declare-fun e!81951 () List!1676)

(assert (=> b!125440 (= e!81951 e!81947)))

(declare-fun b!125441 () Bool)

(declare-fun res!60732 () Bool)

(declare-fun e!81950 () Bool)

(assert (=> b!125441 (=> (not res!60732) (not e!81950))))

(declare-fun lt!64656 () List!1676)

(assert (=> b!125441 (= res!60732 (containsKey!170 lt!64656 (_1!1271 (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 (v!3108 (underlying!436 thiss!992)))))))))

(declare-fun d!37819 () Bool)

(assert (=> d!37819 e!81950))

(declare-fun res!60731 () Bool)

(assert (=> d!37819 (=> (not res!60731) (not e!81950))))

(assert (=> d!37819 (= res!60731 (isStrictlySorted!303 lt!64656))))

(declare-fun e!81948 () List!1676)

(assert (=> d!37819 (= lt!64656 e!81948)))

(declare-fun c!22873 () Bool)

(assert (=> d!37819 (= c!22873 (and ((_ is Cons!1672) (toList!831 call!13268)) (bvslt (_1!1271 (h!2273 (toList!831 call!13268))) (_1!1271 (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 (v!3108 (underlying!436 thiss!992))))))))))

(assert (=> d!37819 (isStrictlySorted!303 (toList!831 call!13268))))

(assert (=> d!37819 (= (insertStrictlySorted!85 (toList!831 call!13268) (_1!1271 (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 (v!3108 (underlying!436 thiss!992))))) (_2!1271 (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 (v!3108 (underlying!436 thiss!992)))))) lt!64656)))

(declare-fun b!125442 () Bool)

(declare-fun call!13411 () List!1676)

(assert (=> b!125442 (= e!81948 call!13411)))

(declare-fun b!125443 () Bool)

(assert (=> b!125443 (= e!81950 (contains!862 lt!64656 (tuple2!2521 (_1!1271 (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 (v!3108 (underlying!436 thiss!992))))) (_2!1271 (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 (v!3108 (underlying!436 thiss!992))))))))))

(declare-fun e!81949 () List!1676)

(declare-fun bm!13408 () Bool)

(assert (=> bm!13408 (= call!13411 ($colon$colon!87 e!81949 (ite c!22873 (h!2273 (toList!831 call!13268)) (tuple2!2521 (_1!1271 (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 (v!3108 (underlying!436 thiss!992))))) (_2!1271 (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 (v!3108 (underlying!436 thiss!992)))))))))))

(declare-fun c!22874 () Bool)

(assert (=> bm!13408 (= c!22874 c!22873)))

(declare-fun bm!13409 () Bool)

(declare-fun call!13412 () List!1676)

(assert (=> bm!13409 (= call!13412 call!13411)))

(declare-fun bm!13410 () Bool)

(assert (=> bm!13410 (= call!13413 call!13412)))

(declare-fun b!125444 () Bool)

(assert (=> b!125444 (= e!81948 e!81951)))

(declare-fun c!22872 () Bool)

(assert (=> b!125444 (= c!22872 (and ((_ is Cons!1672) (toList!831 call!13268)) (= (_1!1271 (h!2273 (toList!831 call!13268))) (_1!1271 (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 (v!3108 (underlying!436 thiss!992))))))))))

(declare-fun b!125445 () Bool)

(assert (=> b!125445 (= e!81947 call!13413)))

(declare-fun b!125446 () Bool)

(assert (=> b!125446 (= e!81949 (ite c!22872 (t!5995 (toList!831 call!13268)) (ite c!22871 (Cons!1672 (h!2273 (toList!831 call!13268)) (t!5995 (toList!831 call!13268))) Nil!1673)))))

(declare-fun b!125447 () Bool)

(assert (=> b!125447 (= e!81949 (insertStrictlySorted!85 (t!5995 (toList!831 call!13268)) (_1!1271 (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 (v!3108 (underlying!436 thiss!992))))) (_2!1271 (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 (v!3108 (underlying!436 thiss!992)))))))))

(declare-fun b!125448 () Bool)

(assert (=> b!125448 (= e!81951 call!13412)))

(assert (= (and d!37819 c!22873) b!125442))

(assert (= (and d!37819 (not c!22873)) b!125444))

(assert (= (and b!125444 c!22872) b!125448))

(assert (= (and b!125444 (not c!22872)) b!125440))

(assert (= (and b!125440 c!22871) b!125439))

(assert (= (and b!125440 (not c!22871)) b!125445))

(assert (= (or b!125439 b!125445) bm!13410))

(assert (= (or b!125448 bm!13410) bm!13409))

(assert (= (or b!125442 bm!13409) bm!13408))

(assert (= (and bm!13408 c!22874) b!125447))

(assert (= (and bm!13408 (not c!22874)) b!125446))

(assert (= (and d!37819 res!60731) b!125441))

(assert (= (and b!125441 res!60732) b!125443))

(declare-fun m!146043 () Bool)

(assert (=> d!37819 m!146043))

(declare-fun m!146045 () Bool)

(assert (=> d!37819 m!146045))

(declare-fun m!146047 () Bool)

(assert (=> bm!13408 m!146047))

(declare-fun m!146049 () Bool)

(assert (=> b!125443 m!146049))

(declare-fun m!146051 () Bool)

(assert (=> b!125441 m!146051))

(declare-fun m!146053 () Bool)

(assert (=> b!125447 m!146053))

(assert (=> d!37529 d!37819))

(declare-fun d!37821 () Bool)

(declare-fun e!81952 () Bool)

(assert (=> d!37821 e!81952))

(declare-fun res!60733 () Bool)

(assert (=> d!37821 (=> res!60733 e!81952)))

(declare-fun lt!64657 () Bool)

(assert (=> d!37821 (= res!60733 (not lt!64657))))

(declare-fun lt!64660 () Bool)

(assert (=> d!37821 (= lt!64657 lt!64660)))

(declare-fun lt!64659 () Unit!3871)

(declare-fun e!81953 () Unit!3871)

(assert (=> d!37821 (= lt!64659 e!81953)))

(declare-fun c!22875 () Bool)

(assert (=> d!37821 (= c!22875 lt!64660)))

(assert (=> d!37821 (= lt!64660 (containsKey!170 (toList!831 lt!64351) (select (arr!2210 (_keys!4492 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> d!37821 (= (contains!861 lt!64351 (select (arr!2210 (_keys!4492 newMap!16)) #b00000000000000000000000000000000)) lt!64657)))

(declare-fun b!125449 () Bool)

(declare-fun lt!64658 () Unit!3871)

(assert (=> b!125449 (= e!81953 lt!64658)))

(assert (=> b!125449 (= lt!64658 (lemmaContainsKeyImpliesGetValueByKeyDefined!118 (toList!831 lt!64351) (select (arr!2210 (_keys!4492 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!125449 (isDefined!119 (getValueByKey!167 (toList!831 lt!64351) (select (arr!2210 (_keys!4492 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!125450 () Bool)

(declare-fun Unit!3901 () Unit!3871)

(assert (=> b!125450 (= e!81953 Unit!3901)))

(declare-fun b!125451 () Bool)

(assert (=> b!125451 (= e!81952 (isDefined!119 (getValueByKey!167 (toList!831 lt!64351) (select (arr!2210 (_keys!4492 newMap!16)) #b00000000000000000000000000000000))))))

(assert (= (and d!37821 c!22875) b!125449))

(assert (= (and d!37821 (not c!22875)) b!125450))

(assert (= (and d!37821 (not res!60733)) b!125451))

(assert (=> d!37821 m!145113))

(declare-fun m!146055 () Bool)

(assert (=> d!37821 m!146055))

(assert (=> b!125449 m!145113))

(declare-fun m!146057 () Bool)

(assert (=> b!125449 m!146057))

(assert (=> b!125449 m!145113))

(declare-fun m!146059 () Bool)

(assert (=> b!125449 m!146059))

(assert (=> b!125449 m!146059))

(declare-fun m!146061 () Bool)

(assert (=> b!125449 m!146061))

(assert (=> b!125451 m!145113))

(assert (=> b!125451 m!146059))

(assert (=> b!125451 m!146059))

(assert (=> b!125451 m!146061))

(assert (=> b!125096 d!37821))

(declare-fun b!125464 () Bool)

(declare-fun c!22883 () Bool)

(declare-fun lt!64665 () (_ BitVec 64))

(assert (=> b!125464 (= c!22883 (= lt!64665 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!81960 () SeekEntryResult!263)

(declare-fun e!81961 () SeekEntryResult!263)

(assert (=> b!125464 (= e!81960 e!81961)))

(declare-fun b!125465 () Bool)

(declare-fun e!81962 () SeekEntryResult!263)

(assert (=> b!125465 (= e!81962 e!81960)))

(declare-fun c!22884 () Bool)

(assert (=> b!125465 (= c!22884 (= lt!64665 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355)))))

(declare-fun b!125466 () Bool)

(assert (=> b!125466 (= e!81962 Undefined!263)))

(declare-fun b!125467 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!125467 (= e!81961 (seekKeyOrZeroReturnVacant!0 (bvadd (x!14812 lt!64240) #b00000000000000000000000000000001) (nextIndex!0 (index!3208 lt!64240) (bvadd (x!14812 lt!64240) #b00000000000000000000000000000001) (mask!7009 newMap!16)) (index!3208 lt!64240) (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355) (_keys!4492 newMap!16) (mask!7009 newMap!16)))))

(declare-fun b!125468 () Bool)

(assert (=> b!125468 (= e!81961 (MissingVacant!263 (index!3208 lt!64240)))))

(declare-fun d!37823 () Bool)

(declare-fun lt!64666 () SeekEntryResult!263)

(assert (=> d!37823 (and (or ((_ is Undefined!263) lt!64666) (not ((_ is Found!263) lt!64666)) (and (bvsge (index!3207 lt!64666) #b00000000000000000000000000000000) (bvslt (index!3207 lt!64666) (size!2473 (_keys!4492 newMap!16))))) (or ((_ is Undefined!263) lt!64666) ((_ is Found!263) lt!64666) (not ((_ is MissingVacant!263) lt!64666)) (not (= (index!3209 lt!64666) (index!3208 lt!64240))) (and (bvsge (index!3209 lt!64666) #b00000000000000000000000000000000) (bvslt (index!3209 lt!64666) (size!2473 (_keys!4492 newMap!16))))) (or ((_ is Undefined!263) lt!64666) (ite ((_ is Found!263) lt!64666) (= (select (arr!2210 (_keys!4492 newMap!16)) (index!3207 lt!64666)) (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355)) (and ((_ is MissingVacant!263) lt!64666) (= (index!3209 lt!64666) (index!3208 lt!64240)) (= (select (arr!2210 (_keys!4492 newMap!16)) (index!3209 lt!64666)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!37823 (= lt!64666 e!81962)))

(declare-fun c!22882 () Bool)

(assert (=> d!37823 (= c!22882 (bvsge (x!14812 lt!64240) #b01111111111111111111111111111110))))

(assert (=> d!37823 (= lt!64665 (select (arr!2210 (_keys!4492 newMap!16)) (index!3208 lt!64240)))))

(assert (=> d!37823 (validMask!0 (mask!7009 newMap!16))))

(assert (=> d!37823 (= (seekKeyOrZeroReturnVacant!0 (x!14812 lt!64240) (index!3208 lt!64240) (index!3208 lt!64240) (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355) (_keys!4492 newMap!16) (mask!7009 newMap!16)) lt!64666)))

(declare-fun b!125469 () Bool)

(assert (=> b!125469 (= e!81960 (Found!263 (index!3208 lt!64240)))))

(assert (= (and d!37823 c!22882) b!125466))

(assert (= (and d!37823 (not c!22882)) b!125465))

(assert (= (and b!125465 c!22884) b!125469))

(assert (= (and b!125465 (not c!22884)) b!125464))

(assert (= (and b!125464 c!22883) b!125468))

(assert (= (and b!125464 (not c!22883)) b!125467))

(declare-fun m!146063 () Bool)

(assert (=> b!125467 m!146063))

(assert (=> b!125467 m!146063))

(assert (=> b!125467 m!144797))

(declare-fun m!146065 () Bool)

(assert (=> b!125467 m!146065))

(declare-fun m!146067 () Bool)

(assert (=> d!37823 m!146067))

(declare-fun m!146069 () Bool)

(assert (=> d!37823 m!146069))

(assert (=> d!37823 m!145053))

(assert (=> d!37823 m!145065))

(assert (=> b!124910 d!37823))

(declare-fun b!125471 () Bool)

(declare-fun e!81963 () Option!173)

(declare-fun e!81964 () Option!173)

(assert (=> b!125471 (= e!81963 e!81964)))

(declare-fun c!22886 () Bool)

(assert (=> b!125471 (= c!22886 (and ((_ is Cons!1672) (toList!831 lt!64267)) (not (= (_1!1271 (h!2273 (toList!831 lt!64267))) (_1!1271 (tuple2!2521 lt!64114 (zeroValue!2628 (v!3108 (underlying!436 thiss!992)))))))))))

(declare-fun b!125472 () Bool)

(assert (=> b!125472 (= e!81964 (getValueByKey!167 (t!5995 (toList!831 lt!64267)) (_1!1271 (tuple2!2521 lt!64114 (zeroValue!2628 (v!3108 (underlying!436 thiss!992)))))))))

(declare-fun d!37825 () Bool)

(declare-fun c!22885 () Bool)

(assert (=> d!37825 (= c!22885 (and ((_ is Cons!1672) (toList!831 lt!64267)) (= (_1!1271 (h!2273 (toList!831 lt!64267))) (_1!1271 (tuple2!2521 lt!64114 (zeroValue!2628 (v!3108 (underlying!436 thiss!992))))))))))

(assert (=> d!37825 (= (getValueByKey!167 (toList!831 lt!64267) (_1!1271 (tuple2!2521 lt!64114 (zeroValue!2628 (v!3108 (underlying!436 thiss!992)))))) e!81963)))

(declare-fun b!125473 () Bool)

(assert (=> b!125473 (= e!81964 None!171)))

(declare-fun b!125470 () Bool)

(assert (=> b!125470 (= e!81963 (Some!172 (_2!1271 (h!2273 (toList!831 lt!64267)))))))

(assert (= (and d!37825 c!22885) b!125470))

(assert (= (and d!37825 (not c!22885)) b!125471))

(assert (= (and b!125471 c!22886) b!125472))

(assert (= (and b!125471 (not c!22886)) b!125473))

(declare-fun m!146071 () Bool)

(assert (=> b!125472 m!146071))

(assert (=> b!124974 d!37825))

(declare-fun d!37827 () Bool)

(assert (=> d!37827 (= (apply!110 lt!64381 #b0000000000000000000000000000000000000000000000000000000000000000) (get!1449 (getValueByKey!167 (toList!831 lt!64381) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!5210 () Bool)

(assert (= bs!5210 d!37827))

(declare-fun m!146073 () Bool)

(assert (=> bs!5210 m!146073))

(assert (=> bs!5210 m!146073))

(declare-fun m!146075 () Bool)

(assert (=> bs!5210 m!146075))

(assert (=> b!125131 d!37827))

(declare-fun b!125474 () Bool)

(declare-fun e!81966 () ListLongMap!1631)

(declare-fun e!81971 () ListLongMap!1631)

(assert (=> b!125474 (= e!81966 e!81971)))

(declare-fun c!22888 () Bool)

(assert (=> b!125474 (= c!22888 (validKeyInArray!0 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001))))))

(declare-fun lt!64672 () ListLongMap!1631)

(declare-fun b!125475 () Bool)

(declare-fun e!81970 () Bool)

(assert (=> b!125475 (= e!81970 (= lt!64672 (getCurrentListMapNoExtraKeys!130 (_keys!4492 (v!3108 (underlying!436 thiss!992))) (_values!2746 (v!3108 (underlying!436 thiss!992))) (mask!7009 (v!3108 (underlying!436 thiss!992))) (extraKeys!2548 (v!3108 (underlying!436 thiss!992))) (zeroValue!2628 (v!3108 (underlying!436 thiss!992))) (minValue!2628 (v!3108 (underlying!436 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))))))))

(declare-fun b!125476 () Bool)

(declare-fun e!81967 () Bool)

(assert (=> b!125476 (= e!81967 e!81970)))

(declare-fun c!22889 () Bool)

(assert (=> b!125476 (= c!22889 (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2473 (_keys!4492 (v!3108 (underlying!436 thiss!992))))))))

(declare-fun b!125477 () Bool)

(declare-fun lt!64673 () Unit!3871)

(declare-fun lt!64670 () Unit!3871)

(assert (=> b!125477 (= lt!64673 lt!64670)))

(declare-fun lt!64667 () ListLongMap!1631)

(declare-fun lt!64668 () (_ BitVec 64))

(declare-fun lt!64671 () V!3425)

(declare-fun lt!64669 () (_ BitVec 64))

(assert (=> b!125477 (not (contains!861 (+!163 lt!64667 (tuple2!2521 lt!64668 lt!64671)) lt!64669))))

(assert (=> b!125477 (= lt!64670 (addStillNotContains!57 lt!64667 lt!64668 lt!64671 lt!64669))))

(assert (=> b!125477 (= lt!64669 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!125477 (= lt!64671 (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!125477 (= lt!64668 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)))))

(declare-fun call!13414 () ListLongMap!1631)

(assert (=> b!125477 (= lt!64667 call!13414)))

(assert (=> b!125477 (= e!81971 (+!163 call!13414 (tuple2!2521 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!125478 () Bool)

(assert (=> b!125478 (= e!81966 (ListLongMap!1632 Nil!1673))))

(declare-fun b!125479 () Bool)

(declare-fun e!81965 () Bool)

(assert (=> b!125479 (= e!81965 (validKeyInArray!0 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001))))))

(assert (=> b!125479 (bvsge (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(declare-fun b!125480 () Bool)

(assert (=> b!125480 (= e!81971 call!13414)))

(declare-fun b!125481 () Bool)

(assert (=> b!125481 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2473 (_keys!4492 (v!3108 (underlying!436 thiss!992))))))))

(assert (=> b!125481 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2474 (_values!2746 (v!3108 (underlying!436 thiss!992))))))))

(declare-fun e!81968 () Bool)

(assert (=> b!125481 (= e!81968 (= (apply!110 lt!64672 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001))) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!125483 () Bool)

(assert (=> b!125483 (= e!81967 e!81968)))

(assert (=> b!125483 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2473 (_keys!4492 (v!3108 (underlying!436 thiss!992))))))))

(declare-fun res!60736 () Bool)

(assert (=> b!125483 (= res!60736 (contains!861 lt!64672 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001))))))

(assert (=> b!125483 (=> (not res!60736) (not e!81968))))

(declare-fun b!125484 () Bool)

(declare-fun e!81969 () Bool)

(assert (=> b!125484 (= e!81969 e!81967)))

(declare-fun c!22887 () Bool)

(assert (=> b!125484 (= c!22887 e!81965)))

(declare-fun res!60734 () Bool)

(assert (=> b!125484 (=> (not res!60734) (not e!81965))))

(assert (=> b!125484 (= res!60734 (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2473 (_keys!4492 (v!3108 (underlying!436 thiss!992))))))))

(declare-fun bm!13411 () Bool)

(assert (=> bm!13411 (= call!13414 (getCurrentListMapNoExtraKeys!130 (_keys!4492 (v!3108 (underlying!436 thiss!992))) (_values!2746 (v!3108 (underlying!436 thiss!992))) (mask!7009 (v!3108 (underlying!436 thiss!992))) (extraKeys!2548 (v!3108 (underlying!436 thiss!992))) (zeroValue!2628 (v!3108 (underlying!436 thiss!992))) (minValue!2628 (v!3108 (underlying!436 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (defaultEntry!2763 (v!3108 (underlying!436 thiss!992)))))))

(declare-fun b!125485 () Bool)

(declare-fun res!60735 () Bool)

(assert (=> b!125485 (=> (not res!60735) (not e!81969))))

(assert (=> b!125485 (= res!60735 (not (contains!861 lt!64672 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!37829 () Bool)

(assert (=> d!37829 e!81969))

(declare-fun res!60737 () Bool)

(assert (=> d!37829 (=> (not res!60737) (not e!81969))))

(assert (=> d!37829 (= res!60737 (not (contains!861 lt!64672 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!37829 (= lt!64672 e!81966)))

(declare-fun c!22890 () Bool)

(assert (=> d!37829 (= c!22890 (bvsge (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2473 (_keys!4492 (v!3108 (underlying!436 thiss!992))))))))

(assert (=> d!37829 (validMask!0 (mask!7009 (v!3108 (underlying!436 thiss!992))))))

(assert (=> d!37829 (= (getCurrentListMapNoExtraKeys!130 (_keys!4492 (v!3108 (underlying!436 thiss!992))) (_values!2746 (v!3108 (underlying!436 thiss!992))) (mask!7009 (v!3108 (underlying!436 thiss!992))) (extraKeys!2548 (v!3108 (underlying!436 thiss!992))) (zeroValue!2628 (v!3108 (underlying!436 thiss!992))) (minValue!2628 (v!3108 (underlying!436 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!2763 (v!3108 (underlying!436 thiss!992)))) lt!64672)))

(declare-fun b!125482 () Bool)

(assert (=> b!125482 (= e!81970 (isEmpty!400 lt!64672))))

(assert (= (and d!37829 c!22890) b!125478))

(assert (= (and d!37829 (not c!22890)) b!125474))

(assert (= (and b!125474 c!22888) b!125477))

(assert (= (and b!125474 (not c!22888)) b!125480))

(assert (= (or b!125477 b!125480) bm!13411))

(assert (= (and d!37829 res!60737) b!125485))

(assert (= (and b!125485 res!60735) b!125484))

(assert (= (and b!125484 res!60734) b!125479))

(assert (= (and b!125484 c!22887) b!125483))

(assert (= (and b!125484 (not c!22887)) b!125476))

(assert (= (and b!125483 res!60736) b!125481))

(assert (= (and b!125476 c!22889) b!125475))

(assert (= (and b!125476 (not c!22889)) b!125482))

(declare-fun b_lambda!5515 () Bool)

(assert (=> (not b_lambda!5515) (not b!125477)))

(assert (=> b!125477 t!5992))

(declare-fun b_and!7713 () Bool)

(assert (= b_and!7709 (and (=> t!5992 result!3795) b_and!7713)))

(assert (=> b!125477 t!5994))

(declare-fun b_and!7715 () Bool)

(assert (= b_and!7711 (and (=> t!5994 result!3799) b_and!7715)))

(declare-fun b_lambda!5517 () Bool)

(assert (=> (not b_lambda!5517) (not b!125481)))

(assert (=> b!125481 t!5992))

(declare-fun b_and!7717 () Bool)

(assert (= b_and!7713 (and (=> t!5992 result!3795) b_and!7717)))

(assert (=> b!125481 t!5994))

(declare-fun b_and!7719 () Bool)

(assert (= b_and!7715 (and (=> t!5994 result!3799) b_and!7719)))

(declare-fun m!146077 () Bool)

(assert (=> b!125475 m!146077))

(declare-fun m!146079 () Bool)

(assert (=> b!125483 m!146079))

(assert (=> b!125483 m!146079))

(declare-fun m!146081 () Bool)

(assert (=> b!125483 m!146081))

(declare-fun m!146083 () Bool)

(assert (=> b!125485 m!146083))

(declare-fun m!146085 () Bool)

(assert (=> b!125482 m!146085))

(assert (=> bm!13411 m!146077))

(assert (=> b!125481 m!144793))

(declare-fun m!146087 () Bool)

(assert (=> b!125481 m!146087))

(assert (=> b!125481 m!144793))

(declare-fun m!146089 () Bool)

(assert (=> b!125481 m!146089))

(assert (=> b!125481 m!146087))

(assert (=> b!125481 m!146079))

(assert (=> b!125481 m!146079))

(declare-fun m!146091 () Bool)

(assert (=> b!125481 m!146091))

(declare-fun m!146093 () Bool)

(assert (=> d!37829 m!146093))

(assert (=> d!37829 m!144811))

(assert (=> b!125479 m!146079))

(assert (=> b!125479 m!146079))

(declare-fun m!146095 () Bool)

(assert (=> b!125479 m!146095))

(declare-fun m!146097 () Bool)

(assert (=> b!125477 m!146097))

(declare-fun m!146099 () Bool)

(assert (=> b!125477 m!146099))

(declare-fun m!146101 () Bool)

(assert (=> b!125477 m!146101))

(assert (=> b!125477 m!144793))

(assert (=> b!125477 m!146079))

(declare-fun m!146103 () Bool)

(assert (=> b!125477 m!146103))

(assert (=> b!125477 m!146087))

(assert (=> b!125477 m!144793))

(assert (=> b!125477 m!146089))

(assert (=> b!125477 m!146087))

(assert (=> b!125477 m!146097))

(assert (=> b!125474 m!146079))

(assert (=> b!125474 m!146079))

(assert (=> b!125474 m!146095))

(assert (=> b!125001 d!37829))

(declare-fun d!37831 () Bool)

(assert (=> d!37831 (isDefined!119 (getValueByKey!167 (toList!831 (getCurrentListMap!511 (_keys!4492 newMap!16) (_values!2746 newMap!16) (mask!7009 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16))) (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355)))))

(declare-fun lt!64674 () Unit!3871)

(assert (=> d!37831 (= lt!64674 (choose!762 (toList!831 (getCurrentListMap!511 (_keys!4492 newMap!16) (_values!2746 newMap!16) (mask!7009 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16))) (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355)))))

(declare-fun e!81972 () Bool)

(assert (=> d!37831 e!81972))

(declare-fun res!60738 () Bool)

(assert (=> d!37831 (=> (not res!60738) (not e!81972))))

(assert (=> d!37831 (= res!60738 (isStrictlySorted!303 (toList!831 (getCurrentListMap!511 (_keys!4492 newMap!16) (_values!2746 newMap!16) (mask!7009 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16)))))))

(assert (=> d!37831 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!118 (toList!831 (getCurrentListMap!511 (_keys!4492 newMap!16) (_values!2746 newMap!16) (mask!7009 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16))) (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355)) lt!64674)))

(declare-fun b!125486 () Bool)

(assert (=> b!125486 (= e!81972 (containsKey!170 (toList!831 (getCurrentListMap!511 (_keys!4492 newMap!16) (_values!2746 newMap!16) (mask!7009 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16))) (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355)))))

(assert (= (and d!37831 res!60738) b!125486))

(assert (=> d!37831 m!144797))

(assert (=> d!37831 m!145531))

(assert (=> d!37831 m!145531))

(assert (=> d!37831 m!145533))

(assert (=> d!37831 m!144797))

(declare-fun m!146105 () Bool)

(assert (=> d!37831 m!146105))

(declare-fun m!146107 () Bool)

(assert (=> d!37831 m!146107))

(assert (=> b!125486 m!144797))

(assert (=> b!125486 m!145527))

(assert (=> b!125201 d!37831))

(declare-fun d!37833 () Bool)

(assert (=> d!37833 (= (isDefined!119 (getValueByKey!167 (toList!831 (getCurrentListMap!511 (_keys!4492 newMap!16) (_values!2746 newMap!16) (mask!7009 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16))) (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355))) (not (isEmpty!399 (getValueByKey!167 (toList!831 (getCurrentListMap!511 (_keys!4492 newMap!16) (_values!2746 newMap!16) (mask!7009 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16))) (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355)))))))

(declare-fun bs!5211 () Bool)

(assert (= bs!5211 d!37833))

(assert (=> bs!5211 m!145531))

(declare-fun m!146109 () Bool)

(assert (=> bs!5211 m!146109))

(assert (=> b!125201 d!37833))

(declare-fun b!125488 () Bool)

(declare-fun e!81973 () Option!173)

(declare-fun e!81974 () Option!173)

(assert (=> b!125488 (= e!81973 e!81974)))

(declare-fun c!22892 () Bool)

(assert (=> b!125488 (= c!22892 (and ((_ is Cons!1672) (toList!831 (getCurrentListMap!511 (_keys!4492 newMap!16) (_values!2746 newMap!16) (mask!7009 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16)))) (not (= (_1!1271 (h!2273 (toList!831 (getCurrentListMap!511 (_keys!4492 newMap!16) (_values!2746 newMap!16) (mask!7009 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16))))) (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355)))))))

(declare-fun b!125489 () Bool)

(assert (=> b!125489 (= e!81974 (getValueByKey!167 (t!5995 (toList!831 (getCurrentListMap!511 (_keys!4492 newMap!16) (_values!2746 newMap!16) (mask!7009 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16)))) (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355)))))

(declare-fun c!22891 () Bool)

(declare-fun d!37835 () Bool)

(assert (=> d!37835 (= c!22891 (and ((_ is Cons!1672) (toList!831 (getCurrentListMap!511 (_keys!4492 newMap!16) (_values!2746 newMap!16) (mask!7009 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16)))) (= (_1!1271 (h!2273 (toList!831 (getCurrentListMap!511 (_keys!4492 newMap!16) (_values!2746 newMap!16) (mask!7009 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16))))) (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355))))))

(assert (=> d!37835 (= (getValueByKey!167 (toList!831 (getCurrentListMap!511 (_keys!4492 newMap!16) (_values!2746 newMap!16) (mask!7009 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16))) (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355)) e!81973)))

(declare-fun b!125490 () Bool)

(assert (=> b!125490 (= e!81974 None!171)))

(declare-fun b!125487 () Bool)

(assert (=> b!125487 (= e!81973 (Some!172 (_2!1271 (h!2273 (toList!831 (getCurrentListMap!511 (_keys!4492 newMap!16) (_values!2746 newMap!16) (mask!7009 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16)))))))))

(assert (= (and d!37835 c!22891) b!125487))

(assert (= (and d!37835 (not c!22891)) b!125488))

(assert (= (and b!125488 c!22892) b!125489))

(assert (= (and b!125488 (not c!22892)) b!125490))

(assert (=> b!125489 m!144797))

(declare-fun m!146111 () Bool)

(assert (=> b!125489 m!146111))

(assert (=> b!125201 d!37835))

(assert (=> b!124960 d!37661))

(assert (=> d!37629 d!37519))

(assert (=> d!37629 d!37521))

(declare-fun d!37837 () Bool)

(assert (=> d!37837 (isDefined!119 (getValueByKey!167 (toList!831 lt!64044) (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355)))))

(assert (=> d!37837 true))

(declare-fun _$12!387 () Unit!3871)

(assert (=> d!37837 (= (choose!762 (toList!831 lt!64044) (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355)) _$12!387)))

(declare-fun bs!5212 () Bool)

(assert (= bs!5212 d!37837))

(assert (=> bs!5212 m!144797))

(assert (=> bs!5212 m!144963))

(assert (=> bs!5212 m!144963))

(assert (=> bs!5212 m!144965))

(assert (=> d!37629 d!37837))

(declare-fun d!37839 () Bool)

(declare-fun res!60743 () Bool)

(declare-fun e!81979 () Bool)

(assert (=> d!37839 (=> res!60743 e!81979)))

(assert (=> d!37839 (= res!60743 (or ((_ is Nil!1673) (toList!831 lt!64044)) ((_ is Nil!1673) (t!5995 (toList!831 lt!64044)))))))

(assert (=> d!37839 (= (isStrictlySorted!303 (toList!831 lt!64044)) e!81979)))

(declare-fun b!125495 () Bool)

(declare-fun e!81980 () Bool)

(assert (=> b!125495 (= e!81979 e!81980)))

(declare-fun res!60744 () Bool)

(assert (=> b!125495 (=> (not res!60744) (not e!81980))))

(assert (=> b!125495 (= res!60744 (bvslt (_1!1271 (h!2273 (toList!831 lt!64044))) (_1!1271 (h!2273 (t!5995 (toList!831 lt!64044))))))))

(declare-fun b!125496 () Bool)

(assert (=> b!125496 (= e!81980 (isStrictlySorted!303 (t!5995 (toList!831 lt!64044))))))

(assert (= (and d!37839 (not res!60743)) b!125495))

(assert (= (and b!125495 res!60744) b!125496))

(declare-fun m!146113 () Bool)

(assert (=> b!125496 m!146113))

(assert (=> d!37629 d!37839))

(declare-fun d!37841 () Bool)

(declare-fun res!60745 () Bool)

(declare-fun e!81981 () Bool)

(assert (=> d!37841 (=> res!60745 e!81981)))

(assert (=> d!37841 (= res!60745 (and ((_ is Cons!1672) (toList!831 call!13342)) (= (_1!1271 (h!2273 (toList!831 call!13342))) (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355))))))

(assert (=> d!37841 (= (containsKey!170 (toList!831 call!13342) (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355)) e!81981)))

(declare-fun b!125497 () Bool)

(declare-fun e!81982 () Bool)

(assert (=> b!125497 (= e!81981 e!81982)))

(declare-fun res!60746 () Bool)

(assert (=> b!125497 (=> (not res!60746) (not e!81982))))

(assert (=> b!125497 (= res!60746 (and (or (not ((_ is Cons!1672) (toList!831 call!13342))) (bvsle (_1!1271 (h!2273 (toList!831 call!13342))) (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355))) ((_ is Cons!1672) (toList!831 call!13342)) (bvslt (_1!1271 (h!2273 (toList!831 call!13342))) (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355))))))

(declare-fun b!125498 () Bool)

(assert (=> b!125498 (= e!81982 (containsKey!170 (t!5995 (toList!831 call!13342)) (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355)))))

(assert (= (and d!37841 (not res!60745)) b!125497))

(assert (= (and b!125497 res!60746) b!125498))

(assert (=> b!125498 m!144797))

(declare-fun m!146115 () Bool)

(assert (=> b!125498 m!146115))

(assert (=> d!37627 d!37841))

(declare-fun b!125499 () Bool)

(declare-fun e!81984 () ListLongMap!1631)

(declare-fun e!81989 () ListLongMap!1631)

(assert (=> b!125499 (= e!81984 e!81989)))

(declare-fun c!22894 () Bool)

(assert (=> b!125499 (= c!22894 (validKeyInArray!0 (select (arr!2210 (_keys!4492 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!125500 () Bool)

(declare-fun lt!64680 () ListLongMap!1631)

(declare-fun e!81988 () Bool)

(assert (=> b!125500 (= e!81988 (= lt!64680 (getCurrentListMapNoExtraKeys!130 (_keys!4492 newMap!16) (ite (or c!22717 c!22712) (_values!2746 newMap!16) lt!64198) (mask!7009 newMap!16) (ite c!22717 (ite c!22710 lt!64209 lt!64205) (extraKeys!2548 newMap!16)) (ite (and c!22717 c!22710) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2628 newMap!16)) (ite c!22717 (ite c!22710 (minValue!2628 newMap!16) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2628 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!2763 newMap!16))))))

(declare-fun b!125501 () Bool)

(declare-fun e!81985 () Bool)

(assert (=> b!125501 (= e!81985 e!81988)))

(declare-fun c!22895 () Bool)

(assert (=> b!125501 (= c!22895 (bvslt #b00000000000000000000000000000000 (size!2473 (_keys!4492 newMap!16))))))

(declare-fun b!125502 () Bool)

(declare-fun lt!64681 () Unit!3871)

(declare-fun lt!64678 () Unit!3871)

(assert (=> b!125502 (= lt!64681 lt!64678)))

(declare-fun lt!64675 () ListLongMap!1631)

(declare-fun lt!64677 () (_ BitVec 64))

(declare-fun lt!64676 () (_ BitVec 64))

(declare-fun lt!64679 () V!3425)

(assert (=> b!125502 (not (contains!861 (+!163 lt!64675 (tuple2!2521 lt!64676 lt!64679)) lt!64677))))

(assert (=> b!125502 (= lt!64678 (addStillNotContains!57 lt!64675 lt!64676 lt!64679 lt!64677))))

(assert (=> b!125502 (= lt!64677 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!125502 (= lt!64679 (get!1446 (select (arr!2211 (ite (or c!22717 c!22712) (_values!2746 newMap!16) lt!64198)) #b00000000000000000000000000000000) (dynLambda!415 (defaultEntry!2763 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!125502 (= lt!64676 (select (arr!2210 (_keys!4492 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun call!13415 () ListLongMap!1631)

(assert (=> b!125502 (= lt!64675 call!13415)))

(assert (=> b!125502 (= e!81989 (+!163 call!13415 (tuple2!2521 (select (arr!2210 (_keys!4492 newMap!16)) #b00000000000000000000000000000000) (get!1446 (select (arr!2211 (ite (or c!22717 c!22712) (_values!2746 newMap!16) lt!64198)) #b00000000000000000000000000000000) (dynLambda!415 (defaultEntry!2763 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!125503 () Bool)

(assert (=> b!125503 (= e!81984 (ListLongMap!1632 Nil!1673))))

(declare-fun b!125504 () Bool)

(declare-fun e!81983 () Bool)

(assert (=> b!125504 (= e!81983 (validKeyInArray!0 (select (arr!2210 (_keys!4492 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!125504 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!125505 () Bool)

(assert (=> b!125505 (= e!81989 call!13415)))

(declare-fun b!125506 () Bool)

(assert (=> b!125506 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2473 (_keys!4492 newMap!16))))))

(assert (=> b!125506 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2474 (ite (or c!22717 c!22712) (_values!2746 newMap!16) lt!64198))))))

(declare-fun e!81986 () Bool)

(assert (=> b!125506 (= e!81986 (= (apply!110 lt!64680 (select (arr!2210 (_keys!4492 newMap!16)) #b00000000000000000000000000000000)) (get!1446 (select (arr!2211 (ite (or c!22717 c!22712) (_values!2746 newMap!16) lt!64198)) #b00000000000000000000000000000000) (dynLambda!415 (defaultEntry!2763 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!125508 () Bool)

(assert (=> b!125508 (= e!81985 e!81986)))

(assert (=> b!125508 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2473 (_keys!4492 newMap!16))))))

(declare-fun res!60749 () Bool)

(assert (=> b!125508 (= res!60749 (contains!861 lt!64680 (select (arr!2210 (_keys!4492 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!125508 (=> (not res!60749) (not e!81986))))

(declare-fun b!125509 () Bool)

(declare-fun e!81987 () Bool)

(assert (=> b!125509 (= e!81987 e!81985)))

(declare-fun c!22893 () Bool)

(assert (=> b!125509 (= c!22893 e!81983)))

(declare-fun res!60747 () Bool)

(assert (=> b!125509 (=> (not res!60747) (not e!81983))))

(assert (=> b!125509 (= res!60747 (bvslt #b00000000000000000000000000000000 (size!2473 (_keys!4492 newMap!16))))))

(declare-fun bm!13412 () Bool)

(assert (=> bm!13412 (= call!13415 (getCurrentListMapNoExtraKeys!130 (_keys!4492 newMap!16) (ite (or c!22717 c!22712) (_values!2746 newMap!16) lt!64198) (mask!7009 newMap!16) (ite c!22717 (ite c!22710 lt!64209 lt!64205) (extraKeys!2548 newMap!16)) (ite (and c!22717 c!22710) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2628 newMap!16)) (ite c!22717 (ite c!22710 (minValue!2628 newMap!16) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2628 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!2763 newMap!16)))))

(declare-fun b!125510 () Bool)

(declare-fun res!60748 () Bool)

(assert (=> b!125510 (=> (not res!60748) (not e!81987))))

(assert (=> b!125510 (= res!60748 (not (contains!861 lt!64680 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!37843 () Bool)

(assert (=> d!37843 e!81987))

(declare-fun res!60750 () Bool)

(assert (=> d!37843 (=> (not res!60750) (not e!81987))))

(assert (=> d!37843 (= res!60750 (not (contains!861 lt!64680 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!37843 (= lt!64680 e!81984)))

(declare-fun c!22896 () Bool)

(assert (=> d!37843 (= c!22896 (bvsge #b00000000000000000000000000000000 (size!2473 (_keys!4492 newMap!16))))))

(assert (=> d!37843 (validMask!0 (mask!7009 newMap!16))))

(assert (=> d!37843 (= (getCurrentListMapNoExtraKeys!130 (_keys!4492 newMap!16) (ite (or c!22717 c!22712) (_values!2746 newMap!16) lt!64198) (mask!7009 newMap!16) (ite c!22717 (ite c!22710 lt!64209 lt!64205) (extraKeys!2548 newMap!16)) (ite (and c!22717 c!22710) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2628 newMap!16)) (ite c!22717 (ite c!22710 (minValue!2628 newMap!16) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2628 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16)) lt!64680)))

(declare-fun b!125507 () Bool)

(assert (=> b!125507 (= e!81988 (isEmpty!400 lt!64680))))

(assert (= (and d!37843 c!22896) b!125503))

(assert (= (and d!37843 (not c!22896)) b!125499))

(assert (= (and b!125499 c!22894) b!125502))

(assert (= (and b!125499 (not c!22894)) b!125505))

(assert (= (or b!125502 b!125505) bm!13412))

(assert (= (and d!37843 res!60750) b!125510))

(assert (= (and b!125510 res!60748) b!125509))

(assert (= (and b!125509 res!60747) b!125504))

(assert (= (and b!125509 c!22893) b!125508))

(assert (= (and b!125509 (not c!22893)) b!125501))

(assert (= (and b!125508 res!60749) b!125506))

(assert (= (and b!125501 c!22895) b!125500))

(assert (= (and b!125501 (not c!22895)) b!125507))

(declare-fun b_lambda!5519 () Bool)

(assert (=> (not b_lambda!5519) (not b!125502)))

(assert (=> b!125502 t!6006))

(declare-fun b_and!7721 () Bool)

(assert (= b_and!7717 (and (=> t!6006 result!3815) b_and!7721)))

(assert (=> b!125502 t!6008))

(declare-fun b_and!7723 () Bool)

(assert (= b_and!7719 (and (=> t!6008 result!3817) b_and!7723)))

(declare-fun b_lambda!5521 () Bool)

(assert (=> (not b_lambda!5521) (not b!125506)))

(assert (=> b!125506 t!6006))

(declare-fun b_and!7725 () Bool)

(assert (= b_and!7721 (and (=> t!6006 result!3815) b_and!7725)))

(assert (=> b!125506 t!6008))

(declare-fun b_and!7727 () Bool)

(assert (= b_and!7723 (and (=> t!6008 result!3817) b_and!7727)))

(declare-fun m!146117 () Bool)

(assert (=> b!125500 m!146117))

(assert (=> b!125508 m!145113))

(assert (=> b!125508 m!145113))

(declare-fun m!146119 () Bool)

(assert (=> b!125508 m!146119))

(declare-fun m!146121 () Bool)

(assert (=> b!125510 m!146121))

(declare-fun m!146123 () Bool)

(assert (=> b!125507 m!146123))

(assert (=> bm!13412 m!146117))

(assert (=> b!125506 m!145277))

(assert (=> b!125506 m!145409))

(assert (=> b!125506 m!145277))

(assert (=> b!125506 m!145411))

(assert (=> b!125506 m!145409))

(assert (=> b!125506 m!145113))

(assert (=> b!125506 m!145113))

(declare-fun m!146125 () Bool)

(assert (=> b!125506 m!146125))

(declare-fun m!146127 () Bool)

(assert (=> d!37843 m!146127))

(assert (=> d!37843 m!145065))

(assert (=> b!125504 m!145113))

(assert (=> b!125504 m!145113))

(assert (=> b!125504 m!145115))

(declare-fun m!146129 () Bool)

(assert (=> b!125502 m!146129))

(declare-fun m!146131 () Bool)

(assert (=> b!125502 m!146131))

(declare-fun m!146133 () Bool)

(assert (=> b!125502 m!146133))

(assert (=> b!125502 m!145277))

(assert (=> b!125502 m!145113))

(declare-fun m!146135 () Bool)

(assert (=> b!125502 m!146135))

(assert (=> b!125502 m!145409))

(assert (=> b!125502 m!145277))

(assert (=> b!125502 m!145411))

(assert (=> b!125502 m!145409))

(assert (=> b!125502 m!146129))

(assert (=> b!125499 m!145113))

(assert (=> b!125499 m!145113))

(assert (=> b!125499 m!145115))

(assert (=> bm!13381 d!37843))

(declare-fun d!37845 () Bool)

(declare-fun e!81990 () Bool)

(assert (=> d!37845 e!81990))

(declare-fun res!60751 () Bool)

(assert (=> d!37845 (=> (not res!60751) (not e!81990))))

(declare-fun lt!64683 () ListLongMap!1631)

(assert (=> d!37845 (= res!60751 (contains!861 lt!64683 (_1!1271 (ite (or c!22781 c!22783) (tuple2!2521 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2628 newMap!16)) (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 newMap!16))))))))

(declare-fun lt!64684 () List!1676)

(assert (=> d!37845 (= lt!64683 (ListLongMap!1632 lt!64684))))

(declare-fun lt!64685 () Unit!3871)

(declare-fun lt!64682 () Unit!3871)

(assert (=> d!37845 (= lt!64685 lt!64682)))

(assert (=> d!37845 (= (getValueByKey!167 lt!64684 (_1!1271 (ite (or c!22781 c!22783) (tuple2!2521 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2628 newMap!16)) (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 newMap!16))))) (Some!172 (_2!1271 (ite (or c!22781 c!22783) (tuple2!2521 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2628 newMap!16)) (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 newMap!16))))))))

(assert (=> d!37845 (= lt!64682 (lemmaContainsTupThenGetReturnValue!82 lt!64684 (_1!1271 (ite (or c!22781 c!22783) (tuple2!2521 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2628 newMap!16)) (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 newMap!16)))) (_2!1271 (ite (or c!22781 c!22783) (tuple2!2521 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2628 newMap!16)) (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 newMap!16))))))))

(assert (=> d!37845 (= lt!64684 (insertStrictlySorted!85 (toList!831 (ite c!22781 call!13377 (ite c!22783 call!13378 call!13374))) (_1!1271 (ite (or c!22781 c!22783) (tuple2!2521 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2628 newMap!16)) (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 newMap!16)))) (_2!1271 (ite (or c!22781 c!22783) (tuple2!2521 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2628 newMap!16)) (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 newMap!16))))))))

(assert (=> d!37845 (= (+!163 (ite c!22781 call!13377 (ite c!22783 call!13378 call!13374)) (ite (or c!22781 c!22783) (tuple2!2521 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2628 newMap!16)) (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 newMap!16)))) lt!64683)))

(declare-fun b!125511 () Bool)

(declare-fun res!60752 () Bool)

(assert (=> b!125511 (=> (not res!60752) (not e!81990))))

(assert (=> b!125511 (= res!60752 (= (getValueByKey!167 (toList!831 lt!64683) (_1!1271 (ite (or c!22781 c!22783) (tuple2!2521 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2628 newMap!16)) (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 newMap!16))))) (Some!172 (_2!1271 (ite (or c!22781 c!22783) (tuple2!2521 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2628 newMap!16)) (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 newMap!16)))))))))

(declare-fun b!125512 () Bool)

(assert (=> b!125512 (= e!81990 (contains!862 (toList!831 lt!64683) (ite (or c!22781 c!22783) (tuple2!2521 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2628 newMap!16)) (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 newMap!16)))))))

(assert (= (and d!37845 res!60751) b!125511))

(assert (= (and b!125511 res!60752) b!125512))

(declare-fun m!146137 () Bool)

(assert (=> d!37845 m!146137))

(declare-fun m!146139 () Bool)

(assert (=> d!37845 m!146139))

(declare-fun m!146141 () Bool)

(assert (=> d!37845 m!146141))

(declare-fun m!146143 () Bool)

(assert (=> d!37845 m!146143))

(declare-fun m!146145 () Bool)

(assert (=> b!125511 m!146145))

(declare-fun m!146147 () Bool)

(assert (=> b!125512 m!146147))

(assert (=> bm!13369 d!37845))

(assert (=> b!125005 d!37597))

(declare-fun d!37847 () Bool)

(assert (=> d!37847 (= (isDefined!119 (getValueByKey!167 (toList!831 (+!163 lt!64122 (tuple2!2521 lt!64114 (zeroValue!2628 (v!3108 (underlying!436 thiss!992)))))) lt!64109)) (not (isEmpty!399 (getValueByKey!167 (toList!831 (+!163 lt!64122 (tuple2!2521 lt!64114 (zeroValue!2628 (v!3108 (underlying!436 thiss!992)))))) lt!64109))))))

(declare-fun bs!5213 () Bool)

(assert (= bs!5213 d!37847))

(assert (=> bs!5213 m!145217))

(declare-fun m!146149 () Bool)

(assert (=> bs!5213 m!146149))

(assert (=> b!125025 d!37847))

(declare-fun b!125514 () Bool)

(declare-fun e!81991 () Option!173)

(declare-fun e!81992 () Option!173)

(assert (=> b!125514 (= e!81991 e!81992)))

(declare-fun c!22898 () Bool)

(assert (=> b!125514 (= c!22898 (and ((_ is Cons!1672) (toList!831 (+!163 lt!64122 (tuple2!2521 lt!64114 (zeroValue!2628 (v!3108 (underlying!436 thiss!992))))))) (not (= (_1!1271 (h!2273 (toList!831 (+!163 lt!64122 (tuple2!2521 lt!64114 (zeroValue!2628 (v!3108 (underlying!436 thiss!992)))))))) lt!64109))))))

(declare-fun b!125515 () Bool)

(assert (=> b!125515 (= e!81992 (getValueByKey!167 (t!5995 (toList!831 (+!163 lt!64122 (tuple2!2521 lt!64114 (zeroValue!2628 (v!3108 (underlying!436 thiss!992))))))) lt!64109))))

(declare-fun c!22897 () Bool)

(declare-fun d!37849 () Bool)

(assert (=> d!37849 (= c!22897 (and ((_ is Cons!1672) (toList!831 (+!163 lt!64122 (tuple2!2521 lt!64114 (zeroValue!2628 (v!3108 (underlying!436 thiss!992))))))) (= (_1!1271 (h!2273 (toList!831 (+!163 lt!64122 (tuple2!2521 lt!64114 (zeroValue!2628 (v!3108 (underlying!436 thiss!992)))))))) lt!64109)))))

(assert (=> d!37849 (= (getValueByKey!167 (toList!831 (+!163 lt!64122 (tuple2!2521 lt!64114 (zeroValue!2628 (v!3108 (underlying!436 thiss!992)))))) lt!64109) e!81991)))

(declare-fun b!125516 () Bool)

(assert (=> b!125516 (= e!81992 None!171)))

(declare-fun b!125513 () Bool)

(assert (=> b!125513 (= e!81991 (Some!172 (_2!1271 (h!2273 (toList!831 (+!163 lt!64122 (tuple2!2521 lt!64114 (zeroValue!2628 (v!3108 (underlying!436 thiss!992))))))))))))

(assert (= (and d!37849 c!22897) b!125513))

(assert (= (and d!37849 (not c!22897)) b!125514))

(assert (= (and b!125514 c!22898) b!125515))

(assert (= (and b!125514 (not c!22898)) b!125516))

(declare-fun m!146151 () Bool)

(assert (=> b!125515 m!146151))

(assert (=> b!125025 d!37849))

(assert (=> b!125071 d!37633))

(declare-fun d!37851 () Bool)

(assert (=> d!37851 (contains!861 (getCurrentListMap!511 (_keys!4492 newMap!16) (_values!2746 newMap!16) (mask!7009 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16)) (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355))))

(declare-fun lt!64688 () Unit!3871)

(declare-fun choose!764 (array!4667 array!4669 (_ BitVec 32) (_ BitVec 32) V!3425 V!3425 (_ BitVec 64) (_ BitVec 32) Int) Unit!3871)

(assert (=> d!37851 (= lt!64688 (choose!764 (_keys!4492 newMap!16) (_values!2746 newMap!16) (mask!7009 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16)))))

(assert (=> d!37851 (validMask!0 (mask!7009 newMap!16))))

(assert (=> d!37851 (= (lemmaArrayContainsKeyThenInListMap!36 (_keys!4492 newMap!16) (_values!2746 newMap!16) (mask!7009 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16)) lt!64688)))

(declare-fun bs!5214 () Bool)

(assert (= bs!5214 d!37851))

(assert (=> bs!5214 m!144893))

(assert (=> bs!5214 m!144893))

(assert (=> bs!5214 m!144797))

(assert (=> bs!5214 m!144985))

(assert (=> bs!5214 m!144797))

(declare-fun m!146153 () Bool)

(assert (=> bs!5214 m!146153))

(assert (=> bs!5214 m!145065))

(assert (=> b!125186 d!37851))

(assert (=> b!125186 d!37615))

(assert (=> b!125186 d!37587))

(declare-fun d!37853 () Bool)

(declare-fun res!60753 () Bool)

(declare-fun e!81993 () Bool)

(assert (=> d!37853 (=> res!60753 e!81993)))

(assert (=> d!37853 (= res!60753 (and ((_ is Cons!1672) (toList!831 lt!64108)) (= (_1!1271 (h!2273 (toList!831 lt!64108))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!37853 (= (containsKey!170 (toList!831 lt!64108) #b0000000000000000000000000000000000000000000000000000000000000000) e!81993)))

(declare-fun b!125517 () Bool)

(declare-fun e!81994 () Bool)

(assert (=> b!125517 (= e!81993 e!81994)))

(declare-fun res!60754 () Bool)

(assert (=> b!125517 (=> (not res!60754) (not e!81994))))

(assert (=> b!125517 (= res!60754 (and (or (not ((_ is Cons!1672) (toList!831 lt!64108))) (bvsle (_1!1271 (h!2273 (toList!831 lt!64108))) #b0000000000000000000000000000000000000000000000000000000000000000)) ((_ is Cons!1672) (toList!831 lt!64108)) (bvslt (_1!1271 (h!2273 (toList!831 lt!64108))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!125518 () Bool)

(assert (=> b!125518 (= e!81994 (containsKey!170 (t!5995 (toList!831 lt!64108)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!37853 (not res!60753)) b!125517))

(assert (= (and b!125517 res!60754) b!125518))

(declare-fun m!146155 () Bool)

(assert (=> b!125518 m!146155))

(assert (=> d!37601 d!37853))

(declare-fun b!125520 () Bool)

(declare-fun e!81995 () Option!173)

(declare-fun e!81996 () Option!173)

(assert (=> b!125520 (= e!81995 e!81996)))

(declare-fun c!22900 () Bool)

(assert (=> b!125520 (= c!22900 (and ((_ is Cons!1672) (toList!831 lt!64244)) (not (= (_1!1271 (h!2273 (toList!831 lt!64244))) (_1!1271 (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 (v!3108 (underlying!436 thiss!992)))))))))))

(declare-fun b!125521 () Bool)

(assert (=> b!125521 (= e!81996 (getValueByKey!167 (t!5995 (toList!831 lt!64244)) (_1!1271 (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 (v!3108 (underlying!436 thiss!992)))))))))

(declare-fun d!37855 () Bool)

(declare-fun c!22899 () Bool)

(assert (=> d!37855 (= c!22899 (and ((_ is Cons!1672) (toList!831 lt!64244)) (= (_1!1271 (h!2273 (toList!831 lt!64244))) (_1!1271 (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 (v!3108 (underlying!436 thiss!992))))))))))

(assert (=> d!37855 (= (getValueByKey!167 (toList!831 lt!64244) (_1!1271 (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 (v!3108 (underlying!436 thiss!992)))))) e!81995)))

(declare-fun b!125522 () Bool)

(assert (=> b!125522 (= e!81996 None!171)))

(declare-fun b!125519 () Bool)

(assert (=> b!125519 (= e!81995 (Some!172 (_2!1271 (h!2273 (toList!831 lt!64244)))))))

(assert (= (and d!37855 c!22899) b!125519))

(assert (= (and d!37855 (not c!22899)) b!125520))

(assert (= (and b!125520 c!22900) b!125521))

(assert (= (and b!125520 (not c!22900)) b!125522))

(declare-fun m!146157 () Bool)

(assert (=> b!125521 m!146157))

(assert (=> b!124914 d!37855))

(declare-fun d!37857 () Bool)

(declare-fun e!81997 () Bool)

(assert (=> d!37857 e!81997))

(declare-fun res!60755 () Bool)

(assert (=> d!37857 (=> (not res!60755) (not e!81997))))

(declare-fun lt!64690 () ListLongMap!1631)

(assert (=> d!37857 (= res!60755 (contains!861 lt!64690 (_1!1271 (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!22717 (ite c!22710 (minValue!2628 newMap!16) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2628 newMap!16))))))))

(declare-fun lt!64691 () List!1676)

(assert (=> d!37857 (= lt!64690 (ListLongMap!1632 lt!64691))))

(declare-fun lt!64692 () Unit!3871)

(declare-fun lt!64689 () Unit!3871)

(assert (=> d!37857 (= lt!64692 lt!64689)))

(assert (=> d!37857 (= (getValueByKey!167 lt!64691 (_1!1271 (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!22717 (ite c!22710 (minValue!2628 newMap!16) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2628 newMap!16))))) (Some!172 (_2!1271 (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!22717 (ite c!22710 (minValue!2628 newMap!16) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2628 newMap!16))))))))

(assert (=> d!37857 (= lt!64689 (lemmaContainsTupThenGetReturnValue!82 lt!64691 (_1!1271 (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!22717 (ite c!22710 (minValue!2628 newMap!16) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2628 newMap!16)))) (_2!1271 (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!22717 (ite c!22710 (minValue!2628 newMap!16) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2628 newMap!16))))))))

(assert (=> d!37857 (= lt!64691 (insertStrictlySorted!85 (toList!831 call!13379) (_1!1271 (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!22717 (ite c!22710 (minValue!2628 newMap!16) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2628 newMap!16)))) (_2!1271 (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!22717 (ite c!22710 (minValue!2628 newMap!16) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2628 newMap!16))))))))

(assert (=> d!37857 (= (+!163 call!13379 (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!22717 (ite c!22710 (minValue!2628 newMap!16) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2628 newMap!16)))) lt!64690)))

(declare-fun b!125523 () Bool)

(declare-fun res!60756 () Bool)

(assert (=> b!125523 (=> (not res!60756) (not e!81997))))

(assert (=> b!125523 (= res!60756 (= (getValueByKey!167 (toList!831 lt!64690) (_1!1271 (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!22717 (ite c!22710 (minValue!2628 newMap!16) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2628 newMap!16))))) (Some!172 (_2!1271 (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!22717 (ite c!22710 (minValue!2628 newMap!16) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2628 newMap!16)))))))))

(declare-fun b!125524 () Bool)

(assert (=> b!125524 (= e!81997 (contains!862 (toList!831 lt!64690) (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!22717 (ite c!22710 (minValue!2628 newMap!16) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2628 newMap!16)))))))

(assert (= (and d!37857 res!60755) b!125523))

(assert (= (and b!125523 res!60756) b!125524))

(declare-fun m!146159 () Bool)

(assert (=> d!37857 m!146159))

(declare-fun m!146161 () Bool)

(assert (=> d!37857 m!146161))

(declare-fun m!146163 () Bool)

(assert (=> d!37857 m!146163))

(declare-fun m!146165 () Bool)

(assert (=> d!37857 m!146165))

(declare-fun m!146167 () Bool)

(assert (=> b!125523 m!146167))

(declare-fun m!146169 () Bool)

(assert (=> b!125524 m!146169))

(assert (=> b!125138 d!37857))

(declare-fun d!37859 () Bool)

(assert (=> d!37859 (= (apply!110 lt!64351 (select (arr!2210 (_keys!4492 newMap!16)) #b00000000000000000000000000000000)) (get!1449 (getValueByKey!167 (toList!831 lt!64351) (select (arr!2210 (_keys!4492 newMap!16)) #b00000000000000000000000000000000))))))

(declare-fun bs!5215 () Bool)

(assert (= bs!5215 d!37859))

(assert (=> bs!5215 m!145113))

(assert (=> bs!5215 m!146059))

(assert (=> bs!5215 m!146059))

(declare-fun m!146171 () Bool)

(assert (=> bs!5215 m!146171))

(assert (=> b!125086 d!37859))

(declare-fun d!37861 () Bool)

(declare-fun c!22901 () Bool)

(assert (=> d!37861 (= c!22901 ((_ is ValueCellFull!1073) (select (arr!2211 (_values!2746 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun e!81998 () V!3425)

(assert (=> d!37861 (= (get!1446 (select (arr!2211 (_values!2746 newMap!16)) #b00000000000000000000000000000000) (dynLambda!415 (defaultEntry!2763 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000)) e!81998)))

(declare-fun b!125525 () Bool)

(assert (=> b!125525 (= e!81998 (get!1447 (select (arr!2211 (_values!2746 newMap!16)) #b00000000000000000000000000000000) (dynLambda!415 (defaultEntry!2763 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!125526 () Bool)

(assert (=> b!125526 (= e!81998 (get!1448 (select (arr!2211 (_values!2746 newMap!16)) #b00000000000000000000000000000000) (dynLambda!415 (defaultEntry!2763 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!37861 c!22901) b!125525))

(assert (= (and d!37861 (not c!22901)) b!125526))

(assert (=> b!125525 m!145331))

(assert (=> b!125525 m!145277))

(declare-fun m!146173 () Bool)

(assert (=> b!125525 m!146173))

(assert (=> b!125526 m!145331))

(assert (=> b!125526 m!145277))

(declare-fun m!146175 () Bool)

(assert (=> b!125526 m!146175))

(assert (=> b!125086 d!37861))

(declare-fun d!37863 () Bool)

(declare-fun e!81999 () Bool)

(assert (=> d!37863 e!81999))

(declare-fun res!60757 () Bool)

(assert (=> d!37863 (=> res!60757 e!81999)))

(declare-fun lt!64693 () Bool)

(assert (=> d!37863 (= res!60757 (not lt!64693))))

(declare-fun lt!64696 () Bool)

(assert (=> d!37863 (= lt!64693 lt!64696)))

(declare-fun lt!64695 () Unit!3871)

(declare-fun e!82000 () Unit!3871)

(assert (=> d!37863 (= lt!64695 e!82000)))

(declare-fun c!22902 () Bool)

(assert (=> d!37863 (= c!22902 lt!64696)))

(assert (=> d!37863 (= lt!64696 (containsKey!170 (toList!831 lt!64289) (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> d!37863 (= (contains!861 lt!64289 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) lt!64693)))

(declare-fun b!125527 () Bool)

(declare-fun lt!64694 () Unit!3871)

(assert (=> b!125527 (= e!82000 lt!64694)))

(assert (=> b!125527 (= lt!64694 (lemmaContainsKeyImpliesGetValueByKeyDefined!118 (toList!831 lt!64289) (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!125527 (isDefined!119 (getValueByKey!167 (toList!831 lt!64289) (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!125528 () Bool)

(declare-fun Unit!3902 () Unit!3871)

(assert (=> b!125528 (= e!82000 Unit!3902)))

(declare-fun b!125529 () Bool)

(assert (=> b!125529 (= e!81999 (isDefined!119 (getValueByKey!167 (toList!831 lt!64289) (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(assert (= (and d!37863 c!22902) b!125527))

(assert (= (and d!37863 (not c!22902)) b!125528))

(assert (= (and d!37863 (not res!60757)) b!125529))

(assert (=> d!37863 m!144905))

(declare-fun m!146177 () Bool)

(assert (=> d!37863 m!146177))

(assert (=> b!125527 m!144905))

(declare-fun m!146179 () Bool)

(assert (=> b!125527 m!146179))

(assert (=> b!125527 m!144905))

(declare-fun m!146181 () Bool)

(assert (=> b!125527 m!146181))

(assert (=> b!125527 m!146181))

(declare-fun m!146183 () Bool)

(assert (=> b!125527 m!146183))

(assert (=> b!125529 m!144905))

(assert (=> b!125529 m!146181))

(assert (=> b!125529 m!146181))

(assert (=> b!125529 m!146183))

(assert (=> b!125009 d!37863))

(declare-fun d!37865 () Bool)

(assert (=> d!37865 (= (apply!110 lt!64329 #b0000000000000000000000000000000000000000000000000000000000000000) (get!1449 (getValueByKey!167 (toList!831 lt!64329) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!5216 () Bool)

(assert (= bs!5216 d!37865))

(declare-fun m!146185 () Bool)

(assert (=> bs!5216 m!146185))

(assert (=> bs!5216 m!146185))

(declare-fun m!146187 () Bool)

(assert (=> bs!5216 m!146187))

(assert (=> b!125074 d!37865))

(declare-fun d!37867 () Bool)

(assert (=> d!37867 (= (get!1449 (getValueByKey!167 (toList!831 lt!64108) (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))) (v!3114 (getValueByKey!167 (toList!831 lt!64108) (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(assert (=> d!37535 d!37867))

(assert (=> d!37535 d!37723))

(assert (=> b!125190 d!37581))

(declare-fun b!125530 () Bool)

(declare-fun e!82003 () Bool)

(declare-fun e!82001 () Bool)

(assert (=> b!125530 (= e!82003 e!82001)))

(declare-fun c!22903 () Bool)

(assert (=> b!125530 (= c!22903 (validKeyInArray!0 (select (arr!2210 (_keys!4492 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!125531 () Bool)

(declare-fun call!13416 () Bool)

(assert (=> b!125531 (= e!82001 call!13416)))

(declare-fun b!125532 () Bool)

(declare-fun e!82002 () Bool)

(assert (=> b!125532 (= e!82001 e!82002)))

(declare-fun lt!64699 () (_ BitVec 64))

(assert (=> b!125532 (= lt!64699 (select (arr!2210 (_keys!4492 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!64698 () Unit!3871)

(assert (=> b!125532 (= lt!64698 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!4492 newMap!16) lt!64699 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!125532 (arrayContainsKey!0 (_keys!4492 newMap!16) lt!64699 #b00000000000000000000000000000000)))

(declare-fun lt!64697 () Unit!3871)

(assert (=> b!125532 (= lt!64697 lt!64698)))

(declare-fun res!60759 () Bool)

(assert (=> b!125532 (= res!60759 (= (seekEntryOrOpen!0 (select (arr!2210 (_keys!4492 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (_keys!4492 newMap!16) (mask!7009 newMap!16)) (Found!263 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!125532 (=> (not res!60759) (not e!82002))))

(declare-fun bm!13413 () Bool)

(assert (=> bm!13413 (= call!13416 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (_keys!4492 newMap!16) (mask!7009 newMap!16)))))

(declare-fun b!125533 () Bool)

(assert (=> b!125533 (= e!82002 call!13416)))

(declare-fun d!37869 () Bool)

(declare-fun res!60758 () Bool)

(assert (=> d!37869 (=> res!60758 e!82003)))

(assert (=> d!37869 (= res!60758 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2473 (_keys!4492 newMap!16))))))

(assert (=> d!37869 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!4492 newMap!16) (mask!7009 newMap!16)) e!82003)))

(assert (= (and d!37869 (not res!60758)) b!125530))

(assert (= (and b!125530 c!22903) b!125532))

(assert (= (and b!125530 (not c!22903)) b!125531))

(assert (= (and b!125532 res!60759) b!125533))

(assert (= (or b!125533 b!125531) bm!13413))

(declare-fun m!146189 () Bool)

(assert (=> b!125530 m!146189))

(assert (=> b!125530 m!146189))

(declare-fun m!146191 () Bool)

(assert (=> b!125530 m!146191))

(assert (=> b!125532 m!146189))

(declare-fun m!146193 () Bool)

(assert (=> b!125532 m!146193))

(declare-fun m!146195 () Bool)

(assert (=> b!125532 m!146195))

(assert (=> b!125532 m!146189))

(declare-fun m!146197 () Bool)

(assert (=> b!125532 m!146197))

(declare-fun m!146199 () Bool)

(assert (=> bm!13413 m!146199))

(assert (=> bm!13352 d!37869))

(assert (=> d!37557 d!37549))

(assert (=> d!37557 d!37553))

(declare-fun d!37871 () Bool)

(declare-fun e!82004 () Bool)

(assert (=> d!37871 e!82004))

(declare-fun res!60760 () Bool)

(assert (=> d!37871 (=> res!60760 e!82004)))

(declare-fun lt!64700 () Bool)

(assert (=> d!37871 (= res!60760 (not lt!64700))))

(declare-fun lt!64703 () Bool)

(assert (=> d!37871 (= lt!64700 lt!64703)))

(declare-fun lt!64702 () Unit!3871)

(declare-fun e!82005 () Unit!3871)

(assert (=> d!37871 (= lt!64702 e!82005)))

(declare-fun c!22904 () Bool)

(assert (=> d!37871 (= c!22904 lt!64703)))

(assert (=> d!37871 (= lt!64703 (containsKey!170 (toList!831 lt!64110) lt!64128))))

(assert (=> d!37871 (= (contains!861 lt!64110 lt!64128) lt!64700)))

(declare-fun b!125534 () Bool)

(declare-fun lt!64701 () Unit!3871)

(assert (=> b!125534 (= e!82005 lt!64701)))

(assert (=> b!125534 (= lt!64701 (lemmaContainsKeyImpliesGetValueByKeyDefined!118 (toList!831 lt!64110) lt!64128))))

(assert (=> b!125534 (isDefined!119 (getValueByKey!167 (toList!831 lt!64110) lt!64128))))

(declare-fun b!125535 () Bool)

(declare-fun Unit!3903 () Unit!3871)

(assert (=> b!125535 (= e!82005 Unit!3903)))

(declare-fun b!125536 () Bool)

(assert (=> b!125536 (= e!82004 (isDefined!119 (getValueByKey!167 (toList!831 lt!64110) lt!64128)))))

(assert (= (and d!37871 c!22904) b!125534))

(assert (= (and d!37871 (not c!22904)) b!125535))

(assert (= (and d!37871 (not res!60760)) b!125536))

(declare-fun m!146201 () Bool)

(assert (=> d!37871 m!146201))

(declare-fun m!146203 () Bool)

(assert (=> b!125534 m!146203))

(assert (=> b!125534 m!145141))

(assert (=> b!125534 m!145141))

(declare-fun m!146205 () Bool)

(assert (=> b!125534 m!146205))

(assert (=> b!125536 m!145141))

(assert (=> b!125536 m!145141))

(assert (=> b!125536 m!146205))

(assert (=> d!37557 d!37871))

(assert (=> d!37557 d!37567))

(declare-fun d!37873 () Bool)

(assert (=> d!37873 (= (apply!110 (+!163 lt!64110 (tuple2!2521 lt!64117 (minValue!2628 (v!3108 (underlying!436 thiss!992))))) lt!64128) (apply!110 lt!64110 lt!64128))))

(assert (=> d!37873 true))

(declare-fun _$34!943 () Unit!3871)

(assert (=> d!37873 (= (choose!755 lt!64110 lt!64117 (minValue!2628 (v!3108 (underlying!436 thiss!992))) lt!64128) _$34!943)))

(declare-fun bs!5217 () Bool)

(assert (= bs!5217 d!37873))

(assert (=> bs!5217 m!144919))

(assert (=> bs!5217 m!144919))

(assert (=> bs!5217 m!144921))

(assert (=> bs!5217 m!144925))

(assert (=> d!37557 d!37873))

(declare-fun d!37875 () Bool)

(assert (=> d!37875 (= (apply!110 (+!163 lt!64389 (tuple2!2521 lt!64398 (ite c!22717 (ite c!22710 (minValue!2628 newMap!16) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2628 newMap!16)))) lt!64384) (get!1449 (getValueByKey!167 (toList!831 (+!163 lt!64389 (tuple2!2521 lt!64398 (ite c!22717 (ite c!22710 (minValue!2628 newMap!16) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2628 newMap!16))))) lt!64384)))))

(declare-fun bs!5218 () Bool)

(assert (= bs!5218 d!37875))

(declare-fun m!146207 () Bool)

(assert (=> bs!5218 m!146207))

(assert (=> bs!5218 m!146207))

(declare-fun m!146209 () Bool)

(assert (=> bs!5218 m!146209))

(assert (=> b!125124 d!37875))

(declare-fun d!37877 () Bool)

(assert (=> d!37877 (= (apply!110 lt!64391 lt!64394) (get!1449 (getValueByKey!167 (toList!831 lt!64391) lt!64394)))))

(declare-fun bs!5219 () Bool)

(assert (= bs!5219 d!37877))

(declare-fun m!146211 () Bool)

(assert (=> bs!5219 m!146211))

(assert (=> bs!5219 m!146211))

(declare-fun m!146213 () Bool)

(assert (=> bs!5219 m!146213))

(assert (=> b!125124 d!37877))

(declare-fun d!37879 () Bool)

(assert (=> d!37879 (= (apply!110 (+!163 lt!64391 (tuple2!2521 lt!64397 (ite (and c!22717 c!22710) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2628 newMap!16)))) lt!64394) (apply!110 lt!64391 lt!64394))))

(declare-fun lt!64704 () Unit!3871)

(assert (=> d!37879 (= lt!64704 (choose!755 lt!64391 lt!64397 (ite (and c!22717 c!22710) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2628 newMap!16)) lt!64394))))

(declare-fun e!82006 () Bool)

(assert (=> d!37879 e!82006))

(declare-fun res!60761 () Bool)

(assert (=> d!37879 (=> (not res!60761) (not e!82006))))

(assert (=> d!37879 (= res!60761 (contains!861 lt!64391 lt!64394))))

(assert (=> d!37879 (= (addApplyDifferent!86 lt!64391 lt!64397 (ite (and c!22717 c!22710) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2628 newMap!16)) lt!64394) lt!64704)))

(declare-fun b!125537 () Bool)

(assert (=> b!125537 (= e!82006 (not (= lt!64394 lt!64397)))))

(assert (= (and d!37879 res!60761) b!125537))

(assert (=> d!37879 m!145429))

(assert (=> d!37879 m!145415))

(declare-fun m!146215 () Bool)

(assert (=> d!37879 m!146215))

(declare-fun m!146217 () Bool)

(assert (=> d!37879 m!146217))

(assert (=> d!37879 m!145415))

(assert (=> d!37879 m!145417))

(assert (=> b!125124 d!37879))

(declare-fun d!37881 () Bool)

(assert (=> d!37881 (= (apply!110 (+!163 lt!64383 (tuple2!2521 lt!64390 (ite c!22717 (ite c!22710 (minValue!2628 newMap!16) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2628 newMap!16)))) lt!64401) (get!1449 (getValueByKey!167 (toList!831 (+!163 lt!64383 (tuple2!2521 lt!64390 (ite c!22717 (ite c!22710 (minValue!2628 newMap!16) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2628 newMap!16))))) lt!64401)))))

(declare-fun bs!5220 () Bool)

(assert (= bs!5220 d!37881))

(declare-fun m!146219 () Bool)

(assert (=> bs!5220 m!146219))

(assert (=> bs!5220 m!146219))

(declare-fun m!146221 () Bool)

(assert (=> bs!5220 m!146221))

(assert (=> b!125124 d!37881))

(declare-fun d!37883 () Bool)

(declare-fun e!82007 () Bool)

(assert (=> d!37883 e!82007))

(declare-fun res!60762 () Bool)

(assert (=> d!37883 (=> (not res!60762) (not e!82007))))

(declare-fun lt!64706 () ListLongMap!1631)

(assert (=> d!37883 (= res!60762 (contains!861 lt!64706 (_1!1271 (tuple2!2521 lt!64390 (ite c!22717 (ite c!22710 (minValue!2628 newMap!16) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2628 newMap!16))))))))

(declare-fun lt!64707 () List!1676)

(assert (=> d!37883 (= lt!64706 (ListLongMap!1632 lt!64707))))

(declare-fun lt!64708 () Unit!3871)

(declare-fun lt!64705 () Unit!3871)

(assert (=> d!37883 (= lt!64708 lt!64705)))

(assert (=> d!37883 (= (getValueByKey!167 lt!64707 (_1!1271 (tuple2!2521 lt!64390 (ite c!22717 (ite c!22710 (minValue!2628 newMap!16) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2628 newMap!16))))) (Some!172 (_2!1271 (tuple2!2521 lt!64390 (ite c!22717 (ite c!22710 (minValue!2628 newMap!16) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2628 newMap!16))))))))

(assert (=> d!37883 (= lt!64705 (lemmaContainsTupThenGetReturnValue!82 lt!64707 (_1!1271 (tuple2!2521 lt!64390 (ite c!22717 (ite c!22710 (minValue!2628 newMap!16) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2628 newMap!16)))) (_2!1271 (tuple2!2521 lt!64390 (ite c!22717 (ite c!22710 (minValue!2628 newMap!16) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2628 newMap!16))))))))

(assert (=> d!37883 (= lt!64707 (insertStrictlySorted!85 (toList!831 lt!64383) (_1!1271 (tuple2!2521 lt!64390 (ite c!22717 (ite c!22710 (minValue!2628 newMap!16) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2628 newMap!16)))) (_2!1271 (tuple2!2521 lt!64390 (ite c!22717 (ite c!22710 (minValue!2628 newMap!16) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2628 newMap!16))))))))

(assert (=> d!37883 (= (+!163 lt!64383 (tuple2!2521 lt!64390 (ite c!22717 (ite c!22710 (minValue!2628 newMap!16) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2628 newMap!16)))) lt!64706)))

(declare-fun b!125538 () Bool)

(declare-fun res!60763 () Bool)

(assert (=> b!125538 (=> (not res!60763) (not e!82007))))

(assert (=> b!125538 (= res!60763 (= (getValueByKey!167 (toList!831 lt!64706) (_1!1271 (tuple2!2521 lt!64390 (ite c!22717 (ite c!22710 (minValue!2628 newMap!16) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2628 newMap!16))))) (Some!172 (_2!1271 (tuple2!2521 lt!64390 (ite c!22717 (ite c!22710 (minValue!2628 newMap!16) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2628 newMap!16)))))))))

(declare-fun b!125539 () Bool)

(assert (=> b!125539 (= e!82007 (contains!862 (toList!831 lt!64706) (tuple2!2521 lt!64390 (ite c!22717 (ite c!22710 (minValue!2628 newMap!16) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2628 newMap!16)))))))

(assert (= (and d!37883 res!60762) b!125538))

(assert (= (and b!125538 res!60763) b!125539))

(declare-fun m!146223 () Bool)

(assert (=> d!37883 m!146223))

(declare-fun m!146225 () Bool)

(assert (=> d!37883 m!146225))

(declare-fun m!146227 () Bool)

(assert (=> d!37883 m!146227))

(declare-fun m!146229 () Bool)

(assert (=> d!37883 m!146229))

(declare-fun m!146231 () Bool)

(assert (=> b!125538 m!146231))

(declare-fun m!146233 () Bool)

(assert (=> b!125539 m!146233))

(assert (=> b!125124 d!37883))

(declare-fun d!37885 () Bool)

(declare-fun e!82008 () Bool)

(assert (=> d!37885 e!82008))

(declare-fun res!60764 () Bool)

(assert (=> d!37885 (=> (not res!60764) (not e!82008))))

(declare-fun lt!64710 () ListLongMap!1631)

(assert (=> d!37885 (= res!60764 (contains!861 lt!64710 (_1!1271 (tuple2!2521 lt!64387 (ite (and c!22717 c!22710) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2628 newMap!16))))))))

(declare-fun lt!64711 () List!1676)

(assert (=> d!37885 (= lt!64710 (ListLongMap!1632 lt!64711))))

(declare-fun lt!64712 () Unit!3871)

(declare-fun lt!64709 () Unit!3871)

(assert (=> d!37885 (= lt!64712 lt!64709)))

(assert (=> d!37885 (= (getValueByKey!167 lt!64711 (_1!1271 (tuple2!2521 lt!64387 (ite (and c!22717 c!22710) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2628 newMap!16))))) (Some!172 (_2!1271 (tuple2!2521 lt!64387 (ite (and c!22717 c!22710) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2628 newMap!16))))))))

(assert (=> d!37885 (= lt!64709 (lemmaContainsTupThenGetReturnValue!82 lt!64711 (_1!1271 (tuple2!2521 lt!64387 (ite (and c!22717 c!22710) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2628 newMap!16)))) (_2!1271 (tuple2!2521 lt!64387 (ite (and c!22717 c!22710) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2628 newMap!16))))))))

(assert (=> d!37885 (= lt!64711 (insertStrictlySorted!85 (toList!831 lt!64395) (_1!1271 (tuple2!2521 lt!64387 (ite (and c!22717 c!22710) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2628 newMap!16)))) (_2!1271 (tuple2!2521 lt!64387 (ite (and c!22717 c!22710) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2628 newMap!16))))))))

(assert (=> d!37885 (= (+!163 lt!64395 (tuple2!2521 lt!64387 (ite (and c!22717 c!22710) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2628 newMap!16)))) lt!64710)))

(declare-fun b!125540 () Bool)

(declare-fun res!60765 () Bool)

(assert (=> b!125540 (=> (not res!60765) (not e!82008))))

(assert (=> b!125540 (= res!60765 (= (getValueByKey!167 (toList!831 lt!64710) (_1!1271 (tuple2!2521 lt!64387 (ite (and c!22717 c!22710) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2628 newMap!16))))) (Some!172 (_2!1271 (tuple2!2521 lt!64387 (ite (and c!22717 c!22710) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2628 newMap!16)))))))))

(declare-fun b!125541 () Bool)

(assert (=> b!125541 (= e!82008 (contains!862 (toList!831 lt!64710) (tuple2!2521 lt!64387 (ite (and c!22717 c!22710) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2628 newMap!16)))))))

(assert (= (and d!37885 res!60764) b!125540))

(assert (= (and b!125540 res!60765) b!125541))

(declare-fun m!146235 () Bool)

(assert (=> d!37885 m!146235))

(declare-fun m!146237 () Bool)

(assert (=> d!37885 m!146237))

(declare-fun m!146239 () Bool)

(assert (=> d!37885 m!146239))

(declare-fun m!146241 () Bool)

(assert (=> d!37885 m!146241))

(declare-fun m!146243 () Bool)

(assert (=> b!125540 m!146243))

(declare-fun m!146245 () Bool)

(assert (=> b!125541 m!146245))

(assert (=> b!125124 d!37885))

(declare-fun d!37887 () Bool)

(declare-fun e!82009 () Bool)

(assert (=> d!37887 e!82009))

(declare-fun res!60766 () Bool)

(assert (=> d!37887 (=> (not res!60766) (not e!82009))))

(declare-fun lt!64714 () ListLongMap!1631)

(assert (=> d!37887 (= res!60766 (contains!861 lt!64714 (_1!1271 (tuple2!2521 lt!64397 (ite (and c!22717 c!22710) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2628 newMap!16))))))))

(declare-fun lt!64715 () List!1676)

(assert (=> d!37887 (= lt!64714 (ListLongMap!1632 lt!64715))))

(declare-fun lt!64716 () Unit!3871)

(declare-fun lt!64713 () Unit!3871)

(assert (=> d!37887 (= lt!64716 lt!64713)))

(assert (=> d!37887 (= (getValueByKey!167 lt!64715 (_1!1271 (tuple2!2521 lt!64397 (ite (and c!22717 c!22710) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2628 newMap!16))))) (Some!172 (_2!1271 (tuple2!2521 lt!64397 (ite (and c!22717 c!22710) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2628 newMap!16))))))))

(assert (=> d!37887 (= lt!64713 (lemmaContainsTupThenGetReturnValue!82 lt!64715 (_1!1271 (tuple2!2521 lt!64397 (ite (and c!22717 c!22710) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2628 newMap!16)))) (_2!1271 (tuple2!2521 lt!64397 (ite (and c!22717 c!22710) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2628 newMap!16))))))))

(assert (=> d!37887 (= lt!64715 (insertStrictlySorted!85 (toList!831 lt!64391) (_1!1271 (tuple2!2521 lt!64397 (ite (and c!22717 c!22710) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2628 newMap!16)))) (_2!1271 (tuple2!2521 lt!64397 (ite (and c!22717 c!22710) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2628 newMap!16))))))))

(assert (=> d!37887 (= (+!163 lt!64391 (tuple2!2521 lt!64397 (ite (and c!22717 c!22710) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2628 newMap!16)))) lt!64714)))

(declare-fun b!125542 () Bool)

(declare-fun res!60767 () Bool)

(assert (=> b!125542 (=> (not res!60767) (not e!82009))))

(assert (=> b!125542 (= res!60767 (= (getValueByKey!167 (toList!831 lt!64714) (_1!1271 (tuple2!2521 lt!64397 (ite (and c!22717 c!22710) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2628 newMap!16))))) (Some!172 (_2!1271 (tuple2!2521 lt!64397 (ite (and c!22717 c!22710) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2628 newMap!16)))))))))

(declare-fun b!125543 () Bool)

(assert (=> b!125543 (= e!82009 (contains!862 (toList!831 lt!64714) (tuple2!2521 lt!64397 (ite (and c!22717 c!22710) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2628 newMap!16)))))))

(assert (= (and d!37887 res!60766) b!125542))

(assert (= (and b!125542 res!60767) b!125543))

(declare-fun m!146247 () Bool)

(assert (=> d!37887 m!146247))

(declare-fun m!146249 () Bool)

(assert (=> d!37887 m!146249))

(declare-fun m!146251 () Bool)

(assert (=> d!37887 m!146251))

(declare-fun m!146253 () Bool)

(assert (=> d!37887 m!146253))

(declare-fun m!146255 () Bool)

(assert (=> b!125542 m!146255))

(declare-fun m!146257 () Bool)

(assert (=> b!125543 m!146257))

(assert (=> b!125124 d!37887))

(declare-fun d!37889 () Bool)

(declare-fun e!82010 () Bool)

(assert (=> d!37889 e!82010))

(declare-fun res!60768 () Bool)

(assert (=> d!37889 (=> (not res!60768) (not e!82010))))

(declare-fun lt!64718 () ListLongMap!1631)

(assert (=> d!37889 (= res!60768 (contains!861 lt!64718 (_1!1271 (tuple2!2521 lt!64398 (ite c!22717 (ite c!22710 (minValue!2628 newMap!16) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2628 newMap!16))))))))

(declare-fun lt!64719 () List!1676)

(assert (=> d!37889 (= lt!64718 (ListLongMap!1632 lt!64719))))

(declare-fun lt!64720 () Unit!3871)

(declare-fun lt!64717 () Unit!3871)

(assert (=> d!37889 (= lt!64720 lt!64717)))

(assert (=> d!37889 (= (getValueByKey!167 lt!64719 (_1!1271 (tuple2!2521 lt!64398 (ite c!22717 (ite c!22710 (minValue!2628 newMap!16) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2628 newMap!16))))) (Some!172 (_2!1271 (tuple2!2521 lt!64398 (ite c!22717 (ite c!22710 (minValue!2628 newMap!16) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2628 newMap!16))))))))

(assert (=> d!37889 (= lt!64717 (lemmaContainsTupThenGetReturnValue!82 lt!64719 (_1!1271 (tuple2!2521 lt!64398 (ite c!22717 (ite c!22710 (minValue!2628 newMap!16) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2628 newMap!16)))) (_2!1271 (tuple2!2521 lt!64398 (ite c!22717 (ite c!22710 (minValue!2628 newMap!16) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2628 newMap!16))))))))

(assert (=> d!37889 (= lt!64719 (insertStrictlySorted!85 (toList!831 lt!64389) (_1!1271 (tuple2!2521 lt!64398 (ite c!22717 (ite c!22710 (minValue!2628 newMap!16) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2628 newMap!16)))) (_2!1271 (tuple2!2521 lt!64398 (ite c!22717 (ite c!22710 (minValue!2628 newMap!16) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2628 newMap!16))))))))

(assert (=> d!37889 (= (+!163 lt!64389 (tuple2!2521 lt!64398 (ite c!22717 (ite c!22710 (minValue!2628 newMap!16) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2628 newMap!16)))) lt!64718)))

(declare-fun b!125544 () Bool)

(declare-fun res!60769 () Bool)

(assert (=> b!125544 (=> (not res!60769) (not e!82010))))

(assert (=> b!125544 (= res!60769 (= (getValueByKey!167 (toList!831 lt!64718) (_1!1271 (tuple2!2521 lt!64398 (ite c!22717 (ite c!22710 (minValue!2628 newMap!16) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2628 newMap!16))))) (Some!172 (_2!1271 (tuple2!2521 lt!64398 (ite c!22717 (ite c!22710 (minValue!2628 newMap!16) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2628 newMap!16)))))))))

(declare-fun b!125545 () Bool)

(assert (=> b!125545 (= e!82010 (contains!862 (toList!831 lt!64718) (tuple2!2521 lt!64398 (ite c!22717 (ite c!22710 (minValue!2628 newMap!16) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2628 newMap!16)))))))

(assert (= (and d!37889 res!60768) b!125544))

(assert (= (and b!125544 res!60769) b!125545))

(declare-fun m!146259 () Bool)

(assert (=> d!37889 m!146259))

(declare-fun m!146261 () Bool)

(assert (=> d!37889 m!146261))

(declare-fun m!146263 () Bool)

(assert (=> d!37889 m!146263))

(declare-fun m!146265 () Bool)

(assert (=> d!37889 m!146265))

(declare-fun m!146267 () Bool)

(assert (=> b!125544 m!146267))

(declare-fun m!146269 () Bool)

(assert (=> b!125545 m!146269))

(assert (=> b!125124 d!37889))

(declare-fun d!37891 () Bool)

(assert (=> d!37891 (= (apply!110 lt!64383 lt!64401) (get!1449 (getValueByKey!167 (toList!831 lt!64383) lt!64401)))))

(declare-fun bs!5221 () Bool)

(assert (= bs!5221 d!37891))

(declare-fun m!146271 () Bool)

(assert (=> bs!5221 m!146271))

(assert (=> bs!5221 m!146271))

(declare-fun m!146273 () Bool)

(assert (=> bs!5221 m!146273))

(assert (=> b!125124 d!37891))

(assert (=> b!125124 d!37843))

(declare-fun d!37893 () Bool)

(assert (=> d!37893 (= (apply!110 (+!163 lt!64391 (tuple2!2521 lt!64397 (ite (and c!22717 c!22710) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2628 newMap!16)))) lt!64394) (get!1449 (getValueByKey!167 (toList!831 (+!163 lt!64391 (tuple2!2521 lt!64397 (ite (and c!22717 c!22710) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2628 newMap!16))))) lt!64394)))))

(declare-fun bs!5222 () Bool)

(assert (= bs!5222 d!37893))

(declare-fun m!146275 () Bool)

(assert (=> bs!5222 m!146275))

(assert (=> bs!5222 m!146275))

(declare-fun m!146277 () Bool)

(assert (=> bs!5222 m!146277))

(assert (=> b!125124 d!37893))

(declare-fun d!37895 () Bool)

(assert (=> d!37895 (= (apply!110 (+!163 lt!64383 (tuple2!2521 lt!64390 (ite c!22717 (ite c!22710 (minValue!2628 newMap!16) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2628 newMap!16)))) lt!64401) (apply!110 lt!64383 lt!64401))))

(declare-fun lt!64721 () Unit!3871)

(assert (=> d!37895 (= lt!64721 (choose!755 lt!64383 lt!64390 (ite c!22717 (ite c!22710 (minValue!2628 newMap!16) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2628 newMap!16)) lt!64401))))

(declare-fun e!82011 () Bool)

(assert (=> d!37895 e!82011))

(declare-fun res!60770 () Bool)

(assert (=> d!37895 (=> (not res!60770) (not e!82011))))

(assert (=> d!37895 (= res!60770 (contains!861 lt!64383 lt!64401))))

(assert (=> d!37895 (= (addApplyDifferent!86 lt!64383 lt!64390 (ite c!22717 (ite c!22710 (minValue!2628 newMap!16) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2628 newMap!16)) lt!64401) lt!64721)))

(declare-fun b!125546 () Bool)

(assert (=> b!125546 (= e!82011 (not (= lt!64401 lt!64390)))))

(assert (= (and d!37895 res!60770) b!125546))

(assert (=> d!37895 m!145425))

(assert (=> d!37895 m!145419))

(declare-fun m!146279 () Bool)

(assert (=> d!37895 m!146279))

(declare-fun m!146281 () Bool)

(assert (=> d!37895 m!146281))

(assert (=> d!37895 m!145419))

(assert (=> d!37895 m!145421))

(assert (=> b!125124 d!37895))

(declare-fun d!37897 () Bool)

(assert (=> d!37897 (contains!861 (+!163 lt!64395 (tuple2!2521 lt!64387 (ite (and c!22717 c!22710) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2628 newMap!16)))) lt!64382)))

(declare-fun lt!64722 () Unit!3871)

(assert (=> d!37897 (= lt!64722 (choose!756 lt!64395 lt!64387 (ite (and c!22717 c!22710) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2628 newMap!16)) lt!64382))))

(assert (=> d!37897 (contains!861 lt!64395 lt!64382)))

(assert (=> d!37897 (= (addStillContains!86 lt!64395 lt!64387 (ite (and c!22717 c!22710) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2628 newMap!16)) lt!64382) lt!64722)))

(declare-fun bs!5223 () Bool)

(assert (= bs!5223 d!37897))

(assert (=> bs!5223 m!145431))

(assert (=> bs!5223 m!145431))

(assert (=> bs!5223 m!145433))

(declare-fun m!146283 () Bool)

(assert (=> bs!5223 m!146283))

(declare-fun m!146285 () Bool)

(assert (=> bs!5223 m!146285))

(assert (=> b!125124 d!37897))

(declare-fun d!37899 () Bool)

(assert (=> d!37899 (= (apply!110 (+!163 lt!64389 (tuple2!2521 lt!64398 (ite c!22717 (ite c!22710 (minValue!2628 newMap!16) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2628 newMap!16)))) lt!64384) (apply!110 lt!64389 lt!64384))))

(declare-fun lt!64723 () Unit!3871)

(assert (=> d!37899 (= lt!64723 (choose!755 lt!64389 lt!64398 (ite c!22717 (ite c!22710 (minValue!2628 newMap!16) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2628 newMap!16)) lt!64384))))

(declare-fun e!82012 () Bool)

(assert (=> d!37899 e!82012))

(declare-fun res!60771 () Bool)

(assert (=> d!37899 (=> (not res!60771) (not e!82012))))

(assert (=> d!37899 (= res!60771 (contains!861 lt!64389 lt!64384))))

(assert (=> d!37899 (= (addApplyDifferent!86 lt!64389 lt!64398 (ite c!22717 (ite c!22710 (minValue!2628 newMap!16) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2628 newMap!16)) lt!64384) lt!64723)))

(declare-fun b!125547 () Bool)

(assert (=> b!125547 (= e!82012 (not (= lt!64384 lt!64398)))))

(assert (= (and d!37899 res!60771) b!125547))

(assert (=> d!37899 m!145423))

(assert (=> d!37899 m!145437))

(declare-fun m!146287 () Bool)

(assert (=> d!37899 m!146287))

(declare-fun m!146289 () Bool)

(assert (=> d!37899 m!146289))

(assert (=> d!37899 m!145437))

(assert (=> d!37899 m!145439))

(assert (=> b!125124 d!37899))

(declare-fun d!37901 () Bool)

(assert (=> d!37901 (= (apply!110 lt!64389 lt!64384) (get!1449 (getValueByKey!167 (toList!831 lt!64389) lt!64384)))))

(declare-fun bs!5224 () Bool)

(assert (= bs!5224 d!37901))

(declare-fun m!146291 () Bool)

(assert (=> bs!5224 m!146291))

(assert (=> bs!5224 m!146291))

(declare-fun m!146293 () Bool)

(assert (=> bs!5224 m!146293))

(assert (=> b!125124 d!37901))

(declare-fun d!37903 () Bool)

(declare-fun e!82013 () Bool)

(assert (=> d!37903 e!82013))

(declare-fun res!60772 () Bool)

(assert (=> d!37903 (=> res!60772 e!82013)))

(declare-fun lt!64724 () Bool)

(assert (=> d!37903 (= res!60772 (not lt!64724))))

(declare-fun lt!64727 () Bool)

(assert (=> d!37903 (= lt!64724 lt!64727)))

(declare-fun lt!64726 () Unit!3871)

(declare-fun e!82014 () Unit!3871)

(assert (=> d!37903 (= lt!64726 e!82014)))

(declare-fun c!22905 () Bool)

(assert (=> d!37903 (= c!22905 lt!64727)))

(assert (=> d!37903 (= lt!64727 (containsKey!170 (toList!831 (+!163 lt!64395 (tuple2!2521 lt!64387 (ite (and c!22717 c!22710) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2628 newMap!16))))) lt!64382))))

(assert (=> d!37903 (= (contains!861 (+!163 lt!64395 (tuple2!2521 lt!64387 (ite (and c!22717 c!22710) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2628 newMap!16)))) lt!64382) lt!64724)))

(declare-fun b!125548 () Bool)

(declare-fun lt!64725 () Unit!3871)

(assert (=> b!125548 (= e!82014 lt!64725)))

(assert (=> b!125548 (= lt!64725 (lemmaContainsKeyImpliesGetValueByKeyDefined!118 (toList!831 (+!163 lt!64395 (tuple2!2521 lt!64387 (ite (and c!22717 c!22710) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2628 newMap!16))))) lt!64382))))

(assert (=> b!125548 (isDefined!119 (getValueByKey!167 (toList!831 (+!163 lt!64395 (tuple2!2521 lt!64387 (ite (and c!22717 c!22710) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2628 newMap!16))))) lt!64382))))

(declare-fun b!125549 () Bool)

(declare-fun Unit!3904 () Unit!3871)

(assert (=> b!125549 (= e!82014 Unit!3904)))

(declare-fun b!125550 () Bool)

(assert (=> b!125550 (= e!82013 (isDefined!119 (getValueByKey!167 (toList!831 (+!163 lt!64395 (tuple2!2521 lt!64387 (ite (and c!22717 c!22710) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2628 newMap!16))))) lt!64382)))))

(assert (= (and d!37903 c!22905) b!125548))

(assert (= (and d!37903 (not c!22905)) b!125549))

(assert (= (and d!37903 (not res!60772)) b!125550))

(declare-fun m!146295 () Bool)

(assert (=> d!37903 m!146295))

(declare-fun m!146297 () Bool)

(assert (=> b!125548 m!146297))

(declare-fun m!146299 () Bool)

(assert (=> b!125548 m!146299))

(assert (=> b!125548 m!146299))

(declare-fun m!146301 () Bool)

(assert (=> b!125548 m!146301))

(assert (=> b!125550 m!146299))

(assert (=> b!125550 m!146299))

(assert (=> b!125550 m!146301))

(assert (=> b!125124 d!37903))

(declare-fun d!37905 () Bool)

(declare-fun res!60773 () Bool)

(declare-fun e!82015 () Bool)

(assert (=> d!37905 (=> res!60773 e!82015)))

(assert (=> d!37905 (= res!60773 (and ((_ is Cons!1672) (toList!831 (getCurrentListMap!511 (_keys!4492 newMap!16) (_values!2746 newMap!16) (mask!7009 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16)))) (= (_1!1271 (h!2273 (toList!831 (getCurrentListMap!511 (_keys!4492 newMap!16) (_values!2746 newMap!16) (mask!7009 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16))))) (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355))))))

(assert (=> d!37905 (= (containsKey!170 (toList!831 (getCurrentListMap!511 (_keys!4492 newMap!16) (_values!2746 newMap!16) (mask!7009 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16))) (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355)) e!82015)))

(declare-fun b!125551 () Bool)

(declare-fun e!82016 () Bool)

(assert (=> b!125551 (= e!82015 e!82016)))

(declare-fun res!60774 () Bool)

(assert (=> b!125551 (=> (not res!60774) (not e!82016))))

(assert (=> b!125551 (= res!60774 (and (or (not ((_ is Cons!1672) (toList!831 (getCurrentListMap!511 (_keys!4492 newMap!16) (_values!2746 newMap!16) (mask!7009 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16))))) (bvsle (_1!1271 (h!2273 (toList!831 (getCurrentListMap!511 (_keys!4492 newMap!16) (_values!2746 newMap!16) (mask!7009 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16))))) (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355))) ((_ is Cons!1672) (toList!831 (getCurrentListMap!511 (_keys!4492 newMap!16) (_values!2746 newMap!16) (mask!7009 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16)))) (bvslt (_1!1271 (h!2273 (toList!831 (getCurrentListMap!511 (_keys!4492 newMap!16) (_values!2746 newMap!16) (mask!7009 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16))))) (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355))))))

(declare-fun b!125552 () Bool)

(assert (=> b!125552 (= e!82016 (containsKey!170 (t!5995 (toList!831 (getCurrentListMap!511 (_keys!4492 newMap!16) (_values!2746 newMap!16) (mask!7009 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16)))) (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355)))))

(assert (= (and d!37905 (not res!60773)) b!125551))

(assert (= (and b!125551 res!60774) b!125552))

(assert (=> b!125552 m!144797))

(declare-fun m!146303 () Bool)

(assert (=> b!125552 m!146303))

(assert (=> d!37615 d!37905))

(declare-fun call!13419 () ListLongMap!1631)

(declare-fun c!22911 () Bool)

(declare-fun call!13423 () ListLongMap!1631)

(declare-fun call!13417 () ListLongMap!1631)

(declare-fun c!22909 () Bool)

(declare-fun bm!13414 () Bool)

(declare-fun call!13422 () ListLongMap!1631)

(assert (=> bm!13414 (= call!13417 (+!163 (ite c!22909 call!13422 (ite c!22911 call!13423 call!13419)) (ite (or c!22909 c!22911) (tuple2!2521 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2628 (_2!1272 lt!64219))) (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 (_2!1272 lt!64219))))))))

(declare-fun b!125553 () Bool)

(declare-fun e!82025 () Bool)

(declare-fun e!82018 () Bool)

(assert (=> b!125553 (= e!82025 e!82018)))

(declare-fun res!60775 () Bool)

(declare-fun call!13418 () Bool)

(assert (=> b!125553 (= res!60775 call!13418)))

(assert (=> b!125553 (=> (not res!60775) (not e!82018))))

(declare-fun bm!13415 () Bool)

(assert (=> bm!13415 (= call!13423 call!13422)))

(declare-fun b!125555 () Bool)

(declare-fun e!82028 () Bool)

(declare-fun lt!64729 () ListLongMap!1631)

(assert (=> b!125555 (= e!82028 (= (apply!110 lt!64729 (select (arr!2210 (_keys!4492 (_2!1272 lt!64219))) #b00000000000000000000000000000000)) (get!1446 (select (arr!2211 (_values!2746 (_2!1272 lt!64219))) #b00000000000000000000000000000000) (dynLambda!415 (defaultEntry!2763 (_2!1272 lt!64219)) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!125555 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2474 (_values!2746 (_2!1272 lt!64219)))))))

(assert (=> b!125555 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2473 (_keys!4492 (_2!1272 lt!64219)))))))

(declare-fun bm!13416 () Bool)

(assert (=> bm!13416 (= call!13419 call!13423)))

(declare-fun b!125556 () Bool)

(declare-fun e!82019 () Bool)

(declare-fun e!82024 () Bool)

(assert (=> b!125556 (= e!82019 e!82024)))

(declare-fun res!60782 () Bool)

(declare-fun call!13421 () Bool)

(assert (=> b!125556 (= res!60782 call!13421)))

(assert (=> b!125556 (=> (not res!60782) (not e!82024))))

(declare-fun b!125557 () Bool)

(declare-fun e!82022 () Unit!3871)

(declare-fun lt!64740 () Unit!3871)

(assert (=> b!125557 (= e!82022 lt!64740)))

(declare-fun lt!64743 () ListLongMap!1631)

(assert (=> b!125557 (= lt!64743 (getCurrentListMapNoExtraKeys!130 (_keys!4492 (_2!1272 lt!64219)) (_values!2746 (_2!1272 lt!64219)) (mask!7009 (_2!1272 lt!64219)) (extraKeys!2548 (_2!1272 lt!64219)) (zeroValue!2628 (_2!1272 lt!64219)) (minValue!2628 (_2!1272 lt!64219)) #b00000000000000000000000000000000 (defaultEntry!2763 (_2!1272 lt!64219))))))

(declare-fun lt!64735 () (_ BitVec 64))

(assert (=> b!125557 (= lt!64735 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!64730 () (_ BitVec 64))

(assert (=> b!125557 (= lt!64730 (select (arr!2210 (_keys!4492 (_2!1272 lt!64219))) #b00000000000000000000000000000000))))

(declare-fun lt!64733 () Unit!3871)

(assert (=> b!125557 (= lt!64733 (addStillContains!86 lt!64743 lt!64735 (zeroValue!2628 (_2!1272 lt!64219)) lt!64730))))

(assert (=> b!125557 (contains!861 (+!163 lt!64743 (tuple2!2521 lt!64735 (zeroValue!2628 (_2!1272 lt!64219)))) lt!64730)))

(declare-fun lt!64728 () Unit!3871)

(assert (=> b!125557 (= lt!64728 lt!64733)))

(declare-fun lt!64737 () ListLongMap!1631)

(assert (=> b!125557 (= lt!64737 (getCurrentListMapNoExtraKeys!130 (_keys!4492 (_2!1272 lt!64219)) (_values!2746 (_2!1272 lt!64219)) (mask!7009 (_2!1272 lt!64219)) (extraKeys!2548 (_2!1272 lt!64219)) (zeroValue!2628 (_2!1272 lt!64219)) (minValue!2628 (_2!1272 lt!64219)) #b00000000000000000000000000000000 (defaultEntry!2763 (_2!1272 lt!64219))))))

(declare-fun lt!64746 () (_ BitVec 64))

(assert (=> b!125557 (= lt!64746 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!64732 () (_ BitVec 64))

(assert (=> b!125557 (= lt!64732 (select (arr!2210 (_keys!4492 (_2!1272 lt!64219))) #b00000000000000000000000000000000))))

(declare-fun lt!64734 () Unit!3871)

(assert (=> b!125557 (= lt!64734 (addApplyDifferent!86 lt!64737 lt!64746 (minValue!2628 (_2!1272 lt!64219)) lt!64732))))

(assert (=> b!125557 (= (apply!110 (+!163 lt!64737 (tuple2!2521 lt!64746 (minValue!2628 (_2!1272 lt!64219)))) lt!64732) (apply!110 lt!64737 lt!64732))))

(declare-fun lt!64747 () Unit!3871)

(assert (=> b!125557 (= lt!64747 lt!64734)))

(declare-fun lt!64739 () ListLongMap!1631)

(assert (=> b!125557 (= lt!64739 (getCurrentListMapNoExtraKeys!130 (_keys!4492 (_2!1272 lt!64219)) (_values!2746 (_2!1272 lt!64219)) (mask!7009 (_2!1272 lt!64219)) (extraKeys!2548 (_2!1272 lt!64219)) (zeroValue!2628 (_2!1272 lt!64219)) (minValue!2628 (_2!1272 lt!64219)) #b00000000000000000000000000000000 (defaultEntry!2763 (_2!1272 lt!64219))))))

(declare-fun lt!64745 () (_ BitVec 64))

(assert (=> b!125557 (= lt!64745 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!64742 () (_ BitVec 64))

(assert (=> b!125557 (= lt!64742 (select (arr!2210 (_keys!4492 (_2!1272 lt!64219))) #b00000000000000000000000000000000))))

(declare-fun lt!64741 () Unit!3871)

(assert (=> b!125557 (= lt!64741 (addApplyDifferent!86 lt!64739 lt!64745 (zeroValue!2628 (_2!1272 lt!64219)) lt!64742))))

(assert (=> b!125557 (= (apply!110 (+!163 lt!64739 (tuple2!2521 lt!64745 (zeroValue!2628 (_2!1272 lt!64219)))) lt!64742) (apply!110 lt!64739 lt!64742))))

(declare-fun lt!64736 () Unit!3871)

(assert (=> b!125557 (= lt!64736 lt!64741)))

(declare-fun lt!64731 () ListLongMap!1631)

(assert (=> b!125557 (= lt!64731 (getCurrentListMapNoExtraKeys!130 (_keys!4492 (_2!1272 lt!64219)) (_values!2746 (_2!1272 lt!64219)) (mask!7009 (_2!1272 lt!64219)) (extraKeys!2548 (_2!1272 lt!64219)) (zeroValue!2628 (_2!1272 lt!64219)) (minValue!2628 (_2!1272 lt!64219)) #b00000000000000000000000000000000 (defaultEntry!2763 (_2!1272 lt!64219))))))

(declare-fun lt!64738 () (_ BitVec 64))

(assert (=> b!125557 (= lt!64738 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!64749 () (_ BitVec 64))

(assert (=> b!125557 (= lt!64749 (select (arr!2210 (_keys!4492 (_2!1272 lt!64219))) #b00000000000000000000000000000000))))

(assert (=> b!125557 (= lt!64740 (addApplyDifferent!86 lt!64731 lt!64738 (minValue!2628 (_2!1272 lt!64219)) lt!64749))))

(assert (=> b!125557 (= (apply!110 (+!163 lt!64731 (tuple2!2521 lt!64738 (minValue!2628 (_2!1272 lt!64219)))) lt!64749) (apply!110 lt!64731 lt!64749))))

(declare-fun b!125558 () Bool)

(declare-fun e!82020 () ListLongMap!1631)

(assert (=> b!125558 (= e!82020 call!13419)))

(declare-fun b!125559 () Bool)

(declare-fun e!82027 () Bool)

(assert (=> b!125559 (= e!82027 e!82019)))

(declare-fun c!22907 () Bool)

(assert (=> b!125559 (= c!22907 (not (= (bvand (extraKeys!2548 (_2!1272 lt!64219)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!125560 () Bool)

(assert (=> b!125560 (= e!82025 (not call!13418))))

(declare-fun bm!13417 () Bool)

(assert (=> bm!13417 (= call!13421 (contains!861 lt!64729 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!125561 () Bool)

(declare-fun e!82023 () Bool)

(assert (=> b!125561 (= e!82023 (validKeyInArray!0 (select (arr!2210 (_keys!4492 (_2!1272 lt!64219))) #b00000000000000000000000000000000)))))

(declare-fun d!37907 () Bool)

(assert (=> d!37907 e!82027))

(declare-fun res!60778 () Bool)

(assert (=> d!37907 (=> (not res!60778) (not e!82027))))

(assert (=> d!37907 (= res!60778 (or (bvsge #b00000000000000000000000000000000 (size!2473 (_keys!4492 (_2!1272 lt!64219)))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2473 (_keys!4492 (_2!1272 lt!64219)))))))))

(declare-fun lt!64744 () ListLongMap!1631)

(assert (=> d!37907 (= lt!64729 lt!64744)))

(declare-fun lt!64748 () Unit!3871)

(assert (=> d!37907 (= lt!64748 e!82022)))

(declare-fun c!22906 () Bool)

(declare-fun e!82029 () Bool)

(assert (=> d!37907 (= c!22906 e!82029)))

(declare-fun res!60780 () Bool)

(assert (=> d!37907 (=> (not res!60780) (not e!82029))))

(assert (=> d!37907 (= res!60780 (bvslt #b00000000000000000000000000000000 (size!2473 (_keys!4492 (_2!1272 lt!64219)))))))

(declare-fun e!82017 () ListLongMap!1631)

(assert (=> d!37907 (= lt!64744 e!82017)))

(assert (=> d!37907 (= c!22909 (and (not (= (bvand (extraKeys!2548 (_2!1272 lt!64219)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2548 (_2!1272 lt!64219)) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!37907 (validMask!0 (mask!7009 (_2!1272 lt!64219)))))

(assert (=> d!37907 (= (getCurrentListMap!511 (_keys!4492 (_2!1272 lt!64219)) (_values!2746 (_2!1272 lt!64219)) (mask!7009 (_2!1272 lt!64219)) (extraKeys!2548 (_2!1272 lt!64219)) (zeroValue!2628 (_2!1272 lt!64219)) (minValue!2628 (_2!1272 lt!64219)) #b00000000000000000000000000000000 (defaultEntry!2763 (_2!1272 lt!64219))) lt!64729)))

(declare-fun b!125554 () Bool)

(assert (=> b!125554 (= e!82019 (not call!13421))))

(declare-fun bm!13418 () Bool)

(assert (=> bm!13418 (= call!13418 (contains!861 lt!64729 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!125562 () Bool)

(assert (=> b!125562 (= e!82029 (validKeyInArray!0 (select (arr!2210 (_keys!4492 (_2!1272 lt!64219))) #b00000000000000000000000000000000)))))

(declare-fun b!125563 () Bool)

(assert (=> b!125563 (= e!82024 (= (apply!110 lt!64729 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2628 (_2!1272 lt!64219))))))

(declare-fun b!125564 () Bool)

(assert (=> b!125564 (= e!82018 (= (apply!110 lt!64729 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2628 (_2!1272 lt!64219))))))

(declare-fun b!125565 () Bool)

(declare-fun e!82021 () Bool)

(assert (=> b!125565 (= e!82021 e!82028)))

(declare-fun res!60776 () Bool)

(assert (=> b!125565 (=> (not res!60776) (not e!82028))))

(assert (=> b!125565 (= res!60776 (contains!861 lt!64729 (select (arr!2210 (_keys!4492 (_2!1272 lt!64219))) #b00000000000000000000000000000000)))))

(assert (=> b!125565 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2473 (_keys!4492 (_2!1272 lt!64219)))))))

(declare-fun b!125566 () Bool)

(declare-fun e!82026 () ListLongMap!1631)

(assert (=> b!125566 (= e!82017 e!82026)))

(assert (=> b!125566 (= c!22911 (and (not (= (bvand (extraKeys!2548 (_2!1272 lt!64219)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2548 (_2!1272 lt!64219)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!125567 () Bool)

(declare-fun call!13420 () ListLongMap!1631)

(assert (=> b!125567 (= e!82020 call!13420)))

(declare-fun bm!13419 () Bool)

(assert (=> bm!13419 (= call!13422 (getCurrentListMapNoExtraKeys!130 (_keys!4492 (_2!1272 lt!64219)) (_values!2746 (_2!1272 lt!64219)) (mask!7009 (_2!1272 lt!64219)) (extraKeys!2548 (_2!1272 lt!64219)) (zeroValue!2628 (_2!1272 lt!64219)) (minValue!2628 (_2!1272 lt!64219)) #b00000000000000000000000000000000 (defaultEntry!2763 (_2!1272 lt!64219))))))

(declare-fun b!125568 () Bool)

(declare-fun res!60777 () Bool)

(assert (=> b!125568 (=> (not res!60777) (not e!82027))))

(assert (=> b!125568 (= res!60777 e!82021)))

(declare-fun res!60781 () Bool)

(assert (=> b!125568 (=> res!60781 e!82021)))

(assert (=> b!125568 (= res!60781 (not e!82023))))

(declare-fun res!60779 () Bool)

(assert (=> b!125568 (=> (not res!60779) (not e!82023))))

(assert (=> b!125568 (= res!60779 (bvslt #b00000000000000000000000000000000 (size!2473 (_keys!4492 (_2!1272 lt!64219)))))))

(declare-fun b!125569 () Bool)

(assert (=> b!125569 (= e!82026 call!13420)))

(declare-fun b!125570 () Bool)

(declare-fun Unit!3905 () Unit!3871)

(assert (=> b!125570 (= e!82022 Unit!3905)))

(declare-fun b!125571 () Bool)

(assert (=> b!125571 (= e!82017 (+!163 call!13417 (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 (_2!1272 lt!64219)))))))

(declare-fun b!125572 () Bool)

(declare-fun res!60783 () Bool)

(assert (=> b!125572 (=> (not res!60783) (not e!82027))))

(assert (=> b!125572 (= res!60783 e!82025)))

(declare-fun c!22908 () Bool)

(assert (=> b!125572 (= c!22908 (not (= (bvand (extraKeys!2548 (_2!1272 lt!64219)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!13420 () Bool)

(assert (=> bm!13420 (= call!13420 call!13417)))

(declare-fun b!125573 () Bool)

(declare-fun c!22910 () Bool)

(assert (=> b!125573 (= c!22910 (and (not (= (bvand (extraKeys!2548 (_2!1272 lt!64219)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2548 (_2!1272 lt!64219)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!125573 (= e!82026 e!82020)))

(assert (= (and d!37907 c!22909) b!125571))

(assert (= (and d!37907 (not c!22909)) b!125566))

(assert (= (and b!125566 c!22911) b!125569))

(assert (= (and b!125566 (not c!22911)) b!125573))

(assert (= (and b!125573 c!22910) b!125567))

(assert (= (and b!125573 (not c!22910)) b!125558))

(assert (= (or b!125567 b!125558) bm!13416))

(assert (= (or b!125569 bm!13416) bm!13415))

(assert (= (or b!125569 b!125567) bm!13420))

(assert (= (or b!125571 bm!13415) bm!13419))

(assert (= (or b!125571 bm!13420) bm!13414))

(assert (= (and d!37907 res!60780) b!125562))

(assert (= (and d!37907 c!22906) b!125557))

(assert (= (and d!37907 (not c!22906)) b!125570))

(assert (= (and d!37907 res!60778) b!125568))

(assert (= (and b!125568 res!60779) b!125561))

(assert (= (and b!125568 (not res!60781)) b!125565))

(assert (= (and b!125565 res!60776) b!125555))

(assert (= (and b!125568 res!60777) b!125572))

(assert (= (and b!125572 c!22908) b!125553))

(assert (= (and b!125572 (not c!22908)) b!125560))

(assert (= (and b!125553 res!60775) b!125564))

(assert (= (or b!125553 b!125560) bm!13418))

(assert (= (and b!125572 res!60783) b!125559))

(assert (= (and b!125559 c!22907) b!125556))

(assert (= (and b!125559 (not c!22907)) b!125554))

(assert (= (and b!125556 res!60782) b!125563))

(assert (= (or b!125556 b!125554) bm!13417))

(declare-fun b_lambda!5523 () Bool)

(assert (=> (not b_lambda!5523) (not b!125555)))

(declare-fun tb!2297 () Bool)

(declare-fun t!6010 () Bool)

(assert (=> (and b!124545 (= (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) (defaultEntry!2763 (_2!1272 lt!64219))) t!6010) tb!2297))

(declare-fun result!3819 () Bool)

(assert (=> tb!2297 (= result!3819 tp_is_empty!2833)))

(assert (=> b!125555 t!6010))

(declare-fun b_and!7729 () Bool)

(assert (= b_and!7725 (and (=> t!6010 result!3819) b_and!7729)))

(declare-fun t!6012 () Bool)

(declare-fun tb!2299 () Bool)

(assert (=> (and b!124538 (= (defaultEntry!2763 newMap!16) (defaultEntry!2763 (_2!1272 lt!64219))) t!6012) tb!2299))

(declare-fun result!3821 () Bool)

(assert (= result!3821 result!3819))

(assert (=> b!125555 t!6012))

(declare-fun b_and!7731 () Bool)

(assert (= b_and!7727 (and (=> t!6012 result!3821) b_and!7731)))

(declare-fun m!146305 () Bool)

(assert (=> b!125563 m!146305))

(declare-fun m!146307 () Bool)

(assert (=> bm!13419 m!146307))

(declare-fun m!146309 () Bool)

(assert (=> b!125564 m!146309))

(declare-fun m!146311 () Bool)

(assert (=> b!125571 m!146311))

(declare-fun m!146313 () Bool)

(assert (=> bm!13418 m!146313))

(assert (=> b!125555 m!145595))

(declare-fun m!146315 () Bool)

(assert (=> b!125555 m!146315))

(assert (=> b!125555 m!145595))

(declare-fun m!146317 () Bool)

(assert (=> b!125555 m!146317))

(declare-fun m!146319 () Bool)

(assert (=> b!125555 m!146319))

(assert (=> b!125555 m!146319))

(assert (=> b!125555 m!146317))

(declare-fun m!146321 () Bool)

(assert (=> b!125555 m!146321))

(assert (=> b!125565 m!145595))

(assert (=> b!125565 m!145595))

(declare-fun m!146323 () Bool)

(assert (=> b!125565 m!146323))

(declare-fun m!146325 () Bool)

(assert (=> b!125557 m!146325))

(declare-fun m!146327 () Bool)

(assert (=> b!125557 m!146327))

(assert (=> b!125557 m!146307))

(declare-fun m!146329 () Bool)

(assert (=> b!125557 m!146329))

(declare-fun m!146331 () Bool)

(assert (=> b!125557 m!146331))

(declare-fun m!146333 () Bool)

(assert (=> b!125557 m!146333))

(assert (=> b!125557 m!146325))

(declare-fun m!146335 () Bool)

(assert (=> b!125557 m!146335))

(assert (=> b!125557 m!146329))

(declare-fun m!146337 () Bool)

(assert (=> b!125557 m!146337))

(declare-fun m!146339 () Bool)

(assert (=> b!125557 m!146339))

(declare-fun m!146341 () Bool)

(assert (=> b!125557 m!146341))

(declare-fun m!146343 () Bool)

(assert (=> b!125557 m!146343))

(declare-fun m!146345 () Bool)

(assert (=> b!125557 m!146345))

(declare-fun m!146347 () Bool)

(assert (=> b!125557 m!146347))

(declare-fun m!146349 () Bool)

(assert (=> b!125557 m!146349))

(declare-fun m!146351 () Bool)

(assert (=> b!125557 m!146351))

(assert (=> b!125557 m!146347))

(assert (=> b!125557 m!146341))

(declare-fun m!146353 () Bool)

(assert (=> b!125557 m!146353))

(assert (=> b!125557 m!145595))

(assert (=> b!125561 m!145595))

(assert (=> b!125561 m!145595))

(assert (=> b!125561 m!145601))

(declare-fun m!146355 () Bool)

(assert (=> bm!13417 m!146355))

(declare-fun m!146357 () Bool)

(assert (=> bm!13414 m!146357))

(declare-fun m!146359 () Bool)

(assert (=> d!37907 m!146359))

(assert (=> b!125562 m!145595))

(assert (=> b!125562 m!145595))

(assert (=> b!125562 m!145601))

(assert (=> d!37617 d!37907))

(declare-fun lt!64750 () Bool)

(declare-fun d!37909 () Bool)

(assert (=> d!37909 (= lt!64750 (select (content!124 (toList!831 lt!64292)) (tuple2!2521 lt!64117 (minValue!2628 (v!3108 (underlying!436 thiss!992))))))))

(declare-fun e!82030 () Bool)

(assert (=> d!37909 (= lt!64750 e!82030)))

(declare-fun res!60784 () Bool)

(assert (=> d!37909 (=> (not res!60784) (not e!82030))))

(assert (=> d!37909 (= res!60784 ((_ is Cons!1672) (toList!831 lt!64292)))))

(assert (=> d!37909 (= (contains!862 (toList!831 lt!64292) (tuple2!2521 lt!64117 (minValue!2628 (v!3108 (underlying!436 thiss!992))))) lt!64750)))

(declare-fun b!125574 () Bool)

(declare-fun e!82031 () Bool)

(assert (=> b!125574 (= e!82030 e!82031)))

(declare-fun res!60785 () Bool)

(assert (=> b!125574 (=> res!60785 e!82031)))

(assert (=> b!125574 (= res!60785 (= (h!2273 (toList!831 lt!64292)) (tuple2!2521 lt!64117 (minValue!2628 (v!3108 (underlying!436 thiss!992))))))))

(declare-fun b!125575 () Bool)

(assert (=> b!125575 (= e!82031 (contains!862 (t!5995 (toList!831 lt!64292)) (tuple2!2521 lt!64117 (minValue!2628 (v!3108 (underlying!436 thiss!992))))))))

(assert (= (and d!37909 res!60784) b!125574))

(assert (= (and b!125574 (not res!60785)) b!125575))

(declare-fun m!146361 () Bool)

(assert (=> d!37909 m!146361))

(declare-fun m!146363 () Bool)

(assert (=> d!37909 m!146363))

(declare-fun m!146365 () Bool)

(assert (=> b!125575 m!146365))

(assert (=> b!125013 d!37909))

(assert (=> bm!13367 d!37689))

(declare-fun d!37911 () Bool)

(assert (=> d!37911 (= (map!1377 (_2!1272 lt!64480)) (getCurrentListMap!511 (_keys!4492 (_2!1272 lt!64480)) (_values!2746 (_2!1272 lt!64480)) (mask!7009 (_2!1272 lt!64480)) (extraKeys!2548 (_2!1272 lt!64480)) (zeroValue!2628 (_2!1272 lt!64480)) (minValue!2628 (_2!1272 lt!64480)) #b00000000000000000000000000000000 (defaultEntry!2763 (_2!1272 lt!64480))))))

(declare-fun bs!5225 () Bool)

(assert (= bs!5225 d!37911))

(declare-fun m!146367 () Bool)

(assert (=> bs!5225 m!146367))

(assert (=> b!125194 d!37911))

(declare-fun d!37913 () Bool)

(declare-fun e!82032 () Bool)

(assert (=> d!37913 e!82032))

(declare-fun res!60786 () Bool)

(assert (=> d!37913 (=> (not res!60786) (not e!82032))))

(declare-fun lt!64752 () ListLongMap!1631)

(assert (=> d!37913 (= res!60786 (contains!861 lt!64752 (_1!1271 (tuple2!2521 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!64753 () List!1676)

(assert (=> d!37913 (= lt!64752 (ListLongMap!1632 lt!64753))))

(declare-fun lt!64754 () Unit!3871)

(declare-fun lt!64751 () Unit!3871)

(assert (=> d!37913 (= lt!64754 lt!64751)))

(assert (=> d!37913 (= (getValueByKey!167 lt!64753 (_1!1271 (tuple2!2521 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!172 (_2!1271 (tuple2!2521 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!37913 (= lt!64751 (lemmaContainsTupThenGetReturnValue!82 lt!64753 (_1!1271 (tuple2!2521 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1271 (tuple2!2521 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!37913 (= lt!64753 (insertStrictlySorted!85 (toList!831 (map!1377 newMap!16)) (_1!1271 (tuple2!2521 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1271 (tuple2!2521 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!37913 (= (+!163 (map!1377 newMap!16) (tuple2!2521 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!64752)))

(declare-fun b!125576 () Bool)

(declare-fun res!60787 () Bool)

(assert (=> b!125576 (=> (not res!60787) (not e!82032))))

(assert (=> b!125576 (= res!60787 (= (getValueByKey!167 (toList!831 lt!64752) (_1!1271 (tuple2!2521 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!172 (_2!1271 (tuple2!2521 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!125577 () Bool)

(assert (=> b!125577 (= e!82032 (contains!862 (toList!831 lt!64752) (tuple2!2521 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!37913 res!60786) b!125576))

(assert (= (and b!125576 res!60787) b!125577))

(declare-fun m!146369 () Bool)

(assert (=> d!37913 m!146369))

(declare-fun m!146371 () Bool)

(assert (=> d!37913 m!146371))

(declare-fun m!146373 () Bool)

(assert (=> d!37913 m!146373))

(declare-fun m!146375 () Bool)

(assert (=> d!37913 m!146375))

(declare-fun m!146377 () Bool)

(assert (=> b!125576 m!146377))

(declare-fun m!146379 () Bool)

(assert (=> b!125577 m!146379))

(assert (=> b!125194 d!37913))

(assert (=> b!125194 d!37499))

(declare-fun d!37915 () Bool)

(assert (=> d!37915 (isDefined!119 (getValueByKey!167 (toList!831 call!13330) (ite c!22712 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355) (select (arr!2210 (_keys!4492 newMap!16)) (index!3207 lt!64214)))))))

(declare-fun lt!64755 () Unit!3871)

(assert (=> d!37915 (= lt!64755 (choose!762 (toList!831 call!13330) (ite c!22712 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355) (select (arr!2210 (_keys!4492 newMap!16)) (index!3207 lt!64214)))))))

(declare-fun e!82033 () Bool)

(assert (=> d!37915 e!82033))

(declare-fun res!60788 () Bool)

(assert (=> d!37915 (=> (not res!60788) (not e!82033))))

(assert (=> d!37915 (= res!60788 (isStrictlySorted!303 (toList!831 call!13330)))))

(assert (=> d!37915 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!118 (toList!831 call!13330) (ite c!22712 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355) (select (arr!2210 (_keys!4492 newMap!16)) (index!3207 lt!64214)))) lt!64755)))

(declare-fun b!125578 () Bool)

(assert (=> b!125578 (= e!82033 (containsKey!170 (toList!831 call!13330) (ite c!22712 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355) (select (arr!2210 (_keys!4492 newMap!16)) (index!3207 lt!64214)))))))

(assert (= (and d!37915 res!60788) b!125578))

(assert (=> d!37915 m!145393))

(assert (=> d!37915 m!145393))

(assert (=> d!37915 m!145395))

(declare-fun m!146381 () Bool)

(assert (=> d!37915 m!146381))

(declare-fun m!146383 () Bool)

(assert (=> d!37915 m!146383))

(assert (=> b!125578 m!145389))

(assert (=> b!125117 d!37915))

(assert (=> b!125117 d!37635))

(assert (=> b!125117 d!37637))

(declare-fun b!125580 () Bool)

(declare-fun e!82034 () Option!173)

(declare-fun e!82035 () Option!173)

(assert (=> b!125580 (= e!82034 e!82035)))

(declare-fun c!22913 () Bool)

(assert (=> b!125580 (= c!22913 (and ((_ is Cons!1672) (toList!831 lt!64254)) (not (= (_1!1271 (h!2273 (toList!831 lt!64254))) (_1!1271 (tuple2!2521 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(declare-fun b!125581 () Bool)

(assert (=> b!125581 (= e!82035 (getValueByKey!167 (t!5995 (toList!831 lt!64254)) (_1!1271 (tuple2!2521 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun c!22912 () Bool)

(declare-fun d!37917 () Bool)

(assert (=> d!37917 (= c!22912 (and ((_ is Cons!1672) (toList!831 lt!64254)) (= (_1!1271 (h!2273 (toList!831 lt!64254))) (_1!1271 (tuple2!2521 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!37917 (= (getValueByKey!167 (toList!831 lt!64254) (_1!1271 (tuple2!2521 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) e!82034)))

(declare-fun b!125582 () Bool)

(assert (=> b!125582 (= e!82035 None!171)))

(declare-fun b!125579 () Bool)

(assert (=> b!125579 (= e!82034 (Some!172 (_2!1271 (h!2273 (toList!831 lt!64254)))))))

(assert (= (and d!37917 c!22912) b!125579))

(assert (= (and d!37917 (not c!22912)) b!125580))

(assert (= (and b!125580 c!22913) b!125581))

(assert (= (and b!125580 (not c!22913)) b!125582))

(declare-fun m!146385 () Bool)

(assert (=> b!125581 m!146385))

(assert (=> b!124940 d!37917))

(declare-fun d!37919 () Bool)

(declare-fun e!82036 () Bool)

(assert (=> d!37919 e!82036))

(declare-fun res!60789 () Bool)

(assert (=> d!37919 (=> res!60789 e!82036)))

(declare-fun lt!64756 () Bool)

(assert (=> d!37919 (= res!60789 (not lt!64756))))

(declare-fun lt!64759 () Bool)

(assert (=> d!37919 (= lt!64756 lt!64759)))

(declare-fun lt!64758 () Unit!3871)

(declare-fun e!82037 () Unit!3871)

(assert (=> d!37919 (= lt!64758 e!82037)))

(declare-fun c!22914 () Bool)

(assert (=> d!37919 (= c!22914 lt!64759)))

(assert (=> d!37919 (= lt!64759 (containsKey!170 (toList!831 lt!64231) (_1!1271 (ite (or c!22677 c!22679) (tuple2!2521 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2628 (v!3108 (underlying!436 thiss!992)))) (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 (v!3108 (underlying!436 thiss!992))))))))))

(assert (=> d!37919 (= (contains!861 lt!64231 (_1!1271 (ite (or c!22677 c!22679) (tuple2!2521 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2628 (v!3108 (underlying!436 thiss!992)))) (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 (v!3108 (underlying!436 thiss!992))))))) lt!64756)))

(declare-fun b!125583 () Bool)

(declare-fun lt!64757 () Unit!3871)

(assert (=> b!125583 (= e!82037 lt!64757)))

(assert (=> b!125583 (= lt!64757 (lemmaContainsKeyImpliesGetValueByKeyDefined!118 (toList!831 lt!64231) (_1!1271 (ite (or c!22677 c!22679) (tuple2!2521 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2628 (v!3108 (underlying!436 thiss!992)))) (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 (v!3108 (underlying!436 thiss!992))))))))))

(assert (=> b!125583 (isDefined!119 (getValueByKey!167 (toList!831 lt!64231) (_1!1271 (ite (or c!22677 c!22679) (tuple2!2521 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2628 (v!3108 (underlying!436 thiss!992)))) (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 (v!3108 (underlying!436 thiss!992))))))))))

(declare-fun b!125584 () Bool)

(declare-fun Unit!3906 () Unit!3871)

(assert (=> b!125584 (= e!82037 Unit!3906)))

(declare-fun b!125585 () Bool)

(assert (=> b!125585 (= e!82036 (isDefined!119 (getValueByKey!167 (toList!831 lt!64231) (_1!1271 (ite (or c!22677 c!22679) (tuple2!2521 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2628 (v!3108 (underlying!436 thiss!992)))) (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 (v!3108 (underlying!436 thiss!992)))))))))))

(assert (= (and d!37919 c!22914) b!125583))

(assert (= (and d!37919 (not c!22914)) b!125584))

(assert (= (and d!37919 (not res!60789)) b!125585))

(declare-fun m!146387 () Bool)

(assert (=> d!37919 m!146387))

(declare-fun m!146389 () Bool)

(assert (=> b!125583 m!146389))

(assert (=> b!125583 m!145041))

(assert (=> b!125583 m!145041))

(declare-fun m!146391 () Bool)

(assert (=> b!125583 m!146391))

(assert (=> b!125585 m!145041))

(assert (=> b!125585 m!145041))

(assert (=> b!125585 m!146391))

(assert (=> d!37523 d!37919))

(declare-fun b!125587 () Bool)

(declare-fun e!82038 () Option!173)

(declare-fun e!82039 () Option!173)

(assert (=> b!125587 (= e!82038 e!82039)))

(declare-fun c!22916 () Bool)

(assert (=> b!125587 (= c!22916 (and ((_ is Cons!1672) lt!64232) (not (= (_1!1271 (h!2273 lt!64232)) (_1!1271 (ite (or c!22677 c!22679) (tuple2!2521 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2628 (v!3108 (underlying!436 thiss!992)))) (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 (v!3108 (underlying!436 thiss!992))))))))))))

(declare-fun b!125588 () Bool)

(assert (=> b!125588 (= e!82039 (getValueByKey!167 (t!5995 lt!64232) (_1!1271 (ite (or c!22677 c!22679) (tuple2!2521 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2628 (v!3108 (underlying!436 thiss!992)))) (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 (v!3108 (underlying!436 thiss!992))))))))))

(declare-fun d!37921 () Bool)

(declare-fun c!22915 () Bool)

(assert (=> d!37921 (= c!22915 (and ((_ is Cons!1672) lt!64232) (= (_1!1271 (h!2273 lt!64232)) (_1!1271 (ite (or c!22677 c!22679) (tuple2!2521 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2628 (v!3108 (underlying!436 thiss!992)))) (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 (v!3108 (underlying!436 thiss!992)))))))))))

(assert (=> d!37921 (= (getValueByKey!167 lt!64232 (_1!1271 (ite (or c!22677 c!22679) (tuple2!2521 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2628 (v!3108 (underlying!436 thiss!992)))) (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 (v!3108 (underlying!436 thiss!992))))))) e!82038)))

(declare-fun b!125589 () Bool)

(assert (=> b!125589 (= e!82039 None!171)))

(declare-fun b!125586 () Bool)

(assert (=> b!125586 (= e!82038 (Some!172 (_2!1271 (h!2273 lt!64232))))))

(assert (= (and d!37921 c!22915) b!125586))

(assert (= (and d!37921 (not c!22915)) b!125587))

(assert (= (and b!125587 c!22916) b!125588))

(assert (= (and b!125587 (not c!22916)) b!125589))

(declare-fun m!146393 () Bool)

(assert (=> b!125588 m!146393))

(assert (=> d!37523 d!37921))

(declare-fun d!37923 () Bool)

(assert (=> d!37923 (= (getValueByKey!167 lt!64232 (_1!1271 (ite (or c!22677 c!22679) (tuple2!2521 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2628 (v!3108 (underlying!436 thiss!992)))) (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 (v!3108 (underlying!436 thiss!992))))))) (Some!172 (_2!1271 (ite (or c!22677 c!22679) (tuple2!2521 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2628 (v!3108 (underlying!436 thiss!992)))) (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 (v!3108 (underlying!436 thiss!992))))))))))

(declare-fun lt!64760 () Unit!3871)

(assert (=> d!37923 (= lt!64760 (choose!763 lt!64232 (_1!1271 (ite (or c!22677 c!22679) (tuple2!2521 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2628 (v!3108 (underlying!436 thiss!992)))) (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 (v!3108 (underlying!436 thiss!992)))))) (_2!1271 (ite (or c!22677 c!22679) (tuple2!2521 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2628 (v!3108 (underlying!436 thiss!992)))) (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 (v!3108 (underlying!436 thiss!992))))))))))

(declare-fun e!82040 () Bool)

(assert (=> d!37923 e!82040))

(declare-fun res!60790 () Bool)

(assert (=> d!37923 (=> (not res!60790) (not e!82040))))

(assert (=> d!37923 (= res!60790 (isStrictlySorted!303 lt!64232))))

(assert (=> d!37923 (= (lemmaContainsTupThenGetReturnValue!82 lt!64232 (_1!1271 (ite (or c!22677 c!22679) (tuple2!2521 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2628 (v!3108 (underlying!436 thiss!992)))) (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 (v!3108 (underlying!436 thiss!992)))))) (_2!1271 (ite (or c!22677 c!22679) (tuple2!2521 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2628 (v!3108 (underlying!436 thiss!992)))) (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 (v!3108 (underlying!436 thiss!992))))))) lt!64760)))

(declare-fun b!125590 () Bool)

(declare-fun res!60791 () Bool)

(assert (=> b!125590 (=> (not res!60791) (not e!82040))))

(assert (=> b!125590 (= res!60791 (containsKey!170 lt!64232 (_1!1271 (ite (or c!22677 c!22679) (tuple2!2521 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2628 (v!3108 (underlying!436 thiss!992)))) (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 (v!3108 (underlying!436 thiss!992))))))))))

(declare-fun b!125591 () Bool)

(assert (=> b!125591 (= e!82040 (contains!862 lt!64232 (tuple2!2521 (_1!1271 (ite (or c!22677 c!22679) (tuple2!2521 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2628 (v!3108 (underlying!436 thiss!992)))) (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 (v!3108 (underlying!436 thiss!992)))))) (_2!1271 (ite (or c!22677 c!22679) (tuple2!2521 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2628 (v!3108 (underlying!436 thiss!992)))) (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 (v!3108 (underlying!436 thiss!992)))))))))))

(assert (= (and d!37923 res!60790) b!125590))

(assert (= (and b!125590 res!60791) b!125591))

(assert (=> d!37923 m!145035))

(declare-fun m!146395 () Bool)

(assert (=> d!37923 m!146395))

(declare-fun m!146397 () Bool)

(assert (=> d!37923 m!146397))

(declare-fun m!146399 () Bool)

(assert (=> b!125590 m!146399))

(declare-fun m!146401 () Bool)

(assert (=> b!125591 m!146401))

(assert (=> d!37523 d!37923))

(declare-fun b!125592 () Bool)

(declare-fun e!82041 () List!1676)

(declare-fun call!13426 () List!1676)

(assert (=> b!125592 (= e!82041 call!13426)))

(declare-fun b!125593 () Bool)

(declare-fun c!22917 () Bool)

(assert (=> b!125593 (= c!22917 (and ((_ is Cons!1672) (toList!831 (ite c!22677 call!13273 (ite c!22679 call!13274 call!13270)))) (bvsgt (_1!1271 (h!2273 (toList!831 (ite c!22677 call!13273 (ite c!22679 call!13274 call!13270))))) (_1!1271 (ite (or c!22677 c!22679) (tuple2!2521 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2628 (v!3108 (underlying!436 thiss!992)))) (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 (v!3108 (underlying!436 thiss!992)))))))))))

(declare-fun e!82045 () List!1676)

(assert (=> b!125593 (= e!82045 e!82041)))

(declare-fun b!125594 () Bool)

(declare-fun res!60793 () Bool)

(declare-fun e!82044 () Bool)

(assert (=> b!125594 (=> (not res!60793) (not e!82044))))

(declare-fun lt!64761 () List!1676)

(assert (=> b!125594 (= res!60793 (containsKey!170 lt!64761 (_1!1271 (ite (or c!22677 c!22679) (tuple2!2521 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2628 (v!3108 (underlying!436 thiss!992)))) (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 (v!3108 (underlying!436 thiss!992))))))))))

(declare-fun d!37925 () Bool)

(assert (=> d!37925 e!82044))

(declare-fun res!60792 () Bool)

(assert (=> d!37925 (=> (not res!60792) (not e!82044))))

(assert (=> d!37925 (= res!60792 (isStrictlySorted!303 lt!64761))))

(declare-fun e!82042 () List!1676)

(assert (=> d!37925 (= lt!64761 e!82042)))

(declare-fun c!22919 () Bool)

(assert (=> d!37925 (= c!22919 (and ((_ is Cons!1672) (toList!831 (ite c!22677 call!13273 (ite c!22679 call!13274 call!13270)))) (bvslt (_1!1271 (h!2273 (toList!831 (ite c!22677 call!13273 (ite c!22679 call!13274 call!13270))))) (_1!1271 (ite (or c!22677 c!22679) (tuple2!2521 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2628 (v!3108 (underlying!436 thiss!992)))) (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 (v!3108 (underlying!436 thiss!992)))))))))))

(assert (=> d!37925 (isStrictlySorted!303 (toList!831 (ite c!22677 call!13273 (ite c!22679 call!13274 call!13270))))))

(assert (=> d!37925 (= (insertStrictlySorted!85 (toList!831 (ite c!22677 call!13273 (ite c!22679 call!13274 call!13270))) (_1!1271 (ite (or c!22677 c!22679) (tuple2!2521 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2628 (v!3108 (underlying!436 thiss!992)))) (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 (v!3108 (underlying!436 thiss!992)))))) (_2!1271 (ite (or c!22677 c!22679) (tuple2!2521 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2628 (v!3108 (underlying!436 thiss!992)))) (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 (v!3108 (underlying!436 thiss!992))))))) lt!64761)))

(declare-fun b!125595 () Bool)

(declare-fun call!13424 () List!1676)

(assert (=> b!125595 (= e!82042 call!13424)))

(declare-fun b!125596 () Bool)

(assert (=> b!125596 (= e!82044 (contains!862 lt!64761 (tuple2!2521 (_1!1271 (ite (or c!22677 c!22679) (tuple2!2521 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2628 (v!3108 (underlying!436 thiss!992)))) (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 (v!3108 (underlying!436 thiss!992)))))) (_2!1271 (ite (or c!22677 c!22679) (tuple2!2521 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2628 (v!3108 (underlying!436 thiss!992)))) (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 (v!3108 (underlying!436 thiss!992)))))))))))

(declare-fun e!82043 () List!1676)

(declare-fun bm!13421 () Bool)

(assert (=> bm!13421 (= call!13424 ($colon$colon!87 e!82043 (ite c!22919 (h!2273 (toList!831 (ite c!22677 call!13273 (ite c!22679 call!13274 call!13270)))) (tuple2!2521 (_1!1271 (ite (or c!22677 c!22679) (tuple2!2521 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2628 (v!3108 (underlying!436 thiss!992)))) (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 (v!3108 (underlying!436 thiss!992)))))) (_2!1271 (ite (or c!22677 c!22679) (tuple2!2521 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2628 (v!3108 (underlying!436 thiss!992)))) (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 (v!3108 (underlying!436 thiss!992))))))))))))

(declare-fun c!22920 () Bool)

(assert (=> bm!13421 (= c!22920 c!22919)))

(declare-fun bm!13422 () Bool)

(declare-fun call!13425 () List!1676)

(assert (=> bm!13422 (= call!13425 call!13424)))

(declare-fun bm!13423 () Bool)

(assert (=> bm!13423 (= call!13426 call!13425)))

(declare-fun b!125597 () Bool)

(assert (=> b!125597 (= e!82042 e!82045)))

(declare-fun c!22918 () Bool)

(assert (=> b!125597 (= c!22918 (and ((_ is Cons!1672) (toList!831 (ite c!22677 call!13273 (ite c!22679 call!13274 call!13270)))) (= (_1!1271 (h!2273 (toList!831 (ite c!22677 call!13273 (ite c!22679 call!13274 call!13270))))) (_1!1271 (ite (or c!22677 c!22679) (tuple2!2521 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2628 (v!3108 (underlying!436 thiss!992)))) (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 (v!3108 (underlying!436 thiss!992)))))))))))

(declare-fun b!125598 () Bool)

(assert (=> b!125598 (= e!82041 call!13426)))

(declare-fun b!125599 () Bool)

(assert (=> b!125599 (= e!82043 (ite c!22918 (t!5995 (toList!831 (ite c!22677 call!13273 (ite c!22679 call!13274 call!13270)))) (ite c!22917 (Cons!1672 (h!2273 (toList!831 (ite c!22677 call!13273 (ite c!22679 call!13274 call!13270)))) (t!5995 (toList!831 (ite c!22677 call!13273 (ite c!22679 call!13274 call!13270))))) Nil!1673)))))

(declare-fun b!125600 () Bool)

(assert (=> b!125600 (= e!82043 (insertStrictlySorted!85 (t!5995 (toList!831 (ite c!22677 call!13273 (ite c!22679 call!13274 call!13270)))) (_1!1271 (ite (or c!22677 c!22679) (tuple2!2521 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2628 (v!3108 (underlying!436 thiss!992)))) (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 (v!3108 (underlying!436 thiss!992)))))) (_2!1271 (ite (or c!22677 c!22679) (tuple2!2521 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2628 (v!3108 (underlying!436 thiss!992)))) (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 (v!3108 (underlying!436 thiss!992))))))))))

(declare-fun b!125601 () Bool)

(assert (=> b!125601 (= e!82045 call!13425)))

(assert (= (and d!37925 c!22919) b!125595))

(assert (= (and d!37925 (not c!22919)) b!125597))

(assert (= (and b!125597 c!22918) b!125601))

(assert (= (and b!125597 (not c!22918)) b!125593))

(assert (= (and b!125593 c!22917) b!125592))

(assert (= (and b!125593 (not c!22917)) b!125598))

(assert (= (or b!125592 b!125598) bm!13423))

(assert (= (or b!125601 bm!13423) bm!13422))

(assert (= (or b!125595 bm!13422) bm!13421))

(assert (= (and bm!13421 c!22920) b!125600))

(assert (= (and bm!13421 (not c!22920)) b!125599))

(assert (= (and d!37925 res!60792) b!125594))

(assert (= (and b!125594 res!60793) b!125596))

(declare-fun m!146403 () Bool)

(assert (=> d!37925 m!146403))

(declare-fun m!146405 () Bool)

(assert (=> d!37925 m!146405))

(declare-fun m!146407 () Bool)

(assert (=> bm!13421 m!146407))

(declare-fun m!146409 () Bool)

(assert (=> b!125596 m!146409))

(declare-fun m!146411 () Bool)

(assert (=> b!125594 m!146411))

(declare-fun m!146413 () Bool)

(assert (=> b!125600 m!146413))

(assert (=> d!37523 d!37925))

(declare-fun d!37927 () Bool)

(assert (=> d!37927 (contains!861 (getCurrentListMap!511 (_keys!4492 newMap!16) lt!64198 (mask!7009 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16)) (select (arr!2210 (_keys!4492 newMap!16)) (index!3207 lt!64214)))))

(assert (=> d!37927 true))

(declare-fun _$16!139 () Unit!3871)

(assert (=> d!37927 (= (choose!758 (_keys!4492 newMap!16) lt!64198 (mask!7009 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) (index!3207 lt!64214) (defaultEntry!2763 newMap!16)) _$16!139)))

(declare-fun bs!5226 () Bool)

(assert (= bs!5226 d!37927))

(assert (=> bs!5226 m!145519))

(assert (=> bs!5226 m!144993))

(assert (=> bs!5226 m!145519))

(assert (=> bs!5226 m!144993))

(assert (=> bs!5226 m!145521))

(assert (=> d!37611 d!37927))

(assert (=> d!37611 d!37771))

(declare-fun b!125602 () Bool)

(declare-fun e!82046 () (_ BitVec 32))

(declare-fun e!82047 () (_ BitVec 32))

(assert (=> b!125602 (= e!82046 e!82047)))

(declare-fun c!22921 () Bool)

(assert (=> b!125602 (= c!22921 (validKeyInArray!0 (select (arr!2210 (_keys!4492 (_2!1272 lt!64219))) #b00000000000000000000000000000000)))))

(declare-fun b!125603 () Bool)

(declare-fun call!13427 () (_ BitVec 32))

(assert (=> b!125603 (= e!82047 (bvadd #b00000000000000000000000000000001 call!13427))))

(declare-fun b!125604 () Bool)

(assert (=> b!125604 (= e!82046 #b00000000000000000000000000000000)))

(declare-fun b!125605 () Bool)

(assert (=> b!125605 (= e!82047 call!13427)))

(declare-fun bm!13424 () Bool)

(assert (=> bm!13424 (= call!13427 (arrayCountValidKeys!0 (_keys!4492 (_2!1272 lt!64219)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2473 (_keys!4492 (_2!1272 lt!64219)))))))

(declare-fun d!37929 () Bool)

(declare-fun lt!64762 () (_ BitVec 32))

(assert (=> d!37929 (and (bvsge lt!64762 #b00000000000000000000000000000000) (bvsle lt!64762 (bvsub (size!2473 (_keys!4492 (_2!1272 lt!64219))) #b00000000000000000000000000000000)))))

(assert (=> d!37929 (= lt!64762 e!82046)))

(declare-fun c!22922 () Bool)

(assert (=> d!37929 (= c!22922 (bvsge #b00000000000000000000000000000000 (size!2473 (_keys!4492 (_2!1272 lt!64219)))))))

(assert (=> d!37929 (and (bvsle #b00000000000000000000000000000000 (size!2473 (_keys!4492 (_2!1272 lt!64219)))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!2473 (_keys!4492 (_2!1272 lt!64219))) (size!2473 (_keys!4492 (_2!1272 lt!64219)))))))

(assert (=> d!37929 (= (arrayCountValidKeys!0 (_keys!4492 (_2!1272 lt!64219)) #b00000000000000000000000000000000 (size!2473 (_keys!4492 (_2!1272 lt!64219)))) lt!64762)))

(assert (= (and d!37929 c!22922) b!125604))

(assert (= (and d!37929 (not c!22922)) b!125602))

(assert (= (and b!125602 c!22921) b!125603))

(assert (= (and b!125602 (not c!22921)) b!125605))

(assert (= (or b!125603 b!125605) bm!13424))

(assert (=> b!125602 m!145595))

(assert (=> b!125602 m!145595))

(assert (=> b!125602 m!145601))

(declare-fun m!146415 () Bool)

(assert (=> bm!13424 m!146415))

(assert (=> b!125114 d!37929))

(declare-fun lt!64763 () Bool)

(declare-fun d!37931 () Bool)

(assert (=> d!37931 (= lt!64763 (select (content!124 (toList!831 lt!64304)) (tuple2!2521 lt!64124 (zeroValue!2628 (v!3108 (underlying!436 thiss!992))))))))

(declare-fun e!82048 () Bool)

(assert (=> d!37931 (= lt!64763 e!82048)))

(declare-fun res!60794 () Bool)

(assert (=> d!37931 (=> (not res!60794) (not e!82048))))

(assert (=> d!37931 (= res!60794 ((_ is Cons!1672) (toList!831 lt!64304)))))

(assert (=> d!37931 (= (contains!862 (toList!831 lt!64304) (tuple2!2521 lt!64124 (zeroValue!2628 (v!3108 (underlying!436 thiss!992))))) lt!64763)))

(declare-fun b!125606 () Bool)

(declare-fun e!82049 () Bool)

(assert (=> b!125606 (= e!82048 e!82049)))

(declare-fun res!60795 () Bool)

(assert (=> b!125606 (=> res!60795 e!82049)))

(assert (=> b!125606 (= res!60795 (= (h!2273 (toList!831 lt!64304)) (tuple2!2521 lt!64124 (zeroValue!2628 (v!3108 (underlying!436 thiss!992))))))))

(declare-fun b!125607 () Bool)

(assert (=> b!125607 (= e!82049 (contains!862 (t!5995 (toList!831 lt!64304)) (tuple2!2521 lt!64124 (zeroValue!2628 (v!3108 (underlying!436 thiss!992))))))))

(assert (= (and d!37931 res!60794) b!125606))

(assert (= (and b!125606 (not res!60795)) b!125607))

(declare-fun m!146417 () Bool)

(assert (=> d!37931 m!146417))

(declare-fun m!146419 () Bool)

(assert (=> d!37931 m!146419))

(declare-fun m!146421 () Bool)

(assert (=> b!125607 m!146421))

(assert (=> b!125022 d!37931))

(assert (=> bm!13394 d!37589))

(declare-fun d!37933 () Bool)

(declare-fun e!82050 () Bool)

(assert (=> d!37933 e!82050))

(declare-fun res!60796 () Bool)

(assert (=> d!37933 (=> res!60796 e!82050)))

(declare-fun lt!64764 () Bool)

(assert (=> d!37933 (= res!60796 (not lt!64764))))

(declare-fun lt!64767 () Bool)

(assert (=> d!37933 (= lt!64764 lt!64767)))

(declare-fun lt!64766 () Unit!3871)

(declare-fun e!82051 () Unit!3871)

(assert (=> d!37933 (= lt!64766 e!82051)))

(declare-fun c!22923 () Bool)

(assert (=> d!37933 (= c!22923 lt!64767)))

(assert (=> d!37933 (= lt!64767 (containsKey!170 (toList!831 lt!64312) (_1!1271 (tuple2!2521 lt!64125 (minValue!2628 (v!3108 (underlying!436 thiss!992)))))))))

(assert (=> d!37933 (= (contains!861 lt!64312 (_1!1271 (tuple2!2521 lt!64125 (minValue!2628 (v!3108 (underlying!436 thiss!992)))))) lt!64764)))

(declare-fun b!125608 () Bool)

(declare-fun lt!64765 () Unit!3871)

(assert (=> b!125608 (= e!82051 lt!64765)))

(assert (=> b!125608 (= lt!64765 (lemmaContainsKeyImpliesGetValueByKeyDefined!118 (toList!831 lt!64312) (_1!1271 (tuple2!2521 lt!64125 (minValue!2628 (v!3108 (underlying!436 thiss!992)))))))))

(assert (=> b!125608 (isDefined!119 (getValueByKey!167 (toList!831 lt!64312) (_1!1271 (tuple2!2521 lt!64125 (minValue!2628 (v!3108 (underlying!436 thiss!992)))))))))

(declare-fun b!125609 () Bool)

(declare-fun Unit!3907 () Unit!3871)

(assert (=> b!125609 (= e!82051 Unit!3907)))

(declare-fun b!125610 () Bool)

(assert (=> b!125610 (= e!82050 (isDefined!119 (getValueByKey!167 (toList!831 lt!64312) (_1!1271 (tuple2!2521 lt!64125 (minValue!2628 (v!3108 (underlying!436 thiss!992))))))))))

(assert (= (and d!37933 c!22923) b!125608))

(assert (= (and d!37933 (not c!22923)) b!125609))

(assert (= (and d!37933 (not res!60796)) b!125610))

(declare-fun m!146423 () Bool)

(assert (=> d!37933 m!146423))

(declare-fun m!146425 () Bool)

(assert (=> b!125608 m!146425))

(assert (=> b!125608 m!145229))

(assert (=> b!125608 m!145229))

(declare-fun m!146427 () Bool)

(assert (=> b!125608 m!146427))

(assert (=> b!125610 m!145229))

(assert (=> b!125610 m!145229))

(assert (=> b!125610 m!146427))

(assert (=> d!37571 d!37933))

(declare-fun b!125612 () Bool)

(declare-fun e!82052 () Option!173)

(declare-fun e!82053 () Option!173)

(assert (=> b!125612 (= e!82052 e!82053)))

(declare-fun c!22925 () Bool)

(assert (=> b!125612 (= c!22925 (and ((_ is Cons!1672) lt!64313) (not (= (_1!1271 (h!2273 lt!64313)) (_1!1271 (tuple2!2521 lt!64125 (minValue!2628 (v!3108 (underlying!436 thiss!992)))))))))))

(declare-fun b!125613 () Bool)

(assert (=> b!125613 (= e!82053 (getValueByKey!167 (t!5995 lt!64313) (_1!1271 (tuple2!2521 lt!64125 (minValue!2628 (v!3108 (underlying!436 thiss!992)))))))))

(declare-fun c!22924 () Bool)

(declare-fun d!37935 () Bool)

(assert (=> d!37935 (= c!22924 (and ((_ is Cons!1672) lt!64313) (= (_1!1271 (h!2273 lt!64313)) (_1!1271 (tuple2!2521 lt!64125 (minValue!2628 (v!3108 (underlying!436 thiss!992))))))))))

(assert (=> d!37935 (= (getValueByKey!167 lt!64313 (_1!1271 (tuple2!2521 lt!64125 (minValue!2628 (v!3108 (underlying!436 thiss!992)))))) e!82052)))

(declare-fun b!125614 () Bool)

(assert (=> b!125614 (= e!82053 None!171)))

(declare-fun b!125611 () Bool)

(assert (=> b!125611 (= e!82052 (Some!172 (_2!1271 (h!2273 lt!64313))))))

(assert (= (and d!37935 c!22924) b!125611))

(assert (= (and d!37935 (not c!22924)) b!125612))

(assert (= (and b!125612 c!22925) b!125613))

(assert (= (and b!125612 (not c!22925)) b!125614))

(declare-fun m!146429 () Bool)

(assert (=> b!125613 m!146429))

(assert (=> d!37571 d!37935))

(declare-fun d!37937 () Bool)

(assert (=> d!37937 (= (getValueByKey!167 lt!64313 (_1!1271 (tuple2!2521 lt!64125 (minValue!2628 (v!3108 (underlying!436 thiss!992)))))) (Some!172 (_2!1271 (tuple2!2521 lt!64125 (minValue!2628 (v!3108 (underlying!436 thiss!992)))))))))

(declare-fun lt!64768 () Unit!3871)

(assert (=> d!37937 (= lt!64768 (choose!763 lt!64313 (_1!1271 (tuple2!2521 lt!64125 (minValue!2628 (v!3108 (underlying!436 thiss!992))))) (_2!1271 (tuple2!2521 lt!64125 (minValue!2628 (v!3108 (underlying!436 thiss!992)))))))))

(declare-fun e!82054 () Bool)

(assert (=> d!37937 e!82054))

(declare-fun res!60797 () Bool)

(assert (=> d!37937 (=> (not res!60797) (not e!82054))))

(assert (=> d!37937 (= res!60797 (isStrictlySorted!303 lt!64313))))

(assert (=> d!37937 (= (lemmaContainsTupThenGetReturnValue!82 lt!64313 (_1!1271 (tuple2!2521 lt!64125 (minValue!2628 (v!3108 (underlying!436 thiss!992))))) (_2!1271 (tuple2!2521 lt!64125 (minValue!2628 (v!3108 (underlying!436 thiss!992)))))) lt!64768)))

(declare-fun b!125615 () Bool)

(declare-fun res!60798 () Bool)

(assert (=> b!125615 (=> (not res!60798) (not e!82054))))

(assert (=> b!125615 (= res!60798 (containsKey!170 lt!64313 (_1!1271 (tuple2!2521 lt!64125 (minValue!2628 (v!3108 (underlying!436 thiss!992)))))))))

(declare-fun b!125616 () Bool)

(assert (=> b!125616 (= e!82054 (contains!862 lt!64313 (tuple2!2521 (_1!1271 (tuple2!2521 lt!64125 (minValue!2628 (v!3108 (underlying!436 thiss!992))))) (_2!1271 (tuple2!2521 lt!64125 (minValue!2628 (v!3108 (underlying!436 thiss!992))))))))))

(assert (= (and d!37937 res!60797) b!125615))

(assert (= (and b!125615 res!60798) b!125616))

(assert (=> d!37937 m!145223))

(declare-fun m!146431 () Bool)

(assert (=> d!37937 m!146431))

(declare-fun m!146433 () Bool)

(assert (=> d!37937 m!146433))

(declare-fun m!146435 () Bool)

(assert (=> b!125615 m!146435))

(declare-fun m!146437 () Bool)

(assert (=> b!125616 m!146437))

(assert (=> d!37571 d!37937))

(declare-fun b!125617 () Bool)

(declare-fun e!82055 () List!1676)

(declare-fun call!13430 () List!1676)

(assert (=> b!125617 (= e!82055 call!13430)))

(declare-fun b!125618 () Bool)

(declare-fun c!22926 () Bool)

(assert (=> b!125618 (= c!22926 (and ((_ is Cons!1672) (toList!831 lt!64116)) (bvsgt (_1!1271 (h!2273 (toList!831 lt!64116))) (_1!1271 (tuple2!2521 lt!64125 (minValue!2628 (v!3108 (underlying!436 thiss!992))))))))))

(declare-fun e!82059 () List!1676)

(assert (=> b!125618 (= e!82059 e!82055)))

(declare-fun b!125619 () Bool)

(declare-fun res!60800 () Bool)

(declare-fun e!82058 () Bool)

(assert (=> b!125619 (=> (not res!60800) (not e!82058))))

(declare-fun lt!64769 () List!1676)

(assert (=> b!125619 (= res!60800 (containsKey!170 lt!64769 (_1!1271 (tuple2!2521 lt!64125 (minValue!2628 (v!3108 (underlying!436 thiss!992)))))))))

(declare-fun d!37939 () Bool)

(assert (=> d!37939 e!82058))

(declare-fun res!60799 () Bool)

(assert (=> d!37939 (=> (not res!60799) (not e!82058))))

(assert (=> d!37939 (= res!60799 (isStrictlySorted!303 lt!64769))))

(declare-fun e!82056 () List!1676)

(assert (=> d!37939 (= lt!64769 e!82056)))

(declare-fun c!22928 () Bool)

(assert (=> d!37939 (= c!22928 (and ((_ is Cons!1672) (toList!831 lt!64116)) (bvslt (_1!1271 (h!2273 (toList!831 lt!64116))) (_1!1271 (tuple2!2521 lt!64125 (minValue!2628 (v!3108 (underlying!436 thiss!992))))))))))

(assert (=> d!37939 (isStrictlySorted!303 (toList!831 lt!64116))))

(assert (=> d!37939 (= (insertStrictlySorted!85 (toList!831 lt!64116) (_1!1271 (tuple2!2521 lt!64125 (minValue!2628 (v!3108 (underlying!436 thiss!992))))) (_2!1271 (tuple2!2521 lt!64125 (minValue!2628 (v!3108 (underlying!436 thiss!992)))))) lt!64769)))

(declare-fun b!125620 () Bool)

(declare-fun call!13428 () List!1676)

(assert (=> b!125620 (= e!82056 call!13428)))

(declare-fun b!125621 () Bool)

(assert (=> b!125621 (= e!82058 (contains!862 lt!64769 (tuple2!2521 (_1!1271 (tuple2!2521 lt!64125 (minValue!2628 (v!3108 (underlying!436 thiss!992))))) (_2!1271 (tuple2!2521 lt!64125 (minValue!2628 (v!3108 (underlying!436 thiss!992))))))))))

(declare-fun e!82057 () List!1676)

(declare-fun bm!13425 () Bool)

(assert (=> bm!13425 (= call!13428 ($colon$colon!87 e!82057 (ite c!22928 (h!2273 (toList!831 lt!64116)) (tuple2!2521 (_1!1271 (tuple2!2521 lt!64125 (minValue!2628 (v!3108 (underlying!436 thiss!992))))) (_2!1271 (tuple2!2521 lt!64125 (minValue!2628 (v!3108 (underlying!436 thiss!992)))))))))))

(declare-fun c!22929 () Bool)

(assert (=> bm!13425 (= c!22929 c!22928)))

(declare-fun bm!13426 () Bool)

(declare-fun call!13429 () List!1676)

(assert (=> bm!13426 (= call!13429 call!13428)))

(declare-fun bm!13427 () Bool)

(assert (=> bm!13427 (= call!13430 call!13429)))

(declare-fun b!125622 () Bool)

(assert (=> b!125622 (= e!82056 e!82059)))

(declare-fun c!22927 () Bool)

(assert (=> b!125622 (= c!22927 (and ((_ is Cons!1672) (toList!831 lt!64116)) (= (_1!1271 (h!2273 (toList!831 lt!64116))) (_1!1271 (tuple2!2521 lt!64125 (minValue!2628 (v!3108 (underlying!436 thiss!992))))))))))

(declare-fun b!125623 () Bool)

(assert (=> b!125623 (= e!82055 call!13430)))

(declare-fun b!125624 () Bool)

(assert (=> b!125624 (= e!82057 (ite c!22927 (t!5995 (toList!831 lt!64116)) (ite c!22926 (Cons!1672 (h!2273 (toList!831 lt!64116)) (t!5995 (toList!831 lt!64116))) Nil!1673)))))

(declare-fun b!125625 () Bool)

(assert (=> b!125625 (= e!82057 (insertStrictlySorted!85 (t!5995 (toList!831 lt!64116)) (_1!1271 (tuple2!2521 lt!64125 (minValue!2628 (v!3108 (underlying!436 thiss!992))))) (_2!1271 (tuple2!2521 lt!64125 (minValue!2628 (v!3108 (underlying!436 thiss!992)))))))))

(declare-fun b!125626 () Bool)

(assert (=> b!125626 (= e!82059 call!13429)))

(assert (= (and d!37939 c!22928) b!125620))

(assert (= (and d!37939 (not c!22928)) b!125622))

(assert (= (and b!125622 c!22927) b!125626))

(assert (= (and b!125622 (not c!22927)) b!125618))

(assert (= (and b!125618 c!22926) b!125617))

(assert (= (and b!125618 (not c!22926)) b!125623))

(assert (= (or b!125617 b!125623) bm!13427))

(assert (= (or b!125626 bm!13427) bm!13426))

(assert (= (or b!125620 bm!13426) bm!13425))

(assert (= (and bm!13425 c!22929) b!125625))

(assert (= (and bm!13425 (not c!22929)) b!125624))

(assert (= (and d!37939 res!60799) b!125619))

(assert (= (and b!125619 res!60800) b!125621))

(declare-fun m!146439 () Bool)

(assert (=> d!37939 m!146439))

(declare-fun m!146441 () Bool)

(assert (=> d!37939 m!146441))

(declare-fun m!146443 () Bool)

(assert (=> bm!13425 m!146443))

(declare-fun m!146445 () Bool)

(assert (=> b!125621 m!146445))

(declare-fun m!146447 () Bool)

(assert (=> b!125619 m!146447))

(declare-fun m!146449 () Bool)

(assert (=> b!125625 m!146449))

(assert (=> d!37571 d!37939))

(declare-fun d!37941 () Bool)

(declare-fun res!60801 () Bool)

(declare-fun e!82060 () Bool)

(assert (=> d!37941 (=> res!60801 e!82060)))

(assert (=> d!37941 (= res!60801 (and ((_ is Cons!1672) (toList!831 (+!163 lt!64122 (tuple2!2521 lt!64114 (zeroValue!2628 (v!3108 (underlying!436 thiss!992))))))) (= (_1!1271 (h!2273 (toList!831 (+!163 lt!64122 (tuple2!2521 lt!64114 (zeroValue!2628 (v!3108 (underlying!436 thiss!992)))))))) lt!64109)))))

(assert (=> d!37941 (= (containsKey!170 (toList!831 (+!163 lt!64122 (tuple2!2521 lt!64114 (zeroValue!2628 (v!3108 (underlying!436 thiss!992)))))) lt!64109) e!82060)))

(declare-fun b!125627 () Bool)

(declare-fun e!82061 () Bool)

(assert (=> b!125627 (= e!82060 e!82061)))

(declare-fun res!60802 () Bool)

(assert (=> b!125627 (=> (not res!60802) (not e!82061))))

(assert (=> b!125627 (= res!60802 (and (or (not ((_ is Cons!1672) (toList!831 (+!163 lt!64122 (tuple2!2521 lt!64114 (zeroValue!2628 (v!3108 (underlying!436 thiss!992)))))))) (bvsle (_1!1271 (h!2273 (toList!831 (+!163 lt!64122 (tuple2!2521 lt!64114 (zeroValue!2628 (v!3108 (underlying!436 thiss!992)))))))) lt!64109)) ((_ is Cons!1672) (toList!831 (+!163 lt!64122 (tuple2!2521 lt!64114 (zeroValue!2628 (v!3108 (underlying!436 thiss!992))))))) (bvslt (_1!1271 (h!2273 (toList!831 (+!163 lt!64122 (tuple2!2521 lt!64114 (zeroValue!2628 (v!3108 (underlying!436 thiss!992)))))))) lt!64109)))))

(declare-fun b!125628 () Bool)

(assert (=> b!125628 (= e!82061 (containsKey!170 (t!5995 (toList!831 (+!163 lt!64122 (tuple2!2521 lt!64114 (zeroValue!2628 (v!3108 (underlying!436 thiss!992))))))) lt!64109))))

(assert (= (and d!37941 (not res!60801)) b!125627))

(assert (= (and b!125627 res!60802) b!125628))

(declare-fun m!146451 () Bool)

(assert (=> b!125628 m!146451))

(assert (=> d!37569 d!37941))

(declare-fun d!37943 () Bool)

(declare-fun e!82062 () Bool)

(assert (=> d!37943 e!82062))

(declare-fun res!60803 () Bool)

(assert (=> d!37943 (=> res!60803 e!82062)))

(declare-fun lt!64770 () Bool)

(assert (=> d!37943 (= res!60803 (not lt!64770))))

(declare-fun lt!64773 () Bool)

(assert (=> d!37943 (= lt!64770 lt!64773)))

(declare-fun lt!64772 () Unit!3871)

(declare-fun e!82063 () Unit!3871)

(assert (=> d!37943 (= lt!64772 e!82063)))

(declare-fun c!22930 () Bool)

(assert (=> d!37943 (= c!22930 lt!64773)))

(assert (=> d!37943 (= lt!64773 (containsKey!170 (toList!831 lt!64381) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!37943 (= (contains!861 lt!64381 #b0000000000000000000000000000000000000000000000000000000000000000) lt!64770)))

(declare-fun b!125629 () Bool)

(declare-fun lt!64771 () Unit!3871)

(assert (=> b!125629 (= e!82063 lt!64771)))

(assert (=> b!125629 (= lt!64771 (lemmaContainsKeyImpliesGetValueByKeyDefined!118 (toList!831 lt!64381) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!125629 (isDefined!119 (getValueByKey!167 (toList!831 lt!64381) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!125630 () Bool)

(declare-fun Unit!3908 () Unit!3871)

(assert (=> b!125630 (= e!82063 Unit!3908)))

(declare-fun b!125631 () Bool)

(assert (=> b!125631 (= e!82062 (isDefined!119 (getValueByKey!167 (toList!831 lt!64381) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!37943 c!22930) b!125629))

(assert (= (and d!37943 (not c!22930)) b!125630))

(assert (= (and d!37943 (not res!60803)) b!125631))

(declare-fun m!146453 () Bool)

(assert (=> d!37943 m!146453))

(declare-fun m!146455 () Bool)

(assert (=> b!125629 m!146455))

(assert (=> b!125629 m!146073))

(assert (=> b!125629 m!146073))

(declare-fun m!146457 () Bool)

(assert (=> b!125629 m!146457))

(assert (=> b!125631 m!146073))

(assert (=> b!125631 m!146073))

(assert (=> b!125631 m!146457))

(assert (=> bm!13380 d!37943))

(assert (=> b!125093 d!37633))

(declare-fun d!37945 () Bool)

(declare-fun lt!64774 () Bool)

(assert (=> d!37945 (= lt!64774 (select (content!124 (toList!831 lt!64316)) (ite c!22717 (ite c!22710 (tuple2!2521 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2521 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!82064 () Bool)

(assert (=> d!37945 (= lt!64774 e!82064)))

(declare-fun res!60804 () Bool)

(assert (=> d!37945 (=> (not res!60804) (not e!82064))))

(assert (=> d!37945 (= res!60804 ((_ is Cons!1672) (toList!831 lt!64316)))))

(assert (=> d!37945 (= (contains!862 (toList!831 lt!64316) (ite c!22717 (ite c!22710 (tuple2!2521 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2521 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) lt!64774)))

(declare-fun b!125632 () Bool)

(declare-fun e!82065 () Bool)

(assert (=> b!125632 (= e!82064 e!82065)))

(declare-fun res!60805 () Bool)

(assert (=> b!125632 (=> res!60805 e!82065)))

(assert (=> b!125632 (= res!60805 (= (h!2273 (toList!831 lt!64316)) (ite c!22717 (ite c!22710 (tuple2!2521 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2521 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!125633 () Bool)

(assert (=> b!125633 (= e!82065 (contains!862 (t!5995 (toList!831 lt!64316)) (ite c!22717 (ite c!22710 (tuple2!2521 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2521 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (= (and d!37945 res!60804) b!125632))

(assert (= (and b!125632 (not res!60805)) b!125633))

(declare-fun m!146459 () Bool)

(assert (=> d!37945 m!146459))

(declare-fun m!146461 () Bool)

(assert (=> d!37945 m!146461))

(declare-fun m!146463 () Bool)

(assert (=> b!125633 m!146463))

(assert (=> b!125029 d!37945))

(declare-fun d!37947 () Bool)

(assert (=> d!37947 (isDefined!119 (getValueByKey!167 (toList!831 lt!64108) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!64775 () Unit!3871)

(assert (=> d!37947 (= lt!64775 (choose!762 (toList!831 lt!64108) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!82066 () Bool)

(assert (=> d!37947 e!82066))

(declare-fun res!60806 () Bool)

(assert (=> d!37947 (=> (not res!60806) (not e!82066))))

(assert (=> d!37947 (= res!60806 (isStrictlySorted!303 (toList!831 lt!64108)))))

(assert (=> d!37947 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!118 (toList!831 lt!64108) #b1000000000000000000000000000000000000000000000000000000000000000) lt!64775)))

(declare-fun b!125634 () Bool)

(assert (=> b!125634 (= e!82066 (containsKey!170 (toList!831 lt!64108) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!37947 res!60806) b!125634))

(assert (=> d!37947 m!145377))

(assert (=> d!37947 m!145377))

(assert (=> d!37947 m!145379))

(declare-fun m!146465 () Bool)

(assert (=> d!37947 m!146465))

(assert (=> d!37947 m!146001))

(assert (=> b!125634 m!145373))

(assert (=> b!125111 d!37947))

(assert (=> b!125111 d!37663))

(assert (=> b!125111 d!37665))

(declare-fun d!37949 () Bool)

(declare-fun e!82067 () Bool)

(assert (=> d!37949 e!82067))

(declare-fun res!60807 () Bool)

(assert (=> d!37949 (=> res!60807 e!82067)))

(declare-fun lt!64776 () Bool)

(assert (=> d!37949 (= res!60807 (not lt!64776))))

(declare-fun lt!64779 () Bool)

(assert (=> d!37949 (= lt!64776 lt!64779)))

(declare-fun lt!64778 () Unit!3871)

(declare-fun e!82068 () Unit!3871)

(assert (=> d!37949 (= lt!64778 e!82068)))

(declare-fun c!22931 () Bool)

(assert (=> d!37949 (= c!22931 lt!64779)))

(assert (=> d!37949 (= lt!64779 (containsKey!170 (toList!831 lt!64289) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!37949 (= (contains!861 lt!64289 #b0000000000000000000000000000000000000000000000000000000000000000) lt!64776)))

(declare-fun b!125635 () Bool)

(declare-fun lt!64777 () Unit!3871)

(assert (=> b!125635 (= e!82068 lt!64777)))

(assert (=> b!125635 (= lt!64777 (lemmaContainsKeyImpliesGetValueByKeyDefined!118 (toList!831 lt!64289) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!125635 (isDefined!119 (getValueByKey!167 (toList!831 lt!64289) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!125636 () Bool)

(declare-fun Unit!3909 () Unit!3871)

(assert (=> b!125636 (= e!82068 Unit!3909)))

(declare-fun b!125637 () Bool)

(assert (=> b!125637 (= e!82067 (isDefined!119 (getValueByKey!167 (toList!831 lt!64289) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!37949 c!22931) b!125635))

(assert (= (and d!37949 (not c!22931)) b!125636))

(assert (= (and d!37949 (not res!60807)) b!125637))

(declare-fun m!146467 () Bool)

(assert (=> d!37949 m!146467))

(declare-fun m!146469 () Bool)

(assert (=> b!125635 m!146469))

(declare-fun m!146471 () Bool)

(assert (=> b!125635 m!146471))

(assert (=> b!125635 m!146471))

(declare-fun m!146473 () Bool)

(assert (=> b!125635 m!146473))

(assert (=> b!125637 m!146471))

(assert (=> b!125637 m!146471))

(assert (=> b!125637 m!146473))

(assert (=> d!37551 d!37949))

(assert (=> d!37551 d!37509))

(declare-fun lt!64780 () Bool)

(declare-fun d!37951 () Bool)

(assert (=> d!37951 (= lt!64780 (select (content!124 (toList!831 lt!64267)) (tuple2!2521 lt!64114 (zeroValue!2628 (v!3108 (underlying!436 thiss!992))))))))

(declare-fun e!82069 () Bool)

(assert (=> d!37951 (= lt!64780 e!82069)))

(declare-fun res!60808 () Bool)

(assert (=> d!37951 (=> (not res!60808) (not e!82069))))

(assert (=> d!37951 (= res!60808 ((_ is Cons!1672) (toList!831 lt!64267)))))

(assert (=> d!37951 (= (contains!862 (toList!831 lt!64267) (tuple2!2521 lt!64114 (zeroValue!2628 (v!3108 (underlying!436 thiss!992))))) lt!64780)))

(declare-fun b!125638 () Bool)

(declare-fun e!82070 () Bool)

(assert (=> b!125638 (= e!82069 e!82070)))

(declare-fun res!60809 () Bool)

(assert (=> b!125638 (=> res!60809 e!82070)))

(assert (=> b!125638 (= res!60809 (= (h!2273 (toList!831 lt!64267)) (tuple2!2521 lt!64114 (zeroValue!2628 (v!3108 (underlying!436 thiss!992))))))))

(declare-fun b!125639 () Bool)

(assert (=> b!125639 (= e!82070 (contains!862 (t!5995 (toList!831 lt!64267)) (tuple2!2521 lt!64114 (zeroValue!2628 (v!3108 (underlying!436 thiss!992))))))))

(assert (= (and d!37951 res!60808) b!125638))

(assert (= (and b!125638 (not res!60809)) b!125639))

(declare-fun m!146475 () Bool)

(assert (=> d!37951 m!146475))

(declare-fun m!146477 () Bool)

(assert (=> d!37951 m!146477))

(declare-fun m!146479 () Bool)

(assert (=> b!125639 m!146479))

(assert (=> b!124975 d!37951))

(assert (=> d!37585 d!37771))

(declare-fun d!37953 () Bool)

(declare-fun res!60810 () Bool)

(declare-fun e!82071 () Bool)

(assert (=> d!37953 (=> (not res!60810) (not e!82071))))

(assert (=> d!37953 (= res!60810 (simpleValid!86 (_2!1272 lt!64480)))))

(assert (=> d!37953 (= (valid!515 (_2!1272 lt!64480)) e!82071)))

(declare-fun b!125640 () Bool)

(declare-fun res!60811 () Bool)

(assert (=> b!125640 (=> (not res!60811) (not e!82071))))

(assert (=> b!125640 (= res!60811 (= (arrayCountValidKeys!0 (_keys!4492 (_2!1272 lt!64480)) #b00000000000000000000000000000000 (size!2473 (_keys!4492 (_2!1272 lt!64480)))) (_size!576 (_2!1272 lt!64480))))))

(declare-fun b!125641 () Bool)

(declare-fun res!60812 () Bool)

(assert (=> b!125641 (=> (not res!60812) (not e!82071))))

(assert (=> b!125641 (= res!60812 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4492 (_2!1272 lt!64480)) (mask!7009 (_2!1272 lt!64480))))))

(declare-fun b!125642 () Bool)

(assert (=> b!125642 (= e!82071 (arrayNoDuplicates!0 (_keys!4492 (_2!1272 lt!64480)) #b00000000000000000000000000000000 Nil!1674))))

(assert (= (and d!37953 res!60810) b!125640))

(assert (= (and b!125640 res!60811) b!125641))

(assert (= (and b!125641 res!60812) b!125642))

(declare-fun m!146481 () Bool)

(assert (=> d!37953 m!146481))

(declare-fun m!146483 () Bool)

(assert (=> b!125640 m!146483))

(declare-fun m!146485 () Bool)

(assert (=> b!125641 m!146485))

(declare-fun m!146487 () Bool)

(assert (=> b!125642 m!146487))

(assert (=> b!125180 d!37953))

(declare-fun d!37955 () Bool)

(declare-fun e!82072 () Bool)

(assert (=> d!37955 e!82072))

(declare-fun res!60813 () Bool)

(assert (=> d!37955 (=> res!60813 e!82072)))

(declare-fun lt!64781 () Bool)

(assert (=> d!37955 (= res!60813 (not lt!64781))))

(declare-fun lt!64784 () Bool)

(assert (=> d!37955 (= lt!64781 lt!64784)))

(declare-fun lt!64783 () Unit!3871)

(declare-fun e!82073 () Unit!3871)

(assert (=> d!37955 (= lt!64783 e!82073)))

(declare-fun c!22932 () Bool)

(assert (=> d!37955 (= c!22932 lt!64784)))

(assert (=> d!37955 (= lt!64784 (containsKey!170 (toList!831 lt!64381) (select (arr!2210 (_keys!4492 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> d!37955 (= (contains!861 lt!64381 (select (arr!2210 (_keys!4492 newMap!16)) #b00000000000000000000000000000000)) lt!64781)))

(declare-fun b!125643 () Bool)

(declare-fun lt!64782 () Unit!3871)

(assert (=> b!125643 (= e!82073 lt!64782)))

(assert (=> b!125643 (= lt!64782 (lemmaContainsKeyImpliesGetValueByKeyDefined!118 (toList!831 lt!64381) (select (arr!2210 (_keys!4492 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!125643 (isDefined!119 (getValueByKey!167 (toList!831 lt!64381) (select (arr!2210 (_keys!4492 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!125644 () Bool)

(declare-fun Unit!3910 () Unit!3871)

(assert (=> b!125644 (= e!82073 Unit!3910)))

(declare-fun b!125645 () Bool)

(assert (=> b!125645 (= e!82072 (isDefined!119 (getValueByKey!167 (toList!831 lt!64381) (select (arr!2210 (_keys!4492 newMap!16)) #b00000000000000000000000000000000))))))

(assert (= (and d!37955 c!22932) b!125643))

(assert (= (and d!37955 (not c!22932)) b!125644))

(assert (= (and d!37955 (not res!60813)) b!125645))

(assert (=> d!37955 m!145113))

(declare-fun m!146489 () Bool)

(assert (=> d!37955 m!146489))

(assert (=> b!125643 m!145113))

(declare-fun m!146491 () Bool)

(assert (=> b!125643 m!146491))

(assert (=> b!125643 m!145113))

(declare-fun m!146493 () Bool)

(assert (=> b!125643 m!146493))

(assert (=> b!125643 m!146493))

(declare-fun m!146495 () Bool)

(assert (=> b!125643 m!146495))

(assert (=> b!125645 m!145113))

(assert (=> b!125645 m!146493))

(assert (=> b!125645 m!146493))

(assert (=> b!125645 m!146495))

(assert (=> b!125132 d!37955))

(declare-fun d!37957 () Bool)

(assert (=> d!37957 (= (get!1447 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (v!3107 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!124942 d!37957))

(declare-fun b!125646 () Bool)

(declare-fun e!82074 () (_ BitVec 32))

(declare-fun e!82075 () (_ BitVec 32))

(assert (=> b!125646 (= e!82074 e!82075)))

(declare-fun c!22933 () Bool)

(assert (=> b!125646 (= c!22933 (validKeyInArray!0 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun b!125647 () Bool)

(declare-fun call!13431 () (_ BitVec 32))

(assert (=> b!125647 (= e!82075 (bvadd #b00000000000000000000000000000001 call!13431))))

(declare-fun b!125648 () Bool)

(assert (=> b!125648 (= e!82074 #b00000000000000000000000000000000)))

(declare-fun b!125649 () Bool)

(assert (=> b!125649 (= e!82075 call!13431)))

(declare-fun bm!13428 () Bool)

(assert (=> bm!13428 (= call!13431 (arrayCountValidKeys!0 (_keys!4492 (v!3108 (underlying!436 thiss!992))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2473 (_keys!4492 (v!3108 (underlying!436 thiss!992))))))))

(declare-fun d!37959 () Bool)

(declare-fun lt!64785 () (_ BitVec 32))

(assert (=> d!37959 (and (bvsge lt!64785 #b00000000000000000000000000000000) (bvsle lt!64785 (bvsub (size!2473 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) #b00000000000000000000000000000000)))))

(assert (=> d!37959 (= lt!64785 e!82074)))

(declare-fun c!22934 () Bool)

(assert (=> d!37959 (= c!22934 (bvsge #b00000000000000000000000000000000 (size!2473 (_keys!4492 (v!3108 (underlying!436 thiss!992))))))))

(assert (=> d!37959 (and (bvsle #b00000000000000000000000000000000 (size!2473 (_keys!4492 (v!3108 (underlying!436 thiss!992))))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!2473 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) (size!2473 (_keys!4492 (v!3108 (underlying!436 thiss!992))))))))

(assert (=> d!37959 (= (arrayCountValidKeys!0 (_keys!4492 (v!3108 (underlying!436 thiss!992))) #b00000000000000000000000000000000 (size!2473 (_keys!4492 (v!3108 (underlying!436 thiss!992))))) lt!64785)))

(assert (= (and d!37959 c!22934) b!125648))

(assert (= (and d!37959 (not c!22934)) b!125646))

(assert (= (and b!125646 c!22933) b!125647))

(assert (= (and b!125646 (not c!22933)) b!125649))

(assert (= (or b!125647 b!125649) bm!13428))

(assert (=> b!125646 m!145757))

(assert (=> b!125646 m!145757))

(assert (=> b!125646 m!145763))

(declare-fun m!146497 () Bool)

(assert (=> bm!13428 m!146497))

(assert (=> b!124893 d!37959))

(declare-fun b!125651 () Bool)

(declare-fun e!82076 () Option!173)

(declare-fun e!82077 () Option!173)

(assert (=> b!125651 (= e!82076 e!82077)))

(declare-fun c!22936 () Bool)

(assert (=> b!125651 (= c!22936 (and ((_ is Cons!1672) (toList!831 lt!64312)) (not (= (_1!1271 (h!2273 (toList!831 lt!64312))) (_1!1271 (tuple2!2521 lt!64125 (minValue!2628 (v!3108 (underlying!436 thiss!992)))))))))))

(declare-fun b!125652 () Bool)

(assert (=> b!125652 (= e!82077 (getValueByKey!167 (t!5995 (toList!831 lt!64312)) (_1!1271 (tuple2!2521 lt!64125 (minValue!2628 (v!3108 (underlying!436 thiss!992)))))))))

(declare-fun d!37961 () Bool)

(declare-fun c!22935 () Bool)

(assert (=> d!37961 (= c!22935 (and ((_ is Cons!1672) (toList!831 lt!64312)) (= (_1!1271 (h!2273 (toList!831 lt!64312))) (_1!1271 (tuple2!2521 lt!64125 (minValue!2628 (v!3108 (underlying!436 thiss!992))))))))))

(assert (=> d!37961 (= (getValueByKey!167 (toList!831 lt!64312) (_1!1271 (tuple2!2521 lt!64125 (minValue!2628 (v!3108 (underlying!436 thiss!992)))))) e!82076)))

(declare-fun b!125653 () Bool)

(assert (=> b!125653 (= e!82077 None!171)))

(declare-fun b!125650 () Bool)

(assert (=> b!125650 (= e!82076 (Some!172 (_2!1271 (h!2273 (toList!831 lt!64312)))))))

(assert (= (and d!37961 c!22935) b!125650))

(assert (= (and d!37961 (not c!22935)) b!125651))

(assert (= (and b!125651 c!22936) b!125652))

(assert (= (and b!125651 (not c!22936)) b!125653))

(declare-fun m!146499 () Bool)

(assert (=> b!125652 m!146499))

(assert (=> b!125026 d!37961))

(declare-fun d!37963 () Bool)

(assert (=> d!37963 (= (get!1449 (getValueByKey!167 (toList!831 lt!64116) lt!64111)) (v!3114 (getValueByKey!167 (toList!831 lt!64116) lt!64111)))))

(assert (=> d!37555 d!37963))

(declare-fun b!125655 () Bool)

(declare-fun e!82078 () Option!173)

(declare-fun e!82079 () Option!173)

(assert (=> b!125655 (= e!82078 e!82079)))

(declare-fun c!22938 () Bool)

(assert (=> b!125655 (= c!22938 (and ((_ is Cons!1672) (toList!831 lt!64116)) (not (= (_1!1271 (h!2273 (toList!831 lt!64116))) lt!64111))))))

(declare-fun b!125656 () Bool)

(assert (=> b!125656 (= e!82079 (getValueByKey!167 (t!5995 (toList!831 lt!64116)) lt!64111))))

(declare-fun d!37965 () Bool)

(declare-fun c!22937 () Bool)

(assert (=> d!37965 (= c!22937 (and ((_ is Cons!1672) (toList!831 lt!64116)) (= (_1!1271 (h!2273 (toList!831 lt!64116))) lt!64111)))))

(assert (=> d!37965 (= (getValueByKey!167 (toList!831 lt!64116) lt!64111) e!82078)))

(declare-fun b!125657 () Bool)

(assert (=> b!125657 (= e!82079 None!171)))

(declare-fun b!125654 () Bool)

(assert (=> b!125654 (= e!82078 (Some!172 (_2!1271 (h!2273 (toList!831 lt!64116)))))))

(assert (= (and d!37965 c!22937) b!125654))

(assert (= (and d!37965 (not c!22937)) b!125655))

(assert (= (and b!125655 c!22938) b!125656))

(assert (= (and b!125655 (not c!22938)) b!125657))

(declare-fun m!146501 () Bool)

(assert (=> b!125656 m!146501))

(assert (=> d!37555 d!37965))

(declare-fun d!37967 () Bool)

(assert (=> d!37967 (isDefined!119 (getValueByKey!167 (toList!831 lt!64108) (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun lt!64786 () Unit!3871)

(assert (=> d!37967 (= lt!64786 (choose!762 (toList!831 lt!64108) (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun e!82080 () Bool)

(assert (=> d!37967 e!82080))

(declare-fun res!60814 () Bool)

(assert (=> d!37967 (=> (not res!60814) (not e!82080))))

(assert (=> d!37967 (= res!60814 (isStrictlySorted!303 (toList!831 lt!64108)))))

(assert (=> d!37967 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!118 (toList!831 lt!64108) (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) lt!64786)))

(declare-fun b!125658 () Bool)

(assert (=> b!125658 (= e!82080 (containsKey!170 (toList!831 lt!64108) (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (= (and d!37967 res!60814) b!125658))

(assert (=> d!37967 m!144905))

(assert (=> d!37967 m!145101))

(assert (=> d!37967 m!145101))

(assert (=> d!37967 m!145541))

(assert (=> d!37967 m!144905))

(declare-fun m!146503 () Bool)

(assert (=> d!37967 m!146503))

(assert (=> d!37967 m!146001))

(assert (=> b!125658 m!144905))

(assert (=> b!125658 m!145537))

(assert (=> b!125204 d!37967))

(assert (=> b!125204 d!37721))

(assert (=> b!125204 d!37723))

(declare-fun d!37969 () Bool)

(declare-fun e!82081 () Bool)

(assert (=> d!37969 e!82081))

(declare-fun res!60815 () Bool)

(assert (=> d!37969 (=> (not res!60815) (not e!82081))))

(declare-fun lt!64788 () ListLongMap!1631)

(assert (=> d!37969 (= res!60815 (contains!861 lt!64788 (_1!1271 (ite (or c!22789 c!22791) (tuple2!2521 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (and c!22717 c!22710) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2628 newMap!16))) (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!22717 (ite c!22710 (minValue!2628 newMap!16) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2628 newMap!16)))))))))

(declare-fun lt!64789 () List!1676)

(assert (=> d!37969 (= lt!64788 (ListLongMap!1632 lt!64789))))

(declare-fun lt!64790 () Unit!3871)

(declare-fun lt!64787 () Unit!3871)

(assert (=> d!37969 (= lt!64790 lt!64787)))

(assert (=> d!37969 (= (getValueByKey!167 lt!64789 (_1!1271 (ite (or c!22789 c!22791) (tuple2!2521 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (and c!22717 c!22710) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2628 newMap!16))) (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!22717 (ite c!22710 (minValue!2628 newMap!16) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2628 newMap!16)))))) (Some!172 (_2!1271 (ite (or c!22789 c!22791) (tuple2!2521 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (and c!22717 c!22710) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2628 newMap!16))) (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!22717 (ite c!22710 (minValue!2628 newMap!16) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2628 newMap!16)))))))))

(assert (=> d!37969 (= lt!64787 (lemmaContainsTupThenGetReturnValue!82 lt!64789 (_1!1271 (ite (or c!22789 c!22791) (tuple2!2521 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (and c!22717 c!22710) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2628 newMap!16))) (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!22717 (ite c!22710 (minValue!2628 newMap!16) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2628 newMap!16))))) (_2!1271 (ite (or c!22789 c!22791) (tuple2!2521 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (and c!22717 c!22710) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2628 newMap!16))) (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!22717 (ite c!22710 (minValue!2628 newMap!16) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2628 newMap!16)))))))))

(assert (=> d!37969 (= lt!64789 (insertStrictlySorted!85 (toList!831 (ite c!22789 call!13384 (ite c!22791 call!13385 call!13381))) (_1!1271 (ite (or c!22789 c!22791) (tuple2!2521 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (and c!22717 c!22710) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2628 newMap!16))) (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!22717 (ite c!22710 (minValue!2628 newMap!16) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2628 newMap!16))))) (_2!1271 (ite (or c!22789 c!22791) (tuple2!2521 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (and c!22717 c!22710) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2628 newMap!16))) (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!22717 (ite c!22710 (minValue!2628 newMap!16) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2628 newMap!16)))))))))

(assert (=> d!37969 (= (+!163 (ite c!22789 call!13384 (ite c!22791 call!13385 call!13381)) (ite (or c!22789 c!22791) (tuple2!2521 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (and c!22717 c!22710) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2628 newMap!16))) (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!22717 (ite c!22710 (minValue!2628 newMap!16) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2628 newMap!16))))) lt!64788)))

(declare-fun b!125659 () Bool)

(declare-fun res!60816 () Bool)

(assert (=> b!125659 (=> (not res!60816) (not e!82081))))

(assert (=> b!125659 (= res!60816 (= (getValueByKey!167 (toList!831 lt!64788) (_1!1271 (ite (or c!22789 c!22791) (tuple2!2521 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (and c!22717 c!22710) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2628 newMap!16))) (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!22717 (ite c!22710 (minValue!2628 newMap!16) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2628 newMap!16)))))) (Some!172 (_2!1271 (ite (or c!22789 c!22791) (tuple2!2521 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (and c!22717 c!22710) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2628 newMap!16))) (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!22717 (ite c!22710 (minValue!2628 newMap!16) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2628 newMap!16))))))))))

(declare-fun b!125660 () Bool)

(assert (=> b!125660 (= e!82081 (contains!862 (toList!831 lt!64788) (ite (or c!22789 c!22791) (tuple2!2521 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (and c!22717 c!22710) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2628 newMap!16))) (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!22717 (ite c!22710 (minValue!2628 newMap!16) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2628 newMap!16))))))))

(assert (= (and d!37969 res!60815) b!125659))

(assert (= (and b!125659 res!60816) b!125660))

(declare-fun m!146505 () Bool)

(assert (=> d!37969 m!146505))

(declare-fun m!146507 () Bool)

(assert (=> d!37969 m!146507))

(declare-fun m!146509 () Bool)

(assert (=> d!37969 m!146509))

(declare-fun m!146511 () Bool)

(assert (=> d!37969 m!146511))

(declare-fun m!146513 () Bool)

(assert (=> b!125659 m!146513))

(declare-fun m!146515 () Bool)

(assert (=> b!125660 m!146515))

(assert (=> bm!13376 d!37969))

(declare-fun b!125661 () Bool)

(declare-fun e!82082 () (_ BitVec 32))

(declare-fun e!82083 () (_ BitVec 32))

(assert (=> b!125661 (= e!82082 e!82083)))

(declare-fun c!22939 () Bool)

(assert (=> b!125661 (= c!22939 (validKeyInArray!0 (select (arr!2210 (_keys!4492 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!125662 () Bool)

(declare-fun call!13432 () (_ BitVec 32))

(assert (=> b!125662 (= e!82083 (bvadd #b00000000000000000000000000000001 call!13432))))

(declare-fun b!125663 () Bool)

(assert (=> b!125663 (= e!82082 #b00000000000000000000000000000000)))

(declare-fun b!125664 () Bool)

(assert (=> b!125664 (= e!82083 call!13432)))

(declare-fun bm!13429 () Bool)

(assert (=> bm!13429 (= call!13432 (arrayCountValidKeys!0 (_keys!4492 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!2473 (_keys!4492 newMap!16))))))

(declare-fun d!37971 () Bool)

(declare-fun lt!64791 () (_ BitVec 32))

(assert (=> d!37971 (and (bvsge lt!64791 #b00000000000000000000000000000000) (bvsle lt!64791 (bvsub (size!2473 (_keys!4492 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> d!37971 (= lt!64791 e!82082)))

(declare-fun c!22940 () Bool)

(assert (=> d!37971 (= c!22940 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2473 (_keys!4492 newMap!16))))))

(assert (=> d!37971 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2473 (_keys!4492 newMap!16))) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (size!2473 (_keys!4492 newMap!16)) (size!2473 (_keys!4492 newMap!16))))))

(assert (=> d!37971 (= (arrayCountValidKeys!0 (_keys!4492 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2473 (_keys!4492 newMap!16))) lt!64791)))

(assert (= (and d!37971 c!22940) b!125663))

(assert (= (and d!37971 (not c!22940)) b!125661))

(assert (= (and b!125661 c!22939) b!125662))

(assert (= (and b!125661 (not c!22939)) b!125664))

(assert (= (or b!125662 b!125664) bm!13429))

(assert (=> b!125661 m!146189))

(assert (=> b!125661 m!146189))

(assert (=> b!125661 m!146191))

(declare-fun m!146517 () Bool)

(assert (=> bm!13429 m!146517))

(assert (=> bm!13358 d!37971))

(declare-fun d!37973 () Bool)

(declare-fun res!60817 () Bool)

(declare-fun e!82084 () Bool)

(assert (=> d!37973 (=> res!60817 e!82084)))

(assert (=> d!37973 (= res!60817 (and ((_ is Cons!1672) (toList!831 call!13330)) (= (_1!1271 (h!2273 (toList!831 call!13330))) (ite c!22712 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355) (select (arr!2210 (_keys!4492 newMap!16)) (index!3207 lt!64214))))))))

(assert (=> d!37973 (= (containsKey!170 (toList!831 call!13330) (ite c!22712 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355) (select (arr!2210 (_keys!4492 newMap!16)) (index!3207 lt!64214)))) e!82084)))

(declare-fun b!125665 () Bool)

(declare-fun e!82085 () Bool)

(assert (=> b!125665 (= e!82084 e!82085)))

(declare-fun res!60818 () Bool)

(assert (=> b!125665 (=> (not res!60818) (not e!82085))))

(assert (=> b!125665 (= res!60818 (and (or (not ((_ is Cons!1672) (toList!831 call!13330))) (bvsle (_1!1271 (h!2273 (toList!831 call!13330))) (ite c!22712 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355) (select (arr!2210 (_keys!4492 newMap!16)) (index!3207 lt!64214))))) ((_ is Cons!1672) (toList!831 call!13330)) (bvslt (_1!1271 (h!2273 (toList!831 call!13330))) (ite c!22712 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355) (select (arr!2210 (_keys!4492 newMap!16)) (index!3207 lt!64214))))))))

(declare-fun b!125666 () Bool)

(assert (=> b!125666 (= e!82085 (containsKey!170 (t!5995 (toList!831 call!13330)) (ite c!22712 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355) (select (arr!2210 (_keys!4492 newMap!16)) (index!3207 lt!64214)))))))

(assert (= (and d!37973 (not res!60817)) b!125665))

(assert (= (and b!125665 res!60818) b!125666))

(declare-fun m!146519 () Bool)

(assert (=> b!125666 m!146519))

(assert (=> d!37595 d!37973))

(declare-fun d!37975 () Bool)

(declare-fun e!82086 () Bool)

(assert (=> d!37975 e!82086))

(declare-fun res!60819 () Bool)

(assert (=> d!37975 (=> res!60819 e!82086)))

(declare-fun lt!64792 () Bool)

(assert (=> d!37975 (= res!60819 (not lt!64792))))

(declare-fun lt!64795 () Bool)

(assert (=> d!37975 (= lt!64792 lt!64795)))

(declare-fun lt!64794 () Unit!3871)

(declare-fun e!82087 () Unit!3871)

(assert (=> d!37975 (= lt!64794 e!82087)))

(declare-fun c!22941 () Bool)

(assert (=> d!37975 (= c!22941 lt!64795)))

(assert (=> d!37975 (= lt!64795 (containsKey!170 (toList!831 lt!64304) (_1!1271 (tuple2!2521 lt!64124 (zeroValue!2628 (v!3108 (underlying!436 thiss!992)))))))))

(assert (=> d!37975 (= (contains!861 lt!64304 (_1!1271 (tuple2!2521 lt!64124 (zeroValue!2628 (v!3108 (underlying!436 thiss!992)))))) lt!64792)))

(declare-fun b!125667 () Bool)

(declare-fun lt!64793 () Unit!3871)

(assert (=> b!125667 (= e!82087 lt!64793)))

(assert (=> b!125667 (= lt!64793 (lemmaContainsKeyImpliesGetValueByKeyDefined!118 (toList!831 lt!64304) (_1!1271 (tuple2!2521 lt!64124 (zeroValue!2628 (v!3108 (underlying!436 thiss!992)))))))))

(assert (=> b!125667 (isDefined!119 (getValueByKey!167 (toList!831 lt!64304) (_1!1271 (tuple2!2521 lt!64124 (zeroValue!2628 (v!3108 (underlying!436 thiss!992)))))))))

(declare-fun b!125668 () Bool)

(declare-fun Unit!3911 () Unit!3871)

(assert (=> b!125668 (= e!82087 Unit!3911)))

(declare-fun b!125669 () Bool)

(assert (=> b!125669 (= e!82086 (isDefined!119 (getValueByKey!167 (toList!831 lt!64304) (_1!1271 (tuple2!2521 lt!64124 (zeroValue!2628 (v!3108 (underlying!436 thiss!992))))))))))

(assert (= (and d!37975 c!22941) b!125667))

(assert (= (and d!37975 (not c!22941)) b!125668))

(assert (= (and d!37975 (not res!60819)) b!125669))

(declare-fun m!146521 () Bool)

(assert (=> d!37975 m!146521))

(declare-fun m!146523 () Bool)

(assert (=> b!125667 m!146523))

(assert (=> b!125667 m!145205))

(assert (=> b!125667 m!145205))

(declare-fun m!146525 () Bool)

(assert (=> b!125667 m!146525))

(assert (=> b!125669 m!145205))

(assert (=> b!125669 m!145205))

(assert (=> b!125669 m!146525))

(assert (=> d!37565 d!37975))

(declare-fun b!125671 () Bool)

(declare-fun e!82088 () Option!173)

(declare-fun e!82089 () Option!173)

(assert (=> b!125671 (= e!82088 e!82089)))

(declare-fun c!22943 () Bool)

(assert (=> b!125671 (= c!22943 (and ((_ is Cons!1672) lt!64305) (not (= (_1!1271 (h!2273 lt!64305)) (_1!1271 (tuple2!2521 lt!64124 (zeroValue!2628 (v!3108 (underlying!436 thiss!992)))))))))))

(declare-fun b!125672 () Bool)

(assert (=> b!125672 (= e!82089 (getValueByKey!167 (t!5995 lt!64305) (_1!1271 (tuple2!2521 lt!64124 (zeroValue!2628 (v!3108 (underlying!436 thiss!992)))))))))

(declare-fun d!37977 () Bool)

(declare-fun c!22942 () Bool)

(assert (=> d!37977 (= c!22942 (and ((_ is Cons!1672) lt!64305) (= (_1!1271 (h!2273 lt!64305)) (_1!1271 (tuple2!2521 lt!64124 (zeroValue!2628 (v!3108 (underlying!436 thiss!992))))))))))

(assert (=> d!37977 (= (getValueByKey!167 lt!64305 (_1!1271 (tuple2!2521 lt!64124 (zeroValue!2628 (v!3108 (underlying!436 thiss!992)))))) e!82088)))

(declare-fun b!125673 () Bool)

(assert (=> b!125673 (= e!82089 None!171)))

(declare-fun b!125670 () Bool)

(assert (=> b!125670 (= e!82088 (Some!172 (_2!1271 (h!2273 lt!64305))))))

(assert (= (and d!37977 c!22942) b!125670))

(assert (= (and d!37977 (not c!22942)) b!125671))

(assert (= (and b!125671 c!22943) b!125672))

(assert (= (and b!125671 (not c!22943)) b!125673))

(declare-fun m!146527 () Bool)

(assert (=> b!125672 m!146527))

(assert (=> d!37565 d!37977))

(declare-fun d!37979 () Bool)

(assert (=> d!37979 (= (getValueByKey!167 lt!64305 (_1!1271 (tuple2!2521 lt!64124 (zeroValue!2628 (v!3108 (underlying!436 thiss!992)))))) (Some!172 (_2!1271 (tuple2!2521 lt!64124 (zeroValue!2628 (v!3108 (underlying!436 thiss!992)))))))))

(declare-fun lt!64796 () Unit!3871)

(assert (=> d!37979 (= lt!64796 (choose!763 lt!64305 (_1!1271 (tuple2!2521 lt!64124 (zeroValue!2628 (v!3108 (underlying!436 thiss!992))))) (_2!1271 (tuple2!2521 lt!64124 (zeroValue!2628 (v!3108 (underlying!436 thiss!992)))))))))

(declare-fun e!82090 () Bool)

(assert (=> d!37979 e!82090))

(declare-fun res!60820 () Bool)

(assert (=> d!37979 (=> (not res!60820) (not e!82090))))

(assert (=> d!37979 (= res!60820 (isStrictlySorted!303 lt!64305))))

(assert (=> d!37979 (= (lemmaContainsTupThenGetReturnValue!82 lt!64305 (_1!1271 (tuple2!2521 lt!64124 (zeroValue!2628 (v!3108 (underlying!436 thiss!992))))) (_2!1271 (tuple2!2521 lt!64124 (zeroValue!2628 (v!3108 (underlying!436 thiss!992)))))) lt!64796)))

(declare-fun b!125674 () Bool)

(declare-fun res!60821 () Bool)

(assert (=> b!125674 (=> (not res!60821) (not e!82090))))

(assert (=> b!125674 (= res!60821 (containsKey!170 lt!64305 (_1!1271 (tuple2!2521 lt!64124 (zeroValue!2628 (v!3108 (underlying!436 thiss!992)))))))))

(declare-fun b!125675 () Bool)

(assert (=> b!125675 (= e!82090 (contains!862 lt!64305 (tuple2!2521 (_1!1271 (tuple2!2521 lt!64124 (zeroValue!2628 (v!3108 (underlying!436 thiss!992))))) (_2!1271 (tuple2!2521 lt!64124 (zeroValue!2628 (v!3108 (underlying!436 thiss!992))))))))))

(assert (= (and d!37979 res!60820) b!125674))

(assert (= (and b!125674 res!60821) b!125675))

(assert (=> d!37979 m!145199))

(declare-fun m!146529 () Bool)

(assert (=> d!37979 m!146529))

(declare-fun m!146531 () Bool)

(assert (=> d!37979 m!146531))

(declare-fun m!146533 () Bool)

(assert (=> b!125674 m!146533))

(declare-fun m!146535 () Bool)

(assert (=> b!125675 m!146535))

(assert (=> d!37565 d!37979))

(declare-fun b!125676 () Bool)

(declare-fun e!82091 () List!1676)

(declare-fun call!13435 () List!1676)

(assert (=> b!125676 (= e!82091 call!13435)))

(declare-fun c!22944 () Bool)

(declare-fun b!125677 () Bool)

(assert (=> b!125677 (= c!22944 (and ((_ is Cons!1672) (toList!831 lt!64118)) (bvsgt (_1!1271 (h!2273 (toList!831 lt!64118))) (_1!1271 (tuple2!2521 lt!64124 (zeroValue!2628 (v!3108 (underlying!436 thiss!992))))))))))

(declare-fun e!82095 () List!1676)

(assert (=> b!125677 (= e!82095 e!82091)))

(declare-fun b!125678 () Bool)

(declare-fun res!60823 () Bool)

(declare-fun e!82094 () Bool)

(assert (=> b!125678 (=> (not res!60823) (not e!82094))))

(declare-fun lt!64797 () List!1676)

(assert (=> b!125678 (= res!60823 (containsKey!170 lt!64797 (_1!1271 (tuple2!2521 lt!64124 (zeroValue!2628 (v!3108 (underlying!436 thiss!992)))))))))

(declare-fun d!37981 () Bool)

(assert (=> d!37981 e!82094))

(declare-fun res!60822 () Bool)

(assert (=> d!37981 (=> (not res!60822) (not e!82094))))

(assert (=> d!37981 (= res!60822 (isStrictlySorted!303 lt!64797))))

(declare-fun e!82092 () List!1676)

(assert (=> d!37981 (= lt!64797 e!82092)))

(declare-fun c!22946 () Bool)

(assert (=> d!37981 (= c!22946 (and ((_ is Cons!1672) (toList!831 lt!64118)) (bvslt (_1!1271 (h!2273 (toList!831 lt!64118))) (_1!1271 (tuple2!2521 lt!64124 (zeroValue!2628 (v!3108 (underlying!436 thiss!992))))))))))

(assert (=> d!37981 (isStrictlySorted!303 (toList!831 lt!64118))))

(assert (=> d!37981 (= (insertStrictlySorted!85 (toList!831 lt!64118) (_1!1271 (tuple2!2521 lt!64124 (zeroValue!2628 (v!3108 (underlying!436 thiss!992))))) (_2!1271 (tuple2!2521 lt!64124 (zeroValue!2628 (v!3108 (underlying!436 thiss!992)))))) lt!64797)))

(declare-fun b!125679 () Bool)

(declare-fun call!13433 () List!1676)

(assert (=> b!125679 (= e!82092 call!13433)))

(declare-fun b!125680 () Bool)

(assert (=> b!125680 (= e!82094 (contains!862 lt!64797 (tuple2!2521 (_1!1271 (tuple2!2521 lt!64124 (zeroValue!2628 (v!3108 (underlying!436 thiss!992))))) (_2!1271 (tuple2!2521 lt!64124 (zeroValue!2628 (v!3108 (underlying!436 thiss!992))))))))))

(declare-fun bm!13430 () Bool)

(declare-fun e!82093 () List!1676)

(assert (=> bm!13430 (= call!13433 ($colon$colon!87 e!82093 (ite c!22946 (h!2273 (toList!831 lt!64118)) (tuple2!2521 (_1!1271 (tuple2!2521 lt!64124 (zeroValue!2628 (v!3108 (underlying!436 thiss!992))))) (_2!1271 (tuple2!2521 lt!64124 (zeroValue!2628 (v!3108 (underlying!436 thiss!992)))))))))))

(declare-fun c!22947 () Bool)

(assert (=> bm!13430 (= c!22947 c!22946)))

(declare-fun bm!13431 () Bool)

(declare-fun call!13434 () List!1676)

(assert (=> bm!13431 (= call!13434 call!13433)))

(declare-fun bm!13432 () Bool)

(assert (=> bm!13432 (= call!13435 call!13434)))

(declare-fun b!125681 () Bool)

(assert (=> b!125681 (= e!82092 e!82095)))

(declare-fun c!22945 () Bool)

(assert (=> b!125681 (= c!22945 (and ((_ is Cons!1672) (toList!831 lt!64118)) (= (_1!1271 (h!2273 (toList!831 lt!64118))) (_1!1271 (tuple2!2521 lt!64124 (zeroValue!2628 (v!3108 (underlying!436 thiss!992))))))))))

(declare-fun b!125682 () Bool)

(assert (=> b!125682 (= e!82091 call!13435)))

(declare-fun b!125683 () Bool)

(assert (=> b!125683 (= e!82093 (ite c!22945 (t!5995 (toList!831 lt!64118)) (ite c!22944 (Cons!1672 (h!2273 (toList!831 lt!64118)) (t!5995 (toList!831 lt!64118))) Nil!1673)))))

(declare-fun b!125684 () Bool)

(assert (=> b!125684 (= e!82093 (insertStrictlySorted!85 (t!5995 (toList!831 lt!64118)) (_1!1271 (tuple2!2521 lt!64124 (zeroValue!2628 (v!3108 (underlying!436 thiss!992))))) (_2!1271 (tuple2!2521 lt!64124 (zeroValue!2628 (v!3108 (underlying!436 thiss!992)))))))))

(declare-fun b!125685 () Bool)

(assert (=> b!125685 (= e!82095 call!13434)))

(assert (= (and d!37981 c!22946) b!125679))

(assert (= (and d!37981 (not c!22946)) b!125681))

(assert (= (and b!125681 c!22945) b!125685))

(assert (= (and b!125681 (not c!22945)) b!125677))

(assert (= (and b!125677 c!22944) b!125676))

(assert (= (and b!125677 (not c!22944)) b!125682))

(assert (= (or b!125676 b!125682) bm!13432))

(assert (= (or b!125685 bm!13432) bm!13431))

(assert (= (or b!125679 bm!13431) bm!13430))

(assert (= (and bm!13430 c!22947) b!125684))

(assert (= (and bm!13430 (not c!22947)) b!125683))

(assert (= (and d!37981 res!60822) b!125678))

(assert (= (and b!125678 res!60823) b!125680))

(declare-fun m!146537 () Bool)

(assert (=> d!37981 m!146537))

(declare-fun m!146539 () Bool)

(assert (=> d!37981 m!146539))

(declare-fun m!146541 () Bool)

(assert (=> bm!13430 m!146541))

(declare-fun m!146543 () Bool)

(assert (=> b!125680 m!146543))

(declare-fun m!146545 () Bool)

(assert (=> b!125678 m!146545))

(declare-fun m!146547 () Bool)

(assert (=> b!125684 m!146547))

(assert (=> d!37565 d!37981))

(declare-fun d!37983 () Bool)

(declare-fun res!60824 () Bool)

(declare-fun e!82096 () Bool)

(assert (=> d!37983 (=> res!60824 e!82096)))

(assert (=> d!37983 (= res!60824 (= (select (arr!2210 (_keys!4492 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355)))))

(assert (=> d!37983 (= (arrayContainsKey!0 (_keys!4492 newMap!16) (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!82096)))

(declare-fun b!125686 () Bool)

(declare-fun e!82097 () Bool)

(assert (=> b!125686 (= e!82096 e!82097)))

(declare-fun res!60825 () Bool)

(assert (=> b!125686 (=> (not res!60825) (not e!82097))))

(assert (=> b!125686 (= res!60825 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!2473 (_keys!4492 newMap!16))))))

(declare-fun b!125687 () Bool)

(assert (=> b!125687 (= e!82097 (arrayContainsKey!0 (_keys!4492 newMap!16) (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!37983 (not res!60824)) b!125686))

(assert (= (and b!125686 res!60825) b!125687))

(assert (=> d!37983 m!146189))

(assert (=> b!125687 m!144797))

(declare-fun m!146549 () Bool)

(assert (=> b!125687 m!146549))

(assert (=> b!125110 d!37983))

(declare-fun d!37985 () Bool)

(declare-fun e!82098 () Bool)

(assert (=> d!37985 e!82098))

(declare-fun res!60826 () Bool)

(assert (=> d!37985 (=> res!60826 e!82098)))

(declare-fun lt!64798 () Bool)

(assert (=> d!37985 (= res!60826 (not lt!64798))))

(declare-fun lt!64801 () Bool)

(assert (=> d!37985 (= lt!64798 lt!64801)))

(declare-fun lt!64800 () Unit!3871)

(declare-fun e!82099 () Unit!3871)

(assert (=> d!37985 (= lt!64800 e!82099)))

(declare-fun c!22948 () Bool)

(assert (=> d!37985 (= c!22948 lt!64801)))

(assert (=> d!37985 (= lt!64801 (containsKey!170 (toList!831 lt!64329) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!37985 (= (contains!861 lt!64329 #b0000000000000000000000000000000000000000000000000000000000000000) lt!64798)))

(declare-fun b!125688 () Bool)

(declare-fun lt!64799 () Unit!3871)

(assert (=> b!125688 (= e!82099 lt!64799)))

(assert (=> b!125688 (= lt!64799 (lemmaContainsKeyImpliesGetValueByKeyDefined!118 (toList!831 lt!64329) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!125688 (isDefined!119 (getValueByKey!167 (toList!831 lt!64329) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!125689 () Bool)

(declare-fun Unit!3912 () Unit!3871)

(assert (=> b!125689 (= e!82099 Unit!3912)))

(declare-fun b!125690 () Bool)

(assert (=> b!125690 (= e!82098 (isDefined!119 (getValueByKey!167 (toList!831 lt!64329) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!37985 c!22948) b!125688))

(assert (= (and d!37985 (not c!22948)) b!125689))

(assert (= (and d!37985 (not res!60826)) b!125690))

(declare-fun m!146551 () Bool)

(assert (=> d!37985 m!146551))

(declare-fun m!146553 () Bool)

(assert (=> b!125688 m!146553))

(assert (=> b!125688 m!146185))

(assert (=> b!125688 m!146185))

(declare-fun m!146555 () Bool)

(assert (=> b!125688 m!146555))

(assert (=> b!125690 m!146185))

(assert (=> b!125690 m!146185))

(assert (=> b!125690 m!146555))

(assert (=> bm!13366 d!37985))

(assert (=> b!124970 d!37633))

(declare-fun d!37987 () Bool)

(declare-fun lt!64802 () Bool)

(assert (=> d!37987 (= lt!64802 (select (content!124 (toList!831 lt!64244)) (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 (v!3108 (underlying!436 thiss!992))))))))

(declare-fun e!82100 () Bool)

(assert (=> d!37987 (= lt!64802 e!82100)))

(declare-fun res!60827 () Bool)

(assert (=> d!37987 (=> (not res!60827) (not e!82100))))

(assert (=> d!37987 (= res!60827 ((_ is Cons!1672) (toList!831 lt!64244)))))

(assert (=> d!37987 (= (contains!862 (toList!831 lt!64244) (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 (v!3108 (underlying!436 thiss!992))))) lt!64802)))

(declare-fun b!125691 () Bool)

(declare-fun e!82101 () Bool)

(assert (=> b!125691 (= e!82100 e!82101)))

(declare-fun res!60828 () Bool)

(assert (=> b!125691 (=> res!60828 e!82101)))

(assert (=> b!125691 (= res!60828 (= (h!2273 (toList!831 lt!64244)) (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 (v!3108 (underlying!436 thiss!992))))))))

(declare-fun b!125692 () Bool)

(assert (=> b!125692 (= e!82101 (contains!862 (t!5995 (toList!831 lt!64244)) (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 (v!3108 (underlying!436 thiss!992))))))))

(assert (= (and d!37987 res!60827) b!125691))

(assert (= (and b!125691 (not res!60828)) b!125692))

(declare-fun m!146557 () Bool)

(assert (=> d!37987 m!146557))

(declare-fun m!146559 () Bool)

(assert (=> d!37987 m!146559))

(declare-fun m!146561 () Bool)

(assert (=> b!125692 m!146561))

(assert (=> b!124915 d!37987))

(declare-fun d!37989 () Bool)

(assert (=> d!37989 (= (apply!110 lt!64381 (select (arr!2210 (_keys!4492 newMap!16)) #b00000000000000000000000000000000)) (get!1449 (getValueByKey!167 (toList!831 lt!64381) (select (arr!2210 (_keys!4492 newMap!16)) #b00000000000000000000000000000000))))))

(declare-fun bs!5227 () Bool)

(assert (= bs!5227 d!37989))

(assert (=> bs!5227 m!145113))

(assert (=> bs!5227 m!146493))

(assert (=> bs!5227 m!146493))

(declare-fun m!146563 () Bool)

(assert (=> bs!5227 m!146563))

(assert (=> b!125122 d!37989))

(declare-fun d!37991 () Bool)

(declare-fun c!22949 () Bool)

(assert (=> d!37991 (= c!22949 ((_ is ValueCellFull!1073) (select (arr!2211 (ite (or c!22717 c!22712) (_values!2746 newMap!16) lt!64198)) #b00000000000000000000000000000000)))))

(declare-fun e!82102 () V!3425)

(assert (=> d!37991 (= (get!1446 (select (arr!2211 (ite (or c!22717 c!22712) (_values!2746 newMap!16) lt!64198)) #b00000000000000000000000000000000) (dynLambda!415 (defaultEntry!2763 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000)) e!82102)))

(declare-fun b!125693 () Bool)

(assert (=> b!125693 (= e!82102 (get!1447 (select (arr!2211 (ite (or c!22717 c!22712) (_values!2746 newMap!16) lt!64198)) #b00000000000000000000000000000000) (dynLambda!415 (defaultEntry!2763 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!125694 () Bool)

(assert (=> b!125694 (= e!82102 (get!1448 (select (arr!2211 (ite (or c!22717 c!22712) (_values!2746 newMap!16) lt!64198)) #b00000000000000000000000000000000) (dynLambda!415 (defaultEntry!2763 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!37991 c!22949) b!125693))

(assert (= (and d!37991 (not c!22949)) b!125694))

(assert (=> b!125693 m!145409))

(assert (=> b!125693 m!145277))

(declare-fun m!146565 () Bool)

(assert (=> b!125693 m!146565))

(assert (=> b!125694 m!145409))

(assert (=> b!125694 m!145277))

(declare-fun m!146567 () Bool)

(assert (=> b!125694 m!146567))

(assert (=> b!125122 d!37991))

(declare-fun d!37993 () Bool)

(declare-fun e!82103 () Bool)

(assert (=> d!37993 e!82103))

(declare-fun res!60829 () Bool)

(assert (=> d!37993 (=> res!60829 e!82103)))

(declare-fun lt!64803 () Bool)

(assert (=> d!37993 (= res!60829 (not lt!64803))))

(declare-fun lt!64806 () Bool)

(assert (=> d!37993 (= lt!64803 lt!64806)))

(declare-fun lt!64805 () Unit!3871)

(declare-fun e!82104 () Unit!3871)

(assert (=> d!37993 (= lt!64805 e!82104)))

(declare-fun c!22950 () Bool)

(assert (=> d!37993 (= c!22950 lt!64806)))

(assert (=> d!37993 (= lt!64806 (containsKey!170 (toList!831 lt!64316) (_1!1271 (ite c!22717 (ite c!22710 (tuple2!2521 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2521 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!37993 (= (contains!861 lt!64316 (_1!1271 (ite c!22717 (ite c!22710 (tuple2!2521 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2521 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))) lt!64803)))

(declare-fun b!125695 () Bool)

(declare-fun lt!64804 () Unit!3871)

(assert (=> b!125695 (= e!82104 lt!64804)))

(assert (=> b!125695 (= lt!64804 (lemmaContainsKeyImpliesGetValueByKeyDefined!118 (toList!831 lt!64316) (_1!1271 (ite c!22717 (ite c!22710 (tuple2!2521 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2521 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> b!125695 (isDefined!119 (getValueByKey!167 (toList!831 lt!64316) (_1!1271 (ite c!22717 (ite c!22710 (tuple2!2521 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2521 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!125696 () Bool)

(declare-fun Unit!3913 () Unit!3871)

(assert (=> b!125696 (= e!82104 Unit!3913)))

(declare-fun b!125697 () Bool)

(assert (=> b!125697 (= e!82103 (isDefined!119 (getValueByKey!167 (toList!831 lt!64316) (_1!1271 (ite c!22717 (ite c!22710 (tuple2!2521 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2521 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(assert (= (and d!37993 c!22950) b!125695))

(assert (= (and d!37993 (not c!22950)) b!125696))

(assert (= (and d!37993 (not res!60829)) b!125697))

(declare-fun m!146569 () Bool)

(assert (=> d!37993 m!146569))

(declare-fun m!146571 () Bool)

(assert (=> b!125695 m!146571))

(assert (=> b!125695 m!145249))

(assert (=> b!125695 m!145249))

(declare-fun m!146573 () Bool)

(assert (=> b!125695 m!146573))

(assert (=> b!125697 m!145249))

(assert (=> b!125697 m!145249))

(assert (=> b!125697 m!146573))

(assert (=> d!37577 d!37993))

(declare-fun b!125699 () Bool)

(declare-fun e!82105 () Option!173)

(declare-fun e!82106 () Option!173)

(assert (=> b!125699 (= e!82105 e!82106)))

(declare-fun c!22952 () Bool)

(assert (=> b!125699 (= c!22952 (and ((_ is Cons!1672) lt!64317) (not (= (_1!1271 (h!2273 lt!64317)) (_1!1271 (ite c!22717 (ite c!22710 (tuple2!2521 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2521 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))))

(declare-fun b!125700 () Bool)

(assert (=> b!125700 (= e!82106 (getValueByKey!167 (t!5995 lt!64317) (_1!1271 (ite c!22717 (ite c!22710 (tuple2!2521 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2521 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun c!22951 () Bool)

(declare-fun d!37995 () Bool)

(assert (=> d!37995 (= c!22951 (and ((_ is Cons!1672) lt!64317) (= (_1!1271 (h!2273 lt!64317)) (_1!1271 (ite c!22717 (ite c!22710 (tuple2!2521 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2521 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(assert (=> d!37995 (= (getValueByKey!167 lt!64317 (_1!1271 (ite c!22717 (ite c!22710 (tuple2!2521 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2521 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))) e!82105)))

(declare-fun b!125701 () Bool)

(assert (=> b!125701 (= e!82106 None!171)))

(declare-fun b!125698 () Bool)

(assert (=> b!125698 (= e!82105 (Some!172 (_2!1271 (h!2273 lt!64317))))))

(assert (= (and d!37995 c!22951) b!125698))

(assert (= (and d!37995 (not c!22951)) b!125699))

(assert (= (and b!125699 c!22952) b!125700))

(assert (= (and b!125699 (not c!22952)) b!125701))

(declare-fun m!146575 () Bool)

(assert (=> b!125700 m!146575))

(assert (=> d!37577 d!37995))

(declare-fun d!37997 () Bool)

(assert (=> d!37997 (= (getValueByKey!167 lt!64317 (_1!1271 (ite c!22717 (ite c!22710 (tuple2!2521 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2521 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))) (Some!172 (_2!1271 (ite c!22717 (ite c!22710 (tuple2!2521 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2521 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun lt!64807 () Unit!3871)

(assert (=> d!37997 (= lt!64807 (choose!763 lt!64317 (_1!1271 (ite c!22717 (ite c!22710 (tuple2!2521 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2521 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (_2!1271 (ite c!22717 (ite c!22710 (tuple2!2521 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2521 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun e!82107 () Bool)

(assert (=> d!37997 e!82107))

(declare-fun res!60830 () Bool)

(assert (=> d!37997 (=> (not res!60830) (not e!82107))))

(assert (=> d!37997 (= res!60830 (isStrictlySorted!303 lt!64317))))

(assert (=> d!37997 (= (lemmaContainsTupThenGetReturnValue!82 lt!64317 (_1!1271 (ite c!22717 (ite c!22710 (tuple2!2521 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2521 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (_2!1271 (ite c!22717 (ite c!22710 (tuple2!2521 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2521 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))) lt!64807)))

(declare-fun b!125702 () Bool)

(declare-fun res!60831 () Bool)

(assert (=> b!125702 (=> (not res!60831) (not e!82107))))

(assert (=> b!125702 (= res!60831 (containsKey!170 lt!64317 (_1!1271 (ite c!22717 (ite c!22710 (tuple2!2521 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2521 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!125703 () Bool)

(assert (=> b!125703 (= e!82107 (contains!862 lt!64317 (tuple2!2521 (_1!1271 (ite c!22717 (ite c!22710 (tuple2!2521 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2521 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (_2!1271 (ite c!22717 (ite c!22710 (tuple2!2521 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2521 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(assert (= (and d!37997 res!60830) b!125702))

(assert (= (and b!125702 res!60831) b!125703))

(assert (=> d!37997 m!145243))

(declare-fun m!146577 () Bool)

(assert (=> d!37997 m!146577))

(declare-fun m!146579 () Bool)

(assert (=> d!37997 m!146579))

(declare-fun m!146581 () Bool)

(assert (=> b!125702 m!146581))

(declare-fun m!146583 () Bool)

(assert (=> b!125703 m!146583))

(assert (=> d!37577 d!37997))

(declare-fun b!125704 () Bool)

(declare-fun e!82108 () List!1676)

(declare-fun call!13438 () List!1676)

(assert (=> b!125704 (= e!82108 call!13438)))

(declare-fun c!22953 () Bool)

(declare-fun b!125705 () Bool)

(assert (=> b!125705 (= c!22953 (and ((_ is Cons!1672) (toList!831 e!81592)) (bvsgt (_1!1271 (h!2273 (toList!831 e!81592))) (_1!1271 (ite c!22717 (ite c!22710 (tuple2!2521 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2521 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(declare-fun e!82112 () List!1676)

(assert (=> b!125705 (= e!82112 e!82108)))

(declare-fun b!125706 () Bool)

(declare-fun res!60833 () Bool)

(declare-fun e!82111 () Bool)

(assert (=> b!125706 (=> (not res!60833) (not e!82111))))

(declare-fun lt!64808 () List!1676)

(assert (=> b!125706 (= res!60833 (containsKey!170 lt!64808 (_1!1271 (ite c!22717 (ite c!22710 (tuple2!2521 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2521 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun d!37999 () Bool)

(assert (=> d!37999 e!82111))

(declare-fun res!60832 () Bool)

(assert (=> d!37999 (=> (not res!60832) (not e!82111))))

(assert (=> d!37999 (= res!60832 (isStrictlySorted!303 lt!64808))))

(declare-fun e!82109 () List!1676)

(assert (=> d!37999 (= lt!64808 e!82109)))

(declare-fun c!22955 () Bool)

(assert (=> d!37999 (= c!22955 (and ((_ is Cons!1672) (toList!831 e!81592)) (bvslt (_1!1271 (h!2273 (toList!831 e!81592))) (_1!1271 (ite c!22717 (ite c!22710 (tuple2!2521 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2521 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(assert (=> d!37999 (isStrictlySorted!303 (toList!831 e!81592))))

(assert (=> d!37999 (= (insertStrictlySorted!85 (toList!831 e!81592) (_1!1271 (ite c!22717 (ite c!22710 (tuple2!2521 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2521 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (_2!1271 (ite c!22717 (ite c!22710 (tuple2!2521 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2521 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))) lt!64808)))

(declare-fun b!125707 () Bool)

(declare-fun call!13436 () List!1676)

(assert (=> b!125707 (= e!82109 call!13436)))

(declare-fun b!125708 () Bool)

(assert (=> b!125708 (= e!82111 (contains!862 lt!64808 (tuple2!2521 (_1!1271 (ite c!22717 (ite c!22710 (tuple2!2521 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2521 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (_2!1271 (ite c!22717 (ite c!22710 (tuple2!2521 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2521 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(declare-fun e!82110 () List!1676)

(declare-fun bm!13433 () Bool)

(assert (=> bm!13433 (= call!13436 ($colon$colon!87 e!82110 (ite c!22955 (h!2273 (toList!831 e!81592)) (tuple2!2521 (_1!1271 (ite c!22717 (ite c!22710 (tuple2!2521 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2521 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (_2!1271 (ite c!22717 (ite c!22710 (tuple2!2521 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2521 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))))

(declare-fun c!22956 () Bool)

(assert (=> bm!13433 (= c!22956 c!22955)))

(declare-fun bm!13434 () Bool)

(declare-fun call!13437 () List!1676)

(assert (=> bm!13434 (= call!13437 call!13436)))

(declare-fun bm!13435 () Bool)

(assert (=> bm!13435 (= call!13438 call!13437)))

(declare-fun b!125709 () Bool)

(assert (=> b!125709 (= e!82109 e!82112)))

(declare-fun c!22954 () Bool)

(assert (=> b!125709 (= c!22954 (and ((_ is Cons!1672) (toList!831 e!81592)) (= (_1!1271 (h!2273 (toList!831 e!81592))) (_1!1271 (ite c!22717 (ite c!22710 (tuple2!2521 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2521 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(declare-fun b!125710 () Bool)

(assert (=> b!125710 (= e!82108 call!13438)))

(declare-fun b!125711 () Bool)

(assert (=> b!125711 (= e!82110 (ite c!22954 (t!5995 (toList!831 e!81592)) (ite c!22953 (Cons!1672 (h!2273 (toList!831 e!81592)) (t!5995 (toList!831 e!81592))) Nil!1673)))))

(declare-fun b!125712 () Bool)

(assert (=> b!125712 (= e!82110 (insertStrictlySorted!85 (t!5995 (toList!831 e!81592)) (_1!1271 (ite c!22717 (ite c!22710 (tuple2!2521 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2521 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (_2!1271 (ite c!22717 (ite c!22710 (tuple2!2521 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2521 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!125713 () Bool)

(assert (=> b!125713 (= e!82112 call!13437)))

(assert (= (and d!37999 c!22955) b!125707))

(assert (= (and d!37999 (not c!22955)) b!125709))

(assert (= (and b!125709 c!22954) b!125713))

(assert (= (and b!125709 (not c!22954)) b!125705))

(assert (= (and b!125705 c!22953) b!125704))

(assert (= (and b!125705 (not c!22953)) b!125710))

(assert (= (or b!125704 b!125710) bm!13435))

(assert (= (or b!125713 bm!13435) bm!13434))

(assert (= (or b!125707 bm!13434) bm!13433))

(assert (= (and bm!13433 c!22956) b!125712))

(assert (= (and bm!13433 (not c!22956)) b!125711))

(assert (= (and d!37999 res!60832) b!125706))

(assert (= (and b!125706 res!60833) b!125708))

(declare-fun m!146585 () Bool)

(assert (=> d!37999 m!146585))

(declare-fun m!146587 () Bool)

(assert (=> d!37999 m!146587))

(declare-fun m!146589 () Bool)

(assert (=> bm!13433 m!146589))

(declare-fun m!146591 () Bool)

(assert (=> b!125708 m!146591))

(declare-fun m!146593 () Bool)

(assert (=> b!125706 m!146593))

(declare-fun m!146595 () Bool)

(assert (=> b!125712 m!146595))

(assert (=> d!37577 d!37999))

(assert (=> d!37587 d!37771))

(declare-fun d!38001 () Bool)

(assert (=> d!38001 (= (get!1449 (getValueByKey!167 (toList!831 lt!64108) #b0000000000000000000000000000000000000000000000000000000000000000)) (v!3114 (getValueByKey!167 (toList!831 lt!64108) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!37609 d!38001))

(assert (=> d!37609 d!37799))

(declare-fun d!38003 () Bool)

(declare-fun res!60835 () Bool)

(declare-fun e!82113 () Bool)

(assert (=> d!38003 (=> (not res!60835) (not e!82113))))

(assert (=> d!38003 (= res!60835 (validMask!0 (mask!7009 (_2!1272 lt!64219))))))

(assert (=> d!38003 (= (simpleValid!86 (_2!1272 lt!64219)) e!82113)))

(declare-fun b!125716 () Bool)

(declare-fun res!60834 () Bool)

(assert (=> b!125716 (=> (not res!60834) (not e!82113))))

(assert (=> b!125716 (= res!60834 (= (size!2479 (_2!1272 lt!64219)) (bvadd (_size!576 (_2!1272 lt!64219)) (bvsdiv (bvadd (extraKeys!2548 (_2!1272 lt!64219)) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!125714 () Bool)

(declare-fun res!60837 () Bool)

(assert (=> b!125714 (=> (not res!60837) (not e!82113))))

(assert (=> b!125714 (= res!60837 (and (= (size!2474 (_values!2746 (_2!1272 lt!64219))) (bvadd (mask!7009 (_2!1272 lt!64219)) #b00000000000000000000000000000001)) (= (size!2473 (_keys!4492 (_2!1272 lt!64219))) (size!2474 (_values!2746 (_2!1272 lt!64219)))) (bvsge (_size!576 (_2!1272 lt!64219)) #b00000000000000000000000000000000) (bvsle (_size!576 (_2!1272 lt!64219)) (bvadd (mask!7009 (_2!1272 lt!64219)) #b00000000000000000000000000000001))))))

(declare-fun b!125717 () Bool)

(assert (=> b!125717 (= e!82113 (and (bvsge (extraKeys!2548 (_2!1272 lt!64219)) #b00000000000000000000000000000000) (bvsle (extraKeys!2548 (_2!1272 lt!64219)) #b00000000000000000000000000000011) (bvsge (_vacant!576 (_2!1272 lt!64219)) #b00000000000000000000000000000000)))))

(declare-fun b!125715 () Bool)

(declare-fun res!60836 () Bool)

(assert (=> b!125715 (=> (not res!60836) (not e!82113))))

(assert (=> b!125715 (= res!60836 (bvsge (size!2479 (_2!1272 lt!64219)) (_size!576 (_2!1272 lt!64219))))))

(assert (= (and d!38003 res!60835) b!125714))

(assert (= (and b!125714 res!60837) b!125715))

(assert (= (and b!125715 res!60836) b!125716))

(assert (= (and b!125716 res!60834) b!125717))

(assert (=> d!38003 m!146359))

(declare-fun m!146597 () Bool)

(assert (=> b!125716 m!146597))

(assert (=> b!125715 m!146597))

(assert (=> d!37593 d!38003))

(declare-fun d!38005 () Bool)

(declare-fun res!60838 () Bool)

(declare-fun e!82114 () Bool)

(assert (=> d!38005 (=> res!60838 e!82114)))

(assert (=> d!38005 (= res!60838 (and ((_ is Cons!1672) (t!5995 (toList!831 lt!64044))) (= (_1!1271 (h!2273 (t!5995 (toList!831 lt!64044)))) (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355))))))

(assert (=> d!38005 (= (containsKey!170 (t!5995 (toList!831 lt!64044)) (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355)) e!82114)))

(declare-fun b!125718 () Bool)

(declare-fun e!82115 () Bool)

(assert (=> b!125718 (= e!82114 e!82115)))

(declare-fun res!60839 () Bool)

(assert (=> b!125718 (=> (not res!60839) (not e!82115))))

(assert (=> b!125718 (= res!60839 (and (or (not ((_ is Cons!1672) (t!5995 (toList!831 lt!64044)))) (bvsle (_1!1271 (h!2273 (t!5995 (toList!831 lt!64044)))) (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355))) ((_ is Cons!1672) (t!5995 (toList!831 lt!64044))) (bvslt (_1!1271 (h!2273 (t!5995 (toList!831 lt!64044)))) (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355))))))

(declare-fun b!125719 () Bool)

(assert (=> b!125719 (= e!82115 (containsKey!170 (t!5995 (t!5995 (toList!831 lt!64044))) (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355)))))

(assert (= (and d!38005 (not res!60838)) b!125718))

(assert (= (and b!125718 res!60839) b!125719))

(assert (=> b!125719 m!144797))

(declare-fun m!146599 () Bool)

(assert (=> b!125719 m!146599))

(assert (=> b!124949 d!38005))

(declare-fun d!38007 () Bool)

(declare-fun res!60840 () Bool)

(declare-fun e!82116 () Bool)

(assert (=> d!38007 (=> res!60840 e!82116)))

(assert (=> d!38007 (= res!60840 (and ((_ is Cons!1672) (toList!831 lt!64108)) (= (_1!1271 (h!2273 (toList!831 lt!64108))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!38007 (= (containsKey!170 (toList!831 lt!64108) #b1000000000000000000000000000000000000000000000000000000000000000) e!82116)))

(declare-fun b!125720 () Bool)

(declare-fun e!82117 () Bool)

(assert (=> b!125720 (= e!82116 e!82117)))

(declare-fun res!60841 () Bool)

(assert (=> b!125720 (=> (not res!60841) (not e!82117))))

(assert (=> b!125720 (= res!60841 (and (or (not ((_ is Cons!1672) (toList!831 lt!64108))) (bvsle (_1!1271 (h!2273 (toList!831 lt!64108))) #b1000000000000000000000000000000000000000000000000000000000000000)) ((_ is Cons!1672) (toList!831 lt!64108)) (bvslt (_1!1271 (h!2273 (toList!831 lt!64108))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!125721 () Bool)

(assert (=> b!125721 (= e!82117 (containsKey!170 (t!5995 (toList!831 lt!64108)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!38007 (not res!60840)) b!125720))

(assert (= (and b!125720 res!60841) b!125721))

(declare-fun m!146601 () Bool)

(assert (=> b!125721 m!146601))

(assert (=> d!37591 d!38007))

(declare-fun d!38009 () Bool)

(declare-fun e!82118 () Bool)

(assert (=> d!38009 e!82118))

(declare-fun res!60842 () Bool)

(assert (=> d!38009 (=> res!60842 e!82118)))

(declare-fun lt!64809 () Bool)

(assert (=> d!38009 (= res!60842 (not lt!64809))))

(declare-fun lt!64812 () Bool)

(assert (=> d!38009 (= lt!64809 lt!64812)))

(declare-fun lt!64811 () Unit!3871)

(declare-fun e!82119 () Unit!3871)

(assert (=> d!38009 (= lt!64811 e!82119)))

(declare-fun c!22957 () Bool)

(assert (=> d!38009 (= c!22957 lt!64812)))

(assert (=> d!38009 (= lt!64812 (containsKey!170 (toList!831 lt!64329) (select (arr!2210 (_keys!4492 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> d!38009 (= (contains!861 lt!64329 (select (arr!2210 (_keys!4492 newMap!16)) #b00000000000000000000000000000000)) lt!64809)))

(declare-fun b!125722 () Bool)

(declare-fun lt!64810 () Unit!3871)

(assert (=> b!125722 (= e!82119 lt!64810)))

(assert (=> b!125722 (= lt!64810 (lemmaContainsKeyImpliesGetValueByKeyDefined!118 (toList!831 lt!64329) (select (arr!2210 (_keys!4492 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!125722 (isDefined!119 (getValueByKey!167 (toList!831 lt!64329) (select (arr!2210 (_keys!4492 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!125723 () Bool)

(declare-fun Unit!3914 () Unit!3871)

(assert (=> b!125723 (= e!82119 Unit!3914)))

(declare-fun b!125724 () Bool)

(assert (=> b!125724 (= e!82118 (isDefined!119 (getValueByKey!167 (toList!831 lt!64329) (select (arr!2210 (_keys!4492 newMap!16)) #b00000000000000000000000000000000))))))

(assert (= (and d!38009 c!22957) b!125722))

(assert (= (and d!38009 (not c!22957)) b!125723))

(assert (= (and d!38009 (not res!60842)) b!125724))

(assert (=> d!38009 m!145113))

(declare-fun m!146603 () Bool)

(assert (=> d!38009 m!146603))

(assert (=> b!125722 m!145113))

(declare-fun m!146605 () Bool)

(assert (=> b!125722 m!146605))

(assert (=> b!125722 m!145113))

(assert (=> b!125722 m!146019))

(assert (=> b!125722 m!146019))

(declare-fun m!146607 () Bool)

(assert (=> b!125722 m!146607))

(assert (=> b!125724 m!145113))

(assert (=> b!125724 m!146019))

(assert (=> b!125724 m!146019))

(assert (=> b!125724 m!146607))

(assert (=> b!125075 d!38009))

(declare-fun b!125726 () Bool)

(declare-fun e!82120 () Option!173)

(declare-fun e!82121 () Option!173)

(assert (=> b!125726 (= e!82120 e!82121)))

(declare-fun c!22959 () Bool)

(assert (=> b!125726 (= c!22959 (and ((_ is Cons!1672) (t!5995 (toList!831 lt!64044))) (not (= (_1!1271 (h!2273 (t!5995 (toList!831 lt!64044)))) (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355)))))))

(declare-fun b!125727 () Bool)

(assert (=> b!125727 (= e!82121 (getValueByKey!167 (t!5995 (t!5995 (toList!831 lt!64044))) (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355)))))

(declare-fun c!22958 () Bool)

(declare-fun d!38011 () Bool)

(assert (=> d!38011 (= c!22958 (and ((_ is Cons!1672) (t!5995 (toList!831 lt!64044))) (= (_1!1271 (h!2273 (t!5995 (toList!831 lt!64044)))) (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355))))))

(assert (=> d!38011 (= (getValueByKey!167 (t!5995 (toList!831 lt!64044)) (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355)) e!82120)))

(declare-fun b!125728 () Bool)

(assert (=> b!125728 (= e!82121 None!171)))

(declare-fun b!125725 () Bool)

(assert (=> b!125725 (= e!82120 (Some!172 (_2!1271 (h!2273 (t!5995 (toList!831 lt!64044))))))))

(assert (= (and d!38011 c!22958) b!125725))

(assert (= (and d!38011 (not c!22958)) b!125726))

(assert (= (and b!125726 c!22959) b!125727))

(assert (= (and b!125726 (not c!22959)) b!125728))

(assert (=> b!125727 m!144797))

(declare-fun m!146609 () Bool)

(assert (=> b!125727 m!146609))

(assert (=> b!124885 d!38011))

(declare-fun d!38013 () Bool)

(assert (=> d!38013 (isDefined!119 (getValueByKey!167 (toList!831 call!13342) (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355)))))

(declare-fun lt!64813 () Unit!3871)

(assert (=> d!38013 (= lt!64813 (choose!762 (toList!831 call!13342) (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355)))))

(declare-fun e!82122 () Bool)

(assert (=> d!38013 e!82122))

(declare-fun res!60843 () Bool)

(assert (=> d!38013 (=> (not res!60843) (not e!82122))))

(assert (=> d!38013 (= res!60843 (isStrictlySorted!303 (toList!831 call!13342)))))

(assert (=> d!38013 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!118 (toList!831 call!13342) (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355)) lt!64813)))

(declare-fun b!125729 () Bool)

(assert (=> b!125729 (= e!82122 (containsKey!170 (toList!831 call!13342) (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355)))))

(assert (= (and d!38013 res!60843) b!125729))

(assert (=> d!38013 m!144797))

(assert (=> d!38013 m!145559))

(assert (=> d!38013 m!145559))

(assert (=> d!38013 m!145561))

(assert (=> d!38013 m!144797))

(declare-fun m!146611 () Bool)

(assert (=> d!38013 m!146611))

(declare-fun m!146613 () Bool)

(assert (=> d!38013 m!146613))

(assert (=> b!125729 m!144797))

(assert (=> b!125729 m!145555))

(assert (=> b!125207 d!38013))

(assert (=> b!125207 d!37781))

(assert (=> b!125207 d!37783))

(declare-fun b!125730 () Bool)

(declare-fun e!82124 () Bool)

(assert (=> b!125730 (= e!82124 (contains!863 (ite c!22771 (Cons!1673 (select (arr!2210 (_keys!4492 newMap!16)) #b00000000000000000000000000000000) Nil!1674) Nil!1674) (select (arr!2210 (_keys!4492 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!125731 () Bool)

(declare-fun e!82123 () Bool)

(declare-fun call!13439 () Bool)

(assert (=> b!125731 (= e!82123 call!13439)))

(declare-fun bm!13436 () Bool)

(declare-fun c!22960 () Bool)

(assert (=> bm!13436 (= call!13439 (arrayNoDuplicates!0 (_keys!4492 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!22960 (Cons!1673 (select (arr!2210 (_keys!4492 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!22771 (Cons!1673 (select (arr!2210 (_keys!4492 newMap!16)) #b00000000000000000000000000000000) Nil!1674) Nil!1674)) (ite c!22771 (Cons!1673 (select (arr!2210 (_keys!4492 newMap!16)) #b00000000000000000000000000000000) Nil!1674) Nil!1674))))))

(declare-fun b!125732 () Bool)

(declare-fun e!82126 () Bool)

(declare-fun e!82125 () Bool)

(assert (=> b!125732 (= e!82126 e!82125)))

(declare-fun res!60844 () Bool)

(assert (=> b!125732 (=> (not res!60844) (not e!82125))))

(assert (=> b!125732 (= res!60844 (not e!82124))))

(declare-fun res!60846 () Bool)

(assert (=> b!125732 (=> (not res!60846) (not e!82124))))

(assert (=> b!125732 (= res!60846 (validKeyInArray!0 (select (arr!2210 (_keys!4492 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!38015 () Bool)

(declare-fun res!60845 () Bool)

(assert (=> d!38015 (=> res!60845 e!82126)))

(assert (=> d!38015 (= res!60845 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2473 (_keys!4492 newMap!16))))))

(assert (=> d!38015 (= (arrayNoDuplicates!0 (_keys!4492 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!22771 (Cons!1673 (select (arr!2210 (_keys!4492 newMap!16)) #b00000000000000000000000000000000) Nil!1674) Nil!1674)) e!82126)))

(declare-fun b!125733 () Bool)

(assert (=> b!125733 (= e!82125 e!82123)))

(assert (=> b!125733 (= c!22960 (validKeyInArray!0 (select (arr!2210 (_keys!4492 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!125734 () Bool)

(assert (=> b!125734 (= e!82123 call!13439)))

(assert (= (and d!38015 (not res!60845)) b!125732))

(assert (= (and b!125732 res!60846) b!125730))

(assert (= (and b!125732 res!60844) b!125733))

(assert (= (and b!125733 c!22960) b!125731))

(assert (= (and b!125733 (not c!22960)) b!125734))

(assert (= (or b!125731 b!125734) bm!13436))

(assert (=> b!125730 m!146189))

(assert (=> b!125730 m!146189))

(declare-fun m!146615 () Bool)

(assert (=> b!125730 m!146615))

(assert (=> bm!13436 m!146189))

(declare-fun m!146617 () Bool)

(assert (=> bm!13436 m!146617))

(assert (=> b!125732 m!146189))

(assert (=> b!125732 m!146189))

(assert (=> b!125732 m!146191))

(assert (=> b!125733 m!146189))

(assert (=> b!125733 m!146189))

(assert (=> b!125733 m!146191))

(assert (=> bm!13361 d!38015))

(declare-fun d!38017 () Bool)

(declare-fun e!82127 () Bool)

(assert (=> d!38017 e!82127))

(declare-fun res!60847 () Bool)

(assert (=> d!38017 (=> res!60847 e!82127)))

(declare-fun lt!64814 () Bool)

(assert (=> d!38017 (= res!60847 (not lt!64814))))

(declare-fun lt!64817 () Bool)

(assert (=> d!38017 (= lt!64814 lt!64817)))

(declare-fun lt!64816 () Unit!3871)

(declare-fun e!82128 () Unit!3871)

(assert (=> d!38017 (= lt!64816 e!82128)))

(declare-fun c!22961 () Bool)

(assert (=> d!38017 (= c!22961 lt!64817)))

(assert (=> d!38017 (= lt!64817 (containsKey!170 (toList!831 lt!64267) (_1!1271 (tuple2!2521 lt!64114 (zeroValue!2628 (v!3108 (underlying!436 thiss!992)))))))))

(assert (=> d!38017 (= (contains!861 lt!64267 (_1!1271 (tuple2!2521 lt!64114 (zeroValue!2628 (v!3108 (underlying!436 thiss!992)))))) lt!64814)))

(declare-fun b!125735 () Bool)

(declare-fun lt!64815 () Unit!3871)

(assert (=> b!125735 (= e!82128 lt!64815)))

(assert (=> b!125735 (= lt!64815 (lemmaContainsKeyImpliesGetValueByKeyDefined!118 (toList!831 lt!64267) (_1!1271 (tuple2!2521 lt!64114 (zeroValue!2628 (v!3108 (underlying!436 thiss!992)))))))))

(assert (=> b!125735 (isDefined!119 (getValueByKey!167 (toList!831 lt!64267) (_1!1271 (tuple2!2521 lt!64114 (zeroValue!2628 (v!3108 (underlying!436 thiss!992)))))))))

(declare-fun b!125736 () Bool)

(declare-fun Unit!3915 () Unit!3871)

(assert (=> b!125736 (= e!82128 Unit!3915)))

(declare-fun b!125737 () Bool)

(assert (=> b!125737 (= e!82127 (isDefined!119 (getValueByKey!167 (toList!831 lt!64267) (_1!1271 (tuple2!2521 lt!64114 (zeroValue!2628 (v!3108 (underlying!436 thiss!992))))))))))

(assert (= (and d!38017 c!22961) b!125735))

(assert (= (and d!38017 (not c!22961)) b!125736))

(assert (= (and d!38017 (not res!60847)) b!125737))

(declare-fun m!146619 () Bool)

(assert (=> d!38017 m!146619))

(declare-fun m!146621 () Bool)

(assert (=> b!125735 m!146621))

(assert (=> b!125735 m!145137))

(assert (=> b!125735 m!145137))

(declare-fun m!146623 () Bool)

(assert (=> b!125735 m!146623))

(assert (=> b!125737 m!145137))

(assert (=> b!125737 m!145137))

(assert (=> b!125737 m!146623))

(assert (=> d!37547 d!38017))

(declare-fun b!125739 () Bool)

(declare-fun e!82129 () Option!173)

(declare-fun e!82130 () Option!173)

(assert (=> b!125739 (= e!82129 e!82130)))

(declare-fun c!22963 () Bool)

(assert (=> b!125739 (= c!22963 (and ((_ is Cons!1672) lt!64268) (not (= (_1!1271 (h!2273 lt!64268)) (_1!1271 (tuple2!2521 lt!64114 (zeroValue!2628 (v!3108 (underlying!436 thiss!992)))))))))))

(declare-fun b!125740 () Bool)

(assert (=> b!125740 (= e!82130 (getValueByKey!167 (t!5995 lt!64268) (_1!1271 (tuple2!2521 lt!64114 (zeroValue!2628 (v!3108 (underlying!436 thiss!992)))))))))

(declare-fun d!38019 () Bool)

(declare-fun c!22962 () Bool)

(assert (=> d!38019 (= c!22962 (and ((_ is Cons!1672) lt!64268) (= (_1!1271 (h!2273 lt!64268)) (_1!1271 (tuple2!2521 lt!64114 (zeroValue!2628 (v!3108 (underlying!436 thiss!992))))))))))

(assert (=> d!38019 (= (getValueByKey!167 lt!64268 (_1!1271 (tuple2!2521 lt!64114 (zeroValue!2628 (v!3108 (underlying!436 thiss!992)))))) e!82129)))

(declare-fun b!125741 () Bool)

(assert (=> b!125741 (= e!82130 None!171)))

(declare-fun b!125738 () Bool)

(assert (=> b!125738 (= e!82129 (Some!172 (_2!1271 (h!2273 lt!64268))))))

(assert (= (and d!38019 c!22962) b!125738))

(assert (= (and d!38019 (not c!22962)) b!125739))

(assert (= (and b!125739 c!22963) b!125740))

(assert (= (and b!125739 (not c!22963)) b!125741))

(declare-fun m!146625 () Bool)

(assert (=> b!125740 m!146625))

(assert (=> d!37547 d!38019))

(declare-fun d!38021 () Bool)

(assert (=> d!38021 (= (getValueByKey!167 lt!64268 (_1!1271 (tuple2!2521 lt!64114 (zeroValue!2628 (v!3108 (underlying!436 thiss!992)))))) (Some!172 (_2!1271 (tuple2!2521 lt!64114 (zeroValue!2628 (v!3108 (underlying!436 thiss!992)))))))))

(declare-fun lt!64818 () Unit!3871)

(assert (=> d!38021 (= lt!64818 (choose!763 lt!64268 (_1!1271 (tuple2!2521 lt!64114 (zeroValue!2628 (v!3108 (underlying!436 thiss!992))))) (_2!1271 (tuple2!2521 lt!64114 (zeroValue!2628 (v!3108 (underlying!436 thiss!992)))))))))

(declare-fun e!82131 () Bool)

(assert (=> d!38021 e!82131))

(declare-fun res!60848 () Bool)

(assert (=> d!38021 (=> (not res!60848) (not e!82131))))

(assert (=> d!38021 (= res!60848 (isStrictlySorted!303 lt!64268))))

(assert (=> d!38021 (= (lemmaContainsTupThenGetReturnValue!82 lt!64268 (_1!1271 (tuple2!2521 lt!64114 (zeroValue!2628 (v!3108 (underlying!436 thiss!992))))) (_2!1271 (tuple2!2521 lt!64114 (zeroValue!2628 (v!3108 (underlying!436 thiss!992)))))) lt!64818)))

(declare-fun b!125742 () Bool)

(declare-fun res!60849 () Bool)

(assert (=> b!125742 (=> (not res!60849) (not e!82131))))

(assert (=> b!125742 (= res!60849 (containsKey!170 lt!64268 (_1!1271 (tuple2!2521 lt!64114 (zeroValue!2628 (v!3108 (underlying!436 thiss!992)))))))))

(declare-fun b!125743 () Bool)

(assert (=> b!125743 (= e!82131 (contains!862 lt!64268 (tuple2!2521 (_1!1271 (tuple2!2521 lt!64114 (zeroValue!2628 (v!3108 (underlying!436 thiss!992))))) (_2!1271 (tuple2!2521 lt!64114 (zeroValue!2628 (v!3108 (underlying!436 thiss!992))))))))))

(assert (= (and d!38021 res!60848) b!125742))

(assert (= (and b!125742 res!60849) b!125743))

(assert (=> d!38021 m!145131))

(declare-fun m!146627 () Bool)

(assert (=> d!38021 m!146627))

(declare-fun m!146629 () Bool)

(assert (=> d!38021 m!146629))

(declare-fun m!146631 () Bool)

(assert (=> b!125742 m!146631))

(declare-fun m!146633 () Bool)

(assert (=> b!125743 m!146633))

(assert (=> d!37547 d!38021))

(declare-fun b!125744 () Bool)

(declare-fun e!82132 () List!1676)

(declare-fun call!13442 () List!1676)

(assert (=> b!125744 (= e!82132 call!13442)))

(declare-fun c!22964 () Bool)

(declare-fun b!125745 () Bool)

(assert (=> b!125745 (= c!22964 (and ((_ is Cons!1672) (toList!831 lt!64122)) (bvsgt (_1!1271 (h!2273 (toList!831 lt!64122))) (_1!1271 (tuple2!2521 lt!64114 (zeroValue!2628 (v!3108 (underlying!436 thiss!992))))))))))

(declare-fun e!82136 () List!1676)

(assert (=> b!125745 (= e!82136 e!82132)))

(declare-fun b!125746 () Bool)

(declare-fun res!60851 () Bool)

(declare-fun e!82135 () Bool)

(assert (=> b!125746 (=> (not res!60851) (not e!82135))))

(declare-fun lt!64819 () List!1676)

(assert (=> b!125746 (= res!60851 (containsKey!170 lt!64819 (_1!1271 (tuple2!2521 lt!64114 (zeroValue!2628 (v!3108 (underlying!436 thiss!992)))))))))

(declare-fun d!38023 () Bool)

(assert (=> d!38023 e!82135))

(declare-fun res!60850 () Bool)

(assert (=> d!38023 (=> (not res!60850) (not e!82135))))

(assert (=> d!38023 (= res!60850 (isStrictlySorted!303 lt!64819))))

(declare-fun e!82133 () List!1676)

(assert (=> d!38023 (= lt!64819 e!82133)))

(declare-fun c!22966 () Bool)

(assert (=> d!38023 (= c!22966 (and ((_ is Cons!1672) (toList!831 lt!64122)) (bvslt (_1!1271 (h!2273 (toList!831 lt!64122))) (_1!1271 (tuple2!2521 lt!64114 (zeroValue!2628 (v!3108 (underlying!436 thiss!992))))))))))

(assert (=> d!38023 (isStrictlySorted!303 (toList!831 lt!64122))))

(assert (=> d!38023 (= (insertStrictlySorted!85 (toList!831 lt!64122) (_1!1271 (tuple2!2521 lt!64114 (zeroValue!2628 (v!3108 (underlying!436 thiss!992))))) (_2!1271 (tuple2!2521 lt!64114 (zeroValue!2628 (v!3108 (underlying!436 thiss!992)))))) lt!64819)))

(declare-fun b!125747 () Bool)

(declare-fun call!13440 () List!1676)

(assert (=> b!125747 (= e!82133 call!13440)))

(declare-fun b!125748 () Bool)

(assert (=> b!125748 (= e!82135 (contains!862 lt!64819 (tuple2!2521 (_1!1271 (tuple2!2521 lt!64114 (zeroValue!2628 (v!3108 (underlying!436 thiss!992))))) (_2!1271 (tuple2!2521 lt!64114 (zeroValue!2628 (v!3108 (underlying!436 thiss!992))))))))))

(declare-fun e!82134 () List!1676)

(declare-fun bm!13437 () Bool)

(assert (=> bm!13437 (= call!13440 ($colon$colon!87 e!82134 (ite c!22966 (h!2273 (toList!831 lt!64122)) (tuple2!2521 (_1!1271 (tuple2!2521 lt!64114 (zeroValue!2628 (v!3108 (underlying!436 thiss!992))))) (_2!1271 (tuple2!2521 lt!64114 (zeroValue!2628 (v!3108 (underlying!436 thiss!992)))))))))))

(declare-fun c!22967 () Bool)

(assert (=> bm!13437 (= c!22967 c!22966)))

(declare-fun bm!13438 () Bool)

(declare-fun call!13441 () List!1676)

(assert (=> bm!13438 (= call!13441 call!13440)))

(declare-fun bm!13439 () Bool)

(assert (=> bm!13439 (= call!13442 call!13441)))

(declare-fun b!125749 () Bool)

(assert (=> b!125749 (= e!82133 e!82136)))

(declare-fun c!22965 () Bool)

(assert (=> b!125749 (= c!22965 (and ((_ is Cons!1672) (toList!831 lt!64122)) (= (_1!1271 (h!2273 (toList!831 lt!64122))) (_1!1271 (tuple2!2521 lt!64114 (zeroValue!2628 (v!3108 (underlying!436 thiss!992))))))))))

(declare-fun b!125750 () Bool)

(assert (=> b!125750 (= e!82132 call!13442)))

(declare-fun b!125751 () Bool)

(assert (=> b!125751 (= e!82134 (ite c!22965 (t!5995 (toList!831 lt!64122)) (ite c!22964 (Cons!1672 (h!2273 (toList!831 lt!64122)) (t!5995 (toList!831 lt!64122))) Nil!1673)))))

(declare-fun b!125752 () Bool)

(assert (=> b!125752 (= e!82134 (insertStrictlySorted!85 (t!5995 (toList!831 lt!64122)) (_1!1271 (tuple2!2521 lt!64114 (zeroValue!2628 (v!3108 (underlying!436 thiss!992))))) (_2!1271 (tuple2!2521 lt!64114 (zeroValue!2628 (v!3108 (underlying!436 thiss!992)))))))))

(declare-fun b!125753 () Bool)

(assert (=> b!125753 (= e!82136 call!13441)))

(assert (= (and d!38023 c!22966) b!125747))

(assert (= (and d!38023 (not c!22966)) b!125749))

(assert (= (and b!125749 c!22965) b!125753))

(assert (= (and b!125749 (not c!22965)) b!125745))

(assert (= (and b!125745 c!22964) b!125744))

(assert (= (and b!125745 (not c!22964)) b!125750))

(assert (= (or b!125744 b!125750) bm!13439))

(assert (= (or b!125753 bm!13439) bm!13438))

(assert (= (or b!125747 bm!13438) bm!13437))

(assert (= (and bm!13437 c!22967) b!125752))

(assert (= (and bm!13437 (not c!22967)) b!125751))

(assert (= (and d!38023 res!60850) b!125746))

(assert (= (and b!125746 res!60851) b!125748))

(declare-fun m!146635 () Bool)

(assert (=> d!38023 m!146635))

(declare-fun m!146637 () Bool)

(assert (=> d!38023 m!146637))

(declare-fun m!146639 () Bool)

(assert (=> bm!13437 m!146639))

(declare-fun m!146641 () Bool)

(assert (=> b!125748 m!146641))

(declare-fun m!146643 () Bool)

(assert (=> b!125746 m!146643))

(declare-fun m!146645 () Bool)

(assert (=> b!125752 m!146645))

(assert (=> d!37547 d!38023))

(assert (=> d!37541 d!37771))

(declare-fun b!125772 () Bool)

(declare-fun e!82150 () Bool)

(declare-fun lt!64825 () SeekEntryResult!263)

(assert (=> b!125772 (= e!82150 (bvsge (x!14812 lt!64825) #b01111111111111111111111111111110))))

(declare-fun b!125773 () Bool)

(declare-fun e!82148 () Bool)

(assert (=> b!125773 (= e!82150 e!82148)))

(declare-fun res!60858 () Bool)

(assert (=> b!125773 (= res!60858 (and ((_ is Intermediate!263) lt!64825) (not (undefined!1075 lt!64825)) (bvslt (x!14812 lt!64825) #b01111111111111111111111111111110) (bvsge (x!14812 lt!64825) #b00000000000000000000000000000000) (bvsge (x!14812 lt!64825) #b00000000000000000000000000000000)))))

(assert (=> b!125773 (=> (not res!60858) (not e!82148))))

(declare-fun b!125774 () Bool)

(assert (=> b!125774 (and (bvsge (index!3208 lt!64825) #b00000000000000000000000000000000) (bvslt (index!3208 lt!64825) (size!2473 (_keys!4492 newMap!16))))))

(declare-fun res!60860 () Bool)

(assert (=> b!125774 (= res!60860 (= (select (arr!2210 (_keys!4492 newMap!16)) (index!3208 lt!64825)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!82151 () Bool)

(assert (=> b!125774 (=> res!60860 e!82151)))

(declare-fun b!125775 () Bool)

(declare-fun e!82147 () SeekEntryResult!263)

(declare-fun e!82149 () SeekEntryResult!263)

(assert (=> b!125775 (= e!82147 e!82149)))

(declare-fun lt!64824 () (_ BitVec 64))

(declare-fun c!22976 () Bool)

(assert (=> b!125775 (= c!22976 (or (= lt!64824 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355)) (= (bvadd lt!64824 lt!64824) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!125776 () Bool)

(assert (=> b!125776 (= e!82149 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355) (mask!7009 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (mask!7009 newMap!16)) (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355) (_keys!4492 newMap!16) (mask!7009 newMap!16)))))

(declare-fun d!38025 () Bool)

(assert (=> d!38025 e!82150))

(declare-fun c!22974 () Bool)

(assert (=> d!38025 (= c!22974 (and ((_ is Intermediate!263) lt!64825) (undefined!1075 lt!64825)))))

(assert (=> d!38025 (= lt!64825 e!82147)))

(declare-fun c!22975 () Bool)

(assert (=> d!38025 (= c!22975 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!38025 (= lt!64824 (select (arr!2210 (_keys!4492 newMap!16)) (toIndex!0 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355) (mask!7009 newMap!16))))))

(assert (=> d!38025 (validMask!0 (mask!7009 newMap!16))))

(assert (=> d!38025 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355) (mask!7009 newMap!16)) (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355) (_keys!4492 newMap!16) (mask!7009 newMap!16)) lt!64825)))

(declare-fun b!125777 () Bool)

(assert (=> b!125777 (= e!82147 (Intermediate!263 true (toIndex!0 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355) (mask!7009 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun b!125778 () Bool)

(assert (=> b!125778 (= e!82149 (Intermediate!263 false (toIndex!0 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355) (mask!7009 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun b!125779 () Bool)

(assert (=> b!125779 (and (bvsge (index!3208 lt!64825) #b00000000000000000000000000000000) (bvslt (index!3208 lt!64825) (size!2473 (_keys!4492 newMap!16))))))

(assert (=> b!125779 (= e!82151 (= (select (arr!2210 (_keys!4492 newMap!16)) (index!3208 lt!64825)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!125780 () Bool)

(assert (=> b!125780 (and (bvsge (index!3208 lt!64825) #b00000000000000000000000000000000) (bvslt (index!3208 lt!64825) (size!2473 (_keys!4492 newMap!16))))))

(declare-fun res!60859 () Bool)

(assert (=> b!125780 (= res!60859 (= (select (arr!2210 (_keys!4492 newMap!16)) (index!3208 lt!64825)) (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355)))))

(assert (=> b!125780 (=> res!60859 e!82151)))

(assert (=> b!125780 (= e!82148 e!82151)))

(assert (= (and d!38025 c!22975) b!125777))

(assert (= (and d!38025 (not c!22975)) b!125775))

(assert (= (and b!125775 c!22976) b!125778))

(assert (= (and b!125775 (not c!22976)) b!125776))

(assert (= (and d!38025 c!22974) b!125772))

(assert (= (and d!38025 (not c!22974)) b!125773))

(assert (= (and b!125773 res!60858) b!125780))

(assert (= (and b!125780 (not res!60859)) b!125774))

(assert (= (and b!125774 (not res!60860)) b!125779))

(declare-fun m!146647 () Bool)

(assert (=> b!125774 m!146647))

(assert (=> b!125780 m!146647))

(assert (=> d!38025 m!145055))

(declare-fun m!146649 () Bool)

(assert (=> d!38025 m!146649))

(assert (=> d!38025 m!145065))

(assert (=> b!125779 m!146647))

(assert (=> b!125776 m!145055))

(declare-fun m!146651 () Bool)

(assert (=> b!125776 m!146651))

(assert (=> b!125776 m!146651))

(assert (=> b!125776 m!144797))

(declare-fun m!146653 () Bool)

(assert (=> b!125776 m!146653))

(assert (=> d!37527 d!38025))

(declare-fun d!38027 () Bool)

(declare-fun lt!64831 () (_ BitVec 32))

(declare-fun lt!64830 () (_ BitVec 32))

(assert (=> d!38027 (= lt!64831 (bvmul (bvxor lt!64830 (bvlshr lt!64830 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!38027 (= lt!64830 ((_ extract 31 0) (bvand (bvxor (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355) (bvlshr (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!38027 (and (bvsge (mask!7009 newMap!16) #b00000000000000000000000000000000) (let ((res!60861 (let ((h!2275 ((_ extract 31 0) (bvand (bvxor (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355) (bvlshr (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!14916 (bvmul (bvxor h!2275 (bvlshr h!2275 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!14916 (bvlshr x!14916 #b00000000000000000000000000001101)) (mask!7009 newMap!16)))))) (and (bvslt res!60861 (bvadd (mask!7009 newMap!16) #b00000000000000000000000000000001)) (bvsge res!60861 #b00000000000000000000000000000000))))))

(assert (=> d!38027 (= (toIndex!0 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355) (mask!7009 newMap!16)) (bvand (bvxor lt!64831 (bvlshr lt!64831 #b00000000000000000000000000001101)) (mask!7009 newMap!16)))))

(assert (=> d!37527 d!38027))

(assert (=> d!37527 d!37771))

(declare-fun d!38029 () Bool)

(declare-fun e!82152 () Bool)

(assert (=> d!38029 e!82152))

(declare-fun res!60862 () Bool)

(assert (=> d!38029 (=> (not res!60862) (not e!82152))))

(declare-fun lt!64833 () ListLongMap!1631)

(assert (=> d!38029 (= res!60862 (contains!861 lt!64833 (_1!1271 (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!64834 () List!1676)

(assert (=> d!38029 (= lt!64833 (ListLongMap!1632 lt!64834))))

(declare-fun lt!64835 () Unit!3871)

(declare-fun lt!64832 () Unit!3871)

(assert (=> d!38029 (= lt!64835 lt!64832)))

(assert (=> d!38029 (= (getValueByKey!167 lt!64834 (_1!1271 (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!172 (_2!1271 (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!38029 (= lt!64832 (lemmaContainsTupThenGetReturnValue!82 lt!64834 (_1!1271 (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1271 (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!38029 (= lt!64834 (insertStrictlySorted!85 (toList!831 (getCurrentListMap!511 (_keys!4492 newMap!16) (_values!2746 newMap!16) (mask!7009 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16))) (_1!1271 (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1271 (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!38029 (= (+!163 (getCurrentListMap!511 (_keys!4492 newMap!16) (_values!2746 newMap!16) (mask!7009 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16)) (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!64833)))

(declare-fun b!125781 () Bool)

(declare-fun res!60863 () Bool)

(assert (=> b!125781 (=> (not res!60863) (not e!82152))))

(assert (=> b!125781 (= res!60863 (= (getValueByKey!167 (toList!831 lt!64833) (_1!1271 (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!172 (_2!1271 (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!125782 () Bool)

(assert (=> b!125782 (= e!82152 (contains!862 (toList!831 lt!64833) (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!38029 res!60862) b!125781))

(assert (= (and b!125781 res!60863) b!125782))

(declare-fun m!146655 () Bool)

(assert (=> d!38029 m!146655))

(declare-fun m!146657 () Bool)

(assert (=> d!38029 m!146657))

(declare-fun m!146659 () Bool)

(assert (=> d!38029 m!146659))

(declare-fun m!146661 () Bool)

(assert (=> d!38029 m!146661))

(declare-fun m!146663 () Bool)

(assert (=> b!125781 m!146663))

(declare-fun m!146665 () Bool)

(assert (=> b!125782 m!146665))

(assert (=> d!37621 d!38029))

(assert (=> d!37621 d!37587))

(assert (=> d!37621 d!37771))

(declare-fun d!38031 () Bool)

(assert (=> d!38031 (= (+!163 (getCurrentListMap!511 (_keys!4492 newMap!16) (_values!2746 newMap!16) (mask!7009 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16)) (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (getCurrentListMap!511 (_keys!4492 newMap!16) (_values!2746 newMap!16) (mask!7009 newMap!16) lt!64205 (zeroValue!2628 newMap!16) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16)))))

(assert (=> d!38031 true))

(declare-fun _$8!106 () Unit!3871)

(assert (=> d!38031 (= (choose!760 (_keys!4492 newMap!16) (_values!2746 newMap!16) (mask!7009 newMap!16) (extraKeys!2548 newMap!16) lt!64205 (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2763 newMap!16)) _$8!106)))

(declare-fun bs!5228 () Bool)

(assert (= bs!5228 d!38031))

(assert (=> bs!5228 m!144893))

(assert (=> bs!5228 m!144893))

(assert (=> bs!5228 m!145543))

(assert (=> bs!5228 m!144795))

(assert (=> bs!5228 m!145545))

(assert (=> d!37621 d!38031))

(declare-fun call!13445 () ListLongMap!1631)

(declare-fun c!22980 () Bool)

(declare-fun call!13443 () ListLongMap!1631)

(declare-fun call!13448 () ListLongMap!1631)

(declare-fun bm!13440 () Bool)

(declare-fun call!13449 () ListLongMap!1631)

(declare-fun c!22982 () Bool)

(assert (=> bm!13440 (= call!13443 (+!163 (ite c!22980 call!13448 (ite c!22982 call!13449 call!13445)) (ite (or c!22980 c!22982) (tuple2!2521 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2628 newMap!16)) (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!125783 () Bool)

(declare-fun e!82161 () Bool)

(declare-fun e!82154 () Bool)

(assert (=> b!125783 (= e!82161 e!82154)))

(declare-fun res!60864 () Bool)

(declare-fun call!13444 () Bool)

(assert (=> b!125783 (= res!60864 call!13444)))

(assert (=> b!125783 (=> (not res!60864) (not e!82154))))

(declare-fun bm!13441 () Bool)

(assert (=> bm!13441 (= call!13449 call!13448)))

(declare-fun b!125785 () Bool)

(declare-fun e!82164 () Bool)

(declare-fun lt!64837 () ListLongMap!1631)

(assert (=> b!125785 (= e!82164 (= (apply!110 lt!64837 (select (arr!2210 (_keys!4492 newMap!16)) #b00000000000000000000000000000000)) (get!1446 (select (arr!2211 (_values!2746 newMap!16)) #b00000000000000000000000000000000) (dynLambda!415 (defaultEntry!2763 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!125785 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2474 (_values!2746 newMap!16))))))

(assert (=> b!125785 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2473 (_keys!4492 newMap!16))))))

(declare-fun bm!13442 () Bool)

(assert (=> bm!13442 (= call!13445 call!13449)))

(declare-fun b!125786 () Bool)

(declare-fun e!82155 () Bool)

(declare-fun e!82160 () Bool)

(assert (=> b!125786 (= e!82155 e!82160)))

(declare-fun res!60871 () Bool)

(declare-fun call!13447 () Bool)

(assert (=> b!125786 (= res!60871 call!13447)))

(assert (=> b!125786 (=> (not res!60871) (not e!82160))))

(declare-fun b!125787 () Bool)

(declare-fun e!82158 () Unit!3871)

(declare-fun lt!64848 () Unit!3871)

(assert (=> b!125787 (= e!82158 lt!64848)))

(declare-fun lt!64851 () ListLongMap!1631)

(assert (=> b!125787 (= lt!64851 (getCurrentListMapNoExtraKeys!130 (_keys!4492 newMap!16) (_values!2746 newMap!16) (mask!7009 newMap!16) lt!64205 (zeroValue!2628 newMap!16) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16)))))

(declare-fun lt!64843 () (_ BitVec 64))

(assert (=> b!125787 (= lt!64843 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!64838 () (_ BitVec 64))

(assert (=> b!125787 (= lt!64838 (select (arr!2210 (_keys!4492 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!64841 () Unit!3871)

(assert (=> b!125787 (= lt!64841 (addStillContains!86 lt!64851 lt!64843 (zeroValue!2628 newMap!16) lt!64838))))

(assert (=> b!125787 (contains!861 (+!163 lt!64851 (tuple2!2521 lt!64843 (zeroValue!2628 newMap!16))) lt!64838)))

(declare-fun lt!64836 () Unit!3871)

(assert (=> b!125787 (= lt!64836 lt!64841)))

(declare-fun lt!64845 () ListLongMap!1631)

(assert (=> b!125787 (= lt!64845 (getCurrentListMapNoExtraKeys!130 (_keys!4492 newMap!16) (_values!2746 newMap!16) (mask!7009 newMap!16) lt!64205 (zeroValue!2628 newMap!16) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16)))))

(declare-fun lt!64854 () (_ BitVec 64))

(assert (=> b!125787 (= lt!64854 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!64840 () (_ BitVec 64))

(assert (=> b!125787 (= lt!64840 (select (arr!2210 (_keys!4492 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!64842 () Unit!3871)

(assert (=> b!125787 (= lt!64842 (addApplyDifferent!86 lt!64845 lt!64854 (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) lt!64840))))

(assert (=> b!125787 (= (apply!110 (+!163 lt!64845 (tuple2!2521 lt!64854 (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!64840) (apply!110 lt!64845 lt!64840))))

(declare-fun lt!64855 () Unit!3871)

(assert (=> b!125787 (= lt!64855 lt!64842)))

(declare-fun lt!64847 () ListLongMap!1631)

(assert (=> b!125787 (= lt!64847 (getCurrentListMapNoExtraKeys!130 (_keys!4492 newMap!16) (_values!2746 newMap!16) (mask!7009 newMap!16) lt!64205 (zeroValue!2628 newMap!16) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16)))))

(declare-fun lt!64853 () (_ BitVec 64))

(assert (=> b!125787 (= lt!64853 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!64850 () (_ BitVec 64))

(assert (=> b!125787 (= lt!64850 (select (arr!2210 (_keys!4492 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!64849 () Unit!3871)

(assert (=> b!125787 (= lt!64849 (addApplyDifferent!86 lt!64847 lt!64853 (zeroValue!2628 newMap!16) lt!64850))))

(assert (=> b!125787 (= (apply!110 (+!163 lt!64847 (tuple2!2521 lt!64853 (zeroValue!2628 newMap!16))) lt!64850) (apply!110 lt!64847 lt!64850))))

(declare-fun lt!64844 () Unit!3871)

(assert (=> b!125787 (= lt!64844 lt!64849)))

(declare-fun lt!64839 () ListLongMap!1631)

(assert (=> b!125787 (= lt!64839 (getCurrentListMapNoExtraKeys!130 (_keys!4492 newMap!16) (_values!2746 newMap!16) (mask!7009 newMap!16) lt!64205 (zeroValue!2628 newMap!16) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16)))))

(declare-fun lt!64846 () (_ BitVec 64))

(assert (=> b!125787 (= lt!64846 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!64857 () (_ BitVec 64))

(assert (=> b!125787 (= lt!64857 (select (arr!2210 (_keys!4492 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!125787 (= lt!64848 (addApplyDifferent!86 lt!64839 lt!64846 (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) lt!64857))))

(assert (=> b!125787 (= (apply!110 (+!163 lt!64839 (tuple2!2521 lt!64846 (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!64857) (apply!110 lt!64839 lt!64857))))

(declare-fun b!125788 () Bool)

(declare-fun e!82156 () ListLongMap!1631)

(assert (=> b!125788 (= e!82156 call!13445)))

(declare-fun b!125789 () Bool)

(declare-fun e!82163 () Bool)

(assert (=> b!125789 (= e!82163 e!82155)))

(declare-fun c!22978 () Bool)

(assert (=> b!125789 (= c!22978 (not (= (bvand lt!64205 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!125790 () Bool)

(assert (=> b!125790 (= e!82161 (not call!13444))))

(declare-fun bm!13443 () Bool)

(assert (=> bm!13443 (= call!13447 (contains!861 lt!64837 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!125791 () Bool)

(declare-fun e!82159 () Bool)

(assert (=> b!125791 (= e!82159 (validKeyInArray!0 (select (arr!2210 (_keys!4492 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun d!38033 () Bool)

(assert (=> d!38033 e!82163))

(declare-fun res!60867 () Bool)

(assert (=> d!38033 (=> (not res!60867) (not e!82163))))

(assert (=> d!38033 (= res!60867 (or (bvsge #b00000000000000000000000000000000 (size!2473 (_keys!4492 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2473 (_keys!4492 newMap!16))))))))

(declare-fun lt!64852 () ListLongMap!1631)

(assert (=> d!38033 (= lt!64837 lt!64852)))

(declare-fun lt!64856 () Unit!3871)

(assert (=> d!38033 (= lt!64856 e!82158)))

(declare-fun c!22977 () Bool)

(declare-fun e!82165 () Bool)

(assert (=> d!38033 (= c!22977 e!82165)))

(declare-fun res!60869 () Bool)

(assert (=> d!38033 (=> (not res!60869) (not e!82165))))

(assert (=> d!38033 (= res!60869 (bvslt #b00000000000000000000000000000000 (size!2473 (_keys!4492 newMap!16))))))

(declare-fun e!82153 () ListLongMap!1631)

(assert (=> d!38033 (= lt!64852 e!82153)))

(assert (=> d!38033 (= c!22980 (and (not (= (bvand lt!64205 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand lt!64205 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!38033 (validMask!0 (mask!7009 newMap!16))))

(assert (=> d!38033 (= (getCurrentListMap!511 (_keys!4492 newMap!16) (_values!2746 newMap!16) (mask!7009 newMap!16) lt!64205 (zeroValue!2628 newMap!16) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16)) lt!64837)))

(declare-fun b!125784 () Bool)

(assert (=> b!125784 (= e!82155 (not call!13447))))

(declare-fun bm!13444 () Bool)

(assert (=> bm!13444 (= call!13444 (contains!861 lt!64837 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!125792 () Bool)

(assert (=> b!125792 (= e!82165 (validKeyInArray!0 (select (arr!2210 (_keys!4492 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!125793 () Bool)

(assert (=> b!125793 (= e!82160 (= (apply!110 lt!64837 #b1000000000000000000000000000000000000000000000000000000000000000) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!125794 () Bool)

(assert (=> b!125794 (= e!82154 (= (apply!110 lt!64837 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2628 newMap!16)))))

(declare-fun b!125795 () Bool)

(declare-fun e!82157 () Bool)

(assert (=> b!125795 (= e!82157 e!82164)))

(declare-fun res!60865 () Bool)

(assert (=> b!125795 (=> (not res!60865) (not e!82164))))

(assert (=> b!125795 (= res!60865 (contains!861 lt!64837 (select (arr!2210 (_keys!4492 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!125795 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2473 (_keys!4492 newMap!16))))))

(declare-fun b!125796 () Bool)

(declare-fun e!82162 () ListLongMap!1631)

(assert (=> b!125796 (= e!82153 e!82162)))

(assert (=> b!125796 (= c!22982 (and (not (= (bvand lt!64205 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand lt!64205 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!125797 () Bool)

(declare-fun call!13446 () ListLongMap!1631)

(assert (=> b!125797 (= e!82156 call!13446)))

(declare-fun bm!13445 () Bool)

(assert (=> bm!13445 (= call!13448 (getCurrentListMapNoExtraKeys!130 (_keys!4492 newMap!16) (_values!2746 newMap!16) (mask!7009 newMap!16) lt!64205 (zeroValue!2628 newMap!16) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16)))))

(declare-fun b!125798 () Bool)

(declare-fun res!60866 () Bool)

(assert (=> b!125798 (=> (not res!60866) (not e!82163))))

(assert (=> b!125798 (= res!60866 e!82157)))

(declare-fun res!60870 () Bool)

(assert (=> b!125798 (=> res!60870 e!82157)))

(assert (=> b!125798 (= res!60870 (not e!82159))))

(declare-fun res!60868 () Bool)

(assert (=> b!125798 (=> (not res!60868) (not e!82159))))

(assert (=> b!125798 (= res!60868 (bvslt #b00000000000000000000000000000000 (size!2473 (_keys!4492 newMap!16))))))

(declare-fun b!125799 () Bool)

(assert (=> b!125799 (= e!82162 call!13446)))

(declare-fun b!125800 () Bool)

(declare-fun Unit!3916 () Unit!3871)

(assert (=> b!125800 (= e!82158 Unit!3916)))

(declare-fun b!125801 () Bool)

(assert (=> b!125801 (= e!82153 (+!163 call!13443 (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!125802 () Bool)

(declare-fun res!60872 () Bool)

(assert (=> b!125802 (=> (not res!60872) (not e!82163))))

(assert (=> b!125802 (= res!60872 e!82161)))

(declare-fun c!22979 () Bool)

(assert (=> b!125802 (= c!22979 (not (= (bvand lt!64205 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!13446 () Bool)

(assert (=> bm!13446 (= call!13446 call!13443)))

(declare-fun b!125803 () Bool)

(declare-fun c!22981 () Bool)

(assert (=> b!125803 (= c!22981 (and (not (= (bvand lt!64205 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand lt!64205 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!125803 (= e!82162 e!82156)))

(assert (= (and d!38033 c!22980) b!125801))

(assert (= (and d!38033 (not c!22980)) b!125796))

(assert (= (and b!125796 c!22982) b!125799))

(assert (= (and b!125796 (not c!22982)) b!125803))

(assert (= (and b!125803 c!22981) b!125797))

(assert (= (and b!125803 (not c!22981)) b!125788))

(assert (= (or b!125797 b!125788) bm!13442))

(assert (= (or b!125799 bm!13442) bm!13441))

(assert (= (or b!125799 b!125797) bm!13446))

(assert (= (or b!125801 bm!13441) bm!13445))

(assert (= (or b!125801 bm!13446) bm!13440))

(assert (= (and d!38033 res!60869) b!125792))

(assert (= (and d!38033 c!22977) b!125787))

(assert (= (and d!38033 (not c!22977)) b!125800))

(assert (= (and d!38033 res!60867) b!125798))

(assert (= (and b!125798 res!60868) b!125791))

(assert (= (and b!125798 (not res!60870)) b!125795))

(assert (= (and b!125795 res!60865) b!125785))

(assert (= (and b!125798 res!60866) b!125802))

(assert (= (and b!125802 c!22979) b!125783))

(assert (= (and b!125802 (not c!22979)) b!125790))

(assert (= (and b!125783 res!60864) b!125794))

(assert (= (or b!125783 b!125790) bm!13444))

(assert (= (and b!125802 res!60872) b!125789))

(assert (= (and b!125789 c!22978) b!125786))

(assert (= (and b!125789 (not c!22978)) b!125784))

(assert (= (and b!125786 res!60871) b!125793))

(assert (= (or b!125786 b!125784) bm!13443))

(declare-fun b_lambda!5525 () Bool)

(assert (=> (not b_lambda!5525) (not b!125785)))

(assert (=> b!125785 t!6006))

(declare-fun b_and!7733 () Bool)

(assert (= b_and!7729 (and (=> t!6006 result!3815) b_and!7733)))

(assert (=> b!125785 t!6008))

(declare-fun b_and!7735 () Bool)

(assert (= b_and!7731 (and (=> t!6008 result!3817) b_and!7735)))

(declare-fun m!146667 () Bool)

(assert (=> b!125793 m!146667))

(assert (=> bm!13445 m!144795))

(declare-fun m!146669 () Bool)

(assert (=> bm!13445 m!146669))

(declare-fun m!146671 () Bool)

(assert (=> b!125794 m!146671))

(declare-fun m!146673 () Bool)

(assert (=> b!125801 m!146673))

(declare-fun m!146675 () Bool)

(assert (=> bm!13444 m!146675))

(assert (=> b!125785 m!145113))

(declare-fun m!146677 () Bool)

(assert (=> b!125785 m!146677))

(assert (=> b!125785 m!145113))

(assert (=> b!125785 m!145277))

(assert (=> b!125785 m!145331))

(assert (=> b!125785 m!145331))

(assert (=> b!125785 m!145277))

(assert (=> b!125785 m!145333))

(assert (=> b!125795 m!145113))

(assert (=> b!125795 m!145113))

(declare-fun m!146679 () Bool)

(assert (=> b!125795 m!146679))

(declare-fun m!146681 () Bool)

(assert (=> b!125787 m!146681))

(declare-fun m!146683 () Bool)

(assert (=> b!125787 m!146683))

(assert (=> b!125787 m!144795))

(assert (=> b!125787 m!146669))

(declare-fun m!146685 () Bool)

(assert (=> b!125787 m!146685))

(declare-fun m!146687 () Bool)

(assert (=> b!125787 m!146687))

(declare-fun m!146689 () Bool)

(assert (=> b!125787 m!146689))

(assert (=> b!125787 m!146681))

(declare-fun m!146691 () Bool)

(assert (=> b!125787 m!146691))

(assert (=> b!125787 m!146685))

(assert (=> b!125787 m!144795))

(declare-fun m!146693 () Bool)

(assert (=> b!125787 m!146693))

(declare-fun m!146695 () Bool)

(assert (=> b!125787 m!146695))

(declare-fun m!146697 () Bool)

(assert (=> b!125787 m!146697))

(declare-fun m!146699 () Bool)

(assert (=> b!125787 m!146699))

(assert (=> b!125787 m!144795))

(declare-fun m!146701 () Bool)

(assert (=> b!125787 m!146701))

(declare-fun m!146703 () Bool)

(assert (=> b!125787 m!146703))

(declare-fun m!146705 () Bool)

(assert (=> b!125787 m!146705))

(declare-fun m!146707 () Bool)

(assert (=> b!125787 m!146707))

(assert (=> b!125787 m!146703))

(assert (=> b!125787 m!146697))

(declare-fun m!146709 () Bool)

(assert (=> b!125787 m!146709))

(assert (=> b!125787 m!145113))

(assert (=> b!125791 m!145113))

(assert (=> b!125791 m!145113))

(assert (=> b!125791 m!145115))

(declare-fun m!146711 () Bool)

(assert (=> bm!13443 m!146711))

(declare-fun m!146713 () Bool)

(assert (=> bm!13440 m!146713))

(assert (=> d!38033 m!145065))

(assert (=> b!125792 m!145113))

(assert (=> b!125792 m!145113))

(assert (=> b!125792 m!145115))

(assert (=> d!37621 d!38033))

(declare-fun lt!64858 () Bool)

(declare-fun d!38035 () Bool)

(assert (=> d!38035 (= lt!64858 (select (content!124 (toList!831 lt!64254)) (tuple2!2521 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!82166 () Bool)

(assert (=> d!38035 (= lt!64858 e!82166)))

(declare-fun res!60873 () Bool)

(assert (=> d!38035 (=> (not res!60873) (not e!82166))))

(assert (=> d!38035 (= res!60873 ((_ is Cons!1672) (toList!831 lt!64254)))))

(assert (=> d!38035 (= (contains!862 (toList!831 lt!64254) (tuple2!2521 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!64858)))

(declare-fun b!125804 () Bool)

(declare-fun e!82167 () Bool)

(assert (=> b!125804 (= e!82166 e!82167)))

(declare-fun res!60874 () Bool)

(assert (=> b!125804 (=> res!60874 e!82167)))

(assert (=> b!125804 (= res!60874 (= (h!2273 (toList!831 lt!64254)) (tuple2!2521 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!125805 () Bool)

(assert (=> b!125805 (= e!82167 (contains!862 (t!5995 (toList!831 lt!64254)) (tuple2!2521 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!38035 res!60873) b!125804))

(assert (= (and b!125804 (not res!60874)) b!125805))

(declare-fun m!146715 () Bool)

(assert (=> d!38035 m!146715))

(declare-fun m!146717 () Bool)

(assert (=> d!38035 m!146717))

(declare-fun m!146719 () Bool)

(assert (=> b!125805 m!146719))

(assert (=> b!124941 d!38035))

(declare-fun b!125806 () Bool)

(declare-fun e!82170 () Bool)

(declare-fun e!82168 () Bool)

(assert (=> b!125806 (= e!82170 e!82168)))

(declare-fun c!22983 () Bool)

(assert (=> b!125806 (= c!22983 (validKeyInArray!0 (select (arr!2210 (_keys!4492 (_2!1272 lt!64219))) #b00000000000000000000000000000000)))))

(declare-fun b!125807 () Bool)

(declare-fun call!13450 () Bool)

(assert (=> b!125807 (= e!82168 call!13450)))

(declare-fun b!125808 () Bool)

(declare-fun e!82169 () Bool)

(assert (=> b!125808 (= e!82168 e!82169)))

(declare-fun lt!64861 () (_ BitVec 64))

(assert (=> b!125808 (= lt!64861 (select (arr!2210 (_keys!4492 (_2!1272 lt!64219))) #b00000000000000000000000000000000))))

(declare-fun lt!64860 () Unit!3871)

(assert (=> b!125808 (= lt!64860 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!4492 (_2!1272 lt!64219)) lt!64861 #b00000000000000000000000000000000))))

(assert (=> b!125808 (arrayContainsKey!0 (_keys!4492 (_2!1272 lt!64219)) lt!64861 #b00000000000000000000000000000000)))

(declare-fun lt!64859 () Unit!3871)

(assert (=> b!125808 (= lt!64859 lt!64860)))

(declare-fun res!60876 () Bool)

(assert (=> b!125808 (= res!60876 (= (seekEntryOrOpen!0 (select (arr!2210 (_keys!4492 (_2!1272 lt!64219))) #b00000000000000000000000000000000) (_keys!4492 (_2!1272 lt!64219)) (mask!7009 (_2!1272 lt!64219))) (Found!263 #b00000000000000000000000000000000)))))

(assert (=> b!125808 (=> (not res!60876) (not e!82169))))

(declare-fun bm!13447 () Bool)

(assert (=> bm!13447 (= call!13450 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!4492 (_2!1272 lt!64219)) (mask!7009 (_2!1272 lt!64219))))))

(declare-fun b!125809 () Bool)

(assert (=> b!125809 (= e!82169 call!13450)))

(declare-fun d!38037 () Bool)

(declare-fun res!60875 () Bool)

(assert (=> d!38037 (=> res!60875 e!82170)))

(assert (=> d!38037 (= res!60875 (bvsge #b00000000000000000000000000000000 (size!2473 (_keys!4492 (_2!1272 lt!64219)))))))

(assert (=> d!38037 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4492 (_2!1272 lt!64219)) (mask!7009 (_2!1272 lt!64219))) e!82170)))

(assert (= (and d!38037 (not res!60875)) b!125806))

(assert (= (and b!125806 c!22983) b!125808))

(assert (= (and b!125806 (not c!22983)) b!125807))

(assert (= (and b!125808 res!60876) b!125809))

(assert (= (or b!125809 b!125807) bm!13447))

(assert (=> b!125806 m!145595))

(assert (=> b!125806 m!145595))

(assert (=> b!125806 m!145601))

(assert (=> b!125808 m!145595))

(declare-fun m!146721 () Bool)

(assert (=> b!125808 m!146721))

(declare-fun m!146723 () Bool)

(assert (=> b!125808 m!146723))

(assert (=> b!125808 m!145595))

(declare-fun m!146725 () Bool)

(assert (=> b!125808 m!146725))

(declare-fun m!146727 () Bool)

(assert (=> bm!13447 m!146727))

(assert (=> b!125115 d!38037))

(declare-fun d!38039 () Bool)

(declare-fun e!82171 () Bool)

(assert (=> d!38039 e!82171))

(declare-fun res!60877 () Bool)

(assert (=> d!38039 (=> res!60877 e!82171)))

(declare-fun lt!64862 () Bool)

(assert (=> d!38039 (= res!60877 (not lt!64862))))

(declare-fun lt!64865 () Bool)

(assert (=> d!38039 (= lt!64862 lt!64865)))

(declare-fun lt!64864 () Unit!3871)

(declare-fun e!82172 () Unit!3871)

(assert (=> d!38039 (= lt!64864 e!82172)))

(declare-fun c!22984 () Bool)

(assert (=> d!38039 (= c!22984 lt!64865)))

(assert (=> d!38039 (= lt!64865 (containsKey!170 (toList!831 (getCurrentListMap!511 (_keys!4492 newMap!16) lt!64198 (mask!7009 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16))) (select (arr!2210 (_keys!4492 newMap!16)) (index!3207 lt!64214))))))

(assert (=> d!38039 (= (contains!861 (getCurrentListMap!511 (_keys!4492 newMap!16) lt!64198 (mask!7009 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16)) (select (arr!2210 (_keys!4492 newMap!16)) (index!3207 lt!64214))) lt!64862)))

(declare-fun b!125810 () Bool)

(declare-fun lt!64863 () Unit!3871)

(assert (=> b!125810 (= e!82172 lt!64863)))

(assert (=> b!125810 (= lt!64863 (lemmaContainsKeyImpliesGetValueByKeyDefined!118 (toList!831 (getCurrentListMap!511 (_keys!4492 newMap!16) lt!64198 (mask!7009 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16))) (select (arr!2210 (_keys!4492 newMap!16)) (index!3207 lt!64214))))))

(assert (=> b!125810 (isDefined!119 (getValueByKey!167 (toList!831 (getCurrentListMap!511 (_keys!4492 newMap!16) lt!64198 (mask!7009 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16))) (select (arr!2210 (_keys!4492 newMap!16)) (index!3207 lt!64214))))))

(declare-fun b!125811 () Bool)

(declare-fun Unit!3917 () Unit!3871)

(assert (=> b!125811 (= e!82172 Unit!3917)))

(declare-fun b!125812 () Bool)

(assert (=> b!125812 (= e!82171 (isDefined!119 (getValueByKey!167 (toList!831 (getCurrentListMap!511 (_keys!4492 newMap!16) lt!64198 (mask!7009 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16))) (select (arr!2210 (_keys!4492 newMap!16)) (index!3207 lt!64214)))))))

(assert (= (and d!38039 c!22984) b!125810))

(assert (= (and d!38039 (not c!22984)) b!125811))

(assert (= (and d!38039 (not res!60877)) b!125812))

(assert (=> d!38039 m!144993))

(declare-fun m!146729 () Bool)

(assert (=> d!38039 m!146729))

(assert (=> b!125810 m!144993))

(declare-fun m!146731 () Bool)

(assert (=> b!125810 m!146731))

(assert (=> b!125810 m!144993))

(declare-fun m!146733 () Bool)

(assert (=> b!125810 m!146733))

(assert (=> b!125810 m!146733))

(declare-fun m!146735 () Bool)

(assert (=> b!125810 m!146735))

(assert (=> b!125812 m!144993))

(assert (=> b!125812 m!146733))

(assert (=> b!125812 m!146733))

(assert (=> b!125812 m!146735))

(assert (=> b!125197 d!38039))

(declare-fun call!13453 () ListLongMap!1631)

(declare-fun c!22990 () Bool)

(declare-fun c!22988 () Bool)

(declare-fun call!13457 () ListLongMap!1631)

(declare-fun bm!13448 () Bool)

(declare-fun call!13456 () ListLongMap!1631)

(declare-fun call!13451 () ListLongMap!1631)

(assert (=> bm!13448 (= call!13451 (+!163 (ite c!22988 call!13456 (ite c!22990 call!13457 call!13453)) (ite (or c!22988 c!22990) (tuple2!2521 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2628 newMap!16)) (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 newMap!16)))))))

(declare-fun b!125813 () Bool)

(declare-fun e!82181 () Bool)

(declare-fun e!82174 () Bool)

(assert (=> b!125813 (= e!82181 e!82174)))

(declare-fun res!60878 () Bool)

(declare-fun call!13452 () Bool)

(assert (=> b!125813 (= res!60878 call!13452)))

(assert (=> b!125813 (=> (not res!60878) (not e!82174))))

(declare-fun bm!13449 () Bool)

(assert (=> bm!13449 (= call!13457 call!13456)))

(declare-fun e!82184 () Bool)

(declare-fun b!125815 () Bool)

(declare-fun lt!64867 () ListLongMap!1631)

(assert (=> b!125815 (= e!82184 (= (apply!110 lt!64867 (select (arr!2210 (_keys!4492 newMap!16)) #b00000000000000000000000000000000)) (get!1446 (select (arr!2211 lt!64198) #b00000000000000000000000000000000) (dynLambda!415 (defaultEntry!2763 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!125815 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2474 lt!64198)))))

(assert (=> b!125815 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2473 (_keys!4492 newMap!16))))))

(declare-fun bm!13450 () Bool)

(assert (=> bm!13450 (= call!13453 call!13457)))

(declare-fun b!125816 () Bool)

(declare-fun e!82175 () Bool)

(declare-fun e!82180 () Bool)

(assert (=> b!125816 (= e!82175 e!82180)))

(declare-fun res!60885 () Bool)

(declare-fun call!13455 () Bool)

(assert (=> b!125816 (= res!60885 call!13455)))

(assert (=> b!125816 (=> (not res!60885) (not e!82180))))

(declare-fun b!125817 () Bool)

(declare-fun e!82178 () Unit!3871)

(declare-fun lt!64878 () Unit!3871)

(assert (=> b!125817 (= e!82178 lt!64878)))

(declare-fun lt!64881 () ListLongMap!1631)

(assert (=> b!125817 (= lt!64881 (getCurrentListMapNoExtraKeys!130 (_keys!4492 newMap!16) lt!64198 (mask!7009 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16)))))

(declare-fun lt!64873 () (_ BitVec 64))

(assert (=> b!125817 (= lt!64873 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!64868 () (_ BitVec 64))

(assert (=> b!125817 (= lt!64868 (select (arr!2210 (_keys!4492 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!64871 () Unit!3871)

(assert (=> b!125817 (= lt!64871 (addStillContains!86 lt!64881 lt!64873 (zeroValue!2628 newMap!16) lt!64868))))

(assert (=> b!125817 (contains!861 (+!163 lt!64881 (tuple2!2521 lt!64873 (zeroValue!2628 newMap!16))) lt!64868)))

(declare-fun lt!64866 () Unit!3871)

(assert (=> b!125817 (= lt!64866 lt!64871)))

(declare-fun lt!64875 () ListLongMap!1631)

(assert (=> b!125817 (= lt!64875 (getCurrentListMapNoExtraKeys!130 (_keys!4492 newMap!16) lt!64198 (mask!7009 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16)))))

(declare-fun lt!64884 () (_ BitVec 64))

(assert (=> b!125817 (= lt!64884 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!64870 () (_ BitVec 64))

(assert (=> b!125817 (= lt!64870 (select (arr!2210 (_keys!4492 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!64872 () Unit!3871)

(assert (=> b!125817 (= lt!64872 (addApplyDifferent!86 lt!64875 lt!64884 (minValue!2628 newMap!16) lt!64870))))

(assert (=> b!125817 (= (apply!110 (+!163 lt!64875 (tuple2!2521 lt!64884 (minValue!2628 newMap!16))) lt!64870) (apply!110 lt!64875 lt!64870))))

(declare-fun lt!64885 () Unit!3871)

(assert (=> b!125817 (= lt!64885 lt!64872)))

(declare-fun lt!64877 () ListLongMap!1631)

(assert (=> b!125817 (= lt!64877 (getCurrentListMapNoExtraKeys!130 (_keys!4492 newMap!16) lt!64198 (mask!7009 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16)))))

(declare-fun lt!64883 () (_ BitVec 64))

(assert (=> b!125817 (= lt!64883 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!64880 () (_ BitVec 64))

(assert (=> b!125817 (= lt!64880 (select (arr!2210 (_keys!4492 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!64879 () Unit!3871)

(assert (=> b!125817 (= lt!64879 (addApplyDifferent!86 lt!64877 lt!64883 (zeroValue!2628 newMap!16) lt!64880))))

(assert (=> b!125817 (= (apply!110 (+!163 lt!64877 (tuple2!2521 lt!64883 (zeroValue!2628 newMap!16))) lt!64880) (apply!110 lt!64877 lt!64880))))

(declare-fun lt!64874 () Unit!3871)

(assert (=> b!125817 (= lt!64874 lt!64879)))

(declare-fun lt!64869 () ListLongMap!1631)

(assert (=> b!125817 (= lt!64869 (getCurrentListMapNoExtraKeys!130 (_keys!4492 newMap!16) lt!64198 (mask!7009 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16)))))

(declare-fun lt!64876 () (_ BitVec 64))

(assert (=> b!125817 (= lt!64876 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!64887 () (_ BitVec 64))

(assert (=> b!125817 (= lt!64887 (select (arr!2210 (_keys!4492 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!125817 (= lt!64878 (addApplyDifferent!86 lt!64869 lt!64876 (minValue!2628 newMap!16) lt!64887))))

(assert (=> b!125817 (= (apply!110 (+!163 lt!64869 (tuple2!2521 lt!64876 (minValue!2628 newMap!16))) lt!64887) (apply!110 lt!64869 lt!64887))))

(declare-fun b!125818 () Bool)

(declare-fun e!82176 () ListLongMap!1631)

(assert (=> b!125818 (= e!82176 call!13453)))

(declare-fun b!125819 () Bool)

(declare-fun e!82183 () Bool)

(assert (=> b!125819 (= e!82183 e!82175)))

(declare-fun c!22986 () Bool)

(assert (=> b!125819 (= c!22986 (not (= (bvand (extraKeys!2548 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!125820 () Bool)

(assert (=> b!125820 (= e!82181 (not call!13452))))

(declare-fun bm!13451 () Bool)

(assert (=> bm!13451 (= call!13455 (contains!861 lt!64867 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!125821 () Bool)

(declare-fun e!82179 () Bool)

(assert (=> b!125821 (= e!82179 (validKeyInArray!0 (select (arr!2210 (_keys!4492 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun d!38041 () Bool)

(assert (=> d!38041 e!82183))

(declare-fun res!60881 () Bool)

(assert (=> d!38041 (=> (not res!60881) (not e!82183))))

(assert (=> d!38041 (= res!60881 (or (bvsge #b00000000000000000000000000000000 (size!2473 (_keys!4492 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2473 (_keys!4492 newMap!16))))))))

(declare-fun lt!64882 () ListLongMap!1631)

(assert (=> d!38041 (= lt!64867 lt!64882)))

(declare-fun lt!64886 () Unit!3871)

(assert (=> d!38041 (= lt!64886 e!82178)))

(declare-fun c!22985 () Bool)

(declare-fun e!82185 () Bool)

(assert (=> d!38041 (= c!22985 e!82185)))

(declare-fun res!60883 () Bool)

(assert (=> d!38041 (=> (not res!60883) (not e!82185))))

(assert (=> d!38041 (= res!60883 (bvslt #b00000000000000000000000000000000 (size!2473 (_keys!4492 newMap!16))))))

(declare-fun e!82173 () ListLongMap!1631)

(assert (=> d!38041 (= lt!64882 e!82173)))

(assert (=> d!38041 (= c!22988 (and (not (= (bvand (extraKeys!2548 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2548 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!38041 (validMask!0 (mask!7009 newMap!16))))

(assert (=> d!38041 (= (getCurrentListMap!511 (_keys!4492 newMap!16) lt!64198 (mask!7009 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16)) lt!64867)))

(declare-fun b!125814 () Bool)

(assert (=> b!125814 (= e!82175 (not call!13455))))

(declare-fun bm!13452 () Bool)

(assert (=> bm!13452 (= call!13452 (contains!861 lt!64867 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!125822 () Bool)

(assert (=> b!125822 (= e!82185 (validKeyInArray!0 (select (arr!2210 (_keys!4492 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!125823 () Bool)

(assert (=> b!125823 (= e!82180 (= (apply!110 lt!64867 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2628 newMap!16)))))

(declare-fun b!125824 () Bool)

(assert (=> b!125824 (= e!82174 (= (apply!110 lt!64867 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2628 newMap!16)))))

(declare-fun b!125825 () Bool)

(declare-fun e!82177 () Bool)

(assert (=> b!125825 (= e!82177 e!82184)))

(declare-fun res!60879 () Bool)

(assert (=> b!125825 (=> (not res!60879) (not e!82184))))

(assert (=> b!125825 (= res!60879 (contains!861 lt!64867 (select (arr!2210 (_keys!4492 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!125825 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2473 (_keys!4492 newMap!16))))))

(declare-fun b!125826 () Bool)

(declare-fun e!82182 () ListLongMap!1631)

(assert (=> b!125826 (= e!82173 e!82182)))

(assert (=> b!125826 (= c!22990 (and (not (= (bvand (extraKeys!2548 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2548 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!125827 () Bool)

(declare-fun call!13454 () ListLongMap!1631)

(assert (=> b!125827 (= e!82176 call!13454)))

(declare-fun bm!13453 () Bool)

(assert (=> bm!13453 (= call!13456 (getCurrentListMapNoExtraKeys!130 (_keys!4492 newMap!16) lt!64198 (mask!7009 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16)))))

(declare-fun b!125828 () Bool)

(declare-fun res!60880 () Bool)

(assert (=> b!125828 (=> (not res!60880) (not e!82183))))

(assert (=> b!125828 (= res!60880 e!82177)))

(declare-fun res!60884 () Bool)

(assert (=> b!125828 (=> res!60884 e!82177)))

(assert (=> b!125828 (= res!60884 (not e!82179))))

(declare-fun res!60882 () Bool)

(assert (=> b!125828 (=> (not res!60882) (not e!82179))))

(assert (=> b!125828 (= res!60882 (bvslt #b00000000000000000000000000000000 (size!2473 (_keys!4492 newMap!16))))))

(declare-fun b!125829 () Bool)

(assert (=> b!125829 (= e!82182 call!13454)))

(declare-fun b!125830 () Bool)

(declare-fun Unit!3918 () Unit!3871)

(assert (=> b!125830 (= e!82178 Unit!3918)))

(declare-fun b!125831 () Bool)

(assert (=> b!125831 (= e!82173 (+!163 call!13451 (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 newMap!16))))))

(declare-fun b!125832 () Bool)

(declare-fun res!60886 () Bool)

(assert (=> b!125832 (=> (not res!60886) (not e!82183))))

(assert (=> b!125832 (= res!60886 e!82181)))

(declare-fun c!22987 () Bool)

(assert (=> b!125832 (= c!22987 (not (= (bvand (extraKeys!2548 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!13454 () Bool)

(assert (=> bm!13454 (= call!13454 call!13451)))

(declare-fun b!125833 () Bool)

(declare-fun c!22989 () Bool)

(assert (=> b!125833 (= c!22989 (and (not (= (bvand (extraKeys!2548 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2548 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!125833 (= e!82182 e!82176)))

(assert (= (and d!38041 c!22988) b!125831))

(assert (= (and d!38041 (not c!22988)) b!125826))

(assert (= (and b!125826 c!22990) b!125829))

(assert (= (and b!125826 (not c!22990)) b!125833))

(assert (= (and b!125833 c!22989) b!125827))

(assert (= (and b!125833 (not c!22989)) b!125818))

(assert (= (or b!125827 b!125818) bm!13450))

(assert (= (or b!125829 bm!13450) bm!13449))

(assert (= (or b!125829 b!125827) bm!13454))

(assert (= (or b!125831 bm!13449) bm!13453))

(assert (= (or b!125831 bm!13454) bm!13448))

(assert (= (and d!38041 res!60883) b!125822))

(assert (= (and d!38041 c!22985) b!125817))

(assert (= (and d!38041 (not c!22985)) b!125830))

(assert (= (and d!38041 res!60881) b!125828))

(assert (= (and b!125828 res!60882) b!125821))

(assert (= (and b!125828 (not res!60884)) b!125825))

(assert (= (and b!125825 res!60879) b!125815))

(assert (= (and b!125828 res!60880) b!125832))

(assert (= (and b!125832 c!22987) b!125813))

(assert (= (and b!125832 (not c!22987)) b!125820))

(assert (= (and b!125813 res!60878) b!125824))

(assert (= (or b!125813 b!125820) bm!13452))

(assert (= (and b!125832 res!60886) b!125819))

(assert (= (and b!125819 c!22986) b!125816))

(assert (= (and b!125819 (not c!22986)) b!125814))

(assert (= (and b!125816 res!60885) b!125823))

(assert (= (or b!125816 b!125814) bm!13451))

(declare-fun b_lambda!5527 () Bool)

(assert (=> (not b_lambda!5527) (not b!125815)))

(assert (=> b!125815 t!6006))

(declare-fun b_and!7737 () Bool)

(assert (= b_and!7733 (and (=> t!6006 result!3815) b_and!7737)))

(assert (=> b!125815 t!6008))

(declare-fun b_and!7739 () Bool)

(assert (= b_and!7735 (and (=> t!6008 result!3817) b_and!7739)))

(declare-fun m!146737 () Bool)

(assert (=> b!125823 m!146737))

(declare-fun m!146739 () Bool)

(assert (=> bm!13453 m!146739))

(declare-fun m!146741 () Bool)

(assert (=> b!125824 m!146741))

(declare-fun m!146743 () Bool)

(assert (=> b!125831 m!146743))

(declare-fun m!146745 () Bool)

(assert (=> bm!13452 m!146745))

(assert (=> b!125815 m!145113))

(declare-fun m!146747 () Bool)

(assert (=> b!125815 m!146747))

(assert (=> b!125815 m!145113))

(assert (=> b!125815 m!145277))

(declare-fun m!146749 () Bool)

(assert (=> b!125815 m!146749))

(assert (=> b!125815 m!146749))

(assert (=> b!125815 m!145277))

(declare-fun m!146751 () Bool)

(assert (=> b!125815 m!146751))

(assert (=> b!125825 m!145113))

(assert (=> b!125825 m!145113))

(declare-fun m!146753 () Bool)

(assert (=> b!125825 m!146753))

(declare-fun m!146755 () Bool)

(assert (=> b!125817 m!146755))

(declare-fun m!146757 () Bool)

(assert (=> b!125817 m!146757))

(assert (=> b!125817 m!146739))

(declare-fun m!146759 () Bool)

(assert (=> b!125817 m!146759))

(declare-fun m!146761 () Bool)

(assert (=> b!125817 m!146761))

(declare-fun m!146763 () Bool)

(assert (=> b!125817 m!146763))

(assert (=> b!125817 m!146755))

(declare-fun m!146765 () Bool)

(assert (=> b!125817 m!146765))

(assert (=> b!125817 m!146759))

(declare-fun m!146767 () Bool)

(assert (=> b!125817 m!146767))

(declare-fun m!146769 () Bool)

(assert (=> b!125817 m!146769))

(declare-fun m!146771 () Bool)

(assert (=> b!125817 m!146771))

(declare-fun m!146773 () Bool)

(assert (=> b!125817 m!146773))

(declare-fun m!146775 () Bool)

(assert (=> b!125817 m!146775))

(declare-fun m!146777 () Bool)

(assert (=> b!125817 m!146777))

(declare-fun m!146779 () Bool)

(assert (=> b!125817 m!146779))

(declare-fun m!146781 () Bool)

(assert (=> b!125817 m!146781))

(assert (=> b!125817 m!146777))

(assert (=> b!125817 m!146771))

(declare-fun m!146783 () Bool)

(assert (=> b!125817 m!146783))

(assert (=> b!125817 m!145113))

(assert (=> b!125821 m!145113))

(assert (=> b!125821 m!145113))

(assert (=> b!125821 m!145115))

(declare-fun m!146785 () Bool)

(assert (=> bm!13451 m!146785))

(declare-fun m!146787 () Bool)

(assert (=> bm!13448 m!146787))

(assert (=> d!38041 m!145065))

(assert (=> b!125822 m!145113))

(assert (=> b!125822 m!145113))

(assert (=> b!125822 m!145115))

(assert (=> b!125197 d!38041))

(declare-fun d!38043 () Bool)

(declare-fun e!82186 () Bool)

(assert (=> d!38043 e!82186))

(declare-fun res!60887 () Bool)

(assert (=> d!38043 (=> (not res!60887) (not e!82186))))

(declare-fun lt!64889 () ListLongMap!1631)

(assert (=> d!38043 (= res!60887 (contains!861 lt!64889 (_1!1271 (tuple2!2521 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!64890 () List!1676)

(assert (=> d!38043 (= lt!64889 (ListLongMap!1632 lt!64890))))

(declare-fun lt!64891 () Unit!3871)

(declare-fun lt!64888 () Unit!3871)

(assert (=> d!38043 (= lt!64891 lt!64888)))

(assert (=> d!38043 (= (getValueByKey!167 lt!64890 (_1!1271 (tuple2!2521 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!172 (_2!1271 (tuple2!2521 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!38043 (= lt!64888 (lemmaContainsTupThenGetReturnValue!82 lt!64890 (_1!1271 (tuple2!2521 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1271 (tuple2!2521 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!38043 (= lt!64890 (insertStrictlySorted!85 (toList!831 (getCurrentListMap!511 (_keys!4492 newMap!16) (_values!2746 newMap!16) (mask!7009 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16))) (_1!1271 (tuple2!2521 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1271 (tuple2!2521 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!38043 (= (+!163 (getCurrentListMap!511 (_keys!4492 newMap!16) (_values!2746 newMap!16) (mask!7009 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16)) (tuple2!2521 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!64889)))

(declare-fun b!125834 () Bool)

(declare-fun res!60888 () Bool)

(assert (=> b!125834 (=> (not res!60888) (not e!82186))))

(assert (=> b!125834 (= res!60888 (= (getValueByKey!167 (toList!831 lt!64889) (_1!1271 (tuple2!2521 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!172 (_2!1271 (tuple2!2521 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!125835 () Bool)

(assert (=> b!125835 (= e!82186 (contains!862 (toList!831 lt!64889) (tuple2!2521 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!38043 res!60887) b!125834))

(assert (= (and b!125834 res!60888) b!125835))

(declare-fun m!146789 () Bool)

(assert (=> d!38043 m!146789))

(declare-fun m!146791 () Bool)

(assert (=> d!38043 m!146791))

(declare-fun m!146793 () Bool)

(assert (=> d!38043 m!146793))

(declare-fun m!146795 () Bool)

(assert (=> d!38043 m!146795))

(declare-fun m!146797 () Bool)

(assert (=> b!125834 m!146797))

(declare-fun m!146799 () Bool)

(assert (=> b!125835 m!146799))

(assert (=> d!37607 d!38043))

(declare-fun d!38045 () Bool)

(assert (=> d!38045 (= (arrayCountValidKeys!0 lt!64479 (ite c!22713 (index!3209 lt!64214) (index!3206 lt!64214)) (bvadd (ite c!22713 (index!3209 lt!64214) (index!3206 lt!64214)) #b00000000000000000000000000000001)) #b00000000000000000000000000000001)))

(declare-fun lt!64894 () Unit!3871)

(declare-fun choose!2 (array!4667 (_ BitVec 32)) Unit!3871)

(assert (=> d!38045 (= lt!64894 (choose!2 lt!64479 (ite c!22713 (index!3209 lt!64214) (index!3206 lt!64214))))))

(declare-fun e!82189 () Bool)

(assert (=> d!38045 e!82189))

(declare-fun res!60893 () Bool)

(assert (=> d!38045 (=> (not res!60893) (not e!82189))))

(assert (=> d!38045 (= res!60893 (and (bvsge (ite c!22713 (index!3209 lt!64214) (index!3206 lt!64214)) #b00000000000000000000000000000000) (bvslt (ite c!22713 (index!3209 lt!64214) (index!3206 lt!64214)) (size!2473 lt!64479))))))

(assert (=> d!38045 (= (lemmaValidKeyAtIImpliesCountKeysIsOne!0 lt!64479 (ite c!22713 (index!3209 lt!64214) (index!3206 lt!64214))) lt!64894)))

(declare-fun b!125840 () Bool)

(declare-fun res!60894 () Bool)

(assert (=> b!125840 (=> (not res!60894) (not e!82189))))

(assert (=> b!125840 (= res!60894 (validKeyInArray!0 (select (arr!2210 lt!64479) (ite c!22713 (index!3209 lt!64214) (index!3206 lt!64214)))))))

(declare-fun b!125841 () Bool)

(assert (=> b!125841 (= e!82189 (bvslt (size!2473 lt!64479) #b01111111111111111111111111111111))))

(assert (= (and d!38045 res!60893) b!125840))

(assert (= (and b!125840 res!60894) b!125841))

(assert (=> d!38045 m!145489))

(declare-fun m!146801 () Bool)

(assert (=> d!38045 m!146801))

(declare-fun m!146803 () Bool)

(assert (=> b!125840 m!146803))

(assert (=> b!125840 m!146803))

(declare-fun m!146805 () Bool)

(assert (=> b!125840 m!146805))

(assert (=> d!37607 d!38045))

(declare-fun b!125842 () Bool)

(declare-fun e!82192 () Bool)

(declare-fun e!82190 () Bool)

(assert (=> b!125842 (= e!82192 e!82190)))

(declare-fun c!22991 () Bool)

(assert (=> b!125842 (= c!22991 (validKeyInArray!0 (select (arr!2210 (array!4668 (store (arr!2210 (_keys!4492 newMap!16)) (ite c!22713 (index!3209 lt!64214) (index!3206 lt!64214)) (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355)) (size!2473 (_keys!4492 newMap!16)))) #b00000000000000000000000000000000)))))

(declare-fun b!125843 () Bool)

(declare-fun call!13458 () Bool)

(assert (=> b!125843 (= e!82190 call!13458)))

(declare-fun b!125844 () Bool)

(declare-fun e!82191 () Bool)

(assert (=> b!125844 (= e!82190 e!82191)))

(declare-fun lt!64897 () (_ BitVec 64))

(assert (=> b!125844 (= lt!64897 (select (arr!2210 (array!4668 (store (arr!2210 (_keys!4492 newMap!16)) (ite c!22713 (index!3209 lt!64214) (index!3206 lt!64214)) (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355)) (size!2473 (_keys!4492 newMap!16)))) #b00000000000000000000000000000000))))

(declare-fun lt!64896 () Unit!3871)

(assert (=> b!125844 (= lt!64896 (lemmaArrayContainsFromImpliesContainsFromZero!0 (array!4668 (store (arr!2210 (_keys!4492 newMap!16)) (ite c!22713 (index!3209 lt!64214) (index!3206 lt!64214)) (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355)) (size!2473 (_keys!4492 newMap!16))) lt!64897 #b00000000000000000000000000000000))))

(assert (=> b!125844 (arrayContainsKey!0 (array!4668 (store (arr!2210 (_keys!4492 newMap!16)) (ite c!22713 (index!3209 lt!64214) (index!3206 lt!64214)) (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355)) (size!2473 (_keys!4492 newMap!16))) lt!64897 #b00000000000000000000000000000000)))

(declare-fun lt!64895 () Unit!3871)

(assert (=> b!125844 (= lt!64895 lt!64896)))

(declare-fun res!60896 () Bool)

(assert (=> b!125844 (= res!60896 (= (seekEntryOrOpen!0 (select (arr!2210 (array!4668 (store (arr!2210 (_keys!4492 newMap!16)) (ite c!22713 (index!3209 lt!64214) (index!3206 lt!64214)) (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355)) (size!2473 (_keys!4492 newMap!16)))) #b00000000000000000000000000000000) (array!4668 (store (arr!2210 (_keys!4492 newMap!16)) (ite c!22713 (index!3209 lt!64214) (index!3206 lt!64214)) (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355)) (size!2473 (_keys!4492 newMap!16))) (mask!7009 newMap!16)) (Found!263 #b00000000000000000000000000000000)))))

(assert (=> b!125844 (=> (not res!60896) (not e!82191))))

(declare-fun bm!13455 () Bool)

(assert (=> bm!13455 (= call!13458 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (array!4668 (store (arr!2210 (_keys!4492 newMap!16)) (ite c!22713 (index!3209 lt!64214) (index!3206 lt!64214)) (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355)) (size!2473 (_keys!4492 newMap!16))) (mask!7009 newMap!16)))))

(declare-fun b!125845 () Bool)

(assert (=> b!125845 (= e!82191 call!13458)))

(declare-fun d!38047 () Bool)

(declare-fun res!60895 () Bool)

(assert (=> d!38047 (=> res!60895 e!82192)))

(assert (=> d!38047 (= res!60895 (bvsge #b00000000000000000000000000000000 (size!2473 (array!4668 (store (arr!2210 (_keys!4492 newMap!16)) (ite c!22713 (index!3209 lt!64214) (index!3206 lt!64214)) (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355)) (size!2473 (_keys!4492 newMap!16))))))))

(assert (=> d!38047 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!4668 (store (arr!2210 (_keys!4492 newMap!16)) (ite c!22713 (index!3209 lt!64214) (index!3206 lt!64214)) (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355)) (size!2473 (_keys!4492 newMap!16))) (mask!7009 newMap!16)) e!82192)))

(assert (= (and d!38047 (not res!60895)) b!125842))

(assert (= (and b!125842 c!22991) b!125844))

(assert (= (and b!125842 (not c!22991)) b!125843))

(assert (= (and b!125844 res!60896) b!125845))

(assert (= (or b!125845 b!125843) bm!13455))

(declare-fun m!146807 () Bool)

(assert (=> b!125842 m!146807))

(assert (=> b!125842 m!146807))

(declare-fun m!146809 () Bool)

(assert (=> b!125842 m!146809))

(assert (=> b!125844 m!146807))

(declare-fun m!146811 () Bool)

(assert (=> b!125844 m!146811))

(declare-fun m!146813 () Bool)

(assert (=> b!125844 m!146813))

(assert (=> b!125844 m!146807))

(declare-fun m!146815 () Bool)

(assert (=> b!125844 m!146815))

(declare-fun m!146817 () Bool)

(assert (=> bm!13455 m!146817))

(assert (=> d!37607 d!38047))

(declare-fun d!38049 () Bool)

(declare-fun e!82195 () Bool)

(assert (=> d!38049 e!82195))

(declare-fun res!60899 () Bool)

(assert (=> d!38049 (=> (not res!60899) (not e!82195))))

(assert (=> d!38049 (= res!60899 (and (bvsge (ite c!22713 (index!3209 lt!64214) (index!3206 lt!64214)) #b00000000000000000000000000000000) (bvslt (ite c!22713 (index!3209 lt!64214) (index!3206 lt!64214)) (size!2473 (_keys!4492 newMap!16)))))))

(declare-fun lt!64900 () Unit!3871)

(declare-fun choose!102 ((_ BitVec 64) array!4667 (_ BitVec 32) (_ BitVec 32)) Unit!3871)

(assert (=> d!38049 (= lt!64900 (choose!102 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355) (_keys!4492 newMap!16) (ite c!22713 (index!3209 lt!64214) (index!3206 lt!64214)) (mask!7009 newMap!16)))))

(assert (=> d!38049 (validMask!0 (mask!7009 newMap!16))))

(assert (=> d!38049 (= (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355) (_keys!4492 newMap!16) (ite c!22713 (index!3209 lt!64214) (index!3206 lt!64214)) (mask!7009 newMap!16)) lt!64900)))

(declare-fun b!125848 () Bool)

(assert (=> b!125848 (= e!82195 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!4668 (store (arr!2210 (_keys!4492 newMap!16)) (ite c!22713 (index!3209 lt!64214) (index!3206 lt!64214)) (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355)) (size!2473 (_keys!4492 newMap!16))) (mask!7009 newMap!16)))))

(assert (= (and d!38049 res!60899) b!125848))

(assert (=> d!38049 m!144797))

(declare-fun m!146819 () Bool)

(assert (=> d!38049 m!146819))

(assert (=> d!38049 m!145065))

(assert (=> b!125848 m!145467))

(assert (=> b!125848 m!145475))

(assert (=> d!37607 d!38049))

(declare-fun b!125849 () Bool)

(declare-fun e!82196 () (_ BitVec 32))

(declare-fun e!82197 () (_ BitVec 32))

(assert (=> b!125849 (= e!82196 e!82197)))

(declare-fun c!22992 () Bool)

(assert (=> b!125849 (= c!22992 (validKeyInArray!0 (select (arr!2210 (array!4668 (store (arr!2210 (_keys!4492 newMap!16)) (ite c!22713 (index!3209 lt!64214) (index!3206 lt!64214)) (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355)) (size!2473 (_keys!4492 newMap!16)))) #b00000000000000000000000000000000)))))

(declare-fun b!125850 () Bool)

(declare-fun call!13459 () (_ BitVec 32))

(assert (=> b!125850 (= e!82197 (bvadd #b00000000000000000000000000000001 call!13459))))

(declare-fun b!125851 () Bool)

(assert (=> b!125851 (= e!82196 #b00000000000000000000000000000000)))

(declare-fun b!125852 () Bool)

(assert (=> b!125852 (= e!82197 call!13459)))

(declare-fun bm!13456 () Bool)

(assert (=> bm!13456 (= call!13459 (arrayCountValidKeys!0 (array!4668 (store (arr!2210 (_keys!4492 newMap!16)) (ite c!22713 (index!3209 lt!64214) (index!3206 lt!64214)) (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355)) (size!2473 (_keys!4492 newMap!16))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2473 (_keys!4492 newMap!16))))))

(declare-fun d!38051 () Bool)

(declare-fun lt!64901 () (_ BitVec 32))

(assert (=> d!38051 (and (bvsge lt!64901 #b00000000000000000000000000000000) (bvsle lt!64901 (bvsub (size!2473 (array!4668 (store (arr!2210 (_keys!4492 newMap!16)) (ite c!22713 (index!3209 lt!64214) (index!3206 lt!64214)) (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355)) (size!2473 (_keys!4492 newMap!16)))) #b00000000000000000000000000000000)))))

(assert (=> d!38051 (= lt!64901 e!82196)))

(declare-fun c!22993 () Bool)

(assert (=> d!38051 (= c!22993 (bvsge #b00000000000000000000000000000000 (size!2473 (_keys!4492 newMap!16))))))

(assert (=> d!38051 (and (bvsle #b00000000000000000000000000000000 (size!2473 (_keys!4492 newMap!16))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!2473 (_keys!4492 newMap!16)) (size!2473 (array!4668 (store (arr!2210 (_keys!4492 newMap!16)) (ite c!22713 (index!3209 lt!64214) (index!3206 lt!64214)) (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355)) (size!2473 (_keys!4492 newMap!16))))))))

(assert (=> d!38051 (= (arrayCountValidKeys!0 (array!4668 (store (arr!2210 (_keys!4492 newMap!16)) (ite c!22713 (index!3209 lt!64214) (index!3206 lt!64214)) (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355)) (size!2473 (_keys!4492 newMap!16))) #b00000000000000000000000000000000 (size!2473 (_keys!4492 newMap!16))) lt!64901)))

(assert (= (and d!38051 c!22993) b!125851))

(assert (= (and d!38051 (not c!22993)) b!125849))

(assert (= (and b!125849 c!22992) b!125850))

(assert (= (and b!125849 (not c!22992)) b!125852))

(assert (= (or b!125850 b!125852) bm!13456))

(assert (=> b!125849 m!146807))

(assert (=> b!125849 m!146807))

(assert (=> b!125849 m!146809))

(declare-fun m!146821 () Bool)

(assert (=> bm!13456 m!146821))

(assert (=> d!37607 d!38051))

(declare-fun d!38053 () Bool)

(declare-fun e!82198 () Bool)

(assert (=> d!38053 e!82198))

(declare-fun res!60900 () Bool)

(assert (=> d!38053 (=> res!60900 e!82198)))

(declare-fun lt!64902 () Bool)

(assert (=> d!38053 (= res!60900 (not lt!64902))))

(declare-fun lt!64905 () Bool)

(assert (=> d!38053 (= lt!64902 lt!64905)))

(declare-fun lt!64904 () Unit!3871)

(declare-fun e!82199 () Unit!3871)

(assert (=> d!38053 (= lt!64904 e!82199)))

(declare-fun c!22994 () Bool)

(assert (=> d!38053 (= c!22994 lt!64905)))

(assert (=> d!38053 (= lt!64905 (containsKey!170 (toList!831 (getCurrentListMap!511 lt!64482 lt!64487 (mask!7009 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16))) (select (store (arr!2210 (_keys!4492 newMap!16)) (ite c!22713 (index!3209 lt!64214) (index!3206 lt!64214)) (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355)) (ite c!22713 (index!3209 lt!64214) (index!3206 lt!64214)))))))

(assert (=> d!38053 (= (contains!861 (getCurrentListMap!511 lt!64482 lt!64487 (mask!7009 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16)) (select (store (arr!2210 (_keys!4492 newMap!16)) (ite c!22713 (index!3209 lt!64214) (index!3206 lt!64214)) (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355)) (ite c!22713 (index!3209 lt!64214) (index!3206 lt!64214)))) lt!64902)))

(declare-fun b!125853 () Bool)

(declare-fun lt!64903 () Unit!3871)

(assert (=> b!125853 (= e!82199 lt!64903)))

(assert (=> b!125853 (= lt!64903 (lemmaContainsKeyImpliesGetValueByKeyDefined!118 (toList!831 (getCurrentListMap!511 lt!64482 lt!64487 (mask!7009 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16))) (select (store (arr!2210 (_keys!4492 newMap!16)) (ite c!22713 (index!3209 lt!64214) (index!3206 lt!64214)) (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355)) (ite c!22713 (index!3209 lt!64214) (index!3206 lt!64214)))))))

(assert (=> b!125853 (isDefined!119 (getValueByKey!167 (toList!831 (getCurrentListMap!511 lt!64482 lt!64487 (mask!7009 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16))) (select (store (arr!2210 (_keys!4492 newMap!16)) (ite c!22713 (index!3209 lt!64214) (index!3206 lt!64214)) (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355)) (ite c!22713 (index!3209 lt!64214) (index!3206 lt!64214)))))))

(declare-fun b!125854 () Bool)

(declare-fun Unit!3919 () Unit!3871)

(assert (=> b!125854 (= e!82199 Unit!3919)))

(declare-fun b!125855 () Bool)

(assert (=> b!125855 (= e!82198 (isDefined!119 (getValueByKey!167 (toList!831 (getCurrentListMap!511 lt!64482 lt!64487 (mask!7009 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16))) (select (store (arr!2210 (_keys!4492 newMap!16)) (ite c!22713 (index!3209 lt!64214) (index!3206 lt!64214)) (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355)) (ite c!22713 (index!3209 lt!64214) (index!3206 lt!64214))))))))

(assert (= (and d!38053 c!22994) b!125853))

(assert (= (and d!38053 (not c!22994)) b!125854))

(assert (= (and d!38053 (not res!60900)) b!125855))

(assert (=> d!38053 m!145483))

(declare-fun m!146823 () Bool)

(assert (=> d!38053 m!146823))

(assert (=> b!125853 m!145483))

(declare-fun m!146825 () Bool)

(assert (=> b!125853 m!146825))

(assert (=> b!125853 m!145483))

(declare-fun m!146827 () Bool)

(assert (=> b!125853 m!146827))

(assert (=> b!125853 m!146827))

(declare-fun m!146829 () Bool)

(assert (=> b!125853 m!146829))

(assert (=> b!125855 m!145483))

(assert (=> b!125855 m!146827))

(assert (=> b!125855 m!146827))

(assert (=> b!125855 m!146829))

(assert (=> d!37607 d!38053))

(assert (=> d!37607 d!37587))

(declare-fun b!125856 () Bool)

(declare-fun e!82201 () Bool)

(assert (=> b!125856 (= e!82201 (contains!863 lt!64469 (select (arr!2210 (array!4668 (store (arr!2210 (_keys!4492 newMap!16)) (ite c!22713 (index!3209 lt!64214) (index!3206 lt!64214)) (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355)) (size!2473 (_keys!4492 newMap!16)))) lt!64478)))))

(declare-fun b!125857 () Bool)

(declare-fun e!82200 () Bool)

(declare-fun call!13460 () Bool)

(assert (=> b!125857 (= e!82200 call!13460)))

(declare-fun c!22995 () Bool)

(declare-fun bm!13457 () Bool)

(assert (=> bm!13457 (= call!13460 (arrayNoDuplicates!0 (array!4668 (store (arr!2210 (_keys!4492 newMap!16)) (ite c!22713 (index!3209 lt!64214) (index!3206 lt!64214)) (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355)) (size!2473 (_keys!4492 newMap!16))) (bvadd lt!64478 #b00000000000000000000000000000001) (ite c!22995 (Cons!1673 (select (arr!2210 (array!4668 (store (arr!2210 (_keys!4492 newMap!16)) (ite c!22713 (index!3209 lt!64214) (index!3206 lt!64214)) (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355)) (size!2473 (_keys!4492 newMap!16)))) lt!64478) lt!64469) lt!64469)))))

(declare-fun b!125858 () Bool)

(declare-fun e!82203 () Bool)

(declare-fun e!82202 () Bool)

(assert (=> b!125858 (= e!82203 e!82202)))

(declare-fun res!60901 () Bool)

(assert (=> b!125858 (=> (not res!60901) (not e!82202))))

(assert (=> b!125858 (= res!60901 (not e!82201))))

(declare-fun res!60903 () Bool)

(assert (=> b!125858 (=> (not res!60903) (not e!82201))))

(assert (=> b!125858 (= res!60903 (validKeyInArray!0 (select (arr!2210 (array!4668 (store (arr!2210 (_keys!4492 newMap!16)) (ite c!22713 (index!3209 lt!64214) (index!3206 lt!64214)) (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355)) (size!2473 (_keys!4492 newMap!16)))) lt!64478)))))

(declare-fun d!38055 () Bool)

(declare-fun res!60902 () Bool)

(assert (=> d!38055 (=> res!60902 e!82203)))

(assert (=> d!38055 (= res!60902 (bvsge lt!64478 (size!2473 (array!4668 (store (arr!2210 (_keys!4492 newMap!16)) (ite c!22713 (index!3209 lt!64214) (index!3206 lt!64214)) (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355)) (size!2473 (_keys!4492 newMap!16))))))))

(assert (=> d!38055 (= (arrayNoDuplicates!0 (array!4668 (store (arr!2210 (_keys!4492 newMap!16)) (ite c!22713 (index!3209 lt!64214) (index!3206 lt!64214)) (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355)) (size!2473 (_keys!4492 newMap!16))) lt!64478 lt!64469) e!82203)))

(declare-fun b!125859 () Bool)

(assert (=> b!125859 (= e!82202 e!82200)))

(assert (=> b!125859 (= c!22995 (validKeyInArray!0 (select (arr!2210 (array!4668 (store (arr!2210 (_keys!4492 newMap!16)) (ite c!22713 (index!3209 lt!64214) (index!3206 lt!64214)) (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355)) (size!2473 (_keys!4492 newMap!16)))) lt!64478)))))

(declare-fun b!125860 () Bool)

(assert (=> b!125860 (= e!82200 call!13460)))

(assert (= (and d!38055 (not res!60902)) b!125858))

(assert (= (and b!125858 res!60903) b!125856))

(assert (= (and b!125858 res!60901) b!125859))

(assert (= (and b!125859 c!22995) b!125857))

(assert (= (and b!125859 (not c!22995)) b!125860))

(assert (= (or b!125857 b!125860) bm!13457))

(declare-fun m!146831 () Bool)

(assert (=> b!125856 m!146831))

(assert (=> b!125856 m!146831))

(declare-fun m!146833 () Bool)

(assert (=> b!125856 m!146833))

(assert (=> bm!13457 m!146831))

(declare-fun m!146835 () Bool)

(assert (=> bm!13457 m!146835))

(assert (=> b!125858 m!146831))

(assert (=> b!125858 m!146831))

(declare-fun m!146837 () Bool)

(assert (=> b!125858 m!146837))

(assert (=> b!125859 m!146831))

(assert (=> b!125859 m!146831))

(assert (=> b!125859 m!146837))

(assert (=> d!37607 d!38055))

(assert (=> d!37607 d!37579))

(declare-fun b!125861 () Bool)

(declare-fun e!82204 () (_ BitVec 32))

(declare-fun e!82205 () (_ BitVec 32))

(assert (=> b!125861 (= e!82204 e!82205)))

(declare-fun c!22996 () Bool)

(assert (=> b!125861 (= c!22996 (validKeyInArray!0 (select (arr!2210 lt!64479) (ite c!22713 (index!3209 lt!64214) (index!3206 lt!64214)))))))

(declare-fun b!125862 () Bool)

(declare-fun call!13461 () (_ BitVec 32))

(assert (=> b!125862 (= e!82205 (bvadd #b00000000000000000000000000000001 call!13461))))

(declare-fun b!125863 () Bool)

(assert (=> b!125863 (= e!82204 #b00000000000000000000000000000000)))

(declare-fun b!125864 () Bool)

(assert (=> b!125864 (= e!82205 call!13461)))

(declare-fun bm!13458 () Bool)

(assert (=> bm!13458 (= call!13461 (arrayCountValidKeys!0 lt!64479 (bvadd (ite c!22713 (index!3209 lt!64214) (index!3206 lt!64214)) #b00000000000000000000000000000001) (bvadd (ite c!22713 (index!3209 lt!64214) (index!3206 lt!64214)) #b00000000000000000000000000000001)))))

(declare-fun d!38057 () Bool)

(declare-fun lt!64906 () (_ BitVec 32))

(assert (=> d!38057 (and (bvsge lt!64906 #b00000000000000000000000000000000) (bvsle lt!64906 (bvsub (size!2473 lt!64479) (ite c!22713 (index!3209 lt!64214) (index!3206 lt!64214)))))))

(assert (=> d!38057 (= lt!64906 e!82204)))

(declare-fun c!22997 () Bool)

(assert (=> d!38057 (= c!22997 (bvsge (ite c!22713 (index!3209 lt!64214) (index!3206 lt!64214)) (bvadd (ite c!22713 (index!3209 lt!64214) (index!3206 lt!64214)) #b00000000000000000000000000000001)))))

(assert (=> d!38057 (and (bvsle (ite c!22713 (index!3209 lt!64214) (index!3206 lt!64214)) (bvadd (ite c!22713 (index!3209 lt!64214) (index!3206 lt!64214)) #b00000000000000000000000000000001)) (bvsge (ite c!22713 (index!3209 lt!64214) (index!3206 lt!64214)) #b00000000000000000000000000000000) (bvsle (bvadd (ite c!22713 (index!3209 lt!64214) (index!3206 lt!64214)) #b00000000000000000000000000000001) (size!2473 lt!64479)))))

(assert (=> d!38057 (= (arrayCountValidKeys!0 lt!64479 (ite c!22713 (index!3209 lt!64214) (index!3206 lt!64214)) (bvadd (ite c!22713 (index!3209 lt!64214) (index!3206 lt!64214)) #b00000000000000000000000000000001)) lt!64906)))

(assert (= (and d!38057 c!22997) b!125863))

(assert (= (and d!38057 (not c!22997)) b!125861))

(assert (= (and b!125861 c!22996) b!125862))

(assert (= (and b!125861 (not c!22996)) b!125864))

(assert (= (or b!125862 b!125864) bm!13458))

(assert (=> b!125861 m!146803))

(assert (=> b!125861 m!146803))

(assert (=> b!125861 m!146805))

(declare-fun m!146839 () Bool)

(assert (=> bm!13458 m!146839))

(assert (=> d!37607 d!38057))

(declare-fun d!38059 () Bool)

(declare-fun e!82208 () Bool)

(assert (=> d!38059 e!82208))

(declare-fun res!60906 () Bool)

(assert (=> d!38059 (=> (not res!60906) (not e!82208))))

(assert (=> d!38059 (= res!60906 (and (bvsge (ite c!22713 (index!3209 lt!64214) (index!3206 lt!64214)) #b00000000000000000000000000000000) (bvslt (ite c!22713 (index!3209 lt!64214) (index!3206 lt!64214)) (size!2473 (_keys!4492 newMap!16))) (bvslt (ite c!22713 (index!3209 lt!64214) (index!3206 lt!64214)) (size!2474 (_values!2746 newMap!16)))))))

(declare-fun lt!64909 () Unit!3871)

(declare-fun choose!765 (array!4667 array!4669 (_ BitVec 32) (_ BitVec 32) V!3425 V!3425 (_ BitVec 32) (_ BitVec 64) V!3425 Int) Unit!3871)

(assert (=> d!38059 (= lt!64909 (choose!765 (_keys!4492 newMap!16) (_values!2746 newMap!16) (mask!7009 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) (ite c!22713 (index!3209 lt!64214) (index!3206 lt!64214)) (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2763 newMap!16)))))

(assert (=> d!38059 (validMask!0 (mask!7009 newMap!16))))

(assert (=> d!38059 (= (lemmaAddValidKeyToArrayThenAddPairToListMap!36 (_keys!4492 newMap!16) (_values!2746 newMap!16) (mask!7009 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) (ite c!22713 (index!3209 lt!64214) (index!3206 lt!64214)) (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2763 newMap!16)) lt!64909)))

(declare-fun b!125867 () Bool)

(assert (=> b!125867 (= e!82208 (= (+!163 (getCurrentListMap!511 (_keys!4492 newMap!16) (_values!2746 newMap!16) (mask!7009 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16)) (tuple2!2521 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (getCurrentListMap!511 (array!4668 (store (arr!2210 (_keys!4492 newMap!16)) (ite c!22713 (index!3209 lt!64214) (index!3206 lt!64214)) (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355)) (size!2473 (_keys!4492 newMap!16))) (array!4670 (store (arr!2211 (_values!2746 newMap!16)) (ite c!22713 (index!3209 lt!64214) (index!3206 lt!64214)) (ValueCellFull!1073 (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2474 (_values!2746 newMap!16))) (mask!7009 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16))))))

(assert (= (and d!38059 res!60906) b!125867))

(assert (=> d!38059 m!144797))

(assert (=> d!38059 m!144795))

(declare-fun m!146841 () Bool)

(assert (=> d!38059 m!146841))

(assert (=> d!38059 m!145065))

(assert (=> b!125867 m!145491))

(assert (=> b!125867 m!144893))

(assert (=> b!125867 m!145499))

(assert (=> b!125867 m!145467))

(assert (=> b!125867 m!144893))

(assert (=> b!125867 m!145493))

(assert (=> d!37607 d!38059))

(declare-fun d!38061 () Bool)

(declare-fun e!82211 () Bool)

(assert (=> d!38061 e!82211))

(declare-fun res!60909 () Bool)

(assert (=> d!38061 (=> (not res!60909) (not e!82211))))

(assert (=> d!38061 (= res!60909 (and (bvsge (ite c!22713 (index!3209 lt!64214) (index!3206 lt!64214)) #b00000000000000000000000000000000) (bvslt (ite c!22713 (index!3209 lt!64214) (index!3206 lt!64214)) (size!2473 (_keys!4492 newMap!16)))))))

(declare-fun lt!64912 () Unit!3871)

(declare-fun choose!41 (array!4667 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!1677) Unit!3871)

(assert (=> d!38061 (= lt!64912 (choose!41 (_keys!4492 newMap!16) (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355) (ite c!22713 (index!3209 lt!64214) (index!3206 lt!64214)) lt!64478 lt!64469))))

(assert (=> d!38061 (bvslt (size!2473 (_keys!4492 newMap!16)) #b01111111111111111111111111111111)))

(assert (=> d!38061 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!4492 newMap!16) (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355) (ite c!22713 (index!3209 lt!64214) (index!3206 lt!64214)) lt!64478 lt!64469) lt!64912)))

(declare-fun b!125870 () Bool)

(assert (=> b!125870 (= e!82211 (arrayNoDuplicates!0 (array!4668 (store (arr!2210 (_keys!4492 newMap!16)) (ite c!22713 (index!3209 lt!64214) (index!3206 lt!64214)) (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355)) (size!2473 (_keys!4492 newMap!16))) lt!64478 lt!64469))))

(assert (= (and d!38061 res!60909) b!125870))

(assert (=> d!38061 m!144797))

(declare-fun m!146843 () Bool)

(assert (=> d!38061 m!146843))

(assert (=> b!125870 m!145467))

(assert (=> b!125870 m!145501))

(assert (=> d!37607 d!38061))

(declare-fun d!38063 () Bool)

(assert (=> d!38063 (arrayContainsKey!0 lt!64486 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355) #b00000000000000000000000000000000)))

(declare-fun lt!64913 () Unit!3871)

(assert (=> d!38063 (= lt!64913 (choose!13 lt!64486 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355) (ite c!22713 (index!3209 lt!64214) (index!3206 lt!64214))))))

(assert (=> d!38063 (bvsge (ite c!22713 (index!3209 lt!64214) (index!3206 lt!64214)) #b00000000000000000000000000000000)))

(assert (=> d!38063 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!64486 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355) (ite c!22713 (index!3209 lt!64214) (index!3206 lt!64214))) lt!64913)))

(declare-fun bs!5229 () Bool)

(assert (= bs!5229 d!38063))

(assert (=> bs!5229 m!144797))

(assert (=> bs!5229 m!145495))

(assert (=> bs!5229 m!144797))

(declare-fun m!146845 () Bool)

(assert (=> bs!5229 m!146845))

(assert (=> d!37607 d!38063))

(declare-fun call!13468 () ListLongMap!1631)

(declare-fun c!23003 () Bool)

(declare-fun bm!13459 () Bool)

(declare-fun call!13462 () ListLongMap!1631)

(declare-fun call!13464 () ListLongMap!1631)

(declare-fun c!23001 () Bool)

(declare-fun call!13467 () ListLongMap!1631)

(assert (=> bm!13459 (= call!13462 (+!163 (ite c!23001 call!13467 (ite c!23003 call!13468 call!13464)) (ite (or c!23001 c!23003) (tuple2!2521 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2628 newMap!16)) (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 newMap!16)))))))

(declare-fun b!125871 () Bool)

(declare-fun e!82220 () Bool)

(declare-fun e!82213 () Bool)

(assert (=> b!125871 (= e!82220 e!82213)))

(declare-fun res!60910 () Bool)

(declare-fun call!13463 () Bool)

(assert (=> b!125871 (= res!60910 call!13463)))

(assert (=> b!125871 (=> (not res!60910) (not e!82213))))

(declare-fun bm!13460 () Bool)

(assert (=> bm!13460 (= call!13468 call!13467)))

(declare-fun b!125873 () Bool)

(declare-fun e!82223 () Bool)

(declare-fun lt!64915 () ListLongMap!1631)

(assert (=> b!125873 (= e!82223 (= (apply!110 lt!64915 (select (arr!2210 lt!64482) #b00000000000000000000000000000000)) (get!1446 (select (arr!2211 lt!64487) #b00000000000000000000000000000000) (dynLambda!415 (defaultEntry!2763 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!125873 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2474 lt!64487)))))

(assert (=> b!125873 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2473 lt!64482)))))

(declare-fun bm!13461 () Bool)

(assert (=> bm!13461 (= call!13464 call!13468)))

(declare-fun b!125874 () Bool)

(declare-fun e!82214 () Bool)

(declare-fun e!82219 () Bool)

(assert (=> b!125874 (= e!82214 e!82219)))

(declare-fun res!60917 () Bool)

(declare-fun call!13466 () Bool)

(assert (=> b!125874 (= res!60917 call!13466)))

(assert (=> b!125874 (=> (not res!60917) (not e!82219))))

(declare-fun b!125875 () Bool)

(declare-fun e!82217 () Unit!3871)

(declare-fun lt!64926 () Unit!3871)

(assert (=> b!125875 (= e!82217 lt!64926)))

(declare-fun lt!64929 () ListLongMap!1631)

(assert (=> b!125875 (= lt!64929 (getCurrentListMapNoExtraKeys!130 lt!64482 lt!64487 (mask!7009 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16)))))

(declare-fun lt!64921 () (_ BitVec 64))

(assert (=> b!125875 (= lt!64921 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!64916 () (_ BitVec 64))

(assert (=> b!125875 (= lt!64916 (select (arr!2210 lt!64482) #b00000000000000000000000000000000))))

(declare-fun lt!64919 () Unit!3871)

(assert (=> b!125875 (= lt!64919 (addStillContains!86 lt!64929 lt!64921 (zeroValue!2628 newMap!16) lt!64916))))

(assert (=> b!125875 (contains!861 (+!163 lt!64929 (tuple2!2521 lt!64921 (zeroValue!2628 newMap!16))) lt!64916)))

(declare-fun lt!64914 () Unit!3871)

(assert (=> b!125875 (= lt!64914 lt!64919)))

(declare-fun lt!64923 () ListLongMap!1631)

(assert (=> b!125875 (= lt!64923 (getCurrentListMapNoExtraKeys!130 lt!64482 lt!64487 (mask!7009 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16)))))

(declare-fun lt!64932 () (_ BitVec 64))

(assert (=> b!125875 (= lt!64932 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!64918 () (_ BitVec 64))

(assert (=> b!125875 (= lt!64918 (select (arr!2210 lt!64482) #b00000000000000000000000000000000))))

(declare-fun lt!64920 () Unit!3871)

(assert (=> b!125875 (= lt!64920 (addApplyDifferent!86 lt!64923 lt!64932 (minValue!2628 newMap!16) lt!64918))))

(assert (=> b!125875 (= (apply!110 (+!163 lt!64923 (tuple2!2521 lt!64932 (minValue!2628 newMap!16))) lt!64918) (apply!110 lt!64923 lt!64918))))

(declare-fun lt!64933 () Unit!3871)

(assert (=> b!125875 (= lt!64933 lt!64920)))

(declare-fun lt!64925 () ListLongMap!1631)

(assert (=> b!125875 (= lt!64925 (getCurrentListMapNoExtraKeys!130 lt!64482 lt!64487 (mask!7009 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16)))))

(declare-fun lt!64931 () (_ BitVec 64))

(assert (=> b!125875 (= lt!64931 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!64928 () (_ BitVec 64))

(assert (=> b!125875 (= lt!64928 (select (arr!2210 lt!64482) #b00000000000000000000000000000000))))

(declare-fun lt!64927 () Unit!3871)

(assert (=> b!125875 (= lt!64927 (addApplyDifferent!86 lt!64925 lt!64931 (zeroValue!2628 newMap!16) lt!64928))))

(assert (=> b!125875 (= (apply!110 (+!163 lt!64925 (tuple2!2521 lt!64931 (zeroValue!2628 newMap!16))) lt!64928) (apply!110 lt!64925 lt!64928))))

(declare-fun lt!64922 () Unit!3871)

(assert (=> b!125875 (= lt!64922 lt!64927)))

(declare-fun lt!64917 () ListLongMap!1631)

(assert (=> b!125875 (= lt!64917 (getCurrentListMapNoExtraKeys!130 lt!64482 lt!64487 (mask!7009 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16)))))

(declare-fun lt!64924 () (_ BitVec 64))

(assert (=> b!125875 (= lt!64924 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!64935 () (_ BitVec 64))

(assert (=> b!125875 (= lt!64935 (select (arr!2210 lt!64482) #b00000000000000000000000000000000))))

(assert (=> b!125875 (= lt!64926 (addApplyDifferent!86 lt!64917 lt!64924 (minValue!2628 newMap!16) lt!64935))))

(assert (=> b!125875 (= (apply!110 (+!163 lt!64917 (tuple2!2521 lt!64924 (minValue!2628 newMap!16))) lt!64935) (apply!110 lt!64917 lt!64935))))

(declare-fun b!125876 () Bool)

(declare-fun e!82215 () ListLongMap!1631)

(assert (=> b!125876 (= e!82215 call!13464)))

(declare-fun b!125877 () Bool)

(declare-fun e!82222 () Bool)

(assert (=> b!125877 (= e!82222 e!82214)))

(declare-fun c!22999 () Bool)

(assert (=> b!125877 (= c!22999 (not (= (bvand (extraKeys!2548 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!125878 () Bool)

(assert (=> b!125878 (= e!82220 (not call!13463))))

(declare-fun bm!13462 () Bool)

(assert (=> bm!13462 (= call!13466 (contains!861 lt!64915 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!125879 () Bool)

(declare-fun e!82218 () Bool)

(assert (=> b!125879 (= e!82218 (validKeyInArray!0 (select (arr!2210 lt!64482) #b00000000000000000000000000000000)))))

(declare-fun d!38065 () Bool)

(assert (=> d!38065 e!82222))

(declare-fun res!60913 () Bool)

(assert (=> d!38065 (=> (not res!60913) (not e!82222))))

(assert (=> d!38065 (= res!60913 (or (bvsge #b00000000000000000000000000000000 (size!2473 lt!64482)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2473 lt!64482)))))))

(declare-fun lt!64930 () ListLongMap!1631)

(assert (=> d!38065 (= lt!64915 lt!64930)))

(declare-fun lt!64934 () Unit!3871)

(assert (=> d!38065 (= lt!64934 e!82217)))

(declare-fun c!22998 () Bool)

(declare-fun e!82224 () Bool)

(assert (=> d!38065 (= c!22998 e!82224)))

(declare-fun res!60915 () Bool)

(assert (=> d!38065 (=> (not res!60915) (not e!82224))))

(assert (=> d!38065 (= res!60915 (bvslt #b00000000000000000000000000000000 (size!2473 lt!64482)))))

(declare-fun e!82212 () ListLongMap!1631)

(assert (=> d!38065 (= lt!64930 e!82212)))

(assert (=> d!38065 (= c!23001 (and (not (= (bvand (extraKeys!2548 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2548 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!38065 (validMask!0 (mask!7009 newMap!16))))

(assert (=> d!38065 (= (getCurrentListMap!511 lt!64482 lt!64487 (mask!7009 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16)) lt!64915)))

(declare-fun b!125872 () Bool)

(assert (=> b!125872 (= e!82214 (not call!13466))))

(declare-fun bm!13463 () Bool)

(assert (=> bm!13463 (= call!13463 (contains!861 lt!64915 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!125880 () Bool)

(assert (=> b!125880 (= e!82224 (validKeyInArray!0 (select (arr!2210 lt!64482) #b00000000000000000000000000000000)))))

(declare-fun b!125881 () Bool)

(assert (=> b!125881 (= e!82219 (= (apply!110 lt!64915 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2628 newMap!16)))))

(declare-fun b!125882 () Bool)

(assert (=> b!125882 (= e!82213 (= (apply!110 lt!64915 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2628 newMap!16)))))

(declare-fun b!125883 () Bool)

(declare-fun e!82216 () Bool)

(assert (=> b!125883 (= e!82216 e!82223)))

(declare-fun res!60911 () Bool)

(assert (=> b!125883 (=> (not res!60911) (not e!82223))))

(assert (=> b!125883 (= res!60911 (contains!861 lt!64915 (select (arr!2210 lt!64482) #b00000000000000000000000000000000)))))

(assert (=> b!125883 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2473 lt!64482)))))

(declare-fun b!125884 () Bool)

(declare-fun e!82221 () ListLongMap!1631)

(assert (=> b!125884 (= e!82212 e!82221)))

(assert (=> b!125884 (= c!23003 (and (not (= (bvand (extraKeys!2548 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2548 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!125885 () Bool)

(declare-fun call!13465 () ListLongMap!1631)

(assert (=> b!125885 (= e!82215 call!13465)))

(declare-fun bm!13464 () Bool)

(assert (=> bm!13464 (= call!13467 (getCurrentListMapNoExtraKeys!130 lt!64482 lt!64487 (mask!7009 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16)))))

(declare-fun b!125886 () Bool)

(declare-fun res!60912 () Bool)

(assert (=> b!125886 (=> (not res!60912) (not e!82222))))

(assert (=> b!125886 (= res!60912 e!82216)))

(declare-fun res!60916 () Bool)

(assert (=> b!125886 (=> res!60916 e!82216)))

(assert (=> b!125886 (= res!60916 (not e!82218))))

(declare-fun res!60914 () Bool)

(assert (=> b!125886 (=> (not res!60914) (not e!82218))))

(assert (=> b!125886 (= res!60914 (bvslt #b00000000000000000000000000000000 (size!2473 lt!64482)))))

(declare-fun b!125887 () Bool)

(assert (=> b!125887 (= e!82221 call!13465)))

(declare-fun b!125888 () Bool)

(declare-fun Unit!3920 () Unit!3871)

(assert (=> b!125888 (= e!82217 Unit!3920)))

(declare-fun b!125889 () Bool)

(assert (=> b!125889 (= e!82212 (+!163 call!13462 (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 newMap!16))))))

(declare-fun b!125890 () Bool)

(declare-fun res!60918 () Bool)

(assert (=> b!125890 (=> (not res!60918) (not e!82222))))

(assert (=> b!125890 (= res!60918 e!82220)))

(declare-fun c!23000 () Bool)

(assert (=> b!125890 (= c!23000 (not (= (bvand (extraKeys!2548 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!13465 () Bool)

(assert (=> bm!13465 (= call!13465 call!13462)))

(declare-fun b!125891 () Bool)

(declare-fun c!23002 () Bool)

(assert (=> b!125891 (= c!23002 (and (not (= (bvand (extraKeys!2548 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2548 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!125891 (= e!82221 e!82215)))

(assert (= (and d!38065 c!23001) b!125889))

(assert (= (and d!38065 (not c!23001)) b!125884))

(assert (= (and b!125884 c!23003) b!125887))

(assert (= (and b!125884 (not c!23003)) b!125891))

(assert (= (and b!125891 c!23002) b!125885))

(assert (= (and b!125891 (not c!23002)) b!125876))

(assert (= (or b!125885 b!125876) bm!13461))

(assert (= (or b!125887 bm!13461) bm!13460))

(assert (= (or b!125887 b!125885) bm!13465))

(assert (= (or b!125889 bm!13460) bm!13464))

(assert (= (or b!125889 bm!13465) bm!13459))

(assert (= (and d!38065 res!60915) b!125880))

(assert (= (and d!38065 c!22998) b!125875))

(assert (= (and d!38065 (not c!22998)) b!125888))

(assert (= (and d!38065 res!60913) b!125886))

(assert (= (and b!125886 res!60914) b!125879))

(assert (= (and b!125886 (not res!60916)) b!125883))

(assert (= (and b!125883 res!60911) b!125873))

(assert (= (and b!125886 res!60912) b!125890))

(assert (= (and b!125890 c!23000) b!125871))

(assert (= (and b!125890 (not c!23000)) b!125878))

(assert (= (and b!125871 res!60910) b!125882))

(assert (= (or b!125871 b!125878) bm!13463))

(assert (= (and b!125890 res!60918) b!125877))

(assert (= (and b!125877 c!22999) b!125874))

(assert (= (and b!125877 (not c!22999)) b!125872))

(assert (= (and b!125874 res!60917) b!125881))

(assert (= (or b!125874 b!125872) bm!13462))

(declare-fun b_lambda!5529 () Bool)

(assert (=> (not b_lambda!5529) (not b!125873)))

(assert (=> b!125873 t!6006))

(declare-fun b_and!7741 () Bool)

(assert (= b_and!7737 (and (=> t!6006 result!3815) b_and!7741)))

(assert (=> b!125873 t!6008))

(declare-fun b_and!7743 () Bool)

(assert (= b_and!7739 (and (=> t!6008 result!3817) b_and!7743)))

(declare-fun m!146847 () Bool)

(assert (=> b!125881 m!146847))

(declare-fun m!146849 () Bool)

(assert (=> bm!13464 m!146849))

(declare-fun m!146851 () Bool)

(assert (=> b!125882 m!146851))

(declare-fun m!146853 () Bool)

(assert (=> b!125889 m!146853))

(declare-fun m!146855 () Bool)

(assert (=> bm!13463 m!146855))

(declare-fun m!146857 () Bool)

(assert (=> b!125873 m!146857))

(declare-fun m!146859 () Bool)

(assert (=> b!125873 m!146859))

(assert (=> b!125873 m!146857))

(assert (=> b!125873 m!145277))

(declare-fun m!146861 () Bool)

(assert (=> b!125873 m!146861))

(assert (=> b!125873 m!146861))

(assert (=> b!125873 m!145277))

(declare-fun m!146863 () Bool)

(assert (=> b!125873 m!146863))

(assert (=> b!125883 m!146857))

(assert (=> b!125883 m!146857))

(declare-fun m!146865 () Bool)

(assert (=> b!125883 m!146865))

(declare-fun m!146867 () Bool)

(assert (=> b!125875 m!146867))

(declare-fun m!146869 () Bool)

(assert (=> b!125875 m!146869))

(assert (=> b!125875 m!146849))

(declare-fun m!146871 () Bool)

(assert (=> b!125875 m!146871))

(declare-fun m!146873 () Bool)

(assert (=> b!125875 m!146873))

(declare-fun m!146875 () Bool)

(assert (=> b!125875 m!146875))

(assert (=> b!125875 m!146867))

(declare-fun m!146877 () Bool)

(assert (=> b!125875 m!146877))

(assert (=> b!125875 m!146871))

(declare-fun m!146879 () Bool)

(assert (=> b!125875 m!146879))

(declare-fun m!146881 () Bool)

(assert (=> b!125875 m!146881))

(declare-fun m!146883 () Bool)

(assert (=> b!125875 m!146883))

(declare-fun m!146885 () Bool)

(assert (=> b!125875 m!146885))

(declare-fun m!146887 () Bool)

(assert (=> b!125875 m!146887))

(declare-fun m!146889 () Bool)

(assert (=> b!125875 m!146889))

(declare-fun m!146891 () Bool)

(assert (=> b!125875 m!146891))

(declare-fun m!146893 () Bool)

(assert (=> b!125875 m!146893))

(assert (=> b!125875 m!146889))

(assert (=> b!125875 m!146883))

(declare-fun m!146895 () Bool)

(assert (=> b!125875 m!146895))

(assert (=> b!125875 m!146857))

(assert (=> b!125879 m!146857))

(assert (=> b!125879 m!146857))

(declare-fun m!146897 () Bool)

(assert (=> b!125879 m!146897))

(declare-fun m!146899 () Bool)

(assert (=> bm!13462 m!146899))

(declare-fun m!146901 () Bool)

(assert (=> bm!13459 m!146901))

(assert (=> d!38065 m!145065))

(assert (=> b!125880 m!146857))

(assert (=> b!125880 m!146857))

(assert (=> b!125880 m!146897))

(assert (=> d!37607 d!38065))

(declare-fun b!125902 () Bool)

(declare-fun e!82229 () Bool)

(assert (=> b!125902 (= e!82229 (bvslt (size!2473 (_keys!4492 newMap!16)) #b01111111111111111111111111111111))))

(declare-fun d!38067 () Bool)

(declare-fun e!82230 () Bool)

(assert (=> d!38067 e!82230))

(declare-fun res!60930 () Bool)

(assert (=> d!38067 (=> (not res!60930) (not e!82230))))

(assert (=> d!38067 (= res!60930 (and (bvsge (ite c!22713 (index!3209 lt!64214) (index!3206 lt!64214)) #b00000000000000000000000000000000) (bvslt (ite c!22713 (index!3209 lt!64214) (index!3206 lt!64214)) (size!2473 (_keys!4492 newMap!16)))))))

(declare-fun lt!64938 () Unit!3871)

(declare-fun choose!1 (array!4667 (_ BitVec 32) (_ BitVec 64)) Unit!3871)

(assert (=> d!38067 (= lt!64938 (choose!1 (_keys!4492 newMap!16) (ite c!22713 (index!3209 lt!64214) (index!3206 lt!64214)) (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355)))))

(assert (=> d!38067 e!82229))

(declare-fun res!60928 () Bool)

(assert (=> d!38067 (=> (not res!60928) (not e!82229))))

(assert (=> d!38067 (= res!60928 (and (bvsge (ite c!22713 (index!3209 lt!64214) (index!3206 lt!64214)) #b00000000000000000000000000000000) (bvslt (ite c!22713 (index!3209 lt!64214) (index!3206 lt!64214)) (size!2473 (_keys!4492 newMap!16)))))))

(assert (=> d!38067 (= (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!4492 newMap!16) (ite c!22713 (index!3209 lt!64214) (index!3206 lt!64214)) (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355)) lt!64938)))

(declare-fun b!125901 () Bool)

(declare-fun res!60929 () Bool)

(assert (=> b!125901 (=> (not res!60929) (not e!82229))))

(assert (=> b!125901 (= res!60929 (validKeyInArray!0 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355)))))

(declare-fun b!125900 () Bool)

(declare-fun res!60927 () Bool)

(assert (=> b!125900 (=> (not res!60927) (not e!82229))))

(assert (=> b!125900 (= res!60927 (not (validKeyInArray!0 (select (arr!2210 (_keys!4492 newMap!16)) (ite c!22713 (index!3209 lt!64214) (index!3206 lt!64214))))))))

(declare-fun b!125903 () Bool)

(assert (=> b!125903 (= e!82230 (= (arrayCountValidKeys!0 (array!4668 (store (arr!2210 (_keys!4492 newMap!16)) (ite c!22713 (index!3209 lt!64214) (index!3206 lt!64214)) (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355)) (size!2473 (_keys!4492 newMap!16))) #b00000000000000000000000000000000 (size!2473 (_keys!4492 newMap!16))) (bvadd (arrayCountValidKeys!0 (_keys!4492 newMap!16) #b00000000000000000000000000000000 (size!2473 (_keys!4492 newMap!16))) #b00000000000000000000000000000001)))))

(assert (= (and d!38067 res!60928) b!125900))

(assert (= (and b!125900 res!60927) b!125901))

(assert (= (and b!125901 res!60929) b!125902))

(assert (= (and d!38067 res!60930) b!125903))

(assert (=> d!38067 m!144797))

(declare-fun m!146903 () Bool)

(assert (=> d!38067 m!146903))

(assert (=> b!125901 m!144797))

(declare-fun m!146905 () Bool)

(assert (=> b!125901 m!146905))

(declare-fun m!146907 () Bool)

(assert (=> b!125900 m!146907))

(assert (=> b!125900 m!146907))

(declare-fun m!146909 () Bool)

(assert (=> b!125900 m!146909))

(assert (=> b!125903 m!145467))

(assert (=> b!125903 m!145487))

(assert (=> b!125903 m!144953))

(assert (=> d!37607 d!38067))

(assert (=> d!37607 d!37615))

(assert (=> d!37607 d!37503))

(declare-fun d!38069 () Bool)

(declare-fun res!60931 () Bool)

(declare-fun e!82231 () Bool)

(assert (=> d!38069 (=> res!60931 e!82231)))

(assert (=> d!38069 (= res!60931 (= (select (arr!2210 lt!64486) #b00000000000000000000000000000000) (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355)))))

(assert (=> d!38069 (= (arrayContainsKey!0 lt!64486 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355) #b00000000000000000000000000000000) e!82231)))

(declare-fun b!125904 () Bool)

(declare-fun e!82232 () Bool)

(assert (=> b!125904 (= e!82231 e!82232)))

(declare-fun res!60932 () Bool)

(assert (=> b!125904 (=> (not res!60932) (not e!82232))))

(assert (=> b!125904 (= res!60932 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2473 lt!64486)))))

(declare-fun b!125905 () Bool)

(assert (=> b!125905 (= e!82232 (arrayContainsKey!0 lt!64486 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!38069 (not res!60931)) b!125904))

(assert (= (and b!125904 res!60932) b!125905))

(declare-fun m!146911 () Bool)

(assert (=> d!38069 m!146911))

(assert (=> b!125905 m!144797))

(declare-fun m!146913 () Bool)

(assert (=> b!125905 m!146913))

(assert (=> d!37607 d!38069))

(assert (=> d!37607 d!37589))

(declare-fun call!13469 () ListLongMap!1631)

(declare-fun bm!13466 () Bool)

(declare-fun call!13474 () ListLongMap!1631)

(declare-fun c!23007 () Bool)

(declare-fun call!13471 () ListLongMap!1631)

(declare-fun call!13475 () ListLongMap!1631)

(declare-fun c!23009 () Bool)

(assert (=> bm!13466 (= call!13469 (+!163 (ite c!23007 call!13474 (ite c!23009 call!13475 call!13471)) (ite (or c!23007 c!23009) (tuple2!2521 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2628 newMap!16)) (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 newMap!16)))))))

(declare-fun b!125906 () Bool)

(declare-fun e!82241 () Bool)

(declare-fun e!82234 () Bool)

(assert (=> b!125906 (= e!82241 e!82234)))

(declare-fun res!60933 () Bool)

(declare-fun call!13470 () Bool)

(assert (=> b!125906 (= res!60933 call!13470)))

(assert (=> b!125906 (=> (not res!60933) (not e!82234))))

(declare-fun bm!13467 () Bool)

(assert (=> bm!13467 (= call!13475 call!13474)))

(declare-fun b!125908 () Bool)

(declare-fun e!82244 () Bool)

(declare-fun lt!64940 () ListLongMap!1631)

(assert (=> b!125908 (= e!82244 (= (apply!110 lt!64940 (select (arr!2210 (array!4668 (store (arr!2210 (_keys!4492 newMap!16)) (ite c!22713 (index!3209 lt!64214) (index!3206 lt!64214)) (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355)) (size!2473 (_keys!4492 newMap!16)))) #b00000000000000000000000000000000)) (get!1446 (select (arr!2211 (array!4670 (store (arr!2211 (_values!2746 newMap!16)) (ite c!22713 (index!3209 lt!64214) (index!3206 lt!64214)) (ValueCellFull!1073 (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2474 (_values!2746 newMap!16)))) #b00000000000000000000000000000000) (dynLambda!415 (defaultEntry!2763 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!125908 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2474 (array!4670 (store (arr!2211 (_values!2746 newMap!16)) (ite c!22713 (index!3209 lt!64214) (index!3206 lt!64214)) (ValueCellFull!1073 (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2474 (_values!2746 newMap!16))))))))

(assert (=> b!125908 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2473 (array!4668 (store (arr!2210 (_keys!4492 newMap!16)) (ite c!22713 (index!3209 lt!64214) (index!3206 lt!64214)) (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355)) (size!2473 (_keys!4492 newMap!16))))))))

(declare-fun bm!13468 () Bool)

(assert (=> bm!13468 (= call!13471 call!13475)))

(declare-fun b!125909 () Bool)

(declare-fun e!82235 () Bool)

(declare-fun e!82240 () Bool)

(assert (=> b!125909 (= e!82235 e!82240)))

(declare-fun res!60940 () Bool)

(declare-fun call!13473 () Bool)

(assert (=> b!125909 (= res!60940 call!13473)))

(assert (=> b!125909 (=> (not res!60940) (not e!82240))))

(declare-fun b!125910 () Bool)

(declare-fun e!82238 () Unit!3871)

(declare-fun lt!64951 () Unit!3871)

(assert (=> b!125910 (= e!82238 lt!64951)))

(declare-fun lt!64954 () ListLongMap!1631)

(assert (=> b!125910 (= lt!64954 (getCurrentListMapNoExtraKeys!130 (array!4668 (store (arr!2210 (_keys!4492 newMap!16)) (ite c!22713 (index!3209 lt!64214) (index!3206 lt!64214)) (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355)) (size!2473 (_keys!4492 newMap!16))) (array!4670 (store (arr!2211 (_values!2746 newMap!16)) (ite c!22713 (index!3209 lt!64214) (index!3206 lt!64214)) (ValueCellFull!1073 (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2474 (_values!2746 newMap!16))) (mask!7009 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16)))))

(declare-fun lt!64946 () (_ BitVec 64))

(assert (=> b!125910 (= lt!64946 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!64941 () (_ BitVec 64))

(assert (=> b!125910 (= lt!64941 (select (arr!2210 (array!4668 (store (arr!2210 (_keys!4492 newMap!16)) (ite c!22713 (index!3209 lt!64214) (index!3206 lt!64214)) (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355)) (size!2473 (_keys!4492 newMap!16)))) #b00000000000000000000000000000000))))

(declare-fun lt!64944 () Unit!3871)

(assert (=> b!125910 (= lt!64944 (addStillContains!86 lt!64954 lt!64946 (zeroValue!2628 newMap!16) lt!64941))))

(assert (=> b!125910 (contains!861 (+!163 lt!64954 (tuple2!2521 lt!64946 (zeroValue!2628 newMap!16))) lt!64941)))

(declare-fun lt!64939 () Unit!3871)

(assert (=> b!125910 (= lt!64939 lt!64944)))

(declare-fun lt!64948 () ListLongMap!1631)

(assert (=> b!125910 (= lt!64948 (getCurrentListMapNoExtraKeys!130 (array!4668 (store (arr!2210 (_keys!4492 newMap!16)) (ite c!22713 (index!3209 lt!64214) (index!3206 lt!64214)) (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355)) (size!2473 (_keys!4492 newMap!16))) (array!4670 (store (arr!2211 (_values!2746 newMap!16)) (ite c!22713 (index!3209 lt!64214) (index!3206 lt!64214)) (ValueCellFull!1073 (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2474 (_values!2746 newMap!16))) (mask!7009 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16)))))

(declare-fun lt!64957 () (_ BitVec 64))

(assert (=> b!125910 (= lt!64957 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!64943 () (_ BitVec 64))

(assert (=> b!125910 (= lt!64943 (select (arr!2210 (array!4668 (store (arr!2210 (_keys!4492 newMap!16)) (ite c!22713 (index!3209 lt!64214) (index!3206 lt!64214)) (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355)) (size!2473 (_keys!4492 newMap!16)))) #b00000000000000000000000000000000))))

(declare-fun lt!64945 () Unit!3871)

(assert (=> b!125910 (= lt!64945 (addApplyDifferent!86 lt!64948 lt!64957 (minValue!2628 newMap!16) lt!64943))))

(assert (=> b!125910 (= (apply!110 (+!163 lt!64948 (tuple2!2521 lt!64957 (minValue!2628 newMap!16))) lt!64943) (apply!110 lt!64948 lt!64943))))

(declare-fun lt!64958 () Unit!3871)

(assert (=> b!125910 (= lt!64958 lt!64945)))

(declare-fun lt!64950 () ListLongMap!1631)

(assert (=> b!125910 (= lt!64950 (getCurrentListMapNoExtraKeys!130 (array!4668 (store (arr!2210 (_keys!4492 newMap!16)) (ite c!22713 (index!3209 lt!64214) (index!3206 lt!64214)) (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355)) (size!2473 (_keys!4492 newMap!16))) (array!4670 (store (arr!2211 (_values!2746 newMap!16)) (ite c!22713 (index!3209 lt!64214) (index!3206 lt!64214)) (ValueCellFull!1073 (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2474 (_values!2746 newMap!16))) (mask!7009 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16)))))

(declare-fun lt!64956 () (_ BitVec 64))

(assert (=> b!125910 (= lt!64956 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!64953 () (_ BitVec 64))

(assert (=> b!125910 (= lt!64953 (select (arr!2210 (array!4668 (store (arr!2210 (_keys!4492 newMap!16)) (ite c!22713 (index!3209 lt!64214) (index!3206 lt!64214)) (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355)) (size!2473 (_keys!4492 newMap!16)))) #b00000000000000000000000000000000))))

(declare-fun lt!64952 () Unit!3871)

(assert (=> b!125910 (= lt!64952 (addApplyDifferent!86 lt!64950 lt!64956 (zeroValue!2628 newMap!16) lt!64953))))

(assert (=> b!125910 (= (apply!110 (+!163 lt!64950 (tuple2!2521 lt!64956 (zeroValue!2628 newMap!16))) lt!64953) (apply!110 lt!64950 lt!64953))))

(declare-fun lt!64947 () Unit!3871)

(assert (=> b!125910 (= lt!64947 lt!64952)))

(declare-fun lt!64942 () ListLongMap!1631)

(assert (=> b!125910 (= lt!64942 (getCurrentListMapNoExtraKeys!130 (array!4668 (store (arr!2210 (_keys!4492 newMap!16)) (ite c!22713 (index!3209 lt!64214) (index!3206 lt!64214)) (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355)) (size!2473 (_keys!4492 newMap!16))) (array!4670 (store (arr!2211 (_values!2746 newMap!16)) (ite c!22713 (index!3209 lt!64214) (index!3206 lt!64214)) (ValueCellFull!1073 (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2474 (_values!2746 newMap!16))) (mask!7009 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16)))))

(declare-fun lt!64949 () (_ BitVec 64))

(assert (=> b!125910 (= lt!64949 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!64960 () (_ BitVec 64))

(assert (=> b!125910 (= lt!64960 (select (arr!2210 (array!4668 (store (arr!2210 (_keys!4492 newMap!16)) (ite c!22713 (index!3209 lt!64214) (index!3206 lt!64214)) (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355)) (size!2473 (_keys!4492 newMap!16)))) #b00000000000000000000000000000000))))

(assert (=> b!125910 (= lt!64951 (addApplyDifferent!86 lt!64942 lt!64949 (minValue!2628 newMap!16) lt!64960))))

(assert (=> b!125910 (= (apply!110 (+!163 lt!64942 (tuple2!2521 lt!64949 (minValue!2628 newMap!16))) lt!64960) (apply!110 lt!64942 lt!64960))))

(declare-fun b!125911 () Bool)

(declare-fun e!82236 () ListLongMap!1631)

(assert (=> b!125911 (= e!82236 call!13471)))

(declare-fun b!125912 () Bool)

(declare-fun e!82243 () Bool)

(assert (=> b!125912 (= e!82243 e!82235)))

(declare-fun c!23005 () Bool)

(assert (=> b!125912 (= c!23005 (not (= (bvand (extraKeys!2548 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!125913 () Bool)

(assert (=> b!125913 (= e!82241 (not call!13470))))

(declare-fun bm!13469 () Bool)

(assert (=> bm!13469 (= call!13473 (contains!861 lt!64940 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!125914 () Bool)

(declare-fun e!82239 () Bool)

(assert (=> b!125914 (= e!82239 (validKeyInArray!0 (select (arr!2210 (array!4668 (store (arr!2210 (_keys!4492 newMap!16)) (ite c!22713 (index!3209 lt!64214) (index!3206 lt!64214)) (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355)) (size!2473 (_keys!4492 newMap!16)))) #b00000000000000000000000000000000)))))

(declare-fun d!38071 () Bool)

(assert (=> d!38071 e!82243))

(declare-fun res!60936 () Bool)

(assert (=> d!38071 (=> (not res!60936) (not e!82243))))

(assert (=> d!38071 (= res!60936 (or (bvsge #b00000000000000000000000000000000 (size!2473 (array!4668 (store (arr!2210 (_keys!4492 newMap!16)) (ite c!22713 (index!3209 lt!64214) (index!3206 lt!64214)) (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355)) (size!2473 (_keys!4492 newMap!16))))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2473 (array!4668 (store (arr!2210 (_keys!4492 newMap!16)) (ite c!22713 (index!3209 lt!64214) (index!3206 lt!64214)) (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355)) (size!2473 (_keys!4492 newMap!16))))))))))

(declare-fun lt!64955 () ListLongMap!1631)

(assert (=> d!38071 (= lt!64940 lt!64955)))

(declare-fun lt!64959 () Unit!3871)

(assert (=> d!38071 (= lt!64959 e!82238)))

(declare-fun c!23004 () Bool)

(declare-fun e!82245 () Bool)

(assert (=> d!38071 (= c!23004 e!82245)))

(declare-fun res!60938 () Bool)

(assert (=> d!38071 (=> (not res!60938) (not e!82245))))

(assert (=> d!38071 (= res!60938 (bvslt #b00000000000000000000000000000000 (size!2473 (array!4668 (store (arr!2210 (_keys!4492 newMap!16)) (ite c!22713 (index!3209 lt!64214) (index!3206 lt!64214)) (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355)) (size!2473 (_keys!4492 newMap!16))))))))

(declare-fun e!82233 () ListLongMap!1631)

(assert (=> d!38071 (= lt!64955 e!82233)))

(assert (=> d!38071 (= c!23007 (and (not (= (bvand (extraKeys!2548 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2548 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!38071 (validMask!0 (mask!7009 newMap!16))))

(assert (=> d!38071 (= (getCurrentListMap!511 (array!4668 (store (arr!2210 (_keys!4492 newMap!16)) (ite c!22713 (index!3209 lt!64214) (index!3206 lt!64214)) (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355)) (size!2473 (_keys!4492 newMap!16))) (array!4670 (store (arr!2211 (_values!2746 newMap!16)) (ite c!22713 (index!3209 lt!64214) (index!3206 lt!64214)) (ValueCellFull!1073 (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2474 (_values!2746 newMap!16))) (mask!7009 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16)) lt!64940)))

(declare-fun b!125907 () Bool)

(assert (=> b!125907 (= e!82235 (not call!13473))))

(declare-fun bm!13470 () Bool)

(assert (=> bm!13470 (= call!13470 (contains!861 lt!64940 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!125915 () Bool)

(assert (=> b!125915 (= e!82245 (validKeyInArray!0 (select (arr!2210 (array!4668 (store (arr!2210 (_keys!4492 newMap!16)) (ite c!22713 (index!3209 lt!64214) (index!3206 lt!64214)) (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355)) (size!2473 (_keys!4492 newMap!16)))) #b00000000000000000000000000000000)))))

(declare-fun b!125916 () Bool)

(assert (=> b!125916 (= e!82240 (= (apply!110 lt!64940 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2628 newMap!16)))))

(declare-fun b!125917 () Bool)

(assert (=> b!125917 (= e!82234 (= (apply!110 lt!64940 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2628 newMap!16)))))

(declare-fun b!125918 () Bool)

(declare-fun e!82237 () Bool)

(assert (=> b!125918 (= e!82237 e!82244)))

(declare-fun res!60934 () Bool)

(assert (=> b!125918 (=> (not res!60934) (not e!82244))))

(assert (=> b!125918 (= res!60934 (contains!861 lt!64940 (select (arr!2210 (array!4668 (store (arr!2210 (_keys!4492 newMap!16)) (ite c!22713 (index!3209 lt!64214) (index!3206 lt!64214)) (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355)) (size!2473 (_keys!4492 newMap!16)))) #b00000000000000000000000000000000)))))

(assert (=> b!125918 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2473 (array!4668 (store (arr!2210 (_keys!4492 newMap!16)) (ite c!22713 (index!3209 lt!64214) (index!3206 lt!64214)) (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355)) (size!2473 (_keys!4492 newMap!16))))))))

(declare-fun b!125919 () Bool)

(declare-fun e!82242 () ListLongMap!1631)

(assert (=> b!125919 (= e!82233 e!82242)))

(assert (=> b!125919 (= c!23009 (and (not (= (bvand (extraKeys!2548 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2548 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!125920 () Bool)

(declare-fun call!13472 () ListLongMap!1631)

(assert (=> b!125920 (= e!82236 call!13472)))

(declare-fun bm!13471 () Bool)

(assert (=> bm!13471 (= call!13474 (getCurrentListMapNoExtraKeys!130 (array!4668 (store (arr!2210 (_keys!4492 newMap!16)) (ite c!22713 (index!3209 lt!64214) (index!3206 lt!64214)) (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355)) (size!2473 (_keys!4492 newMap!16))) (array!4670 (store (arr!2211 (_values!2746 newMap!16)) (ite c!22713 (index!3209 lt!64214) (index!3206 lt!64214)) (ValueCellFull!1073 (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2474 (_values!2746 newMap!16))) (mask!7009 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16)))))

(declare-fun b!125921 () Bool)

(declare-fun res!60935 () Bool)

(assert (=> b!125921 (=> (not res!60935) (not e!82243))))

(assert (=> b!125921 (= res!60935 e!82237)))

(declare-fun res!60939 () Bool)

(assert (=> b!125921 (=> res!60939 e!82237)))

(assert (=> b!125921 (= res!60939 (not e!82239))))

(declare-fun res!60937 () Bool)

(assert (=> b!125921 (=> (not res!60937) (not e!82239))))

(assert (=> b!125921 (= res!60937 (bvslt #b00000000000000000000000000000000 (size!2473 (array!4668 (store (arr!2210 (_keys!4492 newMap!16)) (ite c!22713 (index!3209 lt!64214) (index!3206 lt!64214)) (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355)) (size!2473 (_keys!4492 newMap!16))))))))

(declare-fun b!125922 () Bool)

(assert (=> b!125922 (= e!82242 call!13472)))

(declare-fun b!125923 () Bool)

(declare-fun Unit!3921 () Unit!3871)

(assert (=> b!125923 (= e!82238 Unit!3921)))

(declare-fun b!125924 () Bool)

(assert (=> b!125924 (= e!82233 (+!163 call!13469 (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 newMap!16))))))

(declare-fun b!125925 () Bool)

(declare-fun res!60941 () Bool)

(assert (=> b!125925 (=> (not res!60941) (not e!82243))))

(assert (=> b!125925 (= res!60941 e!82241)))

(declare-fun c!23006 () Bool)

(assert (=> b!125925 (= c!23006 (not (= (bvand (extraKeys!2548 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!13472 () Bool)

(assert (=> bm!13472 (= call!13472 call!13469)))

(declare-fun b!125926 () Bool)

(declare-fun c!23008 () Bool)

(assert (=> b!125926 (= c!23008 (and (not (= (bvand (extraKeys!2548 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2548 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!125926 (= e!82242 e!82236)))

(assert (= (and d!38071 c!23007) b!125924))

(assert (= (and d!38071 (not c!23007)) b!125919))

(assert (= (and b!125919 c!23009) b!125922))

(assert (= (and b!125919 (not c!23009)) b!125926))

(assert (= (and b!125926 c!23008) b!125920))

(assert (= (and b!125926 (not c!23008)) b!125911))

(assert (= (or b!125920 b!125911) bm!13468))

(assert (= (or b!125922 bm!13468) bm!13467))

(assert (= (or b!125922 b!125920) bm!13472))

(assert (= (or b!125924 bm!13467) bm!13471))

(assert (= (or b!125924 bm!13472) bm!13466))

(assert (= (and d!38071 res!60938) b!125915))

(assert (= (and d!38071 c!23004) b!125910))

(assert (= (and d!38071 (not c!23004)) b!125923))

(assert (= (and d!38071 res!60936) b!125921))

(assert (= (and b!125921 res!60937) b!125914))

(assert (= (and b!125921 (not res!60939)) b!125918))

(assert (= (and b!125918 res!60934) b!125908))

(assert (= (and b!125921 res!60935) b!125925))

(assert (= (and b!125925 c!23006) b!125906))

(assert (= (and b!125925 (not c!23006)) b!125913))

(assert (= (and b!125906 res!60933) b!125917))

(assert (= (or b!125906 b!125913) bm!13470))

(assert (= (and b!125925 res!60941) b!125912))

(assert (= (and b!125912 c!23005) b!125909))

(assert (= (and b!125912 (not c!23005)) b!125907))

(assert (= (and b!125909 res!60940) b!125916))

(assert (= (or b!125909 b!125907) bm!13469))

(declare-fun b_lambda!5531 () Bool)

(assert (=> (not b_lambda!5531) (not b!125908)))

(assert (=> b!125908 t!6006))

(declare-fun b_and!7745 () Bool)

(assert (= b_and!7741 (and (=> t!6006 result!3815) b_and!7745)))

(assert (=> b!125908 t!6008))

(declare-fun b_and!7747 () Bool)

(assert (= b_and!7743 (and (=> t!6008 result!3817) b_and!7747)))

(declare-fun m!146915 () Bool)

(assert (=> b!125916 m!146915))

(declare-fun m!146917 () Bool)

(assert (=> bm!13471 m!146917))

(declare-fun m!146919 () Bool)

(assert (=> b!125917 m!146919))

(declare-fun m!146921 () Bool)

(assert (=> b!125924 m!146921))

(declare-fun m!146923 () Bool)

(assert (=> bm!13470 m!146923))

(assert (=> b!125908 m!146807))

(declare-fun m!146925 () Bool)

(assert (=> b!125908 m!146925))

(assert (=> b!125908 m!146807))

(assert (=> b!125908 m!145277))

(declare-fun m!146927 () Bool)

(assert (=> b!125908 m!146927))

(assert (=> b!125908 m!146927))

(assert (=> b!125908 m!145277))

(declare-fun m!146929 () Bool)

(assert (=> b!125908 m!146929))

(assert (=> b!125918 m!146807))

(assert (=> b!125918 m!146807))

(declare-fun m!146931 () Bool)

(assert (=> b!125918 m!146931))

(declare-fun m!146933 () Bool)

(assert (=> b!125910 m!146933))

(declare-fun m!146935 () Bool)

(assert (=> b!125910 m!146935))

(assert (=> b!125910 m!146917))

(declare-fun m!146937 () Bool)

(assert (=> b!125910 m!146937))

(declare-fun m!146939 () Bool)

(assert (=> b!125910 m!146939))

(declare-fun m!146941 () Bool)

(assert (=> b!125910 m!146941))

(assert (=> b!125910 m!146933))

(declare-fun m!146943 () Bool)

(assert (=> b!125910 m!146943))

(assert (=> b!125910 m!146937))

(declare-fun m!146945 () Bool)

(assert (=> b!125910 m!146945))

(declare-fun m!146947 () Bool)

(assert (=> b!125910 m!146947))

(declare-fun m!146949 () Bool)

(assert (=> b!125910 m!146949))

(declare-fun m!146951 () Bool)

(assert (=> b!125910 m!146951))

(declare-fun m!146953 () Bool)

(assert (=> b!125910 m!146953))

(declare-fun m!146955 () Bool)

(assert (=> b!125910 m!146955))

(declare-fun m!146957 () Bool)

(assert (=> b!125910 m!146957))

(declare-fun m!146959 () Bool)

(assert (=> b!125910 m!146959))

(assert (=> b!125910 m!146955))

(assert (=> b!125910 m!146949))

(declare-fun m!146961 () Bool)

(assert (=> b!125910 m!146961))

(assert (=> b!125910 m!146807))

(assert (=> b!125914 m!146807))

(assert (=> b!125914 m!146807))

(assert (=> b!125914 m!146809))

(declare-fun m!146963 () Bool)

(assert (=> bm!13469 m!146963))

(declare-fun m!146965 () Bool)

(assert (=> bm!13466 m!146965))

(assert (=> d!38071 m!145065))

(assert (=> b!125915 m!146807))

(assert (=> b!125915 m!146807))

(assert (=> b!125915 m!146809))

(assert (=> d!37607 d!38071))

(declare-fun d!38073 () Bool)

(declare-fun e!82246 () Bool)

(assert (=> d!38073 e!82246))

(declare-fun res!60942 () Bool)

(assert (=> d!38073 (=> (not res!60942) (not e!82246))))

(assert (=> d!38073 (= res!60942 (and (bvsge (ite c!22713 (index!3209 lt!64214) (index!3206 lt!64214)) #b00000000000000000000000000000000) (bvslt (ite c!22713 (index!3209 lt!64214) (index!3206 lt!64214)) (size!2473 lt!64482))))))

(declare-fun lt!64961 () Unit!3871)

(assert (=> d!38073 (= lt!64961 (choose!758 lt!64482 lt!64487 (mask!7009 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) (ite c!22713 (index!3209 lt!64214) (index!3206 lt!64214)) (defaultEntry!2763 newMap!16)))))

(assert (=> d!38073 (validMask!0 (mask!7009 newMap!16))))

(assert (=> d!38073 (= (lemmaValidKeyInArrayIsInListMap!115 lt!64482 lt!64487 (mask!7009 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) (ite c!22713 (index!3209 lt!64214) (index!3206 lt!64214)) (defaultEntry!2763 newMap!16)) lt!64961)))

(declare-fun b!125927 () Bool)

(assert (=> b!125927 (= e!82246 (contains!861 (getCurrentListMap!511 lt!64482 lt!64487 (mask!7009 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16)) (select (arr!2210 lt!64482) (ite c!22713 (index!3209 lt!64214) (index!3206 lt!64214)))))))

(assert (= (and d!38073 res!60942) b!125927))

(declare-fun m!146967 () Bool)

(assert (=> d!38073 m!146967))

(assert (=> d!38073 m!145065))

(assert (=> b!125927 m!145481))

(declare-fun m!146969 () Bool)

(assert (=> b!125927 m!146969))

(assert (=> b!125927 m!145481))

(assert (=> b!125927 m!146969))

(declare-fun m!146971 () Bool)

(assert (=> b!125927 m!146971))

(assert (=> d!37607 d!38073))

(declare-fun d!38075 () Bool)

(declare-fun e!82247 () Bool)

(assert (=> d!38075 e!82247))

(declare-fun res!60943 () Bool)

(assert (=> d!38075 (=> res!60943 e!82247)))

(declare-fun lt!64962 () Bool)

(assert (=> d!38075 (= res!60943 (not lt!64962))))

(declare-fun lt!64965 () Bool)

(assert (=> d!38075 (= lt!64962 lt!64965)))

(declare-fun lt!64964 () Unit!3871)

(declare-fun e!82248 () Unit!3871)

(assert (=> d!38075 (= lt!64964 e!82248)))

(declare-fun c!23010 () Bool)

(assert (=> d!38075 (= c!23010 lt!64965)))

(assert (=> d!38075 (= lt!64965 (containsKey!170 (toList!831 (map!1377 (_2!1272 lt!64480))) (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355)))))

(assert (=> d!38075 (= (contains!861 (map!1377 (_2!1272 lt!64480)) (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355)) lt!64962)))

(declare-fun b!125928 () Bool)

(declare-fun lt!64963 () Unit!3871)

(assert (=> b!125928 (= e!82248 lt!64963)))

(assert (=> b!125928 (= lt!64963 (lemmaContainsKeyImpliesGetValueByKeyDefined!118 (toList!831 (map!1377 (_2!1272 lt!64480))) (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355)))))

(assert (=> b!125928 (isDefined!119 (getValueByKey!167 (toList!831 (map!1377 (_2!1272 lt!64480))) (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355)))))

(declare-fun b!125929 () Bool)

(declare-fun Unit!3922 () Unit!3871)

(assert (=> b!125929 (= e!82248 Unit!3922)))

(declare-fun b!125930 () Bool)

(assert (=> b!125930 (= e!82247 (isDefined!119 (getValueByKey!167 (toList!831 (map!1377 (_2!1272 lt!64480))) (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355))))))

(assert (= (and d!38075 c!23010) b!125928))

(assert (= (and d!38075 (not c!23010)) b!125929))

(assert (= (and d!38075 (not res!60943)) b!125930))

(assert (=> d!38075 m!144797))

(declare-fun m!146973 () Bool)

(assert (=> d!38075 m!146973))

(assert (=> b!125928 m!144797))

(declare-fun m!146975 () Bool)

(assert (=> b!125928 m!146975))

(assert (=> b!125928 m!144797))

(declare-fun m!146977 () Bool)

(assert (=> b!125928 m!146977))

(assert (=> b!125928 m!146977))

(declare-fun m!146979 () Bool)

(assert (=> b!125928 m!146979))

(assert (=> b!125930 m!144797))

(assert (=> b!125930 m!146977))

(assert (=> b!125930 m!146977))

(assert (=> b!125930 m!146979))

(assert (=> b!125178 d!38075))

(assert (=> b!125178 d!37911))

(assert (=> b!125143 d!37797))

(assert (=> b!125143 d!37799))

(declare-fun d!38077 () Bool)

(assert (=> d!38077 (= (apply!110 lt!64351 #b1000000000000000000000000000000000000000000000000000000000000000) (get!1449 (getValueByKey!167 (toList!831 lt!64351) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!5230 () Bool)

(assert (= bs!5230 d!38077))

(assert (=> bs!5230 m!145979))

(assert (=> bs!5230 m!145979))

(declare-fun m!146981 () Bool)

(assert (=> bs!5230 m!146981))

(assert (=> b!125094 d!38077))

(assert (=> b!125129 d!37633))

(assert (=> d!37531 d!37527))

(declare-fun b!125947 () Bool)

(declare-fun e!82260 () Bool)

(declare-fun e!82257 () Bool)

(assert (=> b!125947 (= e!82260 e!82257)))

(declare-fun c!23016 () Bool)

(declare-fun lt!64968 () SeekEntryResult!263)

(assert (=> b!125947 (= c!23016 ((_ is MissingVacant!263) lt!64968))))

(declare-fun b!125948 () Bool)

(assert (=> b!125948 (= e!82257 ((_ is Undefined!263) lt!64968))))

(declare-fun b!125949 () Bool)

(declare-fun res!60953 () Bool)

(declare-fun e!82258 () Bool)

(assert (=> b!125949 (=> (not res!60953) (not e!82258))))

(assert (=> b!125949 (= res!60953 (= (select (arr!2210 (_keys!4492 newMap!16)) (index!3209 lt!64968)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun call!13480 () Bool)

(declare-fun bm!13477 () Bool)

(assert (=> bm!13477 (= call!13480 (arrayContainsKey!0 (_keys!4492 newMap!16) (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun b!125950 () Bool)

(assert (=> b!125950 (= e!82258 (not call!13480))))

(declare-fun b!125951 () Bool)

(declare-fun res!60952 () Bool)

(assert (=> b!125951 (= res!60952 (= (select (arr!2210 (_keys!4492 newMap!16)) (index!3206 lt!64968)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!82259 () Bool)

(assert (=> b!125951 (=> (not res!60952) (not e!82259))))

(declare-fun bm!13478 () Bool)

(declare-fun call!13481 () Bool)

(declare-fun c!23015 () Bool)

(assert (=> bm!13478 (= call!13481 (inRange!0 (ite c!23015 (index!3206 lt!64968) (index!3209 lt!64968)) (mask!7009 newMap!16)))))

(declare-fun d!38079 () Bool)

(assert (=> d!38079 e!82260))

(assert (=> d!38079 (= c!23015 ((_ is MissingZero!263) lt!64968))))

(assert (=> d!38079 (= lt!64968 (seekEntryOrOpen!0 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355) (_keys!4492 newMap!16) (mask!7009 newMap!16)))))

(assert (=> d!38079 true))

(declare-fun _$34!946 () Unit!3871)

(assert (=> d!38079 (= (choose!754 (_keys!4492 newMap!16) (_values!2746 newMap!16) (mask!7009 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355) (defaultEntry!2763 newMap!16)) _$34!946)))

(declare-fun b!125952 () Bool)

(assert (=> b!125952 (= e!82259 (not call!13480))))

(declare-fun b!125953 () Bool)

(declare-fun res!60955 () Bool)

(assert (=> b!125953 (=> (not res!60955) (not e!82258))))

(assert (=> b!125953 (= res!60955 call!13481)))

(assert (=> b!125953 (= e!82257 e!82258)))

(declare-fun b!125954 () Bool)

(assert (=> b!125954 (= e!82260 e!82259)))

(declare-fun res!60954 () Bool)

(assert (=> b!125954 (= res!60954 call!13481)))

(assert (=> b!125954 (=> (not res!60954) (not e!82259))))

(assert (= (and d!38079 c!23015) b!125954))

(assert (= (and d!38079 (not c!23015)) b!125947))

(assert (= (and b!125954 res!60954) b!125951))

(assert (= (and b!125951 res!60952) b!125952))

(assert (= (and b!125947 c!23016) b!125953))

(assert (= (and b!125947 (not c!23016)) b!125948))

(assert (= (and b!125953 res!60955) b!125949))

(assert (= (and b!125949 res!60953) b!125950))

(assert (= (or b!125954 b!125953) bm!13478))

(assert (= (or b!125952 b!125950) bm!13477))

(declare-fun m!146983 () Bool)

(assert (=> b!125949 m!146983))

(declare-fun m!146985 () Bool)

(assert (=> bm!13478 m!146985))

(assert (=> bm!13477 m!144797))

(assert (=> bm!13477 m!145003))

(assert (=> d!38079 m!144797))

(assert (=> d!38079 m!144977))

(declare-fun m!146987 () Bool)

(assert (=> b!125951 m!146987))

(assert (=> d!37531 d!38079))

(assert (=> d!37531 d!37771))

(declare-fun d!38081 () Bool)

(declare-fun e!82261 () Bool)

(assert (=> d!38081 e!82261))

(declare-fun res!60956 () Bool)

(assert (=> d!38081 (=> (not res!60956) (not e!82261))))

(declare-fun lt!64970 () ListLongMap!1631)

(assert (=> d!38081 (= res!60956 (contains!861 lt!64970 (_1!1271 (tuple2!2521 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!64971 () List!1676)

(assert (=> d!38081 (= lt!64970 (ListLongMap!1632 lt!64971))))

(declare-fun lt!64972 () Unit!3871)

(declare-fun lt!64969 () Unit!3871)

(assert (=> d!38081 (= lt!64972 lt!64969)))

(assert (=> d!38081 (= (getValueByKey!167 lt!64971 (_1!1271 (tuple2!2521 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!172 (_2!1271 (tuple2!2521 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!38081 (= lt!64969 (lemmaContainsTupThenGetReturnValue!82 lt!64971 (_1!1271 (tuple2!2521 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1271 (tuple2!2521 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!38081 (= lt!64971 (insertStrictlySorted!85 (toList!831 (getCurrentListMap!511 (_keys!4492 newMap!16) (_values!2746 newMap!16) (mask!7009 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16))) (_1!1271 (tuple2!2521 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1271 (tuple2!2521 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!38081 (= (+!163 (getCurrentListMap!511 (_keys!4492 newMap!16) (_values!2746 newMap!16) (mask!7009 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16)) (tuple2!2521 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!64970)))

(declare-fun b!125955 () Bool)

(declare-fun res!60957 () Bool)

(assert (=> b!125955 (=> (not res!60957) (not e!82261))))

(assert (=> b!125955 (= res!60957 (= (getValueByKey!167 (toList!831 lt!64970) (_1!1271 (tuple2!2521 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!172 (_2!1271 (tuple2!2521 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!125956 () Bool)

(assert (=> b!125956 (= e!82261 (contains!862 (toList!831 lt!64970) (tuple2!2521 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!38081 res!60956) b!125955))

(assert (= (and b!125955 res!60957) b!125956))

(declare-fun m!146989 () Bool)

(assert (=> d!38081 m!146989))

(declare-fun m!146991 () Bool)

(assert (=> d!38081 m!146991))

(declare-fun m!146993 () Bool)

(assert (=> d!38081 m!146993))

(declare-fun m!146995 () Bool)

(assert (=> d!38081 m!146995))

(declare-fun m!146997 () Bool)

(assert (=> b!125955 m!146997))

(declare-fun m!146999 () Bool)

(assert (=> b!125956 m!146999))

(assert (=> d!37625 d!38081))

(declare-fun call!13487 () ListLongMap!1631)

(declare-fun c!23020 () Bool)

(declare-fun call!13488 () ListLongMap!1631)

(declare-fun call!13484 () ListLongMap!1631)

(declare-fun bm!13479 () Bool)

(declare-fun c!23022 () Bool)

(declare-fun call!13482 () ListLongMap!1631)

(assert (=> bm!13479 (= call!13482 (+!163 (ite c!23020 call!13487 (ite c!23022 call!13488 call!13484)) (ite (or c!23020 c!23022) (tuple2!2521 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 newMap!16)))))))

(declare-fun b!125957 () Bool)

(declare-fun e!82270 () Bool)

(declare-fun e!82263 () Bool)

(assert (=> b!125957 (= e!82270 e!82263)))

(declare-fun res!60958 () Bool)

(declare-fun call!13483 () Bool)

(assert (=> b!125957 (= res!60958 call!13483)))

(assert (=> b!125957 (=> (not res!60958) (not e!82263))))

(declare-fun bm!13480 () Bool)

(assert (=> bm!13480 (= call!13488 call!13487)))

(declare-fun b!125959 () Bool)

(declare-fun e!82273 () Bool)

(declare-fun lt!64974 () ListLongMap!1631)

(assert (=> b!125959 (= e!82273 (= (apply!110 lt!64974 (select (arr!2210 (_keys!4492 newMap!16)) #b00000000000000000000000000000000)) (get!1446 (select (arr!2211 (_values!2746 newMap!16)) #b00000000000000000000000000000000) (dynLambda!415 (defaultEntry!2763 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!125959 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2474 (_values!2746 newMap!16))))))

(assert (=> b!125959 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2473 (_keys!4492 newMap!16))))))

(declare-fun bm!13481 () Bool)

(assert (=> bm!13481 (= call!13484 call!13488)))

(declare-fun b!125960 () Bool)

(declare-fun e!82264 () Bool)

(declare-fun e!82269 () Bool)

(assert (=> b!125960 (= e!82264 e!82269)))

(declare-fun res!60965 () Bool)

(declare-fun call!13486 () Bool)

(assert (=> b!125960 (= res!60965 call!13486)))

(assert (=> b!125960 (=> (not res!60965) (not e!82269))))

(declare-fun b!125961 () Bool)

(declare-fun e!82267 () Unit!3871)

(declare-fun lt!64985 () Unit!3871)

(assert (=> b!125961 (= e!82267 lt!64985)))

(declare-fun lt!64988 () ListLongMap!1631)

(assert (=> b!125961 (= lt!64988 (getCurrentListMapNoExtraKeys!130 (_keys!4492 newMap!16) (_values!2746 newMap!16) (mask!7009 newMap!16) lt!64209 (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2628 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16)))))

(declare-fun lt!64980 () (_ BitVec 64))

(assert (=> b!125961 (= lt!64980 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!64975 () (_ BitVec 64))

(assert (=> b!125961 (= lt!64975 (select (arr!2210 (_keys!4492 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!64978 () Unit!3871)

(assert (=> b!125961 (= lt!64978 (addStillContains!86 lt!64988 lt!64980 (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) lt!64975))))

(assert (=> b!125961 (contains!861 (+!163 lt!64988 (tuple2!2521 lt!64980 (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!64975)))

(declare-fun lt!64973 () Unit!3871)

(assert (=> b!125961 (= lt!64973 lt!64978)))

(declare-fun lt!64982 () ListLongMap!1631)

(assert (=> b!125961 (= lt!64982 (getCurrentListMapNoExtraKeys!130 (_keys!4492 newMap!16) (_values!2746 newMap!16) (mask!7009 newMap!16) lt!64209 (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2628 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16)))))

(declare-fun lt!64991 () (_ BitVec 64))

(assert (=> b!125961 (= lt!64991 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!64977 () (_ BitVec 64))

(assert (=> b!125961 (= lt!64977 (select (arr!2210 (_keys!4492 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!64979 () Unit!3871)

(assert (=> b!125961 (= lt!64979 (addApplyDifferent!86 lt!64982 lt!64991 (minValue!2628 newMap!16) lt!64977))))

(assert (=> b!125961 (= (apply!110 (+!163 lt!64982 (tuple2!2521 lt!64991 (minValue!2628 newMap!16))) lt!64977) (apply!110 lt!64982 lt!64977))))

(declare-fun lt!64992 () Unit!3871)

(assert (=> b!125961 (= lt!64992 lt!64979)))

(declare-fun lt!64984 () ListLongMap!1631)

(assert (=> b!125961 (= lt!64984 (getCurrentListMapNoExtraKeys!130 (_keys!4492 newMap!16) (_values!2746 newMap!16) (mask!7009 newMap!16) lt!64209 (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2628 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16)))))

(declare-fun lt!64990 () (_ BitVec 64))

(assert (=> b!125961 (= lt!64990 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!64987 () (_ BitVec 64))

(assert (=> b!125961 (= lt!64987 (select (arr!2210 (_keys!4492 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!64986 () Unit!3871)

(assert (=> b!125961 (= lt!64986 (addApplyDifferent!86 lt!64984 lt!64990 (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) lt!64987))))

(assert (=> b!125961 (= (apply!110 (+!163 lt!64984 (tuple2!2521 lt!64990 (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!64987) (apply!110 lt!64984 lt!64987))))

(declare-fun lt!64981 () Unit!3871)

(assert (=> b!125961 (= lt!64981 lt!64986)))

(declare-fun lt!64976 () ListLongMap!1631)

(assert (=> b!125961 (= lt!64976 (getCurrentListMapNoExtraKeys!130 (_keys!4492 newMap!16) (_values!2746 newMap!16) (mask!7009 newMap!16) lt!64209 (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2628 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16)))))

(declare-fun lt!64983 () (_ BitVec 64))

(assert (=> b!125961 (= lt!64983 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!64994 () (_ BitVec 64))

(assert (=> b!125961 (= lt!64994 (select (arr!2210 (_keys!4492 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!125961 (= lt!64985 (addApplyDifferent!86 lt!64976 lt!64983 (minValue!2628 newMap!16) lt!64994))))

(assert (=> b!125961 (= (apply!110 (+!163 lt!64976 (tuple2!2521 lt!64983 (minValue!2628 newMap!16))) lt!64994) (apply!110 lt!64976 lt!64994))))

(declare-fun b!125962 () Bool)

(declare-fun e!82265 () ListLongMap!1631)

(assert (=> b!125962 (= e!82265 call!13484)))

(declare-fun b!125963 () Bool)

(declare-fun e!82272 () Bool)

(assert (=> b!125963 (= e!82272 e!82264)))

(declare-fun c!23018 () Bool)

(assert (=> b!125963 (= c!23018 (not (= (bvand lt!64209 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!125964 () Bool)

(assert (=> b!125964 (= e!82270 (not call!13483))))

(declare-fun bm!13482 () Bool)

(assert (=> bm!13482 (= call!13486 (contains!861 lt!64974 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!125965 () Bool)

(declare-fun e!82268 () Bool)

(assert (=> b!125965 (= e!82268 (validKeyInArray!0 (select (arr!2210 (_keys!4492 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun d!38083 () Bool)

(assert (=> d!38083 e!82272))

(declare-fun res!60961 () Bool)

(assert (=> d!38083 (=> (not res!60961) (not e!82272))))

(assert (=> d!38083 (= res!60961 (or (bvsge #b00000000000000000000000000000000 (size!2473 (_keys!4492 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2473 (_keys!4492 newMap!16))))))))

(declare-fun lt!64989 () ListLongMap!1631)

(assert (=> d!38083 (= lt!64974 lt!64989)))

(declare-fun lt!64993 () Unit!3871)

(assert (=> d!38083 (= lt!64993 e!82267)))

(declare-fun c!23017 () Bool)

(declare-fun e!82274 () Bool)

(assert (=> d!38083 (= c!23017 e!82274)))

(declare-fun res!60963 () Bool)

(assert (=> d!38083 (=> (not res!60963) (not e!82274))))

(assert (=> d!38083 (= res!60963 (bvslt #b00000000000000000000000000000000 (size!2473 (_keys!4492 newMap!16))))))

(declare-fun e!82262 () ListLongMap!1631)

(assert (=> d!38083 (= lt!64989 e!82262)))

(assert (=> d!38083 (= c!23020 (and (not (= (bvand lt!64209 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand lt!64209 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!38083 (validMask!0 (mask!7009 newMap!16))))

(assert (=> d!38083 (= (getCurrentListMap!511 (_keys!4492 newMap!16) (_values!2746 newMap!16) (mask!7009 newMap!16) lt!64209 (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2628 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16)) lt!64974)))

(declare-fun b!125958 () Bool)

(assert (=> b!125958 (= e!82264 (not call!13486))))

(declare-fun bm!13483 () Bool)

(assert (=> bm!13483 (= call!13483 (contains!861 lt!64974 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!125966 () Bool)

(assert (=> b!125966 (= e!82274 (validKeyInArray!0 (select (arr!2210 (_keys!4492 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!125967 () Bool)

(assert (=> b!125967 (= e!82269 (= (apply!110 lt!64974 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2628 newMap!16)))))

(declare-fun b!125968 () Bool)

(assert (=> b!125968 (= e!82263 (= (apply!110 lt!64974 #b0000000000000000000000000000000000000000000000000000000000000000) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!125969 () Bool)

(declare-fun e!82266 () Bool)

(assert (=> b!125969 (= e!82266 e!82273)))

(declare-fun res!60959 () Bool)

(assert (=> b!125969 (=> (not res!60959) (not e!82273))))

(assert (=> b!125969 (= res!60959 (contains!861 lt!64974 (select (arr!2210 (_keys!4492 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!125969 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2473 (_keys!4492 newMap!16))))))

(declare-fun b!125970 () Bool)

(declare-fun e!82271 () ListLongMap!1631)

(assert (=> b!125970 (= e!82262 e!82271)))

(assert (=> b!125970 (= c!23022 (and (not (= (bvand lt!64209 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand lt!64209 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!125971 () Bool)

(declare-fun call!13485 () ListLongMap!1631)

(assert (=> b!125971 (= e!82265 call!13485)))

(declare-fun bm!13484 () Bool)

(assert (=> bm!13484 (= call!13487 (getCurrentListMapNoExtraKeys!130 (_keys!4492 newMap!16) (_values!2746 newMap!16) (mask!7009 newMap!16) lt!64209 (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2628 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16)))))

(declare-fun b!125972 () Bool)

(declare-fun res!60960 () Bool)

(assert (=> b!125972 (=> (not res!60960) (not e!82272))))

(assert (=> b!125972 (= res!60960 e!82266)))

(declare-fun res!60964 () Bool)

(assert (=> b!125972 (=> res!60964 e!82266)))

(assert (=> b!125972 (= res!60964 (not e!82268))))

(declare-fun res!60962 () Bool)

(assert (=> b!125972 (=> (not res!60962) (not e!82268))))

(assert (=> b!125972 (= res!60962 (bvslt #b00000000000000000000000000000000 (size!2473 (_keys!4492 newMap!16))))))

(declare-fun b!125973 () Bool)

(assert (=> b!125973 (= e!82271 call!13485)))

(declare-fun b!125974 () Bool)

(declare-fun Unit!3923 () Unit!3871)

(assert (=> b!125974 (= e!82267 Unit!3923)))

(declare-fun b!125975 () Bool)

(assert (=> b!125975 (= e!82262 (+!163 call!13482 (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 newMap!16))))))

(declare-fun b!125976 () Bool)

(declare-fun res!60966 () Bool)

(assert (=> b!125976 (=> (not res!60966) (not e!82272))))

(assert (=> b!125976 (= res!60966 e!82270)))

(declare-fun c!23019 () Bool)

(assert (=> b!125976 (= c!23019 (not (= (bvand lt!64209 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!13485 () Bool)

(assert (=> bm!13485 (= call!13485 call!13482)))

(declare-fun b!125977 () Bool)

(declare-fun c!23021 () Bool)

(assert (=> b!125977 (= c!23021 (and (not (= (bvand lt!64209 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand lt!64209 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!125977 (= e!82271 e!82265)))

(assert (= (and d!38083 c!23020) b!125975))

(assert (= (and d!38083 (not c!23020)) b!125970))

(assert (= (and b!125970 c!23022) b!125973))

(assert (= (and b!125970 (not c!23022)) b!125977))

(assert (= (and b!125977 c!23021) b!125971))

(assert (= (and b!125977 (not c!23021)) b!125962))

(assert (= (or b!125971 b!125962) bm!13481))

(assert (= (or b!125973 bm!13481) bm!13480))

(assert (= (or b!125973 b!125971) bm!13485))

(assert (= (or b!125975 bm!13480) bm!13484))

(assert (= (or b!125975 bm!13485) bm!13479))

(assert (= (and d!38083 res!60963) b!125966))

(assert (= (and d!38083 c!23017) b!125961))

(assert (= (and d!38083 (not c!23017)) b!125974))

(assert (= (and d!38083 res!60961) b!125972))

(assert (= (and b!125972 res!60962) b!125965))

(assert (= (and b!125972 (not res!60964)) b!125969))

(assert (= (and b!125969 res!60959) b!125959))

(assert (= (and b!125972 res!60960) b!125976))

(assert (= (and b!125976 c!23019) b!125957))

(assert (= (and b!125976 (not c!23019)) b!125964))

(assert (= (and b!125957 res!60958) b!125968))

(assert (= (or b!125957 b!125964) bm!13483))

(assert (= (and b!125976 res!60966) b!125963))

(assert (= (and b!125963 c!23018) b!125960))

(assert (= (and b!125963 (not c!23018)) b!125958))

(assert (= (and b!125960 res!60965) b!125967))

(assert (= (or b!125960 b!125958) bm!13482))

(declare-fun b_lambda!5533 () Bool)

(assert (=> (not b_lambda!5533) (not b!125959)))

(assert (=> b!125959 t!6006))

(declare-fun b_and!7749 () Bool)

(assert (= b_and!7745 (and (=> t!6006 result!3815) b_and!7749)))

(assert (=> b!125959 t!6008))

(declare-fun b_and!7751 () Bool)

(assert (= b_and!7747 (and (=> t!6008 result!3817) b_and!7751)))

(declare-fun m!147001 () Bool)

(assert (=> b!125967 m!147001))

(assert (=> bm!13484 m!144795))

(declare-fun m!147003 () Bool)

(assert (=> bm!13484 m!147003))

(declare-fun m!147005 () Bool)

(assert (=> b!125968 m!147005))

(declare-fun m!147007 () Bool)

(assert (=> b!125975 m!147007))

(declare-fun m!147009 () Bool)

(assert (=> bm!13483 m!147009))

(assert (=> b!125959 m!145113))

(declare-fun m!147011 () Bool)

(assert (=> b!125959 m!147011))

(assert (=> b!125959 m!145113))

(assert (=> b!125959 m!145277))

(assert (=> b!125959 m!145331))

(assert (=> b!125959 m!145331))

(assert (=> b!125959 m!145277))

(assert (=> b!125959 m!145333))

(assert (=> b!125969 m!145113))

(assert (=> b!125969 m!145113))

(declare-fun m!147013 () Bool)

(assert (=> b!125969 m!147013))

(declare-fun m!147015 () Bool)

(assert (=> b!125961 m!147015))

(declare-fun m!147017 () Bool)

(assert (=> b!125961 m!147017))

(assert (=> b!125961 m!144795))

(assert (=> b!125961 m!147003))

(declare-fun m!147019 () Bool)

(assert (=> b!125961 m!147019))

(declare-fun m!147021 () Bool)

(assert (=> b!125961 m!147021))

(declare-fun m!147023 () Bool)

(assert (=> b!125961 m!147023))

(assert (=> b!125961 m!147015))

(declare-fun m!147025 () Bool)

(assert (=> b!125961 m!147025))

(assert (=> b!125961 m!147019))

(declare-fun m!147027 () Bool)

(assert (=> b!125961 m!147027))

(declare-fun m!147029 () Bool)

(assert (=> b!125961 m!147029))

(declare-fun m!147031 () Bool)

(assert (=> b!125961 m!147031))

(declare-fun m!147033 () Bool)

(assert (=> b!125961 m!147033))

(declare-fun m!147035 () Bool)

(assert (=> b!125961 m!147035))

(declare-fun m!147037 () Bool)

(assert (=> b!125961 m!147037))

(declare-fun m!147039 () Bool)

(assert (=> b!125961 m!147039))

(assert (=> b!125961 m!144795))

(declare-fun m!147041 () Bool)

(assert (=> b!125961 m!147041))

(assert (=> b!125961 m!147037))

(assert (=> b!125961 m!147031))

(assert (=> b!125961 m!144795))

(declare-fun m!147043 () Bool)

(assert (=> b!125961 m!147043))

(assert (=> b!125961 m!145113))

(assert (=> b!125965 m!145113))

(assert (=> b!125965 m!145113))

(assert (=> b!125965 m!145115))

(declare-fun m!147045 () Bool)

(assert (=> bm!13482 m!147045))

(declare-fun m!147047 () Bool)

(assert (=> bm!13479 m!147047))

(assert (=> d!38083 m!145065))

(assert (=> b!125966 m!145113))

(assert (=> b!125966 m!145113))

(assert (=> b!125966 m!145115))

(assert (=> d!37625 d!38083))

(declare-fun d!38085 () Bool)

(assert (=> d!38085 (= (+!163 (getCurrentListMap!511 (_keys!4492 newMap!16) (_values!2746 newMap!16) (mask!7009 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16)) (tuple2!2521 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (getCurrentListMap!511 (_keys!4492 newMap!16) (_values!2746 newMap!16) (mask!7009 newMap!16) lt!64209 (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2628 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16)))))

(assert (=> d!38085 true))

(declare-fun _$7!104 () Unit!3871)

(assert (=> d!38085 (= (choose!761 (_keys!4492 newMap!16) (_values!2746 newMap!16) (mask!7009 newMap!16) (extraKeys!2548 newMap!16) lt!64209 (zeroValue!2628 newMap!16) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2628 newMap!16) (defaultEntry!2763 newMap!16)) _$7!104)))

(declare-fun bs!5231 () Bool)

(assert (= bs!5231 d!38085))

(assert (=> bs!5231 m!144893))

(assert (=> bs!5231 m!144893))

(assert (=> bs!5231 m!145551))

(assert (=> bs!5231 m!144795))

(assert (=> bs!5231 m!145549))

(assert (=> d!37625 d!38085))

(assert (=> d!37625 d!37587))

(assert (=> d!37625 d!37771))

(assert (=> b!125203 d!37833))

(assert (=> b!125203 d!37835))

(declare-fun d!38087 () Bool)

(assert (=> d!38087 (= (get!1449 (getValueByKey!167 (toList!831 lt!64118) lt!64121)) (v!3114 (getValueByKey!167 (toList!831 lt!64118) lt!64121)))))

(assert (=> d!37575 d!38087))

(declare-fun b!125979 () Bool)

(declare-fun e!82275 () Option!173)

(declare-fun e!82276 () Option!173)

(assert (=> b!125979 (= e!82275 e!82276)))

(declare-fun c!23024 () Bool)

(assert (=> b!125979 (= c!23024 (and ((_ is Cons!1672) (toList!831 lt!64118)) (not (= (_1!1271 (h!2273 (toList!831 lt!64118))) lt!64121))))))

(declare-fun b!125980 () Bool)

(assert (=> b!125980 (= e!82276 (getValueByKey!167 (t!5995 (toList!831 lt!64118)) lt!64121))))

(declare-fun d!38089 () Bool)

(declare-fun c!23023 () Bool)

(assert (=> d!38089 (= c!23023 (and ((_ is Cons!1672) (toList!831 lt!64118)) (= (_1!1271 (h!2273 (toList!831 lt!64118))) lt!64121)))))

(assert (=> d!38089 (= (getValueByKey!167 (toList!831 lt!64118) lt!64121) e!82275)))

(declare-fun b!125981 () Bool)

(assert (=> b!125981 (= e!82276 None!171)))

(declare-fun b!125978 () Bool)

(assert (=> b!125978 (= e!82275 (Some!172 (_2!1271 (h!2273 (toList!831 lt!64118)))))))

(assert (= (and d!38089 c!23023) b!125978))

(assert (= (and d!38089 (not c!23023)) b!125979))

(assert (= (and b!125979 c!23024) b!125980))

(assert (= (and b!125979 (not c!23024)) b!125981))

(declare-fun m!147049 () Bool)

(assert (=> b!125980 m!147049))

(assert (=> d!37575 d!38089))

(declare-fun lt!64995 () Bool)

(declare-fun d!38091 () Bool)

(assert (=> d!38091 (= lt!64995 (select (content!124 (toList!831 lt!64312)) (tuple2!2521 lt!64125 (minValue!2628 (v!3108 (underlying!436 thiss!992))))))))

(declare-fun e!82277 () Bool)

(assert (=> d!38091 (= lt!64995 e!82277)))

(declare-fun res!60967 () Bool)

(assert (=> d!38091 (=> (not res!60967) (not e!82277))))

(assert (=> d!38091 (= res!60967 ((_ is Cons!1672) (toList!831 lt!64312)))))

(assert (=> d!38091 (= (contains!862 (toList!831 lt!64312) (tuple2!2521 lt!64125 (minValue!2628 (v!3108 (underlying!436 thiss!992))))) lt!64995)))

(declare-fun b!125982 () Bool)

(declare-fun e!82278 () Bool)

(assert (=> b!125982 (= e!82277 e!82278)))

(declare-fun res!60968 () Bool)

(assert (=> b!125982 (=> res!60968 e!82278)))

(assert (=> b!125982 (= res!60968 (= (h!2273 (toList!831 lt!64312)) (tuple2!2521 lt!64125 (minValue!2628 (v!3108 (underlying!436 thiss!992))))))))

(declare-fun b!125983 () Bool)

(assert (=> b!125983 (= e!82278 (contains!862 (t!5995 (toList!831 lt!64312)) (tuple2!2521 lt!64125 (minValue!2628 (v!3108 (underlying!436 thiss!992))))))))

(assert (= (and d!38091 res!60967) b!125982))

(assert (= (and b!125982 (not res!60968)) b!125983))

(declare-fun m!147051 () Bool)

(assert (=> d!38091 m!147051))

(declare-fun m!147053 () Bool)

(assert (=> d!38091 m!147053))

(declare-fun m!147055 () Bool)

(assert (=> b!125983 m!147055))

(assert (=> b!125027 d!38091))

(declare-fun d!38093 () Bool)

(assert (=> d!38093 (= (+!163 (getCurrentListMap!511 (_keys!4492 newMap!16) (_values!2746 newMap!16) (mask!7009 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16)) (tuple2!2521 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (getCurrentListMap!511 (_keys!4492 newMap!16) (array!4670 (store (arr!2211 (_values!2746 newMap!16)) (index!3207 lt!64214) (ValueCellFull!1073 (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2474 (_values!2746 newMap!16))) (mask!7009 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16)))))

(assert (=> d!38093 true))

(declare-fun _$5!122 () Unit!3871)

(assert (=> d!38093 (= (choose!759 (_keys!4492 newMap!16) (_values!2746 newMap!16) (mask!7009 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) (index!3207 lt!64214) (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2763 newMap!16)) _$5!122)))

(declare-fun bs!5232 () Bool)

(assert (= bs!5232 d!38093))

(assert (=> bs!5232 m!144893))

(assert (=> bs!5232 m!144893))

(assert (=> bs!5232 m!145493))

(assert (=> bs!5232 m!144983))

(assert (=> bs!5232 m!145525))

(assert (=> d!37613 d!38093))

(assert (=> d!37613 d!37771))

(declare-fun d!38095 () Bool)

(declare-fun e!82279 () Bool)

(assert (=> d!38095 e!82279))

(declare-fun res!60969 () Bool)

(assert (=> d!38095 (=> (not res!60969) (not e!82279))))

(declare-fun lt!64997 () ListLongMap!1631)

(assert (=> d!38095 (= res!60969 (contains!861 lt!64997 (_1!1271 (tuple2!2521 lt!64285 lt!64288))))))

(declare-fun lt!64998 () List!1676)

(assert (=> d!38095 (= lt!64997 (ListLongMap!1632 lt!64998))))

(declare-fun lt!64999 () Unit!3871)

(declare-fun lt!64996 () Unit!3871)

(assert (=> d!38095 (= lt!64999 lt!64996)))

(assert (=> d!38095 (= (getValueByKey!167 lt!64998 (_1!1271 (tuple2!2521 lt!64285 lt!64288))) (Some!172 (_2!1271 (tuple2!2521 lt!64285 lt!64288))))))

(assert (=> d!38095 (= lt!64996 (lemmaContainsTupThenGetReturnValue!82 lt!64998 (_1!1271 (tuple2!2521 lt!64285 lt!64288)) (_2!1271 (tuple2!2521 lt!64285 lt!64288))))))

(assert (=> d!38095 (= lt!64998 (insertStrictlySorted!85 (toList!831 lt!64284) (_1!1271 (tuple2!2521 lt!64285 lt!64288)) (_2!1271 (tuple2!2521 lt!64285 lt!64288))))))

(assert (=> d!38095 (= (+!163 lt!64284 (tuple2!2521 lt!64285 lt!64288)) lt!64997)))

(declare-fun b!125984 () Bool)

(declare-fun res!60970 () Bool)

(assert (=> b!125984 (=> (not res!60970) (not e!82279))))

(assert (=> b!125984 (= res!60970 (= (getValueByKey!167 (toList!831 lt!64997) (_1!1271 (tuple2!2521 lt!64285 lt!64288))) (Some!172 (_2!1271 (tuple2!2521 lt!64285 lt!64288)))))))

(declare-fun b!125985 () Bool)

(assert (=> b!125985 (= e!82279 (contains!862 (toList!831 lt!64997) (tuple2!2521 lt!64285 lt!64288)))))

(assert (= (and d!38095 res!60969) b!125984))

(assert (= (and b!125984 res!60970) b!125985))

(declare-fun m!147057 () Bool)

(assert (=> d!38095 m!147057))

(declare-fun m!147059 () Bool)

(assert (=> d!38095 m!147059))

(declare-fun m!147061 () Bool)

(assert (=> d!38095 m!147061))

(declare-fun m!147063 () Bool)

(assert (=> d!38095 m!147063))

(declare-fun m!147065 () Bool)

(assert (=> b!125984 m!147065))

(declare-fun m!147067 () Bool)

(assert (=> b!125985 m!147067))

(assert (=> b!125003 d!38095))

(declare-fun d!38097 () Bool)

(declare-fun e!82280 () Bool)

(assert (=> d!38097 e!82280))

(declare-fun res!60971 () Bool)

(assert (=> d!38097 (=> res!60971 e!82280)))

(declare-fun lt!65000 () Bool)

(assert (=> d!38097 (= res!60971 (not lt!65000))))

(declare-fun lt!65003 () Bool)

(assert (=> d!38097 (= lt!65000 lt!65003)))

(declare-fun lt!65002 () Unit!3871)

(declare-fun e!82281 () Unit!3871)

(assert (=> d!38097 (= lt!65002 e!82281)))

(declare-fun c!23025 () Bool)

(assert (=> d!38097 (= c!23025 lt!65003)))

(assert (=> d!38097 (= lt!65003 (containsKey!170 (toList!831 (+!163 lt!64284 (tuple2!2521 lt!64285 lt!64288))) lt!64286))))

(assert (=> d!38097 (= (contains!861 (+!163 lt!64284 (tuple2!2521 lt!64285 lt!64288)) lt!64286) lt!65000)))

(declare-fun b!125986 () Bool)

(declare-fun lt!65001 () Unit!3871)

(assert (=> b!125986 (= e!82281 lt!65001)))

(assert (=> b!125986 (= lt!65001 (lemmaContainsKeyImpliesGetValueByKeyDefined!118 (toList!831 (+!163 lt!64284 (tuple2!2521 lt!64285 lt!64288))) lt!64286))))

(assert (=> b!125986 (isDefined!119 (getValueByKey!167 (toList!831 (+!163 lt!64284 (tuple2!2521 lt!64285 lt!64288))) lt!64286))))

(declare-fun b!125987 () Bool)

(declare-fun Unit!3924 () Unit!3871)

(assert (=> b!125987 (= e!82281 Unit!3924)))

(declare-fun b!125988 () Bool)

(assert (=> b!125988 (= e!82280 (isDefined!119 (getValueByKey!167 (toList!831 (+!163 lt!64284 (tuple2!2521 lt!64285 lt!64288))) lt!64286)))))

(assert (= (and d!38097 c!23025) b!125986))

(assert (= (and d!38097 (not c!23025)) b!125987))

(assert (= (and d!38097 (not res!60971)) b!125988))

(declare-fun m!147069 () Bool)

(assert (=> d!38097 m!147069))

(declare-fun m!147071 () Bool)

(assert (=> b!125986 m!147071))

(declare-fun m!147073 () Bool)

(assert (=> b!125986 m!147073))

(assert (=> b!125986 m!147073))

(declare-fun m!147075 () Bool)

(assert (=> b!125986 m!147075))

(assert (=> b!125988 m!147073))

(assert (=> b!125988 m!147073))

(assert (=> b!125988 m!147075))

(assert (=> b!125003 d!38097))

(declare-fun d!38099 () Bool)

(declare-fun e!82282 () Bool)

(assert (=> d!38099 e!82282))

(declare-fun res!60972 () Bool)

(assert (=> d!38099 (=> (not res!60972) (not e!82282))))

(declare-fun lt!65005 () ListLongMap!1631)

(assert (=> d!38099 (= res!60972 (contains!861 lt!65005 (_1!1271 (tuple2!2521 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!65006 () List!1676)

(assert (=> d!38099 (= lt!65005 (ListLongMap!1632 lt!65006))))

(declare-fun lt!65007 () Unit!3871)

(declare-fun lt!65004 () Unit!3871)

(assert (=> d!38099 (= lt!65007 lt!65004)))

(assert (=> d!38099 (= (getValueByKey!167 lt!65006 (_1!1271 (tuple2!2521 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!172 (_2!1271 (tuple2!2521 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!38099 (= lt!65004 (lemmaContainsTupThenGetReturnValue!82 lt!65006 (_1!1271 (tuple2!2521 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1271 (tuple2!2521 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!38099 (= lt!65006 (insertStrictlySorted!85 (toList!831 call!13358) (_1!1271 (tuple2!2521 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1271 (tuple2!2521 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!38099 (= (+!163 call!13358 (tuple2!2521 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!65005)))

(declare-fun b!125989 () Bool)

(declare-fun res!60973 () Bool)

(assert (=> b!125989 (=> (not res!60973) (not e!82282))))

(assert (=> b!125989 (= res!60973 (= (getValueByKey!167 (toList!831 lt!65005) (_1!1271 (tuple2!2521 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!172 (_2!1271 (tuple2!2521 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!125990 () Bool)

(assert (=> b!125990 (= e!82282 (contains!862 (toList!831 lt!65005) (tuple2!2521 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!38099 res!60972) b!125989))

(assert (= (and b!125989 res!60973) b!125990))

(declare-fun m!147077 () Bool)

(assert (=> d!38099 m!147077))

(declare-fun m!147079 () Bool)

(assert (=> d!38099 m!147079))

(declare-fun m!147081 () Bool)

(assert (=> d!38099 m!147081))

(declare-fun m!147083 () Bool)

(assert (=> d!38099 m!147083))

(declare-fun m!147085 () Bool)

(assert (=> b!125989 m!147085))

(declare-fun m!147087 () Bool)

(assert (=> b!125990 m!147087))

(assert (=> b!125003 d!38099))

(declare-fun d!38101 () Bool)

(assert (=> d!38101 (not (contains!861 (+!163 lt!64284 (tuple2!2521 lt!64285 lt!64288)) lt!64286))))

(declare-fun lt!65010 () Unit!3871)

(declare-fun choose!766 (ListLongMap!1631 (_ BitVec 64) V!3425 (_ BitVec 64)) Unit!3871)

(assert (=> d!38101 (= lt!65010 (choose!766 lt!64284 lt!64285 lt!64288 lt!64286))))

(declare-fun e!82285 () Bool)

(assert (=> d!38101 e!82285))

(declare-fun res!60976 () Bool)

(assert (=> d!38101 (=> (not res!60976) (not e!82285))))

(assert (=> d!38101 (= res!60976 (not (contains!861 lt!64284 lt!64286)))))

(assert (=> d!38101 (= (addStillNotContains!57 lt!64284 lt!64285 lt!64288 lt!64286) lt!65010)))

(declare-fun b!125994 () Bool)

(assert (=> b!125994 (= e!82285 (not (= lt!64285 lt!64286)))))

(assert (= (and d!38101 res!60976) b!125994))

(assert (=> d!38101 m!145157))

(assert (=> d!38101 m!145157))

(assert (=> d!38101 m!145159))

(declare-fun m!147089 () Bool)

(assert (=> d!38101 m!147089))

(declare-fun m!147091 () Bool)

(assert (=> d!38101 m!147091))

(assert (=> b!125003 d!38101))

(assert (=> b!125003 d!37537))

(declare-fun b!125995 () Bool)

(declare-fun e!82288 () Bool)

(declare-fun e!82286 () Bool)

(assert (=> b!125995 (= e!82288 e!82286)))

(declare-fun c!23026 () Bool)

(assert (=> b!125995 (= c!23026 (validKeyInArray!0 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun b!125996 () Bool)

(declare-fun call!13489 () Bool)

(assert (=> b!125996 (= e!82286 call!13489)))

(declare-fun b!125997 () Bool)

(declare-fun e!82287 () Bool)

(assert (=> b!125997 (= e!82286 e!82287)))

(declare-fun lt!65013 () (_ BitVec 64))

(assert (=> b!125997 (= lt!65013 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) #b00000000000000000000000000000000))))

(declare-fun lt!65012 () Unit!3871)

(assert (=> b!125997 (= lt!65012 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!4492 (v!3108 (underlying!436 thiss!992))) lt!65013 #b00000000000000000000000000000000))))

(assert (=> b!125997 (arrayContainsKey!0 (_keys!4492 (v!3108 (underlying!436 thiss!992))) lt!65013 #b00000000000000000000000000000000)))

(declare-fun lt!65011 () Unit!3871)

(assert (=> b!125997 (= lt!65011 lt!65012)))

(declare-fun res!60978 () Bool)

(assert (=> b!125997 (= res!60978 (= (seekEntryOrOpen!0 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) #b00000000000000000000000000000000) (_keys!4492 (v!3108 (underlying!436 thiss!992))) (mask!7009 (v!3108 (underlying!436 thiss!992)))) (Found!263 #b00000000000000000000000000000000)))))

(assert (=> b!125997 (=> (not res!60978) (not e!82287))))

(declare-fun bm!13486 () Bool)

(assert (=> bm!13486 (= call!13489 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!4492 (v!3108 (underlying!436 thiss!992))) (mask!7009 (v!3108 (underlying!436 thiss!992)))))))

(declare-fun b!125998 () Bool)

(assert (=> b!125998 (= e!82287 call!13489)))

(declare-fun d!38103 () Bool)

(declare-fun res!60977 () Bool)

(assert (=> d!38103 (=> res!60977 e!82288)))

(assert (=> d!38103 (= res!60977 (bvsge #b00000000000000000000000000000000 (size!2473 (_keys!4492 (v!3108 (underlying!436 thiss!992))))))))

(assert (=> d!38103 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4492 (v!3108 (underlying!436 thiss!992))) (mask!7009 (v!3108 (underlying!436 thiss!992)))) e!82288)))

(assert (= (and d!38103 (not res!60977)) b!125995))

(assert (= (and b!125995 c!23026) b!125997))

(assert (= (and b!125995 (not c!23026)) b!125996))

(assert (= (and b!125997 res!60978) b!125998))

(assert (= (or b!125998 b!125996) bm!13486))

(assert (=> b!125995 m!145757))

(assert (=> b!125995 m!145757))

(assert (=> b!125995 m!145763))

(assert (=> b!125997 m!145757))

(declare-fun m!147093 () Bool)

(assert (=> b!125997 m!147093))

(declare-fun m!147095 () Bool)

(assert (=> b!125997 m!147095))

(assert (=> b!125997 m!145757))

(declare-fun m!147097 () Bool)

(assert (=> b!125997 m!147097))

(declare-fun m!147099 () Bool)

(assert (=> bm!13486 m!147099))

(assert (=> b!124894 d!38103))

(declare-fun d!38105 () Bool)

(assert (=> d!38105 (= (get!1448 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!124943 d!38105))

(declare-fun b!126000 () Bool)

(declare-fun e!82289 () Option!173)

(declare-fun e!82290 () Option!173)

(assert (=> b!126000 (= e!82289 e!82290)))

(declare-fun c!23028 () Bool)

(assert (=> b!126000 (= c!23028 (and ((_ is Cons!1672) (toList!831 lt!64231)) (not (= (_1!1271 (h!2273 (toList!831 lt!64231))) (_1!1271 (ite (or c!22677 c!22679) (tuple2!2521 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2628 (v!3108 (underlying!436 thiss!992)))) (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 (v!3108 (underlying!436 thiss!992))))))))))))

(declare-fun b!126001 () Bool)

(assert (=> b!126001 (= e!82290 (getValueByKey!167 (t!5995 (toList!831 lt!64231)) (_1!1271 (ite (or c!22677 c!22679) (tuple2!2521 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2628 (v!3108 (underlying!436 thiss!992)))) (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 (v!3108 (underlying!436 thiss!992))))))))))

(declare-fun c!23027 () Bool)

(declare-fun d!38107 () Bool)

(assert (=> d!38107 (= c!23027 (and ((_ is Cons!1672) (toList!831 lt!64231)) (= (_1!1271 (h!2273 (toList!831 lt!64231))) (_1!1271 (ite (or c!22677 c!22679) (tuple2!2521 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2628 (v!3108 (underlying!436 thiss!992)))) (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 (v!3108 (underlying!436 thiss!992)))))))))))

(assert (=> d!38107 (= (getValueByKey!167 (toList!831 lt!64231) (_1!1271 (ite (or c!22677 c!22679) (tuple2!2521 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2628 (v!3108 (underlying!436 thiss!992)))) (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 (v!3108 (underlying!436 thiss!992))))))) e!82289)))

(declare-fun b!126002 () Bool)

(assert (=> b!126002 (= e!82290 None!171)))

(declare-fun b!125999 () Bool)

(assert (=> b!125999 (= e!82289 (Some!172 (_2!1271 (h!2273 (toList!831 lt!64231)))))))

(assert (= (and d!38107 c!23027) b!125999))

(assert (= (and d!38107 (not c!23027)) b!126000))

(assert (= (and b!126000 c!23028) b!126001))

(assert (= (and b!126000 (not c!23028)) b!126002))

(declare-fun m!147101 () Bool)

(assert (=> b!126001 m!147101))

(assert (=> b!124891 d!38107))

(assert (=> b!125185 d!37531))

(declare-fun d!38109 () Bool)

(assert (=> d!38109 (= (get!1449 (getValueByKey!167 (toList!831 (+!163 lt!64116 (tuple2!2521 lt!64125 (minValue!2628 (v!3108 (underlying!436 thiss!992)))))) lt!64111)) (v!3114 (getValueByKey!167 (toList!831 (+!163 lt!64116 (tuple2!2521 lt!64125 (minValue!2628 (v!3108 (underlying!436 thiss!992)))))) lt!64111)))))

(assert (=> d!37545 d!38109))

(declare-fun b!126004 () Bool)

(declare-fun e!82291 () Option!173)

(declare-fun e!82292 () Option!173)

(assert (=> b!126004 (= e!82291 e!82292)))

(declare-fun c!23030 () Bool)

(assert (=> b!126004 (= c!23030 (and ((_ is Cons!1672) (toList!831 (+!163 lt!64116 (tuple2!2521 lt!64125 (minValue!2628 (v!3108 (underlying!436 thiss!992))))))) (not (= (_1!1271 (h!2273 (toList!831 (+!163 lt!64116 (tuple2!2521 lt!64125 (minValue!2628 (v!3108 (underlying!436 thiss!992)))))))) lt!64111))))))

(declare-fun b!126005 () Bool)

(assert (=> b!126005 (= e!82292 (getValueByKey!167 (t!5995 (toList!831 (+!163 lt!64116 (tuple2!2521 lt!64125 (minValue!2628 (v!3108 (underlying!436 thiss!992))))))) lt!64111))))

(declare-fun c!23029 () Bool)

(declare-fun d!38111 () Bool)

(assert (=> d!38111 (= c!23029 (and ((_ is Cons!1672) (toList!831 (+!163 lt!64116 (tuple2!2521 lt!64125 (minValue!2628 (v!3108 (underlying!436 thiss!992))))))) (= (_1!1271 (h!2273 (toList!831 (+!163 lt!64116 (tuple2!2521 lt!64125 (minValue!2628 (v!3108 (underlying!436 thiss!992)))))))) lt!64111)))))

(assert (=> d!38111 (= (getValueByKey!167 (toList!831 (+!163 lt!64116 (tuple2!2521 lt!64125 (minValue!2628 (v!3108 (underlying!436 thiss!992)))))) lt!64111) e!82291)))

(declare-fun b!126006 () Bool)

(assert (=> b!126006 (= e!82292 None!171)))

(declare-fun b!126003 () Bool)

(assert (=> b!126003 (= e!82291 (Some!172 (_2!1271 (h!2273 (toList!831 (+!163 lt!64116 (tuple2!2521 lt!64125 (minValue!2628 (v!3108 (underlying!436 thiss!992))))))))))))

(assert (= (and d!38111 c!23029) b!126003))

(assert (= (and d!38111 (not c!23029)) b!126004))

(assert (= (and b!126004 c!23030) b!126005))

(assert (= (and b!126004 (not c!23030)) b!126006))

(declare-fun m!147103 () Bool)

(assert (=> b!126005 m!147103))

(assert (=> d!37545 d!38111))

(declare-fun d!38113 () Bool)

(assert (=> d!38113 (isDefined!119 (getValueByKey!167 (toList!831 (+!163 lt!64122 (tuple2!2521 lt!64114 (zeroValue!2628 (v!3108 (underlying!436 thiss!992)))))) lt!64109))))

(declare-fun lt!65014 () Unit!3871)

(assert (=> d!38113 (= lt!65014 (choose!762 (toList!831 (+!163 lt!64122 (tuple2!2521 lt!64114 (zeroValue!2628 (v!3108 (underlying!436 thiss!992)))))) lt!64109))))

(declare-fun e!82293 () Bool)

(assert (=> d!38113 e!82293))

(declare-fun res!60979 () Bool)

(assert (=> d!38113 (=> (not res!60979) (not e!82293))))

(assert (=> d!38113 (= res!60979 (isStrictlySorted!303 (toList!831 (+!163 lt!64122 (tuple2!2521 lt!64114 (zeroValue!2628 (v!3108 (underlying!436 thiss!992))))))))))

(assert (=> d!38113 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!118 (toList!831 (+!163 lt!64122 (tuple2!2521 lt!64114 (zeroValue!2628 (v!3108 (underlying!436 thiss!992)))))) lt!64109) lt!65014)))

(declare-fun b!126007 () Bool)

(assert (=> b!126007 (= e!82293 (containsKey!170 (toList!831 (+!163 lt!64122 (tuple2!2521 lt!64114 (zeroValue!2628 (v!3108 (underlying!436 thiss!992)))))) lt!64109))))

(assert (= (and d!38113 res!60979) b!126007))

(assert (=> d!38113 m!145217))

(assert (=> d!38113 m!145217))

(assert (=> d!38113 m!145219))

(declare-fun m!147105 () Bool)

(assert (=> d!38113 m!147105))

(declare-fun m!147107 () Bool)

(assert (=> d!38113 m!147107))

(assert (=> b!126007 m!145213))

(assert (=> b!125023 d!38113))

(assert (=> b!125023 d!37847))

(assert (=> b!125023 d!37849))

(assert (=> b!125200 d!38043))

(assert (=> b!125200 d!37587))

(declare-fun call!13496 () ListLongMap!1631)

(declare-fun call!13490 () ListLongMap!1631)

(declare-fun call!13495 () ListLongMap!1631)

(declare-fun bm!13487 () Bool)

(declare-fun call!13492 () ListLongMap!1631)

(declare-fun c!23036 () Bool)

(declare-fun c!23034 () Bool)

(assert (=> bm!13487 (= call!13490 (+!163 (ite c!23034 call!13495 (ite c!23036 call!13496 call!13492)) (ite (or c!23034 c!23036) (tuple2!2521 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2628 newMap!16)) (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 newMap!16)))))))

(declare-fun b!126008 () Bool)

(declare-fun e!82302 () Bool)

(declare-fun e!82295 () Bool)

(assert (=> b!126008 (= e!82302 e!82295)))

(declare-fun res!60980 () Bool)

(declare-fun call!13491 () Bool)

(assert (=> b!126008 (= res!60980 call!13491)))

(assert (=> b!126008 (=> (not res!60980) (not e!82295))))

(declare-fun bm!13488 () Bool)

(assert (=> bm!13488 (= call!13496 call!13495)))

(declare-fun lt!65016 () ListLongMap!1631)

(declare-fun e!82305 () Bool)

(declare-fun b!126010 () Bool)

(assert (=> b!126010 (= e!82305 (= (apply!110 lt!65016 (select (arr!2210 (_keys!4492 newMap!16)) #b00000000000000000000000000000000)) (get!1446 (select (arr!2211 (array!4670 (store (arr!2211 (_values!2746 newMap!16)) (index!3207 lt!64214) (ValueCellFull!1073 (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2474 (_values!2746 newMap!16)))) #b00000000000000000000000000000000) (dynLambda!415 (defaultEntry!2763 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!126010 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2474 (array!4670 (store (arr!2211 (_values!2746 newMap!16)) (index!3207 lt!64214) (ValueCellFull!1073 (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2474 (_values!2746 newMap!16))))))))

(assert (=> b!126010 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2473 (_keys!4492 newMap!16))))))

(declare-fun bm!13489 () Bool)

(assert (=> bm!13489 (= call!13492 call!13496)))

(declare-fun b!126011 () Bool)

(declare-fun e!82296 () Bool)

(declare-fun e!82301 () Bool)

(assert (=> b!126011 (= e!82296 e!82301)))

(declare-fun res!60987 () Bool)

(declare-fun call!13494 () Bool)

(assert (=> b!126011 (= res!60987 call!13494)))

(assert (=> b!126011 (=> (not res!60987) (not e!82301))))

(declare-fun b!126012 () Bool)

(declare-fun e!82299 () Unit!3871)

(declare-fun lt!65027 () Unit!3871)

(assert (=> b!126012 (= e!82299 lt!65027)))

(declare-fun lt!65030 () ListLongMap!1631)

(assert (=> b!126012 (= lt!65030 (getCurrentListMapNoExtraKeys!130 (_keys!4492 newMap!16) (array!4670 (store (arr!2211 (_values!2746 newMap!16)) (index!3207 lt!64214) (ValueCellFull!1073 (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2474 (_values!2746 newMap!16))) (mask!7009 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16)))))

(declare-fun lt!65022 () (_ BitVec 64))

(assert (=> b!126012 (= lt!65022 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!65017 () (_ BitVec 64))

(assert (=> b!126012 (= lt!65017 (select (arr!2210 (_keys!4492 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!65020 () Unit!3871)

(assert (=> b!126012 (= lt!65020 (addStillContains!86 lt!65030 lt!65022 (zeroValue!2628 newMap!16) lt!65017))))

(assert (=> b!126012 (contains!861 (+!163 lt!65030 (tuple2!2521 lt!65022 (zeroValue!2628 newMap!16))) lt!65017)))

(declare-fun lt!65015 () Unit!3871)

(assert (=> b!126012 (= lt!65015 lt!65020)))

(declare-fun lt!65024 () ListLongMap!1631)

(assert (=> b!126012 (= lt!65024 (getCurrentListMapNoExtraKeys!130 (_keys!4492 newMap!16) (array!4670 (store (arr!2211 (_values!2746 newMap!16)) (index!3207 lt!64214) (ValueCellFull!1073 (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2474 (_values!2746 newMap!16))) (mask!7009 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16)))))

(declare-fun lt!65033 () (_ BitVec 64))

(assert (=> b!126012 (= lt!65033 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!65019 () (_ BitVec 64))

(assert (=> b!126012 (= lt!65019 (select (arr!2210 (_keys!4492 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!65021 () Unit!3871)

(assert (=> b!126012 (= lt!65021 (addApplyDifferent!86 lt!65024 lt!65033 (minValue!2628 newMap!16) lt!65019))))

(assert (=> b!126012 (= (apply!110 (+!163 lt!65024 (tuple2!2521 lt!65033 (minValue!2628 newMap!16))) lt!65019) (apply!110 lt!65024 lt!65019))))

(declare-fun lt!65034 () Unit!3871)

(assert (=> b!126012 (= lt!65034 lt!65021)))

(declare-fun lt!65026 () ListLongMap!1631)

(assert (=> b!126012 (= lt!65026 (getCurrentListMapNoExtraKeys!130 (_keys!4492 newMap!16) (array!4670 (store (arr!2211 (_values!2746 newMap!16)) (index!3207 lt!64214) (ValueCellFull!1073 (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2474 (_values!2746 newMap!16))) (mask!7009 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16)))))

(declare-fun lt!65032 () (_ BitVec 64))

(assert (=> b!126012 (= lt!65032 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!65029 () (_ BitVec 64))

(assert (=> b!126012 (= lt!65029 (select (arr!2210 (_keys!4492 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!65028 () Unit!3871)

(assert (=> b!126012 (= lt!65028 (addApplyDifferent!86 lt!65026 lt!65032 (zeroValue!2628 newMap!16) lt!65029))))

(assert (=> b!126012 (= (apply!110 (+!163 lt!65026 (tuple2!2521 lt!65032 (zeroValue!2628 newMap!16))) lt!65029) (apply!110 lt!65026 lt!65029))))

(declare-fun lt!65023 () Unit!3871)

(assert (=> b!126012 (= lt!65023 lt!65028)))

(declare-fun lt!65018 () ListLongMap!1631)

(assert (=> b!126012 (= lt!65018 (getCurrentListMapNoExtraKeys!130 (_keys!4492 newMap!16) (array!4670 (store (arr!2211 (_values!2746 newMap!16)) (index!3207 lt!64214) (ValueCellFull!1073 (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2474 (_values!2746 newMap!16))) (mask!7009 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16)))))

(declare-fun lt!65025 () (_ BitVec 64))

(assert (=> b!126012 (= lt!65025 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!65036 () (_ BitVec 64))

(assert (=> b!126012 (= lt!65036 (select (arr!2210 (_keys!4492 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!126012 (= lt!65027 (addApplyDifferent!86 lt!65018 lt!65025 (minValue!2628 newMap!16) lt!65036))))

(assert (=> b!126012 (= (apply!110 (+!163 lt!65018 (tuple2!2521 lt!65025 (minValue!2628 newMap!16))) lt!65036) (apply!110 lt!65018 lt!65036))))

(declare-fun b!126013 () Bool)

(declare-fun e!82297 () ListLongMap!1631)

(assert (=> b!126013 (= e!82297 call!13492)))

(declare-fun b!126014 () Bool)

(declare-fun e!82304 () Bool)

(assert (=> b!126014 (= e!82304 e!82296)))

(declare-fun c!23032 () Bool)

(assert (=> b!126014 (= c!23032 (not (= (bvand (extraKeys!2548 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!126015 () Bool)

(assert (=> b!126015 (= e!82302 (not call!13491))))

(declare-fun bm!13490 () Bool)

(assert (=> bm!13490 (= call!13494 (contains!861 lt!65016 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!126016 () Bool)

(declare-fun e!82300 () Bool)

(assert (=> b!126016 (= e!82300 (validKeyInArray!0 (select (arr!2210 (_keys!4492 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun d!38115 () Bool)

(assert (=> d!38115 e!82304))

(declare-fun res!60983 () Bool)

(assert (=> d!38115 (=> (not res!60983) (not e!82304))))

(assert (=> d!38115 (= res!60983 (or (bvsge #b00000000000000000000000000000000 (size!2473 (_keys!4492 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2473 (_keys!4492 newMap!16))))))))

(declare-fun lt!65031 () ListLongMap!1631)

(assert (=> d!38115 (= lt!65016 lt!65031)))

(declare-fun lt!65035 () Unit!3871)

(assert (=> d!38115 (= lt!65035 e!82299)))

(declare-fun c!23031 () Bool)

(declare-fun e!82306 () Bool)

(assert (=> d!38115 (= c!23031 e!82306)))

(declare-fun res!60985 () Bool)

(assert (=> d!38115 (=> (not res!60985) (not e!82306))))

(assert (=> d!38115 (= res!60985 (bvslt #b00000000000000000000000000000000 (size!2473 (_keys!4492 newMap!16))))))

(declare-fun e!82294 () ListLongMap!1631)

(assert (=> d!38115 (= lt!65031 e!82294)))

(assert (=> d!38115 (= c!23034 (and (not (= (bvand (extraKeys!2548 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2548 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!38115 (validMask!0 (mask!7009 newMap!16))))

(assert (=> d!38115 (= (getCurrentListMap!511 (_keys!4492 newMap!16) (array!4670 (store (arr!2211 (_values!2746 newMap!16)) (index!3207 lt!64214) (ValueCellFull!1073 (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2474 (_values!2746 newMap!16))) (mask!7009 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16)) lt!65016)))

(declare-fun b!126009 () Bool)

(assert (=> b!126009 (= e!82296 (not call!13494))))

(declare-fun bm!13491 () Bool)

(assert (=> bm!13491 (= call!13491 (contains!861 lt!65016 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!126017 () Bool)

(assert (=> b!126017 (= e!82306 (validKeyInArray!0 (select (arr!2210 (_keys!4492 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!126018 () Bool)

(assert (=> b!126018 (= e!82301 (= (apply!110 lt!65016 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2628 newMap!16)))))

(declare-fun b!126019 () Bool)

(assert (=> b!126019 (= e!82295 (= (apply!110 lt!65016 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2628 newMap!16)))))

(declare-fun b!126020 () Bool)

(declare-fun e!82298 () Bool)

(assert (=> b!126020 (= e!82298 e!82305)))

(declare-fun res!60981 () Bool)

(assert (=> b!126020 (=> (not res!60981) (not e!82305))))

(assert (=> b!126020 (= res!60981 (contains!861 lt!65016 (select (arr!2210 (_keys!4492 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!126020 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2473 (_keys!4492 newMap!16))))))

(declare-fun b!126021 () Bool)

(declare-fun e!82303 () ListLongMap!1631)

(assert (=> b!126021 (= e!82294 e!82303)))

(assert (=> b!126021 (= c!23036 (and (not (= (bvand (extraKeys!2548 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2548 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!126022 () Bool)

(declare-fun call!13493 () ListLongMap!1631)

(assert (=> b!126022 (= e!82297 call!13493)))

(declare-fun bm!13492 () Bool)

(assert (=> bm!13492 (= call!13495 (getCurrentListMapNoExtraKeys!130 (_keys!4492 newMap!16) (array!4670 (store (arr!2211 (_values!2746 newMap!16)) (index!3207 lt!64214) (ValueCellFull!1073 (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2474 (_values!2746 newMap!16))) (mask!7009 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16)))))

(declare-fun b!126023 () Bool)

(declare-fun res!60982 () Bool)

(assert (=> b!126023 (=> (not res!60982) (not e!82304))))

(assert (=> b!126023 (= res!60982 e!82298)))

(declare-fun res!60986 () Bool)

(assert (=> b!126023 (=> res!60986 e!82298)))

(assert (=> b!126023 (= res!60986 (not e!82300))))

(declare-fun res!60984 () Bool)

(assert (=> b!126023 (=> (not res!60984) (not e!82300))))

(assert (=> b!126023 (= res!60984 (bvslt #b00000000000000000000000000000000 (size!2473 (_keys!4492 newMap!16))))))

(declare-fun b!126024 () Bool)

(assert (=> b!126024 (= e!82303 call!13493)))

(declare-fun b!126025 () Bool)

(declare-fun Unit!3925 () Unit!3871)

(assert (=> b!126025 (= e!82299 Unit!3925)))

(declare-fun b!126026 () Bool)

(assert (=> b!126026 (= e!82294 (+!163 call!13490 (tuple2!2521 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 newMap!16))))))

(declare-fun b!126027 () Bool)

(declare-fun res!60988 () Bool)

(assert (=> b!126027 (=> (not res!60988) (not e!82304))))

(assert (=> b!126027 (= res!60988 e!82302)))

(declare-fun c!23033 () Bool)

(assert (=> b!126027 (= c!23033 (not (= (bvand (extraKeys!2548 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!13493 () Bool)

(assert (=> bm!13493 (= call!13493 call!13490)))

(declare-fun b!126028 () Bool)

(declare-fun c!23035 () Bool)

(assert (=> b!126028 (= c!23035 (and (not (= (bvand (extraKeys!2548 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2548 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!126028 (= e!82303 e!82297)))

(assert (= (and d!38115 c!23034) b!126026))

(assert (= (and d!38115 (not c!23034)) b!126021))

(assert (= (and b!126021 c!23036) b!126024))

(assert (= (and b!126021 (not c!23036)) b!126028))

(assert (= (and b!126028 c!23035) b!126022))

(assert (= (and b!126028 (not c!23035)) b!126013))

(assert (= (or b!126022 b!126013) bm!13489))

(assert (= (or b!126024 bm!13489) bm!13488))

(assert (= (or b!126024 b!126022) bm!13493))

(assert (= (or b!126026 bm!13488) bm!13492))

(assert (= (or b!126026 bm!13493) bm!13487))

(assert (= (and d!38115 res!60985) b!126017))

(assert (= (and d!38115 c!23031) b!126012))

(assert (= (and d!38115 (not c!23031)) b!126025))

(assert (= (and d!38115 res!60983) b!126023))

(assert (= (and b!126023 res!60984) b!126016))

(assert (= (and b!126023 (not res!60986)) b!126020))

(assert (= (and b!126020 res!60981) b!126010))

(assert (= (and b!126023 res!60982) b!126027))

(assert (= (and b!126027 c!23033) b!126008))

(assert (= (and b!126027 (not c!23033)) b!126015))

(assert (= (and b!126008 res!60980) b!126019))

(assert (= (or b!126008 b!126015) bm!13491))

(assert (= (and b!126027 res!60988) b!126014))

(assert (= (and b!126014 c!23032) b!126011))

(assert (= (and b!126014 (not c!23032)) b!126009))

(assert (= (and b!126011 res!60987) b!126018))

(assert (= (or b!126011 b!126009) bm!13490))

(declare-fun b_lambda!5535 () Bool)

(assert (=> (not b_lambda!5535) (not b!126010)))

(assert (=> b!126010 t!6006))

(declare-fun b_and!7753 () Bool)

(assert (= b_and!7749 (and (=> t!6006 result!3815) b_and!7753)))

(assert (=> b!126010 t!6008))

(declare-fun b_and!7755 () Bool)

(assert (= b_and!7751 (and (=> t!6008 result!3817) b_and!7755)))

(declare-fun m!147109 () Bool)

(assert (=> b!126018 m!147109))

(declare-fun m!147111 () Bool)

(assert (=> bm!13492 m!147111))

(declare-fun m!147113 () Bool)

(assert (=> b!126019 m!147113))

(declare-fun m!147115 () Bool)

(assert (=> b!126026 m!147115))

(declare-fun m!147117 () Bool)

(assert (=> bm!13491 m!147117))

(assert (=> b!126010 m!145113))

(declare-fun m!147119 () Bool)

(assert (=> b!126010 m!147119))

(assert (=> b!126010 m!145113))

(assert (=> b!126010 m!145277))

(declare-fun m!147121 () Bool)

(assert (=> b!126010 m!147121))

(assert (=> b!126010 m!147121))

(assert (=> b!126010 m!145277))

(declare-fun m!147123 () Bool)

(assert (=> b!126010 m!147123))

(assert (=> b!126020 m!145113))

(assert (=> b!126020 m!145113))

(declare-fun m!147125 () Bool)

(assert (=> b!126020 m!147125))

(declare-fun m!147127 () Bool)

(assert (=> b!126012 m!147127))

(declare-fun m!147129 () Bool)

(assert (=> b!126012 m!147129))

(assert (=> b!126012 m!147111))

(declare-fun m!147131 () Bool)

(assert (=> b!126012 m!147131))

(declare-fun m!147133 () Bool)

(assert (=> b!126012 m!147133))

(declare-fun m!147135 () Bool)

(assert (=> b!126012 m!147135))

(assert (=> b!126012 m!147127))

(declare-fun m!147137 () Bool)

(assert (=> b!126012 m!147137))

(assert (=> b!126012 m!147131))

(declare-fun m!147139 () Bool)

(assert (=> b!126012 m!147139))

(declare-fun m!147141 () Bool)

(assert (=> b!126012 m!147141))

(declare-fun m!147143 () Bool)

(assert (=> b!126012 m!147143))

(declare-fun m!147145 () Bool)

(assert (=> b!126012 m!147145))

(declare-fun m!147147 () Bool)

(assert (=> b!126012 m!147147))

(declare-fun m!147149 () Bool)

(assert (=> b!126012 m!147149))

(declare-fun m!147151 () Bool)

(assert (=> b!126012 m!147151))

(declare-fun m!147153 () Bool)

(assert (=> b!126012 m!147153))

(assert (=> b!126012 m!147149))

(assert (=> b!126012 m!147143))

(declare-fun m!147155 () Bool)

(assert (=> b!126012 m!147155))

(assert (=> b!126012 m!145113))

(assert (=> b!126016 m!145113))

(assert (=> b!126016 m!145113))

(assert (=> b!126016 m!145115))

(declare-fun m!147157 () Bool)

(assert (=> bm!13490 m!147157))

(declare-fun m!147159 () Bool)

(assert (=> bm!13487 m!147159))

(assert (=> d!38115 m!145065))

(assert (=> b!126017 m!145113))

(assert (=> b!126017 m!145113))

(assert (=> b!126017 m!145115))

(assert (=> b!125200 d!38115))

(declare-fun d!38117 () Bool)

(declare-fun e!82307 () Bool)

(assert (=> d!38117 e!82307))

(declare-fun res!60989 () Bool)

(assert (=> d!38117 (=> res!60989 e!82307)))

(declare-fun lt!65037 () Bool)

(assert (=> d!38117 (= res!60989 (not lt!65037))))

(declare-fun lt!65040 () Bool)

(assert (=> d!38117 (= lt!65037 lt!65040)))

(declare-fun lt!65039 () Unit!3871)

(declare-fun e!82308 () Unit!3871)

(assert (=> d!38117 (= lt!65039 e!82308)))

(declare-fun c!23037 () Bool)

(assert (=> d!38117 (= c!23037 lt!65040)))

(assert (=> d!38117 (= lt!65040 (containsKey!170 (toList!831 lt!64254) (_1!1271 (tuple2!2521 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!38117 (= (contains!861 lt!64254 (_1!1271 (tuple2!2521 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) lt!65037)))

(declare-fun b!126029 () Bool)

(declare-fun lt!65038 () Unit!3871)

(assert (=> b!126029 (= e!82308 lt!65038)))

(assert (=> b!126029 (= lt!65038 (lemmaContainsKeyImpliesGetValueByKeyDefined!118 (toList!831 lt!64254) (_1!1271 (tuple2!2521 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> b!126029 (isDefined!119 (getValueByKey!167 (toList!831 lt!64254) (_1!1271 (tuple2!2521 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!126030 () Bool)

(declare-fun Unit!3926 () Unit!3871)

(assert (=> b!126030 (= e!82308 Unit!3926)))

(declare-fun b!126031 () Bool)

(assert (=> b!126031 (= e!82307 (isDefined!119 (getValueByKey!167 (toList!831 lt!64254) (_1!1271 (tuple2!2521 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (= (and d!38117 c!23037) b!126029))

(assert (= (and d!38117 (not c!23037)) b!126030))

(assert (= (and d!38117 (not res!60989)) b!126031))

(declare-fun m!147161 () Bool)

(assert (=> d!38117 m!147161))

(declare-fun m!147163 () Bool)

(assert (=> b!126029 m!147163))

(assert (=> b!126029 m!145097))

(assert (=> b!126029 m!145097))

(declare-fun m!147165 () Bool)

(assert (=> b!126029 m!147165))

(assert (=> b!126031 m!145097))

(assert (=> b!126031 m!145097))

(assert (=> b!126031 m!147165))

(assert (=> d!37533 d!38117))

(declare-fun b!126033 () Bool)

(declare-fun e!82309 () Option!173)

(declare-fun e!82310 () Option!173)

(assert (=> b!126033 (= e!82309 e!82310)))

(declare-fun c!23039 () Bool)

(assert (=> b!126033 (= c!23039 (and ((_ is Cons!1672) lt!64255) (not (= (_1!1271 (h!2273 lt!64255)) (_1!1271 (tuple2!2521 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(declare-fun b!126034 () Bool)

(assert (=> b!126034 (= e!82310 (getValueByKey!167 (t!5995 lt!64255) (_1!1271 (tuple2!2521 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun d!38119 () Bool)

(declare-fun c!23038 () Bool)

(assert (=> d!38119 (= c!23038 (and ((_ is Cons!1672) lt!64255) (= (_1!1271 (h!2273 lt!64255)) (_1!1271 (tuple2!2521 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!38119 (= (getValueByKey!167 lt!64255 (_1!1271 (tuple2!2521 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) e!82309)))

(declare-fun b!126035 () Bool)

(assert (=> b!126035 (= e!82310 None!171)))

(declare-fun b!126032 () Bool)

(assert (=> b!126032 (= e!82309 (Some!172 (_2!1271 (h!2273 lt!64255))))))

(assert (= (and d!38119 c!23038) b!126032))

(assert (= (and d!38119 (not c!23038)) b!126033))

(assert (= (and b!126033 c!23039) b!126034))

(assert (= (and b!126033 (not c!23039)) b!126035))

(declare-fun m!147167 () Bool)

(assert (=> b!126034 m!147167))

(assert (=> d!37533 d!38119))

(declare-fun d!38121 () Bool)

(assert (=> d!38121 (= (getValueByKey!167 lt!64255 (_1!1271 (tuple2!2521 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!172 (_2!1271 (tuple2!2521 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!65041 () Unit!3871)

(assert (=> d!38121 (= lt!65041 (choose!763 lt!64255 (_1!1271 (tuple2!2521 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1271 (tuple2!2521 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!82311 () Bool)

(assert (=> d!38121 e!82311))

(declare-fun res!60990 () Bool)

(assert (=> d!38121 (=> (not res!60990) (not e!82311))))

(assert (=> d!38121 (= res!60990 (isStrictlySorted!303 lt!64255))))

(assert (=> d!38121 (= (lemmaContainsTupThenGetReturnValue!82 lt!64255 (_1!1271 (tuple2!2521 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1271 (tuple2!2521 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) lt!65041)))

(declare-fun b!126036 () Bool)

(declare-fun res!60991 () Bool)

(assert (=> b!126036 (=> (not res!60991) (not e!82311))))

(assert (=> b!126036 (= res!60991 (containsKey!170 lt!64255 (_1!1271 (tuple2!2521 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!126037 () Bool)

(assert (=> b!126037 (= e!82311 (contains!862 lt!64255 (tuple2!2521 (_1!1271 (tuple2!2521 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1271 (tuple2!2521 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (= (and d!38121 res!60990) b!126036))

(assert (= (and b!126036 res!60991) b!126037))

(assert (=> d!38121 m!145091))

(declare-fun m!147169 () Bool)

(assert (=> d!38121 m!147169))

(declare-fun m!147171 () Bool)

(assert (=> d!38121 m!147171))

(declare-fun m!147173 () Bool)

(assert (=> b!126036 m!147173))

(declare-fun m!147175 () Bool)

(assert (=> b!126037 m!147175))

(assert (=> d!37533 d!38121))

(declare-fun b!126038 () Bool)

(declare-fun e!82312 () List!1676)

(declare-fun call!13499 () List!1676)

(assert (=> b!126038 (= e!82312 call!13499)))

(declare-fun c!23040 () Bool)

(declare-fun b!126039 () Bool)

(assert (=> b!126039 (= c!23040 (and ((_ is Cons!1672) (toList!831 call!13334)) (bvsgt (_1!1271 (h!2273 (toList!831 call!13334))) (_1!1271 (tuple2!2521 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun e!82316 () List!1676)

(assert (=> b!126039 (= e!82316 e!82312)))

(declare-fun b!126040 () Bool)

(declare-fun res!60993 () Bool)

(declare-fun e!82315 () Bool)

(assert (=> b!126040 (=> (not res!60993) (not e!82315))))

(declare-fun lt!65042 () List!1676)

(assert (=> b!126040 (= res!60993 (containsKey!170 lt!65042 (_1!1271 (tuple2!2521 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun d!38123 () Bool)

(assert (=> d!38123 e!82315))

(declare-fun res!60992 () Bool)

(assert (=> d!38123 (=> (not res!60992) (not e!82315))))

(assert (=> d!38123 (= res!60992 (isStrictlySorted!303 lt!65042))))

(declare-fun e!82313 () List!1676)

(assert (=> d!38123 (= lt!65042 e!82313)))

(declare-fun c!23042 () Bool)

(assert (=> d!38123 (= c!23042 (and ((_ is Cons!1672) (toList!831 call!13334)) (bvslt (_1!1271 (h!2273 (toList!831 call!13334))) (_1!1271 (tuple2!2521 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!38123 (isStrictlySorted!303 (toList!831 call!13334))))

(assert (=> d!38123 (= (insertStrictlySorted!85 (toList!831 call!13334) (_1!1271 (tuple2!2521 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1271 (tuple2!2521 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) lt!65042)))

(declare-fun b!126041 () Bool)

(declare-fun call!13497 () List!1676)

(assert (=> b!126041 (= e!82313 call!13497)))

(declare-fun b!126042 () Bool)

(assert (=> b!126042 (= e!82315 (contains!862 lt!65042 (tuple2!2521 (_1!1271 (tuple2!2521 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1271 (tuple2!2521 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun bm!13494 () Bool)

(declare-fun e!82314 () List!1676)

(assert (=> bm!13494 (= call!13497 ($colon$colon!87 e!82314 (ite c!23042 (h!2273 (toList!831 call!13334)) (tuple2!2521 (_1!1271 (tuple2!2521 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1271 (tuple2!2521 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(declare-fun c!23043 () Bool)

(assert (=> bm!13494 (= c!23043 c!23042)))

(declare-fun bm!13495 () Bool)

(declare-fun call!13498 () List!1676)

(assert (=> bm!13495 (= call!13498 call!13497)))

(declare-fun bm!13496 () Bool)

(assert (=> bm!13496 (= call!13499 call!13498)))

(declare-fun b!126043 () Bool)

(assert (=> b!126043 (= e!82313 e!82316)))

(declare-fun c!23041 () Bool)

(assert (=> b!126043 (= c!23041 (and ((_ is Cons!1672) (toList!831 call!13334)) (= (_1!1271 (h!2273 (toList!831 call!13334))) (_1!1271 (tuple2!2521 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!126044 () Bool)

(assert (=> b!126044 (= e!82312 call!13499)))

(declare-fun b!126045 () Bool)

(assert (=> b!126045 (= e!82314 (ite c!23041 (t!5995 (toList!831 call!13334)) (ite c!23040 (Cons!1672 (h!2273 (toList!831 call!13334)) (t!5995 (toList!831 call!13334))) Nil!1673)))))

(declare-fun b!126046 () Bool)

(assert (=> b!126046 (= e!82314 (insertStrictlySorted!85 (t!5995 (toList!831 call!13334)) (_1!1271 (tuple2!2521 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1271 (tuple2!2521 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) from!355) (get!1446 (select (arr!2211 (_values!2746 (v!3108 (underlying!436 thiss!992)))) from!355) (dynLambda!415 (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!126047 () Bool)

(assert (=> b!126047 (= e!82316 call!13498)))

(assert (= (and d!38123 c!23042) b!126041))

(assert (= (and d!38123 (not c!23042)) b!126043))

(assert (= (and b!126043 c!23041) b!126047))

(assert (= (and b!126043 (not c!23041)) b!126039))

(assert (= (and b!126039 c!23040) b!126038))

(assert (= (and b!126039 (not c!23040)) b!126044))

(assert (= (or b!126038 b!126044) bm!13496))

(assert (= (or b!126047 bm!13496) bm!13495))

(assert (= (or b!126041 bm!13495) bm!13494))

(assert (= (and bm!13494 c!23043) b!126046))

(assert (= (and bm!13494 (not c!23043)) b!126045))

(assert (= (and d!38123 res!60992) b!126040))

(assert (= (and b!126040 res!60993) b!126042))

(declare-fun m!147177 () Bool)

(assert (=> d!38123 m!147177))

(declare-fun m!147179 () Bool)

(assert (=> d!38123 m!147179))

(declare-fun m!147181 () Bool)

(assert (=> bm!13494 m!147181))

(declare-fun m!147183 () Bool)

(assert (=> b!126042 m!147183))

(declare-fun m!147185 () Bool)

(assert (=> b!126040 m!147185))

(declare-fun m!147187 () Bool)

(assert (=> b!126046 m!147187))

(assert (=> d!37533 d!38123))

(declare-fun d!38125 () Bool)

(assert (=> d!38125 (= (apply!110 lt!64289 (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1449 (getValueByKey!167 (toList!831 lt!64289) (select (arr!2210 (_keys!4492 (v!3108 (underlying!436 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(declare-fun bs!5233 () Bool)

(assert (= bs!5233 d!38125))

(assert (=> bs!5233 m!144905))

(assert (=> bs!5233 m!146181))

(assert (=> bs!5233 m!146181))

(declare-fun m!147189 () Bool)

(assert (=> bs!5233 m!147189))

(assert (=> b!125007 d!38125))

(assert (=> b!125007 d!37537))

(assert (=> b!125072 d!37633))

(assert (=> d!37561 d!37545))

(assert (=> d!37561 d!37571))

(declare-fun d!38127 () Bool)

(declare-fun e!82317 () Bool)

(assert (=> d!38127 e!82317))

(declare-fun res!60994 () Bool)

(assert (=> d!38127 (=> res!60994 e!82317)))

(declare-fun lt!65043 () Bool)

(assert (=> d!38127 (= res!60994 (not lt!65043))))

(declare-fun lt!65046 () Bool)

(assert (=> d!38127 (= lt!65043 lt!65046)))

(declare-fun lt!65045 () Unit!3871)

(declare-fun e!82318 () Unit!3871)

(assert (=> d!38127 (= lt!65045 e!82318)))

(declare-fun c!23044 () Bool)

(assert (=> d!38127 (= c!23044 lt!65046)))

(assert (=> d!38127 (= lt!65046 (containsKey!170 (toList!831 lt!64116) lt!64111))))

(assert (=> d!38127 (= (contains!861 lt!64116 lt!64111) lt!65043)))

(declare-fun b!126048 () Bool)

(declare-fun lt!65044 () Unit!3871)

(assert (=> b!126048 (= e!82318 lt!65044)))

(assert (=> b!126048 (= lt!65044 (lemmaContainsKeyImpliesGetValueByKeyDefined!118 (toList!831 lt!64116) lt!64111))))

(assert (=> b!126048 (isDefined!119 (getValueByKey!167 (toList!831 lt!64116) lt!64111))))

(declare-fun b!126049 () Bool)

(declare-fun Unit!3927 () Unit!3871)

(assert (=> b!126049 (= e!82318 Unit!3927)))

(declare-fun b!126050 () Bool)

(assert (=> b!126050 (= e!82317 (isDefined!119 (getValueByKey!167 (toList!831 lt!64116) lt!64111)))))

(assert (= (and d!38127 c!23044) b!126048))

(assert (= (and d!38127 (not c!23044)) b!126049))

(assert (= (and d!38127 (not res!60994)) b!126050))

(declare-fun m!147191 () Bool)

(assert (=> d!38127 m!147191))

(declare-fun m!147193 () Bool)

(assert (=> b!126048 m!147193))

(assert (=> b!126048 m!145177))

(assert (=> b!126048 m!145177))

(declare-fun m!147195 () Bool)

(assert (=> b!126048 m!147195))

(assert (=> b!126050 m!145177))

(assert (=> b!126050 m!145177))

(assert (=> b!126050 m!147195))

(assert (=> d!37561 d!38127))

(assert (=> d!37561 d!37555))

(declare-fun d!38129 () Bool)

(assert (=> d!38129 (= (apply!110 (+!163 lt!64116 (tuple2!2521 lt!64125 (minValue!2628 (v!3108 (underlying!436 thiss!992))))) lt!64111) (apply!110 lt!64116 lt!64111))))

(assert (=> d!38129 true))

(declare-fun _$34!947 () Unit!3871)

(assert (=> d!38129 (= (choose!755 lt!64116 lt!64125 (minValue!2628 (v!3108 (underlying!436 thiss!992))) lt!64111) _$34!947)))

(declare-fun bs!5234 () Bool)

(assert (= bs!5234 d!38129))

(assert (=> bs!5234 m!144937))

(assert (=> bs!5234 m!144937))

(assert (=> bs!5234 m!144939))

(assert (=> bs!5234 m!144923))

(assert (=> d!37561 d!38129))

(assert (=> d!37599 d!37771))

(assert (=> bm!13355 d!37829))

(declare-fun d!38131 () Bool)

(assert (=> d!38131 (= (get!1449 (getValueByKey!167 (toList!831 lt!64108) #b1000000000000000000000000000000000000000000000000000000000000000)) (v!3114 (getValueByKey!167 (toList!831 lt!64108) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!37605 d!38131))

(assert (=> d!37605 d!37665))

(assert (=> b!125060 d!37633))

(declare-fun mapNonEmpty!4487 () Bool)

(declare-fun mapRes!4487 () Bool)

(declare-fun tp!10931 () Bool)

(declare-fun e!82319 () Bool)

(assert (=> mapNonEmpty!4487 (= mapRes!4487 (and tp!10931 e!82319))))

(declare-fun mapKey!4487 () (_ BitVec 32))

(declare-fun mapValue!4487 () ValueCell!1073)

(declare-fun mapRest!4487 () (Array (_ BitVec 32) ValueCell!1073))

(assert (=> mapNonEmpty!4487 (= mapRest!4486 (store mapRest!4487 mapKey!4487 mapValue!4487))))

(declare-fun condMapEmpty!4487 () Bool)

(declare-fun mapDefault!4487 () ValueCell!1073)

(assert (=> mapNonEmpty!4486 (= condMapEmpty!4487 (= mapRest!4486 ((as const (Array (_ BitVec 32) ValueCell!1073)) mapDefault!4487)))))

(declare-fun e!82320 () Bool)

(assert (=> mapNonEmpty!4486 (= tp!10930 (and e!82320 mapRes!4487))))

(declare-fun b!126051 () Bool)

(assert (=> b!126051 (= e!82319 tp_is_empty!2833)))

(declare-fun mapIsEmpty!4487 () Bool)

(assert (=> mapIsEmpty!4487 mapRes!4487))

(declare-fun b!126052 () Bool)

(assert (=> b!126052 (= e!82320 tp_is_empty!2833)))

(assert (= (and mapNonEmpty!4486 condMapEmpty!4487) mapIsEmpty!4487))

(assert (= (and mapNonEmpty!4486 (not condMapEmpty!4487)) mapNonEmpty!4487))

(assert (= (and mapNonEmpty!4487 ((_ is ValueCellFull!1073) mapValue!4487)) b!126051))

(assert (= (and mapNonEmpty!4486 ((_ is ValueCellFull!1073) mapDefault!4487)) b!126052))

(declare-fun m!147197 () Bool)

(assert (=> mapNonEmpty!4487 m!147197))

(declare-fun mapNonEmpty!4488 () Bool)

(declare-fun mapRes!4488 () Bool)

(declare-fun tp!10932 () Bool)

(declare-fun e!82321 () Bool)

(assert (=> mapNonEmpty!4488 (= mapRes!4488 (and tp!10932 e!82321))))

(declare-fun mapRest!4488 () (Array (_ BitVec 32) ValueCell!1073))

(declare-fun mapValue!4488 () ValueCell!1073)

(declare-fun mapKey!4488 () (_ BitVec 32))

(assert (=> mapNonEmpty!4488 (= mapRest!4485 (store mapRest!4488 mapKey!4488 mapValue!4488))))

(declare-fun condMapEmpty!4488 () Bool)

(declare-fun mapDefault!4488 () ValueCell!1073)

(assert (=> mapNonEmpty!4485 (= condMapEmpty!4488 (= mapRest!4485 ((as const (Array (_ BitVec 32) ValueCell!1073)) mapDefault!4488)))))

(declare-fun e!82322 () Bool)

(assert (=> mapNonEmpty!4485 (= tp!10929 (and e!82322 mapRes!4488))))

(declare-fun b!126053 () Bool)

(assert (=> b!126053 (= e!82321 tp_is_empty!2833)))

(declare-fun mapIsEmpty!4488 () Bool)

(assert (=> mapIsEmpty!4488 mapRes!4488))

(declare-fun b!126054 () Bool)

(assert (=> b!126054 (= e!82322 tp_is_empty!2833)))

(assert (= (and mapNonEmpty!4485 condMapEmpty!4488) mapIsEmpty!4488))

(assert (= (and mapNonEmpty!4485 (not condMapEmpty!4488)) mapNonEmpty!4488))

(assert (= (and mapNonEmpty!4488 ((_ is ValueCellFull!1073) mapValue!4488)) b!126053))

(assert (= (and mapNonEmpty!4485 ((_ is ValueCellFull!1073) mapDefault!4488)) b!126054))

(declare-fun m!147199 () Bool)

(assert (=> mapNonEmpty!4488 m!147199))

(declare-fun b_lambda!5537 () Bool)

(assert (= b_lambda!5515 (or (and b!124545 b_free!2833) (and b!124538 b_free!2835 (= (defaultEntry!2763 newMap!16) (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))))) b_lambda!5537)))

(declare-fun b_lambda!5539 () Bool)

(assert (= b_lambda!5511 (or (and b!124545 b_free!2833 (= (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) (defaultEntry!2763 newMap!16))) (and b!124538 b_free!2835) b_lambda!5539)))

(declare-fun b_lambda!5541 () Bool)

(assert (= b_lambda!5529 (or (and b!124545 b_free!2833 (= (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) (defaultEntry!2763 newMap!16))) (and b!124538 b_free!2835) b_lambda!5541)))

(declare-fun b_lambda!5543 () Bool)

(assert (= b_lambda!5507 (or (and b!124545 b_free!2833 (= (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) (defaultEntry!2763 newMap!16))) (and b!124538 b_free!2835) b_lambda!5543)))

(declare-fun b_lambda!5545 () Bool)

(assert (= b_lambda!5525 (or (and b!124545 b_free!2833 (= (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) (defaultEntry!2763 newMap!16))) (and b!124538 b_free!2835) b_lambda!5545)))

(declare-fun b_lambda!5547 () Bool)

(assert (= b_lambda!5519 (or (and b!124545 b_free!2833 (= (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) (defaultEntry!2763 newMap!16))) (and b!124538 b_free!2835) b_lambda!5547)))

(declare-fun b_lambda!5549 () Bool)

(assert (= b_lambda!5527 (or (and b!124545 b_free!2833 (= (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) (defaultEntry!2763 newMap!16))) (and b!124538 b_free!2835) b_lambda!5549)))

(declare-fun b_lambda!5551 () Bool)

(assert (= b_lambda!5535 (or (and b!124545 b_free!2833 (= (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) (defaultEntry!2763 newMap!16))) (and b!124538 b_free!2835) b_lambda!5551)))

(declare-fun b_lambda!5553 () Bool)

(assert (= b_lambda!5513 (or (and b!124545 b_free!2833 (= (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) (defaultEntry!2763 newMap!16))) (and b!124538 b_free!2835) b_lambda!5553)))

(declare-fun b_lambda!5555 () Bool)

(assert (= b_lambda!5533 (or (and b!124545 b_free!2833 (= (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) (defaultEntry!2763 newMap!16))) (and b!124538 b_free!2835) b_lambda!5555)))

(declare-fun b_lambda!5557 () Bool)

(assert (= b_lambda!5517 (or (and b!124545 b_free!2833) (and b!124538 b_free!2835 (= (defaultEntry!2763 newMap!16) (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))))) b_lambda!5557)))

(declare-fun b_lambda!5559 () Bool)

(assert (= b_lambda!5509 (or (and b!124545 b_free!2833 (= (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) (defaultEntry!2763 newMap!16))) (and b!124538 b_free!2835) b_lambda!5559)))

(declare-fun b_lambda!5561 () Bool)

(assert (= b_lambda!5531 (or (and b!124545 b_free!2833 (= (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) (defaultEntry!2763 newMap!16))) (and b!124538 b_free!2835) b_lambda!5561)))

(declare-fun b_lambda!5563 () Bool)

(assert (= b_lambda!5521 (or (and b!124545 b_free!2833 (= (defaultEntry!2763 (v!3108 (underlying!436 thiss!992))) (defaultEntry!2763 newMap!16))) (and b!124538 b_free!2835) b_lambda!5563)))

(check-sat (not b!125426) (not b!126031) (not b!125985) (not d!38085) (not b!125700) (not b!125831) (not b!125544) (not b!125848) (not d!37713) (not b!125825) (not d!37895) (not d!37891) (not b!125532) (not b!125817) (not b!126046) (not b!125489) (not b!125243) (not b!125534) (not b!125368) (not b!126018) (not b!125641) (not d!37925) (not b!125835) (not d!37879) (not d!37781) (not b!125883) (not d!37685) (not b!125382) (not b!125643) (not b!125475) (not b_lambda!5547) (not b!125859) (not b!125576) (not b!125858) (not d!37759) (not b!125661) (not b!125555) (not bm!13477) (not b!125752) (not d!37779) (not b!126042) (not b!125337) (not b_lambda!5551) (not d!38065) (not b!125248) (not b!125733) (not d!37655) (not b!125600) (not b!126005) (not d!37897) (not b!125272) (not b!125995) (not b!125870) (not b!125724) (not b!125602) (not d!37689) (not b_lambda!5497) (not bm!13455) (not d!37801) (not b!126012) (not b!125241) (not b!125264) (not d!37743) (not bm!13428) (not b!125672) (not bm!13456) (not d!37693) (not b!125966) (not bm!13478) (not b!125585) (not d!37945) (not bm!13411) (not d!38053) (not b!125785) (not d!38125) (not b!125581) (not d!38049) (not bm!13418) (not b!125261) (not mapNonEmpty!4487) (not b!125257) (not bm!13444) (not bm!13458) (not d!37919) (not b!125988) (not b!125502) (not b!125656) (not b_lambda!5557) (not d!38029) (not bm!13463) (not d!37717) (not b!125550) (not b!125536) (not d!37877) (not b!125652) (not bm!13430) (not d!37741) (not d!37737) (not b_lambda!5537) (not bm!13491) (not d!37875) (not d!37997) (not b!125640) (not d!37859) (not bm!13483) (not b!125508) (not b!125447) (not b_lambda!5499) (not b!125486) (not d!37765) (not d!37805) (not b!125667) (not bm!13396) (not b!125853) (not b!125278) (not b!125441) (not d!38023) (not b!125323) (not b!125521) (not b!125280) (not d!37745) (not b!125245) (not b!125697) (not b!125504) (not b!125467) (not d!38043) (not b!125927) (not b!125402) (not d!37817) (not b_lambda!5539) (not d!37831) (not b!125364) (not b!125613) (not b_lambda!5561) (not d!38117) (not d!37943) (not b!125548) (not b!125901) (not d!37761) (not b!125251) (not b!125776) (not b_lambda!5553) (not b!125918) (not b!125873) (not b!125787) (not d!37739) (not b!125721) (not d!37697) (not bm!13443) (not b!125443) (not b!126029) (not d!37865) (not bm!13479) (not b!125327) (not d!37725) (not d!37931) (not b!125561) (not b!125235) (not bm!13469) (not b!125321) (not d!38093) (not b_lambda!5541) (not b!125253) (not d!37703) (not b!125742) (not b!125380) (not d!37753) (not b!125645) (not b!125226) (not b!125485) (not d!37951) (not b!125274) (not b!126034) (not b!125562) (not b!125658) (not b_next!2833) (not b!125390) (not d!37955) (not b!125687) (not bm!13429) (not d!37863) (not d!37821) (not b!125594) (not b!125615) (not b!125348) (not d!38033) (not b_lambda!5505) (not b!125815) (not b!125399) (not b!125975) (not d!37871) (not b!125524) (not d!38081) (not d!37721) (not d!38041) (not b!125748) (not d!38013) (not b_next!2835) (not b!125499) (not d!37757) (not b!125435) (not d!37657) (not d!38095) (not d!37937) (not d!37889) tp_is_empty!2833 (not b!125526) (not bm!13494) (not b!125506) (not b!125552) (not b!125545) (not bm!13466) (not d!37833) (not b!125577) (not bm!13447) (not b!125219) (not b!125428) (not b!125387) (not b_lambda!5481) (not b!125639) (not b!125694) (not b!125990) (not b!125277) (not d!37669) (not b!125362) (not bm!13419) (not b!125989) (not b!125986) (not bm!13453) (not b!125217) (not d!38101) (not d!37827) (not b!126010) (not d!38071) (not d!37843) (not d!37967) (not b!125361) (not b!125252) (not b!125930) (not b!125735) (not d!38017) (not b!125967) (not b!125565) (not b!125540) (not b!125855) (not b!126040) (not b!125270) (not d!37819) (not bm!13470) (not b!125642) (not b!126026) (not b!125575) (not b!125621) (not b!125474) (not b!125914) (not b!125693) (not b!125512) (not b!125823) (not bm!13471) (not d!37773) (not b!125631) (not bm!13482) (not d!37939) (not b!125634) (not b!125834) (not d!37933) b_and!7755 (not b!125438) (not d!38061) (not bm!13452) (not b!125882) (not b!125237) (not d!37681) (not b!125518) (not b!125849) (not d!37673) (not b!126001) (not b!125596) (not d!37667) (not bm!13417) (not b!125591) (not b!125997) (not b!125539) (not b!125889) (not bm!13451) (not b!125666) (not d!37989) (not d!38127) (not b!125821) (not d!37809) (not b!125511) (not d!37767) (not b_lambda!5501) (not b!125410) (not b!125481) (not b!126050) b_and!7753 (not b!125675) (not b!125822) (not b!125354) (not b!125288) (not b!125451) (not d!37719) (not b!125810) (not b!125792) (not d!37751) (not b!125530) (not b!125782) (not b!125297) (not d!37903) (not b!125660) (not b!125669) (not b!125844) (not d!37953) (not bm!13459) (not b!125267) (not b!125791) (not d!37813) (not bm!13414) (not b!125808) (not b!125357) (not d!37755) (not b!125628) (not d!37993) (not b!125794) (not d!38123) (not d!37795) (not b!125449) (not b!125719) (not b!125659) (not b!125702) (not d!37641) (not b!125541) (not b!125824) (not b!125928) (not b!125405) (not b!125472) (not d!37987) (not b!125529) (not d!38099) (not b!125335) (not b!125384) (not b!125590) (not b!125477) (not b!125916) (not d!38025) (not d!38077) (not b!125263) (not b!125483) (not b!125879) (not b!125265) (not bm!13395) (not d!37851) (not b!125917) (not d!38075) (not b!125479) (not b!125924) (not d!37797) (not d!38121) (not d!37845) (not bm!13464) (not d!37885) (not b_lambda!5549) (not b!125578) (not d!37975) (not d!37947) (not b!125583) (not b!125557) (not d!37677) (not d!37823) (not b!125969) (not d!37927) (not b!125397) (not d!37683) (not b!125395) (not b!125538) (not b!125523) (not b!125392) (not b!125510) (not b!125903) (not bm!13445) (not d!38097) (not b!125795) (not b!125880) (not b!125404) (not b!125619) (not bm!13484) (not b!125338) (not b!125339) (not b!126019) (not b!125688) (not b!125965) (not b!125646) (not b!126016) (not d!37883) (not b!125616) (not d!37969) (not b!125910) (not d!38073) (not b!125482) (not d!37881) (not bm!13490) (not d!38079) (not d!37829) (not b!125515) (not b!125730) (not b_lambda!5555) (not d!37749) (not b!125249) (not b!125781) (not b!125629) (not d!37913) (not b!125542) (not b!125345) (not b!125419) (not b!125507) (not b!125422) (not d!38031) (not b!125222) (not d!37999) (not b!125564) (not b!125527) (not b!125861) (not b!125703) (not b!126048) (not b!125417) (not b!125498) (not d!38045) (not d!37847) (not d!37769) (not bm!13462) (not b!125842) (not bm!13436) (not b!125525) (not b!126037) (not bm!13457) (not b!125722) (not b!125233) (not b!125695) (not b!125363) (not d!37979) (not b_lambda!5485) (not d!38039) (not d!37699) (not bm!13413) (not b!125727) (not d!37631) (not b!125291) (not b!125793) (not bm!13421) (not d!37911) (not b!125342) (not b_lambda!5545) (not b!125812) (not b!125737) (not b!125715) (not d!37985) (not d!37923) (not b!125225) (not bm!13397) (not b!125281) (not b!125633) (not b!125984) (not b!125674) (not bm!13412) (not b!125743) (not b!125429) (not d!37653) (not b!125607) (not b!125729) (not d!38003) (not b!125805) (not d!37857) (not b!125369) (not b!125608) (not d!37691) (not b!125635) (not b!125983) (not b!125732) (not b!125740) (not bm!13408) (not d!37887) (not b!126007) (not d!37901) (not d!38009) (not b!125413) (not d!37663) (not b!125716) (not b!125500) (not d!37899) (not d!38063) (not b!125908) (not b!125244) (not b_lambda!5543) (not d!37651) (not d!37915) (not b!125801) (not d!38129) (not b!126020) (not b!125746) (not b!125284) (not b!125375) (not d!38115) (not b!125228) (not b!125229) (not b!125259) (not bm!13398) (not d!37671) (not b!125224) (not d!38021) (not mapNonEmpty!4488) (not d!38113) (not bm!13424) (not b!125968) (not b!125334) (not bm!13486) (not bm!13433) (not b_lambda!5503) (not b!125408) (not d!37709) (not d!38083) (not d!37675) (not b!125543) (not b!125269) (not b!125356) (not b!125867) (not b!125708) (not b!125246) (not b!125806) (not b!125900) (not d!37893) (not d!37687) (not d!38091) (not b!125588) (not b!125496) (not b!125905) (not b!125359) (not b!125680) (not d!37981) (not d!37679) (not bm!13487) (not b!125637) (not b!125256) (not b!125955) (not b!125283) (not b!126017) (not b!125684) (not b!125712) (not bm!13437) (not d!37907) (not b!126036) (not d!38059) (not b!125959) (not b!125247) (not b!125276) (not bm!13405) (not d!37635) (not b!125915) (not d!37785) (not b_lambda!5563) (not d!37949) (not b!125690) (not d!37711) (not b!125415) (not d!37791) (not d!37731) (not b!125437) (not b!125625) (not b!125571) (not bm!13448) (not d!37837) (not b!125875) (not bm!13492) (not b!125610) (not b!125881) (not d!37873) (not b!125678) (not b!125298) (not d!38035) (not bm!13440) (not d!37777) (not b!125706) (not d!37707) (not b!125563) (not d!37695) (not b!125956) (not d!37763) (not b!125840) (not d!37909) (not b_lambda!5559) (not d!37747) (not b_lambda!5523) (not bm!13425) (not d!38067) (not b!125432) (not d!37727) (not b!125980) (not b!125286) (not b!125856) (not b!125365) (not b!125421) (not b!125961) (not b!125430) (not b!125692))
(check-sat b_and!7753 b_and!7755 (not b_next!2833) (not b_next!2835))
