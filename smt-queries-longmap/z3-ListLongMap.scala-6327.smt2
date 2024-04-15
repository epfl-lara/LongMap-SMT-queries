; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!81460 () Bool)

(assert start!81460)

(declare-fun b!951968 () Bool)

(declare-fun b_free!18283 () Bool)

(declare-fun b_next!18283 () Bool)

(assert (=> b!951968 (= b_free!18283 (not b_next!18283))))

(declare-fun tp!63468 () Bool)

(declare-fun b_and!29735 () Bool)

(assert (=> b!951968 (= tp!63468 b_and!29735)))

(declare-fun b!951963 () Bool)

(declare-fun res!637849 () Bool)

(declare-fun e!536094 () Bool)

(assert (=> b!951963 (=> (not res!637849) (not e!536094))))

(declare-fun key!756 () (_ BitVec 64))

(declare-datatypes ((V!32687 0))(
  ( (V!32688 (val!10446 Int)) )
))
(declare-datatypes ((ValueCell!9914 0))(
  ( (ValueCellFull!9914 (v!12995 V!32687)) (EmptyCell!9914) )
))
(declare-datatypes ((array!57579 0))(
  ( (array!57580 (arr!27683 (Array (_ BitVec 32) ValueCell!9914)) (size!28164 (_ BitVec 32))) )
))
(declare-datatypes ((array!57581 0))(
  ( (array!57582 (arr!27684 (Array (_ BitVec 32) (_ BitVec 64))) (size!28165 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4978 0))(
  ( (LongMapFixedSize!4979 (defaultEntry!5818 Int) (mask!27653 (_ BitVec 32)) (extraKeys!5550 (_ BitVec 32)) (zeroValue!5654 V!32687) (minValue!5654 V!32687) (_size!2544 (_ BitVec 32)) (_keys!10765 array!57581) (_values!5841 array!57579) (_vacant!2544 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4978)

(get-info :version)

(declare-datatypes ((SeekEntryResult!9152 0))(
  ( (MissingZero!9152 (index!38979 (_ BitVec 32))) (Found!9152 (index!38980 (_ BitVec 32))) (Intermediate!9152 (undefined!9964 Bool) (index!38981 (_ BitVec 32)) (x!81907 (_ BitVec 32))) (Undefined!9152) (MissingVacant!9152 (index!38982 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!57581 (_ BitVec 32)) SeekEntryResult!9152)

(assert (=> b!951963 (= res!637849 (not ((_ is Found!9152) (seekEntry!0 key!756 (_keys!10765 thiss!1141) (mask!27653 thiss!1141)))))))

(declare-fun res!637847 () Bool)

(assert (=> start!81460 (=> (not res!637847) (not e!536094))))

(declare-fun valid!1898 (LongMapFixedSize!4978) Bool)

(assert (=> start!81460 (= res!637847 (valid!1898 thiss!1141))))

(assert (=> start!81460 e!536094))

(declare-fun e!536098 () Bool)

(assert (=> start!81460 e!536098))

(assert (=> start!81460 true))

(declare-fun b!951964 () Bool)

(declare-fun res!637848 () Bool)

(assert (=> b!951964 (=> (not res!637848) (not e!536094))))

(declare-datatypes ((tuple2!13622 0))(
  ( (tuple2!13623 (_1!6822 (_ BitVec 64)) (_2!6822 V!32687)) )
))
(declare-datatypes ((List!19363 0))(
  ( (Nil!19360) (Cons!19359 (h!20521 tuple2!13622) (t!27707 List!19363)) )
))
(declare-datatypes ((ListLongMap!12309 0))(
  ( (ListLongMap!12310 (toList!6170 List!19363)) )
))
(declare-fun contains!5208 (ListLongMap!12309 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3332 (array!57581 array!57579 (_ BitVec 32) (_ BitVec 32) V!32687 V!32687 (_ BitVec 32) Int) ListLongMap!12309)

(assert (=> b!951964 (= res!637848 (contains!5208 (getCurrentListMap!3332 (_keys!10765 thiss!1141) (_values!5841 thiss!1141) (mask!27653 thiss!1141) (extraKeys!5550 thiss!1141) (zeroValue!5654 thiss!1141) (minValue!5654 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5818 thiss!1141)) key!756))))

(declare-fun b!951965 () Bool)

(declare-fun e!536096 () Bool)

(declare-fun tp_is_empty!20791 () Bool)

(assert (=> b!951965 (= e!536096 tp_is_empty!20791)))

(declare-fun b!951966 () Bool)

(declare-fun e!536097 () Bool)

(assert (=> b!951966 (= e!536097 tp_is_empty!20791)))

(declare-fun b!951967 () Bool)

(declare-fun e!536095 () Bool)

(assert (=> b!951967 (= e!536094 (not e!536095))))

(declare-fun res!637846 () Bool)

(assert (=> b!951967 (=> res!637846 e!536095)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!951967 (= res!637846 (not (validMask!0 (mask!27653 thiss!1141))))))

(declare-fun lt!428791 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57581 (_ BitVec 32)) Bool)

(assert (=> b!951967 (arrayForallSeekEntryOrOpenFound!0 lt!428791 (_keys!10765 thiss!1141) (mask!27653 thiss!1141))))

(declare-datatypes ((Unit!31911 0))(
  ( (Unit!31912) )
))
(declare-fun lt!428789 () Unit!31911)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!57581 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!31911)

(assert (=> b!951967 (= lt!428789 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (_keys!10765 thiss!1141) (mask!27653 thiss!1141) #b00000000000000000000000000000000 lt!428791))))

(declare-fun arrayScanForKey!0 (array!57581 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!951967 (= lt!428791 (arrayScanForKey!0 (_keys!10765 thiss!1141) key!756 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!57581 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!951967 (arrayContainsKey!0 (_keys!10765 thiss!1141) key!756 #b00000000000000000000000000000000)))

(declare-fun lt!428790 () Unit!31911)

(declare-fun lemmaKeyInListMapIsInArray!315 (array!57581 array!57579 (_ BitVec 32) (_ BitVec 32) V!32687 V!32687 (_ BitVec 64) Int) Unit!31911)

(assert (=> b!951967 (= lt!428790 (lemmaKeyInListMapIsInArray!315 (_keys!10765 thiss!1141) (_values!5841 thiss!1141) (mask!27653 thiss!1141) (extraKeys!5550 thiss!1141) (zeroValue!5654 thiss!1141) (minValue!5654 thiss!1141) key!756 (defaultEntry!5818 thiss!1141)))))

(declare-fun mapNonEmpty!33121 () Bool)

(declare-fun mapRes!33121 () Bool)

(declare-fun tp!63469 () Bool)

(assert (=> mapNonEmpty!33121 (= mapRes!33121 (and tp!63469 e!536096))))

(declare-fun mapValue!33121 () ValueCell!9914)

(declare-fun mapRest!33121 () (Array (_ BitVec 32) ValueCell!9914))

(declare-fun mapKey!33121 () (_ BitVec 32))

(assert (=> mapNonEmpty!33121 (= (arr!27683 (_values!5841 thiss!1141)) (store mapRest!33121 mapKey!33121 mapValue!33121))))

(declare-fun mapIsEmpty!33121 () Bool)

(assert (=> mapIsEmpty!33121 mapRes!33121))

(declare-fun e!536093 () Bool)

(declare-fun array_inv!21544 (array!57581) Bool)

(declare-fun array_inv!21545 (array!57579) Bool)

(assert (=> b!951968 (= e!536098 (and tp!63468 tp_is_empty!20791 (array_inv!21544 (_keys!10765 thiss!1141)) (array_inv!21545 (_values!5841 thiss!1141)) e!536093))))

(declare-fun b!951969 () Bool)

(assert (=> b!951969 (= e!536095 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10765 thiss!1141) (mask!27653 thiss!1141)))))

(declare-fun b!951970 () Bool)

(declare-fun res!637845 () Bool)

(assert (=> b!951970 (=> (not res!637845) (not e!536094))))

(assert (=> b!951970 (= res!637845 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!951971 () Bool)

(declare-fun res!637844 () Bool)

(assert (=> b!951971 (=> res!637844 e!536095)))

(assert (=> b!951971 (= res!637844 (not (= (size!28165 (_keys!10765 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27653 thiss!1141)))))))

(declare-fun b!951972 () Bool)

(assert (=> b!951972 (= e!536093 (and e!536097 mapRes!33121))))

(declare-fun condMapEmpty!33121 () Bool)

(declare-fun mapDefault!33121 () ValueCell!9914)

(assert (=> b!951972 (= condMapEmpty!33121 (= (arr!27683 (_values!5841 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9914)) mapDefault!33121)))))

(assert (= (and start!81460 res!637847) b!951970))

(assert (= (and b!951970 res!637845) b!951963))

(assert (= (and b!951963 res!637849) b!951964))

(assert (= (and b!951964 res!637848) b!951967))

(assert (= (and b!951967 (not res!637846)) b!951971))

(assert (= (and b!951971 (not res!637844)) b!951969))

(assert (= (and b!951972 condMapEmpty!33121) mapIsEmpty!33121))

(assert (= (and b!951972 (not condMapEmpty!33121)) mapNonEmpty!33121))

(assert (= (and mapNonEmpty!33121 ((_ is ValueCellFull!9914) mapValue!33121)) b!951965))

(assert (= (and b!951972 ((_ is ValueCellFull!9914) mapDefault!33121)) b!951966))

(assert (= b!951968 b!951972))

(assert (= start!81460 b!951968))

(declare-fun m!883639 () Bool)

(assert (=> b!951963 m!883639))

(declare-fun m!883641 () Bool)

(assert (=> b!951964 m!883641))

(assert (=> b!951964 m!883641))

(declare-fun m!883643 () Bool)

(assert (=> b!951964 m!883643))

(declare-fun m!883645 () Bool)

(assert (=> mapNonEmpty!33121 m!883645))

(declare-fun m!883647 () Bool)

(assert (=> b!951969 m!883647))

(declare-fun m!883649 () Bool)

(assert (=> b!951968 m!883649))

(declare-fun m!883651 () Bool)

(assert (=> b!951968 m!883651))

(declare-fun m!883653 () Bool)

(assert (=> b!951967 m!883653))

(declare-fun m!883655 () Bool)

(assert (=> b!951967 m!883655))

(declare-fun m!883657 () Bool)

(assert (=> b!951967 m!883657))

(declare-fun m!883659 () Bool)

(assert (=> b!951967 m!883659))

(declare-fun m!883661 () Bool)

(assert (=> b!951967 m!883661))

(declare-fun m!883663 () Bool)

(assert (=> b!951967 m!883663))

(declare-fun m!883665 () Bool)

(assert (=> start!81460 m!883665))

(check-sat (not start!81460) (not b!951969) (not b!951964) b_and!29735 tp_is_empty!20791 (not mapNonEmpty!33121) (not b!951963) (not b_next!18283) (not b!951967) (not b!951968))
(check-sat b_and!29735 (not b_next!18283))
(get-model)

(declare-fun b!952045 () Bool)

(declare-fun c!99548 () Bool)

(declare-fun lt!428820 () (_ BitVec 64))

(assert (=> b!952045 (= c!99548 (= lt!428820 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!536148 () SeekEntryResult!9152)

(declare-fun e!536150 () SeekEntryResult!9152)

(assert (=> b!952045 (= e!536148 e!536150)))

(declare-fun b!952046 () Bool)

(declare-fun e!536149 () SeekEntryResult!9152)

(assert (=> b!952046 (= e!536149 e!536148)))

(declare-fun lt!428819 () SeekEntryResult!9152)

(assert (=> b!952046 (= lt!428820 (select (arr!27684 (_keys!10765 thiss!1141)) (index!38981 lt!428819)))))

(declare-fun c!99547 () Bool)

(assert (=> b!952046 (= c!99547 (= lt!428820 key!756))))

(declare-fun b!952047 () Bool)

(assert (=> b!952047 (= e!536148 (Found!9152 (index!38981 lt!428819)))))

(declare-fun b!952049 () Bool)

(declare-fun lt!428821 () SeekEntryResult!9152)

(assert (=> b!952049 (= e!536150 (ite ((_ is MissingVacant!9152) lt!428821) (MissingZero!9152 (index!38982 lt!428821)) lt!428821))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!57581 (_ BitVec 32)) SeekEntryResult!9152)

(assert (=> b!952049 (= lt!428821 (seekKeyOrZeroReturnVacant!0 (x!81907 lt!428819) (index!38981 lt!428819) (index!38981 lt!428819) key!756 (_keys!10765 thiss!1141) (mask!27653 thiss!1141)))))

(declare-fun b!952050 () Bool)

(assert (=> b!952050 (= e!536150 (MissingZero!9152 (index!38981 lt!428819)))))

(declare-fun d!115305 () Bool)

(declare-fun lt!428818 () SeekEntryResult!9152)

(assert (=> d!115305 (and (or ((_ is MissingVacant!9152) lt!428818) (not ((_ is Found!9152) lt!428818)) (and (bvsge (index!38980 lt!428818) #b00000000000000000000000000000000) (bvslt (index!38980 lt!428818) (size!28165 (_keys!10765 thiss!1141))))) (not ((_ is MissingVacant!9152) lt!428818)) (or (not ((_ is Found!9152) lt!428818)) (= (select (arr!27684 (_keys!10765 thiss!1141)) (index!38980 lt!428818)) key!756)))))

(assert (=> d!115305 (= lt!428818 e!536149)))

(declare-fun c!99546 () Bool)

(assert (=> d!115305 (= c!99546 (and ((_ is Intermediate!9152) lt!428819) (undefined!9964 lt!428819)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!57581 (_ BitVec 32)) SeekEntryResult!9152)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!115305 (= lt!428819 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!756 (mask!27653 thiss!1141)) key!756 (_keys!10765 thiss!1141) (mask!27653 thiss!1141)))))

(assert (=> d!115305 (validMask!0 (mask!27653 thiss!1141))))

(assert (=> d!115305 (= (seekEntry!0 key!756 (_keys!10765 thiss!1141) (mask!27653 thiss!1141)) lt!428818)))

(declare-fun b!952048 () Bool)

(assert (=> b!952048 (= e!536149 Undefined!9152)))

(assert (= (and d!115305 c!99546) b!952048))

(assert (= (and d!115305 (not c!99546)) b!952046))

(assert (= (and b!952046 c!99547) b!952047))

(assert (= (and b!952046 (not c!99547)) b!952045))

(assert (= (and b!952045 c!99548) b!952050))

(assert (= (and b!952045 (not c!99548)) b!952049))

(declare-fun m!883723 () Bool)

(assert (=> b!952046 m!883723))

(declare-fun m!883725 () Bool)

(assert (=> b!952049 m!883725))

(declare-fun m!883727 () Bool)

(assert (=> d!115305 m!883727))

(declare-fun m!883729 () Bool)

(assert (=> d!115305 m!883729))

(assert (=> d!115305 m!883729))

(declare-fun m!883731 () Bool)

(assert (=> d!115305 m!883731))

(assert (=> d!115305 m!883659))

(assert (=> b!951963 d!115305))

(declare-fun d!115307 () Bool)

(declare-fun e!536156 () Bool)

(assert (=> d!115307 e!536156))

(declare-fun res!637888 () Bool)

(assert (=> d!115307 (=> res!637888 e!536156)))

(declare-fun lt!428832 () Bool)

(assert (=> d!115307 (= res!637888 (not lt!428832))))

(declare-fun lt!428831 () Bool)

(assert (=> d!115307 (= lt!428832 lt!428831)))

(declare-fun lt!428833 () Unit!31911)

(declare-fun e!536155 () Unit!31911)

(assert (=> d!115307 (= lt!428833 e!536155)))

(declare-fun c!99551 () Bool)

(assert (=> d!115307 (= c!99551 lt!428831)))

(declare-fun containsKey!471 (List!19363 (_ BitVec 64)) Bool)

(assert (=> d!115307 (= lt!428831 (containsKey!471 (toList!6170 (getCurrentListMap!3332 (_keys!10765 thiss!1141) (_values!5841 thiss!1141) (mask!27653 thiss!1141) (extraKeys!5550 thiss!1141) (zeroValue!5654 thiss!1141) (minValue!5654 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5818 thiss!1141))) key!756))))

(assert (=> d!115307 (= (contains!5208 (getCurrentListMap!3332 (_keys!10765 thiss!1141) (_values!5841 thiss!1141) (mask!27653 thiss!1141) (extraKeys!5550 thiss!1141) (zeroValue!5654 thiss!1141) (minValue!5654 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5818 thiss!1141)) key!756) lt!428832)))

(declare-fun b!952057 () Bool)

(declare-fun lt!428830 () Unit!31911)

(assert (=> b!952057 (= e!536155 lt!428830)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!366 (List!19363 (_ BitVec 64)) Unit!31911)

(assert (=> b!952057 (= lt!428830 (lemmaContainsKeyImpliesGetValueByKeyDefined!366 (toList!6170 (getCurrentListMap!3332 (_keys!10765 thiss!1141) (_values!5841 thiss!1141) (mask!27653 thiss!1141) (extraKeys!5550 thiss!1141) (zeroValue!5654 thiss!1141) (minValue!5654 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5818 thiss!1141))) key!756))))

(declare-datatypes ((Option!513 0))(
  ( (Some!512 (v!12998 V!32687)) (None!511) )
))
(declare-fun isDefined!379 (Option!513) Bool)

(declare-fun getValueByKey!507 (List!19363 (_ BitVec 64)) Option!513)

(assert (=> b!952057 (isDefined!379 (getValueByKey!507 (toList!6170 (getCurrentListMap!3332 (_keys!10765 thiss!1141) (_values!5841 thiss!1141) (mask!27653 thiss!1141) (extraKeys!5550 thiss!1141) (zeroValue!5654 thiss!1141) (minValue!5654 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5818 thiss!1141))) key!756))))

(declare-fun b!952058 () Bool)

(declare-fun Unit!31913 () Unit!31911)

(assert (=> b!952058 (= e!536155 Unit!31913)))

(declare-fun b!952059 () Bool)

(assert (=> b!952059 (= e!536156 (isDefined!379 (getValueByKey!507 (toList!6170 (getCurrentListMap!3332 (_keys!10765 thiss!1141) (_values!5841 thiss!1141) (mask!27653 thiss!1141) (extraKeys!5550 thiss!1141) (zeroValue!5654 thiss!1141) (minValue!5654 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5818 thiss!1141))) key!756)))))

(assert (= (and d!115307 c!99551) b!952057))

(assert (= (and d!115307 (not c!99551)) b!952058))

(assert (= (and d!115307 (not res!637888)) b!952059))

(declare-fun m!883733 () Bool)

(assert (=> d!115307 m!883733))

(declare-fun m!883735 () Bool)

(assert (=> b!952057 m!883735))

(declare-fun m!883737 () Bool)

(assert (=> b!952057 m!883737))

(assert (=> b!952057 m!883737))

(declare-fun m!883739 () Bool)

(assert (=> b!952057 m!883739))

(assert (=> b!952059 m!883737))

(assert (=> b!952059 m!883737))

(assert (=> b!952059 m!883739))

(assert (=> b!951964 d!115307))

(declare-fun bm!41535 () Bool)

(declare-fun call!41544 () Bool)

(declare-fun lt!428885 () ListLongMap!12309)

(assert (=> bm!41535 (= call!41544 (contains!5208 lt!428885 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!41536 () Bool)

(declare-fun call!41542 () ListLongMap!12309)

(declare-fun call!41541 () ListLongMap!12309)

(assert (=> bm!41536 (= call!41542 call!41541)))

(declare-fun b!952102 () Bool)

(declare-fun e!536187 () Unit!31911)

(declare-fun Unit!31914 () Unit!31911)

(assert (=> b!952102 (= e!536187 Unit!31914)))

(declare-fun c!99568 () Bool)

(declare-fun call!41543 () ListLongMap!12309)

(declare-fun bm!41537 () Bool)

(declare-fun call!41540 () ListLongMap!12309)

(declare-fun c!99569 () Bool)

(declare-fun +!2888 (ListLongMap!12309 tuple2!13622) ListLongMap!12309)

(assert (=> bm!41537 (= call!41543 (+!2888 (ite c!99569 call!41541 (ite c!99568 call!41542 call!41540)) (ite (or c!99569 c!99568) (tuple2!13623 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5654 thiss!1141)) (tuple2!13623 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5654 thiss!1141)))))))

(declare-fun b!952103 () Bool)

(declare-fun e!536183 () Bool)

(declare-fun e!536193 () Bool)

(assert (=> b!952103 (= e!536183 e!536193)))

(declare-fun res!637910 () Bool)

(assert (=> b!952103 (= res!637910 call!41544)))

(assert (=> b!952103 (=> (not res!637910) (not e!536193))))

(declare-fun b!952104 () Bool)

(declare-fun e!536186 () ListLongMap!12309)

(assert (=> b!952104 (= e!536186 call!41540)))

(declare-fun b!952105 () Bool)

(declare-fun e!536195 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!952105 (= e!536195 (validKeyInArray!0 (select (arr!27684 (_keys!10765 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!952106 () Bool)

(declare-fun res!637907 () Bool)

(declare-fun e!536190 () Bool)

(assert (=> b!952106 (=> (not res!637907) (not e!536190))))

(declare-fun e!536189 () Bool)

(assert (=> b!952106 (= res!637907 e!536189)))

(declare-fun res!637914 () Bool)

(assert (=> b!952106 (=> res!637914 e!536189)))

(declare-fun e!536192 () Bool)

(assert (=> b!952106 (= res!637914 (not e!536192))))

(declare-fun res!637915 () Bool)

(assert (=> b!952106 (=> (not res!637915) (not e!536192))))

(assert (=> b!952106 (= res!637915 (bvslt #b00000000000000000000000000000000 (size!28165 (_keys!10765 thiss!1141))))))

(declare-fun bm!41538 () Bool)

(assert (=> bm!41538 (= call!41540 call!41542)))

(declare-fun b!952107 () Bool)

(declare-fun e!536185 () Bool)

(declare-fun apply!878 (ListLongMap!12309 (_ BitVec 64)) V!32687)

(declare-fun get!14553 (ValueCell!9914 V!32687) V!32687)

(declare-fun dynLambda!1644 (Int (_ BitVec 64)) V!32687)

(assert (=> b!952107 (= e!536185 (= (apply!878 lt!428885 (select (arr!27684 (_keys!10765 thiss!1141)) #b00000000000000000000000000000000)) (get!14553 (select (arr!27683 (_values!5841 thiss!1141)) #b00000000000000000000000000000000) (dynLambda!1644 (defaultEntry!5818 thiss!1141) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!952107 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28164 (_values!5841 thiss!1141))))))

(assert (=> b!952107 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28165 (_keys!10765 thiss!1141))))))

(declare-fun b!952108 () Bool)

(declare-fun e!536191 () ListLongMap!12309)

(declare-fun call!41539 () ListLongMap!12309)

(assert (=> b!952108 (= e!536191 call!41539)))

(declare-fun b!952109 () Bool)

(declare-fun e!536194 () Bool)

(assert (=> b!952109 (= e!536190 e!536194)))

(declare-fun c!99567 () Bool)

(assert (=> b!952109 (= c!99567 (not (= (bvand (extraKeys!5550 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!952110 () Bool)

(declare-fun e!536184 () Bool)

(assert (=> b!952110 (= e!536184 (= (apply!878 lt!428885 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!5654 thiss!1141)))))

(declare-fun b!952111 () Bool)

(declare-fun call!41538 () Bool)

(assert (=> b!952111 (= e!536194 (not call!41538))))

(declare-fun bm!41539 () Bool)

(assert (=> bm!41539 (= call!41539 call!41543)))

(declare-fun b!952112 () Bool)

(declare-fun e!536188 () ListLongMap!12309)

(assert (=> b!952112 (= e!536188 e!536191)))

(assert (=> b!952112 (= c!99568 (and (not (= (bvand (extraKeys!5550 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5550 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!41540 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!3360 (array!57581 array!57579 (_ BitVec 32) (_ BitVec 32) V!32687 V!32687 (_ BitVec 32) Int) ListLongMap!12309)

(assert (=> bm!41540 (= call!41541 (getCurrentListMapNoExtraKeys!3360 (_keys!10765 thiss!1141) (_values!5841 thiss!1141) (mask!27653 thiss!1141) (extraKeys!5550 thiss!1141) (zeroValue!5654 thiss!1141) (minValue!5654 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5818 thiss!1141)))))

(declare-fun b!952113 () Bool)

(assert (=> b!952113 (= e!536186 call!41539)))

(declare-fun b!952114 () Bool)

(declare-fun lt!428881 () Unit!31911)

(assert (=> b!952114 (= e!536187 lt!428881)))

(declare-fun lt!428888 () ListLongMap!12309)

(assert (=> b!952114 (= lt!428888 (getCurrentListMapNoExtraKeys!3360 (_keys!10765 thiss!1141) (_values!5841 thiss!1141) (mask!27653 thiss!1141) (extraKeys!5550 thiss!1141) (zeroValue!5654 thiss!1141) (minValue!5654 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5818 thiss!1141)))))

(declare-fun lt!428891 () (_ BitVec 64))

(assert (=> b!952114 (= lt!428891 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!428899 () (_ BitVec 64))

(assert (=> b!952114 (= lt!428899 (select (arr!27684 (_keys!10765 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!428895 () Unit!31911)

(declare-fun addStillContains!577 (ListLongMap!12309 (_ BitVec 64) V!32687 (_ BitVec 64)) Unit!31911)

(assert (=> b!952114 (= lt!428895 (addStillContains!577 lt!428888 lt!428891 (zeroValue!5654 thiss!1141) lt!428899))))

(assert (=> b!952114 (contains!5208 (+!2888 lt!428888 (tuple2!13623 lt!428891 (zeroValue!5654 thiss!1141))) lt!428899)))

(declare-fun lt!428884 () Unit!31911)

(assert (=> b!952114 (= lt!428884 lt!428895)))

(declare-fun lt!428894 () ListLongMap!12309)

(assert (=> b!952114 (= lt!428894 (getCurrentListMapNoExtraKeys!3360 (_keys!10765 thiss!1141) (_values!5841 thiss!1141) (mask!27653 thiss!1141) (extraKeys!5550 thiss!1141) (zeroValue!5654 thiss!1141) (minValue!5654 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5818 thiss!1141)))))

(declare-fun lt!428897 () (_ BitVec 64))

(assert (=> b!952114 (= lt!428897 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!428882 () (_ BitVec 64))

(assert (=> b!952114 (= lt!428882 (select (arr!27684 (_keys!10765 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!428896 () Unit!31911)

(declare-fun addApplyDifferent!457 (ListLongMap!12309 (_ BitVec 64) V!32687 (_ BitVec 64)) Unit!31911)

(assert (=> b!952114 (= lt!428896 (addApplyDifferent!457 lt!428894 lt!428897 (minValue!5654 thiss!1141) lt!428882))))

(assert (=> b!952114 (= (apply!878 (+!2888 lt!428894 (tuple2!13623 lt!428897 (minValue!5654 thiss!1141))) lt!428882) (apply!878 lt!428894 lt!428882))))

(declare-fun lt!428879 () Unit!31911)

(assert (=> b!952114 (= lt!428879 lt!428896)))

(declare-fun lt!428898 () ListLongMap!12309)

(assert (=> b!952114 (= lt!428898 (getCurrentListMapNoExtraKeys!3360 (_keys!10765 thiss!1141) (_values!5841 thiss!1141) (mask!27653 thiss!1141) (extraKeys!5550 thiss!1141) (zeroValue!5654 thiss!1141) (minValue!5654 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5818 thiss!1141)))))

(declare-fun lt!428890 () (_ BitVec 64))

(assert (=> b!952114 (= lt!428890 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!428887 () (_ BitVec 64))

(assert (=> b!952114 (= lt!428887 (select (arr!27684 (_keys!10765 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!428880 () Unit!31911)

(assert (=> b!952114 (= lt!428880 (addApplyDifferent!457 lt!428898 lt!428890 (zeroValue!5654 thiss!1141) lt!428887))))

(assert (=> b!952114 (= (apply!878 (+!2888 lt!428898 (tuple2!13623 lt!428890 (zeroValue!5654 thiss!1141))) lt!428887) (apply!878 lt!428898 lt!428887))))

(declare-fun lt!428886 () Unit!31911)

(assert (=> b!952114 (= lt!428886 lt!428880)))

(declare-fun lt!428889 () ListLongMap!12309)

(assert (=> b!952114 (= lt!428889 (getCurrentListMapNoExtraKeys!3360 (_keys!10765 thiss!1141) (_values!5841 thiss!1141) (mask!27653 thiss!1141) (extraKeys!5550 thiss!1141) (zeroValue!5654 thiss!1141) (minValue!5654 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5818 thiss!1141)))))

(declare-fun lt!428892 () (_ BitVec 64))

(assert (=> b!952114 (= lt!428892 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!428878 () (_ BitVec 64))

(assert (=> b!952114 (= lt!428878 (select (arr!27684 (_keys!10765 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!952114 (= lt!428881 (addApplyDifferent!457 lt!428889 lt!428892 (minValue!5654 thiss!1141) lt!428878))))

(assert (=> b!952114 (= (apply!878 (+!2888 lt!428889 (tuple2!13623 lt!428892 (minValue!5654 thiss!1141))) lt!428878) (apply!878 lt!428889 lt!428878))))

(declare-fun b!952115 () Bool)

(assert (=> b!952115 (= e!536183 (not call!41544))))

(declare-fun b!952116 () Bool)

(declare-fun c!99564 () Bool)

(assert (=> b!952116 (= c!99564 (and (not (= (bvand (extraKeys!5550 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5550 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!952116 (= e!536191 e!536186)))

(declare-fun b!952117 () Bool)

(assert (=> b!952117 (= e!536192 (validKeyInArray!0 (select (arr!27684 (_keys!10765 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun d!115309 () Bool)

(assert (=> d!115309 e!536190))

(declare-fun res!637913 () Bool)

(assert (=> d!115309 (=> (not res!637913) (not e!536190))))

(assert (=> d!115309 (= res!637913 (or (bvsge #b00000000000000000000000000000000 (size!28165 (_keys!10765 thiss!1141))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28165 (_keys!10765 thiss!1141))))))))

(declare-fun lt!428893 () ListLongMap!12309)

(assert (=> d!115309 (= lt!428885 lt!428893)))

(declare-fun lt!428883 () Unit!31911)

(assert (=> d!115309 (= lt!428883 e!536187)))

(declare-fun c!99566 () Bool)

(assert (=> d!115309 (= c!99566 e!536195)))

(declare-fun res!637912 () Bool)

(assert (=> d!115309 (=> (not res!637912) (not e!536195))))

(assert (=> d!115309 (= res!637912 (bvslt #b00000000000000000000000000000000 (size!28165 (_keys!10765 thiss!1141))))))

(assert (=> d!115309 (= lt!428893 e!536188)))

(assert (=> d!115309 (= c!99569 (and (not (= (bvand (extraKeys!5550 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5550 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!115309 (validMask!0 (mask!27653 thiss!1141))))

(assert (=> d!115309 (= (getCurrentListMap!3332 (_keys!10765 thiss!1141) (_values!5841 thiss!1141) (mask!27653 thiss!1141) (extraKeys!5550 thiss!1141) (zeroValue!5654 thiss!1141) (minValue!5654 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5818 thiss!1141)) lt!428885)))

(declare-fun b!952118 () Bool)

(assert (=> b!952118 (= e!536189 e!536185)))

(declare-fun res!637911 () Bool)

(assert (=> b!952118 (=> (not res!637911) (not e!536185))))

(assert (=> b!952118 (= res!637911 (contains!5208 lt!428885 (select (arr!27684 (_keys!10765 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (=> b!952118 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28165 (_keys!10765 thiss!1141))))))

(declare-fun bm!41541 () Bool)

(assert (=> bm!41541 (= call!41538 (contains!5208 lt!428885 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!952119 () Bool)

(assert (=> b!952119 (= e!536194 e!536184)))

(declare-fun res!637908 () Bool)

(assert (=> b!952119 (= res!637908 call!41538)))

(assert (=> b!952119 (=> (not res!637908) (not e!536184))))

(declare-fun b!952120 () Bool)

(assert (=> b!952120 (= e!536193 (= (apply!878 lt!428885 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!5654 thiss!1141)))))

(declare-fun b!952121 () Bool)

(assert (=> b!952121 (= e!536188 (+!2888 call!41543 (tuple2!13623 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5654 thiss!1141))))))

(declare-fun b!952122 () Bool)

(declare-fun res!637909 () Bool)

(assert (=> b!952122 (=> (not res!637909) (not e!536190))))

(assert (=> b!952122 (= res!637909 e!536183)))

(declare-fun c!99565 () Bool)

(assert (=> b!952122 (= c!99565 (not (= (bvand (extraKeys!5550 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (= (and d!115309 c!99569) b!952121))

(assert (= (and d!115309 (not c!99569)) b!952112))

(assert (= (and b!952112 c!99568) b!952108))

(assert (= (and b!952112 (not c!99568)) b!952116))

(assert (= (and b!952116 c!99564) b!952113))

(assert (= (and b!952116 (not c!99564)) b!952104))

(assert (= (or b!952113 b!952104) bm!41538))

(assert (= (or b!952108 bm!41538) bm!41536))

(assert (= (or b!952108 b!952113) bm!41539))

(assert (= (or b!952121 bm!41536) bm!41540))

(assert (= (or b!952121 bm!41539) bm!41537))

(assert (= (and d!115309 res!637912) b!952105))

(assert (= (and d!115309 c!99566) b!952114))

(assert (= (and d!115309 (not c!99566)) b!952102))

(assert (= (and d!115309 res!637913) b!952106))

(assert (= (and b!952106 res!637915) b!952117))

(assert (= (and b!952106 (not res!637914)) b!952118))

(assert (= (and b!952118 res!637911) b!952107))

(assert (= (and b!952106 res!637907) b!952122))

(assert (= (and b!952122 c!99565) b!952103))

(assert (= (and b!952122 (not c!99565)) b!952115))

(assert (= (and b!952103 res!637910) b!952120))

(assert (= (or b!952103 b!952115) bm!41535))

(assert (= (and b!952122 res!637909) b!952109))

(assert (= (and b!952109 c!99567) b!952119))

(assert (= (and b!952109 (not c!99567)) b!952111))

(assert (= (and b!952119 res!637908) b!952110))

(assert (= (or b!952119 b!952111) bm!41541))

(declare-fun b_lambda!14393 () Bool)

(assert (=> (not b_lambda!14393) (not b!952107)))

(declare-fun t!27710 () Bool)

(declare-fun tb!6197 () Bool)

(assert (=> (and b!951968 (= (defaultEntry!5818 thiss!1141) (defaultEntry!5818 thiss!1141)) t!27710) tb!6197))

(declare-fun result!12329 () Bool)

(assert (=> tb!6197 (= result!12329 tp_is_empty!20791)))

(assert (=> b!952107 t!27710))

(declare-fun b_and!29741 () Bool)

(assert (= b_and!29735 (and (=> t!27710 result!12329) b_and!29741)))

(declare-fun m!883741 () Bool)

(assert (=> b!952121 m!883741))

(declare-fun m!883743 () Bool)

(assert (=> b!952117 m!883743))

(assert (=> b!952117 m!883743))

(declare-fun m!883745 () Bool)

(assert (=> b!952117 m!883745))

(assert (=> d!115309 m!883659))

(declare-fun m!883747 () Bool)

(assert (=> bm!41541 m!883747))

(declare-fun m!883749 () Bool)

(assert (=> b!952120 m!883749))

(assert (=> b!952118 m!883743))

(assert (=> b!952118 m!883743))

(declare-fun m!883751 () Bool)

(assert (=> b!952118 m!883751))

(declare-fun m!883753 () Bool)

(assert (=> b!952110 m!883753))

(declare-fun m!883755 () Bool)

(assert (=> bm!41540 m!883755))

(assert (=> b!952105 m!883743))

(assert (=> b!952105 m!883743))

(assert (=> b!952105 m!883745))

(declare-fun m!883757 () Bool)

(assert (=> b!952114 m!883757))

(declare-fun m!883759 () Bool)

(assert (=> b!952114 m!883759))

(declare-fun m!883761 () Bool)

(assert (=> b!952114 m!883761))

(assert (=> b!952114 m!883757))

(declare-fun m!883763 () Bool)

(assert (=> b!952114 m!883763))

(declare-fun m!883765 () Bool)

(assert (=> b!952114 m!883765))

(declare-fun m!883767 () Bool)

(assert (=> b!952114 m!883767))

(declare-fun m!883769 () Bool)

(assert (=> b!952114 m!883769))

(declare-fun m!883771 () Bool)

(assert (=> b!952114 m!883771))

(assert (=> b!952114 m!883771))

(declare-fun m!883773 () Bool)

(assert (=> b!952114 m!883773))

(declare-fun m!883775 () Bool)

(assert (=> b!952114 m!883775))

(declare-fun m!883777 () Bool)

(assert (=> b!952114 m!883777))

(declare-fun m!883779 () Bool)

(assert (=> b!952114 m!883779))

(declare-fun m!883781 () Bool)

(assert (=> b!952114 m!883781))

(assert (=> b!952114 m!883769))

(declare-fun m!883783 () Bool)

(assert (=> b!952114 m!883783))

(declare-fun m!883785 () Bool)

(assert (=> b!952114 m!883785))

(assert (=> b!952114 m!883743))

(assert (=> b!952114 m!883755))

(assert (=> b!952114 m!883765))

(declare-fun m!883787 () Bool)

(assert (=> bm!41535 m!883787))

(declare-fun m!883789 () Bool)

(assert (=> b!952107 m!883789))

(declare-fun m!883791 () Bool)

(assert (=> b!952107 m!883791))

(declare-fun m!883793 () Bool)

(assert (=> b!952107 m!883793))

(assert (=> b!952107 m!883743))

(assert (=> b!952107 m!883789))

(assert (=> b!952107 m!883791))

(assert (=> b!952107 m!883743))

(declare-fun m!883795 () Bool)

(assert (=> b!952107 m!883795))

(declare-fun m!883797 () Bool)

(assert (=> bm!41537 m!883797))

(assert (=> b!951964 d!115309))

(declare-fun d!115311 () Bool)

(declare-fun res!637922 () Bool)

(declare-fun e!536198 () Bool)

(assert (=> d!115311 (=> (not res!637922) (not e!536198))))

(declare-fun simpleValid!381 (LongMapFixedSize!4978) Bool)

(assert (=> d!115311 (= res!637922 (simpleValid!381 thiss!1141))))

(assert (=> d!115311 (= (valid!1898 thiss!1141) e!536198)))

(declare-fun b!952131 () Bool)

(declare-fun res!637923 () Bool)

(assert (=> b!952131 (=> (not res!637923) (not e!536198))))

(declare-fun arrayCountValidKeys!0 (array!57581 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!952131 (= res!637923 (= (arrayCountValidKeys!0 (_keys!10765 thiss!1141) #b00000000000000000000000000000000 (size!28165 (_keys!10765 thiss!1141))) (_size!2544 thiss!1141)))))

(declare-fun b!952132 () Bool)

(declare-fun res!637924 () Bool)

(assert (=> b!952132 (=> (not res!637924) (not e!536198))))

(assert (=> b!952132 (= res!637924 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10765 thiss!1141) (mask!27653 thiss!1141)))))

(declare-fun b!952133 () Bool)

(declare-datatypes ((List!19365 0))(
  ( (Nil!19362) (Cons!19361 (h!20523 (_ BitVec 64)) (t!27711 List!19365)) )
))
(declare-fun arrayNoDuplicates!0 (array!57581 (_ BitVec 32) List!19365) Bool)

(assert (=> b!952133 (= e!536198 (arrayNoDuplicates!0 (_keys!10765 thiss!1141) #b00000000000000000000000000000000 Nil!19362))))

(assert (= (and d!115311 res!637922) b!952131))

(assert (= (and b!952131 res!637923) b!952132))

(assert (= (and b!952132 res!637924) b!952133))

(declare-fun m!883799 () Bool)

(assert (=> d!115311 m!883799))

(declare-fun m!883801 () Bool)

(assert (=> b!952131 m!883801))

(assert (=> b!952132 m!883647))

(declare-fun m!883803 () Bool)

(assert (=> b!952133 m!883803))

(assert (=> start!81460 d!115311))

(declare-fun d!115313 () Bool)

(declare-fun res!637929 () Bool)

(declare-fun e!536207 () Bool)

(assert (=> d!115313 (=> res!637929 e!536207)))

(assert (=> d!115313 (= res!637929 (bvsge #b00000000000000000000000000000000 (size!28165 (_keys!10765 thiss!1141))))))

(assert (=> d!115313 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10765 thiss!1141) (mask!27653 thiss!1141)) e!536207)))

(declare-fun b!952142 () Bool)

(declare-fun e!536205 () Bool)

(declare-fun e!536206 () Bool)

(assert (=> b!952142 (= e!536205 e!536206)))

(declare-fun lt!428908 () (_ BitVec 64))

(assert (=> b!952142 (= lt!428908 (select (arr!27684 (_keys!10765 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!428906 () Unit!31911)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!57581 (_ BitVec 64) (_ BitVec 32)) Unit!31911)

(assert (=> b!952142 (= lt!428906 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10765 thiss!1141) lt!428908 #b00000000000000000000000000000000))))

(assert (=> b!952142 (arrayContainsKey!0 (_keys!10765 thiss!1141) lt!428908 #b00000000000000000000000000000000)))

(declare-fun lt!428907 () Unit!31911)

(assert (=> b!952142 (= lt!428907 lt!428906)))

(declare-fun res!637930 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!57581 (_ BitVec 32)) SeekEntryResult!9152)

(assert (=> b!952142 (= res!637930 (= (seekEntryOrOpen!0 (select (arr!27684 (_keys!10765 thiss!1141)) #b00000000000000000000000000000000) (_keys!10765 thiss!1141) (mask!27653 thiss!1141)) (Found!9152 #b00000000000000000000000000000000)))))

(assert (=> b!952142 (=> (not res!637930) (not e!536206))))

(declare-fun bm!41544 () Bool)

(declare-fun call!41547 () Bool)

(assert (=> bm!41544 (= call!41547 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!10765 thiss!1141) (mask!27653 thiss!1141)))))

(declare-fun b!952143 () Bool)

(assert (=> b!952143 (= e!536207 e!536205)))

(declare-fun c!99572 () Bool)

(assert (=> b!952143 (= c!99572 (validKeyInArray!0 (select (arr!27684 (_keys!10765 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!952144 () Bool)

(assert (=> b!952144 (= e!536205 call!41547)))

(declare-fun b!952145 () Bool)

(assert (=> b!952145 (= e!536206 call!41547)))

(assert (= (and d!115313 (not res!637929)) b!952143))

(assert (= (and b!952143 c!99572) b!952142))

(assert (= (and b!952143 (not c!99572)) b!952144))

(assert (= (and b!952142 res!637930) b!952145))

(assert (= (or b!952145 b!952144) bm!41544))

(assert (=> b!952142 m!883743))

(declare-fun m!883805 () Bool)

(assert (=> b!952142 m!883805))

(declare-fun m!883807 () Bool)

(assert (=> b!952142 m!883807))

(assert (=> b!952142 m!883743))

(declare-fun m!883809 () Bool)

(assert (=> b!952142 m!883809))

(declare-fun m!883811 () Bool)

(assert (=> bm!41544 m!883811))

(assert (=> b!952143 m!883743))

(assert (=> b!952143 m!883743))

(assert (=> b!952143 m!883745))

(assert (=> b!951969 d!115313))

(declare-fun d!115315 () Bool)

(assert (=> d!115315 (= (array_inv!21544 (_keys!10765 thiss!1141)) (bvsge (size!28165 (_keys!10765 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!951968 d!115315))

(declare-fun d!115317 () Bool)

(assert (=> d!115317 (= (array_inv!21545 (_values!5841 thiss!1141)) (bvsge (size!28164 (_values!5841 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!951968 d!115317))

(declare-fun d!115319 () Bool)

(assert (=> d!115319 (arrayForallSeekEntryOrOpenFound!0 lt!428791 (_keys!10765 thiss!1141) (mask!27653 thiss!1141))))

(declare-fun lt!428911 () Unit!31911)

(declare-fun choose!38 (array!57581 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!31911)

(assert (=> d!115319 (= lt!428911 (choose!38 (_keys!10765 thiss!1141) (mask!27653 thiss!1141) #b00000000000000000000000000000000 lt!428791))))

(assert (=> d!115319 (validMask!0 (mask!27653 thiss!1141))))

(assert (=> d!115319 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (_keys!10765 thiss!1141) (mask!27653 thiss!1141) #b00000000000000000000000000000000 lt!428791) lt!428911)))

(declare-fun bs!26726 () Bool)

(assert (= bs!26726 d!115319))

(assert (=> bs!26726 m!883657))

(declare-fun m!883813 () Bool)

(assert (=> bs!26726 m!883813))

(assert (=> bs!26726 m!883659))

(assert (=> b!951967 d!115319))

(declare-fun d!115321 () Bool)

(declare-fun res!637935 () Bool)

(declare-fun e!536212 () Bool)

(assert (=> d!115321 (=> res!637935 e!536212)))

(assert (=> d!115321 (= res!637935 (= (select (arr!27684 (_keys!10765 thiss!1141)) #b00000000000000000000000000000000) key!756))))

(assert (=> d!115321 (= (arrayContainsKey!0 (_keys!10765 thiss!1141) key!756 #b00000000000000000000000000000000) e!536212)))

(declare-fun b!952150 () Bool)

(declare-fun e!536213 () Bool)

(assert (=> b!952150 (= e!536212 e!536213)))

(declare-fun res!637936 () Bool)

(assert (=> b!952150 (=> (not res!637936) (not e!536213))))

(assert (=> b!952150 (= res!637936 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!28165 (_keys!10765 thiss!1141))))))

(declare-fun b!952151 () Bool)

(assert (=> b!952151 (= e!536213 (arrayContainsKey!0 (_keys!10765 thiss!1141) key!756 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!115321 (not res!637935)) b!952150))

(assert (= (and b!952150 res!637936) b!952151))

(assert (=> d!115321 m!883743))

(declare-fun m!883815 () Bool)

(assert (=> b!952151 m!883815))

(assert (=> b!951967 d!115321))

(declare-fun d!115323 () Bool)

(declare-fun e!536216 () Bool)

(assert (=> d!115323 e!536216))

(declare-fun c!99575 () Bool)

(assert (=> d!115323 (= c!99575 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!428914 () Unit!31911)

(declare-fun choose!1606 (array!57581 array!57579 (_ BitVec 32) (_ BitVec 32) V!32687 V!32687 (_ BitVec 64) Int) Unit!31911)

(assert (=> d!115323 (= lt!428914 (choose!1606 (_keys!10765 thiss!1141) (_values!5841 thiss!1141) (mask!27653 thiss!1141) (extraKeys!5550 thiss!1141) (zeroValue!5654 thiss!1141) (minValue!5654 thiss!1141) key!756 (defaultEntry!5818 thiss!1141)))))

(assert (=> d!115323 (validMask!0 (mask!27653 thiss!1141))))

(assert (=> d!115323 (= (lemmaKeyInListMapIsInArray!315 (_keys!10765 thiss!1141) (_values!5841 thiss!1141) (mask!27653 thiss!1141) (extraKeys!5550 thiss!1141) (zeroValue!5654 thiss!1141) (minValue!5654 thiss!1141) key!756 (defaultEntry!5818 thiss!1141)) lt!428914)))

(declare-fun b!952156 () Bool)

(assert (=> b!952156 (= e!536216 (arrayContainsKey!0 (_keys!10765 thiss!1141) key!756 #b00000000000000000000000000000000))))

(declare-fun b!952157 () Bool)

(assert (=> b!952157 (= e!536216 (ite (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!5550 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5550 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!115323 c!99575) b!952156))

(assert (= (and d!115323 (not c!99575)) b!952157))

(declare-fun m!883817 () Bool)

(assert (=> d!115323 m!883817))

(assert (=> d!115323 m!883659))

(assert (=> b!952156 m!883663))

(assert (=> b!951967 d!115323))

(declare-fun d!115325 () Bool)

(declare-fun lt!428917 () (_ BitVec 32))

(assert (=> d!115325 (and (or (bvslt lt!428917 #b00000000000000000000000000000000) (bvsge lt!428917 (size!28165 (_keys!10765 thiss!1141))) (and (bvsge lt!428917 #b00000000000000000000000000000000) (bvslt lt!428917 (size!28165 (_keys!10765 thiss!1141))))) (bvsge lt!428917 #b00000000000000000000000000000000) (bvslt lt!428917 (size!28165 (_keys!10765 thiss!1141))) (= (select (arr!27684 (_keys!10765 thiss!1141)) lt!428917) key!756))))

(declare-fun e!536219 () (_ BitVec 32))

(assert (=> d!115325 (= lt!428917 e!536219)))

(declare-fun c!99578 () Bool)

(assert (=> d!115325 (= c!99578 (= (select (arr!27684 (_keys!10765 thiss!1141)) #b00000000000000000000000000000000) key!756))))

(assert (=> d!115325 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28165 (_keys!10765 thiss!1141))) (bvslt (size!28165 (_keys!10765 thiss!1141)) #b01111111111111111111111111111111))))

(assert (=> d!115325 (= (arrayScanForKey!0 (_keys!10765 thiss!1141) key!756 #b00000000000000000000000000000000) lt!428917)))

(declare-fun b!952162 () Bool)

(assert (=> b!952162 (= e!536219 #b00000000000000000000000000000000)))

(declare-fun b!952163 () Bool)

(assert (=> b!952163 (= e!536219 (arrayScanForKey!0 (_keys!10765 thiss!1141) key!756 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!115325 c!99578) b!952162))

(assert (= (and d!115325 (not c!99578)) b!952163))

(declare-fun m!883819 () Bool)

(assert (=> d!115325 m!883819))

(assert (=> d!115325 m!883743))

(declare-fun m!883821 () Bool)

(assert (=> b!952163 m!883821))

(assert (=> b!951967 d!115325))

(declare-fun d!115327 () Bool)

(assert (=> d!115327 (= (validMask!0 (mask!27653 thiss!1141)) (and (or (= (mask!27653 thiss!1141) #b00000000000000000000000000000111) (= (mask!27653 thiss!1141) #b00000000000000000000000000001111) (= (mask!27653 thiss!1141) #b00000000000000000000000000011111) (= (mask!27653 thiss!1141) #b00000000000000000000000000111111) (= (mask!27653 thiss!1141) #b00000000000000000000000001111111) (= (mask!27653 thiss!1141) #b00000000000000000000000011111111) (= (mask!27653 thiss!1141) #b00000000000000000000000111111111) (= (mask!27653 thiss!1141) #b00000000000000000000001111111111) (= (mask!27653 thiss!1141) #b00000000000000000000011111111111) (= (mask!27653 thiss!1141) #b00000000000000000000111111111111) (= (mask!27653 thiss!1141) #b00000000000000000001111111111111) (= (mask!27653 thiss!1141) #b00000000000000000011111111111111) (= (mask!27653 thiss!1141) #b00000000000000000111111111111111) (= (mask!27653 thiss!1141) #b00000000000000001111111111111111) (= (mask!27653 thiss!1141) #b00000000000000011111111111111111) (= (mask!27653 thiss!1141) #b00000000000000111111111111111111) (= (mask!27653 thiss!1141) #b00000000000001111111111111111111) (= (mask!27653 thiss!1141) #b00000000000011111111111111111111) (= (mask!27653 thiss!1141) #b00000000000111111111111111111111) (= (mask!27653 thiss!1141) #b00000000001111111111111111111111) (= (mask!27653 thiss!1141) #b00000000011111111111111111111111) (= (mask!27653 thiss!1141) #b00000000111111111111111111111111) (= (mask!27653 thiss!1141) #b00000001111111111111111111111111) (= (mask!27653 thiss!1141) #b00000011111111111111111111111111) (= (mask!27653 thiss!1141) #b00000111111111111111111111111111) (= (mask!27653 thiss!1141) #b00001111111111111111111111111111) (= (mask!27653 thiss!1141) #b00011111111111111111111111111111) (= (mask!27653 thiss!1141) #b00111111111111111111111111111111)) (bvsle (mask!27653 thiss!1141) #b00111111111111111111111111111111)))))

(assert (=> b!951967 d!115327))

(declare-fun d!115329 () Bool)

(declare-fun res!637937 () Bool)

(declare-fun e!536222 () Bool)

(assert (=> d!115329 (=> res!637937 e!536222)))

(assert (=> d!115329 (= res!637937 (bvsge lt!428791 (size!28165 (_keys!10765 thiss!1141))))))

(assert (=> d!115329 (= (arrayForallSeekEntryOrOpenFound!0 lt!428791 (_keys!10765 thiss!1141) (mask!27653 thiss!1141)) e!536222)))

(declare-fun b!952164 () Bool)

(declare-fun e!536220 () Bool)

(declare-fun e!536221 () Bool)

(assert (=> b!952164 (= e!536220 e!536221)))

(declare-fun lt!428920 () (_ BitVec 64))

(assert (=> b!952164 (= lt!428920 (select (arr!27684 (_keys!10765 thiss!1141)) lt!428791))))

(declare-fun lt!428918 () Unit!31911)

(assert (=> b!952164 (= lt!428918 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10765 thiss!1141) lt!428920 lt!428791))))

(assert (=> b!952164 (arrayContainsKey!0 (_keys!10765 thiss!1141) lt!428920 #b00000000000000000000000000000000)))

(declare-fun lt!428919 () Unit!31911)

(assert (=> b!952164 (= lt!428919 lt!428918)))

(declare-fun res!637938 () Bool)

(assert (=> b!952164 (= res!637938 (= (seekEntryOrOpen!0 (select (arr!27684 (_keys!10765 thiss!1141)) lt!428791) (_keys!10765 thiss!1141) (mask!27653 thiss!1141)) (Found!9152 lt!428791)))))

(assert (=> b!952164 (=> (not res!637938) (not e!536221))))

(declare-fun bm!41545 () Bool)

(declare-fun call!41548 () Bool)

(assert (=> bm!41545 (= call!41548 (arrayForallSeekEntryOrOpenFound!0 (bvadd lt!428791 #b00000000000000000000000000000001) (_keys!10765 thiss!1141) (mask!27653 thiss!1141)))))

(declare-fun b!952165 () Bool)

(assert (=> b!952165 (= e!536222 e!536220)))

(declare-fun c!99579 () Bool)

(assert (=> b!952165 (= c!99579 (validKeyInArray!0 (select (arr!27684 (_keys!10765 thiss!1141)) lt!428791)))))

(declare-fun b!952166 () Bool)

(assert (=> b!952166 (= e!536220 call!41548)))

(declare-fun b!952167 () Bool)

(assert (=> b!952167 (= e!536221 call!41548)))

(assert (= (and d!115329 (not res!637937)) b!952165))

(assert (= (and b!952165 c!99579) b!952164))

(assert (= (and b!952165 (not c!99579)) b!952166))

(assert (= (and b!952164 res!637938) b!952167))

(assert (= (or b!952167 b!952166) bm!41545))

(declare-fun m!883823 () Bool)

(assert (=> b!952164 m!883823))

(declare-fun m!883825 () Bool)

(assert (=> b!952164 m!883825))

(declare-fun m!883827 () Bool)

(assert (=> b!952164 m!883827))

(assert (=> b!952164 m!883823))

(declare-fun m!883829 () Bool)

(assert (=> b!952164 m!883829))

(declare-fun m!883831 () Bool)

(assert (=> bm!41545 m!883831))

(assert (=> b!952165 m!883823))

(assert (=> b!952165 m!883823))

(declare-fun m!883833 () Bool)

(assert (=> b!952165 m!883833))

(assert (=> b!951967 d!115329))

(declare-fun b!952175 () Bool)

(declare-fun e!536227 () Bool)

(assert (=> b!952175 (= e!536227 tp_is_empty!20791)))

(declare-fun b!952174 () Bool)

(declare-fun e!536228 () Bool)

(assert (=> b!952174 (= e!536228 tp_is_empty!20791)))

(declare-fun mapIsEmpty!33130 () Bool)

(declare-fun mapRes!33130 () Bool)

(assert (=> mapIsEmpty!33130 mapRes!33130))

(declare-fun mapNonEmpty!33130 () Bool)

(declare-fun tp!63484 () Bool)

(assert (=> mapNonEmpty!33130 (= mapRes!33130 (and tp!63484 e!536228))))

(declare-fun mapValue!33130 () ValueCell!9914)

(declare-fun mapRest!33130 () (Array (_ BitVec 32) ValueCell!9914))

(declare-fun mapKey!33130 () (_ BitVec 32))

(assert (=> mapNonEmpty!33130 (= mapRest!33121 (store mapRest!33130 mapKey!33130 mapValue!33130))))

(declare-fun condMapEmpty!33130 () Bool)

(declare-fun mapDefault!33130 () ValueCell!9914)

(assert (=> mapNonEmpty!33121 (= condMapEmpty!33130 (= mapRest!33121 ((as const (Array (_ BitVec 32) ValueCell!9914)) mapDefault!33130)))))

(assert (=> mapNonEmpty!33121 (= tp!63469 (and e!536227 mapRes!33130))))

(assert (= (and mapNonEmpty!33121 condMapEmpty!33130) mapIsEmpty!33130))

(assert (= (and mapNonEmpty!33121 (not condMapEmpty!33130)) mapNonEmpty!33130))

(assert (= (and mapNonEmpty!33130 ((_ is ValueCellFull!9914) mapValue!33130)) b!952174))

(assert (= (and mapNonEmpty!33121 ((_ is ValueCellFull!9914) mapDefault!33130)) b!952175))

(declare-fun m!883835 () Bool)

(assert (=> mapNonEmpty!33130 m!883835))

(declare-fun b_lambda!14395 () Bool)

(assert (= b_lambda!14393 (or (and b!951968 b_free!18283) b_lambda!14395)))

(check-sat (not d!115319) (not b!952163) (not b!952110) (not d!115311) (not d!115323) (not b!952120) (not b!952156) (not b!952133) (not d!115305) (not b!952151) tp_is_empty!20791 (not d!115309) (not b_next!18283) (not b!952117) (not b_lambda!14395) (not b!952121) (not b!952164) (not b!952059) (not d!115307) (not mapNonEmpty!33130) (not bm!41544) (not b!952107) (not b!952114) (not bm!41535) (not b!952131) (not b!952143) (not b!952165) (not b!952142) (not b!952057) (not bm!41540) (not b!952118) (not bm!41545) (not b!952105) (not bm!41537) b_and!29741 (not b!952049) (not b!952132) (not bm!41541))
(check-sat b_and!29741 (not b_next!18283))
