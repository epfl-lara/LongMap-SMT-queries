; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!13206 () Bool)

(assert start!13206)

(declare-fun b!116110 () Bool)

(declare-fun b_free!2737 () Bool)

(declare-fun b_next!2737 () Bool)

(assert (=> b!116110 (= b_free!2737 (not b_next!2737))))

(declare-fun tp!10582 () Bool)

(declare-fun b_and!7221 () Bool)

(assert (=> b!116110 (= tp!10582 b_and!7221)))

(declare-fun b!116119 () Bool)

(declare-fun b_free!2739 () Bool)

(declare-fun b_next!2739 () Bool)

(assert (=> b!116119 (= b_free!2739 (not b_next!2739))))

(declare-fun tp!10581 () Bool)

(declare-fun b_and!7223 () Bool)

(assert (=> b!116119 (= tp!10581 b_and!7223)))

(declare-fun b!116102 () Bool)

(declare-fun e!75802 () Bool)

(declare-datatypes ((V!3361 0))(
  ( (V!3362 (val!1437 Int)) )
))
(declare-datatypes ((array!4555 0))(
  ( (array!4556 (arr!2158 (Array (_ BitVec 32) (_ BitVec 64))) (size!2420 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1049 0))(
  ( (ValueCellFull!1049 (v!3036 V!3361)) (EmptyCell!1049) )
))
(declare-datatypes ((array!4557 0))(
  ( (array!4558 (arr!2159 (Array (_ BitVec 32) ValueCell!1049)) (size!2421 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1006 0))(
  ( (LongMapFixedSize!1007 (defaultEntry!2714 Int) (mask!6929 (_ BitVec 32)) (extraKeys!2503 (_ BitVec 32)) (zeroValue!2581 V!3361) (minValue!2581 V!3361) (_size!552 (_ BitVec 32)) (_keys!4436 array!4555) (_values!2697 array!4557) (_vacant!552 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!794 0))(
  ( (Cell!795 (v!3037 LongMapFixedSize!1006)) )
))
(declare-datatypes ((LongMap!794 0))(
  ( (LongMap!795 (underlying!408 Cell!794)) )
))
(declare-fun thiss!992 () LongMap!794)

(declare-fun valid!479 (LongMapFixedSize!1006) Bool)

(assert (=> b!116102 (= e!75802 (not (valid!479 (v!3037 (underlying!408 thiss!992)))))))

(declare-fun b!116103 () Bool)

(declare-fun e!75810 () Bool)

(declare-fun tp_is_empty!2785 () Bool)

(assert (=> b!116103 (= e!75810 tp_is_empty!2785)))

(declare-fun b!116104 () Bool)

(declare-fun e!75808 () Bool)

(declare-fun e!75804 () Bool)

(assert (=> b!116104 (= e!75808 e!75804)))

(declare-fun mapIsEmpty!4293 () Bool)

(declare-fun mapRes!4294 () Bool)

(assert (=> mapIsEmpty!4293 mapRes!4294))

(declare-fun res!56909 () Bool)

(declare-fun e!75799 () Bool)

(assert (=> start!13206 (=> (not res!56909) (not e!75799))))

(declare-fun valid!480 (LongMap!794) Bool)

(assert (=> start!13206 (= res!56909 (valid!480 thiss!992))))

(assert (=> start!13206 e!75799))

(assert (=> start!13206 e!75808))

(assert (=> start!13206 true))

(declare-fun e!75811 () Bool)

(assert (=> start!13206 e!75811))

(declare-fun b!116105 () Bool)

(declare-fun e!75801 () Bool)

(declare-fun mapRes!4293 () Bool)

(assert (=> b!116105 (= e!75801 (and e!75810 mapRes!4293))))

(declare-fun condMapEmpty!4293 () Bool)

(declare-fun newMap!16 () LongMapFixedSize!1006)

(declare-fun mapDefault!4294 () ValueCell!1049)

(assert (=> b!116105 (= condMapEmpty!4293 (= (arr!2159 (_values!2697 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!1049)) mapDefault!4294)))))

(declare-fun b!116106 () Bool)

(declare-fun e!75809 () Bool)

(assert (=> b!116106 (= e!75809 tp_is_empty!2785)))

(declare-fun b!116107 () Bool)

(declare-fun res!56904 () Bool)

(assert (=> b!116107 (=> (not res!56904) (not e!75799))))

(assert (=> b!116107 (= res!56904 (bvsge (bvadd #b00000000000000000000000000000001 (mask!6929 newMap!16)) (_size!552 (v!3037 (underlying!408 thiss!992)))))))

(declare-fun b!116108 () Bool)

(declare-fun e!75803 () Bool)

(assert (=> b!116108 (= e!75803 tp_is_empty!2785)))

(declare-fun b!116109 () Bool)

(declare-fun e!75805 () Bool)

(assert (=> b!116109 (= e!75805 tp_is_empty!2785)))

(declare-fun mapNonEmpty!4293 () Bool)

(declare-fun tp!10580 () Bool)

(assert (=> mapNonEmpty!4293 (= mapRes!4293 (and tp!10580 e!75803))))

(declare-fun mapKey!4293 () (_ BitVec 32))

(declare-fun mapRest!4293 () (Array (_ BitVec 32) ValueCell!1049))

(declare-fun mapValue!4293 () ValueCell!1049)

(assert (=> mapNonEmpty!4293 (= (arr!2159 (_values!2697 newMap!16)) (store mapRest!4293 mapKey!4293 mapValue!4293))))

(declare-fun e!75800 () Bool)

(declare-fun e!75812 () Bool)

(declare-fun array_inv!1369 (array!4555) Bool)

(declare-fun array_inv!1370 (array!4557) Bool)

(assert (=> b!116110 (= e!75800 (and tp!10582 tp_is_empty!2785 (array_inv!1369 (_keys!4436 (v!3037 (underlying!408 thiss!992)))) (array_inv!1370 (_values!2697 (v!3037 (underlying!408 thiss!992)))) e!75812))))

(declare-fun b!116111 () Bool)

(declare-fun res!56905 () Bool)

(assert (=> b!116111 (=> (not res!56905) (not e!75799))))

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!116111 (= res!56905 (and (or (= (select (arr!2158 (_keys!4436 (v!3037 (underlying!408 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!2158 (_keys!4436 (v!3037 (underlying!408 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsgt from!355 #b00000000000000000000000000000000)))))

(declare-fun b!116112 () Bool)

(assert (=> b!116112 (= e!75799 e!75802)))

(declare-fun res!56908 () Bool)

(assert (=> b!116112 (=> (not res!56908) (not e!75802))))

(declare-datatypes ((tuple2!2496 0))(
  ( (tuple2!2497 (_1!1259 Bool) (_2!1259 LongMapFixedSize!1006)) )
))
(declare-fun lt!60210 () tuple2!2496)

(assert (=> b!116112 (= res!56908 (_1!1259 lt!60210))))

(declare-fun repackFrom!18 (LongMap!794 LongMapFixedSize!1006 (_ BitVec 32)) tuple2!2496)

(assert (=> b!116112 (= lt!60210 (repackFrom!18 thiss!992 newMap!16 (bvsub from!355 #b00000000000000000000000000000001)))))

(declare-fun b!116113 () Bool)

(declare-fun res!56907 () Bool)

(assert (=> b!116113 (=> (not res!56907) (not e!75802))))

(assert (=> b!116113 (= res!56907 (valid!479 (_2!1259 lt!60210)))))

(declare-fun b!116114 () Bool)

(declare-fun res!56903 () Bool)

(assert (=> b!116114 (=> (not res!56903) (not e!75799))))

(assert (=> b!116114 (= res!56903 (valid!479 newMap!16))))

(declare-fun b!116115 () Bool)

(assert (=> b!116115 (= e!75804 e!75800)))

(declare-fun mapNonEmpty!4294 () Bool)

(declare-fun tp!10579 () Bool)

(assert (=> mapNonEmpty!4294 (= mapRes!4294 (and tp!10579 e!75809))))

(declare-fun mapValue!4294 () ValueCell!1049)

(declare-fun mapRest!4294 () (Array (_ BitVec 32) ValueCell!1049))

(declare-fun mapKey!4294 () (_ BitVec 32))

(assert (=> mapNonEmpty!4294 (= (arr!2159 (_values!2697 (v!3037 (underlying!408 thiss!992)))) (store mapRest!4294 mapKey!4294 mapValue!4294))))

(declare-fun b!116116 () Bool)

(declare-fun res!56906 () Bool)

(assert (=> b!116116 (=> (not res!56906) (not e!75799))))

(declare-datatypes ((tuple2!2498 0))(
  ( (tuple2!2499 (_1!1260 (_ BitVec 64)) (_2!1260 V!3361)) )
))
(declare-datatypes ((List!1671 0))(
  ( (Nil!1668) (Cons!1667 (h!2267 tuple2!2498) (t!5928 List!1671)) )
))
(declare-datatypes ((ListLongMap!1617 0))(
  ( (ListLongMap!1618 (toList!824 List!1671)) )
))
(declare-fun getCurrentListMap!495 (array!4555 array!4557 (_ BitVec 32) (_ BitVec 32) V!3361 V!3361 (_ BitVec 32) Int) ListLongMap!1617)

(declare-fun map!1337 (LongMapFixedSize!1006) ListLongMap!1617)

(assert (=> b!116116 (= res!56906 (= (getCurrentListMap!495 (_keys!4436 (v!3037 (underlying!408 thiss!992))) (_values!2697 (v!3037 (underlying!408 thiss!992))) (mask!6929 (v!3037 (underlying!408 thiss!992))) (extraKeys!2503 (v!3037 (underlying!408 thiss!992))) (zeroValue!2581 (v!3037 (underlying!408 thiss!992))) (minValue!2581 (v!3037 (underlying!408 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2714 (v!3037 (underlying!408 thiss!992)))) (map!1337 newMap!16)))))

(declare-fun mapIsEmpty!4294 () Bool)

(assert (=> mapIsEmpty!4294 mapRes!4293))

(declare-fun b!116117 () Bool)

(declare-fun res!56902 () Bool)

(assert (=> b!116117 (=> (not res!56902) (not e!75799))))

(assert (=> b!116117 (= res!56902 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2420 (_keys!4436 (v!3037 (underlying!408 thiss!992)))))))))

(declare-fun b!116118 () Bool)

(assert (=> b!116118 (= e!75812 (and e!75805 mapRes!4294))))

(declare-fun condMapEmpty!4294 () Bool)

(declare-fun mapDefault!4293 () ValueCell!1049)

(assert (=> b!116118 (= condMapEmpty!4294 (= (arr!2159 (_values!2697 (v!3037 (underlying!408 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!1049)) mapDefault!4293)))))

(assert (=> b!116119 (= e!75811 (and tp!10581 tp_is_empty!2785 (array_inv!1369 (_keys!4436 newMap!16)) (array_inv!1370 (_values!2697 newMap!16)) e!75801))))

(assert (= (and start!13206 res!56909) b!116117))

(assert (= (and b!116117 res!56902) b!116114))

(assert (= (and b!116114 res!56903) b!116107))

(assert (= (and b!116107 res!56904) b!116116))

(assert (= (and b!116116 res!56906) b!116111))

(assert (= (and b!116111 res!56905) b!116112))

(assert (= (and b!116112 res!56908) b!116113))

(assert (= (and b!116113 res!56907) b!116102))

(assert (= (and b!116118 condMapEmpty!4294) mapIsEmpty!4293))

(assert (= (and b!116118 (not condMapEmpty!4294)) mapNonEmpty!4294))

(get-info :version)

(assert (= (and mapNonEmpty!4294 ((_ is ValueCellFull!1049) mapValue!4294)) b!116106))

(assert (= (and b!116118 ((_ is ValueCellFull!1049) mapDefault!4293)) b!116109))

(assert (= b!116110 b!116118))

(assert (= b!116115 b!116110))

(assert (= b!116104 b!116115))

(assert (= start!13206 b!116104))

(assert (= (and b!116105 condMapEmpty!4293) mapIsEmpty!4294))

(assert (= (and b!116105 (not condMapEmpty!4293)) mapNonEmpty!4293))

(assert (= (and mapNonEmpty!4293 ((_ is ValueCellFull!1049) mapValue!4293)) b!116108))

(assert (= (and b!116105 ((_ is ValueCellFull!1049) mapDefault!4294)) b!116103))

(assert (= b!116119 b!116105))

(assert (= start!13206 b!116119))

(declare-fun m!132025 () Bool)

(assert (=> b!116110 m!132025))

(declare-fun m!132027 () Bool)

(assert (=> b!116110 m!132027))

(declare-fun m!132029 () Bool)

(assert (=> start!13206 m!132029))

(declare-fun m!132031 () Bool)

(assert (=> b!116116 m!132031))

(declare-fun m!132033 () Bool)

(assert (=> b!116116 m!132033))

(declare-fun m!132035 () Bool)

(assert (=> b!116114 m!132035))

(declare-fun m!132037 () Bool)

(assert (=> mapNonEmpty!4294 m!132037))

(declare-fun m!132039 () Bool)

(assert (=> b!116112 m!132039))

(declare-fun m!132041 () Bool)

(assert (=> mapNonEmpty!4293 m!132041))

(declare-fun m!132043 () Bool)

(assert (=> b!116111 m!132043))

(declare-fun m!132045 () Bool)

(assert (=> b!116102 m!132045))

(declare-fun m!132047 () Bool)

(assert (=> b!116113 m!132047))

(declare-fun m!132049 () Bool)

(assert (=> b!116119 m!132049))

(declare-fun m!132051 () Bool)

(assert (=> b!116119 m!132051))

(check-sat (not b!116119) (not b!116116) (not b!116114) (not b!116112) (not b_next!2739) (not mapNonEmpty!4293) tp_is_empty!2785 (not start!13206) b_and!7223 (not b!116102) (not mapNonEmpty!4294) b_and!7221 (not b_next!2737) (not b!116113) (not b!116110))
(check-sat b_and!7221 b_and!7223 (not b_next!2737) (not b_next!2739))
(get-model)

(declare-fun d!32515 () Bool)

(assert (=> d!32515 (= (array_inv!1369 (_keys!4436 (v!3037 (underlying!408 thiss!992)))) (bvsge (size!2420 (_keys!4436 (v!3037 (underlying!408 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!116110 d!32515))

(declare-fun d!32517 () Bool)

(assert (=> d!32517 (= (array_inv!1370 (_values!2697 (v!3037 (underlying!408 thiss!992)))) (bvsge (size!2421 (_values!2697 (v!3037 (underlying!408 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!116110 d!32517))

(declare-fun d!32519 () Bool)

(declare-fun res!56964 () Bool)

(declare-fun e!75899 () Bool)

(assert (=> d!32519 (=> (not res!56964) (not e!75899))))

(declare-fun simpleValid!81 (LongMapFixedSize!1006) Bool)

(assert (=> d!32519 (= res!56964 (simpleValid!81 (v!3037 (underlying!408 thiss!992))))))

(assert (=> d!32519 (= (valid!479 (v!3037 (underlying!408 thiss!992))) e!75899)))

(declare-fun b!116234 () Bool)

(declare-fun res!56965 () Bool)

(assert (=> b!116234 (=> (not res!56965) (not e!75899))))

(declare-fun arrayCountValidKeys!0 (array!4555 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!116234 (= res!56965 (= (arrayCountValidKeys!0 (_keys!4436 (v!3037 (underlying!408 thiss!992))) #b00000000000000000000000000000000 (size!2420 (_keys!4436 (v!3037 (underlying!408 thiss!992))))) (_size!552 (v!3037 (underlying!408 thiss!992)))))))

(declare-fun b!116235 () Bool)

(declare-fun res!56966 () Bool)

(assert (=> b!116235 (=> (not res!56966) (not e!75899))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!4555 (_ BitVec 32)) Bool)

(assert (=> b!116235 (= res!56966 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4436 (v!3037 (underlying!408 thiss!992))) (mask!6929 (v!3037 (underlying!408 thiss!992)))))))

(declare-fun b!116236 () Bool)

(declare-datatypes ((List!1673 0))(
  ( (Nil!1670) (Cons!1669 (h!2269 (_ BitVec 64)) (t!5934 List!1673)) )
))
(declare-fun arrayNoDuplicates!0 (array!4555 (_ BitVec 32) List!1673) Bool)

(assert (=> b!116236 (= e!75899 (arrayNoDuplicates!0 (_keys!4436 (v!3037 (underlying!408 thiss!992))) #b00000000000000000000000000000000 Nil!1670))))

(assert (= (and d!32519 res!56964) b!116234))

(assert (= (and b!116234 res!56965) b!116235))

(assert (= (and b!116235 res!56966) b!116236))

(declare-fun m!132109 () Bool)

(assert (=> d!32519 m!132109))

(declare-fun m!132111 () Bool)

(assert (=> b!116234 m!132111))

(declare-fun m!132113 () Bool)

(assert (=> b!116235 m!132113))

(declare-fun m!132115 () Bool)

(assert (=> b!116236 m!132115))

(assert (=> b!116102 d!32519))

(declare-fun d!32521 () Bool)

(assert (=> d!32521 (= (array_inv!1369 (_keys!4436 newMap!16)) (bvsge (size!2420 (_keys!4436 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!116119 d!32521))

(declare-fun d!32523 () Bool)

(assert (=> d!32523 (= (array_inv!1370 (_values!2697 newMap!16)) (bvsge (size!2421 (_values!2697 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!116119 d!32523))

(declare-fun lt!60311 () ListLongMap!1617)

(declare-fun lt!60302 () (_ BitVec 64))

(declare-fun c!20586 () Bool)

(declare-fun call!12441 () ListLongMap!1617)

(declare-fun lt!60307 () (_ BitVec 64))

(declare-fun lt!60305 () ListLongMap!1617)

(declare-fun bm!12426 () Bool)

(declare-fun +!152 (ListLongMap!1617 tuple2!2498) ListLongMap!1617)

(assert (=> bm!12426 (= call!12441 (+!152 (ite c!20586 lt!60311 lt!60305) (ite c!20586 (tuple2!2499 lt!60302 (minValue!2581 (v!3037 (underlying!408 thiss!992)))) (tuple2!2499 lt!60307 (minValue!2581 (v!3037 (underlying!408 thiss!992)))))))))

(declare-fun c!20587 () Bool)

(declare-fun call!12432 () tuple2!2496)

(declare-fun bm!12427 () Bool)

(declare-fun lt!60281 () tuple2!2496)

(assert (=> bm!12427 (= call!12432 (repackFrom!18 thiss!992 (ite c!20587 (_2!1259 lt!60281) newMap!16) (bvsub (bvsub from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000001)))))

(declare-fun call!12431 () ListLongMap!1617)

(declare-fun lt!60294 () (_ BitVec 64))

(declare-fun bm!12428 () Bool)

(declare-fun call!12430 () ListLongMap!1617)

(assert (=> bm!12428 (= call!12430 (+!152 call!12431 (ite c!20586 (tuple2!2499 lt!60294 (zeroValue!2581 (v!3037 (underlying!408 thiss!992)))) (tuple2!2499 lt!60307 (minValue!2581 (v!3037 (underlying!408 thiss!992)))))))))

(declare-fun b!116265 () Bool)

(declare-fun e!75920 () tuple2!2496)

(assert (=> b!116265 (= e!75920 (tuple2!2497 true (_2!1259 lt!60281)))))

(declare-fun lt!60297 () ListLongMap!1617)

(declare-fun call!12439 () ListLongMap!1617)

(assert (=> b!116265 (= lt!60297 call!12439)))

(declare-fun lt!60285 () (_ BitVec 64))

(assert (=> b!116265 (= lt!60285 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-datatypes ((Unit!3601 0))(
  ( (Unit!3602) )
))
(declare-fun lt!60310 () Unit!3601)

(declare-fun call!12440 () Unit!3601)

(assert (=> b!116265 (= lt!60310 call!12440)))

(declare-fun call!12436 () ListLongMap!1617)

(declare-fun call!12434 () ListLongMap!1617)

(assert (=> b!116265 (= call!12436 call!12434)))

(declare-fun lt!60289 () Unit!3601)

(assert (=> b!116265 (= lt!60289 lt!60310)))

(declare-fun call!12435 () ListLongMap!1617)

(assert (=> b!116265 (= lt!60305 call!12435)))

(assert (=> b!116265 (= lt!60307 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!60303 () Unit!3601)

(declare-fun call!12438 () Unit!3601)

(assert (=> b!116265 (= lt!60303 call!12438)))

(declare-fun call!12433 () ListLongMap!1617)

(assert (=> b!116265 (= call!12430 call!12433)))

(declare-fun lt!60295 () Unit!3601)

(assert (=> b!116265 (= lt!60295 lt!60303)))

(declare-fun b!116266 () Bool)

(declare-fun e!75921 () tuple2!2496)

(assert (=> b!116266 (= e!75921 (tuple2!2497 true newMap!16))))

(declare-fun b!116267 () Bool)

(declare-fun e!75916 () tuple2!2496)

(declare-fun e!75919 () tuple2!2496)

(assert (=> b!116267 (= e!75916 e!75919)))

(declare-fun lt!60290 () V!3361)

(declare-fun lt!60312 () (_ BitVec 64))

(declare-fun update!177 (LongMapFixedSize!1006 (_ BitVec 64) V!3361) tuple2!2496)

(assert (=> b!116267 (= lt!60281 (update!177 newMap!16 lt!60312 lt!60290))))

(declare-fun c!20585 () Bool)

(declare-fun lt!60306 () ListLongMap!1617)

(declare-fun contains!853 (ListLongMap!1617 (_ BitVec 64)) Bool)

(assert (=> b!116267 (= c!20585 (contains!853 lt!60306 lt!60312))))

(declare-fun lt!60288 () Unit!3601)

(declare-fun e!75923 () Unit!3601)

(assert (=> b!116267 (= lt!60288 e!75923)))

(declare-fun c!20588 () Bool)

(assert (=> b!116267 (= c!20588 (_1!1259 lt!60281))))

(declare-fun bm!12429 () Bool)

(declare-fun call!12437 () ListLongMap!1617)

(assert (=> bm!12429 (= call!12437 (+!152 (ite c!20586 lt!60311 lt!60297) (tuple2!2499 lt!60312 lt!60290)))))

(declare-fun b!116268 () Bool)

(assert (=> b!116268 (= e!75916 e!75921)))

(declare-fun c!20589 () Bool)

(assert (=> b!116268 (= c!20589 (bvsgt (bvsub from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!116269 () Bool)

(declare-fun e!75917 () Bool)

(declare-fun lt!60308 () tuple2!2496)

(assert (=> b!116269 (= e!75917 (= (map!1337 (_2!1259 lt!60308)) (map!1337 (v!3037 (underlying!408 thiss!992)))))))

(declare-fun b!116270 () Bool)

(declare-fun lt!60282 () tuple2!2496)

(assert (=> b!116270 (= e!75920 (tuple2!2497 (_1!1259 lt!60282) (_2!1259 lt!60282)))))

(declare-fun lt!60283 () ListLongMap!1617)

(assert (=> b!116270 (= lt!60283 call!12439)))

(assert (=> b!116270 (= lt!60294 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!60299 () Unit!3601)

(assert (=> b!116270 (= lt!60299 call!12440)))

(assert (=> b!116270 (= call!12430 call!12436)))

(declare-fun lt!60286 () Unit!3601)

(assert (=> b!116270 (= lt!60286 lt!60299)))

(assert (=> b!116270 (= lt!60311 call!12433)))

(assert (=> b!116270 (= lt!60302 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!60300 () Unit!3601)

(assert (=> b!116270 (= lt!60300 call!12438)))

(assert (=> b!116270 (= call!12435 call!12434)))

(declare-fun lt!60298 () Unit!3601)

(assert (=> b!116270 (= lt!60298 lt!60300)))

(assert (=> b!116270 (= lt!60282 call!12432)))

(declare-fun bm!12430 () Bool)

(declare-fun addCommutativeForDiffKeys!63 (ListLongMap!1617 (_ BitVec 64) V!3361 (_ BitVec 64) V!3361) Unit!3601)

(assert (=> bm!12430 (= call!12440 (addCommutativeForDiffKeys!63 (ite c!20586 lt!60283 lt!60297) lt!60312 lt!60290 (ite c!20586 lt!60294 lt!60285) (zeroValue!2581 (v!3037 (underlying!408 thiss!992)))))))

(declare-fun bm!12431 () Bool)

(declare-fun call!12429 () ListLongMap!1617)

(assert (=> bm!12431 (= call!12429 (+!152 (ite c!20586 lt!60283 lt!60297) (ite c!20586 (tuple2!2499 lt!60294 (zeroValue!2581 (v!3037 (underlying!408 thiss!992)))) (tuple2!2499 lt!60285 (zeroValue!2581 (v!3037 (underlying!408 thiss!992)))))))))

(declare-fun bm!12432 () Bool)

(assert (=> bm!12432 (= call!12431 (+!152 (ite c!20586 lt!60283 lt!60305) (tuple2!2499 lt!60312 lt!60290)))))

(declare-fun b!116272 () Bool)

(declare-fun Unit!3603 () Unit!3601)

(assert (=> b!116272 (= e!75923 Unit!3603)))

(declare-fun b!116273 () Bool)

(declare-fun e!75922 () Bool)

(declare-fun lt!60304 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!4555 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!116273 (= e!75922 (arrayContainsKey!0 (_keys!4436 (v!3037 (underlying!408 thiss!992))) lt!60312 lt!60304))))

(declare-fun bm!12433 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!117 (array!4555 array!4557 (_ BitVec 32) (_ BitVec 32) V!3361 V!3361 (_ BitVec 32) Int) ListLongMap!1617)

(assert (=> bm!12433 (= call!12439 (getCurrentListMapNoExtraKeys!117 (_keys!4436 (v!3037 (underlying!408 thiss!992))) (_values!2697 (v!3037 (underlying!408 thiss!992))) (mask!6929 (v!3037 (underlying!408 thiss!992))) (extraKeys!2503 (v!3037 (underlying!408 thiss!992))) (zeroValue!2581 (v!3037 (underlying!408 thiss!992))) (minValue!2581 (v!3037 (underlying!408 thiss!992))) (bvadd (bvsub from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000001) (defaultEntry!2714 (v!3037 (underlying!408 thiss!992)))))))

(declare-fun bm!12434 () Bool)

(assert (=> bm!12434 (= call!12433 (+!152 (ite c!20586 call!12439 call!12441) (ite c!20586 (tuple2!2499 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2581 (v!3037 (underlying!408 thiss!992)))) (tuple2!2499 lt!60312 lt!60290))))))

(declare-fun bm!12435 () Bool)

(assert (=> bm!12435 (= call!12435 (+!152 (ite c!20586 call!12437 call!12439) (ite c!20586 (tuple2!2499 lt!60302 (minValue!2581 (v!3037 (underlying!408 thiss!992)))) (tuple2!2499 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2581 (v!3037 (underlying!408 thiss!992)))))))))

(declare-fun b!116274 () Bool)

(declare-fun e!75918 () Bool)

(assert (=> b!116274 (= e!75918 e!75917)))

(declare-fun res!56972 () Bool)

(assert (=> b!116274 (=> (not res!56972) (not e!75917))))

(assert (=> b!116274 (= res!56972 (valid!479 (_2!1259 lt!60308)))))

(declare-fun b!116275 () Bool)

(assert (=> b!116275 (= c!20586 (bvsgt (bvsub from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!116275 (= e!75919 e!75920)))

(declare-fun bm!12436 () Bool)

(assert (=> bm!12436 (= call!12438 (addCommutativeForDiffKeys!63 (ite c!20586 lt!60311 lt!60305) lt!60312 lt!60290 (ite c!20586 lt!60302 lt!60307) (minValue!2581 (v!3037 (underlying!408 thiss!992)))))))

(declare-fun b!116276 () Bool)

(assert (=> b!116276 (= e!75922 (ite (= lt!60312 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!2503 (v!3037 (underlying!408 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2503 (v!3037 (underlying!408 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun bm!12437 () Bool)

(assert (=> bm!12437 (= call!12434 (+!152 (ite c!20586 call!12441 call!12429) (tuple2!2499 lt!60312 lt!60290)))))

(declare-fun b!116277 () Bool)

(assert (=> b!116277 false))

(declare-fun lt!60287 () Unit!3601)

(declare-fun lt!60293 () Unit!3601)

(assert (=> b!116277 (= lt!60287 lt!60293)))

(declare-fun lt!60291 () (_ BitVec 32))

(assert (=> b!116277 (not (arrayContainsKey!0 (_keys!4436 (v!3037 (underlying!408 thiss!992))) lt!60312 lt!60291))))

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!4555 (_ BitVec 32) (_ BitVec 64) List!1673) Unit!3601)

(assert (=> b!116277 (= lt!60293 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!4436 (v!3037 (underlying!408 thiss!992))) lt!60291 lt!60312 (Cons!1669 lt!60312 Nil!1670)))))

(assert (=> b!116277 (= lt!60291 (bvadd (bvsub from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000001))))

(declare-fun lt!60284 () Unit!3601)

(declare-fun lt!60309 () Unit!3601)

(assert (=> b!116277 (= lt!60284 lt!60309)))

(assert (=> b!116277 (arrayNoDuplicates!0 (_keys!4436 (v!3037 (underlying!408 thiss!992))) (bvsub from!355 #b00000000000000000000000000000001) Nil!1670)))

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!4555 (_ BitVec 32) (_ BitVec 32)) Unit!3601)

(assert (=> b!116277 (= lt!60309 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!4436 (v!3037 (underlying!408 thiss!992))) #b00000000000000000000000000000000 (bvsub from!355 #b00000000000000000000000000000001)))))

(declare-fun lt!60301 () Unit!3601)

(declare-fun lt!60296 () Unit!3601)

(assert (=> b!116277 (= lt!60301 lt!60296)))

(assert (=> b!116277 e!75922))

(declare-fun c!20590 () Bool)

(assert (=> b!116277 (= c!20590 (and (not (= lt!60312 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!60312 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lemmaListMapContainsThenArrayContainsFrom!127 (array!4555 array!4557 (_ BitVec 32) (_ BitVec 32) V!3361 V!3361 (_ BitVec 64) (_ BitVec 32) Int) Unit!3601)

(assert (=> b!116277 (= lt!60296 (lemmaListMapContainsThenArrayContainsFrom!127 (_keys!4436 (v!3037 (underlying!408 thiss!992))) (_values!2697 (v!3037 (underlying!408 thiss!992))) (mask!6929 (v!3037 (underlying!408 thiss!992))) (extraKeys!2503 (v!3037 (underlying!408 thiss!992))) (zeroValue!2581 (v!3037 (underlying!408 thiss!992))) (minValue!2581 (v!3037 (underlying!408 thiss!992))) lt!60312 lt!60304 (defaultEntry!2714 (v!3037 (underlying!408 thiss!992)))))))

(assert (=> b!116277 (= lt!60304 (bvadd (bvsub from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000001))))

(declare-fun Unit!3604 () Unit!3601)

(assert (=> b!116277 (= e!75923 Unit!3604)))

(declare-fun bm!12438 () Bool)

(assert (=> bm!12438 (= call!12436 (+!152 (ite c!20586 call!12429 call!12437) (ite c!20586 (tuple2!2499 lt!60312 lt!60290) (tuple2!2499 lt!60285 (zeroValue!2581 (v!3037 (underlying!408 thiss!992)))))))))

(declare-fun b!116278 () Bool)

(assert (=> b!116278 (= e!75919 (tuple2!2497 false (_2!1259 lt!60281)))))

(declare-fun d!32525 () Bool)

(assert (=> d!32525 e!75918))

(declare-fun res!56971 () Bool)

(assert (=> d!32525 (=> res!56971 e!75918)))

(assert (=> d!32525 (= res!56971 (not (_1!1259 lt!60308)))))

(assert (=> d!32525 (= lt!60308 e!75916)))

(assert (=> d!32525 (= c!20587 (and (not (= lt!60312 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!60312 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!32525 (= lt!60306 (map!1337 newMap!16))))

(declare-fun get!1405 (ValueCell!1049 V!3361) V!3361)

(declare-fun dynLambda!401 (Int (_ BitVec 64)) V!3361)

(assert (=> d!32525 (= lt!60290 (get!1405 (select (arr!2159 (_values!2697 (v!3037 (underlying!408 thiss!992)))) (bvsub from!355 #b00000000000000000000000000000001)) (dynLambda!401 (defaultEntry!2714 (v!3037 (underlying!408 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!32525 (= lt!60312 (select (arr!2158 (_keys!4436 (v!3037 (underlying!408 thiss!992)))) (bvsub from!355 #b00000000000000000000000000000001)))))

(assert (=> d!32525 (valid!480 thiss!992)))

(assert (=> d!32525 (= (repackFrom!18 thiss!992 newMap!16 (bvsub from!355 #b00000000000000000000000000000001)) lt!60308)))

(declare-fun b!116271 () Bool)

(declare-fun lt!60292 () tuple2!2496)

(assert (=> b!116271 (= lt!60292 call!12432)))

(assert (=> b!116271 (= e!75921 (tuple2!2497 (_1!1259 lt!60292) (_2!1259 lt!60292)))))

(assert (= (and d!32525 c!20587) b!116267))

(assert (= (and d!32525 (not c!20587)) b!116268))

(assert (= (and b!116267 c!20585) b!116277))

(assert (= (and b!116267 (not c!20585)) b!116272))

(assert (= (and b!116277 c!20590) b!116273))

(assert (= (and b!116277 (not c!20590)) b!116276))

(assert (= (and b!116267 c!20588) b!116275))

(assert (= (and b!116267 (not c!20588)) b!116278))

(assert (= (and b!116275 c!20586) b!116270))

(assert (= (and b!116275 (not c!20586)) b!116265))

(assert (= (or b!116270 b!116265) bm!12433))

(assert (= (or b!116270 b!116265) bm!12436))

(assert (= (or b!116270 b!116265) bm!12431))

(assert (= (or b!116270 b!116265) bm!12430))

(assert (= (or b!116270 b!116265) bm!12432))

(assert (= (or b!116270 b!116265) bm!12426))

(assert (= (or b!116270 b!116265) bm!12429))

(assert (= (or b!116270 b!116265) bm!12437))

(assert (= (or b!116270 b!116265) bm!12434))

(assert (= (or b!116270 b!116265) bm!12428))

(assert (= (or b!116270 b!116265) bm!12435))

(assert (= (or b!116270 b!116265) bm!12438))

(assert (= (and b!116268 c!20589) b!116271))

(assert (= (and b!116268 (not c!20589)) b!116266))

(assert (= (or b!116270 b!116271) bm!12427))

(assert (= (and d!32525 (not res!56971)) b!116274))

(assert (= (and b!116274 res!56972) b!116269))

(declare-fun b_lambda!5161 () Bool)

(assert (=> (not b_lambda!5161) (not d!32525)))

(declare-fun t!5931 () Bool)

(declare-fun tb!2225 () Bool)

(assert (=> (and b!116110 (= (defaultEntry!2714 (v!3037 (underlying!408 thiss!992))) (defaultEntry!2714 (v!3037 (underlying!408 thiss!992)))) t!5931) tb!2225))

(declare-fun result!3711 () Bool)

(assert (=> tb!2225 (= result!3711 tp_is_empty!2785)))

(assert (=> d!32525 t!5931))

(declare-fun b_and!7233 () Bool)

(assert (= b_and!7221 (and (=> t!5931 result!3711) b_and!7233)))

(declare-fun tb!2227 () Bool)

(declare-fun t!5933 () Bool)

(assert (=> (and b!116119 (= (defaultEntry!2714 newMap!16) (defaultEntry!2714 (v!3037 (underlying!408 thiss!992)))) t!5933) tb!2227))

(declare-fun result!3715 () Bool)

(assert (= result!3715 result!3711))

(assert (=> d!32525 t!5933))

(declare-fun b_and!7235 () Bool)

(assert (= b_and!7223 (and (=> t!5933 result!3715) b_and!7235)))

(declare-fun m!132117 () Bool)

(assert (=> bm!12432 m!132117))

(declare-fun m!132119 () Bool)

(assert (=> bm!12426 m!132119))

(declare-fun m!132121 () Bool)

(assert (=> bm!12433 m!132121))

(declare-fun m!132123 () Bool)

(assert (=> bm!12431 m!132123))

(declare-fun m!132125 () Bool)

(assert (=> bm!12436 m!132125))

(declare-fun m!132127 () Bool)

(assert (=> d!32525 m!132127))

(declare-fun m!132129 () Bool)

(assert (=> d!32525 m!132129))

(assert (=> d!32525 m!132033))

(assert (=> d!32525 m!132029))

(assert (=> d!32525 m!132127))

(assert (=> d!32525 m!132129))

(declare-fun m!132131 () Bool)

(assert (=> d!32525 m!132131))

(declare-fun m!132133 () Bool)

(assert (=> d!32525 m!132133))

(declare-fun m!132135 () Bool)

(assert (=> bm!12435 m!132135))

(declare-fun m!132137 () Bool)

(assert (=> b!116269 m!132137))

(declare-fun m!132139 () Bool)

(assert (=> b!116269 m!132139))

(declare-fun m!132141 () Bool)

(assert (=> bm!12437 m!132141))

(declare-fun m!132143 () Bool)

(assert (=> bm!12428 m!132143))

(declare-fun m!132145 () Bool)

(assert (=> bm!12430 m!132145))

(declare-fun m!132147 () Bool)

(assert (=> bm!12429 m!132147))

(declare-fun m!132149 () Bool)

(assert (=> bm!12434 m!132149))

(declare-fun m!132151 () Bool)

(assert (=> b!116273 m!132151))

(declare-fun m!132153 () Bool)

(assert (=> bm!12427 m!132153))

(declare-fun m!132155 () Bool)

(assert (=> b!116274 m!132155))

(declare-fun m!132157 () Bool)

(assert (=> b!116277 m!132157))

(declare-fun m!132159 () Bool)

(assert (=> b!116277 m!132159))

(declare-fun m!132161 () Bool)

(assert (=> b!116277 m!132161))

(declare-fun m!132163 () Bool)

(assert (=> b!116277 m!132163))

(declare-fun m!132165 () Bool)

(assert (=> b!116277 m!132165))

(declare-fun m!132167 () Bool)

(assert (=> b!116267 m!132167))

(declare-fun m!132169 () Bool)

(assert (=> b!116267 m!132169))

(declare-fun m!132171 () Bool)

(assert (=> bm!12438 m!132171))

(assert (=> b!116112 d!32525))

(declare-fun d!32527 () Bool)

(assert (=> d!32527 (= (valid!480 thiss!992) (valid!479 (v!3037 (underlying!408 thiss!992))))))

(declare-fun bs!4722 () Bool)

(assert (= bs!4722 d!32527))

(assert (=> bs!4722 m!132045))

(assert (=> start!13206 d!32527))

(declare-fun b!116323 () Bool)

(declare-fun e!75962 () Bool)

(declare-fun e!75951 () Bool)

(assert (=> b!116323 (= e!75962 e!75951)))

(declare-fun res!56999 () Bool)

(declare-fun call!12458 () Bool)

(assert (=> b!116323 (= res!56999 call!12458)))

(assert (=> b!116323 (=> (not res!56999) (not e!75951))))

(declare-fun bm!12453 () Bool)

(declare-fun call!12460 () ListLongMap!1617)

(declare-fun call!12461 () ListLongMap!1617)

(assert (=> bm!12453 (= call!12460 call!12461)))

(declare-fun b!116324 () Bool)

(declare-fun res!56995 () Bool)

(declare-fun e!75957 () Bool)

(assert (=> b!116324 (=> (not res!56995) (not e!75957))))

(declare-fun e!75958 () Bool)

(assert (=> b!116324 (= res!56995 e!75958)))

(declare-fun c!20608 () Bool)

(assert (=> b!116324 (= c!20608 (not (= (bvand (extraKeys!2503 (v!3037 (underlying!408 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!116325 () Bool)

(declare-fun res!56998 () Bool)

(assert (=> b!116325 (=> (not res!56998) (not e!75957))))

(declare-fun e!75956 () Bool)

(assert (=> b!116325 (= res!56998 e!75956)))

(declare-fun res!56997 () Bool)

(assert (=> b!116325 (=> res!56997 e!75956)))

(declare-fun e!75952 () Bool)

(assert (=> b!116325 (= res!56997 (not e!75952))))

(declare-fun res!56992 () Bool)

(assert (=> b!116325 (=> (not res!56992) (not e!75952))))

(assert (=> b!116325 (= res!56992 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2420 (_keys!4436 (v!3037 (underlying!408 thiss!992))))))))

(declare-fun bm!12454 () Bool)

(declare-fun lt!60370 () ListLongMap!1617)

(assert (=> bm!12454 (= call!12458 (contains!853 lt!60370 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun call!12457 () ListLongMap!1617)

(declare-fun c!20606 () Bool)

(declare-fun call!12459 () ListLongMap!1617)

(declare-fun call!12456 () ListLongMap!1617)

(declare-fun bm!12455 () Bool)

(declare-fun c!20605 () Bool)

(assert (=> bm!12455 (= call!12461 (+!152 (ite c!20605 call!12456 (ite c!20606 call!12459 call!12457)) (ite (or c!20605 c!20606) (tuple2!2499 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2581 (v!3037 (underlying!408 thiss!992)))) (tuple2!2499 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2581 (v!3037 (underlying!408 thiss!992)))))))))

(declare-fun b!116326 () Bool)

(declare-fun e!75954 () Unit!3601)

(declare-fun lt!60367 () Unit!3601)

(assert (=> b!116326 (= e!75954 lt!60367)))

(declare-fun lt!60378 () ListLongMap!1617)

(assert (=> b!116326 (= lt!60378 (getCurrentListMapNoExtraKeys!117 (_keys!4436 (v!3037 (underlying!408 thiss!992))) (_values!2697 (v!3037 (underlying!408 thiss!992))) (mask!6929 (v!3037 (underlying!408 thiss!992))) (extraKeys!2503 (v!3037 (underlying!408 thiss!992))) (zeroValue!2581 (v!3037 (underlying!408 thiss!992))) (minValue!2581 (v!3037 (underlying!408 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2714 (v!3037 (underlying!408 thiss!992)))))))

(declare-fun lt!60363 () (_ BitVec 64))

(assert (=> b!116326 (= lt!60363 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!60369 () (_ BitVec 64))

(assert (=> b!116326 (= lt!60369 (select (arr!2158 (_keys!4436 (v!3037 (underlying!408 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!60366 () Unit!3601)

(declare-fun addStillContains!81 (ListLongMap!1617 (_ BitVec 64) V!3361 (_ BitVec 64)) Unit!3601)

(assert (=> b!116326 (= lt!60366 (addStillContains!81 lt!60378 lt!60363 (zeroValue!2581 (v!3037 (underlying!408 thiss!992))) lt!60369))))

(assert (=> b!116326 (contains!853 (+!152 lt!60378 (tuple2!2499 lt!60363 (zeroValue!2581 (v!3037 (underlying!408 thiss!992))))) lt!60369)))

(declare-fun lt!60371 () Unit!3601)

(assert (=> b!116326 (= lt!60371 lt!60366)))

(declare-fun lt!60373 () ListLongMap!1617)

(assert (=> b!116326 (= lt!60373 (getCurrentListMapNoExtraKeys!117 (_keys!4436 (v!3037 (underlying!408 thiss!992))) (_values!2697 (v!3037 (underlying!408 thiss!992))) (mask!6929 (v!3037 (underlying!408 thiss!992))) (extraKeys!2503 (v!3037 (underlying!408 thiss!992))) (zeroValue!2581 (v!3037 (underlying!408 thiss!992))) (minValue!2581 (v!3037 (underlying!408 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2714 (v!3037 (underlying!408 thiss!992)))))))

(declare-fun lt!60377 () (_ BitVec 64))

(assert (=> b!116326 (= lt!60377 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!60361 () (_ BitVec 64))

(assert (=> b!116326 (= lt!60361 (select (arr!2158 (_keys!4436 (v!3037 (underlying!408 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!60364 () Unit!3601)

(declare-fun addApplyDifferent!81 (ListLongMap!1617 (_ BitVec 64) V!3361 (_ BitVec 64)) Unit!3601)

(assert (=> b!116326 (= lt!60364 (addApplyDifferent!81 lt!60373 lt!60377 (minValue!2581 (v!3037 (underlying!408 thiss!992))) lt!60361))))

(declare-fun apply!105 (ListLongMap!1617 (_ BitVec 64)) V!3361)

(assert (=> b!116326 (= (apply!105 (+!152 lt!60373 (tuple2!2499 lt!60377 (minValue!2581 (v!3037 (underlying!408 thiss!992))))) lt!60361) (apply!105 lt!60373 lt!60361))))

(declare-fun lt!60375 () Unit!3601)

(assert (=> b!116326 (= lt!60375 lt!60364)))

(declare-fun lt!60376 () ListLongMap!1617)

(assert (=> b!116326 (= lt!60376 (getCurrentListMapNoExtraKeys!117 (_keys!4436 (v!3037 (underlying!408 thiss!992))) (_values!2697 (v!3037 (underlying!408 thiss!992))) (mask!6929 (v!3037 (underlying!408 thiss!992))) (extraKeys!2503 (v!3037 (underlying!408 thiss!992))) (zeroValue!2581 (v!3037 (underlying!408 thiss!992))) (minValue!2581 (v!3037 (underlying!408 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2714 (v!3037 (underlying!408 thiss!992)))))))

(declare-fun lt!60362 () (_ BitVec 64))

(assert (=> b!116326 (= lt!60362 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!60360 () (_ BitVec 64))

(assert (=> b!116326 (= lt!60360 (select (arr!2158 (_keys!4436 (v!3037 (underlying!408 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!60359 () Unit!3601)

(assert (=> b!116326 (= lt!60359 (addApplyDifferent!81 lt!60376 lt!60362 (zeroValue!2581 (v!3037 (underlying!408 thiss!992))) lt!60360))))

(assert (=> b!116326 (= (apply!105 (+!152 lt!60376 (tuple2!2499 lt!60362 (zeroValue!2581 (v!3037 (underlying!408 thiss!992))))) lt!60360) (apply!105 lt!60376 lt!60360))))

(declare-fun lt!60357 () Unit!3601)

(assert (=> b!116326 (= lt!60357 lt!60359)))

(declare-fun lt!60365 () ListLongMap!1617)

(assert (=> b!116326 (= lt!60365 (getCurrentListMapNoExtraKeys!117 (_keys!4436 (v!3037 (underlying!408 thiss!992))) (_values!2697 (v!3037 (underlying!408 thiss!992))) (mask!6929 (v!3037 (underlying!408 thiss!992))) (extraKeys!2503 (v!3037 (underlying!408 thiss!992))) (zeroValue!2581 (v!3037 (underlying!408 thiss!992))) (minValue!2581 (v!3037 (underlying!408 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2714 (v!3037 (underlying!408 thiss!992)))))))

(declare-fun lt!60368 () (_ BitVec 64))

(assert (=> b!116326 (= lt!60368 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!60374 () (_ BitVec 64))

(assert (=> b!116326 (= lt!60374 (select (arr!2158 (_keys!4436 (v!3037 (underlying!408 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(assert (=> b!116326 (= lt!60367 (addApplyDifferent!81 lt!60365 lt!60368 (minValue!2581 (v!3037 (underlying!408 thiss!992))) lt!60374))))

(assert (=> b!116326 (= (apply!105 (+!152 lt!60365 (tuple2!2499 lt!60368 (minValue!2581 (v!3037 (underlying!408 thiss!992))))) lt!60374) (apply!105 lt!60365 lt!60374))))

(declare-fun d!32529 () Bool)

(assert (=> d!32529 e!75957))

(declare-fun res!56996 () Bool)

(assert (=> d!32529 (=> (not res!56996) (not e!75957))))

(assert (=> d!32529 (= res!56996 (or (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2420 (_keys!4436 (v!3037 (underlying!408 thiss!992))))) (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2420 (_keys!4436 (v!3037 (underlying!408 thiss!992))))))))))

(declare-fun lt!60358 () ListLongMap!1617)

(assert (=> d!32529 (= lt!60370 lt!60358)))

(declare-fun lt!60372 () Unit!3601)

(assert (=> d!32529 (= lt!60372 e!75954)))

(declare-fun c!20603 () Bool)

(declare-fun e!75955 () Bool)

(assert (=> d!32529 (= c!20603 e!75955)))

(declare-fun res!56994 () Bool)

(assert (=> d!32529 (=> (not res!56994) (not e!75955))))

(assert (=> d!32529 (= res!56994 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2420 (_keys!4436 (v!3037 (underlying!408 thiss!992))))))))

(declare-fun e!75959 () ListLongMap!1617)

(assert (=> d!32529 (= lt!60358 e!75959)))

(assert (=> d!32529 (= c!20605 (and (not (= (bvand (extraKeys!2503 (v!3037 (underlying!408 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2503 (v!3037 (underlying!408 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!32529 (validMask!0 (mask!6929 (v!3037 (underlying!408 thiss!992))))))

(assert (=> d!32529 (= (getCurrentListMap!495 (_keys!4436 (v!3037 (underlying!408 thiss!992))) (_values!2697 (v!3037 (underlying!408 thiss!992))) (mask!6929 (v!3037 (underlying!408 thiss!992))) (extraKeys!2503 (v!3037 (underlying!408 thiss!992))) (zeroValue!2581 (v!3037 (underlying!408 thiss!992))) (minValue!2581 (v!3037 (underlying!408 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2714 (v!3037 (underlying!408 thiss!992)))) lt!60370)))

(declare-fun b!116327 () Bool)

(declare-fun Unit!3605 () Unit!3601)

(assert (=> b!116327 (= e!75954 Unit!3605)))

(declare-fun bm!12456 () Bool)

(assert (=> bm!12456 (= call!12457 call!12459)))

(declare-fun bm!12457 () Bool)

(assert (=> bm!12457 (= call!12459 call!12456)))

(declare-fun b!116328 () Bool)

(assert (=> b!116328 (= e!75951 (= (apply!105 lt!60370 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2581 (v!3037 (underlying!408 thiss!992)))))))

(declare-fun b!116329 () Bool)

(declare-fun e!75960 () ListLongMap!1617)

(assert (=> b!116329 (= e!75960 call!12460)))

(declare-fun b!116330 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!116330 (= e!75952 (validKeyInArray!0 (select (arr!2158 (_keys!4436 (v!3037 (underlying!408 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!116331 () Bool)

(assert (=> b!116331 (= e!75959 e!75960)))

(assert (=> b!116331 (= c!20606 (and (not (= (bvand (extraKeys!2503 (v!3037 (underlying!408 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2503 (v!3037 (underlying!408 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!12458 () Bool)

(declare-fun call!12462 () Bool)

(assert (=> bm!12458 (= call!12462 (contains!853 lt!60370 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!116332 () Bool)

(assert (=> b!116332 (= e!75955 (validKeyInArray!0 (select (arr!2158 (_keys!4436 (v!3037 (underlying!408 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun e!75953 () Bool)

(declare-fun b!116333 () Bool)

(assert (=> b!116333 (= e!75953 (= (apply!105 lt!60370 (select (arr!2158 (_keys!4436 (v!3037 (underlying!408 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1405 (select (arr!2159 (_values!2697 (v!3037 (underlying!408 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!401 (defaultEntry!2714 (v!3037 (underlying!408 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!116333 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2421 (_values!2697 (v!3037 (underlying!408 thiss!992))))))))

(assert (=> b!116333 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2420 (_keys!4436 (v!3037 (underlying!408 thiss!992))))))))

(declare-fun b!116334 () Bool)

(declare-fun e!75961 () Bool)

(assert (=> b!116334 (= e!75961 (= (apply!105 lt!60370 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2581 (v!3037 (underlying!408 thiss!992)))))))

(declare-fun bm!12459 () Bool)

(assert (=> bm!12459 (= call!12456 (getCurrentListMapNoExtraKeys!117 (_keys!4436 (v!3037 (underlying!408 thiss!992))) (_values!2697 (v!3037 (underlying!408 thiss!992))) (mask!6929 (v!3037 (underlying!408 thiss!992))) (extraKeys!2503 (v!3037 (underlying!408 thiss!992))) (zeroValue!2581 (v!3037 (underlying!408 thiss!992))) (minValue!2581 (v!3037 (underlying!408 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2714 (v!3037 (underlying!408 thiss!992)))))))

(declare-fun b!116335 () Bool)

(assert (=> b!116335 (= e!75962 (not call!12458))))

(declare-fun b!116336 () Bool)

(assert (=> b!116336 (= e!75959 (+!152 call!12461 (tuple2!2499 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2581 (v!3037 (underlying!408 thiss!992))))))))

(declare-fun b!116337 () Bool)

(assert (=> b!116337 (= e!75956 e!75953)))

(declare-fun res!56991 () Bool)

(assert (=> b!116337 (=> (not res!56991) (not e!75953))))

(assert (=> b!116337 (= res!56991 (contains!853 lt!60370 (select (arr!2158 (_keys!4436 (v!3037 (underlying!408 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!116337 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2420 (_keys!4436 (v!3037 (underlying!408 thiss!992))))))))

(declare-fun b!116338 () Bool)

(assert (=> b!116338 (= e!75957 e!75962)))

(declare-fun c!20604 () Bool)

(assert (=> b!116338 (= c!20604 (not (= (bvand (extraKeys!2503 (v!3037 (underlying!408 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!116339 () Bool)

(declare-fun e!75950 () ListLongMap!1617)

(assert (=> b!116339 (= e!75950 call!12457)))

(declare-fun b!116340 () Bool)

(assert (=> b!116340 (= e!75950 call!12460)))

(declare-fun b!116341 () Bool)

(assert (=> b!116341 (= e!75958 (not call!12462))))

(declare-fun b!116342 () Bool)

(assert (=> b!116342 (= e!75958 e!75961)))

(declare-fun res!56993 () Bool)

(assert (=> b!116342 (= res!56993 call!12462)))

(assert (=> b!116342 (=> (not res!56993) (not e!75961))))

(declare-fun b!116343 () Bool)

(declare-fun c!20607 () Bool)

(assert (=> b!116343 (= c!20607 (and (not (= (bvand (extraKeys!2503 (v!3037 (underlying!408 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2503 (v!3037 (underlying!408 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!116343 (= e!75960 e!75950)))

(assert (= (and d!32529 c!20605) b!116336))

(assert (= (and d!32529 (not c!20605)) b!116331))

(assert (= (and b!116331 c!20606) b!116329))

(assert (= (and b!116331 (not c!20606)) b!116343))

(assert (= (and b!116343 c!20607) b!116340))

(assert (= (and b!116343 (not c!20607)) b!116339))

(assert (= (or b!116340 b!116339) bm!12456))

(assert (= (or b!116329 bm!12456) bm!12457))

(assert (= (or b!116329 b!116340) bm!12453))

(assert (= (or b!116336 bm!12457) bm!12459))

(assert (= (or b!116336 bm!12453) bm!12455))

(assert (= (and d!32529 res!56994) b!116332))

(assert (= (and d!32529 c!20603) b!116326))

(assert (= (and d!32529 (not c!20603)) b!116327))

(assert (= (and d!32529 res!56996) b!116325))

(assert (= (and b!116325 res!56992) b!116330))

(assert (= (and b!116325 (not res!56997)) b!116337))

(assert (= (and b!116337 res!56991) b!116333))

(assert (= (and b!116325 res!56998) b!116324))

(assert (= (and b!116324 c!20608) b!116342))

(assert (= (and b!116324 (not c!20608)) b!116341))

(assert (= (and b!116342 res!56993) b!116334))

(assert (= (or b!116342 b!116341) bm!12458))

(assert (= (and b!116324 res!56995) b!116338))

(assert (= (and b!116338 c!20604) b!116323))

(assert (= (and b!116338 (not c!20604)) b!116335))

(assert (= (and b!116323 res!56999) b!116328))

(assert (= (or b!116323 b!116335) bm!12454))

(declare-fun b_lambda!5163 () Bool)

(assert (=> (not b_lambda!5163) (not b!116333)))

(assert (=> b!116333 t!5931))

(declare-fun b_and!7237 () Bool)

(assert (= b_and!7233 (and (=> t!5931 result!3711) b_and!7237)))

(assert (=> b!116333 t!5933))

(declare-fun b_and!7239 () Bool)

(assert (= b_and!7235 (and (=> t!5933 result!3715) b_and!7239)))

(declare-fun m!132173 () Bool)

(assert (=> b!116334 m!132173))

(declare-fun m!132175 () Bool)

(assert (=> b!116328 m!132175))

(declare-fun m!132177 () Bool)

(assert (=> b!116333 m!132177))

(assert (=> b!116333 m!132177))

(assert (=> b!116333 m!132129))

(declare-fun m!132179 () Bool)

(assert (=> b!116333 m!132179))

(assert (=> b!116333 m!132129))

(declare-fun m!132181 () Bool)

(assert (=> b!116333 m!132181))

(declare-fun m!132183 () Bool)

(assert (=> b!116333 m!132183))

(assert (=> b!116333 m!132181))

(declare-fun m!132185 () Bool)

(assert (=> bm!12458 m!132185))

(assert (=> b!116330 m!132181))

(assert (=> b!116330 m!132181))

(declare-fun m!132187 () Bool)

(assert (=> b!116330 m!132187))

(declare-fun m!132189 () Bool)

(assert (=> bm!12459 m!132189))

(declare-fun m!132191 () Bool)

(assert (=> d!32529 m!132191))

(declare-fun m!132193 () Bool)

(assert (=> bm!12454 m!132193))

(assert (=> b!116332 m!132181))

(assert (=> b!116332 m!132181))

(assert (=> b!116332 m!132187))

(declare-fun m!132195 () Bool)

(assert (=> bm!12455 m!132195))

(declare-fun m!132197 () Bool)

(assert (=> b!116326 m!132197))

(declare-fun m!132199 () Bool)

(assert (=> b!116326 m!132199))

(declare-fun m!132201 () Bool)

(assert (=> b!116326 m!132201))

(declare-fun m!132203 () Bool)

(assert (=> b!116326 m!132203))

(declare-fun m!132205 () Bool)

(assert (=> b!116326 m!132205))

(declare-fun m!132207 () Bool)

(assert (=> b!116326 m!132207))

(assert (=> b!116326 m!132189))

(declare-fun m!132209 () Bool)

(assert (=> b!116326 m!132209))

(assert (=> b!116326 m!132201))

(declare-fun m!132211 () Bool)

(assert (=> b!116326 m!132211))

(assert (=> b!116326 m!132209))

(declare-fun m!132213 () Bool)

(assert (=> b!116326 m!132213))

(declare-fun m!132215 () Bool)

(assert (=> b!116326 m!132215))

(declare-fun m!132217 () Bool)

(assert (=> b!116326 m!132217))

(declare-fun m!132219 () Bool)

(assert (=> b!116326 m!132219))

(declare-fun m!132221 () Bool)

(assert (=> b!116326 m!132221))

(assert (=> b!116326 m!132219))

(declare-fun m!132223 () Bool)

(assert (=> b!116326 m!132223))

(assert (=> b!116326 m!132203))

(declare-fun m!132225 () Bool)

(assert (=> b!116326 m!132225))

(assert (=> b!116326 m!132181))

(declare-fun m!132227 () Bool)

(assert (=> b!116336 m!132227))

(assert (=> b!116337 m!132181))

(assert (=> b!116337 m!132181))

(declare-fun m!132229 () Bool)

(assert (=> b!116337 m!132229))

(assert (=> b!116116 d!32529))

(declare-fun d!32531 () Bool)

(assert (=> d!32531 (= (map!1337 newMap!16) (getCurrentListMap!495 (_keys!4436 newMap!16) (_values!2697 newMap!16) (mask!6929 newMap!16) (extraKeys!2503 newMap!16) (zeroValue!2581 newMap!16) (minValue!2581 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2714 newMap!16)))))

(declare-fun bs!4723 () Bool)

(assert (= bs!4723 d!32531))

(declare-fun m!132231 () Bool)

(assert (=> bs!4723 m!132231))

(assert (=> b!116116 d!32531))

(declare-fun d!32533 () Bool)

(declare-fun res!57000 () Bool)

(declare-fun e!75963 () Bool)

(assert (=> d!32533 (=> (not res!57000) (not e!75963))))

(assert (=> d!32533 (= res!57000 (simpleValid!81 newMap!16))))

(assert (=> d!32533 (= (valid!479 newMap!16) e!75963)))

(declare-fun b!116344 () Bool)

(declare-fun res!57001 () Bool)

(assert (=> b!116344 (=> (not res!57001) (not e!75963))))

(assert (=> b!116344 (= res!57001 (= (arrayCountValidKeys!0 (_keys!4436 newMap!16) #b00000000000000000000000000000000 (size!2420 (_keys!4436 newMap!16))) (_size!552 newMap!16)))))

(declare-fun b!116345 () Bool)

(declare-fun res!57002 () Bool)

(assert (=> b!116345 (=> (not res!57002) (not e!75963))))

(assert (=> b!116345 (= res!57002 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4436 newMap!16) (mask!6929 newMap!16)))))

(declare-fun b!116346 () Bool)

(assert (=> b!116346 (= e!75963 (arrayNoDuplicates!0 (_keys!4436 newMap!16) #b00000000000000000000000000000000 Nil!1670))))

(assert (= (and d!32533 res!57000) b!116344))

(assert (= (and b!116344 res!57001) b!116345))

(assert (= (and b!116345 res!57002) b!116346))

(declare-fun m!132233 () Bool)

(assert (=> d!32533 m!132233))

(declare-fun m!132235 () Bool)

(assert (=> b!116344 m!132235))

(declare-fun m!132237 () Bool)

(assert (=> b!116345 m!132237))

(declare-fun m!132239 () Bool)

(assert (=> b!116346 m!132239))

(assert (=> b!116114 d!32533))

(declare-fun d!32535 () Bool)

(declare-fun res!57003 () Bool)

(declare-fun e!75964 () Bool)

(assert (=> d!32535 (=> (not res!57003) (not e!75964))))

(assert (=> d!32535 (= res!57003 (simpleValid!81 (_2!1259 lt!60210)))))

(assert (=> d!32535 (= (valid!479 (_2!1259 lt!60210)) e!75964)))

(declare-fun b!116347 () Bool)

(declare-fun res!57004 () Bool)

(assert (=> b!116347 (=> (not res!57004) (not e!75964))))

(assert (=> b!116347 (= res!57004 (= (arrayCountValidKeys!0 (_keys!4436 (_2!1259 lt!60210)) #b00000000000000000000000000000000 (size!2420 (_keys!4436 (_2!1259 lt!60210)))) (_size!552 (_2!1259 lt!60210))))))

(declare-fun b!116348 () Bool)

(declare-fun res!57005 () Bool)

(assert (=> b!116348 (=> (not res!57005) (not e!75964))))

(assert (=> b!116348 (= res!57005 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4436 (_2!1259 lt!60210)) (mask!6929 (_2!1259 lt!60210))))))

(declare-fun b!116349 () Bool)

(assert (=> b!116349 (= e!75964 (arrayNoDuplicates!0 (_keys!4436 (_2!1259 lt!60210)) #b00000000000000000000000000000000 Nil!1670))))

(assert (= (and d!32535 res!57003) b!116347))

(assert (= (and b!116347 res!57004) b!116348))

(assert (= (and b!116348 res!57005) b!116349))

(declare-fun m!132241 () Bool)

(assert (=> d!32535 m!132241))

(declare-fun m!132243 () Bool)

(assert (=> b!116347 m!132243))

(declare-fun m!132245 () Bool)

(assert (=> b!116348 m!132245))

(declare-fun m!132247 () Bool)

(assert (=> b!116349 m!132247))

(assert (=> b!116113 d!32535))

(declare-fun mapIsEmpty!4309 () Bool)

(declare-fun mapRes!4309 () Bool)

(assert (=> mapIsEmpty!4309 mapRes!4309))

(declare-fun mapNonEmpty!4309 () Bool)

(declare-fun tp!10609 () Bool)

(declare-fun e!75969 () Bool)

(assert (=> mapNonEmpty!4309 (= mapRes!4309 (and tp!10609 e!75969))))

(declare-fun mapRest!4309 () (Array (_ BitVec 32) ValueCell!1049))

(declare-fun mapValue!4309 () ValueCell!1049)

(declare-fun mapKey!4309 () (_ BitVec 32))

(assert (=> mapNonEmpty!4309 (= mapRest!4293 (store mapRest!4309 mapKey!4309 mapValue!4309))))

(declare-fun b!116356 () Bool)

(assert (=> b!116356 (= e!75969 tp_is_empty!2785)))

(declare-fun b!116357 () Bool)

(declare-fun e!75970 () Bool)

(assert (=> b!116357 (= e!75970 tp_is_empty!2785)))

(declare-fun condMapEmpty!4309 () Bool)

(declare-fun mapDefault!4309 () ValueCell!1049)

(assert (=> mapNonEmpty!4293 (= condMapEmpty!4309 (= mapRest!4293 ((as const (Array (_ BitVec 32) ValueCell!1049)) mapDefault!4309)))))

(assert (=> mapNonEmpty!4293 (= tp!10580 (and e!75970 mapRes!4309))))

(assert (= (and mapNonEmpty!4293 condMapEmpty!4309) mapIsEmpty!4309))

(assert (= (and mapNonEmpty!4293 (not condMapEmpty!4309)) mapNonEmpty!4309))

(assert (= (and mapNonEmpty!4309 ((_ is ValueCellFull!1049) mapValue!4309)) b!116356))

(assert (= (and mapNonEmpty!4293 ((_ is ValueCellFull!1049) mapDefault!4309)) b!116357))

(declare-fun m!132249 () Bool)

(assert (=> mapNonEmpty!4309 m!132249))

(declare-fun mapIsEmpty!4310 () Bool)

(declare-fun mapRes!4310 () Bool)

(assert (=> mapIsEmpty!4310 mapRes!4310))

(declare-fun mapNonEmpty!4310 () Bool)

(declare-fun tp!10610 () Bool)

(declare-fun e!75971 () Bool)

(assert (=> mapNonEmpty!4310 (= mapRes!4310 (and tp!10610 e!75971))))

(declare-fun mapRest!4310 () (Array (_ BitVec 32) ValueCell!1049))

(declare-fun mapKey!4310 () (_ BitVec 32))

(declare-fun mapValue!4310 () ValueCell!1049)

(assert (=> mapNonEmpty!4310 (= mapRest!4294 (store mapRest!4310 mapKey!4310 mapValue!4310))))

(declare-fun b!116358 () Bool)

(assert (=> b!116358 (= e!75971 tp_is_empty!2785)))

(declare-fun b!116359 () Bool)

(declare-fun e!75972 () Bool)

(assert (=> b!116359 (= e!75972 tp_is_empty!2785)))

(declare-fun condMapEmpty!4310 () Bool)

(declare-fun mapDefault!4310 () ValueCell!1049)

(assert (=> mapNonEmpty!4294 (= condMapEmpty!4310 (= mapRest!4294 ((as const (Array (_ BitVec 32) ValueCell!1049)) mapDefault!4310)))))

(assert (=> mapNonEmpty!4294 (= tp!10579 (and e!75972 mapRes!4310))))

(assert (= (and mapNonEmpty!4294 condMapEmpty!4310) mapIsEmpty!4310))

(assert (= (and mapNonEmpty!4294 (not condMapEmpty!4310)) mapNonEmpty!4310))

(assert (= (and mapNonEmpty!4310 ((_ is ValueCellFull!1049) mapValue!4310)) b!116358))

(assert (= (and mapNonEmpty!4294 ((_ is ValueCellFull!1049) mapDefault!4310)) b!116359))

(declare-fun m!132251 () Bool)

(assert (=> mapNonEmpty!4310 m!132251))

(declare-fun b_lambda!5165 () Bool)

(assert (= b_lambda!5161 (or (and b!116110 b_free!2737) (and b!116119 b_free!2739 (= (defaultEntry!2714 newMap!16) (defaultEntry!2714 (v!3037 (underlying!408 thiss!992))))) b_lambda!5165)))

(declare-fun b_lambda!5167 () Bool)

(assert (= b_lambda!5163 (or (and b!116110 b_free!2737) (and b!116119 b_free!2739 (= (defaultEntry!2714 newMap!16) (defaultEntry!2714 (v!3037 (underlying!408 thiss!992))))) b_lambda!5167)))

(check-sat b_and!7237 (not bm!12427) (not b!116330) (not d!32531) (not bm!12426) (not b!116334) (not mapNonEmpty!4309) (not bm!12433) (not b!116336) (not bm!12428) (not b!116332) (not b!116267) (not bm!12455) (not bm!12458) (not b!116235) (not b!116348) (not b!116333) (not b!116349) (not b!116346) (not bm!12431) (not b_lambda!5165) (not b!116274) (not b!116347) (not bm!12454) (not mapNonEmpty!4310) (not b!116337) (not b_next!2739) (not b!116269) (not b!116236) (not bm!12430) (not d!32533) (not d!32527) (not d!32525) tp_is_empty!2785 (not b!116344) (not bm!12459) (not d!32535) (not b_lambda!5167) (not d!32529) (not b!116326) (not b!116273) (not bm!12432) b_and!7239 (not d!32519) (not bm!12437) (not b!116328) (not bm!12438) (not bm!12429) (not b!116345) (not bm!12434) (not bm!12435) (not bm!12436) (not b!116277) (not b_next!2737) (not b!116234))
(check-sat b_and!7237 b_and!7239 (not b_next!2737) (not b_next!2739))
