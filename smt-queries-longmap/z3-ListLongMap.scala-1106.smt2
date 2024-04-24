; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22832 () Bool)

(assert start!22832)

(declare-fun b!237889 () Bool)

(declare-fun b_free!6385 () Bool)

(declare-fun b_next!6385 () Bool)

(assert (=> b!237889 (= b_free!6385 (not b_next!6385))))

(declare-fun tp!22350 () Bool)

(declare-fun b_and!13359 () Bool)

(assert (=> b!237889 (= tp!22350 b_and!13359)))

(declare-fun b!237887 () Bool)

(declare-fun res!116566 () Bool)

(declare-fun e!154464 () Bool)

(assert (=> b!237887 (=> (not res!116566) (not e!154464))))

(declare-datatypes ((V!7977 0))(
  ( (V!7978 (val!3168 Int)) )
))
(declare-datatypes ((ValueCell!2780 0))(
  ( (ValueCellFull!2780 (v!5204 V!7977)) (EmptyCell!2780) )
))
(declare-datatypes ((array!11765 0))(
  ( (array!11766 (arr!5587 (Array (_ BitVec 32) ValueCell!2780)) (size!5928 (_ BitVec 32))) )
))
(declare-datatypes ((array!11767 0))(
  ( (array!11768 (arr!5588 (Array (_ BitVec 32) (_ BitVec 64))) (size!5929 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3460 0))(
  ( (LongMapFixedSize!3461 (defaultEntry!4412 Int) (mask!10433 (_ BitVec 32)) (extraKeys!4149 (_ BitVec 32)) (zeroValue!4253 V!7977) (minValue!4253 V!7977) (_size!1779 (_ BitVec 32)) (_keys!6508 array!11767) (_values!4395 array!11765) (_vacant!1779 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3460)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!237887 (= res!116566 (validMask!0 (mask!10433 thiss!1504)))))

(declare-fun b!237888 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11767 (_ BitVec 32)) Bool)

(assert (=> b!237888 (= e!154464 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6508 thiss!1504) (mask!10433 thiss!1504))))))

(declare-fun e!154467 () Bool)

(declare-fun tp_is_empty!6247 () Bool)

(declare-fun e!154463 () Bool)

(declare-fun array_inv!3671 (array!11767) Bool)

(declare-fun array_inv!3672 (array!11765) Bool)

(assert (=> b!237889 (= e!154467 (and tp!22350 tp_is_empty!6247 (array_inv!3671 (_keys!6508 thiss!1504)) (array_inv!3672 (_values!4395 thiss!1504)) e!154463))))

(declare-fun res!116567 () Bool)

(declare-fun e!154461 () Bool)

(assert (=> start!22832 (=> (not res!116567) (not e!154461))))

(declare-fun valid!1380 (LongMapFixedSize!3460) Bool)

(assert (=> start!22832 (= res!116567 (valid!1380 thiss!1504))))

(assert (=> start!22832 e!154461))

(assert (=> start!22832 e!154467))

(assert (=> start!22832 true))

(declare-fun b!237890 () Bool)

(assert (=> b!237890 (= e!154461 e!154464)))

(declare-fun res!116570 () Bool)

(assert (=> b!237890 (=> (not res!116570) (not e!154464))))

(declare-datatypes ((SeekEntryResult!983 0))(
  ( (MissingZero!983 (index!6102 (_ BitVec 32))) (Found!983 (index!6103 (_ BitVec 32))) (Intermediate!983 (undefined!1795 Bool) (index!6104 (_ BitVec 32)) (x!23961 (_ BitVec 32))) (Undefined!983) (MissingVacant!983 (index!6105 (_ BitVec 32))) )
))
(declare-fun lt!120350 () SeekEntryResult!983)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!237890 (= res!116570 (or (= lt!120350 (MissingZero!983 index!297)) (= lt!120350 (MissingVacant!983 index!297))))))

(declare-fun key!932 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11767 (_ BitVec 32)) SeekEntryResult!983)

(assert (=> b!237890 (= lt!120350 (seekEntryOrOpen!0 key!932 (_keys!6508 thiss!1504) (mask!10433 thiss!1504)))))

(declare-fun mapIsEmpty!10593 () Bool)

(declare-fun mapRes!10593 () Bool)

(assert (=> mapIsEmpty!10593 mapRes!10593))

(declare-fun b!237891 () Bool)

(declare-fun res!116569 () Bool)

(assert (=> b!237891 (=> (not res!116569) (not e!154464))))

(declare-datatypes ((tuple2!4594 0))(
  ( (tuple2!4595 (_1!2308 (_ BitVec 64)) (_2!2308 V!7977)) )
))
(declare-datatypes ((List!3488 0))(
  ( (Nil!3485) (Cons!3484 (h!4140 tuple2!4594) (t!8469 List!3488)) )
))
(declare-datatypes ((ListLongMap!3509 0))(
  ( (ListLongMap!3510 (toList!1770 List!3488)) )
))
(declare-fun contains!1670 (ListLongMap!3509 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1302 (array!11767 array!11765 (_ BitVec 32) (_ BitVec 32) V!7977 V!7977 (_ BitVec 32) Int) ListLongMap!3509)

(assert (=> b!237891 (= res!116569 (not (contains!1670 (getCurrentListMap!1302 (_keys!6508 thiss!1504) (_values!4395 thiss!1504) (mask!10433 thiss!1504) (extraKeys!4149 thiss!1504) (zeroValue!4253 thiss!1504) (minValue!4253 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4412 thiss!1504)) key!932)))))

(declare-fun b!237892 () Bool)

(declare-fun e!154466 () Bool)

(assert (=> b!237892 (= e!154466 tp_is_empty!6247)))

(declare-fun b!237893 () Bool)

(declare-fun res!116568 () Bool)

(assert (=> b!237893 (=> (not res!116568) (not e!154464))))

(assert (=> b!237893 (= res!116568 (and (= (size!5928 (_values!4395 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10433 thiss!1504))) (= (size!5929 (_keys!6508 thiss!1504)) (size!5928 (_values!4395 thiss!1504))) (bvsge (mask!10433 thiss!1504) #b00000000000000000000000000000000) (bvsge (extraKeys!4149 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!4149 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun b!237894 () Bool)

(declare-fun e!154465 () Bool)

(assert (=> b!237894 (= e!154465 tp_is_empty!6247)))

(declare-fun mapNonEmpty!10593 () Bool)

(declare-fun tp!22349 () Bool)

(assert (=> mapNonEmpty!10593 (= mapRes!10593 (and tp!22349 e!154465))))

(declare-fun mapRest!10593 () (Array (_ BitVec 32) ValueCell!2780))

(declare-fun mapKey!10593 () (_ BitVec 32))

(declare-fun mapValue!10593 () ValueCell!2780)

(assert (=> mapNonEmpty!10593 (= (arr!5587 (_values!4395 thiss!1504)) (store mapRest!10593 mapKey!10593 mapValue!10593))))

(declare-fun b!237895 () Bool)

(assert (=> b!237895 (= e!154463 (and e!154466 mapRes!10593))))

(declare-fun condMapEmpty!10593 () Bool)

(declare-fun mapDefault!10593 () ValueCell!2780)

(assert (=> b!237895 (= condMapEmpty!10593 (= (arr!5587 (_values!4395 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2780)) mapDefault!10593)))))

(declare-fun b!237896 () Bool)

(declare-fun res!116565 () Bool)

(assert (=> b!237896 (=> (not res!116565) (not e!154461))))

(assert (=> b!237896 (= res!116565 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!22832 res!116567) b!237896))

(assert (= (and b!237896 res!116565) b!237890))

(assert (= (and b!237890 res!116570) b!237891))

(assert (= (and b!237891 res!116569) b!237887))

(assert (= (and b!237887 res!116566) b!237893))

(assert (= (and b!237893 res!116568) b!237888))

(assert (= (and b!237895 condMapEmpty!10593) mapIsEmpty!10593))

(assert (= (and b!237895 (not condMapEmpty!10593)) mapNonEmpty!10593))

(get-info :version)

(assert (= (and mapNonEmpty!10593 ((_ is ValueCellFull!2780) mapValue!10593)) b!237894))

(assert (= (and b!237895 ((_ is ValueCellFull!2780) mapDefault!10593)) b!237892))

(assert (= b!237889 b!237895))

(assert (= start!22832 b!237889))

(declare-fun m!258759 () Bool)

(assert (=> mapNonEmpty!10593 m!258759))

(declare-fun m!258761 () Bool)

(assert (=> b!237889 m!258761))

(declare-fun m!258763 () Bool)

(assert (=> b!237889 m!258763))

(declare-fun m!258765 () Bool)

(assert (=> start!22832 m!258765))

(declare-fun m!258767 () Bool)

(assert (=> b!237888 m!258767))

(declare-fun m!258769 () Bool)

(assert (=> b!237890 m!258769))

(declare-fun m!258771 () Bool)

(assert (=> b!237887 m!258771))

(declare-fun m!258773 () Bool)

(assert (=> b!237891 m!258773))

(assert (=> b!237891 m!258773))

(declare-fun m!258775 () Bool)

(assert (=> b!237891 m!258775))

(check-sat (not b!237889) (not b!237890) tp_is_empty!6247 (not b!237888) b_and!13359 (not b_next!6385) (not b!237887) (not start!22832) (not mapNonEmpty!10593) (not b!237891))
(check-sat b_and!13359 (not b_next!6385))
(get-model)

(declare-fun d!59785 () Bool)

(assert (=> d!59785 (= (array_inv!3671 (_keys!6508 thiss!1504)) (bvsge (size!5929 (_keys!6508 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!237889 d!59785))

(declare-fun d!59787 () Bool)

(assert (=> d!59787 (= (array_inv!3672 (_values!4395 thiss!1504)) (bvsge (size!5928 (_values!4395 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!237889 d!59787))

(declare-fun b!237965 () Bool)

(declare-fun e!154516 () Bool)

(declare-fun e!154518 () Bool)

(assert (=> b!237965 (= e!154516 e!154518)))

(declare-fun c!39696 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!237965 (= c!39696 (validKeyInArray!0 (select (arr!5588 (_keys!6508 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!237966 () Bool)

(declare-fun e!154517 () Bool)

(declare-fun call!22095 () Bool)

(assert (=> b!237966 (= e!154517 call!22095)))

(declare-fun b!237967 () Bool)

(assert (=> b!237967 (= e!154518 call!22095)))

(declare-fun bm!22092 () Bool)

(assert (=> bm!22092 (= call!22095 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!6508 thiss!1504) (mask!10433 thiss!1504)))))

(declare-fun d!59789 () Bool)

(declare-fun res!116612 () Bool)

(assert (=> d!59789 (=> res!116612 e!154516)))

(assert (=> d!59789 (= res!116612 (bvsge #b00000000000000000000000000000000 (size!5929 (_keys!6508 thiss!1504))))))

(assert (=> d!59789 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6508 thiss!1504) (mask!10433 thiss!1504)) e!154516)))

(declare-fun b!237968 () Bool)

(assert (=> b!237968 (= e!154518 e!154517)))

(declare-fun lt!120365 () (_ BitVec 64))

(assert (=> b!237968 (= lt!120365 (select (arr!5588 (_keys!6508 thiss!1504)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!7295 0))(
  ( (Unit!7296) )
))
(declare-fun lt!120364 () Unit!7295)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!11767 (_ BitVec 64) (_ BitVec 32)) Unit!7295)

(assert (=> b!237968 (= lt!120364 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!6508 thiss!1504) lt!120365 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!11767 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!237968 (arrayContainsKey!0 (_keys!6508 thiss!1504) lt!120365 #b00000000000000000000000000000000)))

(declare-fun lt!120363 () Unit!7295)

(assert (=> b!237968 (= lt!120363 lt!120364)))

(declare-fun res!116611 () Bool)

(assert (=> b!237968 (= res!116611 (= (seekEntryOrOpen!0 (select (arr!5588 (_keys!6508 thiss!1504)) #b00000000000000000000000000000000) (_keys!6508 thiss!1504) (mask!10433 thiss!1504)) (Found!983 #b00000000000000000000000000000000)))))

(assert (=> b!237968 (=> (not res!116611) (not e!154517))))

(assert (= (and d!59789 (not res!116612)) b!237965))

(assert (= (and b!237965 c!39696) b!237968))

(assert (= (and b!237965 (not c!39696)) b!237967))

(assert (= (and b!237968 res!116611) b!237966))

(assert (= (or b!237966 b!237967) bm!22092))

(declare-fun m!258813 () Bool)

(assert (=> b!237965 m!258813))

(assert (=> b!237965 m!258813))

(declare-fun m!258815 () Bool)

(assert (=> b!237965 m!258815))

(declare-fun m!258817 () Bool)

(assert (=> bm!22092 m!258817))

(assert (=> b!237968 m!258813))

(declare-fun m!258819 () Bool)

(assert (=> b!237968 m!258819))

(declare-fun m!258821 () Bool)

(assert (=> b!237968 m!258821))

(assert (=> b!237968 m!258813))

(declare-fun m!258823 () Bool)

(assert (=> b!237968 m!258823))

(assert (=> b!237888 d!59789))

(declare-fun d!59791 () Bool)

(declare-fun e!154523 () Bool)

(assert (=> d!59791 e!154523))

(declare-fun res!116615 () Bool)

(assert (=> d!59791 (=> res!116615 e!154523)))

(declare-fun lt!120377 () Bool)

(assert (=> d!59791 (= res!116615 (not lt!120377))))

(declare-fun lt!120374 () Bool)

(assert (=> d!59791 (= lt!120377 lt!120374)))

(declare-fun lt!120376 () Unit!7295)

(declare-fun e!154524 () Unit!7295)

(assert (=> d!59791 (= lt!120376 e!154524)))

(declare-fun c!39699 () Bool)

(assert (=> d!59791 (= c!39699 lt!120374)))

(declare-fun containsKey!268 (List!3488 (_ BitVec 64)) Bool)

(assert (=> d!59791 (= lt!120374 (containsKey!268 (toList!1770 (getCurrentListMap!1302 (_keys!6508 thiss!1504) (_values!4395 thiss!1504) (mask!10433 thiss!1504) (extraKeys!4149 thiss!1504) (zeroValue!4253 thiss!1504) (minValue!4253 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4412 thiss!1504))) key!932))))

(assert (=> d!59791 (= (contains!1670 (getCurrentListMap!1302 (_keys!6508 thiss!1504) (_values!4395 thiss!1504) (mask!10433 thiss!1504) (extraKeys!4149 thiss!1504) (zeroValue!4253 thiss!1504) (minValue!4253 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4412 thiss!1504)) key!932) lt!120377)))

(declare-fun b!237975 () Bool)

(declare-fun lt!120375 () Unit!7295)

(assert (=> b!237975 (= e!154524 lt!120375)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!216 (List!3488 (_ BitVec 64)) Unit!7295)

(assert (=> b!237975 (= lt!120375 (lemmaContainsKeyImpliesGetValueByKeyDefined!216 (toList!1770 (getCurrentListMap!1302 (_keys!6508 thiss!1504) (_values!4395 thiss!1504) (mask!10433 thiss!1504) (extraKeys!4149 thiss!1504) (zeroValue!4253 thiss!1504) (minValue!4253 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4412 thiss!1504))) key!932))))

(declare-datatypes ((Option!283 0))(
  ( (Some!282 (v!5207 V!7977)) (None!281) )
))
(declare-fun isDefined!217 (Option!283) Bool)

(declare-fun getValueByKey!277 (List!3488 (_ BitVec 64)) Option!283)

(assert (=> b!237975 (isDefined!217 (getValueByKey!277 (toList!1770 (getCurrentListMap!1302 (_keys!6508 thiss!1504) (_values!4395 thiss!1504) (mask!10433 thiss!1504) (extraKeys!4149 thiss!1504) (zeroValue!4253 thiss!1504) (minValue!4253 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4412 thiss!1504))) key!932))))

(declare-fun b!237976 () Bool)

(declare-fun Unit!7297 () Unit!7295)

(assert (=> b!237976 (= e!154524 Unit!7297)))

(declare-fun b!237977 () Bool)

(assert (=> b!237977 (= e!154523 (isDefined!217 (getValueByKey!277 (toList!1770 (getCurrentListMap!1302 (_keys!6508 thiss!1504) (_values!4395 thiss!1504) (mask!10433 thiss!1504) (extraKeys!4149 thiss!1504) (zeroValue!4253 thiss!1504) (minValue!4253 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4412 thiss!1504))) key!932)))))

(assert (= (and d!59791 c!39699) b!237975))

(assert (= (and d!59791 (not c!39699)) b!237976))

(assert (= (and d!59791 (not res!116615)) b!237977))

(declare-fun m!258825 () Bool)

(assert (=> d!59791 m!258825))

(declare-fun m!258827 () Bool)

(assert (=> b!237975 m!258827))

(declare-fun m!258829 () Bool)

(assert (=> b!237975 m!258829))

(assert (=> b!237975 m!258829))

(declare-fun m!258831 () Bool)

(assert (=> b!237975 m!258831))

(assert (=> b!237977 m!258829))

(assert (=> b!237977 m!258829))

(assert (=> b!237977 m!258831))

(assert (=> b!237891 d!59791))

(declare-fun b!238020 () Bool)

(declare-fun e!154561 () Bool)

(declare-fun lt!120429 () ListLongMap!3509)

(declare-fun apply!218 (ListLongMap!3509 (_ BitVec 64)) V!7977)

(assert (=> b!238020 (= e!154561 (= (apply!218 lt!120429 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4253 thiss!1504)))))

(declare-fun b!238021 () Bool)

(declare-fun e!154558 () Bool)

(declare-fun e!154560 () Bool)

(assert (=> b!238021 (= e!154558 e!154560)))

(declare-fun c!39713 () Bool)

(assert (=> b!238021 (= c!39713 (not (= (bvand (extraKeys!4149 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!238022 () Bool)

(declare-fun e!154562 () Bool)

(assert (=> b!238022 (= e!154562 (validKeyInArray!0 (select (arr!5588 (_keys!6508 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!238023 () Bool)

(declare-fun e!154551 () ListLongMap!3509)

(declare-fun call!22111 () ListLongMap!3509)

(assert (=> b!238023 (= e!154551 call!22111)))

(declare-fun b!238024 () Bool)

(declare-fun e!154557 () ListLongMap!3509)

(declare-fun call!22110 () ListLongMap!3509)

(assert (=> b!238024 (= e!154557 call!22110)))

(declare-fun b!238025 () Bool)

(declare-fun e!154556 () Bool)

(declare-fun get!2889 (ValueCell!2780 V!7977) V!7977)

(declare-fun dynLambda!561 (Int (_ BitVec 64)) V!7977)

(assert (=> b!238025 (= e!154556 (= (apply!218 lt!120429 (select (arr!5588 (_keys!6508 thiss!1504)) #b00000000000000000000000000000000)) (get!2889 (select (arr!5587 (_values!4395 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!561 (defaultEntry!4412 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!238025 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5928 (_values!4395 thiss!1504))))))

(assert (=> b!238025 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5929 (_keys!6508 thiss!1504))))))

(declare-fun bm!22107 () Bool)

(declare-fun call!22112 () ListLongMap!3509)

(assert (=> bm!22107 (= call!22111 call!22112)))

(declare-fun bm!22108 () Bool)

(declare-fun call!22116 () Bool)

(assert (=> bm!22108 (= call!22116 (contains!1670 lt!120429 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!22109 () Bool)

(declare-fun call!22115 () ListLongMap!3509)

(declare-fun call!22114 () ListLongMap!3509)

(assert (=> bm!22109 (= call!22115 call!22114)))

(declare-fun b!238026 () Bool)

(declare-fun res!116640 () Bool)

(assert (=> b!238026 (=> (not res!116640) (not e!154558))))

(declare-fun e!154553 () Bool)

(assert (=> b!238026 (= res!116640 e!154553)))

(declare-fun res!116641 () Bool)

(assert (=> b!238026 (=> res!116641 e!154553)))

(assert (=> b!238026 (= res!116641 (not e!154562))))

(declare-fun res!116634 () Bool)

(assert (=> b!238026 (=> (not res!116634) (not e!154562))))

(assert (=> b!238026 (= res!116634 (bvslt #b00000000000000000000000000000000 (size!5929 (_keys!6508 thiss!1504))))))

(declare-fun bm!22111 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!534 (array!11767 array!11765 (_ BitVec 32) (_ BitVec 32) V!7977 V!7977 (_ BitVec 32) Int) ListLongMap!3509)

(assert (=> bm!22111 (= call!22114 (getCurrentListMapNoExtraKeys!534 (_keys!6508 thiss!1504) (_values!4395 thiss!1504) (mask!10433 thiss!1504) (extraKeys!4149 thiss!1504) (zeroValue!4253 thiss!1504) (minValue!4253 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4412 thiss!1504)))))

(declare-fun bm!22110 () Bool)

(assert (=> bm!22110 (= call!22110 call!22115)))

(declare-fun d!59793 () Bool)

(assert (=> d!59793 e!154558))

(declare-fun res!116635 () Bool)

(assert (=> d!59793 (=> (not res!116635) (not e!154558))))

(assert (=> d!59793 (= res!116635 (or (bvsge #b00000000000000000000000000000000 (size!5929 (_keys!6508 thiss!1504))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5929 (_keys!6508 thiss!1504))))))))

(declare-fun lt!120427 () ListLongMap!3509)

(assert (=> d!59793 (= lt!120429 lt!120427)))

(declare-fun lt!120425 () Unit!7295)

(declare-fun e!154555 () Unit!7295)

(assert (=> d!59793 (= lt!120425 e!154555)))

(declare-fun c!39715 () Bool)

(declare-fun e!154563 () Bool)

(assert (=> d!59793 (= c!39715 e!154563)))

(declare-fun res!116638 () Bool)

(assert (=> d!59793 (=> (not res!116638) (not e!154563))))

(assert (=> d!59793 (= res!116638 (bvslt #b00000000000000000000000000000000 (size!5929 (_keys!6508 thiss!1504))))))

(declare-fun e!154554 () ListLongMap!3509)

(assert (=> d!59793 (= lt!120427 e!154554)))

(declare-fun c!39712 () Bool)

(assert (=> d!59793 (= c!39712 (and (not (= (bvand (extraKeys!4149 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4149 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!59793 (validMask!0 (mask!10433 thiss!1504))))

(assert (=> d!59793 (= (getCurrentListMap!1302 (_keys!6508 thiss!1504) (_values!4395 thiss!1504) (mask!10433 thiss!1504) (extraKeys!4149 thiss!1504) (zeroValue!4253 thiss!1504) (minValue!4253 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4412 thiss!1504)) lt!120429)))

(declare-fun b!238027 () Bool)

(declare-fun e!154552 () Bool)

(assert (=> b!238027 (= e!154552 (= (apply!218 lt!120429 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4253 thiss!1504)))))

(declare-fun b!238028 () Bool)

(declare-fun Unit!7298 () Unit!7295)

(assert (=> b!238028 (= e!154555 Unit!7298)))

(declare-fun b!238029 () Bool)

(assert (=> b!238029 (= e!154557 call!22111)))

(declare-fun bm!22112 () Bool)

(declare-fun call!22113 () Bool)

(assert (=> bm!22112 (= call!22113 (contains!1670 lt!120429 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!238030 () Bool)

(assert (=> b!238030 (= e!154560 e!154552)))

(declare-fun res!116642 () Bool)

(assert (=> b!238030 (= res!116642 call!22113)))

(assert (=> b!238030 (=> (not res!116642) (not e!154552))))

(declare-fun b!238031 () Bool)

(declare-fun lt!120428 () Unit!7295)

(assert (=> b!238031 (= e!154555 lt!120428)))

(declare-fun lt!120433 () ListLongMap!3509)

(assert (=> b!238031 (= lt!120433 (getCurrentListMapNoExtraKeys!534 (_keys!6508 thiss!1504) (_values!4395 thiss!1504) (mask!10433 thiss!1504) (extraKeys!4149 thiss!1504) (zeroValue!4253 thiss!1504) (minValue!4253 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4412 thiss!1504)))))

(declare-fun lt!120424 () (_ BitVec 64))

(assert (=> b!238031 (= lt!120424 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!120434 () (_ BitVec 64))

(assert (=> b!238031 (= lt!120434 (select (arr!5588 (_keys!6508 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!120438 () Unit!7295)

(declare-fun addStillContains!194 (ListLongMap!3509 (_ BitVec 64) V!7977 (_ BitVec 64)) Unit!7295)

(assert (=> b!238031 (= lt!120438 (addStillContains!194 lt!120433 lt!120424 (zeroValue!4253 thiss!1504) lt!120434))))

(declare-fun +!645 (ListLongMap!3509 tuple2!4594) ListLongMap!3509)

(assert (=> b!238031 (contains!1670 (+!645 lt!120433 (tuple2!4595 lt!120424 (zeroValue!4253 thiss!1504))) lt!120434)))

(declare-fun lt!120431 () Unit!7295)

(assert (=> b!238031 (= lt!120431 lt!120438)))

(declare-fun lt!120440 () ListLongMap!3509)

(assert (=> b!238031 (= lt!120440 (getCurrentListMapNoExtraKeys!534 (_keys!6508 thiss!1504) (_values!4395 thiss!1504) (mask!10433 thiss!1504) (extraKeys!4149 thiss!1504) (zeroValue!4253 thiss!1504) (minValue!4253 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4412 thiss!1504)))))

(declare-fun lt!120436 () (_ BitVec 64))

(assert (=> b!238031 (= lt!120436 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!120439 () (_ BitVec 64))

(assert (=> b!238031 (= lt!120439 (select (arr!5588 (_keys!6508 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!120430 () Unit!7295)

(declare-fun addApplyDifferent!194 (ListLongMap!3509 (_ BitVec 64) V!7977 (_ BitVec 64)) Unit!7295)

(assert (=> b!238031 (= lt!120430 (addApplyDifferent!194 lt!120440 lt!120436 (minValue!4253 thiss!1504) lt!120439))))

(assert (=> b!238031 (= (apply!218 (+!645 lt!120440 (tuple2!4595 lt!120436 (minValue!4253 thiss!1504))) lt!120439) (apply!218 lt!120440 lt!120439))))

(declare-fun lt!120422 () Unit!7295)

(assert (=> b!238031 (= lt!120422 lt!120430)))

(declare-fun lt!120442 () ListLongMap!3509)

(assert (=> b!238031 (= lt!120442 (getCurrentListMapNoExtraKeys!534 (_keys!6508 thiss!1504) (_values!4395 thiss!1504) (mask!10433 thiss!1504) (extraKeys!4149 thiss!1504) (zeroValue!4253 thiss!1504) (minValue!4253 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4412 thiss!1504)))))

(declare-fun lt!120423 () (_ BitVec 64))

(assert (=> b!238031 (= lt!120423 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!120441 () (_ BitVec 64))

(assert (=> b!238031 (= lt!120441 (select (arr!5588 (_keys!6508 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!120437 () Unit!7295)

(assert (=> b!238031 (= lt!120437 (addApplyDifferent!194 lt!120442 lt!120423 (zeroValue!4253 thiss!1504) lt!120441))))

(assert (=> b!238031 (= (apply!218 (+!645 lt!120442 (tuple2!4595 lt!120423 (zeroValue!4253 thiss!1504))) lt!120441) (apply!218 lt!120442 lt!120441))))

(declare-fun lt!120443 () Unit!7295)

(assert (=> b!238031 (= lt!120443 lt!120437)))

(declare-fun lt!120426 () ListLongMap!3509)

(assert (=> b!238031 (= lt!120426 (getCurrentListMapNoExtraKeys!534 (_keys!6508 thiss!1504) (_values!4395 thiss!1504) (mask!10433 thiss!1504) (extraKeys!4149 thiss!1504) (zeroValue!4253 thiss!1504) (minValue!4253 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4412 thiss!1504)))))

(declare-fun lt!120435 () (_ BitVec 64))

(assert (=> b!238031 (= lt!120435 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!120432 () (_ BitVec 64))

(assert (=> b!238031 (= lt!120432 (select (arr!5588 (_keys!6508 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!238031 (= lt!120428 (addApplyDifferent!194 lt!120426 lt!120435 (minValue!4253 thiss!1504) lt!120432))))

(assert (=> b!238031 (= (apply!218 (+!645 lt!120426 (tuple2!4595 lt!120435 (minValue!4253 thiss!1504))) lt!120432) (apply!218 lt!120426 lt!120432))))

(declare-fun b!238032 () Bool)

(assert (=> b!238032 (= e!154563 (validKeyInArray!0 (select (arr!5588 (_keys!6508 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!238033 () Bool)

(assert (=> b!238033 (= e!154554 e!154551)))

(declare-fun c!39714 () Bool)

(assert (=> b!238033 (= c!39714 (and (not (= (bvand (extraKeys!4149 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4149 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!238034 () Bool)

(assert (=> b!238034 (= e!154560 (not call!22113))))

(declare-fun b!238035 () Bool)

(assert (=> b!238035 (= e!154553 e!154556)))

(declare-fun res!116639 () Bool)

(assert (=> b!238035 (=> (not res!116639) (not e!154556))))

(assert (=> b!238035 (= res!116639 (contains!1670 lt!120429 (select (arr!5588 (_keys!6508 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!238035 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5929 (_keys!6508 thiss!1504))))))

(declare-fun b!238036 () Bool)

(declare-fun e!154559 () Bool)

(assert (=> b!238036 (= e!154559 (not call!22116))))

(declare-fun b!238037 () Bool)

(assert (=> b!238037 (= e!154554 (+!645 call!22112 (tuple2!4595 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4253 thiss!1504))))))

(declare-fun b!238038 () Bool)

(declare-fun res!116637 () Bool)

(assert (=> b!238038 (=> (not res!116637) (not e!154558))))

(assert (=> b!238038 (= res!116637 e!154559)))

(declare-fun c!39716 () Bool)

(assert (=> b!238038 (= c!39716 (not (= (bvand (extraKeys!4149 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!238039 () Bool)

(declare-fun c!39717 () Bool)

(assert (=> b!238039 (= c!39717 (and (not (= (bvand (extraKeys!4149 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4149 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!238039 (= e!154551 e!154557)))

(declare-fun b!238040 () Bool)

(assert (=> b!238040 (= e!154559 e!154561)))

(declare-fun res!116636 () Bool)

(assert (=> b!238040 (= res!116636 call!22116)))

(assert (=> b!238040 (=> (not res!116636) (not e!154561))))

(declare-fun bm!22113 () Bool)

(assert (=> bm!22113 (= call!22112 (+!645 (ite c!39712 call!22114 (ite c!39714 call!22115 call!22110)) (ite (or c!39712 c!39714) (tuple2!4595 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4253 thiss!1504)) (tuple2!4595 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4253 thiss!1504)))))))

(assert (= (and d!59793 c!39712) b!238037))

(assert (= (and d!59793 (not c!39712)) b!238033))

(assert (= (and b!238033 c!39714) b!238023))

(assert (= (and b!238033 (not c!39714)) b!238039))

(assert (= (and b!238039 c!39717) b!238029))

(assert (= (and b!238039 (not c!39717)) b!238024))

(assert (= (or b!238029 b!238024) bm!22110))

(assert (= (or b!238023 bm!22110) bm!22109))

(assert (= (or b!238023 b!238029) bm!22107))

(assert (= (or b!238037 bm!22109) bm!22111))

(assert (= (or b!238037 bm!22107) bm!22113))

(assert (= (and d!59793 res!116638) b!238032))

(assert (= (and d!59793 c!39715) b!238031))

(assert (= (and d!59793 (not c!39715)) b!238028))

(assert (= (and d!59793 res!116635) b!238026))

(assert (= (and b!238026 res!116634) b!238022))

(assert (= (and b!238026 (not res!116641)) b!238035))

(assert (= (and b!238035 res!116639) b!238025))

(assert (= (and b!238026 res!116640) b!238038))

(assert (= (and b!238038 c!39716) b!238040))

(assert (= (and b!238038 (not c!39716)) b!238036))

(assert (= (and b!238040 res!116636) b!238020))

(assert (= (or b!238040 b!238036) bm!22108))

(assert (= (and b!238038 res!116637) b!238021))

(assert (= (and b!238021 c!39713) b!238030))

(assert (= (and b!238021 (not c!39713)) b!238034))

(assert (= (and b!238030 res!116642) b!238027))

(assert (= (or b!238030 b!238034) bm!22112))

(declare-fun b_lambda!7989 () Bool)

(assert (=> (not b_lambda!7989) (not b!238025)))

(declare-fun t!8472 () Bool)

(declare-fun tb!2941 () Bool)

(assert (=> (and b!237889 (= (defaultEntry!4412 thiss!1504) (defaultEntry!4412 thiss!1504)) t!8472) tb!2941))

(declare-fun result!5161 () Bool)

(assert (=> tb!2941 (= result!5161 tp_is_empty!6247)))

(assert (=> b!238025 t!8472))

(declare-fun b_and!13365 () Bool)

(assert (= b_and!13359 (and (=> t!8472 result!5161) b_and!13365)))

(declare-fun m!258833 () Bool)

(assert (=> b!238027 m!258833))

(assert (=> b!238032 m!258813))

(assert (=> b!238032 m!258813))

(assert (=> b!238032 m!258815))

(declare-fun m!258835 () Bool)

(assert (=> b!238025 m!258835))

(declare-fun m!258837 () Bool)

(assert (=> b!238025 m!258837))

(declare-fun m!258839 () Bool)

(assert (=> b!238025 m!258839))

(assert (=> b!238025 m!258813))

(assert (=> b!238025 m!258835))

(assert (=> b!238025 m!258837))

(assert (=> b!238025 m!258813))

(declare-fun m!258841 () Bool)

(assert (=> b!238025 m!258841))

(declare-fun m!258843 () Bool)

(assert (=> bm!22113 m!258843))

(assert (=> b!238022 m!258813))

(assert (=> b!238022 m!258813))

(assert (=> b!238022 m!258815))

(declare-fun m!258845 () Bool)

(assert (=> bm!22111 m!258845))

(assert (=> b!238031 m!258845))

(declare-fun m!258847 () Bool)

(assert (=> b!238031 m!258847))

(declare-fun m!258849 () Bool)

(assert (=> b!238031 m!258849))

(declare-fun m!258851 () Bool)

(assert (=> b!238031 m!258851))

(declare-fun m!258853 () Bool)

(assert (=> b!238031 m!258853))

(declare-fun m!258855 () Bool)

(assert (=> b!238031 m!258855))

(declare-fun m!258857 () Bool)

(assert (=> b!238031 m!258857))

(declare-fun m!258859 () Bool)

(assert (=> b!238031 m!258859))

(assert (=> b!238031 m!258813))

(assert (=> b!238031 m!258847))

(declare-fun m!258861 () Bool)

(assert (=> b!238031 m!258861))

(declare-fun m!258863 () Bool)

(assert (=> b!238031 m!258863))

(declare-fun m!258865 () Bool)

(assert (=> b!238031 m!258865))

(assert (=> b!238031 m!258859))

(declare-fun m!258867 () Bool)

(assert (=> b!238031 m!258867))

(declare-fun m!258869 () Bool)

(assert (=> b!238031 m!258869))

(declare-fun m!258871 () Bool)

(assert (=> b!238031 m!258871))

(assert (=> b!238031 m!258853))

(assert (=> b!238031 m!258869))

(declare-fun m!258873 () Bool)

(assert (=> b!238031 m!258873))

(declare-fun m!258875 () Bool)

(assert (=> b!238031 m!258875))

(declare-fun m!258877 () Bool)

(assert (=> bm!22112 m!258877))

(assert (=> d!59793 m!258771))

(assert (=> b!238035 m!258813))

(assert (=> b!238035 m!258813))

(declare-fun m!258879 () Bool)

(assert (=> b!238035 m!258879))

(declare-fun m!258881 () Bool)

(assert (=> b!238020 m!258881))

(declare-fun m!258883 () Bool)

(assert (=> b!238037 m!258883))

(declare-fun m!258885 () Bool)

(assert (=> bm!22108 m!258885))

(assert (=> b!237891 d!59793))

(declare-fun d!59795 () Bool)

(assert (=> d!59795 (= (validMask!0 (mask!10433 thiss!1504)) (and (or (= (mask!10433 thiss!1504) #b00000000000000000000000000000111) (= (mask!10433 thiss!1504) #b00000000000000000000000000001111) (= (mask!10433 thiss!1504) #b00000000000000000000000000011111) (= (mask!10433 thiss!1504) #b00000000000000000000000000111111) (= (mask!10433 thiss!1504) #b00000000000000000000000001111111) (= (mask!10433 thiss!1504) #b00000000000000000000000011111111) (= (mask!10433 thiss!1504) #b00000000000000000000000111111111) (= (mask!10433 thiss!1504) #b00000000000000000000001111111111) (= (mask!10433 thiss!1504) #b00000000000000000000011111111111) (= (mask!10433 thiss!1504) #b00000000000000000000111111111111) (= (mask!10433 thiss!1504) #b00000000000000000001111111111111) (= (mask!10433 thiss!1504) #b00000000000000000011111111111111) (= (mask!10433 thiss!1504) #b00000000000000000111111111111111) (= (mask!10433 thiss!1504) #b00000000000000001111111111111111) (= (mask!10433 thiss!1504) #b00000000000000011111111111111111) (= (mask!10433 thiss!1504) #b00000000000000111111111111111111) (= (mask!10433 thiss!1504) #b00000000000001111111111111111111) (= (mask!10433 thiss!1504) #b00000000000011111111111111111111) (= (mask!10433 thiss!1504) #b00000000000111111111111111111111) (= (mask!10433 thiss!1504) #b00000000001111111111111111111111) (= (mask!10433 thiss!1504) #b00000000011111111111111111111111) (= (mask!10433 thiss!1504) #b00000000111111111111111111111111) (= (mask!10433 thiss!1504) #b00000001111111111111111111111111) (= (mask!10433 thiss!1504) #b00000011111111111111111111111111) (= (mask!10433 thiss!1504) #b00000111111111111111111111111111) (= (mask!10433 thiss!1504) #b00001111111111111111111111111111) (= (mask!10433 thiss!1504) #b00011111111111111111111111111111) (= (mask!10433 thiss!1504) #b00111111111111111111111111111111)) (bvsle (mask!10433 thiss!1504) #b00111111111111111111111111111111)))))

(assert (=> b!237887 d!59795))

(declare-fun d!59797 () Bool)

(declare-fun lt!120452 () SeekEntryResult!983)

(assert (=> d!59797 (and (or ((_ is Undefined!983) lt!120452) (not ((_ is Found!983) lt!120452)) (and (bvsge (index!6103 lt!120452) #b00000000000000000000000000000000) (bvslt (index!6103 lt!120452) (size!5929 (_keys!6508 thiss!1504))))) (or ((_ is Undefined!983) lt!120452) ((_ is Found!983) lt!120452) (not ((_ is MissingZero!983) lt!120452)) (and (bvsge (index!6102 lt!120452) #b00000000000000000000000000000000) (bvslt (index!6102 lt!120452) (size!5929 (_keys!6508 thiss!1504))))) (or ((_ is Undefined!983) lt!120452) ((_ is Found!983) lt!120452) ((_ is MissingZero!983) lt!120452) (not ((_ is MissingVacant!983) lt!120452)) (and (bvsge (index!6105 lt!120452) #b00000000000000000000000000000000) (bvslt (index!6105 lt!120452) (size!5929 (_keys!6508 thiss!1504))))) (or ((_ is Undefined!983) lt!120452) (ite ((_ is Found!983) lt!120452) (= (select (arr!5588 (_keys!6508 thiss!1504)) (index!6103 lt!120452)) key!932) (ite ((_ is MissingZero!983) lt!120452) (= (select (arr!5588 (_keys!6508 thiss!1504)) (index!6102 lt!120452)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!983) lt!120452) (= (select (arr!5588 (_keys!6508 thiss!1504)) (index!6105 lt!120452)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!154572 () SeekEntryResult!983)

(assert (=> d!59797 (= lt!120452 e!154572)))

(declare-fun c!39724 () Bool)

(declare-fun lt!120450 () SeekEntryResult!983)

(assert (=> d!59797 (= c!39724 (and ((_ is Intermediate!983) lt!120450) (undefined!1795 lt!120450)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!11767 (_ BitVec 32)) SeekEntryResult!983)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!59797 (= lt!120450 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!10433 thiss!1504)) key!932 (_keys!6508 thiss!1504) (mask!10433 thiss!1504)))))

(assert (=> d!59797 (validMask!0 (mask!10433 thiss!1504))))

(assert (=> d!59797 (= (seekEntryOrOpen!0 key!932 (_keys!6508 thiss!1504) (mask!10433 thiss!1504)) lt!120452)))

(declare-fun b!238055 () Bool)

(declare-fun c!39725 () Bool)

(declare-fun lt!120451 () (_ BitVec 64))

(assert (=> b!238055 (= c!39725 (= lt!120451 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!154571 () SeekEntryResult!983)

(declare-fun e!154570 () SeekEntryResult!983)

(assert (=> b!238055 (= e!154571 e!154570)))

(declare-fun b!238056 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!11767 (_ BitVec 32)) SeekEntryResult!983)

(assert (=> b!238056 (= e!154570 (seekKeyOrZeroReturnVacant!0 (x!23961 lt!120450) (index!6104 lt!120450) (index!6104 lt!120450) key!932 (_keys!6508 thiss!1504) (mask!10433 thiss!1504)))))

(declare-fun b!238057 () Bool)

(assert (=> b!238057 (= e!154570 (MissingZero!983 (index!6104 lt!120450)))))

(declare-fun b!238058 () Bool)

(assert (=> b!238058 (= e!154572 e!154571)))

(assert (=> b!238058 (= lt!120451 (select (arr!5588 (_keys!6508 thiss!1504)) (index!6104 lt!120450)))))

(declare-fun c!39726 () Bool)

(assert (=> b!238058 (= c!39726 (= lt!120451 key!932))))

(declare-fun b!238059 () Bool)

(assert (=> b!238059 (= e!154571 (Found!983 (index!6104 lt!120450)))))

(declare-fun b!238060 () Bool)

(assert (=> b!238060 (= e!154572 Undefined!983)))

(assert (= (and d!59797 c!39724) b!238060))

(assert (= (and d!59797 (not c!39724)) b!238058))

(assert (= (and b!238058 c!39726) b!238059))

(assert (= (and b!238058 (not c!39726)) b!238055))

(assert (= (and b!238055 c!39725) b!238057))

(assert (= (and b!238055 (not c!39725)) b!238056))

(assert (=> d!59797 m!258771))

(declare-fun m!258887 () Bool)

(assert (=> d!59797 m!258887))

(declare-fun m!258889 () Bool)

(assert (=> d!59797 m!258889))

(assert (=> d!59797 m!258887))

(declare-fun m!258891 () Bool)

(assert (=> d!59797 m!258891))

(declare-fun m!258893 () Bool)

(assert (=> d!59797 m!258893))

(declare-fun m!258895 () Bool)

(assert (=> d!59797 m!258895))

(declare-fun m!258897 () Bool)

(assert (=> b!238056 m!258897))

(declare-fun m!258899 () Bool)

(assert (=> b!238058 m!258899))

(assert (=> b!237890 d!59797))

(declare-fun d!59799 () Bool)

(declare-fun res!116649 () Bool)

(declare-fun e!154575 () Bool)

(assert (=> d!59799 (=> (not res!116649) (not e!154575))))

(declare-fun simpleValid!241 (LongMapFixedSize!3460) Bool)

(assert (=> d!59799 (= res!116649 (simpleValid!241 thiss!1504))))

(assert (=> d!59799 (= (valid!1380 thiss!1504) e!154575)))

(declare-fun b!238067 () Bool)

(declare-fun res!116650 () Bool)

(assert (=> b!238067 (=> (not res!116650) (not e!154575))))

(declare-fun arrayCountValidKeys!0 (array!11767 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!238067 (= res!116650 (= (arrayCountValidKeys!0 (_keys!6508 thiss!1504) #b00000000000000000000000000000000 (size!5929 (_keys!6508 thiss!1504))) (_size!1779 thiss!1504)))))

(declare-fun b!238068 () Bool)

(declare-fun res!116651 () Bool)

(assert (=> b!238068 (=> (not res!116651) (not e!154575))))

(assert (=> b!238068 (= res!116651 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6508 thiss!1504) (mask!10433 thiss!1504)))))

(declare-fun b!238069 () Bool)

(declare-datatypes ((List!3490 0))(
  ( (Nil!3487) (Cons!3486 (h!4142 (_ BitVec 64)) (t!8473 List!3490)) )
))
(declare-fun arrayNoDuplicates!0 (array!11767 (_ BitVec 32) List!3490) Bool)

(assert (=> b!238069 (= e!154575 (arrayNoDuplicates!0 (_keys!6508 thiss!1504) #b00000000000000000000000000000000 Nil!3487))))

(assert (= (and d!59799 res!116649) b!238067))

(assert (= (and b!238067 res!116650) b!238068))

(assert (= (and b!238068 res!116651) b!238069))

(declare-fun m!258901 () Bool)

(assert (=> d!59799 m!258901))

(declare-fun m!258903 () Bool)

(assert (=> b!238067 m!258903))

(assert (=> b!238068 m!258767))

(declare-fun m!258905 () Bool)

(assert (=> b!238069 m!258905))

(assert (=> start!22832 d!59799))

(declare-fun mapIsEmpty!10602 () Bool)

(declare-fun mapRes!10602 () Bool)

(assert (=> mapIsEmpty!10602 mapRes!10602))

(declare-fun mapNonEmpty!10602 () Bool)

(declare-fun tp!22365 () Bool)

(declare-fun e!154581 () Bool)

(assert (=> mapNonEmpty!10602 (= mapRes!10602 (and tp!22365 e!154581))))

(declare-fun mapValue!10602 () ValueCell!2780)

(declare-fun mapRest!10602 () (Array (_ BitVec 32) ValueCell!2780))

(declare-fun mapKey!10602 () (_ BitVec 32))

(assert (=> mapNonEmpty!10602 (= mapRest!10593 (store mapRest!10602 mapKey!10602 mapValue!10602))))

(declare-fun condMapEmpty!10602 () Bool)

(declare-fun mapDefault!10602 () ValueCell!2780)

(assert (=> mapNonEmpty!10593 (= condMapEmpty!10602 (= mapRest!10593 ((as const (Array (_ BitVec 32) ValueCell!2780)) mapDefault!10602)))))

(declare-fun e!154580 () Bool)

(assert (=> mapNonEmpty!10593 (= tp!22349 (and e!154580 mapRes!10602))))

(declare-fun b!238076 () Bool)

(assert (=> b!238076 (= e!154581 tp_is_empty!6247)))

(declare-fun b!238077 () Bool)

(assert (=> b!238077 (= e!154580 tp_is_empty!6247)))

(assert (= (and mapNonEmpty!10593 condMapEmpty!10602) mapIsEmpty!10602))

(assert (= (and mapNonEmpty!10593 (not condMapEmpty!10602)) mapNonEmpty!10602))

(assert (= (and mapNonEmpty!10602 ((_ is ValueCellFull!2780) mapValue!10602)) b!238076))

(assert (= (and mapNonEmpty!10593 ((_ is ValueCellFull!2780) mapDefault!10602)) b!238077))

(declare-fun m!258907 () Bool)

(assert (=> mapNonEmpty!10602 m!258907))

(declare-fun b_lambda!7991 () Bool)

(assert (= b_lambda!7989 (or (and b!237889 b_free!6385) b_lambda!7991)))

(check-sat (not d!59797) (not b_lambda!7991) (not b!238068) (not b!237968) (not b!238025) b_and!13365 tp_is_empty!6247 (not b!238067) (not b_next!6385) (not b!237977) (not b!237965) (not bm!22108) (not b!238020) (not b!238022) (not mapNonEmpty!10602) (not b!238032) (not d!59793) (not bm!22113) (not bm!22112) (not bm!22111) (not b!238069) (not b!237975) (not b!238027) (not b!238031) (not b!238037) (not b!238035) (not d!59791) (not bm!22092) (not d!59799) (not b!238056))
(check-sat b_and!13365 (not b_next!6385))
