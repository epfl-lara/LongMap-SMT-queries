; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75534 () Bool)

(assert start!75534)

(declare-fun b!888440 () Bool)

(declare-fun b_free!15517 () Bool)

(declare-fun b_next!15517 () Bool)

(assert (=> b!888440 (= b_free!15517 (not b_next!15517))))

(declare-fun tp!54490 () Bool)

(declare-fun b_and!25747 () Bool)

(assert (=> b!888440 (= tp!54490 b_and!25747)))

(declare-fun b!888435 () Bool)

(declare-fun e!494861 () Bool)

(declare-fun tp_is_empty!17845 () Bool)

(assert (=> b!888435 (= e!494861 tp_is_empty!17845)))

(declare-fun key!673 () (_ BitVec 64))

(declare-fun e!494858 () Bool)

(declare-fun b!888436 () Bool)

(declare-datatypes ((V!28759 0))(
  ( (V!28760 (val!8973 Int)) )
))
(declare-datatypes ((ValueCell!8441 0))(
  ( (ValueCellFull!8441 (v!11428 V!28759)) (EmptyCell!8441) )
))
(declare-datatypes ((array!51691 0))(
  ( (array!51692 (arr!24856 (Array (_ BitVec 32) ValueCell!8441)) (size!25297 (_ BitVec 32))) )
))
(declare-datatypes ((array!51693 0))(
  ( (array!51694 (arr!24857 (Array (_ BitVec 32) (_ BitVec 64))) (size!25298 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3898 0))(
  ( (LongMapFixedSize!3899 (defaultEntry!5140 Int) (mask!25583 (_ BitVec 32)) (extraKeys!4834 (_ BitVec 32)) (zeroValue!4938 V!28759) (minValue!4938 V!28759) (_size!2004 (_ BitVec 32)) (_keys!9845 array!51693) (_values!5125 array!51691) (_vacant!2004 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!1058 0))(
  ( (Cell!1059 (v!11429 LongMapFixedSize!3898)) )
))
(declare-datatypes ((LongMap!1058 0))(
  ( (LongMap!1059 (underlying!540 Cell!1058)) )
))
(declare-fun thiss!833 () LongMap!1058)

(declare-fun lt!401772 () V!28759)

(declare-datatypes ((Option!441 0))(
  ( (Some!440 (v!11430 V!28759)) (None!439) )
))
(declare-fun get!13149 (Option!441) V!28759)

(declare-datatypes ((tuple2!11850 0))(
  ( (tuple2!11851 (_1!5936 (_ BitVec 64)) (_2!5936 V!28759)) )
))
(declare-datatypes ((List!17636 0))(
  ( (Nil!17633) (Cons!17632 (h!18769 tuple2!11850) (t!24917 List!17636)) )
))
(declare-fun getValueByKey!435 (List!17636 (_ BitVec 64)) Option!441)

(declare-datatypes ((ListLongMap!10549 0))(
  ( (ListLongMap!10550 (toList!5290 List!17636)) )
))
(declare-fun map!12076 (LongMap!1058) ListLongMap!10549)

(assert (=> b!888436 (= e!494858 (not (= lt!401772 (get!13149 (getValueByKey!435 (toList!5290 (map!12076 thiss!833)) key!673)))))))

(declare-fun res!602509 () Bool)

(declare-fun e!494853 () Bool)

(assert (=> start!75534 (=> (not res!602509) (not e!494853))))

(declare-fun valid!1528 (LongMap!1058) Bool)

(assert (=> start!75534 (= res!602509 (valid!1528 thiss!833))))

(assert (=> start!75534 e!494853))

(declare-fun e!494859 () Bool)

(assert (=> start!75534 e!494859))

(assert (=> start!75534 true))

(declare-fun b!888437 () Bool)

(declare-fun e!494857 () Bool)

(declare-fun e!494854 () Bool)

(assert (=> b!888437 (= e!494857 e!494854)))

(declare-fun mapNonEmpty!28291 () Bool)

(declare-fun mapRes!28291 () Bool)

(declare-fun tp!54489 () Bool)

(assert (=> mapNonEmpty!28291 (= mapRes!28291 (and tp!54489 e!494861))))

(declare-fun mapValue!28291 () ValueCell!8441)

(declare-fun mapKey!28291 () (_ BitVec 32))

(declare-fun mapRest!28291 () (Array (_ BitVec 32) ValueCell!8441))

(assert (=> mapNonEmpty!28291 (= (arr!24856 (_values!5125 (v!11429 (underlying!540 thiss!833)))) (store mapRest!28291 mapKey!28291 mapValue!28291))))

(declare-fun b!888438 () Bool)

(declare-fun e!494855 () Bool)

(assert (=> b!888438 (= e!494855 tp_is_empty!17845)))

(declare-fun b!888439 () Bool)

(assert (=> b!888439 (= e!494859 e!494857)))

(declare-fun e!494860 () Bool)

(declare-fun array_inv!19606 (array!51693) Bool)

(declare-fun array_inv!19607 (array!51691) Bool)

(assert (=> b!888440 (= e!494854 (and tp!54490 tp_is_empty!17845 (array_inv!19606 (_keys!9845 (v!11429 (underlying!540 thiss!833)))) (array_inv!19607 (_values!5125 (v!11429 (underlying!540 thiss!833)))) e!494860))))

(declare-fun b!888441 () Bool)

(assert (=> b!888441 (= e!494860 (and e!494855 mapRes!28291))))

(declare-fun condMapEmpty!28291 () Bool)

(declare-fun mapDefault!28291 () ValueCell!8441)

(assert (=> b!888441 (= condMapEmpty!28291 (= (arr!24856 (_values!5125 (v!11429 (underlying!540 thiss!833)))) ((as const (Array (_ BitVec 32) ValueCell!8441)) mapDefault!28291)))))

(declare-fun mapIsEmpty!28291 () Bool)

(assert (=> mapIsEmpty!28291 mapRes!28291))

(declare-fun b!888442 () Bool)

(declare-fun dynLambda!1303 (Int (_ BitVec 64)) V!28759)

(assert (=> b!888442 (= e!494858 (not (= lt!401772 (dynLambda!1303 (defaultEntry!5140 (v!11429 (underlying!540 thiss!833))) key!673))))))

(declare-fun b!888443 () Bool)

(assert (=> b!888443 (= e!494853 e!494858)))

(declare-fun c!93985 () Bool)

(declare-fun contains!4286 (LongMap!1058 (_ BitVec 64)) Bool)

(assert (=> b!888443 (= c!93985 (contains!4286 thiss!833 key!673))))

(declare-fun apply!393 (LongMapFixedSize!3898 (_ BitVec 64)) V!28759)

(assert (=> b!888443 (= lt!401772 (apply!393 (v!11429 (underlying!540 thiss!833)) key!673))))

(assert (= (and start!75534 res!602509) b!888443))

(assert (= (and b!888443 c!93985) b!888436))

(assert (= (and b!888443 (not c!93985)) b!888442))

(assert (= (and b!888441 condMapEmpty!28291) mapIsEmpty!28291))

(assert (= (and b!888441 (not condMapEmpty!28291)) mapNonEmpty!28291))

(get-info :version)

(assert (= (and mapNonEmpty!28291 ((_ is ValueCellFull!8441) mapValue!28291)) b!888435))

(assert (= (and b!888441 ((_ is ValueCellFull!8441) mapDefault!28291)) b!888438))

(assert (= b!888440 b!888441))

(assert (= b!888437 b!888440))

(assert (= b!888439 b!888437))

(assert (= start!75534 b!888439))

(declare-fun b_lambda!12861 () Bool)

(assert (=> (not b_lambda!12861) (not b!888442)))

(declare-fun t!24916 () Bool)

(declare-fun tb!5131 () Bool)

(assert (=> (and b!888440 (= (defaultEntry!5140 (v!11429 (underlying!540 thiss!833))) (defaultEntry!5140 (v!11429 (underlying!540 thiss!833)))) t!24916) tb!5131))

(declare-fun result!9965 () Bool)

(assert (=> tb!5131 (= result!9965 tp_is_empty!17845)))

(assert (=> b!888442 t!24916))

(declare-fun b_and!25749 () Bool)

(assert (= b_and!25747 (and (=> t!24916 result!9965) b_and!25749)))

(declare-fun m!828439 () Bool)

(assert (=> b!888443 m!828439))

(declare-fun m!828441 () Bool)

(assert (=> b!888443 m!828441))

(declare-fun m!828443 () Bool)

(assert (=> b!888436 m!828443))

(declare-fun m!828445 () Bool)

(assert (=> b!888436 m!828445))

(assert (=> b!888436 m!828445))

(declare-fun m!828447 () Bool)

(assert (=> b!888436 m!828447))

(declare-fun m!828449 () Bool)

(assert (=> b!888440 m!828449))

(declare-fun m!828451 () Bool)

(assert (=> b!888440 m!828451))

(declare-fun m!828453 () Bool)

(assert (=> mapNonEmpty!28291 m!828453))

(declare-fun m!828455 () Bool)

(assert (=> start!75534 m!828455))

(declare-fun m!828457 () Bool)

(assert (=> b!888442 m!828457))

(check-sat (not b_lambda!12861) (not start!75534) tp_is_empty!17845 (not b_next!15517) (not mapNonEmpty!28291) (not b!888443) b_and!25749 (not b!888440) (not b!888436))
(check-sat b_and!25749 (not b_next!15517))
(get-model)

(declare-fun b_lambda!12867 () Bool)

(assert (= b_lambda!12861 (or (and b!888440 b_free!15517) b_lambda!12867)))

(check-sat (not start!75534) tp_is_empty!17845 (not b_next!15517) (not mapNonEmpty!28291) (not b!888443) (not b_lambda!12867) b_and!25749 (not b!888440) (not b!888436))
(check-sat b_and!25749 (not b_next!15517))
(get-model)

(declare-fun d!110265 () Bool)

(assert (=> d!110265 (= (get!13149 (getValueByKey!435 (toList!5290 (map!12076 thiss!833)) key!673)) (v!11430 (getValueByKey!435 (toList!5290 (map!12076 thiss!833)) key!673)))))

(assert (=> b!888436 d!110265))

(declare-fun d!110267 () Bool)

(declare-fun c!93996 () Bool)

(assert (=> d!110267 (= c!93996 (and ((_ is Cons!17632) (toList!5290 (map!12076 thiss!833))) (= (_1!5936 (h!18769 (toList!5290 (map!12076 thiss!833)))) key!673)))))

(declare-fun e!494920 () Option!441)

(assert (=> d!110267 (= (getValueByKey!435 (toList!5290 (map!12076 thiss!833)) key!673) e!494920)))

(declare-fun b!888512 () Bool)

(assert (=> b!888512 (= e!494920 (Some!440 (_2!5936 (h!18769 (toList!5290 (map!12076 thiss!833))))))))

(declare-fun b!888514 () Bool)

(declare-fun e!494921 () Option!441)

(assert (=> b!888514 (= e!494921 (getValueByKey!435 (t!24917 (toList!5290 (map!12076 thiss!833))) key!673))))

(declare-fun b!888515 () Bool)

(assert (=> b!888515 (= e!494921 None!439)))

(declare-fun b!888513 () Bool)

(assert (=> b!888513 (= e!494920 e!494921)))

(declare-fun c!93997 () Bool)

(assert (=> b!888513 (= c!93997 (and ((_ is Cons!17632) (toList!5290 (map!12076 thiss!833))) (not (= (_1!5936 (h!18769 (toList!5290 (map!12076 thiss!833)))) key!673))))))

(assert (= (and d!110267 c!93996) b!888512))

(assert (= (and d!110267 (not c!93996)) b!888513))

(assert (= (and b!888513 c!93997) b!888514))

(assert (= (and b!888513 (not c!93997)) b!888515))

(declare-fun m!828499 () Bool)

(assert (=> b!888514 m!828499))

(assert (=> b!888436 d!110267))

(declare-fun d!110269 () Bool)

(declare-fun map!12077 (LongMapFixedSize!3898) ListLongMap!10549)

(assert (=> d!110269 (= (map!12076 thiss!833) (map!12077 (v!11429 (underlying!540 thiss!833))))))

(declare-fun bs!24894 () Bool)

(assert (= bs!24894 d!110269))

(declare-fun m!828501 () Bool)

(assert (=> bs!24894 m!828501))

(assert (=> b!888436 d!110269))

(declare-fun d!110271 () Bool)

(declare-fun valid!1529 (LongMapFixedSize!3898) Bool)

(assert (=> d!110271 (= (valid!1528 thiss!833) (valid!1529 (v!11429 (underlying!540 thiss!833))))))

(declare-fun bs!24895 () Bool)

(assert (= bs!24895 d!110271))

(declare-fun m!828503 () Bool)

(assert (=> bs!24895 m!828503))

(assert (=> start!75534 d!110271))

(declare-fun d!110273 () Bool)

(assert (=> d!110273 (= (array_inv!19606 (_keys!9845 (v!11429 (underlying!540 thiss!833)))) (bvsge (size!25298 (_keys!9845 (v!11429 (underlying!540 thiss!833)))) #b00000000000000000000000000000000))))

(assert (=> b!888440 d!110273))

(declare-fun d!110275 () Bool)

(assert (=> d!110275 (= (array_inv!19607 (_values!5125 (v!11429 (underlying!540 thiss!833)))) (bvsge (size!25297 (_values!5125 (v!11429 (underlying!540 thiss!833)))) #b00000000000000000000000000000000))))

(assert (=> b!888440 d!110275))

(declare-fun d!110277 () Bool)

(declare-fun lt!401781 () Bool)

(declare-fun contains!4287 (ListLongMap!10549 (_ BitVec 64)) Bool)

(assert (=> d!110277 (= lt!401781 (contains!4287 (map!12076 thiss!833) key!673))))

(declare-fun contains!4288 (LongMapFixedSize!3898 (_ BitVec 64)) Bool)

(assert (=> d!110277 (= lt!401781 (contains!4288 (v!11429 (underlying!540 thiss!833)) key!673))))

(assert (=> d!110277 (valid!1528 thiss!833)))

(assert (=> d!110277 (= (contains!4286 thiss!833 key!673) lt!401781)))

(declare-fun bs!24896 () Bool)

(assert (= bs!24896 d!110277))

(assert (=> bs!24896 m!828443))

(assert (=> bs!24896 m!828443))

(declare-fun m!828505 () Bool)

(assert (=> bs!24896 m!828505))

(declare-fun m!828507 () Bool)

(assert (=> bs!24896 m!828507))

(assert (=> bs!24896 m!828455))

(assert (=> b!888443 d!110277))

(declare-fun b!888552 () Bool)

(declare-fun e!494946 () V!28759)

(assert (=> b!888552 (= e!494946 (minValue!4938 (v!11429 (underlying!540 thiss!833))))))

(declare-fun bm!39433 () Bool)

(declare-fun call!39436 () ListLongMap!10549)

(declare-fun call!39437 () ListLongMap!10549)

(assert (=> bm!39433 (= call!39436 call!39437)))

(declare-fun lt!401809 () V!28759)

(declare-fun e!494950 () Bool)

(declare-fun b!888553 () Bool)

(assert (=> b!888553 (= e!494950 (= lt!401809 (dynLambda!1303 (defaultEntry!5140 (v!11429 (underlying!540 thiss!833))) key!673)))))

(declare-fun b!888554 () Bool)

(declare-fun e!494954 () V!28759)

(assert (=> b!888554 (= e!494954 (zeroValue!4938 (v!11429 (underlying!540 thiss!833))))))

(declare-fun b!888555 () Bool)

(declare-fun e!494944 () V!28759)

(assert (=> b!888555 (= e!494944 (dynLambda!1303 (defaultEntry!5140 (v!11429 (underlying!540 thiss!833))) key!673))))

(declare-datatypes ((SeekEntryResult!8715 0))(
  ( (MissingZero!8715 (index!37231 (_ BitVec 32))) (Found!8715 (index!37232 (_ BitVec 32))) (Intermediate!8715 (undefined!9527 Bool) (index!37233 (_ BitVec 32)) (x!75237 (_ BitVec 32))) (Undefined!8715) (MissingVacant!8715 (index!37234 (_ BitVec 32))) )
))
(declare-fun lt!401806 () SeekEntryResult!8715)

(declare-fun b!888556 () Bool)

(declare-fun call!39439 () V!28759)

(declare-fun e!494949 () Bool)

(declare-fun get!13150 (ValueCell!8441 V!28759) V!28759)

(assert (=> b!888556 (= e!494949 (= call!39439 (get!13150 (select (arr!24856 (_values!5125 (v!11429 (underlying!540 thiss!833)))) (index!37232 lt!401806)) (dynLambda!1303 (defaultEntry!5140 (v!11429 (underlying!540 thiss!833))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!888557 () Bool)

(declare-fun e!494948 () Bool)

(declare-fun lt!401807 () SeekEntryResult!8715)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!888557 (= e!494948 (inRange!0 (index!37232 lt!401807) (mask!25583 (v!11429 (underlying!540 thiss!833)))))))

(declare-fun b!888558 () Bool)

(declare-fun e!494953 () Bool)

(assert (=> b!888558 (= e!494953 (= call!39439 (minValue!4938 (v!11429 (underlying!540 thiss!833)))))))

(declare-fun b!888559 () Bool)

(declare-fun res!602525 () Bool)

(assert (=> b!888559 (=> (not res!602525) (not e!494953))))

(assert (=> b!888559 (= res!602525 (not (= (bvand (extraKeys!4834 (v!11429 (underlying!540 thiss!833))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!494952 () Bool)

(assert (=> b!888559 (= e!494952 e!494953)))

(declare-fun d!110279 () Bool)

(assert (=> d!110279 e!494950))

(declare-fun c!94017 () Bool)

(assert (=> d!110279 (= c!94017 (contains!4288 (v!11429 (underlying!540 thiss!833)) key!673))))

(declare-fun e!494951 () V!28759)

(assert (=> d!110279 (= lt!401809 e!494951)))

(declare-fun c!94015 () Bool)

(assert (=> d!110279 (= c!94015 (= key!673 (bvneg key!673)))))

(assert (=> d!110279 (valid!1529 (v!11429 (underlying!540 thiss!833)))))

(assert (=> d!110279 (= (apply!393 (v!11429 (underlying!540 thiss!833)) key!673) lt!401809)))

(declare-fun b!888560 () Bool)

(declare-fun e!494945 () Bool)

(assert (=> b!888560 (= e!494945 e!494952)))

(declare-fun c!94018 () Bool)

(assert (=> b!888560 (= c!94018 (= key!673 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!888561 () Bool)

(assert (=> b!888561 (= e!494951 e!494954)))

(declare-fun c!94013 () Bool)

(assert (=> b!888561 (= c!94013 (and (= key!673 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!4834 (v!11429 (underlying!540 thiss!833))) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!888562 () Bool)

(declare-fun res!602524 () Bool)

(assert (=> b!888562 (=> (not res!602524) (not e!494949))))

(declare-fun arrayContainsKey!0 (array!51693 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!888562 (= res!602524 (arrayContainsKey!0 (_keys!9845 (v!11429 (underlying!540 thiss!833))) key!673 #b00000000000000000000000000000000))))

(assert (=> b!888562 (= e!494952 e!494949)))

(declare-fun bm!39434 () Bool)

(declare-fun call!39438 () V!28759)

(assert (=> bm!39434 (= call!39439 call!39438)))

(declare-fun bm!39435 () Bool)

(declare-fun c!94012 () Bool)

(declare-fun apply!394 (ListLongMap!10549 (_ BitVec 64)) V!28759)

(assert (=> bm!39435 (= call!39438 (apply!394 (ite c!94012 call!39437 call!39436) key!673))))

(declare-fun b!888563 () Bool)

(declare-fun e!494947 () Bool)

(assert (=> b!888563 (= e!494947 (= call!39438 (zeroValue!4938 (v!11429 (underlying!540 thiss!833)))))))

(declare-fun b!888564 () Bool)

(declare-fun c!94014 () Bool)

(assert (=> b!888564 (= c!94014 (and (= key!673 #b1000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!4834 (v!11429 (underlying!540 thiss!833))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!888564 (= e!494954 e!494946)))

(declare-fun b!888565 () Bool)

(assert (=> b!888565 (= e!494951 e!494944)))

(declare-fun seekEntry!0 ((_ BitVec 64) array!51693 (_ BitVec 32)) SeekEntryResult!8715)

(assert (=> b!888565 (= lt!401806 (seekEntry!0 key!673 (_keys!9845 (v!11429 (underlying!540 thiss!833))) (mask!25583 (v!11429 (underlying!540 thiss!833)))))))

(declare-datatypes ((Unit!30233 0))(
  ( (Unit!30234) )
))
(declare-fun lt!401804 () Unit!30233)

(declare-fun lemmaSeekEntryGivesInRangeIndex!2 (array!51693 array!51691 (_ BitVec 32) (_ BitVec 32) V!28759 V!28759 (_ BitVec 64)) Unit!30233)

(assert (=> b!888565 (= lt!401804 (lemmaSeekEntryGivesInRangeIndex!2 (_keys!9845 (v!11429 (underlying!540 thiss!833))) (_values!5125 (v!11429 (underlying!540 thiss!833))) (mask!25583 (v!11429 (underlying!540 thiss!833))) (extraKeys!4834 (v!11429 (underlying!540 thiss!833))) (zeroValue!4938 (v!11429 (underlying!540 thiss!833))) (minValue!4938 (v!11429 (underlying!540 thiss!833))) key!673))))

(assert (=> b!888565 (= lt!401807 (seekEntry!0 key!673 (_keys!9845 (v!11429 (underlying!540 thiss!833))) (mask!25583 (v!11429 (underlying!540 thiss!833)))))))

(declare-fun res!602526 () Bool)

(assert (=> b!888565 (= res!602526 (not ((_ is Found!8715) lt!401807)))))

(assert (=> b!888565 (=> res!602526 e!494948)))

(assert (=> b!888565 e!494948))

(declare-fun lt!401810 () Unit!30233)

(assert (=> b!888565 (= lt!401810 lt!401804)))

(declare-fun c!94016 () Bool)

(assert (=> b!888565 (= c!94016 ((_ is Found!8715) lt!401806))))

(declare-fun b!888566 () Bool)

(declare-fun lt!401811 () Unit!30233)

(declare-fun lt!401812 () Unit!30233)

(assert (=> b!888566 (= lt!401811 lt!401812)))

(assert (=> b!888566 e!494945))

(assert (=> b!888566 (= c!94012 (= key!673 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lemmaKeyInListMapThenSameValueInArray!2 (array!51693 array!51691 (_ BitVec 32) (_ BitVec 32) V!28759 V!28759 (_ BitVec 64) (_ BitVec 32) Int) Unit!30233)

(assert (=> b!888566 (= lt!401812 (lemmaKeyInListMapThenSameValueInArray!2 (_keys!9845 (v!11429 (underlying!540 thiss!833))) (_values!5125 (v!11429 (underlying!540 thiss!833))) (mask!25583 (v!11429 (underlying!540 thiss!833))) (extraKeys!4834 (v!11429 (underlying!540 thiss!833))) (zeroValue!4938 (v!11429 (underlying!540 thiss!833))) (minValue!4938 (v!11429 (underlying!540 thiss!833))) key!673 (index!37232 lt!401806) (defaultEntry!5140 (v!11429 (underlying!540 thiss!833)))))))

(declare-fun lt!401805 () Unit!30233)

(declare-fun lt!401808 () Unit!30233)

(assert (=> b!888566 (= lt!401805 lt!401808)))

(declare-fun getCurrentListMap!2571 (array!51693 array!51691 (_ BitVec 32) (_ BitVec 32) V!28759 V!28759 (_ BitVec 32) Int) ListLongMap!10549)

(assert (=> b!888566 (contains!4287 (getCurrentListMap!2571 (_keys!9845 (v!11429 (underlying!540 thiss!833))) (_values!5125 (v!11429 (underlying!540 thiss!833))) (mask!25583 (v!11429 (underlying!540 thiss!833))) (extraKeys!4834 (v!11429 (underlying!540 thiss!833))) (zeroValue!4938 (v!11429 (underlying!540 thiss!833))) (minValue!4938 (v!11429 (underlying!540 thiss!833))) #b00000000000000000000000000000000 (defaultEntry!5140 (v!11429 (underlying!540 thiss!833)))) (select (arr!24857 (_keys!9845 (v!11429 (underlying!540 thiss!833)))) (index!37232 lt!401806)))))

(declare-fun lemmaValidKeyInArrayIsInListMap!201 (array!51693 array!51691 (_ BitVec 32) (_ BitVec 32) V!28759 V!28759 (_ BitVec 32) Int) Unit!30233)

(assert (=> b!888566 (= lt!401808 (lemmaValidKeyInArrayIsInListMap!201 (_keys!9845 (v!11429 (underlying!540 thiss!833))) (_values!5125 (v!11429 (underlying!540 thiss!833))) (mask!25583 (v!11429 (underlying!540 thiss!833))) (extraKeys!4834 (v!11429 (underlying!540 thiss!833))) (zeroValue!4938 (v!11429 (underlying!540 thiss!833))) (minValue!4938 (v!11429 (underlying!540 thiss!833))) (index!37232 lt!401806) (defaultEntry!5140 (v!11429 (underlying!540 thiss!833)))))))

(declare-fun lt!401813 () Unit!30233)

(declare-fun lt!401814 () Unit!30233)

(assert (=> b!888566 (= lt!401813 lt!401814)))

(assert (=> b!888566 (arrayContainsKey!0 (_keys!9845 (v!11429 (underlying!540 thiss!833))) key!673 #b00000000000000000000000000000000)))

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!51693 (_ BitVec 64) (_ BitVec 32)) Unit!30233)

(assert (=> b!888566 (= lt!401814 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!9845 (v!11429 (underlying!540 thiss!833))) key!673 (index!37232 lt!401806)))))

(assert (=> b!888566 (= e!494944 (get!13150 (select (arr!24856 (_values!5125 (v!11429 (underlying!540 thiss!833)))) (index!37232 lt!401806)) (dynLambda!1303 (defaultEntry!5140 (v!11429 (underlying!540 thiss!833))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!888567 () Bool)

(assert (=> b!888567 (= e!494945 e!494947)))

(declare-fun res!602527 () Bool)

(assert (=> b!888567 (= res!602527 (not (= (bvand (extraKeys!4834 (v!11429 (underlying!540 thiss!833))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!888567 (=> (not res!602527) (not e!494947))))

(declare-fun bm!39436 () Bool)

(assert (=> bm!39436 (= call!39437 (getCurrentListMap!2571 (_keys!9845 (v!11429 (underlying!540 thiss!833))) (_values!5125 (v!11429 (underlying!540 thiss!833))) (mask!25583 (v!11429 (underlying!540 thiss!833))) (extraKeys!4834 (v!11429 (underlying!540 thiss!833))) (zeroValue!4938 (v!11429 (underlying!540 thiss!833))) (minValue!4938 (v!11429 (underlying!540 thiss!833))) #b00000000000000000000000000000000 (defaultEntry!5140 (v!11429 (underlying!540 thiss!833)))))))

(declare-fun b!888568 () Bool)

(assert (=> b!888568 (= e!494946 (dynLambda!1303 (defaultEntry!5140 (v!11429 (underlying!540 thiss!833))) key!673))))

(declare-fun b!888569 () Bool)

(assert (=> b!888569 (= e!494950 (= lt!401809 (get!13149 (getValueByKey!435 (toList!5290 (map!12077 (v!11429 (underlying!540 thiss!833)))) key!673))))))

(assert (= (and d!110279 c!94015) b!888561))

(assert (= (and d!110279 (not c!94015)) b!888565))

(assert (= (and b!888561 c!94013) b!888554))

(assert (= (and b!888561 (not c!94013)) b!888564))

(assert (= (and b!888564 c!94014) b!888552))

(assert (= (and b!888564 (not c!94014)) b!888568))

(assert (= (and b!888565 (not res!602526)) b!888557))

(assert (= (and b!888565 c!94016) b!888566))

(assert (= (and b!888565 (not c!94016)) b!888555))

(assert (= (and b!888566 c!94012) b!888567))

(assert (= (and b!888566 (not c!94012)) b!888560))

(assert (= (and b!888567 res!602527) b!888563))

(assert (= (and b!888560 c!94018) b!888559))

(assert (= (and b!888560 (not c!94018)) b!888562))

(assert (= (and b!888559 res!602525) b!888558))

(assert (= (and b!888562 res!602524) b!888556))

(assert (= (or b!888558 b!888556) bm!39433))

(assert (= (or b!888558 b!888556) bm!39434))

(assert (= (or b!888563 bm!39433) bm!39436))

(assert (= (or b!888563 bm!39434) bm!39435))

(assert (= (and d!110279 c!94017) b!888569))

(assert (= (and d!110279 (not c!94017)) b!888553))

(declare-fun b_lambda!12869 () Bool)

(assert (=> (not b_lambda!12869) (not b!888556)))

(declare-fun t!24923 () Bool)

(declare-fun tb!5137 () Bool)

(assert (=> (and b!888440 (= (defaultEntry!5140 (v!11429 (underlying!540 thiss!833))) (defaultEntry!5140 (v!11429 (underlying!540 thiss!833)))) t!24923) tb!5137))

(declare-fun result!9977 () Bool)

(assert (=> tb!5137 (= result!9977 tp_is_empty!17845)))

(assert (=> b!888556 t!24923))

(declare-fun b_and!25759 () Bool)

(assert (= b_and!25749 (and (=> t!24923 result!9977) b_and!25759)))

(declare-fun b_lambda!12871 () Bool)

(assert (=> (not b_lambda!12871) (not b!888553)))

(assert (=> b!888553 t!24916))

(declare-fun b_and!25761 () Bool)

(assert (= b_and!25759 (and (=> t!24916 result!9965) b_and!25761)))

(declare-fun b_lambda!12873 () Bool)

(assert (=> (not b_lambda!12873) (not b!888568)))

(assert (=> b!888568 t!24916))

(declare-fun b_and!25763 () Bool)

(assert (= b_and!25761 (and (=> t!24916 result!9965) b_and!25763)))

(declare-fun b_lambda!12875 () Bool)

(assert (=> (not b_lambda!12875) (not b!888555)))

(assert (=> b!888555 t!24916))

(declare-fun b_and!25765 () Bool)

(assert (= b_and!25763 (and (=> t!24916 result!9965) b_and!25765)))

(declare-fun b_lambda!12877 () Bool)

(assert (=> (not b_lambda!12877) (not b!888566)))

(assert (=> b!888566 t!24923))

(declare-fun b_and!25767 () Bool)

(assert (= b_and!25765 (and (=> t!24923 result!9977) b_and!25767)))

(assert (=> d!110279 m!828507))

(assert (=> d!110279 m!828503))

(declare-fun m!828509 () Bool)

(assert (=> b!888557 m!828509))

(declare-fun m!828511 () Bool)

(assert (=> bm!39435 m!828511))

(assert (=> b!888569 m!828501))

(declare-fun m!828513 () Bool)

(assert (=> b!888569 m!828513))

(assert (=> b!888569 m!828513))

(declare-fun m!828515 () Bool)

(assert (=> b!888569 m!828515))

(assert (=> b!888553 m!828457))

(declare-fun m!828517 () Bool)

(assert (=> b!888565 m!828517))

(declare-fun m!828519 () Bool)

(assert (=> b!888565 m!828519))

(assert (=> b!888555 m!828457))

(declare-fun m!828521 () Bool)

(assert (=> b!888556 m!828521))

(declare-fun m!828523 () Bool)

(assert (=> b!888556 m!828523))

(assert (=> b!888556 m!828521))

(assert (=> b!888556 m!828523))

(declare-fun m!828525 () Bool)

(assert (=> b!888556 m!828525))

(assert (=> b!888568 m!828457))

(declare-fun m!828527 () Bool)

(assert (=> bm!39436 m!828527))

(declare-fun m!828529 () Bool)

(assert (=> b!888562 m!828529))

(declare-fun m!828531 () Bool)

(assert (=> b!888566 m!828531))

(assert (=> b!888566 m!828529))

(assert (=> b!888566 m!828527))

(declare-fun m!828533 () Bool)

(assert (=> b!888566 m!828533))

(declare-fun m!828535 () Bool)

(assert (=> b!888566 m!828535))

(assert (=> b!888566 m!828521))

(assert (=> b!888566 m!828523))

(assert (=> b!888566 m!828525))

(declare-fun m!828537 () Bool)

(assert (=> b!888566 m!828537))

(assert (=> b!888566 m!828533))

(assert (=> b!888566 m!828523))

(assert (=> b!888566 m!828521))

(assert (=> b!888566 m!828527))

(declare-fun m!828539 () Bool)

(assert (=> b!888566 m!828539))

(assert (=> b!888443 d!110279))

(declare-fun condMapEmpty!28300 () Bool)

(declare-fun mapDefault!28300 () ValueCell!8441)

(assert (=> mapNonEmpty!28291 (= condMapEmpty!28300 (= mapRest!28291 ((as const (Array (_ BitVec 32) ValueCell!8441)) mapDefault!28300)))))

(declare-fun e!494960 () Bool)

(declare-fun mapRes!28300 () Bool)

(assert (=> mapNonEmpty!28291 (= tp!54489 (and e!494960 mapRes!28300))))

(declare-fun mapIsEmpty!28300 () Bool)

(assert (=> mapIsEmpty!28300 mapRes!28300))

(declare-fun b!888576 () Bool)

(declare-fun e!494959 () Bool)

(assert (=> b!888576 (= e!494959 tp_is_empty!17845)))

(declare-fun mapNonEmpty!28300 () Bool)

(declare-fun tp!54505 () Bool)

(assert (=> mapNonEmpty!28300 (= mapRes!28300 (and tp!54505 e!494959))))

(declare-fun mapRest!28300 () (Array (_ BitVec 32) ValueCell!8441))

(declare-fun mapValue!28300 () ValueCell!8441)

(declare-fun mapKey!28300 () (_ BitVec 32))

(assert (=> mapNonEmpty!28300 (= mapRest!28291 (store mapRest!28300 mapKey!28300 mapValue!28300))))

(declare-fun b!888577 () Bool)

(assert (=> b!888577 (= e!494960 tp_is_empty!17845)))

(assert (= (and mapNonEmpty!28291 condMapEmpty!28300) mapIsEmpty!28300))

(assert (= (and mapNonEmpty!28291 (not condMapEmpty!28300)) mapNonEmpty!28300))

(assert (= (and mapNonEmpty!28300 ((_ is ValueCellFull!8441) mapValue!28300)) b!888576))

(assert (= (and mapNonEmpty!28291 ((_ is ValueCellFull!8441) mapDefault!28300)) b!888577))

(declare-fun m!828541 () Bool)

(assert (=> mapNonEmpty!28300 m!828541))

(declare-fun b_lambda!12879 () Bool)

(assert (= b_lambda!12869 (or (and b!888440 b_free!15517) b_lambda!12879)))

(declare-fun b_lambda!12881 () Bool)

(assert (= b_lambda!12871 (or (and b!888440 b_free!15517) b_lambda!12881)))

(declare-fun b_lambda!12883 () Bool)

(assert (= b_lambda!12873 (or (and b!888440 b_free!15517) b_lambda!12883)))

(declare-fun b_lambda!12885 () Bool)

(assert (= b_lambda!12875 (or (and b!888440 b_free!15517) b_lambda!12885)))

(declare-fun b_lambda!12887 () Bool)

(assert (= b_lambda!12877 (or (and b!888440 b_free!15517) b_lambda!12887)))

(check-sat (not b!888514) (not b_next!15517) (not b_lambda!12881) (not d!110271) (not bm!39436) (not b_lambda!12887) (not b!888566) (not b_lambda!12885) (not b_lambda!12879) (not b!888565) tp_is_empty!17845 (not b_lambda!12883) (not d!110279) b_and!25767 (not b!888557) (not b!888562) (not b!888569) (not d!110277) (not b!888556) (not bm!39435) (not b_lambda!12867) (not d!110269) (not mapNonEmpty!28300))
(check-sat b_and!25767 (not b_next!15517))
