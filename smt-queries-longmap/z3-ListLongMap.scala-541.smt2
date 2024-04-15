; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!13964 () Bool)

(assert start!13964)

(declare-fun b!129281 () Bool)

(declare-fun b_free!2881 () Bool)

(declare-fun b_next!2881 () Bool)

(assert (=> b!129281 (= b_free!2881 (not b_next!2881))))

(declare-fun tp!11067 () Bool)

(declare-fun b_and!7977 () Bool)

(assert (=> b!129281 (= tp!11067 b_and!7977)))

(declare-fun b!129277 () Bool)

(declare-fun b_free!2883 () Bool)

(declare-fun b_next!2883 () Bool)

(assert (=> b!129277 (= b_free!2883 (not b_next!2883))))

(declare-fun tp!11065 () Bool)

(declare-fun b_and!7979 () Bool)

(assert (=> b!129277 (= tp!11065 b_and!7979)))

(declare-fun e!84370 () Bool)

(declare-fun e!84373 () Bool)

(declare-datatypes ((V!3457 0))(
  ( (V!3458 (val!1473 Int)) )
))
(declare-datatypes ((array!4715 0))(
  ( (array!4716 (arr!2230 (Array (_ BitVec 32) (_ BitVec 64))) (size!2497 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1085 0))(
  ( (ValueCellFull!1085 (v!3152 V!3457)) (EmptyCell!1085) )
))
(declare-datatypes ((array!4717 0))(
  ( (array!4718 (arr!2231 (Array (_ BitVec 32) ValueCell!1085)) (size!2498 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1078 0))(
  ( (LongMapFixedSize!1079 (defaultEntry!2823 Int) (mask!7100 (_ BitVec 32)) (extraKeys!2596 (_ BitVec 32)) (zeroValue!2682 V!3457) (minValue!2682 V!3457) (_size!588 (_ BitVec 32)) (_keys!4563 array!4715) (_values!2806 array!4717) (_vacant!588 (_ BitVec 32))) )
))
(declare-fun newMap!16 () LongMapFixedSize!1078)

(declare-fun tp_is_empty!2857 () Bool)

(declare-fun array_inv!1419 (array!4715) Bool)

(declare-fun array_inv!1420 (array!4717) Bool)

(assert (=> b!129277 (= e!84370 (and tp!11065 tp_is_empty!2857 (array_inv!1419 (_keys!4563 newMap!16)) (array_inv!1420 (_values!2806 newMap!16)) e!84373))))

(declare-fun mapIsEmpty!4563 () Bool)

(declare-fun mapRes!4564 () Bool)

(assert (=> mapIsEmpty!4563 mapRes!4564))

(declare-fun b!129278 () Bool)

(declare-fun e!84364 () Bool)

(assert (=> b!129278 (= e!84364 tp_is_empty!2857)))

(declare-fun mapIsEmpty!4564 () Bool)

(declare-fun mapRes!4563 () Bool)

(assert (=> mapIsEmpty!4564 mapRes!4563))

(declare-fun b!129279 () Bool)

(declare-fun res!62362 () Bool)

(declare-fun e!84375 () Bool)

(assert (=> b!129279 (=> (not res!62362) (not e!84375))))

(declare-datatypes ((Cell!862 0))(
  ( (Cell!863 (v!3153 LongMapFixedSize!1078)) )
))
(declare-datatypes ((LongMap!862 0))(
  ( (LongMap!863 (underlying!442 Cell!862)) )
))
(declare-fun thiss!992 () LongMap!862)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!129279 (= res!62362 (validMask!0 (mask!7100 (v!3153 (underlying!442 thiss!992)))))))

(declare-fun b!129280 () Bool)

(declare-fun e!84365 () Bool)

(declare-fun e!84367 () Bool)

(assert (=> b!129280 (= e!84365 e!84367)))

(declare-fun b!129282 () Bool)

(declare-fun e!84368 () Bool)

(assert (=> b!129282 (= e!84368 e!84375)))

(declare-fun res!62360 () Bool)

(assert (=> b!129282 (=> (not res!62360) (not e!84375))))

(declare-fun from!355 () (_ BitVec 32))

(declare-datatypes ((tuple2!2566 0))(
  ( (tuple2!2567 (_1!1294 (_ BitVec 64)) (_2!1294 V!3457)) )
))
(declare-datatypes ((List!1701 0))(
  ( (Nil!1698) (Cons!1697 (h!2301 tuple2!2566) (t!6091 List!1701)) )
))
(declare-datatypes ((ListLongMap!1661 0))(
  ( (ListLongMap!1662 (toList!846 List!1701)) )
))
(declare-fun lt!66993 () ListLongMap!1661)

(declare-fun contains!876 (ListLongMap!1661 (_ BitVec 64)) Bool)

(assert (=> b!129282 (= res!62360 (contains!876 lt!66993 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355)))))

(declare-datatypes ((tuple2!2568 0))(
  ( (tuple2!2569 (_1!1295 Bool) (_2!1295 LongMapFixedSize!1078)) )
))
(declare-fun lt!66992 () tuple2!2568)

(declare-fun update!188 (LongMapFixedSize!1078 (_ BitVec 64) V!3457) tuple2!2568)

(declare-fun get!1459 (ValueCell!1085 V!3457) V!3457)

(declare-fun dynLambda!414 (Int (_ BitVec 64)) V!3457)

(assert (=> b!129282 (= lt!66992 (update!188 newMap!16 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!129283 () Bool)

(declare-fun res!62363 () Bool)

(declare-fun e!84363 () Bool)

(assert (=> b!129283 (=> (not res!62363) (not e!84363))))

(assert (=> b!129283 (= res!62363 (bvsge (bvadd #b00000000000000000000000000000001 (mask!7100 newMap!16)) (_size!588 (v!3153 (underlying!442 thiss!992)))))))

(declare-fun mapNonEmpty!4563 () Bool)

(declare-fun tp!11066 () Bool)

(assert (=> mapNonEmpty!4563 (= mapRes!4563 (and tp!11066 e!84364))))

(declare-fun mapValue!4563 () ValueCell!1085)

(declare-fun mapKey!4564 () (_ BitVec 32))

(declare-fun mapRest!4563 () (Array (_ BitVec 32) ValueCell!1085))

(assert (=> mapNonEmpty!4563 (= (arr!2231 (_values!2806 newMap!16)) (store mapRest!4563 mapKey!4564 mapValue!4563))))

(declare-fun b!129284 () Bool)

(assert (=> b!129284 (= e!84363 e!84368)))

(declare-fun res!62359 () Bool)

(assert (=> b!129284 (=> (not res!62359) (not e!84368))))

(declare-fun lt!66991 () ListLongMap!1661)

(assert (=> b!129284 (= res!62359 (and (= lt!66991 lt!66993) (not (= (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun map!1381 (LongMapFixedSize!1078) ListLongMap!1661)

(assert (=> b!129284 (= lt!66993 (map!1381 newMap!16))))

(declare-fun getCurrentListMap!515 (array!4715 array!4717 (_ BitVec 32) (_ BitVec 32) V!3457 V!3457 (_ BitVec 32) Int) ListLongMap!1661)

(assert (=> b!129284 (= lt!66991 (getCurrentListMap!515 (_keys!4563 (v!3153 (underlying!442 thiss!992))) (_values!2806 (v!3153 (underlying!442 thiss!992))) (mask!7100 (v!3153 (underlying!442 thiss!992))) (extraKeys!2596 (v!3153 (underlying!442 thiss!992))) (zeroValue!2682 (v!3153 (underlying!442 thiss!992))) (minValue!2682 (v!3153 (underlying!442 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2823 (v!3153 (underlying!442 thiss!992)))))))

(declare-fun b!129285 () Bool)

(declare-fun res!62365 () Bool)

(assert (=> b!129285 (=> (not res!62365) (not e!84363))))

(declare-fun valid!521 (LongMapFixedSize!1078) Bool)

(assert (=> b!129285 (= res!62365 (valid!521 newMap!16))))

(declare-fun b!129286 () Bool)

(declare-fun e!84374 () Bool)

(declare-fun e!84362 () Bool)

(assert (=> b!129286 (= e!84374 (and e!84362 mapRes!4564))))

(declare-fun condMapEmpty!4563 () Bool)

(declare-fun mapDefault!4564 () ValueCell!1085)

(assert (=> b!129286 (= condMapEmpty!4563 (= (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!1085)) mapDefault!4564)))))

(declare-fun b!129287 () Bool)

(assert (=> b!129287 (= e!84375 (and (= (size!2498 (_values!2806 (v!3153 (underlying!442 thiss!992)))) (bvadd #b00000000000000000000000000000001 (mask!7100 (v!3153 (underlying!442 thiss!992))))) (= (size!2497 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) (size!2498 (_values!2806 (v!3153 (underlying!442 thiss!992))))) (bvsge (mask!7100 (v!3153 (underlying!442 thiss!992))) #b00000000000000000000000000000000) (bvsge (extraKeys!2596 (v!3153 (underlying!442 thiss!992))) #b00000000000000000000000000000000) (bvsgt (extraKeys!2596 (v!3153 (underlying!442 thiss!992))) #b00000000000000000000000000000011)))))

(declare-fun b!129288 () Bool)

(declare-fun e!84369 () Bool)

(assert (=> b!129288 (= e!84369 tp_is_empty!2857)))

(declare-fun b!129289 () Bool)

(assert (=> b!129289 (= e!84362 tp_is_empty!2857)))

(declare-fun b!129290 () Bool)

(declare-fun e!84371 () Bool)

(assert (=> b!129290 (= e!84371 tp_is_empty!2857)))

(declare-fun b!129291 () Bool)

(assert (=> b!129291 (= e!84373 (and e!84369 mapRes!4563))))

(declare-fun condMapEmpty!4564 () Bool)

(declare-fun mapDefault!4563 () ValueCell!1085)

(assert (=> b!129291 (= condMapEmpty!4564 (= (arr!2231 (_values!2806 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!1085)) mapDefault!4563)))))

(declare-fun b!129292 () Bool)

(declare-fun res!62364 () Bool)

(assert (=> b!129292 (=> (not res!62364) (not e!84363))))

(assert (=> b!129292 (= res!62364 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2497 (_keys!4563 (v!3153 (underlying!442 thiss!992)))))))))

(declare-fun res!62361 () Bool)

(assert (=> start!13964 (=> (not res!62361) (not e!84363))))

(declare-fun valid!522 (LongMap!862) Bool)

(assert (=> start!13964 (= res!62361 (valid!522 thiss!992))))

(assert (=> start!13964 e!84363))

(assert (=> start!13964 e!84365))

(assert (=> start!13964 true))

(assert (=> start!13964 e!84370))

(declare-fun e!84376 () Bool)

(assert (=> b!129281 (= e!84376 (and tp!11067 tp_is_empty!2857 (array_inv!1419 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) (array_inv!1420 (_values!2806 (v!3153 (underlying!442 thiss!992)))) e!84374))))

(declare-fun b!129293 () Bool)

(assert (=> b!129293 (= e!84367 e!84376)))

(declare-fun mapNonEmpty!4564 () Bool)

(declare-fun tp!11068 () Bool)

(assert (=> mapNonEmpty!4564 (= mapRes!4564 (and tp!11068 e!84371))))

(declare-fun mapKey!4563 () (_ BitVec 32))

(declare-fun mapRest!4564 () (Array (_ BitVec 32) ValueCell!1085))

(declare-fun mapValue!4564 () ValueCell!1085)

(assert (=> mapNonEmpty!4564 (= (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) (store mapRest!4564 mapKey!4563 mapValue!4564))))

(assert (= (and start!13964 res!62361) b!129292))

(assert (= (and b!129292 res!62364) b!129285))

(assert (= (and b!129285 res!62365) b!129283))

(assert (= (and b!129283 res!62363) b!129284))

(assert (= (and b!129284 res!62359) b!129282))

(assert (= (and b!129282 res!62360) b!129279))

(assert (= (and b!129279 res!62362) b!129287))

(assert (= (and b!129286 condMapEmpty!4563) mapIsEmpty!4563))

(assert (= (and b!129286 (not condMapEmpty!4563)) mapNonEmpty!4564))

(get-info :version)

(assert (= (and mapNonEmpty!4564 ((_ is ValueCellFull!1085) mapValue!4564)) b!129290))

(assert (= (and b!129286 ((_ is ValueCellFull!1085) mapDefault!4564)) b!129289))

(assert (= b!129281 b!129286))

(assert (= b!129293 b!129281))

(assert (= b!129280 b!129293))

(assert (= start!13964 b!129280))

(assert (= (and b!129291 condMapEmpty!4564) mapIsEmpty!4564))

(assert (= (and b!129291 (not condMapEmpty!4564)) mapNonEmpty!4563))

(assert (= (and mapNonEmpty!4563 ((_ is ValueCellFull!1085) mapValue!4563)) b!129278))

(assert (= (and b!129291 ((_ is ValueCellFull!1085) mapDefault!4563)) b!129288))

(assert (= b!129277 b!129291))

(assert (= start!13964 b!129277))

(declare-fun b_lambda!5731 () Bool)

(assert (=> (not b_lambda!5731) (not b!129282)))

(declare-fun t!6088 () Bool)

(declare-fun tb!2353 () Bool)

(assert (=> (and b!129281 (= (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) (defaultEntry!2823 (v!3153 (underlying!442 thiss!992)))) t!6088) tb!2353))

(declare-fun result!3897 () Bool)

(assert (=> tb!2353 (= result!3897 tp_is_empty!2857)))

(assert (=> b!129282 t!6088))

(declare-fun b_and!7981 () Bool)

(assert (= b_and!7977 (and (=> t!6088 result!3897) b_and!7981)))

(declare-fun tb!2355 () Bool)

(declare-fun t!6090 () Bool)

(assert (=> (and b!129277 (= (defaultEntry!2823 newMap!16) (defaultEntry!2823 (v!3153 (underlying!442 thiss!992)))) t!6090) tb!2355))

(declare-fun result!3901 () Bool)

(assert (= result!3901 result!3897))

(assert (=> b!129282 t!6090))

(declare-fun b_and!7983 () Bool)

(assert (= b_and!7979 (and (=> t!6090 result!3901) b_and!7983)))

(declare-fun m!151747 () Bool)

(assert (=> b!129282 m!151747))

(declare-fun m!151749 () Bool)

(assert (=> b!129282 m!151749))

(declare-fun m!151751 () Bool)

(assert (=> b!129282 m!151751))

(declare-fun m!151753 () Bool)

(assert (=> b!129282 m!151753))

(assert (=> b!129282 m!151749))

(assert (=> b!129282 m!151753))

(declare-fun m!151755 () Bool)

(assert (=> b!129282 m!151755))

(assert (=> b!129282 m!151753))

(assert (=> b!129282 m!151751))

(declare-fun m!151757 () Bool)

(assert (=> b!129282 m!151757))

(assert (=> b!129282 m!151747))

(declare-fun m!151759 () Bool)

(assert (=> b!129277 m!151759))

(declare-fun m!151761 () Bool)

(assert (=> b!129277 m!151761))

(declare-fun m!151763 () Bool)

(assert (=> mapNonEmpty!4563 m!151763))

(declare-fun m!151765 () Bool)

(assert (=> b!129281 m!151765))

(declare-fun m!151767 () Bool)

(assert (=> b!129281 m!151767))

(declare-fun m!151769 () Bool)

(assert (=> b!129279 m!151769))

(declare-fun m!151771 () Bool)

(assert (=> b!129285 m!151771))

(declare-fun m!151773 () Bool)

(assert (=> mapNonEmpty!4564 m!151773))

(assert (=> b!129284 m!151753))

(declare-fun m!151775 () Bool)

(assert (=> b!129284 m!151775))

(declare-fun m!151777 () Bool)

(assert (=> b!129284 m!151777))

(declare-fun m!151779 () Bool)

(assert (=> start!13964 m!151779))

(check-sat (not b_lambda!5731) (not b!129281) (not b!129285) (not start!13964) (not b!129279) (not b!129277) (not b!129282) (not mapNonEmpty!4563) (not mapNonEmpty!4564) b_and!7981 b_and!7983 (not b_next!2883) (not b!129284) tp_is_empty!2857 (not b_next!2881))
(check-sat b_and!7981 b_and!7983 (not b_next!2881) (not b_next!2883))
(get-model)

(declare-fun b_lambda!5737 () Bool)

(assert (= b_lambda!5731 (or (and b!129281 b_free!2881) (and b!129277 b_free!2883 (= (defaultEntry!2823 newMap!16) (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))))) b_lambda!5737)))

(check-sat (not b_lambda!5737) (not b!129281) (not b!129285) (not start!13964) (not b!129279) (not b!129277) (not b!129282) (not mapNonEmpty!4563) (not mapNonEmpty!4564) b_and!7981 b_and!7983 (not b_next!2883) (not b!129284) tp_is_empty!2857 (not b_next!2881))
(check-sat b_and!7981 b_and!7983 (not b_next!2881) (not b_next!2883))
(get-model)

(declare-fun d!39311 () Bool)

(assert (=> d!39311 (= (validMask!0 (mask!7100 (v!3153 (underlying!442 thiss!992)))) (and (or (= (mask!7100 (v!3153 (underlying!442 thiss!992))) #b00000000000000000000000000000111) (= (mask!7100 (v!3153 (underlying!442 thiss!992))) #b00000000000000000000000000001111) (= (mask!7100 (v!3153 (underlying!442 thiss!992))) #b00000000000000000000000000011111) (= (mask!7100 (v!3153 (underlying!442 thiss!992))) #b00000000000000000000000000111111) (= (mask!7100 (v!3153 (underlying!442 thiss!992))) #b00000000000000000000000001111111) (= (mask!7100 (v!3153 (underlying!442 thiss!992))) #b00000000000000000000000011111111) (= (mask!7100 (v!3153 (underlying!442 thiss!992))) #b00000000000000000000000111111111) (= (mask!7100 (v!3153 (underlying!442 thiss!992))) #b00000000000000000000001111111111) (= (mask!7100 (v!3153 (underlying!442 thiss!992))) #b00000000000000000000011111111111) (= (mask!7100 (v!3153 (underlying!442 thiss!992))) #b00000000000000000000111111111111) (= (mask!7100 (v!3153 (underlying!442 thiss!992))) #b00000000000000000001111111111111) (= (mask!7100 (v!3153 (underlying!442 thiss!992))) #b00000000000000000011111111111111) (= (mask!7100 (v!3153 (underlying!442 thiss!992))) #b00000000000000000111111111111111) (= (mask!7100 (v!3153 (underlying!442 thiss!992))) #b00000000000000001111111111111111) (= (mask!7100 (v!3153 (underlying!442 thiss!992))) #b00000000000000011111111111111111) (= (mask!7100 (v!3153 (underlying!442 thiss!992))) #b00000000000000111111111111111111) (= (mask!7100 (v!3153 (underlying!442 thiss!992))) #b00000000000001111111111111111111) (= (mask!7100 (v!3153 (underlying!442 thiss!992))) #b00000000000011111111111111111111) (= (mask!7100 (v!3153 (underlying!442 thiss!992))) #b00000000000111111111111111111111) (= (mask!7100 (v!3153 (underlying!442 thiss!992))) #b00000000001111111111111111111111) (= (mask!7100 (v!3153 (underlying!442 thiss!992))) #b00000000011111111111111111111111) (= (mask!7100 (v!3153 (underlying!442 thiss!992))) #b00000000111111111111111111111111) (= (mask!7100 (v!3153 (underlying!442 thiss!992))) #b00000001111111111111111111111111) (= (mask!7100 (v!3153 (underlying!442 thiss!992))) #b00000011111111111111111111111111) (= (mask!7100 (v!3153 (underlying!442 thiss!992))) #b00000111111111111111111111111111) (= (mask!7100 (v!3153 (underlying!442 thiss!992))) #b00001111111111111111111111111111) (= (mask!7100 (v!3153 (underlying!442 thiss!992))) #b00011111111111111111111111111111) (= (mask!7100 (v!3153 (underlying!442 thiss!992))) #b00111111111111111111111111111111)) (bvsle (mask!7100 (v!3153 (underlying!442 thiss!992))) #b00111111111111111111111111111111)))))

(assert (=> b!129279 d!39311))

(declare-fun d!39313 () Bool)

(assert (=> d!39313 (= (map!1381 newMap!16) (getCurrentListMap!515 (_keys!4563 newMap!16) (_values!2806 newMap!16) (mask!7100 newMap!16) (extraKeys!2596 newMap!16) (zeroValue!2682 newMap!16) (minValue!2682 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2823 newMap!16)))))

(declare-fun bs!5361 () Bool)

(assert (= bs!5361 d!39313))

(declare-fun m!151849 () Bool)

(assert (=> bs!5361 m!151849))

(assert (=> b!129284 d!39313))

(declare-fun b!129444 () Bool)

(declare-fun res!62434 () Bool)

(declare-fun e!84503 () Bool)

(assert (=> b!129444 (=> (not res!62434) (not e!84503))))

(declare-fun e!84500 () Bool)

(assert (=> b!129444 (= res!62434 e!84500)))

(declare-fun res!62427 () Bool)

(assert (=> b!129444 (=> res!62427 e!84500)))

(declare-fun e!84496 () Bool)

(assert (=> b!129444 (= res!62427 (not e!84496))))

(declare-fun res!62432 () Bool)

(assert (=> b!129444 (=> (not res!62432) (not e!84496))))

(assert (=> b!129444 (= res!62432 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2497 (_keys!4563 (v!3153 (underlying!442 thiss!992))))))))

(declare-fun b!129445 () Bool)

(declare-fun e!84505 () Bool)

(declare-fun lt!67071 () ListLongMap!1661)

(declare-fun apply!113 (ListLongMap!1661 (_ BitVec 64)) V!3457)

(assert (=> b!129445 (= e!84505 (= (apply!113 lt!67071 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2682 (v!3153 (underlying!442 thiss!992)))))))

(declare-fun b!129446 () Bool)

(declare-fun e!84501 () Bool)

(assert (=> b!129446 (= e!84501 e!84505)))

(declare-fun res!62431 () Bool)

(declare-fun call!14005 () Bool)

(assert (=> b!129446 (= res!62431 call!14005)))

(assert (=> b!129446 (=> (not res!62431) (not e!84505))))

(declare-fun b!129447 () Bool)

(declare-fun e!84494 () Bool)

(assert (=> b!129447 (= e!84500 e!84494)))

(declare-fun res!62429 () Bool)

(assert (=> b!129447 (=> (not res!62429) (not e!84494))))

(assert (=> b!129447 (= res!62429 (contains!876 lt!67071 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!129447 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2497 (_keys!4563 (v!3153 (underlying!442 thiss!992))))))))

(declare-fun bm!14000 () Bool)

(declare-fun call!14008 () ListLongMap!1661)

(declare-fun call!14007 () ListLongMap!1661)

(assert (=> bm!14000 (= call!14008 call!14007)))

(declare-fun b!129448 () Bool)

(declare-fun e!84493 () Bool)

(declare-fun e!84495 () Bool)

(assert (=> b!129448 (= e!84493 e!84495)))

(declare-fun res!62430 () Bool)

(declare-fun call!14003 () Bool)

(assert (=> b!129448 (= res!62430 call!14003)))

(assert (=> b!129448 (=> (not res!62430) (not e!84495))))

(declare-fun b!129450 () Bool)

(declare-fun e!84504 () ListLongMap!1661)

(declare-fun call!14009 () ListLongMap!1661)

(assert (=> b!129450 (= e!84504 call!14009)))

(declare-fun b!129451 () Bool)

(declare-fun e!84497 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!129451 (= e!84497 (validKeyInArray!0 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun bm!14001 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!125 (array!4715 array!4717 (_ BitVec 32) (_ BitVec 32) V!3457 V!3457 (_ BitVec 32) Int) ListLongMap!1661)

(assert (=> bm!14001 (= call!14007 (getCurrentListMapNoExtraKeys!125 (_keys!4563 (v!3153 (underlying!442 thiss!992))) (_values!2806 (v!3153 (underlying!442 thiss!992))) (mask!7100 (v!3153 (underlying!442 thiss!992))) (extraKeys!2596 (v!3153 (underlying!442 thiss!992))) (zeroValue!2682 (v!3153 (underlying!442 thiss!992))) (minValue!2682 (v!3153 (underlying!442 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2823 (v!3153 (underlying!442 thiss!992)))))))

(declare-fun bm!14002 () Bool)

(assert (=> bm!14002 (= call!14003 (contains!876 lt!67071 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!129452 () Bool)

(assert (=> b!129452 (= e!84494 (= (apply!113 lt!67071 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!129452 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2498 (_values!2806 (v!3153 (underlying!442 thiss!992))))))))

(assert (=> b!129452 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2497 (_keys!4563 (v!3153 (underlying!442 thiss!992))))))))

(declare-fun b!129453 () Bool)

(assert (=> b!129453 (= e!84503 e!84493)))

(declare-fun c!23811 () Bool)

(assert (=> b!129453 (= c!23811 (not (= (bvand (extraKeys!2596 (v!3153 (underlying!442 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!129454 () Bool)

(assert (=> b!129454 (= e!84501 (not call!14005))))

(declare-fun b!129455 () Bool)

(declare-datatypes ((Unit!4037 0))(
  ( (Unit!4038) )
))
(declare-fun e!84499 () Unit!4037)

(declare-fun Unit!4039 () Unit!4037)

(assert (=> b!129455 (= e!84499 Unit!4039)))

(declare-fun b!129456 () Bool)

(declare-fun e!84502 () ListLongMap!1661)

(declare-fun call!14006 () ListLongMap!1661)

(assert (=> b!129456 (= e!84502 call!14006)))

(declare-fun bm!14003 () Bool)

(declare-fun call!14004 () ListLongMap!1661)

(assert (=> bm!14003 (= call!14006 call!14004)))

(declare-fun b!129457 () Bool)

(declare-fun lt!67065 () Unit!4037)

(assert (=> b!129457 (= e!84499 lt!67065)))

(declare-fun lt!67061 () ListLongMap!1661)

(assert (=> b!129457 (= lt!67061 (getCurrentListMapNoExtraKeys!125 (_keys!4563 (v!3153 (underlying!442 thiss!992))) (_values!2806 (v!3153 (underlying!442 thiss!992))) (mask!7100 (v!3153 (underlying!442 thiss!992))) (extraKeys!2596 (v!3153 (underlying!442 thiss!992))) (zeroValue!2682 (v!3153 (underlying!442 thiss!992))) (minValue!2682 (v!3153 (underlying!442 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2823 (v!3153 (underlying!442 thiss!992)))))))

(declare-fun lt!67073 () (_ BitVec 64))

(assert (=> b!129457 (= lt!67073 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!67063 () (_ BitVec 64))

(assert (=> b!129457 (= lt!67063 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!67062 () Unit!4037)

(declare-fun addStillContains!89 (ListLongMap!1661 (_ BitVec 64) V!3457 (_ BitVec 64)) Unit!4037)

(assert (=> b!129457 (= lt!67062 (addStillContains!89 lt!67061 lt!67073 (zeroValue!2682 (v!3153 (underlying!442 thiss!992))) lt!67063))))

(declare-fun +!160 (ListLongMap!1661 tuple2!2566) ListLongMap!1661)

(assert (=> b!129457 (contains!876 (+!160 lt!67061 (tuple2!2567 lt!67073 (zeroValue!2682 (v!3153 (underlying!442 thiss!992))))) lt!67063)))

(declare-fun lt!67064 () Unit!4037)

(assert (=> b!129457 (= lt!67064 lt!67062)))

(declare-fun lt!67074 () ListLongMap!1661)

(assert (=> b!129457 (= lt!67074 (getCurrentListMapNoExtraKeys!125 (_keys!4563 (v!3153 (underlying!442 thiss!992))) (_values!2806 (v!3153 (underlying!442 thiss!992))) (mask!7100 (v!3153 (underlying!442 thiss!992))) (extraKeys!2596 (v!3153 (underlying!442 thiss!992))) (zeroValue!2682 (v!3153 (underlying!442 thiss!992))) (minValue!2682 (v!3153 (underlying!442 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2823 (v!3153 (underlying!442 thiss!992)))))))

(declare-fun lt!67056 () (_ BitVec 64))

(assert (=> b!129457 (= lt!67056 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!67066 () (_ BitVec 64))

(assert (=> b!129457 (= lt!67066 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!67076 () Unit!4037)

(declare-fun addApplyDifferent!89 (ListLongMap!1661 (_ BitVec 64) V!3457 (_ BitVec 64)) Unit!4037)

(assert (=> b!129457 (= lt!67076 (addApplyDifferent!89 lt!67074 lt!67056 (minValue!2682 (v!3153 (underlying!442 thiss!992))) lt!67066))))

(assert (=> b!129457 (= (apply!113 (+!160 lt!67074 (tuple2!2567 lt!67056 (minValue!2682 (v!3153 (underlying!442 thiss!992))))) lt!67066) (apply!113 lt!67074 lt!67066))))

(declare-fun lt!67072 () Unit!4037)

(assert (=> b!129457 (= lt!67072 lt!67076)))

(declare-fun lt!67059 () ListLongMap!1661)

(assert (=> b!129457 (= lt!67059 (getCurrentListMapNoExtraKeys!125 (_keys!4563 (v!3153 (underlying!442 thiss!992))) (_values!2806 (v!3153 (underlying!442 thiss!992))) (mask!7100 (v!3153 (underlying!442 thiss!992))) (extraKeys!2596 (v!3153 (underlying!442 thiss!992))) (zeroValue!2682 (v!3153 (underlying!442 thiss!992))) (minValue!2682 (v!3153 (underlying!442 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2823 (v!3153 (underlying!442 thiss!992)))))))

(declare-fun lt!67075 () (_ BitVec 64))

(assert (=> b!129457 (= lt!67075 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!67068 () (_ BitVec 64))

(assert (=> b!129457 (= lt!67068 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!67070 () Unit!4037)

(assert (=> b!129457 (= lt!67070 (addApplyDifferent!89 lt!67059 lt!67075 (zeroValue!2682 (v!3153 (underlying!442 thiss!992))) lt!67068))))

(assert (=> b!129457 (= (apply!113 (+!160 lt!67059 (tuple2!2567 lt!67075 (zeroValue!2682 (v!3153 (underlying!442 thiss!992))))) lt!67068) (apply!113 lt!67059 lt!67068))))

(declare-fun lt!67069 () Unit!4037)

(assert (=> b!129457 (= lt!67069 lt!67070)))

(declare-fun lt!67067 () ListLongMap!1661)

(assert (=> b!129457 (= lt!67067 (getCurrentListMapNoExtraKeys!125 (_keys!4563 (v!3153 (underlying!442 thiss!992))) (_values!2806 (v!3153 (underlying!442 thiss!992))) (mask!7100 (v!3153 (underlying!442 thiss!992))) (extraKeys!2596 (v!3153 (underlying!442 thiss!992))) (zeroValue!2682 (v!3153 (underlying!442 thiss!992))) (minValue!2682 (v!3153 (underlying!442 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2823 (v!3153 (underlying!442 thiss!992)))))))

(declare-fun lt!67060 () (_ BitVec 64))

(assert (=> b!129457 (= lt!67060 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!67077 () (_ BitVec 64))

(assert (=> b!129457 (= lt!67077 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(assert (=> b!129457 (= lt!67065 (addApplyDifferent!89 lt!67067 lt!67060 (minValue!2682 (v!3153 (underlying!442 thiss!992))) lt!67077))))

(assert (=> b!129457 (= (apply!113 (+!160 lt!67067 (tuple2!2567 lt!67060 (minValue!2682 (v!3153 (underlying!442 thiss!992))))) lt!67077) (apply!113 lt!67067 lt!67077))))

(declare-fun b!129458 () Bool)

(assert (=> b!129458 (= e!84496 (validKeyInArray!0 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!129459 () Bool)

(declare-fun c!23814 () Bool)

(assert (=> b!129459 (= c!23814 (and (not (= (bvand (extraKeys!2596 (v!3153 (underlying!442 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2596 (v!3153 (underlying!442 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!129459 (= e!84502 e!84504)))

(declare-fun b!129460 () Bool)

(declare-fun res!62433 () Bool)

(assert (=> b!129460 (=> (not res!62433) (not e!84503))))

(assert (=> b!129460 (= res!62433 e!84501)))

(declare-fun c!23812 () Bool)

(assert (=> b!129460 (= c!23812 (not (= (bvand (extraKeys!2596 (v!3153 (underlying!442 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!129461 () Bool)

(assert (=> b!129461 (= e!84504 call!14006)))

(declare-fun bm!14004 () Bool)

(assert (=> bm!14004 (= call!14009 call!14008)))

(declare-fun b!129462 () Bool)

(assert (=> b!129462 (= e!84495 (= (apply!113 lt!67071 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2682 (v!3153 (underlying!442 thiss!992)))))))

(declare-fun b!129449 () Bool)

(declare-fun e!84498 () ListLongMap!1661)

(assert (=> b!129449 (= e!84498 (+!160 call!14004 (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2682 (v!3153 (underlying!442 thiss!992))))))))

(declare-fun d!39315 () Bool)

(assert (=> d!39315 e!84503))

(declare-fun res!62428 () Bool)

(assert (=> d!39315 (=> (not res!62428) (not e!84503))))

(assert (=> d!39315 (= res!62428 (or (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2497 (_keys!4563 (v!3153 (underlying!442 thiss!992))))) (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2497 (_keys!4563 (v!3153 (underlying!442 thiss!992))))))))))

(declare-fun lt!67057 () ListLongMap!1661)

(assert (=> d!39315 (= lt!67071 lt!67057)))

(declare-fun lt!67058 () Unit!4037)

(assert (=> d!39315 (= lt!67058 e!84499)))

(declare-fun c!23810 () Bool)

(assert (=> d!39315 (= c!23810 e!84497)))

(declare-fun res!62426 () Bool)

(assert (=> d!39315 (=> (not res!62426) (not e!84497))))

(assert (=> d!39315 (= res!62426 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2497 (_keys!4563 (v!3153 (underlying!442 thiss!992))))))))

(assert (=> d!39315 (= lt!67057 e!84498)))

(declare-fun c!23815 () Bool)

(assert (=> d!39315 (= c!23815 (and (not (= (bvand (extraKeys!2596 (v!3153 (underlying!442 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2596 (v!3153 (underlying!442 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!39315 (validMask!0 (mask!7100 (v!3153 (underlying!442 thiss!992))))))

(assert (=> d!39315 (= (getCurrentListMap!515 (_keys!4563 (v!3153 (underlying!442 thiss!992))) (_values!2806 (v!3153 (underlying!442 thiss!992))) (mask!7100 (v!3153 (underlying!442 thiss!992))) (extraKeys!2596 (v!3153 (underlying!442 thiss!992))) (zeroValue!2682 (v!3153 (underlying!442 thiss!992))) (minValue!2682 (v!3153 (underlying!442 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2823 (v!3153 (underlying!442 thiss!992)))) lt!67071)))

(declare-fun bm!14005 () Bool)

(assert (=> bm!14005 (= call!14005 (contains!876 lt!67071 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!129463 () Bool)

(assert (=> b!129463 (= e!84498 e!84502)))

(declare-fun c!23813 () Bool)

(assert (=> b!129463 (= c!23813 (and (not (= (bvand (extraKeys!2596 (v!3153 (underlying!442 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2596 (v!3153 (underlying!442 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!14006 () Bool)

(assert (=> bm!14006 (= call!14004 (+!160 (ite c!23815 call!14007 (ite c!23813 call!14008 call!14009)) (ite (or c!23815 c!23813) (tuple2!2567 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2682 (v!3153 (underlying!442 thiss!992)))) (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2682 (v!3153 (underlying!442 thiss!992)))))))))

(declare-fun b!129464 () Bool)

(assert (=> b!129464 (= e!84493 (not call!14003))))

(assert (= (and d!39315 c!23815) b!129449))

(assert (= (and d!39315 (not c!23815)) b!129463))

(assert (= (and b!129463 c!23813) b!129456))

(assert (= (and b!129463 (not c!23813)) b!129459))

(assert (= (and b!129459 c!23814) b!129461))

(assert (= (and b!129459 (not c!23814)) b!129450))

(assert (= (or b!129461 b!129450) bm!14004))

(assert (= (or b!129456 bm!14004) bm!14000))

(assert (= (or b!129456 b!129461) bm!14003))

(assert (= (or b!129449 bm!14000) bm!14001))

(assert (= (or b!129449 bm!14003) bm!14006))

(assert (= (and d!39315 res!62426) b!129451))

(assert (= (and d!39315 c!23810) b!129457))

(assert (= (and d!39315 (not c!23810)) b!129455))

(assert (= (and d!39315 res!62428) b!129444))

(assert (= (and b!129444 res!62432) b!129458))

(assert (= (and b!129444 (not res!62427)) b!129447))

(assert (= (and b!129447 res!62429) b!129452))

(assert (= (and b!129444 res!62434) b!129460))

(assert (= (and b!129460 c!23812) b!129446))

(assert (= (and b!129460 (not c!23812)) b!129454))

(assert (= (and b!129446 res!62431) b!129445))

(assert (= (or b!129446 b!129454) bm!14005))

(assert (= (and b!129460 res!62433) b!129453))

(assert (= (and b!129453 c!23811) b!129448))

(assert (= (and b!129453 (not c!23811)) b!129464))

(assert (= (and b!129448 res!62430) b!129462))

(assert (= (or b!129448 b!129464) bm!14002))

(declare-fun b_lambda!5739 () Bool)

(assert (=> (not b_lambda!5739) (not b!129452)))

(assert (=> b!129452 t!6088))

(declare-fun b_and!8001 () Bool)

(assert (= b_and!7981 (and (=> t!6088 result!3897) b_and!8001)))

(assert (=> b!129452 t!6090))

(declare-fun b_and!8003 () Bool)

(assert (= b_and!7983 (and (=> t!6090 result!3901) b_and!8003)))

(declare-fun m!151851 () Bool)

(assert (=> bm!14002 m!151851))

(declare-fun m!151853 () Bool)

(assert (=> bm!14001 m!151853))

(declare-fun m!151855 () Bool)

(assert (=> b!129458 m!151855))

(assert (=> b!129458 m!151855))

(declare-fun m!151857 () Bool)

(assert (=> b!129458 m!151857))

(declare-fun m!151859 () Bool)

(assert (=> b!129449 m!151859))

(assert (=> d!39315 m!151769))

(declare-fun m!151861 () Bool)

(assert (=> b!129445 m!151861))

(assert (=> b!129451 m!151855))

(assert (=> b!129451 m!151855))

(assert (=> b!129451 m!151857))

(declare-fun m!151863 () Bool)

(assert (=> b!129462 m!151863))

(declare-fun m!151865 () Bool)

(assert (=> bm!14006 m!151865))

(declare-fun m!151867 () Bool)

(assert (=> b!129457 m!151867))

(declare-fun m!151869 () Bool)

(assert (=> b!129457 m!151869))

(declare-fun m!151871 () Bool)

(assert (=> b!129457 m!151871))

(declare-fun m!151873 () Bool)

(assert (=> b!129457 m!151873))

(declare-fun m!151875 () Bool)

(assert (=> b!129457 m!151875))

(declare-fun m!151877 () Bool)

(assert (=> b!129457 m!151877))

(assert (=> b!129457 m!151853))

(declare-fun m!151879 () Bool)

(assert (=> b!129457 m!151879))

(assert (=> b!129457 m!151855))

(declare-fun m!151881 () Bool)

(assert (=> b!129457 m!151881))

(declare-fun m!151883 () Bool)

(assert (=> b!129457 m!151883))

(declare-fun m!151885 () Bool)

(assert (=> b!129457 m!151885))

(assert (=> b!129457 m!151877))

(declare-fun m!151887 () Bool)

(assert (=> b!129457 m!151887))

(assert (=> b!129457 m!151871))

(declare-fun m!151889 () Bool)

(assert (=> b!129457 m!151889))

(declare-fun m!151891 () Bool)

(assert (=> b!129457 m!151891))

(declare-fun m!151893 () Bool)

(assert (=> b!129457 m!151893))

(assert (=> b!129457 m!151883))

(assert (=> b!129457 m!151881))

(declare-fun m!151895 () Bool)

(assert (=> b!129457 m!151895))

(declare-fun m!151897 () Bool)

(assert (=> bm!14005 m!151897))

(assert (=> b!129447 m!151855))

(assert (=> b!129447 m!151855))

(declare-fun m!151899 () Bool)

(assert (=> b!129447 m!151899))

(assert (=> b!129452 m!151855))

(declare-fun m!151901 () Bool)

(assert (=> b!129452 m!151901))

(assert (=> b!129452 m!151855))

(declare-fun m!151903 () Bool)

(assert (=> b!129452 m!151903))

(assert (=> b!129452 m!151901))

(assert (=> b!129452 m!151749))

(declare-fun m!151905 () Bool)

(assert (=> b!129452 m!151905))

(assert (=> b!129452 m!151749))

(assert (=> b!129284 d!39315))

(declare-fun d!39317 () Bool)

(assert (=> d!39317 (= (array_inv!1419 (_keys!4563 newMap!16)) (bvsge (size!2497 (_keys!4563 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!129277 d!39317))

(declare-fun d!39319 () Bool)

(assert (=> d!39319 (= (array_inv!1420 (_values!2806 newMap!16)) (bvsge (size!2498 (_values!2806 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!129277 d!39319))

(declare-fun d!39321 () Bool)

(assert (=> d!39321 (= (array_inv!1419 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) (bvsge (size!2497 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!129281 d!39321))

(declare-fun d!39323 () Bool)

(assert (=> d!39323 (= (array_inv!1420 (_values!2806 (v!3153 (underlying!442 thiss!992)))) (bvsge (size!2498 (_values!2806 (v!3153 (underlying!442 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!129281 d!39323))

(declare-fun d!39325 () Bool)

(declare-fun res!62441 () Bool)

(declare-fun e!84508 () Bool)

(assert (=> d!39325 (=> (not res!62441) (not e!84508))))

(declare-fun simpleValid!89 (LongMapFixedSize!1078) Bool)

(assert (=> d!39325 (= res!62441 (simpleValid!89 newMap!16))))

(assert (=> d!39325 (= (valid!521 newMap!16) e!84508)))

(declare-fun b!129471 () Bool)

(declare-fun res!62442 () Bool)

(assert (=> b!129471 (=> (not res!62442) (not e!84508))))

(declare-fun arrayCountValidKeys!0 (array!4715 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!129471 (= res!62442 (= (arrayCountValidKeys!0 (_keys!4563 newMap!16) #b00000000000000000000000000000000 (size!2497 (_keys!4563 newMap!16))) (_size!588 newMap!16)))))

(declare-fun b!129472 () Bool)

(declare-fun res!62443 () Bool)

(assert (=> b!129472 (=> (not res!62443) (not e!84508))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!4715 (_ BitVec 32)) Bool)

(assert (=> b!129472 (= res!62443 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4563 newMap!16) (mask!7100 newMap!16)))))

(declare-fun b!129473 () Bool)

(declare-datatypes ((List!1703 0))(
  ( (Nil!1700) (Cons!1699 (h!2303 (_ BitVec 64)) (t!6101 List!1703)) )
))
(declare-fun arrayNoDuplicates!0 (array!4715 (_ BitVec 32) List!1703) Bool)

(assert (=> b!129473 (= e!84508 (arrayNoDuplicates!0 (_keys!4563 newMap!16) #b00000000000000000000000000000000 Nil!1700))))

(assert (= (and d!39325 res!62441) b!129471))

(assert (= (and b!129471 res!62442) b!129472))

(assert (= (and b!129472 res!62443) b!129473))

(declare-fun m!151907 () Bool)

(assert (=> d!39325 m!151907))

(declare-fun m!151909 () Bool)

(assert (=> b!129471 m!151909))

(declare-fun m!151911 () Bool)

(assert (=> b!129472 m!151911))

(declare-fun m!151913 () Bool)

(assert (=> b!129473 m!151913))

(assert (=> b!129285 d!39325))

(declare-fun d!39327 () Bool)

(declare-fun e!84514 () Bool)

(assert (=> d!39327 e!84514))

(declare-fun res!62446 () Bool)

(assert (=> d!39327 (=> res!62446 e!84514)))

(declare-fun lt!67088 () Bool)

(assert (=> d!39327 (= res!62446 (not lt!67088))))

(declare-fun lt!67089 () Bool)

(assert (=> d!39327 (= lt!67088 lt!67089)))

(declare-fun lt!67086 () Unit!4037)

(declare-fun e!84513 () Unit!4037)

(assert (=> d!39327 (= lt!67086 e!84513)))

(declare-fun c!23818 () Bool)

(assert (=> d!39327 (= c!23818 lt!67089)))

(declare-fun containsKey!171 (List!1701 (_ BitVec 64)) Bool)

(assert (=> d!39327 (= lt!67089 (containsKey!171 (toList!846 lt!66993) (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355)))))

(assert (=> d!39327 (= (contains!876 lt!66993 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355)) lt!67088)))

(declare-fun b!129480 () Bool)

(declare-fun lt!67087 () Unit!4037)

(assert (=> b!129480 (= e!84513 lt!67087)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!120 (List!1701 (_ BitVec 64)) Unit!4037)

(assert (=> b!129480 (= lt!67087 (lemmaContainsKeyImpliesGetValueByKeyDefined!120 (toList!846 lt!66993) (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355)))))

(declare-datatypes ((Option!173 0))(
  ( (Some!172 (v!3159 V!3457)) (None!171) )
))
(declare-fun isDefined!121 (Option!173) Bool)

(declare-fun getValueByKey!167 (List!1701 (_ BitVec 64)) Option!173)

(assert (=> b!129480 (isDefined!121 (getValueByKey!167 (toList!846 lt!66993) (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355)))))

(declare-fun b!129481 () Bool)

(declare-fun Unit!4040 () Unit!4037)

(assert (=> b!129481 (= e!84513 Unit!4040)))

(declare-fun b!129482 () Bool)

(assert (=> b!129482 (= e!84514 (isDefined!121 (getValueByKey!167 (toList!846 lt!66993) (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355))))))

(assert (= (and d!39327 c!23818) b!129480))

(assert (= (and d!39327 (not c!23818)) b!129481))

(assert (= (and d!39327 (not res!62446)) b!129482))

(assert (=> d!39327 m!151753))

(declare-fun m!151915 () Bool)

(assert (=> d!39327 m!151915))

(assert (=> b!129480 m!151753))

(declare-fun m!151917 () Bool)

(assert (=> b!129480 m!151917))

(assert (=> b!129480 m!151753))

(declare-fun m!151919 () Bool)

(assert (=> b!129480 m!151919))

(assert (=> b!129480 m!151919))

(declare-fun m!151921 () Bool)

(assert (=> b!129480 m!151921))

(assert (=> b!129482 m!151753))

(assert (=> b!129482 m!151919))

(assert (=> b!129482 m!151919))

(assert (=> b!129482 m!151921))

(assert (=> b!129282 d!39327))

(declare-fun b!129567 () Bool)

(declare-fun res!62482 () Bool)

(declare-fun call!14060 () Bool)

(assert (=> b!129567 (= res!62482 call!14060)))

(declare-fun e!84579 () Bool)

(assert (=> b!129567 (=> (not res!62482) (not e!84579))))

(declare-fun b!129568 () Bool)

(declare-fun e!84562 () ListLongMap!1661)

(declare-fun call!14078 () ListLongMap!1661)

(assert (=> b!129568 (= e!84562 call!14078)))

(declare-fun bm!14055 () Bool)

(declare-datatypes ((SeekEntryResult!275 0))(
  ( (MissingZero!275 (index!3257 (_ BitVec 32))) (Found!275 (index!3258 (_ BitVec 32))) (Intermediate!275 (undefined!1087 Bool) (index!3259 (_ BitVec 32)) (x!15269 (_ BitVec 32))) (Undefined!275) (MissingVacant!275 (index!3260 (_ BitVec 32))) )
))
(declare-fun call!14064 () SeekEntryResult!275)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!4715 (_ BitVec 32)) SeekEntryResult!275)

(assert (=> bm!14055 (= call!14064 (seekEntryOrOpen!0 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355) (_keys!4563 newMap!16) (mask!7100 newMap!16)))))

(declare-fun b!129569 () Bool)

(declare-fun e!84573 () Bool)

(declare-fun call!14073 () ListLongMap!1661)

(declare-fun call!14068 () ListLongMap!1661)

(assert (=> b!129569 (= e!84573 (= call!14073 call!14068))))

(declare-fun bm!14056 () Bool)

(declare-fun call!14072 () ListLongMap!1661)

(declare-fun lt!67158 () array!4717)

(declare-fun c!23852 () Bool)

(assert (=> bm!14056 (= call!14072 (getCurrentListMap!515 (_keys!4563 newMap!16) (ite c!23852 (_values!2806 newMap!16) lt!67158) (mask!7100 newMap!16) (extraKeys!2596 newMap!16) (zeroValue!2682 newMap!16) (minValue!2682 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2823 newMap!16)))))

(declare-fun bm!14057 () Bool)

(declare-fun call!14081 () Bool)

(declare-fun call!14069 () Bool)

(assert (=> bm!14057 (= call!14081 call!14069)))

(declare-fun bm!14058 () Bool)

(declare-fun call!14065 () Bool)

(assert (=> bm!14058 (= call!14065 call!14069)))

(declare-fun bm!14059 () Bool)

(declare-fun call!14077 () Bool)

(assert (=> bm!14059 (= call!14077 call!14060)))

(declare-fun b!129570 () Bool)

(declare-fun e!84572 () tuple2!2568)

(declare-fun e!84569 () tuple2!2568)

(assert (=> b!129570 (= e!84572 e!84569)))

(declare-fun c!23848 () Bool)

(assert (=> b!129570 (= c!23848 (= (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!129571 () Bool)

(declare-fun e!84568 () Bool)

(assert (=> b!129571 (= e!84568 (not call!14065))))

(declare-fun d!39329 () Bool)

(declare-fun e!84580 () Bool)

(assert (=> d!39329 e!84580))

(declare-fun res!62485 () Bool)

(assert (=> d!39329 (=> (not res!62485) (not e!84580))))

(declare-fun lt!67144 () tuple2!2568)

(assert (=> d!39329 (= res!62485 (valid!521 (_2!1295 lt!67144)))))

(assert (=> d!39329 (= lt!67144 e!84572)))

(assert (=> d!39329 (= c!23852 (= (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355) (bvneg (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355))))))

(assert (=> d!39329 (valid!521 newMap!16)))

(assert (=> d!39329 (= (update!188 newMap!16 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) lt!67144)))

(declare-fun bm!14060 () Bool)

(declare-fun call!14059 () Bool)

(declare-fun call!14061 () Bool)

(assert (=> bm!14060 (= call!14059 call!14061)))

(declare-fun lt!67166 () SeekEntryResult!275)

(declare-fun c!23860 () Bool)

(declare-fun call!14058 () Bool)

(declare-fun lt!67145 () SeekEntryResult!275)

(declare-fun c!23849 () Bool)

(declare-fun lt!67157 () SeekEntryResult!275)

(declare-fun lt!67146 () SeekEntryResult!275)

(declare-fun c!23855 () Bool)

(declare-fun bm!14061 () Bool)

(declare-fun c!23854 () Bool)

(declare-fun c!23859 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!14061 (= call!14058 (inRange!0 (ite c!23854 (ite c!23855 (index!3258 lt!67146) (ite c!23849 (index!3257 lt!67145) (index!3260 lt!67145))) (ite c!23860 (index!3258 lt!67166) (ite c!23859 (index!3257 lt!67157) (index!3260 lt!67157)))) (mask!7100 newMap!16)))))

(declare-fun b!129572 () Bool)

(assert (=> b!129572 (= e!84580 e!84573)))

(declare-fun c!23847 () Bool)

(assert (=> b!129572 (= c!23847 (_1!1295 lt!67144))))

(declare-fun b!129573 () Bool)

(declare-fun e!84570 () tuple2!2568)

(assert (=> b!129573 (= e!84572 e!84570)))

(declare-fun lt!67161 () SeekEntryResult!275)

(assert (=> b!129573 (= lt!67161 (seekEntryOrOpen!0 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355) (_keys!4563 newMap!16) (mask!7100 newMap!16)))))

(assert (=> b!129573 (= c!23854 ((_ is Undefined!275) lt!67161))))

(declare-fun b!129574 () Bool)

(declare-fun e!84566 () Bool)

(assert (=> b!129574 (= e!84566 (not call!14081))))

(declare-fun bm!14062 () Bool)

(declare-fun call!14063 () ListLongMap!1661)

(assert (=> bm!14062 (= call!14078 call!14063)))

(declare-fun b!129575 () Bool)

(declare-fun c!23857 () Bool)

(assert (=> b!129575 (= c!23857 ((_ is MissingVacant!275) lt!67161))))

(declare-fun e!84574 () tuple2!2568)

(assert (=> b!129575 (= e!84570 e!84574)))

(declare-fun b!129576 () Bool)

(declare-fun e!84563 () Unit!4037)

(declare-fun lt!67167 () Unit!4037)

(assert (=> b!129576 (= e!84563 lt!67167)))

(declare-fun call!14071 () Unit!4037)

(assert (=> b!129576 (= lt!67167 call!14071)))

(declare-fun call!14074 () SeekEntryResult!275)

(assert (=> b!129576 (= lt!67166 call!14074)))

(declare-fun res!62481 () Bool)

(assert (=> b!129576 (= res!62481 ((_ is Found!275) lt!67166))))

(assert (=> b!129576 (=> (not res!62481) (not e!84579))))

(assert (=> b!129576 e!84579))

(declare-fun bm!14063 () Bool)

(declare-fun call!14067 () ListLongMap!1661)

(declare-fun call!14079 () ListLongMap!1661)

(assert (=> bm!14063 (= call!14067 call!14079)))

(declare-fun b!129577 () Bool)

(declare-fun e!84576 () Bool)

(assert (=> b!129577 (= e!84576 (not call!14065))))

(declare-fun bm!14064 () Bool)

(declare-fun call!14075 () SeekEntryResult!275)

(assert (=> bm!14064 (= call!14075 call!14064)))

(declare-fun b!129578 () Bool)

(declare-fun res!62475 () Bool)

(declare-fun e!84577 () Bool)

(assert (=> b!129578 (=> (not res!62475) (not e!84577))))

(assert (=> b!129578 (= res!62475 (= (select (arr!2230 (_keys!4563 newMap!16)) (index!3257 lt!67157)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!129579 () Bool)

(declare-fun e!84571 () Unit!4037)

(declare-fun Unit!4041 () Unit!4037)

(assert (=> b!129579 (= e!84571 Unit!4041)))

(declare-fun lt!67160 () Unit!4037)

(assert (=> b!129579 (= lt!67160 call!14071)))

(assert (=> b!129579 (= lt!67146 call!14075)))

(declare-fun res!62476 () Bool)

(assert (=> b!129579 (= res!62476 ((_ is Found!275) lt!67146))))

(declare-fun e!84565 () Bool)

(assert (=> b!129579 (=> (not res!62476) (not e!84565))))

(assert (=> b!129579 e!84565))

(declare-fun lt!67152 () Unit!4037)

(assert (=> b!129579 (= lt!67152 lt!67160)))

(assert (=> b!129579 false))

(declare-fun b!129580 () Bool)

(declare-fun res!62486 () Bool)

(assert (=> b!129580 (=> (not res!62486) (not e!84576))))

(assert (=> b!129580 (= res!62486 call!14059)))

(declare-fun e!84559 () Bool)

(assert (=> b!129580 (= e!84559 e!84576)))

(declare-fun bm!14065 () Bool)

(assert (=> bm!14065 (= call!14060 call!14058)))

(declare-fun b!129581 () Bool)

(declare-fun e!84567 () Bool)

(assert (=> b!129581 (= e!84567 e!84568)))

(declare-fun res!62479 () Bool)

(assert (=> b!129581 (= res!62479 call!14059)))

(assert (=> b!129581 (=> (not res!62479) (not e!84568))))

(declare-fun bm!14066 () Bool)

(declare-fun call!14070 () ListLongMap!1661)

(assert (=> bm!14066 (= call!14070 call!14072)))

(declare-fun b!129582 () Bool)

(declare-fun e!84560 () tuple2!2568)

(assert (=> b!129582 (= e!84574 e!84560)))

(declare-fun c!23858 () Bool)

(assert (=> b!129582 (= c!23858 ((_ is MissingZero!275) lt!67161))))

(declare-fun bm!14067 () Bool)

(assert (=> bm!14067 (= call!14074 call!14064)))

(declare-fun b!129583 () Bool)

(declare-fun res!62488 () Bool)

(assert (=> b!129583 (= res!62488 (= (select (arr!2230 (_keys!4563 newMap!16)) (index!3260 lt!67145)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!129583 (=> (not res!62488) (not e!84568))))

(declare-fun b!129584 () Bool)

(assert (=> b!129584 (= e!84567 ((_ is Undefined!275) lt!67145))))

(declare-fun b!129585 () Bool)

(declare-fun res!62483 () Bool)

(assert (=> b!129585 (=> (not res!62483) (not e!84576))))

(assert (=> b!129585 (= res!62483 (= (select (arr!2230 (_keys!4563 newMap!16)) (index!3257 lt!67145)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!129586 () Bool)

(declare-fun Unit!4042 () Unit!4037)

(assert (=> b!129586 (= e!84563 Unit!4042)))

(declare-fun lt!67159 () Unit!4037)

(declare-fun call!14080 () Unit!4037)

(assert (=> b!129586 (= lt!67159 call!14080)))

(assert (=> b!129586 (= lt!67157 call!14074)))

(assert (=> b!129586 (= c!23859 ((_ is MissingZero!275) lt!67157))))

(declare-fun e!84561 () Bool)

(assert (=> b!129586 e!84561))

(declare-fun lt!67154 () Unit!4037)

(assert (=> b!129586 (= lt!67154 lt!67159)))

(assert (=> b!129586 false))

(declare-fun b!129587 () Bool)

(declare-fun e!84564 () Bool)

(assert (=> b!129587 (= e!84564 e!84566)))

(declare-fun res!62477 () Bool)

(assert (=> b!129587 (= res!62477 call!14077)))

(assert (=> b!129587 (=> (not res!62477) (not e!84566))))

(declare-fun b!129588 () Bool)

(declare-fun lt!67168 () Unit!4037)

(declare-fun lt!67164 () Unit!4037)

(assert (=> b!129588 (= lt!67168 lt!67164)))

(declare-fun call!14076 () ListLongMap!1661)

(assert (=> b!129588 (= call!14067 call!14076)))

(declare-fun lt!67148 () (_ BitVec 32))

(declare-fun lemmaChangeZeroKeyThenAddPairToListMap!58 (array!4715 array!4717 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3457 V!3457 V!3457 Int) Unit!4037)

(assert (=> b!129588 (= lt!67164 (lemmaChangeZeroKeyThenAddPairToListMap!58 (_keys!4563 newMap!16) (_values!2806 newMap!16) (mask!7100 newMap!16) (extraKeys!2596 newMap!16) lt!67148 (zeroValue!2682 newMap!16) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2682 newMap!16) (defaultEntry!2823 newMap!16)))))

(assert (=> b!129588 (= lt!67148 (bvor (extraKeys!2596 newMap!16) #b00000000000000000000000000000001))))

(assert (=> b!129588 (= e!84569 (tuple2!2569 true (LongMapFixedSize!1079 (defaultEntry!2823 newMap!16) (mask!7100 newMap!16) (bvor (extraKeys!2596 newMap!16) #b00000000000000000000000000000001) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2682 newMap!16) (_size!588 newMap!16) (_keys!4563 newMap!16) (_values!2806 newMap!16) (_vacant!588 newMap!16))))))

(declare-fun bm!14068 () Bool)

(assert (=> bm!14068 (= call!14061 call!14058)))

(declare-fun bm!14069 () Bool)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!58 (array!4715 array!4717 (_ BitVec 32) (_ BitVec 32) V!3457 V!3457 (_ BitVec 64) Int) Unit!4037)

(assert (=> bm!14069 (= call!14080 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!58 (_keys!4563 newMap!16) (_values!2806 newMap!16) (mask!7100 newMap!16) (extraKeys!2596 newMap!16) (zeroValue!2682 newMap!16) (minValue!2682 newMap!16) (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355) (defaultEntry!2823 newMap!16)))))

(declare-fun bm!14070 () Bool)

(declare-fun arrayContainsKey!0 (array!4715 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!14070 (= call!14069 (arrayContainsKey!0 (_keys!4563 newMap!16) (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun b!129589 () Bool)

(declare-fun e!84575 () ListLongMap!1661)

(assert (=> b!129589 (= e!84575 call!14070)))

(declare-fun b!129590 () Bool)

(declare-fun lt!67163 () Unit!4037)

(assert (=> b!129590 (= e!84571 lt!67163)))

(assert (=> b!129590 (= lt!67163 call!14080)))

(assert (=> b!129590 (= lt!67145 call!14075)))

(assert (=> b!129590 (= c!23849 ((_ is MissingZero!275) lt!67145))))

(assert (=> b!129590 e!84559))

(declare-fun b!129591 () Bool)

(declare-fun res!62478 () Bool)

(assert (=> b!129591 (= res!62478 (= (select (arr!2230 (_keys!4563 newMap!16)) (index!3260 lt!67157)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!129591 (=> (not res!62478) (not e!84566))))

(declare-fun bm!14071 () Bool)

(assert (=> bm!14071 (= call!14068 (map!1381 newMap!16))))

(declare-fun b!129592 () Bool)

(assert (=> b!129592 (= e!84564 ((_ is Undefined!275) lt!67157))))

(declare-fun b!129593 () Bool)

(declare-fun lt!67155 () Unit!4037)

(assert (=> b!129593 (= lt!67155 e!84571)))

(declare-fun call!14062 () Bool)

(assert (=> b!129593 (= c!23855 call!14062)))

(assert (=> b!129593 (= e!84570 (tuple2!2569 false newMap!16))))

(declare-fun bm!14072 () Bool)

(assert (=> bm!14072 (= call!14076 call!14063)))

(declare-fun b!129594 () Bool)

(declare-fun lt!67170 () Unit!4037)

(declare-fun lt!67147 () Unit!4037)

(assert (=> b!129594 (= lt!67170 lt!67147)))

(assert (=> b!129594 (= call!14067 call!14076)))

(declare-fun lt!67156 () (_ BitVec 32))

(declare-fun lemmaChangeLongMinValueKeyThenAddPairToListMap!58 (array!4715 array!4717 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3457 V!3457 V!3457 Int) Unit!4037)

(assert (=> b!129594 (= lt!67147 (lemmaChangeLongMinValueKeyThenAddPairToListMap!58 (_keys!4563 newMap!16) (_values!2806 newMap!16) (mask!7100 newMap!16) (extraKeys!2596 newMap!16) lt!67156 (zeroValue!2682 newMap!16) (minValue!2682 newMap!16) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2823 newMap!16)))))

(assert (=> b!129594 (= lt!67156 (bvor (extraKeys!2596 newMap!16) #b00000000000000000000000000000010))))

(assert (=> b!129594 (= e!84569 (tuple2!2569 true (LongMapFixedSize!1079 (defaultEntry!2823 newMap!16) (mask!7100 newMap!16) (bvor (extraKeys!2596 newMap!16) #b00000000000000000000000000000010) (zeroValue!2682 newMap!16) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (_size!588 newMap!16) (_keys!4563 newMap!16) (_values!2806 newMap!16) (_vacant!588 newMap!16))))))

(declare-fun b!129595 () Bool)

(declare-fun e!84578 () Bool)

(assert (=> b!129595 (= e!84573 e!84578)))

(declare-fun res!62487 () Bool)

(assert (=> b!129595 (= res!62487 (contains!876 call!14073 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355)))))

(assert (=> b!129595 (=> (not res!62487) (not e!84578))))

(declare-fun b!129596 () Bool)

(declare-fun res!62484 () Bool)

(assert (=> b!129596 (= res!62484 call!14061)))

(assert (=> b!129596 (=> (not res!62484) (not e!84565))))

(declare-fun b!129597 () Bool)

(declare-fun res!62480 () Bool)

(assert (=> b!129597 (=> (not res!62480) (not e!84577))))

(assert (=> b!129597 (= res!62480 call!14077)))

(assert (=> b!129597 (= e!84561 e!84577)))

(declare-fun b!129598 () Bool)

(declare-fun c!23851 () Bool)

(assert (=> b!129598 (= c!23851 ((_ is MissingVacant!275) lt!67145))))

(assert (=> b!129598 (= e!84559 e!84567)))

(declare-fun b!129599 () Bool)

(declare-fun lt!67149 () Unit!4037)

(declare-fun lt!67169 () Unit!4037)

(assert (=> b!129599 (= lt!67149 lt!67169)))

(assert (=> b!129599 call!14062))

(declare-fun lemmaValidKeyInArrayIsInListMap!117 (array!4715 array!4717 (_ BitVec 32) (_ BitVec 32) V!3457 V!3457 (_ BitVec 32) Int) Unit!4037)

(assert (=> b!129599 (= lt!67169 (lemmaValidKeyInArrayIsInListMap!117 (_keys!4563 newMap!16) lt!67158 (mask!7100 newMap!16) (extraKeys!2596 newMap!16) (zeroValue!2682 newMap!16) (minValue!2682 newMap!16) (index!3258 lt!67161) (defaultEntry!2823 newMap!16)))))

(assert (=> b!129599 (= lt!67158 (array!4718 (store (arr!2231 (_values!2806 newMap!16)) (index!3258 lt!67161) (ValueCellFull!1085 (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2498 (_values!2806 newMap!16))))))

(declare-fun lt!67162 () Unit!4037)

(declare-fun lt!67151 () Unit!4037)

(assert (=> b!129599 (= lt!67162 lt!67151)))

(assert (=> b!129599 (= call!14079 call!14078)))

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!58 (array!4715 array!4717 (_ BitVec 32) (_ BitVec 32) V!3457 V!3457 (_ BitVec 32) (_ BitVec 64) V!3457 Int) Unit!4037)

(assert (=> b!129599 (= lt!67151 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!58 (_keys!4563 newMap!16) (_values!2806 newMap!16) (mask!7100 newMap!16) (extraKeys!2596 newMap!16) (zeroValue!2682 newMap!16) (minValue!2682 newMap!16) (index!3258 lt!67161) (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2823 newMap!16)))))

(declare-fun lt!67165 () Unit!4037)

(assert (=> b!129599 (= lt!67165 e!84563)))

(assert (=> b!129599 (= c!23860 (contains!876 (getCurrentListMap!515 (_keys!4563 newMap!16) (_values!2806 newMap!16) (mask!7100 newMap!16) (extraKeys!2596 newMap!16) (zeroValue!2682 newMap!16) (minValue!2682 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2823 newMap!16)) (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355)))))

(assert (=> b!129599 (= e!84560 (tuple2!2569 true (LongMapFixedSize!1079 (defaultEntry!2823 newMap!16) (mask!7100 newMap!16) (extraKeys!2596 newMap!16) (zeroValue!2682 newMap!16) (minValue!2682 newMap!16) (_size!588 newMap!16) (_keys!4563 newMap!16) (array!4718 (store (arr!2231 (_values!2806 newMap!16)) (index!3258 lt!67161) (ValueCellFull!1085 (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2498 (_values!2806 newMap!16))) (_vacant!588 newMap!16))))))

(declare-fun bm!14073 () Bool)

(assert (=> bm!14073 (= call!14073 (map!1381 (_2!1295 lt!67144)))))

(declare-fun b!129600 () Bool)

(declare-fun lt!67153 () tuple2!2568)

(assert (=> b!129600 (= e!84574 (tuple2!2569 (_1!1295 lt!67153) (_2!1295 lt!67153)))))

(declare-fun call!14066 () tuple2!2568)

(assert (=> b!129600 (= lt!67153 call!14066)))

(declare-fun bm!14074 () Bool)

(declare-fun updateHelperNewKey!58 (LongMapFixedSize!1078 (_ BitVec 64) V!3457 (_ BitVec 32)) tuple2!2568)

(assert (=> bm!14074 (= call!14066 (updateHelperNewKey!58 newMap!16 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (ite c!23857 (index!3260 lt!67161) (index!3257 lt!67161))))))

(declare-fun b!129601 () Bool)

(assert (=> b!129601 (= e!84577 (not call!14081))))

(declare-fun bm!14075 () Bool)

(declare-fun c!23856 () Bool)

(assert (=> bm!14075 (= c!23856 c!23854)))

(assert (=> bm!14075 (= call!14062 (contains!876 e!84562 (ite c!23854 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355) (select (arr!2230 (_keys!4563 newMap!16)) (index!3258 lt!67161)))))))

(declare-fun bm!14076 () Bool)

(assert (=> bm!14076 (= call!14063 (getCurrentListMap!515 (_keys!4563 newMap!16) (ite (or c!23852 c!23854) (_values!2806 newMap!16) (array!4718 (store (arr!2231 (_values!2806 newMap!16)) (index!3258 lt!67161) (ValueCellFull!1085 (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2498 (_values!2806 newMap!16)))) (mask!7100 newMap!16) (ite c!23852 (ite c!23848 lt!67148 lt!67156) (extraKeys!2596 newMap!16)) (ite (and c!23852 c!23848) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2682 newMap!16)) (ite c!23852 (ite c!23848 (minValue!2682 newMap!16) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2682 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2823 newMap!16)))))

(declare-fun bm!14077 () Bool)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!58 (array!4715 array!4717 (_ BitVec 32) (_ BitVec 32) V!3457 V!3457 (_ BitVec 64) Int) Unit!4037)

(assert (=> bm!14077 (= call!14071 (lemmaInListMapThenSeekEntryOrOpenFindsIt!58 (_keys!4563 newMap!16) (_values!2806 newMap!16) (mask!7100 newMap!16) (extraKeys!2596 newMap!16) (zeroValue!2682 newMap!16) (minValue!2682 newMap!16) (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355) (defaultEntry!2823 newMap!16)))))

(declare-fun b!129602 () Bool)

(assert (=> b!129602 (= e!84578 (= call!14073 (+!160 call!14068 (tuple2!2567 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!129603 () Bool)

(assert (=> b!129603 (= e!84575 (getCurrentListMap!515 (_keys!4563 newMap!16) (_values!2806 newMap!16) (mask!7100 newMap!16) (extraKeys!2596 newMap!16) (zeroValue!2682 newMap!16) (minValue!2682 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2823 newMap!16)))))

(declare-fun b!129604 () Bool)

(declare-fun lt!67150 () tuple2!2568)

(assert (=> b!129604 (= lt!67150 call!14066)))

(assert (=> b!129604 (= e!84560 (tuple2!2569 (_1!1295 lt!67150) (_2!1295 lt!67150)))))

(declare-fun b!129605 () Bool)

(declare-fun c!23853 () Bool)

(assert (=> b!129605 (= c!23853 ((_ is MissingVacant!275) lt!67157))))

(assert (=> b!129605 (= e!84561 e!84564)))

(declare-fun b!129606 () Bool)

(assert (=> b!129606 (= e!84565 (= (select (arr!2230 (_keys!4563 newMap!16)) (index!3258 lt!67146)) (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355)))))

(declare-fun b!129607 () Bool)

(assert (=> b!129607 (= e!84579 (= (select (arr!2230 (_keys!4563 newMap!16)) (index!3258 lt!67166)) (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355)))))

(declare-fun b!129608 () Bool)

(assert (=> b!129608 (= e!84562 call!14072)))

(declare-fun bm!14078 () Bool)

(assert (=> bm!14078 (= call!14079 (+!160 e!84575 (ite c!23852 (ite c!23848 (tuple2!2567 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2567 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun c!23850 () Bool)

(assert (=> bm!14078 (= c!23850 c!23852)))

(assert (= (and d!39329 c!23852) b!129570))

(assert (= (and d!39329 (not c!23852)) b!129573))

(assert (= (and b!129570 c!23848) b!129588))

(assert (= (and b!129570 (not c!23848)) b!129594))

(assert (= (or b!129588 b!129594) bm!14072))

(assert (= (or b!129588 b!129594) bm!14066))

(assert (= (or b!129588 b!129594) bm!14063))

(assert (= (and b!129573 c!23854) b!129593))

(assert (= (and b!129573 (not c!23854)) b!129575))

(assert (= (and b!129593 c!23855) b!129579))

(assert (= (and b!129593 (not c!23855)) b!129590))

(assert (= (and b!129579 res!62476) b!129596))

(assert (= (and b!129596 res!62484) b!129606))

(assert (= (and b!129590 c!23849) b!129580))

(assert (= (and b!129590 (not c!23849)) b!129598))

(assert (= (and b!129580 res!62486) b!129585))

(assert (= (and b!129585 res!62483) b!129577))

(assert (= (and b!129598 c!23851) b!129581))

(assert (= (and b!129598 (not c!23851)) b!129584))

(assert (= (and b!129581 res!62479) b!129583))

(assert (= (and b!129583 res!62488) b!129571))

(assert (= (or b!129580 b!129581) bm!14060))

(assert (= (or b!129577 b!129571) bm!14058))

(assert (= (or b!129596 bm!14060) bm!14068))

(assert (= (or b!129579 b!129590) bm!14064))

(assert (= (and b!129575 c!23857) b!129600))

(assert (= (and b!129575 (not c!23857)) b!129582))

(assert (= (and b!129582 c!23858) b!129604))

(assert (= (and b!129582 (not c!23858)) b!129599))

(assert (= (and b!129599 c!23860) b!129576))

(assert (= (and b!129599 (not c!23860)) b!129586))

(assert (= (and b!129576 res!62481) b!129567))

(assert (= (and b!129567 res!62482) b!129607))

(assert (= (and b!129586 c!23859) b!129597))

(assert (= (and b!129586 (not c!23859)) b!129605))

(assert (= (and b!129597 res!62480) b!129578))

(assert (= (and b!129578 res!62475) b!129601))

(assert (= (and b!129605 c!23853) b!129587))

(assert (= (and b!129605 (not c!23853)) b!129592))

(assert (= (and b!129587 res!62477) b!129591))

(assert (= (and b!129591 res!62478) b!129574))

(assert (= (or b!129597 b!129587) bm!14059))

(assert (= (or b!129601 b!129574) bm!14057))

(assert (= (or b!129567 bm!14059) bm!14065))

(assert (= (or b!129576 b!129586) bm!14067))

(assert (= (or b!129600 b!129604) bm!14074))

(assert (= (or b!129593 b!129599) bm!14062))

(assert (= (or bm!14064 bm!14067) bm!14055))

(assert (= (or bm!14068 bm!14065) bm!14061))

(assert (= (or b!129579 b!129576) bm!14077))

(assert (= (or b!129590 b!129586) bm!14069))

(assert (= (or bm!14058 bm!14057) bm!14070))

(assert (= (or b!129593 b!129599) bm!14075))

(assert (= (and bm!14075 c!23856) b!129568))

(assert (= (and bm!14075 (not c!23856)) b!129608))

(assert (= (or bm!14072 bm!14062) bm!14076))

(assert (= (or bm!14066 b!129608) bm!14056))

(assert (= (or bm!14063 b!129599) bm!14078))

(assert (= (and bm!14078 c!23850) b!129589))

(assert (= (and bm!14078 (not c!23850)) b!129603))

(assert (= (and d!39329 res!62485) b!129572))

(assert (= (and b!129572 c!23847) b!129595))

(assert (= (and b!129572 (not c!23847)) b!129569))

(assert (= (and b!129595 res!62487) b!129602))

(assert (= (or b!129602 b!129569) bm!14071))

(assert (= (or b!129595 b!129602 b!129569) bm!14073))

(declare-fun m!151923 () Bool)

(assert (=> bm!14078 m!151923))

(declare-fun m!151925 () Bool)

(assert (=> bm!14075 m!151925))

(declare-fun m!151927 () Bool)

(assert (=> bm!14075 m!151927))

(declare-fun m!151929 () Bool)

(assert (=> bm!14076 m!151929))

(declare-fun m!151931 () Bool)

(assert (=> bm!14076 m!151931))

(declare-fun m!151933 () Bool)

(assert (=> bm!14056 m!151933))

(declare-fun m!151935 () Bool)

(assert (=> b!129583 m!151935))

(declare-fun m!151937 () Bool)

(assert (=> b!129606 m!151937))

(declare-fun m!151939 () Bool)

(assert (=> bm!14061 m!151939))

(assert (=> b!129603 m!151849))

(declare-fun m!151941 () Bool)

(assert (=> b!129607 m!151941))

(assert (=> bm!14069 m!151753))

(declare-fun m!151943 () Bool)

(assert (=> bm!14069 m!151943))

(assert (=> b!129594 m!151751))

(declare-fun m!151945 () Bool)

(assert (=> b!129594 m!151945))

(declare-fun m!151947 () Bool)

(assert (=> b!129578 m!151947))

(assert (=> bm!14077 m!151753))

(declare-fun m!151949 () Bool)

(assert (=> bm!14077 m!151949))

(assert (=> b!129595 m!151753))

(declare-fun m!151951 () Bool)

(assert (=> b!129595 m!151951))

(assert (=> bm!14055 m!151753))

(declare-fun m!151953 () Bool)

(assert (=> bm!14055 m!151953))

(assert (=> b!129573 m!151753))

(assert (=> b!129573 m!151953))

(assert (=> bm!14074 m!151753))

(assert (=> bm!14074 m!151751))

(declare-fun m!151955 () Bool)

(assert (=> bm!14074 m!151955))

(declare-fun m!151957 () Bool)

(assert (=> b!129591 m!151957))

(assert (=> bm!14071 m!151775))

(assert (=> bm!14070 m!151753))

(declare-fun m!151959 () Bool)

(assert (=> bm!14070 m!151959))

(assert (=> b!129588 m!151751))

(declare-fun m!151961 () Bool)

(assert (=> b!129588 m!151961))

(declare-fun m!151963 () Bool)

(assert (=> b!129602 m!151963))

(assert (=> b!129599 m!151929))

(assert (=> b!129599 m!151753))

(assert (=> b!129599 m!151751))

(declare-fun m!151965 () Bool)

(assert (=> b!129599 m!151965))

(assert (=> b!129599 m!151849))

(assert (=> b!129599 m!151753))

(declare-fun m!151967 () Bool)

(assert (=> b!129599 m!151967))

(declare-fun m!151969 () Bool)

(assert (=> b!129599 m!151969))

(assert (=> b!129599 m!151849))

(declare-fun m!151971 () Bool)

(assert (=> d!39329 m!151971))

(assert (=> d!39329 m!151771))

(declare-fun m!151973 () Bool)

(assert (=> bm!14073 m!151973))

(declare-fun m!151975 () Bool)

(assert (=> b!129585 m!151975))

(assert (=> b!129282 d!39329))

(declare-fun d!39331 () Bool)

(declare-fun c!23863 () Bool)

(assert (=> d!39331 (= c!23863 ((_ is ValueCellFull!1085) (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355)))))

(declare-fun e!84583 () V!3457)

(assert (=> d!39331 (= (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) e!84583)))

(declare-fun b!129613 () Bool)

(declare-fun get!1461 (ValueCell!1085 V!3457) V!3457)

(assert (=> b!129613 (= e!84583 (get!1461 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!129614 () Bool)

(declare-fun get!1462 (ValueCell!1085 V!3457) V!3457)

(assert (=> b!129614 (= e!84583 (get!1462 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!39331 c!23863) b!129613))

(assert (= (and d!39331 (not c!23863)) b!129614))

(assert (=> b!129613 m!151747))

(assert (=> b!129613 m!151749))

(declare-fun m!151977 () Bool)

(assert (=> b!129613 m!151977))

(assert (=> b!129614 m!151747))

(assert (=> b!129614 m!151749))

(declare-fun m!151979 () Bool)

(assert (=> b!129614 m!151979))

(assert (=> b!129282 d!39331))

(declare-fun d!39333 () Bool)

(assert (=> d!39333 (= (valid!522 thiss!992) (valid!521 (v!3153 (underlying!442 thiss!992))))))

(declare-fun bs!5362 () Bool)

(assert (= bs!5362 d!39333))

(declare-fun m!151981 () Bool)

(assert (=> bs!5362 m!151981))

(assert (=> start!13964 d!39333))

(declare-fun condMapEmpty!4579 () Bool)

(declare-fun mapDefault!4579 () ValueCell!1085)

(assert (=> mapNonEmpty!4564 (= condMapEmpty!4579 (= mapRest!4564 ((as const (Array (_ BitVec 32) ValueCell!1085)) mapDefault!4579)))))

(declare-fun e!84589 () Bool)

(declare-fun mapRes!4579 () Bool)

(assert (=> mapNonEmpty!4564 (= tp!11068 (and e!84589 mapRes!4579))))

(declare-fun mapNonEmpty!4579 () Bool)

(declare-fun tp!11095 () Bool)

(declare-fun e!84588 () Bool)

(assert (=> mapNonEmpty!4579 (= mapRes!4579 (and tp!11095 e!84588))))

(declare-fun mapRest!4579 () (Array (_ BitVec 32) ValueCell!1085))

(declare-fun mapValue!4579 () ValueCell!1085)

(declare-fun mapKey!4579 () (_ BitVec 32))

(assert (=> mapNonEmpty!4579 (= mapRest!4564 (store mapRest!4579 mapKey!4579 mapValue!4579))))

(declare-fun mapIsEmpty!4579 () Bool)

(assert (=> mapIsEmpty!4579 mapRes!4579))

(declare-fun b!129622 () Bool)

(assert (=> b!129622 (= e!84589 tp_is_empty!2857)))

(declare-fun b!129621 () Bool)

(assert (=> b!129621 (= e!84588 tp_is_empty!2857)))

(assert (= (and mapNonEmpty!4564 condMapEmpty!4579) mapIsEmpty!4579))

(assert (= (and mapNonEmpty!4564 (not condMapEmpty!4579)) mapNonEmpty!4579))

(assert (= (and mapNonEmpty!4579 ((_ is ValueCellFull!1085) mapValue!4579)) b!129621))

(assert (= (and mapNonEmpty!4564 ((_ is ValueCellFull!1085) mapDefault!4579)) b!129622))

(declare-fun m!151983 () Bool)

(assert (=> mapNonEmpty!4579 m!151983))

(declare-fun condMapEmpty!4580 () Bool)

(declare-fun mapDefault!4580 () ValueCell!1085)

(assert (=> mapNonEmpty!4563 (= condMapEmpty!4580 (= mapRest!4563 ((as const (Array (_ BitVec 32) ValueCell!1085)) mapDefault!4580)))))

(declare-fun e!84591 () Bool)

(declare-fun mapRes!4580 () Bool)

(assert (=> mapNonEmpty!4563 (= tp!11066 (and e!84591 mapRes!4580))))

(declare-fun mapNonEmpty!4580 () Bool)

(declare-fun tp!11096 () Bool)

(declare-fun e!84590 () Bool)

(assert (=> mapNonEmpty!4580 (= mapRes!4580 (and tp!11096 e!84590))))

(declare-fun mapValue!4580 () ValueCell!1085)

(declare-fun mapKey!4580 () (_ BitVec 32))

(declare-fun mapRest!4580 () (Array (_ BitVec 32) ValueCell!1085))

(assert (=> mapNonEmpty!4580 (= mapRest!4563 (store mapRest!4580 mapKey!4580 mapValue!4580))))

(declare-fun mapIsEmpty!4580 () Bool)

(assert (=> mapIsEmpty!4580 mapRes!4580))

(declare-fun b!129624 () Bool)

(assert (=> b!129624 (= e!84591 tp_is_empty!2857)))

(declare-fun b!129623 () Bool)

(assert (=> b!129623 (= e!84590 tp_is_empty!2857)))

(assert (= (and mapNonEmpty!4563 condMapEmpty!4580) mapIsEmpty!4580))

(assert (= (and mapNonEmpty!4563 (not condMapEmpty!4580)) mapNonEmpty!4580))

(assert (= (and mapNonEmpty!4580 ((_ is ValueCellFull!1085) mapValue!4580)) b!129623))

(assert (= (and mapNonEmpty!4563 ((_ is ValueCellFull!1085) mapDefault!4580)) b!129624))

(declare-fun m!151985 () Bool)

(assert (=> mapNonEmpty!4580 m!151985))

(declare-fun b_lambda!5741 () Bool)

(assert (= b_lambda!5739 (or (and b!129281 b_free!2881) (and b!129277 b_free!2883 (= (defaultEntry!2823 newMap!16) (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))))) b_lambda!5741)))

(check-sat (not bm!14055) b_and!8001 (not b!129471) (not b!129449) (not b!129452) (not d!39333) (not bm!14056) (not bm!14061) (not mapNonEmpty!4580) (not b!129458) (not b!129614) (not b!129588) (not d!39327) (not bm!14071) (not bm!14070) (not bm!14078) (not b!129447) b_and!8003 (not b!129613) (not b!129602) (not bm!14077) (not b!129482) (not mapNonEmpty!4579) (not bm!14074) (not d!39313) (not bm!14075) (not b_lambda!5737) (not bm!14006) (not b_next!2883) (not b!129595) (not b_lambda!5741) (not bm!14073) (not b!129457) (not b!129573) (not b!129480) (not b!129451) (not bm!14069) (not b!129462) (not b!129473) (not b_next!2881) (not bm!14076) (not bm!14002) tp_is_empty!2857 (not b!129594) (not d!39329) (not bm!14005) (not b!129599) (not d!39325) (not bm!14001) (not b!129603) (not d!39315) (not b!129472) (not b!129445))
(check-sat b_and!8001 b_and!8003 (not b_next!2881) (not b_next!2883))
(get-model)

(declare-fun b!129649 () Bool)

(declare-fun e!84607 () Bool)

(declare-fun e!84612 () Bool)

(assert (=> b!129649 (= e!84607 e!84612)))

(assert (=> b!129649 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2497 (_keys!4563 (v!3153 (underlying!442 thiss!992))))))))

(declare-fun res!62497 () Bool)

(declare-fun lt!67185 () ListLongMap!1661)

(assert (=> b!129649 (= res!62497 (contains!876 lt!67185 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!129649 (=> (not res!62497) (not e!84612))))

(declare-fun bm!14081 () Bool)

(declare-fun call!14084 () ListLongMap!1661)

(assert (=> bm!14081 (= call!14084 (getCurrentListMapNoExtraKeys!125 (_keys!4563 (v!3153 (underlying!442 thiss!992))) (_values!2806 (v!3153 (underlying!442 thiss!992))) (mask!7100 (v!3153 (underlying!442 thiss!992))) (extraKeys!2596 (v!3153 (underlying!442 thiss!992))) (zeroValue!2682 (v!3153 (underlying!442 thiss!992))) (minValue!2682 (v!3153 (underlying!442 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!2823 (v!3153 (underlying!442 thiss!992)))))))

(declare-fun b!129650 () Bool)

(declare-fun e!84606 () ListLongMap!1661)

(declare-fun e!84609 () ListLongMap!1661)

(assert (=> b!129650 (= e!84606 e!84609)))

(declare-fun c!23872 () Bool)

(assert (=> b!129650 (= c!23872 (validKeyInArray!0 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!129651 () Bool)

(assert (=> b!129651 (= e!84609 call!14084)))

(declare-fun d!39335 () Bool)

(declare-fun e!84610 () Bool)

(assert (=> d!39335 e!84610))

(declare-fun res!62500 () Bool)

(assert (=> d!39335 (=> (not res!62500) (not e!84610))))

(assert (=> d!39335 (= res!62500 (not (contains!876 lt!67185 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!39335 (= lt!67185 e!84606)))

(declare-fun c!23873 () Bool)

(assert (=> d!39335 (= c!23873 (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2497 (_keys!4563 (v!3153 (underlying!442 thiss!992))))))))

(assert (=> d!39335 (validMask!0 (mask!7100 (v!3153 (underlying!442 thiss!992))))))

(assert (=> d!39335 (= (getCurrentListMapNoExtraKeys!125 (_keys!4563 (v!3153 (underlying!442 thiss!992))) (_values!2806 (v!3153 (underlying!442 thiss!992))) (mask!7100 (v!3153 (underlying!442 thiss!992))) (extraKeys!2596 (v!3153 (underlying!442 thiss!992))) (zeroValue!2682 (v!3153 (underlying!442 thiss!992))) (minValue!2682 (v!3153 (underlying!442 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2823 (v!3153 (underlying!442 thiss!992)))) lt!67185)))

(declare-fun b!129652 () Bool)

(declare-fun e!84611 () Bool)

(assert (=> b!129652 (= e!84607 e!84611)))

(declare-fun c!23875 () Bool)

(assert (=> b!129652 (= c!23875 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2497 (_keys!4563 (v!3153 (underlying!442 thiss!992))))))))

(declare-fun b!129653 () Bool)

(assert (=> b!129653 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2497 (_keys!4563 (v!3153 (underlying!442 thiss!992))))))))

(assert (=> b!129653 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2498 (_values!2806 (v!3153 (underlying!442 thiss!992))))))))

(assert (=> b!129653 (= e!84612 (= (apply!113 lt!67185 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!129654 () Bool)

(assert (=> b!129654 (= e!84611 (= lt!67185 (getCurrentListMapNoExtraKeys!125 (_keys!4563 (v!3153 (underlying!442 thiss!992))) (_values!2806 (v!3153 (underlying!442 thiss!992))) (mask!7100 (v!3153 (underlying!442 thiss!992))) (extraKeys!2596 (v!3153 (underlying!442 thiss!992))) (zeroValue!2682 (v!3153 (underlying!442 thiss!992))) (minValue!2682 (v!3153 (underlying!442 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))))))))

(declare-fun b!129655 () Bool)

(declare-fun lt!67186 () Unit!4037)

(declare-fun lt!67189 () Unit!4037)

(assert (=> b!129655 (= lt!67186 lt!67189)))

(declare-fun lt!67190 () (_ BitVec 64))

(declare-fun lt!67187 () V!3457)

(declare-fun lt!67191 () ListLongMap!1661)

(declare-fun lt!67188 () (_ BitVec 64))

(assert (=> b!129655 (not (contains!876 (+!160 lt!67191 (tuple2!2567 lt!67190 lt!67187)) lt!67188))))

(declare-fun addStillNotContains!59 (ListLongMap!1661 (_ BitVec 64) V!3457 (_ BitVec 64)) Unit!4037)

(assert (=> b!129655 (= lt!67189 (addStillNotContains!59 lt!67191 lt!67190 lt!67187 lt!67188))))

(assert (=> b!129655 (= lt!67188 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!129655 (= lt!67187 (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!129655 (= lt!67190 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(assert (=> b!129655 (= lt!67191 call!14084)))

(assert (=> b!129655 (= e!84609 (+!160 call!14084 (tuple2!2567 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!129656 () Bool)

(assert (=> b!129656 (= e!84606 (ListLongMap!1662 Nil!1698))))

(declare-fun b!129657 () Bool)

(declare-fun isEmpty!406 (ListLongMap!1661) Bool)

(assert (=> b!129657 (= e!84611 (isEmpty!406 lt!67185))))

(declare-fun b!129658 () Bool)

(declare-fun res!62498 () Bool)

(assert (=> b!129658 (=> (not res!62498) (not e!84610))))

(assert (=> b!129658 (= res!62498 (not (contains!876 lt!67185 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!129659 () Bool)

(assert (=> b!129659 (= e!84610 e!84607)))

(declare-fun c!23874 () Bool)

(declare-fun e!84608 () Bool)

(assert (=> b!129659 (= c!23874 e!84608)))

(declare-fun res!62499 () Bool)

(assert (=> b!129659 (=> (not res!62499) (not e!84608))))

(assert (=> b!129659 (= res!62499 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2497 (_keys!4563 (v!3153 (underlying!442 thiss!992))))))))

(declare-fun b!129660 () Bool)

(assert (=> b!129660 (= e!84608 (validKeyInArray!0 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!129660 (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000)))

(assert (= (and d!39335 c!23873) b!129656))

(assert (= (and d!39335 (not c!23873)) b!129650))

(assert (= (and b!129650 c!23872) b!129655))

(assert (= (and b!129650 (not c!23872)) b!129651))

(assert (= (or b!129655 b!129651) bm!14081))

(assert (= (and d!39335 res!62500) b!129658))

(assert (= (and b!129658 res!62498) b!129659))

(assert (= (and b!129659 res!62499) b!129660))

(assert (= (and b!129659 c!23874) b!129649))

(assert (= (and b!129659 (not c!23874)) b!129652))

(assert (= (and b!129649 res!62497) b!129653))

(assert (= (and b!129652 c!23875) b!129654))

(assert (= (and b!129652 (not c!23875)) b!129657))

(declare-fun b_lambda!5743 () Bool)

(assert (=> (not b_lambda!5743) (not b!129653)))

(assert (=> b!129653 t!6088))

(declare-fun b_and!8005 () Bool)

(assert (= b_and!8001 (and (=> t!6088 result!3897) b_and!8005)))

(assert (=> b!129653 t!6090))

(declare-fun b_and!8007 () Bool)

(assert (= b_and!8003 (and (=> t!6090 result!3901) b_and!8007)))

(declare-fun b_lambda!5745 () Bool)

(assert (=> (not b_lambda!5745) (not b!129655)))

(assert (=> b!129655 t!6088))

(declare-fun b_and!8009 () Bool)

(assert (= b_and!8005 (and (=> t!6088 result!3897) b_and!8009)))

(assert (=> b!129655 t!6090))

(declare-fun b_and!8011 () Bool)

(assert (= b_and!8007 (and (=> t!6090 result!3901) b_and!8011)))

(declare-fun m!151987 () Bool)

(assert (=> b!129658 m!151987))

(assert (=> b!129660 m!151855))

(assert (=> b!129660 m!151855))

(assert (=> b!129660 m!151857))

(declare-fun m!151989 () Bool)

(assert (=> b!129654 m!151989))

(declare-fun m!151991 () Bool)

(assert (=> b!129655 m!151991))

(declare-fun m!151993 () Bool)

(assert (=> b!129655 m!151993))

(assert (=> b!129655 m!151901))

(declare-fun m!151995 () Bool)

(assert (=> b!129655 m!151995))

(assert (=> b!129655 m!151901))

(assert (=> b!129655 m!151749))

(assert (=> b!129655 m!151905))

(assert (=> b!129655 m!151855))

(assert (=> b!129655 m!151749))

(assert (=> b!129655 m!151993))

(declare-fun m!151997 () Bool)

(assert (=> b!129655 m!151997))

(declare-fun m!151999 () Bool)

(assert (=> d!39335 m!151999))

(assert (=> d!39335 m!151769))

(assert (=> b!129649 m!151855))

(assert (=> b!129649 m!151855))

(declare-fun m!152001 () Bool)

(assert (=> b!129649 m!152001))

(assert (=> b!129650 m!151855))

(assert (=> b!129650 m!151855))

(assert (=> b!129650 m!151857))

(assert (=> bm!14081 m!151989))

(assert (=> b!129653 m!151855))

(declare-fun m!152003 () Bool)

(assert (=> b!129653 m!152003))

(assert (=> b!129653 m!151901))

(assert (=> b!129653 m!151901))

(assert (=> b!129653 m!151749))

(assert (=> b!129653 m!151905))

(assert (=> b!129653 m!151855))

(assert (=> b!129653 m!151749))

(declare-fun m!152005 () Bool)

(assert (=> b!129657 m!152005))

(assert (=> bm!14001 d!39335))

(declare-fun d!39337 () Bool)

(declare-fun e!84614 () Bool)

(assert (=> d!39337 e!84614))

(declare-fun res!62501 () Bool)

(assert (=> d!39337 (=> res!62501 e!84614)))

(declare-fun lt!67194 () Bool)

(assert (=> d!39337 (= res!62501 (not lt!67194))))

(declare-fun lt!67195 () Bool)

(assert (=> d!39337 (= lt!67194 lt!67195)))

(declare-fun lt!67192 () Unit!4037)

(declare-fun e!84613 () Unit!4037)

(assert (=> d!39337 (= lt!67192 e!84613)))

(declare-fun c!23876 () Bool)

(assert (=> d!39337 (= c!23876 lt!67195)))

(assert (=> d!39337 (= lt!67195 (containsKey!171 (toList!846 lt!67071) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!39337 (= (contains!876 lt!67071 #b1000000000000000000000000000000000000000000000000000000000000000) lt!67194)))

(declare-fun b!129661 () Bool)

(declare-fun lt!67193 () Unit!4037)

(assert (=> b!129661 (= e!84613 lt!67193)))

(assert (=> b!129661 (= lt!67193 (lemmaContainsKeyImpliesGetValueByKeyDefined!120 (toList!846 lt!67071) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!129661 (isDefined!121 (getValueByKey!167 (toList!846 lt!67071) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!129662 () Bool)

(declare-fun Unit!4043 () Unit!4037)

(assert (=> b!129662 (= e!84613 Unit!4043)))

(declare-fun b!129663 () Bool)

(assert (=> b!129663 (= e!84614 (isDefined!121 (getValueByKey!167 (toList!846 lt!67071) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!39337 c!23876) b!129661))

(assert (= (and d!39337 (not c!23876)) b!129662))

(assert (= (and d!39337 (not res!62501)) b!129663))

(declare-fun m!152007 () Bool)

(assert (=> d!39337 m!152007))

(declare-fun m!152009 () Bool)

(assert (=> b!129661 m!152009))

(declare-fun m!152011 () Bool)

(assert (=> b!129661 m!152011))

(assert (=> b!129661 m!152011))

(declare-fun m!152013 () Bool)

(assert (=> b!129661 m!152013))

(assert (=> b!129663 m!152011))

(assert (=> b!129663 m!152011))

(assert (=> b!129663 m!152013))

(assert (=> bm!14002 d!39337))

(declare-fun b!129664 () Bool)

(declare-fun res!62510 () Bool)

(declare-fun e!84625 () Bool)

(assert (=> b!129664 (=> (not res!62510) (not e!84625))))

(declare-fun e!84622 () Bool)

(assert (=> b!129664 (= res!62510 e!84622)))

(declare-fun res!62503 () Bool)

(assert (=> b!129664 (=> res!62503 e!84622)))

(declare-fun e!84618 () Bool)

(assert (=> b!129664 (= res!62503 (not e!84618))))

(declare-fun res!62508 () Bool)

(assert (=> b!129664 (=> (not res!62508) (not e!84618))))

(assert (=> b!129664 (= res!62508 (bvslt #b00000000000000000000000000000000 (size!2497 (_keys!4563 newMap!16))))))

(declare-fun b!129665 () Bool)

(declare-fun e!84627 () Bool)

(declare-fun lt!67211 () ListLongMap!1661)

(assert (=> b!129665 (= e!84627 (= (apply!113 lt!67211 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2682 newMap!16)))))

(declare-fun b!129666 () Bool)

(declare-fun e!84623 () Bool)

(assert (=> b!129666 (= e!84623 e!84627)))

(declare-fun res!62507 () Bool)

(declare-fun call!14087 () Bool)

(assert (=> b!129666 (= res!62507 call!14087)))

(assert (=> b!129666 (=> (not res!62507) (not e!84627))))

(declare-fun b!129667 () Bool)

(declare-fun e!84616 () Bool)

(assert (=> b!129667 (= e!84622 e!84616)))

(declare-fun res!62505 () Bool)

(assert (=> b!129667 (=> (not res!62505) (not e!84616))))

(assert (=> b!129667 (= res!62505 (contains!876 lt!67211 (select (arr!2230 (_keys!4563 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!129667 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2497 (_keys!4563 newMap!16))))))

(declare-fun bm!14082 () Bool)

(declare-fun call!14090 () ListLongMap!1661)

(declare-fun call!14089 () ListLongMap!1661)

(assert (=> bm!14082 (= call!14090 call!14089)))

(declare-fun b!129668 () Bool)

(declare-fun e!84615 () Bool)

(declare-fun e!84617 () Bool)

(assert (=> b!129668 (= e!84615 e!84617)))

(declare-fun res!62506 () Bool)

(declare-fun call!14085 () Bool)

(assert (=> b!129668 (= res!62506 call!14085)))

(assert (=> b!129668 (=> (not res!62506) (not e!84617))))

(declare-fun b!129670 () Bool)

(declare-fun e!84626 () ListLongMap!1661)

(declare-fun call!14091 () ListLongMap!1661)

(assert (=> b!129670 (= e!84626 call!14091)))

(declare-fun b!129671 () Bool)

(declare-fun e!84619 () Bool)

(assert (=> b!129671 (= e!84619 (validKeyInArray!0 (select (arr!2230 (_keys!4563 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun bm!14083 () Bool)

(assert (=> bm!14083 (= call!14089 (getCurrentListMapNoExtraKeys!125 (_keys!4563 newMap!16) (_values!2806 newMap!16) (mask!7100 newMap!16) (extraKeys!2596 newMap!16) (zeroValue!2682 newMap!16) (minValue!2682 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2823 newMap!16)))))

(declare-fun bm!14084 () Bool)

(assert (=> bm!14084 (= call!14085 (contains!876 lt!67211 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!129672 () Bool)

(assert (=> b!129672 (= e!84616 (= (apply!113 lt!67211 (select (arr!2230 (_keys!4563 newMap!16)) #b00000000000000000000000000000000)) (get!1459 (select (arr!2231 (_values!2806 newMap!16)) #b00000000000000000000000000000000) (dynLambda!414 (defaultEntry!2823 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!129672 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2498 (_values!2806 newMap!16))))))

(assert (=> b!129672 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2497 (_keys!4563 newMap!16))))))

(declare-fun b!129673 () Bool)

(assert (=> b!129673 (= e!84625 e!84615)))

(declare-fun c!23878 () Bool)

(assert (=> b!129673 (= c!23878 (not (= (bvand (extraKeys!2596 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!129674 () Bool)

(assert (=> b!129674 (= e!84623 (not call!14087))))

(declare-fun b!129675 () Bool)

(declare-fun e!84621 () Unit!4037)

(declare-fun Unit!4044 () Unit!4037)

(assert (=> b!129675 (= e!84621 Unit!4044)))

(declare-fun b!129676 () Bool)

(declare-fun e!84624 () ListLongMap!1661)

(declare-fun call!14088 () ListLongMap!1661)

(assert (=> b!129676 (= e!84624 call!14088)))

(declare-fun bm!14085 () Bool)

(declare-fun call!14086 () ListLongMap!1661)

(assert (=> bm!14085 (= call!14088 call!14086)))

(declare-fun b!129677 () Bool)

(declare-fun lt!67205 () Unit!4037)

(assert (=> b!129677 (= e!84621 lt!67205)))

(declare-fun lt!67201 () ListLongMap!1661)

(assert (=> b!129677 (= lt!67201 (getCurrentListMapNoExtraKeys!125 (_keys!4563 newMap!16) (_values!2806 newMap!16) (mask!7100 newMap!16) (extraKeys!2596 newMap!16) (zeroValue!2682 newMap!16) (minValue!2682 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2823 newMap!16)))))

(declare-fun lt!67213 () (_ BitVec 64))

(assert (=> b!129677 (= lt!67213 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!67203 () (_ BitVec 64))

(assert (=> b!129677 (= lt!67203 (select (arr!2230 (_keys!4563 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!67202 () Unit!4037)

(assert (=> b!129677 (= lt!67202 (addStillContains!89 lt!67201 lt!67213 (zeroValue!2682 newMap!16) lt!67203))))

(assert (=> b!129677 (contains!876 (+!160 lt!67201 (tuple2!2567 lt!67213 (zeroValue!2682 newMap!16))) lt!67203)))

(declare-fun lt!67204 () Unit!4037)

(assert (=> b!129677 (= lt!67204 lt!67202)))

(declare-fun lt!67214 () ListLongMap!1661)

(assert (=> b!129677 (= lt!67214 (getCurrentListMapNoExtraKeys!125 (_keys!4563 newMap!16) (_values!2806 newMap!16) (mask!7100 newMap!16) (extraKeys!2596 newMap!16) (zeroValue!2682 newMap!16) (minValue!2682 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2823 newMap!16)))))

(declare-fun lt!67196 () (_ BitVec 64))

(assert (=> b!129677 (= lt!67196 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!67206 () (_ BitVec 64))

(assert (=> b!129677 (= lt!67206 (select (arr!2230 (_keys!4563 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!67216 () Unit!4037)

(assert (=> b!129677 (= lt!67216 (addApplyDifferent!89 lt!67214 lt!67196 (minValue!2682 newMap!16) lt!67206))))

(assert (=> b!129677 (= (apply!113 (+!160 lt!67214 (tuple2!2567 lt!67196 (minValue!2682 newMap!16))) lt!67206) (apply!113 lt!67214 lt!67206))))

(declare-fun lt!67212 () Unit!4037)

(assert (=> b!129677 (= lt!67212 lt!67216)))

(declare-fun lt!67199 () ListLongMap!1661)

(assert (=> b!129677 (= lt!67199 (getCurrentListMapNoExtraKeys!125 (_keys!4563 newMap!16) (_values!2806 newMap!16) (mask!7100 newMap!16) (extraKeys!2596 newMap!16) (zeroValue!2682 newMap!16) (minValue!2682 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2823 newMap!16)))))

(declare-fun lt!67215 () (_ BitVec 64))

(assert (=> b!129677 (= lt!67215 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!67208 () (_ BitVec 64))

(assert (=> b!129677 (= lt!67208 (select (arr!2230 (_keys!4563 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!67210 () Unit!4037)

(assert (=> b!129677 (= lt!67210 (addApplyDifferent!89 lt!67199 lt!67215 (zeroValue!2682 newMap!16) lt!67208))))

(assert (=> b!129677 (= (apply!113 (+!160 lt!67199 (tuple2!2567 lt!67215 (zeroValue!2682 newMap!16))) lt!67208) (apply!113 lt!67199 lt!67208))))

(declare-fun lt!67209 () Unit!4037)

(assert (=> b!129677 (= lt!67209 lt!67210)))

(declare-fun lt!67207 () ListLongMap!1661)

(assert (=> b!129677 (= lt!67207 (getCurrentListMapNoExtraKeys!125 (_keys!4563 newMap!16) (_values!2806 newMap!16) (mask!7100 newMap!16) (extraKeys!2596 newMap!16) (zeroValue!2682 newMap!16) (minValue!2682 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2823 newMap!16)))))

(declare-fun lt!67200 () (_ BitVec 64))

(assert (=> b!129677 (= lt!67200 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!67217 () (_ BitVec 64))

(assert (=> b!129677 (= lt!67217 (select (arr!2230 (_keys!4563 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!129677 (= lt!67205 (addApplyDifferent!89 lt!67207 lt!67200 (minValue!2682 newMap!16) lt!67217))))

(assert (=> b!129677 (= (apply!113 (+!160 lt!67207 (tuple2!2567 lt!67200 (minValue!2682 newMap!16))) lt!67217) (apply!113 lt!67207 lt!67217))))

(declare-fun b!129678 () Bool)

(assert (=> b!129678 (= e!84618 (validKeyInArray!0 (select (arr!2230 (_keys!4563 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!129679 () Bool)

(declare-fun c!23881 () Bool)

(assert (=> b!129679 (= c!23881 (and (not (= (bvand (extraKeys!2596 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2596 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!129679 (= e!84624 e!84626)))

(declare-fun b!129680 () Bool)

(declare-fun res!62509 () Bool)

(assert (=> b!129680 (=> (not res!62509) (not e!84625))))

(assert (=> b!129680 (= res!62509 e!84623)))

(declare-fun c!23879 () Bool)

(assert (=> b!129680 (= c!23879 (not (= (bvand (extraKeys!2596 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!129681 () Bool)

(assert (=> b!129681 (= e!84626 call!14088)))

(declare-fun bm!14086 () Bool)

(assert (=> bm!14086 (= call!14091 call!14090)))

(declare-fun b!129682 () Bool)

(assert (=> b!129682 (= e!84617 (= (apply!113 lt!67211 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2682 newMap!16)))))

(declare-fun b!129669 () Bool)

(declare-fun e!84620 () ListLongMap!1661)

(assert (=> b!129669 (= e!84620 (+!160 call!14086 (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2682 newMap!16))))))

(declare-fun d!39339 () Bool)

(assert (=> d!39339 e!84625))

(declare-fun res!62504 () Bool)

(assert (=> d!39339 (=> (not res!62504) (not e!84625))))

(assert (=> d!39339 (= res!62504 (or (bvsge #b00000000000000000000000000000000 (size!2497 (_keys!4563 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2497 (_keys!4563 newMap!16))))))))

(declare-fun lt!67197 () ListLongMap!1661)

(assert (=> d!39339 (= lt!67211 lt!67197)))

(declare-fun lt!67198 () Unit!4037)

(assert (=> d!39339 (= lt!67198 e!84621)))

(declare-fun c!23877 () Bool)

(assert (=> d!39339 (= c!23877 e!84619)))

(declare-fun res!62502 () Bool)

(assert (=> d!39339 (=> (not res!62502) (not e!84619))))

(assert (=> d!39339 (= res!62502 (bvslt #b00000000000000000000000000000000 (size!2497 (_keys!4563 newMap!16))))))

(assert (=> d!39339 (= lt!67197 e!84620)))

(declare-fun c!23882 () Bool)

(assert (=> d!39339 (= c!23882 (and (not (= (bvand (extraKeys!2596 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2596 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!39339 (validMask!0 (mask!7100 newMap!16))))

(assert (=> d!39339 (= (getCurrentListMap!515 (_keys!4563 newMap!16) (_values!2806 newMap!16) (mask!7100 newMap!16) (extraKeys!2596 newMap!16) (zeroValue!2682 newMap!16) (minValue!2682 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2823 newMap!16)) lt!67211)))

(declare-fun bm!14087 () Bool)

(assert (=> bm!14087 (= call!14087 (contains!876 lt!67211 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!129683 () Bool)

(assert (=> b!129683 (= e!84620 e!84624)))

(declare-fun c!23880 () Bool)

(assert (=> b!129683 (= c!23880 (and (not (= (bvand (extraKeys!2596 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2596 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!14088 () Bool)

(assert (=> bm!14088 (= call!14086 (+!160 (ite c!23882 call!14089 (ite c!23880 call!14090 call!14091)) (ite (or c!23882 c!23880) (tuple2!2567 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2682 newMap!16)) (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2682 newMap!16)))))))

(declare-fun b!129684 () Bool)

(assert (=> b!129684 (= e!84615 (not call!14085))))

(assert (= (and d!39339 c!23882) b!129669))

(assert (= (and d!39339 (not c!23882)) b!129683))

(assert (= (and b!129683 c!23880) b!129676))

(assert (= (and b!129683 (not c!23880)) b!129679))

(assert (= (and b!129679 c!23881) b!129681))

(assert (= (and b!129679 (not c!23881)) b!129670))

(assert (= (or b!129681 b!129670) bm!14086))

(assert (= (or b!129676 bm!14086) bm!14082))

(assert (= (or b!129676 b!129681) bm!14085))

(assert (= (or b!129669 bm!14082) bm!14083))

(assert (= (or b!129669 bm!14085) bm!14088))

(assert (= (and d!39339 res!62502) b!129671))

(assert (= (and d!39339 c!23877) b!129677))

(assert (= (and d!39339 (not c!23877)) b!129675))

(assert (= (and d!39339 res!62504) b!129664))

(assert (= (and b!129664 res!62508) b!129678))

(assert (= (and b!129664 (not res!62503)) b!129667))

(assert (= (and b!129667 res!62505) b!129672))

(assert (= (and b!129664 res!62510) b!129680))

(assert (= (and b!129680 c!23879) b!129666))

(assert (= (and b!129680 (not c!23879)) b!129674))

(assert (= (and b!129666 res!62507) b!129665))

(assert (= (or b!129666 b!129674) bm!14087))

(assert (= (and b!129680 res!62509) b!129673))

(assert (= (and b!129673 c!23878) b!129668))

(assert (= (and b!129673 (not c!23878)) b!129684))

(assert (= (and b!129668 res!62506) b!129682))

(assert (= (or b!129668 b!129684) bm!14084))

(declare-fun b_lambda!5747 () Bool)

(assert (=> (not b_lambda!5747) (not b!129672)))

(declare-fun tb!2365 () Bool)

(declare-fun t!6103 () Bool)

(assert (=> (and b!129281 (= (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) (defaultEntry!2823 newMap!16)) t!6103) tb!2365))

(declare-fun result!3917 () Bool)

(assert (=> tb!2365 (= result!3917 tp_is_empty!2857)))

(assert (=> b!129672 t!6103))

(declare-fun b_and!8013 () Bool)

(assert (= b_and!8009 (and (=> t!6103 result!3917) b_and!8013)))

(declare-fun t!6105 () Bool)

(declare-fun tb!2367 () Bool)

(assert (=> (and b!129277 (= (defaultEntry!2823 newMap!16) (defaultEntry!2823 newMap!16)) t!6105) tb!2367))

(declare-fun result!3919 () Bool)

(assert (= result!3919 result!3917))

(assert (=> b!129672 t!6105))

(declare-fun b_and!8015 () Bool)

(assert (= b_and!8011 (and (=> t!6105 result!3919) b_and!8015)))

(declare-fun m!152015 () Bool)

(assert (=> bm!14084 m!152015))

(declare-fun m!152017 () Bool)

(assert (=> bm!14083 m!152017))

(declare-fun m!152019 () Bool)

(assert (=> b!129678 m!152019))

(assert (=> b!129678 m!152019))

(declare-fun m!152021 () Bool)

(assert (=> b!129678 m!152021))

(declare-fun m!152023 () Bool)

(assert (=> b!129669 m!152023))

(declare-fun m!152025 () Bool)

(assert (=> d!39339 m!152025))

(declare-fun m!152027 () Bool)

(assert (=> b!129665 m!152027))

(assert (=> b!129671 m!152019))

(assert (=> b!129671 m!152019))

(assert (=> b!129671 m!152021))

(declare-fun m!152029 () Bool)

(assert (=> b!129682 m!152029))

(declare-fun m!152031 () Bool)

(assert (=> bm!14088 m!152031))

(declare-fun m!152033 () Bool)

(assert (=> b!129677 m!152033))

(declare-fun m!152035 () Bool)

(assert (=> b!129677 m!152035))

(declare-fun m!152037 () Bool)

(assert (=> b!129677 m!152037))

(declare-fun m!152039 () Bool)

(assert (=> b!129677 m!152039))

(declare-fun m!152041 () Bool)

(assert (=> b!129677 m!152041))

(declare-fun m!152043 () Bool)

(assert (=> b!129677 m!152043))

(assert (=> b!129677 m!152017))

(declare-fun m!152045 () Bool)

(assert (=> b!129677 m!152045))

(assert (=> b!129677 m!152019))

(declare-fun m!152047 () Bool)

(assert (=> b!129677 m!152047))

(declare-fun m!152049 () Bool)

(assert (=> b!129677 m!152049))

(declare-fun m!152051 () Bool)

(assert (=> b!129677 m!152051))

(assert (=> b!129677 m!152043))

(declare-fun m!152053 () Bool)

(assert (=> b!129677 m!152053))

(assert (=> b!129677 m!152037))

(declare-fun m!152055 () Bool)

(assert (=> b!129677 m!152055))

(declare-fun m!152057 () Bool)

(assert (=> b!129677 m!152057))

(declare-fun m!152059 () Bool)

(assert (=> b!129677 m!152059))

(assert (=> b!129677 m!152049))

(assert (=> b!129677 m!152047))

(declare-fun m!152061 () Bool)

(assert (=> b!129677 m!152061))

(declare-fun m!152063 () Bool)

(assert (=> bm!14087 m!152063))

(assert (=> b!129667 m!152019))

(assert (=> b!129667 m!152019))

(declare-fun m!152065 () Bool)

(assert (=> b!129667 m!152065))

(assert (=> b!129672 m!152019))

(declare-fun m!152067 () Bool)

(assert (=> b!129672 m!152067))

(assert (=> b!129672 m!152019))

(declare-fun m!152069 () Bool)

(assert (=> b!129672 m!152069))

(assert (=> b!129672 m!152067))

(declare-fun m!152071 () Bool)

(assert (=> b!129672 m!152071))

(declare-fun m!152073 () Bool)

(assert (=> b!129672 m!152073))

(assert (=> b!129672 m!152071))

(assert (=> d!39313 d!39339))

(assert (=> bm!14071 d!39313))

(declare-fun d!39341 () Bool)

(declare-fun get!1463 (Option!173) V!3457)

(assert (=> d!39341 (= (apply!113 lt!67071 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1463 (getValueByKey!167 (toList!846 lt!67071) (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(declare-fun bs!5363 () Bool)

(assert (= bs!5363 d!39341))

(assert (=> bs!5363 m!151855))

(declare-fun m!152075 () Bool)

(assert (=> bs!5363 m!152075))

(assert (=> bs!5363 m!152075))

(declare-fun m!152077 () Bool)

(assert (=> bs!5363 m!152077))

(assert (=> b!129452 d!39341))

(declare-fun d!39343 () Bool)

(declare-fun c!23883 () Bool)

(assert (=> d!39343 (= c!23883 ((_ is ValueCellFull!1085) (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun e!84628 () V!3457)

(assert (=> d!39343 (= (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) e!84628)))

(declare-fun b!129685 () Bool)

(assert (=> b!129685 (= e!84628 (get!1461 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!129686 () Bool)

(assert (=> b!129686 (= e!84628 (get!1462 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!39343 c!23883) b!129685))

(assert (= (and d!39343 (not c!23883)) b!129686))

(assert (=> b!129685 m!151901))

(assert (=> b!129685 m!151749))

(declare-fun m!152079 () Bool)

(assert (=> b!129685 m!152079))

(assert (=> b!129686 m!151901))

(assert (=> b!129686 m!151749))

(declare-fun m!152081 () Bool)

(assert (=> b!129686 m!152081))

(assert (=> b!129452 d!39343))

(declare-fun d!39345 () Bool)

(declare-fun e!84631 () Bool)

(assert (=> d!39345 e!84631))

(declare-fun res!62515 () Bool)

(assert (=> d!39345 (=> (not res!62515) (not e!84631))))

(declare-fun lt!67229 () ListLongMap!1661)

(assert (=> d!39345 (= res!62515 (contains!876 lt!67229 (_1!1294 (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2682 (v!3153 (underlying!442 thiss!992)))))))))

(declare-fun lt!67226 () List!1701)

(assert (=> d!39345 (= lt!67229 (ListLongMap!1662 lt!67226))))

(declare-fun lt!67227 () Unit!4037)

(declare-fun lt!67228 () Unit!4037)

(assert (=> d!39345 (= lt!67227 lt!67228)))

(assert (=> d!39345 (= (getValueByKey!167 lt!67226 (_1!1294 (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2682 (v!3153 (underlying!442 thiss!992)))))) (Some!172 (_2!1294 (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2682 (v!3153 (underlying!442 thiss!992)))))))))

(declare-fun lemmaContainsTupThenGetReturnValue!85 (List!1701 (_ BitVec 64) V!3457) Unit!4037)

(assert (=> d!39345 (= lt!67228 (lemmaContainsTupThenGetReturnValue!85 lt!67226 (_1!1294 (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2682 (v!3153 (underlying!442 thiss!992))))) (_2!1294 (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2682 (v!3153 (underlying!442 thiss!992)))))))))

(declare-fun insertStrictlySorted!88 (List!1701 (_ BitVec 64) V!3457) List!1701)

(assert (=> d!39345 (= lt!67226 (insertStrictlySorted!88 (toList!846 call!14004) (_1!1294 (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2682 (v!3153 (underlying!442 thiss!992))))) (_2!1294 (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2682 (v!3153 (underlying!442 thiss!992)))))))))

(assert (=> d!39345 (= (+!160 call!14004 (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2682 (v!3153 (underlying!442 thiss!992))))) lt!67229)))

(declare-fun b!129691 () Bool)

(declare-fun res!62516 () Bool)

(assert (=> b!129691 (=> (not res!62516) (not e!84631))))

(assert (=> b!129691 (= res!62516 (= (getValueByKey!167 (toList!846 lt!67229) (_1!1294 (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2682 (v!3153 (underlying!442 thiss!992)))))) (Some!172 (_2!1294 (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2682 (v!3153 (underlying!442 thiss!992))))))))))

(declare-fun b!129692 () Bool)

(declare-fun contains!878 (List!1701 tuple2!2566) Bool)

(assert (=> b!129692 (= e!84631 (contains!878 (toList!846 lt!67229) (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2682 (v!3153 (underlying!442 thiss!992))))))))

(assert (= (and d!39345 res!62515) b!129691))

(assert (= (and b!129691 res!62516) b!129692))

(declare-fun m!152083 () Bool)

(assert (=> d!39345 m!152083))

(declare-fun m!152085 () Bool)

(assert (=> d!39345 m!152085))

(declare-fun m!152087 () Bool)

(assert (=> d!39345 m!152087))

(declare-fun m!152089 () Bool)

(assert (=> d!39345 m!152089))

(declare-fun m!152091 () Bool)

(assert (=> b!129691 m!152091))

(declare-fun m!152093 () Bool)

(assert (=> b!129692 m!152093))

(assert (=> b!129449 d!39345))

(declare-fun d!39347 () Bool)

(declare-fun res!62521 () Bool)

(declare-fun e!84636 () Bool)

(assert (=> d!39347 (=> res!62521 e!84636)))

(assert (=> d!39347 (= res!62521 (and ((_ is Cons!1697) (toList!846 lt!66993)) (= (_1!1294 (h!2301 (toList!846 lt!66993))) (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355))))))

(assert (=> d!39347 (= (containsKey!171 (toList!846 lt!66993) (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355)) e!84636)))

(declare-fun b!129697 () Bool)

(declare-fun e!84637 () Bool)

(assert (=> b!129697 (= e!84636 e!84637)))

(declare-fun res!62522 () Bool)

(assert (=> b!129697 (=> (not res!62522) (not e!84637))))

(assert (=> b!129697 (= res!62522 (and (or (not ((_ is Cons!1697) (toList!846 lt!66993))) (bvsle (_1!1294 (h!2301 (toList!846 lt!66993))) (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355))) ((_ is Cons!1697) (toList!846 lt!66993)) (bvslt (_1!1294 (h!2301 (toList!846 lt!66993))) (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355))))))

(declare-fun b!129698 () Bool)

(assert (=> b!129698 (= e!84637 (containsKey!171 (t!6091 (toList!846 lt!66993)) (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355)))))

(assert (= (and d!39347 (not res!62521)) b!129697))

(assert (= (and b!129697 res!62522) b!129698))

(assert (=> b!129698 m!151753))

(declare-fun m!152095 () Bool)

(assert (=> b!129698 m!152095))

(assert (=> d!39327 d!39347))

(declare-fun d!39349 () Bool)

(assert (=> d!39349 (= (+!160 (getCurrentListMap!515 (_keys!4563 newMap!16) (_values!2806 newMap!16) (mask!7100 newMap!16) (extraKeys!2596 newMap!16) (zeroValue!2682 newMap!16) (minValue!2682 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2823 newMap!16)) (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (getCurrentListMap!515 (_keys!4563 newMap!16) (_values!2806 newMap!16) (mask!7100 newMap!16) lt!67156 (zeroValue!2682 newMap!16) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) #b00000000000000000000000000000000 (defaultEntry!2823 newMap!16)))))

(declare-fun lt!67232 () Unit!4037)

(declare-fun choose!793 (array!4715 array!4717 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3457 V!3457 V!3457 Int) Unit!4037)

(assert (=> d!39349 (= lt!67232 (choose!793 (_keys!4563 newMap!16) (_values!2806 newMap!16) (mask!7100 newMap!16) (extraKeys!2596 newMap!16) lt!67156 (zeroValue!2682 newMap!16) (minValue!2682 newMap!16) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2823 newMap!16)))))

(assert (=> d!39349 (validMask!0 (mask!7100 newMap!16))))

(assert (=> d!39349 (= (lemmaChangeLongMinValueKeyThenAddPairToListMap!58 (_keys!4563 newMap!16) (_values!2806 newMap!16) (mask!7100 newMap!16) (extraKeys!2596 newMap!16) lt!67156 (zeroValue!2682 newMap!16) (minValue!2682 newMap!16) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2823 newMap!16)) lt!67232)))

(declare-fun bs!5364 () Bool)

(assert (= bs!5364 d!39349))

(assert (=> bs!5364 m!152025))

(assert (=> bs!5364 m!151849))

(assert (=> bs!5364 m!151751))

(declare-fun m!152097 () Bool)

(assert (=> bs!5364 m!152097))

(assert (=> bs!5364 m!151849))

(declare-fun m!152099 () Bool)

(assert (=> bs!5364 m!152099))

(assert (=> bs!5364 m!151751))

(declare-fun m!152101 () Bool)

(assert (=> bs!5364 m!152101))

(assert (=> b!129594 d!39349))

(declare-fun b!129711 () Bool)

(declare-fun e!84645 () SeekEntryResult!275)

(assert (=> b!129711 (= e!84645 Undefined!275)))

(declare-fun b!129712 () Bool)

(declare-fun e!84646 () SeekEntryResult!275)

(assert (=> b!129712 (= e!84645 e!84646)))

(declare-fun lt!67240 () (_ BitVec 64))

(declare-fun lt!67241 () SeekEntryResult!275)

(assert (=> b!129712 (= lt!67240 (select (arr!2230 (_keys!4563 newMap!16)) (index!3259 lt!67241)))))

(declare-fun c!23892 () Bool)

(assert (=> b!129712 (= c!23892 (= lt!67240 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355)))))

(declare-fun lt!67239 () SeekEntryResult!275)

(declare-fun d!39351 () Bool)

(assert (=> d!39351 (and (or ((_ is Undefined!275) lt!67239) (not ((_ is Found!275) lt!67239)) (and (bvsge (index!3258 lt!67239) #b00000000000000000000000000000000) (bvslt (index!3258 lt!67239) (size!2497 (_keys!4563 newMap!16))))) (or ((_ is Undefined!275) lt!67239) ((_ is Found!275) lt!67239) (not ((_ is MissingZero!275) lt!67239)) (and (bvsge (index!3257 lt!67239) #b00000000000000000000000000000000) (bvslt (index!3257 lt!67239) (size!2497 (_keys!4563 newMap!16))))) (or ((_ is Undefined!275) lt!67239) ((_ is Found!275) lt!67239) ((_ is MissingZero!275) lt!67239) (not ((_ is MissingVacant!275) lt!67239)) (and (bvsge (index!3260 lt!67239) #b00000000000000000000000000000000) (bvslt (index!3260 lt!67239) (size!2497 (_keys!4563 newMap!16))))) (or ((_ is Undefined!275) lt!67239) (ite ((_ is Found!275) lt!67239) (= (select (arr!2230 (_keys!4563 newMap!16)) (index!3258 lt!67239)) (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355)) (ite ((_ is MissingZero!275) lt!67239) (= (select (arr!2230 (_keys!4563 newMap!16)) (index!3257 lt!67239)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!275) lt!67239) (= (select (arr!2230 (_keys!4563 newMap!16)) (index!3260 lt!67239)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!39351 (= lt!67239 e!84645)))

(declare-fun c!23890 () Bool)

(assert (=> d!39351 (= c!23890 (and ((_ is Intermediate!275) lt!67241) (undefined!1087 lt!67241)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!4715 (_ BitVec 32)) SeekEntryResult!275)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!39351 (= lt!67241 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355) (mask!7100 newMap!16)) (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355) (_keys!4563 newMap!16) (mask!7100 newMap!16)))))

(assert (=> d!39351 (validMask!0 (mask!7100 newMap!16))))

(assert (=> d!39351 (= (seekEntryOrOpen!0 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355) (_keys!4563 newMap!16) (mask!7100 newMap!16)) lt!67239)))

(declare-fun b!129713 () Bool)

(declare-fun e!84644 () SeekEntryResult!275)

(assert (=> b!129713 (= e!84644 (MissingZero!275 (index!3259 lt!67241)))))

(declare-fun b!129714 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!4715 (_ BitVec 32)) SeekEntryResult!275)

(assert (=> b!129714 (= e!84644 (seekKeyOrZeroReturnVacant!0 (x!15269 lt!67241) (index!3259 lt!67241) (index!3259 lt!67241) (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355) (_keys!4563 newMap!16) (mask!7100 newMap!16)))))

(declare-fun b!129715 () Bool)

(declare-fun c!23891 () Bool)

(assert (=> b!129715 (= c!23891 (= lt!67240 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!129715 (= e!84646 e!84644)))

(declare-fun b!129716 () Bool)

(assert (=> b!129716 (= e!84646 (Found!275 (index!3259 lt!67241)))))

(assert (= (and d!39351 c!23890) b!129711))

(assert (= (and d!39351 (not c!23890)) b!129712))

(assert (= (and b!129712 c!23892) b!129716))

(assert (= (and b!129712 (not c!23892)) b!129715))

(assert (= (and b!129715 c!23891) b!129713))

(assert (= (and b!129715 (not c!23891)) b!129714))

(declare-fun m!152103 () Bool)

(assert (=> b!129712 m!152103))

(declare-fun m!152105 () Bool)

(assert (=> d!39351 m!152105))

(assert (=> d!39351 m!152025))

(declare-fun m!152107 () Bool)

(assert (=> d!39351 m!152107))

(assert (=> d!39351 m!151753))

(declare-fun m!152109 () Bool)

(assert (=> d!39351 m!152109))

(assert (=> d!39351 m!152109))

(assert (=> d!39351 m!151753))

(declare-fun m!152111 () Bool)

(assert (=> d!39351 m!152111))

(declare-fun m!152113 () Bool)

(assert (=> d!39351 m!152113))

(assert (=> b!129714 m!151753))

(declare-fun m!152115 () Bool)

(assert (=> b!129714 m!152115))

(assert (=> bm!14055 d!39351))

(declare-fun d!39353 () Bool)

(declare-fun e!84647 () Bool)

(assert (=> d!39353 e!84647))

(declare-fun res!62523 () Bool)

(assert (=> d!39353 (=> (not res!62523) (not e!84647))))

(declare-fun lt!67245 () ListLongMap!1661)

(assert (=> d!39353 (= res!62523 (contains!876 lt!67245 (_1!1294 (ite c!23852 (ite c!23848 (tuple2!2567 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2567 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun lt!67242 () List!1701)

(assert (=> d!39353 (= lt!67245 (ListLongMap!1662 lt!67242))))

(declare-fun lt!67243 () Unit!4037)

(declare-fun lt!67244 () Unit!4037)

(assert (=> d!39353 (= lt!67243 lt!67244)))

(assert (=> d!39353 (= (getValueByKey!167 lt!67242 (_1!1294 (ite c!23852 (ite c!23848 (tuple2!2567 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2567 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))) (Some!172 (_2!1294 (ite c!23852 (ite c!23848 (tuple2!2567 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2567 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!39353 (= lt!67244 (lemmaContainsTupThenGetReturnValue!85 lt!67242 (_1!1294 (ite c!23852 (ite c!23848 (tuple2!2567 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2567 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (_2!1294 (ite c!23852 (ite c!23848 (tuple2!2567 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2567 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!39353 (= lt!67242 (insertStrictlySorted!88 (toList!846 e!84575) (_1!1294 (ite c!23852 (ite c!23848 (tuple2!2567 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2567 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (_2!1294 (ite c!23852 (ite c!23848 (tuple2!2567 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2567 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!39353 (= (+!160 e!84575 (ite c!23852 (ite c!23848 (tuple2!2567 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2567 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) lt!67245)))

(declare-fun b!129717 () Bool)

(declare-fun res!62524 () Bool)

(assert (=> b!129717 (=> (not res!62524) (not e!84647))))

(assert (=> b!129717 (= res!62524 (= (getValueByKey!167 (toList!846 lt!67245) (_1!1294 (ite c!23852 (ite c!23848 (tuple2!2567 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2567 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))) (Some!172 (_2!1294 (ite c!23852 (ite c!23848 (tuple2!2567 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2567 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(declare-fun b!129718 () Bool)

(assert (=> b!129718 (= e!84647 (contains!878 (toList!846 lt!67245) (ite c!23852 (ite c!23848 (tuple2!2567 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2567 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (= (and d!39353 res!62523) b!129717))

(assert (= (and b!129717 res!62524) b!129718))

(declare-fun m!152117 () Bool)

(assert (=> d!39353 m!152117))

(declare-fun m!152119 () Bool)

(assert (=> d!39353 m!152119))

(declare-fun m!152121 () Bool)

(assert (=> d!39353 m!152121))

(declare-fun m!152123 () Bool)

(assert (=> d!39353 m!152123))

(declare-fun m!152125 () Bool)

(assert (=> b!129717 m!152125))

(declare-fun m!152127 () Bool)

(assert (=> b!129718 m!152127))

(assert (=> bm!14078 d!39353))

(declare-fun d!39355 () Bool)

(assert (=> d!39355 (= (validKeyInArray!0 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (and (not (= (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!129451 d!39355))

(declare-fun b!129719 () Bool)

(declare-fun res!62533 () Bool)

(declare-fun e!84658 () Bool)

(assert (=> b!129719 (=> (not res!62533) (not e!84658))))

(declare-fun e!84655 () Bool)

(assert (=> b!129719 (= res!62533 e!84655)))

(declare-fun res!62526 () Bool)

(assert (=> b!129719 (=> res!62526 e!84655)))

(declare-fun e!84651 () Bool)

(assert (=> b!129719 (= res!62526 (not e!84651))))

(declare-fun res!62531 () Bool)

(assert (=> b!129719 (=> (not res!62531) (not e!84651))))

(assert (=> b!129719 (= res!62531 (bvslt #b00000000000000000000000000000000 (size!2497 (_keys!4563 newMap!16))))))

(declare-fun b!129720 () Bool)

(declare-fun e!84660 () Bool)

(declare-fun lt!67261 () ListLongMap!1661)

(assert (=> b!129720 (= e!84660 (= (apply!113 lt!67261 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2682 newMap!16)))))

(declare-fun b!129721 () Bool)

(declare-fun e!84656 () Bool)

(assert (=> b!129721 (= e!84656 e!84660)))

(declare-fun res!62530 () Bool)

(declare-fun call!14094 () Bool)

(assert (=> b!129721 (= res!62530 call!14094)))

(assert (=> b!129721 (=> (not res!62530) (not e!84660))))

(declare-fun b!129722 () Bool)

(declare-fun e!84649 () Bool)

(assert (=> b!129722 (= e!84655 e!84649)))

(declare-fun res!62528 () Bool)

(assert (=> b!129722 (=> (not res!62528) (not e!84649))))

(assert (=> b!129722 (= res!62528 (contains!876 lt!67261 (select (arr!2230 (_keys!4563 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!129722 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2497 (_keys!4563 newMap!16))))))

(declare-fun bm!14089 () Bool)

(declare-fun call!14097 () ListLongMap!1661)

(declare-fun call!14096 () ListLongMap!1661)

(assert (=> bm!14089 (= call!14097 call!14096)))

(declare-fun b!129723 () Bool)

(declare-fun e!84648 () Bool)

(declare-fun e!84650 () Bool)

(assert (=> b!129723 (= e!84648 e!84650)))

(declare-fun res!62529 () Bool)

(declare-fun call!14092 () Bool)

(assert (=> b!129723 (= res!62529 call!14092)))

(assert (=> b!129723 (=> (not res!62529) (not e!84650))))

(declare-fun b!129725 () Bool)

(declare-fun e!84659 () ListLongMap!1661)

(declare-fun call!14098 () ListLongMap!1661)

(assert (=> b!129725 (= e!84659 call!14098)))

(declare-fun b!129726 () Bool)

(declare-fun e!84652 () Bool)

(assert (=> b!129726 (= e!84652 (validKeyInArray!0 (select (arr!2230 (_keys!4563 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun bm!14090 () Bool)

(assert (=> bm!14090 (= call!14096 (getCurrentListMapNoExtraKeys!125 (_keys!4563 newMap!16) (ite c!23852 (_values!2806 newMap!16) lt!67158) (mask!7100 newMap!16) (extraKeys!2596 newMap!16) (zeroValue!2682 newMap!16) (minValue!2682 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2823 newMap!16)))))

(declare-fun bm!14091 () Bool)

(assert (=> bm!14091 (= call!14092 (contains!876 lt!67261 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!129727 () Bool)

(assert (=> b!129727 (= e!84649 (= (apply!113 lt!67261 (select (arr!2230 (_keys!4563 newMap!16)) #b00000000000000000000000000000000)) (get!1459 (select (arr!2231 (ite c!23852 (_values!2806 newMap!16) lt!67158)) #b00000000000000000000000000000000) (dynLambda!414 (defaultEntry!2823 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!129727 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2498 (ite c!23852 (_values!2806 newMap!16) lt!67158))))))

(assert (=> b!129727 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2497 (_keys!4563 newMap!16))))))

(declare-fun b!129728 () Bool)

(assert (=> b!129728 (= e!84658 e!84648)))

(declare-fun c!23894 () Bool)

(assert (=> b!129728 (= c!23894 (not (= (bvand (extraKeys!2596 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!129729 () Bool)

(assert (=> b!129729 (= e!84656 (not call!14094))))

(declare-fun b!129730 () Bool)

(declare-fun e!84654 () Unit!4037)

(declare-fun Unit!4045 () Unit!4037)

(assert (=> b!129730 (= e!84654 Unit!4045)))

(declare-fun b!129731 () Bool)

(declare-fun e!84657 () ListLongMap!1661)

(declare-fun call!14095 () ListLongMap!1661)

(assert (=> b!129731 (= e!84657 call!14095)))

(declare-fun bm!14092 () Bool)

(declare-fun call!14093 () ListLongMap!1661)

(assert (=> bm!14092 (= call!14095 call!14093)))

(declare-fun b!129732 () Bool)

(declare-fun lt!67255 () Unit!4037)

(assert (=> b!129732 (= e!84654 lt!67255)))

(declare-fun lt!67251 () ListLongMap!1661)

(assert (=> b!129732 (= lt!67251 (getCurrentListMapNoExtraKeys!125 (_keys!4563 newMap!16) (ite c!23852 (_values!2806 newMap!16) lt!67158) (mask!7100 newMap!16) (extraKeys!2596 newMap!16) (zeroValue!2682 newMap!16) (minValue!2682 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2823 newMap!16)))))

(declare-fun lt!67263 () (_ BitVec 64))

(assert (=> b!129732 (= lt!67263 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!67253 () (_ BitVec 64))

(assert (=> b!129732 (= lt!67253 (select (arr!2230 (_keys!4563 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!67252 () Unit!4037)

(assert (=> b!129732 (= lt!67252 (addStillContains!89 lt!67251 lt!67263 (zeroValue!2682 newMap!16) lt!67253))))

(assert (=> b!129732 (contains!876 (+!160 lt!67251 (tuple2!2567 lt!67263 (zeroValue!2682 newMap!16))) lt!67253)))

(declare-fun lt!67254 () Unit!4037)

(assert (=> b!129732 (= lt!67254 lt!67252)))

(declare-fun lt!67264 () ListLongMap!1661)

(assert (=> b!129732 (= lt!67264 (getCurrentListMapNoExtraKeys!125 (_keys!4563 newMap!16) (ite c!23852 (_values!2806 newMap!16) lt!67158) (mask!7100 newMap!16) (extraKeys!2596 newMap!16) (zeroValue!2682 newMap!16) (minValue!2682 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2823 newMap!16)))))

(declare-fun lt!67246 () (_ BitVec 64))

(assert (=> b!129732 (= lt!67246 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!67256 () (_ BitVec 64))

(assert (=> b!129732 (= lt!67256 (select (arr!2230 (_keys!4563 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!67266 () Unit!4037)

(assert (=> b!129732 (= lt!67266 (addApplyDifferent!89 lt!67264 lt!67246 (minValue!2682 newMap!16) lt!67256))))

(assert (=> b!129732 (= (apply!113 (+!160 lt!67264 (tuple2!2567 lt!67246 (minValue!2682 newMap!16))) lt!67256) (apply!113 lt!67264 lt!67256))))

(declare-fun lt!67262 () Unit!4037)

(assert (=> b!129732 (= lt!67262 lt!67266)))

(declare-fun lt!67249 () ListLongMap!1661)

(assert (=> b!129732 (= lt!67249 (getCurrentListMapNoExtraKeys!125 (_keys!4563 newMap!16) (ite c!23852 (_values!2806 newMap!16) lt!67158) (mask!7100 newMap!16) (extraKeys!2596 newMap!16) (zeroValue!2682 newMap!16) (minValue!2682 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2823 newMap!16)))))

(declare-fun lt!67265 () (_ BitVec 64))

(assert (=> b!129732 (= lt!67265 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!67258 () (_ BitVec 64))

(assert (=> b!129732 (= lt!67258 (select (arr!2230 (_keys!4563 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!67260 () Unit!4037)

(assert (=> b!129732 (= lt!67260 (addApplyDifferent!89 lt!67249 lt!67265 (zeroValue!2682 newMap!16) lt!67258))))

(assert (=> b!129732 (= (apply!113 (+!160 lt!67249 (tuple2!2567 lt!67265 (zeroValue!2682 newMap!16))) lt!67258) (apply!113 lt!67249 lt!67258))))

(declare-fun lt!67259 () Unit!4037)

(assert (=> b!129732 (= lt!67259 lt!67260)))

(declare-fun lt!67257 () ListLongMap!1661)

(assert (=> b!129732 (= lt!67257 (getCurrentListMapNoExtraKeys!125 (_keys!4563 newMap!16) (ite c!23852 (_values!2806 newMap!16) lt!67158) (mask!7100 newMap!16) (extraKeys!2596 newMap!16) (zeroValue!2682 newMap!16) (minValue!2682 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2823 newMap!16)))))

(declare-fun lt!67250 () (_ BitVec 64))

(assert (=> b!129732 (= lt!67250 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!67267 () (_ BitVec 64))

(assert (=> b!129732 (= lt!67267 (select (arr!2230 (_keys!4563 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!129732 (= lt!67255 (addApplyDifferent!89 lt!67257 lt!67250 (minValue!2682 newMap!16) lt!67267))))

(assert (=> b!129732 (= (apply!113 (+!160 lt!67257 (tuple2!2567 lt!67250 (minValue!2682 newMap!16))) lt!67267) (apply!113 lt!67257 lt!67267))))

(declare-fun b!129733 () Bool)

(assert (=> b!129733 (= e!84651 (validKeyInArray!0 (select (arr!2230 (_keys!4563 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!129734 () Bool)

(declare-fun c!23897 () Bool)

(assert (=> b!129734 (= c!23897 (and (not (= (bvand (extraKeys!2596 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2596 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!129734 (= e!84657 e!84659)))

(declare-fun b!129735 () Bool)

(declare-fun res!62532 () Bool)

(assert (=> b!129735 (=> (not res!62532) (not e!84658))))

(assert (=> b!129735 (= res!62532 e!84656)))

(declare-fun c!23895 () Bool)

(assert (=> b!129735 (= c!23895 (not (= (bvand (extraKeys!2596 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!129736 () Bool)

(assert (=> b!129736 (= e!84659 call!14095)))

(declare-fun bm!14093 () Bool)

(assert (=> bm!14093 (= call!14098 call!14097)))

(declare-fun b!129737 () Bool)

(assert (=> b!129737 (= e!84650 (= (apply!113 lt!67261 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2682 newMap!16)))))

(declare-fun b!129724 () Bool)

(declare-fun e!84653 () ListLongMap!1661)

(assert (=> b!129724 (= e!84653 (+!160 call!14093 (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2682 newMap!16))))))

(declare-fun d!39357 () Bool)

(assert (=> d!39357 e!84658))

(declare-fun res!62527 () Bool)

(assert (=> d!39357 (=> (not res!62527) (not e!84658))))

(assert (=> d!39357 (= res!62527 (or (bvsge #b00000000000000000000000000000000 (size!2497 (_keys!4563 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2497 (_keys!4563 newMap!16))))))))

(declare-fun lt!67247 () ListLongMap!1661)

(assert (=> d!39357 (= lt!67261 lt!67247)))

(declare-fun lt!67248 () Unit!4037)

(assert (=> d!39357 (= lt!67248 e!84654)))

(declare-fun c!23893 () Bool)

(assert (=> d!39357 (= c!23893 e!84652)))

(declare-fun res!62525 () Bool)

(assert (=> d!39357 (=> (not res!62525) (not e!84652))))

(assert (=> d!39357 (= res!62525 (bvslt #b00000000000000000000000000000000 (size!2497 (_keys!4563 newMap!16))))))

(assert (=> d!39357 (= lt!67247 e!84653)))

(declare-fun c!23898 () Bool)

(assert (=> d!39357 (= c!23898 (and (not (= (bvand (extraKeys!2596 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2596 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!39357 (validMask!0 (mask!7100 newMap!16))))

(assert (=> d!39357 (= (getCurrentListMap!515 (_keys!4563 newMap!16) (ite c!23852 (_values!2806 newMap!16) lt!67158) (mask!7100 newMap!16) (extraKeys!2596 newMap!16) (zeroValue!2682 newMap!16) (minValue!2682 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2823 newMap!16)) lt!67261)))

(declare-fun bm!14094 () Bool)

(assert (=> bm!14094 (= call!14094 (contains!876 lt!67261 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!129738 () Bool)

(assert (=> b!129738 (= e!84653 e!84657)))

(declare-fun c!23896 () Bool)

(assert (=> b!129738 (= c!23896 (and (not (= (bvand (extraKeys!2596 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2596 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!14095 () Bool)

(assert (=> bm!14095 (= call!14093 (+!160 (ite c!23898 call!14096 (ite c!23896 call!14097 call!14098)) (ite (or c!23898 c!23896) (tuple2!2567 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2682 newMap!16)) (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2682 newMap!16)))))))

(declare-fun b!129739 () Bool)

(assert (=> b!129739 (= e!84648 (not call!14092))))

(assert (= (and d!39357 c!23898) b!129724))

(assert (= (and d!39357 (not c!23898)) b!129738))

(assert (= (and b!129738 c!23896) b!129731))

(assert (= (and b!129738 (not c!23896)) b!129734))

(assert (= (and b!129734 c!23897) b!129736))

(assert (= (and b!129734 (not c!23897)) b!129725))

(assert (= (or b!129736 b!129725) bm!14093))

(assert (= (or b!129731 bm!14093) bm!14089))

(assert (= (or b!129731 b!129736) bm!14092))

(assert (= (or b!129724 bm!14089) bm!14090))

(assert (= (or b!129724 bm!14092) bm!14095))

(assert (= (and d!39357 res!62525) b!129726))

(assert (= (and d!39357 c!23893) b!129732))

(assert (= (and d!39357 (not c!23893)) b!129730))

(assert (= (and d!39357 res!62527) b!129719))

(assert (= (and b!129719 res!62531) b!129733))

(assert (= (and b!129719 (not res!62526)) b!129722))

(assert (= (and b!129722 res!62528) b!129727))

(assert (= (and b!129719 res!62533) b!129735))

(assert (= (and b!129735 c!23895) b!129721))

(assert (= (and b!129735 (not c!23895)) b!129729))

(assert (= (and b!129721 res!62530) b!129720))

(assert (= (or b!129721 b!129729) bm!14094))

(assert (= (and b!129735 res!62532) b!129728))

(assert (= (and b!129728 c!23894) b!129723))

(assert (= (and b!129728 (not c!23894)) b!129739))

(assert (= (and b!129723 res!62529) b!129737))

(assert (= (or b!129723 b!129739) bm!14091))

(declare-fun b_lambda!5749 () Bool)

(assert (=> (not b_lambda!5749) (not b!129727)))

(assert (=> b!129727 t!6103))

(declare-fun b_and!8017 () Bool)

(assert (= b_and!8013 (and (=> t!6103 result!3917) b_and!8017)))

(assert (=> b!129727 t!6105))

(declare-fun b_and!8019 () Bool)

(assert (= b_and!8015 (and (=> t!6105 result!3919) b_and!8019)))

(declare-fun m!152129 () Bool)

(assert (=> bm!14091 m!152129))

(declare-fun m!152131 () Bool)

(assert (=> bm!14090 m!152131))

(assert (=> b!129733 m!152019))

(assert (=> b!129733 m!152019))

(assert (=> b!129733 m!152021))

(declare-fun m!152133 () Bool)

(assert (=> b!129724 m!152133))

(assert (=> d!39357 m!152025))

(declare-fun m!152135 () Bool)

(assert (=> b!129720 m!152135))

(assert (=> b!129726 m!152019))

(assert (=> b!129726 m!152019))

(assert (=> b!129726 m!152021))

(declare-fun m!152137 () Bool)

(assert (=> b!129737 m!152137))

(declare-fun m!152139 () Bool)

(assert (=> bm!14095 m!152139))

(declare-fun m!152141 () Bool)

(assert (=> b!129732 m!152141))

(declare-fun m!152143 () Bool)

(assert (=> b!129732 m!152143))

(declare-fun m!152145 () Bool)

(assert (=> b!129732 m!152145))

(declare-fun m!152147 () Bool)

(assert (=> b!129732 m!152147))

(declare-fun m!152149 () Bool)

(assert (=> b!129732 m!152149))

(declare-fun m!152151 () Bool)

(assert (=> b!129732 m!152151))

(assert (=> b!129732 m!152131))

(declare-fun m!152153 () Bool)

(assert (=> b!129732 m!152153))

(assert (=> b!129732 m!152019))

(declare-fun m!152155 () Bool)

(assert (=> b!129732 m!152155))

(declare-fun m!152157 () Bool)

(assert (=> b!129732 m!152157))

(declare-fun m!152159 () Bool)

(assert (=> b!129732 m!152159))

(assert (=> b!129732 m!152151))

(declare-fun m!152161 () Bool)

(assert (=> b!129732 m!152161))

(assert (=> b!129732 m!152145))

(declare-fun m!152163 () Bool)

(assert (=> b!129732 m!152163))

(declare-fun m!152165 () Bool)

(assert (=> b!129732 m!152165))

(declare-fun m!152167 () Bool)

(assert (=> b!129732 m!152167))

(assert (=> b!129732 m!152157))

(assert (=> b!129732 m!152155))

(declare-fun m!152169 () Bool)

(assert (=> b!129732 m!152169))

(declare-fun m!152171 () Bool)

(assert (=> bm!14094 m!152171))

(assert (=> b!129722 m!152019))

(assert (=> b!129722 m!152019))

(declare-fun m!152173 () Bool)

(assert (=> b!129722 m!152173))

(assert (=> b!129727 m!152019))

(declare-fun m!152175 () Bool)

(assert (=> b!129727 m!152175))

(assert (=> b!129727 m!152019))

(declare-fun m!152177 () Bool)

(assert (=> b!129727 m!152177))

(assert (=> b!129727 m!152175))

(assert (=> b!129727 m!152071))

(declare-fun m!152179 () Bool)

(assert (=> b!129727 m!152179))

(assert (=> b!129727 m!152071))

(assert (=> bm!14056 d!39357))

(declare-fun d!39359 () Bool)

(declare-fun e!84662 () Bool)

(assert (=> d!39359 e!84662))

(declare-fun res!62534 () Bool)

(assert (=> d!39359 (=> res!62534 e!84662)))

(declare-fun lt!67270 () Bool)

(assert (=> d!39359 (= res!62534 (not lt!67270))))

(declare-fun lt!67271 () Bool)

(assert (=> d!39359 (= lt!67270 lt!67271)))

(declare-fun lt!67268 () Unit!4037)

(declare-fun e!84661 () Unit!4037)

(assert (=> d!39359 (= lt!67268 e!84661)))

(declare-fun c!23899 () Bool)

(assert (=> d!39359 (= c!23899 lt!67271)))

(assert (=> d!39359 (= lt!67271 (containsKey!171 (toList!846 call!14073) (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355)))))

(assert (=> d!39359 (= (contains!876 call!14073 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355)) lt!67270)))

(declare-fun b!129740 () Bool)

(declare-fun lt!67269 () Unit!4037)

(assert (=> b!129740 (= e!84661 lt!67269)))

(assert (=> b!129740 (= lt!67269 (lemmaContainsKeyImpliesGetValueByKeyDefined!120 (toList!846 call!14073) (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355)))))

(assert (=> b!129740 (isDefined!121 (getValueByKey!167 (toList!846 call!14073) (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355)))))

(declare-fun b!129741 () Bool)

(declare-fun Unit!4046 () Unit!4037)

(assert (=> b!129741 (= e!84661 Unit!4046)))

(declare-fun b!129742 () Bool)

(assert (=> b!129742 (= e!84662 (isDefined!121 (getValueByKey!167 (toList!846 call!14073) (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355))))))

(assert (= (and d!39359 c!23899) b!129740))

(assert (= (and d!39359 (not c!23899)) b!129741))

(assert (= (and d!39359 (not res!62534)) b!129742))

(assert (=> d!39359 m!151753))

(declare-fun m!152181 () Bool)

(assert (=> d!39359 m!152181))

(assert (=> b!129740 m!151753))

(declare-fun m!152183 () Bool)

(assert (=> b!129740 m!152183))

(assert (=> b!129740 m!151753))

(declare-fun m!152185 () Bool)

(assert (=> b!129740 m!152185))

(assert (=> b!129740 m!152185))

(declare-fun m!152187 () Bool)

(assert (=> b!129740 m!152187))

(assert (=> b!129742 m!151753))

(assert (=> b!129742 m!152185))

(assert (=> b!129742 m!152185))

(assert (=> b!129742 m!152187))

(assert (=> b!129595 d!39359))

(declare-fun d!39361 () Bool)

(assert (=> d!39361 (= (get!1461 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (v!3152 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355)))))

(assert (=> b!129613 d!39361))

(declare-fun d!39363 () Bool)

(declare-fun e!84665 () Bool)

(assert (=> d!39363 e!84665))

(declare-fun res!62537 () Bool)

(assert (=> d!39363 (=> (not res!62537) (not e!84665))))

(assert (=> d!39363 (= res!62537 (and (bvsge (index!3258 lt!67161) #b00000000000000000000000000000000) (bvslt (index!3258 lt!67161) (size!2497 (_keys!4563 newMap!16)))))))

(declare-fun lt!67274 () Unit!4037)

(declare-fun choose!794 (array!4715 array!4717 (_ BitVec 32) (_ BitVec 32) V!3457 V!3457 (_ BitVec 32) Int) Unit!4037)

(assert (=> d!39363 (= lt!67274 (choose!794 (_keys!4563 newMap!16) lt!67158 (mask!7100 newMap!16) (extraKeys!2596 newMap!16) (zeroValue!2682 newMap!16) (minValue!2682 newMap!16) (index!3258 lt!67161) (defaultEntry!2823 newMap!16)))))

(assert (=> d!39363 (validMask!0 (mask!7100 newMap!16))))

(assert (=> d!39363 (= (lemmaValidKeyInArrayIsInListMap!117 (_keys!4563 newMap!16) lt!67158 (mask!7100 newMap!16) (extraKeys!2596 newMap!16) (zeroValue!2682 newMap!16) (minValue!2682 newMap!16) (index!3258 lt!67161) (defaultEntry!2823 newMap!16)) lt!67274)))

(declare-fun b!129745 () Bool)

(assert (=> b!129745 (= e!84665 (contains!876 (getCurrentListMap!515 (_keys!4563 newMap!16) lt!67158 (mask!7100 newMap!16) (extraKeys!2596 newMap!16) (zeroValue!2682 newMap!16) (minValue!2682 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2823 newMap!16)) (select (arr!2230 (_keys!4563 newMap!16)) (index!3258 lt!67161))))))

(assert (= (and d!39363 res!62537) b!129745))

(declare-fun m!152189 () Bool)

(assert (=> d!39363 m!152189))

(assert (=> d!39363 m!152025))

(declare-fun m!152191 () Bool)

(assert (=> b!129745 m!152191))

(assert (=> b!129745 m!151925))

(assert (=> b!129745 m!152191))

(assert (=> b!129745 m!151925))

(declare-fun m!152193 () Bool)

(assert (=> b!129745 m!152193))

(assert (=> b!129599 d!39363))

(declare-fun d!39365 () Bool)

(declare-fun e!84668 () Bool)

(assert (=> d!39365 e!84668))

(declare-fun res!62540 () Bool)

(assert (=> d!39365 (=> (not res!62540) (not e!84668))))

(assert (=> d!39365 (= res!62540 (and (bvsge (index!3258 lt!67161) #b00000000000000000000000000000000) (bvslt (index!3258 lt!67161) (size!2498 (_values!2806 newMap!16)))))))

(declare-fun lt!67277 () Unit!4037)

(declare-fun choose!795 (array!4715 array!4717 (_ BitVec 32) (_ BitVec 32) V!3457 V!3457 (_ BitVec 32) (_ BitVec 64) V!3457 Int) Unit!4037)

(assert (=> d!39365 (= lt!67277 (choose!795 (_keys!4563 newMap!16) (_values!2806 newMap!16) (mask!7100 newMap!16) (extraKeys!2596 newMap!16) (zeroValue!2682 newMap!16) (minValue!2682 newMap!16) (index!3258 lt!67161) (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2823 newMap!16)))))

(assert (=> d!39365 (validMask!0 (mask!7100 newMap!16))))

(assert (=> d!39365 (= (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!58 (_keys!4563 newMap!16) (_values!2806 newMap!16) (mask!7100 newMap!16) (extraKeys!2596 newMap!16) (zeroValue!2682 newMap!16) (minValue!2682 newMap!16) (index!3258 lt!67161) (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2823 newMap!16)) lt!67277)))

(declare-fun b!129748 () Bool)

(assert (=> b!129748 (= e!84668 (= (+!160 (getCurrentListMap!515 (_keys!4563 newMap!16) (_values!2806 newMap!16) (mask!7100 newMap!16) (extraKeys!2596 newMap!16) (zeroValue!2682 newMap!16) (minValue!2682 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2823 newMap!16)) (tuple2!2567 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (getCurrentListMap!515 (_keys!4563 newMap!16) (array!4718 (store (arr!2231 (_values!2806 newMap!16)) (index!3258 lt!67161) (ValueCellFull!1085 (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2498 (_values!2806 newMap!16))) (mask!7100 newMap!16) (extraKeys!2596 newMap!16) (zeroValue!2682 newMap!16) (minValue!2682 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2823 newMap!16))))))

(assert (= (and d!39365 res!62540) b!129748))

(assert (=> d!39365 m!151753))

(assert (=> d!39365 m!151751))

(declare-fun m!152195 () Bool)

(assert (=> d!39365 m!152195))

(assert (=> d!39365 m!152025))

(assert (=> b!129748 m!151849))

(assert (=> b!129748 m!151849))

(declare-fun m!152197 () Bool)

(assert (=> b!129748 m!152197))

(assert (=> b!129748 m!151929))

(declare-fun m!152199 () Bool)

(assert (=> b!129748 m!152199))

(assert (=> b!129599 d!39365))

(declare-fun d!39367 () Bool)

(declare-fun e!84670 () Bool)

(assert (=> d!39367 e!84670))

(declare-fun res!62541 () Bool)

(assert (=> d!39367 (=> res!62541 e!84670)))

(declare-fun lt!67280 () Bool)

(assert (=> d!39367 (= res!62541 (not lt!67280))))

(declare-fun lt!67281 () Bool)

(assert (=> d!39367 (= lt!67280 lt!67281)))

(declare-fun lt!67278 () Unit!4037)

(declare-fun e!84669 () Unit!4037)

(assert (=> d!39367 (= lt!67278 e!84669)))

(declare-fun c!23900 () Bool)

(assert (=> d!39367 (= c!23900 lt!67281)))

(assert (=> d!39367 (= lt!67281 (containsKey!171 (toList!846 (getCurrentListMap!515 (_keys!4563 newMap!16) (_values!2806 newMap!16) (mask!7100 newMap!16) (extraKeys!2596 newMap!16) (zeroValue!2682 newMap!16) (minValue!2682 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2823 newMap!16))) (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355)))))

(assert (=> d!39367 (= (contains!876 (getCurrentListMap!515 (_keys!4563 newMap!16) (_values!2806 newMap!16) (mask!7100 newMap!16) (extraKeys!2596 newMap!16) (zeroValue!2682 newMap!16) (minValue!2682 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2823 newMap!16)) (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355)) lt!67280)))

(declare-fun b!129749 () Bool)

(declare-fun lt!67279 () Unit!4037)

(assert (=> b!129749 (= e!84669 lt!67279)))

(assert (=> b!129749 (= lt!67279 (lemmaContainsKeyImpliesGetValueByKeyDefined!120 (toList!846 (getCurrentListMap!515 (_keys!4563 newMap!16) (_values!2806 newMap!16) (mask!7100 newMap!16) (extraKeys!2596 newMap!16) (zeroValue!2682 newMap!16) (minValue!2682 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2823 newMap!16))) (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355)))))

(assert (=> b!129749 (isDefined!121 (getValueByKey!167 (toList!846 (getCurrentListMap!515 (_keys!4563 newMap!16) (_values!2806 newMap!16) (mask!7100 newMap!16) (extraKeys!2596 newMap!16) (zeroValue!2682 newMap!16) (minValue!2682 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2823 newMap!16))) (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355)))))

(declare-fun b!129750 () Bool)

(declare-fun Unit!4047 () Unit!4037)

(assert (=> b!129750 (= e!84669 Unit!4047)))

(declare-fun b!129751 () Bool)

(assert (=> b!129751 (= e!84670 (isDefined!121 (getValueByKey!167 (toList!846 (getCurrentListMap!515 (_keys!4563 newMap!16) (_values!2806 newMap!16) (mask!7100 newMap!16) (extraKeys!2596 newMap!16) (zeroValue!2682 newMap!16) (minValue!2682 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2823 newMap!16))) (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355))))))

(assert (= (and d!39367 c!23900) b!129749))

(assert (= (and d!39367 (not c!23900)) b!129750))

(assert (= (and d!39367 (not res!62541)) b!129751))

(assert (=> d!39367 m!151753))

(declare-fun m!152201 () Bool)

(assert (=> d!39367 m!152201))

(assert (=> b!129749 m!151753))

(declare-fun m!152203 () Bool)

(assert (=> b!129749 m!152203))

(assert (=> b!129749 m!151753))

(declare-fun m!152205 () Bool)

(assert (=> b!129749 m!152205))

(assert (=> b!129749 m!152205))

(declare-fun m!152207 () Bool)

(assert (=> b!129749 m!152207))

(assert (=> b!129751 m!151753))

(assert (=> b!129751 m!152205))

(assert (=> b!129751 m!152205))

(assert (=> b!129751 m!152207))

(assert (=> b!129599 d!39367))

(assert (=> b!129599 d!39339))

(declare-fun d!39369 () Bool)

(declare-fun res!62542 () Bool)

(declare-fun e!84671 () Bool)

(assert (=> d!39369 (=> (not res!62542) (not e!84671))))

(assert (=> d!39369 (= res!62542 (simpleValid!89 (_2!1295 lt!67144)))))

(assert (=> d!39369 (= (valid!521 (_2!1295 lt!67144)) e!84671)))

(declare-fun b!129752 () Bool)

(declare-fun res!62543 () Bool)

(assert (=> b!129752 (=> (not res!62543) (not e!84671))))

(assert (=> b!129752 (= res!62543 (= (arrayCountValidKeys!0 (_keys!4563 (_2!1295 lt!67144)) #b00000000000000000000000000000000 (size!2497 (_keys!4563 (_2!1295 lt!67144)))) (_size!588 (_2!1295 lt!67144))))))

(declare-fun b!129753 () Bool)

(declare-fun res!62544 () Bool)

(assert (=> b!129753 (=> (not res!62544) (not e!84671))))

(assert (=> b!129753 (= res!62544 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4563 (_2!1295 lt!67144)) (mask!7100 (_2!1295 lt!67144))))))

(declare-fun b!129754 () Bool)

(assert (=> b!129754 (= e!84671 (arrayNoDuplicates!0 (_keys!4563 (_2!1295 lt!67144)) #b00000000000000000000000000000000 Nil!1700))))

(assert (= (and d!39369 res!62542) b!129752))

(assert (= (and b!129752 res!62543) b!129753))

(assert (= (and b!129753 res!62544) b!129754))

(declare-fun m!152209 () Bool)

(assert (=> d!39369 m!152209))

(declare-fun m!152211 () Bool)

(assert (=> b!129752 m!152211))

(declare-fun m!152213 () Bool)

(assert (=> b!129753 m!152213))

(declare-fun m!152215 () Bool)

(assert (=> b!129754 m!152215))

(assert (=> d!39329 d!39369))

(assert (=> d!39329 d!39325))

(declare-fun b!129789 () Bool)

(declare-fun e!84691 () Unit!4037)

(declare-fun lt!67345 () Unit!4037)

(assert (=> b!129789 (= e!84691 lt!67345)))

(assert (=> b!129789 (= lt!67345 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!58 (_keys!4563 newMap!16) (_values!2806 newMap!16) (mask!7100 newMap!16) (extraKeys!2596 newMap!16) (zeroValue!2682 newMap!16) (minValue!2682 newMap!16) (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355) (defaultEntry!2823 newMap!16)))))

(declare-fun lt!67349 () SeekEntryResult!275)

(declare-fun call!14110 () SeekEntryResult!275)

(assert (=> b!129789 (= lt!67349 call!14110)))

(declare-fun c!23910 () Bool)

(assert (=> b!129789 (= c!23910 ((_ is MissingZero!275) lt!67349))))

(declare-fun e!84689 () Bool)

(assert (=> b!129789 e!84689))

(declare-fun bm!14104 () Bool)

(declare-fun call!14109 () Bool)

(assert (=> bm!14104 (= call!14109 (arrayContainsKey!0 (_keys!4563 newMap!16) (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun b!129790 () Bool)

(declare-fun res!62567 () Bool)

(declare-fun e!84692 () Bool)

(assert (=> b!129790 (=> (not res!62567) (not e!84692))))

(assert (=> b!129790 (= res!62567 (= (select (arr!2230 (_keys!4563 newMap!16)) (index!3257 lt!67349)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!129792 () Bool)

(declare-fun Unit!4048 () Unit!4037)

(assert (=> b!129792 (= e!84691 Unit!4048)))

(declare-fun lt!67368 () Unit!4037)

(assert (=> b!129792 (= lt!67368 (lemmaInListMapThenSeekEntryOrOpenFindsIt!58 (_keys!4563 newMap!16) (_values!2806 newMap!16) (mask!7100 newMap!16) (extraKeys!2596 newMap!16) (zeroValue!2682 newMap!16) (minValue!2682 newMap!16) (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355) (defaultEntry!2823 newMap!16)))))

(declare-fun lt!67363 () SeekEntryResult!275)

(assert (=> b!129792 (= lt!67363 call!14110)))

(declare-fun res!62566 () Bool)

(assert (=> b!129792 (= res!62566 ((_ is Found!275) lt!67363))))

(declare-fun e!84693 () Bool)

(assert (=> b!129792 (=> (not res!62566) (not e!84693))))

(assert (=> b!129792 e!84693))

(declare-fun lt!67343 () Unit!4037)

(assert (=> b!129792 (= lt!67343 lt!67368)))

(assert (=> b!129792 false))

(declare-fun b!129793 () Bool)

(declare-fun e!84688 () Unit!4037)

(declare-fun Unit!4049 () Unit!4037)

(assert (=> b!129793 (= e!84688 Unit!4049)))

(declare-fun lt!67354 () Unit!4037)

(declare-fun lemmaArrayContainsKeyThenInListMap!39 (array!4715 array!4717 (_ BitVec 32) (_ BitVec 32) V!3457 V!3457 (_ BitVec 64) (_ BitVec 32) Int) Unit!4037)

(assert (=> b!129793 (= lt!67354 (lemmaArrayContainsKeyThenInListMap!39 (_keys!4563 newMap!16) (_values!2806 newMap!16) (mask!7100 newMap!16) (extraKeys!2596 newMap!16) (zeroValue!2682 newMap!16) (minValue!2682 newMap!16) (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355) #b00000000000000000000000000000000 (defaultEntry!2823 newMap!16)))))

(assert (=> b!129793 (contains!876 (getCurrentListMap!515 (_keys!4563 newMap!16) (_values!2806 newMap!16) (mask!7100 newMap!16) (extraKeys!2596 newMap!16) (zeroValue!2682 newMap!16) (minValue!2682 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2823 newMap!16)) (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355))))

(declare-fun lt!67347 () Unit!4037)

(assert (=> b!129793 (= lt!67347 lt!67354)))

(assert (=> b!129793 false))

(declare-fun b!129794 () Bool)

(declare-fun e!84694 () Bool)

(assert (=> b!129794 (= e!84694 (not call!14109))))

(declare-fun b!129795 () Bool)

(assert (=> b!129795 (= e!84692 (not call!14109))))

(declare-fun b!129796 () Bool)

(declare-fun res!62563 () Bool)

(declare-fun call!14107 () Bool)

(assert (=> b!129796 (= res!62563 call!14107)))

(assert (=> b!129796 (=> (not res!62563) (not e!84693))))

(declare-fun b!129797 () Bool)

(declare-fun Unit!4050 () Unit!4037)

(assert (=> b!129797 (= e!84688 Unit!4050)))

(declare-fun b!129798 () Bool)

(assert (=> b!129798 (= e!84693 (= (select (arr!2230 (_keys!4563 newMap!16)) (index!3258 lt!67363)) (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355)))))

(declare-fun bm!14105 () Bool)

(declare-fun c!23909 () Bool)

(assert (=> bm!14105 (= call!14107 (inRange!0 (ite c!23909 (index!3258 lt!67363) (ite c!23910 (index!3257 lt!67349) (index!3260 lt!67349))) (mask!7100 newMap!16)))))

(declare-fun b!129799 () Bool)

(declare-fun res!62565 () Bool)

(declare-fun e!84695 () Bool)

(assert (=> b!129799 (=> (not res!62565) (not e!84695))))

(declare-fun lt!67346 () tuple2!2568)

(assert (=> b!129799 (= res!62565 (contains!876 (map!1381 (_2!1295 lt!67346)) (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355)))))

(declare-fun bm!14106 () Bool)

(declare-fun call!14108 () Bool)

(assert (=> bm!14106 (= call!14108 call!14107)))

(declare-fun d!39371 () Bool)

(assert (=> d!39371 e!84695))

(declare-fun res!62569 () Bool)

(assert (=> d!39371 (=> (not res!62569) (not e!84695))))

(assert (=> d!39371 (= res!62569 (_1!1295 lt!67346))))

(assert (=> d!39371 (= lt!67346 (tuple2!2569 true (LongMapFixedSize!1079 (defaultEntry!2823 newMap!16) (mask!7100 newMap!16) (extraKeys!2596 newMap!16) (zeroValue!2682 newMap!16) (minValue!2682 newMap!16) (bvadd (_size!588 newMap!16) #b00000000000000000000000000000001) (array!4716 (store (arr!2230 (_keys!4563 newMap!16)) (ite c!23857 (index!3260 lt!67161) (index!3257 lt!67161)) (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355)) (size!2497 (_keys!4563 newMap!16))) (array!4718 (store (arr!2231 (_values!2806 newMap!16)) (ite c!23857 (index!3260 lt!67161) (index!3257 lt!67161)) (ValueCellFull!1085 (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2498 (_values!2806 newMap!16))) (_vacant!588 newMap!16))))))

(declare-fun lt!67358 () Unit!4037)

(declare-fun lt!67356 () Unit!4037)

(assert (=> d!39371 (= lt!67358 lt!67356)))

(declare-fun lt!67353 () array!4715)

(declare-fun lt!67350 () array!4717)

(assert (=> d!39371 (contains!876 (getCurrentListMap!515 lt!67353 lt!67350 (mask!7100 newMap!16) (extraKeys!2596 newMap!16) (zeroValue!2682 newMap!16) (minValue!2682 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2823 newMap!16)) (select (store (arr!2230 (_keys!4563 newMap!16)) (ite c!23857 (index!3260 lt!67161) (index!3257 lt!67161)) (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355)) (ite c!23857 (index!3260 lt!67161) (index!3257 lt!67161))))))

(assert (=> d!39371 (= lt!67356 (lemmaValidKeyInArrayIsInListMap!117 lt!67353 lt!67350 (mask!7100 newMap!16) (extraKeys!2596 newMap!16) (zeroValue!2682 newMap!16) (minValue!2682 newMap!16) (ite c!23857 (index!3260 lt!67161) (index!3257 lt!67161)) (defaultEntry!2823 newMap!16)))))

(assert (=> d!39371 (= lt!67350 (array!4718 (store (arr!2231 (_values!2806 newMap!16)) (ite c!23857 (index!3260 lt!67161) (index!3257 lt!67161)) (ValueCellFull!1085 (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2498 (_values!2806 newMap!16))))))

(assert (=> d!39371 (= lt!67353 (array!4716 (store (arr!2230 (_keys!4563 newMap!16)) (ite c!23857 (index!3260 lt!67161) (index!3257 lt!67161)) (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355)) (size!2497 (_keys!4563 newMap!16))))))

(declare-fun lt!67367 () Unit!4037)

(declare-fun lt!67351 () Unit!4037)

(assert (=> d!39371 (= lt!67367 lt!67351)))

(declare-fun lt!67369 () array!4715)

(assert (=> d!39371 (= (arrayCountValidKeys!0 lt!67369 (ite c!23857 (index!3260 lt!67161) (index!3257 lt!67161)) (bvadd (ite c!23857 (index!3260 lt!67161) (index!3257 lt!67161)) #b00000000000000000000000000000001)) #b00000000000000000000000000000001)))

(declare-fun lemmaValidKeyAtIImpliesCountKeysIsOne!0 (array!4715 (_ BitVec 32)) Unit!4037)

(assert (=> d!39371 (= lt!67351 (lemmaValidKeyAtIImpliesCountKeysIsOne!0 lt!67369 (ite c!23857 (index!3260 lt!67161) (index!3257 lt!67161))))))

(assert (=> d!39371 (= lt!67369 (array!4716 (store (arr!2230 (_keys!4563 newMap!16)) (ite c!23857 (index!3260 lt!67161) (index!3257 lt!67161)) (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355)) (size!2497 (_keys!4563 newMap!16))))))

(declare-fun lt!67362 () Unit!4037)

(declare-fun lt!67357 () Unit!4037)

(assert (=> d!39371 (= lt!67362 lt!67357)))

(declare-fun lt!67361 () array!4715)

(assert (=> d!39371 (arrayContainsKey!0 lt!67361 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355) #b00000000000000000000000000000000)))

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!4715 (_ BitVec 64) (_ BitVec 32)) Unit!4037)

(assert (=> d!39371 (= lt!67357 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!67361 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355) (ite c!23857 (index!3260 lt!67161) (index!3257 lt!67161))))))

(assert (=> d!39371 (= lt!67361 (array!4716 (store (arr!2230 (_keys!4563 newMap!16)) (ite c!23857 (index!3260 lt!67161) (index!3257 lt!67161)) (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355)) (size!2497 (_keys!4563 newMap!16))))))

(declare-fun lt!67342 () Unit!4037)

(declare-fun lt!67364 () Unit!4037)

(assert (=> d!39371 (= lt!67342 lt!67364)))

(assert (=> d!39371 (= (+!160 (getCurrentListMap!515 (_keys!4563 newMap!16) (_values!2806 newMap!16) (mask!7100 newMap!16) (extraKeys!2596 newMap!16) (zeroValue!2682 newMap!16) (minValue!2682 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2823 newMap!16)) (tuple2!2567 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (getCurrentListMap!515 (array!4716 (store (arr!2230 (_keys!4563 newMap!16)) (ite c!23857 (index!3260 lt!67161) (index!3257 lt!67161)) (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355)) (size!2497 (_keys!4563 newMap!16))) (array!4718 (store (arr!2231 (_values!2806 newMap!16)) (ite c!23857 (index!3260 lt!67161) (index!3257 lt!67161)) (ValueCellFull!1085 (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2498 (_values!2806 newMap!16))) (mask!7100 newMap!16) (extraKeys!2596 newMap!16) (zeroValue!2682 newMap!16) (minValue!2682 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2823 newMap!16)))))

(declare-fun lemmaAddValidKeyToArrayThenAddPairToListMap!39 (array!4715 array!4717 (_ BitVec 32) (_ BitVec 32) V!3457 V!3457 (_ BitVec 32) (_ BitVec 64) V!3457 Int) Unit!4037)

(assert (=> d!39371 (= lt!67364 (lemmaAddValidKeyToArrayThenAddPairToListMap!39 (_keys!4563 newMap!16) (_values!2806 newMap!16) (mask!7100 newMap!16) (extraKeys!2596 newMap!16) (zeroValue!2682 newMap!16) (minValue!2682 newMap!16) (ite c!23857 (index!3260 lt!67161) (index!3257 lt!67161)) (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2823 newMap!16)))))

(declare-fun lt!67366 () Unit!4037)

(declare-fun lt!67371 () Unit!4037)

(assert (=> d!39371 (= lt!67366 lt!67371)))

(assert (=> d!39371 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!4716 (store (arr!2230 (_keys!4563 newMap!16)) (ite c!23857 (index!3260 lt!67161) (index!3257 lt!67161)) (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355)) (size!2497 (_keys!4563 newMap!16))) (mask!7100 newMap!16))))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!4715 (_ BitVec 32) (_ BitVec 32)) Unit!4037)

(assert (=> d!39371 (= lt!67371 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355) (_keys!4563 newMap!16) (ite c!23857 (index!3260 lt!67161) (index!3257 lt!67161)) (mask!7100 newMap!16)))))

(declare-fun lt!67352 () Unit!4037)

(declare-fun lt!67360 () Unit!4037)

(assert (=> d!39371 (= lt!67352 lt!67360)))

(assert (=> d!39371 (= (arrayCountValidKeys!0 (array!4716 (store (arr!2230 (_keys!4563 newMap!16)) (ite c!23857 (index!3260 lt!67161) (index!3257 lt!67161)) (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355)) (size!2497 (_keys!4563 newMap!16))) #b00000000000000000000000000000000 (size!2497 (_keys!4563 newMap!16))) (bvadd (arrayCountValidKeys!0 (_keys!4563 newMap!16) #b00000000000000000000000000000000 (size!2497 (_keys!4563 newMap!16))) #b00000000000000000000000000000001))))

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!4715 (_ BitVec 32) (_ BitVec 64)) Unit!4037)

(assert (=> d!39371 (= lt!67360 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!4563 newMap!16) (ite c!23857 (index!3260 lt!67161) (index!3257 lt!67161)) (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355)))))

(declare-fun lt!67344 () Unit!4037)

(declare-fun lt!67370 () Unit!4037)

(assert (=> d!39371 (= lt!67344 lt!67370)))

(declare-fun lt!67365 () (_ BitVec 32))

(declare-fun lt!67359 () List!1703)

(assert (=> d!39371 (arrayNoDuplicates!0 (array!4716 (store (arr!2230 (_keys!4563 newMap!16)) (ite c!23857 (index!3260 lt!67161) (index!3257 lt!67161)) (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355)) (size!2497 (_keys!4563 newMap!16))) lt!67365 lt!67359)))

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!4715 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!1703) Unit!4037)

(assert (=> d!39371 (= lt!67370 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!4563 newMap!16) (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355) (ite c!23857 (index!3260 lt!67161) (index!3257 lt!67161)) lt!67365 lt!67359))))

(assert (=> d!39371 (= lt!67359 Nil!1700)))

(assert (=> d!39371 (= lt!67365 #b00000000000000000000000000000000)))

(declare-fun lt!67355 () Unit!4037)

(assert (=> d!39371 (= lt!67355 e!84688)))

(declare-fun c!23911 () Bool)

(assert (=> d!39371 (= c!23911 (arrayContainsKey!0 (_keys!4563 newMap!16) (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun lt!67348 () Unit!4037)

(assert (=> d!39371 (= lt!67348 e!84691)))

(assert (=> d!39371 (= c!23909 (contains!876 (getCurrentListMap!515 (_keys!4563 newMap!16) (_values!2806 newMap!16) (mask!7100 newMap!16) (extraKeys!2596 newMap!16) (zeroValue!2682 newMap!16) (minValue!2682 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2823 newMap!16)) (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355)))))

(assert (=> d!39371 (valid!521 newMap!16)))

(assert (=> d!39371 (= (updateHelperNewKey!58 newMap!16 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (ite c!23857 (index!3260 lt!67161) (index!3257 lt!67161))) lt!67346)))

(declare-fun b!129791 () Bool)

(declare-fun res!62568 () Bool)

(assert (=> b!129791 (=> (not res!62568) (not e!84695))))

(assert (=> b!129791 (= res!62568 (valid!521 (_2!1295 lt!67346)))))

(declare-fun b!129800 () Bool)

(declare-fun e!84690 () Bool)

(assert (=> b!129800 (= e!84690 ((_ is Undefined!275) lt!67349))))

(declare-fun b!129801 () Bool)

(declare-fun res!62564 () Bool)

(assert (=> b!129801 (=> (not res!62564) (not e!84692))))

(assert (=> b!129801 (= res!62564 call!14108)))

(assert (=> b!129801 (= e!84689 e!84692)))

(declare-fun b!129802 () Bool)

(assert (=> b!129802 (= e!84695 (= (map!1381 (_2!1295 lt!67346)) (+!160 (map!1381 newMap!16) (tuple2!2567 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!129803 () Bool)

(assert (=> b!129803 (= e!84690 e!84694)))

(declare-fun res!62570 () Bool)

(assert (=> b!129803 (= res!62570 call!14108)))

(assert (=> b!129803 (=> (not res!62570) (not e!84694))))

(declare-fun b!129804 () Bool)

(declare-fun c!23912 () Bool)

(assert (=> b!129804 (= c!23912 ((_ is MissingVacant!275) lt!67349))))

(assert (=> b!129804 (= e!84689 e!84690)))

(declare-fun bm!14107 () Bool)

(assert (=> bm!14107 (= call!14110 (seekEntryOrOpen!0 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355) (_keys!4563 newMap!16) (mask!7100 newMap!16)))))

(declare-fun b!129805 () Bool)

(declare-fun res!62571 () Bool)

(assert (=> b!129805 (= res!62571 (= (select (arr!2230 (_keys!4563 newMap!16)) (index!3260 lt!67349)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!129805 (=> (not res!62571) (not e!84694))))

(assert (= (and d!39371 c!23909) b!129792))

(assert (= (and d!39371 (not c!23909)) b!129789))

(assert (= (and b!129792 res!62566) b!129796))

(assert (= (and b!129796 res!62563) b!129798))

(assert (= (and b!129789 c!23910) b!129801))

(assert (= (and b!129789 (not c!23910)) b!129804))

(assert (= (and b!129801 res!62564) b!129790))

(assert (= (and b!129790 res!62567) b!129795))

(assert (= (and b!129804 c!23912) b!129803))

(assert (= (and b!129804 (not c!23912)) b!129800))

(assert (= (and b!129803 res!62570) b!129805))

(assert (= (and b!129805 res!62571) b!129794))

(assert (= (or b!129801 b!129803) bm!14106))

(assert (= (or b!129795 b!129794) bm!14104))

(assert (= (or b!129796 bm!14106) bm!14105))

(assert (= (or b!129792 b!129789) bm!14107))

(assert (= (and d!39371 c!23911) b!129793))

(assert (= (and d!39371 (not c!23911)) b!129797))

(assert (= (and d!39371 res!62569) b!129791))

(assert (= (and b!129791 res!62568) b!129799))

(assert (= (and b!129799 res!62565) b!129802))

(declare-fun m!152217 () Bool)

(assert (=> b!129790 m!152217))

(declare-fun m!152219 () Bool)

(assert (=> b!129805 m!152219))

(declare-fun m!152221 () Bool)

(assert (=> b!129798 m!152221))

(assert (=> b!129789 m!151753))

(assert (=> b!129789 m!151943))

(declare-fun m!152223 () Bool)

(assert (=> bm!14105 m!152223))

(assert (=> d!39371 m!151849))

(assert (=> d!39371 m!152197))

(declare-fun m!152225 () Bool)

(assert (=> d!39371 m!152225))

(declare-fun m!152227 () Bool)

(assert (=> d!39371 m!152227))

(declare-fun m!152229 () Bool)

(assert (=> d!39371 m!152229))

(declare-fun m!152231 () Bool)

(assert (=> d!39371 m!152231))

(declare-fun m!152233 () Bool)

(assert (=> d!39371 m!152233))

(assert (=> d!39371 m!151753))

(assert (=> d!39371 m!151751))

(declare-fun m!152235 () Bool)

(assert (=> d!39371 m!152235))

(assert (=> d!39371 m!151909))

(declare-fun m!152237 () Bool)

(assert (=> d!39371 m!152237))

(declare-fun m!152239 () Bool)

(assert (=> d!39371 m!152239))

(declare-fun m!152241 () Bool)

(assert (=> d!39371 m!152241))

(assert (=> d!39371 m!151753))

(declare-fun m!152243 () Bool)

(assert (=> d!39371 m!152243))

(declare-fun m!152245 () Bool)

(assert (=> d!39371 m!152245))

(assert (=> d!39371 m!152225))

(assert (=> d!39371 m!151753))

(assert (=> d!39371 m!151959))

(assert (=> d!39371 m!151849))

(assert (=> d!39371 m!151849))

(assert (=> d!39371 m!151753))

(assert (=> d!39371 m!151967))

(declare-fun m!152247 () Bool)

(assert (=> d!39371 m!152247))

(assert (=> d!39371 m!151753))

(declare-fun m!152249 () Bool)

(assert (=> d!39371 m!152249))

(declare-fun m!152251 () Bool)

(assert (=> d!39371 m!152251))

(assert (=> d!39371 m!151753))

(declare-fun m!152253 () Bool)

(assert (=> d!39371 m!152253))

(assert (=> d!39371 m!151753))

(declare-fun m!152255 () Bool)

(assert (=> d!39371 m!152255))

(assert (=> d!39371 m!151753))

(declare-fun m!152257 () Bool)

(assert (=> d!39371 m!152257))

(assert (=> d!39371 m!152227))

(assert (=> d!39371 m!151771))

(declare-fun m!152259 () Bool)

(assert (=> d!39371 m!152259))

(assert (=> bm!14107 m!151753))

(assert (=> bm!14107 m!151953))

(assert (=> bm!14104 m!151753))

(assert (=> bm!14104 m!151959))

(declare-fun m!152261 () Bool)

(assert (=> b!129802 m!152261))

(assert (=> b!129802 m!151775))

(assert (=> b!129802 m!151775))

(declare-fun m!152263 () Bool)

(assert (=> b!129802 m!152263))

(assert (=> b!129792 m!151753))

(assert (=> b!129792 m!151949))

(declare-fun m!152265 () Bool)

(assert (=> b!129791 m!152265))

(assert (=> b!129793 m!151753))

(declare-fun m!152267 () Bool)

(assert (=> b!129793 m!152267))

(assert (=> b!129793 m!151849))

(assert (=> b!129793 m!151849))

(assert (=> b!129793 m!151753))

(assert (=> b!129793 m!151967))

(assert (=> b!129799 m!152261))

(assert (=> b!129799 m!152261))

(assert (=> b!129799 m!151753))

(declare-fun m!152269 () Bool)

(assert (=> b!129799 m!152269))

(assert (=> bm!14074 d!39371))

(declare-fun d!39373 () Bool)

(assert (=> d!39373 (= (get!1462 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!129614 d!39373))

(declare-fun d!39375 () Bool)

(assert (=> d!39375 (= (map!1381 (_2!1295 lt!67144)) (getCurrentListMap!515 (_keys!4563 (_2!1295 lt!67144)) (_values!2806 (_2!1295 lt!67144)) (mask!7100 (_2!1295 lt!67144)) (extraKeys!2596 (_2!1295 lt!67144)) (zeroValue!2682 (_2!1295 lt!67144)) (minValue!2682 (_2!1295 lt!67144)) #b00000000000000000000000000000000 (defaultEntry!2823 (_2!1295 lt!67144))))))

(declare-fun bs!5365 () Bool)

(assert (= bs!5365 d!39375))

(declare-fun m!152271 () Bool)

(assert (=> bs!5365 m!152271))

(assert (=> bm!14073 d!39375))

(declare-fun b!129806 () Bool)

(declare-fun res!62580 () Bool)

(declare-fun e!84706 () Bool)

(assert (=> b!129806 (=> (not res!62580) (not e!84706))))

(declare-fun e!84703 () Bool)

(assert (=> b!129806 (= res!62580 e!84703)))

(declare-fun res!62573 () Bool)

(assert (=> b!129806 (=> res!62573 e!84703)))

(declare-fun e!84699 () Bool)

(assert (=> b!129806 (= res!62573 (not e!84699))))

(declare-fun res!62578 () Bool)

(assert (=> b!129806 (=> (not res!62578) (not e!84699))))

(assert (=> b!129806 (= res!62578 (bvslt #b00000000000000000000000000000000 (size!2497 (_keys!4563 newMap!16))))))

(declare-fun b!129807 () Bool)

(declare-fun e!84708 () Bool)

(declare-fun lt!67387 () ListLongMap!1661)

(assert (=> b!129807 (= e!84708 (= (apply!113 lt!67387 #b0000000000000000000000000000000000000000000000000000000000000000) (ite (and c!23852 c!23848) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2682 newMap!16))))))

(declare-fun b!129808 () Bool)

(declare-fun e!84704 () Bool)

(assert (=> b!129808 (= e!84704 e!84708)))

(declare-fun res!62577 () Bool)

(declare-fun call!14113 () Bool)

(assert (=> b!129808 (= res!62577 call!14113)))

(assert (=> b!129808 (=> (not res!62577) (not e!84708))))

(declare-fun b!129809 () Bool)

(declare-fun e!84697 () Bool)

(assert (=> b!129809 (= e!84703 e!84697)))

(declare-fun res!62575 () Bool)

(assert (=> b!129809 (=> (not res!62575) (not e!84697))))

(assert (=> b!129809 (= res!62575 (contains!876 lt!67387 (select (arr!2230 (_keys!4563 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!129809 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2497 (_keys!4563 newMap!16))))))

(declare-fun bm!14108 () Bool)

(declare-fun call!14116 () ListLongMap!1661)

(declare-fun call!14115 () ListLongMap!1661)

(assert (=> bm!14108 (= call!14116 call!14115)))

(declare-fun b!129810 () Bool)

(declare-fun e!84696 () Bool)

(declare-fun e!84698 () Bool)

(assert (=> b!129810 (= e!84696 e!84698)))

(declare-fun res!62576 () Bool)

(declare-fun call!14111 () Bool)

(assert (=> b!129810 (= res!62576 call!14111)))

(assert (=> b!129810 (=> (not res!62576) (not e!84698))))

(declare-fun b!129812 () Bool)

(declare-fun e!84707 () ListLongMap!1661)

(declare-fun call!14117 () ListLongMap!1661)

(assert (=> b!129812 (= e!84707 call!14117)))

(declare-fun b!129813 () Bool)

(declare-fun e!84700 () Bool)

(assert (=> b!129813 (= e!84700 (validKeyInArray!0 (select (arr!2230 (_keys!4563 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun bm!14109 () Bool)

(assert (=> bm!14109 (= call!14115 (getCurrentListMapNoExtraKeys!125 (_keys!4563 newMap!16) (ite (or c!23852 c!23854) (_values!2806 newMap!16) (array!4718 (store (arr!2231 (_values!2806 newMap!16)) (index!3258 lt!67161) (ValueCellFull!1085 (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2498 (_values!2806 newMap!16)))) (mask!7100 newMap!16) (ite c!23852 (ite c!23848 lt!67148 lt!67156) (extraKeys!2596 newMap!16)) (ite (and c!23852 c!23848) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2682 newMap!16)) (ite c!23852 (ite c!23848 (minValue!2682 newMap!16) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2682 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2823 newMap!16)))))

(declare-fun bm!14110 () Bool)

(assert (=> bm!14110 (= call!14111 (contains!876 lt!67387 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!129814 () Bool)

(assert (=> b!129814 (= e!84697 (= (apply!113 lt!67387 (select (arr!2230 (_keys!4563 newMap!16)) #b00000000000000000000000000000000)) (get!1459 (select (arr!2231 (ite (or c!23852 c!23854) (_values!2806 newMap!16) (array!4718 (store (arr!2231 (_values!2806 newMap!16)) (index!3258 lt!67161) (ValueCellFull!1085 (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2498 (_values!2806 newMap!16))))) #b00000000000000000000000000000000) (dynLambda!414 (defaultEntry!2823 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!129814 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2498 (ite (or c!23852 c!23854) (_values!2806 newMap!16) (array!4718 (store (arr!2231 (_values!2806 newMap!16)) (index!3258 lt!67161) (ValueCellFull!1085 (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2498 (_values!2806 newMap!16)))))))))

(assert (=> b!129814 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2497 (_keys!4563 newMap!16))))))

(declare-fun b!129815 () Bool)

(assert (=> b!129815 (= e!84706 e!84696)))

(declare-fun c!23914 () Bool)

(assert (=> b!129815 (= c!23914 (not (= (bvand (ite c!23852 (ite c!23848 lt!67148 lt!67156) (extraKeys!2596 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!129816 () Bool)

(assert (=> b!129816 (= e!84704 (not call!14113))))

(declare-fun b!129817 () Bool)

(declare-fun e!84702 () Unit!4037)

(declare-fun Unit!4051 () Unit!4037)

(assert (=> b!129817 (= e!84702 Unit!4051)))

(declare-fun b!129818 () Bool)

(declare-fun e!84705 () ListLongMap!1661)

(declare-fun call!14114 () ListLongMap!1661)

(assert (=> b!129818 (= e!84705 call!14114)))

(declare-fun bm!14111 () Bool)

(declare-fun call!14112 () ListLongMap!1661)

(assert (=> bm!14111 (= call!14114 call!14112)))

(declare-fun b!129819 () Bool)

(declare-fun lt!67381 () Unit!4037)

(assert (=> b!129819 (= e!84702 lt!67381)))

(declare-fun lt!67377 () ListLongMap!1661)

(assert (=> b!129819 (= lt!67377 (getCurrentListMapNoExtraKeys!125 (_keys!4563 newMap!16) (ite (or c!23852 c!23854) (_values!2806 newMap!16) (array!4718 (store (arr!2231 (_values!2806 newMap!16)) (index!3258 lt!67161) (ValueCellFull!1085 (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2498 (_values!2806 newMap!16)))) (mask!7100 newMap!16) (ite c!23852 (ite c!23848 lt!67148 lt!67156) (extraKeys!2596 newMap!16)) (ite (and c!23852 c!23848) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2682 newMap!16)) (ite c!23852 (ite c!23848 (minValue!2682 newMap!16) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2682 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2823 newMap!16)))))

(declare-fun lt!67389 () (_ BitVec 64))

(assert (=> b!129819 (= lt!67389 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!67379 () (_ BitVec 64))

(assert (=> b!129819 (= lt!67379 (select (arr!2230 (_keys!4563 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!67378 () Unit!4037)

(assert (=> b!129819 (= lt!67378 (addStillContains!89 lt!67377 lt!67389 (ite (and c!23852 c!23848) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2682 newMap!16)) lt!67379))))

(assert (=> b!129819 (contains!876 (+!160 lt!67377 (tuple2!2567 lt!67389 (ite (and c!23852 c!23848) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2682 newMap!16)))) lt!67379)))

(declare-fun lt!67380 () Unit!4037)

(assert (=> b!129819 (= lt!67380 lt!67378)))

(declare-fun lt!67390 () ListLongMap!1661)

(assert (=> b!129819 (= lt!67390 (getCurrentListMapNoExtraKeys!125 (_keys!4563 newMap!16) (ite (or c!23852 c!23854) (_values!2806 newMap!16) (array!4718 (store (arr!2231 (_values!2806 newMap!16)) (index!3258 lt!67161) (ValueCellFull!1085 (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2498 (_values!2806 newMap!16)))) (mask!7100 newMap!16) (ite c!23852 (ite c!23848 lt!67148 lt!67156) (extraKeys!2596 newMap!16)) (ite (and c!23852 c!23848) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2682 newMap!16)) (ite c!23852 (ite c!23848 (minValue!2682 newMap!16) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2682 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2823 newMap!16)))))

(declare-fun lt!67372 () (_ BitVec 64))

(assert (=> b!129819 (= lt!67372 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!67382 () (_ BitVec 64))

(assert (=> b!129819 (= lt!67382 (select (arr!2230 (_keys!4563 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!67392 () Unit!4037)

(assert (=> b!129819 (= lt!67392 (addApplyDifferent!89 lt!67390 lt!67372 (ite c!23852 (ite c!23848 (minValue!2682 newMap!16) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2682 newMap!16)) lt!67382))))

(assert (=> b!129819 (= (apply!113 (+!160 lt!67390 (tuple2!2567 lt!67372 (ite c!23852 (ite c!23848 (minValue!2682 newMap!16) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2682 newMap!16)))) lt!67382) (apply!113 lt!67390 lt!67382))))

(declare-fun lt!67388 () Unit!4037)

(assert (=> b!129819 (= lt!67388 lt!67392)))

(declare-fun lt!67375 () ListLongMap!1661)

(assert (=> b!129819 (= lt!67375 (getCurrentListMapNoExtraKeys!125 (_keys!4563 newMap!16) (ite (or c!23852 c!23854) (_values!2806 newMap!16) (array!4718 (store (arr!2231 (_values!2806 newMap!16)) (index!3258 lt!67161) (ValueCellFull!1085 (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2498 (_values!2806 newMap!16)))) (mask!7100 newMap!16) (ite c!23852 (ite c!23848 lt!67148 lt!67156) (extraKeys!2596 newMap!16)) (ite (and c!23852 c!23848) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2682 newMap!16)) (ite c!23852 (ite c!23848 (minValue!2682 newMap!16) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2682 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2823 newMap!16)))))

(declare-fun lt!67391 () (_ BitVec 64))

(assert (=> b!129819 (= lt!67391 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!67384 () (_ BitVec 64))

(assert (=> b!129819 (= lt!67384 (select (arr!2230 (_keys!4563 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!67386 () Unit!4037)

(assert (=> b!129819 (= lt!67386 (addApplyDifferent!89 lt!67375 lt!67391 (ite (and c!23852 c!23848) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2682 newMap!16)) lt!67384))))

(assert (=> b!129819 (= (apply!113 (+!160 lt!67375 (tuple2!2567 lt!67391 (ite (and c!23852 c!23848) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2682 newMap!16)))) lt!67384) (apply!113 lt!67375 lt!67384))))

(declare-fun lt!67385 () Unit!4037)

(assert (=> b!129819 (= lt!67385 lt!67386)))

(declare-fun lt!67383 () ListLongMap!1661)

(assert (=> b!129819 (= lt!67383 (getCurrentListMapNoExtraKeys!125 (_keys!4563 newMap!16) (ite (or c!23852 c!23854) (_values!2806 newMap!16) (array!4718 (store (arr!2231 (_values!2806 newMap!16)) (index!3258 lt!67161) (ValueCellFull!1085 (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2498 (_values!2806 newMap!16)))) (mask!7100 newMap!16) (ite c!23852 (ite c!23848 lt!67148 lt!67156) (extraKeys!2596 newMap!16)) (ite (and c!23852 c!23848) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2682 newMap!16)) (ite c!23852 (ite c!23848 (minValue!2682 newMap!16) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2682 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2823 newMap!16)))))

(declare-fun lt!67376 () (_ BitVec 64))

(assert (=> b!129819 (= lt!67376 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!67393 () (_ BitVec 64))

(assert (=> b!129819 (= lt!67393 (select (arr!2230 (_keys!4563 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!129819 (= lt!67381 (addApplyDifferent!89 lt!67383 lt!67376 (ite c!23852 (ite c!23848 (minValue!2682 newMap!16) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2682 newMap!16)) lt!67393))))

(assert (=> b!129819 (= (apply!113 (+!160 lt!67383 (tuple2!2567 lt!67376 (ite c!23852 (ite c!23848 (minValue!2682 newMap!16) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2682 newMap!16)))) lt!67393) (apply!113 lt!67383 lt!67393))))

(declare-fun b!129820 () Bool)

(assert (=> b!129820 (= e!84699 (validKeyInArray!0 (select (arr!2230 (_keys!4563 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!129821 () Bool)

(declare-fun c!23917 () Bool)

(assert (=> b!129821 (= c!23917 (and (not (= (bvand (ite c!23852 (ite c!23848 lt!67148 lt!67156) (extraKeys!2596 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (ite c!23852 (ite c!23848 lt!67148 lt!67156) (extraKeys!2596 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!129821 (= e!84705 e!84707)))

(declare-fun b!129822 () Bool)

(declare-fun res!62579 () Bool)

(assert (=> b!129822 (=> (not res!62579) (not e!84706))))

(assert (=> b!129822 (= res!62579 e!84704)))

(declare-fun c!23915 () Bool)

(assert (=> b!129822 (= c!23915 (not (= (bvand (ite c!23852 (ite c!23848 lt!67148 lt!67156) (extraKeys!2596 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!129823 () Bool)

(assert (=> b!129823 (= e!84707 call!14114)))

(declare-fun bm!14112 () Bool)

(assert (=> bm!14112 (= call!14117 call!14116)))

(declare-fun b!129824 () Bool)

(assert (=> b!129824 (= e!84698 (= (apply!113 lt!67387 #b1000000000000000000000000000000000000000000000000000000000000000) (ite c!23852 (ite c!23848 (minValue!2682 newMap!16) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2682 newMap!16))))))

(declare-fun b!129811 () Bool)

(declare-fun e!84701 () ListLongMap!1661)

(assert (=> b!129811 (= e!84701 (+!160 call!14112 (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!23852 (ite c!23848 (minValue!2682 newMap!16) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2682 newMap!16)))))))

(declare-fun d!39377 () Bool)

(assert (=> d!39377 e!84706))

(declare-fun res!62574 () Bool)

(assert (=> d!39377 (=> (not res!62574) (not e!84706))))

(assert (=> d!39377 (= res!62574 (or (bvsge #b00000000000000000000000000000000 (size!2497 (_keys!4563 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2497 (_keys!4563 newMap!16))))))))

(declare-fun lt!67373 () ListLongMap!1661)

(assert (=> d!39377 (= lt!67387 lt!67373)))

(declare-fun lt!67374 () Unit!4037)

(assert (=> d!39377 (= lt!67374 e!84702)))

(declare-fun c!23913 () Bool)

(assert (=> d!39377 (= c!23913 e!84700)))

(declare-fun res!62572 () Bool)

(assert (=> d!39377 (=> (not res!62572) (not e!84700))))

(assert (=> d!39377 (= res!62572 (bvslt #b00000000000000000000000000000000 (size!2497 (_keys!4563 newMap!16))))))

(assert (=> d!39377 (= lt!67373 e!84701)))

(declare-fun c!23918 () Bool)

(assert (=> d!39377 (= c!23918 (and (not (= (bvand (ite c!23852 (ite c!23848 lt!67148 lt!67156) (extraKeys!2596 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (ite c!23852 (ite c!23848 lt!67148 lt!67156) (extraKeys!2596 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!39377 (validMask!0 (mask!7100 newMap!16))))

(assert (=> d!39377 (= (getCurrentListMap!515 (_keys!4563 newMap!16) (ite (or c!23852 c!23854) (_values!2806 newMap!16) (array!4718 (store (arr!2231 (_values!2806 newMap!16)) (index!3258 lt!67161) (ValueCellFull!1085 (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2498 (_values!2806 newMap!16)))) (mask!7100 newMap!16) (ite c!23852 (ite c!23848 lt!67148 lt!67156) (extraKeys!2596 newMap!16)) (ite (and c!23852 c!23848) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2682 newMap!16)) (ite c!23852 (ite c!23848 (minValue!2682 newMap!16) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2682 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2823 newMap!16)) lt!67387)))

(declare-fun bm!14113 () Bool)

(assert (=> bm!14113 (= call!14113 (contains!876 lt!67387 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!129825 () Bool)

(assert (=> b!129825 (= e!84701 e!84705)))

(declare-fun c!23916 () Bool)

(assert (=> b!129825 (= c!23916 (and (not (= (bvand (ite c!23852 (ite c!23848 lt!67148 lt!67156) (extraKeys!2596 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (ite c!23852 (ite c!23848 lt!67148 lt!67156) (extraKeys!2596 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!14114 () Bool)

(assert (=> bm!14114 (= call!14112 (+!160 (ite c!23918 call!14115 (ite c!23916 call!14116 call!14117)) (ite (or c!23918 c!23916) (tuple2!2567 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (and c!23852 c!23848) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2682 newMap!16))) (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!23852 (ite c!23848 (minValue!2682 newMap!16) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2682 newMap!16))))))))

(declare-fun b!129826 () Bool)

(assert (=> b!129826 (= e!84696 (not call!14111))))

(assert (= (and d!39377 c!23918) b!129811))

(assert (= (and d!39377 (not c!23918)) b!129825))

(assert (= (and b!129825 c!23916) b!129818))

(assert (= (and b!129825 (not c!23916)) b!129821))

(assert (= (and b!129821 c!23917) b!129823))

(assert (= (and b!129821 (not c!23917)) b!129812))

(assert (= (or b!129823 b!129812) bm!14112))

(assert (= (or b!129818 bm!14112) bm!14108))

(assert (= (or b!129818 b!129823) bm!14111))

(assert (= (or b!129811 bm!14108) bm!14109))

(assert (= (or b!129811 bm!14111) bm!14114))

(assert (= (and d!39377 res!62572) b!129813))

(assert (= (and d!39377 c!23913) b!129819))

(assert (= (and d!39377 (not c!23913)) b!129817))

(assert (= (and d!39377 res!62574) b!129806))

(assert (= (and b!129806 res!62578) b!129820))

(assert (= (and b!129806 (not res!62573)) b!129809))

(assert (= (and b!129809 res!62575) b!129814))

(assert (= (and b!129806 res!62580) b!129822))

(assert (= (and b!129822 c!23915) b!129808))

(assert (= (and b!129822 (not c!23915)) b!129816))

(assert (= (and b!129808 res!62577) b!129807))

(assert (= (or b!129808 b!129816) bm!14113))

(assert (= (and b!129822 res!62579) b!129815))

(assert (= (and b!129815 c!23914) b!129810))

(assert (= (and b!129815 (not c!23914)) b!129826))

(assert (= (and b!129810 res!62576) b!129824))

(assert (= (or b!129810 b!129826) bm!14110))

(declare-fun b_lambda!5751 () Bool)

(assert (=> (not b_lambda!5751) (not b!129814)))

(assert (=> b!129814 t!6103))

(declare-fun b_and!8021 () Bool)

(assert (= b_and!8017 (and (=> t!6103 result!3917) b_and!8021)))

(assert (=> b!129814 t!6105))

(declare-fun b_and!8023 () Bool)

(assert (= b_and!8019 (and (=> t!6105 result!3919) b_and!8023)))

(declare-fun m!152273 () Bool)

(assert (=> bm!14110 m!152273))

(declare-fun m!152275 () Bool)

(assert (=> bm!14109 m!152275))

(assert (=> b!129820 m!152019))

(assert (=> b!129820 m!152019))

(assert (=> b!129820 m!152021))

(declare-fun m!152277 () Bool)

(assert (=> b!129811 m!152277))

(assert (=> d!39377 m!152025))

(declare-fun m!152279 () Bool)

(assert (=> b!129807 m!152279))

(assert (=> b!129813 m!152019))

(assert (=> b!129813 m!152019))

(assert (=> b!129813 m!152021))

(declare-fun m!152281 () Bool)

(assert (=> b!129824 m!152281))

(declare-fun m!152283 () Bool)

(assert (=> bm!14114 m!152283))

(declare-fun m!152285 () Bool)

(assert (=> b!129819 m!152285))

(declare-fun m!152287 () Bool)

(assert (=> b!129819 m!152287))

(declare-fun m!152289 () Bool)

(assert (=> b!129819 m!152289))

(declare-fun m!152291 () Bool)

(assert (=> b!129819 m!152291))

(declare-fun m!152293 () Bool)

(assert (=> b!129819 m!152293))

(declare-fun m!152295 () Bool)

(assert (=> b!129819 m!152295))

(assert (=> b!129819 m!152275))

(declare-fun m!152297 () Bool)

(assert (=> b!129819 m!152297))

(assert (=> b!129819 m!152019))

(declare-fun m!152299 () Bool)

(assert (=> b!129819 m!152299))

(declare-fun m!152301 () Bool)

(assert (=> b!129819 m!152301))

(declare-fun m!152303 () Bool)

(assert (=> b!129819 m!152303))

(assert (=> b!129819 m!152295))

(declare-fun m!152305 () Bool)

(assert (=> b!129819 m!152305))

(assert (=> b!129819 m!152289))

(declare-fun m!152307 () Bool)

(assert (=> b!129819 m!152307))

(declare-fun m!152309 () Bool)

(assert (=> b!129819 m!152309))

(declare-fun m!152311 () Bool)

(assert (=> b!129819 m!152311))

(assert (=> b!129819 m!152301))

(assert (=> b!129819 m!152299))

(declare-fun m!152313 () Bool)

(assert (=> b!129819 m!152313))

(declare-fun m!152315 () Bool)

(assert (=> bm!14113 m!152315))

(assert (=> b!129809 m!152019))

(assert (=> b!129809 m!152019))

(declare-fun m!152317 () Bool)

(assert (=> b!129809 m!152317))

(assert (=> b!129814 m!152019))

(declare-fun m!152319 () Bool)

(assert (=> b!129814 m!152319))

(assert (=> b!129814 m!152019))

(declare-fun m!152321 () Bool)

(assert (=> b!129814 m!152321))

(assert (=> b!129814 m!152319))

(assert (=> b!129814 m!152071))

(declare-fun m!152323 () Bool)

(assert (=> b!129814 m!152323))

(assert (=> b!129814 m!152071))

(assert (=> bm!14076 d!39377))

(declare-fun d!39379 () Bool)

(assert (=> d!39379 (= (apply!113 (+!160 lt!67074 (tuple2!2567 lt!67056 (minValue!2682 (v!3153 (underlying!442 thiss!992))))) lt!67066) (get!1463 (getValueByKey!167 (toList!846 (+!160 lt!67074 (tuple2!2567 lt!67056 (minValue!2682 (v!3153 (underlying!442 thiss!992)))))) lt!67066)))))

(declare-fun bs!5366 () Bool)

(assert (= bs!5366 d!39379))

(declare-fun m!152325 () Bool)

(assert (=> bs!5366 m!152325))

(assert (=> bs!5366 m!152325))

(declare-fun m!152327 () Bool)

(assert (=> bs!5366 m!152327))

(assert (=> b!129457 d!39379))

(assert (=> b!129457 d!39335))

(declare-fun d!39381 () Bool)

(assert (=> d!39381 (= (apply!113 (+!160 lt!67059 (tuple2!2567 lt!67075 (zeroValue!2682 (v!3153 (underlying!442 thiss!992))))) lt!67068) (get!1463 (getValueByKey!167 (toList!846 (+!160 lt!67059 (tuple2!2567 lt!67075 (zeroValue!2682 (v!3153 (underlying!442 thiss!992)))))) lt!67068)))))

(declare-fun bs!5367 () Bool)

(assert (= bs!5367 d!39381))

(declare-fun m!152329 () Bool)

(assert (=> bs!5367 m!152329))

(assert (=> bs!5367 m!152329))

(declare-fun m!152331 () Bool)

(assert (=> bs!5367 m!152331))

(assert (=> b!129457 d!39381))

(declare-fun d!39383 () Bool)

(assert (=> d!39383 (= (apply!113 (+!160 lt!67067 (tuple2!2567 lt!67060 (minValue!2682 (v!3153 (underlying!442 thiss!992))))) lt!67077) (apply!113 lt!67067 lt!67077))))

(declare-fun lt!67396 () Unit!4037)

(declare-fun choose!796 (ListLongMap!1661 (_ BitVec 64) V!3457 (_ BitVec 64)) Unit!4037)

(assert (=> d!39383 (= lt!67396 (choose!796 lt!67067 lt!67060 (minValue!2682 (v!3153 (underlying!442 thiss!992))) lt!67077))))

(declare-fun e!84711 () Bool)

(assert (=> d!39383 e!84711))

(declare-fun res!62583 () Bool)

(assert (=> d!39383 (=> (not res!62583) (not e!84711))))

(assert (=> d!39383 (= res!62583 (contains!876 lt!67067 lt!67077))))

(assert (=> d!39383 (= (addApplyDifferent!89 lt!67067 lt!67060 (minValue!2682 (v!3153 (underlying!442 thiss!992))) lt!67077) lt!67396)))

(declare-fun b!129830 () Bool)

(assert (=> b!129830 (= e!84711 (not (= lt!67077 lt!67060)))))

(assert (= (and d!39383 res!62583) b!129830))

(assert (=> d!39383 m!151869))

(declare-fun m!152333 () Bool)

(assert (=> d!39383 m!152333))

(declare-fun m!152335 () Bool)

(assert (=> d!39383 m!152335))

(assert (=> d!39383 m!151871))

(assert (=> d!39383 m!151871))

(assert (=> d!39383 m!151889))

(assert (=> b!129457 d!39383))

(declare-fun d!39385 () Bool)

(assert (=> d!39385 (= (apply!113 lt!67074 lt!67066) (get!1463 (getValueByKey!167 (toList!846 lt!67074) lt!67066)))))

(declare-fun bs!5368 () Bool)

(assert (= bs!5368 d!39385))

(declare-fun m!152337 () Bool)

(assert (=> bs!5368 m!152337))

(assert (=> bs!5368 m!152337))

(declare-fun m!152339 () Bool)

(assert (=> bs!5368 m!152339))

(assert (=> b!129457 d!39385))

(declare-fun d!39387 () Bool)

(declare-fun e!84713 () Bool)

(assert (=> d!39387 e!84713))

(declare-fun res!62584 () Bool)

(assert (=> d!39387 (=> res!62584 e!84713)))

(declare-fun lt!67399 () Bool)

(assert (=> d!39387 (= res!62584 (not lt!67399))))

(declare-fun lt!67400 () Bool)

(assert (=> d!39387 (= lt!67399 lt!67400)))

(declare-fun lt!67397 () Unit!4037)

(declare-fun e!84712 () Unit!4037)

(assert (=> d!39387 (= lt!67397 e!84712)))

(declare-fun c!23919 () Bool)

(assert (=> d!39387 (= c!23919 lt!67400)))

(assert (=> d!39387 (= lt!67400 (containsKey!171 (toList!846 (+!160 lt!67061 (tuple2!2567 lt!67073 (zeroValue!2682 (v!3153 (underlying!442 thiss!992)))))) lt!67063))))

(assert (=> d!39387 (= (contains!876 (+!160 lt!67061 (tuple2!2567 lt!67073 (zeroValue!2682 (v!3153 (underlying!442 thiss!992))))) lt!67063) lt!67399)))

(declare-fun b!129831 () Bool)

(declare-fun lt!67398 () Unit!4037)

(assert (=> b!129831 (= e!84712 lt!67398)))

(assert (=> b!129831 (= lt!67398 (lemmaContainsKeyImpliesGetValueByKeyDefined!120 (toList!846 (+!160 lt!67061 (tuple2!2567 lt!67073 (zeroValue!2682 (v!3153 (underlying!442 thiss!992)))))) lt!67063))))

(assert (=> b!129831 (isDefined!121 (getValueByKey!167 (toList!846 (+!160 lt!67061 (tuple2!2567 lt!67073 (zeroValue!2682 (v!3153 (underlying!442 thiss!992)))))) lt!67063))))

(declare-fun b!129832 () Bool)

(declare-fun Unit!4052 () Unit!4037)

(assert (=> b!129832 (= e!84712 Unit!4052)))

(declare-fun b!129833 () Bool)

(assert (=> b!129833 (= e!84713 (isDefined!121 (getValueByKey!167 (toList!846 (+!160 lt!67061 (tuple2!2567 lt!67073 (zeroValue!2682 (v!3153 (underlying!442 thiss!992)))))) lt!67063)))))

(assert (= (and d!39387 c!23919) b!129831))

(assert (= (and d!39387 (not c!23919)) b!129832))

(assert (= (and d!39387 (not res!62584)) b!129833))

(declare-fun m!152341 () Bool)

(assert (=> d!39387 m!152341))

(declare-fun m!152343 () Bool)

(assert (=> b!129831 m!152343))

(declare-fun m!152345 () Bool)

(assert (=> b!129831 m!152345))

(assert (=> b!129831 m!152345))

(declare-fun m!152347 () Bool)

(assert (=> b!129831 m!152347))

(assert (=> b!129833 m!152345))

(assert (=> b!129833 m!152345))

(assert (=> b!129833 m!152347))

(assert (=> b!129457 d!39387))

(declare-fun d!39389 () Bool)

(assert (=> d!39389 (= (apply!113 (+!160 lt!67067 (tuple2!2567 lt!67060 (minValue!2682 (v!3153 (underlying!442 thiss!992))))) lt!67077) (get!1463 (getValueByKey!167 (toList!846 (+!160 lt!67067 (tuple2!2567 lt!67060 (minValue!2682 (v!3153 (underlying!442 thiss!992)))))) lt!67077)))))

(declare-fun bs!5369 () Bool)

(assert (= bs!5369 d!39389))

(declare-fun m!152349 () Bool)

(assert (=> bs!5369 m!152349))

(assert (=> bs!5369 m!152349))

(declare-fun m!152351 () Bool)

(assert (=> bs!5369 m!152351))

(assert (=> b!129457 d!39389))

(declare-fun d!39391 () Bool)

(declare-fun e!84714 () Bool)

(assert (=> d!39391 e!84714))

(declare-fun res!62585 () Bool)

(assert (=> d!39391 (=> (not res!62585) (not e!84714))))

(declare-fun lt!67404 () ListLongMap!1661)

(assert (=> d!39391 (= res!62585 (contains!876 lt!67404 (_1!1294 (tuple2!2567 lt!67073 (zeroValue!2682 (v!3153 (underlying!442 thiss!992)))))))))

(declare-fun lt!67401 () List!1701)

(assert (=> d!39391 (= lt!67404 (ListLongMap!1662 lt!67401))))

(declare-fun lt!67402 () Unit!4037)

(declare-fun lt!67403 () Unit!4037)

(assert (=> d!39391 (= lt!67402 lt!67403)))

(assert (=> d!39391 (= (getValueByKey!167 lt!67401 (_1!1294 (tuple2!2567 lt!67073 (zeroValue!2682 (v!3153 (underlying!442 thiss!992)))))) (Some!172 (_2!1294 (tuple2!2567 lt!67073 (zeroValue!2682 (v!3153 (underlying!442 thiss!992)))))))))

(assert (=> d!39391 (= lt!67403 (lemmaContainsTupThenGetReturnValue!85 lt!67401 (_1!1294 (tuple2!2567 lt!67073 (zeroValue!2682 (v!3153 (underlying!442 thiss!992))))) (_2!1294 (tuple2!2567 lt!67073 (zeroValue!2682 (v!3153 (underlying!442 thiss!992)))))))))

(assert (=> d!39391 (= lt!67401 (insertStrictlySorted!88 (toList!846 lt!67061) (_1!1294 (tuple2!2567 lt!67073 (zeroValue!2682 (v!3153 (underlying!442 thiss!992))))) (_2!1294 (tuple2!2567 lt!67073 (zeroValue!2682 (v!3153 (underlying!442 thiss!992)))))))))

(assert (=> d!39391 (= (+!160 lt!67061 (tuple2!2567 lt!67073 (zeroValue!2682 (v!3153 (underlying!442 thiss!992))))) lt!67404)))

(declare-fun b!129834 () Bool)

(declare-fun res!62586 () Bool)

(assert (=> b!129834 (=> (not res!62586) (not e!84714))))

(assert (=> b!129834 (= res!62586 (= (getValueByKey!167 (toList!846 lt!67404) (_1!1294 (tuple2!2567 lt!67073 (zeroValue!2682 (v!3153 (underlying!442 thiss!992)))))) (Some!172 (_2!1294 (tuple2!2567 lt!67073 (zeroValue!2682 (v!3153 (underlying!442 thiss!992))))))))))

(declare-fun b!129835 () Bool)

(assert (=> b!129835 (= e!84714 (contains!878 (toList!846 lt!67404) (tuple2!2567 lt!67073 (zeroValue!2682 (v!3153 (underlying!442 thiss!992))))))))

(assert (= (and d!39391 res!62585) b!129834))

(assert (= (and b!129834 res!62586) b!129835))

(declare-fun m!152353 () Bool)

(assert (=> d!39391 m!152353))

(declare-fun m!152355 () Bool)

(assert (=> d!39391 m!152355))

(declare-fun m!152357 () Bool)

(assert (=> d!39391 m!152357))

(declare-fun m!152359 () Bool)

(assert (=> d!39391 m!152359))

(declare-fun m!152361 () Bool)

(assert (=> b!129834 m!152361))

(declare-fun m!152363 () Bool)

(assert (=> b!129835 m!152363))

(assert (=> b!129457 d!39391))

(declare-fun d!39393 () Bool)

(assert (=> d!39393 (= (apply!113 lt!67067 lt!67077) (get!1463 (getValueByKey!167 (toList!846 lt!67067) lt!67077)))))

(declare-fun bs!5370 () Bool)

(assert (= bs!5370 d!39393))

(declare-fun m!152365 () Bool)

(assert (=> bs!5370 m!152365))

(assert (=> bs!5370 m!152365))

(declare-fun m!152367 () Bool)

(assert (=> bs!5370 m!152367))

(assert (=> b!129457 d!39393))

(declare-fun d!39395 () Bool)

(declare-fun e!84715 () Bool)

(assert (=> d!39395 e!84715))

(declare-fun res!62587 () Bool)

(assert (=> d!39395 (=> (not res!62587) (not e!84715))))

(declare-fun lt!67408 () ListLongMap!1661)

(assert (=> d!39395 (= res!62587 (contains!876 lt!67408 (_1!1294 (tuple2!2567 lt!67060 (minValue!2682 (v!3153 (underlying!442 thiss!992)))))))))

(declare-fun lt!67405 () List!1701)

(assert (=> d!39395 (= lt!67408 (ListLongMap!1662 lt!67405))))

(declare-fun lt!67406 () Unit!4037)

(declare-fun lt!67407 () Unit!4037)

(assert (=> d!39395 (= lt!67406 lt!67407)))

(assert (=> d!39395 (= (getValueByKey!167 lt!67405 (_1!1294 (tuple2!2567 lt!67060 (minValue!2682 (v!3153 (underlying!442 thiss!992)))))) (Some!172 (_2!1294 (tuple2!2567 lt!67060 (minValue!2682 (v!3153 (underlying!442 thiss!992)))))))))

(assert (=> d!39395 (= lt!67407 (lemmaContainsTupThenGetReturnValue!85 lt!67405 (_1!1294 (tuple2!2567 lt!67060 (minValue!2682 (v!3153 (underlying!442 thiss!992))))) (_2!1294 (tuple2!2567 lt!67060 (minValue!2682 (v!3153 (underlying!442 thiss!992)))))))))

(assert (=> d!39395 (= lt!67405 (insertStrictlySorted!88 (toList!846 lt!67067) (_1!1294 (tuple2!2567 lt!67060 (minValue!2682 (v!3153 (underlying!442 thiss!992))))) (_2!1294 (tuple2!2567 lt!67060 (minValue!2682 (v!3153 (underlying!442 thiss!992)))))))))

(assert (=> d!39395 (= (+!160 lt!67067 (tuple2!2567 lt!67060 (minValue!2682 (v!3153 (underlying!442 thiss!992))))) lt!67408)))

(declare-fun b!129836 () Bool)

(declare-fun res!62588 () Bool)

(assert (=> b!129836 (=> (not res!62588) (not e!84715))))

(assert (=> b!129836 (= res!62588 (= (getValueByKey!167 (toList!846 lt!67408) (_1!1294 (tuple2!2567 lt!67060 (minValue!2682 (v!3153 (underlying!442 thiss!992)))))) (Some!172 (_2!1294 (tuple2!2567 lt!67060 (minValue!2682 (v!3153 (underlying!442 thiss!992))))))))))

(declare-fun b!129837 () Bool)

(assert (=> b!129837 (= e!84715 (contains!878 (toList!846 lt!67408) (tuple2!2567 lt!67060 (minValue!2682 (v!3153 (underlying!442 thiss!992))))))))

(assert (= (and d!39395 res!62587) b!129836))

(assert (= (and b!129836 res!62588) b!129837))

(declare-fun m!152369 () Bool)

(assert (=> d!39395 m!152369))

(declare-fun m!152371 () Bool)

(assert (=> d!39395 m!152371))

(declare-fun m!152373 () Bool)

(assert (=> d!39395 m!152373))

(declare-fun m!152375 () Bool)

(assert (=> d!39395 m!152375))

(declare-fun m!152377 () Bool)

(assert (=> b!129836 m!152377))

(declare-fun m!152379 () Bool)

(assert (=> b!129837 m!152379))

(assert (=> b!129457 d!39395))

(declare-fun d!39397 () Bool)

(assert (=> d!39397 (= (apply!113 (+!160 lt!67059 (tuple2!2567 lt!67075 (zeroValue!2682 (v!3153 (underlying!442 thiss!992))))) lt!67068) (apply!113 lt!67059 lt!67068))))

(declare-fun lt!67409 () Unit!4037)

(assert (=> d!39397 (= lt!67409 (choose!796 lt!67059 lt!67075 (zeroValue!2682 (v!3153 (underlying!442 thiss!992))) lt!67068))))

(declare-fun e!84716 () Bool)

(assert (=> d!39397 e!84716))

(declare-fun res!62589 () Bool)

(assert (=> d!39397 (=> (not res!62589) (not e!84716))))

(assert (=> d!39397 (= res!62589 (contains!876 lt!67059 lt!67068))))

(assert (=> d!39397 (= (addApplyDifferent!89 lt!67059 lt!67075 (zeroValue!2682 (v!3153 (underlying!442 thiss!992))) lt!67068) lt!67409)))

(declare-fun b!129838 () Bool)

(assert (=> b!129838 (= e!84716 (not (= lt!67068 lt!67075)))))

(assert (= (and d!39397 res!62589) b!129838))

(assert (=> d!39397 m!151873))

(declare-fun m!152381 () Bool)

(assert (=> d!39397 m!152381))

(declare-fun m!152383 () Bool)

(assert (=> d!39397 m!152383))

(assert (=> d!39397 m!151883))

(assert (=> d!39397 m!151883))

(assert (=> d!39397 m!151885))

(assert (=> b!129457 d!39397))

(declare-fun d!39399 () Bool)

(assert (=> d!39399 (= (apply!113 (+!160 lt!67074 (tuple2!2567 lt!67056 (minValue!2682 (v!3153 (underlying!442 thiss!992))))) lt!67066) (apply!113 lt!67074 lt!67066))))

(declare-fun lt!67410 () Unit!4037)

(assert (=> d!39399 (= lt!67410 (choose!796 lt!67074 lt!67056 (minValue!2682 (v!3153 (underlying!442 thiss!992))) lt!67066))))

(declare-fun e!84717 () Bool)

(assert (=> d!39399 e!84717))

(declare-fun res!62590 () Bool)

(assert (=> d!39399 (=> (not res!62590) (not e!84717))))

(assert (=> d!39399 (= res!62590 (contains!876 lt!67074 lt!67066))))

(assert (=> d!39399 (= (addApplyDifferent!89 lt!67074 lt!67056 (minValue!2682 (v!3153 (underlying!442 thiss!992))) lt!67066) lt!67410)))

(declare-fun b!129839 () Bool)

(assert (=> b!129839 (= e!84717 (not (= lt!67066 lt!67056)))))

(assert (= (and d!39399 res!62590) b!129839))

(assert (=> d!39399 m!151867))

(declare-fun m!152385 () Bool)

(assert (=> d!39399 m!152385))

(declare-fun m!152387 () Bool)

(assert (=> d!39399 m!152387))

(assert (=> d!39399 m!151881))

(assert (=> d!39399 m!151881))

(assert (=> d!39399 m!151895))

(assert (=> b!129457 d!39399))

(declare-fun d!39401 () Bool)

(declare-fun e!84718 () Bool)

(assert (=> d!39401 e!84718))

(declare-fun res!62591 () Bool)

(assert (=> d!39401 (=> (not res!62591) (not e!84718))))

(declare-fun lt!67414 () ListLongMap!1661)

(assert (=> d!39401 (= res!62591 (contains!876 lt!67414 (_1!1294 (tuple2!2567 lt!67075 (zeroValue!2682 (v!3153 (underlying!442 thiss!992)))))))))

(declare-fun lt!67411 () List!1701)

(assert (=> d!39401 (= lt!67414 (ListLongMap!1662 lt!67411))))

(declare-fun lt!67412 () Unit!4037)

(declare-fun lt!67413 () Unit!4037)

(assert (=> d!39401 (= lt!67412 lt!67413)))

(assert (=> d!39401 (= (getValueByKey!167 lt!67411 (_1!1294 (tuple2!2567 lt!67075 (zeroValue!2682 (v!3153 (underlying!442 thiss!992)))))) (Some!172 (_2!1294 (tuple2!2567 lt!67075 (zeroValue!2682 (v!3153 (underlying!442 thiss!992)))))))))

(assert (=> d!39401 (= lt!67413 (lemmaContainsTupThenGetReturnValue!85 lt!67411 (_1!1294 (tuple2!2567 lt!67075 (zeroValue!2682 (v!3153 (underlying!442 thiss!992))))) (_2!1294 (tuple2!2567 lt!67075 (zeroValue!2682 (v!3153 (underlying!442 thiss!992)))))))))

(assert (=> d!39401 (= lt!67411 (insertStrictlySorted!88 (toList!846 lt!67059) (_1!1294 (tuple2!2567 lt!67075 (zeroValue!2682 (v!3153 (underlying!442 thiss!992))))) (_2!1294 (tuple2!2567 lt!67075 (zeroValue!2682 (v!3153 (underlying!442 thiss!992)))))))))

(assert (=> d!39401 (= (+!160 lt!67059 (tuple2!2567 lt!67075 (zeroValue!2682 (v!3153 (underlying!442 thiss!992))))) lt!67414)))

(declare-fun b!129840 () Bool)

(declare-fun res!62592 () Bool)

(assert (=> b!129840 (=> (not res!62592) (not e!84718))))

(assert (=> b!129840 (= res!62592 (= (getValueByKey!167 (toList!846 lt!67414) (_1!1294 (tuple2!2567 lt!67075 (zeroValue!2682 (v!3153 (underlying!442 thiss!992)))))) (Some!172 (_2!1294 (tuple2!2567 lt!67075 (zeroValue!2682 (v!3153 (underlying!442 thiss!992))))))))))

(declare-fun b!129841 () Bool)

(assert (=> b!129841 (= e!84718 (contains!878 (toList!846 lt!67414) (tuple2!2567 lt!67075 (zeroValue!2682 (v!3153 (underlying!442 thiss!992))))))))

(assert (= (and d!39401 res!62591) b!129840))

(assert (= (and b!129840 res!62592) b!129841))

(declare-fun m!152389 () Bool)

(assert (=> d!39401 m!152389))

(declare-fun m!152391 () Bool)

(assert (=> d!39401 m!152391))

(declare-fun m!152393 () Bool)

(assert (=> d!39401 m!152393))

(declare-fun m!152395 () Bool)

(assert (=> d!39401 m!152395))

(declare-fun m!152397 () Bool)

(assert (=> b!129840 m!152397))

(declare-fun m!152399 () Bool)

(assert (=> b!129841 m!152399))

(assert (=> b!129457 d!39401))

(declare-fun d!39403 () Bool)

(declare-fun e!84719 () Bool)

(assert (=> d!39403 e!84719))

(declare-fun res!62593 () Bool)

(assert (=> d!39403 (=> (not res!62593) (not e!84719))))

(declare-fun lt!67418 () ListLongMap!1661)

(assert (=> d!39403 (= res!62593 (contains!876 lt!67418 (_1!1294 (tuple2!2567 lt!67056 (minValue!2682 (v!3153 (underlying!442 thiss!992)))))))))

(declare-fun lt!67415 () List!1701)

(assert (=> d!39403 (= lt!67418 (ListLongMap!1662 lt!67415))))

(declare-fun lt!67416 () Unit!4037)

(declare-fun lt!67417 () Unit!4037)

(assert (=> d!39403 (= lt!67416 lt!67417)))

(assert (=> d!39403 (= (getValueByKey!167 lt!67415 (_1!1294 (tuple2!2567 lt!67056 (minValue!2682 (v!3153 (underlying!442 thiss!992)))))) (Some!172 (_2!1294 (tuple2!2567 lt!67056 (minValue!2682 (v!3153 (underlying!442 thiss!992)))))))))

(assert (=> d!39403 (= lt!67417 (lemmaContainsTupThenGetReturnValue!85 lt!67415 (_1!1294 (tuple2!2567 lt!67056 (minValue!2682 (v!3153 (underlying!442 thiss!992))))) (_2!1294 (tuple2!2567 lt!67056 (minValue!2682 (v!3153 (underlying!442 thiss!992)))))))))

(assert (=> d!39403 (= lt!67415 (insertStrictlySorted!88 (toList!846 lt!67074) (_1!1294 (tuple2!2567 lt!67056 (minValue!2682 (v!3153 (underlying!442 thiss!992))))) (_2!1294 (tuple2!2567 lt!67056 (minValue!2682 (v!3153 (underlying!442 thiss!992)))))))))

(assert (=> d!39403 (= (+!160 lt!67074 (tuple2!2567 lt!67056 (minValue!2682 (v!3153 (underlying!442 thiss!992))))) lt!67418)))

(declare-fun b!129842 () Bool)

(declare-fun res!62594 () Bool)

(assert (=> b!129842 (=> (not res!62594) (not e!84719))))

(assert (=> b!129842 (= res!62594 (= (getValueByKey!167 (toList!846 lt!67418) (_1!1294 (tuple2!2567 lt!67056 (minValue!2682 (v!3153 (underlying!442 thiss!992)))))) (Some!172 (_2!1294 (tuple2!2567 lt!67056 (minValue!2682 (v!3153 (underlying!442 thiss!992))))))))))

(declare-fun b!129843 () Bool)

(assert (=> b!129843 (= e!84719 (contains!878 (toList!846 lt!67418) (tuple2!2567 lt!67056 (minValue!2682 (v!3153 (underlying!442 thiss!992))))))))

(assert (= (and d!39403 res!62593) b!129842))

(assert (= (and b!129842 res!62594) b!129843))

(declare-fun m!152401 () Bool)

(assert (=> d!39403 m!152401))

(declare-fun m!152403 () Bool)

(assert (=> d!39403 m!152403))

(declare-fun m!152405 () Bool)

(assert (=> d!39403 m!152405))

(declare-fun m!152407 () Bool)

(assert (=> d!39403 m!152407))

(declare-fun m!152409 () Bool)

(assert (=> b!129842 m!152409))

(declare-fun m!152411 () Bool)

(assert (=> b!129843 m!152411))

(assert (=> b!129457 d!39403))

(declare-fun d!39405 () Bool)

(assert (=> d!39405 (= (apply!113 lt!67059 lt!67068) (get!1463 (getValueByKey!167 (toList!846 lt!67059) lt!67068)))))

(declare-fun bs!5371 () Bool)

(assert (= bs!5371 d!39405))

(declare-fun m!152413 () Bool)

(assert (=> bs!5371 m!152413))

(assert (=> bs!5371 m!152413))

(declare-fun m!152415 () Bool)

(assert (=> bs!5371 m!152415))

(assert (=> b!129457 d!39405))

(declare-fun d!39407 () Bool)

(assert (=> d!39407 (contains!876 (+!160 lt!67061 (tuple2!2567 lt!67073 (zeroValue!2682 (v!3153 (underlying!442 thiss!992))))) lt!67063)))

(declare-fun lt!67421 () Unit!4037)

(declare-fun choose!797 (ListLongMap!1661 (_ BitVec 64) V!3457 (_ BitVec 64)) Unit!4037)

(assert (=> d!39407 (= lt!67421 (choose!797 lt!67061 lt!67073 (zeroValue!2682 (v!3153 (underlying!442 thiss!992))) lt!67063))))

(assert (=> d!39407 (contains!876 lt!67061 lt!67063)))

(assert (=> d!39407 (= (addStillContains!89 lt!67061 lt!67073 (zeroValue!2682 (v!3153 (underlying!442 thiss!992))) lt!67063) lt!67421)))

(declare-fun bs!5372 () Bool)

(assert (= bs!5372 d!39407))

(assert (=> bs!5372 m!151877))

(assert (=> bs!5372 m!151877))

(assert (=> bs!5372 m!151887))

(declare-fun m!152417 () Bool)

(assert (=> bs!5372 m!152417))

(declare-fun m!152419 () Bool)

(assert (=> bs!5372 m!152419))

(assert (=> b!129457 d!39407))

(assert (=> b!129573 d!39351))

(declare-fun bm!14117 () Bool)

(declare-fun call!14120 () Bool)

(assert (=> bm!14117 (= call!14120 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!4563 newMap!16) (mask!7100 newMap!16)))))

(declare-fun b!129853 () Bool)

(declare-fun e!84726 () Bool)

(assert (=> b!129853 (= e!84726 call!14120)))

(declare-fun b!129854 () Bool)

(declare-fun e!84727 () Bool)

(assert (=> b!129854 (= e!84727 call!14120)))

(declare-fun d!39409 () Bool)

(declare-fun res!62600 () Bool)

(declare-fun e!84728 () Bool)

(assert (=> d!39409 (=> res!62600 e!84728)))

(assert (=> d!39409 (= res!62600 (bvsge #b00000000000000000000000000000000 (size!2497 (_keys!4563 newMap!16))))))

(assert (=> d!39409 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4563 newMap!16) (mask!7100 newMap!16)) e!84728)))

(declare-fun b!129855 () Bool)

(assert (=> b!129855 (= e!84728 e!84726)))

(declare-fun c!23922 () Bool)

(assert (=> b!129855 (= c!23922 (validKeyInArray!0 (select (arr!2230 (_keys!4563 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!129856 () Bool)

(assert (=> b!129856 (= e!84726 e!84727)))

(declare-fun lt!67430 () (_ BitVec 64))

(assert (=> b!129856 (= lt!67430 (select (arr!2230 (_keys!4563 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!67428 () Unit!4037)

(assert (=> b!129856 (= lt!67428 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!4563 newMap!16) lt!67430 #b00000000000000000000000000000000))))

(assert (=> b!129856 (arrayContainsKey!0 (_keys!4563 newMap!16) lt!67430 #b00000000000000000000000000000000)))

(declare-fun lt!67429 () Unit!4037)

(assert (=> b!129856 (= lt!67429 lt!67428)))

(declare-fun res!62599 () Bool)

(assert (=> b!129856 (= res!62599 (= (seekEntryOrOpen!0 (select (arr!2230 (_keys!4563 newMap!16)) #b00000000000000000000000000000000) (_keys!4563 newMap!16) (mask!7100 newMap!16)) (Found!275 #b00000000000000000000000000000000)))))

(assert (=> b!129856 (=> (not res!62599) (not e!84727))))

(assert (= (and d!39409 (not res!62600)) b!129855))

(assert (= (and b!129855 c!23922) b!129856))

(assert (= (and b!129855 (not c!23922)) b!129853))

(assert (= (and b!129856 res!62599) b!129854))

(assert (= (or b!129854 b!129853) bm!14117))

(declare-fun m!152421 () Bool)

(assert (=> bm!14117 m!152421))

(assert (=> b!129855 m!152019))

(assert (=> b!129855 m!152019))

(assert (=> b!129855 m!152021))

(assert (=> b!129856 m!152019))

(declare-fun m!152423 () Bool)

(assert (=> b!129856 m!152423))

(declare-fun m!152425 () Bool)

(assert (=> b!129856 m!152425))

(assert (=> b!129856 m!152019))

(declare-fun m!152427 () Bool)

(assert (=> b!129856 m!152427))

(assert (=> b!129472 d!39409))

(declare-fun d!39411 () Bool)

(assert (=> d!39411 (= (+!160 (getCurrentListMap!515 (_keys!4563 newMap!16) (_values!2806 newMap!16) (mask!7100 newMap!16) (extraKeys!2596 newMap!16) (zeroValue!2682 newMap!16) (minValue!2682 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2823 newMap!16)) (tuple2!2567 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (getCurrentListMap!515 (_keys!4563 newMap!16) (_values!2806 newMap!16) (mask!7100 newMap!16) lt!67148 (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2682 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2823 newMap!16)))))

(declare-fun lt!67433 () Unit!4037)

(declare-fun choose!798 (array!4715 array!4717 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3457 V!3457 V!3457 Int) Unit!4037)

(assert (=> d!39411 (= lt!67433 (choose!798 (_keys!4563 newMap!16) (_values!2806 newMap!16) (mask!7100 newMap!16) (extraKeys!2596 newMap!16) lt!67148 (zeroValue!2682 newMap!16) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2682 newMap!16) (defaultEntry!2823 newMap!16)))))

(assert (=> d!39411 (validMask!0 (mask!7100 newMap!16))))

(assert (=> d!39411 (= (lemmaChangeZeroKeyThenAddPairToListMap!58 (_keys!4563 newMap!16) (_values!2806 newMap!16) (mask!7100 newMap!16) (extraKeys!2596 newMap!16) lt!67148 (zeroValue!2682 newMap!16) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2682 newMap!16) (defaultEntry!2823 newMap!16)) lt!67433)))

(declare-fun bs!5373 () Bool)

(assert (= bs!5373 d!39411))

(assert (=> bs!5373 m!151751))

(declare-fun m!152429 () Bool)

(assert (=> bs!5373 m!152429))

(assert (=> bs!5373 m!152025))

(assert (=> bs!5373 m!151751))

(declare-fun m!152431 () Bool)

(assert (=> bs!5373 m!152431))

(assert (=> bs!5373 m!151849))

(declare-fun m!152433 () Bool)

(assert (=> bs!5373 m!152433))

(assert (=> bs!5373 m!151849))

(assert (=> b!129588 d!39411))

(declare-fun d!39413 () Bool)

(declare-fun e!84730 () Bool)

(assert (=> d!39413 e!84730))

(declare-fun res!62601 () Bool)

(assert (=> d!39413 (=> res!62601 e!84730)))

(declare-fun lt!67436 () Bool)

(assert (=> d!39413 (= res!62601 (not lt!67436))))

(declare-fun lt!67437 () Bool)

(assert (=> d!39413 (= lt!67436 lt!67437)))

(declare-fun lt!67434 () Unit!4037)

(declare-fun e!84729 () Unit!4037)

(assert (=> d!39413 (= lt!67434 e!84729)))

(declare-fun c!23923 () Bool)

(assert (=> d!39413 (= c!23923 lt!67437)))

(assert (=> d!39413 (= lt!67437 (containsKey!171 (toList!846 e!84562) (ite c!23854 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355) (select (arr!2230 (_keys!4563 newMap!16)) (index!3258 lt!67161)))))))

(assert (=> d!39413 (= (contains!876 e!84562 (ite c!23854 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355) (select (arr!2230 (_keys!4563 newMap!16)) (index!3258 lt!67161)))) lt!67436)))

(declare-fun b!129857 () Bool)

(declare-fun lt!67435 () Unit!4037)

(assert (=> b!129857 (= e!84729 lt!67435)))

(assert (=> b!129857 (= lt!67435 (lemmaContainsKeyImpliesGetValueByKeyDefined!120 (toList!846 e!84562) (ite c!23854 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355) (select (arr!2230 (_keys!4563 newMap!16)) (index!3258 lt!67161)))))))

(assert (=> b!129857 (isDefined!121 (getValueByKey!167 (toList!846 e!84562) (ite c!23854 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355) (select (arr!2230 (_keys!4563 newMap!16)) (index!3258 lt!67161)))))))

(declare-fun b!129858 () Bool)

(declare-fun Unit!4053 () Unit!4037)

(assert (=> b!129858 (= e!84729 Unit!4053)))

(declare-fun b!129859 () Bool)

(assert (=> b!129859 (= e!84730 (isDefined!121 (getValueByKey!167 (toList!846 e!84562) (ite c!23854 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355) (select (arr!2230 (_keys!4563 newMap!16)) (index!3258 lt!67161))))))))

(assert (= (and d!39413 c!23923) b!129857))

(assert (= (and d!39413 (not c!23923)) b!129858))

(assert (= (and d!39413 (not res!62601)) b!129859))

(declare-fun m!152435 () Bool)

(assert (=> d!39413 m!152435))

(declare-fun m!152437 () Bool)

(assert (=> b!129857 m!152437))

(declare-fun m!152439 () Bool)

(assert (=> b!129857 m!152439))

(assert (=> b!129857 m!152439))

(declare-fun m!152441 () Bool)

(assert (=> b!129857 m!152441))

(assert (=> b!129859 m!152439))

(assert (=> b!129859 m!152439))

(assert (=> b!129859 m!152441))

(assert (=> bm!14075 d!39413))

(assert (=> b!129458 d!39355))

(assert (=> d!39315 d!39311))

(declare-fun b!129868 () Bool)

(declare-fun e!84735 () (_ BitVec 32))

(declare-fun call!14123 () (_ BitVec 32))

(assert (=> b!129868 (= e!84735 call!14123)))

(declare-fun b!129870 () Bool)

(assert (=> b!129870 (= e!84735 (bvadd #b00000000000000000000000000000001 call!14123))))

(declare-fun b!129871 () Bool)

(declare-fun e!84736 () (_ BitVec 32))

(assert (=> b!129871 (= e!84736 #b00000000000000000000000000000000)))

(declare-fun bm!14120 () Bool)

(assert (=> bm!14120 (= call!14123 (arrayCountValidKeys!0 (_keys!4563 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2497 (_keys!4563 newMap!16))))))

(declare-fun d!39415 () Bool)

(declare-fun lt!67440 () (_ BitVec 32))

(assert (=> d!39415 (and (bvsge lt!67440 #b00000000000000000000000000000000) (bvsle lt!67440 (bvsub (size!2497 (_keys!4563 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> d!39415 (= lt!67440 e!84736)))

(declare-fun c!23929 () Bool)

(assert (=> d!39415 (= c!23929 (bvsge #b00000000000000000000000000000000 (size!2497 (_keys!4563 newMap!16))))))

(assert (=> d!39415 (and (bvsle #b00000000000000000000000000000000 (size!2497 (_keys!4563 newMap!16))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!2497 (_keys!4563 newMap!16)) (size!2497 (_keys!4563 newMap!16))))))

(assert (=> d!39415 (= (arrayCountValidKeys!0 (_keys!4563 newMap!16) #b00000000000000000000000000000000 (size!2497 (_keys!4563 newMap!16))) lt!67440)))

(declare-fun b!129869 () Bool)

(assert (=> b!129869 (= e!84736 e!84735)))

(declare-fun c!23928 () Bool)

(assert (=> b!129869 (= c!23928 (validKeyInArray!0 (select (arr!2230 (_keys!4563 newMap!16)) #b00000000000000000000000000000000)))))

(assert (= (and d!39415 c!23929) b!129871))

(assert (= (and d!39415 (not c!23929)) b!129869))

(assert (= (and b!129869 c!23928) b!129870))

(assert (= (and b!129869 (not c!23928)) b!129868))

(assert (= (or b!129870 b!129868) bm!14120))

(declare-fun m!152443 () Bool)

(assert (=> bm!14120 m!152443))

(assert (=> b!129869 m!152019))

(assert (=> b!129869 m!152019))

(assert (=> b!129869 m!152021))

(assert (=> b!129471 d!39415))

(declare-fun b!129881 () Bool)

(declare-fun res!62611 () Bool)

(declare-fun e!84739 () Bool)

(assert (=> b!129881 (=> (not res!62611) (not e!84739))))

(declare-fun size!2503 (LongMapFixedSize!1078) (_ BitVec 32))

(assert (=> b!129881 (= res!62611 (bvsge (size!2503 newMap!16) (_size!588 newMap!16)))))

(declare-fun d!39417 () Bool)

(declare-fun res!62610 () Bool)

(assert (=> d!39417 (=> (not res!62610) (not e!84739))))

(assert (=> d!39417 (= res!62610 (validMask!0 (mask!7100 newMap!16)))))

(assert (=> d!39417 (= (simpleValid!89 newMap!16) e!84739)))

(declare-fun b!129880 () Bool)

(declare-fun res!62612 () Bool)

(assert (=> b!129880 (=> (not res!62612) (not e!84739))))

(assert (=> b!129880 (= res!62612 (and (= (size!2498 (_values!2806 newMap!16)) (bvadd (mask!7100 newMap!16) #b00000000000000000000000000000001)) (= (size!2497 (_keys!4563 newMap!16)) (size!2498 (_values!2806 newMap!16))) (bvsge (_size!588 newMap!16) #b00000000000000000000000000000000) (bvsle (_size!588 newMap!16) (bvadd (mask!7100 newMap!16) #b00000000000000000000000000000001))))))

(declare-fun b!129883 () Bool)

(assert (=> b!129883 (= e!84739 (and (bvsge (extraKeys!2596 newMap!16) #b00000000000000000000000000000000) (bvsle (extraKeys!2596 newMap!16) #b00000000000000000000000000000011) (bvsge (_vacant!588 newMap!16) #b00000000000000000000000000000000)))))

(declare-fun b!129882 () Bool)

(declare-fun res!62613 () Bool)

(assert (=> b!129882 (=> (not res!62613) (not e!84739))))

(assert (=> b!129882 (= res!62613 (= (size!2503 newMap!16) (bvadd (_size!588 newMap!16) (bvsdiv (bvadd (extraKeys!2596 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(assert (= (and d!39417 res!62610) b!129880))

(assert (= (and b!129880 res!62612) b!129881))

(assert (= (and b!129881 res!62611) b!129882))

(assert (= (and b!129882 res!62613) b!129883))

(declare-fun m!152445 () Bool)

(assert (=> b!129881 m!152445))

(assert (=> d!39417 m!152025))

(assert (=> b!129882 m!152445))

(assert (=> d!39325 d!39417))

(declare-fun d!39419 () Bool)

(assert (=> d!39419 (= (inRange!0 (ite c!23854 (ite c!23855 (index!3258 lt!67146) (ite c!23849 (index!3257 lt!67145) (index!3260 lt!67145))) (ite c!23860 (index!3258 lt!67166) (ite c!23859 (index!3257 lt!67157) (index!3260 lt!67157)))) (mask!7100 newMap!16)) (and (bvsge (ite c!23854 (ite c!23855 (index!3258 lt!67146) (ite c!23849 (index!3257 lt!67145) (index!3260 lt!67145))) (ite c!23860 (index!3258 lt!67166) (ite c!23859 (index!3257 lt!67157) (index!3260 lt!67157)))) #b00000000000000000000000000000000) (bvslt (ite c!23854 (ite c!23855 (index!3258 lt!67146) (ite c!23849 (index!3257 lt!67145) (index!3260 lt!67145))) (ite c!23860 (index!3258 lt!67166) (ite c!23859 (index!3257 lt!67157) (index!3260 lt!67157)))) (bvadd (mask!7100 newMap!16) #b00000000000000000000000000000001))))))

(assert (=> bm!14061 d!39419))

(declare-fun d!39421 () Bool)

(declare-fun res!62618 () Bool)

(declare-fun e!84744 () Bool)

(assert (=> d!39421 (=> res!62618 e!84744)))

(assert (=> d!39421 (= res!62618 (= (select (arr!2230 (_keys!4563 newMap!16)) #b00000000000000000000000000000000) (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355)))))

(assert (=> d!39421 (= (arrayContainsKey!0 (_keys!4563 newMap!16) (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355) #b00000000000000000000000000000000) e!84744)))

(declare-fun b!129888 () Bool)

(declare-fun e!84745 () Bool)

(assert (=> b!129888 (= e!84744 e!84745)))

(declare-fun res!62619 () Bool)

(assert (=> b!129888 (=> (not res!62619) (not e!84745))))

(assert (=> b!129888 (= res!62619 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2497 (_keys!4563 newMap!16))))))

(declare-fun b!129889 () Bool)

(assert (=> b!129889 (= e!84745 (arrayContainsKey!0 (_keys!4563 newMap!16) (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!39421 (not res!62618)) b!129888))

(assert (= (and b!129888 res!62619) b!129889))

(assert (=> d!39421 m!152019))

(assert (=> b!129889 m!151753))

(declare-fun m!152447 () Bool)

(assert (=> b!129889 m!152447))

(assert (=> bm!14070 d!39421))

(declare-fun d!39423 () Bool)

(declare-fun e!84746 () Bool)

(assert (=> d!39423 e!84746))

(declare-fun res!62620 () Bool)

(assert (=> d!39423 (=> (not res!62620) (not e!84746))))

(declare-fun lt!67444 () ListLongMap!1661)

(assert (=> d!39423 (= res!62620 (contains!876 lt!67444 (_1!1294 (tuple2!2567 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!67441 () List!1701)

(assert (=> d!39423 (= lt!67444 (ListLongMap!1662 lt!67441))))

(declare-fun lt!67442 () Unit!4037)

(declare-fun lt!67443 () Unit!4037)

(assert (=> d!39423 (= lt!67442 lt!67443)))

(assert (=> d!39423 (= (getValueByKey!167 lt!67441 (_1!1294 (tuple2!2567 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!172 (_2!1294 (tuple2!2567 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!39423 (= lt!67443 (lemmaContainsTupThenGetReturnValue!85 lt!67441 (_1!1294 (tuple2!2567 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1294 (tuple2!2567 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!39423 (= lt!67441 (insertStrictlySorted!88 (toList!846 call!14068) (_1!1294 (tuple2!2567 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1294 (tuple2!2567 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!39423 (= (+!160 call!14068 (tuple2!2567 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!67444)))

(declare-fun b!129890 () Bool)

(declare-fun res!62621 () Bool)

(assert (=> b!129890 (=> (not res!62621) (not e!84746))))

(assert (=> b!129890 (= res!62621 (= (getValueByKey!167 (toList!846 lt!67444) (_1!1294 (tuple2!2567 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!172 (_2!1294 (tuple2!2567 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!129891 () Bool)

(assert (=> b!129891 (= e!84746 (contains!878 (toList!846 lt!67444) (tuple2!2567 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!39423 res!62620) b!129890))

(assert (= (and b!129890 res!62621) b!129891))

(declare-fun m!152449 () Bool)

(assert (=> d!39423 m!152449))

(declare-fun m!152451 () Bool)

(assert (=> d!39423 m!152451))

(declare-fun m!152453 () Bool)

(assert (=> d!39423 m!152453))

(declare-fun m!152455 () Bool)

(assert (=> d!39423 m!152455))

(declare-fun m!152457 () Bool)

(assert (=> b!129890 m!152457))

(declare-fun m!152459 () Bool)

(assert (=> b!129891 m!152459))

(assert (=> b!129602 d!39423))

(declare-fun d!39425 () Bool)

(declare-fun res!62622 () Bool)

(declare-fun e!84747 () Bool)

(assert (=> d!39425 (=> (not res!62622) (not e!84747))))

(assert (=> d!39425 (= res!62622 (simpleValid!89 (v!3153 (underlying!442 thiss!992))))))

(assert (=> d!39425 (= (valid!521 (v!3153 (underlying!442 thiss!992))) e!84747)))

(declare-fun b!129892 () Bool)

(declare-fun res!62623 () Bool)

(assert (=> b!129892 (=> (not res!62623) (not e!84747))))

(assert (=> b!129892 (= res!62623 (= (arrayCountValidKeys!0 (_keys!4563 (v!3153 (underlying!442 thiss!992))) #b00000000000000000000000000000000 (size!2497 (_keys!4563 (v!3153 (underlying!442 thiss!992))))) (_size!588 (v!3153 (underlying!442 thiss!992)))))))

(declare-fun b!129893 () Bool)

(declare-fun res!62624 () Bool)

(assert (=> b!129893 (=> (not res!62624) (not e!84747))))

(assert (=> b!129893 (= res!62624 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4563 (v!3153 (underlying!442 thiss!992))) (mask!7100 (v!3153 (underlying!442 thiss!992)))))))

(declare-fun b!129894 () Bool)

(assert (=> b!129894 (= e!84747 (arrayNoDuplicates!0 (_keys!4563 (v!3153 (underlying!442 thiss!992))) #b00000000000000000000000000000000 Nil!1700))))

(assert (= (and d!39425 res!62622) b!129892))

(assert (= (and b!129892 res!62623) b!129893))

(assert (= (and b!129893 res!62624) b!129894))

(declare-fun m!152461 () Bool)

(assert (=> d!39425 m!152461))

(declare-fun m!152463 () Bool)

(assert (=> b!129892 m!152463))

(declare-fun m!152465 () Bool)

(assert (=> b!129893 m!152465))

(declare-fun m!152467 () Bool)

(assert (=> b!129894 m!152467))

(assert (=> d!39333 d!39425))

(declare-fun d!39427 () Bool)

(declare-fun e!84748 () Bool)

(assert (=> d!39427 e!84748))

(declare-fun res!62625 () Bool)

(assert (=> d!39427 (=> (not res!62625) (not e!84748))))

(declare-fun lt!67448 () ListLongMap!1661)

(assert (=> d!39427 (= res!62625 (contains!876 lt!67448 (_1!1294 (ite (or c!23815 c!23813) (tuple2!2567 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2682 (v!3153 (underlying!442 thiss!992)))) (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2682 (v!3153 (underlying!442 thiss!992))))))))))

(declare-fun lt!67445 () List!1701)

(assert (=> d!39427 (= lt!67448 (ListLongMap!1662 lt!67445))))

(declare-fun lt!67446 () Unit!4037)

(declare-fun lt!67447 () Unit!4037)

(assert (=> d!39427 (= lt!67446 lt!67447)))

(assert (=> d!39427 (= (getValueByKey!167 lt!67445 (_1!1294 (ite (or c!23815 c!23813) (tuple2!2567 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2682 (v!3153 (underlying!442 thiss!992)))) (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2682 (v!3153 (underlying!442 thiss!992))))))) (Some!172 (_2!1294 (ite (or c!23815 c!23813) (tuple2!2567 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2682 (v!3153 (underlying!442 thiss!992)))) (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2682 (v!3153 (underlying!442 thiss!992))))))))))

(assert (=> d!39427 (= lt!67447 (lemmaContainsTupThenGetReturnValue!85 lt!67445 (_1!1294 (ite (or c!23815 c!23813) (tuple2!2567 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2682 (v!3153 (underlying!442 thiss!992)))) (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2682 (v!3153 (underlying!442 thiss!992)))))) (_2!1294 (ite (or c!23815 c!23813) (tuple2!2567 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2682 (v!3153 (underlying!442 thiss!992)))) (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2682 (v!3153 (underlying!442 thiss!992))))))))))

(assert (=> d!39427 (= lt!67445 (insertStrictlySorted!88 (toList!846 (ite c!23815 call!14007 (ite c!23813 call!14008 call!14009))) (_1!1294 (ite (or c!23815 c!23813) (tuple2!2567 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2682 (v!3153 (underlying!442 thiss!992)))) (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2682 (v!3153 (underlying!442 thiss!992)))))) (_2!1294 (ite (or c!23815 c!23813) (tuple2!2567 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2682 (v!3153 (underlying!442 thiss!992)))) (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2682 (v!3153 (underlying!442 thiss!992))))))))))

(assert (=> d!39427 (= (+!160 (ite c!23815 call!14007 (ite c!23813 call!14008 call!14009)) (ite (or c!23815 c!23813) (tuple2!2567 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2682 (v!3153 (underlying!442 thiss!992)))) (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2682 (v!3153 (underlying!442 thiss!992)))))) lt!67448)))

(declare-fun b!129895 () Bool)

(declare-fun res!62626 () Bool)

(assert (=> b!129895 (=> (not res!62626) (not e!84748))))

(assert (=> b!129895 (= res!62626 (= (getValueByKey!167 (toList!846 lt!67448) (_1!1294 (ite (or c!23815 c!23813) (tuple2!2567 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2682 (v!3153 (underlying!442 thiss!992)))) (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2682 (v!3153 (underlying!442 thiss!992))))))) (Some!172 (_2!1294 (ite (or c!23815 c!23813) (tuple2!2567 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2682 (v!3153 (underlying!442 thiss!992)))) (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2682 (v!3153 (underlying!442 thiss!992)))))))))))

(declare-fun b!129896 () Bool)

(assert (=> b!129896 (= e!84748 (contains!878 (toList!846 lt!67448) (ite (or c!23815 c!23813) (tuple2!2567 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2682 (v!3153 (underlying!442 thiss!992)))) (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2682 (v!3153 (underlying!442 thiss!992)))))))))

(assert (= (and d!39427 res!62625) b!129895))

(assert (= (and b!129895 res!62626) b!129896))

(declare-fun m!152469 () Bool)

(assert (=> d!39427 m!152469))

(declare-fun m!152471 () Bool)

(assert (=> d!39427 m!152471))

(declare-fun m!152473 () Bool)

(assert (=> d!39427 m!152473))

(declare-fun m!152475 () Bool)

(assert (=> d!39427 m!152475))

(declare-fun m!152477 () Bool)

(assert (=> b!129895 m!152477))

(declare-fun m!152479 () Bool)

(assert (=> b!129896 m!152479))

(assert (=> bm!14006 d!39427))

(declare-fun d!39429 () Bool)

(declare-fun e!84757 () Bool)

(assert (=> d!39429 e!84757))

(declare-fun c!23935 () Bool)

(declare-fun lt!67453 () SeekEntryResult!275)

(assert (=> d!39429 (= c!23935 ((_ is MissingZero!275) lt!67453))))

(assert (=> d!39429 (= lt!67453 (seekEntryOrOpen!0 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355) (_keys!4563 newMap!16) (mask!7100 newMap!16)))))

(declare-fun lt!67454 () Unit!4037)

(declare-fun choose!799 (array!4715 array!4717 (_ BitVec 32) (_ BitVec 32) V!3457 V!3457 (_ BitVec 64) Int) Unit!4037)

(assert (=> d!39429 (= lt!67454 (choose!799 (_keys!4563 newMap!16) (_values!2806 newMap!16) (mask!7100 newMap!16) (extraKeys!2596 newMap!16) (zeroValue!2682 newMap!16) (minValue!2682 newMap!16) (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355) (defaultEntry!2823 newMap!16)))))

(assert (=> d!39429 (validMask!0 (mask!7100 newMap!16))))

(assert (=> d!39429 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!58 (_keys!4563 newMap!16) (_values!2806 newMap!16) (mask!7100 newMap!16) (extraKeys!2596 newMap!16) (zeroValue!2682 newMap!16) (minValue!2682 newMap!16) (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355) (defaultEntry!2823 newMap!16)) lt!67454)))

(declare-fun b!129913 () Bool)

(assert (=> b!129913 (and (bvsge (index!3257 lt!67453) #b00000000000000000000000000000000) (bvslt (index!3257 lt!67453) (size!2497 (_keys!4563 newMap!16))))))

(declare-fun res!62638 () Bool)

(assert (=> b!129913 (= res!62638 (= (select (arr!2230 (_keys!4563 newMap!16)) (index!3257 lt!67453)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!84759 () Bool)

(assert (=> b!129913 (=> (not res!62638) (not e!84759))))

(declare-fun call!14129 () Bool)

(declare-fun bm!14125 () Bool)

(assert (=> bm!14125 (= call!14129 (arrayContainsKey!0 (_keys!4563 newMap!16) (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun b!129914 () Bool)

(assert (=> b!129914 (= e!84757 e!84759)))

(declare-fun res!62635 () Bool)

(declare-fun call!14128 () Bool)

(assert (=> b!129914 (= res!62635 call!14128)))

(assert (=> b!129914 (=> (not res!62635) (not e!84759))))

(declare-fun b!129915 () Bool)

(declare-fun res!62636 () Bool)

(declare-fun e!84758 () Bool)

(assert (=> b!129915 (=> (not res!62636) (not e!84758))))

(assert (=> b!129915 (= res!62636 call!14128)))

(declare-fun e!84760 () Bool)

(assert (=> b!129915 (= e!84760 e!84758)))

(declare-fun b!129916 () Bool)

(assert (=> b!129916 (= e!84758 (not call!14129))))

(declare-fun b!129917 () Bool)

(declare-fun res!62637 () Bool)

(assert (=> b!129917 (=> (not res!62637) (not e!84758))))

(assert (=> b!129917 (= res!62637 (= (select (arr!2230 (_keys!4563 newMap!16)) (index!3260 lt!67453)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!129917 (and (bvsge (index!3260 lt!67453) #b00000000000000000000000000000000) (bvslt (index!3260 lt!67453) (size!2497 (_keys!4563 newMap!16))))))

(declare-fun b!129918 () Bool)

(assert (=> b!129918 (= e!84757 e!84760)))

(declare-fun c!23934 () Bool)

(assert (=> b!129918 (= c!23934 ((_ is MissingVacant!275) lt!67453))))

(declare-fun bm!14126 () Bool)

(assert (=> bm!14126 (= call!14128 (inRange!0 (ite c!23935 (index!3257 lt!67453) (index!3260 lt!67453)) (mask!7100 newMap!16)))))

(declare-fun b!129919 () Bool)

(assert (=> b!129919 (= e!84759 (not call!14129))))

(declare-fun b!129920 () Bool)

(assert (=> b!129920 (= e!84760 ((_ is Undefined!275) lt!67453))))

(assert (= (and d!39429 c!23935) b!129914))

(assert (= (and d!39429 (not c!23935)) b!129918))

(assert (= (and b!129914 res!62635) b!129913))

(assert (= (and b!129913 res!62638) b!129919))

(assert (= (and b!129918 c!23934) b!129915))

(assert (= (and b!129918 (not c!23934)) b!129920))

(assert (= (and b!129915 res!62636) b!129917))

(assert (= (and b!129917 res!62637) b!129916))

(assert (= (or b!129914 b!129915) bm!14126))

(assert (= (or b!129919 b!129916) bm!14125))

(declare-fun m!152481 () Bool)

(assert (=> b!129913 m!152481))

(assert (=> d!39429 m!151753))

(assert (=> d!39429 m!151953))

(assert (=> d!39429 m!151753))

(declare-fun m!152483 () Bool)

(assert (=> d!39429 m!152483))

(assert (=> d!39429 m!152025))

(declare-fun m!152485 () Bool)

(assert (=> b!129917 m!152485))

(declare-fun m!152487 () Bool)

(assert (=> bm!14126 m!152487))

(assert (=> bm!14125 m!151753))

(assert (=> bm!14125 m!151959))

(assert (=> bm!14069 d!39429))

(declare-fun d!39431 () Bool)

(declare-fun e!84763 () Bool)

(assert (=> d!39431 e!84763))

(declare-fun res!62644 () Bool)

(assert (=> d!39431 (=> (not res!62644) (not e!84763))))

(declare-fun lt!67460 () SeekEntryResult!275)

(assert (=> d!39431 (= res!62644 ((_ is Found!275) lt!67460))))

(assert (=> d!39431 (= lt!67460 (seekEntryOrOpen!0 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355) (_keys!4563 newMap!16) (mask!7100 newMap!16)))))

(declare-fun lt!67459 () Unit!4037)

(declare-fun choose!800 (array!4715 array!4717 (_ BitVec 32) (_ BitVec 32) V!3457 V!3457 (_ BitVec 64) Int) Unit!4037)

(assert (=> d!39431 (= lt!67459 (choose!800 (_keys!4563 newMap!16) (_values!2806 newMap!16) (mask!7100 newMap!16) (extraKeys!2596 newMap!16) (zeroValue!2682 newMap!16) (minValue!2682 newMap!16) (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355) (defaultEntry!2823 newMap!16)))))

(assert (=> d!39431 (validMask!0 (mask!7100 newMap!16))))

(assert (=> d!39431 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!58 (_keys!4563 newMap!16) (_values!2806 newMap!16) (mask!7100 newMap!16) (extraKeys!2596 newMap!16) (zeroValue!2682 newMap!16) (minValue!2682 newMap!16) (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355) (defaultEntry!2823 newMap!16)) lt!67459)))

(declare-fun b!129925 () Bool)

(declare-fun res!62643 () Bool)

(assert (=> b!129925 (=> (not res!62643) (not e!84763))))

(assert (=> b!129925 (= res!62643 (inRange!0 (index!3258 lt!67460) (mask!7100 newMap!16)))))

(declare-fun b!129926 () Bool)

(assert (=> b!129926 (= e!84763 (= (select (arr!2230 (_keys!4563 newMap!16)) (index!3258 lt!67460)) (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355)))))

(assert (=> b!129926 (and (bvsge (index!3258 lt!67460) #b00000000000000000000000000000000) (bvslt (index!3258 lt!67460) (size!2497 (_keys!4563 newMap!16))))))

(assert (= (and d!39431 res!62644) b!129925))

(assert (= (and b!129925 res!62643) b!129926))

(assert (=> d!39431 m!151753))

(assert (=> d!39431 m!151953))

(assert (=> d!39431 m!151753))

(declare-fun m!152489 () Bool)

(assert (=> d!39431 m!152489))

(assert (=> d!39431 m!152025))

(declare-fun m!152491 () Bool)

(assert (=> b!129925 m!152491))

(declare-fun m!152493 () Bool)

(assert (=> b!129926 m!152493))

(assert (=> bm!14077 d!39431))

(declare-fun bm!14129 () Bool)

(declare-fun call!14132 () Bool)

(declare-fun c!23938 () Bool)

(assert (=> bm!14129 (= call!14132 (arrayNoDuplicates!0 (_keys!4563 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!23938 (Cons!1699 (select (arr!2230 (_keys!4563 newMap!16)) #b00000000000000000000000000000000) Nil!1700) Nil!1700)))))

(declare-fun b!129937 () Bool)

(declare-fun e!84774 () Bool)

(assert (=> b!129937 (= e!84774 call!14132)))

(declare-fun b!129938 () Bool)

(declare-fun e!84775 () Bool)

(declare-fun e!84773 () Bool)

(assert (=> b!129938 (= e!84775 e!84773)))

(declare-fun res!62653 () Bool)

(assert (=> b!129938 (=> (not res!62653) (not e!84773))))

(declare-fun e!84772 () Bool)

(assert (=> b!129938 (= res!62653 (not e!84772))))

(declare-fun res!62651 () Bool)

(assert (=> b!129938 (=> (not res!62651) (not e!84772))))

(assert (=> b!129938 (= res!62651 (validKeyInArray!0 (select (arr!2230 (_keys!4563 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun d!39433 () Bool)

(declare-fun res!62652 () Bool)

(assert (=> d!39433 (=> res!62652 e!84775)))

(assert (=> d!39433 (= res!62652 (bvsge #b00000000000000000000000000000000 (size!2497 (_keys!4563 newMap!16))))))

(assert (=> d!39433 (= (arrayNoDuplicates!0 (_keys!4563 newMap!16) #b00000000000000000000000000000000 Nil!1700) e!84775)))

(declare-fun b!129939 () Bool)

(assert (=> b!129939 (= e!84774 call!14132)))

(declare-fun b!129940 () Bool)

(assert (=> b!129940 (= e!84773 e!84774)))

(assert (=> b!129940 (= c!23938 (validKeyInArray!0 (select (arr!2230 (_keys!4563 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!129941 () Bool)

(declare-fun contains!879 (List!1703 (_ BitVec 64)) Bool)

(assert (=> b!129941 (= e!84772 (contains!879 Nil!1700 (select (arr!2230 (_keys!4563 newMap!16)) #b00000000000000000000000000000000)))))

(assert (= (and d!39433 (not res!62652)) b!129938))

(assert (= (and b!129938 res!62651) b!129941))

(assert (= (and b!129938 res!62653) b!129940))

(assert (= (and b!129940 c!23938) b!129939))

(assert (= (and b!129940 (not c!23938)) b!129937))

(assert (= (or b!129939 b!129937) bm!14129))

(assert (=> bm!14129 m!152019))

(declare-fun m!152495 () Bool)

(assert (=> bm!14129 m!152495))

(assert (=> b!129938 m!152019))

(assert (=> b!129938 m!152019))

(assert (=> b!129938 m!152021))

(assert (=> b!129940 m!152019))

(assert (=> b!129940 m!152019))

(assert (=> b!129940 m!152021))

(assert (=> b!129941 m!152019))

(assert (=> b!129941 m!152019))

(declare-fun m!152497 () Bool)

(assert (=> b!129941 m!152497))

(assert (=> b!129473 d!39433))

(declare-fun d!39435 () Bool)

(assert (=> d!39435 (= (apply!113 lt!67071 #b0000000000000000000000000000000000000000000000000000000000000000) (get!1463 (getValueByKey!167 (toList!846 lt!67071) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!5374 () Bool)

(assert (= bs!5374 d!39435))

(declare-fun m!152499 () Bool)

(assert (=> bs!5374 m!152499))

(assert (=> bs!5374 m!152499))

(declare-fun m!152501 () Bool)

(assert (=> bs!5374 m!152501))

(assert (=> b!129445 d!39435))

(declare-fun d!39437 () Bool)

(declare-fun isEmpty!407 (Option!173) Bool)

(assert (=> d!39437 (= (isDefined!121 (getValueByKey!167 (toList!846 lt!66993) (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355))) (not (isEmpty!407 (getValueByKey!167 (toList!846 lt!66993) (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355)))))))

(declare-fun bs!5375 () Bool)

(assert (= bs!5375 d!39437))

(assert (=> bs!5375 m!151919))

(declare-fun m!152503 () Bool)

(assert (=> bs!5375 m!152503))

(assert (=> b!129482 d!39437))

(declare-fun e!84781 () Option!173)

(declare-fun b!129952 () Bool)

(assert (=> b!129952 (= e!84781 (getValueByKey!167 (t!6091 (toList!846 lt!66993)) (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355)))))

(declare-fun b!129950 () Bool)

(declare-fun e!84780 () Option!173)

(assert (=> b!129950 (= e!84780 (Some!172 (_2!1294 (h!2301 (toList!846 lt!66993)))))))

(declare-fun d!39439 () Bool)

(declare-fun c!23943 () Bool)

(assert (=> d!39439 (= c!23943 (and ((_ is Cons!1697) (toList!846 lt!66993)) (= (_1!1294 (h!2301 (toList!846 lt!66993))) (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355))))))

(assert (=> d!39439 (= (getValueByKey!167 (toList!846 lt!66993) (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355)) e!84780)))

(declare-fun b!129951 () Bool)

(assert (=> b!129951 (= e!84780 e!84781)))

(declare-fun c!23944 () Bool)

(assert (=> b!129951 (= c!23944 (and ((_ is Cons!1697) (toList!846 lt!66993)) (not (= (_1!1294 (h!2301 (toList!846 lt!66993))) (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355)))))))

(declare-fun b!129953 () Bool)

(assert (=> b!129953 (= e!84781 None!171)))

(assert (= (and d!39439 c!23943) b!129950))

(assert (= (and d!39439 (not c!23943)) b!129951))

(assert (= (and b!129951 c!23944) b!129952))

(assert (= (and b!129951 (not c!23944)) b!129953))

(assert (=> b!129952 m!151753))

(declare-fun m!152505 () Bool)

(assert (=> b!129952 m!152505))

(assert (=> b!129482 d!39439))

(declare-fun d!39441 () Bool)

(assert (=> d!39441 (= (apply!113 lt!67071 #b1000000000000000000000000000000000000000000000000000000000000000) (get!1463 (getValueByKey!167 (toList!846 lt!67071) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!5376 () Bool)

(assert (= bs!5376 d!39441))

(assert (=> bs!5376 m!152011))

(assert (=> bs!5376 m!152011))

(declare-fun m!152507 () Bool)

(assert (=> bs!5376 m!152507))

(assert (=> b!129462 d!39441))

(declare-fun d!39443 () Bool)

(declare-fun e!84783 () Bool)

(assert (=> d!39443 e!84783))

(declare-fun res!62654 () Bool)

(assert (=> d!39443 (=> res!62654 e!84783)))

(declare-fun lt!67463 () Bool)

(assert (=> d!39443 (= res!62654 (not lt!67463))))

(declare-fun lt!67464 () Bool)

(assert (=> d!39443 (= lt!67463 lt!67464)))

(declare-fun lt!67461 () Unit!4037)

(declare-fun e!84782 () Unit!4037)

(assert (=> d!39443 (= lt!67461 e!84782)))

(declare-fun c!23945 () Bool)

(assert (=> d!39443 (= c!23945 lt!67464)))

(assert (=> d!39443 (= lt!67464 (containsKey!171 (toList!846 lt!67071) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!39443 (= (contains!876 lt!67071 #b0000000000000000000000000000000000000000000000000000000000000000) lt!67463)))

(declare-fun b!129954 () Bool)

(declare-fun lt!67462 () Unit!4037)

(assert (=> b!129954 (= e!84782 lt!67462)))

(assert (=> b!129954 (= lt!67462 (lemmaContainsKeyImpliesGetValueByKeyDefined!120 (toList!846 lt!67071) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!129954 (isDefined!121 (getValueByKey!167 (toList!846 lt!67071) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!129955 () Bool)

(declare-fun Unit!4054 () Unit!4037)

(assert (=> b!129955 (= e!84782 Unit!4054)))

(declare-fun b!129956 () Bool)

(assert (=> b!129956 (= e!84783 (isDefined!121 (getValueByKey!167 (toList!846 lt!67071) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!39443 c!23945) b!129954))

(assert (= (and d!39443 (not c!23945)) b!129955))

(assert (= (and d!39443 (not res!62654)) b!129956))

(declare-fun m!152509 () Bool)

(assert (=> d!39443 m!152509))

(declare-fun m!152511 () Bool)

(assert (=> b!129954 m!152511))

(assert (=> b!129954 m!152499))

(assert (=> b!129954 m!152499))

(declare-fun m!152513 () Bool)

(assert (=> b!129954 m!152513))

(assert (=> b!129956 m!152499))

(assert (=> b!129956 m!152499))

(assert (=> b!129956 m!152513))

(assert (=> bm!14005 d!39443))

(declare-fun d!39445 () Bool)

(declare-fun e!84785 () Bool)

(assert (=> d!39445 e!84785))

(declare-fun res!62655 () Bool)

(assert (=> d!39445 (=> res!62655 e!84785)))

(declare-fun lt!67467 () Bool)

(assert (=> d!39445 (= res!62655 (not lt!67467))))

(declare-fun lt!67468 () Bool)

(assert (=> d!39445 (= lt!67467 lt!67468)))

(declare-fun lt!67465 () Unit!4037)

(declare-fun e!84784 () Unit!4037)

(assert (=> d!39445 (= lt!67465 e!84784)))

(declare-fun c!23946 () Bool)

(assert (=> d!39445 (= c!23946 lt!67468)))

(assert (=> d!39445 (= lt!67468 (containsKey!171 (toList!846 lt!67071) (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> d!39445 (= (contains!876 lt!67071 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) lt!67467)))

(declare-fun b!129957 () Bool)

(declare-fun lt!67466 () Unit!4037)

(assert (=> b!129957 (= e!84784 lt!67466)))

(assert (=> b!129957 (= lt!67466 (lemmaContainsKeyImpliesGetValueByKeyDefined!120 (toList!846 lt!67071) (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!129957 (isDefined!121 (getValueByKey!167 (toList!846 lt!67071) (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!129958 () Bool)

(declare-fun Unit!4055 () Unit!4037)

(assert (=> b!129958 (= e!84784 Unit!4055)))

(declare-fun b!129959 () Bool)

(assert (=> b!129959 (= e!84785 (isDefined!121 (getValueByKey!167 (toList!846 lt!67071) (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(assert (= (and d!39445 c!23946) b!129957))

(assert (= (and d!39445 (not c!23946)) b!129958))

(assert (= (and d!39445 (not res!62655)) b!129959))

(assert (=> d!39445 m!151855))

(declare-fun m!152515 () Bool)

(assert (=> d!39445 m!152515))

(assert (=> b!129957 m!151855))

(declare-fun m!152517 () Bool)

(assert (=> b!129957 m!152517))

(assert (=> b!129957 m!151855))

(assert (=> b!129957 m!152075))

(assert (=> b!129957 m!152075))

(declare-fun m!152519 () Bool)

(assert (=> b!129957 m!152519))

(assert (=> b!129959 m!151855))

(assert (=> b!129959 m!152075))

(assert (=> b!129959 m!152075))

(assert (=> b!129959 m!152519))

(assert (=> b!129447 d!39445))

(assert (=> b!129603 d!39339))

(declare-fun d!39447 () Bool)

(assert (=> d!39447 (isDefined!121 (getValueByKey!167 (toList!846 lt!66993) (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355)))))

(declare-fun lt!67471 () Unit!4037)

(declare-fun choose!801 (List!1701 (_ BitVec 64)) Unit!4037)

(assert (=> d!39447 (= lt!67471 (choose!801 (toList!846 lt!66993) (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355)))))

(declare-fun e!84788 () Bool)

(assert (=> d!39447 e!84788))

(declare-fun res!62658 () Bool)

(assert (=> d!39447 (=> (not res!62658) (not e!84788))))

(declare-fun isStrictlySorted!314 (List!1701) Bool)

(assert (=> d!39447 (= res!62658 (isStrictlySorted!314 (toList!846 lt!66993)))))

(assert (=> d!39447 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!120 (toList!846 lt!66993) (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355)) lt!67471)))

(declare-fun b!129962 () Bool)

(assert (=> b!129962 (= e!84788 (containsKey!171 (toList!846 lt!66993) (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355)))))

(assert (= (and d!39447 res!62658) b!129962))

(assert (=> d!39447 m!151753))

(assert (=> d!39447 m!151919))

(assert (=> d!39447 m!151919))

(assert (=> d!39447 m!151921))

(assert (=> d!39447 m!151753))

(declare-fun m!152521 () Bool)

(assert (=> d!39447 m!152521))

(declare-fun m!152523 () Bool)

(assert (=> d!39447 m!152523))

(assert (=> b!129962 m!151753))

(assert (=> b!129962 m!151915))

(assert (=> b!129480 d!39447))

(assert (=> b!129480 d!39437))

(assert (=> b!129480 d!39439))

(declare-fun condMapEmpty!4581 () Bool)

(declare-fun mapDefault!4581 () ValueCell!1085)

(assert (=> mapNonEmpty!4579 (= condMapEmpty!4581 (= mapRest!4579 ((as const (Array (_ BitVec 32) ValueCell!1085)) mapDefault!4581)))))

(declare-fun e!84790 () Bool)

(declare-fun mapRes!4581 () Bool)

(assert (=> mapNonEmpty!4579 (= tp!11095 (and e!84790 mapRes!4581))))

(declare-fun mapNonEmpty!4581 () Bool)

(declare-fun tp!11097 () Bool)

(declare-fun e!84789 () Bool)

(assert (=> mapNonEmpty!4581 (= mapRes!4581 (and tp!11097 e!84789))))

(declare-fun mapValue!4581 () ValueCell!1085)

(declare-fun mapKey!4581 () (_ BitVec 32))

(declare-fun mapRest!4581 () (Array (_ BitVec 32) ValueCell!1085))

(assert (=> mapNonEmpty!4581 (= mapRest!4579 (store mapRest!4581 mapKey!4581 mapValue!4581))))

(declare-fun mapIsEmpty!4581 () Bool)

(assert (=> mapIsEmpty!4581 mapRes!4581))

(declare-fun b!129964 () Bool)

(assert (=> b!129964 (= e!84790 tp_is_empty!2857)))

(declare-fun b!129963 () Bool)

(assert (=> b!129963 (= e!84789 tp_is_empty!2857)))

(assert (= (and mapNonEmpty!4579 condMapEmpty!4581) mapIsEmpty!4581))

(assert (= (and mapNonEmpty!4579 (not condMapEmpty!4581)) mapNonEmpty!4581))

(assert (= (and mapNonEmpty!4581 ((_ is ValueCellFull!1085) mapValue!4581)) b!129963))

(assert (= (and mapNonEmpty!4579 ((_ is ValueCellFull!1085) mapDefault!4581)) b!129964))

(declare-fun m!152525 () Bool)

(assert (=> mapNonEmpty!4581 m!152525))

(declare-fun condMapEmpty!4582 () Bool)

(declare-fun mapDefault!4582 () ValueCell!1085)

(assert (=> mapNonEmpty!4580 (= condMapEmpty!4582 (= mapRest!4580 ((as const (Array (_ BitVec 32) ValueCell!1085)) mapDefault!4582)))))

(declare-fun e!84792 () Bool)

(declare-fun mapRes!4582 () Bool)

(assert (=> mapNonEmpty!4580 (= tp!11096 (and e!84792 mapRes!4582))))

(declare-fun mapNonEmpty!4582 () Bool)

(declare-fun tp!11098 () Bool)

(declare-fun e!84791 () Bool)

(assert (=> mapNonEmpty!4582 (= mapRes!4582 (and tp!11098 e!84791))))

(declare-fun mapValue!4582 () ValueCell!1085)

(declare-fun mapRest!4582 () (Array (_ BitVec 32) ValueCell!1085))

(declare-fun mapKey!4582 () (_ BitVec 32))

(assert (=> mapNonEmpty!4582 (= mapRest!4580 (store mapRest!4582 mapKey!4582 mapValue!4582))))

(declare-fun mapIsEmpty!4582 () Bool)

(assert (=> mapIsEmpty!4582 mapRes!4582))

(declare-fun b!129966 () Bool)

(assert (=> b!129966 (= e!84792 tp_is_empty!2857)))

(declare-fun b!129965 () Bool)

(assert (=> b!129965 (= e!84791 tp_is_empty!2857)))

(assert (= (and mapNonEmpty!4580 condMapEmpty!4582) mapIsEmpty!4582))

(assert (= (and mapNonEmpty!4580 (not condMapEmpty!4582)) mapNonEmpty!4582))

(assert (= (and mapNonEmpty!4582 ((_ is ValueCellFull!1085) mapValue!4582)) b!129965))

(assert (= (and mapNonEmpty!4580 ((_ is ValueCellFull!1085) mapDefault!4582)) b!129966))

(declare-fun m!152527 () Bool)

(assert (=> mapNonEmpty!4582 m!152527))

(declare-fun b_lambda!5753 () Bool)

(assert (= b_lambda!5747 (or (and b!129281 b_free!2881 (= (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) (defaultEntry!2823 newMap!16))) (and b!129277 b_free!2883) b_lambda!5753)))

(declare-fun b_lambda!5755 () Bool)

(assert (= b_lambda!5749 (or (and b!129281 b_free!2881 (= (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) (defaultEntry!2823 newMap!16))) (and b!129277 b_free!2883) b_lambda!5755)))

(declare-fun b_lambda!5757 () Bool)

(assert (= b_lambda!5745 (or (and b!129281 b_free!2881) (and b!129277 b_free!2883 (= (defaultEntry!2823 newMap!16) (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))))) b_lambda!5757)))

(declare-fun b_lambda!5759 () Bool)

(assert (= b_lambda!5743 (or (and b!129281 b_free!2881) (and b!129277 b_free!2883 (= (defaultEntry!2823 newMap!16) (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))))) b_lambda!5759)))

(declare-fun b_lambda!5761 () Bool)

(assert (= b_lambda!5751 (or (and b!129281 b_free!2881 (= (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) (defaultEntry!2823 newMap!16))) (and b!129277 b_free!2883) b_lambda!5761)))

(check-sat (not d!39337) (not b!129840) (not b_lambda!5753) (not d!39351) (not d!39441) (not b!129682) (not d!39403) (not d!39393) (not b!129890) (not d!39399) (not b!129836) (not bm!14088) (not b!129667) (not b!129749) (not b!129748) (not b!129672) (not b!129745) (not b!129677) (not d!39375) (not d!39339) (not b!129925) (not b!129893) (not b!129791) (not d!39353) (not d!39413) (not d!39389) (not b!129685) (not bm!14110) (not bm!14126) (not bm!14129) (not b!129894) (not b!129789) (not d!39359) (not b!129661) (not d!39369) (not b!129833) (not b!129654) (not b!129956) (not b!129691) (not b!129727) (not b!129952) (not bm!14087) (not d!39371) (not b!129742) (not b!129962) (not b!129724) (not d!39445) (not b!129837) (not bm!14113) (not b!129809) (not b!129831) (not bm!14084) (not bm!14104) (not b!129737) (not b!129842) (not d!39387) (not b!129841) (not b!129726) (not bm!14109) (not bm!14094) (not b!129957) (not b!129717) (not b_lambda!5761) (not bm!14091) (not b_lambda!5737) (not d!39377) (not b!129752) (not d!39429) (not b!129714) (not d!39365) (not b!129663) (not b!129665) (not b_next!2883) (not b!129799) (not bm!14114) (not d!39423) (not d!39345) (not b!129650) (not b_lambda!5741) b_and!8021 (not d!39391) (not d!39417) (not d!39395) (not b!129657) (not b!129895) (not b!129896) (not b!129660) (not b!129819) (not b!129720) (not bm!14125) (not d!39411) (not b!129813) (not b!129820) (not bm!14120) (not d!39397) (not b!129678) (not d!39435) (not d!39379) (not d!39385) (not d!39367) (not b!129941) (not b!129881) (not b!129892) (not b!129889) (not b!129655) (not bm!14117) (not b!129733) (not d!39383) b_and!8023 (not d!39363) (not b!129954) (not d!39357) (not b!129686) (not b!129698) (not b!129940) (not b_lambda!5757) (not b!129855) (not b!129959) (not b!129753) (not b!129649) (not b!129814) tp_is_empty!2857 (not b!129692) (not bm!14105) (not b!129843) (not bm!14107) (not d!39349) (not b_next!2881) (not d!39381) (not d!39443) (not b!129792) (not b!129740) (not b!129834) (not d!39405) (not d!39425) (not d!39335) (not b!129802) (not bm!14081) (not b!129811) (not bm!14083) (not b!129859) (not b!129754) (not b!129658) (not b!129793) (not b!129671) (not b_lambda!5755) (not b!129732) (not b!129835) (not mapNonEmpty!4582) (not b!129824) (not b!129856) (not d!39447) (not b!129722) (not d!39407) (not b!129938) (not mapNonEmpty!4581) (not b!129891) (not b!129751) (not d!39437) (not b!129653) (not b_lambda!5759) (not b!129869) (not d!39431) (not bm!14090) (not b!129882) (not bm!14095) (not d!39401) (not b!129669) (not b!129807) (not b!129857) (not b!129718) (not d!39341) (not d!39427))
(check-sat b_and!8021 b_and!8023 (not b_next!2881) (not b_next!2883))
(get-model)

(declare-fun d!39449 () Bool)

(assert (=> d!39449 (= (+!160 (getCurrentListMap!515 (_keys!4563 newMap!16) (_values!2806 newMap!16) (mask!7100 newMap!16) (extraKeys!2596 newMap!16) (zeroValue!2682 newMap!16) (minValue!2682 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2823 newMap!16)) (tuple2!2567 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (getCurrentListMap!515 (_keys!4563 newMap!16) (array!4718 (store (arr!2231 (_values!2806 newMap!16)) (index!3258 lt!67161) (ValueCellFull!1085 (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2498 (_values!2806 newMap!16))) (mask!7100 newMap!16) (extraKeys!2596 newMap!16) (zeroValue!2682 newMap!16) (minValue!2682 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2823 newMap!16)))))

(assert (=> d!39449 true))

(declare-fun _$5!131 () Unit!4037)

(assert (=> d!39449 (= (choose!795 (_keys!4563 newMap!16) (_values!2806 newMap!16) (mask!7100 newMap!16) (extraKeys!2596 newMap!16) (zeroValue!2682 newMap!16) (minValue!2682 newMap!16) (index!3258 lt!67161) (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2823 newMap!16)) _$5!131)))

(declare-fun bs!5377 () Bool)

(assert (= bs!5377 d!39449))

(assert (=> bs!5377 m!151849))

(assert (=> bs!5377 m!151849))

(assert (=> bs!5377 m!152197))

(assert (=> bs!5377 m!151929))

(assert (=> bs!5377 m!152199))

(assert (=> d!39365 d!39449))

(declare-fun d!39451 () Bool)

(assert (=> d!39451 (= (validMask!0 (mask!7100 newMap!16)) (and (or (= (mask!7100 newMap!16) #b00000000000000000000000000000111) (= (mask!7100 newMap!16) #b00000000000000000000000000001111) (= (mask!7100 newMap!16) #b00000000000000000000000000011111) (= (mask!7100 newMap!16) #b00000000000000000000000000111111) (= (mask!7100 newMap!16) #b00000000000000000000000001111111) (= (mask!7100 newMap!16) #b00000000000000000000000011111111) (= (mask!7100 newMap!16) #b00000000000000000000000111111111) (= (mask!7100 newMap!16) #b00000000000000000000001111111111) (= (mask!7100 newMap!16) #b00000000000000000000011111111111) (= (mask!7100 newMap!16) #b00000000000000000000111111111111) (= (mask!7100 newMap!16) #b00000000000000000001111111111111) (= (mask!7100 newMap!16) #b00000000000000000011111111111111) (= (mask!7100 newMap!16) #b00000000000000000111111111111111) (= (mask!7100 newMap!16) #b00000000000000001111111111111111) (= (mask!7100 newMap!16) #b00000000000000011111111111111111) (= (mask!7100 newMap!16) #b00000000000000111111111111111111) (= (mask!7100 newMap!16) #b00000000000001111111111111111111) (= (mask!7100 newMap!16) #b00000000000011111111111111111111) (= (mask!7100 newMap!16) #b00000000000111111111111111111111) (= (mask!7100 newMap!16) #b00000000001111111111111111111111) (= (mask!7100 newMap!16) #b00000000011111111111111111111111) (= (mask!7100 newMap!16) #b00000000111111111111111111111111) (= (mask!7100 newMap!16) #b00000001111111111111111111111111) (= (mask!7100 newMap!16) #b00000011111111111111111111111111) (= (mask!7100 newMap!16) #b00000111111111111111111111111111) (= (mask!7100 newMap!16) #b00001111111111111111111111111111) (= (mask!7100 newMap!16) #b00011111111111111111111111111111) (= (mask!7100 newMap!16) #b00111111111111111111111111111111)) (bvsle (mask!7100 newMap!16) #b00111111111111111111111111111111)))))

(assert (=> d!39365 d!39451))

(declare-fun b!129967 () Bool)

(declare-fun e!84794 () Bool)

(declare-fun e!84799 () Bool)

(assert (=> b!129967 (= e!84794 e!84799)))

(assert (=> b!129967 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2497 (_keys!4563 newMap!16))))))

(declare-fun res!62659 () Bool)

(declare-fun lt!67472 () ListLongMap!1661)

(assert (=> b!129967 (= res!62659 (contains!876 lt!67472 (select (arr!2230 (_keys!4563 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!129967 (=> (not res!62659) (not e!84799))))

(declare-fun bm!14130 () Bool)

(declare-fun call!14133 () ListLongMap!1661)

(assert (=> bm!14130 (= call!14133 (getCurrentListMapNoExtraKeys!125 (_keys!4563 newMap!16) (_values!2806 newMap!16) (mask!7100 newMap!16) (extraKeys!2596 newMap!16) (zeroValue!2682 newMap!16) (minValue!2682 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!2823 newMap!16)))))

(declare-fun b!129968 () Bool)

(declare-fun e!84793 () ListLongMap!1661)

(declare-fun e!84796 () ListLongMap!1661)

(assert (=> b!129968 (= e!84793 e!84796)))

(declare-fun c!23947 () Bool)

(assert (=> b!129968 (= c!23947 (validKeyInArray!0 (select (arr!2230 (_keys!4563 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!129969 () Bool)

(assert (=> b!129969 (= e!84796 call!14133)))

(declare-fun d!39453 () Bool)

(declare-fun e!84797 () Bool)

(assert (=> d!39453 e!84797))

(declare-fun res!62662 () Bool)

(assert (=> d!39453 (=> (not res!62662) (not e!84797))))

(assert (=> d!39453 (= res!62662 (not (contains!876 lt!67472 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!39453 (= lt!67472 e!84793)))

(declare-fun c!23948 () Bool)

(assert (=> d!39453 (= c!23948 (bvsge #b00000000000000000000000000000000 (size!2497 (_keys!4563 newMap!16))))))

(assert (=> d!39453 (validMask!0 (mask!7100 newMap!16))))

(assert (=> d!39453 (= (getCurrentListMapNoExtraKeys!125 (_keys!4563 newMap!16) (_values!2806 newMap!16) (mask!7100 newMap!16) (extraKeys!2596 newMap!16) (zeroValue!2682 newMap!16) (minValue!2682 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2823 newMap!16)) lt!67472)))

(declare-fun b!129970 () Bool)

(declare-fun e!84798 () Bool)

(assert (=> b!129970 (= e!84794 e!84798)))

(declare-fun c!23950 () Bool)

(assert (=> b!129970 (= c!23950 (bvslt #b00000000000000000000000000000000 (size!2497 (_keys!4563 newMap!16))))))

(declare-fun b!129971 () Bool)

(assert (=> b!129971 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2497 (_keys!4563 newMap!16))))))

(assert (=> b!129971 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2498 (_values!2806 newMap!16))))))

(assert (=> b!129971 (= e!84799 (= (apply!113 lt!67472 (select (arr!2230 (_keys!4563 newMap!16)) #b00000000000000000000000000000000)) (get!1459 (select (arr!2231 (_values!2806 newMap!16)) #b00000000000000000000000000000000) (dynLambda!414 (defaultEntry!2823 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!129972 () Bool)

(assert (=> b!129972 (= e!84798 (= lt!67472 (getCurrentListMapNoExtraKeys!125 (_keys!4563 newMap!16) (_values!2806 newMap!16) (mask!7100 newMap!16) (extraKeys!2596 newMap!16) (zeroValue!2682 newMap!16) (minValue!2682 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!2823 newMap!16))))))

(declare-fun b!129973 () Bool)

(declare-fun lt!67473 () Unit!4037)

(declare-fun lt!67476 () Unit!4037)

(assert (=> b!129973 (= lt!67473 lt!67476)))

(declare-fun lt!67478 () ListLongMap!1661)

(declare-fun lt!67477 () (_ BitVec 64))

(declare-fun lt!67474 () V!3457)

(declare-fun lt!67475 () (_ BitVec 64))

(assert (=> b!129973 (not (contains!876 (+!160 lt!67478 (tuple2!2567 lt!67477 lt!67474)) lt!67475))))

(assert (=> b!129973 (= lt!67476 (addStillNotContains!59 lt!67478 lt!67477 lt!67474 lt!67475))))

(assert (=> b!129973 (= lt!67475 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!129973 (= lt!67474 (get!1459 (select (arr!2231 (_values!2806 newMap!16)) #b00000000000000000000000000000000) (dynLambda!414 (defaultEntry!2823 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!129973 (= lt!67477 (select (arr!2230 (_keys!4563 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!129973 (= lt!67478 call!14133)))

(assert (=> b!129973 (= e!84796 (+!160 call!14133 (tuple2!2567 (select (arr!2230 (_keys!4563 newMap!16)) #b00000000000000000000000000000000) (get!1459 (select (arr!2231 (_values!2806 newMap!16)) #b00000000000000000000000000000000) (dynLambda!414 (defaultEntry!2823 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!129974 () Bool)

(assert (=> b!129974 (= e!84793 (ListLongMap!1662 Nil!1698))))

(declare-fun b!129975 () Bool)

(assert (=> b!129975 (= e!84798 (isEmpty!406 lt!67472))))

(declare-fun b!129976 () Bool)

(declare-fun res!62660 () Bool)

(assert (=> b!129976 (=> (not res!62660) (not e!84797))))

(assert (=> b!129976 (= res!62660 (not (contains!876 lt!67472 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!129977 () Bool)

(assert (=> b!129977 (= e!84797 e!84794)))

(declare-fun c!23949 () Bool)

(declare-fun e!84795 () Bool)

(assert (=> b!129977 (= c!23949 e!84795)))

(declare-fun res!62661 () Bool)

(assert (=> b!129977 (=> (not res!62661) (not e!84795))))

(assert (=> b!129977 (= res!62661 (bvslt #b00000000000000000000000000000000 (size!2497 (_keys!4563 newMap!16))))))

(declare-fun b!129978 () Bool)

(assert (=> b!129978 (= e!84795 (validKeyInArray!0 (select (arr!2230 (_keys!4563 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!129978 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (= (and d!39453 c!23948) b!129974))

(assert (= (and d!39453 (not c!23948)) b!129968))

(assert (= (and b!129968 c!23947) b!129973))

(assert (= (and b!129968 (not c!23947)) b!129969))

(assert (= (or b!129973 b!129969) bm!14130))

(assert (= (and d!39453 res!62662) b!129976))

(assert (= (and b!129976 res!62660) b!129977))

(assert (= (and b!129977 res!62661) b!129978))

(assert (= (and b!129977 c!23949) b!129967))

(assert (= (and b!129977 (not c!23949)) b!129970))

(assert (= (and b!129967 res!62659) b!129971))

(assert (= (and b!129970 c!23950) b!129972))

(assert (= (and b!129970 (not c!23950)) b!129975))

(declare-fun b_lambda!5763 () Bool)

(assert (=> (not b_lambda!5763) (not b!129971)))

(assert (=> b!129971 t!6103))

(declare-fun b_and!8025 () Bool)

(assert (= b_and!8021 (and (=> t!6103 result!3917) b_and!8025)))

(assert (=> b!129971 t!6105))

(declare-fun b_and!8027 () Bool)

(assert (= b_and!8023 (and (=> t!6105 result!3919) b_and!8027)))

(declare-fun b_lambda!5765 () Bool)

(assert (=> (not b_lambda!5765) (not b!129973)))

(assert (=> b!129973 t!6103))

(declare-fun b_and!8029 () Bool)

(assert (= b_and!8025 (and (=> t!6103 result!3917) b_and!8029)))

(assert (=> b!129973 t!6105))

(declare-fun b_and!8031 () Bool)

(assert (= b_and!8027 (and (=> t!6105 result!3919) b_and!8031)))

(declare-fun m!152529 () Bool)

(assert (=> b!129976 m!152529))

(assert (=> b!129978 m!152019))

(assert (=> b!129978 m!152019))

(assert (=> b!129978 m!152021))

(declare-fun m!152531 () Bool)

(assert (=> b!129972 m!152531))

(declare-fun m!152533 () Bool)

(assert (=> b!129973 m!152533))

(declare-fun m!152535 () Bool)

(assert (=> b!129973 m!152535))

(assert (=> b!129973 m!152067))

(declare-fun m!152537 () Bool)

(assert (=> b!129973 m!152537))

(assert (=> b!129973 m!152067))

(assert (=> b!129973 m!152071))

(assert (=> b!129973 m!152073))

(assert (=> b!129973 m!152019))

(assert (=> b!129973 m!152071))

(assert (=> b!129973 m!152535))

(declare-fun m!152539 () Bool)

(assert (=> b!129973 m!152539))

(declare-fun m!152541 () Bool)

(assert (=> d!39453 m!152541))

(assert (=> d!39453 m!152025))

(assert (=> b!129967 m!152019))

(assert (=> b!129967 m!152019))

(declare-fun m!152543 () Bool)

(assert (=> b!129967 m!152543))

(assert (=> b!129968 m!152019))

(assert (=> b!129968 m!152019))

(assert (=> b!129968 m!152021))

(assert (=> bm!14130 m!152531))

(assert (=> b!129971 m!152019))

(declare-fun m!152545 () Bool)

(assert (=> b!129971 m!152545))

(assert (=> b!129971 m!152067))

(assert (=> b!129971 m!152067))

(assert (=> b!129971 m!152071))

(assert (=> b!129971 m!152073))

(assert (=> b!129971 m!152019))

(assert (=> b!129971 m!152071))

(declare-fun m!152547 () Bool)

(assert (=> b!129975 m!152547))

(assert (=> bm!14083 d!39453))

(declare-fun d!39455 () Bool)

(assert (=> d!39455 (isDefined!121 (getValueByKey!167 (toList!846 (getCurrentListMap!515 (_keys!4563 newMap!16) (_values!2806 newMap!16) (mask!7100 newMap!16) (extraKeys!2596 newMap!16) (zeroValue!2682 newMap!16) (minValue!2682 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2823 newMap!16))) (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355)))))

(declare-fun lt!67479 () Unit!4037)

(assert (=> d!39455 (= lt!67479 (choose!801 (toList!846 (getCurrentListMap!515 (_keys!4563 newMap!16) (_values!2806 newMap!16) (mask!7100 newMap!16) (extraKeys!2596 newMap!16) (zeroValue!2682 newMap!16) (minValue!2682 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2823 newMap!16))) (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355)))))

(declare-fun e!84800 () Bool)

(assert (=> d!39455 e!84800))

(declare-fun res!62663 () Bool)

(assert (=> d!39455 (=> (not res!62663) (not e!84800))))

(assert (=> d!39455 (= res!62663 (isStrictlySorted!314 (toList!846 (getCurrentListMap!515 (_keys!4563 newMap!16) (_values!2806 newMap!16) (mask!7100 newMap!16) (extraKeys!2596 newMap!16) (zeroValue!2682 newMap!16) (minValue!2682 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2823 newMap!16)))))))

(assert (=> d!39455 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!120 (toList!846 (getCurrentListMap!515 (_keys!4563 newMap!16) (_values!2806 newMap!16) (mask!7100 newMap!16) (extraKeys!2596 newMap!16) (zeroValue!2682 newMap!16) (minValue!2682 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2823 newMap!16))) (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355)) lt!67479)))

(declare-fun b!129979 () Bool)

(assert (=> b!129979 (= e!84800 (containsKey!171 (toList!846 (getCurrentListMap!515 (_keys!4563 newMap!16) (_values!2806 newMap!16) (mask!7100 newMap!16) (extraKeys!2596 newMap!16) (zeroValue!2682 newMap!16) (minValue!2682 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2823 newMap!16))) (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355)))))

(assert (= (and d!39455 res!62663) b!129979))

(assert (=> d!39455 m!151753))

(assert (=> d!39455 m!152205))

(assert (=> d!39455 m!152205))

(assert (=> d!39455 m!152207))

(assert (=> d!39455 m!151753))

(declare-fun m!152549 () Bool)

(assert (=> d!39455 m!152549))

(declare-fun m!152551 () Bool)

(assert (=> d!39455 m!152551))

(assert (=> b!129979 m!151753))

(assert (=> b!129979 m!152201))

(assert (=> b!129749 d!39455))

(declare-fun d!39457 () Bool)

(assert (=> d!39457 (= (isDefined!121 (getValueByKey!167 (toList!846 (getCurrentListMap!515 (_keys!4563 newMap!16) (_values!2806 newMap!16) (mask!7100 newMap!16) (extraKeys!2596 newMap!16) (zeroValue!2682 newMap!16) (minValue!2682 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2823 newMap!16))) (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355))) (not (isEmpty!407 (getValueByKey!167 (toList!846 (getCurrentListMap!515 (_keys!4563 newMap!16) (_values!2806 newMap!16) (mask!7100 newMap!16) (extraKeys!2596 newMap!16) (zeroValue!2682 newMap!16) (minValue!2682 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2823 newMap!16))) (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355)))))))

(declare-fun bs!5378 () Bool)

(assert (= bs!5378 d!39457))

(assert (=> bs!5378 m!152205))

(declare-fun m!152553 () Bool)

(assert (=> bs!5378 m!152553))

(assert (=> b!129749 d!39457))

(declare-fun b!129982 () Bool)

(declare-fun e!84802 () Option!173)

(assert (=> b!129982 (= e!84802 (getValueByKey!167 (t!6091 (toList!846 (getCurrentListMap!515 (_keys!4563 newMap!16) (_values!2806 newMap!16) (mask!7100 newMap!16) (extraKeys!2596 newMap!16) (zeroValue!2682 newMap!16) (minValue!2682 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2823 newMap!16)))) (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355)))))

(declare-fun b!129980 () Bool)

(declare-fun e!84801 () Option!173)

(assert (=> b!129980 (= e!84801 (Some!172 (_2!1294 (h!2301 (toList!846 (getCurrentListMap!515 (_keys!4563 newMap!16) (_values!2806 newMap!16) (mask!7100 newMap!16) (extraKeys!2596 newMap!16) (zeroValue!2682 newMap!16) (minValue!2682 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2823 newMap!16)))))))))

(declare-fun c!23951 () Bool)

(declare-fun d!39459 () Bool)

(assert (=> d!39459 (= c!23951 (and ((_ is Cons!1697) (toList!846 (getCurrentListMap!515 (_keys!4563 newMap!16) (_values!2806 newMap!16) (mask!7100 newMap!16) (extraKeys!2596 newMap!16) (zeroValue!2682 newMap!16) (minValue!2682 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2823 newMap!16)))) (= (_1!1294 (h!2301 (toList!846 (getCurrentListMap!515 (_keys!4563 newMap!16) (_values!2806 newMap!16) (mask!7100 newMap!16) (extraKeys!2596 newMap!16) (zeroValue!2682 newMap!16) (minValue!2682 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2823 newMap!16))))) (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355))))))

(assert (=> d!39459 (= (getValueByKey!167 (toList!846 (getCurrentListMap!515 (_keys!4563 newMap!16) (_values!2806 newMap!16) (mask!7100 newMap!16) (extraKeys!2596 newMap!16) (zeroValue!2682 newMap!16) (minValue!2682 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2823 newMap!16))) (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355)) e!84801)))

(declare-fun b!129981 () Bool)

(assert (=> b!129981 (= e!84801 e!84802)))

(declare-fun c!23952 () Bool)

(assert (=> b!129981 (= c!23952 (and ((_ is Cons!1697) (toList!846 (getCurrentListMap!515 (_keys!4563 newMap!16) (_values!2806 newMap!16) (mask!7100 newMap!16) (extraKeys!2596 newMap!16) (zeroValue!2682 newMap!16) (minValue!2682 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2823 newMap!16)))) (not (= (_1!1294 (h!2301 (toList!846 (getCurrentListMap!515 (_keys!4563 newMap!16) (_values!2806 newMap!16) (mask!7100 newMap!16) (extraKeys!2596 newMap!16) (zeroValue!2682 newMap!16) (minValue!2682 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2823 newMap!16))))) (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355)))))))

(declare-fun b!129983 () Bool)

(assert (=> b!129983 (= e!84802 None!171)))

(assert (= (and d!39459 c!23951) b!129980))

(assert (= (and d!39459 (not c!23951)) b!129981))

(assert (= (and b!129981 c!23952) b!129982))

(assert (= (and b!129981 (not c!23952)) b!129983))

(assert (=> b!129982 m!151753))

(declare-fun m!152555 () Bool)

(assert (=> b!129982 m!152555))

(assert (=> b!129749 d!39459))

(assert (=> b!129962 d!39347))

(declare-fun d!39461 () Bool)

(declare-fun e!84803 () Bool)

(assert (=> d!39461 e!84803))

(declare-fun res!62664 () Bool)

(assert (=> d!39461 (=> (not res!62664) (not e!84803))))

(declare-fun lt!67483 () ListLongMap!1661)

(assert (=> d!39461 (= res!62664 (contains!876 lt!67483 (_1!1294 (tuple2!2567 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!67480 () List!1701)

(assert (=> d!39461 (= lt!67483 (ListLongMap!1662 lt!67480))))

(declare-fun lt!67481 () Unit!4037)

(declare-fun lt!67482 () Unit!4037)

(assert (=> d!39461 (= lt!67481 lt!67482)))

(assert (=> d!39461 (= (getValueByKey!167 lt!67480 (_1!1294 (tuple2!2567 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!172 (_2!1294 (tuple2!2567 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!39461 (= lt!67482 (lemmaContainsTupThenGetReturnValue!85 lt!67480 (_1!1294 (tuple2!2567 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1294 (tuple2!2567 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!39461 (= lt!67480 (insertStrictlySorted!88 (toList!846 (getCurrentListMap!515 (_keys!4563 newMap!16) (_values!2806 newMap!16) (mask!7100 newMap!16) (extraKeys!2596 newMap!16) (zeroValue!2682 newMap!16) (minValue!2682 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2823 newMap!16))) (_1!1294 (tuple2!2567 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1294 (tuple2!2567 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!39461 (= (+!160 (getCurrentListMap!515 (_keys!4563 newMap!16) (_values!2806 newMap!16) (mask!7100 newMap!16) (extraKeys!2596 newMap!16) (zeroValue!2682 newMap!16) (minValue!2682 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2823 newMap!16)) (tuple2!2567 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!67483)))

(declare-fun b!129984 () Bool)

(declare-fun res!62665 () Bool)

(assert (=> b!129984 (=> (not res!62665) (not e!84803))))

(assert (=> b!129984 (= res!62665 (= (getValueByKey!167 (toList!846 lt!67483) (_1!1294 (tuple2!2567 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!172 (_2!1294 (tuple2!2567 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!129985 () Bool)

(assert (=> b!129985 (= e!84803 (contains!878 (toList!846 lt!67483) (tuple2!2567 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!39461 res!62664) b!129984))

(assert (= (and b!129984 res!62665) b!129985))

(declare-fun m!152557 () Bool)

(assert (=> d!39461 m!152557))

(declare-fun m!152559 () Bool)

(assert (=> d!39461 m!152559))

(declare-fun m!152561 () Bool)

(assert (=> d!39461 m!152561))

(declare-fun m!152563 () Bool)

(assert (=> d!39461 m!152563))

(declare-fun m!152565 () Bool)

(assert (=> b!129984 m!152565))

(declare-fun m!152567 () Bool)

(assert (=> b!129985 m!152567))

(assert (=> b!129748 d!39461))

(assert (=> b!129748 d!39339))

(declare-fun b!129986 () Bool)

(declare-fun res!62674 () Bool)

(declare-fun e!84814 () Bool)

(assert (=> b!129986 (=> (not res!62674) (not e!84814))))

(declare-fun e!84811 () Bool)

(assert (=> b!129986 (= res!62674 e!84811)))

(declare-fun res!62667 () Bool)

(assert (=> b!129986 (=> res!62667 e!84811)))

(declare-fun e!84807 () Bool)

(assert (=> b!129986 (= res!62667 (not e!84807))))

(declare-fun res!62672 () Bool)

(assert (=> b!129986 (=> (not res!62672) (not e!84807))))

(assert (=> b!129986 (= res!62672 (bvslt #b00000000000000000000000000000000 (size!2497 (_keys!4563 newMap!16))))))

(declare-fun b!129987 () Bool)

(declare-fun e!84816 () Bool)

(declare-fun lt!67499 () ListLongMap!1661)

(assert (=> b!129987 (= e!84816 (= (apply!113 lt!67499 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2682 newMap!16)))))

(declare-fun b!129988 () Bool)

(declare-fun e!84812 () Bool)

(assert (=> b!129988 (= e!84812 e!84816)))

(declare-fun res!62671 () Bool)

(declare-fun call!14136 () Bool)

(assert (=> b!129988 (= res!62671 call!14136)))

(assert (=> b!129988 (=> (not res!62671) (not e!84816))))

(declare-fun b!129989 () Bool)

(declare-fun e!84805 () Bool)

(assert (=> b!129989 (= e!84811 e!84805)))

(declare-fun res!62669 () Bool)

(assert (=> b!129989 (=> (not res!62669) (not e!84805))))

(assert (=> b!129989 (= res!62669 (contains!876 lt!67499 (select (arr!2230 (_keys!4563 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!129989 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2497 (_keys!4563 newMap!16))))))

(declare-fun bm!14131 () Bool)

(declare-fun call!14139 () ListLongMap!1661)

(declare-fun call!14138 () ListLongMap!1661)

(assert (=> bm!14131 (= call!14139 call!14138)))

(declare-fun b!129990 () Bool)

(declare-fun e!84804 () Bool)

(declare-fun e!84806 () Bool)

(assert (=> b!129990 (= e!84804 e!84806)))

(declare-fun res!62670 () Bool)

(declare-fun call!14134 () Bool)

(assert (=> b!129990 (= res!62670 call!14134)))

(assert (=> b!129990 (=> (not res!62670) (not e!84806))))

(declare-fun b!129992 () Bool)

(declare-fun e!84815 () ListLongMap!1661)

(declare-fun call!14140 () ListLongMap!1661)

(assert (=> b!129992 (= e!84815 call!14140)))

(declare-fun b!129993 () Bool)

(declare-fun e!84808 () Bool)

(assert (=> b!129993 (= e!84808 (validKeyInArray!0 (select (arr!2230 (_keys!4563 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun bm!14132 () Bool)

(assert (=> bm!14132 (= call!14138 (getCurrentListMapNoExtraKeys!125 (_keys!4563 newMap!16) (array!4718 (store (arr!2231 (_values!2806 newMap!16)) (index!3258 lt!67161) (ValueCellFull!1085 (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2498 (_values!2806 newMap!16))) (mask!7100 newMap!16) (extraKeys!2596 newMap!16) (zeroValue!2682 newMap!16) (minValue!2682 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2823 newMap!16)))))

(declare-fun bm!14133 () Bool)

(assert (=> bm!14133 (= call!14134 (contains!876 lt!67499 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!129994 () Bool)

(assert (=> b!129994 (= e!84805 (= (apply!113 lt!67499 (select (arr!2230 (_keys!4563 newMap!16)) #b00000000000000000000000000000000)) (get!1459 (select (arr!2231 (array!4718 (store (arr!2231 (_values!2806 newMap!16)) (index!3258 lt!67161) (ValueCellFull!1085 (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2498 (_values!2806 newMap!16)))) #b00000000000000000000000000000000) (dynLambda!414 (defaultEntry!2823 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!129994 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2498 (array!4718 (store (arr!2231 (_values!2806 newMap!16)) (index!3258 lt!67161) (ValueCellFull!1085 (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2498 (_values!2806 newMap!16))))))))

(assert (=> b!129994 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2497 (_keys!4563 newMap!16))))))

(declare-fun b!129995 () Bool)

(assert (=> b!129995 (= e!84814 e!84804)))

(declare-fun c!23954 () Bool)

(assert (=> b!129995 (= c!23954 (not (= (bvand (extraKeys!2596 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!129996 () Bool)

(assert (=> b!129996 (= e!84812 (not call!14136))))

(declare-fun b!129997 () Bool)

(declare-fun e!84810 () Unit!4037)

(declare-fun Unit!4056 () Unit!4037)

(assert (=> b!129997 (= e!84810 Unit!4056)))

(declare-fun b!129998 () Bool)

(declare-fun e!84813 () ListLongMap!1661)

(declare-fun call!14137 () ListLongMap!1661)

(assert (=> b!129998 (= e!84813 call!14137)))

(declare-fun bm!14134 () Bool)

(declare-fun call!14135 () ListLongMap!1661)

(assert (=> bm!14134 (= call!14137 call!14135)))

(declare-fun b!129999 () Bool)

(declare-fun lt!67493 () Unit!4037)

(assert (=> b!129999 (= e!84810 lt!67493)))

(declare-fun lt!67489 () ListLongMap!1661)

(assert (=> b!129999 (= lt!67489 (getCurrentListMapNoExtraKeys!125 (_keys!4563 newMap!16) (array!4718 (store (arr!2231 (_values!2806 newMap!16)) (index!3258 lt!67161) (ValueCellFull!1085 (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2498 (_values!2806 newMap!16))) (mask!7100 newMap!16) (extraKeys!2596 newMap!16) (zeroValue!2682 newMap!16) (minValue!2682 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2823 newMap!16)))))

(declare-fun lt!67501 () (_ BitVec 64))

(assert (=> b!129999 (= lt!67501 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!67491 () (_ BitVec 64))

(assert (=> b!129999 (= lt!67491 (select (arr!2230 (_keys!4563 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!67490 () Unit!4037)

(assert (=> b!129999 (= lt!67490 (addStillContains!89 lt!67489 lt!67501 (zeroValue!2682 newMap!16) lt!67491))))

(assert (=> b!129999 (contains!876 (+!160 lt!67489 (tuple2!2567 lt!67501 (zeroValue!2682 newMap!16))) lt!67491)))

(declare-fun lt!67492 () Unit!4037)

(assert (=> b!129999 (= lt!67492 lt!67490)))

(declare-fun lt!67502 () ListLongMap!1661)

(assert (=> b!129999 (= lt!67502 (getCurrentListMapNoExtraKeys!125 (_keys!4563 newMap!16) (array!4718 (store (arr!2231 (_values!2806 newMap!16)) (index!3258 lt!67161) (ValueCellFull!1085 (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2498 (_values!2806 newMap!16))) (mask!7100 newMap!16) (extraKeys!2596 newMap!16) (zeroValue!2682 newMap!16) (minValue!2682 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2823 newMap!16)))))

(declare-fun lt!67484 () (_ BitVec 64))

(assert (=> b!129999 (= lt!67484 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!67494 () (_ BitVec 64))

(assert (=> b!129999 (= lt!67494 (select (arr!2230 (_keys!4563 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!67504 () Unit!4037)

(assert (=> b!129999 (= lt!67504 (addApplyDifferent!89 lt!67502 lt!67484 (minValue!2682 newMap!16) lt!67494))))

(assert (=> b!129999 (= (apply!113 (+!160 lt!67502 (tuple2!2567 lt!67484 (minValue!2682 newMap!16))) lt!67494) (apply!113 lt!67502 lt!67494))))

(declare-fun lt!67500 () Unit!4037)

(assert (=> b!129999 (= lt!67500 lt!67504)))

(declare-fun lt!67487 () ListLongMap!1661)

(assert (=> b!129999 (= lt!67487 (getCurrentListMapNoExtraKeys!125 (_keys!4563 newMap!16) (array!4718 (store (arr!2231 (_values!2806 newMap!16)) (index!3258 lt!67161) (ValueCellFull!1085 (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2498 (_values!2806 newMap!16))) (mask!7100 newMap!16) (extraKeys!2596 newMap!16) (zeroValue!2682 newMap!16) (minValue!2682 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2823 newMap!16)))))

(declare-fun lt!67503 () (_ BitVec 64))

(assert (=> b!129999 (= lt!67503 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!67496 () (_ BitVec 64))

(assert (=> b!129999 (= lt!67496 (select (arr!2230 (_keys!4563 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!67498 () Unit!4037)

(assert (=> b!129999 (= lt!67498 (addApplyDifferent!89 lt!67487 lt!67503 (zeroValue!2682 newMap!16) lt!67496))))

(assert (=> b!129999 (= (apply!113 (+!160 lt!67487 (tuple2!2567 lt!67503 (zeroValue!2682 newMap!16))) lt!67496) (apply!113 lt!67487 lt!67496))))

(declare-fun lt!67497 () Unit!4037)

(assert (=> b!129999 (= lt!67497 lt!67498)))

(declare-fun lt!67495 () ListLongMap!1661)

(assert (=> b!129999 (= lt!67495 (getCurrentListMapNoExtraKeys!125 (_keys!4563 newMap!16) (array!4718 (store (arr!2231 (_values!2806 newMap!16)) (index!3258 lt!67161) (ValueCellFull!1085 (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2498 (_values!2806 newMap!16))) (mask!7100 newMap!16) (extraKeys!2596 newMap!16) (zeroValue!2682 newMap!16) (minValue!2682 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2823 newMap!16)))))

(declare-fun lt!67488 () (_ BitVec 64))

(assert (=> b!129999 (= lt!67488 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!67505 () (_ BitVec 64))

(assert (=> b!129999 (= lt!67505 (select (arr!2230 (_keys!4563 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!129999 (= lt!67493 (addApplyDifferent!89 lt!67495 lt!67488 (minValue!2682 newMap!16) lt!67505))))

(assert (=> b!129999 (= (apply!113 (+!160 lt!67495 (tuple2!2567 lt!67488 (minValue!2682 newMap!16))) lt!67505) (apply!113 lt!67495 lt!67505))))

(declare-fun b!130000 () Bool)

(assert (=> b!130000 (= e!84807 (validKeyInArray!0 (select (arr!2230 (_keys!4563 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!130001 () Bool)

(declare-fun c!23957 () Bool)

(assert (=> b!130001 (= c!23957 (and (not (= (bvand (extraKeys!2596 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2596 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!130001 (= e!84813 e!84815)))

(declare-fun b!130002 () Bool)

(declare-fun res!62673 () Bool)

(assert (=> b!130002 (=> (not res!62673) (not e!84814))))

(assert (=> b!130002 (= res!62673 e!84812)))

(declare-fun c!23955 () Bool)

(assert (=> b!130002 (= c!23955 (not (= (bvand (extraKeys!2596 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!130003 () Bool)

(assert (=> b!130003 (= e!84815 call!14137)))

(declare-fun bm!14135 () Bool)

(assert (=> bm!14135 (= call!14140 call!14139)))

(declare-fun b!130004 () Bool)

(assert (=> b!130004 (= e!84806 (= (apply!113 lt!67499 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2682 newMap!16)))))

(declare-fun b!129991 () Bool)

(declare-fun e!84809 () ListLongMap!1661)

(assert (=> b!129991 (= e!84809 (+!160 call!14135 (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2682 newMap!16))))))

(declare-fun d!39463 () Bool)

(assert (=> d!39463 e!84814))

(declare-fun res!62668 () Bool)

(assert (=> d!39463 (=> (not res!62668) (not e!84814))))

(assert (=> d!39463 (= res!62668 (or (bvsge #b00000000000000000000000000000000 (size!2497 (_keys!4563 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2497 (_keys!4563 newMap!16))))))))

(declare-fun lt!67485 () ListLongMap!1661)

(assert (=> d!39463 (= lt!67499 lt!67485)))

(declare-fun lt!67486 () Unit!4037)

(assert (=> d!39463 (= lt!67486 e!84810)))

(declare-fun c!23953 () Bool)

(assert (=> d!39463 (= c!23953 e!84808)))

(declare-fun res!62666 () Bool)

(assert (=> d!39463 (=> (not res!62666) (not e!84808))))

(assert (=> d!39463 (= res!62666 (bvslt #b00000000000000000000000000000000 (size!2497 (_keys!4563 newMap!16))))))

(assert (=> d!39463 (= lt!67485 e!84809)))

(declare-fun c!23958 () Bool)

(assert (=> d!39463 (= c!23958 (and (not (= (bvand (extraKeys!2596 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2596 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!39463 (validMask!0 (mask!7100 newMap!16))))

(assert (=> d!39463 (= (getCurrentListMap!515 (_keys!4563 newMap!16) (array!4718 (store (arr!2231 (_values!2806 newMap!16)) (index!3258 lt!67161) (ValueCellFull!1085 (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2498 (_values!2806 newMap!16))) (mask!7100 newMap!16) (extraKeys!2596 newMap!16) (zeroValue!2682 newMap!16) (minValue!2682 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2823 newMap!16)) lt!67499)))

(declare-fun bm!14136 () Bool)

(assert (=> bm!14136 (= call!14136 (contains!876 lt!67499 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!130005 () Bool)

(assert (=> b!130005 (= e!84809 e!84813)))

(declare-fun c!23956 () Bool)

(assert (=> b!130005 (= c!23956 (and (not (= (bvand (extraKeys!2596 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2596 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!14137 () Bool)

(assert (=> bm!14137 (= call!14135 (+!160 (ite c!23958 call!14138 (ite c!23956 call!14139 call!14140)) (ite (or c!23958 c!23956) (tuple2!2567 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2682 newMap!16)) (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2682 newMap!16)))))))

(declare-fun b!130006 () Bool)

(assert (=> b!130006 (= e!84804 (not call!14134))))

(assert (= (and d!39463 c!23958) b!129991))

(assert (= (and d!39463 (not c!23958)) b!130005))

(assert (= (and b!130005 c!23956) b!129998))

(assert (= (and b!130005 (not c!23956)) b!130001))

(assert (= (and b!130001 c!23957) b!130003))

(assert (= (and b!130001 (not c!23957)) b!129992))

(assert (= (or b!130003 b!129992) bm!14135))

(assert (= (or b!129998 bm!14135) bm!14131))

(assert (= (or b!129998 b!130003) bm!14134))

(assert (= (or b!129991 bm!14131) bm!14132))

(assert (= (or b!129991 bm!14134) bm!14137))

(assert (= (and d!39463 res!62666) b!129993))

(assert (= (and d!39463 c!23953) b!129999))

(assert (= (and d!39463 (not c!23953)) b!129997))

(assert (= (and d!39463 res!62668) b!129986))

(assert (= (and b!129986 res!62672) b!130000))

(assert (= (and b!129986 (not res!62667)) b!129989))

(assert (= (and b!129989 res!62669) b!129994))

(assert (= (and b!129986 res!62674) b!130002))

(assert (= (and b!130002 c!23955) b!129988))

(assert (= (and b!130002 (not c!23955)) b!129996))

(assert (= (and b!129988 res!62671) b!129987))

(assert (= (or b!129988 b!129996) bm!14136))

(assert (= (and b!130002 res!62673) b!129995))

(assert (= (and b!129995 c!23954) b!129990))

(assert (= (and b!129995 (not c!23954)) b!130006))

(assert (= (and b!129990 res!62670) b!130004))

(assert (= (or b!129990 b!130006) bm!14133))

(declare-fun b_lambda!5767 () Bool)

(assert (=> (not b_lambda!5767) (not b!129994)))

(assert (=> b!129994 t!6103))

(declare-fun b_and!8033 () Bool)

(assert (= b_and!8029 (and (=> t!6103 result!3917) b_and!8033)))

(assert (=> b!129994 t!6105))

(declare-fun b_and!8035 () Bool)

(assert (= b_and!8031 (and (=> t!6105 result!3919) b_and!8035)))

(declare-fun m!152569 () Bool)

(assert (=> bm!14133 m!152569))

(declare-fun m!152571 () Bool)

(assert (=> bm!14132 m!152571))

(assert (=> b!130000 m!152019))

(assert (=> b!130000 m!152019))

(assert (=> b!130000 m!152021))

(declare-fun m!152573 () Bool)

(assert (=> b!129991 m!152573))

(assert (=> d!39463 m!152025))

(declare-fun m!152575 () Bool)

(assert (=> b!129987 m!152575))

(assert (=> b!129993 m!152019))

(assert (=> b!129993 m!152019))

(assert (=> b!129993 m!152021))

(declare-fun m!152577 () Bool)

(assert (=> b!130004 m!152577))

(declare-fun m!152579 () Bool)

(assert (=> bm!14137 m!152579))

(declare-fun m!152581 () Bool)

(assert (=> b!129999 m!152581))

(declare-fun m!152583 () Bool)

(assert (=> b!129999 m!152583))

(declare-fun m!152585 () Bool)

(assert (=> b!129999 m!152585))

(declare-fun m!152587 () Bool)

(assert (=> b!129999 m!152587))

(declare-fun m!152589 () Bool)

(assert (=> b!129999 m!152589))

(declare-fun m!152591 () Bool)

(assert (=> b!129999 m!152591))

(assert (=> b!129999 m!152571))

(declare-fun m!152593 () Bool)

(assert (=> b!129999 m!152593))

(assert (=> b!129999 m!152019))

(declare-fun m!152595 () Bool)

(assert (=> b!129999 m!152595))

(declare-fun m!152597 () Bool)

(assert (=> b!129999 m!152597))

(declare-fun m!152599 () Bool)

(assert (=> b!129999 m!152599))

(assert (=> b!129999 m!152591))

(declare-fun m!152601 () Bool)

(assert (=> b!129999 m!152601))

(assert (=> b!129999 m!152585))

(declare-fun m!152603 () Bool)

(assert (=> b!129999 m!152603))

(declare-fun m!152605 () Bool)

(assert (=> b!129999 m!152605))

(declare-fun m!152607 () Bool)

(assert (=> b!129999 m!152607))

(assert (=> b!129999 m!152597))

(assert (=> b!129999 m!152595))

(declare-fun m!152609 () Bool)

(assert (=> b!129999 m!152609))

(declare-fun m!152611 () Bool)

(assert (=> bm!14136 m!152611))

(assert (=> b!129989 m!152019))

(assert (=> b!129989 m!152019))

(declare-fun m!152613 () Bool)

(assert (=> b!129989 m!152613))

(assert (=> b!129994 m!152019))

(declare-fun m!152615 () Bool)

(assert (=> b!129994 m!152615))

(assert (=> b!129994 m!152019))

(declare-fun m!152617 () Bool)

(assert (=> b!129994 m!152617))

(assert (=> b!129994 m!152615))

(assert (=> b!129994 m!152071))

(declare-fun m!152619 () Bool)

(assert (=> b!129994 m!152619))

(assert (=> b!129994 m!152071))

(assert (=> b!129748 d!39463))

(declare-fun d!39465 () Bool)

(assert (=> d!39465 (= (validKeyInArray!0 (select (arr!2230 (_keys!4563 newMap!16)) #b00000000000000000000000000000000)) (and (not (= (select (arr!2230 (_keys!4563 newMap!16)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2230 (_keys!4563 newMap!16)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!129733 d!39465))

(declare-fun d!39467 () Bool)

(declare-fun e!84818 () Bool)

(assert (=> d!39467 e!84818))

(declare-fun res!62675 () Bool)

(assert (=> d!39467 (=> res!62675 e!84818)))

(declare-fun lt!67508 () Bool)

(assert (=> d!39467 (= res!62675 (not lt!67508))))

(declare-fun lt!67509 () Bool)

(assert (=> d!39467 (= lt!67508 lt!67509)))

(declare-fun lt!67506 () Unit!4037)

(declare-fun e!84817 () Unit!4037)

(assert (=> d!39467 (= lt!67506 e!84817)))

(declare-fun c!23959 () Bool)

(assert (=> d!39467 (= c!23959 lt!67509)))

(assert (=> d!39467 (= lt!67509 (containsKey!171 (toList!846 lt!67414) (_1!1294 (tuple2!2567 lt!67075 (zeroValue!2682 (v!3153 (underlying!442 thiss!992)))))))))

(assert (=> d!39467 (= (contains!876 lt!67414 (_1!1294 (tuple2!2567 lt!67075 (zeroValue!2682 (v!3153 (underlying!442 thiss!992)))))) lt!67508)))

(declare-fun b!130007 () Bool)

(declare-fun lt!67507 () Unit!4037)

(assert (=> b!130007 (= e!84817 lt!67507)))

(assert (=> b!130007 (= lt!67507 (lemmaContainsKeyImpliesGetValueByKeyDefined!120 (toList!846 lt!67414) (_1!1294 (tuple2!2567 lt!67075 (zeroValue!2682 (v!3153 (underlying!442 thiss!992)))))))))

(assert (=> b!130007 (isDefined!121 (getValueByKey!167 (toList!846 lt!67414) (_1!1294 (tuple2!2567 lt!67075 (zeroValue!2682 (v!3153 (underlying!442 thiss!992)))))))))

(declare-fun b!130008 () Bool)

(declare-fun Unit!4057 () Unit!4037)

(assert (=> b!130008 (= e!84817 Unit!4057)))

(declare-fun b!130009 () Bool)

(assert (=> b!130009 (= e!84818 (isDefined!121 (getValueByKey!167 (toList!846 lt!67414) (_1!1294 (tuple2!2567 lt!67075 (zeroValue!2682 (v!3153 (underlying!442 thiss!992))))))))))

(assert (= (and d!39467 c!23959) b!130007))

(assert (= (and d!39467 (not c!23959)) b!130008))

(assert (= (and d!39467 (not res!62675)) b!130009))

(declare-fun m!152621 () Bool)

(assert (=> d!39467 m!152621))

(declare-fun m!152623 () Bool)

(assert (=> b!130007 m!152623))

(assert (=> b!130007 m!152397))

(assert (=> b!130007 m!152397))

(declare-fun m!152625 () Bool)

(assert (=> b!130007 m!152625))

(assert (=> b!130009 m!152397))

(assert (=> b!130009 m!152397))

(assert (=> b!130009 m!152625))

(assert (=> d!39401 d!39467))

(declare-fun b!130012 () Bool)

(declare-fun e!84820 () Option!173)

(assert (=> b!130012 (= e!84820 (getValueByKey!167 (t!6091 lt!67411) (_1!1294 (tuple2!2567 lt!67075 (zeroValue!2682 (v!3153 (underlying!442 thiss!992)))))))))

(declare-fun b!130010 () Bool)

(declare-fun e!84819 () Option!173)

(assert (=> b!130010 (= e!84819 (Some!172 (_2!1294 (h!2301 lt!67411))))))

(declare-fun d!39469 () Bool)

(declare-fun c!23960 () Bool)

(assert (=> d!39469 (= c!23960 (and ((_ is Cons!1697) lt!67411) (= (_1!1294 (h!2301 lt!67411)) (_1!1294 (tuple2!2567 lt!67075 (zeroValue!2682 (v!3153 (underlying!442 thiss!992))))))))))

(assert (=> d!39469 (= (getValueByKey!167 lt!67411 (_1!1294 (tuple2!2567 lt!67075 (zeroValue!2682 (v!3153 (underlying!442 thiss!992)))))) e!84819)))

(declare-fun b!130011 () Bool)

(assert (=> b!130011 (= e!84819 e!84820)))

(declare-fun c!23961 () Bool)

(assert (=> b!130011 (= c!23961 (and ((_ is Cons!1697) lt!67411) (not (= (_1!1294 (h!2301 lt!67411)) (_1!1294 (tuple2!2567 lt!67075 (zeroValue!2682 (v!3153 (underlying!442 thiss!992)))))))))))

(declare-fun b!130013 () Bool)

(assert (=> b!130013 (= e!84820 None!171)))

(assert (= (and d!39469 c!23960) b!130010))

(assert (= (and d!39469 (not c!23960)) b!130011))

(assert (= (and b!130011 c!23961) b!130012))

(assert (= (and b!130011 (not c!23961)) b!130013))

(declare-fun m!152627 () Bool)

(assert (=> b!130012 m!152627))

(assert (=> d!39401 d!39469))

(declare-fun d!39471 () Bool)

(assert (=> d!39471 (= (getValueByKey!167 lt!67411 (_1!1294 (tuple2!2567 lt!67075 (zeroValue!2682 (v!3153 (underlying!442 thiss!992)))))) (Some!172 (_2!1294 (tuple2!2567 lt!67075 (zeroValue!2682 (v!3153 (underlying!442 thiss!992)))))))))

(declare-fun lt!67512 () Unit!4037)

(declare-fun choose!802 (List!1701 (_ BitVec 64) V!3457) Unit!4037)

(assert (=> d!39471 (= lt!67512 (choose!802 lt!67411 (_1!1294 (tuple2!2567 lt!67075 (zeroValue!2682 (v!3153 (underlying!442 thiss!992))))) (_2!1294 (tuple2!2567 lt!67075 (zeroValue!2682 (v!3153 (underlying!442 thiss!992)))))))))

(declare-fun e!84823 () Bool)

(assert (=> d!39471 e!84823))

(declare-fun res!62680 () Bool)

(assert (=> d!39471 (=> (not res!62680) (not e!84823))))

(assert (=> d!39471 (= res!62680 (isStrictlySorted!314 lt!67411))))

(assert (=> d!39471 (= (lemmaContainsTupThenGetReturnValue!85 lt!67411 (_1!1294 (tuple2!2567 lt!67075 (zeroValue!2682 (v!3153 (underlying!442 thiss!992))))) (_2!1294 (tuple2!2567 lt!67075 (zeroValue!2682 (v!3153 (underlying!442 thiss!992)))))) lt!67512)))

(declare-fun b!130018 () Bool)

(declare-fun res!62681 () Bool)

(assert (=> b!130018 (=> (not res!62681) (not e!84823))))

(assert (=> b!130018 (= res!62681 (containsKey!171 lt!67411 (_1!1294 (tuple2!2567 lt!67075 (zeroValue!2682 (v!3153 (underlying!442 thiss!992)))))))))

(declare-fun b!130019 () Bool)

(assert (=> b!130019 (= e!84823 (contains!878 lt!67411 (tuple2!2567 (_1!1294 (tuple2!2567 lt!67075 (zeroValue!2682 (v!3153 (underlying!442 thiss!992))))) (_2!1294 (tuple2!2567 lt!67075 (zeroValue!2682 (v!3153 (underlying!442 thiss!992))))))))))

(assert (= (and d!39471 res!62680) b!130018))

(assert (= (and b!130018 res!62681) b!130019))

(assert (=> d!39471 m!152391))

(declare-fun m!152629 () Bool)

(assert (=> d!39471 m!152629))

(declare-fun m!152631 () Bool)

(assert (=> d!39471 m!152631))

(declare-fun m!152633 () Bool)

(assert (=> b!130018 m!152633))

(declare-fun m!152635 () Bool)

(assert (=> b!130019 m!152635))

(assert (=> d!39401 d!39471))

(declare-fun bm!14144 () Bool)

(declare-fun call!14147 () List!1701)

(declare-fun call!14149 () List!1701)

(assert (=> bm!14144 (= call!14147 call!14149)))

(declare-fun b!130040 () Bool)

(declare-fun e!84834 () List!1701)

(declare-fun call!14148 () List!1701)

(assert (=> b!130040 (= e!84834 call!14148)))

(declare-fun e!84838 () List!1701)

(declare-fun c!23971 () Bool)

(declare-fun bm!14145 () Bool)

(declare-fun $colon$colon!90 (List!1701 tuple2!2566) List!1701)

(assert (=> bm!14145 (= call!14148 ($colon$colon!90 e!84838 (ite c!23971 (h!2301 (toList!846 lt!67059)) (tuple2!2567 (_1!1294 (tuple2!2567 lt!67075 (zeroValue!2682 (v!3153 (underlying!442 thiss!992))))) (_2!1294 (tuple2!2567 lt!67075 (zeroValue!2682 (v!3153 (underlying!442 thiss!992)))))))))))

(declare-fun c!23973 () Bool)

(assert (=> bm!14145 (= c!23973 c!23971)))

(declare-fun d!39473 () Bool)

(declare-fun e!84836 () Bool)

(assert (=> d!39473 e!84836))

(declare-fun res!62687 () Bool)

(assert (=> d!39473 (=> (not res!62687) (not e!84836))))

(declare-fun lt!67515 () List!1701)

(assert (=> d!39473 (= res!62687 (isStrictlySorted!314 lt!67515))))

(assert (=> d!39473 (= lt!67515 e!84834)))

(assert (=> d!39473 (= c!23971 (and ((_ is Cons!1697) (toList!846 lt!67059)) (bvslt (_1!1294 (h!2301 (toList!846 lt!67059))) (_1!1294 (tuple2!2567 lt!67075 (zeroValue!2682 (v!3153 (underlying!442 thiss!992))))))))))

(assert (=> d!39473 (isStrictlySorted!314 (toList!846 lt!67059))))

(assert (=> d!39473 (= (insertStrictlySorted!88 (toList!846 lt!67059) (_1!1294 (tuple2!2567 lt!67075 (zeroValue!2682 (v!3153 (underlying!442 thiss!992))))) (_2!1294 (tuple2!2567 lt!67075 (zeroValue!2682 (v!3153 (underlying!442 thiss!992)))))) lt!67515)))

(declare-fun b!130041 () Bool)

(declare-fun e!84837 () List!1701)

(assert (=> b!130041 (= e!84837 call!14147)))

(declare-fun c!23970 () Bool)

(declare-fun b!130042 () Bool)

(declare-fun c!23972 () Bool)

(assert (=> b!130042 (= e!84838 (ite c!23972 (t!6091 (toList!846 lt!67059)) (ite c!23970 (Cons!1697 (h!2301 (toList!846 lt!67059)) (t!6091 (toList!846 lt!67059))) Nil!1698)))))

(declare-fun b!130043 () Bool)

(assert (=> b!130043 (= e!84838 (insertStrictlySorted!88 (t!6091 (toList!846 lt!67059)) (_1!1294 (tuple2!2567 lt!67075 (zeroValue!2682 (v!3153 (underlying!442 thiss!992))))) (_2!1294 (tuple2!2567 lt!67075 (zeroValue!2682 (v!3153 (underlying!442 thiss!992)))))))))

(declare-fun bm!14146 () Bool)

(assert (=> bm!14146 (= call!14149 call!14148)))

(declare-fun b!130044 () Bool)

(declare-fun e!84835 () List!1701)

(assert (=> b!130044 (= e!84835 call!14149)))

(declare-fun b!130045 () Bool)

(assert (=> b!130045 (= c!23970 (and ((_ is Cons!1697) (toList!846 lt!67059)) (bvsgt (_1!1294 (h!2301 (toList!846 lt!67059))) (_1!1294 (tuple2!2567 lt!67075 (zeroValue!2682 (v!3153 (underlying!442 thiss!992))))))))))

(assert (=> b!130045 (= e!84835 e!84837)))

(declare-fun b!130046 () Bool)

(assert (=> b!130046 (= e!84836 (contains!878 lt!67515 (tuple2!2567 (_1!1294 (tuple2!2567 lt!67075 (zeroValue!2682 (v!3153 (underlying!442 thiss!992))))) (_2!1294 (tuple2!2567 lt!67075 (zeroValue!2682 (v!3153 (underlying!442 thiss!992))))))))))

(declare-fun b!130047 () Bool)

(assert (=> b!130047 (= e!84837 call!14147)))

(declare-fun b!130048 () Bool)

(declare-fun res!62686 () Bool)

(assert (=> b!130048 (=> (not res!62686) (not e!84836))))

(assert (=> b!130048 (= res!62686 (containsKey!171 lt!67515 (_1!1294 (tuple2!2567 lt!67075 (zeroValue!2682 (v!3153 (underlying!442 thiss!992)))))))))

(declare-fun b!130049 () Bool)

(assert (=> b!130049 (= e!84834 e!84835)))

(assert (=> b!130049 (= c!23972 (and ((_ is Cons!1697) (toList!846 lt!67059)) (= (_1!1294 (h!2301 (toList!846 lt!67059))) (_1!1294 (tuple2!2567 lt!67075 (zeroValue!2682 (v!3153 (underlying!442 thiss!992))))))))))

(assert (= (and d!39473 c!23971) b!130040))

(assert (= (and d!39473 (not c!23971)) b!130049))

(assert (= (and b!130049 c!23972) b!130044))

(assert (= (and b!130049 (not c!23972)) b!130045))

(assert (= (and b!130045 c!23970) b!130047))

(assert (= (and b!130045 (not c!23970)) b!130041))

(assert (= (or b!130047 b!130041) bm!14144))

(assert (= (or b!130044 bm!14144) bm!14146))

(assert (= (or b!130040 bm!14146) bm!14145))

(assert (= (and bm!14145 c!23973) b!130043))

(assert (= (and bm!14145 (not c!23973)) b!130042))

(assert (= (and d!39473 res!62687) b!130048))

(assert (= (and b!130048 res!62686) b!130046))

(declare-fun m!152637 () Bool)

(assert (=> b!130048 m!152637))

(declare-fun m!152639 () Bool)

(assert (=> bm!14145 m!152639))

(declare-fun m!152641 () Bool)

(assert (=> b!130043 m!152641))

(declare-fun m!152643 () Bool)

(assert (=> d!39473 m!152643))

(declare-fun m!152645 () Bool)

(assert (=> d!39473 m!152645))

(declare-fun m!152647 () Bool)

(assert (=> b!130046 m!152647))

(assert (=> d!39401 d!39473))

(assert (=> b!129660 d!39355))

(declare-fun d!39475 () Bool)

(assert (=> d!39475 (= (apply!113 lt!67261 #b0000000000000000000000000000000000000000000000000000000000000000) (get!1463 (getValueByKey!167 (toList!846 lt!67261) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!5379 () Bool)

(assert (= bs!5379 d!39475))

(declare-fun m!152649 () Bool)

(assert (=> bs!5379 m!152649))

(assert (=> bs!5379 m!152649))

(declare-fun m!152651 () Bool)

(assert (=> bs!5379 m!152651))

(assert (=> b!129720 d!39475))

(declare-fun d!39477 () Bool)

(assert (=> d!39477 (= (get!1462 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!129686 d!39477))

(declare-fun d!39479 () Bool)

(assert (=> d!39479 (= (apply!113 lt!67387 #b1000000000000000000000000000000000000000000000000000000000000000) (get!1463 (getValueByKey!167 (toList!846 lt!67387) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!5380 () Bool)

(assert (= bs!5380 d!39479))

(declare-fun m!152653 () Bool)

(assert (=> bs!5380 m!152653))

(assert (=> bs!5380 m!152653))

(declare-fun m!152655 () Bool)

(assert (=> bs!5380 m!152655))

(assert (=> b!129824 d!39479))

(declare-fun d!39481 () Bool)

(assert (=> d!39481 (= (get!1463 (getValueByKey!167 (toList!846 lt!67059) lt!67068)) (v!3159 (getValueByKey!167 (toList!846 lt!67059) lt!67068)))))

(assert (=> d!39405 d!39481))

(declare-fun b!130052 () Bool)

(declare-fun e!84840 () Option!173)

(assert (=> b!130052 (= e!84840 (getValueByKey!167 (t!6091 (toList!846 lt!67059)) lt!67068))))

(declare-fun b!130050 () Bool)

(declare-fun e!84839 () Option!173)

(assert (=> b!130050 (= e!84839 (Some!172 (_2!1294 (h!2301 (toList!846 lt!67059)))))))

(declare-fun d!39483 () Bool)

(declare-fun c!23974 () Bool)

(assert (=> d!39483 (= c!23974 (and ((_ is Cons!1697) (toList!846 lt!67059)) (= (_1!1294 (h!2301 (toList!846 lt!67059))) lt!67068)))))

(assert (=> d!39483 (= (getValueByKey!167 (toList!846 lt!67059) lt!67068) e!84839)))

(declare-fun b!130051 () Bool)

(assert (=> b!130051 (= e!84839 e!84840)))

(declare-fun c!23975 () Bool)

(assert (=> b!130051 (= c!23975 (and ((_ is Cons!1697) (toList!846 lt!67059)) (not (= (_1!1294 (h!2301 (toList!846 lt!67059))) lt!67068))))))

(declare-fun b!130053 () Bool)

(assert (=> b!130053 (= e!84840 None!171)))

(assert (= (and d!39483 c!23974) b!130050))

(assert (= (and d!39483 (not c!23974)) b!130051))

(assert (= (and b!130051 c!23975) b!130052))

(assert (= (and b!130051 (not c!23975)) b!130053))

(declare-fun m!152657 () Bool)

(assert (=> b!130052 m!152657))

(assert (=> d!39405 d!39483))

(declare-fun d!39485 () Bool)

(assert (=> d!39485 (= (get!1463 (getValueByKey!167 (toList!846 lt!67071) #b1000000000000000000000000000000000000000000000000000000000000000)) (v!3159 (getValueByKey!167 (toList!846 lt!67071) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!39441 d!39485))

(declare-fun b!130056 () Bool)

(declare-fun e!84842 () Option!173)

(assert (=> b!130056 (= e!84842 (getValueByKey!167 (t!6091 (toList!846 lt!67071)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!130054 () Bool)

(declare-fun e!84841 () Option!173)

(assert (=> b!130054 (= e!84841 (Some!172 (_2!1294 (h!2301 (toList!846 lt!67071)))))))

(declare-fun d!39487 () Bool)

(declare-fun c!23976 () Bool)

(assert (=> d!39487 (= c!23976 (and ((_ is Cons!1697) (toList!846 lt!67071)) (= (_1!1294 (h!2301 (toList!846 lt!67071))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!39487 (= (getValueByKey!167 (toList!846 lt!67071) #b1000000000000000000000000000000000000000000000000000000000000000) e!84841)))

(declare-fun b!130055 () Bool)

(assert (=> b!130055 (= e!84841 e!84842)))

(declare-fun c!23977 () Bool)

(assert (=> b!130055 (= c!23977 (and ((_ is Cons!1697) (toList!846 lt!67071)) (not (= (_1!1294 (h!2301 (toList!846 lt!67071))) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!130057 () Bool)

(assert (=> b!130057 (= e!84842 None!171)))

(assert (= (and d!39487 c!23976) b!130054))

(assert (= (and d!39487 (not c!23976)) b!130055))

(assert (= (and b!130055 c!23977) b!130056))

(assert (= (and b!130055 (not c!23977)) b!130057))

(declare-fun m!152659 () Bool)

(assert (=> b!130056 m!152659))

(assert (=> d!39441 d!39487))

(declare-fun b!130071 () Bool)

(declare-fun e!84850 () SeekEntryResult!275)

(declare-fun e!84849 () SeekEntryResult!275)

(assert (=> b!130071 (= e!84850 e!84849)))

(declare-fun c!23986 () Bool)

(declare-fun lt!67520 () (_ BitVec 64))

(assert (=> b!130071 (= c!23986 (= lt!67520 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355)))))

(declare-fun b!130072 () Bool)

(assert (=> b!130072 (= e!84850 Undefined!275)))

(declare-fun e!84851 () SeekEntryResult!275)

(declare-fun b!130073 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!130073 (= e!84851 (seekKeyOrZeroReturnVacant!0 (bvadd (x!15269 lt!67241) #b00000000000000000000000000000001) (nextIndex!0 (index!3259 lt!67241) (x!15269 lt!67241) (mask!7100 newMap!16)) (index!3259 lt!67241) (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355) (_keys!4563 newMap!16) (mask!7100 newMap!16)))))

(declare-fun b!130074 () Bool)

(assert (=> b!130074 (= e!84849 (Found!275 (index!3259 lt!67241)))))

(declare-fun b!130075 () Bool)

(assert (=> b!130075 (= e!84851 (MissingVacant!275 (index!3259 lt!67241)))))

(declare-fun d!39489 () Bool)

(declare-fun lt!67521 () SeekEntryResult!275)

(assert (=> d!39489 (and (or ((_ is Undefined!275) lt!67521) (not ((_ is Found!275) lt!67521)) (and (bvsge (index!3258 lt!67521) #b00000000000000000000000000000000) (bvslt (index!3258 lt!67521) (size!2497 (_keys!4563 newMap!16))))) (or ((_ is Undefined!275) lt!67521) ((_ is Found!275) lt!67521) (not ((_ is MissingVacant!275) lt!67521)) (not (= (index!3260 lt!67521) (index!3259 lt!67241))) (and (bvsge (index!3260 lt!67521) #b00000000000000000000000000000000) (bvslt (index!3260 lt!67521) (size!2497 (_keys!4563 newMap!16))))) (or ((_ is Undefined!275) lt!67521) (ite ((_ is Found!275) lt!67521) (= (select (arr!2230 (_keys!4563 newMap!16)) (index!3258 lt!67521)) (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355)) (and ((_ is MissingVacant!275) lt!67521) (= (index!3260 lt!67521) (index!3259 lt!67241)) (= (select (arr!2230 (_keys!4563 newMap!16)) (index!3260 lt!67521)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!39489 (= lt!67521 e!84850)))

(declare-fun c!23985 () Bool)

(assert (=> d!39489 (= c!23985 (bvsge (x!15269 lt!67241) #b01111111111111111111111111111110))))

(assert (=> d!39489 (= lt!67520 (select (arr!2230 (_keys!4563 newMap!16)) (index!3259 lt!67241)))))

(assert (=> d!39489 (validMask!0 (mask!7100 newMap!16))))

(assert (=> d!39489 (= (seekKeyOrZeroReturnVacant!0 (x!15269 lt!67241) (index!3259 lt!67241) (index!3259 lt!67241) (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355) (_keys!4563 newMap!16) (mask!7100 newMap!16)) lt!67521)))

(declare-fun b!130070 () Bool)

(declare-fun c!23984 () Bool)

(assert (=> b!130070 (= c!23984 (= lt!67520 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!130070 (= e!84849 e!84851)))

(assert (= (and d!39489 c!23985) b!130072))

(assert (= (and d!39489 (not c!23985)) b!130071))

(assert (= (and b!130071 c!23986) b!130074))

(assert (= (and b!130071 (not c!23986)) b!130070))

(assert (= (and b!130070 c!23984) b!130075))

(assert (= (and b!130070 (not c!23984)) b!130073))

(declare-fun m!152661 () Bool)

(assert (=> b!130073 m!152661))

(assert (=> b!130073 m!152661))

(assert (=> b!130073 m!151753))

(declare-fun m!152663 () Bool)

(assert (=> b!130073 m!152663))

(declare-fun m!152665 () Bool)

(assert (=> d!39489 m!152665))

(declare-fun m!152667 () Bool)

(assert (=> d!39489 m!152667))

(assert (=> d!39489 m!152103))

(assert (=> d!39489 m!152025))

(assert (=> b!129714 d!39489))

(declare-fun d!39491 () Bool)

(assert (=> d!39491 (= (apply!113 (+!160 lt!67214 (tuple2!2567 lt!67196 (minValue!2682 newMap!16))) lt!67206) (get!1463 (getValueByKey!167 (toList!846 (+!160 lt!67214 (tuple2!2567 lt!67196 (minValue!2682 newMap!16)))) lt!67206)))))

(declare-fun bs!5381 () Bool)

(assert (= bs!5381 d!39491))

(declare-fun m!152669 () Bool)

(assert (=> bs!5381 m!152669))

(assert (=> bs!5381 m!152669))

(declare-fun m!152671 () Bool)

(assert (=> bs!5381 m!152671))

(assert (=> b!129677 d!39491))

(declare-fun d!39493 () Bool)

(declare-fun e!84852 () Bool)

(assert (=> d!39493 e!84852))

(declare-fun res!62688 () Bool)

(assert (=> d!39493 (=> (not res!62688) (not e!84852))))

(declare-fun lt!67525 () ListLongMap!1661)

(assert (=> d!39493 (= res!62688 (contains!876 lt!67525 (_1!1294 (tuple2!2567 lt!67200 (minValue!2682 newMap!16)))))))

(declare-fun lt!67522 () List!1701)

(assert (=> d!39493 (= lt!67525 (ListLongMap!1662 lt!67522))))

(declare-fun lt!67523 () Unit!4037)

(declare-fun lt!67524 () Unit!4037)

(assert (=> d!39493 (= lt!67523 lt!67524)))

(assert (=> d!39493 (= (getValueByKey!167 lt!67522 (_1!1294 (tuple2!2567 lt!67200 (minValue!2682 newMap!16)))) (Some!172 (_2!1294 (tuple2!2567 lt!67200 (minValue!2682 newMap!16)))))))

(assert (=> d!39493 (= lt!67524 (lemmaContainsTupThenGetReturnValue!85 lt!67522 (_1!1294 (tuple2!2567 lt!67200 (minValue!2682 newMap!16))) (_2!1294 (tuple2!2567 lt!67200 (minValue!2682 newMap!16)))))))

(assert (=> d!39493 (= lt!67522 (insertStrictlySorted!88 (toList!846 lt!67207) (_1!1294 (tuple2!2567 lt!67200 (minValue!2682 newMap!16))) (_2!1294 (tuple2!2567 lt!67200 (minValue!2682 newMap!16)))))))

(assert (=> d!39493 (= (+!160 lt!67207 (tuple2!2567 lt!67200 (minValue!2682 newMap!16))) lt!67525)))

(declare-fun b!130076 () Bool)

(declare-fun res!62689 () Bool)

(assert (=> b!130076 (=> (not res!62689) (not e!84852))))

(assert (=> b!130076 (= res!62689 (= (getValueByKey!167 (toList!846 lt!67525) (_1!1294 (tuple2!2567 lt!67200 (minValue!2682 newMap!16)))) (Some!172 (_2!1294 (tuple2!2567 lt!67200 (minValue!2682 newMap!16))))))))

(declare-fun b!130077 () Bool)

(assert (=> b!130077 (= e!84852 (contains!878 (toList!846 lt!67525) (tuple2!2567 lt!67200 (minValue!2682 newMap!16))))))

(assert (= (and d!39493 res!62688) b!130076))

(assert (= (and b!130076 res!62689) b!130077))

(declare-fun m!152673 () Bool)

(assert (=> d!39493 m!152673))

(declare-fun m!152675 () Bool)

(assert (=> d!39493 m!152675))

(declare-fun m!152677 () Bool)

(assert (=> d!39493 m!152677))

(declare-fun m!152679 () Bool)

(assert (=> d!39493 m!152679))

(declare-fun m!152681 () Bool)

(assert (=> b!130076 m!152681))

(declare-fun m!152683 () Bool)

(assert (=> b!130077 m!152683))

(assert (=> b!129677 d!39493))

(declare-fun d!39495 () Bool)

(declare-fun e!84853 () Bool)

(assert (=> d!39495 e!84853))

(declare-fun res!62690 () Bool)

(assert (=> d!39495 (=> (not res!62690) (not e!84853))))

(declare-fun lt!67529 () ListLongMap!1661)

(assert (=> d!39495 (= res!62690 (contains!876 lt!67529 (_1!1294 (tuple2!2567 lt!67196 (minValue!2682 newMap!16)))))))

(declare-fun lt!67526 () List!1701)

(assert (=> d!39495 (= lt!67529 (ListLongMap!1662 lt!67526))))

(declare-fun lt!67527 () Unit!4037)

(declare-fun lt!67528 () Unit!4037)

(assert (=> d!39495 (= lt!67527 lt!67528)))

(assert (=> d!39495 (= (getValueByKey!167 lt!67526 (_1!1294 (tuple2!2567 lt!67196 (minValue!2682 newMap!16)))) (Some!172 (_2!1294 (tuple2!2567 lt!67196 (minValue!2682 newMap!16)))))))

(assert (=> d!39495 (= lt!67528 (lemmaContainsTupThenGetReturnValue!85 lt!67526 (_1!1294 (tuple2!2567 lt!67196 (minValue!2682 newMap!16))) (_2!1294 (tuple2!2567 lt!67196 (minValue!2682 newMap!16)))))))

(assert (=> d!39495 (= lt!67526 (insertStrictlySorted!88 (toList!846 lt!67214) (_1!1294 (tuple2!2567 lt!67196 (minValue!2682 newMap!16))) (_2!1294 (tuple2!2567 lt!67196 (minValue!2682 newMap!16)))))))

(assert (=> d!39495 (= (+!160 lt!67214 (tuple2!2567 lt!67196 (minValue!2682 newMap!16))) lt!67529)))

(declare-fun b!130078 () Bool)

(declare-fun res!62691 () Bool)

(assert (=> b!130078 (=> (not res!62691) (not e!84853))))

(assert (=> b!130078 (= res!62691 (= (getValueByKey!167 (toList!846 lt!67529) (_1!1294 (tuple2!2567 lt!67196 (minValue!2682 newMap!16)))) (Some!172 (_2!1294 (tuple2!2567 lt!67196 (minValue!2682 newMap!16))))))))

(declare-fun b!130079 () Bool)

(assert (=> b!130079 (= e!84853 (contains!878 (toList!846 lt!67529) (tuple2!2567 lt!67196 (minValue!2682 newMap!16))))))

(assert (= (and d!39495 res!62690) b!130078))

(assert (= (and b!130078 res!62691) b!130079))

(declare-fun m!152685 () Bool)

(assert (=> d!39495 m!152685))

(declare-fun m!152687 () Bool)

(assert (=> d!39495 m!152687))

(declare-fun m!152689 () Bool)

(assert (=> d!39495 m!152689))

(declare-fun m!152691 () Bool)

(assert (=> d!39495 m!152691))

(declare-fun m!152693 () Bool)

(assert (=> b!130078 m!152693))

(declare-fun m!152695 () Bool)

(assert (=> b!130079 m!152695))

(assert (=> b!129677 d!39495))

(declare-fun d!39497 () Bool)

(assert (=> d!39497 (= (apply!113 lt!67199 lt!67208) (get!1463 (getValueByKey!167 (toList!846 lt!67199) lt!67208)))))

(declare-fun bs!5382 () Bool)

(assert (= bs!5382 d!39497))

(declare-fun m!152697 () Bool)

(assert (=> bs!5382 m!152697))

(assert (=> bs!5382 m!152697))

(declare-fun m!152699 () Bool)

(assert (=> bs!5382 m!152699))

(assert (=> b!129677 d!39497))

(declare-fun d!39499 () Bool)

(declare-fun e!84855 () Bool)

(assert (=> d!39499 e!84855))

(declare-fun res!62692 () Bool)

(assert (=> d!39499 (=> res!62692 e!84855)))

(declare-fun lt!67532 () Bool)

(assert (=> d!39499 (= res!62692 (not lt!67532))))

(declare-fun lt!67533 () Bool)

(assert (=> d!39499 (= lt!67532 lt!67533)))

(declare-fun lt!67530 () Unit!4037)

(declare-fun e!84854 () Unit!4037)

(assert (=> d!39499 (= lt!67530 e!84854)))

(declare-fun c!23987 () Bool)

(assert (=> d!39499 (= c!23987 lt!67533)))

(assert (=> d!39499 (= lt!67533 (containsKey!171 (toList!846 (+!160 lt!67201 (tuple2!2567 lt!67213 (zeroValue!2682 newMap!16)))) lt!67203))))

(assert (=> d!39499 (= (contains!876 (+!160 lt!67201 (tuple2!2567 lt!67213 (zeroValue!2682 newMap!16))) lt!67203) lt!67532)))

(declare-fun b!130080 () Bool)

(declare-fun lt!67531 () Unit!4037)

(assert (=> b!130080 (= e!84854 lt!67531)))

(assert (=> b!130080 (= lt!67531 (lemmaContainsKeyImpliesGetValueByKeyDefined!120 (toList!846 (+!160 lt!67201 (tuple2!2567 lt!67213 (zeroValue!2682 newMap!16)))) lt!67203))))

(assert (=> b!130080 (isDefined!121 (getValueByKey!167 (toList!846 (+!160 lt!67201 (tuple2!2567 lt!67213 (zeroValue!2682 newMap!16)))) lt!67203))))

(declare-fun b!130081 () Bool)

(declare-fun Unit!4058 () Unit!4037)

(assert (=> b!130081 (= e!84854 Unit!4058)))

(declare-fun b!130082 () Bool)

(assert (=> b!130082 (= e!84855 (isDefined!121 (getValueByKey!167 (toList!846 (+!160 lt!67201 (tuple2!2567 lt!67213 (zeroValue!2682 newMap!16)))) lt!67203)))))

(assert (= (and d!39499 c!23987) b!130080))

(assert (= (and d!39499 (not c!23987)) b!130081))

(assert (= (and d!39499 (not res!62692)) b!130082))

(declare-fun m!152701 () Bool)

(assert (=> d!39499 m!152701))

(declare-fun m!152703 () Bool)

(assert (=> b!130080 m!152703))

(declare-fun m!152705 () Bool)

(assert (=> b!130080 m!152705))

(assert (=> b!130080 m!152705))

(declare-fun m!152707 () Bool)

(assert (=> b!130080 m!152707))

(assert (=> b!130082 m!152705))

(assert (=> b!130082 m!152705))

(assert (=> b!130082 m!152707))

(assert (=> b!129677 d!39499))

(declare-fun d!39501 () Bool)

(assert (=> d!39501 (= (apply!113 (+!160 lt!67199 (tuple2!2567 lt!67215 (zeroValue!2682 newMap!16))) lt!67208) (get!1463 (getValueByKey!167 (toList!846 (+!160 lt!67199 (tuple2!2567 lt!67215 (zeroValue!2682 newMap!16)))) lt!67208)))))

(declare-fun bs!5383 () Bool)

(assert (= bs!5383 d!39501))

(declare-fun m!152709 () Bool)

(assert (=> bs!5383 m!152709))

(assert (=> bs!5383 m!152709))

(declare-fun m!152711 () Bool)

(assert (=> bs!5383 m!152711))

(assert (=> b!129677 d!39501))

(declare-fun d!39503 () Bool)

(assert (=> d!39503 (= (apply!113 (+!160 lt!67199 (tuple2!2567 lt!67215 (zeroValue!2682 newMap!16))) lt!67208) (apply!113 lt!67199 lt!67208))))

(declare-fun lt!67534 () Unit!4037)

(assert (=> d!39503 (= lt!67534 (choose!796 lt!67199 lt!67215 (zeroValue!2682 newMap!16) lt!67208))))

(declare-fun e!84856 () Bool)

(assert (=> d!39503 e!84856))

(declare-fun res!62693 () Bool)

(assert (=> d!39503 (=> (not res!62693) (not e!84856))))

(assert (=> d!39503 (= res!62693 (contains!876 lt!67199 lt!67208))))

(assert (=> d!39503 (= (addApplyDifferent!89 lt!67199 lt!67215 (zeroValue!2682 newMap!16) lt!67208) lt!67534)))

(declare-fun b!130083 () Bool)

(assert (=> b!130083 (= e!84856 (not (= lt!67208 lt!67215)))))

(assert (= (and d!39503 res!62693) b!130083))

(assert (=> d!39503 m!152039))

(declare-fun m!152713 () Bool)

(assert (=> d!39503 m!152713))

(declare-fun m!152715 () Bool)

(assert (=> d!39503 m!152715))

(assert (=> d!39503 m!152049))

(assert (=> d!39503 m!152049))

(assert (=> d!39503 m!152051))

(assert (=> b!129677 d!39503))

(declare-fun d!39505 () Bool)

(declare-fun e!84857 () Bool)

(assert (=> d!39505 e!84857))

(declare-fun res!62694 () Bool)

(assert (=> d!39505 (=> (not res!62694) (not e!84857))))

(declare-fun lt!67538 () ListLongMap!1661)

(assert (=> d!39505 (= res!62694 (contains!876 lt!67538 (_1!1294 (tuple2!2567 lt!67213 (zeroValue!2682 newMap!16)))))))

(declare-fun lt!67535 () List!1701)

(assert (=> d!39505 (= lt!67538 (ListLongMap!1662 lt!67535))))

(declare-fun lt!67536 () Unit!4037)

(declare-fun lt!67537 () Unit!4037)

(assert (=> d!39505 (= lt!67536 lt!67537)))

(assert (=> d!39505 (= (getValueByKey!167 lt!67535 (_1!1294 (tuple2!2567 lt!67213 (zeroValue!2682 newMap!16)))) (Some!172 (_2!1294 (tuple2!2567 lt!67213 (zeroValue!2682 newMap!16)))))))

(assert (=> d!39505 (= lt!67537 (lemmaContainsTupThenGetReturnValue!85 lt!67535 (_1!1294 (tuple2!2567 lt!67213 (zeroValue!2682 newMap!16))) (_2!1294 (tuple2!2567 lt!67213 (zeroValue!2682 newMap!16)))))))

(assert (=> d!39505 (= lt!67535 (insertStrictlySorted!88 (toList!846 lt!67201) (_1!1294 (tuple2!2567 lt!67213 (zeroValue!2682 newMap!16))) (_2!1294 (tuple2!2567 lt!67213 (zeroValue!2682 newMap!16)))))))

(assert (=> d!39505 (= (+!160 lt!67201 (tuple2!2567 lt!67213 (zeroValue!2682 newMap!16))) lt!67538)))

(declare-fun b!130084 () Bool)

(declare-fun res!62695 () Bool)

(assert (=> b!130084 (=> (not res!62695) (not e!84857))))

(assert (=> b!130084 (= res!62695 (= (getValueByKey!167 (toList!846 lt!67538) (_1!1294 (tuple2!2567 lt!67213 (zeroValue!2682 newMap!16)))) (Some!172 (_2!1294 (tuple2!2567 lt!67213 (zeroValue!2682 newMap!16))))))))

(declare-fun b!130085 () Bool)

(assert (=> b!130085 (= e!84857 (contains!878 (toList!846 lt!67538) (tuple2!2567 lt!67213 (zeroValue!2682 newMap!16))))))

(assert (= (and d!39505 res!62694) b!130084))

(assert (= (and b!130084 res!62695) b!130085))

(declare-fun m!152717 () Bool)

(assert (=> d!39505 m!152717))

(declare-fun m!152719 () Bool)

(assert (=> d!39505 m!152719))

(declare-fun m!152721 () Bool)

(assert (=> d!39505 m!152721))

(declare-fun m!152723 () Bool)

(assert (=> d!39505 m!152723))

(declare-fun m!152725 () Bool)

(assert (=> b!130084 m!152725))

(declare-fun m!152727 () Bool)

(assert (=> b!130085 m!152727))

(assert (=> b!129677 d!39505))

(declare-fun d!39507 () Bool)

(assert (=> d!39507 (= (apply!113 lt!67214 lt!67206) (get!1463 (getValueByKey!167 (toList!846 lt!67214) lt!67206)))))

(declare-fun bs!5384 () Bool)

(assert (= bs!5384 d!39507))

(declare-fun m!152729 () Bool)

(assert (=> bs!5384 m!152729))

(assert (=> bs!5384 m!152729))

(declare-fun m!152731 () Bool)

(assert (=> bs!5384 m!152731))

(assert (=> b!129677 d!39507))

(declare-fun d!39509 () Bool)

(assert (=> d!39509 (= (apply!113 (+!160 lt!67214 (tuple2!2567 lt!67196 (minValue!2682 newMap!16))) lt!67206) (apply!113 lt!67214 lt!67206))))

(declare-fun lt!67539 () Unit!4037)

(assert (=> d!39509 (= lt!67539 (choose!796 lt!67214 lt!67196 (minValue!2682 newMap!16) lt!67206))))

(declare-fun e!84858 () Bool)

(assert (=> d!39509 e!84858))

(declare-fun res!62696 () Bool)

(assert (=> d!39509 (=> (not res!62696) (not e!84858))))

(assert (=> d!39509 (= res!62696 (contains!876 lt!67214 lt!67206))))

(assert (=> d!39509 (= (addApplyDifferent!89 lt!67214 lt!67196 (minValue!2682 newMap!16) lt!67206) lt!67539)))

(declare-fun b!130086 () Bool)

(assert (=> b!130086 (= e!84858 (not (= lt!67206 lt!67196)))))

(assert (= (and d!39509 res!62696) b!130086))

(assert (=> d!39509 m!152033))

(declare-fun m!152733 () Bool)

(assert (=> d!39509 m!152733))

(declare-fun m!152735 () Bool)

(assert (=> d!39509 m!152735))

(assert (=> d!39509 m!152047))

(assert (=> d!39509 m!152047))

(assert (=> d!39509 m!152061))

(assert (=> b!129677 d!39509))

(declare-fun d!39511 () Bool)

(assert (=> d!39511 (= (apply!113 lt!67207 lt!67217) (get!1463 (getValueByKey!167 (toList!846 lt!67207) lt!67217)))))

(declare-fun bs!5385 () Bool)

(assert (= bs!5385 d!39511))

(declare-fun m!152737 () Bool)

(assert (=> bs!5385 m!152737))

(assert (=> bs!5385 m!152737))

(declare-fun m!152739 () Bool)

(assert (=> bs!5385 m!152739))

(assert (=> b!129677 d!39511))

(declare-fun d!39513 () Bool)

(assert (=> d!39513 (= (apply!113 (+!160 lt!67207 (tuple2!2567 lt!67200 (minValue!2682 newMap!16))) lt!67217) (get!1463 (getValueByKey!167 (toList!846 (+!160 lt!67207 (tuple2!2567 lt!67200 (minValue!2682 newMap!16)))) lt!67217)))))

(declare-fun bs!5386 () Bool)

(assert (= bs!5386 d!39513))

(declare-fun m!152741 () Bool)

(assert (=> bs!5386 m!152741))

(assert (=> bs!5386 m!152741))

(declare-fun m!152743 () Bool)

(assert (=> bs!5386 m!152743))

(assert (=> b!129677 d!39513))

(declare-fun d!39515 () Bool)

(assert (=> d!39515 (= (apply!113 (+!160 lt!67207 (tuple2!2567 lt!67200 (minValue!2682 newMap!16))) lt!67217) (apply!113 lt!67207 lt!67217))))

(declare-fun lt!67540 () Unit!4037)

(assert (=> d!39515 (= lt!67540 (choose!796 lt!67207 lt!67200 (minValue!2682 newMap!16) lt!67217))))

(declare-fun e!84859 () Bool)

(assert (=> d!39515 e!84859))

(declare-fun res!62697 () Bool)

(assert (=> d!39515 (=> (not res!62697) (not e!84859))))

(assert (=> d!39515 (= res!62697 (contains!876 lt!67207 lt!67217))))

(assert (=> d!39515 (= (addApplyDifferent!89 lt!67207 lt!67200 (minValue!2682 newMap!16) lt!67217) lt!67540)))

(declare-fun b!130087 () Bool)

(assert (=> b!130087 (= e!84859 (not (= lt!67217 lt!67200)))))

(assert (= (and d!39515 res!62697) b!130087))

(assert (=> d!39515 m!152035))

(declare-fun m!152745 () Bool)

(assert (=> d!39515 m!152745))

(declare-fun m!152747 () Bool)

(assert (=> d!39515 m!152747))

(assert (=> d!39515 m!152037))

(assert (=> d!39515 m!152037))

(assert (=> d!39515 m!152055))

(assert (=> b!129677 d!39515))

(declare-fun d!39517 () Bool)

(assert (=> d!39517 (contains!876 (+!160 lt!67201 (tuple2!2567 lt!67213 (zeroValue!2682 newMap!16))) lt!67203)))

(declare-fun lt!67541 () Unit!4037)

(assert (=> d!39517 (= lt!67541 (choose!797 lt!67201 lt!67213 (zeroValue!2682 newMap!16) lt!67203))))

(assert (=> d!39517 (contains!876 lt!67201 lt!67203)))

(assert (=> d!39517 (= (addStillContains!89 lt!67201 lt!67213 (zeroValue!2682 newMap!16) lt!67203) lt!67541)))

(declare-fun bs!5387 () Bool)

(assert (= bs!5387 d!39517))

(assert (=> bs!5387 m!152043))

(assert (=> bs!5387 m!152043))

(assert (=> bs!5387 m!152053))

(declare-fun m!152749 () Bool)

(assert (=> bs!5387 m!152749))

(declare-fun m!152751 () Bool)

(assert (=> bs!5387 m!152751))

(assert (=> b!129677 d!39517))

(declare-fun d!39519 () Bool)

(declare-fun e!84860 () Bool)

(assert (=> d!39519 e!84860))

(declare-fun res!62698 () Bool)

(assert (=> d!39519 (=> (not res!62698) (not e!84860))))

(declare-fun lt!67545 () ListLongMap!1661)

(assert (=> d!39519 (= res!62698 (contains!876 lt!67545 (_1!1294 (tuple2!2567 lt!67215 (zeroValue!2682 newMap!16)))))))

(declare-fun lt!67542 () List!1701)

(assert (=> d!39519 (= lt!67545 (ListLongMap!1662 lt!67542))))

(declare-fun lt!67543 () Unit!4037)

(declare-fun lt!67544 () Unit!4037)

(assert (=> d!39519 (= lt!67543 lt!67544)))

(assert (=> d!39519 (= (getValueByKey!167 lt!67542 (_1!1294 (tuple2!2567 lt!67215 (zeroValue!2682 newMap!16)))) (Some!172 (_2!1294 (tuple2!2567 lt!67215 (zeroValue!2682 newMap!16)))))))

(assert (=> d!39519 (= lt!67544 (lemmaContainsTupThenGetReturnValue!85 lt!67542 (_1!1294 (tuple2!2567 lt!67215 (zeroValue!2682 newMap!16))) (_2!1294 (tuple2!2567 lt!67215 (zeroValue!2682 newMap!16)))))))

(assert (=> d!39519 (= lt!67542 (insertStrictlySorted!88 (toList!846 lt!67199) (_1!1294 (tuple2!2567 lt!67215 (zeroValue!2682 newMap!16))) (_2!1294 (tuple2!2567 lt!67215 (zeroValue!2682 newMap!16)))))))

(assert (=> d!39519 (= (+!160 lt!67199 (tuple2!2567 lt!67215 (zeroValue!2682 newMap!16))) lt!67545)))

(declare-fun b!130088 () Bool)

(declare-fun res!62699 () Bool)

(assert (=> b!130088 (=> (not res!62699) (not e!84860))))

(assert (=> b!130088 (= res!62699 (= (getValueByKey!167 (toList!846 lt!67545) (_1!1294 (tuple2!2567 lt!67215 (zeroValue!2682 newMap!16)))) (Some!172 (_2!1294 (tuple2!2567 lt!67215 (zeroValue!2682 newMap!16))))))))

(declare-fun b!130089 () Bool)

(assert (=> b!130089 (= e!84860 (contains!878 (toList!846 lt!67545) (tuple2!2567 lt!67215 (zeroValue!2682 newMap!16))))))

(assert (= (and d!39519 res!62698) b!130088))

(assert (= (and b!130088 res!62699) b!130089))

(declare-fun m!152753 () Bool)

(assert (=> d!39519 m!152753))

(declare-fun m!152755 () Bool)

(assert (=> d!39519 m!152755))

(declare-fun m!152757 () Bool)

(assert (=> d!39519 m!152757))

(declare-fun m!152759 () Bool)

(assert (=> d!39519 m!152759))

(declare-fun m!152761 () Bool)

(assert (=> b!130088 m!152761))

(declare-fun m!152763 () Bool)

(assert (=> b!130089 m!152763))

(assert (=> b!129677 d!39519))

(assert (=> b!129677 d!39453))

(declare-fun d!39521 () Bool)

(assert (=> d!39521 (= (get!1463 (getValueByKey!167 (toList!846 (+!160 lt!67067 (tuple2!2567 lt!67060 (minValue!2682 (v!3153 (underlying!442 thiss!992)))))) lt!67077)) (v!3159 (getValueByKey!167 (toList!846 (+!160 lt!67067 (tuple2!2567 lt!67060 (minValue!2682 (v!3153 (underlying!442 thiss!992)))))) lt!67077)))))

(assert (=> d!39389 d!39521))

(declare-fun e!84862 () Option!173)

(declare-fun b!130092 () Bool)

(assert (=> b!130092 (= e!84862 (getValueByKey!167 (t!6091 (toList!846 (+!160 lt!67067 (tuple2!2567 lt!67060 (minValue!2682 (v!3153 (underlying!442 thiss!992))))))) lt!67077))))

(declare-fun b!130090 () Bool)

(declare-fun e!84861 () Option!173)

(assert (=> b!130090 (= e!84861 (Some!172 (_2!1294 (h!2301 (toList!846 (+!160 lt!67067 (tuple2!2567 lt!67060 (minValue!2682 (v!3153 (underlying!442 thiss!992))))))))))))

(declare-fun d!39523 () Bool)

(declare-fun c!23988 () Bool)

(assert (=> d!39523 (= c!23988 (and ((_ is Cons!1697) (toList!846 (+!160 lt!67067 (tuple2!2567 lt!67060 (minValue!2682 (v!3153 (underlying!442 thiss!992))))))) (= (_1!1294 (h!2301 (toList!846 (+!160 lt!67067 (tuple2!2567 lt!67060 (minValue!2682 (v!3153 (underlying!442 thiss!992)))))))) lt!67077)))))

(assert (=> d!39523 (= (getValueByKey!167 (toList!846 (+!160 lt!67067 (tuple2!2567 lt!67060 (minValue!2682 (v!3153 (underlying!442 thiss!992)))))) lt!67077) e!84861)))

(declare-fun b!130091 () Bool)

(assert (=> b!130091 (= e!84861 e!84862)))

(declare-fun c!23989 () Bool)

(assert (=> b!130091 (= c!23989 (and ((_ is Cons!1697) (toList!846 (+!160 lt!67067 (tuple2!2567 lt!67060 (minValue!2682 (v!3153 (underlying!442 thiss!992))))))) (not (= (_1!1294 (h!2301 (toList!846 (+!160 lt!67067 (tuple2!2567 lt!67060 (minValue!2682 (v!3153 (underlying!442 thiss!992)))))))) lt!67077))))))

(declare-fun b!130093 () Bool)

(assert (=> b!130093 (= e!84862 None!171)))

(assert (= (and d!39523 c!23988) b!130090))

(assert (= (and d!39523 (not c!23988)) b!130091))

(assert (= (and b!130091 c!23989) b!130092))

(assert (= (and b!130091 (not c!23989)) b!130093))

(declare-fun m!152765 () Bool)

(assert (=> b!130092 m!152765))

(assert (=> d!39389 d!39523))

(assert (=> b!129789 d!39429))

(assert (=> d!39371 d!39461))

(declare-fun d!39525 () Bool)

(declare-fun e!84865 () Bool)

(assert (=> d!39525 e!84865))

(declare-fun res!62702 () Bool)

(assert (=> d!39525 (=> (not res!62702) (not e!84865))))

(assert (=> d!39525 (= res!62702 (and (bvsge (ite c!23857 (index!3260 lt!67161) (index!3257 lt!67161)) #b00000000000000000000000000000000) (bvslt (ite c!23857 (index!3260 lt!67161) (index!3257 lt!67161)) (size!2497 (_keys!4563 newMap!16)))))))

(declare-fun lt!67548 () Unit!4037)

(declare-fun choose!41 (array!4715 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!1703) Unit!4037)

(assert (=> d!39525 (= lt!67548 (choose!41 (_keys!4563 newMap!16) (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355) (ite c!23857 (index!3260 lt!67161) (index!3257 lt!67161)) lt!67365 lt!67359))))

(assert (=> d!39525 (bvslt (size!2497 (_keys!4563 newMap!16)) #b01111111111111111111111111111111)))

(assert (=> d!39525 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!4563 newMap!16) (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355) (ite c!23857 (index!3260 lt!67161) (index!3257 lt!67161)) lt!67365 lt!67359) lt!67548)))

(declare-fun b!130096 () Bool)

(assert (=> b!130096 (= e!84865 (arrayNoDuplicates!0 (array!4716 (store (arr!2230 (_keys!4563 newMap!16)) (ite c!23857 (index!3260 lt!67161) (index!3257 lt!67161)) (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355)) (size!2497 (_keys!4563 newMap!16))) lt!67365 lt!67359))))

(assert (= (and d!39525 res!62702) b!130096))

(assert (=> d!39525 m!151753))

(declare-fun m!152767 () Bool)

(assert (=> d!39525 m!152767))

(assert (=> b!130096 m!152233))

(assert (=> b!130096 m!152247))

(assert (=> d!39371 d!39525))

(declare-fun b!130097 () Bool)

(declare-fun res!62711 () Bool)

(declare-fun e!84876 () Bool)

(assert (=> b!130097 (=> (not res!62711) (not e!84876))))

(declare-fun e!84873 () Bool)

(assert (=> b!130097 (= res!62711 e!84873)))

(declare-fun res!62704 () Bool)

(assert (=> b!130097 (=> res!62704 e!84873)))

(declare-fun e!84869 () Bool)

(assert (=> b!130097 (= res!62704 (not e!84869))))

(declare-fun res!62709 () Bool)

(assert (=> b!130097 (=> (not res!62709) (not e!84869))))

(assert (=> b!130097 (= res!62709 (bvslt #b00000000000000000000000000000000 (size!2497 (array!4716 (store (arr!2230 (_keys!4563 newMap!16)) (ite c!23857 (index!3260 lt!67161) (index!3257 lt!67161)) (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355)) (size!2497 (_keys!4563 newMap!16))))))))

(declare-fun b!130098 () Bool)

(declare-fun e!84878 () Bool)

(declare-fun lt!67564 () ListLongMap!1661)

(assert (=> b!130098 (= e!84878 (= (apply!113 lt!67564 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2682 newMap!16)))))

(declare-fun b!130099 () Bool)

(declare-fun e!84874 () Bool)

(assert (=> b!130099 (= e!84874 e!84878)))

(declare-fun res!62708 () Bool)

(declare-fun call!14152 () Bool)

(assert (=> b!130099 (= res!62708 call!14152)))

(assert (=> b!130099 (=> (not res!62708) (not e!84878))))

(declare-fun b!130100 () Bool)

(declare-fun e!84867 () Bool)

(assert (=> b!130100 (= e!84873 e!84867)))

(declare-fun res!62706 () Bool)

(assert (=> b!130100 (=> (not res!62706) (not e!84867))))

(assert (=> b!130100 (= res!62706 (contains!876 lt!67564 (select (arr!2230 (array!4716 (store (arr!2230 (_keys!4563 newMap!16)) (ite c!23857 (index!3260 lt!67161) (index!3257 lt!67161)) (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355)) (size!2497 (_keys!4563 newMap!16)))) #b00000000000000000000000000000000)))))

(assert (=> b!130100 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2497 (array!4716 (store (arr!2230 (_keys!4563 newMap!16)) (ite c!23857 (index!3260 lt!67161) (index!3257 lt!67161)) (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355)) (size!2497 (_keys!4563 newMap!16))))))))

(declare-fun bm!14147 () Bool)

(declare-fun call!14155 () ListLongMap!1661)

(declare-fun call!14154 () ListLongMap!1661)

(assert (=> bm!14147 (= call!14155 call!14154)))

(declare-fun b!130101 () Bool)

(declare-fun e!84866 () Bool)

(declare-fun e!84868 () Bool)

(assert (=> b!130101 (= e!84866 e!84868)))

(declare-fun res!62707 () Bool)

(declare-fun call!14150 () Bool)

(assert (=> b!130101 (= res!62707 call!14150)))

(assert (=> b!130101 (=> (not res!62707) (not e!84868))))

(declare-fun b!130103 () Bool)

(declare-fun e!84877 () ListLongMap!1661)

(declare-fun call!14156 () ListLongMap!1661)

(assert (=> b!130103 (= e!84877 call!14156)))

(declare-fun e!84870 () Bool)

(declare-fun b!130104 () Bool)

(assert (=> b!130104 (= e!84870 (validKeyInArray!0 (select (arr!2230 (array!4716 (store (arr!2230 (_keys!4563 newMap!16)) (ite c!23857 (index!3260 lt!67161) (index!3257 lt!67161)) (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355)) (size!2497 (_keys!4563 newMap!16)))) #b00000000000000000000000000000000)))))

(declare-fun bm!14148 () Bool)

(assert (=> bm!14148 (= call!14154 (getCurrentListMapNoExtraKeys!125 (array!4716 (store (arr!2230 (_keys!4563 newMap!16)) (ite c!23857 (index!3260 lt!67161) (index!3257 lt!67161)) (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355)) (size!2497 (_keys!4563 newMap!16))) (array!4718 (store (arr!2231 (_values!2806 newMap!16)) (ite c!23857 (index!3260 lt!67161) (index!3257 lt!67161)) (ValueCellFull!1085 (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2498 (_values!2806 newMap!16))) (mask!7100 newMap!16) (extraKeys!2596 newMap!16) (zeroValue!2682 newMap!16) (minValue!2682 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2823 newMap!16)))))

(declare-fun bm!14149 () Bool)

(assert (=> bm!14149 (= call!14150 (contains!876 lt!67564 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!130105 () Bool)

(assert (=> b!130105 (= e!84867 (= (apply!113 lt!67564 (select (arr!2230 (array!4716 (store (arr!2230 (_keys!4563 newMap!16)) (ite c!23857 (index!3260 lt!67161) (index!3257 lt!67161)) (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355)) (size!2497 (_keys!4563 newMap!16)))) #b00000000000000000000000000000000)) (get!1459 (select (arr!2231 (array!4718 (store (arr!2231 (_values!2806 newMap!16)) (ite c!23857 (index!3260 lt!67161) (index!3257 lt!67161)) (ValueCellFull!1085 (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2498 (_values!2806 newMap!16)))) #b00000000000000000000000000000000) (dynLambda!414 (defaultEntry!2823 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!130105 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2498 (array!4718 (store (arr!2231 (_values!2806 newMap!16)) (ite c!23857 (index!3260 lt!67161) (index!3257 lt!67161)) (ValueCellFull!1085 (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2498 (_values!2806 newMap!16))))))))

(assert (=> b!130105 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2497 (array!4716 (store (arr!2230 (_keys!4563 newMap!16)) (ite c!23857 (index!3260 lt!67161) (index!3257 lt!67161)) (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355)) (size!2497 (_keys!4563 newMap!16))))))))

(declare-fun b!130106 () Bool)

(assert (=> b!130106 (= e!84876 e!84866)))

(declare-fun c!23991 () Bool)

(assert (=> b!130106 (= c!23991 (not (= (bvand (extraKeys!2596 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!130107 () Bool)

(assert (=> b!130107 (= e!84874 (not call!14152))))

(declare-fun b!130108 () Bool)

(declare-fun e!84872 () Unit!4037)

(declare-fun Unit!4059 () Unit!4037)

(assert (=> b!130108 (= e!84872 Unit!4059)))

(declare-fun b!130109 () Bool)

(declare-fun e!84875 () ListLongMap!1661)

(declare-fun call!14153 () ListLongMap!1661)

(assert (=> b!130109 (= e!84875 call!14153)))

(declare-fun bm!14150 () Bool)

(declare-fun call!14151 () ListLongMap!1661)

(assert (=> bm!14150 (= call!14153 call!14151)))

(declare-fun b!130110 () Bool)

(declare-fun lt!67558 () Unit!4037)

(assert (=> b!130110 (= e!84872 lt!67558)))

(declare-fun lt!67554 () ListLongMap!1661)

(assert (=> b!130110 (= lt!67554 (getCurrentListMapNoExtraKeys!125 (array!4716 (store (arr!2230 (_keys!4563 newMap!16)) (ite c!23857 (index!3260 lt!67161) (index!3257 lt!67161)) (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355)) (size!2497 (_keys!4563 newMap!16))) (array!4718 (store (arr!2231 (_values!2806 newMap!16)) (ite c!23857 (index!3260 lt!67161) (index!3257 lt!67161)) (ValueCellFull!1085 (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2498 (_values!2806 newMap!16))) (mask!7100 newMap!16) (extraKeys!2596 newMap!16) (zeroValue!2682 newMap!16) (minValue!2682 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2823 newMap!16)))))

(declare-fun lt!67566 () (_ BitVec 64))

(assert (=> b!130110 (= lt!67566 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!67556 () (_ BitVec 64))

(assert (=> b!130110 (= lt!67556 (select (arr!2230 (array!4716 (store (arr!2230 (_keys!4563 newMap!16)) (ite c!23857 (index!3260 lt!67161) (index!3257 lt!67161)) (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355)) (size!2497 (_keys!4563 newMap!16)))) #b00000000000000000000000000000000))))

(declare-fun lt!67555 () Unit!4037)

(assert (=> b!130110 (= lt!67555 (addStillContains!89 lt!67554 lt!67566 (zeroValue!2682 newMap!16) lt!67556))))

(assert (=> b!130110 (contains!876 (+!160 lt!67554 (tuple2!2567 lt!67566 (zeroValue!2682 newMap!16))) lt!67556)))

(declare-fun lt!67557 () Unit!4037)

(assert (=> b!130110 (= lt!67557 lt!67555)))

(declare-fun lt!67567 () ListLongMap!1661)

(assert (=> b!130110 (= lt!67567 (getCurrentListMapNoExtraKeys!125 (array!4716 (store (arr!2230 (_keys!4563 newMap!16)) (ite c!23857 (index!3260 lt!67161) (index!3257 lt!67161)) (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355)) (size!2497 (_keys!4563 newMap!16))) (array!4718 (store (arr!2231 (_values!2806 newMap!16)) (ite c!23857 (index!3260 lt!67161) (index!3257 lt!67161)) (ValueCellFull!1085 (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2498 (_values!2806 newMap!16))) (mask!7100 newMap!16) (extraKeys!2596 newMap!16) (zeroValue!2682 newMap!16) (minValue!2682 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2823 newMap!16)))))

(declare-fun lt!67549 () (_ BitVec 64))

(assert (=> b!130110 (= lt!67549 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!67559 () (_ BitVec 64))

(assert (=> b!130110 (= lt!67559 (select (arr!2230 (array!4716 (store (arr!2230 (_keys!4563 newMap!16)) (ite c!23857 (index!3260 lt!67161) (index!3257 lt!67161)) (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355)) (size!2497 (_keys!4563 newMap!16)))) #b00000000000000000000000000000000))))

(declare-fun lt!67569 () Unit!4037)

(assert (=> b!130110 (= lt!67569 (addApplyDifferent!89 lt!67567 lt!67549 (minValue!2682 newMap!16) lt!67559))))

(assert (=> b!130110 (= (apply!113 (+!160 lt!67567 (tuple2!2567 lt!67549 (minValue!2682 newMap!16))) lt!67559) (apply!113 lt!67567 lt!67559))))

(declare-fun lt!67565 () Unit!4037)

(assert (=> b!130110 (= lt!67565 lt!67569)))

(declare-fun lt!67552 () ListLongMap!1661)

(assert (=> b!130110 (= lt!67552 (getCurrentListMapNoExtraKeys!125 (array!4716 (store (arr!2230 (_keys!4563 newMap!16)) (ite c!23857 (index!3260 lt!67161) (index!3257 lt!67161)) (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355)) (size!2497 (_keys!4563 newMap!16))) (array!4718 (store (arr!2231 (_values!2806 newMap!16)) (ite c!23857 (index!3260 lt!67161) (index!3257 lt!67161)) (ValueCellFull!1085 (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2498 (_values!2806 newMap!16))) (mask!7100 newMap!16) (extraKeys!2596 newMap!16) (zeroValue!2682 newMap!16) (minValue!2682 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2823 newMap!16)))))

(declare-fun lt!67568 () (_ BitVec 64))

(assert (=> b!130110 (= lt!67568 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!67561 () (_ BitVec 64))

(assert (=> b!130110 (= lt!67561 (select (arr!2230 (array!4716 (store (arr!2230 (_keys!4563 newMap!16)) (ite c!23857 (index!3260 lt!67161) (index!3257 lt!67161)) (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355)) (size!2497 (_keys!4563 newMap!16)))) #b00000000000000000000000000000000))))

(declare-fun lt!67563 () Unit!4037)

(assert (=> b!130110 (= lt!67563 (addApplyDifferent!89 lt!67552 lt!67568 (zeroValue!2682 newMap!16) lt!67561))))

(assert (=> b!130110 (= (apply!113 (+!160 lt!67552 (tuple2!2567 lt!67568 (zeroValue!2682 newMap!16))) lt!67561) (apply!113 lt!67552 lt!67561))))

(declare-fun lt!67562 () Unit!4037)

(assert (=> b!130110 (= lt!67562 lt!67563)))

(declare-fun lt!67560 () ListLongMap!1661)

(assert (=> b!130110 (= lt!67560 (getCurrentListMapNoExtraKeys!125 (array!4716 (store (arr!2230 (_keys!4563 newMap!16)) (ite c!23857 (index!3260 lt!67161) (index!3257 lt!67161)) (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355)) (size!2497 (_keys!4563 newMap!16))) (array!4718 (store (arr!2231 (_values!2806 newMap!16)) (ite c!23857 (index!3260 lt!67161) (index!3257 lt!67161)) (ValueCellFull!1085 (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2498 (_values!2806 newMap!16))) (mask!7100 newMap!16) (extraKeys!2596 newMap!16) (zeroValue!2682 newMap!16) (minValue!2682 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2823 newMap!16)))))

(declare-fun lt!67553 () (_ BitVec 64))

(assert (=> b!130110 (= lt!67553 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!67570 () (_ BitVec 64))

(assert (=> b!130110 (= lt!67570 (select (arr!2230 (array!4716 (store (arr!2230 (_keys!4563 newMap!16)) (ite c!23857 (index!3260 lt!67161) (index!3257 lt!67161)) (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355)) (size!2497 (_keys!4563 newMap!16)))) #b00000000000000000000000000000000))))

(assert (=> b!130110 (= lt!67558 (addApplyDifferent!89 lt!67560 lt!67553 (minValue!2682 newMap!16) lt!67570))))

(assert (=> b!130110 (= (apply!113 (+!160 lt!67560 (tuple2!2567 lt!67553 (minValue!2682 newMap!16))) lt!67570) (apply!113 lt!67560 lt!67570))))

(declare-fun b!130111 () Bool)

(assert (=> b!130111 (= e!84869 (validKeyInArray!0 (select (arr!2230 (array!4716 (store (arr!2230 (_keys!4563 newMap!16)) (ite c!23857 (index!3260 lt!67161) (index!3257 lt!67161)) (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355)) (size!2497 (_keys!4563 newMap!16)))) #b00000000000000000000000000000000)))))

(declare-fun b!130112 () Bool)

(declare-fun c!23994 () Bool)

(assert (=> b!130112 (= c!23994 (and (not (= (bvand (extraKeys!2596 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2596 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!130112 (= e!84875 e!84877)))

(declare-fun b!130113 () Bool)

(declare-fun res!62710 () Bool)

(assert (=> b!130113 (=> (not res!62710) (not e!84876))))

(assert (=> b!130113 (= res!62710 e!84874)))

(declare-fun c!23992 () Bool)

(assert (=> b!130113 (= c!23992 (not (= (bvand (extraKeys!2596 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!130114 () Bool)

(assert (=> b!130114 (= e!84877 call!14153)))

(declare-fun bm!14151 () Bool)

(assert (=> bm!14151 (= call!14156 call!14155)))

(declare-fun b!130115 () Bool)

(assert (=> b!130115 (= e!84868 (= (apply!113 lt!67564 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2682 newMap!16)))))

(declare-fun b!130102 () Bool)

(declare-fun e!84871 () ListLongMap!1661)

(assert (=> b!130102 (= e!84871 (+!160 call!14151 (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2682 newMap!16))))))

(declare-fun d!39527 () Bool)

(assert (=> d!39527 e!84876))

(declare-fun res!62705 () Bool)

(assert (=> d!39527 (=> (not res!62705) (not e!84876))))

(assert (=> d!39527 (= res!62705 (or (bvsge #b00000000000000000000000000000000 (size!2497 (array!4716 (store (arr!2230 (_keys!4563 newMap!16)) (ite c!23857 (index!3260 lt!67161) (index!3257 lt!67161)) (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355)) (size!2497 (_keys!4563 newMap!16))))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2497 (array!4716 (store (arr!2230 (_keys!4563 newMap!16)) (ite c!23857 (index!3260 lt!67161) (index!3257 lt!67161)) (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355)) (size!2497 (_keys!4563 newMap!16))))))))))

(declare-fun lt!67550 () ListLongMap!1661)

(assert (=> d!39527 (= lt!67564 lt!67550)))

(declare-fun lt!67551 () Unit!4037)

(assert (=> d!39527 (= lt!67551 e!84872)))

(declare-fun c!23990 () Bool)

(assert (=> d!39527 (= c!23990 e!84870)))

(declare-fun res!62703 () Bool)

(assert (=> d!39527 (=> (not res!62703) (not e!84870))))

(assert (=> d!39527 (= res!62703 (bvslt #b00000000000000000000000000000000 (size!2497 (array!4716 (store (arr!2230 (_keys!4563 newMap!16)) (ite c!23857 (index!3260 lt!67161) (index!3257 lt!67161)) (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355)) (size!2497 (_keys!4563 newMap!16))))))))

(assert (=> d!39527 (= lt!67550 e!84871)))

(declare-fun c!23995 () Bool)

(assert (=> d!39527 (= c!23995 (and (not (= (bvand (extraKeys!2596 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2596 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!39527 (validMask!0 (mask!7100 newMap!16))))

(assert (=> d!39527 (= (getCurrentListMap!515 (array!4716 (store (arr!2230 (_keys!4563 newMap!16)) (ite c!23857 (index!3260 lt!67161) (index!3257 lt!67161)) (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355)) (size!2497 (_keys!4563 newMap!16))) (array!4718 (store (arr!2231 (_values!2806 newMap!16)) (ite c!23857 (index!3260 lt!67161) (index!3257 lt!67161)) (ValueCellFull!1085 (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2498 (_values!2806 newMap!16))) (mask!7100 newMap!16) (extraKeys!2596 newMap!16) (zeroValue!2682 newMap!16) (minValue!2682 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2823 newMap!16)) lt!67564)))

(declare-fun bm!14152 () Bool)

(assert (=> bm!14152 (= call!14152 (contains!876 lt!67564 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!130116 () Bool)

(assert (=> b!130116 (= e!84871 e!84875)))

(declare-fun c!23993 () Bool)

(assert (=> b!130116 (= c!23993 (and (not (= (bvand (extraKeys!2596 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2596 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!14153 () Bool)

(assert (=> bm!14153 (= call!14151 (+!160 (ite c!23995 call!14154 (ite c!23993 call!14155 call!14156)) (ite (or c!23995 c!23993) (tuple2!2567 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2682 newMap!16)) (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2682 newMap!16)))))))

(declare-fun b!130117 () Bool)

(assert (=> b!130117 (= e!84866 (not call!14150))))

(assert (= (and d!39527 c!23995) b!130102))

(assert (= (and d!39527 (not c!23995)) b!130116))

(assert (= (and b!130116 c!23993) b!130109))

(assert (= (and b!130116 (not c!23993)) b!130112))

(assert (= (and b!130112 c!23994) b!130114))

(assert (= (and b!130112 (not c!23994)) b!130103))

(assert (= (or b!130114 b!130103) bm!14151))

(assert (= (or b!130109 bm!14151) bm!14147))

(assert (= (or b!130109 b!130114) bm!14150))

(assert (= (or b!130102 bm!14147) bm!14148))

(assert (= (or b!130102 bm!14150) bm!14153))

(assert (= (and d!39527 res!62703) b!130104))

(assert (= (and d!39527 c!23990) b!130110))

(assert (= (and d!39527 (not c!23990)) b!130108))

(assert (= (and d!39527 res!62705) b!130097))

(assert (= (and b!130097 res!62709) b!130111))

(assert (= (and b!130097 (not res!62704)) b!130100))

(assert (= (and b!130100 res!62706) b!130105))

(assert (= (and b!130097 res!62711) b!130113))

(assert (= (and b!130113 c!23992) b!130099))

(assert (= (and b!130113 (not c!23992)) b!130107))

(assert (= (and b!130099 res!62708) b!130098))

(assert (= (or b!130099 b!130107) bm!14152))

(assert (= (and b!130113 res!62710) b!130106))

(assert (= (and b!130106 c!23991) b!130101))

(assert (= (and b!130106 (not c!23991)) b!130117))

(assert (= (and b!130101 res!62707) b!130115))

(assert (= (or b!130101 b!130117) bm!14149))

(declare-fun b_lambda!5769 () Bool)

(assert (=> (not b_lambda!5769) (not b!130105)))

(assert (=> b!130105 t!6103))

(declare-fun b_and!8037 () Bool)

(assert (= b_and!8033 (and (=> t!6103 result!3917) b_and!8037)))

(assert (=> b!130105 t!6105))

(declare-fun b_and!8039 () Bool)

(assert (= b_and!8035 (and (=> t!6105 result!3919) b_and!8039)))

(declare-fun m!152769 () Bool)

(assert (=> bm!14149 m!152769))

(declare-fun m!152771 () Bool)

(assert (=> bm!14148 m!152771))

(declare-fun m!152773 () Bool)

(assert (=> b!130111 m!152773))

(assert (=> b!130111 m!152773))

(declare-fun m!152775 () Bool)

(assert (=> b!130111 m!152775))

(declare-fun m!152777 () Bool)

(assert (=> b!130102 m!152777))

(assert (=> d!39527 m!152025))

(declare-fun m!152779 () Bool)

(assert (=> b!130098 m!152779))

(assert (=> b!130104 m!152773))

(assert (=> b!130104 m!152773))

(assert (=> b!130104 m!152775))

(declare-fun m!152781 () Bool)

(assert (=> b!130115 m!152781))

(declare-fun m!152783 () Bool)

(assert (=> bm!14153 m!152783))

(declare-fun m!152785 () Bool)

(assert (=> b!130110 m!152785))

(declare-fun m!152787 () Bool)

(assert (=> b!130110 m!152787))

(declare-fun m!152789 () Bool)

(assert (=> b!130110 m!152789))

(declare-fun m!152791 () Bool)

(assert (=> b!130110 m!152791))

(declare-fun m!152793 () Bool)

(assert (=> b!130110 m!152793))

(declare-fun m!152795 () Bool)

(assert (=> b!130110 m!152795))

(assert (=> b!130110 m!152771))

(declare-fun m!152797 () Bool)

(assert (=> b!130110 m!152797))

(assert (=> b!130110 m!152773))

(declare-fun m!152799 () Bool)

(assert (=> b!130110 m!152799))

(declare-fun m!152801 () Bool)

(assert (=> b!130110 m!152801))

(declare-fun m!152803 () Bool)

(assert (=> b!130110 m!152803))

(assert (=> b!130110 m!152795))

(declare-fun m!152805 () Bool)

(assert (=> b!130110 m!152805))

(assert (=> b!130110 m!152789))

(declare-fun m!152807 () Bool)

(assert (=> b!130110 m!152807))

(declare-fun m!152809 () Bool)

(assert (=> b!130110 m!152809))

(declare-fun m!152811 () Bool)

(assert (=> b!130110 m!152811))

(assert (=> b!130110 m!152801))

(assert (=> b!130110 m!152799))

(declare-fun m!152813 () Bool)

(assert (=> b!130110 m!152813))

(declare-fun m!152815 () Bool)

(assert (=> bm!14152 m!152815))

(assert (=> b!130100 m!152773))

(assert (=> b!130100 m!152773))

(declare-fun m!152817 () Bool)

(assert (=> b!130100 m!152817))

(assert (=> b!130105 m!152773))

(declare-fun m!152819 () Bool)

(assert (=> b!130105 m!152819))

(assert (=> b!130105 m!152773))

(declare-fun m!152821 () Bool)

(assert (=> b!130105 m!152821))

(assert (=> b!130105 m!152819))

(assert (=> b!130105 m!152071))

(declare-fun m!152823 () Bool)

(assert (=> b!130105 m!152823))

(assert (=> b!130105 m!152071))

(assert (=> d!39371 d!39527))

(declare-fun bm!14154 () Bool)

(declare-fun call!14157 () Bool)

(declare-fun c!23996 () Bool)

(assert (=> bm!14154 (= call!14157 (arrayNoDuplicates!0 (array!4716 (store (arr!2230 (_keys!4563 newMap!16)) (ite c!23857 (index!3260 lt!67161) (index!3257 lt!67161)) (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355)) (size!2497 (_keys!4563 newMap!16))) (bvadd lt!67365 #b00000000000000000000000000000001) (ite c!23996 (Cons!1699 (select (arr!2230 (array!4716 (store (arr!2230 (_keys!4563 newMap!16)) (ite c!23857 (index!3260 lt!67161) (index!3257 lt!67161)) (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355)) (size!2497 (_keys!4563 newMap!16)))) lt!67365) lt!67359) lt!67359)))))

(declare-fun b!130118 () Bool)

(declare-fun e!84881 () Bool)

(assert (=> b!130118 (= e!84881 call!14157)))

(declare-fun b!130119 () Bool)

(declare-fun e!84882 () Bool)

(declare-fun e!84880 () Bool)

(assert (=> b!130119 (= e!84882 e!84880)))

(declare-fun res!62714 () Bool)

(assert (=> b!130119 (=> (not res!62714) (not e!84880))))

(declare-fun e!84879 () Bool)

(assert (=> b!130119 (= res!62714 (not e!84879))))

(declare-fun res!62712 () Bool)

(assert (=> b!130119 (=> (not res!62712) (not e!84879))))

(assert (=> b!130119 (= res!62712 (validKeyInArray!0 (select (arr!2230 (array!4716 (store (arr!2230 (_keys!4563 newMap!16)) (ite c!23857 (index!3260 lt!67161) (index!3257 lt!67161)) (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355)) (size!2497 (_keys!4563 newMap!16)))) lt!67365)))))

(declare-fun d!39529 () Bool)

(declare-fun res!62713 () Bool)

(assert (=> d!39529 (=> res!62713 e!84882)))

(assert (=> d!39529 (= res!62713 (bvsge lt!67365 (size!2497 (array!4716 (store (arr!2230 (_keys!4563 newMap!16)) (ite c!23857 (index!3260 lt!67161) (index!3257 lt!67161)) (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355)) (size!2497 (_keys!4563 newMap!16))))))))

(assert (=> d!39529 (= (arrayNoDuplicates!0 (array!4716 (store (arr!2230 (_keys!4563 newMap!16)) (ite c!23857 (index!3260 lt!67161) (index!3257 lt!67161)) (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355)) (size!2497 (_keys!4563 newMap!16))) lt!67365 lt!67359) e!84882)))

(declare-fun b!130120 () Bool)

(assert (=> b!130120 (= e!84881 call!14157)))

(declare-fun b!130121 () Bool)

(assert (=> b!130121 (= e!84880 e!84881)))

(assert (=> b!130121 (= c!23996 (validKeyInArray!0 (select (arr!2230 (array!4716 (store (arr!2230 (_keys!4563 newMap!16)) (ite c!23857 (index!3260 lt!67161) (index!3257 lt!67161)) (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355)) (size!2497 (_keys!4563 newMap!16)))) lt!67365)))))

(declare-fun b!130122 () Bool)

(assert (=> b!130122 (= e!84879 (contains!879 lt!67359 (select (arr!2230 (array!4716 (store (arr!2230 (_keys!4563 newMap!16)) (ite c!23857 (index!3260 lt!67161) (index!3257 lt!67161)) (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355)) (size!2497 (_keys!4563 newMap!16)))) lt!67365)))))

(assert (= (and d!39529 (not res!62713)) b!130119))

(assert (= (and b!130119 res!62712) b!130122))

(assert (= (and b!130119 res!62714) b!130121))

(assert (= (and b!130121 c!23996) b!130120))

(assert (= (and b!130121 (not c!23996)) b!130118))

(assert (= (or b!130120 b!130118) bm!14154))

(declare-fun m!152825 () Bool)

(assert (=> bm!14154 m!152825))

(declare-fun m!152827 () Bool)

(assert (=> bm!14154 m!152827))

(assert (=> b!130119 m!152825))

(assert (=> b!130119 m!152825))

(declare-fun m!152829 () Bool)

(assert (=> b!130119 m!152829))

(assert (=> b!130121 m!152825))

(assert (=> b!130121 m!152825))

(assert (=> b!130121 m!152829))

(assert (=> b!130122 m!152825))

(assert (=> b!130122 m!152825))

(declare-fun m!152831 () Bool)

(assert (=> b!130122 m!152831))

(assert (=> d!39371 d!39529))

(declare-fun b!130123 () Bool)

(declare-fun e!84883 () (_ BitVec 32))

(declare-fun call!14158 () (_ BitVec 32))

(assert (=> b!130123 (= e!84883 call!14158)))

(declare-fun b!130125 () Bool)

(assert (=> b!130125 (= e!84883 (bvadd #b00000000000000000000000000000001 call!14158))))

(declare-fun b!130126 () Bool)

(declare-fun e!84884 () (_ BitVec 32))

(assert (=> b!130126 (= e!84884 #b00000000000000000000000000000000)))

(declare-fun bm!14155 () Bool)

(assert (=> bm!14155 (= call!14158 (arrayCountValidKeys!0 lt!67369 (bvadd (ite c!23857 (index!3260 lt!67161) (index!3257 lt!67161)) #b00000000000000000000000000000001) (bvadd (ite c!23857 (index!3260 lt!67161) (index!3257 lt!67161)) #b00000000000000000000000000000001)))))

(declare-fun d!39531 () Bool)

(declare-fun lt!67571 () (_ BitVec 32))

(assert (=> d!39531 (and (bvsge lt!67571 #b00000000000000000000000000000000) (bvsle lt!67571 (bvsub (size!2497 lt!67369) (ite c!23857 (index!3260 lt!67161) (index!3257 lt!67161)))))))

(assert (=> d!39531 (= lt!67571 e!84884)))

(declare-fun c!23998 () Bool)

(assert (=> d!39531 (= c!23998 (bvsge (ite c!23857 (index!3260 lt!67161) (index!3257 lt!67161)) (bvadd (ite c!23857 (index!3260 lt!67161) (index!3257 lt!67161)) #b00000000000000000000000000000001)))))

(assert (=> d!39531 (and (bvsle (ite c!23857 (index!3260 lt!67161) (index!3257 lt!67161)) (bvadd (ite c!23857 (index!3260 lt!67161) (index!3257 lt!67161)) #b00000000000000000000000000000001)) (bvsge (ite c!23857 (index!3260 lt!67161) (index!3257 lt!67161)) #b00000000000000000000000000000000) (bvsle (bvadd (ite c!23857 (index!3260 lt!67161) (index!3257 lt!67161)) #b00000000000000000000000000000001) (size!2497 lt!67369)))))

(assert (=> d!39531 (= (arrayCountValidKeys!0 lt!67369 (ite c!23857 (index!3260 lt!67161) (index!3257 lt!67161)) (bvadd (ite c!23857 (index!3260 lt!67161) (index!3257 lt!67161)) #b00000000000000000000000000000001)) lt!67571)))

(declare-fun b!130124 () Bool)

(assert (=> b!130124 (= e!84884 e!84883)))

(declare-fun c!23997 () Bool)

(assert (=> b!130124 (= c!23997 (validKeyInArray!0 (select (arr!2230 lt!67369) (ite c!23857 (index!3260 lt!67161) (index!3257 lt!67161)))))))

(assert (= (and d!39531 c!23998) b!130126))

(assert (= (and d!39531 (not c!23998)) b!130124))

(assert (= (and b!130124 c!23997) b!130125))

(assert (= (and b!130124 (not c!23997)) b!130123))

(assert (= (or b!130125 b!130123) bm!14155))

(declare-fun m!152833 () Bool)

(assert (=> bm!14155 m!152833))

(declare-fun m!152835 () Bool)

(assert (=> b!130124 m!152835))

(assert (=> b!130124 m!152835))

(declare-fun m!152837 () Bool)

(assert (=> b!130124 m!152837))

(assert (=> d!39371 d!39531))

(declare-fun b!130135 () Bool)

(declare-fun res!62724 () Bool)

(declare-fun e!84889 () Bool)

(assert (=> b!130135 (=> (not res!62724) (not e!84889))))

(assert (=> b!130135 (= res!62724 (not (validKeyInArray!0 (select (arr!2230 (_keys!4563 newMap!16)) (ite c!23857 (index!3260 lt!67161) (index!3257 lt!67161))))))))

(declare-fun b!130136 () Bool)

(declare-fun res!62726 () Bool)

(assert (=> b!130136 (=> (not res!62726) (not e!84889))))

(assert (=> b!130136 (= res!62726 (validKeyInArray!0 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355)))))

(declare-fun d!39533 () Bool)

(declare-fun e!84890 () Bool)

(assert (=> d!39533 e!84890))

(declare-fun res!62725 () Bool)

(assert (=> d!39533 (=> (not res!62725) (not e!84890))))

(assert (=> d!39533 (= res!62725 (and (bvsge (ite c!23857 (index!3260 lt!67161) (index!3257 lt!67161)) #b00000000000000000000000000000000) (bvslt (ite c!23857 (index!3260 lt!67161) (index!3257 lt!67161)) (size!2497 (_keys!4563 newMap!16)))))))

(declare-fun lt!67574 () Unit!4037)

(declare-fun choose!1 (array!4715 (_ BitVec 32) (_ BitVec 64)) Unit!4037)

(assert (=> d!39533 (= lt!67574 (choose!1 (_keys!4563 newMap!16) (ite c!23857 (index!3260 lt!67161) (index!3257 lt!67161)) (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355)))))

(assert (=> d!39533 e!84889))

(declare-fun res!62723 () Bool)

(assert (=> d!39533 (=> (not res!62723) (not e!84889))))

(assert (=> d!39533 (= res!62723 (and (bvsge (ite c!23857 (index!3260 lt!67161) (index!3257 lt!67161)) #b00000000000000000000000000000000) (bvslt (ite c!23857 (index!3260 lt!67161) (index!3257 lt!67161)) (size!2497 (_keys!4563 newMap!16)))))))

(assert (=> d!39533 (= (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!4563 newMap!16) (ite c!23857 (index!3260 lt!67161) (index!3257 lt!67161)) (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355)) lt!67574)))

(declare-fun b!130138 () Bool)

(assert (=> b!130138 (= e!84890 (= (arrayCountValidKeys!0 (array!4716 (store (arr!2230 (_keys!4563 newMap!16)) (ite c!23857 (index!3260 lt!67161) (index!3257 lt!67161)) (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355)) (size!2497 (_keys!4563 newMap!16))) #b00000000000000000000000000000000 (size!2497 (_keys!4563 newMap!16))) (bvadd (arrayCountValidKeys!0 (_keys!4563 newMap!16) #b00000000000000000000000000000000 (size!2497 (_keys!4563 newMap!16))) #b00000000000000000000000000000001)))))

(declare-fun b!130137 () Bool)

(assert (=> b!130137 (= e!84889 (bvslt (size!2497 (_keys!4563 newMap!16)) #b01111111111111111111111111111111))))

(assert (= (and d!39533 res!62723) b!130135))

(assert (= (and b!130135 res!62724) b!130136))

(assert (= (and b!130136 res!62726) b!130137))

(assert (= (and d!39533 res!62725) b!130138))

(declare-fun m!152839 () Bool)

(assert (=> b!130135 m!152839))

(assert (=> b!130135 m!152839))

(declare-fun m!152841 () Bool)

(assert (=> b!130135 m!152841))

(assert (=> b!130136 m!151753))

(declare-fun m!152843 () Bool)

(assert (=> b!130136 m!152843))

(assert (=> d!39533 m!151753))

(declare-fun m!152845 () Bool)

(assert (=> d!39533 m!152845))

(assert (=> b!130138 m!152233))

(assert (=> b!130138 m!152251))

(assert (=> b!130138 m!151909))

(assert (=> d!39371 d!39533))

(assert (=> d!39371 d!39367))

(assert (=> d!39371 d!39339))

(assert (=> d!39371 d!39325))

(declare-fun b!130139 () Bool)

(declare-fun res!62735 () Bool)

(declare-fun e!84901 () Bool)

(assert (=> b!130139 (=> (not res!62735) (not e!84901))))

(declare-fun e!84898 () Bool)

(assert (=> b!130139 (= res!62735 e!84898)))

(declare-fun res!62728 () Bool)

(assert (=> b!130139 (=> res!62728 e!84898)))

(declare-fun e!84894 () Bool)

(assert (=> b!130139 (= res!62728 (not e!84894))))

(declare-fun res!62733 () Bool)

(assert (=> b!130139 (=> (not res!62733) (not e!84894))))

(assert (=> b!130139 (= res!62733 (bvslt #b00000000000000000000000000000000 (size!2497 lt!67353)))))

(declare-fun b!130140 () Bool)

(declare-fun e!84903 () Bool)

(declare-fun lt!67590 () ListLongMap!1661)

(assert (=> b!130140 (= e!84903 (= (apply!113 lt!67590 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2682 newMap!16)))))

(declare-fun b!130141 () Bool)

(declare-fun e!84899 () Bool)

(assert (=> b!130141 (= e!84899 e!84903)))

(declare-fun res!62732 () Bool)

(declare-fun call!14161 () Bool)

(assert (=> b!130141 (= res!62732 call!14161)))

(assert (=> b!130141 (=> (not res!62732) (not e!84903))))

(declare-fun b!130142 () Bool)

(declare-fun e!84892 () Bool)

(assert (=> b!130142 (= e!84898 e!84892)))

(declare-fun res!62730 () Bool)

(assert (=> b!130142 (=> (not res!62730) (not e!84892))))

(assert (=> b!130142 (= res!62730 (contains!876 lt!67590 (select (arr!2230 lt!67353) #b00000000000000000000000000000000)))))

(assert (=> b!130142 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2497 lt!67353)))))

(declare-fun bm!14156 () Bool)

(declare-fun call!14164 () ListLongMap!1661)

(declare-fun call!14163 () ListLongMap!1661)

(assert (=> bm!14156 (= call!14164 call!14163)))

(declare-fun b!130143 () Bool)

(declare-fun e!84891 () Bool)

(declare-fun e!84893 () Bool)

(assert (=> b!130143 (= e!84891 e!84893)))

(declare-fun res!62731 () Bool)

(declare-fun call!14159 () Bool)

(assert (=> b!130143 (= res!62731 call!14159)))

(assert (=> b!130143 (=> (not res!62731) (not e!84893))))

(declare-fun b!130145 () Bool)

(declare-fun e!84902 () ListLongMap!1661)

(declare-fun call!14165 () ListLongMap!1661)

(assert (=> b!130145 (= e!84902 call!14165)))

(declare-fun b!130146 () Bool)

(declare-fun e!84895 () Bool)

(assert (=> b!130146 (= e!84895 (validKeyInArray!0 (select (arr!2230 lt!67353) #b00000000000000000000000000000000)))))

(declare-fun bm!14157 () Bool)

(assert (=> bm!14157 (= call!14163 (getCurrentListMapNoExtraKeys!125 lt!67353 lt!67350 (mask!7100 newMap!16) (extraKeys!2596 newMap!16) (zeroValue!2682 newMap!16) (minValue!2682 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2823 newMap!16)))))

(declare-fun bm!14158 () Bool)

(assert (=> bm!14158 (= call!14159 (contains!876 lt!67590 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!130147 () Bool)

(assert (=> b!130147 (= e!84892 (= (apply!113 lt!67590 (select (arr!2230 lt!67353) #b00000000000000000000000000000000)) (get!1459 (select (arr!2231 lt!67350) #b00000000000000000000000000000000) (dynLambda!414 (defaultEntry!2823 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!130147 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2498 lt!67350)))))

(assert (=> b!130147 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2497 lt!67353)))))

(declare-fun b!130148 () Bool)

(assert (=> b!130148 (= e!84901 e!84891)))

(declare-fun c!24000 () Bool)

(assert (=> b!130148 (= c!24000 (not (= (bvand (extraKeys!2596 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!130149 () Bool)

(assert (=> b!130149 (= e!84899 (not call!14161))))

(declare-fun b!130150 () Bool)

(declare-fun e!84897 () Unit!4037)

(declare-fun Unit!4060 () Unit!4037)

(assert (=> b!130150 (= e!84897 Unit!4060)))

(declare-fun b!130151 () Bool)

(declare-fun e!84900 () ListLongMap!1661)

(declare-fun call!14162 () ListLongMap!1661)

(assert (=> b!130151 (= e!84900 call!14162)))

(declare-fun bm!14159 () Bool)

(declare-fun call!14160 () ListLongMap!1661)

(assert (=> bm!14159 (= call!14162 call!14160)))

(declare-fun b!130152 () Bool)

(declare-fun lt!67584 () Unit!4037)

(assert (=> b!130152 (= e!84897 lt!67584)))

(declare-fun lt!67580 () ListLongMap!1661)

(assert (=> b!130152 (= lt!67580 (getCurrentListMapNoExtraKeys!125 lt!67353 lt!67350 (mask!7100 newMap!16) (extraKeys!2596 newMap!16) (zeroValue!2682 newMap!16) (minValue!2682 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2823 newMap!16)))))

(declare-fun lt!67592 () (_ BitVec 64))

(assert (=> b!130152 (= lt!67592 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!67582 () (_ BitVec 64))

(assert (=> b!130152 (= lt!67582 (select (arr!2230 lt!67353) #b00000000000000000000000000000000))))

(declare-fun lt!67581 () Unit!4037)

(assert (=> b!130152 (= lt!67581 (addStillContains!89 lt!67580 lt!67592 (zeroValue!2682 newMap!16) lt!67582))))

(assert (=> b!130152 (contains!876 (+!160 lt!67580 (tuple2!2567 lt!67592 (zeroValue!2682 newMap!16))) lt!67582)))

(declare-fun lt!67583 () Unit!4037)

(assert (=> b!130152 (= lt!67583 lt!67581)))

(declare-fun lt!67593 () ListLongMap!1661)

(assert (=> b!130152 (= lt!67593 (getCurrentListMapNoExtraKeys!125 lt!67353 lt!67350 (mask!7100 newMap!16) (extraKeys!2596 newMap!16) (zeroValue!2682 newMap!16) (minValue!2682 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2823 newMap!16)))))

(declare-fun lt!67575 () (_ BitVec 64))

(assert (=> b!130152 (= lt!67575 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!67585 () (_ BitVec 64))

(assert (=> b!130152 (= lt!67585 (select (arr!2230 lt!67353) #b00000000000000000000000000000000))))

(declare-fun lt!67595 () Unit!4037)

(assert (=> b!130152 (= lt!67595 (addApplyDifferent!89 lt!67593 lt!67575 (minValue!2682 newMap!16) lt!67585))))

(assert (=> b!130152 (= (apply!113 (+!160 lt!67593 (tuple2!2567 lt!67575 (minValue!2682 newMap!16))) lt!67585) (apply!113 lt!67593 lt!67585))))

(declare-fun lt!67591 () Unit!4037)

(assert (=> b!130152 (= lt!67591 lt!67595)))

(declare-fun lt!67578 () ListLongMap!1661)

(assert (=> b!130152 (= lt!67578 (getCurrentListMapNoExtraKeys!125 lt!67353 lt!67350 (mask!7100 newMap!16) (extraKeys!2596 newMap!16) (zeroValue!2682 newMap!16) (minValue!2682 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2823 newMap!16)))))

(declare-fun lt!67594 () (_ BitVec 64))

(assert (=> b!130152 (= lt!67594 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!67587 () (_ BitVec 64))

(assert (=> b!130152 (= lt!67587 (select (arr!2230 lt!67353) #b00000000000000000000000000000000))))

(declare-fun lt!67589 () Unit!4037)

(assert (=> b!130152 (= lt!67589 (addApplyDifferent!89 lt!67578 lt!67594 (zeroValue!2682 newMap!16) lt!67587))))

(assert (=> b!130152 (= (apply!113 (+!160 lt!67578 (tuple2!2567 lt!67594 (zeroValue!2682 newMap!16))) lt!67587) (apply!113 lt!67578 lt!67587))))

(declare-fun lt!67588 () Unit!4037)

(assert (=> b!130152 (= lt!67588 lt!67589)))

(declare-fun lt!67586 () ListLongMap!1661)

(assert (=> b!130152 (= lt!67586 (getCurrentListMapNoExtraKeys!125 lt!67353 lt!67350 (mask!7100 newMap!16) (extraKeys!2596 newMap!16) (zeroValue!2682 newMap!16) (minValue!2682 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2823 newMap!16)))))

(declare-fun lt!67579 () (_ BitVec 64))

(assert (=> b!130152 (= lt!67579 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!67596 () (_ BitVec 64))

(assert (=> b!130152 (= lt!67596 (select (arr!2230 lt!67353) #b00000000000000000000000000000000))))

(assert (=> b!130152 (= lt!67584 (addApplyDifferent!89 lt!67586 lt!67579 (minValue!2682 newMap!16) lt!67596))))

(assert (=> b!130152 (= (apply!113 (+!160 lt!67586 (tuple2!2567 lt!67579 (minValue!2682 newMap!16))) lt!67596) (apply!113 lt!67586 lt!67596))))

(declare-fun b!130153 () Bool)

(assert (=> b!130153 (= e!84894 (validKeyInArray!0 (select (arr!2230 lt!67353) #b00000000000000000000000000000000)))))

(declare-fun b!130154 () Bool)

(declare-fun c!24003 () Bool)

(assert (=> b!130154 (= c!24003 (and (not (= (bvand (extraKeys!2596 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2596 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!130154 (= e!84900 e!84902)))

(declare-fun b!130155 () Bool)

(declare-fun res!62734 () Bool)

(assert (=> b!130155 (=> (not res!62734) (not e!84901))))

(assert (=> b!130155 (= res!62734 e!84899)))

(declare-fun c!24001 () Bool)

(assert (=> b!130155 (= c!24001 (not (= (bvand (extraKeys!2596 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!130156 () Bool)

(assert (=> b!130156 (= e!84902 call!14162)))

(declare-fun bm!14160 () Bool)

(assert (=> bm!14160 (= call!14165 call!14164)))

(declare-fun b!130157 () Bool)

(assert (=> b!130157 (= e!84893 (= (apply!113 lt!67590 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2682 newMap!16)))))

(declare-fun b!130144 () Bool)

(declare-fun e!84896 () ListLongMap!1661)

(assert (=> b!130144 (= e!84896 (+!160 call!14160 (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2682 newMap!16))))))

(declare-fun d!39535 () Bool)

(assert (=> d!39535 e!84901))

(declare-fun res!62729 () Bool)

(assert (=> d!39535 (=> (not res!62729) (not e!84901))))

(assert (=> d!39535 (= res!62729 (or (bvsge #b00000000000000000000000000000000 (size!2497 lt!67353)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2497 lt!67353)))))))

(declare-fun lt!67576 () ListLongMap!1661)

(assert (=> d!39535 (= lt!67590 lt!67576)))

(declare-fun lt!67577 () Unit!4037)

(assert (=> d!39535 (= lt!67577 e!84897)))

(declare-fun c!23999 () Bool)

(assert (=> d!39535 (= c!23999 e!84895)))

(declare-fun res!62727 () Bool)

(assert (=> d!39535 (=> (not res!62727) (not e!84895))))

(assert (=> d!39535 (= res!62727 (bvslt #b00000000000000000000000000000000 (size!2497 lt!67353)))))

(assert (=> d!39535 (= lt!67576 e!84896)))

(declare-fun c!24004 () Bool)

(assert (=> d!39535 (= c!24004 (and (not (= (bvand (extraKeys!2596 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2596 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!39535 (validMask!0 (mask!7100 newMap!16))))

(assert (=> d!39535 (= (getCurrentListMap!515 lt!67353 lt!67350 (mask!7100 newMap!16) (extraKeys!2596 newMap!16) (zeroValue!2682 newMap!16) (minValue!2682 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2823 newMap!16)) lt!67590)))

(declare-fun bm!14161 () Bool)

(assert (=> bm!14161 (= call!14161 (contains!876 lt!67590 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!130158 () Bool)

(assert (=> b!130158 (= e!84896 e!84900)))

(declare-fun c!24002 () Bool)

(assert (=> b!130158 (= c!24002 (and (not (= (bvand (extraKeys!2596 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2596 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!14162 () Bool)

(assert (=> bm!14162 (= call!14160 (+!160 (ite c!24004 call!14163 (ite c!24002 call!14164 call!14165)) (ite (or c!24004 c!24002) (tuple2!2567 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2682 newMap!16)) (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2682 newMap!16)))))))

(declare-fun b!130159 () Bool)

(assert (=> b!130159 (= e!84891 (not call!14159))))

(assert (= (and d!39535 c!24004) b!130144))

(assert (= (and d!39535 (not c!24004)) b!130158))

(assert (= (and b!130158 c!24002) b!130151))

(assert (= (and b!130158 (not c!24002)) b!130154))

(assert (= (and b!130154 c!24003) b!130156))

(assert (= (and b!130154 (not c!24003)) b!130145))

(assert (= (or b!130156 b!130145) bm!14160))

(assert (= (or b!130151 bm!14160) bm!14156))

(assert (= (or b!130151 b!130156) bm!14159))

(assert (= (or b!130144 bm!14156) bm!14157))

(assert (= (or b!130144 bm!14159) bm!14162))

(assert (= (and d!39535 res!62727) b!130146))

(assert (= (and d!39535 c!23999) b!130152))

(assert (= (and d!39535 (not c!23999)) b!130150))

(assert (= (and d!39535 res!62729) b!130139))

(assert (= (and b!130139 res!62733) b!130153))

(assert (= (and b!130139 (not res!62728)) b!130142))

(assert (= (and b!130142 res!62730) b!130147))

(assert (= (and b!130139 res!62735) b!130155))

(assert (= (and b!130155 c!24001) b!130141))

(assert (= (and b!130155 (not c!24001)) b!130149))

(assert (= (and b!130141 res!62732) b!130140))

(assert (= (or b!130141 b!130149) bm!14161))

(assert (= (and b!130155 res!62734) b!130148))

(assert (= (and b!130148 c!24000) b!130143))

(assert (= (and b!130148 (not c!24000)) b!130159))

(assert (= (and b!130143 res!62731) b!130157))

(assert (= (or b!130143 b!130159) bm!14158))

(declare-fun b_lambda!5771 () Bool)

(assert (=> (not b_lambda!5771) (not b!130147)))

(assert (=> b!130147 t!6103))

(declare-fun b_and!8041 () Bool)

(assert (= b_and!8037 (and (=> t!6103 result!3917) b_and!8041)))

(assert (=> b!130147 t!6105))

(declare-fun b_and!8043 () Bool)

(assert (= b_and!8039 (and (=> t!6105 result!3919) b_and!8043)))

(declare-fun m!152847 () Bool)

(assert (=> bm!14158 m!152847))

(declare-fun m!152849 () Bool)

(assert (=> bm!14157 m!152849))

(declare-fun m!152851 () Bool)

(assert (=> b!130153 m!152851))

(assert (=> b!130153 m!152851))

(declare-fun m!152853 () Bool)

(assert (=> b!130153 m!152853))

(declare-fun m!152855 () Bool)

(assert (=> b!130144 m!152855))

(assert (=> d!39535 m!152025))

(declare-fun m!152857 () Bool)

(assert (=> b!130140 m!152857))

(assert (=> b!130146 m!152851))

(assert (=> b!130146 m!152851))

(assert (=> b!130146 m!152853))

(declare-fun m!152859 () Bool)

(assert (=> b!130157 m!152859))

(declare-fun m!152861 () Bool)

(assert (=> bm!14162 m!152861))

(declare-fun m!152863 () Bool)

(assert (=> b!130152 m!152863))

(declare-fun m!152865 () Bool)

(assert (=> b!130152 m!152865))

(declare-fun m!152867 () Bool)

(assert (=> b!130152 m!152867))

(declare-fun m!152869 () Bool)

(assert (=> b!130152 m!152869))

(declare-fun m!152871 () Bool)

(assert (=> b!130152 m!152871))

(declare-fun m!152873 () Bool)

(assert (=> b!130152 m!152873))

(assert (=> b!130152 m!152849))

(declare-fun m!152875 () Bool)

(assert (=> b!130152 m!152875))

(assert (=> b!130152 m!152851))

(declare-fun m!152877 () Bool)

(assert (=> b!130152 m!152877))

(declare-fun m!152879 () Bool)

(assert (=> b!130152 m!152879))

(declare-fun m!152881 () Bool)

(assert (=> b!130152 m!152881))

(assert (=> b!130152 m!152873))

(declare-fun m!152883 () Bool)

(assert (=> b!130152 m!152883))

(assert (=> b!130152 m!152867))

(declare-fun m!152885 () Bool)

(assert (=> b!130152 m!152885))

(declare-fun m!152887 () Bool)

(assert (=> b!130152 m!152887))

(declare-fun m!152889 () Bool)

(assert (=> b!130152 m!152889))

(assert (=> b!130152 m!152879))

(assert (=> b!130152 m!152877))

(declare-fun m!152891 () Bool)

(assert (=> b!130152 m!152891))

(declare-fun m!152893 () Bool)

(assert (=> bm!14161 m!152893))

(assert (=> b!130142 m!152851))

(assert (=> b!130142 m!152851))

(declare-fun m!152895 () Bool)

(assert (=> b!130142 m!152895))

(assert (=> b!130147 m!152851))

(declare-fun m!152897 () Bool)

(assert (=> b!130147 m!152897))

(assert (=> b!130147 m!152851))

(declare-fun m!152899 () Bool)

(assert (=> b!130147 m!152899))

(assert (=> b!130147 m!152897))

(assert (=> b!130147 m!152071))

(declare-fun m!152901 () Bool)

(assert (=> b!130147 m!152901))

(assert (=> b!130147 m!152071))

(assert (=> d!39371 d!39535))

(declare-fun d!39537 () Bool)

(assert (=> d!39537 (= (arrayCountValidKeys!0 lt!67369 (ite c!23857 (index!3260 lt!67161) (index!3257 lt!67161)) (bvadd (ite c!23857 (index!3260 lt!67161) (index!3257 lt!67161)) #b00000000000000000000000000000001)) #b00000000000000000000000000000001)))

(declare-fun lt!67599 () Unit!4037)

(declare-fun choose!2 (array!4715 (_ BitVec 32)) Unit!4037)

(assert (=> d!39537 (= lt!67599 (choose!2 lt!67369 (ite c!23857 (index!3260 lt!67161) (index!3257 lt!67161))))))

(declare-fun e!84906 () Bool)

(assert (=> d!39537 e!84906))

(declare-fun res!62740 () Bool)

(assert (=> d!39537 (=> (not res!62740) (not e!84906))))

(assert (=> d!39537 (= res!62740 (and (bvsge (ite c!23857 (index!3260 lt!67161) (index!3257 lt!67161)) #b00000000000000000000000000000000) (bvslt (ite c!23857 (index!3260 lt!67161) (index!3257 lt!67161)) (size!2497 lt!67369))))))

(assert (=> d!39537 (= (lemmaValidKeyAtIImpliesCountKeysIsOne!0 lt!67369 (ite c!23857 (index!3260 lt!67161) (index!3257 lt!67161))) lt!67599)))

(declare-fun b!130164 () Bool)

(declare-fun res!62741 () Bool)

(assert (=> b!130164 (=> (not res!62741) (not e!84906))))

(assert (=> b!130164 (= res!62741 (validKeyInArray!0 (select (arr!2230 lt!67369) (ite c!23857 (index!3260 lt!67161) (index!3257 lt!67161)))))))

(declare-fun b!130165 () Bool)

(assert (=> b!130165 (= e!84906 (bvslt (size!2497 lt!67369) #b01111111111111111111111111111111))))

(assert (= (and d!39537 res!62740) b!130164))

(assert (= (and b!130164 res!62741) b!130165))

(assert (=> d!39537 m!152231))

(declare-fun m!152903 () Bool)

(assert (=> d!39537 m!152903))

(assert (=> b!130164 m!152835))

(assert (=> b!130164 m!152835))

(assert (=> b!130164 m!152837))

(assert (=> d!39371 d!39537))

(assert (=> d!39371 d!39415))

(declare-fun d!39539 () Bool)

(declare-fun e!84909 () Bool)

(assert (=> d!39539 e!84909))

(declare-fun res!62744 () Bool)

(assert (=> d!39539 (=> (not res!62744) (not e!84909))))

(assert (=> d!39539 (= res!62744 (and (bvsge (ite c!23857 (index!3260 lt!67161) (index!3257 lt!67161)) #b00000000000000000000000000000000) (bvslt (ite c!23857 (index!3260 lt!67161) (index!3257 lt!67161)) (size!2497 (_keys!4563 newMap!16))) (bvslt (ite c!23857 (index!3260 lt!67161) (index!3257 lt!67161)) (size!2498 (_values!2806 newMap!16)))))))

(declare-fun lt!67602 () Unit!4037)

(declare-fun choose!803 (array!4715 array!4717 (_ BitVec 32) (_ BitVec 32) V!3457 V!3457 (_ BitVec 32) (_ BitVec 64) V!3457 Int) Unit!4037)

(assert (=> d!39539 (= lt!67602 (choose!803 (_keys!4563 newMap!16) (_values!2806 newMap!16) (mask!7100 newMap!16) (extraKeys!2596 newMap!16) (zeroValue!2682 newMap!16) (minValue!2682 newMap!16) (ite c!23857 (index!3260 lt!67161) (index!3257 lt!67161)) (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2823 newMap!16)))))

(assert (=> d!39539 (validMask!0 (mask!7100 newMap!16))))

(assert (=> d!39539 (= (lemmaAddValidKeyToArrayThenAddPairToListMap!39 (_keys!4563 newMap!16) (_values!2806 newMap!16) (mask!7100 newMap!16) (extraKeys!2596 newMap!16) (zeroValue!2682 newMap!16) (minValue!2682 newMap!16) (ite c!23857 (index!3260 lt!67161) (index!3257 lt!67161)) (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2823 newMap!16)) lt!67602)))

(declare-fun b!130168 () Bool)

(assert (=> b!130168 (= e!84909 (= (+!160 (getCurrentListMap!515 (_keys!4563 newMap!16) (_values!2806 newMap!16) (mask!7100 newMap!16) (extraKeys!2596 newMap!16) (zeroValue!2682 newMap!16) (minValue!2682 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2823 newMap!16)) (tuple2!2567 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (getCurrentListMap!515 (array!4716 (store (arr!2230 (_keys!4563 newMap!16)) (ite c!23857 (index!3260 lt!67161) (index!3257 lt!67161)) (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355)) (size!2497 (_keys!4563 newMap!16))) (array!4718 (store (arr!2231 (_values!2806 newMap!16)) (ite c!23857 (index!3260 lt!67161) (index!3257 lt!67161)) (ValueCellFull!1085 (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2498 (_values!2806 newMap!16))) (mask!7100 newMap!16) (extraKeys!2596 newMap!16) (zeroValue!2682 newMap!16) (minValue!2682 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2823 newMap!16))))))

(assert (= (and d!39539 res!62744) b!130168))

(assert (=> d!39539 m!151753))

(assert (=> d!39539 m!151751))

(declare-fun m!152905 () Bool)

(assert (=> d!39539 m!152905))

(assert (=> d!39539 m!152025))

(assert (=> b!130168 m!152237))

(assert (=> b!130168 m!151849))

(assert (=> b!130168 m!152233))

(assert (=> b!130168 m!152241))

(assert (=> b!130168 m!151849))

(assert (=> b!130168 m!152197))

(assert (=> d!39371 d!39539))

(declare-fun d!39541 () Bool)

(declare-fun e!84911 () Bool)

(assert (=> d!39541 e!84911))

(declare-fun res!62745 () Bool)

(assert (=> d!39541 (=> res!62745 e!84911)))

(declare-fun lt!67605 () Bool)

(assert (=> d!39541 (= res!62745 (not lt!67605))))

(declare-fun lt!67606 () Bool)

(assert (=> d!39541 (= lt!67605 lt!67606)))

(declare-fun lt!67603 () Unit!4037)

(declare-fun e!84910 () Unit!4037)

(assert (=> d!39541 (= lt!67603 e!84910)))

(declare-fun c!24005 () Bool)

(assert (=> d!39541 (= c!24005 lt!67606)))

(assert (=> d!39541 (= lt!67606 (containsKey!171 (toList!846 (getCurrentListMap!515 lt!67353 lt!67350 (mask!7100 newMap!16) (extraKeys!2596 newMap!16) (zeroValue!2682 newMap!16) (minValue!2682 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2823 newMap!16))) (select (store (arr!2230 (_keys!4563 newMap!16)) (ite c!23857 (index!3260 lt!67161) (index!3257 lt!67161)) (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355)) (ite c!23857 (index!3260 lt!67161) (index!3257 lt!67161)))))))

(assert (=> d!39541 (= (contains!876 (getCurrentListMap!515 lt!67353 lt!67350 (mask!7100 newMap!16) (extraKeys!2596 newMap!16) (zeroValue!2682 newMap!16) (minValue!2682 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2823 newMap!16)) (select (store (arr!2230 (_keys!4563 newMap!16)) (ite c!23857 (index!3260 lt!67161) (index!3257 lt!67161)) (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355)) (ite c!23857 (index!3260 lt!67161) (index!3257 lt!67161)))) lt!67605)))

(declare-fun b!130169 () Bool)

(declare-fun lt!67604 () Unit!4037)

(assert (=> b!130169 (= e!84910 lt!67604)))

(assert (=> b!130169 (= lt!67604 (lemmaContainsKeyImpliesGetValueByKeyDefined!120 (toList!846 (getCurrentListMap!515 lt!67353 lt!67350 (mask!7100 newMap!16) (extraKeys!2596 newMap!16) (zeroValue!2682 newMap!16) (minValue!2682 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2823 newMap!16))) (select (store (arr!2230 (_keys!4563 newMap!16)) (ite c!23857 (index!3260 lt!67161) (index!3257 lt!67161)) (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355)) (ite c!23857 (index!3260 lt!67161) (index!3257 lt!67161)))))))

(assert (=> b!130169 (isDefined!121 (getValueByKey!167 (toList!846 (getCurrentListMap!515 lt!67353 lt!67350 (mask!7100 newMap!16) (extraKeys!2596 newMap!16) (zeroValue!2682 newMap!16) (minValue!2682 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2823 newMap!16))) (select (store (arr!2230 (_keys!4563 newMap!16)) (ite c!23857 (index!3260 lt!67161) (index!3257 lt!67161)) (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355)) (ite c!23857 (index!3260 lt!67161) (index!3257 lt!67161)))))))

(declare-fun b!130170 () Bool)

(declare-fun Unit!4061 () Unit!4037)

(assert (=> b!130170 (= e!84910 Unit!4061)))

(declare-fun b!130171 () Bool)

(assert (=> b!130171 (= e!84911 (isDefined!121 (getValueByKey!167 (toList!846 (getCurrentListMap!515 lt!67353 lt!67350 (mask!7100 newMap!16) (extraKeys!2596 newMap!16) (zeroValue!2682 newMap!16) (minValue!2682 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2823 newMap!16))) (select (store (arr!2230 (_keys!4563 newMap!16)) (ite c!23857 (index!3260 lt!67161) (index!3257 lt!67161)) (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355)) (ite c!23857 (index!3260 lt!67161) (index!3257 lt!67161))))))))

(assert (= (and d!39541 c!24005) b!130169))

(assert (= (and d!39541 (not c!24005)) b!130170))

(assert (= (and d!39541 (not res!62745)) b!130171))

(assert (=> d!39541 m!152227))

(declare-fun m!152907 () Bool)

(assert (=> d!39541 m!152907))

(assert (=> b!130169 m!152227))

(declare-fun m!152909 () Bool)

(assert (=> b!130169 m!152909))

(assert (=> b!130169 m!152227))

(declare-fun m!152911 () Bool)

(assert (=> b!130169 m!152911))

(assert (=> b!130169 m!152911))

(declare-fun m!152913 () Bool)

(assert (=> b!130169 m!152913))

(assert (=> b!130171 m!152227))

(assert (=> b!130171 m!152911))

(assert (=> b!130171 m!152911))

(assert (=> b!130171 m!152913))

(assert (=> d!39371 d!39541))

(declare-fun d!39543 () Bool)

(declare-fun res!62746 () Bool)

(declare-fun e!84912 () Bool)

(assert (=> d!39543 (=> res!62746 e!84912)))

(assert (=> d!39543 (= res!62746 (= (select (arr!2230 lt!67361) #b00000000000000000000000000000000) (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355)))))

(assert (=> d!39543 (= (arrayContainsKey!0 lt!67361 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355) #b00000000000000000000000000000000) e!84912)))

(declare-fun b!130172 () Bool)

(declare-fun e!84913 () Bool)

(assert (=> b!130172 (= e!84912 e!84913)))

(declare-fun res!62747 () Bool)

(assert (=> b!130172 (=> (not res!62747) (not e!84913))))

(assert (=> b!130172 (= res!62747 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2497 lt!67361)))))

(declare-fun b!130173 () Bool)

(assert (=> b!130173 (= e!84913 (arrayContainsKey!0 lt!67361 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!39543 (not res!62746)) b!130172))

(assert (= (and b!130172 res!62747) b!130173))

(declare-fun m!152915 () Bool)

(assert (=> d!39543 m!152915))

(assert (=> b!130173 m!151753))

(declare-fun m!152917 () Bool)

(assert (=> b!130173 m!152917))

(assert (=> d!39371 d!39543))

(declare-fun d!39545 () Bool)

(assert (=> d!39545 (arrayContainsKey!0 lt!67361 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355) #b00000000000000000000000000000000)))

(declare-fun lt!67609 () Unit!4037)

(declare-fun choose!13 (array!4715 (_ BitVec 64) (_ BitVec 32)) Unit!4037)

(assert (=> d!39545 (= lt!67609 (choose!13 lt!67361 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355) (ite c!23857 (index!3260 lt!67161) (index!3257 lt!67161))))))

(assert (=> d!39545 (bvsge (ite c!23857 (index!3260 lt!67161) (index!3257 lt!67161)) #b00000000000000000000000000000000)))

(assert (=> d!39545 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!67361 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355) (ite c!23857 (index!3260 lt!67161) (index!3257 lt!67161))) lt!67609)))

(declare-fun bs!5388 () Bool)

(assert (= bs!5388 d!39545))

(assert (=> bs!5388 m!151753))

(assert (=> bs!5388 m!152257))

(assert (=> bs!5388 m!151753))

(declare-fun m!152919 () Bool)

(assert (=> bs!5388 m!152919))

(assert (=> d!39371 d!39545))

(declare-fun call!14166 () Bool)

(declare-fun bm!14163 () Bool)

(assert (=> bm!14163 (= call!14166 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (array!4716 (store (arr!2230 (_keys!4563 newMap!16)) (ite c!23857 (index!3260 lt!67161) (index!3257 lt!67161)) (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355)) (size!2497 (_keys!4563 newMap!16))) (mask!7100 newMap!16)))))

(declare-fun b!130174 () Bool)

(declare-fun e!84914 () Bool)

(assert (=> b!130174 (= e!84914 call!14166)))

(declare-fun b!130175 () Bool)

(declare-fun e!84915 () Bool)

(assert (=> b!130175 (= e!84915 call!14166)))

(declare-fun d!39547 () Bool)

(declare-fun res!62749 () Bool)

(declare-fun e!84916 () Bool)

(assert (=> d!39547 (=> res!62749 e!84916)))

(assert (=> d!39547 (= res!62749 (bvsge #b00000000000000000000000000000000 (size!2497 (array!4716 (store (arr!2230 (_keys!4563 newMap!16)) (ite c!23857 (index!3260 lt!67161) (index!3257 lt!67161)) (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355)) (size!2497 (_keys!4563 newMap!16))))))))

(assert (=> d!39547 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!4716 (store (arr!2230 (_keys!4563 newMap!16)) (ite c!23857 (index!3260 lt!67161) (index!3257 lt!67161)) (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355)) (size!2497 (_keys!4563 newMap!16))) (mask!7100 newMap!16)) e!84916)))

(declare-fun b!130176 () Bool)

(assert (=> b!130176 (= e!84916 e!84914)))

(declare-fun c!24006 () Bool)

(assert (=> b!130176 (= c!24006 (validKeyInArray!0 (select (arr!2230 (array!4716 (store (arr!2230 (_keys!4563 newMap!16)) (ite c!23857 (index!3260 lt!67161) (index!3257 lt!67161)) (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355)) (size!2497 (_keys!4563 newMap!16)))) #b00000000000000000000000000000000)))))

(declare-fun b!130177 () Bool)

(assert (=> b!130177 (= e!84914 e!84915)))

(declare-fun lt!67612 () (_ BitVec 64))

(assert (=> b!130177 (= lt!67612 (select (arr!2230 (array!4716 (store (arr!2230 (_keys!4563 newMap!16)) (ite c!23857 (index!3260 lt!67161) (index!3257 lt!67161)) (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355)) (size!2497 (_keys!4563 newMap!16)))) #b00000000000000000000000000000000))))

(declare-fun lt!67610 () Unit!4037)

(assert (=> b!130177 (= lt!67610 (lemmaArrayContainsFromImpliesContainsFromZero!0 (array!4716 (store (arr!2230 (_keys!4563 newMap!16)) (ite c!23857 (index!3260 lt!67161) (index!3257 lt!67161)) (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355)) (size!2497 (_keys!4563 newMap!16))) lt!67612 #b00000000000000000000000000000000))))

(assert (=> b!130177 (arrayContainsKey!0 (array!4716 (store (arr!2230 (_keys!4563 newMap!16)) (ite c!23857 (index!3260 lt!67161) (index!3257 lt!67161)) (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355)) (size!2497 (_keys!4563 newMap!16))) lt!67612 #b00000000000000000000000000000000)))

(declare-fun lt!67611 () Unit!4037)

(assert (=> b!130177 (= lt!67611 lt!67610)))

(declare-fun res!62748 () Bool)

(assert (=> b!130177 (= res!62748 (= (seekEntryOrOpen!0 (select (arr!2230 (array!4716 (store (arr!2230 (_keys!4563 newMap!16)) (ite c!23857 (index!3260 lt!67161) (index!3257 lt!67161)) (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355)) (size!2497 (_keys!4563 newMap!16)))) #b00000000000000000000000000000000) (array!4716 (store (arr!2230 (_keys!4563 newMap!16)) (ite c!23857 (index!3260 lt!67161) (index!3257 lt!67161)) (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355)) (size!2497 (_keys!4563 newMap!16))) (mask!7100 newMap!16)) (Found!275 #b00000000000000000000000000000000)))))

(assert (=> b!130177 (=> (not res!62748) (not e!84915))))

(assert (= (and d!39547 (not res!62749)) b!130176))

(assert (= (and b!130176 c!24006) b!130177))

(assert (= (and b!130176 (not c!24006)) b!130174))

(assert (= (and b!130177 res!62748) b!130175))

(assert (= (or b!130175 b!130174) bm!14163))

(declare-fun m!152921 () Bool)

(assert (=> bm!14163 m!152921))

(assert (=> b!130176 m!152773))

(assert (=> b!130176 m!152773))

(assert (=> b!130176 m!152775))

(assert (=> b!130177 m!152773))

(declare-fun m!152923 () Bool)

(assert (=> b!130177 m!152923))

(declare-fun m!152925 () Bool)

(assert (=> b!130177 m!152925))

(assert (=> b!130177 m!152773))

(declare-fun m!152927 () Bool)

(assert (=> b!130177 m!152927))

(assert (=> d!39371 d!39547))

(assert (=> d!39371 d!39421))

(declare-fun d!39549 () Bool)

(declare-fun e!84917 () Bool)

(assert (=> d!39549 e!84917))

(declare-fun res!62750 () Bool)

(assert (=> d!39549 (=> (not res!62750) (not e!84917))))

(assert (=> d!39549 (= res!62750 (and (bvsge (ite c!23857 (index!3260 lt!67161) (index!3257 lt!67161)) #b00000000000000000000000000000000) (bvslt (ite c!23857 (index!3260 lt!67161) (index!3257 lt!67161)) (size!2497 lt!67353))))))

(declare-fun lt!67613 () Unit!4037)

(assert (=> d!39549 (= lt!67613 (choose!794 lt!67353 lt!67350 (mask!7100 newMap!16) (extraKeys!2596 newMap!16) (zeroValue!2682 newMap!16) (minValue!2682 newMap!16) (ite c!23857 (index!3260 lt!67161) (index!3257 lt!67161)) (defaultEntry!2823 newMap!16)))))

(assert (=> d!39549 (validMask!0 (mask!7100 newMap!16))))

(assert (=> d!39549 (= (lemmaValidKeyInArrayIsInListMap!117 lt!67353 lt!67350 (mask!7100 newMap!16) (extraKeys!2596 newMap!16) (zeroValue!2682 newMap!16) (minValue!2682 newMap!16) (ite c!23857 (index!3260 lt!67161) (index!3257 lt!67161)) (defaultEntry!2823 newMap!16)) lt!67613)))

(declare-fun b!130178 () Bool)

(assert (=> b!130178 (= e!84917 (contains!876 (getCurrentListMap!515 lt!67353 lt!67350 (mask!7100 newMap!16) (extraKeys!2596 newMap!16) (zeroValue!2682 newMap!16) (minValue!2682 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2823 newMap!16)) (select (arr!2230 lt!67353) (ite c!23857 (index!3260 lt!67161) (index!3257 lt!67161)))))))

(assert (= (and d!39549 res!62750) b!130178))

(declare-fun m!152929 () Bool)

(assert (=> d!39549 m!152929))

(assert (=> d!39549 m!152025))

(assert (=> b!130178 m!152225))

(declare-fun m!152931 () Bool)

(assert (=> b!130178 m!152931))

(assert (=> b!130178 m!152225))

(assert (=> b!130178 m!152931))

(declare-fun m!152933 () Bool)

(assert (=> b!130178 m!152933))

(assert (=> d!39371 d!39549))

(declare-fun b!130179 () Bool)

(declare-fun e!84918 () (_ BitVec 32))

(declare-fun call!14167 () (_ BitVec 32))

(assert (=> b!130179 (= e!84918 call!14167)))

(declare-fun b!130181 () Bool)

(assert (=> b!130181 (= e!84918 (bvadd #b00000000000000000000000000000001 call!14167))))

(declare-fun b!130182 () Bool)

(declare-fun e!84919 () (_ BitVec 32))

(assert (=> b!130182 (= e!84919 #b00000000000000000000000000000000)))

(declare-fun bm!14164 () Bool)

(assert (=> bm!14164 (= call!14167 (arrayCountValidKeys!0 (array!4716 (store (arr!2230 (_keys!4563 newMap!16)) (ite c!23857 (index!3260 lt!67161) (index!3257 lt!67161)) (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355)) (size!2497 (_keys!4563 newMap!16))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2497 (_keys!4563 newMap!16))))))

(declare-fun lt!67614 () (_ BitVec 32))

(declare-fun d!39551 () Bool)

(assert (=> d!39551 (and (bvsge lt!67614 #b00000000000000000000000000000000) (bvsle lt!67614 (bvsub (size!2497 (array!4716 (store (arr!2230 (_keys!4563 newMap!16)) (ite c!23857 (index!3260 lt!67161) (index!3257 lt!67161)) (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355)) (size!2497 (_keys!4563 newMap!16)))) #b00000000000000000000000000000000)))))

(assert (=> d!39551 (= lt!67614 e!84919)))

(declare-fun c!24008 () Bool)

(assert (=> d!39551 (= c!24008 (bvsge #b00000000000000000000000000000000 (size!2497 (_keys!4563 newMap!16))))))

(assert (=> d!39551 (and (bvsle #b00000000000000000000000000000000 (size!2497 (_keys!4563 newMap!16))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!2497 (_keys!4563 newMap!16)) (size!2497 (array!4716 (store (arr!2230 (_keys!4563 newMap!16)) (ite c!23857 (index!3260 lt!67161) (index!3257 lt!67161)) (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355)) (size!2497 (_keys!4563 newMap!16))))))))

(assert (=> d!39551 (= (arrayCountValidKeys!0 (array!4716 (store (arr!2230 (_keys!4563 newMap!16)) (ite c!23857 (index!3260 lt!67161) (index!3257 lt!67161)) (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355)) (size!2497 (_keys!4563 newMap!16))) #b00000000000000000000000000000000 (size!2497 (_keys!4563 newMap!16))) lt!67614)))

(declare-fun b!130180 () Bool)

(assert (=> b!130180 (= e!84919 e!84918)))

(declare-fun c!24007 () Bool)

(assert (=> b!130180 (= c!24007 (validKeyInArray!0 (select (arr!2230 (array!4716 (store (arr!2230 (_keys!4563 newMap!16)) (ite c!23857 (index!3260 lt!67161) (index!3257 lt!67161)) (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355)) (size!2497 (_keys!4563 newMap!16)))) #b00000000000000000000000000000000)))))

(assert (= (and d!39551 c!24008) b!130182))

(assert (= (and d!39551 (not c!24008)) b!130180))

(assert (= (and b!130180 c!24007) b!130181))

(assert (= (and b!130180 (not c!24007)) b!130179))

(assert (= (or b!130181 b!130179) bm!14164))

(declare-fun m!152935 () Bool)

(assert (=> bm!14164 m!152935))

(assert (=> b!130180 m!152773))

(assert (=> b!130180 m!152773))

(assert (=> b!130180 m!152775))

(assert (=> d!39371 d!39551))

(declare-fun d!39553 () Bool)

(declare-fun e!84922 () Bool)

(assert (=> d!39553 e!84922))

(declare-fun res!62753 () Bool)

(assert (=> d!39553 (=> (not res!62753) (not e!84922))))

(assert (=> d!39553 (= res!62753 (and (bvsge (ite c!23857 (index!3260 lt!67161) (index!3257 lt!67161)) #b00000000000000000000000000000000) (bvslt (ite c!23857 (index!3260 lt!67161) (index!3257 lt!67161)) (size!2497 (_keys!4563 newMap!16)))))))

(declare-fun lt!67617 () Unit!4037)

(declare-fun choose!102 ((_ BitVec 64) array!4715 (_ BitVec 32) (_ BitVec 32)) Unit!4037)

(assert (=> d!39553 (= lt!67617 (choose!102 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355) (_keys!4563 newMap!16) (ite c!23857 (index!3260 lt!67161) (index!3257 lt!67161)) (mask!7100 newMap!16)))))

(assert (=> d!39553 (validMask!0 (mask!7100 newMap!16))))

(assert (=> d!39553 (= (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355) (_keys!4563 newMap!16) (ite c!23857 (index!3260 lt!67161) (index!3257 lt!67161)) (mask!7100 newMap!16)) lt!67617)))

(declare-fun b!130185 () Bool)

(assert (=> b!130185 (= e!84922 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!4716 (store (arr!2230 (_keys!4563 newMap!16)) (ite c!23857 (index!3260 lt!67161) (index!3257 lt!67161)) (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355)) (size!2497 (_keys!4563 newMap!16))) (mask!7100 newMap!16)))))

(assert (= (and d!39553 res!62753) b!130185))

(assert (=> d!39553 m!151753))

(declare-fun m!152937 () Bool)

(assert (=> d!39553 m!152937))

(assert (=> d!39553 m!152025))

(assert (=> b!130185 m!152233))

(assert (=> b!130185 m!152239))

(assert (=> d!39371 d!39553))

(declare-fun d!39555 () Bool)

(declare-fun res!62754 () Bool)

(declare-fun e!84923 () Bool)

(assert (=> d!39555 (=> res!62754 e!84923)))

(assert (=> d!39555 (= res!62754 (and ((_ is Cons!1697) (toList!846 (+!160 lt!67061 (tuple2!2567 lt!67073 (zeroValue!2682 (v!3153 (underlying!442 thiss!992))))))) (= (_1!1294 (h!2301 (toList!846 (+!160 lt!67061 (tuple2!2567 lt!67073 (zeroValue!2682 (v!3153 (underlying!442 thiss!992)))))))) lt!67063)))))

(assert (=> d!39555 (= (containsKey!171 (toList!846 (+!160 lt!67061 (tuple2!2567 lt!67073 (zeroValue!2682 (v!3153 (underlying!442 thiss!992)))))) lt!67063) e!84923)))

(declare-fun b!130186 () Bool)

(declare-fun e!84924 () Bool)

(assert (=> b!130186 (= e!84923 e!84924)))

(declare-fun res!62755 () Bool)

(assert (=> b!130186 (=> (not res!62755) (not e!84924))))

(assert (=> b!130186 (= res!62755 (and (or (not ((_ is Cons!1697) (toList!846 (+!160 lt!67061 (tuple2!2567 lt!67073 (zeroValue!2682 (v!3153 (underlying!442 thiss!992)))))))) (bvsle (_1!1294 (h!2301 (toList!846 (+!160 lt!67061 (tuple2!2567 lt!67073 (zeroValue!2682 (v!3153 (underlying!442 thiss!992)))))))) lt!67063)) ((_ is Cons!1697) (toList!846 (+!160 lt!67061 (tuple2!2567 lt!67073 (zeroValue!2682 (v!3153 (underlying!442 thiss!992))))))) (bvslt (_1!1294 (h!2301 (toList!846 (+!160 lt!67061 (tuple2!2567 lt!67073 (zeroValue!2682 (v!3153 (underlying!442 thiss!992)))))))) lt!67063)))))

(declare-fun b!130187 () Bool)

(assert (=> b!130187 (= e!84924 (containsKey!171 (t!6091 (toList!846 (+!160 lt!67061 (tuple2!2567 lt!67073 (zeroValue!2682 (v!3153 (underlying!442 thiss!992))))))) lt!67063))))

(assert (= (and d!39555 (not res!62754)) b!130186))

(assert (= (and b!130186 res!62755) b!130187))

(declare-fun m!152939 () Bool)

(assert (=> b!130187 m!152939))

(assert (=> d!39387 d!39555))

(declare-fun d!39557 () Bool)

(declare-fun e!84925 () Bool)

(assert (=> d!39557 e!84925))

(declare-fun res!62756 () Bool)

(assert (=> d!39557 (=> (not res!62756) (not e!84925))))

(declare-fun lt!67621 () ListLongMap!1661)

(assert (=> d!39557 (= res!62756 (contains!876 lt!67621 (_1!1294 (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2682 newMap!16)))))))

(declare-fun lt!67618 () List!1701)

(assert (=> d!39557 (= lt!67621 (ListLongMap!1662 lt!67618))))

(declare-fun lt!67619 () Unit!4037)

(declare-fun lt!67620 () Unit!4037)

(assert (=> d!39557 (= lt!67619 lt!67620)))

(assert (=> d!39557 (= (getValueByKey!167 lt!67618 (_1!1294 (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2682 newMap!16)))) (Some!172 (_2!1294 (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2682 newMap!16)))))))

(assert (=> d!39557 (= lt!67620 (lemmaContainsTupThenGetReturnValue!85 lt!67618 (_1!1294 (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2682 newMap!16))) (_2!1294 (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2682 newMap!16)))))))

(assert (=> d!39557 (= lt!67618 (insertStrictlySorted!88 (toList!846 call!14093) (_1!1294 (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2682 newMap!16))) (_2!1294 (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2682 newMap!16)))))))

(assert (=> d!39557 (= (+!160 call!14093 (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2682 newMap!16))) lt!67621)))

(declare-fun b!130188 () Bool)

(declare-fun res!62757 () Bool)

(assert (=> b!130188 (=> (not res!62757) (not e!84925))))

(assert (=> b!130188 (= res!62757 (= (getValueByKey!167 (toList!846 lt!67621) (_1!1294 (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2682 newMap!16)))) (Some!172 (_2!1294 (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2682 newMap!16))))))))

(declare-fun b!130189 () Bool)

(assert (=> b!130189 (= e!84925 (contains!878 (toList!846 lt!67621) (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2682 newMap!16))))))

(assert (= (and d!39557 res!62756) b!130188))

(assert (= (and b!130188 res!62757) b!130189))

(declare-fun m!152941 () Bool)

(assert (=> d!39557 m!152941))

(declare-fun m!152943 () Bool)

(assert (=> d!39557 m!152943))

(declare-fun m!152945 () Bool)

(assert (=> d!39557 m!152945))

(declare-fun m!152947 () Bool)

(assert (=> d!39557 m!152947))

(declare-fun m!152949 () Bool)

(assert (=> b!130188 m!152949))

(declare-fun m!152951 () Bool)

(assert (=> b!130189 m!152951))

(assert (=> b!129724 d!39557))

(declare-fun d!39559 () Bool)

(assert (=> d!39559 (= (size!2503 newMap!16) (bvadd (_size!588 newMap!16) (bvsdiv (bvadd (extraKeys!2596 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000010)))))

(assert (=> b!129882 d!39559))

(declare-fun call!14168 () Bool)

(declare-fun bm!14165 () Bool)

(declare-fun c!24009 () Bool)

(assert (=> bm!14165 (= call!14168 (arrayNoDuplicates!0 (_keys!4563 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!24009 (Cons!1699 (select (arr!2230 (_keys!4563 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!23938 (Cons!1699 (select (arr!2230 (_keys!4563 newMap!16)) #b00000000000000000000000000000000) Nil!1700) Nil!1700)) (ite c!23938 (Cons!1699 (select (arr!2230 (_keys!4563 newMap!16)) #b00000000000000000000000000000000) Nil!1700) Nil!1700))))))

(declare-fun b!130190 () Bool)

(declare-fun e!84928 () Bool)

(assert (=> b!130190 (= e!84928 call!14168)))

(declare-fun b!130191 () Bool)

(declare-fun e!84929 () Bool)

(declare-fun e!84927 () Bool)

(assert (=> b!130191 (= e!84929 e!84927)))

(declare-fun res!62760 () Bool)

(assert (=> b!130191 (=> (not res!62760) (not e!84927))))

(declare-fun e!84926 () Bool)

(assert (=> b!130191 (= res!62760 (not e!84926))))

(declare-fun res!62758 () Bool)

(assert (=> b!130191 (=> (not res!62758) (not e!84926))))

(assert (=> b!130191 (= res!62758 (validKeyInArray!0 (select (arr!2230 (_keys!4563 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!39561 () Bool)

(declare-fun res!62759 () Bool)

(assert (=> d!39561 (=> res!62759 e!84929)))

(assert (=> d!39561 (= res!62759 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2497 (_keys!4563 newMap!16))))))

(assert (=> d!39561 (= (arrayNoDuplicates!0 (_keys!4563 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!23938 (Cons!1699 (select (arr!2230 (_keys!4563 newMap!16)) #b00000000000000000000000000000000) Nil!1700) Nil!1700)) e!84929)))

(declare-fun b!130192 () Bool)

(assert (=> b!130192 (= e!84928 call!14168)))

(declare-fun b!130193 () Bool)

(assert (=> b!130193 (= e!84927 e!84928)))

(assert (=> b!130193 (= c!24009 (validKeyInArray!0 (select (arr!2230 (_keys!4563 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!130194 () Bool)

(assert (=> b!130194 (= e!84926 (contains!879 (ite c!23938 (Cons!1699 (select (arr!2230 (_keys!4563 newMap!16)) #b00000000000000000000000000000000) Nil!1700) Nil!1700) (select (arr!2230 (_keys!4563 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!39561 (not res!62759)) b!130191))

(assert (= (and b!130191 res!62758) b!130194))

(assert (= (and b!130191 res!62760) b!130193))

(assert (= (and b!130193 c!24009) b!130192))

(assert (= (and b!130193 (not c!24009)) b!130190))

(assert (= (or b!130192 b!130190) bm!14165))

(declare-fun m!152953 () Bool)

(assert (=> bm!14165 m!152953))

(declare-fun m!152955 () Bool)

(assert (=> bm!14165 m!152955))

(assert (=> b!130191 m!152953))

(assert (=> b!130191 m!152953))

(declare-fun m!152957 () Bool)

(assert (=> b!130191 m!152957))

(assert (=> b!130193 m!152953))

(assert (=> b!130193 m!152953))

(assert (=> b!130193 m!152957))

(assert (=> b!130194 m!152953))

(assert (=> b!130194 m!152953))

(declare-fun m!152959 () Bool)

(assert (=> b!130194 m!152959))

(assert (=> bm!14129 d!39561))

(declare-fun lt!67624 () Bool)

(declare-fun d!39563 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!129 (List!1701) (InoxSet tuple2!2566))

(assert (=> d!39563 (= lt!67624 (select (content!129 (toList!846 lt!67414)) (tuple2!2567 lt!67075 (zeroValue!2682 (v!3153 (underlying!442 thiss!992))))))))

(declare-fun e!84934 () Bool)

(assert (=> d!39563 (= lt!67624 e!84934)))

(declare-fun res!62766 () Bool)

(assert (=> d!39563 (=> (not res!62766) (not e!84934))))

(assert (=> d!39563 (= res!62766 ((_ is Cons!1697) (toList!846 lt!67414)))))

(assert (=> d!39563 (= (contains!878 (toList!846 lt!67414) (tuple2!2567 lt!67075 (zeroValue!2682 (v!3153 (underlying!442 thiss!992))))) lt!67624)))

(declare-fun b!130199 () Bool)

(declare-fun e!84935 () Bool)

(assert (=> b!130199 (= e!84934 e!84935)))

(declare-fun res!62765 () Bool)

(assert (=> b!130199 (=> res!62765 e!84935)))

(assert (=> b!130199 (= res!62765 (= (h!2301 (toList!846 lt!67414)) (tuple2!2567 lt!67075 (zeroValue!2682 (v!3153 (underlying!442 thiss!992))))))))

(declare-fun b!130200 () Bool)

(assert (=> b!130200 (= e!84935 (contains!878 (t!6091 (toList!846 lt!67414)) (tuple2!2567 lt!67075 (zeroValue!2682 (v!3153 (underlying!442 thiss!992))))))))

(assert (= (and d!39563 res!62766) b!130199))

(assert (= (and b!130199 (not res!62765)) b!130200))

(declare-fun m!152961 () Bool)

(assert (=> d!39563 m!152961))

(declare-fun m!152963 () Bool)

(assert (=> d!39563 m!152963))

(declare-fun m!152965 () Bool)

(assert (=> b!130200 m!152965))

(assert (=> b!129841 d!39563))

(declare-fun d!39565 () Bool)

(declare-fun res!62767 () Bool)

(declare-fun e!84936 () Bool)

(assert (=> d!39565 (=> res!62767 e!84936)))

(assert (=> d!39565 (= res!62767 (and ((_ is Cons!1697) (toList!846 lt!67071)) (= (_1!1294 (h!2301 (toList!846 lt!67071))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!39565 (= (containsKey!171 (toList!846 lt!67071) #b0000000000000000000000000000000000000000000000000000000000000000) e!84936)))

(declare-fun b!130201 () Bool)

(declare-fun e!84937 () Bool)

(assert (=> b!130201 (= e!84936 e!84937)))

(declare-fun res!62768 () Bool)

(assert (=> b!130201 (=> (not res!62768) (not e!84937))))

(assert (=> b!130201 (= res!62768 (and (or (not ((_ is Cons!1697) (toList!846 lt!67071))) (bvsle (_1!1294 (h!2301 (toList!846 lt!67071))) #b0000000000000000000000000000000000000000000000000000000000000000)) ((_ is Cons!1697) (toList!846 lt!67071)) (bvslt (_1!1294 (h!2301 (toList!846 lt!67071))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!130202 () Bool)

(assert (=> b!130202 (= e!84937 (containsKey!171 (t!6091 (toList!846 lt!67071)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!39565 (not res!62767)) b!130201))

(assert (= (and b!130201 res!62768) b!130202))

(declare-fun m!152967 () Bool)

(assert (=> b!130202 m!152967))

(assert (=> d!39443 d!39565))

(declare-fun d!39567 () Bool)

(assert (=> d!39567 (= (apply!113 lt!67387 (select (arr!2230 (_keys!4563 newMap!16)) #b00000000000000000000000000000000)) (get!1463 (getValueByKey!167 (toList!846 lt!67387) (select (arr!2230 (_keys!4563 newMap!16)) #b00000000000000000000000000000000))))))

(declare-fun bs!5389 () Bool)

(assert (= bs!5389 d!39567))

(assert (=> bs!5389 m!152019))

(declare-fun m!152969 () Bool)

(assert (=> bs!5389 m!152969))

(assert (=> bs!5389 m!152969))

(declare-fun m!152971 () Bool)

(assert (=> bs!5389 m!152971))

(assert (=> b!129814 d!39567))

(declare-fun c!24010 () Bool)

(declare-fun d!39569 () Bool)

(assert (=> d!39569 (= c!24010 ((_ is ValueCellFull!1085) (select (arr!2231 (ite (or c!23852 c!23854) (_values!2806 newMap!16) (array!4718 (store (arr!2231 (_values!2806 newMap!16)) (index!3258 lt!67161) (ValueCellFull!1085 (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2498 (_values!2806 newMap!16))))) #b00000000000000000000000000000000)))))

(declare-fun e!84938 () V!3457)

(assert (=> d!39569 (= (get!1459 (select (arr!2231 (ite (or c!23852 c!23854) (_values!2806 newMap!16) (array!4718 (store (arr!2231 (_values!2806 newMap!16)) (index!3258 lt!67161) (ValueCellFull!1085 (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2498 (_values!2806 newMap!16))))) #b00000000000000000000000000000000) (dynLambda!414 (defaultEntry!2823 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000)) e!84938)))

(declare-fun b!130203 () Bool)

(assert (=> b!130203 (= e!84938 (get!1461 (select (arr!2231 (ite (or c!23852 c!23854) (_values!2806 newMap!16) (array!4718 (store (arr!2231 (_values!2806 newMap!16)) (index!3258 lt!67161) (ValueCellFull!1085 (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2498 (_values!2806 newMap!16))))) #b00000000000000000000000000000000) (dynLambda!414 (defaultEntry!2823 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!130204 () Bool)

(assert (=> b!130204 (= e!84938 (get!1462 (select (arr!2231 (ite (or c!23852 c!23854) (_values!2806 newMap!16) (array!4718 (store (arr!2231 (_values!2806 newMap!16)) (index!3258 lt!67161) (ValueCellFull!1085 (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2498 (_values!2806 newMap!16))))) #b00000000000000000000000000000000) (dynLambda!414 (defaultEntry!2823 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!39569 c!24010) b!130203))

(assert (= (and d!39569 (not c!24010)) b!130204))

(assert (=> b!130203 m!152319))

(assert (=> b!130203 m!152071))

(declare-fun m!152973 () Bool)

(assert (=> b!130203 m!152973))

(assert (=> b!130204 m!152319))

(assert (=> b!130204 m!152071))

(declare-fun m!152975 () Bool)

(assert (=> b!130204 m!152975))

(assert (=> b!129814 d!39569))

(declare-fun d!39571 () Bool)

(declare-fun e!84940 () Bool)

(assert (=> d!39571 e!84940))

(declare-fun res!62769 () Bool)

(assert (=> d!39571 (=> res!62769 e!84940)))

(declare-fun lt!67627 () Bool)

(assert (=> d!39571 (= res!62769 (not lt!67627))))

(declare-fun lt!67628 () Bool)

(assert (=> d!39571 (= lt!67627 lt!67628)))

(declare-fun lt!67625 () Unit!4037)

(declare-fun e!84939 () Unit!4037)

(assert (=> d!39571 (= lt!67625 e!84939)))

(declare-fun c!24011 () Bool)

(assert (=> d!39571 (= c!24011 lt!67628)))

(assert (=> d!39571 (= lt!67628 (containsKey!171 (toList!846 (getCurrentListMap!515 (_keys!4563 newMap!16) lt!67158 (mask!7100 newMap!16) (extraKeys!2596 newMap!16) (zeroValue!2682 newMap!16) (minValue!2682 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2823 newMap!16))) (select (arr!2230 (_keys!4563 newMap!16)) (index!3258 lt!67161))))))

(assert (=> d!39571 (= (contains!876 (getCurrentListMap!515 (_keys!4563 newMap!16) lt!67158 (mask!7100 newMap!16) (extraKeys!2596 newMap!16) (zeroValue!2682 newMap!16) (minValue!2682 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2823 newMap!16)) (select (arr!2230 (_keys!4563 newMap!16)) (index!3258 lt!67161))) lt!67627)))

(declare-fun b!130205 () Bool)

(declare-fun lt!67626 () Unit!4037)

(assert (=> b!130205 (= e!84939 lt!67626)))

(assert (=> b!130205 (= lt!67626 (lemmaContainsKeyImpliesGetValueByKeyDefined!120 (toList!846 (getCurrentListMap!515 (_keys!4563 newMap!16) lt!67158 (mask!7100 newMap!16) (extraKeys!2596 newMap!16) (zeroValue!2682 newMap!16) (minValue!2682 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2823 newMap!16))) (select (arr!2230 (_keys!4563 newMap!16)) (index!3258 lt!67161))))))

(assert (=> b!130205 (isDefined!121 (getValueByKey!167 (toList!846 (getCurrentListMap!515 (_keys!4563 newMap!16) lt!67158 (mask!7100 newMap!16) (extraKeys!2596 newMap!16) (zeroValue!2682 newMap!16) (minValue!2682 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2823 newMap!16))) (select (arr!2230 (_keys!4563 newMap!16)) (index!3258 lt!67161))))))

(declare-fun b!130206 () Bool)

(declare-fun Unit!4062 () Unit!4037)

(assert (=> b!130206 (= e!84939 Unit!4062)))

(declare-fun b!130207 () Bool)

(assert (=> b!130207 (= e!84940 (isDefined!121 (getValueByKey!167 (toList!846 (getCurrentListMap!515 (_keys!4563 newMap!16) lt!67158 (mask!7100 newMap!16) (extraKeys!2596 newMap!16) (zeroValue!2682 newMap!16) (minValue!2682 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2823 newMap!16))) (select (arr!2230 (_keys!4563 newMap!16)) (index!3258 lt!67161)))))))

(assert (= (and d!39571 c!24011) b!130205))

(assert (= (and d!39571 (not c!24011)) b!130206))

(assert (= (and d!39571 (not res!62769)) b!130207))

(assert (=> d!39571 m!151925))

(declare-fun m!152977 () Bool)

(assert (=> d!39571 m!152977))

(assert (=> b!130205 m!151925))

(declare-fun m!152979 () Bool)

(assert (=> b!130205 m!152979))

(assert (=> b!130205 m!151925))

(declare-fun m!152981 () Bool)

(assert (=> b!130205 m!152981))

(assert (=> b!130205 m!152981))

(declare-fun m!152983 () Bool)

(assert (=> b!130205 m!152983))

(assert (=> b!130207 m!151925))

(assert (=> b!130207 m!152981))

(assert (=> b!130207 m!152981))

(assert (=> b!130207 m!152983))

(assert (=> b!129745 d!39571))

(declare-fun b!130208 () Bool)

(declare-fun res!62778 () Bool)

(declare-fun e!84951 () Bool)

(assert (=> b!130208 (=> (not res!62778) (not e!84951))))

(declare-fun e!84948 () Bool)

(assert (=> b!130208 (= res!62778 e!84948)))

(declare-fun res!62771 () Bool)

(assert (=> b!130208 (=> res!62771 e!84948)))

(declare-fun e!84944 () Bool)

(assert (=> b!130208 (= res!62771 (not e!84944))))

(declare-fun res!62776 () Bool)

(assert (=> b!130208 (=> (not res!62776) (not e!84944))))

(assert (=> b!130208 (= res!62776 (bvslt #b00000000000000000000000000000000 (size!2497 (_keys!4563 newMap!16))))))

(declare-fun b!130209 () Bool)

(declare-fun e!84953 () Bool)

(declare-fun lt!67644 () ListLongMap!1661)

(assert (=> b!130209 (= e!84953 (= (apply!113 lt!67644 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2682 newMap!16)))))

(declare-fun b!130210 () Bool)

(declare-fun e!84949 () Bool)

(assert (=> b!130210 (= e!84949 e!84953)))

(declare-fun res!62775 () Bool)

(declare-fun call!14171 () Bool)

(assert (=> b!130210 (= res!62775 call!14171)))

(assert (=> b!130210 (=> (not res!62775) (not e!84953))))

(declare-fun b!130211 () Bool)

(declare-fun e!84942 () Bool)

(assert (=> b!130211 (= e!84948 e!84942)))

(declare-fun res!62773 () Bool)

(assert (=> b!130211 (=> (not res!62773) (not e!84942))))

(assert (=> b!130211 (= res!62773 (contains!876 lt!67644 (select (arr!2230 (_keys!4563 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!130211 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2497 (_keys!4563 newMap!16))))))

(declare-fun bm!14166 () Bool)

(declare-fun call!14174 () ListLongMap!1661)

(declare-fun call!14173 () ListLongMap!1661)

(assert (=> bm!14166 (= call!14174 call!14173)))

(declare-fun b!130212 () Bool)

(declare-fun e!84941 () Bool)

(declare-fun e!84943 () Bool)

(assert (=> b!130212 (= e!84941 e!84943)))

(declare-fun res!62774 () Bool)

(declare-fun call!14169 () Bool)

(assert (=> b!130212 (= res!62774 call!14169)))

(assert (=> b!130212 (=> (not res!62774) (not e!84943))))

(declare-fun b!130214 () Bool)

(declare-fun e!84952 () ListLongMap!1661)

(declare-fun call!14175 () ListLongMap!1661)

(assert (=> b!130214 (= e!84952 call!14175)))

(declare-fun b!130215 () Bool)

(declare-fun e!84945 () Bool)

(assert (=> b!130215 (= e!84945 (validKeyInArray!0 (select (arr!2230 (_keys!4563 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun bm!14167 () Bool)

(assert (=> bm!14167 (= call!14173 (getCurrentListMapNoExtraKeys!125 (_keys!4563 newMap!16) lt!67158 (mask!7100 newMap!16) (extraKeys!2596 newMap!16) (zeroValue!2682 newMap!16) (minValue!2682 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2823 newMap!16)))))

(declare-fun bm!14168 () Bool)

(assert (=> bm!14168 (= call!14169 (contains!876 lt!67644 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!130216 () Bool)

(assert (=> b!130216 (= e!84942 (= (apply!113 lt!67644 (select (arr!2230 (_keys!4563 newMap!16)) #b00000000000000000000000000000000)) (get!1459 (select (arr!2231 lt!67158) #b00000000000000000000000000000000) (dynLambda!414 (defaultEntry!2823 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!130216 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2498 lt!67158)))))

(assert (=> b!130216 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2497 (_keys!4563 newMap!16))))))

(declare-fun b!130217 () Bool)

(assert (=> b!130217 (= e!84951 e!84941)))

(declare-fun c!24013 () Bool)

(assert (=> b!130217 (= c!24013 (not (= (bvand (extraKeys!2596 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!130218 () Bool)

(assert (=> b!130218 (= e!84949 (not call!14171))))

(declare-fun b!130219 () Bool)

(declare-fun e!84947 () Unit!4037)

(declare-fun Unit!4063 () Unit!4037)

(assert (=> b!130219 (= e!84947 Unit!4063)))

(declare-fun b!130220 () Bool)

(declare-fun e!84950 () ListLongMap!1661)

(declare-fun call!14172 () ListLongMap!1661)

(assert (=> b!130220 (= e!84950 call!14172)))

(declare-fun bm!14169 () Bool)

(declare-fun call!14170 () ListLongMap!1661)

(assert (=> bm!14169 (= call!14172 call!14170)))

(declare-fun b!130221 () Bool)

(declare-fun lt!67638 () Unit!4037)

(assert (=> b!130221 (= e!84947 lt!67638)))

(declare-fun lt!67634 () ListLongMap!1661)

(assert (=> b!130221 (= lt!67634 (getCurrentListMapNoExtraKeys!125 (_keys!4563 newMap!16) lt!67158 (mask!7100 newMap!16) (extraKeys!2596 newMap!16) (zeroValue!2682 newMap!16) (minValue!2682 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2823 newMap!16)))))

(declare-fun lt!67646 () (_ BitVec 64))

(assert (=> b!130221 (= lt!67646 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!67636 () (_ BitVec 64))

(assert (=> b!130221 (= lt!67636 (select (arr!2230 (_keys!4563 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!67635 () Unit!4037)

(assert (=> b!130221 (= lt!67635 (addStillContains!89 lt!67634 lt!67646 (zeroValue!2682 newMap!16) lt!67636))))

(assert (=> b!130221 (contains!876 (+!160 lt!67634 (tuple2!2567 lt!67646 (zeroValue!2682 newMap!16))) lt!67636)))

(declare-fun lt!67637 () Unit!4037)

(assert (=> b!130221 (= lt!67637 lt!67635)))

(declare-fun lt!67647 () ListLongMap!1661)

(assert (=> b!130221 (= lt!67647 (getCurrentListMapNoExtraKeys!125 (_keys!4563 newMap!16) lt!67158 (mask!7100 newMap!16) (extraKeys!2596 newMap!16) (zeroValue!2682 newMap!16) (minValue!2682 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2823 newMap!16)))))

(declare-fun lt!67629 () (_ BitVec 64))

(assert (=> b!130221 (= lt!67629 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!67639 () (_ BitVec 64))

(assert (=> b!130221 (= lt!67639 (select (arr!2230 (_keys!4563 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!67649 () Unit!4037)

(assert (=> b!130221 (= lt!67649 (addApplyDifferent!89 lt!67647 lt!67629 (minValue!2682 newMap!16) lt!67639))))

(assert (=> b!130221 (= (apply!113 (+!160 lt!67647 (tuple2!2567 lt!67629 (minValue!2682 newMap!16))) lt!67639) (apply!113 lt!67647 lt!67639))))

(declare-fun lt!67645 () Unit!4037)

(assert (=> b!130221 (= lt!67645 lt!67649)))

(declare-fun lt!67632 () ListLongMap!1661)

(assert (=> b!130221 (= lt!67632 (getCurrentListMapNoExtraKeys!125 (_keys!4563 newMap!16) lt!67158 (mask!7100 newMap!16) (extraKeys!2596 newMap!16) (zeroValue!2682 newMap!16) (minValue!2682 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2823 newMap!16)))))

(declare-fun lt!67648 () (_ BitVec 64))

(assert (=> b!130221 (= lt!67648 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!67641 () (_ BitVec 64))

(assert (=> b!130221 (= lt!67641 (select (arr!2230 (_keys!4563 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!67643 () Unit!4037)

(assert (=> b!130221 (= lt!67643 (addApplyDifferent!89 lt!67632 lt!67648 (zeroValue!2682 newMap!16) lt!67641))))

(assert (=> b!130221 (= (apply!113 (+!160 lt!67632 (tuple2!2567 lt!67648 (zeroValue!2682 newMap!16))) lt!67641) (apply!113 lt!67632 lt!67641))))

(declare-fun lt!67642 () Unit!4037)

(assert (=> b!130221 (= lt!67642 lt!67643)))

(declare-fun lt!67640 () ListLongMap!1661)

(assert (=> b!130221 (= lt!67640 (getCurrentListMapNoExtraKeys!125 (_keys!4563 newMap!16) lt!67158 (mask!7100 newMap!16) (extraKeys!2596 newMap!16) (zeroValue!2682 newMap!16) (minValue!2682 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2823 newMap!16)))))

(declare-fun lt!67633 () (_ BitVec 64))

(assert (=> b!130221 (= lt!67633 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!67650 () (_ BitVec 64))

(assert (=> b!130221 (= lt!67650 (select (arr!2230 (_keys!4563 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!130221 (= lt!67638 (addApplyDifferent!89 lt!67640 lt!67633 (minValue!2682 newMap!16) lt!67650))))

(assert (=> b!130221 (= (apply!113 (+!160 lt!67640 (tuple2!2567 lt!67633 (minValue!2682 newMap!16))) lt!67650) (apply!113 lt!67640 lt!67650))))

(declare-fun b!130222 () Bool)

(assert (=> b!130222 (= e!84944 (validKeyInArray!0 (select (arr!2230 (_keys!4563 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!130223 () Bool)

(declare-fun c!24016 () Bool)

(assert (=> b!130223 (= c!24016 (and (not (= (bvand (extraKeys!2596 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2596 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!130223 (= e!84950 e!84952)))

(declare-fun b!130224 () Bool)

(declare-fun res!62777 () Bool)

(assert (=> b!130224 (=> (not res!62777) (not e!84951))))

(assert (=> b!130224 (= res!62777 e!84949)))

(declare-fun c!24014 () Bool)

(assert (=> b!130224 (= c!24014 (not (= (bvand (extraKeys!2596 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!130225 () Bool)

(assert (=> b!130225 (= e!84952 call!14172)))

(declare-fun bm!14170 () Bool)

(assert (=> bm!14170 (= call!14175 call!14174)))

(declare-fun b!130226 () Bool)

(assert (=> b!130226 (= e!84943 (= (apply!113 lt!67644 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2682 newMap!16)))))

(declare-fun b!130213 () Bool)

(declare-fun e!84946 () ListLongMap!1661)

(assert (=> b!130213 (= e!84946 (+!160 call!14170 (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2682 newMap!16))))))

(declare-fun d!39573 () Bool)

(assert (=> d!39573 e!84951))

(declare-fun res!62772 () Bool)

(assert (=> d!39573 (=> (not res!62772) (not e!84951))))

(assert (=> d!39573 (= res!62772 (or (bvsge #b00000000000000000000000000000000 (size!2497 (_keys!4563 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2497 (_keys!4563 newMap!16))))))))

(declare-fun lt!67630 () ListLongMap!1661)

(assert (=> d!39573 (= lt!67644 lt!67630)))

(declare-fun lt!67631 () Unit!4037)

(assert (=> d!39573 (= lt!67631 e!84947)))

(declare-fun c!24012 () Bool)

(assert (=> d!39573 (= c!24012 e!84945)))

(declare-fun res!62770 () Bool)

(assert (=> d!39573 (=> (not res!62770) (not e!84945))))

(assert (=> d!39573 (= res!62770 (bvslt #b00000000000000000000000000000000 (size!2497 (_keys!4563 newMap!16))))))

(assert (=> d!39573 (= lt!67630 e!84946)))

(declare-fun c!24017 () Bool)

(assert (=> d!39573 (= c!24017 (and (not (= (bvand (extraKeys!2596 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2596 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!39573 (validMask!0 (mask!7100 newMap!16))))

(assert (=> d!39573 (= (getCurrentListMap!515 (_keys!4563 newMap!16) lt!67158 (mask!7100 newMap!16) (extraKeys!2596 newMap!16) (zeroValue!2682 newMap!16) (minValue!2682 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2823 newMap!16)) lt!67644)))

(declare-fun bm!14171 () Bool)

(assert (=> bm!14171 (= call!14171 (contains!876 lt!67644 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!130227 () Bool)

(assert (=> b!130227 (= e!84946 e!84950)))

(declare-fun c!24015 () Bool)

(assert (=> b!130227 (= c!24015 (and (not (= (bvand (extraKeys!2596 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2596 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!14172 () Bool)

(assert (=> bm!14172 (= call!14170 (+!160 (ite c!24017 call!14173 (ite c!24015 call!14174 call!14175)) (ite (or c!24017 c!24015) (tuple2!2567 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2682 newMap!16)) (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2682 newMap!16)))))))

(declare-fun b!130228 () Bool)

(assert (=> b!130228 (= e!84941 (not call!14169))))

(assert (= (and d!39573 c!24017) b!130213))

(assert (= (and d!39573 (not c!24017)) b!130227))

(assert (= (and b!130227 c!24015) b!130220))

(assert (= (and b!130227 (not c!24015)) b!130223))

(assert (= (and b!130223 c!24016) b!130225))

(assert (= (and b!130223 (not c!24016)) b!130214))

(assert (= (or b!130225 b!130214) bm!14170))

(assert (= (or b!130220 bm!14170) bm!14166))

(assert (= (or b!130220 b!130225) bm!14169))

(assert (= (or b!130213 bm!14166) bm!14167))

(assert (= (or b!130213 bm!14169) bm!14172))

(assert (= (and d!39573 res!62770) b!130215))

(assert (= (and d!39573 c!24012) b!130221))

(assert (= (and d!39573 (not c!24012)) b!130219))

(assert (= (and d!39573 res!62772) b!130208))

(assert (= (and b!130208 res!62776) b!130222))

(assert (= (and b!130208 (not res!62771)) b!130211))

(assert (= (and b!130211 res!62773) b!130216))

(assert (= (and b!130208 res!62778) b!130224))

(assert (= (and b!130224 c!24014) b!130210))

(assert (= (and b!130224 (not c!24014)) b!130218))

(assert (= (and b!130210 res!62775) b!130209))

(assert (= (or b!130210 b!130218) bm!14171))

(assert (= (and b!130224 res!62777) b!130217))

(assert (= (and b!130217 c!24013) b!130212))

(assert (= (and b!130217 (not c!24013)) b!130228))

(assert (= (and b!130212 res!62774) b!130226))

(assert (= (or b!130212 b!130228) bm!14168))

(declare-fun b_lambda!5773 () Bool)

(assert (=> (not b_lambda!5773) (not b!130216)))

(assert (=> b!130216 t!6103))

(declare-fun b_and!8045 () Bool)

(assert (= b_and!8041 (and (=> t!6103 result!3917) b_and!8045)))

(assert (=> b!130216 t!6105))

(declare-fun b_and!8047 () Bool)

(assert (= b_and!8043 (and (=> t!6105 result!3919) b_and!8047)))

(declare-fun m!152985 () Bool)

(assert (=> bm!14168 m!152985))

(declare-fun m!152987 () Bool)

(assert (=> bm!14167 m!152987))

(assert (=> b!130222 m!152019))

(assert (=> b!130222 m!152019))

(assert (=> b!130222 m!152021))

(declare-fun m!152989 () Bool)

(assert (=> b!130213 m!152989))

(assert (=> d!39573 m!152025))

(declare-fun m!152991 () Bool)

(assert (=> b!130209 m!152991))

(assert (=> b!130215 m!152019))

(assert (=> b!130215 m!152019))

(assert (=> b!130215 m!152021))

(declare-fun m!152993 () Bool)

(assert (=> b!130226 m!152993))

(declare-fun m!152995 () Bool)

(assert (=> bm!14172 m!152995))

(declare-fun m!152997 () Bool)

(assert (=> b!130221 m!152997))

(declare-fun m!152999 () Bool)

(assert (=> b!130221 m!152999))

(declare-fun m!153001 () Bool)

(assert (=> b!130221 m!153001))

(declare-fun m!153003 () Bool)

(assert (=> b!130221 m!153003))

(declare-fun m!153005 () Bool)

(assert (=> b!130221 m!153005))

(declare-fun m!153007 () Bool)

(assert (=> b!130221 m!153007))

(assert (=> b!130221 m!152987))

(declare-fun m!153009 () Bool)

(assert (=> b!130221 m!153009))

(assert (=> b!130221 m!152019))

(declare-fun m!153011 () Bool)

(assert (=> b!130221 m!153011))

(declare-fun m!153013 () Bool)

(assert (=> b!130221 m!153013))

(declare-fun m!153015 () Bool)

(assert (=> b!130221 m!153015))

(assert (=> b!130221 m!153007))

(declare-fun m!153017 () Bool)

(assert (=> b!130221 m!153017))

(assert (=> b!130221 m!153001))

(declare-fun m!153019 () Bool)

(assert (=> b!130221 m!153019))

(declare-fun m!153021 () Bool)

(assert (=> b!130221 m!153021))

(declare-fun m!153023 () Bool)

(assert (=> b!130221 m!153023))

(assert (=> b!130221 m!153013))

(assert (=> b!130221 m!153011))

(declare-fun m!153025 () Bool)

(assert (=> b!130221 m!153025))

(declare-fun m!153027 () Bool)

(assert (=> bm!14171 m!153027))

(assert (=> b!130211 m!152019))

(assert (=> b!130211 m!152019))

(declare-fun m!153029 () Bool)

(assert (=> b!130211 m!153029))

(assert (=> b!130216 m!152019))

(declare-fun m!153031 () Bool)

(assert (=> b!130216 m!153031))

(assert (=> b!130216 m!152019))

(declare-fun m!153033 () Bool)

(assert (=> b!130216 m!153033))

(assert (=> b!130216 m!153031))

(assert (=> b!130216 m!152071))

(declare-fun m!153035 () Bool)

(assert (=> b!130216 m!153035))

(assert (=> b!130216 m!152071))

(assert (=> b!129745 d!39573))

(declare-fun d!39575 () Bool)

(assert (=> d!39575 (= (apply!113 lt!67211 #b0000000000000000000000000000000000000000000000000000000000000000) (get!1463 (getValueByKey!167 (toList!846 lt!67211) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!5390 () Bool)

(assert (= bs!5390 d!39575))

(declare-fun m!153037 () Bool)

(assert (=> bs!5390 m!153037))

(assert (=> bs!5390 m!153037))

(declare-fun m!153039 () Bool)

(assert (=> bs!5390 m!153039))

(assert (=> b!129665 d!39575))

(declare-fun b!130231 () Bool)

(declare-fun e!84955 () Option!173)

(assert (=> b!130231 (= e!84955 (getValueByKey!167 (t!6091 (toList!846 lt!67444)) (_1!1294 (tuple2!2567 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!130229 () Bool)

(declare-fun e!84954 () Option!173)

(assert (=> b!130229 (= e!84954 (Some!172 (_2!1294 (h!2301 (toList!846 lt!67444)))))))

(declare-fun d!39577 () Bool)

(declare-fun c!24018 () Bool)

(assert (=> d!39577 (= c!24018 (and ((_ is Cons!1697) (toList!846 lt!67444)) (= (_1!1294 (h!2301 (toList!846 lt!67444))) (_1!1294 (tuple2!2567 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!39577 (= (getValueByKey!167 (toList!846 lt!67444) (_1!1294 (tuple2!2567 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) e!84954)))

(declare-fun b!130230 () Bool)

(assert (=> b!130230 (= e!84954 e!84955)))

(declare-fun c!24019 () Bool)

(assert (=> b!130230 (= c!24019 (and ((_ is Cons!1697) (toList!846 lt!67444)) (not (= (_1!1294 (h!2301 (toList!846 lt!67444))) (_1!1294 (tuple2!2567 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(declare-fun b!130232 () Bool)

(assert (=> b!130232 (= e!84955 None!171)))

(assert (= (and d!39577 c!24018) b!130229))

(assert (= (and d!39577 (not c!24018)) b!130230))

(assert (= (and b!130230 c!24019) b!130231))

(assert (= (and b!130230 (not c!24019)) b!130232))

(declare-fun m!153041 () Bool)

(assert (=> b!130231 m!153041))

(assert (=> b!129890 d!39577))

(declare-fun bm!14173 () Bool)

(declare-fun call!14176 () Bool)

(assert (=> bm!14173 (= call!14176 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!4563 (v!3153 (underlying!442 thiss!992))) (mask!7100 (v!3153 (underlying!442 thiss!992)))))))

(declare-fun b!130233 () Bool)

(declare-fun e!84956 () Bool)

(assert (=> b!130233 (= e!84956 call!14176)))

(declare-fun b!130234 () Bool)

(declare-fun e!84957 () Bool)

(assert (=> b!130234 (= e!84957 call!14176)))

(declare-fun d!39579 () Bool)

(declare-fun res!62780 () Bool)

(declare-fun e!84958 () Bool)

(assert (=> d!39579 (=> res!62780 e!84958)))

(assert (=> d!39579 (= res!62780 (bvsge #b00000000000000000000000000000000 (size!2497 (_keys!4563 (v!3153 (underlying!442 thiss!992))))))))

(assert (=> d!39579 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4563 (v!3153 (underlying!442 thiss!992))) (mask!7100 (v!3153 (underlying!442 thiss!992)))) e!84958)))

(declare-fun b!130235 () Bool)

(assert (=> b!130235 (= e!84958 e!84956)))

(declare-fun c!24020 () Bool)

(assert (=> b!130235 (= c!24020 (validKeyInArray!0 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun b!130236 () Bool)

(assert (=> b!130236 (= e!84956 e!84957)))

(declare-fun lt!67653 () (_ BitVec 64))

(assert (=> b!130236 (= lt!67653 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) #b00000000000000000000000000000000))))

(declare-fun lt!67651 () Unit!4037)

(assert (=> b!130236 (= lt!67651 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!4563 (v!3153 (underlying!442 thiss!992))) lt!67653 #b00000000000000000000000000000000))))

(assert (=> b!130236 (arrayContainsKey!0 (_keys!4563 (v!3153 (underlying!442 thiss!992))) lt!67653 #b00000000000000000000000000000000)))

(declare-fun lt!67652 () Unit!4037)

(assert (=> b!130236 (= lt!67652 lt!67651)))

(declare-fun res!62779 () Bool)

(assert (=> b!130236 (= res!62779 (= (seekEntryOrOpen!0 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) #b00000000000000000000000000000000) (_keys!4563 (v!3153 (underlying!442 thiss!992))) (mask!7100 (v!3153 (underlying!442 thiss!992)))) (Found!275 #b00000000000000000000000000000000)))))

(assert (=> b!130236 (=> (not res!62779) (not e!84957))))

(assert (= (and d!39579 (not res!62780)) b!130235))

(assert (= (and b!130235 c!24020) b!130236))

(assert (= (and b!130235 (not c!24020)) b!130233))

(assert (= (and b!130236 res!62779) b!130234))

(assert (= (or b!130234 b!130233) bm!14173))

(declare-fun m!153043 () Bool)

(assert (=> bm!14173 m!153043))

(declare-fun m!153045 () Bool)

(assert (=> b!130235 m!153045))

(assert (=> b!130235 m!153045))

(declare-fun m!153047 () Bool)

(assert (=> b!130235 m!153047))

(assert (=> b!130236 m!153045))

(declare-fun m!153049 () Bool)

(assert (=> b!130236 m!153049))

(declare-fun m!153051 () Bool)

(assert (=> b!130236 m!153051))

(assert (=> b!130236 m!153045))

(declare-fun m!153053 () Bool)

(assert (=> b!130236 m!153053))

(assert (=> b!129893 d!39579))

(declare-fun d!39581 () Bool)

(assert (=> d!39581 (contains!876 (getCurrentListMap!515 (_keys!4563 newMap!16) (_values!2806 newMap!16) (mask!7100 newMap!16) (extraKeys!2596 newMap!16) (zeroValue!2682 newMap!16) (minValue!2682 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2823 newMap!16)) (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355))))

(declare-fun lt!67656 () Unit!4037)

(declare-fun choose!804 (array!4715 array!4717 (_ BitVec 32) (_ BitVec 32) V!3457 V!3457 (_ BitVec 64) (_ BitVec 32) Int) Unit!4037)

(assert (=> d!39581 (= lt!67656 (choose!804 (_keys!4563 newMap!16) (_values!2806 newMap!16) (mask!7100 newMap!16) (extraKeys!2596 newMap!16) (zeroValue!2682 newMap!16) (minValue!2682 newMap!16) (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355) #b00000000000000000000000000000000 (defaultEntry!2823 newMap!16)))))

(assert (=> d!39581 (validMask!0 (mask!7100 newMap!16))))

(assert (=> d!39581 (= (lemmaArrayContainsKeyThenInListMap!39 (_keys!4563 newMap!16) (_values!2806 newMap!16) (mask!7100 newMap!16) (extraKeys!2596 newMap!16) (zeroValue!2682 newMap!16) (minValue!2682 newMap!16) (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355) #b00000000000000000000000000000000 (defaultEntry!2823 newMap!16)) lt!67656)))

(declare-fun bs!5391 () Bool)

(assert (= bs!5391 d!39581))

(assert (=> bs!5391 m!151849))

(assert (=> bs!5391 m!151849))

(assert (=> bs!5391 m!151753))

(assert (=> bs!5391 m!151967))

(assert (=> bs!5391 m!151753))

(declare-fun m!153055 () Bool)

(assert (=> bs!5391 m!153055))

(assert (=> bs!5391 m!152025))

(assert (=> b!129793 d!39581))

(assert (=> b!129793 d!39367))

(assert (=> b!129793 d!39339))

(declare-fun e!84960 () Option!173)

(declare-fun b!130239 () Bool)

(assert (=> b!130239 (= e!84960 (getValueByKey!167 (t!6091 (toList!846 lt!67245)) (_1!1294 (ite c!23852 (ite c!23848 (tuple2!2567 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2567 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!130237 () Bool)

(declare-fun e!84959 () Option!173)

(assert (=> b!130237 (= e!84959 (Some!172 (_2!1294 (h!2301 (toList!846 lt!67245)))))))

(declare-fun c!24021 () Bool)

(declare-fun d!39583 () Bool)

(assert (=> d!39583 (= c!24021 (and ((_ is Cons!1697) (toList!846 lt!67245)) (= (_1!1294 (h!2301 (toList!846 lt!67245))) (_1!1294 (ite c!23852 (ite c!23848 (tuple2!2567 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2567 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(assert (=> d!39583 (= (getValueByKey!167 (toList!846 lt!67245) (_1!1294 (ite c!23852 (ite c!23848 (tuple2!2567 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2567 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))) e!84959)))

(declare-fun b!130238 () Bool)

(assert (=> b!130238 (= e!84959 e!84960)))

(declare-fun c!24022 () Bool)

(assert (=> b!130238 (= c!24022 (and ((_ is Cons!1697) (toList!846 lt!67245)) (not (= (_1!1294 (h!2301 (toList!846 lt!67245))) (_1!1294 (ite c!23852 (ite c!23848 (tuple2!2567 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2567 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))))

(declare-fun b!130240 () Bool)

(assert (=> b!130240 (= e!84960 None!171)))

(assert (= (and d!39583 c!24021) b!130237))

(assert (= (and d!39583 (not c!24021)) b!130238))

(assert (= (and b!130238 c!24022) b!130239))

(assert (= (and b!130238 (not c!24022)) b!130240))

(declare-fun m!153057 () Bool)

(assert (=> b!130239 m!153057))

(assert (=> b!129717 d!39583))

(assert (=> d!39431 d!39351))

(declare-fun d!39585 () Bool)

(declare-fun e!84963 () Bool)

(assert (=> d!39585 e!84963))

(declare-fun res!62785 () Bool)

(assert (=> d!39585 (=> (not res!62785) (not e!84963))))

(declare-fun lt!67659 () SeekEntryResult!275)

(assert (=> d!39585 (= res!62785 ((_ is Found!275) lt!67659))))

(assert (=> d!39585 (= lt!67659 (seekEntryOrOpen!0 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355) (_keys!4563 newMap!16) (mask!7100 newMap!16)))))

(assert (=> d!39585 true))

(declare-fun _$33!111 () Unit!4037)

(assert (=> d!39585 (= (choose!800 (_keys!4563 newMap!16) (_values!2806 newMap!16) (mask!7100 newMap!16) (extraKeys!2596 newMap!16) (zeroValue!2682 newMap!16) (minValue!2682 newMap!16) (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355) (defaultEntry!2823 newMap!16)) _$33!111)))

(declare-fun b!130245 () Bool)

(declare-fun res!62786 () Bool)

(assert (=> b!130245 (=> (not res!62786) (not e!84963))))

(assert (=> b!130245 (= res!62786 (inRange!0 (index!3258 lt!67659) (mask!7100 newMap!16)))))

(declare-fun b!130246 () Bool)

(assert (=> b!130246 (= e!84963 (= (select (arr!2230 (_keys!4563 newMap!16)) (index!3258 lt!67659)) (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355)))))

(assert (= (and d!39585 res!62785) b!130245))

(assert (= (and b!130245 res!62786) b!130246))

(assert (=> d!39585 m!151753))

(assert (=> d!39585 m!151953))

(declare-fun m!153059 () Bool)

(assert (=> b!130245 m!153059))

(declare-fun m!153061 () Bool)

(assert (=> b!130246 m!153061))

(assert (=> d!39431 d!39585))

(assert (=> d!39431 d!39451))

(assert (=> b!129855 d!39465))

(declare-fun d!39587 () Bool)

(assert (=> d!39587 (isDefined!121 (getValueByKey!167 (toList!846 (+!160 lt!67061 (tuple2!2567 lt!67073 (zeroValue!2682 (v!3153 (underlying!442 thiss!992)))))) lt!67063))))

(declare-fun lt!67660 () Unit!4037)

(assert (=> d!39587 (= lt!67660 (choose!801 (toList!846 (+!160 lt!67061 (tuple2!2567 lt!67073 (zeroValue!2682 (v!3153 (underlying!442 thiss!992)))))) lt!67063))))

(declare-fun e!84964 () Bool)

(assert (=> d!39587 e!84964))

(declare-fun res!62787 () Bool)

(assert (=> d!39587 (=> (not res!62787) (not e!84964))))

(assert (=> d!39587 (= res!62787 (isStrictlySorted!314 (toList!846 (+!160 lt!67061 (tuple2!2567 lt!67073 (zeroValue!2682 (v!3153 (underlying!442 thiss!992))))))))))

(assert (=> d!39587 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!120 (toList!846 (+!160 lt!67061 (tuple2!2567 lt!67073 (zeroValue!2682 (v!3153 (underlying!442 thiss!992)))))) lt!67063) lt!67660)))

(declare-fun b!130247 () Bool)

(assert (=> b!130247 (= e!84964 (containsKey!171 (toList!846 (+!160 lt!67061 (tuple2!2567 lt!67073 (zeroValue!2682 (v!3153 (underlying!442 thiss!992)))))) lt!67063))))

(assert (= (and d!39587 res!62787) b!130247))

(assert (=> d!39587 m!152345))

(assert (=> d!39587 m!152345))

(assert (=> d!39587 m!152347))

(declare-fun m!153063 () Bool)

(assert (=> d!39587 m!153063))

(declare-fun m!153065 () Bool)

(assert (=> d!39587 m!153065))

(assert (=> b!130247 m!152341))

(assert (=> b!129831 d!39587))

(declare-fun d!39589 () Bool)

(assert (=> d!39589 (= (isDefined!121 (getValueByKey!167 (toList!846 (+!160 lt!67061 (tuple2!2567 lt!67073 (zeroValue!2682 (v!3153 (underlying!442 thiss!992)))))) lt!67063)) (not (isEmpty!407 (getValueByKey!167 (toList!846 (+!160 lt!67061 (tuple2!2567 lt!67073 (zeroValue!2682 (v!3153 (underlying!442 thiss!992)))))) lt!67063))))))

(declare-fun bs!5392 () Bool)

(assert (= bs!5392 d!39589))

(assert (=> bs!5392 m!152345))

(declare-fun m!153067 () Bool)

(assert (=> bs!5392 m!153067))

(assert (=> b!129831 d!39589))

(declare-fun e!84966 () Option!173)

(declare-fun b!130250 () Bool)

(assert (=> b!130250 (= e!84966 (getValueByKey!167 (t!6091 (toList!846 (+!160 lt!67061 (tuple2!2567 lt!67073 (zeroValue!2682 (v!3153 (underlying!442 thiss!992))))))) lt!67063))))

(declare-fun e!84965 () Option!173)

(declare-fun b!130248 () Bool)

(assert (=> b!130248 (= e!84965 (Some!172 (_2!1294 (h!2301 (toList!846 (+!160 lt!67061 (tuple2!2567 lt!67073 (zeroValue!2682 (v!3153 (underlying!442 thiss!992))))))))))))

(declare-fun c!24023 () Bool)

(declare-fun d!39591 () Bool)

(assert (=> d!39591 (= c!24023 (and ((_ is Cons!1697) (toList!846 (+!160 lt!67061 (tuple2!2567 lt!67073 (zeroValue!2682 (v!3153 (underlying!442 thiss!992))))))) (= (_1!1294 (h!2301 (toList!846 (+!160 lt!67061 (tuple2!2567 lt!67073 (zeroValue!2682 (v!3153 (underlying!442 thiss!992)))))))) lt!67063)))))

(assert (=> d!39591 (= (getValueByKey!167 (toList!846 (+!160 lt!67061 (tuple2!2567 lt!67073 (zeroValue!2682 (v!3153 (underlying!442 thiss!992)))))) lt!67063) e!84965)))

(declare-fun b!130249 () Bool)

(assert (=> b!130249 (= e!84965 e!84966)))

(declare-fun c!24024 () Bool)

(assert (=> b!130249 (= c!24024 (and ((_ is Cons!1697) (toList!846 (+!160 lt!67061 (tuple2!2567 lt!67073 (zeroValue!2682 (v!3153 (underlying!442 thiss!992))))))) (not (= (_1!1294 (h!2301 (toList!846 (+!160 lt!67061 (tuple2!2567 lt!67073 (zeroValue!2682 (v!3153 (underlying!442 thiss!992)))))))) lt!67063))))))

(declare-fun b!130251 () Bool)

(assert (=> b!130251 (= e!84966 None!171)))

(assert (= (and d!39591 c!24023) b!130248))

(assert (= (and d!39591 (not c!24023)) b!130249))

(assert (= (and b!130249 c!24024) b!130250))

(assert (= (and b!130249 (not c!24024)) b!130251))

(declare-fun m!153069 () Bool)

(assert (=> b!130250 m!153069))

(assert (=> b!129831 d!39591))

(declare-fun d!39593 () Bool)

(declare-fun e!84967 () Bool)

(assert (=> d!39593 e!84967))

(declare-fun res!62788 () Bool)

(assert (=> d!39593 (=> (not res!62788) (not e!84967))))

(declare-fun lt!67664 () ListLongMap!1661)

(assert (=> d!39593 (= res!62788 (contains!876 lt!67664 (_1!1294 (ite (or c!23882 c!23880) (tuple2!2567 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2682 newMap!16)) (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2682 newMap!16))))))))

(declare-fun lt!67661 () List!1701)

(assert (=> d!39593 (= lt!67664 (ListLongMap!1662 lt!67661))))

(declare-fun lt!67662 () Unit!4037)

(declare-fun lt!67663 () Unit!4037)

(assert (=> d!39593 (= lt!67662 lt!67663)))

(assert (=> d!39593 (= (getValueByKey!167 lt!67661 (_1!1294 (ite (or c!23882 c!23880) (tuple2!2567 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2682 newMap!16)) (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2682 newMap!16))))) (Some!172 (_2!1294 (ite (or c!23882 c!23880) (tuple2!2567 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2682 newMap!16)) (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2682 newMap!16))))))))

(assert (=> d!39593 (= lt!67663 (lemmaContainsTupThenGetReturnValue!85 lt!67661 (_1!1294 (ite (or c!23882 c!23880) (tuple2!2567 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2682 newMap!16)) (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2682 newMap!16)))) (_2!1294 (ite (or c!23882 c!23880) (tuple2!2567 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2682 newMap!16)) (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2682 newMap!16))))))))

(assert (=> d!39593 (= lt!67661 (insertStrictlySorted!88 (toList!846 (ite c!23882 call!14089 (ite c!23880 call!14090 call!14091))) (_1!1294 (ite (or c!23882 c!23880) (tuple2!2567 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2682 newMap!16)) (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2682 newMap!16)))) (_2!1294 (ite (or c!23882 c!23880) (tuple2!2567 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2682 newMap!16)) (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2682 newMap!16))))))))

(assert (=> d!39593 (= (+!160 (ite c!23882 call!14089 (ite c!23880 call!14090 call!14091)) (ite (or c!23882 c!23880) (tuple2!2567 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2682 newMap!16)) (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2682 newMap!16)))) lt!67664)))

(declare-fun b!130252 () Bool)

(declare-fun res!62789 () Bool)

(assert (=> b!130252 (=> (not res!62789) (not e!84967))))

(assert (=> b!130252 (= res!62789 (= (getValueByKey!167 (toList!846 lt!67664) (_1!1294 (ite (or c!23882 c!23880) (tuple2!2567 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2682 newMap!16)) (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2682 newMap!16))))) (Some!172 (_2!1294 (ite (or c!23882 c!23880) (tuple2!2567 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2682 newMap!16)) (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2682 newMap!16)))))))))

(declare-fun b!130253 () Bool)

(assert (=> b!130253 (= e!84967 (contains!878 (toList!846 lt!67664) (ite (or c!23882 c!23880) (tuple2!2567 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2682 newMap!16)) (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2682 newMap!16)))))))

(assert (= (and d!39593 res!62788) b!130252))

(assert (= (and b!130252 res!62789) b!130253))

(declare-fun m!153071 () Bool)

(assert (=> d!39593 m!153071))

(declare-fun m!153073 () Bool)

(assert (=> d!39593 m!153073))

(declare-fun m!153075 () Bool)

(assert (=> d!39593 m!153075))

(declare-fun m!153077 () Bool)

(assert (=> d!39593 m!153077))

(declare-fun m!153079 () Bool)

(assert (=> b!130252 m!153079))

(declare-fun m!153081 () Bool)

(assert (=> b!130253 m!153081))

(assert (=> bm!14088 d!39593))

(declare-fun b!130254 () Bool)

(declare-fun e!84968 () (_ BitVec 32))

(declare-fun call!14177 () (_ BitVec 32))

(assert (=> b!130254 (= e!84968 call!14177)))

(declare-fun b!130256 () Bool)

(assert (=> b!130256 (= e!84968 (bvadd #b00000000000000000000000000000001 call!14177))))

(declare-fun b!130257 () Bool)

(declare-fun e!84969 () (_ BitVec 32))

(assert (=> b!130257 (= e!84969 #b00000000000000000000000000000000)))

(declare-fun bm!14174 () Bool)

(assert (=> bm!14174 (= call!14177 (arrayCountValidKeys!0 (_keys!4563 (_2!1295 lt!67144)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2497 (_keys!4563 (_2!1295 lt!67144)))))))

(declare-fun d!39595 () Bool)

(declare-fun lt!67665 () (_ BitVec 32))

(assert (=> d!39595 (and (bvsge lt!67665 #b00000000000000000000000000000000) (bvsle lt!67665 (bvsub (size!2497 (_keys!4563 (_2!1295 lt!67144))) #b00000000000000000000000000000000)))))

(assert (=> d!39595 (= lt!67665 e!84969)))

(declare-fun c!24026 () Bool)

(assert (=> d!39595 (= c!24026 (bvsge #b00000000000000000000000000000000 (size!2497 (_keys!4563 (_2!1295 lt!67144)))))))

(assert (=> d!39595 (and (bvsle #b00000000000000000000000000000000 (size!2497 (_keys!4563 (_2!1295 lt!67144)))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!2497 (_keys!4563 (_2!1295 lt!67144))) (size!2497 (_keys!4563 (_2!1295 lt!67144)))))))

(assert (=> d!39595 (= (arrayCountValidKeys!0 (_keys!4563 (_2!1295 lt!67144)) #b00000000000000000000000000000000 (size!2497 (_keys!4563 (_2!1295 lt!67144)))) lt!67665)))

(declare-fun b!130255 () Bool)

(assert (=> b!130255 (= e!84969 e!84968)))

(declare-fun c!24025 () Bool)

(assert (=> b!130255 (= c!24025 (validKeyInArray!0 (select (arr!2230 (_keys!4563 (_2!1295 lt!67144))) #b00000000000000000000000000000000)))))

(assert (= (and d!39595 c!24026) b!130257))

(assert (= (and d!39595 (not c!24026)) b!130255))

(assert (= (and b!130255 c!24025) b!130256))

(assert (= (and b!130255 (not c!24025)) b!130254))

(assert (= (or b!130256 b!130254) bm!14174))

(declare-fun m!153083 () Bool)

(assert (=> bm!14174 m!153083))

(declare-fun m!153085 () Bool)

(assert (=> b!130255 m!153085))

(assert (=> b!130255 m!153085))

(declare-fun m!153087 () Bool)

(assert (=> b!130255 m!153087))

(assert (=> b!129752 d!39595))

(declare-fun d!39597 () Bool)

(declare-fun e!84971 () Bool)

(assert (=> d!39597 e!84971))

(declare-fun res!62790 () Bool)

(assert (=> d!39597 (=> res!62790 e!84971)))

(declare-fun lt!67668 () Bool)

(assert (=> d!39597 (= res!62790 (not lt!67668))))

(declare-fun lt!67669 () Bool)

(assert (=> d!39597 (= lt!67668 lt!67669)))

(declare-fun lt!67666 () Unit!4037)

(declare-fun e!84970 () Unit!4037)

(assert (=> d!39597 (= lt!67666 e!84970)))

(declare-fun c!24027 () Bool)

(assert (=> d!39597 (= c!24027 lt!67669)))

(assert (=> d!39597 (= lt!67669 (containsKey!171 (toList!846 lt!67261) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!39597 (= (contains!876 lt!67261 #b1000000000000000000000000000000000000000000000000000000000000000) lt!67668)))

(declare-fun b!130258 () Bool)

(declare-fun lt!67667 () Unit!4037)

(assert (=> b!130258 (= e!84970 lt!67667)))

(assert (=> b!130258 (= lt!67667 (lemmaContainsKeyImpliesGetValueByKeyDefined!120 (toList!846 lt!67261) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!130258 (isDefined!121 (getValueByKey!167 (toList!846 lt!67261) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!130259 () Bool)

(declare-fun Unit!4064 () Unit!4037)

(assert (=> b!130259 (= e!84970 Unit!4064)))

(declare-fun b!130260 () Bool)

(assert (=> b!130260 (= e!84971 (isDefined!121 (getValueByKey!167 (toList!846 lt!67261) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!39597 c!24027) b!130258))

(assert (= (and d!39597 (not c!24027)) b!130259))

(assert (= (and d!39597 (not res!62790)) b!130260))

(declare-fun m!153089 () Bool)

(assert (=> d!39597 m!153089))

(declare-fun m!153091 () Bool)

(assert (=> b!130258 m!153091))

(declare-fun m!153093 () Bool)

(assert (=> b!130258 m!153093))

(assert (=> b!130258 m!153093))

(declare-fun m!153095 () Bool)

(assert (=> b!130258 m!153095))

(assert (=> b!130260 m!153093))

(assert (=> b!130260 m!153093))

(assert (=> b!130260 m!153095))

(assert (=> bm!14091 d!39597))

(declare-fun d!39599 () Bool)

(declare-fun e!84973 () Bool)

(assert (=> d!39599 e!84973))

(declare-fun res!62791 () Bool)

(assert (=> d!39599 (=> res!62791 e!84973)))

(declare-fun lt!67672 () Bool)

(assert (=> d!39599 (= res!62791 (not lt!67672))))

(declare-fun lt!67673 () Bool)

(assert (=> d!39599 (= lt!67672 lt!67673)))

(declare-fun lt!67670 () Unit!4037)

(declare-fun e!84972 () Unit!4037)

(assert (=> d!39599 (= lt!67670 e!84972)))

(declare-fun c!24028 () Bool)

(assert (=> d!39599 (= c!24028 lt!67673)))

(assert (=> d!39599 (= lt!67673 (containsKey!171 (toList!846 lt!67185) (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> d!39599 (= (contains!876 lt!67185 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) lt!67672)))

(declare-fun b!130261 () Bool)

(declare-fun lt!67671 () Unit!4037)

(assert (=> b!130261 (= e!84972 lt!67671)))

(assert (=> b!130261 (= lt!67671 (lemmaContainsKeyImpliesGetValueByKeyDefined!120 (toList!846 lt!67185) (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!130261 (isDefined!121 (getValueByKey!167 (toList!846 lt!67185) (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!130262 () Bool)

(declare-fun Unit!4065 () Unit!4037)

(assert (=> b!130262 (= e!84972 Unit!4065)))

(declare-fun b!130263 () Bool)

(assert (=> b!130263 (= e!84973 (isDefined!121 (getValueByKey!167 (toList!846 lt!67185) (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(assert (= (and d!39599 c!24028) b!130261))

(assert (= (and d!39599 (not c!24028)) b!130262))

(assert (= (and d!39599 (not res!62791)) b!130263))

(assert (=> d!39599 m!151855))

(declare-fun m!153097 () Bool)

(assert (=> d!39599 m!153097))

(assert (=> b!130261 m!151855))

(declare-fun m!153099 () Bool)

(assert (=> b!130261 m!153099))

(assert (=> b!130261 m!151855))

(declare-fun m!153101 () Bool)

(assert (=> b!130261 m!153101))

(assert (=> b!130261 m!153101))

(declare-fun m!153103 () Bool)

(assert (=> b!130261 m!153103))

(assert (=> b!130263 m!151855))

(assert (=> b!130263 m!153101))

(assert (=> b!130263 m!153101))

(assert (=> b!130263 m!153103))

(assert (=> b!129649 d!39599))

(assert (=> b!129940 d!39465))

(declare-fun d!39601 () Bool)

(assert (=> d!39601 (= (get!1463 (getValueByKey!167 (toList!846 lt!67067) lt!67077)) (v!3159 (getValueByKey!167 (toList!846 lt!67067) lt!67077)))))

(assert (=> d!39393 d!39601))

(declare-fun b!130266 () Bool)

(declare-fun e!84975 () Option!173)

(assert (=> b!130266 (= e!84975 (getValueByKey!167 (t!6091 (toList!846 lt!67067)) lt!67077))))

(declare-fun b!130264 () Bool)

(declare-fun e!84974 () Option!173)

(assert (=> b!130264 (= e!84974 (Some!172 (_2!1294 (h!2301 (toList!846 lt!67067)))))))

(declare-fun d!39603 () Bool)

(declare-fun c!24029 () Bool)

(assert (=> d!39603 (= c!24029 (and ((_ is Cons!1697) (toList!846 lt!67067)) (= (_1!1294 (h!2301 (toList!846 lt!67067))) lt!67077)))))

(assert (=> d!39603 (= (getValueByKey!167 (toList!846 lt!67067) lt!67077) e!84974)))

(declare-fun b!130265 () Bool)

(assert (=> b!130265 (= e!84974 e!84975)))

(declare-fun c!24030 () Bool)

(assert (=> b!130265 (= c!24030 (and ((_ is Cons!1697) (toList!846 lt!67067)) (not (= (_1!1294 (h!2301 (toList!846 lt!67067))) lt!67077))))))

(declare-fun b!130267 () Bool)

(assert (=> b!130267 (= e!84975 None!171)))

(assert (= (and d!39603 c!24029) b!130264))

(assert (= (and d!39603 (not c!24029)) b!130265))

(assert (= (and b!130265 c!24030) b!130266))

(assert (= (and b!130265 (not c!24030)) b!130267))

(declare-fun m!153105 () Bool)

(assert (=> b!130266 m!153105))

(assert (=> d!39393 d!39603))

(declare-fun d!39605 () Bool)

(declare-fun res!62792 () Bool)

(declare-fun e!84976 () Bool)

(assert (=> d!39605 (=> res!62792 e!84976)))

(assert (=> d!39605 (= res!62792 (and ((_ is Cons!1697) (toList!846 lt!67071)) (= (_1!1294 (h!2301 (toList!846 lt!67071))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!39605 (= (containsKey!171 (toList!846 lt!67071) #b1000000000000000000000000000000000000000000000000000000000000000) e!84976)))

(declare-fun b!130268 () Bool)

(declare-fun e!84977 () Bool)

(assert (=> b!130268 (= e!84976 e!84977)))

(declare-fun res!62793 () Bool)

(assert (=> b!130268 (=> (not res!62793) (not e!84977))))

(assert (=> b!130268 (= res!62793 (and (or (not ((_ is Cons!1697) (toList!846 lt!67071))) (bvsle (_1!1294 (h!2301 (toList!846 lt!67071))) #b1000000000000000000000000000000000000000000000000000000000000000)) ((_ is Cons!1697) (toList!846 lt!67071)) (bvslt (_1!1294 (h!2301 (toList!846 lt!67071))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!130269 () Bool)

(assert (=> b!130269 (= e!84977 (containsKey!171 (t!6091 (toList!846 lt!67071)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!39605 (not res!62792)) b!130268))

(assert (= (and b!130268 res!62793) b!130269))

(declare-fun m!153107 () Bool)

(assert (=> b!130269 m!153107))

(assert (=> d!39337 d!39605))

(declare-fun d!39607 () Bool)

(assert (=> d!39607 (= (isDefined!121 (getValueByKey!167 (toList!846 call!14073) (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355))) (not (isEmpty!407 (getValueByKey!167 (toList!846 call!14073) (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355)))))))

(declare-fun bs!5393 () Bool)

(assert (= bs!5393 d!39607))

(assert (=> bs!5393 m!152185))

(declare-fun m!153109 () Bool)

(assert (=> bs!5393 m!153109))

(assert (=> b!129742 d!39607))

(declare-fun b!130272 () Bool)

(declare-fun e!84979 () Option!173)

(assert (=> b!130272 (= e!84979 (getValueByKey!167 (t!6091 (toList!846 call!14073)) (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355)))))

(declare-fun b!130270 () Bool)

(declare-fun e!84978 () Option!173)

(assert (=> b!130270 (= e!84978 (Some!172 (_2!1294 (h!2301 (toList!846 call!14073)))))))

(declare-fun d!39609 () Bool)

(declare-fun c!24031 () Bool)

(assert (=> d!39609 (= c!24031 (and ((_ is Cons!1697) (toList!846 call!14073)) (= (_1!1294 (h!2301 (toList!846 call!14073))) (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355))))))

(assert (=> d!39609 (= (getValueByKey!167 (toList!846 call!14073) (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355)) e!84978)))

(declare-fun b!130271 () Bool)

(assert (=> b!130271 (= e!84978 e!84979)))

(declare-fun c!24032 () Bool)

(assert (=> b!130271 (= c!24032 (and ((_ is Cons!1697) (toList!846 call!14073)) (not (= (_1!1294 (h!2301 (toList!846 call!14073))) (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355)))))))

(declare-fun b!130273 () Bool)

(assert (=> b!130273 (= e!84979 None!171)))

(assert (= (and d!39609 c!24031) b!130270))

(assert (= (and d!39609 (not c!24031)) b!130271))

(assert (= (and b!130271 c!24032) b!130272))

(assert (= (and b!130271 (not c!24032)) b!130273))

(assert (=> b!130272 m!151753))

(declare-fun m!153111 () Bool)

(assert (=> b!130272 m!153111))

(assert (=> b!129742 d!39609))

(assert (=> d!39339 d!39451))

(declare-fun d!39611 () Bool)

(declare-fun e!84981 () Bool)

(assert (=> d!39611 e!84981))

(declare-fun res!62794 () Bool)

(assert (=> d!39611 (=> res!62794 e!84981)))

(declare-fun lt!67676 () Bool)

(assert (=> d!39611 (= res!62794 (not lt!67676))))

(declare-fun lt!67677 () Bool)

(assert (=> d!39611 (= lt!67676 lt!67677)))

(declare-fun lt!67674 () Unit!4037)

(declare-fun e!84980 () Unit!4037)

(assert (=> d!39611 (= lt!67674 e!84980)))

(declare-fun c!24033 () Bool)

(assert (=> d!39611 (= c!24033 lt!67677)))

(assert (=> d!39611 (= lt!67677 (containsKey!171 (toList!846 (+!160 lt!67191 (tuple2!2567 lt!67190 lt!67187))) lt!67188))))

(assert (=> d!39611 (= (contains!876 (+!160 lt!67191 (tuple2!2567 lt!67190 lt!67187)) lt!67188) lt!67676)))

(declare-fun b!130274 () Bool)

(declare-fun lt!67675 () Unit!4037)

(assert (=> b!130274 (= e!84980 lt!67675)))

(assert (=> b!130274 (= lt!67675 (lemmaContainsKeyImpliesGetValueByKeyDefined!120 (toList!846 (+!160 lt!67191 (tuple2!2567 lt!67190 lt!67187))) lt!67188))))

(assert (=> b!130274 (isDefined!121 (getValueByKey!167 (toList!846 (+!160 lt!67191 (tuple2!2567 lt!67190 lt!67187))) lt!67188))))

(declare-fun b!130275 () Bool)

(declare-fun Unit!4066 () Unit!4037)

(assert (=> b!130275 (= e!84980 Unit!4066)))

(declare-fun b!130276 () Bool)

(assert (=> b!130276 (= e!84981 (isDefined!121 (getValueByKey!167 (toList!846 (+!160 lt!67191 (tuple2!2567 lt!67190 lt!67187))) lt!67188)))))

(assert (= (and d!39611 c!24033) b!130274))

(assert (= (and d!39611 (not c!24033)) b!130275))

(assert (= (and d!39611 (not res!62794)) b!130276))

(declare-fun m!153113 () Bool)

(assert (=> d!39611 m!153113))

(declare-fun m!153115 () Bool)

(assert (=> b!130274 m!153115))

(declare-fun m!153117 () Bool)

(assert (=> b!130274 m!153117))

(assert (=> b!130274 m!153117))

(declare-fun m!153119 () Bool)

(assert (=> b!130274 m!153119))

(assert (=> b!130276 m!153117))

(assert (=> b!130276 m!153117))

(assert (=> b!130276 m!153119))

(assert (=> b!129655 d!39611))

(assert (=> b!129655 d!39343))

(declare-fun d!39613 () Bool)

(declare-fun e!84982 () Bool)

(assert (=> d!39613 e!84982))

(declare-fun res!62795 () Bool)

(assert (=> d!39613 (=> (not res!62795) (not e!84982))))

(declare-fun lt!67681 () ListLongMap!1661)

(assert (=> d!39613 (= res!62795 (contains!876 lt!67681 (_1!1294 (tuple2!2567 lt!67190 lt!67187))))))

(declare-fun lt!67678 () List!1701)

(assert (=> d!39613 (= lt!67681 (ListLongMap!1662 lt!67678))))

(declare-fun lt!67679 () Unit!4037)

(declare-fun lt!67680 () Unit!4037)

(assert (=> d!39613 (= lt!67679 lt!67680)))

(assert (=> d!39613 (= (getValueByKey!167 lt!67678 (_1!1294 (tuple2!2567 lt!67190 lt!67187))) (Some!172 (_2!1294 (tuple2!2567 lt!67190 lt!67187))))))

(assert (=> d!39613 (= lt!67680 (lemmaContainsTupThenGetReturnValue!85 lt!67678 (_1!1294 (tuple2!2567 lt!67190 lt!67187)) (_2!1294 (tuple2!2567 lt!67190 lt!67187))))))

(assert (=> d!39613 (= lt!67678 (insertStrictlySorted!88 (toList!846 lt!67191) (_1!1294 (tuple2!2567 lt!67190 lt!67187)) (_2!1294 (tuple2!2567 lt!67190 lt!67187))))))

(assert (=> d!39613 (= (+!160 lt!67191 (tuple2!2567 lt!67190 lt!67187)) lt!67681)))

(declare-fun b!130277 () Bool)

(declare-fun res!62796 () Bool)

(assert (=> b!130277 (=> (not res!62796) (not e!84982))))

(assert (=> b!130277 (= res!62796 (= (getValueByKey!167 (toList!846 lt!67681) (_1!1294 (tuple2!2567 lt!67190 lt!67187))) (Some!172 (_2!1294 (tuple2!2567 lt!67190 lt!67187)))))))

(declare-fun b!130278 () Bool)

(assert (=> b!130278 (= e!84982 (contains!878 (toList!846 lt!67681) (tuple2!2567 lt!67190 lt!67187)))))

(assert (= (and d!39613 res!62795) b!130277))

(assert (= (and b!130277 res!62796) b!130278))

(declare-fun m!153121 () Bool)

(assert (=> d!39613 m!153121))

(declare-fun m!153123 () Bool)

(assert (=> d!39613 m!153123))

(declare-fun m!153125 () Bool)

(assert (=> d!39613 m!153125))

(declare-fun m!153127 () Bool)

(assert (=> d!39613 m!153127))

(declare-fun m!153129 () Bool)

(assert (=> b!130277 m!153129))

(declare-fun m!153131 () Bool)

(assert (=> b!130278 m!153131))

(assert (=> b!129655 d!39613))

(declare-fun d!39615 () Bool)

(assert (=> d!39615 (not (contains!876 (+!160 lt!67191 (tuple2!2567 lt!67190 lt!67187)) lt!67188))))

(declare-fun lt!67684 () Unit!4037)

(declare-fun choose!805 (ListLongMap!1661 (_ BitVec 64) V!3457 (_ BitVec 64)) Unit!4037)

(assert (=> d!39615 (= lt!67684 (choose!805 lt!67191 lt!67190 lt!67187 lt!67188))))

(declare-fun e!84985 () Bool)

(assert (=> d!39615 e!84985))

(declare-fun res!62799 () Bool)

(assert (=> d!39615 (=> (not res!62799) (not e!84985))))

(assert (=> d!39615 (= res!62799 (not (contains!876 lt!67191 lt!67188)))))

(assert (=> d!39615 (= (addStillNotContains!59 lt!67191 lt!67190 lt!67187 lt!67188) lt!67684)))

(declare-fun b!130282 () Bool)

(assert (=> b!130282 (= e!84985 (not (= lt!67190 lt!67188)))))

(assert (= (and d!39615 res!62799) b!130282))

(assert (=> d!39615 m!151993))

(assert (=> d!39615 m!151993))

(assert (=> d!39615 m!151997))

(declare-fun m!153133 () Bool)

(assert (=> d!39615 m!153133))

(declare-fun m!153135 () Bool)

(assert (=> d!39615 m!153135))

(assert (=> b!129655 d!39615))

(declare-fun d!39617 () Bool)

(declare-fun e!84986 () Bool)

(assert (=> d!39617 e!84986))

(declare-fun res!62800 () Bool)

(assert (=> d!39617 (=> (not res!62800) (not e!84986))))

(declare-fun lt!67688 () ListLongMap!1661)

(assert (=> d!39617 (= res!62800 (contains!876 lt!67688 (_1!1294 (tuple2!2567 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!67685 () List!1701)

(assert (=> d!39617 (= lt!67688 (ListLongMap!1662 lt!67685))))

(declare-fun lt!67686 () Unit!4037)

(declare-fun lt!67687 () Unit!4037)

(assert (=> d!39617 (= lt!67686 lt!67687)))

(assert (=> d!39617 (= (getValueByKey!167 lt!67685 (_1!1294 (tuple2!2567 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!172 (_2!1294 (tuple2!2567 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!39617 (= lt!67687 (lemmaContainsTupThenGetReturnValue!85 lt!67685 (_1!1294 (tuple2!2567 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1294 (tuple2!2567 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!39617 (= lt!67685 (insertStrictlySorted!88 (toList!846 call!14084) (_1!1294 (tuple2!2567 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1294 (tuple2!2567 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!39617 (= (+!160 call!14084 (tuple2!2567 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!67688)))

(declare-fun b!130283 () Bool)

(declare-fun res!62801 () Bool)

(assert (=> b!130283 (=> (not res!62801) (not e!84986))))

(assert (=> b!130283 (= res!62801 (= (getValueByKey!167 (toList!846 lt!67688) (_1!1294 (tuple2!2567 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!172 (_2!1294 (tuple2!2567 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!130284 () Bool)

(assert (=> b!130284 (= e!84986 (contains!878 (toList!846 lt!67688) (tuple2!2567 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!39617 res!62800) b!130283))

(assert (= (and b!130283 res!62801) b!130284))

(declare-fun m!153137 () Bool)

(assert (=> d!39617 m!153137))

(declare-fun m!153139 () Bool)

(assert (=> d!39617 m!153139))

(declare-fun m!153141 () Bool)

(assert (=> d!39617 m!153141))

(declare-fun m!153143 () Bool)

(assert (=> d!39617 m!153143))

(declare-fun m!153145 () Bool)

(assert (=> b!130283 m!153145))

(declare-fun m!153147 () Bool)

(assert (=> b!130284 m!153147))

(assert (=> b!129655 d!39617))

(declare-fun d!39619 () Bool)

(declare-fun lt!67689 () Bool)

(assert (=> d!39619 (= lt!67689 (select (content!129 (toList!846 lt!67229)) (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2682 (v!3153 (underlying!442 thiss!992))))))))

(declare-fun e!84987 () Bool)

(assert (=> d!39619 (= lt!67689 e!84987)))

(declare-fun res!62803 () Bool)

(assert (=> d!39619 (=> (not res!62803) (not e!84987))))

(assert (=> d!39619 (= res!62803 ((_ is Cons!1697) (toList!846 lt!67229)))))

(assert (=> d!39619 (= (contains!878 (toList!846 lt!67229) (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2682 (v!3153 (underlying!442 thiss!992))))) lt!67689)))

(declare-fun b!130285 () Bool)

(declare-fun e!84988 () Bool)

(assert (=> b!130285 (= e!84987 e!84988)))

(declare-fun res!62802 () Bool)

(assert (=> b!130285 (=> res!62802 e!84988)))

(assert (=> b!130285 (= res!62802 (= (h!2301 (toList!846 lt!67229)) (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2682 (v!3153 (underlying!442 thiss!992))))))))

(declare-fun b!130286 () Bool)

(assert (=> b!130286 (= e!84988 (contains!878 (t!6091 (toList!846 lt!67229)) (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2682 (v!3153 (underlying!442 thiss!992))))))))

(assert (= (and d!39619 res!62803) b!130285))

(assert (= (and b!130285 (not res!62802)) b!130286))

(declare-fun m!153149 () Bool)

(assert (=> d!39619 m!153149))

(declare-fun m!153151 () Bool)

(assert (=> d!39619 m!153151))

(declare-fun m!153153 () Bool)

(assert (=> b!130286 m!153153))

(assert (=> b!129692 d!39619))

(declare-fun d!39621 () Bool)

(assert (=> d!39621 (= (get!1463 (getValueByKey!167 (toList!846 lt!67071) #b0000000000000000000000000000000000000000000000000000000000000000)) (v!3159 (getValueByKey!167 (toList!846 lt!67071) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!39435 d!39621))

(declare-fun b!130289 () Bool)

(declare-fun e!84990 () Option!173)

(assert (=> b!130289 (= e!84990 (getValueByKey!167 (t!6091 (toList!846 lt!67071)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!130287 () Bool)

(declare-fun e!84989 () Option!173)

(assert (=> b!130287 (= e!84989 (Some!172 (_2!1294 (h!2301 (toList!846 lt!67071)))))))

(declare-fun d!39623 () Bool)

(declare-fun c!24034 () Bool)

(assert (=> d!39623 (= c!24034 (and ((_ is Cons!1697) (toList!846 lt!67071)) (= (_1!1294 (h!2301 (toList!846 lt!67071))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!39623 (= (getValueByKey!167 (toList!846 lt!67071) #b0000000000000000000000000000000000000000000000000000000000000000) e!84989)))

(declare-fun b!130288 () Bool)

(assert (=> b!130288 (= e!84989 e!84990)))

(declare-fun c!24035 () Bool)

(assert (=> b!130288 (= c!24035 (and ((_ is Cons!1697) (toList!846 lt!67071)) (not (= (_1!1294 (h!2301 (toList!846 lt!67071))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!130290 () Bool)

(assert (=> b!130290 (= e!84990 None!171)))

(assert (= (and d!39623 c!24034) b!130287))

(assert (= (and d!39623 (not c!24034)) b!130288))

(assert (= (and b!130288 c!24035) b!130289))

(assert (= (and b!130288 (not c!24035)) b!130290))

(declare-fun m!153155 () Bool)

(assert (=> b!130289 m!153155))

(assert (=> d!39435 d!39623))

(declare-fun d!39625 () Bool)

(declare-fun e!84991 () Bool)

(assert (=> d!39625 e!84991))

(declare-fun res!62804 () Bool)

(assert (=> d!39625 (=> (not res!62804) (not e!84991))))

(declare-fun lt!67693 () ListLongMap!1661)

(assert (=> d!39625 (= res!62804 (contains!876 lt!67693 (_1!1294 (tuple2!2567 lt!67246 (minValue!2682 newMap!16)))))))

(declare-fun lt!67690 () List!1701)

(assert (=> d!39625 (= lt!67693 (ListLongMap!1662 lt!67690))))

(declare-fun lt!67691 () Unit!4037)

(declare-fun lt!67692 () Unit!4037)

(assert (=> d!39625 (= lt!67691 lt!67692)))

(assert (=> d!39625 (= (getValueByKey!167 lt!67690 (_1!1294 (tuple2!2567 lt!67246 (minValue!2682 newMap!16)))) (Some!172 (_2!1294 (tuple2!2567 lt!67246 (minValue!2682 newMap!16)))))))

(assert (=> d!39625 (= lt!67692 (lemmaContainsTupThenGetReturnValue!85 lt!67690 (_1!1294 (tuple2!2567 lt!67246 (minValue!2682 newMap!16))) (_2!1294 (tuple2!2567 lt!67246 (minValue!2682 newMap!16)))))))

(assert (=> d!39625 (= lt!67690 (insertStrictlySorted!88 (toList!846 lt!67264) (_1!1294 (tuple2!2567 lt!67246 (minValue!2682 newMap!16))) (_2!1294 (tuple2!2567 lt!67246 (minValue!2682 newMap!16)))))))

(assert (=> d!39625 (= (+!160 lt!67264 (tuple2!2567 lt!67246 (minValue!2682 newMap!16))) lt!67693)))

(declare-fun b!130291 () Bool)

(declare-fun res!62805 () Bool)

(assert (=> b!130291 (=> (not res!62805) (not e!84991))))

(assert (=> b!130291 (= res!62805 (= (getValueByKey!167 (toList!846 lt!67693) (_1!1294 (tuple2!2567 lt!67246 (minValue!2682 newMap!16)))) (Some!172 (_2!1294 (tuple2!2567 lt!67246 (minValue!2682 newMap!16))))))))

(declare-fun b!130292 () Bool)

(assert (=> b!130292 (= e!84991 (contains!878 (toList!846 lt!67693) (tuple2!2567 lt!67246 (minValue!2682 newMap!16))))))

(assert (= (and d!39625 res!62804) b!130291))

(assert (= (and b!130291 res!62805) b!130292))

(declare-fun m!153157 () Bool)

(assert (=> d!39625 m!153157))

(declare-fun m!153159 () Bool)

(assert (=> d!39625 m!153159))

(declare-fun m!153161 () Bool)

(assert (=> d!39625 m!153161))

(declare-fun m!153163 () Bool)

(assert (=> d!39625 m!153163))

(declare-fun m!153165 () Bool)

(assert (=> b!130291 m!153165))

(declare-fun m!153167 () Bool)

(assert (=> b!130292 m!153167))

(assert (=> b!129732 d!39625))

(declare-fun d!39627 () Bool)

(assert (=> d!39627 (contains!876 (+!160 lt!67251 (tuple2!2567 lt!67263 (zeroValue!2682 newMap!16))) lt!67253)))

(declare-fun lt!67694 () Unit!4037)

(assert (=> d!39627 (= lt!67694 (choose!797 lt!67251 lt!67263 (zeroValue!2682 newMap!16) lt!67253))))

(assert (=> d!39627 (contains!876 lt!67251 lt!67253)))

(assert (=> d!39627 (= (addStillContains!89 lt!67251 lt!67263 (zeroValue!2682 newMap!16) lt!67253) lt!67694)))

(declare-fun bs!5394 () Bool)

(assert (= bs!5394 d!39627))

(assert (=> bs!5394 m!152151))

(assert (=> bs!5394 m!152151))

(assert (=> bs!5394 m!152161))

(declare-fun m!153169 () Bool)

(assert (=> bs!5394 m!153169))

(declare-fun m!153171 () Bool)

(assert (=> bs!5394 m!153171))

(assert (=> b!129732 d!39627))

(declare-fun d!39629 () Bool)

(assert (=> d!39629 (= (apply!113 lt!67249 lt!67258) (get!1463 (getValueByKey!167 (toList!846 lt!67249) lt!67258)))))

(declare-fun bs!5395 () Bool)

(assert (= bs!5395 d!39629))

(declare-fun m!153173 () Bool)

(assert (=> bs!5395 m!153173))

(assert (=> bs!5395 m!153173))

(declare-fun m!153175 () Bool)

(assert (=> bs!5395 m!153175))

(assert (=> b!129732 d!39629))

(declare-fun d!39631 () Bool)

(assert (=> d!39631 (= (apply!113 (+!160 lt!67249 (tuple2!2567 lt!67265 (zeroValue!2682 newMap!16))) lt!67258) (get!1463 (getValueByKey!167 (toList!846 (+!160 lt!67249 (tuple2!2567 lt!67265 (zeroValue!2682 newMap!16)))) lt!67258)))))

(declare-fun bs!5396 () Bool)

(assert (= bs!5396 d!39631))

(declare-fun m!153177 () Bool)

(assert (=> bs!5396 m!153177))

(assert (=> bs!5396 m!153177))

(declare-fun m!153179 () Bool)

(assert (=> bs!5396 m!153179))

(assert (=> b!129732 d!39631))

(declare-fun d!39633 () Bool)

(declare-fun e!84993 () Bool)

(assert (=> d!39633 e!84993))

(declare-fun res!62806 () Bool)

(assert (=> d!39633 (=> res!62806 e!84993)))

(declare-fun lt!67697 () Bool)

(assert (=> d!39633 (= res!62806 (not lt!67697))))

(declare-fun lt!67698 () Bool)

(assert (=> d!39633 (= lt!67697 lt!67698)))

(declare-fun lt!67695 () Unit!4037)

(declare-fun e!84992 () Unit!4037)

(assert (=> d!39633 (= lt!67695 e!84992)))

(declare-fun c!24036 () Bool)

(assert (=> d!39633 (= c!24036 lt!67698)))

(assert (=> d!39633 (= lt!67698 (containsKey!171 (toList!846 (+!160 lt!67251 (tuple2!2567 lt!67263 (zeroValue!2682 newMap!16)))) lt!67253))))

(assert (=> d!39633 (= (contains!876 (+!160 lt!67251 (tuple2!2567 lt!67263 (zeroValue!2682 newMap!16))) lt!67253) lt!67697)))

(declare-fun b!130293 () Bool)

(declare-fun lt!67696 () Unit!4037)

(assert (=> b!130293 (= e!84992 lt!67696)))

(assert (=> b!130293 (= lt!67696 (lemmaContainsKeyImpliesGetValueByKeyDefined!120 (toList!846 (+!160 lt!67251 (tuple2!2567 lt!67263 (zeroValue!2682 newMap!16)))) lt!67253))))

(assert (=> b!130293 (isDefined!121 (getValueByKey!167 (toList!846 (+!160 lt!67251 (tuple2!2567 lt!67263 (zeroValue!2682 newMap!16)))) lt!67253))))

(declare-fun b!130294 () Bool)

(declare-fun Unit!4067 () Unit!4037)

(assert (=> b!130294 (= e!84992 Unit!4067)))

(declare-fun b!130295 () Bool)

(assert (=> b!130295 (= e!84993 (isDefined!121 (getValueByKey!167 (toList!846 (+!160 lt!67251 (tuple2!2567 lt!67263 (zeroValue!2682 newMap!16)))) lt!67253)))))

(assert (= (and d!39633 c!24036) b!130293))

(assert (= (and d!39633 (not c!24036)) b!130294))

(assert (= (and d!39633 (not res!62806)) b!130295))

(declare-fun m!153181 () Bool)

(assert (=> d!39633 m!153181))

(declare-fun m!153183 () Bool)

(assert (=> b!130293 m!153183))

(declare-fun m!153185 () Bool)

(assert (=> b!130293 m!153185))

(assert (=> b!130293 m!153185))

(declare-fun m!153187 () Bool)

(assert (=> b!130293 m!153187))

(assert (=> b!130295 m!153185))

(assert (=> b!130295 m!153185))

(assert (=> b!130295 m!153187))

(assert (=> b!129732 d!39633))

(declare-fun d!39635 () Bool)

(assert (=> d!39635 (= (apply!113 lt!67257 lt!67267) (get!1463 (getValueByKey!167 (toList!846 lt!67257) lt!67267)))))

(declare-fun bs!5397 () Bool)

(assert (= bs!5397 d!39635))

(declare-fun m!153189 () Bool)

(assert (=> bs!5397 m!153189))

(assert (=> bs!5397 m!153189))

(declare-fun m!153191 () Bool)

(assert (=> bs!5397 m!153191))

(assert (=> b!129732 d!39635))

(declare-fun d!39637 () Bool)

(declare-fun e!84994 () Bool)

(assert (=> d!39637 e!84994))

(declare-fun res!62807 () Bool)

(assert (=> d!39637 (=> (not res!62807) (not e!84994))))

(declare-fun lt!67702 () ListLongMap!1661)

(assert (=> d!39637 (= res!62807 (contains!876 lt!67702 (_1!1294 (tuple2!2567 lt!67265 (zeroValue!2682 newMap!16)))))))

(declare-fun lt!67699 () List!1701)

(assert (=> d!39637 (= lt!67702 (ListLongMap!1662 lt!67699))))

(declare-fun lt!67700 () Unit!4037)

(declare-fun lt!67701 () Unit!4037)

(assert (=> d!39637 (= lt!67700 lt!67701)))

(assert (=> d!39637 (= (getValueByKey!167 lt!67699 (_1!1294 (tuple2!2567 lt!67265 (zeroValue!2682 newMap!16)))) (Some!172 (_2!1294 (tuple2!2567 lt!67265 (zeroValue!2682 newMap!16)))))))

(assert (=> d!39637 (= lt!67701 (lemmaContainsTupThenGetReturnValue!85 lt!67699 (_1!1294 (tuple2!2567 lt!67265 (zeroValue!2682 newMap!16))) (_2!1294 (tuple2!2567 lt!67265 (zeroValue!2682 newMap!16)))))))

(assert (=> d!39637 (= lt!67699 (insertStrictlySorted!88 (toList!846 lt!67249) (_1!1294 (tuple2!2567 lt!67265 (zeroValue!2682 newMap!16))) (_2!1294 (tuple2!2567 lt!67265 (zeroValue!2682 newMap!16)))))))

(assert (=> d!39637 (= (+!160 lt!67249 (tuple2!2567 lt!67265 (zeroValue!2682 newMap!16))) lt!67702)))

(declare-fun b!130296 () Bool)

(declare-fun res!62808 () Bool)

(assert (=> b!130296 (=> (not res!62808) (not e!84994))))

(assert (=> b!130296 (= res!62808 (= (getValueByKey!167 (toList!846 lt!67702) (_1!1294 (tuple2!2567 lt!67265 (zeroValue!2682 newMap!16)))) (Some!172 (_2!1294 (tuple2!2567 lt!67265 (zeroValue!2682 newMap!16))))))))

(declare-fun b!130297 () Bool)

(assert (=> b!130297 (= e!84994 (contains!878 (toList!846 lt!67702) (tuple2!2567 lt!67265 (zeroValue!2682 newMap!16))))))

(assert (= (and d!39637 res!62807) b!130296))

(assert (= (and b!130296 res!62808) b!130297))

(declare-fun m!153193 () Bool)

(assert (=> d!39637 m!153193))

(declare-fun m!153195 () Bool)

(assert (=> d!39637 m!153195))

(declare-fun m!153197 () Bool)

(assert (=> d!39637 m!153197))

(declare-fun m!153199 () Bool)

(assert (=> d!39637 m!153199))

(declare-fun m!153201 () Bool)

(assert (=> b!130296 m!153201))

(declare-fun m!153203 () Bool)

(assert (=> b!130297 m!153203))

(assert (=> b!129732 d!39637))

(declare-fun d!39639 () Bool)

(declare-fun e!84995 () Bool)

(assert (=> d!39639 e!84995))

(declare-fun res!62809 () Bool)

(assert (=> d!39639 (=> (not res!62809) (not e!84995))))

(declare-fun lt!67706 () ListLongMap!1661)

(assert (=> d!39639 (= res!62809 (contains!876 lt!67706 (_1!1294 (tuple2!2567 lt!67250 (minValue!2682 newMap!16)))))))

(declare-fun lt!67703 () List!1701)

(assert (=> d!39639 (= lt!67706 (ListLongMap!1662 lt!67703))))

(declare-fun lt!67704 () Unit!4037)

(declare-fun lt!67705 () Unit!4037)

(assert (=> d!39639 (= lt!67704 lt!67705)))

(assert (=> d!39639 (= (getValueByKey!167 lt!67703 (_1!1294 (tuple2!2567 lt!67250 (minValue!2682 newMap!16)))) (Some!172 (_2!1294 (tuple2!2567 lt!67250 (minValue!2682 newMap!16)))))))

(assert (=> d!39639 (= lt!67705 (lemmaContainsTupThenGetReturnValue!85 lt!67703 (_1!1294 (tuple2!2567 lt!67250 (minValue!2682 newMap!16))) (_2!1294 (tuple2!2567 lt!67250 (minValue!2682 newMap!16)))))))

(assert (=> d!39639 (= lt!67703 (insertStrictlySorted!88 (toList!846 lt!67257) (_1!1294 (tuple2!2567 lt!67250 (minValue!2682 newMap!16))) (_2!1294 (tuple2!2567 lt!67250 (minValue!2682 newMap!16)))))))

(assert (=> d!39639 (= (+!160 lt!67257 (tuple2!2567 lt!67250 (minValue!2682 newMap!16))) lt!67706)))

(declare-fun b!130298 () Bool)

(declare-fun res!62810 () Bool)

(assert (=> b!130298 (=> (not res!62810) (not e!84995))))

(assert (=> b!130298 (= res!62810 (= (getValueByKey!167 (toList!846 lt!67706) (_1!1294 (tuple2!2567 lt!67250 (minValue!2682 newMap!16)))) (Some!172 (_2!1294 (tuple2!2567 lt!67250 (minValue!2682 newMap!16))))))))

(declare-fun b!130299 () Bool)

(assert (=> b!130299 (= e!84995 (contains!878 (toList!846 lt!67706) (tuple2!2567 lt!67250 (minValue!2682 newMap!16))))))

(assert (= (and d!39639 res!62809) b!130298))

(assert (= (and b!130298 res!62810) b!130299))

(declare-fun m!153205 () Bool)

(assert (=> d!39639 m!153205))

(declare-fun m!153207 () Bool)

(assert (=> d!39639 m!153207))

(declare-fun m!153209 () Bool)

(assert (=> d!39639 m!153209))

(declare-fun m!153211 () Bool)

(assert (=> d!39639 m!153211))

(declare-fun m!153213 () Bool)

(assert (=> b!130298 m!153213))

(declare-fun m!153215 () Bool)

(assert (=> b!130299 m!153215))

(assert (=> b!129732 d!39639))

(declare-fun d!39641 () Bool)

(assert (=> d!39641 (= (apply!113 (+!160 lt!67249 (tuple2!2567 lt!67265 (zeroValue!2682 newMap!16))) lt!67258) (apply!113 lt!67249 lt!67258))))

(declare-fun lt!67707 () Unit!4037)

(assert (=> d!39641 (= lt!67707 (choose!796 lt!67249 lt!67265 (zeroValue!2682 newMap!16) lt!67258))))

(declare-fun e!84996 () Bool)

(assert (=> d!39641 e!84996))

(declare-fun res!62811 () Bool)

(assert (=> d!39641 (=> (not res!62811) (not e!84996))))

(assert (=> d!39641 (= res!62811 (contains!876 lt!67249 lt!67258))))

(assert (=> d!39641 (= (addApplyDifferent!89 lt!67249 lt!67265 (zeroValue!2682 newMap!16) lt!67258) lt!67707)))

(declare-fun b!130300 () Bool)

(assert (=> b!130300 (= e!84996 (not (= lt!67258 lt!67265)))))

(assert (= (and d!39641 res!62811) b!130300))

(assert (=> d!39641 m!152147))

(declare-fun m!153217 () Bool)

(assert (=> d!39641 m!153217))

(declare-fun m!153219 () Bool)

(assert (=> d!39641 m!153219))

(assert (=> d!39641 m!152157))

(assert (=> d!39641 m!152157))

(assert (=> d!39641 m!152159))

(assert (=> b!129732 d!39641))

(declare-fun d!39643 () Bool)

(assert (=> d!39643 (= (apply!113 (+!160 lt!67264 (tuple2!2567 lt!67246 (minValue!2682 newMap!16))) lt!67256) (apply!113 lt!67264 lt!67256))))

(declare-fun lt!67708 () Unit!4037)

(assert (=> d!39643 (= lt!67708 (choose!796 lt!67264 lt!67246 (minValue!2682 newMap!16) lt!67256))))

(declare-fun e!84997 () Bool)

(assert (=> d!39643 e!84997))

(declare-fun res!62812 () Bool)

(assert (=> d!39643 (=> (not res!62812) (not e!84997))))

(assert (=> d!39643 (= res!62812 (contains!876 lt!67264 lt!67256))))

(assert (=> d!39643 (= (addApplyDifferent!89 lt!67264 lt!67246 (minValue!2682 newMap!16) lt!67256) lt!67708)))

(declare-fun b!130301 () Bool)

(assert (=> b!130301 (= e!84997 (not (= lt!67256 lt!67246)))))

(assert (= (and d!39643 res!62812) b!130301))

(assert (=> d!39643 m!152141))

(declare-fun m!153221 () Bool)

(assert (=> d!39643 m!153221))

(declare-fun m!153223 () Bool)

(assert (=> d!39643 m!153223))

(assert (=> d!39643 m!152155))

(assert (=> d!39643 m!152155))

(assert (=> d!39643 m!152169))

(assert (=> b!129732 d!39643))

(declare-fun d!39645 () Bool)

(assert (=> d!39645 (= (apply!113 (+!160 lt!67257 (tuple2!2567 lt!67250 (minValue!2682 newMap!16))) lt!67267) (get!1463 (getValueByKey!167 (toList!846 (+!160 lt!67257 (tuple2!2567 lt!67250 (minValue!2682 newMap!16)))) lt!67267)))))

(declare-fun bs!5398 () Bool)

(assert (= bs!5398 d!39645))

(declare-fun m!153225 () Bool)

(assert (=> bs!5398 m!153225))

(assert (=> bs!5398 m!153225))

(declare-fun m!153227 () Bool)

(assert (=> bs!5398 m!153227))

(assert (=> b!129732 d!39645))

(declare-fun d!39647 () Bool)

(assert (=> d!39647 (= (apply!113 (+!160 lt!67264 (tuple2!2567 lt!67246 (minValue!2682 newMap!16))) lt!67256) (get!1463 (getValueByKey!167 (toList!846 (+!160 lt!67264 (tuple2!2567 lt!67246 (minValue!2682 newMap!16)))) lt!67256)))))

(declare-fun bs!5399 () Bool)

(assert (= bs!5399 d!39647))

(declare-fun m!153229 () Bool)

(assert (=> bs!5399 m!153229))

(assert (=> bs!5399 m!153229))

(declare-fun m!153231 () Bool)

(assert (=> bs!5399 m!153231))

(assert (=> b!129732 d!39647))

(declare-fun b!130302 () Bool)

(declare-fun e!84999 () Bool)

(declare-fun e!85004 () Bool)

(assert (=> b!130302 (= e!84999 e!85004)))

(assert (=> b!130302 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2497 (_keys!4563 newMap!16))))))

(declare-fun res!62813 () Bool)

(declare-fun lt!67709 () ListLongMap!1661)

(assert (=> b!130302 (= res!62813 (contains!876 lt!67709 (select (arr!2230 (_keys!4563 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!130302 (=> (not res!62813) (not e!85004))))

(declare-fun bm!14175 () Bool)

(declare-fun call!14178 () ListLongMap!1661)

(assert (=> bm!14175 (= call!14178 (getCurrentListMapNoExtraKeys!125 (_keys!4563 newMap!16) (ite c!23852 (_values!2806 newMap!16) lt!67158) (mask!7100 newMap!16) (extraKeys!2596 newMap!16) (zeroValue!2682 newMap!16) (minValue!2682 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!2823 newMap!16)))))

(declare-fun b!130303 () Bool)

(declare-fun e!84998 () ListLongMap!1661)

(declare-fun e!85001 () ListLongMap!1661)

(assert (=> b!130303 (= e!84998 e!85001)))

(declare-fun c!24037 () Bool)

(assert (=> b!130303 (= c!24037 (validKeyInArray!0 (select (arr!2230 (_keys!4563 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!130304 () Bool)

(assert (=> b!130304 (= e!85001 call!14178)))

(declare-fun d!39649 () Bool)

(declare-fun e!85002 () Bool)

(assert (=> d!39649 e!85002))

(declare-fun res!62816 () Bool)

(assert (=> d!39649 (=> (not res!62816) (not e!85002))))

(assert (=> d!39649 (= res!62816 (not (contains!876 lt!67709 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!39649 (= lt!67709 e!84998)))

(declare-fun c!24038 () Bool)

(assert (=> d!39649 (= c!24038 (bvsge #b00000000000000000000000000000000 (size!2497 (_keys!4563 newMap!16))))))

(assert (=> d!39649 (validMask!0 (mask!7100 newMap!16))))

(assert (=> d!39649 (= (getCurrentListMapNoExtraKeys!125 (_keys!4563 newMap!16) (ite c!23852 (_values!2806 newMap!16) lt!67158) (mask!7100 newMap!16) (extraKeys!2596 newMap!16) (zeroValue!2682 newMap!16) (minValue!2682 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2823 newMap!16)) lt!67709)))

(declare-fun b!130305 () Bool)

(declare-fun e!85003 () Bool)

(assert (=> b!130305 (= e!84999 e!85003)))

(declare-fun c!24040 () Bool)

(assert (=> b!130305 (= c!24040 (bvslt #b00000000000000000000000000000000 (size!2497 (_keys!4563 newMap!16))))))

(declare-fun b!130306 () Bool)

(assert (=> b!130306 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2497 (_keys!4563 newMap!16))))))

(assert (=> b!130306 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2498 (ite c!23852 (_values!2806 newMap!16) lt!67158))))))

(assert (=> b!130306 (= e!85004 (= (apply!113 lt!67709 (select (arr!2230 (_keys!4563 newMap!16)) #b00000000000000000000000000000000)) (get!1459 (select (arr!2231 (ite c!23852 (_values!2806 newMap!16) lt!67158)) #b00000000000000000000000000000000) (dynLambda!414 (defaultEntry!2823 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!130307 () Bool)

(assert (=> b!130307 (= e!85003 (= lt!67709 (getCurrentListMapNoExtraKeys!125 (_keys!4563 newMap!16) (ite c!23852 (_values!2806 newMap!16) lt!67158) (mask!7100 newMap!16) (extraKeys!2596 newMap!16) (zeroValue!2682 newMap!16) (minValue!2682 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!2823 newMap!16))))))

(declare-fun b!130308 () Bool)

(declare-fun lt!67710 () Unit!4037)

(declare-fun lt!67713 () Unit!4037)

(assert (=> b!130308 (= lt!67710 lt!67713)))

(declare-fun lt!67715 () ListLongMap!1661)

(declare-fun lt!67712 () (_ BitVec 64))

(declare-fun lt!67711 () V!3457)

(declare-fun lt!67714 () (_ BitVec 64))

(assert (=> b!130308 (not (contains!876 (+!160 lt!67715 (tuple2!2567 lt!67714 lt!67711)) lt!67712))))

(assert (=> b!130308 (= lt!67713 (addStillNotContains!59 lt!67715 lt!67714 lt!67711 lt!67712))))

(assert (=> b!130308 (= lt!67712 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!130308 (= lt!67711 (get!1459 (select (arr!2231 (ite c!23852 (_values!2806 newMap!16) lt!67158)) #b00000000000000000000000000000000) (dynLambda!414 (defaultEntry!2823 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!130308 (= lt!67714 (select (arr!2230 (_keys!4563 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!130308 (= lt!67715 call!14178)))

(assert (=> b!130308 (= e!85001 (+!160 call!14178 (tuple2!2567 (select (arr!2230 (_keys!4563 newMap!16)) #b00000000000000000000000000000000) (get!1459 (select (arr!2231 (ite c!23852 (_values!2806 newMap!16) lt!67158)) #b00000000000000000000000000000000) (dynLambda!414 (defaultEntry!2823 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!130309 () Bool)

(assert (=> b!130309 (= e!84998 (ListLongMap!1662 Nil!1698))))

(declare-fun b!130310 () Bool)

(assert (=> b!130310 (= e!85003 (isEmpty!406 lt!67709))))

(declare-fun b!130311 () Bool)

(declare-fun res!62814 () Bool)

(assert (=> b!130311 (=> (not res!62814) (not e!85002))))

(assert (=> b!130311 (= res!62814 (not (contains!876 lt!67709 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!130312 () Bool)

(assert (=> b!130312 (= e!85002 e!84999)))

(declare-fun c!24039 () Bool)

(declare-fun e!85000 () Bool)

(assert (=> b!130312 (= c!24039 e!85000)))

(declare-fun res!62815 () Bool)

(assert (=> b!130312 (=> (not res!62815) (not e!85000))))

(assert (=> b!130312 (= res!62815 (bvslt #b00000000000000000000000000000000 (size!2497 (_keys!4563 newMap!16))))))

(declare-fun b!130313 () Bool)

(assert (=> b!130313 (= e!85000 (validKeyInArray!0 (select (arr!2230 (_keys!4563 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!130313 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (= (and d!39649 c!24038) b!130309))

(assert (= (and d!39649 (not c!24038)) b!130303))

(assert (= (and b!130303 c!24037) b!130308))

(assert (= (and b!130303 (not c!24037)) b!130304))

(assert (= (or b!130308 b!130304) bm!14175))

(assert (= (and d!39649 res!62816) b!130311))

(assert (= (and b!130311 res!62814) b!130312))

(assert (= (and b!130312 res!62815) b!130313))

(assert (= (and b!130312 c!24039) b!130302))

(assert (= (and b!130312 (not c!24039)) b!130305))

(assert (= (and b!130302 res!62813) b!130306))

(assert (= (and b!130305 c!24040) b!130307))

(assert (= (and b!130305 (not c!24040)) b!130310))

(declare-fun b_lambda!5775 () Bool)

(assert (=> (not b_lambda!5775) (not b!130306)))

(assert (=> b!130306 t!6103))

(declare-fun b_and!8049 () Bool)

(assert (= b_and!8045 (and (=> t!6103 result!3917) b_and!8049)))

(assert (=> b!130306 t!6105))

(declare-fun b_and!8051 () Bool)

(assert (= b_and!8047 (and (=> t!6105 result!3919) b_and!8051)))

(declare-fun b_lambda!5777 () Bool)

(assert (=> (not b_lambda!5777) (not b!130308)))

(assert (=> b!130308 t!6103))

(declare-fun b_and!8053 () Bool)

(assert (= b_and!8049 (and (=> t!6103 result!3917) b_and!8053)))

(assert (=> b!130308 t!6105))

(declare-fun b_and!8055 () Bool)

(assert (= b_and!8051 (and (=> t!6105 result!3919) b_and!8055)))

(declare-fun m!153233 () Bool)

(assert (=> b!130311 m!153233))

(assert (=> b!130313 m!152019))

(assert (=> b!130313 m!152019))

(assert (=> b!130313 m!152021))

(declare-fun m!153235 () Bool)

(assert (=> b!130307 m!153235))

(declare-fun m!153237 () Bool)

(assert (=> b!130308 m!153237))

(declare-fun m!153239 () Bool)

(assert (=> b!130308 m!153239))

(assert (=> b!130308 m!152175))

(declare-fun m!153241 () Bool)

(assert (=> b!130308 m!153241))

(assert (=> b!130308 m!152175))

(assert (=> b!130308 m!152071))

(assert (=> b!130308 m!152179))

(assert (=> b!130308 m!152019))

(assert (=> b!130308 m!152071))

(assert (=> b!130308 m!153239))

(declare-fun m!153243 () Bool)

(assert (=> b!130308 m!153243))

(declare-fun m!153245 () Bool)

(assert (=> d!39649 m!153245))

(assert (=> d!39649 m!152025))

(assert (=> b!130302 m!152019))

(assert (=> b!130302 m!152019))

(declare-fun m!153247 () Bool)

(assert (=> b!130302 m!153247))

(assert (=> b!130303 m!152019))

(assert (=> b!130303 m!152019))

(assert (=> b!130303 m!152021))

(assert (=> bm!14175 m!153235))

(assert (=> b!130306 m!152019))

(declare-fun m!153249 () Bool)

(assert (=> b!130306 m!153249))

(assert (=> b!130306 m!152175))

(assert (=> b!130306 m!152175))

(assert (=> b!130306 m!152071))

(assert (=> b!130306 m!152179))

(assert (=> b!130306 m!152019))

(assert (=> b!130306 m!152071))

(declare-fun m!153251 () Bool)

(assert (=> b!130310 m!153251))

(assert (=> b!129732 d!39649))

(declare-fun d!39651 () Bool)

(assert (=> d!39651 (= (apply!113 lt!67264 lt!67256) (get!1463 (getValueByKey!167 (toList!846 lt!67264) lt!67256)))))

(declare-fun bs!5400 () Bool)

(assert (= bs!5400 d!39651))

(declare-fun m!153253 () Bool)

(assert (=> bs!5400 m!153253))

(assert (=> bs!5400 m!153253))

(declare-fun m!153255 () Bool)

(assert (=> bs!5400 m!153255))

(assert (=> b!129732 d!39651))

(declare-fun d!39653 () Bool)

(assert (=> d!39653 (= (apply!113 (+!160 lt!67257 (tuple2!2567 lt!67250 (minValue!2682 newMap!16))) lt!67267) (apply!113 lt!67257 lt!67267))))

(declare-fun lt!67716 () Unit!4037)

(assert (=> d!39653 (= lt!67716 (choose!796 lt!67257 lt!67250 (minValue!2682 newMap!16) lt!67267))))

(declare-fun e!85005 () Bool)

(assert (=> d!39653 e!85005))

(declare-fun res!62817 () Bool)

(assert (=> d!39653 (=> (not res!62817) (not e!85005))))

(assert (=> d!39653 (= res!62817 (contains!876 lt!67257 lt!67267))))

(assert (=> d!39653 (= (addApplyDifferent!89 lt!67257 lt!67250 (minValue!2682 newMap!16) lt!67267) lt!67716)))

(declare-fun b!130314 () Bool)

(assert (=> b!130314 (= e!85005 (not (= lt!67267 lt!67250)))))

(assert (= (and d!39653 res!62817) b!130314))

(assert (=> d!39653 m!152143))

(declare-fun m!153257 () Bool)

(assert (=> d!39653 m!153257))

(declare-fun m!153259 () Bool)

(assert (=> d!39653 m!153259))

(assert (=> d!39653 m!152145))

(assert (=> d!39653 m!152145))

(assert (=> d!39653 m!152163))

(assert (=> b!129732 d!39653))

(declare-fun d!39655 () Bool)

(declare-fun e!85006 () Bool)

(assert (=> d!39655 e!85006))

(declare-fun res!62818 () Bool)

(assert (=> d!39655 (=> (not res!62818) (not e!85006))))

(declare-fun lt!67720 () ListLongMap!1661)

(assert (=> d!39655 (= res!62818 (contains!876 lt!67720 (_1!1294 (tuple2!2567 lt!67263 (zeroValue!2682 newMap!16)))))))

(declare-fun lt!67717 () List!1701)

(assert (=> d!39655 (= lt!67720 (ListLongMap!1662 lt!67717))))

(declare-fun lt!67718 () Unit!4037)

(declare-fun lt!67719 () Unit!4037)

(assert (=> d!39655 (= lt!67718 lt!67719)))

(assert (=> d!39655 (= (getValueByKey!167 lt!67717 (_1!1294 (tuple2!2567 lt!67263 (zeroValue!2682 newMap!16)))) (Some!172 (_2!1294 (tuple2!2567 lt!67263 (zeroValue!2682 newMap!16)))))))

(assert (=> d!39655 (= lt!67719 (lemmaContainsTupThenGetReturnValue!85 lt!67717 (_1!1294 (tuple2!2567 lt!67263 (zeroValue!2682 newMap!16))) (_2!1294 (tuple2!2567 lt!67263 (zeroValue!2682 newMap!16)))))))

(assert (=> d!39655 (= lt!67717 (insertStrictlySorted!88 (toList!846 lt!67251) (_1!1294 (tuple2!2567 lt!67263 (zeroValue!2682 newMap!16))) (_2!1294 (tuple2!2567 lt!67263 (zeroValue!2682 newMap!16)))))))

(assert (=> d!39655 (= (+!160 lt!67251 (tuple2!2567 lt!67263 (zeroValue!2682 newMap!16))) lt!67720)))

(declare-fun b!130315 () Bool)

(declare-fun res!62819 () Bool)

(assert (=> b!130315 (=> (not res!62819) (not e!85006))))

(assert (=> b!130315 (= res!62819 (= (getValueByKey!167 (toList!846 lt!67720) (_1!1294 (tuple2!2567 lt!67263 (zeroValue!2682 newMap!16)))) (Some!172 (_2!1294 (tuple2!2567 lt!67263 (zeroValue!2682 newMap!16))))))))

(declare-fun b!130316 () Bool)

(assert (=> b!130316 (= e!85006 (contains!878 (toList!846 lt!67720) (tuple2!2567 lt!67263 (zeroValue!2682 newMap!16))))))

(assert (= (and d!39655 res!62818) b!130315))

(assert (= (and b!130315 res!62819) b!130316))

(declare-fun m!153261 () Bool)

(assert (=> d!39655 m!153261))

(declare-fun m!153263 () Bool)

(assert (=> d!39655 m!153263))

(declare-fun m!153265 () Bool)

(assert (=> d!39655 m!153265))

(declare-fun m!153267 () Bool)

(assert (=> d!39655 m!153267))

(declare-fun m!153269 () Bool)

(assert (=> b!130315 m!153269))

(declare-fun m!153271 () Bool)

(assert (=> b!130316 m!153271))

(assert (=> b!129732 d!39655))

(assert (=> b!129820 d!39465))

(declare-fun b!130335 () Bool)

(declare-fun lt!67725 () SeekEntryResult!275)

(assert (=> b!130335 (and (bvsge (index!3259 lt!67725) #b00000000000000000000000000000000) (bvslt (index!3259 lt!67725) (size!2497 (_keys!4563 newMap!16))))))

(declare-fun res!62827 () Bool)

(assert (=> b!130335 (= res!62827 (= (select (arr!2230 (_keys!4563 newMap!16)) (index!3259 lt!67725)) (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355)))))

(declare-fun e!85019 () Bool)

(assert (=> b!130335 (=> res!62827 e!85019)))

(declare-fun e!85018 () Bool)

(assert (=> b!130335 (= e!85018 e!85019)))

(declare-fun b!130336 () Bool)

(declare-fun e!85017 () SeekEntryResult!275)

(declare-fun e!85021 () SeekEntryResult!275)

(assert (=> b!130336 (= e!85017 e!85021)))

(declare-fun lt!67726 () (_ BitVec 64))

(declare-fun c!24049 () Bool)

(assert (=> b!130336 (= c!24049 (or (= lt!67726 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355)) (= (bvadd lt!67726 lt!67726) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!130337 () Bool)

(declare-fun e!85020 () Bool)

(assert (=> b!130337 (= e!85020 (bvsge (x!15269 lt!67725) #b01111111111111111111111111111110))))

(declare-fun b!130338 () Bool)

(assert (=> b!130338 (= e!85021 (Intermediate!275 false (toIndex!0 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355) (mask!7100 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun d!39657 () Bool)

(assert (=> d!39657 e!85020))

(declare-fun c!24048 () Bool)

(assert (=> d!39657 (= c!24048 (and ((_ is Intermediate!275) lt!67725) (undefined!1087 lt!67725)))))

(assert (=> d!39657 (= lt!67725 e!85017)))

(declare-fun c!24047 () Bool)

(assert (=> d!39657 (= c!24047 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!39657 (= lt!67726 (select (arr!2230 (_keys!4563 newMap!16)) (toIndex!0 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355) (mask!7100 newMap!16))))))

(assert (=> d!39657 (validMask!0 (mask!7100 newMap!16))))

(assert (=> d!39657 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355) (mask!7100 newMap!16)) (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355) (_keys!4563 newMap!16) (mask!7100 newMap!16)) lt!67725)))

(declare-fun b!130339 () Bool)

(assert (=> b!130339 (= e!85020 e!85018)))

(declare-fun res!62828 () Bool)

(assert (=> b!130339 (= res!62828 (and ((_ is Intermediate!275) lt!67725) (not (undefined!1087 lt!67725)) (bvslt (x!15269 lt!67725) #b01111111111111111111111111111110) (bvsge (x!15269 lt!67725) #b00000000000000000000000000000000) (bvsge (x!15269 lt!67725) #b00000000000000000000000000000000)))))

(assert (=> b!130339 (=> (not res!62828) (not e!85018))))

(declare-fun b!130340 () Bool)

(assert (=> b!130340 (and (bvsge (index!3259 lt!67725) #b00000000000000000000000000000000) (bvslt (index!3259 lt!67725) (size!2497 (_keys!4563 newMap!16))))))

(assert (=> b!130340 (= e!85019 (= (select (arr!2230 (_keys!4563 newMap!16)) (index!3259 lt!67725)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!130341 () Bool)

(assert (=> b!130341 (and (bvsge (index!3259 lt!67725) #b00000000000000000000000000000000) (bvslt (index!3259 lt!67725) (size!2497 (_keys!4563 newMap!16))))))

(declare-fun res!62826 () Bool)

(assert (=> b!130341 (= res!62826 (= (select (arr!2230 (_keys!4563 newMap!16)) (index!3259 lt!67725)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!130341 (=> res!62826 e!85019)))

(declare-fun b!130342 () Bool)

(assert (=> b!130342 (= e!85017 (Intermediate!275 true (toIndex!0 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355) (mask!7100 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun b!130343 () Bool)

(assert (=> b!130343 (= e!85021 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355) (mask!7100 newMap!16)) #b00000000000000000000000000000000 (mask!7100 newMap!16)) (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355) (_keys!4563 newMap!16) (mask!7100 newMap!16)))))

(assert (= (and d!39657 c!24047) b!130342))

(assert (= (and d!39657 (not c!24047)) b!130336))

(assert (= (and b!130336 c!24049) b!130338))

(assert (= (and b!130336 (not c!24049)) b!130343))

(assert (= (and d!39657 c!24048) b!130337))

(assert (= (and d!39657 (not c!24048)) b!130339))

(assert (= (and b!130339 res!62828) b!130335))

(assert (= (and b!130335 (not res!62827)) b!130341))

(assert (= (and b!130341 (not res!62826)) b!130340))

(assert (=> d!39657 m!152109))

(declare-fun m!153273 () Bool)

(assert (=> d!39657 m!153273))

(assert (=> d!39657 m!152025))

(declare-fun m!153275 () Bool)

(assert (=> b!130341 m!153275))

(assert (=> b!130343 m!152109))

(declare-fun m!153277 () Bool)

(assert (=> b!130343 m!153277))

(assert (=> b!130343 m!153277))

(assert (=> b!130343 m!151753))

(declare-fun m!153279 () Bool)

(assert (=> b!130343 m!153279))

(assert (=> b!130340 m!153275))

(assert (=> b!130335 m!153275))

(assert (=> d!39351 d!39657))

(declare-fun d!39659 () Bool)

(declare-fun lt!67732 () (_ BitVec 32))

(declare-fun lt!67731 () (_ BitVec 32))

(assert (=> d!39659 (= lt!67732 (bvmul (bvxor lt!67731 (bvlshr lt!67731 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!39659 (= lt!67731 ((_ extract 31 0) (bvand (bvxor (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355) (bvlshr (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!39659 (and (bvsge (mask!7100 newMap!16) #b00000000000000000000000000000000) (let ((res!62829 (let ((h!2304 ((_ extract 31 0) (bvand (bvxor (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355) (bvlshr (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!15373 (bvmul (bvxor h!2304 (bvlshr h!2304 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!15373 (bvlshr x!15373 #b00000000000000000000000000001101)) (mask!7100 newMap!16)))))) (and (bvslt res!62829 (bvadd (mask!7100 newMap!16) #b00000000000000000000000000000001)) (bvsge res!62829 #b00000000000000000000000000000000))))))

(assert (=> d!39659 (= (toIndex!0 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355) (mask!7100 newMap!16)) (bvand (bvxor lt!67732 (bvlshr lt!67732 #b00000000000000000000000000001101)) (mask!7100 newMap!16)))))

(assert (=> d!39351 d!39659))

(assert (=> d!39351 d!39451))

(declare-fun b!130346 () Bool)

(declare-fun e!85023 () Option!173)

(assert (=> b!130346 (= e!85023 (getValueByKey!167 (t!6091 (t!6091 (toList!846 lt!66993))) (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355)))))

(declare-fun b!130344 () Bool)

(declare-fun e!85022 () Option!173)

(assert (=> b!130344 (= e!85022 (Some!172 (_2!1294 (h!2301 (t!6091 (toList!846 lt!66993))))))))

(declare-fun d!39661 () Bool)

(declare-fun c!24050 () Bool)

(assert (=> d!39661 (= c!24050 (and ((_ is Cons!1697) (t!6091 (toList!846 lt!66993))) (= (_1!1294 (h!2301 (t!6091 (toList!846 lt!66993)))) (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355))))))

(assert (=> d!39661 (= (getValueByKey!167 (t!6091 (toList!846 lt!66993)) (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355)) e!85022)))

(declare-fun b!130345 () Bool)

(assert (=> b!130345 (= e!85022 e!85023)))

(declare-fun c!24051 () Bool)

(assert (=> b!130345 (= c!24051 (and ((_ is Cons!1697) (t!6091 (toList!846 lt!66993))) (not (= (_1!1294 (h!2301 (t!6091 (toList!846 lt!66993)))) (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355)))))))

(declare-fun b!130347 () Bool)

(assert (=> b!130347 (= e!85023 None!171)))

(assert (= (and d!39661 c!24050) b!130344))

(assert (= (and d!39661 (not c!24050)) b!130345))

(assert (= (and b!130345 c!24051) b!130346))

(assert (= (and b!130345 (not c!24051)) b!130347))

(assert (=> b!130346 m!151753))

(declare-fun m!153281 () Bool)

(assert (=> b!130346 m!153281))

(assert (=> b!129952 d!39661))

(assert (=> b!129671 d!39465))

(declare-fun d!39663 () Bool)

(assert (=> d!39663 (= (isDefined!121 (getValueByKey!167 (toList!846 lt!67071) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (isEmpty!407 (getValueByKey!167 (toList!846 lt!67071) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bs!5401 () Bool)

(assert (= bs!5401 d!39663))

(assert (=> bs!5401 m!152499))

(declare-fun m!153283 () Bool)

(assert (=> bs!5401 m!153283))

(assert (=> b!129956 d!39663))

(assert (=> b!129956 d!39623))

(declare-fun d!39665 () Bool)

(declare-fun e!85024 () Bool)

(assert (=> d!39665 e!85024))

(declare-fun res!62830 () Bool)

(assert (=> d!39665 (=> (not res!62830) (not e!85024))))

(declare-fun lt!67736 () ListLongMap!1661)

(assert (=> d!39665 (= res!62830 (contains!876 lt!67736 (_1!1294 (tuple2!2567 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!67733 () List!1701)

(assert (=> d!39665 (= lt!67736 (ListLongMap!1662 lt!67733))))

(declare-fun lt!67734 () Unit!4037)

(declare-fun lt!67735 () Unit!4037)

(assert (=> d!39665 (= lt!67734 lt!67735)))

(assert (=> d!39665 (= (getValueByKey!167 lt!67733 (_1!1294 (tuple2!2567 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!172 (_2!1294 (tuple2!2567 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!39665 (= lt!67735 (lemmaContainsTupThenGetReturnValue!85 lt!67733 (_1!1294 (tuple2!2567 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1294 (tuple2!2567 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!39665 (= lt!67733 (insertStrictlySorted!88 (toList!846 (getCurrentListMap!515 (_keys!4563 newMap!16) (_values!2806 newMap!16) (mask!7100 newMap!16) (extraKeys!2596 newMap!16) (zeroValue!2682 newMap!16) (minValue!2682 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2823 newMap!16))) (_1!1294 (tuple2!2567 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1294 (tuple2!2567 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!39665 (= (+!160 (getCurrentListMap!515 (_keys!4563 newMap!16) (_values!2806 newMap!16) (mask!7100 newMap!16) (extraKeys!2596 newMap!16) (zeroValue!2682 newMap!16) (minValue!2682 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2823 newMap!16)) (tuple2!2567 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!67736)))

(declare-fun b!130348 () Bool)

(declare-fun res!62831 () Bool)

(assert (=> b!130348 (=> (not res!62831) (not e!85024))))

(assert (=> b!130348 (= res!62831 (= (getValueByKey!167 (toList!846 lt!67736) (_1!1294 (tuple2!2567 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!172 (_2!1294 (tuple2!2567 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!130349 () Bool)

(assert (=> b!130349 (= e!85024 (contains!878 (toList!846 lt!67736) (tuple2!2567 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!39665 res!62830) b!130348))

(assert (= (and b!130348 res!62831) b!130349))

(declare-fun m!153285 () Bool)

(assert (=> d!39665 m!153285))

(declare-fun m!153287 () Bool)

(assert (=> d!39665 m!153287))

(declare-fun m!153289 () Bool)

(assert (=> d!39665 m!153289))

(declare-fun m!153291 () Bool)

(assert (=> d!39665 m!153291))

(declare-fun m!153293 () Bool)

(assert (=> b!130348 m!153293))

(declare-fun m!153295 () Bool)

(assert (=> b!130349 m!153295))

(assert (=> d!39411 d!39665))

(assert (=> d!39411 d!39339))

(declare-fun d!39667 () Bool)

(assert (=> d!39667 (= (+!160 (getCurrentListMap!515 (_keys!4563 newMap!16) (_values!2806 newMap!16) (mask!7100 newMap!16) (extraKeys!2596 newMap!16) (zeroValue!2682 newMap!16) (minValue!2682 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2823 newMap!16)) (tuple2!2567 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (getCurrentListMap!515 (_keys!4563 newMap!16) (_values!2806 newMap!16) (mask!7100 newMap!16) lt!67148 (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2682 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2823 newMap!16)))))

(assert (=> d!39667 true))

(declare-fun _$7!113 () Unit!4037)

(assert (=> d!39667 (= (choose!798 (_keys!4563 newMap!16) (_values!2806 newMap!16) (mask!7100 newMap!16) (extraKeys!2596 newMap!16) lt!67148 (zeroValue!2682 newMap!16) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2682 newMap!16) (defaultEntry!2823 newMap!16)) _$7!113)))

(declare-fun bs!5402 () Bool)

(assert (= bs!5402 d!39667))

(assert (=> bs!5402 m!151849))

(assert (=> bs!5402 m!151849))

(assert (=> bs!5402 m!152433))

(assert (=> bs!5402 m!151751))

(assert (=> bs!5402 m!152431))

(assert (=> d!39411 d!39667))

(assert (=> d!39411 d!39451))

(declare-fun b!130350 () Bool)

(declare-fun res!62840 () Bool)

(declare-fun e!85035 () Bool)

(assert (=> b!130350 (=> (not res!62840) (not e!85035))))

(declare-fun e!85032 () Bool)

(assert (=> b!130350 (= res!62840 e!85032)))

(declare-fun res!62833 () Bool)

(assert (=> b!130350 (=> res!62833 e!85032)))

(declare-fun e!85028 () Bool)

(assert (=> b!130350 (= res!62833 (not e!85028))))

(declare-fun res!62838 () Bool)

(assert (=> b!130350 (=> (not res!62838) (not e!85028))))

(assert (=> b!130350 (= res!62838 (bvslt #b00000000000000000000000000000000 (size!2497 (_keys!4563 newMap!16))))))

(declare-fun b!130351 () Bool)

(declare-fun lt!67752 () ListLongMap!1661)

(declare-fun e!85037 () Bool)

(assert (=> b!130351 (= e!85037 (= (apply!113 lt!67752 #b0000000000000000000000000000000000000000000000000000000000000000) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!130352 () Bool)

(declare-fun e!85033 () Bool)

(assert (=> b!130352 (= e!85033 e!85037)))

(declare-fun res!62837 () Bool)

(declare-fun call!14181 () Bool)

(assert (=> b!130352 (= res!62837 call!14181)))

(assert (=> b!130352 (=> (not res!62837) (not e!85037))))

(declare-fun b!130353 () Bool)

(declare-fun e!85026 () Bool)

(assert (=> b!130353 (= e!85032 e!85026)))

(declare-fun res!62835 () Bool)

(assert (=> b!130353 (=> (not res!62835) (not e!85026))))

(assert (=> b!130353 (= res!62835 (contains!876 lt!67752 (select (arr!2230 (_keys!4563 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!130353 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2497 (_keys!4563 newMap!16))))))

(declare-fun bm!14176 () Bool)

(declare-fun call!14184 () ListLongMap!1661)

(declare-fun call!14183 () ListLongMap!1661)

(assert (=> bm!14176 (= call!14184 call!14183)))

(declare-fun b!130354 () Bool)

(declare-fun e!85025 () Bool)

(declare-fun e!85027 () Bool)

(assert (=> b!130354 (= e!85025 e!85027)))

(declare-fun res!62836 () Bool)

(declare-fun call!14179 () Bool)

(assert (=> b!130354 (= res!62836 call!14179)))

(assert (=> b!130354 (=> (not res!62836) (not e!85027))))

(declare-fun b!130356 () Bool)

(declare-fun e!85036 () ListLongMap!1661)

(declare-fun call!14185 () ListLongMap!1661)

(assert (=> b!130356 (= e!85036 call!14185)))

(declare-fun b!130357 () Bool)

(declare-fun e!85029 () Bool)

(assert (=> b!130357 (= e!85029 (validKeyInArray!0 (select (arr!2230 (_keys!4563 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun bm!14177 () Bool)

(assert (=> bm!14177 (= call!14183 (getCurrentListMapNoExtraKeys!125 (_keys!4563 newMap!16) (_values!2806 newMap!16) (mask!7100 newMap!16) lt!67148 (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2682 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2823 newMap!16)))))

(declare-fun bm!14178 () Bool)

(assert (=> bm!14178 (= call!14179 (contains!876 lt!67752 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!130358 () Bool)

(assert (=> b!130358 (= e!85026 (= (apply!113 lt!67752 (select (arr!2230 (_keys!4563 newMap!16)) #b00000000000000000000000000000000)) (get!1459 (select (arr!2231 (_values!2806 newMap!16)) #b00000000000000000000000000000000) (dynLambda!414 (defaultEntry!2823 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!130358 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2498 (_values!2806 newMap!16))))))

(assert (=> b!130358 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2497 (_keys!4563 newMap!16))))))

(declare-fun b!130359 () Bool)

(assert (=> b!130359 (= e!85035 e!85025)))

(declare-fun c!24053 () Bool)

(assert (=> b!130359 (= c!24053 (not (= (bvand lt!67148 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!130360 () Bool)

(assert (=> b!130360 (= e!85033 (not call!14181))))

(declare-fun b!130361 () Bool)

(declare-fun e!85031 () Unit!4037)

(declare-fun Unit!4068 () Unit!4037)

(assert (=> b!130361 (= e!85031 Unit!4068)))

(declare-fun b!130362 () Bool)

(declare-fun e!85034 () ListLongMap!1661)

(declare-fun call!14182 () ListLongMap!1661)

(assert (=> b!130362 (= e!85034 call!14182)))

(declare-fun bm!14179 () Bool)

(declare-fun call!14180 () ListLongMap!1661)

(assert (=> bm!14179 (= call!14182 call!14180)))

(declare-fun b!130363 () Bool)

(declare-fun lt!67746 () Unit!4037)

(assert (=> b!130363 (= e!85031 lt!67746)))

(declare-fun lt!67742 () ListLongMap!1661)

(assert (=> b!130363 (= lt!67742 (getCurrentListMapNoExtraKeys!125 (_keys!4563 newMap!16) (_values!2806 newMap!16) (mask!7100 newMap!16) lt!67148 (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2682 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2823 newMap!16)))))

(declare-fun lt!67754 () (_ BitVec 64))

(assert (=> b!130363 (= lt!67754 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!67744 () (_ BitVec 64))

(assert (=> b!130363 (= lt!67744 (select (arr!2230 (_keys!4563 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!67743 () Unit!4037)

(assert (=> b!130363 (= lt!67743 (addStillContains!89 lt!67742 lt!67754 (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) lt!67744))))

(assert (=> b!130363 (contains!876 (+!160 lt!67742 (tuple2!2567 lt!67754 (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!67744)))

(declare-fun lt!67745 () Unit!4037)

(assert (=> b!130363 (= lt!67745 lt!67743)))

(declare-fun lt!67755 () ListLongMap!1661)

(assert (=> b!130363 (= lt!67755 (getCurrentListMapNoExtraKeys!125 (_keys!4563 newMap!16) (_values!2806 newMap!16) (mask!7100 newMap!16) lt!67148 (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2682 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2823 newMap!16)))))

(declare-fun lt!67737 () (_ BitVec 64))

(assert (=> b!130363 (= lt!67737 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!67747 () (_ BitVec 64))

(assert (=> b!130363 (= lt!67747 (select (arr!2230 (_keys!4563 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!67757 () Unit!4037)

(assert (=> b!130363 (= lt!67757 (addApplyDifferent!89 lt!67755 lt!67737 (minValue!2682 newMap!16) lt!67747))))

(assert (=> b!130363 (= (apply!113 (+!160 lt!67755 (tuple2!2567 lt!67737 (minValue!2682 newMap!16))) lt!67747) (apply!113 lt!67755 lt!67747))))

(declare-fun lt!67753 () Unit!4037)

(assert (=> b!130363 (= lt!67753 lt!67757)))

(declare-fun lt!67740 () ListLongMap!1661)

(assert (=> b!130363 (= lt!67740 (getCurrentListMapNoExtraKeys!125 (_keys!4563 newMap!16) (_values!2806 newMap!16) (mask!7100 newMap!16) lt!67148 (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2682 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2823 newMap!16)))))

(declare-fun lt!67756 () (_ BitVec 64))

(assert (=> b!130363 (= lt!67756 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!67749 () (_ BitVec 64))

(assert (=> b!130363 (= lt!67749 (select (arr!2230 (_keys!4563 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!67751 () Unit!4037)

(assert (=> b!130363 (= lt!67751 (addApplyDifferent!89 lt!67740 lt!67756 (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) lt!67749))))

(assert (=> b!130363 (= (apply!113 (+!160 lt!67740 (tuple2!2567 lt!67756 (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!67749) (apply!113 lt!67740 lt!67749))))

(declare-fun lt!67750 () Unit!4037)

(assert (=> b!130363 (= lt!67750 lt!67751)))

(declare-fun lt!67748 () ListLongMap!1661)

(assert (=> b!130363 (= lt!67748 (getCurrentListMapNoExtraKeys!125 (_keys!4563 newMap!16) (_values!2806 newMap!16) (mask!7100 newMap!16) lt!67148 (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2682 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2823 newMap!16)))))

(declare-fun lt!67741 () (_ BitVec 64))

(assert (=> b!130363 (= lt!67741 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!67758 () (_ BitVec 64))

(assert (=> b!130363 (= lt!67758 (select (arr!2230 (_keys!4563 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!130363 (= lt!67746 (addApplyDifferent!89 lt!67748 lt!67741 (minValue!2682 newMap!16) lt!67758))))

(assert (=> b!130363 (= (apply!113 (+!160 lt!67748 (tuple2!2567 lt!67741 (minValue!2682 newMap!16))) lt!67758) (apply!113 lt!67748 lt!67758))))

(declare-fun b!130364 () Bool)

(assert (=> b!130364 (= e!85028 (validKeyInArray!0 (select (arr!2230 (_keys!4563 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!130365 () Bool)

(declare-fun c!24056 () Bool)

(assert (=> b!130365 (= c!24056 (and (not (= (bvand lt!67148 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand lt!67148 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!130365 (= e!85034 e!85036)))

(declare-fun b!130366 () Bool)

(declare-fun res!62839 () Bool)

(assert (=> b!130366 (=> (not res!62839) (not e!85035))))

(assert (=> b!130366 (= res!62839 e!85033)))

(declare-fun c!24054 () Bool)

(assert (=> b!130366 (= c!24054 (not (= (bvand lt!67148 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!130367 () Bool)

(assert (=> b!130367 (= e!85036 call!14182)))

(declare-fun bm!14180 () Bool)

(assert (=> bm!14180 (= call!14185 call!14184)))

(declare-fun b!130368 () Bool)

(assert (=> b!130368 (= e!85027 (= (apply!113 lt!67752 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2682 newMap!16)))))

(declare-fun b!130355 () Bool)

(declare-fun e!85030 () ListLongMap!1661)

(assert (=> b!130355 (= e!85030 (+!160 call!14180 (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2682 newMap!16))))))

(declare-fun d!39669 () Bool)

(assert (=> d!39669 e!85035))

(declare-fun res!62834 () Bool)

(assert (=> d!39669 (=> (not res!62834) (not e!85035))))

(assert (=> d!39669 (= res!62834 (or (bvsge #b00000000000000000000000000000000 (size!2497 (_keys!4563 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2497 (_keys!4563 newMap!16))))))))

(declare-fun lt!67738 () ListLongMap!1661)

(assert (=> d!39669 (= lt!67752 lt!67738)))

(declare-fun lt!67739 () Unit!4037)

(assert (=> d!39669 (= lt!67739 e!85031)))

(declare-fun c!24052 () Bool)

(assert (=> d!39669 (= c!24052 e!85029)))

(declare-fun res!62832 () Bool)

(assert (=> d!39669 (=> (not res!62832) (not e!85029))))

(assert (=> d!39669 (= res!62832 (bvslt #b00000000000000000000000000000000 (size!2497 (_keys!4563 newMap!16))))))

(assert (=> d!39669 (= lt!67738 e!85030)))

(declare-fun c!24057 () Bool)

(assert (=> d!39669 (= c!24057 (and (not (= (bvand lt!67148 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand lt!67148 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!39669 (validMask!0 (mask!7100 newMap!16))))

(assert (=> d!39669 (= (getCurrentListMap!515 (_keys!4563 newMap!16) (_values!2806 newMap!16) (mask!7100 newMap!16) lt!67148 (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2682 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2823 newMap!16)) lt!67752)))

(declare-fun bm!14181 () Bool)

(assert (=> bm!14181 (= call!14181 (contains!876 lt!67752 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!130369 () Bool)

(assert (=> b!130369 (= e!85030 e!85034)))

(declare-fun c!24055 () Bool)

(assert (=> b!130369 (= c!24055 (and (not (= (bvand lt!67148 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand lt!67148 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!14182 () Bool)

(assert (=> bm!14182 (= call!14180 (+!160 (ite c!24057 call!14183 (ite c!24055 call!14184 call!14185)) (ite (or c!24057 c!24055) (tuple2!2567 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2682 newMap!16)))))))

(declare-fun b!130370 () Bool)

(assert (=> b!130370 (= e!85025 (not call!14179))))

(assert (= (and d!39669 c!24057) b!130355))

(assert (= (and d!39669 (not c!24057)) b!130369))

(assert (= (and b!130369 c!24055) b!130362))

(assert (= (and b!130369 (not c!24055)) b!130365))

(assert (= (and b!130365 c!24056) b!130367))

(assert (= (and b!130365 (not c!24056)) b!130356))

(assert (= (or b!130367 b!130356) bm!14180))

(assert (= (or b!130362 bm!14180) bm!14176))

(assert (= (or b!130362 b!130367) bm!14179))

(assert (= (or b!130355 bm!14176) bm!14177))

(assert (= (or b!130355 bm!14179) bm!14182))

(assert (= (and d!39669 res!62832) b!130357))

(assert (= (and d!39669 c!24052) b!130363))

(assert (= (and d!39669 (not c!24052)) b!130361))

(assert (= (and d!39669 res!62834) b!130350))

(assert (= (and b!130350 res!62838) b!130364))

(assert (= (and b!130350 (not res!62833)) b!130353))

(assert (= (and b!130353 res!62835) b!130358))

(assert (= (and b!130350 res!62840) b!130366))

(assert (= (and b!130366 c!24054) b!130352))

(assert (= (and b!130366 (not c!24054)) b!130360))

(assert (= (and b!130352 res!62837) b!130351))

(assert (= (or b!130352 b!130360) bm!14181))

(assert (= (and b!130366 res!62839) b!130359))

(assert (= (and b!130359 c!24053) b!130354))

(assert (= (and b!130359 (not c!24053)) b!130370))

(assert (= (and b!130354 res!62836) b!130368))

(assert (= (or b!130354 b!130370) bm!14178))

(declare-fun b_lambda!5779 () Bool)

(assert (=> (not b_lambda!5779) (not b!130358)))

(assert (=> b!130358 t!6103))

(declare-fun b_and!8057 () Bool)

(assert (= b_and!8053 (and (=> t!6103 result!3917) b_and!8057)))

(assert (=> b!130358 t!6105))

(declare-fun b_and!8059 () Bool)

(assert (= b_and!8055 (and (=> t!6105 result!3919) b_and!8059)))

(declare-fun m!153297 () Bool)

(assert (=> bm!14178 m!153297))

(assert (=> bm!14177 m!151751))

(declare-fun m!153299 () Bool)

(assert (=> bm!14177 m!153299))

(assert (=> b!130364 m!152019))

(assert (=> b!130364 m!152019))

(assert (=> b!130364 m!152021))

(declare-fun m!153301 () Bool)

(assert (=> b!130355 m!153301))

(assert (=> d!39669 m!152025))

(declare-fun m!153303 () Bool)

(assert (=> b!130351 m!153303))

(assert (=> b!130357 m!152019))

(assert (=> b!130357 m!152019))

(assert (=> b!130357 m!152021))

(declare-fun m!153305 () Bool)

(assert (=> b!130368 m!153305))

(declare-fun m!153307 () Bool)

(assert (=> bm!14182 m!153307))

(declare-fun m!153309 () Bool)

(assert (=> b!130363 m!153309))

(declare-fun m!153311 () Bool)

(assert (=> b!130363 m!153311))

(declare-fun m!153313 () Bool)

(assert (=> b!130363 m!153313))

(declare-fun m!153315 () Bool)

(assert (=> b!130363 m!153315))

(assert (=> b!130363 m!151751))

(declare-fun m!153317 () Bool)

(assert (=> b!130363 m!153317))

(declare-fun m!153319 () Bool)

(assert (=> b!130363 m!153319))

(assert (=> b!130363 m!151751))

(assert (=> b!130363 m!153299))

(declare-fun m!153321 () Bool)

(assert (=> b!130363 m!153321))

(assert (=> b!130363 m!152019))

(declare-fun m!153323 () Bool)

(assert (=> b!130363 m!153323))

(declare-fun m!153325 () Bool)

(assert (=> b!130363 m!153325))

(declare-fun m!153327 () Bool)

(assert (=> b!130363 m!153327))

(assert (=> b!130363 m!153319))

(declare-fun m!153329 () Bool)

(assert (=> b!130363 m!153329))

(assert (=> b!130363 m!153313))

(declare-fun m!153331 () Bool)

(assert (=> b!130363 m!153331))

(assert (=> b!130363 m!151751))

(declare-fun m!153333 () Bool)

(assert (=> b!130363 m!153333))

(declare-fun m!153335 () Bool)

(assert (=> b!130363 m!153335))

(assert (=> b!130363 m!153325))

(assert (=> b!130363 m!153323))

(declare-fun m!153337 () Bool)

(assert (=> b!130363 m!153337))

(declare-fun m!153339 () Bool)

(assert (=> bm!14181 m!153339))

(assert (=> b!130353 m!152019))

(assert (=> b!130353 m!152019))

(declare-fun m!153341 () Bool)

(assert (=> b!130353 m!153341))

(assert (=> b!130358 m!152019))

(assert (=> b!130358 m!152067))

(assert (=> b!130358 m!152019))

(declare-fun m!153343 () Bool)

(assert (=> b!130358 m!153343))

(assert (=> b!130358 m!152067))

(assert (=> b!130358 m!152071))

(assert (=> b!130358 m!152073))

(assert (=> b!130358 m!152071))

(assert (=> d!39411 d!39669))

(declare-fun d!39671 () Bool)

(declare-fun e!85039 () Bool)

(assert (=> d!39671 e!85039))

(declare-fun res!62841 () Bool)

(assert (=> d!39671 (=> res!62841 e!85039)))

(declare-fun lt!67761 () Bool)

(assert (=> d!39671 (= res!62841 (not lt!67761))))

(declare-fun lt!67762 () Bool)

(assert (=> d!39671 (= lt!67761 lt!67762)))

(declare-fun lt!67759 () Unit!4037)

(declare-fun e!85038 () Unit!4037)

(assert (=> d!39671 (= lt!67759 e!85038)))

(declare-fun c!24058 () Bool)

(assert (=> d!39671 (= c!24058 lt!67762)))

(assert (=> d!39671 (= lt!67762 (containsKey!171 (toList!846 lt!67448) (_1!1294 (ite (or c!23815 c!23813) (tuple2!2567 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2682 (v!3153 (underlying!442 thiss!992)))) (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2682 (v!3153 (underlying!442 thiss!992))))))))))

(assert (=> d!39671 (= (contains!876 lt!67448 (_1!1294 (ite (or c!23815 c!23813) (tuple2!2567 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2682 (v!3153 (underlying!442 thiss!992)))) (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2682 (v!3153 (underlying!442 thiss!992))))))) lt!67761)))

(declare-fun b!130371 () Bool)

(declare-fun lt!67760 () Unit!4037)

(assert (=> b!130371 (= e!85038 lt!67760)))

(assert (=> b!130371 (= lt!67760 (lemmaContainsKeyImpliesGetValueByKeyDefined!120 (toList!846 lt!67448) (_1!1294 (ite (or c!23815 c!23813) (tuple2!2567 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2682 (v!3153 (underlying!442 thiss!992)))) (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2682 (v!3153 (underlying!442 thiss!992))))))))))

(assert (=> b!130371 (isDefined!121 (getValueByKey!167 (toList!846 lt!67448) (_1!1294 (ite (or c!23815 c!23813) (tuple2!2567 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2682 (v!3153 (underlying!442 thiss!992)))) (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2682 (v!3153 (underlying!442 thiss!992))))))))))

(declare-fun b!130372 () Bool)

(declare-fun Unit!4069 () Unit!4037)

(assert (=> b!130372 (= e!85038 Unit!4069)))

(declare-fun b!130373 () Bool)

(assert (=> b!130373 (= e!85039 (isDefined!121 (getValueByKey!167 (toList!846 lt!67448) (_1!1294 (ite (or c!23815 c!23813) (tuple2!2567 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2682 (v!3153 (underlying!442 thiss!992)))) (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2682 (v!3153 (underlying!442 thiss!992)))))))))))

(assert (= (and d!39671 c!24058) b!130371))

(assert (= (and d!39671 (not c!24058)) b!130372))

(assert (= (and d!39671 (not res!62841)) b!130373))

(declare-fun m!153345 () Bool)

(assert (=> d!39671 m!153345))

(declare-fun m!153347 () Bool)

(assert (=> b!130371 m!153347))

(assert (=> b!130371 m!152477))

(assert (=> b!130371 m!152477))

(declare-fun m!153349 () Bool)

(assert (=> b!130371 m!153349))

(assert (=> b!130373 m!152477))

(assert (=> b!130373 m!152477))

(assert (=> b!130373 m!153349))

(assert (=> d!39427 d!39671))

(declare-fun b!130376 () Bool)

(declare-fun e!85041 () Option!173)

(assert (=> b!130376 (= e!85041 (getValueByKey!167 (t!6091 lt!67445) (_1!1294 (ite (or c!23815 c!23813) (tuple2!2567 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2682 (v!3153 (underlying!442 thiss!992)))) (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2682 (v!3153 (underlying!442 thiss!992))))))))))

(declare-fun b!130374 () Bool)

(declare-fun e!85040 () Option!173)

(assert (=> b!130374 (= e!85040 (Some!172 (_2!1294 (h!2301 lt!67445))))))

(declare-fun c!24059 () Bool)

(declare-fun d!39673 () Bool)

(assert (=> d!39673 (= c!24059 (and ((_ is Cons!1697) lt!67445) (= (_1!1294 (h!2301 lt!67445)) (_1!1294 (ite (or c!23815 c!23813) (tuple2!2567 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2682 (v!3153 (underlying!442 thiss!992)))) (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2682 (v!3153 (underlying!442 thiss!992)))))))))))

(assert (=> d!39673 (= (getValueByKey!167 lt!67445 (_1!1294 (ite (or c!23815 c!23813) (tuple2!2567 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2682 (v!3153 (underlying!442 thiss!992)))) (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2682 (v!3153 (underlying!442 thiss!992))))))) e!85040)))

(declare-fun b!130375 () Bool)

(assert (=> b!130375 (= e!85040 e!85041)))

(declare-fun c!24060 () Bool)

(assert (=> b!130375 (= c!24060 (and ((_ is Cons!1697) lt!67445) (not (= (_1!1294 (h!2301 lt!67445)) (_1!1294 (ite (or c!23815 c!23813) (tuple2!2567 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2682 (v!3153 (underlying!442 thiss!992)))) (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2682 (v!3153 (underlying!442 thiss!992))))))))))))

(declare-fun b!130377 () Bool)

(assert (=> b!130377 (= e!85041 None!171)))

(assert (= (and d!39673 c!24059) b!130374))

(assert (= (and d!39673 (not c!24059)) b!130375))

(assert (= (and b!130375 c!24060) b!130376))

(assert (= (and b!130375 (not c!24060)) b!130377))

(declare-fun m!153351 () Bool)

(assert (=> b!130376 m!153351))

(assert (=> d!39427 d!39673))

(declare-fun d!39675 () Bool)

(assert (=> d!39675 (= (getValueByKey!167 lt!67445 (_1!1294 (ite (or c!23815 c!23813) (tuple2!2567 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2682 (v!3153 (underlying!442 thiss!992)))) (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2682 (v!3153 (underlying!442 thiss!992))))))) (Some!172 (_2!1294 (ite (or c!23815 c!23813) (tuple2!2567 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2682 (v!3153 (underlying!442 thiss!992)))) (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2682 (v!3153 (underlying!442 thiss!992))))))))))

(declare-fun lt!67763 () Unit!4037)

(assert (=> d!39675 (= lt!67763 (choose!802 lt!67445 (_1!1294 (ite (or c!23815 c!23813) (tuple2!2567 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2682 (v!3153 (underlying!442 thiss!992)))) (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2682 (v!3153 (underlying!442 thiss!992)))))) (_2!1294 (ite (or c!23815 c!23813) (tuple2!2567 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2682 (v!3153 (underlying!442 thiss!992)))) (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2682 (v!3153 (underlying!442 thiss!992))))))))))

(declare-fun e!85042 () Bool)

(assert (=> d!39675 e!85042))

(declare-fun res!62842 () Bool)

(assert (=> d!39675 (=> (not res!62842) (not e!85042))))

(assert (=> d!39675 (= res!62842 (isStrictlySorted!314 lt!67445))))

(assert (=> d!39675 (= (lemmaContainsTupThenGetReturnValue!85 lt!67445 (_1!1294 (ite (or c!23815 c!23813) (tuple2!2567 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2682 (v!3153 (underlying!442 thiss!992)))) (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2682 (v!3153 (underlying!442 thiss!992)))))) (_2!1294 (ite (or c!23815 c!23813) (tuple2!2567 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2682 (v!3153 (underlying!442 thiss!992)))) (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2682 (v!3153 (underlying!442 thiss!992))))))) lt!67763)))

(declare-fun b!130378 () Bool)

(declare-fun res!62843 () Bool)

(assert (=> b!130378 (=> (not res!62843) (not e!85042))))

(assert (=> b!130378 (= res!62843 (containsKey!171 lt!67445 (_1!1294 (ite (or c!23815 c!23813) (tuple2!2567 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2682 (v!3153 (underlying!442 thiss!992)))) (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2682 (v!3153 (underlying!442 thiss!992))))))))))

(declare-fun b!130379 () Bool)

(assert (=> b!130379 (= e!85042 (contains!878 lt!67445 (tuple2!2567 (_1!1294 (ite (or c!23815 c!23813) (tuple2!2567 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2682 (v!3153 (underlying!442 thiss!992)))) (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2682 (v!3153 (underlying!442 thiss!992)))))) (_2!1294 (ite (or c!23815 c!23813) (tuple2!2567 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2682 (v!3153 (underlying!442 thiss!992)))) (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2682 (v!3153 (underlying!442 thiss!992)))))))))))

(assert (= (and d!39675 res!62842) b!130378))

(assert (= (and b!130378 res!62843) b!130379))

(assert (=> d!39675 m!152471))

(declare-fun m!153353 () Bool)

(assert (=> d!39675 m!153353))

(declare-fun m!153355 () Bool)

(assert (=> d!39675 m!153355))

(declare-fun m!153357 () Bool)

(assert (=> b!130378 m!153357))

(declare-fun m!153359 () Bool)

(assert (=> b!130379 m!153359))

(assert (=> d!39427 d!39675))

(declare-fun bm!14183 () Bool)

(declare-fun call!14186 () List!1701)

(declare-fun call!14188 () List!1701)

(assert (=> bm!14183 (= call!14186 call!14188)))

(declare-fun b!130380 () Bool)

(declare-fun e!85043 () List!1701)

(declare-fun call!14187 () List!1701)

(assert (=> b!130380 (= e!85043 call!14187)))

(declare-fun e!85047 () List!1701)

(declare-fun c!24062 () Bool)

(declare-fun bm!14184 () Bool)

(assert (=> bm!14184 (= call!14187 ($colon$colon!90 e!85047 (ite c!24062 (h!2301 (toList!846 (ite c!23815 call!14007 (ite c!23813 call!14008 call!14009)))) (tuple2!2567 (_1!1294 (ite (or c!23815 c!23813) (tuple2!2567 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2682 (v!3153 (underlying!442 thiss!992)))) (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2682 (v!3153 (underlying!442 thiss!992)))))) (_2!1294 (ite (or c!23815 c!23813) (tuple2!2567 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2682 (v!3153 (underlying!442 thiss!992)))) (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2682 (v!3153 (underlying!442 thiss!992))))))))))))

(declare-fun c!24064 () Bool)

(assert (=> bm!14184 (= c!24064 c!24062)))

(declare-fun d!39677 () Bool)

(declare-fun e!85045 () Bool)

(assert (=> d!39677 e!85045))

(declare-fun res!62845 () Bool)

(assert (=> d!39677 (=> (not res!62845) (not e!85045))))

(declare-fun lt!67764 () List!1701)

(assert (=> d!39677 (= res!62845 (isStrictlySorted!314 lt!67764))))

(assert (=> d!39677 (= lt!67764 e!85043)))

(assert (=> d!39677 (= c!24062 (and ((_ is Cons!1697) (toList!846 (ite c!23815 call!14007 (ite c!23813 call!14008 call!14009)))) (bvslt (_1!1294 (h!2301 (toList!846 (ite c!23815 call!14007 (ite c!23813 call!14008 call!14009))))) (_1!1294 (ite (or c!23815 c!23813) (tuple2!2567 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2682 (v!3153 (underlying!442 thiss!992)))) (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2682 (v!3153 (underlying!442 thiss!992)))))))))))

(assert (=> d!39677 (isStrictlySorted!314 (toList!846 (ite c!23815 call!14007 (ite c!23813 call!14008 call!14009))))))

(assert (=> d!39677 (= (insertStrictlySorted!88 (toList!846 (ite c!23815 call!14007 (ite c!23813 call!14008 call!14009))) (_1!1294 (ite (or c!23815 c!23813) (tuple2!2567 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2682 (v!3153 (underlying!442 thiss!992)))) (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2682 (v!3153 (underlying!442 thiss!992)))))) (_2!1294 (ite (or c!23815 c!23813) (tuple2!2567 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2682 (v!3153 (underlying!442 thiss!992)))) (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2682 (v!3153 (underlying!442 thiss!992))))))) lt!67764)))

(declare-fun b!130381 () Bool)

(declare-fun e!85046 () List!1701)

(assert (=> b!130381 (= e!85046 call!14186)))

(declare-fun c!24063 () Bool)

(declare-fun c!24061 () Bool)

(declare-fun b!130382 () Bool)

(assert (=> b!130382 (= e!85047 (ite c!24063 (t!6091 (toList!846 (ite c!23815 call!14007 (ite c!23813 call!14008 call!14009)))) (ite c!24061 (Cons!1697 (h!2301 (toList!846 (ite c!23815 call!14007 (ite c!23813 call!14008 call!14009)))) (t!6091 (toList!846 (ite c!23815 call!14007 (ite c!23813 call!14008 call!14009))))) Nil!1698)))))

(declare-fun b!130383 () Bool)

(assert (=> b!130383 (= e!85047 (insertStrictlySorted!88 (t!6091 (toList!846 (ite c!23815 call!14007 (ite c!23813 call!14008 call!14009)))) (_1!1294 (ite (or c!23815 c!23813) (tuple2!2567 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2682 (v!3153 (underlying!442 thiss!992)))) (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2682 (v!3153 (underlying!442 thiss!992)))))) (_2!1294 (ite (or c!23815 c!23813) (tuple2!2567 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2682 (v!3153 (underlying!442 thiss!992)))) (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2682 (v!3153 (underlying!442 thiss!992))))))))))

(declare-fun bm!14185 () Bool)

(assert (=> bm!14185 (= call!14188 call!14187)))

(declare-fun b!130384 () Bool)

(declare-fun e!85044 () List!1701)

(assert (=> b!130384 (= e!85044 call!14188)))

(declare-fun b!130385 () Bool)

(assert (=> b!130385 (= c!24061 (and ((_ is Cons!1697) (toList!846 (ite c!23815 call!14007 (ite c!23813 call!14008 call!14009)))) (bvsgt (_1!1294 (h!2301 (toList!846 (ite c!23815 call!14007 (ite c!23813 call!14008 call!14009))))) (_1!1294 (ite (or c!23815 c!23813) (tuple2!2567 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2682 (v!3153 (underlying!442 thiss!992)))) (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2682 (v!3153 (underlying!442 thiss!992)))))))))))

(assert (=> b!130385 (= e!85044 e!85046)))

(declare-fun b!130386 () Bool)

(assert (=> b!130386 (= e!85045 (contains!878 lt!67764 (tuple2!2567 (_1!1294 (ite (or c!23815 c!23813) (tuple2!2567 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2682 (v!3153 (underlying!442 thiss!992)))) (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2682 (v!3153 (underlying!442 thiss!992)))))) (_2!1294 (ite (or c!23815 c!23813) (tuple2!2567 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2682 (v!3153 (underlying!442 thiss!992)))) (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2682 (v!3153 (underlying!442 thiss!992)))))))))))

(declare-fun b!130387 () Bool)

(assert (=> b!130387 (= e!85046 call!14186)))

(declare-fun b!130388 () Bool)

(declare-fun res!62844 () Bool)

(assert (=> b!130388 (=> (not res!62844) (not e!85045))))

(assert (=> b!130388 (= res!62844 (containsKey!171 lt!67764 (_1!1294 (ite (or c!23815 c!23813) (tuple2!2567 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2682 (v!3153 (underlying!442 thiss!992)))) (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2682 (v!3153 (underlying!442 thiss!992))))))))))

(declare-fun b!130389 () Bool)

(assert (=> b!130389 (= e!85043 e!85044)))

(assert (=> b!130389 (= c!24063 (and ((_ is Cons!1697) (toList!846 (ite c!23815 call!14007 (ite c!23813 call!14008 call!14009)))) (= (_1!1294 (h!2301 (toList!846 (ite c!23815 call!14007 (ite c!23813 call!14008 call!14009))))) (_1!1294 (ite (or c!23815 c!23813) (tuple2!2567 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2682 (v!3153 (underlying!442 thiss!992)))) (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2682 (v!3153 (underlying!442 thiss!992)))))))))))

(assert (= (and d!39677 c!24062) b!130380))

(assert (= (and d!39677 (not c!24062)) b!130389))

(assert (= (and b!130389 c!24063) b!130384))

(assert (= (and b!130389 (not c!24063)) b!130385))

(assert (= (and b!130385 c!24061) b!130387))

(assert (= (and b!130385 (not c!24061)) b!130381))

(assert (= (or b!130387 b!130381) bm!14183))

(assert (= (or b!130384 bm!14183) bm!14185))

(assert (= (or b!130380 bm!14185) bm!14184))

(assert (= (and bm!14184 c!24064) b!130383))

(assert (= (and bm!14184 (not c!24064)) b!130382))

(assert (= (and d!39677 res!62845) b!130388))

(assert (= (and b!130388 res!62844) b!130386))

(declare-fun m!153361 () Bool)

(assert (=> b!130388 m!153361))

(declare-fun m!153363 () Bool)

(assert (=> bm!14184 m!153363))

(declare-fun m!153365 () Bool)

(assert (=> b!130383 m!153365))

(declare-fun m!153367 () Bool)

(assert (=> d!39677 m!153367))

(declare-fun m!153369 () Bool)

(assert (=> d!39677 m!153369))

(declare-fun m!153371 () Bool)

(assert (=> b!130386 m!153371))

(assert (=> d!39427 d!39677))

(declare-fun d!39679 () Bool)

(declare-fun lt!67765 () Bool)

(assert (=> d!39679 (= lt!67765 (select (content!129 (toList!846 lt!67404)) (tuple2!2567 lt!67073 (zeroValue!2682 (v!3153 (underlying!442 thiss!992))))))))

(declare-fun e!85048 () Bool)

(assert (=> d!39679 (= lt!67765 e!85048)))

(declare-fun res!62847 () Bool)

(assert (=> d!39679 (=> (not res!62847) (not e!85048))))

(assert (=> d!39679 (= res!62847 ((_ is Cons!1697) (toList!846 lt!67404)))))

(assert (=> d!39679 (= (contains!878 (toList!846 lt!67404) (tuple2!2567 lt!67073 (zeroValue!2682 (v!3153 (underlying!442 thiss!992))))) lt!67765)))

(declare-fun b!130390 () Bool)

(declare-fun e!85049 () Bool)

(assert (=> b!130390 (= e!85048 e!85049)))

(declare-fun res!62846 () Bool)

(assert (=> b!130390 (=> res!62846 e!85049)))

(assert (=> b!130390 (= res!62846 (= (h!2301 (toList!846 lt!67404)) (tuple2!2567 lt!67073 (zeroValue!2682 (v!3153 (underlying!442 thiss!992))))))))

(declare-fun b!130391 () Bool)

(assert (=> b!130391 (= e!85049 (contains!878 (t!6091 (toList!846 lt!67404)) (tuple2!2567 lt!67073 (zeroValue!2682 (v!3153 (underlying!442 thiss!992))))))))

(assert (= (and d!39679 res!62847) b!130390))

(assert (= (and b!130390 (not res!62846)) b!130391))

(declare-fun m!153373 () Bool)

(assert (=> d!39679 m!153373))

(declare-fun m!153375 () Bool)

(assert (=> d!39679 m!153375))

(declare-fun m!153377 () Bool)

(assert (=> b!130391 m!153377))

(assert (=> b!129835 d!39679))

(declare-fun d!39681 () Bool)

(assert (=> d!39681 (= (map!1381 (_2!1295 lt!67346)) (getCurrentListMap!515 (_keys!4563 (_2!1295 lt!67346)) (_values!2806 (_2!1295 lt!67346)) (mask!7100 (_2!1295 lt!67346)) (extraKeys!2596 (_2!1295 lt!67346)) (zeroValue!2682 (_2!1295 lt!67346)) (minValue!2682 (_2!1295 lt!67346)) #b00000000000000000000000000000000 (defaultEntry!2823 (_2!1295 lt!67346))))))

(declare-fun bs!5403 () Bool)

(assert (= bs!5403 d!39681))

(declare-fun m!153379 () Bool)

(assert (=> bs!5403 m!153379))

(assert (=> b!129802 d!39681))

(declare-fun d!39683 () Bool)

(declare-fun e!85050 () Bool)

(assert (=> d!39683 e!85050))

(declare-fun res!62848 () Bool)

(assert (=> d!39683 (=> (not res!62848) (not e!85050))))

(declare-fun lt!67769 () ListLongMap!1661)

(assert (=> d!39683 (= res!62848 (contains!876 lt!67769 (_1!1294 (tuple2!2567 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!67766 () List!1701)

(assert (=> d!39683 (= lt!67769 (ListLongMap!1662 lt!67766))))

(declare-fun lt!67767 () Unit!4037)

(declare-fun lt!67768 () Unit!4037)

(assert (=> d!39683 (= lt!67767 lt!67768)))

(assert (=> d!39683 (= (getValueByKey!167 lt!67766 (_1!1294 (tuple2!2567 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!172 (_2!1294 (tuple2!2567 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!39683 (= lt!67768 (lemmaContainsTupThenGetReturnValue!85 lt!67766 (_1!1294 (tuple2!2567 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1294 (tuple2!2567 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!39683 (= lt!67766 (insertStrictlySorted!88 (toList!846 (map!1381 newMap!16)) (_1!1294 (tuple2!2567 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1294 (tuple2!2567 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!39683 (= (+!160 (map!1381 newMap!16) (tuple2!2567 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!67769)))

(declare-fun b!130392 () Bool)

(declare-fun res!62849 () Bool)

(assert (=> b!130392 (=> (not res!62849) (not e!85050))))

(assert (=> b!130392 (= res!62849 (= (getValueByKey!167 (toList!846 lt!67769) (_1!1294 (tuple2!2567 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!172 (_2!1294 (tuple2!2567 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!130393 () Bool)

(assert (=> b!130393 (= e!85050 (contains!878 (toList!846 lt!67769) (tuple2!2567 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!39683 res!62848) b!130392))

(assert (= (and b!130392 res!62849) b!130393))

(declare-fun m!153381 () Bool)

(assert (=> d!39683 m!153381))

(declare-fun m!153383 () Bool)

(assert (=> d!39683 m!153383))

(declare-fun m!153385 () Bool)

(assert (=> d!39683 m!153385))

(declare-fun m!153387 () Bool)

(assert (=> d!39683 m!153387))

(declare-fun m!153389 () Bool)

(assert (=> b!130392 m!153389))

(declare-fun m!153391 () Bool)

(assert (=> b!130393 m!153391))

(assert (=> b!129802 d!39683))

(assert (=> b!129802 d!39313))

(declare-fun d!39685 () Bool)

(declare-fun e!85052 () Bool)

(assert (=> d!39685 e!85052))

(declare-fun res!62850 () Bool)

(assert (=> d!39685 (=> res!62850 e!85052)))

(declare-fun lt!67772 () Bool)

(assert (=> d!39685 (= res!62850 (not lt!67772))))

(declare-fun lt!67773 () Bool)

(assert (=> d!39685 (= lt!67772 lt!67773)))

(declare-fun lt!67770 () Unit!4037)

(declare-fun e!85051 () Unit!4037)

(assert (=> d!39685 (= lt!67770 e!85051)))

(declare-fun c!24065 () Bool)

(assert (=> d!39685 (= c!24065 lt!67773)))

(assert (=> d!39685 (= lt!67773 (containsKey!171 (toList!846 lt!67408) (_1!1294 (tuple2!2567 lt!67060 (minValue!2682 (v!3153 (underlying!442 thiss!992)))))))))

(assert (=> d!39685 (= (contains!876 lt!67408 (_1!1294 (tuple2!2567 lt!67060 (minValue!2682 (v!3153 (underlying!442 thiss!992)))))) lt!67772)))

(declare-fun b!130394 () Bool)

(declare-fun lt!67771 () Unit!4037)

(assert (=> b!130394 (= e!85051 lt!67771)))

(assert (=> b!130394 (= lt!67771 (lemmaContainsKeyImpliesGetValueByKeyDefined!120 (toList!846 lt!67408) (_1!1294 (tuple2!2567 lt!67060 (minValue!2682 (v!3153 (underlying!442 thiss!992)))))))))

(assert (=> b!130394 (isDefined!121 (getValueByKey!167 (toList!846 lt!67408) (_1!1294 (tuple2!2567 lt!67060 (minValue!2682 (v!3153 (underlying!442 thiss!992)))))))))

(declare-fun b!130395 () Bool)

(declare-fun Unit!4070 () Unit!4037)

(assert (=> b!130395 (= e!85051 Unit!4070)))

(declare-fun b!130396 () Bool)

(assert (=> b!130396 (= e!85052 (isDefined!121 (getValueByKey!167 (toList!846 lt!67408) (_1!1294 (tuple2!2567 lt!67060 (minValue!2682 (v!3153 (underlying!442 thiss!992))))))))))

(assert (= (and d!39685 c!24065) b!130394))

(assert (= (and d!39685 (not c!24065)) b!130395))

(assert (= (and d!39685 (not res!62850)) b!130396))

(declare-fun m!153393 () Bool)

(assert (=> d!39685 m!153393))

(declare-fun m!153395 () Bool)

(assert (=> b!130394 m!153395))

(assert (=> b!130394 m!152377))

(assert (=> b!130394 m!152377))

(declare-fun m!153397 () Bool)

(assert (=> b!130394 m!153397))

(assert (=> b!130396 m!152377))

(assert (=> b!130396 m!152377))

(assert (=> b!130396 m!153397))

(assert (=> d!39395 d!39685))

(declare-fun e!85054 () Option!173)

(declare-fun b!130399 () Bool)

(assert (=> b!130399 (= e!85054 (getValueByKey!167 (t!6091 lt!67405) (_1!1294 (tuple2!2567 lt!67060 (minValue!2682 (v!3153 (underlying!442 thiss!992)))))))))

(declare-fun b!130397 () Bool)

(declare-fun e!85053 () Option!173)

(assert (=> b!130397 (= e!85053 (Some!172 (_2!1294 (h!2301 lt!67405))))))

(declare-fun c!24066 () Bool)

(declare-fun d!39687 () Bool)

(assert (=> d!39687 (= c!24066 (and ((_ is Cons!1697) lt!67405) (= (_1!1294 (h!2301 lt!67405)) (_1!1294 (tuple2!2567 lt!67060 (minValue!2682 (v!3153 (underlying!442 thiss!992))))))))))

(assert (=> d!39687 (= (getValueByKey!167 lt!67405 (_1!1294 (tuple2!2567 lt!67060 (minValue!2682 (v!3153 (underlying!442 thiss!992)))))) e!85053)))

(declare-fun b!130398 () Bool)

(assert (=> b!130398 (= e!85053 e!85054)))

(declare-fun c!24067 () Bool)

(assert (=> b!130398 (= c!24067 (and ((_ is Cons!1697) lt!67405) (not (= (_1!1294 (h!2301 lt!67405)) (_1!1294 (tuple2!2567 lt!67060 (minValue!2682 (v!3153 (underlying!442 thiss!992)))))))))))

(declare-fun b!130400 () Bool)

(assert (=> b!130400 (= e!85054 None!171)))

(assert (= (and d!39687 c!24066) b!130397))

(assert (= (and d!39687 (not c!24066)) b!130398))

(assert (= (and b!130398 c!24067) b!130399))

(assert (= (and b!130398 (not c!24067)) b!130400))

(declare-fun m!153399 () Bool)

(assert (=> b!130399 m!153399))

(assert (=> d!39395 d!39687))

(declare-fun d!39689 () Bool)

(assert (=> d!39689 (= (getValueByKey!167 lt!67405 (_1!1294 (tuple2!2567 lt!67060 (minValue!2682 (v!3153 (underlying!442 thiss!992)))))) (Some!172 (_2!1294 (tuple2!2567 lt!67060 (minValue!2682 (v!3153 (underlying!442 thiss!992)))))))))

(declare-fun lt!67774 () Unit!4037)

(assert (=> d!39689 (= lt!67774 (choose!802 lt!67405 (_1!1294 (tuple2!2567 lt!67060 (minValue!2682 (v!3153 (underlying!442 thiss!992))))) (_2!1294 (tuple2!2567 lt!67060 (minValue!2682 (v!3153 (underlying!442 thiss!992)))))))))

(declare-fun e!85055 () Bool)

(assert (=> d!39689 e!85055))

(declare-fun res!62851 () Bool)

(assert (=> d!39689 (=> (not res!62851) (not e!85055))))

(assert (=> d!39689 (= res!62851 (isStrictlySorted!314 lt!67405))))

(assert (=> d!39689 (= (lemmaContainsTupThenGetReturnValue!85 lt!67405 (_1!1294 (tuple2!2567 lt!67060 (minValue!2682 (v!3153 (underlying!442 thiss!992))))) (_2!1294 (tuple2!2567 lt!67060 (minValue!2682 (v!3153 (underlying!442 thiss!992)))))) lt!67774)))

(declare-fun b!130401 () Bool)

(declare-fun res!62852 () Bool)

(assert (=> b!130401 (=> (not res!62852) (not e!85055))))

(assert (=> b!130401 (= res!62852 (containsKey!171 lt!67405 (_1!1294 (tuple2!2567 lt!67060 (minValue!2682 (v!3153 (underlying!442 thiss!992)))))))))

(declare-fun b!130402 () Bool)

(assert (=> b!130402 (= e!85055 (contains!878 lt!67405 (tuple2!2567 (_1!1294 (tuple2!2567 lt!67060 (minValue!2682 (v!3153 (underlying!442 thiss!992))))) (_2!1294 (tuple2!2567 lt!67060 (minValue!2682 (v!3153 (underlying!442 thiss!992))))))))))

(assert (= (and d!39689 res!62851) b!130401))

(assert (= (and b!130401 res!62852) b!130402))

(assert (=> d!39689 m!152371))

(declare-fun m!153401 () Bool)

(assert (=> d!39689 m!153401))

(declare-fun m!153403 () Bool)

(assert (=> d!39689 m!153403))

(declare-fun m!153405 () Bool)

(assert (=> b!130401 m!153405))

(declare-fun m!153407 () Bool)

(assert (=> b!130402 m!153407))

(assert (=> d!39395 d!39689))

(declare-fun bm!14186 () Bool)

(declare-fun call!14189 () List!1701)

(declare-fun call!14191 () List!1701)

(assert (=> bm!14186 (= call!14189 call!14191)))

(declare-fun b!130403 () Bool)

(declare-fun e!85056 () List!1701)

(declare-fun call!14190 () List!1701)

(assert (=> b!130403 (= e!85056 call!14190)))

(declare-fun c!24069 () Bool)

(declare-fun bm!14187 () Bool)

(declare-fun e!85060 () List!1701)

(assert (=> bm!14187 (= call!14190 ($colon$colon!90 e!85060 (ite c!24069 (h!2301 (toList!846 lt!67067)) (tuple2!2567 (_1!1294 (tuple2!2567 lt!67060 (minValue!2682 (v!3153 (underlying!442 thiss!992))))) (_2!1294 (tuple2!2567 lt!67060 (minValue!2682 (v!3153 (underlying!442 thiss!992)))))))))))

(declare-fun c!24071 () Bool)

(assert (=> bm!14187 (= c!24071 c!24069)))

(declare-fun d!39691 () Bool)

(declare-fun e!85058 () Bool)

(assert (=> d!39691 e!85058))

(declare-fun res!62854 () Bool)

(assert (=> d!39691 (=> (not res!62854) (not e!85058))))

(declare-fun lt!67775 () List!1701)

(assert (=> d!39691 (= res!62854 (isStrictlySorted!314 lt!67775))))

(assert (=> d!39691 (= lt!67775 e!85056)))

(assert (=> d!39691 (= c!24069 (and ((_ is Cons!1697) (toList!846 lt!67067)) (bvslt (_1!1294 (h!2301 (toList!846 lt!67067))) (_1!1294 (tuple2!2567 lt!67060 (minValue!2682 (v!3153 (underlying!442 thiss!992))))))))))

(assert (=> d!39691 (isStrictlySorted!314 (toList!846 lt!67067))))

(assert (=> d!39691 (= (insertStrictlySorted!88 (toList!846 lt!67067) (_1!1294 (tuple2!2567 lt!67060 (minValue!2682 (v!3153 (underlying!442 thiss!992))))) (_2!1294 (tuple2!2567 lt!67060 (minValue!2682 (v!3153 (underlying!442 thiss!992)))))) lt!67775)))

(declare-fun b!130404 () Bool)

(declare-fun e!85059 () List!1701)

(assert (=> b!130404 (= e!85059 call!14189)))

(declare-fun c!24070 () Bool)

(declare-fun b!130405 () Bool)

(declare-fun c!24068 () Bool)

(assert (=> b!130405 (= e!85060 (ite c!24070 (t!6091 (toList!846 lt!67067)) (ite c!24068 (Cons!1697 (h!2301 (toList!846 lt!67067)) (t!6091 (toList!846 lt!67067))) Nil!1698)))))

(declare-fun b!130406 () Bool)

(assert (=> b!130406 (= e!85060 (insertStrictlySorted!88 (t!6091 (toList!846 lt!67067)) (_1!1294 (tuple2!2567 lt!67060 (minValue!2682 (v!3153 (underlying!442 thiss!992))))) (_2!1294 (tuple2!2567 lt!67060 (minValue!2682 (v!3153 (underlying!442 thiss!992)))))))))

(declare-fun bm!14188 () Bool)

(assert (=> bm!14188 (= call!14191 call!14190)))

(declare-fun b!130407 () Bool)

(declare-fun e!85057 () List!1701)

(assert (=> b!130407 (= e!85057 call!14191)))

(declare-fun b!130408 () Bool)

(assert (=> b!130408 (= c!24068 (and ((_ is Cons!1697) (toList!846 lt!67067)) (bvsgt (_1!1294 (h!2301 (toList!846 lt!67067))) (_1!1294 (tuple2!2567 lt!67060 (minValue!2682 (v!3153 (underlying!442 thiss!992))))))))))

(assert (=> b!130408 (= e!85057 e!85059)))

(declare-fun b!130409 () Bool)

(assert (=> b!130409 (= e!85058 (contains!878 lt!67775 (tuple2!2567 (_1!1294 (tuple2!2567 lt!67060 (minValue!2682 (v!3153 (underlying!442 thiss!992))))) (_2!1294 (tuple2!2567 lt!67060 (minValue!2682 (v!3153 (underlying!442 thiss!992))))))))))

(declare-fun b!130410 () Bool)

(assert (=> b!130410 (= e!85059 call!14189)))

(declare-fun b!130411 () Bool)

(declare-fun res!62853 () Bool)

(assert (=> b!130411 (=> (not res!62853) (not e!85058))))

(assert (=> b!130411 (= res!62853 (containsKey!171 lt!67775 (_1!1294 (tuple2!2567 lt!67060 (minValue!2682 (v!3153 (underlying!442 thiss!992)))))))))

(declare-fun b!130412 () Bool)

(assert (=> b!130412 (= e!85056 e!85057)))

(assert (=> b!130412 (= c!24070 (and ((_ is Cons!1697) (toList!846 lt!67067)) (= (_1!1294 (h!2301 (toList!846 lt!67067))) (_1!1294 (tuple2!2567 lt!67060 (minValue!2682 (v!3153 (underlying!442 thiss!992))))))))))

(assert (= (and d!39691 c!24069) b!130403))

(assert (= (and d!39691 (not c!24069)) b!130412))

(assert (= (and b!130412 c!24070) b!130407))

(assert (= (and b!130412 (not c!24070)) b!130408))

(assert (= (and b!130408 c!24068) b!130410))

(assert (= (and b!130408 (not c!24068)) b!130404))

(assert (= (or b!130410 b!130404) bm!14186))

(assert (= (or b!130407 bm!14186) bm!14188))

(assert (= (or b!130403 bm!14188) bm!14187))

(assert (= (and bm!14187 c!24071) b!130406))

(assert (= (and bm!14187 (not c!24071)) b!130405))

(assert (= (and d!39691 res!62854) b!130411))

(assert (= (and b!130411 res!62853) b!130409))

(declare-fun m!153409 () Bool)

(assert (=> b!130411 m!153409))

(declare-fun m!153411 () Bool)

(assert (=> bm!14187 m!153411))

(declare-fun m!153413 () Bool)

(assert (=> b!130406 m!153413))

(declare-fun m!153415 () Bool)

(assert (=> d!39691 m!153415))

(declare-fun m!153417 () Bool)

(assert (=> d!39691 m!153417))

(declare-fun m!153419 () Bool)

(assert (=> b!130409 m!153419))

(assert (=> d!39395 d!39691))

(declare-fun d!39693 () Bool)

(assert (=> d!39693 (= (get!1461 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (v!3152 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!129685 d!39693))

(declare-fun d!39695 () Bool)

(assert (=> d!39695 (= (apply!113 lt!67387 #b0000000000000000000000000000000000000000000000000000000000000000) (get!1463 (getValueByKey!167 (toList!846 lt!67387) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!5404 () Bool)

(assert (= bs!5404 d!39695))

(declare-fun m!153421 () Bool)

(assert (=> bs!5404 m!153421))

(assert (=> bs!5404 m!153421))

(declare-fun m!153423 () Bool)

(assert (=> bs!5404 m!153423))

(assert (=> b!129807 d!39695))

(declare-fun b!130414 () Bool)

(declare-fun res!62856 () Bool)

(declare-fun e!85061 () Bool)

(assert (=> b!130414 (=> (not res!62856) (not e!85061))))

(assert (=> b!130414 (= res!62856 (bvsge (size!2503 (v!3153 (underlying!442 thiss!992))) (_size!588 (v!3153 (underlying!442 thiss!992)))))))

(declare-fun d!39697 () Bool)

(declare-fun res!62855 () Bool)

(assert (=> d!39697 (=> (not res!62855) (not e!85061))))

(assert (=> d!39697 (= res!62855 (validMask!0 (mask!7100 (v!3153 (underlying!442 thiss!992)))))))

(assert (=> d!39697 (= (simpleValid!89 (v!3153 (underlying!442 thiss!992))) e!85061)))

(declare-fun b!130413 () Bool)

(declare-fun res!62857 () Bool)

(assert (=> b!130413 (=> (not res!62857) (not e!85061))))

(assert (=> b!130413 (= res!62857 (and (= (size!2498 (_values!2806 (v!3153 (underlying!442 thiss!992)))) (bvadd (mask!7100 (v!3153 (underlying!442 thiss!992))) #b00000000000000000000000000000001)) (= (size!2497 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) (size!2498 (_values!2806 (v!3153 (underlying!442 thiss!992))))) (bvsge (_size!588 (v!3153 (underlying!442 thiss!992))) #b00000000000000000000000000000000) (bvsle (_size!588 (v!3153 (underlying!442 thiss!992))) (bvadd (mask!7100 (v!3153 (underlying!442 thiss!992))) #b00000000000000000000000000000001))))))

(declare-fun b!130416 () Bool)

(assert (=> b!130416 (= e!85061 (and (bvsge (extraKeys!2596 (v!3153 (underlying!442 thiss!992))) #b00000000000000000000000000000000) (bvsle (extraKeys!2596 (v!3153 (underlying!442 thiss!992))) #b00000000000000000000000000000011) (bvsge (_vacant!588 (v!3153 (underlying!442 thiss!992))) #b00000000000000000000000000000000)))))

(declare-fun b!130415 () Bool)

(declare-fun res!62858 () Bool)

(assert (=> b!130415 (=> (not res!62858) (not e!85061))))

(assert (=> b!130415 (= res!62858 (= (size!2503 (v!3153 (underlying!442 thiss!992))) (bvadd (_size!588 (v!3153 (underlying!442 thiss!992))) (bvsdiv (bvadd (extraKeys!2596 (v!3153 (underlying!442 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(assert (= (and d!39697 res!62855) b!130413))

(assert (= (and b!130413 res!62857) b!130414))

(assert (= (and b!130414 res!62856) b!130415))

(assert (= (and b!130415 res!62858) b!130416))

(declare-fun m!153425 () Bool)

(assert (=> b!130414 m!153425))

(assert (=> d!39697 m!151769))

(assert (=> b!130415 m!153425))

(assert (=> d!39425 d!39697))

(declare-fun d!39699 () Bool)

(declare-fun e!85062 () Bool)

(assert (=> d!39699 e!85062))

(declare-fun res!62859 () Bool)

(assert (=> d!39699 (=> (not res!62859) (not e!85062))))

(declare-fun lt!67779 () ListLongMap!1661)

(assert (=> d!39699 (= res!62859 (contains!876 lt!67779 (_1!1294 (ite (or c!23918 c!23916) (tuple2!2567 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (and c!23852 c!23848) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2682 newMap!16))) (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!23852 (ite c!23848 (minValue!2682 newMap!16) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2682 newMap!16)))))))))

(declare-fun lt!67776 () List!1701)

(assert (=> d!39699 (= lt!67779 (ListLongMap!1662 lt!67776))))

(declare-fun lt!67777 () Unit!4037)

(declare-fun lt!67778 () Unit!4037)

(assert (=> d!39699 (= lt!67777 lt!67778)))

(assert (=> d!39699 (= (getValueByKey!167 lt!67776 (_1!1294 (ite (or c!23918 c!23916) (tuple2!2567 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (and c!23852 c!23848) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2682 newMap!16))) (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!23852 (ite c!23848 (minValue!2682 newMap!16) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2682 newMap!16)))))) (Some!172 (_2!1294 (ite (or c!23918 c!23916) (tuple2!2567 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (and c!23852 c!23848) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2682 newMap!16))) (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!23852 (ite c!23848 (minValue!2682 newMap!16) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2682 newMap!16)))))))))

(assert (=> d!39699 (= lt!67778 (lemmaContainsTupThenGetReturnValue!85 lt!67776 (_1!1294 (ite (or c!23918 c!23916) (tuple2!2567 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (and c!23852 c!23848) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2682 newMap!16))) (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!23852 (ite c!23848 (minValue!2682 newMap!16) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2682 newMap!16))))) (_2!1294 (ite (or c!23918 c!23916) (tuple2!2567 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (and c!23852 c!23848) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2682 newMap!16))) (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!23852 (ite c!23848 (minValue!2682 newMap!16) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2682 newMap!16)))))))))

(assert (=> d!39699 (= lt!67776 (insertStrictlySorted!88 (toList!846 (ite c!23918 call!14115 (ite c!23916 call!14116 call!14117))) (_1!1294 (ite (or c!23918 c!23916) (tuple2!2567 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (and c!23852 c!23848) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2682 newMap!16))) (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!23852 (ite c!23848 (minValue!2682 newMap!16) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2682 newMap!16))))) (_2!1294 (ite (or c!23918 c!23916) (tuple2!2567 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (and c!23852 c!23848) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2682 newMap!16))) (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!23852 (ite c!23848 (minValue!2682 newMap!16) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2682 newMap!16)))))))))

(assert (=> d!39699 (= (+!160 (ite c!23918 call!14115 (ite c!23916 call!14116 call!14117)) (ite (or c!23918 c!23916) (tuple2!2567 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (and c!23852 c!23848) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2682 newMap!16))) (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!23852 (ite c!23848 (minValue!2682 newMap!16) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2682 newMap!16))))) lt!67779)))

(declare-fun b!130417 () Bool)

(declare-fun res!62860 () Bool)

(assert (=> b!130417 (=> (not res!62860) (not e!85062))))

(assert (=> b!130417 (= res!62860 (= (getValueByKey!167 (toList!846 lt!67779) (_1!1294 (ite (or c!23918 c!23916) (tuple2!2567 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (and c!23852 c!23848) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2682 newMap!16))) (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!23852 (ite c!23848 (minValue!2682 newMap!16) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2682 newMap!16)))))) (Some!172 (_2!1294 (ite (or c!23918 c!23916) (tuple2!2567 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (and c!23852 c!23848) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2682 newMap!16))) (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!23852 (ite c!23848 (minValue!2682 newMap!16) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2682 newMap!16))))))))))

(declare-fun b!130418 () Bool)

(assert (=> b!130418 (= e!85062 (contains!878 (toList!846 lt!67779) (ite (or c!23918 c!23916) (tuple2!2567 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (and c!23852 c!23848) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2682 newMap!16))) (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!23852 (ite c!23848 (minValue!2682 newMap!16) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2682 newMap!16))))))))

(assert (= (and d!39699 res!62859) b!130417))

(assert (= (and b!130417 res!62860) b!130418))

(declare-fun m!153427 () Bool)

(assert (=> d!39699 m!153427))

(declare-fun m!153429 () Bool)

(assert (=> d!39699 m!153429))

(declare-fun m!153431 () Bool)

(assert (=> d!39699 m!153431))

(declare-fun m!153433 () Bool)

(assert (=> d!39699 m!153433))

(declare-fun m!153435 () Bool)

(assert (=> b!130417 m!153435))

(declare-fun m!153437 () Bool)

(assert (=> b!130418 m!153437))

(assert (=> bm!14114 d!39699))

(declare-fun d!39701 () Bool)

(assert (=> d!39701 (= (isDefined!121 (getValueByKey!167 (toList!846 lt!67071) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (isEmpty!407 (getValueByKey!167 (toList!846 lt!67071) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bs!5405 () Bool)

(assert (= bs!5405 d!39701))

(assert (=> bs!5405 m!152011))

(declare-fun m!153439 () Bool)

(assert (=> bs!5405 m!153439))

(assert (=> b!129663 d!39701))

(assert (=> b!129663 d!39487))

(declare-fun d!39703 () Bool)

(declare-fun res!62861 () Bool)

(declare-fun e!85063 () Bool)

(assert (=> d!39703 (=> res!62861 e!85063)))

(assert (=> d!39703 (= res!62861 (and ((_ is Cons!1697) (toList!846 lt!67071)) (= (_1!1294 (h!2301 (toList!846 lt!67071))) (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(assert (=> d!39703 (= (containsKey!171 (toList!846 lt!67071) (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) e!85063)))

(declare-fun b!130419 () Bool)

(declare-fun e!85064 () Bool)

(assert (=> b!130419 (= e!85063 e!85064)))

(declare-fun res!62862 () Bool)

(assert (=> b!130419 (=> (not res!62862) (not e!85064))))

(assert (=> b!130419 (= res!62862 (and (or (not ((_ is Cons!1697) (toList!846 lt!67071))) (bvsle (_1!1294 (h!2301 (toList!846 lt!67071))) (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))) ((_ is Cons!1697) (toList!846 lt!67071)) (bvslt (_1!1294 (h!2301 (toList!846 lt!67071))) (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(declare-fun b!130420 () Bool)

(assert (=> b!130420 (= e!85064 (containsKey!171 (t!6091 (toList!846 lt!67071)) (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (= (and d!39703 (not res!62861)) b!130419))

(assert (= (and b!130419 res!62862) b!130420))

(assert (=> b!130420 m!151855))

(declare-fun m!153441 () Bool)

(assert (=> b!130420 m!153441))

(assert (=> d!39445 d!39703))

(declare-fun b!130422 () Bool)

(declare-fun res!62864 () Bool)

(declare-fun e!85065 () Bool)

(assert (=> b!130422 (=> (not res!62864) (not e!85065))))

(assert (=> b!130422 (= res!62864 (bvsge (size!2503 (_2!1295 lt!67144)) (_size!588 (_2!1295 lt!67144))))))

(declare-fun d!39705 () Bool)

(declare-fun res!62863 () Bool)

(assert (=> d!39705 (=> (not res!62863) (not e!85065))))

(assert (=> d!39705 (= res!62863 (validMask!0 (mask!7100 (_2!1295 lt!67144))))))

(assert (=> d!39705 (= (simpleValid!89 (_2!1295 lt!67144)) e!85065)))

(declare-fun b!130421 () Bool)

(declare-fun res!62865 () Bool)

(assert (=> b!130421 (=> (not res!62865) (not e!85065))))

(assert (=> b!130421 (= res!62865 (and (= (size!2498 (_values!2806 (_2!1295 lt!67144))) (bvadd (mask!7100 (_2!1295 lt!67144)) #b00000000000000000000000000000001)) (= (size!2497 (_keys!4563 (_2!1295 lt!67144))) (size!2498 (_values!2806 (_2!1295 lt!67144)))) (bvsge (_size!588 (_2!1295 lt!67144)) #b00000000000000000000000000000000) (bvsle (_size!588 (_2!1295 lt!67144)) (bvadd (mask!7100 (_2!1295 lt!67144)) #b00000000000000000000000000000001))))))

(declare-fun b!130424 () Bool)

(assert (=> b!130424 (= e!85065 (and (bvsge (extraKeys!2596 (_2!1295 lt!67144)) #b00000000000000000000000000000000) (bvsle (extraKeys!2596 (_2!1295 lt!67144)) #b00000000000000000000000000000011) (bvsge (_vacant!588 (_2!1295 lt!67144)) #b00000000000000000000000000000000)))))

(declare-fun b!130423 () Bool)

(declare-fun res!62866 () Bool)

(assert (=> b!130423 (=> (not res!62866) (not e!85065))))

(assert (=> b!130423 (= res!62866 (= (size!2503 (_2!1295 lt!67144)) (bvadd (_size!588 (_2!1295 lt!67144)) (bvsdiv (bvadd (extraKeys!2596 (_2!1295 lt!67144)) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(assert (= (and d!39705 res!62863) b!130421))

(assert (= (and b!130421 res!62865) b!130422))

(assert (= (and b!130422 res!62864) b!130423))

(assert (= (and b!130423 res!62866) b!130424))

(declare-fun m!153443 () Bool)

(assert (=> b!130422 m!153443))

(declare-fun m!153445 () Bool)

(assert (=> d!39705 m!153445))

(assert (=> b!130423 m!153443))

(assert (=> d!39369 d!39705))

(assert (=> d!39357 d!39451))

(assert (=> b!129792 d!39431))

(declare-fun d!39707 () Bool)

(declare-fun res!62867 () Bool)

(declare-fun e!85066 () Bool)

(assert (=> d!39707 (=> res!62867 e!85066)))

(assert (=> d!39707 (= res!62867 (and ((_ is Cons!1697) (toList!846 (getCurrentListMap!515 (_keys!4563 newMap!16) (_values!2806 newMap!16) (mask!7100 newMap!16) (extraKeys!2596 newMap!16) (zeroValue!2682 newMap!16) (minValue!2682 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2823 newMap!16)))) (= (_1!1294 (h!2301 (toList!846 (getCurrentListMap!515 (_keys!4563 newMap!16) (_values!2806 newMap!16) (mask!7100 newMap!16) (extraKeys!2596 newMap!16) (zeroValue!2682 newMap!16) (minValue!2682 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2823 newMap!16))))) (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355))))))

(assert (=> d!39707 (= (containsKey!171 (toList!846 (getCurrentListMap!515 (_keys!4563 newMap!16) (_values!2806 newMap!16) (mask!7100 newMap!16) (extraKeys!2596 newMap!16) (zeroValue!2682 newMap!16) (minValue!2682 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2823 newMap!16))) (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355)) e!85066)))

(declare-fun b!130425 () Bool)

(declare-fun e!85067 () Bool)

(assert (=> b!130425 (= e!85066 e!85067)))

(declare-fun res!62868 () Bool)

(assert (=> b!130425 (=> (not res!62868) (not e!85067))))

(assert (=> b!130425 (= res!62868 (and (or (not ((_ is Cons!1697) (toList!846 (getCurrentListMap!515 (_keys!4563 newMap!16) (_values!2806 newMap!16) (mask!7100 newMap!16) (extraKeys!2596 newMap!16) (zeroValue!2682 newMap!16) (minValue!2682 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2823 newMap!16))))) (bvsle (_1!1294 (h!2301 (toList!846 (getCurrentListMap!515 (_keys!4563 newMap!16) (_values!2806 newMap!16) (mask!7100 newMap!16) (extraKeys!2596 newMap!16) (zeroValue!2682 newMap!16) (minValue!2682 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2823 newMap!16))))) (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355))) ((_ is Cons!1697) (toList!846 (getCurrentListMap!515 (_keys!4563 newMap!16) (_values!2806 newMap!16) (mask!7100 newMap!16) (extraKeys!2596 newMap!16) (zeroValue!2682 newMap!16) (minValue!2682 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2823 newMap!16)))) (bvslt (_1!1294 (h!2301 (toList!846 (getCurrentListMap!515 (_keys!4563 newMap!16) (_values!2806 newMap!16) (mask!7100 newMap!16) (extraKeys!2596 newMap!16) (zeroValue!2682 newMap!16) (minValue!2682 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2823 newMap!16))))) (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355))))))

(declare-fun b!130426 () Bool)

(assert (=> b!130426 (= e!85067 (containsKey!171 (t!6091 (toList!846 (getCurrentListMap!515 (_keys!4563 newMap!16) (_values!2806 newMap!16) (mask!7100 newMap!16) (extraKeys!2596 newMap!16) (zeroValue!2682 newMap!16) (minValue!2682 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2823 newMap!16)))) (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355)))))

(assert (= (and d!39707 (not res!62867)) b!130425))

(assert (= (and b!130425 res!62868) b!130426))

(assert (=> b!130426 m!151753))

(declare-fun m!153447 () Bool)

(assert (=> b!130426 m!153447))

(assert (=> d!39367 d!39707))

(declare-fun d!39709 () Bool)

(declare-fun e!85068 () Bool)

(assert (=> d!39709 e!85068))

(declare-fun res!62869 () Bool)

(assert (=> d!39709 (=> (not res!62869) (not e!85068))))

(declare-fun lt!67783 () ListLongMap!1661)

(assert (=> d!39709 (= res!62869 (contains!876 lt!67783 (_1!1294 (ite (or c!23898 c!23896) (tuple2!2567 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2682 newMap!16)) (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2682 newMap!16))))))))

(declare-fun lt!67780 () List!1701)

(assert (=> d!39709 (= lt!67783 (ListLongMap!1662 lt!67780))))

(declare-fun lt!67781 () Unit!4037)

(declare-fun lt!67782 () Unit!4037)

(assert (=> d!39709 (= lt!67781 lt!67782)))

(assert (=> d!39709 (= (getValueByKey!167 lt!67780 (_1!1294 (ite (or c!23898 c!23896) (tuple2!2567 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2682 newMap!16)) (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2682 newMap!16))))) (Some!172 (_2!1294 (ite (or c!23898 c!23896) (tuple2!2567 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2682 newMap!16)) (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2682 newMap!16))))))))

(assert (=> d!39709 (= lt!67782 (lemmaContainsTupThenGetReturnValue!85 lt!67780 (_1!1294 (ite (or c!23898 c!23896) (tuple2!2567 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2682 newMap!16)) (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2682 newMap!16)))) (_2!1294 (ite (or c!23898 c!23896) (tuple2!2567 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2682 newMap!16)) (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2682 newMap!16))))))))

(assert (=> d!39709 (= lt!67780 (insertStrictlySorted!88 (toList!846 (ite c!23898 call!14096 (ite c!23896 call!14097 call!14098))) (_1!1294 (ite (or c!23898 c!23896) (tuple2!2567 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2682 newMap!16)) (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2682 newMap!16)))) (_2!1294 (ite (or c!23898 c!23896) (tuple2!2567 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2682 newMap!16)) (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2682 newMap!16))))))))

(assert (=> d!39709 (= (+!160 (ite c!23898 call!14096 (ite c!23896 call!14097 call!14098)) (ite (or c!23898 c!23896) (tuple2!2567 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2682 newMap!16)) (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2682 newMap!16)))) lt!67783)))

(declare-fun b!130427 () Bool)

(declare-fun res!62870 () Bool)

(assert (=> b!130427 (=> (not res!62870) (not e!85068))))

(assert (=> b!130427 (= res!62870 (= (getValueByKey!167 (toList!846 lt!67783) (_1!1294 (ite (or c!23898 c!23896) (tuple2!2567 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2682 newMap!16)) (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2682 newMap!16))))) (Some!172 (_2!1294 (ite (or c!23898 c!23896) (tuple2!2567 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2682 newMap!16)) (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2682 newMap!16)))))))))

(declare-fun b!130428 () Bool)

(assert (=> b!130428 (= e!85068 (contains!878 (toList!846 lt!67783) (ite (or c!23898 c!23896) (tuple2!2567 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2682 newMap!16)) (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2682 newMap!16)))))))

(assert (= (and d!39709 res!62869) b!130427))

(assert (= (and b!130427 res!62870) b!130428))

(declare-fun m!153449 () Bool)

(assert (=> d!39709 m!153449))

(declare-fun m!153451 () Bool)

(assert (=> d!39709 m!153451))

(declare-fun m!153453 () Bool)

(assert (=> d!39709 m!153453))

(declare-fun m!153455 () Bool)

(assert (=> d!39709 m!153455))

(declare-fun m!153457 () Bool)

(assert (=> b!130427 m!153457))

(declare-fun m!153459 () Bool)

(assert (=> b!130428 m!153459))

(assert (=> bm!14095 d!39709))

(declare-fun e!85070 () Option!173)

(declare-fun b!130431 () Bool)

(assert (=> b!130431 (= e!85070 (getValueByKey!167 (t!6091 (toList!846 lt!67414)) (_1!1294 (tuple2!2567 lt!67075 (zeroValue!2682 (v!3153 (underlying!442 thiss!992)))))))))

(declare-fun b!130429 () Bool)

(declare-fun e!85069 () Option!173)

(assert (=> b!130429 (= e!85069 (Some!172 (_2!1294 (h!2301 (toList!846 lt!67414)))))))

(declare-fun d!39711 () Bool)

(declare-fun c!24072 () Bool)

(assert (=> d!39711 (= c!24072 (and ((_ is Cons!1697) (toList!846 lt!67414)) (= (_1!1294 (h!2301 (toList!846 lt!67414))) (_1!1294 (tuple2!2567 lt!67075 (zeroValue!2682 (v!3153 (underlying!442 thiss!992))))))))))

(assert (=> d!39711 (= (getValueByKey!167 (toList!846 lt!67414) (_1!1294 (tuple2!2567 lt!67075 (zeroValue!2682 (v!3153 (underlying!442 thiss!992)))))) e!85069)))

(declare-fun b!130430 () Bool)

(assert (=> b!130430 (= e!85069 e!85070)))

(declare-fun c!24073 () Bool)

(assert (=> b!130430 (= c!24073 (and ((_ is Cons!1697) (toList!846 lt!67414)) (not (= (_1!1294 (h!2301 (toList!846 lt!67414))) (_1!1294 (tuple2!2567 lt!67075 (zeroValue!2682 (v!3153 (underlying!442 thiss!992)))))))))))

(declare-fun b!130432 () Bool)

(assert (=> b!130432 (= e!85070 None!171)))

(assert (= (and d!39711 c!24072) b!130429))

(assert (= (and d!39711 (not c!24072)) b!130430))

(assert (= (and b!130430 c!24073) b!130431))

(assert (= (and b!130430 (not c!24073)) b!130432))

(declare-fun m!153461 () Bool)

(assert (=> b!130431 m!153461))

(assert (=> b!129840 d!39711))

(declare-fun d!39713 () Bool)

(declare-fun e!85071 () Bool)

(assert (=> d!39713 e!85071))

(declare-fun res!62871 () Bool)

(assert (=> d!39713 (=> (not res!62871) (not e!85071))))

(declare-fun lt!67787 () ListLongMap!1661)

(assert (=> d!39713 (= res!62871 (contains!876 lt!67787 (_1!1294 (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!23852 (ite c!23848 (minValue!2682 newMap!16) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2682 newMap!16))))))))

(declare-fun lt!67784 () List!1701)

(assert (=> d!39713 (= lt!67787 (ListLongMap!1662 lt!67784))))

(declare-fun lt!67785 () Unit!4037)

(declare-fun lt!67786 () Unit!4037)

(assert (=> d!39713 (= lt!67785 lt!67786)))

(assert (=> d!39713 (= (getValueByKey!167 lt!67784 (_1!1294 (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!23852 (ite c!23848 (minValue!2682 newMap!16) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2682 newMap!16))))) (Some!172 (_2!1294 (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!23852 (ite c!23848 (minValue!2682 newMap!16) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2682 newMap!16))))))))

(assert (=> d!39713 (= lt!67786 (lemmaContainsTupThenGetReturnValue!85 lt!67784 (_1!1294 (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!23852 (ite c!23848 (minValue!2682 newMap!16) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2682 newMap!16)))) (_2!1294 (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!23852 (ite c!23848 (minValue!2682 newMap!16) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2682 newMap!16))))))))

(assert (=> d!39713 (= lt!67784 (insertStrictlySorted!88 (toList!846 call!14112) (_1!1294 (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!23852 (ite c!23848 (minValue!2682 newMap!16) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2682 newMap!16)))) (_2!1294 (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!23852 (ite c!23848 (minValue!2682 newMap!16) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2682 newMap!16))))))))

(assert (=> d!39713 (= (+!160 call!14112 (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!23852 (ite c!23848 (minValue!2682 newMap!16) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2682 newMap!16)))) lt!67787)))

(declare-fun b!130433 () Bool)

(declare-fun res!62872 () Bool)

(assert (=> b!130433 (=> (not res!62872) (not e!85071))))

(assert (=> b!130433 (= res!62872 (= (getValueByKey!167 (toList!846 lt!67787) (_1!1294 (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!23852 (ite c!23848 (minValue!2682 newMap!16) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2682 newMap!16))))) (Some!172 (_2!1294 (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!23852 (ite c!23848 (minValue!2682 newMap!16) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2682 newMap!16)))))))))

(declare-fun b!130434 () Bool)

(assert (=> b!130434 (= e!85071 (contains!878 (toList!846 lt!67787) (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!23852 (ite c!23848 (minValue!2682 newMap!16) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2682 newMap!16)))))))

(assert (= (and d!39713 res!62871) b!130433))

(assert (= (and b!130433 res!62872) b!130434))

(declare-fun m!153463 () Bool)

(assert (=> d!39713 m!153463))

(declare-fun m!153465 () Bool)

(assert (=> d!39713 m!153465))

(declare-fun m!153467 () Bool)

(assert (=> d!39713 m!153467))

(declare-fun m!153469 () Bool)

(assert (=> d!39713 m!153469))

(declare-fun m!153471 () Bool)

(assert (=> b!130433 m!153471))

(declare-fun m!153473 () Bool)

(assert (=> b!130434 m!153473))

(assert (=> b!129811 d!39713))

(declare-fun d!39715 () Bool)

(declare-fun lt!67788 () Bool)

(assert (=> d!39715 (= lt!67788 (select (content!129 (toList!846 lt!67408)) (tuple2!2567 lt!67060 (minValue!2682 (v!3153 (underlying!442 thiss!992))))))))

(declare-fun e!85072 () Bool)

(assert (=> d!39715 (= lt!67788 e!85072)))

(declare-fun res!62874 () Bool)

(assert (=> d!39715 (=> (not res!62874) (not e!85072))))

(assert (=> d!39715 (= res!62874 ((_ is Cons!1697) (toList!846 lt!67408)))))

(assert (=> d!39715 (= (contains!878 (toList!846 lt!67408) (tuple2!2567 lt!67060 (minValue!2682 (v!3153 (underlying!442 thiss!992))))) lt!67788)))

(declare-fun b!130435 () Bool)

(declare-fun e!85073 () Bool)

(assert (=> b!130435 (= e!85072 e!85073)))

(declare-fun res!62873 () Bool)

(assert (=> b!130435 (=> res!62873 e!85073)))

(assert (=> b!130435 (= res!62873 (= (h!2301 (toList!846 lt!67408)) (tuple2!2567 lt!67060 (minValue!2682 (v!3153 (underlying!442 thiss!992))))))))

(declare-fun b!130436 () Bool)

(assert (=> b!130436 (= e!85073 (contains!878 (t!6091 (toList!846 lt!67408)) (tuple2!2567 lt!67060 (minValue!2682 (v!3153 (underlying!442 thiss!992))))))))

(assert (= (and d!39715 res!62874) b!130435))

(assert (= (and b!130435 (not res!62873)) b!130436))

(declare-fun m!153475 () Bool)

(assert (=> d!39715 m!153475))

(declare-fun m!153477 () Bool)

(assert (=> d!39715 m!153477))

(declare-fun m!153479 () Bool)

(assert (=> b!130436 m!153479))

(assert (=> b!129837 d!39715))

(assert (=> b!129881 d!39559))

(assert (=> bm!14090 d!39649))

(declare-fun d!39717 () Bool)

(declare-fun e!85075 () Bool)

(assert (=> d!39717 e!85075))

(declare-fun res!62875 () Bool)

(assert (=> d!39717 (=> res!62875 e!85075)))

(declare-fun lt!67791 () Bool)

(assert (=> d!39717 (= res!62875 (not lt!67791))))

(declare-fun lt!67792 () Bool)

(assert (=> d!39717 (= lt!67791 lt!67792)))

(declare-fun lt!67789 () Unit!4037)

(declare-fun e!85074 () Unit!4037)

(assert (=> d!39717 (= lt!67789 e!85074)))

(declare-fun c!24074 () Bool)

(assert (=> d!39717 (= c!24074 lt!67792)))

(assert (=> d!39717 (= lt!67792 (containsKey!171 (toList!846 lt!67387) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!39717 (= (contains!876 lt!67387 #b1000000000000000000000000000000000000000000000000000000000000000) lt!67791)))

(declare-fun b!130437 () Bool)

(declare-fun lt!67790 () Unit!4037)

(assert (=> b!130437 (= e!85074 lt!67790)))

(assert (=> b!130437 (= lt!67790 (lemmaContainsKeyImpliesGetValueByKeyDefined!120 (toList!846 lt!67387) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!130437 (isDefined!121 (getValueByKey!167 (toList!846 lt!67387) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!130438 () Bool)

(declare-fun Unit!4071 () Unit!4037)

(assert (=> b!130438 (= e!85074 Unit!4071)))

(declare-fun b!130439 () Bool)

(assert (=> b!130439 (= e!85075 (isDefined!121 (getValueByKey!167 (toList!846 lt!67387) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!39717 c!24074) b!130437))

(assert (= (and d!39717 (not c!24074)) b!130438))

(assert (= (and d!39717 (not res!62875)) b!130439))

(declare-fun m!153481 () Bool)

(assert (=> d!39717 m!153481))

(declare-fun m!153483 () Bool)

(assert (=> b!130437 m!153483))

(assert (=> b!130437 m!152653))

(assert (=> b!130437 m!152653))

(declare-fun m!153485 () Bool)

(assert (=> b!130437 m!153485))

(assert (=> b!130439 m!152653))

(assert (=> b!130439 m!152653))

(assert (=> b!130439 m!153485))

(assert (=> bm!14110 d!39717))

(declare-fun d!39719 () Bool)

(assert (=> d!39719 (contains!876 (getCurrentListMap!515 (_keys!4563 newMap!16) lt!67158 (mask!7100 newMap!16) (extraKeys!2596 newMap!16) (zeroValue!2682 newMap!16) (minValue!2682 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2823 newMap!16)) (select (arr!2230 (_keys!4563 newMap!16)) (index!3258 lt!67161)))))

(assert (=> d!39719 true))

(declare-fun _$16!148 () Unit!4037)

(assert (=> d!39719 (= (choose!794 (_keys!4563 newMap!16) lt!67158 (mask!7100 newMap!16) (extraKeys!2596 newMap!16) (zeroValue!2682 newMap!16) (minValue!2682 newMap!16) (index!3258 lt!67161) (defaultEntry!2823 newMap!16)) _$16!148)))

(declare-fun bs!5406 () Bool)

(assert (= bs!5406 d!39719))

(assert (=> bs!5406 m!152191))

(assert (=> bs!5406 m!151925))

(assert (=> bs!5406 m!152191))

(assert (=> bs!5406 m!151925))

(assert (=> bs!5406 m!152193))

(assert (=> d!39363 d!39719))

(assert (=> d!39363 d!39451))

(declare-fun d!39721 () Bool)

(assert (=> d!39721 (= (get!1463 (getValueByKey!167 (toList!846 (+!160 lt!67059 (tuple2!2567 lt!67075 (zeroValue!2682 (v!3153 (underlying!442 thiss!992)))))) lt!67068)) (v!3159 (getValueByKey!167 (toList!846 (+!160 lt!67059 (tuple2!2567 lt!67075 (zeroValue!2682 (v!3153 (underlying!442 thiss!992)))))) lt!67068)))))

(assert (=> d!39381 d!39721))

(declare-fun b!130442 () Bool)

(declare-fun e!85077 () Option!173)

(assert (=> b!130442 (= e!85077 (getValueByKey!167 (t!6091 (toList!846 (+!160 lt!67059 (tuple2!2567 lt!67075 (zeroValue!2682 (v!3153 (underlying!442 thiss!992))))))) lt!67068))))

(declare-fun e!85076 () Option!173)

(declare-fun b!130440 () Bool)

(assert (=> b!130440 (= e!85076 (Some!172 (_2!1294 (h!2301 (toList!846 (+!160 lt!67059 (tuple2!2567 lt!67075 (zeroValue!2682 (v!3153 (underlying!442 thiss!992))))))))))))

(declare-fun d!39723 () Bool)

(declare-fun c!24075 () Bool)

(assert (=> d!39723 (= c!24075 (and ((_ is Cons!1697) (toList!846 (+!160 lt!67059 (tuple2!2567 lt!67075 (zeroValue!2682 (v!3153 (underlying!442 thiss!992))))))) (= (_1!1294 (h!2301 (toList!846 (+!160 lt!67059 (tuple2!2567 lt!67075 (zeroValue!2682 (v!3153 (underlying!442 thiss!992)))))))) lt!67068)))))

(assert (=> d!39723 (= (getValueByKey!167 (toList!846 (+!160 lt!67059 (tuple2!2567 lt!67075 (zeroValue!2682 (v!3153 (underlying!442 thiss!992)))))) lt!67068) e!85076)))

(declare-fun b!130441 () Bool)

(assert (=> b!130441 (= e!85076 e!85077)))

(declare-fun c!24076 () Bool)

(assert (=> b!130441 (= c!24076 (and ((_ is Cons!1697) (toList!846 (+!160 lt!67059 (tuple2!2567 lt!67075 (zeroValue!2682 (v!3153 (underlying!442 thiss!992))))))) (not (= (_1!1294 (h!2301 (toList!846 (+!160 lt!67059 (tuple2!2567 lt!67075 (zeroValue!2682 (v!3153 (underlying!442 thiss!992)))))))) lt!67068))))))

(declare-fun b!130443 () Bool)

(assert (=> b!130443 (= e!85077 None!171)))

(assert (= (and d!39723 c!24075) b!130440))

(assert (= (and d!39723 (not c!24075)) b!130441))

(assert (= (and b!130441 c!24076) b!130442))

(assert (= (and b!130441 (not c!24076)) b!130443))

(declare-fun m!153487 () Bool)

(assert (=> b!130442 m!153487))

(assert (=> d!39381 d!39723))

(declare-fun b!130444 () Bool)

(declare-fun e!85078 () (_ BitVec 32))

(declare-fun call!14192 () (_ BitVec 32))

(assert (=> b!130444 (= e!85078 call!14192)))

(declare-fun b!130446 () Bool)

(assert (=> b!130446 (= e!85078 (bvadd #b00000000000000000000000000000001 call!14192))))

(declare-fun b!130447 () Bool)

(declare-fun e!85079 () (_ BitVec 32))

(assert (=> b!130447 (= e!85079 #b00000000000000000000000000000000)))

(declare-fun bm!14189 () Bool)

(assert (=> bm!14189 (= call!14192 (arrayCountValidKeys!0 (_keys!4563 (v!3153 (underlying!442 thiss!992))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2497 (_keys!4563 (v!3153 (underlying!442 thiss!992))))))))

(declare-fun d!39725 () Bool)

(declare-fun lt!67793 () (_ BitVec 32))

(assert (=> d!39725 (and (bvsge lt!67793 #b00000000000000000000000000000000) (bvsle lt!67793 (bvsub (size!2497 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) #b00000000000000000000000000000000)))))

(assert (=> d!39725 (= lt!67793 e!85079)))

(declare-fun c!24078 () Bool)

(assert (=> d!39725 (= c!24078 (bvsge #b00000000000000000000000000000000 (size!2497 (_keys!4563 (v!3153 (underlying!442 thiss!992))))))))

(assert (=> d!39725 (and (bvsle #b00000000000000000000000000000000 (size!2497 (_keys!4563 (v!3153 (underlying!442 thiss!992))))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!2497 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) (size!2497 (_keys!4563 (v!3153 (underlying!442 thiss!992))))))))

(assert (=> d!39725 (= (arrayCountValidKeys!0 (_keys!4563 (v!3153 (underlying!442 thiss!992))) #b00000000000000000000000000000000 (size!2497 (_keys!4563 (v!3153 (underlying!442 thiss!992))))) lt!67793)))

(declare-fun b!130445 () Bool)

(assert (=> b!130445 (= e!85079 e!85078)))

(declare-fun c!24077 () Bool)

(assert (=> b!130445 (= c!24077 (validKeyInArray!0 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) #b00000000000000000000000000000000)))))

(assert (= (and d!39725 c!24078) b!130447))

(assert (= (and d!39725 (not c!24078)) b!130445))

(assert (= (and b!130445 c!24077) b!130446))

(assert (= (and b!130445 (not c!24077)) b!130444))

(assert (= (or b!130446 b!130444) bm!14189))

(declare-fun m!153489 () Bool)

(assert (=> bm!14189 m!153489))

(assert (=> b!130445 m!153045))

(assert (=> b!130445 m!153045))

(assert (=> b!130445 m!153047))

(assert (=> b!129892 d!39725))

(declare-fun d!39727 () Bool)

(declare-fun lt!67794 () Bool)

(assert (=> d!39727 (= lt!67794 (select (content!129 (toList!846 lt!67448)) (ite (or c!23815 c!23813) (tuple2!2567 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2682 (v!3153 (underlying!442 thiss!992)))) (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2682 (v!3153 (underlying!442 thiss!992)))))))))

(declare-fun e!85080 () Bool)

(assert (=> d!39727 (= lt!67794 e!85080)))

(declare-fun res!62877 () Bool)

(assert (=> d!39727 (=> (not res!62877) (not e!85080))))

(assert (=> d!39727 (= res!62877 ((_ is Cons!1697) (toList!846 lt!67448)))))

(assert (=> d!39727 (= (contains!878 (toList!846 lt!67448) (ite (or c!23815 c!23813) (tuple2!2567 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2682 (v!3153 (underlying!442 thiss!992)))) (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2682 (v!3153 (underlying!442 thiss!992)))))) lt!67794)))

(declare-fun b!130448 () Bool)

(declare-fun e!85081 () Bool)

(assert (=> b!130448 (= e!85080 e!85081)))

(declare-fun res!62876 () Bool)

(assert (=> b!130448 (=> res!62876 e!85081)))

(assert (=> b!130448 (= res!62876 (= (h!2301 (toList!846 lt!67448)) (ite (or c!23815 c!23813) (tuple2!2567 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2682 (v!3153 (underlying!442 thiss!992)))) (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2682 (v!3153 (underlying!442 thiss!992)))))))))

(declare-fun b!130449 () Bool)

(assert (=> b!130449 (= e!85081 (contains!878 (t!6091 (toList!846 lt!67448)) (ite (or c!23815 c!23813) (tuple2!2567 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2682 (v!3153 (underlying!442 thiss!992)))) (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2682 (v!3153 (underlying!442 thiss!992)))))))))

(assert (= (and d!39727 res!62877) b!130448))

(assert (= (and b!130448 (not res!62876)) b!130449))

(declare-fun m!153491 () Bool)

(assert (=> d!39727 m!153491))

(declare-fun m!153493 () Bool)

(assert (=> d!39727 m!153493))

(declare-fun m!153495 () Bool)

(assert (=> b!130449 m!153495))

(assert (=> b!129896 d!39727))

(declare-fun d!39729 () Bool)

(assert (=> d!39729 (isDefined!121 (getValueByKey!167 (toList!846 lt!67071) (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun lt!67795 () Unit!4037)

(assert (=> d!39729 (= lt!67795 (choose!801 (toList!846 lt!67071) (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun e!85082 () Bool)

(assert (=> d!39729 e!85082))

(declare-fun res!62878 () Bool)

(assert (=> d!39729 (=> (not res!62878) (not e!85082))))

(assert (=> d!39729 (= res!62878 (isStrictlySorted!314 (toList!846 lt!67071)))))

(assert (=> d!39729 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!120 (toList!846 lt!67071) (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) lt!67795)))

(declare-fun b!130450 () Bool)

(assert (=> b!130450 (= e!85082 (containsKey!171 (toList!846 lt!67071) (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (= (and d!39729 res!62878) b!130450))

(assert (=> d!39729 m!151855))

(assert (=> d!39729 m!152075))

(assert (=> d!39729 m!152075))

(assert (=> d!39729 m!152519))

(assert (=> d!39729 m!151855))

(declare-fun m!153497 () Bool)

(assert (=> d!39729 m!153497))

(declare-fun m!153499 () Bool)

(assert (=> d!39729 m!153499))

(assert (=> b!130450 m!151855))

(assert (=> b!130450 m!152515))

(assert (=> b!129957 d!39729))

(declare-fun d!39731 () Bool)

(assert (=> d!39731 (= (isDefined!121 (getValueByKey!167 (toList!846 lt!67071) (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))) (not (isEmpty!407 (getValueByKey!167 (toList!846 lt!67071) (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))))

(declare-fun bs!5407 () Bool)

(assert (= bs!5407 d!39731))

(assert (=> bs!5407 m!152075))

(declare-fun m!153501 () Bool)

(assert (=> bs!5407 m!153501))

(assert (=> b!129957 d!39731))

(declare-fun e!85084 () Option!173)

(declare-fun b!130453 () Bool)

(assert (=> b!130453 (= e!85084 (getValueByKey!167 (t!6091 (toList!846 lt!67071)) (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!130451 () Bool)

(declare-fun e!85083 () Option!173)

(assert (=> b!130451 (= e!85083 (Some!172 (_2!1294 (h!2301 (toList!846 lt!67071)))))))

(declare-fun d!39733 () Bool)

(declare-fun c!24079 () Bool)

(assert (=> d!39733 (= c!24079 (and ((_ is Cons!1697) (toList!846 lt!67071)) (= (_1!1294 (h!2301 (toList!846 lt!67071))) (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(assert (=> d!39733 (= (getValueByKey!167 (toList!846 lt!67071) (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) e!85083)))

(declare-fun b!130452 () Bool)

(assert (=> b!130452 (= e!85083 e!85084)))

(declare-fun c!24080 () Bool)

(assert (=> b!130452 (= c!24080 (and ((_ is Cons!1697) (toList!846 lt!67071)) (not (= (_1!1294 (h!2301 (toList!846 lt!67071))) (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))))

(declare-fun b!130454 () Bool)

(assert (=> b!130454 (= e!85084 None!171)))

(assert (= (and d!39733 c!24079) b!130451))

(assert (= (and d!39733 (not c!24079)) b!130452))

(assert (= (and b!130452 c!24080) b!130453))

(assert (= (and b!130452 (not c!24080)) b!130454))

(assert (=> b!130453 m!151855))

(declare-fun m!153503 () Bool)

(assert (=> b!130453 m!153503))

(assert (=> b!129957 d!39733))

(assert (=> bm!14125 d!39421))

(declare-fun d!39735 () Bool)

(assert (=> d!39735 (= (isDefined!121 (getValueByKey!167 (toList!846 e!84562) (ite c!23854 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355) (select (arr!2230 (_keys!4563 newMap!16)) (index!3258 lt!67161))))) (not (isEmpty!407 (getValueByKey!167 (toList!846 e!84562) (ite c!23854 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355) (select (arr!2230 (_keys!4563 newMap!16)) (index!3258 lt!67161)))))))))

(declare-fun bs!5408 () Bool)

(assert (= bs!5408 d!39735))

(assert (=> bs!5408 m!152439))

(declare-fun m!153505 () Bool)

(assert (=> bs!5408 m!153505))

(assert (=> b!129859 d!39735))

(declare-fun e!85086 () Option!173)

(declare-fun b!130457 () Bool)

(assert (=> b!130457 (= e!85086 (getValueByKey!167 (t!6091 (toList!846 e!84562)) (ite c!23854 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355) (select (arr!2230 (_keys!4563 newMap!16)) (index!3258 lt!67161)))))))

(declare-fun b!130455 () Bool)

(declare-fun e!85085 () Option!173)

(assert (=> b!130455 (= e!85085 (Some!172 (_2!1294 (h!2301 (toList!846 e!84562)))))))

(declare-fun c!24081 () Bool)

(declare-fun d!39737 () Bool)

(assert (=> d!39737 (= c!24081 (and ((_ is Cons!1697) (toList!846 e!84562)) (= (_1!1294 (h!2301 (toList!846 e!84562))) (ite c!23854 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355) (select (arr!2230 (_keys!4563 newMap!16)) (index!3258 lt!67161))))))))

(assert (=> d!39737 (= (getValueByKey!167 (toList!846 e!84562) (ite c!23854 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355) (select (arr!2230 (_keys!4563 newMap!16)) (index!3258 lt!67161)))) e!85085)))

(declare-fun b!130456 () Bool)

(assert (=> b!130456 (= e!85085 e!85086)))

(declare-fun c!24082 () Bool)

(assert (=> b!130456 (= c!24082 (and ((_ is Cons!1697) (toList!846 e!84562)) (not (= (_1!1294 (h!2301 (toList!846 e!84562))) (ite c!23854 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355) (select (arr!2230 (_keys!4563 newMap!16)) (index!3258 lt!67161)))))))))

(declare-fun b!130458 () Bool)

(assert (=> b!130458 (= e!85086 None!171)))

(assert (= (and d!39737 c!24081) b!130455))

(assert (= (and d!39737 (not c!24081)) b!130456))

(assert (= (and b!130456 c!24082) b!130457))

(assert (= (and b!130456 (not c!24082)) b!130458))

(declare-fun m!153507 () Bool)

(assert (=> b!130457 m!153507))

(assert (=> b!129859 d!39737))

(declare-fun d!39739 () Bool)

(declare-fun e!85088 () Bool)

(assert (=> d!39739 e!85088))

(declare-fun res!62879 () Bool)

(assert (=> d!39739 (=> res!62879 e!85088)))

(declare-fun lt!67798 () Bool)

(assert (=> d!39739 (= res!62879 (not lt!67798))))

(declare-fun lt!67799 () Bool)

(assert (=> d!39739 (= lt!67798 lt!67799)))

(declare-fun lt!67796 () Unit!4037)

(declare-fun e!85087 () Unit!4037)

(assert (=> d!39739 (= lt!67796 e!85087)))

(declare-fun c!24083 () Bool)

(assert (=> d!39739 (= c!24083 lt!67799)))

(assert (=> d!39739 (= lt!67799 (containsKey!171 (toList!846 (map!1381 (_2!1295 lt!67346))) (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355)))))

(assert (=> d!39739 (= (contains!876 (map!1381 (_2!1295 lt!67346)) (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355)) lt!67798)))

(declare-fun b!130459 () Bool)

(declare-fun lt!67797 () Unit!4037)

(assert (=> b!130459 (= e!85087 lt!67797)))

(assert (=> b!130459 (= lt!67797 (lemmaContainsKeyImpliesGetValueByKeyDefined!120 (toList!846 (map!1381 (_2!1295 lt!67346))) (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355)))))

(assert (=> b!130459 (isDefined!121 (getValueByKey!167 (toList!846 (map!1381 (_2!1295 lt!67346))) (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355)))))

(declare-fun b!130460 () Bool)

(declare-fun Unit!4072 () Unit!4037)

(assert (=> b!130460 (= e!85087 Unit!4072)))

(declare-fun b!130461 () Bool)

(assert (=> b!130461 (= e!85088 (isDefined!121 (getValueByKey!167 (toList!846 (map!1381 (_2!1295 lt!67346))) (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355))))))

(assert (= (and d!39739 c!24083) b!130459))

(assert (= (and d!39739 (not c!24083)) b!130460))

(assert (= (and d!39739 (not res!62879)) b!130461))

(assert (=> d!39739 m!151753))

(declare-fun m!153509 () Bool)

(assert (=> d!39739 m!153509))

(assert (=> b!130459 m!151753))

(declare-fun m!153511 () Bool)

(assert (=> b!130459 m!153511))

(assert (=> b!130459 m!151753))

(declare-fun m!153513 () Bool)

(assert (=> b!130459 m!153513))

(assert (=> b!130459 m!153513))

(declare-fun m!153515 () Bool)

(assert (=> b!130459 m!153515))

(assert (=> b!130461 m!151753))

(assert (=> b!130461 m!153513))

(assert (=> b!130461 m!153513))

(assert (=> b!130461 m!153515))

(assert (=> b!129799 d!39739))

(assert (=> b!129799 d!39681))

(declare-fun b!130462 () Bool)

(declare-fun e!85090 () Bool)

(declare-fun e!85095 () Bool)

(assert (=> b!130462 (= e!85090 e!85095)))

(assert (=> b!130462 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2497 (_keys!4563 (v!3153 (underlying!442 thiss!992))))))))

(declare-fun lt!67800 () ListLongMap!1661)

(declare-fun res!62880 () Bool)

(assert (=> b!130462 (= res!62880 (contains!876 lt!67800 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001))))))

(assert (=> b!130462 (=> (not res!62880) (not e!85095))))

(declare-fun bm!14190 () Bool)

(declare-fun call!14193 () ListLongMap!1661)

(assert (=> bm!14190 (= call!14193 (getCurrentListMapNoExtraKeys!125 (_keys!4563 (v!3153 (underlying!442 thiss!992))) (_values!2806 (v!3153 (underlying!442 thiss!992))) (mask!7100 (v!3153 (underlying!442 thiss!992))) (extraKeys!2596 (v!3153 (underlying!442 thiss!992))) (zeroValue!2682 (v!3153 (underlying!442 thiss!992))) (minValue!2682 (v!3153 (underlying!442 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (defaultEntry!2823 (v!3153 (underlying!442 thiss!992)))))))

(declare-fun b!130463 () Bool)

(declare-fun e!85089 () ListLongMap!1661)

(declare-fun e!85092 () ListLongMap!1661)

(assert (=> b!130463 (= e!85089 e!85092)))

(declare-fun c!24084 () Bool)

(assert (=> b!130463 (= c!24084 (validKeyInArray!0 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001))))))

(declare-fun b!130464 () Bool)

(assert (=> b!130464 (= e!85092 call!14193)))

(declare-fun d!39741 () Bool)

(declare-fun e!85093 () Bool)

(assert (=> d!39741 e!85093))

(declare-fun res!62883 () Bool)

(assert (=> d!39741 (=> (not res!62883) (not e!85093))))

(assert (=> d!39741 (= res!62883 (not (contains!876 lt!67800 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!39741 (= lt!67800 e!85089)))

(declare-fun c!24085 () Bool)

(assert (=> d!39741 (= c!24085 (bvsge (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2497 (_keys!4563 (v!3153 (underlying!442 thiss!992))))))))

(assert (=> d!39741 (validMask!0 (mask!7100 (v!3153 (underlying!442 thiss!992))))))

(assert (=> d!39741 (= (getCurrentListMapNoExtraKeys!125 (_keys!4563 (v!3153 (underlying!442 thiss!992))) (_values!2806 (v!3153 (underlying!442 thiss!992))) (mask!7100 (v!3153 (underlying!442 thiss!992))) (extraKeys!2596 (v!3153 (underlying!442 thiss!992))) (zeroValue!2682 (v!3153 (underlying!442 thiss!992))) (minValue!2682 (v!3153 (underlying!442 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!2823 (v!3153 (underlying!442 thiss!992)))) lt!67800)))

(declare-fun b!130465 () Bool)

(declare-fun e!85094 () Bool)

(assert (=> b!130465 (= e!85090 e!85094)))

(declare-fun c!24087 () Bool)

(assert (=> b!130465 (= c!24087 (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2497 (_keys!4563 (v!3153 (underlying!442 thiss!992))))))))

(declare-fun b!130466 () Bool)

(assert (=> b!130466 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2497 (_keys!4563 (v!3153 (underlying!442 thiss!992))))))))

(assert (=> b!130466 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2498 (_values!2806 (v!3153 (underlying!442 thiss!992))))))))

(assert (=> b!130466 (= e!85095 (= (apply!113 lt!67800 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001))) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!130467 () Bool)

(assert (=> b!130467 (= e!85094 (= lt!67800 (getCurrentListMapNoExtraKeys!125 (_keys!4563 (v!3153 (underlying!442 thiss!992))) (_values!2806 (v!3153 (underlying!442 thiss!992))) (mask!7100 (v!3153 (underlying!442 thiss!992))) (extraKeys!2596 (v!3153 (underlying!442 thiss!992))) (zeroValue!2682 (v!3153 (underlying!442 thiss!992))) (minValue!2682 (v!3153 (underlying!442 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))))))))

(declare-fun b!130468 () Bool)

(declare-fun lt!67801 () Unit!4037)

(declare-fun lt!67804 () Unit!4037)

(assert (=> b!130468 (= lt!67801 lt!67804)))

(declare-fun lt!67806 () ListLongMap!1661)

(declare-fun lt!67805 () (_ BitVec 64))

(declare-fun lt!67803 () (_ BitVec 64))

(declare-fun lt!67802 () V!3457)

(assert (=> b!130468 (not (contains!876 (+!160 lt!67806 (tuple2!2567 lt!67805 lt!67802)) lt!67803))))

(assert (=> b!130468 (= lt!67804 (addStillNotContains!59 lt!67806 lt!67805 lt!67802 lt!67803))))

(assert (=> b!130468 (= lt!67803 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!130468 (= lt!67802 (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!130468 (= lt!67805 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)))))

(assert (=> b!130468 (= lt!67806 call!14193)))

(assert (=> b!130468 (= e!85092 (+!160 call!14193 (tuple2!2567 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!130469 () Bool)

(assert (=> b!130469 (= e!85089 (ListLongMap!1662 Nil!1698))))

(declare-fun b!130470 () Bool)

(assert (=> b!130470 (= e!85094 (isEmpty!406 lt!67800))))

(declare-fun b!130471 () Bool)

(declare-fun res!62881 () Bool)

(assert (=> b!130471 (=> (not res!62881) (not e!85093))))

(assert (=> b!130471 (= res!62881 (not (contains!876 lt!67800 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!130472 () Bool)

(assert (=> b!130472 (= e!85093 e!85090)))

(declare-fun c!24086 () Bool)

(declare-fun e!85091 () Bool)

(assert (=> b!130472 (= c!24086 e!85091)))

(declare-fun res!62882 () Bool)

(assert (=> b!130472 (=> (not res!62882) (not e!85091))))

(assert (=> b!130472 (= res!62882 (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2497 (_keys!4563 (v!3153 (underlying!442 thiss!992))))))))

(declare-fun b!130473 () Bool)

(assert (=> b!130473 (= e!85091 (validKeyInArray!0 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001))))))

(assert (=> b!130473 (bvsge (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(assert (= (and d!39741 c!24085) b!130469))

(assert (= (and d!39741 (not c!24085)) b!130463))

(assert (= (and b!130463 c!24084) b!130468))

(assert (= (and b!130463 (not c!24084)) b!130464))

(assert (= (or b!130468 b!130464) bm!14190))

(assert (= (and d!39741 res!62883) b!130471))

(assert (= (and b!130471 res!62881) b!130472))

(assert (= (and b!130472 res!62882) b!130473))

(assert (= (and b!130472 c!24086) b!130462))

(assert (= (and b!130472 (not c!24086)) b!130465))

(assert (= (and b!130462 res!62880) b!130466))

(assert (= (and b!130465 c!24087) b!130467))

(assert (= (and b!130465 (not c!24087)) b!130470))

(declare-fun b_lambda!5781 () Bool)

(assert (=> (not b_lambda!5781) (not b!130466)))

(assert (=> b!130466 t!6088))

(declare-fun b_and!8061 () Bool)

(assert (= b_and!8057 (and (=> t!6088 result!3897) b_and!8061)))

(assert (=> b!130466 t!6090))

(declare-fun b_and!8063 () Bool)

(assert (= b_and!8059 (and (=> t!6090 result!3901) b_and!8063)))

(declare-fun b_lambda!5783 () Bool)

(assert (=> (not b_lambda!5783) (not b!130468)))

(assert (=> b!130468 t!6088))

(declare-fun b_and!8065 () Bool)

(assert (= b_and!8061 (and (=> t!6088 result!3897) b_and!8065)))

(assert (=> b!130468 t!6090))

(declare-fun b_and!8067 () Bool)

(assert (= b_and!8063 (and (=> t!6090 result!3901) b_and!8067)))

(declare-fun m!153517 () Bool)

(assert (=> b!130471 m!153517))

(declare-fun m!153519 () Bool)

(assert (=> b!130473 m!153519))

(assert (=> b!130473 m!153519))

(declare-fun m!153521 () Bool)

(assert (=> b!130473 m!153521))

(declare-fun m!153523 () Bool)

(assert (=> b!130467 m!153523))

(declare-fun m!153525 () Bool)

(assert (=> b!130468 m!153525))

(declare-fun m!153527 () Bool)

(assert (=> b!130468 m!153527))

(declare-fun m!153529 () Bool)

(assert (=> b!130468 m!153529))

(declare-fun m!153531 () Bool)

(assert (=> b!130468 m!153531))

(assert (=> b!130468 m!153529))

(assert (=> b!130468 m!151749))

(declare-fun m!153533 () Bool)

(assert (=> b!130468 m!153533))

(assert (=> b!130468 m!153519))

(assert (=> b!130468 m!151749))

(assert (=> b!130468 m!153527))

(declare-fun m!153535 () Bool)

(assert (=> b!130468 m!153535))

(declare-fun m!153537 () Bool)

(assert (=> d!39741 m!153537))

(assert (=> d!39741 m!151769))

(assert (=> b!130462 m!153519))

(assert (=> b!130462 m!153519))

(declare-fun m!153539 () Bool)

(assert (=> b!130462 m!153539))

(assert (=> b!130463 m!153519))

(assert (=> b!130463 m!153519))

(assert (=> b!130463 m!153521))

(assert (=> bm!14190 m!153523))

(assert (=> b!130466 m!153519))

(declare-fun m!153541 () Bool)

(assert (=> b!130466 m!153541))

(assert (=> b!130466 m!153529))

(assert (=> b!130466 m!153529))

(assert (=> b!130466 m!151749))

(assert (=> b!130466 m!153533))

(assert (=> b!130466 m!153519))

(assert (=> b!130466 m!151749))

(declare-fun m!153543 () Bool)

(assert (=> b!130470 m!153543))

(assert (=> b!129654 d!39741))

(declare-fun b!130476 () Bool)

(declare-fun e!85097 () Option!173)

(assert (=> b!130476 (= e!85097 (getValueByKey!167 (t!6091 (toList!846 lt!67404)) (_1!1294 (tuple2!2567 lt!67073 (zeroValue!2682 (v!3153 (underlying!442 thiss!992)))))))))

(declare-fun b!130474 () Bool)

(declare-fun e!85096 () Option!173)

(assert (=> b!130474 (= e!85096 (Some!172 (_2!1294 (h!2301 (toList!846 lt!67404)))))))

(declare-fun d!39743 () Bool)

(declare-fun c!24088 () Bool)

(assert (=> d!39743 (= c!24088 (and ((_ is Cons!1697) (toList!846 lt!67404)) (= (_1!1294 (h!2301 (toList!846 lt!67404))) (_1!1294 (tuple2!2567 lt!67073 (zeroValue!2682 (v!3153 (underlying!442 thiss!992))))))))))

(assert (=> d!39743 (= (getValueByKey!167 (toList!846 lt!67404) (_1!1294 (tuple2!2567 lt!67073 (zeroValue!2682 (v!3153 (underlying!442 thiss!992)))))) e!85096)))

(declare-fun b!130475 () Bool)

(assert (=> b!130475 (= e!85096 e!85097)))

(declare-fun c!24089 () Bool)

(assert (=> b!130475 (= c!24089 (and ((_ is Cons!1697) (toList!846 lt!67404)) (not (= (_1!1294 (h!2301 (toList!846 lt!67404))) (_1!1294 (tuple2!2567 lt!67073 (zeroValue!2682 (v!3153 (underlying!442 thiss!992)))))))))))

(declare-fun b!130477 () Bool)

(assert (=> b!130477 (= e!85097 None!171)))

(assert (= (and d!39743 c!24088) b!130474))

(assert (= (and d!39743 (not c!24088)) b!130475))

(assert (= (and b!130475 c!24089) b!130476))

(assert (= (and b!130475 (not c!24089)) b!130477))

(declare-fun m!153545 () Bool)

(assert (=> b!130476 m!153545))

(assert (=> b!129834 d!39743))

(declare-fun b!130480 () Bool)

(declare-fun e!85099 () Option!173)

(assert (=> b!130480 (= e!85099 (getValueByKey!167 (t!6091 (toList!846 lt!67229)) (_1!1294 (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2682 (v!3153 (underlying!442 thiss!992)))))))))

(declare-fun b!130478 () Bool)

(declare-fun e!85098 () Option!173)

(assert (=> b!130478 (= e!85098 (Some!172 (_2!1294 (h!2301 (toList!846 lt!67229)))))))

(declare-fun d!39745 () Bool)

(declare-fun c!24090 () Bool)

(assert (=> d!39745 (= c!24090 (and ((_ is Cons!1697) (toList!846 lt!67229)) (= (_1!1294 (h!2301 (toList!846 lt!67229))) (_1!1294 (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2682 (v!3153 (underlying!442 thiss!992))))))))))

(assert (=> d!39745 (= (getValueByKey!167 (toList!846 lt!67229) (_1!1294 (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2682 (v!3153 (underlying!442 thiss!992)))))) e!85098)))

(declare-fun b!130479 () Bool)

(assert (=> b!130479 (= e!85098 e!85099)))

(declare-fun c!24091 () Bool)

(assert (=> b!130479 (= c!24091 (and ((_ is Cons!1697) (toList!846 lt!67229)) (not (= (_1!1294 (h!2301 (toList!846 lt!67229))) (_1!1294 (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2682 (v!3153 (underlying!442 thiss!992)))))))))))

(declare-fun b!130481 () Bool)

(assert (=> b!130481 (= e!85099 None!171)))

(assert (= (and d!39745 c!24090) b!130478))

(assert (= (and d!39745 (not c!24090)) b!130479))

(assert (= (and b!130479 c!24091) b!130480))

(assert (= (and b!130479 (not c!24091)) b!130481))

(declare-fun m!153547 () Bool)

(assert (=> b!130480 m!153547))

(assert (=> b!129691 d!39745))

(declare-fun d!39747 () Bool)

(assert (=> d!39747 (= (apply!113 (+!160 lt!67375 (tuple2!2567 lt!67391 (ite (and c!23852 c!23848) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2682 newMap!16)))) lt!67384) (apply!113 lt!67375 lt!67384))))

(declare-fun lt!67807 () Unit!4037)

(assert (=> d!39747 (= lt!67807 (choose!796 lt!67375 lt!67391 (ite (and c!23852 c!23848) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2682 newMap!16)) lt!67384))))

(declare-fun e!85100 () Bool)

(assert (=> d!39747 e!85100))

(declare-fun res!62884 () Bool)

(assert (=> d!39747 (=> (not res!62884) (not e!85100))))

(assert (=> d!39747 (= res!62884 (contains!876 lt!67375 lt!67384))))

(assert (=> d!39747 (= (addApplyDifferent!89 lt!67375 lt!67391 (ite (and c!23852 c!23848) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2682 newMap!16)) lt!67384) lt!67807)))

(declare-fun b!130482 () Bool)

(assert (=> b!130482 (= e!85100 (not (= lt!67384 lt!67391)))))

(assert (= (and d!39747 res!62884) b!130482))

(assert (=> d!39747 m!152291))

(declare-fun m!153549 () Bool)

(assert (=> d!39747 m!153549))

(declare-fun m!153551 () Bool)

(assert (=> d!39747 m!153551))

(assert (=> d!39747 m!152301))

(assert (=> d!39747 m!152301))

(assert (=> d!39747 m!152303))

(assert (=> b!129819 d!39747))

(declare-fun d!39749 () Bool)

(assert (=> d!39749 (= (apply!113 lt!67383 lt!67393) (get!1463 (getValueByKey!167 (toList!846 lt!67383) lt!67393)))))

(declare-fun bs!5409 () Bool)

(assert (= bs!5409 d!39749))

(declare-fun m!153553 () Bool)

(assert (=> bs!5409 m!153553))

(assert (=> bs!5409 m!153553))

(declare-fun m!153555 () Bool)

(assert (=> bs!5409 m!153555))

(assert (=> b!129819 d!39749))

(declare-fun b!130483 () Bool)

(declare-fun e!85102 () Bool)

(declare-fun e!85107 () Bool)

(assert (=> b!130483 (= e!85102 e!85107)))

(assert (=> b!130483 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2497 (_keys!4563 newMap!16))))))

(declare-fun res!62885 () Bool)

(declare-fun lt!67808 () ListLongMap!1661)

(assert (=> b!130483 (= res!62885 (contains!876 lt!67808 (select (arr!2230 (_keys!4563 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!130483 (=> (not res!62885) (not e!85107))))

(declare-fun bm!14191 () Bool)

(declare-fun call!14194 () ListLongMap!1661)

(assert (=> bm!14191 (= call!14194 (getCurrentListMapNoExtraKeys!125 (_keys!4563 newMap!16) (ite (or c!23852 c!23854) (_values!2806 newMap!16) (array!4718 (store (arr!2231 (_values!2806 newMap!16)) (index!3258 lt!67161) (ValueCellFull!1085 (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2498 (_values!2806 newMap!16)))) (mask!7100 newMap!16) (ite c!23852 (ite c!23848 lt!67148 lt!67156) (extraKeys!2596 newMap!16)) (ite (and c!23852 c!23848) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2682 newMap!16)) (ite c!23852 (ite c!23848 (minValue!2682 newMap!16) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2682 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!2823 newMap!16)))))

(declare-fun b!130484 () Bool)

(declare-fun e!85101 () ListLongMap!1661)

(declare-fun e!85104 () ListLongMap!1661)

(assert (=> b!130484 (= e!85101 e!85104)))

(declare-fun c!24092 () Bool)

(assert (=> b!130484 (= c!24092 (validKeyInArray!0 (select (arr!2230 (_keys!4563 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!130485 () Bool)

(assert (=> b!130485 (= e!85104 call!14194)))

(declare-fun d!39751 () Bool)

(declare-fun e!85105 () Bool)

(assert (=> d!39751 e!85105))

(declare-fun res!62888 () Bool)

(assert (=> d!39751 (=> (not res!62888) (not e!85105))))

(assert (=> d!39751 (= res!62888 (not (contains!876 lt!67808 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!39751 (= lt!67808 e!85101)))

(declare-fun c!24093 () Bool)

(assert (=> d!39751 (= c!24093 (bvsge #b00000000000000000000000000000000 (size!2497 (_keys!4563 newMap!16))))))

(assert (=> d!39751 (validMask!0 (mask!7100 newMap!16))))

(assert (=> d!39751 (= (getCurrentListMapNoExtraKeys!125 (_keys!4563 newMap!16) (ite (or c!23852 c!23854) (_values!2806 newMap!16) (array!4718 (store (arr!2231 (_values!2806 newMap!16)) (index!3258 lt!67161) (ValueCellFull!1085 (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2498 (_values!2806 newMap!16)))) (mask!7100 newMap!16) (ite c!23852 (ite c!23848 lt!67148 lt!67156) (extraKeys!2596 newMap!16)) (ite (and c!23852 c!23848) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2682 newMap!16)) (ite c!23852 (ite c!23848 (minValue!2682 newMap!16) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2682 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2823 newMap!16)) lt!67808)))

(declare-fun b!130486 () Bool)

(declare-fun e!85106 () Bool)

(assert (=> b!130486 (= e!85102 e!85106)))

(declare-fun c!24095 () Bool)

(assert (=> b!130486 (= c!24095 (bvslt #b00000000000000000000000000000000 (size!2497 (_keys!4563 newMap!16))))))

(declare-fun b!130487 () Bool)

(assert (=> b!130487 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2497 (_keys!4563 newMap!16))))))

(assert (=> b!130487 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2498 (ite (or c!23852 c!23854) (_values!2806 newMap!16) (array!4718 (store (arr!2231 (_values!2806 newMap!16)) (index!3258 lt!67161) (ValueCellFull!1085 (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2498 (_values!2806 newMap!16)))))))))

(assert (=> b!130487 (= e!85107 (= (apply!113 lt!67808 (select (arr!2230 (_keys!4563 newMap!16)) #b00000000000000000000000000000000)) (get!1459 (select (arr!2231 (ite (or c!23852 c!23854) (_values!2806 newMap!16) (array!4718 (store (arr!2231 (_values!2806 newMap!16)) (index!3258 lt!67161) (ValueCellFull!1085 (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2498 (_values!2806 newMap!16))))) #b00000000000000000000000000000000) (dynLambda!414 (defaultEntry!2823 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!130488 () Bool)

(assert (=> b!130488 (= e!85106 (= lt!67808 (getCurrentListMapNoExtraKeys!125 (_keys!4563 newMap!16) (ite (or c!23852 c!23854) (_values!2806 newMap!16) (array!4718 (store (arr!2231 (_values!2806 newMap!16)) (index!3258 lt!67161) (ValueCellFull!1085 (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2498 (_values!2806 newMap!16)))) (mask!7100 newMap!16) (ite c!23852 (ite c!23848 lt!67148 lt!67156) (extraKeys!2596 newMap!16)) (ite (and c!23852 c!23848) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2682 newMap!16)) (ite c!23852 (ite c!23848 (minValue!2682 newMap!16) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2682 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!2823 newMap!16))))))

(declare-fun b!130489 () Bool)

(declare-fun lt!67809 () Unit!4037)

(declare-fun lt!67812 () Unit!4037)

(assert (=> b!130489 (= lt!67809 lt!67812)))

(declare-fun lt!67814 () ListLongMap!1661)

(declare-fun lt!67811 () (_ BitVec 64))

(declare-fun lt!67810 () V!3457)

(declare-fun lt!67813 () (_ BitVec 64))

(assert (=> b!130489 (not (contains!876 (+!160 lt!67814 (tuple2!2567 lt!67813 lt!67810)) lt!67811))))

(assert (=> b!130489 (= lt!67812 (addStillNotContains!59 lt!67814 lt!67813 lt!67810 lt!67811))))

(assert (=> b!130489 (= lt!67811 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!130489 (= lt!67810 (get!1459 (select (arr!2231 (ite (or c!23852 c!23854) (_values!2806 newMap!16) (array!4718 (store (arr!2231 (_values!2806 newMap!16)) (index!3258 lt!67161) (ValueCellFull!1085 (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2498 (_values!2806 newMap!16))))) #b00000000000000000000000000000000) (dynLambda!414 (defaultEntry!2823 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!130489 (= lt!67813 (select (arr!2230 (_keys!4563 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!130489 (= lt!67814 call!14194)))

(assert (=> b!130489 (= e!85104 (+!160 call!14194 (tuple2!2567 (select (arr!2230 (_keys!4563 newMap!16)) #b00000000000000000000000000000000) (get!1459 (select (arr!2231 (ite (or c!23852 c!23854) (_values!2806 newMap!16) (array!4718 (store (arr!2231 (_values!2806 newMap!16)) (index!3258 lt!67161) (ValueCellFull!1085 (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2498 (_values!2806 newMap!16))))) #b00000000000000000000000000000000) (dynLambda!414 (defaultEntry!2823 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!130490 () Bool)

(assert (=> b!130490 (= e!85101 (ListLongMap!1662 Nil!1698))))

(declare-fun b!130491 () Bool)

(assert (=> b!130491 (= e!85106 (isEmpty!406 lt!67808))))

(declare-fun b!130492 () Bool)

(declare-fun res!62886 () Bool)

(assert (=> b!130492 (=> (not res!62886) (not e!85105))))

(assert (=> b!130492 (= res!62886 (not (contains!876 lt!67808 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!130493 () Bool)

(assert (=> b!130493 (= e!85105 e!85102)))

(declare-fun c!24094 () Bool)

(declare-fun e!85103 () Bool)

(assert (=> b!130493 (= c!24094 e!85103)))

(declare-fun res!62887 () Bool)

(assert (=> b!130493 (=> (not res!62887) (not e!85103))))

(assert (=> b!130493 (= res!62887 (bvslt #b00000000000000000000000000000000 (size!2497 (_keys!4563 newMap!16))))))

(declare-fun b!130494 () Bool)

(assert (=> b!130494 (= e!85103 (validKeyInArray!0 (select (arr!2230 (_keys!4563 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!130494 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (= (and d!39751 c!24093) b!130490))

(assert (= (and d!39751 (not c!24093)) b!130484))

(assert (= (and b!130484 c!24092) b!130489))

(assert (= (and b!130484 (not c!24092)) b!130485))

(assert (= (or b!130489 b!130485) bm!14191))

(assert (= (and d!39751 res!62888) b!130492))

(assert (= (and b!130492 res!62886) b!130493))

(assert (= (and b!130493 res!62887) b!130494))

(assert (= (and b!130493 c!24094) b!130483))

(assert (= (and b!130493 (not c!24094)) b!130486))

(assert (= (and b!130483 res!62885) b!130487))

(assert (= (and b!130486 c!24095) b!130488))

(assert (= (and b!130486 (not c!24095)) b!130491))

(declare-fun b_lambda!5785 () Bool)

(assert (=> (not b_lambda!5785) (not b!130487)))

(assert (=> b!130487 t!6103))

(declare-fun b_and!8069 () Bool)

(assert (= b_and!8065 (and (=> t!6103 result!3917) b_and!8069)))

(assert (=> b!130487 t!6105))

(declare-fun b_and!8071 () Bool)

(assert (= b_and!8067 (and (=> t!6105 result!3919) b_and!8071)))

(declare-fun b_lambda!5787 () Bool)

(assert (=> (not b_lambda!5787) (not b!130489)))

(assert (=> b!130489 t!6103))

(declare-fun b_and!8073 () Bool)

(assert (= b_and!8069 (and (=> t!6103 result!3917) b_and!8073)))

(assert (=> b!130489 t!6105))

(declare-fun b_and!8075 () Bool)

(assert (= b_and!8071 (and (=> t!6105 result!3919) b_and!8075)))

(declare-fun m!153557 () Bool)

(assert (=> b!130492 m!153557))

(assert (=> b!130494 m!152019))

(assert (=> b!130494 m!152019))

(assert (=> b!130494 m!152021))

(declare-fun m!153559 () Bool)

(assert (=> b!130488 m!153559))

(declare-fun m!153561 () Bool)

(assert (=> b!130489 m!153561))

(declare-fun m!153563 () Bool)

(assert (=> b!130489 m!153563))

(assert (=> b!130489 m!152319))

(declare-fun m!153565 () Bool)

(assert (=> b!130489 m!153565))

(assert (=> b!130489 m!152319))

(assert (=> b!130489 m!152071))

(assert (=> b!130489 m!152323))

(assert (=> b!130489 m!152019))

(assert (=> b!130489 m!152071))

(assert (=> b!130489 m!153563))

(declare-fun m!153567 () Bool)

(assert (=> b!130489 m!153567))

(declare-fun m!153569 () Bool)

(assert (=> d!39751 m!153569))

(assert (=> d!39751 m!152025))

(assert (=> b!130483 m!152019))

(assert (=> b!130483 m!152019))

(declare-fun m!153571 () Bool)

(assert (=> b!130483 m!153571))

(assert (=> b!130484 m!152019))

(assert (=> b!130484 m!152019))

(assert (=> b!130484 m!152021))

(assert (=> bm!14191 m!153559))

(assert (=> b!130487 m!152019))

(declare-fun m!153573 () Bool)

(assert (=> b!130487 m!153573))

(assert (=> b!130487 m!152319))

(assert (=> b!130487 m!152319))

(assert (=> b!130487 m!152071))

(assert (=> b!130487 m!152323))

(assert (=> b!130487 m!152019))

(assert (=> b!130487 m!152071))

(declare-fun m!153575 () Bool)

(assert (=> b!130491 m!153575))

(assert (=> b!129819 d!39751))

(declare-fun d!39753 () Bool)

(assert (=> d!39753 (= (apply!113 (+!160 lt!67383 (tuple2!2567 lt!67376 (ite c!23852 (ite c!23848 (minValue!2682 newMap!16) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2682 newMap!16)))) lt!67393) (apply!113 lt!67383 lt!67393))))

(declare-fun lt!67815 () Unit!4037)

(assert (=> d!39753 (= lt!67815 (choose!796 lt!67383 lt!67376 (ite c!23852 (ite c!23848 (minValue!2682 newMap!16) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2682 newMap!16)) lt!67393))))

(declare-fun e!85108 () Bool)

(assert (=> d!39753 e!85108))

(declare-fun res!62889 () Bool)

(assert (=> d!39753 (=> (not res!62889) (not e!85108))))

(assert (=> d!39753 (= res!62889 (contains!876 lt!67383 lt!67393))))

(assert (=> d!39753 (= (addApplyDifferent!89 lt!67383 lt!67376 (ite c!23852 (ite c!23848 (minValue!2682 newMap!16) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2682 newMap!16)) lt!67393) lt!67815)))

(declare-fun b!130495 () Bool)

(assert (=> b!130495 (= e!85108 (not (= lt!67393 lt!67376)))))

(assert (= (and d!39753 res!62889) b!130495))

(assert (=> d!39753 m!152287))

(declare-fun m!153577 () Bool)

(assert (=> d!39753 m!153577))

(declare-fun m!153579 () Bool)

(assert (=> d!39753 m!153579))

(assert (=> d!39753 m!152289))

(assert (=> d!39753 m!152289))

(assert (=> d!39753 m!152307))

(assert (=> b!129819 d!39753))

(declare-fun d!39755 () Bool)

(declare-fun e!85109 () Bool)

(assert (=> d!39755 e!85109))

(declare-fun res!62890 () Bool)

(assert (=> d!39755 (=> (not res!62890) (not e!85109))))

(declare-fun lt!67819 () ListLongMap!1661)

(assert (=> d!39755 (= res!62890 (contains!876 lt!67819 (_1!1294 (tuple2!2567 lt!67389 (ite (and c!23852 c!23848) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2682 newMap!16))))))))

(declare-fun lt!67816 () List!1701)

(assert (=> d!39755 (= lt!67819 (ListLongMap!1662 lt!67816))))

(declare-fun lt!67817 () Unit!4037)

(declare-fun lt!67818 () Unit!4037)

(assert (=> d!39755 (= lt!67817 lt!67818)))

(assert (=> d!39755 (= (getValueByKey!167 lt!67816 (_1!1294 (tuple2!2567 lt!67389 (ite (and c!23852 c!23848) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2682 newMap!16))))) (Some!172 (_2!1294 (tuple2!2567 lt!67389 (ite (and c!23852 c!23848) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2682 newMap!16))))))))

(assert (=> d!39755 (= lt!67818 (lemmaContainsTupThenGetReturnValue!85 lt!67816 (_1!1294 (tuple2!2567 lt!67389 (ite (and c!23852 c!23848) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2682 newMap!16)))) (_2!1294 (tuple2!2567 lt!67389 (ite (and c!23852 c!23848) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2682 newMap!16))))))))

(assert (=> d!39755 (= lt!67816 (insertStrictlySorted!88 (toList!846 lt!67377) (_1!1294 (tuple2!2567 lt!67389 (ite (and c!23852 c!23848) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2682 newMap!16)))) (_2!1294 (tuple2!2567 lt!67389 (ite (and c!23852 c!23848) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2682 newMap!16))))))))

(assert (=> d!39755 (= (+!160 lt!67377 (tuple2!2567 lt!67389 (ite (and c!23852 c!23848) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2682 newMap!16)))) lt!67819)))

(declare-fun b!130496 () Bool)

(declare-fun res!62891 () Bool)

(assert (=> b!130496 (=> (not res!62891) (not e!85109))))

(assert (=> b!130496 (= res!62891 (= (getValueByKey!167 (toList!846 lt!67819) (_1!1294 (tuple2!2567 lt!67389 (ite (and c!23852 c!23848) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2682 newMap!16))))) (Some!172 (_2!1294 (tuple2!2567 lt!67389 (ite (and c!23852 c!23848) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2682 newMap!16)))))))))

(declare-fun b!130497 () Bool)

(assert (=> b!130497 (= e!85109 (contains!878 (toList!846 lt!67819) (tuple2!2567 lt!67389 (ite (and c!23852 c!23848) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2682 newMap!16)))))))

(assert (= (and d!39755 res!62890) b!130496))

(assert (= (and b!130496 res!62891) b!130497))

(declare-fun m!153581 () Bool)

(assert (=> d!39755 m!153581))

(declare-fun m!153583 () Bool)

(assert (=> d!39755 m!153583))

(declare-fun m!153585 () Bool)

(assert (=> d!39755 m!153585))

(declare-fun m!153587 () Bool)

(assert (=> d!39755 m!153587))

(declare-fun m!153589 () Bool)

(assert (=> b!130496 m!153589))

(declare-fun m!153591 () Bool)

(assert (=> b!130497 m!153591))

(assert (=> b!129819 d!39755))

(declare-fun d!39757 () Bool)

(assert (=> d!39757 (= (apply!113 lt!67375 lt!67384) (get!1463 (getValueByKey!167 (toList!846 lt!67375) lt!67384)))))

(declare-fun bs!5410 () Bool)

(assert (= bs!5410 d!39757))

(declare-fun m!153593 () Bool)

(assert (=> bs!5410 m!153593))

(assert (=> bs!5410 m!153593))

(declare-fun m!153595 () Bool)

(assert (=> bs!5410 m!153595))

(assert (=> b!129819 d!39757))

(declare-fun d!39759 () Bool)

(assert (=> d!39759 (= (apply!113 (+!160 lt!67383 (tuple2!2567 lt!67376 (ite c!23852 (ite c!23848 (minValue!2682 newMap!16) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2682 newMap!16)))) lt!67393) (get!1463 (getValueByKey!167 (toList!846 (+!160 lt!67383 (tuple2!2567 lt!67376 (ite c!23852 (ite c!23848 (minValue!2682 newMap!16) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2682 newMap!16))))) lt!67393)))))

(declare-fun bs!5411 () Bool)

(assert (= bs!5411 d!39759))

(declare-fun m!153597 () Bool)

(assert (=> bs!5411 m!153597))

(assert (=> bs!5411 m!153597))

(declare-fun m!153599 () Bool)

(assert (=> bs!5411 m!153599))

(assert (=> b!129819 d!39759))

(declare-fun d!39761 () Bool)

(declare-fun e!85111 () Bool)

(assert (=> d!39761 e!85111))

(declare-fun res!62892 () Bool)

(assert (=> d!39761 (=> res!62892 e!85111)))

(declare-fun lt!67822 () Bool)

(assert (=> d!39761 (= res!62892 (not lt!67822))))

(declare-fun lt!67823 () Bool)

(assert (=> d!39761 (= lt!67822 lt!67823)))

(declare-fun lt!67820 () Unit!4037)

(declare-fun e!85110 () Unit!4037)

(assert (=> d!39761 (= lt!67820 e!85110)))

(declare-fun c!24096 () Bool)

(assert (=> d!39761 (= c!24096 lt!67823)))

(assert (=> d!39761 (= lt!67823 (containsKey!171 (toList!846 (+!160 lt!67377 (tuple2!2567 lt!67389 (ite (and c!23852 c!23848) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2682 newMap!16))))) lt!67379))))

(assert (=> d!39761 (= (contains!876 (+!160 lt!67377 (tuple2!2567 lt!67389 (ite (and c!23852 c!23848) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2682 newMap!16)))) lt!67379) lt!67822)))

(declare-fun b!130498 () Bool)

(declare-fun lt!67821 () Unit!4037)

(assert (=> b!130498 (= e!85110 lt!67821)))

(assert (=> b!130498 (= lt!67821 (lemmaContainsKeyImpliesGetValueByKeyDefined!120 (toList!846 (+!160 lt!67377 (tuple2!2567 lt!67389 (ite (and c!23852 c!23848) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2682 newMap!16))))) lt!67379))))

(assert (=> b!130498 (isDefined!121 (getValueByKey!167 (toList!846 (+!160 lt!67377 (tuple2!2567 lt!67389 (ite (and c!23852 c!23848) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2682 newMap!16))))) lt!67379))))

(declare-fun b!130499 () Bool)

(declare-fun Unit!4073 () Unit!4037)

(assert (=> b!130499 (= e!85110 Unit!4073)))

(declare-fun b!130500 () Bool)

(assert (=> b!130500 (= e!85111 (isDefined!121 (getValueByKey!167 (toList!846 (+!160 lt!67377 (tuple2!2567 lt!67389 (ite (and c!23852 c!23848) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2682 newMap!16))))) lt!67379)))))

(assert (= (and d!39761 c!24096) b!130498))

(assert (= (and d!39761 (not c!24096)) b!130499))

(assert (= (and d!39761 (not res!62892)) b!130500))

(declare-fun m!153601 () Bool)

(assert (=> d!39761 m!153601))

(declare-fun m!153603 () Bool)

(assert (=> b!130498 m!153603))

(declare-fun m!153605 () Bool)

(assert (=> b!130498 m!153605))

(assert (=> b!130498 m!153605))

(declare-fun m!153607 () Bool)

(assert (=> b!130498 m!153607))

(assert (=> b!130500 m!153605))

(assert (=> b!130500 m!153605))

(assert (=> b!130500 m!153607))

(assert (=> b!129819 d!39761))

(declare-fun d!39763 () Bool)

(assert (=> d!39763 (contains!876 (+!160 lt!67377 (tuple2!2567 lt!67389 (ite (and c!23852 c!23848) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2682 newMap!16)))) lt!67379)))

(declare-fun lt!67824 () Unit!4037)

(assert (=> d!39763 (= lt!67824 (choose!797 lt!67377 lt!67389 (ite (and c!23852 c!23848) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2682 newMap!16)) lt!67379))))

(assert (=> d!39763 (contains!876 lt!67377 lt!67379)))

(assert (=> d!39763 (= (addStillContains!89 lt!67377 lt!67389 (ite (and c!23852 c!23848) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2682 newMap!16)) lt!67379) lt!67824)))

(declare-fun bs!5412 () Bool)

(assert (= bs!5412 d!39763))

(assert (=> bs!5412 m!152295))

(assert (=> bs!5412 m!152295))

(assert (=> bs!5412 m!152305))

(declare-fun m!153609 () Bool)

(assert (=> bs!5412 m!153609))

(declare-fun m!153611 () Bool)

(assert (=> bs!5412 m!153611))

(assert (=> b!129819 d!39763))

(declare-fun d!39765 () Bool)

(assert (=> d!39765 (= (apply!113 (+!160 lt!67390 (tuple2!2567 lt!67372 (ite c!23852 (ite c!23848 (minValue!2682 newMap!16) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2682 newMap!16)))) lt!67382) (get!1463 (getValueByKey!167 (toList!846 (+!160 lt!67390 (tuple2!2567 lt!67372 (ite c!23852 (ite c!23848 (minValue!2682 newMap!16) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2682 newMap!16))))) lt!67382)))))

(declare-fun bs!5413 () Bool)

(assert (= bs!5413 d!39765))

(declare-fun m!153613 () Bool)

(assert (=> bs!5413 m!153613))

(assert (=> bs!5413 m!153613))

(declare-fun m!153615 () Bool)

(assert (=> bs!5413 m!153615))

(assert (=> b!129819 d!39765))

(declare-fun d!39767 () Bool)

(assert (=> d!39767 (= (apply!113 lt!67390 lt!67382) (get!1463 (getValueByKey!167 (toList!846 lt!67390) lt!67382)))))

(declare-fun bs!5414 () Bool)

(assert (= bs!5414 d!39767))

(declare-fun m!153617 () Bool)

(assert (=> bs!5414 m!153617))

(assert (=> bs!5414 m!153617))

(declare-fun m!153619 () Bool)

(assert (=> bs!5414 m!153619))

(assert (=> b!129819 d!39767))

(declare-fun d!39769 () Bool)

(assert (=> d!39769 (= (apply!113 (+!160 lt!67390 (tuple2!2567 lt!67372 (ite c!23852 (ite c!23848 (minValue!2682 newMap!16) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2682 newMap!16)))) lt!67382) (apply!113 lt!67390 lt!67382))))

(declare-fun lt!67825 () Unit!4037)

(assert (=> d!39769 (= lt!67825 (choose!796 lt!67390 lt!67372 (ite c!23852 (ite c!23848 (minValue!2682 newMap!16) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2682 newMap!16)) lt!67382))))

(declare-fun e!85112 () Bool)

(assert (=> d!39769 e!85112))

(declare-fun res!62893 () Bool)

(assert (=> d!39769 (=> (not res!62893) (not e!85112))))

(assert (=> d!39769 (= res!62893 (contains!876 lt!67390 lt!67382))))

(assert (=> d!39769 (= (addApplyDifferent!89 lt!67390 lt!67372 (ite c!23852 (ite c!23848 (minValue!2682 newMap!16) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2682 newMap!16)) lt!67382) lt!67825)))

(declare-fun b!130501 () Bool)

(assert (=> b!130501 (= e!85112 (not (= lt!67382 lt!67372)))))

(assert (= (and d!39769 res!62893) b!130501))

(assert (=> d!39769 m!152285))

(declare-fun m!153621 () Bool)

(assert (=> d!39769 m!153621))

(declare-fun m!153623 () Bool)

(assert (=> d!39769 m!153623))

(assert (=> d!39769 m!152299))

(assert (=> d!39769 m!152299))

(assert (=> d!39769 m!152313))

(assert (=> b!129819 d!39769))

(declare-fun d!39771 () Bool)

(assert (=> d!39771 (= (apply!113 (+!160 lt!67375 (tuple2!2567 lt!67391 (ite (and c!23852 c!23848) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2682 newMap!16)))) lt!67384) (get!1463 (getValueByKey!167 (toList!846 (+!160 lt!67375 (tuple2!2567 lt!67391 (ite (and c!23852 c!23848) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2682 newMap!16))))) lt!67384)))))

(declare-fun bs!5415 () Bool)

(assert (= bs!5415 d!39771))

(declare-fun m!153625 () Bool)

(assert (=> bs!5415 m!153625))

(assert (=> bs!5415 m!153625))

(declare-fun m!153627 () Bool)

(assert (=> bs!5415 m!153627))

(assert (=> b!129819 d!39771))

(declare-fun d!39773 () Bool)

(declare-fun e!85113 () Bool)

(assert (=> d!39773 e!85113))

(declare-fun res!62894 () Bool)

(assert (=> d!39773 (=> (not res!62894) (not e!85113))))

(declare-fun lt!67829 () ListLongMap!1661)

(assert (=> d!39773 (= res!62894 (contains!876 lt!67829 (_1!1294 (tuple2!2567 lt!67391 (ite (and c!23852 c!23848) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2682 newMap!16))))))))

(declare-fun lt!67826 () List!1701)

(assert (=> d!39773 (= lt!67829 (ListLongMap!1662 lt!67826))))

(declare-fun lt!67827 () Unit!4037)

(declare-fun lt!67828 () Unit!4037)

(assert (=> d!39773 (= lt!67827 lt!67828)))

(assert (=> d!39773 (= (getValueByKey!167 lt!67826 (_1!1294 (tuple2!2567 lt!67391 (ite (and c!23852 c!23848) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2682 newMap!16))))) (Some!172 (_2!1294 (tuple2!2567 lt!67391 (ite (and c!23852 c!23848) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2682 newMap!16))))))))

(assert (=> d!39773 (= lt!67828 (lemmaContainsTupThenGetReturnValue!85 lt!67826 (_1!1294 (tuple2!2567 lt!67391 (ite (and c!23852 c!23848) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2682 newMap!16)))) (_2!1294 (tuple2!2567 lt!67391 (ite (and c!23852 c!23848) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2682 newMap!16))))))))

(assert (=> d!39773 (= lt!67826 (insertStrictlySorted!88 (toList!846 lt!67375) (_1!1294 (tuple2!2567 lt!67391 (ite (and c!23852 c!23848) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2682 newMap!16)))) (_2!1294 (tuple2!2567 lt!67391 (ite (and c!23852 c!23848) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2682 newMap!16))))))))

(assert (=> d!39773 (= (+!160 lt!67375 (tuple2!2567 lt!67391 (ite (and c!23852 c!23848) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2682 newMap!16)))) lt!67829)))

(declare-fun b!130502 () Bool)

(declare-fun res!62895 () Bool)

(assert (=> b!130502 (=> (not res!62895) (not e!85113))))

(assert (=> b!130502 (= res!62895 (= (getValueByKey!167 (toList!846 lt!67829) (_1!1294 (tuple2!2567 lt!67391 (ite (and c!23852 c!23848) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2682 newMap!16))))) (Some!172 (_2!1294 (tuple2!2567 lt!67391 (ite (and c!23852 c!23848) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2682 newMap!16)))))))))

(declare-fun b!130503 () Bool)

(assert (=> b!130503 (= e!85113 (contains!878 (toList!846 lt!67829) (tuple2!2567 lt!67391 (ite (and c!23852 c!23848) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2682 newMap!16)))))))

(assert (= (and d!39773 res!62894) b!130502))

(assert (= (and b!130502 res!62895) b!130503))

(declare-fun m!153629 () Bool)

(assert (=> d!39773 m!153629))

(declare-fun m!153631 () Bool)

(assert (=> d!39773 m!153631))

(declare-fun m!153633 () Bool)

(assert (=> d!39773 m!153633))

(declare-fun m!153635 () Bool)

(assert (=> d!39773 m!153635))

(declare-fun m!153637 () Bool)

(assert (=> b!130502 m!153637))

(declare-fun m!153639 () Bool)

(assert (=> b!130503 m!153639))

(assert (=> b!129819 d!39773))

(declare-fun d!39775 () Bool)

(declare-fun e!85114 () Bool)

(assert (=> d!39775 e!85114))

(declare-fun res!62896 () Bool)

(assert (=> d!39775 (=> (not res!62896) (not e!85114))))

(declare-fun lt!67833 () ListLongMap!1661)

(assert (=> d!39775 (= res!62896 (contains!876 lt!67833 (_1!1294 (tuple2!2567 lt!67376 (ite c!23852 (ite c!23848 (minValue!2682 newMap!16) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2682 newMap!16))))))))

(declare-fun lt!67830 () List!1701)

(assert (=> d!39775 (= lt!67833 (ListLongMap!1662 lt!67830))))

(declare-fun lt!67831 () Unit!4037)

(declare-fun lt!67832 () Unit!4037)

(assert (=> d!39775 (= lt!67831 lt!67832)))

(assert (=> d!39775 (= (getValueByKey!167 lt!67830 (_1!1294 (tuple2!2567 lt!67376 (ite c!23852 (ite c!23848 (minValue!2682 newMap!16) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2682 newMap!16))))) (Some!172 (_2!1294 (tuple2!2567 lt!67376 (ite c!23852 (ite c!23848 (minValue!2682 newMap!16) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2682 newMap!16))))))))

(assert (=> d!39775 (= lt!67832 (lemmaContainsTupThenGetReturnValue!85 lt!67830 (_1!1294 (tuple2!2567 lt!67376 (ite c!23852 (ite c!23848 (minValue!2682 newMap!16) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2682 newMap!16)))) (_2!1294 (tuple2!2567 lt!67376 (ite c!23852 (ite c!23848 (minValue!2682 newMap!16) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2682 newMap!16))))))))

(assert (=> d!39775 (= lt!67830 (insertStrictlySorted!88 (toList!846 lt!67383) (_1!1294 (tuple2!2567 lt!67376 (ite c!23852 (ite c!23848 (minValue!2682 newMap!16) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2682 newMap!16)))) (_2!1294 (tuple2!2567 lt!67376 (ite c!23852 (ite c!23848 (minValue!2682 newMap!16) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2682 newMap!16))))))))

(assert (=> d!39775 (= (+!160 lt!67383 (tuple2!2567 lt!67376 (ite c!23852 (ite c!23848 (minValue!2682 newMap!16) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2682 newMap!16)))) lt!67833)))

(declare-fun b!130504 () Bool)

(declare-fun res!62897 () Bool)

(assert (=> b!130504 (=> (not res!62897) (not e!85114))))

(assert (=> b!130504 (= res!62897 (= (getValueByKey!167 (toList!846 lt!67833) (_1!1294 (tuple2!2567 lt!67376 (ite c!23852 (ite c!23848 (minValue!2682 newMap!16) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2682 newMap!16))))) (Some!172 (_2!1294 (tuple2!2567 lt!67376 (ite c!23852 (ite c!23848 (minValue!2682 newMap!16) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2682 newMap!16)))))))))

(declare-fun b!130505 () Bool)

(assert (=> b!130505 (= e!85114 (contains!878 (toList!846 lt!67833) (tuple2!2567 lt!67376 (ite c!23852 (ite c!23848 (minValue!2682 newMap!16) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2682 newMap!16)))))))

(assert (= (and d!39775 res!62896) b!130504))

(assert (= (and b!130504 res!62897) b!130505))

(declare-fun m!153641 () Bool)

(assert (=> d!39775 m!153641))

(declare-fun m!153643 () Bool)

(assert (=> d!39775 m!153643))

(declare-fun m!153645 () Bool)

(assert (=> d!39775 m!153645))

(declare-fun m!153647 () Bool)

(assert (=> d!39775 m!153647))

(declare-fun m!153649 () Bool)

(assert (=> b!130504 m!153649))

(declare-fun m!153651 () Bool)

(assert (=> b!130505 m!153651))

(assert (=> b!129819 d!39775))

(declare-fun d!39777 () Bool)

(declare-fun e!85115 () Bool)

(assert (=> d!39777 e!85115))

(declare-fun res!62898 () Bool)

(assert (=> d!39777 (=> (not res!62898) (not e!85115))))

(declare-fun lt!67837 () ListLongMap!1661)

(assert (=> d!39777 (= res!62898 (contains!876 lt!67837 (_1!1294 (tuple2!2567 lt!67372 (ite c!23852 (ite c!23848 (minValue!2682 newMap!16) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2682 newMap!16))))))))

(declare-fun lt!67834 () List!1701)

(assert (=> d!39777 (= lt!67837 (ListLongMap!1662 lt!67834))))

(declare-fun lt!67835 () Unit!4037)

(declare-fun lt!67836 () Unit!4037)

(assert (=> d!39777 (= lt!67835 lt!67836)))

(assert (=> d!39777 (= (getValueByKey!167 lt!67834 (_1!1294 (tuple2!2567 lt!67372 (ite c!23852 (ite c!23848 (minValue!2682 newMap!16) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2682 newMap!16))))) (Some!172 (_2!1294 (tuple2!2567 lt!67372 (ite c!23852 (ite c!23848 (minValue!2682 newMap!16) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2682 newMap!16))))))))

(assert (=> d!39777 (= lt!67836 (lemmaContainsTupThenGetReturnValue!85 lt!67834 (_1!1294 (tuple2!2567 lt!67372 (ite c!23852 (ite c!23848 (minValue!2682 newMap!16) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2682 newMap!16)))) (_2!1294 (tuple2!2567 lt!67372 (ite c!23852 (ite c!23848 (minValue!2682 newMap!16) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2682 newMap!16))))))))

(assert (=> d!39777 (= lt!67834 (insertStrictlySorted!88 (toList!846 lt!67390) (_1!1294 (tuple2!2567 lt!67372 (ite c!23852 (ite c!23848 (minValue!2682 newMap!16) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2682 newMap!16)))) (_2!1294 (tuple2!2567 lt!67372 (ite c!23852 (ite c!23848 (minValue!2682 newMap!16) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2682 newMap!16))))))))

(assert (=> d!39777 (= (+!160 lt!67390 (tuple2!2567 lt!67372 (ite c!23852 (ite c!23848 (minValue!2682 newMap!16) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2682 newMap!16)))) lt!67837)))

(declare-fun b!130506 () Bool)

(declare-fun res!62899 () Bool)

(assert (=> b!130506 (=> (not res!62899) (not e!85115))))

(assert (=> b!130506 (= res!62899 (= (getValueByKey!167 (toList!846 lt!67837) (_1!1294 (tuple2!2567 lt!67372 (ite c!23852 (ite c!23848 (minValue!2682 newMap!16) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2682 newMap!16))))) (Some!172 (_2!1294 (tuple2!2567 lt!67372 (ite c!23852 (ite c!23848 (minValue!2682 newMap!16) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2682 newMap!16)))))))))

(declare-fun b!130507 () Bool)

(assert (=> b!130507 (= e!85115 (contains!878 (toList!846 lt!67837) (tuple2!2567 lt!67372 (ite c!23852 (ite c!23848 (minValue!2682 newMap!16) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2682 newMap!16)))))))

(assert (= (and d!39777 res!62898) b!130506))

(assert (= (and b!130506 res!62899) b!130507))

(declare-fun m!153653 () Bool)

(assert (=> d!39777 m!153653))

(declare-fun m!153655 () Bool)

(assert (=> d!39777 m!153655))

(declare-fun m!153657 () Bool)

(assert (=> d!39777 m!153657))

(declare-fun m!153659 () Bool)

(assert (=> d!39777 m!153659))

(declare-fun m!153661 () Bool)

(assert (=> b!130506 m!153661))

(declare-fun m!153663 () Bool)

(assert (=> b!130507 m!153663))

(assert (=> b!129819 d!39777))

(declare-fun d!39779 () Bool)

(declare-fun e!85117 () Bool)

(assert (=> d!39779 e!85117))

(declare-fun res!62900 () Bool)

(assert (=> d!39779 (=> res!62900 e!85117)))

(declare-fun lt!67840 () Bool)

(assert (=> d!39779 (= res!62900 (not lt!67840))))

(declare-fun lt!67841 () Bool)

(assert (=> d!39779 (= lt!67840 lt!67841)))

(declare-fun lt!67838 () Unit!4037)

(declare-fun e!85116 () Unit!4037)

(assert (=> d!39779 (= lt!67838 e!85116)))

(declare-fun c!24097 () Bool)

(assert (=> d!39779 (= c!24097 lt!67841)))

(assert (=> d!39779 (= lt!67841 (containsKey!171 (toList!846 lt!67418) (_1!1294 (tuple2!2567 lt!67056 (minValue!2682 (v!3153 (underlying!442 thiss!992)))))))))

(assert (=> d!39779 (= (contains!876 lt!67418 (_1!1294 (tuple2!2567 lt!67056 (minValue!2682 (v!3153 (underlying!442 thiss!992)))))) lt!67840)))

(declare-fun b!130508 () Bool)

(declare-fun lt!67839 () Unit!4037)

(assert (=> b!130508 (= e!85116 lt!67839)))

(assert (=> b!130508 (= lt!67839 (lemmaContainsKeyImpliesGetValueByKeyDefined!120 (toList!846 lt!67418) (_1!1294 (tuple2!2567 lt!67056 (minValue!2682 (v!3153 (underlying!442 thiss!992)))))))))

(assert (=> b!130508 (isDefined!121 (getValueByKey!167 (toList!846 lt!67418) (_1!1294 (tuple2!2567 lt!67056 (minValue!2682 (v!3153 (underlying!442 thiss!992)))))))))

(declare-fun b!130509 () Bool)

(declare-fun Unit!4074 () Unit!4037)

(assert (=> b!130509 (= e!85116 Unit!4074)))

(declare-fun b!130510 () Bool)

(assert (=> b!130510 (= e!85117 (isDefined!121 (getValueByKey!167 (toList!846 lt!67418) (_1!1294 (tuple2!2567 lt!67056 (minValue!2682 (v!3153 (underlying!442 thiss!992))))))))))

(assert (= (and d!39779 c!24097) b!130508))

(assert (= (and d!39779 (not c!24097)) b!130509))

(assert (= (and d!39779 (not res!62900)) b!130510))

(declare-fun m!153665 () Bool)

(assert (=> d!39779 m!153665))

(declare-fun m!153667 () Bool)

(assert (=> b!130508 m!153667))

(assert (=> b!130508 m!152409))

(assert (=> b!130508 m!152409))

(declare-fun m!153669 () Bool)

(assert (=> b!130508 m!153669))

(assert (=> b!130510 m!152409))

(assert (=> b!130510 m!152409))

(assert (=> b!130510 m!153669))

(assert (=> d!39403 d!39779))

(declare-fun b!130513 () Bool)

(declare-fun e!85119 () Option!173)

(assert (=> b!130513 (= e!85119 (getValueByKey!167 (t!6091 lt!67415) (_1!1294 (tuple2!2567 lt!67056 (minValue!2682 (v!3153 (underlying!442 thiss!992)))))))))

(declare-fun b!130511 () Bool)

(declare-fun e!85118 () Option!173)

(assert (=> b!130511 (= e!85118 (Some!172 (_2!1294 (h!2301 lt!67415))))))

(declare-fun d!39781 () Bool)

(declare-fun c!24098 () Bool)

(assert (=> d!39781 (= c!24098 (and ((_ is Cons!1697) lt!67415) (= (_1!1294 (h!2301 lt!67415)) (_1!1294 (tuple2!2567 lt!67056 (minValue!2682 (v!3153 (underlying!442 thiss!992))))))))))

(assert (=> d!39781 (= (getValueByKey!167 lt!67415 (_1!1294 (tuple2!2567 lt!67056 (minValue!2682 (v!3153 (underlying!442 thiss!992)))))) e!85118)))

(declare-fun b!130512 () Bool)

(assert (=> b!130512 (= e!85118 e!85119)))

(declare-fun c!24099 () Bool)

(assert (=> b!130512 (= c!24099 (and ((_ is Cons!1697) lt!67415) (not (= (_1!1294 (h!2301 lt!67415)) (_1!1294 (tuple2!2567 lt!67056 (minValue!2682 (v!3153 (underlying!442 thiss!992)))))))))))

(declare-fun b!130514 () Bool)

(assert (=> b!130514 (= e!85119 None!171)))

(assert (= (and d!39781 c!24098) b!130511))

(assert (= (and d!39781 (not c!24098)) b!130512))

(assert (= (and b!130512 c!24099) b!130513))

(assert (= (and b!130512 (not c!24099)) b!130514))

(declare-fun m!153671 () Bool)

(assert (=> b!130513 m!153671))

(assert (=> d!39403 d!39781))

(declare-fun d!39783 () Bool)

(assert (=> d!39783 (= (getValueByKey!167 lt!67415 (_1!1294 (tuple2!2567 lt!67056 (minValue!2682 (v!3153 (underlying!442 thiss!992)))))) (Some!172 (_2!1294 (tuple2!2567 lt!67056 (minValue!2682 (v!3153 (underlying!442 thiss!992)))))))))

(declare-fun lt!67842 () Unit!4037)

(assert (=> d!39783 (= lt!67842 (choose!802 lt!67415 (_1!1294 (tuple2!2567 lt!67056 (minValue!2682 (v!3153 (underlying!442 thiss!992))))) (_2!1294 (tuple2!2567 lt!67056 (minValue!2682 (v!3153 (underlying!442 thiss!992)))))))))

(declare-fun e!85120 () Bool)

(assert (=> d!39783 e!85120))

(declare-fun res!62901 () Bool)

(assert (=> d!39783 (=> (not res!62901) (not e!85120))))

(assert (=> d!39783 (= res!62901 (isStrictlySorted!314 lt!67415))))

(assert (=> d!39783 (= (lemmaContainsTupThenGetReturnValue!85 lt!67415 (_1!1294 (tuple2!2567 lt!67056 (minValue!2682 (v!3153 (underlying!442 thiss!992))))) (_2!1294 (tuple2!2567 lt!67056 (minValue!2682 (v!3153 (underlying!442 thiss!992)))))) lt!67842)))

(declare-fun b!130515 () Bool)

(declare-fun res!62902 () Bool)

(assert (=> b!130515 (=> (not res!62902) (not e!85120))))

(assert (=> b!130515 (= res!62902 (containsKey!171 lt!67415 (_1!1294 (tuple2!2567 lt!67056 (minValue!2682 (v!3153 (underlying!442 thiss!992)))))))))

(declare-fun b!130516 () Bool)

(assert (=> b!130516 (= e!85120 (contains!878 lt!67415 (tuple2!2567 (_1!1294 (tuple2!2567 lt!67056 (minValue!2682 (v!3153 (underlying!442 thiss!992))))) (_2!1294 (tuple2!2567 lt!67056 (minValue!2682 (v!3153 (underlying!442 thiss!992))))))))))

(assert (= (and d!39783 res!62901) b!130515))

(assert (= (and b!130515 res!62902) b!130516))

(assert (=> d!39783 m!152403))

(declare-fun m!153673 () Bool)

(assert (=> d!39783 m!153673))

(declare-fun m!153675 () Bool)

(assert (=> d!39783 m!153675))

(declare-fun m!153677 () Bool)

(assert (=> b!130515 m!153677))

(declare-fun m!153679 () Bool)

(assert (=> b!130516 m!153679))

(assert (=> d!39403 d!39783))

(declare-fun bm!14192 () Bool)

(declare-fun call!14195 () List!1701)

(declare-fun call!14197 () List!1701)

(assert (=> bm!14192 (= call!14195 call!14197)))

(declare-fun b!130517 () Bool)

(declare-fun e!85121 () List!1701)

(declare-fun call!14196 () List!1701)

(assert (=> b!130517 (= e!85121 call!14196)))

(declare-fun bm!14193 () Bool)

(declare-fun e!85125 () List!1701)

(declare-fun c!24101 () Bool)

(assert (=> bm!14193 (= call!14196 ($colon$colon!90 e!85125 (ite c!24101 (h!2301 (toList!846 lt!67074)) (tuple2!2567 (_1!1294 (tuple2!2567 lt!67056 (minValue!2682 (v!3153 (underlying!442 thiss!992))))) (_2!1294 (tuple2!2567 lt!67056 (minValue!2682 (v!3153 (underlying!442 thiss!992)))))))))))

(declare-fun c!24103 () Bool)

(assert (=> bm!14193 (= c!24103 c!24101)))

(declare-fun d!39785 () Bool)

(declare-fun e!85123 () Bool)

(assert (=> d!39785 e!85123))

(declare-fun res!62904 () Bool)

(assert (=> d!39785 (=> (not res!62904) (not e!85123))))

(declare-fun lt!67843 () List!1701)

(assert (=> d!39785 (= res!62904 (isStrictlySorted!314 lt!67843))))

(assert (=> d!39785 (= lt!67843 e!85121)))

(assert (=> d!39785 (= c!24101 (and ((_ is Cons!1697) (toList!846 lt!67074)) (bvslt (_1!1294 (h!2301 (toList!846 lt!67074))) (_1!1294 (tuple2!2567 lt!67056 (minValue!2682 (v!3153 (underlying!442 thiss!992))))))))))

(assert (=> d!39785 (isStrictlySorted!314 (toList!846 lt!67074))))

(assert (=> d!39785 (= (insertStrictlySorted!88 (toList!846 lt!67074) (_1!1294 (tuple2!2567 lt!67056 (minValue!2682 (v!3153 (underlying!442 thiss!992))))) (_2!1294 (tuple2!2567 lt!67056 (minValue!2682 (v!3153 (underlying!442 thiss!992)))))) lt!67843)))

(declare-fun b!130518 () Bool)

(declare-fun e!85124 () List!1701)

(assert (=> b!130518 (= e!85124 call!14195)))

(declare-fun b!130519 () Bool)

(declare-fun c!24100 () Bool)

(declare-fun c!24102 () Bool)

(assert (=> b!130519 (= e!85125 (ite c!24102 (t!6091 (toList!846 lt!67074)) (ite c!24100 (Cons!1697 (h!2301 (toList!846 lt!67074)) (t!6091 (toList!846 lt!67074))) Nil!1698)))))

(declare-fun b!130520 () Bool)

(assert (=> b!130520 (= e!85125 (insertStrictlySorted!88 (t!6091 (toList!846 lt!67074)) (_1!1294 (tuple2!2567 lt!67056 (minValue!2682 (v!3153 (underlying!442 thiss!992))))) (_2!1294 (tuple2!2567 lt!67056 (minValue!2682 (v!3153 (underlying!442 thiss!992)))))))))

(declare-fun bm!14194 () Bool)

(assert (=> bm!14194 (= call!14197 call!14196)))

(declare-fun b!130521 () Bool)

(declare-fun e!85122 () List!1701)

(assert (=> b!130521 (= e!85122 call!14197)))

(declare-fun b!130522 () Bool)

(assert (=> b!130522 (= c!24100 (and ((_ is Cons!1697) (toList!846 lt!67074)) (bvsgt (_1!1294 (h!2301 (toList!846 lt!67074))) (_1!1294 (tuple2!2567 lt!67056 (minValue!2682 (v!3153 (underlying!442 thiss!992))))))))))

(assert (=> b!130522 (= e!85122 e!85124)))

(declare-fun b!130523 () Bool)

(assert (=> b!130523 (= e!85123 (contains!878 lt!67843 (tuple2!2567 (_1!1294 (tuple2!2567 lt!67056 (minValue!2682 (v!3153 (underlying!442 thiss!992))))) (_2!1294 (tuple2!2567 lt!67056 (minValue!2682 (v!3153 (underlying!442 thiss!992))))))))))

(declare-fun b!130524 () Bool)

(assert (=> b!130524 (= e!85124 call!14195)))

(declare-fun b!130525 () Bool)

(declare-fun res!62903 () Bool)

(assert (=> b!130525 (=> (not res!62903) (not e!85123))))

(assert (=> b!130525 (= res!62903 (containsKey!171 lt!67843 (_1!1294 (tuple2!2567 lt!67056 (minValue!2682 (v!3153 (underlying!442 thiss!992)))))))))

(declare-fun b!130526 () Bool)

(assert (=> b!130526 (= e!85121 e!85122)))

(assert (=> b!130526 (= c!24102 (and ((_ is Cons!1697) (toList!846 lt!67074)) (= (_1!1294 (h!2301 (toList!846 lt!67074))) (_1!1294 (tuple2!2567 lt!67056 (minValue!2682 (v!3153 (underlying!442 thiss!992))))))))))

(assert (= (and d!39785 c!24101) b!130517))

(assert (= (and d!39785 (not c!24101)) b!130526))

(assert (= (and b!130526 c!24102) b!130521))

(assert (= (and b!130526 (not c!24102)) b!130522))

(assert (= (and b!130522 c!24100) b!130524))

(assert (= (and b!130522 (not c!24100)) b!130518))

(assert (= (or b!130524 b!130518) bm!14192))

(assert (= (or b!130521 bm!14192) bm!14194))

(assert (= (or b!130517 bm!14194) bm!14193))

(assert (= (and bm!14193 c!24103) b!130520))

(assert (= (and bm!14193 (not c!24103)) b!130519))

(assert (= (and d!39785 res!62904) b!130525))

(assert (= (and b!130525 res!62903) b!130523))

(declare-fun m!153681 () Bool)

(assert (=> b!130525 m!153681))

(declare-fun m!153683 () Bool)

(assert (=> bm!14193 m!153683))

(declare-fun m!153685 () Bool)

(assert (=> b!130520 m!153685))

(declare-fun m!153687 () Bool)

(assert (=> d!39785 m!153687))

(declare-fun m!153689 () Bool)

(assert (=> d!39785 m!153689))

(declare-fun m!153691 () Bool)

(assert (=> b!130523 m!153691))

(assert (=> d!39403 d!39785))

(declare-fun d!39787 () Bool)

(assert (=> d!39787 (= (apply!113 lt!67211 (select (arr!2230 (_keys!4563 newMap!16)) #b00000000000000000000000000000000)) (get!1463 (getValueByKey!167 (toList!846 lt!67211) (select (arr!2230 (_keys!4563 newMap!16)) #b00000000000000000000000000000000))))))

(declare-fun bs!5416 () Bool)

(assert (= bs!5416 d!39787))

(assert (=> bs!5416 m!152019))

(declare-fun m!153693 () Bool)

(assert (=> bs!5416 m!153693))

(assert (=> bs!5416 m!153693))

(declare-fun m!153695 () Bool)

(assert (=> bs!5416 m!153695))

(assert (=> b!129672 d!39787))

(declare-fun d!39789 () Bool)

(declare-fun c!24104 () Bool)

(assert (=> d!39789 (= c!24104 ((_ is ValueCellFull!1085) (select (arr!2231 (_values!2806 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun e!85126 () V!3457)

(assert (=> d!39789 (= (get!1459 (select (arr!2231 (_values!2806 newMap!16)) #b00000000000000000000000000000000) (dynLambda!414 (defaultEntry!2823 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000)) e!85126)))

(declare-fun b!130527 () Bool)

(assert (=> b!130527 (= e!85126 (get!1461 (select (arr!2231 (_values!2806 newMap!16)) #b00000000000000000000000000000000) (dynLambda!414 (defaultEntry!2823 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!130528 () Bool)

(assert (=> b!130528 (= e!85126 (get!1462 (select (arr!2231 (_values!2806 newMap!16)) #b00000000000000000000000000000000) (dynLambda!414 (defaultEntry!2823 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!39789 c!24104) b!130527))

(assert (= (and d!39789 (not c!24104)) b!130528))

(assert (=> b!130527 m!152067))

(assert (=> b!130527 m!152071))

(declare-fun m!153697 () Bool)

(assert (=> b!130527 m!153697))

(assert (=> b!130528 m!152067))

(assert (=> b!130528 m!152071))

(declare-fun m!153699 () Bool)

(assert (=> b!130528 m!153699))

(assert (=> b!129672 d!39789))

(assert (=> b!129751 d!39457))

(assert (=> b!129751 d!39459))

(assert (=> bm!14107 d!39351))

(declare-fun d!39791 () Bool)

(declare-fun e!85128 () Bool)

(assert (=> d!39791 e!85128))

(declare-fun res!62905 () Bool)

(assert (=> d!39791 (=> res!62905 e!85128)))

(declare-fun lt!67846 () Bool)

(assert (=> d!39791 (= res!62905 (not lt!67846))))

(declare-fun lt!67847 () Bool)

(assert (=> d!39791 (= lt!67846 lt!67847)))

(declare-fun lt!67844 () Unit!4037)

(declare-fun e!85127 () Unit!4037)

(assert (=> d!39791 (= lt!67844 e!85127)))

(declare-fun c!24105 () Bool)

(assert (=> d!39791 (= c!24105 lt!67847)))

(assert (=> d!39791 (= lt!67847 (containsKey!171 (toList!846 lt!67185) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!39791 (= (contains!876 lt!67185 #b1000000000000000000000000000000000000000000000000000000000000000) lt!67846)))

(declare-fun b!130529 () Bool)

(declare-fun lt!67845 () Unit!4037)

(assert (=> b!130529 (= e!85127 lt!67845)))

(assert (=> b!130529 (= lt!67845 (lemmaContainsKeyImpliesGetValueByKeyDefined!120 (toList!846 lt!67185) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!130529 (isDefined!121 (getValueByKey!167 (toList!846 lt!67185) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!130530 () Bool)

(declare-fun Unit!4075 () Unit!4037)

(assert (=> b!130530 (= e!85127 Unit!4075)))

(declare-fun b!130531 () Bool)

(assert (=> b!130531 (= e!85128 (isDefined!121 (getValueByKey!167 (toList!846 lt!67185) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!39791 c!24105) b!130529))

(assert (= (and d!39791 (not c!24105)) b!130530))

(assert (= (and d!39791 (not res!62905)) b!130531))

(declare-fun m!153701 () Bool)

(assert (=> d!39791 m!153701))

(declare-fun m!153703 () Bool)

(assert (=> b!130529 m!153703))

(declare-fun m!153705 () Bool)

(assert (=> b!130529 m!153705))

(assert (=> b!130529 m!153705))

(declare-fun m!153707 () Bool)

(assert (=> b!130529 m!153707))

(assert (=> b!130531 m!153705))

(assert (=> b!130531 m!153705))

(assert (=> b!130531 m!153707))

(assert (=> b!129658 d!39791))

(declare-fun b!130532 () Bool)

(declare-fun res!62914 () Bool)

(declare-fun e!85139 () Bool)

(assert (=> b!130532 (=> (not res!62914) (not e!85139))))

(declare-fun e!85136 () Bool)

(assert (=> b!130532 (= res!62914 e!85136)))

(declare-fun res!62907 () Bool)

(assert (=> b!130532 (=> res!62907 e!85136)))

(declare-fun e!85132 () Bool)

(assert (=> b!130532 (= res!62907 (not e!85132))))

(declare-fun res!62912 () Bool)

(assert (=> b!130532 (=> (not res!62912) (not e!85132))))

(assert (=> b!130532 (= res!62912 (bvslt #b00000000000000000000000000000000 (size!2497 (_keys!4563 (_2!1295 lt!67144)))))))

(declare-fun b!130533 () Bool)

(declare-fun e!85141 () Bool)

(declare-fun lt!67863 () ListLongMap!1661)

(assert (=> b!130533 (= e!85141 (= (apply!113 lt!67863 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2682 (_2!1295 lt!67144))))))

(declare-fun b!130534 () Bool)

(declare-fun e!85137 () Bool)

(assert (=> b!130534 (= e!85137 e!85141)))

(declare-fun res!62911 () Bool)

(declare-fun call!14200 () Bool)

(assert (=> b!130534 (= res!62911 call!14200)))

(assert (=> b!130534 (=> (not res!62911) (not e!85141))))

(declare-fun b!130535 () Bool)

(declare-fun e!85130 () Bool)

(assert (=> b!130535 (= e!85136 e!85130)))

(declare-fun res!62909 () Bool)

(assert (=> b!130535 (=> (not res!62909) (not e!85130))))

(assert (=> b!130535 (= res!62909 (contains!876 lt!67863 (select (arr!2230 (_keys!4563 (_2!1295 lt!67144))) #b00000000000000000000000000000000)))))

(assert (=> b!130535 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2497 (_keys!4563 (_2!1295 lt!67144)))))))

(declare-fun bm!14195 () Bool)

(declare-fun call!14203 () ListLongMap!1661)

(declare-fun call!14202 () ListLongMap!1661)

(assert (=> bm!14195 (= call!14203 call!14202)))

(declare-fun b!130536 () Bool)

(declare-fun e!85129 () Bool)

(declare-fun e!85131 () Bool)

(assert (=> b!130536 (= e!85129 e!85131)))

(declare-fun res!62910 () Bool)

(declare-fun call!14198 () Bool)

(assert (=> b!130536 (= res!62910 call!14198)))

(assert (=> b!130536 (=> (not res!62910) (not e!85131))))

(declare-fun b!130538 () Bool)

(declare-fun e!85140 () ListLongMap!1661)

(declare-fun call!14204 () ListLongMap!1661)

(assert (=> b!130538 (= e!85140 call!14204)))

(declare-fun b!130539 () Bool)

(declare-fun e!85133 () Bool)

(assert (=> b!130539 (= e!85133 (validKeyInArray!0 (select (arr!2230 (_keys!4563 (_2!1295 lt!67144))) #b00000000000000000000000000000000)))))

(declare-fun bm!14196 () Bool)

(assert (=> bm!14196 (= call!14202 (getCurrentListMapNoExtraKeys!125 (_keys!4563 (_2!1295 lt!67144)) (_values!2806 (_2!1295 lt!67144)) (mask!7100 (_2!1295 lt!67144)) (extraKeys!2596 (_2!1295 lt!67144)) (zeroValue!2682 (_2!1295 lt!67144)) (minValue!2682 (_2!1295 lt!67144)) #b00000000000000000000000000000000 (defaultEntry!2823 (_2!1295 lt!67144))))))

(declare-fun bm!14197 () Bool)

(assert (=> bm!14197 (= call!14198 (contains!876 lt!67863 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!130540 () Bool)

(assert (=> b!130540 (= e!85130 (= (apply!113 lt!67863 (select (arr!2230 (_keys!4563 (_2!1295 lt!67144))) #b00000000000000000000000000000000)) (get!1459 (select (arr!2231 (_values!2806 (_2!1295 lt!67144))) #b00000000000000000000000000000000) (dynLambda!414 (defaultEntry!2823 (_2!1295 lt!67144)) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!130540 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2498 (_values!2806 (_2!1295 lt!67144)))))))

(assert (=> b!130540 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2497 (_keys!4563 (_2!1295 lt!67144)))))))

(declare-fun b!130541 () Bool)

(assert (=> b!130541 (= e!85139 e!85129)))

(declare-fun c!24107 () Bool)

(assert (=> b!130541 (= c!24107 (not (= (bvand (extraKeys!2596 (_2!1295 lt!67144)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!130542 () Bool)

(assert (=> b!130542 (= e!85137 (not call!14200))))

(declare-fun b!130543 () Bool)

(declare-fun e!85135 () Unit!4037)

(declare-fun Unit!4076 () Unit!4037)

(assert (=> b!130543 (= e!85135 Unit!4076)))

(declare-fun b!130544 () Bool)

(declare-fun e!85138 () ListLongMap!1661)

(declare-fun call!14201 () ListLongMap!1661)

(assert (=> b!130544 (= e!85138 call!14201)))

(declare-fun bm!14198 () Bool)

(declare-fun call!14199 () ListLongMap!1661)

(assert (=> bm!14198 (= call!14201 call!14199)))

(declare-fun b!130545 () Bool)

(declare-fun lt!67857 () Unit!4037)

(assert (=> b!130545 (= e!85135 lt!67857)))

(declare-fun lt!67853 () ListLongMap!1661)

(assert (=> b!130545 (= lt!67853 (getCurrentListMapNoExtraKeys!125 (_keys!4563 (_2!1295 lt!67144)) (_values!2806 (_2!1295 lt!67144)) (mask!7100 (_2!1295 lt!67144)) (extraKeys!2596 (_2!1295 lt!67144)) (zeroValue!2682 (_2!1295 lt!67144)) (minValue!2682 (_2!1295 lt!67144)) #b00000000000000000000000000000000 (defaultEntry!2823 (_2!1295 lt!67144))))))

(declare-fun lt!67865 () (_ BitVec 64))

(assert (=> b!130545 (= lt!67865 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!67855 () (_ BitVec 64))

(assert (=> b!130545 (= lt!67855 (select (arr!2230 (_keys!4563 (_2!1295 lt!67144))) #b00000000000000000000000000000000))))

(declare-fun lt!67854 () Unit!4037)

(assert (=> b!130545 (= lt!67854 (addStillContains!89 lt!67853 lt!67865 (zeroValue!2682 (_2!1295 lt!67144)) lt!67855))))

(assert (=> b!130545 (contains!876 (+!160 lt!67853 (tuple2!2567 lt!67865 (zeroValue!2682 (_2!1295 lt!67144)))) lt!67855)))

(declare-fun lt!67856 () Unit!4037)

(assert (=> b!130545 (= lt!67856 lt!67854)))

(declare-fun lt!67866 () ListLongMap!1661)

(assert (=> b!130545 (= lt!67866 (getCurrentListMapNoExtraKeys!125 (_keys!4563 (_2!1295 lt!67144)) (_values!2806 (_2!1295 lt!67144)) (mask!7100 (_2!1295 lt!67144)) (extraKeys!2596 (_2!1295 lt!67144)) (zeroValue!2682 (_2!1295 lt!67144)) (minValue!2682 (_2!1295 lt!67144)) #b00000000000000000000000000000000 (defaultEntry!2823 (_2!1295 lt!67144))))))

(declare-fun lt!67848 () (_ BitVec 64))

(assert (=> b!130545 (= lt!67848 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!67858 () (_ BitVec 64))

(assert (=> b!130545 (= lt!67858 (select (arr!2230 (_keys!4563 (_2!1295 lt!67144))) #b00000000000000000000000000000000))))

(declare-fun lt!67868 () Unit!4037)

(assert (=> b!130545 (= lt!67868 (addApplyDifferent!89 lt!67866 lt!67848 (minValue!2682 (_2!1295 lt!67144)) lt!67858))))

(assert (=> b!130545 (= (apply!113 (+!160 lt!67866 (tuple2!2567 lt!67848 (minValue!2682 (_2!1295 lt!67144)))) lt!67858) (apply!113 lt!67866 lt!67858))))

(declare-fun lt!67864 () Unit!4037)

(assert (=> b!130545 (= lt!67864 lt!67868)))

(declare-fun lt!67851 () ListLongMap!1661)

(assert (=> b!130545 (= lt!67851 (getCurrentListMapNoExtraKeys!125 (_keys!4563 (_2!1295 lt!67144)) (_values!2806 (_2!1295 lt!67144)) (mask!7100 (_2!1295 lt!67144)) (extraKeys!2596 (_2!1295 lt!67144)) (zeroValue!2682 (_2!1295 lt!67144)) (minValue!2682 (_2!1295 lt!67144)) #b00000000000000000000000000000000 (defaultEntry!2823 (_2!1295 lt!67144))))))

(declare-fun lt!67867 () (_ BitVec 64))

(assert (=> b!130545 (= lt!67867 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!67860 () (_ BitVec 64))

(assert (=> b!130545 (= lt!67860 (select (arr!2230 (_keys!4563 (_2!1295 lt!67144))) #b00000000000000000000000000000000))))

(declare-fun lt!67862 () Unit!4037)

(assert (=> b!130545 (= lt!67862 (addApplyDifferent!89 lt!67851 lt!67867 (zeroValue!2682 (_2!1295 lt!67144)) lt!67860))))

(assert (=> b!130545 (= (apply!113 (+!160 lt!67851 (tuple2!2567 lt!67867 (zeroValue!2682 (_2!1295 lt!67144)))) lt!67860) (apply!113 lt!67851 lt!67860))))

(declare-fun lt!67861 () Unit!4037)

(assert (=> b!130545 (= lt!67861 lt!67862)))

(declare-fun lt!67859 () ListLongMap!1661)

(assert (=> b!130545 (= lt!67859 (getCurrentListMapNoExtraKeys!125 (_keys!4563 (_2!1295 lt!67144)) (_values!2806 (_2!1295 lt!67144)) (mask!7100 (_2!1295 lt!67144)) (extraKeys!2596 (_2!1295 lt!67144)) (zeroValue!2682 (_2!1295 lt!67144)) (minValue!2682 (_2!1295 lt!67144)) #b00000000000000000000000000000000 (defaultEntry!2823 (_2!1295 lt!67144))))))

(declare-fun lt!67852 () (_ BitVec 64))

(assert (=> b!130545 (= lt!67852 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!67869 () (_ BitVec 64))

(assert (=> b!130545 (= lt!67869 (select (arr!2230 (_keys!4563 (_2!1295 lt!67144))) #b00000000000000000000000000000000))))

(assert (=> b!130545 (= lt!67857 (addApplyDifferent!89 lt!67859 lt!67852 (minValue!2682 (_2!1295 lt!67144)) lt!67869))))

(assert (=> b!130545 (= (apply!113 (+!160 lt!67859 (tuple2!2567 lt!67852 (minValue!2682 (_2!1295 lt!67144)))) lt!67869) (apply!113 lt!67859 lt!67869))))

(declare-fun b!130546 () Bool)

(assert (=> b!130546 (= e!85132 (validKeyInArray!0 (select (arr!2230 (_keys!4563 (_2!1295 lt!67144))) #b00000000000000000000000000000000)))))

(declare-fun b!130547 () Bool)

(declare-fun c!24110 () Bool)

(assert (=> b!130547 (= c!24110 (and (not (= (bvand (extraKeys!2596 (_2!1295 lt!67144)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2596 (_2!1295 lt!67144)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!130547 (= e!85138 e!85140)))

(declare-fun b!130548 () Bool)

(declare-fun res!62913 () Bool)

(assert (=> b!130548 (=> (not res!62913) (not e!85139))))

(assert (=> b!130548 (= res!62913 e!85137)))

(declare-fun c!24108 () Bool)

(assert (=> b!130548 (= c!24108 (not (= (bvand (extraKeys!2596 (_2!1295 lt!67144)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!130549 () Bool)

(assert (=> b!130549 (= e!85140 call!14201)))

(declare-fun bm!14199 () Bool)

(assert (=> bm!14199 (= call!14204 call!14203)))

(declare-fun b!130550 () Bool)

(assert (=> b!130550 (= e!85131 (= (apply!113 lt!67863 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2682 (_2!1295 lt!67144))))))

(declare-fun b!130537 () Bool)

(declare-fun e!85134 () ListLongMap!1661)

(assert (=> b!130537 (= e!85134 (+!160 call!14199 (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2682 (_2!1295 lt!67144)))))))

(declare-fun d!39793 () Bool)

(assert (=> d!39793 e!85139))

(declare-fun res!62908 () Bool)

(assert (=> d!39793 (=> (not res!62908) (not e!85139))))

(assert (=> d!39793 (= res!62908 (or (bvsge #b00000000000000000000000000000000 (size!2497 (_keys!4563 (_2!1295 lt!67144)))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2497 (_keys!4563 (_2!1295 lt!67144)))))))))

(declare-fun lt!67849 () ListLongMap!1661)

(assert (=> d!39793 (= lt!67863 lt!67849)))

(declare-fun lt!67850 () Unit!4037)

(assert (=> d!39793 (= lt!67850 e!85135)))

(declare-fun c!24106 () Bool)

(assert (=> d!39793 (= c!24106 e!85133)))

(declare-fun res!62906 () Bool)

(assert (=> d!39793 (=> (not res!62906) (not e!85133))))

(assert (=> d!39793 (= res!62906 (bvslt #b00000000000000000000000000000000 (size!2497 (_keys!4563 (_2!1295 lt!67144)))))))

(assert (=> d!39793 (= lt!67849 e!85134)))

(declare-fun c!24111 () Bool)

(assert (=> d!39793 (= c!24111 (and (not (= (bvand (extraKeys!2596 (_2!1295 lt!67144)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2596 (_2!1295 lt!67144)) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!39793 (validMask!0 (mask!7100 (_2!1295 lt!67144)))))

(assert (=> d!39793 (= (getCurrentListMap!515 (_keys!4563 (_2!1295 lt!67144)) (_values!2806 (_2!1295 lt!67144)) (mask!7100 (_2!1295 lt!67144)) (extraKeys!2596 (_2!1295 lt!67144)) (zeroValue!2682 (_2!1295 lt!67144)) (minValue!2682 (_2!1295 lt!67144)) #b00000000000000000000000000000000 (defaultEntry!2823 (_2!1295 lt!67144))) lt!67863)))

(declare-fun bm!14200 () Bool)

(assert (=> bm!14200 (= call!14200 (contains!876 lt!67863 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!130551 () Bool)

(assert (=> b!130551 (= e!85134 e!85138)))

(declare-fun c!24109 () Bool)

(assert (=> b!130551 (= c!24109 (and (not (= (bvand (extraKeys!2596 (_2!1295 lt!67144)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2596 (_2!1295 lt!67144)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!14201 () Bool)

(assert (=> bm!14201 (= call!14199 (+!160 (ite c!24111 call!14202 (ite c!24109 call!14203 call!14204)) (ite (or c!24111 c!24109) (tuple2!2567 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2682 (_2!1295 lt!67144))) (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2682 (_2!1295 lt!67144))))))))

(declare-fun b!130552 () Bool)

(assert (=> b!130552 (= e!85129 (not call!14198))))

(assert (= (and d!39793 c!24111) b!130537))

(assert (= (and d!39793 (not c!24111)) b!130551))

(assert (= (and b!130551 c!24109) b!130544))

(assert (= (and b!130551 (not c!24109)) b!130547))

(assert (= (and b!130547 c!24110) b!130549))

(assert (= (and b!130547 (not c!24110)) b!130538))

(assert (= (or b!130549 b!130538) bm!14199))

(assert (= (or b!130544 bm!14199) bm!14195))

(assert (= (or b!130544 b!130549) bm!14198))

(assert (= (or b!130537 bm!14195) bm!14196))

(assert (= (or b!130537 bm!14198) bm!14201))

(assert (= (and d!39793 res!62906) b!130539))

(assert (= (and d!39793 c!24106) b!130545))

(assert (= (and d!39793 (not c!24106)) b!130543))

(assert (= (and d!39793 res!62908) b!130532))

(assert (= (and b!130532 res!62912) b!130546))

(assert (= (and b!130532 (not res!62907)) b!130535))

(assert (= (and b!130535 res!62909) b!130540))

(assert (= (and b!130532 res!62914) b!130548))

(assert (= (and b!130548 c!24108) b!130534))

(assert (= (and b!130548 (not c!24108)) b!130542))

(assert (= (and b!130534 res!62911) b!130533))

(assert (= (or b!130534 b!130542) bm!14200))

(assert (= (and b!130548 res!62913) b!130541))

(assert (= (and b!130541 c!24107) b!130536))

(assert (= (and b!130541 (not c!24107)) b!130552))

(assert (= (and b!130536 res!62910) b!130550))

(assert (= (or b!130536 b!130552) bm!14197))

(declare-fun b_lambda!5789 () Bool)

(assert (=> (not b_lambda!5789) (not b!130540)))

(declare-fun tb!2369 () Bool)

(declare-fun t!6107 () Bool)

(assert (=> (and b!129281 (= (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) (defaultEntry!2823 (_2!1295 lt!67144))) t!6107) tb!2369))

(declare-fun result!3921 () Bool)

(assert (=> tb!2369 (= result!3921 tp_is_empty!2857)))

(assert (=> b!130540 t!6107))

(declare-fun b_and!8077 () Bool)

(assert (= b_and!8073 (and (=> t!6107 result!3921) b_and!8077)))

(declare-fun tb!2371 () Bool)

(declare-fun t!6109 () Bool)

(assert (=> (and b!129277 (= (defaultEntry!2823 newMap!16) (defaultEntry!2823 (_2!1295 lt!67144))) t!6109) tb!2371))

(declare-fun result!3923 () Bool)

(assert (= result!3923 result!3921))

(assert (=> b!130540 t!6109))

(declare-fun b_and!8079 () Bool)

(assert (= b_and!8075 (and (=> t!6109 result!3923) b_and!8079)))

(declare-fun m!153709 () Bool)

(assert (=> bm!14197 m!153709))

(declare-fun m!153711 () Bool)

(assert (=> bm!14196 m!153711))

(assert (=> b!130546 m!153085))

(assert (=> b!130546 m!153085))

(assert (=> b!130546 m!153087))

(declare-fun m!153713 () Bool)

(assert (=> b!130537 m!153713))

(assert (=> d!39793 m!153445))

(declare-fun m!153715 () Bool)

(assert (=> b!130533 m!153715))

(assert (=> b!130539 m!153085))

(assert (=> b!130539 m!153085))

(assert (=> b!130539 m!153087))

(declare-fun m!153717 () Bool)

(assert (=> b!130550 m!153717))

(declare-fun m!153719 () Bool)

(assert (=> bm!14201 m!153719))

(declare-fun m!153721 () Bool)

(assert (=> b!130545 m!153721))

(declare-fun m!153723 () Bool)

(assert (=> b!130545 m!153723))

(declare-fun m!153725 () Bool)

(assert (=> b!130545 m!153725))

(declare-fun m!153727 () Bool)

(assert (=> b!130545 m!153727))

(declare-fun m!153729 () Bool)

(assert (=> b!130545 m!153729))

(declare-fun m!153731 () Bool)

(assert (=> b!130545 m!153731))

(assert (=> b!130545 m!153711))

(declare-fun m!153733 () Bool)

(assert (=> b!130545 m!153733))

(assert (=> b!130545 m!153085))

(declare-fun m!153735 () Bool)

(assert (=> b!130545 m!153735))

(declare-fun m!153737 () Bool)

(assert (=> b!130545 m!153737))

(declare-fun m!153739 () Bool)

(assert (=> b!130545 m!153739))

(assert (=> b!130545 m!153731))

(declare-fun m!153741 () Bool)

(assert (=> b!130545 m!153741))

(assert (=> b!130545 m!153725))

(declare-fun m!153743 () Bool)

(assert (=> b!130545 m!153743))

(declare-fun m!153745 () Bool)

(assert (=> b!130545 m!153745))

(declare-fun m!153747 () Bool)

(assert (=> b!130545 m!153747))

(assert (=> b!130545 m!153737))

(assert (=> b!130545 m!153735))

(declare-fun m!153749 () Bool)

(assert (=> b!130545 m!153749))

(declare-fun m!153751 () Bool)

(assert (=> bm!14200 m!153751))

(assert (=> b!130535 m!153085))

(assert (=> b!130535 m!153085))

(declare-fun m!153753 () Bool)

(assert (=> b!130535 m!153753))

(assert (=> b!130540 m!153085))

(declare-fun m!153755 () Bool)

(assert (=> b!130540 m!153755))

(assert (=> b!130540 m!153085))

(declare-fun m!153757 () Bool)

(assert (=> b!130540 m!153757))

(assert (=> b!130540 m!153755))

(declare-fun m!153759 () Bool)

(assert (=> b!130540 m!153759))

(declare-fun m!153761 () Bool)

(assert (=> b!130540 m!153761))

(assert (=> b!130540 m!153759))

(assert (=> d!39375 d!39793))

(declare-fun d!39795 () Bool)

(declare-fun e!85143 () Bool)

(assert (=> d!39795 e!85143))

(declare-fun res!62915 () Bool)

(assert (=> d!39795 (=> res!62915 e!85143)))

(declare-fun lt!67872 () Bool)

(assert (=> d!39795 (= res!62915 (not lt!67872))))

(declare-fun lt!67873 () Bool)

(assert (=> d!39795 (= lt!67872 lt!67873)))

(declare-fun lt!67870 () Unit!4037)

(declare-fun e!85142 () Unit!4037)

(assert (=> d!39795 (= lt!67870 e!85142)))

(declare-fun c!24112 () Bool)

(assert (=> d!39795 (= c!24112 lt!67873)))

(assert (=> d!39795 (= lt!67873 (containsKey!171 (toList!846 lt!67261) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!39795 (= (contains!876 lt!67261 #b0000000000000000000000000000000000000000000000000000000000000000) lt!67872)))

(declare-fun b!130553 () Bool)

(declare-fun lt!67871 () Unit!4037)

(assert (=> b!130553 (= e!85142 lt!67871)))

(assert (=> b!130553 (= lt!67871 (lemmaContainsKeyImpliesGetValueByKeyDefined!120 (toList!846 lt!67261) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!130553 (isDefined!121 (getValueByKey!167 (toList!846 lt!67261) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!130554 () Bool)

(declare-fun Unit!4077 () Unit!4037)

(assert (=> b!130554 (= e!85142 Unit!4077)))

(declare-fun b!130555 () Bool)

(assert (=> b!130555 (= e!85143 (isDefined!121 (getValueByKey!167 (toList!846 lt!67261) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!39795 c!24112) b!130553))

(assert (= (and d!39795 (not c!24112)) b!130554))

(assert (= (and d!39795 (not res!62915)) b!130555))

(declare-fun m!153763 () Bool)

(assert (=> d!39795 m!153763))

(declare-fun m!153765 () Bool)

(assert (=> b!130553 m!153765))

(assert (=> b!130553 m!152649))

(assert (=> b!130553 m!152649))

(declare-fun m!153767 () Bool)

(assert (=> b!130553 m!153767))

(assert (=> b!130555 m!152649))

(assert (=> b!130555 m!152649))

(assert (=> b!130555 m!153767))

(assert (=> bm!14094 d!39795))

(declare-fun d!39797 () Bool)

(declare-fun e!85145 () Bool)

(assert (=> d!39797 e!85145))

(declare-fun res!62916 () Bool)

(assert (=> d!39797 (=> res!62916 e!85145)))

(declare-fun lt!67876 () Bool)

(assert (=> d!39797 (= res!62916 (not lt!67876))))

(declare-fun lt!67877 () Bool)

(assert (=> d!39797 (= lt!67876 lt!67877)))

(declare-fun lt!67874 () Unit!4037)

(declare-fun e!85144 () Unit!4037)

(assert (=> d!39797 (= lt!67874 e!85144)))

(declare-fun c!24113 () Bool)

(assert (=> d!39797 (= c!24113 lt!67877)))

(assert (=> d!39797 (= lt!67877 (containsKey!171 (toList!846 lt!67261) (select (arr!2230 (_keys!4563 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> d!39797 (= (contains!876 lt!67261 (select (arr!2230 (_keys!4563 newMap!16)) #b00000000000000000000000000000000)) lt!67876)))

(declare-fun b!130556 () Bool)

(declare-fun lt!67875 () Unit!4037)

(assert (=> b!130556 (= e!85144 lt!67875)))

(assert (=> b!130556 (= lt!67875 (lemmaContainsKeyImpliesGetValueByKeyDefined!120 (toList!846 lt!67261) (select (arr!2230 (_keys!4563 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!130556 (isDefined!121 (getValueByKey!167 (toList!846 lt!67261) (select (arr!2230 (_keys!4563 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!130557 () Bool)

(declare-fun Unit!4078 () Unit!4037)

(assert (=> b!130557 (= e!85144 Unit!4078)))

(declare-fun b!130558 () Bool)

(assert (=> b!130558 (= e!85145 (isDefined!121 (getValueByKey!167 (toList!846 lt!67261) (select (arr!2230 (_keys!4563 newMap!16)) #b00000000000000000000000000000000))))))

(assert (= (and d!39797 c!24113) b!130556))

(assert (= (and d!39797 (not c!24113)) b!130557))

(assert (= (and d!39797 (not res!62916)) b!130558))

(assert (=> d!39797 m!152019))

(declare-fun m!153769 () Bool)

(assert (=> d!39797 m!153769))

(assert (=> b!130556 m!152019))

(declare-fun m!153771 () Bool)

(assert (=> b!130556 m!153771))

(assert (=> b!130556 m!152019))

(declare-fun m!153773 () Bool)

(assert (=> b!130556 m!153773))

(assert (=> b!130556 m!153773))

(declare-fun m!153775 () Bool)

(assert (=> b!130556 m!153775))

(assert (=> b!130558 m!152019))

(assert (=> b!130558 m!153773))

(assert (=> b!130558 m!153773))

(assert (=> b!130558 m!153775))

(assert (=> b!129722 d!39797))

(declare-fun d!39799 () Bool)

(declare-fun res!62917 () Bool)

(declare-fun e!85146 () Bool)

(assert (=> d!39799 (=> res!62917 e!85146)))

(assert (=> d!39799 (= res!62917 (and ((_ is Cons!1697) (toList!846 call!14073)) (= (_1!1294 (h!2301 (toList!846 call!14073))) (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355))))))

(assert (=> d!39799 (= (containsKey!171 (toList!846 call!14073) (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355)) e!85146)))

(declare-fun b!130559 () Bool)

(declare-fun e!85147 () Bool)

(assert (=> b!130559 (= e!85146 e!85147)))

(declare-fun res!62918 () Bool)

(assert (=> b!130559 (=> (not res!62918) (not e!85147))))

(assert (=> b!130559 (= res!62918 (and (or (not ((_ is Cons!1697) (toList!846 call!14073))) (bvsle (_1!1294 (h!2301 (toList!846 call!14073))) (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355))) ((_ is Cons!1697) (toList!846 call!14073)) (bvslt (_1!1294 (h!2301 (toList!846 call!14073))) (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355))))))

(declare-fun b!130560 () Bool)

(assert (=> b!130560 (= e!85147 (containsKey!171 (t!6091 (toList!846 call!14073)) (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355)))))

(assert (= (and d!39799 (not res!62917)) b!130559))

(assert (= (and b!130559 res!62918) b!130560))

(assert (=> b!130560 m!151753))

(declare-fun m!153777 () Bool)

(assert (=> b!130560 m!153777))

(assert (=> d!39359 d!39799))

(declare-fun d!39801 () Bool)

(assert (=> d!39801 (= (isEmpty!407 (getValueByKey!167 (toList!846 lt!66993) (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355))) (not ((_ is Some!172) (getValueByKey!167 (toList!846 lt!66993) (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355)))))))

(assert (=> d!39437 d!39801))

(declare-fun d!39803 () Bool)

(declare-fun res!62919 () Bool)

(declare-fun e!85148 () Bool)

(assert (=> d!39803 (=> (not res!62919) (not e!85148))))

(assert (=> d!39803 (= res!62919 (simpleValid!89 (_2!1295 lt!67346)))))

(assert (=> d!39803 (= (valid!521 (_2!1295 lt!67346)) e!85148)))

(declare-fun b!130561 () Bool)

(declare-fun res!62920 () Bool)

(assert (=> b!130561 (=> (not res!62920) (not e!85148))))

(assert (=> b!130561 (= res!62920 (= (arrayCountValidKeys!0 (_keys!4563 (_2!1295 lt!67346)) #b00000000000000000000000000000000 (size!2497 (_keys!4563 (_2!1295 lt!67346)))) (_size!588 (_2!1295 lt!67346))))))

(declare-fun b!130562 () Bool)

(declare-fun res!62921 () Bool)

(assert (=> b!130562 (=> (not res!62921) (not e!85148))))

(assert (=> b!130562 (= res!62921 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4563 (_2!1295 lt!67346)) (mask!7100 (_2!1295 lt!67346))))))

(declare-fun b!130563 () Bool)

(assert (=> b!130563 (= e!85148 (arrayNoDuplicates!0 (_keys!4563 (_2!1295 lt!67346)) #b00000000000000000000000000000000 Nil!1700))))

(assert (= (and d!39803 res!62919) b!130561))

(assert (= (and b!130561 res!62920) b!130562))

(assert (= (and b!130562 res!62921) b!130563))

(declare-fun m!153779 () Bool)

(assert (=> d!39803 m!153779))

(declare-fun m!153781 () Bool)

(assert (=> b!130561 m!153781))

(declare-fun m!153783 () Bool)

(assert (=> b!130562 m!153783))

(declare-fun m!153785 () Bool)

(assert (=> b!130563 m!153785))

(assert (=> b!129791 d!39803))

(declare-fun b!130566 () Bool)

(declare-fun e!85150 () Option!173)

(assert (=> b!130566 (= e!85150 (getValueByKey!167 (t!6091 (toList!846 lt!67448)) (_1!1294 (ite (or c!23815 c!23813) (tuple2!2567 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2682 (v!3153 (underlying!442 thiss!992)))) (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2682 (v!3153 (underlying!442 thiss!992))))))))))

(declare-fun b!130564 () Bool)

(declare-fun e!85149 () Option!173)

(assert (=> b!130564 (= e!85149 (Some!172 (_2!1294 (h!2301 (toList!846 lt!67448)))))))

(declare-fun c!24114 () Bool)

(declare-fun d!39805 () Bool)

(assert (=> d!39805 (= c!24114 (and ((_ is Cons!1697) (toList!846 lt!67448)) (= (_1!1294 (h!2301 (toList!846 lt!67448))) (_1!1294 (ite (or c!23815 c!23813) (tuple2!2567 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2682 (v!3153 (underlying!442 thiss!992)))) (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2682 (v!3153 (underlying!442 thiss!992)))))))))))

(assert (=> d!39805 (= (getValueByKey!167 (toList!846 lt!67448) (_1!1294 (ite (or c!23815 c!23813) (tuple2!2567 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2682 (v!3153 (underlying!442 thiss!992)))) (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2682 (v!3153 (underlying!442 thiss!992))))))) e!85149)))

(declare-fun b!130565 () Bool)

(assert (=> b!130565 (= e!85149 e!85150)))

(declare-fun c!24115 () Bool)

(assert (=> b!130565 (= c!24115 (and ((_ is Cons!1697) (toList!846 lt!67448)) (not (= (_1!1294 (h!2301 (toList!846 lt!67448))) (_1!1294 (ite (or c!23815 c!23813) (tuple2!2567 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2682 (v!3153 (underlying!442 thiss!992)))) (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2682 (v!3153 (underlying!442 thiss!992))))))))))))

(declare-fun b!130567 () Bool)

(assert (=> b!130567 (= e!85150 None!171)))

(assert (= (and d!39805 c!24114) b!130564))

(assert (= (and d!39805 (not c!24114)) b!130565))

(assert (= (and b!130565 c!24115) b!130566))

(assert (= (and b!130565 (not c!24115)) b!130567))

(declare-fun m!153787 () Bool)

(assert (=> b!130566 m!153787))

(assert (=> b!129895 d!39805))

(declare-fun e!85152 () Option!173)

(declare-fun b!130570 () Bool)

(assert (=> b!130570 (= e!85152 (getValueByKey!167 (t!6091 (toList!846 lt!67408)) (_1!1294 (tuple2!2567 lt!67060 (minValue!2682 (v!3153 (underlying!442 thiss!992)))))))))

(declare-fun b!130568 () Bool)

(declare-fun e!85151 () Option!173)

(assert (=> b!130568 (= e!85151 (Some!172 (_2!1294 (h!2301 (toList!846 lt!67408)))))))

(declare-fun c!24116 () Bool)

(declare-fun d!39807 () Bool)

(assert (=> d!39807 (= c!24116 (and ((_ is Cons!1697) (toList!846 lt!67408)) (= (_1!1294 (h!2301 (toList!846 lt!67408))) (_1!1294 (tuple2!2567 lt!67060 (minValue!2682 (v!3153 (underlying!442 thiss!992))))))))))

(assert (=> d!39807 (= (getValueByKey!167 (toList!846 lt!67408) (_1!1294 (tuple2!2567 lt!67060 (minValue!2682 (v!3153 (underlying!442 thiss!992)))))) e!85151)))

(declare-fun b!130569 () Bool)

(assert (=> b!130569 (= e!85151 e!85152)))

(declare-fun c!24117 () Bool)

(assert (=> b!130569 (= c!24117 (and ((_ is Cons!1697) (toList!846 lt!67408)) (not (= (_1!1294 (h!2301 (toList!846 lt!67408))) (_1!1294 (tuple2!2567 lt!67060 (minValue!2682 (v!3153 (underlying!442 thiss!992)))))))))))

(declare-fun b!130571 () Bool)

(assert (=> b!130571 (= e!85152 None!171)))

(assert (= (and d!39807 c!24116) b!130568))

(assert (= (and d!39807 (not c!24116)) b!130569))

(assert (= (and b!130569 c!24117) b!130570))

(assert (= (and b!130569 (not c!24117)) b!130571))

(declare-fun m!153789 () Bool)

(assert (=> b!130570 m!153789))

(assert (=> b!129836 d!39807))

(assert (=> d!39377 d!39451))

(assert (=> b!129726 d!39465))

(declare-fun d!39809 () Bool)

(declare-fun e!85154 () Bool)

(assert (=> d!39809 e!85154))

(declare-fun res!62922 () Bool)

(assert (=> d!39809 (=> res!62922 e!85154)))

(declare-fun lt!67880 () Bool)

(assert (=> d!39809 (= res!62922 (not lt!67880))))

(declare-fun lt!67881 () Bool)

(assert (=> d!39809 (= lt!67880 lt!67881)))

(declare-fun lt!67878 () Unit!4037)

(declare-fun e!85153 () Unit!4037)

(assert (=> d!39809 (= lt!67878 e!85153)))

(declare-fun c!24118 () Bool)

(assert (=> d!39809 (= c!24118 lt!67881)))

(assert (=> d!39809 (= lt!67881 (containsKey!171 (toList!846 lt!67404) (_1!1294 (tuple2!2567 lt!67073 (zeroValue!2682 (v!3153 (underlying!442 thiss!992)))))))))

(assert (=> d!39809 (= (contains!876 lt!67404 (_1!1294 (tuple2!2567 lt!67073 (zeroValue!2682 (v!3153 (underlying!442 thiss!992)))))) lt!67880)))

(declare-fun b!130572 () Bool)

(declare-fun lt!67879 () Unit!4037)

(assert (=> b!130572 (= e!85153 lt!67879)))

(assert (=> b!130572 (= lt!67879 (lemmaContainsKeyImpliesGetValueByKeyDefined!120 (toList!846 lt!67404) (_1!1294 (tuple2!2567 lt!67073 (zeroValue!2682 (v!3153 (underlying!442 thiss!992)))))))))

(assert (=> b!130572 (isDefined!121 (getValueByKey!167 (toList!846 lt!67404) (_1!1294 (tuple2!2567 lt!67073 (zeroValue!2682 (v!3153 (underlying!442 thiss!992)))))))))

(declare-fun b!130573 () Bool)

(declare-fun Unit!4079 () Unit!4037)

(assert (=> b!130573 (= e!85153 Unit!4079)))

(declare-fun b!130574 () Bool)

(assert (=> b!130574 (= e!85154 (isDefined!121 (getValueByKey!167 (toList!846 lt!67404) (_1!1294 (tuple2!2567 lt!67073 (zeroValue!2682 (v!3153 (underlying!442 thiss!992))))))))))

(assert (= (and d!39809 c!24118) b!130572))

(assert (= (and d!39809 (not c!24118)) b!130573))

(assert (= (and d!39809 (not res!62922)) b!130574))

(declare-fun m!153791 () Bool)

(assert (=> d!39809 m!153791))

(declare-fun m!153793 () Bool)

(assert (=> b!130572 m!153793))

(assert (=> b!130572 m!152361))

(assert (=> b!130572 m!152361))

(declare-fun m!153795 () Bool)

(assert (=> b!130572 m!153795))

(assert (=> b!130574 m!152361))

(assert (=> b!130574 m!152361))

(assert (=> b!130574 m!153795))

(assert (=> d!39391 d!39809))

(declare-fun e!85156 () Option!173)

(declare-fun b!130577 () Bool)

(assert (=> b!130577 (= e!85156 (getValueByKey!167 (t!6091 lt!67401) (_1!1294 (tuple2!2567 lt!67073 (zeroValue!2682 (v!3153 (underlying!442 thiss!992)))))))))

(declare-fun b!130575 () Bool)

(declare-fun e!85155 () Option!173)

(assert (=> b!130575 (= e!85155 (Some!172 (_2!1294 (h!2301 lt!67401))))))

(declare-fun c!24119 () Bool)

(declare-fun d!39811 () Bool)

(assert (=> d!39811 (= c!24119 (and ((_ is Cons!1697) lt!67401) (= (_1!1294 (h!2301 lt!67401)) (_1!1294 (tuple2!2567 lt!67073 (zeroValue!2682 (v!3153 (underlying!442 thiss!992))))))))))

(assert (=> d!39811 (= (getValueByKey!167 lt!67401 (_1!1294 (tuple2!2567 lt!67073 (zeroValue!2682 (v!3153 (underlying!442 thiss!992)))))) e!85155)))

(declare-fun b!130576 () Bool)

(assert (=> b!130576 (= e!85155 e!85156)))

(declare-fun c!24120 () Bool)

(assert (=> b!130576 (= c!24120 (and ((_ is Cons!1697) lt!67401) (not (= (_1!1294 (h!2301 lt!67401)) (_1!1294 (tuple2!2567 lt!67073 (zeroValue!2682 (v!3153 (underlying!442 thiss!992)))))))))))

(declare-fun b!130578 () Bool)

(assert (=> b!130578 (= e!85156 None!171)))

(assert (= (and d!39811 c!24119) b!130575))

(assert (= (and d!39811 (not c!24119)) b!130576))

(assert (= (and b!130576 c!24120) b!130577))

(assert (= (and b!130576 (not c!24120)) b!130578))

(declare-fun m!153797 () Bool)

(assert (=> b!130577 m!153797))

(assert (=> d!39391 d!39811))

(declare-fun d!39813 () Bool)

(assert (=> d!39813 (= (getValueByKey!167 lt!67401 (_1!1294 (tuple2!2567 lt!67073 (zeroValue!2682 (v!3153 (underlying!442 thiss!992)))))) (Some!172 (_2!1294 (tuple2!2567 lt!67073 (zeroValue!2682 (v!3153 (underlying!442 thiss!992)))))))))

(declare-fun lt!67882 () Unit!4037)

(assert (=> d!39813 (= lt!67882 (choose!802 lt!67401 (_1!1294 (tuple2!2567 lt!67073 (zeroValue!2682 (v!3153 (underlying!442 thiss!992))))) (_2!1294 (tuple2!2567 lt!67073 (zeroValue!2682 (v!3153 (underlying!442 thiss!992)))))))))

(declare-fun e!85157 () Bool)

(assert (=> d!39813 e!85157))

(declare-fun res!62923 () Bool)

(assert (=> d!39813 (=> (not res!62923) (not e!85157))))

(assert (=> d!39813 (= res!62923 (isStrictlySorted!314 lt!67401))))

(assert (=> d!39813 (= (lemmaContainsTupThenGetReturnValue!85 lt!67401 (_1!1294 (tuple2!2567 lt!67073 (zeroValue!2682 (v!3153 (underlying!442 thiss!992))))) (_2!1294 (tuple2!2567 lt!67073 (zeroValue!2682 (v!3153 (underlying!442 thiss!992)))))) lt!67882)))

(declare-fun b!130579 () Bool)

(declare-fun res!62924 () Bool)

(assert (=> b!130579 (=> (not res!62924) (not e!85157))))

(assert (=> b!130579 (= res!62924 (containsKey!171 lt!67401 (_1!1294 (tuple2!2567 lt!67073 (zeroValue!2682 (v!3153 (underlying!442 thiss!992)))))))))

(declare-fun b!130580 () Bool)

(assert (=> b!130580 (= e!85157 (contains!878 lt!67401 (tuple2!2567 (_1!1294 (tuple2!2567 lt!67073 (zeroValue!2682 (v!3153 (underlying!442 thiss!992))))) (_2!1294 (tuple2!2567 lt!67073 (zeroValue!2682 (v!3153 (underlying!442 thiss!992))))))))))

(assert (= (and d!39813 res!62923) b!130579))

(assert (= (and b!130579 res!62924) b!130580))

(assert (=> d!39813 m!152355))

(declare-fun m!153799 () Bool)

(assert (=> d!39813 m!153799))

(declare-fun m!153801 () Bool)

(assert (=> d!39813 m!153801))

(declare-fun m!153803 () Bool)

(assert (=> b!130579 m!153803))

(declare-fun m!153805 () Bool)

(assert (=> b!130580 m!153805))

(assert (=> d!39391 d!39813))

(declare-fun bm!14202 () Bool)

(declare-fun call!14205 () List!1701)

(declare-fun call!14207 () List!1701)

(assert (=> bm!14202 (= call!14205 call!14207)))

(declare-fun b!130581 () Bool)

(declare-fun e!85158 () List!1701)

(declare-fun call!14206 () List!1701)

(assert (=> b!130581 (= e!85158 call!14206)))

(declare-fun c!24122 () Bool)

(declare-fun e!85162 () List!1701)

(declare-fun bm!14203 () Bool)

(assert (=> bm!14203 (= call!14206 ($colon$colon!90 e!85162 (ite c!24122 (h!2301 (toList!846 lt!67061)) (tuple2!2567 (_1!1294 (tuple2!2567 lt!67073 (zeroValue!2682 (v!3153 (underlying!442 thiss!992))))) (_2!1294 (tuple2!2567 lt!67073 (zeroValue!2682 (v!3153 (underlying!442 thiss!992)))))))))))

(declare-fun c!24124 () Bool)

(assert (=> bm!14203 (= c!24124 c!24122)))

(declare-fun d!39815 () Bool)

(declare-fun e!85160 () Bool)

(assert (=> d!39815 e!85160))

(declare-fun res!62926 () Bool)

(assert (=> d!39815 (=> (not res!62926) (not e!85160))))

(declare-fun lt!67883 () List!1701)

(assert (=> d!39815 (= res!62926 (isStrictlySorted!314 lt!67883))))

(assert (=> d!39815 (= lt!67883 e!85158)))

(assert (=> d!39815 (= c!24122 (and ((_ is Cons!1697) (toList!846 lt!67061)) (bvslt (_1!1294 (h!2301 (toList!846 lt!67061))) (_1!1294 (tuple2!2567 lt!67073 (zeroValue!2682 (v!3153 (underlying!442 thiss!992))))))))))

(assert (=> d!39815 (isStrictlySorted!314 (toList!846 lt!67061))))

(assert (=> d!39815 (= (insertStrictlySorted!88 (toList!846 lt!67061) (_1!1294 (tuple2!2567 lt!67073 (zeroValue!2682 (v!3153 (underlying!442 thiss!992))))) (_2!1294 (tuple2!2567 lt!67073 (zeroValue!2682 (v!3153 (underlying!442 thiss!992)))))) lt!67883)))

(declare-fun b!130582 () Bool)

(declare-fun e!85161 () List!1701)

(assert (=> b!130582 (= e!85161 call!14205)))

(declare-fun b!130583 () Bool)

(declare-fun c!24123 () Bool)

(declare-fun c!24121 () Bool)

(assert (=> b!130583 (= e!85162 (ite c!24123 (t!6091 (toList!846 lt!67061)) (ite c!24121 (Cons!1697 (h!2301 (toList!846 lt!67061)) (t!6091 (toList!846 lt!67061))) Nil!1698)))))

(declare-fun b!130584 () Bool)

(assert (=> b!130584 (= e!85162 (insertStrictlySorted!88 (t!6091 (toList!846 lt!67061)) (_1!1294 (tuple2!2567 lt!67073 (zeroValue!2682 (v!3153 (underlying!442 thiss!992))))) (_2!1294 (tuple2!2567 lt!67073 (zeroValue!2682 (v!3153 (underlying!442 thiss!992)))))))))

(declare-fun bm!14204 () Bool)

(assert (=> bm!14204 (= call!14207 call!14206)))

(declare-fun b!130585 () Bool)

(declare-fun e!85159 () List!1701)

(assert (=> b!130585 (= e!85159 call!14207)))

(declare-fun b!130586 () Bool)

(assert (=> b!130586 (= c!24121 (and ((_ is Cons!1697) (toList!846 lt!67061)) (bvsgt (_1!1294 (h!2301 (toList!846 lt!67061))) (_1!1294 (tuple2!2567 lt!67073 (zeroValue!2682 (v!3153 (underlying!442 thiss!992))))))))))

(assert (=> b!130586 (= e!85159 e!85161)))

(declare-fun b!130587 () Bool)

(assert (=> b!130587 (= e!85160 (contains!878 lt!67883 (tuple2!2567 (_1!1294 (tuple2!2567 lt!67073 (zeroValue!2682 (v!3153 (underlying!442 thiss!992))))) (_2!1294 (tuple2!2567 lt!67073 (zeroValue!2682 (v!3153 (underlying!442 thiss!992))))))))))

(declare-fun b!130588 () Bool)

(assert (=> b!130588 (= e!85161 call!14205)))

(declare-fun b!130589 () Bool)

(declare-fun res!62925 () Bool)

(assert (=> b!130589 (=> (not res!62925) (not e!85160))))

(assert (=> b!130589 (= res!62925 (containsKey!171 lt!67883 (_1!1294 (tuple2!2567 lt!67073 (zeroValue!2682 (v!3153 (underlying!442 thiss!992)))))))))

(declare-fun b!130590 () Bool)

(assert (=> b!130590 (= e!85158 e!85159)))

(assert (=> b!130590 (= c!24123 (and ((_ is Cons!1697) (toList!846 lt!67061)) (= (_1!1294 (h!2301 (toList!846 lt!67061))) (_1!1294 (tuple2!2567 lt!67073 (zeroValue!2682 (v!3153 (underlying!442 thiss!992))))))))))

(assert (= (and d!39815 c!24122) b!130581))

(assert (= (and d!39815 (not c!24122)) b!130590))

(assert (= (and b!130590 c!24123) b!130585))

(assert (= (and b!130590 (not c!24123)) b!130586))

(assert (= (and b!130586 c!24121) b!130588))

(assert (= (and b!130586 (not c!24121)) b!130582))

(assert (= (or b!130588 b!130582) bm!14202))

(assert (= (or b!130585 bm!14202) bm!14204))

(assert (= (or b!130581 bm!14204) bm!14203))

(assert (= (and bm!14203 c!24124) b!130584))

(assert (= (and bm!14203 (not c!24124)) b!130583))

(assert (= (and d!39815 res!62926) b!130589))

(assert (= (and b!130589 res!62925) b!130587))

(declare-fun m!153807 () Bool)

(assert (=> b!130589 m!153807))

(declare-fun m!153809 () Bool)

(assert (=> bm!14203 m!153809))

(declare-fun m!153811 () Bool)

(assert (=> b!130584 m!153811))

(declare-fun m!153813 () Bool)

(assert (=> d!39815 m!153813))

(declare-fun m!153815 () Bool)

(assert (=> d!39815 m!153815))

(declare-fun m!153817 () Bool)

(assert (=> b!130587 m!153817))

(assert (=> d!39391 d!39815))

(declare-fun lt!67884 () Bool)

(declare-fun d!39817 () Bool)

(assert (=> d!39817 (= lt!67884 (select (content!129 (toList!846 lt!67418)) (tuple2!2567 lt!67056 (minValue!2682 (v!3153 (underlying!442 thiss!992))))))))

(declare-fun e!85163 () Bool)

(assert (=> d!39817 (= lt!67884 e!85163)))

(declare-fun res!62928 () Bool)

(assert (=> d!39817 (=> (not res!62928) (not e!85163))))

(assert (=> d!39817 (= res!62928 ((_ is Cons!1697) (toList!846 lt!67418)))))

(assert (=> d!39817 (= (contains!878 (toList!846 lt!67418) (tuple2!2567 lt!67056 (minValue!2682 (v!3153 (underlying!442 thiss!992))))) lt!67884)))

(declare-fun b!130591 () Bool)

(declare-fun e!85164 () Bool)

(assert (=> b!130591 (= e!85163 e!85164)))

(declare-fun res!62927 () Bool)

(assert (=> b!130591 (=> res!62927 e!85164)))

(assert (=> b!130591 (= res!62927 (= (h!2301 (toList!846 lt!67418)) (tuple2!2567 lt!67056 (minValue!2682 (v!3153 (underlying!442 thiss!992))))))))

(declare-fun b!130592 () Bool)

(assert (=> b!130592 (= e!85164 (contains!878 (t!6091 (toList!846 lt!67418)) (tuple2!2567 lt!67056 (minValue!2682 (v!3153 (underlying!442 thiss!992))))))))

(assert (= (and d!39817 res!62928) b!130591))

(assert (= (and b!130591 (not res!62927)) b!130592))

(declare-fun m!153819 () Bool)

(assert (=> d!39817 m!153819))

(declare-fun m!153821 () Bool)

(assert (=> d!39817 m!153821))

(declare-fun m!153823 () Bool)

(assert (=> b!130592 m!153823))

(assert (=> b!129843 d!39817))

(assert (=> d!39407 d!39387))

(assert (=> d!39407 d!39391))

(declare-fun d!39819 () Bool)

(assert (=> d!39819 (contains!876 (+!160 lt!67061 (tuple2!2567 lt!67073 (zeroValue!2682 (v!3153 (underlying!442 thiss!992))))) lt!67063)))

(assert (=> d!39819 true))

(declare-fun _$35!378 () Unit!4037)

(assert (=> d!39819 (= (choose!797 lt!67061 lt!67073 (zeroValue!2682 (v!3153 (underlying!442 thiss!992))) lt!67063) _$35!378)))

(declare-fun bs!5417 () Bool)

(assert (= bs!5417 d!39819))

(assert (=> bs!5417 m!151877))

(assert (=> bs!5417 m!151877))

(assert (=> bs!5417 m!151887))

(assert (=> d!39407 d!39819))

(declare-fun d!39821 () Bool)

(declare-fun e!85166 () Bool)

(assert (=> d!39821 e!85166))

(declare-fun res!62929 () Bool)

(assert (=> d!39821 (=> res!62929 e!85166)))

(declare-fun lt!67887 () Bool)

(assert (=> d!39821 (= res!62929 (not lt!67887))))

(declare-fun lt!67888 () Bool)

(assert (=> d!39821 (= lt!67887 lt!67888)))

(declare-fun lt!67885 () Unit!4037)

(declare-fun e!85165 () Unit!4037)

(assert (=> d!39821 (= lt!67885 e!85165)))

(declare-fun c!24125 () Bool)

(assert (=> d!39821 (= c!24125 lt!67888)))

(assert (=> d!39821 (= lt!67888 (containsKey!171 (toList!846 lt!67061) lt!67063))))

(assert (=> d!39821 (= (contains!876 lt!67061 lt!67063) lt!67887)))

(declare-fun b!130594 () Bool)

(declare-fun lt!67886 () Unit!4037)

(assert (=> b!130594 (= e!85165 lt!67886)))

(assert (=> b!130594 (= lt!67886 (lemmaContainsKeyImpliesGetValueByKeyDefined!120 (toList!846 lt!67061) lt!67063))))

(assert (=> b!130594 (isDefined!121 (getValueByKey!167 (toList!846 lt!67061) lt!67063))))

(declare-fun b!130595 () Bool)

(declare-fun Unit!4080 () Unit!4037)

(assert (=> b!130595 (= e!85165 Unit!4080)))

(declare-fun b!130596 () Bool)

(assert (=> b!130596 (= e!85166 (isDefined!121 (getValueByKey!167 (toList!846 lt!67061) lt!67063)))))

(assert (= (and d!39821 c!24125) b!130594))

(assert (= (and d!39821 (not c!24125)) b!130595))

(assert (= (and d!39821 (not res!62929)) b!130596))

(declare-fun m!153825 () Bool)

(assert (=> d!39821 m!153825))

(declare-fun m!153827 () Bool)

(assert (=> b!130594 m!153827))

(declare-fun m!153829 () Bool)

(assert (=> b!130594 m!153829))

(assert (=> b!130594 m!153829))

(declare-fun m!153831 () Bool)

(assert (=> b!130594 m!153831))

(assert (=> b!130596 m!153829))

(assert (=> b!130596 m!153829))

(assert (=> b!130596 m!153831))

(assert (=> d!39407 d!39821))

(assert (=> d!39399 d!39403))

(assert (=> d!39399 d!39379))

(declare-fun d!39823 () Bool)

(assert (=> d!39823 (= (apply!113 (+!160 lt!67074 (tuple2!2567 lt!67056 (minValue!2682 (v!3153 (underlying!442 thiss!992))))) lt!67066) (apply!113 lt!67074 lt!67066))))

(assert (=> d!39823 true))

(declare-fun _$34!966 () Unit!4037)

(assert (=> d!39823 (= (choose!796 lt!67074 lt!67056 (minValue!2682 (v!3153 (underlying!442 thiss!992))) lt!67066) _$34!966)))

(declare-fun bs!5418 () Bool)

(assert (= bs!5418 d!39823))

(assert (=> bs!5418 m!151881))

(assert (=> bs!5418 m!151881))

(assert (=> bs!5418 m!151895))

(assert (=> bs!5418 m!151867))

(assert (=> d!39399 d!39823))

(assert (=> d!39399 d!39385))

(declare-fun d!39825 () Bool)

(declare-fun e!85168 () Bool)

(assert (=> d!39825 e!85168))

(declare-fun res!62930 () Bool)

(assert (=> d!39825 (=> res!62930 e!85168)))

(declare-fun lt!67891 () Bool)

(assert (=> d!39825 (= res!62930 (not lt!67891))))

(declare-fun lt!67892 () Bool)

(assert (=> d!39825 (= lt!67891 lt!67892)))

(declare-fun lt!67889 () Unit!4037)

(declare-fun e!85167 () Unit!4037)

(assert (=> d!39825 (= lt!67889 e!85167)))

(declare-fun c!24126 () Bool)

(assert (=> d!39825 (= c!24126 lt!67892)))

(assert (=> d!39825 (= lt!67892 (containsKey!171 (toList!846 lt!67074) lt!67066))))

(assert (=> d!39825 (= (contains!876 lt!67074 lt!67066) lt!67891)))

(declare-fun b!130598 () Bool)

(declare-fun lt!67890 () Unit!4037)

(assert (=> b!130598 (= e!85167 lt!67890)))

(assert (=> b!130598 (= lt!67890 (lemmaContainsKeyImpliesGetValueByKeyDefined!120 (toList!846 lt!67074) lt!67066))))

(assert (=> b!130598 (isDefined!121 (getValueByKey!167 (toList!846 lt!67074) lt!67066))))

(declare-fun b!130599 () Bool)

(declare-fun Unit!4081 () Unit!4037)

(assert (=> b!130599 (= e!85167 Unit!4081)))

(declare-fun b!130600 () Bool)

(assert (=> b!130600 (= e!85168 (isDefined!121 (getValueByKey!167 (toList!846 lt!67074) lt!67066)))))

(assert (= (and d!39825 c!24126) b!130598))

(assert (= (and d!39825 (not c!24126)) b!130599))

(assert (= (and d!39825 (not res!62930)) b!130600))

(declare-fun m!153833 () Bool)

(assert (=> d!39825 m!153833))

(declare-fun m!153835 () Bool)

(assert (=> b!130598 m!153835))

(assert (=> b!130598 m!152337))

(assert (=> b!130598 m!152337))

(declare-fun m!153837 () Bool)

(assert (=> b!130598 m!153837))

(assert (=> b!130600 m!152337))

(assert (=> b!130600 m!152337))

(assert (=> b!130600 m!153837))

(assert (=> d!39399 d!39825))

(assert (=> bm!14109 d!39751))

(assert (=> b!129938 d!39465))

(declare-fun d!39827 () Bool)

(assert (=> d!39827 (isDefined!121 (getValueByKey!167 (toList!846 call!14073) (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355)))))

(declare-fun lt!67893 () Unit!4037)

(assert (=> d!39827 (= lt!67893 (choose!801 (toList!846 call!14073) (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355)))))

(declare-fun e!85169 () Bool)

(assert (=> d!39827 e!85169))

(declare-fun res!62931 () Bool)

(assert (=> d!39827 (=> (not res!62931) (not e!85169))))

(assert (=> d!39827 (= res!62931 (isStrictlySorted!314 (toList!846 call!14073)))))

(assert (=> d!39827 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!120 (toList!846 call!14073) (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355)) lt!67893)))

(declare-fun b!130601 () Bool)

(assert (=> b!130601 (= e!85169 (containsKey!171 (toList!846 call!14073) (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355)))))

(assert (= (and d!39827 res!62931) b!130601))

(assert (=> d!39827 m!151753))

(assert (=> d!39827 m!152185))

(assert (=> d!39827 m!152185))

(assert (=> d!39827 m!152187))

(assert (=> d!39827 m!151753))

(declare-fun m!153839 () Bool)

(assert (=> d!39827 m!153839))

(declare-fun m!153841 () Bool)

(assert (=> d!39827 m!153841))

(assert (=> b!130601 m!151753))

(assert (=> b!130601 m!152181))

(assert (=> b!129740 d!39827))

(assert (=> b!129740 d!39607))

(assert (=> b!129740 d!39609))

(declare-fun d!39829 () Bool)

(declare-fun e!85171 () Bool)

(assert (=> d!39829 e!85171))

(declare-fun res!62932 () Bool)

(assert (=> d!39829 (=> res!62932 e!85171)))

(declare-fun lt!67896 () Bool)

(assert (=> d!39829 (= res!62932 (not lt!67896))))

(declare-fun lt!67897 () Bool)

(assert (=> d!39829 (= lt!67896 lt!67897)))

(declare-fun lt!67894 () Unit!4037)

(declare-fun e!85170 () Unit!4037)

(assert (=> d!39829 (= lt!67894 e!85170)))

(declare-fun c!24127 () Bool)

(assert (=> d!39829 (= c!24127 lt!67897)))

(assert (=> d!39829 (= lt!67897 (containsKey!171 (toList!846 lt!67211) (select (arr!2230 (_keys!4563 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> d!39829 (= (contains!876 lt!67211 (select (arr!2230 (_keys!4563 newMap!16)) #b00000000000000000000000000000000)) lt!67896)))

(declare-fun b!130602 () Bool)

(declare-fun lt!67895 () Unit!4037)

(assert (=> b!130602 (= e!85170 lt!67895)))

(assert (=> b!130602 (= lt!67895 (lemmaContainsKeyImpliesGetValueByKeyDefined!120 (toList!846 lt!67211) (select (arr!2230 (_keys!4563 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!130602 (isDefined!121 (getValueByKey!167 (toList!846 lt!67211) (select (arr!2230 (_keys!4563 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!130603 () Bool)

(declare-fun Unit!4082 () Unit!4037)

(assert (=> b!130603 (= e!85170 Unit!4082)))

(declare-fun b!130604 () Bool)

(assert (=> b!130604 (= e!85171 (isDefined!121 (getValueByKey!167 (toList!846 lt!67211) (select (arr!2230 (_keys!4563 newMap!16)) #b00000000000000000000000000000000))))))

(assert (= (and d!39829 c!24127) b!130602))

(assert (= (and d!39829 (not c!24127)) b!130603))

(assert (= (and d!39829 (not res!62932)) b!130604))

(assert (=> d!39829 m!152019))

(declare-fun m!153843 () Bool)

(assert (=> d!39829 m!153843))

(assert (=> b!130602 m!152019))

(declare-fun m!153845 () Bool)

(assert (=> b!130602 m!153845))

(assert (=> b!130602 m!152019))

(assert (=> b!130602 m!153693))

(assert (=> b!130602 m!153693))

(declare-fun m!153847 () Bool)

(assert (=> b!130602 m!153847))

(assert (=> b!130604 m!152019))

(assert (=> b!130604 m!153693))

(assert (=> b!130604 m!153693))

(assert (=> b!130604 m!153847))

(assert (=> b!129667 d!39829))

(declare-fun d!39831 () Bool)

(declare-fun e!85173 () Bool)

(assert (=> d!39831 e!85173))

(declare-fun res!62933 () Bool)

(assert (=> d!39831 (=> res!62933 e!85173)))

(declare-fun lt!67900 () Bool)

(assert (=> d!39831 (= res!62933 (not lt!67900))))

(declare-fun lt!67901 () Bool)

(assert (=> d!39831 (= lt!67900 lt!67901)))

(declare-fun lt!67898 () Unit!4037)

(declare-fun e!85172 () Unit!4037)

(assert (=> d!39831 (= lt!67898 e!85172)))

(declare-fun c!24128 () Bool)

(assert (=> d!39831 (= c!24128 lt!67901)))

(assert (=> d!39831 (= lt!67901 (containsKey!171 (toList!846 lt!67185) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!39831 (= (contains!876 lt!67185 #b0000000000000000000000000000000000000000000000000000000000000000) lt!67900)))

(declare-fun b!130605 () Bool)

(declare-fun lt!67899 () Unit!4037)

(assert (=> b!130605 (= e!85172 lt!67899)))

(assert (=> b!130605 (= lt!67899 (lemmaContainsKeyImpliesGetValueByKeyDefined!120 (toList!846 lt!67185) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!130605 (isDefined!121 (getValueByKey!167 (toList!846 lt!67185) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!130606 () Bool)

(declare-fun Unit!4083 () Unit!4037)

(assert (=> b!130606 (= e!85172 Unit!4083)))

(declare-fun b!130607 () Bool)

(assert (=> b!130607 (= e!85173 (isDefined!121 (getValueByKey!167 (toList!846 lt!67185) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!39831 c!24128) b!130605))

(assert (= (and d!39831 (not c!24128)) b!130606))

(assert (= (and d!39831 (not res!62933)) b!130607))

(declare-fun m!153849 () Bool)

(assert (=> d!39831 m!153849))

(declare-fun m!153851 () Bool)

(assert (=> b!130605 m!153851))

(declare-fun m!153853 () Bool)

(assert (=> b!130605 m!153853))

(assert (=> b!130605 m!153853))

(declare-fun m!153855 () Bool)

(assert (=> b!130605 m!153855))

(assert (=> b!130607 m!153853))

(assert (=> b!130607 m!153853))

(assert (=> b!130607 m!153855))

(assert (=> d!39335 d!39831))

(assert (=> d!39335 d!39311))

(declare-fun d!39833 () Bool)

(declare-fun e!85175 () Bool)

(assert (=> d!39833 e!85175))

(declare-fun res!62934 () Bool)

(assert (=> d!39833 (=> res!62934 e!85175)))

(declare-fun lt!67904 () Bool)

(assert (=> d!39833 (= res!62934 (not lt!67904))))

(declare-fun lt!67905 () Bool)

(assert (=> d!39833 (= lt!67904 lt!67905)))

(declare-fun lt!67902 () Unit!4037)

(declare-fun e!85174 () Unit!4037)

(assert (=> d!39833 (= lt!67902 e!85174)))

(declare-fun c!24129 () Bool)

(assert (=> d!39833 (= c!24129 lt!67905)))

(assert (=> d!39833 (= lt!67905 (containsKey!171 (toList!846 lt!67211) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!39833 (= (contains!876 lt!67211 #b0000000000000000000000000000000000000000000000000000000000000000) lt!67904)))

(declare-fun b!130608 () Bool)

(declare-fun lt!67903 () Unit!4037)

(assert (=> b!130608 (= e!85174 lt!67903)))

(assert (=> b!130608 (= lt!67903 (lemmaContainsKeyImpliesGetValueByKeyDefined!120 (toList!846 lt!67211) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!130608 (isDefined!121 (getValueByKey!167 (toList!846 lt!67211) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!130609 () Bool)

(declare-fun Unit!4084 () Unit!4037)

(assert (=> b!130609 (= e!85174 Unit!4084)))

(declare-fun b!130610 () Bool)

(assert (=> b!130610 (= e!85175 (isDefined!121 (getValueByKey!167 (toList!846 lt!67211) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!39833 c!24129) b!130608))

(assert (= (and d!39833 (not c!24129)) b!130609))

(assert (= (and d!39833 (not res!62934)) b!130610))

(declare-fun m!153857 () Bool)

(assert (=> d!39833 m!153857))

(declare-fun m!153859 () Bool)

(assert (=> b!130608 m!153859))

(assert (=> b!130608 m!153037))

(assert (=> b!130608 m!153037))

(declare-fun m!153861 () Bool)

(assert (=> b!130608 m!153861))

(assert (=> b!130610 m!153037))

(assert (=> b!130610 m!153037))

(assert (=> b!130610 m!153861))

(assert (=> bm!14087 d!39833))

(declare-fun d!39835 () Bool)

(assert (=> d!39835 (= (apply!113 (+!160 lt!67067 (tuple2!2567 lt!67060 (minValue!2682 (v!3153 (underlying!442 thiss!992))))) lt!67077) (apply!113 lt!67067 lt!67077))))

(assert (=> d!39835 true))

(declare-fun _$34!967 () Unit!4037)

(assert (=> d!39835 (= (choose!796 lt!67067 lt!67060 (minValue!2682 (v!3153 (underlying!442 thiss!992))) lt!67077) _$34!967)))

(declare-fun bs!5419 () Bool)

(assert (= bs!5419 d!39835))

(assert (=> bs!5419 m!151871))

(assert (=> bs!5419 m!151871))

(assert (=> bs!5419 m!151889))

(assert (=> bs!5419 m!151869))

(assert (=> d!39383 d!39835))

(declare-fun d!39837 () Bool)

(declare-fun e!85177 () Bool)

(assert (=> d!39837 e!85177))

(declare-fun res!62935 () Bool)

(assert (=> d!39837 (=> res!62935 e!85177)))

(declare-fun lt!67908 () Bool)

(assert (=> d!39837 (= res!62935 (not lt!67908))))

(declare-fun lt!67909 () Bool)

(assert (=> d!39837 (= lt!67908 lt!67909)))

(declare-fun lt!67906 () Unit!4037)

(declare-fun e!85176 () Unit!4037)

(assert (=> d!39837 (= lt!67906 e!85176)))

(declare-fun c!24130 () Bool)

(assert (=> d!39837 (= c!24130 lt!67909)))

(assert (=> d!39837 (= lt!67909 (containsKey!171 (toList!846 lt!67067) lt!67077))))

(assert (=> d!39837 (= (contains!876 lt!67067 lt!67077) lt!67908)))

(declare-fun b!130611 () Bool)

(declare-fun lt!67907 () Unit!4037)

(assert (=> b!130611 (= e!85176 lt!67907)))

(assert (=> b!130611 (= lt!67907 (lemmaContainsKeyImpliesGetValueByKeyDefined!120 (toList!846 lt!67067) lt!67077))))

(assert (=> b!130611 (isDefined!121 (getValueByKey!167 (toList!846 lt!67067) lt!67077))))

(declare-fun b!130612 () Bool)

(declare-fun Unit!4085 () Unit!4037)

(assert (=> b!130612 (= e!85176 Unit!4085)))

(declare-fun b!130613 () Bool)

(assert (=> b!130613 (= e!85177 (isDefined!121 (getValueByKey!167 (toList!846 lt!67067) lt!67077)))))

(assert (= (and d!39837 c!24130) b!130611))

(assert (= (and d!39837 (not c!24130)) b!130612))

(assert (= (and d!39837 (not res!62935)) b!130613))

(declare-fun m!153863 () Bool)

(assert (=> d!39837 m!153863))

(declare-fun m!153865 () Bool)

(assert (=> b!130611 m!153865))

(assert (=> b!130611 m!152365))

(assert (=> b!130611 m!152365))

(declare-fun m!153867 () Bool)

(assert (=> b!130611 m!153867))

(assert (=> b!130613 m!152365))

(assert (=> b!130613 m!152365))

(assert (=> b!130613 m!153867))

(assert (=> d!39383 d!39837))

(assert (=> d!39383 d!39389))

(assert (=> d!39383 d!39393))

(assert (=> d!39383 d!39395))

(declare-fun d!39839 () Bool)

(assert (=> d!39839 (= (inRange!0 (ite c!23909 (index!3258 lt!67363) (ite c!23910 (index!3257 lt!67349) (index!3260 lt!67349))) (mask!7100 newMap!16)) (and (bvsge (ite c!23909 (index!3258 lt!67363) (ite c!23910 (index!3257 lt!67349) (index!3260 lt!67349))) #b00000000000000000000000000000000) (bvslt (ite c!23909 (index!3258 lt!67363) (ite c!23910 (index!3257 lt!67349) (index!3260 lt!67349))) (bvadd (mask!7100 newMap!16) #b00000000000000000000000000000001))))))

(assert (=> bm!14105 d!39839))

(assert (=> b!129869 d!39465))

(declare-fun bm!14205 () Bool)

(declare-fun call!14208 () Bool)

(declare-fun c!24131 () Bool)

(assert (=> bm!14205 (= call!14208 (arrayNoDuplicates!0 (_keys!4563 (_2!1295 lt!67144)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!24131 (Cons!1699 (select (arr!2230 (_keys!4563 (_2!1295 lt!67144))) #b00000000000000000000000000000000) Nil!1700) Nil!1700)))))

(declare-fun b!130614 () Bool)

(declare-fun e!85180 () Bool)

(assert (=> b!130614 (= e!85180 call!14208)))

(declare-fun b!130615 () Bool)

(declare-fun e!85181 () Bool)

(declare-fun e!85179 () Bool)

(assert (=> b!130615 (= e!85181 e!85179)))

(declare-fun res!62938 () Bool)

(assert (=> b!130615 (=> (not res!62938) (not e!85179))))

(declare-fun e!85178 () Bool)

(assert (=> b!130615 (= res!62938 (not e!85178))))

(declare-fun res!62936 () Bool)

(assert (=> b!130615 (=> (not res!62936) (not e!85178))))

(assert (=> b!130615 (= res!62936 (validKeyInArray!0 (select (arr!2230 (_keys!4563 (_2!1295 lt!67144))) #b00000000000000000000000000000000)))))

(declare-fun d!39841 () Bool)

(declare-fun res!62937 () Bool)

(assert (=> d!39841 (=> res!62937 e!85181)))

(assert (=> d!39841 (= res!62937 (bvsge #b00000000000000000000000000000000 (size!2497 (_keys!4563 (_2!1295 lt!67144)))))))

(assert (=> d!39841 (= (arrayNoDuplicates!0 (_keys!4563 (_2!1295 lt!67144)) #b00000000000000000000000000000000 Nil!1700) e!85181)))

(declare-fun b!130616 () Bool)

(assert (=> b!130616 (= e!85180 call!14208)))

(declare-fun b!130617 () Bool)

(assert (=> b!130617 (= e!85179 e!85180)))

(assert (=> b!130617 (= c!24131 (validKeyInArray!0 (select (arr!2230 (_keys!4563 (_2!1295 lt!67144))) #b00000000000000000000000000000000)))))

(declare-fun b!130618 () Bool)

(assert (=> b!130618 (= e!85178 (contains!879 Nil!1700 (select (arr!2230 (_keys!4563 (_2!1295 lt!67144))) #b00000000000000000000000000000000)))))

(assert (= (and d!39841 (not res!62937)) b!130615))

(assert (= (and b!130615 res!62936) b!130618))

(assert (= (and b!130615 res!62938) b!130617))

(assert (= (and b!130617 c!24131) b!130616))

(assert (= (and b!130617 (not c!24131)) b!130614))

(assert (= (or b!130616 b!130614) bm!14205))

(assert (=> bm!14205 m!153085))

(declare-fun m!153869 () Bool)

(assert (=> bm!14205 m!153869))

(assert (=> b!130615 m!153085))

(assert (=> b!130615 m!153085))

(assert (=> b!130615 m!153087))

(assert (=> b!130617 m!153085))

(assert (=> b!130617 m!153085))

(assert (=> b!130617 m!153087))

(assert (=> b!130618 m!153085))

(assert (=> b!130618 m!153085))

(declare-fun m!153871 () Bool)

(assert (=> b!130618 m!153871))

(assert (=> b!129754 d!39841))

(assert (=> b!129833 d!39589))

(assert (=> b!129833 d!39591))

(assert (=> b!129650 d!39355))

(declare-fun d!39843 () Bool)

(assert (=> d!39843 (= (get!1463 (getValueByKey!167 (toList!846 lt!67074) lt!67066)) (v!3159 (getValueByKey!167 (toList!846 lt!67074) lt!67066)))))

(assert (=> d!39385 d!39843))

(declare-fun b!130621 () Bool)

(declare-fun e!85183 () Option!173)

(assert (=> b!130621 (= e!85183 (getValueByKey!167 (t!6091 (toList!846 lt!67074)) lt!67066))))

(declare-fun b!130619 () Bool)

(declare-fun e!85182 () Option!173)

(assert (=> b!130619 (= e!85182 (Some!172 (_2!1294 (h!2301 (toList!846 lt!67074)))))))

(declare-fun d!39845 () Bool)

(declare-fun c!24132 () Bool)

(assert (=> d!39845 (= c!24132 (and ((_ is Cons!1697) (toList!846 lt!67074)) (= (_1!1294 (h!2301 (toList!846 lt!67074))) lt!67066)))))

(assert (=> d!39845 (= (getValueByKey!167 (toList!846 lt!67074) lt!67066) e!85182)))

(declare-fun b!130620 () Bool)

(assert (=> b!130620 (= e!85182 e!85183)))

(declare-fun c!24133 () Bool)

(assert (=> b!130620 (= c!24133 (and ((_ is Cons!1697) (toList!846 lt!67074)) (not (= (_1!1294 (h!2301 (toList!846 lt!67074))) lt!67066))))))

(declare-fun b!130622 () Bool)

(assert (=> b!130622 (= e!85183 None!171)))

(assert (= (and d!39845 c!24132) b!130619))

(assert (= (and d!39845 (not c!24132)) b!130620))

(assert (= (and b!130620 c!24133) b!130621))

(assert (= (and b!130620 (not c!24133)) b!130622))

(declare-fun m!153873 () Bool)

(assert (=> b!130621 m!153873))

(assert (=> d!39385 d!39845))

(declare-fun d!39847 () Bool)

(declare-fun e!85185 () Bool)

(assert (=> d!39847 e!85185))

(declare-fun res!62939 () Bool)

(assert (=> d!39847 (=> res!62939 e!85185)))

(declare-fun lt!67912 () Bool)

(assert (=> d!39847 (= res!62939 (not lt!67912))))

(declare-fun lt!67913 () Bool)

(assert (=> d!39847 (= lt!67912 lt!67913)))

(declare-fun lt!67910 () Unit!4037)

(declare-fun e!85184 () Unit!4037)

(assert (=> d!39847 (= lt!67910 e!85184)))

(declare-fun c!24134 () Bool)

(assert (=> d!39847 (= c!24134 lt!67913)))

(assert (=> d!39847 (= lt!67913 (containsKey!171 (toList!846 lt!67211) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!39847 (= (contains!876 lt!67211 #b1000000000000000000000000000000000000000000000000000000000000000) lt!67912)))

(declare-fun b!130623 () Bool)

(declare-fun lt!67911 () Unit!4037)

(assert (=> b!130623 (= e!85184 lt!67911)))

(assert (=> b!130623 (= lt!67911 (lemmaContainsKeyImpliesGetValueByKeyDefined!120 (toList!846 lt!67211) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!130623 (isDefined!121 (getValueByKey!167 (toList!846 lt!67211) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!130624 () Bool)

(declare-fun Unit!4086 () Unit!4037)

(assert (=> b!130624 (= e!85184 Unit!4086)))

(declare-fun b!130625 () Bool)

(assert (=> b!130625 (= e!85185 (isDefined!121 (getValueByKey!167 (toList!846 lt!67211) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!39847 c!24134) b!130623))

(assert (= (and d!39847 (not c!24134)) b!130624))

(assert (= (and d!39847 (not res!62939)) b!130625))

(declare-fun m!153875 () Bool)

(assert (=> d!39847 m!153875))

(declare-fun m!153877 () Bool)

(assert (=> b!130623 m!153877))

(declare-fun m!153879 () Bool)

(assert (=> b!130623 m!153879))

(assert (=> b!130623 m!153879))

(declare-fun m!153881 () Bool)

(assert (=> b!130623 m!153881))

(assert (=> b!130625 m!153879))

(assert (=> b!130625 m!153879))

(assert (=> b!130625 m!153881))

(assert (=> bm!14084 d!39847))

(declare-fun d!39849 () Bool)

(assert (=> d!39849 (= (inRange!0 (ite c!23935 (index!3257 lt!67453) (index!3260 lt!67453)) (mask!7100 newMap!16)) (and (bvsge (ite c!23935 (index!3257 lt!67453) (index!3260 lt!67453)) #b00000000000000000000000000000000) (bvslt (ite c!23935 (index!3257 lt!67453) (index!3260 lt!67453)) (bvadd (mask!7100 newMap!16) #b00000000000000000000000000000001))))))

(assert (=> bm!14126 d!39849))

(declare-fun d!39851 () Bool)

(assert (=> d!39851 (= (apply!113 lt!67185 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1463 (getValueByKey!167 (toList!846 lt!67185) (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(declare-fun bs!5420 () Bool)

(assert (= bs!5420 d!39851))

(assert (=> bs!5420 m!151855))

(assert (=> bs!5420 m!153101))

(assert (=> bs!5420 m!153101))

(declare-fun m!153883 () Bool)

(assert (=> bs!5420 m!153883))

(assert (=> b!129653 d!39851))

(assert (=> b!129653 d!39343))

(declare-fun d!39853 () Bool)

(assert (=> d!39853 (= (inRange!0 (index!3258 lt!67460) (mask!7100 newMap!16)) (and (bvsge (index!3258 lt!67460) #b00000000000000000000000000000000) (bvslt (index!3258 lt!67460) (bvadd (mask!7100 newMap!16) #b00000000000000000000000000000001))))))

(assert (=> b!129925 d!39853))

(declare-fun b!130626 () Bool)

(declare-fun e!85186 () (_ BitVec 32))

(declare-fun call!14209 () (_ BitVec 32))

(assert (=> b!130626 (= e!85186 call!14209)))

(declare-fun b!130628 () Bool)

(assert (=> b!130628 (= e!85186 (bvadd #b00000000000000000000000000000001 call!14209))))

(declare-fun b!130629 () Bool)

(declare-fun e!85187 () (_ BitVec 32))

(assert (=> b!130629 (= e!85187 #b00000000000000000000000000000000)))

(declare-fun bm!14206 () Bool)

(assert (=> bm!14206 (= call!14209 (arrayCountValidKeys!0 (_keys!4563 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!2497 (_keys!4563 newMap!16))))))

(declare-fun d!39855 () Bool)

(declare-fun lt!67914 () (_ BitVec 32))

(assert (=> d!39855 (and (bvsge lt!67914 #b00000000000000000000000000000000) (bvsle lt!67914 (bvsub (size!2497 (_keys!4563 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> d!39855 (= lt!67914 e!85187)))

(declare-fun c!24136 () Bool)

(assert (=> d!39855 (= c!24136 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2497 (_keys!4563 newMap!16))))))

(assert (=> d!39855 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2497 (_keys!4563 newMap!16))) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (size!2497 (_keys!4563 newMap!16)) (size!2497 (_keys!4563 newMap!16))))))

(assert (=> d!39855 (= (arrayCountValidKeys!0 (_keys!4563 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2497 (_keys!4563 newMap!16))) lt!67914)))

(declare-fun b!130627 () Bool)

(assert (=> b!130627 (= e!85187 e!85186)))

(declare-fun c!24135 () Bool)

(assert (=> b!130627 (= c!24135 (validKeyInArray!0 (select (arr!2230 (_keys!4563 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!39855 c!24136) b!130629))

(assert (= (and d!39855 (not c!24136)) b!130627))

(assert (= (and b!130627 c!24135) b!130628))

(assert (= (and b!130627 (not c!24135)) b!130626))

(assert (= (or b!130628 b!130626) bm!14206))

(declare-fun m!153885 () Bool)

(assert (=> bm!14206 m!153885))

(assert (=> b!130627 m!152953))

(assert (=> b!130627 m!152953))

(assert (=> b!130627 m!152957))

(assert (=> bm!14120 d!39855))

(assert (=> d!39397 d!39401))

(assert (=> d!39397 d!39381))

(declare-fun d!39857 () Bool)

(declare-fun e!85189 () Bool)

(assert (=> d!39857 e!85189))

(declare-fun res!62940 () Bool)

(assert (=> d!39857 (=> res!62940 e!85189)))

(declare-fun lt!67917 () Bool)

(assert (=> d!39857 (= res!62940 (not lt!67917))))

(declare-fun lt!67918 () Bool)

(assert (=> d!39857 (= lt!67917 lt!67918)))

(declare-fun lt!67915 () Unit!4037)

(declare-fun e!85188 () Unit!4037)

(assert (=> d!39857 (= lt!67915 e!85188)))

(declare-fun c!24137 () Bool)

(assert (=> d!39857 (= c!24137 lt!67918)))

(assert (=> d!39857 (= lt!67918 (containsKey!171 (toList!846 lt!67059) lt!67068))))

(assert (=> d!39857 (= (contains!876 lt!67059 lt!67068) lt!67917)))

(declare-fun b!130630 () Bool)

(declare-fun lt!67916 () Unit!4037)

(assert (=> b!130630 (= e!85188 lt!67916)))

(assert (=> b!130630 (= lt!67916 (lemmaContainsKeyImpliesGetValueByKeyDefined!120 (toList!846 lt!67059) lt!67068))))

(assert (=> b!130630 (isDefined!121 (getValueByKey!167 (toList!846 lt!67059) lt!67068))))

(declare-fun b!130631 () Bool)

(declare-fun Unit!4087 () Unit!4037)

(assert (=> b!130631 (= e!85188 Unit!4087)))

(declare-fun b!130632 () Bool)

(assert (=> b!130632 (= e!85189 (isDefined!121 (getValueByKey!167 (toList!846 lt!67059) lt!67068)))))

(assert (= (and d!39857 c!24137) b!130630))

(assert (= (and d!39857 (not c!24137)) b!130631))

(assert (= (and d!39857 (not res!62940)) b!130632))

(declare-fun m!153887 () Bool)

(assert (=> d!39857 m!153887))

(declare-fun m!153889 () Bool)

(assert (=> b!130630 m!153889))

(assert (=> b!130630 m!152413))

(assert (=> b!130630 m!152413))

(declare-fun m!153891 () Bool)

(assert (=> b!130630 m!153891))

(assert (=> b!130632 m!152413))

(assert (=> b!130632 m!152413))

(assert (=> b!130632 m!153891))

(assert (=> d!39397 d!39857))

(declare-fun d!39859 () Bool)

(assert (=> d!39859 (= (apply!113 (+!160 lt!67059 (tuple2!2567 lt!67075 (zeroValue!2682 (v!3153 (underlying!442 thiss!992))))) lt!67068) (apply!113 lt!67059 lt!67068))))

(assert (=> d!39859 true))

(declare-fun _$34!968 () Unit!4037)

(assert (=> d!39859 (= (choose!796 lt!67059 lt!67075 (zeroValue!2682 (v!3153 (underlying!442 thiss!992))) lt!67068) _$34!968)))

(declare-fun bs!5421 () Bool)

(assert (= bs!5421 d!39859))

(assert (=> bs!5421 m!151883))

(assert (=> bs!5421 m!151883))

(assert (=> bs!5421 m!151885))

(assert (=> bs!5421 m!151873))

(assert (=> d!39397 d!39859))

(assert (=> d!39397 d!39405))

(declare-fun d!39861 () Bool)

(declare-fun isEmpty!408 (List!1701) Bool)

(assert (=> d!39861 (= (isEmpty!406 lt!67185) (isEmpty!408 (toList!846 lt!67185)))))

(declare-fun bs!5422 () Bool)

(assert (= bs!5422 d!39861))

(declare-fun m!153893 () Bool)

(assert (=> bs!5422 m!153893))

(assert (=> b!129657 d!39861))

(assert (=> d!39417 d!39451))

(declare-fun d!39863 () Bool)

(declare-fun res!62941 () Bool)

(declare-fun e!85190 () Bool)

(assert (=> d!39863 (=> res!62941 e!85190)))

(assert (=> d!39863 (= res!62941 (= (select (arr!2230 (_keys!4563 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355)))))

(assert (=> d!39863 (= (arrayContainsKey!0 (_keys!4563 newMap!16) (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!85190)))

(declare-fun b!130633 () Bool)

(declare-fun e!85191 () Bool)

(assert (=> b!130633 (= e!85190 e!85191)))

(declare-fun res!62942 () Bool)

(assert (=> b!130633 (=> (not res!62942) (not e!85191))))

(assert (=> b!130633 (= res!62942 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!2497 (_keys!4563 newMap!16))))))

(declare-fun b!130634 () Bool)

(assert (=> b!130634 (= e!85191 (arrayContainsKey!0 (_keys!4563 newMap!16) (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!39863 (not res!62941)) b!130633))

(assert (= (and b!130633 res!62942) b!130634))

(assert (=> d!39863 m!152953))

(assert (=> b!130634 m!151753))

(declare-fun m!153895 () Bool)

(assert (=> b!130634 m!153895))

(assert (=> b!129889 d!39863))

(declare-fun d!39865 () Bool)

(declare-fun e!85193 () Bool)

(assert (=> d!39865 e!85193))

(declare-fun res!62943 () Bool)

(assert (=> d!39865 (=> res!62943 e!85193)))

(declare-fun lt!67921 () Bool)

(assert (=> d!39865 (= res!62943 (not lt!67921))))

(declare-fun lt!67922 () Bool)

(assert (=> d!39865 (= lt!67921 lt!67922)))

(declare-fun lt!67919 () Unit!4037)

(declare-fun e!85192 () Unit!4037)

(assert (=> d!39865 (= lt!67919 e!85192)))

(declare-fun c!24138 () Bool)

(assert (=> d!39865 (= c!24138 lt!67922)))

(assert (=> d!39865 (= lt!67922 (containsKey!171 (toList!846 lt!67387) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!39865 (= (contains!876 lt!67387 #b0000000000000000000000000000000000000000000000000000000000000000) lt!67921)))

(declare-fun b!130635 () Bool)

(declare-fun lt!67920 () Unit!4037)

(assert (=> b!130635 (= e!85192 lt!67920)))

(assert (=> b!130635 (= lt!67920 (lemmaContainsKeyImpliesGetValueByKeyDefined!120 (toList!846 lt!67387) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!130635 (isDefined!121 (getValueByKey!167 (toList!846 lt!67387) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!130636 () Bool)

(declare-fun Unit!4088 () Unit!4037)

(assert (=> b!130636 (= e!85192 Unit!4088)))

(declare-fun b!130637 () Bool)

(assert (=> b!130637 (= e!85193 (isDefined!121 (getValueByKey!167 (toList!846 lt!67387) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!39865 c!24138) b!130635))

(assert (= (and d!39865 (not c!24138)) b!130636))

(assert (= (and d!39865 (not res!62943)) b!130637))

(declare-fun m!153897 () Bool)

(assert (=> d!39865 m!153897))

(declare-fun m!153899 () Bool)

(assert (=> b!130635 m!153899))

(assert (=> b!130635 m!153421))

(assert (=> b!130635 m!153421))

(declare-fun m!153901 () Bool)

(assert (=> b!130635 m!153901))

(assert (=> b!130637 m!153421))

(assert (=> b!130637 m!153421))

(assert (=> b!130637 m!153901))

(assert (=> bm!14113 d!39865))

(declare-fun d!39867 () Bool)

(declare-fun e!85195 () Bool)

(assert (=> d!39867 e!85195))

(declare-fun res!62944 () Bool)

(assert (=> d!39867 (=> res!62944 e!85195)))

(declare-fun lt!67925 () Bool)

(assert (=> d!39867 (= res!62944 (not lt!67925))))

(declare-fun lt!67926 () Bool)

(assert (=> d!39867 (= lt!67925 lt!67926)))

(declare-fun lt!67923 () Unit!4037)

(declare-fun e!85194 () Unit!4037)

(assert (=> d!39867 (= lt!67923 e!85194)))

(declare-fun c!24139 () Bool)

(assert (=> d!39867 (= c!24139 lt!67926)))

(assert (=> d!39867 (= lt!67926 (containsKey!171 (toList!846 lt!67387) (select (arr!2230 (_keys!4563 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> d!39867 (= (contains!876 lt!67387 (select (arr!2230 (_keys!4563 newMap!16)) #b00000000000000000000000000000000)) lt!67925)))

(declare-fun b!130638 () Bool)

(declare-fun lt!67924 () Unit!4037)

(assert (=> b!130638 (= e!85194 lt!67924)))

(assert (=> b!130638 (= lt!67924 (lemmaContainsKeyImpliesGetValueByKeyDefined!120 (toList!846 lt!67387) (select (arr!2230 (_keys!4563 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!130638 (isDefined!121 (getValueByKey!167 (toList!846 lt!67387) (select (arr!2230 (_keys!4563 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!130639 () Bool)

(declare-fun Unit!4089 () Unit!4037)

(assert (=> b!130639 (= e!85194 Unit!4089)))

(declare-fun b!130640 () Bool)

(assert (=> b!130640 (= e!85195 (isDefined!121 (getValueByKey!167 (toList!846 lt!67387) (select (arr!2230 (_keys!4563 newMap!16)) #b00000000000000000000000000000000))))))

(assert (= (and d!39867 c!24139) b!130638))

(assert (= (and d!39867 (not c!24139)) b!130639))

(assert (= (and d!39867 (not res!62944)) b!130640))

(assert (=> d!39867 m!152019))

(declare-fun m!153903 () Bool)

(assert (=> d!39867 m!153903))

(assert (=> b!130638 m!152019))

(declare-fun m!153905 () Bool)

(assert (=> b!130638 m!153905))

(assert (=> b!130638 m!152019))

(assert (=> b!130638 m!152969))

(assert (=> b!130638 m!152969))

(declare-fun m!153907 () Bool)

(assert (=> b!130638 m!153907))

(assert (=> b!130640 m!152019))

(assert (=> b!130640 m!152969))

(assert (=> b!130640 m!152969))

(assert (=> b!130640 m!153907))

(assert (=> b!129809 d!39867))

(declare-fun d!39869 () Bool)

(assert (=> d!39869 (isDefined!121 (getValueByKey!167 (toList!846 lt!67071) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!67927 () Unit!4037)

(assert (=> d!39869 (= lt!67927 (choose!801 (toList!846 lt!67071) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!85196 () Bool)

(assert (=> d!39869 e!85196))

(declare-fun res!62945 () Bool)

(assert (=> d!39869 (=> (not res!62945) (not e!85196))))

(assert (=> d!39869 (= res!62945 (isStrictlySorted!314 (toList!846 lt!67071)))))

(assert (=> d!39869 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!120 (toList!846 lt!67071) #b1000000000000000000000000000000000000000000000000000000000000000) lt!67927)))

(declare-fun b!130641 () Bool)

(assert (=> b!130641 (= e!85196 (containsKey!171 (toList!846 lt!67071) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!39869 res!62945) b!130641))

(assert (=> d!39869 m!152011))

(assert (=> d!39869 m!152011))

(assert (=> d!39869 m!152013))

(declare-fun m!153909 () Bool)

(assert (=> d!39869 m!153909))

(assert (=> d!39869 m!153499))

(assert (=> b!130641 m!152007))

(assert (=> b!129661 d!39869))

(assert (=> b!129661 d!39701))

(assert (=> b!129661 d!39487))

(assert (=> d!39429 d!39351))

(declare-fun b!130658 () Bool)

(declare-fun e!85205 () Bool)

(declare-fun lt!67930 () SeekEntryResult!275)

(assert (=> b!130658 (= e!85205 ((_ is Undefined!275) lt!67930))))

(declare-fun d!39871 () Bool)

(declare-fun e!85206 () Bool)

(assert (=> d!39871 e!85206))

(declare-fun c!24144 () Bool)

(assert (=> d!39871 (= c!24144 ((_ is MissingZero!275) lt!67930))))

(assert (=> d!39871 (= lt!67930 (seekEntryOrOpen!0 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355) (_keys!4563 newMap!16) (mask!7100 newMap!16)))))

(assert (=> d!39871 true))

(declare-fun _$34!971 () Unit!4037)

(assert (=> d!39871 (= (choose!799 (_keys!4563 newMap!16) (_values!2806 newMap!16) (mask!7100 newMap!16) (extraKeys!2596 newMap!16) (zeroValue!2682 newMap!16) (minValue!2682 newMap!16) (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355) (defaultEntry!2823 newMap!16)) _$34!971)))

(declare-fun b!130659 () Bool)

(declare-fun e!85207 () Bool)

(declare-fun call!14214 () Bool)

(assert (=> b!130659 (= e!85207 (not call!14214))))

(declare-fun b!130660 () Bool)

(declare-fun res!62955 () Bool)

(declare-fun e!85208 () Bool)

(assert (=> b!130660 (=> (not res!62955) (not e!85208))))

(assert (=> b!130660 (= res!62955 (= (select (arr!2230 (_keys!4563 newMap!16)) (index!3260 lt!67930)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun call!14215 () Bool)

(declare-fun bm!14211 () Bool)

(assert (=> bm!14211 (= call!14215 (inRange!0 (ite c!24144 (index!3257 lt!67930) (index!3260 lt!67930)) (mask!7100 newMap!16)))))

(declare-fun b!130661 () Bool)

(declare-fun res!62956 () Bool)

(assert (=> b!130661 (= res!62956 (= (select (arr!2230 (_keys!4563 newMap!16)) (index!3257 lt!67930)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!130661 (=> (not res!62956) (not e!85207))))

(declare-fun bm!14212 () Bool)

(assert (=> bm!14212 (= call!14214 (arrayContainsKey!0 (_keys!4563 newMap!16) (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun b!130662 () Bool)

(assert (=> b!130662 (= e!85206 e!85207)))

(declare-fun res!62957 () Bool)

(assert (=> b!130662 (= res!62957 call!14215)))

(assert (=> b!130662 (=> (not res!62957) (not e!85207))))

(declare-fun b!130663 () Bool)

(assert (=> b!130663 (= e!85208 (not call!14214))))

(declare-fun b!130664 () Bool)

(declare-fun res!62954 () Bool)

(assert (=> b!130664 (=> (not res!62954) (not e!85208))))

(assert (=> b!130664 (= res!62954 call!14215)))

(assert (=> b!130664 (= e!85205 e!85208)))

(declare-fun b!130665 () Bool)

(assert (=> b!130665 (= e!85206 e!85205)))

(declare-fun c!24145 () Bool)

(assert (=> b!130665 (= c!24145 ((_ is MissingVacant!275) lt!67930))))

(assert (= (and d!39871 c!24144) b!130662))

(assert (= (and d!39871 (not c!24144)) b!130665))

(assert (= (and b!130662 res!62957) b!130661))

(assert (= (and b!130661 res!62956) b!130659))

(assert (= (and b!130665 c!24145) b!130664))

(assert (= (and b!130665 (not c!24145)) b!130658))

(assert (= (and b!130664 res!62954) b!130660))

(assert (= (and b!130660 res!62955) b!130663))

(assert (= (or b!130662 b!130664) bm!14211))

(assert (= (or b!130659 b!130663) bm!14212))

(declare-fun m!153911 () Bool)

(assert (=> b!130660 m!153911))

(assert (=> d!39871 m!151753))

(assert (=> d!39871 m!151953))

(declare-fun m!153913 () Bool)

(assert (=> b!130661 m!153913))

(assert (=> bm!14212 m!151753))

(assert (=> bm!14212 m!151959))

(declare-fun m!153915 () Bool)

(assert (=> bm!14211 m!153915))

(assert (=> d!39429 d!39871))

(assert (=> d!39429 d!39451))

(declare-fun d!39873 () Bool)

(declare-fun e!85210 () Bool)

(assert (=> d!39873 e!85210))

(declare-fun res!62958 () Bool)

(assert (=> d!39873 (=> res!62958 e!85210)))

(declare-fun lt!67933 () Bool)

(assert (=> d!39873 (= res!62958 (not lt!67933))))

(declare-fun lt!67934 () Bool)

(assert (=> d!39873 (= lt!67933 lt!67934)))

(declare-fun lt!67931 () Unit!4037)

(declare-fun e!85209 () Unit!4037)

(assert (=> d!39873 (= lt!67931 e!85209)))

(declare-fun c!24146 () Bool)

(assert (=> d!39873 (= c!24146 lt!67934)))

(assert (=> d!39873 (= lt!67934 (containsKey!171 (toList!846 lt!67444) (_1!1294 (tuple2!2567 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!39873 (= (contains!876 lt!67444 (_1!1294 (tuple2!2567 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) lt!67933)))

(declare-fun b!130666 () Bool)

(declare-fun lt!67932 () Unit!4037)

(assert (=> b!130666 (= e!85209 lt!67932)))

(assert (=> b!130666 (= lt!67932 (lemmaContainsKeyImpliesGetValueByKeyDefined!120 (toList!846 lt!67444) (_1!1294 (tuple2!2567 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> b!130666 (isDefined!121 (getValueByKey!167 (toList!846 lt!67444) (_1!1294 (tuple2!2567 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!130667 () Bool)

(declare-fun Unit!4090 () Unit!4037)

(assert (=> b!130667 (= e!85209 Unit!4090)))

(declare-fun b!130668 () Bool)

(assert (=> b!130668 (= e!85210 (isDefined!121 (getValueByKey!167 (toList!846 lt!67444) (_1!1294 (tuple2!2567 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (= (and d!39873 c!24146) b!130666))

(assert (= (and d!39873 (not c!24146)) b!130667))

(assert (= (and d!39873 (not res!62958)) b!130668))

(declare-fun m!153917 () Bool)

(assert (=> d!39873 m!153917))

(declare-fun m!153919 () Bool)

(assert (=> b!130666 m!153919))

(assert (=> b!130666 m!152457))

(assert (=> b!130666 m!152457))

(declare-fun m!153921 () Bool)

(assert (=> b!130666 m!153921))

(assert (=> b!130668 m!152457))

(assert (=> b!130668 m!152457))

(assert (=> b!130668 m!153921))

(assert (=> d!39423 d!39873))

(declare-fun b!130671 () Bool)

(declare-fun e!85212 () Option!173)

(assert (=> b!130671 (= e!85212 (getValueByKey!167 (t!6091 lt!67441) (_1!1294 (tuple2!2567 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!130669 () Bool)

(declare-fun e!85211 () Option!173)

(assert (=> b!130669 (= e!85211 (Some!172 (_2!1294 (h!2301 lt!67441))))))

(declare-fun c!24147 () Bool)

(declare-fun d!39875 () Bool)

(assert (=> d!39875 (= c!24147 (and ((_ is Cons!1697) lt!67441) (= (_1!1294 (h!2301 lt!67441)) (_1!1294 (tuple2!2567 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!39875 (= (getValueByKey!167 lt!67441 (_1!1294 (tuple2!2567 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) e!85211)))

(declare-fun b!130670 () Bool)

(assert (=> b!130670 (= e!85211 e!85212)))

(declare-fun c!24148 () Bool)

(assert (=> b!130670 (= c!24148 (and ((_ is Cons!1697) lt!67441) (not (= (_1!1294 (h!2301 lt!67441)) (_1!1294 (tuple2!2567 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(declare-fun b!130672 () Bool)

(assert (=> b!130672 (= e!85212 None!171)))

(assert (= (and d!39875 c!24147) b!130669))

(assert (= (and d!39875 (not c!24147)) b!130670))

(assert (= (and b!130670 c!24148) b!130671))

(assert (= (and b!130670 (not c!24148)) b!130672))

(declare-fun m!153923 () Bool)

(assert (=> b!130671 m!153923))

(assert (=> d!39423 d!39875))

(declare-fun d!39877 () Bool)

(assert (=> d!39877 (= (getValueByKey!167 lt!67441 (_1!1294 (tuple2!2567 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!172 (_2!1294 (tuple2!2567 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!67935 () Unit!4037)

(assert (=> d!39877 (= lt!67935 (choose!802 lt!67441 (_1!1294 (tuple2!2567 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1294 (tuple2!2567 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!85213 () Bool)

(assert (=> d!39877 e!85213))

(declare-fun res!62959 () Bool)

(assert (=> d!39877 (=> (not res!62959) (not e!85213))))

(assert (=> d!39877 (= res!62959 (isStrictlySorted!314 lt!67441))))

(assert (=> d!39877 (= (lemmaContainsTupThenGetReturnValue!85 lt!67441 (_1!1294 (tuple2!2567 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1294 (tuple2!2567 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) lt!67935)))

(declare-fun b!130673 () Bool)

(declare-fun res!62960 () Bool)

(assert (=> b!130673 (=> (not res!62960) (not e!85213))))

(assert (=> b!130673 (= res!62960 (containsKey!171 lt!67441 (_1!1294 (tuple2!2567 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!130674 () Bool)

(assert (=> b!130674 (= e!85213 (contains!878 lt!67441 (tuple2!2567 (_1!1294 (tuple2!2567 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1294 (tuple2!2567 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (= (and d!39877 res!62959) b!130673))

(assert (= (and b!130673 res!62960) b!130674))

(assert (=> d!39877 m!152451))

(declare-fun m!153925 () Bool)

(assert (=> d!39877 m!153925))

(declare-fun m!153927 () Bool)

(assert (=> d!39877 m!153927))

(declare-fun m!153929 () Bool)

(assert (=> b!130673 m!153929))

(declare-fun m!153931 () Bool)

(assert (=> b!130674 m!153931))

(assert (=> d!39423 d!39877))

(declare-fun bm!14213 () Bool)

(declare-fun call!14216 () List!1701)

(declare-fun call!14218 () List!1701)

(assert (=> bm!14213 (= call!14216 call!14218)))

(declare-fun b!130675 () Bool)

(declare-fun e!85214 () List!1701)

(declare-fun call!14217 () List!1701)

(assert (=> b!130675 (= e!85214 call!14217)))

(declare-fun c!24150 () Bool)

(declare-fun bm!14214 () Bool)

(declare-fun e!85218 () List!1701)

(assert (=> bm!14214 (= call!14217 ($colon$colon!90 e!85218 (ite c!24150 (h!2301 (toList!846 call!14068)) (tuple2!2567 (_1!1294 (tuple2!2567 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1294 (tuple2!2567 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(declare-fun c!24152 () Bool)

(assert (=> bm!14214 (= c!24152 c!24150)))

(declare-fun d!39879 () Bool)

(declare-fun e!85216 () Bool)

(assert (=> d!39879 e!85216))

(declare-fun res!62962 () Bool)

(assert (=> d!39879 (=> (not res!62962) (not e!85216))))

(declare-fun lt!67936 () List!1701)

(assert (=> d!39879 (= res!62962 (isStrictlySorted!314 lt!67936))))

(assert (=> d!39879 (= lt!67936 e!85214)))

(assert (=> d!39879 (= c!24150 (and ((_ is Cons!1697) (toList!846 call!14068)) (bvslt (_1!1294 (h!2301 (toList!846 call!14068))) (_1!1294 (tuple2!2567 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!39879 (isStrictlySorted!314 (toList!846 call!14068))))

(assert (=> d!39879 (= (insertStrictlySorted!88 (toList!846 call!14068) (_1!1294 (tuple2!2567 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1294 (tuple2!2567 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) lt!67936)))

(declare-fun b!130676 () Bool)

(declare-fun e!85217 () List!1701)

(assert (=> b!130676 (= e!85217 call!14216)))

(declare-fun c!24149 () Bool)

(declare-fun b!130677 () Bool)

(declare-fun c!24151 () Bool)

(assert (=> b!130677 (= e!85218 (ite c!24151 (t!6091 (toList!846 call!14068)) (ite c!24149 (Cons!1697 (h!2301 (toList!846 call!14068)) (t!6091 (toList!846 call!14068))) Nil!1698)))))

(declare-fun b!130678 () Bool)

(assert (=> b!130678 (= e!85218 (insertStrictlySorted!88 (t!6091 (toList!846 call!14068)) (_1!1294 (tuple2!2567 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1294 (tuple2!2567 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun bm!14215 () Bool)

(assert (=> bm!14215 (= call!14218 call!14217)))

(declare-fun b!130679 () Bool)

(declare-fun e!85215 () List!1701)

(assert (=> b!130679 (= e!85215 call!14218)))

(declare-fun b!130680 () Bool)

(assert (=> b!130680 (= c!24149 (and ((_ is Cons!1697) (toList!846 call!14068)) (bvsgt (_1!1294 (h!2301 (toList!846 call!14068))) (_1!1294 (tuple2!2567 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> b!130680 (= e!85215 e!85217)))

(declare-fun b!130681 () Bool)

(assert (=> b!130681 (= e!85216 (contains!878 lt!67936 (tuple2!2567 (_1!1294 (tuple2!2567 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1294 (tuple2!2567 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!130682 () Bool)

(assert (=> b!130682 (= e!85217 call!14216)))

(declare-fun b!130683 () Bool)

(declare-fun res!62961 () Bool)

(assert (=> b!130683 (=> (not res!62961) (not e!85216))))

(assert (=> b!130683 (= res!62961 (containsKey!171 lt!67936 (_1!1294 (tuple2!2567 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!130684 () Bool)

(assert (=> b!130684 (= e!85214 e!85215)))

(assert (=> b!130684 (= c!24151 (and ((_ is Cons!1697) (toList!846 call!14068)) (= (_1!1294 (h!2301 (toList!846 call!14068))) (_1!1294 (tuple2!2567 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (= (and d!39879 c!24150) b!130675))

(assert (= (and d!39879 (not c!24150)) b!130684))

(assert (= (and b!130684 c!24151) b!130679))

(assert (= (and b!130684 (not c!24151)) b!130680))

(assert (= (and b!130680 c!24149) b!130682))

(assert (= (and b!130680 (not c!24149)) b!130676))

(assert (= (or b!130682 b!130676) bm!14213))

(assert (= (or b!130679 bm!14213) bm!14215))

(assert (= (or b!130675 bm!14215) bm!14214))

(assert (= (and bm!14214 c!24152) b!130678))

(assert (= (and bm!14214 (not c!24152)) b!130677))

(assert (= (and d!39879 res!62962) b!130683))

(assert (= (and b!130683 res!62961) b!130681))

(declare-fun m!153933 () Bool)

(assert (=> b!130683 m!153933))

(declare-fun m!153935 () Bool)

(assert (=> bm!14214 m!153935))

(declare-fun m!153937 () Bool)

(assert (=> b!130678 m!153937))

(declare-fun m!153939 () Bool)

(assert (=> d!39879 m!153939))

(declare-fun m!153941 () Bool)

(assert (=> d!39879 m!153941))

(declare-fun m!153943 () Bool)

(assert (=> b!130681 m!153943))

(assert (=> d!39423 d!39879))

(declare-fun d!39881 () Bool)

(declare-fun e!85220 () Bool)

(assert (=> d!39881 e!85220))

(declare-fun res!62963 () Bool)

(assert (=> d!39881 (=> res!62963 e!85220)))

(declare-fun lt!67939 () Bool)

(assert (=> d!39881 (= res!62963 (not lt!67939))))

(declare-fun lt!67940 () Bool)

(assert (=> d!39881 (= lt!67939 lt!67940)))

(declare-fun lt!67937 () Unit!4037)

(declare-fun e!85219 () Unit!4037)

(assert (=> d!39881 (= lt!67937 e!85219)))

(declare-fun c!24153 () Bool)

(assert (=> d!39881 (= c!24153 lt!67940)))

(assert (=> d!39881 (= lt!67940 (containsKey!171 (toList!846 lt!67245) (_1!1294 (ite c!23852 (ite c!23848 (tuple2!2567 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2567 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!39881 (= (contains!876 lt!67245 (_1!1294 (ite c!23852 (ite c!23848 (tuple2!2567 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2567 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))) lt!67939)))

(declare-fun b!130685 () Bool)

(declare-fun lt!67938 () Unit!4037)

(assert (=> b!130685 (= e!85219 lt!67938)))

(assert (=> b!130685 (= lt!67938 (lemmaContainsKeyImpliesGetValueByKeyDefined!120 (toList!846 lt!67245) (_1!1294 (ite c!23852 (ite c!23848 (tuple2!2567 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2567 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> b!130685 (isDefined!121 (getValueByKey!167 (toList!846 lt!67245) (_1!1294 (ite c!23852 (ite c!23848 (tuple2!2567 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2567 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!130686 () Bool)

(declare-fun Unit!4091 () Unit!4037)

(assert (=> b!130686 (= e!85219 Unit!4091)))

(declare-fun b!130687 () Bool)

(assert (=> b!130687 (= e!85220 (isDefined!121 (getValueByKey!167 (toList!846 lt!67245) (_1!1294 (ite c!23852 (ite c!23848 (tuple2!2567 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2567 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(assert (= (and d!39881 c!24153) b!130685))

(assert (= (and d!39881 (not c!24153)) b!130686))

(assert (= (and d!39881 (not res!62963)) b!130687))

(declare-fun m!153945 () Bool)

(assert (=> d!39881 m!153945))

(declare-fun m!153947 () Bool)

(assert (=> b!130685 m!153947))

(assert (=> b!130685 m!152125))

(assert (=> b!130685 m!152125))

(declare-fun m!153949 () Bool)

(assert (=> b!130685 m!153949))

(assert (=> b!130687 m!152125))

(assert (=> b!130687 m!152125))

(assert (=> b!130687 m!153949))

(assert (=> d!39353 d!39881))

(declare-fun b!130690 () Bool)

(declare-fun e!85222 () Option!173)

(assert (=> b!130690 (= e!85222 (getValueByKey!167 (t!6091 lt!67242) (_1!1294 (ite c!23852 (ite c!23848 (tuple2!2567 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2567 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!130688 () Bool)

(declare-fun e!85221 () Option!173)

(assert (=> b!130688 (= e!85221 (Some!172 (_2!1294 (h!2301 lt!67242))))))

(declare-fun c!24154 () Bool)

(declare-fun d!39883 () Bool)

(assert (=> d!39883 (= c!24154 (and ((_ is Cons!1697) lt!67242) (= (_1!1294 (h!2301 lt!67242)) (_1!1294 (ite c!23852 (ite c!23848 (tuple2!2567 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2567 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(assert (=> d!39883 (= (getValueByKey!167 lt!67242 (_1!1294 (ite c!23852 (ite c!23848 (tuple2!2567 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2567 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))) e!85221)))

(declare-fun b!130689 () Bool)

(assert (=> b!130689 (= e!85221 e!85222)))

(declare-fun c!24155 () Bool)

(assert (=> b!130689 (= c!24155 (and ((_ is Cons!1697) lt!67242) (not (= (_1!1294 (h!2301 lt!67242)) (_1!1294 (ite c!23852 (ite c!23848 (tuple2!2567 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2567 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))))

(declare-fun b!130691 () Bool)

(assert (=> b!130691 (= e!85222 None!171)))

(assert (= (and d!39883 c!24154) b!130688))

(assert (= (and d!39883 (not c!24154)) b!130689))

(assert (= (and b!130689 c!24155) b!130690))

(assert (= (and b!130689 (not c!24155)) b!130691))

(declare-fun m!153951 () Bool)

(assert (=> b!130690 m!153951))

(assert (=> d!39353 d!39883))

(declare-fun d!39885 () Bool)

(assert (=> d!39885 (= (getValueByKey!167 lt!67242 (_1!1294 (ite c!23852 (ite c!23848 (tuple2!2567 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2567 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))) (Some!172 (_2!1294 (ite c!23852 (ite c!23848 (tuple2!2567 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2567 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun lt!67941 () Unit!4037)

(assert (=> d!39885 (= lt!67941 (choose!802 lt!67242 (_1!1294 (ite c!23852 (ite c!23848 (tuple2!2567 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2567 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (_2!1294 (ite c!23852 (ite c!23848 (tuple2!2567 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2567 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun e!85223 () Bool)

(assert (=> d!39885 e!85223))

(declare-fun res!62964 () Bool)

(assert (=> d!39885 (=> (not res!62964) (not e!85223))))

(assert (=> d!39885 (= res!62964 (isStrictlySorted!314 lt!67242))))

(assert (=> d!39885 (= (lemmaContainsTupThenGetReturnValue!85 lt!67242 (_1!1294 (ite c!23852 (ite c!23848 (tuple2!2567 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2567 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (_2!1294 (ite c!23852 (ite c!23848 (tuple2!2567 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2567 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))) lt!67941)))

(declare-fun b!130692 () Bool)

(declare-fun res!62965 () Bool)

(assert (=> b!130692 (=> (not res!62965) (not e!85223))))

(assert (=> b!130692 (= res!62965 (containsKey!171 lt!67242 (_1!1294 (ite c!23852 (ite c!23848 (tuple2!2567 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2567 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!130693 () Bool)

(assert (=> b!130693 (= e!85223 (contains!878 lt!67242 (tuple2!2567 (_1!1294 (ite c!23852 (ite c!23848 (tuple2!2567 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2567 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (_2!1294 (ite c!23852 (ite c!23848 (tuple2!2567 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2567 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(assert (= (and d!39885 res!62964) b!130692))

(assert (= (and b!130692 res!62965) b!130693))

(assert (=> d!39885 m!152119))

(declare-fun m!153953 () Bool)

(assert (=> d!39885 m!153953))

(declare-fun m!153955 () Bool)

(assert (=> d!39885 m!153955))

(declare-fun m!153957 () Bool)

(assert (=> b!130692 m!153957))

(declare-fun m!153959 () Bool)

(assert (=> b!130693 m!153959))

(assert (=> d!39353 d!39885))

(declare-fun bm!14216 () Bool)

(declare-fun call!14219 () List!1701)

(declare-fun call!14221 () List!1701)

(assert (=> bm!14216 (= call!14219 call!14221)))

(declare-fun b!130694 () Bool)

(declare-fun e!85224 () List!1701)

(declare-fun call!14220 () List!1701)

(assert (=> b!130694 (= e!85224 call!14220)))

(declare-fun c!24157 () Bool)

(declare-fun e!85228 () List!1701)

(declare-fun bm!14217 () Bool)

(assert (=> bm!14217 (= call!14220 ($colon$colon!90 e!85228 (ite c!24157 (h!2301 (toList!846 e!84575)) (tuple2!2567 (_1!1294 (ite c!23852 (ite c!23848 (tuple2!2567 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2567 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (_2!1294 (ite c!23852 (ite c!23848 (tuple2!2567 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2567 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))))

(declare-fun c!24159 () Bool)

(assert (=> bm!14217 (= c!24159 c!24157)))

(declare-fun d!39887 () Bool)

(declare-fun e!85226 () Bool)

(assert (=> d!39887 e!85226))

(declare-fun res!62967 () Bool)

(assert (=> d!39887 (=> (not res!62967) (not e!85226))))

(declare-fun lt!67942 () List!1701)

(assert (=> d!39887 (= res!62967 (isStrictlySorted!314 lt!67942))))

(assert (=> d!39887 (= lt!67942 e!85224)))

(assert (=> d!39887 (= c!24157 (and ((_ is Cons!1697) (toList!846 e!84575)) (bvslt (_1!1294 (h!2301 (toList!846 e!84575))) (_1!1294 (ite c!23852 (ite c!23848 (tuple2!2567 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2567 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(assert (=> d!39887 (isStrictlySorted!314 (toList!846 e!84575))))

(assert (=> d!39887 (= (insertStrictlySorted!88 (toList!846 e!84575) (_1!1294 (ite c!23852 (ite c!23848 (tuple2!2567 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2567 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (_2!1294 (ite c!23852 (ite c!23848 (tuple2!2567 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2567 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))) lt!67942)))

(declare-fun b!130695 () Bool)

(declare-fun e!85227 () List!1701)

(assert (=> b!130695 (= e!85227 call!14219)))

(declare-fun c!24156 () Bool)

(declare-fun b!130696 () Bool)

(declare-fun c!24158 () Bool)

(assert (=> b!130696 (= e!85228 (ite c!24158 (t!6091 (toList!846 e!84575)) (ite c!24156 (Cons!1697 (h!2301 (toList!846 e!84575)) (t!6091 (toList!846 e!84575))) Nil!1698)))))

(declare-fun b!130697 () Bool)

(assert (=> b!130697 (= e!85228 (insertStrictlySorted!88 (t!6091 (toList!846 e!84575)) (_1!1294 (ite c!23852 (ite c!23848 (tuple2!2567 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2567 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (_2!1294 (ite c!23852 (ite c!23848 (tuple2!2567 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2567 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun bm!14218 () Bool)

(assert (=> bm!14218 (= call!14221 call!14220)))

(declare-fun b!130698 () Bool)

(declare-fun e!85225 () List!1701)

(assert (=> b!130698 (= e!85225 call!14221)))

(declare-fun b!130699 () Bool)

(assert (=> b!130699 (= c!24156 (and ((_ is Cons!1697) (toList!846 e!84575)) (bvsgt (_1!1294 (h!2301 (toList!846 e!84575))) (_1!1294 (ite c!23852 (ite c!23848 (tuple2!2567 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2567 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(assert (=> b!130699 (= e!85225 e!85227)))

(declare-fun b!130700 () Bool)

(assert (=> b!130700 (= e!85226 (contains!878 lt!67942 (tuple2!2567 (_1!1294 (ite c!23852 (ite c!23848 (tuple2!2567 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2567 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (_2!1294 (ite c!23852 (ite c!23848 (tuple2!2567 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2567 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(declare-fun b!130701 () Bool)

(assert (=> b!130701 (= e!85227 call!14219)))

(declare-fun b!130702 () Bool)

(declare-fun res!62966 () Bool)

(assert (=> b!130702 (=> (not res!62966) (not e!85226))))

(assert (=> b!130702 (= res!62966 (containsKey!171 lt!67942 (_1!1294 (ite c!23852 (ite c!23848 (tuple2!2567 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2567 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!130703 () Bool)

(assert (=> b!130703 (= e!85224 e!85225)))

(assert (=> b!130703 (= c!24158 (and ((_ is Cons!1697) (toList!846 e!84575)) (= (_1!1294 (h!2301 (toList!846 e!84575))) (_1!1294 (ite c!23852 (ite c!23848 (tuple2!2567 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2567 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(assert (= (and d!39887 c!24157) b!130694))

(assert (= (and d!39887 (not c!24157)) b!130703))

(assert (= (and b!130703 c!24158) b!130698))

(assert (= (and b!130703 (not c!24158)) b!130699))

(assert (= (and b!130699 c!24156) b!130701))

(assert (= (and b!130699 (not c!24156)) b!130695))

(assert (= (or b!130701 b!130695) bm!14216))

(assert (= (or b!130698 bm!14216) bm!14218))

(assert (= (or b!130694 bm!14218) bm!14217))

(assert (= (and bm!14217 c!24159) b!130697))

(assert (= (and bm!14217 (not c!24159)) b!130696))

(assert (= (and d!39887 res!62967) b!130702))

(assert (= (and b!130702 res!62966) b!130700))

(declare-fun m!153961 () Bool)

(assert (=> b!130702 m!153961))

(declare-fun m!153963 () Bool)

(assert (=> bm!14217 m!153963))

(declare-fun m!153965 () Bool)

(assert (=> b!130697 m!153965))

(declare-fun m!153967 () Bool)

(assert (=> d!39887 m!153967))

(declare-fun m!153969 () Bool)

(assert (=> d!39887 m!153969))

(declare-fun m!153971 () Bool)

(assert (=> b!130700 m!153971))

(assert (=> d!39353 d!39887))

(declare-fun d!39889 () Bool)

(declare-fun res!62968 () Bool)

(declare-fun e!85229 () Bool)

(assert (=> d!39889 (=> res!62968 e!85229)))

(assert (=> d!39889 (= res!62968 (and ((_ is Cons!1697) (toList!846 e!84562)) (= (_1!1294 (h!2301 (toList!846 e!84562))) (ite c!23854 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355) (select (arr!2230 (_keys!4563 newMap!16)) (index!3258 lt!67161))))))))

(assert (=> d!39889 (= (containsKey!171 (toList!846 e!84562) (ite c!23854 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355) (select (arr!2230 (_keys!4563 newMap!16)) (index!3258 lt!67161)))) e!85229)))

(declare-fun b!130704 () Bool)

(declare-fun e!85230 () Bool)

(assert (=> b!130704 (= e!85229 e!85230)))

(declare-fun res!62969 () Bool)

(assert (=> b!130704 (=> (not res!62969) (not e!85230))))

(assert (=> b!130704 (= res!62969 (and (or (not ((_ is Cons!1697) (toList!846 e!84562))) (bvsle (_1!1294 (h!2301 (toList!846 e!84562))) (ite c!23854 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355) (select (arr!2230 (_keys!4563 newMap!16)) (index!3258 lt!67161))))) ((_ is Cons!1697) (toList!846 e!84562)) (bvslt (_1!1294 (h!2301 (toList!846 e!84562))) (ite c!23854 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355) (select (arr!2230 (_keys!4563 newMap!16)) (index!3258 lt!67161))))))))

(declare-fun b!130705 () Bool)

(assert (=> b!130705 (= e!85230 (containsKey!171 (t!6091 (toList!846 e!84562)) (ite c!23854 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355) (select (arr!2230 (_keys!4563 newMap!16)) (index!3258 lt!67161)))))))

(assert (= (and d!39889 (not res!62968)) b!130704))

(assert (= (and b!130704 res!62969) b!130705))

(declare-fun m!153973 () Bool)

(assert (=> b!130705 m!153973))

(assert (=> d!39413 d!39889))

(assert (=> d!39447 d!39437))

(assert (=> d!39447 d!39439))

(declare-fun d!39891 () Bool)

(assert (=> d!39891 (isDefined!121 (getValueByKey!167 (toList!846 lt!66993) (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355)))))

(assert (=> d!39891 true))

(declare-fun _$12!396 () Unit!4037)

(assert (=> d!39891 (= (choose!801 (toList!846 lt!66993) (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355)) _$12!396)))

(declare-fun bs!5423 () Bool)

(assert (= bs!5423 d!39891))

(assert (=> bs!5423 m!151753))

(assert (=> bs!5423 m!151919))

(assert (=> bs!5423 m!151919))

(assert (=> bs!5423 m!151921))

(assert (=> d!39447 d!39891))

(declare-fun d!39893 () Bool)

(declare-fun res!62974 () Bool)

(declare-fun e!85235 () Bool)

(assert (=> d!39893 (=> res!62974 e!85235)))

(assert (=> d!39893 (= res!62974 (or ((_ is Nil!1698) (toList!846 lt!66993)) ((_ is Nil!1698) (t!6091 (toList!846 lt!66993)))))))

(assert (=> d!39893 (= (isStrictlySorted!314 (toList!846 lt!66993)) e!85235)))

(declare-fun b!130710 () Bool)

(declare-fun e!85236 () Bool)

(assert (=> b!130710 (= e!85235 e!85236)))

(declare-fun res!62975 () Bool)

(assert (=> b!130710 (=> (not res!62975) (not e!85236))))

(assert (=> b!130710 (= res!62975 (bvslt (_1!1294 (h!2301 (toList!846 lt!66993))) (_1!1294 (h!2301 (t!6091 (toList!846 lt!66993))))))))

(declare-fun b!130711 () Bool)

(assert (=> b!130711 (= e!85236 (isStrictlySorted!314 (t!6091 (toList!846 lt!66993))))))

(assert (= (and d!39893 (not res!62974)) b!130710))

(assert (= (and b!130710 res!62975) b!130711))

(declare-fun m!153975 () Bool)

(assert (=> b!130711 m!153975))

(assert (=> d!39447 d!39893))

(declare-fun d!39895 () Bool)

(assert (=> d!39895 (= (get!1463 (getValueByKey!167 (toList!846 (+!160 lt!67074 (tuple2!2567 lt!67056 (minValue!2682 (v!3153 (underlying!442 thiss!992)))))) lt!67066)) (v!3159 (getValueByKey!167 (toList!846 (+!160 lt!67074 (tuple2!2567 lt!67056 (minValue!2682 (v!3153 (underlying!442 thiss!992)))))) lt!67066)))))

(assert (=> d!39379 d!39895))

(declare-fun b!130714 () Bool)

(declare-fun e!85238 () Option!173)

(assert (=> b!130714 (= e!85238 (getValueByKey!167 (t!6091 (toList!846 (+!160 lt!67074 (tuple2!2567 lt!67056 (minValue!2682 (v!3153 (underlying!442 thiss!992))))))) lt!67066))))

(declare-fun b!130712 () Bool)

(declare-fun e!85237 () Option!173)

(assert (=> b!130712 (= e!85237 (Some!172 (_2!1294 (h!2301 (toList!846 (+!160 lt!67074 (tuple2!2567 lt!67056 (minValue!2682 (v!3153 (underlying!442 thiss!992))))))))))))

(declare-fun d!39897 () Bool)

(declare-fun c!24160 () Bool)

(assert (=> d!39897 (= c!24160 (and ((_ is Cons!1697) (toList!846 (+!160 lt!67074 (tuple2!2567 lt!67056 (minValue!2682 (v!3153 (underlying!442 thiss!992))))))) (= (_1!1294 (h!2301 (toList!846 (+!160 lt!67074 (tuple2!2567 lt!67056 (minValue!2682 (v!3153 (underlying!442 thiss!992)))))))) lt!67066)))))

(assert (=> d!39897 (= (getValueByKey!167 (toList!846 (+!160 lt!67074 (tuple2!2567 lt!67056 (minValue!2682 (v!3153 (underlying!442 thiss!992)))))) lt!67066) e!85237)))

(declare-fun b!130713 () Bool)

(assert (=> b!130713 (= e!85237 e!85238)))

(declare-fun c!24161 () Bool)

(assert (=> b!130713 (= c!24161 (and ((_ is Cons!1697) (toList!846 (+!160 lt!67074 (tuple2!2567 lt!67056 (minValue!2682 (v!3153 (underlying!442 thiss!992))))))) (not (= (_1!1294 (h!2301 (toList!846 (+!160 lt!67074 (tuple2!2567 lt!67056 (minValue!2682 (v!3153 (underlying!442 thiss!992)))))))) lt!67066))))))

(declare-fun b!130715 () Bool)

(assert (=> b!130715 (= e!85238 None!171)))

(assert (= (and d!39897 c!24160) b!130712))

(assert (= (and d!39897 (not c!24160)) b!130713))

(assert (= (and b!130713 c!24161) b!130714))

(assert (= (and b!130713 (not c!24161)) b!130715))

(declare-fun m!153977 () Bool)

(assert (=> b!130714 m!153977))

(assert (=> d!39379 d!39897))

(assert (=> bm!14104 d!39421))

(assert (=> b!129678 d!39465))

(declare-fun d!39899 () Bool)

(assert (=> d!39899 (= (apply!113 lt!67261 #b1000000000000000000000000000000000000000000000000000000000000000) (get!1463 (getValueByKey!167 (toList!846 lt!67261) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!5424 () Bool)

(assert (= bs!5424 d!39899))

(assert (=> bs!5424 m!153093))

(assert (=> bs!5424 m!153093))

(declare-fun m!153979 () Bool)

(assert (=> bs!5424 m!153979))

(assert (=> b!129737 d!39899))

(assert (=> b!129813 d!39465))

(declare-fun b!130718 () Bool)

(declare-fun e!85240 () Option!173)

(assert (=> b!130718 (= e!85240 (getValueByKey!167 (t!6091 (toList!846 lt!67418)) (_1!1294 (tuple2!2567 lt!67056 (minValue!2682 (v!3153 (underlying!442 thiss!992)))))))))

(declare-fun b!130716 () Bool)

(declare-fun e!85239 () Option!173)

(assert (=> b!130716 (= e!85239 (Some!172 (_2!1294 (h!2301 (toList!846 lt!67418)))))))

(declare-fun d!39901 () Bool)

(declare-fun c!24162 () Bool)

(assert (=> d!39901 (= c!24162 (and ((_ is Cons!1697) (toList!846 lt!67418)) (= (_1!1294 (h!2301 (toList!846 lt!67418))) (_1!1294 (tuple2!2567 lt!67056 (minValue!2682 (v!3153 (underlying!442 thiss!992))))))))))

(assert (=> d!39901 (= (getValueByKey!167 (toList!846 lt!67418) (_1!1294 (tuple2!2567 lt!67056 (minValue!2682 (v!3153 (underlying!442 thiss!992)))))) e!85239)))

(declare-fun b!130717 () Bool)

(assert (=> b!130717 (= e!85239 e!85240)))

(declare-fun c!24163 () Bool)

(assert (=> b!130717 (= c!24163 (and ((_ is Cons!1697) (toList!846 lt!67418)) (not (= (_1!1294 (h!2301 (toList!846 lt!67418))) (_1!1294 (tuple2!2567 lt!67056 (minValue!2682 (v!3153 (underlying!442 thiss!992)))))))))))

(declare-fun b!130719 () Bool)

(assert (=> b!130719 (= e!85240 None!171)))

(assert (= (and d!39901 c!24162) b!130716))

(assert (= (and d!39901 (not c!24162)) b!130717))

(assert (= (and b!130717 c!24163) b!130718))

(assert (= (and b!130717 (not c!24163)) b!130719))

(declare-fun m!153981 () Bool)

(assert (=> b!130718 m!153981))

(assert (=> b!129842 d!39901))

(declare-fun bm!14219 () Bool)

(declare-fun call!14222 () Bool)

(assert (=> bm!14219 (= call!14222 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (_keys!4563 newMap!16) (mask!7100 newMap!16)))))

(declare-fun b!130720 () Bool)

(declare-fun e!85241 () Bool)

(assert (=> b!130720 (= e!85241 call!14222)))

(declare-fun b!130721 () Bool)

(declare-fun e!85242 () Bool)

(assert (=> b!130721 (= e!85242 call!14222)))

(declare-fun d!39903 () Bool)

(declare-fun res!62977 () Bool)

(declare-fun e!85243 () Bool)

(assert (=> d!39903 (=> res!62977 e!85243)))

(assert (=> d!39903 (= res!62977 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2497 (_keys!4563 newMap!16))))))

(assert (=> d!39903 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!4563 newMap!16) (mask!7100 newMap!16)) e!85243)))

(declare-fun b!130722 () Bool)

(assert (=> b!130722 (= e!85243 e!85241)))

(declare-fun c!24164 () Bool)

(assert (=> b!130722 (= c!24164 (validKeyInArray!0 (select (arr!2230 (_keys!4563 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!130723 () Bool)

(assert (=> b!130723 (= e!85241 e!85242)))

(declare-fun lt!67945 () (_ BitVec 64))

(assert (=> b!130723 (= lt!67945 (select (arr!2230 (_keys!4563 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!67943 () Unit!4037)

(assert (=> b!130723 (= lt!67943 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!4563 newMap!16) lt!67945 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!130723 (arrayContainsKey!0 (_keys!4563 newMap!16) lt!67945 #b00000000000000000000000000000000)))

(declare-fun lt!67944 () Unit!4037)

(assert (=> b!130723 (= lt!67944 lt!67943)))

(declare-fun res!62976 () Bool)

(assert (=> b!130723 (= res!62976 (= (seekEntryOrOpen!0 (select (arr!2230 (_keys!4563 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (_keys!4563 newMap!16) (mask!7100 newMap!16)) (Found!275 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!130723 (=> (not res!62976) (not e!85242))))

(assert (= (and d!39903 (not res!62977)) b!130722))

(assert (= (and b!130722 c!24164) b!130723))

(assert (= (and b!130722 (not c!24164)) b!130720))

(assert (= (and b!130723 res!62976) b!130721))

(assert (= (or b!130721 b!130720) bm!14219))

(declare-fun m!153983 () Bool)

(assert (=> bm!14219 m!153983))

(assert (=> b!130722 m!152953))

(assert (=> b!130722 m!152953))

(assert (=> b!130722 m!152957))

(assert (=> b!130723 m!152953))

(declare-fun m!153985 () Bool)

(assert (=> b!130723 m!153985))

(declare-fun m!153987 () Bool)

(assert (=> b!130723 m!153987))

(assert (=> b!130723 m!152953))

(declare-fun m!153989 () Bool)

(assert (=> b!130723 m!153989))

(assert (=> bm!14117 d!39903))

(declare-fun d!39905 () Bool)

(assert (=> d!39905 (= (apply!113 lt!67211 #b1000000000000000000000000000000000000000000000000000000000000000) (get!1463 (getValueByKey!167 (toList!846 lt!67211) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!5425 () Bool)

(assert (= bs!5425 d!39905))

(assert (=> bs!5425 m!153879))

(assert (=> bs!5425 m!153879))

(declare-fun m!153991 () Bool)

(assert (=> bs!5425 m!153991))

(assert (=> b!129682 d!39905))

(declare-fun d!39907 () Bool)

(assert (=> d!39907 (isDefined!121 (getValueByKey!167 (toList!846 e!84562) (ite c!23854 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355) (select (arr!2230 (_keys!4563 newMap!16)) (index!3258 lt!67161)))))))

(declare-fun lt!67946 () Unit!4037)

(assert (=> d!39907 (= lt!67946 (choose!801 (toList!846 e!84562) (ite c!23854 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355) (select (arr!2230 (_keys!4563 newMap!16)) (index!3258 lt!67161)))))))

(declare-fun e!85244 () Bool)

(assert (=> d!39907 e!85244))

(declare-fun res!62978 () Bool)

(assert (=> d!39907 (=> (not res!62978) (not e!85244))))

(assert (=> d!39907 (= res!62978 (isStrictlySorted!314 (toList!846 e!84562)))))

(assert (=> d!39907 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!120 (toList!846 e!84562) (ite c!23854 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355) (select (arr!2230 (_keys!4563 newMap!16)) (index!3258 lt!67161)))) lt!67946)))

(declare-fun b!130724 () Bool)

(assert (=> b!130724 (= e!85244 (containsKey!171 (toList!846 e!84562) (ite c!23854 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355) (select (arr!2230 (_keys!4563 newMap!16)) (index!3258 lt!67161)))))))

(assert (= (and d!39907 res!62978) b!130724))

(assert (=> d!39907 m!152439))

(assert (=> d!39907 m!152439))

(assert (=> d!39907 m!152441))

(declare-fun m!153993 () Bool)

(assert (=> d!39907 m!153993))

(declare-fun m!153995 () Bool)

(assert (=> d!39907 m!153995))

(assert (=> b!130724 m!152435))

(assert (=> b!129857 d!39907))

(assert (=> b!129857 d!39735))

(assert (=> b!129857 d!39737))

(declare-fun lt!67947 () Bool)

(declare-fun d!39909 () Bool)

(assert (=> d!39909 (= lt!67947 (select (content!129 (toList!846 lt!67245)) (ite c!23852 (ite c!23848 (tuple2!2567 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2567 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!85245 () Bool)

(assert (=> d!39909 (= lt!67947 e!85245)))

(declare-fun res!62980 () Bool)

(assert (=> d!39909 (=> (not res!62980) (not e!85245))))

(assert (=> d!39909 (= res!62980 ((_ is Cons!1697) (toList!846 lt!67245)))))

(assert (=> d!39909 (= (contains!878 (toList!846 lt!67245) (ite c!23852 (ite c!23848 (tuple2!2567 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2567 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) lt!67947)))

(declare-fun b!130725 () Bool)

(declare-fun e!85246 () Bool)

(assert (=> b!130725 (= e!85245 e!85246)))

(declare-fun res!62979 () Bool)

(assert (=> b!130725 (=> res!62979 e!85246)))

(assert (=> b!130725 (= res!62979 (= (h!2301 (toList!846 lt!67245)) (ite c!23852 (ite c!23848 (tuple2!2567 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2567 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!130726 () Bool)

(assert (=> b!130726 (= e!85246 (contains!878 (t!6091 (toList!846 lt!67245)) (ite c!23852 (ite c!23848 (tuple2!2567 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2567 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (= (and d!39909 res!62980) b!130725))

(assert (= (and b!130725 (not res!62979)) b!130726))

(declare-fun m!153997 () Bool)

(assert (=> d!39909 m!153997))

(declare-fun m!153999 () Bool)

(assert (=> d!39909 m!153999))

(declare-fun m!154001 () Bool)

(assert (=> b!130726 m!154001))

(assert (=> b!129718 d!39909))

(declare-fun d!39911 () Bool)

(assert (=> d!39911 (arrayContainsKey!0 (_keys!4563 newMap!16) lt!67430 #b00000000000000000000000000000000)))

(declare-fun lt!67948 () Unit!4037)

(assert (=> d!39911 (= lt!67948 (choose!13 (_keys!4563 newMap!16) lt!67430 #b00000000000000000000000000000000))))

(assert (=> d!39911 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!39911 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!4563 newMap!16) lt!67430 #b00000000000000000000000000000000) lt!67948)))

(declare-fun bs!5426 () Bool)

(assert (= bs!5426 d!39911))

(assert (=> bs!5426 m!152425))

(declare-fun m!154003 () Bool)

(assert (=> bs!5426 m!154003))

(assert (=> b!129856 d!39911))

(declare-fun d!39913 () Bool)

(declare-fun res!62981 () Bool)

(declare-fun e!85247 () Bool)

(assert (=> d!39913 (=> res!62981 e!85247)))

(assert (=> d!39913 (= res!62981 (= (select (arr!2230 (_keys!4563 newMap!16)) #b00000000000000000000000000000000) lt!67430))))

(assert (=> d!39913 (= (arrayContainsKey!0 (_keys!4563 newMap!16) lt!67430 #b00000000000000000000000000000000) e!85247)))

(declare-fun b!130727 () Bool)

(declare-fun e!85248 () Bool)

(assert (=> b!130727 (= e!85247 e!85248)))

(declare-fun res!62982 () Bool)

(assert (=> b!130727 (=> (not res!62982) (not e!85248))))

(assert (=> b!130727 (= res!62982 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2497 (_keys!4563 newMap!16))))))

(declare-fun b!130728 () Bool)

(assert (=> b!130728 (= e!85248 (arrayContainsKey!0 (_keys!4563 newMap!16) lt!67430 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!39913 (not res!62981)) b!130727))

(assert (= (and b!130727 res!62982) b!130728))

(assert (=> d!39913 m!152019))

(declare-fun m!154005 () Bool)

(assert (=> b!130728 m!154005))

(assert (=> b!129856 d!39913))

(declare-fun b!130729 () Bool)

(declare-fun e!85250 () SeekEntryResult!275)

(assert (=> b!130729 (= e!85250 Undefined!275)))

(declare-fun b!130730 () Bool)

(declare-fun e!85251 () SeekEntryResult!275)

(assert (=> b!130730 (= e!85250 e!85251)))

(declare-fun lt!67950 () (_ BitVec 64))

(declare-fun lt!67951 () SeekEntryResult!275)

(assert (=> b!130730 (= lt!67950 (select (arr!2230 (_keys!4563 newMap!16)) (index!3259 lt!67951)))))

(declare-fun c!24167 () Bool)

(assert (=> b!130730 (= c!24167 (= lt!67950 (select (arr!2230 (_keys!4563 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun d!39915 () Bool)

(declare-fun lt!67949 () SeekEntryResult!275)

(assert (=> d!39915 (and (or ((_ is Undefined!275) lt!67949) (not ((_ is Found!275) lt!67949)) (and (bvsge (index!3258 lt!67949) #b00000000000000000000000000000000) (bvslt (index!3258 lt!67949) (size!2497 (_keys!4563 newMap!16))))) (or ((_ is Undefined!275) lt!67949) ((_ is Found!275) lt!67949) (not ((_ is MissingZero!275) lt!67949)) (and (bvsge (index!3257 lt!67949) #b00000000000000000000000000000000) (bvslt (index!3257 lt!67949) (size!2497 (_keys!4563 newMap!16))))) (or ((_ is Undefined!275) lt!67949) ((_ is Found!275) lt!67949) ((_ is MissingZero!275) lt!67949) (not ((_ is MissingVacant!275) lt!67949)) (and (bvsge (index!3260 lt!67949) #b00000000000000000000000000000000) (bvslt (index!3260 lt!67949) (size!2497 (_keys!4563 newMap!16))))) (or ((_ is Undefined!275) lt!67949) (ite ((_ is Found!275) lt!67949) (= (select (arr!2230 (_keys!4563 newMap!16)) (index!3258 lt!67949)) (select (arr!2230 (_keys!4563 newMap!16)) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!275) lt!67949) (= (select (arr!2230 (_keys!4563 newMap!16)) (index!3257 lt!67949)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!275) lt!67949) (= (select (arr!2230 (_keys!4563 newMap!16)) (index!3260 lt!67949)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!39915 (= lt!67949 e!85250)))

(declare-fun c!24165 () Bool)

(assert (=> d!39915 (= c!24165 (and ((_ is Intermediate!275) lt!67951) (undefined!1087 lt!67951)))))

(assert (=> d!39915 (= lt!67951 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!2230 (_keys!4563 newMap!16)) #b00000000000000000000000000000000) (mask!7100 newMap!16)) (select (arr!2230 (_keys!4563 newMap!16)) #b00000000000000000000000000000000) (_keys!4563 newMap!16) (mask!7100 newMap!16)))))

(assert (=> d!39915 (validMask!0 (mask!7100 newMap!16))))

(assert (=> d!39915 (= (seekEntryOrOpen!0 (select (arr!2230 (_keys!4563 newMap!16)) #b00000000000000000000000000000000) (_keys!4563 newMap!16) (mask!7100 newMap!16)) lt!67949)))

(declare-fun b!130731 () Bool)

(declare-fun e!85249 () SeekEntryResult!275)

(assert (=> b!130731 (= e!85249 (MissingZero!275 (index!3259 lt!67951)))))

(declare-fun b!130732 () Bool)

(assert (=> b!130732 (= e!85249 (seekKeyOrZeroReturnVacant!0 (x!15269 lt!67951) (index!3259 lt!67951) (index!3259 lt!67951) (select (arr!2230 (_keys!4563 newMap!16)) #b00000000000000000000000000000000) (_keys!4563 newMap!16) (mask!7100 newMap!16)))))

(declare-fun b!130733 () Bool)

(declare-fun c!24166 () Bool)

(assert (=> b!130733 (= c!24166 (= lt!67950 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!130733 (= e!85251 e!85249)))

(declare-fun b!130734 () Bool)

(assert (=> b!130734 (= e!85251 (Found!275 (index!3259 lt!67951)))))

(assert (= (and d!39915 c!24165) b!130729))

(assert (= (and d!39915 (not c!24165)) b!130730))

(assert (= (and b!130730 c!24167) b!130734))

(assert (= (and b!130730 (not c!24167)) b!130733))

(assert (= (and b!130733 c!24166) b!130731))

(assert (= (and b!130733 (not c!24166)) b!130732))

(declare-fun m!154007 () Bool)

(assert (=> b!130730 m!154007))

(declare-fun m!154009 () Bool)

(assert (=> d!39915 m!154009))

(assert (=> d!39915 m!152025))

(declare-fun m!154011 () Bool)

(assert (=> d!39915 m!154011))

(assert (=> d!39915 m!152019))

(declare-fun m!154013 () Bool)

(assert (=> d!39915 m!154013))

(assert (=> d!39915 m!154013))

(assert (=> d!39915 m!152019))

(declare-fun m!154015 () Bool)

(assert (=> d!39915 m!154015))

(declare-fun m!154017 () Bool)

(assert (=> d!39915 m!154017))

(assert (=> b!130732 m!152019))

(declare-fun m!154019 () Bool)

(assert (=> b!130732 m!154019))

(assert (=> b!129856 d!39915))

(declare-fun d!39917 () Bool)

(assert (=> d!39917 (= (get!1463 (getValueByKey!167 (toList!846 lt!67071) (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))) (v!3159 (getValueByKey!167 (toList!846 lt!67071) (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(assert (=> d!39341 d!39917))

(assert (=> d!39341 d!39733))

(declare-fun d!39919 () Bool)

(declare-fun e!85253 () Bool)

(assert (=> d!39919 e!85253))

(declare-fun res!62983 () Bool)

(assert (=> d!39919 (=> res!62983 e!85253)))

(declare-fun lt!67954 () Bool)

(assert (=> d!39919 (= res!62983 (not lt!67954))))

(declare-fun lt!67955 () Bool)

(assert (=> d!39919 (= lt!67954 lt!67955)))

(declare-fun lt!67952 () Unit!4037)

(declare-fun e!85252 () Unit!4037)

(assert (=> d!39919 (= lt!67952 e!85252)))

(declare-fun c!24168 () Bool)

(assert (=> d!39919 (= c!24168 lt!67955)))

(assert (=> d!39919 (= lt!67955 (containsKey!171 (toList!846 lt!67229) (_1!1294 (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2682 (v!3153 (underlying!442 thiss!992)))))))))

(assert (=> d!39919 (= (contains!876 lt!67229 (_1!1294 (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2682 (v!3153 (underlying!442 thiss!992)))))) lt!67954)))

(declare-fun b!130735 () Bool)

(declare-fun lt!67953 () Unit!4037)

(assert (=> b!130735 (= e!85252 lt!67953)))

(assert (=> b!130735 (= lt!67953 (lemmaContainsKeyImpliesGetValueByKeyDefined!120 (toList!846 lt!67229) (_1!1294 (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2682 (v!3153 (underlying!442 thiss!992)))))))))

(assert (=> b!130735 (isDefined!121 (getValueByKey!167 (toList!846 lt!67229) (_1!1294 (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2682 (v!3153 (underlying!442 thiss!992)))))))))

(declare-fun b!130736 () Bool)

(declare-fun Unit!4092 () Unit!4037)

(assert (=> b!130736 (= e!85252 Unit!4092)))

(declare-fun b!130737 () Bool)

(assert (=> b!130737 (= e!85253 (isDefined!121 (getValueByKey!167 (toList!846 lt!67229) (_1!1294 (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2682 (v!3153 (underlying!442 thiss!992))))))))))

(assert (= (and d!39919 c!24168) b!130735))

(assert (= (and d!39919 (not c!24168)) b!130736))

(assert (= (and d!39919 (not res!62983)) b!130737))

(declare-fun m!154021 () Bool)

(assert (=> d!39919 m!154021))

(declare-fun m!154023 () Bool)

(assert (=> b!130735 m!154023))

(assert (=> b!130735 m!152091))

(assert (=> b!130735 m!152091))

(declare-fun m!154025 () Bool)

(assert (=> b!130735 m!154025))

(assert (=> b!130737 m!152091))

(assert (=> b!130737 m!152091))

(assert (=> b!130737 m!154025))

(assert (=> d!39345 d!39919))

(declare-fun b!130740 () Bool)

(declare-fun e!85255 () Option!173)

(assert (=> b!130740 (= e!85255 (getValueByKey!167 (t!6091 lt!67226) (_1!1294 (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2682 (v!3153 (underlying!442 thiss!992)))))))))

(declare-fun b!130738 () Bool)

(declare-fun e!85254 () Option!173)

(assert (=> b!130738 (= e!85254 (Some!172 (_2!1294 (h!2301 lt!67226))))))

(declare-fun d!39921 () Bool)

(declare-fun c!24169 () Bool)

(assert (=> d!39921 (= c!24169 (and ((_ is Cons!1697) lt!67226) (= (_1!1294 (h!2301 lt!67226)) (_1!1294 (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2682 (v!3153 (underlying!442 thiss!992))))))))))

(assert (=> d!39921 (= (getValueByKey!167 lt!67226 (_1!1294 (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2682 (v!3153 (underlying!442 thiss!992)))))) e!85254)))

(declare-fun b!130739 () Bool)

(assert (=> b!130739 (= e!85254 e!85255)))

(declare-fun c!24170 () Bool)

(assert (=> b!130739 (= c!24170 (and ((_ is Cons!1697) lt!67226) (not (= (_1!1294 (h!2301 lt!67226)) (_1!1294 (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2682 (v!3153 (underlying!442 thiss!992)))))))))))

(declare-fun b!130741 () Bool)

(assert (=> b!130741 (= e!85255 None!171)))

(assert (= (and d!39921 c!24169) b!130738))

(assert (= (and d!39921 (not c!24169)) b!130739))

(assert (= (and b!130739 c!24170) b!130740))

(assert (= (and b!130739 (not c!24170)) b!130741))

(declare-fun m!154027 () Bool)

(assert (=> b!130740 m!154027))

(assert (=> d!39345 d!39921))

(declare-fun d!39923 () Bool)

(assert (=> d!39923 (= (getValueByKey!167 lt!67226 (_1!1294 (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2682 (v!3153 (underlying!442 thiss!992)))))) (Some!172 (_2!1294 (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2682 (v!3153 (underlying!442 thiss!992)))))))))

(declare-fun lt!67956 () Unit!4037)

(assert (=> d!39923 (= lt!67956 (choose!802 lt!67226 (_1!1294 (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2682 (v!3153 (underlying!442 thiss!992))))) (_2!1294 (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2682 (v!3153 (underlying!442 thiss!992)))))))))

(declare-fun e!85256 () Bool)

(assert (=> d!39923 e!85256))

(declare-fun res!62984 () Bool)

(assert (=> d!39923 (=> (not res!62984) (not e!85256))))

(assert (=> d!39923 (= res!62984 (isStrictlySorted!314 lt!67226))))

(assert (=> d!39923 (= (lemmaContainsTupThenGetReturnValue!85 lt!67226 (_1!1294 (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2682 (v!3153 (underlying!442 thiss!992))))) (_2!1294 (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2682 (v!3153 (underlying!442 thiss!992)))))) lt!67956)))

(declare-fun b!130742 () Bool)

(declare-fun res!62985 () Bool)

(assert (=> b!130742 (=> (not res!62985) (not e!85256))))

(assert (=> b!130742 (= res!62985 (containsKey!171 lt!67226 (_1!1294 (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2682 (v!3153 (underlying!442 thiss!992)))))))))

(declare-fun b!130743 () Bool)

(assert (=> b!130743 (= e!85256 (contains!878 lt!67226 (tuple2!2567 (_1!1294 (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2682 (v!3153 (underlying!442 thiss!992))))) (_2!1294 (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2682 (v!3153 (underlying!442 thiss!992))))))))))

(assert (= (and d!39923 res!62984) b!130742))

(assert (= (and b!130742 res!62985) b!130743))

(assert (=> d!39923 m!152085))

(declare-fun m!154029 () Bool)

(assert (=> d!39923 m!154029))

(declare-fun m!154031 () Bool)

(assert (=> d!39923 m!154031))

(declare-fun m!154033 () Bool)

(assert (=> b!130742 m!154033))

(declare-fun m!154035 () Bool)

(assert (=> b!130743 m!154035))

(assert (=> d!39345 d!39923))

(declare-fun bm!14220 () Bool)

(declare-fun call!14223 () List!1701)

(declare-fun call!14225 () List!1701)

(assert (=> bm!14220 (= call!14223 call!14225)))

(declare-fun b!130744 () Bool)

(declare-fun e!85257 () List!1701)

(declare-fun call!14224 () List!1701)

(assert (=> b!130744 (= e!85257 call!14224)))

(declare-fun e!85261 () List!1701)

(declare-fun c!24172 () Bool)

(declare-fun bm!14221 () Bool)

(assert (=> bm!14221 (= call!14224 ($colon$colon!90 e!85261 (ite c!24172 (h!2301 (toList!846 call!14004)) (tuple2!2567 (_1!1294 (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2682 (v!3153 (underlying!442 thiss!992))))) (_2!1294 (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2682 (v!3153 (underlying!442 thiss!992)))))))))))

(declare-fun c!24174 () Bool)

(assert (=> bm!14221 (= c!24174 c!24172)))

(declare-fun d!39925 () Bool)

(declare-fun e!85259 () Bool)

(assert (=> d!39925 e!85259))

(declare-fun res!62987 () Bool)

(assert (=> d!39925 (=> (not res!62987) (not e!85259))))

(declare-fun lt!67957 () List!1701)

(assert (=> d!39925 (= res!62987 (isStrictlySorted!314 lt!67957))))

(assert (=> d!39925 (= lt!67957 e!85257)))

(assert (=> d!39925 (= c!24172 (and ((_ is Cons!1697) (toList!846 call!14004)) (bvslt (_1!1294 (h!2301 (toList!846 call!14004))) (_1!1294 (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2682 (v!3153 (underlying!442 thiss!992))))))))))

(assert (=> d!39925 (isStrictlySorted!314 (toList!846 call!14004))))

(assert (=> d!39925 (= (insertStrictlySorted!88 (toList!846 call!14004) (_1!1294 (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2682 (v!3153 (underlying!442 thiss!992))))) (_2!1294 (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2682 (v!3153 (underlying!442 thiss!992)))))) lt!67957)))

(declare-fun b!130745 () Bool)

(declare-fun e!85260 () List!1701)

(assert (=> b!130745 (= e!85260 call!14223)))

(declare-fun c!24173 () Bool)

(declare-fun c!24171 () Bool)

(declare-fun b!130746 () Bool)

(assert (=> b!130746 (= e!85261 (ite c!24173 (t!6091 (toList!846 call!14004)) (ite c!24171 (Cons!1697 (h!2301 (toList!846 call!14004)) (t!6091 (toList!846 call!14004))) Nil!1698)))))

(declare-fun b!130747 () Bool)

(assert (=> b!130747 (= e!85261 (insertStrictlySorted!88 (t!6091 (toList!846 call!14004)) (_1!1294 (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2682 (v!3153 (underlying!442 thiss!992))))) (_2!1294 (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2682 (v!3153 (underlying!442 thiss!992)))))))))

(declare-fun bm!14222 () Bool)

(assert (=> bm!14222 (= call!14225 call!14224)))

(declare-fun b!130748 () Bool)

(declare-fun e!85258 () List!1701)

(assert (=> b!130748 (= e!85258 call!14225)))

(declare-fun b!130749 () Bool)

(assert (=> b!130749 (= c!24171 (and ((_ is Cons!1697) (toList!846 call!14004)) (bvsgt (_1!1294 (h!2301 (toList!846 call!14004))) (_1!1294 (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2682 (v!3153 (underlying!442 thiss!992))))))))))

(assert (=> b!130749 (= e!85258 e!85260)))

(declare-fun b!130750 () Bool)

(assert (=> b!130750 (= e!85259 (contains!878 lt!67957 (tuple2!2567 (_1!1294 (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2682 (v!3153 (underlying!442 thiss!992))))) (_2!1294 (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2682 (v!3153 (underlying!442 thiss!992))))))))))

(declare-fun b!130751 () Bool)

(assert (=> b!130751 (= e!85260 call!14223)))

(declare-fun b!130752 () Bool)

(declare-fun res!62986 () Bool)

(assert (=> b!130752 (=> (not res!62986) (not e!85259))))

(assert (=> b!130752 (= res!62986 (containsKey!171 lt!67957 (_1!1294 (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2682 (v!3153 (underlying!442 thiss!992)))))))))

(declare-fun b!130753 () Bool)

(assert (=> b!130753 (= e!85257 e!85258)))

(assert (=> b!130753 (= c!24173 (and ((_ is Cons!1697) (toList!846 call!14004)) (= (_1!1294 (h!2301 (toList!846 call!14004))) (_1!1294 (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2682 (v!3153 (underlying!442 thiss!992))))))))))

(assert (= (and d!39925 c!24172) b!130744))

(assert (= (and d!39925 (not c!24172)) b!130753))

(assert (= (and b!130753 c!24173) b!130748))

(assert (= (and b!130753 (not c!24173)) b!130749))

(assert (= (and b!130749 c!24171) b!130751))

(assert (= (and b!130749 (not c!24171)) b!130745))

(assert (= (or b!130751 b!130745) bm!14220))

(assert (= (or b!130748 bm!14220) bm!14222))

(assert (= (or b!130744 bm!14222) bm!14221))

(assert (= (and bm!14221 c!24174) b!130747))

(assert (= (and bm!14221 (not c!24174)) b!130746))

(assert (= (and d!39925 res!62987) b!130752))

(assert (= (and b!130752 res!62986) b!130750))

(declare-fun m!154037 () Bool)

(assert (=> b!130752 m!154037))

(declare-fun m!154039 () Bool)

(assert (=> bm!14221 m!154039))

(declare-fun m!154041 () Bool)

(assert (=> b!130747 m!154041))

(declare-fun m!154043 () Bool)

(assert (=> d!39925 m!154043))

(declare-fun m!154045 () Bool)

(assert (=> d!39925 m!154045))

(declare-fun m!154047 () Bool)

(assert (=> b!130750 m!154047))

(assert (=> d!39345 d!39925))

(assert (=> bm!14081 d!39741))

(declare-fun d!39927 () Bool)

(assert (=> d!39927 (= (apply!113 lt!67261 (select (arr!2230 (_keys!4563 newMap!16)) #b00000000000000000000000000000000)) (get!1463 (getValueByKey!167 (toList!846 lt!67261) (select (arr!2230 (_keys!4563 newMap!16)) #b00000000000000000000000000000000))))))

(declare-fun bs!5427 () Bool)

(assert (= bs!5427 d!39927))

(assert (=> bs!5427 m!152019))

(assert (=> bs!5427 m!153773))

(assert (=> bs!5427 m!153773))

(declare-fun m!154049 () Bool)

(assert (=> bs!5427 m!154049))

(assert (=> b!129727 d!39927))

(declare-fun c!24175 () Bool)

(declare-fun d!39929 () Bool)

(assert (=> d!39929 (= c!24175 ((_ is ValueCellFull!1085) (select (arr!2231 (ite c!23852 (_values!2806 newMap!16) lt!67158)) #b00000000000000000000000000000000)))))

(declare-fun e!85262 () V!3457)

(assert (=> d!39929 (= (get!1459 (select (arr!2231 (ite c!23852 (_values!2806 newMap!16) lt!67158)) #b00000000000000000000000000000000) (dynLambda!414 (defaultEntry!2823 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000)) e!85262)))

(declare-fun b!130754 () Bool)

(assert (=> b!130754 (= e!85262 (get!1461 (select (arr!2231 (ite c!23852 (_values!2806 newMap!16) lt!67158)) #b00000000000000000000000000000000) (dynLambda!414 (defaultEntry!2823 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!130755 () Bool)

(assert (=> b!130755 (= e!85262 (get!1462 (select (arr!2231 (ite c!23852 (_values!2806 newMap!16) lt!67158)) #b00000000000000000000000000000000) (dynLambda!414 (defaultEntry!2823 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!39929 c!24175) b!130754))

(assert (= (and d!39929 (not c!24175)) b!130755))

(assert (=> b!130754 m!152175))

(assert (=> b!130754 m!152071))

(declare-fun m!154051 () Bool)

(assert (=> b!130754 m!154051))

(assert (=> b!130755 m!152175))

(assert (=> b!130755 m!152071))

(declare-fun m!154053 () Bool)

(assert (=> b!130755 m!154053))

(assert (=> b!129727 d!39929))

(declare-fun d!39931 () Bool)

(declare-fun res!62988 () Bool)

(declare-fun e!85263 () Bool)

(assert (=> d!39931 (=> res!62988 e!85263)))

(assert (=> d!39931 (= res!62988 (and ((_ is Cons!1697) (t!6091 (toList!846 lt!66993))) (= (_1!1294 (h!2301 (t!6091 (toList!846 lt!66993)))) (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355))))))

(assert (=> d!39931 (= (containsKey!171 (t!6091 (toList!846 lt!66993)) (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355)) e!85263)))

(declare-fun b!130756 () Bool)

(declare-fun e!85264 () Bool)

(assert (=> b!130756 (= e!85263 e!85264)))

(declare-fun res!62989 () Bool)

(assert (=> b!130756 (=> (not res!62989) (not e!85264))))

(assert (=> b!130756 (= res!62989 (and (or (not ((_ is Cons!1697) (t!6091 (toList!846 lt!66993)))) (bvsle (_1!1294 (h!2301 (t!6091 (toList!846 lt!66993)))) (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355))) ((_ is Cons!1697) (t!6091 (toList!846 lt!66993))) (bvslt (_1!1294 (h!2301 (t!6091 (toList!846 lt!66993)))) (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355))))))

(declare-fun b!130757 () Bool)

(assert (=> b!130757 (= e!85264 (containsKey!171 (t!6091 (t!6091 (toList!846 lt!66993))) (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355)))))

(assert (= (and d!39931 (not res!62988)) b!130756))

(assert (= (and b!130756 res!62989) b!130757))

(assert (=> b!130757 m!151753))

(declare-fun m!154055 () Bool)

(assert (=> b!130757 m!154055))

(assert (=> b!129698 d!39931))

(declare-fun bm!14223 () Bool)

(declare-fun call!14226 () Bool)

(declare-fun c!24176 () Bool)

(assert (=> bm!14223 (= call!14226 (arrayNoDuplicates!0 (_keys!4563 (v!3153 (underlying!442 thiss!992))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!24176 (Cons!1699 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) #b00000000000000000000000000000000) Nil!1700) Nil!1700)))))

(declare-fun b!130758 () Bool)

(declare-fun e!85267 () Bool)

(assert (=> b!130758 (= e!85267 call!14226)))

(declare-fun b!130759 () Bool)

(declare-fun e!85268 () Bool)

(declare-fun e!85266 () Bool)

(assert (=> b!130759 (= e!85268 e!85266)))

(declare-fun res!62992 () Bool)

(assert (=> b!130759 (=> (not res!62992) (not e!85266))))

(declare-fun e!85265 () Bool)

(assert (=> b!130759 (= res!62992 (not e!85265))))

(declare-fun res!62990 () Bool)

(assert (=> b!130759 (=> (not res!62990) (not e!85265))))

(assert (=> b!130759 (= res!62990 (validKeyInArray!0 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun d!39933 () Bool)

(declare-fun res!62991 () Bool)

(assert (=> d!39933 (=> res!62991 e!85268)))

(assert (=> d!39933 (= res!62991 (bvsge #b00000000000000000000000000000000 (size!2497 (_keys!4563 (v!3153 (underlying!442 thiss!992))))))))

(assert (=> d!39933 (= (arrayNoDuplicates!0 (_keys!4563 (v!3153 (underlying!442 thiss!992))) #b00000000000000000000000000000000 Nil!1700) e!85268)))

(declare-fun b!130760 () Bool)

(assert (=> b!130760 (= e!85267 call!14226)))

(declare-fun b!130761 () Bool)

(assert (=> b!130761 (= e!85266 e!85267)))

(assert (=> b!130761 (= c!24176 (validKeyInArray!0 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun b!130762 () Bool)

(assert (=> b!130762 (= e!85265 (contains!879 Nil!1700 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) #b00000000000000000000000000000000)))))

(assert (= (and d!39933 (not res!62991)) b!130759))

(assert (= (and b!130759 res!62990) b!130762))

(assert (= (and b!130759 res!62992) b!130761))

(assert (= (and b!130761 c!24176) b!130760))

(assert (= (and b!130761 (not c!24176)) b!130758))

(assert (= (or b!130760 b!130758) bm!14223))

(assert (=> bm!14223 m!153045))

(declare-fun m!154057 () Bool)

(assert (=> bm!14223 m!154057))

(assert (=> b!130759 m!153045))

(assert (=> b!130759 m!153045))

(assert (=> b!130759 m!153047))

(assert (=> b!130761 m!153045))

(assert (=> b!130761 m!153045))

(assert (=> b!130761 m!153047))

(assert (=> b!130762 m!153045))

(assert (=> b!130762 m!153045))

(declare-fun m!154059 () Bool)

(assert (=> b!130762 m!154059))

(assert (=> b!129894 d!39933))

(declare-fun d!39935 () Bool)

(declare-fun lt!67960 () Bool)

(declare-fun content!130 (List!1703) (InoxSet (_ BitVec 64)))

(assert (=> d!39935 (= lt!67960 (select (content!130 Nil!1700) (select (arr!2230 (_keys!4563 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun e!85274 () Bool)

(assert (=> d!39935 (= lt!67960 e!85274)))

(declare-fun res!62998 () Bool)

(assert (=> d!39935 (=> (not res!62998) (not e!85274))))

(assert (=> d!39935 (= res!62998 ((_ is Cons!1699) Nil!1700))))

(assert (=> d!39935 (= (contains!879 Nil!1700 (select (arr!2230 (_keys!4563 newMap!16)) #b00000000000000000000000000000000)) lt!67960)))

(declare-fun b!130767 () Bool)

(declare-fun e!85273 () Bool)

(assert (=> b!130767 (= e!85274 e!85273)))

(declare-fun res!62997 () Bool)

(assert (=> b!130767 (=> res!62997 e!85273)))

(assert (=> b!130767 (= res!62997 (= (h!2303 Nil!1700) (select (arr!2230 (_keys!4563 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!130768 () Bool)

(assert (=> b!130768 (= e!85273 (contains!879 (t!6101 Nil!1700) (select (arr!2230 (_keys!4563 newMap!16)) #b00000000000000000000000000000000)))))

(assert (= (and d!39935 res!62998) b!130767))

(assert (= (and b!130767 (not res!62997)) b!130768))

(declare-fun m!154061 () Bool)

(assert (=> d!39935 m!154061))

(assert (=> d!39935 m!152019))

(declare-fun m!154063 () Bool)

(assert (=> d!39935 m!154063))

(assert (=> b!130768 m!152019))

(declare-fun m!154065 () Bool)

(assert (=> b!130768 m!154065))

(assert (=> b!129941 d!39935))

(declare-fun d!39937 () Bool)

(declare-fun lt!67961 () Bool)

(assert (=> d!39937 (= lt!67961 (select (content!129 (toList!846 lt!67444)) (tuple2!2567 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!85275 () Bool)

(assert (=> d!39937 (= lt!67961 e!85275)))

(declare-fun res!63000 () Bool)

(assert (=> d!39937 (=> (not res!63000) (not e!85275))))

(assert (=> d!39937 (= res!63000 ((_ is Cons!1697) (toList!846 lt!67444)))))

(assert (=> d!39937 (= (contains!878 (toList!846 lt!67444) (tuple2!2567 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!67961)))

(declare-fun b!130769 () Bool)

(declare-fun e!85276 () Bool)

(assert (=> b!130769 (= e!85275 e!85276)))

(declare-fun res!62999 () Bool)

(assert (=> b!130769 (=> res!62999 e!85276)))

(assert (=> b!130769 (= res!62999 (= (h!2301 (toList!846 lt!67444)) (tuple2!2567 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!130770 () Bool)

(assert (=> b!130770 (= e!85276 (contains!878 (t!6091 (toList!846 lt!67444)) (tuple2!2567 (select (arr!2230 (_keys!4563 (v!3153 (underlying!442 thiss!992)))) from!355) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!39937 res!63000) b!130769))

(assert (= (and b!130769 (not res!62999)) b!130770))

(declare-fun m!154067 () Bool)

(assert (=> d!39937 m!154067))

(declare-fun m!154069 () Bool)

(assert (=> d!39937 m!154069))

(declare-fun m!154071 () Bool)

(assert (=> b!130770 m!154071))

(assert (=> b!129891 d!39937))

(declare-fun d!39939 () Bool)

(declare-fun e!85277 () Bool)

(assert (=> d!39939 e!85277))

(declare-fun res!63001 () Bool)

(assert (=> d!39939 (=> (not res!63001) (not e!85277))))

(declare-fun lt!67965 () ListLongMap!1661)

(assert (=> d!39939 (= res!63001 (contains!876 lt!67965 (_1!1294 (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!67962 () List!1701)

(assert (=> d!39939 (= lt!67965 (ListLongMap!1662 lt!67962))))

(declare-fun lt!67963 () Unit!4037)

(declare-fun lt!67964 () Unit!4037)

(assert (=> d!39939 (= lt!67963 lt!67964)))

(assert (=> d!39939 (= (getValueByKey!167 lt!67962 (_1!1294 (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!172 (_2!1294 (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!39939 (= lt!67964 (lemmaContainsTupThenGetReturnValue!85 lt!67962 (_1!1294 (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1294 (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!39939 (= lt!67962 (insertStrictlySorted!88 (toList!846 (getCurrentListMap!515 (_keys!4563 newMap!16) (_values!2806 newMap!16) (mask!7100 newMap!16) (extraKeys!2596 newMap!16) (zeroValue!2682 newMap!16) (minValue!2682 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2823 newMap!16))) (_1!1294 (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1294 (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!39939 (= (+!160 (getCurrentListMap!515 (_keys!4563 newMap!16) (_values!2806 newMap!16) (mask!7100 newMap!16) (extraKeys!2596 newMap!16) (zeroValue!2682 newMap!16) (minValue!2682 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2823 newMap!16)) (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!67965)))

(declare-fun b!130771 () Bool)

(declare-fun res!63002 () Bool)

(assert (=> b!130771 (=> (not res!63002) (not e!85277))))

(assert (=> b!130771 (= res!63002 (= (getValueByKey!167 (toList!846 lt!67965) (_1!1294 (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!172 (_2!1294 (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!130772 () Bool)

(assert (=> b!130772 (= e!85277 (contains!878 (toList!846 lt!67965) (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!39939 res!63001) b!130771))

(assert (= (and b!130771 res!63002) b!130772))

(declare-fun m!154073 () Bool)

(assert (=> d!39939 m!154073))

(declare-fun m!154075 () Bool)

(assert (=> d!39939 m!154075))

(declare-fun m!154077 () Bool)

(assert (=> d!39939 m!154077))

(declare-fun m!154079 () Bool)

(assert (=> d!39939 m!154079))

(declare-fun m!154081 () Bool)

(assert (=> b!130771 m!154081))

(declare-fun m!154083 () Bool)

(assert (=> b!130772 m!154083))

(assert (=> d!39349 d!39939))

(assert (=> d!39349 d!39339))

(declare-fun d!39941 () Bool)

(assert (=> d!39941 (= (+!160 (getCurrentListMap!515 (_keys!4563 newMap!16) (_values!2806 newMap!16) (mask!7100 newMap!16) (extraKeys!2596 newMap!16) (zeroValue!2682 newMap!16) (minValue!2682 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2823 newMap!16)) (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (getCurrentListMap!515 (_keys!4563 newMap!16) (_values!2806 newMap!16) (mask!7100 newMap!16) lt!67156 (zeroValue!2682 newMap!16) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) #b00000000000000000000000000000000 (defaultEntry!2823 newMap!16)))))

(assert (=> d!39941 true))

(declare-fun _$8!115 () Unit!4037)

(assert (=> d!39941 (= (choose!793 (_keys!4563 newMap!16) (_values!2806 newMap!16) (mask!7100 newMap!16) (extraKeys!2596 newMap!16) lt!67156 (zeroValue!2682 newMap!16) (minValue!2682 newMap!16) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2823 newMap!16)) _$8!115)))

(declare-fun bs!5428 () Bool)

(assert (= bs!5428 d!39941))

(assert (=> bs!5428 m!151849))

(assert (=> bs!5428 m!151849))

(assert (=> bs!5428 m!152099))

(assert (=> bs!5428 m!151751))

(assert (=> bs!5428 m!152097))

(assert (=> d!39349 d!39941))

(assert (=> d!39349 d!39451))

(declare-fun b!130773 () Bool)

(declare-fun res!63011 () Bool)

(declare-fun e!85288 () Bool)

(assert (=> b!130773 (=> (not res!63011) (not e!85288))))

(declare-fun e!85285 () Bool)

(assert (=> b!130773 (= res!63011 e!85285)))

(declare-fun res!63004 () Bool)

(assert (=> b!130773 (=> res!63004 e!85285)))

(declare-fun e!85281 () Bool)

(assert (=> b!130773 (= res!63004 (not e!85281))))

(declare-fun res!63009 () Bool)

(assert (=> b!130773 (=> (not res!63009) (not e!85281))))

(assert (=> b!130773 (= res!63009 (bvslt #b00000000000000000000000000000000 (size!2497 (_keys!4563 newMap!16))))))

(declare-fun b!130774 () Bool)

(declare-fun e!85290 () Bool)

(declare-fun lt!67981 () ListLongMap!1661)

(assert (=> b!130774 (= e!85290 (= (apply!113 lt!67981 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2682 newMap!16)))))

(declare-fun b!130775 () Bool)

(declare-fun e!85286 () Bool)

(assert (=> b!130775 (= e!85286 e!85290)))

(declare-fun res!63008 () Bool)

(declare-fun call!14229 () Bool)

(assert (=> b!130775 (= res!63008 call!14229)))

(assert (=> b!130775 (=> (not res!63008) (not e!85290))))

(declare-fun b!130776 () Bool)

(declare-fun e!85279 () Bool)

(assert (=> b!130776 (= e!85285 e!85279)))

(declare-fun res!63006 () Bool)

(assert (=> b!130776 (=> (not res!63006) (not e!85279))))

(assert (=> b!130776 (= res!63006 (contains!876 lt!67981 (select (arr!2230 (_keys!4563 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!130776 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2497 (_keys!4563 newMap!16))))))

(declare-fun bm!14224 () Bool)

(declare-fun call!14232 () ListLongMap!1661)

(declare-fun call!14231 () ListLongMap!1661)

(assert (=> bm!14224 (= call!14232 call!14231)))

(declare-fun b!130777 () Bool)

(declare-fun e!85278 () Bool)

(declare-fun e!85280 () Bool)

(assert (=> b!130777 (= e!85278 e!85280)))

(declare-fun res!63007 () Bool)

(declare-fun call!14227 () Bool)

(assert (=> b!130777 (= res!63007 call!14227)))

(assert (=> b!130777 (=> (not res!63007) (not e!85280))))

(declare-fun b!130779 () Bool)

(declare-fun e!85289 () ListLongMap!1661)

(declare-fun call!14233 () ListLongMap!1661)

(assert (=> b!130779 (= e!85289 call!14233)))

(declare-fun b!130780 () Bool)

(declare-fun e!85282 () Bool)

(assert (=> b!130780 (= e!85282 (validKeyInArray!0 (select (arr!2230 (_keys!4563 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun bm!14225 () Bool)

(assert (=> bm!14225 (= call!14231 (getCurrentListMapNoExtraKeys!125 (_keys!4563 newMap!16) (_values!2806 newMap!16) (mask!7100 newMap!16) lt!67156 (zeroValue!2682 newMap!16) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) #b00000000000000000000000000000000 (defaultEntry!2823 newMap!16)))))

(declare-fun bm!14226 () Bool)

(assert (=> bm!14226 (= call!14227 (contains!876 lt!67981 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!130781 () Bool)

(assert (=> b!130781 (= e!85279 (= (apply!113 lt!67981 (select (arr!2230 (_keys!4563 newMap!16)) #b00000000000000000000000000000000)) (get!1459 (select (arr!2231 (_values!2806 newMap!16)) #b00000000000000000000000000000000) (dynLambda!414 (defaultEntry!2823 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!130781 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2498 (_values!2806 newMap!16))))))

(assert (=> b!130781 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2497 (_keys!4563 newMap!16))))))

(declare-fun b!130782 () Bool)

(assert (=> b!130782 (= e!85288 e!85278)))

(declare-fun c!24178 () Bool)

(assert (=> b!130782 (= c!24178 (not (= (bvand lt!67156 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!130783 () Bool)

(assert (=> b!130783 (= e!85286 (not call!14229))))

(declare-fun b!130784 () Bool)

(declare-fun e!85284 () Unit!4037)

(declare-fun Unit!4093 () Unit!4037)

(assert (=> b!130784 (= e!85284 Unit!4093)))

(declare-fun b!130785 () Bool)

(declare-fun e!85287 () ListLongMap!1661)

(declare-fun call!14230 () ListLongMap!1661)

(assert (=> b!130785 (= e!85287 call!14230)))

(declare-fun bm!14227 () Bool)

(declare-fun call!14228 () ListLongMap!1661)

(assert (=> bm!14227 (= call!14230 call!14228)))

(declare-fun b!130786 () Bool)

(declare-fun lt!67975 () Unit!4037)

(assert (=> b!130786 (= e!85284 lt!67975)))

(declare-fun lt!67971 () ListLongMap!1661)

(assert (=> b!130786 (= lt!67971 (getCurrentListMapNoExtraKeys!125 (_keys!4563 newMap!16) (_values!2806 newMap!16) (mask!7100 newMap!16) lt!67156 (zeroValue!2682 newMap!16) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) #b00000000000000000000000000000000 (defaultEntry!2823 newMap!16)))))

(declare-fun lt!67983 () (_ BitVec 64))

(assert (=> b!130786 (= lt!67983 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!67973 () (_ BitVec 64))

(assert (=> b!130786 (= lt!67973 (select (arr!2230 (_keys!4563 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!67972 () Unit!4037)

(assert (=> b!130786 (= lt!67972 (addStillContains!89 lt!67971 lt!67983 (zeroValue!2682 newMap!16) lt!67973))))

(assert (=> b!130786 (contains!876 (+!160 lt!67971 (tuple2!2567 lt!67983 (zeroValue!2682 newMap!16))) lt!67973)))

(declare-fun lt!67974 () Unit!4037)

(assert (=> b!130786 (= lt!67974 lt!67972)))

(declare-fun lt!67984 () ListLongMap!1661)

(assert (=> b!130786 (= lt!67984 (getCurrentListMapNoExtraKeys!125 (_keys!4563 newMap!16) (_values!2806 newMap!16) (mask!7100 newMap!16) lt!67156 (zeroValue!2682 newMap!16) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) #b00000000000000000000000000000000 (defaultEntry!2823 newMap!16)))))

(declare-fun lt!67966 () (_ BitVec 64))

(assert (=> b!130786 (= lt!67966 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!67976 () (_ BitVec 64))

(assert (=> b!130786 (= lt!67976 (select (arr!2230 (_keys!4563 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!67986 () Unit!4037)

(assert (=> b!130786 (= lt!67986 (addApplyDifferent!89 lt!67984 lt!67966 (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) lt!67976))))

(assert (=> b!130786 (= (apply!113 (+!160 lt!67984 (tuple2!2567 lt!67966 (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!67976) (apply!113 lt!67984 lt!67976))))

(declare-fun lt!67982 () Unit!4037)

(assert (=> b!130786 (= lt!67982 lt!67986)))

(declare-fun lt!67969 () ListLongMap!1661)

(assert (=> b!130786 (= lt!67969 (getCurrentListMapNoExtraKeys!125 (_keys!4563 newMap!16) (_values!2806 newMap!16) (mask!7100 newMap!16) lt!67156 (zeroValue!2682 newMap!16) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) #b00000000000000000000000000000000 (defaultEntry!2823 newMap!16)))))

(declare-fun lt!67985 () (_ BitVec 64))

(assert (=> b!130786 (= lt!67985 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!67978 () (_ BitVec 64))

(assert (=> b!130786 (= lt!67978 (select (arr!2230 (_keys!4563 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!67980 () Unit!4037)

(assert (=> b!130786 (= lt!67980 (addApplyDifferent!89 lt!67969 lt!67985 (zeroValue!2682 newMap!16) lt!67978))))

(assert (=> b!130786 (= (apply!113 (+!160 lt!67969 (tuple2!2567 lt!67985 (zeroValue!2682 newMap!16))) lt!67978) (apply!113 lt!67969 lt!67978))))

(declare-fun lt!67979 () Unit!4037)

(assert (=> b!130786 (= lt!67979 lt!67980)))

(declare-fun lt!67977 () ListLongMap!1661)

(assert (=> b!130786 (= lt!67977 (getCurrentListMapNoExtraKeys!125 (_keys!4563 newMap!16) (_values!2806 newMap!16) (mask!7100 newMap!16) lt!67156 (zeroValue!2682 newMap!16) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) #b00000000000000000000000000000000 (defaultEntry!2823 newMap!16)))))

(declare-fun lt!67970 () (_ BitVec 64))

(assert (=> b!130786 (= lt!67970 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!67987 () (_ BitVec 64))

(assert (=> b!130786 (= lt!67987 (select (arr!2230 (_keys!4563 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!130786 (= lt!67975 (addApplyDifferent!89 lt!67977 lt!67970 (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) lt!67987))))

(assert (=> b!130786 (= (apply!113 (+!160 lt!67977 (tuple2!2567 lt!67970 (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!67987) (apply!113 lt!67977 lt!67987))))

(declare-fun b!130787 () Bool)

(assert (=> b!130787 (= e!85281 (validKeyInArray!0 (select (arr!2230 (_keys!4563 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!130788 () Bool)

(declare-fun c!24181 () Bool)

(assert (=> b!130788 (= c!24181 (and (not (= (bvand lt!67156 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand lt!67156 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!130788 (= e!85287 e!85289)))

(declare-fun b!130789 () Bool)

(declare-fun res!63010 () Bool)

(assert (=> b!130789 (=> (not res!63010) (not e!85288))))

(assert (=> b!130789 (= res!63010 e!85286)))

(declare-fun c!24179 () Bool)

(assert (=> b!130789 (= c!24179 (not (= (bvand lt!67156 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!130790 () Bool)

(assert (=> b!130790 (= e!85289 call!14230)))

(declare-fun bm!14228 () Bool)

(assert (=> bm!14228 (= call!14233 call!14232)))

(declare-fun b!130791 () Bool)

(assert (=> b!130791 (= e!85280 (= (apply!113 lt!67981 #b1000000000000000000000000000000000000000000000000000000000000000) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!130778 () Bool)

(declare-fun e!85283 () ListLongMap!1661)

(assert (=> b!130778 (= e!85283 (+!160 call!14228 (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun d!39943 () Bool)

(assert (=> d!39943 e!85288))

(declare-fun res!63005 () Bool)

(assert (=> d!39943 (=> (not res!63005) (not e!85288))))

(assert (=> d!39943 (= res!63005 (or (bvsge #b00000000000000000000000000000000 (size!2497 (_keys!4563 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2497 (_keys!4563 newMap!16))))))))

(declare-fun lt!67967 () ListLongMap!1661)

(assert (=> d!39943 (= lt!67981 lt!67967)))

(declare-fun lt!67968 () Unit!4037)

(assert (=> d!39943 (= lt!67968 e!85284)))

(declare-fun c!24177 () Bool)

(assert (=> d!39943 (= c!24177 e!85282)))

(declare-fun res!63003 () Bool)

(assert (=> d!39943 (=> (not res!63003) (not e!85282))))

(assert (=> d!39943 (= res!63003 (bvslt #b00000000000000000000000000000000 (size!2497 (_keys!4563 newMap!16))))))

(assert (=> d!39943 (= lt!67967 e!85283)))

(declare-fun c!24182 () Bool)

(assert (=> d!39943 (= c!24182 (and (not (= (bvand lt!67156 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand lt!67156 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!39943 (validMask!0 (mask!7100 newMap!16))))

(assert (=> d!39943 (= (getCurrentListMap!515 (_keys!4563 newMap!16) (_values!2806 newMap!16) (mask!7100 newMap!16) lt!67156 (zeroValue!2682 newMap!16) (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) #b00000000000000000000000000000000 (defaultEntry!2823 newMap!16)) lt!67981)))

(declare-fun bm!14229 () Bool)

(assert (=> bm!14229 (= call!14229 (contains!876 lt!67981 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!130792 () Bool)

(assert (=> b!130792 (= e!85283 e!85287)))

(declare-fun c!24180 () Bool)

(assert (=> b!130792 (= c!24180 (and (not (= (bvand lt!67156 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand lt!67156 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!14230 () Bool)

(assert (=> bm!14230 (= call!14228 (+!160 (ite c!24182 call!14231 (ite c!24180 call!14232 call!14233)) (ite (or c!24182 c!24180) (tuple2!2567 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2682 newMap!16)) (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1459 (select (arr!2231 (_values!2806 (v!3153 (underlying!442 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!130793 () Bool)

(assert (=> b!130793 (= e!85278 (not call!14227))))

(assert (= (and d!39943 c!24182) b!130778))

(assert (= (and d!39943 (not c!24182)) b!130792))

(assert (= (and b!130792 c!24180) b!130785))

(assert (= (and b!130792 (not c!24180)) b!130788))

(assert (= (and b!130788 c!24181) b!130790))

(assert (= (and b!130788 (not c!24181)) b!130779))

(assert (= (or b!130790 b!130779) bm!14228))

(assert (= (or b!130785 bm!14228) bm!14224))

(assert (= (or b!130785 b!130790) bm!14227))

(assert (= (or b!130778 bm!14224) bm!14225))

(assert (= (or b!130778 bm!14227) bm!14230))

(assert (= (and d!39943 res!63003) b!130780))

(assert (= (and d!39943 c!24177) b!130786))

(assert (= (and d!39943 (not c!24177)) b!130784))

(assert (= (and d!39943 res!63005) b!130773))

(assert (= (and b!130773 res!63009) b!130787))

(assert (= (and b!130773 (not res!63004)) b!130776))

(assert (= (and b!130776 res!63006) b!130781))

(assert (= (and b!130773 res!63011) b!130789))

(assert (= (and b!130789 c!24179) b!130775))

(assert (= (and b!130789 (not c!24179)) b!130783))

(assert (= (and b!130775 res!63008) b!130774))

(assert (= (or b!130775 b!130783) bm!14229))

(assert (= (and b!130789 res!63010) b!130782))

(assert (= (and b!130782 c!24178) b!130777))

(assert (= (and b!130782 (not c!24178)) b!130793))

(assert (= (and b!130777 res!63007) b!130791))

(assert (= (or b!130777 b!130793) bm!14226))

(declare-fun b_lambda!5791 () Bool)

(assert (=> (not b_lambda!5791) (not b!130781)))

(assert (=> b!130781 t!6103))

(declare-fun b_and!8081 () Bool)

(assert (= b_and!8077 (and (=> t!6103 result!3917) b_and!8081)))

(assert (=> b!130781 t!6105))

(declare-fun b_and!8083 () Bool)

(assert (= b_and!8079 (and (=> t!6105 result!3919) b_and!8083)))

(declare-fun m!154085 () Bool)

(assert (=> bm!14226 m!154085))

(assert (=> bm!14225 m!151751))

(declare-fun m!154087 () Bool)

(assert (=> bm!14225 m!154087))

(assert (=> b!130787 m!152019))

(assert (=> b!130787 m!152019))

(assert (=> b!130787 m!152021))

(declare-fun m!154089 () Bool)

(assert (=> b!130778 m!154089))

(assert (=> d!39943 m!152025))

(declare-fun m!154091 () Bool)

(assert (=> b!130774 m!154091))

(assert (=> b!130780 m!152019))

(assert (=> b!130780 m!152019))

(assert (=> b!130780 m!152021))

(declare-fun m!154093 () Bool)

(assert (=> b!130791 m!154093))

(declare-fun m!154095 () Bool)

(assert (=> bm!14230 m!154095))

(declare-fun m!154097 () Bool)

(assert (=> b!130786 m!154097))

(declare-fun m!154099 () Bool)

(assert (=> b!130786 m!154099))

(declare-fun m!154101 () Bool)

(assert (=> b!130786 m!154101))

(declare-fun m!154103 () Bool)

(assert (=> b!130786 m!154103))

(declare-fun m!154105 () Bool)

(assert (=> b!130786 m!154105))

(declare-fun m!154107 () Bool)

(assert (=> b!130786 m!154107))

(assert (=> b!130786 m!151751))

(assert (=> b!130786 m!154087))

(assert (=> b!130786 m!151751))

(declare-fun m!154109 () Bool)

(assert (=> b!130786 m!154109))

(assert (=> b!130786 m!152019))

(declare-fun m!154111 () Bool)

(assert (=> b!130786 m!154111))

(declare-fun m!154113 () Bool)

(assert (=> b!130786 m!154113))

(declare-fun m!154115 () Bool)

(assert (=> b!130786 m!154115))

(assert (=> b!130786 m!154107))

(declare-fun m!154117 () Bool)

(assert (=> b!130786 m!154117))

(assert (=> b!130786 m!154101))

(declare-fun m!154119 () Bool)

(assert (=> b!130786 m!154119))

(declare-fun m!154121 () Bool)

(assert (=> b!130786 m!154121))

(assert (=> b!130786 m!151751))

(declare-fun m!154123 () Bool)

(assert (=> b!130786 m!154123))

(assert (=> b!130786 m!154113))

(assert (=> b!130786 m!154111))

(declare-fun m!154125 () Bool)

(assert (=> b!130786 m!154125))

(declare-fun m!154127 () Bool)

(assert (=> bm!14229 m!154127))

(assert (=> b!130776 m!152019))

(assert (=> b!130776 m!152019))

(declare-fun m!154129 () Bool)

(assert (=> b!130776 m!154129))

(assert (=> b!130781 m!152019))

(assert (=> b!130781 m!152067))

(assert (=> b!130781 m!152019))

(declare-fun m!154131 () Bool)

(assert (=> b!130781 m!154131))

(assert (=> b!130781 m!152067))

(assert (=> b!130781 m!152071))

(assert (=> b!130781 m!152073))

(assert (=> b!130781 m!152071))

(assert (=> d!39349 d!39943))

(declare-fun d!39945 () Bool)

(assert (=> d!39945 (isDefined!121 (getValueByKey!167 (toList!846 lt!67071) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!67988 () Unit!4037)

(assert (=> d!39945 (= lt!67988 (choose!801 (toList!846 lt!67071) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!85291 () Bool)

(assert (=> d!39945 e!85291))

(declare-fun res!63012 () Bool)

(assert (=> d!39945 (=> (not res!63012) (not e!85291))))

(assert (=> d!39945 (= res!63012 (isStrictlySorted!314 (toList!846 lt!67071)))))

(assert (=> d!39945 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!120 (toList!846 lt!67071) #b0000000000000000000000000000000000000000000000000000000000000000) lt!67988)))

(declare-fun b!130794 () Bool)

(assert (=> b!130794 (= e!85291 (containsKey!171 (toList!846 lt!67071) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!39945 res!63012) b!130794))

(assert (=> d!39945 m!152499))

(assert (=> d!39945 m!152499))

(assert (=> d!39945 m!152513))

(declare-fun m!154133 () Bool)

(assert (=> d!39945 m!154133))

(assert (=> d!39945 m!153499))

(assert (=> b!130794 m!152509))

(assert (=> b!129954 d!39945))

(assert (=> b!129954 d!39663))

(assert (=> b!129954 d!39623))

(declare-fun d!39947 () Bool)

(declare-fun e!85292 () Bool)

(assert (=> d!39947 e!85292))

(declare-fun res!63013 () Bool)

(assert (=> d!39947 (=> (not res!63013) (not e!85292))))

(declare-fun lt!67992 () ListLongMap!1661)

(assert (=> d!39947 (= res!63013 (contains!876 lt!67992 (_1!1294 (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2682 newMap!16)))))))

(declare-fun lt!67989 () List!1701)

(assert (=> d!39947 (= lt!67992 (ListLongMap!1662 lt!67989))))

(declare-fun lt!67990 () Unit!4037)

(declare-fun lt!67991 () Unit!4037)

(assert (=> d!39947 (= lt!67990 lt!67991)))

(assert (=> d!39947 (= (getValueByKey!167 lt!67989 (_1!1294 (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2682 newMap!16)))) (Some!172 (_2!1294 (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2682 newMap!16)))))))

(assert (=> d!39947 (= lt!67991 (lemmaContainsTupThenGetReturnValue!85 lt!67989 (_1!1294 (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2682 newMap!16))) (_2!1294 (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2682 newMap!16)))))))

(assert (=> d!39947 (= lt!67989 (insertStrictlySorted!88 (toList!846 call!14086) (_1!1294 (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2682 newMap!16))) (_2!1294 (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2682 newMap!16)))))))

(assert (=> d!39947 (= (+!160 call!14086 (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2682 newMap!16))) lt!67992)))

(declare-fun b!130795 () Bool)

(declare-fun res!63014 () Bool)

(assert (=> b!130795 (=> (not res!63014) (not e!85292))))

(assert (=> b!130795 (= res!63014 (= (getValueByKey!167 (toList!846 lt!67992) (_1!1294 (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2682 newMap!16)))) (Some!172 (_2!1294 (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2682 newMap!16))))))))

(declare-fun b!130796 () Bool)

(assert (=> b!130796 (= e!85292 (contains!878 (toList!846 lt!67992) (tuple2!2567 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2682 newMap!16))))))

(assert (= (and d!39947 res!63013) b!130795))

(assert (= (and b!130795 res!63014) b!130796))

(declare-fun m!154135 () Bool)

(assert (=> d!39947 m!154135))

(declare-fun m!154137 () Bool)

(assert (=> d!39947 m!154137))

(declare-fun m!154139 () Bool)

(assert (=> d!39947 m!154139))

(declare-fun m!154141 () Bool)

(assert (=> d!39947 m!154141))

(declare-fun m!154143 () Bool)

(assert (=> b!130795 m!154143))

(declare-fun m!154145 () Bool)

(assert (=> b!130796 m!154145))

(assert (=> b!129669 d!39947))

(declare-fun bm!14231 () Bool)

(declare-fun call!14234 () Bool)

(assert (=> bm!14231 (= call!14234 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!4563 (_2!1295 lt!67144)) (mask!7100 (_2!1295 lt!67144))))))

(declare-fun b!130797 () Bool)

(declare-fun e!85293 () Bool)

(assert (=> b!130797 (= e!85293 call!14234)))

(declare-fun b!130798 () Bool)

(declare-fun e!85294 () Bool)

(assert (=> b!130798 (= e!85294 call!14234)))

(declare-fun d!39949 () Bool)

(declare-fun res!63016 () Bool)

(declare-fun e!85295 () Bool)

(assert (=> d!39949 (=> res!63016 e!85295)))

(assert (=> d!39949 (= res!63016 (bvsge #b00000000000000000000000000000000 (size!2497 (_keys!4563 (_2!1295 lt!67144)))))))

(assert (=> d!39949 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4563 (_2!1295 lt!67144)) (mask!7100 (_2!1295 lt!67144))) e!85295)))

(declare-fun b!130799 () Bool)

(assert (=> b!130799 (= e!85295 e!85293)))

(declare-fun c!24183 () Bool)

(assert (=> b!130799 (= c!24183 (validKeyInArray!0 (select (arr!2230 (_keys!4563 (_2!1295 lt!67144))) #b00000000000000000000000000000000)))))

(declare-fun b!130800 () Bool)

(assert (=> b!130800 (= e!85293 e!85294)))

(declare-fun lt!67995 () (_ BitVec 64))

(assert (=> b!130800 (= lt!67995 (select (arr!2230 (_keys!4563 (_2!1295 lt!67144))) #b00000000000000000000000000000000))))

(declare-fun lt!67993 () Unit!4037)

(assert (=> b!130800 (= lt!67993 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!4563 (_2!1295 lt!67144)) lt!67995 #b00000000000000000000000000000000))))

(assert (=> b!130800 (arrayContainsKey!0 (_keys!4563 (_2!1295 lt!67144)) lt!67995 #b00000000000000000000000000000000)))

(declare-fun lt!67994 () Unit!4037)

(assert (=> b!130800 (= lt!67994 lt!67993)))

(declare-fun res!63015 () Bool)

(assert (=> b!130800 (= res!63015 (= (seekEntryOrOpen!0 (select (arr!2230 (_keys!4563 (_2!1295 lt!67144))) #b00000000000000000000000000000000) (_keys!4563 (_2!1295 lt!67144)) (mask!7100 (_2!1295 lt!67144))) (Found!275 #b00000000000000000000000000000000)))))

(assert (=> b!130800 (=> (not res!63015) (not e!85294))))

(assert (= (and d!39949 (not res!63016)) b!130799))

(assert (= (and b!130799 c!24183) b!130800))

(assert (= (and b!130799 (not c!24183)) b!130797))

(assert (= (and b!130800 res!63015) b!130798))

(assert (= (or b!130798 b!130797) bm!14231))

(declare-fun m!154147 () Bool)

(assert (=> bm!14231 m!154147))

(assert (=> b!130799 m!153085))

(assert (=> b!130799 m!153085))

(assert (=> b!130799 m!153087))

(assert (=> b!130800 m!153085))

(declare-fun m!154149 () Bool)

(assert (=> b!130800 m!154149))

(declare-fun m!154151 () Bool)

(assert (=> b!130800 m!154151))

(assert (=> b!130800 m!153085))

(declare-fun m!154153 () Bool)

(assert (=> b!130800 m!154153))

(assert (=> b!129753 d!39949))

(assert (=> b!129959 d!39731))

(assert (=> b!129959 d!39733))

(declare-fun condMapEmpty!4583 () Bool)

(declare-fun mapDefault!4583 () ValueCell!1085)

(assert (=> mapNonEmpty!4581 (= condMapEmpty!4583 (= mapRest!4581 ((as const (Array (_ BitVec 32) ValueCell!1085)) mapDefault!4583)))))

(declare-fun e!85297 () Bool)

(declare-fun mapRes!4583 () Bool)

(assert (=> mapNonEmpty!4581 (= tp!11097 (and e!85297 mapRes!4583))))

(declare-fun mapNonEmpty!4583 () Bool)

(declare-fun tp!11099 () Bool)

(declare-fun e!85296 () Bool)

(assert (=> mapNonEmpty!4583 (= mapRes!4583 (and tp!11099 e!85296))))

(declare-fun mapRest!4583 () (Array (_ BitVec 32) ValueCell!1085))

(declare-fun mapKey!4583 () (_ BitVec 32))

(declare-fun mapValue!4583 () ValueCell!1085)

(assert (=> mapNonEmpty!4583 (= mapRest!4581 (store mapRest!4583 mapKey!4583 mapValue!4583))))

(declare-fun mapIsEmpty!4583 () Bool)

(assert (=> mapIsEmpty!4583 mapRes!4583))

(declare-fun b!130802 () Bool)

(assert (=> b!130802 (= e!85297 tp_is_empty!2857)))

(declare-fun b!130801 () Bool)

(assert (=> b!130801 (= e!85296 tp_is_empty!2857)))

(assert (= (and mapNonEmpty!4581 condMapEmpty!4583) mapIsEmpty!4583))

(assert (= (and mapNonEmpty!4581 (not condMapEmpty!4583)) mapNonEmpty!4583))

(assert (= (and mapNonEmpty!4583 ((_ is ValueCellFull!1085) mapValue!4583)) b!130801))

(assert (= (and mapNonEmpty!4581 ((_ is ValueCellFull!1085) mapDefault!4583)) b!130802))

(declare-fun m!154155 () Bool)

(assert (=> mapNonEmpty!4583 m!154155))

(declare-fun condMapEmpty!4584 () Bool)

(declare-fun mapDefault!4584 () ValueCell!1085)

(assert (=> mapNonEmpty!4582 (= condMapEmpty!4584 (= mapRest!4582 ((as const (Array (_ BitVec 32) ValueCell!1085)) mapDefault!4584)))))

(declare-fun e!85299 () Bool)

(declare-fun mapRes!4584 () Bool)

(assert (=> mapNonEmpty!4582 (= tp!11098 (and e!85299 mapRes!4584))))

(declare-fun mapNonEmpty!4584 () Bool)

(declare-fun tp!11100 () Bool)

(declare-fun e!85298 () Bool)

(assert (=> mapNonEmpty!4584 (= mapRes!4584 (and tp!11100 e!85298))))

(declare-fun mapRest!4584 () (Array (_ BitVec 32) ValueCell!1085))

(declare-fun mapValue!4584 () ValueCell!1085)

(declare-fun mapKey!4584 () (_ BitVec 32))

(assert (=> mapNonEmpty!4584 (= mapRest!4582 (store mapRest!4584 mapKey!4584 mapValue!4584))))

(declare-fun mapIsEmpty!4584 () Bool)

(assert (=> mapIsEmpty!4584 mapRes!4584))

(declare-fun b!130804 () Bool)

(assert (=> b!130804 (= e!85299 tp_is_empty!2857)))

(declare-fun b!130803 () Bool)

(assert (=> b!130803 (= e!85298 tp_is_empty!2857)))

(assert (= (and mapNonEmpty!4582 condMapEmpty!4584) mapIsEmpty!4584))

(assert (= (and mapNonEmpty!4582 (not condMapEmpty!4584)) mapNonEmpty!4584))

(assert (= (and mapNonEmpty!4584 ((_ is ValueCellFull!1085) mapValue!4584)) b!130803))

(assert (= (and mapNonEmpty!4582 ((_ is ValueCellFull!1085) mapDefault!4584)) b!130804))

(declare-fun m!154157 () Bool)

(assert (=> mapNonEmpty!4584 m!154157))

(declare-fun b_lambda!5793 () Bool)

(assert (= b_lambda!5785 (or (and b!129281 b_free!2881 (= (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) (defaultEntry!2823 newMap!16))) (and b!129277 b_free!2883) b_lambda!5793)))

(declare-fun b_lambda!5795 () Bool)

(assert (= b_lambda!5773 (or (and b!129281 b_free!2881 (= (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) (defaultEntry!2823 newMap!16))) (and b!129277 b_free!2883) b_lambda!5795)))

(declare-fun b_lambda!5797 () Bool)

(assert (= b_lambda!5791 (or (and b!129281 b_free!2881 (= (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) (defaultEntry!2823 newMap!16))) (and b!129277 b_free!2883) b_lambda!5797)))

(declare-fun b_lambda!5799 () Bool)

(assert (= b_lambda!5775 (or (and b!129281 b_free!2881 (= (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) (defaultEntry!2823 newMap!16))) (and b!129277 b_free!2883) b_lambda!5799)))

(declare-fun b_lambda!5801 () Bool)

(assert (= b_lambda!5765 (or (and b!129281 b_free!2881 (= (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) (defaultEntry!2823 newMap!16))) (and b!129277 b_free!2883) b_lambda!5801)))

(declare-fun b_lambda!5803 () Bool)

(assert (= b_lambda!5783 (or (and b!129281 b_free!2881) (and b!129277 b_free!2883 (= (defaultEntry!2823 newMap!16) (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))))) b_lambda!5803)))

(declare-fun b_lambda!5805 () Bool)

(assert (= b_lambda!5767 (or (and b!129281 b_free!2881 (= (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) (defaultEntry!2823 newMap!16))) (and b!129277 b_free!2883) b_lambda!5805)))

(declare-fun b_lambda!5807 () Bool)

(assert (= b_lambda!5777 (or (and b!129281 b_free!2881 (= (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) (defaultEntry!2823 newMap!16))) (and b!129277 b_free!2883) b_lambda!5807)))

(declare-fun b_lambda!5809 () Bool)

(assert (= b_lambda!5787 (or (and b!129281 b_free!2881 (= (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) (defaultEntry!2823 newMap!16))) (and b!129277 b_free!2883) b_lambda!5809)))

(declare-fun b_lambda!5811 () Bool)

(assert (= b_lambda!5771 (or (and b!129281 b_free!2881 (= (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) (defaultEntry!2823 newMap!16))) (and b!129277 b_free!2883) b_lambda!5811)))

(declare-fun b_lambda!5813 () Bool)

(assert (= b_lambda!5781 (or (and b!129281 b_free!2881) (and b!129277 b_free!2883 (= (defaultEntry!2823 newMap!16) (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))))) b_lambda!5813)))

(declare-fun b_lambda!5815 () Bool)

(assert (= b_lambda!5763 (or (and b!129281 b_free!2881 (= (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) (defaultEntry!2823 newMap!16))) (and b!129277 b_free!2883) b_lambda!5815)))

(declare-fun b_lambda!5817 () Bool)

(assert (= b_lambda!5779 (or (and b!129281 b_free!2881 (= (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) (defaultEntry!2823 newMap!16))) (and b!129277 b_free!2883) b_lambda!5817)))

(declare-fun b_lambda!5819 () Bool)

(assert (= b_lambda!5769 (or (and b!129281 b_free!2881 (= (defaultEntry!2823 (v!3153 (underlying!442 thiss!992))) (defaultEntry!2823 newMap!16))) (and b!129277 b_free!2883) b_lambda!5819)))

(check-sat (not bm!14201) (not b!129994) (not d!39567) (not bm!14231) (not d!39783) (not b!129984) (not b!130077) (not b!130621) (not d!39467) (not d!39701) (not d!39647) (not b!130671) (not b!130308) (not d!39631) (not b!130111) (not b_lambda!5753) (not b!130743) (not b_lambda!5789) (not b!130414) (not b!130673) (not b!130476) (not b!130164) (not b!130386) (not b!130617) (not d!39943) (not b!130100) (not b!130388) (not b!130343) (not b!130502) (not d!39705) (not b!130076) (not d!39505) (not b!130690) (not b!130434) (not bm!14137) (not b!130252) (not b!130297) (not b!130540) (not b!130615) (not b!130488) (not b!130771) (not b!130255) (not b!130315) (not d!39633) (not b!130768) (not b!130187) (not b!130215) (not b!130171) (not b!130260) (not bm!14178) (not d!39717) (not b!130516) (not bm!14165) (not b!130307) (not b!130286) (not d!39571) (not d!39653) (not d!39699) (not bm!14162) (not d!39747) (not b!130450) (not b!130104) (not b!130545) (not d!39563) (not b!130800) (not b!130250) (not b!130685) (not b!130277) (not b!130468) (not d!39541) (not b!130722) (not b!130209) (not bm!14200) (not b!129989) (not b!130355) (not b!130566) (not d!39905) (not b!130052) (not b!130507) (not b!130115) (not d!39867) (not b!130420) (not b!130176) (not b!130088) (not b!130613) (not d!39689) (not b!130119) (not b!130523) (not b!130556) (not d!39651) (not b!129971) (not d!39525) (not d!39615) (not b!130632) (not bm!14184) (not b!129993) (not b!130574) (not b!130048) (not b!130598) (not b_lambda!5795) (not d!39813) (not b!130012) (not b_lambda!5799) (not d!39823) (not b!130510) (not b!130795) (not d!39665) (not b!130073) (not d!39533) (not b!130427) (not d!39501) (not d!39923) (not b!130222) (not b!130266) (not b!130364) (not b!130535) (not b!130508) (not b!130728) (not b!130466) (not b!130417) (not b!130272) (not d!39947) (not b!130189) (not b!130630) (not b!130796) (not bm!14174) (not b!130291) (not d!39907) (not b!130638) (not b!130637) (not b!130640) (not d!39941) (not b!130462) (not b_lambda!5793) (not b!130247) (not d!39513) (not b!130759) (not d!39645) (not b!130392) (not b!130283) (not d!39683) (not b!130747) (not b!130635) (not b!129968) (not b!130000) (not d!39915) (not d!39517) (not b!130457) (not b!130169) (not b!130700) (not d!39817) (not d!39627) (not b_lambda!5805) (not bm!14133) (not b!130368) (not b!130489) (not b!130537) (not b!130102) (not d!39881) (not bm!14163) (not b!130778) (not b!130625) (not d!39785) (not b!130492) (not b!130180) (not bm!14161) (not bm!14177) (not b!130594) (not b!130607) (not b_lambda!5761) (not d!39475) (not d!39489) (not b!130146) (not b!130529) (not d!39935) (not d!39899) b_and!8083 (not b!130515) (not b!130236) (not d!39751) (not b!130496) (not d!39927) (not b!130177) (not b!130467) (not b!130463) (not b!130078) (not d!39671) (not bm!14155) (not d!39925) (not b!130791) (not b!130480) (not bm!14187) (not bm!14189) (not b!130718) (not b_lambda!5737) (not d!39599) (not b!130577) (not b!130678) (not bm!14221) (not b!130204) (not b!130121) (not d!39677) (not d!39755) (not b!130752) (not b!130313) (not d!39939) (not d!39493) (not b!130423) (not b!129979) (not d!39479) (not d!39681) (not b!130641) (not b!130558) (not d!39455) (not bm!14203) (not b!130418) (not b!130692) (not b!130394) (not d!39775) (not d!39885) (not d!39491) (not d!39909) (not bm!14145) (not b!130561) (not b!130276) (not b!129991) (not b_next!2883) (not b_lambda!5813) (not b!130084) (not b!130080) (not b!130705) (not b!130732) (not d!39729) (not b!130634) (not b!130092) (not d!39649) (not d!39675) (not bm!14175) (not b!129967) (not d!39769) (not d!39727) (not b!130470) (not b!130580) (not bm!14211) (not b!129975) (not b!130750) (not b!130426) (not b!130056) (not d!39773) (not b!130761) (not b!130562) (not b!130618) (not b!130043) (not d!39473) (not b!130666) (not b!130461) (not b_lambda!5801) (not d!39461) (not d!39827) (not d!39887) (not b_lambda!5819) (not b!130231) (not b!130539) (not d!39685) (not bm!14181) (not b!130570) (not mapNonEmpty!4584) (not b!130724) (not d!39739) (not b!129972) (not b_lambda!5741) (not b!130144) (not b!130431) (not b!130009) (not d!39945) (not b!130194) (not b!130602) (not b!130402) (not d!39509) (not d!39791) (not b!130505) (not b!130757) (not d!39825) (not b!130596) (not d!39695) (not b!130471) (not b!130349) (not d!39715) (not bm!14152) (not b!130560) (not bm!14132) (not b!130018) (not b!130401) (not d!39797) (not b!130311) (not b!130445) (not bm!14173) (not d!39573) (not b!130786) (not b!130449) (not d!39691) (not bm!14148) (not b!130263) (not d!39713) (not d!39625) (not b!130572) (not d!39793) (not b!130553) (not b!130310) (not b!130216) b_and!8081 (not d!39753) (not d!39847) (not d!39617) (not b!130506) (not b!130587) (not bm!14193) (not d!39787) (not d!39831) (not d!39639) (not d!39575) (not b!130491) (not b!130406) (not b!130191) (not b!130378) (not d!39771) (not b!130089) (not b!130584) (not b!130096) (not b!130152) (not b!130428) (not b!130483) (not b!130487) (not d!39879) (not b!130693) (not b!130348) (not b!130213) (not b!130188) (not d!39507) (not d!39449) (not b!130346) (not b!130754) (not d!39697) (not b!130185) (not b!130459) (not bm!14149) (not b!130409) (not d!39515) (not b_lambda!5807) (not b!130623) (not b!130261) (not d!39557) (not b!130168) (not bm!14172) (not d!39641) (not b!130353) (not bm!14217) (not bm!14157) (not b!130520) (not d!39667) (not d!39587) (not b!130683) (not b!130735) (not b!130110) (not b!130136) (not d!39539) (not d!39911) (not d!39549) (not d!39873) (not b!130193) (not d!39857) (not b!130399) (not mapNonEmpty!4583) (not bm!14223) (not b!130772) (not b!130203) (not b!129973) (not b!130439) (not b!130239) (not b!130211) (not b!130284) (not d!39629) (not d!39519) (not b_lambda!5797) (not b!130019) (not b!130436) (not b!130697) (not b_lambda!5803) (not b!130373) (not d!39457) (not b!130605) (not d!39499) (not b!130681) (not d!39731) (not b!130497) (not b!130379) (not b!130289) (not b!130363) (not b!130453) (not b!130498) (not b!130600) (not b!130293) (not d!39757) (not b!130787) (not bm!14158) (not b!130500) (not d!39719) (not b!130173) (not b!130627) (not b!130723) (not b!130711) (not b!130608) (not d!39545) (not d!39497) (not b!130473) (not bm!14154) (not b!130085) (not b!130396) (not b!130122) (not b!130799) (not d!39657) (not d!39759) (not d!39851) (not b!130411) (not b!130258) (not d!39663) (not b!130592) (not b!130298) (not b!130531) (not bm!14168) (not b!130393) (not b!130205) (not d!39869) (not b!130295) (not b_lambda!5757) (not d!39837) (not b!130157) (not b!130740) (not d!39735) (not b!130762) (not b!130737) (not d!39815) tp_is_empty!2857 (not d!39503) (not b!130253) (not b!130358) (not d!39871) (not d!39669) (not b!130299) (not d!39821) (not bm!14226) (not b!130533) (not b!130135) (not b!129982) (not bm!14219) (not b!130178) (not d!39865) (not d!39859) (not b_lambda!5817) (not b!130714) (not bm!14212) (not b!130528) (not b!130292) (not d!39589) (not d!39471) (not b_next!2881) (not b!130302) (not b!130579) (not b!130278) (not b!130604) (not b!130513) (not b!130794) (not d!39679) (not b!130527) (not b!130774) (not b!130296) (not d!39877) (not b!130755) (not d!39607) (not d!39635) (not b!130668) (not d!39779) (not bm!14206) (not bm!14182) (not b!130702) (not b!130781) (not b!130589) (not b!130687) (not bm!14205) (not b!130142) (not d!39777) (not d!39741) (not bm!14196) (not b!130371) (not b!130422) (not d!39765) (not b!130563) (not b!130525) (not bm!14130) (not b!130079) (not d!39829) (not d!39619) (not d!39835) (not b!130207) (not b!130550) (not d!39763) (not b!130546) (not b!130555) (not d!39585) (not bm!14229) (not b!130303) (not bm!14225) (not b!130226) (not d!39453) (not b!130494) (not d!39593) (not b_lambda!5815) (not b!129978) (not b!129999) (not d!39861) (not b!130726) (not b!129976) (not b!129985) (not d!39655) (not d!39511) (not b!130611) (not b!130140) (not b!130007) (not d!39535) (not b!130221) (not b!130153) (not bm!14136) (not b!130147) (not b!130124) (not b_lambda!5755) (not d!39919) (not bm!14190) (not d!39795) (not d!39553) (not d!39637) (not d!39937) (not d!39819) (not d!39643) (not b!130383) (not b!130376) (not b!130437) (not bm!14214) (not b!130442) (not b!130200) (not b!130306) (not d!39809) (not b_lambda!5811) (not bm!14197) (not d!39613) (not b!130351) (not b!130610) (not b!130415) (not b!130503) (not b!130274) (not b!130202) (not b!130674) (not b_lambda!5759) (not b!130316) (not d!39803) (not b!130235) (not b!130138) (not bm!14230) (not b!130082) (not b!130357) (not d!39709) (not d!39833) (not d!39891) (not d!39581) (not b!130105) (not d!39597) (not b!130601) (not d!39611) (not b!130269) (not b!130780) (not b!130776) (not b!130098) (not d!39749) (not d!39527) (not b!129987) (not b!130391) (not bm!14167) (not b!130770) (not bm!14164) (not b!130245) (not d!39495) (not b!130004) (not b_lambda!5809) (not bm!14171) (not d!39767) (not b!130433) (not bm!14191) (not b!130046) (not d!39537) (not b!130504) (not d!39761) (not b!130742) (not b!130484) (not bm!14153) (not d!39463))
(check-sat b_and!8081 b_and!8083 (not b_next!2881) (not b_next!2883))
