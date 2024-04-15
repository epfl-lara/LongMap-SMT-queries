; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3102 () Bool)

(assert start!3102)

(declare-fun b!18874 () Bool)

(declare-fun b_free!655 () Bool)

(declare-fun b_next!655 () Bool)

(assert (=> b!18874 (= b_free!655 (not b_next!655))))

(declare-fun tp!3159 () Bool)

(declare-fun b_and!1309 () Bool)

(assert (=> b!18874 (= tp!3159 b_and!1309)))

(declare-fun mapNonEmpty!817 () Bool)

(declare-fun mapRes!817 () Bool)

(declare-fun tp!3160 () Bool)

(declare-fun e!12081 () Bool)

(assert (=> mapNonEmpty!817 (= mapRes!817 (and tp!3160 e!12081))))

(declare-datatypes ((V!1051 0))(
  ( (V!1052 (val!486 Int)) )
))
(declare-datatypes ((ValueCell!260 0))(
  ( (ValueCellFull!260 (v!1484 V!1051)) (EmptyCell!260) )
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
  ( (Cell!107 (v!1485 LongMapFixedSize!106)) )
))
(declare-datatypes ((LongMap!106 0))(
  ( (LongMap!107 (underlying!64 Cell!106)) )
))
(declare-fun thiss!848 () LongMap!106)

(declare-fun mapRest!817 () (Array (_ BitVec 32) ValueCell!260))

(declare-fun mapValue!817 () ValueCell!260)

(declare-fun mapKey!817 () (_ BitVec 32))

(assert (=> mapNonEmpty!817 (= (arr!494 (_values!1668 (v!1485 (underlying!64 thiss!848)))) (store mapRest!817 mapKey!817 mapValue!817))))

(declare-fun mapIsEmpty!817 () Bool)

(assert (=> mapIsEmpty!817 mapRes!817))

(declare-fun b!18870 () Bool)

(declare-datatypes ((tuple2!812 0))(
  ( (tuple2!813 (_1!408 Bool) (_2!408 LongMap!106)) )
))
(declare-fun e!12078 () tuple2!812)

(assert (=> b!18870 (= e!12078 (tuple2!813 true thiss!848))))

(declare-fun b!18871 () Bool)

(declare-fun e!12082 () Bool)

(declare-fun e!12075 () Bool)

(assert (=> b!18871 (= e!12082 e!12075)))

(declare-fun b!18872 () Bool)

(declare-fun e!12083 () Bool)

(declare-fun tp_is_empty!919 () Bool)

(assert (=> b!18872 (= e!12083 tp_is_empty!919)))

(declare-fun b!18873 () Bool)

(declare-fun e!12084 () Bool)

(declare-fun lt!5348 () tuple2!812)

(declare-datatypes ((tuple2!814 0))(
  ( (tuple2!815 (_1!409 (_ BitVec 64)) (_2!409 V!1051)) )
))
(declare-datatypes ((List!539 0))(
  ( (Nil!536) (Cons!535 (h!1101 tuple2!814) (t!3175 List!539)) )
))
(declare-datatypes ((ListLongMap!539 0))(
  ( (ListLongMap!540 (toList!285 List!539)) )
))
(declare-fun map!360 (LongMap!106) ListLongMap!539)

(assert (=> b!18873 (= e!12084 (not (= (map!360 (_2!408 lt!5348)) (map!360 thiss!848))))))

(declare-fun e!12077 () Bool)

(declare-fun e!12085 () Bool)

(declare-fun array_inv!353 (array!1029) Bool)

(declare-fun array_inv!354 (array!1027) Bool)

(assert (=> b!18874 (= e!12077 (and tp!3159 tp_is_empty!919 (array_inv!353 (_keys!3097 (v!1485 (underlying!64 thiss!848)))) (array_inv!354 (_values!1668 (v!1485 (underlying!64 thiss!848)))) e!12085))))

(declare-fun b!18875 () Bool)

(declare-fun repack!31 (LongMap!106) tuple2!812)

(assert (=> b!18875 (= e!12078 (repack!31 thiss!848))))

(declare-fun res!12999 () Bool)

(declare-fun e!12076 () Bool)

(assert (=> start!3102 (=> (not res!12999) (not e!12076))))

(declare-fun valid!60 (LongMap!106) Bool)

(assert (=> start!3102 (= res!12999 (valid!60 thiss!848))))

(assert (=> start!3102 e!12076))

(assert (=> start!3102 e!12082))

(declare-fun b!18876 () Bool)

(declare-fun e!12080 () Bool)

(assert (=> b!18876 (= e!12080 e!12084)))

(declare-fun res!13001 () Bool)

(assert (=> b!18876 (=> res!13001 e!12084)))

(assert (=> b!18876 (= res!13001 (not (valid!60 (_2!408 lt!5348))))))

(declare-fun b!18877 () Bool)

(assert (=> b!18877 (= e!12081 tp_is_empty!919)))

(declare-fun b!18878 () Bool)

(assert (=> b!18878 (= e!12085 (and e!12083 mapRes!817))))

(declare-fun condMapEmpty!817 () Bool)

(declare-fun mapDefault!817 () ValueCell!260)

(assert (=> b!18878 (= condMapEmpty!817 (= (arr!494 (_values!1668 (v!1485 (underlying!64 thiss!848)))) ((as const (Array (_ BitVec 32) ValueCell!260)) mapDefault!817)))))

(declare-fun b!18879 () Bool)

(assert (=> b!18879 (= e!12075 e!12077)))

(declare-fun b!18880 () Bool)

(assert (=> b!18880 (= e!12076 e!12080)))

(declare-fun res!13000 () Bool)

(assert (=> b!18880 (=> (not res!13000) (not e!12080))))

(assert (=> b!18880 (= res!13000 (not (_1!408 lt!5348)))))

(assert (=> b!18880 (= lt!5348 e!12078)))

(declare-fun c!2011 () Bool)

(declare-fun imbalanced!30 (LongMap!106) Bool)

(assert (=> b!18880 (= c!2011 (imbalanced!30 thiss!848))))

(assert (= (and start!3102 res!12999) b!18880))

(assert (= (and b!18880 c!2011) b!18875))

(assert (= (and b!18880 (not c!2011)) b!18870))

(assert (= (and b!18880 res!13000) b!18876))

(assert (= (and b!18876 (not res!13001)) b!18873))

(assert (= (and b!18878 condMapEmpty!817) mapIsEmpty!817))

(assert (= (and b!18878 (not condMapEmpty!817)) mapNonEmpty!817))

(get-info :version)

(assert (= (and mapNonEmpty!817 ((_ is ValueCellFull!260) mapValue!817)) b!18877))

(assert (= (and b!18878 ((_ is ValueCellFull!260) mapDefault!817)) b!18872))

(assert (= b!18874 b!18878))

(assert (= b!18879 b!18874))

(assert (= b!18871 b!18879))

(assert (= start!3102 b!18871))

(declare-fun m!13371 () Bool)

(assert (=> b!18876 m!13371))

(declare-fun m!13373 () Bool)

(assert (=> b!18875 m!13373))

(declare-fun m!13375 () Bool)

(assert (=> start!3102 m!13375))

(declare-fun m!13377 () Bool)

(assert (=> mapNonEmpty!817 m!13377))

(declare-fun m!13379 () Bool)

(assert (=> b!18874 m!13379))

(declare-fun m!13381 () Bool)

(assert (=> b!18874 m!13381))

(declare-fun m!13383 () Bool)

(assert (=> b!18880 m!13383))

(declare-fun m!13385 () Bool)

(assert (=> b!18873 m!13385))

(declare-fun m!13387 () Bool)

(assert (=> b!18873 m!13387))

(check-sat (not b!18873) b_and!1309 (not mapNonEmpty!817) (not start!3102) (not b!18874) (not b!18876) (not b!18880) tp_is_empty!919 (not b!18875) (not b_next!655))
(check-sat b_and!1309 (not b_next!655))
(get-model)

(declare-fun d!3491 () Bool)

(assert (=> d!3491 (= (imbalanced!30 thiss!848) (or (bvsgt (bvmul #b00000000000000000000000000000010 (bvadd (_size!86 (v!1485 (underlying!64 thiss!848))) (_vacant!86 (v!1485 (underlying!64 thiss!848))))) (mask!4609 (v!1485 (underlying!64 thiss!848)))) (bvsgt (_vacant!86 (v!1485 (underlying!64 thiss!848))) (_size!86 (v!1485 (underlying!64 thiss!848))))))))

(assert (=> b!18880 d!3491))

(declare-fun b!18965 () Bool)

(declare-datatypes ((tuple3!4 0))(
  ( (tuple3!5 (_1!411 Bool) (_2!411 Cell!106) (_3!2 LongMap!106)) )
))
(declare-fun e!12166 () tuple3!4)

(declare-datatypes ((tuple2!818 0))(
  ( (tuple2!819 (_1!412 Bool) (_2!412 Cell!106)) )
))
(declare-fun lt!5379 () tuple2!818)

(assert (=> b!18965 (= e!12166 (tuple3!5 false (_2!412 lt!5379) thiss!848))))

(declare-fun b!18966 () Bool)

(declare-fun c!2028 () Bool)

(assert (=> b!18966 (= c!2028 (and (not (= (bvand (extraKeys!1582 (v!1485 (underlying!64 thiss!848))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!1582 (v!1485 (underlying!64 thiss!848))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!12162 () tuple2!818)

(declare-fun e!12164 () tuple2!818)

(assert (=> b!18966 (= e!12162 e!12164)))

(declare-fun bm!871 () Bool)

(declare-fun call!875 () LongMapFixedSize!106)

(declare-fun lt!5383 () (_ BitVec 32))

(declare-fun getNewLongMapFixedSize!9 ((_ BitVec 32) Int) LongMapFixedSize!106)

(assert (=> bm!871 (= call!875 (getNewLongMapFixedSize!9 lt!5383 (defaultEntry!1672 (v!1485 (underlying!64 thiss!848)))))))

(declare-fun b!18967 () Bool)

(declare-fun lt!5377 () Cell!106)

(assert (=> b!18967 (= e!12164 (tuple2!819 true lt!5377))))

(declare-fun b!18968 () Bool)

(declare-datatypes ((tuple2!820 0))(
  ( (tuple2!821 (_1!413 Bool) (_2!413 LongMapFixedSize!106)) )
))
(declare-fun lt!5376 () tuple2!820)

(declare-fun call!874 () tuple2!820)

(assert (=> b!18968 (= lt!5376 call!874)))

(assert (=> b!18968 (= e!12162 (tuple2!819 (_1!413 lt!5376) (Cell!107 (_2!413 lt!5376))))))

(declare-fun call!877 () tuple2!820)

(declare-fun c!2027 () Bool)

(declare-fun bm!872 () Bool)

(declare-fun c!2026 () Bool)

(declare-fun call!876 () LongMapFixedSize!106)

(declare-fun lt!5380 () tuple2!820)

(declare-fun update!16 (LongMapFixedSize!106 (_ BitVec 64) V!1051) tuple2!820)

(assert (=> bm!872 (= call!877 (update!16 (ite c!2026 (_2!413 lt!5380) call!876) (ite c!2026 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2027 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!2026 (minValue!1606 (v!1485 (underlying!64 thiss!848))) (ite c!2027 (zeroValue!1606 (v!1485 (underlying!64 thiss!848))) (minValue!1606 (v!1485 (underlying!64 thiss!848)))))))))

(declare-fun d!3493 () Bool)

(declare-fun e!12163 () Bool)

(assert (=> d!3493 e!12163))

(declare-fun res!13022 () Bool)

(assert (=> d!3493 (=> res!13022 e!12163)))

(declare-fun lt!5378 () tuple2!812)

(assert (=> d!3493 (= res!13022 (= (_1!408 lt!5378) false))))

(declare-fun lt!5375 () tuple3!4)

(assert (=> d!3493 (= lt!5378 (tuple2!813 (_1!411 lt!5375) (_3!2 lt!5375)))))

(assert (=> d!3493 (= lt!5375 e!12166)))

(declare-fun c!2029 () Bool)

(assert (=> d!3493 (= c!2029 (not (_1!412 lt!5379)))))

(declare-fun e!12165 () tuple2!818)

(assert (=> d!3493 (= lt!5379 e!12165)))

(assert (=> d!3493 (= c!2026 (and (not (= (bvand (extraKeys!1582 (v!1485 (underlying!64 thiss!848))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!1582 (v!1485 (underlying!64 thiss!848))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!3493 (= lt!5377 (Cell!107 (getNewLongMapFixedSize!9 lt!5383 (defaultEntry!1672 (v!1485 (underlying!64 thiss!848))))))))

(declare-fun computeNewMask!3 (LongMap!106 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!3493 (= lt!5383 (computeNewMask!3 thiss!848 (mask!4609 (v!1485 (underlying!64 thiss!848))) (_vacant!86 (v!1485 (underlying!64 thiss!848))) (_size!86 (v!1485 (underlying!64 thiss!848)))))))

(assert (=> d!3493 (valid!60 thiss!848)))

(assert (=> d!3493 (= (repack!31 thiss!848) lt!5378)))

(declare-fun b!18969 () Bool)

(assert (=> b!18969 (= e!12163 (= (map!360 (_2!408 lt!5378)) (map!360 thiss!848)))))

(declare-fun bm!873 () Bool)

(assert (=> bm!873 (= call!876 call!875)))

(declare-fun b!18970 () Bool)

(assert (=> b!18970 (= e!12165 e!12162)))

(assert (=> b!18970 (= c!2027 (and (not (= (bvand (extraKeys!1582 (v!1485 (underlying!64 thiss!848))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!1582 (v!1485 (underlying!64 thiss!848))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!18971 () Bool)

(declare-fun lt!5384 () tuple2!820)

(assert (=> b!18971 (= e!12165 (tuple2!819 (and (_1!413 lt!5380) (_1!413 lt!5384)) (Cell!107 (_2!413 lt!5384))))))

(assert (=> b!18971 (= lt!5380 (update!16 call!875 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1606 (v!1485 (underlying!64 thiss!848)))))))

(assert (=> b!18971 (= lt!5384 call!877)))

(declare-fun b!18972 () Bool)

(declare-fun lt!5381 () tuple2!820)

(assert (=> b!18972 (= e!12164 (tuple2!819 (_1!413 lt!5381) (Cell!107 (_2!413 lt!5381))))))

(assert (=> b!18972 (= lt!5381 call!874)))

(declare-fun b!18973 () Bool)

(declare-fun lt!5382 () tuple2!820)

(assert (=> b!18973 (= e!12166 (ite (_1!413 lt!5382) (tuple3!5 true (underlying!64 thiss!848) (LongMap!107 (Cell!107 (_2!413 lt!5382)))) (tuple3!5 false (Cell!107 (_2!413 lt!5382)) thiss!848)))))

(declare-fun repackFrom!3 (LongMap!106 LongMapFixedSize!106 (_ BitVec 32)) tuple2!820)

(assert (=> b!18973 (= lt!5382 (repackFrom!3 thiss!848 (v!1485 (_2!412 lt!5379)) (bvsub (size!585 (_keys!3097 (v!1485 (underlying!64 thiss!848)))) #b00000000000000000000000000000001)))))

(declare-fun bm!874 () Bool)

(assert (=> bm!874 (= call!874 call!877)))

(assert (= (and d!3493 c!2026) b!18971))

(assert (= (and d!3493 (not c!2026)) b!18970))

(assert (= (and b!18970 c!2027) b!18968))

(assert (= (and b!18970 (not c!2027)) b!18966))

(assert (= (and b!18966 c!2028) b!18972))

(assert (= (and b!18966 (not c!2028)) b!18967))

(assert (= (or b!18968 b!18972) bm!873))

(assert (= (or b!18968 b!18972) bm!874))

(assert (= (or b!18971 bm!874) bm!872))

(assert (= (or b!18971 bm!873) bm!871))

(assert (= (and d!3493 c!2029) b!18965))

(assert (= (and d!3493 (not c!2029)) b!18973))

(assert (= (and d!3493 (not res!13022)) b!18969))

(declare-fun m!13425 () Bool)

(assert (=> bm!871 m!13425))

(declare-fun m!13427 () Bool)

(assert (=> b!18973 m!13427))

(declare-fun m!13429 () Bool)

(assert (=> b!18969 m!13429))

(assert (=> b!18969 m!13387))

(assert (=> d!3493 m!13425))

(declare-fun m!13431 () Bool)

(assert (=> d!3493 m!13431))

(assert (=> d!3493 m!13375))

(declare-fun m!13433 () Bool)

(assert (=> b!18971 m!13433))

(declare-fun m!13435 () Bool)

(assert (=> bm!872 m!13435))

(assert (=> b!18875 d!3493))

(declare-fun d!3495 () Bool)

(declare-fun map!361 (LongMapFixedSize!106) ListLongMap!539)

(assert (=> d!3495 (= (map!360 (_2!408 lt!5348)) (map!361 (v!1485 (underlying!64 (_2!408 lt!5348)))))))

(declare-fun bs!853 () Bool)

(assert (= bs!853 d!3495))

(declare-fun m!13437 () Bool)

(assert (=> bs!853 m!13437))

(assert (=> b!18873 d!3495))

(declare-fun d!3497 () Bool)

(assert (=> d!3497 (= (map!360 thiss!848) (map!361 (v!1485 (underlying!64 thiss!848))))))

(declare-fun bs!854 () Bool)

(assert (= bs!854 d!3497))

(declare-fun m!13439 () Bool)

(assert (=> bs!854 m!13439))

(assert (=> b!18873 d!3497))

(declare-fun d!3499 () Bool)

(declare-fun valid!62 (LongMapFixedSize!106) Bool)

(assert (=> d!3499 (= (valid!60 thiss!848) (valid!62 (v!1485 (underlying!64 thiss!848))))))

(declare-fun bs!855 () Bool)

(assert (= bs!855 d!3499))

(declare-fun m!13441 () Bool)

(assert (=> bs!855 m!13441))

(assert (=> start!3102 d!3499))

(declare-fun d!3501 () Bool)

(assert (=> d!3501 (= (array_inv!353 (_keys!3097 (v!1485 (underlying!64 thiss!848)))) (bvsge (size!585 (_keys!3097 (v!1485 (underlying!64 thiss!848)))) #b00000000000000000000000000000000))))

(assert (=> b!18874 d!3501))

(declare-fun d!3503 () Bool)

(assert (=> d!3503 (= (array_inv!354 (_values!1668 (v!1485 (underlying!64 thiss!848)))) (bvsge (size!584 (_values!1668 (v!1485 (underlying!64 thiss!848)))) #b00000000000000000000000000000000))))

(assert (=> b!18874 d!3503))

(declare-fun d!3505 () Bool)

(assert (=> d!3505 (= (valid!60 (_2!408 lt!5348)) (valid!62 (v!1485 (underlying!64 (_2!408 lt!5348)))))))

(declare-fun bs!856 () Bool)

(assert (= bs!856 d!3505))

(declare-fun m!13443 () Bool)

(assert (=> bs!856 m!13443))

(assert (=> b!18876 d!3505))

(declare-fun b!18980 () Bool)

(declare-fun e!12172 () Bool)

(assert (=> b!18980 (= e!12172 tp_is_empty!919)))

(declare-fun mapIsEmpty!826 () Bool)

(declare-fun mapRes!826 () Bool)

(assert (=> mapIsEmpty!826 mapRes!826))

(declare-fun condMapEmpty!826 () Bool)

(declare-fun mapDefault!826 () ValueCell!260)

(assert (=> mapNonEmpty!817 (= condMapEmpty!826 (= mapRest!817 ((as const (Array (_ BitVec 32) ValueCell!260)) mapDefault!826)))))

(declare-fun e!12171 () Bool)

(assert (=> mapNonEmpty!817 (= tp!3160 (and e!12171 mapRes!826))))

(declare-fun mapNonEmpty!826 () Bool)

(declare-fun tp!3175 () Bool)

(assert (=> mapNonEmpty!826 (= mapRes!826 (and tp!3175 e!12172))))

(declare-fun mapKey!826 () (_ BitVec 32))

(declare-fun mapRest!826 () (Array (_ BitVec 32) ValueCell!260))

(declare-fun mapValue!826 () ValueCell!260)

(assert (=> mapNonEmpty!826 (= mapRest!817 (store mapRest!826 mapKey!826 mapValue!826))))

(declare-fun b!18981 () Bool)

(assert (=> b!18981 (= e!12171 tp_is_empty!919)))

(assert (= (and mapNonEmpty!817 condMapEmpty!826) mapIsEmpty!826))

(assert (= (and mapNonEmpty!817 (not condMapEmpty!826)) mapNonEmpty!826))

(assert (= (and mapNonEmpty!826 ((_ is ValueCellFull!260) mapValue!826)) b!18980))

(assert (= (and mapNonEmpty!817 ((_ is ValueCellFull!260) mapDefault!826)) b!18981))

(declare-fun m!13445 () Bool)

(assert (=> mapNonEmpty!826 m!13445))

(check-sat (not b!18973) (not d!3505) (not b!18969) (not bm!871) (not b!18971) b_and!1309 (not bm!872) (not d!3493) (not d!3499) (not mapNonEmpty!826) tp_is_empty!919 (not b_next!655) (not d!3497) (not d!3495))
(check-sat b_and!1309 (not b_next!655))
