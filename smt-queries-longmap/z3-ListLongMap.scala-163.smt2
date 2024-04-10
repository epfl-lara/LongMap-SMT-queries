; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3114 () Bool)

(assert start!3114)

(declare-fun b!18972 () Bool)

(declare-fun b_free!657 () Bool)

(declare-fun b_next!657 () Bool)

(assert (=> b!18972 (= b_free!657 (not b_next!657))))

(declare-fun tp!3166 () Bool)

(declare-fun b_and!1317 () Bool)

(assert (=> b!18972 (= tp!3166 b_and!1317)))

(declare-fun b!18963 () Bool)

(declare-fun e!12164 () Bool)

(declare-fun e!12158 () Bool)

(declare-fun mapRes!820 () Bool)

(assert (=> b!18963 (= e!12164 (and e!12158 mapRes!820))))

(declare-fun condMapEmpty!820 () Bool)

(declare-datatypes ((V!1053 0))(
  ( (V!1054 (val!487 Int)) )
))
(declare-datatypes ((ValueCell!261 0))(
  ( (ValueCellFull!261 (v!1487 V!1053)) (EmptyCell!261) )
))
(declare-datatypes ((array!1049 0))(
  ( (array!1050 (arr!505 (Array (_ BitVec 32) ValueCell!261)) (size!595 (_ BitVec 32))) )
))
(declare-datatypes ((array!1051 0))(
  ( (array!1052 (arr!506 (Array (_ BitVec 32) (_ BitVec 64))) (size!596 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!108 0))(
  ( (LongMapFixedSize!109 (defaultEntry!1673 Int) (mask!4610 (_ BitVec 32)) (extraKeys!1583 (_ BitVec 32)) (zeroValue!1607 V!1053) (minValue!1607 V!1053) (_size!87 (_ BitVec 32)) (_keys!3098 array!1051) (_values!1669 array!1049) (_vacant!87 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!108 0))(
  ( (Cell!109 (v!1488 LongMapFixedSize!108)) )
))
(declare-datatypes ((LongMap!108 0))(
  ( (LongMap!109 (underlying!65 Cell!108)) )
))
(declare-fun thiss!848 () LongMap!108)

(declare-fun mapDefault!820 () ValueCell!261)

(assert (=> b!18963 (= condMapEmpty!820 (= (arr!505 (_values!1669 (v!1488 (underlying!65 thiss!848)))) ((as const (Array (_ BitVec 32) ValueCell!261)) mapDefault!820)))))

(declare-fun mapNonEmpty!820 () Bool)

(declare-fun tp!3165 () Bool)

(declare-fun e!12161 () Bool)

(assert (=> mapNonEmpty!820 (= mapRes!820 (and tp!3165 e!12161))))

(declare-fun mapKey!820 () (_ BitVec 32))

(declare-fun mapRest!820 () (Array (_ BitVec 32) ValueCell!261))

(declare-fun mapValue!820 () ValueCell!261)

(assert (=> mapNonEmpty!820 (= (arr!505 (_values!1669 (v!1488 (underlying!65 thiss!848)))) (store mapRest!820 mapKey!820 mapValue!820))))

(declare-fun b!18964 () Bool)

(declare-fun e!12156 () Bool)

(declare-fun e!12157 () Bool)

(assert (=> b!18964 (= e!12156 e!12157)))

(declare-fun b!18965 () Bool)

(declare-datatypes ((tuple2!806 0))(
  ( (tuple2!807 (_1!405 Bool) (_2!405 LongMap!108)) )
))
(declare-fun e!12162 () tuple2!806)

(assert (=> b!18965 (= e!12162 (tuple2!807 true thiss!848))))

(declare-fun b!18966 () Bool)

(declare-fun repack!26 (LongMap!108) tuple2!806)

(assert (=> b!18966 (= e!12162 (repack!26 thiss!848))))

(declare-fun b!18967 () Bool)

(declare-fun e!12163 () Bool)

(declare-fun e!12159 () Bool)

(assert (=> b!18967 (= e!12163 e!12159)))

(declare-fun res!13042 () Bool)

(assert (=> b!18967 (=> res!13042 e!12159)))

(declare-fun lt!5355 () tuple2!806)

(declare-fun valid!50 (LongMap!108) Bool)

(assert (=> b!18967 (= res!13042 (not (valid!50 (_2!405 lt!5355))))))

(declare-fun b!18968 () Bool)

(declare-fun tp_is_empty!921 () Bool)

(assert (=> b!18968 (= e!12158 tp_is_empty!921)))

(declare-fun b!18969 () Bool)

(declare-fun e!12155 () Bool)

(assert (=> b!18969 (= e!12155 e!12163)))

(declare-fun res!13041 () Bool)

(assert (=> b!18969 (=> (not res!13041) (not e!12163))))

(assert (=> b!18969 (= res!13041 (not (_1!405 lt!5355)))))

(assert (=> b!18969 (= lt!5355 e!12162)))

(declare-fun c!2028 () Bool)

(declare-fun imbalanced!30 (LongMap!108) Bool)

(assert (=> b!18969 (= c!2028 (imbalanced!30 thiss!848))))

(declare-fun res!13040 () Bool)

(assert (=> start!3114 (=> (not res!13040) (not e!12155))))

(assert (=> start!3114 (= res!13040 (valid!50 thiss!848))))

(assert (=> start!3114 e!12155))

(declare-fun e!12154 () Bool)

(assert (=> start!3114 e!12154))

(declare-fun b!18970 () Bool)

(declare-datatypes ((tuple2!808 0))(
  ( (tuple2!809 (_1!406 (_ BitVec 64)) (_2!406 V!1053)) )
))
(declare-datatypes ((List!542 0))(
  ( (Nil!539) (Cons!538 (h!1104 tuple2!808) (t!3185 List!542)) )
))
(declare-datatypes ((ListLongMap!541 0))(
  ( (ListLongMap!542 (toList!286 List!542)) )
))
(declare-fun map!359 (LongMap!108) ListLongMap!541)

(assert (=> b!18970 (= e!12159 (not (= (map!359 (_2!405 lt!5355)) (map!359 thiss!848))))))

(declare-fun b!18971 () Bool)

(assert (=> b!18971 (= e!12161 tp_is_empty!921)))

(declare-fun array_inv!349 (array!1051) Bool)

(declare-fun array_inv!350 (array!1049) Bool)

(assert (=> b!18972 (= e!12157 (and tp!3166 tp_is_empty!921 (array_inv!349 (_keys!3098 (v!1488 (underlying!65 thiss!848)))) (array_inv!350 (_values!1669 (v!1488 (underlying!65 thiss!848)))) e!12164))))

(declare-fun mapIsEmpty!820 () Bool)

(assert (=> mapIsEmpty!820 mapRes!820))

(declare-fun b!18973 () Bool)

(assert (=> b!18973 (= e!12154 e!12156)))

(assert (= (and start!3114 res!13040) b!18969))

(assert (= (and b!18969 c!2028) b!18966))

(assert (= (and b!18969 (not c!2028)) b!18965))

(assert (= (and b!18969 res!13041) b!18967))

(assert (= (and b!18967 (not res!13042)) b!18970))

(assert (= (and b!18963 condMapEmpty!820) mapIsEmpty!820))

(assert (= (and b!18963 (not condMapEmpty!820)) mapNonEmpty!820))

(get-info :version)

(assert (= (and mapNonEmpty!820 ((_ is ValueCellFull!261) mapValue!820)) b!18971))

(assert (= (and b!18963 ((_ is ValueCellFull!261) mapDefault!820)) b!18968))

(assert (= b!18972 b!18963))

(assert (= b!18964 b!18972))

(assert (= b!18973 b!18964))

(assert (= start!3114 b!18973))

(declare-fun m!13451 () Bool)

(assert (=> b!18967 m!13451))

(declare-fun m!13453 () Bool)

(assert (=> start!3114 m!13453))

(declare-fun m!13455 () Bool)

(assert (=> b!18966 m!13455))

(declare-fun m!13457 () Bool)

(assert (=> mapNonEmpty!820 m!13457))

(declare-fun m!13459 () Bool)

(assert (=> b!18970 m!13459))

(declare-fun m!13461 () Bool)

(assert (=> b!18970 m!13461))

(declare-fun m!13463 () Bool)

(assert (=> b!18972 m!13463))

(declare-fun m!13465 () Bool)

(assert (=> b!18972 m!13465))

(declare-fun m!13467 () Bool)

(assert (=> b!18969 m!13467))

(check-sat (not b!18966) (not start!3114) b_and!1317 (not b_next!657) (not b!18967) (not mapNonEmpty!820) (not b!18972) (not b!18970) (not b!18969) tp_is_empty!921)
(check-sat b_and!1317 (not b_next!657))
(get-model)

(declare-fun d!3529 () Bool)

(assert (=> d!3529 (= (array_inv!349 (_keys!3098 (v!1488 (underlying!65 thiss!848)))) (bvsge (size!596 (_keys!3098 (v!1488 (underlying!65 thiss!848)))) #b00000000000000000000000000000000))))

(assert (=> b!18972 d!3529))

(declare-fun d!3531 () Bool)

(assert (=> d!3531 (= (array_inv!350 (_values!1669 (v!1488 (underlying!65 thiss!848)))) (bvsge (size!595 (_values!1669 (v!1488 (underlying!65 thiss!848)))) #b00000000000000000000000000000000))))

(assert (=> b!18972 d!3531))

(declare-fun d!3533 () Bool)

(declare-fun valid!52 (LongMapFixedSize!108) Bool)

(assert (=> d!3533 (= (valid!50 (_2!405 lt!5355)) (valid!52 (v!1488 (underlying!65 (_2!405 lt!5355)))))))

(declare-fun bs!855 () Bool)

(assert (= bs!855 d!3533))

(declare-fun m!13487 () Bool)

(assert (=> bs!855 m!13487))

(assert (=> b!18967 d!3533))

(declare-fun b!19025 () Bool)

(declare-fun c!2040 () Bool)

(assert (=> b!19025 (= c!2040 (and (not (= (bvand (extraKeys!1583 (v!1488 (underlying!65 thiss!848))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!1583 (v!1488 (underlying!65 thiss!848))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!814 0))(
  ( (tuple2!815 (_1!409 Bool) (_2!409 Cell!108)) )
))
(declare-fun e!12212 () tuple2!814)

(declare-fun e!12209 () tuple2!814)

(assert (=> b!19025 (= e!12212 e!12209)))

(declare-fun b!19026 () Bool)

(declare-fun e!12210 () Bool)

(declare-fun lt!5380 () tuple2!806)

(assert (=> b!19026 (= e!12210 (= (map!359 (_2!405 lt!5380)) (map!359 thiss!848)))))

(declare-fun b!19027 () Bool)

(declare-datatypes ((tuple2!816 0))(
  ( (tuple2!817 (_1!410 Bool) (_2!410 LongMapFixedSize!108)) )
))
(declare-fun lt!5379 () tuple2!816)

(declare-fun call!876 () tuple2!816)

(assert (=> b!19027 (= lt!5379 call!876)))

(assert (=> b!19027 (= e!12212 (tuple2!815 (_1!410 lt!5379) (Cell!109 (_2!410 lt!5379))))))

(declare-fun b!19028 () Bool)

(declare-datatypes ((tuple3!4 0))(
  ( (tuple3!5 (_1!411 Bool) (_2!411 Cell!108) (_3!2 LongMap!108)) )
))
(declare-fun e!12211 () tuple3!4)

(declare-fun lt!5381 () tuple2!816)

(assert (=> b!19028 (= e!12211 (ite (_1!410 lt!5381) (tuple3!5 true (underlying!65 thiss!848) (LongMap!109 (Cell!109 (_2!410 lt!5381)))) (tuple3!5 false (Cell!109 (_2!410 lt!5381)) thiss!848)))))

(declare-fun lt!5385 () tuple2!814)

(declare-fun repackFrom!3 (LongMap!108 LongMapFixedSize!108 (_ BitVec 32)) tuple2!816)

(assert (=> b!19028 (= lt!5381 (repackFrom!3 thiss!848 (v!1488 (_2!409 lt!5385)) (bvsub (size!596 (_keys!3098 (v!1488 (underlying!65 thiss!848)))) #b00000000000000000000000000000001)))))

(declare-fun bm!871 () Bool)

(declare-fun call!874 () LongMapFixedSize!108)

(declare-fun lt!5388 () (_ BitVec 32))

(declare-fun getNewLongMapFixedSize!9 ((_ BitVec 32) Int) LongMapFixedSize!108)

(assert (=> bm!871 (= call!874 (getNewLongMapFixedSize!9 lt!5388 (defaultEntry!1673 (v!1488 (underlying!65 thiss!848)))))))

(declare-fun b!19029 () Bool)

(declare-fun e!12208 () tuple2!814)

(declare-fun lt!5382 () tuple2!816)

(declare-fun lt!5384 () tuple2!816)

(assert (=> b!19029 (= e!12208 (tuple2!815 (and (_1!410 lt!5382) (_1!410 lt!5384)) (Cell!109 (_2!410 lt!5384))))))

(declare-fun update!13 (LongMapFixedSize!108 (_ BitVec 64) V!1053) tuple2!816)

(assert (=> b!19029 (= lt!5382 (update!13 call!874 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1607 (v!1488 (underlying!65 thiss!848)))))))

(declare-fun call!875 () tuple2!816)

(assert (=> b!19029 (= lt!5384 call!875)))

(declare-fun b!19030 () Bool)

(declare-fun lt!5383 () tuple2!816)

(assert (=> b!19030 (= e!12209 (tuple2!815 (_1!410 lt!5383) (Cell!109 (_2!410 lt!5383))))))

(assert (=> b!19030 (= lt!5383 call!876)))

(declare-fun b!19031 () Bool)

(declare-fun lt!5387 () Cell!108)

(assert (=> b!19031 (= e!12209 (tuple2!815 true lt!5387))))

(declare-fun bm!872 () Bool)

(declare-fun call!877 () LongMapFixedSize!108)

(assert (=> bm!872 (= call!877 call!874)))

(declare-fun b!19032 () Bool)

(assert (=> b!19032 (= e!12208 e!12212)))

(declare-fun c!2043 () Bool)

(assert (=> b!19032 (= c!2043 (and (not (= (bvand (extraKeys!1583 (v!1488 (underlying!65 thiss!848))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!1583 (v!1488 (underlying!65 thiss!848))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!874 () Bool)

(declare-fun c!2041 () Bool)

(assert (=> bm!874 (= call!875 (update!13 (ite c!2041 (_2!410 lt!5382) call!877) (ite c!2041 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2043 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!2041 (minValue!1607 (v!1488 (underlying!65 thiss!848))) (ite c!2043 (zeroValue!1607 (v!1488 (underlying!65 thiss!848))) (minValue!1607 (v!1488 (underlying!65 thiss!848)))))))))

(declare-fun b!19033 () Bool)

(assert (=> b!19033 (= e!12211 (tuple3!5 false (_2!409 lt!5385) thiss!848))))

(declare-fun bm!873 () Bool)

(assert (=> bm!873 (= call!876 call!875)))

(declare-fun d!3535 () Bool)

(assert (=> d!3535 e!12210))

(declare-fun res!13054 () Bool)

(assert (=> d!3535 (=> res!13054 e!12210)))

(assert (=> d!3535 (= res!13054 (= (_1!405 lt!5380) false))))

(declare-fun lt!5386 () tuple3!4)

(assert (=> d!3535 (= lt!5380 (tuple2!807 (_1!411 lt!5386) (_3!2 lt!5386)))))

(assert (=> d!3535 (= lt!5386 e!12211)))

(declare-fun c!2042 () Bool)

(assert (=> d!3535 (= c!2042 (not (_1!409 lt!5385)))))

(assert (=> d!3535 (= lt!5385 e!12208)))

(assert (=> d!3535 (= c!2041 (and (not (= (bvand (extraKeys!1583 (v!1488 (underlying!65 thiss!848))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!1583 (v!1488 (underlying!65 thiss!848))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!3535 (= lt!5387 (Cell!109 (getNewLongMapFixedSize!9 lt!5388 (defaultEntry!1673 (v!1488 (underlying!65 thiss!848))))))))

(declare-fun computeNewMask!3 (LongMap!108 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!3535 (= lt!5388 (computeNewMask!3 thiss!848 (mask!4610 (v!1488 (underlying!65 thiss!848))) (_vacant!87 (v!1488 (underlying!65 thiss!848))) (_size!87 (v!1488 (underlying!65 thiss!848)))))))

(assert (=> d!3535 (valid!50 thiss!848)))

(assert (=> d!3535 (= (repack!26 thiss!848) lt!5380)))

(assert (= (and d!3535 c!2041) b!19029))

(assert (= (and d!3535 (not c!2041)) b!19032))

(assert (= (and b!19032 c!2043) b!19027))

(assert (= (and b!19032 (not c!2043)) b!19025))

(assert (= (and b!19025 c!2040) b!19030))

(assert (= (and b!19025 (not c!2040)) b!19031))

(assert (= (or b!19027 b!19030) bm!872))

(assert (= (or b!19027 b!19030) bm!873))

(assert (= (or b!19029 bm!873) bm!874))

(assert (= (or b!19029 bm!872) bm!871))

(assert (= (and d!3535 c!2042) b!19033))

(assert (= (and d!3535 (not c!2042)) b!19028))

(assert (= (and d!3535 (not res!13054)) b!19026))

(declare-fun m!13489 () Bool)

(assert (=> b!19026 m!13489))

(assert (=> b!19026 m!13461))

(declare-fun m!13491 () Bool)

(assert (=> d!3535 m!13491))

(declare-fun m!13493 () Bool)

(assert (=> d!3535 m!13493))

(assert (=> d!3535 m!13453))

(declare-fun m!13495 () Bool)

(assert (=> b!19028 m!13495))

(declare-fun m!13497 () Bool)

(assert (=> b!19029 m!13497))

(assert (=> bm!871 m!13491))

(declare-fun m!13499 () Bool)

(assert (=> bm!874 m!13499))

(assert (=> b!18966 d!3535))

(declare-fun d!3537 () Bool)

(assert (=> d!3537 (= (imbalanced!30 thiss!848) (or (bvsgt (bvmul #b00000000000000000000000000000010 (bvadd (_size!87 (v!1488 (underlying!65 thiss!848))) (_vacant!87 (v!1488 (underlying!65 thiss!848))))) (mask!4610 (v!1488 (underlying!65 thiss!848)))) (bvsgt (_vacant!87 (v!1488 (underlying!65 thiss!848))) (_size!87 (v!1488 (underlying!65 thiss!848))))))))

(assert (=> b!18969 d!3537))

(declare-fun d!3539 () Bool)

(declare-fun map!361 (LongMapFixedSize!108) ListLongMap!541)

(assert (=> d!3539 (= (map!359 (_2!405 lt!5355)) (map!361 (v!1488 (underlying!65 (_2!405 lt!5355)))))))

(declare-fun bs!856 () Bool)

(assert (= bs!856 d!3539))

(declare-fun m!13501 () Bool)

(assert (=> bs!856 m!13501))

(assert (=> b!18970 d!3539))

(declare-fun d!3541 () Bool)

(assert (=> d!3541 (= (map!359 thiss!848) (map!361 (v!1488 (underlying!65 thiss!848))))))

(declare-fun bs!857 () Bool)

(assert (= bs!857 d!3541))

(declare-fun m!13503 () Bool)

(assert (=> bs!857 m!13503))

(assert (=> b!18970 d!3541))

(declare-fun d!3543 () Bool)

(assert (=> d!3543 (= (valid!50 thiss!848) (valid!52 (v!1488 (underlying!65 thiss!848))))))

(declare-fun bs!858 () Bool)

(assert (= bs!858 d!3543))

(declare-fun m!13505 () Bool)

(assert (=> bs!858 m!13505))

(assert (=> start!3114 d!3543))

(declare-fun mapNonEmpty!826 () Bool)

(declare-fun mapRes!826 () Bool)

(declare-fun tp!3175 () Bool)

(declare-fun e!12217 () Bool)

(assert (=> mapNonEmpty!826 (= mapRes!826 (and tp!3175 e!12217))))

(declare-fun mapKey!826 () (_ BitVec 32))

(declare-fun mapRest!826 () (Array (_ BitVec 32) ValueCell!261))

(declare-fun mapValue!826 () ValueCell!261)

(assert (=> mapNonEmpty!826 (= mapRest!820 (store mapRest!826 mapKey!826 mapValue!826))))

(declare-fun b!19040 () Bool)

(assert (=> b!19040 (= e!12217 tp_is_empty!921)))

(declare-fun condMapEmpty!826 () Bool)

(declare-fun mapDefault!826 () ValueCell!261)

(assert (=> mapNonEmpty!820 (= condMapEmpty!826 (= mapRest!820 ((as const (Array (_ BitVec 32) ValueCell!261)) mapDefault!826)))))

(declare-fun e!12218 () Bool)

(assert (=> mapNonEmpty!820 (= tp!3165 (and e!12218 mapRes!826))))

(declare-fun b!19041 () Bool)

(assert (=> b!19041 (= e!12218 tp_is_empty!921)))

(declare-fun mapIsEmpty!826 () Bool)

(assert (=> mapIsEmpty!826 mapRes!826))

(assert (= (and mapNonEmpty!820 condMapEmpty!826) mapIsEmpty!826))

(assert (= (and mapNonEmpty!820 (not condMapEmpty!826)) mapNonEmpty!826))

(assert (= (and mapNonEmpty!826 ((_ is ValueCellFull!261) mapValue!826)) b!19040))

(assert (= (and mapNonEmpty!820 ((_ is ValueCellFull!261) mapDefault!826)) b!19041))

(declare-fun m!13507 () Bool)

(assert (=> mapNonEmpty!826 m!13507))

(check-sat (not bm!874) b_and!1317 (not b!19028) (not b!19026) (not bm!871) (not d!3541) (not d!3539) (not b_next!657) (not mapNonEmpty!826) tp_is_empty!921 (not d!3535) (not d!3543) (not b!19029) (not d!3533))
(check-sat b_and!1317 (not b_next!657))
