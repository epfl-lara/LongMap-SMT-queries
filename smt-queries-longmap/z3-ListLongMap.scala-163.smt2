; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3108 () Bool)

(assert start!3108)

(declare-fun b!18897 () Bool)

(declare-fun b_free!655 () Bool)

(declare-fun b_next!655 () Bool)

(assert (=> b!18897 (= b_free!655 (not b_next!655))))

(declare-fun tp!3159 () Bool)

(declare-fun b_and!1309 () Bool)

(assert (=> b!18897 (= tp!3159 b_and!1309)))

(declare-fun b!18888 () Bool)

(declare-fun e!12093 () Bool)

(declare-fun e!12089 () Bool)

(assert (=> b!18888 (= e!12093 e!12089)))

(declare-fun b!18889 () Bool)

(declare-fun e!12094 () Bool)

(declare-datatypes ((V!1051 0))(
  ( (V!1052 (val!486 Int)) )
))
(declare-datatypes ((ValueCell!260 0))(
  ( (ValueCellFull!260 (v!1485 V!1051)) (EmptyCell!260) )
))
(declare-datatypes ((array!1027 0))(
  ( (array!1028 (arr!494 (Array (_ BitVec 32) ValueCell!260)) (size!584 (_ BitVec 32))) )
))
(declare-datatypes ((array!1029 0))(
  ( (array!1030 (arr!495 (Array (_ BitVec 32) (_ BitVec 64))) (size!585 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!106 0))(
  ( (LongMapFixedSize!107 (defaultEntry!1672 Int) (mask!4609 (_ BitVec 32)) (extraKeys!1582 (_ BitVec 32)) (zeroValue!1606 V!1051) (minValue!1606 V!1051) (_size!86 (_ BitVec 32)) (_keys!3097 array!1029) (_values!1668 array!1027) (_vacant!86 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!106 0))(
  ( (Cell!107 (v!1486 LongMapFixedSize!106)) )
))
(declare-datatypes ((LongMap!106 0))(
  ( (LongMap!107 (underlying!64 Cell!106)) )
))
(declare-datatypes ((tuple2!812 0))(
  ( (tuple2!813 (_1!408 Bool) (_2!408 LongMap!106)) )
))
(declare-fun lt!5352 () tuple2!812)

(declare-fun thiss!848 () LongMap!106)

(declare-datatypes ((tuple2!814 0))(
  ( (tuple2!815 (_1!409 (_ BitVec 64)) (_2!409 V!1051)) )
))
(declare-datatypes ((List!539 0))(
  ( (Nil!536) (Cons!535 (h!1101 tuple2!814) (t!3176 List!539)) )
))
(declare-datatypes ((ListLongMap!539 0))(
  ( (ListLongMap!540 (toList!285 List!539)) )
))
(declare-fun map!361 (LongMap!106) ListLongMap!539)

(assert (=> b!18889 (= e!12094 (not (= (map!361 (_2!408 lt!5352)) (map!361 thiss!848))))))

(declare-fun b!18890 () Bool)

(declare-fun e!12095 () tuple2!812)

(assert (=> b!18890 (= e!12095 (tuple2!813 true thiss!848))))

(declare-fun b!18891 () Bool)

(declare-fun e!12090 () Bool)

(assert (=> b!18891 (= e!12090 e!12094)))

(declare-fun res!13011 () Bool)

(assert (=> b!18891 (=> res!13011 e!12094)))

(declare-fun valid!59 (LongMap!106) Bool)

(assert (=> b!18891 (= res!13011 (not (valid!59 (_2!408 lt!5352))))))

(declare-fun b!18892 () Bool)

(declare-fun e!12097 () Bool)

(declare-fun tp_is_empty!919 () Bool)

(assert (=> b!18892 (= e!12097 tp_is_empty!919)))

(declare-fun b!18893 () Bool)

(declare-fun e!12098 () Bool)

(declare-fun mapRes!817 () Bool)

(assert (=> b!18893 (= e!12098 (and e!12097 mapRes!817))))

(declare-fun condMapEmpty!817 () Bool)

(declare-fun mapDefault!817 () ValueCell!260)

(assert (=> b!18893 (= condMapEmpty!817 (= (arr!494 (_values!1668 (v!1486 (underlying!64 thiss!848)))) ((as const (Array (_ BitVec 32) ValueCell!260)) mapDefault!817)))))

(declare-fun mapNonEmpty!817 () Bool)

(declare-fun tp!3160 () Bool)

(declare-fun e!12092 () Bool)

(assert (=> mapNonEmpty!817 (= mapRes!817 (and tp!3160 e!12092))))

(declare-fun mapRest!817 () (Array (_ BitVec 32) ValueCell!260))

(declare-fun mapValue!817 () ValueCell!260)

(declare-fun mapKey!817 () (_ BitVec 32))

(assert (=> mapNonEmpty!817 (= (arr!494 (_values!1668 (v!1486 (underlying!64 thiss!848)))) (store mapRest!817 mapKey!817 mapValue!817))))

(declare-fun mapIsEmpty!817 () Bool)

(assert (=> mapIsEmpty!817 mapRes!817))

(declare-fun b!18894 () Bool)

(assert (=> b!18894 (= e!12092 tp_is_empty!919)))

(declare-fun res!13009 () Bool)

(declare-fun e!12091 () Bool)

(assert (=> start!3108 (=> (not res!13009) (not e!12091))))

(assert (=> start!3108 (= res!13009 (valid!59 thiss!848))))

(assert (=> start!3108 e!12091))

(assert (=> start!3108 e!12093))

(declare-fun b!18895 () Bool)

(declare-fun repack!27 (LongMap!106) tuple2!812)

(assert (=> b!18895 (= e!12095 (repack!27 thiss!848))))

(declare-fun b!18896 () Bool)

(declare-fun e!12096 () Bool)

(assert (=> b!18896 (= e!12089 e!12096)))

(declare-fun array_inv!361 (array!1029) Bool)

(declare-fun array_inv!362 (array!1027) Bool)

(assert (=> b!18897 (= e!12096 (and tp!3159 tp_is_empty!919 (array_inv!361 (_keys!3097 (v!1486 (underlying!64 thiss!848)))) (array_inv!362 (_values!1668 (v!1486 (underlying!64 thiss!848)))) e!12098))))

(declare-fun b!18898 () Bool)

(assert (=> b!18898 (= e!12091 e!12090)))

(declare-fun res!13010 () Bool)

(assert (=> b!18898 (=> (not res!13010) (not e!12090))))

(assert (=> b!18898 (= res!13010 (not (_1!408 lt!5352)))))

(assert (=> b!18898 (= lt!5352 e!12095)))

(declare-fun c!2015 () Bool)

(declare-fun imbalanced!31 (LongMap!106) Bool)

(assert (=> b!18898 (= c!2015 (imbalanced!31 thiss!848))))

(assert (= (and start!3108 res!13009) b!18898))

(assert (= (and b!18898 c!2015) b!18895))

(assert (= (and b!18898 (not c!2015)) b!18890))

(assert (= (and b!18898 res!13010) b!18891))

(assert (= (and b!18891 (not res!13011)) b!18889))

(assert (= (and b!18893 condMapEmpty!817) mapIsEmpty!817))

(assert (= (and b!18893 (not condMapEmpty!817)) mapNonEmpty!817))

(get-info :version)

(assert (= (and mapNonEmpty!817 ((_ is ValueCellFull!260) mapValue!817)) b!18894))

(assert (= (and b!18893 ((_ is ValueCellFull!260) mapDefault!817)) b!18892))

(assert (= b!18897 b!18893))

(assert (= b!18896 b!18897))

(assert (= b!18888 b!18896))

(assert (= start!3108 b!18888))

(declare-fun m!13385 () Bool)

(assert (=> b!18889 m!13385))

(declare-fun m!13387 () Bool)

(assert (=> b!18889 m!13387))

(declare-fun m!13389 () Bool)

(assert (=> mapNonEmpty!817 m!13389))

(declare-fun m!13391 () Bool)

(assert (=> b!18898 m!13391))

(declare-fun m!13393 () Bool)

(assert (=> b!18897 m!13393))

(declare-fun m!13395 () Bool)

(assert (=> b!18897 m!13395))

(declare-fun m!13397 () Bool)

(assert (=> start!3108 m!13397))

(declare-fun m!13399 () Bool)

(assert (=> b!18895 m!13399))

(declare-fun m!13401 () Bool)

(assert (=> b!18891 m!13401))

(check-sat (not b!18898) (not b!18891) (not b_next!655) (not mapNonEmpty!817) (not b!18895) (not start!3108) (not b!18889) tp_is_empty!919 b_and!1309 (not b!18897))
(check-sat b_and!1309 (not b_next!655))
(get-model)

(declare-fun d!3497 () Bool)

(assert (=> d!3497 (= (array_inv!361 (_keys!3097 (v!1486 (underlying!64 thiss!848)))) (bvsge (size!585 (_keys!3097 (v!1486 (underlying!64 thiss!848)))) #b00000000000000000000000000000000))))

(assert (=> b!18897 d!3497))

(declare-fun d!3499 () Bool)

(assert (=> d!3499 (= (array_inv!362 (_values!1668 (v!1486 (underlying!64 thiss!848)))) (bvsge (size!584 (_values!1668 (v!1486 (underlying!64 thiss!848)))) #b00000000000000000000000000000000))))

(assert (=> b!18897 d!3499))

(declare-fun d!3501 () Bool)

(declare-fun valid!61 (LongMapFixedSize!106) Bool)

(assert (=> d!3501 (= (valid!59 thiss!848) (valid!61 (v!1486 (underlying!64 thiss!848))))))

(declare-fun bs!853 () Bool)

(assert (= bs!853 d!3501))

(declare-fun m!13439 () Bool)

(assert (=> bs!853 m!13439))

(assert (=> start!3108 d!3501))

(declare-fun b!18983 () Bool)

(declare-datatypes ((tuple3!4 0))(
  ( (tuple3!5 (_1!412 Bool) (_2!412 Cell!106) (_3!2 LongMap!106)) )
))
(declare-fun e!12176 () tuple3!4)

(declare-datatypes ((tuple2!820 0))(
  ( (tuple2!821 (_1!413 Bool) (_2!413 LongMapFixedSize!106)) )
))
(declare-fun lt!5384 () tuple2!820)

(assert (=> b!18983 (= e!12176 (ite (_1!413 lt!5384) (tuple3!5 true (underlying!64 thiss!848) (LongMap!107 (Cell!107 (_2!413 lt!5384)))) (tuple3!5 false (Cell!107 (_2!413 lt!5384)) thiss!848)))))

(declare-datatypes ((tuple2!822 0))(
  ( (tuple2!823 (_1!414 Bool) (_2!414 Cell!106)) )
))
(declare-fun lt!5381 () tuple2!822)

(declare-fun repackFrom!3 (LongMap!106 LongMapFixedSize!106 (_ BitVec 32)) tuple2!820)

(assert (=> b!18983 (= lt!5384 (repackFrom!3 thiss!848 (v!1486 (_2!414 lt!5381)) (bvsub (size!585 (_keys!3097 (v!1486 (underlying!64 thiss!848)))) #b00000000000000000000000000000001)))))

(declare-fun bm!871 () Bool)

(declare-fun call!874 () LongMapFixedSize!106)

(declare-fun lt!5380 () (_ BitVec 32))

(declare-fun getNewLongMapFixedSize!9 ((_ BitVec 32) Int) LongMapFixedSize!106)

(assert (=> bm!871 (= call!874 (getNewLongMapFixedSize!9 lt!5380 (defaultEntry!1672 (v!1486 (underlying!64 thiss!848)))))))

(declare-fun bm!872 () Bool)

(declare-fun call!876 () tuple2!820)

(declare-fun call!877 () tuple2!820)

(assert (=> bm!872 (= call!876 call!877)))

(declare-fun b!18984 () Bool)

(declare-fun c!2030 () Bool)

(assert (=> b!18984 (= c!2030 (and (not (= (bvand (extraKeys!1582 (v!1486 (underlying!64 thiss!848))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!1582 (v!1486 (underlying!64 thiss!848))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!12178 () tuple2!822)

(declare-fun e!12179 () tuple2!822)

(assert (=> b!18984 (= e!12178 e!12179)))

(declare-fun b!18985 () Bool)

(declare-fun lt!5382 () tuple2!820)

(assert (=> b!18985 (= e!12179 (tuple2!823 (_1!413 lt!5382) (Cell!107 (_2!413 lt!5382))))))

(assert (=> b!18985 (= lt!5382 call!876)))

(declare-fun b!18986 () Bool)

(declare-fun e!12180 () Bool)

(declare-fun lt!5385 () tuple2!812)

(assert (=> b!18986 (= e!12180 (= (map!361 (_2!408 lt!5385)) (map!361 thiss!848)))))

(declare-fun b!18987 () Bool)

(assert (=> b!18987 (= e!12176 (tuple3!5 false (_2!414 lt!5381) thiss!848))))

(declare-fun bm!873 () Bool)

(declare-fun call!875 () LongMapFixedSize!106)

(assert (=> bm!873 (= call!875 call!874)))

(declare-fun b!18988 () Bool)

(declare-fun lt!5388 () tuple2!820)

(assert (=> b!18988 (= lt!5388 call!876)))

(assert (=> b!18988 (= e!12178 (tuple2!823 (_1!413 lt!5388) (Cell!107 (_2!413 lt!5388))))))

(declare-fun b!18989 () Bool)

(declare-fun lt!5387 () Cell!106)

(assert (=> b!18989 (= e!12179 (tuple2!823 true lt!5387))))

(declare-fun d!3503 () Bool)

(assert (=> d!3503 e!12180))

(declare-fun res!13032 () Bool)

(assert (=> d!3503 (=> res!13032 e!12180)))

(assert (=> d!3503 (= res!13032 (= (_1!408 lt!5385) false))))

(declare-fun lt!5379 () tuple3!4)

(assert (=> d!3503 (= lt!5385 (tuple2!813 (_1!412 lt!5379) (_3!2 lt!5379)))))

(assert (=> d!3503 (= lt!5379 e!12176)))

(declare-fun c!2031 () Bool)

(assert (=> d!3503 (= c!2031 (not (_1!414 lt!5381)))))

(declare-fun e!12177 () tuple2!822)

(assert (=> d!3503 (= lt!5381 e!12177)))

(declare-fun c!2032 () Bool)

(assert (=> d!3503 (= c!2032 (and (not (= (bvand (extraKeys!1582 (v!1486 (underlying!64 thiss!848))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!1582 (v!1486 (underlying!64 thiss!848))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!3503 (= lt!5387 (Cell!107 (getNewLongMapFixedSize!9 lt!5380 (defaultEntry!1672 (v!1486 (underlying!64 thiss!848))))))))

(declare-fun computeNewMask!3 (LongMap!106 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!3503 (= lt!5380 (computeNewMask!3 thiss!848 (mask!4609 (v!1486 (underlying!64 thiss!848))) (_vacant!86 (v!1486 (underlying!64 thiss!848))) (_size!86 (v!1486 (underlying!64 thiss!848)))))))

(assert (=> d!3503 (valid!59 thiss!848)))

(assert (=> d!3503 (= (repack!27 thiss!848) lt!5385)))

(declare-fun b!18990 () Bool)

(assert (=> b!18990 (= e!12177 e!12178)))

(declare-fun c!2033 () Bool)

(assert (=> b!18990 (= c!2033 (and (not (= (bvand (extraKeys!1582 (v!1486 (underlying!64 thiss!848))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!1582 (v!1486 (underlying!64 thiss!848))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!18991 () Bool)

(declare-fun lt!5386 () tuple2!820)

(declare-fun lt!5383 () tuple2!820)

(assert (=> b!18991 (= e!12177 (tuple2!823 (and (_1!413 lt!5386) (_1!413 lt!5383)) (Cell!107 (_2!413 lt!5383))))))

(declare-fun update!15 (LongMapFixedSize!106 (_ BitVec 64) V!1051) tuple2!820)

(assert (=> b!18991 (= lt!5386 (update!15 call!874 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1606 (v!1486 (underlying!64 thiss!848)))))))

(assert (=> b!18991 (= lt!5383 call!877)))

(declare-fun bm!874 () Bool)

(assert (=> bm!874 (= call!877 (update!15 (ite c!2032 (_2!413 lt!5386) call!875) (ite c!2032 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2033 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!2032 (minValue!1606 (v!1486 (underlying!64 thiss!848))) (ite c!2033 (zeroValue!1606 (v!1486 (underlying!64 thiss!848))) (minValue!1606 (v!1486 (underlying!64 thiss!848)))))))))

(assert (= (and d!3503 c!2032) b!18991))

(assert (= (and d!3503 (not c!2032)) b!18990))

(assert (= (and b!18990 c!2033) b!18988))

(assert (= (and b!18990 (not c!2033)) b!18984))

(assert (= (and b!18984 c!2030) b!18985))

(assert (= (and b!18984 (not c!2030)) b!18989))

(assert (= (or b!18988 b!18985) bm!873))

(assert (= (or b!18988 b!18985) bm!872))

(assert (= (or b!18991 bm!872) bm!874))

(assert (= (or b!18991 bm!873) bm!871))

(assert (= (and d!3503 c!2031) b!18987))

(assert (= (and d!3503 (not c!2031)) b!18983))

(assert (= (and d!3503 (not res!13032)) b!18986))

(declare-fun m!13441 () Bool)

(assert (=> b!18983 m!13441))

(declare-fun m!13443 () Bool)

(assert (=> bm!874 m!13443))

(declare-fun m!13445 () Bool)

(assert (=> bm!871 m!13445))

(assert (=> d!3503 m!13445))

(declare-fun m!13447 () Bool)

(assert (=> d!3503 m!13447))

(assert (=> d!3503 m!13397))

(declare-fun m!13449 () Bool)

(assert (=> b!18986 m!13449))

(assert (=> b!18986 m!13387))

(declare-fun m!13451 () Bool)

(assert (=> b!18991 m!13451))

(assert (=> b!18895 d!3503))

(declare-fun d!3505 () Bool)

(assert (=> d!3505 (= (valid!59 (_2!408 lt!5352)) (valid!61 (v!1486 (underlying!64 (_2!408 lt!5352)))))))

(declare-fun bs!854 () Bool)

(assert (= bs!854 d!3505))

(declare-fun m!13453 () Bool)

(assert (=> bs!854 m!13453))

(assert (=> b!18891 d!3505))

(declare-fun d!3507 () Bool)

(declare-fun map!363 (LongMapFixedSize!106) ListLongMap!539)

(assert (=> d!3507 (= (map!361 (_2!408 lt!5352)) (map!363 (v!1486 (underlying!64 (_2!408 lt!5352)))))))

(declare-fun bs!855 () Bool)

(assert (= bs!855 d!3507))

(declare-fun m!13455 () Bool)

(assert (=> bs!855 m!13455))

(assert (=> b!18889 d!3507))

(declare-fun d!3509 () Bool)

(assert (=> d!3509 (= (map!361 thiss!848) (map!363 (v!1486 (underlying!64 thiss!848))))))

(declare-fun bs!856 () Bool)

(assert (= bs!856 d!3509))

(declare-fun m!13457 () Bool)

(assert (=> bs!856 m!13457))

(assert (=> b!18889 d!3509))

(declare-fun d!3511 () Bool)

(assert (=> d!3511 (= (imbalanced!31 thiss!848) (or (bvsgt (bvmul #b00000000000000000000000000000010 (bvadd (_size!86 (v!1486 (underlying!64 thiss!848))) (_vacant!86 (v!1486 (underlying!64 thiss!848))))) (mask!4609 (v!1486 (underlying!64 thiss!848)))) (bvsgt (_vacant!86 (v!1486 (underlying!64 thiss!848))) (_size!86 (v!1486 (underlying!64 thiss!848))))))))

(assert (=> b!18898 d!3511))

(declare-fun b!18999 () Bool)

(declare-fun e!12185 () Bool)

(assert (=> b!18999 (= e!12185 tp_is_empty!919)))

(declare-fun b!18998 () Bool)

(declare-fun e!12186 () Bool)

(assert (=> b!18998 (= e!12186 tp_is_empty!919)))

(declare-fun mapNonEmpty!826 () Bool)

(declare-fun mapRes!826 () Bool)

(declare-fun tp!3175 () Bool)

(assert (=> mapNonEmpty!826 (= mapRes!826 (and tp!3175 e!12186))))

(declare-fun mapRest!826 () (Array (_ BitVec 32) ValueCell!260))

(declare-fun mapValue!826 () ValueCell!260)

(declare-fun mapKey!826 () (_ BitVec 32))

(assert (=> mapNonEmpty!826 (= mapRest!817 (store mapRest!826 mapKey!826 mapValue!826))))

(declare-fun mapIsEmpty!826 () Bool)

(assert (=> mapIsEmpty!826 mapRes!826))

(declare-fun condMapEmpty!826 () Bool)

(declare-fun mapDefault!826 () ValueCell!260)

(assert (=> mapNonEmpty!817 (= condMapEmpty!826 (= mapRest!817 ((as const (Array (_ BitVec 32) ValueCell!260)) mapDefault!826)))))

(assert (=> mapNonEmpty!817 (= tp!3160 (and e!12185 mapRes!826))))

(assert (= (and mapNonEmpty!817 condMapEmpty!826) mapIsEmpty!826))

(assert (= (and mapNonEmpty!817 (not condMapEmpty!826)) mapNonEmpty!826))

(assert (= (and mapNonEmpty!826 ((_ is ValueCellFull!260) mapValue!826)) b!18998))

(assert (= (and mapNonEmpty!817 ((_ is ValueCellFull!260) mapDefault!826)) b!18999))

(declare-fun m!13459 () Bool)

(assert (=> mapNonEmpty!826 m!13459))

(check-sat (not d!3509) (not bm!874) (not b!18983) (not b!18991) (not d!3501) (not d!3507) (not d!3505) (not b!18986) (not b_next!655) (not d!3503) (not bm!871) b_and!1309 tp_is_empty!919 (not mapNonEmpty!826))
(check-sat b_and!1309 (not b_next!655))
