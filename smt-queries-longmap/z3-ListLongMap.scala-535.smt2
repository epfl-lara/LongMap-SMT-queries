; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!13442 () Bool)

(assert start!13442)

(declare-fun b!123392 () Bool)

(declare-fun b_free!2809 () Bool)

(declare-fun b_next!2809 () Bool)

(assert (=> b!123392 (= b_free!2809 (not b_next!2809))))

(declare-fun tp!10814 () Bool)

(declare-fun b_and!7577 () Bool)

(assert (=> b!123392 (= tp!10814 b_and!7577)))

(declare-fun b!123390 () Bool)

(declare-fun b_free!2811 () Bool)

(declare-fun b_next!2811 () Bool)

(assert (=> b!123390 (= b_free!2811 (not b_next!2811))))

(declare-fun tp!10813 () Bool)

(declare-fun b_and!7579 () Bool)

(assert (=> b!123390 (= tp!10813 b_and!7579)))

(declare-fun b!123386 () Bool)

(declare-fun e!80633 () Bool)

(declare-fun e!80627 () Bool)

(assert (=> b!123386 (= e!80633 e!80627)))

(declare-fun b!123387 () Bool)

(declare-fun e!80630 () Bool)

(declare-fun tp_is_empty!2821 () Bool)

(assert (=> b!123387 (= e!80630 tp_is_empty!2821)))

(declare-fun b!123388 () Bool)

(declare-fun e!80624 () Bool)

(assert (=> b!123388 (= e!80627 e!80624)))

(declare-fun mapNonEmpty!4419 () Bool)

(declare-fun mapRes!4420 () Bool)

(declare-fun tp!10815 () Bool)

(declare-fun e!80636 () Bool)

(assert (=> mapNonEmpty!4419 (= mapRes!4420 (and tp!10815 e!80636))))

(declare-datatypes ((V!3409 0))(
  ( (V!3410 (val!1455 Int)) )
))
(declare-datatypes ((ValueCell!1067 0))(
  ( (ValueCellFull!1067 (v!3090 V!3409)) (EmptyCell!1067) )
))
(declare-fun mapValue!4420 () ValueCell!1067)

(declare-fun mapRest!4420 () (Array (_ BitVec 32) ValueCell!1067))

(declare-fun mapKey!4420 () (_ BitVec 32))

(declare-datatypes ((array!4639 0))(
  ( (array!4640 (arr!2198 (Array (_ BitVec 32) (_ BitVec 64))) (size!2460 (_ BitVec 32))) )
))
(declare-datatypes ((array!4641 0))(
  ( (array!4642 (arr!2199 (Array (_ BitVec 32) ValueCell!1067)) (size!2461 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1042 0))(
  ( (LongMapFixedSize!1043 (defaultEntry!2754 Int) (mask!6992 (_ BitVec 32)) (extraKeys!2539 (_ BitVec 32)) (zeroValue!2619 V!3409) (minValue!2619 V!3409) (_size!570 (_ BitVec 32)) (_keys!4481 array!4639) (_values!2737 array!4641) (_vacant!570 (_ BitVec 32))) )
))
(declare-fun newMap!16 () LongMapFixedSize!1042)

(assert (=> mapNonEmpty!4419 (= (arr!2199 (_values!2737 newMap!16)) (store mapRest!4420 mapKey!4420 mapValue!4420))))

(declare-fun b!123389 () Bool)

(assert (=> b!123389 (= e!80636 tp_is_empty!2821)))

(declare-fun mapIsEmpty!4419 () Bool)

(assert (=> mapIsEmpty!4419 mapRes!4420))

(declare-fun e!80629 () Bool)

(declare-fun e!80626 () Bool)

(declare-fun array_inv!1375 (array!4639) Bool)

(declare-fun array_inv!1376 (array!4641) Bool)

(assert (=> b!123390 (= e!80629 (and tp!10813 tp_is_empty!2821 (array_inv!1375 (_keys!4481 newMap!16)) (array_inv!1376 (_values!2737 newMap!16)) e!80626))))

(declare-fun b!123391 () Bool)

(assert (=> b!123391 (= e!80626 (and e!80630 mapRes!4420))))

(declare-fun condMapEmpty!4420 () Bool)

(declare-fun mapDefault!4419 () ValueCell!1067)

(assert (=> b!123391 (= condMapEmpty!4420 (= (arr!2199 (_values!2737 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!1067)) mapDefault!4419)))))

(declare-datatypes ((Cell!838 0))(
  ( (Cell!839 (v!3091 LongMapFixedSize!1042)) )
))
(declare-datatypes ((LongMap!838 0))(
  ( (LongMap!839 (underlying!430 Cell!838)) )
))
(declare-fun thiss!992 () LongMap!838)

(declare-fun e!80628 () Bool)

(assert (=> b!123392 (= e!80624 (and tp!10814 tp_is_empty!2821 (array_inv!1375 (_keys!4481 (v!3091 (underlying!430 thiss!992)))) (array_inv!1376 (_values!2737 (v!3091 (underlying!430 thiss!992)))) e!80628))))

(declare-fun b!123393 () Bool)

(declare-fun e!80634 () Bool)

(assert (=> b!123393 (= e!80634 tp_is_empty!2821)))

(declare-fun b!123394 () Bool)

(declare-fun mapRes!4419 () Bool)

(assert (=> b!123394 (= e!80628 (and e!80634 mapRes!4419))))

(declare-fun condMapEmpty!4419 () Bool)

(declare-fun mapDefault!4420 () ValueCell!1067)

(assert (=> b!123394 (= condMapEmpty!4419 (= (arr!2199 (_values!2737 (v!3091 (underlying!430 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!1067)) mapDefault!4420)))))

(declare-fun b!123395 () Bool)

(declare-fun res!59900 () Bool)

(declare-fun e!80635 () Bool)

(assert (=> b!123395 (=> (not res!59900) (not e!80635))))

(declare-fun from!355 () (_ BitVec 32))

(declare-datatypes ((tuple2!2508 0))(
  ( (tuple2!2509 (_1!1265 (_ BitVec 64)) (_2!1265 V!3409)) )
))
(declare-datatypes ((List!1670 0))(
  ( (Nil!1667) (Cons!1666 (h!2267 tuple2!2508) (t!5965 List!1670)) )
))
(declare-datatypes ((ListLongMap!1623 0))(
  ( (ListLongMap!1624 (toList!827 List!1670)) )
))
(declare-fun getCurrentListMap!508 (array!4639 array!4641 (_ BitVec 32) (_ BitVec 32) V!3409 V!3409 (_ BitVec 32) Int) ListLongMap!1623)

(declare-fun map!1370 (LongMapFixedSize!1042) ListLongMap!1623)

(assert (=> b!123395 (= res!59900 (= (getCurrentListMap!508 (_keys!4481 (v!3091 (underlying!430 thiss!992))) (_values!2737 (v!3091 (underlying!430 thiss!992))) (mask!6992 (v!3091 (underlying!430 thiss!992))) (extraKeys!2539 (v!3091 (underlying!430 thiss!992))) (zeroValue!2619 (v!3091 (underlying!430 thiss!992))) (minValue!2619 (v!3091 (underlying!430 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2754 (v!3091 (underlying!430 thiss!992)))) (map!1370 newMap!16)))))

(declare-fun mapNonEmpty!4420 () Bool)

(declare-fun tp!10816 () Bool)

(declare-fun e!80632 () Bool)

(assert (=> mapNonEmpty!4420 (= mapRes!4419 (and tp!10816 e!80632))))

(declare-fun mapKey!4419 () (_ BitVec 32))

(declare-fun mapValue!4419 () ValueCell!1067)

(declare-fun mapRest!4419 () (Array (_ BitVec 32) ValueCell!1067))

(assert (=> mapNonEmpty!4420 (= (arr!2199 (_values!2737 (v!3091 (underlying!430 thiss!992)))) (store mapRest!4419 mapKey!4419 mapValue!4419))))

(declare-fun b!123396 () Bool)

(declare-fun res!59901 () Bool)

(assert (=> b!123396 (=> (not res!59901) (not e!80635))))

(assert (=> b!123396 (= res!59901 (bvsge (bvadd #b00000000000000000000000000000001 (mask!6992 newMap!16)) (_size!570 (v!3091 (underlying!430 thiss!992)))))))

(declare-fun b!123397 () Bool)

(declare-fun res!59899 () Bool)

(assert (=> b!123397 (=> (not res!59899) (not e!80635))))

(assert (=> b!123397 (= res!59899 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2460 (_keys!4481 (v!3091 (underlying!430 thiss!992)))))))))

(declare-fun b!123398 () Bool)

(assert (=> b!123398 (= e!80632 tp_is_empty!2821)))

(declare-fun mapIsEmpty!4420 () Bool)

(assert (=> mapIsEmpty!4420 mapRes!4419))

(declare-fun b!123399 () Bool)

(declare-fun res!59902 () Bool)

(assert (=> b!123399 (=> (not res!59902) (not e!80635))))

(declare-fun valid!506 (LongMapFixedSize!1042) Bool)

(assert (=> b!123399 (= res!59902 (valid!506 newMap!16))))

(declare-fun b!123400 () Bool)

(assert (=> b!123400 (= e!80635 (bvsge from!355 (size!2461 (_values!2737 (v!3091 (underlying!430 thiss!992))))))))

(declare-fun res!59903 () Bool)

(assert (=> start!13442 (=> (not res!59903) (not e!80635))))

(declare-fun valid!507 (LongMap!838) Bool)

(assert (=> start!13442 (= res!59903 (valid!507 thiss!992))))

(assert (=> start!13442 e!80635))

(assert (=> start!13442 e!80633))

(assert (=> start!13442 true))

(assert (=> start!13442 e!80629))

(assert (= (and start!13442 res!59903) b!123397))

(assert (= (and b!123397 res!59899) b!123399))

(assert (= (and b!123399 res!59902) b!123396))

(assert (= (and b!123396 res!59901) b!123395))

(assert (= (and b!123395 res!59900) b!123400))

(assert (= (and b!123394 condMapEmpty!4419) mapIsEmpty!4420))

(assert (= (and b!123394 (not condMapEmpty!4419)) mapNonEmpty!4420))

(get-info :version)

(assert (= (and mapNonEmpty!4420 ((_ is ValueCellFull!1067) mapValue!4419)) b!123398))

(assert (= (and b!123394 ((_ is ValueCellFull!1067) mapDefault!4420)) b!123393))

(assert (= b!123392 b!123394))

(assert (= b!123388 b!123392))

(assert (= b!123386 b!123388))

(assert (= start!13442 b!123386))

(assert (= (and b!123391 condMapEmpty!4420) mapIsEmpty!4419))

(assert (= (and b!123391 (not condMapEmpty!4420)) mapNonEmpty!4419))

(assert (= (and mapNonEmpty!4419 ((_ is ValueCellFull!1067) mapValue!4420)) b!123389))

(assert (= (and b!123391 ((_ is ValueCellFull!1067) mapDefault!4419)) b!123387))

(assert (= b!123390 b!123391))

(assert (= start!13442 b!123390))

(declare-fun m!143529 () Bool)

(assert (=> mapNonEmpty!4420 m!143529))

(declare-fun m!143531 () Bool)

(assert (=> b!123395 m!143531))

(declare-fun m!143533 () Bool)

(assert (=> b!123395 m!143533))

(declare-fun m!143535 () Bool)

(assert (=> b!123392 m!143535))

(declare-fun m!143537 () Bool)

(assert (=> b!123392 m!143537))

(declare-fun m!143539 () Bool)

(assert (=> b!123399 m!143539))

(declare-fun m!143541 () Bool)

(assert (=> mapNonEmpty!4419 m!143541))

(declare-fun m!143543 () Bool)

(assert (=> b!123390 m!143543))

(declare-fun m!143545 () Bool)

(assert (=> b!123390 m!143545))

(declare-fun m!143547 () Bool)

(assert (=> start!13442 m!143547))

(check-sat (not b_next!2809) (not b!123399) (not b!123392) b_and!7579 (not b_next!2811) (not mapNonEmpty!4419) (not b!123395) tp_is_empty!2821 b_and!7577 (not start!13442) (not b!123390) (not mapNonEmpty!4420))
(check-sat b_and!7577 b_and!7579 (not b_next!2809) (not b_next!2811))
(get-model)

(declare-fun d!37131 () Bool)

(assert (=> d!37131 (= (array_inv!1375 (_keys!4481 (v!3091 (underlying!430 thiss!992)))) (bvsge (size!2460 (_keys!4481 (v!3091 (underlying!430 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!123392 d!37131))

(declare-fun d!37133 () Bool)

(assert (=> d!37133 (= (array_inv!1376 (_values!2737 (v!3091 (underlying!430 thiss!992)))) (bvsge (size!2461 (_values!2737 (v!3091 (underlying!430 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!123392 d!37133))

(declare-fun d!37135 () Bool)

(declare-fun res!59940 () Bool)

(declare-fun e!80717 () Bool)

(assert (=> d!37135 (=> (not res!59940) (not e!80717))))

(declare-fun simpleValid!84 (LongMapFixedSize!1042) Bool)

(assert (=> d!37135 (= res!59940 (simpleValid!84 newMap!16))))

(assert (=> d!37135 (= (valid!506 newMap!16) e!80717)))

(declare-fun b!123497 () Bool)

(declare-fun res!59941 () Bool)

(assert (=> b!123497 (=> (not res!59941) (not e!80717))))

(declare-fun arrayCountValidKeys!0 (array!4639 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!123497 (= res!59941 (= (arrayCountValidKeys!0 (_keys!4481 newMap!16) #b00000000000000000000000000000000 (size!2460 (_keys!4481 newMap!16))) (_size!570 newMap!16)))))

(declare-fun b!123498 () Bool)

(declare-fun res!59942 () Bool)

(assert (=> b!123498 (=> (not res!59942) (not e!80717))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!4639 (_ BitVec 32)) Bool)

(assert (=> b!123498 (= res!59942 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4481 newMap!16) (mask!6992 newMap!16)))))

(declare-fun b!123499 () Bool)

(declare-datatypes ((List!1671 0))(
  ( (Nil!1668) (Cons!1667 (h!2268 (_ BitVec 64)) (t!5970 List!1671)) )
))
(declare-fun arrayNoDuplicates!0 (array!4639 (_ BitVec 32) List!1671) Bool)

(assert (=> b!123499 (= e!80717 (arrayNoDuplicates!0 (_keys!4481 newMap!16) #b00000000000000000000000000000000 Nil!1668))))

(assert (= (and d!37135 res!59940) b!123497))

(assert (= (and b!123497 res!59941) b!123498))

(assert (= (and b!123498 res!59942) b!123499))

(declare-fun m!143589 () Bool)

(assert (=> d!37135 m!143589))

(declare-fun m!143591 () Bool)

(assert (=> b!123497 m!143591))

(declare-fun m!143593 () Bool)

(assert (=> b!123498 m!143593))

(declare-fun m!143595 () Bool)

(assert (=> b!123499 m!143595))

(assert (=> b!123399 d!37135))

(declare-fun d!37137 () Bool)

(assert (=> d!37137 (= (valid!507 thiss!992) (valid!506 (v!3091 (underlying!430 thiss!992))))))

(declare-fun bs!5126 () Bool)

(assert (= bs!5126 d!37137))

(declare-fun m!143597 () Bool)

(assert (=> bs!5126 m!143597))

(assert (=> start!13442 d!37137))

(declare-fun d!37139 () Bool)

(assert (=> d!37139 (= (array_inv!1375 (_keys!4481 newMap!16)) (bvsge (size!2460 (_keys!4481 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!123390 d!37139))

(declare-fun d!37141 () Bool)

(assert (=> d!37141 (= (array_inv!1376 (_values!2737 newMap!16)) (bvsge (size!2461 (_values!2737 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!123390 d!37141))

(declare-fun b!123542 () Bool)

(declare-fun e!80748 () Bool)

(declare-fun e!80750 () Bool)

(assert (=> b!123542 (= e!80748 e!80750)))

(declare-fun res!59963 () Bool)

(declare-fun call!13105 () Bool)

(assert (=> b!123542 (= res!59963 call!13105)))

(assert (=> b!123542 (=> (not res!59963) (not e!80750))))

(declare-fun bm!13100 () Bool)

(declare-fun call!13108 () ListLongMap!1623)

(declare-fun call!13106 () ListLongMap!1623)

(assert (=> bm!13100 (= call!13108 call!13106)))

(declare-fun b!123543 () Bool)

(declare-fun e!80753 () Bool)

(declare-fun lt!63541 () ListLongMap!1623)

(declare-fun apply!108 (ListLongMap!1623 (_ BitVec 64)) V!3409)

(declare-fun get!1434 (ValueCell!1067 V!3409) V!3409)

(declare-fun dynLambda!412 (Int (_ BitVec 64)) V!3409)

(assert (=> b!123543 (= e!80753 (= (apply!108 lt!63541 (select (arr!2198 (_keys!4481 (v!3091 (underlying!430 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1434 (select (arr!2199 (_values!2737 (v!3091 (underlying!430 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!412 (defaultEntry!2754 (v!3091 (underlying!430 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!123543 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2461 (_values!2737 (v!3091 (underlying!430 thiss!992))))))))

(assert (=> b!123543 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2460 (_keys!4481 (v!3091 (underlying!430 thiss!992))))))))

(declare-fun bm!13101 () Bool)

(declare-fun contains!856 (ListLongMap!1623 (_ BitVec 64)) Bool)

(assert (=> bm!13101 (= call!13105 (contains!856 lt!63541 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!123544 () Bool)

(declare-fun e!80754 () ListLongMap!1623)

(declare-fun call!13104 () ListLongMap!1623)

(assert (=> b!123544 (= e!80754 call!13104)))

(declare-fun b!123545 () Bool)

(declare-fun e!80756 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!123545 (= e!80756 (validKeyInArray!0 (select (arr!2198 (_keys!4481 (v!3091 (underlying!430 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun bm!13102 () Bool)

(assert (=> bm!13102 (= call!13104 call!13108)))

(declare-fun c!22432 () Bool)

(declare-fun bm!13103 () Bool)

(declare-fun c!22430 () Bool)

(declare-fun call!13109 () ListLongMap!1623)

(declare-fun +!161 (ListLongMap!1623 tuple2!2508) ListLongMap!1623)

(assert (=> bm!13103 (= call!13109 (+!161 (ite c!22432 call!13106 (ite c!22430 call!13108 call!13104)) (ite (or c!22432 c!22430) (tuple2!2509 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2619 (v!3091 (underlying!430 thiss!992)))) (tuple2!2509 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 (v!3091 (underlying!430 thiss!992)))))))))

(declare-fun d!37143 () Bool)

(declare-fun e!80747 () Bool)

(assert (=> d!37143 e!80747))

(declare-fun res!59961 () Bool)

(assert (=> d!37143 (=> (not res!59961) (not e!80747))))

(assert (=> d!37143 (= res!59961 (or (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2460 (_keys!4481 (v!3091 (underlying!430 thiss!992))))) (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2460 (_keys!4481 (v!3091 (underlying!430 thiss!992))))))))))

(declare-fun lt!63531 () ListLongMap!1623)

(assert (=> d!37143 (= lt!63541 lt!63531)))

(declare-datatypes ((Unit!3839 0))(
  ( (Unit!3840) )
))
(declare-fun lt!63540 () Unit!3839)

(declare-fun e!80746 () Unit!3839)

(assert (=> d!37143 (= lt!63540 e!80746)))

(declare-fun c!22434 () Bool)

(assert (=> d!37143 (= c!22434 e!80756)))

(declare-fun res!59964 () Bool)

(assert (=> d!37143 (=> (not res!59964) (not e!80756))))

(assert (=> d!37143 (= res!59964 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2460 (_keys!4481 (v!3091 (underlying!430 thiss!992))))))))

(declare-fun e!80745 () ListLongMap!1623)

(assert (=> d!37143 (= lt!63531 e!80745)))

(assert (=> d!37143 (= c!22432 (and (not (= (bvand (extraKeys!2539 (v!3091 (underlying!430 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2539 (v!3091 (underlying!430 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!37143 (validMask!0 (mask!6992 (v!3091 (underlying!430 thiss!992))))))

(assert (=> d!37143 (= (getCurrentListMap!508 (_keys!4481 (v!3091 (underlying!430 thiss!992))) (_values!2737 (v!3091 (underlying!430 thiss!992))) (mask!6992 (v!3091 (underlying!430 thiss!992))) (extraKeys!2539 (v!3091 (underlying!430 thiss!992))) (zeroValue!2619 (v!3091 (underlying!430 thiss!992))) (minValue!2619 (v!3091 (underlying!430 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2754 (v!3091 (underlying!430 thiss!992)))) lt!63541)))

(declare-fun b!123546 () Bool)

(declare-fun Unit!3841 () Unit!3839)

(assert (=> b!123546 (= e!80746 Unit!3841)))

(declare-fun b!123547 () Bool)

(declare-fun call!13103 () ListLongMap!1623)

(assert (=> b!123547 (= e!80754 call!13103)))

(declare-fun bm!13104 () Bool)

(declare-fun call!13107 () Bool)

(assert (=> bm!13104 (= call!13107 (contains!856 lt!63541 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!123548 () Bool)

(declare-fun res!59969 () Bool)

(assert (=> b!123548 (=> (not res!59969) (not e!80747))))

(declare-fun e!80751 () Bool)

(assert (=> b!123548 (= res!59969 e!80751)))

(declare-fun res!59968 () Bool)

(assert (=> b!123548 (=> res!59968 e!80751)))

(declare-fun e!80755 () Bool)

(assert (=> b!123548 (= res!59968 (not e!80755))))

(declare-fun res!59967 () Bool)

(assert (=> b!123548 (=> (not res!59967) (not e!80755))))

(assert (=> b!123548 (= res!59967 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2460 (_keys!4481 (v!3091 (underlying!430 thiss!992))))))))

(declare-fun b!123549 () Bool)

(assert (=> b!123549 (= e!80745 (+!161 call!13109 (tuple2!2509 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 (v!3091 (underlying!430 thiss!992))))))))

(declare-fun bm!13105 () Bool)

(assert (=> bm!13105 (= call!13103 call!13109)))

(declare-fun b!123550 () Bool)

(declare-fun e!80749 () Bool)

(declare-fun e!80744 () Bool)

(assert (=> b!123550 (= e!80749 e!80744)))

(declare-fun res!59966 () Bool)

(assert (=> b!123550 (= res!59966 call!13107)))

(assert (=> b!123550 (=> (not res!59966) (not e!80744))))

(declare-fun b!123551 () Bool)

(assert (=> b!123551 (= e!80751 e!80753)))

(declare-fun res!59965 () Bool)

(assert (=> b!123551 (=> (not res!59965) (not e!80753))))

(assert (=> b!123551 (= res!59965 (contains!856 lt!63541 (select (arr!2198 (_keys!4481 (v!3091 (underlying!430 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!123551 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2460 (_keys!4481 (v!3091 (underlying!430 thiss!992))))))))

(declare-fun bm!13106 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!128 (array!4639 array!4641 (_ BitVec 32) (_ BitVec 32) V!3409 V!3409 (_ BitVec 32) Int) ListLongMap!1623)

(assert (=> bm!13106 (= call!13106 (getCurrentListMapNoExtraKeys!128 (_keys!4481 (v!3091 (underlying!430 thiss!992))) (_values!2737 (v!3091 (underlying!430 thiss!992))) (mask!6992 (v!3091 (underlying!430 thiss!992))) (extraKeys!2539 (v!3091 (underlying!430 thiss!992))) (zeroValue!2619 (v!3091 (underlying!430 thiss!992))) (minValue!2619 (v!3091 (underlying!430 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2754 (v!3091 (underlying!430 thiss!992)))))))

(declare-fun b!123552 () Bool)

(declare-fun res!59962 () Bool)

(assert (=> b!123552 (=> (not res!59962) (not e!80747))))

(assert (=> b!123552 (= res!59962 e!80748)))

(declare-fun c!22431 () Bool)

(assert (=> b!123552 (= c!22431 (not (= (bvand (extraKeys!2539 (v!3091 (underlying!430 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!123553 () Bool)

(declare-fun e!80752 () ListLongMap!1623)

(assert (=> b!123553 (= e!80752 call!13103)))

(declare-fun b!123554 () Bool)

(assert (=> b!123554 (= e!80749 (not call!13107))))

(declare-fun b!123555 () Bool)

(assert (=> b!123555 (= e!80747 e!80749)))

(declare-fun c!22433 () Bool)

(assert (=> b!123555 (= c!22433 (not (= (bvand (extraKeys!2539 (v!3091 (underlying!430 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!123556 () Bool)

(assert (=> b!123556 (= e!80748 (not call!13105))))

(declare-fun b!123557 () Bool)

(assert (=> b!123557 (= e!80745 e!80752)))

(assert (=> b!123557 (= c!22430 (and (not (= (bvand (extraKeys!2539 (v!3091 (underlying!430 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2539 (v!3091 (underlying!430 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!123558 () Bool)

(declare-fun c!22435 () Bool)

(assert (=> b!123558 (= c!22435 (and (not (= (bvand (extraKeys!2539 (v!3091 (underlying!430 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2539 (v!3091 (underlying!430 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!123558 (= e!80752 e!80754)))

(declare-fun b!123559 () Bool)

(assert (=> b!123559 (= e!80755 (validKeyInArray!0 (select (arr!2198 (_keys!4481 (v!3091 (underlying!430 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!123560 () Bool)

(assert (=> b!123560 (= e!80744 (= (apply!108 lt!63541 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2619 (v!3091 (underlying!430 thiss!992)))))))

(declare-fun b!123561 () Bool)

(assert (=> b!123561 (= e!80750 (= (apply!108 lt!63541 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2619 (v!3091 (underlying!430 thiss!992)))))))

(declare-fun b!123562 () Bool)

(declare-fun lt!63533 () Unit!3839)

(assert (=> b!123562 (= e!80746 lt!63533)))

(declare-fun lt!63545 () ListLongMap!1623)

(assert (=> b!123562 (= lt!63545 (getCurrentListMapNoExtraKeys!128 (_keys!4481 (v!3091 (underlying!430 thiss!992))) (_values!2737 (v!3091 (underlying!430 thiss!992))) (mask!6992 (v!3091 (underlying!430 thiss!992))) (extraKeys!2539 (v!3091 (underlying!430 thiss!992))) (zeroValue!2619 (v!3091 (underlying!430 thiss!992))) (minValue!2619 (v!3091 (underlying!430 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2754 (v!3091 (underlying!430 thiss!992)))))))

(declare-fun lt!63547 () (_ BitVec 64))

(assert (=> b!123562 (= lt!63547 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!63543 () (_ BitVec 64))

(assert (=> b!123562 (= lt!63543 (select (arr!2198 (_keys!4481 (v!3091 (underlying!430 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!63550 () Unit!3839)

(declare-fun addStillContains!84 (ListLongMap!1623 (_ BitVec 64) V!3409 (_ BitVec 64)) Unit!3839)

(assert (=> b!123562 (= lt!63550 (addStillContains!84 lt!63545 lt!63547 (zeroValue!2619 (v!3091 (underlying!430 thiss!992))) lt!63543))))

(assert (=> b!123562 (contains!856 (+!161 lt!63545 (tuple2!2509 lt!63547 (zeroValue!2619 (v!3091 (underlying!430 thiss!992))))) lt!63543)))

(declare-fun lt!63544 () Unit!3839)

(assert (=> b!123562 (= lt!63544 lt!63550)))

(declare-fun lt!63551 () ListLongMap!1623)

(assert (=> b!123562 (= lt!63551 (getCurrentListMapNoExtraKeys!128 (_keys!4481 (v!3091 (underlying!430 thiss!992))) (_values!2737 (v!3091 (underlying!430 thiss!992))) (mask!6992 (v!3091 (underlying!430 thiss!992))) (extraKeys!2539 (v!3091 (underlying!430 thiss!992))) (zeroValue!2619 (v!3091 (underlying!430 thiss!992))) (minValue!2619 (v!3091 (underlying!430 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2754 (v!3091 (underlying!430 thiss!992)))))))

(declare-fun lt!63552 () (_ BitVec 64))

(assert (=> b!123562 (= lt!63552 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!63536 () (_ BitVec 64))

(assert (=> b!123562 (= lt!63536 (select (arr!2198 (_keys!4481 (v!3091 (underlying!430 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!63537 () Unit!3839)

(declare-fun addApplyDifferent!84 (ListLongMap!1623 (_ BitVec 64) V!3409 (_ BitVec 64)) Unit!3839)

(assert (=> b!123562 (= lt!63537 (addApplyDifferent!84 lt!63551 lt!63552 (minValue!2619 (v!3091 (underlying!430 thiss!992))) lt!63536))))

(assert (=> b!123562 (= (apply!108 (+!161 lt!63551 (tuple2!2509 lt!63552 (minValue!2619 (v!3091 (underlying!430 thiss!992))))) lt!63536) (apply!108 lt!63551 lt!63536))))

(declare-fun lt!63548 () Unit!3839)

(assert (=> b!123562 (= lt!63548 lt!63537)))

(declare-fun lt!63535 () ListLongMap!1623)

(assert (=> b!123562 (= lt!63535 (getCurrentListMapNoExtraKeys!128 (_keys!4481 (v!3091 (underlying!430 thiss!992))) (_values!2737 (v!3091 (underlying!430 thiss!992))) (mask!6992 (v!3091 (underlying!430 thiss!992))) (extraKeys!2539 (v!3091 (underlying!430 thiss!992))) (zeroValue!2619 (v!3091 (underlying!430 thiss!992))) (minValue!2619 (v!3091 (underlying!430 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2754 (v!3091 (underlying!430 thiss!992)))))))

(declare-fun lt!63549 () (_ BitVec 64))

(assert (=> b!123562 (= lt!63549 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!63542 () (_ BitVec 64))

(assert (=> b!123562 (= lt!63542 (select (arr!2198 (_keys!4481 (v!3091 (underlying!430 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!63539 () Unit!3839)

(assert (=> b!123562 (= lt!63539 (addApplyDifferent!84 lt!63535 lt!63549 (zeroValue!2619 (v!3091 (underlying!430 thiss!992))) lt!63542))))

(assert (=> b!123562 (= (apply!108 (+!161 lt!63535 (tuple2!2509 lt!63549 (zeroValue!2619 (v!3091 (underlying!430 thiss!992))))) lt!63542) (apply!108 lt!63535 lt!63542))))

(declare-fun lt!63532 () Unit!3839)

(assert (=> b!123562 (= lt!63532 lt!63539)))

(declare-fun lt!63534 () ListLongMap!1623)

(assert (=> b!123562 (= lt!63534 (getCurrentListMapNoExtraKeys!128 (_keys!4481 (v!3091 (underlying!430 thiss!992))) (_values!2737 (v!3091 (underlying!430 thiss!992))) (mask!6992 (v!3091 (underlying!430 thiss!992))) (extraKeys!2539 (v!3091 (underlying!430 thiss!992))) (zeroValue!2619 (v!3091 (underlying!430 thiss!992))) (minValue!2619 (v!3091 (underlying!430 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2754 (v!3091 (underlying!430 thiss!992)))))))

(declare-fun lt!63538 () (_ BitVec 64))

(assert (=> b!123562 (= lt!63538 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!63546 () (_ BitVec 64))

(assert (=> b!123562 (= lt!63546 (select (arr!2198 (_keys!4481 (v!3091 (underlying!430 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(assert (=> b!123562 (= lt!63533 (addApplyDifferent!84 lt!63534 lt!63538 (minValue!2619 (v!3091 (underlying!430 thiss!992))) lt!63546))))

(assert (=> b!123562 (= (apply!108 (+!161 lt!63534 (tuple2!2509 lt!63538 (minValue!2619 (v!3091 (underlying!430 thiss!992))))) lt!63546) (apply!108 lt!63534 lt!63546))))

(assert (= (and d!37143 c!22432) b!123549))

(assert (= (and d!37143 (not c!22432)) b!123557))

(assert (= (and b!123557 c!22430) b!123553))

(assert (= (and b!123557 (not c!22430)) b!123558))

(assert (= (and b!123558 c!22435) b!123547))

(assert (= (and b!123558 (not c!22435)) b!123544))

(assert (= (or b!123547 b!123544) bm!13102))

(assert (= (or b!123553 bm!13102) bm!13100))

(assert (= (or b!123553 b!123547) bm!13105))

(assert (= (or b!123549 bm!13100) bm!13106))

(assert (= (or b!123549 bm!13105) bm!13103))

(assert (= (and d!37143 res!59964) b!123545))

(assert (= (and d!37143 c!22434) b!123562))

(assert (= (and d!37143 (not c!22434)) b!123546))

(assert (= (and d!37143 res!59961) b!123548))

(assert (= (and b!123548 res!59967) b!123559))

(assert (= (and b!123548 (not res!59968)) b!123551))

(assert (= (and b!123551 res!59965) b!123543))

(assert (= (and b!123548 res!59969) b!123552))

(assert (= (and b!123552 c!22431) b!123542))

(assert (= (and b!123552 (not c!22431)) b!123556))

(assert (= (and b!123542 res!59963) b!123561))

(assert (= (or b!123542 b!123556) bm!13101))

(assert (= (and b!123552 res!59962) b!123555))

(assert (= (and b!123555 c!22433) b!123550))

(assert (= (and b!123555 (not c!22433)) b!123554))

(assert (= (and b!123550 res!59966) b!123560))

(assert (= (or b!123550 b!123554) bm!13104))

(declare-fun b_lambda!5431 () Bool)

(assert (=> (not b_lambda!5431) (not b!123543)))

(declare-fun t!5967 () Bool)

(declare-fun tb!2261 () Bool)

(assert (=> (and b!123392 (= (defaultEntry!2754 (v!3091 (underlying!430 thiss!992))) (defaultEntry!2754 (v!3091 (underlying!430 thiss!992)))) t!5967) tb!2261))

(declare-fun result!3763 () Bool)

(assert (=> tb!2261 (= result!3763 tp_is_empty!2821)))

(assert (=> b!123543 t!5967))

(declare-fun b_and!7589 () Bool)

(assert (= b_and!7577 (and (=> t!5967 result!3763) b_and!7589)))

(declare-fun tb!2263 () Bool)

(declare-fun t!5969 () Bool)

(assert (=> (and b!123390 (= (defaultEntry!2754 newMap!16) (defaultEntry!2754 (v!3091 (underlying!430 thiss!992)))) t!5969) tb!2263))

(declare-fun result!3767 () Bool)

(assert (= result!3767 result!3763))

(assert (=> b!123543 t!5969))

(declare-fun b_and!7591 () Bool)

(assert (= b_and!7579 (and (=> t!5969 result!3767) b_and!7591)))

(declare-fun m!143599 () Bool)

(assert (=> bm!13103 m!143599))

(declare-fun m!143601 () Bool)

(assert (=> b!123560 m!143601))

(declare-fun m!143603 () Bool)

(assert (=> d!37143 m!143603))

(declare-fun m!143605 () Bool)

(assert (=> bm!13106 m!143605))

(declare-fun m!143607 () Bool)

(assert (=> bm!13101 m!143607))

(declare-fun m!143609 () Bool)

(assert (=> b!123545 m!143609))

(assert (=> b!123545 m!143609))

(declare-fun m!143611 () Bool)

(assert (=> b!123545 m!143611))

(assert (=> b!123543 m!143609))

(declare-fun m!143613 () Bool)

(assert (=> b!123543 m!143613))

(declare-fun m!143615 () Bool)

(assert (=> b!123543 m!143615))

(declare-fun m!143617 () Bool)

(assert (=> b!123543 m!143617))

(declare-fun m!143619 () Bool)

(assert (=> b!123543 m!143619))

(assert (=> b!123543 m!143615))

(assert (=> b!123543 m!143617))

(assert (=> b!123543 m!143609))

(declare-fun m!143621 () Bool)

(assert (=> bm!13104 m!143621))

(assert (=> b!123559 m!143609))

(assert (=> b!123559 m!143609))

(assert (=> b!123559 m!143611))

(assert (=> b!123551 m!143609))

(assert (=> b!123551 m!143609))

(declare-fun m!143623 () Bool)

(assert (=> b!123551 m!143623))

(declare-fun m!143625 () Bool)

(assert (=> b!123549 m!143625))

(declare-fun m!143627 () Bool)

(assert (=> b!123561 m!143627))

(declare-fun m!143629 () Bool)

(assert (=> b!123562 m!143629))

(declare-fun m!143631 () Bool)

(assert (=> b!123562 m!143631))

(declare-fun m!143633 () Bool)

(assert (=> b!123562 m!143633))

(declare-fun m!143635 () Bool)

(assert (=> b!123562 m!143635))

(assert (=> b!123562 m!143629))

(declare-fun m!143637 () Bool)

(assert (=> b!123562 m!143637))

(declare-fun m!143639 () Bool)

(assert (=> b!123562 m!143639))

(declare-fun m!143641 () Bool)

(assert (=> b!123562 m!143641))

(assert (=> b!123562 m!143639))

(assert (=> b!123562 m!143609))

(declare-fun m!143643 () Bool)

(assert (=> b!123562 m!143643))

(declare-fun m!143645 () Bool)

(assert (=> b!123562 m!143645))

(declare-fun m!143647 () Bool)

(assert (=> b!123562 m!143647))

(declare-fun m!143649 () Bool)

(assert (=> b!123562 m!143649))

(assert (=> b!123562 m!143605))

(declare-fun m!143651 () Bool)

(assert (=> b!123562 m!143651))

(declare-fun m!143653 () Bool)

(assert (=> b!123562 m!143653))

(assert (=> b!123562 m!143651))

(declare-fun m!143655 () Bool)

(assert (=> b!123562 m!143655))

(declare-fun m!143657 () Bool)

(assert (=> b!123562 m!143657))

(assert (=> b!123562 m!143643))

(assert (=> b!123395 d!37143))

(declare-fun d!37145 () Bool)

(assert (=> d!37145 (= (map!1370 newMap!16) (getCurrentListMap!508 (_keys!4481 newMap!16) (_values!2737 newMap!16) (mask!6992 newMap!16) (extraKeys!2539 newMap!16) (zeroValue!2619 newMap!16) (minValue!2619 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2754 newMap!16)))))

(declare-fun bs!5127 () Bool)

(assert (= bs!5127 d!37145))

(declare-fun m!143659 () Bool)

(assert (=> bs!5127 m!143659))

(assert (=> b!123395 d!37145))

(declare-fun condMapEmpty!4435 () Bool)

(declare-fun mapDefault!4435 () ValueCell!1067)

(assert (=> mapNonEmpty!4420 (= condMapEmpty!4435 (= mapRest!4419 ((as const (Array (_ BitVec 32) ValueCell!1067)) mapDefault!4435)))))

(declare-fun e!80761 () Bool)

(declare-fun mapRes!4435 () Bool)

(assert (=> mapNonEmpty!4420 (= tp!10816 (and e!80761 mapRes!4435))))

(declare-fun mapIsEmpty!4435 () Bool)

(assert (=> mapIsEmpty!4435 mapRes!4435))

(declare-fun mapNonEmpty!4435 () Bool)

(declare-fun tp!10843 () Bool)

(declare-fun e!80762 () Bool)

(assert (=> mapNonEmpty!4435 (= mapRes!4435 (and tp!10843 e!80762))))

(declare-fun mapKey!4435 () (_ BitVec 32))

(declare-fun mapValue!4435 () ValueCell!1067)

(declare-fun mapRest!4435 () (Array (_ BitVec 32) ValueCell!1067))

(assert (=> mapNonEmpty!4435 (= mapRest!4419 (store mapRest!4435 mapKey!4435 mapValue!4435))))

(declare-fun b!123571 () Bool)

(assert (=> b!123571 (= e!80762 tp_is_empty!2821)))

(declare-fun b!123572 () Bool)

(assert (=> b!123572 (= e!80761 tp_is_empty!2821)))

(assert (= (and mapNonEmpty!4420 condMapEmpty!4435) mapIsEmpty!4435))

(assert (= (and mapNonEmpty!4420 (not condMapEmpty!4435)) mapNonEmpty!4435))

(assert (= (and mapNonEmpty!4435 ((_ is ValueCellFull!1067) mapValue!4435)) b!123571))

(assert (= (and mapNonEmpty!4420 ((_ is ValueCellFull!1067) mapDefault!4435)) b!123572))

(declare-fun m!143661 () Bool)

(assert (=> mapNonEmpty!4435 m!143661))

(declare-fun condMapEmpty!4436 () Bool)

(declare-fun mapDefault!4436 () ValueCell!1067)

(assert (=> mapNonEmpty!4419 (= condMapEmpty!4436 (= mapRest!4420 ((as const (Array (_ BitVec 32) ValueCell!1067)) mapDefault!4436)))))

(declare-fun e!80763 () Bool)

(declare-fun mapRes!4436 () Bool)

(assert (=> mapNonEmpty!4419 (= tp!10815 (and e!80763 mapRes!4436))))

(declare-fun mapIsEmpty!4436 () Bool)

(assert (=> mapIsEmpty!4436 mapRes!4436))

(declare-fun mapNonEmpty!4436 () Bool)

(declare-fun tp!10844 () Bool)

(declare-fun e!80764 () Bool)

(assert (=> mapNonEmpty!4436 (= mapRes!4436 (and tp!10844 e!80764))))

(declare-fun mapKey!4436 () (_ BitVec 32))

(declare-fun mapRest!4436 () (Array (_ BitVec 32) ValueCell!1067))

(declare-fun mapValue!4436 () ValueCell!1067)

(assert (=> mapNonEmpty!4436 (= mapRest!4420 (store mapRest!4436 mapKey!4436 mapValue!4436))))

(declare-fun b!123573 () Bool)

(assert (=> b!123573 (= e!80764 tp_is_empty!2821)))

(declare-fun b!123574 () Bool)

(assert (=> b!123574 (= e!80763 tp_is_empty!2821)))

(assert (= (and mapNonEmpty!4419 condMapEmpty!4436) mapIsEmpty!4436))

(assert (= (and mapNonEmpty!4419 (not condMapEmpty!4436)) mapNonEmpty!4436))

(assert (= (and mapNonEmpty!4436 ((_ is ValueCellFull!1067) mapValue!4436)) b!123573))

(assert (= (and mapNonEmpty!4419 ((_ is ValueCellFull!1067) mapDefault!4436)) b!123574))

(declare-fun m!143663 () Bool)

(assert (=> mapNonEmpty!4436 m!143663))

(declare-fun b_lambda!5433 () Bool)

(assert (= b_lambda!5431 (or (and b!123392 b_free!2809) (and b!123390 b_free!2811 (= (defaultEntry!2754 newMap!16) (defaultEntry!2754 (v!3091 (underlying!430 thiss!992))))) b_lambda!5433)))

(check-sat (not d!37137) b_and!7591 (not b!123560) (not b!123543) (not bm!13106) (not b!123499) (not mapNonEmpty!4436) (not d!37143) tp_is_empty!2821 (not b!123559) (not b_next!2809) (not bm!13101) (not b_lambda!5433) (not b!123551) (not b_next!2811) b_and!7589 (not d!37135) (not bm!13104) (not d!37145) (not bm!13103) (not b!123562) (not b!123561) (not b!123549) (not b!123498) (not b!123545) (not b!123497) (not mapNonEmpty!4435))
(check-sat b_and!7589 b_and!7591 (not b_next!2809) (not b_next!2811))
(get-model)

(declare-fun d!37147 () Bool)

(declare-fun e!80767 () Bool)

(assert (=> d!37147 e!80767))

(declare-fun res!59975 () Bool)

(assert (=> d!37147 (=> (not res!59975) (not e!80767))))

(declare-fun lt!63562 () ListLongMap!1623)

(assert (=> d!37147 (= res!59975 (contains!856 lt!63562 (_1!1265 (tuple2!2509 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 (v!3091 (underlying!430 thiss!992)))))))))

(declare-fun lt!63564 () List!1670)

(assert (=> d!37147 (= lt!63562 (ListLongMap!1624 lt!63564))))

(declare-fun lt!63563 () Unit!3839)

(declare-fun lt!63561 () Unit!3839)

(assert (=> d!37147 (= lt!63563 lt!63561)))

(declare-datatypes ((Option!171 0))(
  ( (Some!170 (v!3096 V!3409)) (None!169) )
))
(declare-fun getValueByKey!165 (List!1670 (_ BitVec 64)) Option!171)

(assert (=> d!37147 (= (getValueByKey!165 lt!63564 (_1!1265 (tuple2!2509 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 (v!3091 (underlying!430 thiss!992)))))) (Some!170 (_2!1265 (tuple2!2509 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 (v!3091 (underlying!430 thiss!992)))))))))

(declare-fun lemmaContainsTupThenGetReturnValue!81 (List!1670 (_ BitVec 64) V!3409) Unit!3839)

(assert (=> d!37147 (= lt!63561 (lemmaContainsTupThenGetReturnValue!81 lt!63564 (_1!1265 (tuple2!2509 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 (v!3091 (underlying!430 thiss!992))))) (_2!1265 (tuple2!2509 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 (v!3091 (underlying!430 thiss!992)))))))))

(declare-fun insertStrictlySorted!84 (List!1670 (_ BitVec 64) V!3409) List!1670)

(assert (=> d!37147 (= lt!63564 (insertStrictlySorted!84 (toList!827 call!13109) (_1!1265 (tuple2!2509 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 (v!3091 (underlying!430 thiss!992))))) (_2!1265 (tuple2!2509 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 (v!3091 (underlying!430 thiss!992)))))))))

(assert (=> d!37147 (= (+!161 call!13109 (tuple2!2509 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 (v!3091 (underlying!430 thiss!992))))) lt!63562)))

(declare-fun b!123579 () Bool)

(declare-fun res!59974 () Bool)

(assert (=> b!123579 (=> (not res!59974) (not e!80767))))

(assert (=> b!123579 (= res!59974 (= (getValueByKey!165 (toList!827 lt!63562) (_1!1265 (tuple2!2509 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 (v!3091 (underlying!430 thiss!992)))))) (Some!170 (_2!1265 (tuple2!2509 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 (v!3091 (underlying!430 thiss!992))))))))))

(declare-fun b!123580 () Bool)

(declare-fun contains!857 (List!1670 tuple2!2508) Bool)

(assert (=> b!123580 (= e!80767 (contains!857 (toList!827 lt!63562) (tuple2!2509 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 (v!3091 (underlying!430 thiss!992))))))))

(assert (= (and d!37147 res!59975) b!123579))

(assert (= (and b!123579 res!59974) b!123580))

(declare-fun m!143665 () Bool)

(assert (=> d!37147 m!143665))

(declare-fun m!143667 () Bool)

(assert (=> d!37147 m!143667))

(declare-fun m!143669 () Bool)

(assert (=> d!37147 m!143669))

(declare-fun m!143671 () Bool)

(assert (=> d!37147 m!143671))

(declare-fun m!143673 () Bool)

(assert (=> b!123579 m!143673))

(declare-fun m!143675 () Bool)

(assert (=> b!123580 m!143675))

(assert (=> b!123549 d!37147))

(declare-fun d!37149 () Bool)

(assert (=> d!37149 (= (validKeyInArray!0 (select (arr!2198 (_keys!4481 (v!3091 (underlying!430 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (and (not (= (select (arr!2198 (_keys!4481 (v!3091 (underlying!430 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2198 (_keys!4481 (v!3091 (underlying!430 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!123559 d!37149))

(declare-fun d!37151 () Bool)

(declare-fun e!80772 () Bool)

(assert (=> d!37151 e!80772))

(declare-fun res!59978 () Bool)

(assert (=> d!37151 (=> res!59978 e!80772)))

(declare-fun lt!63573 () Bool)

(assert (=> d!37151 (= res!59978 (not lt!63573))))

(declare-fun lt!63574 () Bool)

(assert (=> d!37151 (= lt!63573 lt!63574)))

(declare-fun lt!63575 () Unit!3839)

(declare-fun e!80773 () Unit!3839)

(assert (=> d!37151 (= lt!63575 e!80773)))

(declare-fun c!22438 () Bool)

(assert (=> d!37151 (= c!22438 lt!63574)))

(declare-fun containsKey!168 (List!1670 (_ BitVec 64)) Bool)

(assert (=> d!37151 (= lt!63574 (containsKey!168 (toList!827 lt!63541) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!37151 (= (contains!856 lt!63541 #b0000000000000000000000000000000000000000000000000000000000000000) lt!63573)))

(declare-fun b!123587 () Bool)

(declare-fun lt!63576 () Unit!3839)

(assert (=> b!123587 (= e!80773 lt!63576)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!116 (List!1670 (_ BitVec 64)) Unit!3839)

(assert (=> b!123587 (= lt!63576 (lemmaContainsKeyImpliesGetValueByKeyDefined!116 (toList!827 lt!63541) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun isDefined!117 (Option!171) Bool)

(assert (=> b!123587 (isDefined!117 (getValueByKey!165 (toList!827 lt!63541) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!123588 () Bool)

(declare-fun Unit!3842 () Unit!3839)

(assert (=> b!123588 (= e!80773 Unit!3842)))

(declare-fun b!123589 () Bool)

(assert (=> b!123589 (= e!80772 (isDefined!117 (getValueByKey!165 (toList!827 lt!63541) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!37151 c!22438) b!123587))

(assert (= (and d!37151 (not c!22438)) b!123588))

(assert (= (and d!37151 (not res!59978)) b!123589))

(declare-fun m!143677 () Bool)

(assert (=> d!37151 m!143677))

(declare-fun m!143679 () Bool)

(assert (=> b!123587 m!143679))

(declare-fun m!143681 () Bool)

(assert (=> b!123587 m!143681))

(assert (=> b!123587 m!143681))

(declare-fun m!143683 () Bool)

(assert (=> b!123587 m!143683))

(assert (=> b!123589 m!143681))

(assert (=> b!123589 m!143681))

(assert (=> b!123589 m!143683))

(assert (=> bm!13101 d!37151))

(declare-fun d!37153 () Bool)

(declare-fun get!1435 (Option!171) V!3409)

(assert (=> d!37153 (= (apply!108 lt!63541 (select (arr!2198 (_keys!4481 (v!3091 (underlying!430 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1435 (getValueByKey!165 (toList!827 lt!63541) (select (arr!2198 (_keys!4481 (v!3091 (underlying!430 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(declare-fun bs!5128 () Bool)

(assert (= bs!5128 d!37153))

(assert (=> bs!5128 m!143609))

(declare-fun m!143685 () Bool)

(assert (=> bs!5128 m!143685))

(assert (=> bs!5128 m!143685))

(declare-fun m!143687 () Bool)

(assert (=> bs!5128 m!143687))

(assert (=> b!123543 d!37153))

(declare-fun d!37155 () Bool)

(declare-fun c!22441 () Bool)

(assert (=> d!37155 (= c!22441 ((_ is ValueCellFull!1067) (select (arr!2199 (_values!2737 (v!3091 (underlying!430 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun e!80776 () V!3409)

(assert (=> d!37155 (= (get!1434 (select (arr!2199 (_values!2737 (v!3091 (underlying!430 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!412 (defaultEntry!2754 (v!3091 (underlying!430 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) e!80776)))

(declare-fun b!123594 () Bool)

(declare-fun get!1436 (ValueCell!1067 V!3409) V!3409)

(assert (=> b!123594 (= e!80776 (get!1436 (select (arr!2199 (_values!2737 (v!3091 (underlying!430 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!412 (defaultEntry!2754 (v!3091 (underlying!430 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!123595 () Bool)

(declare-fun get!1437 (ValueCell!1067 V!3409) V!3409)

(assert (=> b!123595 (= e!80776 (get!1437 (select (arr!2199 (_values!2737 (v!3091 (underlying!430 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!412 (defaultEntry!2754 (v!3091 (underlying!430 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!37155 c!22441) b!123594))

(assert (= (and d!37155 (not c!22441)) b!123595))

(assert (=> b!123594 m!143615))

(assert (=> b!123594 m!143617))

(declare-fun m!143689 () Bool)

(assert (=> b!123594 m!143689))

(assert (=> b!123595 m!143615))

(assert (=> b!123595 m!143617))

(declare-fun m!143691 () Bool)

(assert (=> b!123595 m!143691))

(assert (=> b!123543 d!37155))

(declare-fun d!37157 () Bool)

(declare-fun e!80777 () Bool)

(assert (=> d!37157 e!80777))

(declare-fun res!59979 () Bool)

(assert (=> d!37157 (=> res!59979 e!80777)))

(declare-fun lt!63577 () Bool)

(assert (=> d!37157 (= res!59979 (not lt!63577))))

(declare-fun lt!63578 () Bool)

(assert (=> d!37157 (= lt!63577 lt!63578)))

(declare-fun lt!63579 () Unit!3839)

(declare-fun e!80778 () Unit!3839)

(assert (=> d!37157 (= lt!63579 e!80778)))

(declare-fun c!22442 () Bool)

(assert (=> d!37157 (= c!22442 lt!63578)))

(assert (=> d!37157 (= lt!63578 (containsKey!168 (toList!827 lt!63541) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!37157 (= (contains!856 lt!63541 #b1000000000000000000000000000000000000000000000000000000000000000) lt!63577)))

(declare-fun b!123596 () Bool)

(declare-fun lt!63580 () Unit!3839)

(assert (=> b!123596 (= e!80778 lt!63580)))

(assert (=> b!123596 (= lt!63580 (lemmaContainsKeyImpliesGetValueByKeyDefined!116 (toList!827 lt!63541) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!123596 (isDefined!117 (getValueByKey!165 (toList!827 lt!63541) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!123597 () Bool)

(declare-fun Unit!3843 () Unit!3839)

(assert (=> b!123597 (= e!80778 Unit!3843)))

(declare-fun b!123598 () Bool)

(assert (=> b!123598 (= e!80777 (isDefined!117 (getValueByKey!165 (toList!827 lt!63541) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!37157 c!22442) b!123596))

(assert (= (and d!37157 (not c!22442)) b!123597))

(assert (= (and d!37157 (not res!59979)) b!123598))

(declare-fun m!143693 () Bool)

(assert (=> d!37157 m!143693))

(declare-fun m!143695 () Bool)

(assert (=> b!123596 m!143695))

(declare-fun m!143697 () Bool)

(assert (=> b!123596 m!143697))

(assert (=> b!123596 m!143697))

(declare-fun m!143699 () Bool)

(assert (=> b!123596 m!143699))

(assert (=> b!123598 m!143697))

(assert (=> b!123598 m!143697))

(assert (=> b!123598 m!143699))

(assert (=> bm!13104 d!37157))

(declare-fun b!123609 () Bool)

(declare-fun e!80789 () Bool)

(declare-fun call!13112 () Bool)

(assert (=> b!123609 (= e!80789 call!13112)))

(declare-fun bm!13109 () Bool)

(declare-fun c!22445 () Bool)

(assert (=> bm!13109 (= call!13112 (arrayNoDuplicates!0 (_keys!4481 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!22445 (Cons!1667 (select (arr!2198 (_keys!4481 newMap!16)) #b00000000000000000000000000000000) Nil!1668) Nil!1668)))))

(declare-fun b!123610 () Bool)

(declare-fun e!80787 () Bool)

(declare-fun e!80788 () Bool)

(assert (=> b!123610 (= e!80787 e!80788)))

(declare-fun res!59987 () Bool)

(assert (=> b!123610 (=> (not res!59987) (not e!80788))))

(declare-fun e!80790 () Bool)

(assert (=> b!123610 (= res!59987 (not e!80790))))

(declare-fun res!59986 () Bool)

(assert (=> b!123610 (=> (not res!59986) (not e!80790))))

(assert (=> b!123610 (= res!59986 (validKeyInArray!0 (select (arr!2198 (_keys!4481 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!123611 () Bool)

(assert (=> b!123611 (= e!80789 call!13112)))

(declare-fun d!37159 () Bool)

(declare-fun res!59988 () Bool)

(assert (=> d!37159 (=> res!59988 e!80787)))

(assert (=> d!37159 (= res!59988 (bvsge #b00000000000000000000000000000000 (size!2460 (_keys!4481 newMap!16))))))

(assert (=> d!37159 (= (arrayNoDuplicates!0 (_keys!4481 newMap!16) #b00000000000000000000000000000000 Nil!1668) e!80787)))

(declare-fun b!123612 () Bool)

(declare-fun contains!858 (List!1671 (_ BitVec 64)) Bool)

(assert (=> b!123612 (= e!80790 (contains!858 Nil!1668 (select (arr!2198 (_keys!4481 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!123613 () Bool)

(assert (=> b!123613 (= e!80788 e!80789)))

(assert (=> b!123613 (= c!22445 (validKeyInArray!0 (select (arr!2198 (_keys!4481 newMap!16)) #b00000000000000000000000000000000)))))

(assert (= (and d!37159 (not res!59988)) b!123610))

(assert (= (and b!123610 res!59986) b!123612))

(assert (= (and b!123610 res!59987) b!123613))

(assert (= (and b!123613 c!22445) b!123609))

(assert (= (and b!123613 (not c!22445)) b!123611))

(assert (= (or b!123609 b!123611) bm!13109))

(declare-fun m!143701 () Bool)

(assert (=> bm!13109 m!143701))

(declare-fun m!143703 () Bool)

(assert (=> bm!13109 m!143703))

(assert (=> b!123610 m!143701))

(assert (=> b!123610 m!143701))

(declare-fun m!143705 () Bool)

(assert (=> b!123610 m!143705))

(assert (=> b!123612 m!143701))

(assert (=> b!123612 m!143701))

(declare-fun m!143707 () Bool)

(assert (=> b!123612 m!143707))

(assert (=> b!123613 m!143701))

(assert (=> b!123613 m!143701))

(assert (=> b!123613 m!143705))

(assert (=> b!123499 d!37159))

(declare-fun d!37161 () Bool)

(declare-fun e!80791 () Bool)

(assert (=> d!37161 e!80791))

(declare-fun res!59990 () Bool)

(assert (=> d!37161 (=> (not res!59990) (not e!80791))))

(declare-fun lt!63582 () ListLongMap!1623)

(assert (=> d!37161 (= res!59990 (contains!856 lt!63582 (_1!1265 (ite (or c!22432 c!22430) (tuple2!2509 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2619 (v!3091 (underlying!430 thiss!992)))) (tuple2!2509 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 (v!3091 (underlying!430 thiss!992))))))))))

(declare-fun lt!63584 () List!1670)

(assert (=> d!37161 (= lt!63582 (ListLongMap!1624 lt!63584))))

(declare-fun lt!63583 () Unit!3839)

(declare-fun lt!63581 () Unit!3839)

(assert (=> d!37161 (= lt!63583 lt!63581)))

(assert (=> d!37161 (= (getValueByKey!165 lt!63584 (_1!1265 (ite (or c!22432 c!22430) (tuple2!2509 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2619 (v!3091 (underlying!430 thiss!992)))) (tuple2!2509 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 (v!3091 (underlying!430 thiss!992))))))) (Some!170 (_2!1265 (ite (or c!22432 c!22430) (tuple2!2509 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2619 (v!3091 (underlying!430 thiss!992)))) (tuple2!2509 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 (v!3091 (underlying!430 thiss!992))))))))))

(assert (=> d!37161 (= lt!63581 (lemmaContainsTupThenGetReturnValue!81 lt!63584 (_1!1265 (ite (or c!22432 c!22430) (tuple2!2509 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2619 (v!3091 (underlying!430 thiss!992)))) (tuple2!2509 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 (v!3091 (underlying!430 thiss!992)))))) (_2!1265 (ite (or c!22432 c!22430) (tuple2!2509 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2619 (v!3091 (underlying!430 thiss!992)))) (tuple2!2509 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 (v!3091 (underlying!430 thiss!992))))))))))

(assert (=> d!37161 (= lt!63584 (insertStrictlySorted!84 (toList!827 (ite c!22432 call!13106 (ite c!22430 call!13108 call!13104))) (_1!1265 (ite (or c!22432 c!22430) (tuple2!2509 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2619 (v!3091 (underlying!430 thiss!992)))) (tuple2!2509 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 (v!3091 (underlying!430 thiss!992)))))) (_2!1265 (ite (or c!22432 c!22430) (tuple2!2509 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2619 (v!3091 (underlying!430 thiss!992)))) (tuple2!2509 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 (v!3091 (underlying!430 thiss!992))))))))))

(assert (=> d!37161 (= (+!161 (ite c!22432 call!13106 (ite c!22430 call!13108 call!13104)) (ite (or c!22432 c!22430) (tuple2!2509 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2619 (v!3091 (underlying!430 thiss!992)))) (tuple2!2509 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 (v!3091 (underlying!430 thiss!992)))))) lt!63582)))

(declare-fun b!123614 () Bool)

(declare-fun res!59989 () Bool)

(assert (=> b!123614 (=> (not res!59989) (not e!80791))))

(assert (=> b!123614 (= res!59989 (= (getValueByKey!165 (toList!827 lt!63582) (_1!1265 (ite (or c!22432 c!22430) (tuple2!2509 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2619 (v!3091 (underlying!430 thiss!992)))) (tuple2!2509 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 (v!3091 (underlying!430 thiss!992))))))) (Some!170 (_2!1265 (ite (or c!22432 c!22430) (tuple2!2509 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2619 (v!3091 (underlying!430 thiss!992)))) (tuple2!2509 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 (v!3091 (underlying!430 thiss!992)))))))))))

(declare-fun b!123615 () Bool)

(assert (=> b!123615 (= e!80791 (contains!857 (toList!827 lt!63582) (ite (or c!22432 c!22430) (tuple2!2509 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2619 (v!3091 (underlying!430 thiss!992)))) (tuple2!2509 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 (v!3091 (underlying!430 thiss!992)))))))))

(assert (= (and d!37161 res!59990) b!123614))

(assert (= (and b!123614 res!59989) b!123615))

(declare-fun m!143709 () Bool)

(assert (=> d!37161 m!143709))

(declare-fun m!143711 () Bool)

(assert (=> d!37161 m!143711))

(declare-fun m!143713 () Bool)

(assert (=> d!37161 m!143713))

(declare-fun m!143715 () Bool)

(assert (=> d!37161 m!143715))

(declare-fun m!143717 () Bool)

(assert (=> b!123614 m!143717))

(declare-fun m!143719 () Bool)

(assert (=> b!123615 m!143719))

(assert (=> bm!13103 d!37161))

(declare-fun d!37163 () Bool)

(declare-fun res!59991 () Bool)

(declare-fun e!80792 () Bool)

(assert (=> d!37163 (=> (not res!59991) (not e!80792))))

(assert (=> d!37163 (= res!59991 (simpleValid!84 (v!3091 (underlying!430 thiss!992))))))

(assert (=> d!37163 (= (valid!506 (v!3091 (underlying!430 thiss!992))) e!80792)))

(declare-fun b!123616 () Bool)

(declare-fun res!59992 () Bool)

(assert (=> b!123616 (=> (not res!59992) (not e!80792))))

(assert (=> b!123616 (= res!59992 (= (arrayCountValidKeys!0 (_keys!4481 (v!3091 (underlying!430 thiss!992))) #b00000000000000000000000000000000 (size!2460 (_keys!4481 (v!3091 (underlying!430 thiss!992))))) (_size!570 (v!3091 (underlying!430 thiss!992)))))))

(declare-fun b!123617 () Bool)

(declare-fun res!59993 () Bool)

(assert (=> b!123617 (=> (not res!59993) (not e!80792))))

(assert (=> b!123617 (= res!59993 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4481 (v!3091 (underlying!430 thiss!992))) (mask!6992 (v!3091 (underlying!430 thiss!992)))))))

(declare-fun b!123618 () Bool)

(assert (=> b!123618 (= e!80792 (arrayNoDuplicates!0 (_keys!4481 (v!3091 (underlying!430 thiss!992))) #b00000000000000000000000000000000 Nil!1668))))

(assert (= (and d!37163 res!59991) b!123616))

(assert (= (and b!123616 res!59992) b!123617))

(assert (= (and b!123617 res!59993) b!123618))

(declare-fun m!143721 () Bool)

(assert (=> d!37163 m!143721))

(declare-fun m!143723 () Bool)

(assert (=> b!123616 m!143723))

(declare-fun m!143725 () Bool)

(assert (=> b!123617 m!143725))

(declare-fun m!143727 () Bool)

(assert (=> b!123618 m!143727))

(assert (=> d!37137 d!37163))

(declare-fun b!123619 () Bool)

(declare-fun e!80797 () Bool)

(declare-fun e!80799 () Bool)

(assert (=> b!123619 (= e!80797 e!80799)))

(declare-fun res!59996 () Bool)

(declare-fun call!13115 () Bool)

(assert (=> b!123619 (= res!59996 call!13115)))

(assert (=> b!123619 (=> (not res!59996) (not e!80799))))

(declare-fun bm!13110 () Bool)

(declare-fun call!13118 () ListLongMap!1623)

(declare-fun call!13116 () ListLongMap!1623)

(assert (=> bm!13110 (= call!13118 call!13116)))

(declare-fun b!123620 () Bool)

(declare-fun e!80802 () Bool)

(declare-fun lt!63595 () ListLongMap!1623)

(assert (=> b!123620 (= e!80802 (= (apply!108 lt!63595 (select (arr!2198 (_keys!4481 newMap!16)) #b00000000000000000000000000000000)) (get!1434 (select (arr!2199 (_values!2737 newMap!16)) #b00000000000000000000000000000000) (dynLambda!412 (defaultEntry!2754 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!123620 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2461 (_values!2737 newMap!16))))))

(assert (=> b!123620 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2460 (_keys!4481 newMap!16))))))

(declare-fun bm!13111 () Bool)

(assert (=> bm!13111 (= call!13115 (contains!856 lt!63595 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!123621 () Bool)

(declare-fun e!80803 () ListLongMap!1623)

(declare-fun call!13114 () ListLongMap!1623)

(assert (=> b!123621 (= e!80803 call!13114)))

(declare-fun b!123622 () Bool)

(declare-fun e!80805 () Bool)

(assert (=> b!123622 (= e!80805 (validKeyInArray!0 (select (arr!2198 (_keys!4481 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun bm!13112 () Bool)

(assert (=> bm!13112 (= call!13114 call!13118)))

(declare-fun c!22446 () Bool)

(declare-fun call!13119 () ListLongMap!1623)

(declare-fun bm!13113 () Bool)

(declare-fun c!22448 () Bool)

(assert (=> bm!13113 (= call!13119 (+!161 (ite c!22448 call!13116 (ite c!22446 call!13118 call!13114)) (ite (or c!22448 c!22446) (tuple2!2509 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2619 newMap!16)) (tuple2!2509 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 newMap!16)))))))

(declare-fun d!37165 () Bool)

(declare-fun e!80796 () Bool)

(assert (=> d!37165 e!80796))

(declare-fun res!59994 () Bool)

(assert (=> d!37165 (=> (not res!59994) (not e!80796))))

(assert (=> d!37165 (= res!59994 (or (bvsge #b00000000000000000000000000000000 (size!2460 (_keys!4481 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2460 (_keys!4481 newMap!16))))))))

(declare-fun lt!63585 () ListLongMap!1623)

(assert (=> d!37165 (= lt!63595 lt!63585)))

(declare-fun lt!63594 () Unit!3839)

(declare-fun e!80795 () Unit!3839)

(assert (=> d!37165 (= lt!63594 e!80795)))

(declare-fun c!22450 () Bool)

(assert (=> d!37165 (= c!22450 e!80805)))

(declare-fun res!59997 () Bool)

(assert (=> d!37165 (=> (not res!59997) (not e!80805))))

(assert (=> d!37165 (= res!59997 (bvslt #b00000000000000000000000000000000 (size!2460 (_keys!4481 newMap!16))))))

(declare-fun e!80794 () ListLongMap!1623)

(assert (=> d!37165 (= lt!63585 e!80794)))

(assert (=> d!37165 (= c!22448 (and (not (= (bvand (extraKeys!2539 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2539 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!37165 (validMask!0 (mask!6992 newMap!16))))

(assert (=> d!37165 (= (getCurrentListMap!508 (_keys!4481 newMap!16) (_values!2737 newMap!16) (mask!6992 newMap!16) (extraKeys!2539 newMap!16) (zeroValue!2619 newMap!16) (minValue!2619 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2754 newMap!16)) lt!63595)))

(declare-fun b!123623 () Bool)

(declare-fun Unit!3844 () Unit!3839)

(assert (=> b!123623 (= e!80795 Unit!3844)))

(declare-fun b!123624 () Bool)

(declare-fun call!13113 () ListLongMap!1623)

(assert (=> b!123624 (= e!80803 call!13113)))

(declare-fun bm!13114 () Bool)

(declare-fun call!13117 () Bool)

(assert (=> bm!13114 (= call!13117 (contains!856 lt!63595 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!123625 () Bool)

(declare-fun res!60002 () Bool)

(assert (=> b!123625 (=> (not res!60002) (not e!80796))))

(declare-fun e!80800 () Bool)

(assert (=> b!123625 (= res!60002 e!80800)))

(declare-fun res!60001 () Bool)

(assert (=> b!123625 (=> res!60001 e!80800)))

(declare-fun e!80804 () Bool)

(assert (=> b!123625 (= res!60001 (not e!80804))))

(declare-fun res!60000 () Bool)

(assert (=> b!123625 (=> (not res!60000) (not e!80804))))

(assert (=> b!123625 (= res!60000 (bvslt #b00000000000000000000000000000000 (size!2460 (_keys!4481 newMap!16))))))

(declare-fun b!123626 () Bool)

(assert (=> b!123626 (= e!80794 (+!161 call!13119 (tuple2!2509 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 newMap!16))))))

(declare-fun bm!13115 () Bool)

(assert (=> bm!13115 (= call!13113 call!13119)))

(declare-fun b!123627 () Bool)

(declare-fun e!80798 () Bool)

(declare-fun e!80793 () Bool)

(assert (=> b!123627 (= e!80798 e!80793)))

(declare-fun res!59999 () Bool)

(assert (=> b!123627 (= res!59999 call!13117)))

(assert (=> b!123627 (=> (not res!59999) (not e!80793))))

(declare-fun b!123628 () Bool)

(assert (=> b!123628 (= e!80800 e!80802)))

(declare-fun res!59998 () Bool)

(assert (=> b!123628 (=> (not res!59998) (not e!80802))))

(assert (=> b!123628 (= res!59998 (contains!856 lt!63595 (select (arr!2198 (_keys!4481 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!123628 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2460 (_keys!4481 newMap!16))))))

(declare-fun bm!13116 () Bool)

(assert (=> bm!13116 (= call!13116 (getCurrentListMapNoExtraKeys!128 (_keys!4481 newMap!16) (_values!2737 newMap!16) (mask!6992 newMap!16) (extraKeys!2539 newMap!16) (zeroValue!2619 newMap!16) (minValue!2619 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2754 newMap!16)))))

(declare-fun b!123629 () Bool)

(declare-fun res!59995 () Bool)

(assert (=> b!123629 (=> (not res!59995) (not e!80796))))

(assert (=> b!123629 (= res!59995 e!80797)))

(declare-fun c!22447 () Bool)

(assert (=> b!123629 (= c!22447 (not (= (bvand (extraKeys!2539 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!123630 () Bool)

(declare-fun e!80801 () ListLongMap!1623)

(assert (=> b!123630 (= e!80801 call!13113)))

(declare-fun b!123631 () Bool)

(assert (=> b!123631 (= e!80798 (not call!13117))))

(declare-fun b!123632 () Bool)

(assert (=> b!123632 (= e!80796 e!80798)))

(declare-fun c!22449 () Bool)

(assert (=> b!123632 (= c!22449 (not (= (bvand (extraKeys!2539 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!123633 () Bool)

(assert (=> b!123633 (= e!80797 (not call!13115))))

(declare-fun b!123634 () Bool)

(assert (=> b!123634 (= e!80794 e!80801)))

(assert (=> b!123634 (= c!22446 (and (not (= (bvand (extraKeys!2539 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2539 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!123635 () Bool)

(declare-fun c!22451 () Bool)

(assert (=> b!123635 (= c!22451 (and (not (= (bvand (extraKeys!2539 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2539 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!123635 (= e!80801 e!80803)))

(declare-fun b!123636 () Bool)

(assert (=> b!123636 (= e!80804 (validKeyInArray!0 (select (arr!2198 (_keys!4481 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!123637 () Bool)

(assert (=> b!123637 (= e!80793 (= (apply!108 lt!63595 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2619 newMap!16)))))

(declare-fun b!123638 () Bool)

(assert (=> b!123638 (= e!80799 (= (apply!108 lt!63595 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2619 newMap!16)))))

(declare-fun b!123639 () Bool)

(declare-fun lt!63587 () Unit!3839)

(assert (=> b!123639 (= e!80795 lt!63587)))

(declare-fun lt!63599 () ListLongMap!1623)

(assert (=> b!123639 (= lt!63599 (getCurrentListMapNoExtraKeys!128 (_keys!4481 newMap!16) (_values!2737 newMap!16) (mask!6992 newMap!16) (extraKeys!2539 newMap!16) (zeroValue!2619 newMap!16) (minValue!2619 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2754 newMap!16)))))

(declare-fun lt!63601 () (_ BitVec 64))

(assert (=> b!123639 (= lt!63601 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!63597 () (_ BitVec 64))

(assert (=> b!123639 (= lt!63597 (select (arr!2198 (_keys!4481 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!63604 () Unit!3839)

(assert (=> b!123639 (= lt!63604 (addStillContains!84 lt!63599 lt!63601 (zeroValue!2619 newMap!16) lt!63597))))

(assert (=> b!123639 (contains!856 (+!161 lt!63599 (tuple2!2509 lt!63601 (zeroValue!2619 newMap!16))) lt!63597)))

(declare-fun lt!63598 () Unit!3839)

(assert (=> b!123639 (= lt!63598 lt!63604)))

(declare-fun lt!63605 () ListLongMap!1623)

(assert (=> b!123639 (= lt!63605 (getCurrentListMapNoExtraKeys!128 (_keys!4481 newMap!16) (_values!2737 newMap!16) (mask!6992 newMap!16) (extraKeys!2539 newMap!16) (zeroValue!2619 newMap!16) (minValue!2619 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2754 newMap!16)))))

(declare-fun lt!63606 () (_ BitVec 64))

(assert (=> b!123639 (= lt!63606 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!63590 () (_ BitVec 64))

(assert (=> b!123639 (= lt!63590 (select (arr!2198 (_keys!4481 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!63591 () Unit!3839)

(assert (=> b!123639 (= lt!63591 (addApplyDifferent!84 lt!63605 lt!63606 (minValue!2619 newMap!16) lt!63590))))

(assert (=> b!123639 (= (apply!108 (+!161 lt!63605 (tuple2!2509 lt!63606 (minValue!2619 newMap!16))) lt!63590) (apply!108 lt!63605 lt!63590))))

(declare-fun lt!63602 () Unit!3839)

(assert (=> b!123639 (= lt!63602 lt!63591)))

(declare-fun lt!63589 () ListLongMap!1623)

(assert (=> b!123639 (= lt!63589 (getCurrentListMapNoExtraKeys!128 (_keys!4481 newMap!16) (_values!2737 newMap!16) (mask!6992 newMap!16) (extraKeys!2539 newMap!16) (zeroValue!2619 newMap!16) (minValue!2619 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2754 newMap!16)))))

(declare-fun lt!63603 () (_ BitVec 64))

(assert (=> b!123639 (= lt!63603 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!63596 () (_ BitVec 64))

(assert (=> b!123639 (= lt!63596 (select (arr!2198 (_keys!4481 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!63593 () Unit!3839)

(assert (=> b!123639 (= lt!63593 (addApplyDifferent!84 lt!63589 lt!63603 (zeroValue!2619 newMap!16) lt!63596))))

(assert (=> b!123639 (= (apply!108 (+!161 lt!63589 (tuple2!2509 lt!63603 (zeroValue!2619 newMap!16))) lt!63596) (apply!108 lt!63589 lt!63596))))

(declare-fun lt!63586 () Unit!3839)

(assert (=> b!123639 (= lt!63586 lt!63593)))

(declare-fun lt!63588 () ListLongMap!1623)

(assert (=> b!123639 (= lt!63588 (getCurrentListMapNoExtraKeys!128 (_keys!4481 newMap!16) (_values!2737 newMap!16) (mask!6992 newMap!16) (extraKeys!2539 newMap!16) (zeroValue!2619 newMap!16) (minValue!2619 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2754 newMap!16)))))

(declare-fun lt!63592 () (_ BitVec 64))

(assert (=> b!123639 (= lt!63592 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!63600 () (_ BitVec 64))

(assert (=> b!123639 (= lt!63600 (select (arr!2198 (_keys!4481 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!123639 (= lt!63587 (addApplyDifferent!84 lt!63588 lt!63592 (minValue!2619 newMap!16) lt!63600))))

(assert (=> b!123639 (= (apply!108 (+!161 lt!63588 (tuple2!2509 lt!63592 (minValue!2619 newMap!16))) lt!63600) (apply!108 lt!63588 lt!63600))))

(assert (= (and d!37165 c!22448) b!123626))

(assert (= (and d!37165 (not c!22448)) b!123634))

(assert (= (and b!123634 c!22446) b!123630))

(assert (= (and b!123634 (not c!22446)) b!123635))

(assert (= (and b!123635 c!22451) b!123624))

(assert (= (and b!123635 (not c!22451)) b!123621))

(assert (= (or b!123624 b!123621) bm!13112))

(assert (= (or b!123630 bm!13112) bm!13110))

(assert (= (or b!123630 b!123624) bm!13115))

(assert (= (or b!123626 bm!13110) bm!13116))

(assert (= (or b!123626 bm!13115) bm!13113))

(assert (= (and d!37165 res!59997) b!123622))

(assert (= (and d!37165 c!22450) b!123639))

(assert (= (and d!37165 (not c!22450)) b!123623))

(assert (= (and d!37165 res!59994) b!123625))

(assert (= (and b!123625 res!60000) b!123636))

(assert (= (and b!123625 (not res!60001)) b!123628))

(assert (= (and b!123628 res!59998) b!123620))

(assert (= (and b!123625 res!60002) b!123629))

(assert (= (and b!123629 c!22447) b!123619))

(assert (= (and b!123629 (not c!22447)) b!123633))

(assert (= (and b!123619 res!59996) b!123638))

(assert (= (or b!123619 b!123633) bm!13111))

(assert (= (and b!123629 res!59995) b!123632))

(assert (= (and b!123632 c!22449) b!123627))

(assert (= (and b!123632 (not c!22449)) b!123631))

(assert (= (and b!123627 res!59999) b!123637))

(assert (= (or b!123627 b!123631) bm!13114))

(declare-fun b_lambda!5435 () Bool)

(assert (=> (not b_lambda!5435) (not b!123620)))

(declare-fun t!5972 () Bool)

(declare-fun tb!2265 () Bool)

(assert (=> (and b!123392 (= (defaultEntry!2754 (v!3091 (underlying!430 thiss!992))) (defaultEntry!2754 newMap!16)) t!5972) tb!2265))

(declare-fun result!3771 () Bool)

(assert (=> tb!2265 (= result!3771 tp_is_empty!2821)))

(assert (=> b!123620 t!5972))

(declare-fun b_and!7593 () Bool)

(assert (= b_and!7589 (and (=> t!5972 result!3771) b_and!7593)))

(declare-fun t!5974 () Bool)

(declare-fun tb!2267 () Bool)

(assert (=> (and b!123390 (= (defaultEntry!2754 newMap!16) (defaultEntry!2754 newMap!16)) t!5974) tb!2267))

(declare-fun result!3773 () Bool)

(assert (= result!3773 result!3771))

(assert (=> b!123620 t!5974))

(declare-fun b_and!7595 () Bool)

(assert (= b_and!7591 (and (=> t!5974 result!3773) b_and!7595)))

(declare-fun m!143729 () Bool)

(assert (=> bm!13113 m!143729))

(declare-fun m!143731 () Bool)

(assert (=> b!123637 m!143731))

(declare-fun m!143733 () Bool)

(assert (=> d!37165 m!143733))

(declare-fun m!143735 () Bool)

(assert (=> bm!13116 m!143735))

(declare-fun m!143737 () Bool)

(assert (=> bm!13111 m!143737))

(assert (=> b!123622 m!143701))

(assert (=> b!123622 m!143701))

(assert (=> b!123622 m!143705))

(assert (=> b!123620 m!143701))

(declare-fun m!143739 () Bool)

(assert (=> b!123620 m!143739))

(declare-fun m!143741 () Bool)

(assert (=> b!123620 m!143741))

(declare-fun m!143743 () Bool)

(assert (=> b!123620 m!143743))

(declare-fun m!143745 () Bool)

(assert (=> b!123620 m!143745))

(assert (=> b!123620 m!143741))

(assert (=> b!123620 m!143743))

(assert (=> b!123620 m!143701))

(declare-fun m!143747 () Bool)

(assert (=> bm!13114 m!143747))

(assert (=> b!123636 m!143701))

(assert (=> b!123636 m!143701))

(assert (=> b!123636 m!143705))

(assert (=> b!123628 m!143701))

(assert (=> b!123628 m!143701))

(declare-fun m!143749 () Bool)

(assert (=> b!123628 m!143749))

(declare-fun m!143751 () Bool)

(assert (=> b!123626 m!143751))

(declare-fun m!143753 () Bool)

(assert (=> b!123638 m!143753))

(declare-fun m!143755 () Bool)

(assert (=> b!123639 m!143755))

(declare-fun m!143757 () Bool)

(assert (=> b!123639 m!143757))

(declare-fun m!143759 () Bool)

(assert (=> b!123639 m!143759))

(declare-fun m!143761 () Bool)

(assert (=> b!123639 m!143761))

(assert (=> b!123639 m!143755))

(declare-fun m!143763 () Bool)

(assert (=> b!123639 m!143763))

(declare-fun m!143765 () Bool)

(assert (=> b!123639 m!143765))

(declare-fun m!143767 () Bool)

(assert (=> b!123639 m!143767))

(assert (=> b!123639 m!143765))

(assert (=> b!123639 m!143701))

(declare-fun m!143769 () Bool)

(assert (=> b!123639 m!143769))

(declare-fun m!143771 () Bool)

(assert (=> b!123639 m!143771))

(declare-fun m!143773 () Bool)

(assert (=> b!123639 m!143773))

(declare-fun m!143775 () Bool)

(assert (=> b!123639 m!143775))

(assert (=> b!123639 m!143735))

(declare-fun m!143777 () Bool)

(assert (=> b!123639 m!143777))

(declare-fun m!143779 () Bool)

(assert (=> b!123639 m!143779))

(assert (=> b!123639 m!143777))

(declare-fun m!143781 () Bool)

(assert (=> b!123639 m!143781))

(declare-fun m!143783 () Bool)

(assert (=> b!123639 m!143783))

(assert (=> b!123639 m!143769))

(assert (=> d!37145 d!37165))

(declare-fun d!37167 () Bool)

(assert (=> d!37167 (= (validMask!0 (mask!6992 (v!3091 (underlying!430 thiss!992)))) (and (or (= (mask!6992 (v!3091 (underlying!430 thiss!992))) #b00000000000000000000000000000111) (= (mask!6992 (v!3091 (underlying!430 thiss!992))) #b00000000000000000000000000001111) (= (mask!6992 (v!3091 (underlying!430 thiss!992))) #b00000000000000000000000000011111) (= (mask!6992 (v!3091 (underlying!430 thiss!992))) #b00000000000000000000000000111111) (= (mask!6992 (v!3091 (underlying!430 thiss!992))) #b00000000000000000000000001111111) (= (mask!6992 (v!3091 (underlying!430 thiss!992))) #b00000000000000000000000011111111) (= (mask!6992 (v!3091 (underlying!430 thiss!992))) #b00000000000000000000000111111111) (= (mask!6992 (v!3091 (underlying!430 thiss!992))) #b00000000000000000000001111111111) (= (mask!6992 (v!3091 (underlying!430 thiss!992))) #b00000000000000000000011111111111) (= (mask!6992 (v!3091 (underlying!430 thiss!992))) #b00000000000000000000111111111111) (= (mask!6992 (v!3091 (underlying!430 thiss!992))) #b00000000000000000001111111111111) (= (mask!6992 (v!3091 (underlying!430 thiss!992))) #b00000000000000000011111111111111) (= (mask!6992 (v!3091 (underlying!430 thiss!992))) #b00000000000000000111111111111111) (= (mask!6992 (v!3091 (underlying!430 thiss!992))) #b00000000000000001111111111111111) (= (mask!6992 (v!3091 (underlying!430 thiss!992))) #b00000000000000011111111111111111) (= (mask!6992 (v!3091 (underlying!430 thiss!992))) #b00000000000000111111111111111111) (= (mask!6992 (v!3091 (underlying!430 thiss!992))) #b00000000000001111111111111111111) (= (mask!6992 (v!3091 (underlying!430 thiss!992))) #b00000000000011111111111111111111) (= (mask!6992 (v!3091 (underlying!430 thiss!992))) #b00000000000111111111111111111111) (= (mask!6992 (v!3091 (underlying!430 thiss!992))) #b00000000001111111111111111111111) (= (mask!6992 (v!3091 (underlying!430 thiss!992))) #b00000000011111111111111111111111) (= (mask!6992 (v!3091 (underlying!430 thiss!992))) #b00000000111111111111111111111111) (= (mask!6992 (v!3091 (underlying!430 thiss!992))) #b00000001111111111111111111111111) (= (mask!6992 (v!3091 (underlying!430 thiss!992))) #b00000011111111111111111111111111) (= (mask!6992 (v!3091 (underlying!430 thiss!992))) #b00000111111111111111111111111111) (= (mask!6992 (v!3091 (underlying!430 thiss!992))) #b00001111111111111111111111111111) (= (mask!6992 (v!3091 (underlying!430 thiss!992))) #b00011111111111111111111111111111) (= (mask!6992 (v!3091 (underlying!430 thiss!992))) #b00111111111111111111111111111111)) (bvsle (mask!6992 (v!3091 (underlying!430 thiss!992))) #b00111111111111111111111111111111)))))

(assert (=> d!37143 d!37167))

(declare-fun b!123650 () Bool)

(declare-fun res!60011 () Bool)

(declare-fun e!80808 () Bool)

(assert (=> b!123650 (=> (not res!60011) (not e!80808))))

(declare-fun size!2466 (LongMapFixedSize!1042) (_ BitVec 32))

(assert (=> b!123650 (= res!60011 (= (size!2466 newMap!16) (bvadd (_size!570 newMap!16) (bvsdiv (bvadd (extraKeys!2539 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!123651 () Bool)

(assert (=> b!123651 (= e!80808 (and (bvsge (extraKeys!2539 newMap!16) #b00000000000000000000000000000000) (bvsle (extraKeys!2539 newMap!16) #b00000000000000000000000000000011) (bvsge (_vacant!570 newMap!16) #b00000000000000000000000000000000)))))

(declare-fun d!37169 () Bool)

(declare-fun res!60013 () Bool)

(assert (=> d!37169 (=> (not res!60013) (not e!80808))))

(assert (=> d!37169 (= res!60013 (validMask!0 (mask!6992 newMap!16)))))

(assert (=> d!37169 (= (simpleValid!84 newMap!16) e!80808)))

(declare-fun b!123648 () Bool)

(declare-fun res!60012 () Bool)

(assert (=> b!123648 (=> (not res!60012) (not e!80808))))

(assert (=> b!123648 (= res!60012 (and (= (size!2461 (_values!2737 newMap!16)) (bvadd (mask!6992 newMap!16) #b00000000000000000000000000000001)) (= (size!2460 (_keys!4481 newMap!16)) (size!2461 (_values!2737 newMap!16))) (bvsge (_size!570 newMap!16) #b00000000000000000000000000000000) (bvsle (_size!570 newMap!16) (bvadd (mask!6992 newMap!16) #b00000000000000000000000000000001))))))

(declare-fun b!123649 () Bool)

(declare-fun res!60014 () Bool)

(assert (=> b!123649 (=> (not res!60014) (not e!80808))))

(assert (=> b!123649 (= res!60014 (bvsge (size!2466 newMap!16) (_size!570 newMap!16)))))

(assert (= (and d!37169 res!60013) b!123648))

(assert (= (and b!123648 res!60012) b!123649))

(assert (= (and b!123649 res!60014) b!123650))

(assert (= (and b!123650 res!60011) b!123651))

(declare-fun m!143785 () Bool)

(assert (=> b!123650 m!143785))

(assert (=> d!37169 m!143733))

(assert (=> b!123649 m!143785))

(assert (=> d!37135 d!37169))

(declare-fun d!37171 () Bool)

(declare-fun e!80809 () Bool)

(assert (=> d!37171 e!80809))

(declare-fun res!60015 () Bool)

(assert (=> d!37171 (=> res!60015 e!80809)))

(declare-fun lt!63607 () Bool)

(assert (=> d!37171 (= res!60015 (not lt!63607))))

(declare-fun lt!63608 () Bool)

(assert (=> d!37171 (= lt!63607 lt!63608)))

(declare-fun lt!63609 () Unit!3839)

(declare-fun e!80810 () Unit!3839)

(assert (=> d!37171 (= lt!63609 e!80810)))

(declare-fun c!22452 () Bool)

(assert (=> d!37171 (= c!22452 lt!63608)))

(assert (=> d!37171 (= lt!63608 (containsKey!168 (toList!827 lt!63541) (select (arr!2198 (_keys!4481 (v!3091 (underlying!430 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> d!37171 (= (contains!856 lt!63541 (select (arr!2198 (_keys!4481 (v!3091 (underlying!430 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) lt!63607)))

(declare-fun b!123652 () Bool)

(declare-fun lt!63610 () Unit!3839)

(assert (=> b!123652 (= e!80810 lt!63610)))

(assert (=> b!123652 (= lt!63610 (lemmaContainsKeyImpliesGetValueByKeyDefined!116 (toList!827 lt!63541) (select (arr!2198 (_keys!4481 (v!3091 (underlying!430 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!123652 (isDefined!117 (getValueByKey!165 (toList!827 lt!63541) (select (arr!2198 (_keys!4481 (v!3091 (underlying!430 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!123653 () Bool)

(declare-fun Unit!3845 () Unit!3839)

(assert (=> b!123653 (= e!80810 Unit!3845)))

(declare-fun b!123654 () Bool)

(assert (=> b!123654 (= e!80809 (isDefined!117 (getValueByKey!165 (toList!827 lt!63541) (select (arr!2198 (_keys!4481 (v!3091 (underlying!430 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(assert (= (and d!37171 c!22452) b!123652))

(assert (= (and d!37171 (not c!22452)) b!123653))

(assert (= (and d!37171 (not res!60015)) b!123654))

(assert (=> d!37171 m!143609))

(declare-fun m!143787 () Bool)

(assert (=> d!37171 m!143787))

(assert (=> b!123652 m!143609))

(declare-fun m!143789 () Bool)

(assert (=> b!123652 m!143789))

(assert (=> b!123652 m!143609))

(assert (=> b!123652 m!143685))

(assert (=> b!123652 m!143685))

(declare-fun m!143791 () Bool)

(assert (=> b!123652 m!143791))

(assert (=> b!123654 m!143609))

(assert (=> b!123654 m!143685))

(assert (=> b!123654 m!143685))

(assert (=> b!123654 m!143791))

(assert (=> b!123551 d!37171))

(declare-fun d!37173 () Bool)

(assert (=> d!37173 (= (apply!108 lt!63541 #b1000000000000000000000000000000000000000000000000000000000000000) (get!1435 (getValueByKey!165 (toList!827 lt!63541) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!5129 () Bool)

(assert (= bs!5129 d!37173))

(assert (=> bs!5129 m!143697))

(assert (=> bs!5129 m!143697))

(declare-fun m!143793 () Bool)

(assert (=> bs!5129 m!143793))

(assert (=> b!123560 d!37173))

(declare-fun b!123679 () Bool)

(declare-fun res!60027 () Bool)

(declare-fun e!80826 () Bool)

(assert (=> b!123679 (=> (not res!60027) (not e!80826))))

(declare-fun lt!63630 () ListLongMap!1623)

(assert (=> b!123679 (= res!60027 (not (contains!856 lt!63630 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!123680 () Bool)

(declare-fun e!80831 () Bool)

(assert (=> b!123680 (= e!80831 (= lt!63630 (getCurrentListMapNoExtraKeys!128 (_keys!4481 (v!3091 (underlying!430 thiss!992))) (_values!2737 (v!3091 (underlying!430 thiss!992))) (mask!6992 (v!3091 (underlying!430 thiss!992))) (extraKeys!2539 (v!3091 (underlying!430 thiss!992))) (zeroValue!2619 (v!3091 (underlying!430 thiss!992))) (minValue!2619 (v!3091 (underlying!430 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!2754 (v!3091 (underlying!430 thiss!992))))))))

(declare-fun b!123681 () Bool)

(declare-fun e!80827 () ListLongMap!1623)

(assert (=> b!123681 (= e!80827 (ListLongMap!1624 Nil!1667))))

(declare-fun b!123683 () Bool)

(declare-fun e!80829 () Bool)

(declare-fun e!80828 () Bool)

(assert (=> b!123683 (= e!80829 e!80828)))

(assert (=> b!123683 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2460 (_keys!4481 (v!3091 (underlying!430 thiss!992))))))))

(declare-fun res!60024 () Bool)

(assert (=> b!123683 (= res!60024 (contains!856 lt!63630 (select (arr!2198 (_keys!4481 (v!3091 (underlying!430 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!123683 (=> (not res!60024) (not e!80828))))

(declare-fun b!123684 () Bool)

(declare-fun e!80830 () ListLongMap!1623)

(declare-fun call!13122 () ListLongMap!1623)

(assert (=> b!123684 (= e!80830 call!13122)))

(declare-fun b!123685 () Bool)

(declare-fun lt!63625 () Unit!3839)

(declare-fun lt!63628 () Unit!3839)

(assert (=> b!123685 (= lt!63625 lt!63628)))

(declare-fun lt!63626 () (_ BitVec 64))

(declare-fun lt!63627 () V!3409)

(declare-fun lt!63629 () (_ BitVec 64))

(declare-fun lt!63631 () ListLongMap!1623)

(assert (=> b!123685 (not (contains!856 (+!161 lt!63631 (tuple2!2509 lt!63629 lt!63627)) lt!63626))))

(declare-fun addStillNotContains!56 (ListLongMap!1623 (_ BitVec 64) V!3409 (_ BitVec 64)) Unit!3839)

(assert (=> b!123685 (= lt!63628 (addStillNotContains!56 lt!63631 lt!63629 lt!63627 lt!63626))))

(assert (=> b!123685 (= lt!63626 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!123685 (= lt!63627 (get!1434 (select (arr!2199 (_values!2737 (v!3091 (underlying!430 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!412 (defaultEntry!2754 (v!3091 (underlying!430 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!123685 (= lt!63629 (select (arr!2198 (_keys!4481 (v!3091 (underlying!430 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(assert (=> b!123685 (= lt!63631 call!13122)))

(assert (=> b!123685 (= e!80830 (+!161 call!13122 (tuple2!2509 (select (arr!2198 (_keys!4481 (v!3091 (underlying!430 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1434 (select (arr!2199 (_values!2737 (v!3091 (underlying!430 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!412 (defaultEntry!2754 (v!3091 (underlying!430 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!123686 () Bool)

(assert (=> b!123686 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2460 (_keys!4481 (v!3091 (underlying!430 thiss!992))))))))

(assert (=> b!123686 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2461 (_values!2737 (v!3091 (underlying!430 thiss!992))))))))

(assert (=> b!123686 (= e!80828 (= (apply!108 lt!63630 (select (arr!2198 (_keys!4481 (v!3091 (underlying!430 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1434 (select (arr!2199 (_values!2737 (v!3091 (underlying!430 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!412 (defaultEntry!2754 (v!3091 (underlying!430 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!123687 () Bool)

(declare-fun isEmpty!396 (ListLongMap!1623) Bool)

(assert (=> b!123687 (= e!80831 (isEmpty!396 lt!63630))))

(declare-fun b!123688 () Bool)

(assert (=> b!123688 (= e!80827 e!80830)))

(declare-fun c!22464 () Bool)

(assert (=> b!123688 (= c!22464 (validKeyInArray!0 (select (arr!2198 (_keys!4481 (v!3091 (underlying!430 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun bm!13119 () Bool)

(assert (=> bm!13119 (= call!13122 (getCurrentListMapNoExtraKeys!128 (_keys!4481 (v!3091 (underlying!430 thiss!992))) (_values!2737 (v!3091 (underlying!430 thiss!992))) (mask!6992 (v!3091 (underlying!430 thiss!992))) (extraKeys!2539 (v!3091 (underlying!430 thiss!992))) (zeroValue!2619 (v!3091 (underlying!430 thiss!992))) (minValue!2619 (v!3091 (underlying!430 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!2754 (v!3091 (underlying!430 thiss!992)))))))

(declare-fun d!37175 () Bool)

(assert (=> d!37175 e!80826))

(declare-fun res!60025 () Bool)

(assert (=> d!37175 (=> (not res!60025) (not e!80826))))

(assert (=> d!37175 (= res!60025 (not (contains!856 lt!63630 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!37175 (= lt!63630 e!80827)))

(declare-fun c!22462 () Bool)

(assert (=> d!37175 (= c!22462 (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2460 (_keys!4481 (v!3091 (underlying!430 thiss!992))))))))

(assert (=> d!37175 (validMask!0 (mask!6992 (v!3091 (underlying!430 thiss!992))))))

(assert (=> d!37175 (= (getCurrentListMapNoExtraKeys!128 (_keys!4481 (v!3091 (underlying!430 thiss!992))) (_values!2737 (v!3091 (underlying!430 thiss!992))) (mask!6992 (v!3091 (underlying!430 thiss!992))) (extraKeys!2539 (v!3091 (underlying!430 thiss!992))) (zeroValue!2619 (v!3091 (underlying!430 thiss!992))) (minValue!2619 (v!3091 (underlying!430 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2754 (v!3091 (underlying!430 thiss!992)))) lt!63630)))

(declare-fun b!123682 () Bool)

(declare-fun e!80825 () Bool)

(assert (=> b!123682 (= e!80825 (validKeyInArray!0 (select (arr!2198 (_keys!4481 (v!3091 (underlying!430 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!123682 (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000)))

(declare-fun b!123689 () Bool)

(assert (=> b!123689 (= e!80826 e!80829)))

(declare-fun c!22461 () Bool)

(assert (=> b!123689 (= c!22461 e!80825)))

(declare-fun res!60026 () Bool)

(assert (=> b!123689 (=> (not res!60026) (not e!80825))))

(assert (=> b!123689 (= res!60026 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2460 (_keys!4481 (v!3091 (underlying!430 thiss!992))))))))

(declare-fun b!123690 () Bool)

(assert (=> b!123690 (= e!80829 e!80831)))

(declare-fun c!22463 () Bool)

(assert (=> b!123690 (= c!22463 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2460 (_keys!4481 (v!3091 (underlying!430 thiss!992))))))))

(assert (= (and d!37175 c!22462) b!123681))

(assert (= (and d!37175 (not c!22462)) b!123688))

(assert (= (and b!123688 c!22464) b!123685))

(assert (= (and b!123688 (not c!22464)) b!123684))

(assert (= (or b!123685 b!123684) bm!13119))

(assert (= (and d!37175 res!60025) b!123679))

(assert (= (and b!123679 res!60027) b!123689))

(assert (= (and b!123689 res!60026) b!123682))

(assert (= (and b!123689 c!22461) b!123683))

(assert (= (and b!123689 (not c!22461)) b!123690))

(assert (= (and b!123683 res!60024) b!123686))

(assert (= (and b!123690 c!22463) b!123680))

(assert (= (and b!123690 (not c!22463)) b!123687))

(declare-fun b_lambda!5437 () Bool)

(assert (=> (not b_lambda!5437) (not b!123685)))

(assert (=> b!123685 t!5967))

(declare-fun b_and!7597 () Bool)

(assert (= b_and!7593 (and (=> t!5967 result!3763) b_and!7597)))

(assert (=> b!123685 t!5969))

(declare-fun b_and!7599 () Bool)

(assert (= b_and!7595 (and (=> t!5969 result!3767) b_and!7599)))

(declare-fun b_lambda!5439 () Bool)

(assert (=> (not b_lambda!5439) (not b!123686)))

(assert (=> b!123686 t!5967))

(declare-fun b_and!7601 () Bool)

(assert (= b_and!7597 (and (=> t!5967 result!3763) b_and!7601)))

(assert (=> b!123686 t!5969))

(declare-fun b_and!7603 () Bool)

(assert (= b_and!7599 (and (=> t!5969 result!3767) b_and!7603)))

(assert (=> b!123683 m!143609))

(assert (=> b!123683 m!143609))

(declare-fun m!143795 () Bool)

(assert (=> b!123683 m!143795))

(declare-fun m!143797 () Bool)

(assert (=> b!123687 m!143797))

(declare-fun m!143799 () Bool)

(assert (=> bm!13119 m!143799))

(declare-fun m!143801 () Bool)

(assert (=> b!123685 m!143801))

(assert (=> b!123685 m!143617))

(assert (=> b!123685 m!143609))

(declare-fun m!143803 () Bool)

(assert (=> b!123685 m!143803))

(declare-fun m!143805 () Bool)

(assert (=> b!123685 m!143805))

(assert (=> b!123685 m!143615))

(assert (=> b!123685 m!143803))

(assert (=> b!123685 m!143615))

(assert (=> b!123685 m!143617))

(assert (=> b!123685 m!143619))

(declare-fun m!143807 () Bool)

(assert (=> b!123685 m!143807))

(assert (=> b!123682 m!143609))

(assert (=> b!123682 m!143609))

(assert (=> b!123682 m!143611))

(assert (=> b!123688 m!143609))

(assert (=> b!123688 m!143609))

(assert (=> b!123688 m!143611))

(declare-fun m!143809 () Bool)

(assert (=> b!123679 m!143809))

(declare-fun m!143811 () Bool)

(assert (=> d!37175 m!143811))

(assert (=> d!37175 m!143603))

(assert (=> b!123680 m!143799))

(assert (=> b!123686 m!143617))

(assert (=> b!123686 m!143609))

(assert (=> b!123686 m!143615))

(assert (=> b!123686 m!143609))

(declare-fun m!143813 () Bool)

(assert (=> b!123686 m!143813))

(assert (=> b!123686 m!143615))

(assert (=> b!123686 m!143617))

(assert (=> b!123686 m!143619))

(assert (=> bm!13106 d!37175))

(declare-fun d!37177 () Bool)

(assert (=> d!37177 (= (apply!108 (+!161 lt!63534 (tuple2!2509 lt!63538 (minValue!2619 (v!3091 (underlying!430 thiss!992))))) lt!63546) (get!1435 (getValueByKey!165 (toList!827 (+!161 lt!63534 (tuple2!2509 lt!63538 (minValue!2619 (v!3091 (underlying!430 thiss!992)))))) lt!63546)))))

(declare-fun bs!5130 () Bool)

(assert (= bs!5130 d!37177))

(declare-fun m!143815 () Bool)

(assert (=> bs!5130 m!143815))

(assert (=> bs!5130 m!143815))

(declare-fun m!143817 () Bool)

(assert (=> bs!5130 m!143817))

(assert (=> b!123562 d!37177))

(declare-fun d!37179 () Bool)

(declare-fun e!80832 () Bool)

(assert (=> d!37179 e!80832))

(declare-fun res!60029 () Bool)

(assert (=> d!37179 (=> (not res!60029) (not e!80832))))

(declare-fun lt!63633 () ListLongMap!1623)

(assert (=> d!37179 (= res!60029 (contains!856 lt!63633 (_1!1265 (tuple2!2509 lt!63549 (zeroValue!2619 (v!3091 (underlying!430 thiss!992)))))))))

(declare-fun lt!63635 () List!1670)

(assert (=> d!37179 (= lt!63633 (ListLongMap!1624 lt!63635))))

(declare-fun lt!63634 () Unit!3839)

(declare-fun lt!63632 () Unit!3839)

(assert (=> d!37179 (= lt!63634 lt!63632)))

(assert (=> d!37179 (= (getValueByKey!165 lt!63635 (_1!1265 (tuple2!2509 lt!63549 (zeroValue!2619 (v!3091 (underlying!430 thiss!992)))))) (Some!170 (_2!1265 (tuple2!2509 lt!63549 (zeroValue!2619 (v!3091 (underlying!430 thiss!992)))))))))

(assert (=> d!37179 (= lt!63632 (lemmaContainsTupThenGetReturnValue!81 lt!63635 (_1!1265 (tuple2!2509 lt!63549 (zeroValue!2619 (v!3091 (underlying!430 thiss!992))))) (_2!1265 (tuple2!2509 lt!63549 (zeroValue!2619 (v!3091 (underlying!430 thiss!992)))))))))

(assert (=> d!37179 (= lt!63635 (insertStrictlySorted!84 (toList!827 lt!63535) (_1!1265 (tuple2!2509 lt!63549 (zeroValue!2619 (v!3091 (underlying!430 thiss!992))))) (_2!1265 (tuple2!2509 lt!63549 (zeroValue!2619 (v!3091 (underlying!430 thiss!992)))))))))

(assert (=> d!37179 (= (+!161 lt!63535 (tuple2!2509 lt!63549 (zeroValue!2619 (v!3091 (underlying!430 thiss!992))))) lt!63633)))

(declare-fun b!123691 () Bool)

(declare-fun res!60028 () Bool)

(assert (=> b!123691 (=> (not res!60028) (not e!80832))))

(assert (=> b!123691 (= res!60028 (= (getValueByKey!165 (toList!827 lt!63633) (_1!1265 (tuple2!2509 lt!63549 (zeroValue!2619 (v!3091 (underlying!430 thiss!992)))))) (Some!170 (_2!1265 (tuple2!2509 lt!63549 (zeroValue!2619 (v!3091 (underlying!430 thiss!992))))))))))

(declare-fun b!123692 () Bool)

(assert (=> b!123692 (= e!80832 (contains!857 (toList!827 lt!63633) (tuple2!2509 lt!63549 (zeroValue!2619 (v!3091 (underlying!430 thiss!992))))))))

(assert (= (and d!37179 res!60029) b!123691))

(assert (= (and b!123691 res!60028) b!123692))

(declare-fun m!143819 () Bool)

(assert (=> d!37179 m!143819))

(declare-fun m!143821 () Bool)

(assert (=> d!37179 m!143821))

(declare-fun m!143823 () Bool)

(assert (=> d!37179 m!143823))

(declare-fun m!143825 () Bool)

(assert (=> d!37179 m!143825))

(declare-fun m!143827 () Bool)

(assert (=> b!123691 m!143827))

(declare-fun m!143829 () Bool)

(assert (=> b!123692 m!143829))

(assert (=> b!123562 d!37179))

(assert (=> b!123562 d!37175))

(declare-fun d!37181 () Bool)

(assert (=> d!37181 (= (apply!108 (+!161 lt!63551 (tuple2!2509 lt!63552 (minValue!2619 (v!3091 (underlying!430 thiss!992))))) lt!63536) (get!1435 (getValueByKey!165 (toList!827 (+!161 lt!63551 (tuple2!2509 lt!63552 (minValue!2619 (v!3091 (underlying!430 thiss!992)))))) lt!63536)))))

(declare-fun bs!5131 () Bool)

(assert (= bs!5131 d!37181))

(declare-fun m!143831 () Bool)

(assert (=> bs!5131 m!143831))

(assert (=> bs!5131 m!143831))

(declare-fun m!143833 () Bool)

(assert (=> bs!5131 m!143833))

(assert (=> b!123562 d!37181))

(declare-fun d!37183 () Bool)

(assert (=> d!37183 (= (apply!108 (+!161 lt!63551 (tuple2!2509 lt!63552 (minValue!2619 (v!3091 (underlying!430 thiss!992))))) lt!63536) (apply!108 lt!63551 lt!63536))))

(declare-fun lt!63638 () Unit!3839)

(declare-fun choose!749 (ListLongMap!1623 (_ BitVec 64) V!3409 (_ BitVec 64)) Unit!3839)

(assert (=> d!37183 (= lt!63638 (choose!749 lt!63551 lt!63552 (minValue!2619 (v!3091 (underlying!430 thiss!992))) lt!63536))))

(declare-fun e!80835 () Bool)

(assert (=> d!37183 e!80835))

(declare-fun res!60032 () Bool)

(assert (=> d!37183 (=> (not res!60032) (not e!80835))))

(assert (=> d!37183 (= res!60032 (contains!856 lt!63551 lt!63536))))

(assert (=> d!37183 (= (addApplyDifferent!84 lt!63551 lt!63552 (minValue!2619 (v!3091 (underlying!430 thiss!992))) lt!63536) lt!63638)))

(declare-fun b!123696 () Bool)

(assert (=> b!123696 (= e!80835 (not (= lt!63536 lt!63552)))))

(assert (= (and d!37183 res!60032) b!123696))

(declare-fun m!143835 () Bool)

(assert (=> d!37183 m!143835))

(assert (=> d!37183 m!143651))

(declare-fun m!143837 () Bool)

(assert (=> d!37183 m!143837))

(assert (=> d!37183 m!143655))

(assert (=> d!37183 m!143651))

(assert (=> d!37183 m!143653))

(assert (=> b!123562 d!37183))

(declare-fun d!37185 () Bool)

(assert (=> d!37185 (= (apply!108 (+!161 lt!63535 (tuple2!2509 lt!63549 (zeroValue!2619 (v!3091 (underlying!430 thiss!992))))) lt!63542) (get!1435 (getValueByKey!165 (toList!827 (+!161 lt!63535 (tuple2!2509 lt!63549 (zeroValue!2619 (v!3091 (underlying!430 thiss!992)))))) lt!63542)))))

(declare-fun bs!5132 () Bool)

(assert (= bs!5132 d!37185))

(declare-fun m!143839 () Bool)

(assert (=> bs!5132 m!143839))

(assert (=> bs!5132 m!143839))

(declare-fun m!143841 () Bool)

(assert (=> bs!5132 m!143841))

(assert (=> b!123562 d!37185))

(declare-fun d!37187 () Bool)

(declare-fun e!80836 () Bool)

(assert (=> d!37187 e!80836))

(declare-fun res!60034 () Bool)

(assert (=> d!37187 (=> (not res!60034) (not e!80836))))

(declare-fun lt!63640 () ListLongMap!1623)

(assert (=> d!37187 (= res!60034 (contains!856 lt!63640 (_1!1265 (tuple2!2509 lt!63552 (minValue!2619 (v!3091 (underlying!430 thiss!992)))))))))

(declare-fun lt!63642 () List!1670)

(assert (=> d!37187 (= lt!63640 (ListLongMap!1624 lt!63642))))

(declare-fun lt!63641 () Unit!3839)

(declare-fun lt!63639 () Unit!3839)

(assert (=> d!37187 (= lt!63641 lt!63639)))

(assert (=> d!37187 (= (getValueByKey!165 lt!63642 (_1!1265 (tuple2!2509 lt!63552 (minValue!2619 (v!3091 (underlying!430 thiss!992)))))) (Some!170 (_2!1265 (tuple2!2509 lt!63552 (minValue!2619 (v!3091 (underlying!430 thiss!992)))))))))

(assert (=> d!37187 (= lt!63639 (lemmaContainsTupThenGetReturnValue!81 lt!63642 (_1!1265 (tuple2!2509 lt!63552 (minValue!2619 (v!3091 (underlying!430 thiss!992))))) (_2!1265 (tuple2!2509 lt!63552 (minValue!2619 (v!3091 (underlying!430 thiss!992)))))))))

(assert (=> d!37187 (= lt!63642 (insertStrictlySorted!84 (toList!827 lt!63551) (_1!1265 (tuple2!2509 lt!63552 (minValue!2619 (v!3091 (underlying!430 thiss!992))))) (_2!1265 (tuple2!2509 lt!63552 (minValue!2619 (v!3091 (underlying!430 thiss!992)))))))))

(assert (=> d!37187 (= (+!161 lt!63551 (tuple2!2509 lt!63552 (minValue!2619 (v!3091 (underlying!430 thiss!992))))) lt!63640)))

(declare-fun b!123697 () Bool)

(declare-fun res!60033 () Bool)

(assert (=> b!123697 (=> (not res!60033) (not e!80836))))

(assert (=> b!123697 (= res!60033 (= (getValueByKey!165 (toList!827 lt!63640) (_1!1265 (tuple2!2509 lt!63552 (minValue!2619 (v!3091 (underlying!430 thiss!992)))))) (Some!170 (_2!1265 (tuple2!2509 lt!63552 (minValue!2619 (v!3091 (underlying!430 thiss!992))))))))))

(declare-fun b!123698 () Bool)

(assert (=> b!123698 (= e!80836 (contains!857 (toList!827 lt!63640) (tuple2!2509 lt!63552 (minValue!2619 (v!3091 (underlying!430 thiss!992))))))))

(assert (= (and d!37187 res!60034) b!123697))

(assert (= (and b!123697 res!60033) b!123698))

(declare-fun m!143843 () Bool)

(assert (=> d!37187 m!143843))

(declare-fun m!143845 () Bool)

(assert (=> d!37187 m!143845))

(declare-fun m!143847 () Bool)

(assert (=> d!37187 m!143847))

(declare-fun m!143849 () Bool)

(assert (=> d!37187 m!143849))

(declare-fun m!143851 () Bool)

(assert (=> b!123697 m!143851))

(declare-fun m!143853 () Bool)

(assert (=> b!123698 m!143853))

(assert (=> b!123562 d!37187))

(declare-fun d!37189 () Bool)

(assert (=> d!37189 (= (apply!108 lt!63534 lt!63546) (get!1435 (getValueByKey!165 (toList!827 lt!63534) lt!63546)))))

(declare-fun bs!5133 () Bool)

(assert (= bs!5133 d!37189))

(declare-fun m!143855 () Bool)

(assert (=> bs!5133 m!143855))

(assert (=> bs!5133 m!143855))

(declare-fun m!143857 () Bool)

(assert (=> bs!5133 m!143857))

(assert (=> b!123562 d!37189))

(declare-fun d!37191 () Bool)

(declare-fun e!80837 () Bool)

(assert (=> d!37191 e!80837))

(declare-fun res!60036 () Bool)

(assert (=> d!37191 (=> (not res!60036) (not e!80837))))

(declare-fun lt!63644 () ListLongMap!1623)

(assert (=> d!37191 (= res!60036 (contains!856 lt!63644 (_1!1265 (tuple2!2509 lt!63538 (minValue!2619 (v!3091 (underlying!430 thiss!992)))))))))

(declare-fun lt!63646 () List!1670)

(assert (=> d!37191 (= lt!63644 (ListLongMap!1624 lt!63646))))

(declare-fun lt!63645 () Unit!3839)

(declare-fun lt!63643 () Unit!3839)

(assert (=> d!37191 (= lt!63645 lt!63643)))

(assert (=> d!37191 (= (getValueByKey!165 lt!63646 (_1!1265 (tuple2!2509 lt!63538 (minValue!2619 (v!3091 (underlying!430 thiss!992)))))) (Some!170 (_2!1265 (tuple2!2509 lt!63538 (minValue!2619 (v!3091 (underlying!430 thiss!992)))))))))

(assert (=> d!37191 (= lt!63643 (lemmaContainsTupThenGetReturnValue!81 lt!63646 (_1!1265 (tuple2!2509 lt!63538 (minValue!2619 (v!3091 (underlying!430 thiss!992))))) (_2!1265 (tuple2!2509 lt!63538 (minValue!2619 (v!3091 (underlying!430 thiss!992)))))))))

(assert (=> d!37191 (= lt!63646 (insertStrictlySorted!84 (toList!827 lt!63534) (_1!1265 (tuple2!2509 lt!63538 (minValue!2619 (v!3091 (underlying!430 thiss!992))))) (_2!1265 (tuple2!2509 lt!63538 (minValue!2619 (v!3091 (underlying!430 thiss!992)))))))))

(assert (=> d!37191 (= (+!161 lt!63534 (tuple2!2509 lt!63538 (minValue!2619 (v!3091 (underlying!430 thiss!992))))) lt!63644)))

(declare-fun b!123699 () Bool)

(declare-fun res!60035 () Bool)

(assert (=> b!123699 (=> (not res!60035) (not e!80837))))

(assert (=> b!123699 (= res!60035 (= (getValueByKey!165 (toList!827 lt!63644) (_1!1265 (tuple2!2509 lt!63538 (minValue!2619 (v!3091 (underlying!430 thiss!992)))))) (Some!170 (_2!1265 (tuple2!2509 lt!63538 (minValue!2619 (v!3091 (underlying!430 thiss!992))))))))))

(declare-fun b!123700 () Bool)

(assert (=> b!123700 (= e!80837 (contains!857 (toList!827 lt!63644) (tuple2!2509 lt!63538 (minValue!2619 (v!3091 (underlying!430 thiss!992))))))))

(assert (= (and d!37191 res!60036) b!123699))

(assert (= (and b!123699 res!60035) b!123700))

(declare-fun m!143859 () Bool)

(assert (=> d!37191 m!143859))

(declare-fun m!143861 () Bool)

(assert (=> d!37191 m!143861))

(declare-fun m!143863 () Bool)

(assert (=> d!37191 m!143863))

(declare-fun m!143865 () Bool)

(assert (=> d!37191 m!143865))

(declare-fun m!143867 () Bool)

(assert (=> b!123699 m!143867))

(declare-fun m!143869 () Bool)

(assert (=> b!123700 m!143869))

(assert (=> b!123562 d!37191))

(declare-fun d!37193 () Bool)

(assert (=> d!37193 (= (apply!108 lt!63551 lt!63536) (get!1435 (getValueByKey!165 (toList!827 lt!63551) lt!63536)))))

(declare-fun bs!5134 () Bool)

(assert (= bs!5134 d!37193))

(declare-fun m!143871 () Bool)

(assert (=> bs!5134 m!143871))

(assert (=> bs!5134 m!143871))

(declare-fun m!143873 () Bool)

(assert (=> bs!5134 m!143873))

(assert (=> b!123562 d!37193))

(declare-fun d!37195 () Bool)

(assert (=> d!37195 (= (apply!108 lt!63535 lt!63542) (get!1435 (getValueByKey!165 (toList!827 lt!63535) lt!63542)))))

(declare-fun bs!5135 () Bool)

(assert (= bs!5135 d!37195))

(declare-fun m!143875 () Bool)

(assert (=> bs!5135 m!143875))

(assert (=> bs!5135 m!143875))

(declare-fun m!143877 () Bool)

(assert (=> bs!5135 m!143877))

(assert (=> b!123562 d!37195))

(declare-fun d!37197 () Bool)

(assert (=> d!37197 (= (apply!108 (+!161 lt!63534 (tuple2!2509 lt!63538 (minValue!2619 (v!3091 (underlying!430 thiss!992))))) lt!63546) (apply!108 lt!63534 lt!63546))))

(declare-fun lt!63647 () Unit!3839)

(assert (=> d!37197 (= lt!63647 (choose!749 lt!63534 lt!63538 (minValue!2619 (v!3091 (underlying!430 thiss!992))) lt!63546))))

(declare-fun e!80838 () Bool)

(assert (=> d!37197 e!80838))

(declare-fun res!60037 () Bool)

(assert (=> d!37197 (=> (not res!60037) (not e!80838))))

(assert (=> d!37197 (= res!60037 (contains!856 lt!63534 lt!63546))))

(assert (=> d!37197 (= (addApplyDifferent!84 lt!63534 lt!63538 (minValue!2619 (v!3091 (underlying!430 thiss!992))) lt!63546) lt!63647)))

(declare-fun b!123701 () Bool)

(assert (=> b!123701 (= e!80838 (not (= lt!63546 lt!63538)))))

(assert (= (and d!37197 res!60037) b!123701))

(declare-fun m!143879 () Bool)

(assert (=> d!37197 m!143879))

(assert (=> d!37197 m!143643))

(declare-fun m!143881 () Bool)

(assert (=> d!37197 m!143881))

(assert (=> d!37197 m!143649))

(assert (=> d!37197 m!143643))

(assert (=> d!37197 m!143645))

(assert (=> b!123562 d!37197))

(declare-fun d!37199 () Bool)

(assert (=> d!37199 (= (apply!108 (+!161 lt!63535 (tuple2!2509 lt!63549 (zeroValue!2619 (v!3091 (underlying!430 thiss!992))))) lt!63542) (apply!108 lt!63535 lt!63542))))

(declare-fun lt!63648 () Unit!3839)

(assert (=> d!37199 (= lt!63648 (choose!749 lt!63535 lt!63549 (zeroValue!2619 (v!3091 (underlying!430 thiss!992))) lt!63542))))

(declare-fun e!80839 () Bool)

(assert (=> d!37199 e!80839))

(declare-fun res!60038 () Bool)

(assert (=> d!37199 (=> (not res!60038) (not e!80839))))

(assert (=> d!37199 (= res!60038 (contains!856 lt!63535 lt!63542))))

(assert (=> d!37199 (= (addApplyDifferent!84 lt!63535 lt!63549 (zeroValue!2619 (v!3091 (underlying!430 thiss!992))) lt!63542) lt!63648)))

(declare-fun b!123702 () Bool)

(assert (=> b!123702 (= e!80839 (not (= lt!63542 lt!63549)))))

(assert (= (and d!37199 res!60038) b!123702))

(declare-fun m!143883 () Bool)

(assert (=> d!37199 m!143883))

(assert (=> d!37199 m!143639))

(declare-fun m!143885 () Bool)

(assert (=> d!37199 m!143885))

(assert (=> d!37199 m!143633))

(assert (=> d!37199 m!143639))

(assert (=> d!37199 m!143641))

(assert (=> b!123562 d!37199))

(declare-fun d!37201 () Bool)

(assert (=> d!37201 (contains!856 (+!161 lt!63545 (tuple2!2509 lt!63547 (zeroValue!2619 (v!3091 (underlying!430 thiss!992))))) lt!63543)))

(declare-fun lt!63651 () Unit!3839)

(declare-fun choose!750 (ListLongMap!1623 (_ BitVec 64) V!3409 (_ BitVec 64)) Unit!3839)

(assert (=> d!37201 (= lt!63651 (choose!750 lt!63545 lt!63547 (zeroValue!2619 (v!3091 (underlying!430 thiss!992))) lt!63543))))

(assert (=> d!37201 (contains!856 lt!63545 lt!63543)))

(assert (=> d!37201 (= (addStillContains!84 lt!63545 lt!63547 (zeroValue!2619 (v!3091 (underlying!430 thiss!992))) lt!63543) lt!63651)))

(declare-fun bs!5136 () Bool)

(assert (= bs!5136 d!37201))

(assert (=> bs!5136 m!143629))

(assert (=> bs!5136 m!143629))

(assert (=> bs!5136 m!143637))

(declare-fun m!143887 () Bool)

(assert (=> bs!5136 m!143887))

(declare-fun m!143889 () Bool)

(assert (=> bs!5136 m!143889))

(assert (=> b!123562 d!37201))

(declare-fun d!37203 () Bool)

(declare-fun e!80840 () Bool)

(assert (=> d!37203 e!80840))

(declare-fun res!60039 () Bool)

(assert (=> d!37203 (=> res!60039 e!80840)))

(declare-fun lt!63652 () Bool)

(assert (=> d!37203 (= res!60039 (not lt!63652))))

(declare-fun lt!63653 () Bool)

(assert (=> d!37203 (= lt!63652 lt!63653)))

(declare-fun lt!63654 () Unit!3839)

(declare-fun e!80841 () Unit!3839)

(assert (=> d!37203 (= lt!63654 e!80841)))

(declare-fun c!22465 () Bool)

(assert (=> d!37203 (= c!22465 lt!63653)))

(assert (=> d!37203 (= lt!63653 (containsKey!168 (toList!827 (+!161 lt!63545 (tuple2!2509 lt!63547 (zeroValue!2619 (v!3091 (underlying!430 thiss!992)))))) lt!63543))))

(assert (=> d!37203 (= (contains!856 (+!161 lt!63545 (tuple2!2509 lt!63547 (zeroValue!2619 (v!3091 (underlying!430 thiss!992))))) lt!63543) lt!63652)))

(declare-fun b!123704 () Bool)

(declare-fun lt!63655 () Unit!3839)

(assert (=> b!123704 (= e!80841 lt!63655)))

(assert (=> b!123704 (= lt!63655 (lemmaContainsKeyImpliesGetValueByKeyDefined!116 (toList!827 (+!161 lt!63545 (tuple2!2509 lt!63547 (zeroValue!2619 (v!3091 (underlying!430 thiss!992)))))) lt!63543))))

(assert (=> b!123704 (isDefined!117 (getValueByKey!165 (toList!827 (+!161 lt!63545 (tuple2!2509 lt!63547 (zeroValue!2619 (v!3091 (underlying!430 thiss!992)))))) lt!63543))))

(declare-fun b!123705 () Bool)

(declare-fun Unit!3846 () Unit!3839)

(assert (=> b!123705 (= e!80841 Unit!3846)))

(declare-fun b!123706 () Bool)

(assert (=> b!123706 (= e!80840 (isDefined!117 (getValueByKey!165 (toList!827 (+!161 lt!63545 (tuple2!2509 lt!63547 (zeroValue!2619 (v!3091 (underlying!430 thiss!992)))))) lt!63543)))))

(assert (= (and d!37203 c!22465) b!123704))

(assert (= (and d!37203 (not c!22465)) b!123705))

(assert (= (and d!37203 (not res!60039)) b!123706))

(declare-fun m!143891 () Bool)

(assert (=> d!37203 m!143891))

(declare-fun m!143893 () Bool)

(assert (=> b!123704 m!143893))

(declare-fun m!143895 () Bool)

(assert (=> b!123704 m!143895))

(assert (=> b!123704 m!143895))

(declare-fun m!143897 () Bool)

(assert (=> b!123704 m!143897))

(assert (=> b!123706 m!143895))

(assert (=> b!123706 m!143895))

(assert (=> b!123706 m!143897))

(assert (=> b!123562 d!37203))

(declare-fun d!37205 () Bool)

(declare-fun e!80842 () Bool)

(assert (=> d!37205 e!80842))

(declare-fun res!60041 () Bool)

(assert (=> d!37205 (=> (not res!60041) (not e!80842))))

(declare-fun lt!63657 () ListLongMap!1623)

(assert (=> d!37205 (= res!60041 (contains!856 lt!63657 (_1!1265 (tuple2!2509 lt!63547 (zeroValue!2619 (v!3091 (underlying!430 thiss!992)))))))))

(declare-fun lt!63659 () List!1670)

(assert (=> d!37205 (= lt!63657 (ListLongMap!1624 lt!63659))))

(declare-fun lt!63658 () Unit!3839)

(declare-fun lt!63656 () Unit!3839)

(assert (=> d!37205 (= lt!63658 lt!63656)))

(assert (=> d!37205 (= (getValueByKey!165 lt!63659 (_1!1265 (tuple2!2509 lt!63547 (zeroValue!2619 (v!3091 (underlying!430 thiss!992)))))) (Some!170 (_2!1265 (tuple2!2509 lt!63547 (zeroValue!2619 (v!3091 (underlying!430 thiss!992)))))))))

(assert (=> d!37205 (= lt!63656 (lemmaContainsTupThenGetReturnValue!81 lt!63659 (_1!1265 (tuple2!2509 lt!63547 (zeroValue!2619 (v!3091 (underlying!430 thiss!992))))) (_2!1265 (tuple2!2509 lt!63547 (zeroValue!2619 (v!3091 (underlying!430 thiss!992)))))))))

(assert (=> d!37205 (= lt!63659 (insertStrictlySorted!84 (toList!827 lt!63545) (_1!1265 (tuple2!2509 lt!63547 (zeroValue!2619 (v!3091 (underlying!430 thiss!992))))) (_2!1265 (tuple2!2509 lt!63547 (zeroValue!2619 (v!3091 (underlying!430 thiss!992)))))))))

(assert (=> d!37205 (= (+!161 lt!63545 (tuple2!2509 lt!63547 (zeroValue!2619 (v!3091 (underlying!430 thiss!992))))) lt!63657)))

(declare-fun b!123707 () Bool)

(declare-fun res!60040 () Bool)

(assert (=> b!123707 (=> (not res!60040) (not e!80842))))

(assert (=> b!123707 (= res!60040 (= (getValueByKey!165 (toList!827 lt!63657) (_1!1265 (tuple2!2509 lt!63547 (zeroValue!2619 (v!3091 (underlying!430 thiss!992)))))) (Some!170 (_2!1265 (tuple2!2509 lt!63547 (zeroValue!2619 (v!3091 (underlying!430 thiss!992))))))))))

(declare-fun b!123708 () Bool)

(assert (=> b!123708 (= e!80842 (contains!857 (toList!827 lt!63657) (tuple2!2509 lt!63547 (zeroValue!2619 (v!3091 (underlying!430 thiss!992))))))))

(assert (= (and d!37205 res!60041) b!123707))

(assert (= (and b!123707 res!60040) b!123708))

(declare-fun m!143899 () Bool)

(assert (=> d!37205 m!143899))

(declare-fun m!143901 () Bool)

(assert (=> d!37205 m!143901))

(declare-fun m!143903 () Bool)

(assert (=> d!37205 m!143903))

(declare-fun m!143905 () Bool)

(assert (=> d!37205 m!143905))

(declare-fun m!143907 () Bool)

(assert (=> b!123707 m!143907))

(declare-fun m!143909 () Bool)

(assert (=> b!123708 m!143909))

(assert (=> b!123562 d!37205))

(declare-fun bm!13122 () Bool)

(declare-fun call!13125 () Bool)

(assert (=> bm!13122 (= call!13125 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!4481 newMap!16) (mask!6992 newMap!16)))))

(declare-fun b!123717 () Bool)

(declare-fun e!80851 () Bool)

(declare-fun e!80849 () Bool)

(assert (=> b!123717 (= e!80851 e!80849)))

(declare-fun lt!63667 () (_ BitVec 64))

(assert (=> b!123717 (= lt!63667 (select (arr!2198 (_keys!4481 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!63668 () Unit!3839)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!4639 (_ BitVec 64) (_ BitVec 32)) Unit!3839)

(assert (=> b!123717 (= lt!63668 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!4481 newMap!16) lt!63667 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!4639 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!123717 (arrayContainsKey!0 (_keys!4481 newMap!16) lt!63667 #b00000000000000000000000000000000)))

(declare-fun lt!63666 () Unit!3839)

(assert (=> b!123717 (= lt!63666 lt!63668)))

(declare-fun res!60046 () Bool)

(declare-datatypes ((SeekEntryResult!261 0))(
  ( (MissingZero!261 (index!3198 (_ BitVec 32))) (Found!261 (index!3199 (_ BitVec 32))) (Intermediate!261 (undefined!1073 Bool) (index!3200 (_ BitVec 32)) (x!14722 (_ BitVec 32))) (Undefined!261) (MissingVacant!261 (index!3201 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!4639 (_ BitVec 32)) SeekEntryResult!261)

(assert (=> b!123717 (= res!60046 (= (seekEntryOrOpen!0 (select (arr!2198 (_keys!4481 newMap!16)) #b00000000000000000000000000000000) (_keys!4481 newMap!16) (mask!6992 newMap!16)) (Found!261 #b00000000000000000000000000000000)))))

(assert (=> b!123717 (=> (not res!60046) (not e!80849))))

(declare-fun b!123719 () Bool)

(assert (=> b!123719 (= e!80851 call!13125)))

(declare-fun b!123720 () Bool)

(assert (=> b!123720 (= e!80849 call!13125)))

(declare-fun d!37207 () Bool)

(declare-fun res!60047 () Bool)

(declare-fun e!80850 () Bool)

(assert (=> d!37207 (=> res!60047 e!80850)))

(assert (=> d!37207 (= res!60047 (bvsge #b00000000000000000000000000000000 (size!2460 (_keys!4481 newMap!16))))))

(assert (=> d!37207 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4481 newMap!16) (mask!6992 newMap!16)) e!80850)))

(declare-fun b!123718 () Bool)

(assert (=> b!123718 (= e!80850 e!80851)))

(declare-fun c!22468 () Bool)

(assert (=> b!123718 (= c!22468 (validKeyInArray!0 (select (arr!2198 (_keys!4481 newMap!16)) #b00000000000000000000000000000000)))))

(assert (= (and d!37207 (not res!60047)) b!123718))

(assert (= (and b!123718 c!22468) b!123717))

(assert (= (and b!123718 (not c!22468)) b!123719))

(assert (= (and b!123717 res!60046) b!123720))

(assert (= (or b!123720 b!123719) bm!13122))

(declare-fun m!143911 () Bool)

(assert (=> bm!13122 m!143911))

(assert (=> b!123717 m!143701))

(declare-fun m!143913 () Bool)

(assert (=> b!123717 m!143913))

(declare-fun m!143915 () Bool)

(assert (=> b!123717 m!143915))

(assert (=> b!123717 m!143701))

(declare-fun m!143917 () Bool)

(assert (=> b!123717 m!143917))

(assert (=> b!123718 m!143701))

(assert (=> b!123718 m!143701))

(assert (=> b!123718 m!143705))

(assert (=> b!123498 d!37207))

(declare-fun d!37209 () Bool)

(assert (=> d!37209 (= (apply!108 lt!63541 #b0000000000000000000000000000000000000000000000000000000000000000) (get!1435 (getValueByKey!165 (toList!827 lt!63541) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!5137 () Bool)

(assert (= bs!5137 d!37209))

(assert (=> bs!5137 m!143681))

(assert (=> bs!5137 m!143681))

(declare-fun m!143919 () Bool)

(assert (=> bs!5137 m!143919))

(assert (=> b!123561 d!37209))

(declare-fun b!123729 () Bool)

(declare-fun e!80857 () (_ BitVec 32))

(declare-fun e!80856 () (_ BitVec 32))

(assert (=> b!123729 (= e!80857 e!80856)))

(declare-fun c!22474 () Bool)

(assert (=> b!123729 (= c!22474 (validKeyInArray!0 (select (arr!2198 (_keys!4481 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!123730 () Bool)

(declare-fun call!13128 () (_ BitVec 32))

(assert (=> b!123730 (= e!80856 (bvadd #b00000000000000000000000000000001 call!13128))))

(declare-fun bm!13125 () Bool)

(assert (=> bm!13125 (= call!13128 (arrayCountValidKeys!0 (_keys!4481 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2460 (_keys!4481 newMap!16))))))

(declare-fun b!123731 () Bool)

(assert (=> b!123731 (= e!80856 call!13128)))

(declare-fun b!123732 () Bool)

(assert (=> b!123732 (= e!80857 #b00000000000000000000000000000000)))

(declare-fun d!37211 () Bool)

(declare-fun lt!63671 () (_ BitVec 32))

(assert (=> d!37211 (and (bvsge lt!63671 #b00000000000000000000000000000000) (bvsle lt!63671 (bvsub (size!2460 (_keys!4481 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> d!37211 (= lt!63671 e!80857)))

(declare-fun c!22473 () Bool)

(assert (=> d!37211 (= c!22473 (bvsge #b00000000000000000000000000000000 (size!2460 (_keys!4481 newMap!16))))))

(assert (=> d!37211 (and (bvsle #b00000000000000000000000000000000 (size!2460 (_keys!4481 newMap!16))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!2460 (_keys!4481 newMap!16)) (size!2460 (_keys!4481 newMap!16))))))

(assert (=> d!37211 (= (arrayCountValidKeys!0 (_keys!4481 newMap!16) #b00000000000000000000000000000000 (size!2460 (_keys!4481 newMap!16))) lt!63671)))

(assert (= (and d!37211 c!22473) b!123732))

(assert (= (and d!37211 (not c!22473)) b!123729))

(assert (= (and b!123729 c!22474) b!123730))

(assert (= (and b!123729 (not c!22474)) b!123731))

(assert (= (or b!123730 b!123731) bm!13125))

(assert (=> b!123729 m!143701))

(assert (=> b!123729 m!143701))

(assert (=> b!123729 m!143705))

(declare-fun m!143921 () Bool)

(assert (=> bm!13125 m!143921))

(assert (=> b!123497 d!37211))

(assert (=> b!123545 d!37149))

(declare-fun condMapEmpty!4437 () Bool)

(declare-fun mapDefault!4437 () ValueCell!1067)

(assert (=> mapNonEmpty!4436 (= condMapEmpty!4437 (= mapRest!4436 ((as const (Array (_ BitVec 32) ValueCell!1067)) mapDefault!4437)))))

(declare-fun e!80858 () Bool)

(declare-fun mapRes!4437 () Bool)

(assert (=> mapNonEmpty!4436 (= tp!10844 (and e!80858 mapRes!4437))))

(declare-fun mapIsEmpty!4437 () Bool)

(assert (=> mapIsEmpty!4437 mapRes!4437))

(declare-fun mapNonEmpty!4437 () Bool)

(declare-fun tp!10845 () Bool)

(declare-fun e!80859 () Bool)

(assert (=> mapNonEmpty!4437 (= mapRes!4437 (and tp!10845 e!80859))))

(declare-fun mapKey!4437 () (_ BitVec 32))

(declare-fun mapRest!4437 () (Array (_ BitVec 32) ValueCell!1067))

(declare-fun mapValue!4437 () ValueCell!1067)

(assert (=> mapNonEmpty!4437 (= mapRest!4436 (store mapRest!4437 mapKey!4437 mapValue!4437))))

(declare-fun b!123733 () Bool)

(assert (=> b!123733 (= e!80859 tp_is_empty!2821)))

(declare-fun b!123734 () Bool)

(assert (=> b!123734 (= e!80858 tp_is_empty!2821)))

(assert (= (and mapNonEmpty!4436 condMapEmpty!4437) mapIsEmpty!4437))

(assert (= (and mapNonEmpty!4436 (not condMapEmpty!4437)) mapNonEmpty!4437))

(assert (= (and mapNonEmpty!4437 ((_ is ValueCellFull!1067) mapValue!4437)) b!123733))

(assert (= (and mapNonEmpty!4436 ((_ is ValueCellFull!1067) mapDefault!4437)) b!123734))

(declare-fun m!143923 () Bool)

(assert (=> mapNonEmpty!4437 m!143923))

(declare-fun condMapEmpty!4438 () Bool)

(declare-fun mapDefault!4438 () ValueCell!1067)

(assert (=> mapNonEmpty!4435 (= condMapEmpty!4438 (= mapRest!4435 ((as const (Array (_ BitVec 32) ValueCell!1067)) mapDefault!4438)))))

(declare-fun e!80860 () Bool)

(declare-fun mapRes!4438 () Bool)

(assert (=> mapNonEmpty!4435 (= tp!10843 (and e!80860 mapRes!4438))))

(declare-fun mapIsEmpty!4438 () Bool)

(assert (=> mapIsEmpty!4438 mapRes!4438))

(declare-fun mapNonEmpty!4438 () Bool)

(declare-fun tp!10846 () Bool)

(declare-fun e!80861 () Bool)

(assert (=> mapNonEmpty!4438 (= mapRes!4438 (and tp!10846 e!80861))))

(declare-fun mapValue!4438 () ValueCell!1067)

(declare-fun mapRest!4438 () (Array (_ BitVec 32) ValueCell!1067))

(declare-fun mapKey!4438 () (_ BitVec 32))

(assert (=> mapNonEmpty!4438 (= mapRest!4435 (store mapRest!4438 mapKey!4438 mapValue!4438))))

(declare-fun b!123735 () Bool)

(assert (=> b!123735 (= e!80861 tp_is_empty!2821)))

(declare-fun b!123736 () Bool)

(assert (=> b!123736 (= e!80860 tp_is_empty!2821)))

(assert (= (and mapNonEmpty!4435 condMapEmpty!4438) mapIsEmpty!4438))

(assert (= (and mapNonEmpty!4435 (not condMapEmpty!4438)) mapNonEmpty!4438))

(assert (= (and mapNonEmpty!4438 ((_ is ValueCellFull!1067) mapValue!4438)) b!123735))

(assert (= (and mapNonEmpty!4435 ((_ is ValueCellFull!1067) mapDefault!4438)) b!123736))

(declare-fun m!143925 () Bool)

(assert (=> mapNonEmpty!4438 m!143925))

(declare-fun b_lambda!5441 () Bool)

(assert (= b_lambda!5437 (or (and b!123392 b_free!2809) (and b!123390 b_free!2811 (= (defaultEntry!2754 newMap!16) (defaultEntry!2754 (v!3091 (underlying!430 thiss!992))))) b_lambda!5441)))

(declare-fun b_lambda!5443 () Bool)

(assert (= b_lambda!5439 (or (and b!123392 b_free!2809) (and b!123390 b_free!2811 (= (defaultEntry!2754 newMap!16) (defaultEntry!2754 (v!3091 (underlying!430 thiss!992))))) b_lambda!5443)))

(declare-fun b_lambda!5445 () Bool)

(assert (= b_lambda!5435 (or (and b!123392 b_free!2809 (= (defaultEntry!2754 (v!3091 (underlying!430 thiss!992))) (defaultEntry!2754 newMap!16))) (and b!123390 b_free!2811) b_lambda!5445)))

(check-sat (not b!123688) (not b_lambda!5433) (not b!123729) (not bm!13116) (not b!123616) (not b!123614) (not b_lambda!5441) (not b_lambda!5445) (not b!123618) (not b!123595) (not b!123628) (not mapNonEmpty!4438) (not d!37183) (not b!123598) (not d!37199) (not d!37209) (not d!37171) (not d!37165) (not b!123700) (not b!123637) (not d!37179) (not d!37177) (not b_next!2809) (not b!123683) (not b!123680) (not b!123639) (not b!123649) (not b!123617) (not b!123687) (not bm!13109) b_and!7601 (not d!37151) (not d!37205) (not b!123706) (not b!123708) (not b!123579) (not b!123685) (not d!37173) (not b!123707) (not bm!13113) (not d!37157) (not d!37163) (not d!37175) (not b!123697) (not b!123594) (not b!123610) (not b!123650) (not b!123704) (not b!123636) (not b!123692) (not d!37189) (not d!37169) (not b!123622) (not b!123679) (not bm!13111) (not d!37193) (not b!123652) (not b_next!2811) (not b!123699) (not bm!13119) (not b!123682) (not d!37181) (not b!123698) (not b!123620) (not bm!13114) (not d!37187) b_and!7603 (not b!123691) (not d!37147) (not b!123638) (not bm!13122) (not b!123615) (not b!123686) (not b!123613) (not mapNonEmpty!4437) (not d!37153) (not b!123587) (not b!123596) (not b!123654) (not b!123612) (not b_lambda!5443) (not bm!13125) (not b!123718) (not b!123717) (not b!123626) (not d!37197) (not d!37191) (not d!37203) (not d!37161) tp_is_empty!2821 (not b!123580) (not d!37185) (not b!123589) (not d!37201) (not d!37195))
(check-sat b_and!7601 b_and!7603 (not b_next!2809) (not b_next!2811))
(get-model)

(declare-fun d!37213 () Bool)

(assert (=> d!37213 (= (validKeyInArray!0 (select (arr!2198 (_keys!4481 newMap!16)) #b00000000000000000000000000000000)) (and (not (= (select (arr!2198 (_keys!4481 newMap!16)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2198 (_keys!4481 newMap!16)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!123622 d!37213))

(assert (=> b!123718 d!37213))

(assert (=> d!37197 d!37177))

(declare-fun d!37215 () Bool)

(assert (=> d!37215 (= (apply!108 (+!161 lt!63534 (tuple2!2509 lt!63538 (minValue!2619 (v!3091 (underlying!430 thiss!992))))) lt!63546) (apply!108 lt!63534 lt!63546))))

(assert (=> d!37215 true))

(declare-fun _$34!937 () Unit!3839)

(assert (=> d!37215 (= (choose!749 lt!63534 lt!63538 (minValue!2619 (v!3091 (underlying!430 thiss!992))) lt!63546) _$34!937)))

(declare-fun bs!5138 () Bool)

(assert (= bs!5138 d!37215))

(assert (=> bs!5138 m!143643))

(assert (=> bs!5138 m!143643))

(assert (=> bs!5138 m!143645))

(assert (=> bs!5138 m!143649))

(assert (=> d!37197 d!37215))

(declare-fun d!37217 () Bool)

(declare-fun e!80862 () Bool)

(assert (=> d!37217 e!80862))

(declare-fun res!60048 () Bool)

(assert (=> d!37217 (=> res!60048 e!80862)))

(declare-fun lt!63672 () Bool)

(assert (=> d!37217 (= res!60048 (not lt!63672))))

(declare-fun lt!63673 () Bool)

(assert (=> d!37217 (= lt!63672 lt!63673)))

(declare-fun lt!63674 () Unit!3839)

(declare-fun e!80863 () Unit!3839)

(assert (=> d!37217 (= lt!63674 e!80863)))

(declare-fun c!22475 () Bool)

(assert (=> d!37217 (= c!22475 lt!63673)))

(assert (=> d!37217 (= lt!63673 (containsKey!168 (toList!827 lt!63534) lt!63546))))

(assert (=> d!37217 (= (contains!856 lt!63534 lt!63546) lt!63672)))

(declare-fun b!123738 () Bool)

(declare-fun lt!63675 () Unit!3839)

(assert (=> b!123738 (= e!80863 lt!63675)))

(assert (=> b!123738 (= lt!63675 (lemmaContainsKeyImpliesGetValueByKeyDefined!116 (toList!827 lt!63534) lt!63546))))

(assert (=> b!123738 (isDefined!117 (getValueByKey!165 (toList!827 lt!63534) lt!63546))))

(declare-fun b!123739 () Bool)

(declare-fun Unit!3847 () Unit!3839)

(assert (=> b!123739 (= e!80863 Unit!3847)))

(declare-fun b!123740 () Bool)

(assert (=> b!123740 (= e!80862 (isDefined!117 (getValueByKey!165 (toList!827 lt!63534) lt!63546)))))

(assert (= (and d!37217 c!22475) b!123738))

(assert (= (and d!37217 (not c!22475)) b!123739))

(assert (= (and d!37217 (not res!60048)) b!123740))

(declare-fun m!143927 () Bool)

(assert (=> d!37217 m!143927))

(declare-fun m!143929 () Bool)

(assert (=> b!123738 m!143929))

(assert (=> b!123738 m!143855))

(assert (=> b!123738 m!143855))

(declare-fun m!143931 () Bool)

(assert (=> b!123738 m!143931))

(assert (=> b!123740 m!143855))

(assert (=> b!123740 m!143855))

(assert (=> b!123740 m!143931))

(assert (=> d!37197 d!37217))

(assert (=> d!37197 d!37189))

(assert (=> d!37197 d!37191))

(declare-fun d!37219 () Bool)

(declare-fun e!80864 () Bool)

(assert (=> d!37219 e!80864))

(declare-fun res!60049 () Bool)

(assert (=> d!37219 (=> res!60049 e!80864)))

(declare-fun lt!63676 () Bool)

(assert (=> d!37219 (= res!60049 (not lt!63676))))

(declare-fun lt!63677 () Bool)

(assert (=> d!37219 (= lt!63676 lt!63677)))

(declare-fun lt!63678 () Unit!3839)

(declare-fun e!80865 () Unit!3839)

(assert (=> d!37219 (= lt!63678 e!80865)))

(declare-fun c!22476 () Bool)

(assert (=> d!37219 (= c!22476 lt!63677)))

(assert (=> d!37219 (= lt!63677 (containsKey!168 (toList!827 lt!63633) (_1!1265 (tuple2!2509 lt!63549 (zeroValue!2619 (v!3091 (underlying!430 thiss!992)))))))))

(assert (=> d!37219 (= (contains!856 lt!63633 (_1!1265 (tuple2!2509 lt!63549 (zeroValue!2619 (v!3091 (underlying!430 thiss!992)))))) lt!63676)))

(declare-fun b!123741 () Bool)

(declare-fun lt!63679 () Unit!3839)

(assert (=> b!123741 (= e!80865 lt!63679)))

(assert (=> b!123741 (= lt!63679 (lemmaContainsKeyImpliesGetValueByKeyDefined!116 (toList!827 lt!63633) (_1!1265 (tuple2!2509 lt!63549 (zeroValue!2619 (v!3091 (underlying!430 thiss!992)))))))))

(assert (=> b!123741 (isDefined!117 (getValueByKey!165 (toList!827 lt!63633) (_1!1265 (tuple2!2509 lt!63549 (zeroValue!2619 (v!3091 (underlying!430 thiss!992)))))))))

(declare-fun b!123742 () Bool)

(declare-fun Unit!3848 () Unit!3839)

(assert (=> b!123742 (= e!80865 Unit!3848)))

(declare-fun b!123743 () Bool)

(assert (=> b!123743 (= e!80864 (isDefined!117 (getValueByKey!165 (toList!827 lt!63633) (_1!1265 (tuple2!2509 lt!63549 (zeroValue!2619 (v!3091 (underlying!430 thiss!992))))))))))

(assert (= (and d!37219 c!22476) b!123741))

(assert (= (and d!37219 (not c!22476)) b!123742))

(assert (= (and d!37219 (not res!60049)) b!123743))

(declare-fun m!143933 () Bool)

(assert (=> d!37219 m!143933))

(declare-fun m!143935 () Bool)

(assert (=> b!123741 m!143935))

(assert (=> b!123741 m!143827))

(assert (=> b!123741 m!143827))

(declare-fun m!143937 () Bool)

(assert (=> b!123741 m!143937))

(assert (=> b!123743 m!143827))

(assert (=> b!123743 m!143827))

(assert (=> b!123743 m!143937))

(assert (=> d!37179 d!37219))

(declare-fun b!123753 () Bool)

(declare-fun e!80870 () Option!171)

(declare-fun e!80871 () Option!171)

(assert (=> b!123753 (= e!80870 e!80871)))

(declare-fun c!22482 () Bool)

(assert (=> b!123753 (= c!22482 (and ((_ is Cons!1666) lt!63635) (not (= (_1!1265 (h!2267 lt!63635)) (_1!1265 (tuple2!2509 lt!63549 (zeroValue!2619 (v!3091 (underlying!430 thiss!992)))))))))))

(declare-fun d!37221 () Bool)

(declare-fun c!22481 () Bool)

(assert (=> d!37221 (= c!22481 (and ((_ is Cons!1666) lt!63635) (= (_1!1265 (h!2267 lt!63635)) (_1!1265 (tuple2!2509 lt!63549 (zeroValue!2619 (v!3091 (underlying!430 thiss!992))))))))))

(assert (=> d!37221 (= (getValueByKey!165 lt!63635 (_1!1265 (tuple2!2509 lt!63549 (zeroValue!2619 (v!3091 (underlying!430 thiss!992)))))) e!80870)))

(declare-fun b!123755 () Bool)

(assert (=> b!123755 (= e!80871 None!169)))

(declare-fun b!123754 () Bool)

(assert (=> b!123754 (= e!80871 (getValueByKey!165 (t!5965 lt!63635) (_1!1265 (tuple2!2509 lt!63549 (zeroValue!2619 (v!3091 (underlying!430 thiss!992)))))))))

(declare-fun b!123752 () Bool)

(assert (=> b!123752 (= e!80870 (Some!170 (_2!1265 (h!2267 lt!63635))))))

(assert (= (and d!37221 c!22481) b!123752))

(assert (= (and d!37221 (not c!22481)) b!123753))

(assert (= (and b!123753 c!22482) b!123754))

(assert (= (and b!123753 (not c!22482)) b!123755))

(declare-fun m!143939 () Bool)

(assert (=> b!123754 m!143939))

(assert (=> d!37179 d!37221))

(declare-fun d!37223 () Bool)

(assert (=> d!37223 (= (getValueByKey!165 lt!63635 (_1!1265 (tuple2!2509 lt!63549 (zeroValue!2619 (v!3091 (underlying!430 thiss!992)))))) (Some!170 (_2!1265 (tuple2!2509 lt!63549 (zeroValue!2619 (v!3091 (underlying!430 thiss!992)))))))))

(declare-fun lt!63682 () Unit!3839)

(declare-fun choose!751 (List!1670 (_ BitVec 64) V!3409) Unit!3839)

(assert (=> d!37223 (= lt!63682 (choose!751 lt!63635 (_1!1265 (tuple2!2509 lt!63549 (zeroValue!2619 (v!3091 (underlying!430 thiss!992))))) (_2!1265 (tuple2!2509 lt!63549 (zeroValue!2619 (v!3091 (underlying!430 thiss!992)))))))))

(declare-fun e!80874 () Bool)

(assert (=> d!37223 e!80874))

(declare-fun res!60054 () Bool)

(assert (=> d!37223 (=> (not res!60054) (not e!80874))))

(declare-fun isStrictlySorted!302 (List!1670) Bool)

(assert (=> d!37223 (= res!60054 (isStrictlySorted!302 lt!63635))))

(assert (=> d!37223 (= (lemmaContainsTupThenGetReturnValue!81 lt!63635 (_1!1265 (tuple2!2509 lt!63549 (zeroValue!2619 (v!3091 (underlying!430 thiss!992))))) (_2!1265 (tuple2!2509 lt!63549 (zeroValue!2619 (v!3091 (underlying!430 thiss!992)))))) lt!63682)))

(declare-fun b!123760 () Bool)

(declare-fun res!60055 () Bool)

(assert (=> b!123760 (=> (not res!60055) (not e!80874))))

(assert (=> b!123760 (= res!60055 (containsKey!168 lt!63635 (_1!1265 (tuple2!2509 lt!63549 (zeroValue!2619 (v!3091 (underlying!430 thiss!992)))))))))

(declare-fun b!123761 () Bool)

(assert (=> b!123761 (= e!80874 (contains!857 lt!63635 (tuple2!2509 (_1!1265 (tuple2!2509 lt!63549 (zeroValue!2619 (v!3091 (underlying!430 thiss!992))))) (_2!1265 (tuple2!2509 lt!63549 (zeroValue!2619 (v!3091 (underlying!430 thiss!992))))))))))

(assert (= (and d!37223 res!60054) b!123760))

(assert (= (and b!123760 res!60055) b!123761))

(assert (=> d!37223 m!143821))

(declare-fun m!143941 () Bool)

(assert (=> d!37223 m!143941))

(declare-fun m!143943 () Bool)

(assert (=> d!37223 m!143943))

(declare-fun m!143945 () Bool)

(assert (=> b!123760 m!143945))

(declare-fun m!143947 () Bool)

(assert (=> b!123761 m!143947))

(assert (=> d!37179 d!37223))

(declare-fun b!123782 () Bool)

(declare-fun res!60061 () Bool)

(declare-fun e!80888 () Bool)

(assert (=> b!123782 (=> (not res!60061) (not e!80888))))

(declare-fun lt!63685 () List!1670)

(assert (=> b!123782 (= res!60061 (containsKey!168 lt!63685 (_1!1265 (tuple2!2509 lt!63549 (zeroValue!2619 (v!3091 (underlying!430 thiss!992)))))))))

(declare-fun d!37225 () Bool)

(assert (=> d!37225 e!80888))

(declare-fun res!60060 () Bool)

(assert (=> d!37225 (=> (not res!60060) (not e!80888))))

(assert (=> d!37225 (= res!60060 (isStrictlySorted!302 lt!63685))))

(declare-fun e!80887 () List!1670)

(assert (=> d!37225 (= lt!63685 e!80887)))

(declare-fun c!22491 () Bool)

(assert (=> d!37225 (= c!22491 (and ((_ is Cons!1666) (toList!827 lt!63535)) (bvslt (_1!1265 (h!2267 (toList!827 lt!63535))) (_1!1265 (tuple2!2509 lt!63549 (zeroValue!2619 (v!3091 (underlying!430 thiss!992))))))))))

(assert (=> d!37225 (isStrictlySorted!302 (toList!827 lt!63535))))

(assert (=> d!37225 (= (insertStrictlySorted!84 (toList!827 lt!63535) (_1!1265 (tuple2!2509 lt!63549 (zeroValue!2619 (v!3091 (underlying!430 thiss!992))))) (_2!1265 (tuple2!2509 lt!63549 (zeroValue!2619 (v!3091 (underlying!430 thiss!992)))))) lt!63685)))

(declare-fun c!22494 () Bool)

(declare-fun b!123783 () Bool)

(assert (=> b!123783 (= c!22494 (and ((_ is Cons!1666) (toList!827 lt!63535)) (bvsgt (_1!1265 (h!2267 (toList!827 lt!63535))) (_1!1265 (tuple2!2509 lt!63549 (zeroValue!2619 (v!3091 (underlying!430 thiss!992))))))))))

(declare-fun e!80885 () List!1670)

(declare-fun e!80889 () List!1670)

(assert (=> b!123783 (= e!80885 e!80889)))

(declare-fun b!123784 () Bool)

(assert (=> b!123784 (= e!80888 (contains!857 lt!63685 (tuple2!2509 (_1!1265 (tuple2!2509 lt!63549 (zeroValue!2619 (v!3091 (underlying!430 thiss!992))))) (_2!1265 (tuple2!2509 lt!63549 (zeroValue!2619 (v!3091 (underlying!430 thiss!992))))))))))

(declare-fun e!80886 () List!1670)

(declare-fun c!22493 () Bool)

(declare-fun b!123785 () Bool)

(assert (=> b!123785 (= e!80886 (ite c!22493 (t!5965 (toList!827 lt!63535)) (ite c!22494 (Cons!1666 (h!2267 (toList!827 lt!63535)) (t!5965 (toList!827 lt!63535))) Nil!1667)))))

(declare-fun bm!13132 () Bool)

(declare-fun call!13136 () List!1670)

(declare-fun call!13135 () List!1670)

(assert (=> bm!13132 (= call!13136 call!13135)))

(declare-fun b!123786 () Bool)

(assert (=> b!123786 (= e!80886 (insertStrictlySorted!84 (t!5965 (toList!827 lt!63535)) (_1!1265 (tuple2!2509 lt!63549 (zeroValue!2619 (v!3091 (underlying!430 thiss!992))))) (_2!1265 (tuple2!2509 lt!63549 (zeroValue!2619 (v!3091 (underlying!430 thiss!992)))))))))

(declare-fun bm!13133 () Bool)

(declare-fun $colon$colon!86 (List!1670 tuple2!2508) List!1670)

(assert (=> bm!13133 (= call!13135 ($colon$colon!86 e!80886 (ite c!22491 (h!2267 (toList!827 lt!63535)) (tuple2!2509 (_1!1265 (tuple2!2509 lt!63549 (zeroValue!2619 (v!3091 (underlying!430 thiss!992))))) (_2!1265 (tuple2!2509 lt!63549 (zeroValue!2619 (v!3091 (underlying!430 thiss!992)))))))))))

(declare-fun c!22492 () Bool)

(assert (=> bm!13133 (= c!22492 c!22491)))

(declare-fun b!123787 () Bool)

(assert (=> b!123787 (= e!80887 e!80885)))

(assert (=> b!123787 (= c!22493 (and ((_ is Cons!1666) (toList!827 lt!63535)) (= (_1!1265 (h!2267 (toList!827 lt!63535))) (_1!1265 (tuple2!2509 lt!63549 (zeroValue!2619 (v!3091 (underlying!430 thiss!992))))))))))

(declare-fun b!123788 () Bool)

(assert (=> b!123788 (= e!80887 call!13135)))

(declare-fun b!123789 () Bool)

(declare-fun call!13137 () List!1670)

(assert (=> b!123789 (= e!80889 call!13137)))

(declare-fun bm!13134 () Bool)

(assert (=> bm!13134 (= call!13137 call!13136)))

(declare-fun b!123790 () Bool)

(assert (=> b!123790 (= e!80889 call!13137)))

(declare-fun b!123791 () Bool)

(assert (=> b!123791 (= e!80885 call!13136)))

(assert (= (and d!37225 c!22491) b!123788))

(assert (= (and d!37225 (not c!22491)) b!123787))

(assert (= (and b!123787 c!22493) b!123791))

(assert (= (and b!123787 (not c!22493)) b!123783))

(assert (= (and b!123783 c!22494) b!123789))

(assert (= (and b!123783 (not c!22494)) b!123790))

(assert (= (or b!123789 b!123790) bm!13134))

(assert (= (or b!123791 bm!13134) bm!13132))

(assert (= (or b!123788 bm!13132) bm!13133))

(assert (= (and bm!13133 c!22492) b!123786))

(assert (= (and bm!13133 (not c!22492)) b!123785))

(assert (= (and d!37225 res!60060) b!123782))

(assert (= (and b!123782 res!60061) b!123784))

(declare-fun m!143949 () Bool)

(assert (=> b!123786 m!143949))

(declare-fun m!143951 () Bool)

(assert (=> d!37225 m!143951))

(declare-fun m!143953 () Bool)

(assert (=> d!37225 m!143953))

(declare-fun m!143955 () Bool)

(assert (=> b!123782 m!143955))

(declare-fun m!143957 () Bool)

(assert (=> bm!13133 m!143957))

(declare-fun m!143959 () Bool)

(assert (=> b!123784 m!143959))

(assert (=> d!37179 d!37225))

(declare-fun d!37227 () Bool)

(assert (=> d!37227 (= (validMask!0 (mask!6992 newMap!16)) (and (or (= (mask!6992 newMap!16) #b00000000000000000000000000000111) (= (mask!6992 newMap!16) #b00000000000000000000000000001111) (= (mask!6992 newMap!16) #b00000000000000000000000000011111) (= (mask!6992 newMap!16) #b00000000000000000000000000111111) (= (mask!6992 newMap!16) #b00000000000000000000000001111111) (= (mask!6992 newMap!16) #b00000000000000000000000011111111) (= (mask!6992 newMap!16) #b00000000000000000000000111111111) (= (mask!6992 newMap!16) #b00000000000000000000001111111111) (= (mask!6992 newMap!16) #b00000000000000000000011111111111) (= (mask!6992 newMap!16) #b00000000000000000000111111111111) (= (mask!6992 newMap!16) #b00000000000000000001111111111111) (= (mask!6992 newMap!16) #b00000000000000000011111111111111) (= (mask!6992 newMap!16) #b00000000000000000111111111111111) (= (mask!6992 newMap!16) #b00000000000000001111111111111111) (= (mask!6992 newMap!16) #b00000000000000011111111111111111) (= (mask!6992 newMap!16) #b00000000000000111111111111111111) (= (mask!6992 newMap!16) #b00000000000001111111111111111111) (= (mask!6992 newMap!16) #b00000000000011111111111111111111) (= (mask!6992 newMap!16) #b00000000000111111111111111111111) (= (mask!6992 newMap!16) #b00000000001111111111111111111111) (= (mask!6992 newMap!16) #b00000000011111111111111111111111) (= (mask!6992 newMap!16) #b00000000111111111111111111111111) (= (mask!6992 newMap!16) #b00000001111111111111111111111111) (= (mask!6992 newMap!16) #b00000011111111111111111111111111) (= (mask!6992 newMap!16) #b00000111111111111111111111111111) (= (mask!6992 newMap!16) #b00001111111111111111111111111111) (= (mask!6992 newMap!16) #b00011111111111111111111111111111) (= (mask!6992 newMap!16) #b00111111111111111111111111111111)) (bvsle (mask!6992 newMap!16) #b00111111111111111111111111111111)))))

(assert (=> d!37165 d!37227))

(declare-fun d!37229 () Bool)

(assert (=> d!37229 (= (get!1436 (select (arr!2199 (_values!2737 (v!3091 (underlying!430 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!412 (defaultEntry!2754 (v!3091 (underlying!430 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (v!3090 (select (arr!2199 (_values!2737 (v!3091 (underlying!430 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!123594 d!37229))

(declare-fun b!123793 () Bool)

(declare-fun e!80890 () Option!171)

(declare-fun e!80891 () Option!171)

(assert (=> b!123793 (= e!80890 e!80891)))

(declare-fun c!22496 () Bool)

(assert (=> b!123793 (= c!22496 (and ((_ is Cons!1666) (toList!827 lt!63657)) (not (= (_1!1265 (h!2267 (toList!827 lt!63657))) (_1!1265 (tuple2!2509 lt!63547 (zeroValue!2619 (v!3091 (underlying!430 thiss!992)))))))))))

(declare-fun c!22495 () Bool)

(declare-fun d!37231 () Bool)

(assert (=> d!37231 (= c!22495 (and ((_ is Cons!1666) (toList!827 lt!63657)) (= (_1!1265 (h!2267 (toList!827 lt!63657))) (_1!1265 (tuple2!2509 lt!63547 (zeroValue!2619 (v!3091 (underlying!430 thiss!992))))))))))

(assert (=> d!37231 (= (getValueByKey!165 (toList!827 lt!63657) (_1!1265 (tuple2!2509 lt!63547 (zeroValue!2619 (v!3091 (underlying!430 thiss!992)))))) e!80890)))

(declare-fun b!123795 () Bool)

(assert (=> b!123795 (= e!80891 None!169)))

(declare-fun b!123794 () Bool)

(assert (=> b!123794 (= e!80891 (getValueByKey!165 (t!5965 (toList!827 lt!63657)) (_1!1265 (tuple2!2509 lt!63547 (zeroValue!2619 (v!3091 (underlying!430 thiss!992)))))))))

(declare-fun b!123792 () Bool)

(assert (=> b!123792 (= e!80890 (Some!170 (_2!1265 (h!2267 (toList!827 lt!63657)))))))

(assert (= (and d!37231 c!22495) b!123792))

(assert (= (and d!37231 (not c!22495)) b!123793))

(assert (= (and b!123793 c!22496) b!123794))

(assert (= (and b!123793 (not c!22496)) b!123795))

(declare-fun m!143961 () Bool)

(assert (=> b!123794 m!143961))

(assert (=> b!123707 d!37231))

(declare-fun d!37233 () Bool)

(declare-fun e!80892 () Bool)

(assert (=> d!37233 e!80892))

(declare-fun res!60063 () Bool)

(assert (=> d!37233 (=> (not res!60063) (not e!80892))))

(declare-fun lt!63687 () ListLongMap!1623)

(assert (=> d!37233 (= res!60063 (contains!856 lt!63687 (_1!1265 (ite (or c!22448 c!22446) (tuple2!2509 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2619 newMap!16)) (tuple2!2509 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 newMap!16))))))))

(declare-fun lt!63689 () List!1670)

(assert (=> d!37233 (= lt!63687 (ListLongMap!1624 lt!63689))))

(declare-fun lt!63688 () Unit!3839)

(declare-fun lt!63686 () Unit!3839)

(assert (=> d!37233 (= lt!63688 lt!63686)))

(assert (=> d!37233 (= (getValueByKey!165 lt!63689 (_1!1265 (ite (or c!22448 c!22446) (tuple2!2509 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2619 newMap!16)) (tuple2!2509 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 newMap!16))))) (Some!170 (_2!1265 (ite (or c!22448 c!22446) (tuple2!2509 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2619 newMap!16)) (tuple2!2509 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 newMap!16))))))))

(assert (=> d!37233 (= lt!63686 (lemmaContainsTupThenGetReturnValue!81 lt!63689 (_1!1265 (ite (or c!22448 c!22446) (tuple2!2509 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2619 newMap!16)) (tuple2!2509 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 newMap!16)))) (_2!1265 (ite (or c!22448 c!22446) (tuple2!2509 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2619 newMap!16)) (tuple2!2509 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 newMap!16))))))))

(assert (=> d!37233 (= lt!63689 (insertStrictlySorted!84 (toList!827 (ite c!22448 call!13116 (ite c!22446 call!13118 call!13114))) (_1!1265 (ite (or c!22448 c!22446) (tuple2!2509 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2619 newMap!16)) (tuple2!2509 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 newMap!16)))) (_2!1265 (ite (or c!22448 c!22446) (tuple2!2509 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2619 newMap!16)) (tuple2!2509 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 newMap!16))))))))

(assert (=> d!37233 (= (+!161 (ite c!22448 call!13116 (ite c!22446 call!13118 call!13114)) (ite (or c!22448 c!22446) (tuple2!2509 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2619 newMap!16)) (tuple2!2509 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 newMap!16)))) lt!63687)))

(declare-fun b!123796 () Bool)

(declare-fun res!60062 () Bool)

(assert (=> b!123796 (=> (not res!60062) (not e!80892))))

(assert (=> b!123796 (= res!60062 (= (getValueByKey!165 (toList!827 lt!63687) (_1!1265 (ite (or c!22448 c!22446) (tuple2!2509 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2619 newMap!16)) (tuple2!2509 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 newMap!16))))) (Some!170 (_2!1265 (ite (or c!22448 c!22446) (tuple2!2509 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2619 newMap!16)) (tuple2!2509 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 newMap!16)))))))))

(declare-fun b!123797 () Bool)

(assert (=> b!123797 (= e!80892 (contains!857 (toList!827 lt!63687) (ite (or c!22448 c!22446) (tuple2!2509 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2619 newMap!16)) (tuple2!2509 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 newMap!16)))))))

(assert (= (and d!37233 res!60063) b!123796))

(assert (= (and b!123796 res!60062) b!123797))

(declare-fun m!143963 () Bool)

(assert (=> d!37233 m!143963))

(declare-fun m!143965 () Bool)

(assert (=> d!37233 m!143965))

(declare-fun m!143967 () Bool)

(assert (=> d!37233 m!143967))

(declare-fun m!143969 () Bool)

(assert (=> d!37233 m!143969))

(declare-fun m!143971 () Bool)

(assert (=> b!123796 m!143971))

(declare-fun m!143973 () Bool)

(assert (=> b!123797 m!143973))

(assert (=> bm!13113 d!37233))

(declare-fun d!37235 () Bool)

(assert (=> d!37235 (= (apply!108 lt!63630 (select (arr!2198 (_keys!4481 (v!3091 (underlying!430 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1435 (getValueByKey!165 (toList!827 lt!63630) (select (arr!2198 (_keys!4481 (v!3091 (underlying!430 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(declare-fun bs!5139 () Bool)

(assert (= bs!5139 d!37235))

(assert (=> bs!5139 m!143609))

(declare-fun m!143975 () Bool)

(assert (=> bs!5139 m!143975))

(assert (=> bs!5139 m!143975))

(declare-fun m!143977 () Bool)

(assert (=> bs!5139 m!143977))

(assert (=> b!123686 d!37235))

(assert (=> b!123686 d!37155))

(assert (=> b!123636 d!37213))

(declare-fun d!37237 () Bool)

(declare-fun e!80893 () Bool)

(assert (=> d!37237 e!80893))

(declare-fun res!60064 () Bool)

(assert (=> d!37237 (=> res!60064 e!80893)))

(declare-fun lt!63690 () Bool)

(assert (=> d!37237 (= res!60064 (not lt!63690))))

(declare-fun lt!63691 () Bool)

(assert (=> d!37237 (= lt!63690 lt!63691)))

(declare-fun lt!63692 () Unit!3839)

(declare-fun e!80894 () Unit!3839)

(assert (=> d!37237 (= lt!63692 e!80894)))

(declare-fun c!22497 () Bool)

(assert (=> d!37237 (= c!22497 lt!63691)))

(assert (=> d!37237 (= lt!63691 (containsKey!168 (toList!827 lt!63640) (_1!1265 (tuple2!2509 lt!63552 (minValue!2619 (v!3091 (underlying!430 thiss!992)))))))))

(assert (=> d!37237 (= (contains!856 lt!63640 (_1!1265 (tuple2!2509 lt!63552 (minValue!2619 (v!3091 (underlying!430 thiss!992)))))) lt!63690)))

(declare-fun b!123798 () Bool)

(declare-fun lt!63693 () Unit!3839)

(assert (=> b!123798 (= e!80894 lt!63693)))

(assert (=> b!123798 (= lt!63693 (lemmaContainsKeyImpliesGetValueByKeyDefined!116 (toList!827 lt!63640) (_1!1265 (tuple2!2509 lt!63552 (minValue!2619 (v!3091 (underlying!430 thiss!992)))))))))

(assert (=> b!123798 (isDefined!117 (getValueByKey!165 (toList!827 lt!63640) (_1!1265 (tuple2!2509 lt!63552 (minValue!2619 (v!3091 (underlying!430 thiss!992)))))))))

(declare-fun b!123799 () Bool)

(declare-fun Unit!3849 () Unit!3839)

(assert (=> b!123799 (= e!80894 Unit!3849)))

(declare-fun b!123800 () Bool)

(assert (=> b!123800 (= e!80893 (isDefined!117 (getValueByKey!165 (toList!827 lt!63640) (_1!1265 (tuple2!2509 lt!63552 (minValue!2619 (v!3091 (underlying!430 thiss!992))))))))))

(assert (= (and d!37237 c!22497) b!123798))

(assert (= (and d!37237 (not c!22497)) b!123799))

(assert (= (and d!37237 (not res!60064)) b!123800))

(declare-fun m!143979 () Bool)

(assert (=> d!37237 m!143979))

(declare-fun m!143981 () Bool)

(assert (=> b!123798 m!143981))

(assert (=> b!123798 m!143851))

(assert (=> b!123798 m!143851))

(declare-fun m!143983 () Bool)

(assert (=> b!123798 m!143983))

(assert (=> b!123800 m!143851))

(assert (=> b!123800 m!143851))

(assert (=> b!123800 m!143983))

(assert (=> d!37187 d!37237))

(declare-fun b!123802 () Bool)

(declare-fun e!80895 () Option!171)

(declare-fun e!80896 () Option!171)

(assert (=> b!123802 (= e!80895 e!80896)))

(declare-fun c!22499 () Bool)

(assert (=> b!123802 (= c!22499 (and ((_ is Cons!1666) lt!63642) (not (= (_1!1265 (h!2267 lt!63642)) (_1!1265 (tuple2!2509 lt!63552 (minValue!2619 (v!3091 (underlying!430 thiss!992)))))))))))

(declare-fun d!37239 () Bool)

(declare-fun c!22498 () Bool)

(assert (=> d!37239 (= c!22498 (and ((_ is Cons!1666) lt!63642) (= (_1!1265 (h!2267 lt!63642)) (_1!1265 (tuple2!2509 lt!63552 (minValue!2619 (v!3091 (underlying!430 thiss!992))))))))))

(assert (=> d!37239 (= (getValueByKey!165 lt!63642 (_1!1265 (tuple2!2509 lt!63552 (minValue!2619 (v!3091 (underlying!430 thiss!992)))))) e!80895)))

(declare-fun b!123804 () Bool)

(assert (=> b!123804 (= e!80896 None!169)))

(declare-fun b!123803 () Bool)

(assert (=> b!123803 (= e!80896 (getValueByKey!165 (t!5965 lt!63642) (_1!1265 (tuple2!2509 lt!63552 (minValue!2619 (v!3091 (underlying!430 thiss!992)))))))))

(declare-fun b!123801 () Bool)

(assert (=> b!123801 (= e!80895 (Some!170 (_2!1265 (h!2267 lt!63642))))))

(assert (= (and d!37239 c!22498) b!123801))

(assert (= (and d!37239 (not c!22498)) b!123802))

(assert (= (and b!123802 c!22499) b!123803))

(assert (= (and b!123802 (not c!22499)) b!123804))

(declare-fun m!143985 () Bool)

(assert (=> b!123803 m!143985))

(assert (=> d!37187 d!37239))

(declare-fun d!37241 () Bool)

(assert (=> d!37241 (= (getValueByKey!165 lt!63642 (_1!1265 (tuple2!2509 lt!63552 (minValue!2619 (v!3091 (underlying!430 thiss!992)))))) (Some!170 (_2!1265 (tuple2!2509 lt!63552 (minValue!2619 (v!3091 (underlying!430 thiss!992)))))))))

(declare-fun lt!63694 () Unit!3839)

(assert (=> d!37241 (= lt!63694 (choose!751 lt!63642 (_1!1265 (tuple2!2509 lt!63552 (minValue!2619 (v!3091 (underlying!430 thiss!992))))) (_2!1265 (tuple2!2509 lt!63552 (minValue!2619 (v!3091 (underlying!430 thiss!992)))))))))

(declare-fun e!80897 () Bool)

(assert (=> d!37241 e!80897))

(declare-fun res!60065 () Bool)

(assert (=> d!37241 (=> (not res!60065) (not e!80897))))

(assert (=> d!37241 (= res!60065 (isStrictlySorted!302 lt!63642))))

(assert (=> d!37241 (= (lemmaContainsTupThenGetReturnValue!81 lt!63642 (_1!1265 (tuple2!2509 lt!63552 (minValue!2619 (v!3091 (underlying!430 thiss!992))))) (_2!1265 (tuple2!2509 lt!63552 (minValue!2619 (v!3091 (underlying!430 thiss!992)))))) lt!63694)))

(declare-fun b!123805 () Bool)

(declare-fun res!60066 () Bool)

(assert (=> b!123805 (=> (not res!60066) (not e!80897))))

(assert (=> b!123805 (= res!60066 (containsKey!168 lt!63642 (_1!1265 (tuple2!2509 lt!63552 (minValue!2619 (v!3091 (underlying!430 thiss!992)))))))))

(declare-fun b!123806 () Bool)

(assert (=> b!123806 (= e!80897 (contains!857 lt!63642 (tuple2!2509 (_1!1265 (tuple2!2509 lt!63552 (minValue!2619 (v!3091 (underlying!430 thiss!992))))) (_2!1265 (tuple2!2509 lt!63552 (minValue!2619 (v!3091 (underlying!430 thiss!992))))))))))

(assert (= (and d!37241 res!60065) b!123805))

(assert (= (and b!123805 res!60066) b!123806))

(assert (=> d!37241 m!143845))

(declare-fun m!143987 () Bool)

(assert (=> d!37241 m!143987))

(declare-fun m!143989 () Bool)

(assert (=> d!37241 m!143989))

(declare-fun m!143991 () Bool)

(assert (=> b!123805 m!143991))

(declare-fun m!143993 () Bool)

(assert (=> b!123806 m!143993))

(assert (=> d!37187 d!37241))

(declare-fun b!123807 () Bool)

(declare-fun res!60068 () Bool)

(declare-fun e!80901 () Bool)

(assert (=> b!123807 (=> (not res!60068) (not e!80901))))

(declare-fun lt!63695 () List!1670)

(assert (=> b!123807 (= res!60068 (containsKey!168 lt!63695 (_1!1265 (tuple2!2509 lt!63552 (minValue!2619 (v!3091 (underlying!430 thiss!992)))))))))

(declare-fun d!37243 () Bool)

(assert (=> d!37243 e!80901))

(declare-fun res!60067 () Bool)

(assert (=> d!37243 (=> (not res!60067) (not e!80901))))

(assert (=> d!37243 (= res!60067 (isStrictlySorted!302 lt!63695))))

(declare-fun e!80900 () List!1670)

(assert (=> d!37243 (= lt!63695 e!80900)))

(declare-fun c!22500 () Bool)

(assert (=> d!37243 (= c!22500 (and ((_ is Cons!1666) (toList!827 lt!63551)) (bvslt (_1!1265 (h!2267 (toList!827 lt!63551))) (_1!1265 (tuple2!2509 lt!63552 (minValue!2619 (v!3091 (underlying!430 thiss!992))))))))))

(assert (=> d!37243 (isStrictlySorted!302 (toList!827 lt!63551))))

(assert (=> d!37243 (= (insertStrictlySorted!84 (toList!827 lt!63551) (_1!1265 (tuple2!2509 lt!63552 (minValue!2619 (v!3091 (underlying!430 thiss!992))))) (_2!1265 (tuple2!2509 lt!63552 (minValue!2619 (v!3091 (underlying!430 thiss!992)))))) lt!63695)))

(declare-fun b!123808 () Bool)

(declare-fun c!22503 () Bool)

(assert (=> b!123808 (= c!22503 (and ((_ is Cons!1666) (toList!827 lt!63551)) (bvsgt (_1!1265 (h!2267 (toList!827 lt!63551))) (_1!1265 (tuple2!2509 lt!63552 (minValue!2619 (v!3091 (underlying!430 thiss!992))))))))))

(declare-fun e!80898 () List!1670)

(declare-fun e!80902 () List!1670)

(assert (=> b!123808 (= e!80898 e!80902)))

(declare-fun b!123809 () Bool)

(assert (=> b!123809 (= e!80901 (contains!857 lt!63695 (tuple2!2509 (_1!1265 (tuple2!2509 lt!63552 (minValue!2619 (v!3091 (underlying!430 thiss!992))))) (_2!1265 (tuple2!2509 lt!63552 (minValue!2619 (v!3091 (underlying!430 thiss!992))))))))))

(declare-fun b!123810 () Bool)

(declare-fun e!80899 () List!1670)

(declare-fun c!22502 () Bool)

(assert (=> b!123810 (= e!80899 (ite c!22502 (t!5965 (toList!827 lt!63551)) (ite c!22503 (Cons!1666 (h!2267 (toList!827 lt!63551)) (t!5965 (toList!827 lt!63551))) Nil!1667)))))

(declare-fun bm!13135 () Bool)

(declare-fun call!13139 () List!1670)

(declare-fun call!13138 () List!1670)

(assert (=> bm!13135 (= call!13139 call!13138)))

(declare-fun b!123811 () Bool)

(assert (=> b!123811 (= e!80899 (insertStrictlySorted!84 (t!5965 (toList!827 lt!63551)) (_1!1265 (tuple2!2509 lt!63552 (minValue!2619 (v!3091 (underlying!430 thiss!992))))) (_2!1265 (tuple2!2509 lt!63552 (minValue!2619 (v!3091 (underlying!430 thiss!992)))))))))

(declare-fun bm!13136 () Bool)

(assert (=> bm!13136 (= call!13138 ($colon$colon!86 e!80899 (ite c!22500 (h!2267 (toList!827 lt!63551)) (tuple2!2509 (_1!1265 (tuple2!2509 lt!63552 (minValue!2619 (v!3091 (underlying!430 thiss!992))))) (_2!1265 (tuple2!2509 lt!63552 (minValue!2619 (v!3091 (underlying!430 thiss!992)))))))))))

(declare-fun c!22501 () Bool)

(assert (=> bm!13136 (= c!22501 c!22500)))

(declare-fun b!123812 () Bool)

(assert (=> b!123812 (= e!80900 e!80898)))

(assert (=> b!123812 (= c!22502 (and ((_ is Cons!1666) (toList!827 lt!63551)) (= (_1!1265 (h!2267 (toList!827 lt!63551))) (_1!1265 (tuple2!2509 lt!63552 (minValue!2619 (v!3091 (underlying!430 thiss!992))))))))))

(declare-fun b!123813 () Bool)

(assert (=> b!123813 (= e!80900 call!13138)))

(declare-fun b!123814 () Bool)

(declare-fun call!13140 () List!1670)

(assert (=> b!123814 (= e!80902 call!13140)))

(declare-fun bm!13137 () Bool)

(assert (=> bm!13137 (= call!13140 call!13139)))

(declare-fun b!123815 () Bool)

(assert (=> b!123815 (= e!80902 call!13140)))

(declare-fun b!123816 () Bool)

(assert (=> b!123816 (= e!80898 call!13139)))

(assert (= (and d!37243 c!22500) b!123813))

(assert (= (and d!37243 (not c!22500)) b!123812))

(assert (= (and b!123812 c!22502) b!123816))

(assert (= (and b!123812 (not c!22502)) b!123808))

(assert (= (and b!123808 c!22503) b!123814))

(assert (= (and b!123808 (not c!22503)) b!123815))

(assert (= (or b!123814 b!123815) bm!13137))

(assert (= (or b!123816 bm!13137) bm!13135))

(assert (= (or b!123813 bm!13135) bm!13136))

(assert (= (and bm!13136 c!22501) b!123811))

(assert (= (and bm!13136 (not c!22501)) b!123810))

(assert (= (and d!37243 res!60067) b!123807))

(assert (= (and b!123807 res!60068) b!123809))

(declare-fun m!143995 () Bool)

(assert (=> b!123811 m!143995))

(declare-fun m!143997 () Bool)

(assert (=> d!37243 m!143997))

(declare-fun m!143999 () Bool)

(assert (=> d!37243 m!143999))

(declare-fun m!144001 () Bool)

(assert (=> b!123807 m!144001))

(declare-fun m!144003 () Bool)

(assert (=> bm!13136 m!144003))

(declare-fun m!144005 () Bool)

(assert (=> b!123809 m!144005))

(assert (=> d!37187 d!37243))

(declare-fun d!37245 () Bool)

(declare-fun e!80903 () Bool)

(assert (=> d!37245 e!80903))

(declare-fun res!60069 () Bool)

(assert (=> d!37245 (=> res!60069 e!80903)))

(declare-fun lt!63696 () Bool)

(assert (=> d!37245 (= res!60069 (not lt!63696))))

(declare-fun lt!63697 () Bool)

(assert (=> d!37245 (= lt!63696 lt!63697)))

(declare-fun lt!63698 () Unit!3839)

(declare-fun e!80904 () Unit!3839)

(assert (=> d!37245 (= lt!63698 e!80904)))

(declare-fun c!22504 () Bool)

(assert (=> d!37245 (= c!22504 lt!63697)))

(assert (=> d!37245 (= lt!63697 (containsKey!168 (toList!827 lt!63595) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!37245 (= (contains!856 lt!63595 #b0000000000000000000000000000000000000000000000000000000000000000) lt!63696)))

(declare-fun b!123817 () Bool)

(declare-fun lt!63699 () Unit!3839)

(assert (=> b!123817 (= e!80904 lt!63699)))

(assert (=> b!123817 (= lt!63699 (lemmaContainsKeyImpliesGetValueByKeyDefined!116 (toList!827 lt!63595) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!123817 (isDefined!117 (getValueByKey!165 (toList!827 lt!63595) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!123818 () Bool)

(declare-fun Unit!3850 () Unit!3839)

(assert (=> b!123818 (= e!80904 Unit!3850)))

(declare-fun b!123819 () Bool)

(assert (=> b!123819 (= e!80903 (isDefined!117 (getValueByKey!165 (toList!827 lt!63595) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!37245 c!22504) b!123817))

(assert (= (and d!37245 (not c!22504)) b!123818))

(assert (= (and d!37245 (not res!60069)) b!123819))

(declare-fun m!144007 () Bool)

(assert (=> d!37245 m!144007))

(declare-fun m!144009 () Bool)

(assert (=> b!123817 m!144009))

(declare-fun m!144011 () Bool)

(assert (=> b!123817 m!144011))

(assert (=> b!123817 m!144011))

(declare-fun m!144013 () Bool)

(assert (=> b!123817 m!144013))

(assert (=> b!123819 m!144011))

(assert (=> b!123819 m!144011))

(assert (=> b!123819 m!144013))

(assert (=> bm!13111 d!37245))

(declare-fun bm!13138 () Bool)

(declare-fun call!13141 () Bool)

(assert (=> bm!13138 (= call!13141 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (_keys!4481 newMap!16) (mask!6992 newMap!16)))))

(declare-fun b!123820 () Bool)

(declare-fun e!80907 () Bool)

(declare-fun e!80905 () Bool)

(assert (=> b!123820 (= e!80907 e!80905)))

(declare-fun lt!63701 () (_ BitVec 64))

(assert (=> b!123820 (= lt!63701 (select (arr!2198 (_keys!4481 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!63702 () Unit!3839)

(assert (=> b!123820 (= lt!63702 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!4481 newMap!16) lt!63701 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!123820 (arrayContainsKey!0 (_keys!4481 newMap!16) lt!63701 #b00000000000000000000000000000000)))

(declare-fun lt!63700 () Unit!3839)

(assert (=> b!123820 (= lt!63700 lt!63702)))

(declare-fun res!60070 () Bool)

(assert (=> b!123820 (= res!60070 (= (seekEntryOrOpen!0 (select (arr!2198 (_keys!4481 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (_keys!4481 newMap!16) (mask!6992 newMap!16)) (Found!261 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!123820 (=> (not res!60070) (not e!80905))))

(declare-fun b!123822 () Bool)

(assert (=> b!123822 (= e!80907 call!13141)))

(declare-fun b!123823 () Bool)

(assert (=> b!123823 (= e!80905 call!13141)))

(declare-fun d!37247 () Bool)

(declare-fun res!60071 () Bool)

(declare-fun e!80906 () Bool)

(assert (=> d!37247 (=> res!60071 e!80906)))

(assert (=> d!37247 (= res!60071 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2460 (_keys!4481 newMap!16))))))

(assert (=> d!37247 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!4481 newMap!16) (mask!6992 newMap!16)) e!80906)))

(declare-fun b!123821 () Bool)

(assert (=> b!123821 (= e!80906 e!80907)))

(declare-fun c!22505 () Bool)

(assert (=> b!123821 (= c!22505 (validKeyInArray!0 (select (arr!2198 (_keys!4481 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!37247 (not res!60071)) b!123821))

(assert (= (and b!123821 c!22505) b!123820))

(assert (= (and b!123821 (not c!22505)) b!123822))

(assert (= (and b!123820 res!60070) b!123823))

(assert (= (or b!123823 b!123822) bm!13138))

(declare-fun m!144015 () Bool)

(assert (=> bm!13138 m!144015))

(declare-fun m!144017 () Bool)

(assert (=> b!123820 m!144017))

(declare-fun m!144019 () Bool)

(assert (=> b!123820 m!144019))

(declare-fun m!144021 () Bool)

(assert (=> b!123820 m!144021))

(assert (=> b!123820 m!144017))

(declare-fun m!144023 () Bool)

(assert (=> b!123820 m!144023))

(assert (=> b!123821 m!144017))

(assert (=> b!123821 m!144017))

(declare-fun m!144025 () Bool)

(assert (=> b!123821 m!144025))

(assert (=> bm!13122 d!37247))

(declare-fun d!37249 () Bool)

(assert (=> d!37249 (= (get!1435 (getValueByKey!165 (toList!827 lt!63534) lt!63546)) (v!3096 (getValueByKey!165 (toList!827 lt!63534) lt!63546)))))

(assert (=> d!37189 d!37249))

(declare-fun b!123825 () Bool)

(declare-fun e!80908 () Option!171)

(declare-fun e!80909 () Option!171)

(assert (=> b!123825 (= e!80908 e!80909)))

(declare-fun c!22507 () Bool)

(assert (=> b!123825 (= c!22507 (and ((_ is Cons!1666) (toList!827 lt!63534)) (not (= (_1!1265 (h!2267 (toList!827 lt!63534))) lt!63546))))))

(declare-fun d!37251 () Bool)

(declare-fun c!22506 () Bool)

(assert (=> d!37251 (= c!22506 (and ((_ is Cons!1666) (toList!827 lt!63534)) (= (_1!1265 (h!2267 (toList!827 lt!63534))) lt!63546)))))

(assert (=> d!37251 (= (getValueByKey!165 (toList!827 lt!63534) lt!63546) e!80908)))

(declare-fun b!123827 () Bool)

(assert (=> b!123827 (= e!80909 None!169)))

(declare-fun b!123826 () Bool)

(assert (=> b!123826 (= e!80909 (getValueByKey!165 (t!5965 (toList!827 lt!63534)) lt!63546))))

(declare-fun b!123824 () Bool)

(assert (=> b!123824 (= e!80908 (Some!170 (_2!1265 (h!2267 (toList!827 lt!63534)))))))

(assert (= (and d!37251 c!22506) b!123824))

(assert (= (and d!37251 (not c!22506)) b!123825))

(assert (= (and b!123825 c!22507) b!123826))

(assert (= (and b!123825 (not c!22507)) b!123827))

(declare-fun m!144027 () Bool)

(assert (=> b!123826 m!144027))

(assert (=> d!37189 d!37251))

(assert (=> b!123688 d!37149))

(declare-fun d!37253 () Bool)

(assert (=> d!37253 (= (apply!108 lt!63595 #b0000000000000000000000000000000000000000000000000000000000000000) (get!1435 (getValueByKey!165 (toList!827 lt!63595) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!5140 () Bool)

(assert (= bs!5140 d!37253))

(assert (=> bs!5140 m!144011))

(assert (=> bs!5140 m!144011))

(declare-fun m!144029 () Bool)

(assert (=> bs!5140 m!144029))

(assert (=> b!123638 d!37253))

(declare-fun b!123830 () Bool)

(declare-fun res!60072 () Bool)

(declare-fun e!80910 () Bool)

(assert (=> b!123830 (=> (not res!60072) (not e!80910))))

(assert (=> b!123830 (= res!60072 (= (size!2466 (v!3091 (underlying!430 thiss!992))) (bvadd (_size!570 (v!3091 (underlying!430 thiss!992))) (bvsdiv (bvadd (extraKeys!2539 (v!3091 (underlying!430 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!123831 () Bool)

(assert (=> b!123831 (= e!80910 (and (bvsge (extraKeys!2539 (v!3091 (underlying!430 thiss!992))) #b00000000000000000000000000000000) (bvsle (extraKeys!2539 (v!3091 (underlying!430 thiss!992))) #b00000000000000000000000000000011) (bvsge (_vacant!570 (v!3091 (underlying!430 thiss!992))) #b00000000000000000000000000000000)))))

(declare-fun d!37255 () Bool)

(declare-fun res!60074 () Bool)

(assert (=> d!37255 (=> (not res!60074) (not e!80910))))

(assert (=> d!37255 (= res!60074 (validMask!0 (mask!6992 (v!3091 (underlying!430 thiss!992)))))))

(assert (=> d!37255 (= (simpleValid!84 (v!3091 (underlying!430 thiss!992))) e!80910)))

(declare-fun b!123828 () Bool)

(declare-fun res!60073 () Bool)

(assert (=> b!123828 (=> (not res!60073) (not e!80910))))

(assert (=> b!123828 (= res!60073 (and (= (size!2461 (_values!2737 (v!3091 (underlying!430 thiss!992)))) (bvadd (mask!6992 (v!3091 (underlying!430 thiss!992))) #b00000000000000000000000000000001)) (= (size!2460 (_keys!4481 (v!3091 (underlying!430 thiss!992)))) (size!2461 (_values!2737 (v!3091 (underlying!430 thiss!992))))) (bvsge (_size!570 (v!3091 (underlying!430 thiss!992))) #b00000000000000000000000000000000) (bvsle (_size!570 (v!3091 (underlying!430 thiss!992))) (bvadd (mask!6992 (v!3091 (underlying!430 thiss!992))) #b00000000000000000000000000000001))))))

(declare-fun b!123829 () Bool)

(declare-fun res!60075 () Bool)

(assert (=> b!123829 (=> (not res!60075) (not e!80910))))

(assert (=> b!123829 (= res!60075 (bvsge (size!2466 (v!3091 (underlying!430 thiss!992))) (_size!570 (v!3091 (underlying!430 thiss!992)))))))

(assert (= (and d!37255 res!60074) b!123828))

(assert (= (and b!123828 res!60073) b!123829))

(assert (= (and b!123829 res!60075) b!123830))

(assert (= (and b!123830 res!60072) b!123831))

(declare-fun m!144031 () Bool)

(assert (=> b!123830 m!144031))

(assert (=> d!37255 m!143603))

(assert (=> b!123829 m!144031))

(assert (=> d!37163 d!37255))

(declare-fun d!37257 () Bool)

(assert (=> d!37257 (isDefined!117 (getValueByKey!165 (toList!827 lt!63541) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!63705 () Unit!3839)

(declare-fun choose!752 (List!1670 (_ BitVec 64)) Unit!3839)

(assert (=> d!37257 (= lt!63705 (choose!752 (toList!827 lt!63541) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!80913 () Bool)

(assert (=> d!37257 e!80913))

(declare-fun res!60078 () Bool)

(assert (=> d!37257 (=> (not res!60078) (not e!80913))))

(assert (=> d!37257 (= res!60078 (isStrictlySorted!302 (toList!827 lt!63541)))))

(assert (=> d!37257 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!116 (toList!827 lt!63541) #b0000000000000000000000000000000000000000000000000000000000000000) lt!63705)))

(declare-fun b!123834 () Bool)

(assert (=> b!123834 (= e!80913 (containsKey!168 (toList!827 lt!63541) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!37257 res!60078) b!123834))

(assert (=> d!37257 m!143681))

(assert (=> d!37257 m!143681))

(assert (=> d!37257 m!143683))

(declare-fun m!144033 () Bool)

(assert (=> d!37257 m!144033))

(declare-fun m!144035 () Bool)

(assert (=> d!37257 m!144035))

(assert (=> b!123834 m!143677))

(assert (=> b!123587 d!37257))

(declare-fun d!37259 () Bool)

(declare-fun isEmpty!397 (Option!171) Bool)

(assert (=> d!37259 (= (isDefined!117 (getValueByKey!165 (toList!827 lt!63541) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (isEmpty!397 (getValueByKey!165 (toList!827 lt!63541) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bs!5141 () Bool)

(assert (= bs!5141 d!37259))

(assert (=> bs!5141 m!143681))

(declare-fun m!144037 () Bool)

(assert (=> bs!5141 m!144037))

(assert (=> b!123587 d!37259))

(declare-fun b!123836 () Bool)

(declare-fun e!80914 () Option!171)

(declare-fun e!80915 () Option!171)

(assert (=> b!123836 (= e!80914 e!80915)))

(declare-fun c!22509 () Bool)

(assert (=> b!123836 (= c!22509 (and ((_ is Cons!1666) (toList!827 lt!63541)) (not (= (_1!1265 (h!2267 (toList!827 lt!63541))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!37261 () Bool)

(declare-fun c!22508 () Bool)

(assert (=> d!37261 (= c!22508 (and ((_ is Cons!1666) (toList!827 lt!63541)) (= (_1!1265 (h!2267 (toList!827 lt!63541))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!37261 (= (getValueByKey!165 (toList!827 lt!63541) #b0000000000000000000000000000000000000000000000000000000000000000) e!80914)))

(declare-fun b!123838 () Bool)

(assert (=> b!123838 (= e!80915 None!169)))

(declare-fun b!123837 () Bool)

(assert (=> b!123837 (= e!80915 (getValueByKey!165 (t!5965 (toList!827 lt!63541)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!123835 () Bool)

(assert (=> b!123835 (= e!80914 (Some!170 (_2!1265 (h!2267 (toList!827 lt!63541)))))))

(assert (= (and d!37261 c!22508) b!123835))

(assert (= (and d!37261 (not c!22508)) b!123836))

(assert (= (and b!123836 c!22509) b!123837))

(assert (= (and b!123836 (not c!22509)) b!123838))

(declare-fun m!144039 () Bool)

(assert (=> b!123837 m!144039))

(assert (=> b!123587 d!37261))

(declare-fun b!123840 () Bool)

(declare-fun e!80916 () Option!171)

(declare-fun e!80917 () Option!171)

(assert (=> b!123840 (= e!80916 e!80917)))

(declare-fun c!22511 () Bool)

(assert (=> b!123840 (= c!22511 (and ((_ is Cons!1666) (toList!827 lt!63640)) (not (= (_1!1265 (h!2267 (toList!827 lt!63640))) (_1!1265 (tuple2!2509 lt!63552 (minValue!2619 (v!3091 (underlying!430 thiss!992)))))))))))

(declare-fun c!22510 () Bool)

(declare-fun d!37263 () Bool)

(assert (=> d!37263 (= c!22510 (and ((_ is Cons!1666) (toList!827 lt!63640)) (= (_1!1265 (h!2267 (toList!827 lt!63640))) (_1!1265 (tuple2!2509 lt!63552 (minValue!2619 (v!3091 (underlying!430 thiss!992))))))))))

(assert (=> d!37263 (= (getValueByKey!165 (toList!827 lt!63640) (_1!1265 (tuple2!2509 lt!63552 (minValue!2619 (v!3091 (underlying!430 thiss!992)))))) e!80916)))

(declare-fun b!123842 () Bool)

(assert (=> b!123842 (= e!80917 None!169)))

(declare-fun b!123841 () Bool)

(assert (=> b!123841 (= e!80917 (getValueByKey!165 (t!5965 (toList!827 lt!63640)) (_1!1265 (tuple2!2509 lt!63552 (minValue!2619 (v!3091 (underlying!430 thiss!992)))))))))

(declare-fun b!123839 () Bool)

(assert (=> b!123839 (= e!80916 (Some!170 (_2!1265 (h!2267 (toList!827 lt!63640)))))))

(assert (= (and d!37263 c!22510) b!123839))

(assert (= (and d!37263 (not c!22510)) b!123840))

(assert (= (and b!123840 c!22511) b!123841))

(assert (= (and b!123840 (not c!22511)) b!123842))

(declare-fun m!144041 () Bool)

(assert (=> b!123841 m!144041))

(assert (=> b!123697 d!37263))

(assert (=> b!123589 d!37259))

(assert (=> b!123589 d!37261))

(declare-fun d!37265 () Bool)

(assert (=> d!37265 (= (get!1435 (getValueByKey!165 (toList!827 (+!161 lt!63551 (tuple2!2509 lt!63552 (minValue!2619 (v!3091 (underlying!430 thiss!992)))))) lt!63536)) (v!3096 (getValueByKey!165 (toList!827 (+!161 lt!63551 (tuple2!2509 lt!63552 (minValue!2619 (v!3091 (underlying!430 thiss!992)))))) lt!63536)))))

(assert (=> d!37181 d!37265))

(declare-fun b!123844 () Bool)

(declare-fun e!80918 () Option!171)

(declare-fun e!80919 () Option!171)

(assert (=> b!123844 (= e!80918 e!80919)))

(declare-fun c!22513 () Bool)

(assert (=> b!123844 (= c!22513 (and ((_ is Cons!1666) (toList!827 (+!161 lt!63551 (tuple2!2509 lt!63552 (minValue!2619 (v!3091 (underlying!430 thiss!992))))))) (not (= (_1!1265 (h!2267 (toList!827 (+!161 lt!63551 (tuple2!2509 lt!63552 (minValue!2619 (v!3091 (underlying!430 thiss!992)))))))) lt!63536))))))

(declare-fun d!37267 () Bool)

(declare-fun c!22512 () Bool)

(assert (=> d!37267 (= c!22512 (and ((_ is Cons!1666) (toList!827 (+!161 lt!63551 (tuple2!2509 lt!63552 (minValue!2619 (v!3091 (underlying!430 thiss!992))))))) (= (_1!1265 (h!2267 (toList!827 (+!161 lt!63551 (tuple2!2509 lt!63552 (minValue!2619 (v!3091 (underlying!430 thiss!992)))))))) lt!63536)))))

(assert (=> d!37267 (= (getValueByKey!165 (toList!827 (+!161 lt!63551 (tuple2!2509 lt!63552 (minValue!2619 (v!3091 (underlying!430 thiss!992)))))) lt!63536) e!80918)))

(declare-fun b!123846 () Bool)

(assert (=> b!123846 (= e!80919 None!169)))

(declare-fun b!123845 () Bool)

(assert (=> b!123845 (= e!80919 (getValueByKey!165 (t!5965 (toList!827 (+!161 lt!63551 (tuple2!2509 lt!63552 (minValue!2619 (v!3091 (underlying!430 thiss!992))))))) lt!63536))))

(declare-fun b!123843 () Bool)

(assert (=> b!123843 (= e!80918 (Some!170 (_2!1265 (h!2267 (toList!827 (+!161 lt!63551 (tuple2!2509 lt!63552 (minValue!2619 (v!3091 (underlying!430 thiss!992))))))))))))

(assert (= (and d!37267 c!22512) b!123843))

(assert (= (and d!37267 (not c!22512)) b!123844))

(assert (= (and b!123844 c!22513) b!123845))

(assert (= (and b!123844 (not c!22513)) b!123846))

(declare-fun m!144043 () Bool)

(assert (=> b!123845 m!144043))

(assert (=> d!37181 d!37267))

(declare-fun d!37269 () Bool)

(declare-fun e!80920 () Bool)

(assert (=> d!37269 e!80920))

(declare-fun res!60079 () Bool)

(assert (=> d!37269 (=> res!60079 e!80920)))

(declare-fun lt!63706 () Bool)

(assert (=> d!37269 (= res!60079 (not lt!63706))))

(declare-fun lt!63707 () Bool)

(assert (=> d!37269 (= lt!63706 lt!63707)))

(declare-fun lt!63708 () Unit!3839)

(declare-fun e!80921 () Unit!3839)

(assert (=> d!37269 (= lt!63708 e!80921)))

(declare-fun c!22514 () Bool)

(assert (=> d!37269 (= c!22514 lt!63707)))

(assert (=> d!37269 (= lt!63707 (containsKey!168 (toList!827 lt!63582) (_1!1265 (ite (or c!22432 c!22430) (tuple2!2509 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2619 (v!3091 (underlying!430 thiss!992)))) (tuple2!2509 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 (v!3091 (underlying!430 thiss!992))))))))))

(assert (=> d!37269 (= (contains!856 lt!63582 (_1!1265 (ite (or c!22432 c!22430) (tuple2!2509 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2619 (v!3091 (underlying!430 thiss!992)))) (tuple2!2509 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 (v!3091 (underlying!430 thiss!992))))))) lt!63706)))

(declare-fun b!123847 () Bool)

(declare-fun lt!63709 () Unit!3839)

(assert (=> b!123847 (= e!80921 lt!63709)))

(assert (=> b!123847 (= lt!63709 (lemmaContainsKeyImpliesGetValueByKeyDefined!116 (toList!827 lt!63582) (_1!1265 (ite (or c!22432 c!22430) (tuple2!2509 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2619 (v!3091 (underlying!430 thiss!992)))) (tuple2!2509 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 (v!3091 (underlying!430 thiss!992))))))))))

(assert (=> b!123847 (isDefined!117 (getValueByKey!165 (toList!827 lt!63582) (_1!1265 (ite (or c!22432 c!22430) (tuple2!2509 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2619 (v!3091 (underlying!430 thiss!992)))) (tuple2!2509 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 (v!3091 (underlying!430 thiss!992))))))))))

(declare-fun b!123848 () Bool)

(declare-fun Unit!3851 () Unit!3839)

(assert (=> b!123848 (= e!80921 Unit!3851)))

(declare-fun b!123849 () Bool)

(assert (=> b!123849 (= e!80920 (isDefined!117 (getValueByKey!165 (toList!827 lt!63582) (_1!1265 (ite (or c!22432 c!22430) (tuple2!2509 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2619 (v!3091 (underlying!430 thiss!992)))) (tuple2!2509 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 (v!3091 (underlying!430 thiss!992)))))))))))

(assert (= (and d!37269 c!22514) b!123847))

(assert (= (and d!37269 (not c!22514)) b!123848))

(assert (= (and d!37269 (not res!60079)) b!123849))

(declare-fun m!144045 () Bool)

(assert (=> d!37269 m!144045))

(declare-fun m!144047 () Bool)

(assert (=> b!123847 m!144047))

(assert (=> b!123847 m!143717))

(assert (=> b!123847 m!143717))

(declare-fun m!144049 () Bool)

(assert (=> b!123847 m!144049))

(assert (=> b!123849 m!143717))

(assert (=> b!123849 m!143717))

(assert (=> b!123849 m!144049))

(assert (=> d!37161 d!37269))

(declare-fun b!123851 () Bool)

(declare-fun e!80922 () Option!171)

(declare-fun e!80923 () Option!171)

(assert (=> b!123851 (= e!80922 e!80923)))

(declare-fun c!22516 () Bool)

(assert (=> b!123851 (= c!22516 (and ((_ is Cons!1666) lt!63584) (not (= (_1!1265 (h!2267 lt!63584)) (_1!1265 (ite (or c!22432 c!22430) (tuple2!2509 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2619 (v!3091 (underlying!430 thiss!992)))) (tuple2!2509 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 (v!3091 (underlying!430 thiss!992))))))))))))

(declare-fun c!22515 () Bool)

(declare-fun d!37271 () Bool)

(assert (=> d!37271 (= c!22515 (and ((_ is Cons!1666) lt!63584) (= (_1!1265 (h!2267 lt!63584)) (_1!1265 (ite (or c!22432 c!22430) (tuple2!2509 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2619 (v!3091 (underlying!430 thiss!992)))) (tuple2!2509 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 (v!3091 (underlying!430 thiss!992)))))))))))

(assert (=> d!37271 (= (getValueByKey!165 lt!63584 (_1!1265 (ite (or c!22432 c!22430) (tuple2!2509 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2619 (v!3091 (underlying!430 thiss!992)))) (tuple2!2509 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 (v!3091 (underlying!430 thiss!992))))))) e!80922)))

(declare-fun b!123853 () Bool)

(assert (=> b!123853 (= e!80923 None!169)))

(declare-fun b!123852 () Bool)

(assert (=> b!123852 (= e!80923 (getValueByKey!165 (t!5965 lt!63584) (_1!1265 (ite (or c!22432 c!22430) (tuple2!2509 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2619 (v!3091 (underlying!430 thiss!992)))) (tuple2!2509 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 (v!3091 (underlying!430 thiss!992))))))))))

(declare-fun b!123850 () Bool)

(assert (=> b!123850 (= e!80922 (Some!170 (_2!1265 (h!2267 lt!63584))))))

(assert (= (and d!37271 c!22515) b!123850))

(assert (= (and d!37271 (not c!22515)) b!123851))

(assert (= (and b!123851 c!22516) b!123852))

(assert (= (and b!123851 (not c!22516)) b!123853))

(declare-fun m!144051 () Bool)

(assert (=> b!123852 m!144051))

(assert (=> d!37161 d!37271))

(declare-fun d!37273 () Bool)

(assert (=> d!37273 (= (getValueByKey!165 lt!63584 (_1!1265 (ite (or c!22432 c!22430) (tuple2!2509 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2619 (v!3091 (underlying!430 thiss!992)))) (tuple2!2509 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 (v!3091 (underlying!430 thiss!992))))))) (Some!170 (_2!1265 (ite (or c!22432 c!22430) (tuple2!2509 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2619 (v!3091 (underlying!430 thiss!992)))) (tuple2!2509 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 (v!3091 (underlying!430 thiss!992))))))))))

(declare-fun lt!63710 () Unit!3839)

(assert (=> d!37273 (= lt!63710 (choose!751 lt!63584 (_1!1265 (ite (or c!22432 c!22430) (tuple2!2509 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2619 (v!3091 (underlying!430 thiss!992)))) (tuple2!2509 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 (v!3091 (underlying!430 thiss!992)))))) (_2!1265 (ite (or c!22432 c!22430) (tuple2!2509 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2619 (v!3091 (underlying!430 thiss!992)))) (tuple2!2509 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 (v!3091 (underlying!430 thiss!992))))))))))

(declare-fun e!80924 () Bool)

(assert (=> d!37273 e!80924))

(declare-fun res!60080 () Bool)

(assert (=> d!37273 (=> (not res!60080) (not e!80924))))

(assert (=> d!37273 (= res!60080 (isStrictlySorted!302 lt!63584))))

(assert (=> d!37273 (= (lemmaContainsTupThenGetReturnValue!81 lt!63584 (_1!1265 (ite (or c!22432 c!22430) (tuple2!2509 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2619 (v!3091 (underlying!430 thiss!992)))) (tuple2!2509 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 (v!3091 (underlying!430 thiss!992)))))) (_2!1265 (ite (or c!22432 c!22430) (tuple2!2509 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2619 (v!3091 (underlying!430 thiss!992)))) (tuple2!2509 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 (v!3091 (underlying!430 thiss!992))))))) lt!63710)))

(declare-fun b!123854 () Bool)

(declare-fun res!60081 () Bool)

(assert (=> b!123854 (=> (not res!60081) (not e!80924))))

(assert (=> b!123854 (= res!60081 (containsKey!168 lt!63584 (_1!1265 (ite (or c!22432 c!22430) (tuple2!2509 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2619 (v!3091 (underlying!430 thiss!992)))) (tuple2!2509 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 (v!3091 (underlying!430 thiss!992))))))))))

(declare-fun b!123855 () Bool)

(assert (=> b!123855 (= e!80924 (contains!857 lt!63584 (tuple2!2509 (_1!1265 (ite (or c!22432 c!22430) (tuple2!2509 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2619 (v!3091 (underlying!430 thiss!992)))) (tuple2!2509 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 (v!3091 (underlying!430 thiss!992)))))) (_2!1265 (ite (or c!22432 c!22430) (tuple2!2509 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2619 (v!3091 (underlying!430 thiss!992)))) (tuple2!2509 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 (v!3091 (underlying!430 thiss!992)))))))))))

(assert (= (and d!37273 res!60080) b!123854))

(assert (= (and b!123854 res!60081) b!123855))

(assert (=> d!37273 m!143711))

(declare-fun m!144053 () Bool)

(assert (=> d!37273 m!144053))

(declare-fun m!144055 () Bool)

(assert (=> d!37273 m!144055))

(declare-fun m!144057 () Bool)

(assert (=> b!123854 m!144057))

(declare-fun m!144059 () Bool)

(assert (=> b!123855 m!144059))

(assert (=> d!37161 d!37273))

(declare-fun b!123856 () Bool)

(declare-fun res!60083 () Bool)

(declare-fun e!80928 () Bool)

(assert (=> b!123856 (=> (not res!60083) (not e!80928))))

(declare-fun lt!63711 () List!1670)

(assert (=> b!123856 (= res!60083 (containsKey!168 lt!63711 (_1!1265 (ite (or c!22432 c!22430) (tuple2!2509 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2619 (v!3091 (underlying!430 thiss!992)))) (tuple2!2509 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 (v!3091 (underlying!430 thiss!992))))))))))

(declare-fun d!37275 () Bool)

(assert (=> d!37275 e!80928))

(declare-fun res!60082 () Bool)

(assert (=> d!37275 (=> (not res!60082) (not e!80928))))

(assert (=> d!37275 (= res!60082 (isStrictlySorted!302 lt!63711))))

(declare-fun e!80927 () List!1670)

(assert (=> d!37275 (= lt!63711 e!80927)))

(declare-fun c!22517 () Bool)

(assert (=> d!37275 (= c!22517 (and ((_ is Cons!1666) (toList!827 (ite c!22432 call!13106 (ite c!22430 call!13108 call!13104)))) (bvslt (_1!1265 (h!2267 (toList!827 (ite c!22432 call!13106 (ite c!22430 call!13108 call!13104))))) (_1!1265 (ite (or c!22432 c!22430) (tuple2!2509 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2619 (v!3091 (underlying!430 thiss!992)))) (tuple2!2509 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 (v!3091 (underlying!430 thiss!992)))))))))))

(assert (=> d!37275 (isStrictlySorted!302 (toList!827 (ite c!22432 call!13106 (ite c!22430 call!13108 call!13104))))))

(assert (=> d!37275 (= (insertStrictlySorted!84 (toList!827 (ite c!22432 call!13106 (ite c!22430 call!13108 call!13104))) (_1!1265 (ite (or c!22432 c!22430) (tuple2!2509 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2619 (v!3091 (underlying!430 thiss!992)))) (tuple2!2509 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 (v!3091 (underlying!430 thiss!992)))))) (_2!1265 (ite (or c!22432 c!22430) (tuple2!2509 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2619 (v!3091 (underlying!430 thiss!992)))) (tuple2!2509 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 (v!3091 (underlying!430 thiss!992))))))) lt!63711)))

(declare-fun b!123857 () Bool)

(declare-fun c!22520 () Bool)

(assert (=> b!123857 (= c!22520 (and ((_ is Cons!1666) (toList!827 (ite c!22432 call!13106 (ite c!22430 call!13108 call!13104)))) (bvsgt (_1!1265 (h!2267 (toList!827 (ite c!22432 call!13106 (ite c!22430 call!13108 call!13104))))) (_1!1265 (ite (or c!22432 c!22430) (tuple2!2509 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2619 (v!3091 (underlying!430 thiss!992)))) (tuple2!2509 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 (v!3091 (underlying!430 thiss!992)))))))))))

(declare-fun e!80925 () List!1670)

(declare-fun e!80929 () List!1670)

(assert (=> b!123857 (= e!80925 e!80929)))

(declare-fun b!123858 () Bool)

(assert (=> b!123858 (= e!80928 (contains!857 lt!63711 (tuple2!2509 (_1!1265 (ite (or c!22432 c!22430) (tuple2!2509 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2619 (v!3091 (underlying!430 thiss!992)))) (tuple2!2509 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 (v!3091 (underlying!430 thiss!992)))))) (_2!1265 (ite (or c!22432 c!22430) (tuple2!2509 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2619 (v!3091 (underlying!430 thiss!992)))) (tuple2!2509 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 (v!3091 (underlying!430 thiss!992)))))))))))

(declare-fun e!80926 () List!1670)

(declare-fun b!123859 () Bool)

(declare-fun c!22519 () Bool)

(assert (=> b!123859 (= e!80926 (ite c!22519 (t!5965 (toList!827 (ite c!22432 call!13106 (ite c!22430 call!13108 call!13104)))) (ite c!22520 (Cons!1666 (h!2267 (toList!827 (ite c!22432 call!13106 (ite c!22430 call!13108 call!13104)))) (t!5965 (toList!827 (ite c!22432 call!13106 (ite c!22430 call!13108 call!13104))))) Nil!1667)))))

(declare-fun bm!13139 () Bool)

(declare-fun call!13143 () List!1670)

(declare-fun call!13142 () List!1670)

(assert (=> bm!13139 (= call!13143 call!13142)))

(declare-fun b!123860 () Bool)

(assert (=> b!123860 (= e!80926 (insertStrictlySorted!84 (t!5965 (toList!827 (ite c!22432 call!13106 (ite c!22430 call!13108 call!13104)))) (_1!1265 (ite (or c!22432 c!22430) (tuple2!2509 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2619 (v!3091 (underlying!430 thiss!992)))) (tuple2!2509 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 (v!3091 (underlying!430 thiss!992)))))) (_2!1265 (ite (or c!22432 c!22430) (tuple2!2509 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2619 (v!3091 (underlying!430 thiss!992)))) (tuple2!2509 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 (v!3091 (underlying!430 thiss!992))))))))))

(declare-fun bm!13140 () Bool)

(assert (=> bm!13140 (= call!13142 ($colon$colon!86 e!80926 (ite c!22517 (h!2267 (toList!827 (ite c!22432 call!13106 (ite c!22430 call!13108 call!13104)))) (tuple2!2509 (_1!1265 (ite (or c!22432 c!22430) (tuple2!2509 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2619 (v!3091 (underlying!430 thiss!992)))) (tuple2!2509 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 (v!3091 (underlying!430 thiss!992)))))) (_2!1265 (ite (or c!22432 c!22430) (tuple2!2509 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2619 (v!3091 (underlying!430 thiss!992)))) (tuple2!2509 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 (v!3091 (underlying!430 thiss!992))))))))))))

(declare-fun c!22518 () Bool)

(assert (=> bm!13140 (= c!22518 c!22517)))

(declare-fun b!123861 () Bool)

(assert (=> b!123861 (= e!80927 e!80925)))

(assert (=> b!123861 (= c!22519 (and ((_ is Cons!1666) (toList!827 (ite c!22432 call!13106 (ite c!22430 call!13108 call!13104)))) (= (_1!1265 (h!2267 (toList!827 (ite c!22432 call!13106 (ite c!22430 call!13108 call!13104))))) (_1!1265 (ite (or c!22432 c!22430) (tuple2!2509 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2619 (v!3091 (underlying!430 thiss!992)))) (tuple2!2509 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 (v!3091 (underlying!430 thiss!992)))))))))))

(declare-fun b!123862 () Bool)

(assert (=> b!123862 (= e!80927 call!13142)))

(declare-fun b!123863 () Bool)

(declare-fun call!13144 () List!1670)

(assert (=> b!123863 (= e!80929 call!13144)))

(declare-fun bm!13141 () Bool)

(assert (=> bm!13141 (= call!13144 call!13143)))

(declare-fun b!123864 () Bool)

(assert (=> b!123864 (= e!80929 call!13144)))

(declare-fun b!123865 () Bool)

(assert (=> b!123865 (= e!80925 call!13143)))

(assert (= (and d!37275 c!22517) b!123862))

(assert (= (and d!37275 (not c!22517)) b!123861))

(assert (= (and b!123861 c!22519) b!123865))

(assert (= (and b!123861 (not c!22519)) b!123857))

(assert (= (and b!123857 c!22520) b!123863))

(assert (= (and b!123857 (not c!22520)) b!123864))

(assert (= (or b!123863 b!123864) bm!13141))

(assert (= (or b!123865 bm!13141) bm!13139))

(assert (= (or b!123862 bm!13139) bm!13140))

(assert (= (and bm!13140 c!22518) b!123860))

(assert (= (and bm!13140 (not c!22518)) b!123859))

(assert (= (and d!37275 res!60082) b!123856))

(assert (= (and b!123856 res!60083) b!123858))

(declare-fun m!144061 () Bool)

(assert (=> b!123860 m!144061))

(declare-fun m!144063 () Bool)

(assert (=> d!37275 m!144063))

(declare-fun m!144065 () Bool)

(assert (=> d!37275 m!144065))

(declare-fun m!144067 () Bool)

(assert (=> b!123856 m!144067))

(declare-fun m!144069 () Bool)

(assert (=> bm!13140 m!144069))

(declare-fun m!144071 () Bool)

(assert (=> b!123858 m!144071))

(assert (=> d!37161 d!37275))

(declare-fun d!37277 () Bool)

(assert (=> d!37277 (= (size!2466 newMap!16) (bvadd (_size!570 newMap!16) (bvsdiv (bvadd (extraKeys!2539 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000010)))))

(assert (=> b!123650 d!37277))

(assert (=> d!37199 d!37179))

(assert (=> d!37199 d!37185))

(declare-fun d!37279 () Bool)

(declare-fun e!80930 () Bool)

(assert (=> d!37279 e!80930))

(declare-fun res!60084 () Bool)

(assert (=> d!37279 (=> res!60084 e!80930)))

(declare-fun lt!63712 () Bool)

(assert (=> d!37279 (= res!60084 (not lt!63712))))

(declare-fun lt!63713 () Bool)

(assert (=> d!37279 (= lt!63712 lt!63713)))

(declare-fun lt!63714 () Unit!3839)

(declare-fun e!80931 () Unit!3839)

(assert (=> d!37279 (= lt!63714 e!80931)))

(declare-fun c!22521 () Bool)

(assert (=> d!37279 (= c!22521 lt!63713)))

(assert (=> d!37279 (= lt!63713 (containsKey!168 (toList!827 lt!63535) lt!63542))))

(assert (=> d!37279 (= (contains!856 lt!63535 lt!63542) lt!63712)))

(declare-fun b!123866 () Bool)

(declare-fun lt!63715 () Unit!3839)

(assert (=> b!123866 (= e!80931 lt!63715)))

(assert (=> b!123866 (= lt!63715 (lemmaContainsKeyImpliesGetValueByKeyDefined!116 (toList!827 lt!63535) lt!63542))))

(assert (=> b!123866 (isDefined!117 (getValueByKey!165 (toList!827 lt!63535) lt!63542))))

(declare-fun b!123867 () Bool)

(declare-fun Unit!3852 () Unit!3839)

(assert (=> b!123867 (= e!80931 Unit!3852)))

(declare-fun b!123868 () Bool)

(assert (=> b!123868 (= e!80930 (isDefined!117 (getValueByKey!165 (toList!827 lt!63535) lt!63542)))))

(assert (= (and d!37279 c!22521) b!123866))

(assert (= (and d!37279 (not c!22521)) b!123867))

(assert (= (and d!37279 (not res!60084)) b!123868))

(declare-fun m!144073 () Bool)

(assert (=> d!37279 m!144073))

(declare-fun m!144075 () Bool)

(assert (=> b!123866 m!144075))

(assert (=> b!123866 m!143875))

(assert (=> b!123866 m!143875))

(declare-fun m!144077 () Bool)

(assert (=> b!123866 m!144077))

(assert (=> b!123868 m!143875))

(assert (=> b!123868 m!143875))

(assert (=> b!123868 m!144077))

(assert (=> d!37199 d!37279))

(assert (=> d!37199 d!37195))

(declare-fun d!37281 () Bool)

(assert (=> d!37281 (= (apply!108 (+!161 lt!63535 (tuple2!2509 lt!63549 (zeroValue!2619 (v!3091 (underlying!430 thiss!992))))) lt!63542) (apply!108 lt!63535 lt!63542))))

(assert (=> d!37281 true))

(declare-fun _$34!938 () Unit!3839)

(assert (=> d!37281 (= (choose!749 lt!63535 lt!63549 (zeroValue!2619 (v!3091 (underlying!430 thiss!992))) lt!63542) _$34!938)))

(declare-fun bs!5142 () Bool)

(assert (= bs!5142 d!37281))

(assert (=> bs!5142 m!143639))

(assert (=> bs!5142 m!143639))

(assert (=> bs!5142 m!143641))

(assert (=> bs!5142 m!143633))

(assert (=> d!37199 d!37281))

(declare-fun d!37283 () Bool)

(declare-fun e!80932 () Bool)

(assert (=> d!37283 e!80932))

(declare-fun res!60085 () Bool)

(assert (=> d!37283 (=> res!60085 e!80932)))

(declare-fun lt!63716 () Bool)

(assert (=> d!37283 (= res!60085 (not lt!63716))))

(declare-fun lt!63717 () Bool)

(assert (=> d!37283 (= lt!63716 lt!63717)))

(declare-fun lt!63718 () Unit!3839)

(declare-fun e!80933 () Unit!3839)

(assert (=> d!37283 (= lt!63718 e!80933)))

(declare-fun c!22522 () Bool)

(assert (=> d!37283 (= c!22522 lt!63717)))

(assert (=> d!37283 (= lt!63717 (containsKey!168 (toList!827 lt!63630) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!37283 (= (contains!856 lt!63630 #b0000000000000000000000000000000000000000000000000000000000000000) lt!63716)))

(declare-fun b!123869 () Bool)

(declare-fun lt!63719 () Unit!3839)

(assert (=> b!123869 (= e!80933 lt!63719)))

(assert (=> b!123869 (= lt!63719 (lemmaContainsKeyImpliesGetValueByKeyDefined!116 (toList!827 lt!63630) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!123869 (isDefined!117 (getValueByKey!165 (toList!827 lt!63630) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!123870 () Bool)

(declare-fun Unit!3853 () Unit!3839)

(assert (=> b!123870 (= e!80933 Unit!3853)))

(declare-fun b!123871 () Bool)

(assert (=> b!123871 (= e!80932 (isDefined!117 (getValueByKey!165 (toList!827 lt!63630) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!37283 c!22522) b!123869))

(assert (= (and d!37283 (not c!22522)) b!123870))

(assert (= (and d!37283 (not res!60085)) b!123871))

(declare-fun m!144079 () Bool)

(assert (=> d!37283 m!144079))

(declare-fun m!144081 () Bool)

(assert (=> b!123869 m!144081))

(declare-fun m!144083 () Bool)

(assert (=> b!123869 m!144083))

(assert (=> b!123869 m!144083))

(declare-fun m!144085 () Bool)

(assert (=> b!123869 m!144085))

(assert (=> b!123871 m!144083))

(assert (=> b!123871 m!144083))

(assert (=> b!123871 m!144085))

(assert (=> d!37175 d!37283))

(assert (=> d!37175 d!37167))

(declare-fun b!123873 () Bool)

(declare-fun e!80934 () Option!171)

(declare-fun e!80935 () Option!171)

(assert (=> b!123873 (= e!80934 e!80935)))

(declare-fun c!22524 () Bool)

(assert (=> b!123873 (= c!22524 (and ((_ is Cons!1666) (toList!827 lt!63582)) (not (= (_1!1265 (h!2267 (toList!827 lt!63582))) (_1!1265 (ite (or c!22432 c!22430) (tuple2!2509 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2619 (v!3091 (underlying!430 thiss!992)))) (tuple2!2509 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 (v!3091 (underlying!430 thiss!992))))))))))))

(declare-fun d!37285 () Bool)

(declare-fun c!22523 () Bool)

(assert (=> d!37285 (= c!22523 (and ((_ is Cons!1666) (toList!827 lt!63582)) (= (_1!1265 (h!2267 (toList!827 lt!63582))) (_1!1265 (ite (or c!22432 c!22430) (tuple2!2509 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2619 (v!3091 (underlying!430 thiss!992)))) (tuple2!2509 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 (v!3091 (underlying!430 thiss!992)))))))))))

(assert (=> d!37285 (= (getValueByKey!165 (toList!827 lt!63582) (_1!1265 (ite (or c!22432 c!22430) (tuple2!2509 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2619 (v!3091 (underlying!430 thiss!992)))) (tuple2!2509 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 (v!3091 (underlying!430 thiss!992))))))) e!80934)))

(declare-fun b!123875 () Bool)

(assert (=> b!123875 (= e!80935 None!169)))

(declare-fun b!123874 () Bool)

(assert (=> b!123874 (= e!80935 (getValueByKey!165 (t!5965 (toList!827 lt!63582)) (_1!1265 (ite (or c!22432 c!22430) (tuple2!2509 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2619 (v!3091 (underlying!430 thiss!992)))) (tuple2!2509 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 (v!3091 (underlying!430 thiss!992))))))))))

(declare-fun b!123872 () Bool)

(assert (=> b!123872 (= e!80934 (Some!170 (_2!1265 (h!2267 (toList!827 lt!63582)))))))

(assert (= (and d!37285 c!22523) b!123872))

(assert (= (and d!37285 (not c!22523)) b!123873))

(assert (= (and b!123873 c!22524) b!123874))

(assert (= (and b!123873 (not c!22524)) b!123875))

(declare-fun m!144087 () Bool)

(assert (=> b!123874 m!144087))

(assert (=> b!123614 d!37285))

(declare-fun bm!13142 () Bool)

(declare-fun call!13145 () Bool)

(assert (=> bm!13142 (= call!13145 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!4481 (v!3091 (underlying!430 thiss!992))) (mask!6992 (v!3091 (underlying!430 thiss!992)))))))

(declare-fun b!123876 () Bool)

(declare-fun e!80938 () Bool)

(declare-fun e!80936 () Bool)

(assert (=> b!123876 (= e!80938 e!80936)))

(declare-fun lt!63721 () (_ BitVec 64))

(assert (=> b!123876 (= lt!63721 (select (arr!2198 (_keys!4481 (v!3091 (underlying!430 thiss!992)))) #b00000000000000000000000000000000))))

(declare-fun lt!63722 () Unit!3839)

(assert (=> b!123876 (= lt!63722 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!4481 (v!3091 (underlying!430 thiss!992))) lt!63721 #b00000000000000000000000000000000))))

(assert (=> b!123876 (arrayContainsKey!0 (_keys!4481 (v!3091 (underlying!430 thiss!992))) lt!63721 #b00000000000000000000000000000000)))

(declare-fun lt!63720 () Unit!3839)

(assert (=> b!123876 (= lt!63720 lt!63722)))

(declare-fun res!60086 () Bool)

(assert (=> b!123876 (= res!60086 (= (seekEntryOrOpen!0 (select (arr!2198 (_keys!4481 (v!3091 (underlying!430 thiss!992)))) #b00000000000000000000000000000000) (_keys!4481 (v!3091 (underlying!430 thiss!992))) (mask!6992 (v!3091 (underlying!430 thiss!992)))) (Found!261 #b00000000000000000000000000000000)))))

(assert (=> b!123876 (=> (not res!60086) (not e!80936))))

(declare-fun b!123878 () Bool)

(assert (=> b!123878 (= e!80938 call!13145)))

(declare-fun b!123879 () Bool)

(assert (=> b!123879 (= e!80936 call!13145)))

(declare-fun d!37287 () Bool)

(declare-fun res!60087 () Bool)

(declare-fun e!80937 () Bool)

(assert (=> d!37287 (=> res!60087 e!80937)))

(assert (=> d!37287 (= res!60087 (bvsge #b00000000000000000000000000000000 (size!2460 (_keys!4481 (v!3091 (underlying!430 thiss!992))))))))

(assert (=> d!37287 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4481 (v!3091 (underlying!430 thiss!992))) (mask!6992 (v!3091 (underlying!430 thiss!992)))) e!80937)))

(declare-fun b!123877 () Bool)

(assert (=> b!123877 (= e!80937 e!80938)))

(declare-fun c!22525 () Bool)

(assert (=> b!123877 (= c!22525 (validKeyInArray!0 (select (arr!2198 (_keys!4481 (v!3091 (underlying!430 thiss!992)))) #b00000000000000000000000000000000)))))

(assert (= (and d!37287 (not res!60087)) b!123877))

(assert (= (and b!123877 c!22525) b!123876))

(assert (= (and b!123877 (not c!22525)) b!123878))

(assert (= (and b!123876 res!60086) b!123879))

(assert (= (or b!123879 b!123878) bm!13142))

(declare-fun m!144089 () Bool)

(assert (=> bm!13142 m!144089))

(declare-fun m!144091 () Bool)

(assert (=> b!123876 m!144091))

(declare-fun m!144093 () Bool)

(assert (=> b!123876 m!144093))

(declare-fun m!144095 () Bool)

(assert (=> b!123876 m!144095))

(assert (=> b!123876 m!144091))

(declare-fun m!144097 () Bool)

(assert (=> b!123876 m!144097))

(assert (=> b!123877 m!144091))

(assert (=> b!123877 m!144091))

(declare-fun m!144099 () Bool)

(assert (=> b!123877 m!144099))

(assert (=> b!123617 d!37287))

(declare-fun d!37289 () Bool)

(assert (=> d!37289 (= (get!1435 (getValueByKey!165 (toList!827 (+!161 lt!63535 (tuple2!2509 lt!63549 (zeroValue!2619 (v!3091 (underlying!430 thiss!992)))))) lt!63542)) (v!3096 (getValueByKey!165 (toList!827 (+!161 lt!63535 (tuple2!2509 lt!63549 (zeroValue!2619 (v!3091 (underlying!430 thiss!992)))))) lt!63542)))))

(assert (=> d!37185 d!37289))

(declare-fun b!123881 () Bool)

(declare-fun e!80939 () Option!171)

(declare-fun e!80940 () Option!171)

(assert (=> b!123881 (= e!80939 e!80940)))

(declare-fun c!22527 () Bool)

(assert (=> b!123881 (= c!22527 (and ((_ is Cons!1666) (toList!827 (+!161 lt!63535 (tuple2!2509 lt!63549 (zeroValue!2619 (v!3091 (underlying!430 thiss!992))))))) (not (= (_1!1265 (h!2267 (toList!827 (+!161 lt!63535 (tuple2!2509 lt!63549 (zeroValue!2619 (v!3091 (underlying!430 thiss!992)))))))) lt!63542))))))

(declare-fun c!22526 () Bool)

(declare-fun d!37291 () Bool)

(assert (=> d!37291 (= c!22526 (and ((_ is Cons!1666) (toList!827 (+!161 lt!63535 (tuple2!2509 lt!63549 (zeroValue!2619 (v!3091 (underlying!430 thiss!992))))))) (= (_1!1265 (h!2267 (toList!827 (+!161 lt!63535 (tuple2!2509 lt!63549 (zeroValue!2619 (v!3091 (underlying!430 thiss!992)))))))) lt!63542)))))

(assert (=> d!37291 (= (getValueByKey!165 (toList!827 (+!161 lt!63535 (tuple2!2509 lt!63549 (zeroValue!2619 (v!3091 (underlying!430 thiss!992)))))) lt!63542) e!80939)))

(declare-fun b!123883 () Bool)

(assert (=> b!123883 (= e!80940 None!169)))

(declare-fun b!123882 () Bool)

(assert (=> b!123882 (= e!80940 (getValueByKey!165 (t!5965 (toList!827 (+!161 lt!63535 (tuple2!2509 lt!63549 (zeroValue!2619 (v!3091 (underlying!430 thiss!992))))))) lt!63542))))

(declare-fun b!123880 () Bool)

(assert (=> b!123880 (= e!80939 (Some!170 (_2!1265 (h!2267 (toList!827 (+!161 lt!63535 (tuple2!2509 lt!63549 (zeroValue!2619 (v!3091 (underlying!430 thiss!992))))))))))))

(assert (= (and d!37291 c!22526) b!123880))

(assert (= (and d!37291 (not c!22526)) b!123881))

(assert (= (and b!123881 c!22527) b!123882))

(assert (= (and b!123881 (not c!22527)) b!123883))

(declare-fun m!144101 () Bool)

(assert (=> b!123882 m!144101))

(assert (=> d!37185 d!37291))

(declare-fun d!37293 () Bool)

(declare-fun e!80941 () Bool)

(assert (=> d!37293 e!80941))

(declare-fun res!60088 () Bool)

(assert (=> d!37293 (=> res!60088 e!80941)))

(declare-fun lt!63723 () Bool)

(assert (=> d!37293 (= res!60088 (not lt!63723))))

(declare-fun lt!63724 () Bool)

(assert (=> d!37293 (= lt!63723 lt!63724)))

(declare-fun lt!63725 () Unit!3839)

(declare-fun e!80942 () Unit!3839)

(assert (=> d!37293 (= lt!63725 e!80942)))

(declare-fun c!22528 () Bool)

(assert (=> d!37293 (= c!22528 lt!63724)))

(assert (=> d!37293 (= lt!63724 (containsKey!168 (toList!827 lt!63630) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!37293 (= (contains!856 lt!63630 #b1000000000000000000000000000000000000000000000000000000000000000) lt!63723)))

(declare-fun b!123884 () Bool)

(declare-fun lt!63726 () Unit!3839)

(assert (=> b!123884 (= e!80942 lt!63726)))

(assert (=> b!123884 (= lt!63726 (lemmaContainsKeyImpliesGetValueByKeyDefined!116 (toList!827 lt!63630) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!123884 (isDefined!117 (getValueByKey!165 (toList!827 lt!63630) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!123885 () Bool)

(declare-fun Unit!3854 () Unit!3839)

(assert (=> b!123885 (= e!80942 Unit!3854)))

(declare-fun b!123886 () Bool)

(assert (=> b!123886 (= e!80941 (isDefined!117 (getValueByKey!165 (toList!827 lt!63630) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!37293 c!22528) b!123884))

(assert (= (and d!37293 (not c!22528)) b!123885))

(assert (= (and d!37293 (not res!60088)) b!123886))

(declare-fun m!144103 () Bool)

(assert (=> d!37293 m!144103))

(declare-fun m!144105 () Bool)

(assert (=> b!123884 m!144105))

(declare-fun m!144107 () Bool)

(assert (=> b!123884 m!144107))

(assert (=> b!123884 m!144107))

(declare-fun m!144109 () Bool)

(assert (=> b!123884 m!144109))

(assert (=> b!123886 m!144107))

(assert (=> b!123886 m!144107))

(assert (=> b!123886 m!144109))

(assert (=> b!123679 d!37293))

(assert (=> b!123610 d!37213))

(declare-fun d!37295 () Bool)

(assert (=> d!37295 (= (get!1435 (getValueByKey!165 (toList!827 lt!63541) #b0000000000000000000000000000000000000000000000000000000000000000)) (v!3096 (getValueByKey!165 (toList!827 lt!63541) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!37209 d!37295))

(assert (=> d!37209 d!37261))

(declare-fun b!123888 () Bool)

(declare-fun e!80943 () Option!171)

(declare-fun e!80944 () Option!171)

(assert (=> b!123888 (= e!80943 e!80944)))

(declare-fun c!22530 () Bool)

(assert (=> b!123888 (= c!22530 (and ((_ is Cons!1666) (toList!827 lt!63633)) (not (= (_1!1265 (h!2267 (toList!827 lt!63633))) (_1!1265 (tuple2!2509 lt!63549 (zeroValue!2619 (v!3091 (underlying!430 thiss!992)))))))))))

(declare-fun c!22529 () Bool)

(declare-fun d!37297 () Bool)

(assert (=> d!37297 (= c!22529 (and ((_ is Cons!1666) (toList!827 lt!63633)) (= (_1!1265 (h!2267 (toList!827 lt!63633))) (_1!1265 (tuple2!2509 lt!63549 (zeroValue!2619 (v!3091 (underlying!430 thiss!992))))))))))

(assert (=> d!37297 (= (getValueByKey!165 (toList!827 lt!63633) (_1!1265 (tuple2!2509 lt!63549 (zeroValue!2619 (v!3091 (underlying!430 thiss!992)))))) e!80943)))

(declare-fun b!123890 () Bool)

(assert (=> b!123890 (= e!80944 None!169)))

(declare-fun b!123889 () Bool)

(assert (=> b!123889 (= e!80944 (getValueByKey!165 (t!5965 (toList!827 lt!63633)) (_1!1265 (tuple2!2509 lt!63549 (zeroValue!2619 (v!3091 (underlying!430 thiss!992)))))))))

(declare-fun b!123887 () Bool)

(assert (=> b!123887 (= e!80943 (Some!170 (_2!1265 (h!2267 (toList!827 lt!63633)))))))

(assert (= (and d!37297 c!22529) b!123887))

(assert (= (and d!37297 (not c!22529)) b!123888))

(assert (= (and b!123888 c!22530) b!123889))

(assert (= (and b!123888 (not c!22530)) b!123890))

(declare-fun m!144111 () Bool)

(assert (=> b!123889 m!144111))

(assert (=> b!123691 d!37297))

(declare-fun d!37299 () Bool)

(declare-fun e!80945 () Bool)

(assert (=> d!37299 e!80945))

(declare-fun res!60089 () Bool)

(assert (=> d!37299 (=> res!60089 e!80945)))

(declare-fun lt!63727 () Bool)

(assert (=> d!37299 (= res!60089 (not lt!63727))))

(declare-fun lt!63728 () Bool)

(assert (=> d!37299 (= lt!63727 lt!63728)))

(declare-fun lt!63729 () Unit!3839)

(declare-fun e!80946 () Unit!3839)

(assert (=> d!37299 (= lt!63729 e!80946)))

(declare-fun c!22531 () Bool)

(assert (=> d!37299 (= c!22531 lt!63728)))

(assert (=> d!37299 (= lt!63728 (containsKey!168 (toList!827 lt!63595) (select (arr!2198 (_keys!4481 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> d!37299 (= (contains!856 lt!63595 (select (arr!2198 (_keys!4481 newMap!16)) #b00000000000000000000000000000000)) lt!63727)))

(declare-fun b!123891 () Bool)

(declare-fun lt!63730 () Unit!3839)

(assert (=> b!123891 (= e!80946 lt!63730)))

(assert (=> b!123891 (= lt!63730 (lemmaContainsKeyImpliesGetValueByKeyDefined!116 (toList!827 lt!63595) (select (arr!2198 (_keys!4481 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!123891 (isDefined!117 (getValueByKey!165 (toList!827 lt!63595) (select (arr!2198 (_keys!4481 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!123892 () Bool)

(declare-fun Unit!3855 () Unit!3839)

(assert (=> b!123892 (= e!80946 Unit!3855)))

(declare-fun b!123893 () Bool)

(assert (=> b!123893 (= e!80945 (isDefined!117 (getValueByKey!165 (toList!827 lt!63595) (select (arr!2198 (_keys!4481 newMap!16)) #b00000000000000000000000000000000))))))

(assert (= (and d!37299 c!22531) b!123891))

(assert (= (and d!37299 (not c!22531)) b!123892))

(assert (= (and d!37299 (not res!60089)) b!123893))

(assert (=> d!37299 m!143701))

(declare-fun m!144113 () Bool)

(assert (=> d!37299 m!144113))

(assert (=> b!123891 m!143701))

(declare-fun m!144115 () Bool)

(assert (=> b!123891 m!144115))

(assert (=> b!123891 m!143701))

(declare-fun m!144117 () Bool)

(assert (=> b!123891 m!144117))

(assert (=> b!123891 m!144117))

(declare-fun m!144119 () Bool)

(assert (=> b!123891 m!144119))

(assert (=> b!123893 m!143701))

(assert (=> b!123893 m!144117))

(assert (=> b!123893 m!144117))

(assert (=> b!123893 m!144119))

(assert (=> b!123628 d!37299))

(declare-fun d!37301 () Bool)

(declare-fun e!80947 () Bool)

(assert (=> d!37301 e!80947))

(declare-fun res!60090 () Bool)

(assert (=> d!37301 (=> res!60090 e!80947)))

(declare-fun lt!63731 () Bool)

(assert (=> d!37301 (= res!60090 (not lt!63731))))

(declare-fun lt!63732 () Bool)

(assert (=> d!37301 (= lt!63731 lt!63732)))

(declare-fun lt!63733 () Unit!3839)

(declare-fun e!80948 () Unit!3839)

(assert (=> d!37301 (= lt!63733 e!80948)))

(declare-fun c!22532 () Bool)

(assert (=> d!37301 (= c!22532 lt!63732)))

(assert (=> d!37301 (= lt!63732 (containsKey!168 (toList!827 lt!63630) (select (arr!2198 (_keys!4481 (v!3091 (underlying!430 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> d!37301 (= (contains!856 lt!63630 (select (arr!2198 (_keys!4481 (v!3091 (underlying!430 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) lt!63731)))

(declare-fun b!123894 () Bool)

(declare-fun lt!63734 () Unit!3839)

(assert (=> b!123894 (= e!80948 lt!63734)))

(assert (=> b!123894 (= lt!63734 (lemmaContainsKeyImpliesGetValueByKeyDefined!116 (toList!827 lt!63630) (select (arr!2198 (_keys!4481 (v!3091 (underlying!430 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!123894 (isDefined!117 (getValueByKey!165 (toList!827 lt!63630) (select (arr!2198 (_keys!4481 (v!3091 (underlying!430 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!123895 () Bool)

(declare-fun Unit!3856 () Unit!3839)

(assert (=> b!123895 (= e!80948 Unit!3856)))

(declare-fun b!123896 () Bool)

(assert (=> b!123896 (= e!80947 (isDefined!117 (getValueByKey!165 (toList!827 lt!63630) (select (arr!2198 (_keys!4481 (v!3091 (underlying!430 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(assert (= (and d!37301 c!22532) b!123894))

(assert (= (and d!37301 (not c!22532)) b!123895))

(assert (= (and d!37301 (not res!60090)) b!123896))

(assert (=> d!37301 m!143609))

(declare-fun m!144121 () Bool)

(assert (=> d!37301 m!144121))

(assert (=> b!123894 m!143609))

(declare-fun m!144123 () Bool)

(assert (=> b!123894 m!144123))

(assert (=> b!123894 m!143609))

(assert (=> b!123894 m!143975))

(assert (=> b!123894 m!143975))

(declare-fun m!144125 () Bool)

(assert (=> b!123894 m!144125))

(assert (=> b!123896 m!143609))

(assert (=> b!123896 m!143975))

(assert (=> b!123896 m!143975))

(assert (=> b!123896 m!144125))

(assert (=> b!123683 d!37301))

(declare-fun d!37303 () Bool)

(assert (=> d!37303 (isDefined!117 (getValueByKey!165 (toList!827 lt!63541) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!63735 () Unit!3839)

(assert (=> d!37303 (= lt!63735 (choose!752 (toList!827 lt!63541) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!80949 () Bool)

(assert (=> d!37303 e!80949))

(declare-fun res!60091 () Bool)

(assert (=> d!37303 (=> (not res!60091) (not e!80949))))

(assert (=> d!37303 (= res!60091 (isStrictlySorted!302 (toList!827 lt!63541)))))

(assert (=> d!37303 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!116 (toList!827 lt!63541) #b1000000000000000000000000000000000000000000000000000000000000000) lt!63735)))

(declare-fun b!123897 () Bool)

(assert (=> b!123897 (= e!80949 (containsKey!168 (toList!827 lt!63541) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!37303 res!60091) b!123897))

(assert (=> d!37303 m!143697))

(assert (=> d!37303 m!143697))

(assert (=> d!37303 m!143699))

(declare-fun m!144127 () Bool)

(assert (=> d!37303 m!144127))

(assert (=> d!37303 m!144035))

(assert (=> b!123897 m!143693))

(assert (=> b!123596 d!37303))

(declare-fun d!37305 () Bool)

(assert (=> d!37305 (= (isDefined!117 (getValueByKey!165 (toList!827 lt!63541) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (isEmpty!397 (getValueByKey!165 (toList!827 lt!63541) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bs!5143 () Bool)

(assert (= bs!5143 d!37305))

(assert (=> bs!5143 m!143697))

(declare-fun m!144129 () Bool)

(assert (=> bs!5143 m!144129))

(assert (=> b!123596 d!37305))

(declare-fun b!123899 () Bool)

(declare-fun e!80950 () Option!171)

(declare-fun e!80951 () Option!171)

(assert (=> b!123899 (= e!80950 e!80951)))

(declare-fun c!22534 () Bool)

(assert (=> b!123899 (= c!22534 (and ((_ is Cons!1666) (toList!827 lt!63541)) (not (= (_1!1265 (h!2267 (toList!827 lt!63541))) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!37307 () Bool)

(declare-fun c!22533 () Bool)

(assert (=> d!37307 (= c!22533 (and ((_ is Cons!1666) (toList!827 lt!63541)) (= (_1!1265 (h!2267 (toList!827 lt!63541))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!37307 (= (getValueByKey!165 (toList!827 lt!63541) #b1000000000000000000000000000000000000000000000000000000000000000) e!80950)))

(declare-fun b!123901 () Bool)

(assert (=> b!123901 (= e!80951 None!169)))

(declare-fun b!123900 () Bool)

(assert (=> b!123900 (= e!80951 (getValueByKey!165 (t!5965 (toList!827 lt!63541)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!123898 () Bool)

(assert (=> b!123898 (= e!80950 (Some!170 (_2!1265 (h!2267 (toList!827 lt!63541)))))))

(assert (= (and d!37307 c!22533) b!123898))

(assert (= (and d!37307 (not c!22533)) b!123899))

(assert (= (and b!123899 c!22534) b!123900))

(assert (= (and b!123899 (not c!22534)) b!123901))

(declare-fun m!144131 () Bool)

(assert (=> b!123900 m!144131))

(assert (=> b!123596 d!37307))

(declare-fun d!37309 () Bool)

(assert (=> d!37309 (= (apply!108 lt!63595 (select (arr!2198 (_keys!4481 newMap!16)) #b00000000000000000000000000000000)) (get!1435 (getValueByKey!165 (toList!827 lt!63595) (select (arr!2198 (_keys!4481 newMap!16)) #b00000000000000000000000000000000))))))

(declare-fun bs!5144 () Bool)

(assert (= bs!5144 d!37309))

(assert (=> bs!5144 m!143701))

(assert (=> bs!5144 m!144117))

(assert (=> bs!5144 m!144117))

(declare-fun m!144133 () Bool)

(assert (=> bs!5144 m!144133))

(assert (=> b!123620 d!37309))

(declare-fun d!37311 () Bool)

(declare-fun c!22535 () Bool)

(assert (=> d!37311 (= c!22535 ((_ is ValueCellFull!1067) (select (arr!2199 (_values!2737 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun e!80952 () V!3409)

(assert (=> d!37311 (= (get!1434 (select (arr!2199 (_values!2737 newMap!16)) #b00000000000000000000000000000000) (dynLambda!412 (defaultEntry!2754 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000)) e!80952)))

(declare-fun b!123902 () Bool)

(assert (=> b!123902 (= e!80952 (get!1436 (select (arr!2199 (_values!2737 newMap!16)) #b00000000000000000000000000000000) (dynLambda!412 (defaultEntry!2754 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!123903 () Bool)

(assert (=> b!123903 (= e!80952 (get!1437 (select (arr!2199 (_values!2737 newMap!16)) #b00000000000000000000000000000000) (dynLambda!412 (defaultEntry!2754 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!37311 c!22535) b!123902))

(assert (= (and d!37311 (not c!22535)) b!123903))

(assert (=> b!123902 m!143741))

(assert (=> b!123902 m!143743))

(declare-fun m!144135 () Bool)

(assert (=> b!123902 m!144135))

(assert (=> b!123903 m!143741))

(assert (=> b!123903 m!143743))

(declare-fun m!144137 () Bool)

(assert (=> b!123903 m!144137))

(assert (=> b!123620 d!37311))

(declare-fun d!37313 () Bool)

(assert (=> d!37313 (= (get!1435 (getValueByKey!165 (toList!827 lt!63541) (select (arr!2198 (_keys!4481 (v!3091 (underlying!430 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))) (v!3096 (getValueByKey!165 (toList!827 lt!63541) (select (arr!2198 (_keys!4481 (v!3091 (underlying!430 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(assert (=> d!37153 d!37313))

(declare-fun b!123905 () Bool)

(declare-fun e!80953 () Option!171)

(declare-fun e!80954 () Option!171)

(assert (=> b!123905 (= e!80953 e!80954)))

(declare-fun c!22537 () Bool)

(assert (=> b!123905 (= c!22537 (and ((_ is Cons!1666) (toList!827 lt!63541)) (not (= (_1!1265 (h!2267 (toList!827 lt!63541))) (select (arr!2198 (_keys!4481 (v!3091 (underlying!430 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))))

(declare-fun c!22536 () Bool)

(declare-fun d!37315 () Bool)

(assert (=> d!37315 (= c!22536 (and ((_ is Cons!1666) (toList!827 lt!63541)) (= (_1!1265 (h!2267 (toList!827 lt!63541))) (select (arr!2198 (_keys!4481 (v!3091 (underlying!430 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(assert (=> d!37315 (= (getValueByKey!165 (toList!827 lt!63541) (select (arr!2198 (_keys!4481 (v!3091 (underlying!430 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) e!80953)))

(declare-fun b!123907 () Bool)

(assert (=> b!123907 (= e!80954 None!169)))

(declare-fun b!123906 () Bool)

(assert (=> b!123906 (= e!80954 (getValueByKey!165 (t!5965 (toList!827 lt!63541)) (select (arr!2198 (_keys!4481 (v!3091 (underlying!430 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!123904 () Bool)

(assert (=> b!123904 (= e!80953 (Some!170 (_2!1265 (h!2267 (toList!827 lt!63541)))))))

(assert (= (and d!37315 c!22536) b!123904))

(assert (= (and d!37315 (not c!22536)) b!123905))

(assert (= (and b!123905 c!22537) b!123906))

(assert (= (and b!123905 (not c!22537)) b!123907))

(assert (=> b!123906 m!143609))

(declare-fun m!144139 () Bool)

(assert (=> b!123906 m!144139))

(assert (=> d!37153 d!37315))

(assert (=> b!123685 d!37155))

(declare-fun d!37317 () Bool)

(declare-fun e!80955 () Bool)

(assert (=> d!37317 e!80955))

(declare-fun res!60093 () Bool)

(assert (=> d!37317 (=> (not res!60093) (not e!80955))))

(declare-fun lt!63737 () ListLongMap!1623)

(assert (=> d!37317 (= res!60093 (contains!856 lt!63737 (_1!1265 (tuple2!2509 lt!63629 lt!63627))))))

(declare-fun lt!63739 () List!1670)

(assert (=> d!37317 (= lt!63737 (ListLongMap!1624 lt!63739))))

(declare-fun lt!63738 () Unit!3839)

(declare-fun lt!63736 () Unit!3839)

(assert (=> d!37317 (= lt!63738 lt!63736)))

(assert (=> d!37317 (= (getValueByKey!165 lt!63739 (_1!1265 (tuple2!2509 lt!63629 lt!63627))) (Some!170 (_2!1265 (tuple2!2509 lt!63629 lt!63627))))))

(assert (=> d!37317 (= lt!63736 (lemmaContainsTupThenGetReturnValue!81 lt!63739 (_1!1265 (tuple2!2509 lt!63629 lt!63627)) (_2!1265 (tuple2!2509 lt!63629 lt!63627))))))

(assert (=> d!37317 (= lt!63739 (insertStrictlySorted!84 (toList!827 lt!63631) (_1!1265 (tuple2!2509 lt!63629 lt!63627)) (_2!1265 (tuple2!2509 lt!63629 lt!63627))))))

(assert (=> d!37317 (= (+!161 lt!63631 (tuple2!2509 lt!63629 lt!63627)) lt!63737)))

(declare-fun b!123908 () Bool)

(declare-fun res!60092 () Bool)

(assert (=> b!123908 (=> (not res!60092) (not e!80955))))

(assert (=> b!123908 (= res!60092 (= (getValueByKey!165 (toList!827 lt!63737) (_1!1265 (tuple2!2509 lt!63629 lt!63627))) (Some!170 (_2!1265 (tuple2!2509 lt!63629 lt!63627)))))))

(declare-fun b!123909 () Bool)

(assert (=> b!123909 (= e!80955 (contains!857 (toList!827 lt!63737) (tuple2!2509 lt!63629 lt!63627)))))

(assert (= (and d!37317 res!60093) b!123908))

(assert (= (and b!123908 res!60092) b!123909))

(declare-fun m!144141 () Bool)

(assert (=> d!37317 m!144141))

(declare-fun m!144143 () Bool)

(assert (=> d!37317 m!144143))

(declare-fun m!144145 () Bool)

(assert (=> d!37317 m!144145))

(declare-fun m!144147 () Bool)

(assert (=> d!37317 m!144147))

(declare-fun m!144149 () Bool)

(assert (=> b!123908 m!144149))

(declare-fun m!144151 () Bool)

(assert (=> b!123909 m!144151))

(assert (=> b!123685 d!37317))

(declare-fun d!37319 () Bool)

(declare-fun e!80956 () Bool)

(assert (=> d!37319 e!80956))

(declare-fun res!60094 () Bool)

(assert (=> d!37319 (=> res!60094 e!80956)))

(declare-fun lt!63740 () Bool)

(assert (=> d!37319 (= res!60094 (not lt!63740))))

(declare-fun lt!63741 () Bool)

(assert (=> d!37319 (= lt!63740 lt!63741)))

(declare-fun lt!63742 () Unit!3839)

(declare-fun e!80957 () Unit!3839)

(assert (=> d!37319 (= lt!63742 e!80957)))

(declare-fun c!22538 () Bool)

(assert (=> d!37319 (= c!22538 lt!63741)))

(assert (=> d!37319 (= lt!63741 (containsKey!168 (toList!827 (+!161 lt!63631 (tuple2!2509 lt!63629 lt!63627))) lt!63626))))

(assert (=> d!37319 (= (contains!856 (+!161 lt!63631 (tuple2!2509 lt!63629 lt!63627)) lt!63626) lt!63740)))

(declare-fun b!123910 () Bool)

(declare-fun lt!63743 () Unit!3839)

(assert (=> b!123910 (= e!80957 lt!63743)))

(assert (=> b!123910 (= lt!63743 (lemmaContainsKeyImpliesGetValueByKeyDefined!116 (toList!827 (+!161 lt!63631 (tuple2!2509 lt!63629 lt!63627))) lt!63626))))

(assert (=> b!123910 (isDefined!117 (getValueByKey!165 (toList!827 (+!161 lt!63631 (tuple2!2509 lt!63629 lt!63627))) lt!63626))))

(declare-fun b!123911 () Bool)

(declare-fun Unit!3857 () Unit!3839)

(assert (=> b!123911 (= e!80957 Unit!3857)))

(declare-fun b!123912 () Bool)

(assert (=> b!123912 (= e!80956 (isDefined!117 (getValueByKey!165 (toList!827 (+!161 lt!63631 (tuple2!2509 lt!63629 lt!63627))) lt!63626)))))

(assert (= (and d!37319 c!22538) b!123910))

(assert (= (and d!37319 (not c!22538)) b!123911))

(assert (= (and d!37319 (not res!60094)) b!123912))

(declare-fun m!144153 () Bool)

(assert (=> d!37319 m!144153))

(declare-fun m!144155 () Bool)

(assert (=> b!123910 m!144155))

(declare-fun m!144157 () Bool)

(assert (=> b!123910 m!144157))

(assert (=> b!123910 m!144157))

(declare-fun m!144159 () Bool)

(assert (=> b!123910 m!144159))

(assert (=> b!123912 m!144157))

(assert (=> b!123912 m!144157))

(assert (=> b!123912 m!144159))

(assert (=> b!123685 d!37319))

(declare-fun d!37321 () Bool)

(assert (=> d!37321 (not (contains!856 (+!161 lt!63631 (tuple2!2509 lt!63629 lt!63627)) lt!63626))))

(declare-fun lt!63746 () Unit!3839)

(declare-fun choose!753 (ListLongMap!1623 (_ BitVec 64) V!3409 (_ BitVec 64)) Unit!3839)

(assert (=> d!37321 (= lt!63746 (choose!753 lt!63631 lt!63629 lt!63627 lt!63626))))

(declare-fun e!80960 () Bool)

(assert (=> d!37321 e!80960))

(declare-fun res!60097 () Bool)

(assert (=> d!37321 (=> (not res!60097) (not e!80960))))

(assert (=> d!37321 (= res!60097 (not (contains!856 lt!63631 lt!63626)))))

(assert (=> d!37321 (= (addStillNotContains!56 lt!63631 lt!63629 lt!63627 lt!63626) lt!63746)))

(declare-fun b!123916 () Bool)

(assert (=> b!123916 (= e!80960 (not (= lt!63629 lt!63626)))))

(assert (= (and d!37321 res!60097) b!123916))

(assert (=> d!37321 m!143803))

(assert (=> d!37321 m!143803))

(assert (=> d!37321 m!143805))

(declare-fun m!144161 () Bool)

(assert (=> d!37321 m!144161))

(declare-fun m!144163 () Bool)

(assert (=> d!37321 m!144163))

(assert (=> b!123685 d!37321))

(declare-fun d!37323 () Bool)

(declare-fun e!80961 () Bool)

(assert (=> d!37323 e!80961))

(declare-fun res!60099 () Bool)

(assert (=> d!37323 (=> (not res!60099) (not e!80961))))

(declare-fun lt!63748 () ListLongMap!1623)

(assert (=> d!37323 (= res!60099 (contains!856 lt!63748 (_1!1265 (tuple2!2509 (select (arr!2198 (_keys!4481 (v!3091 (underlying!430 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1434 (select (arr!2199 (_values!2737 (v!3091 (underlying!430 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!412 (defaultEntry!2754 (v!3091 (underlying!430 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!63750 () List!1670)

(assert (=> d!37323 (= lt!63748 (ListLongMap!1624 lt!63750))))

(declare-fun lt!63749 () Unit!3839)

(declare-fun lt!63747 () Unit!3839)

(assert (=> d!37323 (= lt!63749 lt!63747)))

(assert (=> d!37323 (= (getValueByKey!165 lt!63750 (_1!1265 (tuple2!2509 (select (arr!2198 (_keys!4481 (v!3091 (underlying!430 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1434 (select (arr!2199 (_values!2737 (v!3091 (underlying!430 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!412 (defaultEntry!2754 (v!3091 (underlying!430 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!170 (_2!1265 (tuple2!2509 (select (arr!2198 (_keys!4481 (v!3091 (underlying!430 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1434 (select (arr!2199 (_values!2737 (v!3091 (underlying!430 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!412 (defaultEntry!2754 (v!3091 (underlying!430 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!37323 (= lt!63747 (lemmaContainsTupThenGetReturnValue!81 lt!63750 (_1!1265 (tuple2!2509 (select (arr!2198 (_keys!4481 (v!3091 (underlying!430 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1434 (select (arr!2199 (_values!2737 (v!3091 (underlying!430 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!412 (defaultEntry!2754 (v!3091 (underlying!430 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1265 (tuple2!2509 (select (arr!2198 (_keys!4481 (v!3091 (underlying!430 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1434 (select (arr!2199 (_values!2737 (v!3091 (underlying!430 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!412 (defaultEntry!2754 (v!3091 (underlying!430 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!37323 (= lt!63750 (insertStrictlySorted!84 (toList!827 call!13122) (_1!1265 (tuple2!2509 (select (arr!2198 (_keys!4481 (v!3091 (underlying!430 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1434 (select (arr!2199 (_values!2737 (v!3091 (underlying!430 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!412 (defaultEntry!2754 (v!3091 (underlying!430 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1265 (tuple2!2509 (select (arr!2198 (_keys!4481 (v!3091 (underlying!430 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1434 (select (arr!2199 (_values!2737 (v!3091 (underlying!430 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!412 (defaultEntry!2754 (v!3091 (underlying!430 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!37323 (= (+!161 call!13122 (tuple2!2509 (select (arr!2198 (_keys!4481 (v!3091 (underlying!430 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1434 (select (arr!2199 (_values!2737 (v!3091 (underlying!430 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!412 (defaultEntry!2754 (v!3091 (underlying!430 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!63748)))

(declare-fun b!123917 () Bool)

(declare-fun res!60098 () Bool)

(assert (=> b!123917 (=> (not res!60098) (not e!80961))))

(assert (=> b!123917 (= res!60098 (= (getValueByKey!165 (toList!827 lt!63748) (_1!1265 (tuple2!2509 (select (arr!2198 (_keys!4481 (v!3091 (underlying!430 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1434 (select (arr!2199 (_values!2737 (v!3091 (underlying!430 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!412 (defaultEntry!2754 (v!3091 (underlying!430 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!170 (_2!1265 (tuple2!2509 (select (arr!2198 (_keys!4481 (v!3091 (underlying!430 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1434 (select (arr!2199 (_values!2737 (v!3091 (underlying!430 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!412 (defaultEntry!2754 (v!3091 (underlying!430 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!123918 () Bool)

(assert (=> b!123918 (= e!80961 (contains!857 (toList!827 lt!63748) (tuple2!2509 (select (arr!2198 (_keys!4481 (v!3091 (underlying!430 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1434 (select (arr!2199 (_values!2737 (v!3091 (underlying!430 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!412 (defaultEntry!2754 (v!3091 (underlying!430 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!37323 res!60099) b!123917))

(assert (= (and b!123917 res!60098) b!123918))

(declare-fun m!144165 () Bool)

(assert (=> d!37323 m!144165))

(declare-fun m!144167 () Bool)

(assert (=> d!37323 m!144167))

(declare-fun m!144169 () Bool)

(assert (=> d!37323 m!144169))

(declare-fun m!144171 () Bool)

(assert (=> d!37323 m!144171))

(declare-fun m!144173 () Bool)

(assert (=> b!123917 m!144173))

(declare-fun m!144175 () Bool)

(assert (=> b!123918 m!144175))

(assert (=> b!123685 d!37323))

(declare-fun d!37325 () Bool)

(assert (=> d!37325 (isDefined!117 (getValueByKey!165 (toList!827 lt!63541) (select (arr!2198 (_keys!4481 (v!3091 (underlying!430 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun lt!63751 () Unit!3839)

(assert (=> d!37325 (= lt!63751 (choose!752 (toList!827 lt!63541) (select (arr!2198 (_keys!4481 (v!3091 (underlying!430 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun e!80962 () Bool)

(assert (=> d!37325 e!80962))

(declare-fun res!60100 () Bool)

(assert (=> d!37325 (=> (not res!60100) (not e!80962))))

(assert (=> d!37325 (= res!60100 (isStrictlySorted!302 (toList!827 lt!63541)))))

(assert (=> d!37325 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!116 (toList!827 lt!63541) (select (arr!2198 (_keys!4481 (v!3091 (underlying!430 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) lt!63751)))

(declare-fun b!123919 () Bool)

(assert (=> b!123919 (= e!80962 (containsKey!168 (toList!827 lt!63541) (select (arr!2198 (_keys!4481 (v!3091 (underlying!430 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (= (and d!37325 res!60100) b!123919))

(assert (=> d!37325 m!143609))

(assert (=> d!37325 m!143685))

(assert (=> d!37325 m!143685))

(assert (=> d!37325 m!143791))

(assert (=> d!37325 m!143609))

(declare-fun m!144177 () Bool)

(assert (=> d!37325 m!144177))

(assert (=> d!37325 m!144035))

(assert (=> b!123919 m!143609))

(assert (=> b!123919 m!143787))

(assert (=> b!123652 d!37325))

(declare-fun d!37327 () Bool)

(assert (=> d!37327 (= (isDefined!117 (getValueByKey!165 (toList!827 lt!63541) (select (arr!2198 (_keys!4481 (v!3091 (underlying!430 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))) (not (isEmpty!397 (getValueByKey!165 (toList!827 lt!63541) (select (arr!2198 (_keys!4481 (v!3091 (underlying!430 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))))

(declare-fun bs!5145 () Bool)

(assert (= bs!5145 d!37327))

(assert (=> bs!5145 m!143685))

(declare-fun m!144179 () Bool)

(assert (=> bs!5145 m!144179))

(assert (=> b!123652 d!37327))

(assert (=> b!123652 d!37315))

(declare-fun d!37329 () Bool)

(declare-fun lt!63754 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!122 (List!1671) (InoxSet (_ BitVec 64)))

(assert (=> d!37329 (= lt!63754 (select (content!122 Nil!1668) (select (arr!2198 (_keys!4481 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun e!80967 () Bool)

(assert (=> d!37329 (= lt!63754 e!80967)))

(declare-fun res!60105 () Bool)

(assert (=> d!37329 (=> (not res!60105) (not e!80967))))

(assert (=> d!37329 (= res!60105 ((_ is Cons!1667) Nil!1668))))

(assert (=> d!37329 (= (contains!858 Nil!1668 (select (arr!2198 (_keys!4481 newMap!16)) #b00000000000000000000000000000000)) lt!63754)))

(declare-fun b!123924 () Bool)

(declare-fun e!80968 () Bool)

(assert (=> b!123924 (= e!80967 e!80968)))

(declare-fun res!60106 () Bool)

(assert (=> b!123924 (=> res!60106 e!80968)))

(assert (=> b!123924 (= res!60106 (= (h!2268 Nil!1668) (select (arr!2198 (_keys!4481 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!123925 () Bool)

(assert (=> b!123925 (= e!80968 (contains!858 (t!5970 Nil!1668) (select (arr!2198 (_keys!4481 newMap!16)) #b00000000000000000000000000000000)))))

(assert (= (and d!37329 res!60105) b!123924))

(assert (= (and b!123924 (not res!60106)) b!123925))

(declare-fun m!144181 () Bool)

(assert (=> d!37329 m!144181))

(assert (=> d!37329 m!143701))

(declare-fun m!144183 () Bool)

(assert (=> d!37329 m!144183))

(assert (=> b!123925 m!143701))

(declare-fun m!144185 () Bool)

(assert (=> b!123925 m!144185))

(assert (=> b!123612 d!37329))

(declare-fun b!123927 () Bool)

(declare-fun e!80969 () Option!171)

(declare-fun e!80970 () Option!171)

(assert (=> b!123927 (= e!80969 e!80970)))

(declare-fun c!22540 () Bool)

(assert (=> b!123927 (= c!22540 (and ((_ is Cons!1666) (toList!827 lt!63562)) (not (= (_1!1265 (h!2267 (toList!827 lt!63562))) (_1!1265 (tuple2!2509 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 (v!3091 (underlying!430 thiss!992)))))))))))

(declare-fun d!37331 () Bool)

(declare-fun c!22539 () Bool)

(assert (=> d!37331 (= c!22539 (and ((_ is Cons!1666) (toList!827 lt!63562)) (= (_1!1265 (h!2267 (toList!827 lt!63562))) (_1!1265 (tuple2!2509 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 (v!3091 (underlying!430 thiss!992))))))))))

(assert (=> d!37331 (= (getValueByKey!165 (toList!827 lt!63562) (_1!1265 (tuple2!2509 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 (v!3091 (underlying!430 thiss!992)))))) e!80969)))

(declare-fun b!123929 () Bool)

(assert (=> b!123929 (= e!80970 None!169)))

(declare-fun b!123928 () Bool)

(assert (=> b!123928 (= e!80970 (getValueByKey!165 (t!5965 (toList!827 lt!63562)) (_1!1265 (tuple2!2509 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 (v!3091 (underlying!430 thiss!992)))))))))

(declare-fun b!123926 () Bool)

(assert (=> b!123926 (= e!80969 (Some!170 (_2!1265 (h!2267 (toList!827 lt!63562)))))))

(assert (= (and d!37331 c!22539) b!123926))

(assert (= (and d!37331 (not c!22539)) b!123927))

(assert (= (and b!123927 c!22540) b!123928))

(assert (= (and b!123927 (not c!22540)) b!123929))

(declare-fun m!144187 () Bool)

(assert (=> b!123928 m!144187))

(assert (=> b!123579 d!37331))

(declare-fun lt!63757 () Bool)

(declare-fun d!37333 () Bool)

(declare-fun content!123 (List!1670) (InoxSet tuple2!2508))

(assert (=> d!37333 (= lt!63757 (select (content!123 (toList!827 lt!63644)) (tuple2!2509 lt!63538 (minValue!2619 (v!3091 (underlying!430 thiss!992))))))))

(declare-fun e!80975 () Bool)

(assert (=> d!37333 (= lt!63757 e!80975)))

(declare-fun res!60112 () Bool)

(assert (=> d!37333 (=> (not res!60112) (not e!80975))))

(assert (=> d!37333 (= res!60112 ((_ is Cons!1666) (toList!827 lt!63644)))))

(assert (=> d!37333 (= (contains!857 (toList!827 lt!63644) (tuple2!2509 lt!63538 (minValue!2619 (v!3091 (underlying!430 thiss!992))))) lt!63757)))

(declare-fun b!123934 () Bool)

(declare-fun e!80976 () Bool)

(assert (=> b!123934 (= e!80975 e!80976)))

(declare-fun res!60111 () Bool)

(assert (=> b!123934 (=> res!60111 e!80976)))

(assert (=> b!123934 (= res!60111 (= (h!2267 (toList!827 lt!63644)) (tuple2!2509 lt!63538 (minValue!2619 (v!3091 (underlying!430 thiss!992))))))))

(declare-fun b!123935 () Bool)

(assert (=> b!123935 (= e!80976 (contains!857 (t!5965 (toList!827 lt!63644)) (tuple2!2509 lt!63538 (minValue!2619 (v!3091 (underlying!430 thiss!992))))))))

(assert (= (and d!37333 res!60112) b!123934))

(assert (= (and b!123934 (not res!60111)) b!123935))

(declare-fun m!144189 () Bool)

(assert (=> d!37333 m!144189))

(declare-fun m!144191 () Bool)

(assert (=> d!37333 m!144191))

(declare-fun m!144193 () Bool)

(assert (=> b!123935 m!144193))

(assert (=> b!123700 d!37333))

(declare-fun d!37335 () Bool)

(assert (=> d!37335 (= (get!1435 (getValueByKey!165 (toList!827 lt!63535) lt!63542)) (v!3096 (getValueByKey!165 (toList!827 lt!63535) lt!63542)))))

(assert (=> d!37195 d!37335))

(declare-fun b!123937 () Bool)

(declare-fun e!80977 () Option!171)

(declare-fun e!80978 () Option!171)

(assert (=> b!123937 (= e!80977 e!80978)))

(declare-fun c!22542 () Bool)

(assert (=> b!123937 (= c!22542 (and ((_ is Cons!1666) (toList!827 lt!63535)) (not (= (_1!1265 (h!2267 (toList!827 lt!63535))) lt!63542))))))

(declare-fun d!37337 () Bool)

(declare-fun c!22541 () Bool)

(assert (=> d!37337 (= c!22541 (and ((_ is Cons!1666) (toList!827 lt!63535)) (= (_1!1265 (h!2267 (toList!827 lt!63535))) lt!63542)))))

(assert (=> d!37337 (= (getValueByKey!165 (toList!827 lt!63535) lt!63542) e!80977)))

(declare-fun b!123939 () Bool)

(assert (=> b!123939 (= e!80978 None!169)))

(declare-fun b!123938 () Bool)

(assert (=> b!123938 (= e!80978 (getValueByKey!165 (t!5965 (toList!827 lt!63535)) lt!63542))))

(declare-fun b!123936 () Bool)

(assert (=> b!123936 (= e!80977 (Some!170 (_2!1265 (h!2267 (toList!827 lt!63535)))))))

(assert (= (and d!37337 c!22541) b!123936))

(assert (= (and d!37337 (not c!22541)) b!123937))

(assert (= (and b!123937 c!22542) b!123938))

(assert (= (and b!123937 (not c!22542)) b!123939))

(declare-fun m!144195 () Bool)

(assert (=> b!123938 m!144195))

(assert (=> d!37195 d!37337))

(declare-fun d!37339 () Bool)

(assert (=> d!37339 (= (get!1435 (getValueByKey!165 (toList!827 (+!161 lt!63534 (tuple2!2509 lt!63538 (minValue!2619 (v!3091 (underlying!430 thiss!992)))))) lt!63546)) (v!3096 (getValueByKey!165 (toList!827 (+!161 lt!63534 (tuple2!2509 lt!63538 (minValue!2619 (v!3091 (underlying!430 thiss!992)))))) lt!63546)))))

(assert (=> d!37177 d!37339))

(declare-fun b!123941 () Bool)

(declare-fun e!80979 () Option!171)

(declare-fun e!80980 () Option!171)

(assert (=> b!123941 (= e!80979 e!80980)))

(declare-fun c!22544 () Bool)

(assert (=> b!123941 (= c!22544 (and ((_ is Cons!1666) (toList!827 (+!161 lt!63534 (tuple2!2509 lt!63538 (minValue!2619 (v!3091 (underlying!430 thiss!992))))))) (not (= (_1!1265 (h!2267 (toList!827 (+!161 lt!63534 (tuple2!2509 lt!63538 (minValue!2619 (v!3091 (underlying!430 thiss!992)))))))) lt!63546))))))

(declare-fun c!22543 () Bool)

(declare-fun d!37341 () Bool)

(assert (=> d!37341 (= c!22543 (and ((_ is Cons!1666) (toList!827 (+!161 lt!63534 (tuple2!2509 lt!63538 (minValue!2619 (v!3091 (underlying!430 thiss!992))))))) (= (_1!1265 (h!2267 (toList!827 (+!161 lt!63534 (tuple2!2509 lt!63538 (minValue!2619 (v!3091 (underlying!430 thiss!992)))))))) lt!63546)))))

(assert (=> d!37341 (= (getValueByKey!165 (toList!827 (+!161 lt!63534 (tuple2!2509 lt!63538 (minValue!2619 (v!3091 (underlying!430 thiss!992)))))) lt!63546) e!80979)))

(declare-fun b!123943 () Bool)

(assert (=> b!123943 (= e!80980 None!169)))

(declare-fun b!123942 () Bool)

(assert (=> b!123942 (= e!80980 (getValueByKey!165 (t!5965 (toList!827 (+!161 lt!63534 (tuple2!2509 lt!63538 (minValue!2619 (v!3091 (underlying!430 thiss!992))))))) lt!63546))))

(declare-fun b!123940 () Bool)

(assert (=> b!123940 (= e!80979 (Some!170 (_2!1265 (h!2267 (toList!827 (+!161 lt!63534 (tuple2!2509 lt!63538 (minValue!2619 (v!3091 (underlying!430 thiss!992))))))))))))

(assert (= (and d!37341 c!22543) b!123940))

(assert (= (and d!37341 (not c!22543)) b!123941))

(assert (= (and b!123941 c!22544) b!123942))

(assert (= (and b!123941 (not c!22544)) b!123943))

(declare-fun m!144197 () Bool)

(assert (=> b!123942 m!144197))

(assert (=> d!37177 d!37341))

(declare-fun d!37343 () Bool)

(assert (=> d!37343 (arrayContainsKey!0 (_keys!4481 newMap!16) lt!63667 #b00000000000000000000000000000000)))

(declare-fun lt!63760 () Unit!3839)

(declare-fun choose!13 (array!4639 (_ BitVec 64) (_ BitVec 32)) Unit!3839)

(assert (=> d!37343 (= lt!63760 (choose!13 (_keys!4481 newMap!16) lt!63667 #b00000000000000000000000000000000))))

(assert (=> d!37343 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!37343 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!4481 newMap!16) lt!63667 #b00000000000000000000000000000000) lt!63760)))

(declare-fun bs!5146 () Bool)

(assert (= bs!5146 d!37343))

(assert (=> bs!5146 m!143915))

(declare-fun m!144199 () Bool)

(assert (=> bs!5146 m!144199))

(assert (=> b!123717 d!37343))

(declare-fun d!37345 () Bool)

(declare-fun res!60117 () Bool)

(declare-fun e!80985 () Bool)

(assert (=> d!37345 (=> res!60117 e!80985)))

(assert (=> d!37345 (= res!60117 (= (select (arr!2198 (_keys!4481 newMap!16)) #b00000000000000000000000000000000) lt!63667))))

(assert (=> d!37345 (= (arrayContainsKey!0 (_keys!4481 newMap!16) lt!63667 #b00000000000000000000000000000000) e!80985)))

(declare-fun b!123948 () Bool)

(declare-fun e!80986 () Bool)

(assert (=> b!123948 (= e!80985 e!80986)))

(declare-fun res!60118 () Bool)

(assert (=> b!123948 (=> (not res!60118) (not e!80986))))

(assert (=> b!123948 (= res!60118 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2460 (_keys!4481 newMap!16))))))

(declare-fun b!123949 () Bool)

(assert (=> b!123949 (= e!80986 (arrayContainsKey!0 (_keys!4481 newMap!16) lt!63667 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!37345 (not res!60117)) b!123948))

(assert (= (and b!123948 res!60118) b!123949))

(assert (=> d!37345 m!143701))

(declare-fun m!144201 () Bool)

(assert (=> b!123949 m!144201))

(assert (=> b!123717 d!37345))

(declare-fun d!37347 () Bool)

(declare-fun lt!63767 () SeekEntryResult!261)

(assert (=> d!37347 (and (or ((_ is Undefined!261) lt!63767) (not ((_ is Found!261) lt!63767)) (and (bvsge (index!3199 lt!63767) #b00000000000000000000000000000000) (bvslt (index!3199 lt!63767) (size!2460 (_keys!4481 newMap!16))))) (or ((_ is Undefined!261) lt!63767) ((_ is Found!261) lt!63767) (not ((_ is MissingZero!261) lt!63767)) (and (bvsge (index!3198 lt!63767) #b00000000000000000000000000000000) (bvslt (index!3198 lt!63767) (size!2460 (_keys!4481 newMap!16))))) (or ((_ is Undefined!261) lt!63767) ((_ is Found!261) lt!63767) ((_ is MissingZero!261) lt!63767) (not ((_ is MissingVacant!261) lt!63767)) (and (bvsge (index!3201 lt!63767) #b00000000000000000000000000000000) (bvslt (index!3201 lt!63767) (size!2460 (_keys!4481 newMap!16))))) (or ((_ is Undefined!261) lt!63767) (ite ((_ is Found!261) lt!63767) (= (select (arr!2198 (_keys!4481 newMap!16)) (index!3199 lt!63767)) (select (arr!2198 (_keys!4481 newMap!16)) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!261) lt!63767) (= (select (arr!2198 (_keys!4481 newMap!16)) (index!3198 lt!63767)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!261) lt!63767) (= (select (arr!2198 (_keys!4481 newMap!16)) (index!3201 lt!63767)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!80995 () SeekEntryResult!261)

(assert (=> d!37347 (= lt!63767 e!80995)))

(declare-fun c!22553 () Bool)

(declare-fun lt!63769 () SeekEntryResult!261)

(assert (=> d!37347 (= c!22553 (and ((_ is Intermediate!261) lt!63769) (undefined!1073 lt!63769)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!4639 (_ BitVec 32)) SeekEntryResult!261)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!37347 (= lt!63769 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!2198 (_keys!4481 newMap!16)) #b00000000000000000000000000000000) (mask!6992 newMap!16)) (select (arr!2198 (_keys!4481 newMap!16)) #b00000000000000000000000000000000) (_keys!4481 newMap!16) (mask!6992 newMap!16)))))

(assert (=> d!37347 (validMask!0 (mask!6992 newMap!16))))

(assert (=> d!37347 (= (seekEntryOrOpen!0 (select (arr!2198 (_keys!4481 newMap!16)) #b00000000000000000000000000000000) (_keys!4481 newMap!16) (mask!6992 newMap!16)) lt!63767)))

(declare-fun b!123962 () Bool)

(assert (=> b!123962 (= e!80995 Undefined!261)))

(declare-fun b!123963 () Bool)

(declare-fun e!80993 () SeekEntryResult!261)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!4639 (_ BitVec 32)) SeekEntryResult!261)

(assert (=> b!123963 (= e!80993 (seekKeyOrZeroReturnVacant!0 (x!14722 lt!63769) (index!3200 lt!63769) (index!3200 lt!63769) (select (arr!2198 (_keys!4481 newMap!16)) #b00000000000000000000000000000000) (_keys!4481 newMap!16) (mask!6992 newMap!16)))))

(declare-fun b!123964 () Bool)

(declare-fun e!80994 () SeekEntryResult!261)

(assert (=> b!123964 (= e!80994 (Found!261 (index!3200 lt!63769)))))

(declare-fun b!123965 () Bool)

(declare-fun c!22551 () Bool)

(declare-fun lt!63768 () (_ BitVec 64))

(assert (=> b!123965 (= c!22551 (= lt!63768 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!123965 (= e!80994 e!80993)))

(declare-fun b!123966 () Bool)

(assert (=> b!123966 (= e!80995 e!80994)))

(assert (=> b!123966 (= lt!63768 (select (arr!2198 (_keys!4481 newMap!16)) (index!3200 lt!63769)))))

(declare-fun c!22552 () Bool)

(assert (=> b!123966 (= c!22552 (= lt!63768 (select (arr!2198 (_keys!4481 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!123967 () Bool)

(assert (=> b!123967 (= e!80993 (MissingZero!261 (index!3200 lt!63769)))))

(assert (= (and d!37347 c!22553) b!123962))

(assert (= (and d!37347 (not c!22553)) b!123966))

(assert (= (and b!123966 c!22552) b!123964))

(assert (= (and b!123966 (not c!22552)) b!123965))

(assert (= (and b!123965 c!22551) b!123967))

(assert (= (and b!123965 (not c!22551)) b!123963))

(declare-fun m!144203 () Bool)

(assert (=> d!37347 m!144203))

(assert (=> d!37347 m!143701))

(declare-fun m!144205 () Bool)

(assert (=> d!37347 m!144205))

(declare-fun m!144207 () Bool)

(assert (=> d!37347 m!144207))

(declare-fun m!144209 () Bool)

(assert (=> d!37347 m!144209))

(declare-fun m!144211 () Bool)

(assert (=> d!37347 m!144211))

(assert (=> d!37347 m!143701))

(assert (=> d!37347 m!144203))

(assert (=> d!37347 m!143733))

(assert (=> b!123963 m!143701))

(declare-fun m!144213 () Bool)

(assert (=> b!123963 m!144213))

(declare-fun m!144215 () Bool)

(assert (=> b!123966 m!144215))

(assert (=> b!123717 d!37347))

(declare-fun b!123968 () Bool)

(declare-fun res!60122 () Bool)

(declare-fun e!80997 () Bool)

(assert (=> b!123968 (=> (not res!60122) (not e!80997))))

(declare-fun lt!63775 () ListLongMap!1623)

(assert (=> b!123968 (= res!60122 (not (contains!856 lt!63775 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!81002 () Bool)

(declare-fun b!123969 () Bool)

(assert (=> b!123969 (= e!81002 (= lt!63775 (getCurrentListMapNoExtraKeys!128 (_keys!4481 (v!3091 (underlying!430 thiss!992))) (_values!2737 (v!3091 (underlying!430 thiss!992))) (mask!6992 (v!3091 (underlying!430 thiss!992))) (extraKeys!2539 (v!3091 (underlying!430 thiss!992))) (zeroValue!2619 (v!3091 (underlying!430 thiss!992))) (minValue!2619 (v!3091 (underlying!430 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (defaultEntry!2754 (v!3091 (underlying!430 thiss!992))))))))

(declare-fun b!123970 () Bool)

(declare-fun e!80998 () ListLongMap!1623)

(assert (=> b!123970 (= e!80998 (ListLongMap!1624 Nil!1667))))

(declare-fun b!123972 () Bool)

(declare-fun e!81000 () Bool)

(declare-fun e!80999 () Bool)

(assert (=> b!123972 (= e!81000 e!80999)))

(assert (=> b!123972 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2460 (_keys!4481 (v!3091 (underlying!430 thiss!992))))))))

(declare-fun res!60119 () Bool)

(assert (=> b!123972 (= res!60119 (contains!856 lt!63775 (select (arr!2198 (_keys!4481 (v!3091 (underlying!430 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001))))))

(assert (=> b!123972 (=> (not res!60119) (not e!80999))))

(declare-fun b!123973 () Bool)

(declare-fun e!81001 () ListLongMap!1623)

(declare-fun call!13146 () ListLongMap!1623)

(assert (=> b!123973 (= e!81001 call!13146)))

(declare-fun b!123974 () Bool)

(declare-fun lt!63770 () Unit!3839)

(declare-fun lt!63773 () Unit!3839)

(assert (=> b!123974 (= lt!63770 lt!63773)))

(declare-fun lt!63772 () V!3409)

(declare-fun lt!63771 () (_ BitVec 64))

(declare-fun lt!63776 () ListLongMap!1623)

(declare-fun lt!63774 () (_ BitVec 64))

(assert (=> b!123974 (not (contains!856 (+!161 lt!63776 (tuple2!2509 lt!63774 lt!63772)) lt!63771))))

(assert (=> b!123974 (= lt!63773 (addStillNotContains!56 lt!63776 lt!63774 lt!63772 lt!63771))))

(assert (=> b!123974 (= lt!63771 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!123974 (= lt!63772 (get!1434 (select (arr!2199 (_values!2737 (v!3091 (underlying!430 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) (dynLambda!412 (defaultEntry!2754 (v!3091 (underlying!430 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!123974 (= lt!63774 (select (arr!2198 (_keys!4481 (v!3091 (underlying!430 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)))))

(assert (=> b!123974 (= lt!63776 call!13146)))

(assert (=> b!123974 (= e!81001 (+!161 call!13146 (tuple2!2509 (select (arr!2198 (_keys!4481 (v!3091 (underlying!430 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) (get!1434 (select (arr!2199 (_values!2737 (v!3091 (underlying!430 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) (dynLambda!412 (defaultEntry!2754 (v!3091 (underlying!430 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!123975 () Bool)

(assert (=> b!123975 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2460 (_keys!4481 (v!3091 (underlying!430 thiss!992))))))))

(assert (=> b!123975 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2461 (_values!2737 (v!3091 (underlying!430 thiss!992))))))))

(assert (=> b!123975 (= e!80999 (= (apply!108 lt!63775 (select (arr!2198 (_keys!4481 (v!3091 (underlying!430 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001))) (get!1434 (select (arr!2199 (_values!2737 (v!3091 (underlying!430 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) (dynLambda!412 (defaultEntry!2754 (v!3091 (underlying!430 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!123976 () Bool)

(assert (=> b!123976 (= e!81002 (isEmpty!396 lt!63775))))

(declare-fun b!123977 () Bool)

(assert (=> b!123977 (= e!80998 e!81001)))

(declare-fun c!22557 () Bool)

(assert (=> b!123977 (= c!22557 (validKeyInArray!0 (select (arr!2198 (_keys!4481 (v!3091 (underlying!430 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001))))))

(declare-fun bm!13143 () Bool)

(assert (=> bm!13143 (= call!13146 (getCurrentListMapNoExtraKeys!128 (_keys!4481 (v!3091 (underlying!430 thiss!992))) (_values!2737 (v!3091 (underlying!430 thiss!992))) (mask!6992 (v!3091 (underlying!430 thiss!992))) (extraKeys!2539 (v!3091 (underlying!430 thiss!992))) (zeroValue!2619 (v!3091 (underlying!430 thiss!992))) (minValue!2619 (v!3091 (underlying!430 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (defaultEntry!2754 (v!3091 (underlying!430 thiss!992)))))))

(declare-fun d!37349 () Bool)

(assert (=> d!37349 e!80997))

(declare-fun res!60120 () Bool)

(assert (=> d!37349 (=> (not res!60120) (not e!80997))))

(assert (=> d!37349 (= res!60120 (not (contains!856 lt!63775 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!37349 (= lt!63775 e!80998)))

(declare-fun c!22555 () Bool)

(assert (=> d!37349 (= c!22555 (bvsge (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2460 (_keys!4481 (v!3091 (underlying!430 thiss!992))))))))

(assert (=> d!37349 (validMask!0 (mask!6992 (v!3091 (underlying!430 thiss!992))))))

(assert (=> d!37349 (= (getCurrentListMapNoExtraKeys!128 (_keys!4481 (v!3091 (underlying!430 thiss!992))) (_values!2737 (v!3091 (underlying!430 thiss!992))) (mask!6992 (v!3091 (underlying!430 thiss!992))) (extraKeys!2539 (v!3091 (underlying!430 thiss!992))) (zeroValue!2619 (v!3091 (underlying!430 thiss!992))) (minValue!2619 (v!3091 (underlying!430 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!2754 (v!3091 (underlying!430 thiss!992)))) lt!63775)))

(declare-fun b!123971 () Bool)

(declare-fun e!80996 () Bool)

(assert (=> b!123971 (= e!80996 (validKeyInArray!0 (select (arr!2198 (_keys!4481 (v!3091 (underlying!430 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001))))))

(assert (=> b!123971 (bvsge (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(declare-fun b!123978 () Bool)

(assert (=> b!123978 (= e!80997 e!81000)))

(declare-fun c!22554 () Bool)

(assert (=> b!123978 (= c!22554 e!80996)))

(declare-fun res!60121 () Bool)

(assert (=> b!123978 (=> (not res!60121) (not e!80996))))

(assert (=> b!123978 (= res!60121 (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2460 (_keys!4481 (v!3091 (underlying!430 thiss!992))))))))

(declare-fun b!123979 () Bool)

(assert (=> b!123979 (= e!81000 e!81002)))

(declare-fun c!22556 () Bool)

(assert (=> b!123979 (= c!22556 (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2460 (_keys!4481 (v!3091 (underlying!430 thiss!992))))))))

(assert (= (and d!37349 c!22555) b!123970))

(assert (= (and d!37349 (not c!22555)) b!123977))

(assert (= (and b!123977 c!22557) b!123974))

(assert (= (and b!123977 (not c!22557)) b!123973))

(assert (= (or b!123974 b!123973) bm!13143))

(assert (= (and d!37349 res!60120) b!123968))

(assert (= (and b!123968 res!60122) b!123978))

(assert (= (and b!123978 res!60121) b!123971))

(assert (= (and b!123978 c!22554) b!123972))

(assert (= (and b!123978 (not c!22554)) b!123979))

(assert (= (and b!123972 res!60119) b!123975))

(assert (= (and b!123979 c!22556) b!123969))

(assert (= (and b!123979 (not c!22556)) b!123976))

(declare-fun b_lambda!5447 () Bool)

(assert (=> (not b_lambda!5447) (not b!123974)))

(assert (=> b!123974 t!5967))

(declare-fun b_and!7605 () Bool)

(assert (= b_and!7601 (and (=> t!5967 result!3763) b_and!7605)))

(assert (=> b!123974 t!5969))

(declare-fun b_and!7607 () Bool)

(assert (= b_and!7603 (and (=> t!5969 result!3767) b_and!7607)))

(declare-fun b_lambda!5449 () Bool)

(assert (=> (not b_lambda!5449) (not b!123975)))

(assert (=> b!123975 t!5967))

(declare-fun b_and!7609 () Bool)

(assert (= b_and!7605 (and (=> t!5967 result!3763) b_and!7609)))

(assert (=> b!123975 t!5969))

(declare-fun b_and!7611 () Bool)

(assert (= b_and!7607 (and (=> t!5969 result!3767) b_and!7611)))

(declare-fun m!144217 () Bool)

(assert (=> b!123972 m!144217))

(assert (=> b!123972 m!144217))

(declare-fun m!144219 () Bool)

(assert (=> b!123972 m!144219))

(declare-fun m!144221 () Bool)

(assert (=> b!123976 m!144221))

(declare-fun m!144223 () Bool)

(assert (=> bm!13143 m!144223))

(declare-fun m!144225 () Bool)

(assert (=> b!123974 m!144225))

(assert (=> b!123974 m!143617))

(assert (=> b!123974 m!144217))

(declare-fun m!144227 () Bool)

(assert (=> b!123974 m!144227))

(declare-fun m!144229 () Bool)

(assert (=> b!123974 m!144229))

(declare-fun m!144231 () Bool)

(assert (=> b!123974 m!144231))

(assert (=> b!123974 m!144227))

(assert (=> b!123974 m!144231))

(assert (=> b!123974 m!143617))

(declare-fun m!144233 () Bool)

(assert (=> b!123974 m!144233))

(declare-fun m!144235 () Bool)

(assert (=> b!123974 m!144235))

(assert (=> b!123971 m!144217))

(assert (=> b!123971 m!144217))

(declare-fun m!144237 () Bool)

(assert (=> b!123971 m!144237))

(assert (=> b!123977 m!144217))

(assert (=> b!123977 m!144217))

(assert (=> b!123977 m!144237))

(declare-fun m!144239 () Bool)

(assert (=> b!123968 m!144239))

(declare-fun m!144241 () Bool)

(assert (=> d!37349 m!144241))

(assert (=> d!37349 m!143603))

(assert (=> b!123969 m!144223))

(assert (=> b!123975 m!143617))

(assert (=> b!123975 m!144217))

(assert (=> b!123975 m!144231))

(assert (=> b!123975 m!144217))

(declare-fun m!144243 () Bool)

(assert (=> b!123975 m!144243))

(assert (=> b!123975 m!144231))

(assert (=> b!123975 m!143617))

(assert (=> b!123975 m!144233))

(assert (=> bm!13119 d!37349))

(declare-fun d!37351 () Bool)

(declare-fun e!81003 () Bool)

(assert (=> d!37351 e!81003))

(declare-fun res!60124 () Bool)

(assert (=> d!37351 (=> (not res!60124) (not e!81003))))

(declare-fun lt!63778 () ListLongMap!1623)

(assert (=> d!37351 (= res!60124 (contains!856 lt!63778 (_1!1265 (tuple2!2509 lt!63592 (minValue!2619 newMap!16)))))))

(declare-fun lt!63780 () List!1670)

(assert (=> d!37351 (= lt!63778 (ListLongMap!1624 lt!63780))))

(declare-fun lt!63779 () Unit!3839)

(declare-fun lt!63777 () Unit!3839)

(assert (=> d!37351 (= lt!63779 lt!63777)))

(assert (=> d!37351 (= (getValueByKey!165 lt!63780 (_1!1265 (tuple2!2509 lt!63592 (minValue!2619 newMap!16)))) (Some!170 (_2!1265 (tuple2!2509 lt!63592 (minValue!2619 newMap!16)))))))

(assert (=> d!37351 (= lt!63777 (lemmaContainsTupThenGetReturnValue!81 lt!63780 (_1!1265 (tuple2!2509 lt!63592 (minValue!2619 newMap!16))) (_2!1265 (tuple2!2509 lt!63592 (minValue!2619 newMap!16)))))))

(assert (=> d!37351 (= lt!63780 (insertStrictlySorted!84 (toList!827 lt!63588) (_1!1265 (tuple2!2509 lt!63592 (minValue!2619 newMap!16))) (_2!1265 (tuple2!2509 lt!63592 (minValue!2619 newMap!16)))))))

(assert (=> d!37351 (= (+!161 lt!63588 (tuple2!2509 lt!63592 (minValue!2619 newMap!16))) lt!63778)))

(declare-fun b!123980 () Bool)

(declare-fun res!60123 () Bool)

(assert (=> b!123980 (=> (not res!60123) (not e!81003))))

(assert (=> b!123980 (= res!60123 (= (getValueByKey!165 (toList!827 lt!63778) (_1!1265 (tuple2!2509 lt!63592 (minValue!2619 newMap!16)))) (Some!170 (_2!1265 (tuple2!2509 lt!63592 (minValue!2619 newMap!16))))))))

(declare-fun b!123981 () Bool)

(assert (=> b!123981 (= e!81003 (contains!857 (toList!827 lt!63778) (tuple2!2509 lt!63592 (minValue!2619 newMap!16))))))

(assert (= (and d!37351 res!60124) b!123980))

(assert (= (and b!123980 res!60123) b!123981))

(declare-fun m!144245 () Bool)

(assert (=> d!37351 m!144245))

(declare-fun m!144247 () Bool)

(assert (=> d!37351 m!144247))

(declare-fun m!144249 () Bool)

(assert (=> d!37351 m!144249))

(declare-fun m!144251 () Bool)

(assert (=> d!37351 m!144251))

(declare-fun m!144253 () Bool)

(assert (=> b!123980 m!144253))

(declare-fun m!144255 () Bool)

(assert (=> b!123981 m!144255))

(assert (=> b!123639 d!37351))

(declare-fun d!37353 () Bool)

(declare-fun e!81004 () Bool)

(assert (=> d!37353 e!81004))

(declare-fun res!60126 () Bool)

(assert (=> d!37353 (=> (not res!60126) (not e!81004))))

(declare-fun lt!63782 () ListLongMap!1623)

(assert (=> d!37353 (= res!60126 (contains!856 lt!63782 (_1!1265 (tuple2!2509 lt!63606 (minValue!2619 newMap!16)))))))

(declare-fun lt!63784 () List!1670)

(assert (=> d!37353 (= lt!63782 (ListLongMap!1624 lt!63784))))

(declare-fun lt!63783 () Unit!3839)

(declare-fun lt!63781 () Unit!3839)

(assert (=> d!37353 (= lt!63783 lt!63781)))

(assert (=> d!37353 (= (getValueByKey!165 lt!63784 (_1!1265 (tuple2!2509 lt!63606 (minValue!2619 newMap!16)))) (Some!170 (_2!1265 (tuple2!2509 lt!63606 (minValue!2619 newMap!16)))))))

(assert (=> d!37353 (= lt!63781 (lemmaContainsTupThenGetReturnValue!81 lt!63784 (_1!1265 (tuple2!2509 lt!63606 (minValue!2619 newMap!16))) (_2!1265 (tuple2!2509 lt!63606 (minValue!2619 newMap!16)))))))

(assert (=> d!37353 (= lt!63784 (insertStrictlySorted!84 (toList!827 lt!63605) (_1!1265 (tuple2!2509 lt!63606 (minValue!2619 newMap!16))) (_2!1265 (tuple2!2509 lt!63606 (minValue!2619 newMap!16)))))))

(assert (=> d!37353 (= (+!161 lt!63605 (tuple2!2509 lt!63606 (minValue!2619 newMap!16))) lt!63782)))

(declare-fun b!123982 () Bool)

(declare-fun res!60125 () Bool)

(assert (=> b!123982 (=> (not res!60125) (not e!81004))))

(assert (=> b!123982 (= res!60125 (= (getValueByKey!165 (toList!827 lt!63782) (_1!1265 (tuple2!2509 lt!63606 (minValue!2619 newMap!16)))) (Some!170 (_2!1265 (tuple2!2509 lt!63606 (minValue!2619 newMap!16))))))))

(declare-fun b!123983 () Bool)

(assert (=> b!123983 (= e!81004 (contains!857 (toList!827 lt!63782) (tuple2!2509 lt!63606 (minValue!2619 newMap!16))))))

(assert (= (and d!37353 res!60126) b!123982))

(assert (= (and b!123982 res!60125) b!123983))

(declare-fun m!144257 () Bool)

(assert (=> d!37353 m!144257))

(declare-fun m!144259 () Bool)

(assert (=> d!37353 m!144259))

(declare-fun m!144261 () Bool)

(assert (=> d!37353 m!144261))

(declare-fun m!144263 () Bool)

(assert (=> d!37353 m!144263))

(declare-fun m!144265 () Bool)

(assert (=> b!123982 m!144265))

(declare-fun m!144267 () Bool)

(assert (=> b!123983 m!144267))

(assert (=> b!123639 d!37353))

(declare-fun d!37355 () Bool)

(declare-fun e!81005 () Bool)

(assert (=> d!37355 e!81005))

(declare-fun res!60128 () Bool)

(assert (=> d!37355 (=> (not res!60128) (not e!81005))))

(declare-fun lt!63786 () ListLongMap!1623)

(assert (=> d!37355 (= res!60128 (contains!856 lt!63786 (_1!1265 (tuple2!2509 lt!63601 (zeroValue!2619 newMap!16)))))))

(declare-fun lt!63788 () List!1670)

(assert (=> d!37355 (= lt!63786 (ListLongMap!1624 lt!63788))))

(declare-fun lt!63787 () Unit!3839)

(declare-fun lt!63785 () Unit!3839)

(assert (=> d!37355 (= lt!63787 lt!63785)))

(assert (=> d!37355 (= (getValueByKey!165 lt!63788 (_1!1265 (tuple2!2509 lt!63601 (zeroValue!2619 newMap!16)))) (Some!170 (_2!1265 (tuple2!2509 lt!63601 (zeroValue!2619 newMap!16)))))))

(assert (=> d!37355 (= lt!63785 (lemmaContainsTupThenGetReturnValue!81 lt!63788 (_1!1265 (tuple2!2509 lt!63601 (zeroValue!2619 newMap!16))) (_2!1265 (tuple2!2509 lt!63601 (zeroValue!2619 newMap!16)))))))

(assert (=> d!37355 (= lt!63788 (insertStrictlySorted!84 (toList!827 lt!63599) (_1!1265 (tuple2!2509 lt!63601 (zeroValue!2619 newMap!16))) (_2!1265 (tuple2!2509 lt!63601 (zeroValue!2619 newMap!16)))))))

(assert (=> d!37355 (= (+!161 lt!63599 (tuple2!2509 lt!63601 (zeroValue!2619 newMap!16))) lt!63786)))

(declare-fun b!123984 () Bool)

(declare-fun res!60127 () Bool)

(assert (=> b!123984 (=> (not res!60127) (not e!81005))))

(assert (=> b!123984 (= res!60127 (= (getValueByKey!165 (toList!827 lt!63786) (_1!1265 (tuple2!2509 lt!63601 (zeroValue!2619 newMap!16)))) (Some!170 (_2!1265 (tuple2!2509 lt!63601 (zeroValue!2619 newMap!16))))))))

(declare-fun b!123985 () Bool)

(assert (=> b!123985 (= e!81005 (contains!857 (toList!827 lt!63786) (tuple2!2509 lt!63601 (zeroValue!2619 newMap!16))))))

(assert (= (and d!37355 res!60128) b!123984))

(assert (= (and b!123984 res!60127) b!123985))

(declare-fun m!144269 () Bool)

(assert (=> d!37355 m!144269))

(declare-fun m!144271 () Bool)

(assert (=> d!37355 m!144271))

(declare-fun m!144273 () Bool)

(assert (=> d!37355 m!144273))

(declare-fun m!144275 () Bool)

(assert (=> d!37355 m!144275))

(declare-fun m!144277 () Bool)

(assert (=> b!123984 m!144277))

(declare-fun m!144279 () Bool)

(assert (=> b!123985 m!144279))

(assert (=> b!123639 d!37355))

(declare-fun d!37357 () Bool)

(assert (=> d!37357 (= (apply!108 (+!161 lt!63588 (tuple2!2509 lt!63592 (minValue!2619 newMap!16))) lt!63600) (get!1435 (getValueByKey!165 (toList!827 (+!161 lt!63588 (tuple2!2509 lt!63592 (minValue!2619 newMap!16)))) lt!63600)))))

(declare-fun bs!5147 () Bool)

(assert (= bs!5147 d!37357))

(declare-fun m!144281 () Bool)

(assert (=> bs!5147 m!144281))

(assert (=> bs!5147 m!144281))

(declare-fun m!144283 () Bool)

(assert (=> bs!5147 m!144283))

(assert (=> b!123639 d!37357))

(declare-fun d!37359 () Bool)

(assert (=> d!37359 (= (apply!108 lt!63589 lt!63596) (get!1435 (getValueByKey!165 (toList!827 lt!63589) lt!63596)))))

(declare-fun bs!5148 () Bool)

(assert (= bs!5148 d!37359))

(declare-fun m!144285 () Bool)

(assert (=> bs!5148 m!144285))

(assert (=> bs!5148 m!144285))

(declare-fun m!144287 () Bool)

(assert (=> bs!5148 m!144287))

(assert (=> b!123639 d!37359))

(declare-fun d!37361 () Bool)

(assert (=> d!37361 (= (apply!108 (+!161 lt!63589 (tuple2!2509 lt!63603 (zeroValue!2619 newMap!16))) lt!63596) (get!1435 (getValueByKey!165 (toList!827 (+!161 lt!63589 (tuple2!2509 lt!63603 (zeroValue!2619 newMap!16)))) lt!63596)))))

(declare-fun bs!5149 () Bool)

(assert (= bs!5149 d!37361))

(declare-fun m!144289 () Bool)

(assert (=> bs!5149 m!144289))

(assert (=> bs!5149 m!144289))

(declare-fun m!144291 () Bool)

(assert (=> bs!5149 m!144291))

(assert (=> b!123639 d!37361))

(declare-fun d!37363 () Bool)

(assert (=> d!37363 (= (apply!108 (+!161 lt!63589 (tuple2!2509 lt!63603 (zeroValue!2619 newMap!16))) lt!63596) (apply!108 lt!63589 lt!63596))))

(declare-fun lt!63789 () Unit!3839)

(assert (=> d!37363 (= lt!63789 (choose!749 lt!63589 lt!63603 (zeroValue!2619 newMap!16) lt!63596))))

(declare-fun e!81006 () Bool)

(assert (=> d!37363 e!81006))

(declare-fun res!60129 () Bool)

(assert (=> d!37363 (=> (not res!60129) (not e!81006))))

(assert (=> d!37363 (= res!60129 (contains!856 lt!63589 lt!63596))))

(assert (=> d!37363 (= (addApplyDifferent!84 lt!63589 lt!63603 (zeroValue!2619 newMap!16) lt!63596) lt!63789)))

(declare-fun b!123986 () Bool)

(assert (=> b!123986 (= e!81006 (not (= lt!63596 lt!63603)))))

(assert (= (and d!37363 res!60129) b!123986))

(declare-fun m!144293 () Bool)

(assert (=> d!37363 m!144293))

(assert (=> d!37363 m!143765))

(declare-fun m!144295 () Bool)

(assert (=> d!37363 m!144295))

(assert (=> d!37363 m!143759))

(assert (=> d!37363 m!143765))

(assert (=> d!37363 m!143767))

(assert (=> b!123639 d!37363))

(declare-fun d!37365 () Bool)

(assert (=> d!37365 (= (apply!108 (+!161 lt!63588 (tuple2!2509 lt!63592 (minValue!2619 newMap!16))) lt!63600) (apply!108 lt!63588 lt!63600))))

(declare-fun lt!63790 () Unit!3839)

(assert (=> d!37365 (= lt!63790 (choose!749 lt!63588 lt!63592 (minValue!2619 newMap!16) lt!63600))))

(declare-fun e!81007 () Bool)

(assert (=> d!37365 e!81007))

(declare-fun res!60130 () Bool)

(assert (=> d!37365 (=> (not res!60130) (not e!81007))))

(assert (=> d!37365 (= res!60130 (contains!856 lt!63588 lt!63600))))

(assert (=> d!37365 (= (addApplyDifferent!84 lt!63588 lt!63592 (minValue!2619 newMap!16) lt!63600) lt!63790)))

(declare-fun b!123987 () Bool)

(assert (=> b!123987 (= e!81007 (not (= lt!63600 lt!63592)))))

(assert (= (and d!37365 res!60130) b!123987))

(declare-fun m!144297 () Bool)

(assert (=> d!37365 m!144297))

(assert (=> d!37365 m!143769))

(declare-fun m!144299 () Bool)

(assert (=> d!37365 m!144299))

(assert (=> d!37365 m!143775))

(assert (=> d!37365 m!143769))

(assert (=> d!37365 m!143771))

(assert (=> b!123639 d!37365))

(declare-fun d!37367 () Bool)

(declare-fun e!81008 () Bool)

(assert (=> d!37367 e!81008))

(declare-fun res!60131 () Bool)

(assert (=> d!37367 (=> res!60131 e!81008)))

(declare-fun lt!63791 () Bool)

(assert (=> d!37367 (= res!60131 (not lt!63791))))

(declare-fun lt!63792 () Bool)

(assert (=> d!37367 (= lt!63791 lt!63792)))

(declare-fun lt!63793 () Unit!3839)

(declare-fun e!81009 () Unit!3839)

(assert (=> d!37367 (= lt!63793 e!81009)))

(declare-fun c!22558 () Bool)

(assert (=> d!37367 (= c!22558 lt!63792)))

(assert (=> d!37367 (= lt!63792 (containsKey!168 (toList!827 (+!161 lt!63599 (tuple2!2509 lt!63601 (zeroValue!2619 newMap!16)))) lt!63597))))

(assert (=> d!37367 (= (contains!856 (+!161 lt!63599 (tuple2!2509 lt!63601 (zeroValue!2619 newMap!16))) lt!63597) lt!63791)))

(declare-fun b!123988 () Bool)

(declare-fun lt!63794 () Unit!3839)

(assert (=> b!123988 (= e!81009 lt!63794)))

(assert (=> b!123988 (= lt!63794 (lemmaContainsKeyImpliesGetValueByKeyDefined!116 (toList!827 (+!161 lt!63599 (tuple2!2509 lt!63601 (zeroValue!2619 newMap!16)))) lt!63597))))

(assert (=> b!123988 (isDefined!117 (getValueByKey!165 (toList!827 (+!161 lt!63599 (tuple2!2509 lt!63601 (zeroValue!2619 newMap!16)))) lt!63597))))

(declare-fun b!123989 () Bool)

(declare-fun Unit!3858 () Unit!3839)

(assert (=> b!123989 (= e!81009 Unit!3858)))

(declare-fun b!123990 () Bool)

(assert (=> b!123990 (= e!81008 (isDefined!117 (getValueByKey!165 (toList!827 (+!161 lt!63599 (tuple2!2509 lt!63601 (zeroValue!2619 newMap!16)))) lt!63597)))))

(assert (= (and d!37367 c!22558) b!123988))

(assert (= (and d!37367 (not c!22558)) b!123989))

(assert (= (and d!37367 (not res!60131)) b!123990))

(declare-fun m!144301 () Bool)

(assert (=> d!37367 m!144301))

(declare-fun m!144303 () Bool)

(assert (=> b!123988 m!144303))

(declare-fun m!144305 () Bool)

(assert (=> b!123988 m!144305))

(assert (=> b!123988 m!144305))

(declare-fun m!144307 () Bool)

(assert (=> b!123988 m!144307))

(assert (=> b!123990 m!144305))

(assert (=> b!123990 m!144305))

(assert (=> b!123990 m!144307))

(assert (=> b!123639 d!37367))

(declare-fun d!37369 () Bool)

(assert (=> d!37369 (= (apply!108 lt!63605 lt!63590) (get!1435 (getValueByKey!165 (toList!827 lt!63605) lt!63590)))))

(declare-fun bs!5150 () Bool)

(assert (= bs!5150 d!37369))

(declare-fun m!144309 () Bool)

(assert (=> bs!5150 m!144309))

(assert (=> bs!5150 m!144309))

(declare-fun m!144311 () Bool)

(assert (=> bs!5150 m!144311))

(assert (=> b!123639 d!37369))

(declare-fun d!37371 () Bool)

(declare-fun e!81010 () Bool)

(assert (=> d!37371 e!81010))

(declare-fun res!60133 () Bool)

(assert (=> d!37371 (=> (not res!60133) (not e!81010))))

(declare-fun lt!63796 () ListLongMap!1623)

(assert (=> d!37371 (= res!60133 (contains!856 lt!63796 (_1!1265 (tuple2!2509 lt!63603 (zeroValue!2619 newMap!16)))))))

(declare-fun lt!63798 () List!1670)

(assert (=> d!37371 (= lt!63796 (ListLongMap!1624 lt!63798))))

(declare-fun lt!63797 () Unit!3839)

(declare-fun lt!63795 () Unit!3839)

(assert (=> d!37371 (= lt!63797 lt!63795)))

(assert (=> d!37371 (= (getValueByKey!165 lt!63798 (_1!1265 (tuple2!2509 lt!63603 (zeroValue!2619 newMap!16)))) (Some!170 (_2!1265 (tuple2!2509 lt!63603 (zeroValue!2619 newMap!16)))))))

(assert (=> d!37371 (= lt!63795 (lemmaContainsTupThenGetReturnValue!81 lt!63798 (_1!1265 (tuple2!2509 lt!63603 (zeroValue!2619 newMap!16))) (_2!1265 (tuple2!2509 lt!63603 (zeroValue!2619 newMap!16)))))))

(assert (=> d!37371 (= lt!63798 (insertStrictlySorted!84 (toList!827 lt!63589) (_1!1265 (tuple2!2509 lt!63603 (zeroValue!2619 newMap!16))) (_2!1265 (tuple2!2509 lt!63603 (zeroValue!2619 newMap!16)))))))

(assert (=> d!37371 (= (+!161 lt!63589 (tuple2!2509 lt!63603 (zeroValue!2619 newMap!16))) lt!63796)))

(declare-fun b!123991 () Bool)

(declare-fun res!60132 () Bool)

(assert (=> b!123991 (=> (not res!60132) (not e!81010))))

(assert (=> b!123991 (= res!60132 (= (getValueByKey!165 (toList!827 lt!63796) (_1!1265 (tuple2!2509 lt!63603 (zeroValue!2619 newMap!16)))) (Some!170 (_2!1265 (tuple2!2509 lt!63603 (zeroValue!2619 newMap!16))))))))

(declare-fun b!123992 () Bool)

(assert (=> b!123992 (= e!81010 (contains!857 (toList!827 lt!63796) (tuple2!2509 lt!63603 (zeroValue!2619 newMap!16))))))

(assert (= (and d!37371 res!60133) b!123991))

(assert (= (and b!123991 res!60132) b!123992))

(declare-fun m!144313 () Bool)

(assert (=> d!37371 m!144313))

(declare-fun m!144315 () Bool)

(assert (=> d!37371 m!144315))

(declare-fun m!144317 () Bool)

(assert (=> d!37371 m!144317))

(declare-fun m!144319 () Bool)

(assert (=> d!37371 m!144319))

(declare-fun m!144321 () Bool)

(assert (=> b!123991 m!144321))

(declare-fun m!144323 () Bool)

(assert (=> b!123992 m!144323))

(assert (=> b!123639 d!37371))

(declare-fun b!123993 () Bool)

(declare-fun res!60137 () Bool)

(declare-fun e!81012 () Bool)

(assert (=> b!123993 (=> (not res!60137) (not e!81012))))

(declare-fun lt!63804 () ListLongMap!1623)

(assert (=> b!123993 (= res!60137 (not (contains!856 lt!63804 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!123994 () Bool)

(declare-fun e!81017 () Bool)

(assert (=> b!123994 (= e!81017 (= lt!63804 (getCurrentListMapNoExtraKeys!128 (_keys!4481 newMap!16) (_values!2737 newMap!16) (mask!6992 newMap!16) (extraKeys!2539 newMap!16) (zeroValue!2619 newMap!16) (minValue!2619 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!2754 newMap!16))))))

(declare-fun b!123995 () Bool)

(declare-fun e!81013 () ListLongMap!1623)

(assert (=> b!123995 (= e!81013 (ListLongMap!1624 Nil!1667))))

(declare-fun b!123997 () Bool)

(declare-fun e!81015 () Bool)

(declare-fun e!81014 () Bool)

(assert (=> b!123997 (= e!81015 e!81014)))

(assert (=> b!123997 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2460 (_keys!4481 newMap!16))))))

(declare-fun res!60134 () Bool)

(assert (=> b!123997 (= res!60134 (contains!856 lt!63804 (select (arr!2198 (_keys!4481 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!123997 (=> (not res!60134) (not e!81014))))

(declare-fun b!123998 () Bool)

(declare-fun e!81016 () ListLongMap!1623)

(declare-fun call!13147 () ListLongMap!1623)

(assert (=> b!123998 (= e!81016 call!13147)))

(declare-fun b!123999 () Bool)

(declare-fun lt!63799 () Unit!3839)

(declare-fun lt!63802 () Unit!3839)

(assert (=> b!123999 (= lt!63799 lt!63802)))

(declare-fun lt!63800 () (_ BitVec 64))

(declare-fun lt!63801 () V!3409)

(declare-fun lt!63803 () (_ BitVec 64))

(declare-fun lt!63805 () ListLongMap!1623)

(assert (=> b!123999 (not (contains!856 (+!161 lt!63805 (tuple2!2509 lt!63803 lt!63801)) lt!63800))))

(assert (=> b!123999 (= lt!63802 (addStillNotContains!56 lt!63805 lt!63803 lt!63801 lt!63800))))

(assert (=> b!123999 (= lt!63800 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!123999 (= lt!63801 (get!1434 (select (arr!2199 (_values!2737 newMap!16)) #b00000000000000000000000000000000) (dynLambda!412 (defaultEntry!2754 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!123999 (= lt!63803 (select (arr!2198 (_keys!4481 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!123999 (= lt!63805 call!13147)))

(assert (=> b!123999 (= e!81016 (+!161 call!13147 (tuple2!2509 (select (arr!2198 (_keys!4481 newMap!16)) #b00000000000000000000000000000000) (get!1434 (select (arr!2199 (_values!2737 newMap!16)) #b00000000000000000000000000000000) (dynLambda!412 (defaultEntry!2754 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!124000 () Bool)

(assert (=> b!124000 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2460 (_keys!4481 newMap!16))))))

(assert (=> b!124000 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2461 (_values!2737 newMap!16))))))

(assert (=> b!124000 (= e!81014 (= (apply!108 lt!63804 (select (arr!2198 (_keys!4481 newMap!16)) #b00000000000000000000000000000000)) (get!1434 (select (arr!2199 (_values!2737 newMap!16)) #b00000000000000000000000000000000) (dynLambda!412 (defaultEntry!2754 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!124001 () Bool)

(assert (=> b!124001 (= e!81017 (isEmpty!396 lt!63804))))

(declare-fun b!124002 () Bool)

(assert (=> b!124002 (= e!81013 e!81016)))

(declare-fun c!22562 () Bool)

(assert (=> b!124002 (= c!22562 (validKeyInArray!0 (select (arr!2198 (_keys!4481 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun bm!13144 () Bool)

(assert (=> bm!13144 (= call!13147 (getCurrentListMapNoExtraKeys!128 (_keys!4481 newMap!16) (_values!2737 newMap!16) (mask!6992 newMap!16) (extraKeys!2539 newMap!16) (zeroValue!2619 newMap!16) (minValue!2619 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!2754 newMap!16)))))

(declare-fun d!37373 () Bool)

(assert (=> d!37373 e!81012))

(declare-fun res!60135 () Bool)

(assert (=> d!37373 (=> (not res!60135) (not e!81012))))

(assert (=> d!37373 (= res!60135 (not (contains!856 lt!63804 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!37373 (= lt!63804 e!81013)))

(declare-fun c!22560 () Bool)

(assert (=> d!37373 (= c!22560 (bvsge #b00000000000000000000000000000000 (size!2460 (_keys!4481 newMap!16))))))

(assert (=> d!37373 (validMask!0 (mask!6992 newMap!16))))

(assert (=> d!37373 (= (getCurrentListMapNoExtraKeys!128 (_keys!4481 newMap!16) (_values!2737 newMap!16) (mask!6992 newMap!16) (extraKeys!2539 newMap!16) (zeroValue!2619 newMap!16) (minValue!2619 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2754 newMap!16)) lt!63804)))

(declare-fun b!123996 () Bool)

(declare-fun e!81011 () Bool)

(assert (=> b!123996 (= e!81011 (validKeyInArray!0 (select (arr!2198 (_keys!4481 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!123996 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!124003 () Bool)

(assert (=> b!124003 (= e!81012 e!81015)))

(declare-fun c!22559 () Bool)

(assert (=> b!124003 (= c!22559 e!81011)))

(declare-fun res!60136 () Bool)

(assert (=> b!124003 (=> (not res!60136) (not e!81011))))

(assert (=> b!124003 (= res!60136 (bvslt #b00000000000000000000000000000000 (size!2460 (_keys!4481 newMap!16))))))

(declare-fun b!124004 () Bool)

(assert (=> b!124004 (= e!81015 e!81017)))

(declare-fun c!22561 () Bool)

(assert (=> b!124004 (= c!22561 (bvslt #b00000000000000000000000000000000 (size!2460 (_keys!4481 newMap!16))))))

(assert (= (and d!37373 c!22560) b!123995))

(assert (= (and d!37373 (not c!22560)) b!124002))

(assert (= (and b!124002 c!22562) b!123999))

(assert (= (and b!124002 (not c!22562)) b!123998))

(assert (= (or b!123999 b!123998) bm!13144))

(assert (= (and d!37373 res!60135) b!123993))

(assert (= (and b!123993 res!60137) b!124003))

(assert (= (and b!124003 res!60136) b!123996))

(assert (= (and b!124003 c!22559) b!123997))

(assert (= (and b!124003 (not c!22559)) b!124004))

(assert (= (and b!123997 res!60134) b!124000))

(assert (= (and b!124004 c!22561) b!123994))

(assert (= (and b!124004 (not c!22561)) b!124001))

(declare-fun b_lambda!5451 () Bool)

(assert (=> (not b_lambda!5451) (not b!123999)))

(assert (=> b!123999 t!5972))

(declare-fun b_and!7613 () Bool)

(assert (= b_and!7609 (and (=> t!5972 result!3771) b_and!7613)))

(assert (=> b!123999 t!5974))

(declare-fun b_and!7615 () Bool)

(assert (= b_and!7611 (and (=> t!5974 result!3773) b_and!7615)))

(declare-fun b_lambda!5453 () Bool)

(assert (=> (not b_lambda!5453) (not b!124000)))

(assert (=> b!124000 t!5972))

(declare-fun b_and!7617 () Bool)

(assert (= b_and!7613 (and (=> t!5972 result!3771) b_and!7617)))

(assert (=> b!124000 t!5974))

(declare-fun b_and!7619 () Bool)

(assert (= b_and!7615 (and (=> t!5974 result!3773) b_and!7619)))

(assert (=> b!123997 m!143701))

(assert (=> b!123997 m!143701))

(declare-fun m!144325 () Bool)

(assert (=> b!123997 m!144325))

(declare-fun m!144327 () Bool)

(assert (=> b!124001 m!144327))

(declare-fun m!144329 () Bool)

(assert (=> bm!13144 m!144329))

(declare-fun m!144331 () Bool)

(assert (=> b!123999 m!144331))

(assert (=> b!123999 m!143743))

(assert (=> b!123999 m!143701))

(declare-fun m!144333 () Bool)

(assert (=> b!123999 m!144333))

(declare-fun m!144335 () Bool)

(assert (=> b!123999 m!144335))

(assert (=> b!123999 m!143741))

(assert (=> b!123999 m!144333))

(assert (=> b!123999 m!143741))

(assert (=> b!123999 m!143743))

(assert (=> b!123999 m!143745))

(declare-fun m!144337 () Bool)

(assert (=> b!123999 m!144337))

(assert (=> b!123996 m!143701))

(assert (=> b!123996 m!143701))

(assert (=> b!123996 m!143705))

(assert (=> b!124002 m!143701))

(assert (=> b!124002 m!143701))

(assert (=> b!124002 m!143705))

(declare-fun m!144339 () Bool)

(assert (=> b!123993 m!144339))

(declare-fun m!144341 () Bool)

(assert (=> d!37373 m!144341))

(assert (=> d!37373 m!143733))

(assert (=> b!123994 m!144329))

(assert (=> b!124000 m!143743))

(assert (=> b!124000 m!143701))

(assert (=> b!124000 m!143741))

(assert (=> b!124000 m!143701))

(declare-fun m!144343 () Bool)

(assert (=> b!124000 m!144343))

(assert (=> b!124000 m!143741))

(assert (=> b!124000 m!143743))

(assert (=> b!124000 m!143745))

(assert (=> b!123639 d!37373))

(declare-fun d!37375 () Bool)

(assert (=> d!37375 (contains!856 (+!161 lt!63599 (tuple2!2509 lt!63601 (zeroValue!2619 newMap!16))) lt!63597)))

(declare-fun lt!63806 () Unit!3839)

(assert (=> d!37375 (= lt!63806 (choose!750 lt!63599 lt!63601 (zeroValue!2619 newMap!16) lt!63597))))

(assert (=> d!37375 (contains!856 lt!63599 lt!63597)))

(assert (=> d!37375 (= (addStillContains!84 lt!63599 lt!63601 (zeroValue!2619 newMap!16) lt!63597) lt!63806)))

(declare-fun bs!5151 () Bool)

(assert (= bs!5151 d!37375))

(assert (=> bs!5151 m!143755))

(assert (=> bs!5151 m!143755))

(assert (=> bs!5151 m!143763))

(declare-fun m!144345 () Bool)

(assert (=> bs!5151 m!144345))

(declare-fun m!144347 () Bool)

(assert (=> bs!5151 m!144347))

(assert (=> b!123639 d!37375))

(declare-fun d!37377 () Bool)

(assert (=> d!37377 (= (apply!108 (+!161 lt!63605 (tuple2!2509 lt!63606 (minValue!2619 newMap!16))) lt!63590) (apply!108 lt!63605 lt!63590))))

(declare-fun lt!63807 () Unit!3839)

(assert (=> d!37377 (= lt!63807 (choose!749 lt!63605 lt!63606 (minValue!2619 newMap!16) lt!63590))))

(declare-fun e!81018 () Bool)

(assert (=> d!37377 e!81018))

(declare-fun res!60138 () Bool)

(assert (=> d!37377 (=> (not res!60138) (not e!81018))))

(assert (=> d!37377 (= res!60138 (contains!856 lt!63605 lt!63590))))

(assert (=> d!37377 (= (addApplyDifferent!84 lt!63605 lt!63606 (minValue!2619 newMap!16) lt!63590) lt!63807)))

(declare-fun b!124005 () Bool)

(assert (=> b!124005 (= e!81018 (not (= lt!63590 lt!63606)))))

(assert (= (and d!37377 res!60138) b!124005))

(declare-fun m!144349 () Bool)

(assert (=> d!37377 m!144349))

(assert (=> d!37377 m!143777))

(declare-fun m!144351 () Bool)

(assert (=> d!37377 m!144351))

(assert (=> d!37377 m!143781))

(assert (=> d!37377 m!143777))

(assert (=> d!37377 m!143779))

(assert (=> b!123639 d!37377))

(declare-fun d!37379 () Bool)

(assert (=> d!37379 (= (apply!108 lt!63588 lt!63600) (get!1435 (getValueByKey!165 (toList!827 lt!63588) lt!63600)))))

(declare-fun bs!5152 () Bool)

(assert (= bs!5152 d!37379))

(declare-fun m!144353 () Bool)

(assert (=> bs!5152 m!144353))

(assert (=> bs!5152 m!144353))

(declare-fun m!144355 () Bool)

(assert (=> bs!5152 m!144355))

(assert (=> b!123639 d!37379))

(declare-fun d!37381 () Bool)

(assert (=> d!37381 (= (apply!108 (+!161 lt!63605 (tuple2!2509 lt!63606 (minValue!2619 newMap!16))) lt!63590) (get!1435 (getValueByKey!165 (toList!827 (+!161 lt!63605 (tuple2!2509 lt!63606 (minValue!2619 newMap!16)))) lt!63590)))))

(declare-fun bs!5153 () Bool)

(assert (= bs!5153 d!37381))

(declare-fun m!144357 () Bool)

(assert (=> bs!5153 m!144357))

(assert (=> bs!5153 m!144357))

(declare-fun m!144359 () Bool)

(assert (=> bs!5153 m!144359))

(assert (=> b!123639 d!37381))

(declare-fun d!37383 () Bool)

(assert (=> d!37383 (= (get!1437 (select (arr!2199 (_values!2737 (v!3091 (underlying!430 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!412 (defaultEntry!2754 (v!3091 (underlying!430 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (dynLambda!412 (defaultEntry!2754 (v!3091 (underlying!430 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!123595 d!37383))

(assert (=> b!123598 d!37305))

(assert (=> b!123598 d!37307))

(declare-fun d!37385 () Bool)

(declare-fun isEmpty!398 (List!1670) Bool)

(assert (=> d!37385 (= (isEmpty!396 lt!63630) (isEmpty!398 (toList!827 lt!63630)))))

(declare-fun bs!5154 () Bool)

(assert (= bs!5154 d!37385))

(declare-fun m!144361 () Bool)

(assert (=> bs!5154 m!144361))

(assert (=> b!123687 d!37385))

(assert (=> b!123654 d!37327))

(assert (=> b!123654 d!37315))

(declare-fun d!37387 () Bool)

(assert (=> d!37387 (= (apply!108 lt!63595 #b1000000000000000000000000000000000000000000000000000000000000000) (get!1435 (getValueByKey!165 (toList!827 lt!63595) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!5155 () Bool)

(assert (= bs!5155 d!37387))

(declare-fun m!144363 () Bool)

(assert (=> bs!5155 m!144363))

(assert (=> bs!5155 m!144363))

(declare-fun m!144365 () Bool)

(assert (=> bs!5155 m!144365))

(assert (=> b!123637 d!37387))

(assert (=> d!37201 d!37203))

(assert (=> d!37201 d!37205))

(declare-fun d!37389 () Bool)

(assert (=> d!37389 (contains!856 (+!161 lt!63545 (tuple2!2509 lt!63547 (zeroValue!2619 (v!3091 (underlying!430 thiss!992))))) lt!63543)))

(assert (=> d!37389 true))

(declare-fun _$35!366 () Unit!3839)

(assert (=> d!37389 (= (choose!750 lt!63545 lt!63547 (zeroValue!2619 (v!3091 (underlying!430 thiss!992))) lt!63543) _$35!366)))

(declare-fun bs!5156 () Bool)

(assert (= bs!5156 d!37389))

(assert (=> bs!5156 m!143629))

(assert (=> bs!5156 m!143629))

(assert (=> bs!5156 m!143637))

(assert (=> d!37201 d!37389))

(declare-fun d!37391 () Bool)

(declare-fun e!81019 () Bool)

(assert (=> d!37391 e!81019))

(declare-fun res!60139 () Bool)

(assert (=> d!37391 (=> res!60139 e!81019)))

(declare-fun lt!63808 () Bool)

(assert (=> d!37391 (= res!60139 (not lt!63808))))

(declare-fun lt!63809 () Bool)

(assert (=> d!37391 (= lt!63808 lt!63809)))

(declare-fun lt!63810 () Unit!3839)

(declare-fun e!81020 () Unit!3839)

(assert (=> d!37391 (= lt!63810 e!81020)))

(declare-fun c!22563 () Bool)

(assert (=> d!37391 (= c!22563 lt!63809)))

(assert (=> d!37391 (= lt!63809 (containsKey!168 (toList!827 lt!63545) lt!63543))))

(assert (=> d!37391 (= (contains!856 lt!63545 lt!63543) lt!63808)))

(declare-fun b!124007 () Bool)

(declare-fun lt!63811 () Unit!3839)

(assert (=> b!124007 (= e!81020 lt!63811)))

(assert (=> b!124007 (= lt!63811 (lemmaContainsKeyImpliesGetValueByKeyDefined!116 (toList!827 lt!63545) lt!63543))))

(assert (=> b!124007 (isDefined!117 (getValueByKey!165 (toList!827 lt!63545) lt!63543))))

(declare-fun b!124008 () Bool)

(declare-fun Unit!3859 () Unit!3839)

(assert (=> b!124008 (= e!81020 Unit!3859)))

(declare-fun b!124009 () Bool)

(assert (=> b!124009 (= e!81019 (isDefined!117 (getValueByKey!165 (toList!827 lt!63545) lt!63543)))))

(assert (= (and d!37391 c!22563) b!124007))

(assert (= (and d!37391 (not c!22563)) b!124008))

(assert (= (and d!37391 (not res!60139)) b!124009))

(declare-fun m!144367 () Bool)

(assert (=> d!37391 m!144367))

(declare-fun m!144369 () Bool)

(assert (=> b!124007 m!144369))

(declare-fun m!144371 () Bool)

(assert (=> b!124007 m!144371))

(assert (=> b!124007 m!144371))

(declare-fun m!144373 () Bool)

(assert (=> b!124007 m!144373))

(assert (=> b!124009 m!144371))

(assert (=> b!124009 m!144371))

(assert (=> b!124009 m!144373))

(assert (=> d!37201 d!37391))

(declare-fun d!37393 () Bool)

(declare-fun e!81021 () Bool)

(assert (=> d!37393 e!81021))

(declare-fun res!60140 () Bool)

(assert (=> d!37393 (=> res!60140 e!81021)))

(declare-fun lt!63812 () Bool)

(assert (=> d!37393 (= res!60140 (not lt!63812))))

(declare-fun lt!63813 () Bool)

(assert (=> d!37393 (= lt!63812 lt!63813)))

(declare-fun lt!63814 () Unit!3839)

(declare-fun e!81022 () Unit!3839)

(assert (=> d!37393 (= lt!63814 e!81022)))

(declare-fun c!22564 () Bool)

(assert (=> d!37393 (= c!22564 lt!63813)))

(assert (=> d!37393 (= lt!63813 (containsKey!168 (toList!827 lt!63562) (_1!1265 (tuple2!2509 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 (v!3091 (underlying!430 thiss!992)))))))))

(assert (=> d!37393 (= (contains!856 lt!63562 (_1!1265 (tuple2!2509 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 (v!3091 (underlying!430 thiss!992)))))) lt!63812)))

(declare-fun b!124010 () Bool)

(declare-fun lt!63815 () Unit!3839)

(assert (=> b!124010 (= e!81022 lt!63815)))

(assert (=> b!124010 (= lt!63815 (lemmaContainsKeyImpliesGetValueByKeyDefined!116 (toList!827 lt!63562) (_1!1265 (tuple2!2509 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 (v!3091 (underlying!430 thiss!992)))))))))

(assert (=> b!124010 (isDefined!117 (getValueByKey!165 (toList!827 lt!63562) (_1!1265 (tuple2!2509 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 (v!3091 (underlying!430 thiss!992)))))))))

(declare-fun b!124011 () Bool)

(declare-fun Unit!3860 () Unit!3839)

(assert (=> b!124011 (= e!81022 Unit!3860)))

(declare-fun b!124012 () Bool)

(assert (=> b!124012 (= e!81021 (isDefined!117 (getValueByKey!165 (toList!827 lt!63562) (_1!1265 (tuple2!2509 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 (v!3091 (underlying!430 thiss!992))))))))))

(assert (= (and d!37393 c!22564) b!124010))

(assert (= (and d!37393 (not c!22564)) b!124011))

(assert (= (and d!37393 (not res!60140)) b!124012))

(declare-fun m!144375 () Bool)

(assert (=> d!37393 m!144375))

(declare-fun m!144377 () Bool)

(assert (=> b!124010 m!144377))

(assert (=> b!124010 m!143673))

(assert (=> b!124010 m!143673))

(declare-fun m!144379 () Bool)

(assert (=> b!124010 m!144379))

(assert (=> b!124012 m!143673))

(assert (=> b!124012 m!143673))

(assert (=> b!124012 m!144379))

(assert (=> d!37147 d!37393))

(declare-fun b!124014 () Bool)

(declare-fun e!81023 () Option!171)

(declare-fun e!81024 () Option!171)

(assert (=> b!124014 (= e!81023 e!81024)))

(declare-fun c!22566 () Bool)

(assert (=> b!124014 (= c!22566 (and ((_ is Cons!1666) lt!63564) (not (= (_1!1265 (h!2267 lt!63564)) (_1!1265 (tuple2!2509 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 (v!3091 (underlying!430 thiss!992)))))))))))

(declare-fun d!37395 () Bool)

(declare-fun c!22565 () Bool)

(assert (=> d!37395 (= c!22565 (and ((_ is Cons!1666) lt!63564) (= (_1!1265 (h!2267 lt!63564)) (_1!1265 (tuple2!2509 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 (v!3091 (underlying!430 thiss!992))))))))))

(assert (=> d!37395 (= (getValueByKey!165 lt!63564 (_1!1265 (tuple2!2509 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 (v!3091 (underlying!430 thiss!992)))))) e!81023)))

(declare-fun b!124016 () Bool)

(assert (=> b!124016 (= e!81024 None!169)))

(declare-fun b!124015 () Bool)

(assert (=> b!124015 (= e!81024 (getValueByKey!165 (t!5965 lt!63564) (_1!1265 (tuple2!2509 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 (v!3091 (underlying!430 thiss!992)))))))))

(declare-fun b!124013 () Bool)

(assert (=> b!124013 (= e!81023 (Some!170 (_2!1265 (h!2267 lt!63564))))))

(assert (= (and d!37395 c!22565) b!124013))

(assert (= (and d!37395 (not c!22565)) b!124014))

(assert (= (and b!124014 c!22566) b!124015))

(assert (= (and b!124014 (not c!22566)) b!124016))

(declare-fun m!144381 () Bool)

(assert (=> b!124015 m!144381))

(assert (=> d!37147 d!37395))

(declare-fun d!37397 () Bool)

(assert (=> d!37397 (= (getValueByKey!165 lt!63564 (_1!1265 (tuple2!2509 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 (v!3091 (underlying!430 thiss!992)))))) (Some!170 (_2!1265 (tuple2!2509 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 (v!3091 (underlying!430 thiss!992)))))))))

(declare-fun lt!63816 () Unit!3839)

(assert (=> d!37397 (= lt!63816 (choose!751 lt!63564 (_1!1265 (tuple2!2509 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 (v!3091 (underlying!430 thiss!992))))) (_2!1265 (tuple2!2509 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 (v!3091 (underlying!430 thiss!992)))))))))

(declare-fun e!81025 () Bool)

(assert (=> d!37397 e!81025))

(declare-fun res!60141 () Bool)

(assert (=> d!37397 (=> (not res!60141) (not e!81025))))

(assert (=> d!37397 (= res!60141 (isStrictlySorted!302 lt!63564))))

(assert (=> d!37397 (= (lemmaContainsTupThenGetReturnValue!81 lt!63564 (_1!1265 (tuple2!2509 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 (v!3091 (underlying!430 thiss!992))))) (_2!1265 (tuple2!2509 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 (v!3091 (underlying!430 thiss!992)))))) lt!63816)))

(declare-fun b!124017 () Bool)

(declare-fun res!60142 () Bool)

(assert (=> b!124017 (=> (not res!60142) (not e!81025))))

(assert (=> b!124017 (= res!60142 (containsKey!168 lt!63564 (_1!1265 (tuple2!2509 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 (v!3091 (underlying!430 thiss!992)))))))))

(declare-fun b!124018 () Bool)

(assert (=> b!124018 (= e!81025 (contains!857 lt!63564 (tuple2!2509 (_1!1265 (tuple2!2509 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 (v!3091 (underlying!430 thiss!992))))) (_2!1265 (tuple2!2509 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 (v!3091 (underlying!430 thiss!992))))))))))

(assert (= (and d!37397 res!60141) b!124017))

(assert (= (and b!124017 res!60142) b!124018))

(assert (=> d!37397 m!143667))

(declare-fun m!144383 () Bool)

(assert (=> d!37397 m!144383))

(declare-fun m!144385 () Bool)

(assert (=> d!37397 m!144385))

(declare-fun m!144387 () Bool)

(assert (=> b!124017 m!144387))

(declare-fun m!144389 () Bool)

(assert (=> b!124018 m!144389))

(assert (=> d!37147 d!37397))

(declare-fun b!124019 () Bool)

(declare-fun res!60144 () Bool)

(declare-fun e!81029 () Bool)

(assert (=> b!124019 (=> (not res!60144) (not e!81029))))

(declare-fun lt!63817 () List!1670)

(assert (=> b!124019 (= res!60144 (containsKey!168 lt!63817 (_1!1265 (tuple2!2509 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 (v!3091 (underlying!430 thiss!992)))))))))

(declare-fun d!37399 () Bool)

(assert (=> d!37399 e!81029))

(declare-fun res!60143 () Bool)

(assert (=> d!37399 (=> (not res!60143) (not e!81029))))

(assert (=> d!37399 (= res!60143 (isStrictlySorted!302 lt!63817))))

(declare-fun e!81028 () List!1670)

(assert (=> d!37399 (= lt!63817 e!81028)))

(declare-fun c!22567 () Bool)

(assert (=> d!37399 (= c!22567 (and ((_ is Cons!1666) (toList!827 call!13109)) (bvslt (_1!1265 (h!2267 (toList!827 call!13109))) (_1!1265 (tuple2!2509 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 (v!3091 (underlying!430 thiss!992))))))))))

(assert (=> d!37399 (isStrictlySorted!302 (toList!827 call!13109))))

(assert (=> d!37399 (= (insertStrictlySorted!84 (toList!827 call!13109) (_1!1265 (tuple2!2509 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 (v!3091 (underlying!430 thiss!992))))) (_2!1265 (tuple2!2509 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 (v!3091 (underlying!430 thiss!992)))))) lt!63817)))

(declare-fun b!124020 () Bool)

(declare-fun c!22570 () Bool)

(assert (=> b!124020 (= c!22570 (and ((_ is Cons!1666) (toList!827 call!13109)) (bvsgt (_1!1265 (h!2267 (toList!827 call!13109))) (_1!1265 (tuple2!2509 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 (v!3091 (underlying!430 thiss!992))))))))))

(declare-fun e!81026 () List!1670)

(declare-fun e!81030 () List!1670)

(assert (=> b!124020 (= e!81026 e!81030)))

(declare-fun b!124021 () Bool)

(assert (=> b!124021 (= e!81029 (contains!857 lt!63817 (tuple2!2509 (_1!1265 (tuple2!2509 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 (v!3091 (underlying!430 thiss!992))))) (_2!1265 (tuple2!2509 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 (v!3091 (underlying!430 thiss!992))))))))))

(declare-fun c!22569 () Bool)

(declare-fun b!124022 () Bool)

(declare-fun e!81027 () List!1670)

(assert (=> b!124022 (= e!81027 (ite c!22569 (t!5965 (toList!827 call!13109)) (ite c!22570 (Cons!1666 (h!2267 (toList!827 call!13109)) (t!5965 (toList!827 call!13109))) Nil!1667)))))

(declare-fun bm!13145 () Bool)

(declare-fun call!13149 () List!1670)

(declare-fun call!13148 () List!1670)

(assert (=> bm!13145 (= call!13149 call!13148)))

(declare-fun b!124023 () Bool)

(assert (=> b!124023 (= e!81027 (insertStrictlySorted!84 (t!5965 (toList!827 call!13109)) (_1!1265 (tuple2!2509 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 (v!3091 (underlying!430 thiss!992))))) (_2!1265 (tuple2!2509 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 (v!3091 (underlying!430 thiss!992)))))))))

(declare-fun bm!13146 () Bool)

(assert (=> bm!13146 (= call!13148 ($colon$colon!86 e!81027 (ite c!22567 (h!2267 (toList!827 call!13109)) (tuple2!2509 (_1!1265 (tuple2!2509 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 (v!3091 (underlying!430 thiss!992))))) (_2!1265 (tuple2!2509 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 (v!3091 (underlying!430 thiss!992)))))))))))

(declare-fun c!22568 () Bool)

(assert (=> bm!13146 (= c!22568 c!22567)))

(declare-fun b!124024 () Bool)

(assert (=> b!124024 (= e!81028 e!81026)))

(assert (=> b!124024 (= c!22569 (and ((_ is Cons!1666) (toList!827 call!13109)) (= (_1!1265 (h!2267 (toList!827 call!13109))) (_1!1265 (tuple2!2509 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 (v!3091 (underlying!430 thiss!992))))))))))

(declare-fun b!124025 () Bool)

(assert (=> b!124025 (= e!81028 call!13148)))

(declare-fun b!124026 () Bool)

(declare-fun call!13150 () List!1670)

(assert (=> b!124026 (= e!81030 call!13150)))

(declare-fun bm!13147 () Bool)

(assert (=> bm!13147 (= call!13150 call!13149)))

(declare-fun b!124027 () Bool)

(assert (=> b!124027 (= e!81030 call!13150)))

(declare-fun b!124028 () Bool)

(assert (=> b!124028 (= e!81026 call!13149)))

(assert (= (and d!37399 c!22567) b!124025))

(assert (= (and d!37399 (not c!22567)) b!124024))

(assert (= (and b!124024 c!22569) b!124028))

(assert (= (and b!124024 (not c!22569)) b!124020))

(assert (= (and b!124020 c!22570) b!124026))

(assert (= (and b!124020 (not c!22570)) b!124027))

(assert (= (or b!124026 b!124027) bm!13147))

(assert (= (or b!124028 bm!13147) bm!13145))

(assert (= (or b!124025 bm!13145) bm!13146))

(assert (= (and bm!13146 c!22568) b!124023))

(assert (= (and bm!13146 (not c!22568)) b!124022))

(assert (= (and d!37399 res!60143) b!124019))

(assert (= (and b!124019 res!60144) b!124021))

(declare-fun m!144391 () Bool)

(assert (=> b!124023 m!144391))

(declare-fun m!144393 () Bool)

(assert (=> d!37399 m!144393))

(declare-fun m!144395 () Bool)

(assert (=> d!37399 m!144395))

(declare-fun m!144397 () Bool)

(assert (=> b!124019 m!144397))

(declare-fun m!144399 () Bool)

(assert (=> bm!13146 m!144399))

(declare-fun m!144401 () Bool)

(assert (=> b!124021 m!144401))

(assert (=> d!37147 d!37399))

(declare-fun d!37401 () Bool)

(assert (=> d!37401 (= (isDefined!117 (getValueByKey!165 (toList!827 (+!161 lt!63545 (tuple2!2509 lt!63547 (zeroValue!2619 (v!3091 (underlying!430 thiss!992)))))) lt!63543)) (not (isEmpty!397 (getValueByKey!165 (toList!827 (+!161 lt!63545 (tuple2!2509 lt!63547 (zeroValue!2619 (v!3091 (underlying!430 thiss!992)))))) lt!63543))))))

(declare-fun bs!5157 () Bool)

(assert (= bs!5157 d!37401))

(assert (=> bs!5157 m!143895))

(declare-fun m!144403 () Bool)

(assert (=> bs!5157 m!144403))

(assert (=> b!123706 d!37401))

(declare-fun b!124030 () Bool)

(declare-fun e!81031 () Option!171)

(declare-fun e!81032 () Option!171)

(assert (=> b!124030 (= e!81031 e!81032)))

(declare-fun c!22572 () Bool)

(assert (=> b!124030 (= c!22572 (and ((_ is Cons!1666) (toList!827 (+!161 lt!63545 (tuple2!2509 lt!63547 (zeroValue!2619 (v!3091 (underlying!430 thiss!992))))))) (not (= (_1!1265 (h!2267 (toList!827 (+!161 lt!63545 (tuple2!2509 lt!63547 (zeroValue!2619 (v!3091 (underlying!430 thiss!992)))))))) lt!63543))))))

(declare-fun c!22571 () Bool)

(declare-fun d!37403 () Bool)

(assert (=> d!37403 (= c!22571 (and ((_ is Cons!1666) (toList!827 (+!161 lt!63545 (tuple2!2509 lt!63547 (zeroValue!2619 (v!3091 (underlying!430 thiss!992))))))) (= (_1!1265 (h!2267 (toList!827 (+!161 lt!63545 (tuple2!2509 lt!63547 (zeroValue!2619 (v!3091 (underlying!430 thiss!992)))))))) lt!63543)))))

(assert (=> d!37403 (= (getValueByKey!165 (toList!827 (+!161 lt!63545 (tuple2!2509 lt!63547 (zeroValue!2619 (v!3091 (underlying!430 thiss!992)))))) lt!63543) e!81031)))

(declare-fun b!124032 () Bool)

(assert (=> b!124032 (= e!81032 None!169)))

(declare-fun b!124031 () Bool)

(assert (=> b!124031 (= e!81032 (getValueByKey!165 (t!5965 (toList!827 (+!161 lt!63545 (tuple2!2509 lt!63547 (zeroValue!2619 (v!3091 (underlying!430 thiss!992))))))) lt!63543))))

(declare-fun b!124029 () Bool)

(assert (=> b!124029 (= e!81031 (Some!170 (_2!1265 (h!2267 (toList!827 (+!161 lt!63545 (tuple2!2509 lt!63547 (zeroValue!2619 (v!3091 (underlying!430 thiss!992))))))))))))

(assert (= (and d!37403 c!22571) b!124029))

(assert (= (and d!37403 (not c!22571)) b!124030))

(assert (= (and b!124030 c!22572) b!124031))

(assert (= (and b!124030 (not c!22572)) b!124032))

(declare-fun m!144405 () Bool)

(assert (=> b!124031 m!144405))

(assert (=> b!123706 d!37403))

(declare-fun d!37405 () Bool)

(declare-fun lt!63818 () Bool)

(assert (=> d!37405 (= lt!63818 (select (content!123 (toList!827 lt!63640)) (tuple2!2509 lt!63552 (minValue!2619 (v!3091 (underlying!430 thiss!992))))))))

(declare-fun e!81033 () Bool)

(assert (=> d!37405 (= lt!63818 e!81033)))

(declare-fun res!60146 () Bool)

(assert (=> d!37405 (=> (not res!60146) (not e!81033))))

(assert (=> d!37405 (= res!60146 ((_ is Cons!1666) (toList!827 lt!63640)))))

(assert (=> d!37405 (= (contains!857 (toList!827 lt!63640) (tuple2!2509 lt!63552 (minValue!2619 (v!3091 (underlying!430 thiss!992))))) lt!63818)))

(declare-fun b!124033 () Bool)

(declare-fun e!81034 () Bool)

(assert (=> b!124033 (= e!81033 e!81034)))

(declare-fun res!60145 () Bool)

(assert (=> b!124033 (=> res!60145 e!81034)))

(assert (=> b!124033 (= res!60145 (= (h!2267 (toList!827 lt!63640)) (tuple2!2509 lt!63552 (minValue!2619 (v!3091 (underlying!430 thiss!992))))))))

(declare-fun b!124034 () Bool)

(assert (=> b!124034 (= e!81034 (contains!857 (t!5965 (toList!827 lt!63640)) (tuple2!2509 lt!63552 (minValue!2619 (v!3091 (underlying!430 thiss!992))))))))

(assert (= (and d!37405 res!60146) b!124033))

(assert (= (and b!124033 (not res!60145)) b!124034))

(declare-fun m!144407 () Bool)

(assert (=> d!37405 m!144407))

(declare-fun m!144409 () Bool)

(assert (=> d!37405 m!144409))

(declare-fun m!144411 () Bool)

(assert (=> b!124034 m!144411))

(assert (=> b!123698 d!37405))

(declare-fun d!37407 () Bool)

(declare-fun e!81035 () Bool)

(assert (=> d!37407 e!81035))

(declare-fun res!60148 () Bool)

(assert (=> d!37407 (=> (not res!60148) (not e!81035))))

(declare-fun lt!63820 () ListLongMap!1623)

(assert (=> d!37407 (= res!60148 (contains!856 lt!63820 (_1!1265 (tuple2!2509 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 newMap!16)))))))

(declare-fun lt!63822 () List!1670)

(assert (=> d!37407 (= lt!63820 (ListLongMap!1624 lt!63822))))

(declare-fun lt!63821 () Unit!3839)

(declare-fun lt!63819 () Unit!3839)

(assert (=> d!37407 (= lt!63821 lt!63819)))

(assert (=> d!37407 (= (getValueByKey!165 lt!63822 (_1!1265 (tuple2!2509 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 newMap!16)))) (Some!170 (_2!1265 (tuple2!2509 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 newMap!16)))))))

(assert (=> d!37407 (= lt!63819 (lemmaContainsTupThenGetReturnValue!81 lt!63822 (_1!1265 (tuple2!2509 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 newMap!16))) (_2!1265 (tuple2!2509 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 newMap!16)))))))

(assert (=> d!37407 (= lt!63822 (insertStrictlySorted!84 (toList!827 call!13119) (_1!1265 (tuple2!2509 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 newMap!16))) (_2!1265 (tuple2!2509 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 newMap!16)))))))

(assert (=> d!37407 (= (+!161 call!13119 (tuple2!2509 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 newMap!16))) lt!63820)))

(declare-fun b!124035 () Bool)

(declare-fun res!60147 () Bool)

(assert (=> b!124035 (=> (not res!60147) (not e!81035))))

(assert (=> b!124035 (= res!60147 (= (getValueByKey!165 (toList!827 lt!63820) (_1!1265 (tuple2!2509 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 newMap!16)))) (Some!170 (_2!1265 (tuple2!2509 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 newMap!16))))))))

(declare-fun b!124036 () Bool)

(assert (=> b!124036 (= e!81035 (contains!857 (toList!827 lt!63820) (tuple2!2509 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 newMap!16))))))

(assert (= (and d!37407 res!60148) b!124035))

(assert (= (and b!124035 res!60147) b!124036))

(declare-fun m!144413 () Bool)

(assert (=> d!37407 m!144413))

(declare-fun m!144415 () Bool)

(assert (=> d!37407 m!144415))

(declare-fun m!144417 () Bool)

(assert (=> d!37407 m!144417))

(declare-fun m!144419 () Bool)

(assert (=> d!37407 m!144419))

(declare-fun m!144421 () Bool)

(assert (=> b!124035 m!144421))

(declare-fun m!144423 () Bool)

(assert (=> b!124036 m!144423))

(assert (=> b!123626 d!37407))

(declare-fun d!37409 () Bool)

(declare-fun e!81036 () Bool)

(assert (=> d!37409 e!81036))

(declare-fun res!60149 () Bool)

(assert (=> d!37409 (=> res!60149 e!81036)))

(declare-fun lt!63823 () Bool)

(assert (=> d!37409 (= res!60149 (not lt!63823))))

(declare-fun lt!63824 () Bool)

(assert (=> d!37409 (= lt!63823 lt!63824)))

(declare-fun lt!63825 () Unit!3839)

(declare-fun e!81037 () Unit!3839)

(assert (=> d!37409 (= lt!63825 e!81037)))

(declare-fun c!22573 () Bool)

(assert (=> d!37409 (= c!22573 lt!63824)))

(assert (=> d!37409 (= lt!63824 (containsKey!168 (toList!827 lt!63644) (_1!1265 (tuple2!2509 lt!63538 (minValue!2619 (v!3091 (underlying!430 thiss!992)))))))))

(assert (=> d!37409 (= (contains!856 lt!63644 (_1!1265 (tuple2!2509 lt!63538 (minValue!2619 (v!3091 (underlying!430 thiss!992)))))) lt!63823)))

(declare-fun b!124037 () Bool)

(declare-fun lt!63826 () Unit!3839)

(assert (=> b!124037 (= e!81037 lt!63826)))

(assert (=> b!124037 (= lt!63826 (lemmaContainsKeyImpliesGetValueByKeyDefined!116 (toList!827 lt!63644) (_1!1265 (tuple2!2509 lt!63538 (minValue!2619 (v!3091 (underlying!430 thiss!992)))))))))

(assert (=> b!124037 (isDefined!117 (getValueByKey!165 (toList!827 lt!63644) (_1!1265 (tuple2!2509 lt!63538 (minValue!2619 (v!3091 (underlying!430 thiss!992)))))))))

(declare-fun b!124038 () Bool)

(declare-fun Unit!3861 () Unit!3839)

(assert (=> b!124038 (= e!81037 Unit!3861)))

(declare-fun b!124039 () Bool)

(assert (=> b!124039 (= e!81036 (isDefined!117 (getValueByKey!165 (toList!827 lt!63644) (_1!1265 (tuple2!2509 lt!63538 (minValue!2619 (v!3091 (underlying!430 thiss!992))))))))))

(assert (= (and d!37409 c!22573) b!124037))

(assert (= (and d!37409 (not c!22573)) b!124038))

(assert (= (and d!37409 (not res!60149)) b!124039))

(declare-fun m!144425 () Bool)

(assert (=> d!37409 m!144425))

(declare-fun m!144427 () Bool)

(assert (=> b!124037 m!144427))

(assert (=> b!124037 m!143867))

(assert (=> b!124037 m!143867))

(declare-fun m!144429 () Bool)

(assert (=> b!124037 m!144429))

(assert (=> b!124039 m!143867))

(assert (=> b!124039 m!143867))

(assert (=> b!124039 m!144429))

(assert (=> d!37191 d!37409))

(declare-fun b!124041 () Bool)

(declare-fun e!81038 () Option!171)

(declare-fun e!81039 () Option!171)

(assert (=> b!124041 (= e!81038 e!81039)))

(declare-fun c!22575 () Bool)

(assert (=> b!124041 (= c!22575 (and ((_ is Cons!1666) lt!63646) (not (= (_1!1265 (h!2267 lt!63646)) (_1!1265 (tuple2!2509 lt!63538 (minValue!2619 (v!3091 (underlying!430 thiss!992)))))))))))

(declare-fun d!37411 () Bool)

(declare-fun c!22574 () Bool)

(assert (=> d!37411 (= c!22574 (and ((_ is Cons!1666) lt!63646) (= (_1!1265 (h!2267 lt!63646)) (_1!1265 (tuple2!2509 lt!63538 (minValue!2619 (v!3091 (underlying!430 thiss!992))))))))))

(assert (=> d!37411 (= (getValueByKey!165 lt!63646 (_1!1265 (tuple2!2509 lt!63538 (minValue!2619 (v!3091 (underlying!430 thiss!992)))))) e!81038)))

(declare-fun b!124043 () Bool)

(assert (=> b!124043 (= e!81039 None!169)))

(declare-fun b!124042 () Bool)

(assert (=> b!124042 (= e!81039 (getValueByKey!165 (t!5965 lt!63646) (_1!1265 (tuple2!2509 lt!63538 (minValue!2619 (v!3091 (underlying!430 thiss!992)))))))))

(declare-fun b!124040 () Bool)

(assert (=> b!124040 (= e!81038 (Some!170 (_2!1265 (h!2267 lt!63646))))))

(assert (= (and d!37411 c!22574) b!124040))

(assert (= (and d!37411 (not c!22574)) b!124041))

(assert (= (and b!124041 c!22575) b!124042))

(assert (= (and b!124041 (not c!22575)) b!124043))

(declare-fun m!144431 () Bool)

(assert (=> b!124042 m!144431))

(assert (=> d!37191 d!37411))

(declare-fun d!37413 () Bool)

(assert (=> d!37413 (= (getValueByKey!165 lt!63646 (_1!1265 (tuple2!2509 lt!63538 (minValue!2619 (v!3091 (underlying!430 thiss!992)))))) (Some!170 (_2!1265 (tuple2!2509 lt!63538 (minValue!2619 (v!3091 (underlying!430 thiss!992)))))))))

(declare-fun lt!63827 () Unit!3839)

(assert (=> d!37413 (= lt!63827 (choose!751 lt!63646 (_1!1265 (tuple2!2509 lt!63538 (minValue!2619 (v!3091 (underlying!430 thiss!992))))) (_2!1265 (tuple2!2509 lt!63538 (minValue!2619 (v!3091 (underlying!430 thiss!992)))))))))

(declare-fun e!81040 () Bool)

(assert (=> d!37413 e!81040))

(declare-fun res!60150 () Bool)

(assert (=> d!37413 (=> (not res!60150) (not e!81040))))

(assert (=> d!37413 (= res!60150 (isStrictlySorted!302 lt!63646))))

(assert (=> d!37413 (= (lemmaContainsTupThenGetReturnValue!81 lt!63646 (_1!1265 (tuple2!2509 lt!63538 (minValue!2619 (v!3091 (underlying!430 thiss!992))))) (_2!1265 (tuple2!2509 lt!63538 (minValue!2619 (v!3091 (underlying!430 thiss!992)))))) lt!63827)))

(declare-fun b!124044 () Bool)

(declare-fun res!60151 () Bool)

(assert (=> b!124044 (=> (not res!60151) (not e!81040))))

(assert (=> b!124044 (= res!60151 (containsKey!168 lt!63646 (_1!1265 (tuple2!2509 lt!63538 (minValue!2619 (v!3091 (underlying!430 thiss!992)))))))))

(declare-fun b!124045 () Bool)

(assert (=> b!124045 (= e!81040 (contains!857 lt!63646 (tuple2!2509 (_1!1265 (tuple2!2509 lt!63538 (minValue!2619 (v!3091 (underlying!430 thiss!992))))) (_2!1265 (tuple2!2509 lt!63538 (minValue!2619 (v!3091 (underlying!430 thiss!992))))))))))

(assert (= (and d!37413 res!60150) b!124044))

(assert (= (and b!124044 res!60151) b!124045))

(assert (=> d!37413 m!143861))

(declare-fun m!144433 () Bool)

(assert (=> d!37413 m!144433))

(declare-fun m!144435 () Bool)

(assert (=> d!37413 m!144435))

(declare-fun m!144437 () Bool)

(assert (=> b!124044 m!144437))

(declare-fun m!144439 () Bool)

(assert (=> b!124045 m!144439))

(assert (=> d!37191 d!37413))

(declare-fun b!124046 () Bool)

(declare-fun res!60153 () Bool)

(declare-fun e!81044 () Bool)

(assert (=> b!124046 (=> (not res!60153) (not e!81044))))

(declare-fun lt!63828 () List!1670)

(assert (=> b!124046 (= res!60153 (containsKey!168 lt!63828 (_1!1265 (tuple2!2509 lt!63538 (minValue!2619 (v!3091 (underlying!430 thiss!992)))))))))

(declare-fun d!37415 () Bool)

(assert (=> d!37415 e!81044))

(declare-fun res!60152 () Bool)

(assert (=> d!37415 (=> (not res!60152) (not e!81044))))

(assert (=> d!37415 (= res!60152 (isStrictlySorted!302 lt!63828))))

(declare-fun e!81043 () List!1670)

(assert (=> d!37415 (= lt!63828 e!81043)))

(declare-fun c!22576 () Bool)

(assert (=> d!37415 (= c!22576 (and ((_ is Cons!1666) (toList!827 lt!63534)) (bvslt (_1!1265 (h!2267 (toList!827 lt!63534))) (_1!1265 (tuple2!2509 lt!63538 (minValue!2619 (v!3091 (underlying!430 thiss!992))))))))))

(assert (=> d!37415 (isStrictlySorted!302 (toList!827 lt!63534))))

(assert (=> d!37415 (= (insertStrictlySorted!84 (toList!827 lt!63534) (_1!1265 (tuple2!2509 lt!63538 (minValue!2619 (v!3091 (underlying!430 thiss!992))))) (_2!1265 (tuple2!2509 lt!63538 (minValue!2619 (v!3091 (underlying!430 thiss!992)))))) lt!63828)))

(declare-fun b!124047 () Bool)

(declare-fun c!22579 () Bool)

(assert (=> b!124047 (= c!22579 (and ((_ is Cons!1666) (toList!827 lt!63534)) (bvsgt (_1!1265 (h!2267 (toList!827 lt!63534))) (_1!1265 (tuple2!2509 lt!63538 (minValue!2619 (v!3091 (underlying!430 thiss!992))))))))))

(declare-fun e!81041 () List!1670)

(declare-fun e!81045 () List!1670)

(assert (=> b!124047 (= e!81041 e!81045)))

(declare-fun b!124048 () Bool)

(assert (=> b!124048 (= e!81044 (contains!857 lt!63828 (tuple2!2509 (_1!1265 (tuple2!2509 lt!63538 (minValue!2619 (v!3091 (underlying!430 thiss!992))))) (_2!1265 (tuple2!2509 lt!63538 (minValue!2619 (v!3091 (underlying!430 thiss!992))))))))))

(declare-fun c!22578 () Bool)

(declare-fun b!124049 () Bool)

(declare-fun e!81042 () List!1670)

(assert (=> b!124049 (= e!81042 (ite c!22578 (t!5965 (toList!827 lt!63534)) (ite c!22579 (Cons!1666 (h!2267 (toList!827 lt!63534)) (t!5965 (toList!827 lt!63534))) Nil!1667)))))

(declare-fun bm!13148 () Bool)

(declare-fun call!13152 () List!1670)

(declare-fun call!13151 () List!1670)

(assert (=> bm!13148 (= call!13152 call!13151)))

(declare-fun b!124050 () Bool)

(assert (=> b!124050 (= e!81042 (insertStrictlySorted!84 (t!5965 (toList!827 lt!63534)) (_1!1265 (tuple2!2509 lt!63538 (minValue!2619 (v!3091 (underlying!430 thiss!992))))) (_2!1265 (tuple2!2509 lt!63538 (minValue!2619 (v!3091 (underlying!430 thiss!992)))))))))

(declare-fun bm!13149 () Bool)

(assert (=> bm!13149 (= call!13151 ($colon$colon!86 e!81042 (ite c!22576 (h!2267 (toList!827 lt!63534)) (tuple2!2509 (_1!1265 (tuple2!2509 lt!63538 (minValue!2619 (v!3091 (underlying!430 thiss!992))))) (_2!1265 (tuple2!2509 lt!63538 (minValue!2619 (v!3091 (underlying!430 thiss!992)))))))))))

(declare-fun c!22577 () Bool)

(assert (=> bm!13149 (= c!22577 c!22576)))

(declare-fun b!124051 () Bool)

(assert (=> b!124051 (= e!81043 e!81041)))

(assert (=> b!124051 (= c!22578 (and ((_ is Cons!1666) (toList!827 lt!63534)) (= (_1!1265 (h!2267 (toList!827 lt!63534))) (_1!1265 (tuple2!2509 lt!63538 (minValue!2619 (v!3091 (underlying!430 thiss!992))))))))))

(declare-fun b!124052 () Bool)

(assert (=> b!124052 (= e!81043 call!13151)))

(declare-fun b!124053 () Bool)

(declare-fun call!13153 () List!1670)

(assert (=> b!124053 (= e!81045 call!13153)))

(declare-fun bm!13150 () Bool)

(assert (=> bm!13150 (= call!13153 call!13152)))

(declare-fun b!124054 () Bool)

(assert (=> b!124054 (= e!81045 call!13153)))

(declare-fun b!124055 () Bool)

(assert (=> b!124055 (= e!81041 call!13152)))

(assert (= (and d!37415 c!22576) b!124052))

(assert (= (and d!37415 (not c!22576)) b!124051))

(assert (= (and b!124051 c!22578) b!124055))

(assert (= (and b!124051 (not c!22578)) b!124047))

(assert (= (and b!124047 c!22579) b!124053))

(assert (= (and b!124047 (not c!22579)) b!124054))

(assert (= (or b!124053 b!124054) bm!13150))

(assert (= (or b!124055 bm!13150) bm!13148))

(assert (= (or b!124052 bm!13148) bm!13149))

(assert (= (and bm!13149 c!22577) b!124050))

(assert (= (and bm!13149 (not c!22577)) b!124049))

(assert (= (and d!37415 res!60152) b!124046))

(assert (= (and b!124046 res!60153) b!124048))

(declare-fun m!144441 () Bool)

(assert (=> b!124050 m!144441))

(declare-fun m!144443 () Bool)

(assert (=> d!37415 m!144443))

(declare-fun m!144445 () Bool)

(assert (=> d!37415 m!144445))

(declare-fun m!144447 () Bool)

(assert (=> b!124046 m!144447))

(declare-fun m!144449 () Bool)

(assert (=> bm!13149 m!144449))

(declare-fun m!144451 () Bool)

(assert (=> b!124048 m!144451))

(assert (=> d!37191 d!37415))

(declare-fun d!37417 () Bool)

(assert (=> d!37417 (= (get!1435 (getValueByKey!165 (toList!827 lt!63541) #b1000000000000000000000000000000000000000000000000000000000000000)) (v!3096 (getValueByKey!165 (toList!827 lt!63541) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!37173 d!37417))

(assert (=> d!37173 d!37307))

(declare-fun lt!63829 () Bool)

(declare-fun d!37419 () Bool)

(assert (=> d!37419 (= lt!63829 (select (content!123 (toList!827 lt!63657)) (tuple2!2509 lt!63547 (zeroValue!2619 (v!3091 (underlying!430 thiss!992))))))))

(declare-fun e!81046 () Bool)

(assert (=> d!37419 (= lt!63829 e!81046)))

(declare-fun res!60155 () Bool)

(assert (=> d!37419 (=> (not res!60155) (not e!81046))))

(assert (=> d!37419 (= res!60155 ((_ is Cons!1666) (toList!827 lt!63657)))))

(assert (=> d!37419 (= (contains!857 (toList!827 lt!63657) (tuple2!2509 lt!63547 (zeroValue!2619 (v!3091 (underlying!430 thiss!992))))) lt!63829)))

(declare-fun b!124056 () Bool)

(declare-fun e!81047 () Bool)

(assert (=> b!124056 (= e!81046 e!81047)))

(declare-fun res!60154 () Bool)

(assert (=> b!124056 (=> res!60154 e!81047)))

(assert (=> b!124056 (= res!60154 (= (h!2267 (toList!827 lt!63657)) (tuple2!2509 lt!63547 (zeroValue!2619 (v!3091 (underlying!430 thiss!992))))))))

(declare-fun b!124057 () Bool)

(assert (=> b!124057 (= e!81047 (contains!857 (t!5965 (toList!827 lt!63657)) (tuple2!2509 lt!63547 (zeroValue!2619 (v!3091 (underlying!430 thiss!992))))))))

(assert (= (and d!37419 res!60155) b!124056))

(assert (= (and b!124056 (not res!60154)) b!124057))

(declare-fun m!144453 () Bool)

(assert (=> d!37419 m!144453))

(declare-fun m!144455 () Bool)

(assert (=> d!37419 m!144455))

(declare-fun m!144457 () Bool)

(assert (=> b!124057 m!144457))

(assert (=> b!123708 d!37419))

(assert (=> b!123649 d!37277))

(declare-fun d!37421 () Bool)

(assert (=> d!37421 (isDefined!117 (getValueByKey!165 (toList!827 (+!161 lt!63545 (tuple2!2509 lt!63547 (zeroValue!2619 (v!3091 (underlying!430 thiss!992)))))) lt!63543))))

(declare-fun lt!63830 () Unit!3839)

(assert (=> d!37421 (= lt!63830 (choose!752 (toList!827 (+!161 lt!63545 (tuple2!2509 lt!63547 (zeroValue!2619 (v!3091 (underlying!430 thiss!992)))))) lt!63543))))

(declare-fun e!81048 () Bool)

(assert (=> d!37421 e!81048))

(declare-fun res!60156 () Bool)

(assert (=> d!37421 (=> (not res!60156) (not e!81048))))

(assert (=> d!37421 (= res!60156 (isStrictlySorted!302 (toList!827 (+!161 lt!63545 (tuple2!2509 lt!63547 (zeroValue!2619 (v!3091 (underlying!430 thiss!992))))))))))

(assert (=> d!37421 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!116 (toList!827 (+!161 lt!63545 (tuple2!2509 lt!63547 (zeroValue!2619 (v!3091 (underlying!430 thiss!992)))))) lt!63543) lt!63830)))

(declare-fun b!124058 () Bool)

(assert (=> b!124058 (= e!81048 (containsKey!168 (toList!827 (+!161 lt!63545 (tuple2!2509 lt!63547 (zeroValue!2619 (v!3091 (underlying!430 thiss!992)))))) lt!63543))))

(assert (= (and d!37421 res!60156) b!124058))

(assert (=> d!37421 m!143895))

(assert (=> d!37421 m!143895))

(assert (=> d!37421 m!143897))

(declare-fun m!144459 () Bool)

(assert (=> d!37421 m!144459))

(declare-fun m!144461 () Bool)

(assert (=> d!37421 m!144461))

(assert (=> b!124058 m!143891))

(assert (=> b!123704 d!37421))

(assert (=> b!123704 d!37401))

(assert (=> b!123704 d!37403))

(declare-fun d!37423 () Bool)

(declare-fun e!81049 () Bool)

(assert (=> d!37423 e!81049))

(declare-fun res!60157 () Bool)

(assert (=> d!37423 (=> res!60157 e!81049)))

(declare-fun lt!63831 () Bool)

(assert (=> d!37423 (= res!60157 (not lt!63831))))

(declare-fun lt!63832 () Bool)

(assert (=> d!37423 (= lt!63831 lt!63832)))

(declare-fun lt!63833 () Unit!3839)

(declare-fun e!81050 () Unit!3839)

(assert (=> d!37423 (= lt!63833 e!81050)))

(declare-fun c!22580 () Bool)

(assert (=> d!37423 (= c!22580 lt!63832)))

(assert (=> d!37423 (= lt!63832 (containsKey!168 (toList!827 lt!63595) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!37423 (= (contains!856 lt!63595 #b1000000000000000000000000000000000000000000000000000000000000000) lt!63831)))

(declare-fun b!124059 () Bool)

(declare-fun lt!63834 () Unit!3839)

(assert (=> b!124059 (= e!81050 lt!63834)))

(assert (=> b!124059 (= lt!63834 (lemmaContainsKeyImpliesGetValueByKeyDefined!116 (toList!827 lt!63595) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!124059 (isDefined!117 (getValueByKey!165 (toList!827 lt!63595) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!124060 () Bool)

(declare-fun Unit!3862 () Unit!3839)

(assert (=> b!124060 (= e!81050 Unit!3862)))

(declare-fun b!124061 () Bool)

(assert (=> b!124061 (= e!81049 (isDefined!117 (getValueByKey!165 (toList!827 lt!63595) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!37423 c!22580) b!124059))

(assert (= (and d!37423 (not c!22580)) b!124060))

(assert (= (and d!37423 (not res!60157)) b!124061))

(declare-fun m!144463 () Bool)

(assert (=> d!37423 m!144463))

(declare-fun m!144465 () Bool)

(assert (=> b!124059 m!144465))

(assert (=> b!124059 m!144363))

(assert (=> b!124059 m!144363))

(declare-fun m!144467 () Bool)

(assert (=> b!124059 m!144467))

(assert (=> b!124061 m!144363))

(assert (=> b!124061 m!144363))

(assert (=> b!124061 m!144467))

(assert (=> bm!13114 d!37423))

(assert (=> bm!13116 d!37373))

(declare-fun b!124062 () Bool)

(declare-fun e!81053 () Bool)

(declare-fun call!13154 () Bool)

(assert (=> b!124062 (= e!81053 call!13154)))

(declare-fun c!22581 () Bool)

(declare-fun bm!13151 () Bool)

(assert (=> bm!13151 (= call!13154 (arrayNoDuplicates!0 (_keys!4481 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!22581 (Cons!1667 (select (arr!2198 (_keys!4481 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!22445 (Cons!1667 (select (arr!2198 (_keys!4481 newMap!16)) #b00000000000000000000000000000000) Nil!1668) Nil!1668)) (ite c!22445 (Cons!1667 (select (arr!2198 (_keys!4481 newMap!16)) #b00000000000000000000000000000000) Nil!1668) Nil!1668))))))

(declare-fun b!124063 () Bool)

(declare-fun e!81051 () Bool)

(declare-fun e!81052 () Bool)

(assert (=> b!124063 (= e!81051 e!81052)))

(declare-fun res!60159 () Bool)

(assert (=> b!124063 (=> (not res!60159) (not e!81052))))

(declare-fun e!81054 () Bool)

(assert (=> b!124063 (= res!60159 (not e!81054))))

(declare-fun res!60158 () Bool)

(assert (=> b!124063 (=> (not res!60158) (not e!81054))))

(assert (=> b!124063 (= res!60158 (validKeyInArray!0 (select (arr!2198 (_keys!4481 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!124064 () Bool)

(assert (=> b!124064 (= e!81053 call!13154)))

(declare-fun d!37425 () Bool)

(declare-fun res!60160 () Bool)

(assert (=> d!37425 (=> res!60160 e!81051)))

(assert (=> d!37425 (= res!60160 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2460 (_keys!4481 newMap!16))))))

(assert (=> d!37425 (= (arrayNoDuplicates!0 (_keys!4481 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!22445 (Cons!1667 (select (arr!2198 (_keys!4481 newMap!16)) #b00000000000000000000000000000000) Nil!1668) Nil!1668)) e!81051)))

(declare-fun b!124065 () Bool)

(assert (=> b!124065 (= e!81054 (contains!858 (ite c!22445 (Cons!1667 (select (arr!2198 (_keys!4481 newMap!16)) #b00000000000000000000000000000000) Nil!1668) Nil!1668) (select (arr!2198 (_keys!4481 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!124066 () Bool)

(assert (=> b!124066 (= e!81052 e!81053)))

(assert (=> b!124066 (= c!22581 (validKeyInArray!0 (select (arr!2198 (_keys!4481 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!37425 (not res!60160)) b!124063))

(assert (= (and b!124063 res!60158) b!124065))

(assert (= (and b!124063 res!60159) b!124066))

(assert (= (and b!124066 c!22581) b!124062))

(assert (= (and b!124066 (not c!22581)) b!124064))

(assert (= (or b!124062 b!124064) bm!13151))

(assert (=> bm!13151 m!144017))

(declare-fun m!144469 () Bool)

(assert (=> bm!13151 m!144469))

(assert (=> b!124063 m!144017))

(assert (=> b!124063 m!144017))

(assert (=> b!124063 m!144025))

(assert (=> b!124065 m!144017))

(assert (=> b!124065 m!144017))

(declare-fun m!144471 () Bool)

(assert (=> b!124065 m!144471))

(assert (=> b!124066 m!144017))

(assert (=> b!124066 m!144017))

(assert (=> b!124066 m!144025))

(assert (=> bm!13109 d!37425))

(declare-fun b!124067 () Bool)

(declare-fun e!81056 () (_ BitVec 32))

(declare-fun e!81055 () (_ BitVec 32))

(assert (=> b!124067 (= e!81056 e!81055)))

(declare-fun c!22583 () Bool)

(assert (=> b!124067 (= c!22583 (validKeyInArray!0 (select (arr!2198 (_keys!4481 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!124068 () Bool)

(declare-fun call!13155 () (_ BitVec 32))

(assert (=> b!124068 (= e!81055 (bvadd #b00000000000000000000000000000001 call!13155))))

(declare-fun bm!13152 () Bool)

(assert (=> bm!13152 (= call!13155 (arrayCountValidKeys!0 (_keys!4481 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!2460 (_keys!4481 newMap!16))))))

(declare-fun b!124069 () Bool)

(assert (=> b!124069 (= e!81055 call!13155)))

(declare-fun b!124070 () Bool)

(assert (=> b!124070 (= e!81056 #b00000000000000000000000000000000)))

(declare-fun d!37427 () Bool)

(declare-fun lt!63835 () (_ BitVec 32))

(assert (=> d!37427 (and (bvsge lt!63835 #b00000000000000000000000000000000) (bvsle lt!63835 (bvsub (size!2460 (_keys!4481 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> d!37427 (= lt!63835 e!81056)))

(declare-fun c!22582 () Bool)

(assert (=> d!37427 (= c!22582 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2460 (_keys!4481 newMap!16))))))

(assert (=> d!37427 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2460 (_keys!4481 newMap!16))) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (size!2460 (_keys!4481 newMap!16)) (size!2460 (_keys!4481 newMap!16))))))

(assert (=> d!37427 (= (arrayCountValidKeys!0 (_keys!4481 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2460 (_keys!4481 newMap!16))) lt!63835)))

(assert (= (and d!37427 c!22582) b!124070))

(assert (= (and d!37427 (not c!22582)) b!124067))

(assert (= (and b!124067 c!22583) b!124068))

(assert (= (and b!124067 (not c!22583)) b!124069))

(assert (= (or b!124068 b!124069) bm!13152))

(assert (=> b!124067 m!144017))

(assert (=> b!124067 m!144017))

(assert (=> b!124067 m!144025))

(declare-fun m!144473 () Bool)

(assert (=> bm!13152 m!144473))

(assert (=> bm!13125 d!37427))

(declare-fun b!124071 () Bool)

(declare-fun e!81059 () Bool)

(declare-fun call!13156 () Bool)

(assert (=> b!124071 (= e!81059 call!13156)))

(declare-fun bm!13153 () Bool)

(declare-fun c!22584 () Bool)

(assert (=> bm!13153 (= call!13156 (arrayNoDuplicates!0 (_keys!4481 (v!3091 (underlying!430 thiss!992))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!22584 (Cons!1667 (select (arr!2198 (_keys!4481 (v!3091 (underlying!430 thiss!992)))) #b00000000000000000000000000000000) Nil!1668) Nil!1668)))))

(declare-fun b!124072 () Bool)

(declare-fun e!81057 () Bool)

(declare-fun e!81058 () Bool)

(assert (=> b!124072 (= e!81057 e!81058)))

(declare-fun res!60162 () Bool)

(assert (=> b!124072 (=> (not res!60162) (not e!81058))))

(declare-fun e!81060 () Bool)

(assert (=> b!124072 (= res!60162 (not e!81060))))

(declare-fun res!60161 () Bool)

(assert (=> b!124072 (=> (not res!60161) (not e!81060))))

(assert (=> b!124072 (= res!60161 (validKeyInArray!0 (select (arr!2198 (_keys!4481 (v!3091 (underlying!430 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun b!124073 () Bool)

(assert (=> b!124073 (= e!81059 call!13156)))

(declare-fun d!37429 () Bool)

(declare-fun res!60163 () Bool)

(assert (=> d!37429 (=> res!60163 e!81057)))

(assert (=> d!37429 (= res!60163 (bvsge #b00000000000000000000000000000000 (size!2460 (_keys!4481 (v!3091 (underlying!430 thiss!992))))))))

(assert (=> d!37429 (= (arrayNoDuplicates!0 (_keys!4481 (v!3091 (underlying!430 thiss!992))) #b00000000000000000000000000000000 Nil!1668) e!81057)))

(declare-fun b!124074 () Bool)

(assert (=> b!124074 (= e!81060 (contains!858 Nil!1668 (select (arr!2198 (_keys!4481 (v!3091 (underlying!430 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun b!124075 () Bool)

(assert (=> b!124075 (= e!81058 e!81059)))

(assert (=> b!124075 (= c!22584 (validKeyInArray!0 (select (arr!2198 (_keys!4481 (v!3091 (underlying!430 thiss!992)))) #b00000000000000000000000000000000)))))

(assert (= (and d!37429 (not res!60163)) b!124072))

(assert (= (and b!124072 res!60161) b!124074))

(assert (= (and b!124072 res!60162) b!124075))

(assert (= (and b!124075 c!22584) b!124071))

(assert (= (and b!124075 (not c!22584)) b!124073))

(assert (= (or b!124071 b!124073) bm!13153))

(assert (=> bm!13153 m!144091))

(declare-fun m!144475 () Bool)

(assert (=> bm!13153 m!144475))

(assert (=> b!124072 m!144091))

(assert (=> b!124072 m!144091))

(assert (=> b!124072 m!144099))

(assert (=> b!124074 m!144091))

(assert (=> b!124074 m!144091))

(declare-fun m!144477 () Bool)

(assert (=> b!124074 m!144477))

(assert (=> b!124075 m!144091))

(assert (=> b!124075 m!144091))

(assert (=> b!124075 m!144099))

(assert (=> b!123618 d!37429))

(assert (=> b!123680 d!37349))

(declare-fun lt!63836 () Bool)

(declare-fun d!37431 () Bool)

(assert (=> d!37431 (= lt!63836 (select (content!123 (toList!827 lt!63582)) (ite (or c!22432 c!22430) (tuple2!2509 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2619 (v!3091 (underlying!430 thiss!992)))) (tuple2!2509 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 (v!3091 (underlying!430 thiss!992)))))))))

(declare-fun e!81061 () Bool)

(assert (=> d!37431 (= lt!63836 e!81061)))

(declare-fun res!60165 () Bool)

(assert (=> d!37431 (=> (not res!60165) (not e!81061))))

(assert (=> d!37431 (= res!60165 ((_ is Cons!1666) (toList!827 lt!63582)))))

(assert (=> d!37431 (= (contains!857 (toList!827 lt!63582) (ite (or c!22432 c!22430) (tuple2!2509 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2619 (v!3091 (underlying!430 thiss!992)))) (tuple2!2509 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 (v!3091 (underlying!430 thiss!992)))))) lt!63836)))

(declare-fun b!124076 () Bool)

(declare-fun e!81062 () Bool)

(assert (=> b!124076 (= e!81061 e!81062)))

(declare-fun res!60164 () Bool)

(assert (=> b!124076 (=> res!60164 e!81062)))

(assert (=> b!124076 (= res!60164 (= (h!2267 (toList!827 lt!63582)) (ite (or c!22432 c!22430) (tuple2!2509 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2619 (v!3091 (underlying!430 thiss!992)))) (tuple2!2509 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 (v!3091 (underlying!430 thiss!992)))))))))

(declare-fun b!124077 () Bool)

(assert (=> b!124077 (= e!81062 (contains!857 (t!5965 (toList!827 lt!63582)) (ite (or c!22432 c!22430) (tuple2!2509 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2619 (v!3091 (underlying!430 thiss!992)))) (tuple2!2509 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 (v!3091 (underlying!430 thiss!992)))))))))

(assert (= (and d!37431 res!60165) b!124076))

(assert (= (and b!124076 (not res!60164)) b!124077))

(declare-fun m!144479 () Bool)

(assert (=> d!37431 m!144479))

(declare-fun m!144481 () Bool)

(assert (=> d!37431 m!144481))

(declare-fun m!144483 () Bool)

(assert (=> b!124077 m!144483))

(assert (=> b!123615 d!37431))

(declare-fun d!37433 () Bool)

(assert (=> d!37433 (= (get!1435 (getValueByKey!165 (toList!827 lt!63551) lt!63536)) (v!3096 (getValueByKey!165 (toList!827 lt!63551) lt!63536)))))

(assert (=> d!37193 d!37433))

(declare-fun b!124079 () Bool)

(declare-fun e!81063 () Option!171)

(declare-fun e!81064 () Option!171)

(assert (=> b!124079 (= e!81063 e!81064)))

(declare-fun c!22586 () Bool)

(assert (=> b!124079 (= c!22586 (and ((_ is Cons!1666) (toList!827 lt!63551)) (not (= (_1!1265 (h!2267 (toList!827 lt!63551))) lt!63536))))))

(declare-fun d!37435 () Bool)

(declare-fun c!22585 () Bool)

(assert (=> d!37435 (= c!22585 (and ((_ is Cons!1666) (toList!827 lt!63551)) (= (_1!1265 (h!2267 (toList!827 lt!63551))) lt!63536)))))

(assert (=> d!37435 (= (getValueByKey!165 (toList!827 lt!63551) lt!63536) e!81063)))

(declare-fun b!124081 () Bool)

(assert (=> b!124081 (= e!81064 None!169)))

(declare-fun b!124080 () Bool)

(assert (=> b!124080 (= e!81064 (getValueByKey!165 (t!5965 (toList!827 lt!63551)) lt!63536))))

(declare-fun b!124078 () Bool)

(assert (=> b!124078 (= e!81063 (Some!170 (_2!1265 (h!2267 (toList!827 lt!63551)))))))

(assert (= (and d!37435 c!22585) b!124078))

(assert (= (and d!37435 (not c!22585)) b!124079))

(assert (= (and b!124079 c!22586) b!124080))

(assert (= (and b!124079 (not c!22586)) b!124081))

(declare-fun m!144485 () Bool)

(assert (=> b!124080 m!144485))

(assert (=> d!37193 d!37435))

(declare-fun d!37437 () Bool)

(declare-fun res!60170 () Bool)

(declare-fun e!81069 () Bool)

(assert (=> d!37437 (=> res!60170 e!81069)))

(assert (=> d!37437 (= res!60170 (and ((_ is Cons!1666) (toList!827 lt!63541)) (= (_1!1265 (h!2267 (toList!827 lt!63541))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!37437 (= (containsKey!168 (toList!827 lt!63541) #b1000000000000000000000000000000000000000000000000000000000000000) e!81069)))

(declare-fun b!124086 () Bool)

(declare-fun e!81070 () Bool)

(assert (=> b!124086 (= e!81069 e!81070)))

(declare-fun res!60171 () Bool)

(assert (=> b!124086 (=> (not res!60171) (not e!81070))))

(assert (=> b!124086 (= res!60171 (and (or (not ((_ is Cons!1666) (toList!827 lt!63541))) (bvsle (_1!1265 (h!2267 (toList!827 lt!63541))) #b1000000000000000000000000000000000000000000000000000000000000000)) ((_ is Cons!1666) (toList!827 lt!63541)) (bvslt (_1!1265 (h!2267 (toList!827 lt!63541))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!124087 () Bool)

(assert (=> b!124087 (= e!81070 (containsKey!168 (t!5965 (toList!827 lt!63541)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!37437 (not res!60170)) b!124086))

(assert (= (and b!124086 res!60171) b!124087))

(declare-fun m!144487 () Bool)

(assert (=> b!124087 m!144487))

(assert (=> d!37157 d!37437))

(declare-fun d!37439 () Bool)

(declare-fun res!60172 () Bool)

(declare-fun e!81071 () Bool)

(assert (=> d!37439 (=> res!60172 e!81071)))

(assert (=> d!37439 (= res!60172 (and ((_ is Cons!1666) (toList!827 lt!63541)) (= (_1!1265 (h!2267 (toList!827 lt!63541))) (select (arr!2198 (_keys!4481 (v!3091 (underlying!430 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(assert (=> d!37439 (= (containsKey!168 (toList!827 lt!63541) (select (arr!2198 (_keys!4481 (v!3091 (underlying!430 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) e!81071)))

(declare-fun b!124088 () Bool)

(declare-fun e!81072 () Bool)

(assert (=> b!124088 (= e!81071 e!81072)))

(declare-fun res!60173 () Bool)

(assert (=> b!124088 (=> (not res!60173) (not e!81072))))

(assert (=> b!124088 (= res!60173 (and (or (not ((_ is Cons!1666) (toList!827 lt!63541))) (bvsle (_1!1265 (h!2267 (toList!827 lt!63541))) (select (arr!2198 (_keys!4481 (v!3091 (underlying!430 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))) ((_ is Cons!1666) (toList!827 lt!63541)) (bvslt (_1!1265 (h!2267 (toList!827 lt!63541))) (select (arr!2198 (_keys!4481 (v!3091 (underlying!430 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(declare-fun b!124089 () Bool)

(assert (=> b!124089 (= e!81072 (containsKey!168 (t!5965 (toList!827 lt!63541)) (select (arr!2198 (_keys!4481 (v!3091 (underlying!430 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (= (and d!37439 (not res!60172)) b!124088))

(assert (= (and b!124088 res!60173) b!124089))

(assert (=> b!124089 m!143609))

(declare-fun m!144489 () Bool)

(assert (=> b!124089 m!144489))

(assert (=> d!37171 d!37439))

(assert (=> d!37183 d!37181))

(declare-fun d!37441 () Bool)

(declare-fun e!81073 () Bool)

(assert (=> d!37441 e!81073))

(declare-fun res!60174 () Bool)

(assert (=> d!37441 (=> res!60174 e!81073)))

(declare-fun lt!63837 () Bool)

(assert (=> d!37441 (= res!60174 (not lt!63837))))

(declare-fun lt!63838 () Bool)

(assert (=> d!37441 (= lt!63837 lt!63838)))

(declare-fun lt!63839 () Unit!3839)

(declare-fun e!81074 () Unit!3839)

(assert (=> d!37441 (= lt!63839 e!81074)))

(declare-fun c!22587 () Bool)

(assert (=> d!37441 (= c!22587 lt!63838)))

(assert (=> d!37441 (= lt!63838 (containsKey!168 (toList!827 lt!63551) lt!63536))))

(assert (=> d!37441 (= (contains!856 lt!63551 lt!63536) lt!63837)))

(declare-fun b!124090 () Bool)

(declare-fun lt!63840 () Unit!3839)

(assert (=> b!124090 (= e!81074 lt!63840)))

(assert (=> b!124090 (= lt!63840 (lemmaContainsKeyImpliesGetValueByKeyDefined!116 (toList!827 lt!63551) lt!63536))))

(assert (=> b!124090 (isDefined!117 (getValueByKey!165 (toList!827 lt!63551) lt!63536))))

(declare-fun b!124091 () Bool)

(declare-fun Unit!3863 () Unit!3839)

(assert (=> b!124091 (= e!81074 Unit!3863)))

(declare-fun b!124092 () Bool)

(assert (=> b!124092 (= e!81073 (isDefined!117 (getValueByKey!165 (toList!827 lt!63551) lt!63536)))))

(assert (= (and d!37441 c!22587) b!124090))

(assert (= (and d!37441 (not c!22587)) b!124091))

(assert (= (and d!37441 (not res!60174)) b!124092))

(declare-fun m!144491 () Bool)

(assert (=> d!37441 m!144491))

(declare-fun m!144493 () Bool)

(assert (=> b!124090 m!144493))

(assert (=> b!124090 m!143871))

(assert (=> b!124090 m!143871))

(declare-fun m!144495 () Bool)

(assert (=> b!124090 m!144495))

(assert (=> b!124092 m!143871))

(assert (=> b!124092 m!143871))

(assert (=> b!124092 m!144495))

(assert (=> d!37183 d!37441))

(assert (=> d!37183 d!37193))

(assert (=> d!37183 d!37187))

(declare-fun d!37443 () Bool)

(assert (=> d!37443 (= (apply!108 (+!161 lt!63551 (tuple2!2509 lt!63552 (minValue!2619 (v!3091 (underlying!430 thiss!992))))) lt!63536) (apply!108 lt!63551 lt!63536))))

(assert (=> d!37443 true))

(declare-fun _$34!939 () Unit!3839)

(assert (=> d!37443 (= (choose!749 lt!63551 lt!63552 (minValue!2619 (v!3091 (underlying!430 thiss!992))) lt!63536) _$34!939)))

(declare-fun bs!5158 () Bool)

(assert (= bs!5158 d!37443))

(assert (=> bs!5158 m!143651))

(assert (=> bs!5158 m!143651))

(assert (=> bs!5158 m!143653))

(assert (=> bs!5158 m!143655))

(assert (=> d!37183 d!37443))

(assert (=> b!123729 d!37213))

(declare-fun b!124093 () Bool)

(declare-fun e!81076 () (_ BitVec 32))

(declare-fun e!81075 () (_ BitVec 32))

(assert (=> b!124093 (= e!81076 e!81075)))

(declare-fun c!22589 () Bool)

(assert (=> b!124093 (= c!22589 (validKeyInArray!0 (select (arr!2198 (_keys!4481 (v!3091 (underlying!430 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun b!124094 () Bool)

(declare-fun call!13157 () (_ BitVec 32))

(assert (=> b!124094 (= e!81075 (bvadd #b00000000000000000000000000000001 call!13157))))

(declare-fun bm!13154 () Bool)

(assert (=> bm!13154 (= call!13157 (arrayCountValidKeys!0 (_keys!4481 (v!3091 (underlying!430 thiss!992))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2460 (_keys!4481 (v!3091 (underlying!430 thiss!992))))))))

(declare-fun b!124095 () Bool)

(assert (=> b!124095 (= e!81075 call!13157)))

(declare-fun b!124096 () Bool)

(assert (=> b!124096 (= e!81076 #b00000000000000000000000000000000)))

(declare-fun d!37445 () Bool)

(declare-fun lt!63841 () (_ BitVec 32))

(assert (=> d!37445 (and (bvsge lt!63841 #b00000000000000000000000000000000) (bvsle lt!63841 (bvsub (size!2460 (_keys!4481 (v!3091 (underlying!430 thiss!992)))) #b00000000000000000000000000000000)))))

(assert (=> d!37445 (= lt!63841 e!81076)))

(declare-fun c!22588 () Bool)

(assert (=> d!37445 (= c!22588 (bvsge #b00000000000000000000000000000000 (size!2460 (_keys!4481 (v!3091 (underlying!430 thiss!992))))))))

(assert (=> d!37445 (and (bvsle #b00000000000000000000000000000000 (size!2460 (_keys!4481 (v!3091 (underlying!430 thiss!992))))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!2460 (_keys!4481 (v!3091 (underlying!430 thiss!992)))) (size!2460 (_keys!4481 (v!3091 (underlying!430 thiss!992))))))))

(assert (=> d!37445 (= (arrayCountValidKeys!0 (_keys!4481 (v!3091 (underlying!430 thiss!992))) #b00000000000000000000000000000000 (size!2460 (_keys!4481 (v!3091 (underlying!430 thiss!992))))) lt!63841)))

(assert (= (and d!37445 c!22588) b!124096))

(assert (= (and d!37445 (not c!22588)) b!124093))

(assert (= (and b!124093 c!22589) b!124094))

(assert (= (and b!124093 (not c!22589)) b!124095))

(assert (= (or b!124094 b!124095) bm!13154))

(assert (=> b!124093 m!144091))

(assert (=> b!124093 m!144091))

(assert (=> b!124093 m!144099))

(declare-fun m!144497 () Bool)

(assert (=> bm!13154 m!144497))

(assert (=> b!123616 d!37445))

(declare-fun d!37447 () Bool)

(declare-fun lt!63842 () Bool)

(assert (=> d!37447 (= lt!63842 (select (content!123 (toList!827 lt!63633)) (tuple2!2509 lt!63549 (zeroValue!2619 (v!3091 (underlying!430 thiss!992))))))))

(declare-fun e!81077 () Bool)

(assert (=> d!37447 (= lt!63842 e!81077)))

(declare-fun res!60176 () Bool)

(assert (=> d!37447 (=> (not res!60176) (not e!81077))))

(assert (=> d!37447 (= res!60176 ((_ is Cons!1666) (toList!827 lt!63633)))))

(assert (=> d!37447 (= (contains!857 (toList!827 lt!63633) (tuple2!2509 lt!63549 (zeroValue!2619 (v!3091 (underlying!430 thiss!992))))) lt!63842)))

(declare-fun b!124097 () Bool)

(declare-fun e!81078 () Bool)

(assert (=> b!124097 (= e!81077 e!81078)))

(declare-fun res!60175 () Bool)

(assert (=> b!124097 (=> res!60175 e!81078)))

(assert (=> b!124097 (= res!60175 (= (h!2267 (toList!827 lt!63633)) (tuple2!2509 lt!63549 (zeroValue!2619 (v!3091 (underlying!430 thiss!992))))))))

(declare-fun b!124098 () Bool)

(assert (=> b!124098 (= e!81078 (contains!857 (t!5965 (toList!827 lt!63633)) (tuple2!2509 lt!63549 (zeroValue!2619 (v!3091 (underlying!430 thiss!992))))))))

(assert (= (and d!37447 res!60176) b!124097))

(assert (= (and b!124097 (not res!60175)) b!124098))

(declare-fun m!144499 () Bool)

(assert (=> d!37447 m!144499))

(declare-fun m!144501 () Bool)

(assert (=> d!37447 m!144501))

(declare-fun m!144503 () Bool)

(assert (=> b!124098 m!144503))

(assert (=> b!123692 d!37447))

(assert (=> d!37169 d!37227))

(declare-fun d!37449 () Bool)

(declare-fun res!60177 () Bool)

(declare-fun e!81079 () Bool)

(assert (=> d!37449 (=> res!60177 e!81079)))

(assert (=> d!37449 (= res!60177 (and ((_ is Cons!1666) (toList!827 lt!63541)) (= (_1!1265 (h!2267 (toList!827 lt!63541))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!37449 (= (containsKey!168 (toList!827 lt!63541) #b0000000000000000000000000000000000000000000000000000000000000000) e!81079)))

(declare-fun b!124099 () Bool)

(declare-fun e!81080 () Bool)

(assert (=> b!124099 (= e!81079 e!81080)))

(declare-fun res!60178 () Bool)

(assert (=> b!124099 (=> (not res!60178) (not e!81080))))

(assert (=> b!124099 (= res!60178 (and (or (not ((_ is Cons!1666) (toList!827 lt!63541))) (bvsle (_1!1265 (h!2267 (toList!827 lt!63541))) #b0000000000000000000000000000000000000000000000000000000000000000)) ((_ is Cons!1666) (toList!827 lt!63541)) (bvslt (_1!1265 (h!2267 (toList!827 lt!63541))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!124100 () Bool)

(assert (=> b!124100 (= e!81080 (containsKey!168 (t!5965 (toList!827 lt!63541)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!37449 (not res!60177)) b!124099))

(assert (= (and b!124099 res!60178) b!124100))

(declare-fun m!144505 () Bool)

(assert (=> b!124100 m!144505))

(assert (=> d!37151 d!37449))

(assert (=> b!123682 d!37149))

(assert (=> b!123613 d!37213))

(declare-fun d!37451 () Bool)

(declare-fun lt!63843 () Bool)

(assert (=> d!37451 (= lt!63843 (select (content!123 (toList!827 lt!63562)) (tuple2!2509 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 (v!3091 (underlying!430 thiss!992))))))))

(declare-fun e!81081 () Bool)

(assert (=> d!37451 (= lt!63843 e!81081)))

(declare-fun res!60180 () Bool)

(assert (=> d!37451 (=> (not res!60180) (not e!81081))))

(assert (=> d!37451 (= res!60180 ((_ is Cons!1666) (toList!827 lt!63562)))))

(assert (=> d!37451 (= (contains!857 (toList!827 lt!63562) (tuple2!2509 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 (v!3091 (underlying!430 thiss!992))))) lt!63843)))

(declare-fun b!124101 () Bool)

(declare-fun e!81082 () Bool)

(assert (=> b!124101 (= e!81081 e!81082)))

(declare-fun res!60179 () Bool)

(assert (=> b!124101 (=> res!60179 e!81082)))

(assert (=> b!124101 (= res!60179 (= (h!2267 (toList!827 lt!63562)) (tuple2!2509 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 (v!3091 (underlying!430 thiss!992))))))))

(declare-fun b!124102 () Bool)

(assert (=> b!124102 (= e!81082 (contains!857 (t!5965 (toList!827 lt!63562)) (tuple2!2509 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 (v!3091 (underlying!430 thiss!992))))))))

(assert (= (and d!37451 res!60180) b!124101))

(assert (= (and b!124101 (not res!60179)) b!124102))

(declare-fun m!144507 () Bool)

(assert (=> d!37451 m!144507))

(declare-fun m!144509 () Bool)

(assert (=> d!37451 m!144509))

(declare-fun m!144511 () Bool)

(assert (=> b!124102 m!144511))

(assert (=> b!123580 d!37451))

(declare-fun b!124104 () Bool)

(declare-fun e!81083 () Option!171)

(declare-fun e!81084 () Option!171)

(assert (=> b!124104 (= e!81083 e!81084)))

(declare-fun c!22591 () Bool)

(assert (=> b!124104 (= c!22591 (and ((_ is Cons!1666) (toList!827 lt!63644)) (not (= (_1!1265 (h!2267 (toList!827 lt!63644))) (_1!1265 (tuple2!2509 lt!63538 (minValue!2619 (v!3091 (underlying!430 thiss!992)))))))))))

(declare-fun d!37453 () Bool)

(declare-fun c!22590 () Bool)

(assert (=> d!37453 (= c!22590 (and ((_ is Cons!1666) (toList!827 lt!63644)) (= (_1!1265 (h!2267 (toList!827 lt!63644))) (_1!1265 (tuple2!2509 lt!63538 (minValue!2619 (v!3091 (underlying!430 thiss!992))))))))))

(assert (=> d!37453 (= (getValueByKey!165 (toList!827 lt!63644) (_1!1265 (tuple2!2509 lt!63538 (minValue!2619 (v!3091 (underlying!430 thiss!992)))))) e!81083)))

(declare-fun b!124106 () Bool)

(assert (=> b!124106 (= e!81084 None!169)))

(declare-fun b!124105 () Bool)

(assert (=> b!124105 (= e!81084 (getValueByKey!165 (t!5965 (toList!827 lt!63644)) (_1!1265 (tuple2!2509 lt!63538 (minValue!2619 (v!3091 (underlying!430 thiss!992)))))))))

(declare-fun b!124103 () Bool)

(assert (=> b!124103 (= e!81083 (Some!170 (_2!1265 (h!2267 (toList!827 lt!63644)))))))

(assert (= (and d!37453 c!22590) b!124103))

(assert (= (and d!37453 (not c!22590)) b!124104))

(assert (= (and b!124104 c!22591) b!124105))

(assert (= (and b!124104 (not c!22591)) b!124106))

(declare-fun m!144513 () Bool)

(assert (=> b!124105 m!144513))

(assert (=> b!123699 d!37453))

(declare-fun d!37455 () Bool)

(declare-fun res!60181 () Bool)

(declare-fun e!81085 () Bool)

(assert (=> d!37455 (=> res!60181 e!81085)))

(assert (=> d!37455 (= res!60181 (and ((_ is Cons!1666) (toList!827 (+!161 lt!63545 (tuple2!2509 lt!63547 (zeroValue!2619 (v!3091 (underlying!430 thiss!992))))))) (= (_1!1265 (h!2267 (toList!827 (+!161 lt!63545 (tuple2!2509 lt!63547 (zeroValue!2619 (v!3091 (underlying!430 thiss!992)))))))) lt!63543)))))

(assert (=> d!37455 (= (containsKey!168 (toList!827 (+!161 lt!63545 (tuple2!2509 lt!63547 (zeroValue!2619 (v!3091 (underlying!430 thiss!992)))))) lt!63543) e!81085)))

(declare-fun b!124107 () Bool)

(declare-fun e!81086 () Bool)

(assert (=> b!124107 (= e!81085 e!81086)))

(declare-fun res!60182 () Bool)

(assert (=> b!124107 (=> (not res!60182) (not e!81086))))

(assert (=> b!124107 (= res!60182 (and (or (not ((_ is Cons!1666) (toList!827 (+!161 lt!63545 (tuple2!2509 lt!63547 (zeroValue!2619 (v!3091 (underlying!430 thiss!992)))))))) (bvsle (_1!1265 (h!2267 (toList!827 (+!161 lt!63545 (tuple2!2509 lt!63547 (zeroValue!2619 (v!3091 (underlying!430 thiss!992)))))))) lt!63543)) ((_ is Cons!1666) (toList!827 (+!161 lt!63545 (tuple2!2509 lt!63547 (zeroValue!2619 (v!3091 (underlying!430 thiss!992))))))) (bvslt (_1!1265 (h!2267 (toList!827 (+!161 lt!63545 (tuple2!2509 lt!63547 (zeroValue!2619 (v!3091 (underlying!430 thiss!992)))))))) lt!63543)))))

(declare-fun b!124108 () Bool)

(assert (=> b!124108 (= e!81086 (containsKey!168 (t!5965 (toList!827 (+!161 lt!63545 (tuple2!2509 lt!63547 (zeroValue!2619 (v!3091 (underlying!430 thiss!992))))))) lt!63543))))

(assert (= (and d!37455 (not res!60181)) b!124107))

(assert (= (and b!124107 res!60182) b!124108))

(declare-fun m!144515 () Bool)

(assert (=> b!124108 m!144515))

(assert (=> d!37203 d!37455))

(declare-fun d!37457 () Bool)

(declare-fun e!81087 () Bool)

(assert (=> d!37457 e!81087))

(declare-fun res!60183 () Bool)

(assert (=> d!37457 (=> res!60183 e!81087)))

(declare-fun lt!63844 () Bool)

(assert (=> d!37457 (= res!60183 (not lt!63844))))

(declare-fun lt!63845 () Bool)

(assert (=> d!37457 (= lt!63844 lt!63845)))

(declare-fun lt!63846 () Unit!3839)

(declare-fun e!81088 () Unit!3839)

(assert (=> d!37457 (= lt!63846 e!81088)))

(declare-fun c!22592 () Bool)

(assert (=> d!37457 (= c!22592 lt!63845)))

(assert (=> d!37457 (= lt!63845 (containsKey!168 (toList!827 lt!63657) (_1!1265 (tuple2!2509 lt!63547 (zeroValue!2619 (v!3091 (underlying!430 thiss!992)))))))))

(assert (=> d!37457 (= (contains!856 lt!63657 (_1!1265 (tuple2!2509 lt!63547 (zeroValue!2619 (v!3091 (underlying!430 thiss!992)))))) lt!63844)))

(declare-fun b!124109 () Bool)

(declare-fun lt!63847 () Unit!3839)

(assert (=> b!124109 (= e!81088 lt!63847)))

(assert (=> b!124109 (= lt!63847 (lemmaContainsKeyImpliesGetValueByKeyDefined!116 (toList!827 lt!63657) (_1!1265 (tuple2!2509 lt!63547 (zeroValue!2619 (v!3091 (underlying!430 thiss!992)))))))))

(assert (=> b!124109 (isDefined!117 (getValueByKey!165 (toList!827 lt!63657) (_1!1265 (tuple2!2509 lt!63547 (zeroValue!2619 (v!3091 (underlying!430 thiss!992)))))))))

(declare-fun b!124110 () Bool)

(declare-fun Unit!3864 () Unit!3839)

(assert (=> b!124110 (= e!81088 Unit!3864)))

(declare-fun b!124111 () Bool)

(assert (=> b!124111 (= e!81087 (isDefined!117 (getValueByKey!165 (toList!827 lt!63657) (_1!1265 (tuple2!2509 lt!63547 (zeroValue!2619 (v!3091 (underlying!430 thiss!992))))))))))

(assert (= (and d!37457 c!22592) b!124109))

(assert (= (and d!37457 (not c!22592)) b!124110))

(assert (= (and d!37457 (not res!60183)) b!124111))

(declare-fun m!144517 () Bool)

(assert (=> d!37457 m!144517))

(declare-fun m!144519 () Bool)

(assert (=> b!124109 m!144519))

(assert (=> b!124109 m!143907))

(assert (=> b!124109 m!143907))

(declare-fun m!144521 () Bool)

(assert (=> b!124109 m!144521))

(assert (=> b!124111 m!143907))

(assert (=> b!124111 m!143907))

(assert (=> b!124111 m!144521))

(assert (=> d!37205 d!37457))

(declare-fun b!124113 () Bool)

(declare-fun e!81089 () Option!171)

(declare-fun e!81090 () Option!171)

(assert (=> b!124113 (= e!81089 e!81090)))

(declare-fun c!22594 () Bool)

(assert (=> b!124113 (= c!22594 (and ((_ is Cons!1666) lt!63659) (not (= (_1!1265 (h!2267 lt!63659)) (_1!1265 (tuple2!2509 lt!63547 (zeroValue!2619 (v!3091 (underlying!430 thiss!992)))))))))))

(declare-fun c!22593 () Bool)

(declare-fun d!37459 () Bool)

(assert (=> d!37459 (= c!22593 (and ((_ is Cons!1666) lt!63659) (= (_1!1265 (h!2267 lt!63659)) (_1!1265 (tuple2!2509 lt!63547 (zeroValue!2619 (v!3091 (underlying!430 thiss!992))))))))))

(assert (=> d!37459 (= (getValueByKey!165 lt!63659 (_1!1265 (tuple2!2509 lt!63547 (zeroValue!2619 (v!3091 (underlying!430 thiss!992)))))) e!81089)))

(declare-fun b!124115 () Bool)

(assert (=> b!124115 (= e!81090 None!169)))

(declare-fun b!124114 () Bool)

(assert (=> b!124114 (= e!81090 (getValueByKey!165 (t!5965 lt!63659) (_1!1265 (tuple2!2509 lt!63547 (zeroValue!2619 (v!3091 (underlying!430 thiss!992)))))))))

(declare-fun b!124112 () Bool)

(assert (=> b!124112 (= e!81089 (Some!170 (_2!1265 (h!2267 lt!63659))))))

(assert (= (and d!37459 c!22593) b!124112))

(assert (= (and d!37459 (not c!22593)) b!124113))

(assert (= (and b!124113 c!22594) b!124114))

(assert (= (and b!124113 (not c!22594)) b!124115))

(declare-fun m!144523 () Bool)

(assert (=> b!124114 m!144523))

(assert (=> d!37205 d!37459))

(declare-fun d!37461 () Bool)

(assert (=> d!37461 (= (getValueByKey!165 lt!63659 (_1!1265 (tuple2!2509 lt!63547 (zeroValue!2619 (v!3091 (underlying!430 thiss!992)))))) (Some!170 (_2!1265 (tuple2!2509 lt!63547 (zeroValue!2619 (v!3091 (underlying!430 thiss!992)))))))))

(declare-fun lt!63848 () Unit!3839)

(assert (=> d!37461 (= lt!63848 (choose!751 lt!63659 (_1!1265 (tuple2!2509 lt!63547 (zeroValue!2619 (v!3091 (underlying!430 thiss!992))))) (_2!1265 (tuple2!2509 lt!63547 (zeroValue!2619 (v!3091 (underlying!430 thiss!992)))))))))

(declare-fun e!81091 () Bool)

(assert (=> d!37461 e!81091))

(declare-fun res!60184 () Bool)

(assert (=> d!37461 (=> (not res!60184) (not e!81091))))

(assert (=> d!37461 (= res!60184 (isStrictlySorted!302 lt!63659))))

(assert (=> d!37461 (= (lemmaContainsTupThenGetReturnValue!81 lt!63659 (_1!1265 (tuple2!2509 lt!63547 (zeroValue!2619 (v!3091 (underlying!430 thiss!992))))) (_2!1265 (tuple2!2509 lt!63547 (zeroValue!2619 (v!3091 (underlying!430 thiss!992)))))) lt!63848)))

(declare-fun b!124116 () Bool)

(declare-fun res!60185 () Bool)

(assert (=> b!124116 (=> (not res!60185) (not e!81091))))

(assert (=> b!124116 (= res!60185 (containsKey!168 lt!63659 (_1!1265 (tuple2!2509 lt!63547 (zeroValue!2619 (v!3091 (underlying!430 thiss!992)))))))))

(declare-fun b!124117 () Bool)

(assert (=> b!124117 (= e!81091 (contains!857 lt!63659 (tuple2!2509 (_1!1265 (tuple2!2509 lt!63547 (zeroValue!2619 (v!3091 (underlying!430 thiss!992))))) (_2!1265 (tuple2!2509 lt!63547 (zeroValue!2619 (v!3091 (underlying!430 thiss!992))))))))))

(assert (= (and d!37461 res!60184) b!124116))

(assert (= (and b!124116 res!60185) b!124117))

(assert (=> d!37461 m!143901))

(declare-fun m!144525 () Bool)

(assert (=> d!37461 m!144525))

(declare-fun m!144527 () Bool)

(assert (=> d!37461 m!144527))

(declare-fun m!144529 () Bool)

(assert (=> b!124116 m!144529))

(declare-fun m!144531 () Bool)

(assert (=> b!124117 m!144531))

(assert (=> d!37205 d!37461))

(declare-fun b!124118 () Bool)

(declare-fun res!60187 () Bool)

(declare-fun e!81095 () Bool)

(assert (=> b!124118 (=> (not res!60187) (not e!81095))))

(declare-fun lt!63849 () List!1670)

(assert (=> b!124118 (= res!60187 (containsKey!168 lt!63849 (_1!1265 (tuple2!2509 lt!63547 (zeroValue!2619 (v!3091 (underlying!430 thiss!992)))))))))

(declare-fun d!37463 () Bool)

(assert (=> d!37463 e!81095))

(declare-fun res!60186 () Bool)

(assert (=> d!37463 (=> (not res!60186) (not e!81095))))

(assert (=> d!37463 (= res!60186 (isStrictlySorted!302 lt!63849))))

(declare-fun e!81094 () List!1670)

(assert (=> d!37463 (= lt!63849 e!81094)))

(declare-fun c!22595 () Bool)

(assert (=> d!37463 (= c!22595 (and ((_ is Cons!1666) (toList!827 lt!63545)) (bvslt (_1!1265 (h!2267 (toList!827 lt!63545))) (_1!1265 (tuple2!2509 lt!63547 (zeroValue!2619 (v!3091 (underlying!430 thiss!992))))))))))

(assert (=> d!37463 (isStrictlySorted!302 (toList!827 lt!63545))))

(assert (=> d!37463 (= (insertStrictlySorted!84 (toList!827 lt!63545) (_1!1265 (tuple2!2509 lt!63547 (zeroValue!2619 (v!3091 (underlying!430 thiss!992))))) (_2!1265 (tuple2!2509 lt!63547 (zeroValue!2619 (v!3091 (underlying!430 thiss!992)))))) lt!63849)))

(declare-fun c!22598 () Bool)

(declare-fun b!124119 () Bool)

(assert (=> b!124119 (= c!22598 (and ((_ is Cons!1666) (toList!827 lt!63545)) (bvsgt (_1!1265 (h!2267 (toList!827 lt!63545))) (_1!1265 (tuple2!2509 lt!63547 (zeroValue!2619 (v!3091 (underlying!430 thiss!992))))))))))

(declare-fun e!81092 () List!1670)

(declare-fun e!81096 () List!1670)

(assert (=> b!124119 (= e!81092 e!81096)))

(declare-fun b!124120 () Bool)

(assert (=> b!124120 (= e!81095 (contains!857 lt!63849 (tuple2!2509 (_1!1265 (tuple2!2509 lt!63547 (zeroValue!2619 (v!3091 (underlying!430 thiss!992))))) (_2!1265 (tuple2!2509 lt!63547 (zeroValue!2619 (v!3091 (underlying!430 thiss!992))))))))))

(declare-fun e!81093 () List!1670)

(declare-fun b!124121 () Bool)

(declare-fun c!22597 () Bool)

(assert (=> b!124121 (= e!81093 (ite c!22597 (t!5965 (toList!827 lt!63545)) (ite c!22598 (Cons!1666 (h!2267 (toList!827 lt!63545)) (t!5965 (toList!827 lt!63545))) Nil!1667)))))

(declare-fun bm!13155 () Bool)

(declare-fun call!13159 () List!1670)

(declare-fun call!13158 () List!1670)

(assert (=> bm!13155 (= call!13159 call!13158)))

(declare-fun b!124122 () Bool)

(assert (=> b!124122 (= e!81093 (insertStrictlySorted!84 (t!5965 (toList!827 lt!63545)) (_1!1265 (tuple2!2509 lt!63547 (zeroValue!2619 (v!3091 (underlying!430 thiss!992))))) (_2!1265 (tuple2!2509 lt!63547 (zeroValue!2619 (v!3091 (underlying!430 thiss!992)))))))))

(declare-fun bm!13156 () Bool)

(assert (=> bm!13156 (= call!13158 ($colon$colon!86 e!81093 (ite c!22595 (h!2267 (toList!827 lt!63545)) (tuple2!2509 (_1!1265 (tuple2!2509 lt!63547 (zeroValue!2619 (v!3091 (underlying!430 thiss!992))))) (_2!1265 (tuple2!2509 lt!63547 (zeroValue!2619 (v!3091 (underlying!430 thiss!992)))))))))))

(declare-fun c!22596 () Bool)

(assert (=> bm!13156 (= c!22596 c!22595)))

(declare-fun b!124123 () Bool)

(assert (=> b!124123 (= e!81094 e!81092)))

(assert (=> b!124123 (= c!22597 (and ((_ is Cons!1666) (toList!827 lt!63545)) (= (_1!1265 (h!2267 (toList!827 lt!63545))) (_1!1265 (tuple2!2509 lt!63547 (zeroValue!2619 (v!3091 (underlying!430 thiss!992))))))))))

(declare-fun b!124124 () Bool)

(assert (=> b!124124 (= e!81094 call!13158)))

(declare-fun b!124125 () Bool)

(declare-fun call!13160 () List!1670)

(assert (=> b!124125 (= e!81096 call!13160)))

(declare-fun bm!13157 () Bool)

(assert (=> bm!13157 (= call!13160 call!13159)))

(declare-fun b!124126 () Bool)

(assert (=> b!124126 (= e!81096 call!13160)))

(declare-fun b!124127 () Bool)

(assert (=> b!124127 (= e!81092 call!13159)))

(assert (= (and d!37463 c!22595) b!124124))

(assert (= (and d!37463 (not c!22595)) b!124123))

(assert (= (and b!124123 c!22597) b!124127))

(assert (= (and b!124123 (not c!22597)) b!124119))

(assert (= (and b!124119 c!22598) b!124125))

(assert (= (and b!124119 (not c!22598)) b!124126))

(assert (= (or b!124125 b!124126) bm!13157))

(assert (= (or b!124127 bm!13157) bm!13155))

(assert (= (or b!124124 bm!13155) bm!13156))

(assert (= (and bm!13156 c!22596) b!124122))

(assert (= (and bm!13156 (not c!22596)) b!124121))

(assert (= (and d!37463 res!60186) b!124118))

(assert (= (and b!124118 res!60187) b!124120))

(declare-fun m!144533 () Bool)

(assert (=> b!124122 m!144533))

(declare-fun m!144535 () Bool)

(assert (=> d!37463 m!144535))

(declare-fun m!144537 () Bool)

(assert (=> d!37463 m!144537))

(declare-fun m!144539 () Bool)

(assert (=> b!124118 m!144539))

(declare-fun m!144541 () Bool)

(assert (=> bm!13156 m!144541))

(declare-fun m!144543 () Bool)

(assert (=> b!124120 m!144543))

(assert (=> d!37205 d!37463))

(declare-fun condMapEmpty!4439 () Bool)

(declare-fun mapDefault!4439 () ValueCell!1067)

(assert (=> mapNonEmpty!4438 (= condMapEmpty!4439 (= mapRest!4438 ((as const (Array (_ BitVec 32) ValueCell!1067)) mapDefault!4439)))))

(declare-fun e!81097 () Bool)

(declare-fun mapRes!4439 () Bool)

(assert (=> mapNonEmpty!4438 (= tp!10846 (and e!81097 mapRes!4439))))

(declare-fun mapIsEmpty!4439 () Bool)

(assert (=> mapIsEmpty!4439 mapRes!4439))

(declare-fun mapNonEmpty!4439 () Bool)

(declare-fun tp!10847 () Bool)

(declare-fun e!81098 () Bool)

(assert (=> mapNonEmpty!4439 (= mapRes!4439 (and tp!10847 e!81098))))

(declare-fun mapRest!4439 () (Array (_ BitVec 32) ValueCell!1067))

(declare-fun mapKey!4439 () (_ BitVec 32))

(declare-fun mapValue!4439 () ValueCell!1067)

(assert (=> mapNonEmpty!4439 (= mapRest!4438 (store mapRest!4439 mapKey!4439 mapValue!4439))))

(declare-fun b!124128 () Bool)

(assert (=> b!124128 (= e!81098 tp_is_empty!2821)))

(declare-fun b!124129 () Bool)

(assert (=> b!124129 (= e!81097 tp_is_empty!2821)))

(assert (= (and mapNonEmpty!4438 condMapEmpty!4439) mapIsEmpty!4439))

(assert (= (and mapNonEmpty!4438 (not condMapEmpty!4439)) mapNonEmpty!4439))

(assert (= (and mapNonEmpty!4439 ((_ is ValueCellFull!1067) mapValue!4439)) b!124128))

(assert (= (and mapNonEmpty!4438 ((_ is ValueCellFull!1067) mapDefault!4439)) b!124129))

(declare-fun m!144545 () Bool)

(assert (=> mapNonEmpty!4439 m!144545))

(declare-fun condMapEmpty!4440 () Bool)

(declare-fun mapDefault!4440 () ValueCell!1067)

(assert (=> mapNonEmpty!4437 (= condMapEmpty!4440 (= mapRest!4437 ((as const (Array (_ BitVec 32) ValueCell!1067)) mapDefault!4440)))))

(declare-fun e!81099 () Bool)

(declare-fun mapRes!4440 () Bool)

(assert (=> mapNonEmpty!4437 (= tp!10845 (and e!81099 mapRes!4440))))

(declare-fun mapIsEmpty!4440 () Bool)

(assert (=> mapIsEmpty!4440 mapRes!4440))

(declare-fun mapNonEmpty!4440 () Bool)

(declare-fun tp!10848 () Bool)

(declare-fun e!81100 () Bool)

(assert (=> mapNonEmpty!4440 (= mapRes!4440 (and tp!10848 e!81100))))

(declare-fun mapValue!4440 () ValueCell!1067)

(declare-fun mapRest!4440 () (Array (_ BitVec 32) ValueCell!1067))

(declare-fun mapKey!4440 () (_ BitVec 32))

(assert (=> mapNonEmpty!4440 (= mapRest!4437 (store mapRest!4440 mapKey!4440 mapValue!4440))))

(declare-fun b!124130 () Bool)

(assert (=> b!124130 (= e!81100 tp_is_empty!2821)))

(declare-fun b!124131 () Bool)

(assert (=> b!124131 (= e!81099 tp_is_empty!2821)))

(assert (= (and mapNonEmpty!4437 condMapEmpty!4440) mapIsEmpty!4440))

(assert (= (and mapNonEmpty!4437 (not condMapEmpty!4440)) mapNonEmpty!4440))

(assert (= (and mapNonEmpty!4440 ((_ is ValueCellFull!1067) mapValue!4440)) b!124130))

(assert (= (and mapNonEmpty!4437 ((_ is ValueCellFull!1067) mapDefault!4440)) b!124131))

(declare-fun m!144547 () Bool)

(assert (=> mapNonEmpty!4440 m!144547))

(declare-fun b_lambda!5455 () Bool)

(assert (= b_lambda!5447 (or (and b!123392 b_free!2809) (and b!123390 b_free!2811 (= (defaultEntry!2754 newMap!16) (defaultEntry!2754 (v!3091 (underlying!430 thiss!992))))) b_lambda!5455)))

(declare-fun b_lambda!5457 () Bool)

(assert (= b_lambda!5453 (or (and b!123392 b_free!2809 (= (defaultEntry!2754 (v!3091 (underlying!430 thiss!992))) (defaultEntry!2754 newMap!16))) (and b!123390 b_free!2811) b_lambda!5457)))

(declare-fun b_lambda!5459 () Bool)

(assert (= b_lambda!5449 (or (and b!123392 b_free!2809) (and b!123390 b_free!2811 (= (defaultEntry!2754 newMap!16) (defaultEntry!2754 (v!3091 (underlying!430 thiss!992))))) b_lambda!5459)))

(declare-fun b_lambda!5461 () Bool)

(assert (= b_lambda!5451 (or (and b!123392 b_free!2809 (= (defaultEntry!2754 (v!3091 (underlying!430 thiss!992))) (defaultEntry!2754 newMap!16))) (and b!123390 b_free!2811) b_lambda!5461)))

(check-sat (not d!37405) (not b!123908) (not b!123909) (not b!123928) (not d!37375) (not b_lambda!5461) (not d!37419) (not d!37319) (not d!37223) (not d!37431) (not b!124108) (not d!37387) (not b!124122) (not d!37461) (not b!123877) (not d!37281) (not d!37365) (not b_lambda!5445) (not b!124061) (not b_lambda!5441) (not mapNonEmpty!4439) (not d!37399) (not b!123837) (not b!123807) (not b!124010) (not b!123782) (not d!37371) (not b!123919) (not b!123993) (not b!123855) (not b!123845) (not d!37377) (not b!124114) (not b!124077) (not d!37309) (not d!37259) (not b!124012) (not b!123874) (not d!37381) (not b!124021) (not b!123990) (not b!123882) (not b!124098) (not d!37217) (not bm!13138) (not b_lambda!5455) (not b!124065) (not b!124066) (not b!124037) (not b!124058) (not b!123784) (not d!37255) (not b!123876) (not b!123896) (not b!124087) (not b!124009) (not b!123918) (not d!37393) (not b!123985) (not b!123949) (not d!37421) (not b!124105) (not b!124039) (not b!123856) (not b!123902) (not d!37369) (not b_next!2809) (not b!124080) (not d!37361) (not d!37327) (not d!37245) (not b!123991) (not b!123743) (not d!37415) (not b_lambda!5459) (not d!37357) (not b!123819) (not b!123942) (not b!123906) (not d!37379) (not b!123761) (not d!37225) (not b!123754) (not b!124117) (not b!124036) (not d!37457) (not bm!13152) (not b!124015) (not b!124035) (not d!37407) (not b!123821) (not b!123798) (not d!37409) (not b!124109) (not d!37305) (not b!123847) (not b!123996) (not b!124023) (not d!37463) (not d!37233) (not b!123984) (not b!123871) (not b!124017) (not b!123794) (not b!123894) (not b!123977) (not d!37235) (not d!37447) (not b!123983) (not b!124090) (not b!123869) b_and!7619 (not b!124092) (not b!124018) (not b!123925) (not b!123834) (not b!123796) (not b!123849) (not bm!13153) (not b!124067) (not d!37243) (not b!124074) (not b!123972) (not b!124118) (not b!124034) (not d!37253) (not d!37333) (not b_lambda!5433) (not b!123760) (not d!37269) (not d!37279) (not d!37355) (not d!37241) (not b!124000) (not b!123817) (not d!37343) (not d!37373) (not b!124048) (not d!37389) (not b!123860) (not b!123889) (not b!124042) (not b!123806) (not b!123740) (not mapNonEmpty!4440) (not d!37215) (not b!123975) (not b!124057) (not b!123999) (not b!124031) (not b!123976) (not d!37385) (not b!123841) (not b!123994) (not b!123963) (not b!123852) (not b_next!2811) (not b!124093) (not b!123997) (not d!37423) (not bm!13154) (not b!124050) (not d!37347) (not b!123830) (not b!123938) (not d!37317) (not d!37293) (not d!37325) (not bm!13149) (not d!37391) (not b!123891) (not d!37303) (not b!123800) (not b!123893) (not d!37299) (not d!37321) (not b!123982) (not d!37273) (not d!37397) (not bm!13136) (not bm!13133) (not b!124045) (not b!124100) (not b!124072) (not d!37283) (not b!124044) (not bm!13143) (not b!124019) (not b!124001) (not bm!13151) (not bm!13140) (not b!124059) (not b!123805) (not b!123897) (not b!124120) (not d!37401) (not b!123820) (not b!123741) (not d!37441) (not b!123811) (not b!123854) (not b!123900) (not b!123858) (not b!123786) (not b!124075) (not b!123992) (not b!123969) (not b!123912) (not b!123886) (not bm!13144) (not b!123968) (not b!124116) (not b!124111) (not d!37257) (not b!124007) (not bm!13156) (not b_lambda!5443) (not d!37359) (not d!37353) (not b_lambda!5457) (not b!124063) (not d!37367) (not b!124046) (not d!37237) (not b!123866) (not d!37219) (not bm!13142) (not d!37443) (not b!123980) (not b!123988) (not b!124102) (not b!123910) (not d!37363) (not b!123903) (not b!123935) (not b!123803) (not d!37301) (not b!124002) (not b!123884) (not b!123868) tp_is_empty!2821 (not d!37351) (not b!123981) (not b!123829) (not b!123738) (not b!123797) (not b!123917) (not d!37329) (not b!123971) b_and!7617 (not bm!13146) (not d!37323) (not b!123826) (not d!37349) (not b!123809) (not d!37275) (not d!37451) (not b!124089) (not d!37413) (not b!123974))
(check-sat b_and!7617 b_and!7619 (not b_next!2809) (not b_next!2811))
